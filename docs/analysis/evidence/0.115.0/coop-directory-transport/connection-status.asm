0x14586da60: mov rax, qword ptr [rcx + 0x20]
0x14586da64: movzx eax, byte ptr [rax + 0x10]
0x14586da68: cmp al, 1
0x14586da6a: sete cl
0x14586da6d: mov dl, 2
0x14586da6f: sub dl, cl
0x14586da71: xor ecx, ecx
0x14586da73: test al, al
0x14586da75: movzx eax, dl
0x14586da78: cmove eax, ecx
0x14586da7b: ret
