#include "win32.h"

static wchar_t full_game[MAX_PATH_CHARS];
static wchar_t command[MAX_PATH_CHARS];
static wchar_t path[MAX_PATH_CHARS];

static void stderr_bytes(const char *message, DWORD count) {
    DWORD written;
    WriteFile(GetStdHandle((DWORD)-12), message, count, &written, NULL);
}

static void stderr_text(const char *message) {
    DWORD count = 0;
    while (message[count] != '\0') {
        ++count;
    }
    stderr_bytes(message, count);
}

static DWORD report_error(const char *operation, DWORD error) {
    char digits[10];
    DWORD cursor = sizeof digits;
    if (error == ERROR_SUCCESS) {
        error = ERROR_GEN_FAILURE;
    }
    DWORD value = error;
    do {
        digits[--cursor] = (char)('0' + value % 10);
        value /= 10;
    } while (value != 0);

    stderr_text("AzsPerfLaunch: ");
    stderr_text(operation);
    stderr_text(" failed (Windows error ");
    stderr_bytes(digits + cursor, (DWORD)sizeof digits - cursor);
    stderr_text(").\r\n");
    return error;
}

/* Windows treats the first token (argv[0]) specially. Keep the rest of the
 * command line so the game's own argument parser sees the caller's original quoting. */
static const wchar_t *game_command(const wchar_t *line) {
    BOOL quoted = 0;
    while (*line != L'\0') {
        if (*line == L'"') {
            quoted = !quoted;
        } else if (!quoted && (*line == L' ' || *line == L'\t')) {
            break;
        }
        ++line;
    }
    while (*line == L' ' || *line == L'\t') {
        ++line;
    }
    return line;
}

static DWORD apply_adjacent_profile(void) {
    static const wchar_t dll_name[] = L"AzsPerf.dll";
    DWORD size = GetModuleFileNameW(NULL, path, MAX_PATH_CHARS);
    if (size == 0) {
        return report_error("locating the launcher", GetLastError());
    }
    if (size >= MAX_PATH_CHARS) {
        return report_error("locating the launcher", ERROR_FILENAME_EXCED_RANGE);
    }

    while (size > 0 && path[size - 1] != L'\\' && path[size - 1] != L'/') {
        --size;
    }
    if (size == 0 || size + sizeof dll_name / sizeof dll_name[0] > MAX_PATH_CHARS) {
        return report_error("locating AzsPerf.dll", ERROR_FILENAME_EXCED_RANGE);
    }
    for (size_t i = 0; i < sizeof dll_name / sizeof dll_name[0]; ++i) {
        path[size + i] = dll_name[i];
    }

    HANDLE dll = LoadLibraryW(path);
    if (dll == NULL) {
        return report_error("loading adjacent AzsPerf.dll", GetLastError());
    }
    ApplyPerformanceProfile apply = (ApplyPerformanceProfile)GetProcAddress(dll, "AzsApplyPerformanceProfile");
    if (apply == NULL) {
        DWORD error = GetLastError();
        FreeLibrary(dll);
        return report_error("finding AzsApplyPerformanceProfile", error);
    }
    DWORD error = apply();
    FreeLibrary(dll);
    if (error != ERROR_SUCCESS) {
        return report_error("applying the performance profile", error);
    }
    return ERROR_SUCCESS;
}

static DWORD launch_game(void) {
    const wchar_t *line = GetCommandLineW();
    int count;
    wchar_t **args = CommandLineToArgvW(line, &count);
    if (args == NULL) {
        return report_error("reading arguments", GetLastError());
    }
    if (count < 2 || args[1][0] == L'\0') {
        LocalFree(args);
        stderr_text("Usage: AzsPerfLaunch.exe \"path\\AzerothSurvivors.exe\" [game arguments]\r\n");
        return ERROR_INVALID_PARAMETER;
    }

    wchar_t *game_name;
    DWORD size = GetFullPathNameW(args[1], MAX_PATH_CHARS, full_game, &game_name);
    DWORD path_error = GetLastError();
    LocalFree(args);
    if (size == 0) {
        return report_error("resolving the game path", path_error);
    }
    if (size >= MAX_PATH_CHARS || game_name == NULL) {
        return report_error("resolving the game file", ERROR_INVALID_PARAMETER);
    }

    const wchar_t *tail = game_command(line);
    size_t length = 0;
    while (tail[length] != L'\0' && length < MAX_PATH_CHARS - 1) {
        command[length] = tail[length];
        ++length;
    }
    if (tail[length] != L'\0') {
        return report_error("copying the game arguments", ERROR_INVALID_PARAMETER);
    }
    command[length] = L'\0';

    DWORD error = apply_adjacent_profile();
    if (error != ERROR_SUCCESS) {
        return error;
    }

    size_t directory_length = (size_t)(game_name - full_game);
    for (size_t i = 0; i < directory_length; ++i) {
        path[i] = full_game[i];
    }
    path[directory_length] = L'\0';

    static STARTUPINFO startup = {.size = sizeof(STARTUPINFO)};
    PROCESSINFO process;
    if (!CreateProcessW(full_game, command, NULL, NULL, 0, 0, NULL, path, &startup, &process)) {
        return report_error("starting the original game", GetLastError());
    }
    CloseHandle(process.thread);

    DWORD code;
    if (WaitForSingleObject(process.process, UINT32_MAX) != WAIT_OBJECT_0 ||
        !GetExitCodeProcess(process.process, &code)) {
        code = report_error("waiting for the original game", GetLastError());
    }
    CloseHandle(process.process);
    return code;
}

_Noreturn void azs_main(void) {
    ExitProcess(launch_game());
}
