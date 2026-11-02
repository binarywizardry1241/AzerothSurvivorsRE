0x1458261e0: push rbp
0x1458261e1: push rsi
0x1458261e2: push rdi
0x1458261e3: push rbx
0x1458261e4: sub rsp, 0x38
0x1458261e8: lea rbp, [rsp + 0x30]
0x1458261ed: mov qword ptr [rbp], 0xfffffffffffffffe
0x1458261f5: mov rbx, qword ptr [rcx]
0x1458261f8: mov dl, 1
0x1458261fa: xor eax, eax
0x1458261fc: lock cmpxchg byte ptr [rbx + 0x10], dl
0x145826201: jne 0x1458262aa
0x145826207: mov rsi, qword ptr [rip + 0x29ee82a]
0x14582620e: mov rax, qword ptr [rsi]
0x145826211: shl rax, 1
0x145826214: test rax, rax
0x145826217: jne 0x1458262c1
0x14582621d: xor edx, edx
0x14582621f: movzx eax, byte ptr [rbx + 0x11]
0x145826223: cmp byte ptr [rcx + 8], 1
0x145826227: jne 0x1458262df
0x14582622d: mov dword ptr [rbp - 4], edx
0x145826230: mov rcx, qword ptr [rbx + 0xa8]
0x145826237: mov qword ptr [rbp - 0x10], rbx
0x14582623b: mov rax, qword ptr [rbx + 0xb0]
0x145826242: call qword ptr [rax + 0x28]
0x145826245: nop
0x145826246: cmp al, 2
0x145826248: jne 0x145826258
0x14582624a: xor eax, eax
0x14582624c: mov rbx, qword ptr [rbp - 0x10]
0x145826250: mov edx, dword ptr [rbp - 4]
0x145826253: jmp 0x1458262e1
0x145826258: xor eax, eax
0x14582625a: mov rdx, qword ptr [rbp - 0x10]
0x14582625e: cmp dword ptr [rdx + 0xa0], -1
0x145826265: sete al
0x145826268: shl eax, 5
0x14582626b: mov rcx, qword ptr [rdx + rax + 0x88]
0x145826273: mov rax, qword ptr [rdx + rax + 0x90]
0x14582627b: call qword ptr [rax + 0x28]
0x14582627e: nop
0x14582627f: cmp al, 2
0x145826281: mov rbx, qword ptr [rbp - 0x10]
0x145826285: jne 0x14582628e
0x145826287: cmp qword ptr [rbx + 0x70], 0
0x14582628c: je 0x1458262a6
0x14582628e: mov al, 1
0x145826290: cmp byte ptr [rbx + 0xf0], 0
0x145826297: mov edx, dword ptr [rbp - 4]
0x14582629a: jne 0x1458262e1
0x14582629c: cmp qword ptr [rbx + 0x70], 0
0x1458262a1: setne al
0x1458262a4: jmp 0x1458262e1
0x1458262a6: xor eax, eax
0x1458262a8: jmp 0x145826250
0x1458262aa: lea rax, [rbx + 0x10]
0x1458262ae: mov rsi, rcx
0x1458262b1: mov rcx, rax
0x1458262b4: call 0x145eb5670
0x1458262b9: mov rcx, rsi
0x1458262bc: jmp 0x145826207
0x1458262c1: mov rdi, rcx
0x1458262c4: call 0x145eb6400
0x1458262c9: mov rcx, rdi
0x1458262cc: mov edx, eax
0x1458262ce: xor dl, 1
0x1458262d1: movzx eax, byte ptr [rbx + 0x11]
0x1458262d5: cmp byte ptr [rcx + 8], 1
0x1458262d9: je 0x14582622d
0x1458262df: xor eax, eax
0x1458262e1: test dl, dl
0x1458262e3: jne 0x1458262f0
0x1458262e5: mov rcx, qword ptr [rsi]
0x1458262e8: shl rcx, 1
0x1458262eb: test rcx, rcx
0x1458262ee: jne 0x145826315
0x1458262f0: xor ecx, ecx
0x1458262f2: xchg byte ptr [rbx + 0x10], cl
0x1458262f5: cmp cl, 2
0x1458262f8: je 0x145826303
0x1458262fa: add rsp, 0x38
0x1458262fe: pop rbx
0x1458262ff: pop rdi
0x145826300: pop rsi
0x145826301: pop rbp
0x145826302: ret
0x145826303: add rbx, 0x10
0x145826307: mov rcx, rbx
0x14582630a: mov esi, eax
0x14582630c: call 0x145eb5730
0x145826311: mov eax, esi
0x145826313: jmp 0x1458262fa
0x145826315: mov esi, eax
0x145826317: call 0x145eb6400
0x14582631c: mov ecx, eax
0x14582631e: mov eax, esi
0x145826320: test cl, cl
0x145826322: jne 0x1458262f0
0x145826324: mov byte ptr [rbx + 0x11], 1
0x145826328: jmp 0x1458262f0
