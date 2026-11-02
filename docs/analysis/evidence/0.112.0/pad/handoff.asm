1401c10a5: 458911 mov dword ptr [r9], r10d
1401c10a8: 4180784e00 cmp byte ptr [r8 + 0x4e], 0
1401c10ad: 41c6404e00 mov byte ptr [r8 + 0x4e], 0
1401c10b2: 7556 jne 0x1401c110a
1401c10b4: 807c242800 cmp byte ptr [rsp + 0x28], 0
1401c10b9: 7419 je 0x1401c10d4
1401c10bb: 4180784d00 cmp byte ptr [r8 + 0x4d], 0
1401c10c0: 7508 jne 0x1401c10ca
1401c10c2: 41c7402400000000 mov dword ptr [r8 + 0x24], 0
1401c10ca: 458911 mov dword ptr [r9], r10d
1401c10cd: 41c6404d01 mov byte ptr [r8 + 0x4d], 1
1401c10d2: eb36 jmp 0x1401c110a
1401c10d4: 458911 mov dword ptr [r9], r10d
1401c10d7: f3410f584024 addss xmm0, dword ptr [r8 + 0x24]
1401c10dd: f3410f114024 movss dword ptr [r8 + 0x24], xmm0
1401c10e3: 0f2e05da03bf05 ucomiss xmm0, dword ptr [rip + 0x5bf03da]
1401c10ea: 0f97c0 seta al
1401c10ed: 4180784d01 cmp byte ptr [r8 + 0x4d], 1
1401c10f2: 7516 jne 0x1401c110a
1401c10f4: 08d1 or cl, dl
1401c10f6: 08c1 or cl, al
1401c10f8: 7410 je 0x1401c110a
1401c10fa: 41c6404d00 mov byte ptr [r8 + 0x4d], 0
1401c10ff: 458911 mov dword ptr [r9], r10d
1401c1102: 41c7401000000000 mov dword ptr [r8 + 0x10], 0
