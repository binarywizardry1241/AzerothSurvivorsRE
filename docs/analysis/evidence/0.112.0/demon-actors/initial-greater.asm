0x14590e066: 498b9500080000 mov rdx, qword ptr [r13 + 0x800]
0x14590e06d: 4885d2 test rdx, rdx
0x14590e070: 488db530010000 lea rsi, [rbp + 0x130]
0x14590e077: 0f8410020000 je 0x14590e28d
0x14590e07d: 498b85f8070000 mov rax, qword ptr [r13 + 0x7f8]
0x14590e084: 4883fa01 cmp rdx, 1
0x14590e088: 750c jne 0x14590e096
0x14590e08a: f30f10054ef44900 movss xmm0, dword ptr [rip + 0x49f44e]
0x14590e092: 31c9 xor ecx, ecx
0x14590e094: eb54 jmp 0x14590e0ea
0x14590e096: 4989d0 mov r8, rdx
0x14590e099: 4983e0fe and r8, 0xfffffffffffffffe
0x14590e09d: f30f10053bf44900 movss xmm0, dword ptr [rip + 0x49f43b]
0x14590e0a5: 31c9 xor ecx, ecx
0x14590e0a7: eb10 jmp 0x14590e0b9
0x14590e0a9: 0f1f8000000000 nop dword ptr [rax]
0x14590e0b0: 4883c102 add rcx, 2
0x14590e0b4: 4939c8 cmp r8, rcx
0x14590e0b7: 742c je 0x14590e0e5
0x14590e0b9: 803cc820 cmp byte ptr [rax + rcx*8], 0x20
0x14590e0bd: 7411 je 0x14590e0d0
0x14590e0bf: 807cc80820 cmp byte ptr [rax + rcx*8 + 8], 0x20
0x14590e0c4: 75ea jne 0x14590e0b0
0x14590e0c6: eb15 jmp 0x14590e0dd
0x14590e0c8: 0f1f840000000000 nop dword ptr [rax + rax]
0x14590e0d0: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
0x14590e0d6: 807cc80820 cmp byte ptr [rax + rcx*8 + 8], 0x20
0x14590e0db: 75d3 jne 0x14590e0b0
0x14590e0dd: f30f5844c80c addss xmm0, dword ptr [rax + rcx*8 + 0xc]
0x14590e0e3: ebcb jmp 0x14590e0b0
0x14590e0e5: f6c201 test dl, 1
0x14590e0e8: 740c je 0x14590e0f6
0x14590e0ea: 803cc820 cmp byte ptr [rax + rcx*8], 0x20
0x14590e0ee: 7506 jne 0x14590e0f6
0x14590e0f0: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
0x14590e0f6: 0f57c9 xorps xmm1, xmm1
0x14590e0f9: 0f2ec1 ucomiss xmm0, xmm1
0x14590e0fc: 0f868b010000 jbe 0x14590e28d
0x14590e102: 498bb530080000 mov rsi, qword ptr [r13 + 0x830]
0x14590e109: 4889f7 mov rdi, rsi
0x14590e10c: 48c1e706 shl rdi, 6
0x14590e110: 4889f0 mov rax, rsi
0x14590e113: 48c1e83a shr rax, 0x3a
0x14590e117: 0f95c0 setne al
0x14590e11a: 48b9f8ffffffffffff7f movabs rcx, 0x7ffffffffffffff8
0x14590e124: 4839cf cmp rdi, rcx
0x14590e127: 0f97c1 seta cl
0x14590e12a: 08c1 or cl, al
0x14590e12c: 7410 je 0x14590e13e
0x14590e12e: 4531ff xor r15d, r15d
0x14590e131: 4c89f9 mov rcx, r15
0x14590e134: 4889fa mov rdx, rdi
0x14590e137: e8afb34900 call 0x145da94eb
0x14590e13c: 0f0b ud2
0x14590e13e: 4d8bb528080000 mov r14, qword ptr [r13 + 0x828]
0x14590e145: 4885ff test rdi, rdi
0x14590e148: 7435 je 0x14590e17f
0x14590e14a: e8b1406ffa call 0x140002200
0x14590e14f: 41bf08000000 mov r15d, 8
0x14590e155: ba08000000 mov edx, 8
0x14590e15a: 4889f9 mov rcx, rdi
0x14590e15d: e85e406ffa call 0x1400021c0
0x14590e162: 48898580010000 mov qword ptr [rbp + 0x180], rax
0x14590e169: 4885c0 test rax, rax
0x14590e16c: 74c3 je 0x14590e131
0x14590e16e: 4889b570010000 mov qword ptr [rbp + 0x170], rsi
0x14590e175: 4885f6 test rsi, rsi
0x14590e178: 7525 jne 0x14590e19f
0x14590e17a: e9e5000000 jmp 0x14590e264
0x14590e17f: b808000000 mov eax, 8
0x14590e184: 48898580010000 mov qword ptr [rbp + 0x180], rax
0x14590e18b: 48c7857001000000000000 mov qword ptr [rbp + 0x170], 0
0x14590e196: 4885f6 test rsi, rsi
0x14590e199: 0f84c5000000 je 0x14590e264
0x14590e19f: 488b9d80010000 mov rbx, qword ptr [rbp + 0x180]
0x14590e1a6: 4889d9 mov rcx, rbx
0x14590e1a9: 4c89f2 mov rdx, r14
0x14590e1ac: 4989f8 mov r8, rdi
0x14590e1af: e827c22f00 call 0x145c0a3db
0x14590e1b4: 4801df add rdi, rbx
0x14590e1b7: 31f6 xor esi, esi
0x14590e1b9: f30f10359ff04900 movss xmm6, dword ptr [rip + 0x49f09f]
0x14590e1c1: f30f103d77894a00 movss xmm7, dword ptr [rip + 0x4a8977]
0x14590e1c9: eb28 jmp 0x14590e1f3
0x14590e1cb: 0f1f440000 nop dword ptr [rax + rax]
0x14590e1d0: f30f11442428 movss dword ptr [rsp + 0x28], xmm0
0x14590e1d6: 4889742420 mov qword ptr [rsp + 0x20], rsi
0x14590e1db: 4c89e9 mov rcx, r13
0x14590e1de: 4531c0 xor r8d, r8d
0x14590e1e1: e84ab90400 call 0x145959b30
0x14590e1e6: 90 nop
0x14590e1e7: 4883c340 add rbx, 0x40
0x14590e1eb: 48ffc6 inc rsi
0x14590e1ee: 4839fb cmp rbx, rdi
0x14590e1f1: 7471 je 0x14590e264
0x14590e1f3: 0fb603 movzx eax, byte ptr [rbx]
0x14590e1f6: 3cff cmp al, 0xff
0x14590e1f8: 746a je 0x14590e264
0x14590e1fa: 3c21 cmp al, 0x21
0x14590e1fc: 75e9 jne 0x14590e1e7
0x14590e1fe: 0fb64301 movzx eax, byte ptr [rbx + 1]
0x14590e202: 488b5310 mov rdx, qword ptr [rbx + 0x10]
0x14590e206: 4d8b85d0000000 mov r8, qword ptr [r13 + 0xd0]
0x14590e20d: 498b8dd8000000 mov rcx, qword ptr [r13 + 0xd8]
0x14590e214: 48c1e107 shl rcx, 7
0x14590e218: 0f1f840000000000 nop dword ptr [rax + rax]
0x14590e220: 4885c9 test rcx, rcx
0x14590e223: 741b je 0x14590e240
0x14590e225: 4883c180 add rcx, -0x80
0x14590e229: 49395018 cmp qword ptr [r8 + 0x18], rdx
0x14590e22d: 4d8d8080000000 lea r8, [r8 + 0x80]
0x14590e234: 75ea jne 0x14590e220
0x14590e236: ebaf jmp 0x14590e1e7
0x14590e238: 0f1f840000000000 nop dword ptr [rax + rax]
0x14590e240: 807a3907 cmp byte ptr [rdx + 0x39], 7
0x14590e244: 0f28c6 movaps xmm0, xmm6
0x14590e247: 7487 je 0x14590e1d0
0x14590e249: 3c01 cmp al, 1
0x14590e24b: 14ff adc al, 0xff
0x14590e24d: 0fb6c0 movzx eax, al
0x14590e250: 0f57c0 xorps xmm0, xmm0
0x14590e253: f30f2ac0 cvtsi2ss xmm0, eax
0x14590e257: f30f59c7 mulss xmm0, xmm7
0x14590e25b: f30f58c6 addss xmm0, xmm6
0x14590e25f: e96cffffff jmp 0x14590e1d0
