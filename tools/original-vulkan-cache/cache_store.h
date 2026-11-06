#ifndef AZS_CACHE_STORE_H
#define AZS_CACHE_STORE_H

#include <stdbool.h>
#include <stddef.h>
#include <vulkan/vulkan.h>

#define AZS_CACHE_MAX_SIZE (32u * 1024u * 1024u)

bool azs_cache_enabled(void);
/* The caller owns the returned data and frees it with free. */
unsigned char *azs_cache_read(const VkPhysicalDeviceProperties *properties, size_t *size);
/* Returns true when the new cache atomically replaces the destination. */
bool azs_cache_write(const VkPhysicalDeviceProperties *properties, const void *data, size_t size);

#endif
