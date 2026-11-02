1401c2e35: 458911 mov dword ptr [r9], r10d
1401c2e38: 4180784e00 cmp byte ptr [r8 + 0x4e], 0
1401c2e3d: 41c6404e00 mov byte ptr [r8 + 0x4e], 0
1401c2e42: 7556 jne 0x1401c2e9a
1401c2e44: 807c242800 cmp byte ptr [rsp + 0x28], 0
1401c2e49: 7419 je 0x1401c2e64
1401c2e4b: 4180784d00 cmp byte ptr [r8 + 0x4d], 0
1401c2e50: 7508 jne 0x1401c2e5a
1401c2e52: 41c7402400000000 mov dword ptr [r8 + 0x24], 0
1401c2e5a: 458911 mov dword ptr [r9], r10d
1401c2e5d: 41c6404d01 mov byte ptr [r8 + 0x4d], 1
1401c2e62: eb36 jmp 0x1401c2e9a
1401c2e64: 458911 mov dword ptr [r9], r10d
1401c2e67: f3410f584024 addss xmm0, dword ptr [r8 + 0x24]
1401c2e6d: f3410f114024 movss dword ptr [r8 + 0x24], xmm0
1401c2e73: 0f2e0506a5bd05 ucomiss xmm0, dword ptr [rip + 0x5bda506]
1401c2e7a: 0f97c0 seta al
1401c2e7d: 4180784d01 cmp byte ptr [r8 + 0x4d], 1
1401c2e82: 7516 jne 0x1401c2e9a
1401c2e84: 08d1 or cl, dl
1401c2e86: 08c1 or cl, al
1401c2e88: 7410 je 0x1401c2e9a
1401c2e8a: 41c6404d00 mov byte ptr [r8 + 0x4d], 0
1401c2e8f: 458911 mov dword ptr [r9], r10d
1401c2e92: 41c7401000000000 mov dword ptr [r8 + 0x10], 0
