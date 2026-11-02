1403a8d80 55 push rbp
1403a8d81 4157 push r15
1403a8d83 4156 push r14
1403a8d85 56 push rsi
1403a8d86 57 push rdi
1403a8d87 53 push rbx
1403a8d88 4881ecd8020000 sub rsp, 0x2d8
1403a8d8f 488dac2480000000 lea rbp, [rsp + 0x80]
1403a8d97 48c78550020000feffffff mov qword ptr [rbp + 0x250], 0xfffffffffffffffe
1403a8da2 4889d7 mov rdi, rdx
1403a8da5 4889ce mov rsi, rcx
1403a8da8 4889d1 mov rcx, rdx
1403a8dab e840efefff call 0x1402a7cf0
1403a8db0 4889c3 mov rbx, rax
1403a8db3 4889f9 mov rcx, rdi
1403a8db6 e805eaf0ff call 0x1402b77c0
1403a8dbb 4989c6 mov r14, rax
1403a8dbe 4889f9 mov rcx, rdi
1403a8dc1 e80aa4f0ff call 0x1402b31d0
1403a8dc6 48899d30020000 mov qword ptr [rbp + 0x230], rbx
1403a8dcd 4c89b538020000 mov qword ptr [rbp + 0x238], r14
1403a8dd4 48898540020000 mov qword ptr [rbp + 0x240], rax
1403a8ddb 4889f9 mov rcx, rdi
1403a8dde e80defefff call 0x1402a7cf0
1403a8de3 4889c3 mov rbx, rax
1403a8de6 4c8d75a0 lea r14, [rbp - 0x60]
1403a8dea 4c89f1 mov rcx, r14
1403a8ded e89e0eae04 call 0x144e89c90
1403a8df2 c6854f02000001 mov byte ptr [rbp + 0x24f], 1
1403a8df9 488d8d30020000 lea rcx, [rbp + 0x230]
1403a8e00 4c89f2 mov rdx, r14
1403a8e03 e89845fdff call 0x14037d3a0
1403a8e08 90 nop
1403a8e09 c6854f02000001 mov byte ptr [rbp + 0x24f], 1
1403a8e10 488d4d50 lea rcx, [rbp + 0x50]
1403a8e14 e8770eae04 call 0x144e89c90
1403a8e19 90 nop
1403a8e1a 0fb685e1000000 movzx eax, byte ptr [rbp + 0xe1]
1403a8e21 483b9d90000000 cmp rbx, qword ptr [rbp + 0x90]
1403a8e28 0f83f1000000 jae 0x1403a8f1f
1403a8e2e 488b8d80000000 mov rcx, qword ptr [rbp + 0x80]
1403a8e35 4889da mov rdx, rbx
1403a8e38 48c1ea06 shr rdx, 6
1403a8e3c 488b0cd1 mov rcx, qword ptr [rcx + rdx*8]
1403a8e40 480fa3d9 bt rcx, rbx
1403a8e44 1c00 sbb al, 0
1403a8e46 0f85db000000 jne 0x1403a8f27
1403a8e4c 488d4d50 lea rcx, [rbp + 0x50]
1403a8e50 4889da mov rdx, rbx
1403a8e53 e818a5ad04 call 0x144e83370
1403a8e58 90 nop
1403a8e59 488d4da0 lea rcx, [rbp - 0x60]
1403a8e5d 488d5550 lea rdx, [rbp + 0x50]
1403a8e61 e87aa8ad04 call 0x144e836e0
1403a8e66 90 nop
1403a8e67 41b601 mov r14b, 1
1403a8e6a 4883bf9000000000 cmp qword ptr [rdi + 0x90], 0
1403a8e72 0f8442010000 je 0x1403a8fba
1403a8e78 488b4778 mov rax, qword ptr [rdi + 0x78]
1403a8e7c 488b8f80000000 mov rcx, qword ptr [rdi + 0x80]
1403a8e83 48ba1942cea89620590e movabs rdx, 0xe592096a8ce4219
1403a8e8d 4531c0 xor r8d, r8d
1403a8e90 660f6f0588aea405 movdqa xmm0, xmmword ptr [rip + 0x5a4ae88]
1403a8e98 660f76c9 pcmpeqd xmm1, xmm1
1403a8e9c 660f6f15cc55a505 movdqa xmm2, xmmword ptr [rip + 0x5a555cc]
1403a8ea4 4821ca and rdx, rcx
1403a8ea7 f30f6f1c10 movdqu xmm3, xmmword ptr [rax + rdx]
1403a8eac 660f6fe3 movdqa xmm4, xmm3
1403a8eb0 660f74e0 pcmpeqb xmm4, xmm0
1403a8eb4 66440fd7cc pmovmskb r9d, xmm4
1403a8eb9 4585c9 test r9d, r9d
1403a8ebc 7442 je 0x1403a8f00
1403a8ebe f3450fbcd1 tzcnt r10d, r9d
1403a8ec3 4901d2 add r10, rdx
1403a8ec6 4921ca and r10, rcx
1403a8ec9 49f7da neg r10
1403a8ecc 4f8d1452 lea r10, [r10 + r10*2]
1403a8ed0 f3420f6f64d0e8 movdqu xmm4, xmmword ptr [rax + r10*8 - 0x18]
1403a8ed7 660f74e2 pcmpeqb xmm4, xmm2
1403a8edb 66440fd7dc pmovmskb r11d, xmm4
1403a8ee0 4181fbffff0000 cmp r11d, 0xffff
1403a8ee7 7477 je 0x1403a8f60
1403a8ee9 458d51ff lea r10d, [r9 - 1]
1403a8eed 664521ca and r10w, r9w
1403a8ef1 4589d1 mov r9d, r10d
1403a8ef4 75c8 jne 0x1403a8ebe
1403a8ef6 662e0f1f840000000000 nop word ptr cs:[rax + rax]
1403a8f00 660f74d9 pcmpeqb xmm3, xmm1
1403a8f04 66440fd7cb pmovmskb r9d, xmm3
1403a8f09 4585c9 test r9d, r9d
1403a8f0c 0f85a8000000 jne 0x1403a8fba
1403a8f12 4c01c2 add rdx, r8
1403a8f15 4883c210 add rdx, 0x10
1403a8f19 4983c010 add r8, 0x10
1403a8f1d eb85 jmp 0x1403a8ea4
1403a8f1f 84c0 test al, al
1403a8f21 0f8425ffffff je 0x1403a8e4c
1403a8f27 488d854e020000 lea rax, [rbp + 0x24e]
1403a8f2e 48898500010000 mov qword ptr [rbp + 0x100], rax
1403a8f35 488d05c443c504 lea rax, [rip + 0x4c543c4]
1403a8f3c 48898508010000 mov qword ptr [rbp + 0x108], rax
1403a8f43 488d0d8656a505 lea rcx, [rip + 0x5a55686]
1403a8f4a 4c8d055f57a505 lea r8, [rip + 0x5a5575f]
1403a8f51 488d9500010000 lea rdx, [rbp + 0x100]
1403a8f58 e8d3089f05 call 0x145d99830
1403a8f5d 90 nop
1403a8f5e 0f0b ud2
1403a8f60 4a8d04d0 lea rax, [rax + r10*8]
1403a8f64 488b40f8 mov rax, qword ptr [rax - 8]
1403a8f68 483b8718020000 cmp rax, qword ptr [rdi + 0x218]
1403a8f6f 7349 jae 0x1403a8fba
1403a8f71 488b8f10020000 mov rcx, qword ptr [rdi + 0x210]
1403a8f78 488b0cc1 mov rcx, qword ptr [rcx + rax*8]
1403a8f7c 4885c9 test rcx, rcx
1403a8f7f 7439 je 0x1403a8fba
1403a8f81 488b87e0010000 mov rax, qword ptr [rdi + 0x1e0]
1403a8f88 48f7d1 not rcx
1403a8f8b 486bc938 imul rcx, rcx, 0x38
1403a8f8f 807c083001 cmp byte ptr [rax + rcx + 0x30], 1
1403a8f94 7524 jne 0x1403a8fba
1403a8f96 4801c8 add rax, rcx
1403a8f99 4c8b7010 mov r14, qword ptr [rax + 0x10]
1403a8f9d 488d55a0 lea rdx, [rbp - 0x60]
1403a8fa1 4c89f1 mov rcx, r14
1403a8fa4 e85700a604 call 0x144e09000
1403a8fa9 90 nop
1403a8faa 488d5740 lea rdx, [rdi + 0x40]
1403a8fae 4c89f1 mov rcx, r14
1403a8fb1 e8aa01a604 call 0x144e09160
1403a8fb6 90 nop
1403a8fb7 4189c6 mov r14d, eax
1403a8fba 4c8bbfa0050000 mov r15, qword ptr [rdi + 0x5a0]
1403a8fc1 488d8d40010000 lea rcx, [rbp + 0x140]
1403a8fc8 488d55a0 lea rdx, [rbp - 0x60]
1403a8fcc 41b8b0000000 mov r8d, 0xb0
1403a8fd2 e810118505 call 0x145bfa0e7
1403a8fd7 4c89bd00010000 mov qword ptr [rbp + 0x100], r15
1403a8fde c7850801000000000000 mov dword ptr [rbp + 0x108], 0
1403a8fe8 48c7851001000010000000 mov qword ptr [rbp + 0x110], 0x10
1403a8ff3 660fefc0 pxor xmm0, xmm0
1403a8ff7 f30f7f8518010000 movdqu xmmword ptr [rbp + 0x118], xmm0
1403a8fff 48c7852801000010000000 mov qword ptr [rbp + 0x128], 0x10
1403a900a f30f7f8530010000 movdqu xmmword ptr [rbp + 0x130], xmm0
1403a9012 48c785f001000000000000 mov qword ptr [rbp + 0x1f0], 0
1403a901d 48c785f801000004000000 mov qword ptr [rbp + 0x1f8], 4
1403a9028 48c7850002000000000000 mov qword ptr [rbp + 0x200], 0
1403a9033 4488b508020000 mov byte ptr [rbp + 0x208], r14b
1403a903a f30f6f8530020000 movdqu xmm0, xmmword ptr [rbp + 0x230]
1403a9042 f30f7f8510020000 movdqu xmmword ptr [rbp + 0x210], xmm0
1403a904a 488b8540020000 mov rax, qword ptr [rbp + 0x240]
1403a9051 48898520020000 mov qword ptr [rbp + 0x220], rax
1403a9058 48899d28020000 mov qword ptr [rbp + 0x228], rbx
1403a905f c6854f02000000 mov byte ptr [rbp + 0x24f], 0
1403a9066 488d4d50 lea rcx, [rbp + 0x50]
1403a906a e87194fdff call 0x1403824e0
1403a906f 90 nop
1403a9070 488d8d00010000 lea rcx, [rbp + 0x100]
1403a9077 4889fa mov rdx, rdi
1403a907a e8f1f0ffff call 0x1403a8170
1403a907f 90 nop
1403a9080 488d9500010000 lea rdx, [rbp + 0x100]
1403a9087 41b830010000 mov r8d, 0x130
1403a908d 4889f1 mov rcx, rsi
1403a9090 e852108505 call 0x145bfa0e7
1403a9095 4889f0 mov rax, rsi
1403a9098 4881c4d8020000 add rsp, 0x2d8
1403a909f 5b pop rbx
1403a90a0 5f pop rdi
1403a90a1 5e pop rsi
1403a90a2 415e pop r14
1403a90a4 415f pop r15
1403a90a6 5d pop rbp
1403a90a7 c3 ret
