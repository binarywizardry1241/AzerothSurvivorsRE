; cast-kind-dispatch; exact current original bytes
0000000145b31fce 0fb65675               movzx edx, byte ptr [rsi + 0x75]
0000000145b31fd2 448d42fe               lea r8d, [rdx - 2]
0000000145b31fd6 4180f806               cmp r8b, 6
0000000145b31fda 7713                   ja 0x145b31fef
0000000145b31fdc 450fb6c0               movzx r8d, r8b
0000000145b31fe0 4c8d0d21bf7f01         lea r9, [rip + 0x17fbf21]
0000000145b31fe7 f3430f100c81           movss xmm1, dword ptr [r9 + r8*4]
0000000145b31fed eb08                   jmp 0x145b31ff7
0000000145b31fef f30f100d09026800       movss xmm1, dword ptr [rip + 0x680209]
0000000145b31ff7 4c8db720050000         lea r14, [rdi + 0x520]
0000000145b31ffe f3410f10554c           movss xmm2, dword ptr [r13 + 0x4c]
0000000145b32004 f30f59d7               mulss xmm2, xmm7
0000000145b32008 660fefdb               pxor xmm3, xmm3
0000000145b3200c f30fc2d801             cmpltss xmm3, xmm0
0000000145b32011 0f54da                 andps xmm3, xmm2
0000000145b32014 f30f59059c016800       mulss xmm0, dword ptr [rip + 0x68019c]
0000000145b3201c f3410f59c1             mulss xmm0, xmm9
0000000145b32021 f3410f59c3             mulss xmm0, xmm11
0000000145b32026 f30f59c1               mulss xmm0, xmm1
0000000145b3202a f30f58c3               addss xmm0, xmm3
0000000145b3202e f3440f59d0             mulss xmm10, xmm0
0000000145b32033 89d2                   mov edx, edx
0000000145b32035 4c8d059cc27f01         lea r8, [rip + 0x17fc29c]
0000000145b3203c 49631490               movsxd rdx, dword ptr [r8 + rdx*4]
0000000145b32040 4c01c2                 add rdx, r8
0000000145b32043 4889bd58010000         mov qword ptr [rbp + 0x158], rdi
0000000145b3204a 4889b550010000         mov qword ptr [rbp + 0x150], rsi
0000000145b32051 ffe2                   jmp rdx

; kind2-target-and-alias; exact current original bytes
0000000145b322b5 f3410f10451c           movss xmm0, dword ptr [r13 + 0x1c]
0000000145b322bb f3410f594544           mulss xmm0, dword ptr [r13 + 0x44]
0000000145b322c1 f30f594650             mulss xmm0, dword ptr [rsi + 0x50]
0000000145b322c6 f30f59f0               mulss xmm6, xmm0
0000000145b322ca f30f1005b2269900       movss xmm0, dword ptr [rip + 0x9926b2]
0000000145b322d2 0f2ec6                 ucomiss xmm0, xmm6
0000000145b322d5 732b                   jae 0x145b32302
0000000145b322d7 f30f5835cda34901       addss xmm6, dword ptr [rip + 0x149a3cd]
0000000145b322df f30f103d29016800       movss xmm7, dword ptr [rip + 0x680129]
0000000145b322e7 f30f5ef7               divss xmm6, xmm7
0000000145b322eb 0f28c6                 movaps xmm0, xmm6
0000000145b322ee e8ba2e4d00             call 0x1460051ad
0000000145b322f3 0f28f0                 movaps xmm6, xmm0
0000000145b322f6 f30f59f7               mulss xmm6, xmm7
0000000145b322fa f30f583582269900       addss xmm6, dword ptr [rip + 0x992682]
0000000145b32302 418b4608               mov eax, dword ptr [r14 + 8]
0000000145b32306 8985a8000000           mov dword ptr [rbp + 0xa8], eax
0000000145b3230c 498b06                 mov rax, qword ptr [r14]
0000000145b3230f 488985a0000000         mov qword ptr [rbp + 0xa0], rax
0000000145b32316 48c744242800000000     mov qword ptr [rsp + 0x28], 0
0000000145b3231f 48c744242008000000     mov qword ptr [rsp + 0x20], 8
0000000145b32328 488d8d30010000         lea rcx, [rbp + 0x130]
0000000145b3232f 4c8d85a0000000         lea r8, [rbp + 0xa0]
0000000145b32336 4889fa                 mov rdx, rdi
0000000145b32339 0f28de                 movaps xmm3, xmm6
0000000145b3233c e81f870000             call 0x145b3aa60
0000000145b32341 4c8bbd40010000         mov r15, qword ptr [rbp + 0x140]
0000000145b32348 4d85ff                 test r15, r15
0000000145b3234b 750a                   jne 0x145b32357
0000000145b3234d 837e6806               cmp dword ptr [rsi + 0x68], 6
0000000145b32351 0f85e90f0000           jne 0x145b33340
0000000145b32357 488b97b0040000         mov rdx, qword ptr [rdi + 0x4b0]
0000000145b3235e 8b4640                 mov eax, dword ptr [rsi + 0x40]
0000000145b32361 3dff050000             cmp eax, 0x5ff
0000000145b32366 41b89d200000           mov r8d, 0x209d
0000000145b3236c 440f45c0               cmovne r8d, eax
0000000145b32370 4c8b8d38010000         mov r9, qword ptr [rbp + 0x138]
0000000145b32377 c7454802000000         mov dword ptr [rbp + 0x48], 2
0000000145b3237e c7858000000000000000   mov dword ptr [rbp + 0x80], 0
0000000145b32388 c6856401000001         mov byte ptr [rbp + 0x164], 1
0000000145b3238f 488d8580000000         lea rax, [rbp + 0x80]
0000000145b32396 4889442430             mov qword ptr [rsp + 0x30], rax
0000000145b3239b 488d4548               lea rax, [rbp + 0x48]
0000000145b3239f 4889442428             mov qword ptr [rsp + 0x28], rax
0000000145b323a4 4c897c2420             mov qword ptr [rsp + 0x20], r15
0000000145b323a9 488d8da0000000         lea rcx, [rbp + 0xa0]
0000000145b323b0 4c898d58010000         mov qword ptr [rbp + 0x158], r9
0000000145b323b7 e8a41d1400             call 0x145c74160

; serialized-spell-id; exact current original bytes
0000000145c74183 4c89cf                 mov rdi, r9
0000000145c74186 4489c3                 mov ebx, r8d
0000000145c74189 4989d6                 mov r14, rdx
0000000145c7418c 4889ce                 mov rsi, rcx
0000000145c7418f 488b85b0000000         mov rax, qword ptr [rbp + 0xb0]
0000000145c74196 448b20                 mov r12d, dword ptr [rax]
0000000145c74199 e862e038fa             call 0x140002200
0000000145c7419e b920000000             mov ecx, 0x20
0000000145c741a3 ba01000000             mov edx, 1
0000000145c741a8 e813e038fa             call 0x1400021c0
0000000145c741ad 4885c0                 test rax, rax
0000000145c741b0 0f841d050000           je 0x145c746d3
0000000145c741b6 66c745283201           mov word ptr [rbp + 0x28], 0x132
0000000145c741bc 48c7451020000000       mov qword ptr [rbp + 0x10], 0x20
0000000145c741c4 48894518               mov qword ptr [rbp + 0x18], rax
0000000145c741c8 48c7452000000000       mov qword ptr [rbp + 0x20], 0
0000000145c741d0 488d5510               lea rdx, [rbp + 0x10]
0000000145c741d4 4c89f1                 mov rcx, r14
0000000145c741d7 e894a9e3ff             call 0x145aaeb70
0000000145c741dc 90                     nop 
0000000145c741dd 0f104510               movups xmm0, xmmword ptr [rbp + 0x10]
0000000145c741e1 0f104d20               movups xmm1, xmmword ptr [rbp + 0x20]
0000000145c741e5 0f294d00               movaps xmmword ptr [rbp], xmm1
0000000145c741e9 0f2945f0               movaps xmmword ptr [rbp - 0x10], xmm0
0000000145c741ed 488d55f0               lea rdx, [rbp - 0x10]
0000000145c741f1 4c89f1                 mov rcx, r14
0000000145c741f4 e877a9e3ff             call 0x145aaeb70
0000000145c741f9 90                     nop 
0000000145c741fa 0f2845f0               movaps xmm0, xmmword ptr [rbp - 0x10]
0000000145c741fe 0f284d00               movaps xmm1, xmmword ptr [rbp]
0000000145c74202 0f294d20               movaps xmmword ptr [rbp + 0x20], xmm1
0000000145c74206 0f294510               movaps xmmword ptr [rbp + 0x10], xmm0
0000000145c7420a 488b5520               mov rdx, qword ptr [rbp + 0x20]
0000000145c7420e 488b4510               mov rax, qword ptr [rbp + 0x10]
0000000145c74212 4829d0                 sub rax, rdx
0000000145c74215 4883f803               cmp rax, 3
0000000145c74219 0f869c030000           jbe 0x145c745bb
0000000145c7421f 488b4518               mov rax, qword ptr [rbp + 0x18]
0000000145c74223 891c10                 mov dword ptr [rax + rdx], ebx
0000000145c74226 4883c204               add rdx, 4
0000000145c7422a 48895520               mov qword ptr [rbp + 0x20], rdx

