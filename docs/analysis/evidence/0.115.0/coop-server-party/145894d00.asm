145894d00 push rbp
145894d01 push r14
145894d03 push rsi
145894d04 push rdi
145894d05 push rbx
145894d06 sub rsp, 0x260
145894d0d lea rbp, [rsp + 0x80]
145894d15 movaps xmmword ptr [rbp + 0x1d0], xmm6
145894d1c mov qword ptr [rbp + 0x1c8], 0xfffffffffffffffe
145894d27 cmp dword ptr [rcx + 0xc58], 3
145894d2e jne 0x145894e8c
145894d34 mov rsi, rcx
145894d37 mov rax, qword ptr [rcx + 0xc98]
145894d3e mov qword ptr [rbp + 0x1b8], rax
145894d45 cmp rdx, rax
145894d48 mov qword ptr [rbp + 0x1c0], r8
145894d4f mov qword ptr [rbp + 0x1a8], rdx
145894d56 jae 0x145894ecc
145894d5c movaps xmm6, xmm3
145894d5f mov rbx, qword ptr [rsi + 0xc90]
145894d66 imul rdi, rdx, 0x478
145894d6d mov rax, qword ptr [r8 + 0x10]
145894d71 mov qword ptr [rbp - 0x40], rax
145894d75 movups xmm0, xmmword ptr [r8]
145894d79 movups xmmword ptr [rbp - 0x50], xmm0
145894d7d movabs rax, 0x8000000000000002
145894d87 mov qword ptr [rbp - 0x58], rax
145894d8b mov rcx, qword ptr [rbx + rdi + 0x460]
145894d93 mov rdx, qword ptr [rbx + rdi + 0x468]
145894d9b lea r8, [rbx + rdi]
145894d9f add r8, 0x260
145894da6 call 0x145824200
145894dab nop
145894dac add rbx, rdi
145894daf mov rdi, qword ptr [rbx + 0x460]
145894db6 mov r14, qword ptr [rbx + 0x468]
145894dbd lea rcx, [rbp + 0x190]
145894dc4 lea rdx, [rbp - 0x58]
145894dc8 call 0x14581c690
145894dcd nop
145894dce mov rdx, qword ptr [rbp + 0x198]
145894dd5 mov r8, qword ptr [rbp + 0x1a0]
145894ddc lock add qword ptr [rip + 0x2982364], r8
145894de4 lock inc qword ptr [rip + 0x298236c]
145894dec mov rcx, rdi
145894def mov qword ptr [rbp + 0x1b0], rdx
145894df6 call qword ptr [r14 + 0x18]
145894dfa nop
145894dfb mov rdx, qword ptr [rbp + 0x190]
145894e02 test rdx, rdx
145894e05 je 0x145894e1a
145894e07 mov r8d, 1
145894e0d mov rcx, qword ptr [rbp + 0x1b0]
145894e14 call 0x1400021d0
145894e19 nop
145894e1a lea rcx, [rbp - 0x58]
145894e1e call 0x1458712e0
145894e23 nop
145894e24 movzx edi, byte ptr [rbx + 0x470]
145894e2b mov byte ptr [rbx + 0x470], 0
145894e32 cmp qword ptr [rbx + 0x278], -1
145894e3a je 0x145894e48
145894e3c lea rcx, [rbx + 0x278]
145894e43 call 0x1458132e0
145894e48 mov qword ptr [rbx + 0x278], 0xffffffffffffffff
145894e53 mov qword ptr [rbx + 0x10], 1
145894e5b movsd qword ptr [rbx + 0x18], xmm6
145894e60 test dil, dil
145894e63 je 0x145894eb7
145894e65 mov qword ptr [rsp + 0x20], 0
145894e6e lea rdx, [rip + 0x17986eb]
145894e75 mov r8d, 4
145894e7b mov r9d, 1
145894e81 mov rcx, rsi
145894e84 call 0x145893140
145894e89 nop
145894e8a jmp 0x145894eb7
145894e8c mov rdx, qword ptr [r8]
145894e8f test rdx, rdx
145894e92 je 0x145894eb7
145894e94 mov rcx, qword ptr [r8 + 8]
145894e98 mov r8d, 1
145894e9e movaps xmm6, xmmword ptr [rbp + 0x1d0]
145894ea5 add rsp, 0x260
145894eac pop rbx
145894ead pop rdi
145894eae pop rsi
145894eaf pop r14
145894eb1 pop rbp
145894eb2 jmp 0x1400021d0
145894eb7 movaps xmm6, xmmword ptr [rbp + 0x1d0]
145894ebe add rsp, 0x260
145894ec5 pop rbx
145894ec6 pop rdi
145894ec7 pop rsi
145894ec8 pop r14
145894eca pop rbp
145894ecb ret
145894ecc lea r8, [rip + 0x1798675]
145894ed3 mov rcx, rdx
145894ed6 mov rdx, qword ptr [rbp + 0x1b8]
145894edd call 0x145eb7363
145894ee2 nop
145894ee3 ud2
