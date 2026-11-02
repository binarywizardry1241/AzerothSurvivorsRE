0x145ab5130: push rbp
0x145ab5131: push rsi
0x145ab5132: push rdi
0x145ab5133: sub rsp, 0x40
0x145ab5137: lea rbp, [rsp + 0x40]
0x145ab513c: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x145ab5144: mov rdi, qword ptr [rcx]
0x145ab5147: mov cl, 1
0x145ab5149: xor eax, eax
0x145ab514b: lock cmpxchg byte ptr [rdi + 0x10], cl
0x145ab5150: jne 0x145ab519e
0x145ab5152: mov rsi, qword ptr [rip + 0x2a65a17]
0x145ab5159: mov rax, qword ptr [rsi]
0x145ab515c: shl rax, 1
0x145ab515f: test rax, rax
0x145ab5162: jne 0x145ab51a9
0x145ab5164: xor ecx, ecx
0x145ab5166: movzx eax, byte ptr [rdi + 0x11]
0x145ab516a: cmp dword ptr [rdi + 0xa0], -1
0x145ab5171: je 0x145ab51c0
0x145ab5173: mov dword ptr [rbp - 0xc], ecx
0x145ab5176: mov rcx, qword ptr [rdi + 0x88]
0x145ab517d: mov qword ptr [rbp - 0x18], rdi
0x145ab5181: mov rax, qword ptr [rdi + 0x90]
0x145ab5188: call qword ptr [rax + 0x28]
0x145ab518b: nop
0x145ab518c: cmp al, 2
0x145ab518e: sete al
0x145ab5191: mov rdi, qword ptr [rbp - 0x18]
0x145ab5195: mov ecx, dword ptr [rbp - 0xc]
0x145ab5198: test cl, cl
0x145ab519a: je 0x145ab51c6
0x145ab519c: jmp 0x145ab51d1
0x145ab519e: lea rcx, [rdi + 0x10]
0x145ab51a2: call 0x14613ca60
0x145ab51a7: jmp 0x145ab5152
0x145ab51a9: call 0x14613d7f0
0x145ab51ae: mov ecx, eax
0x145ab51b0: xor cl, 1
0x145ab51b3: movzx eax, byte ptr [rdi + 0x11]
0x145ab51b7: cmp dword ptr [rdi + 0xa0], -1
0x145ab51be: jne 0x145ab5173
0x145ab51c0: xor eax, eax
0x145ab51c2: test cl, cl
0x145ab51c4: jne 0x145ab51d1
0x145ab51c6: mov rcx, qword ptr [rsi]
0x145ab51c9: shl rcx, 1
0x145ab51cc: test rcx, rcx
0x145ab51cf: jne 0x145ab51f5
0x145ab51d1: xor ecx, ecx
0x145ab51d3: xchg byte ptr [rdi + 0x10], cl
0x145ab51d6: cmp cl, 2
0x145ab51d9: je 0x145ab51e3
0x145ab51db: add rsp, 0x40
0x145ab51df: pop rdi
0x145ab51e0: pop rsi
0x145ab51e1: pop rbp
0x145ab51e2: ret
0x145ab51e3: add rdi, 0x10
0x145ab51e7: mov rcx, rdi
0x145ab51ea: mov esi, eax
0x145ab51ec: call 0x14613cb20
0x145ab51f1: mov eax, esi
0x145ab51f3: jmp 0x145ab51db
0x145ab51f5: mov esi, eax
0x145ab51f7: call 0x14613d7f0
0x145ab51fc: mov ecx, eax
0x145ab51fe: mov eax, esi
0x145ab5200: test cl, cl
0x145ab5202: jne 0x145ab51d1
0x145ab5204: mov byte ptr [rdi + 0x11], 1
0x145ab5208: jmp 0x145ab51d1
