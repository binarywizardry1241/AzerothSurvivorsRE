; Current0.117.0 [0x145ac28d0,0x145ac2a88) SHA-256 0689b4d89002291b098442321302402486dc6d927fab3ec30b300f8b82f59f22
145ac28d0  4157                     push r15
145ac28d2  4156                     push r14
145ac28d4  4155                     push r13
145ac28d6  4154                     push r12
145ac28d8  56                       push rsi
145ac28d9  57                       push rdi
145ac28da  55                       push rbp
145ac28db  53                       push rbx
145ac28dc  4881ec98000000           sub rsp, 0x98
145ac28e3  4c89cb                   mov rbx, r9
145ac28e6  4d89c6                   mov r14, r8
145ac28e9  4889d7                   mov rdi, rdx
145ac28ec  48894c2428               mov qword ptr [rsp + 0x28], rcx
145ac28f1  0fb682e4000000           movzx eax, byte ptr [rdx + 0xe4]
145ac28f8  88442427                 mov byte ptr [rsp + 0x27], al
145ac28fc  488d442427               lea rax, [rsp + 0x27]
145ac2901  4889442430               mov qword ptr [rsp + 0x30], rax
145ac2906  4c89442438               mov qword ptr [rsp + 0x38], r8
145ac290b  4c894c2440               mov qword ptr [rsp + 0x40], r9
145ac2910  48bdf0ffffffffffff1f     movabs rbp, 0x1ffffffffffffff0
145ac291a  4c21cd                   and rbp, r9
145ac291d  83e30f                   and ebx, 0xf
145ac2920  c1e302                   shl ebx, 2
145ac2923  4531ff                   xor r15d, r15d
145ac2926  4c8d64244c               lea r12, [rsp + 0x4c]
145ac292b  4c8d6c2430               lea r13, [rsp + 0x30]
145ac2930  eb1b                     jmp 0x145ac294d
145ac2932  42c704ff00000000         mov dword ptr [rdi + r15*8], 0
145ac293a  660f1f440000             nop word ptr [rax + rax]
145ac2940  49ffc7                   inc r15
145ac2943  4983ff13                 cmp r15, 0x13
145ac2947  0f840e010000             je 0x145ac2a5b
145ac294d  428b94bf98000000         mov edx, dword ptr [rdi + r15*4 + 0x98]
145ac2955  85d2                     test edx, edx
145ac2957  741b                     je 0x145ac2974
145ac2959  4c89e9                   mov rcx, r13
145ac295c  4d89f8                   mov r8, r15
145ac295f  e84cf7ffff               call 0x145ac20b0
145ac2964  84c0                     test al, al
145ac2966  750c                     jne 0x145ac2974
145ac2968  42c784bf9800000000000000 mov dword ptr [rdi + r15*4 + 0x98], 0
145ac2974  42833cff01               cmp dword ptr [rdi + r15*8], 1
145ac2979  75c5                     jne 0x145ac2940
145ac297b  428b74ff04               mov esi, dword ptr [rdi + r15*8 + 4]
145ac2980  440fb6442427             movzx r8d, byte ptr [rsp + 0x27]
145ac2986  4c89e1                   mov rcx, r12
145ac2989  0fb6942400010000         movzx edx, byte ptr [rsp + 0x100]
145ac2991  e87a2fffff               call 0x145ab5910
145ac2996  85f6                     test esi, esi
145ac2998  74a6                     je 0x145ac2940
145ac299a  423974bc4c               cmp dword ptr [rsp + r15*4 + 0x4c], esi
145ac299f  749f                     je 0x145ac2940
145ac29a1  4c89e9                   mov rcx, r13
145ac29a4  89f2                     mov edx, esi
145ac29a6  4d89f8                   mov r8, r15
145ac29a9  e802f7ffff               call 0x145ac20b0
145ac29ae  84c0                     test al, al
145ac29b0  758e                     jne 0x145ac2940
145ac29b2  8d860ba0feff             lea eax, [rsi - 0x15ff5]
145ac29b8  83f80d                   cmp eax, 0xd
145ac29bb  0f8771ffffff             ja 0x145ac2932
145ac29c1  89c0                     mov eax, eax
145ac29c3  488d0d66c18001           lea rcx, [rip + 0x180c166]
145ac29ca  488b04c1                 mov rax, qword ptr [rcx + rax*8]
145ac29ce  0fb6403c                 movzx eax, byte ptr [rax + 0x3c]
145ac29d2  4939c7                   cmp r15, rax
145ac29d5  0f8557ffffff             jne 0x145ac2932
145ac29db  660f6ec6                 movd xmm0, esi
145ac29df  660f70c000               pshufd xmm0, xmm0, 0
145ac29e4  31c0                     xor eax, eax
145ac29e6  662e0f1f840000000000     nop word ptr cs:[rax + rax]
145ac29f0  4839c5                   cmp rbp, rax
145ac29f3  7448                     je 0x145ac2a3d
145ac29f5  f3410f6f0c86             movdqu xmm1, xmmword ptr [r14 + rax*4]
145ac29fb  f3410f6f548610           movdqu xmm2, xmmword ptr [r14 + rax*4 + 0x10]
145ac2a02  f3410f6f5c8620           movdqu xmm3, xmmword ptr [r14 + rax*4 + 0x20]
145ac2a09  f3410f6f648630           movdqu xmm4, xmmword ptr [r14 + rax*4 + 0x30]
145ac2a10  660f76d0                 pcmpeqd xmm2, xmm0
145ac2a14  660f76c8                 pcmpeqd xmm1, xmm0
145ac2a18  660f6bca                 packssdw xmm1, xmm2
145ac2a1c  660f76d8                 pcmpeqd xmm3, xmm0
145ac2a20  660f76e0                 pcmpeqd xmm4, xmm0
145ac2a24  660f6bdc                 packssdw xmm3, xmm4
145ac2a28  660f63cb                 packsswb xmm1, xmm3
145ac2a2c  660fd7c9                 pmovmskb ecx, xmm1
145ac2a30  4883c010                 add rax, 0x10
145ac2a34  85c9                     test ecx, ecx
145ac2a36  74b8                     je 0x145ac29f0
145ac2a38  e903ffffff               jmp 0x145ac2940
145ac2a3d  31c0                     xor eax, eax
145ac2a3f  90                       nop
145ac2a40  4839c3                   cmp rbx, rax
145ac2a43  0f84e9feffff             je 0x145ac2932
145ac2a49  498d0cae                 lea rcx, [r14 + rbp*4]
145ac2a4d  393401                   cmp dword ptr [rcx + rax], esi
145ac2a50  488d4004                 lea rax, [rax + 4]
145ac2a54  75ea                     jne 0x145ac2a40
145ac2a56  e9e5feffff               jmp 0x145ac2940
145ac2a5b  41b8e8000000             mov r8d, 0xe8
145ac2a61  488b742428               mov rsi, qword ptr [rsp + 0x28]
145ac2a66  4889f1                   mov rcx, rsi
145ac2a69  4889fa                   mov rdx, rdi
145ac2a6c  e86a124d00               call 0x145f93cdb
145ac2a71  4889f0                   mov rax, rsi
145ac2a74  4881c498000000           add rsp, 0x98
145ac2a7b  5b                       pop rbx
145ac2a7c  5d                       pop rbp
145ac2a7d  5f                       pop rdi
145ac2a7e  5e                       pop rsi
145ac2a7f  415c                     pop r12
145ac2a81  415d                     pop r13
145ac2a83  415e                     pop r14
145ac2a85  415f                     pop r15
145ac2a87  c3                       ret
