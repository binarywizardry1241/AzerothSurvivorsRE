145919fe0: 55 push rbp
145919fe1: 4156 push r14
145919fe3: 56 push rsi
145919fe4: 57 push rdi
145919fe5: 53 push rbx
145919fe6: 4881ece0000000 sub rsp, 0xe0
145919fed: 488dac2480000000 lea rbp, [rsp + 0x80]
145919ff5: 48c74558feffffff mov qword ptr [rbp + 0x58], 0xfffffffffffffffe
145919ffd: 4889ce mov rsi, rcx
14591a000: 4d85c0 test r8, r8
14591a003: 7456 je 0x14591a05b
14591a005: 4c3b8260040000 cmp r8, qword ptr [rdx + 0x460]
14591a00c: 0f858f000000 jne 0x14591a0a1
14591a012: e8e9816efa call 0x140002200
14591a017: b90b000000 mov ecx, 0xb
14591a01c: ba01000000 mov edx, 1
14591a021: e89a816efa call 0x1400021c0
14591a026: 4885c0 test rax, rax
14591a029: 0f8457030000 je 0x14591a386
14591a02f: 48b96b696e643d706c61 movabs rcx, 0x616c703d646e696b
14591a039: 488908 mov qword ptr [rax], rcx
14591a03c: c7400761796572 mov dword ptr [rax + 7], 0x72657961
14591a043: 48c7060b000000 mov qword ptr [rsi], 0xb
14591a04a: 48894608 mov qword ptr [rsi + 8], rax
14591a04e: 48c746100b000000 mov qword ptr [rsi + 0x10], 0xb
14591a056: e900010000 jmp 0x14591a15b
14591a05b: e8a0816efa call 0x140002200
14591a060: b909000000 mov ecx, 9
14591a065: ba01000000 mov edx, 1
14591a06a: e851816efa call 0x1400021c0
14591a06f: 4885c0 test rax, rax
14591a072: 0f84fd020000 je 0x14591a375
14591a078: 48b96b696e643d6e6f6e movabs rcx, 0x6e6f6e3d646e696b
14591a082: 488908 mov qword ptr [rax], rcx
14591a085: c6400865 mov byte ptr [rax + 8], 0x65
14591a089: 48c70609000000 mov qword ptr [rsi], 9
14591a090: 48894608 mov qword ptr [rsi + 8], rax
14591a094: 48c7461009000000 mov qword ptr [rsi + 0x10], 9
14591a09c: e9ba000000 jmp 0x14591a15b
14591a0a1: 48c7c028feffff mov rax, 0xfffffffffffffe28
14591a0a8: 48038260050000 add rax, qword ptr [rdx + 0x560]
14591a0af: 48698a68050000d8010000 imul rcx, qword ptr [rdx + 0x568], 0x1d8
14591a0ba: 660f1f440000 nop word ptr [rax + rax]
14591a0c0: 4885c9 test rcx, rcx
14591a0c3: 7453 je 0x14591a118
14591a0c5: 488db8d8010000 lea rdi, [rax + 0x1d8]
14591a0cc: 4881c128feffff add rcx, -0x1d8
14591a0d3: 4c3980c8020000 cmp qword ptr [rax + 0x2c8], r8
14591a0da: 4889f8 mov rax, rdi
14591a0dd: 75e1 jne 0x14591a0c0
14591a0df: 83bfb000000000 cmp dword ptr [rdi + 0xb0], 0
14591a0e6: 0f8480000000 je 0x14591a16c
14591a0ec: 44894520 mov dword ptr [rbp + 0x20], r8d
14591a0f0: 488d4520 lea rax, [rbp + 0x20]
14591a0f4: 488945b0 mov qword ptr [rbp - 0x50], rax
14591a0f8: 488d05e1472c00 lea rax, [rip + 0x2c47e1]
14591a0ff: 488945b8 mov qword ptr [rbp - 0x48], rax
14591a103: 488d15bbfe9001 lea rdx, [rip + 0x190febb]
14591a10a: 4c8d45b0 lea r8, [rbp - 0x50]
14591a10e: 4889f1 mov rcx, rsi
14591a111: e81a2d2b00 call 0x145bcce30
14591a116: eb43 jmp 0x14591a15b
14591a118: e8e3806efa call 0x140002200
14591a11d: b90a000000 mov ecx, 0xa
14591a122: ba01000000 mov edx, 1
14591a127: e894806efa call 0x1400021c0
14591a12c: 4885c0 test rax, rax
14591a12f: 0f8462020000 je 0x14591a397
14591a135: 48b96b696e643d6f7468 movabs rcx, 0x68746f3d646e696b
14591a13f: 488908 mov qword ptr [rax], rcx
14591a142: 66c740086572 mov word ptr [rax + 8], 0x7265
14591a148: 48c7060a000000 mov qword ptr [rsi], 0xa
14591a14f: 48894608 mov qword ptr [rsi + 8], rax
14591a153: 48c746100a000000 mov qword ptr [rsi + 0x10], 0xa
14591a15b: 4889f0 mov rax, rsi
14591a15e: 4881c4e0000000 add rsp, 0xe0
14591a165: 5b pop rbx
14591a166: 5f pop rdi
14591a167: 5e pop rsi
14591a168: 415e pop r14
14591a16a: 5d pop rbp
14591a16b: c3 ret
14591a16c: 48837f18ff cmp qword ptr [rdi + 0x18], -1
14591a171: 741f je 0x14591a192
14591a173: 488b4730 mov rax, qword ptr [rdi + 0x30]
14591a177: 80786400 cmp byte ptr [rax + 0x64], 0
14591a17b: 7435 je 0x14591a1b2
14591a17d: 488d05befd9001 lea rax, [rip + 0x190fdbe]
14591a184: 48894540 mov qword ptr [rbp + 0x40], rax
14591a188: 48c7454805000000 mov qword ptr [rbp + 0x48], 5
14591a190: eb33 jmp 0x14591a1c5
14591a192: 48837f58ff cmp qword ptr [rdi + 0x58], -1
14591a197: 0f8465010000 je 0x14591a302
14591a19d: 488d0587fd9001 lea rax, [rip + 0x190fd87]
14591a1a4: 48894540 mov qword ptr [rbp + 0x40], rax
14591a1a8: 48c7454808000000 mov qword ptr [rbp + 0x48], 8
14591a1b0: eb13 jmp 0x14591a1c5
14591a1b2: 488d0585fd9001 lea rax, [rip + 0x190fd85]
14591a1b9: 48894540 mov qword ptr [rbp + 0x40], rax
14591a1bd: 48c7454804000000 mov qword ptr [rbp + 0x48], 4
14591a1c5: 4489453c mov dword ptr [rbp + 0x3c], r8d
14591a1c9: 4889f9 mov rcx, rdi
14591a1cc: e8cf37ffff call 0x14590d9a0
14591a1d1: 48c745b000000000 mov qword ptr [rbp - 0x50], 0
14591a1d9: 48c745b801000000 mov qword ptr [rbp - 0x48], 1
14591a1e1: 48c745c000000000 mov qword ptr [rbp - 0x40], 0
14591a1e9: 4885d2 test rdx, rdx
14591a1ec: 0f8544010000 jne 0x14591a336
14591a1f2: 4801c2 add rdx, rax
14591a1f5: 4c8d45b0 lea r8, [rbp - 0x50]
14591a1f9: 4889c1 mov rcx, rax
14591a1fc: e8efd80b00 call 0x1459d7af0
14591a201: 90 nop
14591a202: 488b45c0 mov rax, qword ptr [rbp - 0x40]
14591a206: 48894530 mov qword ptr [rbp + 0x30], rax
14591a20a: 0f1045b0 movups xmm0, xmmword ptr [rbp - 0x50]
14591a20e: 0f294520 movaps xmmword ptr [rbp + 0x20], xmm0
14591a212: f30f108758010000 movss xmm0, dword ptr [rdi + 0x158]
14591a21a: 0f57c9 xorps xmm1, xmm1
14591a21d: f30f5fc1 maxss xmm0, xmm1
14591a221: f30f114538 movss dword ptr [rbp + 0x38], xmm0
14591a226: 488d875c010000 lea rax, [rdi + 0x15c]
14591a22d: b950000000 mov ecx, 0x50
14591a232: 48837f18ff cmp qword ptr [rdi + 0x18], -1
14591a237: 7510 jne 0x14591a249
14591a239: b9a8000000 mov ecx, 0xa8
14591a23e: 48837f58ff cmp qword ptr [rdi + 0x58], -1
14591a243: 0f84ce000000 je 0x14591a317
14591a249: 0fb60c0f movzx ecx, byte ptr [rdi + rcx]
14591a24d: 884d57 mov byte ptr [rbp + 0x57], cl
14591a250: 0fb68fd4010000 movzx ecx, byte ptr [rdi + 0x1d4]
14591a257: 884d56 mov byte ptr [rbp + 0x56], cl
14591a25a: 488d4d40 lea rcx, [rbp + 0x40]
14591a25e: 48894db0 mov qword ptr [rbp - 0x50], rcx
14591a262: 488d0d577e6efa lea rcx, [rip - 0x59181a9]
14591a269: 48894db8 mov qword ptr [rbp - 0x48], rcx
14591a26d: 488d4d3c lea rcx, [rbp + 0x3c]
14591a271: 48894dc0 mov qword ptr [rbp - 0x40], rcx
14591a275: 488d0d64462c00 lea rcx, [rip + 0x2c4664]
14591a27c: 48894dc8 mov qword ptr [rbp - 0x38], rcx
14591a280: 488d4d20 lea rcx, [rbp + 0x20]
14591a284: 48894dd0 mov qword ptr [rbp - 0x30], rcx
14591a288: 488d0d517e6efa lea rcx, [rip - 0x59181af]
14591a28f: 48894dd8 mov qword ptr [rbp - 0x28], rcx
14591a293: 488d4d38 lea rcx, [rbp + 0x38]
14591a297: 48894de0 mov qword ptr [rbp - 0x20], rcx
14591a29b: 488d0d3e392c00 lea rcx, [rip + 0x2c393e]
14591a2a2: 48894de8 mov qword ptr [rbp - 0x18], rcx
14591a2a6: 488945f0 mov qword ptr [rbp - 0x10], rax
14591a2aa: 48894df8 mov qword ptr [rbp - 8], rcx
14591a2ae: 488d4557 lea rax, [rbp + 0x57]
14591a2b2: 48894500 mov qword ptr [rbp], rax
14591a2b6: 488d05530f2c00 lea rax, [rip + 0x2c0f53]
14591a2bd: 48894508 mov qword ptr [rbp + 8], rax
14591a2c1: 488d4d56 lea rcx, [rbp + 0x56]
14591a2c5: 48894d10 mov qword ptr [rbp + 0x10], rcx
14591a2c9: 48894518 mov qword ptr [rbp + 0x18], rax
14591a2cd: 488d1501fd9001 lea rdx, [rip + 0x190fd01]
14591a2d4: 4c8d45b0 lea r8, [rbp - 0x50]
14591a2d8: 4889f1 mov rcx, rsi
14591a2db: e8502b2b00 call 0x145bcce30
14591a2e0: 90 nop
14591a2e1: 488b5520 mov rdx, qword ptr [rbp + 0x20]
14591a2e5: 4885d2 test rdx, rdx
14591a2e8: 0f846dfeffff je 0x14591a15b
14591a2ee: 488b4d28 mov rcx, qword ptr [rbp + 0x28]
14591a2f2: 41b801000000 mov r8d, 1
14591a2f8: e8d37e6efa call 0x1400021d0
14591a2fd: e959feffff jmp 0x14591a15b
14591a302: 80bfd401000000 cmp byte ptr [rdi + 0x1d4], 0
14591a309: 7413 je 0x14591a31e
14591a30b: 488d0527fc9001 lea rax, [rip + 0x190fc27]
14591a312: e96dfeffff jmp 0x14591a184
14591a317: 31c9 xor ecx, ecx
14591a319: e92fffffff jmp 0x14591a24d
14591a31e: 488d050efc9001 lea rax, [rip + 0x190fc0e]
14591a325: 48894540 mov qword ptr [rbp + 0x40], rax
14591a329: 48c7454806000000 mov qword ptr [rbp + 0x48], 6
14591a331: e98ffeffff jmp 0x14591a1c5
14591a336: 4989d0 mov r8, rdx
14591a339: 49c1e802 shr r8, 2
14591a33d: 89d1 mov ecx, edx
14591a33f: 83e103 and ecx, 3
14591a342: 4883f901 cmp rcx, 1
14591a346: 4983d8ff sbb r8, -1
14591a34a: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14591a353: 488d4db0 lea rcx, [rbp - 0x50]
14591a357: 41b901000000 mov r9d, 1
14591a35d: 4889d3 mov rbx, rdx
14591a360: 31d2 xor edx, edx
14591a362: 4989c6 mov r14, rax
14591a365: e806062e00 call 0x145bfa970
14591a36a: 4889da mov rdx, rbx
14591a36d: 4c89f0 mov rax, r14
14591a370: e97dfeffff jmp 0x14591a1f2
14591a375: b901000000 mov ecx, 1
14591a37a: ba09000000 mov edx, 9
14591a37f: e837ef4700 call 0x145d992bb
14591a384: 0f0b ud2
14591a386: b901000000 mov ecx, 1
14591a38b: ba0b000000 mov edx, 0xb
14591a390: e826ef4700 call 0x145d992bb
14591a395: 0f0b ud2
14591a397: b901000000 mov ecx, 1
14591a39c: ba0a000000 mov edx, 0xa
14591a3a1: e815ef4700 call 0x145d992bb
14591a3a6: 0f0b ud2
