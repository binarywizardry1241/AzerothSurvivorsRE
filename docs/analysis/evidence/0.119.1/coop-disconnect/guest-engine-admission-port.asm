0x145b1f470: mov rax, qword ptr [rbp + 0x438]
0x145b1f477: mov rdi, qword ptr [rax + 8]
0x145b1f47b: mov rbx, qword ptr [rax + 0x10]
0x145b1f47f: cmp dword ptr [rsi + 0xca0], 1
0x145b1f486: ja 0x145b1f4ec
0x145b1f488: test byte ptr [rsi + 0xfd1], 1
0x145b1f48f: je 0x145b1f4ec
0x145b1f491: mov rax, qword ptr [rbp + 0x438]
0x145b1f498: movzx r14d, word ptr [rax + 0x20]
0x145b1f49d: mov r12, qword ptr [rax + 0x18]
0x145b1f4a1: mov ecx, r14d
0x145b1f4a4: mov rdx, r12
0x145b1f4a7: call 0x145ae3800
0x145b1f4ac: test al, al
0x145b1f4ae: je 0x145b1f4ec
0x145b1f4b0: mov rcx, qword ptr [rsi + 0x1018]
0x145b1f4b7: test rcx, rcx
0x145b1f4ba: je 0x145b1f4ec
0x145b1f4bc: mov rax, qword ptr [rsi + 0x1010]
0x145b1f4c3: imul rcx, rcx, 0xb0
0x145b1f4ca: xor r15d, r15d
0x145b1f4cd: xor edx, edx
0x145b1f4cf: cmp byte ptr [rax + rdx + 0xa8], 0
0x145b1f4d7: jne 0x145b1fbf8
0x145b1f4dd: inc r15
0x145b1f4e0: add rdx, 0xb0
0x145b1f4e7: cmp rcx, rdx
0x145b1f4ea: jne 0x145b1f4cf
