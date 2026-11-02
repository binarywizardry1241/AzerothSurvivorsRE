;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x14590e190..0x14590e3bf SHA256 7d84a48a8ddedf9d12143eed51b74c2da24bddfffa06e95ad916312aed0a9bb1
0x14590e190: push rsi
0x14590e191: sub rsp, 0x80
0x14590e198: mov qword ptr [rsp + 0x38], 0
0x14590e1a1: mov qword ptr [rsp + 0x40], rdx
0x14590e1a6: mov qword ptr [rsp + 0x48], rcx
0x14590e1ab: mov qword ptr [rsp + 0x50], rdx
0x14590e1b0: mov qword ptr [rsp + 0x58], 0
0x14590e1b9: mov qword ptr [rsp + 0x60], rdx
0x14590e1be: movabs rax, 0x2c0000002c
0x14590e1c8: mov qword ptr [rsp + 0x68], rax
0x14590e1cd: mov byte ptr [rsp + 0x70], 1
0x14590e1d2: mov word ptr [rsp + 0x78], 1
0x14590e1d9: lea rcx, [rsp + 0x20]
0x14590e1de: lea rdx, [rsp + 0x38]
0x14590e1e3: call 0x1459c3dd0
0x14590e1e8: cmp qword ptr [rsp + 0x30], 4
0x14590e1ee: jne 0x14590e212
0x14590e1f0: mov rdx, qword ptr [rsp + 0x20]
0x14590e1f5: mov rcx, qword ptr [rsp + 0x28]
0x14590e1fa: mov rsi, qword ptr [rcx]
0x14590e1fd: test rdx, rdx
0x14590e200: je 0x14590e242
0x14590e202: add rdx, rdx
0x14590e205: mov r8d, 2
0x14590e20b: call 0x1400021d0
0x14590e210: jmp 0x14590e242
0x14590e212: mov rdx, qword ptr [rsp + 0x20]
0x14590e217: mov rsi, qword ptr [rsp + 0x28]
0x14590e21c: cmp rdx, -1
0x14590e220: je 0x14590e242
0x14590e222: test rdx, rdx
0x14590e225: je 0x14590e238
0x14590e227: add rdx, rdx
0x14590e22a: mov r8d, 2
0x14590e230: mov rcx, rsi
0x14590e233: call 0x1400021d0
0x14590e238: movabs rsi, 0x64006400640064
0x14590e242: mov rcx, rsi
0x14590e245: shr rcx, 0x30
0x14590e249: mov rdx, rsi
0x14590e24c: shr rdx, 0x20
0x14590e250: mov r8d, esi
0x14590e253: shr r8d, 0x10
0x14590e257: movd xmm0, r8d
0x14590e25c: pinsrw xmm0, edx, 1
0x14590e261: pxor xmm0, xmmword ptr [rip + 0x5951a7]
0x14590e269: movdqa xmm1, xmmword ptr [rip + 0x18fd52f]
0x14590e271: pcmpgtw xmm1, xmm0
0x14590e275: xor eax, eax
0x14590e277: cmp si, 0x64
0x14590e27b: setb al
0x14590e27e: mov r9, rsi
0x14590e281: shr r9, 0x32
0x14590e285: movd xmm2, ecx
0x14590e289: pinsrw xmm2, edx, 1
0x14590e28e: pinsrw xmm2, r8d, 2
0x14590e294: pinsrw xmm2, esi, 3
0x14590e299: xor ecx, ecx
0x14590e29b: movdqa xmm0, xmm2
0x14590e29f: psubusw xmm0, xmmword ptr [rip + 0x18fd509]
0x14590e2a7: cmp r9d, 0x19
0x14590e2ab: psubw xmm2, xmm0
0x14590e2af: paddw xmm2, xmmword ptr [rip + 0x18fd509]
0x14590e2b7: setb cl
0x14590e2ba: pextrw edx, xmm1, 1
0x14590e2bf: movd xmm0, ecx
0x14590e2c3: pinsrw xmm0, edx, 1
0x14590e2c8: pextrw ecx, xmm1, 0
0x14590e2cd: pinsrw xmm0, ecx, 2
0x14590e2d2: pinsrw xmm0, eax, 3
0x14590e2d7: psllw xmm0, 0xf
0x14590e2dc: psraw xmm0, 0xf
0x14590e2e1: pandn xmm0, xmm2
0x14590e2e5: pextrw eax, xmm0, 1
0x14590e2ea: imul ecx, eax, 0xcccd
0x14590e2f0: shr ecx, 0x12
0x14590e2f3: and ecx, 0xfffffffe
0x14590e2f6: lea ecx, [rcx + rcx*4]
0x14590e2f9: sub eax, ecx
0x14590e2fb: movd ecx, xmm0
0x14590e2ff: movzx edx, cx
0x14590e302: imul edx, edx, 0xcccd
0x14590e308: shr edx, 0x12
0x14590e30b: lea edx, [rdx + rdx*4]
0x14590e30e: sub ecx, edx
0x14590e310: movd xmm1, ecx
0x14590e314: pinsrw xmm1, eax, 1
0x14590e319: pextrw eax, xmm0, 2
0x14590e31e: imul ecx, eax, 0x47af
0x14590e324: shr ecx, 0x10
0x14590e327: mov edx, eax
0x14590e329: sub edx, ecx
0x14590e32b: movzx edx, dx
0x14590e32e: shr edx, 1
0x14590e330: add edx, ecx
0x14590e332: shr edx, 4
0x14590e335: lea ecx, [rdx + rdx*4]
0x14590e338: lea ecx, [rcx + rcx*4]
0x14590e33b: sub eax, ecx
0x14590e33d: pinsrw xmm1, eax, 2
0x14590e342: pextrw eax, xmm0, 3
0x14590e347: imul ecx, eax, 0x47af
0x14590e34d: shr ecx, 0x10
0x14590e350: mov edx, eax
0x14590e352: sub edx, ecx
0x14590e354: movzx edx, dx
0x14590e357: shr edx, 1
0x14590e359: add edx, ecx
0x14590e35b: shr edx, 4
0x14590e35e: lea ecx, [rdx + rdx*4]
0x14590e361: lea ecx, [rcx + rcx*4]
0x14590e364: sub eax, ecx
0x14590e366: pinsrw xmm1, eax, 3
0x14590e36b: psubw xmm0, xmm1
0x14590e36f: paddw xmm0, xmmword ptr [rip + 0x18fd459]
0x14590e377: pxor xmm1, xmm1
0x14590e37b: movdqa xmm2, xmm0
0x14590e37f: punpcklwd xmm2, xmm1
0x14590e383: movdqa xmm3, xmm2
0x14590e387: punpckhdq xmm3, xmm1
0x14590e38b: punpckldq xmm1, xmm2
0x14590e38f: psllq xmm0, 0x30
0x14590e394: shufps xmm0, xmm1, 0xe4
0x14590e398: movdqa xmm1, xmm3
0x14590e39c: psllq xmm1, 0x10
0x14590e3a1: shufps xmm1, xmm3, 0xe4
0x14590e3a5: orps xmm1, xmm0
0x14590e3a8: pshufd xmm0, xmm1, 0xee
0x14590e3ad: por xmm0, xmm1
0x14590e3b1: movq rax, xmm0
0x14590e3b6: add rsp, 0x80
0x14590e3bd: pop rsi
0x14590e3be: ret
