1458f01c0 55 push rbp
1458f01c1 56 push rsi
1458f01c2 57 push rdi
1458f01c3 4881ecd0000000 sub rsp, 0xd0
1458f01ca 488dac2480000000 lea rbp, [rsp + 0x80]
1458f01d2 48c74548feffffff mov qword ptr [rbp + 0x48], 0xfffffffffffffffe
1458f01da 4889ce mov rsi, rcx
1458f01dd 488955d0 mov qword ptr [rbp - 0x30], rdx
1458f01e1 4c8945d8 mov qword ptr [rbp - 0x28], r8
1458f01e5 488d4d10 lea rcx, [rbp + 0x10]
1458f01e9 e882efffff call 0x1458ef170
1458f01ee 488b4510 mov rax, qword ptr [rbp + 0x10]
1458f01f2 4883f8ff cmp rax, -1
1458f01f6 0f84b8000000 je 0x1458f02b4
1458f01fc 48894538 mov qword ptr [rbp + 0x38], rax
1458f0200 488b4518 mov rax, qword ptr [rbp + 0x18]
1458f0204 48894530 mov qword ptr [rbp + 0x30], rax
1458f0208 488b7d20 mov rdi, qword ptr [rbp + 0x20]
1458f020c 488d45d0 lea rax, [rbp - 0x30]
1458f0210 48894510 mov qword ptr [rbp + 0x10], rax
1458f0214 488d05a51e71fa lea rax, [rip - 0x58ee15b]
1458f021b 48894518 mov qword ptr [rbp + 0x18], rax
1458f021f 488d1547275e01 lea rdx, [rip + 0x15e2747]
1458f0226 488d4de0 lea rcx, [rbp - 0x20]
1458f022a 4c8d4510 lea r8, [rbp + 0x10]
1458f022e e8fdcb2d00 call 0x145bcce30
1458f0233 90 nop
1458f0234 4c8b4de8 mov r9, qword ptr [rbp - 0x18]
1458f0238 488b45f0 mov rax, qword ptr [rbp - 0x10]
1458f023c 4889442420 mov qword ptr [rsp + 0x20], rax
1458f0241 488d4db0 lea rcx, [rbp - 0x50]
1458f0245 488b5530 mov rdx, qword ptr [rbp + 0x30]
1458f0249 4989f8 mov r8, rdi
1458f024c 4c894d40 mov qword ptr [rbp + 0x40], r9
1458f0250 e8eb6a2b00 call 0x145ba6d40
1458f0255 90 nop
1458f0256 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458f025a 4885d2 test rdx, rdx
1458f025d 740f je 0x1458f026e
1458f025f 41b801000000 mov r8d, 1
1458f0265 488b4d40 mov rcx, qword ptr [rbp + 0x40]
1458f0269 e8621f71fa call 0x1400021d0
1458f026e 488b55b8 mov rdx, qword ptr [rbp - 0x48]
1458f0272 4c8b45c0 mov r8, qword ptr [rbp - 0x40]
1458f0276 488d4df8 lea rcx, [rbp - 8]
1458f027a 48895540 mov qword ptr [rbp + 0x40], rdx
1458f027e e80dd02c00 call 0x145bbd290
1458f0283 90 nop
1458f0284 488b55b0 mov rdx, qword ptr [rbp - 0x50]
1458f0288 4885d2 test rdx, rdx
1458f028b 740f je 0x1458f029c
1458f028d 41b801000000 mov r8d, 1
1458f0293 488b4d40 mov rcx, qword ptr [rbp + 0x40]
1458f0297 e8341f71fa call 0x1400021d0
1458f029c 48837df8ff cmp qword ptr [rbp - 8], -1
1458f02a1 741a je 0x1458f02bd
1458f02a3 488b4508 mov rax, qword ptr [rbp + 8]
1458f02a7 48894610 mov qword ptr [rsi + 0x10], rax
1458f02ab 0f1045f8 movups xmm0, xmmword ptr [rbp - 8]
1458f02af 0f1106 movups xmmword ptr [rsi], xmm0
1458f02b2 eb3b jmp 0x1458f02ef
1458f02b4 48c706ffffffff mov qword ptr [rsi], 0xffffffffffffffff
1458f02bb eb4a jmp 0x1458f0307
1458f02bd 48c706ffffffff mov qword ptr [rsi], 0xffffffffffffffff
1458f02c4 488b4500 mov rax, qword ptr [rbp]
1458f02c8 89c1 mov ecx, eax
1458f02ca 83e103 and ecx, 3
1458f02cd 8d51fe lea edx, [rcx - 2]
1458f02d0 83fa02 cmp edx, 2
1458f02d3 721a jb 0x1458f02ef
1458f02d5 4885c9 test rcx, rcx
1458f02d8 7415 je 0x1458f02ef
1458f02da 48ffc8 dec rax
1458f02dd 488d4d18 lea rcx, [rbp + 0x18]
1458f02e1 48894518 mov qword ptr [rbp + 0x18], rax
1458f02e5 c6451003 mov byte ptr [rbp + 0x10], 3
1458f02e9 e8d2f42e00 call 0x145bdf7c0
1458f02ee 90 nop
1458f02ef 488b5538 mov rdx, qword ptr [rbp + 0x38]
1458f02f3 4885d2 test rdx, rdx
1458f02f6 740f je 0x1458f0307
1458f02f8 41b801000000 mov r8d, 1
1458f02fe 488b4d30 mov rcx, qword ptr [rbp + 0x30]
1458f0302 e8c91e71fa call 0x1400021d0
1458f0307 4889f0 mov rax, rsi
1458f030a 4881c4d0000000 add rsp, 0xd0
1458f0311 5f pop rdi
1458f0312 5e pop rsi
1458f0313 5d pop rbp
1458f0314 c3 ret
