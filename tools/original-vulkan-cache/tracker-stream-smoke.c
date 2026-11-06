/* Exercise tracker flushing without a Vulkan loader or a presented frame. */
#define _POSIX_C_SOURCE 200809L
#include "tracker.h"

#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

static bool heartbeat_visible(DIR *directory) {
    rewinddir(directory);
    struct dirent *entry;
    while ((entry = readdir(directory)) != NULL) {
        if (strncmp(entry->d_name, "tracker-", sizeof("tracker-") - 1) != 0) {
            continue;
        }
        int file = openat(dirfd(directory), entry->d_name, O_RDONLY);
        if (file < 0) {
            continue;
        }
        FILE *trace = fdopen(file, "r");
        if (!trace) {
            close(file);
            continue;
        }
        char line[512];
        bool recorded = false;
        bool heartbeat = false;
        while (fgets(line, sizeof line, trace)) {
            recorded = recorded || strstr(line, "\tcall=azsTrackerIdleSmoke\n") != NULL;
            heartbeat = heartbeat ||
                        strncmp(line, "# heartbeat\t", sizeof("# heartbeat\t") - 1) == 0;
        }
        fclose(trace);
        if (recorded && heartbeat) {
            return true;
        }
    }
    return false;
}

int main(int argc, char **argv) {
    if (argc != 2 || !azs_tracker_enabled()) {
        fputs("tracker idle smoke could not start recording\n", stderr);
        return EXIT_FAILURE;
    }

    AzsTrackEvent event;
    azs_track_begin(&event, "azsTrackerIdleSmoke", true);
    azs_track_end(&event, false);

    DIR *directory = opendir(argv[1]);
    if (!directory) {
        perror("open tracker idle smoke directory");
        return EXIT_FAILURE;
    }
    for (unsigned attempt = 0; attempt < 100; ++attempt) {
        if (heartbeat_visible(directory)) {
            closedir(directory);
            puts("Tracker heartbeat and buffered event readable before process exit.");
            return EXIT_SUCCESS;
        }
        const struct timespec interval = {.tv_nsec = 100000000L};
        nanosleep(&interval, NULL);
    }
    closedir(directory);
    fputs("tracker idle smoke timed out before a heartbeat flushed the event\n", stderr);
    return EXIT_FAILURE;
}
