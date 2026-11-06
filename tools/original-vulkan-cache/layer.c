#define _POSIX_C_SOURCE 200809L
#define VK_NO_PROTOTYPES
#include <vulkan/vulkan.h>
#include <vulkan/vk_layer.h>

#include "cache_store.h"
#include "tracker.h"

#include <errno.h>
#include <inttypes.h>
#include <pthread.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

enum { FIRST_CHECKPOINT_SECONDS = 2, CHECKPOINT_INTERVAL_SECONDS = 30 };

typedef struct InstanceState {
    void *dispatch_key;
    VkInstance instance;
    PFN_vkGetInstanceProcAddr gipa;
    PFN_GetPhysicalDeviceProcAddr phys_gpa;
    PFN_vkDestroyInstance destroy;
    struct InstanceState *next;
} InstanceState;

typedef struct DeviceState {
    VkDevice device;
    void *dispatch_key;
    PFN_vkGetDeviceProcAddr gdpa;
    PFN_vkDestroyDevice destroy;
    PFN_vkCreateGraphicsPipelines graphics;
    PFN_vkCreateComputePipelines compute;
    PFN_vkCreatePipelineCache create_cache;
    PFN_vkDestroyPipelineCache destroy_cache;
    PFN_vkGetPipelineCacheData cache_data;
    VkPhysicalDeviceProperties properties;
    pthread_mutex_t cache_lock;
    pthread_cond_t checkpoint_wake;
    pthread_t checkpoint_thread;
    bool cache_lock_ready;
    bool cache_attempted;
    bool checkpoint_ready;
    bool checkpoint_started;
    bool checkpoint_stop;
    bool trace;
    VkPipelineCache cache;
    size_t redirected;
    size_t saved_redirected;
    struct DeviceState *next;
} DeviceState;

static pthread_mutex_t state_lock = PTHREAD_MUTEX_INITIALIZER;
static InstanceState *instances;
static DeviceState *devices;

/* Vulkan's loader gives VkInstance and its VkPhysicalDevices the same dispatch table. */
static void *dispatch_key(const void *handle) {
    void *key;
    memcpy(&key, handle, sizeof key);
    return key;
}

static InstanceState *instance_state(const void *handle, bool remove) {
    if (!handle) {
        return NULL;
    }
    void *key = dispatch_key(handle);
    pthread_mutex_lock(&state_lock);
    InstanceState **entry = &instances;
    while (*entry && (*entry)->dispatch_key != key) {
        entry = &(*entry)->next;
    }
    InstanceState *state = *entry;
    if (state && remove) {
        *entry = state->next;
    }
    pthread_mutex_unlock(&state_lock);
    return state;
}

static DeviceState *device_state(VkDevice device, bool remove) {
    pthread_mutex_lock(&state_lock);
    DeviceState **entry = &devices;
    while (*entry && (*entry)->device != device) {
        entry = &(*entry)->next;
    }
    DeviceState *state = *entry;
    if (state && remove) {
        *entry = state->next;
    }
    pthread_mutex_unlock(&state_lock);
    return state;
}

static PFN_vkVoidFunction azs_track_device_next(const void *handle, const char *name) {
    if (!handle) {
        return NULL;
    }
    void *key = dispatch_key(handle);
    pthread_mutex_lock(&state_lock);
    DeviceState *state = devices;
    while (state && state->dispatch_key != key) {
        state = state->next;
    }
    pthread_mutex_unlock(&state_lock);
    return state ? state->gdpa(state->device, name) : NULL;
}

static PFN_vkVoidFunction azs_track_instance_next(const void *handle, const char *name) {
    InstanceState *state = instance_state(handle, false);
    if (!state) {
        return NULL;
    }
    PFN_vkVoidFunction proc = state->gipa(state->instance, name);
    return proc || !state->phys_gpa ? proc : state->phys_gpa(state->instance, name);
}

#include "tracker-generated.inc"

static VKAPI_ATTR VkResult VKAPI_CALL layer_create_instance(
    const VkInstanceCreateInfo *info, const VkAllocationCallbacks *allocator, VkInstance *instance
) {
    for (const VkBaseInStructure *item = info->pNext; item; item = item->pNext) {
        if (item->sType != VK_STRUCTURE_TYPE_LOADER_INSTANCE_CREATE_INFO) {
            continue;
        }
        VkLayerInstanceCreateInfo *chain = (VkLayerInstanceCreateInfo *)item;
        if (chain->function != VK_LAYER_LINK_INFO || !chain->u.pLayerInfo) {
            continue;
        }
        VkLayerInstanceLink *link = chain->u.pLayerInfo;
        PFN_vkCreateInstance create = (PFN_vkCreateInstance)link->pfnNextGetInstanceProcAddr(
            VK_NULL_HANDLE, "vkCreateInstance"
        );
        if (!create) {
            return VK_ERROR_INITIALIZATION_FAILED;
        }
        InstanceState *state = calloc(1, sizeof *state);
        if (!state) {
            return VK_ERROR_OUT_OF_HOST_MEMORY;
        }
        state->gipa = link->pfnNextGetInstanceProcAddr;
        state->phys_gpa = link->pfnNextGetPhysicalDeviceProcAddr;
        chain->u.pLayerInfo = link->pNext;
        AzsTrackEvent event;
        azs_track_begin(&event, "vkCreateInstance", true);
        azs_track_describe(&event, "pCreateInfo", "VkInstanceCreateInfo", info, 1);
        VkResult result = create(info, allocator, instance);
        azs_trackf(&event, "\tresult=%d", result);
        if (result == VK_SUCCESS) {
            azs_trackf(&event, "\tpInstance=0x%" PRIxPTR, (uintptr_t)*instance);
        }
        azs_track_end(&event, false);
        if (result != VK_SUCCESS) {
            free(state);
            return result;
        }
        state->instance = *instance;
        state->dispatch_key = dispatch_key(*instance);
        state->destroy = (PFN_vkDestroyInstance)state->gipa(*instance, "vkDestroyInstance");
        pthread_mutex_lock(&state_lock);
        state->next = instances;
        instances = state;
        pthread_mutex_unlock(&state_lock);
        return VK_SUCCESS;
    }
    return VK_ERROR_INITIALIZATION_FAILED;
}

static VKAPI_ATTR void VKAPI_CALL layer_destroy_instance(
    VkInstance instance, const VkAllocationCallbacks *allocator
) {
    InstanceState *state = instance_state(instance, true);
    if (state) {
        AzsTrackEvent event;
        azs_track_begin(&event, "vkDestroyInstance", true);
        azs_trackf(&event, "\tinstance=0x%" PRIxPTR, (uintptr_t)instance);
        state->destroy(instance, allocator);
        azs_track_end(&event, false);
        free(state);
    }
}

static VkLayerDeviceCreateInfo *device_link(const VkDeviceCreateInfo *info, bool *device_group) {
    VkLayerDeviceCreateInfo *link = NULL;
    for (const VkBaseInStructure *item = info->pNext; item; item = item->pNext) {
        if (item->sType == VK_STRUCTURE_TYPE_LOADER_DEVICE_CREATE_INFO) {
            VkLayerDeviceCreateInfo *chain = (VkLayerDeviceCreateInfo *)item;
            if (chain->function == VK_LAYER_LINK_INFO && chain->u.pLayerInfo) {
                link = chain;
            }
        }
        if (item->sType == VK_STRUCTURE_TYPE_DEVICE_GROUP_DEVICE_CREATE_INFO) {
            const VkDeviceGroupDeviceCreateInfo *group = (const VkDeviceGroupDeviceCreateInfo *)item;
            *device_group = group->physicalDeviceCount > 1;
        }
    }
    return link;
}

static VKAPI_ATTR VkResult VKAPI_CALL layer_create_device(
    VkPhysicalDevice physical_device, const VkDeviceCreateInfo *info,
    const VkAllocationCallbacks *allocator, VkDevice *device
) {
    InstanceState *instance = instance_state(physical_device, false);
    bool device_group = false;
    VkLayerDeviceCreateInfo *chain = device_link(info, &device_group);
    if (!instance || !chain) {
        return VK_ERROR_INITIALIZATION_FAILED;
    }
    VkLayerDeviceLink *link = chain->u.pLayerInfo;
    PFN_vkGetInstanceProcAddr gipa = link->pfnNextGetInstanceProcAddr;
    PFN_vkCreateDevice create = (PFN_vkCreateDevice)gipa(instance->instance, "vkCreateDevice");
    if (!create) {
        return VK_ERROR_INITIALIZATION_FAILED;
    }
    DeviceState *state = calloc(1, sizeof *state);
    if (!state) {
        return VK_ERROR_OUT_OF_HOST_MEMORY;
    }
    state->gdpa = link->pfnNextGetDeviceProcAddr;
    chain->u.pLayerInfo = link->pNext;
    AzsTrackEvent event;
    azs_track_begin(&event, "vkCreateDevice", true);
    azs_trackf(&event, "\tphysicalDevice=0x%" PRIxPTR, (uintptr_t)physical_device);
    azs_track_describe(&event, "pCreateInfo", "VkDeviceCreateInfo", info, 1);
    VkResult result = create(physical_device, info, allocator, device);
    azs_trackf(&event, "\tresult=%d", result);
    if (result == VK_SUCCESS) {
        azs_trackf(&event, "\tpDevice=0x%" PRIxPTR, (uintptr_t)*device);
    }
    azs_track_end(&event, false);
    if (result != VK_SUCCESS) {
        free(state);
        return result;
    }

    state->device = *device;
    state->dispatch_key = dispatch_key(*device);
    state->destroy = (PFN_vkDestroyDevice)state->gdpa(*device, "vkDestroyDevice");
    state->graphics = (PFN_vkCreateGraphicsPipelines)state->gdpa(*device, "vkCreateGraphicsPipelines");
    state->compute = (PFN_vkCreateComputePipelines)state->gdpa(*device, "vkCreateComputePipelines");

    const char *trace = getenv("AZS_VK_CACHE_TRACE");
    state->trace = trace && strcmp(trace, "1") == 0;

    if (!device_group && azs_cache_enabled()) {
        PFN_vkGetPhysicalDeviceProperties get_properties = (PFN_vkGetPhysicalDeviceProperties)
            instance->gipa(instance->instance, "vkGetPhysicalDeviceProperties");
        state->create_cache = (PFN_vkCreatePipelineCache)state->gdpa(*device, "vkCreatePipelineCache");
        state->destroy_cache = (PFN_vkDestroyPipelineCache)state->gdpa(*device, "vkDestroyPipelineCache");
        state->cache_data = (PFN_vkGetPipelineCacheData)state->gdpa(*device, "vkGetPipelineCacheData");
        if (get_properties && state->create_cache && state->destroy_cache && state->cache_data) {
            get_properties(physical_device, &state->properties);
            state->cache_lock_ready = pthread_mutex_init(&state->cache_lock, NULL) == 0;
            state->checkpoint_ready = state->cache_lock_ready &&
                pthread_cond_init(&state->checkpoint_wake, NULL) == 0;
        }
    }
    if (state->trace) {
        const char *status = "unavailable";
        if (state->cache_lock_ready) {
            status = state->checkpoint_ready ? "live checkpoints enabled" : "teardown save only";
        }
        fprintf(stderr, "[azs-vk-cache] device cache %s\n", status);
    }

    pthread_mutex_lock(&state_lock);
    state->next = devices;
    devices = state;
    pthread_mutex_unlock(&state_lock);
    return VK_SUCCESS;
}

static void create_cache(DeviceState *state) {
    size_t size = 0;
    unsigned char *data = azs_cache_read(&state->properties, &size);
    VkPipelineCacheCreateInfo info = {
        .sType = VK_STRUCTURE_TYPE_PIPELINE_CACHE_CREATE_INFO,
        .initialDataSize = data ? size : 0,
        .pInitialData = data,
    };
    VkResult result = state->create_cache(state->device, &info, NULL, &state->cache);
    free(data);
    if (result != VK_SUCCESS && info.initialDataSize) {
        if (state->trace) {
            fprintf(stderr, "[azs-vk-cache] driver rejected %zu cached bytes (%d); retrying empty\n",
                    size, result);
        }
        info.initialDataSize = 0;
        info.pInitialData = NULL;
        result = state->create_cache(state->device, &info, NULL, &state->cache);
    }
    if (result != VK_SUCCESS) {
        state->cache = VK_NULL_HANDLE;
        if (state->trace) {
            fprintf(stderr, "[azs-vk-cache] pipeline cache unavailable (%d); forwarding unchanged\n",
                    result);
        }
    } else if (state->trace) {
        fprintf(stderr, "[azs-vk-cache] created cache with %zu bytes of initial data\n",
                info.initialDataSize);
    }
}

static bool borrow_cache(DeviceState *state, VkPipelineCache *cache) {
    /* MoltenVK may compile under a cache-wide driver lock. A worker that arrives
     * while the layer cache is busy keeps the original uncached parallel path. */
    if (*cache != VK_NULL_HANDLE || !state->cache_lock_ready ||
        pthread_mutex_trylock(&state->cache_lock) != 0) {
        return false;
    }
    if (!state->cache_attempted) {
        state->cache_attempted = true;
        create_cache(state);
    }
    if (state->cache == VK_NULL_HANDLE) {
        pthread_mutex_unlock(&state->cache_lock);
        return false;
    }
    *cache = state->cache;
    return true;
}

/* The caller holds cache_lock. Only the snapshot needs it, so pipeline creation
 * can use the cache again while the worker writes the file. */
static void save_pending_cache(DeviceState *state) {
    size_t redirected = state->redirected;
    if (redirected == state->saved_redirected) {
        return;
    }
    size_t size = 0;
    VkResult result = state->cache_data(state->device, state->cache, &size, NULL);
    if (result != VK_SUCCESS || size == 0 || size > AZS_CACHE_MAX_SIZE) {
        if (state->trace) {
            fprintf(stderr, "[azs-vk-cache] snapshot size query yielded %zu bytes (%d), limit %u\n",
                    size, result, AZS_CACHE_MAX_SIZE);
        }
        return;
    }
    unsigned char *data = malloc(size);
    if (!data) {
        if (state->trace) {
            fprintf(stderr, "[azs-vk-cache] cannot allocate %zu bytes for snapshot\n", size);
        }
        return;
    }
    result = state->cache_data(state->device, state->cache, &size, data);
    if (result != VK_SUCCESS) {
        if (state->trace) {
            fprintf(stderr, "[azs-vk-cache] snapshot data query yielded %zu bytes (%d)\n",
                    size, result);
        }
        free(data);
        return;
    }

    pthread_mutex_unlock(&state->cache_lock);
    bool saved = azs_cache_write(&state->properties, data, size);
    free(data);
    pthread_mutex_lock(&state->cache_lock);
    if (saved) {
        state->saved_redirected = redirected;
        if (state->trace) {
            fprintf(stderr, "[azs-vk-cache] checkpoint saved after %zu null-cache calls\n", redirected);
        }
    }
}

static bool wait_for_checkpoint(DeviceState *state, time_t seconds) {
    struct timespec deadline;
    if (clock_gettime(CLOCK_REALTIME, &deadline) != 0) {
        if (state->trace) {
            fprintf(stderr, "[azs-vk-cache] cannot schedule checkpoint (%d)\n", errno);
        }
        return false;
    }
    deadline.tv_sec += seconds;
    while (!state->checkpoint_stop) {
        int result = pthread_cond_timedwait(&state->checkpoint_wake, &state->cache_lock, &deadline);
        if (result == ETIMEDOUT) {
            return !state->checkpoint_stop;
        }
        if (result != 0) {
            if (state->trace) {
                fprintf(stderr, "[azs-vk-cache] checkpoint wait failed (%d)\n", result);
            }
            return false;
        }
    }
    return false;
}

static void *checkpoint_cache(void *argument) {
    DeviceState *state = argument;
    pthread_mutex_lock(&state->cache_lock);
    time_t delay = FIRST_CHECKPOINT_SECONDS;
    while (!state->checkpoint_stop && wait_for_checkpoint(state, delay)) {
        save_pending_cache(state);
        delay = CHECKPOINT_INTERVAL_SECONDS;
    }
    pthread_mutex_unlock(&state->cache_lock);
    return NULL;
}

static void release_cache(DeviceState *state) {
    ++state->redirected;
    if (state->checkpoint_ready && state->redirected == 1) {
        int result = pthread_create(&state->checkpoint_thread, NULL, checkpoint_cache, state);
        state->checkpoint_started = result == 0;
        if (!state->checkpoint_started && state->trace) {
            fprintf(stderr, "[azs-vk-cache] cannot start checkpoint worker (%d)\n", result);
        }
    }
    pthread_mutex_unlock(&state->cache_lock);
}

static void finish_cache(DeviceState *state) {
    if (state->checkpoint_started) {
        pthread_mutex_lock(&state->cache_lock);
        state->checkpoint_stop = true;
        pthread_cond_signal(&state->checkpoint_wake);
        pthread_mutex_unlock(&state->cache_lock);
        pthread_join(state->checkpoint_thread, NULL);
    }
    if (state->cache != VK_NULL_HANDLE) {
        pthread_mutex_lock(&state->cache_lock);
        save_pending_cache(state);
        pthread_mutex_unlock(&state->cache_lock);
        state->destroy_cache(state->device, state->cache, NULL);
    }
    if (state->checkpoint_ready) {
        pthread_cond_destroy(&state->checkpoint_wake);
    }
}

static VKAPI_ATTR void VKAPI_CALL layer_destroy_device(
    VkDevice device, const VkAllocationCallbacks *allocator
) {
    DeviceState *state = device_state(device, true);
    if (!state) {
        return;
    }
    /* vkDestroyDevice requires the caller to synchronize access to the device. */
    finish_cache(state);
    if (state->trace) {
        fprintf(stderr, "[azs-vk-cache] device destroyed; %zu null-cache calls redirected\n",
                state->redirected);
    }
    if (state->cache_lock_ready) {
        pthread_mutex_destroy(&state->cache_lock);
    }
    AzsTrackEvent event;
    azs_track_begin(&event, "vkDestroyDevice", true);
    azs_trackf(&event, "\tdevice=0x%" PRIxPTR, (uintptr_t)device);
    state->destroy(device, allocator);
    azs_track_end(&event, false);
    free(state);
}

static void track_pipeline_result(AzsTrackEvent *event, VkResult result, uint32_t count,
                                  const VkPipeline *pipelines) {
    azs_trackf(event, "\tresult=%d", result);
    if (event->active && result == VK_SUCCESS) {
        for (uint32_t i = 0; i < count && i < 32; ++i) {
            azs_trackf(event, "\tpPipelines[%u]=0x%" PRIxPTR, i, (uintptr_t)pipelines[i]);
        }
        if (count > 32) {
            event->truncated = true;
        }
    }
    azs_track_end(event, false);
}

static VKAPI_ATTR VkResult VKAPI_CALL layer_create_graphics_pipelines(
    VkDevice device, VkPipelineCache cache, uint32_t count, const VkGraphicsPipelineCreateInfo *info,
    const VkAllocationCallbacks *allocator, VkPipeline *pipelines
) {
    DeviceState *state = device_state(device, false);
    if (!state) {
        return VK_ERROR_INITIALIZATION_FAILED;
    }
    AzsTrackEvent event;
    azs_track_begin(&event, "vkCreateGraphicsPipelines", true);
    azs_trackf(&event, "\tdevice=0x%" PRIxPTR "\tpipelineCache=0x%" PRIxPTR "\tcreateInfoCount=%u",
               (uintptr_t)device, (uintptr_t)cache, count);
    azs_track_describe(&event, "pCreateInfos", "VkGraphicsPipelineCreateInfo", info, count);
    bool borrowed = borrow_cache(state, &cache);
    VkResult result = state->graphics(device, cache, count, info, allocator, pipelines);
    if (borrowed) {
        release_cache(state);
    }
    track_pipeline_result(&event, result, count, pipelines);
    return result;
}

static VKAPI_ATTR VkResult VKAPI_CALL layer_create_compute_pipelines(
    VkDevice device, VkPipelineCache cache, uint32_t count, const VkComputePipelineCreateInfo *info,
    const VkAllocationCallbacks *allocator, VkPipeline *pipelines
) {
    DeviceState *state = device_state(device, false);
    if (!state) {
        return VK_ERROR_INITIALIZATION_FAILED;
    }
    AzsTrackEvent event;
    azs_track_begin(&event, "vkCreateComputePipelines", true);
    azs_trackf(&event, "\tdevice=0x%" PRIxPTR "\tpipelineCache=0x%" PRIxPTR "\tcreateInfoCount=%u",
               (uintptr_t)device, (uintptr_t)cache, count);
    azs_track_describe(&event, "pCreateInfos", "VkComputePipelineCreateInfo", info, count);
    bool borrowed = borrow_cache(state, &cache);
    VkResult result = state->compute(device, cache, count, info, allocator, pipelines);
    if (borrowed) {
        release_cache(state);
    }
    track_pipeline_result(&event, result, count, pipelines);
    return result;
}

static VKAPI_ATTR PFN_vkVoidFunction VKAPI_CALL layer_get_device_proc_addr(
    VkDevice device, const char *name
) {
    if (!device || !name) {
        return NULL;
    }
    if (strcmp(name, "vkGetDeviceProcAddr") == 0) {
        return (PFN_vkVoidFunction)layer_get_device_proc_addr;
    }
    if (strcmp(name, "vkDestroyDevice") == 0) {
        return (PFN_vkVoidFunction)layer_destroy_device;
    }
    if (strcmp(name, "vkCreateGraphicsPipelines") == 0) {
        return (PFN_vkVoidFunction)layer_create_graphics_pipelines;
    }
    if (strcmp(name, "vkCreateComputePipelines") == 0) {
        return (PFN_vkVoidFunction)layer_create_compute_pipelines;
    }
    DeviceState *state = device_state(device, false);
    PFN_vkVoidFunction next = state ? state->gdpa(device, name) : NULL;
    if (next && azs_tracker_enabled()) {
        PFN_vkVoidFunction tracked = azs_track_lookup(name, true);
        if (tracked) {
            return tracked;
        }
    }
    return next;
}

static VKAPI_ATTR PFN_vkVoidFunction VKAPI_CALL layer_get_instance_proc_addr(
    VkInstance instance, const char *name
) {
    if (!name) {
        return NULL;
    }
    if (strcmp(name, "vkGetInstanceProcAddr") == 0) {
        return (PFN_vkVoidFunction)layer_get_instance_proc_addr;
    }
    if (strcmp(name, "vkCreateInstance") == 0) {
        return (PFN_vkVoidFunction)layer_create_instance;
    }
    if (!instance) {
        return NULL;
    }
    if (strcmp(name, "vkDestroyInstance") == 0) {
        return (PFN_vkVoidFunction)layer_destroy_instance;
    }
    if (strcmp(name, "vkCreateDevice") == 0) {
        return (PFN_vkVoidFunction)layer_create_device;
    }
    if (strcmp(name, "vkGetDeviceProcAddr") == 0) {
        return (PFN_vkVoidFunction)layer_get_device_proc_addr;
    }
    if (strcmp(name, "vkDestroyDevice") == 0) {
        return (PFN_vkVoidFunction)layer_destroy_device;
    }
    if (strcmp(name, "vkCreateGraphicsPipelines") == 0) {
        return (PFN_vkVoidFunction)layer_create_graphics_pipelines;
    }
    if (strcmp(name, "vkCreateComputePipelines") == 0) {
        return (PFN_vkVoidFunction)layer_create_compute_pipelines;
    }
    InstanceState *state = instance_state(instance, false);
    PFN_vkVoidFunction next = state ? state->gipa(instance, name) : NULL;
    if (next && azs_tracker_enabled()) {
        PFN_vkVoidFunction tracked = azs_track_lookup(name, false);
        if (!tracked) {
            tracked = azs_track_lookup(name, true);
        }
        if (tracked) {
            return tracked;
        }
    }
    return next;
}

static VKAPI_ATTR PFN_vkVoidFunction VKAPI_CALL layer_get_physical_device_proc_addr(
    VkInstance instance, const char *name
) {
    if (!instance || !name) {
        return NULL;
    }
    InstanceState *state = instance_state(instance, false);
    PFN_vkVoidFunction next = state && state->phys_gpa ? state->phys_gpa(instance, name) : NULL;
    if (next && azs_tracker_enabled()) {
        PFN_vkVoidFunction tracked = azs_track_lookup(name, false);
        if (tracked) {
            return tracked;
        }
    }
    return next;
}

__attribute__((visibility("default")))
VKAPI_ATTR VkResult VKAPI_CALL vkNegotiateLoaderLayerInterfaceVersion(VkNegotiateLayerInterface *info) {
    if (!info || info->sType != LAYER_NEGOTIATE_INTERFACE_STRUCT ||
        info->loaderLayerInterfaceVersion < 2) {
        return VK_ERROR_INITIALIZATION_FAILED;
    }
    info->loaderLayerInterfaceVersion = 2;
    info->pfnGetInstanceProcAddr = layer_get_instance_proc_addr;
    info->pfnGetDeviceProcAddr = layer_get_device_proc_addr;
    info->pfnGetPhysicalDeviceProcAddr = layer_get_physical_device_proc_addr;
    return VK_SUCCESS;
}
