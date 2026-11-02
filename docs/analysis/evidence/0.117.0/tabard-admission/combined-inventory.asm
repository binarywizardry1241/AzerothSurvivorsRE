; EXE 0.117.0 SHA-256 507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293
; Preferred VA [0x145ac4e00, 0x145ac505b); bytes SHA-256 94dabb04b6b9e4763a690b6121d54866aa266cc0b3134f1c90052de3f1b42e6d
; Capstone 5.0.7; current static bytes, no native process.
0000000145ac4e00: 55                       push rbp
0000000145ac4e01: 4157                     push r15
0000000145ac4e03: 4156                     push r14
0000000145ac4e05: 4155                     push r13
0000000145ac4e07: 4154                     push r12
0000000145ac4e09: 56                       push rsi
0000000145ac4e0a: 57                       push rdi
0000000145ac4e0b: 53                       push rbx
0000000145ac4e0c: 4881ec88000000           sub rsp, 0x88
0000000145ac4e13: 488dac2480000000         lea rbp, [rsp + 0x80]
0000000145ac4e1b: 48c74500feffffff         mov qword ptr [rbp], 0xfffffffffffffffe
0000000145ac4e23: 4889ce                   mov rsi, rcx
0000000145ac4e26: 488b7a40                 mov rdi, qword ptr [rdx + 0x40]
0000000145ac4e2a: 4c8d3cbd00000000         lea r15, [rdi*4]
0000000145ac4e32: 4889f8                   mov rax, rdi
0000000145ac4e35: 48c1e83e                 shr rax, 0x3e
0000000145ac4e39: 0f95c0                   setne al
0000000145ac4e3c: 48b9fcffffffffffff7f     movabs rcx, 0x7ffffffffffffffc
0000000145ac4e46: 4939cf                   cmp r15, rcx
0000000145ac4e49: 0f97c1                   seta cl
0000000145ac4e4c: 08c1                     or cl, al
0000000145ac4e4e: 7410                     je 0x145ac4e60
0000000145ac4e50: 4531ed                   xor r13d, r13d
0000000145ac4e53: 4c89e9                   mov rcx, r13
0000000145ac4e56: 4c89fa                   mov rdx, r15
0000000145ac4e59: e85d5e6700               call 0x14613acbb
0000000145ac4e5e: 0f0b                     ud2
0000000145ac4e60: 4889d3                   mov rbx, rdx
0000000145ac4e63: 4c8b6238                 mov r12, qword ptr [rdx + 0x38]
0000000145ac4e67: 4d85ff                   test r15, r15
0000000145ac4e6a: 7425                     je 0x145ac4e91
0000000145ac4e6c: e88fd353fa               call 0x140002200
0000000145ac4e71: 41bd04000000             mov r13d, 4
0000000145ac4e77: ba04000000               mov edx, 4
0000000145ac4e7c: 4c89f9                   mov rcx, r15
0000000145ac4e7f: e83cd353fa               call 0x1400021c0
0000000145ac4e84: 4885c0                   test rax, rax
0000000145ac4e87: 74ca                     je 0x145ac4e53
0000000145ac4e89: 4989c6                   mov r14, rax
0000000145ac4e8c: 4989fd                   mov r13, rdi
0000000145ac4e8f: eb09                     jmp 0x145ac4e9a
0000000145ac4e91: 41be04000000             mov r14d, 4
0000000145ac4e97: 4531ed                   xor r13d, r13d
0000000145ac4e9a: 4c896dd8                 mov qword ptr [rbp - 0x28], r13
0000000145ac4e9e: 4c8975e0                 mov qword ptr [rbp - 0x20], r14
0000000145ac4ea2: 48c745e800000000         mov qword ptr [rbp - 0x18], 0
0000000145ac4eaa: 4885ff                   test rdi, rdi
0000000145ac4ead: 7412                     je 0x145ac4ec1
0000000145ac4eaf: 4c89f1                   mov rcx, r14
0000000145ac4eb2: 4c89e2                   mov rdx, r12
0000000145ac4eb5: 4d89f8                   mov r8, r15
0000000145ac4eb8: e81eee4c00               call 0x145f93cdb
0000000145ac4ebd: 48897de8                 mov qword ptr [rbp - 0x18], rdi
0000000145ac4ec1: 488d056849b001           lea rax, [rip + 0x1b04968]
0000000145ac4ec8: 488945a8                 mov qword ptr [rbp - 0x58], rax
0000000145ac4ecc: 488d059d4eb001           lea rax, [rip + 0x1b04e9d]
0000000145ac4ed3: 488945b0                 mov qword ptr [rbp - 0x50], rax
0000000145ac4ed7: 48895db8                 mov qword ptr [rbp - 0x48], rbx
0000000145ac4edb: 488d4dc0                 lea rcx, [rbp - 0x40]
0000000145ac4edf: 488d55a8                 lea rdx, [rbp - 0x58]
0000000145ac4ee3: e858ef1600               call 0x145c33e40
0000000145ac4ee8: 90                       nop
0000000145ac4ee9: 4c8b65c0                 mov r12, qword ptr [rbp - 0x40]
0000000145ac4eed: 488b45c8                 mov rax, qword ptr [rbp - 0x38]
0000000145ac4ef1: 488945f8                 mov qword ptr [rbp - 8], rax
0000000145ac4ef5: 4c8b7dd0                 mov r15, qword ptr [rbp - 0x30]
0000000145ac4ef9: 4929fd                   sub r13, rdi
0000000145ac4efc: 4d39ef                   cmp r15, r13
0000000145ac4eff: 0f87e2000000             ja 0x145ac4fe7
0000000145ac4f05: 4d85ff                   test r15, r15
0000000145ac4f08: 4c8b6df8                 mov r13, qword ptr [rbp - 8]
0000000145ac4f0c: 7414                     je 0x145ac4f22
0000000145ac4f0e: 4e8d04bd00000000         lea r8, [r15*4]
0000000145ac4f16: 498d0cbe                 lea rcx, [r14 + rdi*4]
0000000145ac4f1a: 4c89ea                   mov rdx, r13
0000000145ac4f1d: e8b9ed4c00               call 0x145f93cdb
0000000145ac4f22: 4c01ff                   add rdi, r15
0000000145ac4f25: 48897de8                 mov qword ptr [rbp - 0x18], rdi
0000000145ac4f29: 4d85e4                   test r12, r12
0000000145ac4f2c: 7415                     je 0x145ac4f43
0000000145ac4f2e: 49c1e402                 shl r12, 2
0000000145ac4f32: 41b804000000             mov r8d, 4
0000000145ac4f38: 4c89e9                   mov rcx, r13
0000000145ac4f3b: 4c89e2                   mov rdx, r12
0000000145ac4f3e: e88dd253fa               call 0x1400021d0
0000000145ac4f43: 488d05765eb001           lea rax, [rip + 0x1b05e76]
0000000145ac4f4a: 488945a8                 mov qword ptr [rbp - 0x58], rax
0000000145ac4f4e: 488d05eb61b001           lea rax, [rip + 0x1b061eb]
0000000145ac4f55: 488945b0                 mov qword ptr [rbp - 0x50], rax
0000000145ac4f59: 48895db8                 mov qword ptr [rbp - 0x48], rbx
0000000145ac4f5d: 488d4dc0                 lea rcx, [rbp - 0x40]
0000000145ac4f61: 488d55a8                 lea rdx, [rbp - 0x58]
0000000145ac4f65: e8d6ea1600               call 0x145c33a40
0000000145ac4f6a: 90                       nop
0000000145ac4f6b: 4c8b7dc0                 mov r15, qword ptr [rbp - 0x40]
0000000145ac4f6f: 4c8b65c8                 mov r12, qword ptr [rbp - 0x38]
0000000145ac4f73: 488b5dd0                 mov rbx, qword ptr [rbp - 0x30]
0000000145ac4f77: 488b45d8                 mov rax, qword ptr [rbp - 0x28]
0000000145ac4f7b: 4829f8                   sub rax, rdi
0000000145ac4f7e: 4839c3                   cmp rbx, rax
0000000145ac4f81: 0f8798000000             ja 0x145ac501f
0000000145ac4f87: 4885db                   test rbx, rbx
0000000145ac4f8a: 7414                     je 0x145ac4fa0
0000000145ac4f8c: 4c8d049d00000000         lea r8, [rbx*4]
0000000145ac4f94: 498d0cbe                 lea rcx, [r14 + rdi*4]
0000000145ac4f98: 4c89e2                   mov rdx, r12
0000000145ac4f9b: e83bed4c00               call 0x145f93cdb
0000000145ac4fa0: 4801df                   add rdi, rbx
0000000145ac4fa3: 48897de8                 mov qword ptr [rbp - 0x18], rdi
0000000145ac4fa7: 4d85ff                   test r15, r15
0000000145ac4faa: 7415                     je 0x145ac4fc1
0000000145ac4fac: 49c1e702                 shl r15, 2
0000000145ac4fb0: 41b804000000             mov r8d, 4
0000000145ac4fb6: 4c89e1                   mov rcx, r12
0000000145ac4fb9: 4c89fa                   mov rdx, r15
0000000145ac4fbc: e80fd253fa               call 0x1400021d0
0000000145ac4fc1: 488b45e8                 mov rax, qword ptr [rbp - 0x18]
0000000145ac4fc5: 48894610                 mov qword ptr [rsi + 0x10], rax
0000000145ac4fc9: 0f1045d8                 movups xmm0, xmmword ptr [rbp - 0x28]
0000000145ac4fcd: 0f1106                   movups xmmword ptr [rsi], xmm0
0000000145ac4fd0: 4889f0                   mov rax, rsi
0000000145ac4fd3: 4881c488000000           add rsp, 0x88
0000000145ac4fda: 5b                       pop rbx
0000000145ac4fdb: 5f                       pop rdi
0000000145ac4fdc: 5e                       pop rsi
0000000145ac4fdd: 415c                     pop r12
0000000145ac4fdf: 415d                     pop r13
0000000145ac4fe1: 415e                     pop r14
0000000145ac4fe3: 415f                     pop r15
0000000145ac4fe5: 5d                       pop rbp
0000000145ac4fe6: c3                       ret
0000000145ac4fe7: 4c8965f0                 mov qword ptr [rbp - 0x10], r12
0000000145ac4feb: 48c744242004000000       mov qword ptr [rsp + 0x20], 4
0000000145ac4ff4: 488d4dd8                 lea rcx, [rbp - 0x28]
0000000145ac4ff8: 41b904000000             mov r9d, 4
0000000145ac4ffe: 4889fa                   mov rdx, rdi
0000000145ac5001: 4d89f8                   mov r8, r15
0000000145ac5004: e8e7f04c00               call 0x145f940f0
0000000145ac5009: 90                       nop
0000000145ac500a: 4c8b75e0                 mov r14, qword ptr [rbp - 0x20]
0000000145ac500e: 488b7de8                 mov rdi, qword ptr [rbp - 0x18]
0000000145ac5012: 4c8b65f0                 mov r12, qword ptr [rbp - 0x10]
0000000145ac5016: 4c8b6df8                 mov r13, qword ptr [rbp - 8]
0000000145ac501a: e9effeffff               jmp 0x145ac4f0e
0000000145ac501f: 4c8965f0                 mov qword ptr [rbp - 0x10], r12
0000000145ac5023: 4c897df8                 mov qword ptr [rbp - 8], r15
0000000145ac5027: 48c744242004000000       mov qword ptr [rsp + 0x20], 4
0000000145ac5030: 488d4dd8                 lea rcx, [rbp - 0x28]
0000000145ac5034: 41b904000000             mov r9d, 4
0000000145ac503a: 4889fa                   mov rdx, rdi
0000000145ac503d: 4989d8                   mov r8, rbx
0000000145ac5040: e8abf04c00               call 0x145f940f0
0000000145ac5045: 90                       nop
0000000145ac5046: 4c8b75e0                 mov r14, qword ptr [rbp - 0x20]
0000000145ac504a: 488b7de8                 mov rdi, qword ptr [rbp - 0x18]
0000000145ac504e: 4c8b7df8                 mov r15, qword ptr [rbp - 8]
0000000145ac5052: 4c8b65f0                 mov r12, qword ptr [rbp - 0x10]
0000000145ac5056: e931ffffff               jmp 0x145ac4f8c
