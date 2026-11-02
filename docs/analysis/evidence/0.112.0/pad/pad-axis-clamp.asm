14003a57f: f30f100de16dd705 movss xmm1, dword ptr [rip + 0x5d76de1]
14003a587: f3420f5f4cc0fc maxss xmm1, dword ptr [rax + r8*8 - 4]
14003a58e: f30f1005ca2cd705 movss xmm0, dword ptr [rip + 0x5d72cca]
14003a596: f30f5dc1 minss xmm0, xmm1
14003a59a: b801000000 mov eax, 1
14003a59f: 5f pop rdi
14003a5a0: 5e pop rsi
14003a5a1: c3 ret
