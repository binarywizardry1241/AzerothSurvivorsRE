0x144eabb30: push rsi
0x144eabb31: sub rsp, 0x90
0x144eabb38: movaps xmmword ptr [rsp + 0x80], xmm11
0x144eabb41: movaps xmmword ptr [rsp + 0x70], xmm10
0x144eabb47: movaps xmmword ptr [rsp + 0x60], xmm9
0x144eabb4d: movaps xmmword ptr [rsp + 0x50], xmm8
0x144eabb53: movaps xmmword ptr [rsp + 0x40], xmm7
0x144eabb58: movaps xmmword ptr [rsp + 0x30], xmm6
0x144eabb5d: mov rsi, rcx
0x144eabb60: mov ecx, dword ptr [rdx]
0x144eabb62: lea rax, [rdx + 4]
0x144eabb66: lea r8, [rip + 0x209d1ab]
0x144eabb6d: movsxd rcx, dword ptr [r8 + rcx*4]
0x144eabb71: add rcx, r8
0x144eabb74: jmp rcx
0x144eabb76: movups xmm0, xmmword ptr [rax]
0x144eabb79: movups xmmword ptr [rsi], xmm0
0x144eabb7c: jmp 0x144eac25b
