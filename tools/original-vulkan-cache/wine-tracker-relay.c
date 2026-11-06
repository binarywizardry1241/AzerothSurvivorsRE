#define _POSIX_C_SOURCE 200809L
#define _DARWIN_C_SOURCE

#include <errno.h>
#include <fcntl.h>
#include <limits.h>
#include <poll.h>
#include <signal.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>

enum { LINE_LIMIT = 8192, LOG_LIMIT = 8 * 1024 * 1024 };

enum LineMode { BUFFERING, FORWARDING, SUPPRESSING };

struct Stream {
    int terminal;
    bool forward;
    enum LineMode mode;
    size_t used;
    char line[LINE_LIMIT];
};

struct Log {
    const char *path;
    int fd;
    size_t used;
    bool stopped;
};

static bool starts_with(const char *text, const char *prefix) {
    return strncmp(text, prefix, strlen(prefix)) == 0;
}

static bool ends_with(const char *text, const char *suffix) {
    size_t text_size = strlen(text);
    size_t suffix_size = strlen(suffix);
    return text_size >= suffix_size && strcmp(text + text_size - suffix_size, suffix) == 0;
}

/* The terminal receives the original bytes. Use a separate view for matching. */
static size_t plain_line(char plain[LINE_LIMIT + 1], const char *raw, size_t size) {
    size_t written = 0;
    for (size_t i = 0; i < size;) {
        if (raw[i] == '\033' && i + 1 < size && raw[i + 1] == '[') {
            size_t end = i + 2;
            while (end < size && raw[end] >= 0x20 && raw[end] <= 0x3f) {
                ++end;
            }
            if (end < size && raw[end] >= 0x40 && raw[end] <= 0x7e) {
                i = end + 1;
                continue;
            }
        }
        plain[written++] = raw[i++];
    }
    if (written && plain[written - 1] == '\r') {
        --written;
    }
    plain[written] = '\0';
    return written;
}

/* The Bevy formatter can prefix a UTC timestamp and a level before its target. */
static const char *tracing_target(const char *text) {
    text += strspn(text, " \t");
    size_t timestamp = strspn(text, "0123456789-+:TZ.");
    if (timestamp && (text[timestamp] == ' ' || text[timestamp] == '\t')) {
        text += timestamp;
        text += strspn(text, " \t");
    }
    static const char *const levels[] = {"TRACE", "DEBUG", "INFO", "WARN", "ERROR"};
    for (size_t i = 0; i < sizeof levels / sizeof levels[0]; ++i) {
        size_t length = strlen(levels[i]);
        if (starts_with(text, levels[i]) && (text[length] == ' ' || text[length] == '\t')) {
            text += length;
            text += strspn(text, " \t");
            break;
        }
    }
    return text;
}

static bool safe_pick(const char *message) {
    const char *alpha = strstr(message, " alpha=");
    if (!alpha) {
        return false;
    }
    alpha += sizeof " alpha=" - 1;
    size_t size = strspn(alpha, "0123456789.-+");
    if (!size || alpha[size] != ' ') {
        return false;
    }
    const char *content = alpha + size + 1;
    return strcmp(content, "frame-slot") == 0 || strcmp(content, "minimap") == 0 ||
           starts_with(content, "texture \"") || starts_with(content, "ModelPane {");
}

static bool selected_line(const char *line, bool *suppress) {
    static const char pick_prefix[] = "benilla_app::ui_script::extract: [ui-pick] ";
    const char *target = tracing_target(line);
    *suppress = starts_with(target, pick_prefix) || starts_with(target, "[ui-pick] ");
    if (*suppress) {
        return starts_with(target, pick_prefix) &&
               safe_pick(target + sizeof pick_prefix - 1);
    }
    if (starts_with(line, "[ui-handlers] ") || strcmp(line, "[ui-handlers]") == 0) {
        return true;
    }

    return starts_with(target, "benilla_app::ui_models: ui_models: tile built for ") ||
           (starts_with(target, "benilla_assets::adt: adt ") &&
            strstr(target, ": layer array ")) ||
           starts_with(target, "benilla_app::net::objects: gameobject spawn: ") ||
           starts_with(target, "benilla_app::net::objects: net: gameobject template ") ||
           starts_with(target, "benilla_app::entities::live_display: display swap: ") ||
           (starts_with(target, "benilla_app::ui_script::addons: ui_script: ") &&
            (ends_with(target, " ran") || ends_with(target, " frames materialized)")));
}

static bool write_all(int fd, const char *data, size_t size) {
    while (size) {
        ssize_t written = write(fd, data, size);
        if (written < 0 && errno == EINTR) {
            continue;
        }
        if (written <= 0) {
            return false;
        }
        data += written;
        size -= (size_t)written;
    }
    return true;
}

static void forward_bytes(struct Stream *stream, const char *data, size_t size) {
    if (stream->forward && !write_all(stream->terminal, data, size)) {
        stream->forward = false;
    }
}

static void save_line(struct Log *log, char line[LINE_LIMIT + 1], size_t size) {
    static const char limit_note[] = "# UI diagnostics size limit reached\n";
    if (log->stopped) {
        return;
    }
    if (size + 1 + sizeof limit_note - 1 > LOG_LIMIT - log->used) {
        if (log->fd >= 0) {
            write_all(log->fd, limit_note, sizeof limit_note - 1);
        }
        log->stopped = true;
        return;
    }
    if (log->fd < 0) {
        log->fd = open(log->path, O_WRONLY | O_CREAT | O_EXCL | O_NOFOLLOW | O_CLOEXEC, 0600);
        if (log->fd < 0) {
            log->stopped = true;
            return;
        }
    }
    line[size] = '\n';
    if (write_all(log->fd, line, size + 1)) {
        log->used += size + 1;
    } else {
        log->stopped = true;
    }
}

static bool inspect_line(struct Stream *stream, struct Log *log, bool complete) {
    char plain[LINE_LIMIT + 1];
    size_t size = plain_line(plain, stream->line, stream->used);
    bool suppress;
    bool selected = selected_line(plain, &suppress);
    if (complete && selected && !memchr(plain, '\0', size)) {
        save_line(log, plain, size);
    }
    return suppress;
}

static void consume(struct Stream *stream, struct Log *log, const char *data, size_t size) {
    while (size) {
        const char *newline = memchr(data, '\n', size);
        size_t part = newline ? (size_t)(newline - data) : size;
        if (stream->mode == BUFFERING) {
            size_t room = sizeof stream->line - stream->used;
            size_t copied = part < room ? part : room;
            memcpy(stream->line + stream->used, data, copied);
            stream->used += copied;
            data += copied;
            size -= copied;
            part -= copied;
            if (part) {
                if (inspect_line(stream, log, false)) {
                    stream->mode = SUPPRESSING;
                } else {
                    stream->mode = FORWARDING;
                    forward_bytes(stream, stream->line, stream->used);
                }
            }
        }
        if (stream->mode == FORWARDING) {
            forward_bytes(stream, data, part);
        }
        data += part;
        size -= part;
        if (newline) {
            if (stream->mode == BUFFERING && !inspect_line(stream, log, true)) {
                forward_bytes(stream, stream->line, stream->used);
                forward_bytes(stream, "\n", 1);
            } else if (stream->mode == FORWARDING) {
                forward_bytes(stream, "\n", 1);
            }
            stream->used = 0;
            stream->mode = BUFFERING;
            ++data;
            --size;
        }
    }
}

static int input_fd(const char *text) {
    char *end;
    errno = 0;
    long fd = strtol(text, &end, 10);
    if (end == text || *end || errno || fd <= STDERR_FILENO || fd > INT_MAX ||
        fcntl((int)fd, F_GETFD) < 0) {
        return -1;
    }
    return (int)fd;
}

int main(int argc, char **argv) {
    if (argc != 4) {
        return EXIT_FAILURE;
    }
    int input_out = input_fd(argv[2]);
    int input_err = input_fd(argv[3]);
    if (input_out < 0 || input_err < 0 || input_out == input_err) {
        return EXIT_FAILURE;
    }
    signal(SIGPIPE, SIG_IGN);
    umask(0077);
    struct Log log = {.path = argv[1], .fd = -1, .stopped = argv[1][0] != '/'};
    struct Stream streams[] = {
        {.terminal = STDOUT_FILENO, .forward = true},
        {.terminal = STDERR_FILENO, .forward = true},
    };
    struct pollfd inputs[] = {
        {.fd = input_out, .events = POLLIN},
        {.fd = input_err, .events = POLLIN},
    };
    int status = EXIT_SUCCESS;
    while (inputs[0].fd >= 0 || inputs[1].fd >= 0) {
        if (poll(inputs, sizeof inputs / sizeof inputs[0], -1) < 0) {
            if (errno == EINTR) {
                continue;
            }
            status = EXIT_FAILURE;
            break;
        }
        for (size_t i = 0; i < sizeof inputs / sizeof inputs[0]; ++i) {
            if (!inputs[i].revents) {
                continue;
            }
            char data[4096];
            ssize_t count = read(inputs[i].fd, data, sizeof data);
            if (count > 0) {
                consume(&streams[i], &log, data, (size_t)count);
                continue;
            }
            if (count < 0 && (errno == EINTR || errno == EAGAIN)) {
                continue;
            }
            struct Stream *stream = &streams[i];
            if (stream->mode == BUFFERING && stream->used && !inspect_line(stream, &log, true)) {
                forward_bytes(stream, stream->line, stream->used);
            }
            close(inputs[i].fd);
            inputs[i].fd = -1;
            if (count < 0) {
                status = EXIT_FAILURE;
            }
        }
    }
    if (log.fd >= 0) {
        close(log.fd);
    }
    return status;
}
