0x145ab5240: push rbp
0x145ab5241: push rsi
0x145ab5242: push rdi
0x145ab5243: sub rsp, 0x40
0x145ab5247: lea rbp, [rsp + 0x40]
0x145ab524c: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x145ab5254: mov rdi, qword ptr [rcx]
0x145ab5257: mov cl, 1
0x145ab5259: xor eax, eax
0x145ab525b: lock cmpxchg byte ptr [rdi + 0x10], cl
0x145ab5260: jne 0x145ab52ae
0x145ab5262: mov rsi, qword ptr [rip + 0x2a65907]
0x145ab5269: mov rax, qword ptr [rsi]
0x145ab526c: shl rax, 1
0x145ab526f: test rax, rax
0x145ab5272: jne 0x145ab52b9
0x145ab5274: xor ecx, ecx
0x145ab5276: movzx eax, byte ptr [rdi + 0x11]
0x145ab527a: cmp dword ptr [rdi + 0xa0], -1
0x145ab5281: je 0x145ab52d0
0x145ab5283: mov dword ptr [rbp - 0xc], ecx
0x145ab5286: mov rcx, qword ptr [rdi + 0x88]
0x145ab528d: mov qword ptr [rbp - 0x18], rdi
0x145ab5291: mov rax, qword ptr [rdi + 0x90]
0x145ab5298: call qword ptr [rax + 0x28]
0x145ab529b: nop
0x145ab529c: cmp al, 2
0x145ab529e: setne al
0x145ab52a1: mov rdi, qword ptr [rbp - 0x18]
0x145ab52a5: mov ecx, dword ptr [rbp - 0xc]
0x145ab52a8: test cl, cl
0x145ab52aa: je 0x145ab52d6
0x145ab52ac: jmp 0x145ab52e1
0x145ab52ae: lea rcx, [rdi + 0x10]
0x145ab52b2: call 0x14613ca60
0x145ab52b7: jmp 0x145ab5262
0x145ab52b9: call 0x14613d7f0
0x145ab52be: mov ecx, eax
0x145ab52c0: xor cl, 1
0x145ab52c3: movzx eax, byte ptr [rdi + 0x11]
0x145ab52c7: cmp dword ptr [rdi + 0xa0], -1
0x145ab52ce: jne 0x145ab5283
0x145ab52d0: xor eax, eax
0x145ab52d2: test cl, cl
0x145ab52d4: jne 0x145ab52e1
0x145ab52d6: mov rcx, qword ptr [rsi]
0x145ab52d9: shl rcx, 1
0x145ab52dc: test rcx, rcx
0x145ab52df: jne 0x145ab5305
0x145ab52e1: xor ecx, ecx
0x145ab52e3: xchg byte ptr [rdi + 0x10], cl
0x145ab52e6: cmp cl, 2
0x145ab52e9: je 0x145ab52f3
0x145ab52eb: add rsp, 0x40
0x145ab52ef: pop rdi
0x145ab52f0: pop rsi
0x145ab52f1: pop rbp
0x145ab52f2: ret
0x145ab52f3: add rdi, 0x10
0x145ab52f7: mov rcx, rdi
0x145ab52fa: mov esi, eax
0x145ab52fc: call 0x14613cb20
0x145ab5301: mov eax, esi
0x145ab5303: jmp 0x145ab52eb
0x145ab5305: mov esi, eax
0x145ab5307: call 0x14613d7f0
0x145ab530c: mov ecx, eax
0x145ab530e: mov eax, esi
0x145ab5310: test cl, cl
0x145ab5312: jne 0x145ab52e1
0x145ab5314: mov byte ptr [rdi + 0x11], 1
0x145ab5318: jmp 0x145ab52e1
