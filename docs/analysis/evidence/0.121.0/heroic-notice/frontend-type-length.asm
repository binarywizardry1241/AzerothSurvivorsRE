00000001400639ac 803803                         cmp byte ptr [rax], 3
00000001400639af 0f852b0d0000                   jne 0x1400646e0
00000001400639b5 488b4818                       mov rcx, qword ptr [rax + 0x18]
00000001400639b9 4883c1fc                       add rcx, -4
00000001400639bd 4883f905                       cmp rcx, 5
00000001400639c1 0f87190d0000                   ja 0x1400646e0
00000001400639c7 488b4010                       mov rax, qword ptr [rax + 0x10]
00000001400639cb 488d156e521406                 lea rdx, [rip + 0x614526e]
00000001400639d2 48630c8a                       movsxd rcx, dword ptr [rdx + rcx*4]
00000001400639d6 4801d1                         add rcx, rdx
00000001400639d9 ffe1                           jmp rcx
