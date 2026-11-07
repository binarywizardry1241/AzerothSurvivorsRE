14021394d f30f105a04 movss xmm3, dword ptr [rdx + 4]
140213952 f30f104a0c movss xmm1, dword ptr [rdx + 0xc]
140213957 0f28c1 movaps xmm0, xmm1
14021395a f30f5cc3 subss xmm0, xmm3
14021395e 0f2e051fe7c805 ucomiss xmm0, dword ptr [rip + 0x5c8e71f]
140213965 0f97c0 seta al
140213968 488b8c24f8000000 mov rcx, qword ptr [rsp + 0xf8]
140213970 2202 and al, byte ptr [rdx]
140213972 3c01 cmp al, 1
140213974 7520 jne 0x140213996
