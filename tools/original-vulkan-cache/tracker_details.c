#define VK_NO_PROTOTYPES
#include <vulkan/vulkan_core.h>

#include "tracker.h"

#include <inttypes.h>
#include <stdio.h>
#include <string.h>

enum { DETAIL_ITEMS = 4, DETAIL_KEY_SIZE = 96, MAX_NEXT_STRUCTURES = 16 };

#define U32(name, value) azs_trackf(event, "\t%s." name "=%" PRIu32, field, (uint32_t)(value))
#define I32(name, value) azs_trackf(event, "\t%s." name "=%" PRId32, field, (int32_t)(value))
#define U64(name, value) azs_trackf(event, "\t%s." name "=%" PRIu64, field, (uint64_t)(value))
#define HEX(name, value) azs_trackf(event, "\t%s." name "=0x%" PRIx64, field, (uint64_t)(value))
#define HANDLE(name, value) HEX(name, (uintptr_t)(value))
#define REAL(name, value) azs_trackf(event, "\t%s." name "=%.9g", field, (double)(value))

static size_t limit(size_t count) {
    return count < DETAIL_ITEMS ? count : DETAIL_ITEMS;
}

static void key(char out[DETAIL_KEY_SIZE], const char *field, const char *member) {
    snprintf(out, DETAIL_KEY_SIZE, "%s.%s", field, member);
}

static void index_key(char out[DETAIL_KEY_SIZE], const char *field, const char *member, size_t i) {
    snprintf(out, DETAIL_KEY_SIZE, "%s%s%s[%zu]", field, *member ? "." : "", member, i);
}

static const void *find_next(const void *head, VkStructureType type) {
    const VkBaseInStructure *next = head;
    for (unsigned n = 0; next && n < MAX_NEXT_STRUCTURES; ++n, next = next->pNext) {
        if (next->sType == type) {
            return next;
        }
    }
    return NULL;
}

static uint64_t fnv1a(const void *bytes, size_t length) {
    const unsigned char *data = bytes;
    uint64_t hash = UINT64_C(14695981039346656037);
    for (size_t i = 0; i < length; ++i) {
        hash = (hash ^ data[i]) * UINT64_C(1099511628211);
    }
    return hash;
}

static void instance_create(AzsTrackEvent *event, const char *field, const VkInstanceCreateInfo *info) {
    HEX("flags", info->flags);
    U32("extension_count", info->enabledExtensionCount);
    U32("layer_count", info->enabledLayerCount);
    if (info->pApplicationInfo) {
        U32("api_version", info->pApplicationInfo->apiVersion);
        U32("application_version", info->pApplicationInfo->applicationVersion);
        U32("engine_version", info->pApplicationInfo->engineVersion);
    }
    char child[DETAIL_KEY_SIZE];
    for (size_t i = 0; info->ppEnabledExtensionNames && i < limit(info->enabledExtensionCount); ++i) {
        index_key(child, field, "extension", i);
        azs_track_text(event, child, info->ppEnabledExtensionNames[i]);
    }
}

static void device_create(AzsTrackEvent *event, const char *field, const VkDeviceCreateInfo *info) {
    HEX("flags", info->flags);
    U32("extension_count", info->enabledExtensionCount);
    U32("queue_info_count", info->queueCreateInfoCount);
    char child[DETAIL_KEY_SIZE];
    for (size_t i = 0; info->ppEnabledExtensionNames && i < limit(info->enabledExtensionCount); ++i) {
        index_key(child, field, "extension", i);
        azs_track_text(event, child, info->ppEnabledExtensionNames[i]);
    }
    for (size_t i = 0; info->pQueueCreateInfos && i < limit(info->queueCreateInfoCount); ++i) {
        const VkDeviceQueueCreateInfo *queue = &info->pQueueCreateInfos[i];
        azs_trackf(event, "\t%s.queue[%zu]=%" PRIu32 ",%" PRIu32 ",0x%" PRIx32, field, i,
                   queue->queueFamilyIndex, queue->queueCount, queue->flags);
    }
}

static void shader(AzsTrackEvent *event, const char *field, const VkShaderModuleCreateInfo *info) {
    U64("code_size", info->codeSize);
    if (info->pCode && info->codeSize && info->codeSize <= 16u * 1024u * 1024u) {
        HEX("code_fnv1a", fnv1a(info->pCode, info->codeSize));
    }
}

static void stage(AzsTrackEvent *event, const char *field, const VkPipelineShaderStageCreateInfo *info) {
    HEX("stage", info->stage);
    HEX("flags", info->flags);
    HANDLE("module", info->module);
    char child[DETAIL_KEY_SIZE];
    if (info->pName) {
        key(child, field, "entry");
        azs_track_text(event, child, info->pName);
    }
    if (info->pSpecializationInfo) {
        const VkSpecializationInfo *spec = info->pSpecializationInfo;
        U32("specialization_count", spec->mapEntryCount);
        U64("specialization_size", spec->dataSize);
        if (spec->pData && spec->dataSize && spec->dataSize <= 64u * 1024u) {
            HEX("specialization_fnv1a", fnv1a(spec->pData, spec->dataSize));
        }
        for (size_t i = 0; spec->pMapEntries && i < limit(spec->mapEntryCount); ++i) {
            const VkSpecializationMapEntry *entry = &spec->pMapEntries[i];
            azs_trackf(event, "\t%s.specialization[%zu]=%" PRIu32 ",%" PRIu32 ",%zu",
                       field, i, entry->constantID, entry->offset, entry->size);
        }
    }
    const VkShaderModuleCreateInfo *inline_module =
        find_next(info->pNext, VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO);
    if (inline_module) {
        key(child, field, "inline_module");
        shader(event, child, inline_module);
    }
}

static void stencil(AzsTrackEvent *event, const char *field, const VkStencilOpState *state) {
    I32("fail", state->failOp);
    I32("pass", state->passOp);
    I32("depth_fail", state->depthFailOp);
    I32("compare", state->compareOp);
    HEX("compare_mask", state->compareMask);
    HEX("write_mask", state->writeMask);
    U32("reference", state->reference);
}

static void render_formats(AzsTrackEvent *event, const char *field, const VkPipelineRenderingCreateInfo *info) {
    HEX("view_mask", info->viewMask);
    U32("color_count", info->colorAttachmentCount);
    for (size_t i = 0; info->pColorAttachmentFormats && i < limit(info->colorAttachmentCount); ++i) {
        azs_trackf(event, "\t%s.color_format[%zu]=%" PRId32, field, i,
                   (int32_t)info->pColorAttachmentFormats[i]);
    }
    I32("depth_format", info->depthAttachmentFormat);
    I32("stencil_format", info->stencilAttachmentFormat);
}

static void graphics(AzsTrackEvent *event, const char *field, const VkGraphicsPipelineCreateInfo *info) {
    HEX("flags", info->flags);
    HANDLE("layout", info->layout);
    HANDLE("render_pass", info->renderPass);
    U32("subpass", info->subpass);
    U32("stage_count", info->stageCount);
    const VkGraphicsPipelineLibraryCreateInfoEXT *library =
        find_next(info->pNext, VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_LIBRARY_CREATE_INFO_EXT);
    const VkPipelineLibraryCreateInfoKHR *linked =
        find_next(info->pNext, VK_STRUCTURE_TYPE_PIPELINE_LIBRARY_CREATE_INFO_KHR);
    if (library || linked) {
        /* Partial pipelines can leave omitted state unspecified. */
        if (library) {
            HEX("library_flags", library->flags);
        }
        if (linked) {
            U32("linked_library_count", linked->libraryCount);
        }
        return;
    }
    char child[DETAIL_KEY_SIZE];
    VkShaderStageFlags stages = 0;
    for (size_t i = 0; info->pStages && i < info->stageCount && i < 8; ++i) {
        stages |= info->pStages[i].stage;
        if (i < DETAIL_ITEMS) {
            index_key(child, field, "stage", i);
            stage(event, child, &info->pStages[i]);
        }
    }

    const VkPipelineRenderingCreateInfo *formats =
        find_next(info->pNext, VK_STRUCTURE_TYPE_PIPELINE_RENDERING_CREATE_INFO);
    if (formats) {
        key(child, field, "formats");
        render_formats(event, child, formats);
    }
    bool dynamic_vertex = false;
    bool dynamic_blend_enable = false;
    bool dynamic_blend_equation = false;
    bool dynamic_write_mask = false;
    if (info->pDynamicState) {
        const VkPipelineDynamicStateCreateInfo *dynamic = info->pDynamicState;
        U32("dynamic_count", dynamic->dynamicStateCount);
        for (size_t i = 0; dynamic->pDynamicStates && i < dynamic->dynamicStateCount && i < 128; ++i) {
            VkDynamicState setting = dynamic->pDynamicStates[i];
            dynamic_vertex |= setting == VK_DYNAMIC_STATE_VERTEX_INPUT_EXT;
            dynamic_blend_enable |= setting == VK_DYNAMIC_STATE_COLOR_BLEND_ENABLE_EXT;
            dynamic_blend_equation |= setting == VK_DYNAMIC_STATE_COLOR_BLEND_EQUATION_EXT;
            dynamic_write_mask |= setting == VK_DYNAMIC_STATE_COLOR_WRITE_MASK_EXT;
            if (i < 16) {
                azs_trackf(event, "\t%s.dynamic[%zu]=%" PRId32, field, i, (int32_t)setting);
            }
        }
    }
    bool mesh = (stages & VK_SHADER_STAGE_MESH_BIT_EXT) != 0;
    if (!mesh && info->pInputAssemblyState) {
        I32("topology", info->pInputAssemblyState->topology);
        U32("primitive_restart", info->pInputAssemblyState->primitiveRestartEnable);
    }
    if (!mesh && !dynamic_vertex && info->pVertexInputState) {
        const VkPipelineVertexInputStateCreateInfo *vertex = info->pVertexInputState;
        U32("vertex_binding_count", vertex->vertexBindingDescriptionCount);
        U32("vertex_attribute_count", vertex->vertexAttributeDescriptionCount);
        for (size_t i = 0; vertex->pVertexBindingDescriptions && i < limit(vertex->vertexBindingDescriptionCount); ++i) {
            const VkVertexInputBindingDescription *binding = &vertex->pVertexBindingDescriptions[i];
            azs_trackf(event, "\t%s.vertex_binding[%zu]=%" PRIu32 ",%" PRIu32 ",%" PRId32,
                       field, i, binding->binding, binding->stride, (int32_t)binding->inputRate);
        }
        for (size_t i = 0; vertex->pVertexAttributeDescriptions && i < limit(vertex->vertexAttributeDescriptionCount); ++i) {
            const VkVertexInputAttributeDescription *attribute = &vertex->pVertexAttributeDescriptions[i];
            azs_trackf(event, "\t%s.vertex_attribute[%zu]=%" PRIu32 ",%" PRIu32 ",%" PRId32 ",%" PRIu32,
                       field, i, attribute->location, attribute->binding, (int32_t)attribute->format,
                       attribute->offset);
        }
    }
    if (info->pTessellationState &&
        (stages & (VK_SHADER_STAGE_TESSELLATION_CONTROL_BIT | VK_SHADER_STAGE_TESSELLATION_EVALUATION_BIT))) {
        U32("patch_points", info->pTessellationState->patchControlPoints);
    }
    if (info->pRasterizationState) {
        const VkPipelineRasterizationStateCreateInfo *raster = info->pRasterizationState;
        U32("depth_clamp", raster->depthClampEnable);
        U32("rasterizer_discard", raster->rasterizerDiscardEnable);
        I32("polygon_mode", raster->polygonMode);
        HEX("cull_mode", raster->cullMode);
        I32("front_face", raster->frontFace);
        U32("depth_bias_enable", raster->depthBiasEnable);
        REAL("depth_bias_constant", raster->depthBiasConstantFactor);
        REAL("depth_bias_clamp", raster->depthBiasClamp);
        REAL("depth_bias_slope", raster->depthBiasSlopeFactor);
        REAL("line_width", raster->lineWidth);
        if (raster->rasterizerDiscardEnable) {
            return;
        }
    }
    if (info->pViewportState) {
        U32("viewport_count", info->pViewportState->viewportCount);
        U32("scissor_count", info->pViewportState->scissorCount);
    }
    if (info->pMultisampleState) {
        const VkPipelineMultisampleStateCreateInfo *sample = info->pMultisampleState;
        HEX("samples", sample->rasterizationSamples);
        U32("sample_shading", sample->sampleShadingEnable);
        REAL("min_sample_shading", sample->minSampleShading);
        U32("alpha_to_coverage", sample->alphaToCoverageEnable);
        U32("alpha_to_one", sample->alphaToOneEnable);
    }
    if (info->pDepthStencilState && (!formats ||
        formats->depthAttachmentFormat != VK_FORMAT_UNDEFINED || formats->stencilAttachmentFormat != VK_FORMAT_UNDEFINED)) {
        const VkPipelineDepthStencilStateCreateInfo *depth = info->pDepthStencilState;
        U32("depth_test", depth->depthTestEnable);
        U32("depth_write", depth->depthWriteEnable);
        I32("depth_compare", depth->depthCompareOp);
        U32("depth_bounds_test", depth->depthBoundsTestEnable);
        REAL("min_depth_bounds", depth->minDepthBounds);
        REAL("max_depth_bounds", depth->maxDepthBounds);
        U32("stencil_test", depth->stencilTestEnable);
        if (depth->stencilTestEnable) {
            key(child, field, "front_stencil");
            stencil(event, child, &depth->front);
            key(child, field, "back_stencil");
            stencil(event, child, &depth->back);
        }
    }
    if (info->pColorBlendState && (!formats || formats->colorAttachmentCount)) {
        const VkPipelineColorBlendStateCreateInfo *blend = info->pColorBlendState;
        U32("logic_op_enable", blend->logicOpEnable);
        I32("logic_op", blend->logicOp);
        U32("blend_count", blend->attachmentCount);
        if (dynamic_blend_enable && dynamic_blend_equation && dynamic_write_mask) {
            return;
        }
        for (size_t i = 0; blend->pAttachments && i < limit(blend->attachmentCount); ++i) {
            const VkPipelineColorBlendAttachmentState *a = &blend->pAttachments[i];
            azs_trackf(event, "\t%s.blend[%zu]=%" PRIu32 ",%" PRId32 ",%" PRId32 ",%" PRId32
                       ",%" PRId32 ",%" PRId32 ",%" PRId32 ",0x%" PRIx32,
                       field, i, a->blendEnable, (int32_t)a->srcColorBlendFactor,
                       (int32_t)a->dstColorBlendFactor, (int32_t)a->colorBlendOp,
                       (int32_t)a->srcAlphaBlendFactor, (int32_t)a->dstAlphaBlendFactor,
                       (int32_t)a->alphaBlendOp, a->colorWriteMask);
        }
    }
}

static void compute(AzsTrackEvent *event, const char *field, const VkComputePipelineCreateInfo *info) {
    HEX("flags", info->flags);
    HANDLE("layout", info->layout);
    char child[DETAIL_KEY_SIZE];
    key(child, field, "stage");
    stage(event, child, &info->stage);
}

static void image(AzsTrackEvent *event, const char *field, const VkImageCreateInfo *info) {
    HEX("flags", info->flags);
    I32("type", info->imageType);
    I32("format", info->format);
    U32("width", info->extent.width);
    U32("height", info->extent.height);
    U32("depth", info->extent.depth);
    U32("mip_levels", info->mipLevels);
    U32("array_layers", info->arrayLayers);
    HEX("samples", info->samples);
    I32("tiling", info->tiling);
    HEX("usage", info->usage);
    I32("sharing", info->sharingMode);
    I32("initial_layout", info->initialLayout);
}

static void subresource_range(AzsTrackEvent *event, const char *field, const VkImageSubresourceRange *info) {
    HEX("aspect", info->aspectMask);
    U32("base_mip", info->baseMipLevel);
    U32("mip_count", info->levelCount);
    U32("base_layer", info->baseArrayLayer);
    U32("layer_count", info->layerCount);
}

static void view(AzsTrackEvent *event, const char *field, const VkImageViewCreateInfo *info) {
    HEX("flags", info->flags);
    HANDLE("image", info->image);
    I32("type", info->viewType);
    I32("format", info->format);
    azs_trackf(event, "\t%s.swizzle=%" PRId32 ",%" PRId32 ",%" PRId32 ",%" PRId32,
               field, (int32_t)info->components.r, (int32_t)info->components.g,
               (int32_t)info->components.b, (int32_t)info->components.a);
    subresource_range(event, field, &info->subresourceRange);
}

static void buffer(AzsTrackEvent *event, const char *field, const VkBufferCreateInfo *info) {
    HEX("flags", info->flags);
    U64("size", info->size);
    HEX("usage", info->usage);
    I32("sharing", info->sharingMode);
}

static void buffer_view(AzsTrackEvent *event, const char *field, const VkBufferViewCreateInfo *info) {
    HANDLE("buffer", info->buffer);
    I32("format", info->format);
    U64("offset", info->offset);
    U64("range", info->range);
}

static void sampler(AzsTrackEvent *event, const char *field, const VkSamplerCreateInfo *info) {
    I32("mag_filter", info->magFilter);
    I32("min_filter", info->minFilter);
    I32("mipmap_mode", info->mipmapMode);
    I32("address_u", info->addressModeU);
    I32("address_v", info->addressModeV);
    I32("address_w", info->addressModeW);
    REAL("mip_lod_bias", info->mipLodBias);
    REAL("min_lod", info->minLod);
    REAL("max_lod", info->maxLod);
    U32("anisotropy", info->anisotropyEnable);
    REAL("max_anisotropy", info->maxAnisotropy);
    U32("compare_enable", info->compareEnable);
    I32("compare_op", info->compareOp);
    I32("border_color", info->borderColor);
    U32("unnormalized_coordinates", info->unnormalizedCoordinates);
}

static void framebuffer(AzsTrackEvent *event, const char *field, const VkFramebufferCreateInfo *info) {
    HEX("flags", info->flags);
    HANDLE("render_pass", info->renderPass);
    U32("width", info->width);
    U32("height", info->height);
    U32("layers", info->layers);
    U32("attachment_count", info->attachmentCount);
    if (info->flags & VK_FRAMEBUFFER_CREATE_IMAGELESS_BIT) {
        return;
    }
    for (size_t i = 0; info->pAttachments && i < limit(info->attachmentCount); ++i) {
        azs_trackf(event, "\t%s.view[%zu]=0x%" PRIx64, field, i, (uint64_t)(uintptr_t)info->pAttachments[i]);
    }
}

#define ATTACHMENT_VALUES(a) (int32_t)(a)->format, (uint32_t)(a)->samples, \
    (int32_t)(a)->loadOp, (int32_t)(a)->storeOp, (int32_t)(a)->stencilLoadOp, \
    (int32_t)(a)->stencilStoreOp, (int32_t)(a)->initialLayout, (int32_t)(a)->finalLayout

#define RENDER_PASS_ATTACHMENTS(info) \
    HEX("flags", (info)->flags); \
    U32("attachment_count", (info)->attachmentCount); \
    U32("subpass_count", (info)->subpassCount); \
    U32("dependency_count", (info)->dependencyCount); \
    for (size_t i = 0; (info)->pAttachments && i < limit((info)->attachmentCount); ++i) { \
        azs_trackf(event, "\t%s.attachment[%zu]=%" PRId32 ",%" PRIu32 ",%" PRId32 \
                   ",%" PRId32 ",%" PRId32 ",%" PRId32 ",%" PRId32 ",%" PRId32, \
                   field, i, ATTACHMENT_VALUES(&(info)->pAttachments[i])); \
    }

#define RENDER_PASS_SUBPASS(s, idx) \
    azs_trackf(event, "\t%s.subpass[%zu].color_count=%" PRIu32 \
               "\t%s.subpass[%zu].input_count=%" PRIu32, \
               field, idx, (s)->colorAttachmentCount, field, idx, (s)->inputAttachmentCount); \
    for (size_t j = 0; (s)->pColorAttachments && j < limit((s)->colorAttachmentCount); ++j) { \
        azs_trackf(event, "\t%s.subpass[%zu].color[%zu]=%" PRIu32 ",%" PRId32, field, idx, j, \
                   (s)->pColorAttachments[j].attachment, (int32_t)(s)->pColorAttachments[j].layout); \
    } \
    for (size_t j = 0; (s)->pResolveAttachments && j < limit((s)->colorAttachmentCount); ++j) { \
        azs_trackf(event, "\t%s.subpass[%zu].resolve[%zu]=%" PRIu32 ",%" PRId32, field, idx, j, \
                   (s)->pResolveAttachments[j].attachment, (int32_t)(s)->pResolveAttachments[j].layout); \
    } \
    if ((s)->pDepthStencilAttachment) { \
        azs_trackf(event, "\t%s.subpass[%zu].depth_stencil=%" PRIu32 ",%" PRId32, field, idx, \
                   (s)->pDepthStencilAttachment->attachment, (int32_t)(s)->pDepthStencilAttachment->layout); \
    }

static void render_pass(AzsTrackEvent *event, const char *field, const VkRenderPassCreateInfo *info) {
    RENDER_PASS_ATTACHMENTS(info)
    for (size_t i = 0; info->pSubpasses && i < limit(info->subpassCount); ++i) {
        const VkSubpassDescription *subpass = &info->pSubpasses[i];
        RENDER_PASS_SUBPASS(subpass, i)
    }
}

static void render_pass2(AzsTrackEvent *event, const char *field, const VkRenderPassCreateInfo2 *info) {
    RENDER_PASS_ATTACHMENTS(info)
    for (size_t i = 0; info->pSubpasses && i < limit(info->subpassCount); ++i) {
        const VkSubpassDescription2 *subpass = &info->pSubpasses[i];
        RENDER_PASS_SUBPASS(subpass, i)
        azs_trackf(event, "\t%s.subpass[%zu].view_mask=0x%" PRIx32, field, i, subpass->viewMask);
    }
}

static void rect(AzsTrackEvent *event, const char *field, const VkRect2D *info) {
    I32("x", info->offset.x);
    I32("y", info->offset.y);
    U32("width", info->extent.width);
    U32("height", info->extent.height);
}

static void viewport(AzsTrackEvent *event, const char *field, const VkViewport *info) {
    REAL("x", info->x);
    REAL("y", info->y);
    REAL("width", info->width);
    REAL("height", info->height);
    REAL("min_depth", info->minDepth);
    REAL("max_depth", info->maxDepth);
}

static void begin_pass(AzsTrackEvent *event, const char *field, const VkRenderPassBeginInfo *info) {
    HANDLE("render_pass", info->renderPass);
    HANDLE("framebuffer", info->framebuffer);
    U32("clear_count", info->clearValueCount);
    rect(event, field, &info->renderArea);
    const VkRenderPassAttachmentBeginInfo *attachments =
        find_next(info->pNext, VK_STRUCTURE_TYPE_RENDER_PASS_ATTACHMENT_BEGIN_INFO);
    if (attachments) {
        U32("attachment_count", attachments->attachmentCount);
        for (size_t i = 0; attachments->pAttachments && i < limit(attachments->attachmentCount); ++i) {
            azs_trackf(event, "\t%s.view[%zu]=0x%" PRIx64, field, i,
                       (uint64_t)(uintptr_t)attachments->pAttachments[i]);
        }
    }
}

static void rendering_attachment(AzsTrackEvent *event, const char *field, const VkRenderingAttachmentInfo *info) {
    HANDLE("view", info->imageView);
    if (info->imageView == VK_NULL_HANDLE) {
        return;
    }
    I32("layout", info->imageLayout);
    I32("load", info->loadOp);
    I32("store", info->storeOp);
    HEX("resolve_mode", info->resolveMode);
    if (info->resolveMode != VK_RESOLVE_MODE_NONE) {
        HANDLE("resolve_view", info->resolveImageView);
        I32("resolve_layout", info->resolveImageLayout);
    }
}

static void rendering(AzsTrackEvent *event, const char *field, const VkRenderingInfo *info) {
    HEX("flags", info->flags);
    HEX("view_mask", info->viewMask);
    U32("layer_count", info->layerCount);
    U32("color_count", info->colorAttachmentCount);
    rect(event, field, &info->renderArea);
    char child[DETAIL_KEY_SIZE];
    for (size_t i = 0; info->pColorAttachments && i < limit(info->colorAttachmentCount); ++i) {
        index_key(child, field, "color", i);
        rendering_attachment(event, child, &info->pColorAttachments[i]);
    }
    if (info->pDepthAttachment) {
        key(child, field, "depth");
        rendering_attachment(event, child, info->pDepthAttachment);
    }
    if (info->pStencilAttachment) {
        key(child, field, "stencil");
        rendering_attachment(event, child, info->pStencilAttachment);
    }
}

static void submit(AzsTrackEvent *event, const char *field, const VkSubmitInfo *info) {
    U32("wait_count", info->waitSemaphoreCount);
    U32("command_count", info->commandBufferCount);
    U32("signal_count", info->signalSemaphoreCount);
    for (size_t i = 0; info->pWaitSemaphores && i < limit(info->waitSemaphoreCount); ++i) {
        azs_trackf(event, "\t%s.wait[%zu]=0x%" PRIx64, field, i,
                   (uint64_t)(uintptr_t)info->pWaitSemaphores[i]);
        if (info->pWaitDstStageMask) {
            azs_trackf(event, "\t%s.wait_stage[%zu]=0x%" PRIx32, field, i, info->pWaitDstStageMask[i]);
        }
    }
    for (size_t i = 0; info->pCommandBuffers && i < limit(info->commandBufferCount); ++i) {
        azs_trackf(event, "\t%s.command[%zu]=0x%" PRIx64, field, i,
                   (uint64_t)(uintptr_t)info->pCommandBuffers[i]);
    }
    for (size_t i = 0; info->pSignalSemaphores && i < limit(info->signalSemaphoreCount); ++i) {
        azs_trackf(event, "\t%s.signal[%zu]=0x%" PRIx64, field, i,
                   (uint64_t)(uintptr_t)info->pSignalSemaphores[i]);
    }
    const VkTimelineSemaphoreSubmitInfo *timeline =
        find_next(info->pNext, VK_STRUCTURE_TYPE_TIMELINE_SEMAPHORE_SUBMIT_INFO);
    if (timeline) {
        for (size_t i = 0; timeline->pWaitSemaphoreValues && i < limit(timeline->waitSemaphoreValueCount); ++i) {
            azs_trackf(event, "\t%s.wait_value[%zu]=%" PRIu64, field, i, timeline->pWaitSemaphoreValues[i]);
        }
        for (size_t i = 0; timeline->pSignalSemaphoreValues && i < limit(timeline->signalSemaphoreValueCount); ++i) {
            azs_trackf(event, "\t%s.signal_value[%zu]=%" PRIu64, field, i, timeline->pSignalSemaphoreValues[i]);
        }
    }
}

static void semaphore_submit(AzsTrackEvent *event, const char *field, const VkSemaphoreSubmitInfo *info) {
    HANDLE("semaphore", info->semaphore);
    U64("value", info->value);
    HEX("stage", info->stageMask);
    U32("device_index", info->deviceIndex);
}

static void submit2(AzsTrackEvent *event, const char *field, const VkSubmitInfo2 *info) {
    HEX("flags", info->flags);
    U32("wait_count", info->waitSemaphoreInfoCount);
    U32("command_count", info->commandBufferInfoCount);
    U32("signal_count", info->signalSemaphoreInfoCount);
    char child[DETAIL_KEY_SIZE];
    for (size_t i = 0; info->pWaitSemaphoreInfos && i < limit(info->waitSemaphoreInfoCount); ++i) {
        index_key(child, field, "wait", i);
        semaphore_submit(event, child, &info->pWaitSemaphoreInfos[i]);
    }
    for (size_t i = 0; info->pCommandBufferInfos && i < limit(info->commandBufferInfoCount); ++i) {
        const VkCommandBufferSubmitInfo *command = &info->pCommandBufferInfos[i];
        azs_trackf(event, "\t%s.command[%zu]=0x%" PRIx64 ",0x%" PRIx32, field, i,
                   (uint64_t)(uintptr_t)command->commandBuffer, command->deviceMask);
    }
    for (size_t i = 0; info->pSignalSemaphoreInfos && i < limit(info->signalSemaphoreInfoCount); ++i) {
        index_key(child, field, "signal", i);
        semaphore_submit(event, child, &info->pSignalSemaphoreInfos[i]);
    }
}

static void present(AzsTrackEvent *event, const char *field, const VkPresentInfoKHR *info) {
    U32("swapchain_count", info->swapchainCount);
    U32("wait_count", info->waitSemaphoreCount);
    for (size_t i = 0; info->pWaitSemaphores && i < limit(info->waitSemaphoreCount); ++i) {
        azs_trackf(event, "\t%s.wait[%zu]=0x%" PRIx64, field, i,
                   (uint64_t)(uintptr_t)info->pWaitSemaphores[i]);
    }
    for (size_t i = 0; info->pSwapchains && i < limit(info->swapchainCount); ++i) {
        azs_trackf(event, "\t%s.swapchain[%zu]=0x%" PRIx64, field, i,
                   (uint64_t)(uintptr_t)info->pSwapchains[i]);
        if (info->pImageIndices) {
            azs_trackf(event, "\t%s.image_index[%zu]=%" PRIu32, field, i, info->pImageIndices[i]);
        }
    }
}

static void swapchain(AzsTrackEvent *event, const char *field, const VkSwapchainCreateInfoKHR *info) {
    HEX("flags", info->flags);
    HANDLE("surface", info->surface);
    HANDLE("old_swapchain", info->oldSwapchain);
    U32("min_images", info->minImageCount);
    I32("format", info->imageFormat);
    I32("color_space", info->imageColorSpace);
    U32("width", info->imageExtent.width);
    U32("height", info->imageExtent.height);
    U32("array_layers", info->imageArrayLayers);
    HEX("usage", info->imageUsage);
    I32("present_mode", info->presentMode);
}

#define ACCESS(info) HEX("src_access", (info)->srcAccessMask); HEX("dst_access", (info)->dstAccessMask)
#define SYNC2(info) HEX("src_stage", (info)->srcStageMask); HEX("dst_stage", (info)->dstStageMask); ACCESS(info)
#define QUEUES(info) U32("src_queue", (info)->srcQueueFamilyIndex); U32("dst_queue", (info)->dstQueueFamilyIndex)
#define BUFFER_BARRIER(info) HANDLE("buffer", (info)->buffer); U64("offset", (info)->offset); U64("size", (info)->size)
#define IMAGE_BARRIER(info) HANDLE("image", (info)->image); I32("old_layout", (info)->oldLayout); \
    I32("new_layout", (info)->newLayout); subresource_range(event, field, &(info)->subresourceRange)

static void memory_barrier(AzsTrackEvent *event, const char *field, const VkMemoryBarrier *info) {
    ACCESS(info);
}

static void buffer_barrier(AzsTrackEvent *event, const char *field, const VkBufferMemoryBarrier *info) {
    ACCESS(info);
    QUEUES(info);
    BUFFER_BARRIER(info);
}

static void image_barrier(AzsTrackEvent *event, const char *field, const VkImageMemoryBarrier *info) {
    ACCESS(info);
    QUEUES(info);
    IMAGE_BARRIER(info);
}

static void memory_barrier2(AzsTrackEvent *event, const char *field, const VkMemoryBarrier2 *info) {
    SYNC2(info);
}

static void buffer_barrier2(AzsTrackEvent *event, const char *field, const VkBufferMemoryBarrier2 *info) {
    SYNC2(info);
    QUEUES(info);
    BUFFER_BARRIER(info);
}

static void image_barrier2(AzsTrackEvent *event, const char *field, const VkImageMemoryBarrier2 *info) {
    SYNC2(info);
    QUEUES(info);
    IMAGE_BARRIER(info);
}

static void dependency(AzsTrackEvent *event, const char *field, const VkDependencyInfo *info) {
    HEX("flags", info->dependencyFlags);
    U32("memory_barrier_count", info->memoryBarrierCount);
    U32("buffer_barrier_count", info->bufferMemoryBarrierCount);
    U32("image_barrier_count", info->imageMemoryBarrierCount);
    char child[DETAIL_KEY_SIZE];
    for (size_t i = 0; info->pMemoryBarriers && i < limit(info->memoryBarrierCount); ++i) {
        index_key(child, field, "memory", i);
        memory_barrier2(event, child, &info->pMemoryBarriers[i]);
    }
    for (size_t i = 0; info->pBufferMemoryBarriers && i < limit(info->bufferMemoryBarrierCount); ++i) {
        index_key(child, field, "buffer", i);
        buffer_barrier2(event, child, &info->pBufferMemoryBarriers[i]);
    }
    for (size_t i = 0; info->pImageMemoryBarriers && i < limit(info->imageMemoryBarrierCount); ++i) {
        index_key(child, field, "image", i);
        image_barrier2(event, child, &info->pImageMemoryBarriers[i]);
    }
}

static void descriptor_layout(AzsTrackEvent *event, const char *field, const VkDescriptorSetLayoutCreateInfo *info) {
    HEX("flags", info->flags);
    U32("binding_count", info->bindingCount);
    for (size_t i = 0; info->pBindings && i < limit(info->bindingCount); ++i) {
        const VkDescriptorSetLayoutBinding *binding = &info->pBindings[i];
        azs_trackf(event, "\t%s.binding[%zu]=%" PRIu32 ",%" PRId32 ",%" PRIu32 ",0x%" PRIx32,
                   field, i, binding->binding, (int32_t)binding->descriptorType,
                   binding->descriptorCount, binding->stageFlags);
    }
}

static void descriptor_alloc(AzsTrackEvent *event, const char *field, const VkDescriptorSetAllocateInfo *info) {
    HANDLE("pool", info->descriptorPool);
    U32("set_count", info->descriptorSetCount);
    for (size_t i = 0; info->pSetLayouts && i < limit(info->descriptorSetCount); ++i) {
        azs_trackf(event, "\t%s.layout[%zu]=0x%" PRIx64, field, i, (uint64_t)(uintptr_t)info->pSetLayouts[i]);
    }
}

static void descriptor_write(AzsTrackEvent *event, const char *field, const VkWriteDescriptorSet *info) {
    if (strncmp(event->name, "vkCmdPushDescriptorSet", sizeof "vkCmdPushDescriptorSet" - 1) != 0) {
        HANDLE("set", info->dstSet);
    }
    U32("binding", info->dstBinding);
    U32("element", info->dstArrayElement);
    U32("count", info->descriptorCount);
    I32("type", info->descriptorType);
    switch (info->descriptorType) {
    case VK_DESCRIPTOR_TYPE_SAMPLER:
    case VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER:
    case VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE:
    case VK_DESCRIPTOR_TYPE_STORAGE_IMAGE:
    case VK_DESCRIPTOR_TYPE_INPUT_ATTACHMENT:
        for (size_t i = 0; info->pImageInfo && i < limit(info->descriptorCount); ++i) {
            const VkDescriptorImageInfo *image_info = &info->pImageInfo[i];
            if (info->descriptorType == VK_DESCRIPTOR_TYPE_SAMPLER ||
                info->descriptorType == VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER) {
                azs_trackf(event, "\t%s.sampler[%zu]=0x%" PRIx64, field, i,
                           (uint64_t)(uintptr_t)image_info->sampler);
            }
            if (info->descriptorType != VK_DESCRIPTOR_TYPE_SAMPLER) {
                azs_trackf(event, "\t%s.view[%zu]=0x%" PRIx64 ",%" PRId32, field, i,
                           (uint64_t)(uintptr_t)image_info->imageView, (int32_t)image_info->imageLayout);
            }
        }
        break;
    case VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER:
    case VK_DESCRIPTOR_TYPE_STORAGE_BUFFER:
    case VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC:
    case VK_DESCRIPTOR_TYPE_STORAGE_BUFFER_DYNAMIC:
        for (size_t i = 0; info->pBufferInfo && i < limit(info->descriptorCount); ++i) {
            const VkDescriptorBufferInfo *buffer_info = &info->pBufferInfo[i];
            azs_trackf(event, "\t%s.buffer[%zu]=0x%" PRIx64 ",%" PRIu64 ",%" PRIu64,
                       field, i, (uint64_t)(uintptr_t)buffer_info->buffer,
                       buffer_info->offset, buffer_info->range);
        }
        break;
    case VK_DESCRIPTOR_TYPE_UNIFORM_TEXEL_BUFFER:
    case VK_DESCRIPTOR_TYPE_STORAGE_TEXEL_BUFFER:
        for (size_t i = 0; info->pTexelBufferView && i < limit(info->descriptorCount); ++i) {
            azs_trackf(event, "\t%s.buffer_view[%zu]=0x%" PRIx64, field, i,
                       (uint64_t)(uintptr_t)info->pTexelBufferView[i]);
        }
        break;
    default:
        break;
    }
}

static void descriptor_copy(AzsTrackEvent *event, const char *field, const VkCopyDescriptorSet *info) {
    HANDLE("src_set", info->srcSet);
    U32("src_binding", info->srcBinding);
    U32("src_element", info->srcArrayElement);
    HANDLE("dst_set", info->dstSet);
    U32("dst_binding", info->dstBinding);
    U32("dst_element", info->dstArrayElement);
    U32("count", info->descriptorCount);
}

static void pipeline_layout(AzsTrackEvent *event, const char *field, const VkPipelineLayoutCreateInfo *info) {
    U32("set_count", info->setLayoutCount);
    U32("push_range_count", info->pushConstantRangeCount);
    for (size_t i = 0; info->pSetLayouts && i < limit(info->setLayoutCount); ++i) {
        azs_trackf(event, "\t%s.set[%zu]=0x%" PRIx64, field, i, (uint64_t)(uintptr_t)info->pSetLayouts[i]);
    }
    for (size_t i = 0; info->pPushConstantRanges && i < limit(info->pushConstantRangeCount); ++i) {
        const VkPushConstantRange *range = &info->pPushConstantRanges[i];
        azs_trackf(event, "\t%s.push_range[%zu]=0x%" PRIx32 ",%" PRIu32 ",%" PRIu32,
                   field, i, range->stageFlags, range->offset, range->size);
    }
}

#define BUFFER_COPY(info) U64("src_offset", (info)->srcOffset); U64("dst_offset", (info)->dstOffset); \
    U64("size", (info)->size)

static void buffer_copy(AzsTrackEvent *event, const char *field, const VkBufferCopy *info) {
    BUFFER_COPY(info);
}

static void buffer_copy2(AzsTrackEvent *event, const char *field, const VkBufferCopy2 *info) {
    BUFFER_COPY(info);
}

#define EXTENT(info) U32("width", (info).width); U32("height", (info).height); U32("depth", (info).depth)
#define LAYERS(name, info) HEX(name ".aspect", (info).aspectMask); U32(name ".mip", (info).mipLevel); \
    U32(name ".base_layer", (info).baseArrayLayer); U32(name ".layer_count", (info).layerCount)
#define OFFSET(name, info) I32(name ".x", (info).x); I32(name ".y", (info).y); I32(name ".z", (info).z)
#define IMAGE_COPY(info) LAYERS("src", (info)->srcSubresource); LAYERS("dst", (info)->dstSubresource); \
    OFFSET("src_offset", (info)->srcOffset); OFFSET("dst_offset", (info)->dstOffset); EXTENT((info)->extent)
#define BUFFER_IMAGE_COPY(info) U64("buffer_offset", (info)->bufferOffset); \
    U32("row_length", (info)->bufferRowLength); U32("image_height", (info)->bufferImageHeight); \
    LAYERS("image", (info)->imageSubresource); OFFSET("image_offset", (info)->imageOffset); EXTENT((info)->imageExtent)

static void image_copy(AzsTrackEvent *event, const char *field, const VkImageCopy *info) {
    IMAGE_COPY(info);
}

static void image_copy2(AzsTrackEvent *event, const char *field, const VkImageCopy2 *info) {
    IMAGE_COPY(info);
}

static void buffer_image_copy(AzsTrackEvent *event, const char *field, const VkBufferImageCopy *info) {
    BUFFER_IMAGE_COPY(info);
}

static void buffer_image_copy2(AzsTrackEvent *event, const char *field, const VkBufferImageCopy2 *info) {
    BUFFER_IMAGE_COPY(info);
}

#define COPY_REGIONS(info, detail) \
    U32("region_count", (info)->regionCount); \
    for (size_t i = 0; (info)->pRegions && i < limit((info)->regionCount); ++i) { \
        char child[DETAIL_KEY_SIZE]; \
        index_key(child, field, "region", i); \
        detail(event, child, &(info)->pRegions[i]); \
    }

static void copy_buffer(AzsTrackEvent *event, const char *field, const VkCopyBufferInfo2 *info) {
    HANDLE("src_buffer", info->srcBuffer);
    HANDLE("dst_buffer", info->dstBuffer);
    COPY_REGIONS(info, buffer_copy2)
}

static void copy_image(AzsTrackEvent *event, const char *field, const VkCopyImageInfo2 *info) {
    HANDLE("src_image", info->srcImage);
    I32("src_layout", info->srcImageLayout);
    HANDLE("dst_image", info->dstImage);
    I32("dst_layout", info->dstImageLayout);
    COPY_REGIONS(info, image_copy2)
}

static void copy_buffer_to_image(AzsTrackEvent *event, const char *field, const VkCopyBufferToImageInfo2 *info) {
    HANDLE("src_buffer", info->srcBuffer);
    HANDLE("dst_image", info->dstImage);
    I32("dst_layout", info->dstImageLayout);
    COPY_REGIONS(info, buffer_image_copy2)
}

static void copy_image_to_buffer(AzsTrackEvent *event, const char *field, const VkCopyImageToBufferInfo2 *info) {
    HANDLE("src_image", info->srcImage);
    I32("src_layout", info->srcImageLayout);
    HANDLE("dst_buffer", info->dstBuffer);
    COPY_REGIONS(info, buffer_image_copy2)
}

static void command_alloc(AzsTrackEvent *event, const char *field, const VkCommandBufferAllocateInfo *info) {
    HANDLE("pool", info->commandPool);
    I32("level", info->level);
    U32("count", info->commandBufferCount);
}

static void command_begin(AzsTrackEvent *event, const char *field, const VkCommandBufferBeginInfo *info) {
    HEX("flags", info->flags);
}

static void command_pool(AzsTrackEvent *event, const char *field, const VkCommandPoolCreateInfo *info) {
    HEX("flags", info->flags);
    U32("queue_family", info->queueFamilyIndex);
}

static void debug_label(AzsTrackEvent *event, const char *field, const VkDebugUtilsLabelEXT *info) {
    char child[DETAIL_KEY_SIZE];
    key(child, field, "name");
    azs_track_text(event, child, info->pLabelName);
}

static void object_name(AzsTrackEvent *event, const char *field, const VkDebugUtilsObjectNameInfoEXT *info) {
    I32("object_type", info->objectType);
    HEX("object", info->objectHandle);
    char child[DETAIL_KEY_SIZE];
    key(child, field, "name");
    azs_track_text(event, child, info->pObjectName);
}

void azs_track_describe(AzsTrackEvent *event, const char *field, const char *type,
                        const void *data, size_t count) {
    if (!event->active || !data || !count) {
        return;
    }
#define DETAIL(struct_type, describe) \
    if (strcmp(type, #struct_type) == 0) { \
        const struct_type *values = data; \
        if (count > DETAIL_ITEMS) { U64("trace_count", count); } \
        for (size_t i = 0; i < limit(count); ++i) { \
            char indexed[DETAIL_KEY_SIZE]; \
            if (count > 1) { index_key(indexed, field, "", i); } \
            describe(event, count > 1 ? indexed : field, &values[i]); \
        } \
        return; \
    }

    DETAIL(VkInstanceCreateInfo, instance_create)
    DETAIL(VkDeviceCreateInfo, device_create)
    DETAIL(VkShaderModuleCreateInfo, shader)
    DETAIL(VkGraphicsPipelineCreateInfo, graphics)
    DETAIL(VkComputePipelineCreateInfo, compute)
    DETAIL(VkImageCreateInfo, image)
    DETAIL(VkImageViewCreateInfo, view)
    DETAIL(VkBufferCreateInfo, buffer)
    DETAIL(VkBufferViewCreateInfo, buffer_view)
    DETAIL(VkSamplerCreateInfo, sampler)
    DETAIL(VkFramebufferCreateInfo, framebuffer)
    DETAIL(VkRenderPassCreateInfo, render_pass)
    DETAIL(VkRenderPassCreateInfo2, render_pass2)
    DETAIL(VkRenderPassBeginInfo, begin_pass)
    DETAIL(VkRenderingInfo, rendering)
    DETAIL(VkRect2D, rect)
    DETAIL(VkViewport, viewport)
    DETAIL(VkSubmitInfo, submit)
    DETAIL(VkSubmitInfo2, submit2)
    DETAIL(VkPresentInfoKHR, present)
    DETAIL(VkSwapchainCreateInfoKHR, swapchain)
    DETAIL(VkMemoryBarrier, memory_barrier)
    DETAIL(VkBufferMemoryBarrier, buffer_barrier)
    DETAIL(VkImageMemoryBarrier, image_barrier)
    DETAIL(VkMemoryBarrier2, memory_barrier2)
    DETAIL(VkBufferMemoryBarrier2, buffer_barrier2)
    DETAIL(VkImageMemoryBarrier2, image_barrier2)
    DETAIL(VkDependencyInfo, dependency)
    DETAIL(VkDescriptorSetLayoutCreateInfo, descriptor_layout)
    DETAIL(VkDescriptorSetAllocateInfo, descriptor_alloc)
    DETAIL(VkWriteDescriptorSet, descriptor_write)
    DETAIL(VkCopyDescriptorSet, descriptor_copy)
    DETAIL(VkPipelineLayoutCreateInfo, pipeline_layout)
    DETAIL(VkBufferCopy, buffer_copy)
    DETAIL(VkBufferCopy2, buffer_copy2)
    DETAIL(VkImageCopy, image_copy)
    DETAIL(VkImageCopy2, image_copy2)
    DETAIL(VkBufferImageCopy, buffer_image_copy)
    DETAIL(VkBufferImageCopy2, buffer_image_copy2)
    DETAIL(VkCopyBufferInfo2, copy_buffer)
    DETAIL(VkCopyImageInfo2, copy_image)
    DETAIL(VkCopyBufferToImageInfo2, copy_buffer_to_image)
    DETAIL(VkCopyImageToBufferInfo2, copy_image_to_buffer)
    DETAIL(VkCommandBufferAllocateInfo, command_alloc)
    DETAIL(VkCommandBufferBeginInfo, command_begin)
    DETAIL(VkCommandPoolCreateInfo, command_pool)
    DETAIL(VkDebugUtilsLabelEXT, debug_label)
    DETAIL(VkDebugUtilsObjectNameInfoEXT, object_name)

#undef DETAIL
}
