145b45bf0 4157 push r15
145b45bf2 4156 push r14
145b45bf4 4155 push r13
145b45bf6 4154 push r12
145b45bf8 56 push rsi
145b45bf9 57 push rdi
145b45bfa 53 push rbx
145b45bfb 4883ec40 sub rsp, 0x40
145b45bff 4983f803 cmp r8, 3
145b45c03 764c jbe 0x145b45c51
145b45c05 813a57444243 cmp dword ptr [rdx], 0x43424457
145b45c0b 7544 jne 0x145b45c51
145b45c0d 4983f808 cmp r8, 8
145b45c11 723e jb 0x145b45c51
145b45c13 4983f80c cmp r8, 0xc
145b45c17 7238 jb 0x145b45c51
145b45c19 4983f810 cmp r8, 0x10
145b45c1d 7232 jb 0x145b45c51
145b45c1f 8b4208 mov eax, dword ptr [rdx + 8]
145b45c22 448b720c mov r14d, dword ptr [rdx + 0xc]
145b45c26 4883f807 cmp rax, 7
145b45c2a 410f92c1 setb r9b
145b45c2e 48c1e002 shl rax, 2
145b45c32 4c39f0 cmp rax, r14
145b45c35 0f97c0 seta al
145b45c38 4408c8 or al, r9b
145b45c3b 7514 jne 0x145b45c51
145b45c3d 448b7a04 mov r15d, dword ptr [rdx + 4]
145b45c41 4c89f0 mov rax, r14
145b45c44 490fafc7 imul rax, r15
145b45c48 4883c014 add rax, 0x14
145b45c4c 4939c0 cmp r8, rax
145b45c4f 731a jae 0x145b45c6b
145b45c51 48c701ffffffff mov qword ptr [rcx], 0xffffffffffffffff
145b45c58 4889c8 mov rax, rcx
145b45c5b 4883c440 add rsp, 0x40
145b45c5f 5b pop rbx
145b45c60 5f pop rdi
145b45c61 5e pop rsi
145b45c62 415c pop r12
145b45c64 415d pop r13
145b45c66 415e pop r14
145b45c68 415f pop r15
145b45c6a c3 ret
145b45c6b 4889d3 mov rbx, rdx
145b45c6e 4989cc mov r12, rcx
145b45c71 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145b45c7a 488d4c2428 lea rcx, [rsp + 0x28]
145b45c7f 41b901000000 mov r9d, 1
145b45c85 4d89c5 mov r13, r8
145b45c88 4c89c2 mov rdx, r8
145b45c8b 4531c0 xor r8d, r8d
145b45c8e e80dfa4cfa call 0x1400156a0
145b45c93 488b742430 mov rsi, qword ptr [rsp + 0x30]
145b45c98 837c242801 cmp dword ptr [rsp + 0x28], 1
145b45c9d 7479 je 0x145b45d18
145b45c9f 488b7c2438 mov rdi, qword ptr [rsp + 0x38]
145b45ca4 4889f9 mov rcx, rdi
145b45ca7 4889da mov rdx, rbx
145b45caa 4c89eb mov rbx, r13
145b45cad 4d89e8 mov r8, r13
145b45cb0 e826e54400 call 0x145f941db
145b45cb5 4585ff test r15d, r15d
145b45cb8 4c89e1 mov rcx, r12
145b45cbb 7428 je 0x145b45ce5
145b45cbd b830000000 mov eax, 0x30
145b45cc2 eb08 jmp 0x145b45ccc
145b45cc4 4c01f0 add rax, r14
145b45cc7 49ffcf dec r15
145b45cca 7419 je 0x145b45ce5
145b45ccc 4839d8 cmp rax, rbx
145b45ccf 7724 ja 0x145b45cf5
145b45cd1 817c07fc01210000 cmp dword ptr [rdi + rax - 4], 0x2101
145b45cd9 75e9 jne 0x145b45cc4
145b45cdb c74407fc00000000 mov dword ptr [rdi + rax - 4], 0
145b45ce3 ebdf jmp 0x145b45cc4
145b45ce5 488931 mov qword ptr [rcx], rsi
145b45ce8 48897908 mov qword ptr [rcx + 8], rdi
145b45cec 48895910 mov qword ptr [rcx + 0x10], rbx
145b45cf0 e963ffffff jmp 0x145b45c58
145b45cf5 48c701ffffffff mov qword ptr [rcx], 0xffffffffffffffff
145b45cfc 41b801000000 mov r8d, 1
145b45d02 4889cb mov rbx, rcx
145b45d05 4889f9 mov rcx, rdi
145b45d08 4889f2 mov rdx, rsi
145b45d0b e8c0c44bfa call 0x1400021d0
145b45d10 4889d8 mov rax, rbx
145b45d13 e943ffffff jmp 0x145b45c5b
145b45d18 488b542438 mov rdx, qword ptr [rsp + 0x38]
145b45d1d 4889f1 mov rcx, rsi
145b45d20 e896545f00 call 0x14613b1bb
145b45d25 0f0b ud2
