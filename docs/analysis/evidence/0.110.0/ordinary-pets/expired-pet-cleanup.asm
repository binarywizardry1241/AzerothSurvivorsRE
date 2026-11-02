145927fa0: 55 push rbp
145927fa1: 4157 push r15
145927fa3: 4156 push r14
145927fa5: 56 push rsi
145927fa6: 57 push rdi
145927fa7: 53 push rbx
145927fa8: 4881ec88000000 sub rsp, 0x88
145927faf: 488dac2480000000 lea rbp, [rsp + 0x80]
145927fb7: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
145927fbf: 80b9e70a000001 cmp byte ptr [rcx + 0xae7], 1
145927fc6: 0f8541010000 jne 0x14592810d
145927fcc: 4889ce mov rsi, rcx
145927fcf: f30f1081540a0000 movss xmm0, dword ptr [rcx + 0xa54]
145927fd7: f30f1145e4 movss dword ptr [rbp - 0x1c], xmm0
145927fdc: 488b81d0000000 mov rax, qword ptr [rcx + 0xd0]
145927fe3: 488b89d8000000 mov rcx, qword ptr [rcx + 0xd8]
145927fea: 48c1e107 shl rcx, 7
145927fee: 4801c1 add rcx, rax
145927ff1: 488945a8 mov qword ptr [rbp - 0x58], rax
145927ff5: 48894db0 mov qword ptr [rbp - 0x50], rcx
145927ff9: 488d45e4 lea rax, [rbp - 0x1c]
145927ffd: 488945b8 mov qword ptr [rbp - 0x48], rax
145928001: 488d4dc0 lea rcx, [rbp - 0x40]
145928005: 488d55a8 lea rdx, [rbp - 0x58]
145928009: e8d25f0b00 call 0x1459ddfe0
14592800e: 488b5dd0 mov rbx, qword ptr [rbp - 0x30]
145928012: 4885db test rbx, rbx
145928015: 0f84cd000000 je 0x1459280e8
14592801b: 488d8ec8000000 lea rcx, [rsi + 0xc8]
145928022: c645ff01 mov byte ptr [rbp - 1], 1
145928026: 488d55c0 lea rdx, [rbp - 0x40]
14592802a: e871560a00 call 0x1459cd6a0
14592802f: 90 nop
145928030: 488b45c0 mov rax, qword ptr [rbp - 0x40]
145928034: 488945e8 mov qword ptr [rbp - 0x18], rax
145928038: 488b45c8 mov rax, qword ptr [rbp - 0x38]
14592803c: 488945f0 mov qword ptr [rbp - 0x10], rax
145928040: 48c1e303 shl rbx, 3
145928044: 488dbe28060000 lea rdi, [rsi + 0x628]
14592804b: 4531f6 xor r14d, r14d
14592804e: eb42 jmp 0x145928092
145928050: 488b8630060000 mov rax, qword ptr [rsi + 0x630]
145928057: 4c89f9 mov rcx, r15
14592805a: 48c1e105 shl rcx, 5
14592805e: 48c7040820000000 mov qword ptr [rax + rcx], 0x20
145928066: 488b55d8 mov rdx, qword ptr [rbp - 0x28]
14592806a: 4889540808 mov qword ptr [rax + rcx + 8], rdx
14592806f: 48c744081008000000 mov qword ptr [rax + rcx + 0x10], 8
145928078: 66c7440818aa00 mov word ptr [rax + rcx + 0x18], 0xaa
14592807f: 49ffc7 inc r15
145928082: 4c89be38060000 mov qword ptr [rsi + 0x638], r15
145928089: 4983c608 add r14, 8
14592808d: 4c39f3 cmp rbx, r14
145928090: 744b je 0x1459280dd
145928092: 488b45f0 mov rax, qword ptr [rbp - 0x10]
145928096: 4e8b3c30 mov r15, qword ptr [rax + r14]
14592809a: 4d85ff test r15, r15
14592809d: 74ea je 0x145928089
14592809f: e85ca16dfa call 0x140002200
1459280a4: b920000000 mov ecx, 0x20
1459280a9: ba01000000 mov edx, 1
1459280ae: e80da16dfa call 0x1400021c0
1459280b3: 4885c0 test rax, rax
1459280b6: 7465 je 0x14592811d
1459280b8: 488945d8 mov qword ptr [rbp - 0x28], rax
1459280bc: 4c8938 mov qword ptr [rax], r15
1459280bf: 4c8bbe38060000 mov r15, qword ptr [rsi + 0x638]
1459280c6: 4c3bbe28060000 cmp r15, qword ptr [rsi + 0x628]
1459280cd: 7581 jne 0x145928050
1459280cf: 4889f9 mov rcx, rdi
1459280d2: e8f9052e00 call 0x145c086d0
1459280d7: 90 nop
1459280d8: e973ffffff jmp 0x145928050
1459280dd: 488b55e8 mov rdx, qword ptr [rbp - 0x18]
1459280e1: 4885d2 test rdx, rdx
1459280e4: 7513 jne 0x1459280f9
1459280e6: eb25 jmp 0x14592810d
1459280e8: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1459280ec: 4885d2 test rdx, rdx
1459280ef: 741c je 0x14592810d
1459280f1: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1459280f5: 488945f0 mov qword ptr [rbp - 0x10], rax
1459280f9: 48c1e203 shl rdx, 3
1459280fd: 41b808000000 mov r8d, 8
145928103: 488b4df0 mov rcx, qword ptr [rbp - 0x10]
145928107: e8c4a06dfa call 0x1400021d0
14592810c: 90 nop
14592810d: 4881c488000000 add rsp, 0x88
145928114: 5b pop rbx
145928115: 5f pop rdi
145928116: 5e pop rsi
145928117: 415e pop r14
145928119: 415f pop r15
14592811b: 5d pop rbp
14592811c: c3 ret
14592811d: b901000000 mov ecx, 1
145928122: ba20000000 mov edx, 0x20
145928127: e87fc14700 call 0x145da42ab
14592812c: 90 nop
14592812d: 0f0b ud2
