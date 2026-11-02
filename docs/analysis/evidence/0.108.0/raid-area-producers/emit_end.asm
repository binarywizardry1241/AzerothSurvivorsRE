14594bcf3: 4989f6 mov r14, rsi
14594bcf6: 4983c6f8 add r14, -8
14594bcfa: 4080ff01 cmp dil, 1
14594bcfe: 4c8ba548020000 mov r12, qword ptr [rbp + 0x248]
14594bd05: 488db580010000 lea rsi, [rbp + 0x180]
14594bd0c: 488dbde0010000 lea rdi, [rbp + 0x1e0]
14594bd13: 0f85bdfeffff jne 0x14594bbd6
14594bd19: e8e2646bfa call 0x140002200
14594bd1e: b901000000 mov ecx, 1
14594bd23: ba01000000 mov edx, 1
14594bd28: e893646bfa call 0x1400021c0
14594bd2d: 4885c0 test rax, rax
14594bd30: 0f84f90e0000 je 0x14594cc2f
14594bd36: c6007b mov byte ptr [rax], 0x7b
14594bd39: 48c785e001000001000000 mov qword ptr [rbp + 0x1e0], 1
14594bd44: 488985e8010000 mov qword ptr [rbp + 0x1e8], rax
14594bd4b: 48c785f001000001000000 mov qword ptr [rbp + 0x1f0], 1
14594bd56: c685f801000001 mov byte ptr [rbp + 0x1f8], 1
14594bd5d: 488d0594498a01 lea rax, [rip + 0x18a4994]
14594bd64: 4889442420 mov qword ptr [rsp + 0x20], rax
14594bd69: 48c744242805000000 mov qword ptr [rsp + 0x28], 5
14594bd72: 41b904000000 mov r9d, 4
14594bd78: 4889f1 mov rcx, rsi
14594bd7b: 4889fa mov rdx, rdi
14594bd7e: 4c8d05a5468a01 lea r8, [rip + 0x18a46a5]
14594bd85: e8268cf9ff call 0x1458e49b0
14594bd8a: 90 nop
14594bd8b: 8b8570020000 mov eax, dword ptr [rbp + 0x270]
14594bd91: 89442420 mov dword ptr [rsp + 0x20], eax
14594bd95: 41b902000000 mov r9d, 2
14594bd9b: 4889f9 mov rcx, rdi
14594bd9e: 4889f2 mov rdx, rsi
14594bda1: 4c8d05df488a01 lea r8, [rip + 0x18a48df]
14594bda8: e8f33df9ff call 0x1458dfba0
