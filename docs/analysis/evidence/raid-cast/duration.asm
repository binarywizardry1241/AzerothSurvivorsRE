1458850a0: 4883ec38 sub rsp, 0x38
1458850a4: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
1458850a9: 0fb6412d movzx eax, byte ptr [rcx + 0x2d]
1458850ad: 2c03 sub al, 3
1458850af: 0fb6c0 movzx eax, al
1458850b2: ba1d000000 mov edx, 0x1d
1458850b7: 0f43d0 cmovae edx, eax
1458850ba: 0f57c0 xorps xmm0, xmm0
1458850bd: 0fb6c2 movzx eax, dl
1458850c0: 488d1509c43501 lea rdx, [rip + 0x135c409]
1458850c7: 48630482 movsxd rax, dword ptr [rdx + rax*4]
1458850cb: 4801d0 add rax, rdx
1458850ce: ffe0 jmp rax
1458850d0: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
1458850d5: 4883c438 add rsp, 0x38
1458850d9: c3 ret
1458850da: f30f10410c movss xmm0, dword ptr [rcx + 0xc]
1458850df: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
1458850e4: 4883c438 add rsp, 0x38
1458850e8: c3 ret
1458850e9: f30f104108 movss xmm0, dword ptr [rcx + 8]
1458850ee: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
1458850f3: 4883c438 add rsp, 0x38
1458850f7: c3 ret
1458850f8: f30f104110 movss xmm0, dword ptr [rcx + 0x10]
1458850fd: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
145885102: 4883c438 add rsp, 0x38
145885106: c3 ret
145885107: f30f100589b65400 movss xmm0, dword ptr [rip + 0x54b689]
14588510f: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
145885114: 4883c438 add rsp, 0x38
145885118: c3 ret
145885119: f30f104108 movss xmm0, dword ptr [rcx + 8]
14588511e: f30f5805ea245100 addss xmm0, dword ptr [rip + 0x5124ea]
145885126: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588512b: 4883c438 add rsp, 0x38
14588512f: c3 ret
145885130: f30f1005c8ba5400 movss xmm0, dword ptr [rip + 0x54bac8]
145885138: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588513d: 4883c438 add rsp, 0x38
145885141: c3 ret
145885142: 8b4104 mov eax, dword ptr [rcx + 4]
145885145: 0f57c0 xorps xmm0, xmm0
145885148: f3480f2ac0 cvtsi2ss xmm0, rax
14588514d: f30f5905ebb55400 mulss xmm0, dword ptr [rip + 0x54b5eb]
145885155: f30f584110 addss xmm0, dword ptr [rcx + 0x10]
14588515a: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588515f: 4883c438 add rsp, 0x38
145885163: c3 ret
145885164: 8b4104 mov eax, dword ptr [rcx + 4]
145885167: e9d9000000 jmp 0x145885245
14588516c: f30f10410c movss xmm0, dword ptr [rcx + 0xc]
145885171: f30f584110 addss xmm0, dword ptr [rcx + 0x10]
145885176: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588517b: 4883c438 add rsp, 0x38
14588517f: c3 ret
145885180: 8b4108 mov eax, dword ptr [rcx + 8]
145885183: 0f57c0 xorps xmm0, xmm0
145885186: f3480f2ac0 cvtsi2ss xmm0, rax
14588518b: f30f594114 mulss xmm0, dword ptr [rcx + 0x14]
145885190: f30f584110 addss xmm0, dword ptr [rcx + 0x10]
145885195: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588519a: 4883c438 add rsp, 0x38
14588519e: c3 ret
14588519f: f30f10056d245100 movss xmm0, dword ptr [rip + 0x51246d]
1458851a7: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
1458851ac: 4883c438 add rsp, 0x38
1458851b0: c3 ret
1458851b1: f30f104110 movss xmm0, dword ptr [rcx + 0x10]
1458851b6: f30f590556245100 mulss xmm0, dword ptr [rip + 0x512456]
1458851be: f30f58054a245100 addss xmm0, dword ptr [rip + 0x51244a]
1458851c6: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
1458851cb: 4883c438 add rsp, 0x38
1458851cf: c3 ret
1458851d0: 488b5108 mov rdx, qword ptr [rcx + 8]
1458851d4: 4885d2 test rdx, rdx
1458851d7: 0f84f3feffff je 0x1458850d0
1458851dd: 48ffca dec rdx
1458851e0: 488d0452 lea rax, [rdx + rdx*2]
1458851e4: 48c1e004 shl rax, 4
1458851e8: 480301 add rax, qword ptr [rcx]
1458851eb: 4885d2 test rdx, rdx
1458851ee: 7871 js 0x145885261
1458851f0: 0f57f6 xorps xmm6, xmm6
1458851f3: f3480f2af2 cvtsi2ss xmm6, rdx
1458851f8: eb7f jmp 0x145885279
1458851fa: f30f104104 movss xmm0, dword ptr [rcx + 4]
1458851ff: f30f58050d245100 addss xmm0, dword ptr [rip + 0x51240d]
145885207: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588520c: 4883c438 add rsp, 0x38
145885210: c3 ret
145885211: f30f104104 movss xmm0, dword ptr [rcx + 4]
145885216: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588521b: 4883c438 add rsp, 0x38
14588521f: c3 ret
145885220: 8b410c mov eax, dword ptr [rcx + 0xc]
145885223: 0f57c0 xorps xmm0, xmm0
145885226: f3480f2ac0 cvtsi2ss xmm0, rax
14588522b: f30f59057d0f5200 mulss xmm0, dword ptr [rip + 0x520f7d]
145885233: f30f584118 addss xmm0, dword ptr [rcx + 0x18]
145885238: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588523d: 4883c438 add rsp, 0x38
145885241: c3 ret
145885242: 8b4114 mov eax, dword ptr [rcx + 0x14]
145885245: 0f57c0 xorps xmm0, xmm0
145885248: f3480f2ac0 cvtsi2ss xmm0, rax
14588524d: f30f594110 mulss xmm0, dword ptr [rcx + 0x10]
145885252: f30f58410c addss xmm0, dword ptr [rcx + 0xc]
145885257: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588525c: 4883c438 add rsp, 0x38
145885260: c3 ret
145885261: 4989d0 mov r8, rdx
145885264: 49d1e8 shr r8, 1
145885267: 83e201 and edx, 1
14588526a: 4c09c2 or rdx, r8
14588526d: 0f57f6 xorps xmm6, xmm6
145885270: f3480f2af2 cvtsi2ss xmm6, rdx
145885275: f30f58f6 addss xmm6, xmm6
145885279: f30f597110 mulss xmm6, dword ptr [rcx + 0x10]
14588527e: 4889c1 mov rcx, rax
145885281: e81afeffff call 0x1458850a0
145885286: f30f58c6 addss xmm0, xmm6
14588528a: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14588528f: 4883c438 add rsp, 0x38
145885293: c3 ret
