; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x1458e89d0..0x1458e8a8b SHA256 e2dbaa3357c89fa480bf6e27f733889ce179470f57b9e1f6e02b40a6cf57ddb0
0x1458e89d0: push rbp
0x1458e89d1: push rsi
0x1458e89d2: sub rsp, 0x58
0x1458e89d6: lea rbp, [rsp + 0x50]
0x1458e89db: mov qword ptr [rbp], 0xfffffffffffffffe
0x1458e89e3: mov rax, qword ptr [rcx]
0x1458e89e6: mov rsi, qword ptr [rax]
0x1458e89e9: mov qword ptr [rax], 0
0x1458e89f0: test rsi, rsi
0x1458e89f3: je 0x1458e8a6c
0x1458e89f5: call 0x140002200
0x1458e89fa: mov ecx, 0x2a0
0x1458e89ff: mov edx, 8
0x1458e8a04: call 0x1400021c0
0x1458e8a09: test rax, rax
0x1458e8a0c: je 0x1458e8a7a
0x1458e8a0e: mov qword ptr [rbp - 0x18], 0xe
0x1458e8a16: mov qword ptr [rbp - 0x10], rax
0x1458e8a1a: lea rcx, [rbp - 8]
0x1458e8a1e: mov qword ptr [rbp - 8], 0
0x1458e8a26: mov qword ptr [rbp - 0x20], rax
0x1458e8a2a: mov qword ptr [rbp - 0x30], rcx
0x1458e8a2e: mov qword ptr [rbp - 0x28], 0
0x1458e8a36: lea rcx, [rip + 0x15e6d1b]
0x1458e8a3d: lea rdx, [rip + 0x15e7024]
0x1458e8a44: lea r8, [rbp - 0x30]
0x1458e8a48: call 0x1459d19a0
0x1458e8a4d: nop
0x1458e8a4e: movups xmm0, xmmword ptr [rbp - 0x18]
0x1458e8a52: movaps xmmword ptr [rbp - 0x30], xmm0
0x1458e8a56: mov rax, qword ptr [rbp - 8]
0x1458e8a5a: mov qword ptr [rbp - 0x20], rax
0x1458e8a5e: mov qword ptr [rsi + 0x10], rax
0x1458e8a62: movups xmmword ptr [rsi], xmm0
0x1458e8a65: add rsp, 0x58
0x1458e8a69: pop rsi
0x1458e8a6a: pop rbp
0x1458e8a6b: ret
0x1458e8a6c: lea rcx, [rip + 0x1308ad5]
0x1458e8a73: call 0x145d995b0
0x1458e8a78: ud2
0x1458e8a7a: mov ecx, 8
0x1458e8a7f: mov edx, 0x2a0
0x1458e8a84: call 0x145d992bb
0x1458e8a89: ud2
