145ac2a90 55 push rbp
145ac2a91 4157 push r15
145ac2a93 4156 push r14
145ac2a95 4155 push r13
145ac2a97 4154 push r12
145ac2a99 56 push rsi
145ac2a9a 57 push rdi
145ac2a9b 53 push rbx
145ac2a9c 4883ec48 sub rsp, 0x48
145ac2aa0 488d6c2440 lea rbp, [rsp + 0x40]
145ac2aa5 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
145ac2aad 4c89cf mov rdi, r9
145ac2ab0 4c89c6 mov rsi, r8
145ac2ab3 4989d6 mov r14, rdx
145ac2ab6 4889cb mov rbx, rcx
145ac2ab9 e8c28a0000 call 0x145acb580
145ac2abe 4189c5 mov r13d, eax
145ac2ac1 4084f8 test al, dil
145ac2ac4 0f849d010000 je 0x145ac2c67
145ac2aca 488bbbd0000000 mov rdi, qword ptr [rbx + 0xd0]
145ac2ad1 4989ff mov r15, rdi
145ac2ad4 4885ff test rdi, rdi
145ac2ad7 0f84cd000000 je 0x145ac2baa
145ac2add 4c89f0 mov rax, r14
145ac2ae0 44886dff mov byte ptr [rbp - 1], r13b
145ac2ae4 4989f6 mov r14, rsi
145ac2ae7 48895df0 mov qword ptr [rbp - 0x10], rbx
145ac2aeb 4c8bbbc8000000 mov r15, qword ptr [rbx + 0xc8]
145ac2af2 4883ff01 cmp rdi, 1
145ac2af6 48897de0 mov qword ptr [rbp - 0x20], rdi
145ac2afa 488945e8 mov qword ptr [rbp - 0x18], rax
145ac2afe 7505 jne 0x145ac2b05
145ac2b00 4531e4 xor r12d, r12d
145ac2b03 eb53 jmp 0x145ac2b58
145ac2b05 4531e4 xor r12d, r12d
145ac2b08 4989fd mov r13, rdi
145ac2b0b 0f1f440000 nop dword ptr [rax + rax]
145ac2b10 4c89e3 mov rbx, r12
145ac2b13 4c89ee mov rsi, r13
145ac2b16 48d1ee shr rsi, 1
145ac2b19 4901f4 add r12, rsi
145ac2b1c 4c89e0 mov rax, r12
145ac2b1f 48c1e005 shl rax, 5
145ac2b23 498b4c0708 mov rcx, qword ptr [r15 + rax + 8]
145ac2b28 4d8b440710 mov r8, qword ptr [r15 + rax + 0x10]
145ac2b2d 4c89c7 mov rdi, r8
145ac2b30 4c29f7 sub rdi, r14
145ac2b33 4d0f43c6 cmovae r8, r14
145ac2b37 488b55e8 mov rdx, qword ptr [rbp - 0x18]
145ac2b3b e8a7114d00 call 0x145f93ce7
145ac2b40 4898 cdqe
145ac2b42 85c0 test eax, eax
145ac2b44 480f45f8 cmovne rdi, rax
145ac2b48 4885ff test rdi, rdi
145ac2b4b 4c0f4fe3 cmovg r12, rbx
145ac2b4f 4929f5 sub r13, rsi
145ac2b52 4983fd01 cmp r13, 1
145ac2b56 77b8 ja 0x145ac2b10
145ac2b58 4c89e0 mov rax, r12
145ac2b5b 48c1e005 shl rax, 5
145ac2b5f 498b4c0708 mov rcx, qword ptr [r15 + rax + 8]
145ac2b64 4d8b440710 mov r8, qword ptr [r15 + rax + 0x10]
145ac2b69 4d89c7 mov r15, r8
145ac2b6c 4d29f7 sub r15, r14
145ac2b6f 4d0f43c6 cmovae r8, r14
145ac2b73 488b7de8 mov rdi, qword ptr [rbp - 0x18]
145ac2b77 4889fa mov rdx, rdi
145ac2b7a e868114d00 call 0x145f93ce7
145ac2b7f 4898 cdqe
145ac2b81 85c0 test eax, eax
145ac2b83 4c0f45f8 cmovne r15, rax
145ac2b87 4d85ff test r15, r15
145ac2b8a 488b5df0 mov rbx, qword ptr [rbp - 0x10]
145ac2b8e 440fb66dff movzx r13d, byte ptr [rbp - 1]
145ac2b93 0f84ce000000 je 0x145ac2c67
145ac2b99 4c89f6 mov rsi, r14
145ac2b9c 4989fe mov r14, rdi
145ac2b9f 49c1ef3f shr r15, 0x3f
145ac2ba3 4d01e7 add r15, r12
145ac2ba6 488b7de0 mov rdi, qword ptr [rbp - 0x20]
145ac2baa 4c8da3c0000000 lea r12, [rbx + 0xc0]
145ac2bb1 4885f6 test rsi, rsi
145ac2bb4 790f jns 0x145ac2bc5
145ac2bb6 31ff xor edi, edi
145ac2bb8 4889f9 mov rcx, rdi
145ac2bbb 4889f2 mov rdx, rsi
145ac2bbe e8f8806700 call 0x14613acbb
145ac2bc3 0f0b ud2
145ac2bc5 0f84b0000000 je 0x145ac2c7b
145ac2bcb e830f653fa call 0x140002200
145ac2bd0 bf01000000 mov edi, 1
145ac2bd5 ba01000000 mov edx, 1
145ac2bda 4889f1 mov rcx, rsi
145ac2bdd e8def553fa call 0x1400021c0
145ac2be2 4885c0 test rax, rax
145ac2be5 74d1 je 0x145ac2bb8
145ac2be7 488945f0 mov qword ptr [rbp - 0x10], rax
145ac2beb 4889c1 mov rcx, rax
145ac2bee 4c89f2 mov rdx, r14
145ac2bf1 4989f0 mov r8, rsi
145ac2bf4 e8e2104d00 call 0x145f93cdb
145ac2bf9 488bbbd0000000 mov rdi, qword ptr [rbx + 0xd0]
145ac2c00 488975e8 mov qword ptr [rbp - 0x18], rsi
145ac2c04 4c39ff cmp rdi, r15
145ac2c07 0f8280000000 jb 0x145ac2c8d
145ac2c0d 493b3c24 cmp rdi, qword ptr [r12]
145ac2c11 7509 jne 0x145ac2c1c
145ac2c13 4c89e1 mov rcx, r12
145ac2c16 e815184d00 call 0x145f94430
145ac2c1b 90 nop
145ac2c1c 4c8b6570 mov r12, qword ptr [rbp + 0x70]
145ac2c20 4d89fe mov r14, r15
145ac2c23 49c1e605 shl r14, 5
145ac2c27 4c03b3c8000000 add r14, qword ptr [rbx + 0xc8]
145ac2c2e 4989f8 mov r8, rdi
145ac2c31 4d29f8 sub r8, r15
145ac2c34 7610 jbe 0x145ac2c46
145ac2c36 498d4e20 lea rcx, [r14 + 0x20]
145ac2c3a 49c1e005 shl r8, 5
145ac2c3e 4c89f2 mov rdx, r14
145ac2c41 e89b104d00 call 0x145f93ce1
145ac2c46 488b45e8 mov rax, qword ptr [rbp - 0x18]
145ac2c4a 498906 mov qword ptr [r14], rax
145ac2c4d 488b4df0 mov rcx, qword ptr [rbp - 0x10]
145ac2c51 49894e08 mov qword ptr [r14 + 8], rcx
145ac2c55 49894610 mov qword ptr [r14 + 0x10], rax
145ac2c59 4d896618 mov qword ptr [r14 + 0x18], r12
145ac2c5d 48ffc7 inc rdi
145ac2c60 4889bbd0000000 mov qword ptr [rbx + 0xd0], rdi
145ac2c67 4489e8 mov eax, r13d
145ac2c6a 4883c448 add rsp, 0x48
145ac2c6e 5b pop rbx
145ac2c6f 5f pop rdi
145ac2c70 5e pop rsi
145ac2c71 415c pop r12
145ac2c73 415d pop r13
145ac2c75 415e pop r14
145ac2c77 415f pop r15
145ac2c79 5d pop rbp
145ac2c7a c3 ret
145ac2c7b b801000000 mov eax, 1
145ac2c80 488945f0 mov qword ptr [rbp - 0x10], rax
145ac2c84 488975e8 mov qword ptr [rbp - 0x18], rsi
145ac2c88 4c39ff cmp rdi, r15
145ac2c8b 7380 jae 0x145ac2c0d
145ac2c8d 4c8d0584b98001 lea r8, [rip + 0x180b984]
145ac2c94 4c89f9 mov rcx, r15
145ac2c97 4889fa mov rdx, rdi
145ac2c9a e865806700 call 0x14613ad04
145ac2c9f 90 nop
145ac2ca0 0f0b ud2
