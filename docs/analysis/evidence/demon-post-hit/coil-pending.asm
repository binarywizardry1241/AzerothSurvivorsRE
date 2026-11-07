1459580eb f30f1085c4000000 movss xmm0, dword ptr [rbp + 0xc4]
1459580f3 f3410f58c0 addss xmm0, xmm8
1459580f8 488b83e0050000 mov rax, qword ptr [rbx + 0x5e0]
1459580ff 4c89e1 mov rcx, r12
145958102 48c1e107 shl rcx, 7
145958106 48c7040800000000 mov qword ptr [rax + rcx], 0
14595810e c744081000000000 mov dword ptr [rax + rcx + 0x10], 0
145958116 488d154b362b01 lea rdx, [rip + 0x12b364b]
14595811d 4889540820 mov qword ptr [rax + rcx + 0x20], rdx
145958122 48c74408280a000000 mov qword ptr [rax + rcx + 0x28], 0xa
14595812b 48c744083000000000 mov qword ptr [rax + rcx + 0x30], 0
145958134 66c74408480000 mov word ptr [rax + rcx + 0x48], 0
14595813b 4c897c0850 mov qword ptr [rax + rcx + 0x50], r15
145958140 4c89740858 mov qword ptr [rax + rcx + 0x58], r14
145958145 c744086000000000 mov dword ptr [rax + rcx + 0x60], 0
14595814d f30f1144086c movss dword ptr [rax + rcx + 0x6c], xmm0
145958153 c7440870851a0000 mov dword ptr [rax + rcx + 0x70], 0x1a85
14595815b f3440f117c0874 movss dword ptr [rax + rcx + 0x74], xmm15
145958162 0fb695cc000000 movzx edx, byte ptr [rbp + 0xcc]
145958169 88540878 mov byte ptr [rax + rcx + 0x78], dl
14595816d 66c74408790000 mov word ptr [rax + rcx + 0x79], 0
145958174 c644087b05 mov byte ptr [rax + rcx + 0x7b], 5
145958179 49ffc4 inc r12
14595817c 4c89a3e8050000 mov qword ptr [rbx + 0x5e8], r12
