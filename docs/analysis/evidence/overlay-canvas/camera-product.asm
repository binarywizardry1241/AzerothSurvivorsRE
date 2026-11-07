140190f84: movss xmm0, dword ptr [rax + 0xc]
140190f89: mov rcx, qword ptr [rsp + 0x80]
140190f91: mulss xmm0, dword ptr [rcx]
140190f95: cmp byte ptr [rax + 0x88], 0
140190f9c: mov ecx, 4
140190fa1: mov edx, 0x94
140190fa6: cmovne rcx, rdx
140190faa: mulss xmm10, xmm0
