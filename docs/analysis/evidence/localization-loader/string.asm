0000000145b275c0  55                     push rbp
0000000145b275c1  4157                   push r15
0000000145b275c3  4156                   push r14
0000000145b275c5  4155                   push r13
0000000145b275c7  4154                   push r12
0000000145b275c9  56                     push rsi
0000000145b275ca  57                     push rdi
0000000145b275cb  53                     push rbx
0000000145b275cc  4881ecb8000000         sub rsp, 0xb8
0000000145b275d3  488dac2480000000       lea rbp, [rsp + 0x80]
0000000145b275db  48c74530feffffff       mov qword ptr [rbp + 0x30], 0xfffffffffffffffe
0000000145b275e3  4889d7                 mov rdi, rdx
0000000145b275e6  4889ce                 mov rsi, rcx
0000000145b275e9  488d4df0               lea rcx, [rbp - 0x10]
0000000145b275ed  41b022                 mov r8b, 0x22
0000000145b275f0  e8bbfdffff             call 0x145b273b0
0000000145b275f5  48837df0ff             cmp qword ptr [rbp - 0x10], -1
0000000145b275fa  741e                   je 0x145b2761a
0000000145b275fc  488b4500               mov rax, qword ptr [rbp]
0000000145b27600  48894618               mov qword ptr [rsi + 0x18], rax
0000000145b27604  f30f6f45f0             movdqu xmm0, xmmword ptr [rbp - 0x10]
0000000145b27609  f30f7f4608             movdqu xmmword ptr [rsi + 8], xmm0
0000000145b2760e  48c70601000000         mov qword ptr [rsi], 1
0000000145b27615  e955060000             jmp 0x145b27c6f
0000000145b2761a  48c7451000000000       mov qword ptr [rbp + 0x10], 0
0000000145b27622  48c7451801000000       mov qword ptr [rbp + 0x18], 1
0000000145b2762a  48c7452000000000       mov qword ptr [rbp + 0x20], 0
0000000145b27632  4531ff                 xor r15d, r15d
0000000145b27635  4c8d25bc01ab01         lea r12, [rip + 0x1ab01bc]
0000000145b2763c  488b4f08               mov rcx, qword ptr [rdi + 8]
0000000145b27640  488b4710               mov rax, qword ptr [rdi + 0x10]
0000000145b27644  4839c8                 cmp rax, rcx
0000000145b27647  7263                   jb 0x145b276ac
0000000145b27649  48ffc0                 inc rax
0000000145b2764c  48894710               mov qword ptr [rdi + 0x10], rax
0000000145b27650  488d15f2687b01         lea rdx, [rip + 0x17b68f2]
0000000145b27657  488955c8               mov qword ptr [rbp - 0x38], rdx
0000000145b2765b  48c745d013000000       mov qword ptr [rbp - 0x30], 0x13
0000000145b27663  4839c1                 cmp rcx, rax
0000000145b27666  480f42c1               cmovb rax, rcx
0000000145b2766a  4885c0                 test rax, rax
0000000145b2766d  0f84aa030000           je 0x145b27a1d
0000000145b27673  488b0f                 mov rcx, qword ptr [rdi]
0000000145b27676  4883f804               cmp rax, 4
0000000145b2767a  0f83a5030000           jae 0x145b27a25
0000000145b27680  31d2                   xor edx, edx
0000000145b27682  4531c0                 xor r8d, r8d
0000000145b27685  e9f9050000             jmp 0x145b27c83
0000000145b2768a  660f1f440000           nop word ptr [rax + rax]
0000000145b27690  488b4518               mov rax, qword ptr [rbp + 0x18]
0000000145b27694  42881c38               mov byte ptr [rax + r15], bl
0000000145b27698  49ffc7                 inc r15
0000000145b2769b  4c897d20               mov qword ptr [rbp + 0x20], r15
0000000145b2769f  488b4f08               mov rcx, qword ptr [rdi + 8]
0000000145b276a3  488b4710               mov rax, qword ptr [rdi + 0x10]
0000000145b276a7  4839c8                 cmp rax, rcx
0000000145b276aa  739d                   jae 0x145b27649
0000000145b276ac  4c8b2f                 mov r13, qword ptr [rdi]
0000000145b276af  410fb65c0500           movzx ebx, byte ptr [r13 + rax]
0000000145b276b5  4c8d7001               lea r14, [rax + 1]
0000000145b276b9  4c897710               mov qword ptr [rdi + 0x10], r14
0000000145b276bd  83fb5c                 cmp ebx, 0x5c
0000000145b276c0  742e                   je 0x145b276f0
0000000145b276c2  83fb22                 cmp ebx, 0x22
0000000145b276c5  0f84b9020000           je 0x145b27984
0000000145b276cb  4c3b7d10               cmp r15, qword ptr [rbp + 0x10]
0000000145b276cf  75bf                   jne 0x145b27690
0000000145b276d1  c6452f01               mov byte ptr [rbp + 0x2f], 1
0000000145b276d5  488d4d10               lea rcx, [rbp + 0x10]
0000000145b276d9  e8d2396100             call 0x14613b0b0
0000000145b276de  90                     nop
0000000145b276df  ebaf                   jmp 0x145b27690
0000000145b276e1  6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145b276f0  4939ce                 cmp r14, rcx
0000000145b276f3  0f83e3020000           jae 0x145b279dc
0000000145b276f9  450fb6740501           movzx r14d, byte ptr [r13 + rax + 1]
0000000145b276ff  4883c002               add rax, 2
0000000145b27703  48894710               mov qword ptr [rdi + 0x10], rax
0000000145b27707  418d4ede               lea ecx, [r14 - 0x22]
0000000145b2770b  83f953                 cmp ecx, 0x53
0000000145b2770e  0f8774040000           ja 0x145b27b88
0000000145b27714  49630c8c               movsxd rcx, dword ptr [r12 + rcx*4]
0000000145b27718  4c01e1                 add rcx, r12
0000000145b2771b  ffe1                   jmp rcx
0000000145b2771d  4c3b7d10               cmp r15, qword ptr [rbp + 0x10]
0000000145b27721  750e                   jne 0x145b27731
0000000145b27723  c6452f01               mov byte ptr [rbp + 0x2f], 1
0000000145b27727  488d4d10               lea rcx, [rbp + 0x10]
0000000145b2772b  e880396100             call 0x14613b0b0
0000000145b27730  90                     nop
0000000145b27731  488b4518               mov rax, qword ptr [rbp + 0x18]
0000000145b27735  46883438               mov byte ptr [rax + r15], r14b
0000000145b27739  e95affffff             jmp 0x145b27698
0000000145b2773e  4c3b7d10               cmp r15, qword ptr [rbp + 0x10]
0000000145b27742  750e                   jne 0x145b27752
0000000145b27744  c6452f01               mov byte ptr [rbp + 0x2f], 1
0000000145b27748  488d4d10               lea rcx, [rbp + 0x10]
0000000145b2774c  e85f396100             call 0x14613b0b0
0000000145b27751  90                     nop
0000000145b27752  488b4518               mov rax, qword ptr [rbp + 0x18]
0000000145b27756  42c6043808             mov byte ptr [rax + r15], 8
0000000145b2775b  e938ffffff             jmp 0x145b27698
0000000145b27760  4c3b7d10               cmp r15, qword ptr [rbp + 0x10]
0000000145b27764  750e                   jne 0x145b27774
0000000145b27766  c6452f01               mov byte ptr [rbp + 0x2f], 1
0000000145b2776a  488d4d10               lea rcx, [rbp + 0x10]
0000000145b2776e  e83d396100             call 0x14613b0b0
0000000145b27773  90                     nop
0000000145b27774  488b4518               mov rax, qword ptr [rbp + 0x18]
0000000145b27778  42c604380c             mov byte ptr [rax + r15], 0xc
0000000145b2777d  e916ffffff             jmp 0x145b27698
0000000145b27782  c6452f01               mov byte ptr [rbp + 0x2f], 1
0000000145b27786  488d4df0               lea rcx, [rbp - 0x10]
0000000145b2778a  4889fa                 mov rdx, rdi
0000000145b2778d  e86ef7ffff             call 0x145b26f00
0000000145b27792  90                     nop
0000000145b27793  488b45f0               mov rax, qword ptr [rbp - 0x10]
0000000145b27797  448b75f8               mov r14d, dword ptr [rbp - 8]
0000000145b2779b  4883f8ff               cmp rax, -1
0000000145b2779f  0f8595040000           jne 0x145b27c3a
0000000145b277a5  4489f0                 mov eax, r14d
0000000145b277a8  2500fcffff             and eax, 0xfffffc00
0000000145b277ad  3d00d80000             cmp eax, 0xd800
0000000145b277b2  7558                   jne 0x145b2780c
0000000145b277b4  488b4710               mov rax, qword ptr [rdi + 0x10]
0000000145b277b8  4883f8fe               cmp rax, -2
0000000145b277bc  734e                   jae 0x145b2780c
0000000145b277be  488d4802               lea rcx, [rax + 2]
0000000145b277c2  483b4f08               cmp rcx, qword ptr [rdi + 8]
0000000145b277c6  7744                   ja 0x145b2780c
0000000145b277c8  488b17                 mov rdx, qword ptr [rdi]
0000000145b277cb  66813c025c75           cmp word ptr [rdx + rax], 0x755c
0000000145b277d1  7539                   jne 0x145b2780c
0000000145b277d3  48894f10               mov qword ptr [rdi + 0x10], rcx
0000000145b277d7  c6452f01               mov byte ptr [rbp + 0x2f], 1
0000000145b277db  488d4df0               lea rcx, [rbp - 0x10]
0000000145b277df  4889fa                 mov rdx, rdi
0000000145b277e2  e819f7ffff             call 0x145b26f00
0000000145b277e7  90                     nop
0000000145b277e8  488b4df0               mov rcx, qword ptr [rbp - 0x10]
0000000145b277ec  8b45f8                 mov eax, dword ptr [rbp - 8]
0000000145b277ef  4883f9ff               cmp rcx, -1
0000000145b277f3  0f855c040000           jne 0x145b27c55
0000000145b277f9  41c1e60a               shl r14d, 0xa
0000000145b277fd  25ff030000             and eax, 0x3ff
0000000145b27802  4101c6                 add r14d, eax
0000000145b27805  4181c60000a1fc         add r14d, 0xfca10000
0000000145b2780c  4489f0                 mov eax, r14d
0000000145b2780f  3500d80000             xor eax, 0xd800
0000000145b27814  050000efff             add eax, 0xffef0000
0000000145b27819  3d0008efff             cmp eax, 0xffef0800
0000000145b2781e  b8fdff0000             mov eax, 0xfffd
0000000145b27823  440f42f0               cmovb r14d, eax
0000000145b27827  c745f000000000         mov dword ptr [rbp - 0x10], 0
0000000145b2782e  4181fe80000000         cmp r14d, 0x80
0000000145b27835  7375                   jae 0x145b278ac
0000000145b27837  448875f0               mov byte ptr [rbp - 0x10], r14b
0000000145b2783b  41bf01000000           mov r15d, 1
0000000145b27841  e9d7000000             jmp 0x145b2791d
0000000145b27846  4c3b7d10               cmp r15, qword ptr [rbp + 0x10]
0000000145b2784a  750e                   jne 0x145b2785a
0000000145b2784c  c6452f01               mov byte ptr [rbp + 0x2f], 1
0000000145b27850  488d4d10               lea rcx, [rbp + 0x10]
0000000145b27854  e857386100             call 0x14613b0b0
0000000145b27859  90                     nop
0000000145b2785a  488b4518               mov rax, qword ptr [rbp + 0x18]
0000000145b2785e  42c604380d             mov byte ptr [rax + r15], 0xd
0000000145b27863  e930feffff             jmp 0x145b27698
0000000145b27868  4c3b7d10               cmp r15, qword ptr [rbp + 0x10]
0000000145b2786c  750e                   jne 0x145b2787c
0000000145b2786e  c6452f01               mov byte ptr [rbp + 0x2f], 1
0000000145b27872  488d4d10               lea rcx, [rbp + 0x10]
0000000145b27876  e835386100             call 0x14613b0b0
0000000145b2787b  90                     nop
0000000145b2787c  488b4518               mov rax, qword ptr [rbp + 0x18]
0000000145b27880  42c604380a             mov byte ptr [rax + r15], 0xa
0000000145b27885  e90efeffff             jmp 0x145b27698
0000000145b2788a  4c3b7d10               cmp r15, qword ptr [rbp + 0x10]
0000000145b2788e  750e                   jne 0x145b2789e
0000000145b27890  c6452f01               mov byte ptr [rbp + 0x2f], 1
0000000145b27894  488d4d10               lea rcx, [rbp + 0x10]
0000000145b27898  e813386100             call 0x14613b0b0
0000000145b2789d  90                     nop
0000000145b2789e  488b4518               mov rax, qword ptr [rbp + 0x18]
0000000145b278a2  42c6043809             mov byte ptr [rax + r15], 9
0000000145b278a7  e9ecfdffff             jmp 0x145b27698
0000000145b278ac  4489f0                 mov eax, r14d
0000000145b278af  243f                   and al, 0x3f
0000000145b278b1  0c80                   or al, 0x80
0000000145b278b3  4489f1                 mov ecx, r14d
0000000145b278b6  c1e906                 shr ecx, 6
0000000145b278b9  4181fe00080000         cmp r14d, 0x800
0000000145b278c0  7311                   jae 0x145b278d3
0000000145b278c2  80c9c0                 or cl, 0xc0
0000000145b278c5  884df0                 mov byte ptr [rbp - 0x10], cl
0000000145b278c8  8845f1                 mov byte ptr [rbp - 0xf], al
0000000145b278cb  41bf02000000           mov r15d, 2
0000000145b278d1  eb4a                   jmp 0x145b2791d
0000000145b278d3  80e13f                 and cl, 0x3f
0000000145b278d6  80c980                 or cl, 0x80
0000000145b278d9  4489f2                 mov edx, r14d
0000000145b278dc  c1ea0c                 shr edx, 0xc
0000000145b278df  4181feffff0000         cmp r14d, 0xffff
0000000145b278e6  7714                   ja 0x145b278fc
0000000145b278e8  80cae0                 or dl, 0xe0
0000000145b278eb  8855f0                 mov byte ptr [rbp - 0x10], dl
0000000145b278ee  884df1                 mov byte ptr [rbp - 0xf], cl
0000000145b278f1  8845f2                 mov byte ptr [rbp - 0xe], al
0000000145b278f4  41bf03000000           mov r15d, 3
0000000145b278fa  eb21                   jmp 0x145b2791d
0000000145b278fc  80e23f                 and dl, 0x3f
0000000145b278ff  80ca80                 or dl, 0x80
0000000145b27902  41c1ee12               shr r14d, 0x12
0000000145b27906  4180cef0               or r14b, 0xf0
0000000145b2790a  448875f0               mov byte ptr [rbp - 0x10], r14b
0000000145b2790e  8855f1                 mov byte ptr [rbp - 0xf], dl
0000000145b27911  884df2                 mov byte ptr [rbp - 0xe], cl
0000000145b27914  8845f3                 mov byte ptr [rbp - 0xd], al
0000000145b27917  41bf04000000           mov r15d, 4
0000000145b2791d  488b4510               mov rax, qword ptr [rbp + 0x10]
0000000145b27921  488b5520               mov rdx, qword ptr [rbp + 0x20]
0000000145b27925  4829d0                 sub rax, rdx
0000000145b27928  4939c7                 cmp r15, rax
0000000145b2792b  7731                   ja 0x145b2795e
0000000145b2792d  48035518               add rdx, qword ptr [rbp + 0x18]
0000000145b27931  4889d1                 mov rcx, rdx
0000000145b27934  488d55f0               lea rdx, [rbp - 0x10]
0000000145b27938  4d89f8                 mov r8, r15
0000000145b2793b  e89bc84600             call 0x145f941db
0000000145b27940  4c037d20               add r15, qword ptr [rbp + 0x20]
0000000145b27944  4c897d20               mov qword ptr [rbp + 0x20], r15
0000000145b27948  488b4f08               mov rcx, qword ptr [rdi + 8]
0000000145b2794c  488b4710               mov rax, qword ptr [rdi + 0x10]
0000000145b27950  4839c8                 cmp rax, rcx
0000000145b27953  0f8253fdffff           jb 0x145b276ac
0000000145b27959  e9ebfcffff             jmp 0x145b27649
0000000145b2795e  c6452f01               mov byte ptr [rbp + 0x2f], 1
0000000145b27962  48c744242001000000     mov qword ptr [rsp + 0x20], 1
0000000145b2796b  41b901000000           mov r9d, 1
0000000145b27971  488d4d10               lea rcx, [rbp + 0x10]
0000000145b27975  4d89f8                 mov r8, r15
0000000145b27978  e873cc4600             call 0x145f945f0
0000000145b2797d  90                     nop
0000000145b2797e  488b5520               mov rdx, qword ptr [rbp + 0x20]
0000000145b27982  eba9                   jmp 0x145b2792d
0000000145b27984  488b4510               mov rax, qword ptr [rbp + 0x10]
0000000145b27988  488945e8               mov qword ptr [rbp - 0x18], rax
0000000145b2798c  488b5518               mov rdx, qword ptr [rbp + 0x18]
0000000145b27990  488d4df0               lea rcx, [rbp - 0x10]
0000000145b27994  488955e0               mov qword ptr [rbp - 0x20], rdx
0000000145b27998  4d89f8                 mov r8, r15
0000000145b2799b  e8b07d4400             call 0x145f6f750
0000000145b279a0  90                     nop
0000000145b279a1  807df000               cmp byte ptr [rbp - 0x10], 0
0000000145b279a5  0f840e010000           je 0x145b27ab9
0000000145b279ab  48837de8ff             cmp qword ptr [rbp - 0x18], -1
0000000145b279b0  0f8417010000           je 0x145b27acd
0000000145b279b6  488d05a3647b01         lea rax, [rip + 0x17b64a3]
0000000145b279bd  488945c8               mov qword ptr [rbp - 0x38], rax
0000000145b279c1  48c745d009000000       mov qword ptr [rbp - 0x30], 9
0000000145b279c9  4983fe04               cmp r14, 4
0000000145b279cd  0f831d010000           jae 0x145b27af0
0000000145b279d3  31c0                   xor eax, eax
0000000145b279d5  31c9                   xor ecx, ecx
0000000145b279d7  e93d030000             jmp 0x145b27d19
0000000145b279dc  4883c002               add rax, 2
0000000145b279e0  48894710               mov qword ptr [rdi + 0x10], rax
0000000145b279e4  488d1571657b01         lea rdx, [rip + 0x17b6571]
0000000145b279eb  488955c8               mov qword ptr [rbp - 0x38], rdx
0000000145b279ef  48c745d00a000000       mov qword ptr [rbp - 0x30], 0xa
0000000145b279f7  4839c1                 cmp rcx, rax
0000000145b279fa  480f43c8               cmovae rcx, rax
0000000145b279fe  4885c0                 test rax, rax
0000000145b27a01  4889c8                 mov rax, rcx
0000000145b27a04  0f84b9000000           je 0x145b27ac3
0000000145b27a0a  4883f804               cmp rax, 4
0000000145b27a0e  0f8391010000           jae 0x145b27ba5
0000000145b27a14  31c9                   xor ecx, ecx
0000000145b27a16  31d2                   xor edx, edx
0000000145b27a18  e97e030000             jmp 0x145b27d9b
0000000145b27a1d  4531c0                 xor r8d, r8d
0000000145b27a20  e974020000             jmp 0x145b27c99
0000000145b27a25  4889c2                 mov rdx, rax
0000000145b27a28  4883e2fc               and rdx, 0xfffffffffffffffc
0000000145b27a2c  660fefc0               pxor xmm0, xmm0
0000000145b27a30  4531c0                 xor r8d, r8d
0000000145b27a33  660f6f0d85b58b00       movdqa xmm1, xmmword ptr [rip + 0x8bb585]
0000000145b27a3b  660f6f1dcdc36300       movdqa xmm3, xmmword ptr [rip + 0x63c3cd]
0000000145b27a43  660fefd2               pxor xmm2, xmm2
0000000145b27a47  660f1f840000000000     nop word ptr [rax + rax]
0000000145b27a50  460fb70c01             movzx r9d, word ptr [rcx + r8]
0000000145b27a55  66410f6ee1             movd xmm4, r9d
0000000145b27a5a  460fb74c0102           movzx r9d, word ptr [rcx + r8 + 2]
0000000145b27a60  66410f6ee9             movd xmm5, r9d
0000000145b27a65  660f74e1               pcmpeqb xmm4, xmm1
0000000145b27a69  660f60e4               punpcklbw xmm4, xmm4
0000000145b27a6d  f20f70e4d4             pshuflw xmm4, xmm4, 0xd4
0000000145b27a72  660f70e4d4             pshufd xmm4, xmm4, 0xd4
0000000145b27a77  660fdbe3               pand xmm4, xmm3
0000000145b27a7b  660fd4d4               paddq xmm2, xmm4
0000000145b27a7f  660f74e9               pcmpeqb xmm5, xmm1
0000000145b27a83  660f60ed               punpcklbw xmm5, xmm5
0000000145b27a87  f20f70e5d4             pshuflw xmm4, xmm5, 0xd4
0000000145b27a8c  660f70e4d4             pshufd xmm4, xmm4, 0xd4
0000000145b27a91  660fdbe3               pand xmm4, xmm3
0000000145b27a95  660fd4c4               paddq xmm0, xmm4
0000000145b27a99  4983c004               add r8, 4
0000000145b27a9d  4c39c2                 cmp rdx, r8
0000000145b27aa0  75ae                   jne 0x145b27a50
0000000145b27aa2  660fd4c2               paddq xmm0, xmm2
0000000145b27aa6  660f70c8ee             pshufd xmm1, xmm0, 0xee
0000000145b27aab  660fd4c8               paddq xmm1, xmm0
0000000145b27aaf  66490f7ec8             movq r8, xmm1
0000000145b27ab4  e9db010000             jmp 0x145b27c94
0000000145b27ab9  488b45e8               mov rax, qword ptr [rbp - 0x18]
0000000145b27abd  488b4de0               mov rcx, qword ptr [rbp - 0x20]
0000000145b27ac1  eb15                   jmp 0x145b27ad8
0000000145b27ac3  ba01000000             mov edx, 1
0000000145b27ac8  e9e9020000             jmp 0x145b27db6
0000000145b27acd  488b45e0               mov rax, qword ptr [rbp - 0x20]
0000000145b27ad1  4c89f9                 mov rcx, r15
0000000145b27ad4  4c8b7df8               mov r15, qword ptr [rbp - 8]
0000000145b27ad8  48894608               mov qword ptr [rsi + 8], rax
0000000145b27adc  48894e10               mov qword ptr [rsi + 0x10], rcx
0000000145b27ae0  4c897e18               mov qword ptr [rsi + 0x18], r15
0000000145b27ae4  48c70600000000         mov qword ptr [rsi], 0
0000000145b27aeb  e97f010000             jmp 0x145b27c6f
0000000145b27af0  4c89f0                 mov rax, r14
0000000145b27af3  4883e0fc               and rax, 0xfffffffffffffffc
0000000145b27af7  660fefc0               pxor xmm0, xmm0
0000000145b27afb  31c9                   xor ecx, ecx
0000000145b27afd  660f6f0dbbb48b00       movdqa xmm1, xmmword ptr [rip + 0x8bb4bb]
0000000145b27b05  660f6f1d03c36300       movdqa xmm3, xmmword ptr [rip + 0x63c303]
0000000145b27b0d  660fefd2               pxor xmm2, xmm2
0000000145b27b11  6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145b27b20  410fb7540d00           movzx edx, word ptr [r13 + rcx]
0000000145b27b26  660f6ee2               movd xmm4, edx
0000000145b27b2a  410fb7540d02           movzx edx, word ptr [r13 + rcx + 2]
0000000145b27b30  660f6eea               movd xmm5, edx
0000000145b27b34  660f74e1               pcmpeqb xmm4, xmm1
0000000145b27b38  660f60e4               punpcklbw xmm4, xmm4
0000000145b27b3c  f20f70e4d4             pshuflw xmm4, xmm4, 0xd4
0000000145b27b41  660f70e4d4             pshufd xmm4, xmm4, 0xd4
0000000145b27b46  660fdbe3               pand xmm4, xmm3
0000000145b27b4a  660fd4d4               paddq xmm2, xmm4
0000000145b27b4e  660f74e9               pcmpeqb xmm5, xmm1
0000000145b27b52  660f60ed               punpcklbw xmm5, xmm5
0000000145b27b56  f20f70e5d4             pshuflw xmm4, xmm5, 0xd4
0000000145b27b5b  660f70e4d4             pshufd xmm4, xmm4, 0xd4
0000000145b27b60  660fdbe3               pand xmm4, xmm3
0000000145b27b64  660fd4c4               paddq xmm0, xmm4
0000000145b27b68  4883c104               add rcx, 4
0000000145b27b6c  4839c8                 cmp rax, rcx
0000000145b27b6f  75af                   jne 0x145b27b20
0000000145b27b71  660fd4c2               paddq xmm0, xmm2
0000000145b27b75  660f70c8ee             pshufd xmm1, xmm0, 0xee
0000000145b27b7a  660fd4c8               paddq xmm1, xmm0
0000000145b27b7e  66480f7ec9             movq rcx, xmm1
0000000145b27b83  e9a2010000             jmp 0x145b27d2a
0000000145b27b88  488d0dcd637b01         lea rcx, [rip + 0x17b63cd]
0000000145b27b8f  48894dc8               mov qword ptr [rbp - 0x38], rcx
0000000145b27b93  48c745d00a000000       mov qword ptr [rbp - 0x30], 0xa
0000000145b27b9b  4883f804               cmp rax, 4
0000000145b27b9f  0f826ffeffff           jb 0x145b27a14
0000000145b27ba5  4889c1                 mov rcx, rax
0000000145b27ba8  4883e1fc               and rcx, 0xfffffffffffffffc
0000000145b27bac  660fefc0               pxor xmm0, xmm0
0000000145b27bb0  31d2                   xor edx, edx
0000000145b27bb2  660f6f0d06b48b00       movdqa xmm1, xmmword ptr [rip + 0x8bb406]
0000000145b27bba  660f6f1d4ec26300       movdqa xmm3, xmmword ptr [rip + 0x63c24e]
0000000145b27bc2  660fefd2               pxor xmm2, xmm2
0000000145b27bc6  662e0f1f840000000000   nop word ptr cs:[rax + rax]
0000000145b27bd0  450fb7441500           movzx r8d, word ptr [r13 + rdx]
0000000145b27bd6  66410f6ee0             movd xmm4, r8d
0000000145b27bdb  450fb7441502           movzx r8d, word ptr [r13 + rdx + 2]
0000000145b27be1  66410f6ee8             movd xmm5, r8d
0000000145b27be6  660f74e1               pcmpeqb xmm4, xmm1
0000000145b27bea  660f60e4               punpcklbw xmm4, xmm4
0000000145b27bee  f20f70e4d4             pshuflw xmm4, xmm4, 0xd4
0000000145b27bf3  660f70e4d4             pshufd xmm4, xmm4, 0xd4
0000000145b27bf8  660fdbe3               pand xmm4, xmm3
0000000145b27bfc  660fd4d4               paddq xmm2, xmm4
0000000145b27c00  660f74e9               pcmpeqb xmm5, xmm1
0000000145b27c04  660f60ed               punpcklbw xmm5, xmm5
0000000145b27c08  f20f70e5d4             pshuflw xmm4, xmm5, 0xd4
0000000145b27c0d  660f70e4d4             pshufd xmm4, xmm4, 0xd4
0000000145b27c12  660fdbe3               pand xmm4, xmm3
0000000145b27c16  660fd4c4               paddq xmm0, xmm4
0000000145b27c1a  4883c204               add rdx, 4
0000000145b27c1e  4839d1                 cmp rcx, rdx
0000000145b27c21  75ad                   jne 0x145b27bd0
0000000145b27c23  660fd4c2               paddq xmm0, xmm2
0000000145b27c27  660f70c8ee             pshufd xmm1, xmm0, 0xee
0000000145b27c2c  660fd4c8               paddq xmm1, xmm0
0000000145b27c30  66480f7eca             movq rdx, xmm1
0000000145b27c35  e974010000             jmp 0x145b27dae
0000000145b27c3a  8b4d04                 mov ecx, dword ptr [rbp + 4]
0000000145b27c3d  894e1c                 mov dword ptr [rsi + 0x1c], ecx
0000000145b27c40  488b4dfc               mov rcx, qword ptr [rbp - 4]
0000000145b27c44  48894e14               mov qword ptr [rsi + 0x14], rcx
0000000145b27c48  48894608               mov qword ptr [rsi + 8], rax
0000000145b27c4c  44897610               mov dword ptr [rsi + 0x10], r14d
0000000145b27c50  e99c000000             jmp 0x145b27cf1
0000000145b27c55  8b5504                 mov edx, dword ptr [rbp + 4]
0000000145b27c58  89561c                 mov dword ptr [rsi + 0x1c], edx
0000000145b27c5b  488b55fc               mov rdx, qword ptr [rbp - 4]
0000000145b27c5f  48895614               mov qword ptr [rsi + 0x14], rdx
0000000145b27c63  48894e08               mov qword ptr [rsi + 8], rcx
0000000145b27c67  894610                 mov dword ptr [rsi + 0x10], eax
0000000145b27c6a  e982000000             jmp 0x145b27cf1
0000000145b27c6f  4881c4b8000000         add rsp, 0xb8
0000000145b27c76  5b                     pop rbx
0000000145b27c77  5f                     pop rdi
0000000145b27c78  5e                     pop rsi
0000000145b27c79  415c                   pop r12
0000000145b27c7b  415d                   pop r13
0000000145b27c7d  415e                   pop r14
0000000145b27c7f  415f                   pop r15
0000000145b27c81  5d                     pop rbp
0000000145b27c82  c3                     ret
0000000145b27c83  4531c9                 xor r9d, r9d
0000000145b27c86  803c110a               cmp byte ptr [rcx + rdx], 0xa
0000000145b27c8a  410f94c1               sete r9b
0000000145b27c8e  4d01c8                 add r8, r9
0000000145b27c91  48ffc2                 inc rdx
0000000145b27c94  4839d0                 cmp rax, rdx
0000000145b27c97  75ea                   jne 0x145b27c83
0000000145b27c99  49ffc0                 inc r8
0000000145b27c9c  4c8945d8               mov qword ptr [rbp - 0x28], r8
0000000145b27ca0  488d45d8               lea rax, [rbp - 0x28]
0000000145b27ca4  488945f0               mov qword ptr [rbp - 0x10], rax
0000000145b27ca8  488d05211c4500         lea rax, [rip + 0x451c21]
0000000145b27caf  488945f8               mov qword ptr [rbp - 8], rax
0000000145b27cb3  488d45c8               lea rax, [rbp - 0x38]
0000000145b27cb7  48894500               mov qword ptr [rbp], rax
0000000145b27cbb  488d05fea34dfa         lea rax, [rip - 0x5b25c02]
0000000145b27cc2  48894508               mov qword ptr [rbp + 8], rax
0000000145b27cc6  c6452f01               mov byte ptr [rbp + 0x2f], 1
0000000145b27cca  488d1560627b01         lea rdx, [rip + 0x17b6260]
0000000145b27cd1  488d4db0               lea rcx, [rbp - 0x50]
0000000145b27cd5  4c8d45f0               lea r8, [rbp - 0x10]
0000000145b27cd9  e852f24300             call 0x145f66f30
0000000145b27cde  90                     nop
0000000145b27cdf  488b45c0               mov rax, qword ptr [rbp - 0x40]
0000000145b27ce3  48894618               mov qword ptr [rsi + 0x18], rax
0000000145b27ce7  f30f6f45b0             movdqu xmm0, xmmword ptr [rbp - 0x50]
0000000145b27cec  f30f7f4608             movdqu xmmword ptr [rsi + 8], xmm0
0000000145b27cf1  48c70601000000         mov qword ptr [rsi], 1
0000000145b27cf8  488b5510               mov rdx, qword ptr [rbp + 0x10]
0000000145b27cfc  4885d2                 test rdx, rdx
0000000145b27cff  0f846affffff           je 0x145b27c6f
0000000145b27d05  488b4d18               mov rcx, qword ptr [rbp + 0x18]
0000000145b27d09  41b801000000           mov r8d, 1
0000000145b27d0f  e8bca44dfa             call 0x1400021d0
0000000145b27d14  e956ffffff             jmp 0x145b27c6f
0000000145b27d19  31d2                   xor edx, edx
0000000145b27d1b  41807c05000a           cmp byte ptr [r13 + rax], 0xa
0000000145b27d21  0f94c2                 sete dl
0000000145b27d24  4801d1                 add rcx, rdx
0000000145b27d27  48ffc0                 inc rax
0000000145b27d2a  4939c6                 cmp r14, rax
0000000145b27d2d  75ea                   jne 0x145b27d19
0000000145b27d2f  48ffc1                 inc rcx
0000000145b27d32  48894dd8               mov qword ptr [rbp - 0x28], rcx
0000000145b27d36  488d45d8               lea rax, [rbp - 0x28]
0000000145b27d3a  488945f0               mov qword ptr [rbp - 0x10], rax
0000000145b27d3e  488d058b1b4500         lea rax, [rip + 0x451b8b]
0000000145b27d45  488945f8               mov qword ptr [rbp - 8], rax
0000000145b27d49  488d45c8               lea rax, [rbp - 0x38]
0000000145b27d4d  48894500               mov qword ptr [rbp], rax
0000000145b27d51  488d0568a34dfa         lea rax, [rip - 0x5b25c98]
0000000145b27d58  48894508               mov qword ptr [rbp + 8], rax
0000000145b27d5c  488d15ce617b01         lea rdx, [rip + 0x17b61ce]
0000000145b27d63  488d4db0               lea rcx, [rbp - 0x50]
0000000145b27d67  4c8d45f0               lea r8, [rbp - 0x10]
0000000145b27d6b  e8c0f14300             call 0x145f66f30
0000000145b27d70  90                     nop
0000000145b27d71  488b55e8               mov rdx, qword ptr [rbp - 0x18]
0000000145b27d75  4885d2                 test rdx, rdx
0000000145b27d78  740f                   je 0x145b27d89
0000000145b27d7a  41b801000000           mov r8d, 1
0000000145b27d80  488b4de0               mov rcx, qword ptr [rbp - 0x20]
0000000145b27d84  e847a44dfa             call 0x1400021d0
0000000145b27d89  488b45c0               mov rax, qword ptr [rbp - 0x40]
0000000145b27d8d  48894618               mov qword ptr [rsi + 0x18], rax
0000000145b27d91  f30f6f45b0             movdqu xmm0, xmmword ptr [rbp - 0x50]
0000000145b27d96  e96ef8ffff             jmp 0x145b27609
0000000145b27d9b  4531c0                 xor r8d, r8d
0000000145b27d9e  41807c0d000a           cmp byte ptr [r13 + rcx], 0xa
0000000145b27da4  410f94c0               sete r8b
0000000145b27da8  4c01c2                 add rdx, r8
0000000145b27dab  48ffc1                 inc rcx
0000000145b27dae  4839c8                 cmp rax, rcx
0000000145b27db1  75e8                   jne 0x145b27d9b
0000000145b27db3  48ffc2                 inc rdx
0000000145b27db6  488955d8               mov qword ptr [rbp - 0x28], rdx
0000000145b27dba  488d45d8               lea rax, [rbp - 0x28]
0000000145b27dbe  488945f0               mov qword ptr [rbp - 0x10], rax
0000000145b27dc2  488d05071b4500         lea rax, [rip + 0x451b07]
0000000145b27dc9  488945f8               mov qword ptr [rbp - 8], rax
0000000145b27dcd  488d45c8               lea rax, [rbp - 0x38]
0000000145b27dd1  48894500               mov qword ptr [rbp], rax
0000000145b27dd5  488d05e4a24dfa         lea rax, [rip - 0x5b25d1c]
0000000145b27ddc  48894508               mov qword ptr [rbp + 8], rax
0000000145b27de0  c6452f01               mov byte ptr [rbp + 0x2f], 1
0000000145b27de4  488d1546617b01         lea rdx, [rip + 0x17b6146]
0000000145b27deb  488d4db0               lea rcx, [rbp - 0x50]
0000000145b27def  4c8d45f0               lea r8, [rbp - 0x10]
0000000145b27df3  e838f14300             call 0x145f66f30
0000000145b27df8  90                     nop
0000000145b27df9  e9e1feffff             jmp 0x145b27cdf
