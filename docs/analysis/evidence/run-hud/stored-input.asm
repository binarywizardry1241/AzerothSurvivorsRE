14028c740 4157 push r15
14028c742 4156 push r14
14028c744 4155 push r13
14028c746 4154 push r12
14028c748 56 push rsi
14028c749 57 push rdi
14028c74a 55 push rbp
14028c74b 53 push rbx
14028c74c 4881ec18010000 sub rsp, 0x118
14028c753 488b3a mov rdi, qword ptr [rdx]
14028c756 488b5a08 mov rbx, qword ptr [rdx + 8]
14028c75a 8b6a14 mov ebp, dword ptr [rdx + 0x14]
14028c75d 498b00 mov rax, qword ptr [r8]
14028c760 4889442428 mov qword ptr [rsp + 0x28], rax
14028c765 4c8bb7f8000000 mov r14, qword ptr [rdi + 0xf8]
14028c76c 488b8700010000 mov rax, qword ptr [rdi + 0x100]
14028c773 4d8d3c86 lea r15, [r14 + rax*4]
14028c777 89e8 mov eax, ebp
14028c779 2b4210 sub eax, dword ptr [rdx + 0x10]
14028c77c 3d00b033c2 cmp eax, 0xc233b000
14028c781 41bc00b033c2 mov r12d, 0xc233b000
14028c787 440f42e0 cmovb r12d, eax
14028c78b 80bf0801000000 cmp byte ptr [rdi + 0x108], 0
14028c792 0f84ff000000 je 0x14028c897
14028c798 31c0 xor eax, eax
14028c79a 31d2 xor edx, edx
14028c79c 31c9 xor ecx, ecx
14028c79e 4531ed xor r13d, r13d
14028c7a1 eb36 jmp 0x14028c7d9
14028c7a3 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14028c7b0 4531ed xor r13d, r13d
14028c7b3 488b9720010000 mov rdx, qword ptr [rdi + 0x120]
14028c7ba e8b12abc04 call 0x144e4f270
14028c7bf 488b0e mov rcx, qword ptr [rsi]
14028c7c2 31d2 xor edx, edx
14028c7c4 4189d0 mov r8d, edx
14028c7c7 ffc2 inc edx
14028c7c9 4189e9 mov r9d, ebp
14028c7cc 462b0c80 sub r9d, dword ptr [rax + r8*4]
14028c7d0 4539e1 cmp r9d, r12d
14028c7d3 0f82ad000000 jb 0x14028c886
14028c7d9 39ca cmp edx, ecx
14028c7db 75e7 jne 0x14028c7c4
14028c7dd 4d39fe cmp r14, r15
14028c7e0 0f84f6010000 je 0x14028c9dc
14028c7e6 418b0e mov ecx, dword ptr [r14]
14028c7e9 4983c604 add r14, 4
14028c7ed 488b83a8010000 mov rax, qword ptr [rbx + 0x1a8]
14028c7f4 488d14c9 lea rdx, [rcx + rcx*8]
14028c7f8 48837cd01000 cmp qword ptr [rax + rdx*8 + 0x10], 0
14028c7fe 7420 je 0x14028c820
14028c800 488d0cd0 lea rcx, [rax + rdx*8]
14028c804 488d34d0 lea rsi, [rax + rdx*8]
14028c808 4883c610 add rsi, 0x10
14028c80c 488b8710010000 mov rax, qword ptr [rdi + 0x110]
14028c813 483b4140 cmp rax, qword ptr [rcx + 0x40]
14028c817 7397 jae 0x14028c7b0
14028c819 eb41 jmp 0x14028c85c
14028c81b 0f1f440000 nop dword ptr [rax + rax]
14028c820 4d39fe cmp r14, r15
14028c823 0f84b3010000 je 0x14028c9dc
14028c829 418b0e mov ecx, dword ptr [r14]
14028c82c 4983c604 add r14, 4
14028c830 488b83a8010000 mov rax, qword ptr [rbx + 0x1a8]
14028c837 488d0cc9 lea rcx, [rcx + rcx*8]
14028c83b 48837cc81000 cmp qword ptr [rax + rcx*8 + 0x10], 0
14028c841 74dd je 0x14028c820
14028c843 488d0cc8 lea rcx, [rax + rcx*8]
14028c847 488d7110 lea rsi, [rcx + 0x10]
14028c84b 488b8710010000 mov rax, qword ptr [rdi + 0x110]
14028c852 483b4140 cmp rax, qword ptr [rcx + 0x40]
14028c856 0f8354ffffff jae 0x14028c7b0
14028c85c 488b5138 mov rdx, qword ptr [rcx + 0x38]
14028c860 488b04c2 mov rax, qword ptr [rdx + rax*8]
14028c864 4885c0 test rax, rax
14028c867 0f8443ffffff je 0x14028c7b0
14028c86d 488b5118 mov rdx, qword ptr [rcx + 0x18]
14028c871 48f7d0 not rax
14028c874 488d0440 lea rax, [rax + rax*2]
14028c878 48c1e004 shl rax, 4
14028c87c 4c8b6c0210 mov r13, qword ptr [rdx + rax + 0x10]
14028c881 e92dffffff jmp 0x14028c7b3
14028c886 43807c050000 cmp byte ptr [r13 + r8], 0
14028c88c 0f8547ffffff jne 0x14028c7d9
14028c892 e92d010000 jmp 0x14028c9c4
14028c897 b908000000 mov ecx, 8
14028c89c 31c0 xor eax, eax
14028c89e 4531c0 xor r8d, r8d
14028c8a1 31d2 xor edx, edx
14028c8a3 48c744242000000000 mov qword ptr [rsp + 0x20], 0
14028c8ac eb44 jmp 0x14028c8f2
14028c8ae 6690 nop
14028c8b0 48c744242000000000 mov qword ptr [rsp + 0x20], 0
14028c8b9 488b9720010000 mov rdx, qword ptr [rdi + 0x120]
14028c8c0 e8ab29bc04 call 0x144e4f270
14028c8c5 488b4e50 mov rcx, qword ptr [rsi + 0x50]
14028c8c9 498b5500 mov rdx, qword ptr [r13]
14028c8cd 4531c0 xor r8d, r8d
14028c8d0 4589c1 mov r9d, r8d
14028c8d3 49c1e104 shl r9, 4
14028c8d7 41ffc0 inc r8d
14028c8da 468b4c0908 mov r9d, dword ptr [rcx + r9 + 8]
14028c8df 41f7d1 not r9d
14028c8e2 4189ea mov r10d, ebp
14028c8e5 462b1488 sub r10d, dword ptr [rax + r9*4]
14028c8e9 4539e2 cmp r10d, r12d
14028c8ec 0f82c2000000 jb 0x14028c9b4
14028c8f2 4139d0 cmp r8d, edx
14028c8f5 75d9 jne 0x14028c8d0
14028c8f7 4d39fe cmp r14, r15
14028c8fa 0f84dc000000 je 0x14028c9dc
14028c900 418b0e mov ecx, dword ptr [r14]
14028c903 4983c604 add r14, 4
14028c907 488b8308010000 mov rax, qword ptr [rbx + 0x108]
14028c90e 488d0c89 lea rcx, [rcx + rcx*4]
14028c912 48c1e105 shl rcx, 5
14028c916 48837c085800 cmp qword ptr [rax + rcx + 0x58], 0
14028c91c 7412 je 0x14028c930
14028c91e 488d3408 lea rsi, [rax + rcx]
14028c922 4c8d2c08 lea r13, [rax + rcx]
14028c926 4983c558 add r13, 0x58
14028c92a eb32 jmp 0x14028c95e
14028c92c 0f1f4000 nop dword ptr [rax]
14028c930 4d39fe cmp r14, r15
14028c933 0f84a3000000 je 0x14028c9dc
14028c939 418b06 mov eax, dword ptr [r14]
14028c93c 4983c604 add r14, 4
14028c940 488bb308010000 mov rsi, qword ptr [rbx + 0x108]
14028c947 488d0480 lea rax, [rax + rax*4]
14028c94b 48c1e005 shl rax, 5
14028c94f 48837c065800 cmp qword ptr [rsi + rax + 0x58], 0
14028c955 74d9 je 0x14028c930
14028c957 4801c6 add rsi, rax
14028c95a 4c8d6e58 lea r13, [rsi + 0x58]
14028c95e 8b8694000000 mov eax, dword ptr [rsi + 0x94]
14028c964 488b93a8010000 mov rdx, qword ptr [rbx + 0x1a8]
14028c96b 4c8d04c0 lea r8, [rax + rax*8]
14028c96f 4a8d0cc2 lea rcx, [rdx + r8*8]
14028c973 488b8710010000 mov rax, qword ptr [rdi + 0x110]
14028c97a 4a3b44c240 cmp rax, qword ptr [rdx + r8*8 + 0x40]
14028c97f 0f832bffffff jae 0x14028c8b0
14028c985 488b5138 mov rdx, qword ptr [rcx + 0x38]
14028c989 488b04c2 mov rax, qword ptr [rdx + rax*8]
14028c98d 4885c0 test rax, rax
14028c990 0f841affffff je 0x14028c8b0
14028c996 488b5118 mov rdx, qword ptr [rcx + 0x18]
14028c99a 48f7d0 not rax
14028c99d 488d0440 lea rax, [rax + rax*2]
14028c9a1 48c1e004 shl rax, 4
14028c9a5 488b440210 mov rax, qword ptr [rdx + rax + 0x10]
14028c9aa 4889442420 mov qword ptr [rsp + 0x20], rax
14028c9af e905ffffff jmp 0x14028c8b9
14028c9b4 4c8b542420 mov r10, qword ptr [rsp + 0x20]
14028c9b9 43803c0a00 cmp byte ptr [r10 + r9], 0
14028c9be 0f852effffff jne 0x14028c8f2
14028c9c4 c744243016000000 mov dword ptr [rsp + 0x30], 0x16
14028c9cc 488d542430 lea rdx, [rsp + 0x30]
14028c9d1 488b4c2428 mov rcx, qword ptr [rsp + 0x28]
14028c9d6 e8c56eefff call 0x1401838a0
14028c9db 90 nop
14028c9dc 4881c418010000 add rsp, 0x118
14028c9e3 5b pop rbx
14028c9e4 5d pop rbp
14028c9e5 5f pop rdi
14028c9e6 5e pop rsi
14028c9e7 415c pop r12
14028c9e9 415d pop r13
14028c9eb 415e pop r14
14028c9ed 415f pop r15
14028c9ef c3 ret
