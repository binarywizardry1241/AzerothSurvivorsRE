;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x1401c0e30..0x1401c10a4 SHA256 6069a36a41cf54489a253cc28e4b2b50c2eb9fc346dd4fcf5bc09922022480f2
0x1401c0e30: push r14
0x1401c0e32: push rsi
0x1401c0e33: push rdi
0x1401c0e34: push rbx
0x1401c0e35: sub rsp, 0x328
0x1401c0e3c: mov qword ptr [rsp + 0x28], r9
0x1401c0e41: cmp r9, 3
0x1401c0e45: ja 0x1401c108e
0x1401c0e4b: mov rsi, rdx
0x1401c0e4e: mov rdi, rcx
0x1401c0e51: mov r14, qword ptr [rsp + 0x370]
0x1401c0e59: movzx eax, word ptr [r8 + r9*2]
0x1401c0e5e: mov word ptr [rsp + 0x26], ax
0x1401c0e63: xorps xmm0, xmm0
0x1401c0e66: movaps xmmword ptr [rsp + 0xd0], xmm0
0x1401c0e6e: movaps xmmword ptr [rsp + 0xc0], xmm0
0x1401c0e76: movaps xmmword ptr [rsp + 0xb0], xmm0
0x1401c0e7e: movaps xmmword ptr [rsp + 0xa0], xmm0
0x1401c0e86: movaps xmmword ptr [rsp + 0x90], xmm0
0x1401c0e8e: mov qword ptr [rsp + 0xe0], 0
0x1401c0e9a: movups xmm0, xmmword ptr [rip + 0x5c27faf]
0x1401c0ea1: movups xmmword ptr [rsp + 0xe8], xmm0
0x1401c0ea9: movups xmm0, xmmword ptr [rip + 0x5c27fb0]
0x1401c0eb0: movups xmmword ptr [rsp + 0xf8], xmm0
0x1401c0eb8: movups xmm0, xmmword ptr [rip + 0x5c27fb1]
0x1401c0ebf: movups xmmword ptr [rsp + 0x108], xmm0
0x1401c0ec7: movups xmm0, xmmword ptr [rip + 0x5c27fb2]
0x1401c0ece: movups xmmword ptr [rsp + 0x118], xmm0
0x1401c0ed6: movups xmm0, xmmword ptr [rip + 0x5c27fb3]
0x1401c0edd: movups xmmword ptr [rsp + 0x128], xmm0
0x1401c0ee5: movups xmm0, xmmword ptr [rip + 0x5c27fb4]
0x1401c0eec: movups xmmword ptr [rsp + 0x138], xmm0
0x1401c0ef4: movups xmm0, xmmword ptr [rip + 0x5c27fc5]
0x1401c0efb: movups xmmword ptr [rsp + 0x158], xmm0
0x1401c0f03: movups xmm0, xmmword ptr [rip + 0x5c27fa6]
0x1401c0f0a: movups xmmword ptr [rsp + 0x148], xmm0
0x1401c0f12: movups xmm0, xmmword ptr [rip + 0x5c27e7f]
0x1401c0f19: movaps xmmword ptr [rsp + 0x30], xmm0
0x1401c0f1e: mov qword ptr [rsp + 0x40], 0
0x1401c0f27: movups xmm0, xmmword ptr [rip + 0x5c27e82]
0x1401c0f2e: movups xmmword ptr [rsp + 0x48], xmm0
0x1401c0f33: mov qword ptr [rsp + 0x58], 0
0x1401c0f3c: movups xmm0, xmmword ptr [rip + 0x5c27e85]
0x1401c0f43: movaps xmmword ptr [rsp + 0x60], xmm0
0x1401c0f48: mov qword ptr [rsp + 0x70], 0
0x1401c0f51: movups xmm0, xmmword ptr [rip + 0x5c27e88]
0x1401c0f58: movups xmmword ptr [rsp + 0x78], xmm0
0x1401c0f5d: mov qword ptr [rsp + 0x88], 0
0x1401c0f69: mov rbx, qword ptr [rcx]
0x1401c0f6c: add rdi, 8
0x1401c0f70: lea rcx, [rsp + 0x178]
0x1401c0f78: lea rdx, [rsp + 0x30]
0x1401c0f7d: mov r8d, 0x138
0x1401c0f83: call 0x145bfa0e7
0x1401c0f88: movaps xmm0, xmmword ptr [rip + 0x5bdc2e1]
0x1401c0f8f: movups xmmword ptr [rsp + 0x2b0], xmm0
0x1401c0f97: mov dword ptr [rsp + 0x2c0], 1
0x1401c0fa2: movss xmm0, dword ptr [rip + 0x5bdc3d6]
0x1401c0faa: movlps qword ptr [rsp + 0x2c4], xmm0
0x1401c0fb2: mov byte ptr [rsp + 0x2cc], 1
0x1401c0fba: mov qword ptr [rsp + 0x2d0], 0
0x1401c0fc6: mov dword ptr [rsp + 0x2d8], 0x3f800000
0x1401c0fd1: mov word ptr [rsp + 0x2dc], 0
0x1401c0fdb: mov dword ptr [rsp + 0x2de], 0x10000
0x1401c0fe6: mov word ptr [rsp + 0x2e2], 0
0x1401c0ff0: mov dword ptr [rsp + 0x2e4], 0x10000
0x1401c0ffb: mov word ptr [rsp + 0x2e8], 0
0x1401c1005: mov qword ptr [rsp + 0x2ea], 0
0x1401c1011: mov dword ptr [rsp + 0x2f2], 5
0x1401c101c: mov qword ptr [rsp + 0x170], rbx
0x1401c1024: lea r9, [rip + 0x5c14405]
0x1401c102b: lea rbx, [rsp + 0x2f8]
0x1401c1033: lea r8, [rsp + 0x170]
0x1401c103b: mov rcx, rbx
0x1401c103e: mov rdx, rdi
0x1401c1041: call 0x1401de510
0x1401c1046: mov qword ptr [rsp + 0x170], rsi
0x1401c104e: mov qword ptr [rsp + 0x178], r14
0x1401c1056: lea rax, [rsp + 0x28]
0x1401c105b: mov qword ptr [rsp + 0x180], rax
0x1401c1063: lea rax, [rsp + 0x26]
0x1401c1068: mov qword ptr [rsp + 0x188], rax
0x1401c1070: lea rdx, [rsp + 0x170]
0x1401c1078: mov rcx, rbx
0x1401c107b: call 0x140269200
0x1401c1080: nop
0x1401c1081: add rsp, 0x328
0x1401c1088: pop rbx
0x1401c1089: pop rdi
0x1401c108a: pop rsi
0x1401c108b: pop r14
0x1401c108d: ret
0x1401c108e: lea r8, [rip + 0x5c2826b]
0x1401c1095: mov edx, 4
0x1401c109a: mov rcx, r9
0x1401c109d: call 0x145d99653
0x1401c10a2: ud2
