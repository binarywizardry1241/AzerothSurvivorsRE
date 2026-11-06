#ifndef AZS_VULKAN_TRACKER_H
#define AZS_VULKAN_TRACKER_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

typedef struct {
    bool active;
    bool truncated;
    uint64_t frame;
    uint64_t start_ns;
    const char *name;
    size_t length;
    char fields[8192];
} AzsTrackEvent;

bool azs_tracker_enabled(void);
void azs_track_begin(AzsTrackEvent *event, const char *name, bool metadata);
void azs_trackf(AzsTrackEvent *event, const char *format, ...)
    __attribute__((format(printf, 2, 3)));
void azs_track_text(AzsTrackEvent *event, const char *key, const char *value);
void azs_track_end(AzsTrackEvent *event, bool presented);
void azs_track_describe(AzsTrackEvent *event, const char *field, const char *type,
                        const void *data, size_t count);

#endif
