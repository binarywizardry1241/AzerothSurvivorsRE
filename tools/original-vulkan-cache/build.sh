#!/bin/sh
set -eu

source_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
project_root=$(git -C "$source_dir" rev-parse --show-toplevel)
runtime_dir="$project_root/runtime"
output_dir="$runtime_dir/original-vulkan-cache"
compiler=${AZS_VK_CLANG:-clang}
headers=${AZS_VULKAN_HEADERS:-}
registry=${AZS_VULKAN_REGISTRY:-}
header_version=1.4.321
header_sha=7c1874f9186d9e7d5245e279cdccaa77a66ed8f52871b428630aeb771dc7623c
manifest=VK_LAYER_AZS_pipeline_cache.json
library=libAzsVulkanCache.dylib

if [ "$#" -gt 0 ] && { [ "$#" -ne 2 ] || [ "$1" != --smoke ]; }; then
    printf 'Usage: %s [--smoke /path/to/WoWSilicon.app/Contents/Resources/Wine]\n' "$0" >&2
    exit 2
fi

mkdir -p -- "$runtime_dir"
scratch=$(mktemp -d "$runtime_dir/azs-vk-build.XXXXXXXX")
trap 'rm -rf -- "$scratch"' 0
trap 'exit 129' HUP
trap 'exit 130' INT
trap 'exit 143' TERM
TMPDIR=$scratch
export TMPDIR

if [ -z "$headers" ]; then
    archive="$scratch/headers.tar.gz"
    curl --fail --silent --show-error --location --max-time 90 \
        "https://codeload.github.com/KhronosGroup/Vulkan-Headers/tar.gz/refs/tags/v$header_version" \
        --output "$archive"
    printf '%s  %s\n' "$header_sha" "$archive" | shasum -a 256 -c -
    tar -xf "$archive" -C "$scratch" "Vulkan-Headers-$header_version/include" \
        "Vulkan-Headers-$header_version/registry/vk.xml"
    headers="$scratch/Vulkan-Headers-$header_version/include"
fi
if [ ! -f "$headers/vulkan/vk_layer.h" ]; then
    printf 'Set AZS_VULKAN_HEADERS to the Vulkan-Headers include directory.\n' >&2
    exit 1
fi
if [ -z "$registry" ]; then
    registry="$headers/../registry/vk.xml"
fi
if [ ! -f "$registry" ]; then
    printf 'Set AZS_VULKAN_REGISTRY to the matching Vulkan-Headers registry/vk.xml.\n' >&2
    exit 1
fi
python3 -B "$source_dir/gen-tracker.py" "$registry" "$scratch/tracker-generated.inc"

"$compiler" -arch x86_64 -std=c17 -O2 -dynamiclib -fvisibility=hidden -DVK_USE_PLATFORM_METAL_EXT \
    -Wall -Wextra -Wpedantic -Werror -I "$headers" -I "$scratch" \
    -Wl,-install_name,@rpath/"$library" \
    "$source_dir/layer.c" "$source_dir/cache_store.c" \
    "$source_dir/tracker.c" "$source_dir/tracker_details.c" -o "$scratch/$library"
cp -- "$source_dir/$manifest" "$scratch/$manifest"

if [ "$#" -eq 2 ]; then
    wine_dir=$2
    loader="$wine_dir/lib/external/libvulkan.1.dylib"
    icd="$wine_dir/lib/vulkan/icd.d/MoltenVK_icd.json"
    test -r "$loader" && test -r "$icd"
    "$compiler" -arch x86_64 -std=c17 -O2 -Wall -Wextra -Wpedantic -Werror \
        -I "$headers" "$source_dir/smoke.c" -o "$scratch/smoke"
    mkdir -m 700 -- "$scratch/test-cache"
    run_smoke() (
        tracker=$1
        shift
        unset TRACKER_DIR TRACKER_PATH
        VK_DRIVER_FILES="$icd" VK_ADD_LAYER_PATH="$scratch" \
            VK_INSTANCE_LAYERS=VK_LAYER_AZS_pipeline_cache \
            AZS_VK_CACHE_DIR="$scratch/test-cache" AZS_VK_CACHE_TRACE=1 \
            TRACKER="$tracker" \
            TRACKER_START_FRAME=0 TRACKER_FRAMES=0 TRACKER_MAX_MIB=64 \
            "$scratch/smoke" "$loader" "$@"
    )
    if ! cold=$(run_smoke 0 --checkpoint "$scratch/test-cache" 2>&1); then
        printf '%s\n' "$cold" >&2
        exit 1
    fi
    printf '%s\n' "$cold"
    printf '%s\n' "$cold" | grep -Fq 'observed live cache checkpoint; exiting without vkDestroyDevice'
    if printf '%s\n' "$cold" | grep -Fq 'device destroyed'; then
        printf 'Cold smoke unexpectedly used normal device teardown.\n' >&2
        exit 1
    fi
    trace_dir="$scratch/test-cache/traces"
    test ! -e "$trace_dir"
    run_warm_smoke() {
        if ! warm=$(run_smoke 1 2>&1); then
            printf '%s\n' "$warm" >&2
            return 1
        fi
        printf '%s\n' "$warm"
        printf '%s\n' "$warm" | grep -Eq 'loaded [1-9][0-9]* bytes'
        printf '%s\n' "$warm" | grep -Eq 'created cache with [1-9][0-9]* bytes of initial data'
        printf '%s\n' "$warm" | grep -Fq '2 null-cache calls redirected'
    }
    run_warm_smoke
    set -- "$trace_dir"/tracker-*.tsv
    test "$#" -eq 1
    test -s "$1"
    first_trace=$1
    first_hash=$(shasum -a 256 < "$first_trace")
    run_warm_smoke
    set -- "$trace_dir"/tracker-*.tsv
    test "$#" -eq 2
    test "$first_hash" = "$(shasum -a 256 < "$first_trace")"
    for trace do
        for call in vkCreateShaderModule vkCreateGraphicsPipelines vkCreateComputePipelines \
            vkAllocateCommandBuffers vkBeginCommandBuffer vkCmdBindPipeline vkCmdDispatch \
            vkCmdPipelineBarrier vkCmdBeginRenderPass vkCmdDraw vkCmdEndRenderPass \
            vkEndCommandBuffer vkQueueSubmit vkQueueWaitIdle; do
            if ! grep -Fq "call=$call" "$trace"; then
                printf 'Trace is missing %s in %s.\n' "$call" "$trace" >&2
                exit 1
            fi
        done
        grep -Eq 'call=vkCreateShaderModule.*code_fnv1a=0x[0-9a-f]+' "$trace"
        grep -Eq 'call=vkQueueSubmit.*pSubmits\.command\[0\]=0x[0-9a-f]+' "$trace"
    done

    "$compiler" -arch x86_64 -std=c17 -O2 -Wall -Wextra -Wpedantic -Werror \
        -DAZS_TRACKER_HEARTBEAT_SECONDS=1 "$source_dir/tracker.c" \
        "$source_dir/tracker-stream-smoke.c" -o "$scratch/tracker-stream-smoke"
    TRACKER=1 TRACKER_DIR="$scratch/test-traces" \
        TRACKER_START_FRAME=0 TRACKER_FRAMES=0 TRACKER_MAX_MIB=64 \
        "$scratch/tracker-stream-smoke" "$scratch/test-traces"
    printf 'Vulkan tracker verified disabled, unique across sessions, and readable while idle.\n'
fi

mkdir -p -- "$output_dir"
if [ ! -d "$output_dir/cache" ]; then
    mkdir -m 700 -- "$output_dir/cache"
fi
mv -f -- "$scratch/$library" "$scratch/$manifest" "$output_dir/"
printf '%s\n' "$output_dir/$library" "$output_dir/$manifest"
