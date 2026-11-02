; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone 5.0.7; static observations, no target execution.
0000000145bfbc00 55                             push rbp
0000000145bfbc01 4157                           push r15
0000000145bfbc03 4156                           push r14
0000000145bfbc05 4155                           push r13
0000000145bfbc07 4154                           push r12
0000000145bfbc09 56                             push rsi
0000000145bfbc0a 57                             push rdi
0000000145bfbc0b 53                             push rbx
0000000145bfbc0c 4883ec58                       sub rsp, 0x58
0000000145bfbc10 488d6c2450                     lea rbp, [rsp + 0x50]
0000000145bfbc15 48c74500feffffff               mov qword ptr [rbp], 0xfffffffffffffffe
0000000145bfbc1d 4c89c6                         mov rsi, r8
0000000145bfbc20 4189d5                         mov r13d, edx
0000000145bfbc23 4889cf                         mov rdi, rcx
0000000145bfbc26 4c8db1b0010000                 lea r14, [rcx + 0x1b0]
0000000145bfbc2d 8955d4                         mov dword ptr [rbp - 0x2c], edx
0000000145bfbc30 488d99d0010000                 lea rbx, [rcx + 0x1d0]
0000000145bfbc37 488d55d4                       lea rdx, [rbp - 0x2c]
0000000145bfbc3b 4889d9                         mov rcx, rbx
0000000145bfbc3e e81dcd91fa                     call 0x140518960
0000000145bfbc43 4989c7                         mov r15, rax
0000000145bfbc46 49c1ef39                       shr r15, 0x39
0000000145bfbc4a 488b8fb0010000                 mov rcx, qword ptr [rdi + 0x1b0]
0000000145bfbc51 488b97b8010000                 mov rdx, qword ptr [rdi + 0x1b8]
0000000145bfbc58 66410f6ec7                     movd xmm0, r15d
0000000145bfbc5d 660f60c0                       punpcklbw xmm0, xmm0
0000000145bfbc61 f20f70c000                     pshuflw xmm0, xmm0, 0
0000000145bfbc66 660f70c044                     pshufd xmm0, xmm0, 0x44
0000000145bfbc6b 4531c0                         xor r8d, r8d
0000000145bfbc6e 660f76c9                       pcmpeqd xmm1, xmm1
0000000145bfbc72 4989c1                         mov r9, rax
0000000145bfbc75 488975d8                       mov qword ptr [rbp - 0x28], rsi
0000000145bfbc79 4921d1                         and r9, rdx
0000000145bfbc7c f3420f6f1409                   movdqu xmm2, xmmword ptr [rcx + r9]
0000000145bfbc82 660f6fda                       movdqa xmm3, xmm2
0000000145bfbc86 660f74d8                       pcmpeqb xmm3, xmm0
0000000145bfbc8a 66440fd7d3                     pmovmskb r10d, xmm3
0000000145bfbc8f 4585d2                         test r10d, r10d
0000000145bfbc92 742c                           je 0x145bfbcc0
0000000145bfbc94 f3450fbcda                     tzcnt r11d, r10d
0000000145bfbc99 4d01cb                         add r11, r9
0000000145bfbc9c 4921d3                         and r11, rdx
0000000145bfbc9f 49f7db                         neg r11
0000000145bfbca2 4d6bdb68                       imul r11, r11, 0x68
0000000145bfbca6 46396c1998                     cmp dword ptr [rcx + r11 - 0x68], r13d
0000000145bfbcab 742e                           je 0x145bfbcdb
0000000145bfbcad 458d5aff                       lea r11d, [r10 - 1]
0000000145bfbcb1 664521d3                       and r11w, r10w
0000000145bfbcb5 4589da                         mov r10d, r11d
0000000145bfbcb8 75da                           jne 0x145bfbc94
0000000145bfbcba 660f1f440000                   nop word ptr [rax + rax]
0000000145bfbcc0 660f74d1                       pcmpeqb xmm2, xmm1
0000000145bfbcc4 66440fd7d2                     pmovmskb r10d, xmm2
0000000145bfbcc9 4585d2                         test r10d, r10d
0000000145bfbccc 7523                           jne 0x145bfbcf1
0000000145bfbcce 4d01c1                         add r9, r8
0000000145bfbcd1 4983c110                       add r9, 0x10
0000000145bfbcd5 4983c010                       add r8, 0x10
0000000145bfbcd9 eb9e                           jmp 0x145bfbc79
0000000145bfbcdb 4c01d9                         add rcx, r11
0000000145bfbcde 488b41a0                       mov rax, qword ptr [rcx - 0x60]
0000000145bfbce2 4c8b71d0                       mov r14, qword ptr [rcx - 0x30]
0000000145bfbce6 49ffc6                         inc r14
0000000145bfbce9 4989cf                         mov r15, rcx
0000000145bfbcec e9ad000000                     jmp 0x145bfbd9e
0000000145bfbcf1 4883bfc001000000               cmp qword ptr [rdi + 0x1c0], 0
0000000145bfbcf9 0f843c040000                   je 0x145bfc13b
0000000145bfbcff 4821d0                         and rax, rdx
0000000145bfbd02 f30f6f0401                     movdqu xmm0, xmmword ptr [rcx + rax]
0000000145bfbd07 66440fd7c0                     pmovmskb r8d, xmm0
0000000145bfbd0c 4585c0                         test r8d, r8d
0000000145bfbd0f 0f8401040000                   je 0x145bfc116
0000000145bfbd15 f3450fbcc0                     tzcnt r8d, r8d
0000000145bfbd1a 4901c0                         add r8, rax
0000000145bfbd1d 4921d0                         and r8, rdx
0000000145bfbd20 420fb60401                     movzx eax, byte ptr [rcx + r8]
0000000145bfbd25 84c0                           test al, al
0000000145bfbd27 0f8943040000                   jns 0x145bfc170
0000000145bfbd2d 4d8d48f0                       lea r9, [r8 - 0x10]
0000000145bfbd31 4921d1                         and r9, rdx
0000000145bfbd34 46883c01                       mov byte ptr [rcx + r8], r15b
0000000145bfbd38 46887c0910                     mov byte ptr [rcx + r9 + 0x10], r15b
0000000145bfbd3d 49f7d8                         neg r8
0000000145bfbd40 496bd068                       imul rdx, r8, 0x68
0000000145bfbd44 2401                           and al, 1
0000000145bfbd46 0fb6c0                         movzx eax, al
0000000145bfbd49 482987c0010000                 sub qword ptr [rdi + 0x1c0], rax
0000000145bfbd50 44896c1198                     mov dword ptr [rcx + rdx - 0x68], r13d
0000000145bfbd55 48c74411a000000000             mov qword ptr [rcx + rdx - 0x60], 0
0000000145bfbd5e 48c74411a808000000             mov qword ptr [rcx + rdx - 0x58], 8
0000000145bfbd67 660fefc0                       pxor xmm0, xmm0
0000000145bfbd6b f30f7f4411b0                   movdqu xmmword ptr [rcx + rdx - 0x50], xmm0
0000000145bfbd71 c74411c8ffffffff               mov dword ptr [rcx + rdx - 0x38], 0xffffffff
0000000145bfbd79 f30f7f4411d0                   movdqu xmmword ptr [rcx + rdx - 0x30], xmm0
0000000145bfbd7f f30f7f4411e0                   movdqu xmmword ptr [rcx + rdx - 0x20], xmm0
0000000145bfbd85 f30f7f4411e9                   movdqu xmmword ptr [rcx + rdx - 0x17], xmm0
0000000145bfbd8b 48ff87c8010000                 inc qword ptr [rdi + 0x1c8]
0000000145bfbd92 4c8d3c11                       lea r15, [rcx + rdx]
0000000145bfbd96 41be01000000                   mov r14d, 1
0000000145bfbd9c 31c0                           xor eax, eax
0000000145bfbd9e 4d8977d0                       mov qword ptr [r15 - 0x30], r14
0000000145bfbda2 4c8b6610                       mov r12, qword ptr [rsi + 0x10]
0000000145bfbda6 4d0167d8                       add qword ptr [r15 - 0x28], r12
0000000145bfbdaa 488b0e                         mov rcx, qword ptr [rsi]
0000000145bfbdad 48894df0                       mov qword ptr [rbp - 0x10], rcx
0000000145bfbdb1 488b4e08                       mov rcx, qword ptr [rsi + 8]
0000000145bfbdb5 48894de0                       mov qword ptr [rbp - 0x20], rcx
0000000145bfbdb9 498b4fb8                       mov rcx, qword ptr [r15 - 0x48]
0000000145bfbdbd 4839c1                         cmp rcx, rax
0000000145bfbdc0 7512                           jne 0x145bfbdd4
0000000145bfbdc2 498d4fa0                       lea rcx, [r15 - 0x60]
0000000145bfbdc6 e8854d34fe                     call 0x143f40b50
0000000145bfbdcb 90                             nop
0000000145bfbdcc 498b47a0                       mov rax, qword ptr [r15 - 0x60]
0000000145bfbdd0 498b4fb8                       mov rcx, qword ptr [r15 - 0x48]
0000000145bfbdd4 488d5101                       lea rdx, [rcx + 1]
0000000145bfbdd8 498957b8                       mov qword ptr [r15 - 0x48], rdx
0000000145bfbddc 49034fb0                       add rcx, qword ptr [r15 - 0x50]
0000000145bfbde0 31d2                           xor edx, edx
0000000145bfbde2 4839c1                         cmp rcx, rax
0000000145bfbde5 480f43d0                       cmovae rdx, rax
0000000145bfbde9 4829d1                         sub rcx, rdx
0000000145bfbdec 498b47a8                       mov rax, qword ptr [r15 - 0x58]
0000000145bfbdf0 48c1e105                       shl rcx, 5
0000000145bfbdf4 4c893408                       mov qword ptr [rax + rcx], r14
0000000145bfbdf8 488b55f0                       mov rdx, qword ptr [rbp - 0x10]
0000000145bfbdfc 4889540808                     mov qword ptr [rax + rcx + 8], rdx
0000000145bfbe01 488b55e0                       mov rdx, qword ptr [rbp - 0x20]
0000000145bfbe05 4889540810                     mov qword ptr [rax + rcx + 0x10], rdx
0000000145bfbe0a 4c89640818                     mov qword ptr [rax + rcx + 0x18], r12
0000000145bfbe0f 49817fd800004000               cmp qword ptr [r15 - 0x28], 0x400000
0000000145bfbe17 0f86a1000000                   jbe 0x145bfbebe
0000000145bfbe1d 44896dec                       mov dword ptr [rbp - 0x14], r13d
0000000145bfbe21 488d55ec                       lea rdx, [rbp - 0x14]
0000000145bfbe25 4889d9                         mov rcx, rbx
0000000145bfbe28 e833cb91fa                     call 0x140518960
0000000145bfbe2d 4989c0                         mov r8, rax
0000000145bfbe30 49c1e839                       shr r8, 0x39
0000000145bfbe34 488b8fb0010000                 mov rcx, qword ptr [rdi + 0x1b0]
0000000145bfbe3b 488b97b8010000                 mov rdx, qword ptr [rdi + 0x1b8]
0000000145bfbe42 66410f6ec0                     movd xmm0, r8d
0000000145bfbe47 660f60c0                       punpcklbw xmm0, xmm0
0000000145bfbe4b f20f70c000                     pshuflw xmm0, xmm0, 0
0000000145bfbe50 660f70c044                     pshufd xmm0, xmm0, 0x44
0000000145bfbe55 4531c9                         xor r9d, r9d
0000000145bfbe58 660f76c9                       pcmpeqd xmm1, xmm1
0000000145bfbe5c 4821d0                         and rax, rdx
0000000145bfbe5f f30f6f1401                     movdqu xmm2, xmmword ptr [rcx + rax]
0000000145bfbe64 660f6fda                       movdqa xmm3, xmm2
0000000145bfbe68 660f74d8                       pcmpeqb xmm3, xmm0
0000000145bfbe6c 66440fd7d3                     pmovmskb r10d, xmm3
0000000145bfbe71 4585d2                         test r10d, r10d
0000000145bfbe74 7429                           je 0x145bfbe9f
0000000145bfbe76 f3450fbcda                     tzcnt r11d, r10d
0000000145bfbe7b 4901c3                         add r11, rax
0000000145bfbe7e 4921d3                         and r11, rdx
0000000145bfbe81 4d89d8                         mov r8, r11
0000000145bfbe84 49f7d8                         neg r8
0000000145bfbe87 4d6bc068                       imul r8, r8, 0x68
0000000145bfbe8b 463b6c0198                     cmp r13d, dword ptr [rcx + r8 - 0x68]
0000000145bfbe90 743e                           je 0x145bfbed0
0000000145bfbe92 458d42ff                       lea r8d, [r10 - 1]
0000000145bfbe96 664521d0                       and r8w, r10w
0000000145bfbe9a 4589c2                         mov r10d, r8d
0000000145bfbe9d 75d7                           jne 0x145bfbe76
0000000145bfbe9f 660f74d1                       pcmpeqb xmm2, xmm1
0000000145bfbea3 66440fd7c2                     pmovmskb r8d, xmm2
0000000145bfbea8 4585c0                         test r8d, r8d
0000000145bfbeab 0f854b010000                   jne 0x145bfbffc
0000000145bfbeb1 4c01c8                         add rax, r9
0000000145bfbeb4 4883c010                       add rax, 0x10
0000000145bfbeb8 4983c110                       add r9, 0x10
0000000145bfbebc eb9e                           jmp 0x145bfbe5c
0000000145bfbebe c645ff00                       mov byte ptr [rbp - 1], 0
0000000145bfbec2 4889f9                         mov rcx, rdi
0000000145bfbec5 e856f5ffff                     call 0x145bfb420
0000000145bfbeca 90                             nop
0000000145bfbecb e9f1010000                     jmp 0x145bfc0c1
0000000145bfbed0 4901c8                         add r8, rcx
0000000145bfbed3 4d6bcb68                       imul r9, r11, 0x68
0000000145bfbed7 49c1f903                       sar r9, 3
0000000145bfbedb 48b8c54eecc44eecc44e           movabs rax, 0x4ec4ec4ec4ec4ec5
0000000145bfbee5 490fafc1                       imul rax, r9
0000000145bfbee9 4c8d48f0                       lea r9, [rax - 0x10]
0000000145bfbeed 4921d1                         and r9, rdx
0000000145bfbef0 f3420f6f0409                   movdqu xmm0, xmmword ptr [rcx + r9]
0000000145bfbef6 660f76c9                       pcmpeqd xmm1, xmm1
0000000145bfbefa 660f74c1                       pcmpeqb xmm0, xmm1
0000000145bfbefe 660fd7d0                       pmovmskb edx, xmm0
0000000145bfbf02 f30f6f0401                     movdqu xmm0, xmmword ptr [rcx + rax]
0000000145bfbf07 660f74c1                       pcmpeqb xmm0, xmm1
0000000145bfbf0b 66440fd7d0                     pmovmskb r10d, xmm0
0000000145bfbf10 6641bb1f00                     mov r11w, 0x1f
0000000145bfbf15 66440fbdda                     bsr r11w, dx
0000000145bfbf1a 4183f30f                       xor r11d, 0xf
0000000145bfbf1e 4181ca00000100                 or r10d, 0x10000
0000000145bfbf25 f3450fbcd2                     tzcnt r10d, r10d
0000000145bfbf2a 4501da                         add r10d, r11d
0000000145bfbf2d b280                           mov dl, 0x80
0000000145bfbf2f 664183fa0f                     cmp r10w, 0xf
0000000145bfbf34 7709                           ja 0x145bfbf3f
0000000145bfbf36 48ff87c0010000                 inc qword ptr [rdi + 0x1c0]
0000000145bfbf3d b2ff                           mov dl, 0xff
0000000145bfbf3f 881401                         mov byte ptr [rcx + rax], dl
0000000145bfbf42 4288540910                     mov byte ptr [rcx + r9 + 0x10], dl
0000000145bfbf47 48ff8fc8010000                 dec qword ptr [rdi + 0x1c8]
0000000145bfbf4e 498b58a0                       mov rbx, qword ptr [r8 - 0x60]
0000000145bfbf52 4883fbff                       cmp rbx, -1
0000000145bfbf56 0f84a0000000                   je 0x145bfbffc
0000000145bfbf5c 4d8b70a8                       mov r14, qword ptr [r8 - 0x58]
0000000145bfbf60 4d8b60b8                       mov r12, qword ptr [r8 - 0x48]
0000000145bfbf64 4d85e4                         test r12, r12
0000000145bfbf67 7479                           je 0x145bfbfe2
0000000145bfbf69 4c8975f0                       mov qword ptr [rbp - 0x10], r14
0000000145bfbf6d 44896de0                       mov dword ptr [rbp - 0x20], r13d
0000000145bfbf71 498b40b0                       mov rax, qword ptr [r8 - 0x50]
0000000145bfbf75 31d2                           xor edx, edx
0000000145bfbf77 4839d8                         cmp rax, rbx
0000000145bfbf7a 4889d9                         mov rcx, rbx
0000000145bfbf7d 480f42ca                       cmovb rcx, rdx
0000000145bfbf81 4989c0                         mov r8, rax
0000000145bfbf84 4929c8                         sub r8, rcx
0000000145bfbf87 4989dd                         mov r13, rbx
0000000145bfbf8a 4d29c5                         sub r13, r8
0000000145bfbf8d 4f8d3420                       lea r14, [r8 + r12]
0000000145bfbf91 4d89e7                         mov r15, r12
0000000145bfbf94 4d29ef                         sub r15, r13
0000000145bfbf97 4c0f42fa                       cmovb r15, rdx
0000000145bfbf9b 4c0f47f3                       cmova r14, rbx
0000000145bfbf9f 4d29c6                         sub r14, r8
0000000145bfbfa2 0f852a010000                   jne 0x145bfc0d2
0000000145bfbfa8 4d39e5                         cmp r13, r12
0000000145bfbfab 448b6de0                       mov r13d, dword ptr [rbp - 0x20]
0000000145bfbfaf 4c8b75f0                       mov r14, qword ptr [rbp - 0x10]
0000000145bfbfb3 732d                           jae 0x145bfbfe2
0000000145bfbfb5 498d7610                       lea rsi, [r14 + 0x10]
0000000145bfbfb9 eb0e                           jmp 0x145bfbfc9
0000000145bfbfbb 0f1f440000                     nop dword ptr [rax + rax]
0000000145bfbfc0 4883c620                       add rsi, 0x20
0000000145bfbfc4 49ffcf                         dec r15
0000000145bfbfc7 7419                           je 0x145bfbfe2
0000000145bfbfc9 488b56f8                       mov rdx, qword ptr [rsi - 8]
0000000145bfbfcd 4885d2                         test rdx, rdx
0000000145bfbfd0 74ee                           je 0x145bfbfc0
0000000145bfbfd2 488b0e                         mov rcx, qword ptr [rsi]
0000000145bfbfd5 41b801000000                   mov r8d, 1
0000000145bfbfdb e8f06140fa                     call 0x1400021d0
0000000145bfbfe0 ebde                           jmp 0x145bfbfc0
0000000145bfbfe2 4885db                         test rbx, rbx
0000000145bfbfe5 7415                           je 0x145bfbffc
0000000145bfbfe7 48c1e305                       shl rbx, 5
0000000145bfbfeb 41b808000000                   mov r8d, 8
0000000145bfbff1 4c89f1                         mov rcx, r14
0000000145bfbff4 4889da                         mov rdx, rbx
0000000145bfbff7 e8d46140fa                     call 0x1400021d0
0000000145bfbffc 4585ed                         test r13d, r13d
0000000145bfbfff 0f84ac000000                   je 0x145bfc0b1
0000000145bfc005 4883bf9801000000               cmp qword ptr [rdi + 0x198], 0
0000000145bfc00d 0f84ae000000                   je 0x145bfc0c1
0000000145bfc013 488d8fa0010000                 lea rcx, [rdi + 0x1a0]
0000000145bfc01a 488d55ec                       lea rdx, [rbp - 0x14]
0000000145bfc01e e83dc991fa                     call 0x140518960
0000000145bfc023 4989c0                         mov r8, rax
0000000145bfc026 49c1e839                       shr r8, 0x39
0000000145bfc02a 488b8f80010000                 mov rcx, qword ptr [rdi + 0x180]
0000000145bfc031 488b9788010000                 mov rdx, qword ptr [rdi + 0x188]
0000000145bfc038 66410f6ec0                     movd xmm0, r8d
0000000145bfc03d 660f60c0                       punpcklbw xmm0, xmm0
0000000145bfc041 f20f70c000                     pshuflw xmm0, xmm0, 0
0000000145bfc046 660f70c044                     pshufd xmm0, xmm0, 0x44
0000000145bfc04b 4531c0                         xor r8d, r8d
0000000145bfc04e 660f76c9                       pcmpeqd xmm1, xmm1
0000000145bfc052 4821d0                         and rax, rdx
0000000145bfc055 f30f6f1401                     movdqu xmm2, xmmword ptr [rcx + rax]
0000000145bfc05a 660f6fda                       movdqa xmm3, xmm2
0000000145bfc05e 660f74d8                       pcmpeqb xmm3, xmm0
0000000145bfc062 66440fd7cb                     pmovmskb r9d, xmm3
0000000145bfc067 4585c9                         test r9d, r9d
0000000145bfc06a 742a                           je 0x145bfc096
0000000145bfc06c f3450fbcd1                     tzcnt r10d, r9d
0000000145bfc071 4901c2                         add r10, rax
0000000145bfc074 4921d2                         and r10, rdx
0000000145bfc077 49f7da                         neg r10
0000000145bfc07a 4f8d1452                       lea r10, [r10 + r10*2]
0000000145bfc07e 49c1e204                       shl r10, 4
0000000145bfc082 463b6c11d0                     cmp r13d, dword ptr [rcx + r10 - 0x30]
0000000145bfc087 7431                           je 0x145bfc0ba
0000000145bfc089 458d51ff                       lea r10d, [r9 - 1]
0000000145bfc08d 664521ca                       and r10w, r9w
0000000145bfc091 4589d1                         mov r9d, r10d
0000000145bfc094 75d6                           jne 0x145bfc06c
0000000145bfc096 660f74d1                       pcmpeqb xmm2, xmm1
0000000145bfc09a 66440fd7ca                     pmovmskb r9d, xmm2
0000000145bfc09f 4585c9                         test r9d, r9d
0000000145bfc0a2 751d                           jne 0x145bfc0c1
0000000145bfc0a4 4c01c0                         add rax, r8
0000000145bfc0a7 4883c010                       add rax, 0x10
0000000145bfc0ab 4983c010                       add r8, 0x10
0000000145bfc0af eba1                           jmp 0x145bfc052
0000000145bfc0b1 c687e101000001                 mov byte ptr [rdi + 0x1e1], 1
0000000145bfc0b8 eb07                           jmp 0x145bfc0c1
0000000145bfc0ba 4c01d1                         add rcx, r10
0000000145bfc0bd c641f800                       mov byte ptr [rcx - 8], 0
0000000145bfc0c1 4883c458                       add rsp, 0x58
0000000145bfc0c5 5b                             pop rbx
0000000145bfc0c6 5f                             pop rdi
0000000145bfc0c7 5e                             pop rsi
0000000145bfc0c8 415c                           pop r12
0000000145bfc0ca 415d                           pop r13
0000000145bfc0cc 415e                           pop r14
0000000145bfc0ce 415f                           pop r15
0000000145bfc0d0 5d                             pop rbp
0000000145bfc0d1 c3                             ret
0000000145bfc0d2 48c1e005                       shl rax, 5
0000000145bfc0d6 48c1e105                       shl rcx, 5
0000000145bfc0da 4829c8                         sub rax, rcx
0000000145bfc0dd 488b4df0                       mov rcx, qword ptr [rbp - 0x10]
0000000145bfc0e1 488d3401                       lea rsi, [rcx + rax]
0000000145bfc0e5 4883c610                       add rsi, 0x10
0000000145bfc0e9 eb12                           jmp 0x145bfc0fd
0000000145bfc0eb 0f1f440000                     nop dword ptr [rax + rax]
0000000145bfc0f0 4883c620                       add rsi, 0x20
0000000145bfc0f4 49ffce                         dec r14
0000000145bfc0f7 0f84abfeffff                   je 0x145bfbfa8
0000000145bfc0fd 488b56f8                       mov rdx, qword ptr [rsi - 8]
0000000145bfc101 4885d2                         test rdx, rdx
0000000145bfc104 74ea                           je 0x145bfc0f0
0000000145bfc106 488b0e                         mov rcx, qword ptr [rsi]
0000000145bfc109 41b801000000                   mov r8d, 1
0000000145bfc10f e8bc6040fa                     call 0x1400021d0
0000000145bfc114 ebda                           jmp 0x145bfc0f0
0000000145bfc116 41b910000000                   mov r9d, 0x10
0000000145bfc11c 4c01c8                         add rax, r9
0000000145bfc11f 4821d0                         and rax, rdx
0000000145bfc122 f30f6f0401                     movdqu xmm0, xmmword ptr [rcx + rax]
0000000145bfc127 66440fd7c0                     pmovmskb r8d, xmm0
0000000145bfc12c 4983c110                       add r9, 0x10
0000000145bfc130 4585c0                         test r8d, r8d
0000000145bfc133 0f85dcfbffff                   jne 0x145bfbd15
0000000145bfc139 ebe1                           jmp 0x145bfc11c
0000000145bfc13b 4889c6                         mov rsi, rax
0000000145bfc13e c645ff01                       mov byte ptr [rbp - 1], 1
0000000145bfc142 ba01000000                     mov edx, 1
0000000145bfc147 4c89f1                         mov rcx, r14
0000000145bfc14a 4989d8                         mov r8, rbx
0000000145bfc14d 41b101                         mov r9b, 1
0000000145bfc150 e87b615300                     call 0x1461322d0
0000000145bfc155 90                             nop
0000000145bfc156 488b8fb0010000                 mov rcx, qword ptr [rdi + 0x1b0]
0000000145bfc15d 488b97b8010000                 mov rdx, qword ptr [rdi + 0x1b8]
0000000145bfc164 4889f0                         mov rax, rsi
0000000145bfc167 488b75d8                       mov rsi, qword ptr [rbp - 0x28]
0000000145bfc16b e98ffbffff                     jmp 0x145bfbcff
0000000145bfc170 660f6f01                       movdqa xmm0, xmmword ptr [rcx]
0000000145bfc174 660fd7c0                       pmovmskb eax, xmm0
0000000145bfc178 f3440fbcc0                     tzcnt r8d, eax
0000000145bfc17d 420fb60401                     movzx eax, byte ptr [rcx + r8]
0000000145bfc182 e9a6fbffff                     jmp 0x145bfbd2d
