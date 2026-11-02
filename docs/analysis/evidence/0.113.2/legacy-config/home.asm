140c03ca0 push rbp
140c03ca1 push r14
140c03ca3 push rsi
140c03ca4 push rdi
140c03ca5 push rbx
140c03ca6 sub rsp, 0x70
140c03caa lea rbp, [rsp + 0x70]
140c03caf mov qword ptr [rbp - 8], 0xfffffffffffffffe
140c03cb7 mov rsi, rcx
140c03cba lea rdx, [rip + 0x54273ac]
140c03cc1 lea rcx, [rbp - 0x30]
140c03cc5 mov r8d, 0xb
140c03ccb call 0x145cb90a0
140c03cd0 mov rdx, qword ptr [rbp - 0x30]
140c03cd4 cmp rdx, -1
140c03cd8 je 0x140c03cfa
140c03cda test rdx, rdx
140c03cdd je 0x140c03cee
140c03cdf mov rcx, qword ptr [rbp - 0x28]
140c03ce3 mov r8d, 1
140c03ce9 call 0x1400021d0
140c03cee mov qword ptr [rsi], 0xffffffffffffffff
140c03cf5 jmp 0x140c03dc3
140c03cfa lea rdx, [rip + 0x5427377]
140c03d01 lea rcx, [rbp - 0x30]
140c03d05 mov r8d, 0xc
140c03d0b call 0x145cb90a0
140c03d10 cmp qword ptr [rbp - 0x30], -1
140c03d15 je 0x140c03d2b
140c03d17 movups xmm0, xmmword ptr [rbp - 0x30]
140c03d1b movups xmm1, xmmword ptr [rbp - 0x20]
140c03d1f movups xmmword ptr [rsi + 0x10], xmm1
140c03d23 movups xmmword ptr [rsi], xmm0
140c03d26 jmp 0x140c03dc3
140c03d2b lea rdx, [rip + 0x54558c8]
140c03d32 lea rcx, [rbp - 0x30]
140c03d36 mov r8d, 0xe
140c03d3c call 0x145cb90a0
140c03d41 mov rdx, qword ptr [rbp - 0x30]
140c03d45 cmp rdx, -1
140c03d49 jne 0x140c03d8b
140c03d4b lea rdx, [rip + 0x54558b6]
140c03d52 lea rcx, [rbp - 0x30]
140c03d56 mov r8d, 0xb
140c03d5c call 0x145cb90a0
140c03d61 mov rdx, qword ptr [rbp - 0x30]
140c03d65 cmp rdx, -1
140c03d69 jne 0x140c03d8b
140c03d6b lea rdx, [rip + 0x54558a1]
140c03d72 lea rcx, [rbp - 0x30]
140c03d76 mov r8d, 7
140c03d7c call 0x145cb90a0
140c03d81 mov rdx, qword ptr [rbp - 0x30]
140c03d85 cmp rdx, -1
140c03d89 je 0x140c03dd1
140c03d8b test rdx, rdx
140c03d8e je 0x140c03d9f
140c03d90 mov rcx, qword ptr [rbp - 0x28]
140c03d94 mov r8d, 1
140c03d9a call 0x1400021d0
140c03d9f mov eax, dword ptr [rip + 0x75a2313]
140c03da5 test eax, eax
140c03da7 jne 0x140c03ec5
140c03dad mov rdx, qword ptr [rip + 0x75a22ec]
140c03db4 mov r8, qword ptr [rip + 0x75a22ed]
140c03dbb mov rcx, rsi
140c03dbe call 0x145ca5b40
140c03dc3 mov rax, rsi
140c03dc6 add rsp, 0x70
140c03dca pop rbx
140c03dcb pop rdi
140c03dcc pop rsi
140c03dcd pop r14
140c03dcf pop rbp
140c03dd0 ret
140c03dd1 mov qword ptr [rsi], 0xffffffffffffffff
140c03dd8 lea rcx, [rbp - 0x30]
140c03ddc call 0x145cb3990
140c03de1 mov rax, qword ptr [rbp - 0x30]
140c03de5 cmp rax, -1
140c03de9 je 0x140c03e24
140c03deb mov qword ptr [rbp - 0x10], rax
140c03def mov rcx, qword ptr [rbp - 0x28]
140c03df3 mov rdx, qword ptr [rbp - 0x20]
140c03df7 mov qword ptr [rbp - 0x38], rcx
140c03dfb call 0x145ca62e0
140c03e00 nop
140c03e01 test rax, rax
140c03e04 je 0x140c03e53
140c03e06 mov r8, rdx
140c03e09 lea rcx, [rbp - 0x30]
140c03e0d mov rdx, rax
140c03e10 call 0x145ca5b40
140c03e15 nop
140c03e16 mov rbx, qword ptr [rbp - 0x30]
140c03e1a mov r14, qword ptr [rbp - 0x28]
140c03e1e mov rdi, qword ptr [rbp - 0x20]
140c03e22 jmp 0x140c03e5a
140c03e24 mov rax, qword ptr [rbp - 0x28]
140c03e28 mov ecx, eax
140c03e2a and ecx, 3
140c03e2d lea edx, [rcx - 2]
140c03e30 cmp edx, 2
140c03e33 jb 0x140c03dc3
140c03e35 test rcx, rcx
140c03e38 je 0x140c03dc3
140c03e3a dec rax
140c03e3d lea rcx, [rbp - 0x40]
140c03e41 mov qword ptr [rbp - 0x40], rax
140c03e45 mov byte ptr [rbp - 0x48], 3
140c03e49 call 0x145cdf070
140c03e4e jmp 0x140c03dc3
140c03e53 mov rbx, 0xffffffffffffffff
140c03e5a mov rdx, qword ptr [rbp - 0x10]
140c03e5e test rdx, rdx
140c03e61 je 0x140c03e72
140c03e63 mov r8d, 1
140c03e69 mov rcx, qword ptr [rbp - 0x38]
140c03e6d call 0x1400021d0
140c03e72 cmp rbx, -1
140c03e76 je 0x140c03dc3
140c03e7c mov qword ptr [rbp - 0x10], rbx
140c03e80 mov qword ptr [rsp + 0x20], 0xe
140c03e89 lea r9, [rip + 0x5425c1c]
140c03e90 lea rcx, [rbp - 0x30]
140c03e94 mov qword ptr [rbp - 0x38], r14
140c03e98 mov rdx, r14
140c03e9b mov r8, rdi
140c03e9e call 0x145ca61b0
140c03ea3 nop
140c03ea4 mov rdx, qword ptr [rbp - 0x10]
140c03ea8 test rdx, rdx
140c03eab je 0x140c03d17
140c03eb1 mov r8d, 1
140c03eb7 mov rcx, qword ptr [rbp - 0x38]
140c03ebb call 0x1400021d0
140c03ec0 jmp 0x140c03d17
140c03ec5 lea rcx, [rip + 0x75a21cc]
140c03ecc call 0x145d23d58
140c03ed1 jmp 0x140c03dad
