14082a7f0: 4883ec28 sub rsp, 0x28
14082a7f4: 48894c2420 mov qword ptr [rsp + 0x20], rcx
14082a7f9: 8b05a94fca07 mov eax, dword ptr [rip + 0x7ca4fa9]
14082a7ff: 85c0 test eax, eax
14082a801: 7505 jne 0x14082a808
14082a803: 4883c428 add rsp, 0x28
14082a807: c3 ret
14082a808: 488d0d914fca07 lea rcx, [rip + 0x7ca4f91]
14082a80f: 488d542420 lea rdx, [rsp + 0x20]
14082a814: e819867905 call 0x145fc2e32
14082a819: 90 nop
14082a81a: 4883c428 add rsp, 0x28
14082a81e: c3 ret
