#define _POSIX_C_SOURCE 200809L
#define _DARWIN_C_SOURCE

#include <crt_externs.h>
#include <errno.h>
#include <fcntl.h>
#include <inttypes.h>
#include <limits.h>
#include <mach-o/dyld.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <time.h>
#include <unistd.h>

enum { SESSION_NAME_SIZE = 96, PID_SIZE = 32 };

#define GAMEPLAY_TAGS "addon,fct,cd,use,move"
static const char detail_tags[] = GAMEPLAY_TAGS ",prs,snd,knb,gate,mmv,csp,spl,face,clmp,fx";

static bool is_game_launch(void) {
    const char *enabled = getenv("TRACKER");
    const char *target = getenv("AZS_TRACKER_EXE");
    if (!enabled || strcmp(enabled, "1") != 0 || !target || target[0] != '/') {
        return false;
    }
    char **argv = *_NSGetArgv();
    if (*_NSGetArgc() < 2 || !argv || !argv[1] || argv[1][0] != '/') {
        return false;
    }
    char executable[PATH_MAX];
    uint32_t size = sizeof executable;
    if (_NSGetExecutablePath(executable, &size) != 0) {
        return false;
    }
    const char *name = strrchr(executable, '/');
    name = name ? name + 1 : executable;
    if (strcmp(name, "wine") != 0 && strcmp(name, "wine64") != 0) {
        return false;
    }

    char actual[PATH_MAX];
    char expected[PATH_MAX];
    struct stat info;
    return realpath(argv[1], actual) && realpath(target, expected) &&
           strcmp(actual, expected) == 0 && stat(actual, &info) == 0 && S_ISREG(info.st_mode);
}

static bool wine_maps_host_root(void) {
    const char *prefix = getenv("WINEPREFIX");
    if (!prefix || prefix[0] != '/') {
        return false;
    }
    char mapping[PATH_MAX];
    int length = snprintf(mapping, sizeof mapping, "%s/dosdevices/z:", prefix);
    char resolved[PATH_MAX];
    return length > 0 && (size_t)length < sizeof mapping && realpath(mapping, resolved) &&
           strcmp(resolved, "/") == 0;
}

static bool private_directory(int fd) {
    struct stat info;
    return fstat(fd, &info) == 0 && S_ISDIR(info.st_mode) &&
           info.st_uid == geteuid() && !(info.st_mode & 0077);
}

static bool create_session(int directory, char name[SESSION_NAME_SIZE]) {
    time_t now = time(NULL);
    struct tm utc;
    char stamp[32];
    if (now == (time_t)-1 || !gmtime_r(&now, &utc) ||
        strftime(stamp, sizeof stamp, "%Y%m%dT%H%M%SZ", &utc) == 0) {
        strcpy(stamp, "unknown-utc");
    }
    for (unsigned attempt = 0; attempt < 16; ++attempt) {
        uint64_t nonce;
        arc4random_buf(&nonce, sizeof nonce);
        snprintf(name, SESSION_NAME_SIZE, "session-%s-p%ld-%016" PRIx64,
                 stamp, (long)getpid(), nonce);
        if (mkdirat(directory, name, 0700) == 0) {
            return true;
        }
        if (errno != EEXIST) {
            break;
        }
    }
    return false;
}

static bool windows_log_path(char out[PATH_MAX + 16], const char *host) {
    size_t length = strlen(host);
    if (length >= PATH_MAX || strpbrk(host, "\\:\"*?<>|")) {
        return false;
    }
    out[0] = 'Z';
    out[1] = ':';
    for (size_t i = 0; i < length; ++i) {
        if ((unsigned char)host[i] < 32) {
            return false;
        }
        out[i + 2] = host[i] == '/' ? '\\' : host[i];
    }
    memcpy(out + length + 2, "\\gameplay.log", sizeof "\\gameplay.log");
    return true;
}

static bool apply_session(const char *guest, const char *pid) {
    const char *detail = getenv("TRACKER_DETAIL");
    const char *tags = detail && strcmp(detail, "1") == 0 ? detail_tags : GAMEPLAY_TAGS;
    struct Change {
        const char *key, *value;
        char *previous;
    } changes[] = {
        {"WOW_MOVE_TRACE_TAGS", tags, NULL},
        {"WOW_MOVE_TRACE_CHAT", "0", NULL},
        {"WOW_MOVE_TRACE", guest, NULL},
        {"AZS_TRACKER_BOOTSTRAP_PID", pid, NULL},
    };

    size_t count = sizeof changes / sizeof changes[0];
    bool success = false;
    for (size_t i = 0; i < count; ++i) {
        const char *previous = getenv(changes[i].key);
        if (previous && !(changes[i].previous = strdup(previous))) {
            goto done;
        }
    }
    for (size_t i = 0; i < count; ++i) {
        if (setenv(changes[i].key, changes[i].value, 1) != 0) {
            while (i > 0) {
                const struct Change *change = &changes[--i];
                if (change->previous) {
                    setenv(change->key, change->previous, 1);
                } else {
                    unsetenv(change->key);
                }
            }
            goto done;
        }
    }
    success = true;

done:
    for (size_t i = 0; i < count; ++i) {
        free(changes[i].previous);
    }
    return success;
}

__attribute__((constructor))
static void prepare_wine_tracker(void) {
    if (!is_game_launch()) {
        return;
    }
    char pid[PID_SIZE];
    snprintf(pid, sizeof pid, "%ld", (long)getpid());
    const char *previous_pid = getenv("AZS_TRACKER_BOOTSTRAP_PID");
    if (previous_pid && strcmp(previous_pid, pid) == 0 && getenv("WOW_MOVE_TRACE")) {
        /* Wine can exec its preloader/loader again in the same process. */
        return;
    }
    if (!wine_maps_host_root()) {
        fputs("[azs-tracker-bootstrap] WINEPREFIX does not map Z: to the host root\n", stderr);
        return;
    }

    const char *cache_path = getenv("AZS_VK_CACHE_DIR");
    char cache[PATH_MAX];
    if (!cache_path || cache_path[0] != '/' || !realpath(cache_path, cache)) {
        fputs("[azs-tracker-bootstrap] AZS_VK_CACHE_DIR must name an existing absolute directory\n", stderr);
        return;
    }
    int cache_fd = open(cache_path, O_RDONLY | O_DIRECTORY | O_NOFOLLOW | O_CLOEXEC);
    if (cache_fd < 0) {
        fputs("[azs-tracker-bootstrap] cannot open the tracker cache directory\n", stderr);
        return;
    }

    bool made_traces = mkdirat(cache_fd, "traces", 0700) == 0;
    if (!made_traces && errno != EEXIST) {
        fputs("[azs-tracker-bootstrap] cannot create the traces directory\n", stderr);
        close(cache_fd);
        return;
    }

    int traces_fd = openat(cache_fd, "traces", O_RDONLY | O_DIRECTORY | O_NOFOLLOW | O_CLOEXEC);
    char name[SESSION_NAME_SIZE];
    bool made_session = false;
    bool success = false;
    if (traces_fd >= 0 && private_directory(traces_fd)) {
        made_session = create_session(traces_fd, name);
        if (made_session) {
            char host[PATH_MAX];
            char guest[PATH_MAX + 16];
            int length = snprintf(host, sizeof host, "%s/traces/%s", cache, name);
            success = length > 0 && (size_t)length < sizeof host &&
                      windows_log_path(guest, host) && apply_session(guest, pid);
            if (success) {
                fprintf(stderr, "[azs-tracker-bootstrap] private tracker session: %s\n", host);
            } else {
                unlinkat(traces_fd, name, AT_REMOVEDIR);
            }
        }
    }
    if (traces_fd >= 0) {
        close(traces_fd);
    }
    if (!success) {
        if (made_traces) {
            unlinkat(cache_fd, "traces", AT_REMOVEDIR);
        }
        fputs("[azs-tracker-bootstrap] cannot prepare a private tracker session\n", stderr);
    }
    close(cache_fd);
}
