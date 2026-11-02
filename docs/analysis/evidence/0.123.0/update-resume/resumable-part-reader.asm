0000000140061b50 55                             push rbp
0000000140061b51 4157                           push r15
0000000140061b53 4156                           push r14
0000000140061b55 4155                           push r13
0000000140061b57 4154                           push r12
0000000140061b59 56                             push rsi
0000000140061b5a 57                             push rdi
0000000140061b5b 53                             push rbx
0000000140061b5c 4881ec58040000                 sub rsp, 0x458
0000000140061b63 488dac2480000000               lea rbp, [rsp + 0x80]
0000000140061b6b 660f29b5c0030000               movapd xmmword ptr [rbp + 0x3c0], xmm6
0000000140061b73 48c785b8030000feffffff         mov qword ptr [rbp + 0x3b8], 0xfffffffffffffffe
0000000140061b7e 4c898560030000                 mov qword ptr [rbp + 0x360], r8
0000000140061b85 4889d3                         mov rbx, rdx
0000000140061b88 4889cf                         mov rdi, rcx
0000000140061b8b 488d4158                       lea rax, [rcx + 0x58]
0000000140061b8f 48898568030000                 mov qword ptr [rbp + 0x368], rax
0000000140061b96 4c8dadc0000000                 lea r13, [rbp + 0xc0]
0000000140061b9d 488db5d0010000                 lea rsi, [rbp + 0x1d0]
0000000140061ba4 4c8d3541871506                 lea r14, [rip + 0x6158741]
0000000140061bab 48898d90030000                 mov qword ptr [rbp + 0x390], rcx
0000000140061bb2 eb0c                           jmp 0x140061bc0
0000000140061bb4 48c7474800000000               mov qword ptr [rdi + 0x48], 0
0000000140061bbc 0f1f4000                       nop dword ptr [rax]
0000000140061bc0 4c8b4728                       mov r8, qword ptr [rdi + 0x28]
0000000140061bc4 4d85c0                         test r8, r8
0000000140061bc7 7457                           je 0x140061c20
0000000140061bc9 4c8b7f38                       mov r15, qword ptr [rdi + 0x38]
0000000140061bcd 4c8b6740                       mov r12, qword ptr [rdi + 0x40]
0000000140061bd1 488b4f48                       mov rcx, qword ptr [rdi + 0x48]
0000000140061bd5 4885c9                         test rcx, rcx
0000000140061bd8 0f8484000000                   je 0x140061c62
0000000140061bde 488b4750                       mov rax, qword ptr [rdi + 0x50]
0000000140061be2 4889da                         mov rdx, rbx
0000000140061be5 4c8b8560030000                 mov r8, qword ptr [rbp + 0x360]
0000000140061bec ff5018                         call qword ptr [rax + 0x18]
0000000140061bef 488995a8030000                 mov qword ptr [rbp + 0x3a8], rdx
0000000140061bf6 a801                           test al, 1
0000000140061bf8 0f8492030000                   je 0x140061f90
0000000140061bfe 4c8ba5a8030000                 mov r12, qword ptr [rbp + 0x3a8]
0000000140061c05 4589e7                         mov r15d, r12d
0000000140061c08 4183e703                       and r15d, 3
0000000140061c0c 4b6304be                       movsxd rax, dword ptr [r14 + r15*4]
0000000140061c10 4c01f0                         add rax, r14
0000000140061c13 ffe0                           jmp rax
0000000140061c15 66662e0f1f840000000000         nop word ptr cs:[rax + rax]
0000000140061c20 488b4710                       mov rax, qword ptr [rdi + 0x10]
0000000140061c24 483b4718                       cmp rax, qword ptr [rdi + 0x18]
0000000140061c28 0f84c1070000                   je 0x1400623ef
0000000140061c2e 488d4820                       lea rcx, [rax + 0x20]
0000000140061c32 48894f10                       mov qword ptr [rdi + 0x10], rcx
0000000140061c36 4c8b4008                       mov r8, qword ptr [rax + 8]
0000000140061c3a 4c8b7818                       mov r15, qword ptr [rax + 0x18]
0000000140061c3e 0f104010                       movups xmm0, xmmword ptr [rax + 0x10]
0000000140061c42 4c894728                       mov qword ptr [rdi + 0x28], r8
0000000140061c46 0f114730                       movups xmmword ptr [rdi + 0x30], xmm0
0000000140061c4a 48c7474000000000               mov qword ptr [rdi + 0x40], 0
0000000140061c52 4531e4                         xor r12d, r12d
0000000140061c55 488b4f48                       mov rcx, qword ptr [rdi + 0x48]
0000000140061c59 4885c9                         test rcx, rcx
0000000140061c5c 0f857cffffff                   jne 0x140061bde
0000000140061c62 4c8b4f30                       mov r9, qword ptr [rdi + 0x30]
0000000140061c66 4c89a570030000                 mov qword ptr [rbp + 0x370], r12
0000000140061c6d 488d8df0020000                 lea rcx, [rbp + 0x2f0]
0000000140061c74 4889fa                         mov rdx, rdi
0000000140061c77 e8a4504100                     call 0x140476d20
0000000140061c7c 4d85e4                         test r12, r12
0000000140061c7f 0f845b010000                   je 0x140061de0
0000000140061c85 488b8550030000                 mov rax, qword ptr [rbp + 0x350]
0000000140061c8c 48898530020000                 mov qword ptr [rbp + 0x230], rax
0000000140061c93 0f108540030000                 movups xmm0, xmmword ptr [rbp + 0x340]
0000000140061c9a 0f298520020000                 movaps xmmword ptr [rbp + 0x220], xmm0
0000000140061ca1 0f108530030000                 movups xmm0, xmmword ptr [rbp + 0x330]
0000000140061ca8 0f298510020000                 movaps xmmword ptr [rbp + 0x210], xmm0
0000000140061caf 0f1085f0020000                 movups xmm0, xmmword ptr [rbp + 0x2f0]
0000000140061cb6 0f108d00030000                 movups xmm1, xmmword ptr [rbp + 0x300]
0000000140061cbd 0f109510030000                 movups xmm2, xmmword ptr [rbp + 0x310]
0000000140061cc4 0f109d20030000                 movups xmm3, xmmword ptr [rbp + 0x320]
0000000140061ccb 0f299d00020000                 movaps xmmword ptr [rbp + 0x200], xmm3
0000000140061cd2 0f2995f0010000                 movaps xmmword ptr [rbp + 0x1f0], xmm2
0000000140061cd9 0f298de0010000                 movaps xmmword ptr [rbp + 0x1e0], xmm1
0000000140061ce0 0f2985d0010000                 movaps xmmword ptr [rbp + 0x1d0], xmm0
0000000140061ce7 488d8570030000                 lea rax, [rbp + 0x370]
0000000140061cee 488985e0020000                 mov qword ptr [rbp + 0x2e0], rax
0000000140061cf5 488d05448af805                 lea rax, [rip + 0x5f88a44]
0000000140061cfc 488985e8020000                 mov qword ptr [rbp + 0x2e8], rax
0000000140061d03 4c89e9                         mov rcx, r13
0000000140061d06 488d15fb721506                 lea rdx, [rip + 0x61572fb]
0000000140061d0d 4c8d85e0020000                 lea r8, [rbp + 0x2e0]
0000000140061d14 e88760f705                     call 0x145fd7da0
0000000140061d19 90                             nop
0000000140061d1a 488b85c0000000                 mov rax, qword ptr [rbp + 0xc0]
0000000140061d21 488985a8030000                 mov qword ptr [rbp + 0x3a8], rax
0000000140061d28 488b8dc8000000                 mov rcx, qword ptr [rbp + 0xc8]
0000000140061d2f 488b85d0000000                 mov rax, qword ptr [rbp + 0xd0]
0000000140061d36 4889442428                     mov qword ptr [rsp + 0x28], rax
0000000140061d3b 48898da0030000                 mov qword ptr [rbp + 0x3a0], rcx
0000000140061d42 48894c2420                     mov qword ptr [rsp + 0x20], rcx
0000000140061d47 41b905000000                   mov r9d, 5
0000000140061d4d 4c89e9                         mov rcx, r13
0000000140061d50 4889f2                         mov rdx, rsi
0000000140061d53 4c8d05b9721506                 lea r8, [rip + 0x61572b9]
0000000140061d5a e8118c4100                     call 0x14047a970
0000000140061d5f 90                             nop
0000000140061d60 0f1085c0000000                 movups xmm0, xmmword ptr [rbp + 0xc0]
0000000140061d67 0f108dd0000000                 movups xmm1, xmmword ptr [rbp + 0xd0]
0000000140061d6e 0f1095e0000000                 movups xmm2, xmmword ptr [rbp + 0xe0]
0000000140061d75 0f109df0000000                 movups xmm3, xmmword ptr [rbp + 0xf0]
0000000140061d7c 0f2985f0020000                 movaps xmmword ptr [rbp + 0x2f0], xmm0
0000000140061d83 0f298d00030000                 movaps xmmword ptr [rbp + 0x300], xmm1
0000000140061d8a 0f299510030000                 movaps xmmword ptr [rbp + 0x310], xmm2
0000000140061d91 0f299d20030000                 movaps xmmword ptr [rbp + 0x320], xmm3
0000000140061d98 0f108500010000                 movups xmm0, xmmword ptr [rbp + 0x100]
0000000140061d9f 0f298530030000                 movaps xmmword ptr [rbp + 0x330], xmm0
0000000140061da6 0f108510010000                 movups xmm0, xmmword ptr [rbp + 0x110]
0000000140061dad 0f298540030000                 movaps xmmword ptr [rbp + 0x340], xmm0
0000000140061db4 488b8520010000                 mov rax, qword ptr [rbp + 0x120]
0000000140061dbb 48898550030000                 mov qword ptr [rbp + 0x350], rax
0000000140061dc2 488b95a8030000                 mov rdx, qword ptr [rbp + 0x3a8]
0000000140061dc9 4885d2                         test rdx, rdx
0000000140061dcc 7412                           je 0x140061de0
0000000140061dce 41b801000000                   mov r8d, 1
0000000140061dd4 488b8da0030000                 mov rcx, qword ptr [rbp + 0x3a0]
0000000140061ddb e8f003faff                     call 0x1400021d0
0000000140061de0 488b8550030000                 mov rax, qword ptr [rbp + 0x350]
0000000140061de7 48898530020000                 mov qword ptr [rbp + 0x230], rax
0000000140061dee 0f288540030000                 movaps xmm0, xmmword ptr [rbp + 0x340]
0000000140061df5 0f298520020000                 movaps xmmword ptr [rbp + 0x220], xmm0
0000000140061dfc 0f288530030000                 movaps xmm0, xmmword ptr [rbp + 0x330]
0000000140061e03 0f298510020000                 movaps xmmword ptr [rbp + 0x210], xmm0
0000000140061e0a 0f2885f0020000                 movaps xmm0, xmmword ptr [rbp + 0x2f0]
0000000140061e11 0f288d00030000                 movaps xmm1, xmmword ptr [rbp + 0x300]
0000000140061e18 660f289510030000               movapd xmm2, xmmword ptr [rbp + 0x310]
0000000140061e20 660f289d20030000               movapd xmm3, xmmword ptr [rbp + 0x320]
0000000140061e28 660f299d00020000               movapd xmmword ptr [rbp + 0x200], xmm3
0000000140061e30 660f2995f0010000               movapd xmmword ptr [rbp + 0x1f0], xmm2
0000000140061e38 0f298de0010000                 movaps xmmword ptr [rbp + 0x1e0], xmm1
0000000140061e3f 0f2985d0010000                 movaps xmmword ptr [rbp + 0x1d0], xmm0
0000000140061e46 4c89e9                         mov rcx, r13
0000000140061e49 4889f2                         mov rdx, rsi
0000000140061e4c e81f8c4100                     call 0x14047aa70
0000000140061e51 4883bdc0000000fe               cmp qword ptr [rbp + 0xc0], -2
0000000140061e59 0f8569010000                   jne 0x140061fc8
0000000140061e5f 660f10b5c8000000               movupd xmm6, xmmword ptr [rbp + 0xc8]
0000000140061e67 41b8f8000000                   mov r8d, 0xf8
0000000140061e6d 488d4dc8                       lea rcx, [rbp - 0x38]
0000000140061e71 488d95d8000000                 lea rdx, [rbp + 0xd8]
0000000140061e78 e8ce31fa05                     call 0x14600504b
0000000140061e7d 660f1175b8                     movupd xmmword ptr [rbp - 0x48], xmm6
0000000140061e82 0fb7bdb8000000                 movzx edi, word ptr [rbp + 0xb8]
0000000140061e89 488d4db8                       lea rcx, [rbp - 0x48]
0000000140061e8d e82eac4100                     call 0x14047cac0
0000000140061e92 488985a0030000                 mov qword ptr [rbp + 0x3a0], rax
0000000140061e99 488985c0000000                 mov qword ptr [rbp + 0xc0], rax
0000000140061ea0 488995a8030000                 mov qword ptr [rbp + 0x3a8], rdx
0000000140061ea7 488995c8000000                 mov qword ptr [rbp + 0xc8], rdx
0000000140061eae 4d85e4                         test r12, r12
0000000140061eb1 0f84f5010000                   je 0x1400620ac
0000000140061eb7 0fb7c7                         movzx eax, di
0000000140061eba 3dce000000                     cmp eax, 0xce
0000000140061ebf 488bbd90030000                 mov rdi, qword ptr [rbp + 0x390]
0000000140061ec6 0f84e7010000                   je 0x1400620b3
0000000140061ecc 4889f1                         mov rcx, rsi
0000000140061ecf 4c89e8                         mov rax, r13
0000000140061ed2 4989dd                         mov r13, rbx
0000000140061ed5 488985d0010000                 mov qword ptr [rbp + 0x1d0], rax
0000000140061edc 488b8570030000                 mov rax, qword ptr [rbp + 0x370]
0000000140061ee3 488985d8010000                 mov qword ptr [rbp + 0x1d8], rax
0000000140061eea 488985e0010000                 mov qword ptr [rbp + 0x1e0], rax
0000000140061ef1 488d9587030000                 lea rdx, [rbp + 0x387]
0000000140061ef8 e8e3121b00                     call 0x1402131e0
0000000140061efd 90                             nop
0000000140061efe 4889d3                         mov rbx, rdx
0000000140061f01 a801                           test al, 1
0000000140061f03 7517                           jne 0x140061f1c
0000000140061f05 48399d70030000                 cmp qword ptr [rbp + 0x370], rbx
0000000140061f0c 48bb0300000025000000           movabs rbx, 0x2500000003
0000000140061f16 0f8689040000                   jbe 0x1400623a5
0000000140061f1c 488b85c0000000                 mov rax, qword ptr [rbp + 0xc0]
0000000140061f23 488985a8030000                 mov qword ptr [rbp + 0x3a8], rax
0000000140061f2a 488b85c8000000                 mov rax, qword ptr [rbp + 0xc8]
0000000140061f31 488985a0030000                 mov qword ptr [rbp + 0x3a0], rax
0000000140061f38 488b00                         mov rax, qword ptr [rax]
0000000140061f3b 4885c0                         test rax, rax
0000000140061f3e 740a                           je 0x140061f4a
0000000140061f40 488b8da8030000                 mov rcx, qword ptr [rbp + 0x3a8]
0000000140061f47 ffd0                           call rax
0000000140061f49 90                             nop
0000000140061f4a 488b8da8030000                 mov rcx, qword ptr [rbp + 0x3a8]
0000000140061f51 488b85a0030000                 mov rax, qword ptr [rbp + 0x3a0]
0000000140061f58 488b5008                       mov rdx, qword ptr [rax + 8]
0000000140061f5c 4885d2                         test rdx, rdx
0000000140061f5f 4989dc                         mov r12, rbx
0000000140061f62 0f84c8010000                   je 0x140062130
0000000140061f68 4c8b4010                       mov r8, qword ptr [rax + 0x10]
0000000140061f6c e85f02faff                     call 0x1400021d0
0000000140061f71 4589e7                         mov r15d, r12d
0000000140061f74 4183e703                       and r15d, 3
0000000140061f78 4b6304be                       movsxd rax, dword ptr [r14 + r15*4]
0000000140061f7c 4c01f0                         add rax, r14
0000000140061f7f 4c89eb                         mov rbx, r13
0000000140061f82 4c8dadc0000000                 lea r13, [rbp + 0xc0]
0000000140061f89 ffe0                           jmp rax
0000000140061f8b 0f1f440000                     nop dword ptr [rax + rax]
0000000140061f90 4d39fc                         cmp r12, r15
0000000140061f93 4c8bbda8030000                 mov r15, qword ptr [rbp + 0x3a8]
0000000140061f9a 736e                           jae 0x14006200a
0000000140061f9c 4d85ff                         test r15, r15
0000000140061f9f 7569                           jne 0x14006200a
0000000140061fa1 41b82b000000                   mov r8d, 0x2b
0000000140061fa7 b125                           mov cl, 0x25
0000000140061fa9 488d1568701506                 lea rdx, [rip + 0x6157068]
0000000140061fb0 e89b6af405                     call 0x145fa8a50
0000000140061fb5 4989c4                         mov r12, rax
0000000140061fb8 4589e7                         mov r15d, r12d
0000000140061fbb 4183e703                       and r15d, 3
0000000140061fbf 4b6304be                       movsxd rax, dword ptr [r14 + r15*4]
0000000140061fc3 4c01f0                         add rax, r14
0000000140061fc6 ffe0                           jmp rax
0000000140061fc8 41b810010000                   mov r8d, 0x110
0000000140061fce 4889f1                         mov rcx, rsi
0000000140061fd1 4c89ea                         mov rdx, r13
0000000140061fd4 e87230fa05                     call 0x14600504b
0000000140061fd9 4883bdd0010000ff               cmp qword ptr [rbp + 0x1d0], -1
0000000140061fe1 0f8495000000                   je 0x14006207c
0000000140061fe7 0fb785d8020000                 movzx eax, word ptr [rbp + 0x2d8]
0000000140061fee 3dad010000                     cmp eax, 0x1ad
0000000140061ff3 b900000000                     mov ecx, 0
0000000140061ff8 ba29000000                     mov edx, 0x29
0000000140061ffd 0f44ca                         cmove ecx, edx
0000000140062000 3df4010000                     cmp eax, 0x1f4
0000000140062005 0f43ca                         cmovae ecx, edx
0000000140062008 eb74                           jmp 0x14006207e
000000014006200a 4d85ff                         test r15, r15
000000014006200d 0f85e4030000                   jne 0x1400623f7
0000000140062013 48c7472800000000               mov qword ptr [rdi + 0x28], 0
000000014006201b 488b4748                       mov rax, qword ptr [rdi + 0x48]
000000014006201f 488985a8030000                 mov qword ptr [rbp + 0x3a8], rax
0000000140062026 4885c0                         test rax, rax
0000000140062029 0f8485fbffff                   je 0x140061bb4
000000014006202f 488b4750                       mov rax, qword ptr [rdi + 0x50]
0000000140062033 488985a0030000                 mov qword ptr [rbp + 0x3a0], rax
000000014006203a 488b00                         mov rax, qword ptr [rax]
000000014006203d 4885c0                         test rax, rax
0000000140062040 740a                           je 0x14006204c
0000000140062042 488b8da8030000                 mov rcx, qword ptr [rbp + 0x3a8]
0000000140062049 ffd0                           call rax
000000014006204b 90                             nop
000000014006204c 488b85a0030000                 mov rax, qword ptr [rbp + 0x3a0]
0000000140062053 488b5008                       mov rdx, qword ptr [rax + 8]
0000000140062057 4885d2                         test rdx, rdx
000000014006205a 488bbd90030000                 mov rdi, qword ptr [rbp + 0x390]
0000000140062061 0f844dfbffff                   je 0x140061bb4
0000000140062067 4c8b4010                       mov r8, qword ptr [rax + 0x10]
000000014006206b 488b8da8030000                 mov rcx, qword ptr [rbp + 0x3a8]
0000000140062072 e85901faff                     call 0x1400021d0
0000000140062077 e938fbffff                     jmp 0x140061bb4
000000014006207c b129                           mov cl, 0x29
000000014006207e 4889f2                         mov rdx, rsi
0000000140062081 e81ada4100                     call 0x14047faa0
0000000140062086 4989c4                         mov r12, rax
0000000140062089 4589e7                         mov r15d, r12d
000000014006208c 4183e703                       and r15d, 3
0000000140062090 4b6304be                       movsxd rax, dword ptr [r14 + r15*4]
0000000140062094 4c01f0                         add rax, r14
0000000140062097 ffe0                           jmp rax
0000000140062099 410fb6442410                   movzx eax, byte ptr [r12 + 0x10]
000000014006209f 3c23                           cmp al, 0x23
00000001400620a1 0f84ed000000                   je 0x140062194
00000001400620a7 e93f010000                     jmp 0x1400621eb
00000001400620ac 488bbd90030000                 mov rdi, qword ptr [rbp + 0x390]
00000001400620b3 4883bda003000000               cmp qword ptr [rbp + 0x3a0], 0
00000001400620bb 0f843dfbffff                   je 0x140061bfe
00000001400620c1 488b4748                       mov rax, qword ptr [rdi + 0x48]
00000001400620c5 48898588030000                 mov qword ptr [rbp + 0x388], rax
00000001400620cc 4885c0                         test rax, rax
00000001400620cf 7444                           je 0x140062115
00000001400620d1 488b4750                       mov rax, qword ptr [rdi + 0x50]
00000001400620d5 48898578030000                 mov qword ptr [rbp + 0x378], rax
00000001400620dc 488b00                         mov rax, qword ptr [rax]
00000001400620df 4885c0                         test rax, rax
00000001400620e2 740a                           je 0x1400620ee
00000001400620e4 488b8d88030000                 mov rcx, qword ptr [rbp + 0x388]
00000001400620eb ffd0                           call rax
00000001400620ed 90                             nop
00000001400620ee 488b8578030000                 mov rax, qword ptr [rbp + 0x378]
00000001400620f5 488b5008                       mov rdx, qword ptr [rax + 8]
00000001400620f9 4885d2                         test rdx, rdx
00000001400620fc 488bbd90030000                 mov rdi, qword ptr [rbp + 0x390]
0000000140062103 7410                           je 0x140062115
0000000140062105 4c8b4010                       mov r8, qword ptr [rax + 0x10]
0000000140062109 488b8d88030000                 mov rcx, qword ptr [rbp + 0x388]
0000000140062110 e8bb00faff                     call 0x1400021d0
0000000140062115 488b8da0030000                 mov rcx, qword ptr [rbp + 0x3a0]
000000014006211c 48894f48                       mov qword ptr [rdi + 0x48], rcx
0000000140062120 488b85a8030000                 mov rax, qword ptr [rbp + 0x3a8]
0000000140062127 48894750                       mov qword ptr [rdi + 0x50], rax
000000014006212b e9b2faffff                     jmp 0x140061be2
0000000140062130 4589e7                         mov r15d, r12d
0000000140062133 4183e703                       and r15d, 3
0000000140062137 4b6304be                       movsxd rax, dword ptr [r14 + r15*4]
000000014006213b 4c01f0                         add rax, r14
000000014006213e 4c89eb                         mov rbx, r13
0000000140062141 4c8dadc0000000                 lea r13, [rbp + 0xc0]
0000000140062148 ffe0                           jmp rax
000000014006214a 660f1f440000                   nop word ptr [rax + rax]
0000000140062150 410fb644241f                   movzx eax, byte ptr [r12 + 0x1f]
0000000140062156 3c23                           cmp al, 0x23
0000000140062158 743a                           je 0x140062194
000000014006215a e98c000000                     jmp 0x1400621eb
000000014006215f 90                             nop
0000000140062160 4c89a598030000                 mov qword ptr [rbp + 0x398], r12
0000000140062167 c685b703000001                 mov byte ptr [rbp + 0x3b7], 1
000000014006216e e87de8f705                     call 0x145fe09f0
0000000140062173 90                             nop
0000000140062174 4c89e1                         mov rcx, r12
0000000140062177 48c1e920                       shr rcx, 0x20
000000014006217b 488b4008                       mov rax, qword ptr [rax + 8]
000000014006217f 4c89a598030000                 mov qword ptr [rbp + 0x398], r12
0000000140062186 c685b703000001                 mov byte ptr [rbp + 0x3b7], 1
000000014006218d ffd0                           call rax
000000014006218f 90                             nop
0000000140062190 3c23                           cmp al, 0x23
0000000140062192 7557                           jne 0x1400621eb
0000000140062194 418d47fe                       lea eax, [r15 - 2]
0000000140062198 83f802                         cmp eax, 2
000000014006219b 0f821ffaffff                   jb 0x140061bc0
00000001400621a1 4d85ff                         test r15, r15
00000001400621a4 0f8416faffff                   je 0x140061bc0
00000001400621aa 498d4424ff                     lea rax, [r12 - 1]
00000001400621af 488985d8010000                 mov qword ptr [rbp + 0x1d8], rax
00000001400621b6 c685d001000003                 mov byte ptr [rbp + 0x1d0], 3
00000001400621bd 4c89a598030000                 mov qword ptr [rbp + 0x398], r12
00000001400621c4 c685b703000000                 mov byte ptr [rbp + 0x3b7], 0
00000001400621cb 488d8dd8010000                 lea rcx, [rbp + 0x1d8]
00000001400621d2 e85985f805                     call 0x145fea730
00000001400621d7 90                             nop
00000001400621d8 e9e3f9ffff                     jmp 0x140061bc0
00000001400621dd 0f1f00                         nop dword ptr [rax]
00000001400621e0 4c89e0                         mov rax, r12
00000001400621e3 48c1e820                       shr rax, 0x20
00000001400621e7 3c23                           cmp al, 0x23
00000001400621e9 74a9                           je 0x140062194
00000001400621eb 4c89a5c0000000                 mov qword ptr [rbp + 0xc0], r12
00000001400621f2 488b4748                       mov rax, qword ptr [rdi + 0x48]
00000001400621f6 488985a0030000                 mov qword ptr [rbp + 0x3a0], rax
00000001400621fd 4885c0                         test rax, rax
0000000140062200 4c89a5a8030000                 mov qword ptr [rbp + 0x3a8], r12
0000000140062207 7444                           je 0x14006224d
0000000140062209 488b4750                       mov rax, qword ptr [rdi + 0x50]
000000014006220d 48898588030000                 mov qword ptr [rbp + 0x388], rax
0000000140062214 488b00                         mov rax, qword ptr [rax]
0000000140062217 4885c0                         test rax, rax
000000014006221a 740a                           je 0x140062226
000000014006221c 488b8da0030000                 mov rcx, qword ptr [rbp + 0x3a0]
0000000140062223 ffd0                           call rax
0000000140062225 90                             nop
0000000140062226 488b8588030000                 mov rax, qword ptr [rbp + 0x388]
000000014006222d 488b5008                       mov rdx, qword ptr [rax + 8]
0000000140062231 4885d2                         test rdx, rdx
0000000140062234 488bbd90030000                 mov rdi, qword ptr [rbp + 0x390]
000000014006223b 7410                           je 0x14006224d
000000014006223d 4c8b4010                       mov r8, qword ptr [rax + 0x10]
0000000140062241 488b8da0030000                 mov rcx, qword ptr [rbp + 0x3a0]
0000000140062248 e883fff9ff                     call 0x1400021d0
000000014006224d 48c7474800000000               mov qword ptr [rdi + 0x48], 0
0000000140062255 8b4758                         mov eax, dword ptr [rdi + 0x58]
0000000140062258 ffc0                           inc eax
000000014006225a 894758                         mov dword ptr [rdi + 0x58], eax
000000014006225d 4c8bbdc0000000                 mov r15, qword ptr [rbp + 0xc0]
0000000140062264 83f808                         cmp eax, 8
0000000140062267 0f8778010000                   ja 0x1400623e5
000000014006226d 4489f8                         mov eax, r15d
0000000140062270 83e003                         and eax, 3
0000000140062273 488d0d82801506                 lea rcx, [rip + 0x6158082]
000000014006227a 48630481                       movsxd rax, dword ptr [rcx + rax*4]
000000014006227e 4801c8                         add rax, rcx
0000000140062281 ffe0                           jmp rax
0000000140062283 450fb67f10                     movzx r15d, byte ptr [r15 + 0x10]
0000000140062288 4584ff                         test r15b, r15b
000000014006228b 753f                           jne 0x1400622cc
000000014006228d e94c010000                     jmp 0x1400623de
0000000140062292 e859e7f705                     call 0x145fe09f0
0000000140062297 90                             nop
0000000140062298 49c1ef20                       shr r15, 0x20
000000014006229c 4489f9                         mov ecx, r15d
000000014006229f ff5008                         call qword ptr [rax + 8]
00000001400622a2 90                             nop
00000001400622a3 4189c7                         mov r15d, eax
00000001400622a6 4584ff                         test r15b, r15b
00000001400622a9 7521                           jne 0x1400622cc
00000001400622ab e92e010000                     jmp 0x1400623de
00000001400622b0 49c1ef20                       shr r15, 0x20
00000001400622b4 4584ff                         test r15b, r15b
00000001400622b7 7513                           jne 0x1400622cc
00000001400622b9 e920010000                     jmp 0x1400623de
00000001400622be 450fb67f1f                     movzx r15d, byte ptr [r15 + 0x1f]
00000001400622c3 4584ff                         test r15b, r15b
00000001400622c6 0f8412010000                   je 0x1400623de
00000001400622cc 4c89add0010000                 mov qword ptr [rbp + 0x1d0], r13
00000001400622d3 488d058667f805                 lea rax, [rip + 0x5f86786]
00000001400622da 488985d8010000                 mov qword ptr [rbp + 0x1d8], rax
00000001400622e1 488b8568030000                 mov rax, qword ptr [rbp + 0x368]
00000001400622e8 488985e0010000                 mov qword ptr [rbp + 0x1e0], rax
00000001400622ef 488d055a75f805                 lea rax, [rip + 0x5f8755a]
00000001400622f6 488985e8010000                 mov qword ptr [rbp + 0x1e8], rax
00000001400622fd 488d0d98761506                 lea rcx, [rip + 0x6157698]
0000000140062304 48898df0010000                 mov qword ptr [rbp + 0x1f0], rcx
000000014006230b 488985f8010000                 mov qword ptr [rbp + 0x1f8], rax
0000000140062312 488d0d87761506                 lea rcx, [rip + 0x6157687]
0000000140062319 4889f2                         mov rdx, rsi
000000014006231c e84feef505                     call 0x145fc1170
0000000140062321 90                             nop
0000000140062322 488b8568030000                 mov rax, qword ptr [rbp + 0x368]
0000000140062329 0fb608                         movzx ecx, byte ptr [rax]
000000014006232c b801000000                     mov eax, 1
0000000140062331 48d3e0                         shl rax, cl
0000000140062334 4883f814                       cmp rax, 0x14
0000000140062338 b914000000                     mov ecx, 0x14
000000014006233d 480f43c1                       cmovae rax, rcx
0000000140062341 4889c1                         mov rcx, rax
0000000140062344 31d2                           xor edx, edx
0000000140062346 e8f502f605                     call 0x145fc2640
000000014006234b 90                             nop
000000014006234c 488b85c0000000                 mov rax, qword ptr [rbp + 0xc0]
0000000140062353 89c1                           mov ecx, eax
0000000140062355 83e103                         and ecx, 3
0000000140062358 8d51fe                         lea edx, [rcx - 2]
000000014006235b 83fa02                         cmp edx, 2
000000014006235e 488b95a8030000                 mov rdx, qword ptr [rbp + 0x3a8]
0000000140062365 0f8255f8ffff                   jb 0x140061bc0
000000014006236b 4885c9                         test rcx, rcx
000000014006236e 0f844cf8ffff                   je 0x140061bc0
0000000140062374 48ffc8                         dec rax
0000000140062377 488985d8010000                 mov qword ptr [rbp + 0x1d8], rax
000000014006237e c685d001000003                 mov byte ptr [rbp + 0x1d0], 3
0000000140062385 48899598030000                 mov qword ptr [rbp + 0x398], rdx
000000014006238c c685b703000000                 mov byte ptr [rbp + 0x3b7], 0
0000000140062393 488d8dd8010000                 lea rcx, [rbp + 0x1d8]
000000014006239a e89183f805                     call 0x145fea730
000000014006239f 90                             nop
00000001400623a0 e91bf8ffff                     jmp 0x140061bc0
00000001400623a5 488b85c0000000                 mov rax, qword ptr [rbp + 0xc0]
00000001400623ac 488985a0030000                 mov qword ptr [rbp + 0x3a0], rax
00000001400623b3 488b85c8000000                 mov rax, qword ptr [rbp + 0xc8]
00000001400623ba 488985a8030000                 mov qword ptr [rbp + 0x3a8], rax
00000001400623c1 4c89eb                         mov rbx, r13
00000001400623c4 4c8dadc0000000                 lea r13, [rbp + 0xc0]
00000001400623cb 4883bda003000000               cmp qword ptr [rbp + 0x3a0], 0
00000001400623d3 0f85e8fcffff                   jne 0x1400620c1
00000001400623d9 e920f8ffff                     jmp 0x140061bfe
00000001400623de 4c8bbdc0000000                 mov r15, qword ptr [rbp + 0xc0]
00000001400623e5 b801000000                     mov eax, 1
00000001400623ea e975010000                     jmp 0x140062564
00000001400623ef 4531ff                         xor r15d, r15d
00000001400623f2 e96b010000                     jmp 0x140062562
00000001400623f7 c7475800000000                 mov dword ptr [rdi + 0x58], 0
00000001400623fe 48837f2800                     cmp qword ptr [rdi + 0x28], 0
0000000140062403 7404                           je 0x140062409
0000000140062405 4c017f40                       add qword ptr [rdi + 0x40], r15
0000000140062409 488b7f20                       mov rdi, qword ptr [rdi + 0x20]
000000014006240d 488b1f                         mov rbx, qword ptr [rdi]
0000000140062410 4c01fb                         add rbx, r15
0000000140062413 48891f                         mov qword ptr [rdi], rbx
0000000140062416 488d4f30                       lea rcx, [rdi + 0x30]
000000014006241a 4c89bd98030000                 mov qword ptr [rbp + 0x398], r15
0000000140062421 c685b703000000                 mov byte ptr [rbp + 0x3b7], 0
0000000140062428 e853c9f405                     call 0x145faed80
000000014006242d 90                             nop
000000014006242e 66480f6ec0                     movq xmm0, rax
0000000140062433 660f6205255d1506               punpckldq xmm0, xmmword ptr [rip + 0x6155d25]
000000014006243b 660f5c052d5d1506               subpd xmm0, xmmword ptr [rip + 0x6155d2d]
0000000140062443 660f28c8                       movapd xmm1, xmm0
0000000140062447 660f15c8                       unpckhpd xmm1, xmm0
000000014006244b f20f58c8                       addsd xmm1, xmm0
000000014006244f 0f57c0                         xorps xmm0, xmm0
0000000140062452 f20f2ac2                       cvtsi2sd xmm0, edx
0000000140062456 f20f5e05225d1506               divsd xmm0, qword ptr [rip + 0x6155d22]
000000014006245e f20f58c1                       addsd xmm0, xmm1
0000000140062462 660f2e051e5d1506               ucomisd xmm0, qword ptr [rip + 0x6155d1e]
000000014006246a 730a                           jae 0x140062476
000000014006246c f20f107710                     movsd xmm6, qword ptr [rdi + 0x10]
0000000140062471 e986000000                     jmp 0x1400624fc
0000000140062476 4889d8                         mov rax, rbx
0000000140062479 482b4718                       sub rax, qword ptr [rdi + 0x18]
000000014006247d 66480f6ec8                     movq xmm1, rax
0000000140062482 660f620dd65c1506               punpckldq xmm1, xmmword ptr [rip + 0x6155cd6]
000000014006248a 660f5c0dde5c1506               subpd xmm1, xmmword ptr [rip + 0x6155cde]
0000000140062492 660f28d1                       movapd xmm2, xmm1
0000000140062496 660f15d1                       unpckhpd xmm2, xmm1
000000014006249a f20f58d1                       addsd xmm2, xmm1
000000014006249e f20f5ed0                       divsd xmm2, xmm0
00000001400624a2 f20f104710                     movsd xmm0, qword ptr [rdi + 0x10]
00000001400624a7 f20f100de15c1506               movsd xmm1, qword ptr [rip + 0x6155ce1]
00000001400624af f20f59c8                       mulsd xmm1, xmm0
00000001400624b3 f20f101ddd5c1506               movsd xmm3, qword ptr [rip + 0x6155cdd]
00000001400624bb f20f59da                       mulsd xmm3, xmm2
00000001400624bf f20f58d9                       addsd xmm3, xmm1
00000001400624c3 660f57f6                       xorpd xmm6, xmm6
00000001400624c7 f20fc2f000                     cmpeqsd xmm6, xmm0
00000001400624cc 660f54d6                       andpd xmm2, xmm6
00000001400624d0 660f55f3                       andnpd xmm6, xmm3
00000001400624d4 660f56f2                       orpd xmm6, xmm2
00000001400624d8 660f137710                     movlpd qword ptr [rdi + 0x10], xmm6
00000001400624dd 4c89bd98030000                 mov qword ptr [rbp + 0x398], r15
00000001400624e4 c685b703000000                 mov byte ptr [rbp + 0x3b7], 0
00000001400624eb e840c7f405                     call 0x145faec30
00000001400624f0 90                             nop
00000001400624f1 48894730                       mov qword ptr [rdi + 0x30], rax
00000001400624f5 895738                         mov dword ptr [rdi + 0x38], edx
00000001400624f8 48895f18                       mov qword ptr [rdi + 0x18], rbx
00000001400624fc 488b7720                       mov rsi, qword ptr [rdi + 0x20]
0000000140062500 488b5728                       mov rdx, qword ptr [rdi + 0x28]
0000000140062504 488d8df0010000                 lea rcx, [rbp + 0x1f0]
000000014006250b 4c89bd98030000                 mov qword ptr [rbp + 0x398], r15
0000000140062512 c685b703000000                 mov byte ptr [rbp + 0x3b7], 0
0000000140062519 e862040000                     call 0x140062980
000000014006251e 90                             nop
000000014006251f 488b4708                       mov rax, qword ptr [rdi + 8]
0000000140062523 48899dd8010000                 mov qword ptr [rbp + 0x1d8], rbx
000000014006252a 488985e0010000                 mov qword ptr [rbp + 0x1e0], rax
0000000140062531 f20f11b5e8010000               movsd qword ptr [rbp + 0x1e8], xmm6
0000000140062539 48c785d001000002000000         mov qword ptr [rbp + 0x1d0], 2
0000000140062544 4c89bd98030000                 mov qword ptr [rbp + 0x398], r15
000000014006254b c685b703000000                 mov byte ptr [rbp + 0x3b7], 0
0000000140062552 488d95d0010000                 lea rdx, [rbp + 0x1d0]
0000000140062559 4889f1                         mov rcx, rsi
000000014006255c e86f47ffff                     call 0x140056cd0
0000000140062561 90                             nop
0000000140062562 31c0                           xor eax, eax
0000000140062564 4c89fa                         mov rdx, r15
0000000140062567 0f28b5c0030000                 movaps xmm6, xmmword ptr [rbp + 0x3c0]
000000014006256e 4881c458040000                 add rsp, 0x458
0000000140062575 5b                             pop rbx
0000000140062576 5f                             pop rdi
0000000140062577 5e                             pop rsi
0000000140062578 415c                           pop r12
000000014006257a 415d                           pop r13
000000014006257c 415e                           pop r14
000000014006257e 415f                           pop r15
0000000140062580 5d                             pop rbp
0000000140062581 c3                             ret
