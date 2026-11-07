0x14589c030: 55 push rbp
0x14589c031: 4157 push r15
0x14589c033: 4156 push r14
0x14589c035: 4154 push r12
0x14589c037: 56 push rsi
0x14589c038: 57 push rdi
0x14589c039: 53 push rbx
0x14589c03a: 4883ec30 sub rsp, 0x30
0x14589c03e: 488d6c2430 lea rbp, [rsp + 0x30]
0x14589c043: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x14589c04b: 4d89c4 mov r12, r8
0x14589c04e: 4889d3 mov rbx, rdx
0x14589c051: 4889ce mov rsi, rcx
0x14589c054: 450fb67038 movzx r14d, byte ptr [r8 + 0x38]
0x14589c059: 498b7820 mov rdi, qword ptr [r8 + 0x20]
0x14589c05d: 498b5028 mov rdx, qword ptr [r8 + 0x28]
0x14589c061: 4889f9 mov rcx, rdi
0x14589c064: e86710ffff call 0x14588d0d0
0x14589c069: 488b4b20 mov rcx, qword ptr [rbx + 0x20]
0x14589c06d: 488b5328 mov rdx, qword ptr [rbx + 0x28]
0x14589c071: 48c1e204 shl rdx, 4
0x14589c075: 4531c0 xor r8d, r8d
0x14589c078: 0f1f840000000000 nop dword ptr [rax + rax]
0x14589c080: 4c39c2 cmp rdx, r8
0x14589c083: 7437 je 0x14589c0bc
0x14589c085: 4d8d4810 lea r9, [r8 + 0x10]
0x14589c089: 46383401 cmp byte ptr [rcx + r8], r14b
0x14589c08d: 4d89c8 mov r8, r9
0x14589c090: 75ee jne 0x14589c080
0x14589c092: 4e8b4409f8 mov r8, qword ptr [rcx + r9 - 8]
0x14589c097: 4983f80c cmp r8, 0xc
0x14589c09b: 41b90c000000 mov r9d, 0xc
0x14589c0a1: 4d0f42c8 cmovb r9, r8
0x14589c0a5: 4d85c0 test r8, r8
0x14589c0a8: 41b801000000 mov r8d, 1
0x14589c0ae: 4d0f45c1 cmovne r8, r9
0x14589c0b2: 4c39c0 cmp rax, r8
0x14589c0b5: 7314 jae 0x14589c0cb
0x14589c0b7: e9af000000 jmp 0x14589c16b
0x14589c0bc: 41b801000000 mov r8d, 1
0x14589c0c2: 4c39c0 cmp rax, r8
0x14589c0c5: 0f82a0000000 jb 0x14589c16b
0x14589c0cb: 31c0 xor eax, eax
0x14589c0cd: 4531c0 xor r8d, r8d
0x14589c0d0: 4c39c2 cmp rdx, r8
0x14589c0d3: 742b je 0x14589c100
0x14589c0d5: 4d8d4810 lea r9, [r8 + 0x10]
0x14589c0d9: 46383401 cmp byte ptr [rcx + r8], r14b
0x14589c0dd: 4d89c8 mov r8, r9
0x14589c0e0: 75ee jne 0x14589c0d0
0x14589c0e2: 4a8b4c09f8 mov rcx, qword ptr [rcx + r9 - 8]
0x14589c0e7: 4885c9 test rcx, rcx
0x14589c0ea: 7412 je 0x14589c0fe
0x14589c0ec: 4883f90c cmp rcx, 0xc
0x14589c0f0: b80c000000 mov eax, 0xc
0x14589c0f5: 480f42c1 cmovb rax, rcx
0x14589c0f9: 48ffc8 dec rax
0x14589c0fc: eb02 jmp 0x14589c100
0x14589c0fe: 31c0 xor eax, eax
0x14589c100: 4869c0f0000000 imul rax, rax, 0xf0
0x14589c107: 488d0d82223401 lea rcx, [rip + 0x1342282]
0x14589c10e: 4c8b7c0808 mov r15, qword ptr [rax + rcx + 8]
0x14589c113: 488b5c0810 mov rbx, qword ptr [rax + rcx + 0x10]
0x14589c118: e8e36076fa call 0x140002200
0x14589c11d: ba01000000 mov edx, 1
0x14589c122: 4889d9 mov rcx, rbx
0x14589c125: e8966076fa call 0x1400021c0
0x14589c12a: 4885c0 test rax, rax
0x14589c12d: 0f8480000000 je 0x14589c1b3
0x14589c133: 4989c6 mov r14, rax
0x14589c136: 4889c1 mov rcx, rax
0x14589c139: 4c89fa mov rdx, r15
0x14589c13c: 4989d8 mov r8, rbx
0x14589c13f: e8a3df3500 call 0x145bfa0e7
0x14589c144: 498b542418 mov rdx, qword ptr [r12 + 0x18]
0x14589c149: 4885d2 test rdx, rdx
0x14589c14c: 740e je 0x14589c15c
0x14589c14e: 41b801000000 mov r8d, 1
0x14589c154: 4889f9 mov rcx, rdi
0x14589c157: e8746076fa call 0x1400021d0
0x14589c15c: 49895c2418 mov qword ptr [r12 + 0x18], rbx
0x14589c161: 4d89742420 mov qword ptr [r12 + 0x20], r14
0x14589c166: 49895c2428 mov qword ptr [r12 + 0x28], rbx
0x14589c16b: 410f100424 movups xmm0, xmmword ptr [r12]
0x14589c170: 498b442410 mov rax, qword ptr [r12 + 0x10]
0x14589c175: 498b4c2418 mov rcx, qword ptr [r12 + 0x18]
0x14589c17a: 498b542420 mov rdx, qword ptr [r12 + 0x20]
0x14589c17f: 4d8b442428 mov r8, qword ptr [r12 + 0x28]
0x14589c184: 410f104c2430 movups xmm1, xmmword ptr [r12 + 0x30]
0x14589c18a: 0f114e30 movups xmmword ptr [rsi + 0x30], xmm1
0x14589c18e: 48895620 mov qword ptr [rsi + 0x20], rdx
0x14589c192: 4c894628 mov qword ptr [rsi + 0x28], r8
0x14589c196: 48894610 mov qword ptr [rsi + 0x10], rax
0x14589c19a: 48894e18 mov qword ptr [rsi + 0x18], rcx
0x14589c19e: 0f1106 movups xmmword ptr [rsi], xmm0
0x14589c1a1: 4889f0 mov rax, rsi
0x14589c1a4: 4883c430 add rsp, 0x30
0x14589c1a8: 5b pop rbx
0x14589c1a9: 5f pop rdi
0x14589c1aa: 5e pop rsi
0x14589c1ab: 415c pop r12
0x14589c1ad: 415e pop r14
0x14589c1af: 415f pop r15
0x14589c1b1: 5d pop rbp
0x14589c1b2: c3 ret
0x14589c1b3: 4c8965f0 mov qword ptr [rbp - 0x10], r12
0x14589c1b7: b901000000 mov ecx, 1
0x14589c1bc: 4889da mov rdx, rbx
0x14589c1bf: e8f7d04f00 call 0x145d992bb
0x14589c1c4: 90 nop
0x14589c1c5: 0f0b ud2
