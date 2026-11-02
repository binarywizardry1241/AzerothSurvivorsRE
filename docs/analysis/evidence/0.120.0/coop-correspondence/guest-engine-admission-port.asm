0x145b26d00: mov rax, qword ptr [rbp + 0x438]
0x145b26d07: mov rdi, qword ptr [rax + 8]
0x145b26d0b: mov rbx, qword ptr [rax + 0x10]
0x145b26d0f: cmp dword ptr [rsi + 0xca0], 1
0x145b26d16: ja 0x145b26d7c
0x145b26d18: test byte ptr [rsi + 0xfd1], 1
0x145b26d1f: je 0x145b26d7c
0x145b26d21: mov rax, qword ptr [rbp + 0x438]
0x145b26d28: movzx r14d, word ptr [rax + 0x20]
0x145b26d2d: mov r12, qword ptr [rax + 0x18]
0x145b26d31: mov ecx, r14d
0x145b26d34: mov rdx, r12
0x145b26d37: call 0x145aa7e60
0x145b26d3c: test al, al
0x145b26d3e: je 0x145b26d7c
0x145b26d40: mov rcx, qword ptr [rsi + 0x1018]
0x145b26d47: test rcx, rcx
0x145b26d4a: je 0x145b26d7c
0x145b26d4c: mov rax, qword ptr [rsi + 0x1010]
0x145b26d53: imul rcx, rcx, 0xb0
0x145b26d5a: xor r15d, r15d
0x145b26d5d: xor edx, edx
0x145b26d5f: cmp byte ptr [rax + rdx + 0xa8], 0
0x145b26d67: jne 0x145b27488
0x145b26d6d: inc r15
0x145b26d70: add rdx, 0xb0
0x145b26d77: cmp rcx, rdx
0x145b26d7a: jne 0x145b26d5f
