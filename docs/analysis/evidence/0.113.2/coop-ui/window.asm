14029e050 push r15
14029e052 push r14
14029e054 push r12
14029e056 push rsi
14029e057 push rdi
14029e058 push rbp
14029e059 push rbx
14029e05a sub rsp, 0x5d0
14029e061 movaps xmmword ptr [rsp + 0x5c0], xmm15
14029e06a movaps xmmword ptr [rsp + 0x5b0], xmm14
14029e073 movaps xmmword ptr [rsp + 0x5a0], xmm13
14029e07c movaps xmmword ptr [rsp + 0x590], xmm12
14029e085 movaps xmmword ptr [rsp + 0x580], xmm11
14029e08e movaps xmmword ptr [rsp + 0x570], xmm10
14029e097 movaps xmmword ptr [rsp + 0x560], xmm9
14029e0a0 movaps xmmword ptr [rsp + 0x550], xmm8
14029e0a9 movaps xmmword ptr [rsp + 0x540], xmm7
14029e0b1 movaps xmmword ptr [rsp + 0x530], xmm6
14029e0b9 mov rdi, rdx
14029e0bc mov rsi, rcx
14029e0bf mov r15, qword ptr [rcx]
14029e0c2 mov rax, qword ptr [rcx + 0x28]
14029e0c6 mov qword ptr [rsp + 0x4d0], r15
14029e0ce lea rbx, [rsp + 0x4d8]
14029e0d6 movups xmm0, xmmword ptr [rcx + 8]
14029e0da movups xmmword ptr [rsp + 0x4d8], xmm0
14029e0e2 movups xmm0, xmmword ptr [rcx + 0x18]
14029e0e6 movups xmmword ptr [rsp + 0x4e8], xmm0
14029e0ee mov qword ptr [rsp + 0x4f8], rax
14029e0f6 mov word ptr [rsp + 0x3e4], 0
14029e100 mov byte ptr [rsp + 0x3d4], 1
14029e108 xorps xmm6, xmm6
14029e10b movups xmmword ptr [rsp + 0x2e8], xmm6
14029e113 movups xmmword ptr [rsp + 0x2f8], xmm6
14029e11b movaps xmm0, xmmword ptr [rip + 0x5c043ee]
14029e122 movups xmmword ptr [rsp + 0x308], xmm0
14029e12a mov qword ptr [rsp + 0x2e0], 0
14029e136 movups xmmword ptr [rsp + 0x318], xmm6
14029e13e movups xmmword ptr [rsp + 0x328], xmm6
14029e146 mov dword ptr [rsp + 0x3fa], 7
14029e151 movups xmm0, xmmword ptr [rip + 0x5c5f930]
14029e158 movups xmmword ptr [rsp + 0x338], xmm0
14029e160 movups xmm7, xmmword ptr [rip + 0x5c5f931]
14029e167 movups xmmword ptr [rsp + 0x348], xmm7
14029e16f movaps xmm0, xmmword ptr [rip + 0x5c5edaa]
14029e176 movups xmmword ptr [rsp + 0x358], xmm0
14029e17e movaps xmm0, xmmword ptr [rip + 0x5c4800b]
14029e185 movups xmmword ptr [rsp + 0x368], xmm0
14029e18d movups xmm9, xmmword ptr [rip + 0x5c5f933]
14029e195 movups xmmword ptr [rsp + 0x378], xmm9
14029e19e movups xmm10, xmmword ptr [rip + 0x5c5f932]
14029e1a6 movups xmmword ptr [rsp + 0x388], xmm10
14029e1af movups xmm12, xmmword ptr [rip + 0x5c5f941]
14029e1b7 movups xmmword ptr [rsp + 0x3a8], xmm12
14029e1c0 movups xmm11, xmmword ptr [rip + 0x5c5f920]
14029e1c8 movups xmmword ptr [rsp + 0x398], xmm11
14029e1d1 mov qword ptr [rsp + 0x3d8], 0
14029e1dd mov dword ptr [rsp + 0x3e0], 0x3f800000
14029e1e8 movaps xmm0, xmmword ptr [rip + 0x5c5ebc1]
14029e1ef movups xmmword ptr [rsp + 0x3b8], xmm0
14029e1f7 mov dword ptr [rsp + 0x3c8], 1
14029e202 mov qword ptr [rsp + 0x3cc], 0
14029e20e movabs rax, 0x100000000
14029e218 mov qword ptr [rsp + 0x3f2], rax
14029e220 movups xmm13, xmmword ptr [rip + 0x5c5f7a8]
14029e228 movaps xmmword ptr [rsp + 0x280], xmm13
14029e231 mov qword ptr [rsp + 0x290], 0
14029e23d movups xmm14, xmmword ptr [rip + 0x5c5f7a3]
14029e245 movups xmmword ptr [rsp + 0x298], xmm14
14029e24e mov qword ptr [rsp + 0x2a8], 0
14029e25a movups xmm8, xmmword ptr [rip + 0x5c5f79e]
14029e262 movaps xmmword ptr [rsp + 0x2b0], xmm8
14029e26b mov qword ptr [rsp + 0x2c0], 0
14029e277 movups xmm15, xmmword ptr [rip + 0x5c5f799]
14029e27f movups xmmword ptr [rsp + 0x2c8], xmm15
14029e288 mov qword ptr [rsp + 0x2d8], 0
14029e294 mov word ptr [rsp + 0x3ea], 0
14029e29e mov dword ptr [rsp + 0x3e6], 0x10000
14029e2a9 mov word ptr [rsp + 0x3f0], 0
14029e2b3 mov dword ptr [rsp + 0x3ec], 0x10000
14029e2be lea r14, [rsp + 0x70]
14029e2c3 lea rdx, [rsp + 0x280]
14029e2cb mov rcx, r14
14029e2ce call 0x1400dee00
14029e2d3 mov word ptr [rsp + 0x270], 2
14029e2dd lea rcx, [rsp + 0x288]
14029e2e5 mov r8d, 0x208
14029e2eb mov rdx, r14
14029e2ee call 0x145cf998b
14029e2f3 mov qword ptr [rsp + 0x280], r15
14029e2fb lea rcx, [rsp + 0x500]
14029e303 lea r8, [rsp + 0x280]
14029e30b mov rdx, rbx
14029e30e call 0x140279220
14029e313 mov rbx, qword ptr [rdi]
14029e316 mov rax, qword ptr [rdi + 8]
14029e31a mov qword ptr [rsp + 0x38], rax
14029e31f mov r15, qword ptr [rdi + 0x10]
14029e323 mov r14, qword ptr [rdi + 0x18]
14029e327 mov r12, qword ptr [rsp + 0x500]
14029e32f mov rax, qword ptr [rsp + 0x528]
14029e337 mov qword ptr [rsp + 0x40], r12
14029e33c lea rdi, [rsp + 0x48]
14029e341 movups xmm0, xmmword ptr [rsp + 0x508]
14029e349 movups xmmword ptr [rsp + 0x48], xmm0
14029e34e movups xmm0, xmmword ptr [rsp + 0x518]
14029e356 movups xmmword ptr [rsp + 0x58], xmm0
14029e35b mov qword ptr [rsp + 0x68], rax
14029e360 movaps xmmword ptr [rsp + 0x110], xmm6
14029e368 movaps xmmword ptr [rsp + 0x100], xmm6
14029e370 movaps xmmword ptr [rsp + 0xf0], xmm6
14029e378 movaps xmmword ptr [rsp + 0xe0], xmm6
14029e380 movaps xmmword ptr [rsp + 0xd0], xmm6
14029e388 movaps xmm6, xmm10
14029e38c mov qword ptr [rsp + 0x120], 0
14029e398 mov byte ptr [rsp + 0x404], 0
14029e3a0 mov dword ptr [rsp + 0x400], 0
14029e3ab movups xmm0, xmmword ptr [rip + 0x5c5f6d6]
14029e3b2 movups xmmword ptr [rsp + 0x128], xmm0
14029e3ba movaps xmm1, xmm8
14029e3be movaps xmm0, xmm12
14029e3c2 movaps xmm12, xmm13
14029e3c6 movaps xmm13, xmm14
14029e3ca movups xmmword ptr [rsp + 0x138], xmm7
14029e3d2 movups xmm8, xmmword ptr [rip + 0x5c5f6ce]
14029e3da movups xmmword ptr [rsp + 0x148], xmm8
14029e3e3 movups xmm10, xmmword ptr [rip + 0x5c5f6cd]
14029e3eb movups xmmword ptr [rsp + 0x158], xmm10
14029e3f4 movups xmmword ptr [rsp + 0x178], xmm6
14029e3fc movups xmmword ptr [rsp + 0x168], xmm9
14029e405 movups xmmword ptr [rsp + 0x198], xmm0
14029e40d movups xmmword ptr [rsp + 0x188], xmm11
14029e416 movaps xmmword ptr [rsp + 0x70], xmm12
14029e41c mov qword ptr [rsp + 0x80], 0
14029e428 movups xmmword ptr [rsp + 0x88], xmm14
14029e431 mov qword ptr [rsp + 0x98], 0
14029e43d movaps xmmword ptr [rsp + 0xa0], xmm1
14029e445 mov qword ptr [rsp + 0xb0], 0
14029e451 movups xmmword ptr [rsp + 0xb8], xmm15
14029e45a mov qword ptr [rsp + 0xc8], 0
14029e466 lea rcx, [rsp + 0x288]
14029e46e lea rdx, [rsp + 0x70]
14029e473 mov r8d, 0x138
14029e479 call 0x145cf998b
14029e47e movaps xmm14, xmmword ptr [rip + 0x5c03baa]
14029e486 movups xmmword ptr [rsp + 0x3c0], xmm14
14029e48f mov dword ptr [rsp + 0x3d0], 1
14029e49a mov qword ptr [rsp + 0x3d4], 0
14029e4a6 mov byte ptr [rsp + 0x3dc], 1
14029e4ae mov qword ptr [rsp + 0x3e0], 0
14029e4ba mov dword ptr [rsp + 0x3e8], 0x3f800000
14029e4c5 mov word ptr [rsp + 0x3ec], 0
14029e4cf mov dword ptr [rsp + 0x3ee], 0x10000
14029e4da mov word ptr [rsp + 0x3f2], 0
14029e4e4 mov dword ptr [rsp + 0x3f4], 0x10000
14029e4ef mov word ptr [rsp + 0x3f8], 0
14029e4f9 mov dword ptr [rsp + 0x3fa], 0
14029e504 mov word ptr [rsp + 0x3fe], 0
14029e50e mov byte ptr [rsp + 0x405], 5
14029e516 mov qword ptr [rsp + 0x280], r12
14029e51e lea rcx, [rsp + 0x490]
14029e526 lea r8, [rsp + 0x280]
14029e52e mov rdx, rdi
14029e531 call 0x1402628b0
14029e536 mov qword ptr [rsp + 0x30], rbx
14029e53b mov rbp, qword ptr [rbx]
14029e53e lea rcx, [rip + 0x5c6105e]
14029e545 mov edx, 5
14029e54a call 0x145895670
14029e54f mov rbx, rdx
14029e552 test rdx, rdx
14029e555 jns 0x14029e567
14029e557 xor r12d, r12d
14029e55a mov rcx, r12
14029e55d mov rdx, rbx
14029e560 call 0x145e9bd8b
14029e565 ud2
14029e567 mov rdi, r12
14029e56a mov qword ptr [rsp + 0x4c8], r14
14029e572 je 0x14029e5d5
14029e574 mov qword ptr [rsp + 0x4c0], r15
14029e57c mov r15, rax
14029e57f call 0x140002200
14029e584 mov r12d, 1
14029e58a mov edx, 1
14029e58f mov rcx, rbx
14029e592 call 0x1400021c0
14029e597 test rax, rax
14029e59a je 0x14029e55a
14029e59c mov r14, rax
14029e59f mov rcx, rax
14029e5a2 mov rdx, r15
14029e5a5 mov r8, rbx
14029e5a8 call 0x145cf998b
14029e5ad mov r15, qword ptr [rsp + 0x4c0]
14029e5b5 cmp byte ptr [rbp + 0x18], 1
14029e5b9 jne 0x14029e5e1
14029e5bb mov eax, dword ptr [rbp + 0x19]
14029e5be mov ecx, dword ptr [rbp + 0x1c]
14029e5c1 mov dword ptr [rsp + 0x73], ecx
14029e5c5 mov dword ptr [rsp + 0x70], eax
14029e5c9 mov rax, qword ptr [rbp + 0x20]
14029e5cd movzx ecx, byte ptr [rbp + 0x28]
14029e5d1 mov dl, 1
14029e5d3 jmp 0x14029e5f1
14029e5d5 mov r14d, 1
14029e5db cmp byte ptr [rbp + 0x18], 1
14029e5df je 0x14029e5bb
14029e5e1 mov rax, qword ptr [rbp + 0x20]
14029e5e5 lock inc qword ptr [rax]
14029e5e9 jle 0x14029f19b
14029e5ef xor edx, edx
14029e5f1 mov qword ptr [rsp + 0x280], rbx
14029e5f9 mov qword ptr [rsp + 0x288], r14
14029e601 mov qword ptr [rsp + 0x290], rbx
14029e609 mov qword ptr [rsp + 0x298], 0
14029e615 mov qword ptr [rsp + 0x2a0], 4
14029e621 mov qword ptr [rsp + 0x2a8], 0
14029e62d mov byte ptr [rsp + 0x2b0], dl
14029e634 mov edx, dword ptr [rsp + 0x70]
14029e638 mov r8d, dword ptr [rsp + 0x73]
14029e63d mov dword ptr [rsp + 0x2b1], edx
14029e644 mov dword ptr [rsp + 0x2b4], r8d
14029e64c mov qword ptr [rsp + 0x2b8], rax
14029e654 mov qword ptr [rsp + 0x2c0], rcx
14029e65c mov dword ptr [rsp + 0x2c8], 0x42080000
14029e667 mov word ptr [rsp + 0x2cc], 0x190
14029e671 mov byte ptr [rsp + 0x2ce], 1
14029e679 movups xmm0, xmmword ptr [rip + 0x5c5f33c]
14029e680 movups xmmword ptr [rsp + 0x2d0], xmm0
14029e688 mov dword ptr [rsp + 0x2e0], 0x3f800000
14029e693 mov eax, dword ptr [rip + 0x5c3123f]
14029e699 mov dword ptr [rsp + 0x2f4], eax
14029e6a0 movups xmm0, xmmword ptr [rip + 0x5c31221]
14029e6a7 movups xmmword ptr [rsp + 0x2e4], xmm0
14029e6af movsd xmm0, qword ptr [rip + 0x5c03a19]
14029e6b7 movsd qword ptr [rsp + 0x2f8], xmm0
14029e6c0 lea rcx, [rsp + 0x490]
14029e6c8 lea rdx, [rsp + 0x280]
14029e6d0 call 0x14027ff50
14029e6d5 mov rax, qword ptr [rsp + 0x38]
14029e6da mov rbx, qword ptr [rax]
14029e6dd cmp qword ptr [rbx + 0x40], 0
14029e6e2 je 0x14029e749
14029e6e4 mov rax, qword ptr [rbx + 8]
14029e6e8 mov rcx, qword ptr [rbx + 0x10]
14029e6ec cmp rcx, 4
14029e6f0 je 0x14029ebfc
14029e6f6 cmp rcx, 6
14029e6fa je 0x14029e731
14029e6fc cmp rcx, 7
14029e700 jne 0x14029e749
14029e702 mov ecx, 0x74736f68
14029e707 xor ecx, dword ptr [rax]
14029e709 mov edx, 0x676e6974
14029e70e xor edx, dword ptr [rax + 3]
14029e711 or edx, ecx
14029e713 je 0x14029ec08
14029e719 mov ecx, 0x6e696f6a
14029e71e xor ecx, dword ptr [rax]
14029e720 mov edx, 0x676e696e
14029e725 xor edx, dword ptr [rax + 3]
14029e728 or edx, ecx
14029e72a jne 0x14029e749
14029e72c jmp 0x14029ec08
14029e731 mov ecx, 0x6e696f6a
14029e736 xor ecx, dword ptr [rax]
14029e738 movzx eax, word ptr [rax + 4]
14029e73c xor eax, 0x6465
14029e741 or eax, ecx
14029e743 je 0x14029ec08
14029e749 mov rbp, r15
14029e74c mov r12, qword ptr [rsp + 0x30]
14029e751 mov r14, qword ptr [r12]
14029e755 movaps xmm11, xmm7
14029e759 xorps xmm7, xmm7
14029e75c movaps xmmword ptr [rsp + 0x110], xmm7
14029e764 movaps xmmword ptr [rsp + 0x100], xmm7
14029e76c movaps xmmword ptr [rsp + 0xf0], xmm7
14029e774 movaps xmmword ptr [rsp + 0xe0], xmm7
14029e77c movaps xmmword ptr [rsp + 0xd0], xmm7
14029e784 mov qword ptr [rsp + 0x120], 0
14029e790 mov byte ptr [rsp + 0x404], 0
14029e798 mov dword ptr [rsp + 0x400], 0
14029e7a3 movups xmm0, xmmword ptr [rip + 0x5c280ae]
14029e7aa movups xmmword ptr [rsp + 0x128], xmm0
14029e7b2 movups xmm0, xmmword ptr [rip + 0x5c280af]
14029e7b9 movups xmmword ptr [rsp + 0x138], xmm0
14029e7c1 movups xmm0, xmmword ptr [rip + 0x5c280b0]
14029e7c8 movups xmmword ptr [rsp + 0x148], xmm0
14029e7d0 movups xmm0, xmmword ptr [rip + 0x5c280b1]
14029e7d7 movups xmmword ptr [rsp + 0x158], xmm0
14029e7df movups xmm0, xmmword ptr [rip + 0x5c280c2]
14029e7e6 movups xmmword ptr [rsp + 0x178], xmm0
14029e7ee movups xmm0, xmmword ptr [rip + 0x5c280a3]
14029e7f5 movups xmmword ptr [rsp + 0x168], xmm0
14029e7fd movups xmm0, xmmword ptr [rip + 0x5c280c4]
14029e804 movups xmmword ptr [rsp + 0x198], xmm0
14029e80c movups xmm0, xmmword ptr [rip + 0x5c280a5]
14029e813 movups xmmword ptr [rsp + 0x188], xmm0
14029e81b mov rax, qword ptr [rip + 0x5c27f8e]
14029e822 mov qword ptr [rsp + 0x80], rax
14029e82a movups xmm0, xmmword ptr [rip + 0x5c27f6f]
14029e831 movaps xmmword ptr [rsp + 0x70], xmm0
14029e836 mov rax, qword ptr [rip + 0x5c27f8b]
14029e83d mov qword ptr [rsp + 0x98], rax
14029e845 movups xmm0, xmmword ptr [rip + 0x5c27f6c]
14029e84c movups xmmword ptr [rsp + 0x88], xmm0
14029e854 mov rax, qword ptr [rip + 0x5c27f85]
14029e85b mov qword ptr [rsp + 0xb0], rax
14029e863 movups xmm0, xmmword ptr [rip + 0x5c27f66]
14029e86a movaps xmmword ptr [rsp + 0xa0], xmm0
14029e872 mov rax, qword ptr [rip + 0x5c27f7f]
14029e879 mov qword ptr [rsp + 0xc8], rax
14029e881 movups xmm0, xmmword ptr [rip + 0x5c27f60]
14029e888 movups xmmword ptr [rsp + 0xb8], xmm0
14029e890 lea rcx, [rsp + 0x288]
14029e898 lea rdx, [rsp + 0x70]
14029e89d mov r8d, 0x138
14029e8a3 call 0x145cf998b
14029e8a8 movups xmmword ptr [rsp + 0x3c0], xmm14
14029e8b1 mov dword ptr [rsp + 0x3d0], 1
14029e8bc movss xmm0, dword ptr [rip + 0x5c037c4]
14029e8c4 movlps qword ptr [rsp + 0x3d4], xmm0
14029e8cc mov byte ptr [rsp + 0x3dc], 1
14029e8d4 mov qword ptr [rsp + 0x3e0], 0
14029e8e0 mov dword ptr [rsp + 0x3e8], 0x3f800000
14029e8eb mov word ptr [rsp + 0x3ec], 0
14029e8f5 mov eax, dword ptr [rip + 0x5c2800b]
14029e8fb mov dword ptr [rsp + 0x3ee], eax
14029e902 movzx eax, word ptr [rip + 0x5c28001]
14029e909 mov word ptr [rsp + 0x3f2], ax
14029e911 mov eax, dword ptr [rip + 0x5c27ff5]
14029e917 mov dword ptr [rsp + 0x3f4], eax
14029e91e movzx eax, word ptr [rip + 0x5c27feb]
14029e925 mov word ptr [rsp + 0x3f8], ax
14029e92d mov word ptr [rsp + 0x3fe], 0
14029e937 mov dword ptr [rsp + 0x3fa], 0
14029e942 mov byte ptr [rsp + 0x405], 5
14029e94a mov qword ptr [rsp + 0x280], rdi
14029e952 lea r15, [rsp + 0x490]
14029e95a lea r8, [rsp + 0x280]
14029e962 mov rcx, r15
14029e965 lea rdi, [rsp + 0x48]
14029e96a mov rdx, rdi
14029e96d call 0x1402628b0
14029e972 mov rcx, r15
14029e975 mov rdx, rbx
14029e978 mov r8, r14
14029e97b mov rbx, rdi
14029e97e call 0x14029b100
14029e983 mov word ptr [rsp + 0x1d4], 0
14029e98d mov byte ptr [rsp + 0x1c4], 1
14029e995 movups xmmword ptr [rsp + 0xd8], xmm7
14029e99d movups xmmword ptr [rsp + 0xe8], xmm7
14029e9a5 movabs rax, 0x42c8000000000002
14029e9af mov qword ptr [rsp + 0xf8], rax
14029e9b7 mov qword ptr [rsp + 0xd0], 0
14029e9c3 movaps xmmword ptr [rsp + 0x100], xmm7
14029e9cb movaps xmmword ptr [rsp + 0x110], xmm7
14029e9d3 movaps xmm7, xmm11
14029e9d7 mov qword ptr [rsp + 0x120], 0
14029e9e3 mov dword ptr [rsp + 0x1e8], 0
14029e9ee mov word ptr [rsp + 0x1ec], 0
14029e9f8 movups xmm0, xmmword ptr [rip + 0x5c5f089]
14029e9ff movups xmmword ptr [rsp + 0x128], xmm0
14029ea07 movups xmmword ptr [rsp + 0x138], xmm11
14029ea10 movaps xmm11, xmm10
14029ea14 movups xmmword ptr [rsp + 0x158], xmm10
14029ea1d movups xmmword ptr [rsp + 0x148], xmm8
14029ea26 movaps xmm10, xmm6
14029ea2a movups xmmword ptr [rsp + 0x178], xmm6
14029ea32 movups xmmword ptr [rsp + 0x168], xmm9
14029ea3b movups xmm0, xmmword ptr [rip + 0x5c5f0b6]
14029ea42 movups xmmword ptr [rsp + 0x198], xmm0
14029ea4a movups xmm6, xmmword ptr [rip + 0x5c5f097]
14029ea51 movups xmmword ptr [rsp + 0x188], xmm6
14029ea59 mov byte ptr [rsp + 0x1e6], 0
14029ea61 mov dword ptr [rsp + 0x1e2], 0
14029ea6c mov qword ptr [rsp + 0x1c8], 0
14029ea78 mov dword ptr [rsp + 0x1d0], 0x3f800000
14029ea83 movups xmmword ptr [rsp + 0x1a8], xmm14
14029ea8c mov dword ptr [rsp + 0x1b8], 1
14029ea97 mov qword ptr [rsp + 0x1bc], 0
14029eaa3 mov byte ptr [rsp + 0x1e7], 0
14029eaab movaps xmmword ptr [rsp + 0x70], xmm12
14029eab1 mov qword ptr [rsp + 0x80], 0
14029eabd movaps xmm14, xmm13
14029eac1 movups xmmword ptr [rsp + 0x88], xmm13
14029eaca mov qword ptr [rsp + 0x98], 0
14029ead6 movups xmm0, xmmword ptr [rip + 0x5c5ef23]
14029eadd movaps xmmword ptr [rsp + 0xa0], xmm0
14029eae5 mov qword ptr [rsp + 0xb0], 0
14029eaf1 movups xmmword ptr [rsp + 0xb8], xmm15
14029eafa mov qword ptr [rsp + 0xc8], 0
14029eb06 mov word ptr [rsp + 0x1da], 0
14029eb10 mov dword ptr [rsp + 0x1d6], 0x10000
14029eb1b mov word ptr [rsp + 0x1e0], 0
14029eb25 mov dword ptr [rsp + 0x1dc], 0x10000
14029eb30 movups xmm0, xmmword ptr [rip + 0x5c5f019]
14029eb37 movaps xmmword ptr [rsp + 0x490], xmm0
14029eb3f mov dword ptr [rsp + 0x4a0], 0x3f800000
14029eb4a lea rcx, [rsp + 0x288]
14029eb52 lea rdx, [rsp + 0x70]
14029eb57 lea r8, [rsp + 0x490]
14029eb5f call 0x1400de820
14029eb64 mov rax, qword ptr [rsp + 0x40]
14029eb69 mov qword ptr [rsp + 0x280], rax
14029eb71 lea rcx, [rsp + 0x70]
14029eb76 lea r8, [rsp + 0x280]
14029eb7e mov rdx, rdi
14029eb81 call 0x140266740
14029eb86 mov rax, qword ptr [rsp + 0x38]
14029eb8b mov rax, qword ptr [rax]
14029eb8e movzx ecx, byte ptr [rax + 0x117]
14029eb95 mov rdx, qword ptr [r12]
14029eb99 test ecx, ecx
14029eb9b je 0x14029ebcb
14029eb9d movaps xmm13, xmm12
14029eba1 movaps xmm15, xmm8
14029eba5 movaps xmm12, xmm6
14029eba9 movaps xmm6, xmm7
14029ebac cmp ecx, 1
14029ebaf jne 0x14029ebed
14029ebb1 mov rcx, qword ptr [rsp + 0x4c8]
14029ebb9 mov r9, qword ptr [rcx]
14029ebbc lea rcx, [rsp + 0x40]
14029ebc1 mov r8, rax
14029ebc4 call 0x14003d9b0
14029ebc9 jmp 0x14029ec44
14029ebcb movaps xmm15, xmm8
14029ebcf movaps xmm13, xmm12
14029ebd3 movaps xmm12, xmm6
14029ebd7 movaps xmm6, xmm7
14029ebda mov r8, qword ptr [rbp]
14029ebde lea rcx, [rsp + 0x40]
14029ebe3 mov r9, rax
14029ebe6 call 0x14003d1e0
14029ebeb jmp 0x14029ec44
14029ebed lea rcx, [rsp + 0x40]
14029ebf2 mov r8, rax
14029ebf5 call 0x14003e440
14029ebfa jmp 0x14029ec44
14029ebfc cmp dword ptr [rax], 0x7466656c
14029ec02 jne 0x14029e749
14029ec08 movaps xmm11, xmm10
14029ec0c movaps xmm15, xmm8
14029ec10 movaps xmm14, xmm13
14029ec14 movaps xmm13, xmm12
14029ec18 movups xmm12, xmmword ptr [rip + 0x5c5eec8]
14029ec20 movaps xmm10, xmm6
14029ec24 movaps xmm6, xmm7
14029ec27 mov rax, qword ptr [rsp + 0x30]
14029ec2c mov rdx, qword ptr [rax]
14029ec2f mov r8, qword ptr [r15]
14029ec32 lea rcx, [rsp + 0x40]
14029ec37 mov r9, rbx
14029ec3a call 0x14003a850
14029ec3f lea rbx, [rsp + 0x48]
14029ec44 xorps xmm7, xmm7
14029ec47 movaps xmmword ptr [rsp + 0x110], xmm7
14029ec4f movaps xmmword ptr [rsp + 0x100], xmm7
14029ec57 movaps xmmword ptr [rsp + 0xf0], xmm7
14029ec5f movaps xmmword ptr [rsp + 0xe0], xmm7
14029ec67 movaps xmmword ptr [rsp + 0xd0], xmm7
14029ec6f mov qword ptr [rsp + 0x120], 0
14029ec7b mov word ptr [rsp + 0x404], 0
14029ec85 mov dword ptr [rsp + 0x400], 0
14029ec90 movups xmm8, xmmword ptr [rip + 0x5c5edf0]
14029ec98 movups xmmword ptr [rsp + 0x128], xmm8
14029eca1 movups xmmword ptr [rsp + 0x138], xmm6
14029eca9 movups xmmword ptr [rsp + 0x148], xmm15
14029ecb2 movups xmmword ptr [rsp + 0x158], xmm11
14029ecbb movups xmmword ptr [rsp + 0x178], xmm10
14029ecc4 movups xmmword ptr [rsp + 0x168], xmm9
14029eccd movups xmm11, xmmword ptr [rip + 0x5c5ee23]
14029ecd5 movups xmmword ptr [rsp + 0x198], xmm11
14029ecde movups xmmword ptr [rsp + 0x188], xmm12
14029ece7 movaps xmmword ptr [rsp + 0x70], xmm13
14029eced mov qword ptr [rsp + 0x80], 0
14029ecf9 movups xmmword ptr [rsp + 0x88], xmm14
14029ed02 mov qword ptr [rsp + 0x98], 0
14029ed0e movups xmm15, xmmword ptr [rip + 0x5c5ecea]
14029ed16 movaps xmmword ptr [rsp + 0xa0], xmm15
14029ed1f mov qword ptr [rsp + 0xb0], 0
14029ed2b movups xmm8, xmmword ptr [rip + 0x5c5ece5]
14029ed33 movups xmmword ptr [rsp + 0xb8], xmm8
14029ed3c mov qword ptr [rsp + 0xc8], 0
14029ed48 mov rdi, qword ptr [rsp + 0x40]
14029ed4d lea rcx, [rsp + 0x288]
14029ed55 lea rdx, [rsp + 0x70]
14029ed5a mov r8d, 0x138
14029ed60 call 0x145cf998b
14029ed65 movaps xmm11, xmmword ptr [rip + 0x5c032c3]
14029ed6d movups xmmword ptr [rsp + 0x3c0], xmm11
14029ed76 mov dword ptr [rsp + 0x3d0], 1
14029ed81 mov qword ptr [rsp + 0x3d4], 0
14029ed8d mov byte ptr [rsp + 0x3dc], 1
14029ed95 movsd xmm0, qword ptr [rip + 0x5c2c9c3]
14029ed9d movsd qword ptr [rsp + 0x3e0], xmm0
14029eda6 mov dword ptr [rsp + 0x3e8], 0x3f800000
14029edb1 mov word ptr [rsp + 0x3ec], 0
14029edbb mov dword ptr [rsp + 0x3ee], 0x10000
14029edc6 mov word ptr [rsp + 0x3f2], 0
14029edd0 mov dword ptr [rsp + 0x3f4], 0x10000
14029eddb mov word ptr [rsp + 0x3f8], 0
14029ede5 mov dword ptr [rsp + 0x3fa], 0
14029edf0 mov word ptr [rsp + 0x3fe], 0
14029edfa mov qword ptr [rsp + 0x280], rdi
14029ee02 lea rcx, [rsp + 0x490]
14029ee0a lea r8, [rsp + 0x280]
14029ee12 mov rdx, rbx
14029ee15 call 0x1402628b0
14029ee1a mov r15, qword ptr [rsp + 0x30]
14029ee1f mov rdx, qword ptr [r15]
14029ee22 mov r14, qword ptr [rsp + 0x38]
14029ee27 mov r8, qword ptr [r14]
14029ee2a lea rcx, [rsp + 0x40]
14029ee2f call 0x14003c0b0
14029ee34 movaps xmmword ptr [rsp + 0x110], xmm7
14029ee3c movaps xmmword ptr [rsp + 0x100], xmm7
14029ee44 movaps xmmword ptr [rsp + 0xf0], xmm7
14029ee4c movaps xmmword ptr [rsp + 0xe0], xmm7
14029ee54 movaps xmmword ptr [rsp + 0xd0], xmm7
14029ee5c mov qword ptr [rsp + 0x120], 0
14029ee68 mov byte ptr [rsp + 0x404], 0
14029ee70 mov dword ptr [rsp + 0x400], 0
14029ee7b movups xmm0, xmmword ptr [rip + 0x5c5ec06]
14029ee82 movups xmmword ptr [rsp + 0x128], xmm0
14029ee8a movups xmmword ptr [rsp + 0x138], xmm6
14029ee92 movups xmm0, xmmword ptr [rip + 0x5c5ec0f]
14029ee99 movups xmmword ptr [rsp + 0x148], xmm0
14029eea1 movups xmm0, xmmword ptr [rip + 0x5c5ec10]
14029eea8 movups xmmword ptr [rsp + 0x158], xmm0
14029eeb0 movups xmmword ptr [rsp + 0x178], xmm10
14029eeb9 movups xmmword ptr [rsp + 0x168], xmm9
14029eec2 movups xmm0, xmmword ptr [rip + 0x5c5ec2f]
14029eec9 movups xmmword ptr [rsp + 0x198], xmm0
14029eed1 movups xmmword ptr [rsp + 0x188], xmm12
14029eeda movaps xmmword ptr [rsp + 0x70], xmm13
14029eee0 mov qword ptr [rsp + 0x80], 0
14029eeec movups xmmword ptr [rsp + 0x88], xmm14
14029eef5 mov qword ptr [rsp + 0x98], 0
14029ef01 movaps xmmword ptr [rsp + 0xa0], xmm15
14029ef0a mov qword ptr [rsp + 0xb0], 0
14029ef16 movups xmmword ptr [rsp + 0xb8], xmm8
14029ef1f mov qword ptr [rsp + 0xc8], 0
14029ef2b mov rdi, qword ptr [rsp + 0x40]
14029ef30 lea rcx, [rsp + 0x288]
14029ef38 lea rdx, [rsp + 0x70]
14029ef3d mov r8d, 0x138
14029ef43 call 0x145cf998b
14029ef48 movups xmmword ptr [rsp + 0x3c0], xmm11
14029ef51 mov dword ptr [rsp + 0x3d0], 1
14029ef5c movss xmm0, dword ptr [rip + 0x5c2c6a0]
14029ef64 movlps qword ptr [rsp + 0x3d4], xmm0
14029ef6c mov byte ptr [rsp + 0x3dc], 1
14029ef74 mov qword ptr [rsp + 0x3e0], 0
14029ef80 mov dword ptr [rsp + 0x3e8], 0x3f800000
14029ef8b mov word ptr [rsp + 0x3ec], 0
14029ef95 mov dword ptr [rsp + 0x3ee], 0x10000
14029efa0 mov word ptr [rsp + 0x3f2], 0
14029efaa mov dword ptr [rsp + 0x3f4], 0x10000
14029efb5 mov word ptr [rsp + 0x3f8], 0
14029efbf mov dword ptr [rsp + 0x3fa], 0
14029efca mov word ptr [rsp + 0x3fe], 0
14029efd4 mov byte ptr [rsp + 0x405], 5
14029efdc mov qword ptr [rsp + 0x280], rdi
14029efe4 lea rcx, [rsp + 0x490]
14029efec lea r8, [rsp + 0x280]
14029eff4 mov rdx, rbx
14029eff7 call 0x1402628b0
14029effc mov rcx, qword ptr [r14]
14029efff mov rdi, qword ptr [r15]
14029f002 mov rax, qword ptr [rsp + 0x490]
14029f00a mov rdx, qword ptr [rsp + 0x4b8]
14029f012 mov qword ptr [rsp + 0x280], rax
14029f01a movups xmm0, xmmword ptr [rsp + 0x498]
14029f022 movups xmmword ptr [rsp + 0x288], xmm0
14029f02a movups xmm0, xmmword ptr [rsp + 0x4a8]
14029f032 movups xmmword ptr [rsp + 0x298], xmm0
14029f03a mov qword ptr [rsp + 0x2a8], rdx
14029f042 cmp qword ptr [rcx + 0x40], 0
14029f047 je 0x14029f0e2
14029f04d mov rax, qword ptr [rcx + 8]
14029f051 mov rcx, qword ptr [rcx + 0x10]
14029f055 cmp rcx, 4
14029f059 je 0x14029f18a
14029f05f cmp rcx, 6
14029f063 je 0x14029f093
14029f065 cmp rcx, 7
14029f069 jne 0x14029f0e2
14029f06b mov ecx, 0x74736f68
14029f070 xor ecx, dword ptr [rax]
14029f072 mov edx, 0x676e6974
14029f077 xor edx, dword ptr [rax + 3]
14029f07a or edx, ecx
14029f07c je 0x14029f0a7
14029f07e mov ecx, 0x6e696f6a
14029f083 xor ecx, dword ptr [rax]
14029f085 mov edx, 0x676e696e
14029f08a xor edx, dword ptr [rax + 3]
14029f08d or edx, ecx
14029f08f jne 0x14029f0e2
14029f091 jmp 0x14029f0a7
14029f093 mov ecx, 0x6e696f6a
14029f098 xor ecx, dword ptr [rax]
14029f09a movzx eax, word ptr [rax + 4]
14029f09e xor eax, 0x6465
14029f0a3 or eax, ecx
14029f0a5 jne 0x14029f0e2
14029f0a7 mov byte ptr [rsp + 0x70], 6
14029f0ac lea rcx, [rip + 0x5c5ebf0] # 145efdca3 b'Leave the party'
14029f0b3 mov edx, 0xf
14029f0b8 call 0x145895670
14029f0bd mov qword ptr [rsp + 0x20], rdx
14029f0c2 mov dword ptr [rsp + 0x28], 0x41800000
14029f0ca lea rcx, [rsp + 0x280]
14029f0d2 lea r8, [rsp + 0x70]
14029f0d7 mov rdx, rdi
14029f0da mov r9, rax
14029f0dd call 0x14003b350
14029f0e2 mov byte ptr [rsp + 0x70], 7
14029f0e7 lea rcx, [rip + 0x5c5ed4c] # 145efde3a b'CloseSummary'
14029f0ee mov edx, 5
14029f0f3 call 0x145895670
14029f0f8 mov qword ptr [rsp + 0x20], rdx
14029f0fd mov dword ptr [rsp + 0x28], 0x41800000
14029f105 lea rcx, [rsp + 0x280]
14029f10d lea r8, [rsp + 0x70]
14029f112 mov rdx, rdi
14029f115 mov r9, rax
14029f118 call 0x14003b350
14029f11d mov rax, rsi
14029f120 movaps xmm6, xmmword ptr [rsp + 0x530]
14029f128 movaps xmm7, xmmword ptr [rsp + 0x540]
14029f130 movaps xmm8, xmmword ptr [rsp + 0x550]
14029f139 movaps xmm9, xmmword ptr [rsp + 0x560]
14029f142 movaps xmm10, xmmword ptr [rsp + 0x570]
14029f14b movaps xmm11, xmmword ptr [rsp + 0x580]
14029f154 movaps xmm12, xmmword ptr [rsp + 0x590]
14029f15d movaps xmm13, xmmword ptr [rsp + 0x5a0]
14029f166 movaps xmm14, xmmword ptr [rsp + 0x5b0]
14029f16f movaps xmm15, xmmword ptr [rsp + 0x5c0]
14029f178 add rsp, 0x5d0
14029f17f pop rbx
14029f180 pop rbp
14029f181 pop rdi
14029f182 pop rsi
14029f183 pop r12
14029f185 pop r14
14029f187 pop r15
14029f189 ret
14029f18a cmp dword ptr [rax], 0x7466656c
14029f190 jne 0x14029f0e2
14029f196 jmp 0x14029f0a7
14029f19b ud2
