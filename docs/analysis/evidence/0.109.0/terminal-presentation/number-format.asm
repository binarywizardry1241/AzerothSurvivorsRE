140285c50 55 push rbp
140285c51 4157 push r15
140285c53 4156 push r14
140285c55 4155 push r13
140285c57 4154 push r12
140285c59 56 push rsi
140285c5a 57 push rdi
140285c5b 53 push rbx
140285c5c 4883ec78 sub rsp, 0x78
140285c60 488d6c2470 lea rbp, [rsp + 0x70]
140285c65 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
140285c6d 660f28c1 movapd xmm0, xmm1
140285c71 48894dd8 mov qword ptr [rbp - 0x28], rcx
140285c75 e8d3449705 call 0x145bfa14d
140285c7a f2480f2cc0 cvttsd2si rax, xmm0
140285c7f 4889c1 mov rcx, rax
140285c82 48c1f93f sar rcx, 0x3f
140285c86 660f28c8 movapd xmm1, xmm0
140285c8a f20f5c0dee72b405 subsd xmm1, qword ptr [rip + 0x5b472ee]
140285c92 f2480f2cd1 cvttsd2si rdx, xmm1
140285c97 4821ca and rdx, rcx
140285c9a 4809c2 or rdx, rax
140285c9d 31c0 xor eax, eax
140285c9f 660f57c9 xorpd xmm1, xmm1
140285ca3 660f2ec1 ucomisd xmm0, xmm1
140285ca7 480f43c2 cmovae rax, rdx
140285cab 660f2e05d572b405 ucomisd xmm0, qword ptr [rip + 0x5b472d5]
140285cb3 48c7c1ffffffff mov rcx, 0xffffffffffffffff
140285cba 480f46c8 cmovbe rcx, rax
140285cbe 48894dd0 mov qword ptr [rbp - 0x30], rcx
140285cc2 488d45d0 lea rax, [rbp - 0x30]
140285cc6 488945e8 mov qword ptr [rbp - 0x18], rax
140285cca 488d05ff9a9505 lea rax, [rip + 0x5959aff]
140285cd1 488945f0 mov qword ptr [rbp - 0x10], rax
140285cd5 488d1566b5b605 lea rdx, [rip + 0x5b6b566]
140285cdc 488d4db8 lea rcx, [rbp - 0x48]
140285ce0 4c8d45e8 lea r8, [rbp - 0x18]
140285ce4 e847719405 call 0x145bcce30
140285ce9 48c745e800000000 mov qword ptr [rbp - 0x18], 0
140285cf1 48c745f001000000 mov qword ptr [rbp - 0x10], 1
140285cf9 48c745f800000000 mov qword ptr [rbp - 8], 0
140285d01 488b45c0 mov rax, qword ptr [rbp - 0x40]
140285d05 488945e0 mov qword ptr [rbp - 0x20], rax
140285d09 488b7dc8 mov rdi, qword ptr [rbp - 0x38]
140285d0d 4885ff test rdi, rdi
140285d10 0f8478020000 je 0x140285f8e
140285d16 488b75e0 mov rsi, qword ptr [rbp - 0x20]
140285d1a 4c8d3c3e lea r15, [rsi + rdi]
140285d1e 41ba01000000 mov r10d, 1
140285d24 31db xor ebx, ebx
140285d26 49bcabaaaaaaaaaaaaaa movabs r12, 0xaaaaaaaaaaaaaaab
140285d30 488d4de8 lea rcx, [rbp - 0x18]
140285d34 4531f6 xor r14d, r14d
140285d37 eb2b jmp 0x140285d64
140285d39 0f1f8000000000 nop dword ptr [rax]
140285d40 80cac0 or dl, 0xc0
140285d43 4188141a mov byte ptr [r10 + rbx], dl
140285d47 4188441a01 mov byte ptr [r10 + rbx + 1], al
140285d4c b802000000 mov eax, 2
140285d51 4801c3 add rbx, rax
140285d54 48895df8 mov qword ptr [rbp - 8], rbx
140285d58 48ffcf dec rdi
140285d5b 4c39fe cmp rsi, r15
140285d5e 0f842a020000 je 0x140285f8e
140285d64 4889f8 mov rax, rdi
140285d67 49f7e4 mul r12
140285d6a 440fb606 movzx r8d, byte ptr [rsi]
140285d6e 450fb6e8 movzx r13d, r8b
140285d72 4584ed test r13b, r13b
140285d75 7819 js 0x140285d90
140285d77 48ffc6 inc rsi
140285d7a 4983ee01 sub r14, 1
140285d7e 0f838c000000 jae 0x140285e10
140285d84 e996000000 jmp 0x140285e1f
140285d89 0f1f8000000000 nop dword ptr [rax]
140285d90 4489e8 mov eax, r13d
140285d93 83e01f and eax, 0x1f
140285d96 440fb64e01 movzx r9d, byte ptr [rsi + 1]
140285d9b 4183e13f and r9d, 0x3f
140285d9f 4180fddf cmp r13b, 0xdf
140285da3 763e jbe 0x140285de3
140285da5 440fb66e02 movzx r13d, byte ptr [rsi + 2]
140285daa 41c1e106 shl r9d, 6
140285dae 4183e53f and r13d, 0x3f
140285db2 4509cd or r13d, r9d
140285db5 4180f8f0 cmp r8b, 0xf0
140285db9 723d jb 0x140285df8
140285dbb 440fb64603 movzx r8d, byte ptr [rsi + 3]
140285dc0 4883c604 add rsi, 4
140285dc4 83e007 and eax, 7
140285dc7 c1e012 shl eax, 0x12
140285dca 41c1e506 shl r13d, 6
140285dce 4183e03f and r8d, 0x3f
140285dd2 4509e8 or r8d, r13d
140285dd5 4109c0 or r8d, eax
140285dd8 4589c5 mov r13d, r8d
140285ddb 4983ee01 sub r14, 1
140285ddf 732f jae 0x140285e10
140285de1 eb3c jmp 0x140285e1f
140285de3 4883c602 add rsi, 2
140285de7 c1e006 shl eax, 6
140285dea 4409c8 or eax, r9d
140285ded 4189c5 mov r13d, eax
140285df0 4983ee01 sub r14, 1
140285df4 731a jae 0x140285e10
140285df6 eb27 jmp 0x140285e1f
140285df8 4883c603 add rsi, 3
140285dfc c1e00c shl eax, 0xc
140285dff 4109c5 or r13d, eax
140285e02 4983ee01 sub r14, 1
140285e06 7217 jb 0x140285e1f
140285e08 0f1f840000000000 nop dword ptr [rax + rax]
140285e10 48d1ea shr rdx, 1
140285e13 488d0452 lea rax, [rdx + rdx*2]
140285e17 4889fa mov rdx, rdi
140285e1a 4829c2 sub rdx, rax
140285e1d 7425 je 0x140285e44
140285e1f 4181fd80000000 cmp r13d, 0x80
140285e26 7348 jae 0x140285e70
140285e28 48395de8 cmp qword ptr [rbp - 0x18], rbx
140285e2c 0f84ec000000 je 0x140285f1e
140285e32 4c8b55f0 mov r10, qword ptr [rbp - 0x10]
140285e36 45882c1a mov byte ptr [r10 + rbx], r13b
140285e3a b801000000 mov eax, 1
140285e3f e90dffffff jmp 0x140285d51
140285e44 48395de8 cmp qword ptr [rbp - 0x18], rbx
140285e48 0f8416010000 je 0x140285f64
140285e4e 41c6041a2c mov byte ptr [r10 + rbx], 0x2c
140285e53 48ffc3 inc rbx
140285e56 48895df8 mov qword ptr [rbp - 8], rbx
140285e5a 4181fd80000000 cmp r13d, 0x80
140285e61 72c5 jb 0x140285e28
140285e63 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140285e70 4181fd00000100 cmp r13d, 0x10000
140285e77 41b804000000 mov r8d, 4
140285e7d 4983d800 sbb r8, 0
140285e81 4181fd00080000 cmp r13d, 0x800
140285e88 b802000000 mov eax, 2
140285e8d 4c0f42c0 cmovb r8, rax
140285e91 488b45e8 mov rax, qword ptr [rbp - 0x18]
140285e95 4829d8 sub rax, rbx
140285e98 4939c0 cmp r8, rax
140285e9b 0f87a3000000 ja 0x140285f44
140285ea1 4489e8 mov eax, r13d
140285ea4 243f and al, 0x3f
140285ea6 0c80 or al, 0x80
140285ea8 4489ea mov edx, r13d
140285eab c1ea06 shr edx, 6
140285eae 4c8b55f0 mov r10, qword ptr [rbp - 0x10]
140285eb2 4181fd00080000 cmp r13d, 0x800
140285eb9 0f8281feffff jb 0x140285d40
140285ebf 80e23f and dl, 0x3f
140285ec2 80ca80 or dl, 0x80
140285ec5 4589e8 mov r8d, r13d
140285ec8 41c1e80c shr r8d, 0xc
140285ecc 4181fdffff0000 cmp r13d, 0xffff
140285ed3 771c ja 0x140285ef1
140285ed5 4180c8e0 or r8b, 0xe0
140285ed9 4588041a mov byte ptr [r10 + rbx], r8b
140285edd 4188541a01 mov byte ptr [r10 + rbx + 1], dl
140285ee2 4188441a02 mov byte ptr [r10 + rbx + 2], al
140285ee7 b803000000 mov eax, 3
140285eec e960feffff jmp 0x140285d51
140285ef1 4180e03f and r8b, 0x3f
140285ef5 4180c880 or r8b, 0x80
140285ef9 41c1ed12 shr r13d, 0x12
140285efd 4180cdf0 or r13b, 0xf0
140285f01 45882c1a mov byte ptr [r10 + rbx], r13b
140285f05 4588441a01 mov byte ptr [r10 + rbx + 1], r8b
140285f0a 4188541a02 mov byte ptr [r10 + rbx + 2], dl
140285f0f 4188441a03 mov byte ptr [r10 + rbx + 3], al
140285f14 b804000000 mov eax, 4
140285f19 e933feffff jmp 0x140285d51
140285f1e 48c744242001000000 mov qword ptr [rsp + 0x20], 1
140285f27 41b801000000 mov r8d, 1
140285f2d 41b901000000 mov r9d, 1
140285f33 4889da mov rdx, rbx
140285f36 e8354a9705 call 0x145bfa970
140285f3b 488d4de8 lea rcx, [rbp - 0x18]
140285f3f e9eefeffff jmp 0x140285e32
140285f44 48c744242001000000 mov qword ptr [rsp + 0x20], 1
140285f4d 41b901000000 mov r9d, 1
140285f53 4889da mov rdx, rbx
140285f56 e8154a9705 call 0x145bfa970
140285f5b 488d4de8 lea rcx, [rbp - 0x18]
140285f5f e93dffffff jmp 0x140285ea1
140285f64 48c744242001000000 mov qword ptr [rsp + 0x20], 1
140285f6d 41b801000000 mov r8d, 1
140285f73 41b901000000 mov r9d, 1
140285f79 4889da mov rdx, rbx
140285f7c e8ef499705 call 0x145bfa970
140285f81 488d4de8 lea rcx, [rbp - 0x18]
140285f85 4c8b55f0 mov r10, qword ptr [rbp - 0x10]
140285f89 e9c0feffff jmp 0x140285e4e
140285f8e 488b45f8 mov rax, qword ptr [rbp - 8]
140285f92 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
140285f96 48894110 mov qword ptr [rcx + 0x10], rax
140285f9a 488b45e8 mov rax, qword ptr [rbp - 0x18]
140285f9e 488901 mov qword ptr [rcx], rax
140285fa1 488b45f0 mov rax, qword ptr [rbp - 0x10]
140285fa5 48894108 mov qword ptr [rcx + 8], rax
140285fa9 488b55b8 mov rdx, qword ptr [rbp - 0x48]
140285fad 4885d2 test rdx, rdx
140285fb0 7410 je 0x140285fc2
140285fb2 41b801000000 mov r8d, 1
140285fb8 488b4de0 mov rcx, qword ptr [rbp - 0x20]
140285fbc e80fc2d7ff call 0x1400021d0
140285fc1 90 nop
140285fc2 4883c478 add rsp, 0x78
140285fc6 5b pop rbx
140285fc7 5f pop rdi
140285fc8 5e pop rsi
140285fc9 415c pop r12
140285fcb 415d pop r13
140285fcd 415e pop r14
140285fcf 415f pop r15
140285fd1 5d pop rbp
140285fd2 c3 ret
