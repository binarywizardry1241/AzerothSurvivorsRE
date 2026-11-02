14029f3f0 push rbp
14029f3f1 push r15
14029f3f3 push r14
14029f3f5 push r13
14029f3f7 push r12
14029f3f9 push rsi
14029f3fa push rdi
14029f3fb push rbx
14029f3fc sub rsp, 0x358
14029f403 lea rbp, [rsp + 0x80]
14029f40b mov qword ptr [rbp + 0x2d0], 0xfffffffffffffffe
14029f416 mov rbx, r8
14029f419 mov rdi, rdx
14029f41c mov rsi, rcx
14029f41f mov r14, qword ptr [rcx]
14029f422 mov rax, qword ptr [rcx + 0x28]
14029f426 mov qword ptr [rbp + 0x1f0], r14
14029f42d movups xmm0, xmmword ptr [rcx + 8]
14029f431 movups xmmword ptr [rbp + 0x1f8], xmm0
14029f438 movups xmm0, xmmword ptr [rcx + 0x18]
14029f43c movups xmmword ptr [rbp + 0x208], xmm0
14029f443 mov qword ptr [rbp + 0x218], rax
14029f44a lea rcx, [rip + 0x5c61c82]
14029f451 mov edx, 0xb
14029f456 call 0x145895670
14029f45b mov r8, rdx
14029f45e mov qword ptr [rsp + 0x20], 0
14029f467 lea rcx, [rbp + 0x1c0]
14029f46e mov r9d, 8
14029f474 mov rdx, rax
14029f477 call 0x145895ad0
14029f47c cmp byte ptr [rdi], 1
14029f47f jne 0x14029f4a0
14029f481 mov eax, dword ptr [rdi + 1]
14029f484 mov ecx, dword ptr [rdi + 4]
14029f487 mov dword ptr [rbp + 0x2c7], ecx
14029f48d mov dword ptr [rbp + 0x2c4], eax
14029f493 mov rax, qword ptr [rdi + 8]
14029f497 movzx ecx, byte ptr [rdi + 0x10]
14029f49b mov r8b, 1
14029f49e jmp 0x14029f4b1
14029f4a0 mov rax, qword ptr [rdi + 8]
14029f4a4 lock inc qword ptr [rax]
14029f4a8 jle 0x14029f8fa
14029f4ae xor r8d, r8d
14029f4b1 lea rdx, [rbp + 0x1f8]
14029f4b8 mov r9, qword ptr [rbp + 0x1d0]
14029f4bf mov qword ptr [rbp - 0x30], r9
14029f4c3 movups xmm0, xmmword ptr [rbp + 0x1c0]
14029f4ca movups xmmword ptr [rbp - 0x40], xmm0
14029f4ce movups xmm0, xmmword ptr [rip + 0x5c5e6cf]
14029f4d5 movups xmmword ptr [rbp + 0x28c], xmm0
14029f4dc mov dword ptr [rbp + 0x29c], 0x3f800000
14029f4e6 movups xmm0, xmmword ptr [rip + 0x5c5e4e3]
14029f4ed movaps xmmword ptr [rbp + 0x220], xmm0
14029f4f4 mov qword ptr [rbp + 0x230], 0
14029f4ff movups xmm0, xmmword ptr [rip + 0x5c5e4e2]
14029f506 movups xmmword ptr [rbp + 0x238], xmm0
14029f50d mov qword ptr [rbp + 0x248], 0
14029f518 movups xmm0, xmmword ptr [rip + 0x5c5e4e1]
14029f51f movaps xmmword ptr [rbp + 0x250], xmm0
14029f526 mov qword ptr [rbp + 0x260], 0
14029f531 movups xmm0, xmmword ptr [rip + 0x5c5e4e0]
14029f538 movups xmmword ptr [rbp + 0x268], xmm0
14029f53f mov qword ptr [rbp + 0x278], 0
14029f54a xorps xmm0, xmm0
14029f54d movups xmmword ptr [rbp + 0xe0], xmm0
14029f554 movups xmmword ptr [rbp + 0xd0], xmm0
14029f55b movups xmmword ptr [rbp + 0xc0], xmm0
14029f562 movups xmmword ptr [rbp + 0xb0], xmm0
14029f569 movups xmmword ptr [rbp + 0xa0], xmm0
14029f570 mov qword ptr [rbp + 0xf0], 0
14029f57b mov dword ptr [rbp + 0x1ba], 0
14029f585 mov qword ptr [rbp + 0x1b2], 0
14029f590 mov qword ptr [rbp - 0x28], 0
14029f598 mov qword ptr [rbp - 0x20], 4
14029f5a0 mov qword ptr [rbp - 0x18], 0
14029f5a8 mov byte ptr [rbp - 0x10], r8b
14029f5ac mov r8d, dword ptr [rbp + 0x2c4]
14029f5b3 mov r9d, dword ptr [rbp + 0x2c7]
14029f5ba mov dword ptr [rbp - 0xc], r9d
14029f5be mov dword ptr [rbp - 0xf], r8d
14029f5c2 mov qword ptr [rbp - 8], rax
14029f5c6 mov qword ptr [rbp], rcx
14029f5ca mov dword ptr [rbp + 8], 0x41800000
14029f5d1 mov word ptr [rbp + 0xc], 0x190
14029f5d7 mov byte ptr [rbp + 0xe], 1
14029f5db mov rax, qword ptr [rbp + 0x298]
14029f5e2 mov qword ptr [rbp + 0x1c], rax
14029f5e6 movups xmm0, xmmword ptr [rbp + 0x28b]
14029f5ed movups xmmword ptr [rbp + 0xf], xmm0
14029f5f1 mov eax, dword ptr [rip + 0x5c302e1]
14029f5f7 mov dword ptr [rbp + 0x34], eax
14029f5fa movups xmm0, xmmword ptr [rip + 0x5c302c7]
14029f601 movups xmmword ptr [rbp + 0x24], xmm0
14029f605 movsd xmm0, qword ptr [rip + 0x5c02ac3]
14029f60d movsd qword ptr [rbp + 0x38], xmm0
14029f612 movaps xmm0, xmmword ptr [rbp + 0x270]
14029f619 movups xmmword ptr [rbp + 0x90], xmm0
14029f620 movaps xmm0, xmmword ptr [rbp + 0x260]
14029f627 movups xmmword ptr [rbp + 0x80], xmm0
14029f62e movaps xmm0, xmmword ptr [rbp + 0x220]
14029f635 movaps xmm1, xmmword ptr [rbp + 0x230]
14029f63c movaps xmm2, xmmword ptr [rbp + 0x240]
14029f643 movaps xmm3, xmmword ptr [rbp + 0x250]
14029f64a movups xmmword ptr [rbp + 0x70], xmm3
14029f64e movups xmmword ptr [rbp + 0x60], xmm2
14029f652 movups xmmword ptr [rbp + 0x50], xmm1
14029f656 movups xmmword ptr [rbp + 0x40], xmm0
14029f65a movaps xmm0, xmmword ptr [rip + 0x5c2c1ff]
14029f661 movups xmmword ptr [rbp + 0xf8], xmm0
14029f668 movaps xmm0, xmmword ptr [rip + 0x5c02c51]
14029f66f movups xmmword ptr [rbp + 0x108], xmm0
14029f676 movups xmm0, xmmword ptr [rip + 0x5c5e43b]
14029f67d movups xmmword ptr [rbp + 0x128], xmm0
14029f684 movups xmm0, xmmword ptr [rip + 0x5c5e41d]
14029f68b movups xmmword ptr [rbp + 0x118], xmm0
14029f692 movups xmm0, xmmword ptr [rip + 0x5c5e43f]
14029f699 movups xmmword ptr [rbp + 0x148], xmm0
14029f6a0 movups xmm0, xmmword ptr [rip + 0x5c5e421]
14029f6a7 movups xmmword ptr [rbp + 0x138], xmm0
14029f6ae movups xmm0, xmmword ptr [rip + 0x5c5e443]
14029f6b5 movups xmmword ptr [rbp + 0x168], xmm0
14029f6bc movups xmm0, xmmword ptr [rip + 0x5c5e425]
14029f6c3 movups xmmword ptr [rbp + 0x158], xmm0
14029f6ca movaps xmm0, xmmword ptr [rip + 0x5c0295f]
14029f6d1 movups xmmword ptr [rbp + 0x178], xmm0
14029f6d8 mov dword ptr [rbp + 0x188], 1
14029f6e2 mov qword ptr [rbp + 0x18c], 0
14029f6ed mov byte ptr [rbp + 0x194], 1
14029f6f4 mov qword ptr [rbp + 0x198], 0
14029f6ff mov dword ptr [rbp + 0x1a0], 0x3f800000
14029f709 mov word ptr [rbp + 0x1a4], 0
14029f712 mov word ptr [rbp + 0x1aa], 0
14029f71b mov dword ptr [rbp + 0x1a6], 0x10000
14029f725 mov word ptr [rbp + 0x1b0], 0
14029f72e mov dword ptr [rbp + 0x1ac], 0x10000
14029f738 mov qword ptr [rbp - 0x48], r14
14029f73c lea rcx, [rbp + 0x1c0]
14029f743 lea r8, [rbp - 0x48]
14029f747 call 0x1402799f0
14029f74c mov word ptr [rbp - 0x48], 0x10a
14029f752 lea rdx, [rbp + 0x1c0]
14029f759 mov r8d, 3
14029f75f mov cl, 1
14029f761 call 0x145ccfd60
14029f766 test rdx, rdx
14029f769 js 0x14029f8ed
14029f76f movzx r8d, byte ptr [rbx + 0x119]
14029f777 test r8b, r8b
14029f77a mov qword ptr [rbp + 0x2a0], rdi
14029f781 mov qword ptr [rbp + 0x2a8], rsi
14029f788 je 0x14029f7a5
14029f78a movzx ecx, r8b
14029f78e cmp r8b, 5
14029f792 mov r8d, 5
14029f798 cmovb r8d, ecx
14029f79c mov dword ptr [rbp + 0x2cc], r8d
14029f7a3 jmp 0x14029f7ad
14029f7a5 mov cl, 5
14029f7a7 mov dword ptr [rbp + 0x2cc], ecx
14029f7ad mov dil, 1
14029f7b0 mov bl, 2
14029f7b2 lea r15, [rbp - 0x48]
14029f7b6 xor esi, esi
14029f7b8 mov r12d, ebx
14029f7bb test rdx, rdx
14029f7be je 0x14029f810
14029f7c0 mov r14, rax
14029f7c3 mov r13, rdx
14029f7c6 call 0x140002200
14029f7cb mov ebx, 1
14029f7d0 mov edx, 1
14029f7d5 mov rcx, r13
14029f7d8 call 0x1400021c0
14029f7dd test rax, rax
14029f7e0 je 0x14029f8c5
14029f7e6 mov rcx, rax
14029f7e9 mov rdx, r14
14029f7ec mov r8, r13
14029f7ef mov rbx, rax
14029f7f2 call 0x145cf998b
14029f7f7 mov r9, rbx
14029f7fa mov rdx, r13
14029f7fd lea r15, [rbp - 0x48]
14029f801 jmp 0x14029f81b
14029f803 nop word ptr cs:[rax + rax]
14029f810 mov r9d, 1
14029f816 mov ebx, 1
14029f81b mov qword ptr [rbp + 0x2b0], rdx
14029f822 cmp dil, byte ptr [rbp + 0x2cc]
14029f829 sete byte ptr [rsp + 0x28]
14029f82e mov qword ptr [rsp + 0x20], rdx
14029f833 lea rcx, [rbp + 0x1f0]
14029f83a mov rdx, qword ptr [rbp + 0x2a0]
14029f841 mov r8, r15
14029f844 mov qword ptr [rbp + 0x2b8], r9
14029f84b call 0x14003b910
14029f850 nop
14029f851 mov rdx, qword ptr [rbp + 0x2b0]
14029f858 test rdx, rdx
14029f85b je 0x14029f86f
14029f85d mov r8d, 1
14029f863 mov rcx, qword ptr [rbp + 0x2b8]
14029f86a call 0x1400021d0
14029f86f cmp r12b, 6
14029f873 setae al
14029f876 or sil, al
14029f879 test sil, 1
14029f87d jne 0x14029f8d2
14029f87f mov r13, rbx
14029f882 lea eax, [r12 + 1]
14029f887 cmp r12b, 5
14029f88b sete sil
14029f88f movzx ebx, al
14029f892 mov eax, 5
14029f897 cmove ebx, eax
14029f89a mov byte ptr [rbp - 0x47], r12b
14029f89e mov byte ptr [rbp - 0x48], 0xa
14029f8a2 mov r8d, 3
14029f8a8 mov ecx, r12d
14029f8ab lea rdx, [rbp + 0x1c0]
14029f8b2 call 0x145ccfd60
14029f8b7 mov edi, r12d
14029f8ba test rdx, rdx
14029f8bd jns 0x14029f7b8
14029f8c3 xor ebx, ebx
14029f8c5 mov rcx, rbx
14029f8c8 mov rdx, r13
14029f8cb call 0x145e9bd8b
14029f8d0 ud2
14029f8d2 mov rax, qword ptr [rbp + 0x2a8]
14029f8d9 add rsp, 0x358
14029f8e0 pop rbx
14029f8e1 pop rdi
14029f8e2 pop rsi
14029f8e3 pop r12
14029f8e5 pop r13
14029f8e7 pop r14
14029f8e9 pop r15
14029f8eb pop rbp
14029f8ec ret
14029f8ed xor ebx, ebx
14029f8ef mov rcx, rbx
14029f8f2 mov rdx, r13
14029f8f5 call 0x145e9bd8b
14029f8fa ud2
