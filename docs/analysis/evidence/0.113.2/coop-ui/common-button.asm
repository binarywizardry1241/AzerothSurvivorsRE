14003b350 push rbp
14003b351 push r15
14003b353 push r14
14003b355 push r12
14003b357 push rsi
14003b358 push rdi
14003b359 push rbx
14003b35a sub rsp, 0x5b0
14003b361 lea rbp, [rsp + 0x80]
14003b369 mov qword ptr [rbp + 0x528], 0xfffffffffffffffe
14003b374 mov rdi, r9
14003b377 mov r15, r8
14003b37a mov rsi, rdx
14003b37d mov rbx, rcx
14003b380 movups xmm0, xmmword ptr [rip + 0x5e8abbd]
14003b387 movaps xmmword ptr [rbp + 0x4b0], xmm0
14003b38e mov dword ptr [rbp + 0x4c0], 0x3f800000
14003b398 movups xmm0, xmmword ptr [rip + 0x5e8b6ad]
14003b39f movups xmmword ptr [rbp + 0x4c4], xmm0
14003b3a6 mov dword ptr [rbp + 0x4d4], 0x3f800000
14003b3b0 mov word ptr [rbp + 0x3c4], 0
14003b3b9 mov byte ptr [rbp + 0x3b4], 1
14003b3c0 xorps xmm0, xmm0
14003b3c3 movups xmmword ptr [rbp + 0x2c8], xmm0
14003b3ca movups xmmword ptr [rbp + 0x2d8], xmm0
14003b3d1 movups xmmword ptr [rbp + 0x2e8], xmm0
14003b3d8 movabs rax, 0x4220000000000001
14003b3e2 mov qword ptr [rbp + 0x2f8], rax
14003b3e9 mov qword ptr [rbp + 0x2c0], 0
14003b3f4 movaps xmmword ptr [rbp + 0x300], xmm0
14003b3fb mov qword ptr [rbp + 0x310], 0
14003b406 mov dword ptr [rbp + 0x3d8], 0
14003b410 mov word ptr [rbp + 0x3dc], 0x500
14003b419 movups xmm0, xmmword ptr [rip + 0x5e8b438]
14003b420 movups xmmword ptr [rbp + 0x318], xmm0
14003b427 movups xmm0, xmmword ptr [rip + 0x5e8b43a]
14003b42e movups xmmword ptr [rbp + 0x328], xmm0
14003b435 movaps xmm0, xmmword ptr [rip + 0x5e66ca4]
14003b43c movups xmmword ptr [rbp + 0x338], xmm0
14003b443 movaps xmm0, xmmword ptr [rip + 0x5e66c06]
14003b44a movups xmmword ptr [rbp + 0x348], xmm0
14003b451 movaps xmm0, xmmword ptr [rip + 0x5e66c08]
14003b458 movups xmmword ptr [rbp + 0x358], xmm0
14003b45f movups xmmword ptr [rbp + 0x368], xmm0
14003b466 movaps xmm0, xmmword ptr [rip + 0x5e66c03]
14003b46d movups xmmword ptr [rbp + 0x378], xmm0
14003b474 movups xmmword ptr [rbp + 0x388], xmm0
14003b47b mov byte ptr [rbp + 0x3d6], 0
14003b482 mov dword ptr [rbp + 0x3d2], 0
14003b48c mov qword ptr [rbp + 0x3b8], 0
14003b497 mov dword ptr [rbp + 0x3c0], 0x3f800000
14003b4a1 movaps xmm0, xmmword ptr [rip + 0x5e66b88]
14003b4a8 movups xmmword ptr [rbp + 0x398], xmm0
14003b4af mov dword ptr [rbp + 0x3a8], 1
14003b4b9 mov qword ptr [rbp + 0x3ac], 0
14003b4c4 mov byte ptr [rbp + 0x3d7], 0
14003b4cb movups xmm0, xmmword ptr [rip + 0x5e8b2ce]
14003b4d2 movaps xmmword ptr [rbp + 0x260], xmm0
14003b4d9 mov qword ptr [rbp + 0x270], 0
14003b4e4 movups xmm0, xmmword ptr [rip + 0x5e8b2cd]
14003b4eb movups xmmword ptr [rbp + 0x278], xmm0
14003b4f2 mov qword ptr [rbp + 0x288], 0
14003b4fd movups xmm0, xmmword ptr [rip + 0x5e8b2cc]
14003b504 movaps xmmword ptr [rbp + 0x290], xmm0
14003b50b mov qword ptr [rbp + 0x2a0], 0
14003b516 movups xmm0, xmmword ptr [rip + 0x5e8b2cb]
14003b51d movups xmmword ptr [rbp + 0x2a8], xmm0
14003b524 mov qword ptr [rbp + 0x2b8], 0
14003b52f mov word ptr [rbp + 0x3ca], 0
14003b538 mov dword ptr [rbp + 0x3c6], 0x10000
14003b542 mov word ptr [rbp + 0x3d0], 0
14003b54b mov dword ptr [rbp + 0x3cc], 0x10000
14003b555 lea rcx, [rbp + 0x1f8]
14003b55c call 0x1400de320
14003b561 nop
14003b562 movups xmm0, xmmword ptr [rip + 0x5e8b4f7]
14003b569 movaps xmmword ptr [rbp + 0x500], xmm0
14003b570 mov dword ptr [rbp + 0x510], 0x3f59999a
14003b57a lea rcx, [rbp + 0x4e0]
14003b581 lea rdx, [rbp + 0x500]
14003b588 call 0x144bf4410
14003b58d nop
14003b58e movaps xmm0, xmmword ptr [rbp + 0x4e0]
14003b595 movups xmmword ptr [rbp - 0x24], xmm0
14003b599 mov dword ptr [rbp - 0x28], 1
14003b5a0 mov dword ptr [rsp + 0x48], 0x40c00000
14003b5a8 mov dword ptr [rsp + 0x40], 1
14003b5b0 mov dword ptr [rsp + 0x38], 0
14003b5b8 mov dword ptr [rsp + 0x30], 1
14003b5c0 mov dword ptr [rsp + 0x28], 0x40000000
14003b5c8 mov dword ptr [rsp + 0x20], 1
14003b5d0 lea rcx, [rbp + 0x4e0]
14003b5d7 lea rdx, [rbp - 0x28]
14003b5db xorps xmm3, xmm3
14003b5de mov r8d, 1
14003b5e4 call 0x1425d1670
14003b5e9 nop
14003b5ea mov r14, qword ptr [rbp + 0x590]
14003b5f1 movups xmm0, xmmword ptr [r15]
14003b5f5 movups xmmword ptr [rbp + 0x1c0], xmm0
14003b5fc movaps xmm0, xmmword ptr [rbp + 0x4b0]
14003b603 movaps xmm1, xmmword ptr [rbp + 0x4c0]
14003b60a movups xmmword ptr [rbp + 0x1d0], xmm0
14003b611 movups xmmword ptr [rbp + 0x1e0], xmm1
14003b618 mov rax, qword ptr [rbp + 0x4d0]
14003b61f mov qword ptr [rbp + 0x1f0], rax
14003b626 lea r15, [rbp - 0x28]
14003b62a lea rdx, [rbp + 0x260]
14003b631 mov r8d, 0x180
14003b637 mov rcx, r15
14003b63a call 0x145cf998b
14003b63f movups xmm0, xmmword ptr [rbp + 0x1f8]
14003b646 movups xmm1, xmmword ptr [rbp + 0x208]
14003b64d movups xmm2, xmmword ptr [rbp + 0x218]
14003b654 movups xmm3, xmmword ptr [rbp + 0x228]
14003b65b movups xmmword ptr [rbp + 0x158], xmm0
14003b662 movups xmmword ptr [rbp + 0x168], xmm1
14003b669 movups xmmword ptr [rbp + 0x178], xmm2
14003b670 movups xmmword ptr [rbp + 0x188], xmm3
14003b677 movups xmm0, xmmword ptr [rbp + 0x238]
14003b67e movups xmmword ptr [rbp + 0x198], xmm0
14003b685 movups xmm0, xmmword ptr [rbp + 0x248]
14003b68c movups xmmword ptr [rbp + 0x1a8], xmm0
14003b693 mov rax, qword ptr [rbp + 0x258]
14003b69a mov qword ptr [rbp + 0x1b8], rax
14003b6a1 movups xmm0, xmmword ptr [rbp + 0x4e0]
14003b6a8 movups xmmword ptr [rbp + 0x503], xmm0
14003b6af mov rax, qword ptr [rbp + 0x4f0]
14003b6b6 mov qword ptr [rbp + 0x513], rax
14003b6bd mov r12, qword ptr [rbx]
14003b6c0 add rbx, 8
14003b6c4 lea rcx, [rbp + 0x268]
14003b6cb mov r8d, 0x220
14003b6d1 mov rdx, r15
14003b6d4 call 0x145cf998b
14003b6d9 mov dword ptr [rbp + 0x488], 0x3f800000
14003b6e3 mov byte ptr [rbp + 0x48c], 2
14003b6ea movups xmm0, xmmword ptr [rbp + 0x500]
14003b6f1 movups xmm1, xmmword ptr [rbp + 0x50b]
14003b6f8 movups xmmword ptr [rbp + 0x48d], xmm0
14003b6ff movups xmmword ptr [rbp + 0x498], xmm1
14003b706 mov qword ptr [rbp + 0x260], r12
14003b70d lea r9, [rip + 0x5eb6eb4]
14003b714 lea rcx, [rbp + 0x1f8]
14003b71b lea r8, [rbp + 0x260]
14003b722 mov rdx, rbx
14003b725 call 0x14026bb00
14003b72a test r14, r14
14003b72d jns 0x14003b73f
14003b72f xor r15d, r15d
14003b732 mov rcx, r15
14003b735 mov rdx, r14
14003b738 call 0x145e9bd8b
14003b73d ud2
14003b73f je 0x14003b78c
14003b741 call 0x140002200
14003b746 mov r15d, 1
14003b74c mov edx, 1
14003b751 mov rcx, r14
14003b754 call 0x1400021c0
14003b759 test rax, rax
14003b75c je 0x14003b732
14003b75e mov rbx, rax
14003b761 mov rcx, rax
14003b764 mov rdx, rdi
14003b767 mov r8, r14
14003b76a call 0x145cf998b
14003b76f cmp byte ptr [rsi], 1
14003b772 jne 0x14003b796
14003b774 mov eax, dword ptr [rsi + 1]
14003b777 mov ecx, dword ptr [rsi + 4]
14003b77a mov dword ptr [rbp - 0x25], ecx
14003b77d mov dword ptr [rbp - 0x28], eax
14003b780 mov rax, qword ptr [rsi + 8]
14003b784 movzx ecx, byte ptr [rsi + 0x10]
14003b788 mov dl, 1
14003b78a jmp 0x14003b7a6
14003b78c mov ebx, 1
14003b791 cmp byte ptr [rsi], 1
14003b794 je 0x14003b774
14003b796 mov rax, qword ptr [rsi + 8]
14003b79a lock inc qword ptr [rax]
14003b79e jle 0x14003b88c
14003b7a4 xor edx, edx
14003b7a6 movss xmm0, dword ptr [rbp + 0x598]
14003b7ae mov qword ptr [rbp + 0x260], r14
14003b7b5 mov qword ptr [rbp + 0x268], rbx
14003b7bc mov qword ptr [rbp + 0x270], r14
14003b7c3 mov qword ptr [rbp + 0x278], 0
14003b7ce mov qword ptr [rbp + 0x280], 4
14003b7d9 mov qword ptr [rbp + 0x288], 0
14003b7e4 mov byte ptr [rbp + 0x290], dl
14003b7ea mov edx, dword ptr [rbp - 0x28]
14003b7ed mov r8d, dword ptr [rbp - 0x25]
14003b7f1 mov dword ptr [rbp + 0x291], edx
14003b7f7 mov dword ptr [rbp + 0x294], r8d
14003b7fe mov qword ptr [rbp + 0x298], rax
14003b805 mov qword ptr [rbp + 0x2a0], rcx
14003b80c movss dword ptr [rbp + 0x2a8], xmm0
14003b814 mov word ptr [rbp + 0x2ac], 0x190
14003b81d mov byte ptr [rbp + 0x2ae], 1
14003b824 movups xmm0, xmmword ptr [rip + 0x5e8b109]
14003b82b movups xmmword ptr [rbp + 0x2b0], xmm0
14003b832 mov dword ptr [rbp + 0x2c0], 0x3f800000
14003b83c mov eax, dword ptr [rip + 0x5e94096]
14003b842 mov dword ptr [rbp + 0x2d4], eax
14003b848 movups xmm0, xmmword ptr [rip + 0x5e94079]
14003b84f movups xmmword ptr [rbp + 0x2c4], xmm0
14003b856 movsd xmm0, qword ptr [rip + 0x5e66872]
14003b85e movsd qword ptr [rbp + 0x2d8], xmm0
14003b866 lea rcx, [rbp + 0x1f8]
14003b86d lea rdx, [rbp + 0x260]
14003b874 call 0x14027ff50
14003b879 nop
14003b87a add rsp, 0x5b0
14003b881 pop rbx
14003b882 pop rdi
14003b883 pop rsi
14003b884 pop r12
14003b886 pop r14
14003b888 pop r15
14003b88a pop rbp
14003b88b ret
14003b88c ud2
