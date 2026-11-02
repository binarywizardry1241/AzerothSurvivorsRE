145c3d654: 4180beb800000000 cmp byte ptr [r14 + 0xb8], 0
145c3d65c: 0f84f7000000 je 0x145c3d759
145c3d662: 410f2eb6bc000000 ucomiss xmm6, dword ptr [r14 + 0xbc]
145c3d66a: 0f82b0d3ffff jb 0x145c3aa20
145c3d670: 41c786b800000000000000 mov dword ptr [r14 + 0xb8], 0
145c3d67b: 498b8e00010000 mov rcx, qword ptr [r14 + 0x100]
145c3d682: 4885c9 test rcx, rcx
145c3d685: 0f8495d3ffff je 0x145c3aa20
145c3d68b: 2201 and al, byte ptr [rcx]
145c3d68d: 3c01 cmp al, 1
145c3d68f: 0f858bd3ffff jne 0x145c3aa20
145c3d695: 8b7104 mov esi, dword ptr [rcx + 4]
145c3d698: 498bbef0000000 mov rdi, qword ptr [r14 + 0xf0]
