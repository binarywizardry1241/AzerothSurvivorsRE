14594e8d3: 4c39bc18f0000000 cmp qword ptr [rax + rbx + 0xf0], r15
14594e8db: 75e3 jne 0x14594e8c0
14594e8dd: f68418b000000001 test byte ptr [rax + rbx + 0xb0], 1
14594e8e5: 75d9 jne 0x14594e8c0
14594e8e7: 89f1 mov ecx, esi
14594e8e9: 80e923 sub cl, 0x23
14594e8ec: 0fb6c9 movzx ecx, cl
14594e8ef: 48ffc1 inc rcx
14594e8f2: 4080fe23 cmp sil, 0x23
14594e8f6: ba00000000 mov edx, 0
14594e8fb: 480f42ca cmovb rcx, rdx
14594e8ff: 488d157ee48d01 lea rdx, [rip + 0x18de47e]
14594e906: 48630c8a movsxd rcx, dword ptr [rdx + rcx*4]
14594e90a: 4801d1 add rcx, rdx
14594e90d: ffe1 jmp rcx
