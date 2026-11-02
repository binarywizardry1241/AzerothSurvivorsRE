14584b690 push rbp
14584b691 push r15
14584b693 push r14
14584b695 push r13
14584b697 push r12
14584b699 push rsi
14584b69a push rdi
14584b69b push rbx
14584b69c sub rsp, 0x368
14584b6a3 lea rbp, [rsp + 0x80]
14584b6ab movdqa xmmword ptr [rbp + 0x2d0], xmm8
14584b6b4 movaps xmmword ptr [rbp + 0x2c0], xmm7
14584b6bb movaps xmmword ptr [rbp + 0x2b0], xmm6
14584b6c2 mov qword ptr [rbp + 0x2a8], 0xfffffffffffffffe
14584b6cd mov r15, rdx
14584b6d0 mov rsi, rcx
14584b6d3 mov rax, qword ptr [rdx + 0x180]
14584b6da lea rcx, [rax - 0x800000]
14584b6e1 cmp rcx, 0x7fff00
14584b6e8 jae 0x14584bb2c
14584b6ee movzx edi, byte ptr [r15 + 0x1db]
14584b6f6 lea ecx, [rdi - 1]
14584b6f9 cmp cl, 0xa
14584b6fc ja 0x14584bb2c
14584b702 movzx edx, cl
14584b705 mov ecx, 0x5df
14584b70a bt ecx, edx
14584b70d jae 0x14584bb2c
14584b713 shl edx, 3
14584b716 lea rcx, [rip + 0x17c05a3]
14584b71d mov rcx, qword ptr [rdx + rcx]
14584b721 lea r8, [rip + 0x17c05f0]
14584b728 mov rdx, qword ptr [rdx + r8]
14584b72c movzx ebx, byte ptr [r15 + 0x1dc]
14584b734 xor r8d, r8d
14584b737 nop word ptr [rax + rax]
14584b740 cmp byte ptr [rdx + r8], bl
14584b744 je 0x14584b753
14584b746 inc r8
14584b749 cmp rcx, r8
14584b74c jne 0x14584b740
14584b74e jmp 0x14584bb2c
14584b753 test rax, rax
14584b756 je 0x14584bb2c
14584b75c cmp qword ptr [r15 + 0x10], 0
14584b761 je 0x14584bb2c
14584b767 mov r14b, byte ptr [r15 + 0x1dd]
14584b76e movzx eax, byte ptr [r15 + 0x1e2]
14584b776 mov byte ptr [rbp + 0x274], al
14584b77c mov eax, dword ptr [r15 + 0x1de]
14584b783 mov dword ptr [rbp + 0x270], eax
14584b789 lea rcx, [rbp + 0x1d0]
14584b790 mov qword ptr [rbp + 0x298], r15
14584b797 mov rdx, r15
14584b79a call 0x145ce7810
14584b79f nop
14584b7a0 lea rcx, [rbp + 0x98]
14584b7a7 call 0x145837af0
14584b7ac nop
14584b7ad mov byte ptr [rbp + 0x258], dil
14584b7b4 mov byte ptr [rbp + 0x259], bl
14584b7ba mov byte ptr [rbp + 0x25a], r14b
14584b7c1 movups xmm0, xmmword ptr [rbp + 0x1d0]
14584b7c8 movaps xmmword ptr [rbp + 0x220], xmm0
14584b7cf mov rax, qword ptr [rbp + 0x1e0]
14584b7d6 mov qword ptr [rbp + 0x230], rax
14584b7dd movdqu xmm0, xmmword ptr [rbp + 0xb0]
14584b7e5 movdqu xmm1, xmmword ptr [rbp + 0xc0]
14584b7ed movdqu xmmword ptr [rbp + 0x238], xmm0
14584b7f5 movdqu xmmword ptr [rbp + 0x248], xmm1
14584b7fd mov eax, dword ptr [rbp + 0x270]
14584b803 mov dword ptr [rbp + 0x25b], eax
14584b809 movzx eax, byte ptr [rbp + 0x274]
14584b810 mov byte ptr [rbp + 0x25f], al
14584b816 lea rcx, [rbp + 0x1d0]
14584b81d lea rdx, [rbp + 0x220]
14584b824 call 0x1458367c0
14584b829 nop
14584b82a mov rdx, qword ptr [rbp + 0x98]
14584b831 test rdx, rdx
14584b834 je 0x14584b848
14584b836 mov rcx, qword ptr [rbp + 0xa0]
14584b83d mov r8d, 1
14584b843 call 0x1400021d0
14584b848 mov rcx, qword ptr [rbp + 0x298]
14584b84f lea rbx, [rcx + 0x188]
14584b856 lea rax, [rcx + 0x1d4]
14584b85d lea rdi, [rcx + 0xb8]
14584b864 lea r14, [rcx + 0x150]
14584b86b mov qword ptr [rbp + 0xc8], rbx
14584b872 mov qword ptr [rbp + 0xd0], rax
14584b879 mov qword ptr [rbp + 0x98], 0
14584b884 mov qword ptr [rbp + 0xa8], 0
14584b88f mov qword ptr [rbp + 0xb8], rdi
14584b896 mov qword ptr [rbp + 0xc0], r14
14584b89d mov byte ptr [rbp + 0x2a6], 1
14584b8a4 lea rcx, [rbp + 0x1b8]
14584b8ab lea rdx, [rbp + 0x98]
14584b8b2 call 0x1459cd680
14584b8b7 nop
14584b8b8 mov r15, qword ptr [rbp + 0x298]
14584b8bf movzx eax, byte ptr [r15 + 0x1db]
14584b8c7 mov byte ptr [rbp + 0x94], al
14584b8cd movups xmm0, xmmword ptr [rbx]
14584b8d0 movdqu xmm1, xmmword ptr [rbx + 0x10]
14584b8d5 movdqu xmm2, xmmword ptr [rbx + 0x20]
14584b8da movdqu xmm3, xmmword ptr [rbx + 0x30]
14584b8df movups xmmword ptr [rbp + 0x48], xmm0
14584b8e3 movdqu xmmword ptr [rbp + 0x58], xmm1
14584b8e8 movdqu xmmword ptr [rbp + 0x68], xmm2
14584b8ed movdqu xmmword ptr [rbp + 0x78], xmm3
14584b8f2 movdqu xmm0, xmmword ptr [rbx + 0x3c]
14584b8f7 movdqu xmmword ptr [rbp + 0x84], xmm0
14584b8ff lea rbx, [rbp - 0x50]
14584b903 mov r8d, 0x98
14584b909 mov rcx, rbx
14584b90c mov rdx, rdi
14584b90f call 0x145d145fb
14584b914 mov r8, qword ptr [rbp + 0x1c0]
14584b91b mov r9, qword ptr [rbp + 0x1c8]
14584b922 movzx eax, byte ptr [rbp + 0x209]
14584b929 mov byte ptr [rbp + 0x2a7], 1
14584b930 mov byte ptr [rsp + 0x20], al
14584b934 lea rcx, [rbp + 0x98]
14584b93b mov rdx, rbx
14584b93e call 0x14582a070
14584b943 nop
14584b944 movzx eax, byte ptr [r15 + 0x1db]
14584b94c mov rcx, qword ptr [r15 + 0x20]
14584b950 mov rdx, qword ptr [r15 + 0x28]
14584b954 mov byte ptr [rbp + 0x2a4], al
14584b95a lea rax, [rbp + 0x2a4]
14584b961 mov qword ptr [rbp + 0x220], rax
14584b968 mov qword ptr [rbp + 0x228], 0
14584b973 mov qword ptr [rbp + 0x230], rdx
14584b97a mov qword ptr [rbp + 0x238], rcx
14584b981 mov qword ptr [rbp + 0x240], rdx
14584b988 mov qword ptr [rbp + 0x248], 0
14584b993 mov qword ptr [rbp + 0x250], rdx
14584b99a movabs rax, 0x2c0000002c
14584b9a4 mov qword ptr [rbp + 0x258], rax
14584b9ab mov byte ptr [rbp + 0x260], 1
14584b9b2 mov word ptr [rbp + 0x268], 1
14584b9bb mov byte ptr [rbp + 0x2a7], 1
14584b9c2 lea rcx, [rbp + 0x270]
14584b9c9 lea rdx, [rbp + 0x220]
14584b9d0 call 0x1459c70e0
14584b9d5 nop
14584b9d6 movzx r8d, byte ptr [r15 + 0x1db]
14584b9de mov byte ptr [rbp + 0x2a7], 1
14584b9e5 lea rcx, [rbp + 0x220]
14584b9ec lea rdx, [rbp + 0x270]
14584b9f3 mov r9d, 0x33
14584b9f9 call 0x1458576c0
14584b9fe nop
14584b9ff lea rcx, [rbp + 0x270]
14584ba06 lea rdx, [rbp + 0x220]
14584ba0d call 0x1458575c0
14584ba12 nop
14584ba13 mov rdx, qword ptr [rbp + 0x220]
14584ba1a test rdx, rdx
14584ba1d mov rdi, qword ptr [rbp + 0x298]
14584ba24 je 0x14584ba3c
14584ba26 mov rcx, qword ptr [rbp + 0x228]
14584ba2d shl rdx, 4
14584ba31 mov r8d, 8
14584ba37 call 0x1400021d0
14584ba3c movdqu xmm0, xmmword ptr [r14]
14584ba41 movdqu xmm1, xmmword ptr [r14 + 0x10]
14584ba47 movdqa xmmword ptr [rbp + 0x180], xmm0
14584ba4f movdqa xmmword ptr [rbp + 0x190], xmm1
14584ba57 movq xmm6, qword ptr [rdi + 0x170]
14584ba5f mov ebx, dword ptr [rdi + 0x17c]
14584ba65 cmp bl, 3
14584ba68 mov r14d, 3
14584ba6e cmovae ebx, r14d
14584ba72 movzx eax, byte ptr [rdi + 0x17d]
14584ba79 cmp al, 3
14584ba7b cmovb r14d, eax
14584ba7f movzx r15d, word ptr [rdi + 0x17e]
14584ba87 xorps xmm7, xmm7
14584ba8a maxss xmm7, dword ptr [rdi + 0x178]
14584ba92 mov rdx, qword ptr [rbp + 0x1d0]
14584ba99 mov rax, qword ptr [rbp + 0x1d8]
14584baa0 mov qword ptr [rbp + 0x218], rax
14584baa7 mov rax, qword ptr [rbp + 0x1e0]
14584baae mov qword ptr [rbp + 0x1a8], rax
14584bab5 movzx r12d, byte ptr [rbp + 0x20a]
14584babd movzx eax, byte ptr [rbp + 0x20f]
14584bac4 mov byte ptr [rbp + 0x224], al
14584baca mov eax, dword ptr [rbp + 0x20b]
14584bad0 mov dword ptr [rbp + 0x220], eax
14584bad6 mov rax, qword ptr [rbp + 0x270]
14584badd mov qword ptr [rbp + 0x1a0], rax
14584bae4 mov rax, qword ptr [rbp + 0x278]
14584baeb mov qword ptr [rbp + 0x1b0], rax
14584baf2 mov r13d, dword ptr [rdi + 0x1d4]
14584baf9 mov eax, dword ptr [rip + 0x29cb7f1]
14584baff mov rcx, qword ptr gs:[0x58]
14584bb08 mov rax, qword ptr [rcx + rax*8]
14584bb0c cmp byte ptr [rax + 0x330], 0
14584bb13 mov qword ptr [rbp + 0x210], rdx
14584bb1a je 0x14584bc16
14584bb20 mov rax, qword ptr [rax + 0x338]
14584bb27 jmp 0x14584bc1d
14584bb2c mov qword ptr [rsi], 0xffffffffffffffff
14584bb33 mov rdx, qword ptr [r15]
14584bb36 test rdx, rdx
14584bb39 je 0x14584bb4a
14584bb3b mov rcx, qword ptr [r15 + 8]
14584bb3f mov r8d, 1
14584bb45 call 0x1400021d0
14584bb4a mov rdx, qword ptr [r15 + 0x18]
14584bb4e test rdx, rdx
14584bb51 je 0x14584bb62
14584bb53 mov rcx, qword ptr [r15 + 0x20]
14584bb57 mov r8d, 1
14584bb5d call 0x1400021d0
14584bb62 mov rdx, qword ptr [r15 + 0x48]
14584bb66 cmp rdx, -1
14584bb6a je 0x14584bbd1
14584bb6c test rdx, rdx
14584bb6f je 0x14584bb80
14584bb71 mov rcx, qword ptr [r15 + 0x50]
14584bb75 mov r8d, 1
14584bb7b call 0x1400021d0
14584bb80 mov rdx, qword ptr [r15 + 0x60]
14584bb84 test rdx, rdx
14584bb87 je 0x14584bb98
14584bb89 mov rcx, qword ptr [r15 + 0x68]
14584bb8d mov r8d, 1
14584bb93 call 0x1400021d0
14584bb98 mov rdx, qword ptr [r15 + 0x78]
14584bb9c test rdx, rdx
14584bb9f je 0x14584bbb3
14584bba1 mov rcx, qword ptr [r15 + 0x80]
14584bba8 mov r8d, 1
14584bbae call 0x1400021d0
14584bbb3 mov rdx, qword ptr [r15 + 0x90]
14584bbba test rdx, rdx
14584bbbd je 0x14584bbd1
14584bbbf mov rcx, qword ptr [r15 + 0x98]
14584bbc6 mov r8d, 1
14584bbcc call 0x1400021d0
14584bbd1 mov rdx, qword ptr [r15 + 0x30]
14584bbd5 test rdx, rdx
14584bbd8 je 0x14584bbe9
14584bbda mov rcx, qword ptr [r15 + 0x38]
14584bbde mov r8d, 1
14584bbe4 call 0x1400021d0
14584bbe9 mov rax, rsi
14584bbec movaps xmm6, xmmword ptr [rbp + 0x2b0]
14584bbf3 movaps xmm7, xmmword ptr [rbp + 0x2c0]
14584bbfa movaps xmm8, xmmword ptr [rbp + 0x2d0]
14584bc02 add rsp, 0x368
14584bc09 pop rbx
14584bc0a pop rdi
14584bc0b pop rsi
14584bc0c pop r12
14584bc0e pop r13
14584bc10 pop r14
14584bc12 pop r15
14584bc14 pop rbp
14584bc15 ret
14584bc16 mov rax, qword ptr [rip + 0x29cb543]
14584bc1d cmp rax, 0xd
14584bc21 mov ecx, 0xd
14584bc26 cmovb rcx, rax
14584bc2a shl ecx, 5
14584bc2d lea rax, [rip + 0x29c88ec]
14584bc34 lea rdi, [rax + rcx]
14584bc38 mov eax, dword ptr [rcx + rax + 0x18]
14584bc3c test eax, eax
14584bc3e jne 0x14584c04b
14584bc44 mov rax, qword ptr [rdi + 0x10]
14584bc48 test rax, rax
14584bc4b je 0x14584bc68
14584bc4d mov rcx, qword ptr [rdi + 8]
14584bc51 cmp rax, 8
14584bc55 mov r10, qword ptr [rbp + 0x298]
14584bc5c jae 0x14584bc77
14584bc5e xor edx, edx
14584bc60 xor r8d, r8d
14584bc63 jmp 0x14584bd1e
14584bc68 xor r13d, r13d
14584bc6b mov r10, qword ptr [rbp + 0x298]
14584bc72 jmp 0x14584bd43
14584bc77 mov rdx, rax
14584bc7a and rdx, 0xfffffffffffffff8
14584bc7e lea r8, [rcx + 0x378]
14584bc85 pxor xmm0, xmm0
14584bc89 mov r9, rdx
14584bc8c pxor xmm1, xmm1
14584bc90 movd xmm2, dword ptr [r8 - 0x1c0]
14584bc99 movd xmm3, dword ptr [r8 - 0x230]
14584bca2 punpckldq xmm3, xmm2
14584bca6 movd xmm2, dword ptr [r8 - 0x2a0]
14584bcaf movd xmm4, dword ptr [r8 - 0x310]
14584bcb8 punpckldq xmm4, xmm2
14584bcbc punpcklqdq xmm4, xmm3
14584bcc0 paddd xmm1, xmm4
14584bcc4 movd xmm2, dword ptr [r8]
14584bcc9 movd xmm3, dword ptr [r8 - 0x70]
14584bccf punpckldq xmm3, xmm2
14584bcd3 movd xmm2, dword ptr [r8 - 0xe0]
14584bcdc movd xmm4, dword ptr [r8 - 0x150]
14584bce5 punpckldq xmm4, xmm2
14584bce9 punpcklqdq xmm4, xmm3
14584bced paddd xmm0, xmm4
14584bcf1 add r8, 0x380
14584bcf8 add r9, -8
14584bcfc jne 0x14584bc90
14584bcfe paddd xmm0, xmm1
14584bd02 pshufd xmm1, xmm0, 0xee
14584bd07 paddd xmm1, xmm0
14584bd0b pshufd xmm0, xmm1, 0x55
14584bd10 paddd xmm0, xmm1
14584bd14 movd r8d, xmm0
14584bd19 cmp rax, rdx
14584bd1c je 0x14584bd3c
14584bd1e sub rax, rdx
14584bd21 imul rdx, rdx, 0x70
14584bd25 add rcx, rdx
14584bd28 add rcx, 0x68
14584bd2c nop dword ptr [rax]
14584bd30 add r8d, dword ptr [rcx]
14584bd33 add rcx, 0x70
14584bd37 dec rax
14584bd3a jne 0x14584bd30
14584bd3c cmp r8d, r13d
14584bd3f cmovb r13d, r8d
14584bd43 mov byte ptr [rbp + 0x2a5], r12b
14584bd4a movzx eax, byte ptr [r10 + 0x1e3]
14584bd52 test al, al
14584bd54 mov dword ptr [rbp + 0x288], ebx
14584bd5a mov dword ptr [rbp + 0x28c], r14d
14584bd61 mov word ptr [rbp + 0x296], r15w
14584bd69 mov dword ptr [rbp + 0x290], r13d
14584bd70 je 0x14584bd83
14584bd72 movzx ecx, al
14584bd75 cmp al, 0xc
14584bd77 mov r12d, 0xc
14584bd7d cmovb r12d, ecx
14584bd81 jmp 0x14584bd86
14584bd83 mov r12b, 1
14584bd86 mov rcx, qword ptr [r10 + 0x38]
14584bd8a mov rdx, qword ptr [r10 + 0x40]
14584bd8e call 0x1458e1530
14584bd93 mov r14, rax
14584bd96 test rax, rax
14584bd99 mov ebx, 1
14584bd9e mov r15, rax
14584bda1 cmove r15, rbx
14584bda5 cmovne r14, rdx
14584bda9 test r14, r14
14584bdac jns 0x14584bdbb
14584bdae xor ecx, ecx
14584bdb0 mov rdx, r13
14584bdb3 call 0x145eb6fcb
14584bdb8 nop
14584bdb9 ud2
14584bdbb je 0x14584bdee
14584bdbd mov r13, rdx
14584bdc0 call 0x140002200
14584bdc5 mov edx, 1
14584bdca mov rcx, r14
14584bdcd call 0x1400021c0
14584bdd2 test rax, rax
14584bdd5 je 0x14584c059
14584bddb mov rbx, rax
14584bdde mov rcx, rax
14584bde1 mov rdx, r15
14584bde4 mov r8, r14
14584bde7 call 0x145d145fb
14584bdec jmp 0x14584bdf1
14584bdee xor r13d, r13d
14584bdf1 movdqa xmm8, xmmword ptr [rip + 0x694626]
14584bdfa pxor xmm8, xmm6
14584bdff pcmpgtd xmm8, xmmword ptr [rip + 0x1480868]
14584be08 movdqa xmm0, xmm8
14584be0d pandn xmm0, xmm6
14584be11 psrld xmm8, 0x1e
14584be17 por xmm8, xmm0
14584be1c movss xmm6, dword ptr [rip + 0x69479c]
14584be24 minss xmm6, xmm7
14584be28 lea rax, [rbp + 0x130]
14584be2f mov rdi, qword ptr [rbp + 0x298]
14584be36 mov r15, qword ptr [rdi + 0x180]
14584be3d movzx r14d, byte ptr [rdi + 0x1dc]
14584be45 movzx ecx, byte ptr [rbp + 0x224]
14584be4c mov byte ptr [rsi + 0x1e2], cl
14584be52 mov ecx, dword ptr [rbp + 0x220]
14584be58 mov dword ptr [rsi + 0x1de], ecx
14584be5e movups xmm0, xmmword ptr [rax]
14584be61 movups xmm1, xmmword ptr [rax + 0x10]
14584be65 movups xmm2, xmmword ptr [rax + 0x20]
14584be69 movups xmm3, xmmword ptr [rax + 0x30]
14584be6d movups xmmword ptr [rsi + 0x188], xmm0
14584be74 movups xmmword ptr [rsi + 0x198], xmm1
14584be7b movups xmmword ptr [rsi + 0x1a8], xmm2
14584be82 movups xmmword ptr [rsi + 0x1b8], xmm3
14584be89 movups xmm0, xmmword ptr [rax + 0x3c]
14584be8d movups xmmword ptr [rsi + 0x1c4], xmm0
14584be94 lea rcx, [rsi + 0xb8]
14584be9b lea rdx, [rbp + 0x98]
14584bea2 mov r8d, 0x98
14584bea8 call 0x145d145fb
14584bead mov rax, qword ptr [rbp + 0x280]
14584beb4 mov qword ptr [rsi + 0x28], rax
14584beb8 movups xmm0, xmmword ptr [rbp + 0x270]
14584bebf movups xmmword ptr [rsi + 0x18], xmm0
14584bec3 movaps xmm0, xmmword ptr [rbp + 0x180]
14584beca movaps xmm1, xmmword ptr [rbp + 0x190]
14584bed1 movups xmmword ptr [rsi + 0x150], xmm0
14584bed8 movups xmmword ptr [rsi + 0x160], xmm1
14584bedf movups xmm0, xmmword ptr [rdi + 0x48]
14584bee3 movups xmm1, xmmword ptr [rdi + 0x58]
14584bee7 movups xmm2, xmmword ptr [rdi + 0x68]
14584beeb movups xmm3, xmmword ptr [rdi + 0x78]
14584beef movups xmmword ptr [rsi + 0x48], xmm0
14584bef3 movups xmmword ptr [rsi + 0x58], xmm1
14584bef7 movups xmmword ptr [rsi + 0x68], xmm2
14584befb movups xmmword ptr [rsi + 0x78], xmm3
14584beff movups xmm0, xmmword ptr [rdi + 0x88]
14584bf06 movups xmmword ptr [rsi + 0x88], xmm0
14584bf0d movups xmm0, xmmword ptr [rdi + 0x98]
14584bf14 movups xmmword ptr [rsi + 0x98], xmm0
14584bf1b movups xmm0, xmmword ptr [rdi + 0xa8]
14584bf22 movups xmmword ptr [rsi + 0xa8], xmm0
14584bf29 mov rax, qword ptr [rbp + 0x210]
14584bf30 mov qword ptr [rsi], rax
14584bf33 mov rax, qword ptr [rbp + 0x218]
14584bf3a mov qword ptr [rsi + 8], rax
14584bf3e mov rax, qword ptr [rbp + 0x1a8]
14584bf45 mov qword ptr [rsi + 0x10], rax
14584bf49 mov qword ptr [rsi + 0x30], r13
14584bf4d mov qword ptr [rsi + 0x38], rbx
14584bf51 mov qword ptr [rsi + 0x40], r13
14584bf55 movq qword ptr [rsi + 0x170], xmm8
14584bf5e movss dword ptr [rsi + 0x178], xmm6
14584bf66 mov eax, dword ptr [rbp + 0x288]
14584bf6c mov byte ptr [rsi + 0x17c], al
14584bf72 mov eax, dword ptr [rbp + 0x28c]
14584bf78 mov byte ptr [rsi + 0x17d], al
14584bf7e movzx eax, word ptr [rbp + 0x296]
14584bf85 mov word ptr [rsi + 0x17e], ax
14584bf8c mov qword ptr [rsi + 0x180], r15
14584bf93 mov eax, dword ptr [rbp + 0x290]
14584bf99 mov dword ptr [rsi + 0x1d4], eax
14584bf9f mov eax, dword ptr [rdi + 0x1d8]
14584bfa5 mov dword ptr [rsi + 0x1d8], eax
14584bfab mov byte ptr [rsi + 0x1dc], r14b
14584bfb2 movzx eax, byte ptr [rbp + 0x2a5]
14584bfb9 mov byte ptr [rsi + 0x1dd], al
14584bfbf mov byte ptr [rsi + 0x1e3], r12b
14584bfc6 mov rdx, qword ptr [rbp + 0x1b8]
14584bfcd test rdx, rdx
14584bfd0 je 0x14584bfe8
14584bfd2 mov rcx, qword ptr [rbp + 0x1c0]
14584bfd9 shl rdx, 2
14584bfdd mov r8d, 4
14584bfe3 call 0x1400021d0
14584bfe8 mov rdx, qword ptr [rbp + 0x1e8]
14584bfef test rdx, rdx
14584bff2 je 0x14584c006
14584bff4 mov rcx, qword ptr [rbp + 0x1f0]
14584bffb mov r8d, 1
14584c001 call 0x1400021d0
14584c006 mov rdx, qword ptr [rdi]
14584c009 test rdx, rdx
14584c00c je 0x14584c01d
14584c00e mov rcx, qword ptr [rdi + 8]
14584c012 mov r8d, 1
14584c018 call 0x1400021d0
14584c01d mov rdx, qword ptr [rdi + 0x18]
14584c021 test rdx, rdx
14584c024 je 0x14584c035
14584c026 mov rcx, qword ptr [rdi + 0x20]
14584c02a mov r8d, 1
14584c030 call 0x1400021d0
14584c035 mov rdx, qword ptr [rdi + 0x30]
14584c039 test rdx, rdx
14584c03c je 0x14584bbe9
14584c042 mov rcx, qword ptr [rdi + 0x38]
14584c046 jmp 0x14584bbde
14584c04b mov rcx, rdi
14584c04e call 0x145e981dd
14584c053 nop
14584c054 jmp 0x14584bc44
14584c059 mov ecx, 1
14584c05e jmp 0x14584bdb0
