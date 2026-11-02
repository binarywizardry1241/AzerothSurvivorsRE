144654e8f: f30f100d2d827701 movss xmm1, dword ptr [rip + 0x177822d]
144654e97: f3420f5f4cc0fc maxss xmm1, dword ptr [rax + r8*8 - 4]
144654e9e: f30f1005fa837401 movss xmm0, dword ptr [rip + 0x17483fa]
144654ea6: f30f5dc1 minss xmm0, xmm1
144654eaa: b801000000 mov eax, 1
144654eaf: 5f pop rdi
144654eb0: 5e pop rsi
144654eb1: c3 ret
