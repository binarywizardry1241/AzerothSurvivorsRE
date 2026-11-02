141807670: 55 push rbp
141807671: 56 push rsi
141807672: 57 push rdi
141807673: 4881ecd0000000 sub rsp, 0xd0
14180767a: 488dac2480000000 lea rbp, [rsp + 0x80]
141807682: 48c74548feffffff mov qword ptr [rbp + 0x48], 0xfffffffffffffffe
14180768a: 4889ce mov rsi, rcx
14180768d: 488d4128 lea rax, [rcx + 0x28]
141807691: 4883c110 add rcx, 0x10
141807695: 4180f802 cmp r8b, 2
141807699: 480f42c1 cmovb rax, rcx
14180769d: 8b00 mov eax, dword ptr [rax]
14180769f: 39c2 cmp edx, eax
1418076a1: 0f83db000000 jae 0x141807782
1418076a7: 418b4968 mov ecx, dword ptr [r9 + 0x68]
1418076ab: 894d10 mov dword ptr [rbp + 0x10], ecx
1418076ae: 410f104158 movups xmm0, xmmword ptr [r9 + 0x58]
1418076b3: 0f294500 movaps xmmword ptr [rbp], xmm0
1418076b7: 410fb78987000000 movzx ecx, word ptr [r9 + 0x87]
1418076bf: 4180b98600000001 cmp byte ptr [r9 + 0x86], 1
1418076c7: 4d8b516c mov r10, qword ptr [r9 + 0x6c]
1418076cb: 4c895514 mov qword ptr [rbp + 0x14], r10
1418076cf: 458b5174 mov r10d, dword ptr [r9 + 0x74]
1418076d3: 4489551c mov dword ptr [rbp + 0x1c], r10d
1418076d7: f3410f104178 movss xmm0, dword ptr [r9 + 0x78]
1418076dd: 458b597c mov r11d, dword ptr [r9 + 0x7c]
1418076e1: f3410f108980000000 movss xmm1, dword ptr [r9 + 0x80]
1418076ea: 410f105130 movups xmm2, xmmword ptr [r9 + 0x30]
1418076ef: 410f105940 movups xmm3, xmmword ptr [r9 + 0x40]
1418076f4: 0f1155d8 movups xmmword ptr [rbp - 0x28], xmm2
1418076f8: 0f115de8 movups xmmword ptr [rbp - 0x18], xmm3
1418076fc: 4d8b5150 mov r10, qword ptr [r9 + 0x50]
141807700: 4c8955f8 mov qword ptr [rbp - 8], r10
141807704: 410f2811 movaps xmm2, xmmword ptr [r9]
141807708: 410f285910 movaps xmm3, xmmword ptr [r9 + 0x10]
14180770d: 0f295db0 movaps xmmword ptr [rbp - 0x50], xmm3
141807711: 0f2955a0 movaps xmmword ptr [rbp - 0x60], xmm2
141807715: 66894d30 mov word ptr [rbp + 0x30], cx
141807719: 4488452f mov byte ptr [rbp + 0x2f], r8b
14180771d: 0f94452c sete byte ptr [rbp + 0x2c]
141807721: 410fb78984000000 movzx ecx, word ptr [r9 + 0x84]
141807729: f30f114520 movss dword ptr [rbp + 0x20], xmm0
14180772e: 44895d24 mov dword ptr [rbp + 0x24], r11d
141807732: f30f114d28 movss dword ptr [rbp + 0x28], xmm1
141807737: 66894d2d mov word ptr [rbp + 0x2d], cx
14180773b: 8955d0 mov dword ptr [rbp - 0x30], edx
14180773e: 8945d4 mov dword ptr [rbp - 0x2c], eax
141807741: 410f284120 movaps xmm0, xmmword ptr [r9 + 0x20]
141807746: 0f2945c0 movaps xmmword ptr [rbp - 0x40], xmm0
14180774a: 488b7e40 mov rdi, qword ptr [rsi + 0x40]
14180774e: 483b7e30 cmp rdi, qword ptr [rsi + 0x30]
141807752: 750a jne 0x14180775e
141807754: 488d4e30 lea rcx, [rsi + 0x30]
141807758: e823c37d04 call 0x145fe3a80
14180775d: 90 nop
14180775e: 488d0cbf lea rcx, [rdi + rdi*4]
141807762: 48c1e105 shl rcx, 5
141807766: 48034e38 add rcx, qword ptr [rsi + 0x38]
14180776a: 488d55a0 lea rdx, [rbp - 0x60]
14180776e: 41b8a0000000 mov r8d, 0xa0
141807774: e862c57804 call 0x145f93cdb
141807779: 48ffc7 inc rdi
14180777c: 48897e40 mov qword ptr [rsi + 0x40], rdi
141807780: eb42 jmp 0x1418077c4
141807782: 498b4130 mov rax, qword ptr [r9 + 0x30]
141807786: 4885c0 test rax, rax
141807789: 7439 je 0x1418077c4
14180778b: 4c894d40 mov qword ptr [rbp + 0x40], r9
14180778f: f048ff08 lock dec qword ptr [rax]
141807793: 750e jne 0x1418077a3
141807795: 488b4540 mov rax, qword ptr [rbp + 0x40]
141807799: 488d4830 lea rcx, [rax + 0x30]
14180779d: e84ed27902 call 0x143fa49f0
1418077a2: 90 nop
1418077a3: 488b4d40 mov rcx, qword ptr [rbp + 0x40]
1418077a7: 488b4138 mov rax, qword ptr [rcx + 0x38]
1418077ab: f048ff08 lock dec qword ptr [rax]
1418077af: 7513 jne 0x1418077c4
1418077b1: 4883c138 add rcx, 0x38
1418077b5: 4881c4d0000000 add rsp, 0xd0
1418077bc: 5f pop rdi
1418077bd: 5e pop rsi
1418077be: 5d pop rbp
1418077bf: e98ccc7902 jmp 0x143fa4450
1418077c4: 4881c4d0000000 add rsp, 0xd0
1418077cb: 5f pop rdi
1418077cc: 5e pop rsi
1418077cd: 5d pop rbp
1418077ce: c3 ret
