00000001402cbc35 movzx edx, byte ptr [rax + 0x38]
00000001402cbc39 dec dl
00000001402cbc3b mov eax, 1
00000001402cbc40 lea rcx, [rip + 0x5c32130]
00000001402cbc47 cmp dl, 0xa
00000001402cbc4a ja 0x1402cbc68
00000001402cbc4c movzx ecx, dl
00000001402cbc4f lea rax, [rip + 0x5c3708a]
00000001402cbc56 mov rax, qword ptr [rax + rcx*8]
00000001402cbc5a lea rdx, [rip + 0x5c370d7]
00000001402cbc61 movsxd rcx, dword ptr [rdx + rcx*4]
00000001402cbc65 add rcx, rdx
00000001402cbc68 dec rax
00000001402cbc6b xor edx, edx
00000001402cbc6d lea rsi, [rbp + 0x460]
00000001402cbc74 nop word ptr cs:[rax + rax]
00000001402cbc80 movzx r14d, byte ptr [rcx + rdx]
00000001402cbc85 cmp r14b, dil
00000001402cbc88 je 0x1402cbc93
00000001402cbc8a cmp rax, rdx
00000001402cbc8d lea rdx, [rdx + 1]
00000001402cbc91 jne 0x1402cbc80
00000001402cbc93 mov rax, qword ptr [rbp + 0xb00]
00000001402cbc9a movzx r13d, byte ptr [rax + 0x39]
00000001402cbc9f mov word ptr [rbp + 0x9a4], 0
00000001402cbca8 mov byte ptr [rbp + 0x994], 1
00000001402cbcaf movups xmmword ptr [rbx + 0x78], xmm14
00000001402cbcb4 movups xmmword ptr [rbx + 0x68], xmm14
00000001402cbcb9 movups xmmword ptr [rbp + 0x8c8], xmm7
00000001402cbcc0 mov qword ptr [rbp + 0x8a0], 0
00000001402cbccb movups xmmword ptr [rbx + 0xa8], xmm14
00000001402cbcd3 movups xmmword ptr [rbx + 0x98], xmm14
00000001402cbcdb mov word ptr [rbx + 0x17c], 0
00000001402cbce4 mov dword ptr [rbx + 0x178], 0
00000001402cbcee movups xmm0, xmmword ptr [rip + 0x5c31da3]
00000001402cbcf5 movups xmmword ptr [rbx + 0xc8], xmm0
00000001402cbcfc movups xmm0, xmmword ptr [rip + 0x5c31d85]
00000001402cbd03 movups xmmword ptr [rbx + 0xb8], xmm0
00000001402cbd0a movups xmmword ptr [rbx + 0xd8], xmm13
00000001402cbd12 movups xmmword ptr [rbx + 0xe8], xmm11
00000001402cbd1a movups xmmword ptr [rbp + 0x938], xmm8
00000001402cbd22 movups xmmword ptr [rbp + 0x948], xmm8
00000001402cbd2a movups xmmword ptr [rbp + 0x958], xmm9
00000001402cbd32 movups xmmword ptr [rbp + 0x968], xmm9
00000001402cbd3a mov word ptr [rbp + 0x9b6], 0
00000001402cbd43 mov dword ptr [rbp + 0x9b2], 0
00000001402cbd4d mov qword ptr [rbp + 0x998], 0
00000001402cbd58 mov dword ptr [rbp + 0x9a0], 0x3f800000
00000001402cbd62 movaps xmm0, xmmword ptr [rip + 0x5bd62c7]
00000001402cbd69 movups xmmword ptr [rbp + 0x978], xmm0
00000001402cbd70 mov dword ptr [rbp + 0x988], 1
00000001402cbd7a mov qword ptr [rbp + 0x98c], 0
00000001402cbd85 movups xmm0, xmmword ptr [rip + 0x5c31c44]
00000001402cbd8c movaps xmmword ptr [rbp + 0x840], xmm0
00000001402cbd93 mov qword ptr [rbp + 0x850], 0
00000001402cbd9e movups xmm0, xmmword ptr [rip + 0x5c31c43]
00000001402cbda5 movups xmmword ptr [rbx + 0x18], xmm0
00000001402cbda9 mov qword ptr [rbx + 0x28], 0
00000001402cbdb1 movups xmm0, xmmword ptr [rip + 0x5c31c48]
00000001402cbdb8 movups xmmword ptr [rbx + 0x30], xmm0
00000001402cbdbc mov qword ptr [rbx + 0x40], 0
00000001402cbdc4 movups xmm0, xmmword ptr [rip + 0x5c31c4d]
00000001402cbdcb movups xmmword ptr [rbx + 0x48], xmm0
00000001402cbdcf mov qword ptr [rbx + 0x58], 0
00000001402cbdd7 mov dword ptr [rbx + 0x166], 0x10000
00000001402cbde1 mov word ptr [rbx + 0x16a], 0
00000001402cbdea mov word ptr [rbx + 0x170], 0
00000001402cbdf3 mov dword ptr [rbx + 0x16c], 0x10000
00000001402cbdfd cmp dil, r13b
00000001402cbe00 je 0x1402cbe10
00000001402cbe02 movups xmm0, xmmword ptr [rip + 0x5c31f6f]
00000001402cbe09 jmp 0x1402cbe17
00000001402cbe0b nop dword ptr [rax + rax]
00000001402cbe10 movups xmm0, xmmword ptr [rip + 0x5c31b31]
00000001402cbe17 movaps xmmword ptr [rbp + 0x820], xmm0
00000001402cbe1e mov dword ptr [rbp + 0x830], 0x3f800000
00000001402cbe28 mov eax, dword ptr [rbp + 0x830]
00000001402cbe2e mov dword ptr [rbp + 0x3c0], eax
00000001402cbe34 movaps xmm0, xmmword ptr [rbp + 0x820]
00000001402cbe3b movaps xmmword ptr [rbp + 0x3b0], xmm0
00000001402cbe42 lea rcx, [rbp + 0x3c4]
00000001402cbe49 mov dword ptr [rcx + 0x10], eax
00000001402cbe4c movups xmmword ptr [rcx], xmm0
00000001402cbe4f mov eax, dword ptr [rbp + 0x830]
00000001402cbe55 mov dword ptr [rcx + 0x24], eax
00000001402cbe58 movaps xmm0, xmmword ptr [rbp + 0x820]
00000001402cbe5f movups xmmword ptr [rcx + 0x14], xmm0
00000001402cbe63 mov eax, dword ptr [rbp + 0x830]
00000001402cbe69 mov dword ptr [rcx + 0x38], eax
00000001402cbe6c movaps xmm0, xmmword ptr [rbp + 0x820]
00000001402cbe73 movups xmmword ptr [rcx + 0x28], xmm0
00000001402cbe77 call 0x140002200
00000001402cbe7c mov ecx, 0x42
00000001402cbe81 mov edx, 1
00000001402cbe86 call 0x1400021c0
00000001402cbe8b test rax, rax
00000001402cbe8e je 0x1402cdaec
00000001402cbe94 movups xmm0, xmmword ptr [rip + 0x5c31f21]
00000001402cbe9b movups xmmword ptr [rax + 0x30], xmm0
00000001402cbe9f movups xmm0, xmmword ptr [rip + 0x5c31f06]
00000001402cbea6 movups xmmword ptr [rax + 0x20], xmm0
00000001402cbeaa movups xmm0, xmmword ptr [rip + 0x5c31eeb]
00000001402cbeb1 movups xmmword ptr [rax + 0x10], xmm0
00000001402cbeb5 movups xmm0, xmmword ptr [rip + 0x5c31ed0]
00000001402cbebc movups xmmword ptr [rax], xmm0
00000001402cbebf mov word ptr [rax + 0x40], 0x706c
00000001402cbec5 mov qword ptr [rbp + 0x4d8], 0x42
00000001402cbed0 mov qword ptr [rbp + 0x4e0], rax
00000001402cbed7 mov qword ptr [rbp + 0x4e8], 0x42
00000001402cbee2 lea rax, [rip + 0x5c1664f]
00000001402cbee9 mov qword ptr [rsp + 0x20], rax
00000001402cbeee mov r9d, 1
00000001402cbef4 mov rcx, rsi
00000001402cbef7 mov rdx, qword ptr [rbp + 0x800]
00000001402cbefe lea r8, [rbp + 0x4d8]
00000001402cbf05 call 0x140159a10
00000001402cbf0a nop
00000001402cbf0b mov rax, qword ptr [r15 + 0x18]
00000001402cbf0f add rax, -5
00000001402cbf13 cmp rax, 3
00000001402cbf17 ja 0x1402cc021
00000001402cbf1d lea rcx, [rip + 0x5c3710c]
00000001402cbf24 movsxd rax, dword ptr [rcx + rax*4]
00000001402cbf28 add rax, rcx
00000001402cbf2b jmp rax
00000001402cbf2d mov rcx, qword ptr [r15 + 0x10]
00000001402cbf31 mov edx, dword ptr [rcx]
00000001402cbf33 xor edx, dword ptr [rip + 0x5c180e2]
00000001402cbf39 movzx eax, byte ptr [rcx + 4]
00000001402cbf3d xor al, byte ptr [rip + 0x5c180dc]
00000001402cbf43 movzx r8d, al
00000001402cbf47 xor eax, eax
00000001402cbf49 or r8d, edx
00000001402cbf4c je 0x1402cc5d2
00000001402cbf52 mov edx, dword ptr [rcx]
00000001402cbf54 xor edx, dword ptr [rip + 0x5c180c6]
00000001402cbf5a movzx r8d, byte ptr [rcx + 4]
00000001402cbf5f xor r8b, byte ptr [rip + 0x5c180be]
00000001402cbf66 movzx r8d, r8b
00000001402cbf6a or r8d, edx
00000001402cbf6d je 0x1402cc5e7
00000001402cbf73 mov edx, dword ptr [rcx]
00000001402cbf75 xor edx, dword ptr [rip + 0x5c180aa]
00000001402cbf7b movzx r8d, byte ptr [rcx + 4]
00000001402cbf80 xor r8b, byte ptr [rip + 0x5c180a2]
00000001402cbf87 movzx r8d, r8b
00000001402cbf8b or r8d, edx
00000001402cbf8e movss xmm0, dword ptr [rip + 0x5c1619a]
00000001402cbf96 je 0x1402cc02e
00000001402cbf9c mov eax, dword ptr [rcx]
00000001402cbf9e xor eax, dword ptr [rip + 0x5c1809b]
00000001402cbfa4 movzx ecx, byte ptr [rcx + 4]
00000001402cbfa8 xor cl, byte ptr [rip + 0x5c18095]
00000001402cbfae movzx ecx, cl
00000001402cbfb1 or ecx, eax
00000001402cbfb3 jne 0x1402cc021
00000001402cbfb5 mov eax, 0x40
00000001402cbfba movss xmm0, dword ptr [rip + 0x5c1616e]
00000001402cbfc2 jmp 0x1402cc02e
00000001402cbfc4 mov rax, qword ptr [r15 + 0x10]
00000001402cbfc8 mov ecx, dword ptr [rax]
00000001402cbfca xor ecx, dword ptr [rip + 0x5c18068]
00000001402cbfd0 mov eax, dword ptr [rax + 3]
00000001402cbfd3 xor eax, dword ptr [rip + 0x5c18062]
00000001402cbfd9 or eax, ecx
00000001402cbfdb jne 0x1402cc021
00000001402cbfdd mov eax, 0x40
00000001402cbfe2 movaps xmm0, xmm6
00000001402cbfe5 jmp 0x1402cc02e
00000001402cbfe7 mov rax, qword ptr [r15 + 0x10]
00000001402cbfeb mov rcx, qword ptr [rax]
00000001402cbfee xor eax, eax
00000001402cbff0 cmp rcx, qword ptr [rip + 0x5c18033]
00000001402cbff7 setne al
00000001402cbffa shl eax, 6
00000001402cbffd jmp 0x1402cc026
00000001402cbfff mov rax, qword ptr [r15 + 0x10]
00000001402cc003 mov ecx, dword ptr [rax]
00000001402cc005 xor ecx, dword ptr [rip + 0x5c18027]
00000001402cc00b movzx eax, word ptr [rax + 4]
00000001402cc00f xor ax, word ptr [rip + 0x5c18020]
00000001402cc016 movzx eax, ax
00000001402cc019 or eax, ecx
00000001402cc01b je 0x1402cc5da
00000001402cc021 mov eax, 0x40
00000001402cc026 movss xmm0, dword ptr [rip + 0x5c161a2]
00000001402cc02e mov rcx, qword ptr [rbp + 0x408]
00000001402cc035 movzx edx, byte ptr [rcx]
00000001402cc038 xor ecx, ecx
00000001402cc03a cmp r14b, dil
00000001402cc03d sete cl
00000001402cc040 shl edx, 7
00000001402cc043 lea r8d, [rax + rdx]
00000001402cc047 cvtsi2ss xmm1, r8d
00000001402cc04c movaps xmm2, xmm0
00000001402cc04f addss xmm2, xmm6
00000001402cc053 lea eax, [rax + rdx + 0x40]
00000001402cc057 cvtsi2ss xmm3, eax
00000001402cc05b unpcklps xmm2, xmm3
00000001402cc05e unpcklps xmm0, xmm1
00000001402cc061 movaps xmm1, xmm0
00000001402cc064 minps xmm1, xmm2
00000001402cc067 maxps xmm0, xmm2
00000001402cc06a movlhps xmm1, xmm0
00000001402cc06d movups xmmword ptr [rbp + 0x5d4], xmm1
00000001402cc074 lea rax, [rip + 0x5c31365]
00000001402cc07b movss xmm0, dword ptr [rax + rcx*4]
00000001402cc080 movups xmm1, xmmword ptr [rip + 0x5c31d49]
00000001402cc087 lea r10, [rbp + 0x4d8]
00000001402cc08e movups xmmword ptr [r10 + 0x38], xmm1
00000001402cc093 mov dword ptr [r10 + 0x48], 0x3f800000
00000001402cc09b movups xmm1, xmmword ptr [rip + 0x5c31d46]
00000001402cc0a2 movups xmmword ptr [r10 + 0x20], xmm1
00000001402cc0a7 mov qword ptr [r10 + 0x30], 0x46
00000001402cc0af mov byte ptr [rbp + 0x4d8], 2
00000001402cc0b6 mov word ptr [rbp + 0x55c], 0
00000001402cc0bf mov dword ptr [rbp + 0x548], 0
00000001402cc0c9 mov dword ptr [rbp + 0x524], 2
00000001402cc0d3 mov dword ptr [rbp + 0x598], ecx
00000001402cc0d9 movss dword ptr [rbp + 0x59c], xmm0
00000001402cc0e1 movss dword ptr [rbp + 0x5a0], xmm0
00000001402cc0e9 movss dword ptr [rbp + 0x5a4], xmm0
00000001402cc0f1 mov dword ptr [rbp + 0x5a8], 0x3f800000
00000001402cc0fb mov rax, qword ptr [rbp + 0x470]
00000001402cc102 mov qword ptr [r12 + 0x30], rax
00000001402cc107 movups xmm0, xmmword ptr [rbp + 0x460]
00000001402cc10e movups xmmword ptr [r12 + 0x20], xmm0
00000001402cc114 movzx eax, byte ptr [rbp + 0x4d8]
00000001402cc11b mov rcx, qword ptr [rbp + 0x4d9]
00000001402cc122 mov edx, dword ptr [rbp + 0x4e1]
00000001402cc128 movzx r8d, word ptr [rbp + 0x4e5]
00000001402cc130 movzx r9d, byte ptr [rbp + 0x4e7]
00000001402cc138 movups xmm0, xmmword ptr [rbp + 0x4e8]
00000001402cc13f mov byte ptr [rbp + 0x560], al
00000001402cc145 mov qword ptr [rbp + 0x561], rcx
00000001402cc14c mov dword ptr [rbp + 0x569], edx
00000001402cc152 mov word ptr [rbp + 0x56d], r8w
00000001402cc15a mov byte ptr [rbp + 0x56f], r9b
00000001402cc161 movaps xmmword ptr [rbp + 0x570], xmm0
00000001402cc168 mov word ptr [rbp + 0x5e4], 0
00000001402cc171 mov dword ptr [rbp + 0x5d0], 1
00000001402cc17b movups xmm0, xmmword ptr [r10 + 0x4c]
00000001402cc180 movups xmm1, xmmword ptr [r10 + 0x5c]
00000001402cc185 movups xmmword ptr [r12 + 0x4c], xmm0
00000001402cc18b mov eax, dword ptr [r10 + 0x6c]
00000001402cc18f mov dword ptr [r12 + 0x6c], eax
00000001402cc194 movups xmmword ptr [r12 + 0x5c], xmm1
00000001402cc19a cmp dil, r13b
00000001402cc19d je 0x1402cc1d0
00000001402cc19f movups xmm0, xmmword ptr [rip + 0x5c31b0e]
00000001402cc1a6 movaps xmmword ptr [rbp + 0x440], xmm0
00000001402cc1ad mov dword ptr [rbp + 0x450], 0x3f59999a
00000001402cc1b7 xorps xmm12, xmm12
00000001402cc1bb movss xmm15, dword ptr [rip + 0x5bd610c]
00000001402cc1c4 jmp 0x1402cc1fa
00000001402cc1c6 nop word ptr cs:[rax + rax]
00000001402cc1d0 movups xmm0, xmmword ptr [rip + 0x5c31771]
00000001402cc1d7 movaps xmmword ptr [rbp + 0x440], xmm0
00000001402cc1de mov dword ptr [rbp + 0x450], 0x3f333333
00000001402cc1e8 movss xmm15, dword ptr [rip + 0x5bd5e97]
00000001402cc1f1 movss xmm12, dword ptr [rip + 0x5bd5e8a]
00000001402cc1fa mov rcx, rsi
00000001402cc1fd lea rdx, [rbp + 0x440]
00000001402cc204 call 0x144bf4410
00000001402cc209 nop
00000001402cc20a movaps xmm0, xmmword ptr [rbp + 0x460]
00000001402cc211 movups xmmword ptr [rbp + 0x328], xmm0
00000001402cc218 mov dword ptr [rbp + 0x324], 1
00000001402cc222 movss dword ptr [rsp + 0x48], xmm15
00000001402cc229 movss dword ptr [rsp + 0x38], xmm12
00000001402cc230 mov dword ptr [rsp + 0x40], 1
00000001402cc238 mov dword ptr [rsp + 0x30], 1
00000001402cc240 mov dword ptr [rsp + 0x28], 0
00000001402cc248 mov dword ptr [rsp + 0x20], 1
00000001402cc250 xorps xmm3, xmm3
00000001402cc253 mov rcx, rsi
00000001402cc256 lea rdx, [rbp + 0x324]
00000001402cc25d mov r8d, 1
00000001402cc263 call 0x1425d1670
00000001402cc268 nop
