145b09a8e: 66899d201d0000 mov word ptr [rbp + 0x1d20], bx
145b09a95: 4c89b5081d0000 mov qword ptr [rbp + 0x1d08], r14
145b09a9c: 4c89bd101d0000 mov qword ptr [rbp + 0x1d10], r15
145b09aa3: 4c89b5181d0000 mov qword ptr [rbp + 0x1d18], r14
145b09aaa: 48b80600000000000080 movabs rax, 0x8000000000000006
145b09ab4: 488985001d0000 mov qword ptr [rbp + 0x1d00], rax
145b09abb: 488d8d380d0000 lea rcx, [rbp + 0xd38]
145b09ac2: 488d95001d0000 lea rdx, [rbp + 0x1d00]
145b09ac9: e88258faff call 0x145aaf350
145b09ace: 90 nop
145b09acf: 488bbed80c0000 mov rdi, qword ptr [rsi + 0xcd8]
145b09ad6: 483bbec80c0000 cmp rdi, qword ptr [rsi + 0xcc8]
145b09add: 750d jne 0x145b09aec
145b09adf: 488d8ec80c0000 lea rcx, [rsi + 0xcc8]
145b09ae6: e825a74800 call 0x145f94210
145b09aeb: 90 nop
145b09aec: 488b86d00c0000 mov rax, qword ptr [rsi + 0xcd0]
145b09af3: 488d0c7f lea rcx, [rdi + rdi*2]
145b09af7: 488b95480d0000 mov rdx, qword ptr [rbp + 0xd48]
145b09afe: 488954c810 mov qword ptr [rax + rcx*8 + 0x10], rdx
145b09b03: f30f6f85380d0000 movdqu xmm0, xmmword ptr [rbp + 0xd38]
145b09b0b: f30f7f04c8 movdqu xmmword ptr [rax + rcx*8], xmm0
145b09b10: 48ffc7 inc rdi
145b09b13: 4889bed80c0000 mov qword ptr [rsi + 0xcd8], rdi
145b09b1a: 488d8d001d0000 lea rcx, [rbp + 0x1d00]
145b09b21: e84ad1feff call 0x145af6c70
145b09b26: e943210000 jmp 0x145b0bc6e
145b09b2b: 488b9618100000 mov rdx, qword ptr [rsi + 0x1018]
145b09b32: 4939d5 cmp r13, rdx
