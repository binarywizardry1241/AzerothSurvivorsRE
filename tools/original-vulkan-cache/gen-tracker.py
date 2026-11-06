#!/usr/bin/env python3
"""Emit Vulkan dispatch tracing wrappers from the pinned Vulkan registry."""

import re
import sys
from pathlib import Path
from xml.etree import ElementTree as ET


INSTANCE_TYPES = {"VkInstance", "VkPhysicalDevice"}
DEVICE_TYPES = {"VkDevice", "VkQueue", "VkCommandBuffer"}
PLATFORMS = {"metal": "VK_USE_PLATFORM_METAL_EXT"}
OWNED = {
    "vkCreateInstance", "vkDestroyInstance", "vkCreateDevice", "vkDestroyDevice",
    "vkGetInstanceProcAddr", "vkGetDeviceProcAddr", "vkGetPhysicalDeviceProcAddr",
    "vkCreateGraphicsPipelines", "vkCreateComputePipelines",
}
FRAME_PREFIXES = (
    "vkCmd", "vkQueue", "vkBeginCommandBuffer", "vkEndCommandBuffer",
    "vkResetCommandBuffer", "vkResetCommandPool", "vkResetDescriptorPool",
    "vkAcquireNextImage", "vkWaitForPresent", "vkWaitForFences", "vkResetFences",
    "vkGetFenceStatus", "vkGetQueryPoolResults", "vkGetSemaphoreCounterValue",
    "vkWaitSemaphores", "vkSignalSemaphore", "vkUpdateDescriptorSets",
    "vkFlushMappedMemoryRanges", "vkInvalidateMappedMemoryRanges",
)
INTEGER_TYPES = {
    "char", "int", "unsigned", "size_t", "int8_t", "uint8_t", "int16_t",
    "uint16_t", "int32_t", "uint32_t", "int64_t", "uint64_t",
}


def vulkan(element, attribute="api"):
    return "vulkan" in element.get(attribute, "vulkan").split(",")


def availability(root):
    groups = [feature for feature in root.findall("feature") if vulkan(feature)]
    groups += [
        extension for extension in root.findall("extensions/extension")
        if vulkan(extension, "supported")
        and (not extension.get("platform") or extension.get("platform") in PLATFORMS)
        and not (extension.get("protect") or extension.get("provisional") == "true")
    ]
    available = {}
    for group in groups:
        guard = PLATFORMS.get(group.get("platform"))
        for requirement in group.findall("require"):
            if not vulkan(requirement) or requirement.get("protect"):
                continue
            for command in requirement.findall("command"):
                if vulkan(command) and not command.get("protect"):
                    name = command.attrib["name"]
                    if not guard or name not in available:
                        available[name] = guard
    return available


def declaration(element):
    return " ".join("".join(element.itertext()).split())


def canonical(types, name):
    while name in types and (alias := types[name].get("alias")):
        name = alias
    return name


def kind(types, name):
    name = canonical(types, name)
    if name in INTEGER_TYPES:
        return "signed" if name == "int" or name.startswith("int") else "unsigned"
    if name in {"float", "double"}:
        return "float"
    definition = types.get(name)
    if definition is None:
        return None
    category = definition.get("category")
    if category == "basetype":
        return kind(types, definition.findtext("type"))
    return category


def formatted(types, name, value):
    category = kind(types, name)
    if category in {"handle", "funcpointer"}:
        return "0x%llx", f"(unsigned long long)(uintptr_t)({value})"
    if category in {"signed", "enum"}:
        return "%lld", f"(long long)({value})"
    if category in {"unsigned", "bitmask"}:
        return "%llu", f"(unsigned long long)({value})"
    if category == "float":
        return "%.9g", f"(double)({value})"
    return None


def count_expression(parameter, parameters):
    length = parameter.get("len")
    if length is None or length == "1":
        return "1", None
    if length in parameters:
        source = parameters[length]
        shape = declaration(source)
        if "*" not in shape:
            return length, None
        if shape.count("*") == 1:
            return f"*{length}", length
    if length and re.fullmatch(r"\w+->\w+", length):
        pointer = length.split("->", 1)[0]
        if pointer in parameters:
            return length, pointer
    return None


def append_array(lines, name, length, guard, formatter, expression, condition):
    fmt, value = formatter
    if length == "1":
        lines.append(f"    if ({condition}) {{")
        lines.append(f'        azs_trackf(&azs_event_, "\\t{name}={fmt}", {value});')
        lines.append("    }")
        return
    if guard:
        condition += f" && {guard}"
    lines.extend((
        f"    if ({condition}) {{",
        f"        const size_t azs_count_ = (size_t)({length});",
        "        for (size_t azs_index_ = 0; azs_index_ < azs_count_ && azs_index_ < 16; ++azs_index_) {",
        f'            azs_trackf(&azs_event_, "\\t{name}[%zu]={fmt}", azs_index_, {expression});',
        "        }",
        "        if (azs_count_ > 16) {",
        f'            azs_trackf(&azs_event_, "\\t{name}.omitted=%zu", azs_count_ - 16);',
        "        }",
        "    }",
    ))


def append_input(lines, parameter, parameters, types):
    name = parameter.findtext("name")
    type_name = parameter.findtext("type")
    shape = declaration(parameter)
    pointer = "*" in shape or "[" in shape
    if not pointer:
        fmt_value = formatted(types, type_name, name)
        if fmt_value:
            fmt, value = fmt_value
            lines.append(f'    azs_trackf(&azs_event_, "\\t{name}={fmt}", {value});')
        return

    lines.append(f'    azs_trackf(&azs_event_, "\\t{name}=0x%llx", (unsigned long long)(uintptr_t){name});')
    fixed = re.search(r"\[(\d+)\]$", shape)
    if fixed and (single := formatted(types, type_name, f"*{name}")):
        _, indexed = formatted(types, type_name, f"{name}[azs_index_]")
        append_array(lines, name, fixed[1], None, single, indexed, f"azs_event_.active && {name}")
        return
    if shape.count("*") != 1 or "const" not in shape.split("*", 1)[0].split():
        return
    if type_name == "char" and parameter.get("len") == "null-terminated":
        lines.append(f'    azs_track_text(&azs_event_, "{name}", {name});')
        return
    if not (count := count_expression(parameter, parameters)):
        return
    length, guard = count
    condition = f"azs_event_.active && {name}"
    if kind(types, type_name) in {"struct", "union"}:
        if guard:
            condition += f" && {guard}"
        lines.extend((
            f"    if ({condition}) {{",
            f'        azs_track_describe(&azs_event_, "{name}", "{canonical(types, type_name)}", '
            f'{name}, (size_t)({length}));',
            "    }",
        ))
    elif parameter.get("len") and (single := formatted(types, type_name, f"*{name}")):
        # Length-annotated immutable scalar/handle arrays are metadata, not mapped memory.
        _, indexed = formatted(types, type_name, f"{name}[azs_index_]")
        append_array(lines, name, length, guard, single, indexed, condition)


def append_output(lines, command, parameter, parameters, types, result_type):
    name = parameter.findtext("name")
    type_name = parameter.findtext("type")
    shape = declaration(parameter)
    image_index = command.startswith("vkAcquireNextImage") and name == "pImageIndex"
    if (kind(types, type_name) != "handle" and not image_index) or shape.count("*") != 1:
        return
    if "const" in shape.split("*", 1)[0].split() or result_type not in {"void", "VkResult"}:
        return
    if not (count := count_expression(parameter, parameters)):
        return
    length, guard = count
    condition = f"azs_event_.active && {name}"
    if result_type == "VkResult":
        condition += (" && (azs_result_ == VK_SUCCESS || azs_result_ == VK_SUBOPTIMAL_KHR)"
                      if image_index else " && azs_result_ == VK_SUCCESS")
    single = formatted(types, type_name, f"*{name}")
    _, indexed = formatted(types, type_name, f"{name}[azs_index_]")
    append_array(lines, f"out.{name}", length, guard, single, indexed, condition)


def wrapper(name, command, types):
    parameters = {
        parameter.findtext("name"): parameter for parameter in command.findall("param")
        if vulkan(parameter)
    }
    if not parameters:
        return None
    first = next(iter(parameters.values()))
    scope = first.findtext("type")
    if scope not in INSTANCE_TYPES | DEVICE_TYPES or "*" in declaration(first):
        return None
    is_device = scope in DEVICE_TYPES
    dispatch = "device" if is_device else "instance"
    return_type = command.findtext("proto/type")
    void = return_type == "void"
    metadata = "false" if name.startswith(FRAME_PREFIXES) else "true"
    arguments = ", ".join(parameters)
    signature = ", ".join(declaration(param) for param in parameters.values())
    default = "VK_ERROR_EXTENSION_NOT_PRESENT" if return_type == "VkResult" else "0"
    lines = [
        f"static VKAPI_ATTR {return_type} VKAPI_CALL azs_track_{name}({signature}) {{",
        f"    PFN_{name} azs_next_ = (PFN_{name})azs_track_{dispatch}_next("
        f'(const void *){first.findtext("name")}, "{name}");',
        "    if (!azs_next_) {",
        f"        return{'' if void else ' ' + default};",
        "    }",
        "    AzsTrackEvent azs_event_;",
        f'    azs_track_begin(&azs_event_, "{name}", {metadata});',
    ]
    for parameter in parameters.values():
        append_input(lines, parameter, parameters, types)
    if void:
        lines.append(f"    azs_next_({arguments});")
    else:
        lines.append(f"    {return_type} azs_result_ = azs_next_({arguments});")
        fmt, value = formatted(types, return_type, "azs_result_")
        lines.append(f'    azs_trackf(&azs_event_, "\\tresult={fmt}", {value});')
    for parameter in parameters.values():
        append_output(lines, name, parameter, parameters, types, return_type)
    present = ("azs_result_ == VK_SUCCESS || azs_result_ == VK_SUBOPTIMAL_KHR"
               if name == "vkQueuePresentKHR" else "false")
    lines.append(f"    azs_track_end(&azs_event_, {present});")
    if not void:
        lines.append("    return azs_result_;")
    lines.extend(("}", ""))
    return lines, is_device


def generate(root):
    types = {
        element.get("name") or element.findtext("name"): element
        for element in root.findall("types/type") if vulkan(element)
    }
    commands = {
        element.get("name") or element.findtext("proto/name"): element
        for element in root.findall("commands/command") if vulkan(element)
    }
    yield "/* Generated by gen-tracker.py. Include after the tracker and layer helpers. */"
    yield ""
    entries = []
    for name, guard in sorted(availability(root).items()):
        if name in OWNED:
            continue
        canonical_name = canonical(commands, name)
        if canonical_name in OWNED:
            continue
        result = wrapper(name, commands[canonical_name], types)
        if result is not None:
            lines, is_device = result
            if guard:
                yield f"#if defined({guard})"
            yield from lines
            if guard:
                yield "#endif"
            entries.append((name, "true" if is_device else "false", guard))

    yield "static PFN_vkVoidFunction azs_track_lookup(const char *name, bool device_command) {"
    yield "    static const struct {"
    yield "        const char *name;"
    yield "        PFN_vkVoidFunction function;"
    yield "        bool device;"
    yield "    } commands[] = {"
    for name, scope, guard in entries:
        if guard:
            yield f"#if defined({guard})"
        yield f'        {{"{name}", (PFN_vkVoidFunction)azs_track_{name}, {scope}}},'
        if guard:
            yield "#endif"
    yield "    };"
    yield "    size_t lower = 0;"
    yield "    size_t upper = sizeof commands / sizeof commands[0];"
    yield "    while (lower < upper) {"
    yield "        size_t index = lower + (upper - lower) / 2;"
    yield "        int comparison = strcmp(name, commands[index].name);"
    yield "        if (comparison == 0) {"
    yield "            return commands[index].device == device_command ? commands[index].function : NULL;"
    yield "        }"
    yield "        if (comparison < 0) {"
    yield "            upper = index;"
    yield "        } else {"
    yield "            lower = index + 1;"
    yield "        }"
    yield "    }"
    yield "    return NULL;"
    yield "}"


def main():
    if len(sys.argv) != 3:
        raise SystemExit(f"Usage: {sys.argv[0]} input.xml output.inc")
    root = ET.parse(sys.argv[1]).getroot()
    Path(sys.argv[2]).write_text("\n".join(generate(root)) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
