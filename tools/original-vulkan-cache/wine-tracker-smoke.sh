#!/bin/sh
# Exercise the injected constructor through Wine's built-in cmd, never the game.
set -eu

if [ "$#" -ne 3 ]; then
    printf 'Usage: %s /absolute/wine-runtime /absolute/bootstrap.dylib /absolute/scratch\n' "$0" >&2
    exit 2
fi
for path do
    case "$path" in
        /*) ;;
        *) printf 'Wine smoke requires absolute paths.\n' >&2; exit 2 ;;
    esac
done

wine="$1/bin/wine"
wineserver="$1/bin/wineserver"
external="$1/lib/external"
cmd="$1/lib/wine/x86_64-windows/cmd.exe"
foreign="$1/lib/wine/x86_64-windows/whoami.exe"
bootstrap=$2
if [ ! -x "$wine" ] || [ ! -x "$wineserver" ] || [ ! -d "$external" ] ||
    [ ! -r "$cmd" ] || [ ! -r "$foreign" ] || [ ! -r "$bootstrap" ]; then
    printf 'Wine smoke requires the bundled runtime and tracker bootstrap.\n' >&2
    exit 1
fi

work="$3/wine-tracker-smoke"
prefix="$work/prefix"
cache="$work/cache"
host_tmp="$work/host-tmp"
mkdir -m 700 -- "$work" "$prefix" "$cache" "$host_tmp"
mkdir -m 700 -- "$prefix/dosdevices" "$prefix/drive_c"
ln -s ../drive_c "$prefix/dosdevices/c:"
ln -s / "$prefix/dosdevices/z:"
printf '%s\r\n' '@echo off' 'if defined WOW_MOVE_TRACE exit /b 51' 'exit /b 0' \
    > "$prefix/drive_c/azs-tracker-disabled.cmd"
printf '%s\r\n' '@echo off' 'if not defined WOW_MOVE_TRACE exit /b 52' \
    'echo AZS_CONFIG=%BENILLA_HOME%' 'echo AZS_SAVE=%WOW_ROGUE_SAVE%' \
    'echo AZS_TAGS=%WOW_MOVE_TRACE_TAGS%' 'echo AZS_TRACE_CHAT=%WOW_MOVE_TRACE_CHAT%' \
    'echo %AZS_WINE_SMOKE_MARKER%>"%WOW_MOVE_TRACE%"' \
    > "$prefix/drive_c/azs-tracker-write.cmd"

unset WOW_MOVE_TRACE WOW_MOVE_TRACE_TAGS WOW_MOVE_TRACE_CHAT
unset WINEARCH WINELOADER WINELOADERNOEXEC ROSETTA_X87_PATH ROSETTA_X87_JIT
unset DYLD_INSERT_LIBRARIES DYLD_LIBRARY_PATH
export WINEPREFIX="$prefix" WINESERVER="$wineserver" TMPDIR="$host_tmp"
export WINEDLLOVERRIDES='winemenubuilder.exe=d;mscoree=d;mshtml=d' WINEDEBUG=-all
export AZS_VK_CACHE_DIR="$cache" BENILLA_HOME=smoke-config WOW_ROGUE_SAVE=smoke-save
cd "$work"

cleanup_wine() {
    "$wineserver" -k >/dev/null 2>&1 || :
    "$wineserver" -w >/dev/null 2>&1 || :
}
trap 'cleanup_wine' 0
trap 'exit 129' HUP
trap 'exit 130' INT
trap 'exit 143' TERM

run_probe() {
    # dyld variables are assigned after the protected shell starts, as in WoWSilicon.
    TRACKER=$1 AZS_TRACKER_EXE=$2 AZS_WINE_SMOKE_MARKER=${4:-} /bin/sh -c '
        DYLD_INSERT_LIBRARIES="$1" DYLD_LIBRARY_PATH="$2" exec "$3" "$4" /d /c "$5"
    ' azs-wine-tracker-smoke "$bootstrap" "$external" "$wine" "$cmd" "$3"
}

disabled='C:\azs-tracker-disabled.cmd'
TRACKER_DETAIL=1 run_probe 0 "$cmd" "$disabled"
run_probe 1 "$foreign" "$disabled"
traces="$cache/traces"
test ! -e "$traces"

write_probe() {
    if ! output=$(TRACKER_DETAIL=$2 run_probe 1 "$cmd" 'C:\azs-tracker-write.cmd' "$1" 2>&1); then
        printf '%s\n' "$output" >&2
        return 1
    fi
    printf '%s\n' "$output" | grep -Fq 'AZS_CONFIG=smoke-config'
    printf '%s\n' "$output" | grep -Fq 'AZS_SAVE=smoke-save'
    printf '%s\n' "$output" | grep -Fq 'AZS_TRACE_CHAT=0'
    printf '%s\n' "$output" | tr -d '\r' | grep -Fxq "AZS_TAGS=$3"
}

write_probe azs-wine-tracker-first 0 'addon,fct,cd,use,move'
set -- "$traces"/session-*
test "$#" -eq 1
first="$1/gameplay.log"
grep -Fq azs-wine-tracker-first "$first"
first_hash=$(shasum -a 256 < "$first")

write_probe azs-wine-tracker-second 1 'addon,fct,cd,use,move,prs,snd,knb,gate,mmv,csp,spl,face,clmp,fx'
set -- "$traces"/session-*
test "$#" -eq 2
test "$first_hash" = "$(shasum -a 256 < "$first")"
if [ "$1/gameplay.log" = "$first" ]; then
    second="$2/gameplay.log"
else
    second="$1/gameplay.log"
fi
grep -Fq azs-wine-tracker-second "$second"
printf 'Wine tracker bootstrap verified off, foreign-target gating, preserved settings, and distinct gameplay logs.\n'
