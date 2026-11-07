1459d08c0: 55 push rbp
1459d08c1: 4157 push r15
1459d08c3: 4156 push r14
1459d08c5: 4155 push r13
1459d08c7: 4154 push r12
1459d08c9: 56 push rsi
1459d08ca: 57 push rdi
1459d08cb: 53 push rbx
1459d08cc: 4881ece8000000 sub rsp, 0xe8
1459d08d3: 488dac2480000000 lea rbp, [rsp + 0x80]
1459d08db: 48c74560feffffff mov qword ptr [rbp + 0x60], 0xfffffffffffffffe
1459d08e3: 4989d6 mov r14, rdx
1459d08e6: 4889ce mov rsi, rcx
1459d08e9: 488d8288000000 lea rax, [rdx + 0x88]
1459d08f0: 488945b0 mov qword ptr [rbp - 0x50], rax
1459d08f4: 833a01 cmp dword ptr [rdx], 1
1459d08f7: 7548 jne 0x1459d0941
1459d08f9: 498b5608 mov rdx, qword ptr [r14 + 8]
1459d08fd: 498b4610 mov rax, qword ptr [r14 + 0x10]
1459d0901: 498b8e88000000 mov rcx, qword ptr [r14 + 0x88]
1459d0908: 0f1f840000000000 nop dword ptr [rax + rax]
1459d0910: 4839d0 cmp rax, rdx
1459d0913: 742c je 0x1459d0941
1459d0915: 4c8d4201 lea r8, [rdx + 1]
1459d0919: 4d894608 mov qword ptr [r14 + 8], r8
1459d091d: 498b7cd618 mov rdi, qword ptr [r14 + rdx*8 + 0x18]
1459d0922: 488b5110 mov rdx, qword ptr [rcx + 0x10]
1459d0926: 4839d7 cmp rdi, rdx
1459d0929: 0f8351020000 jae 0x1459d0b80
1459d092f: 488b5108 mov rdx, qword ptr [rcx + 8]
1459d0933: 803c3a00 cmp byte ptr [rdx + rdi], 0
1459d0937: 4c89c2 mov rdx, r8
1459d093a: 75d4 jne 0x1459d0910
1459d093c: e982000000 jmp 0x1459d09c3
1459d0941: 49c70600000000 mov qword ptr [r14], 0
1459d0948: 49837e7000 cmp qword ptr [r14 + 0x70], 0
1459d094d: 7419 je 0x1459d0968
1459d094f: 498d4e70 lea rcx, [r14 + 0x70]
1459d0953: 488d55b0 lea rdx, [rbp - 0x50]
1459d0957: 4d89f0 mov r8, r14
1459d095a: e831c20100 call 0x1459ecb90
1459d095f: a801 test al, 1
1459d0961: 7405 je 0x1459d0968
1459d0963: 4889d7 mov rdi, rdx
1459d0966: eb5b jmp 0x1459d09c3
1459d0968: 49c70600000000 mov qword ptr [r14], 0
1459d096f: 41837e3801 cmp dword ptr [r14 + 0x38], 1
1459d0974: 0f85b4010000 jne 0x1459d0b2e
1459d097a: 498b5640 mov rdx, qword ptr [r14 + 0x40]
1459d097e: 498b4648 mov rax, qword ptr [r14 + 0x48]
1459d0982: 488b4db0 mov rcx, qword ptr [rbp - 0x50]
1459d0986: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459d0990: 4839d0 cmp rax, rdx
1459d0993: 0f8495010000 je 0x1459d0b2e
1459d0999: 4c8d4201 lea r8, [rdx + 1]
1459d099d: 4d894640 mov qword ptr [r14 + 0x40], r8
1459d09a1: 498b7cd650 mov rdi, qword ptr [r14 + rdx*8 + 0x50]
1459d09a6: 4c8b09 mov r9, qword ptr [rcx]
1459d09a9: 498b5110 mov rdx, qword ptr [r9 + 0x10]
1459d09ad: 4839d7 cmp rdi, rdx
1459d09b0: 0f83ca010000 jae 0x1459d0b80
1459d09b6: 498b5108 mov rdx, qword ptr [r9 + 8]
1459d09ba: 803c3a00 cmp byte ptr [rdx + rdi], 0
1459d09be: 4c89c2 mov rdx, r8
1459d09c1: 75cd jne 0x1459d0990
1459d09c3: e8381863fa call 0x140002200
1459d09c8: b920000000 mov ecx, 0x20
1459d09cd: ba08000000 mov edx, 8
1459d09d2: e8e91763fa call 0x1400021c0
1459d09d7: 4885c0 test rax, rax
1459d09da: 0f84b1010000 je 0x1459d0b91
1459d09e0: 4889c3 mov rbx, rax
1459d09e3: 488938 mov qword ptr [rax], rdi
1459d09e6: 48c7454804000000 mov qword ptr [rbp + 0x48], 4
1459d09ee: 48894550 mov qword ptr [rbp + 0x50], rax
1459d09f2: 48c7455801000000 mov qword ptr [rbp + 0x58], 1
1459d09fa: 488d7db0 lea rdi, [rbp - 0x50]
1459d09fe: 41b890000000 mov r8d, 0x90
1459d0a04: 4889f9 mov rcx, rdi
1459d0a07: 4c89f2 mov rdx, r14
1459d0a0a: e88c472300 call 0x145c0519b
1459d0a0f: 4c8d7d38 lea r15, [rbp + 0x38]
1459d0a13: 41be01000000 mov r14d, 1
1459d0a19: 4c8d6540 lea r12, [rbp + 0x40]
1459d0a1d: eb10 jmp 0x1459d0a2f
1459d0a1f: 90 nop
1459d0a20: 488b5d50 mov rbx, qword ptr [rbp + 0x50]
1459d0a24: 4e892cf3 mov qword ptr [rbx + r14*8], r13
1459d0a28: 49ffc6 inc r14
1459d0a2b: 4c897558 mov qword ptr [rbp + 0x58], r14
1459d0a2f: 4c897d40 mov qword ptr [rbp + 0x40], r15
1459d0a33: 837db001 cmp dword ptr [rbp - 0x50], 1
1459d0a37: 7547 jne 0x1459d0a80
1459d0a39: 488b55b8 mov rdx, qword ptr [rbp - 0x48]
1459d0a3d: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1459d0a41: 488b4d38 mov rcx, qword ptr [rbp + 0x38]
1459d0a45: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459d0a50: 4839d0 cmp rax, rdx
1459d0a53: 742b je 0x1459d0a80
1459d0a55: 4c8d4201 lea r8, [rdx + 1]
1459d0a59: 4c8945b8 mov qword ptr [rbp - 0x48], r8
1459d0a5d: 4c8b6cd5c8 mov r13, qword ptr [rbp + rdx*8 - 0x38]
1459d0a62: 488b5110 mov rdx, qword ptr [rcx + 0x10]
1459d0a66: 4939d5 cmp r13, rdx
1459d0a69: 0f83ff000000 jae 0x1459d0b6e
1459d0a6f: 488b5108 mov rdx, qword ptr [rcx + 8]
1459d0a73: 42803c2a00 cmp byte ptr [rdx + r13], 0
1459d0a78: 4c89c2 mov rdx, r8
1459d0a7b: 75d3 jne 0x1459d0a50
1459d0a7d: eb6d jmp 0x1459d0aec
1459d0a7f: 90 nop
1459d0a80: 48c745b000000000 mov qword ptr [rbp - 0x50], 0
1459d0a88: 48837d2000 cmp qword ptr [rbp + 0x20], 0
1459d0a8d: 7417 je 0x1459d0aa6
1459d0a8f: 488d4d20 lea rcx, [rbp + 0x20]
1459d0a93: 4c89e2 mov rdx, r12
1459d0a96: 4989f8 mov r8, rdi
1459d0a99: e8f2c00100 call 0x1459ecb90
1459d0a9e: 90 nop
1459d0a9f: 4989d5 mov r13, rdx
1459d0aa2: a801 test al, 1
1459d0aa4: 7546 jne 0x1459d0aec
1459d0aa6: 48c745b000000000 mov qword ptr [rbp - 0x50], 0
1459d0aae: 837de801 cmp dword ptr [rbp - 0x18], 1
1459d0ab2: 7569 jne 0x1459d0b1d
1459d0ab4: 488b55f0 mov rdx, qword ptr [rbp - 0x10]
1459d0ab8: 488b45f8 mov rax, qword ptr [rbp - 8]
1459d0abc: 488b4d40 mov rcx, qword ptr [rbp + 0x40]
1459d0ac0: 4839d0 cmp rax, rdx
1459d0ac3: 7458 je 0x1459d0b1d
1459d0ac5: 4c8d4201 lea r8, [rdx + 1]
1459d0ac9: 4c8945f0 mov qword ptr [rbp - 0x10], r8
1459d0acd: 4c8b6cd500 mov r13, qword ptr [rbp + rdx*8]
1459d0ad2: 4c8b09 mov r9, qword ptr [rcx]
1459d0ad5: 498b5110 mov rdx, qword ptr [r9 + 0x10]
1459d0ad9: 4939d5 cmp r13, rdx
1459d0adc: 737e jae 0x1459d0b5c
1459d0ade: 498b5108 mov rdx, qword ptr [r9 + 8]
1459d0ae2: 42803c2a00 cmp byte ptr [rdx + r13], 0
1459d0ae7: 4c89c2 mov rdx, r8
1459d0aea: 75d4 jne 0x1459d0ac0
1459d0aec: 4c3b7548 cmp r14, qword ptr [rbp + 0x48]
1459d0af0: 0f852effffff jne 0x1459d0a24
1459d0af6: 48c744242008000000 mov qword ptr [rsp + 0x20], 8
1459d0aff: 41b801000000 mov r8d, 1
1459d0b05: 41b908000000 mov r9d, 8
1459d0b0b: 488d4d48 lea rcx, [rbp + 0x48]
1459d0b0f: 4c89f2 mov rdx, r14
1459d0b12: e819772300 call 0x145c08230
1459d0b17: 90 nop
1459d0b18: e903ffffff jmp 0x1459d0a20
1459d0b1d: 488b4558 mov rax, qword ptr [rbp + 0x58]
1459d0b21: 48894610 mov qword ptr [rsi + 0x10], rax
1459d0b25: 0f104548 movups xmm0, xmmword ptr [rbp + 0x48]
1459d0b29: 0f1106 movups xmmword ptr [rsi], xmm0
1459d0b2c: eb17 jmp 0x1459d0b45
1459d0b2e: 48c70600000000 mov qword ptr [rsi], 0
1459d0b35: 48c7460808000000 mov qword ptr [rsi + 8], 8
1459d0b3d: 48c7461000000000 mov qword ptr [rsi + 0x10], 0
1459d0b45: 4889f0 mov rax, rsi
1459d0b48: 4881c4e8000000 add rsp, 0xe8
1459d0b4f: 5b pop rbx
1459d0b50: 5f pop rdi
1459d0b51: 5e pop rsi
1459d0b52: 415c pop r12
1459d0b54: 415d pop r13
1459d0b56: 415e pop r14
1459d0b58: 415f pop r15
1459d0b5a: 5d pop rbp
1459d0b5b: c3 ret
1459d0b5c: 4c8d0575258701 lea r8, [rip + 0x1872575]
1459d0b63: 4c89e9 mov rcx, r13
1459d0b66: e8d83a3d00 call 0x145da4643
1459d0b6b: 90 nop
1459d0b6c: eb10 jmp 0x1459d0b7e
1459d0b6e: 4c8d0563258701 lea r8, [rip + 0x1872563]
1459d0b75: 4c89e9 mov rcx, r13
1459d0b78: e8c63a3d00 call 0x145da4643
1459d0b7d: 90 nop
1459d0b7e: 0f0b ud2
1459d0b80: 4c8d0551258701 lea r8, [rip + 0x1872551]
1459d0b87: 4889f9 mov rcx, rdi
1459d0b8a: e8b43a3d00 call 0x145da4643
1459d0b8f: 0f0b ud2
1459d0b91: b908000000 mov ecx, 8
1459d0b96: ba20000000 mov edx, 0x20
1459d0b9b: e80b373d00 call 0x145da42ab
1459d0ba0: 0f0b ud2
