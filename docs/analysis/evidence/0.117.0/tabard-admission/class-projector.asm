; EXE 0.117.0 SHA-256 507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293
; Preferred VA [0x145ac28d0, 0x145ac2a88); bytes SHA-256 0689b4d89002291b098442321302402486dc6d927fab3ec30b300f8b82f59f22
; Capstone 5.0.7; current static bytes, no native process.
0000000145ac28d0: 4157                     push r15
0000000145ac28d2: 4156                     push r14
0000000145ac28d4: 4155                     push r13
0000000145ac28d6: 4154                     push r12
0000000145ac28d8: 56                       push rsi
0000000145ac28d9: 57                       push rdi
0000000145ac28da: 55                       push rbp
0000000145ac28db: 53                       push rbx
0000000145ac28dc: 4881ec98000000           sub rsp, 0x98
0000000145ac28e3: 4c89cb                   mov rbx, r9
0000000145ac28e6: 4d89c6                   mov r14, r8
0000000145ac28e9: 4889d7                   mov rdi, rdx
0000000145ac28ec: 48894c2428               mov qword ptr [rsp + 0x28], rcx
0000000145ac28f1: 0fb682e4000000           movzx eax, byte ptr [rdx + 0xe4]
0000000145ac28f8: 88442427                 mov byte ptr [rsp + 0x27], al
0000000145ac28fc: 488d442427               lea rax, [rsp + 0x27]
0000000145ac2901: 4889442430               mov qword ptr [rsp + 0x30], rax
0000000145ac2906: 4c89442438               mov qword ptr [rsp + 0x38], r8
0000000145ac290b: 4c894c2440               mov qword ptr [rsp + 0x40], r9
0000000145ac2910: 48bdf0ffffffffffff1f     movabs rbp, 0x1ffffffffffffff0
0000000145ac291a: 4c21cd                   and rbp, r9
0000000145ac291d: 83e30f                   and ebx, 0xf
0000000145ac2920: c1e302                   shl ebx, 2
0000000145ac2923: 4531ff                   xor r15d, r15d
0000000145ac2926: 4c8d64244c               lea r12, [rsp + 0x4c]
0000000145ac292b: 4c8d6c2430               lea r13, [rsp + 0x30]
0000000145ac2930: eb1b                     jmp 0x145ac294d
0000000145ac2932: 42c704ff00000000         mov dword ptr [rdi + r15*8], 0
0000000145ac293a: 660f1f440000             nop word ptr [rax + rax]
0000000145ac2940: 49ffc7                   inc r15
0000000145ac2943: 4983ff13                 cmp r15, 0x13
0000000145ac2947: 0f840e010000             je 0x145ac2a5b
0000000145ac294d: 428b94bf98000000         mov edx, dword ptr [rdi + r15*4 + 0x98]
0000000145ac2955: 85d2                     test edx, edx
0000000145ac2957: 741b                     je 0x145ac2974
0000000145ac2959: 4c89e9                   mov rcx, r13
0000000145ac295c: 4d89f8                   mov r8, r15
0000000145ac295f: e84cf7ffff               call 0x145ac20b0
0000000145ac2964: 84c0                     test al, al
0000000145ac2966: 750c                     jne 0x145ac2974
0000000145ac2968: 42c784bf9800000000000000 mov dword ptr [rdi + r15*4 + 0x98], 0
0000000145ac2974: 42833cff01               cmp dword ptr [rdi + r15*8], 1
0000000145ac2979: 75c5                     jne 0x145ac2940
0000000145ac297b: 428b74ff04               mov esi, dword ptr [rdi + r15*8 + 4]
0000000145ac2980: 440fb6442427             movzx r8d, byte ptr [rsp + 0x27]
0000000145ac2986: 4c89e1                   mov rcx, r12
0000000145ac2989: 0fb6942400010000         movzx edx, byte ptr [rsp + 0x100]
0000000145ac2991: e87a2fffff               call 0x145ab5910
0000000145ac2996: 85f6                     test esi, esi
0000000145ac2998: 74a6                     je 0x145ac2940
0000000145ac299a: 423974bc4c               cmp dword ptr [rsp + r15*4 + 0x4c], esi
0000000145ac299f: 749f                     je 0x145ac2940
0000000145ac29a1: 4c89e9                   mov rcx, r13
0000000145ac29a4: 89f2                     mov edx, esi
0000000145ac29a6: 4d89f8                   mov r8, r15
0000000145ac29a9: e802f7ffff               call 0x145ac20b0
0000000145ac29ae: 84c0                     test al, al
0000000145ac29b0: 758e                     jne 0x145ac2940
0000000145ac29b2: 8d860ba0feff             lea eax, [rsi - 0x15ff5]
0000000145ac29b8: 83f80d                   cmp eax, 0xd
0000000145ac29bb: 0f8771ffffff             ja 0x145ac2932
0000000145ac29c1: 89c0                     mov eax, eax
0000000145ac29c3: 488d0d66c18001           lea rcx, [rip + 0x180c166]
0000000145ac29ca: 488b04c1                 mov rax, qword ptr [rcx + rax*8]
0000000145ac29ce: 0fb6403c                 movzx eax, byte ptr [rax + 0x3c]
0000000145ac29d2: 4939c7                   cmp r15, rax
0000000145ac29d5: 0f8557ffffff             jne 0x145ac2932
0000000145ac29db: 660f6ec6                 movd xmm0, esi
0000000145ac29df: 660f70c000               pshufd xmm0, xmm0, 0
0000000145ac29e4: 31c0                     xor eax, eax
0000000145ac29e6: 662e0f1f840000000000     nop word ptr cs:[rax + rax]
0000000145ac29f0: 4839c5                   cmp rbp, rax
0000000145ac29f3: 7448                     je 0x145ac2a3d
0000000145ac29f5: f3410f6f0c86             movdqu xmm1, xmmword ptr [r14 + rax*4]
0000000145ac29fb: f3410f6f548610           movdqu xmm2, xmmword ptr [r14 + rax*4 + 0x10]
0000000145ac2a02: f3410f6f5c8620           movdqu xmm3, xmmword ptr [r14 + rax*4 + 0x20]
0000000145ac2a09: f3410f6f648630           movdqu xmm4, xmmword ptr [r14 + rax*4 + 0x30]
0000000145ac2a10: 660f76d0                 pcmpeqd xmm2, xmm0
0000000145ac2a14: 660f76c8                 pcmpeqd xmm1, xmm0
0000000145ac2a18: 660f6bca                 packssdw xmm1, xmm2
0000000145ac2a1c: 660f76d8                 pcmpeqd xmm3, xmm0
0000000145ac2a20: 660f76e0                 pcmpeqd xmm4, xmm0
0000000145ac2a24: 660f6bdc                 packssdw xmm3, xmm4
0000000145ac2a28: 660f63cb                 packsswb xmm1, xmm3
0000000145ac2a2c: 660fd7c9                 pmovmskb ecx, xmm1
0000000145ac2a30: 4883c010                 add rax, 0x10
0000000145ac2a34: 85c9                     test ecx, ecx
0000000145ac2a36: 74b8                     je 0x145ac29f0
0000000145ac2a38: e903ffffff               jmp 0x145ac2940
0000000145ac2a3d: 31c0                     xor eax, eax
0000000145ac2a3f: 90                       nop
0000000145ac2a40: 4839c3                   cmp rbx, rax
0000000145ac2a43: 0f84e9feffff             je 0x145ac2932
0000000145ac2a49: 498d0cae                 lea rcx, [r14 + rbp*4]
0000000145ac2a4d: 393401                   cmp dword ptr [rcx + rax], esi
0000000145ac2a50: 488d4004                 lea rax, [rax + 4]
0000000145ac2a54: 75ea                     jne 0x145ac2a40
0000000145ac2a56: e9e5feffff               jmp 0x145ac2940
0000000145ac2a5b: 41b8e8000000             mov r8d, 0xe8
0000000145ac2a61: 488b742428               mov rsi, qword ptr [rsp + 0x28]
0000000145ac2a66: 4889f1                   mov rcx, rsi
0000000145ac2a69: 4889fa                   mov rdx, rdi
0000000145ac2a6c: e86a124d00               call 0x145f93cdb
0000000145ac2a71: 4889f0                   mov rax, rsi
0000000145ac2a74: 4881c498000000           add rsp, 0x98
0000000145ac2a7b: 5b                       pop rbx
0000000145ac2a7c: 5d                       pop rbp
0000000145ac2a7d: 5f                       pop rdi
0000000145ac2a7e: 5e                       pop rsi
0000000145ac2a7f: 415c                     pop r12
0000000145ac2a81: 415d                     pop r13
0000000145ac2a83: 415e                     pop r14
0000000145ac2a85: 415f                     pop r15
0000000145ac2a87: c3                       ret
