0x14586d120: push rbp
0x14586d121: push r14
0x14586d123: push rsi
0x14586d124: push rdi
0x14586d125: push rbx
0x14586d126: sub rsp, 0x40
0x14586d12a: lea rbp, [rsp + 0x40]
0x14586d12f: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x14586d137: mov r14, r8
0x14586d13a: test r8, r8
0x14586d13d: jns 0x14586d14e
0x14586d13f: xor edi, edi
0x14586d141: mov rcx, rdi
0x14586d144: mov rdx, r14
0x14586d147: call 0x145eb6fcb
0x14586d14c: ud2
0x14586d14e: mov qword ptr [rbp - 0x18], r14
0x14586d152: je 0x14586d18d
0x14586d154: mov rsi, rdx
0x14586d157: mov rbx, rcx
0x14586d15a: call 0x140002200
0x14586d15f: mov edi, 1
0x14586d164: mov edx, 1
0x14586d169: mov rcx, r14
0x14586d16c: call 0x1400021c0
0x14586d171: test rax, rax
0x14586d174: je 0x14586d141
0x14586d176: mov qword ptr [rbp - 0x10], rax
0x14586d17a: mov rcx, rax
0x14586d17d: mov rdx, rsi
0x14586d180: mov r8, r14
0x14586d183: call 0x145d145fb
0x14586d188: mov rcx, rbx
0x14586d18b: jmp 0x14586d196
0x14586d18d: mov eax, 1
0x14586d192: mov qword ptr [rbp - 0x10], rax
0x14586d196: mov rbx, qword ptr [rcx + 0x10]
0x14586d19a: lea rsi, [rbx + 0x10]
0x14586d19e: mov cl, 1
0x14586d1a0: xor eax, eax
0x14586d1a2: lock cmpxchg byte ptr [rbx + 0x10], cl
0x14586d1a7: jne 0x14586d216
0x14586d1a9: mov r14, qword ptr [rip + 0x29a7888]
0x14586d1b0: mov rax, qword ptr [r14]
0x14586d1b3: shl rax, 1
0x14586d1b6: test rax, rax
0x14586d1b9: jne 0x14586d221
0x14586d1bb: xor edi, edi
0x14586d1bd: movzx eax, byte ptr [rbx + 0x11]
0x14586d1c1: mov rdx, qword ptr [rbx + 0x50]
0x14586d1c5: cmp rdx, -1
0x14586d1c9: je 0x14586d1df
0x14586d1cb: test rdx, rdx
0x14586d1ce: je 0x14586d1df
0x14586d1d0: mov rcx, qword ptr [rbx + 0x58]
0x14586d1d4: mov r8d, 1
0x14586d1da: call 0x1400021d0
0x14586d1df: mov rax, qword ptr [rbp - 0x18]
0x14586d1e3: mov qword ptr [rbx + 0x50], rax
0x14586d1e7: mov rcx, qword ptr [rbp - 0x10]
0x14586d1eb: mov qword ptr [rbx + 0x58], rcx
0x14586d1ef: mov qword ptr [rbx + 0x60], rax
0x14586d1f3: test dil, dil
0x14586d1f6: jne 0x14586d203
0x14586d1f8: mov rax, qword ptr [r14]
0x14586d1fb: shl rax, 1
0x14586d1fe: test rax, rax
0x14586d201: jne 0x14586d24f
0x14586d203: xor eax, eax
0x14586d205: xchg byte ptr [rsi], al
0x14586d207: cmp al, 2
0x14586d209: je 0x14586d23d
0x14586d20b: add rsp, 0x40
0x14586d20f: pop rbx
0x14586d210: pop rdi
0x14586d211: pop rsi
0x14586d212: pop r14
0x14586d214: pop rbp
0x14586d215: ret
0x14586d216: mov rcx, rsi
0x14586d219: call 0x145eb5670
0x14586d21e: nop
0x14586d21f: jmp 0x14586d1a9
0x14586d221: call 0x145eb6400
0x14586d226: nop
0x14586d227: mov edi, eax
0x14586d229: xor dil, 1
0x14586d22d: movzx eax, byte ptr [rbx + 0x11]
0x14586d231: mov rdx, qword ptr [rbx + 0x50]
0x14586d235: cmp rdx, -1
0x14586d239: jne 0x14586d1cb
0x14586d23b: jmp 0x14586d1df
0x14586d23d: mov rcx, rsi
0x14586d240: add rsp, 0x40
0x14586d244: pop rbx
0x14586d245: pop rdi
0x14586d246: pop rsi
0x14586d247: pop r14
0x14586d249: pop rbp
0x14586d24a: jmp 0x145eb5730
0x14586d24f: call 0x145eb6400
0x14586d254: test al, al
0x14586d256: jne 0x14586d203
0x14586d258: mov byte ptr [rbx + 0x11], 1
0x14586d25c: jmp 0x14586d203
