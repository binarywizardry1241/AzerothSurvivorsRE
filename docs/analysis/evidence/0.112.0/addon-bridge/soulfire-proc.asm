14595120b: 8b8208090000 mov eax, dword ptr [rdx + 0x908]
145951211: f3480f2ac0 cvtsi2ss xmm0, rax
145951216: 488d05af992b01 lea rax, [rip + 0x12b99af]
14595121d: 488901 mov qword ptr [rcx], rax
145951220: 48c7410809000000 mov qword ptr [rcx + 8], 9
145951228: f30f114110 movss dword ptr [rcx + 0x10], xmm0
14595122d: c741140000a040 mov dword ptr [rcx + 0x14], 0x40a00000
