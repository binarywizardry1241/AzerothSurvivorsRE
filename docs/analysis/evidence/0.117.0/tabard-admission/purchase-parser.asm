; EXE 0.117.0 SHA-256 507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293
; Preferred VA [0x145c382a0, 0x145c38458); bytes SHA-256 21815612da179fa7438df7da01fbffaf00376b397836215ae61722e38f048224
; Current EXE bytes decoded with Capstone 5.0.7; no process execution.
0000000145c382a0: 4157                     push r15
0000000145c382a2: 4156                     push r14
0000000145c382a4: 4154                     push r12
0000000145c382a6: 56                       push rsi
0000000145c382a7: 57                       push rdi
0000000145c382a8: 53                       push rbx
0000000145c382a9: 4883ec58                 sub rsp, 0x58
0000000145c382ad: 4889ce                   mov rsi, rcx
0000000145c382b0: 488d81d8000000           lea rax, [rcx + 0xd8]
0000000145c382b7: 4889442448               mov qword ptr [rsp + 0x48], rax
0000000145c382bc: 4889442450               mov qword ptr [rsp + 0x50], rax
0000000145c382c1: 488d7948                 lea rdi, [rcx + 0x48]
0000000145c382c5: 83797cff                 cmp dword ptr [rcx + 0x7c], -1
0000000145c382c9: 0f8491000000             je 0x145c38360
0000000145c382cf: 488d442448               lea rax, [rsp + 0x48]
0000000145c382d4: 4889442428               mov qword ptr [rsp + 0x28], rax
0000000145c382d9: 488d5e58                 lea rbx, [rsi + 0x58]
0000000145c382dd: 4c8d742430               lea r14, [rsp + 0x30]
0000000145c382e2: 4c8d7c2428               lea r15, [rsp + 0x28]
0000000145c382e7: eb2c                     jmp 0x145c38315
0000000145c382e9: 0f1f8000000000           nop dword ptr [rax]
0000000145c382f0: 4c8b442438               mov r8, qword ptr [rsp + 0x38]
0000000145c382f5: 488b442440               mov rax, qword ptr [rsp + 0x40]
0000000145c382fa: 488b0f                   mov rcx, qword ptr [rdi]
0000000145c382fd: 4929c8                   sub r8, rcx
0000000145c38300: 4901cc                   add r12, rcx
0000000145c38303: 488907                   mov qword ptr [rdi], rax
0000000145c38306: 4c89f9                   mov rcx, r15
0000000145c38309: 4c89e2                   mov rdx, r12
0000000145c3830c: e8bf38efff               call 0x145b2bbd0
0000000145c38311: a801                     test al, 1
0000000145c38313: 756c                     jne 0x145c38381
0000000145c38315: 80be8900000000           cmp byte ptr [rsi + 0x89], 0
0000000145c3831c: 7542                     jne 0x145c38360
0000000145c3831e: 4c8b23                   mov r12, qword ptr [rbx]
0000000145c38321: 4c89f1                   mov rcx, r14
0000000145c38324: 4889da                   mov rdx, rbx
0000000145c38327: e884090000               call 0x145c38cb0
0000000145c3832c: 837c243001               cmp dword ptr [rsp + 0x30], 1
0000000145c38331: 74bd                     je 0x145c382f0
0000000145c38333: 80be8900000000           cmp byte ptr [rsi + 0x89], 0
0000000145c3833a: 7524                     jne 0x145c38360
0000000145c3833c: c6868900000001           mov byte ptr [rsi + 0x89], 1
0000000145c38343: 4c8b6648                 mov r12, qword ptr [rsi + 0x48]
0000000145c38347: 4c8b4650                 mov r8, qword ptr [rsi + 0x50]
0000000145c3834b: 4d29e0                   sub r8, r12
0000000145c3834e: 0f95c0                   setne al
0000000145c38351: 0a8688000000             or al, byte ptr [rsi + 0x88]
0000000145c38357: 3c01                     cmp al, 1
0000000145c38359: 7505                     jne 0x145c38360
0000000145c3835b: 4c0323                   add r12, qword ptr [rbx]
0000000145c3835e: eba6                     jmp 0x145c38306
0000000145c38360: c7467cffffffff           mov dword ptr [rsi + 0x7c], 0xffffffff
0000000145c38367: 837e34ff                 cmp dword ptr [rsi + 0x34], -1
0000000145c3836b: 741e                     je 0x145c3838b
0000000145c3836d: 488d542448               lea rdx, [rsp + 0x48]
0000000145c38372: 4889f1                   mov rcx, rsi
0000000145c38375: 4989f8                   mov r8, rdi
0000000145c38378: e86360fdff               call 0x145c0e3e0
0000000145c3837d: a801                     test al, 1
0000000145c3837f: 740a                     je 0x145c3838b
0000000145c38381: b801000000               mov eax, 1
0000000145c38386: e9bf000000               jmp 0x145c3844a
0000000145c3838b: c7467cffffffff           mov dword ptr [rsi + 0x7c], 0xffffffff
0000000145c38392: 83bec4000000ff           cmp dword ptr [rsi + 0xc4], -1
0000000145c38399: 0f849f000000             je 0x145c3843e
0000000145c3839f: 488d442448               lea rax, [rsp + 0x48]
0000000145c383a4: 4889442428               mov qword ptr [rsp + 0x28], rax
0000000145c383a9: 488dbea0000000           lea rdi, [rsi + 0xa0]
0000000145c383b0: 488d5c2430               lea rbx, [rsp + 0x30]
0000000145c383b5: 4c8d742428               lea r14, [rsp + 0x28]
0000000145c383ba: eb31                     jmp 0x145c383ed
0000000145c383bc: 0f1f4000                 nop dword ptr [rax]
0000000145c383c0: 4c8b442438               mov r8, qword ptr [rsp + 0x38]
0000000145c383c5: 488b442440               mov rax, qword ptr [rsp + 0x40]
0000000145c383ca: 488b8e90000000           mov rcx, qword ptr [rsi + 0x90]
0000000145c383d1: 4929c8                   sub r8, rcx
0000000145c383d4: 4901cf                   add r15, rcx
0000000145c383d7: 48898690000000           mov qword ptr [rsi + 0x90], rax
0000000145c383de: 4c89f1                   mov rcx, r14
0000000145c383e1: 4c89fa                   mov rdx, r15
0000000145c383e4: e8e737efff               call 0x145b2bbd0
0000000145c383e9: a801                     test al, 1
0000000145c383eb: 7594                     jne 0x145c38381
0000000145c383ed: 80bed100000000           cmp byte ptr [rsi + 0xd1], 0
0000000145c383f4: 7548                     jne 0x145c3843e
0000000145c383f6: 4c8b3f                   mov r15, qword ptr [rdi]
0000000145c383f9: 4889d9                   mov rcx, rbx
0000000145c383fc: 4889fa                   mov rdx, rdi
0000000145c383ff: e8ac080000               call 0x145c38cb0
0000000145c38404: 837c243001               cmp dword ptr [rsp + 0x30], 1
0000000145c38409: 74b5                     je 0x145c383c0
0000000145c3840b: 80bed100000000           cmp byte ptr [rsi + 0xd1], 0
0000000145c38412: 752a                     jne 0x145c3843e
0000000145c38414: c686d100000001           mov byte ptr [rsi + 0xd1], 1
0000000145c3841b: 4c8bbe90000000           mov r15, qword ptr [rsi + 0x90]
0000000145c38422: 4c8b8698000000           mov r8, qword ptr [rsi + 0x98]
0000000145c38429: 4d29f8                   sub r8, r15
0000000145c3842c: 0f95c0                   setne al
0000000145c3842f: 0a86d0000000             or al, byte ptr [rsi + 0xd0]
0000000145c38435: 3c01                     cmp al, 1
0000000145c38437: 7505                     jne 0x145c3843e
0000000145c38439: 4c033f                   add r15, qword ptr [rdi]
0000000145c3843c: eba0                     jmp 0x145c383de
0000000145c3843e: c786c4000000ffffffff     mov dword ptr [rsi + 0xc4], 0xffffffff
0000000145c38448: 31c0                     xor eax, eax
0000000145c3844a: 4883c458                 add rsp, 0x58
0000000145c3844e: 5b                       pop rbx
0000000145c3844f: 5f                       pop rdi
0000000145c38450: 5e                       pop rsi
0000000145c38451: 415c                     pop r12
0000000145c38453: 415e                     pop r14
0000000145c38455: 415f                     pop r15
0000000145c38457: c3                       ret
