14029b100 push rbp
14029b101 push r15
14029b103 push r14
14029b105 push r13
14029b107 push r12
14029b109 push rsi
14029b10a push rdi
14029b10b push rbx
14029b10c sub rsp, 0x678
14029b113 lea rbp, [rsp + 0x80]
14029b11b movaps xmmword ptr [rbp + 0x5e0], xmm14
14029b123 movaps xmmword ptr [rbp + 0x5d0], xmm13
14029b12b movaps xmmword ptr [rbp + 0x5c0], xmm12
14029b133 movaps xmmword ptr [rbp + 0x5b0], xmm11
14029b13b movaps xmmword ptr [rbp + 0x5a0], xmm10
14029b143 movaps xmmword ptr [rbp + 0x590], xmm9
14029b14b movaps xmmword ptr [rbp + 0x580], xmm8
14029b153 movaps xmmword ptr [rbp + 0x570], xmm7
14029b15a movaps xmmword ptr [rbp + 0x560], xmm6
14029b161 mov qword ptr [rbp + 0x558], 0xfffffffffffffffe
14029b16c mov rsi, r8
14029b16f mov r8, qword ptr [rcx]
14029b172 mov rax, qword ptr [rcx + 0x28]
14029b176 mov qword ptr [rbp + 0x520], r8
14029b17d mov qword ptr [rbp + 0x388], r8
14029b184 movups xmm0, xmmword ptr [rcx + 8]
14029b188 movups xmmword ptr [rbp + 0x390], xmm0
14029b18f mov qword ptr [rbp + 0x540], rcx
14029b196 movups xmm0, xmmword ptr [rcx + 0x18]
14029b19a movups xmmword ptr [rbp + 0x3a0], xmm0
14029b1a1 mov qword ptr [rbp + 0x3b0], rax
14029b1a8 movzx eax, byte ptr [rdx + 0x117]
14029b1af mov byte ptr [rbp + 0x557], al
14029b1b5 lea rcx, [rip + 0x5c65e1e] # 145f00fda b'LobbiesHostJoin by code'
14029b1bc mov edx, 7
14029b1c1 call 0x145895670
14029b1c6 mov rbx, rax
14029b1c9 mov r14, rdx
14029b1cc lea rcx, [rip + 0x5c65e0e] # 145f00fe1 b'HostJoin by code'
14029b1d3 mov edx, 4
14029b1d8 call 0x145895670
14029b1dd mov r15, rax
14029b1e0 mov r12, rdx
14029b1e3 lea rcx, [rip + 0x5c65dfb] # 145f00fe5 b'Join by code'
14029b1ea mov edx, 0xc
14029b1ef call 0x145895670
14029b1f4 mov byte ptr [rbp + 0x4a8], 0
14029b1fb mov qword ptr [rbp + 0x4b0], rbx
14029b202 mov qword ptr [rbp + 0x4b8], r14
14029b209 mov byte ptr [rbp + 0x4c0], 1
14029b210 mov qword ptr [rbp + 0x4c8], r15
14029b217 mov qword ptr [rbp + 0x4d0], r12
14029b21e mov byte ptr [rbp + 0x4d8], 2
14029b225 mov qword ptr [rbp + 0x4e0], rax
14029b22c mov qword ptr [rbp + 0x4e8], rdx
14029b233 lea rdx, [rbp + 0x504]
14029b23a lea rdi, [rbp + 0x230]
14029b241 lea r14, [rbp - 0x58]
14029b245 movzx eax, byte ptr [rsi]
14029b248 mov byte ptr [rbp + 0x556], al
14029b24e mov rax, qword ptr [rsi + 8]
14029b252 mov qword ptr [rbp + 0x548], rax
14029b259 movzx eax, byte ptr [rsi + 0x10]
14029b25d mov qword ptr [rbp + 0x530], rax
14029b264 inc rsi
14029b267 mov qword ptr [rbp + 0x538], rsi
14029b26e mov esi, 0x20
14029b273 movss xmm6, dword ptr [rip + 0x5c06e75]
14029b27b xorps xmm7, xmm7
14029b27e movaps xmm8, xmmword ptr [rip + 0x5c46eba]
14029b286 movaps xmm9, xmmword ptr [rip + 0x5c06dc2]
14029b28e movaps xmm10, xmmword ptr [rip + 0x5c06dda]
14029b296 movaps xmm11, xmmword ptr [rip + 0x5c06d92]
14029b29e lea rcx, [rbp + 0x3b8]
14029b2a5 movsd xmm12, qword ptr [rip + 0x5c06e22]
14029b2ae movss xmm13, dword ptr [rip + 0x5c06dcd]
14029b2b7 movzx r12d, byte ptr [rbp + rsi + 0x488]
14029b2c0 cmp r12b, 0xff
14029b2c4 je 0x14029b7cc
14029b2ca cmp byte ptr [rbp + 0x557], r12b
14029b2d1 jne 0x14029b2f0
14029b2d3 movups xmm0, xmmword ptr [rip + 0x5c626e2]
14029b2da movaps xmmword ptr [rbp - 0x60], xmm0
14029b2de mov dword ptr [rbp - 0x50], 0x3f800000
14029b2e5 movaps xmm0, xmm6
14029b2e8 jmp 0x14029b306
14029b2ea nop word ptr [rax + rax]
14029b2f0 movups xmm0, xmmword ptr [rip + 0x5c629f9]
14029b2f7 movaps xmmword ptr [rbp - 0x60], xmm0
14029b2fb mov dword ptr [rbp - 0x50], 0x3f800000
14029b302 movaps xmm0, xmm13
14029b306 mov rax, qword ptr [rbp + rsi + 0x490]
14029b30e mov qword ptr [rbp + 0x528], rax
14029b315 mov rbx, qword ptr [rbp + rsi + 0x498]
14029b31d mov eax, dword ptr [rbp - 0x50]
14029b320 mov dword ptr [rbp + 0x500], eax
14029b326 movaps xmm1, xmmword ptr [rbp - 0x60]
14029b32a movaps xmmword ptr [rbp + 0x4f0], xmm1
14029b331 movups xmm14, xmmword ptr [rip + 0x5c62683]
14029b339 movups xmmword ptr [rdx], xmm14
14029b33d mov dword ptr [rdx + 0x10], 0x3f800000
14029b344 mov word ptr [rbp + 0x334], 0
14029b34d mov byte ptr [rbp + 0x324], 1
14029b354 movups xmmword ptr [rdi + 0x40], xmm7
14029b358 movups xmmword ptr [rdi + 0x30], xmm7
14029b35c movups xmmword ptr [rdi + 0x20], xmm7
14029b360 movups xmmword ptr [rdi + 0x10], xmm7
14029b364 movups xmmword ptr [rdi], xmm7
14029b367 mov qword ptr [rdi + 0x50], 0
14029b36f mov word ptr [rdi + 0x11c], 0
14029b378 mov dword ptr [rdi + 0x118], 0
14029b382 movups xmm1, xmmword ptr [rip + 0x5c6270f]
14029b389 movups xmmword ptr [rdi + 0x68], xmm1
14029b38d movups xmm1, xmmword ptr [rip + 0x5c626f4]
14029b394 movups xmmword ptr [rdi + 0x58], xmm1
14029b398 movups xmmword ptr [rbp + 0x2a8], xmm8
14029b3a0 movups xmmword ptr [rbp + 0x2b8], xmm9
14029b3a8 mov dword ptr [rbp + 0x2c8], 1
14029b3b2 movss dword ptr [rbp + 0x2cc], xmm0
14029b3ba mov dword ptr [rbp + 0x2d0], 1
14029b3c4 movss dword ptr [rbp + 0x2d4], xmm0
14029b3cc mov dword ptr [rbp + 0x2d8], 1
14029b3d6 movss dword ptr [rbp + 0x2dc], xmm0
14029b3de mov dword ptr [rbp + 0x2e0], 1
14029b3e8 movss dword ptr [rbp + 0x2e4], xmm0
14029b3f0 movups xmmword ptr [rbp + 0x2e8], xmm10
14029b3f8 movups xmmword ptr [rbp + 0x2f8], xmm10
14029b400 mov byte ptr [rbp + 0x346], 0
14029b407 mov dword ptr [rbp + 0x342], 0
14029b411 mov qword ptr [rbp + 0x328], 0
14029b41c mov dword ptr [rbp + 0x330], 0x3f800000
14029b426 movups xmmword ptr [rbp + 0x308], xmm11
14029b42e mov dword ptr [rbp + 0x318], 1
14029b438 mov qword ptr [rbp + 0x31c], 0
14029b443 mov byte ptr [rbp + 0x347], 0
14029b44a movups xmm0, xmmword ptr [rip + 0x5c6257f]
14029b451 movaps xmmword ptr [rbp + 0x1d0], xmm0
14029b458 mov qword ptr [rbp + 0x1e0], 0
14029b463 movups xmm0, xmmword ptr [rip + 0x5c6257e]
14029b46a movups xmmword ptr [rdi - 0x48], xmm0
14029b46e mov qword ptr [rdi - 0x38], 0
14029b476 movups xmm0, xmmword ptr [rip + 0x5c62583]
14029b47d movups xmmword ptr [rdi - 0x30], xmm0
14029b481 mov qword ptr [rdi - 0x20], 0
14029b489 movups xmm0, xmmword ptr [rip + 0x5c62588]
14029b490 movups xmmword ptr [rdi - 0x18], xmm0
14029b494 mov qword ptr [rdi - 8], 0
14029b49c mov dword ptr [rdi + 0x106], 0x10000
14029b4a6 mov word ptr [rdi + 0x10a], 0
14029b4af mov word ptr [rdi + 0x110], 0
14029b4b8 mov dword ptr [rdi + 0x10c], 0x10000
14029b4c2 mov r15, rcx
14029b4c5 call 0x1400de320
14029b4ca nop
14029b4cb mov rax, qword ptr [rbp + 0x510]
14029b4d2 lea rcx, [rbp + 0x360]
14029b4d9 mov qword ptr [rcx + 0x20], rax
14029b4dd movaps xmm0, xmmword ptr [rbp + 0x4f0]
14029b4e4 movaps xmm1, xmmword ptr [rbp + 0x500]
14029b4eb movups xmmword ptr [rcx + 0x10], xmm1
14029b4ef movups xmmword ptr [rcx], xmm0
14029b4f2 mov r8d, 0x180
14029b4f8 mov rcx, r14
14029b4fb lea r13, [rbp + 0x1d0]
14029b502 mov rdx, r13
14029b505 call 0x145cf998b
14029b50a mov rax, qword ptr [rbp + 0x418]
14029b511 lea rcx, [rbp + 0x423]
14029b518 mov qword ptr [rcx + 0x60], rax
14029b51c movups xmm0, xmmword ptr [rbp + 0x408]
14029b523 movups xmmword ptr [rcx + 0x50], xmm0
14029b527 movups xmm0, xmmword ptr [rbp + 0x3f8]
14029b52e movups xmmword ptr [rcx + 0x40], xmm0
14029b532 movups xmm0, xmmword ptr [rbp + 0x3b8]
14029b539 movups xmm1, xmmword ptr [rbp + 0x3c8]
14029b540 movups xmm2, xmmword ptr [rbp + 0x3d8]
14029b547 movups xmm3, xmmword ptr [rbp + 0x3e8]
14029b54e movups xmmword ptr [rcx + 0x30], xmm3
14029b552 movups xmmword ptr [rcx + 0x20], xmm2
14029b556 movups xmmword ptr [rcx + 0x10], xmm1
14029b55a movups xmmword ptr [rcx], xmm0
14029b55d mov byte ptr [rbp + 0x128], 0
14029b564 mov byte ptr [rbp + 0x129], r12b
14029b56b movups xmm0, xmmword ptr [rbp + 0x352]
14029b572 movups xmm1, xmmword ptr [rbp + 0x362]
14029b579 movups xmm2, xmmword ptr [rbp + 0x372]
14029b580 movups xmmword ptr [r14 + 0x182], xmm0
14029b588 movups xmmword ptr [r14 + 0x192], xmm1
14029b590 movups xmmword ptr [r14 + 0x1a2], xmm2
14029b598 mov rax, qword ptr [rbp + 0x380]
14029b59f mov qword ptr [r14 + 0x1b0], rax
14029b5a6 mov dword ptr [rbp + 0x160], 0x3f800000
14029b5b0 mov byte ptr [rbp + 0x164], 2
14029b5b7 movups xmm0, xmmword ptr [rbp + 0x420]
14029b5be movups xmm1, xmmword ptr [rbp + 0x430]
14029b5c5 movups xmm2, xmmword ptr [rbp + 0x440]
14029b5cc movups xmm3, xmmword ptr [rbp + 0x450]
14029b5d3 movups xmmword ptr [r14 + 0x1bd], xmm0
14029b5db movups xmmword ptr [r14 + 0x1cd], xmm1
14029b5e3 movups xmmword ptr [r14 + 0x1dd], xmm2
14029b5eb movups xmmword ptr [r14 + 0x1ed], xmm3
14029b5f3 movups xmm0, xmmword ptr [rbp + 0x460]
14029b5fa movups xmmword ptr [r14 + 0x1fd], xmm0
14029b602 movups xmm0, xmmword ptr [rbp + 0x470]
14029b609 movups xmmword ptr [r14 + 0x20d], xmm0
14029b611 movups xmm0, xmmword ptr [rbp + 0x47b]
14029b618 movups xmmword ptr [r14 + 0x218], xmm0
14029b620 mov rax, qword ptr [rbp + 0x520]
14029b627 mov qword ptr [rbp - 0x60], rax
14029b62b mov rcx, r13
14029b62e lea rdx, [rbp + 0x390]
14029b635 lea r8, [rbp - 0x60]
14029b639 call 0x14026b850
14029b63e cmp byte ptr [rbp + 0x557], r12b
14029b645 jne 0x14029b670
14029b647 movaps xmmword ptr [rbp + 0x420], xmm14
14029b64f mov dword ptr [rbp + 0x430], 0x3f800000
14029b659 test rbx, rbx
14029b65c js 0x14029b82d
14029b662 jmp 0x14029b691
14029b664 nop word ptr cs:[rax + rax]
14029b670 movups xmm0, xmmword ptr [rip + 0x5c622d1]
14029b677 movaps xmmword ptr [rbp + 0x420], xmm0
14029b67e mov dword ptr [rbp + 0x430], 0x3f800000
14029b688 test rbx, rbx
14029b68b js 0x14029b82d
14029b691 je 0x14029b6ee
14029b693 call 0x140002200
14029b698 mov r12d, 1
14029b69e mov edx, 1
14029b6a3 mov rcx, rbx
14029b6a6 call 0x1400021c0
14029b6ab test rax, rax
14029b6ae je 0x14029b830
14029b6b4 mov r13, rax
14029b6b7 mov rcx, rax
14029b6ba mov rdx, qword ptr [rbp + 0x528]
14029b6c1 mov r8, rbx
14029b6c4 call 0x145cf998b
14029b6c9 cmp byte ptr [rbp + 0x556], 0
14029b6d0 je 0x14029b6fd
14029b6d2 mov rcx, qword ptr [rbp + 0x538]
14029b6d9 mov eax, dword ptr [rcx]
14029b6db mov ecx, dword ptr [rcx + 3]
14029b6de mov dword ptr [rbp + 0x3bb], ecx
14029b6e4 mov dword ptr [rbp + 0x3b8], eax
14029b6ea mov al, 1
14029b6ec jmp 0x14029b710
14029b6ee mov r13d, 1
14029b6f4 cmp byte ptr [rbp + 0x556], 0
14029b6fb jne 0x14029b6d2
14029b6fd mov rax, qword ptr [rbp + 0x548]
14029b704 lock inc qword ptr [rax]
14029b708 jle 0x14029b83b
14029b70e xor eax, eax
14029b710 mov qword ptr [rbp - 0x60], rbx
14029b714 mov qword ptr [rbp - 0x58], r13
14029b718 mov qword ptr [rbp - 0x50], rbx
14029b71c mov qword ptr [rbp - 0x48], 0
14029b724 mov qword ptr [rbp - 0x40], 4
14029b72c mov qword ptr [rbp - 0x38], 0
14029b734 mov byte ptr [rbp - 0x30], al
14029b737 mov eax, dword ptr [rbp + 0x3b8]
14029b73d mov ecx, dword ptr [rbp + 0x3bb]
14029b743 mov dword ptr [r14 + 0x2c], ecx
14029b747 mov dword ptr [r14 + 0x29], eax
14029b74b mov rax, qword ptr [rbp + 0x548]
14029b752 mov qword ptr [rbp - 0x28], rax
14029b756 mov rax, qword ptr [rbp + 0x530]
14029b75d mov qword ptr [rbp - 0x20], rax
14029b761 mov dword ptr [rbp - 0x18], 0x41880000
14029b768 mov word ptr [rbp - 0x14], 0x190
14029b76e mov byte ptr [rbp - 0x12], 1
14029b772 mov eax, dword ptr [rbp + 0x430]
14029b778 mov dword ptr [r14 + 0x58], eax
14029b77c movaps xmm0, xmmword ptr [rbp + 0x420]
14029b783 movups xmmword ptr [r14 + 0x48], xmm0
14029b788 mov eax, dword ptr [rip + 0x5c3414a]
14029b78e mov dword ptr [r14 + 0x6c], eax
14029b792 movups xmm0, xmmword ptr [rip + 0x5c3412f]
14029b799 movups xmmword ptr [r14 + 0x5c], xmm0
14029b79e movsd qword ptr [rbp + 0x18], xmm12
14029b7a4 lea rcx, [rbp + 0x1d0]
14029b7ab lea rdx, [rbp - 0x60]
14029b7af call 0x14027ff50
14029b7b4 add rsi, 0x18
14029b7b8 cmp rsi, 0x68
14029b7bc lea rdx, [rbp + 0x504]
14029b7c3 mov rcx, r15
14029b7c6 jne 0x14029b2b7
14029b7cc mov rax, qword ptr [rbp + 0x540]
14029b7d3 movaps xmm6, xmmword ptr [rbp + 0x560]
14029b7da movaps xmm7, xmmword ptr [rbp + 0x570]
14029b7e1 movaps xmm8, xmmword ptr [rbp + 0x580]
14029b7e9 movaps xmm9, xmmword ptr [rbp + 0x590]
14029b7f1 movaps xmm10, xmmword ptr [rbp + 0x5a0]
14029b7f9 movaps xmm11, xmmword ptr [rbp + 0x5b0]
14029b801 movaps xmm12, xmmword ptr [rbp + 0x5c0]
14029b809 movaps xmm13, xmmword ptr [rbp + 0x5d0]
14029b811 movaps xmm14, xmmword ptr [rbp + 0x5e0]
14029b819 add rsp, 0x678
14029b820 pop rbx
14029b821 pop rdi
14029b822 pop rsi
14029b823 pop r12
14029b825 pop r13
14029b827 pop r14
14029b829 pop r15
14029b82b pop rbp
14029b82c ret
14029b82d xor r12d, r12d
14029b830 mov rcx, r12
14029b833 mov rdx, rbx
14029b836 call 0x145e9bd8b
14029b83b ud2
