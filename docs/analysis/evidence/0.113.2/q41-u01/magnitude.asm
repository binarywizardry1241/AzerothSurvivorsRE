145840d60: sub rsp, 0x28
145840d64: movzx eax, dl
145840d67: lea rdx, [rip + 0x17d428a]
145840d6e: movsxd r9, dword ptr [rdx + rax*4]
145840d72: add r9, rdx
145840d75: jmp r9
145840d78: cmp r8, 5
145840d7c: jae 0x145840f3f
145840d82: mov eax, dword ptr [rcx + rax*4 + 0x24]
145840d86: cvtsi2ss xmm1, rax
145840d8b: lea rax, [rip + 0x17cafa2]
145840d92: mulss xmm1, dword ptr [rip + 0x66176e]
145840d9a: movss xmm0, dword ptr [rax + r8*4]
145840da0: addss xmm1, dword ptr [rip + 0x6612dc]
145840da8: divss xmm0, xmm1
145840dac: add rsp, 0x28
145840db0: ret
145840db1: cmp r8, 5
145840db5: jae 0x145840f2d
145840dbb: lea rax, [rip + 0x17cb02e]
145840dc2: movss xmm0, dword ptr [rip + 0x661506]
145840dca: subss xmm0, dword ptr [rcx + 0x20]
145840dcf: divss xmm0, dword ptr [rip + 0x661749]
145840dd7: jmp 0x145840ebe
145840ddc: mov r9, qword ptr [rcx]
145840ddf: mov eax, 0xc
145840de4: cmp byte ptr [r9 + 0x75], 0xb
145840de9: jne 0x145840ef2
145840def: mov rdx, qword ptr [r9]
145840df2: mov rax, qword ptr [r9 + 8]
145840df6: cmp rax, 0xb
145840dfa: je 0x145840ed0
145840e00: cmp rax, 9
145840e04: jne 0x145840ef0
145840e0a: movabs r9, 0x7461665f6c616573
145840e14: xor r9, qword ptr [rdx]
145840e17: movzx r10d, byte ptr [rdx + 8]
145840e1c: xor r10, 0x65
145840e20: mov eax, 2
145840e25: or r10, r9
145840e28: je 0x145840ef2
145840e2e: movabs r9, 0x7269665f6c756f73
145840e38: xor r9, qword ptr [rdx]
145840e3b: movzx r10d, byte ptr [rdx + 8]
145840e40: xor r10, 0x65
145840e44: or r10, r9
145840e47: je 0x145840ef2
145840e4d: movabs r9, 0x6c6577746867696c
145840e57: xor r9, qword ptr [rdx]
145840e5a: movzx edx, byte ptr [rdx + 8]
145840e5e: xor rdx, 0x6c
145840e62: or rdx, r9
145840e65: jne 0x145840ef0
145840e6b: jmp 0x145840ef2
145840e70: cmp r8, 5
145840e74: jae 0x145840f36
145840e7a: lea rax, [rip + 0x17caf3f]
145840e81: movss xmm0, dword ptr [rip + 0x661697]
145840e89: subss xmm0, dword ptr [rcx + 0x1c]
145840e8e: mulss xmm0, dword ptr [rip + 0x66172e]
145840e96: jmp 0x145840ebe
145840e98: cmp r8, 5
145840e9c: jae 0x145840f48
145840ea2: lea rax, [rip + 0x17caeb7]
145840ea9: movss xmm0, dword ptr [rcx + 0x14]
145840eae: addss xmm0, dword ptr [rip + 0x17ca9ee]
145840eb6: divss xmm0, dword ptr [rip + 0x68e336]
145840ebe: xorps xmm1, xmm1
145840ec1: maxss xmm0, xmm1
145840ec5: mulss xmm0, dword ptr [rax + r8*4]
145840ecb: add rsp, 0x28
145840ecf: ret
145840ed0: movabs rax, 0x665f656972656166
145840eda: xor rax, qword ptr [rdx]
145840edd: movabs r9, 0x657269665f656972
145840ee7: xor r9, qword ptr [rdx + 3]
145840eeb: or r9, rax
145840eee: je 0x145840f19
145840ef0: xor eax, eax
145840ef2: cmp r8, 4
145840ef6: ja 0x145840f24
145840ef8: xor edx, edx
145840efa: sub eax, dword ptr [rcx + 0x18]
145840efd: lea rcx, [rip + 0x17cae8c]
145840f04: cmovb eax, edx
145840f07: mov ecx, dword ptr [rcx + r8*4]
145840f0b: cmp eax, ecx
145840f0d: cmovae eax, ecx
145840f10: cvtsi2ss xmm0, eax
145840f14: add rsp, 0x28
145840f18: ret
145840f19: mov eax, 2
145840f1e: cmp r8, 4
145840f22: jbe 0x145840ef8
145840f24: lea rax, [rip + 0x17cae7d]
145840f2b: jmp 0x145840f4f
145840f2d: lea rax, [rip + 0x17caed4]
145840f34: jmp 0x145840f4f
145840f36: lea rax, [rip + 0x17cae9b]
145840f3d: jmp 0x145840f4f
145840f3f: lea rax, [rip + 0x17cae02]
145840f46: jmp 0x145840f4f
145840f48: lea rax, [rip + 0x17cae29]
145840f4f: mov edx, 5
145840f54: mov rcx, r8
145840f57: mov r8, rax
145840f5a: call 0x145e9c123
145840f5f: ud2
