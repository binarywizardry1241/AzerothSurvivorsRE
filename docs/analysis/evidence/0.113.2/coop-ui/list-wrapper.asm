14003d1e0 push r15
14003d1e2 push r14
14003d1e4 push r13
14003d1e6 push r12
14003d1e8 push rsi
14003d1e9 push rdi
14003d1ea push rbx
14003d1eb sub rsp, 0x3d0
14003d1f2 movaps xmmword ptr [rsp + 0x3c0], xmm15
14003d1fb movaps xmmword ptr [rsp + 0x3b0], xmm14
14003d204 movaps xmmword ptr [rsp + 0x3a0], xmm13
14003d20d movaps xmmword ptr [rsp + 0x390], xmm12
14003d216 movaps xmmword ptr [rsp + 0x380], xmm11
14003d21f movaps xmmword ptr [rsp + 0x370], xmm10
14003d228 movaps xmmword ptr [rsp + 0x360], xmm9
14003d231 movaps xmmword ptr [rsp + 0x350], xmm8
14003d23a movaps xmmword ptr [rsp + 0x340], xmm7
14003d242 movaps xmmword ptr [rsp + 0x330], xmm6
14003d24a mov r14, r9
14003d24d mov r15, r8
14003d250 mov rdi, rdx
14003d253 mov rbx, rcx
14003d256 xorps xmm0, xmm0
14003d259 movaps xmmword ptr [rsp + 0x290], xmm0
14003d261 movaps xmmword ptr [rsp + 0x280], xmm0
14003d269 movaps xmmword ptr [rsp + 0x270], xmm0
14003d271 movaps xmmword ptr [rsp + 0x260], xmm0
14003d279 movaps xmmword ptr [rsp + 0x250], xmm0
14003d281 mov qword ptr [rsp + 0x2a0], 0
14003d28d movups xmm0, xmmword ptr [rip + 0x5e895c4]
14003d294 movups xmmword ptr [rsp + 0x2a8], xmm0
14003d29c movups xmm8, xmmword ptr [rip + 0x5e895c4]
14003d2a4 movups xmmword ptr [rsp + 0x2b8], xmm8
14003d2ad movups xmm0, xmmword ptr [rip + 0x5e895c4]
14003d2b4 movups xmmword ptr [rsp + 0x2c8], xmm0
14003d2bc movups xmm10, xmmword ptr [rip + 0x5e895c4]
14003d2c4 movups xmmword ptr [rsp + 0x2d8], xmm10
14003d2cd movups xmm9, xmmword ptr [rip + 0x5e895c3]
14003d2d5 movups xmmword ptr [rsp + 0x2e8], xmm9
14003d2de movups xmm11, xmmword ptr [rip + 0x5e895c2]
14003d2e6 movups xmmword ptr [rsp + 0x2f8], xmm11
14003d2ef movups xmm12, xmmword ptr [rip + 0x5e895d1]
14003d2f7 movups xmmword ptr [rsp + 0x318], xmm12
14003d300 movups xmm13, xmmword ptr [rip + 0x5e895b0]
14003d308 movups xmmword ptr [rsp + 0x308], xmm13
14003d311 movups xmm14, xmmword ptr [rip + 0x5e89487]
14003d319 movaps xmmword ptr [rsp + 0x1f0], xmm14
14003d322 mov qword ptr [rsp + 0x200], 0
14003d32e movups xmm15, xmmword ptr [rip + 0x5e89482]
14003d336 movups xmmword ptr [rsp + 0x208], xmm15
14003d33f mov qword ptr [rsp + 0x218], 0
14003d34b movups xmm6, xmmword ptr [rip + 0x5e8947e]
14003d352 movaps xmmword ptr [rsp + 0x220], xmm6
14003d35a mov qword ptr [rsp + 0x230], 0
14003d366 movups xmm7, xmmword ptr [rip + 0x5e8947b]
14003d36d movups xmmword ptr [rsp + 0x238], xmm7
14003d375 mov qword ptr [rsp + 0x248], 0
14003d381 mov r12, qword ptr [rcx]
14003d384 lea rsi, [rcx + 8]
14003d388 lea rcx, [rsp + 0x40]
14003d38d lea rdx, [rsp + 0x1f0]
14003d395 mov r8d, 0x138
14003d39b call 0x145cf998b
14003d3a0 movaps xmm0, xmmword ptr [rip + 0x5e64c89]
14003d3a7 movups xmmword ptr [rsp + 0x178], xmm0
14003d3af mov dword ptr [rsp + 0x188], 1
14003d3ba mov qword ptr [rsp + 0x18c], 0
14003d3c6 mov byte ptr [rsp + 0x194], 1
14003d3ce mov qword ptr [rsp + 0x198], 0
14003d3da mov dword ptr [rsp + 0x1a0], 0x3f800000
14003d3e5 mov word ptr [rsp + 0x1a4], 0
14003d3ef mov dword ptr [rsp + 0x1a6], 0x10000
14003d3fa mov word ptr [rsp + 0x1aa], 0
14003d404 mov dword ptr [rsp + 0x1ac], 0x10000
14003d40f mov word ptr [rsp + 0x1b0], 0
14003d419 mov qword ptr [rsp + 0x1b2], 0
14003d425 mov dword ptr [rsp + 0x1ba], 0x7000005
14003d430 mov qword ptr [rsp + 0x38], r12
14003d435 lea r9, [rip + 0x5eb518c]
14003d43c lea r12, [rsp + 0x1c0]
14003d444 lea r8, [rsp + 0x38]
14003d449 mov rcx, r12
14003d44c mov rdx, rsi
14003d44f call 0x1402628b0
14003d454 mov rcx, r12
14003d457 mov rdx, rdi
14003d45a call 0x14029dae0
14003d45f cmp byte ptr [r14 + 0x115], 0
14003d467 je 0x14003d6d1
14003d46d cmp qword ptr [r14 + 0x70], 0
14003d472 je 0x14003d73c
14003d478 xorps xmm0, xmm0
14003d47b movups xmmword ptr [rsp + 0xc8], xmm0
14003d483 movups xmmword ptr [rsp + 0xb8], xmm0
14003d48b movups xmmword ptr [rsp + 0xa8], xmm0
14003d493 mov qword ptr [rsp + 0xd8], 0
14003d49f movups xmmword ptr [rsp + 0xe4], xmm0
14003d4a7 mov dword ptr [rsp + 0xf4], 0
14003d4b2 mov dword ptr [rsp + 0x1b8], 0
14003d4bd mov word ptr [rsp + 0x1bc], 0
14003d4c7 movaps xmmword ptr [rsp + 0x1f0], xmm14
14003d4d0 mov qword ptr [rsp + 0x200], 0
14003d4dc movups xmmword ptr [rsp + 0x208], xmm15
14003d4e5 mov qword ptr [rsp + 0x218], 0
14003d4f1 movaps xmmword ptr [rsp + 0x220], xmm6
14003d4f9 mov qword ptr [rsp + 0x230], 0
14003d505 movups xmmword ptr [rsp + 0x238], xmm7
14003d50d mov qword ptr [rsp + 0x248], 0
14003d519 mov rax, qword ptr [rbx]
14003d51c movaps xmm0, xmmword ptr [rsp + 0x1f0]
14003d524 mov rcx, qword ptr [rsp + 0x200]
14003d52c mov rdx, qword ptr [rsp + 0x208]
14003d534 mov r8, qword ptr [rsp + 0x210]
14003d53c mov r9, qword ptr [rsp + 0x218]
14003d544 movaps xmm1, xmmword ptr [rsp + 0x220]
14003d54c movups xmmword ptr [rsp + 0x40], xmm0
14003d551 mov qword ptr [rsp + 0x50], rcx
14003d556 mov qword ptr [rsp + 0x58], rdx
14003d55b mov qword ptr [rsp + 0x60], r8
14003d560 mov qword ptr [rsp + 0x68], r9
14003d565 movups xmmword ptr [rsp + 0x70], xmm1
14003d56a movaps xmm0, xmmword ptr [rsp + 0x230]
14003d572 movups xmmword ptr [rsp + 0x80], xmm0
14003d57a movaps xmm0, xmmword ptr [rsp + 0x240]
14003d582 movups xmmword ptr [rsp + 0x90], xmm0
14003d58a mov qword ptr [rsp + 0xa0], 0
14003d596 mov dword ptr [rsp + 0xe0], 1
14003d5a1 movups xmmword ptr [rsp + 0x108], xmm8
14003d5aa movups xmm0, xmmword ptr [rip + 0x5e892a7]
14003d5b1 movups xmmword ptr [rsp + 0xf8], xmm0
14003d5b9 movups xmmword ptr [rsp + 0x128], xmm10
14003d5c2 movups xmm0, xmmword ptr [rip + 0x5e892af]
14003d5c9 movups xmmword ptr [rsp + 0x118], xmm0
14003d5d1 movups xmmword ptr [rsp + 0x148], xmm11
14003d5da movups xmmword ptr [rsp + 0x138], xmm9
14003d5e3 movups xmmword ptr [rsp + 0x168], xmm12
14003d5ec movups xmmword ptr [rsp + 0x158], xmm13
14003d5f5 movaps xmm0, xmmword ptr [rip + 0x5e64cc4]
14003d5fc movups xmmword ptr [rsp + 0x178], xmm0
14003d604 mov dword ptr [rsp + 0x188], 1
14003d60f movss xmm0, dword ptr [rip + 0x5e64cb9]
14003d617 movlps qword ptr [rsp + 0x18c], xmm0
14003d61f mov byte ptr [rsp + 0x194], 1
14003d627 movsd xmm0, qword ptr [rip + 0x5e64cb1]
14003d62f movsd qword ptr [rsp + 0x198], xmm0
14003d638 mov dword ptr [rsp + 0x1a0], 0x3f800000
14003d643 mov word ptr [rsp + 0x1a4], 0
14003d64d mov word ptr [rsp + 0x1aa], 0
14003d657 mov dword ptr [rsp + 0x1a6], 0x10000
14003d662 mov word ptr [rsp + 0x1b0], 0
14003d66c mov dword ptr [rsp + 0x1ac], 0x10000
14003d677 mov word ptr [rsp + 0x1b6], 0
14003d681 mov dword ptr [rsp + 0x1b2], 0
14003d68c mov qword ptr [rsp + 0x38], rax
14003d691 lea r9, [rip + 0x5eb4f30]
14003d698 lea rbx, [rsp + 0x1c0]
14003d6a0 lea r8, [rsp + 0x38]
14003d6a5 mov rcx, rbx
14003d6a8 mov rdx, rsi
14003d6ab call 0x1402628b0
14003d6b0 mov qword ptr [rsp + 0x38], rdi
14003d6b5 mov qword ptr [rsp + 0x40], r15
14003d6ba mov qword ptr [rsp + 0x48], r14
14003d6bf lea rdx, [rsp + 0x38]
14003d6c4 mov rcx, rbx
14003d6c7 call 0x14029dd10
14003d6cc jmp 0x14003d943
14003d6d1 lea rcx, [rip + 0x5e89668] # 145ec6d40 b"Looking for lobbies...No public lobbies right now. Host one!{hero}'s runheroLobby nameDescription (optional)what the run is aboutPassword (optional)noneYour hero and zone are the p"
14003d6d8 mov edx, 0x16
14003d6dd call 0x145895670
14003d6e2 mov r14, rdx
14003d6e5 test rdx, rdx
14003d6e8 js 0x14003d759
14003d6ea je 0x14003d769
14003d6ec mov r12, rax
14003d6ef call 0x140002200
14003d6f4 mov r13d, 1
14003d6fa mov edx, 1
14003d6ff mov rcx, r14
14003d702 call 0x1400021c0
14003d707 test rax, rax
14003d70a je 0x14003d75c
14003d70c mov r15, rax
14003d70f mov rcx, rax
14003d712 mov rdx, r12
14003d715 mov r8, r14
14003d718 call 0x145cf998b
14003d71d cmp byte ptr [rdi], 1
14003d720 jne 0x14003d774
14003d722 mov eax, dword ptr [rdi + 1]
14003d725 mov ecx, dword ptr [rdi + 4]
14003d728 mov dword ptr [rsp + 0x2b], ecx
14003d72c mov dword ptr [rsp + 0x28], eax
14003d730 mov rax, qword ptr [rdi + 8]
14003d734 movzx ecx, byte ptr [rdi + 0x10]
14003d738 mov dl, 1
14003d73a jmp 0x14003d784
14003d73c lea rcx, [rip + 0x5e89613] # 145ec6d56 b"No public lobbies right now. Host one!{hero}'s runheroLobby nameDescription (optional)what the run is aboutPassword (optional)noneYour hero and zone are the picker's. Friends join "
14003d743 mov edx, 0x26
14003d748 call 0x145895670
14003d74d mov r14, rdx
14003d750 test rdx, rdx
14003d753 jns 0x14003d7dd
14003d759 xor r13d, r13d
14003d75c mov rcx, r13
14003d75f mov rdx, r14
14003d762 call 0x145e9bd8b
14003d767 ud2
14003d769 mov r15d, 1
14003d76f cmp byte ptr [rdi], 1
14003d772 je 0x14003d722
14003d774 mov rax, qword ptr [rdi + 8]
14003d778 lock inc qword ptr [rax]
14003d77c jle 0x14003d9ae
14003d782 xor edx, edx
14003d784 movups xmm0, xmmword ptr [rip + 0x5e887a5]
14003d78b movups xmmword ptr [rsp + 0x1c1], xmm0
14003d793 mov dword ptr [rsp + 0x1d1], 0x3f800000
14003d79e mov r8, qword ptr [rbx]
14003d7a1 mov qword ptr [rsp + 0x40], r14
14003d7a6 mov qword ptr [rsp + 0x48], r15
14003d7ab mov qword ptr [rsp + 0x50], r14
14003d7b0 mov qword ptr [rsp + 0x58], 0
14003d7b9 mov qword ptr [rsp + 0x60], 4
14003d7c2 mov qword ptr [rsp + 0x68], 0
14003d7cb mov byte ptr [rsp + 0x70], dl
14003d7cf mov edx, dword ptr [rsp + 0x28]
14003d7d3 mov r9d, dword ptr [rsp + 0x2b]
14003d7d8 jmp 0x14003d8a2
14003d7dd je 0x14003d833
14003d7df mov r12, rax
14003d7e2 call 0x140002200
14003d7e7 mov r13d, 1
14003d7ed mov edx, 1
14003d7f2 mov rcx, r14
14003d7f5 call 0x1400021c0
14003d7fa test rax, rax
14003d7fd je 0x14003d75c
14003d803 mov r15, rax
14003d806 mov rcx, rax
14003d809 mov rdx, r12
14003d80c mov r8, r14
14003d80f call 0x145cf998b
14003d814 cmp byte ptr [rdi], 1
14003d817 jne 0x14003d83e
14003d819 mov eax, dword ptr [rdi + 1]
14003d81c mov ecx, dword ptr [rdi + 4]
14003d81f mov dword ptr [rsp + 0x33], ecx
14003d823 mov dword ptr [rsp + 0x30], eax
14003d827 mov rax, qword ptr [rdi + 8]
14003d82b movzx ecx, byte ptr [rdi + 0x10]
14003d82f mov dl, 1
14003d831 jmp 0x14003d84e
14003d833 mov r15d, 1
14003d839 cmp byte ptr [rdi], 1
14003d83c je 0x14003d819
14003d83e mov rax, qword ptr [rdi + 8]
14003d842 lock inc qword ptr [rax]
14003d846 jle 0x14003d9ae
14003d84c xor edx, edx
14003d84e movups xmm0, xmmword ptr [rip + 0x5e886db]
14003d855 movups xmmword ptr [rsp + 0x1c1], xmm0
14003d85d mov dword ptr [rsp + 0x1d1], 0x3f800000
14003d868 mov r8, qword ptr [rbx]
14003d86b mov qword ptr [rsp + 0x40], r14
14003d870 mov qword ptr [rsp + 0x48], r15
14003d875 mov qword ptr [rsp + 0x50], r14
14003d87a mov qword ptr [rsp + 0x58], 0
14003d883 mov qword ptr [rsp + 0x60], 4
14003d88c mov qword ptr [rsp + 0x68], 0
14003d895 mov byte ptr [rsp + 0x70], dl
14003d899 mov edx, dword ptr [rsp + 0x30]
14003d89d mov r9d, dword ptr [rsp + 0x33]
14003d8a2 mov dword ptr [rsp + 0x71], edx
14003d8a6 mov dword ptr [rsp + 0x74], r9d
14003d8ab mov qword ptr [rsp + 0x78], rax
14003d8b0 mov qword ptr [rsp + 0x80], rcx
14003d8b8 mov dword ptr [rsp + 0x88], 0x41800000
14003d8c3 mov word ptr [rsp + 0x8c], 0x190
14003d8cd mov byte ptr [rsp + 0x8e], 1
14003d8d5 movups xmm0, xmmword ptr [rsp + 0x1c0]
14003d8dd movups xmmword ptr [rsp + 0x8f], xmm0
14003d8e5 mov rax, qword ptr [rsp + 0x1cd]
14003d8ed mov qword ptr [rsp + 0x9c], rax
14003d8f5 mov eax, dword ptr [rip + 0x5e91fdd]
14003d8fb mov dword ptr [rsp + 0xb4], eax
14003d902 movups xmm0, xmmword ptr [rip + 0x5e91fbf]
14003d909 movups xmmword ptr [rsp + 0xa4], xmm0
14003d911 movsd xmm0, qword ptr [rip + 0x5e647b7]
14003d919 movsd qword ptr [rsp + 0xb8], xmm0
14003d922 mov qword ptr [rsp + 0x38], r8
14003d927 lea r9, [rip + 0x5eb4c9a]
14003d92e lea rcx, [rsp + 0x1f0]
14003d936 lea r8, [rsp + 0x38]
14003d93b mov rdx, rsi
14003d93e call 0x140278cc0
14003d943 movaps xmm6, xmmword ptr [rsp + 0x330]
14003d94b movaps xmm7, xmmword ptr [rsp + 0x340]
14003d953 movaps xmm8, xmmword ptr [rsp + 0x350]
14003d95c movaps xmm9, xmmword ptr [rsp + 0x360]
14003d965 movaps xmm10, xmmword ptr [rsp + 0x370]
14003d96e movaps xmm11, xmmword ptr [rsp + 0x380]
14003d977 movaps xmm12, xmmword ptr [rsp + 0x390]
14003d980 movaps xmm13, xmmword ptr [rsp + 0x3a0]
14003d989 movaps xmm14, xmmword ptr [rsp + 0x3b0]
14003d992 movaps xmm15, xmmword ptr [rsp + 0x3c0]
14003d99b add rsp, 0x3d0
14003d9a2 pop rbx
14003d9a3 pop rdi
14003d9a4 pop rsi
14003d9a5 pop r12
14003d9a7 pop r13
14003d9a9 pop r14
14003d9ab pop r15
14003d9ad ret
14003d9ae ud2
