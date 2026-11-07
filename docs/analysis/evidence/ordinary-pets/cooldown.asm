145954780: 55 push rbp
145954781: 56 push rsi
145954782: 57 push rdi
145954783: 53 push rbx
145954784: 4881ece8000000 sub rsp, 0xe8
14595478b: 488dac2480000000 lea rbp, [rsp + 0x80]
145954793: 440f294550 movaps xmmword ptr [rbp + 0x50], xmm8
145954798: 0f297d40 movaps xmmword ptr [rbp + 0x40], xmm7
14595479c: 0f297530 movaps xmmword ptr [rbp + 0x30], xmm6
1459547a0: 48c74528feffffff mov qword ptr [rbp + 0x28], 0xfffffffffffffffe
1459547a8: 488b81d8000000 mov rax, qword ptr [rcx + 0xd8]
1459547af: 4839c2 cmp rdx, rax
1459547b2: 0f83f7010000 jae 0x1459549af
1459547b8: 488b81d0000000 mov rax, qword ptr [rcx + 0xd0]
1459547bf: 48c1e207 shl rdx, 7
1459547c3: 488b441018 mov rax, qword ptr [rax + rdx + 0x18]
1459547c8: 0fb65039 movzx edx, byte ptr [rax + 0x39]
1459547cc: 85d2 test edx, edx
1459547ce: 0f84ce000000 je 0x1459548a2
1459547d4: 83fa07 cmp edx, 7
1459547d7: 0f85cf000000 jne 0x1459548ac
1459547dd: 488b8130030000 mov rax, qword ptr [rcx + 0x330]
1459547e4: 4c8b9138030000 mov r10, qword ptr [rcx + 0x338]
1459547eb: 488d1548f92a01 lea rdx, [rip + 0x12af948]
1459547f2: 48895500 mov qword ptr [rbp], rdx
1459547f6: 48c745080b000000 mov qword ptr [rbp + 8], 0xb
1459547fe: 4531db xor r11d, r11d
145954801: 488d15b0c62901 lea rdx, [rip + 0x129c6b0]
145954808: 49b8736861646f775f62 movabs r8, 0x625f776f64616873
145954812: 49b9646f775f626f6c74 movabs r9, 0x746c6f625f776f64
14595481c: eb13 jmp 0x145954831
14595481e: 6690 nop
145954820: 4983c378 add r11, 0x78
145954824: 4981fbf8340000 cmp r11, 0x34f8
14595482b: 0f8453010000 je 0x145954984
145954831: 49837c13080b cmp qword ptr [r11 + rdx + 8], 0xb
145954837: 75e7 jne 0x145954820
145954839: 498b3413 mov rsi, qword ptr [r11 + rdx]
14595483d: 488b3e mov rdi, qword ptr [rsi]
145954840: 4c31c7 xor rdi, r8
145954843: 488b7603 mov rsi, qword ptr [rsi + 3]
145954847: 4c31ce xor rsi, r9
14595484a: 4809fe or rsi, rdi
14595484d: 75d1 jne 0x145954820
14595484f: 4c01da add rdx, r11
145954852: f30f1035163a4500 movss xmm6, dword ptr [rip + 0x453a16]
14595485a: 4d85d2 test r10, r10
14595485d: 745f je 0x1459548be
14595485f: 49c1e205 shl r10, 5
145954863: 4f8d1c52 lea r11, [r10 + r10*2]
145954867: 4531d2 xor r10d, r10d
14595486a: eb0d jmp 0x145954879
14595486c: 0f1f4000 nop dword ptr [rax]
145954870: 4983c260 add r10, 0x60
145954874: 4d39d3 cmp r11, r10
145954877: 7445 je 0x1459548be
145954879: 4a8b3410 mov rsi, qword ptr [rax + r10]
14595487d: 48837e080b cmp qword ptr [rsi + 8], 0xb
145954882: 75ec jne 0x145954870
145954884: 488b3e mov rdi, qword ptr [rsi]
145954887: 488b1f mov rbx, qword ptr [rdi]
14595488a: 4c31c3 xor rbx, r8
14595488d: 488b7f03 mov rdi, qword ptr [rdi + 3]
145954891: 4c31cf xor rdi, r9
145954894: 4809df or rdi, rbx
145954897: 75d7 jne 0x145954870
145954899: f3420f10741014 movss xmm6, dword ptr [rax + r10 + 0x14]
1459548a0: eb1f jmp 0x1459548c1
1459548a2: f30f104030 movss xmm0, dword ptr [rax + 0x30]
1459548a7: e9bf000000 jmp 0x14595496b
1459548ac: f30f104030 movss xmm0, dword ptr [rax + 0x30]
1459548b1: f30f598190040000 mulss xmm0, dword ptr [rcx + 0x490]
1459548b9: e9a5000000 jmp 0x145954963
1459548be: 4889d6 mov rsi, rdx
1459548c1: 4889cb mov rbx, rcx
1459548c4: 488d91c8010000 lea rdx, [rcx + 0x1c8]
1459548cb: 488d7da0 lea rdi, [rbp - 0x60]
1459548cf: 4889f9 mov rcx, rdi
1459548d2: e8c9e0f3ff call 0x1458929a0
1459548d7: 90 nop
1459548d8: 4889e9 mov rcx, rbp
1459548db: 4889fa mov rdx, rdi
1459548de: 4989f0 mov r8, rsi
1459548e1: e8eae2f3ff call 0x145892bd0
1459548e6: 90 nop
1459548e7: f3440f104504 movss xmm8, dword ptr [rbp + 4]
1459548ed: f30f107d20 movss xmm7, dword ptr [rbp + 0x20]
1459548f2: 488d4da0 lea rcx, [rbp - 0x60]
1459548f6: e815cbf3ff call 0x145891410
1459548fb: f30f108390040000 movss xmm0, dword ptr [rbx + 0x490]
145954903: f30f100da57a4500 movss xmm1, dword ptr [rip + 0x457aa5]
14595490b: 48837e0808 cmp qword ptr [rsi + 8], 8
145954910: 751a jne 0x14595492c
145954912: 488b06 mov rax, qword ptr [rsi]
145954915: 48b968656c6c66697265 movabs rcx, 0x657269666c6c6568
14595491f: 483908 cmp qword ptr [rax], rcx
145954922: 7508 jne 0x14595492c
145954924: f30f100d48394500 movss xmm1, dword ptr [rip + 0x453948]
14595492c: f30f105648 movss xmm2, dword ptr [rsi + 0x48]
145954931: f30f59157b7a4500 mulss xmm2, dword ptr [rip + 0x457a7b]
145954939: f30f59f2 mulss xmm6, xmm2
14595493d: f3440f59c6 mulss xmm8, xmm6
145954942: f3410f59c0 mulss xmm0, xmm8
145954947: f30f59f8 mulss xmm7, xmm0
14595494b: 0f28d7 movaps xmm2, xmm7
14595494e: f30f5fd1 maxss xmm2, xmm1
145954952: 0f28c2 movaps xmm0, xmm2
145954955: f30fc2c203 cmpunordss xmm0, xmm2
14595495a: 0f54f8 andps xmm7, xmm0
14595495d: 0f55c2 andnps xmm0, xmm2
145954960: 0f56c7 orps xmm0, xmm7
145954963: f30f5f0509394500 maxss xmm0, dword ptr [rip + 0x453909]
14595496b: 0f287530 movaps xmm6, xmmword ptr [rbp + 0x30]
14595496f: 0f287d40 movaps xmm7, xmmword ptr [rbp + 0x40]
145954973: 440f284550 movaps xmm8, xmmword ptr [rbp + 0x50]
145954978: 4881c4e8000000 add rsp, 0xe8
14595497f: 5b pop rbx
145954980: 5f pop rdi
145954981: 5e pop rsi
145954982: 5d pop rbp
145954983: c3 ret
145954984: 4889e8 mov rax, rbp
145954987: 488945a0 mov qword ptr [rbp - 0x60], rax
14595498b: 488d052ed76afa lea rax, [rip - 0x59528d2]
145954992: 488945a8 mov qword ptr [rbp - 0x58], rax
145954996: 488d0dfbb62901 lea rcx, [rip + 0x129b6fb]
14595499d: 4c8d0504b72901 lea r8, [rip + 0x129b704]
1459549a4: 488d55a0 lea rdx, [rbp - 0x60]
1459549a8: e873fe4400 call 0x145da4820
1459549ad: 0f0b ud2
1459549af: 4c8d05ba1e2b01 lea r8, [rip + 0x12b1eba]
1459549b6: 4889d1 mov rcx, rdx
1459549b9: 4889c2 mov rdx, rax
1459549bc: e882fc4400 call 0x145da4643
1459549c1: 0f0b ud2
