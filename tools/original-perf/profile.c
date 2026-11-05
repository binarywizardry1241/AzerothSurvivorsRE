#include "win32.h"

static DWORD default_setting(const wchar_t *name, const wchar_t *value) {
    /* An existing empty value is also a caller override. */
    SetLastError(ERROR_SUCCESS);
    if (GetEnvironmentVariableW(name, NULL, 0) != 0) {
        return ERROR_SUCCESS;
    }
    DWORD error = GetLastError();
    if (error != ERROR_ENVVAR_NOT_FOUND) {
        return error;
    }
    if (SetEnvironmentVariableW(name, value)) {
        return ERROR_SUCCESS;
    }
    return GetLastError();
}

/* Called in the launcher before starting the game with its inherited environment. */
EXPORT DWORD AzsApplyPerformanceProfile(void) {
    DWORD error = default_setting(L"WOW_RENDER_SCALE", L"0.75");
    if (error != ERROR_SUCCESS) {
        return error;
    }
    return default_setting(L"WOW_MSAA", L"1");
}
