0x145825ff0: push rbp
0x145825ff1: push rsi
0x145825ff2: push rdi
0x145825ff3: push rbx
0x145825ff4: sub rsp, 0x68
0x145825ff8: lea rbp, [rsp + 0x60]
0x145825ffd: mov qword ptr [rbp], 0xfffffffffffffffe
0x145826005: cmp byte ptr [rcx + 8], 0
0x145826009: mov byte ptr [rcx + 8], 0
0x14582600d: je 0x1458260f2
0x145826013: mov rbx, qword ptr [rcx]
0x145826016: mov cl, 1
0x145826018: xor eax, eax
0x14582601a: lock cmpxchg byte ptr [rbx + 0x10], cl
0x14582601f: jne 0x1458260fb
0x145826025: mov rdi, qword ptr [rip + 0x29eea0c]
0x14582602c: mov rax, qword ptr [rdi]
0x14582602f: shl rax, 1
0x145826032: test rax, rax
0x145826035: jne 0x145826109
0x14582603b: mov dword ptr [rbp - 4], 0
0x145826042: movzx eax, byte ptr [rbx + 0x11]
0x145826046: mov rsi, qword ptr [rbx + 0xa8]
0x14582604d: mov qword ptr [rbp - 0x20], rbx
0x145826051: mov rbx, qword ptr [rbx + 0xb0]
0x145826058: lea rdx, [rip + 0x14a4af9]
0x14582605f: lea rcx, [rbp - 0x38]
0x145826063: call 0x145b7a740
0x145826068: nop
0x145826069: lea rdx, [rbp - 0x38]
0x14582606d: mov rcx, rsi
0x145826070: call qword ptr [rbx + 0x18]
0x145826073: nop
0x145826074: mov rsi, qword ptr [rbp - 0x20]
0x145826078: mov rcx, qword ptr [rsi + 0x88]
0x14582607f: mov rdx, qword ptr [rsi + 0x90]
0x145826086: mov eax, dword ptr [rsi + 0xa0]
0x14582608c: mov dword ptr [rsi + 0xa0], 0xffffffff
0x145826096: cmp eax, -1
0x145826099: je 0x1458260d8
0x14582609b: mov qword ptr [rbp - 0x18], rcx
0x14582609f: mov qword ptr [rbp - 0x10], rdx
0x1458260a3: call qword ptr [rdx + 0x30]
0x1458260a6: nop
0x1458260a7: mov rax, qword ptr [rbp - 0x10]
0x1458260ab: mov rax, qword ptr [rax]
0x1458260ae: test rax, rax
0x1458260b1: je 0x1458260ba
0x1458260b3: mov rcx, qword ptr [rbp - 0x18]
0x1458260b7: call rax
0x1458260b9: nop
0x1458260ba: mov rax, qword ptr [rbp - 0x10]
0x1458260be: mov rdx, qword ptr [rax + 8]
0x1458260c2: test rdx, rdx
0x1458260c5: mov rsi, qword ptr [rbp - 0x20]
0x1458260c9: mov rcx, qword ptr [rbp - 0x18]
0x1458260cd: je 0x1458260d8
0x1458260cf: mov r8, qword ptr [rax + 0x10]
0x1458260d3: call 0x1400021d0
0x1458260d8: cmp byte ptr [rbp - 4], 0
0x1458260dc: jne 0x1458260e9
0x1458260de: mov rax, qword ptr [rdi]
0x1458260e1: shl rax, 1
0x1458260e4: test rax, rax
0x1458260e7: jne 0x145826126
0x1458260e9: xor eax, eax
0x1458260eb: xchg byte ptr [rsi + 0x10], al
0x1458260ee: cmp al, 2
0x1458260f0: je 0x145826118
0x1458260f2: add rsp, 0x68
0x1458260f6: pop rbx
0x1458260f7: pop rdi
0x1458260f8: pop rsi
0x1458260f9: pop rbp
0x1458260fa: ret
0x1458260fb: lea rcx, [rbx + 0x10]
0x1458260ff: call 0x145eb5670
0x145826104: jmp 0x145826025
0x145826109: call 0x145eb6400
0x14582610e: xor al, 1
0x145826110: mov dword ptr [rbp - 4], eax
0x145826113: jmp 0x145826042
0x145826118: add rsi, 0x10
0x14582611c: mov rcx, rsi
0x14582611f: call 0x145eb5730
0x145826124: jmp 0x1458260f2
0x145826126: call 0x145eb6400
0x14582612b: test al, al
0x14582612d: jne 0x1458260e9
0x14582612f: mov byte ptr [rsi + 0x11], 1
0x145826133: jmp 0x1458260e9
