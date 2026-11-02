145b3b570 push rbp
145b3b571 push r15
145b3b573 push r14
145b3b575 push r13
145b3b577 push r12
145b3b579 push rsi
145b3b57a push rdi
145b3b57b push rbx
145b3b57c sub rsp, 0x108
145b3b583 lea rbp, [rsp + 0x80]
145b3b58b movaps xmmword ptr [rbp + 0x70], xmm7
145b3b58f movaps xmmword ptr [rbp + 0x60], xmm6
145b3b593 mov qword ptr [rbp + 0x58], 0xfffffffffffffffe
145b3b59b mov rsi, rdx
145b3b59e mov rdi, rcx
145b3b5a1 add rdx, 0x108
145b3b5a8 lea rcx, [rbp - 0x50]
145b3b5ac call 0x145c404e0
145b3b5b1 mov r13, qword ptr [rsi + 0x130]
145b3b5b8 lea rbx, [r13*4]
145b3b5c0 mov rax, r13
145b3b5c3 shr rax, 0x3e
145b3b5c7 setne al
145b3b5ca movabs rcx, 0x7ffffffffffffffc
145b3b5d4 cmp rbx, rcx
145b3b5d7 seta cl
145b3b5da or cl, al
145b3b5dc je 0x145b3b5ef
145b3b5de xor r12d, r12d
145b3b5e1 mov rcx, r12
145b3b5e4 mov rdx, rbx
145b3b5e7 call 0x14613acbb
145b3b5ec nop
145b3b5ed ud2
145b3b5ef mov r14, qword ptr [rsi + 0x128]
145b3b5f6 test rbx, rbx
145b3b5f9 mov qword ptr [rbp + 0x38], rsi
145b3b5fd je 0x145b3b7b5
145b3b603 call 0x140002200
145b3b608 mov r12d, 4
145b3b60e mov edx, 4
145b3b613 mov rcx, rbx
145b3b616 call 0x1400021c0
145b3b61b test rax, rax
145b3b61e je 0x145b3b5e1
145b3b620 mov r15, rax
145b3b623 mov rsi, r13
145b3b626 test r13, r13
145b3b629 je 0x145b3b639
145b3b62b mov rcx, r15
145b3b62e mov rdx, r14
145b3b631 mov r8, rbx
145b3b634 call 0x145f93cdb
145b3b639 mov rax, qword ptr [rbp - 0x40]
145b3b63d mov qword ptr [rbp - 0x10], rax
145b3b641 movups xmm0, xmmword ptr [rbp - 0x50]
145b3b645 movaps xmmword ptr [rbp - 0x20], xmm0
145b3b649 mov qword ptr [rbp - 8], rsi
145b3b64d mov qword ptr [rbp], r15
145b3b651 mov qword ptr [rbp + 8], r13
145b3b655 xorps xmm6, xmm6
145b3b658 test rax, rax
145b3b65b je 0x145b3b7cb
145b3b661 mov rcx, qword ptr [rbp - 0x18]
145b3b665 shl rax, 5
145b3b669 xor edx, edx
145b3b66b mov r8d, 0x6f726572
145b3b671 mov r9d, 0x736c6c6f
145b3b677 mov rsi, qword ptr [rbp + 0x38]
145b3b67b jmp 0x145b3b689
145b3b67d nop dword ptr [rax]
145b3b680 add rdx, 0x20
145b3b684 cmp rax, rdx
145b3b687 je 0x145b3b6b0
145b3b689 cmp qword ptr [rcx + rdx + 0x10], 7
145b3b68f jne 0x145b3b680
145b3b691 mov r10, qword ptr [rcx + rdx + 8]
145b3b696 mov r11d, dword ptr [r10]
145b3b699 xor r11d, r8d
145b3b69c mov r10d, dword ptr [r10 + 3]
145b3b6a0 xor r10d, r9d
145b3b6a3 or r10d, r11d
145b3b6a6 jne 0x145b3b680
145b3b6a8 movzx r13d, byte ptr [rcx + rdx + 0x18]
145b3b6ae jmp 0x145b3b6b3
145b3b6b0 xor r13d, r13d
145b3b6b3 xor edx, edx
145b3b6b5 mov r8d, 0x696e6162
145b3b6bb jmp 0x145b3b6c9
145b3b6bd nop dword ptr [rax]
145b3b6c0 add rdx, 0x20
145b3b6c4 cmp rax, rdx
145b3b6c7 je 0x145b3b6f4
145b3b6c9 cmp qword ptr [rcx + rdx + 0x10], 6
145b3b6cf jne 0x145b3b6c0
145b3b6d1 mov r9, qword ptr [rcx + rdx + 8]
145b3b6d6 mov r10d, dword ptr [r9]
145b3b6d9 xor r10d, r8d
145b3b6dc movzx r9d, word ptr [r9 + 4]
145b3b6e1 xor r9d, 0x6873
145b3b6e8 or r9d, r10d
145b3b6eb jne 0x145b3b6c0
145b3b6ed movzx ebx, byte ptr [rcx + rdx + 0x18]
145b3b6f2 jmp 0x145b3b6f6
145b3b6f4 xor ebx, ebx
145b3b6f6 xor edx, edx
145b3b6f8 jmp 0x145b3b709
145b3b6fa nop word ptr [rax + rax]
145b3b700 add rdx, 0x20
145b3b704 cmp rax, rdx
145b3b707 je 0x145b3b729
145b3b709 cmp qword ptr [rcx + rdx + 0x10], 4
145b3b70f jne 0x145b3b700
145b3b711 mov r8, qword ptr [rcx + rdx + 8]
145b3b716 cmp dword ptr [r8], 0x70696b73
145b3b71d jne 0x145b3b700
145b3b71f movzx edx, byte ptr [rcx + rdx + 0x18]
145b3b724 mov dword ptr [rbp + 0x30], edx
145b3b727 jmp 0x145b3b730
145b3b729 mov dword ptr [rbp + 0x30], 0
145b3b730 xor edx, edx
145b3b732 mov r8d, 0x6e65706f
145b3b738 mov r9d, 0x676e696e
145b3b73e jmp 0x145b3b749
145b3b740 add rdx, 0x20
145b3b744 cmp rax, rdx
145b3b747 je 0x145b3b772
145b3b749 cmp qword ptr [rcx + rdx + 0x10], 7
145b3b74f jne 0x145b3b740
145b3b751 mov r10, qword ptr [rcx + rdx + 8]
145b3b756 mov r11d, dword ptr [r10]
145b3b759 xor r11d, r8d
145b3b75c mov r10d, dword ptr [r10 + 3]
145b3b760 xor r10d, r9d
145b3b763 or r10d, r11d
145b3b766 jne 0x145b3b740
145b3b768 movzx edx, byte ptr [rcx + rdx + 0x18]
145b3b76d mov dword ptr [rbp + 0x34], edx
145b3b770 jmp 0x145b3b779
145b3b772 mov dword ptr [rbp + 0x34], 0
145b3b779 xor edx, edx
145b3b77b jmp 0x145b3b789
145b3b77d nop dword ptr [rax]
145b3b780 add rdx, 0x20
145b3b784 cmp rax, rdx
145b3b787 je 0x145b3b7e2
145b3b789 cmp qword ptr [rcx + rdx + 0x10], 4
145b3b78f jne 0x145b3b780
145b3b791 mov r8, qword ptr [rcx + rdx + 8]
145b3b796 cmp dword ptr [r8], 0x6e65656b
145b3b79d jne 0x145b3b780
145b3b79f movzx eax, byte ptr [rcx + rdx + 0x18]
145b3b7a4 xorps xmm6, xmm6
145b3b7a7 cvtsi2ss xmm6, eax
145b3b7ab mulss xmm6, dword ptr [rip + 0x64221d]
145b3b7b3 jmp 0x145b3b7e2
145b3b7b5 mov r15d, 4
145b3b7bb xor esi, esi
145b3b7bd test r13, r13
145b3b7c0 jne 0x145b3b62b
145b3b7c6 jmp 0x145b3b639
145b3b7cb mov dword ptr [rbp + 0x34], 0
145b3b7d2 xor ebx, ebx
145b3b7d4 xor r13d, r13d
145b3b7d7 mov dword ptr [rbp + 0x30], 0
145b3b7de mov rsi, qword ptr [rbp + 0x38]
145b3b7e2 lea rax, [rip + 0x1a8c9bf]
145b3b7e9 mov qword ptr [rbp - 0x50], rax
145b3b7ed lea rax, [rip + 0x1a8c9fc]
145b3b7f4 mov qword ptr [rbp - 0x48], rax
145b3b7f8 lea rax, [rbp - 0x20]
145b3b7fc mov qword ptr [rbp - 0x40], rax
145b3b800 lea rcx, [rbp - 0x38]
145b3b804 lea rdx, [rbp - 0x50]
145b3b808 call 0x145c29580
145b3b80d nop
145b3b80e mov rax, qword ptr [rbp - 0x10]
145b3b812 test rax, rax
145b3b815 je 0x145b3b9dd
145b3b81b mov rcx, qword ptr [rbp - 0x18]
145b3b81f shl rax, 5
145b3b823 xor r12d, r12d
145b3b826 movabs r8, 0x6f696e61706d6f63
145b3b830 xor edx, edx
145b3b832 jmp 0x145b3b849
145b3b834 nop word ptr cs:[rax + rax]
145b3b840 add rdx, 0x20
145b3b844 cmp rax, rdx
145b3b847 je 0x145b3b876
145b3b849 cmp qword ptr [rcx + rdx + 0x10], 9
145b3b84f jne 0x145b3b840
145b3b851 mov r9, qword ptr [rcx + rdx + 8]
145b3b856 mov r10, qword ptr [r9]
145b3b859 xor r10, r8
145b3b85c movzx r9d, byte ptr [r9 + 8]
145b3b861 xor r9, 0x6e
145b3b865 or r9, r10
145b3b868 jne 0x145b3b840
145b3b86a xor r12d, r12d
145b3b86d cmp byte ptr [rcx + rdx + 0x18], 0
145b3b872 setne r12b
145b3b876 xor edx, edx
145b3b878 mov r9d, 0x6f636573
145b3b87e xor r8d, r8d
145b3b881 jmp 0x145b3b899
145b3b883 nop word ptr cs:[rax + rax]
145b3b890 add r8, 0x20
145b3b894 cmp rax, r8
145b3b897 je 0x145b3b8c8
145b3b899 cmp qword ptr [rcx + r8 + 0x10], 6
145b3b89f jne 0x145b3b890
145b3b8a1 mov r10, qword ptr [rcx + r8 + 8]
145b3b8a6 mov r11d, dword ptr [r10]
145b3b8a9 xor r11d, r9d
145b3b8ac movzx r10d, word ptr [r10 + 4]
145b3b8b1 xor r10d, 0x646e
145b3b8b8 or r10d, r11d
145b3b8bb jne 0x145b3b890
145b3b8bd xor edx, edx
145b3b8bf cmp byte ptr [rcx + r8 + 0x18], 0
145b3b8c5 setne dl
145b3b8c8 mov r14b, 0xff
145b3b8cb add r12, rdx
145b3b8ce je 0x145b3b9ee
145b3b8d4 mov r15, qword ptr [rsi + 0x140]
145b3b8db mov rax, qword ptr [rsi + 0x148]
145b3b8e2 mov qword ptr [rbp + 0x20], rax
145b3b8e6 test rax, rax
145b3b8e9 mov qword ptr [rbp + 0x28], r15
145b3b8ed je 0x145b3b9d9
145b3b8f3 mov rcx, qword ptr [r15 + 8]
145b3b8f7 mov rdx, qword ptr [r15 + 0x10]
145b3b8fb call 0x145ada7f0
145b3b900 nop
145b3b901 test rax, rax
145b3b904 je 0x145b3b9d9
145b3b90a mov rdx, qword ptr [rax + 0x40]
145b3b90e test rdx, rdx
145b3b911 je 0x145b3ba1a
145b3b917 mov dword ptr [rbp + 0x50], ebx
145b3b91a mov qword ptr [rbp + 0x48], rdi
145b3b91e mov rbx, qword ptr [rsi + 0xb8]
145b3b925 xor edi, edi
145b3b927 test rbx, rbx
145b3b92a je 0x145b3b9f8
145b3b930 mov qword ptr [rbp + 0x40], r12
145b3b934 mov dword ptr [rbp + 0x54], r13d
145b3b938 mov qword ptr [rbp + 0x10], rax
145b3b93c mov r13, qword ptr [rax + 0x48]
145b3b940 mov rsi, qword ptr [rsi + 0xb0]
145b3b947 cmp rbx, 1
145b3b94b je 0x145b3b999
145b3b94d xor edi, edi
145b3b94f nop
145b3b950 mov qword ptr [rbp + 0x18], rdi
145b3b954 mov r12, rbx
145b3b957 shr r12, 1
145b3b95a add rdi, r12
145b3b95d lea rax, [rdi + rdi*2]
145b3b961 mov rcx, qword ptr [rsi + rax*8 + 8]
145b3b966 mov r8, qword ptr [rsi + rax*8 + 0x10]
145b3b96b mov r14, r8
145b3b96e sub r14, r13
145b3b971 cmovae r8, r13
145b3b975 mov r15, rdx
145b3b978 call 0x145f93ce7
145b3b97d mov rdx, r15
145b3b980 cdqe
145b3b982 test eax, eax
145b3b984 cmovne r14, rax
145b3b988 test r14, r14
145b3b98b cmovg rdi, qword ptr [rbp + 0x18]
145b3b990 sub rbx, r12
145b3b993 cmp rbx, 1
145b3b997 ja 0x145b3b950
145b3b999 lea rax, [rdi + rdi*2]
145b3b99d mov rcx, qword ptr [rsi + rax*8 + 8]
145b3b9a2 mov rax, qword ptr [rsi + rax*8 + 0x10]
145b3b9a7 mov rsi, rax
145b3b9aa sub rsi, r13
145b3b9ad cmovb r13, rax
145b3b9b1 mov r8, r13
145b3b9b4 call 0x145f93ce7
145b3b9b9 cdqe
145b3b9bb test eax, eax
145b3b9bd cmovne rsi, rax
145b3b9c1 test rsi, rsi
145b3b9c4 mov ebx, dword ptr [rbp + 0x50]
145b3b9c7 je 0x145b3ba03
145b3b9c9 xor eax, eax
145b3b9cb mov rdi, qword ptr [rbp + 0x48]
145b3b9cf mov rsi, qword ptr [rbp + 0x38]
145b3b9d3 mov r13d, dword ptr [rbp + 0x54]
145b3b9d7 jmp 0x145b3ba13
145b3b9d9 xor eax, eax
145b3b9db jmp 0x145b3ba1a
145b3b9dd xor r12d, r12d
145b3b9e0 xor edx, edx
145b3b9e2 mov r14b, 0xff
145b3b9e5 add r12, rdx
145b3b9e8 jne 0x145b3b8d4
145b3b9ee mov al, 0xff
145b3b9f0 mov dword ptr [rbp + 0x18], eax
145b3b9f3 jmp 0x145b3bb98
145b3b9f8 xor eax, eax
145b3b9fa mov rdi, qword ptr [rbp + 0x48]
145b3b9fe mov ebx, dword ptr [rbp + 0x50]
145b3ba01 jmp 0x145b3ba1a
145b3ba03 mov rdi, qword ptr [rbp + 0x48]
145b3ba07 mov rsi, qword ptr [rbp + 0x38]
145b3ba0b mov r13d, dword ptr [rbp + 0x54]
145b3ba0f mov rax, qword ptr [rbp + 0x10]
145b3ba13 mov r14b, 0xff
145b3ba16 mov r12, qword ptr [rbp + 0x40]
145b3ba1a test rax, rax
145b3ba1d lea r15, [rip + 0x1a8e814]
145b3ba24 cmove rax, r15
145b3ba28 mov qword ptr [rbp + 0x10], rax
145b3ba2c mov rcx, qword ptr [rbp - 0x28]
145b3ba30 test rcx, rcx
145b3ba33 je 0x145b3ba4a
145b3ba35 mov rax, qword ptr [rbp - 0x30]
145b3ba39 movzx eax, byte ptr [rax]
145b3ba3c mov dword ptr [rbp + 0x18], eax
145b3ba3f cmp r12, 1
145b3ba43 jne 0x145b3ba57
145b3ba45 jmp 0x145b3bb98
145b3ba4a mov dword ptr [rbp + 0x18], 0
145b3ba51 cmp r12, 1
145b3ba55 je 0x145b3ba45
145b3ba57 cmp qword ptr [rbp + 0x20], 2
145b3ba5c jb 0x145b3bb64
145b3ba62 mov qword ptr [rbp + 0x40], rcx
145b3ba66 mov rax, qword ptr [rbp + 0x28]
145b3ba6a mov rcx, qword ptr [rax + 0x20]
145b3ba6e mov rdx, qword ptr [rax + 0x28]
145b3ba72 call 0x145ada7f0
145b3ba77 nop
145b3ba78 test rax, rax
145b3ba7b mov rcx, qword ptr [rbp + 0x40]
145b3ba7f je 0x145b3bb64
145b3ba85 mov rdx, qword ptr [rax + 0x40]
145b3ba89 test rdx, rdx
145b3ba8c je 0x145b3bb66
145b3ba92 mov dword ptr [rbp + 0x54], r13d
145b3ba96 mov qword ptr [rbp + 0x48], rdi
145b3ba9a mov r13, qword ptr [rsi + 0xb8]
145b3baa1 xor edi, edi
145b3baa3 test r13, r13
145b3baa6 je 0x145b3bb7e
145b3baac mov dword ptr [rbp + 0x50], ebx
145b3baaf mov qword ptr [rbp + 0x28], rax
145b3bab3 mov r12, qword ptr [rax + 0x48]
145b3bab7 mov rsi, qword ptr [rsi + 0xb0]
145b3babe cmp r13, 1
145b3bac2 je 0x145b3bb19
145b3bac4 xor edi, edi
145b3bac6 nop word ptr cs:[rax + rax]
145b3bad0 mov qword ptr [rbp + 0x20], rdi
145b3bad4 mov rbx, r13
145b3bad7 shr rbx, 1
145b3bada add rdi, rbx
145b3badd lea rax, [rdi + rdi*2]
145b3bae1 mov rcx, qword ptr [rsi + rax*8 + 8]
145b3bae6 mov r8, qword ptr [rsi + rax*8 + 0x10]
145b3baeb mov r14, r8
145b3baee sub r14, r12
145b3baf1 cmovae r8, r12
145b3baf5 mov r15, rdx
145b3baf8 call 0x145f93ce7
145b3bafd mov rdx, r15
145b3bb00 cdqe
145b3bb02 test eax, eax
145b3bb04 cmovne r14, rax
145b3bb08 test r14, r14
145b3bb0b cmovg rdi, qword ptr [rbp + 0x20]
145b3bb10 sub r13, rbx
145b3bb13 cmp r13, 1
145b3bb17 ja 0x145b3bad0
145b3bb19 lea rax, [rdi + rdi*2]
145b3bb1d mov rcx, qword ptr [rsi + rax*8 + 8]
145b3bb22 mov rax, qword ptr [rsi + rax*8 + 0x10]
145b3bb27 mov rsi, rax
145b3bb2a sub rsi, r12
145b3bb2d cmovb r12, rax
145b3bb31 mov r8, r12
145b3bb34 call 0x145f93ce7
145b3bb39 cdqe
145b3bb3b test eax, eax
145b3bb3d cmovne rsi, rax
145b3bb41 test rsi, rsi
145b3bb44 mov rax, qword ptr [rbp + 0x28]
145b3bb48 mov rdi, qword ptr [rbp + 0x48]
145b3bb4c mov rsi, qword ptr [rbp + 0x38]
145b3bb50 mov r13d, dword ptr [rbp + 0x54]
145b3bb54 mov ebx, dword ptr [rbp + 0x50]
145b3bb57 lea r15, [rip + 0x1a8e6da]
145b3bb5e mov rcx, qword ptr [rbp + 0x40]
145b3bb62 je 0x145b3bb66
145b3bb64 xor eax, eax
145b3bb66 test rax, rax
145b3bb69 cmovne r15, rax
145b3bb6d cmp rcx, 2
145b3bb71 jb 0x145b3bb95
145b3bb73 mov rax, qword ptr [rbp - 0x30]
145b3bb77 movzx r14d, byte ptr [rax + 1]
145b3bb7c jmp 0x145b3bb98
145b3bb7e xor eax, eax
145b3bb80 mov rdi, qword ptr [rbp + 0x48]
145b3bb84 mov r13d, dword ptr [rbp + 0x54]
145b3bb88 test rax, rax
145b3bb8b cmovne r15, rax
145b3bb8f cmp rcx, 2
145b3bb93 jae 0x145b3bb73
145b3bb95 xor r14d, r14d
145b3bb98 mov qword ptr [rbp + 0x20], r15
145b3bb9c mov dword ptr [rbp + 0x38], r14d
145b3bba0 mov rdx, qword ptr [rbp - 0x38]
145b3bba4 test rdx, rdx
145b3bba7 je 0x145b3bbb8
145b3bba9 mov rcx, qword ptr [rbp - 0x30]
145b3bbad mov r8d, 1
145b3bbb3 call 0x1400021d0
145b3bbb8 mov r14, qword ptr [rbp - 0x18]
145b3bbbc mov r15, qword ptr [rbp - 0x10]
145b3bbc0 test r15, r15
145b3bbc3 je 0x145b3bc58
145b3bbc9 mov rax, r15
145b3bbcc shl rax, 5
145b3bbd0 xor ecx, ecx
145b3bbd2 mov edx, 0x7361656c
145b3bbd7 jmp 0x145b3bbe9
145b3bbd9 nop dword ptr [rax]
145b3bbe0 add rcx, 0x20
145b3bbe4 cmp rax, rcx
145b3bbe7 je 0x145b3bc12
145b3bbe9 cmp qword ptr [r14 + rcx + 0x10], 5
145b3bbef jne 0x145b3bbe0
145b3bbf1 mov r8, qword ptr [r14 + rcx + 8]
145b3bbf6 mov r9d, dword ptr [r8]
145b3bbf9 xor r9d, edx
145b3bbfc movzx r8d, byte ptr [r8 + 4]
145b3bc01 xor r8d, 0x68
145b3bc05 or r8d, r9d
145b3bc08 jne 0x145b3bbe0
145b3bc0a movzx r8d, byte ptr [r14 + rcx + 0x18]
145b3bc10 jmp 0x145b3bc15
145b3bc12 xor r8d, r8d
145b3bc15 xor ecx, ecx
145b3bc17 jmp 0x145b3bc29
145b3bc19 nop dword ptr [rax]
145b3bc20 add rcx, 0x20
145b3bc24 cmp rax, rcx
145b3bc27 je 0x145b3bc5b
145b3bc29 cmp qword ptr [r14 + rcx + 0x10], 4
145b3bc2f jne 0x145b3bc20
145b3bc31 mov rdx, qword ptr [r14 + rcx + 8]
145b3bc36 cmp dword ptr [rdx], 0x73776170
145b3bc3c jne 0x145b3bc20
145b3bc3e movzx edx, byte ptr [r14 + rcx + 0x18]
145b3bc44 mov r12, qword ptr [rsi + 0xb8]
145b3bc4b xorps xmm7, xmm7
145b3bc4e test r12, r12
145b3bc51 jne 0x145b3bc70
145b3bc53 jmp 0x145b3bd44
145b3bc58 xor r8d, r8d
145b3bc5b xor edx, edx
145b3bc5d mov r12, qword ptr [rsi + 0xb8]
145b3bc64 xorps xmm7, xmm7
145b3bc67 test r12, r12
145b3bc6a je 0x145b3bd44
145b3bc70 mov qword ptr [rbp - 0x58], r15
145b3bc74 mov dword ptr [rbp + 0x50], ebx
145b3bc77 mov dword ptr [rbp + 0x54], r13d
145b3bc7b mov qword ptr [rbp + 0x48], rdi
145b3bc7f mov r15, qword ptr [rsi + 0xb0]
145b3bc86 cmp r12, 1
145b3bc8a mov dword ptr [rbp + 0x28], r8d
145b3bc8e mov dword ptr [rbp + 0x40], edx
145b3bc91 jne 0x145b3bc97
145b3bc93 xor ebx, ebx
145b3bc95 jmp 0x145b3bcee
145b3bc97 xor ebx, ebx
145b3bc99 nop dword ptr [rax]
145b3bca0 mov rsi, rbx
145b3bca3 mov rdi, r12
145b3bca6 shr rdi, 1
145b3bca9 add rbx, rdi
145b3bcac lea rax, [rbx + rbx*2]
145b3bcb0 mov rcx, qword ptr [r15 + rax*8 + 8]
145b3bcb5 mov r8, qword ptr [r15 + rax*8 + 0x10]
145b3bcba mov r13, r8
145b3bcbd sub r13, 9
145b3bcc1 mov eax, 9
145b3bcc6 cmovae r8, rax
145b3bcca lea rdx, [rip + 0x1a8ad47]
145b3bcd1 call 0x145f93ce7
145b3bcd6 cdqe
145b3bcd8 test eax, eax
145b3bcda cmovne r13, rax
145b3bcde test r13, r13
145b3bce1 cmovg rbx, rsi
145b3bce5 sub r12, rdi
145b3bce8 cmp r12, 1
145b3bcec ja 0x145b3bca0
145b3bcee lea rax, [rbx + rbx*2]
145b3bcf2 mov rcx, qword ptr [r15 + rax*8 + 8]
145b3bcf7 mov rax, qword ptr [r15 + rax*8 + 0x10]
145b3bcfc mov rsi, rax
145b3bcff sub rsi, 9
145b3bd03 mov r8d, 9
145b3bd09 cmovb r8, rax
145b3bd0d lea rdx, [rip + 0x1a8ad04]
145b3bd14 call 0x145f93ce7
145b3bd19 cdqe
145b3bd1b test eax, eax
145b3bd1d cmovne rsi, rax
145b3bd21 test rsi, rsi
145b3bd24 mov rdi, qword ptr [rbp + 0x48]
145b3bd28 mov r13d, dword ptr [rbp + 0x54]
145b3bd2c mov ebx, dword ptr [rbp + 0x50]
145b3bd2f mov r8d, dword ptr [rbp + 0x28]
145b3bd33 mov edx, dword ptr [rbp + 0x40]
145b3bd36 mov r15, qword ptr [rbp - 0x58]
145b3bd3a jne 0x145b3bd44
145b3bd3c movss xmm7, dword ptr [rip + 0x638cf0]
145b3bd44 cmp byte ptr [rbp + 0x30], 0
145b3bd48 setne byte ptr [rdi + 0x32]
145b3bd4c cmp byte ptr [rbp + 0x34], 0
145b3bd50 setne byte ptr [rdi + 0x33]
145b3bd54 movzx eax, bl
145b3bd57 movzx ecx, r13b
145b3bd5b mov dword ptr [rdi + 0x20], ecx
145b3bd5e mov dword ptr [rdi + 0x24], eax
145b3bd61 movss dword ptr [rdi + 0x28], xmm6
145b3bd66 mov rax, qword ptr [rbp + 0x10]
145b3bd6a mov qword ptr [rdi], rax
145b3bd6d mov eax, dword ptr [rbp + 0x18]
145b3bd70 mov byte ptr [rdi + 8], al
145b3bd73 mov rax, qword ptr [rbp + 0x20]
145b3bd77 mov qword ptr [rdi + 0x10], rax
145b3bd7b mov eax, dword ptr [rbp + 0x38]
145b3bd7e mov byte ptr [rdi + 0x18], al
145b3bd81 mov byte ptr [rdi + 0x30], r8b
145b3bd85 mov byte ptr [rdi + 0x31], dl
145b3bd88 movss dword ptr [rdi + 0x2c], xmm7
145b3bd8d test r15, r15
145b3bd90 je 0x145b3bdc2
145b3bd92 add r14, 8
145b3bd96 jmp 0x145b3bda9
145b3bd98 nop dword ptr [rax + rax]
145b3bda0 add r14, 0x20
145b3bda4 dec r15
145b3bda7 je 0x145b3bdc2
145b3bda9 mov rdx, qword ptr [r14 - 8]
145b3bdad test rdx, rdx
145b3bdb0 je 0x145b3bda0
145b3bdb2 mov rcx, qword ptr [r14]
145b3bdb5 mov r8d, 1
145b3bdbb call 0x1400021d0
145b3bdc0 jmp 0x145b3bda0
145b3bdc2 mov rdx, qword ptr [rbp - 0x20]
145b3bdc6 test rdx, rdx
145b3bdc9 je 0x145b3bdde
145b3bdcb mov rcx, qword ptr [rbp - 0x18]
145b3bdcf shl rdx, 5
145b3bdd3 mov r8d, 8
145b3bdd9 call 0x1400021d0
145b3bdde mov rdx, qword ptr [rbp - 8]
145b3bde2 test rdx, rdx
145b3bde5 je 0x145b3bdfa
145b3bde7 mov rcx, qword ptr [rbp]
145b3bdeb shl rdx, 2
145b3bdef mov r8d, 4
145b3bdf5 call 0x1400021d0
145b3bdfa mov rax, rdi
145b3bdfd movaps xmm6, xmmword ptr [rbp + 0x60]
145b3be01 movaps xmm7, xmmword ptr [rbp + 0x70]
145b3be05 add rsp, 0x108
145b3be0c pop rbx
145b3be0d pop rdi
145b3be0e pop rsi
145b3be0f pop r12
145b3be11 pop r13
145b3be13 pop r14
145b3be15 pop r15
145b3be17 pop rbp
145b3be18 ret
