145c8e970 55 push rbp
145c8e971 4157 push r15
145c8e973 4156 push r14
145c8e975 4155 push r13
145c8e977 4154 push r12
145c8e979 56 push rsi
145c8e97a 57 push rdi
145c8e97b 53 push rbx
145c8e97c 4881ec38020000 sub rsp, 0x238
145c8e983 488dac2480000000 lea rbp, [rsp + 0x80]
145c8e98b 440f2995a0010000 movaps xmmword ptr [rbp + 0x1a0], xmm10
145c8e993 440f298d90010000 movaps xmmword ptr [rbp + 0x190], xmm9
145c8e99b 66440f7f8580010000 movdqa xmmword ptr [rbp + 0x180], xmm8
145c8e9a4 660f7fbd70010000 movdqa xmmword ptr [rbp + 0x170], xmm7
145c8e9ac 0f29b560010000 movaps xmmword ptr [rbp + 0x160], xmm6
145c8e9b3 48c78558010000feffffff mov qword ptr [rbp + 0x158], 0xfffffffffffffffe
145c8e9be 44888526010000 mov byte ptr [rbp + 0x126], r8b
145c8e9c5 4889ce mov rsi, rcx
145c8e9c8 889527010000 mov byte ptr [rbp + 0x127], dl
145c8e9ce 0fb6ca movzx ecx, dl
145c8e9d1 84c9 test cl, cl
145c8e9d3 4889b528010000 mov qword ptr [rbp + 0x128], rsi
145c8e9da 48894db0 mov qword ptr [rbp - 0x50], rcx
145c8e9de 740e je 0x145c8e9ee
145c8e9e0 83f901 cmp ecx, 1
145c8e9e3 7526 jne 0x145c8ea0b
145c8e9e5 488d4df0 lea rcx, [rbp - 0x10]
145c8e9e9 0f57d2 xorps xmm2, xmm2
145c8e9ec eb29 jmp 0x145c8ea17
145c8e9ee 0fb68654030000 movzx eax, byte ptr [rsi + 0x354]
145c8e9f5 04fe add al, 0xfe
145c8e9f7 3c09 cmp al, 9
145c8e9f9 7729 ja 0x145c8ea24
145c8e9fb 0fb6c0 movzx eax, al
145c8e9fe 488d0d4b2a7501 lea rcx, [rip + 0x1752a4b]
145c8ea05 488b3cc1 mov rdi, qword ptr [rcx + rax*8]
145c8ea09 eb20 jmp 0x145c8ea2b
145c8ea0b 488d4df0 lea rcx, [rbp - 0x10]
145c8ea0f f30f101521475a00 movss xmm2, dword ptr [rip + 0x5a4721]
145c8ea17 4889f2 mov rdx, rsi
145c8ea1a e8817a0000 call 0x145c964a0
145c8ea1f e9fd0b0000 jmp 0x145c8f621
145c8ea24 488d3dddde3a01 lea rdi, [rip + 0x13adedd]
145c8ea2b 48c785d000000000000000 mov qword ptr [rbp + 0xd0], 0
145c8ea36 48c785d800000008000000 mov qword ptr [rbp + 0xd8], 8
145c8ea41 48c785e000000000000000 mov qword ptr [rbp + 0xe0], 0
145c8ea4c 488b8528010000 mov rax, qword ptr [rbp + 0x128]
145c8ea53 488b8880030000 mov rcx, qword ptr [rax + 0x380]
145c8ea5a 4989cd mov r13, rcx
145c8ea5d 49c1e504 shl r13, 4
145c8ea61 48898d08010000 mov qword ptr [rbp + 0x108], rcx
145c8ea68 4885c9 test rcx, rcx
145c8ea6b 4c89ade8000000 mov qword ptr [rbp + 0xe8], r13
145c8ea72 743a je 0x145c8eaae
145c8ea74 4c8ba078030000 mov r12, qword ptr [rax + 0x378]
145c8ea7b e8803737fa call 0x140002200
145c8ea80 ba08000000 mov edx, 8
145c8ea85 4c89e9 mov rcx, r13
145c8ea88 e8333737fa call 0x1400021c0
145c8ea8d 48898548010000 mov qword ptr [rbp + 0x148], rax
145c8ea94 4885c0 test rax, rax
145c8ea97 0f84600f0000 je 0x145c8f9fd
145c8ea9d 488b8d08010000 mov rcx, qword ptr [rbp + 0x108]
145c8eaa4 4883f901 cmp rcx, 1
145c8eaa8 7512 jne 0x145c8eabc
145c8eaaa 31c0 xor eax, eax
145c8eaac eb58 jmp 0x145c8eb06
145c8eaae b808000000 mov eax, 8
145c8eab3 48898548010000 mov qword ptr [rbp + 0x148], rax
145c8eaba eb7a jmp 0x145c8eb36
145c8eabc 4883e1fe and rcx, 0xfffffffffffffffe
145c8eac0 488b9548010000 mov rdx, qword ptr [rbp + 0x148]
145c8eac7 4883c218 add rdx, 0x18
145c8eacb 31c0 xor eax, eax
145c8eacd 4d89e0 mov r8, r12
145c8ead0 4d8b08 mov r9, qword ptr [r8]
145c8ead3 410f1001 movups xmm0, xmmword ptr [r9]
145c8ead7 0f1142e8 movups xmmword ptr [rdx - 0x18], xmm0
145c8eadb 4d8b4858 mov r9, qword ptr [r8 + 0x58]
145c8eadf f3410f6f01 movdqu xmm0, xmmword ptr [r9]
145c8eae4 f30f7f42f8 movdqu xmmword ptr [rdx - 8], xmm0
145c8eae9 4883c002 add rax, 2
145c8eaed 4981c0b0000000 add r8, 0xb0
145c8eaf4 4883c220 add rdx, 0x20
145c8eaf8 4839c1 cmp rcx, rax
145c8eafb 75d3 jne 0x145c8ead0
145c8eafd f6850801000001 test byte ptr [rbp + 0x108], 1
145c8eb04 741c je 0x145c8eb22
145c8eb06 486bc858 imul rcx, rax, 0x58
145c8eb0a 498b0c0c mov rcx, qword ptr [r12 + rcx]
145c8eb0e f30f6f01 movdqu xmm0, xmmword ptr [rcx]
145c8eb12 48c1e004 shl rax, 4
145c8eb16 488b8d48010000 mov rcx, qword ptr [rbp + 0x148]
145c8eb1d f30f7f0401 movdqu xmmword ptr [rcx + rax], xmm0
145c8eb22 488b8d08010000 mov rcx, qword ptr [rbp + 0x108]
145c8eb29 4889c8 mov rax, rcx
145c8eb2c 4883f905 cmp rcx, 5
145c8eb30 0f87d6030000 ja 0x145c8ef0c
145c8eb36 488b4f38 mov rcx, qword ptr [rdi + 0x38]
145c8eb3a 4885c9 test rcx, rcx
145c8eb3d 0f84b4030000 je 0x145c8eef7
145c8eb43 4889c8 mov rax, rcx
145c8eb46 488b5f30 mov rbx, qword ptr [rdi + 0x30]
145c8eb4a 48c1e004 shl rax, 4
145c8eb4e 4801d8 add rax, rbx
145c8eb51 48898538010000 mov qword ptr [rbp + 0x138], rax
145c8eb58 31c0 xor eax, eax
145c8eb5a 4883bd0801000003 cmp qword ptr [rbp + 0x108], 3
145c8eb62 0f92c0 setb al
145c8eb65 488d0d14f47401 lea rcx, [rip + 0x174f414]
145c8eb6c f30f103481 movss xmm6, dword ptr [rcx + rax*4]
145c8eb71 b808000000 mov eax, 8
145c8eb76 48898530010000 mov qword ptr [rbp + 0x130], rax
145c8eb7d 4531e4 xor r12d, r12d
145c8eb80 660f6f3d48903b01 movdqa xmm7, xmmword ptr [rip + 0x13b9048]
145c8eb88 66440f6f054f903b01 movdqa xmm8, xmmword ptr [rip + 0x13b904f]
145c8eb91 f3440f100d16df5b00 movss xmm9, dword ptr [rip + 0x5bdf16]
145c8eb9a 450f57d2 xorps xmm10, xmm10
145c8eb9e eb4b jmp 0x145c8ebeb
145c8eba0 4b8d04a4 lea rax, [r12 + r12*4]
145c8eba4 488b4d10 mov rcx, qword ptr [rbp + 0x10]
145c8eba8 488b9530010000 mov rdx, qword ptr [rbp + 0x130]
145c8ebaf 48894cc220 mov qword ptr [rdx + rax*8 + 0x20], rcx
145c8ebb4 f30f6f45f0 movdqu xmm0, xmmword ptr [rbp - 0x10]
145c8ebb9 f30f6f4d00 movdqu xmm1, xmmword ptr [rbp]
145c8ebbe f30f7f4cc210 movdqu xmmword ptr [rdx + rax*8 + 0x10], xmm1
145c8ebc4 f30f7f04c2 movdqu xmmword ptr [rdx + rax*8], xmm0
145c8ebc9 49ffc4 inc r12
145c8ebcc 4c89a5e0000000 mov qword ptr [rbp + 0xe0], r12
145c8ebd3 4c8bade8000000 mov r13, qword ptr [rbp + 0xe8]
145c8ebda 4883c310 add rbx, 0x10
145c8ebde 483b9d38010000 cmp rbx, qword ptr [rbp + 0x138]
145c8ebe5 0f840c030000 je 0x145c8eef7
145c8ebeb 4c8b33 mov r14, qword ptr [rbx]
145c8ebee 4c8b7b08 mov r15, qword ptr [rbx + 8]
145c8ebf2 4883bd0801000000 cmp qword ptr [rbp + 0x108], 0
145c8ebfa 488bbd48010000 mov rdi, qword ptr [rbp + 0x148]
145c8ec01 743d je 0x145c8ec40
145c8ec03 31f6 xor esi, esi
145c8ec05 eb12 jmp 0x145c8ec19
145c8ec07 660f1f840000000000 nop word ptr [rax + rax]
145c8ec10 4883c610 add rsi, 0x10
145c8ec14 4939f5 cmp r13, rsi
145c8ec17 7427 je 0x145c8ec40
145c8ec19 4c397c3708 cmp qword ptr [rdi + rsi + 8], r15
145c8ec1e 75f0 jne 0x145c8ec10
145c8ec20 488b0c37 mov rcx, qword ptr [rdi + rsi]
145c8ec24 4c89f2 mov rdx, r14
145c8ec27 4d89f8 mov r8, r15
145c8ec2a e8f22a3d00 call 0x146061721
145c8ec2f 85c0 test eax, eax
145c8ec31 75dd jne 0x145c8ec10
145c8ec33 eba5 jmp 0x145c8ebda
145c8ec35 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
145c8ec40 4983ff13 cmp r15, 0x13
145c8ec44 746a je 0x145c8ecb0
145c8ec46 4983ff0d cmp r15, 0xd
145c8ec4a 4c8b8d28010000 mov r9, qword ptr [rbp + 0x128]
145c8ec51 0f8587000000 jne 0x145c8ecde
145c8ec57 498b06 mov rax, qword ptr [r14]
145c8ec5a 48b963616c6c5f6f665f movabs rcx, 0x5f666f5f6c6c6163
145c8ec64 4831c8 xor rax, rcx
145c8ec67 498b4e05 mov rcx, qword ptr [r14 + 5]
145c8ec6b 48ba6f665f666c616d65 movabs rdx, 0x656d616c665f666f
145c8ec75 4831d1 xor rcx, rdx
145c8ec78 4809c1 or rcx, rax
145c8ec7b 7561 jne 0x145c8ecde
145c8ec7d 498b8178030000 mov rax, qword ptr [r9 + 0x378]
145c8ec84 496b898003000058 imul rcx, qword ptr [r9 + 0x380], 0x58
145c8ec8c 31d2 xor edx, edx
145c8ec8e 6690 nop
145c8ec90 4839d1 cmp rcx, rdx
145c8ec93 0f8441ffffff je 0x145c8ebda
145c8ec99 4c8b0410 mov r8, qword ptr [rax + rdx]
145c8ec9d 4883c258 add rdx, 0x58
145c8eca1 418078750a cmp byte ptr [r8 + 0x75], 0xa
145c8eca6 75e8 jne 0x145c8ec90
145c8eca8 eb34 jmp 0x145c8ecde
145c8ecaa 660f1f440000 nop word ptr [rax + rax]
145c8ecb0 f3410f6f06 movdqu xmm0, xmmword ptr [r14]
145c8ecb5 66410f74c0 pcmpeqb xmm0, xmm8
145c8ecba f3410f6f4e03 movdqu xmm1, xmmword ptr [r14 + 3]
145c8ecc0 660f74cf pcmpeqb xmm1, xmm7
145c8ecc4 660fdbc8 pand xmm1, xmm0
145c8ecc8 660fd7c1 pmovmskb eax, xmm1
145c8eccc 3dffff0000 cmp eax, 0xffff
145c8ecd1 4c8b8d28010000 mov r9, qword ptr [rbp + 0x128]
145c8ecd8 0f84fa000000 je 0x145c8edd8
145c8ecde 4d8ba9f8090000 mov r13, qword ptr [r9 + 0x9f8]
145c8ece5 4d85ed test r13, r13
145c8ece8 7446 je 0x145c8ed30
145c8ecea 488b8528010000 mov rax, qword ptr [rbp + 0x128]
145c8ecf1 488bb0f0090000 mov rsi, qword ptr [rax + 0x9f0]
145c8ecf8 49c1e504 shl r13, 4
145c8ecfc 31ff xor edi, edi
145c8ecfe eb09 jmp 0x145c8ed09
145c8ed00 4883c710 add rdi, 0x10
145c8ed04 4939fd cmp r13, rdi
145c8ed07 7427 je 0x145c8ed30
145c8ed09 4c397c3e08 cmp qword ptr [rsi + rdi + 8], r15
145c8ed0e 75f0 jne 0x145c8ed00
145c8ed10 488b0c3e mov rcx, qword ptr [rsi + rdi]
145c8ed14 4c89f2 mov rdx, r14
145c8ed17 4d89f8 mov r8, r15
145c8ed1a e8022a3d00 call 0x146061721
145c8ed1f 85c0 test eax, eax
145c8ed21 75dd jne 0x145c8ed00
145c8ed23 e9abfeffff jmp 0x145c8ebd3
145c8ed28 0f1f840000000000 nop dword ptr [rax + rax]
145c8ed30 488b8528010000 mov rax, qword ptr [rbp + 0x128]
145c8ed37 488b80100a0000 mov rax, qword ptr [rax + 0xa10]
145c8ed3e 4885c0 test rax, rax
145c8ed41 744d je 0x145c8ed90
145c8ed43 488b8d28010000 mov rcx, qword ptr [rbp + 0x128]
145c8ed4a 4c8ba9080a0000 mov r13, qword ptr [rcx + 0xa08]
145c8ed51 48c1e003 shl rax, 3
145c8ed55 488d3440 lea rsi, [rax + rax*2]
145c8ed59 31ff xor edi, edi
145c8ed5b eb0c jmp 0x145c8ed69
145c8ed5d 0f1f00 nop dword ptr [rax]
145c8ed60 4883c718 add rdi, 0x18
145c8ed64 4839fe cmp rsi, rdi
145c8ed67 7427 je 0x145c8ed90
145c8ed69 4d397c3d10 cmp qword ptr [r13 + rdi + 0x10], r15
145c8ed6e 75f0 jne 0x145c8ed60
145c8ed70 498b4c3d08 mov rcx, qword ptr [r13 + rdi + 8]
145c8ed75 4c89f2 mov rdx, r14
145c8ed78 4d89f8 mov r8, r15
145c8ed7b e8a1293d00 call 0x146061721
145c8ed80 85c0 test eax, eax
145c8ed82 75dc jne 0x145c8ed60
145c8ed84 e94afeffff jmp 0x145c8ebd3
145c8ed89 0f1f8000000000 nop dword ptr [rax]
145c8ed90 f30f1175f0 movss dword ptr [rbp - 0x10], xmm6
145c8ed95 48b80000000000000080 movabs rax, 0x8000000000000000
145c8ed9f 488945f8 mov qword ptr [rbp - 8], rax
145c8eda3 4c897500 mov qword ptr [rbp], r14
145c8eda7 4c897d08 mov qword ptr [rbp + 8], r15
145c8edab 4c3ba5d0000000 cmp r12, qword ptr [rbp + 0xd0]
145c8edb2 0f85e8fdffff jne 0x145c8eba0
145c8edb8 488d8dd0000000 lea rcx, [rbp + 0xd0]
145c8edbf e8fc313d00 call 0x146061fc0
145c8edc4 90 nop
145c8edc5 488b85d8000000 mov rax, qword ptr [rbp + 0xd8]
145c8edcc 48898530010000 mov qword ptr [rbp + 0x130], rax
145c8edd3 e9c8fdffff jmp 0x145c8eba0
145c8edd8 498b91c8080000 mov rdx, qword ptr [r9 + 0x8c8]
145c8eddf 410f28c1 movaps xmm0, xmm9
145c8ede3 4885d2 test rdx, rdx
145c8ede6 746e je 0x145c8ee56
145c8ede8 498b81c0080000 mov rax, qword ptr [r9 + 0x8c0]
145c8edef 4883fa01 cmp rdx, 1
145c8edf3 7508 jne 0x145c8edfd
145c8edf5 31c9 xor ecx, ecx
145c8edf7 410f28c1 movaps xmm0, xmm9
145c8edfb eb4d jmp 0x145c8ee4a
145c8edfd 4989d0 mov r8, rdx
145c8ee00 4983e0fe and r8, 0xfffffffffffffffe
145c8ee04 31c9 xor ecx, ecx
145c8ee06 410f28c1 movaps xmm0, xmm9
145c8ee0a eb0d jmp 0x145c8ee19
145c8ee0c 0f1f4000 nop dword ptr [rax]
145c8ee10 4883c102 add rcx, 2
145c8ee14 4939c8 cmp r8, rcx
145c8ee17 742c je 0x145c8ee45
145c8ee19 803cc820 cmp byte ptr [rax + rcx*8], 0x20
145c8ee1d 7411 je 0x145c8ee30
145c8ee1f 807cc80820 cmp byte ptr [rax + rcx*8 + 8], 0x20
145c8ee24 75ea jne 0x145c8ee10
145c8ee26 eb15 jmp 0x145c8ee3d
145c8ee28 0f1f840000000000 nop dword ptr [rax + rax]
145c8ee30 f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
145c8ee36 807cc80820 cmp byte ptr [rax + rcx*8 + 8], 0x20
145c8ee3b 75d3 jne 0x145c8ee10
145c8ee3d f30f5844c80c addss xmm0, dword ptr [rax + rcx*8 + 0xc]
145c8ee43 ebcb jmp 0x145c8ee10
145c8ee45 f6c201 test dl, 1
145c8ee48 740c je 0x145c8ee56
145c8ee4a 803cc820 cmp byte ptr [rax + rcx*8], 0x20
145c8ee4e 7506 jne 0x145c8ee56
145c8ee50 f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
145c8ee56 498b81f8080000 mov rax, qword ptr [r9 + 0x8f8]
145c8ee5d 4885c0 test rax, rax
145c8ee60 0f8474fdffff je 0x145c8ebda
145c8ee66 498b89f0080000 mov rcx, qword ptr [r9 + 0x8f0]
145c8ee6d 48c1e006 shl rax, 6
145c8ee71 31d2 xor edx, edx
145c8ee73 410f2ec2 ucomiss xmm0, xmm10
145c8ee77 7724 ja 0x145c8ee9d
145c8ee79 eb62 jmp 0x145c8eedd
145c8ee7b 0f1f440000 nop dword ptr [rax + rax]
145c8ee80 4c8b441108 mov r8, qword ptr [rcx + rdx + 8]
145c8ee85 4180783904 cmp byte ptr [r8 + 0x39], 4
145c8ee8a 0f874efeffff ja 0x145c8ecde
145c8ee90 4883c240 add rdx, 0x40
145c8ee94 4839d0 cmp rax, rdx
145c8ee97 0f843dfdffff je 0x145c8ebda
145c8ee9d 440fb60411 movzx r8d, byte ptr [rcx + rdx]
145c8eea2 4183f81e cmp r8d, 0x1e
145c8eea6 74d8 je 0x145c8ee80
145c8eea8 4183c0de add r8d, -0x22
145c8eeac 4183f802 cmp r8d, 2
145c8eeb0 73de jae 0x145c8ee90
145c8eeb2 e927feffff jmp 0x145c8ecde
145c8eeb7 660f1f840000000000 nop word ptr [rax + rax]
145c8eec0 4c8b441108 mov r8, qword ptr [rcx + rdx + 8]
145c8eec5 4180783900 cmp byte ptr [r8 + 0x39], 0
145c8eeca 0f850efeffff jne 0x145c8ecde
145c8eed0 4883c240 add rdx, 0x40
145c8eed4 4839d0 cmp rax, rdx
145c8eed7 0f84fdfcffff je 0x145c8ebda
145c8eedd 440fb60411 movzx r8d, byte ptr [rcx + rdx]
145c8eee2 4183f81e cmp r8d, 0x1e
145c8eee6 74d8 je 0x145c8eec0
145c8eee8 4183c0df add r8d, -0x21
145c8eeec 4183f803 cmp r8d, 3
145c8eef0 73de jae 0x145c8eed0
145c8eef2 e9e7fdffff jmp 0x145c8ecde
145c8eef7 488b8528010000 mov rax, qword ptr [rbp + 0x128]
145c8eefe 4c8ba078030000 mov r12, qword ptr [rax + 0x378]
145c8ef05 488b8080030000 mov rax, qword ptr [rax + 0x380]
145c8ef0c 486bc058 imul rax, rax, 0x58
145c8ef10 4c01e0 add rax, r12
145c8ef13 48898530010000 mov qword ptr [rbp + 0x130], rax
145c8ef1a 488bbd28010000 mov rdi, qword ptr [rbp + 0x128]
145c8ef21 488d87c8040000 lea rax, [rdi + 0x4c8]
145c8ef28 48898518010000 mov qword ptr [rbp + 0x118], rax
145c8ef2f 4531ed xor r13d, r13d
145c8ef32 488d9df0000000 lea rbx, [rbp + 0xf0]
145c8ef39 4c8dbdb0000000 lea r15, [rbp + 0xb0]
145c8ef40 eb4b jmp 0x145c8ef8d
145c8ef42 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145c8ef50 488b85d8000000 mov rax, qword ptr [rbp + 0xd8]
145c8ef57 488d0cb6 lea rcx, [rsi + rsi*4]
145c8ef5b 488b5510 mov rdx, qword ptr [rbp + 0x10]
145c8ef5f 488954c820 mov qword ptr [rax + rcx*8 + 0x20], rdx
145c8ef64 f30f6f45f0 movdqu xmm0, xmmword ptr [rbp - 0x10]
145c8ef69 f30f6f4d00 movdqu xmm1, xmmword ptr [rbp]
145c8ef6e f30f7f4cc810 movdqu xmmword ptr [rax + rcx*8 + 0x10], xmm1
145c8ef74 f30f7f04c8 movdqu xmmword ptr [rax + rcx*8], xmm0
145c8ef79 48ffc6 inc rsi
145c8ef7c 4889b5e0000000 mov qword ptr [rbp + 0xe0], rsi
145c8ef83 4d89f4 mov r12, r14
145c8ef86 4c8bad38010000 mov r13, qword ptr [rbp + 0x138]
145c8ef8d 4c3ba530010000 cmp r12, qword ptr [rbp + 0x130]
145c8ef94 0f849f020000 je 0x145c8f239
145c8ef9a 48c785f000000004000000 mov qword ptr [rbp + 0xf0], 4
145c8efa5 488b9780030000 mov rdx, qword ptr [rdi + 0x380]
145c8efac 4939d5 cmp r13, rdx
145c8efaf 0f83ed090000 jae 0x145c8f9a2
145c8efb5 488b8778030000 mov rax, qword ptr [rdi + 0x378]
145c8efbc 496bcd58 imul rcx, r13, 0x58
145c8efc0 488d1408 lea rdx, [rax + rcx]
145c8efc4 488b0408 mov rax, qword ptr [rax + rcx]
145c8efc8 488b4830 mov rcx, qword ptr [rax + 0x30]
145c8efcc 4c8b4038 mov r8, qword ptr [rax + 0x38]
145c8efd0 4901c8 add r8, rcx
145c8efd3 48894df0 mov qword ptr [rbp - 0x10], rcx
145c8efd7 4c8945f8 mov qword ptr [rbp - 8], r8
145c8efdb 48894500 mov qword ptr [rbp], rax
145c8efdf 48895508 mov qword ptr [rbp + 8], rdx
145c8efe3 488b8518010000 mov rax, qword ptr [rbp + 0x118]
145c8efea 48894510 mov qword ptr [rbp + 0x10], rax
145c8efee 48895518 mov qword ptr [rbp + 0x18], rdx
145c8eff2 48894520 mov qword ptr [rbp + 0x20], rax
145c8eff6 48895d28 mov qword ptr [rbp + 0x28], rbx
145c8effa 48895530 mov qword ptr [rbp + 0x30], rdx
145c8effe 48895d38 mov qword ptr [rbp + 0x38], rbx
145c8f002 488b8548010000 mov rax, qword ptr [rbp + 0x148]
145c8f009 48898510010000 mov qword ptr [rbp + 0x110], rax
145c8f010 c6855701000001 mov byte ptr [rbp + 0x157], 1
145c8f017 4c89f9 mov rcx, r15
145c8f01a 488d55f0 lea rdx, [rbp - 0x10]
145c8f01e e88d170600 call 0x145cf07b0
145c8f023 90 nop
145c8f024 4d8d742458 lea r14, [r12 + 0x58]
145c8f029 498d7501 lea rsi, [r13 + 1]
145c8f02d 4883bdc000000000 cmp qword ptr [rbp + 0xc0], 0
145c8f035 0f84d5010000 je 0x145c8f210
145c8f03b 4c89b5a8000000 mov qword ptr [rbp + 0xa8], r14
145c8f042 4889b538010000 mov qword ptr [rbp + 0x138], rsi
145c8f049 488b95b0000000 mov rdx, qword ptr [rbp + 0xb0]
145c8f050 4885d2 test rdx, rdx
145c8f053 7412 je 0x145c8f067
145c8f055 488b8db8000000 mov rcx, qword ptr [rbp + 0xb8]
145c8f05c 41b801000000 mov r8d, 1
145c8f062 e8693137fa call 0x1400021d0
145c8f067 4c8bb7080a0000 mov r14, qword ptr [rdi + 0xa08]
145c8f06e 488bb7100a0000 mov rsi, qword ptr [rdi + 0xa10]
145c8f075 498b0424 mov rax, qword ptr [r12]
145c8f079 f30f6f00 movdqu xmm0, xmmword ptr [rax]
145c8f07d f30f7f85f0000000 movdqu xmmword ptr [rbp + 0xf0], xmm0
145c8f085 48899db0000000 mov qword ptr [rbp + 0xb0], rbx
145c8f08c 488d052d3037fa lea rax, [rip - 0x5c8cfd3]
145c8f093 488985b8000000 mov qword ptr [rbp + 0xb8], rax
145c8f09a 488b8548010000 mov rax, qword ptr [rbp + 0x148]
145c8f0a1 48898510010000 mov qword ptr [rbp + 0x110], rax
145c8f0a8 c6855701000001 mov byte ptr [rbp + 0x157], 1
145c8f0af 488d4df0 lea rcx, [rbp - 0x10]
145c8f0b3 488d15ee627501 lea rdx, [rip + 0x17562ee]
145c8f0ba 4d89f8 mov r8, r15
145c8f0bd e8ae533a00 call 0x146034470
145c8f0c2 90 nop
145c8f0c3 4885f6 test rsi, rsi
145c8f0c6 0f8494000000 je 0x145c8f160
145c8f0cc 48c1e603 shl rsi, 3
145c8f0d0 488d3c76 lea rdi, [rsi + rsi*2]
145c8f0d4 488b5df8 mov rbx, qword ptr [rbp - 8]
145c8f0d8 488b7500 mov rsi, qword ptr [rbp]
145c8f0dc 4531ff xor r15d, r15d
145c8f0df eb18 jmp 0x145c8f0f9
145c8f0e1 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145c8f0f0 4983c718 add r15, 0x18
145c8f0f4 4c39ff cmp rdi, r15
145c8f0f7 7467 je 0x145c8f160
145c8f0f9 4b39743e10 cmp qword ptr [r14 + r15 + 0x10], rsi
145c8f0fe 75f0 jne 0x145c8f0f0
145c8f100 4b8b4c3e08 mov rcx, qword ptr [r14 + r15 + 8]
145c8f105 4889da mov rdx, rbx
145c8f108 4989f0 mov r8, rsi
145c8f10b e811263d00 call 0x146061721
145c8f110 85c0 test eax, eax
145c8f112 75dc jne 0x145c8f0f0
145c8f114 488b55f0 mov rdx, qword ptr [rbp - 0x10]
145c8f118 4885d2 test rdx, rdx
145c8f11b 488bbd28010000 mov rdi, qword ptr [rbp + 0x128]
145c8f122 4c8dbdb0000000 lea r15, [rbp + 0xb0]
145c8f129 740e je 0x145c8f139
145c8f12b 41b801000000 mov r8d, 1
145c8f131 4889d9 mov rcx, rbx
145c8f134 e8973037fa call 0x1400021d0
145c8f139 4c8ba5a8000000 mov r12, qword ptr [rbp + 0xa8]
145c8f140 4c8bad38010000 mov r13, qword ptr [rbp + 0x138]
145c8f147 488d9df0000000 lea rbx, [rbp + 0xf0]
145c8f14e e93afeffff jmp 0x145c8ef8d
145c8f153 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145c8f160 488b55f0 mov rdx, qword ptr [rbp - 0x10]
145c8f164 4885d2 test rdx, rdx
145c8f167 740f je 0x145c8f178
145c8f169 488b4df8 mov rcx, qword ptr [rbp - 8]
145c8f16d 41b801000000 mov r8d, 1
145c8f173 e8583037fa call 0x1400021d0
145c8f178 e8833037fa call 0x140002200
145c8f17d b901000000 mov ecx, 1
145c8f182 ba01000000 mov edx, 1
145c8f187 e8343037fa call 0x1400021c0
145c8f18c 4885c0 test rax, rax
145c8f18f 4d8d742458 lea r14, [r12 + 0x58]
145c8f194 0f84de070000 je 0x145c8f978
145c8f19a 498b0c24 mov rcx, qword ptr [r12]
145c8f19e 4883793800 cmp qword ptr [rcx + 0x38], 0
145c8f1a3 488bbd28010000 mov rdi, qword ptr [rbp + 0x128]
145c8f1aa 488d9df0000000 lea rbx, [rbp + 0xf0]
145c8f1b1 4c8dbdb0000000 lea r15, [rbp + 0xb0]
145c8f1b8 0f840b080000 je 0x145c8f9c9
145c8f1be 488b4930 mov rcx, qword ptr [rcx + 0x30]
145c8f1c2 0fb609 movzx ecx, byte ptr [rcx]
145c8f1c5 8808 mov byte ptr [rax], cl
145c8f1c7 c745f06666a63f mov dword ptr [rbp - 0x10], 0x3fa66666
145c8f1ce 48c745f801000000 mov qword ptr [rbp - 8], 1
145c8f1d6 48894500 mov qword ptr [rbp], rax
145c8f1da 48c7450801000000 mov qword ptr [rbp + 8], 1
145c8f1e2 4c896d10 mov qword ptr [rbp + 0x10], r13
145c8f1e6 488bb5e0000000 mov rsi, qword ptr [rbp + 0xe0]
145c8f1ed 483bb5d0000000 cmp rsi, qword ptr [rbp + 0xd0]
145c8f1f4 0f8556fdffff jne 0x145c8ef50
145c8f1fa 488d8dd0000000 lea rcx, [rbp + 0xd0]
145c8f201 e8ba2d3d00 call 0x146061fc0
145c8f206 90 nop
145c8f207 e944fdffff jmp 0x145c8ef50
145c8f20c 0f1f4000 nop dword ptr [rax]
145c8f210 488b95b0000000 mov rdx, qword ptr [rbp + 0xb0]
145c8f217 4885d2 test rdx, rdx
145c8f21a 7412 je 0x145c8f22e
145c8f21c 488b8db8000000 mov rcx, qword ptr [rbp + 0xb8]
145c8f223 41b801000000 mov r8d, 1
145c8f229 e8a22f37fa call 0x1400021d0
145c8f22e 4d89f4 mov r12, r14
145c8f231 4989f5 mov r13, rsi
145c8f234 e954fdffff jmp 0x145c8ef8d
145c8f239 0fb687cb020000 movzx eax, byte ptr [rdi + 0x2cb]
145c8f240 f6d0 not al
145c8f242 0a877d0d0000 or al, byte ptr [rdi + 0xd7d]
145c8f248 0fb6c0 movzx eax, al
145c8f24b 83e001 and eax, 1
145c8f24e b904000000 mov ecx, 4
145c8f253 4829c1 sub rcx, rax
145c8f256 48898d38010000 mov qword ptr [rbp + 0x138], rcx
145c8f25d 488b8de0000000 mov rcx, qword ptr [rbp + 0xe0]
145c8f264 48894de0 mov qword ptr [rbp - 0x20], rcx
145c8f268 0f1085d0000000 movups xmm0, xmmword ptr [rbp + 0xd0]
145c8f26f 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
145c8f273 48c7859000000000000000 mov qword ptr [rbp + 0x90], 0
145c8f27e 48c7859800000008000000 mov qword ptr [rbp + 0x98], 8
145c8f289 48c785a000000000000000 mov qword ptr [rbp + 0xa0], 0
145c8f294 488d87200c0000 lea rax, [rdi + 0xc20]
145c8f29b 488945a8 mov qword ptr [rbp - 0x58], rax
145c8f29f 488b45d8 mov rax, qword ptr [rbp - 0x28]
145c8f2a3 48898518010000 mov qword ptr [rbp + 0x118], rax
145c8f2aa 488d04cd00000000 lea rax, [rcx*8]
145c8f2b2 4c8d2480 lea r12, [rax + rax*4]
145c8f2b6 bf08000000 mov edi, 8
145c8f2bb 4531ed xor r13d, r13d
145c8f2be f30f1035ead75b00 movss xmm6, dword ptr [rip + 0x5bd7ea]
145c8f2c6 f30f103d52037900 movss xmm7, dword ptr [rip + 0x790352]
145c8f2ce 4189ce mov r14d, ecx
145c8f2d1 48898da8000000 mov qword ptr [rbp + 0xa8], rcx
145c8f2d8 4889cb mov rbx, rcx
145c8f2db 4531ff xor r15d, r15d
145c8f2de eb42 jmp 0x145c8f322
145c8f2e0 488bbd98000000 mov rdi, qword ptr [rbp + 0x98]
145c8f2e7 4c89f8 mov rax, r15
145c8f2ea 48c1e005 shl rax, 5
145c8f2ee 48891c07 mov qword ptr [rdi + rax], rbx
145c8f2f2 0f2885f0000000 movaps xmm0, xmmword ptr [rbp + 0xf0]
145c8f2f9 0f11440708 movups xmmword ptr [rdi + rax + 8], xmm0
145c8f2fe 488b8d00010000 mov rcx, qword ptr [rbp + 0x100]
145c8f305 48894c0718 mov qword ptr [rdi + rax + 0x18], rcx
145c8f30a 49ffc7 inc r15
145c8f30d 4c89bda0000000 mov qword ptr [rbp + 0xa0], r15
145c8f314 49ffc5 inc r13
145c8f317 4180c603 add r14b, 3
145c8f31b 4983c4d8 add r12, -0x28
145c8f31f 4889f3 mov rbx, rsi
145c8f322 4c3bbd38010000 cmp r15, qword ptr [rbp + 0x138]
145c8f329 48899d30010000 mov qword ptr [rbp + 0x130], rbx
145c8f330 0f8385010000 jae 0x145c8f4bb
145c8f336 4885db test rbx, rbx
145c8f339 0f847c010000 je 0x145c8f4bb
145c8f33f 4c89e8 mov rax, r13
145c8f342 482b85a8000000 sub rax, qword ptr [rbp + 0xa8]
145c8f349 4883f8fc cmp rax, -4
145c8f34d 7611 jbe 0x145c8f360
145c8f34f 31c0 xor eax, eax
145c8f351 0f28d6 movaps xmm2, xmm6
145c8f354 488bbd18010000 mov rdi, qword ptr [rbp + 0x118]
145c8f35b eb4b jmp 0x145c8f3a8
145c8f35d 0f1f00 nop dword ptr [rax]
145c8f360 4889d9 mov rcx, rbx
145c8f363 48b8fcffffffffffff03 movabs rax, 0x3fffffffffffffc
145c8f36d 4821c1 and rcx, rax
145c8f370 488bbd18010000 mov rdi, qword ptr [rbp + 0x118]
145c8f377 4889fa mov rdx, rdi
145c8f37a 31c0 xor eax, eax
145c8f37c 0f28d6 movaps xmm2, xmm6
145c8f37f 90 nop
145c8f380 f30f5812 addss xmm2, dword ptr [rdx]
145c8f384 f30f585228 addss xmm2, dword ptr [rdx + 0x28]
145c8f389 f30f585250 addss xmm2, dword ptr [rdx + 0x50]
145c8f38e f30f585278 addss xmm2, dword ptr [rdx + 0x78]
145c8f393 4883c004 add rax, 4
145c8f397 4881c2a0000000 add rdx, 0xa0
145c8f39e 4839c1 cmp rcx, rax
145c8f3a1 75dd jne 0x145c8f380
145c8f3a3 f6c303 test bl, 3
145c8f3a6 7426 je 0x145c8f3ce
145c8f3a8 410fb6ce movzx ecx, r14b
145c8f3ac 83e103 and ecx, 3
145c8f3af c1e103 shl ecx, 3
145c8f3b2 488d0c89 lea rcx, [rcx + rcx*4]
145c8f3b6 488d0480 lea rax, [rax + rax*4]
145c8f3ba 488d04c7 lea rax, [rdi + rax*8]
145c8f3be 31d2 xor edx, edx
145c8f3c0 f30f581410 addss xmm2, dword ptr [rax + rdx]
145c8f3c5 4883c228 add rdx, 0x28
145c8f3c9 4839d1 cmp rcx, rdx
145c8f3cc 75f2 jne 0x145c8f3c0
145c8f3ce f30f5fd7 maxss xmm2, xmm7
145c8f3d2 660fefc9 pxor xmm1, xmm1
145c8f3d6 488b4da8 mov rcx, qword ptr [rbp - 0x58]
145c8f3da e811230200 call 0x145cb16f0
145c8f3df 90 nop
145c8f3e0 488d73ff lea rsi, [rbx - 1]
145c8f3e4 31c0 xor eax, eax
145c8f3e6 4531ff xor r15d, r15d
145c8f3e9 0f1f8000000000 nop dword ptr [rax]
145c8f3f0 f30f100c07 movss xmm1, dword ptr [rdi + rax]
145c8f3f5 0f2ec8 ucomiss xmm1, xmm0
145c8f3f8 7713 ja 0x145c8f40d
145c8f3fa 49ffc7 inc r15
145c8f3fd f30f5cc1 subss xmm0, xmm1
145c8f401 4883c028 add rax, 0x28
145c8f405 4939c4 cmp r12, rax
145c8f408 75e6 jne 0x145c8f3f0
145c8f40a 4989f7 mov r15, rsi
145c8f40d 4939df cmp r15, rbx
145c8f410 0f8305060000 jae 0x145c8fa1b
145c8f416 4989d8 mov r8, rbx
145c8f419 4b8d04bf lea rax, [r15 + r15*4]
145c8f41d 488d0cc7 lea rcx, [rdi + rax*8]
145c8f421 488b5cc708 mov rbx, qword ptr [rdi + rax*8 + 8]
145c8f426 488b54c720 mov rdx, qword ptr [rdi + rax*8 + 0x20]
145c8f42b 488995c0000000 mov qword ptr [rbp + 0xc0], rdx
145c8f432 0f1044c710 movups xmm0, xmmword ptr [rdi + rax*8 + 0x10]
145c8f437 0f2985b0000000 movaps xmmword ptr [rbp + 0xb0], xmm0
145c8f43e 488d14c7 lea rdx, [rdi + rax*8]
145c8f442 4883c228 add rdx, 0x28
145c8f446 4c89f8 mov rax, r15
145c8f449 48f7d0 not rax
145c8f44c 4901c0 add r8, rax
145c8f44f 49c1e003 shl r8, 3
145c8f453 4f8d0480 lea r8, [r8 + r8*4]
145c8f457 e8cb223d00 call 0x146061727
145c8f45c 488975e0 mov qword ptr [rbp - 0x20], rsi
145c8f460 4883fbff cmp rbx, -1
145c8f464 0f84aa050000 je 0x145c8fa14
145c8f46a 488b85c0000000 mov rax, qword ptr [rbp + 0xc0]
145c8f471 48898500010000 mov qword ptr [rbp + 0x100], rax
145c8f478 0f2885b0000000 movaps xmm0, xmmword ptr [rbp + 0xb0]
145c8f47f 0f2985f0000000 movaps xmmword ptr [rbp + 0xf0], xmm0
145c8f486 48895df0 mov qword ptr [rbp - 0x10], rbx
145c8f48a 488d4df8 lea rcx, [rbp - 8]
145c8f48e 48894110 mov qword ptr [rcx + 0x10], rax
145c8f492 0f1101 movups xmmword ptr [rcx], xmm0
145c8f495 4c8bbda0000000 mov r15, qword ptr [rbp + 0xa0]
145c8f49c 4c3bbd90000000 cmp r15, qword ptr [rbp + 0x90]
145c8f4a3 0f8537feffff jne 0x145c8f2e0
145c8f4a9 488d8d90000000 lea rcx, [rbp + 0x90]
145c8f4b0 e82b2a3d00 call 0x146061ee0
145c8f4b5 90 nop
145c8f4b6 e925feffff jmp 0x145c8f2e0
145c8f4bb 488bb590000000 mov rsi, qword ptr [rbp + 0x90]
145c8f4c2 488b8518010000 mov rax, qword ptr [rbp + 0x118]
145c8f4c9 488d4808 lea rcx, [rax + 8]
145c8f4cd 48c7853801000000000000 mov qword ptr [rbp + 0x138], 0
145c8f4d8 0f1f840000000000 nop dword ptr [rax + rax]
145c8f4e0 488b8538010000 mov rax, qword ptr [rbp + 0x138]
145c8f4e7 48398530010000 cmp qword ptr [rbp + 0x130], rax
145c8f4ee 7419 je 0x145c8f509
145c8f4f0 48ffc0 inc rax
145c8f4f3 48898538010000 mov qword ptr [rbp + 0x138], rax
145c8f4fa 488d5928 lea rbx, [rcx + 0x28]
145c8f4fe e8fd7cf6ff call 0x145bf7200
145c8f503 90 nop
145c8f504 4889d9 mov rcx, rbx
145c8f507 ebd7 jmp 0x145c8f4e0
145c8f509 488b45d0 mov rax, qword ptr [rbp - 0x30]
145c8f50d 4885c0 test rax, rax
145c8f510 741a je 0x145c8f52c
145c8f512 48c1e003 shl rax, 3
145c8f516 488d1480 lea rdx, [rax + rax*4]
145c8f51a 41b808000000 mov r8d, 8
145c8f520 488b8d18010000 mov rcx, qword ptr [rbp + 0x118]
145c8f527 e8a42c37fa call 0x1400021d0
145c8f52c 49c1e705 shl r15, 5
145c8f530 4901ff add r15, rdi
145c8f533 48897df0 mov qword ptr [rbp - 0x10], rdi
145c8f537 48897df8 mov qword ptr [rbp - 8], rdi
145c8f53b 48897500 mov qword ptr [rbp], rsi
145c8f53f 4c897d08 mov qword ptr [rbp + 8], r15
145c8f543 488bb528010000 mov rsi, qword ptr [rbp + 0x128]
145c8f54a 48897510 mov qword ptr [rbp + 0x10], rsi
145c8f54e 488b8548010000 mov rax, qword ptr [rbp + 0x148]
145c8f555 48898510010000 mov qword ptr [rbp + 0x110], rax
145c8f55c c6855701000000 mov byte ptr [rbp + 0x157], 0
145c8f563 488d8df0000000 lea rcx, [rbp + 0xf0]
145c8f56a 488d55f0 lea rdx, [rbp - 0x10]
145c8f56e e8dd550700 call 0x145d04b50
145c8f573 90 nop
145c8f574 4883bd0001000000 cmp qword ptr [rbp + 0x100], 0
145c8f57c 756a jne 0x145c8f5e8
145c8f57e c785b800000019000000 mov dword ptr [rbp + 0xb8], 0x19
145c8f588 48b80400000000000080 movabs rax, 0x8000000000000004
145c8f592 488985b0000000 mov qword ptr [rbp + 0xb0], rax
145c8f599 488d4df0 lea rcx, [rbp - 0x10]
145c8f59d 4c8d85b0000000 lea r8, [rbp + 0xb0]
145c8f5a4 4889f2 mov rdx, rsi
145c8f5a7 4531c9 xor r9d, r9d
145c8f5aa e8113f0000 call 0x145c934c0
145c8f5af 90 nop
145c8f5b0 4883bdf000000000 cmp qword ptr [rbp + 0xf0], 0
145c8f5b8 750d jne 0x145c8f5c7
145c8f5ba 488d8df0000000 lea rcx, [rbp + 0xf0]
145c8f5c1 e88a324000 call 0x146092850
145c8f5c6 90 nop
145c8f5c7 488b8df8000000 mov rcx, qword ptr [rbp + 0xf8]
145c8f5ce 488d55f0 lea rdx, [rbp - 0x10]
145c8f5d2 41b8a0000000 mov r8d, 0xa0
145c8f5d8 e83e213d00 call 0x14606171b
145c8f5dd 48c7850001000001000000 mov qword ptr [rbp + 0x100], 1
145c8f5e8 488b8500010000 mov rax, qword ptr [rbp + 0x100]
145c8f5ef 48894500 mov qword ptr [rbp], rax
145c8f5f3 0f1085f0000000 movups xmm0, xmmword ptr [rbp + 0xf0]
145c8f5fa 0f2945f0 movaps xmmword ptr [rbp - 0x10], xmm0
145c8f5fe 4883bd0801000000 cmp qword ptr [rbp + 0x108], 0
145c8f606 488b95e8000000 mov rdx, qword ptr [rbp + 0xe8]
145c8f60d 488b8d48010000 mov rcx, qword ptr [rbp + 0x148]
145c8f614 740b je 0x145c8f621
145c8f616 41b808000000 mov r8d, 8
145c8f61c e8af2b37fa call 0x1400021d0
145c8f621 488d86a0060000 lea rax, [rsi + 0x6a0]
145c8f628 48898530010000 mov qword ptr [rbp + 0x130], rax
145c8f62f 488b8ea8060000 mov rcx, qword ptr [rsi + 0x6a8]
145c8f636 488b86b0060000 mov rax, qword ptr [rsi + 0x6b0]
145c8f63d 48898538010000 mov qword ptr [rbp + 0x138], rax
145c8f644 48c7854801000000000000 mov qword ptr [rbp + 0x148], 0
145c8f64f 48898d18010000 mov qword ptr [rbp + 0x118], rcx
145c8f656 662e0f1f840000000000 nop word ptr cs:[rax + rax]
145c8f660 488b8548010000 mov rax, qword ptr [rbp + 0x148]
145c8f667 48398538010000 cmp qword ptr [rbp + 0x138], rax
145c8f66e 741c je 0x145c8f68c
145c8f670 48ffc0 inc rax
145c8f673 48898548010000 mov qword ptr [rbp + 0x148], rax
145c8f67a 488db1a0000000 lea rsi, [rcx + 0xa0]
145c8f681 e83a7cf6ff call 0x145bf72c0
145c8f686 90 nop
145c8f687 4889f1 mov rcx, rsi
145c8f68a ebd4 jmp 0x145c8f660
145c8f68c 488bb530010000 mov rsi, qword ptr [rbp + 0x130]
145c8f693 488b06 mov rax, qword ptr [rsi]
145c8f696 4885c0 test rax, rax
145c8f699 488bbd28010000 mov rdi, qword ptr [rbp + 0x128]
145c8f6a0 741a je 0x145c8f6bc
145c8f6a2 488b8fa8060000 mov rcx, qword ptr [rdi + 0x6a8]
145c8f6a9 48c1e005 shl rax, 5
145c8f6ad 488d1480 lea rdx, [rax + rax*4]
145c8f6b1 41b808000000 mov r8d, 8
145c8f6b7 e8142b37fa call 0x1400021d0
145c8f6bc 488b4500 mov rax, qword ptr [rbp]
145c8f6c0 48894610 mov qword ptr [rsi + 0x10], rax
145c8f6c4 0f2845f0 movaps xmm0, xmmword ptr [rbp - 0x10]
145c8f6c8 0f1106 movups xmmword ptr [rsi], xmm0
145c8f6cb 488b87b0060000 mov rax, qword ptr [rdi + 0x6b0]
145c8f6d2 4885c0 test rax, rax
145c8f6d5 0f84a5010000 je 0x145c8f880
145c8f6db 488b9fa8060000 mov rbx, qword ptr [rdi + 0x6a8]
145c8f6e2 48c1e005 shl rax, 5
145c8f6e6 4c8d2c80 lea r13, [rax + rax*4]
145c8f6ea 488d8720070000 lea rax, [rdi + 0x720]
145c8f6f1 48898530010000 mov qword ptr [rbp + 0x130], rax
145c8f6f8 48ba0000000000000080 movabs rdx, 0x8000000000000000
145c8f702 41be01000000 mov r14d, 1
145c8f708 4531ff xor r15d, r15d
145c8f70b eb60 jmp 0x145c8f76d
145c8f70d 0f1f00 nop dword ptr [rax]
145c8f710 488b9528010000 mov rdx, qword ptr [rbp + 0x128]
145c8f717 488b8228070000 mov rax, qword ptr [rdx + 0x728]
145c8f71e 4889f1 mov rcx, rsi
145c8f721 48c1e105 shl rcx, 5
145c8f725 4c8b8548010000 mov r8, qword ptr [rbp + 0x148]
145c8f72c 4c890408 mov qword ptr [rax + rcx], r8
145c8f730 4c8b8538010000 mov r8, qword ptr [rbp + 0x138]
145c8f737 4c89440808 mov qword ptr [rax + rcx + 8], r8
145c8f73c 4c89640810 mov qword ptr [rax + rcx + 0x10], r12
145c8f741 40887c0818 mov byte ptr [rax + rcx + 0x18], dil
145c8f746 4889d7 mov rdi, rdx
145c8f749 48ffc6 inc rsi
145c8f74c 4889b230070000 mov qword ptr [rdx + 0x730], rsi
145c8f753 48ba0000000000000080 movabs rdx, 0x8000000000000000
145c8f75d 4981c7a0000000 add r15, 0xa0
145c8f764 4d39fd cmp r13, r15
145c8f767 0f8413010000 je 0x145c8f880
145c8f76d 4a8b4c3b78 mov rcx, qword ptr [rbx + r15 + 0x78]
145c8f772 4889c8 mov rax, rcx
145c8f775 4831d0 xor rax, rdx
145c8f778 4885c9 test rcx, rcx
145c8f77b 490f49c6 cmovns rax, r14
145c8f77f 4883f802 cmp rax, 2
145c8f783 743b je 0x145c8f7c0
145c8f785 4883f803 cmp rax, 3
145c8f789 75d2 jne 0x145c8f75d
145c8f78b 4a8b943b80000000 mov rdx, qword ptr [rbx + r15 + 0x80]
145c8f793 488d4db8 lea rcx, [rbp - 0x48]
145c8f797 e894513a00 call 0x146034930
145c8f79c 488b45b8 mov rax, qword ptr [rbp - 0x48]
145c8f7a0 48898548010000 mov qword ptr [rbp + 0x148], rax
145c8f7a7 488b45c0 mov rax, qword ptr [rbp - 0x40]
145c8f7ab 48898538010000 mov qword ptr [rbp + 0x138], rax
145c8f7b2 4c8b65c8 mov r12, qword ptr [rbp - 0x38]
145c8f7b6 e97f000000 jmp 0x145c8f83a
145c8f7bb 0f1f440000 nop dword ptr [rax + rax]
145c8f7c0 4a8b843b80000000 mov rax, qword ptr [rbx + r15 + 0x80]
145c8f7c8 4c8b6008 mov r12, qword ptr [rax + 8]
145c8f7cc 4d85e4 test r12, r12
145c8f7cf 0f889b000000 js 0x145c8f870
145c8f7d5 7438 je 0x145c8f80f
145c8f7d7 488b30 mov rsi, qword ptr [rax]
145c8f7da e8212a37fa call 0x140002200
145c8f7df ba01000000 mov edx, 1
145c8f7e4 4c89e1 mov rcx, r12
145c8f7e7 e8d42937fa call 0x1400021c0
145c8f7ec 4885c0 test rax, rax
145c8f7ef 0f84ee010000 je 0x145c8f9e3
145c8f7f5 4889c7 mov rdi, rax
145c8f7f8 4889c1 mov rcx, rax
145c8f7fb 4889f2 mov rdx, rsi
145c8f7fe 4d89e0 mov r8, r12
145c8f801 e8151f3d00 call 0x14606171b
145c8f806 4889bd18010000 mov qword ptr [rbp + 0x118], rdi
145c8f80d eb11 jmp 0x145c8f820
145c8f80f bf01000000 mov edi, 1
145c8f814 b801000000 mov eax, 1
145c8f819 48898518010000 mov qword ptr [rbp + 0x118], rax
145c8f820 4c8965b8 mov qword ptr [rbp - 0x48], r12
145c8f824 4889bd38010000 mov qword ptr [rbp + 0x138], rdi
145c8f82b 48897dc0 mov qword ptr [rbp - 0x40], rdi
145c8f82f 4c8965c8 mov qword ptr [rbp - 0x38], r12
145c8f833 4c89a548010000 mov qword ptr [rbp + 0x148], r12
145c8f83a 420fb6bc3b98000000 movzx edi, byte ptr [rbx + r15 + 0x98]
145c8f843 488b8528010000 mov rax, qword ptr [rbp + 0x128]
145c8f84a 488bb030070000 mov rsi, qword ptr [rax + 0x730]
145c8f851 483bb020070000 cmp rsi, qword ptr [rax + 0x720]
145c8f858 0f85b2feffff jne 0x145c8f710
145c8f85e 488b8d30010000 mov rcx, qword ptr [rbp + 0x130]
145c8f865 e876263d00 call 0x146061ee0
145c8f86a 90 nop
145c8f86b e9a0feffff jmp 0x145c8f710
145c8f870 31c9 xor ecx, ecx
145c8f872 488b9518010000 mov rdx, qword ptr [rbp + 0x118]
145c8f879 e8ed905700 call 0x14620896b
145c8f87e 0f0b ud2
145c8f880 0fb68527010000 movzx eax, byte ptr [rbp + 0x127]
145c8f887 8887810d0000 mov byte ptr [rdi + 0xd81], al
145c8f88d ff87ec0c0000 inc dword ptr [rdi + 0xcec]
145c8f893 80bd2601000000 cmp byte ptr [rbp + 0x126], 0
145c8f89a 7418 je 0x145c8f8b4
145c8f89c c687830d000002 mov byte ptr [rdi + 0xd83], 2
145c8f8a3 80bf7e0d000000 cmp byte ptr [rdi + 0xd7e], 0
145c8f8aa 7508 jne 0x145c8f8b4
145c8f8ac 4889f9 mov rcx, rdi
145c8f8af e8acf5f7ff call 0x145c0ee60
145c8f8b4 488b4db0 mov rcx, qword ptr [rbp - 0x50]
145c8f8b8 c1e103 shl ecx, 3
145c8f8bb 488d05de1b7501 lea rax, [rip + 0x1751bde]
145c8f8c2 4c8b0c01 mov r9, qword ptr [rcx + rax]
145c8f8c6 488d05eb1b7501 lea rax, [rip + 0x1751beb]
145c8f8cd 4c8b0401 mov r8, qword ptr [rcx + rax]
145c8f8d1 488d4df0 lea rcx, [rbp - 0x10]
145c8f8d5 4889fa mov rdx, rdi
145c8f8d8 e893190000 call 0x145c91270
145c8f8dd 488bb798060000 mov rsi, qword ptr [rdi + 0x698]
145c8f8e4 483bb788060000 cmp rsi, qword ptr [rdi + 0x688]
145c8f8eb 7523 jne 0x145c8f910
145c8f8ed 488d8f88060000 lea rcx, [rdi + 0x688]
145c8f8f4 488b45f0 mov rax, qword ptr [rbp - 0x10]
145c8f8f8 48898548010000 mov qword ptr [rbp + 0x148], rax
145c8f8ff 488b45f8 mov rax, qword ptr [rbp - 8]
145c8f903 48898538010000 mov qword ptr [rbp + 0x138], rax
145c8f90a e8c1223d00 call 0x146061bd0
145c8f90f 90 nop
145c8f910 488b8790060000 mov rax, qword ptr [rdi + 0x690]
145c8f917 488d0c76 lea rcx, [rsi + rsi*2]
145c8f91b 488b5500 mov rdx, qword ptr [rbp]
145c8f91f 488954c810 mov qword ptr [rax + rcx*8 + 0x10], rdx
145c8f924 0f1045f0 movups xmm0, xmmword ptr [rbp - 0x10]
145c8f928 0f1104c8 movups xmmword ptr [rax + rcx*8], xmm0
145c8f92c 48ffc6 inc rsi
145c8f92f 4889b798060000 mov qword ptr [rdi + 0x698], rsi
145c8f936 4889f9 mov rcx, rdi
145c8f939 e8d2110000 call 0x145c90b10
145c8f93e 0f28b560010000 movaps xmm6, xmmword ptr [rbp + 0x160]
145c8f945 0f28bd70010000 movaps xmm7, xmmword ptr [rbp + 0x170]
145c8f94c 440f288580010000 movaps xmm8, xmmword ptr [rbp + 0x180]
145c8f954 440f288d90010000 movaps xmm9, xmmword ptr [rbp + 0x190]
145c8f95c 440f2895a0010000 movaps xmm10, xmmword ptr [rbp + 0x1a0]
145c8f964 4881c438020000 add rsp, 0x238
145c8f96b 5b pop rbx
145c8f96c 5f pop rdi
145c8f96d 5e pop rsi
145c8f96e 415c pop r12
145c8f970 415d pop r13
145c8f972 415e pop r14
145c8f974 415f pop r15
145c8f976 5d pop rbp
145c8f977 c3 ret
145c8f978 488b8548010000 mov rax, qword ptr [rbp + 0x148]
145c8f97f 48898510010000 mov qword ptr [rbp + 0x110], rax
145c8f986 c6855701000001 mov byte ptr [rbp + 0x157], 1
145c8f98d b901000000 mov ecx, 1
145c8f992 ba01000000 mov edx, 1
145c8f997 e8b58f5700 call 0x146208951
145c8f99c 90 nop
145c8f99d e990000000 jmp 0x145c8fa32
145c8f9a2 488b8548010000 mov rax, qword ptr [rbp + 0x148]
145c8f9a9 48898510010000 mov qword ptr [rbp + 0x110], rax
145c8f9b0 c6855701000001 mov byte ptr [rbp + 0x157], 1
145c8f9b7 4c8d0562137501 lea r8, [rip + 0x1751362]
145c8f9be 4c89e9 mov rcx, r13
145c8f9c1 e83d935700 call 0x146208d03
145c8f9c6 90 nop
145c8f9c7 eb69 jmp 0x145c8fa32
145c8f9c9 48898538010000 mov qword ptr [rbp + 0x138], rax
145c8f9d0 4c8d05f1147501 lea r8, [rip + 0x17514f1]
145c8f9d7 31c9 xor ecx, ecx
145c8f9d9 31d2 xor edx, edx
145c8f9db e823935700 call 0x146208d03
145c8f9e0 90 nop
145c8f9e1 eb4f jmp 0x145c8fa32
145c8f9e3 4c89a518010000 mov qword ptr [rbp + 0x118], r12
145c8f9ea b901000000 mov ecx, 1
145c8f9ef 488b9518010000 mov rdx, qword ptr [rbp + 0x118]
145c8f9f6 e8708f5700 call 0x14620896b
145c8f9fb 0f0b ud2
145c8f9fd c6854701000001 mov byte ptr [rbp + 0x147], 1
145c8fa04 b908000000 mov ecx, 8
145c8fa09 4c89ea mov rdx, r13
145c8fa0c e85a8f5700 call 0x14620896b
145c8fa11 90 nop
145c8fa12 eb1e jmp 0x145c8fa32
145c8fa14 4889b530010000 mov qword ptr [rbp + 0x130], rsi
145c8fa1b 4c8d0516e67401 lea r8, [rip + 0x174e616]
145c8fa22 4c89f9 mov rcx, r15
145c8fa25 488b9530010000 mov rdx, qword ptr [rbp + 0x130]
145c8fa2c e80a905700 call 0x146208a3b
145c8fa31 90 nop
145c8fa32 0f0b ud2
