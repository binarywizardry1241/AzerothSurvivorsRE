; EXE 0.117.0 SHA-256 507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293
; Preferred VA [0x145c33e40, 0x145c33faa); bytes SHA-256 94c74120eb92033bad5417359da765cee1bfa8772f8f22999a6b44a16051d8ce
; Capstone 5.0.7; current static bytes, no native process.
0000000145c33e40: 55                       push rbp
0000000145c33e41: 4157                     push r15
0000000145c33e43: 4156                     push r14
0000000145c33e45: 4155                     push r13
0000000145c33e47: 4154                     push r12
0000000145c33e49: 56                       push rsi
0000000145c33e4a: 57                       push rdi
0000000145c33e4b: 53                       push rbx
0000000145c33e4c: 4883ec48                 sub rsp, 0x48
0000000145c33e50: 488d6c2440               lea rbp, [rsp + 0x40]
0000000145c33e55: 48c74500feffffff         mov qword ptr [rbp], 0xfffffffffffffffe
0000000145c33e5d: 4889ce                   mov rsi, rcx
0000000145c33e60: 4c8b22                   mov r12, qword ptr [rdx]
0000000145c33e63: 4c8b6a08                 mov r13, qword ptr [rdx + 8]
0000000145c33e67: 4d39ec                   cmp r12, r13
0000000145c33e6a: 7432                     je 0x145c33e9e
0000000145c33e6c: 4889d3                   mov rbx, rdx
0000000145c33e6f: 488b7a10                 mov rdi, qword ptr [rdx + 0x10]
0000000145c33e73: 4983c440                 add r12, 0x40
0000000145c33e77: 660f1f840000000000       nop word ptr [rax + rax]
0000000145c33e80: 498d5424c0               lea rdx, [r12 - 0x40]
0000000145c33e85: 4c8923                   mov qword ptr [rbx], r12
0000000145c33e88: 4889f9                   mov rcx, rdi
0000000145c33e8b: e8606bf1ff               call 0x145b4a9f0
0000000145c33e90: 84c0                     test al, al
0000000145c33e92: 7526                     jne 0x145c33eba
0000000145c33e94: 4d39ec                   cmp r12, r13
0000000145c33e97: 4d8d642440               lea r12, [r12 + 0x40]
0000000145c33e9c: 75e2                     jne 0x145c33e80
0000000145c33e9e: 48c70600000000           mov qword ptr [rsi], 0
0000000145c33ea5: 48c7460804000000         mov qword ptr [rsi + 8], 4
0000000145c33ead: 48c7461000000000         mov qword ptr [rsi + 0x10], 0
0000000145c33eb5: e9cb000000               jmp 0x145c33f85
0000000145c33eba: 418b5c24f0               mov ebx, dword ptr [r12 - 0x10]
0000000145c33ebf: e83ce33cfa               call 0x140002200
0000000145c33ec4: b910000000               mov ecx, 0x10
0000000145c33ec9: ba04000000               mov edx, 4
0000000145c33ece: e8ede23cfa               call 0x1400021c0
0000000145c33ed3: 4885c0                   test rax, rax
0000000145c33ed6: 0f84bd000000             je 0x145c33f99
0000000145c33edc: 4989c7                   mov r15, rax
0000000145c33edf: 8918                     mov dword ptr [rax], ebx
0000000145c33ee1: 48c745e804000000         mov qword ptr [rbp - 0x18], 4
0000000145c33ee9: 488945f0                 mov qword ptr [rbp - 0x10], rax
0000000145c33eed: 48c745f801000000         mov qword ptr [rbp - 8], 1
0000000145c33ef5: 4d39ec                   cmp r12, r13
0000000145c33ef8: 7474                     je 0x145c33f6e
0000000145c33efa: bb01000000               mov ebx, 1
0000000145c33eff: 4d89e6                   mov r14, r12
0000000145c33f02: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145c33f10: 4889f9                   mov rcx, rdi
0000000145c33f13: 4c89f2                   mov rdx, r14
0000000145c33f16: e8d56af1ff               call 0x145b4a9f0
0000000145c33f1b: 90                       nop
0000000145c33f1c: 4d8d6640                 lea r12, [r14 + 0x40]
0000000145c33f20: 84c0                     test al, al
0000000145c33f22: 750a                     jne 0x145c33f2e
0000000145c33f24: 4d89e6                   mov r14, r12
0000000145c33f27: 4d39ec                   cmp r12, r13
0000000145c33f2a: 75e4                     jne 0x145c33f10
0000000145c33f2c: eb40                     jmp 0x145c33f6e
0000000145c33f2e: 458b7630                 mov r14d, dword ptr [r14 + 0x30]
0000000145c33f32: 483b5de8                 cmp rbx, qword ptr [rbp - 0x18]
0000000145c33f36: 7526                     jne 0x145c33f5e
0000000145c33f38: 48c744242004000000       mov qword ptr [rsp + 0x20], 4
0000000145c33f41: 41b801000000             mov r8d, 1
0000000145c33f47: 41b904000000             mov r9d, 4
0000000145c33f4d: 488d4de8                 lea rcx, [rbp - 0x18]
0000000145c33f51: 4889da                   mov rdx, rbx
0000000145c33f54: e897013600               call 0x145f940f0
0000000145c33f59: 90                       nop
0000000145c33f5a: 4c8b7df0                 mov r15, qword ptr [rbp - 0x10]
0000000145c33f5e: 4589349f                 mov dword ptr [r15 + rbx*4], r14d
0000000145c33f62: 48ffc3                   inc rbx
0000000145c33f65: 48895df8                 mov qword ptr [rbp - 8], rbx
0000000145c33f69: 4d39ec                   cmp r12, r13
0000000145c33f6c: 7591                     jne 0x145c33eff
0000000145c33f6e: 488b45f8                 mov rax, qword ptr [rbp - 8]
0000000145c33f72: 48894610                 mov qword ptr [rsi + 0x10], rax
0000000145c33f76: 488b45e8                 mov rax, qword ptr [rbp - 0x18]
0000000145c33f7a: 488906                   mov qword ptr [rsi], rax
0000000145c33f7d: 488b45f0                 mov rax, qword ptr [rbp - 0x10]
0000000145c33f81: 48894608                 mov qword ptr [rsi + 8], rax
0000000145c33f85: 4889f0                   mov rax, rsi
0000000145c33f88: 4883c448                 add rsp, 0x48
0000000145c33f8c: 5b                       pop rbx
0000000145c33f8d: 5f                       pop rdi
0000000145c33f8e: 5e                       pop rsi
0000000145c33f8f: 415c                     pop r12
0000000145c33f91: 415d                     pop r13
0000000145c33f93: 415e                     pop r14
0000000145c33f95: 415f                     pop r15
0000000145c33f97: 5d                       pop rbp
0000000145c33f98: c3                       ret
0000000145c33f99: b904000000               mov ecx, 4
0000000145c33f9e: ba10000000               mov edx, 0x10
0000000145c33fa3: e8136d5000               call 0x14613acbb
0000000145c33fa8: 0f0b                     ud2
