14580a670 push rsi
14580a671 sub rsp, 0x30
14580a675 movaps xmmword ptr [rsp + 0x20], xmm6
14580a67a mov r8, rdx
14580a67d mov r9, qword ptr [rcx]
14580a680 mov rax, qword ptr [r9]
14580a683 mov rdx, qword ptr [r9 + 8]
14580a687 cmp rdx, 0xb
14580a68b je 0x14580a6c1
14580a68d cmp rdx, 0xa
14580a691 jne 0x14580a6ee
14580a693 movabs r10, 0x6974706d65646572
14580a69d xor r10, qword ptr [rax]
14580a6a0 movzx r11d, word ptr [rax + 8]
14580a6a5 xor r11, 0x6e6f
14580a6ac or r11, r10
14580a6af je 0x14580a6e1
14580a6b1 movss xmm0, dword ptr [r8 + 8]
14580a6b7 movss xmm1, dword ptr [rip + 0x6d9591]
14580a6bf jmp 0x14580a720
14580a6c1 movabs r10, 0x665f656972656166
14580a6cb xor r10, qword ptr [rax]
14580a6ce movabs r11, 0x657269665f656972
14580a6d8 xor r11, qword ptr [rax + 3]
14580a6dc or r11, r10
14580a6df jne 0x14580a6b1
14580a6e1 xor eax, eax
14580a6e3 movaps xmm6, xmmword ptr [rsp + 0x20]
14580a6e8 add rsp, 0x30
14580a6ec pop rsi
14580a6ed ret
14580a6ee movss xmm0, dword ptr [r8 + 8]
14580a6f4 movss xmm1, dword ptr [rip + 0x6d9554]
14580a6fc cmp rdx, 8
14580a700 jne 0x14580a720
14580a702 movabs r8, 0x657269665f656972
14580a70c add r8, 0xd06fbf6
14580a713 cmp qword ptr [rax], r8
14580a716 jne 0x14580a720
14580a718 movss xmm1, dword ptr [rip + 0x6d5c5c]
14580a720 movss xmm2, dword ptr [r9 + 0x48]
14580a726 mulss xmm2, dword ptr [rip + 0x6d5e6e]
14580a72e mulss xmm2, dword ptr [rcx + 0x14]
14580a733 mulss xmm2, dword ptr [rcx + 0x3c]
14580a738 mulss xmm2, xmm0
14580a73c movaps xmm0, xmm2
14580a73f maxss xmm0, xmm1
14580a743 movaps xmm6, xmm0
14580a746 cmpunordss xmm6, xmm0
14580a74b andps xmm2, xmm6
14580a74e andnps xmm6, xmm0
14580a751 orps xmm6, xmm2
14580a754 mov rsi, rcx
14580a757 mov rcx, rax
14580a75a call 0x14580a550
14580a75f movaps xmm1, xmm6
14580a762 maxss xmm1, xmm0
14580a766 movaps xmm0, xmm1
14580a769 cmpunordss xmm0, xmm1
14580a76e andps xmm6, xmm0
14580a771 andnps xmm0, xmm1
14580a774 orps xmm0, xmm6
14580a777 movss xmm1, dword ptr [rsi + 0x50]
14580a77c maxss xmm1, dword ptr [rip + 0x6d5e3c]
14580a784 divss xmm0, xmm1
14580a788 mov eax, 1
14580a78d movaps xmm6, xmmword ptr [rsp + 0x20]
14580a792 add rsp, 0x30
14580a796 pop rsi
14580a797 ret
