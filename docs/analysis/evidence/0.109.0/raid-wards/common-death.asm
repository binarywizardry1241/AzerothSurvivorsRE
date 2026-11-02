145972682: 8b8560010000 mov eax, dword ptr [rbp + 0x160]
145972688: 89817c010000 mov dword ptr [rcx + 0x17c], eax
14597268e: 488b8558010000 mov rax, qword ptr [rbp + 0x158]
145972695: 48898174010000 mov qword ptr [rcx + 0x174], rax
14597269c: 488b8558010000 mov rax, qword ptr [rbp + 0x158]
1459726a3: 48898180010000 mov qword ptr [rcx + 0x180], rax
1459726aa: 8b8560010000 mov eax, dword ptr [rbp + 0x160]
1459726b0: 898188010000 mov dword ptr [rcx + 0x188], eax
1459726b6: 0f57c0 xorps xmm0, xmm0
1459726b9: f3410f10c0 movss xmm0, xmm8
1459726be: 0f13818c010000 movlps qword ptr [rcx + 0x18c], xmm0
1459726c5: c781b000000001000000 mov dword ptr [rcx + 0xb0], 1
1459726cf: f3440f1181b4000000 movss dword ptr [rcx + 0xb4], xmm8
1459726d8: 48c7411000000000 mov qword ptr [rcx + 0x10], 0
1459726e0: 48837918ff cmp qword ptr [rcx + 0x18], -1
1459726e5: 7406 je 0x1459726ed
1459726e7: 4c8b6130 mov r12, qword ptr [rcx + 0x30]
1459726eb: eb03 jmp 0x1459726f0
1459726ed: 4531e4 xor r12d, r12d
1459726f0: 4c8b7158 mov r14, qword ptr [rcx + 0x58]
1459726f4: 4983feff cmp r14, -1
1459726f8: 7410 je 0x14597270a
1459726fa: 488b8190000000 mov rax, qword ptr [rcx + 0x90]
145972701: 48898580000000 mov qword ptr [rbp + 0x80], rax
145972708: eb00 jmp 0x14597270a
14597270a: 488b81f8000000 mov rax, qword ptr [rcx + 0xf8]
145972711: 48898548010000 mov qword ptr [rbp + 0x148], rax
145972718: 448ab9d4010000 mov r15b, byte ptr [rcx + 0x1d4]
14597271f: e87cb2f9ff call 0x14590d9a0
145972724: 48899550010000 mov qword ptr [rbp + 0x150], rdx
14597272b: 4989c5 mov r13, rax
