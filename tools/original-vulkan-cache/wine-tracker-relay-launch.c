#define _DARWIN_C_SOURCE

#include "wine-tracker-relay-launch.h"

#include <dlfcn.h>
#include <errno.h>
#include <fcntl.h>
#include <limits.h>
#include <spawn.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

static const char relay_name[] = "azs-wine-tracker-relay";
enum { CHILD_STDOUT_READ = 3, CHILD_STDERR_READ = 4, SOURCE_FD_MIN = 5 };

static bool relay_path(char *path, size_t capacity) {
    Dl_info info;
    char library[PATH_MAX];
    if (!dladdr(relay_name, &info) || !info.dli_fname || !realpath(info.dli_fname, library)) {
        return false;
    }
    char *name = strrchr(library, '/');
    if (!name) {
        return false;
    }
    name[1] = '\0';
    int length = snprintf(path, capacity, "%s%s", library, relay_name);
    return length > 0 && (size_t)length < capacity;
}

static void close_fd(int fd) {
    if (fd >= 0) {
        close(fd);
    }
}

static bool create_relay_pipe(int ends[2]) {
    int original[2];
    if (pipe(original) != 0) {
        return false;
    }
    // A failed helper must never turn an ordinary Wine output write into SIGPIPE.
    if (fcntl(original[1], F_SETNOSIGPIPE, 1) == 0) {
        // Keep spawn action sources distinct from their destinations, even when stdin is closed.
        ends[0] = fcntl(original[0], F_DUPFD_CLOEXEC, SOURCE_FD_MIN);
        ends[1] = fcntl(original[1], F_DUPFD_CLOEXEC, SOURCE_FD_MIN);
    }
    close(original[0]);
    close(original[1]);
    return ends[0] >= 0 && ends[1] >= 0;
}

static bool spawn_relay(char *helper, char *log, const int source[4]) {
    const int destinations[] = {STDOUT_FILENO, STDERR_FILENO, CHILD_STDOUT_READ, CHILD_STDERR_READ};
    posix_spawn_file_actions_t actions;
    if (posix_spawn_file_actions_init(&actions) != 0) {
        return false;
    }
    int status = 0;
    for (size_t i = 0; i < sizeof destinations / sizeof destinations[0] && status == 0; ++i) {
        status = posix_spawn_file_actions_adddup2(&actions, source[i], destinations[i]);
    }
    posix_spawnattr_t attributes;
    if (status == 0) {
        status = posix_spawnattr_init(&attributes);
        if (status == 0) {
            status = posix_spawnattr_setflags(&attributes, POSIX_SPAWN_CLOEXEC_DEFAULT);
            if (status == 0) {
                pid_t pid;
                char stdout_read[] = "3";
                char stderr_read[] = "4";
                char *const argv[] = {helper, log, stdout_read, stderr_read, NULL};
                char *const env[] = {NULL};
                status = posix_spawn(&pid, helper, &actions, &attributes, argv, env);
            }
            posix_spawnattr_destroy(&attributes);
        }
    }
    posix_spawn_file_actions_destroy(&actions);
    return status == 0;
}

static bool replace_fd(int source, int destination) {
    int result;
    do {
        result = dup2(source, destination);
    } while (result < 0 && errno == EINTR);
    return result >= 0;
}

bool azs_start_tracker_relay(const char *session_host) {
    char helper[PATH_MAX];
    char log[PATH_MAX];
    int length = snprintf(log, sizeof log, "%s/ui-diagnostics.log", session_host);
    if (length <= 0 || (size_t)length >= sizeof log || !relay_path(helper, sizeof helper)) {
        return false;
    }

    int saved_stdout = fcntl(STDOUT_FILENO, F_DUPFD_CLOEXEC, SOURCE_FD_MIN);
    int saved_stderr = fcntl(STDERR_FILENO, F_DUPFD_CLOEXEC, SOURCE_FD_MIN);
    int out[2] = {-1, -1};
    int err[2] = {-1, -1};
    bool redirected = false;
    if (saved_stdout >= 0 && saved_stderr >= 0 && create_relay_pipe(out) && create_relay_pipe(err)) {
        const int source[] = {saved_stdout, saved_stderr, out[0], err[0]};
        if (spawn_relay(helper, log, source) && replace_fd(out[1], STDOUT_FILENO)) {
            redirected = replace_fd(err[1], STDERR_FILENO);
            if (!redirected) {
                replace_fd(saved_stdout, STDOUT_FILENO);
            }
        }
    }
    close_fd(out[0]);
    close_fd(out[1]);
    close_fd(err[0]);
    close_fd(err[1]);
    close_fd(saved_stdout);
    close_fd(saved_stderr);
    return redirected;
}
