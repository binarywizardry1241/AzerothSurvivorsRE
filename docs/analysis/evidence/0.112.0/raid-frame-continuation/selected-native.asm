1458ec44d: 80b9df0a000001 cmp byte ptr [rcx + 0xadf], 1
1458ec454: 0f85be0d0000 jne 0x1458ed218
1458ec45a: 4989cd mov r13, rcx
1458ec45d: 80b9d80a000000 cmp byte ptr [rcx + 0xad8], 0
1458ec464: 0f85ae0d0000 jne 0x1458ed218
1458ed493: 418b8544050000 mov eax, dword ptr [r13 + 0x544]
1458ed49a: 85c0 test eax, eax
1458ed49c: 0f845a020000 je 0x1458ed6fc
1458ed6fc: 41c785e804000000000000 mov dword ptr [r13 + 0x4e8], 0
1458ed707: 41c685df0a000004 mov byte ptr [r13 + 0xadf], 4
1458ed70f: 41c7859009000001000000 mov dword ptr [r13 + 0x990], 1
1458ed71a: f3410f11b594090000 movss dword ptr [r13 + 0x994], xmm6
145900736: 90 nop
145900737: 4c89e6 mov rsi, r12
14590073a: 4c8bad38040000 mov r13, qword ptr [rbp + 0x438]
145900741: 483bb510040000 cmp rsi, qword ptr [rbp + 0x410]
145900748: 0f8542ffffff jne 0x145900690
14590074e: e9f90c0000 jmp 0x14590144c
14590144c: 488b9528040000 mov rdx, qword ptr [rbp + 0x428]
145901453: 4885d2 test rdx, rdx
145901456: 7416 je 0x14590146e
14590146e: 4d8bb588050000 mov r14, qword ptr [r13 + 0x588]
145901475: 4d85f6 test r14, r14
145901478: 4d89ec mov r12, r13
14590147b: 0f84cb040000 je 0x14590194c
14590194c: 4c89e1 mov rcx, r12
14590194f: 0f28ce movaps xmm1, xmm6
145901952: e8694b0100 call 0x1459164c0
145901957: f3450f1084244c0a0000 movss xmm8, dword ptr [r12 + 0xa4c]
145901961: 4d8bbc24d0050000 mov r15, qword ptr [r12 + 0x5d0]
145901969: 4d85ff test r15, r15
14590196c: 4d89e5 mov r13, r12
14590196f: 0f8462010000 je 0x145901ad7
145901ad7: 498d8520060000 lea rax, [r13 + 0x620]
145901ade: 48898528040000 mov qword ptr [rbp + 0x428], rax
145901ae5: 498d8df0090000 lea rcx, [r13 + 0x9f0]
145901aec: 498d85b8090000 lea rax, [r13 + 0x9b8]
145901af3: 48898598000000 mov qword ptr [rbp + 0x98], rax
145901afa: 498d85c8060000 lea rax, [r13 + 0x6c8]
145901b01: 488985e0030000 mov qword ptr [rbp + 0x3e0], rax
145901b08: 450f57e4 xorps xmm12, xmm12
145901b0c: f3440f103d2b0f5c00 movss xmm15, dword ptr [rip + 0x5c0f2b]
145901b15: f30f103dc3b94a00 movss xmm7, dword ptr [rip + 0x4ab9c3]
145901b1d: 31ff xor edi, edi
145901b1f: 48898de8030000 mov qword ptr [rbp + 0x3e8], rcx
145901b26: 498b9d00060000 mov rbx, qword ptr [r13 + 0x600]
145901b2d: 4839df cmp rdi, rbx
145901b30: 0f83a00d0000 jae 0x1459028d6
1459028d6: 4c89e9 mov rcx, r13
1459028d9: 0f28ce movaps xmm1, xmm6
1459028dc: e82f2e0400 call 0x145945710
1459028e1: f2410f10bdd0040000 movsd xmm7, qword ptr [r13 + 0x4d0]
1459028ea: 418b85d8040000 mov eax, dword ptr [r13 + 0x4d8]
1459028f1: 898510040000 mov dword ptr [rbp + 0x410], eax
1459028f7: f3450f10854c0a0000 movss xmm8, dword ptr [r13 + 0xa4c]
145902900: f3450f108d98040000 movss xmm9, dword ptr [r13 + 0x498]
145902909: 48c7856003000000000000 mov qword ptr [rbp + 0x360], 0
145902914: 48c7856803000008000000 mov qword ptr [rbp + 0x368], 8
14590291f: 48c7857003000000000000 mov qword ptr [rbp + 0x370], 0
14590292a: 498b8510060000 mov rax, qword ptr [r13 + 0x610]
145902931: 498b8d18060000 mov rcx, qword ptr [r13 + 0x618]
145902938: 488d0cc9 lea rcx, [rcx + rcx*8]
14590293c: 488d0cc8 lea rcx, [rax + rcx*8]
145902940: 488985a0000000 mov qword ptr [rbp + 0xa0], rax
145902947: 48898da8000000 mov qword ptr [rbp + 0xa8], rcx
14590294e: 4c89adb0000000 mov qword ptr [rbp + 0xb0], r13
145902955: c685d703000001 mov byte ptr [rbp + 0x3d7], 1
14590295c: 488d8d90030000 lea rcx, [rbp + 0x390]
145902963: 488d95a0000000 lea rdx, [rbp + 0xa0]
14590296a: e8b1230d00 call 0x1459d4d20
14590296f: 90 nop
145902970: 498d85d0040000 lea rax, [r13 + 0x4d0]
145902977: 488985c8030000 mov qword ptr [rbp + 0x3c8], rax
14590297e: 4d8ba510060000 mov r12, qword ptr [r13 + 0x610]
145902985: 498b8518060000 mov rax, qword ptr [r13 + 0x618]
14590298c: 488d04c0 lea rax, [rax + rax*8]
145902990: 498d3cc4 lea rdi, [r12 + rax*8]
145902994: 4c8b8d98030000 mov r9, qword ptr [rbp + 0x398]
14590299b: 488b9da0030000 mov rbx, qword ptr [rbp + 0x3a0]
1459029a2: 49bef8ffffffffffff0f movabs r14, 0xffffffffffffff8
1459029ac: 4921de and r14, rbx
1459029af: c1e303 shl ebx, 3
1459029b2: 83e338 and ebx, 0x38
1459029b5: f3440f101576834b00 movss xmm10, dword ptr [rip + 0x4b8376]
1459029be: f3440f101d09885a00 movss xmm11, dword ptr [rip + 0x5a8809]
1459029c7: f3440f102d94365000 movss xmm13, dword ptr [rip + 0x503694]
1459029d0: f3440f10356f414b00 movss xmm14, dword ptr [rip + 0x4b416f]
1459029d9: 4c8dad60030000 lea r13, [rbp + 0x360]
1459029e0: f3440f10255b414b00 movss xmm12, dword ptr [rip + 0x4b415b]
1459029e9: 4c898df8030000 mov qword ptr [rbp + 0x3f8], r9
1459029f0: eb3e jmp 0x145902a30
145902a30: 4939fc cmp r12, rdi
145902a33: 410f95c2 setne r10b
145902a37: 0f8414020000 je 0x145902c51
145902a3d: 4c89e0 mov rax, r12
145902a40: 410f28c0 movaps xmm0, xmm8
145902a44: f3410f5c442440 subss xmm0, dword ptr [r12 + 0x40]
145902a4b: 410f2ec2 ucomiss xmm0, xmm10
145902a4f: 765f jbe 0x145902ab0
145902a51: 488b5028 mov rdx, qword ptr [rax + 0x28]
145902a55: 4531c0 xor r8d, r8d
145902a58: 0f1f840000000000 nop dword ptr [rax + rax]
145902a60: 4d39c6 cmp r14, r8
145902a63: 0f8407010000 je 0x145902b70
145902ab2: 4c8d6048 lea r12, [rax + 0x48]
145902ab6: 83782000 cmp dword ptr [rax + 0x20], 0
145902aba: 0f8570ffffff jne 0x145902a30
145902ac0: 80781800 cmp byte ptr [rax + 0x18], 0
145902ac4: 0f8566ffffff jne 0x145902a30
145902b70: 4885db test rbx, rbx
145902b73: 0f84d1000000 je 0x145902c4a
145902c4a: b101 mov cl, 1
145902c4c: e961feffff jmp 0x145902ab2
145902c51: 44889508040000 mov byte ptr [rbp + 0x408], r10b
145902c58: 488b8560030000 mov rax, qword ptr [rbp + 0x360]
145902c5f: 48898580030000 mov qword ptr [rbp + 0x380], rax
145902c66: 4c8bad68030000 mov r13, qword ptr [rbp + 0x368]
145902c6d: 488b8570030000 mov rax, qword ptr [rbp + 0x370]
145902c74: 488d0440 lea rax, [rax + rax*2]
145902c78: 488d34c500000000 lea rsi, [rax*8]
145902c80: 4c01ee add rsi, r13
145902c83: f3440f1015f45b4b00 movss xmm10, dword ptr [rip + 0x4b5bf4]
145902c8c: 4531e4 xor r12d, r12d
145902c8f: 450f57db xorps xmm11, xmm11
145902c93: 488dbda0000000 lea rdi, [rbp + 0xa0]
145902c9a: 488d9d80020000 lea rbx, [rbp + 0x280]
145902ca1: 4c8db500030000 lea r14, [rbp + 0x300]
145902ca8: 4c89add8030000 mov qword ptr [rbp + 0x3d8], r13
145902caf: eb49 jmp 0x145902cfa
145902cfa: 4939f5 cmp r13, rsi
145902cfd: 0f84af000000 je 0x145902db2
145902db2: 488b8580030000 mov rax, qword ptr [rbp + 0x380]
145902db9: 4885c0 test rax, rax
145902dbc: 741a je 0x145902dd8
145902dd8: 48c7858002000000000000 mov qword ptr [rbp + 0x280], 0
145902de3: 48c7858802000008000000 mov qword ptr [rbp + 0x288], 8
145902dee: 48c7859002000000000000 mov qword ptr [rbp + 0x290], 0
145902df9: 488b8538040000 mov rax, qword ptr [rbp + 0x438]
145902e00: 488b8810060000 mov rcx, qword ptr [rax + 0x610]
145902e07: 488b8018060000 mov rax, qword ptr [rax + 0x618]
145902e0e: 488d04c0 lea rax, [rax + rax*8]
145902e12: 488d14c1 lea rdx, [rcx + rax*8]
145902e16: 31db xor ebx, ebx
145902e18: 488dbd80020000 lea rdi, [rbp + 0x280]
145902e1f: f3440f101558a64a00 movss xmm10, dword ptr [rip + 0x4aa658]
145902e28: 4531f6 xor r14d, r14d
145902e2b: 488995d8030000 mov qword ptr [rbp + 0x3d8], rdx
145902e32: 4839d1 cmp rcx, rdx
145902e35: 7539 jne 0x145902e70
145902e37: e9b9000000 jmp 0x145902ef5
145902e70: 8b4120 mov eax, dword ptr [rcx + 0x20]
145902e73: 85c0 test eax, eax
145902e75: 7425 je 0x145902e9c
145902e77: 83f801 cmp eax, 1
145902e7a: 75c4 jne 0x145902e40
145902e7c: f20f104134 movsd xmm0, qword ptr [rcx + 0x34]
145902e81: 0f5cc7 subps xmm0, xmm7
145902e84: 0f59c0 mulps xmm0, xmm0
145902e87: f30f16c8 movshdup xmm1, xmm0
145902e8b: f30f58c8 addss xmm1, xmm0
145902e8f: 0f57c0 xorps xmm0, xmm0
145902e92: f30f51c1 sqrtss xmm0, xmm1
145902e96: 440f2ec8 ucomiss xmm9, xmm0
145902e9a: 730d jae 0x145902ea9
145902e9c: 83791801 cmp dword ptr [rcx + 0x18], 1
145902ea0: 75be jne 0x145902e60
145902ea2: 440f2e411c ucomiss xmm8, dword ptr [rcx + 0x1c]
145902ea7: 72b7 jb 0x145902e60
145902ea9: 48898d80030000 mov qword ptr [rbp + 0x380], rcx
145902eb0: 483b9d80020000 cmp rbx, qword ptr [rbp + 0x280]
145902eb7: 7509 jne 0x145902ec2
145902eb9: 4889f9 mov rcx, rdi
145902ebc: e86faa3000 call 0x145c0d930
145902ec1: 90 nop
145902ec2: 488b8d80030000 mov rcx, qword ptr [rbp + 0x380]
145902ec9: 4883c148 add rcx, 0x48
145902ecd: 488b8588020000 mov rax, qword ptr [rbp + 0x288]
145902ed4: 4c8934d8 mov qword ptr [rax + rbx*8], r14
145902ed8: 49ffc6 inc r14
145902edb: 48ffc3 inc rbx
145902ede: 48899d90020000 mov qword ptr [rbp + 0x290], rbx
145902ee5: 488b95d8030000 mov rdx, qword ptr [rbp + 0x3d8]
145902eec: 4839d1 cmp rcx, rdx
145902eef: 0f857bffffff jne 0x145902e70
145902ef5: 48898d80030000 mov qword ptr [rbp + 0x380], rcx
145902efc: 488b8580020000 mov rax, qword ptr [rbp + 0x280]
145902f03: 488985e0030000 mov qword ptr [rbp + 0x3e0], rax
145902f0a: 488b8588020000 mov rax, qword ptr [rbp + 0x288]
145902f11: 48898510040000 mov qword ptr [rbp + 0x410], rax
145902f18: 4c8d3cd8 lea r15, [rax + rbx*8]
145902f1c: 4c8d256d7b3001 lea r12, [rip + 0x1307b6d]
145902f23: bf1e000000 mov edi, 0x1e
145902f28: 0f57ff xorps xmm7, xmm7
145902f2b: bb98040000 mov ebx, 0x498
145902f30: f3440f1005133c4b00 movss xmm8, dword ptr [rip + 0x4b3c13]
145902f39: 0f1f8000000000 nop dword ptr [rax]
145902f40: 4c39bd10040000 cmp qword ptr [rbp + 0x410], r15
145902f47: 0f845c060000 je 0x1459035a9
145902f4d: 4d8b6ff8 mov r13, qword ptr [r15 - 8]
145902f51: 488b8538040000 mov rax, qword ptr [rbp + 0x438]
145902f58: 488b9018060000 mov rdx, qword ptr [rax + 0x618]
145902f5f: 4939d5 cmp r13, rdx
145902f62: 0f832f530000 jae 0x145908297
145902f68: 4983c7f8 add r15, -8
145902f6c: 488b8010060000 mov rax, qword ptr [rax + 0x610]
145902f73: 4a8d0ced00000000 lea rcx, [r13*8]
145902f7b: 4c01e9 add rcx, r13
145902f7e: 448b74c820 mov r14d, dword ptr [rax + rcx*8 + 0x20]
145902f83: 8b74c824 mov esi, dword ptr [rax + rcx*8 + 0x24]
145902f87: 4183fe02 cmp r14d, 2
145902f8b: 0f85af000000 jne 0x145903040
145903040: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
145903047: 4c89ea mov rdx, r13
14590304a: e891a90400 call 0x14594d9e0
14590304f: 90 nop
145903050: 4489f0 mov eax, r14d
145903053: 488d0d8a913001 lea rcx, [rip + 0x130918a]
14590305a: 48630481 movsxd rax, dword ptr [rcx + rax*4]
14590305e: 4801c8 add rax, rcx
145903061: ffe0 jmp rax
145903213: 89f0 mov eax, esi
145903215: 0f57c0 xorps xmm0, xmm0
145903218: f3480f2ac0 cvtsi2ss xmm0, rax
14590321d: 488bb538040000 mov rsi, qword ptr [rbp + 0x438]
145903224: f30f59869c040000 mulss xmm0, dword ptr [rsi + 0x49c]
14590322c: e8ec713000 call 0x145c0a41d
145903231: f30f5f0527a04a00 maxss xmm0, dword ptr [rip + 0x4aa027]
145903239: f3480f2cd0 cvttss2si rdx, xmm0
14590323e: 0f2ec7 ucomiss xmm0, xmm7
145903241: b800000000 mov eax, 0
145903246: 0f42d0 cmovb edx, eax
145903249: 410f2ec4 ucomiss xmm0, xmm12
14590324d: b8ffffffff mov eax, 0xffffffff
145903252: 0f47d0 cmova edx, eax
145903255: 4889f1 mov rcx, rsi
145903258: e823ec0000 call 0x145911e80
14590325d: 90 nop
14590325e: e9ddfcffff jmp 0x145902f40
145903263: 89f0 mov eax, esi
145903265: 0f57c0 xorps xmm0, xmm0
145903268: f3480f2ac0 cvtsi2ss xmm0, rax
14590326d: 488bb538040000 mov rsi, qword ptr [rbp + 0x438]
145903274: f30f5986b0040000 mulss xmm0, dword ptr [rsi + 0x4b0]
14590327c: e89c713000 call 0x145c0a41d
145903281: f3480f2cc0 cvttss2si rax, xmm0
145903286: 0f2ec7 ucomiss xmm0, xmm7
145903289: b900000000 mov ecx, 0
14590328e: 0f42c1 cmovb eax, ecx
145903291: 410f2ec4 ucomiss xmm0, xmm12
145903295: b9ffffffff mov ecx, 0xffffffff
14590329a: 0f47c1 cmova eax, ecx
14590329d: 8b8ef0040000 mov ecx, dword ptr [rsi + 0x4f0]
1459032a3: 01c1 add ecx, eax
1459032a5: 898ef0040000 mov dword ptr [rsi + 0x4f0], ecx
1459032ab: 01869c070000 add dword ptr [rsi + 0x79c], eax
1459032b1: 4469c110270000 imul r8d, ecx, 0x2710
1459032b8: 488b86f0090000 mov rax, qword ptr [rsi + 0x9f0]
1459032bf: 4885c0 test rax, rax
1459032c2: 0f847a010000 je 0x145903442
145903442: 31c0 xor eax, eax
145903444: 488b8de8030000 mov rcx, qword ptr [rbp + 0x3e8]
14590344b: 48898da0000000 mov qword ptr [rbp + 0xa0], rcx
145903452: 488985a8000000 mov qword ptr [rbp + 0xa8], rax
145903459: 48c785b000000000000000 mov qword ptr [rbp + 0xb0], 0
145903464: 488995b8000000 mov qword ptr [rbp + 0xb8], rdx
14590346b: 48c785c000000098040000 mov qword ptr [rbp + 0xc0], 0x498
145903476: 488d8d00030000 lea rcx, [rbp + 0x300]
14590347d: 488d95a0000000 lea rdx, [rbp + 0xa0]
145903484: e867adfdff call 0x1458de1f0
145903489: 90 nop
14590348a: e9b1faffff jmp 0x145902f40
1459035a9: 488b95e0030000 mov rdx, qword ptr [rbp + 0x3e0]
1459035b0: 4885d2 test rdx, rdx
1459035b3: 7416 je 0x1459035cb
1459035b5: 48c1e203 shl rdx, 3
1459035b9: 41b808000000 mov r8d, 8
1459035bf: 488b8d10040000 mov rcx, qword ptr [rbp + 0x410]
1459035c6: e805ec6ffa call 0x1400021d0
1459035cb: 488b9590030000 mov rdx, qword ptr [rbp + 0x390]
1459035d2: 4885d2 test rdx, rdx
1459035d5: 488bb538040000 mov rsi, qword ptr [rbp + 0x438]
1459035dc: 7416 je 0x1459035f4
1459035f4: 80bedf0a000001 cmp byte ptr [rsi + 0xadf], 1
1459035fb: 0f85170b0000 jne 0x145904118
145903601: 488b8538040000 mov rax, qword ptr [rbp + 0x438]
145903608: 488b9860090000 mov rbx, qword ptr [rax + 0x960]
14590360f: 4885db test rbx, rbx
145903612: 0f84000b0000 je 0x145904118
1459128da: 83be600a000000 cmp dword ptr [rsi + 0xa60], 0
1459128e1: 7431 je 0x145912914
1459128e3: 80bedf0a000001 cmp byte ptr [rsi + 0xadf], 1
1459128ea: 7528 jne 0x145912914
1459128ec: 80bed80a000000 cmp byte ptr [rsi + 0xad8], 0
1459128f3: 751f jne 0x145912914
1459128f5: 80bed40a000001 cmp byte ptr [rsi + 0xad4], 1
1459128fc: 7509 jne 0x145912907
1459128fe: 80bed50a000000 cmp byte ptr [rsi + 0xad5], 0
145912905: 740d je 0x145912914
145912907: 4889f1 mov rcx, rsi
14591290a: 31d2 xor edx, edx
14591290c: 41b001 mov r8b, 1
14591290f: e84ca10400 call 0x14595ca60
1459165e4: 4d8bb5b8050000 mov r14, qword ptr [r13 + 0x5b8]
1459165eb: 4d85f6 test r14, r14
1459165ee: 4c89ad48020000 mov qword ptr [rbp + 0x248], r13
1459165f5: 0f845c0a0000 je 0x145917057
1459165fb: 498d8520060000 lea rax, [r13 + 0x620]
145916602: 48898590020000 mov qword ptr [rbp + 0x290], rax
14591663a: 31c9 xor ecx, ecx
14591663c: eb15 jmp 0x145916653
145916674: 49f7d0 not r8
145916677: 48898d38020000 mov qword ptr [rbp + 0x238], rcx
14591667e: 4c898588020000 mov qword ptr [rbp + 0x288], r8
145916685: 4c39f1 cmp rcx, r14
145916688: 0f836f500000 jae 0x14591b6fd
14591668e: 4a8d0c20 lea rcx, [rax + r12]
145916692: 4e8b3c20 mov r15, qword ptr [rax + r12]
145916696: 428b542010 mov edx, dword ptr [rax + r12 + 0x10]
14591669b: 899570020000 mov dword ptr [rbp + 0x270], edx
1459166a1: 4a8b542014 mov rdx, qword ptr [rax + r12 + 0x14]
1459166a6: 488995a8010000 mov qword ptr [rbp + 0x1a8], rdx
1459166ad: 420fb654203c movzx edx, byte ptr [rax + r12 + 0x3c]
1459166b3: 889500020000 mov byte ptr [rbp + 0x200], dl
1459166b9: 420f1044202c movups xmm0, xmmword ptr [rax + r12 + 0x2c]
1459166bf: 0f2985f0010000 movaps xmmword ptr [rbp + 0x1f0], xmm0
1459166c6: 420f1044201c movups xmm0, xmmword ptr [rax + r12 + 0x1c]
1459166cc: 0f2985e0010000 movaps xmmword ptr [rbp + 0x1e0], xmm0
1459166d3: 420fb674203d movzx esi, byte ptr [rax + r12 + 0x3d]
1459166d9: 460fb76c203e movzx r13d, word ptr [rax + r12 + 0x3e]
1459166df: 4a8d1420 lea rdx, [rax + r12]
1459166e3: 4883c240 add rdx, 0x40
1459166e7: 4d01f0 add r8, r14
1459166ea: 49c1e006 shl r8, 6
1459166ee: e8fa3c2f00 call 0x145c0a3ed
1459166f3: 49ffce dec r14
1459166f6: 488b8d48020000 mov rcx, qword ptr [rbp + 0x248]
1459166fd: 4c89b1b8050000 mov qword ptr [rcx + 0x5b8], r14
145916704: 4080feff cmp sil, 0xff
145916708: 0f84ef4f0000 je 0x14591b6fd
14591670e: 0fb68500020000 movzx eax, byte ptr [rbp + 0x200]
145916715: 8885a0010000 mov byte ptr [rbp + 0x1a0], al
14591671b: 0f2885e0010000 movaps xmm0, xmmword ptr [rbp + 0x1e0]
145916722: 0f288df0010000 movaps xmm1, xmmword ptr [rbp + 0x1f0]
145916729: 0f298d90010000 movaps xmmword ptr [rbp + 0x190], xmm1
145916730: 0f298580010000 movaps xmmword ptr [rbp + 0x180], xmm0
145916737: 488b8970050000 mov rcx, qword ptr [rcx + 0x570]
14591673e: 4885c9 test rcx, rcx
145916741: 0f84f9080000 je 0x145917040
145916747: 488b8548020000 mov rax, qword ptr [rbp + 0x248]
14591674e: 488b8068050000 mov rax, qword ptr [rax + 0x568]
145916755: 4869c9d8010000 imul rcx, rcx, 0x1d8
14591675c: 31db xor ebx, ebx
14591675e: 31ff xor edi, edi
145916760: eb21 jmp 0x145916783
145916770: 48ffc7 inc rdi
145916773: 4881c3d8010000 add rbx, 0x1d8
14591677a: 4839d9 cmp rcx, rbx
14591677d: 0f84bd080000 je 0x145917040
145916783: 4c39bc18f0000000 cmp qword ptr [rax + rbx + 0xf0], r15
14591678b: 75e3 jne 0x145916770
14591678d: f68418b000000001 test byte ptr [rax + rbx + 0xb0], 1
145916795: 75d9 jne 0x145916770
145916797: 89f1 mov ecx, esi
145916799: 80e923 sub cl, 0x23
14591679c: 0fb6c9 movzx ecx, cl
14591679f: 48ffc1 inc rcx
1459167a2: 4080fe23 cmp sil, 0x23
1459167a6: ba00000000 mov edx, 0
1459167ab: 480f42ca cmovb rcx, rdx
1459167af: 488d155a5a2f01 lea rdx, [rip + 0x12f5a5a]
1459167b6: 48630c8a movsxd rcx, dword ptr [rdx + rcx*4]
1459167ba: 4801d1 add rcx, rdx
1459167bd: ffe1 jmp rcx
14591aea4: 4180bfdf0a000001 cmp byte ptr [r15 + 0xadf], 1
14591aeac: 0f94c0 sete al
14591aeaf: 8445f8 test byte ptr [rbp - 8], al
14591aeb2: 0f8418010000 je 0x14591afd0
145945710: 55 push rbp
145945711: 4157 push r15
145945713: 4156 push r14
145945715: 4155 push r13
145945717: 4154 push r12
145945719: 56 push rsi
14594571a: 57 push rdi
14594571b: 53 push rbx
14594571c: 4881ec68040000 sub rsp, 0x468
145945723: 488dac2480000000 lea rbp, [rsp + 0x80]
14594572b: 440f29bdd0030000 movaps xmmword ptr [rbp + 0x3d0], xmm15
145945733: 440f29b5c0030000 movaps xmmword ptr [rbp + 0x3c0], xmm14
14594573b: 440f29adb0030000 movaps xmmword ptr [rbp + 0x3b0], xmm13
145945743: 440f29a5a0030000 movaps xmmword ptr [rbp + 0x3a0], xmm12
14594574b: 440f299d90030000 movaps xmmword ptr [rbp + 0x390], xmm11
145945753: 440f299580030000 movaps xmmword ptr [rbp + 0x380], xmm10
14594575b: 440f298d70030000 movaps xmmword ptr [rbp + 0x370], xmm9
145945763: 440f298560030000 movaps xmmword ptr [rbp + 0x360], xmm8
14594576b: 0f29bd50030000 movaps xmmword ptr [rbp + 0x350], xmm7
145945772: 0f29b540030000 movaps xmmword ptr [rbp + 0x340], xmm6
145945779: 48c78538030000feffffff mov qword ptr [rbp + 0x338], 0xfffffffffffffffe
1459457a6: f30f1185fc010000 movss dword ptr [rbp + 0x1fc], xmm0
1459457ae: 488b89a8020000 mov rcx, qword ptr [rcx + 0x2a8]
1459457b5: 498b97b0020000 mov rdx, qword ptr [r15 + 0x2b0]
1459457bc: e8ff35f5ff call 0x145898dc0
1459457c1: 4889c7 mov rdi, rax
1459457c4: 48c785b002000000000000 mov qword ptr [rbp + 0x2b0], 0
1459457cf: 48c785b802000008000000 mov qword ptr [rbp + 0x2b8], 8
1459457da: 48c785c002000000000000 mov qword ptr [rbp + 0x2c0], 0
1459457e5: 48c7859001000000000000 mov qword ptr [rbp + 0x190], 0
1459457f0: 48c7859801000008000000 mov qword ptr [rbp + 0x198], 8
1459457fb: 48c785a001000000000000 mov qword ptr [rbp + 0x1a0], 0
145945806: 48c7857801000000000000 mov qword ptr [rbp + 0x178], 0
145945811: 48c7858001000008000000 mov qword ptr [rbp + 0x180], 8
14594581c: 48c7858801000000000000 mov qword ptr [rbp + 0x188], 0
145945827: 48c7852802000000000000 mov qword ptr [rbp + 0x228], 0
145945832: 48c7853002000008000000 mov qword ptr [rbp + 0x230], 8
14594583d: 48c7853802000000000000 mov qword ptr [rbp + 0x238], 0
145945848: 48c7852801000000000000 mov qword ptr [rbp + 0x128], 0
145945853: 48c7853001000008000000 mov qword ptr [rbp + 0x130], 8
14594585e: 48c7853801000000000000 mov qword ptr [rbp + 0x138], 0
145945869: 48c7851001000000000000 mov qword ptr [rbp + 0x110], 0
145945874: 48c7851801000008000000 mov qword ptr [rbp + 0x118], 8
14594587f: 48c7852001000000000000 mov qword ptr [rbp + 0x120], 0
14594588a: 48c785f800000000000000 mov qword ptr [rbp + 0xf8], 0
145945895: 48c7850001000008000000 mov qword ptr [rbp + 0x100], 8
1459458a0: 48c7850801000000000000 mov qword ptr [rbp + 0x108], 0
1459458ab: 48c785e000000000000000 mov qword ptr [rbp + 0xe0], 0
1459458b6: 48c785e800000008000000 mov qword ptr [rbp + 0xe8], 8
1459458c1: 48c785f000000000000000 mov qword ptr [rbp + 0xf0], 0
1459458cc: 48c785c800000000000000 mov qword ptr [rbp + 0xc8], 0
1459458d7: 48c785d000000008000000 mov qword ptr [rbp + 0xd0], 8
1459458e2: 48c785d800000000000000 mov qword ptr [rbp + 0xd8], 0
1459458ed: 48c785b000000000000000 mov qword ptr [rbp + 0xb0], 0
1459458f8: 48c785b800000008000000 mov qword ptr [rbp + 0xb8], 8
145945903: 48c785c000000000000000 mov qword ptr [rbp + 0xc0], 0
14594590e: 48c785e001000000000000 mov qword ptr [rbp + 0x1e0], 0
145945919: 48c785e801000008000000 mov qword ptr [rbp + 0x1e8], 8
145945924: 48c785f001000000000000 mov qword ptr [rbp + 0x1f0], 0
14594592f: 48c7859800000000000000 mov qword ptr [rbp + 0x98], 0
14594593a: 48c785a000000008000000 mov qword ptr [rbp + 0xa0], 8
145945945: 48c785a800000000000000 mov qword ptr [rbp + 0xa8], 0
145945950: 48c7856001000000000000 mov qword ptr [rbp + 0x160], 0
14594595b: 48c7856801000008000000 mov qword ptr [rbp + 0x168], 8
145945966: 48c7857001000000000000 mov qword ptr [rbp + 0x170], 0
145945971: 498b87b0090000 mov rax, qword ptr [r15 + 0x9b0]
145945978: f048ff00 lock inc qword ptr [rax]
14594597c: 0f8eb4520000 jle 0x14594ac36
145945982: 498b97b0090000 mov rdx, qword ptr [r15 + 0x9b0]
145945989: 48899558010000 mov qword ptr [rbp + 0x158], rdx
145945990: 48837a40ff cmp qword ptr [rdx + 0x40], -1
145945995: 498bb7d8090000 mov rsi, qword ptr [r15 + 0x9d8]
14594599c: 0f840e020000 je 0x145945bb0
145945bb0: 4885f6 test rsi, rsi
145945bb3: 7413 je 0x145945bc8
145945bc8: 31c0 xor eax, eax
145945bca: 4869cff0000000 imul rcx, rdi, 0xf0
145945bd1: 488d1558ca2a01 lea rdx, [rip + 0x12aca58]
145945bd8: 4801ca add rdx, rcx
145945bdb: 48898550010000 mov qword ptr [rbp + 0x150], rax
145945be2: 488b8558010000 mov rax, qword ptr [rbp + 0x158]
145945be9: 488b4840 mov rcx, qword ptr [rax + 0x40]
145945bed: 48898d40010000 mov qword ptr [rbp + 0x140], rcx
145945bf4: 4883c040 add rax, 0x40
145945bf8: 48898548010000 mov qword ptr [rbp + 0x148], rax
145945bff: 498d8760050000 lea rax, [r15 + 0x560]
145945c06: 48894560 mov qword ptr [rbp + 0x60], rax
145945cb3: 4c89bd20030000 mov qword ptr [rbp + 0x320], r15
145945cba: eb20 jmp 0x145945cdc
145945dd6: 4d8b7808 mov r15, qword ptr [r8 + 8]
145945dda: 498b4010 mov rax, qword ptr [r8 + 0x10]
145945dde: 488d0440 lea rax, [rax + rax*2]
145945de2: 48c1e004 shl rax, 4
145945de6: 4c01f8 add rax, r15
145945de9: 488985c8020000 mov qword ptr [rbp + 0x2c8], rax
145945df0: 4c898510030000 mov qword ptr [rbp + 0x310], r8
145945df7: 4c3bbdc8020000 cmp r15, qword ptr [rbp + 0x2c8]
145945dfe: 7524 jne 0x145945e24
145945e00: e98f010000 jmp 0x145945f94
145945f94: 498b5008 mov rdx, qword ptr [r8 + 8]
145945f98: 498b4010 mov rax, qword ptr [r8 + 0x10]
145945f9c: 4c8d0440 lea r8, [rax + rax*2]
145945fa0: 49c1e004 shl r8, 4
145945fa4: 4901d0 add r8, rdx
145945fa7: c6853703000001 mov byte ptr [rbp + 0x337], 1
145945fae: c6853603000001 mov byte ptr [rbp + 0x336], 1
145945fb5: c6853503000001 mov byte ptr [rbp + 0x335], 1
145945fbc: c6853403000001 mov byte ptr [rbp + 0x334], 1
145945fc3: c6853303000001 mov byte ptr [rbp + 0x333], 1
145945fca: c6853203000001 mov byte ptr [rbp + 0x332], 1
145945fd1: c6853103000001 mov byte ptr [rbp + 0x331], 1
145945fd8: c6853003000001 mov byte ptr [rbp + 0x330], 1
145945fdf: c6852f03000001 mov byte ptr [rbp + 0x32f], 1
145945fe6: c6852e03000001 mov byte ptr [rbp + 0x32e], 1
145945fed: c6852d03000001 mov byte ptr [rbp + 0x32d], 1
145945ff4: c6852c03000001 mov byte ptr [rbp + 0x32c], 1
145945ffb: 488d8d00020000 lea rcx, [rbp + 0x200]
145946002: e8c9cf0800 call 0x1459d2fd0
145946007: 90 nop
145946008: 4c8bb510030000 mov r14, qword ptr [rbp + 0x310]
14594600f: 498b4610 mov rax, qword ptr [r14 + 0x10]
145946013: 4885c0 test rax, rax
145946016: 742f je 0x145946047
145946047: 488b8500020000 mov rax, qword ptr [rbp + 0x200]
14594604e: 48898518030000 mov qword ptr [rbp + 0x318], rax
145946055: 488b8508020000 mov rax, qword ptr [rbp + 0x208]
14594605c: 488985f0020000 mov qword ptr [rbp + 0x2f0], rax
145946063: 488b8510020000 mov rax, qword ptr [rbp + 0x210]
14594606a: 4885c0 test rax, rax
14594606d: 0f84fd000000 je 0x145946170
145946170: 488b9518030000 mov rdx, qword ptr [rbp + 0x318]
145946177: 4885d2 test rdx, rdx
14594617a: 7416 je 0x145946192
145946192: 418bb69c010000 mov esi, dword ptr [r14 + 0x19c]
145946199: 85f6 test esi, esi
14594619b: 0f84b8000000 je 0x145946259
145946311: f3410f1086a8010000 movss xmm0, dword ptr [r14 + 0x1a8]
14594631a: 0f2ec6 ucomiss xmm0, xmm6
14594631d: 4c8bbd20030000 mov r15, qword ptr [rbp + 0x320]
145946324: 0f8670010000 jbe 0x14594649a
14594649a: f3410f1086ac010000 movss xmm0, dword ptr [r14 + 0x1ac]
1459464a3: 0f2ec6 ucomiss xmm0, xmm6
1459464a6: 0f8730f8ffff ja 0x145945cdc
1459464ac: 410f2ec5 ucomiss xmm0, xmm13
1459464b0: 0f86de020000 jbe 0x145946794
145946794: f3410f1086c0010000 movss xmm0, dword ptr [r14 + 0x1c0]
14594679d: 0f2ec6 ucomiss xmm0, xmm6
1459467a0: 0f8736f5ffff ja 0x145945cdc
1459467a6: f3410f108690010000 movss xmm0, dword ptr [r14 + 0x190]
1459467af: 440f2ee8 ucomiss xmm13, xmm0
1459467b3: 0f8387010000 jae 0x145946940
145946940: 498b8680010000 mov rax, qword ptr [r14 + 0x180]
145946947: 488985e0020000 mov qword ptr [rbp + 0x2e0], rax
14594694e: 418b8688010000 mov eax, dword ptr [r14 + 0x188]
145946955: 8985e8020000 mov dword ptr [rbp + 0x2e8], eax
14594695b: f2440f10b5e0020000 movsd xmm14, qword ptr [rbp + 0x2e0]
145946964: 450f28ce movaps xmm9, xmm14
145946968: 440f5c4d70 subps xmm9, xmmword ptr [rbp + 0x70]
14594696d: 410f28c1 movaps xmm0, xmm9
145946971: 410f59c1 mulps xmm0, xmm9
145946975: f30f16c8 movshdup xmm1, xmm0
145946979: f30f58c8 addss xmm1, xmm0
14594697d: 0f57d2 xorps xmm2, xmm2
145946980: f30f51d1 sqrtss xmm2, xmm1
145946984: f3410f108698010000 movss xmm0, dword ptr [r14 + 0x198]
14594698d: f3410f108eb8010000 movss xmm1, dword ptr [r14 + 0x1b8]
145946996: f30f5cc7 subss xmm0, xmm7
14594699a: f3410f118698010000 movss dword ptr [r14 + 0x198], xmm0
1459469a3: 0f2ece ucomiss xmm1, xmm6
1459469a6: 0f86c7020000 jbe 0x145946c73
145946c73: 4180bec000000000 cmp byte ptr [r14 + 0xc0], 0
145946c7b: 0f2995f0020000 movaps xmmword ptr [rbp + 0x2f0], xmm2
145946c82: 0f842d040000 je 0x1459470b5
1459470f9: 440f138d40020000 movlps qword ptr [rbp + 0x240], xmm9
145947101: 89bd48020000 mov dword ptr [rbp + 0x248], edi
145947107: 0f284570 movaps xmm0, xmmword ptr [rbp + 0x70]
14594710b: 0f138560020000 movlps qword ptr [rbp + 0x260], xmm0
145947112: f30f1085fc010000 movss xmm0, dword ptr [rbp + 0x1fc]
14594711a: f30f118568020000 movss dword ptr [rbp + 0x268], xmm0
145947122: c6853703000001 mov byte ptr [rbp + 0x337], 1
145947129: c6853603000001 mov byte ptr [rbp + 0x336], 1
145947130: c6853503000001 mov byte ptr [rbp + 0x335], 1
145947137: c6853403000001 mov byte ptr [rbp + 0x334], 1
14594713e: c6853303000001 mov byte ptr [rbp + 0x333], 1
145947145: c6853203000001 mov byte ptr [rbp + 0x332], 1
14594714c: c6853103000001 mov byte ptr [rbp + 0x331], 1
145947153: c6853003000001 mov byte ptr [rbp + 0x330], 1
14594715a: c6852f03000001 mov byte ptr [rbp + 0x32f], 1
145947161: c6852e03000001 mov byte ptr [rbp + 0x32e], 1
145947168: c6852d03000001 mov byte ptr [rbp + 0x32d], 1
14594716f: c6852c03000001 mov byte ptr [rbp + 0x32c], 1
145947176: 4c89f1 mov rcx, r14
145947179: 488d9540020000 lea rdx, [rbp + 0x240]
145947180: 4c8d8560020000 lea r8, [rbp + 0x260]
145947187: 0f28de movaps xmm3, xmm6
14594718a: e8710d0700 call 0x1459b7f00
14594718f: 90 nop
145947190: 0fb6c0 movzx eax, al
145947193: 488d0dd2542c01 lea rcx, [rip + 0x12c54d2]
14594719a: 48630481 movsxd rax, dword ptr [rcx + rax*4]
14594719e: 4801c8 add rax, rcx
1459471a1: ffe0 jmp rax
1459471a3: 488bb510030000 mov rsi, qword ptr [rbp + 0x310]
1459471aa: f30f108690010000 movss xmm0, dword ptr [rsi + 0x190]
1459471b2: 410f2ec5 ucomiss xmm0, xmm13
1459471b6: 4c8bbd20030000 mov r15, qword ptr [rbp + 0x320]
1459471bd: 7611 jbe 0x1459471d0
1459471d0: 450f5cf1 subps xmm14, xmm9
1459471d4: 450f59f6 mulps xmm14, xmm14
1459471d8: f3410f16c6 movshdup xmm0, xmm14
1459471dd: f3410f58c6 addss xmm0, xmm14
1459471e2: 450f57d2 xorps xmm10, xmm10
1459471e6: f3440f51d0 sqrtss xmm10, xmm0
1459471eb: 440f2e1575604600 ucomiss xmm10, dword ptr [rip + 0x466075]
1459471f3: 0f86e3eaffff jbe 0x145945cdc
145948d58: 488b8560010000 mov rax, qword ptr [rbp + 0x160]
145948d5f: 48898518030000 mov qword ptr [rbp + 0x318], rax
145948d66: 4c8bb568010000 mov r14, qword ptr [rbp + 0x168]
145948d6d: 488b8570010000 mov rax, qword ptr [rbp + 0x170]
145948d74: 498d1cc6 lea rbx, [r14 + rax*8]
145948d78: 498d8720060000 lea rax, [r15 + 0x620]
145948d7f: 48898510030000 mov qword ptr [rbp + 0x310], rax
145948d86: 488dbd60020000 lea rdi, [rbp + 0x260]
145948d8d: 4c89b5c8020000 mov qword ptr [rbp + 0x2c8], r14
145948d94: eb4a jmp 0x145948de0
145948de0: 4939de cmp r14, rbx
145948de3: 7464 je 0x145948e49
145948e49: 488b9518030000 mov rdx, qword ptr [rbp + 0x318]
145948e50: 4885d2 test rdx, rdx
145948e53: 7416 je 0x145948e6b
145948e6b: 488b85b0020000 mov rax, qword ptr [rbp + 0x2b0]
145948e72: 488985f0020000 mov qword ptr [rbp + 0x2f0], rax
145948e79: 488b8db8020000 mov rcx, qword ptr [rbp + 0x2b8]
145948e80: 488b85c0020000 mov rax, qword ptr [rbp + 0x2c0]
145948e87: 488d0480 lea rax, [rax + rax*4]
145948e8b: 4c8d3cc1 lea r15, [rcx + rax*8]
145948e8f: 450f57d2 xorps xmm10, xmm10
145948e93: f3440f101de4f94600 movss xmm11, dword ptr [rip + 0x46f9e4]
145948ea5: 488dbd60020000 lea rdi, [rbp + 0x260]
145948eac: 4c8d6530 lea r12, [rbp + 0x30]
145948eb0: 48898d18030000 mov qword ptr [rbp + 0x318], rcx
145948eb7: 4889c8 mov rax, rcx
145948eba: eb3d jmp 0x145948ef9
145948ef9: 4c39f8 cmp rax, r15
145948efc: 0f847d010000 je 0x14594907f
14594907f: 488b85f0020000 mov rax, qword ptr [rbp + 0x2f0]
145949086: 4885c0 test rax, rax
145949089: 741a je 0x1459490a5
1459490a5: 488b8590010000 mov rax, qword ptr [rbp + 0x190]
1459490ac: 488985f0020000 mov qword ptr [rbp + 0x2f0], rax
1459490b3: 4c8ba598010000 mov r12, qword ptr [rbp + 0x198]
1459490ba: 4c8bb5a0010000 mov r14, qword ptr [rbp + 0x1a0]
1459490c1: 49c1e604 shl r14, 4
1459490c5: 4d01e6 add r14, r12
1459490d8: 488dbd60020000 lea rdi, [rbp + 0x260]
1459490df: 4c89a518030000 mov qword ptr [rbp + 0x318], r12
1459490e6: 4c8bad20030000 mov r13, qword ptr [rbp + 0x320]
1459491c3: 488b95f0020000 mov rdx, qword ptr [rbp + 0x2f0]
1459491ca: 4885d2 test rdx, rdx
1459491cd: 7416 je 0x1459491e5
1459491e5: 488b8578010000 mov rax, qword ptr [rbp + 0x178]
1459491ec: 48898518030000 mov qword ptr [rbp + 0x318], rax
1459491f3: 488b8580010000 mov rax, qword ptr [rbp + 0x180]
1459491fa: 488b9d88010000 mov rbx, qword ptr [rbp + 0x188]
145949201: 48c1e304 shl rbx, 4
145949205: 4801c3 add rbx, rax
145949208: 4c8bbd20030000 mov r15, qword ptr [rbp + 0x320]
14594920f: 498d8fd8050000 lea rcx, [r15 + 0x5d8]
145949216: 48898df0020000 mov qword ptr [rbp + 0x2f0], rcx
145949229: 488985c8020000 mov qword ptr [rbp + 0x2c8], rax
145949230: eb40 jmp 0x145949272
145949272: 4839d8 cmp rax, rbx
145949275: 0f84ba020000 je 0x145949535
145949535: 488b9518030000 mov rdx, qword ptr [rbp + 0x318]
14594953c: 4885d2 test rdx, rdx
14594953f: 7416 je 0x145949557
145949557: 488b85b0000000 mov rax, qword ptr [rbp + 0xb0]
14594955e: 48898520020000 mov qword ptr [rbp + 0x220], rax
145949565: 488bbdb8000000 mov rdi, qword ptr [rbp + 0xb8]
14594956c: 488b85c0000000 mov rax, qword ptr [rbp + 0xc0]
145949573: 488d0480 lea rax, [rax + rax*4]
145949577: 488d04c7 lea rax, [rdi + rax*8]
14594957b: 48898518030000 mov qword ptr [rbp + 0x318], rax
145949582: 498d87f0090000 lea rax, [r15 + 0x9f0]
145949589: 488985f0020000 mov qword ptr [rbp + 0x2f0], rax
145949590: 498d87c8060000 lea rax, [r15 + 0x6c8]
145949597: 488985c8020000 mov qword ptr [rbp + 0x2c8], rax
14594959e: 450f57d2 xorps xmm10, xmm10
1459495a2: 4889bda8010000 mov qword ptr [rbp + 0x1a8], rdi
1459495a9: eb0a jmp 0x1459495b5
1459495b5: 483bbd18030000 cmp rdi, qword ptr [rbp + 0x318]
1459495bc: 0f8402040000 je 0x1459499c4
1459499c4: 488b8520020000 mov rax, qword ptr [rbp + 0x220]
1459499cb: 4885c0 test rax, rax
1459499ce: 741a je 0x1459499ea
1459499ea: 488b85e0010000 mov rax, qword ptr [rbp + 0x1e0]
1459499f1: 488985f0020000 mov qword ptr [rbp + 0x2f0], rax
1459499f8: 488b85e8010000 mov rax, qword ptr [rbp + 0x1e8]
1459499ff: 488bb5f0010000 mov rsi, qword ptr [rbp + 0x1f0]
145949a06: 48c1e604 shl rsi, 4
145949a0a: 48898518030000 mov qword ptr [rbp + 0x318], rax
145949a11: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145949a45: 488b95f0020000 mov rdx, qword ptr [rbp + 0x2f0]
145949a4c: 4885d2 test rdx, rdx
145949a4f: 7416 je 0x145949a67
145949a67: 488b8598000000 mov rax, qword ptr [rbp + 0x98]
145949a6e: 488985f0020000 mov qword ptr [rbp + 0x2f0], rax
145949a75: 488b85a0000000 mov rax, qword ptr [rbp + 0xa0]
145949a7c: 488bb5a8000000 mov rsi, qword ptr [rbp + 0xa8]
145949a83: 48c1e604 shl rsi, 4
145949a87: 48898518030000 mov qword ptr [rbp + 0x318], rax
145949a8e: 6690 nop
145949ab2: 488b95f0020000 mov rdx, qword ptr [rbp + 0x2f0]
145949ab9: 4885d2 test rdx, rdx
145949abc: 7416 je 0x145949ad4
145949ad4: 488b8528010000 mov rax, qword ptr [rbp + 0x128]
145949adb: 488985f0020000 mov qword ptr [rbp + 0x2f0], rax
145949ae2: 4c8bb530010000 mov r14, qword ptr [rbp + 0x130]
145949ae9: 488b8538010000 mov rax, qword ptr [rbp + 0x138]
145949af0: 488d0480 lea rax, [rax + rax*4]
145949af4: 498d1cc6 lea rbx, [r14 + rax*8]
145949af8: 488dbd60020000 lea rdi, [rbp + 0x260]
145949aff: 4c89b518030000 mov qword ptr [rbp + 0x318], r14
145949b06: eb3b jmp 0x145949b43
145949b8a: 488b85f0020000 mov rax, qword ptr [rbp + 0x2f0]
145949b91: 4885c0 test rax, rax
145949b94: 741a je 0x145949bb0
145949bb0: 488b8510010000 mov rax, qword ptr [rbp + 0x110]
145949bb7: 488985f0020000 mov qword ptr [rbp + 0x2f0], rax
145949bbe: 4c8bb518010000 mov r14, qword ptr [rbp + 0x118]
145949bc5: 488b9d20010000 mov rbx, qword ptr [rbp + 0x120]
145949bcc: 48c1e305 shl rbx, 5
145949bd0: 4c01f3 add rbx, r14
145949bd3: 488dbd60020000 lea rdi, [rbp + 0x260]
145949bda: 4c89b518030000 mov qword ptr [rbp + 0x318], r14
145949be1: eb40 jmp 0x145949c23
145949c69: 488b95f0020000 mov rdx, qword ptr [rbp + 0x2f0]
145949c70: 4885d2 test rdx, rdx
145949c73: 7416 je 0x145949c8b
145949c8b: 488b8528020000 mov rax, qword ptr [rbp + 0x228]
145949c92: 48898518030000 mov qword ptr [rbp + 0x318], rax
145949c99: 488b8530020000 mov rax, qword ptr [rbp + 0x230]
145949ca0: 488985f0020000 mov qword ptr [rbp + 0x2f0], rax
145949d28: 488b8518030000 mov rax, qword ptr [rbp + 0x318]
145949d2f: 4885c0 test rax, rax
145949d32: 7416 je 0x145949d4a
145949fdc: 488b8518030000 mov rax, qword ptr [rbp + 0x318]
145949fe3: 4885c0 test rax, rax
145949fe6: 741a je 0x14594a002
14594a4f0: 488b95f0020000 mov rdx, qword ptr [rbp + 0x2f0]
14594a4f7: 4885d2 test rdx, rdx
14594a4fa: 7416 je 0x14594a512
14594a512: 488b85c8000000 mov rax, qword ptr [rbp + 0xc8]
14594a519: 488985f0020000 mov qword ptr [rbp + 0x2f0], rax
14594a520: 4c8ba5d0000000 mov r12, qword ptr [rbp + 0xd0]
14594a527: 488b85d8000000 mov rax, qword ptr [rbp + 0xd8]
14594a52e: 4d8d34c4 lea r14, [r12 + rax*8]
14594a532: 0f57f6 xorps xmm6, xmm6
14594a535: 0f57ff xorps xmm7, xmm7
14594a538: 4c8dbd60020000 lea r15, [rbp + 0x260]
14594a53f: 4c89a518030000 mov qword ptr [rbp + 0x318], r12
14594a546: eb4b jmp 0x14594a593
14594a593: 4d39f4 cmp r12, r14
14594a596: 0f846c020000 je 0x14594a808
14594a808: 488b95f0020000 mov rdx, qword ptr [rbp + 0x2f0]
14594a80f: 4885d2 test rdx, rdx
14594a812: 7416 je 0x14594a82a
14594a82a: 488b8550010000 mov rax, qword ptr [rbp + 0x150]
14594a831: 4885c0 test rax, rax
14594a834: 746e je 0x14594a8a4
14594a8a4: 488b8558010000 mov rax, qword ptr [rbp + 0x158]
14594a8ab: f048ff08 lock dec qword ptr [rax]
14594a8af: 7568 jne 0x14594a919
14594a919: 0f28b540030000 movaps xmm6, xmmword ptr [rbp + 0x340]
14594a920: 0f28bd50030000 movaps xmm7, xmmword ptr [rbp + 0x350]
14594a927: 440f288560030000 movaps xmm8, xmmword ptr [rbp + 0x360]
14594a92f: 440f288d70030000 movaps xmm9, xmmword ptr [rbp + 0x370]
14594a937: 440f289580030000 movaps xmm10, xmmword ptr [rbp + 0x380]
14594a93f: 440f289d90030000 movaps xmm11, xmmword ptr [rbp + 0x390]
14594a947: 440f28a5a0030000 movaps xmm12, xmmword ptr [rbp + 0x3a0]
14594a94f: 440f28adb0030000 movaps xmm13, xmmword ptr [rbp + 0x3b0]
14594a957: 440f28b5c0030000 movaps xmm14, xmmword ptr [rbp + 0x3c0]
14594a95f: 440f28bdd0030000 movaps xmm15, xmmword ptr [rbp + 0x3d0]
14594a967: 4881c468040000 add rsp, 0x468
14594a96e: 5b pop rbx
14594a96f: 5f pop rdi
14594a970: 5e pop rsi
14594a971: 415c pop r12
14594a973: 415d pop r13
14594a975: 415e pop r14
14594a977: 415f pop r15
14594a979: 5d pop rbp
14594a97a: c3 ret
14595d970: 0fb68527010000 movzx eax, byte ptr [rbp + 0x127]
14595d977: 8887dd0a0000 mov byte ptr [rdi + 0xadd], al
14595d97d: 80bd2601000000 cmp byte ptr [rbp + 0x126], 0
14595d984: 740f je 0x14595d995
14595d986: c687df0a000002 mov byte ptr [rdi + 0xadf], 2
14595d98d: 4889f9 mov rcx, rdi
14595d990: e86bdcf8ff call 0x1458eb600
