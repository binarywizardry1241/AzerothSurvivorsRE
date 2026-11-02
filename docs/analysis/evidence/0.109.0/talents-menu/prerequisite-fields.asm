14590ea90: mov       rax, rcx
14590ea93: movups    xmm0, xmmword ptr [rdx]
14590ea96: movups    xmm1, xmmword ptr [rdx + 0x10]
14590ea9a: mov       qword ptr [rcx], 1
14590eaa1: movups    xmmword ptr [rcx + 8], xmm0
14590eaa5: mov       qword ptr [rcx + 0x18], 1
14590eaad: movups    xmmword ptr [rcx + 0x20], xmm1
14590eab1: ret
