0000000145c4e9e0 55                             push rbp
0000000145c4e9e1 4157                           push r15
0000000145c4e9e3 4156                           push r14
0000000145c4e9e5 4155                           push r13
0000000145c4e9e7 4154                           push r12
0000000145c4e9e9 56                             push rsi
0000000145c4e9ea 57                             push rdi
0000000145c4e9eb 53                             push rbx
0000000145c4e9ec 4881ecd8000000                 sub rsp, 0xd8
0000000145c4e9f3 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145c4e9fb 440f296d40                     movaps xmmword ptr [rbp + 0x40], xmm13
0000000145c4ea00 440f296530                     movaps xmmword ptr [rbp + 0x30], xmm12
0000000145c4ea05 440f295d20                     movaps xmmword ptr [rbp + 0x20], xmm11
0000000145c4ea0a 440f295510                     movaps xmmword ptr [rbp + 0x10], xmm10
0000000145c4ea0f 440f294d00                     movaps xmmword ptr [rbp], xmm9
0000000145c4ea14 440f2945f0                     movaps xmmword ptr [rbp - 0x10], xmm8
0000000145c4ea19 0f297de0                       movaps xmmword ptr [rbp - 0x20], xmm7
0000000145c4ea1d 0f2975d0                       movaps xmmword ptr [rbp - 0x30], xmm6
0000000145c4ea21 48c745c8feffffff               mov qword ptr [rbp - 0x38], 0xfffffffffffffffe
0000000145c4ea29 4989d6                         mov r14, rdx
0000000145c4ea2c 4889ce                         mov rsi, rcx
0000000145c4ea2f 488bb9d0020000                 mov rdi, qword ptr [rcx + 0x2d0]
0000000145c4ea36 488b99d8020000                 mov rbx, qword ptr [rcx + 0x2d8]
0000000145c4ea3d 4889f9                         mov rcx, rdi
0000000145c4ea40 4889da                         mov rdx, rbx
0000000145c4ea43 e848d7e4ff                     call 0x145a9c190
0000000145c4ea48 4c69e0f0000000                 imul r12, rax, 0xf0
0000000145c4ea4f 4c8d3dfaf73601                 lea r15, [rip + 0x136f7fa]
0000000145c4ea56 f30f10be740c0000               movss xmm7, dword ptr [rsi + 0xc74]
0000000145c4ea5e 440f28cf                       movaps xmm9, xmm7
0000000145c4ea62 f3440f5e0dc5ae5900             divss xmm9, dword ptr [rip + 0x59aec5]
0000000145c4ea6b f3440f1096f80c0000             movss xmm10, dword ptr [rsi + 0xcf8]
0000000145c4ea74 f3470f10843ce0000000           movss xmm8, dword ptr [r12 + r15 + 0xe0]
0000000145c4ea7e 4b8b943c88000000               mov rdx, qword ptr [r12 + r15 + 0x88]
0000000145c4ea86 4c8d8208020000                 lea r8, [rdx + 0x208]
0000000145c4ea8d 488d4da8                       lea rcx, [rbp - 0x58]
0000000145c4ea91 e8ea6a0200                     call 0x145c75580
0000000145c4ea96 4c8b6db0                       mov r13, qword ptr [rbp - 0x50]
0000000145c4ea9a 488b55b8                       mov rdx, qword ptr [rbp - 0x48]
0000000145c4ea9e 4883fa01                       cmp rdx, 1
0000000145c4eaa2 0f84b8000000                   je 0x145c4eb60
0000000145c4eaa8 450f57db                       xorps xmm11, xmm11
0000000145c4eaac 4885d2                         test rdx, rdx
0000000145c4eaaf 0f84b1000000                   je 0x145c4eb66
0000000145c4eab5 f3410f104500                   movss xmm0, dword ptr [r13]
0000000145c4eabb 410f2ec1                       ucomiss xmm0, xmm9
0000000145c4eabf 0f83c2020000                   jae 0x145c4ed87
0000000145c4eac5 488d04d500000000               lea rax, [rdx*8]
0000000145c4eacd 31c9                           xor ecx, ecx
0000000145c4eacf 90                             nop
0000000145c4ead0 f3410f1044cd00                 movss xmm0, dword ptr [r13 + rcx*8]
0000000145c4ead7 410f2ec1                       ucomiss xmm0, xmm9
0000000145c4eadb 730d                           jae 0x145c4eaea
0000000145c4eadd 48ffc1                         inc rcx
0000000145c4eae0 4883c0f8                       add rax, -8
0000000145c4eae4 75ea                           jne 0x145c4ead0
0000000145c4eae6 488d4aff                       lea rcx, [rdx - 1]
0000000145c4eaea 4883f901                       cmp rcx, 1
0000000145c4eaee 4883d100                       adc rcx, 0
0000000145c4eaf2 488d41ff                       lea rax, [rcx - 1]
0000000145c4eaf6 4839d0                         cmp rax, rdx
0000000145c4eaf9 0f83db020000                   jae 0x145c4edda
0000000145c4eaff 4839d1                         cmp rcx, rdx
0000000145c4eb02 0f83e8020000                   jae 0x145c4edf0
0000000145c4eb08 f3410f1044cdf8                 movss xmm0, dword ptr [r13 + rcx*8 - 8]
0000000145c4eb0f f3410f104ccdfc                 movss xmm1, dword ptr [r13 + rcx*8 - 4]
0000000145c4eb16 f3410f1054cd00                 movss xmm2, dword ptr [r13 + rcx*8]
0000000145c4eb1d f3410f105ccd04                 movss xmm3, dword ptr [r13 + rcx*8 + 4]
0000000145c4eb24 f30f5cd9                       subss xmm3, xmm1
0000000145c4eb28 450f28d9                       movaps xmm11, xmm9
0000000145c4eb2c f3440f5cd8                     subss xmm11, xmm0
0000000145c4eb31 f3440f59db                     mulss xmm11, xmm3
0000000145c4eb36 f30f5cd0                       subss xmm2, xmm0
0000000145c4eb3a f30f5f15ea9d5400               maxss xmm2, dword ptr [rip + 0x549dea]
0000000145c4eb42 f3440f5eda                     divss xmm11, xmm2
0000000145c4eb47 f3440f58d9                     addss xmm11, xmm1
0000000145c4eb4c 4d01e7                         add r15, r12
0000000145c4eb4f 498b9780000000                 mov rdx, qword ptr [r15 + 0x80]
0000000145c4eb56 4939d6                         cmp r14, rdx
0000000145c4eb59 721e                           jb 0x145c4eb79
0000000145c4eb5b e964020000                     jmp 0x145c4edc4
0000000145c4eb60 f3450f105d04                   movss xmm11, dword ptr [r13 + 4]
0000000145c4eb66 4d01e7                         add r15, r12
0000000145c4eb69 498b9780000000                 mov rdx, qword ptr [r15 + 0x80]
0000000145c4eb70 4939d6                         cmp r14, rdx
0000000145c4eb73 0f834b020000                   jae 0x145c4edc4
0000000145c4eb79 498b4778                       mov rax, qword ptr [r15 + 0x78]
0000000145c4eb7d 4b8d0cb6                       lea rcx, [r14 + r14*4]
0000000145c4eb81 48c1e104                       shl rcx, 4
0000000145c4eb85 f3440f106c0830                 movss xmm13, dword ptr [rax + rcx + 0x30]
0000000145c4eb8c f3440f10250b965400             movss xmm12, dword ptr [rip + 0x54960b]
0000000145c4eb95 83be900b000001                 cmp dword ptr [rsi + 0xb90], 1
0000000145c4eb9c 410f28f4                       movaps xmm6, xmm12
0000000145c4eba0 7537                           jne 0x145c4ebd9
0000000145c4eba2 80be1c0d000000                 cmp byte ptr [rsi + 0xd1c], 0
0000000145c4eba9 410f28f4                       movaps xmm6, xmm12
0000000145c4ebad 742a                           je 0x145c4ebd9
0000000145c4ebaf f30f5cbe940b0000               subss xmm7, dword ptr [rsi + 0xb94]
0000000145c4ebb7 f30f5e3d71ad5900               divss xmm7, dword ptr [rip + 0x59ad71]
0000000145c4ebbf 0f57c0                         xorps xmm0, xmm0
0000000145c4ebc2 f30f5ff8                       maxss xmm7, xmm0
0000000145c4ebc6 f30f1005ea0aa401               movss xmm0, dword ptr [rip + 0x1a40aea]
0000000145c4ebce 0f28cf                         movaps xmm1, xmm7
0000000145c4ebd1 e805d13900                     call 0x145febcdb
0000000145c4ebd6 0f28f0                         movaps xmm6, xmm0
0000000145c4ebd9 440fb6be6f030000               movzx r15d, byte ptr [rsi + 0x36f]
0000000145c4ebe1 450fb6e7                       movzx r12d, r15b
0000000145c4ebe5 448bb604080000                 mov r14d, dword ptr [rsi + 0x804]
0000000145c4ebec 80be2a0d000001                 cmp byte ptr [rsi + 0xd2a], 1
0000000145c4ebf3 410f28fc                       movaps xmm7, xmm12
0000000145c4ebf7 755d                           jne 0x145c4ec56
0000000145c4ebf9 4889f9                         mov rcx, rdi
0000000145c4ebfc 4889da                         mov rdx, rbx
0000000145c4ebff e88cd5e4ff                     call 0x145a9c190
0000000145c4ec04 31c9                           xor ecx, ecx
0000000145c4ec06 83f803                         cmp eax, 3
0000000145c4ec09 0f92c1                         setb cl
0000000145c4ec0c 488b86280c0000                 mov rax, qword ptr [rsi + 0xc28]
0000000145c4ec13 48ffc8                         dec rax
0000000145c4ec16 780a                           js 0x145c4ec22
0000000145c4ec18 0f57ff                         xorps xmm7, xmm7
0000000145c4ec1b f3480f2af8                     cvtsi2ss xmm7, rax
0000000145c4ec20 eb18                           jmp 0x145c4ec3a
0000000145c4ec22 4889c2                         mov rdx, rax
0000000145c4ec25 48d1ea                         shr rdx, 1
0000000145c4ec28 83e001                         and eax, 1
0000000145c4ec2b 4809d0                         or rax, rdx
0000000145c4ec2e 0f57ff                         xorps xmm7, xmm7
0000000145c4ec31 f3480f2af8                     cvtsi2ss xmm7, rax
0000000145c4ec36 f30f58ff                       addss xmm7, xmm7
0000000145c4ec3a 488d05aff86b01                 lea rax, [rip + 0x16bf8af]
0000000145c4ec41 f30f593c88                     mulss xmm7, dword ptr [rax + rcx*4]
0000000145c4ec46 f30f593d020ba401               mulss xmm7, dword ptr [rip + 0x1a40b02]
0000000145c4ec4e f30f583d4a955400               addss xmm7, dword ptr [rip + 0x54954a]
0000000145c4ec56 418d47fa                       lea eax, [r15 - 6]
0000000145c4ec5a 3cfb                           cmp al, 0xfb
0000000145c4ec5c 0f92c1                         setb cl
0000000145c4ec5f 4b8d1464                       lea rdx, [r12 + r12*2]
0000000145c4ec63 c1e204                         shl edx, 4
0000000145c4ec66 488d0573b63701                 lea rax, [rip + 0x137b673]
0000000145c4ec6d 4801d0                         add rax, rdx
0000000145c4ec70 4883f830                       cmp rax, 0x30
0000000145c4ec74 0f94c2                         sete dl
0000000145c4ec77 08ca                           or dl, cl
0000000145c4ec79 7506                           jne 0x145c4ec81
0000000145c4ec7b f3440f1060f0                   movss xmm12, dword ptr [rax - 0x10]
0000000145c4ec81 488b55a8                       mov rdx, qword ptr [rbp - 0x58]
0000000145c4ec85 4885d2                         test rdx, rdx
0000000145c4ec88 7412                           je 0x145c4ec9c
0000000145c4ec8a 48c1e203                       shl rdx, 3
0000000145c4ec8e 41b804000000                   mov r8d, 4
0000000145c4ec94 4c89e9                         mov rcx, r13
0000000145c4ec97 e834353bfa                     call 0x1400021d0
0000000145c4ec9c f3440f591d279c5400             mulss xmm11, dword ptr [rip + 0x549c27]
0000000145c4eca5 f3450f59c2                     mulss xmm8, xmm10
0000000145c4ecaa f3450f59d8                     mulss xmm11, xmm8
0000000145c4ecaf f30f100de19c5400               movss xmm1, dword ptr [rip + 0x549ce1]
0000000145c4ecb7 f3410f59c9                     mulss xmm1, xmm9
0000000145c4ecbc f30f1005dc945400               movss xmm0, dword ptr [rip + 0x5494dc]
0000000145c4ecc4 f30f58c8                       addss xmm1, xmm0
0000000145c4ecc8 f30f101540d55400               movss xmm2, dword ptr [rip + 0x54d540]
0000000145c4ecd0 f3410f59d1                     mulss xmm2, xmm9
0000000145c4ecd5 f3410f59d1                     mulss xmm2, xmm9
0000000145c4ecda f30f58d1                       addss xmm2, xmm1
0000000145c4ecde f3410f59d0                     mulss xmm2, xmm8
0000000145c4ece3 f3410f59d5                     mulss xmm2, xmm13
0000000145c4ece8 f30f591520cf5500               mulss xmm2, dword ptr [rip + 0x55cf20]
0000000145c4ecf0 410f28cb                       movaps xmm1, xmm11
0000000145c4ecf4 f30f5fca                       maxss xmm1, xmm2
0000000145c4ecf8 0f28d1                         movaps xmm2, xmm1
0000000145c4ecfb f30fc2d103                     cmpunordss xmm2, xmm1
0000000145c4ed00 0f28da                         movaps xmm3, xmm2
0000000145c4ed03 0f55d9                         andnps xmm3, xmm1
0000000145c4ed06 410f54d3                       andps xmm2, xmm11
0000000145c4ed0a 0f56d3                         orps xmm2, xmm3
0000000145c4ed0d f30f59154b955400               mulss xmm2, dword ptr [rip + 0x54954b]
0000000145c4ed15 f30f59d6                       mulss xmm2, xmm6
0000000145c4ed19 31c0                           xor eax, eax
0000000145c4ed1b 4180ff02                       cmp r15b, 2
0000000145c4ed1f 0f93c0                         setae al
0000000145c4ed22 4489f1                         mov ecx, r14d
0000000145c4ed25 0f57c9                         xorps xmm1, xmm1
0000000145c4ed28 f3480f2ac9                     cvtsi2ss xmm1, rcx
0000000145c4ed2d 488d0d1c0ba401                 lea rcx, [rip + 0x1a40b1c]
0000000145c4ed34 f30f590c81                     mulss xmm1, dword ptr [rcx + rax*4]
0000000145c4ed39 f30f58c8                       addss xmm1, xmm0
0000000145c4ed3d f30f59ca                       mulss xmm1, xmm2
0000000145c4ed41 f3410f59cc                     mulss xmm1, xmm12
0000000145c4ed46 f30f59f9                       mulss xmm7, xmm1
0000000145c4ed4a 0f28c7                         movaps xmm0, xmm7
0000000145c4ed4d 0f2875d0                       movaps xmm6, xmmword ptr [rbp - 0x30]
0000000145c4ed51 0f287de0                       movaps xmm7, xmmword ptr [rbp - 0x20]
0000000145c4ed55 440f2845f0                     movaps xmm8, xmmword ptr [rbp - 0x10]
0000000145c4ed5a 440f284d00                     movaps xmm9, xmmword ptr [rbp]
0000000145c4ed5f 440f285510                     movaps xmm10, xmmword ptr [rbp + 0x10]
0000000145c4ed64 440f285d20                     movaps xmm11, xmmword ptr [rbp + 0x20]
0000000145c4ed69 440f286530                     movaps xmm12, xmmword ptr [rbp + 0x30]
0000000145c4ed6e 440f286d40                     movaps xmm13, xmmword ptr [rbp + 0x40]
0000000145c4ed73 4881c4d8000000                 add rsp, 0xd8
0000000145c4ed7a 5b                             pop rbx
0000000145c4ed7b 5f                             pop rdi
0000000145c4ed7c 5e                             pop rsi
0000000145c4ed7d 415c                           pop r12
0000000145c4ed7f 415d                           pop r13
0000000145c4ed81 415e                           pop r14
0000000145c4ed83 415f                           pop r15
0000000145c4ed85 5d                             pop rbp
0000000145c4ed86 c3                             ret
0000000145c4ed87 f3440f101d1c945400             movss xmm11, dword ptr [rip + 0x54941c]
0000000145c4ed90 f3450f59d9                     mulss xmm11, xmm9
0000000145c4ed95 f30f5f058f9b5400               maxss xmm0, dword ptr [rip + 0x549b8f]
0000000145c4ed9d f3440f5ed8                     divss xmm11, xmm0
0000000145c4eda2 f3440f581d219b5400             addss xmm11, dword ptr [rip + 0x549b21]
0000000145c4edab f3450f595d04                   mulss xmm11, dword ptr [r13 + 4]
0000000145c4edb1 4d01e7                         add r15, r12
0000000145c4edb4 498b9780000000                 mov rdx, qword ptr [r15 + 0x80]
0000000145c4edbb 4939d6                         cmp r14, rdx
0000000145c4edbe 0f82b5fdffff                   jb 0x145c4eb79
0000000145c4edc4 4c896dc0                       mov qword ptr [rbp - 0x40], r13
0000000145c4edc8 4c8d05e93ba401                 lea r8, [rip + 0x1a43be9]
0000000145c4edcf 4c89f1                         mov rcx, r14
0000000145c4edd2 e87c565400                     call 0x146194453
0000000145c4edd7 90                             nop
0000000145c4edd8 eb27                           jmp 0x145c4ee01
0000000145c4edda 4c896dc0                       mov qword ptr [rbp - 0x40], r13
0000000145c4edde 4c8d05a33ba401                 lea r8, [rip + 0x1a43ba3]
0000000145c4ede5 4889c1                         mov rcx, rax
0000000145c4ede8 e866565400                     call 0x146194453
0000000145c4eded 90                             nop
0000000145c4edee eb11                           jmp 0x145c4ee01
0000000145c4edf0 4c896dc0                       mov qword ptr [rbp - 0x40], r13
0000000145c4edf4 4c8d05a53ba401                 lea r8, [rip + 0x1a43ba5]
0000000145c4edfb e853565400                     call 0x146194453
0000000145c4ee00 90                             nop
0000000145c4ee01 0f0b                           ud2
0000000145c4ee03 666666662e0f1f840000000000     nop word ptr cs:[rax + rax]
0000000145c4ee10 4889542410                     mov qword ptr [rsp + 0x10], rdx
0000000145c4ee15 55                             push rbp
0000000145c4ee16 4157                           push r15
0000000145c4ee18 4156                           push r14
0000000145c4ee1a 4155                           push r13
0000000145c4ee1c 4154                           push r12
0000000145c4ee1e 56                             push rsi
0000000145c4ee1f 57                             push rdi
0000000145c4ee20 53                             push rbx
0000000145c4ee21 4881eca8000000                 sub rsp, 0xa8
0000000145c4ee28 488daa80000000                 lea rbp, [rdx + 0x80]
0000000145c4ee2f 440f296c2420                   movaps xmmword ptr [rsp + 0x20], xmm13
0000000145c4ee35 440f29642430                   movaps xmmword ptr [rsp + 0x30], xmm12
0000000145c4ee3b 440f295c2440                   movaps xmmword ptr [rsp + 0x40], xmm11
0000000145c4ee41 440f29542450                   movaps xmmword ptr [rsp + 0x50], xmm10
0000000145c4ee47 440f294c2460                   movaps xmmword ptr [rsp + 0x60], xmm9
0000000145c4ee4d 440f29442470                   movaps xmmword ptr [rsp + 0x70], xmm8
0000000145c4ee53 0f29bc2480000000               movaps xmmword ptr [rsp + 0x80], xmm7
0000000145c4ee5b 0f29b42490000000               movaps xmmword ptr [rsp + 0x90], xmm6
0000000145c4ee63 488b55a8                       mov rdx, qword ptr [rbp - 0x58]
0000000145c4ee67 4885d2                         test rdx, rdx
0000000145c4ee6a 7413                           je 0x145c4ee7f
0000000145c4ee6c 48c1e203                       shl rdx, 3
0000000145c4ee70 41b804000000                   mov r8d, 4
0000000145c4ee76 488b4dc0                       mov rcx, qword ptr [rbp - 0x40]
0000000145c4ee7a e851333bfa                     call 0x1400021d0
0000000145c4ee7f 0f28b42490000000               movaps xmm6, xmmword ptr [rsp + 0x90]
0000000145c4ee87 0f28bc2480000000               movaps xmm7, xmmword ptr [rsp + 0x80]
0000000145c4ee8f 440f28442470                   movaps xmm8, xmmword ptr [rsp + 0x70]
0000000145c4ee95 440f284c2460                   movaps xmm9, xmmword ptr [rsp + 0x60]
0000000145c4ee9b 440f28542450                   movaps xmm10, xmmword ptr [rsp + 0x50]
0000000145c4eea1 440f285c2440                   movaps xmm11, xmmword ptr [rsp + 0x40]
0000000145c4eea7 440f28642430                   movaps xmm12, xmmword ptr [rsp + 0x30]
0000000145c4eead 440f286c2420                   movaps xmm13, xmmword ptr [rsp + 0x20]
0000000145c4eeb3 4881c4a8000000                 add rsp, 0xa8
0000000145c4eeba 5b                             pop rbx
0000000145c4eebb 5f                             pop rdi
0000000145c4eebc 5e                             pop rsi
0000000145c4eebd 415c                           pop r12
0000000145c4eebf 415d                           pop r13
0000000145c4eec1 415e                           pop r14
0000000145c4eec3 415f                           pop r15
0000000145c4eec5 5d                             pop rbp
0000000145c4eec6 c3                             ret
0000000145c4eec7 cc                             int3
0000000145c4eec8 cc                             int3
0000000145c4eec9 cc                             int3
0000000145c4eeca cc                             int3
0000000145c4eecb cc                             int3
0000000145c4eecc cc                             int3
0000000145c4eecd cc                             int3
0000000145c4eece cc                             int3
0000000145c4eecf cc                             int3
0000000145c4eed0 56                             push rsi
0000000145c4eed1 57                             push rdi
0000000145c4eed2 4883ec78                       sub rsp, 0x78
0000000145c4eed6 440f29542460                   movaps xmmword ptr [rsp + 0x60], xmm10
0000000145c4eedc 440f294c2450                   movaps xmmword ptr [rsp + 0x50], xmm9
0000000145c4eee2 440f29442440                   movaps xmmword ptr [rsp + 0x40], xmm8
0000000145c4eee8 0f297c2430                     movaps xmmword ptr [rsp + 0x30], xmm7
0000000145c4eeed 0f29742420                     movaps xmmword ptr [rsp + 0x20], xmm6
0000000145c4eef2 4889d7                         mov rdi, rdx
0000000145c4eef5 4889ce                         mov rsi, rcx
0000000145c4eef8 488b89d0020000                 mov rcx, qword ptr [rcx + 0x2d0]
0000000145c4eeff 488b96d8020000                 mov rdx, qword ptr [rsi + 0x2d8]
0000000145c4ef06 e885d2e4ff                     call 0x145a9c190
0000000145c4ef0b 4869c8f0000000                 imul rcx, rax, 0xf0
0000000145c4ef12 488d0537f33601                 lea rax, [rip + 0x136f337]
0000000145c4ef19 488b940180000000               mov rdx, qword ptr [rcx + rax + 0x80]
0000000145c4ef21 4839d7                         cmp rdi, rdx
0000000145c4ef24 0f8354010000                   jae 0x145c4f07e
0000000145c4ef2a 4801c8                         add rax, rcx
0000000145c4ef2d 488b4878                       mov rcx, qword ptr [rax + 0x78]
0000000145c4ef31 488d14bf                       lea rdx, [rdi + rdi*4]
0000000145c4ef35 48c1e204                       shl rdx, 4
0000000145c4ef39 f30f10741134                   movss xmm6, dword ptr [rcx + rdx + 0x34]
0000000145c4ef3f f3440f1096740c0000             movss xmm10, dword ptr [rsi + 0xc74]
0000000145c4ef48 f3440f1080e0000000             movss xmm8, dword ptr [rax + 0xe0]
0000000145c4ef51 f3440f108ef80c0000             movss xmm9, dword ptr [rsi + 0xcf8]
0000000145c4ef5a f30f103d3e925400               movss xmm7, dword ptr [rip + 0x54923e]
0000000145c4ef62 83be900b000001                 cmp dword ptr [rsi + 0xb90], 1
0000000145c4ef69 0f28c7                         movaps xmm0, xmm7
0000000145c4ef6c 7534                           jne 0x145c4efa2
0000000145c4ef6e 80be1c0d000000                 cmp byte ptr [rsi + 0xd1c], 0
0000000145c4ef75 0f28c7                         movaps xmm0, xmm7
0000000145c4ef78 7428                           je 0x145c4efa2
0000000145c4ef7a 410f28ca                       movaps xmm1, xmm10
0000000145c4ef7e f30f5c8e940b0000               subss xmm1, dword ptr [rsi + 0xb94]
0000000145c4ef86 f30f5e0da2a95900               divss xmm1, dword ptr [rip + 0x59a9a2]
0000000145c4ef8e 0f57c0                         xorps xmm0, xmm0
0000000145c4ef91 f30f5fc8                       maxss xmm1, xmm0
0000000145c4ef95 f30f10052307a401               movss xmm0, dword ptr [rip + 0x1a40723]
0000000145c4ef9d e839cd3900                     call 0x145febcdb
0000000145c4efa2 0fb68e6f030000                 movzx ecx, byte ptr [rsi + 0x36f]
0000000145c4efa9 8b8604080000                   mov eax, dword ptr [rsi + 0x804]
0000000145c4efaf 8d51fa                         lea edx, [rcx - 6]
0000000145c4efb2 80fafb                         cmp dl, 0xfb
0000000145c4efb5 410f92c0                       setb r8b
0000000145c4efb9 4c8d0c49                       lea r9, [rcx + rcx*2]
0000000145c4efbd 41c1e104                       shl r9d, 4
0000000145c4efc1 488d1518b33701                 lea rdx, [rip + 0x137b318]
0000000145c4efc8 4c01ca                         add rdx, r9
0000000145c4efcb 4883fa30                       cmp rdx, 0x30
0000000145c4efcf 410f94c1                       sete r9b
0000000145c4efd3 4508c1                         or r9b, r8b
0000000145c4efd6 0f28cf                         movaps xmm1, xmm7
0000000145c4efd9 7505                           jne 0x145c4efe0
0000000145c4efdb f30f104af4                     movss xmm1, dword ptr [rdx - 0xc]
0000000145c4efe0 f3440f5e1547a95900             divss xmm10, dword ptr [rip + 0x59a947]
0000000145c4efe9 f30f1015d7945400               movss xmm2, dword ptr [rip + 0x5494d7]
0000000145c4eff1 f3410f59d2                     mulss xmm2, xmm10
0000000145c4eff6 f30f58d7                       addss xmm2, xmm7
0000000145c4effa f30f101d5608a401               movss xmm3, dword ptr [rip + 0x1a40856]
0000000145c4f002 f3410f59da                     mulss xmm3, xmm10
0000000145c4f007 f3410f59da                     mulss xmm3, xmm10
0000000145c4f00c f30f58da                       addss xmm3, xmm2
0000000145c4f010 f3450f59c1                     mulss xmm8, xmm9
0000000145c4f015 0f57d2                         xorps xmm2, xmm2
0000000145c4f018 f3410f51d0                     sqrtss xmm2, xmm8
0000000145c4f01d f30f59d3                       mulss xmm2, xmm3
0000000145c4f021 f30f59f2                       mulss xmm6, xmm2
0000000145c4f025 f30f5935d7975400               mulss xmm6, dword ptr [rip + 0x5497d7]
0000000145c4f02d f30f59f0                       mulss xmm6, xmm0
0000000145c4f031 31d2                           xor edx, edx
0000000145c4f033 80f902                         cmp cl, 2
0000000145c4f036 89c0                           mov eax, eax
0000000145c4f038 0f57c0                         xorps xmm0, xmm0
0000000145c4f03b f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145c4f040 0f93c2                         setae dl
0000000145c4f043 488d051608a401                 lea rax, [rip + 0x1a40816]
0000000145c4f04a f30f590490                     mulss xmm0, dword ptr [rax + rdx*4]
0000000145c4f04f f30f58c7                       addss xmm0, xmm7
0000000145c4f053 f30f59c6                       mulss xmm0, xmm6
0000000145c4f057 f30f59c1                       mulss xmm0, xmm1
0000000145c4f05b 0f28742420                     movaps xmm6, xmmword ptr [rsp + 0x20]
0000000145c4f060 0f287c2430                     movaps xmm7, xmmword ptr [rsp + 0x30]
0000000145c4f065 440f28442440                   movaps xmm8, xmmword ptr [rsp + 0x40]
0000000145c4f06b 440f284c2450                   movaps xmm9, xmmword ptr [rsp + 0x50]
0000000145c4f071 440f28542460                   movaps xmm10, xmmword ptr [rsp + 0x60]
0000000145c4f077 4883c478                       add rsp, 0x78
0000000145c4f07b 5f                             pop rdi
0000000145c4f07c 5e                             pop rsi
0000000145c4f07d c3                             ret
0000000145c4f07e 4c8d056339a401                 lea r8, [rip + 0x1a43963]
0000000145c4f085 4889f9                         mov rcx, rdi
0000000145c4f088 e8c6535400                     call 0x146194453
0000000145c4f08d 0f0b                           ud2
