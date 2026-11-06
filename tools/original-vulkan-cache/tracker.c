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
#include <sys/stat.h>
#include <time.h>
#include <unistd.h>

#ifndef AZS_TRACKER_HEARTBEAT_SECONDS
#define AZS_TRACKER_HEARTBEAT_SECONDS 60
#endif
#if AZS_TRACKER_HEARTBEAT_SECONDS < 1
#error AZS_TRACKER_HEARTBEAT_SECONDS must be positive
#endif

enum { TRACE_PATH_SIZE = 4096, TRACE_NAME_SIZE = 96, UTC_SIZE = 32 };

static pthread_once_t tracker_once = PTHREAD_ONCE_INIT;
static pthread_mutex_t output_lock = PTHREAD_MUTEX_INITIALIZER;
static pthread_cond_t heartbeat_wake = PTHREAD_COND_INITIALIZER;
static pthread_t heartbeat_thread;
static bool heartbeat_started, heartbeat_stop, output_failed;
static FILE *output;
static atomic_bool tracker_open;
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

static bool trace_directory(char path[TRACE_PATH_SIZE]) {
    const char *directory = getenv("TRACKER_DIR");
    if (directory) {
        if (directory[0] != '/' || strlen(directory) >= TRACE_PATH_SIZE) {
            return false;
        }
        strcpy(path, directory);
        return true;
    }
    const char *legacy = getenv("TRACKER_PATH");
    if (legacy) {
        if (legacy[0] != '/') {
            return false;
        }
        size_t length = (size_t)(strrchr(legacy, '/') - legacy);
        if (length >= TRACE_PATH_SIZE) {
            return false;
        }
        if (length == 0) {
            length = 1;
        }
        memcpy(path, legacy, length);
        path[length] = '\0';
        return true;
    }
    const char *cache = getenv("AZS_VK_CACHE_DIR");
    if (!cache || cache[0] != '/') {
        return false;
    }
    int length = snprintf(path, TRACE_PATH_SIZE, "%s%straces", cache,
                          cache[strlen(cache) - 1] == '/' ? "" : "/");
    return length > 0 && length < TRACE_PATH_SIZE;
}

static bool format_utc(char out[UTC_SIZE], time_t seconds, const char *format) {
    struct tm utc;
    return gmtime_r(&seconds, &utc) && strftime(out, UTC_SIZE, format, &utc) != 0;
}

static int create_trace_file(int directory, char name[TRACE_NAME_SIZE]) {
    struct timespec now = {0};
    char stamp[UTC_SIZE];
    if (clock_gettime(CLOCK_REALTIME, &now) != 0 ||
        !format_utc(stamp, now.tv_sec, "%Y%m%dT%H%M%SZ")) {
        strcpy(stamp, "unknown-utc");
    }

    for (unsigned attempt = 0; attempt < 128; ++attempt) {
        snprintf(name, TRACE_NAME_SIZE, "tracker-%s-p%ld-%09ld-%u.tsv",
                 stamp, (long)getpid(), now.tv_nsec, attempt);
        int fd = openat(directory, name, O_WRONLY | O_CREAT | O_EXCL | O_NOFOLLOW | O_CLOEXEC, 0600);
        if (fd >= 0 || errno != EEXIST) {
            return fd;
        }
    }
    return -1;
}

static uint64_t timestamp_ns(void) {
    struct timespec time;
    if (clock_gettime(CLOCK_MONOTONIC, &time) != 0) {
        return 0;
    }
    return (uint64_t)time.tv_sec * UINT64_C(1000000000) + (uint64_t)time.tv_nsec;
}

static void stop_after_error(void) {
    fputs("[azs-tracker] trace write failed\n", stderr);
    output_failed = true;
    atomic_store_explicit(&output_stopped, true, memory_order_relaxed);
    pthread_cond_signal(&heartbeat_wake);
}

/* output_lock is held. Waiting releases it, so an idle tracker has no polling. */
static bool wait_for_heartbeat(void) {
#ifdef __APPLE__
    uint64_t start = timestamp_ns();
    if (!start) {
        return false;
    }
    const uint64_t second = UINT64_C(1000000000);
    uint64_t deadline = start + (uint64_t)AZS_TRACKER_HEARTBEAT_SECONDS * second;
#else
    struct timespec deadline;
    if (clock_gettime(CLOCK_REALTIME, &deadline) != 0) {
        return false;
    }
    deadline.tv_sec += AZS_TRACKER_HEARTBEAT_SECONDS;
#endif

    while (!heartbeat_stop && !output_failed) {
#ifdef __APPLE__
        uint64_t now = timestamp_ns();
        if (!now || now >= deadline) {
            return now != 0;
        }
        uint64_t remaining = deadline - now;
        struct timespec delay = {
            .tv_sec = (time_t)(remaining / second),
            .tv_nsec = (long)(remaining % second),
        };
        int result = pthread_cond_timedwait_relative_np(&heartbeat_wake, &output_lock, &delay);
#else
        int result = pthread_cond_timedwait(&heartbeat_wake, &output_lock, &deadline);
#endif
        if (result == ETIMEDOUT) {
            return !heartbeat_stop && !output_failed;
        }
        if (result != 0) {
            fprintf(stderr, "[azs-tracker] heartbeat wait failed (%d)\n", result);
            return false;
        }
    }
    return false;
}

static void *heartbeat(void *unused) {
    (void)unused;
    pthread_mutex_lock(&output_lock);
    while (wait_for_heartbeat()) {
        char utc[UTC_SIZE];
        if (!format_utc(utc, time(NULL), "%Y-%m-%dT%H:%M:%SZ")) {
            strcpy(utc, "unknown");
        }
        uint64_t frame = atomic_load_explicit(&frame_number, memory_order_relaxed);
        bool stopped = atomic_load_explicit(&output_stopped, memory_order_relaxed);
        if (fprintf(output, "# heartbeat\tutc=%s\tframe=%" PRIu64 "\tseq=%" PRIu64
                    "\tevents_stopped=%d\n", utc, frame, sequence, stopped ? 1 : 0) < 0 ||
            fflush(output) != 0) {
            stop_after_error();
        }
    }
    pthread_mutex_unlock(&output_lock);
    return NULL;
}

static void open_tracker(void) {
    const char *enabled = getenv("TRACKER");
    if (!enabled || strcmp(enabled, "1") != 0) {
        return;
    }
    char path[TRACE_PATH_SIZE];
    if (!trace_directory(path)) {
        fputs("[azs-tracker] set an absolute TRACKER_DIR or AZS_VK_CACHE_DIR\n", stderr);
        return;
    }
    first_frame = read_option("TRACKER_START_FRAME", 0, UINT64_MAX);
    frame_count = read_option("TRACKER_FRAMES", 0, UINT64_MAX);
    uint64_t mib = read_option("TRACKER_MAX_MIB", 64, 1024);
    max_bytes = (mib ? mib : 64) * 1024 * 1024;

    pthread_mutex_lock(&output_lock);
    if (heartbeat_stop) {
        goto done;
    }
    if (mkdir(path, 0700) != 0 && errno != EEXIST) {
        fprintf(stderr, "[azs-tracker] cannot create trace directory (%d)\n", errno);
        goto done;
    }
    int directory = open(path, O_RDONLY | O_DIRECTORY | O_NOFOLLOW | O_CLOEXEC);
    if (directory < 0) {
        fprintf(stderr, "[azs-tracker] cannot open trace directory (%d)\n", errno);
        goto done;
    }
    char name[TRACE_NAME_SIZE];
    int fd = create_trace_file(directory, name);
    if (fd < 0) {
        fprintf(stderr, "[azs-tracker] cannot create trace (%d)\n", errno);
        close(directory);
        goto done;
    }
    FILE *stream = fdopen(fd, "w");
    if (!stream) {
        fprintf(stderr, "[azs-tracker] cannot open trace stream (%d)\n", errno);
        close(fd);
        unlinkat(directory, name, 0);
        close(directory);
        goto done;
    }
    setvbuf(stream, NULL, _IOFBF, 65536);
    struct timespec wall = {0};
    uint64_t monotonic_ns = timestamp_ns();
    (void)clock_gettime(CLOCK_REALTIME, &wall);
    int header = fprintf(stream, "# azs-vulkan-tracker v1\tpid=%ld\tstart_frame=%" PRIu64
                         "\tframes=%" PRIu64 "\tmax_bytes=%" PRIu64
                         "\tmonotonic_ns=%" PRIu64 "\tunix_time=%" PRIdMAX ".%09ld\n",
                         (long)getpid(), first_frame, frame_count, max_bytes, monotonic_ns,
                         (intmax_t)wall.tv_sec, wall.tv_nsec);
    if (header < 0 || fflush(stream) != 0) {
        fputs("[azs-tracker] could not write the trace header\n", stderr);
        fclose(stream);
        unlinkat(directory, name, 0);
        close(directory);
        goto done;
    }
    close(directory);
    output = stream;
    output_bytes = (uint64_t)header;
    int started = pthread_create(&heartbeat_thread, NULL, heartbeat, NULL);
    heartbeat_started = started == 0;
    if (!heartbeat_started) {
        fprintf(stderr, "[azs-tracker] cannot start heartbeat (%d)\n", started);
    }
    atomic_store_explicit(&tracker_open, true, memory_order_release);
    fprintf(stderr, "[azs-tracker] recording Vulkan calls to %s%s%s\n", path,
            path[strlen(path) - 1] == '/' ? "" : "/", name);

done:
    pthread_mutex_unlock(&output_lock);
}

bool azs_tracker_enabled(void) {
    pthread_once(&tracker_once, open_tracker);
    return atomic_load_explicit(&tracker_open, memory_order_acquire);
}

__attribute__((destructor))
static void close_tracker(void) {
    pthread_mutex_lock(&output_lock);
    atomic_store_explicit(&tracker_open, false, memory_order_release);
    heartbeat_stop = true;
    pthread_cond_signal(&heartbeat_wake);
    bool join = heartbeat_started;
    pthread_mutex_unlock(&output_lock);
    if (join) {
        pthread_join(heartbeat_thread, NULL);
    }
    pthread_mutex_lock(&output_lock);
    if (output) {
        fclose(output);
        output = NULL;
    }
    pthread_mutex_unlock(&output_lock);
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
    if (output && !atomic_load_explicit(&output_stopped, memory_order_relaxed)) {
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
            if (fputs("# trace limit reached\n", output) == EOF || fflush(output) != 0) {
                stop_after_error();
            } else {
                atomic_store_explicit(&output_stopped, true, memory_order_relaxed);
            }
        } else if (count <= 0 || (size_t)count >= sizeof prefix ||
                   fprintf(output, "%s%s%s", prefix, event->fields, suffix) < 0 ||
                   (presented && fflush(output) != 0)) {
            stop_after_error();
        } else {
            output_bytes += length;
        }
    }
    pthread_mutex_unlock(&output_lock);
}
