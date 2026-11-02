; nearby-injured-helper
145b85e70: 488b81100a0000                   mov rax, qword ptr [rcx + 0xa10]
145b85e77: 488b91280a0000                   mov rdx, qword ptr [rcx + 0xa28]
145b85e7e: 4839c2                           cmp rdx, rax
145b85e81: 480f42c2                         cmovb rax, rdx
145b85e85: 4885c0                           test rax, rax
145b85e88: 746e                             je 0x145b85ef8
145b85e8a: f20f1081f0040000                 movsd xmm0, qword ptr [rcx + 0x4f0]
145b85e92: 488b91080a0000                   mov rdx, qword ptr [rcx + 0xa08]
145b85e99: 4c8b81200a0000                   mov r8, qword ptr [rcx + 0xa20]
145b85ea0: 488b89800b0000                   mov rcx, qword ptr [rcx + 0xb80]
145b85ea7: 4531c9                           xor r9d, r9d
145b85eaa: f30f100de6485f00                 movss xmm1, dword ptr [rip + 0x5f48e6]
145b85eb2: f30f10158e7c5f00                 movss xmm2, dword ptr [rip + 0x5f7c8e]
145b85eba: eb10                             jmp 0x145b85ecc
145b85ebc: 0f1f4000                         nop dword ptr [rax]
145b85ec0: 49ffc1                           inc r9
145b85ec3: 4883c210                         add rdx, 0x10
145b85ec7: 4c39c8                           cmp rax, r9
145b85eca: 742c                             je 0x145b85ef8
145b85ecc: 4c39c9                           cmp rcx, r9
145b85ecf: 74ef                             je 0x145b85ec0
145b85ed1: 807a0c00                         cmp byte ptr [rdx + 0xc], 0
145b85ed5: 74e9                             je 0x145b85ec0
145b85ed7: 430f2e0c88                       ucomiss xmm1, dword ptr [r8 + r9*4]
145b85edc: 76e2                             jbe 0x145b85ec0
145b85ede: f20f101a                         movsd xmm3, qword ptr [rdx]
145b85ee2: 0f5cd8                           subps xmm3, xmm0
145b85ee5: 0f59db                           mulps xmm3, xmm3
145b85ee8: f30f16e3                         movshdup xmm4, xmm3
145b85eec: f30f58e3                         addss xmm4, xmm3
145b85ef0: 0f2ed4                           ucomiss xmm2, xmm4
145b85ef3: 72cb                             jb 0x145b85ec0
145b85ef5: b001                             mov al, 1
145b85ef7: c3                               ret
145b85ef8: 31c0                             xor eax, eax
145b85efa: c3                               ret

; local-healing-admission-snapshot
145b85a14: 410fb68e8a0c0000                 movzx ecx, byte ptr [r14 + 0xc8a]
145b85a1c: 80f901                           cmp cl, 1
145b85a1f: 418b96f8040000                   mov edx, dword ptr [r14 + 0x4f8]
145b85a26: 895608                           mov dword ptr [rsi + 8], edx
145b85a29: 498b96f0040000                   mov rdx, qword ptr [r14 + 0x4f0]
145b85a30: 488916                           mov qword ptr [rsi], rdx
145b85a33: 0f94460c                         sete byte ptr [rsi + 0xc]
145b85a37: f3410f108608050000               movss xmm0, dword ptr [r14 + 0x508]
145b85a40: f3410f108ea0040000               movss xmm1, dword ptr [r14 + 0x4a0]
145b85a49: f30f5f0d43e15d00                 maxss xmm1, dword ptr [rip + 0x5de143]
145b85a51: 48c745f801000000                 mov qword ptr [rbp - 8], 1
145b85a59: f30f5ec1                         divss xmm0, xmm1
145b85a5d: f30f1100                         movss dword ptr [rax], xmm0
145b85a61: 48c745d801000000                 mov qword ptr [rbp - 0x28], 1

; remote-healing-admission-snapshot
145b243d3: 488b1e                           mov rbx, qword ptr [rsi]
145b243d6: 4c8da7f0040000                   lea r12, [rdi + 0x4f0]
145b243dd: 0fb6af8a0c0000                   movzx ebp, byte ptr [rdi + 0xc8a]
145b243e4: 4080fd01                         cmp bpl, 1
145b243e8: 410f94c5                         sete r13b
145b243ec: 4c8b7b10                         mov r15, qword ptr [rbx + 0x10]
145b243f0: 4c3b3b                           cmp r15, qword ptr [rbx]
145b243f3: 7508                             jne 0x145b243fd
145b243f5: 4889d9                           mov rcx, rbx
145b243f8: e873084a00                       call 0x145fc4c70
145b243fd: 4d8db668030000                   lea r14, [r14 + 0x368]
145b24404: 488b4308                         mov rax, qword ptr [rbx + 8]
145b24408: 4c89f9                           mov rcx, r15
145b2440b: 48c1e104                         shl rcx, 4
145b2440f: 418b542408                       mov edx, dword ptr [r12 + 8]
145b24414: 89540808                         mov dword ptr [rax + rcx + 8], edx
145b24418: 498b1424                         mov rdx, qword ptr [r12]
145b2441c: 48891408                         mov qword ptr [rax + rcx], rdx
145b24420: 44886c080c                       mov byte ptr [rax + rcx + 0xc], r13b
145b24425: 49ffc7                           inc r15
145b24428: 4c897b10                         mov qword ptr [rbx + 0x10], r15
145b2442c: 488b5e08                         mov rbx, qword ptr [rsi + 8]
145b24430: f3440f1087a0040000               movss xmm8, dword ptr [rdi + 0x4a0]
145b24439: f30f10bf08050000                 movss xmm7, dword ptr [rdi + 0x508]
145b24441: 488b7b10                         mov rdi, qword ptr [rbx + 0x10]
145b24445: 483b3b                           cmp rdi, qword ptr [rbx]
145b24448: 7508                             jne 0x145b24452
145b2444a: 4889d9                           mov rcx, rbx
145b2444d: e8ee514700                       call 0x145f99640
145b24452: f3440f5f0539f76300               maxss xmm8, dword ptr [rip + 0x63f739]
145b2445b: f3410f5ef8                       divss xmm7, xmm8
145b24460: 488b4308                         mov rax, qword ptr [rbx + 8]
145b24464: f30f113cb8                       movss dword ptr [rax + rdi*4], xmm7
145b24469: 48ffc7                           inc rdi
145b2446c: 48897b10                         mov qword ptr [rbx + 0x10], rdi

; remote-active-hero-tick-gate
145b221e2: 80be8a0c000001                   cmp byte ptr [rsi + 0xc8a], 1
145b221e9: 7537                             jne 0x145b22222
145b221eb: 498b18                           mov rbx, qword ptr [r8]
145b221ee: f30f100b                         movss xmm1, dword ptr [rbx]
145b221f2: 4889f1                           mov rcx, rsi
145b221f5: e8e6b40600                       call 0x145b8d6e0
145b221fa: f30f100b                         movss xmm1, dword ptr [rbx]
145b221fe: 4889f1                           mov rcx, rsi
145b22201: e8da310a00                       call 0x145bc53e0
145b22206: f30f100b                         movss xmm1, dword ptr [rbx]
145b2220a: 4889f1                           mov rcx, rsi
145b2220d: e85ea90c00                       call 0x145becb70
145b22212: 4889f1                           mov rcx, rsi
145b22215: e876e40900                       call 0x145bc0690
145b2221a: 4889f1                           mov rcx, rsi
145b2221d: e88ebb0900                       call 0x145bbddb0

; raw-and-scaled-cast-duration
145bb9c80: f3440f104658                     movss xmm8, dword ptr [rsi + 0x58]
145bb9c86: f30f1035d6a45a00                 movss xmm6, dword ptr [rip + 0x5aa4d6]
145bb9c8e: f3410f59f0                       mulss xmm6, xmm8
145bb9c93: f3410f59742420                   mulss xmm6, dword ptr [r12 + 0x20]
145bb9c9a: f3450f10642448                   movss xmm12, dword ptr [r12 + 0x48]
145bb9ca1: f3410f59f4                       mulss xmm6, xmm12
145bb9ca6: f30f5f3566ad5b00                 maxss xmm6, dword ptr [rip + 0x5bad66]
145bb9cae: f3440f1097dc0b0000               movss xmm10, dword ptr [rdi + 0xbdc]
