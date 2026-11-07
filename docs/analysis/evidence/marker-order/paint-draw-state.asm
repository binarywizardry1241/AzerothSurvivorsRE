140137436: c6456800 mov byte ptr [rbp + 0x68], 0
14013743a: f30f114d6c movss dword ptr [rbp + 0x6c], xmm1
14013743f: c6457001 mov byte ptr [rbp + 0x70], 1
140137443: f30f117d74 movss dword ptr [rbp + 0x74], xmm7
140137448: 4c8b6930 mov r13, qword ptr [rcx + 0x30]
14013744c: 488b4138 mov rax, qword ptr [rcx + 0x38]
140137450: 48894578 mov qword ptr [rbp + 0x78], rax
140137454: 4c8b6140 mov r12, qword ptr [rcx + 0x40]
140137458: 488d7d08 lea rdi, [rbp + 8]
14013745c: 488b5a08 mov rbx, qword ptr [rdx + 8]
140137460: 4883c218 add rdx, 0x18
140137464: 4c8bbd88000000 mov r15, qword ptr [rbp + 0x88]
14013746b: 49f7df neg r15
14013746e: 31c0 xor eax, eax
140137470: 450f57c9 xorps xmm9, xmm9
140137474: 450f57d2 xorps xmm10, xmm10
140137478: 48899580000000 mov qword ptr [rbp + 0x80], rdx
14013747f: 90 nop
140137480: 488d7001 lea rsi, [rax + 1]
140137484: f3440f105cc56c movss xmm11, dword ptr [rbp + rax*8 + 0x6c]
14013748b: 450f2ecb ucomiss xmm9, xmm11
14013748f: 730f jae 0x1401374a0
140137491: 488d4d68 lea rcx, [rbp + 0x68]
140137495: 488d04c1 lea rax, [rcx + rax*8]
140137499: eb26 jmp 0x1401374c1
14013749b: 0f1f440000 nop dword ptr [rax + rax]
1401374a0: 4883fe02 cmp rsi, 2
1401374a4: 0f847a010000 je 0x140137624
1401374aa: be02000000 mov esi, 2
1401374af: 440f2ecf ucomiss xmm9, xmm7
1401374b3: 488d4570 lea rax, [rbp + 0x70]
1401374b7: 440f28df movaps xmm11, xmm7
1401374bb: 0f8363010000 jae 0x140137624
1401374c1: 0fb600 movzx eax, byte ptr [rax]
1401374c4: 488b4d78 mov rcx, qword ptr [rbp + 0x78]
1401374c8: 488b09 mov rcx, qword ptr [rcx]
1401374cb: 4d8b4d00 mov r9, qword ptr [r13]
1401374cf: 4d8b4510 mov r8, qword ptr [r13 + 0x10]
1401374d3: 458b5110 mov r10d, dword ptr [r9 + 0x10]
1401374d7: 458b4d1c mov r9d, dword ptr [r13 + 0x1c]
1401374db: 458908 mov dword ptr [r8], r9d
1401374de: 4d8b7500 mov r14, qword ptr [r13]
1401374e2: 440f2955b0 movaps xmmword ptr [rbp - 0x50], xmm10
1401374e7: 48894dd0 mov qword ptr [rbp - 0x30], rcx
1401374eb: 48c745d801000000 mov qword ptr [rbp - 0x28], 1
1401374f3: 48c745e000000000 mov qword ptr [rbp - 0x20], 0
1401374fb: 8b4a10 mov ecx, dword ptr [rdx + 0x10]
1401374fe: 894f10 mov dword ptr [rdi + 0x10], ecx
140137501: 0f1002 movups xmm0, xmmword ptr [rdx]
140137504: 0f1107 movups xmmword ptr [rdi], xmm0
140137507: 418b4c2408 mov ecx, dword ptr [r12 + 8]
14013750c: 894f1c mov dword ptr [rdi + 0x1c], ecx
14013750f: 498b0c24 mov rcx, qword ptr [r12]
140137513: 48894f14 mov qword ptr [rdi + 0x14], rcx
140137517: 3401 xor al, 1
140137519: 48b900b0364600800000 movabs rcx, 0x80004636b000
140137523: 48894d28 mov qword ptr [rbp + 0x28], rcx
140137527: c7472b00000000 mov dword ptr [rdi + 0x2b], 0
14013752e: c7472800000000 mov dword ptr [rdi + 0x28], 0
140137535: 884537 mov byte ptr [rbp + 0x37], al
140137538: 48c7453800000000 mov qword ptr [rbp + 0x38], 0
140137540: 4c897540 mov qword ptr [rbp + 0x40], r14
140137544: 44895548 mov dword ptr [rbp + 0x48], r10d
