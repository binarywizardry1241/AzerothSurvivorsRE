#define _POSIX_C_SOURCE 200809L
#ifdef __APPLE__
#define _DARWIN_C_SOURCE
#endif

#include "tracker.h"

#include <errno.h>
#include <fcntl.h>
#include <inttypes.h>
#include <pthread.h>
#include <stdarg.h>
#include <stdatomic.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/file.h>
#include <sys/stat.h>
#include <time.h>
#include <unistd.h>

static pthread_once_t tracker_once = PTHREAD_ONCE_INIT;
static pthread_mutex_t output_lock = PTHREAD_MUTEX_INITIALIZER;
static FILE *output;
static atomic_uint_fast64_t frame_number;
static uint64_t first_frame, frame_count, max_bytes;
static uint64_t output_bytes, sequence;
static atomic_bool output_stopped;

static uint64_t read_option(const char *key, uint64_t fallback, uint64_t maximum) {
    const char *value = getenv(key);
    if (!value) {
        return fallback;
    }
    char *end;
    errno = 0;
    unsigned long long number = strtoull(value, &end, 10);
    if (value[0] < '0' || value[0] > '9' || *end || errno || number > maximum) {
        fprintf(stderr, "[azs-tracker] ignoring invalid %s\n", key);
        return fallback;
    }
    return number;
}

static void open_tracker(void) {
    const char *enabled = getenv("TRACKER");
    if (!enabled || strcmp(enabled, "1") != 0) {
        return;
    }
    const char *path = getenv("TRACKER_PATH");
    char default_path[4096];
    if (!path) {
        const char *cache_dir = getenv("AZS_VK_CACHE_DIR");
        if (cache_dir && cache_dir[0] == '/') {
            int length = snprintf(default_path, sizeof default_path, "%s/tracker.tsv", cache_dir);
            if (length > 0 && (size_t)length < sizeof default_path) {
                path = default_path;
            }
        }
    }
    if (!path || path[0] != '/') {
        fputs("[azs-tracker] set TRACKER_PATH to an absolute trace file path\n", stderr);
        return;
    }
    first_frame = read_option("TRACKER_START_FRAME", 0, UINT64_MAX);
    frame_count = read_option("TRACKER_FRAMES", 0, UINT64_MAX);
    uint64_t mib = read_option("TRACKER_MAX_MIB", 64, 1024);
    max_bytes = (mib ? mib : 64) * 1024 * 1024;

    int fd = open(path, O_WRONLY | O_CREAT | O_CLOEXEC | O_NOFOLLOW | O_NONBLOCK, 0600);
    if (fd < 0) {
        fprintf(stderr, "[azs-tracker] cannot open trace (%d)\n", errno);
        return;
    }
    struct stat info;
    if (fstat(fd, &info) != 0 || !S_ISREG(info.st_mode) || info.st_uid != geteuid() ||
        info.st_nlink != 1 || (info.st_mode & 0077) ||
        flock(fd, LOCK_EX | LOCK_NB) != 0 || ftruncate(fd, 0) != 0) {
        fputs("[azs-tracker] trace must be a private regular file unused by another run\n", stderr);
        close(fd);
        return;
    }
    output = fdopen(fd, "w");
    if (!output) {
        fprintf(stderr, "[azs-tracker] cannot open trace stream (%d)\n", errno);
        close(fd);
        return;
    }
    setvbuf(output, NULL, _IOFBF, 65536);
    int header = fprintf(output, "# azs-vulkan-tracker v1\tpid=%ld\tstart_frame=%" PRIu64
                        "\tframes=%" PRIu64 "\tmax_bytes=%" PRIu64 "\n",
                        (long)getpid(), first_frame, frame_count, max_bytes);
    if (header < 0 || fflush(output) != 0) {
        fputs("[azs-tracker] could not write the trace header\n", stderr);
        fclose(output);
        output = NULL;
        return;
    }
    output_bytes = (uint64_t)header;
    fprintf(stderr, "[azs-tracker] recording Vulkan calls to %s\n", path);
}

bool azs_tracker_enabled(void) {
    pthread_once(&tracker_once, open_tracker);
    return output != NULL;
}

__attribute__((destructor))
static void close_tracker(void) {
    if (output) {
        fclose(output);
    }
}

static uint64_t timestamp_ns(void) {
    struct timespec time;
    if (clock_gettime(CLOCK_MONOTONIC, &time) != 0) {
        return 0;
    }
    return (uint64_t)time.tv_sec * UINT64_C(1000000000) + (uint64_t)time.tv_nsec;
}

void azs_track_begin(AzsTrackEvent *event, const char *name, bool metadata) {
    event->active = false;
    if (!azs_tracker_enabled() || atomic_load_explicit(&output_stopped, memory_order_relaxed)) {
        return;
    }
    uint64_t frame = atomic_load_explicit(&frame_number, memory_order_relaxed);
    if (!metadata && (frame < first_frame ||
                      (frame_count && frame - first_frame >= frame_count))) {
        return;
    }
    event->active = true;
    event->truncated = false;
    event->frame = frame;
    event->start_ns = timestamp_ns();
    event->name = name;
    event->length = 0;
    event->fields[0] = '\0';
}

void azs_trackf(AzsTrackEvent *event, const char *format, ...) {
    if (!event->active || event->truncated) {
        return;
    }
    size_t available = sizeof event->fields - event->length;
    va_list args;
    va_start(args, format);
    int count = vsnprintf(event->fields + event->length, available, format, args);
    va_end(args);
    if (count < 0 || (size_t)count >= available) {
        event->truncated = true;
        event->fields[event->length] = '\0';
        return;
    }
    event->length += (size_t)count;
}

void azs_track_text(AzsTrackEvent *event, const char *key, const char *value) {
    if (!event->active || !value) {
        return;
    }
    char escaped[513];
    size_t length = 0;
    size_t i = 0;
    for (; i < 256 && value[i]; ++i) {
        unsigned char c = (unsigned char)value[i];
        switch (c) {
            case '\\': escaped[length++] = '\\'; escaped[length++] = '\\'; break;
            case '\t': escaped[length++] = '\\'; escaped[length++] = 't'; break;
            case '\n': escaped[length++] = '\\'; escaped[length++] = 'n'; break;
            case '\r': escaped[length++] = '\\'; escaped[length++] = 'r'; break;
            default: escaped[length++] = c < 32 || c == 127 ? '?' : (char)c; break;
        }
    }
    escaped[length] = '\0';
    azs_trackf(event, "\t%s=%s%s", key, escaped, i == 256 && value[i] ? "…" : "");
}

void azs_track_end(AzsTrackEvent *event, bool presented) {
    if (presented && azs_tracker_enabled()) {
        atomic_fetch_add_explicit(&frame_number, 1, memory_order_relaxed);
    }
    if (!event->active) {
        return;
    }
    uint64_t end_ns = timestamp_ns();
    pthread_mutex_lock(&output_lock);
    if (!atomic_load_explicit(&output_stopped, memory_order_relaxed)) {
        char prefix[256];
        int count = snprintf(prefix, sizeof prefix, "seq=%" PRIu64 "\tframe=%" PRIu64
                             "\tt_ns=%" PRIu64 "\tobserved_ns=%" PRIu64
                             "\tthread=0x%" PRIxPTR "\tcall=%s",
                             ++sequence, event->frame, event->start_ns,
                             end_ns >= event->start_ns ? end_ns - event->start_ns : 0,
                             (uintptr_t)pthread_self(), event->name);
        const char *suffix = event->truncated ? "\ttruncated=1\n" : "\n";
        uint64_t length = count > 0 ? (uint64_t)count + event->length + strlen(suffix) : 0;
        if (output_bytes + length + 64 > max_bytes) {
            fputs("# trace limit reached\n", output);
            fflush(output);
            atomic_store_explicit(&output_stopped, true, memory_order_relaxed);
        } else if (count <= 0 || (size_t)count >= sizeof prefix ||
                   fprintf(output, "%s%s%s", prefix, event->fields, suffix) < 0 ||
                   (presented && fflush(output) != 0)) {
            fputs("[azs-tracker] trace write failed\n", stderr);
            atomic_store_explicit(&output_stopped, true, memory_order_relaxed);
        } else {
            output_bytes += length;
        }
    }
    pthread_mutex_unlock(&output_lock);
}
