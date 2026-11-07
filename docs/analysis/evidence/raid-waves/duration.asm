14588be10: 4883ec38 sub rsp, 0x38
14588be14: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
14588be19: 0fb6412d movzx eax, byte ptr [rcx + 0x2d]
14588be1d: 2c03 sub al, 3
14588be1f: 0fb6c0 movzx eax, al
14588be22: ba1d000000 mov edx, 0x1d
14588be27: 0f43d0 cmovae edx, eax
14588be2a: 0f57c0 xorps xmm0, xmm0
14588be2d: 0fb6c2 movzx eax, dl
14588be30: 488d1599be3501 lea rdx, [rip + 0x135be99]
14588be37: 48630482 movsxd rax, dword ptr [rdx + rax*4]
14588be3b: 4801d0 add rax, rdx
14588be3e: ffe0 jmp rax
14588be40: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588be45: 4883c438 add rsp, 0x38
14588be49: c3 ret
14588be4a: f30f10410c movss xmm0, dword ptr [rcx + 0xc]
14588be4f: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588be54: 4883c438 add rsp, 0x38
14588be58: c3 ret
14588be59: f30f104108 movss xmm0, dword ptr [rcx + 8]
14588be5e: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588be63: 4883c438 add rsp, 0x38
14588be67: c3 ret
14588be68: f30f104110 movss xmm0, dword ptr [rcx + 0x10]
14588be6d: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588be72: 4883c438 add rsp, 0x38
14588be76: c3 ret
14588be77: f30f1005d1635500 movss xmm0, dword ptr [rip + 0x5563d1]
14588be7f: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588be84: 4883c438 add rsp, 0x38
14588be88: c3 ret
14588be89: f30f104108 movss xmm0, dword ptr [rcx + 8]
14588be8e: f30f58050a145100 addss xmm0, dword ptr [rip + 0x51140a]
14588be96: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588be9b: 4883c438 add rsp, 0x38
14588be9f: c3 ret
14588bea0: f30f100568665500 movss xmm0, dword ptr [rip + 0x556668]
14588bea8: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588bead: 4883c438 add rsp, 0x38
14588beb1: c3 ret
14588beb2: 8b4104 mov eax, dword ptr [rcx + 4]
14588beb5: 0f57c0 xorps xmm0, xmm0
14588beb8: f3480f2ac0 cvtsi2ss xmm0, rax
14588bebd: f30f5905736f5400 mulss xmm0, dword ptr [rip + 0x546f73]
14588bec5: f30f584110 addss xmm0, dword ptr [rcx + 0x10]
14588beca: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588becf: 4883c438 add rsp, 0x38
14588bed3: c3 ret
14588bed4: 8b4104 mov eax, dword ptr [rcx + 4]
14588bed7: e9d9000000 jmp 0x14588bfb5
14588bedc: f30f10410c movss xmm0, dword ptr [rcx + 0xc]
14588bee1: f30f584110 addss xmm0, dword ptr [rcx + 0x10]
14588bee6: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588beeb: 4883c438 add rsp, 0x38
14588beef: c3 ret
14588bef0: 8b4108 mov eax, dword ptr [rcx + 8]
14588bef3: 0f57c0 xorps xmm0, xmm0
14588bef6: f3480f2ac0 cvtsi2ss xmm0, rax
14588befb: f30f594114 mulss xmm0, dword ptr [rcx + 0x14]
14588bf00: f30f584110 addss xmm0, dword ptr [rcx + 0x10]
14588bf05: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588bf0a: 4883c438 add rsp, 0x38
14588bf0e: c3 ret
14588bf0f: f30f10058d135100 movss xmm0, dword ptr [rip + 0x51138d]
14588bf17: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588bf1c: 4883c438 add rsp, 0x38
14588bf20: c3 ret
14588bf21: f30f104110 movss xmm0, dword ptr [rcx + 0x10]
14588bf26: f30f590576135100 mulss xmm0, dword ptr [rip + 0x511376]
14588bf2e: f30f58056a135100 addss xmm0, dword ptr [rip + 0x51136a]
14588bf36: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588bf3b: 4883c438 add rsp, 0x38
14588bf3f: c3 ret
14588bf40: 488b5108 mov rdx, qword ptr [rcx + 8]
14588bf44: 4885d2 test rdx, rdx
14588bf47: 0f84f3feffff je 0x14588be40
14588bf4d: 48ffca dec rdx
14588bf50: 488d0452 lea rax, [rdx + rdx*2]
14588bf54: 48c1e004 shl rax, 4
14588bf58: 480301 add rax, qword ptr [rcx]
14588bf5b: 4885d2 test rdx, rdx
14588bf5e: 7871 js 0x14588bfd1
14588bf60: 0f57f6 xorps xmm6, xmm6
14588bf63: f3480f2af2 cvtsi2ss xmm6, rdx
14588bf68: eb7f jmp 0x14588bfe9
14588bf6a: f30f104104 movss xmm0, dword ptr [rcx + 4]
14588bf6f: f30f58052d135100 addss xmm0, dword ptr [rip + 0x51132d]
14588bf77: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588bf7c: 4883c438 add rsp, 0x38
14588bf80: c3 ret
14588bf81: f30f104104 movss xmm0, dword ptr [rcx + 4]
14588bf86: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588bf8b: 4883c438 add rsp, 0x38
14588bf8f: c3 ret
14588bf90: 8b410c mov eax, dword ptr [rcx + 0xc]
14588bf93: 0f57c0 xorps xmm0, xmm0
14588bf96: f3480f2ac0 cvtsi2ss xmm0, rax
14588bf9b: f30f590515115400 mulss xmm0, dword ptr [rip + 0x541115]
14588bfa3: f30f584118 addss xmm0, dword ptr [rcx + 0x18]
14588bfa8: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588bfad: 4883c438 add rsp, 0x38
14588bfb1: c3 ret
14588bfb2: 8b4114 mov eax, dword ptr [rcx + 0x14]
14588bfb5: 0f57c0 xorps xmm0, xmm0
14588bfb8: f3480f2ac0 cvtsi2ss xmm0, rax
14588bfbd: f30f594110 mulss xmm0, dword ptr [rcx + 0x10]
14588bfc2: f30f58410c addss xmm0, dword ptr [rcx + 0xc]
14588bfc7: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588bfcc: 4883c438 add rsp, 0x38
14588bfd0: c3 ret
14588bfd1: 4989d0 mov r8, rdx
14588bfd4: 49d1e8 shr r8, 1
14588bfd7: 83e201 and edx, 1
14588bfda: 4c09c2 or rdx, r8
14588bfdd: 0f57f6 xorps xmm6, xmm6
14588bfe0: f3480f2af2 cvtsi2ss xmm6, rdx
14588bfe5: f30f58f6 addss xmm6, xmm6
14588bfe9: f30f597110 mulss xmm6, dword ptr [rcx + 0x10]
14588bfee: 4889c1 mov rcx, rax
14588bff1: e81afeffff call 0x14588be10
14588bff6: f30f58c6 addss xmm0, xmm6
14588bffa: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588bfff: 4883c438 add rsp, 0x38
14588c003: c3 ret
