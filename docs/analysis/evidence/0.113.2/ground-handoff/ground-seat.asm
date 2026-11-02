1411a3f48: movss xmm0, dword ptr [rax + 0x2c]
1411a3f4d: lea rcx, [rdx + 0x14]
1411a3f51: movss xmm15, dword ptr [rdx + 0x14]
1411a3f57: lea rdx, [rax + 0x28]
1411a3f5b: ucomiss xmm0, xmm15
1411a3f5f: cmovne rdx, rcx
1411a3f63: cmovp rdx, rcx
1411a3f67: movss xmm2, dword ptr [rdx]
