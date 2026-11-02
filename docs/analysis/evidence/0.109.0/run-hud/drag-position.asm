140286f03 0f58f0 addps xmm6, xmm0
140286f06 0f5cf7 subps xmm6, xmm7
140286f09 45893e mov dword ptr [r14], r15d
140286f0c 488d470c lea rax, [rdi + 0xc]
140286f10 f6c301 test bl, 1
140286f13 480f44c7 cmove rax, rdi
140286f17 c70001000000 mov dword ptr [rax], 1
140286f1d 0f137004 movlps qword ptr [rax + 4], xmm6
