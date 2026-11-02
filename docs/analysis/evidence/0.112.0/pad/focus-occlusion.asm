14019e980: 55 push rbp
14019e981: 4157 push r15
14019e983: 4156 push r14
14019e985: 4155 push r13
14019e987: 4154 push r12
14019e989: 56 push rsi
14019e98a: 57 push rdi
14019e98b: 53 push rbx
14019e98c: 4881ec98010000 sub rsp, 0x198
14019e993: 488dac2480000000 lea rbp, [rsp + 0x80]
14019e99b: 440f298500010000 movaps xmmword ptr [rbp + 0x100], xmm8
14019e9a3: 0f29bdf0000000 movaps xmmword ptr [rbp + 0xf0], xmm7
14019e9aa: 660f7fb5e0000000 movdqa xmmword ptr [rbp + 0xe0], xmm6
14019e9b2: 48c785d8000000feffffff mov qword ptr [rbp + 0xd8], 0xfffffffffffffffe
14019e9bd: 48898d90000000 mov qword ptr [rbp + 0x90], rcx
14019e9c4: 488b4210 mov rax, qword ptr [rdx + 0x10]
14019e9c8: 488985b0000000 mov qword ptr [rbp + 0xb0], rax
14019e9cf: 488b3a mov rdi, qword ptr [rdx]
14019e9d2: 488b5a08 mov rbx, qword ptr [rdx + 8]
14019e9d6: 4c8b6218 mov r12, qword ptr [rdx + 0x18]
14019e9da: 4889bdd0000000 mov qword ptr [rbp + 0xd0], rdi
14019e9e1: 4c39e3 cmp rbx, r12
14019e9e4: 0f841c050000 je 0x14019ef06
14019e9ea: 4c8d7db8 lea r15, [rbp - 0x48]
14019e9ee: 4c8d6d28 lea r13, [rbp + 0x28]
14019e9f2: 488b7220 mov rsi, qword ptr [rdx + 0x20]
14019e9f6: 488b4228 mov rax, qword ptr [rdx + 0x28]
14019e9fa: 488d4820 lea rcx, [rax + 0x20]
14019e9fe: 48898d88000000 mov qword ptr [rbp + 0x88], rcx
14019ea05: 488b4a30 mov rcx, qword ptr [rdx + 0x30]
14019ea09: 48898d98000000 mov qword ptr [rbp + 0x98], rcx
14019ea10: 488b4a38 mov rcx, qword ptr [rdx + 0x38]
14019ea14: 48898da0000000 mov qword ptr [rbp + 0xa0], rcx
14019ea1b: 488d4e20 lea rcx, [rsi + 0x20]
14019ea1f: 48894d78 mov qword ptr [rbp + 0x78], rcx
14019ea23: 660f76f6 pcmpeqd xmm6, xmm6
14019ea27: 0f283dc2eac005 movaps xmm7, xmmword ptr [rip + 0x5c0eac2]
14019ea2e: 4c8d7540 lea r14, [rbp + 0x40]
14019ea32: 4889bdd0000000 mov qword ptr [rbp + 0xd0], rdi
14019ea39: 4889b5c8000000 mov qword ptr [rbp + 0xc8], rsi
14019ea40: 4889bdb8000000 mov qword ptr [rbp + 0xb8], rdi
14019ea47: 4c89a5a8000000 mov qword ptr [rbp + 0xa8], r12
14019ea4e: 48898580000000 mov qword ptr [rbp + 0x80], rax
14019ea55: eb79 jmp 0x14019ead0
14019ea57: 660f1f840000000000 nop word ptr [rax + rax]
14019ea60: 4821d0 and rax, rdx
14019ea63: f30f6f0c01 movdqu xmm1, xmmword ptr [rcx + rax]
14019ea68: 660f6fd1 movdqa xmm2, xmm1
14019ea6c: 660f74d0 pcmpeqb xmm2, xmm0
14019ea70: 66440fd7d2 pmovmskb r10d, xmm2
14019ea75: 4585d2 test r10d, r10d
14019ea78: 7436 je 0x14019eab0
14019ea7a: f3450fbcda tzcnt r11d, r10d
14019ea7f: 4901c3 add r11, rax
14019ea82: 4921d3 and r11, rdx
14019ea85: 49c1e303 shl r11, 3
14019ea89: 4889ce mov rsi, rcx
14019ea8c: 4c29de sub rsi, r11
14019ea8f: 4c3b46f8 cmp r8, qword ptr [rsi - 8]
14019ea93: 0f8431040000 je 0x14019eeca
14019ea99: 458d5aff lea r11d, [r10 - 1]
14019ea9d: 664521d3 and r11w, r10w
14019eaa1: 4589da mov r10d, r11d
14019eaa4: 488bb5c8000000 mov rsi, qword ptr [rbp + 0xc8]
14019eaab: 75cd jne 0x14019ea7a
14019eaad: 0f1f00 nop dword ptr [rax]
14019eab0: 660f74ce pcmpeqb xmm1, xmm6
14019eab4: 66440fd7d1 pmovmskb r10d, xmm1
14019eab9: 4585d2 test r10d, r10d
14019eabc: 7572 jne 0x14019eb30
14019eabe: 4c01c8 add rax, r9
14019eac1: 4883c010 add rax, 0x10
14019eac5: 4983c110 add r9, 0x10
14019eac9: eb95 jmp 0x14019ea60
14019eacb: 0f1f440000 nop dword ptr [rax + rax]
14019ead0: 48897da8 mov qword ptr [rbp - 0x58], rdi
14019ead4: 488b85d0000000 mov rax, qword ptr [rbp + 0xd0]
14019eadb: 488945b0 mov qword ptr [rbp - 0x50], rax
14019eadf: 488b4310 mov rax, qword ptr [rbx + 0x10]
14019eae3: 49894710 mov qword ptr [r15 + 0x10], rax
14019eae7: f30f6f03 movdqu xmm0, xmmword ptr [rbx]
14019eaeb: f3410f7f07 movdqu xmmword ptr [r15], xmm0
14019eaf0: 48837e1800 cmp qword ptr [rsi + 0x18], 0
14019eaf5: 7439 je 0x14019eb30
14019eaf7: 488b4d78 mov rcx, qword ptr [rbp + 0x78]
14019eafb: 4c89fa mov rdx, r15
14019eafe: e8dd580000 call 0x1401a43e0
14019eb03: 4989c0 mov r8, rax
14019eb06: 49c1e839 shr r8, 0x39
14019eb0a: 488b0e mov rcx, qword ptr [rsi]
14019eb0d: 488b5608 mov rdx, qword ptr [rsi + 8]
14019eb11: 66410f6ec0 movd xmm0, r8d
14019eb16: 660f60c0 punpcklbw xmm0, xmm0
14019eb1a: f20f70c000 pshuflw xmm0, xmm0, 0
14019eb1f: 660f70c044 pshufd xmm0, xmm0, 0x44
14019eb24: 4c8b45b8 mov r8, qword ptr [rbp - 0x48]
14019eb28: 4531c9 xor r9d, r9d
14019eb2b: e930ffffff jmp 0x14019ea60
14019eb30: 488b4310 mov rax, qword ptr [rbx + 0x10]
14019eb34: 49894510 mov qword ptr [r13 + 0x10], rax
14019eb38: 0f1003 movups xmm0, xmmword ptr [rbx]
14019eb3b: 410f114500 movups xmmword ptr [r13], xmm0
14019eb40: 48897d18 mov qword ptr [rbp + 0x18], rdi
14019eb44: 488b85d0000000 mov rax, qword ptr [rbp + 0xd0]
14019eb4b: 48894520 mov qword ptr [rbp + 0x20], rax
14019eb4f: 488b8580000000 mov rax, qword ptr [rbp + 0x80]
14019eb56: 4883781800 cmp qword ptr [rax + 0x18], 0
14019eb5b: 0f8470030000 je 0x14019eed1
14019eb61: 488b8d88000000 mov rcx, qword ptr [rbp + 0x88]
14019eb68: 4c89ea mov rdx, r13
14019eb6b: 4989c5 mov r13, rax
14019eb6e: e86d580000 call 0x1401a43e0
14019eb73: 4989c0 mov r8, rax
14019eb76: 49c1e839 shr r8, 0x39
14019eb7a: 498b4d00 mov rcx, qword ptr [r13]
14019eb7e: 498b5508 mov rdx, qword ptr [r13 + 8]
14019eb82: 66410f6ec0 movd xmm0, r8d
14019eb87: 660f60c0 punpcklbw xmm0, xmm0
14019eb8b: f20f70c000 pshuflw xmm0, xmm0, 0
14019eb90: 660f70c044 pshufd xmm0, xmm0, 0x44
14019eb95: 4c8b6d28 mov r13, qword ptr [rbp + 0x28]
14019eb99: 4531c0 xor r8d, r8d
14019eb9c: 4821d0 and rax, rdx
14019eb9f: f30f6f0c01 movdqu xmm1, xmmword ptr [rcx + rax]
14019eba4: 660f6fd1 movdqa xmm2, xmm1
14019eba8: 660f74d0 pcmpeqb xmm2, xmm0
14019ebac: 66440fd7ca pmovmskb r9d, xmm2
14019ebb1: 4585c9 test r9d, r9d
14019ebb4: 742a je 0x14019ebe0
14019ebb6: f3450fbcd9 tzcnt r11d, r9d
14019ebbb: 4901c3 add r11, rax
14019ebbe: 4921d3 and r11, rdx
14019ebc1: 49c1e304 shl r11, 4
14019ebc5: 4989ca mov r10, rcx
14019ebc8: 4d29da sub r10, r11
14019ebcb: 4d3b6af0 cmp r13, qword ptr [r10 - 0x10]
14019ebcf: 742f je 0x14019ec00
14019ebd1: 458d51ff lea r10d, [r9 - 1]
14019ebd5: 664521ca and r10w, r9w
14019ebd9: 4589d1 mov r9d, r10d
14019ebdc: 75d8 jne 0x14019ebb6
14019ebde: 6690 nop
14019ebe0: 660f74ce pcmpeqb xmm1, xmm6
14019ebe4: 66440fd7c9 pmovmskb r9d, xmm1
14019ebe9: 4585c9 test r9d, r9d
14019ebec: 0f85ee020000 jne 0x14019eee0
14019ebf2: 4c01c0 add rax, r8
14019ebf5: 4883c010 add rax, 0x10
14019ebf9: 4983c010 add r8, 0x10
14019ebfd: eb9d jmp 0x14019eb9c
14019ebff: 90 nop
14019ec00: 498b7af8 mov rdi, qword ptr [r10 - 8]
14019ec04: f20f104530 movsd xmm0, qword ptr [rbp + 0x30]
14019ec09: f20f104d38 movsd xmm1, qword ptr [rbp + 0x38]
14019ec0e: 0f58c8 addps xmm1, xmm0
14019ec11: f2440f12c1 movddup xmm8, xmm1
14019ec16: 440f59c7 mulps xmm8, xmm7
14019ec1a: 488b8598000000 mov rax, qword ptr [rbp + 0x98]
14019ec21: 4c8b38 mov r15, qword ptr [rax]
14019ec24: e8474ea105 call 0x145bb3a70
14019ec29: 90 nop
14019ec2a: 4889c6 mov rsi, rax
14019ec2d: 80781001 cmp byte ptr [rax + 0x10], 1
14019ec31: 0f85bc020000 jne 0x14019eef3
14019ec37: 488b06 mov rax, qword ptr [rsi]
14019ec3a: 488b5608 mov rdx, qword ptr [rsi + 8]
14019ec3e: 488d4801 lea rcx, [rax + 1]
14019ec42: 48890e mov qword ptr [rsi], rcx
14019ec45: 0f100504e6c205 movups xmm0, xmmword ptr [rip + 0x5c2e604]
14019ec4c: 0f294550 movaps xmmword ptr [rbp + 0x50], xmm0
14019ec50: 0f1005e9e5c205 movups xmm0, xmmword ptr [rip + 0x5c2e5e9]
14019ec57: 0f294540 movaps xmmword ptr [rbp + 0x40], xmm0
14019ec5b: 48894560 mov qword ptr [rbp + 0x60], rax
14019ec5f: 48895568 mov qword ptr [rbp + 0x68], rdx
14019ec63: 4c897d08 mov qword ptr [rbp + 8], r15
14019ec67: 4c896d10 mov qword ptr [rbp + 0x10], r13
14019ec6b: 488d7508 lea rsi, [rbp + 8]
14019ec6f: 4889f1 mov rcx, rsi
14019ec72: e8b9d5feff call 0x14018c230
14019ec77: 90 nop
14019ec78: 0f1f840000000000 nop dword ptr [rax + rax]
14019ec80: 85c0 test eax, eax
14019ec82: 741c je 0x14019eca0
14019ec84: 4c89f1 mov rcx, r14
14019ec87: 4889c2 mov rdx, rax
14019ec8a: e801d1efff call 0x14009bd90
14019ec8f: 90 nop
14019ec90: 4889f1 mov rcx, rsi
14019ec93: e898d5feff call 0x14018c230
14019ec98: 90 nop
14019ec99: ebe5 jmp 0x14019ec80
14019ec9b: 0f1f440000 nop dword ptr [rax + rax]
14019eca0: 0f284540 movaps xmm0, xmmword ptr [rbp + 0x40]
14019eca4: 0f284d50 movaps xmm1, xmmword ptr [rbp + 0x50]
14019eca8: 660f6f5560 movdqa xmm2, xmmword ptr [rbp + 0x60]
14019ecad: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
14019ecb1: 0f294de0 movaps xmmword ptr [rbp - 0x20], xmm1
14019ecb5: 660f7f55f0 movdqa xmmword ptr [rbp - 0x10], xmm2
14019ecba: 488b85a0000000 mov rax, qword ptr [rbp + 0xa0]
14019ecc1: 4c8b6010 mov r12, qword ptr [rax + 0x10]
14019ecc5: 488b45d0 mov rax, qword ptr [rbp - 0x30]
14019ecc9: 488985c0000000 mov qword ptr [rbp + 0xc0], rax
14019ecd0: 488b75d8 mov rsi, qword ptr [rbp - 0x28]
14019ecd4: 4d85e4 test r12, r12
14019ecd7: 0f8483010000 je 0x14019ee60
14019ecdd: 488b85a0000000 mov rax, qword ptr [rbp + 0xa0]
14019ece4: 4c8b7808 mov r15, qword ptr [rax + 8]
14019ece8: 49c1e405 shl r12, 5
14019ecec: 4d01fc add r12, r15
14019ecef: 488b45e8 mov rax, qword ptr [rbp - 0x18]
14019ecf3: 48894570 mov qword ptr [rbp + 0x70], rax
14019ecf7: eb77 jmp 0x14019ed70
14019ecf9: 0f1f8000000000 nop dword ptr [rax]
14019ed00: 4821f0 and rax, rsi
14019ed03: 4c8b85c0000000 mov r8, qword ptr [rbp + 0xc0]
14019ed0a: f3410f6f0c00 movdqu xmm1, xmmword ptr [r8 + rax]
14019ed10: 660f6fd1 movdqa xmm2, xmm1
14019ed14: 660f74d0 pcmpeqb xmm2, xmm0
14019ed18: 66440fd7c2 pmovmskb r8d, xmm2
14019ed1d: 4585c0 test r8d, r8d
14019ed20: 742e je 0x14019ed50
14019ed22: f3450fbcc8 tzcnt r9d, r8d
14019ed27: 4901c1 add r9, rax
14019ed2a: 4921f1 and r9, rsi
14019ed2d: 49c1e103 shl r9, 3
14019ed31: 4c8b95c0000000 mov r10, qword ptr [rbp + 0xc0]
14019ed38: 4d29ca sub r10, r9
14019ed3b: 493b4af8 cmp rcx, qword ptr [r10 - 8]
14019ed3f: 7452 je 0x14019ed93
14019ed41: 458d48ff lea r9d, [r8 - 1]
14019ed45: 664521c1 and r9w, r8w
14019ed49: 4589c8 mov r8d, r9d
14019ed4c: 75d4 jne 0x14019ed22
14019ed4e: 6690 nop
14019ed50: 660f74ce pcmpeqb xmm1, xmm6
14019ed54: 66440fd7c1 pmovmskb r8d, xmm1
14019ed59: 4585c0 test r8d, r8d
14019ed5c: 757c jne 0x14019edda
14019ed5e: 4801d0 add rax, rdx
14019ed61: 4883c010 add rax, 0x10
14019ed65: 4883c210 add rdx, 0x10
14019ed69: eb95 jmp 0x14019ed00
14019ed6b: 0f1f440000 nop dword ptr [rax + rax]
14019ed70: 49397f08 cmp qword ptr [r15 + 8], rdi
14019ed74: 761d jbe 0x14019ed93
14019ed76: 410f104710 movups xmm0, xmmword ptr [r15 + 0x10]
14019ed7b: 410f28c8 movaps xmm1, xmm8
14019ed7f: 0fc2c806 cmpnleps xmm1, xmm0
14019ed83: 410fc2c006 cmpnleps xmm0, xmm8
14019ed88: 0fc6c1e4 shufps xmm0, xmm1, 0xe4
14019ed8c: 0f50c0 movmskps eax, xmm0
14019ed8f: 85c0 test eax, eax
14019ed91: 740e je 0x14019eda1
14019ed93: 4983c720 add r15, 0x20
14019ed97: 4d39e7 cmp r15, r12
14019ed9a: 75d4 jne 0x14019ed70
14019ed9c: e9bf000000 jmp 0x14019ee60
14019eda1: 48837d7000 cmp qword ptr [rbp + 0x70], 0
14019eda6: 742f je 0x14019edd7
14019eda8: 488d4df0 lea rcx, [rbp - 0x10]
14019edac: 4c89fa mov rdx, r15
14019edaf: e82c560000 call 0x1401a43e0
14019edb4: 4889c1 mov rcx, rax
14019edb7: 48c1e939 shr rcx, 0x39
14019edbb: 660f6ec1 movd xmm0, ecx
14019edbf: 660f60c0 punpcklbw xmm0, xmm0
14019edc3: f20f70c000 pshuflw xmm0, xmm0, 0
14019edc8: 660f70c044 pshufd xmm0, xmm0, 0x44
14019edcd: 498b0f mov rcx, qword ptr [r15]
14019edd0: 31d2 xor edx, edx
14019edd2: e929ffffff jmp 0x14019ed00
14019edd7: 498b0f mov rcx, qword ptr [r15]
14019edda: 4c39e9 cmp rcx, r13
14019eddd: 74b4 je 0x14019ed93
14019eddf: 488b8598000000 mov rax, qword ptr [rbp + 0x98]
14019ede6: 488b00 mov rax, qword ptr [rax]
14019ede9: 48894540 mov qword ptr [rbp + 0x40], rax
14019eded: 48894d48 mov qword ptr [rbp + 0x48], rcx
14019edf1: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14019ee00: 4c89f1 mov rcx, r14
14019ee03: e828d4feff call 0x14018c230
14019ee08: 90 nop
14019ee09: 4c39e8 cmp rax, r13
14019ee0c: 7407 je 0x14019ee15
14019ee0e: 89c1 mov ecx, eax
14019ee10: 4885c9 test rcx, rcx
14019ee13: 75eb jne 0x14019ee00
14019ee15: 85c0 test eax, eax
14019ee17: 0f8576ffffff jne 0x14019ed93
14019ee1d: 4885f6 test rsi, rsi
14019ee20: 4c8d6d28 lea r13, [rbp + 0x28]
14019ee24: 0f848e000000 je 0x14019eeb8
14019ee2a: 488d04f517000000 lea rax, [rsi*8 + 0x17]
14019ee32: 4883e0f0 and rax, 0xfffffffffffffff0
14019ee36: 4801c6 add rsi, rax
14019ee39: 4883c611 add rsi, 0x11
14019ee3d: 0f8475000000 je 0x14019eeb8
14019ee43: 488b8dc0000000 mov rcx, qword ptr [rbp + 0xc0]
14019ee4a: 4829c1 sub rcx, rax
14019ee4d: 41b810000000 mov r8d, 0x10
14019ee53: 4889f2 mov rdx, rsi
14019ee56: e87533e6ff call 0x1400021d0
14019ee5b: eb5b jmp 0x14019eeb8
14019ee5d: 0f1f00 nop dword ptr [rax]
14019ee60: 4885f6 test rsi, rsi
14019ee63: 742d je 0x14019ee92
14019ee65: 488d04f517000000 lea rax, [rsi*8 + 0x17]
14019ee6d: 4883e0f0 and rax, 0xfffffffffffffff0
14019ee71: 4801c6 add rsi, rax
14019ee74: 4883c611 add rsi, 0x11
14019ee78: 7418 je 0x14019ee92
14019ee7a: 488b8dc0000000 mov rcx, qword ptr [rbp + 0xc0]
14019ee81: 4829c1 sub rcx, rax
14019ee84: 41b810000000 mov r8d, 0x10
14019ee8a: 4889f2 mov rdx, rsi
14019ee8d: e83e33e6ff call 0x1400021d0
14019ee92: 4c8d6d28 lea r13, [rbp + 0x28]
14019ee96: 498b4510 mov rax, qword ptr [r13 + 0x10]
14019ee9a: 488b8dd0000000 mov rcx, qword ptr [rbp + 0xd0]
14019eea1: 48894110 mov qword ptr [rcx + 0x10], rax
14019eea5: 410f104500 movups xmm0, xmmword ptr [r13]
14019eeaa: 0f1101 movups xmmword ptr [rcx], xmm0
14019eead: 4883c118 add rcx, 0x18
14019eeb1: 48898dd0000000 mov qword ptr [rbp + 0xd0], rcx
14019eeb8: 488bbdb8000000 mov rdi, qword ptr [rbp + 0xb8]
14019eebf: 4c8ba5a8000000 mov r12, qword ptr [rbp + 0xa8]
14019eec6: 4c8d7db8 lea r15, [rbp - 0x48]
14019eeca: 488bb5c8000000 mov rsi, qword ptr [rbp + 0xc8]
14019eed1: 4883c318 add rbx, 0x18
14019eed5: 4c39e3 cmp rbx, r12
14019eed8: 0f85f2fbffff jne 0x14019ead0
14019eede: eb26 jmp 0x14019ef06
14019eee0: 4c8d6d28 lea r13, [rbp + 0x28]
14019eee4: 4883c318 add rbx, 0x18
14019eee8: 4c39e3 cmp rbx, r12
14019eeeb: 0f85dffbffff jne 0x14019ead0
14019eef1: eb13 jmp 0x14019ef06
14019eef3: e89887a205 call 0x145bc7690
14019eef8: 90 nop
14019eef9: 48895608 mov qword ptr [rsi + 8], rdx
14019eefd: c6461001 mov byte ptr [rsi + 0x10], 1
14019ef01: e938fdffff jmp 0x14019ec3e
14019ef06: 488b85d0000000 mov rax, qword ptr [rbp + 0xd0]
14019ef0d: 4829f8 sub rax, rdi
14019ef10: 48c1e803 shr rax, 3
14019ef14: 48baabaaaaaaaaaaaaaa movabs rdx, 0xaaaaaaaaaaaaaaab
14019ef1e: 480fafd0 imul rdx, rax
14019ef22: 488b8db0000000 mov rcx, qword ptr [rbp + 0xb0]
14019ef29: 488b8590000000 mov rax, qword ptr [rbp + 0x90]
14019ef30: 488908 mov qword ptr [rax], rcx
14019ef33: 48897808 mov qword ptr [rax + 8], rdi
14019ef37: 48895010 mov qword ptr [rax + 0x10], rdx
14019ef3b: 0f28b5e0000000 movaps xmm6, xmmword ptr [rbp + 0xe0]
14019ef42: 0f28bdf0000000 movaps xmm7, xmmword ptr [rbp + 0xf0]
14019ef49: 440f288500010000 movaps xmm8, xmmword ptr [rbp + 0x100]
14019ef51: 4881c498010000 add rsp, 0x198
14019ef58: 5b pop rbx
14019ef59: 5f pop rdi
14019ef5a: 5e pop rsi
14019ef5b: 415c pop r12
14019ef5d: 415d pop r13
14019ef5f: 415e pop r14
14019ef61: 415f pop r15
14019ef63: 5d pop rbp
14019ef64: c3 ret
