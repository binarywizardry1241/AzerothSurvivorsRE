145944310: 55 push rbp
145944311: 4157 push r15
145944313: 4156 push r14
145944315: 4155 push r13
145944317: 4154 push r12
145944319: 56 push rsi
14594431a: 57 push rdi
14594431b: 53 push rbx
14594431c: 4881ec68010000 sub rsp, 0x168
145944323: 488dac2480000000 lea rbp, [rsp + 0x80]
14594432b: 66440f7f8dd0000000 movdqa xmmword ptr [rbp + 0xd0], xmm9
145944334: 440f2985c0000000 movaps xmmword ptr [rbp + 0xc0], xmm8
14594433c: 0f29bdb0000000 movaps xmmword ptr [rbp + 0xb0], xmm7
145944343: 0f29b5a0000000 movaps xmmword ptr [rbp + 0xa0], xmm6
14594434a: 48c78598000000feffffff mov qword ptr [rbp + 0x98], 0xfffffffffffffffe
145944355: 4d89ce mov r14, r9
145944358: 4589c4 mov r12d, r8d
14594435b: 4189d7 mov r15d, edx
14594435e: 4889cf mov rdi, rcx
145944361: 488b89a8020000 mov rcx, qword ptr [rcx + 0x2a8]
145944368: 488b97b0020000 mov rdx, qword ptr [rdi + 0x2b0]
14594436f: e84c4af5ff call 0x145898dc0
145944374: 4869f0f0000000 imul rsi, rax, 0xf0
14594437b: 488d1daee22a01 lea rbx, [rip + 0x12ae2ae]
145944382: f2410f1036 movsd xmm6, qword ptr [r14]
145944387: f20f10bc1ec8000000 movsd xmm7, qword ptr [rsi + rbx + 0xc8]
145944390: 440f28c6 movaps xmm8, xmm6
145944394: 440f5cc7 subps xmm8, xmm7
145944398: f3410f16c8 movshdup xmm1, xmm8
14594439d: 410f28c0 movaps xmm0, xmm8
1459443a1: e889602c00 call 0x145c0a42f
1459443a6: f30f108c1ed8000000 movss xmm1, dword ptr [rsi + rbx + 0xd8]
1459443af: f30f580d0d574800 addss xmm1, dword ptr [rip + 0x48570d]
1459443b7: f30f5f0da18e4600 maxss xmm1, dword ptr [rip + 0x468ea1]
1459443bf: 0f2ec8 ucomiss xmm1, xmm0
1459443c2: 7351 jae 0x145944415
1459443c4: f30f12c0 movsldup xmm0, xmm0
1459443c8: 440f5ec0 divps xmm8, xmm0
1459443cc: f30f12c1 movsldup xmm0, xmm1
1459443d0: 410f59c0 mulps xmm0, xmm8
1459443d4: 0f58f8 addps xmm7, xmm0
1459443d7: f30f16f7 movshdup xmm6, xmm7
1459443db: 4c8bb7b0090000 mov r14, qword ptr [rdi + 0x9b0]
1459443e2: 498d4e10 lea rcx, [r14 + 0x10]
1459443e6: 0f28cf movaps xmm1, xmm7
1459443e9: 0f28d6 movaps xmm2, xmm6
1459443ec: e84fc7f5ff call 0x1458a0b40
1459443f1: a801 test al, 1
1459443f3: 751d jne 0x145944412
1459443f5: 49837e68ff cmp qword ptr [r14 + 0x68], -1
1459443fa: 7416 je 0x145944412
1459443fc: 4983c668 add r14, 0x68
145944400: 488d4d60 lea rcx, [rbp + 0x60]
145944404: 4c89f2 mov rdx, r14
145944407: 0f28d7 movaps xmm2, xmm7
14594440a: 0f28de movaps xmm3, xmm6
14594440d: e84e09f6ff call 0x1458a4d60
145944412: 0f28f7 movaps xmm6, xmm7
145944415: 41be05000000 mov r14d, 5
14594441b: 4489f8 mov eax, r15d
14594441e: 488d0d2b822c01 lea rcx, [rip + 0x12c822b]
145944425: 48630481 movsxd rax, dword ptr [rcx + rax*4]
145944429: 4801c8 add rax, rcx
14594442c: ffe0 jmp rax
14594442e: 488b8718060000 mov rax, qword ptr [rdi + 0x618]
145944435: 4885c0 test rax, rax
145944438: 0f84ab020000 je 0x1459446e9
14594443e: 488b8f10060000 mov rcx, qword ptr [rdi + 0x610]
145944445: 31d2 xor edx, edx
145944447: 4883f801 cmp rax, 1
14594444b: 0f85c4010000 jne 0x145944615
145944451: 4531c9 xor r9d, r9d
145944454: 4531c0 xor r8d, r8d
145944457: e90d020000 jmp 0x145944669
145944615: 4989c2 mov r10, rax
145944618: 4983e2fe and r10, 0xfffffffffffffffe
14594461c: 4c8d5968 lea r11, [rcx + 0x68]
145944620: 4531c9 xor r9d, r9d
145944623: 4531c0 xor r8d, r8d
145944626: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
145944630: 418b73b0 mov esi, dword ptr [r11 - 0x50]
145944634: 83f601 xor esi, 1
145944637: 41837bb800 cmp dword ptr [r11 - 0x48], 0
14594463c: 0f45f2 cmovne esi, edx
14594463f: 4c01c6 add rsi, r8
145944642: 458b43f8 mov r8d, dword ptr [r11 - 8]
145944646: 4183f001 xor r8d, 1
14594464a: 41833b00 cmp dword ptr [r11], 0
14594464e: 440f45c2 cmovne r8d, edx
145944652: 4901f0 add r8, rsi
145944655: 4983c102 add r9, 2
145944659: 4981c390000000 add r11, 0x90
145944660: 4d39ca cmp r10, r9
145944663: 75cb jne 0x145944630
145944665: a801 test al, 1
145944667: 741a je 0x145944683
145944669: 4f8d0cc9 lea r9, [r9 + r9*8]
14594466d: 468b54c918 mov r10d, dword ptr [rcx + r9*8 + 0x18]
145944672: 4183f201 xor r10d, 1
145944676: 42837cc92000 cmp dword ptr [rcx + r9*8 + 0x20], 0
14594467c: 410f44d2 cmove edx, r10d
145944680: 4901d0 add r8, rdx
145944683: 4983f82d cmp r8, 0x2d
145944687: 7260 jb 0x1459446e9
145944689: 48c1e003 shl rax, 3
14594468d: 488d04c0 lea rax, [rax + rax*8]
145944691: 31d2 xor edx, edx
145944693: eb14 jmp 0x1459446a9
1459446a9: 837c112000 cmp dword ptr [rcx + rdx + 0x20], 0
1459446ae: 75f0 jne 0x1459446a0
1459446b0: 837c111801 cmp dword ptr [rcx + rdx + 0x18], 1
1459446b5: 74e9 je 0x1459446a0
1459446b7: 4c8d48b8 lea r9, [rax - 0x48]
1459446bb: 4c8d0411 lea r8, [rcx + rdx]
1459446bf: 4939d1 cmp r9, rdx
1459446c2: 0f84810d0000 je 0x145945449
1459446c8: 4829d0 sub rax, rdx
1459446cb: 4883c0b8 add rax, -0x48
1459446cf: 4801d1 add rcx, rdx
1459446d2: 4883c148 add rcx, 0x48
1459446d6: 48ba8fe3388ee3388ee3 movabs rdx, 0xe38e38e38e38e38f
1459446e0: 48f7e2 mul rdx
1459446e3: 48c1ea06 shr rdx, 6
1459446e7: eb67 jmp 0x145944750
1459446e9: 8b9f780a0000 mov ebx, dword ptr [rdi + 0xa78]
1459446ef: ffc3 inc ebx
1459446f1: 899f780a0000 mov dword ptr [rdi + 0xa78], ebx
1459446f7: 81e3ffffff00 and ebx, 0xffffff
1459446fd: 48b800000029230030f1 movabs rax, 0xf130002329000000
145944707: 31c9 xor ecx, ecx
145944709: 4183fc04 cmp r12d, 4
14594470d: 0f93c2 setae dl
145944710: 4183fc14 cmp r12d, 0x14
145944714: 41b8cb400000 mov r8d, 0x40cb
14594471a: 41be21070000 mov r14d, 0x721
145944720: 450f43f0 cmovae r14d, r8d
145944724: 0f837e000000 jae 0x1459447a8
14594472a: 88d1 mov cl, dl
14594472c: 488d153d472c01 lea rdx, [rip + 0x12c473d]
145944733: 66440f6e0c8a movd xmm9, dword ptr [rdx + rcx*4]
145944739: eb76 jmp 0x1459447b1
145944740: 4989c0 mov r8, rax
145944743: 4883c148 add rcx, 0x48
145944747: 48ffca dec rdx
14594474a: 0f84f20c0000 je 0x145945442
145944750: 83792000 cmp dword ptr [rcx + 0x20], 0
145944754: 75ed jne 0x145944743
145944756: 80791800 cmp byte ptr [rcx + 0x18], 0
14594475a: 75e7 jne 0x145944743
14594475c: f2410f104034 movsd xmm0, qword ptr [r8 + 0x34]
145944762: 0f5cc6 subps xmm0, xmm6
145944765: 0f59c0 mulps xmm0, xmm0
145944768: f20f104934 movsd xmm1, qword ptr [rcx + 0x34]
14594476d: 0f5cce subps xmm1, xmm6
145944770: 0f59c9 mulps xmm1, xmm1
145944773: f20f7cc1 haddps xmm0, xmm1
145944777: 0fc6c0e8 shufps xmm0, xmm0, 0xe8
14594477b: 0f28c8 movaps xmm1, xmm0
14594477e: 660f72e11f psrad xmm1, 0x1f
145944783: 660f72d101 psrld xmm1, 1
145944788: 660fefc8 pxor xmm1, xmm0
14594478c: 660f70c155 pshufd xmm0, xmm1, 0x55
145944791: 660f66c8 pcmpgtd xmm1, xmm0
145944795: 66410f7ec9 movd r9d, xmm1
14594479a: 4889c8 mov rax, rcx
14594479d: 41f6c101 test r9b, 1
1459447a1: 759d jne 0x145944740
1459447a3: 4c89c0 mov rax, r8
1459447a6: eb98 jmp 0x145944740
1459447a8: 66440f6e0d5bcf4600 movd xmm9, dword ptr [rip + 0x46cf5b]
1459447b1: 4809c3 or rbx, rax
1459447b4: 488bb7b0090000 mov rsi, qword ptr [rdi + 0x9b0]
1459447bb: 488d4e10 lea rcx, [rsi + 0x10]
1459447bf: f3440f16c6 movshdup xmm8, xmm6
1459447c4: 0f28ce movaps xmm1, xmm6
1459447c7: 410f28d0 movaps xmm2, xmm8
1459447cb: e870c3f5ff call 0x1458a0b40
1459447d0: a801 test al, 1
1459447d2: 7405 je 0x1459447d9
1459447d4: 0f28f8 movaps xmm7, xmm0
1459447d7: eb30 jmp 0x145944809
1459447d9: 48837e68ff cmp qword ptr [rsi + 0x68], -1
1459447de: 7421 je 0x145944801
1459447e0: 488d5668 lea rdx, [rsi + 0x68]
1459447e4: 488d4d60 lea rcx, [rbp + 0x60]
1459447e8: 0f28d6 movaps xmm2, xmm6
1459447eb: 410f28d8 movaps xmm3, xmm8
1459447ef: e86c05f6ff call 0x1458a4d60
1459447f4: 837d6001 cmp dword ptr [rbp + 0x60], 1
1459447f8: 7507 jne 0x145944801
1459447fa: f30f107d6c movss xmm7, dword ptr [rbp + 0x6c]
1459447ff: eb08 jmp 0x145944809
145944801: f30f10beb8000000 movss xmm7, dword ptr [rsi + 0xb8]
145944809: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
145944811: 48c7455000000000 mov qword ptr [rbp + 0x50], 0
145944819: 4c8d7d40 lea r15, [rbp + 0x40]
14594481d: 4c89f9 mov rcx, r15
145944820: 31d2 xor edx, edx
145944822: 4989d8 mov r8, rbx
145944825: e886d1f7ff call 0x1458c19b0
14594482a: 90 nop
14594482b: 488b4540 mov rax, qword ptr [rbp + 0x40]
14594482f: 4885c0 test rax, rax
145944832: 7462 je 0x145944896
145944896: 31c0 xor eax, eax
145944898: 4c897d60 mov qword ptr [rbp + 0x60], r15
14594489c: 48894568 mov qword ptr [rbp + 0x68], rax
1459448a0: 48c7457000000000 mov qword ptr [rbp + 0x70], 0
1459448a8: 4c894578 mov qword ptr [rbp + 0x78], r8
1459448ac: 48c7858000000002000000 mov qword ptr [rbp + 0x80], 2
1459448b7: 488d4d20 lea rcx, [rbp + 0x20]
1459448bb: 488d5560 lea rdx, [rbp + 0x60]
1459448bf: 41b809000000 mov r8d, 9
1459448c5: e82699f9ff call 0x1458de1f0
1459448ca: 90 nop
1459448cb: 488b4540 mov rax, qword ptr [rbp + 0x40]
1459448cf: 4885c0 test rax, rax
1459448d2: 7462 je 0x145944936
145944936: 31c0 xor eax, eax
145944938: 4c897d60 mov qword ptr [rbp + 0x60], r15
14594493c: 48894568 mov qword ptr [rbp + 0x68], rax
145944940: 48c7457000000000 mov qword ptr [rbp + 0x70], 0
145944948: 4c894578 mov qword ptr [rbp + 0x78], r8
14594494c: 48c7858000000003000000 mov qword ptr [rbp + 0x80], 3
145944957: 488d4d20 lea rcx, [rbp + 0x20]
14594495b: 488d5560 lea rdx, [rbp + 0x60]
14594495f: 41b829230000 mov r8d, 0x2329
145944965: e88698f9ff call 0x1458de1f0
14594496a: 90 nop
14594496b: 488b4540 mov rax, qword ptr [rbp + 0x40]
14594496f: 4885c0 test rax, rax
145944972: 7460 je 0x1459449d4
1459449d4: 31c0 xor eax, eax
1459449d6: 66450f7ec8 movd r8d, xmm9
1459449db: 4c897d60 mov qword ptr [rbp + 0x60], r15
1459449df: 48894568 mov qword ptr [rbp + 0x68], rax
1459449e3: 48c7457000000000 mov qword ptr [rbp + 0x70], 0
1459449eb: 4c894d78 mov qword ptr [rbp + 0x78], r9
1459449ef: 48c7858000000004000000 mov qword ptr [rbp + 0x80], 4
1459449fa: 488d4d20 lea rcx, [rbp + 0x20]
1459449fe: 488d5560 lea rdx, [rbp + 0x60]
145944a02: e8e997f9ff call 0x1458de1f0
145944a07: 90 nop
145944a08: 488b4540 mov rax, qword ptr [rbp + 0x40]
145944a0c: 4885c0 test rax, rax
145944a0f: 7465 je 0x145944a76
145944a76: 31c0 xor eax, eax
145944a78: 4c897d60 mov qword ptr [rbp + 0x60], r15
145944a7c: 48894568 mov qword ptr [rbp + 0x68], rax
145944a80: 48c7457000000000 mov qword ptr [rbp + 0x70], 0
145944a88: 4c894578 mov qword ptr [rbp + 0x78], r8
145944a8c: 48c7858000000016000000 mov qword ptr [rbp + 0x80], 0x16
145944a97: 488d4d20 lea rcx, [rbp + 0x20]
145944a9b: 488d5560 lea rdx, [rbp + 0x60]
145944a9f: 41b801000000 mov r8d, 1
145944aa5: e84697f9ff call 0x1458de1f0
145944aaa: 90 nop
145944aab: 488b4540 mov rax, qword ptr [rbp + 0x40]
145944aaf: 4885c0 test rax, rax
145944ab2: 7462 je 0x145944b16
145944b16: 31c0 xor eax, eax
145944b18: 4c897d60 mov qword ptr [rbp + 0x60], r15
145944b1c: 48894568 mov qword ptr [rbp + 0x68], rax
145944b20: 48c7457000000000 mov qword ptr [rbp + 0x70], 0
145944b28: 4c894578 mov qword ptr [rbp + 0x78], r8
145944b2c: 48c785800000001c000000 mov qword ptr [rbp + 0x80], 0x1c
145944b37: 488d4d20 lea rcx, [rbp + 0x20]
145944b3b: 488d5560 lea rdx, [rbp + 0x60]
145944b3f: 41b801000000 mov r8d, 1
145944b45: e8a696f9ff call 0x1458de1f0
145944b4a: 90 nop
145944b4b: 488b4540 mov rax, qword ptr [rbp + 0x40]
145944b4f: 4885c0 test rax, rax
145944b52: 7462 je 0x145944bb6
145944bb6: 31c0 xor eax, eax
145944bb8: 4c897d60 mov qword ptr [rbp + 0x60], r15
145944bbc: 48894568 mov qword ptr [rbp + 0x68], rax
145944bc0: 48c7457000000000 mov qword ptr [rbp + 0x70], 0
145944bc8: 4c894578 mov qword ptr [rbp + 0x78], r8
145944bcc: 48c7858000000022000000 mov qword ptr [rbp + 0x80], 0x22
145944bd7: 488d4d20 lea rcx, [rbp + 0x20]
145944bdb: 488d5560 lea rdx, [rbp + 0x60]
145944bdf: 41b801000000 mov r8d, 1
145944be5: e80696f9ff call 0x1458de1f0
145944bea: 90 nop
145944beb: 488b4540 mov rax, qword ptr [rbp + 0x40]
145944bef: 4885c0 test rax, rax
145944bf2: 7462 je 0x145944c56
145944c56: 31c0 xor eax, eax
145944c58: 4c897d60 mov qword ptr [rbp + 0x60], r15
145944c5c: 48894568 mov qword ptr [rbp + 0x68], rax
145944c60: 48c7457000000000 mov qword ptr [rbp + 0x70], 0
145944c68: 4c894578 mov qword ptr [rbp + 0x78], r8
145944c6c: 48c7858000000023000000 mov qword ptr [rbp + 0x80], 0x23
145944c77: 488d4d20 lea rcx, [rbp + 0x20]
145944c7b: 488d5560 lea rdx, [rbp + 0x60]
145944c7f: 41b823000000 mov r8d, 0x23
145944c85: e86695f9ff call 0x1458de1f0
145944c8a: 90 nop
145944c8b: 488b4540 mov rax, qword ptr [rbp + 0x40]
145944c8f: 4885c0 test rax, rax
145944c92: 7462 je 0x145944cf6
145944cf6: 31c0 xor eax, eax
145944cf8: 4c897d60 mov qword ptr [rbp + 0x60], r15
145944cfc: 48894568 mov qword ptr [rbp + 0x68], rax
145944d00: 48c7457000000000 mov qword ptr [rbp + 0x70], 0
145944d08: 4c894578 mov qword ptr [rbp + 0x78], r8
145944d0c: 48c785800000002e000000 mov qword ptr [rbp + 0x80], 0x2e
145944d17: 488d4d20 lea rcx, [rbp + 0x20]
145944d1b: 488d5560 lea rdx, [rbp + 0x60]
145944d1f: 41b802000002 mov r8d, 0x2000002
145944d25: e8c694f9ff call 0x1458de1f0
145944d2a: 90 nop
145944d2b: 488b4540 mov rax, qword ptr [rbp + 0x40]
145944d2f: 4885c0 test rax, rax
145944d32: 7465 je 0x145944d99
145944d99: 31c0 xor eax, eax
145944d9b: 4c897d60 mov qword ptr [rbp + 0x60], r15
145944d9f: 48894568 mov qword ptr [rbp + 0x68], rax
145944da3: 48c7457000000000 mov qword ptr [rbp + 0x70], 0
145944dab: 4c894578 mov qword ptr [rbp + 0x78], r8
145944daf: 48c7858000000081000000 mov qword ptr [rbp + 0x80], 0x81
145944dba: 488d4d20 lea rcx, [rbp + 0x20]
145944dbe: 488d5560 lea rdx, [rbp + 0x60]
145944dc2: 41b8cdcccc3d mov r8d, 0x3dcccccd
145944dc8: e82394f9ff call 0x1458de1f0
145944dcd: 90 nop
145944dce: 488b4540 mov rax, qword ptr [rbp + 0x40]
145944dd2: 4885c0 test rax, rax
145944dd5: 7472 je 0x145944e49
145944e49: 31c0 xor eax, eax
145944e4b: 4c897d60 mov qword ptr [rbp + 0x60], r15
145944e4f: 48894568 mov qword ptr [rbp + 0x68], rax
145944e53: 48c7457000000000 mov qword ptr [rbp + 0x70], 0
145944e5b: 4c894578 mov qword ptr [rbp + 0x78], r8
145944e5f: 48c7858000000082000000 mov qword ptr [rbp + 0x80], 0x82
145944e6a: 488d4d20 lea rcx, [rbp + 0x20]
145944e6e: 488d5560 lea rdx, [rbp + 0x60]
145944e72: 41b8cdcccc3d mov r8d, 0x3dcccccd
145944e78: e87393f9ff call 0x1458de1f0
145944e7d: 90 nop
145944e7e: 488b4540 mov rax, qword ptr [rbp + 0x40]
145944e82: 4885c0 test rax, rax
145944e85: 746e je 0x145944ef5
145944ef5: 31c0 xor eax, eax
145944ef7: 4c897d60 mov qword ptr [rbp + 0x60], r15
145944efb: 48894568 mov qword ptr [rbp + 0x68], rax
145944eff: 48c7457000000000 mov qword ptr [rbp + 0x70], 0
145944f07: 4c894578 mov qword ptr [rbp + 0x78], r8
145944f0b: 48c7858000000083000000 mov qword ptr [rbp + 0x80], 0x83
145944f16: 488d4d20 lea rcx, [rbp + 0x20]
145944f1a: 488d5560 lea rdx, [rbp + 0x60]
145944f1e: 4589f0 mov r8d, r14d
145944f21: e8ca92f9ff call 0x1458de1f0
145944f26: 90 nop
145944f27: 488b4540 mov rax, qword ptr [rbp + 0x40]
145944f2b: 4885c0 test rax, rax
145944f2e: 7465 je 0x145944f95
145944f95: 31c0 xor eax, eax
145944f97: 4c897d60 mov qword ptr [rbp + 0x60], r15
145944f9b: 48894568 mov qword ptr [rbp + 0x68], rax
145944f9f: 48c7457000000000 mov qword ptr [rbp + 0x70], 0
145944fa7: 4c894578 mov qword ptr [rbp + 0x78], r8
145944fab: 48c7858000000084000000 mov qword ptr [rbp + 0x80], 0x84
145944fb6: 488d4d20 lea rcx, [rbp + 0x20]
145944fba: 488d5560 lea rdx, [rbp + 0x60]
145944fbe: 4589f0 mov r8d, r14d
145944fc1: e82a92f9ff call 0x1458de1f0
145944fc6: 90 nop
145944fc7: c7450000000000 mov dword ptr [rbp], 0
145944fce: 48c745e800000000 mov qword ptr [rbp - 0x18], 0
145944fd6: 48c745f001000000 mov qword ptr [rbp - 0x10], 1
145944fde: 48c745f800000000 mov qword ptr [rbp - 8], 0
145944fe6: 0f137560 movlps qword ptr [rbp + 0x60], xmm6
145944fea: f30f117d68 movss dword ptr [rbp + 0x68], xmm7
145944fef: c6859700000001 mov byte ptr [rbp + 0x97], 1
145944ff6: 4c897c2438 mov qword ptr [rsp + 0x38], r15
145944ffb: 488d05a24a2c01 lea rax, [rip + 0x12c4aa2]
145945002: 4889442430 mov qword ptr [rsp + 0x30], rax
145945007: 488d4560 lea rax, [rbp + 0x60]
14594500b: 4889442420 mov qword ptr [rsp + 0x20], rax
145945010: c744242800000000 mov dword ptr [rsp + 0x28], 0
145945018: 488d4de8 lea rcx, [rbp - 0x18]
14594501c: 4889da mov rdx, rbx
14594501f: 41b003 mov r8b, 3
145945022: 4531c9 xor r9d, r9d
145945025: e886b9f7ff call 0x1458c09b0
14594502a: 90 nop
14594502b: 0f1045e8 movups xmm0, xmmword ptr [rbp - 0x18]
14594502f: 0f104df8 movups xmm1, xmmword ptr [rbp - 8]
145945033: 0f294d70 movaps xmmword ptr [rbp + 0x70], xmm1
145945037: 0f294560 movaps xmmword ptr [rbp + 0x60], xmm0
14594503b: c6859700000000 mov byte ptr [rbp + 0x97], 0
145945042: 488d4d20 lea rcx, [rbp + 0x20]
145945046: 488d5560 lea rdx, [rbp + 0x60]
14594504a: e831c1f7ff call 0x1458c1180
14594504f: 90 nop
145945050: 488bb730060000 mov rsi, qword ptr [rdi + 0x630]
145945057: 483bb720060000 cmp rsi, qword ptr [rdi + 0x620]
14594505e: 750d jne 0x14594506d
14594506d: 488b8728060000 mov rax, qword ptr [rdi + 0x628]
145945074: 4889f1 mov rcx, rsi
145945077: 48c1e105 shl rcx, 5
14594507b: 0f104520 movups xmm0, xmmword ptr [rbp + 0x20]
14594507f: 0f104d30 movups xmm1, xmmword ptr [rbp + 0x30]
145945083: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145945088: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14594508c: 48ffc6 inc rsi
14594508f: 4889b730060000 mov qword ptr [rdi + 0x630], rsi
145945096: f3440f10874c0a0000 movss xmm8, dword ptr [rdi + 0xa4c]
14594509f: 488bb718060000 mov rsi, qword ptr [rdi + 0x618]
1459450a6: 483bb708060000 cmp rsi, qword ptr [rdi + 0x608]
1459450ad: 7514 jne 0x1459450c3
1459450c3: 488b8710060000 mov rax, qword ptr [rdi + 0x610]
1459450ca: 488d0cf6 lea rcx, [rsi + rsi*8]
1459450ce: 48c704c800000000 mov qword ptr [rax + rcx*8], 0
1459450d6: 48c744c80808000000 mov qword ptr [rax + rcx*8 + 8], 8
1459450df: 48c744c81000000000 mov qword ptr [rax + rcx*8 + 0x10], 0
1459450e8: c744c81800000000 mov dword ptr [rax + rcx*8 + 0x18], 0
1459450f0: c744c82000000000 mov dword ptr [rax + rcx*8 + 0x20], 0
1459450f8: 448964c824 mov dword ptr [rax + rcx*8 + 0x24], r12d
1459450fd: 48895cc828 mov qword ptr [rax + rcx*8 + 0x28], rbx
145945102: c744c83029230000 mov dword ptr [rax + rcx*8 + 0x30], 0x2329
14594510a: 0f1374c834 movlps qword ptr [rax + rcx*8 + 0x34], xmm6
14594510f: f30f117cc83c movss dword ptr [rax + rcx*8 + 0x3c], xmm7
145945115: f3440f1144c840 movss dword ptr [rax + rcx*8 + 0x40], xmm8
14594511c: 48ffc6 inc rsi
14594511f: 4889b718060000 mov qword ptr [rdi + 0x618], rsi
145945126: 488d4d40 lea rcx, [rbp + 0x40]
14594512a: e871ea0700 call 0x1459c3ba0
14594512f: e9dc020000 jmp 0x145945410
145945134: 4589fd mov r13d, r15d
145945137: c7455c30230000 mov dword ptr [rbp + 0x5c], 0x2330
14594513e: 49bf671700000000803f movabs r15, 0x3f80000000001767
145945148: eb63 jmp 0x1459451ad
14594514a: 4589fd mov r13d, r15d
14594514d: c7455c2e230000 mov dword ptr [rbp + 0x5c], 0x232e
145945154: 49bf2b1700000000803f movabs r15, 0x3f8000000000172b
14594515e: eb4d jmp 0x1459451ad
145945160: 4589fd mov r13d, r15d
145945163: c7455c2c230000 mov dword ptr [rbp + 0x5c], 0x232c
14594516a: 49bf360a00009a99193f movabs r15, 0x3f19999a00000a36
145945174: eb37 jmp 0x1459451ad
145945176: 4589fd mov r13d, r15d
145945179: c7455c2f230000 mov dword ptr [rbp + 0x5c], 0x232f
145945180: 49bf6b1700000000803f movabs r15, 0x3f8000000000176b
14594518a: eb21 jmp 0x1459451ad
14594518c: 4589fd mov r13d, r15d
14594518f: c7455c31230000 mov dword ptr [rbp + 0x5c], 0x2331
145945196: 49bf560100006666a63f movabs r15, 0x3fa6666600000156
1459451a0: eb0b jmp 0x1459451ad
1459451ad: 488bb7b0090000 mov rsi, qword ptr [rdi + 0x9b0]
1459451b4: 488d4e10 lea rcx, [rsi + 0x10]
1459451b8: f3440f16c6 movshdup xmm8, xmm6
1459451bd: 0f28ce movaps xmm1, xmm6
1459451c0: 410f28d0 movaps xmm2, xmm8
1459451c4: e877b9f5ff call 0x1458a0b40
1459451c9: a801 test al, 1
1459451cb: 7405 je 0x1459451d2
1459451cd: 0f28f8 movaps xmm7, xmm0
1459451d0: eb30 jmp 0x145945202
1459451d2: 48837e68ff cmp qword ptr [rsi + 0x68], -1
1459451d7: 7421 je 0x1459451fa
1459451d9: 488d5668 lea rdx, [rsi + 0x68]
1459451dd: 488d4d60 lea rcx, [rbp + 0x60]
1459451e1: 0f28d6 movaps xmm2, xmm6
1459451e4: 410f28d8 movaps xmm3, xmm8
1459451e8: e873fbf5ff call 0x1458a4d60
1459451ed: 837d6001 cmp dword ptr [rbp + 0x60], 1
1459451f1: 7507 jne 0x1459451fa
1459451f3: f30f107d6c movss xmm7, dword ptr [rbp + 0x6c]
1459451f8: eb08 jmp 0x145945202
1459451fa: f30f10beb8000000 movss xmm7, dword ptr [rsi + 0xb8]
145945202: 8b455c mov eax, dword ptr [rbp + 0x5c]
145945205: 894520 mov dword ptr [rbp + 0x20], eax
145945208: 4c897d24 mov qword ptr [rbp + 0x24], r15
14594520c: 0f137560 movlps qword ptr [rbp + 0x60], xmm6
145945210: f30f117d68 movss dword ptr [rbp + 0x68], xmm7
145945215: c744242000000000 mov dword ptr [rsp + 0x20], 0
14594521d: 488d5520 lea rdx, [rbp + 0x20]
145945221: 4c8d4560 lea r8, [rbp + 0x60]
145945225: 4889f9 mov rcx, rdi
145945228: 4589f1 mov r9d, r14d
14594522b: e8f09d0000 call 0x14594f020
145945230: 4989c6 mov r14, rax
145945233: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14594523b: 48c7452808000000 mov qword ptr [rbp + 0x28], 8
145945243: 48c7453000000000 mov qword ptr [rbp + 0x30], 0
14594524b: 4183fd06 cmp r13d, 6
14594524f: 0f85f0000000 jne 0x145945345
145945255: 4c8975c8 mov qword ptr [rbp - 0x38], r14
145945259: 44896d0c mov dword ptr [rbp + 0xc], r13d
14594525d: 44896508 mov dword ptr [rbp + 8], r12d
145945261: 48b832230000c70c0000 movabs rax, 0xcc700002332
14594526b: 488945d0 mov qword ptr [rbp - 0x30], rax
14594526f: c745d80000803f mov dword ptr [rbp - 0x28], 0x3f800000
145945276: 48b833230000b8080000 movabs rax, 0x8b800002333
145945280: 488945dc mov qword ptr [rbp - 0x24], rax
145945284: c745e4cdcccc3f mov dword ptr [rbp - 0x1c], 0x3fcccccd
14594528b: 48c7456802000000 mov qword ptr [rbp + 0x68], 2
145945293: 488d5d70 lea rbx, [rbp + 0x70]
145945297: 488b45d0 mov rax, qword ptr [rbp - 0x30]
14594529b: 48894570 mov qword ptr [rbp + 0x70], rax
14594529f: 8b45d8 mov eax, dword ptr [rbp - 0x28]
1459452a2: 894578 mov dword ptr [rbp + 0x78], eax
1459452a5: 8b45dc mov eax, dword ptr [rbp - 0x24]
1459452a8: 89457c mov dword ptr [rbp + 0x7c], eax
1459452ab: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1459452af: 48898580000000 mov qword ptr [rbp + 0x80], rax
1459452b6: 31f6 xor esi, esi
1459452b8: 4c8d7de8 lea r15, [rbp - 0x18]
1459452bc: 4c8d6520 lea r12, [rbp + 0x20]
1459452c0: 31c0 xor eax, eax
1459452c2: eb1e jmp 0x1459452e2
1459452d0: 488b4528 mov rax, qword ptr [rbp + 0x28]
1459452d4: 4c892cf0 mov qword ptr [rax + rsi*8], r13
1459452d8: 48ffc6 inc rsi
1459452db: 48897530 mov qword ptr [rbp + 0x30], rsi
1459452df: 4c89f0 mov rax, r14
1459452e2: 4883f802 cmp rax, 2
1459452e6: 0f8487000000 je 0x145945373
1459452ec: 4c8d7001 lea r14, [rax + 1]
1459452f0: 4c897560 mov qword ptr [rbp + 0x60], r14
1459452f4: 488d0440 lea rax, [rax + rax*2]
1459452f8: 488d1483 lea rdx, [rbx + rax*4]
1459452fc: 0f1375e8 movlps qword ptr [rbp - 0x18], xmm6
145945300: f30f117df0 movss dword ptr [rbp - 0x10], xmm7
145945305: c6859600000001 mov byte ptr [rbp + 0x96], 1
14594530c: c744242010000000 mov dword ptr [rsp + 0x20], 0x10
145945314: 4889f9 mov rcx, rdi
145945317: 4d89f8 mov r8, r15
14594531a: 41b905000000 mov r9d, 5
145945320: e8fb9c0000 call 0x14594f020
145945325: 90 nop
145945326: 4989c5 mov r13, rax
145945329: 488b7530 mov rsi, qword ptr [rbp + 0x30]
14594532d: 483b7520 cmp rsi, qword ptr [rbp + 0x20]
145945331: 759d jne 0x1459452d0
145945333: c6859600000001 mov byte ptr [rbp + 0x96], 1
14594533a: 4c89e1 mov rcx, r12
14594533d: e8ee852c00 call 0x145c0d930
145945342: 90 nop
145945343: eb8b jmp 0x1459452d0
145945345: b808000000 mov eax, 8
14594534a: 48894510 mov qword ptr [rbp + 0x10], rax
14594534e: 31f6 xor esi, esi
145945350: 48c7451800000000 mov qword ptr [rbp + 0x18], 0
145945358: f3440f10874c0a0000 movss xmm8, dword ptr [rdi + 0xa4c]
145945361: 488b9f18060000 mov rbx, qword ptr [rdi + 0x618]
145945368: 483b9f08060000 cmp rbx, qword ptr [rdi + 0x608]
14594536f: 7437 je 0x1459453a8
145945371: eb42 jmp 0x1459453b5
145945373: 488b4520 mov rax, qword ptr [rbp + 0x20]
145945377: 48894518 mov qword ptr [rbp + 0x18], rax
14594537b: 488b4528 mov rax, qword ptr [rbp + 0x28]
14594537f: 48894510 mov qword ptr [rbp + 0x10], rax
145945383: 448b6508 mov r12d, dword ptr [rbp + 8]
145945387: 448b6d0c mov r13d, dword ptr [rbp + 0xc]
14594538b: 4c8b75c8 mov r14, qword ptr [rbp - 0x38]
14594538f: f3440f10874c0a0000 movss xmm8, dword ptr [rdi + 0xa4c]
145945398: 488b9f18060000 mov rbx, qword ptr [rdi + 0x618]
14594539f: 483b9f08060000 cmp rbx, qword ptr [rdi + 0x608]
1459453a6: 750d jne 0x1459453b5
1459453b5: 488b8710060000 mov rax, qword ptr [rdi + 0x610]
1459453bc: 488d0cdb lea rcx, [rbx + rbx*8]
1459453c0: 488b5518 mov rdx, qword ptr [rbp + 0x18]
1459453c4: 488914c8 mov qword ptr [rax + rcx*8], rdx
1459453c8: 488b5510 mov rdx, qword ptr [rbp + 0x10]
1459453cc: 488954c808 mov qword ptr [rax + rcx*8 + 8], rdx
1459453d1: 488974c810 mov qword ptr [rax + rcx*8 + 0x10], rsi
1459453d6: c744c81800000000 mov dword ptr [rax + rcx*8 + 0x18], 0
1459453de: 44896cc820 mov dword ptr [rax + rcx*8 + 0x20], r13d
1459453e3: 448964c824 mov dword ptr [rax + rcx*8 + 0x24], r12d
1459453e8: 4c8974c828 mov qword ptr [rax + rcx*8 + 0x28], r14
1459453ed: 8b555c mov edx, dword ptr [rbp + 0x5c]
1459453f0: 8954c830 mov dword ptr [rax + rcx*8 + 0x30], edx
1459453f4: 0f1374c834 movlps qword ptr [rax + rcx*8 + 0x34], xmm6
1459453f9: f30f117cc83c movss dword ptr [rax + rcx*8 + 0x3c], xmm7
1459453ff: f3440f1144c840 movss dword ptr [rax + rcx*8 + 0x40], xmm8
145945406: 48ffc3 inc rbx
145945409: 48899f18060000 mov qword ptr [rdi + 0x618], rbx
145945410: 0f28b5a0000000 movaps xmm6, xmmword ptr [rbp + 0xa0]
145945417: 0f28bdb0000000 movaps xmm7, xmmword ptr [rbp + 0xb0]
14594541e: 440f2885c0000000 movaps xmm8, xmmword ptr [rbp + 0xc0]
145945426: 440f288dd0000000 movaps xmm9, xmmword ptr [rbp + 0xd0]
14594542e: 4881c468010000 add rsp, 0x168
145945435: 5b pop rbx
145945436: 5f pop rdi
145945437: 5e pop rsi
145945438: 415c pop r12
14594543a: 415d pop r13
14594543c: 415e pop r14
14594543e: 415f pop r15
145945440: 5d pop rbp
145945441: c3 ret
145945442: 4183782000 cmp dword ptr [r8 + 0x20], 0
145945447: 75c7 jne 0x145945410
145945449: 45016024 add dword ptr [r8 + 0x24], r12d
14594544d: ebc1 jmp 0x145945410
14594f020: 55 push rbp
14594f021: 4157 push r15
14594f023: 4156 push r14
14594f025: 4155 push r13
14594f027: 4154 push r12
14594f029: 56 push rsi
14594f02a: 57 push rdi
14594f02b: 53 push rbx
14594f02c: 4881ecf8000000 sub rsp, 0xf8
14594f033: 488dac2480000000 lea rbp, [rsp + 0x80]
14594f03b: 0f297d60 movaps xmmword ptr [rbp + 0x60], xmm7
14594f03f: 0f297550 movaps xmmword ptr [rbp + 0x50], xmm6
14594f043: 48c74548feffffff mov qword ptr [rbp + 0x48], 0xfffffffffffffffe
14594f04b: 44894df4 mov dword ptr [rbp - 0xc], r9d
14594f04f: 4c89c7 mov rdi, r8
14594f052: 4889ce mov rsi, rcx
14594f055: 448ba5e0000000 mov r12d, dword ptr [rbp + 0xe0]
14594f05c: 8b1a mov ebx, dword ptr [rdx]
14594f05e: 448b6a04 mov r13d, dword ptr [rdx + 4]
14594f062: 660f6e7208 movd xmm6, dword ptr [rdx + 8]
14594f067: 8b81780a0000 mov eax, dword ptr [rcx + 0xa78]
14594f06d: ffc0 inc eax
14594f06f: 8981780a0000 mov dword ptr [rcx + 0xa78], eax
14594f075: 4c8b81b8090000 mov r8, qword ptr [rcx + 0x9b8]
14594f07c: 488b89c0090000 mov rcx, qword ptr [rcx + 0x9c0]
14594f083: 4c8b8ed0090000 mov r9, qword ptr [rsi + 0x9d0]
14594f08a: 488b96c8090000 mov rdx, qword ptr [rsi + 0x9c8]
14594f091: f30f1005cf224600 movss xmm0, dword ptr [rip + 0x4622cf]
14594f099: f30f100dff264600 movss xmm1, dword ptr [rip + 0x4626ff]
14594f0a1: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14594f0b0: 4f8d1408 lea r10, [r8 + r9]
14594f0b4: 49c1c217 rol r10, 0x17
14594f0b8: 4d01c2 add r10, r8
14594f0bb: 4989cb mov r11, rcx
14594f0be: 49c1e311 shl r11, 0x11
14594f0c2: 4c31c2 xor rdx, r8
14594f0c5: 4931c9 xor r9, rcx
14594f0c8: 4831d1 xor rcx, rdx
14594f0cb: 4d31c8 xor r8, r9
14594f0ce: 49c1c12d rol r9, 0x2d
14594f0d2: 4c31da xor rdx, r11
14594f0d5: 49c1ea29 shr r10, 0x29
14594f0d9: 4181ca0000803f or r10d, 0x3f800000
14594f0e0: 66410f6efa movd xmm7, r10d
14594f0e5: f30f58f8 addss xmm7, xmm0
14594f0e9: f30f59f9 mulss xmm7, xmm1
14594f0ed: 0f2ecf ucomiss xmm1, xmm7
14594f0f0: 76be jbe 0x14594f0b0
14594f0f2: 4189da mov r10d, ebx
14594f0f5: 4181e2ffffff00 and r10d, 0xffffff
14594f0fc: 49c1e218 shl r10, 0x18
14594f100: 25ffffff00 and eax, 0xffffff
14594f105: 4c09d0 or rax, r10
14594f108: 49be00000000000010f1 movabs r14, 0xf110000000000000
14594f112: 4909c6 or r14, rax
14594f115: 4c8986b8090000 mov qword ptr [rsi + 0x9b8], r8
14594f11c: 4c898ed0090000 mov qword ptr [rsi + 0x9d0], r9
14594f123: 48898ec0090000 mov qword ptr [rsi + 0x9c0], rcx
14594f12a: 488996c8090000 mov qword ptr [rsi + 0x9c8], rdx
14594f131: 48c745f800000000 mov qword ptr [rbp - 8], 0
14594f139: 48c7450800000000 mov qword ptr [rbp + 8], 0
14594f141: 4c8d7df8 lea r15, [rbp - 8]
14594f145: 4c89f9 mov rcx, r15
14594f148: 31d2 xor edx, edx
14594f14a: 4d89f0 mov r8, r14
14594f14d: e85e28f7ff call 0x1458c19b0
14594f152: 90 nop
14594f153: 488b45f8 mov rax, qword ptr [rbp - 8]
14594f157: 4885c0 test rax, rax
14594f15a: 746f je 0x14594f1cb
14594f1cb: 31c0 xor eax, eax
14594f1cd: 4c897d10 mov qword ptr [rbp + 0x10], r15
14594f1d1: 48894518 mov qword ptr [rbp + 0x18], rax
14594f1d5: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14594f1dd: 4c894528 mov qword ptr [rbp + 0x28], r8
14594f1e1: 48c7453002000000 mov qword ptr [rbp + 0x30], 2
14594f1e9: 488d4dd0 lea rcx, [rbp - 0x30]
14594f1ed: 488d5510 lea rdx, [rbp + 0x10]
14594f1f1: 41b821000000 mov r8d, 0x21
14594f1f7: e8f4eff8ff call 0x1458de1f0
14594f1fc: 90 nop
14594f1fd: 488b45f8 mov rax, qword ptr [rbp - 8]
14594f201: 4885c0 test rax, rax
14594f204: 7461 je 0x14594f267
14594f267: 31c0 xor eax, eax
14594f269: 4c897d10 mov qword ptr [rbp + 0x10], r15
14594f26d: 48894518 mov qword ptr [rbp + 0x18], rax
14594f271: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14594f279: 4c894528 mov qword ptr [rbp + 0x28], r8
14594f27d: 48c7453003000000 mov qword ptr [rbp + 0x30], 3
14594f285: 488d4dd0 lea rcx, [rbp - 0x30]
14594f289: 488d5510 lea rdx, [rbp + 0x10]
14594f28d: 4189d8 mov r8d, ebx
14594f290: e85beff8ff call 0x1458de1f0
14594f295: 90 nop
14594f296: 488b45f8 mov rax, qword ptr [rbp - 8]
14594f29a: 4885c0 test rax, rax
14594f29d: 746a je 0x14594f309
14594f309: 31c0 xor eax, eax
14594f30b: 66410f7ef0 movd r8d, xmm6
14594f310: 4c897d10 mov qword ptr [rbp + 0x10], r15
14594f314: 48894518 mov qword ptr [rbp + 0x18], rax
14594f318: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14594f320: 4c894d28 mov qword ptr [rbp + 0x28], r9
14594f324: 48c7453004000000 mov qword ptr [rbp + 0x30], 4
14594f32c: 488d4dd0 lea rcx, [rbp - 0x30]
14594f330: 488d5510 lea rdx, [rbp + 0x10]
14594f334: e8b7eef8ff call 0x1458de1f0
14594f339: 90 nop
14594f33a: 488b45f8 mov rax, qword ptr [rbp - 8]
14594f33e: 4885c0 test rax, rax
14594f341: 7464 je 0x14594f3a7
14594f3a7: 31c0 xor eax, eax
14594f3a9: 4c897d10 mov qword ptr [rbp + 0x10], r15
14594f3ad: 48894518 mov qword ptr [rbp + 0x18], rax
14594f3b1: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14594f3b9: 4c894528 mov qword ptr [rbp + 0x28], r8
14594f3bd: 48c7453008000000 mov qword ptr [rbp + 0x30], 8
14594f3c5: 488d4dd0 lea rcx, [rbp - 0x30]
14594f3c9: 488d5510 lea rdx, [rbp + 0x10]
14594f3cd: 4589e8 mov r8d, r13d
14594f3d0: e81beef8ff call 0x1458de1f0
14594f3d5: 90 nop
14594f3d6: 488b45f8 mov rax, qword ptr [rbp - 8]
14594f3da: 4885c0 test rax, rax
14594f3dd: 7468 je 0x14594f447
14594f447: 31c0 xor eax, eax
14594f449: 4c897d10 mov qword ptr [rbp + 0x10], r15
14594f44d: 48894518 mov qword ptr [rbp + 0x18], rax
14594f451: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14594f459: 4c894528 mov qword ptr [rbp + 0x28], r8
14594f45d: 48c7453009000000 mov qword ptr [rbp + 0x30], 9
14594f465: 488d4dd0 lea rcx, [rbp - 0x30]
14594f469: 488d5510 lea rdx, [rbp + 0x10]
14594f46d: 4589e0 mov r8d, r12d
14594f470: e87bedf8ff call 0x1458de1f0
14594f475: 90 nop
14594f476: 0f57c0 xorps xmm0, xmm0
14594f479: f30f58f8 addss xmm7, xmm0
14594f47d: f30f1035dfdd4500 movss xmm6, dword ptr [rip + 0x45dddf]
14594f485: f30f59f7 mulss xmm6, xmm7
14594f489: 0f28c6 movaps xmm0, xmm6
14594f48c: e880af2b00 call 0x145c0a411
14594f491: 488b45f8 mov rax, qword ptr [rbp - 8]
14594f495: 4885c0 test rax, rax
14594f498: 746f je 0x14594f509
14594f509: 31c0 xor eax, eax
14594f50b: 66410f7ec0 movd r8d, xmm0
14594f510: 4c897d10 mov qword ptr [rbp + 0x10], r15
14594f514: 48894518 mov qword ptr [rbp + 0x18], rax
14594f518: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14594f520: 4c894d28 mov qword ptr [rbp + 0x28], r9
14594f524: 48c745300c000000 mov qword ptr [rbp + 0x30], 0xc
14594f52c: 488d4dd0 lea rcx, [rbp - 0x30]
14594f530: 488d5510 lea rdx, [rbp + 0x10]
14594f534: e8b7ecf8ff call 0x1458de1f0
14594f539: 90 nop
14594f53a: 0f28c6 movaps xmm0, xmm6
14594f53d: e8d5ae2b00 call 0x145c0a417
14594f542: 488b45f8 mov rax, qword ptr [rbp - 8]
14594f546: 4885c0 test rax, rax
14594f549: 746e je 0x14594f5b9
14594f5b9: 31c0 xor eax, eax
14594f5bb: 66410f7ec0 movd r8d, xmm0
14594f5c0: 4c897d10 mov qword ptr [rbp + 0x10], r15
14594f5c4: 48894518 mov qword ptr [rbp + 0x18], rax
14594f5c8: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14594f5d0: 4c894d28 mov qword ptr [rbp + 0x28], r9
14594f5d4: 48c745300d000000 mov qword ptr [rbp + 0x30], 0xd
14594f5dc: 488d4dd0 lea rcx, [rbp - 0x30]
14594f5e0: 488d5510 lea rdx, [rbp + 0x10]
14594f5e4: e807ecf8ff call 0x1458de1f0
14594f5e9: 90 nop
14594f5ea: 488b45f8 mov rax, qword ptr [rbp - 8]
14594f5ee: 4885c0 test rax, rax
14594f5f1: 7468 je 0x14594f65b
14594f65b: 31c0 xor eax, eax
14594f65d: 4c897d10 mov qword ptr [rbp + 0x10], r15
14594f661: 48894518 mov qword ptr [rbp + 0x18], rax
14594f665: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14594f66d: 4c894528 mov qword ptr [rbp + 0x28], r8
14594f671: 48c745300e000000 mov qword ptr [rbp + 0x30], 0xe
14594f679: 488d4dd0 lea rcx, [rbp - 0x30]
14594f67d: 488d5510 lea rdx, [rbp + 0x10]
14594f681: 41b801000000 mov r8d, 1
14594f687: e864ebf8ff call 0x1458de1f0
14594f68c: 90 nop
14594f68d: 660f6e07 movd xmm0, dword ptr [rdi]
14594f691: 488b45f8 mov rax, qword ptr [rbp - 8]
14594f695: 4885c0 test rax, rax
14594f698: 746f je 0x14594f709
14594f709: 31c0 xor eax, eax
14594f70b: 66410f7ec0 movd r8d, xmm0
14594f710: 4c897d10 mov qword ptr [rbp + 0x10], r15
14594f714: 48894518 mov qword ptr [rbp + 0x18], rax
14594f718: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14594f720: 4c894d28 mov qword ptr [rbp + 0x28], r9
14594f724: 48c745300f000000 mov qword ptr [rbp + 0x30], 0xf
14594f72c: 488d4dd0 lea rcx, [rbp - 0x30]
14594f730: 488d5510 lea rdx, [rbp + 0x10]
14594f734: e8b7eaf8ff call 0x1458de1f0
14594f739: 90 nop
14594f73a: 660f6e4704 movd xmm0, dword ptr [rdi + 4]
14594f73f: 488b45f8 mov rax, qword ptr [rbp - 8]
14594f743: 4885c0 test rax, rax
14594f746: 7471 je 0x14594f7b9
14594f7b9: 31c0 xor eax, eax
14594f7bb: 66410f7ec0 movd r8d, xmm0
14594f7c0: 4c897d10 mov qword ptr [rbp + 0x10], r15
14594f7c4: 48894518 mov qword ptr [rbp + 0x18], rax
14594f7c8: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14594f7d0: 4c894d28 mov qword ptr [rbp + 0x28], r9
14594f7d4: 48c7453010000000 mov qword ptr [rbp + 0x30], 0x10
14594f7dc: 488d4dd0 lea rcx, [rbp - 0x30]
14594f7e0: 488d5510 lea rdx, [rbp + 0x10]
14594f7e4: e807eaf8ff call 0x1458de1f0
14594f7e9: 90 nop
14594f7ea: 660f6e4708 movd xmm0, dword ptr [rdi + 8]
14594f7ef: 488b45f8 mov rax, qword ptr [rbp - 8]
14594f7f3: 4885c0 test rax, rax
14594f7f6: 7471 je 0x14594f869
14594f869: 31c0 xor eax, eax
14594f86b: 66410f7ec0 movd r8d, xmm0
14594f870: 4c897d10 mov qword ptr [rbp + 0x10], r15
14594f874: 48894518 mov qword ptr [rbp + 0x18], rax
14594f878: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14594f880: 4c894d28 mov qword ptr [rbp + 0x28], r9
14594f884: 48c7453011000000 mov qword ptr [rbp + 0x30], 0x11
14594f88c: 488d4dd0 lea rcx, [rbp - 0x30]
14594f890: 488d5510 lea rdx, [rbp + 0x10]
14594f894: e857e9f8ff call 0x1458de1f0
14594f899: 90 nop
14594f89a: 488b45f8 mov rax, qword ptr [rbp - 8]
14594f89e: 4885c0 test rax, rax
14594f8a1: 7466 je 0x14594f909
14594f909: 31c0 xor eax, eax
14594f90b: 66410f7ef8 movd r8d, xmm7
14594f910: 4c897d10 mov qword ptr [rbp + 0x10], r15
14594f914: 48894518 mov qword ptr [rbp + 0x18], rax
14594f918: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14594f920: 4c894d28 mov qword ptr [rbp + 0x28], r9
14594f924: 48c7453012000000 mov qword ptr [rbp + 0x30], 0x12
14594f92c: 488d4dd0 lea rcx, [rbp - 0x30]
14594f930: 488d5510 lea rdx, [rbp + 0x10]
14594f934: e8b7e8f8ff call 0x1458de1f0
14594f939: 90 nop
14594f93a: 488b45f8 mov rax, qword ptr [rbp - 8]
14594f93e: 4885c0 test rax, rax
14594f941: 7468 je 0x14594f9ab
14594f9ab: 31c0 xor eax, eax
14594f9ad: 4c897d10 mov qword ptr [rbp + 0x10], r15
14594f9b1: 48894518 mov qword ptr [rbp + 0x18], rax
14594f9b5: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14594f9bd: 4c894528 mov qword ptr [rbp + 0x28], r8
14594f9c1: 48c7453014000000 mov qword ptr [rbp + 0x30], 0x14
14594f9c9: 488d4dd0 lea rcx, [rbp - 0x30]
14594f9cd: 488d5510 lea rdx, [rbp + 0x10]
14594f9d1: 41b823000000 mov r8d, 0x23
14594f9d7: e814e8f8ff call 0x1458de1f0
14594f9dc: 90 nop
14594f9dd: 488b45f8 mov rax, qword ptr [rbp - 8]
14594f9e1: 4885c0 test rax, rax
14594f9e4: 7464 je 0x14594fa4a
14594fa4a: 31c0 xor eax, eax
14594fa4c: 4c897d10 mov qword ptr [rbp + 0x10], r15
14594fa50: 48894518 mov qword ptr [rbp + 0x18], rax
14594fa54: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14594fa5c: 4c894528 mov qword ptr [rbp + 0x28], r8
14594fa60: 48c7453015000000 mov qword ptr [rbp + 0x30], 0x15
14594fa68: 488d4dd0 lea rcx, [rbp - 0x30]
14594fa6c: 488d5510 lea rdx, [rbp + 0x10]
14594fa70: 448b45f4 mov r8d, dword ptr [rbp - 0xc]
14594fa74: e877e7f8ff call 0x1458de1f0
14594fa79: 90 nop
14594fa7a: c745c800000000 mov dword ptr [rbp - 0x38], 0
14594fa81: 48c745b000000000 mov qword ptr [rbp - 0x50], 0
14594fa89: 48c745b801000000 mov qword ptr [rbp - 0x48], 1
14594fa91: 48c745c000000000 mov qword ptr [rbp - 0x40], 0
14594fa99: c6454701 mov byte ptr [rbp + 0x47], 1
14594fa9d: 4c897c2428 mov qword ptr [rsp + 0x28], r15
14594faa2: f30f117c2420 movss dword ptr [rsp + 0x20], xmm7
14594faa8: 488d4db0 lea rcx, [rbp - 0x50]
14594faac: 4c89f2 mov rdx, r14
14594faaf: 41b005 mov r8b, 5
14594fab2: 4989f9 mov r9, rdi
14594fab5: e86614f7ff call 0x1458c0f20
14594faba: 90 nop
14594fabb: f30f6f45b0 movdqu xmm0, xmmword ptr [rbp - 0x50]
14594fac0: 0f104dc0 movups xmm1, xmmword ptr [rbp - 0x40]
14594fac4: 0f294d20 movaps xmmword ptr [rbp + 0x20], xmm1
14594fac8: 660f7f4510 movdqa xmmword ptr [rbp + 0x10], xmm0
14594facd: c6454700 mov byte ptr [rbp + 0x47], 0
14594fad1: 488d4dd0 lea rcx, [rbp - 0x30]
14594fad5: 488d5510 lea rdx, [rbp + 0x10]
14594fad9: e8a216f7ff call 0x1458c1180
14594fade: 90 nop
14594fadf: 488bbe30060000 mov rdi, qword ptr [rsi + 0x630]
14594fae6: 483bbe20060000 cmp rdi, qword ptr [rsi + 0x620]
14594faed: 750d jne 0x14594fafc
14594fafc: 488b8628060000 mov rax, qword ptr [rsi + 0x628]
14594fb03: 4889f9 mov rcx, rdi
14594fb06: 48c1e105 shl rcx, 5
14594fb0a: 0f1045d0 movups xmm0, xmmword ptr [rbp - 0x30]
14594fb0e: 0f104de0 movups xmm1, xmmword ptr [rbp - 0x20]
14594fb12: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14594fb17: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14594fb1b: 48ffc7 inc rdi
14594fb1e: 4889be30060000 mov qword ptr [rsi + 0x630], rdi
14594fb25: 488d4df8 lea rcx, [rbp - 8]
14594fb29: e872400700 call 0x1459c3ba0
14594fb2e: 4c89f0 mov rax, r14
14594fb31: 0f287550 movaps xmm6, xmmword ptr [rbp + 0x50]
14594fb35: 0f287d60 movaps xmm7, xmmword ptr [rbp + 0x60]
14594fb39: 4881c4f8000000 add rsp, 0xf8
14594fb40: 5b pop rbx
14594fb41: 5f pop rdi
14594fb42: 5e pop rsi
14594fb43: 415c pop r12
14594fb45: 415d pop r13
14594fb47: 415e pop r14
14594fb49: 415f pop r15
14594fb4b: 5d pop rbp
14594fb4c: c3 ret
