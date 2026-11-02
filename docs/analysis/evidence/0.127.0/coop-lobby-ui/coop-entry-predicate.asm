0x1402af0d0: cmp qword ptr [rcx + 0x50], 4
0x1402af0d5: jne 0x1402af0e3
0x1402af0d7: mov rax, qword ptr [rcx + 0x48]
0x1402af0db: cmp dword ptr [rax], 0x74736f68
0x1402af0e1: je 0x1402af0e6
0x1402af0e3: xor eax, eax
0x1402af0e5: ret 
0x1402af0e6: mov rax, qword ptr [rcx + 0x18]
0x1402af0ea: mov rdx, qword ptr [rcx + 0x20]
0x1402af0ee: cmp rdx, 4
0x1402af0f2: je 0x1402af144
0x1402af0f4: cmp rdx, 6
0x1402af0f8: je 0x1402af12e
0x1402af0fa: cmp rdx, 7
0x1402af0fe: jne 0x1402af0e3
0x1402af100: mov edx, 0x74736f68
0x1402af105: xor edx, dword ptr [rax]
0x1402af107: mov r8d, 0x676e6974
0x1402af10d: xor r8d, dword ptr [rax + 3]
0x1402af111: or r8d, edx
0x1402af114: je 0x1402af14c
0x1402af116: mov edx, 0x6e696f6a
0x1402af11b: xor edx, dword ptr [rax]
0x1402af11d: mov r8d, 0x676e696e
0x1402af123: xor r8d, dword ptr [rax + 3]
0x1402af127: or r8d, edx
0x1402af12a: jne 0x1402af0e3
0x1402af12c: jmp 0x1402af14c
0x1402af12e: mov edx, 0x6e696f6a
0x1402af133: xor edx, dword ptr [rax]
0x1402af135: movzx eax, word ptr [rax + 4]
0x1402af139: xor eax, 0x6465
0x1402af13e: or eax, edx
0x1402af140: jne 0x1402af0e3
0x1402af142: jmp 0x1402af14c
0x1402af144: cmp dword ptr [rax], 0x7466656c
0x1402af14a: jne 0x1402af0e3
0x1402af14c: cmp qword ptr [rcx + 0x98], 2
0x1402af154: setb al
0x1402af157: ret 
