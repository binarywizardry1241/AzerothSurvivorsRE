#ifndef AZS_PERF_WIN32_H
#define AZS_PERF_WIN32_H

#include <stddef.h>
#include <stdint.h>

/* The small Win64 ABI subset this freestanding pair uses. */
#define IMPORT __declspec(dllimport)
#define EXPORT __declspec(dllexport)
#define MAX_PATH_CHARS 32768

typedef uint32_t DWORD;
typedef int32_t BOOL;
typedef void *HANDLE;
typedef void (*PROC)(void);

typedef struct {
    DWORD size;
    wchar_t *reserved;
    wchar_t *desktop;
    wchar_t *title;
    DWORD x, y, width, height, columns, rows, fill, flags;
    uint16_t show, reserved_size;
    unsigned char *reserved_bytes;
    HANDLE stdin_handle, stdout_handle, stderr_handle;
} STARTUPINFO;

typedef struct {
    HANDLE process, thread;
    DWORD process_id, thread_id;
} PROCESSINFO;

#if defined(_WIN32)
_Static_assert(sizeof(wchar_t) == 2 && sizeof(STARTUPINFO) == 104, "Win64 STARTUPINFOW");
_Static_assert(offsetof(STARTUPINFO, stdin_handle) == 80, "Win64 standard handles");
_Static_assert(sizeof(PROCESSINFO) == 24, "Win64 PROCESS_INFORMATION");
#endif

enum {
    ERROR_SUCCESS = 0,
    ERROR_INVALID_PARAMETER = 87,
    ERROR_GEN_FAILURE = 31,
    ERROR_FILENAME_EXCED_RANGE = 206,
    ERROR_ENVVAR_NOT_FOUND = 203,
    WAIT_OBJECT_0 = 0,
};

IMPORT DWORD GetLastError(void);
IMPORT void SetLastError(DWORD error);
IMPORT DWORD GetEnvironmentVariableW(const wchar_t *name, wchar_t *value, DWORD capacity);
IMPORT BOOL SetEnvironmentVariableW(const wchar_t *name, const wchar_t *value);
IMPORT const wchar_t *GetCommandLineW(void);
IMPORT wchar_t **CommandLineToArgvW(const wchar_t *command, int *count);
IMPORT HANDLE LocalFree(HANDLE allocation);
IMPORT DWORD GetModuleFileNameW(HANDLE module, wchar_t *path, DWORD capacity);
IMPORT DWORD GetFullPathNameW(const wchar_t *path, DWORD capacity, wchar_t *full, wchar_t **file);
IMPORT HANDLE LoadLibraryW(const wchar_t *absolute_path);
IMPORT PROC GetProcAddress(HANDLE module, const char *name);
IMPORT BOOL FreeLibrary(HANDLE module);
IMPORT BOOL CreateProcessW(const wchar_t *application, wchar_t *command, void *process_security,
                           void *thread_security, BOOL inherit_handles, DWORD flags, void *environment,
                           const wchar_t *directory, STARTUPINFO *startup, PROCESSINFO *process);
IMPORT BOOL CloseHandle(HANDLE handle);
IMPORT DWORD WaitForSingleObject(HANDLE object, DWORD timeout);
IMPORT BOOL GetExitCodeProcess(HANDLE process, DWORD *code);
IMPORT HANDLE GetStdHandle(DWORD kind);
IMPORT BOOL WriteFile(HANDLE file, const void *data, DWORD length, DWORD *written, void *overlapped);
IMPORT _Noreturn void ExitProcess(DWORD code);

typedef DWORD (*ApplyPerformanceProfile)(void);

#endif
