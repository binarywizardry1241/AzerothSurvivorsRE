14013df60: 55 push rbp
14013df61: 4157 push r15
14013df63: 4156 push r14
14013df65: 4155 push r13
14013df67: 4154 push r12
14013df69: 56 push rsi
14013df6a: 57 push rdi
14013df6b: 53 push rbx
14013df6c: 4881ec88000000 sub rsp, 0x88
14013df73: 488dac2480000000 lea rbp, [rsp + 0x80]
14013df7b: 0f297df0 movaps xmmword ptr [rbp - 0x10], xmm7
14013df7f: 660f7f75e0 movdqa xmmword ptr [rbp - 0x20], xmm6
14013df84: 48c745d8feffffff mov qword ptr [rbp - 0x28], 0xfffffffffffffffe
14013df8c: 4489cf mov edi, r9d
14013df8f: 4489c3 mov ebx, r8d
14013df92: 4989d6 mov r14, rdx
14013df95: 4889ce mov rsi, rcx
14013df98: 4c8bbd90000000 mov r15, qword ptr [rbp + 0x90]
14013df9f: 4c8b4570 mov r8, qword ptr [rbp + 0x70]
14013dfa3: 48c745b800000000 mov qword ptr [rbp - 0x48], 0
14013dfab: 48c745c004000000 mov qword ptr [rbp - 0x40], 4
14013dfb3: 48c745c800000000 mov qword ptr [rbp - 0x38], 0
14013dfbb: 4d85ff test r15, r15
14013dfbe: 0f8492000000 je 0x14013e056
14013dfc4: 49c7461000000000 mov qword ptr [r14 + 0x10], 0
14013dfcc: 498b5618 mov rdx, qword ptr [r14 + 0x18]
14013dfd0: 4c89f1 mov rcx, r14
14013dfd3: 4d89c1 mov r9, r8
14013dfd6: e845f0f4ff call 0x14008d020
14013dfdb: 90 nop
14013dfdc: 4c8ba588000000 mov r12, qword ptr [rbp + 0x88]
14013dfe3: f30f10bd80000000 movss xmm7, dword ptr [rbp + 0x80]
14013dfeb: 660f6e7578 movd xmm6, dword ptr [rbp + 0x78]
14013dff0: 4b8d047f lea rax, [r15 + r15*2]
14013dff4: 4d8d2cc4 lea r13, [r12 + rax*8]
14013dff8: 4c8d7db8 lea r15, [rbp - 0x48]
14013dffc: 4d39ec cmp r12, r13
14013dfff: 7441 je 0x14013e042
14013e001: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14013e010: 498b4e08 mov rcx, qword ptr [r14 + 8]
14013e014: 498b5610 mov rdx, qword ptr [r14 + 0x10]
14013e018: 4c89642428 mov qword ptr [rsp + 0x28], r12
14013e01d: f30f117c2420 movss dword ptr [rsp + 0x20], xmm7
14013e023: 48c744243002000000 mov qword ptr [rsp + 0x30], 2
14013e02c: 4d89f8 mov r8, r15
14013e02f: 660f6fde movdqa xmm3, xmm6
14013e033: e8989d0000 call 0x140147dd0
14013e038: 90 nop
14013e039: 4983c418 add r12, 0x18
14013e03d: 4d39ec cmp r12, r13
14013e040: 75ce jne 0x14013e010
14013e042: 4d8b7620 mov r14, qword ptr [r14 + 0x20]
14013e046: 40887dd7 mov byte ptr [rbp - 0x29], dil
14013e04a: 49837e1800 cmp qword ptr [r14 + 0x18], 0
14013e04f: 7547 jne 0x14013e098
14013e051: e90a010000 jmp 0x14013e160
14013e056: 49c7461000000000 mov qword ptr [r14 + 0x10], 0
14013e05e: 498b5618 mov rdx, qword ptr [r14 + 0x18]
14013e062: 4c89f1 mov rcx, r14
14013e065: 4d89c1 mov r9, r8
14013e068: e8b3eff4ff call 0x14008d020
14013e06d: 90 nop
14013e06e: 4d8b7e10 mov r15, qword ptr [r14 + 0x10]
14013e072: 4d85ff test r15, r15
14013e075: 0f8562010000 jne 0x14013e1dd
14013e07b: 4531ed xor r13d, r13d
14013e07e: 4d01fd add r13, r15
14013e081: 4c896dc8 mov qword ptr [rbp - 0x38], r13
14013e085: 4d8b7620 mov r14, qword ptr [r14 + 0x20]
14013e089: 40887dd7 mov byte ptr [rbp - 0x29], dil
14013e08d: 49837e1800 cmp qword ptr [r14 + 0x18], 0
14013e092: 0f84c8000000 je 0x14013e160
14013e098: 498d4e20 lea rcx, [r14 + 0x20]
14013e09c: 488d55d7 lea rdx, [rbp - 0x29]
14013e0a0: e8cbf3ecff call 0x14000d470
14013e0a5: 4989c0 mov r8, rax
14013e0a8: 49c1e839 shr r8, 0x39
14013e0ac: 498b0e mov rcx, qword ptr [r14]
14013e0af: 498b5608 mov rdx, qword ptr [r14 + 8]
14013e0b3: 66410f6ec0 movd xmm0, r8d
14013e0b8: 660f60c0 punpcklbw xmm0, xmm0
14013e0bc: f20f70c000 pshuflw xmm0, xmm0, 0
14013e0c1: 660f70c044 pshufd xmm0, xmm0, 0x44
14013e0c6: 4531c0 xor r8d, r8d
14013e0c9: 660f76c9 pcmpeqd xmm1, xmm1
14013e0cd: 4821d0 and rax, rdx
14013e0d0: f30f6f1401 movdqu xmm2, xmmword ptr [rcx + rax]
14013e0d5: 660f6fda movdqa xmm3, xmm2
14013e0d9: 660f74d8 pcmpeqb xmm3, xmm0
14013e0dd: 66440fd7cb pmovmskb r9d, xmm3
14013e0e2: 4585c9 test r9d, r9d
14013e0e5: 7429 je 0x14013e110
14013e0e7: f3450fbcd9 tzcnt r11d, r9d
14013e0ec: 4901c3 add r11, rax
14013e0ef: 4921d3 and r11, rdx
14013e0f2: 49c1e305 shl r11, 5
14013e0f6: 4989ca mov r10, rcx
14013e0f9: 4d29da sub r10, r11
14013e0fc: 413a7ae0 cmp dil, byte ptr [r10 - 0x20]
14013e100: 7429 je 0x14013e12b
14013e102: 458d51ff lea r10d, [r9 - 1]
14013e106: 664521ca and r10w, r9w
14013e10a: 4589d1 mov r9d, r10d
14013e10d: 75d8 jne 0x14013e0e7
14013e10f: 90 nop
14013e110: 660f74d1 pcmpeqb xmm2, xmm1
14013e114: 66440fd7ca pmovmskb r9d, xmm2
14013e119: 4585c9 test r9d, r9d
14013e11c: 7542 jne 0x14013e160
14013e11e: 4c01c0 add rax, r8
14013e121: 4883c010 add rax, 0x10
14013e125: 4983c010 add r8, 0x10
14013e129: eba2 jmp 0x14013e0cd
14013e12b: 41807ae800 cmp byte ptr [r10 - 0x18], 0
14013e130: 7449 je 0x14013e17b
14013e132: 410fb642eb movzx eax, byte ptr [r10 - 0x15]
14013e137: 8845d6 mov byte ptr [rbp - 0x2a], al
14013e13a: 410fb742e9 movzx eax, word ptr [r10 - 0x17]
14013e13f: 668945d4 mov word ptr [rbp - 0x2c], ax
14013e143: 498d52ec lea rdx, [r10 - 0x14]
14013e147: 498d4af0 lea rcx, [r10 - 0x10]
14013e14b: 458b42f4 mov r8d, dword ptr [r10 - 0xc]
14013e14f: 410fb642f8 movzx eax, byte ptr [r10 - 8]
14013e154: 48c1e020 shl rax, 0x20
14013e158: 4c09c0 or rax, r8
14013e15b: 41b001 mov r8b, 1
14013e15e: eb2a jmp 0x14013e18a
14013e160: 488d0d944dca05 lea rcx, [rip + 0x5ca4d94]
14013e167: 4c8d05aa4dca05 lea r8, [rip + 0x5ca4daa]
14013e16e: ba16000000 mov edx, 0x16
14013e173: e8f8b3c505 call 0x145d99570
14013e178: 90 nop
14013e179: 0f0b ud2
14013e17b: 498b4af0 mov rcx, qword ptr [r10 - 0x10]
14013e17f: 488d5168 lea rdx, [rcx + 0x68]
14013e183: 4883c16c add rcx, 0x6c
14013e187: 4531c0 xor r8d, r8d
14013e18a: 8b12 mov edx, dword ptr [rdx]
14013e18c: 8b09 mov ecx, dword ptr [rcx]
14013e18e: 4c8b4dc8 mov r9, qword ptr [rbp - 0x38]
14013e192: 4c894e10 mov qword ptr [rsi + 0x10], r9
14013e196: 0f1045b8 movups xmm0, xmmword ptr [rbp - 0x48]
14013e19a: 0f1106 movups xmmword ptr [rsi], xmm0
14013e19d: 885e2c mov byte ptr [rsi + 0x2c], bl
14013e1a0: 44884618 mov byte ptr [rsi + 0x18], r8b
14013e1a4: 440fb745d4 movzx r8d, word ptr [rbp - 0x2c]
14013e1a9: 6644894619 mov word ptr [rsi + 0x19], r8w
14013e1ae: 440fb645d6 movzx r8d, byte ptr [rbp - 0x2a]
14013e1b3: 4488461b mov byte ptr [rsi + 0x1b], r8b
14013e1b7: 89561c mov dword ptr [rsi + 0x1c], edx
14013e1ba: 894e20 mov dword ptr [rsi + 0x20], ecx
14013e1bd: 48894624 mov qword ptr [rsi + 0x24], rax
14013e1c1: 0f2875e0 movaps xmm6, xmmword ptr [rbp - 0x20]
14013e1c5: 0f287df0 movaps xmm7, xmmword ptr [rbp - 0x10]
14013e1c9: 4881c488000000 add rsp, 0x88
14013e1d0: 5b pop rbx
14013e1d1: 5f pop rdi
14013e1d2: 5e pop rsi
14013e1d3: 415c pop r12
14013e1d5: 415d pop r13
14013e1d7: 415e pop r14
14013e1d9: 415f pop r15
14013e1db: 5d pop rbp
14013e1dc: c3 ret
14013e1dd: 4d8b6608 mov r12, qword ptr [r14 + 8]
14013e1e1: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
14013e1ea: 488d4db8 lea rcx, [rbp - 0x48]
14013e1ee: 41b904000000 mov r9d, 4
14013e1f4: 31d2 xor edx, edx
14013e1f6: 4d89f8 mov r8, r15
14013e1f9: e872c7ab05 call 0x145bfa970
14013e1fe: 90 nop
14013e1ff: 4c8b6dc8 mov r13, qword ptr [rbp - 0x38]
14013e203: 4a8d0ced00000000 lea rcx, [r13*8]
14013e20b: 4c01e9 add rcx, r13
14013e20e: 48c1e102 shl rcx, 2
14013e212: 48034dc0 add rcx, qword ptr [rbp - 0x40]
14013e216: 4a8d04bd00000000 lea rax, [r15*4]
14013e21e: 4c8d04c0 lea r8, [rax + rax*8]
14013e222: 4c89e2 mov rdx, r12
14013e225: e8bdbeab05 call 0x145bfa0e7
14013e22a: e94ffeffff jmp 0x14013e07e
