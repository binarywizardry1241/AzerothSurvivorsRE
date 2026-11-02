0x14021c940: push rsi
0x14021c941: sub rsp, 0x110
0x14021c948: mov rax, qword ptr [rdx]
0x14021c94b: cmp byte ptr [rax + 0x12c], 1
0x14021c952: jne 0x14021c9cc
0x14021c954: mov r10, qword ptr [rdx + 0x10]
0x14021c958: mov edx, dword ptr [rdx + 0x1c]
0x14021c95b: mov rcx, qword ptr [r8]
0x14021c95e: mov r8, qword ptr [r9]
0x14021c961: cmp qword ptr [rax + 0x40], 0
0x14021c966: je 0x14021c9de
0x14021c968: mov r9, qword ptr [rax + 8]
0x14021c96c: mov r11, qword ptr [rax + 0x10]
0x14021c970: cmp r11, 4
0x14021c974: je 0x14021c9d5
0x14021c976: cmp r11, 6
0x14021c97a: je 0x14021c9b2
0x14021c97c: cmp r11, 7
0x14021c980: jne 0x14021c9de
0x14021c982: mov r11d, 0x74736f68
0x14021c988: xor r11d, dword ptr [r9]
0x14021c98b: mov esi, 0x676e6974
0x14021c990: xor esi, dword ptr [r9 + 3]
0x14021c994: or esi, r11d
0x14021c997: je 0x14021c9cc
0x14021c999: mov r11d, 0x6e696f6a
0x14021c99f: xor r11d, dword ptr [r9]
0x14021c9a2: mov esi, 0x676e696e
0x14021c9a7: xor esi, dword ptr [r9 + 3]
0x14021c9ab: or esi, r11d
0x14021c9ae: jne 0x14021c9de
0x14021c9b0: jmp 0x14021c9cc
0x14021c9b2: mov r11d, 0x6e696f6a
0x14021c9b8: xor r11d, dword ptr [r9]
0x14021c9bb: movzx r9d, word ptr [r9 + 4]
0x14021c9c0: xor r9d, 0x6465
0x14021c9c7: or r9d, r11d
0x14021c9ca: jne 0x14021c9de
0x14021c9cc: add rsp, 0x110
0x14021c9d3: pop rsi
0x14021c9d4: ret
0x14021c9d5: cmp dword ptr [r9], 0x7466656c
0x14021c9dc: je 0x14021c9cc
0x14021c9de: cmp byte ptr [rax + 0x131], 0
0x14021c9e5: jne 0x14021c9cc
0x14021c9e7: movss xmm0, dword ptr [r8 + 0x5c]
0x14021c9ed: movss xmm1, dword ptr [rax + 0x128]
0x14021c9f5: xorps xmm2, xmm2
0x14021c9f8: ucomiss xmm1, xmm2
0x14021c9fb: jne 0x14021c9ff
0x14021c9fd: jnp 0x14021ca0f
0x14021c9ff: movaps xmm2, xmm0
0x14021ca02: subss xmm2, xmm1
0x14021ca06: ucomiss xmm2, dword ptr [rip + 0x5cc37f3]
0x14021ca0d: jb 0x14021c9cc
0x14021ca0f: maxss xmm0, dword ptr [rip + 0x5cc8e01]
0x14021ca17: mov dword ptr [r10], edx
0x14021ca1a: movss dword ptr [rax + 0x128], xmm0
0x14021ca22: mov dword ptr [rsp + 0x28], 0x14
0x14021ca2a: lea rdx, [rsp + 0x28]
0x14021ca2f: call 0x14012c6a0
0x14021ca34: nop
0x14021ca35: add rsp, 0x110
0x14021ca3c: pop rsi
0x14021ca3d: ret
