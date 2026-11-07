0x145890450: 55                       push rbp
0x145890451: 4157                     push r15
0x145890453: 4156                     push r14
0x145890455: 4155                     push r13
0x145890457: 4154                     push r12
0x145890459: 56                       push rsi
0x14589045a: 57                       push rdi
0x14589045b: 53                       push rbx
0x14589045c: 4883ec58                 sub rsp, 0x58
0x145890460: 488d6c2450               lea rbp, [rsp + 0x50]
0x145890465: 48c74500feffffff         mov qword ptr [rbp], 0xfffffffffffffffe
0x14589046d: 4c89cf                   mov rdi, r9
0x145890470: 4d89c7                   mov r15, r8
0x145890473: 4889d3                   mov rbx, rdx
0x145890476: 4889ce                   mov rsi, rcx
0x145890479: e8821d77fa               call 0x140002200
0x14589047e: b978000000               mov ecx, 0x78
0x145890483: ba08000000               mov edx, 8
0x145890488: e8331d77fa               call 0x1400021c0
0x14589048d: 4885c0                   test rax, rax
0x145890490: 0f84ad020000             je 0x145890743
0x145890496: 4989c6                   mov r14, rax
0x145890499: e8621d77fa               call 0x140002200
0x14589049e: b904000000               mov ecx, 4
0x1458904a3: ba01000000               mov edx, 1
0x1458904a8: e8131d77fa               call 0x1400021c0
0x1458904ad: 4885c0                   test rax, rax
0x1458904b0: 0f849e020000             je 0x145890754
0x1458904b6: 4989c4                   mov r12, rax
0x1458904b9: c7004845524f             mov dword ptr [rax], 0x4f524548
0x1458904bf: e83c1d77fa               call 0x140002200
0x1458904c4: b908000000               mov ecx, 8
0x1458904c9: ba01000000               mov edx, 1
0x1458904ce: e8ed1c77fa               call 0x1400021c0
0x1458904d3: 4885c0                   test rax, rax
0x1458904d6: 0f848e020000             je 0x14589076a
0x1458904dc: 4989c5                   mov r13, rax
0x1458904df: 48b87375727669766f72     movabs rax, 0x726f766976727573
0x1458904e9: 49894500                 mov qword ptr [r13], rax
0x1458904ed: e80e1d77fa               call 0x140002200
0x1458904f2: b90d000000               mov ecx, 0xd
0x1458904f7: ba01000000               mov edx, 1
0x1458904fc: e8bf1c77fa               call 0x1400021c0
0x145890501: 4885c0                   test rax, rax
0x145890504: 0f847a020000             je 0x145890784
0x14589050a: 48b974682e6c6f63616c     movabs rcx, 0x6c61636f6c2e6874
0x145890514: 48894805                 mov qword ptr [rax + 5], rcx
0x145890518: 48b9617a65726f74682e     movabs rcx, 0x2e68746f72657a61
0x145890522: 488908                   mov qword ptr [rax], rcx
0x145890525: 488d0d6e7a3501           lea rcx, [rip + 0x1357a6e]
0x14589052c: 49890e                   mov qword ptr [r14], rcx
0x14589052f: 49c7460808000000         mov qword ptr [r14 + 8], 8
0x145890537: 49c7461004000000         mov qword ptr [r14 + 0x10], 4
0x14589053f: 4d896618                 mov qword ptr [r14 + 0x18], r12
0x145890543: 49c7462004000000         mov qword ptr [r14 + 0x20], 4
0x14589054b: 488d0d507a3501           lea rcx, [rip + 0x1357a50]
0x145890552: 49894e28                 mov qword ptr [r14 + 0x28], rcx
0x145890556: 49c7463008000000         mov qword ptr [r14 + 0x30], 8
0x14589055e: 49c7463808000000         mov qword ptr [r14 + 0x38], 8
0x145890566: 4d896e40                 mov qword ptr [r14 + 0x40], r13
0x14589056a: 49c7464808000000         mov qword ptr [r14 + 0x48], 8
0x145890572: 488d0d317a3501           lea rcx, [rip + 0x1357a31]
0x145890579: 49894e50                 mov qword ptr [r14 + 0x50], rcx
0x14589057d: 49c7465808000000         mov qword ptr [r14 + 0x58], 8
0x145890585: 49c746600d000000         mov qword ptr [r14 + 0x60], 0xd
0x14589058d: 49894668                 mov qword ptr [r14 + 0x68], rax
0x145890591: 49c746700d000000         mov qword ptr [r14 + 0x70], 0xd
0x145890599: 48c745d803000000         mov qword ptr [rbp - 0x28], 3
0x1458905a1: 4c8975e0                 mov qword ptr [rbp - 0x20], r14
0x1458905a5: 48c745e803000000         mov qword ptr [rbp - 0x18], 3
0x1458905ad: 4885db                   test rbx, rbx
0x1458905b0: 7419                     je 0x1458905cb
0x1458905b2: 4d85ff                   test r15, r15
0x1458905b5: 7927                     jns 0x1458905de
0x1458905b7: 4531f6                   xor r14d, r14d
0x1458905ba: 4c89f1                   mov rcx, r14
0x1458905bd: 4c89fa                   mov rdx, r15
0x1458905c0: e8f68c5000               call 0x145d992bb
0x1458905c5: 90                       nop
0x1458905c6: e9d5010000               jmp 0x1458907a0
0x1458905cb: bb03000000               mov ebx, 3
0x1458905d0: 4885ff                   test rdi, rdi
0x1458905d3: 0f859c000000             jne 0x145890675
0x1458905d9: e942010000               jmp 0x145890720
0x1458905de: 4c897df8                 mov qword ptr [rbp - 8], r15
0x1458905e2: 7431                     je 0x145890615
0x1458905e4: e8171c77fa               call 0x140002200
0x1458905e9: 41be01000000             mov r14d, 1
0x1458905ef: ba01000000               mov edx, 1
0x1458905f4: 4c89f9                   mov rcx, r15
0x1458905f7: e8c41b77fa               call 0x1400021c0
0x1458905fc: 4885c0                   test rax, rax
0x1458905ff: 74b9                     je 0x1458905ba
0x145890601: 488945f0                 mov qword ptr [rbp - 0x10], rax
0x145890605: 4889c1                   mov rcx, rax
0x145890608: 4889da                   mov rdx, rbx
0x14589060b: 4d89f8                   mov r8, r15
0x14589060e: e8d49a3600               call 0x145bfa0e7
0x145890613: eb09                     jmp 0x14589061e
0x145890615: b801000000               mov eax, 1
0x14589061a: 488945f0                 mov qword ptr [rbp - 0x10], rax
0x14589061e: 488d4dd8                 lea rcx, [rbp - 0x28]
0x145890622: e859a83600               call 0x145bfae80
0x145890627: 90                       nop
0x145890628: 488b45e0                 mov rax, qword ptr [rbp - 0x20]
0x14589062c: 488d0d7f793501           lea rcx, [rip + 0x135797f]
0x145890633: 48894878                 mov qword ptr [rax + 0x78], rcx
0x145890637: 48c7808000000009000000   mov qword ptr [rax + 0x80], 9
0x145890642: 488b4df8                 mov rcx, qword ptr [rbp - 8]
0x145890646: 48898888000000           mov qword ptr [rax + 0x88], rcx
0x14589064d: 488b55f0                 mov rdx, qword ptr [rbp - 0x10]
0x145890651: 48899090000000           mov qword ptr [rax + 0x90], rdx
0x145890658: 48898898000000           mov qword ptr [rax + 0x98], rcx
0x14589065f: 48c745e804000000         mov qword ptr [rbp - 0x18], 4
0x145890667: bb04000000               mov ebx, 4
0x14589066c: 4885ff                   test rdi, rdi
0x14589066f: 0f84ab000000             je 0x145890720
0x145890675: 4c8b7570                 mov r14, qword ptr [rbp + 0x70]
0x145890679: 4d85f6                   test r14, r14
0x14589067c: 7913                     jns 0x145890691
0x14589067e: 31db                     xor ebx, ebx
0x145890680: 4889d9                   mov rcx, rbx
0x145890683: 4c89f2                   mov rdx, r14
0x145890686: e8308c5000               call 0x145d992bb
0x14589068b: 90                       nop
0x14589068c: e90f010000               jmp 0x1458907a0
0x145890691: 743a                     je 0x1458906cd
0x145890693: e8681b77fa               call 0x140002200
0x145890698: bb01000000               mov ebx, 1
0x14589069d: ba01000000               mov edx, 1
0x1458906a2: 4c89f1                   mov rcx, r14
0x1458906a5: e8161b77fa               call 0x1400021c0
0x1458906aa: 4885c0                   test rax, rax
0x1458906ad: 74d1                     je 0x145890680
0x1458906af: 488945f8                 mov qword ptr [rbp - 8], rax
0x1458906b3: 4889c1                   mov rcx, rax
0x1458906b6: 4889fa                   mov rdx, rdi
0x1458906b9: 4d89f0                   mov r8, r14
0x1458906bc: e8269a3600               call 0x145bfa0e7
0x1458906c1: 488b5de8                 mov rbx, qword ptr [rbp - 0x18]
0x1458906c5: 483b5dd8                 cmp rbx, qword ptr [rbp - 0x28]
0x1458906c9: 7411                     je 0x1458906dc
0x1458906cb: eb19                     jmp 0x1458906e6
0x1458906cd: b801000000               mov eax, 1
0x1458906d2: 488945f8                 mov qword ptr [rbp - 8], rax
0x1458906d6: 483b5dd8                 cmp rbx, qword ptr [rbp - 0x28]
0x1458906da: 750a                     jne 0x1458906e6
0x1458906dc: 488d4dd8                 lea rcx, [rbp - 0x28]
0x1458906e0: e89ba73600               call 0x145bfae80
0x1458906e5: 90                       nop
0x1458906e6: 488b45e0                 mov rax, qword ptr [rbp - 0x20]
0x1458906ea: 488d0c9b                 lea rcx, [rbx + rbx*4]
0x1458906ee: 488d15c6783501           lea rdx, [rip + 0x13578c6]
0x1458906f5: 488914c8                 mov qword ptr [rax + rcx*8], rdx
0x1458906f9: 48c744c80808000000       mov qword ptr [rax + rcx*8 + 8], 8
0x145890702: 488b5570                 mov rdx, qword ptr [rbp + 0x70]
0x145890706: 488954c810               mov qword ptr [rax + rcx*8 + 0x10], rdx
0x14589070b: 4c8b45f8                 mov r8, qword ptr [rbp - 8]
0x14589070f: 4c8944c818               mov qword ptr [rax + rcx*8 + 0x18], r8
0x145890714: 488954c820               mov qword ptr [rax + rcx*8 + 0x20], rdx
0x145890719: 48ffc3                   inc rbx
0x14589071c: 48895de8                 mov qword ptr [rbp - 0x18], rbx
0x145890720: 488b45e8                 mov rax, qword ptr [rbp - 0x18]
0x145890724: 48894610                 mov qword ptr [rsi + 0x10], rax
0x145890728: 0f1045d8                 movups xmm0, xmmword ptr [rbp - 0x28]
0x14589072c: 0f1106                   movups xmmword ptr [rsi], xmm0
0x14589072f: 4889f0                   mov rax, rsi
0x145890732: 4883c458                 add rsp, 0x58
0x145890736: 5b                       pop rbx
0x145890737: 5f                       pop rdi
0x145890738: 5e                       pop rsi
0x145890739: 415c                     pop r12
0x14589073b: 415d                     pop r13
0x14589073d: 415e                     pop r14
0x14589073f: 415f                     pop r15
0x145890741: 5d                       pop rbp
0x145890742: c3                       ret
0x145890743: b908000000               mov ecx, 8
0x145890748: ba78000000               mov edx, 0x78
0x14589074d: e84f8b5000               call 0x145d992a1
0x145890752: 0f0b                     ud2
0x145890754: 4c8975f8                 mov qword ptr [rbp - 8], r14
0x145890758: b901000000               mov ecx, 1
0x14589075d: ba04000000               mov edx, 4
0x145890762: e8548b5000               call 0x145d992bb
0x145890767: 90                       nop
0x145890768: eb36                     jmp 0x1458907a0
0x14589076a: 4c8965f0                 mov qword ptr [rbp - 0x10], r12
0x14589076e: 4c8975f8                 mov qword ptr [rbp - 8], r14
0x145890772: b901000000               mov ecx, 1
0x145890777: ba08000000               mov edx, 8
0x14589077c: e83a8b5000               call 0x145d992bb
0x145890781: 90                       nop
0x145890782: eb1c                     jmp 0x1458907a0
0x145890784: 4c896dd0                 mov qword ptr [rbp - 0x30], r13
0x145890788: 4c8965f0                 mov qword ptr [rbp - 0x10], r12
0x14589078c: 4c8975f8                 mov qword ptr [rbp - 8], r14
0x145890790: b901000000               mov ecx, 1
0x145890795: ba0d000000               mov edx, 0xd
0x14589079a: e81c8b5000               call 0x145d992bb
0x14589079f: 90                       nop
0x1458907a0: 0f0b                     ud2
