14585dd51: movapd    xmm0, xmm6
14585dd55: mov       rax, qword ptr [rbp + 0xfa8]
14585dd5c: subsd     xmm0, qword ptr [rax + 0x16b0]
14585dd64: ucomisd   xmm0, qword ptr [rip + 0x17b503c]
14585dd6c: jb        0x14585e531
14585dd72: cmp       dword ptr [rax + 0xc28], 1
14585dd79: ja        0x14585dd88
14585dd7b: test      byte ptr [rax + 0xee9], 1
14585dd82: jne       0x14585e531
14585dd88: movsd     qword ptr [rax + 0x16b0], xmm6
