#!/bin/sh
set -eu

source_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
project_root=$(git -C "$source_dir" rev-parse --show-toplevel)
output_dir="$project_root/runtime/original-perf"
compiler=${AZS_PERF_CLANG:-clang}
linker=${AZS_PERF_LLD_LINK:-}

if ! command -v "$compiler" >/dev/null 2>&1; then
    printf 'Clang is required. Set AZS_PERF_CLANG to its executable.\n' >&2
    exit 1
fi

if [ -z "$linker" ]; then
    if command -v lld-link >/dev/null 2>&1; then
        linker=lld-link
    elif command -v rust-lld >/dev/null 2>&1; then
        linker=rust-lld
    else
        # Linked worktrees can use the primary checkout's pinned Rust toolchain.
        git_common=$(git -C "$source_dir" rev-parse --path-format=absolute --git-common-dir)
        version=$(sed -n 's/^channel = "\([^"]*\)"$/\1/p' "$project_root/rust-toolchain.toml")
        for candidate in "${git_common%/*}/.tools/rust/$version-"*/lib/rustlib/*/bin/rust-lld; do
            if [ -x "$candidate" ]; then
                linker=$candidate
                break
            fi
        done
    fi
fi

if [ -z "$linker" ] || ! command -v "$linker" >/dev/null 2>&1; then
    printf 'A COFF linker is required. Set AZS_PERF_LLD_LINK to lld-link or rust-lld.\n' >&2
    exit 1
fi

link_coff() {
    case ${linker##*/} in
        rust-lld|rust-lld.exe) "$linker" -flavor link "$@" ;;
        *) "$linker" "$@" ;;
    esac
}

mkdir -p -- "$output_dir"
scratch=$(mktemp -d "$output_dir/.build.XXXXXXXX")
trap 'rm -rf -- "$scratch"' 0
trap 'exit 129' HUP
trap 'exit 130' INT
trap 'exit 143' TERM
TMPDIR=$scratch
export TMPDIR

compile() {
    "$compiler" --target=x86_64-pc-windows-msvc -std=c17 -O2 -ffreestanding \
        -Wall -Wextra -Wpedantic -Wstrict-prototypes -Werror \
        -c "$source_dir/$1.c" -o "$scratch/$1.obj"
}

link_image() {
    link_coff /machine:x64 /nodefaultlib /manifest:no /noimplib /opt:ref,icf \
        /fixed:no /dynamicbase /highentropyva /nxcompat /timestamp:0 /WX "$@"
}

link_coff /lib /machine:x64 /WX "/def:$source_dir/kernel32.def" "/out:$scratch/kernel32.lib"
link_coff /lib /machine:x64 /WX "/def:$source_dir/shell32.def" "/out:$scratch/shell32.lib"

compile profile
compile launcher

link_image /dll /noentry "/out:$scratch/AzsPerf.dll" \
    "$scratch/profile.obj" "$scratch/kernel32.lib"
link_image /subsystem:console /entry:azs_main "/out:$scratch/AzsPerfLaunch.exe" \
    "$scratch/launcher.obj" "$scratch/kernel32.lib" "$scratch/shell32.lib"

mv -f -- "$scratch/AzsPerf.dll" "$scratch/AzsPerfLaunch.exe" "$output_dir/"
printf '%s\n' "$output_dir/AzsPerf.dll" "$output_dir/AzsPerfLaunch.exe"
