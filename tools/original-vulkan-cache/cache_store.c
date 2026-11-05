#define _POSIX_C_SOURCE 200809L
#ifdef __APPLE__
#define _DARWIN_C_SOURCE
#endif

#include "cache_store.h"

#include <errno.h>
#include <fcntl.h>
#include <inttypes.h>
#include <stdatomic.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>

enum { CACHE_HEADER_SIZE = 16 + VK_UUID_SIZE, CACHE_NAME_SIZE = 96 };

static int open_cache_directory(void) {
    const char *path = getenv("AZS_VK_CACHE_DIR");
    if (!path || path[0] != '/') {
        return -1;
    }
    return open(path, O_RDONLY | O_DIRECTORY | O_NOFOLLOW | O_CLOEXEC);
}

bool azs_cache_enabled(void) {
    int directory = open_cache_directory();
    if (directory < 0) {
        return false;
    }
    close(directory);
    return true;
}

static void cache_name(char name[CACHE_NAME_SIZE], const VkPhysicalDeviceProperties *properties) {
    static const char hex[] = "0123456789abcdef";
    char uuid[2 * VK_UUID_SIZE + 1];
    for (size_t i = 0; i < VK_UUID_SIZE; ++i) {
        unsigned byte = properties->pipelineCacheUUID[i];
        uuid[2 * i] = hex[byte >> 4];
        uuid[2 * i + 1] = hex[byte & 15u];
    }
    uuid[2 * VK_UUID_SIZE] = '\0';
    snprintf(name, CACHE_NAME_SIZE, "pipeline-%08" PRIx32 "-%08" PRIx32 "-%08" PRIx32 "-%s.bin",
             properties->vendorID, properties->deviceID, properties->driverVersion, uuid);
}

static uint32_t read_le_u32(const unsigned char *bytes) {
    return (uint32_t)bytes[0] | ((uint32_t)bytes[1] << 8) |
           ((uint32_t)bytes[2] << 16) | ((uint32_t)bytes[3] << 24);
}

static bool valid_header(const VkPhysicalDeviceProperties *properties,
                         const unsigned char *bytes, size_t size) {
    return size >= CACHE_HEADER_SIZE && size <= AZS_CACHE_MAX_SIZE &&
           read_le_u32(bytes) == CACHE_HEADER_SIZE &&
           read_le_u32(bytes + 4) == VK_PIPELINE_CACHE_HEADER_VERSION_ONE &&
           read_le_u32(bytes + 8) == properties->vendorID &&
           read_le_u32(bytes + 12) == properties->deviceID &&
           memcmp(bytes + 16, properties->pipelineCacheUUID, VK_UUID_SIZE) == 0;
}

static void trace_cache(const char *action, size_t size) {
    const char *setting = getenv("AZS_VK_CACHE_TRACE");
    if (setting && strcmp(setting, "1") == 0) {
        fprintf(stderr, "azs-vk-cache: %s %zu bytes\n", action, size);
    }
}

static bool read_exact(int file, unsigned char *bytes, size_t remaining) {
    while (remaining > 0) {
        ssize_t count = read(file, bytes, remaining);
        if (count < 0 && errno == EINTR) {
            continue;
        }
        if (count <= 0) {
            return false;
        }
        bytes += count;
        remaining -= (size_t)count;
    }
    unsigned char extra;
    ssize_t count;
    do {
        count = read(file, &extra, 1);
    } while (count < 0 && errno == EINTR);
    return count == 0;
}

unsigned char *azs_cache_read(const VkPhysicalDeviceProperties *properties, size_t *size) {
    *size = 0;
    int directory = open_cache_directory();
    if (directory < 0) {
        return NULL;
    }
    char name[CACHE_NAME_SIZE];
    cache_name(name, properties);
    int file = openat(directory, name, O_RDONLY | O_NOFOLLOW | O_NONBLOCK | O_CLOEXEC);
    close(directory);
    if (file < 0) {
        return NULL;
    }

    struct stat metadata;
    unsigned char *bytes = NULL;
    if (fstat(file, &metadata) == 0 && S_ISREG(metadata.st_mode) &&
        metadata.st_size >= CACHE_HEADER_SIZE && metadata.st_size <= AZS_CACHE_MAX_SIZE) {
        size_t length = (size_t)metadata.st_size;
        bytes = malloc(length);
        if (bytes && read_exact(file, bytes, length) && valid_header(properties, bytes, length)) {
            *size = length;
            trace_cache("loaded", length);
        } else {
            free(bytes);
            bytes = NULL;
        }
    }
    close(file);
    return bytes;
}

static bool cache_slot_available(int directory, const char *name) {
    struct stat metadata;
    if (fstatat(directory, name, &metadata, AT_SYMLINK_NOFOLLOW) == 0) {
        return S_ISREG(metadata.st_mode);
    }
    return errno == ENOENT;
}

static int open_staging_file(int directory, char name[CACHE_NAME_SIZE]) {
    static atomic_uint sequence;
    for (unsigned attempt = 0; attempt < 16; ++attempt) {
        unsigned serial = atomic_fetch_add_explicit(&sequence, 1u, memory_order_relaxed);
        snprintf(name, CACHE_NAME_SIZE, ".pipeline-%ld-%u.tmp", (long)getpid(), serial);
        int file = openat(directory, name, O_WRONLY | O_CREAT | O_EXCL | O_NOFOLLOW | O_CLOEXEC,
                          S_IRUSR | S_IWUSR);
        if (file >= 0 || errno != EEXIST) {
            return file;
        }
    }
    return -1;
}

static bool write_exact(int file, const unsigned char *bytes, size_t remaining) {
    while (remaining > 0) {
        ssize_t count = write(file, bytes, remaining);
        if (count < 0 && errno == EINTR) {
            continue;
        }
        if (count <= 0) {
            return false;
        }
        bytes += count;
        remaining -= (size_t)count;
    }
    return true;
}

void azs_cache_write(const VkPhysicalDeviceProperties *properties, const void *data, size_t size) {
    if (!data || !valid_header(properties, data, size)) {
        return;
    }
    int directory = open_cache_directory();
    if (directory < 0) {
        return;
    }

    char name[CACHE_NAME_SIZE];
    char staging[CACHE_NAME_SIZE];
    cache_name(name, properties);
    int file = cache_slot_available(directory, name) ? open_staging_file(directory, staging) : -1;
    if (file >= 0) {
        bool complete = fchmod(file, S_IRUSR | S_IWUSR) == 0 &&
                        write_exact(file, data, size) && fsync(file) == 0;
        if (close(file) == 0 && complete && cache_slot_available(directory, name) &&
            renameat(directory, staging, directory, name) == 0) {
            trace_cache("saved", size);
        } else {
            unlinkat(directory, staging, 0);
        }
    }
    close(directory);
}
