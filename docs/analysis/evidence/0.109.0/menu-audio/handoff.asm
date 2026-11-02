;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x14097bb30..0x14097bcd6 SHA256 b321ce48635a2a38e6ba24e890c57e5d742fafa689697efffd0bdb2a3cf54fd2
0x14097bb30: push rsi
0x14097bb31: push rdi
0x14097bb32: push rbx
0x14097bb33: sub rsp, 0x70
0x14097bb37: mov rcx, qword ptr [rsp + 0xb0]
0x14097bb3f: mov rdx, qword ptr [rdx]
0x14097bb42: mov rax, qword ptr [r8]
0x14097bb45: mov rsi, qword ptr [r9]
0x14097bb48: mov rdi, qword ptr [r9 + 0x10]
0x14097bb4c: mov ebx, dword ptr [r9 + 0x1c]
0x14097bb50: movzx edx, byte ptr [rdx + 0x17]
0x14097bb54: movzx r8d, byte ptr [rcx]
0x14097bb58: mov byte ptr [rcx], dl
0x14097bb5a: not r8b
0x14097bb5d: or r8b, dl
0x14097bb60: test r8b, 1
0x14097bb64: jne 0x14097bca0
0x14097bb6a: cmp byte ptr [rax], 2
0x14097bb6d: jne 0x14097bca0
0x14097bb73: mov dword ptr [rdi], ebx
0x14097bb75: cmp qword ptr [rsi + 0x68], 0
0x14097bb7a: je 0x14097bca0
0x14097bb80: mov rax, qword ptr [rip + 0x7701421]
0x14097bb87: mov rax, qword ptr [rax]
0x14097bb8a: cmp rax, 2
0x14097bb8e: ja 0x14097bc3e
0x14097bb94: movzx edx, byte ptr [rip + 0x76c9695]
0x14097bb9b: movzx eax, dl
0x14097bb9e: lea ecx, [rax - 1]
0x14097bba1: cmp ecx, 2
0x14097bba4: jae 0x14097bc3a
0x14097bbaa: mov rcx, qword ptr [rip + 0x76c966f]
0x14097bbb1: call 0x144c5d8d0
0x14097bbb6: test al, al
0x14097bbb8: je 0x14097bc3e
0x14097bbbe: mov rcx, qword ptr [rip + 0x76c965b]
0x14097bbc5: lea rax, [rcx + 0x30]
0x14097bbc9: lea rdx, [rip + 0x555c3d0]
0x14097bbd0: mov qword ptr [rsp + 0x40], rdx
0x14097bbd5: lea rdx, [rip + 0x5263bf4]
0x14097bbdc: mov qword ptr [rsp + 0x48], rdx
0x14097bbe1: lea rdx, [rip + 0x555c3c0]
0x14097bbe8: mov qword ptr [rsp + 0x30], rdx
0x14097bbed: lea rdx, [rsp + 0x40]
0x14097bbf2: mov qword ptr [rsp + 0x38], rdx
0x14097bbf7: lea rdx, [rsp + 0x30]
0x14097bbfc: mov qword ptr [rsp + 0x20], rdx
0x14097bc01: lea rdx, [rip + 0x5557d98]
0x14097bc08: mov qword ptr [rsp + 0x28], rdx
0x14097bc0d: mov qword ptr [rsp + 0x50], 1
0x14097bc16: lea rdx, [rsp + 0x20]
0x14097bc1b: mov qword ptr [rsp + 0x58], rdx
0x14097bc20: mov qword ptr [rsp + 0x60], 1
0x14097bc29: mov qword ptr [rsp + 0x68], rax
0x14097bc2e: lea rdx, [rsp + 0x50]
0x14097bc33: call 0x144c5f0f0
0x14097bc38: jmp 0x14097bc3e
0x14097bc3a: test eax, eax
0x14097bc3c: jne 0x14097bca8
0x14097bc3e: movzx ecx, byte ptr [rsi + 0xd8]
0x14097bc45: cmp rcx, 3
0x14097bc49: jae 0x14097bcc3
0x14097bc4b: mov rax, qword ptr [rsi + 0xd0]
0x14097bc52: mov edx, ecx
0x14097bc54: shl edx, 7
0x14097bc57: mov qword ptr [rax + rdx + 0x80], 0
0x14097bc63: mov dword ptr [rax + rdx + 0xa8], 0
0x14097bc6e: mov qword ptr [rax + rdx + 0xb8], 3
0x14097bc7a: mov dword ptr [rax + rdx + 0xc0], 0
0x14097bc85: or cl, 4
0x14097bc88: xchg byte ptr [rax + 0x200], cl
0x14097bc8e: and cl, 3
0x14097bc91: mov byte ptr [rsi + 0xd8], cl
0x14097bc97: mov dword ptr [rdi], ebx
0x14097bc99: mov byte ptr [rsi + 0x1f8], 1
0x14097bca0: add rsp, 0x70
0x14097bca4: pop rbx
0x14097bca5: pop rdi
0x14097bca6: pop rsi
0x14097bca7: ret
0x14097bca8: lea rcx, [rip + 0x76c9571]
0x14097bcaf: call 0x145d45220
0x14097bcb4: mov edx, eax
0x14097bcb6: test al, al
0x14097bcb8: jne 0x14097bbaa
0x14097bcbe: jmp 0x14097bc3e
0x14097bcc3: lea r8, [rip + 0x555a946]
0x14097bcca: mov edx, 3
0x14097bccf: call 0x145d99653
0x14097bcd4: ud2
