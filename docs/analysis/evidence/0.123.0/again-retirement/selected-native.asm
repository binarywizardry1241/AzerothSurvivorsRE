; guid-collector
0000000145b1dd80 55                               push rbp
0000000145b1dd81 4157                             push r15
0000000145b1dd83 4156                             push r14
0000000145b1dd85 4155                             push r13
0000000145b1dd87 4154                             push r12
0000000145b1dd89 56                               push rsi
0000000145b1dd8a 57                               push rdi
0000000145b1dd8b 53                               push rbx
0000000145b1dd8c 4881ec88000000                   sub rsp, 0x88
0000000145b1dd93 488dac2480000000                 lea rbp, [rsp + 0x80]
0000000145b1dd9b 48c74500feffffff                 mov qword ptr [rbp], 0xfffffffffffffffe
0000000145b1dda3 4889d7                           mov rdi, rdx
0000000145b1dda6 4889ce                           mov rsi, rcx
0000000145b1dda9 488b9ac0050000                   mov rbx, qword ptr [rdx + 0x5c0]
0000000145b1ddb0 4885db                           test rbx, rbx
0000000145b1ddb3 7439                             je 0x145b1ddee
0000000145b1ddb5 4c8bbfb8050000                   mov r15, qword ptr [rdi + 0x5b8]
0000000145b1ddbc 4c8d34dd00000000                 lea r14, [rbx*8]
0000000145b1ddc4 e837444efa                       call 0x140002200
0000000145b1ddc9 ba08000000                       mov edx, 8
0000000145b1ddce 4c89f1                           mov rcx, r14
0000000145b1ddd1 e8ea434efa                       call 0x1400021c0
0000000145b1ddd6 4885c0                           test rax, rax
0000000145b1ddd9 0f84580c0000                     je 0x145b1ea37
0000000145b1dddf 89d9                             mov ecx, ebx
0000000145b1dde1 83e103                           and ecx, 3
0000000145b1dde4 4883fb04                         cmp rbx, 4
0000000145b1dde8 730e                             jae 0x145b1ddf8
0000000145b1ddea 31d2                             xor edx, edx
0000000145b1ddec eb62                             jmp 0x145b1de50
0000000145b1ddee b808000000                       mov eax, 8
0000000145b1ddf3 e98e000000                       jmp 0x145b1de86
0000000145b1ddf8 4989d8                           mov r8, rbx
0000000145b1ddfb 4983e0fc                         and r8, 0xfffffffffffffffc
0000000145b1ddff 4d8d8f90060000                   lea r9, [r15 + 0x690]
0000000145b1de06 31d2                             xor edx, edx
0000000145b1de08 0f1f840000000000                 nop dword ptr [rax + rax]
0000000145b1de10 4d8b9160faffff                   mov r10, qword ptr [r9 - 0x5a0]
0000000145b1de17 4c8914d0                         mov qword ptr [rax + rdx*8], r10
0000000145b1de1b 4d8b9140fcffff                   mov r10, qword ptr [r9 - 0x3c0]
0000000145b1de22 4c8954d008                       mov qword ptr [rax + rdx*8 + 8], r10
0000000145b1de27 4d8b9120feffff                   mov r10, qword ptr [r9 - 0x1e0]
0000000145b1de2e 4c8954d010                       mov qword ptr [rax + rdx*8 + 0x10], r10
0000000145b1de33 4d8b11                           mov r10, qword ptr [r9]
0000000145b1de36 4c8954d018                       mov qword ptr [rax + rdx*8 + 0x18], r10
0000000145b1de3b 4883c204                         add rdx, 4
0000000145b1de3f 4981c180070000                   add r9, 0x780
0000000145b1de46 4939d0                           cmp r8, rdx
0000000145b1de49 75c5                             jne 0x145b1de10
0000000145b1de4b 4885c9                           test rcx, rcx
0000000145b1de4e 7436                             je 0x145b1de86
0000000145b1de50 4c8d04d0                         lea r8, [rax + rdx*8]
0000000145b1de54 4869d2e0010000                   imul rdx, rdx, 0x1e0
0000000145b1de5b 4c01fa                           add rdx, r15
0000000145b1de5e 4881c2f0000000                   add rdx, 0xf0
0000000145b1de65 4531c9                           xor r9d, r9d
0000000145b1de68 0f1f840000000000                 nop dword ptr [rax + rax]
0000000145b1de70 4c8b12                           mov r10, qword ptr [rdx]
0000000145b1de73 4f8914c8                         mov qword ptr [r8 + r9*8], r10
0000000145b1de77 49ffc1                           inc r9
0000000145b1de7a 4881c2e0010000                   add rdx, 0x1e0
0000000145b1de81 4c39c9                           cmp rcx, r9
0000000145b1de84 75ea                             jne 0x145b1de70
0000000145b1de86 48895de8                         mov qword ptr [rbp - 0x18], rbx
0000000145b1de8a 488945f0                         mov qword ptr [rbp - 0x10], rax
0000000145b1de8e 48895df8                         mov qword ptr [rbp - 8], rbx
0000000145b1de92 4c8bbf60060000                   mov r15, qword ptr [rdi + 0x660]
0000000145b1de99 4c8bb768060000                   mov r14, qword ptr [rdi + 0x668]
0000000145b1dea0 4f8d24f6                         lea r12, [r14 + r14*8]
0000000145b1dea4 4d85f6                           test r14, r14
0000000145b1dea7 0f85d1080000                     jne 0x145b1e77e
0000000145b1dead 4b8d04e7                         lea rax, [r15 + r12*8]
0000000145b1deb1 48895df8                         mov qword ptr [rbp - 8], rbx
0000000145b1deb5 4c897da8                         mov qword ptr [rbp - 0x58], r15
0000000145b1deb9 488945b0                         mov qword ptr [rbp - 0x50], rax
0000000145b1debd 48c745b800000000                 mov qword ptr [rbp - 0x48], 0
0000000145b1dec5 48c745c800000000                 mov qword ptr [rbp - 0x38], 0
0000000145b1decd 488d4de8                         lea rcx, [rbp - 0x18]
0000000145b1ded1 488d55a8                         lea rdx, [rbp - 0x58]
0000000145b1ded5 e8c6e71600                       call 0x145c8c6a0
0000000145b1deda 90                               nop 
0000000145b1dedb 4c8bbfd0050000                   mov r15, qword ptr [rdi + 0x5d0]
0000000145b1dee2 4c6ba7d805000058                 imul r12, qword ptr [rdi + 0x5d8], 0x58
0000000145b1deea 4d01fc                           add r12, r15
0000000145b1deed 488d5de8                         lea rbx, [rbp - 0x18]
0000000145b1def1 eb1c                             jmp 0x145b1df0f
0000000145b1def3 666666662e0f1f840000000000       nop word ptr cs:[rax + rax]
0000000145b1df00 488b45f0                         mov rax, qword ptr [rbp - 0x10]
0000000145b1df04 4e892cf0                         mov qword ptr [rax + r14*8], r13
0000000145b1df08 49ffc6                           inc r14
0000000145b1df0b 4c8975f8                         mov qword ptr [rbp - 8], r14
0000000145b1df0f 4d39e7                           cmp r15, r12
0000000145b1df12 743a                             je 0x145b1df4e
0000000145b1df14 4d8b6f18                         mov r13, qword ptr [r15 + 0x18]
0000000145b1df18 4983c758                         add r15, 0x58
0000000145b1df1c 4d85ed                           test r13, r13
0000000145b1df1f 74ee                             je 0x145b1df0f
0000000145b1df21 4c8b75f8                         mov r14, qword ptr [rbp - 8]
0000000145b1df25 4c3b75e8                         cmp r14, qword ptr [rbp - 0x18]
0000000145b1df29 75d5                             jne 0x145b1df00
0000000145b1df2b 48c744242008000000               mov qword ptr [rsp + 0x20], 8
0000000145b1df34 41b801000000                     mov r8d, 1
0000000145b1df3a 41b908000000                     mov r9d, 8
0000000145b1df40 4889d9                           mov rcx, rbx
0000000145b1df43 4c89f2                           mov rdx, r14
0000000145b1df46 e8a57e4e00                       call 0x146005df0
0000000145b1df4b 90                               nop 
0000000145b1df4c ebb2                             jmp 0x145b1df00
0000000145b1df4e 4c8bbf48060000                   mov r15, qword ptr [rdi + 0x648]
0000000145b1df55 4c8bb750060000                   mov r14, qword ptr [rdi + 0x650]
0000000145b1df5c 488b45e8                         mov rax, qword ptr [rbp - 0x18]
0000000145b1df60 488b5df8                         mov rbx, qword ptr [rbp - 8]
0000000145b1df64 4829d8                           sub rax, rbx
0000000145b1df67 4939c6                           cmp r14, rax
0000000145b1df6a 0f87ae080000                     ja 0x145b1e81e
0000000145b1df70 4d85f6                           test r14, r14
0000000145b1df73 0f845e010000                     je 0x145b1e0d7
0000000145b1df79 488b45f0                         mov rax, qword ptr [rbp - 0x10]
0000000145b1df7d 4983fe12                         cmp r14, 0x12
0000000145b1df81 722d                             jb 0x145b1dfb0
0000000145b1df83 488d0cd8                         lea rcx, [rax + rbx*8]
0000000145b1df87 496bd678                         imul rdx, r14, 0x78
0000000145b1df8b 4c01fa                           add rdx, r15
0000000145b1df8e 4883c2e8                         add rdx, -0x18
0000000145b1df92 4839d1                           cmp rcx, rdx
0000000145b1df95 0f83d0000000                     jae 0x145b1e06b
0000000145b1df9b 4a8d0c33                         lea rcx, [rbx + r14]
0000000145b1df9f 488d0cc8                         lea rcx, [rax + rcx*8]
0000000145b1dfa3 498d5758                         lea rdx, [r15 + 0x58]
0000000145b1dfa7 4839ca                           cmp rdx, rcx
0000000145b1dfaa 0f83bb000000                     jae 0x145b1e06b
0000000145b1dfb0 31c9                             xor ecx, ecx
0000000145b1dfb2 4c89f2                           mov rdx, r14
0000000145b1dfb5 4883e203                         and rdx, 3
0000000145b1dfb9 7452                             je 0x145b1e00d
0000000145b1dfbb 4c8d04d8                         lea r8, [rax + rbx*8]
0000000145b1dfbf 4c6bc978                         imul r9, rcx, 0x78
0000000145b1dfc3 4f8d1439                         lea r10, [r9 + r15]
0000000145b1dfc7 4983c258                         add r10, 0x58
0000000145b1dfcb 48f7da                           neg rdx
0000000145b1dfce 4531c9                           xor r9d, r9d
0000000145b1dfd1 6666666666662e0f1f840000000000   nop word ptr cs:[rax + rax]
0000000145b1dfe0 4d8b1a                           mov r11, qword ptr [r10]
0000000145b1dfe3 4d8918                           mov qword ptr [r8], r11
0000000145b1dfe6 49ffc9                           dec r9
0000000145b1dfe9 4983c008                         add r8, 8
0000000145b1dfed 4983c278                         add r10, 0x78
0000000145b1dff1 4c39ca                           cmp rdx, r9
0000000145b1dff4 75ea                             jne 0x145b1dfe0
0000000145b1dff6 4c29cb                           sub rbx, r9
0000000145b1dff9 4889ca                           mov rdx, rcx
0000000145b1dffc 4c29ca                           sub rdx, r9
0000000145b1dfff 4c29f1                           sub rcx, r14
0000000145b1e002 4883f9fc                         cmp rcx, -4
0000000145b1e006 7615                             jbe 0x145b1e01d
0000000145b1e008 e9ca000000                       jmp 0x145b1e0d7
0000000145b1e00d 4889ca                           mov rdx, rcx
0000000145b1e010 4c29f1                           sub rcx, r14
0000000145b1e013 4883f9fc                         cmp rcx, -4
0000000145b1e017 0f87ba000000                     ja 0x145b1e0d7
0000000145b1e01d 486bca78                         imul rcx, rdx, 0x78
0000000145b1e021 4c01f9                           add rcx, r15
0000000145b1e024 4881c1c0010000                   add rcx, 0x1c0
0000000145b1e02b 4929d6                           sub r14, rdx
0000000145b1e02e 6690                             nop 
0000000145b1e030 488b9198feffff                   mov rdx, qword ptr [rcx - 0x168]
0000000145b1e037 488914d8                         mov qword ptr [rax + rbx*8], rdx
0000000145b1e03b 488b9110ffffff                   mov rdx, qword ptr [rcx - 0xf0]
0000000145b1e042 488954d808                       mov qword ptr [rax + rbx*8 + 8], rdx
0000000145b1e047 488b5188                         mov rdx, qword ptr [rcx - 0x78]
0000000145b1e04b 488954d810                       mov qword ptr [rax + rbx*8 + 0x10], rdx
0000000145b1e050 488b11                           mov rdx, qword ptr [rcx]
0000000145b1e053 488954d818                       mov qword ptr [rax + rbx*8 + 0x18], rdx
0000000145b1e058 4883c304                         add rbx, 4
0000000145b1e05c 4881c1e0010000                   add rcx, 0x1e0
0000000145b1e063 4983c6fc                         add r14, -4
0000000145b1e067 75c7                             jne 0x145b1e030
0000000145b1e069 eb6c                             jmp 0x145b1e0d7
0000000145b1e06b 488d14dd00000000                 lea rdx, [rbx*8]
0000000145b1e073 4c89f1                           mov rcx, r14
0000000145b1e076 4883e1fc                         and rcx, 0xfffffffffffffffc
0000000145b1e07a 4801cb                           add rbx, rcx
0000000145b1e07d 4801c2                           add rdx, rax
0000000145b1e080 4883c210                         add rdx, 0x10
0000000145b1e084 4d8d87c0010000                   lea r8, [r15 + 0x1c0]
0000000145b1e08b 4531c9                           xor r9d, r9d
0000000145b1e08e 6690                             nop 
0000000145b1e090 f2410f108010ffffff               movsd xmm0, qword ptr [r8 - 0xf0]
0000000145b1e099 f2410f108898feffff               movsd xmm1, qword ptr [r8 - 0x168]
0000000145b1e0a2 0f16c8                           movlhps xmm1, xmm0
0000000145b1e0a5 f2410f1000                       movsd xmm0, qword ptr [r8]
0000000145b1e0aa f2410f105088                     movsd xmm2, qword ptr [r8 - 0x78]
0000000145b1e0b0 0f16d0                           movlhps xmm2, xmm0
0000000145b1e0b3 420f114ccaf0                     movups xmmword ptr [rdx + r9*8 - 0x10], xmm1
0000000145b1e0b9 420f1114ca                       movups xmmword ptr [rdx + r9*8], xmm2
0000000145b1e0be 4983c104                         add r9, 4
0000000145b1e0c2 4981c0e0010000                   add r8, 0x1e0
0000000145b1e0c9 4c39c9                           cmp rcx, r9
0000000145b1e0cc 75c2                             jne 0x145b1e090
0000000145b1e0ce 4939ce                           cmp r14, rcx
0000000145b1e0d1 0f85dbfeffff                     jne 0x145b1dfb2
0000000145b1e0d7 48895df8                         mov qword ptr [rbp - 8], rbx
0000000145b1e0db 4c8bbfd0000000                   mov r15, qword ptr [rdi + 0xd0]
0000000145b1e0e2 4c8bb7d8000000                   mov r14, qword ptr [rdi + 0xd8]
0000000145b1e0e9 488b45e8                         mov rax, qword ptr [rbp - 0x18]
0000000145b1e0ed 4829d8                           sub rax, rbx
0000000145b1e0f0 4939c6                           cmp r14, rax
0000000145b1e0f3 0f875b070000                     ja 0x145b1e854
0000000145b1e0f9 4d85f6                           test r14, r14
0000000145b1e0fc 0f8455010000                     je 0x145b1e257
0000000145b1e102 488b45f0                         mov rax, qword ptr [rbp - 0x10]
0000000145b1e106 4983fe10                         cmp r14, 0x10
0000000145b1e10a 7230                             jb 0x145b1e13c
0000000145b1e10c 488d0cd8                         lea rcx, [rax + rbx*8]
0000000145b1e110 4c89f2                           mov rdx, r14
0000000145b1e113 48c1e207                         shl rdx, 7
0000000145b1e117 4c01fa                           add rdx, r15
0000000145b1e11a 4883c2a8                         add rdx, -0x58
0000000145b1e11e 4839d1                           cmp rcx, rdx
0000000145b1e121 0f83c4000000                     jae 0x145b1e1eb
0000000145b1e127 4a8d0c33                         lea rcx, [rbx + r14]
0000000145b1e12b 488d0cc8                         lea rcx, [rax + rcx*8]
0000000145b1e12f 498d5720                         lea rdx, [r15 + 0x20]
0000000145b1e133 4839ca                           cmp rdx, rcx
0000000145b1e136 0f83af000000                     jae 0x145b1e1eb
0000000145b1e13c 31c9                             xor ecx, ecx
0000000145b1e13e 4c89f2                           mov rdx, r14
0000000145b1e141 4883e203                         and rdx, 3
0000000145b1e145 7446                             je 0x145b1e18d
0000000145b1e147 4c8d04d8                         lea r8, [rax + rbx*8]
0000000145b1e14b 4989c9                           mov r9, rcx
0000000145b1e14e 49c1e107                         shl r9, 7
0000000145b1e152 4f8d1439                         lea r10, [r9 + r15]
0000000145b1e156 4983c220                         add r10, 0x20
0000000145b1e15a 48f7da                           neg rdx
0000000145b1e15d 4531c9                           xor r9d, r9d
0000000145b1e160 4d8b1a                           mov r11, qword ptr [r10]
0000000145b1e163 4d8918                           mov qword ptr [r8], r11
0000000145b1e166 49ffc9                           dec r9
0000000145b1e169 4983c008                         add r8, 8
0000000145b1e16d 4983ea80                         sub r10, -0x80
0000000145b1e171 4c39ca                           cmp rdx, r9
0000000145b1e174 75ea                             jne 0x145b1e160
0000000145b1e176 4c29cb                           sub rbx, r9
0000000145b1e179 4889ca                           mov rdx, rcx
0000000145b1e17c 4c29ca                           sub rdx, r9
0000000145b1e17f 4c29f1                           sub rcx, r14
0000000145b1e182 4883f9fc                         cmp rcx, -4
0000000145b1e186 7615                             jbe 0x145b1e19d
0000000145b1e188 e9ca000000                       jmp 0x145b1e257
0000000145b1e18d 4889ca                           mov rdx, rcx
0000000145b1e190 4c29f1                           sub rcx, r14
0000000145b1e193 4883f9fc                         cmp rcx, -4
0000000145b1e197 0f87ba000000                     ja 0x145b1e257
0000000145b1e19d 4929d6                           sub r14, rdx
0000000145b1e1a0 48c1e207                         shl rdx, 7
0000000145b1e1a4 4a8d0c3a                         lea rcx, [rdx + r15]
0000000145b1e1a8 4881c1a0010000                   add rcx, 0x1a0
0000000145b1e1af 90                               nop 
0000000145b1e1b0 488b9180feffff                   mov rdx, qword ptr [rcx - 0x180]
0000000145b1e1b7 488914d8                         mov qword ptr [rax + rbx*8], rdx
0000000145b1e1bb 488b9100ffffff                   mov rdx, qword ptr [rcx - 0x100]
0000000145b1e1c2 488954d808                       mov qword ptr [rax + rbx*8 + 8], rdx
0000000145b1e1c7 488b5180                         mov rdx, qword ptr [rcx - 0x80]
0000000145b1e1cb 488954d810                       mov qword ptr [rax + rbx*8 + 0x10], rdx
0000000145b1e1d0 488b11                           mov rdx, qword ptr [rcx]
0000000145b1e1d3 488954d818                       mov qword ptr [rax + rbx*8 + 0x18], rdx
0000000145b1e1d8 4883c304                         add rbx, 4
0000000145b1e1dc 4881c100020000                   add rcx, 0x200
0000000145b1e1e3 4983c6fc                         add r14, -4
0000000145b1e1e7 75c7                             jne 0x145b1e1b0
0000000145b1e1e9 eb6c                             jmp 0x145b1e257
0000000145b1e1eb 488d14dd00000000                 lea rdx, [rbx*8]
0000000145b1e1f3 4c89f1                           mov rcx, r14
0000000145b1e1f6 4883e1fc                         and rcx, 0xfffffffffffffffc
0000000145b1e1fa 4801cb                           add rbx, rcx
0000000145b1e1fd 4801c2                           add rdx, rax
0000000145b1e200 4883c210                         add rdx, 0x10
0000000145b1e204 4d8d87a0010000                   lea r8, [r15 + 0x1a0]
0000000145b1e20b 4531c9                           xor r9d, r9d
0000000145b1e20e 6690                             nop 
0000000145b1e210 f2410f108000ffffff               movsd xmm0, qword ptr [r8 - 0x100]
0000000145b1e219 f2410f108880feffff               movsd xmm1, qword ptr [r8 - 0x180]
0000000145b1e222 0f16c8                           movlhps xmm1, xmm0
0000000145b1e225 f2410f1000                       movsd xmm0, qword ptr [r8]
0000000145b1e22a f2410f105080                     movsd xmm2, qword ptr [r8 - 0x80]
0000000145b1e230 0f16d0                           movlhps xmm2, xmm0
0000000145b1e233 420f114ccaf0                     movups xmmword ptr [rdx + r9*8 - 0x10], xmm1
0000000145b1e239 420f1114ca                       movups xmmword ptr [rdx + r9*8], xmm2
0000000145b1e23e 4983c104                         add r9, 4
0000000145b1e242 4981c000020000                   add r8, 0x200
0000000145b1e249 4c39c9                           cmp rcx, r9
0000000145b1e24c 75c2                             jne 0x145b1e210
0000000145b1e24e 4939ce                           cmp r14, rcx
0000000145b1e251 0f85e7feffff                     jne 0x145b1e13e
0000000145b1e257 48895df8                         mov qword ptr [rbp - 8], rbx
0000000145b1e25b 4c8bb760090000                   mov r14, qword ptr [rdi + 0x960]
0000000145b1e262 4e8d3cf500000000                 lea r15, [r14*8]
0000000145b1e26a 4d85f6                           test r14, r14
0000000145b1e26d 7435                             je 0x145b1e2a4
0000000145b1e26f 488b9f58090000                   mov rbx, qword ptr [rdi + 0x958]
0000000145b1e276 e8853f4efa                       call 0x140002200
0000000145b1e27b ba08000000                       mov edx, 8
0000000145b1e280 4c89f9                           mov rcx, r15
0000000145b1e283 e8383f4efa                       call 0x1400021c0
0000000145b1e288 4885c0                           test rax, rax
0000000145b1e28b 0f84b5070000                     je 0x145b1ea46
0000000145b1e291 4989c4                           mov r12, rax
0000000145b1e294 4489f0                           mov eax, r14d
0000000145b1e297 83e003                           and eax, 3
0000000145b1e29a 4983fe04                         cmp r14, 4
0000000145b1e29e 731f                             jae 0x145b1e2bf
0000000145b1e2a0 31c9                             xor ecx, ecx
0000000145b1e2a2 eb60                             jmp 0x145b1e304
0000000145b1e2a4 41bc08000000                     mov r12d, 8
0000000145b1e2aa 4c01f3                           add rbx, r14
0000000145b1e2ad 48895df8                         mov qword ptr [rbp - 8], rbx
0000000145b1e2b1 4d85f6                           test r14, r14
0000000145b1e2b4 0f85ae000000                     jne 0x145b1e368
0000000145b1e2ba e9be000000                       jmp 0x145b1e37d
0000000145b1e2bf 4c89f2                           mov rdx, r14
0000000145b1e2c2 4883e2fc                         and rdx, 0xfffffffffffffffc
0000000145b1e2c6 4c8d4360                         lea r8, [rbx + 0x60]
0000000145b1e2ca 31c9                             xor ecx, ecx
0000000145b1e2cc 0f1f4000                         nop dword ptr [rax]
0000000145b1e2d0 4d8b48a0                         mov r9, qword ptr [r8 - 0x60]
0000000145b1e2d4 4d890ccc                         mov qword ptr [r12 + rcx*8], r9
0000000145b1e2d8 4d8b48c0                         mov r9, qword ptr [r8 - 0x40]
0000000145b1e2dc 4d894ccc08                       mov qword ptr [r12 + rcx*8 + 8], r9
0000000145b1e2e1 4d8b48e0                         mov r9, qword ptr [r8 - 0x20]
0000000145b1e2e5 4d894ccc10                       mov qword ptr [r12 + rcx*8 + 0x10], r9
0000000145b1e2ea 4d8b08                           mov r9, qword ptr [r8]
0000000145b1e2ed 4d894ccc18                       mov qword ptr [r12 + rcx*8 + 0x18], r9
0000000145b1e2f2 4883c104                         add rcx, 4
0000000145b1e2f6 4983e880                         sub r8, -0x80
0000000145b1e2fa 4839ca                           cmp rdx, rcx
0000000145b1e2fd 75d1                             jne 0x145b1e2d0
0000000145b1e2ff 4885c0                           test rax, rax
0000000145b1e302 742d                             je 0x145b1e331
0000000145b1e304 498d14cc                         lea rdx, [r12 + rcx*8]
0000000145b1e308 48c1e105                         shl rcx, 5
0000000145b1e30c 4801cb                           add rbx, rcx
0000000145b1e30f c1e003                           shl eax, 3
0000000145b1e312 31c9                             xor ecx, ecx
0000000145b1e314 6666662e0f1f840000000000         nop word ptr cs:[rax + rax]
0000000145b1e320 4c8b048b                         mov r8, qword ptr [rbx + rcx*4]
0000000145b1e324 4c89040a                         mov qword ptr [rdx + rcx], r8
0000000145b1e328 4883c108                         add rcx, 8
0000000145b1e32c 4839c8                           cmp rax, rcx
0000000145b1e32f 75ef                             jne 0x145b1e320
0000000145b1e331 488b45e8                         mov rax, qword ptr [rbp - 0x18]
0000000145b1e335 488b5df8                         mov rbx, qword ptr [rbp - 8]
0000000145b1e339 4829d8                           sub rax, rbx
0000000145b1e33c 4939c6                           cmp r14, rax
0000000145b1e33f 0f87e7050000                     ja 0x145b1e92c
0000000145b1e345 488d0cdd00000000                 lea rcx, [rbx*8]
0000000145b1e34d 48034df0                         add rcx, qword ptr [rbp - 0x10]
0000000145b1e351 4c89e2                           mov rdx, r12
0000000145b1e354 4d89f8                           mov r8, r15
0000000145b1e357 e8ef6c4e00                       call 0x14600504b
0000000145b1e35c 4c01f3                           add rbx, r14
0000000145b1e35f 48895df8                         mov qword ptr [rbp - 8], rbx
0000000145b1e363 4d85f6                           test r14, r14
0000000145b1e366 7415                             je 0x145b1e37d
0000000145b1e368 41b808000000                     mov r8d, 8
0000000145b1e36e 4c89e1                           mov rcx, r12
0000000145b1e371 4c89fa                           mov rdx, r15
0000000145b1e374 e8573e4efa                       call 0x1400021d0
0000000145b1e379 488b5df8                         mov rbx, qword ptr [rbp - 8]
0000000145b1e37d 4c8bbfa8030000                   mov r15, qword ptr [rdi + 0x3a8]
0000000145b1e384 4c8bb7b0030000                   mov r14, qword ptr [rdi + 0x3b0]
0000000145b1e38b 488b45e8                         mov rax, qword ptr [rbp - 0x18]
0000000145b1e38f 4829d8                           sub rax, rbx
0000000145b1e392 4939c6                           cmp r14, rax
0000000145b1e395 0f87ef040000                     ja 0x145b1e88a
0000000145b1e39b 4d85f6                           test r14, r14
0000000145b1e39e 0f8429010000                     je 0x145b1e4cd
0000000145b1e3a4 488b45f0                         mov rax, qword ptr [rbp - 0x10]
0000000145b1e3a8 4983fe12                         cmp r14, 0x12
0000000145b1e3ac 722e                             jb 0x145b1e3dc
0000000145b1e3ae 488d0cd8                         lea rcx, [rax + rbx*8]
0000000145b1e3b2 4b8d14f6                         lea rdx, [r14 + r14*8]
0000000145b1e3b6 498d14d7                         lea rdx, [r15 + rdx*8]
0000000145b1e3ba 4883c2f4                         add rdx, -0xc
0000000145b1e3be 4839d1                           cmp rcx, rdx
0000000145b1e3c1 0f8392000000                     jae 0x145b1e459
0000000145b1e3c7 4a8d0c33                         lea rcx, [rbx + r14]
0000000145b1e3cb 488d0cc8                         lea rcx, [rax + rcx*8]
0000000145b1e3cf 498d5738                         lea rdx, [r15 + 0x38]
0000000145b1e3d3 4839ca                           cmp rdx, rcx
0000000145b1e3d6 0f837d000000                     jae 0x145b1e459
0000000145b1e3dc 31c9                             xor ecx, ecx
0000000145b1e3de 4889ca                           mov rdx, rcx
0000000145b1e3e1 4883ca01                         or rdx, 1
0000000145b1e3e5 41f6c601                         test r14b, 1
0000000145b1e3e9 7420                             je 0x145b1e40b
0000000145b1e3eb 488d0cc9                         lea rcx, [rcx + rcx*8]
0000000145b1e3ef 418b4ccf38                       mov ecx, dword ptr [r15 + rcx*8 + 0x38]
0000000145b1e3f4 49b80000000000000040             movabs r8, 0x4000000000000000
0000000145b1e3fe 4909c8                           or r8, rcx
0000000145b1e401 4c8904d8                         mov qword ptr [rax + rbx*8], r8
0000000145b1e405 48ffc3                           inc rbx
0000000145b1e408 4889d1                           mov rcx, rdx
0000000145b1e40b 4939d6                           cmp r14, rdx
0000000145b1e40e 0f84b9000000                     je 0x145b1e4cd
0000000145b1e414 488d14c9                         lea rdx, [rcx + rcx*8]
0000000145b1e418 498d14d7                         lea rdx, [r15 + rdx*8]
0000000145b1e41c 4881c280000000                   add rdx, 0x80
0000000145b1e423 4929ce                           sub r14, rcx
0000000145b1e426 48b90000000000000040             movabs rcx, 0x4000000000000000
0000000145b1e430 448b42b8                         mov r8d, dword ptr [rdx - 0x48]
0000000145b1e434 4909c8                           or r8, rcx
0000000145b1e437 4c8904d8                         mov qword ptr [rax + rbx*8], r8
0000000145b1e43b 448b02                           mov r8d, dword ptr [rdx]
0000000145b1e43e 4909c8                           or r8, rcx
0000000145b1e441 4c8944d808                       mov qword ptr [rax + rbx*8 + 8], r8
0000000145b1e446 4883c302                         add rbx, 2
0000000145b1e44a 4881c290000000                   add rdx, 0x90
0000000145b1e451 4983c6fe                         add r14, -2
0000000145b1e455 75d9                             jne 0x145b1e430
0000000145b1e457 eb74                             jmp 0x145b1e4cd
0000000145b1e459 4c89f1                           mov rcx, r14
0000000145b1e45c 4883e1fc                         and rcx, 0xfffffffffffffffc
0000000145b1e460 488d14d8                         lea rdx, [rax + rbx*8]
0000000145b1e464 4883c210                         add rdx, 0x10
0000000145b1e468 4801cb                           add rbx, rcx
0000000145b1e46b 4d8d8710010000                   lea r8, [r15 + 0x110]
0000000145b1e472 4531c9                           xor r9d, r9d
0000000145b1e475 0f280594c38001                   movaps xmm0, xmmword ptr [rip + 0x180c394]
0000000145b1e47c 0f1f4000                         nop dword ptr [rax]
0000000145b1e480 f3410f108870ffffff               movss xmm1, dword ptr [r8 - 0x90]
0000000145b1e489 f3410f109028ffffff               movss xmm2, dword ptr [r8 - 0xd8]
0000000145b1e492 0f16d1                           movlhps xmm2, xmm1
0000000145b1e495 f3410f1008                       movss xmm1, dword ptr [r8]
0000000145b1e49a f3410f1058b8                     movss xmm3, dword ptr [r8 - 0x48]
0000000145b1e4a0 0f16d9                           movlhps xmm3, xmm1
0000000145b1e4a3 0f56d0                           orps xmm2, xmm0
0000000145b1e4a6 0f56d8                           orps xmm3, xmm0
0000000145b1e4a9 420f1154caf0                     movups xmmword ptr [rdx + r9*8 - 0x10], xmm2
0000000145b1e4af 420f111cca                       movups xmmword ptr [rdx + r9*8], xmm3
0000000145b1e4b4 4983c104                         add r9, 4
0000000145b1e4b8 4981c020010000                   add r8, 0x120
0000000145b1e4bf 4c39c9                           cmp rcx, r9
0000000145b1e4c2 75bc                             jne 0x145b1e480
0000000145b1e4c4 4939ce                           cmp r14, rcx
0000000145b1e4c7 0f8511ffffff                     jne 0x145b1e3de
0000000145b1e4cd 48895df8                         mov qword ptr [rbp - 8], rbx
0000000145b1e4d1 4c8bbff8090000                   mov r15, qword ptr [rdi + 0x9f8]
0000000145b1e4d8 4c8bb7000a0000                   mov r14, qword ptr [rdi + 0xa00]
0000000145b1e4df 488b45e8                         mov rax, qword ptr [rbp - 0x18]
0000000145b1e4e3 4829d8                           sub rax, rbx
0000000145b1e4e6 4939c6                           cmp r14, rax
0000000145b1e4e9 0f87d1030000                     ja 0x145b1e8c0
0000000145b1e4ef 4d85f6                           test r14, r14
0000000145b1e4f2 0f844f010000                     je 0x145b1e647
0000000145b1e4f8 488b45f0                         mov rax, qword ptr [rbp - 0x10]
0000000145b1e4fc 4983fe12                         cmp r14, 0x12
0000000145b1e500 722d                             jb 0x145b1e52f
0000000145b1e502 488d0cd8                         lea rcx, [rax + rbx*8]
0000000145b1e506 496bd670                         imul rdx, r14, 0x70
0000000145b1e50a 4c01fa                           add rdx, r15
0000000145b1e50d 4883c2d0                         add rdx, -0x30
0000000145b1e511 4839d1                           cmp rcx, rdx
0000000145b1e514 0f83c1000000                     jae 0x145b1e5db
0000000145b1e51a 4a8d0c33                         lea rcx, [rbx + r14]
0000000145b1e51e 488d0cc8                         lea rcx, [rax + rcx*8]
0000000145b1e522 498d5738                         lea rdx, [r15 + 0x38]
0000000145b1e526 4839ca                           cmp rdx, rcx
0000000145b1e529 0f83ac000000                     jae 0x145b1e5db
0000000145b1e52f 31c9                             xor ecx, ecx
0000000145b1e531 4c89f2                           mov rdx, r14
0000000145b1e534 4883e203                         and rdx, 3
0000000145b1e538 7443                             je 0x145b1e57d
0000000145b1e53a 4c8d04d8                         lea r8, [rax + rbx*8]
0000000145b1e53e 4c6bc970                         imul r9, rcx, 0x70
0000000145b1e542 4f8d1439                         lea r10, [r9 + r15]
0000000145b1e546 4983c238                         add r10, 0x38
0000000145b1e54a 48f7da                           neg rdx
0000000145b1e54d 4531c9                           xor r9d, r9d
0000000145b1e550 4d8b1a                           mov r11, qword ptr [r10]
0000000145b1e553 4d8918                           mov qword ptr [r8], r11
0000000145b1e556 49ffc9                           dec r9
0000000145b1e559 4983c008                         add r8, 8
0000000145b1e55d 4983c270                         add r10, 0x70
0000000145b1e561 4c39ca                           cmp rdx, r9
0000000145b1e564 75ea                             jne 0x145b1e550
0000000145b1e566 4c29cb                           sub rbx, r9
0000000145b1e569 4889ca                           mov rdx, rcx
0000000145b1e56c 4c29ca                           sub rdx, r9
0000000145b1e56f 4c29f1                           sub rcx, r14
0000000145b1e572 4883f9fc                         cmp rcx, -4
0000000145b1e576 7615                             jbe 0x145b1e58d
0000000145b1e578 e9ca000000                       jmp 0x145b1e647
0000000145b1e57d 4889ca                           mov rdx, rcx
0000000145b1e580 4c29f1                           sub rcx, r14
0000000145b1e583 4883f9fc                         cmp rcx, -4
0000000145b1e587 0f87ba000000                     ja 0x145b1e647
0000000145b1e58d 486bca70                         imul rcx, rdx, 0x70
0000000145b1e591 4c01f9                           add rcx, r15
0000000145b1e594 4881c188010000                   add rcx, 0x188
0000000145b1e59b 4929d6                           sub r14, rdx
0000000145b1e59e 6690                             nop 
0000000145b1e5a0 488b91b0feffff                   mov rdx, qword ptr [rcx - 0x150]
0000000145b1e5a7 488914d8                         mov qword ptr [rax + rbx*8], rdx
0000000145b1e5ab 488b9120ffffff                   mov rdx, qword ptr [rcx - 0xe0]
0000000145b1e5b2 488954d808                       mov qword ptr [rax + rbx*8 + 8], rdx
0000000145b1e5b7 488b5190                         mov rdx, qword ptr [rcx - 0x70]
0000000145b1e5bb 488954d810                       mov qword ptr [rax + rbx*8 + 0x10], rdx
0000000145b1e5c0 488b11                           mov rdx, qword ptr [rcx]
0000000145b1e5c3 488954d818                       mov qword ptr [rax + rbx*8 + 0x18], rdx
0000000145b1e5c8 4883c304                         add rbx, 4
0000000145b1e5cc 4881c1c0010000                   add rcx, 0x1c0
0000000145b1e5d3 4983c6fc                         add r14, -4
0000000145b1e5d7 75c7                             jne 0x145b1e5a0
0000000145b1e5d9 eb6c                             jmp 0x145b1e647
0000000145b1e5db 488d14dd00000000                 lea rdx, [rbx*8]
0000000145b1e5e3 4c89f1                           mov rcx, r14
0000000145b1e5e6 4883e1fc                         and rcx, 0xfffffffffffffffc
0000000145b1e5ea 4801cb                           add rbx, rcx
0000000145b1e5ed 4801c2                           add rdx, rax
0000000145b1e5f0 4883c210                         add rdx, 0x10
0000000145b1e5f4 4d8d8788010000                   lea r8, [r15 + 0x188]
0000000145b1e5fb 4531c9                           xor r9d, r9d
0000000145b1e5fe 6690                             nop 
0000000145b1e600 f2410f108020ffffff               movsd xmm0, qword ptr [r8 - 0xe0]
0000000145b1e609 f2410f1088b0feffff               movsd xmm1, qword ptr [r8 - 0x150]
0000000145b1e612 0f16c8                           movlhps xmm1, xmm0
0000000145b1e615 f2410f1000                       movsd xmm0, qword ptr [r8]
0000000145b1e61a f2410f105090                     movsd xmm2, qword ptr [r8 - 0x70]
0000000145b1e620 0f16d0                           movlhps xmm2, xmm0
0000000145b1e623 420f114ccaf0                     movups xmmword ptr [rdx + r9*8 - 0x10], xmm1
0000000145b1e629 420f1114ca                       movups xmmword ptr [rdx + r9*8], xmm2
0000000145b1e62e 4983c104                         add r9, 4
0000000145b1e632 4981c0c0010000                   add r8, 0x1c0
0000000145b1e639 4c39c9                           cmp rcx, r9
0000000145b1e63c 75c2                             jne 0x145b1e600
0000000145b1e63e 4939ce                           cmp r14, rcx
0000000145b1e641 0f85eafeffff                     jne 0x145b1e531
0000000145b1e647 48895df8                         mov qword ptr [rbp - 8], rbx
0000000145b1e64b 4c8bb7100a0000                   mov r14, qword ptr [rdi + 0xa10]
0000000145b1e652 488bbf180a0000                   mov rdi, qword ptr [rdi + 0xa18]
0000000145b1e659 488b45e8                         mov rax, qword ptr [rbp - 0x18]
0000000145b1e65d 4829d8                           sub rax, rbx
0000000145b1e660 4839c7                           cmp rdi, rax
0000000145b1e663 0f878d020000                     ja 0x145b1e8f6
0000000145b1e669 4885ff                           test rdi, rdi
0000000145b1e66c 0f84e6000000                     je 0x145b1e758
0000000145b1e672 488b45f0                         mov rax, qword ptr [rbp - 0x10]
0000000145b1e676 4883ff08                         cmp rdi, 8
0000000145b1e67a 7211                             jb 0x145b1e68d
0000000145b1e67c 488d0cd8                         lea rcx, [rax + rbx*8]
0000000145b1e680 4c29f1                           sub rcx, r14
0000000145b1e683 4883f920                         cmp rcx, 0x20
0000000145b1e687 0f8387000000                     jae 0x145b1e714
0000000145b1e68d 31c9                             xor ecx, ecx
0000000145b1e68f 4989f8                           mov r8, rdi
0000000145b1e692 4889ca                           mov rdx, rcx
0000000145b1e695 4983e003                         and r8, 3
0000000145b1e699 7418                             je 0x145b1e6b3
0000000145b1e69b 0f1f440000                       nop dword ptr [rax + rax]
0000000145b1e6a0 4d8b0cd6                         mov r9, qword ptr [r14 + rdx*8]
0000000145b1e6a4 4c890cd8                         mov qword ptr [rax + rbx*8], r9
0000000145b1e6a8 48ffc3                           inc rbx
0000000145b1e6ab 48ffc2                           inc rdx
0000000145b1e6ae 49ffc8                           dec r8
0000000145b1e6b1 75ed                             jne 0x145b1e6a0
0000000145b1e6b3 4829f9                           sub rcx, rdi
0000000145b1e6b6 4883f9fc                         cmp rcx, -4
0000000145b1e6ba 0f8798000000                     ja 0x145b1e758
0000000145b1e6c0 488d04d8                         lea rax, [rax + rbx*8]
0000000145b1e6c4 4883c018                         add rax, 0x18
0000000145b1e6c8 498d0cd6                         lea rcx, [r14 + rdx*8]
0000000145b1e6cc 4883c118                         add rcx, 0x18
0000000145b1e6d0 4829d7                           sub rdi, rdx
0000000145b1e6d3 31d2                             xor edx, edx
0000000145b1e6d5 66662e0f1f840000000000           nop word ptr cs:[rax + rax]
0000000145b1e6e0 4c8b44d1e8                       mov r8, qword ptr [rcx + rdx*8 - 0x18]
0000000145b1e6e5 4c8944d0e8                       mov qword ptr [rax + rdx*8 - 0x18], r8
0000000145b1e6ea 4c8b44d1f0                       mov r8, qword ptr [rcx + rdx*8 - 0x10]
0000000145b1e6ef 4c8944d0f0                       mov qword ptr [rax + rdx*8 - 0x10], r8
0000000145b1e6f4 4c8b44d1f8                       mov r8, qword ptr [rcx + rdx*8 - 8]
0000000145b1e6f9 4c8944d0f8                       mov qword ptr [rax + rdx*8 - 8], r8
0000000145b1e6fe 4c8b04d1                         mov r8, qword ptr [rcx + rdx*8]
0000000145b1e702 4c8904d0                         mov qword ptr [rax + rdx*8], r8
0000000145b1e706 4883c204                         add rdx, 4
0000000145b1e70a 4839d7                           cmp rdi, rdx
0000000145b1e70d 75d1                             jne 0x145b1e6e0
0000000145b1e70f 4801d3                           add rbx, rdx
0000000145b1e712 eb44                             jmp 0x145b1e758
0000000145b1e714 488d14dd00000000                 lea rdx, [rbx*8]
0000000145b1e71c 4889f9                           mov rcx, rdi
0000000145b1e71f 4883e1fc                         and rcx, 0xfffffffffffffffc
0000000145b1e723 4801cb                           add rbx, rcx
0000000145b1e726 4801c2                           add rdx, rax
0000000145b1e729 4883c210                         add rdx, 0x10
0000000145b1e72d 4531c0                           xor r8d, r8d
0000000145b1e730 430f1004c6                       movups xmm0, xmmword ptr [r14 + r8*8]
0000000145b1e735 430f104cc610                     movups xmm1, xmmword ptr [r14 + r8*8 + 0x10]
0000000145b1e73b 420f1144c2f0                     movups xmmword ptr [rdx + r8*8 - 0x10], xmm0
0000000145b1e741 420f110cc2                       movups xmmword ptr [rdx + r8*8], xmm1
0000000145b1e746 4983c004                         add r8, 4
0000000145b1e74a 4c39c1                           cmp rcx, r8
0000000145b1e74d 75e1                             jne 0x145b1e730
0000000145b1e74f 4839cf                           cmp rdi, rcx
0000000145b1e752 0f8537ffffff                     jne 0x145b1e68f
0000000145b1e758 48895df8                         mov qword ptr [rbp - 8], rbx
0000000145b1e75c 48895e10                         mov qword ptr [rsi + 0x10], rbx
0000000145b1e760 0f1045e8                         movups xmm0, xmmword ptr [rbp - 0x18]
0000000145b1e764 0f1106                           movups xmmword ptr [rsi], xmm0
0000000145b1e767 4889f0                           mov rax, rsi
0000000145b1e76a 4881c488000000                   add rsp, 0x88
0000000145b1e771 5b                               pop rbx
0000000145b1e772 5f                               pop rdi
0000000145b1e773 5e                               pop rsi
0000000145b1e774 415c                             pop r12
0000000145b1e776 415d                             pop r13
0000000145b1e778 415e                             pop r14
0000000145b1e77a 415f                             pop r15
0000000145b1e77c 5d                               pop rbp
0000000145b1e77d c3                               ret 
0000000145b1e77e 48c744242008000000               mov qword ptr [rsp + 0x20], 8
0000000145b1e787 488d4de8                         lea rcx, [rbp - 0x18]
0000000145b1e78b 41b908000000                     mov r9d, 8
0000000145b1e791 4889da                           mov rdx, rbx
0000000145b1e794 4d89f0                           mov r8, r14
0000000145b1e797 e854764e00                       call 0x146005df0
0000000145b1e79c 90                               nop 
0000000145b1e79d 488b45f0                         mov rax, qword ptr [rbp - 0x10]
0000000145b1e7a1 488b5df8                         mov rbx, qword ptr [rbp - 8]
0000000145b1e7a5 4983fe12                         cmp r14, 0x12
0000000145b1e7a9 722a                             jb 0x145b1e7d5
0000000145b1e7ab 488d0cd8                         lea rcx, [rax + rbx*8]
0000000145b1e7af 4b8d14e7                         lea rdx, [r15 + r12*8]
0000000145b1e7b3 4883c2e8                         add rdx, -0x18
0000000145b1e7b7 4839d1                           cmp rcx, rdx
0000000145b1e7ba 0f8308020000                     jae 0x145b1e9c8
0000000145b1e7c0 498d0c1e                         lea rcx, [r14 + rbx]
0000000145b1e7c4 488d0cc8                         lea rcx, [rax + rcx*8]
0000000145b1e7c8 498d5728                         lea rdx, [r15 + 0x28]
0000000145b1e7cc 4839ca                           cmp rdx, rcx
0000000145b1e7cf 0f83f3010000                     jae 0x145b1e9c8
0000000145b1e7d5 31c9                             xor ecx, ecx
0000000145b1e7d7 4c89f2                           mov rdx, r14
0000000145b1e7da 4883e203                         and rdx, 3
0000000145b1e7de 0f8484010000                     je 0x145b1e968
0000000145b1e7e4 4c8d04d8                         lea r8, [rax + rbx*8]
0000000145b1e7e8 4c8d0cc9                         lea r9, [rcx + rcx*8]
0000000145b1e7ec 4f8d14cf                         lea r10, [r15 + r9*8]
0000000145b1e7f0 4983c228                         add r10, 0x28
0000000145b1e7f4 48f7da                           neg rdx
0000000145b1e7f7 4531c9                           xor r9d, r9d
0000000145b1e7fa 4d8b1a                           mov r11, qword ptr [r10]
0000000145b1e7fd 4d8918                           mov qword ptr [r8], r11
0000000145b1e800 49ffc9                           dec r9
0000000145b1e803 4983c008                         add r8, 8
0000000145b1e807 4983c248                         add r10, 0x48
0000000145b1e80b 4c39ca                           cmp rdx, r9
0000000145b1e80e 75ea                             jne 0x145b1e7fa
0000000145b1e810 4c29cb                           sub rbx, r9
0000000145b1e813 4889ca                           mov rdx, rcx
0000000145b1e816 4c29ca                           sub rdx, r9
0000000145b1e819 e94d010000                       jmp 0x145b1e96b
0000000145b1e81e 48c744242008000000               mov qword ptr [rsp + 0x20], 8
0000000145b1e827 488d4de8                         lea rcx, [rbp - 0x18]
0000000145b1e82b 41b908000000                     mov r9d, 8
0000000145b1e831 4889da                           mov rdx, rbx
0000000145b1e834 4d89f0                           mov r8, r14
0000000145b1e837 e8b4754e00                       call 0x146005df0
0000000145b1e83c 90                               nop 
0000000145b1e83d 488b45f0                         mov rax, qword ptr [rbp - 0x10]
0000000145b1e841 488b5df8                         mov rbx, qword ptr [rbp - 8]
0000000145b1e845 4983fe12                         cmp r14, 0x12
0000000145b1e849 0f8261f7ffff                     jb 0x145b1dfb0
0000000145b1e84f e92ff7ffff                       jmp 0x145b1df83
0000000145b1e854 48c744242008000000               mov qword ptr [rsp + 0x20], 8
0000000145b1e85d 488d4de8                         lea rcx, [rbp - 0x18]
0000000145b1e861 41b908000000                     mov r9d, 8
0000000145b1e867 4889da                           mov rdx, rbx
0000000145b1e86a 4d89f0                           mov r8, r14
0000000145b1e86d e87e754e00                       call 0x146005df0
0000000145b1e872 90                               nop 
0000000145b1e873 488b45f0                         mov rax, qword ptr [rbp - 0x10]
0000000145b1e877 488b5df8                         mov rbx, qword ptr [rbp - 8]
0000000145b1e87b 4983fe10                         cmp r14, 0x10
0000000145b1e87f 0f82b7f8ffff                     jb 0x145b1e13c
0000000145b1e885 e982f8ffff                       jmp 0x145b1e10c
0000000145b1e88a 48c744242008000000               mov qword ptr [rsp + 0x20], 8
0000000145b1e893 488d4de8                         lea rcx, [rbp - 0x18]
0000000145b1e897 41b908000000                     mov r9d, 8
0000000145b1e89d 4889da                           mov rdx, rbx
0000000145b1e8a0 4d89f0                           mov r8, r14
0000000145b1e8a3 e848754e00                       call 0x146005df0
0000000145b1e8a8 90                               nop 
0000000145b1e8a9 488b45f0                         mov rax, qword ptr [rbp - 0x10]
0000000145b1e8ad 488b5df8                         mov rbx, qword ptr [rbp - 8]
0000000145b1e8b1 4983fe12                         cmp r14, 0x12
0000000145b1e8b5 0f8221fbffff                     jb 0x145b1e3dc
0000000145b1e8bb e9eefaffff                       jmp 0x145b1e3ae
0000000145b1e8c0 48c744242008000000               mov qword ptr [rsp + 0x20], 8
0000000145b1e8c9 488d4de8                         lea rcx, [rbp - 0x18]
0000000145b1e8cd 41b908000000                     mov r9d, 8
0000000145b1e8d3 4889da                           mov rdx, rbx
0000000145b1e8d6 4d89f0                           mov r8, r14
0000000145b1e8d9 e812754e00                       call 0x146005df0
0000000145b1e8de 90                               nop 
0000000145b1e8df 488b45f0                         mov rax, qword ptr [rbp - 0x10]
0000000145b1e8e3 488b5df8                         mov rbx, qword ptr [rbp - 8]
0000000145b1e8e7 4983fe12                         cmp r14, 0x12
0000000145b1e8eb 0f823efcffff                     jb 0x145b1e52f
0000000145b1e8f1 e90cfcffff                       jmp 0x145b1e502
0000000145b1e8f6 48c744242008000000               mov qword ptr [rsp + 0x20], 8
0000000145b1e8ff 488d4de8                         lea rcx, [rbp - 0x18]
0000000145b1e903 41b908000000                     mov r9d, 8
0000000145b1e909 4889da                           mov rdx, rbx
0000000145b1e90c 4989f8                           mov r8, rdi
0000000145b1e90f e8dc744e00                       call 0x146005df0
0000000145b1e914 90                               nop 
0000000145b1e915 488b45f0                         mov rax, qword ptr [rbp - 0x10]
0000000145b1e919 488b5df8                         mov rbx, qword ptr [rbp - 8]
0000000145b1e91d 4883ff08                         cmp rdi, 8
0000000145b1e921 0f8266fdffff                     jb 0x145b1e68d
0000000145b1e927 e950fdffff                       jmp 0x145b1e67c
0000000145b1e92c 4c8965e0                         mov qword ptr [rbp - 0x20], r12
0000000145b1e930 4c897dd8                         mov qword ptr [rbp - 0x28], r15
0000000145b1e934 48c744242008000000               mov qword ptr [rsp + 0x20], 8
0000000145b1e93d 488d4de8                         lea rcx, [rbp - 0x18]
0000000145b1e941 41b908000000                     mov r9d, 8
0000000145b1e947 4889da                           mov rdx, rbx
0000000145b1e94a 4d89f0                           mov r8, r14
0000000145b1e94d e89e744e00                       call 0x146005df0
0000000145b1e952 90                               nop 
0000000145b1e953 488b5df8                         mov rbx, qword ptr [rbp - 8]
0000000145b1e957 4e8d3cf500000000                 lea r15, [r14*8]
0000000145b1e95f 4c8b65e0                         mov r12, qword ptr [rbp - 0x20]
0000000145b1e963 e9ddf9ffff                       jmp 0x145b1e345
0000000145b1e968 4889ca                           mov rdx, rcx
0000000145b1e96b 4c29f1                           sub rcx, r14
0000000145b1e96e 4883f9fc                         cmp rcx, -4
0000000145b1e972 0f8735f5ffff                     ja 0x145b1dead
0000000145b1e978 488d0cd2                         lea rcx, [rdx + rdx*8]
0000000145b1e97c 498d0ccf                         lea rcx, [r15 + rcx*8]
0000000145b1e980 4881c100010000                   add rcx, 0x100
0000000145b1e987 4929d6                           sub r14, rdx
0000000145b1e98a 488b9128ffffff                   mov rdx, qword ptr [rcx - 0xd8]
0000000145b1e991 488914d8                         mov qword ptr [rax + rbx*8], rdx
0000000145b1e995 488b9170ffffff                   mov rdx, qword ptr [rcx - 0x90]
0000000145b1e99c 488954d808                       mov qword ptr [rax + rbx*8 + 8], rdx
0000000145b1e9a1 488b51b8                         mov rdx, qword ptr [rcx - 0x48]
0000000145b1e9a5 488954d810                       mov qword ptr [rax + rbx*8 + 0x10], rdx
0000000145b1e9aa 488b11                           mov rdx, qword ptr [rcx]
0000000145b1e9ad 488954d818                       mov qword ptr [rax + rbx*8 + 0x18], rdx
0000000145b1e9b2 4883c304                         add rbx, 4
0000000145b1e9b6 4881c120010000                   add rcx, 0x120
0000000145b1e9bd 4983c6fc                         add r14, -4
0000000145b1e9c1 75c7                             jne 0x145b1e98a
0000000145b1e9c3 e9e5f4ffff                       jmp 0x145b1dead
0000000145b1e9c8 488d14dd00000000                 lea rdx, [rbx*8]
0000000145b1e9d0 4c89f1                           mov rcx, r14
0000000145b1e9d3 4883e1fc                         and rcx, 0xfffffffffffffffc
0000000145b1e9d7 4801cb                           add rbx, rcx
0000000145b1e9da 4801c2                           add rdx, rax
0000000145b1e9dd 4883c210                         add rdx, 0x10
0000000145b1e9e1 4d8d8700010000                   lea r8, [r15 + 0x100]
0000000145b1e9e8 4531c9                           xor r9d, r9d
0000000145b1e9eb f2410f108070ffffff               movsd xmm0, qword ptr [r8 - 0x90]
0000000145b1e9f4 f2410f108828ffffff               movsd xmm1, qword ptr [r8 - 0xd8]
0000000145b1e9fd 0f16c8                           movlhps xmm1, xmm0
0000000145b1ea00 f2410f1000                       movsd xmm0, qword ptr [r8]
0000000145b1ea05 f2410f1050b8                     movsd xmm2, qword ptr [r8 - 0x48]
0000000145b1ea0b 0f16d0                           movlhps xmm2, xmm0
0000000145b1ea0e 420f114ccaf0                     movups xmmword ptr [rdx + r9*8 - 0x10], xmm1
0000000145b1ea14 420f1114ca                       movups xmmword ptr [rdx + r9*8], xmm2
0000000145b1ea19 4983c104                         add r9, 4
0000000145b1ea1d 4981c020010000                   add r8, 0x120
0000000145b1ea24 4c39c9                           cmp rcx, r9
0000000145b1ea27 75c2                             jne 0x145b1e9eb
0000000145b1ea29 4939ce                           cmp r14, rcx
0000000145b1ea2c 0f847bf4ffff                     je 0x145b1dead
0000000145b1ea32 e9a0fdffff                       jmp 0x145b1e7d7
0000000145b1ea37 b908000000                       mov ecx, 8
0000000145b1ea3c 4c89f2                           mov rdx, r14
0000000145b1ea3f e817f36800                       call 0x1461add5b
0000000145b1ea44 0f0b                             ud2 
0000000145b1ea46 b908000000                       mov ecx, 8
0000000145b1ea4b 4c89fa                           mov rdx, r15
0000000145b1ea4e e808f36800                       call 0x1461add5b
0000000145b1ea53 90                               nop 
0000000145b1ea54 0f0b                             ud2 

; auxiliary-collector
0000000145c8c6a0 4157                             push r15
0000000145c8c6a2 4156                             push r14
0000000145c8c6a4 4155                             push r13
0000000145c8c6a6 4154                             push r12
0000000145c8c6a8 56                               push rsi
0000000145c8c6a9 57                               push rdi
0000000145c8c6aa 55                               push rbp
0000000145c8c6ab 53                               push rbx
0000000145c8c6ac 4883ec38                         sub rsp, 0x38
0000000145c8c6b0 4889d6                           mov rsi, rdx
0000000145c8c6b3 4889cf                           mov rdi, rcx
0000000145c8c6b6 488b4a10                         mov rcx, qword ptr [rdx + 0x10]
0000000145c8c6ba 4c8b32                           mov r14, qword ptr [rdx]
0000000145c8c6bd 4c8b7a08                         mov r15, qword ptr [rdx + 8]
0000000145c8c6c1 488b4220                         mov rax, qword ptr [rdx + 0x20]
0000000145c8c6c5 4c8b4228                         mov r8, qword ptr [rdx + 0x28]
0000000145c8c6c9 488b5218                         mov rdx, qword ptr [rdx + 0x18]
0000000145c8c6cd 4c89442428                       mov qword ptr [rsp + 0x28], r8
0000000145c8c6d2 eb3f                             jmp 0x145c8c713
0000000145c8c6d4 498b4e08                         mov rcx, qword ptr [r14 + 8]
0000000145c8c6d8 488d14d1                         lea rdx, [rcx + rdx*8]
0000000145c8c6dc 4983c648                         add r14, 0x48
0000000145c8c6e0 4c8936                           mov qword ptr [rsi], r14
0000000145c8c6e3 48895618                         mov qword ptr [rsi + 0x18], rdx
0000000145c8c6e7 488d6908                         lea rbp, [rcx + 8]
0000000145c8c6eb 48896e10                         mov qword ptr [rsi + 0x10], rbp
0000000145c8c6ef 4989c4                           mov r12, rax
0000000145c8c6f2 4c8b29                           mov r13, qword ptr [rcx]
0000000145c8c6f5 488b5f10                         mov rbx, qword ptr [rdi + 0x10]
0000000145c8c6f9 483b1f                           cmp rbx, qword ptr [rdi]
0000000145c8c6fc 747a                             je 0x145c8c778
0000000145c8c6fe 488b4708                         mov rax, qword ptr [rdi + 8]
0000000145c8c702 4c892cd8                         mov qword ptr [rax + rbx*8], r13
0000000145c8c706 48ffc3                           inc rbx
0000000145c8c709 48895f10                         mov qword ptr [rdi + 0x10], rbx
0000000145c8c70d 4c89e0                           mov rax, r12
0000000145c8c710 4889e9                           mov rcx, rbp
0000000145c8c713 4885c9                           test rcx, rcx
0000000145c8c716 740d                             je 0x145c8c725
0000000145c8c718 4839d1                           cmp rcx, rdx
0000000145c8c71b 75ca                             jne 0x145c8c6e7
0000000145c8c71d 48c7461000000000                 mov qword ptr [rsi + 0x10], 0
0000000145c8c725 4d85f6                           test r14, r14
0000000145c8c728 742b                             je 0x145c8c755
0000000145c8c72a 4d39fe                           cmp r14, r15
0000000145c8c72d 7426                             je 0x145c8c755
0000000145c8c72f 90                               nop 
0000000145c8c730 498b5610                         mov rdx, qword ptr [r14 + 0x10]
0000000145c8c734 4885d2                           test rdx, rdx
0000000145c8c737 759b                             jne 0x145c8c6d4
0000000145c8c739 4983c648                         add r14, 0x48
0000000145c8c73d 4d39fe                           cmp r14, r15
0000000145c8c740 75ee                             jne 0x145c8c730
0000000145c8c742 498b56c0                         mov rdx, qword ptr [r14 - 0x40]
0000000145c8c746 4c8936                           mov qword ptr [rsi], r14
0000000145c8c749 48c7461000000000                 mov qword ptr [rsi + 0x10], 0
0000000145c8c751 48895618                         mov qword ptr [rsi + 0x18], rdx
0000000145c8c755 4885c0                           test rax, rax
0000000145c8c758 7475                             je 0x145c8c7cf
0000000145c8c75a 4c39c0                           cmp rax, r8
0000000145c8c75d 7470                             je 0x145c8c7cf
0000000145c8c75f 4c8d6008                         lea r12, [rax + 8]
0000000145c8c763 4c896620                         mov qword ptr [rsi + 0x20], r12
0000000145c8c767 31ed                             xor ebp, ebp
0000000145c8c769 4889c1                           mov rcx, rax
0000000145c8c76c 4c8b29                           mov r13, qword ptr [rcx]
0000000145c8c76f 488b5f10                         mov rbx, qword ptr [rdi + 0x10]
0000000145c8c773 483b1f                           cmp rbx, qword ptr [rdi]
0000000145c8c776 7586                             jne 0x145c8c6fe
0000000145c8c778 4889d0                           mov rax, rdx
0000000145c8c77b 4829e8                           sub rax, rbp
0000000145c8c77e 48c1e803                         shr rax, 3
0000000145c8c782 4885ed                           test rbp, rbp
0000000145c8c785 480f44c5                         cmove rax, rbp
0000000145c8c789 4c89c1                           mov rcx, r8
0000000145c8c78c 4c29e1                           sub rcx, r12
0000000145c8c78f 48c1e903                         shr rcx, 3
0000000145c8c793 4d85e4                           test r12, r12
0000000145c8c796 490f44cc                         cmove rcx, r12
0000000145c8c79a 4c8d0408                         lea r8, [rax + rcx]
0000000145c8c79e 49ffc0                           inc r8
0000000145c8c7a1 48c744242008000000               mov qword ptr [rsp + 0x20], 8
0000000145c8c7aa 41b908000000                     mov r9d, 8
0000000145c8c7b0 4889f9                           mov rcx, rdi
0000000145c8c7b3 4889542430                       mov qword ptr [rsp + 0x30], rdx
0000000145c8c7b8 4889da                           mov rdx, rbx
0000000145c8c7bb e830963700                       call 0x146005df0
0000000145c8c7c0 488b542430                       mov rdx, qword ptr [rsp + 0x30]
0000000145c8c7c5 4c8b442428                       mov r8, qword ptr [rsp + 0x28]
0000000145c8c7ca e92fffffff                       jmp 0x145c8c6fe
0000000145c8c7cf 4883c438                         add rsp, 0x38
0000000145c8c7d3 5b                               pop rbx
0000000145c8c7d4 5d                               pop rbp
0000000145c8c7d5 5f                               pop rdi
0000000145c8c7d6 5e                               pop rsi
0000000145c8c7d7 415c                             pop r12
0000000145c8c7d9 415d                             pop r13
0000000145c8c7db 415e                             pop r14
0000000145c8c7dd 415f                             pop r15
0000000145c8c7df c3                               ret 

; again-command-selector
0000000145c23773 8b02                             mov eax, dword ptr [rdx]
0000000145c23775 83e802                           sub eax, 2
0000000145c23778 ba0b000000                       mov edx, 0xb
0000000145c2377d 0f43d0                           cmovae edx, eax
0000000145c23780 4889ce                           mov rsi, rcx
0000000145c23783 488d054a93a801                   lea rax, [rip + 0x1a8934a]
0000000145c2378a 48899598280000                   mov qword ptr [rbp + 0x2898], rdx
0000000145c23791 48630c90                         movsxd rcx, dword ptr [rax + rdx*4]
0000000145c23795 4801c1                           add rcx, rax
0000000145c23798 ffe1                             jmp rcx

; again-admission
0000000145c237d0 837e1002                         cmp dword ptr [rsi + 0x10], 2
0000000145c237d4 0f849c0c0000                     je 0x145c24476
0000000145c237da 80be620d000000                   cmp byte ptr [rsi + 0xd62], 0
0000000145c237e1 0f848f0c0000                     je 0x145c24476
0000000145c237e7 4889f1                           mov rcx, rsi
0000000145c237ea e8c1dcffff                       call 0x145c214b0
0000000145c237ef 90                               nop 
0000000145c237f0 eba8                             jmp 0x145c2379a

; take-game
0000000145c24476 4889f1                           mov rcx, rsi
0000000145c24479 e8b2d2ffff                       call 0x145c21730
0000000145c2447e 90                               nop 
0000000145c2447f 488d4e10                         lea rcx, [rsi + 0x10]
0000000145c24483 488b01                           mov rax, qword ptr [rcx]
0000000145c24486 48c70102000000                   mov qword ptr [rcx], 2
0000000145c2448d 4883f802                         cmp rax, 2
0000000145c24491 0f8403f3ffff                     je 0x145c2379a
0000000145c24497 4989cd                           mov r13, rcx
0000000145c2449a 488d5618                         lea rdx, [rsi + 0x18]
0000000145c2449e 488945b0                         mov qword ptr [rbp - 0x50], rax
0000000145c244a2 488d4db8                         lea rcx, [rbp - 0x48]
0000000145c244a6 41b8580d0000                     mov r8d, 0xd58
0000000145c244ac e89a0b3e00                       call 0x14600504b
0000000145c244b1 488b8e90110000                   mov rcx, qword ptr [rsi + 0x1190]
0000000145c244b8 4885c9                           test rcx, rcx
0000000145c244bb 0f8480030000                     je 0x145c24841
0000000145c244c1 488b8688110000                   mov rax, qword ptr [rsi + 0x1188]
0000000145c244c8 4869c9b0000000                   imul rcx, rcx, 0xb0
0000000145c244cf 31ff                             xor edi, edi
0000000145c244d1 31d2                             xor edx, edx
0000000145c244d3 80bc10a800000000                 cmp byte ptr [rax + rdx + 0xa8], 0
0000000145c244db 0f853b020000                     jne 0x145c2471c
0000000145c244e1 48ffc7                           inc rdi
0000000145c244e4 4881c2b0000000                   add rdx, 0xb0
0000000145c244eb 4839d1                           cmp rcx, rdx
0000000145c244ee 75e3                             jne 0x145c244d3
0000000145c244f0 e94c030000                       jmp 0x145c24841

; gossip-and-retirement
0000000145c2471c 48837dc000                       cmp qword ptr [rbp - 0x40], 0
0000000145c24721 742b                             je 0x145c2474e
0000000145c24723 488d8d100d0000                   lea rcx, [rbp + 0xd10]
0000000145c2472a e841640400                       call 0x145c6ab70
0000000145c2472f 90                               nop 
0000000145c24730 488b8e88110000                   mov rcx, qword ptr [rsi + 0x1188]
0000000145c24737 488b9690110000                   mov rdx, qword ptr [rsi + 0x1190]
0000000145c2473e 4c8d8d100d0000                   lea r9, [rbp + 0xd10]
0000000145c24745 4989f8                           mov r8, rdi
0000000145c24748 e83376feff                       call 0x145c0bd80
0000000145c2474d 90                               nop 
0000000145c2474e 488d8d100d0000                   lea rcx, [rbp + 0xd10]
0000000145c24755 488d55b0                         lea rdx, [rbp - 0x50]
0000000145c24759 e82296efff                       call 0x145b1dd80
0000000145c2475e 90                               nop 
0000000145c2475f 488b85100d0000                   mov rax, qword ptr [rbp + 0xd10]
0000000145c24766 488985a0280000                   mov qword ptr [rbp + 0x28a0], rax
0000000145c2476d 488b85180d0000                   mov rax, qword ptr [rbp + 0xd18]
0000000145c24774 488985b0280000                   mov qword ptr [rbp + 0x28b0], rax
0000000145c2477b 488b85200d0000                   mov rax, qword ptr [rbp + 0xd20]
0000000145c24782 4885c0                           test rax, rax
0000000145c24785 747e                             je 0x145c24805
0000000145c24787 4c8bbdb0280000                   mov r15, qword ptr [rbp + 0x28b0]
0000000145c2478e 4d8d34c7                         lea r14, [r15 + rax*8]
0000000145c24792 488d9d100d0000                   lea rbx, [rbp + 0xd10]
0000000145c24799 4d8b27                           mov r12, qword ptr [r15]
0000000145c2479c e85fda3dfa                       call 0x140002200
0000000145c247a1 b920000000                       mov ecx, 0x20
0000000145c247a6 ba01000000                       mov edx, 1
0000000145c247ab e810da3dfa                       call 0x1400021c0
0000000145c247b0 4885c0                           test rax, rax
0000000145c247b3 0f842e070000                     je 0x145c24ee7
0000000145c247b9 4c8920                           mov qword ptr [rax], r12
0000000145c247bc 48c785100d000020000000           mov qword ptr [rbp + 0xd10], 0x20
0000000145c247c7 488985180d0000                   mov qword ptr [rbp + 0xd18], rax
0000000145c247ce 48c785200d000008000000           mov qword ptr [rbp + 0xd20], 8
0000000145c247d9 66c785280d0000aa00               mov word ptr [rbp + 0xd28], 0xaa
0000000145c247e2 488b8e88110000                   mov rcx, qword ptr [rsi + 0x1188]
0000000145c247e9 488b9690110000                   mov rdx, qword ptr [rsi + 0x1190]
0000000145c247f0 4989f8                           mov r8, rdi
0000000145c247f3 4989d9                           mov r9, rbx
0000000145c247f6 e88575feff                       call 0x145c0bd80
0000000145c247fb 90                               nop 
0000000145c247fc 4983c708                         add r15, 8
0000000145c24800 4d39f7                           cmp r15, r14
0000000145c24803 7594                             jne 0x145c24799
0000000145c24805 488b95a0280000                   mov rdx, qword ptr [rbp + 0x28a0]
0000000145c2480c 4885d2                           test rdx, rdx
0000000145c2480f 7417                             je 0x145c24828
0000000145c24811 48c1e203                         shl rdx, 3
0000000145c24815 41b808000000                     mov r8d, 8
0000000145c2481b 488b8db0280000                   mov rcx, qword ptr [rbp + 0x28b0]
0000000145c24822 e8a9d93dfa                       call 0x1400021d0
0000000145c24827 90                               nop 
0000000145c24828 488d8d100d0000                   lea rcx, [rbp + 0xd10]
0000000145c2482f 4889f2                           mov rdx, rsi
0000000145c24832 e8e91a0000                       call 0x145c26320
0000000145c24837 90                               nop 
0000000145c24838 83bd100d000002                   cmp dword ptr [rbp + 0xd10], 2
0000000145c2483f 7531                             jne 0x145c24872

; gossip-factory
0000000145c6ab70 56                               push rsi
0000000145c6ab71 4883ec20                         sub rsp, 0x20
0000000145c6ab75 4889ce                           mov rsi, rcx
0000000145c6ab78 e8837639fa                       call 0x140002200
0000000145c6ab7d b920000000                       mov ecx, 0x20
0000000145c6ab82 ba01000000                       mov edx, 1
0000000145c6ab87 e8347639fa                       call 0x1400021c0
0000000145c6ab8c 4885c0                           test rax, rax
0000000145c6ab8f 7422                             je 0x145c6abb3
0000000145c6ab91 66c746187e01                     mov word ptr [rsi + 0x18], 0x17e
0000000145c6ab97 48c70620000000                   mov qword ptr [rsi], 0x20
0000000145c6ab9e 48894608                         mov qword ptr [rsi + 8], rax
0000000145c6aba2 48c7461000000000                 mov qword ptr [rsi + 0x10], 0
0000000145c6abaa 4889f0                           mov rax, rsi
0000000145c6abad 4883c420                         add rsp, 0x20
0000000145c6abb1 5e                               pop rsi
0000000145c6abb2 c3                               ret 
0000000145c6abb3 b901000000                       mov ecx, 1
0000000145c6abb8 ba20000000                       mov edx, 0x20
0000000145c6abbd e899315400                       call 0x1461add5b
0000000145c6abc2 0f0b                             ud2 

; cache-kind2
0000000145b58e0c 44896558                         mov dword ptr [rbp + 0x58], r12d
0000000145b58e10 44896d54                         mov dword ptr [rbp + 0x54], r13d
0000000145b58e14 4c8ba760060000                   mov r12, qword ptr [rdi + 0x660]
0000000145b58e1b 4c8baf68060000                   mov r13, qword ptr [rdi + 0x668]
0000000145b58e22 4d85ed                           test r13, r13
0000000145b58e25 740f                             je 0x145b58e36
0000000145b58e27 4983fd04                         cmp r13, 4
0000000145b58e2b 7310                             jae 0x145b58e3d
0000000145b58e2d 31c0                             xor eax, eax
0000000145b58e2f 31db                             xor ebx, ebx
0000000145b58e31 e997000000                       jmp 0x145b58ecd
0000000145b58e36 31db                             xor ebx, ebx
0000000145b58e38 e9b7000000                       jmp 0x145b58ef4
0000000145b58e3d 4c89e8                           mov rax, r13
0000000145b58e40 4883e0fc                         and rax, 0xfffffffffffffffc
0000000145b58e44 498d8c24f8000000                 lea rcx, [r12 + 0xf8]
0000000145b58e4c 0f57c0                           xorps xmm0, xmm0
0000000145b58e4f 660f6f0d891b7d01                 movdqa xmm1, xmmword ptr [rip + 0x17d1b89]
0000000145b58e57 660f6f15714f6600                 movdqa xmm2, xmmword ptr [rip + 0x664f71]
0000000145b58e5f 4889c2                           mov rdx, rax
0000000145b58e62 0f57db                           xorps xmm3, xmm3
0000000145b58e65 66662e0f1f840000000000           nop word ptr cs:[rax + rax]
0000000145b58e70 660f6ea170ffffff                 movd xmm4, dword ptr [rcx - 0x90]
0000000145b58e78 660f6ea928ffffff                 movd xmm5, dword ptr [rcx - 0xd8]
0000000145b58e80 660f6cec                         punpcklqdq xmm5, xmm4
0000000145b58e84 660f6e21                         movd xmm4, dword ptr [rcx]
0000000145b58e88 660f6e79b8                       movd xmm7, dword ptr [rcx - 0x48]
0000000145b58e8d 660f6cfc                         punpcklqdq xmm7, xmm4
0000000145b58e91 660f76e9                         pcmpeqd xmm5, xmm1
0000000145b58e95 660fdbea                         pand xmm5, xmm2
0000000145b58e99 660fd4dd                         paddq xmm3, xmm5
0000000145b58e9d 660f76f9                         pcmpeqd xmm7, xmm1
0000000145b58ea1 660fdbfa                         pand xmm7, xmm2
0000000145b58ea5 660fd4c7                         paddq xmm0, xmm7
0000000145b58ea9 4881c120010000                   add rcx, 0x120
0000000145b58eb0 4883c2fc                         add rdx, -4
0000000145b58eb4 75ba                             jne 0x145b58e70
0000000145b58eb6 660fd4c3                         paddq xmm0, xmm3
0000000145b58eba 660f70c8ee                       pshufd xmm1, xmm0, 0xee
0000000145b58ebf 660fd4c8                         paddq xmm1, xmm0
0000000145b58ec3 66480f7ecb                       movq rbx, xmm1
0000000145b58ec8 4939c5                           cmp r13, rax
0000000145b58ecb 7427                             je 0x145b58ef4
0000000145b58ecd 4c89e9                           mov rcx, r13
0000000145b58ed0 4829c1                           sub rcx, rax
0000000145b58ed3 488d04c0                         lea rax, [rax + rax*8]
0000000145b58ed7 498d04c4                         lea rax, [r12 + rax*8]
0000000145b58edb 4883c020                         add rax, 0x20
0000000145b58edf 90                               nop 
0000000145b58ee0 31d2                             xor edx, edx
0000000145b58ee2 833802                           cmp dword ptr [rax], 2
0000000145b58ee5 0f94c2                           sete dl
0000000145b58ee8 4801d3                           add rbx, rdx
0000000145b58eeb 4883c048                         add rax, 0x48
0000000145b58eef 48ffc9                           dec rcx
0000000145b58ef2 75ec                             jne 0x145b58ee0
0000000145b58ef4 b805000000                       mov eax, 5
0000000145b58ef9 80bf520d000001                   cmp byte ptr [rdi + 0xd52], 1
0000000145b58f00 0f858a000000                     jne 0x145b58f90
0000000145b58f06 488b87300a0000                   mov rax, qword ptr [rdi + 0xa30]
0000000145b58f0d 48ffc0                           inc rax
0000000145b58f10 31f6                             xor esi, esi
0000000145b58f12 482b87680c0000                   sub rax, qword ptr [rdi + 0xc68]
0000000145b58f19 480f42c6                         cmovb rax, rsi
0000000145b58f1d 4883f801                         cmp rax, 1
0000000145b58f21 4883d000                         adc rax, 0
0000000145b58f25 0f57c0                           xorps xmm0, xmm0
0000000145b58f28 f3480f2ac0                       cvtsi2ss xmm0, rax
0000000145b58f2d f30f58057f976500                 addss xmm0, dword ptr [rip + 0x65977f]
0000000145b58f35 f30f590577926500                 mulss xmm0, dword ptr [rip + 0x659277]
0000000145b58f3d f30f5805bb926500                 addss xmm0, dword ptr [rip + 0x6592bb]
0000000145b58f45 f30f5905cb946500                 mulss xmm0, dword ptr [rip + 0x6594cb]
0000000145b58f4d e859c14a00                       call 0x1460050ab
0000000145b58f52 f3480f2cc0                       cvttss2si rax, xmm0
0000000145b58f57 4889c1                           mov rcx, rax
0000000145b58f5a 0f28c8                           movaps xmm1, xmm0
0000000145b58f5d f30f5c0d374c6600                 subss xmm1, dword ptr [rip + 0x664c37]
0000000145b58f65 f3480f2cd1                       cvttss2si rdx, xmm1
0000000145b58f6a 48c1f93f                         sar rcx, 0x3f
0000000145b58f6e 4821ca                           and rdx, rcx
0000000145b58f71 4809c2                           or rdx, rax
0000000145b58f74 0f57c9                           xorps xmm1, xmm1
0000000145b58f77 0f2ec1                           ucomiss xmm0, xmm1
0000000145b58f7a 480f42d6                         cmovb rdx, rsi
0000000145b58f7e 0f2e051b4c6600                   ucomiss xmm0, dword ptr [rip + 0x664c1b]
0000000145b58f85 48c7c0ffffffff                   mov rax, 0xffffffffffffffff
0000000145b58f8c 480f46c2                         cmovbe rax, rdx
0000000145b58f90 41be03000000                     mov r14d, 3
0000000145b58f96 c7455c2d230000                   mov dword ptr [rbp + 0x5c], 0x232d
0000000145b58f9d 49bf030100000000803f             movabs r15, 0x3f80000000000103
0000000145b58fa7 4839c3                           cmp rbx, rax
0000000145b58faa 730d                             jae 0x145b58fb9
0000000145b58fac 448b6d54                         mov r13d, dword ptr [rbp + 0x54]
0000000145b58fb0 448b6558                         mov r12d, dword ptr [rbp + 0x58]
0000000145b58fb4 e96e0c0000                       jmp 0x145b59c27
0000000145b58fb9 49c1e503                         shl r13, 3

; pickup-append
0000000145b59e08 488bb768060000                   mov rsi, qword ptr [rdi + 0x668]
0000000145b59e0f 483bb758060000                   cmp rsi, qword ptr [rdi + 0x658]
0000000145b59e16 750d                             jne 0x145b59e25
0000000145b59e18 488d8f58060000                   lea rcx, [rdi + 0x658]
0000000145b59e1f e80cc44a00                       call 0x146006230
0000000145b59e24 90                               nop 
0000000145b59e25 488b8760060000                   mov rax, qword ptr [rdi + 0x660]
0000000145b59e2c 488d0cf6                         lea rcx, [rsi + rsi*8]
0000000145b59e30 488b5528                         mov rdx, qword ptr [rbp + 0x28]
0000000145b59e34 488914c8                         mov qword ptr [rax + rcx*8], rdx
0000000145b59e38 488b5520                         mov rdx, qword ptr [rbp + 0x20]
0000000145b59e3c 488954c808                       mov qword ptr [rax + rcx*8 + 8], rdx
0000000145b59e41 48895cc810                       mov qword ptr [rax + rcx*8 + 0x10], rbx
0000000145b59e46 c744c81800000000                 mov dword ptr [rax + rcx*8 + 0x18], 0
0000000145b59e4e 448964c820                       mov dword ptr [rax + rcx*8 + 0x20], r12d
0000000145b59e53 44896cc824                       mov dword ptr [rax + rcx*8 + 0x24], r13d
0000000145b59e58 4c8974c828                       mov qword ptr [rax + rcx*8 + 0x28], r14
0000000145b59e5d 8b555c                           mov edx, dword ptr [rbp + 0x5c]
0000000145b59e60 8954c830                         mov dword ptr [rax + rcx*8 + 0x30], edx
0000000145b59e64 0f1374c834                       movlps qword ptr [rax + rcx*8 + 0x34], xmm6
0000000145b59e69 f30f117cc83c                     movss dword ptr [rax + rcx*8 + 0x3c], xmm7
0000000145b59e6f f3440f1144c840                   movss dword ptr [rax + rcx*8 + 0x40], xmm8
0000000145b59e76 48ffc6                           inc rsi
0000000145b59e79 4889b768060000                   mov qword ptr [rdi + 0x668], rsi

; boundary-retained-guid
0000000145b19d91 488b9d38010000                   mov rbx, qword ptr [rbp + 0x138]
0000000145b19d98 488d3cfb                         lea rdi, [rbx + rdi*8]
0000000145b19d9c 488b8530010000                   mov rax, qword ptr [rbp + 0x130]
0000000145b19da3 4c8db0080a0000                   lea r14, [rax + 0xa08]
0000000145b19daa f3440f10059d426a00               movss xmm8, dword ptr [rip + 0x6a429d]
0000000145b19db3 450f57c9                         xorps xmm9, xmm9
0000000145b19db7 f3440f1015dc3d6a00               movss xmm10, dword ptr [rip + 0x6a3ddc]
0000000145b19dc0 450f57db                         xorps xmm11, xmm11
0000000145b19dc4 f3440f1025d33d6a00               movss xmm12, dword ptr [rip + 0x6a3dd3]
0000000145b19dcd 4c8d3dfc168101                   lea r15, [rip + 0x18116fc]
0000000145b19dd4 4c8da5d0000000                   lea r12, [rbp + 0xd0]
0000000145b19ddb eb2c                             jmp 0x145b19e09
0000000145b19ddd 0f1f00                           nop dword ptr [rax]
0000000145b19de0 488b8d30010000                   mov rcx, qword ptr [rbp + 0x130]
0000000145b19de7 488b81100a0000                   mov rax, qword ptr [rcx + 0xa10]
0000000145b19dee 4c892cf0                         mov qword ptr [rax + rsi*8], r13
0000000145b19df2 48ffc6                           inc rsi
0000000145b19df5 4889b1180a0000                   mov qword ptr [rcx + 0xa18], rsi
0000000145b19dfc 4883c308                         add rbx, 8
0000000145b19e00 4839fb                           cmp rbx, rdi
0000000145b19e03 0f84a3020000                     je 0x145b1a0ac

; boundary-create-and-append
0000000145b1a050 0f13b5d0000000                   movlps qword ptr [rbp + 0xd0], xmm6
0000000145b1a057 f30f1185d8000000                 movss dword ptr [rbp + 0xd8], xmm0
0000000145b1a05f c744242010000000                 mov dword ptr [rsp + 0x20], 0x10
0000000145b1a067 488b8d30010000                   mov rcx, qword ptr [rbp + 0x130]
0000000145b1a06e 4c89fa                           mov rdx, r15
0000000145b1a071 4d89e0                           mov r8, r12
0000000145b1a074 41b905000000                     mov r9d, 5
0000000145b1a07a e861220500                       call 0x145b6c2e0
0000000145b1a07f 90                               nop 
0000000145b1a080 4989c5                           mov r13, rax
0000000145b1a083 488b8530010000                   mov rax, qword ptr [rbp + 0x130]
0000000145b1a08a 488bb0180a0000                   mov rsi, qword ptr [rax + 0xa18]
0000000145b1a091 483bb0080a0000                   cmp rsi, qword ptr [rax + 0xa08]
0000000145b1a098 0f8542fdffff                     jne 0x145b19de0
0000000145b1a09e 4c89f1                           mov rcx, r14
0000000145b1a0a1 e8fac14e00                       call 0x1460062a0
0000000145b1a0a6 90                               nop 
0000000145b1a0a7 e934fdffff                       jmp 0x145b19de0

; companion-current-owner
0000000145b4c050 55                               push rbp
0000000145b4c051 4157                             push r15
0000000145b4c053 4156                             push r14
0000000145b4c055 4154                             push r12
0000000145b4c057 56                               push rsi
0000000145b4c058 57                               push rdi
0000000145b4c059 53                               push rbx
0000000145b4c05a 4881ec00010000                   sub rsp, 0x100
0000000145b4c061 488dac2480000000                 lea rbp, [rsp + 0x80]
0000000145b4c069 440f296d70                       movaps xmmword ptr [rbp + 0x70], xmm13
0000000145b4c06e 440f296560                       movaps xmmword ptr [rbp + 0x60], xmm12
0000000145b4c073 440f295d50                       movaps xmmword ptr [rbp + 0x50], xmm11
0000000145b4c078 440f295540                       movaps xmmword ptr [rbp + 0x40], xmm10
0000000145b4c07d 440f294d30                       movaps xmmword ptr [rbp + 0x30], xmm9
0000000145b4c082 440f294520                       movaps xmmword ptr [rbp + 0x20], xmm8
0000000145b4c087 0f297d10                         movaps xmmword ptr [rbp + 0x10], xmm7
0000000145b4c08b 0f297500                         movaps xmmword ptr [rbp], xmm6
0000000145b4c08f 48c745f8feffffff                 mov qword ptr [rbp - 8], 0xfffffffffffffffe
0000000145b4c097 4889d6                           mov rsi, rdx
0000000145b4c09a 488b91000a0000                   mov rdx, qword ptr [rcx + 0xa00]
0000000145b4c0a1 4839d6                           cmp rsi, rdx
0000000145b4c0a4 0f837e020000                     jae 0x145b4c328
0000000145b4c0aa 0f28f3                           movaps xmm6, xmm3
0000000145b4c0ad 0f28fa                           movaps xmm7, xmm2
0000000145b4c0b0 4889cf                           mov rdi, rcx
0000000145b4c0b3 f3440f1099980c0000               movss xmm11, dword ptr [rcx + 0xc98]
0000000145b4c0bc 4c8bb9f8090000                   mov r15, qword ptr [rcx + 0x9f8]
0000000145b4c0c3 4c8ba1f00b0000                   mov r12, qword ptr [rcx + 0xbf0]
0000000145b4c0ca 498d5c2410                       lea rbx, [r12 + 0x10]
0000000145b4c0cf 4c6bf670                         imul r14, rsi, 0x70
0000000145b4c0d3 f3430f104c375c                   movss xmm1, dword ptr [r15 + r14 + 0x5c]
0000000145b4c0da 4d01f7                           add r15, r14
0000000145b4c0dd 0f57c0                           xorps xmm0, xmm0
0000000145b4c0e0 0f2ec1                           ucomiss xmm0, xmm1
0000000145b4c0e3 7357                             jae 0x145b4c13c
0000000145b4c0e5 410f28d3                         movaps xmm2, xmm11
0000000145b4c0e9 f3410f5c5758                     subss xmm2, dword ptr [r15 + 0x58]
0000000145b4c0ef f30f5ed1                         divss xmm2, xmm1
0000000145b4c0f3 f30f5fc2                         maxss xmm0, xmm2
0000000145b4c0f7 f30f100d01616600                 movss xmm1, dword ptr [rip + 0x666101]
0000000145b4c0ff f30f5dc8                         minss xmm1, xmm0
0000000145b4c103 f2410f104740                     movsd xmm0, qword ptr [r15 + 0x40]
0000000145b4c109 f2410f10574c                     movsd xmm2, qword ptr [r15 + 0x4c]
0000000145b4c10f 0f5cd0                           subps xmm2, xmm0
0000000145b4c112 f3440f12c1                       movsldup xmm8, xmm1
0000000145b4c117 440f59c2                         mulps xmm8, xmm2
0000000145b4c11b 440f58c0                         addps xmm8, xmm0
0000000145b4c11f f3410f104748                     movss xmm0, dword ptr [r15 + 0x48]
0000000145b4c125 f3450f105754                     movss xmm10, dword ptr [r15 + 0x54]
0000000145b4c12b f3440f5cd0                       subss xmm10, xmm0
0000000145b4c130 f3440f59d1                       mulss xmm10, xmm1
0000000145b4c135 f3440f58d0                       addss xmm10, xmm0
0000000145b4c13a eb0c                             jmp 0x145b4c148
0000000145b4c13c f2450f10474c                     movsd xmm8, qword ptr [r15 + 0x4c]
0000000145b4c142 f3450f105754                     movss xmm10, dword ptr [r15 + 0x54]
0000000145b4c148 f3410f16d0                       movshdup xmm2, xmm8
0000000145b4c14d 4889d9                           mov rcx, rbx
0000000145b4c150 410f28c8                         movaps xmm1, xmm8
0000000145b4c154 e867260a00                       call 0x145bee7c0
0000000145b4c159 440f28c8                         movaps xmm9, xmm0
0000000145b4c15d a801                             test al, 1
0000000145b4c15f 7504                             jne 0x145b4c165
0000000145b4c161 450f28ca                         movaps xmm9, xmm10
0000000145b4c165 0f28c7                           movaps xmm0, xmm7
0000000145b4c168 0f14c6                           unpcklps xmm0, xmm6
0000000145b4c16b 410f28c8                         movaps xmm1, xmm8
0000000145b4c16f 0f5cc8                           subps xmm1, xmm0
0000000145b4c172 0f59c9                           mulps xmm1, xmm1
0000000145b4c175 f30f16c1                         movshdup xmm0, xmm1
0000000145b4c179 f30f58c1                         addss xmm0, xmm1
0000000145b4c17d f3440f51e0                       sqrtss xmm12, xmm0
0000000145b4c182 f30f100526196700                 movss xmm0, dword ptr [rip + 0x671926]
0000000145b4c18a 410f2ec4                         ucomiss xmm0, xmm12
0000000145b4c18e 0f875c010000                     ja 0x145b4c2f0
0000000145b4c194 f3440f10ade0000000               movss xmm13, dword ptr [rbp + 0xe0]
0000000145b4c19d 4889d9                           mov rcx, rbx
0000000145b4c1a0 0f28cf                           movaps xmm1, xmm7
0000000145b4c1a3 0f28d6                           movaps xmm2, xmm6
0000000145b4c1a6 e815260a00                       call 0x145bee7c0
0000000145b4c1ab a801                             test al, 1
0000000145b4c1ad 7406                             je 0x145b4c1b5
0000000145b4c1af 440f28d0                         movaps xmm10, xmm0
0000000145b4c1b3 eb34                             jmp 0x145b4c1e9
0000000145b4c1b5 49837c2468ff                     cmp qword ptr [r12 + 0x68], -1
0000000145b4c1bb 7422                             je 0x145b4c1df
0000000145b4c1bd 498d542468                       lea rdx, [r12 + 0x68]
0000000145b4c1c2 488d4dc8                         lea rcx, [rbp - 0x38]
0000000145b4c1c6 0f28d7                           movaps xmm2, xmm7
0000000145b4c1c9 0f28de                           movaps xmm3, xmm6
0000000145b4c1cc e82f5b0a00                       call 0x145bf1d00
0000000145b4c1d1 837dc801                         cmp dword ptr [rbp - 0x38], 1
0000000145b4c1d5 7508                             jne 0x145b4c1df
0000000145b4c1d7 f3440f1055d4                     movss xmm10, dword ptr [rbp - 0x2c]
0000000145b4c1dd eb0a                             jmp 0x145b4c1e9
0000000145b4c1df f3450f109424b8000000             movss xmm10, dword ptr [r12 + 0xb8]
0000000145b4c1e9 f3450f5ee5                       divss xmm12, xmm13
0000000145b4c1ee 498b5738                         mov rdx, qword ptr [r15 + 0x38]
0000000145b4c1f2 8b87d00c0000                     mov eax, dword ptr [rdi + 0xcd0]
0000000145b4c1f8 ffc0                             inc eax
0000000145b4c1fa 8987d00c0000                     mov dword ptr [rdi + 0xcd0], eax
0000000145b4c200 f30f1005404a6700                 movss xmm0, dword ptr [rip + 0x674a40]
0000000145b4c208 f3410f59c4                       mulss xmm0, xmm12
0000000145b4c20d f3480f2cc8                       cvttss2si rcx, xmm0
0000000145b4c212 4531c0                           xor r8d, r8d
0000000145b4c215 0f57c9                           xorps xmm1, xmm1
0000000145b4c218 0f2ec1                           ucomiss xmm0, xmm1
0000000145b4c21b 440f43c1                         cmovae r8d, ecx
0000000145b4c21f 0f2e05a25d6800                   ucomiss xmm0, dword ptr [rip + 0x685da2]
0000000145b4c226 b9ffffffff                       mov ecx, 0xffffffff
0000000145b4c22b 410f46c8                         cmovbe ecx, r8d
0000000145b4c22f 440f1345b8                       movlps qword ptr [rbp - 0x48], xmm8
0000000145b4c234 f3440f114dc0                     movss dword ptr [rbp - 0x40], xmm9
0000000145b4c23a f30f117dec                       movss dword ptr [rbp - 0x14], xmm7
0000000145b4c23f f30f1175f0                       movss dword ptr [rbp - 0x10], xmm6
0000000145b4c244 f3440f1155f4                     movss dword ptr [rbp - 0xc], xmm10
0000000145b4c24a 894c2428                         mov dword ptr [rsp + 0x28], ecx
0000000145b4c24e 89442420                         mov dword ptr [rsp + 0x20], eax
0000000145b4c252 488d4dc8                         lea rcx, [rbp - 0x38]
0000000145b4c256 4c8d45b8                         lea r8, [rbp - 0x48]
0000000145b4c25a 4c8d4dec                         lea r9, [rbp - 0x14]
0000000145b4c25e e8edb91100                       call 0x145c67c50
0000000145b4c263 488b9f80060000                   mov rbx, qword ptr [rdi + 0x680]
0000000145b4c26a 483b9f70060000                   cmp rbx, qword ptr [rdi + 0x670]
0000000145b4c271 750d                             jne 0x145b4c280
0000000145b4c273 488d8f70060000                   lea rcx, [rdi + 0x670]
0000000145b4c27a e8e1a14b00                       call 0x146006460
0000000145b4c27f 90                               nop 
0000000145b4c280 488b8778060000                   mov rax, qword ptr [rdi + 0x678]
0000000145b4c287 4889d9                           mov rcx, rbx
0000000145b4c28a 48c1e105                         shl rcx, 5
0000000145b4c28e 0f1045c8                         movups xmm0, xmmword ptr [rbp - 0x38]
0000000145b4c292 0f104dd8                         movups xmm1, xmmword ptr [rbp - 0x28]
0000000145b4c296 0f114c0810                       movups xmmword ptr [rax + rcx + 0x10], xmm1
0000000145b4c29b 0f110408                         movups xmmword ptr [rax + rcx], xmm0
0000000145b4c29f 48ffc3                           inc rbx
0000000145b4c2a2 48899f80060000                   mov qword ptr [rdi + 0x680], rbx
0000000145b4c2a9 488b97000a0000                   mov rdx, qword ptr [rdi + 0xa00]
0000000145b4c2b0 4839d6                           cmp rsi, rdx
0000000145b4c2b3 0f8380000000                     jae 0x145b4c339
0000000145b4c2b9 488b87f8090000                   mov rax, qword ptr [rdi + 0x9f8]
0000000145b4c2c0 460f13443040                     movlps qword ptr [rax + r14 + 0x40], xmm8
0000000145b4c2c6 f3460f114c3048                   movss dword ptr [rax + r14 + 0x48], xmm9
0000000145b4c2cd f3420f117c304c                   movss dword ptr [rax + r14 + 0x4c], xmm7
0000000145b4c2d4 f3420f11743050                   movss dword ptr [rax + r14 + 0x50], xmm6
0000000145b4c2db f3460f11543054                   movss dword ptr [rax + r14 + 0x54], xmm10
0000000145b4c2e2 f3460f115c3058                   movss dword ptr [rax + r14 + 0x58], xmm11
0000000145b4c2e9 f3460f1164305c                   movss dword ptr [rax + r14 + 0x5c], xmm12
0000000145b4c2f0 0f287500                         movaps xmm6, xmmword ptr [rbp]
0000000145b4c2f4 0f287d10                         movaps xmm7, xmmword ptr [rbp + 0x10]
0000000145b4c2f8 440f284520                       movaps xmm8, xmmword ptr [rbp + 0x20]
0000000145b4c2fd 440f284d30                       movaps xmm9, xmmword ptr [rbp + 0x30]
0000000145b4c302 440f285540                       movaps xmm10, xmmword ptr [rbp + 0x40]
0000000145b4c307 440f285d50                       movaps xmm11, xmmword ptr [rbp + 0x50]
0000000145b4c30c 440f286560                       movaps xmm12, xmmword ptr [rbp + 0x60]
0000000145b4c311 440f286d70                       movaps xmm13, xmmword ptr [rbp + 0x70]
0000000145b4c316 4881c400010000                   add rsp, 0x100
0000000145b4c31d 5b                               pop rbx
0000000145b4c31e 5f                               pop rdi
0000000145b4c31f 5e                               pop rsi
0000000145b4c320 415c                             pop r12
0000000145b4c322 415e                             pop r14
0000000145b4c324 415f                             pop r15
0000000145b4c326 5d                               pop rbp
0000000145b4c327 c3                               ret 
0000000145b4c328 4c8d0529037e01                   lea r8, [rip + 0x17e0329]
0000000145b4c32f 4889f1                           mov rcx, rsi
0000000145b4c332 e8bc1d6600                       call 0x1461ae0f3
0000000145b4c337 0f0b                             ud2 
0000000145b4c339 4c8d0530037e01                   lea r8, [rip + 0x17e0330]
0000000145b4c340 4889f1                           mov rcx, rsi
0000000145b4c343 e8ab1d6600                       call 0x1461ae0f3
0000000145b4c348 0f0b                             ud2 
