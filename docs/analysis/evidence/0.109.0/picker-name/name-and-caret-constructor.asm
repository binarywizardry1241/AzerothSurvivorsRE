14025017d: 498b4d08 mov rcx, qword ptr [r13 + 8]
140250181: 498b5510 mov rdx, qword ptr [r13 + 0x10]
140250185: 4883fa20 cmp rdx, 0x20
140250189: 7307 jae 0x140250192
14025018b: e800549805 call 0x145bd5590
140250190: eb05 jmp 0x140250197
140250192: e8d94d9805 call 0x145bd4f70
140250197: 440f103d4db7b905 movups xmm15, xmmword ptr [rip + 0x5b9b74d]
14025019f: 4883f80d cmp rax, 0xd
1402501a3: 440f281dc5d0b405 movaps xmm11, xmmword ptr [rip + 0x5b4d0c5]
1402501ab: 0f1035c6b6b905 movups xmm6, xmmword ptr [rip + 0x5b9b6c6]
1402501b2: 730b jae 0x1402501bf
1402501b4: f3440f102d33cfb705 movss xmm13, dword ptr [rip + 0x5b7cf33]
1402501bd: eb46 jmp 0x140250205
1402501bf: 4885c0 test rax, rax
1402501c2: 7807 js 0x1402501cb
1402501c4: f34c0f2ae8 cvtsi2ss xmm13, rax
1402501c9: eb16 jmp 0x1402501e1
1402501cb: 4889c1 mov rcx, rax
1402501ce: 48d1e9 shr rcx, 1
1402501d1: 83e001 and eax, 1
1402501d4: 4809c8 or rax, rcx
1402501d7: f34c0f2ae8 cvtsi2ss xmm13, rax
1402501dc: f3450f58ed addss xmm13, xmm13
1402501e1: f3440f582d66cdb705 addss xmm13, dword ptr [rip + 0x5b7cd66]
1402501ea: f3440f592d61cdb705 mulss xmm13, dword ptr [rip + 0x5b7cd61]
1402501f3: f3440f582da4d0b405 addss xmm13, dword ptr [rip + 0x5b4d0a4]
1402501fc: f3440f592debceb705 mulss xmm13, dword ptr [rip + 0x5b7ceeb]
140250205: 488d8d50010000 lea rcx, [rbp + 0x150]
14025020c: 4c89ea mov rdx, r13
14025020f: e8dcd09705 call 0x145bcd2f0
140250214: 803f01 cmp byte ptr [rdi], 1
140250217: 751f jne 0x140250238
140250219: 8b4701 mov eax, dword ptr [rdi + 1]
14025021c: 8b4f04 mov ecx, dword ptr [rdi + 4]
14025021f: 898d03010000 mov dword ptr [rbp + 0x103], ecx
140250225: 898500010000 mov dword ptr [rbp + 0x100], eax
14025022b: 488b4708 mov rax, qword ptr [rdi + 8]
14025022f: 440fb64710 movzx r8d, byte ptr [rdi + 0x10]
140250234: b101 mov cl, 1
140250236: eb10 jmp 0x140250248
140250238: 488b4708 mov rax, qword ptr [rdi + 8]
14025023c: f048ff00 lock inc qword ptr [rax]
140250240: 0f8e2e1b0000 jle 0x140251d74
140250246: 31c9 xor ecx, ecx
140250248: 488d9518050000 lea rdx, [rbp + 0x518]
14025024f: 4c8b8d60010000 mov r9, qword ptr [rbp + 0x160]
140250256: 4c898db8050000 mov qword ptr [rbp + 0x5b8], r9
14025025d: 0f108550010000 movups xmm0, xmmword ptr [rbp + 0x150]
140250264: 0f1185a8050000 movups xmmword ptr [rbp + 0x5a8], xmm0
14025026b: 448b8d00010000 mov r9d, dword ptr [rbp + 0x100]
140250272: 448b9503010000 mov r10d, dword ptr [rbp + 0x103]
140250279: 44898dd9050000 mov dword ptr [rbp + 0x5d9], r9d
140250280: 448995dc050000 mov dword ptr [rbp + 0x5dc], r10d
140250287: 440f11bda1080000 movups xmmword ptr [rbp + 0x8a1], xmm15
14025028f: c785b10800000000803f mov dword ptr [rbp + 0x8b1], 0x3f800000
140250299: 48c785c005000000000000 mov qword ptr [rbp + 0x5c0], 0
1402502a4: 48c785c805000004000000 mov qword ptr [rbp + 0x5c8], 4
1402502af: 48c785d005000000000000 mov qword ptr [rbp + 0x5d0], 0
1402502ba: 888dd8050000 mov byte ptr [rbp + 0x5d8], cl
1402502c0: 488985e0050000 mov qword ptr [rbp + 0x5e0], rax
1402502c7: 4c8985e8050000 mov qword ptr [rbp + 0x5e8], r8
1402502ce: f3440f11adf0050000 movss dword ptr [rbp + 0x5f0], xmm13
1402502d7: 66c785f40500009001 mov word ptr [rbp + 0x5f4], 0x190
1402502e0: c685f605000001 mov byte ptr [rbp + 0x5f6], 1
1402502e7: 488b85ad080000 mov rax, qword ptr [rbp + 0x8ad]
1402502ee: 48898504060000 mov qword ptr [rbp + 0x604], rax
1402502f5: 0f1085a0080000 movups xmm0, xmmword ptr [rbp + 0x8a0]
1402502fc: 0f1185f7050000 movups xmmword ptr [rbp + 0x5f7], xmm0
140250303: 4489bd1c060000 mov dword ptr [rbp + 0x61c], r15d
14025030a: 440f103d7e57b805 movups xmm15, xmmword ptr [rip + 0x5b8577e]
140250312: 440f11bd0c060000 movups xmmword ptr [rbp + 0x60c], xmm15
14025031a: f20f10057ed1b405 movsd xmm0, qword ptr [rip + 0x5b4d17e]
140250322: f20f118520060000 movsd qword ptr [rbp + 0x620], xmm0
14025032a: 66c785280600000003 mov word ptr [rbp + 0x628], 0x300
140250333: 4c89b5a0050000 mov qword ptr [rbp + 0x5a0], r14
14025033a: 488d8d50010000 lea rcx, [rbp + 0x150]
140250341: 4c8d85a0050000 lea r8, [rbp + 0x5a0]
140250348: e853cbf9ff call 0x1401ecea0
14025034d: e8ae1edbff call 0x140002200
140250352: b901000000 mov ecx, 1
140250357: ba01000000 mov edx, 1
14025035c: e85f1edbff call 0x1400021c0
140250361: 4885c0 test rax, rax
140250364: 0f84dc190000 je 0x140251d46
14025036a: c6007c mov byte ptr [rax], 0x7c
14025036d: 803f01 cmp byte ptr [rdi], 1
140250370: 751f jne 0x140250391
140250372: 8b4f01 mov ecx, dword ptr [rdi + 1]
140250375: 8b5704 mov edx, dword ptr [rdi + 4]
140250378: 8995a3080000 mov dword ptr [rbp + 0x8a3], edx
14025037e: 898da0080000 mov dword ptr [rbp + 0x8a0], ecx
140250384: 488b4f08 mov rcx, qword ptr [rdi + 8]
140250388: 0fb65710 movzx edx, byte ptr [rdi + 0x10]
14025038c: 41b001 mov r8b, 1
14025038f: eb11 jmp 0x1402503a2
140250391: 488b4f08 mov rcx, qword ptr [rdi + 8]
140250395: f048ff01 lock inc qword ptr [rcx]
140250399: 0f8ed5190000 jle 0x140251d74
14025039f: 4531c0 xor r8d, r8d
1402503a2: 48c785a005000001000000 mov qword ptr [rbp + 0x5a0], 1
1402503ad: 488985a8050000 mov qword ptr [rbp + 0x5a8], rax
1402503b4: 48c785b005000001000000 mov qword ptr [rbp + 0x5b0], 1
1402503bf: 48c785b805000000000000 mov qword ptr [rbp + 0x5b8], 0
1402503ca: 48c785c005000004000000 mov qword ptr [rbp + 0x5c0], 4
1402503d5: 48c785c805000000000000 mov qword ptr [rbp + 0x5c8], 0
1402503e0: 448885d0050000 mov byte ptr [rbp + 0x5d0], r8b
1402503e7: 8b85a0080000 mov eax, dword ptr [rbp + 0x8a0]
1402503ed: 448b85a3080000 mov r8d, dword ptr [rbp + 0x8a3]
1402503f4: 8985d1050000 mov dword ptr [rbp + 0x5d1], eax
1402503fa: 448985d4050000 mov dword ptr [rbp + 0x5d4], r8d
140250401: 48898dd8050000 mov qword ptr [rbp + 0x5d8], rcx
140250408: 488995e0050000 mov qword ptr [rbp + 0x5e0], rdx
14025040f: f3440f11ade8050000 movss dword ptr [rbp + 0x5e8], xmm13
140250418: 66c785ec0500009001 mov word ptr [rbp + 0x5ec], 0x190
140250421: c685ee05000001 mov byte ptr [rbp + 0x5ee], 1
140250428: 0f11b5f0050000 movups xmmword ptr [rbp + 0x5f0], xmm6
14025042f: c785000600000000803f mov dword ptr [rbp + 0x600], 0x3f800000
140250439: 488d8d50010000 lea rcx, [rbp + 0x150]
140250440: 488d95a0050000 lea rdx, [rbp + 0x5a0]
140250447: e8648afaff call 0x1401f8eb0
