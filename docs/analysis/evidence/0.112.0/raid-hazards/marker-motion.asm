145917c91: 41807d7c00 cmp byte ptr [r13 + 0x7c], 0
145917c96: 0f8448030000 je 0x145917fe4
145917c9c: 488b8590020000 mov rax, qword ptr [rbp + 0x290]
145917ca3: 48898540010000 mov qword ptr [rbp + 0x140], rax
145917caa: 488b8588020000 mov rax, qword ptr [rbp + 0x288]
145917cb1: 48898548010000 mov qword ptr [rbp + 0x148], rax
145917cb8: 488b4540 mov rax, qword ptr [rbp + 0x40]
145917cbc: 48898550010000 mov qword ptr [rbp + 0x150], rax
145917cc3: 0fb68526020000 movzx eax, byte ptr [rbp + 0x226]
145917cca: 888558010000 mov byte ptr [rbp + 0x158], al
145917cd0: 8b85e8000000 mov eax, dword ptr [rbp + 0xe8]
145917cd6: 8b8deb000000 mov ecx, dword ptr [rbp + 0xeb]
145917cdc: 488d9559010000 lea rdx, [rbp + 0x159]
145917ce3: 894a03 mov dword ptr [rdx + 3], ecx
145917ce6: 8902 mov dword ptr [rdx], eax
145917ce8: e813a56efa call 0x140002200
145917ced: b901000000 mov ecx, 1
145917cf2: ba01000000 mov edx, 1
145917cf7: e8c4a46efa call 0x1400021c0
145917cfc: 4885c0 test rax, rax
145917cff: 0f84a63b0000 je 0x14591b8ab
145917d05: c6005b mov byte ptr [rax], 0x5b
145917d08: 48c785e001000001000000 mov qword ptr [rbp + 0x1e0], 1
145917d13: 488985e8010000 mov qword ptr [rbp + 0x1e8], rax
145917d1a: 48c785f001000001000000 mov qword ptr [rbp + 0x1f0], 1
145917d25: c685f801000001 mov byte ptr [rbp + 0x1f8], 1
145917d2c: 418b453c mov eax, dword ptr [r13 + 0x3c]
145917d30: 0f57c9 xorps xmm1, xmm1
145917d33: f2480f2ac8 cvtsi2sd xmm1, rax
145917d38: c685d401000001 mov byte ptr [rbp + 0x1d4], 1
145917d3f: 488d75c0 lea rsi, [rbp - 0x40]
145917d43: 4889f1 mov rcx, rsi
145917d46: e8757b0700 call 0x14598f8c0
145917d4b: 90 nop
145917d4c: c685d401000000 mov byte ptr [rbp + 0x1d4], 0
145917d53: 488d8d80010000 lea rcx, [rbp + 0x180]
145917d5a: 488d95e0010000 lea rdx, [rbp + 0x1e0]
145917d61: 4989f0 mov r8, rsi
145917d64: e8874d0700 call 0x14598caf0
145917d69: 90 nop
145917d6a: f3410f104540 movss xmm0, dword ptr [r13 + 0x40]
145917d70: 0f57c9 xorps xmm1, xmm1
145917d73: f30f5ac8 cvtss2sd xmm1, xmm0
145917d77: c685d301000001 mov byte ptr [rbp + 0x1d3], 1
145917d7e: 4889f1 mov rcx, rsi
145917d81: e83a7b0700 call 0x14598f8c0
145917d86: 90 nop
145917d87: c685d301000000 mov byte ptr [rbp + 0x1d3], 0
145917d8e: 488d8de0010000 lea rcx, [rbp + 0x1e0]
145917d95: 488d9580010000 lea rdx, [rbp + 0x180]
145917d9c: 4989f0 mov r8, rsi
145917d9f: e84c4d0700 call 0x14598caf0
145917da4: 90 nop
145917da5: f3410f104544 movss xmm0, dword ptr [r13 + 0x44]
145917dab: 0f57c9 xorps xmm1, xmm1
145917dae: f30f5ac8 cvtss2sd xmm1, xmm0
145917db2: c685d201000001 mov byte ptr [rbp + 0x1d2], 1
145917db9: 4889f1 mov rcx, rsi
145917dbc: e8ff7a0700 call 0x14598f8c0
145917dc1: 90 nop
145917dc2: c685d201000000 mov byte ptr [rbp + 0x1d2], 0
145917dc9: 488d8d80010000 lea rcx, [rbp + 0x180]
145917dd0: 488d95e0010000 lea rdx, [rbp + 0x1e0]
145917dd7: 4989f0 mov r8, rsi
145917dda: e8114d0700 call 0x14598caf0
145917ddf: 90 nop
145917de0: f3410f104548 movss xmm0, dword ptr [r13 + 0x48]
145917de6: 0f57c9 xorps xmm1, xmm1
145917de9: f30f5ac8 cvtss2sd xmm1, xmm0
145917ded: c685d101000001 mov byte ptr [rbp + 0x1d1], 1
145917df4: 4889f1 mov rcx, rsi
145917df7: e8c47a0700 call 0x14598f8c0
145917dfc: 90 nop
145917dfd: c685d101000000 mov byte ptr [rbp + 0x1d1], 0
145917e04: 488d8de0010000 lea rcx, [rbp + 0x1e0]
145917e0b: 488d9580010000 lea rdx, [rbp + 0x180]
145917e12: 4989f0 mov r8, rsi
145917e15: e8d64c0700 call 0x14598caf0
145917e1a: 90 nop
145917e1b: f3410f10454c movss xmm0, dword ptr [r13 + 0x4c]
145917e21: 0f57c9 xorps xmm1, xmm1
145917e24: f30f5ac8 cvtss2sd xmm1, xmm0
145917e28: c685d001000001 mov byte ptr [rbp + 0x1d0], 1
145917e2f: 4889f1 mov rcx, rsi
145917e32: e8897a0700 call 0x14598f8c0
145917e37: 90 nop
145917e38: c685d001000000 mov byte ptr [rbp + 0x1d0], 0
145917e3f: 488d8d80010000 lea rcx, [rbp + 0x180]
145917e46: 488d95e0010000 lea rdx, [rbp + 0x1e0]
145917e4d: 4989f0 mov r8, rsi
145917e50: e89b4c0700 call 0x14598caf0
145917e55: 90 nop
145917e56: 488bbd90010000 mov rdi, qword ptr [rbp + 0x190]
145917e5d: 4839bd80010000 cmp qword ptr [rbp + 0x180], rdi
145917e64: 0f842d1a0000 je 0x145919897
145917e6a: 488b8588010000 mov rax, qword ptr [rbp + 0x188]
145917e71: c604385d mov byte ptr [rax + rdi], 0x5d
145917e75: 48ffc7 inc rdi
145917e78: 4889bdf0010000 mov qword ptr [rbp + 0x1f0], rdi
145917e7f: 0f108580010000 movups xmm0, xmmword ptr [rbp + 0x180]
145917e86: 0f2985e0010000 movaps xmmword ptr [rbp + 0x1e0], xmm0
145917e8d: c6859e02000000 mov byte ptr [rbp + 0x29e], 0
145917e94: 488d8df0000000 lea rcx, [rbp + 0xf0]
145917e9b: 488d9540010000 lea rdx, [rbp + 0x140]
145917ea2: 4c8d85e0010000 lea r8, [rbp + 0x1e0]
145917ea9: e8424c0700 call 0x14598caf0
145917eae: 90 nop
145917eaf: 488b85f0000000 mov rax, qword ptr [rbp + 0xf0]
145917eb6: 48898590020000 mov qword ptr [rbp + 0x290], rax
145917ebd: 488b85f8000000 mov rax, qword ptr [rbp + 0xf8]
145917ec4: 48898588020000 mov qword ptr [rbp + 0x288], rax
145917ecb: 488b8500010000 mov rax, qword ptr [rbp + 0x100]
145917ed2: 48894540 mov qword ptr [rbp + 0x40], rax
145917ed6: 0fb68508010000 movzx eax, byte ptr [rbp + 0x108]
145917edd: 888526020000 mov byte ptr [rbp + 0x226], al
145917ee3: 488d8d09010000 lea rcx, [rbp + 0x109]
145917eea: 8b01 mov eax, dword ptr [rcx]
145917eec: 8b4903 mov ecx, dword ptr [rcx + 3]
145917eef: 8985e8000000 mov dword ptr [rbp + 0xe8], eax
145917ef5: 898deb000000 mov dword ptr [rbp + 0xeb], ecx
145917efb: b001 mov al, 1
145917efd: 488945e8 mov qword ptr [rbp - 0x18], rax
145917f01: e91c010000 jmp 0x145918022
145917f06: 31c0 xor eax, eax
145917f08: 41807d7e00 cmp byte ptr [r13 + 0x7e], 0
145917f0d: 0f857efdffff jne 0x145917c91
145917f13: f3410f104554 movss xmm0, dword ptr [r13 + 0x54]
145917f19: f3410f5c4564 subss xmm0, dword ptr [r13 + 0x64]
145917f1f: f30f108d34020000 movss xmm1, dword ptr [rbp + 0x234]
145917f27: 0f2ec8 ucomiss xmm1, xmm0
145917f2a: 0f82f2000000 jb 0x145918022
145917f30: 41c6457e01 mov byte ptr [r13 + 0x7e], 1
145917f35: 488bb538010000 mov rsi, qword ptr [rbp + 0x138]
145917f3c: 483bb528010000 cmp rsi, qword ptr [rbp + 0x128]
145917f43: 0f8584000000 jne 0x145917fcd
145917f49: 488b8578020000 mov rax, qword ptr [rbp + 0x278]
145917f50: 48898568020000 mov qword ptr [rbp + 0x268], rax
145917f57: 488b8580020000 mov rax, qword ptr [rbp + 0x280]
145917f5e: 48898560020000 mov qword ptr [rbp + 0x260], rax
145917f65: 488b8588020000 mov rax, qword ptr [rbp + 0x288]
145917f6c: 48898558020000 mov qword ptr [rbp + 0x258], rax
145917f73: 488b8590020000 mov rax, qword ptr [rbp + 0x290]
145917f7a: 48898550020000 mov qword ptr [rbp + 0x250], rax
145917f81: c685a702000001 mov byte ptr [rbp + 0x2a7], 1
145917f88: c685a602000001 mov byte ptr [rbp + 0x2a6], 1
145917f8f: c685a502000001 mov byte ptr [rbp + 0x2a5], 1
145917f96: c685a402000001 mov byte ptr [rbp + 0x2a4], 1
145917f9d: c685a302000001 mov byte ptr [rbp + 0x2a3], 1
145917fa4: c685a202000001 mov byte ptr [rbp + 0x2a2], 1
145917fab: c685a102000001 mov byte ptr [rbp + 0x2a1], 1
145917fb2: c685a002000001 mov byte ptr [rbp + 0x2a0], 1
145917fb9: c6859f02000001 mov byte ptr [rbp + 0x29f], 1
145917fc0: 488d8d28010000 lea rcx, [rbp + 0x128]
145917fc7: e864592f00 call 0x145c0d930
145917fcc: 90 nop
145917fcd: 488b8530010000 mov rax, qword ptr [rbp + 0x130]
145917fd4: 4c8934f0 mov qword ptr [rax + rsi*8], r14
145917fd8: 48ffc6 inc rsi
145917fdb: 4889b538010000 mov qword ptr [rbp + 0x138], rsi
145917fe2: eb3e jmp 0x145918022
145917fe4: f3410f104558 movss xmm0, dword ptr [r13 + 0x58]
145917fea: 410f2e4550 ucomiss xmm0, dword ptr [r13 + 0x50]
145917fef: 0f87a7fcffff ja 0x145917c9c
145917ff5: f3410f104570 movss xmm0, dword ptr [r13 + 0x70]
145917ffb: 0f57c9 xorps xmm1, xmm1
145917ffe: 0f2ec1 ucomiss xmm0, xmm1
145918001: 0f8795fcffff ja 0x145917c9c
145918007: f3410f10451c movss xmm0, dword ptr [r13 + 0x1c]
14591800d: 0f2ec1 ucomiss xmm0, xmm1
145918010: 0f9ac1 setp cl
145918013: 0f95c2 setne dl
145918016: 08ca or dl, cl
145918018: 20d0 and al, dl
14591801a: 3c01 cmp al, 1
14591801c: 0f847afcffff je 0x145917c9c
