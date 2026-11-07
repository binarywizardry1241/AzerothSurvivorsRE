; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x140184cc9..0x140184e35 SHA256 2d3ed76215f946c77dea1639a55a4e2d5aac912846f602680bb6ecc6f28c62c9
0x140184cc9: call 0x1403ead10
0x140184cce: mov qword ptr [rbp + 0x10], 0xa
0x140184cd6: mov dword ptr [rbp + 0x18], 0
0x140184cdd: mov qword ptr [rbp + 0x20], 0x1e
0x140184ce5: mov dword ptr [rbp + 0x28], 0
0x140184cec: lea r8, [rip + 0x5c608ce]
0x140184cf3: lea r12, [rbp + 0xc0]
0x140184cfa: mov r9d, 0x16
0x140184d00: mov rcx, r12
0x140184d03: mov rdx, r15
0x140184d06: call 0x1403eac10
0x140184d0b: mov rcx, r12
0x140184d0e: call 0x1403eafb0
0x140184d13: mov rcx, qword ptr [rsi + 0x38]
0x140184d17: mov r8, qword ptr [rsi + 0x40]
0x140184d1b: shl r8, 5
0x140184d1f: add r8, rcx
0x140184d22: mov qword ptr [rbp + 0x1c8], rax
0x140184d29: mov qword ptr [rbp + 0x1d0], rdx
0x140184d30: mov qword ptr [rbp + 0x1d8], rcx
0x140184d37: mov qword ptr [rbp + 0x1e0], r8
0x140184d3e: mov qword ptr [rbp + 0x1f0], 0
0x140184d49: mov qword ptr [rbp + 0x1e8], r14
0x140184d50: call 0x140002200
0x140184d55: mov ecx, 0x8000
0x140184d5a: mov edx, 1
0x140184d5f: call 0x1400021f0
0x140184d64: test rax, rax
0x140184d67: je 0x1401854bc
0x140184d6d: mov rcx, qword ptr [rbp + 0x1f8]
0x140184d74: mov qword ptr [rbp + 0xf0], rcx
0x140184d7b: movdqu xmm0, xmmword ptr [rbp + 0x1c8]
0x140184d83: movdqu xmm1, xmmword ptr [rbp + 0x1d8]
0x140184d8b: movdqu xmm2, xmmword ptr [rbp + 0x1e8]
0x140184d93: movdqa xmmword ptr [rbp + 0xe0], xmm2
0x140184d9b: movdqa xmmword ptr [rbp + 0xd0], xmm1
0x140184da3: movdqa xmmword ptr [rbp + 0xc0], xmm0
0x140184dab: mov qword ptr [rbp + 0xf8], rax
0x140184db2: mov qword ptr [rbp + 0x100], 0x8000
0x140184dbd: pxor xmm0, xmm0
0x140184dc1: movdqu xmmword ptr [rbp + 0x108], xmm0
0x140184dc9: lea rcx, [rbp - 0x58]
0x140184dcd: lea rdx, [rbp + 0xc0]
0x140184dd4: call 0x1400518c0
0x140184dd9: mov dword ptr [rbp + 0xc0], 0
0x140184de3: mov qword ptr [rbp + 0xc8], 0
0x140184dee: mov dword ptr [rbp + 0xd0], 7
0x140184df8: mov qword ptr [rbp + 0xd4], 0
0x140184e03: mov qword ptr [rbp + 0xd9], 0
0x140184e0e: mov byte ptr [rbp + 0xd9], 1
0x140184e15: mov byte ptr [rbp + 0xdc], 1
0x140184e1c: mov byte ptr [rbp + 0xdb], 1
0x140184e23: lea rcx, [rbp + 0xc0]
0x140184e2a: mov rdx, rbx
0x140184e2d: mov r8, rdi
0x140184e30: call 0x145bb24a0
