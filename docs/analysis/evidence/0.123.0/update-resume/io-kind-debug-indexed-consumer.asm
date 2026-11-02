0000000145feb5c0 0fb601                         movzx eax, byte ptr [rcx]
0000000145feb5c3 c1e003                         shl eax, 3
0000000145feb5c6 488d0d03737601                 lea rcx, [rip + 0x1767303]
0000000145feb5cd 4c8b0408                       mov r8, qword ptr [rax + rcx]
0000000145feb5d1 488d0d50747601                 lea rcx, [rip + 0x1767450]
0000000145feb5d8 488b0408                       mov rax, qword ptr [rax + rcx]
0000000145feb5dc 488b0a                         mov rcx, qword ptr [rdx]
0000000145feb5df 488b5208                       mov rdx, qword ptr [rdx + 8]
0000000145feb5e3 4c8b4a18                       mov r9, qword ptr [rdx + 0x18]
0000000145feb5e7 4889c2                         mov rdx, rax
0000000145feb5ea 49ffe1                         jmp r9
