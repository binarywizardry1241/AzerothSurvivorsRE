14361df00: mov       rax, rcx
14361df03: mov       rcx, qword ptr [rdx]
14361df06: mov       r8, qword ptr [rdx + 8]
14361df0a: add       r8, rcx
14361df0d: inc       r8
14361df10: movdqa    xmm0, xmmword ptr [rcx]
14361df14: pmovmskb  r9d, xmm0
14361df19: not       r9d
14361df1c: mov       rdx, qword ptr [rdx + 0x18]
14361df20: mov       qword ptr [rax], rcx
14361df23: add       rcx, 0x10
14361df27: mov       qword ptr [rax + 8], rcx
14361df2b: mov       qword ptr [rax + 0x10], r8
14361df2f: mov       word ptr [rax + 0x18], r9w
14361df34: mov       qword ptr [rax + 0x20], rdx
14361df38: ret
