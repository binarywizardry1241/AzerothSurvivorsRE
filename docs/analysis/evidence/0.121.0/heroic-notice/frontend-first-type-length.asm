000000014006369d 803803                         cmp byte ptr [rax], 3
00000001400636a0 0f85da020000                   jne 0x140063980
00000001400636a6 488b4818                       mov rcx, qword ptr [rax + 0x18]
00000001400636aa 4883c1fe                       add rcx, -2
00000001400636ae 4883f905                       cmp rcx, 5
00000001400636b2 0f87c8020000                   ja 0x140063980
00000001400636b8 488b4010                       mov rax, qword ptr [rax + 0x10]
00000001400636bc 488d154d551406                 lea rdx, [rip + 0x614554d]
00000001400636c3 48630c8a                       movsxd rcx, dword ptr [rdx + rcx*4]
00000001400636c7 4801d1                         add rcx, rdx
00000001400636ca ffe1                           jmp rcx
