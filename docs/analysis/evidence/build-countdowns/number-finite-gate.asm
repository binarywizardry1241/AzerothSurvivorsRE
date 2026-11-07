14598f8cf 66480f7ec8 movq rax, xmm1
14598f8d4 660fd64c2430 movq qword ptr [rsp + 0x30], xmm1
14598f8da 48bfffffffffffffff7f movabs rdi, 0x7fffffffffffffff
14598f8e4 4821f8 and rax, rdi
14598f8e7 48b9000000000000f07f movabs rcx, 0x7ff0000000000000
14598f8f1 4839c8 cmp rax, rcx
14598f8f4 7c38 jl 0x14598f92e
