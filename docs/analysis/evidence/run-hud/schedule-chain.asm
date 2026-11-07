144e9bf10 48833900 cmp qword ptr [rcx], 0
144e9bf14 7401 je 0x144e9bf17
144e9bf16 c3 ret
144e9bf17 0f10052238cb01 movups xmm0, xmmword ptr [rip + 0x1cb3822]
144e9bf1e 0f114110 movups xmmword ptr [rcx + 0x10], xmm0
144e9bf22 0f10050738cb01 movups xmm0, xmmword ptr [rip + 0x1cb3807]
144e9bf29 0f1101 movups xmmword ptr [rcx], xmm0
144e9bf2c c3 ret
