/* Headless smoke test for the native Vulkan loader and the pipeline cache layer. */
#define _POSIX_C_SOURCE 200809L
#ifndef VK_NO_PROTOTYPES
#define VK_NO_PROTOTYPES
#endif
#include <vulkan/vulkan.h>

#include <dirent.h>
#include <dlfcn.h>
#include <errno.h>
#include <fcntl.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <time.h>

static bool check(VkResult result, const char *operation) {
    if (result == VK_SUCCESS) {
        return true;
    }
    fprintf(stderr, "%s returned VkResult %d\n", operation, (int)result);
    return false;
}

static bool has_extension(const VkExtensionProperties *extensions, uint32_t count,
                          const char *name) {
    for (uint32_t i = 0; i < count; ++i) {
        if (strcmp(extensions[i].extensionName, name) == 0) {
            return true;
        }
    }
    return false;
}

static VkInstance make_instance(PFN_vkGetInstanceProcAddr get_instance_proc_addr) {
    PFN_vkEnumerateInstanceExtensionProperties enumerate =
        (PFN_vkEnumerateInstanceExtensionProperties)get_instance_proc_addr(
            VK_NULL_HANDLE, "vkEnumerateInstanceExtensionProperties");
    PFN_vkCreateInstance create_instance =
        (PFN_vkCreateInstance)get_instance_proc_addr(VK_NULL_HANDLE, "vkCreateInstance");
    if (!enumerate || !create_instance) {
        fputs("Vulkan loader lacks the instance creation functions\n", stderr);
        return VK_NULL_HANDLE;
    }

    uint32_t count = 0;
    if (!check(enumerate(NULL, &count, NULL), "count instance extensions")) {
        return VK_NULL_HANDLE;
    }
    bool portability = false;
    if (count != 0) {
        VkExtensionProperties *extensions = calloc(count, sizeof(*extensions));
        if (!extensions) {
            fputs("cannot allocate instance extensions\n", stderr);
            return VK_NULL_HANDLE;
        }
        const bool enumerated =
            check(enumerate(NULL, &count, extensions), "enumerate instance extensions");
        portability = enumerated &&
                      has_extension(extensions, count, VK_KHR_PORTABILITY_ENUMERATION_EXTENSION_NAME);
        free(extensions);
        if (!enumerated) {
            return VK_NULL_HANDLE;
        }
    }

    const char *portability_name = VK_KHR_PORTABILITY_ENUMERATION_EXTENSION_NAME;
    const VkApplicationInfo application = {
        .sType = VK_STRUCTURE_TYPE_APPLICATION_INFO,
        .pApplicationName = "AZS pipeline cache smoke test",
        .apiVersion = VK_API_VERSION_1_1,
    };
    const VkInstanceCreateInfo create_info = {
        .sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO,
        .flags = portability ? VK_INSTANCE_CREATE_ENUMERATE_PORTABILITY_BIT_KHR : 0,
        .pApplicationInfo = &application,
        .enabledExtensionCount = portability ? 1 : 0,
        .ppEnabledExtensionNames = portability ? &portability_name : NULL,
    };
    VkInstance instance = VK_NULL_HANDLE;
    return check(create_instance(&create_info, NULL, &instance), "create instance")
               ? instance
               : VK_NULL_HANDLE;
}

static bool find_graphics_compute_queue(PFN_vkEnumeratePhysicalDevices enumerate,
                                        PFN_vkGetPhysicalDeviceQueueFamilyProperties get_queues,
                                        VkInstance instance, VkPhysicalDevice *physical_device,
                                        uint32_t *queue_family) {
    uint32_t count = 0;
    if (!check(enumerate(instance, &count, NULL), "count physical devices") || count == 0) {
        fputs("no Vulkan physical device available\n", stderr);
        return false;
    }
    VkPhysicalDevice *devices = calloc(count, sizeof(*devices));
    if (!devices) {
        fputs("cannot allocate physical devices\n", stderr);
        return false;
    }
    if (!check(enumerate(instance, &count, devices), "enumerate physical devices")) {
        free(devices);
        return false;
    }

    bool found = false;
    const VkQueueFlags required = VK_QUEUE_GRAPHICS_BIT | VK_QUEUE_COMPUTE_BIT;
    for (uint32_t i = 0; i < count && !found; ++i) {
        uint32_t queue_count = 0;
        get_queues(devices[i], &queue_count, NULL);
        if (queue_count == 0) {
            continue;
        }
        VkQueueFamilyProperties *queues = calloc(queue_count, sizeof(*queues));
        if (!queues) {
            fputs("cannot allocate queue family properties\n", stderr);
            break;
        }
        get_queues(devices[i], &queue_count, queues);
        for (uint32_t j = 0; j < queue_count; ++j) {
            if (queues[j].queueCount && (queues[j].queueFlags & required) == required) {
                *physical_device = devices[i];
                *queue_family = j;
                found = true;
                break;
            }
        }
        free(queues);
    }
    free(devices);
    if (!found) {
        fputs("no Vulkan graphics and compute queue available\n", stderr);
    }
    return found;
}

#define LOAD_DEVICE(name) PFN_##name name = (PFN_##name)get_device_proc_addr(device, #name)

static bool smoke_graphics_pipeline(VkDevice device, PFN_vkGetDeviceProcAddr get_device_proc_addr,
                                    VkPipelineLayout layout) {
    LOAD_DEVICE(vkCreateShaderModule);
    LOAD_DEVICE(vkDestroyShaderModule);
    LOAD_DEVICE(vkCreateRenderPass);
    LOAD_DEVICE(vkDestroyRenderPass);
    LOAD_DEVICE(vkCreateGraphicsPipelines);
    LOAD_DEVICE(vkDestroyPipeline);
    if (!vkCreateShaderModule || !vkDestroyShaderModule || !vkCreateRenderPass ||
        !vkDestroyRenderPass || !vkCreateGraphicsPipelines || !vkDestroyPipeline) {
        fputs("Vulkan device lacks the graphics pipeline smoke-test functions\n", stderr);
        return false;
    }

    /* SPIR-V 1.0 vertex entry point main writes a constant homogeneous position. */
    static const uint32_t shader_code[] = {
        0x07230203, 0x00010000, 0, 12, 0,               /* SPIR-V header */
        0x00020011, 1,                                   /* OpCapability Shader */
        0x0003000e, 0, 1,                                /* OpMemoryModel Logical GLSL450 */
        0x0006000f, 0, 3, 0x6e69616d, 0, 8,               /* OpEntryPoint Vertex %3 "main" %8 */
        0x00040047, 8, 11, 0,                             /* OpDecorate %8 BuiltIn Position */
        0x00020013, 1,                                   /* %1 = OpTypeVoid */
        0x00030021, 2, 1,                                /* %2 = OpTypeFunction %1 */
        0x00030016, 5, 32,                               /* %5 = OpTypeFloat 32 */
        0x00040017, 6, 5, 4,                             /* %6 = OpTypeVector %5 4 */
        0x00040020, 7, 3, 6,                             /* %7 = OpTypePointer Output %6 */
        0x0004003b, 7, 8, 3,                             /* %8 = OpVariable %7 Output */
        0x0004002b, 5, 9, 0,                             /* %9 = OpConstant %5 0.0 */
        0x0004002b, 5, 10, 0x3f800000,                    /* %10 = OpConstant %5 1.0 */
        0x0007002c, 6, 11, 9, 9, 9, 10,                  /* %11 = OpConstantComposite %6 %9 %9 %9 %10 */
        0x00050036, 1, 3, 0, 2,                          /* %3 = OpFunction %1 None %2 */
        0x000200f8, 4,                                   /* %4 = OpLabel */
        0x0003003e, 8, 11,                               /* OpStore %8 %11 */
        0x000100fd,                                      /* OpReturn */
        0x00010038,                                      /* OpFunctionEnd */
    };
    const VkShaderModuleCreateInfo shader_info = {
        .sType = VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO,
        .codeSize = sizeof(shader_code),
        .pCode = shader_code,
    };
    const VkSubpassDescription subpass = {
        .pipelineBindPoint = VK_PIPELINE_BIND_POINT_GRAPHICS,
    };
    const VkRenderPassCreateInfo render_pass_info = {
        .sType = VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO,
        .subpassCount = 1,
        .pSubpasses = &subpass,
    };

    VkShaderModule shader = VK_NULL_HANDLE;
    VkRenderPass render_pass = VK_NULL_HANDLE;
    VkPipeline pipeline = VK_NULL_HANDLE;
    bool success = false;

    if (!check(vkCreateShaderModule(device, &shader_info, NULL, &shader), "create vertex shader") ||
        !check(vkCreateRenderPass(device, &render_pass_info, NULL, &render_pass),
               "create attachmentless render pass")) {
        goto cleanup;
    }

    const VkPipelineShaderStageCreateInfo stage = {
        .sType = VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO,
        .stage = VK_SHADER_STAGE_VERTEX_BIT,
        .module = shader,
        .pName = "main",
    };
    const VkPipelineVertexInputStateCreateInfo vertex_input = {
        .sType = VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO,
    };
    const VkPipelineInputAssemblyStateCreateInfo input_assembly = {
        .sType = VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO,
        .topology = VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST,
    };
    const VkViewport viewport = {.width = 1, .height = 1, .maxDepth = 1};
    const VkRect2D scissor = {.extent = {.width = 1, .height = 1}};
    const VkPipelineViewportStateCreateInfo viewport_state = {
        .sType = VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO,
        .viewportCount = 1,
        .pViewports = &viewport,
        .scissorCount = 1,
        .pScissors = &scissor,
    };
    const VkPipelineRasterizationStateCreateInfo rasterization = {
        .sType = VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO,
        .rasterizerDiscardEnable = VK_TRUE,
        .polygonMode = VK_POLYGON_MODE_FILL,
        .lineWidth = 1.0f,
    };
    const VkPipelineMultisampleStateCreateInfo multisample = {
        .sType = VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO,
        .rasterizationSamples = VK_SAMPLE_COUNT_1_BIT,
    };
    const VkGraphicsPipelineCreateInfo pipeline_info = {
        .sType = VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO,
        .stageCount = 1,
        .pStages = &stage,
        .pVertexInputState = &vertex_input,
        .pInputAssemblyState = &input_assembly,
        .pViewportState = &viewport_state,
        .pRasterizationState = &rasterization,
        .pMultisampleState = &multisample,
        .layout = layout,
        .renderPass = render_pass,
    };
    success = check(vkCreateGraphicsPipelines(device, VK_NULL_HANDLE, 1, &pipeline_info, NULL,
                                             &pipeline),
                    "create graphics pipeline with a null cache");

cleanup:
    if (pipeline) {
        vkDestroyPipeline(device, pipeline, NULL);
    }
    if (render_pass) {
        vkDestroyRenderPass(device, render_pass, NULL);
    }
    if (shader) {
        vkDestroyShaderModule(device, shader, NULL);
    }
    return success;
}

static bool smoke_device(VkDevice device, PFN_vkGetDeviceProcAddr get_device_proc_addr) {
    LOAD_DEVICE(vkCreateShaderModule);
    LOAD_DEVICE(vkDestroyShaderModule);
    LOAD_DEVICE(vkCreatePipelineLayout);
    LOAD_DEVICE(vkDestroyPipelineLayout);
    LOAD_DEVICE(vkCreatePipelineCache);
    LOAD_DEVICE(vkDestroyPipelineCache);
    LOAD_DEVICE(vkCreateComputePipelines);
    LOAD_DEVICE(vkDestroyPipeline);
#undef LOAD_DEVICE

    if (!vkCreateShaderModule || !vkDestroyShaderModule || !vkCreatePipelineLayout ||
        !vkDestroyPipelineLayout || !vkCreatePipelineCache || !vkDestroyPipelineCache ||
        !vkCreateComputePipelines || !vkDestroyPipeline) {
        fputs("Vulkan device lacks the pipeline smoke-test functions\n", stderr);
        return false;
    }

    /* SPIR-V 1.0 compute entry point main, workgroup size (1, 1, 1), empty body. */
    static const uint32_t shader_code[] = {
        0x07230203, 0x00010000, 0, 5, 0,                /* SPIR-V header */
        0x00020011, 1,                                   /* OpCapability Shader */
        0x0003000e, 0, 1,                                /* OpMemoryModel Logical GLSL450 */
        0x0005000f, 5, 3, 0x6e69616d, 0,                  /* OpEntryPoint GLCompute %3 "main" */
        0x00060010, 3, 17, 1, 1, 1,                      /* OpExecutionMode %3 LocalSize 1 1 1 */
        0x00020013, 1,                                   /* %1 = OpTypeVoid */
        0x00030021, 2, 1,                                /* %2 = OpTypeFunction %1 */
        0x00050036, 1, 3, 0, 2,                          /* %3 = OpFunction %1 None %2 */
        0x000200f8, 4,                                   /* %4 = OpLabel */
        0x000100fd,                                      /* OpReturn */
        0x00010038,                                      /* OpFunctionEnd */
    };
    const VkShaderModuleCreateInfo shader_info = {
        .sType = VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO,
        .codeSize = sizeof(shader_code),
        .pCode = shader_code,
    };
    const VkPipelineLayoutCreateInfo layout_info = {
        .sType = VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO,
    };
    const VkPipelineCacheCreateInfo cache_info = {
        .sType = VK_STRUCTURE_TYPE_PIPELINE_CACHE_CREATE_INFO,
    };
    VkShaderModule shader = VK_NULL_HANDLE;
    VkPipelineLayout layout = VK_NULL_HANDLE;
    VkPipelineCache app_cache = VK_NULL_HANDLE;
    VkPipeline uncached = VK_NULL_HANDLE;
    VkPipeline cached = VK_NULL_HANDLE;
    bool success = false;

    if (!check(vkCreateShaderModule(device, &shader_info, NULL, &shader), "create compute shader") ||
        !check(vkCreatePipelineLayout(device, &layout_info, NULL, &layout), "create pipeline layout")) {
        goto cleanup;
    }
    const VkComputePipelineCreateInfo pipeline_info = {
        .sType = VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_CREATE_INFO,
        .stage = {
            .sType = VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO,
            .stage = VK_SHADER_STAGE_COMPUTE_BIT,
            .module = shader,
            .pName = "main",
        },
        .layout = layout,
    };

    if (!check(vkCreateComputePipelines(device, VK_NULL_HANDLE, 1, &pipeline_info, NULL, &uncached),
               "create compute pipeline with a null cache") ||
        !check(vkCreatePipelineCache(device, &cache_info, NULL, &app_cache),
               "create application pipeline cache") ||
        !check(vkCreateComputePipelines(device, app_cache, 1, &pipeline_info, NULL, &cached),
               "create compute pipeline with an application cache")) {
        goto cleanup;
    }
    success = smoke_graphics_pipeline(device, get_device_proc_addr, layout);

cleanup:
    if (cached) {
        vkDestroyPipeline(device, cached, NULL);
    }
    if (uncached) {
        vkDestroyPipeline(device, uncached, NULL);
    }
    if (app_cache) {
        vkDestroyPipelineCache(device, app_cache, NULL);
    }
    if (layout) {
        vkDestroyPipelineLayout(device, layout, NULL);
    }
    if (shader) {
        vkDestroyShaderModule(device, shader, NULL);
    }
    return success;
}

static bool wait_for_checkpoint(const char *cache_directory) {
    DIR *directory = opendir(cache_directory);
    if (!directory) {
        perror("open checkpoint directory");
        return false;
    }

    /* The layer publishes complete cache files by rename. Ignore its staging files. */
    const char prefix[] = "pipeline-";
    const char suffix[] = ".bin";
    for (unsigned attempt = 0; attempt < 200; ++attempt) {
        struct dirent *entry;
        while ((entry = readdir(directory)) != NULL) {
            const char *name = entry->d_name;
            const size_t length = strlen(name);
            if (length <= sizeof(prefix) + sizeof(suffix) - 2 ||
                strncmp(name, prefix, sizeof(prefix) - 1) != 0 ||
                strcmp(name + length - (sizeof(suffix) - 1), suffix) != 0) {
                continue;
            }
            struct stat metadata;
            if (fstatat(dirfd(directory), name, &metadata, AT_SYMLINK_NOFOLLOW) == 0 &&
                S_ISREG(metadata.st_mode) && metadata.st_size > 0) {
                closedir(directory);
                return true;
            }
        }
        struct timespec interval = {.tv_nsec = 100000000L};
        int result;
        do {
            result = nanosleep(&interval, &interval);
        } while (result == -1 && errno == EINTR);
        if (result == -1) {
            perror("wait for cache checkpoint");
            closedir(directory);
            return false;
        }
        rewinddir(directory);
    }
    closedir(directory);
    fputs("timed out waiting for a live pipeline cache checkpoint\n", stderr);
    return false;
}

static bool smoke_instance(VkInstance instance, PFN_vkGetInstanceProcAddr get_instance_proc_addr,
                           const char *checkpoint_directory) {
#define LOAD_INSTANCE(name) PFN_##name name = (PFN_##name)get_instance_proc_addr(instance, #name)
    LOAD_INSTANCE(vkEnumeratePhysicalDevices);
    LOAD_INSTANCE(vkGetPhysicalDeviceQueueFamilyProperties);
    LOAD_INSTANCE(vkEnumerateDeviceExtensionProperties);
    LOAD_INSTANCE(vkCreateDevice);
    LOAD_INSTANCE(vkDestroyDevice);
    LOAD_INSTANCE(vkGetDeviceProcAddr);
#undef LOAD_INSTANCE

    if (!vkEnumeratePhysicalDevices || !vkGetPhysicalDeviceQueueFamilyProperties ||
        !vkEnumerateDeviceExtensionProperties || !vkCreateDevice ||
        !vkDestroyDevice || !vkGetDeviceProcAddr) {
        fputs("Vulkan instance lacks the device creation functions\n", stderr);
        return false;
    }
    VkPhysicalDevice physical = VK_NULL_HANDLE;
    uint32_t queue_family = 0;
    if (!find_graphics_compute_queue(vkEnumeratePhysicalDevices,
                                     vkGetPhysicalDeviceQueueFamilyProperties, instance,
                                     &physical, &queue_family)) {
        return false;
    }

    uint32_t count = 0;
    if (!check(vkEnumerateDeviceExtensionProperties(physical, NULL, &count, NULL),
               "count device extensions")) {
        return false;
    }
    const char *portability_name = "VK_KHR_portability_subset";
    bool portability = false;
    if (count != 0) {
        VkExtensionProperties *extensions = calloc(count, sizeof(*extensions));
        if (!extensions) {
            fputs("cannot allocate device extensions\n", stderr);
            return false;
        }
        const bool enumerated =
            check(vkEnumerateDeviceExtensionProperties(physical, NULL, &count, extensions),
                  "enumerate device extensions");
        portability = enumerated && has_extension(extensions, count, portability_name);
        free(extensions);
        if (!enumerated) {
            return false;
        }
    }

    const float queue_priority = 1.0f;
    const VkDeviceQueueCreateInfo queue_info = {
        .sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO,
        .queueFamilyIndex = queue_family,
        .queueCount = 1,
        .pQueuePriorities = &queue_priority,
    };
    const VkDeviceCreateInfo create_info = {
        .sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO,
        .queueCreateInfoCount = 1,
        .pQueueCreateInfos = &queue_info,
        .enabledExtensionCount = portability ? 1 : 0,
        .ppEnabledExtensionNames = portability ? &portability_name : NULL,
    };
    VkDevice device = VK_NULL_HANDLE;
    if (!check(vkCreateDevice(physical, &create_info, NULL, &device), "create compute device")) {
        return false;
    }
    const bool success = smoke_device(device, vkGetDeviceProcAddr);
    if (success && checkpoint_directory) {
        const bool checkpointed = wait_for_checkpoint(checkpoint_directory);
        if (checkpointed) {
            fputs("observed live cache checkpoint; exiting without vkDestroyDevice\n", stderr);
            fflush(stderr);
        }
        _Exit(checkpointed ? EXIT_SUCCESS : EXIT_FAILURE);
    }
    vkDestroyDevice(device, NULL);
    return success;
}

int main(int argc, char **argv) {
    const char *checkpoint_directory = NULL;
    if (argc == 4 && strcmp(argv[2], "--checkpoint") == 0 && argv[3][0] == '/') {
        checkpoint_directory = argv[3];
    } else if (argc != 2) {
        fprintf(stderr, "Usage: %s /absolute/path/to/libvulkan.1.dylib "
                        "[--checkpoint /absolute/cache/directory]\n", argv[0]);
        return EXIT_FAILURE;
    }

    void *loader = dlopen(argv[1], RTLD_NOW | RTLD_LOCAL);
    if (!loader) {
        fprintf(stderr, "cannot load Vulkan loader: %s\n", dlerror());
        return EXIT_FAILURE;
    }

    void *symbol = dlsym(loader, "vkGetInstanceProcAddr");
    PFN_vkGetInstanceProcAddr get_instance_proc_addr = NULL;
    _Static_assert(sizeof(get_instance_proc_addr) == sizeof(symbol), "dlsym pointer representation");
    memcpy(&get_instance_proc_addr, &symbol, sizeof(get_instance_proc_addr));
    if (!get_instance_proc_addr) {
        fputs("Vulkan loader lacks vkGetInstanceProcAddr\n", stderr);
        dlclose(loader);
        return EXIT_FAILURE;
    }

    VkInstance instance = make_instance(get_instance_proc_addr);
    if (!instance) {
        dlclose(loader);
        return EXIT_FAILURE;
    }
    PFN_vkDestroyInstance destroy_instance =
        (PFN_vkDestroyInstance)get_instance_proc_addr(instance, "vkDestroyInstance");
    if (!destroy_instance) {
        fputs("Vulkan instance lacks vkDestroyInstance\n", stderr);
        dlclose(loader);
        return EXIT_FAILURE;
    }

    const bool success = smoke_instance(instance, get_instance_proc_addr, checkpoint_directory);
    destroy_instance(instance, NULL);
    dlclose(loader);
    if (success) {
        puts("Vulkan graphics and compute pipelines created with null caches "
             "and compute with an application-owned cache");
    }
    return success ? EXIT_SUCCESS : EXIT_FAILURE;
}
