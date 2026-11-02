1402908ae: mov      al, 3
1402908b0: mov      rcx, qword ptr [rbp + 0x308]
1402908b7: cmp      byte ptr [rcx + 0xe9], 0
1402908be: jne      0x140290912
1402908c0: lea      rcx, [rip + 0x5b60dc3]
1402908c7: mov      edx, 5
1402908cc: mov      r8, qword ptr [rbp + 0x370]
1402908d3: call     0x142aeace0
1402908d8: nop
1402908d9: test     rax, rax
1402908dc: jne      0x1402908e5
1402908de: mov      rax, qword ptr [rip + 0x7dcf9ab]
1402908e5: cmp      byte ptr [rax], 3
1402908e8: jne      0x140290910
1402908ea: cmp      qword ptr [rax + 0x18], 7
1402908ef: jne      0x140290910
1402908f1: mov      rax, qword ptr [rax + 0x10]
1402908f5: mov      ecx, 0x79616c70
1402908fa: xor      ecx, dword ptr [rax]
1402908fc: mov      edx, 0x676e6979
140290901: xor      edx, dword ptr [rax + 3]
140290904: xor      eax, eax
140290906: or       edx, ecx
140290908: sete     al
14029090b: lea      eax, [rax + rax*2]
14029090e: jmp      0x140290912
140290910: xor      eax, eax
