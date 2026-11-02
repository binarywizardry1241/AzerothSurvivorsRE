0x145818e00: mov eax, dword ptr [rcx]
0x145818e02: sub eax, 2
0x145818e05: mov edx, 0xb
0x145818e0a: cmovae edx, eax
0x145818e0d: mov al, 0xff
0x145818e0f: cmp edx, 0x1a
0x145818e12: ja 0x145818e78
0x145818e14: lea r8, [rip + 0x14b2251]
0x145818e1b: movsxd r9, dword ptr [r8 + rdx*4]
0x145818e1f: add r9, r8
0x145818e22: jmp r9
0x145818e25: mov rax, qword ptr [rcx + 8]
0x145818e29: cmp rax, 0xff
0x145818e2f: mov edx, 0xff
0x145818e34: cmovb rdx, rax
0x145818e38: xor eax, eax
0x145818e3a: ret
0x145818e3b: mov rax, qword ptr [rcx + 8]
0x145818e3f: cmp rax, 0xff
0x145818e45: mov edx, 0xff
0x145818e4a: cmovb rdx, rax
0x145818e4e: mov al, 2
0x145818e50: ret
0x145818e51: mov al, 5
0x145818e53: jmp 0x145818e78
0x145818e55: mov al, 1
0x145818e57: jmp 0x145818e78
0x145818e59: movzx edx, byte ptr [rcx + 4]
0x145818e5d: mov al, 7
0x145818e5f: ret
0x145818e60: movzx edx, byte ptr [rcx + 4]
0x145818e64: mov al, 8
0x145818e66: ret
0x145818e67: mov al, 3
0x145818e69: jmp 0x145818e78
0x145818e6b: mov al, 4
0x145818e6d: jmp 0x145818e78
0x145818e6f: movzx edx, byte ptr [rcx + 4]
0x145818e73: mov al, 9
0x145818e75: ret
0x145818e76: mov al, 6
0x145818e78: ret
