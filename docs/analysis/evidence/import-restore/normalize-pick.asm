0x1458a7fc0: 55 push rbp
0x1458a7fc1: 4157 push r15
0x1458a7fc3: 4156 push r14
0x1458a7fc5: 4155 push r13
0x1458a7fc7: 4154 push r12
0x1458a7fc9: 56 push rsi
0x1458a7fca: 57 push rdi
0x1458a7fcb: 53 push rbx
0x1458a7fcc: 4883ec58 sub rsp, 0x58
0x1458a7fd0: 488d6c2450 lea rbp, [rsp + 0x50]
0x1458a7fd5: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
0x1458a7fdd: 4889d7 mov rdi, rdx
0x1458a7fe0: 4889ce mov rsi, rcx
0x1458a7fe3: 0fb64238 movzx eax, byte ptr [rdx + 0x38]
0x1458a7fe7: 04fe add al, 0xfe
0x1458a7fe9: 3c0a cmp al, 0xa
0x1458a7feb: 7310 jae 0x1458a7ffd
0x1458a7fed: 0fb6c0 movzx eax, al
0x1458a7ff0: 488d0d493b3401 lea rcx, [rip + 0x1343b49]
0x1458a7ff7: 488b04c1 mov rax, qword ptr [rcx + rax*8]
0x1458a7ffb: eb07 jmp 0x1458a8004
0x1458a7ffd: 488d05e4863301 lea rax, [rip + 0x13386e4]
0x1458a8004: 0fb6808c000000 movzx eax, byte ptr [rax + 0x8c]
0x1458a800b: 884738 mov byte ptr [rdi + 0x38], al
0x1458a800e: fec8 dec al
0x1458a8010: 3c0b cmp al, 0xb
0x1458a8012: 731e jae 0x1458a8032
0x1458a8014: 0fb6c0 movzx eax, al
0x1458a8017: c1e003 shl eax, 3
0x1458a801a: 488d0d6f3b3401 lea rcx, [rip + 0x1343b6f]
0x1458a8021: 488b0c08 mov rcx, qword ptr [rax + rcx]
0x1458a8025: 488d15bc3b3401 lea rdx, [rip + 0x1343bbc]
0x1458a802c: 488b0410 mov rax, qword ptr [rax + rdx]
0x1458a8030: eb0c jmp 0x1458a803e
0x1458a8032: 488d0528363401 lea rax, [rip + 0x1343628]
0x1458a8039: b901000000 mov ecx, 1
0x1458a803e: 0fb65f39 movzx ebx, byte ptr [rdi + 0x39]
0x1458a8042: 31d2 xor edx, edx
0x1458a8044: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1458a8050: 381c10 cmp byte ptr [rax + rdx], bl
0x1458a8053: 740e je 0x1458a8063
0x1458a8055: 48ffc2 inc rdx
0x1458a8058: 4839d1 cmp rcx, rdx
0x1458a805b: 75f3 jne 0x1458a8050
0x1458a805d: 0fb618 movzx ebx, byte ptr [rax]
0x1458a8060: 885f39 mov byte ptr [rdi + 0x39], bl
0x1458a8063: 807f3a00 cmp byte ptr [rdi + 0x3a], 0
0x1458a8067: 0f95473a setne byte ptr [rdi + 0x3a]
0x1458a806b: 0f9545ff setne byte ptr [rbp - 1]
0x1458a806f: 4c8b7f20 mov r15, qword ptr [rdi + 0x20]
0x1458a8073: 488b5728 mov rdx, qword ptr [rdi + 0x28]
0x1458a8077: 4c89f9 mov rcx, r15
0x1458a807a: e85150feff call 0x14588d0d0
0x1458a807f: 4869c0f0000000 imul rax, rax, 0xf0
0x1458a8086: 488d0d03633301 lea rcx, [rip + 0x1336303]
0x1458a808d: 4c8b6c0808 mov r13, qword ptr [rax + rcx + 8]
0x1458a8092: 4c8b740810 mov r14, qword ptr [rax + rcx + 0x10]
0x1458a8097: e864a175fa call 0x140002200
0x1458a809c: ba01000000 mov edx, 1
0x1458a80a1: 4c89f1 mov rcx, r14
0x1458a80a4: e817a175fa call 0x1400021c0
0x1458a80a9: 4885c0 test rax, rax
0x1458a80ac: 48897df0 mov qword ptr [rbp - 0x10], rdi
0x1458a80b0: 0f848f020000 je 0x1458a8345
0x1458a80b6: 4989c4 mov r12, rax
0x1458a80b9: 4889c1 mov rcx, rax
0x1458a80bc: 4c89ea mov rdx, r13
0x1458a80bf: 4d89f0 mov r8, r14
0x1458a80c2: e820203500 call 0x145bfa0e7
0x1458a80c7: 488b5718 mov rdx, qword ptr [rdi + 0x18]
0x1458a80cb: 4885d2 test rdx, rdx
0x1458a80ce: 740e je 0x1458a80de
0x1458a80d0: 41b801000000 mov r8d, 1
0x1458a80d6: 4c89f9 mov rcx, r15
0x1458a80d9: e8f2a075fa call 0x1400021d0
0x1458a80de: 4c897718 mov qword ptr [rdi + 0x18], r14
0x1458a80e2: 4c896720 mov qword ptr [rdi + 0x20], r12
0x1458a80e6: 4c897728 mov qword ptr [rdi + 0x28], r14
0x1458a80ea: 4c8b7708 mov r14, qword ptr [rdi + 8]
0x1458a80ee: 4c8b7f10 mov r15, qword ptr [rdi + 0x10]
0x1458a80f2: 4c89f1 mov rcx, r14
0x1458a80f5: 4c89fa mov rdx, r15
0x1458a80f8: e813060000 call 0x1458a8710
0x1458a80fd: 90 nop
0x1458a80fe: 3cff cmp al, 0xff
0x1458a8100: 0f84f8010000 je 0x1458a82fe
0x1458a8106: e8f5a075fa call 0x140002200
0x1458a810b: 41bc04000000 mov r12d, 4
0x1458a8111: b904000000 mov ecx, 4
0x1458a8116: ba01000000 mov edx, 1
0x1458a811b: e8a0a075fa call 0x1400021c0
0x1458a8120: 4885c0 test rax, rax
0x1458a8123: 0f842c020000 je 0x1458a8355
0x1458a8129: 4989c7 mov r15, rax
0x1458a812c: c7004865726f mov dword ptr [rax], 0x6f726548
0x1458a8132: 41bd04000000 mov r13d, 4
0x1458a8138: 488b45f0 mov rax, qword ptr [rbp - 0x10]
0x1458a813c: 488b10 mov rdx, qword ptr [rax]
0x1458a813f: 4885d2 test rdx, rdx
0x1458a8142: 740e je 0x1458a8152
0x1458a8144: 41b801000000 mov r8d, 1
0x1458a814a: 4c89f1 mov rcx, r14
0x1458a814d: e87ea075fa call 0x1400021d0
0x1458a8152: 488b4df0 mov rcx, qword ptr [rbp - 0x10]
0x1458a8156: 4c8929 mov qword ptr [rcx], r13
0x1458a8159: 4c897908 mov qword ptr [rcx + 8], r15
0x1458a815d: 4c896110 mov qword ptr [rcx + 0x10], r12
0x1458a8161: 8b413b mov eax, dword ptr [rcx + 0x3b]
0x1458a8164: 0fb6493f movzx ecx, byte ptr [rcx + 0x3f]
0x1458a8168: 48c1e120 shl rcx, 0x20
0x1458a816c: 4809c1 or rcx, rax
0x1458a816f: 89da mov edx, ebx
0x1458a8171: 440fb645ff movzx r8d, byte ptr [rbp - 1]
0x1458a8176: e805a10f00 call 0x1459a2280
0x1458a817b: 90 nop
0x1458a817c: 488b7df0 mov rdi, qword ptr [rbp - 0x10]
0x1458a8180: 89473b mov dword ptr [rdi + 0x3b], eax
0x1458a8183: 48c1e820 shr rax, 0x20
0x1458a8187: 88473f mov byte ptr [rdi + 0x3f], al
0x1458a818a: 488b4730 mov rax, qword ptr [rdi + 0x30]
0x1458a818e: 4889c2 mov rdx, rax
0x1458a8191: 48c1ea20 shr rdx, 0x20
0x1458a8195: 0fb7ca movzx ecx, dx
0x1458a8198: 81f92c010000 cmp ecx, 0x12c
0x1458a819e: 41b82c010000 mov r8d, 0x12c
0x1458a81a4: 440f42c2 cmovb r8d, edx
0x1458a81a8: 4183c09c add r8d, -0x64
0x1458a81ac: 31c9 xor ecx, ecx
0x1458a81ae: 6683fa64 cmp dx, 0x64
0x1458a81b2: 440f42c1 cmovb r8d, ecx
0x1458a81b6: 410fb7d0 movzx edx, r8w
0x1458a81ba: 69d2cdcc0000 imul edx, edx, 0xcccd
0x1458a81c0: c1ea12 shr edx, 0x12
0x1458a81c3: 83e2fe and edx, 0xfffffffe
0x1458a81c6: 8d1492 lea edx, [rdx + rdx*4]
0x1458a81c9: 83c264 add edx, 0x64
0x1458a81cc: 4189c0 mov r8d, eax
0x1458a81cf: 41c1e810 shr r8d, 0x10
0x1458a81d3: 4589c2 mov r10d, r8d
0x1458a81d6: 4181f8f4010000 cmp r8d, 0x1f4
0x1458a81dd: 41b9f4010000 mov r9d, 0x1f4
0x1458a81e3: 450f43c1 cmovae r8d, r9d
0x1458a81e7: 4183c09c add r8d, -0x64
0x1458a81eb: 664183fa64 cmp r10w, 0x64
0x1458a81f0: 440f42c1 cmovb r8d, ecx
0x1458a81f4: 450fb7d0 movzx r10d, r8w
0x1458a81f8: 4569d2af470000 imul r10d, r10d, 0x47af
0x1458a81ff: 41c1ea10 shr r10d, 0x10
0x1458a8203: 4529d0 sub r8d, r10d
0x1458a8206: 450fb7c0 movzx r8d, r8w
0x1458a820a: 41d1e8 shr r8d, 1
0x1458a820d: 4501d0 add r8d, r10d
0x1458a8210: 41c1e804 shr r8d, 4
0x1458a8214: 478d0480 lea r8d, [r8 + r8*4]
0x1458a8218: 478d0480 lea r8d, [r8 + r8*4]
0x1458a821c: 41c1e010 shl r8d, 0x10
0x1458a8220: 440fb7d0 movzx r10d, ax
0x1458a8224: 4181faf4010000 cmp r10d, 0x1f4
0x1458a822b: 440f42c8 cmovb r9d, eax
0x1458a822f: 4183c19c add r9d, -0x64
0x1458a8233: 6683f864 cmp ax, 0x64
0x1458a8237: 440f42c9 cmovb r9d, ecx
0x1458a823b: 450fb7d1 movzx r10d, r9w
0x1458a823f: 4569d2af470000 imul r10d, r10d, 0x47af
0x1458a8246: 41c1ea10 shr r10d, 0x10
0x1458a824a: 4529d1 sub r9d, r10d
0x1458a824d: 450fb7c9 movzx r9d, r9w
0x1458a8251: 41d1e9 shr r9d, 1
0x1458a8254: 4501d1 add r9d, r10d
0x1458a8257: 41c1e904 shr r9d, 4
0x1458a825b: 478d0c89 lea r9d, [r9 + r9*4]
0x1458a825f: 478d0c89 lea r9d, [r9 + r9*4]
0x1458a8263: 4183c164 add r9d, 0x64
0x1458a8267: 4989c2 mov r10, rax
0x1458a826a: 49c1ea30 shr r10, 0x30
0x1458a826e: 48c1e832 shr rax, 0x32
0x1458a8272: 4181fa96000000 cmp r10d, 0x96
0x1458a8279: 41bb96000000 mov r11d, 0x96
0x1458a827f: 450f42da cmovb r11d, r10d
0x1458a8283: 4183c39c add r11d, -0x64
0x1458a8287: 83f819 cmp eax, 0x19
0x1458a828a: 440f42d9 cmovb r11d, ecx
0x1458a828e: 410fb7c3 movzx eax, r11w
0x1458a8292: 69c0cdcc0000 imul eax, eax, 0xcccd
0x1458a8298: c1e812 shr eax, 0x12
0x1458a829b: 8d0480 lea eax, [rax + rax*4]
0x1458a829e: 83c064 add eax, 0x64
0x1458a82a1: 48c1e030 shl rax, 0x30
0x1458a82a5: 0fb7ca movzx ecx, dx
0x1458a82a8: 48c1e120 shl rcx, 0x20
0x1458a82ac: 4809c1 or rcx, rax
0x1458a82af: 4181c000006400 add r8d, 0x640000
0x1458a82b6: 4909c8 or r8, rcx
0x1458a82b9: 410fb7c1 movzx eax, r9w
0x1458a82bd: 4c09c0 or rax, r8
0x1458a82c0: 48894730 mov qword ptr [rdi + 0x30], rax
0x1458a82c4: 0f1007 movups xmm0, xmmword ptr [rdi]
0x1458a82c7: 0f104f10 movups xmm1, xmmword ptr [rdi + 0x10]
0x1458a82cb: 0f105720 movups xmm2, xmmword ptr [rdi + 0x20]
0x1458a82cf: 0f115620 movups xmmword ptr [rsi + 0x20], xmm2
0x1458a82d3: 0f114e10 movups xmmword ptr [rsi + 0x10], xmm1
0x1458a82d7: 0f1106 movups xmmword ptr [rsi], xmm0
0x1458a82da: 488b4730 mov rax, qword ptr [rdi + 0x30]
0x1458a82de: 48894630 mov qword ptr [rsi + 0x30], rax
0x1458a82e2: 488b4738 mov rax, qword ptr [rdi + 0x38]
0x1458a82e6: 48894638 mov qword ptr [rsi + 0x38], rax
0x1458a82ea: 4889f0 mov rax, rsi
0x1458a82ed: 4883c458 add rsp, 0x58
0x1458a82f1: 5b pop rbx
0x1458a82f2: 5f pop rdi
0x1458a82f3: 5e pop rsi
0x1458a82f4: 415c pop r12
0x1458a82f6: 415d pop r13
0x1458a82f8: 415e pop r14
0x1458a82fa: 415f pop r15
0x1458a82fc: 5d pop rbp
0x1458a82fd: c3 ret
0x1458a82fe: 4c89f1 mov rcx, r14
0x1458a8301: 4c89fa mov rdx, r15
0x1458a8304: e8f70e7efa call 0x140089200
0x1458a8309: 90 nop
0x1458a830a: 4989d0 mov r8, rdx
0x1458a830d: 488d4dd8 lea rcx, [rbp - 0x28]
0x1458a8311: 4889c2 mov rdx, rax
0x1458a8314: e8870c0000 call 0x1458a8fa0
0x1458a8319: 90 nop
0x1458a831a: 4c8b6dd8 mov r13, qword ptr [rbp - 0x28]
0x1458a831e: 4983fdff cmp r13, -1
0x1458a8322: 0f84defdffff je 0x1458a8106
0x1458a8328: 4c8b7de0 mov r15, qword ptr [rbp - 0x20]
0x1458a832c: 4c8b65e8 mov r12, qword ptr [rbp - 0x18]
0x1458a8330: 488b45f0 mov rax, qword ptr [rbp - 0x10]
0x1458a8334: 488b10 mov rdx, qword ptr [rax]
0x1458a8337: 4885d2 test rdx, rdx
0x1458a833a: 0f8504feffff jne 0x1458a8144
0x1458a8340: e90dfeffff jmp 0x1458a8152
0x1458a8345: b901000000 mov ecx, 1
0x1458a834a: 4c89f2 mov rdx, r14
0x1458a834d: e8690f4f00 call 0x145d992bb
0x1458a8352: 90 nop
0x1458a8353: eb10 jmp 0x1458a8365
0x1458a8355: b901000000 mov ecx, 1
0x1458a835a: ba04000000 mov edx, 4
0x1458a835f: e8570f4f00 call 0x145d992bb
0x1458a8364: 90 nop
0x1458a8365: 0f0b ud2
