0000000145b88390  55                     push rbp
0000000145b88391  4157                   push r15
0000000145b88393  4156                   push r14
0000000145b88395  4155                   push r13
0000000145b88397  4154                   push r12
0000000145b88399  56                     push rsi
0000000145b8839a  57                     push rdi
0000000145b8839b  53                     push rbx
0000000145b8839c  b8b8100000             mov eax, 0x10b8
0000000145b883a1  e89aab4100             call 0x145fa2f40
0000000145b883a6  4829c4                 sub rsp, rax
0000000145b883a9  488dac2480000000       lea rbp, [rsp + 0x80]
0000000145b883b1  440f29bd20100000       movaps xmmword ptr [rbp + 0x1020], xmm15
0000000145b883b9  440f29b510100000       movaps xmmword ptr [rbp + 0x1010], xmm14
0000000145b883c1  440f29ad00100000       movaps xmmword ptr [rbp + 0x1000], xmm13
0000000145b883c9  440f29a5f00f0000       movaps xmmword ptr [rbp + 0xff0], xmm12
0000000145b883d1  440f299de00f0000       movaps xmmword ptr [rbp + 0xfe0], xmm11
0000000145b883d9  440f2995d00f0000       movaps xmmword ptr [rbp + 0xfd0], xmm10
0000000145b883e1  440f298dc00f0000       movaps xmmword ptr [rbp + 0xfc0], xmm9
0000000145b883e9  440f2985b00f0000       movaps xmmword ptr [rbp + 0xfb0], xmm8
0000000145b883f1  0f29bda00f0000         movaps xmmword ptr [rbp + 0xfa0], xmm7
0000000145b883f8  0f29b5900f0000         movaps xmmword ptr [rbp + 0xf90], xmm6
0000000145b883ff  48c785880f0000feffffff mov qword ptr [rbp + 0xf88], 0xfffffffffffffffe
0000000145b8840a  4889d6                 mov rsi, rdx
0000000145b8840d  4c8985b80e0000         mov qword ptr [rbp + 0xeb8], r8
0000000145b88414  440fb68a8d010000       movzx r9d, byte ptr [rdx + 0x18d]
0000000145b8841c  418d59fe               lea ebx, [r9 - 2]
0000000145b88420  ba01000000             mov edx, 1
0000000145b88425  80fb07                 cmp bl, 7
0000000145b88428  730d                   jae 0x145b88437
0000000145b8842a  0fb6c3                 movzx eax, bl
0000000145b8842d  488d156cf6a601         lea rdx, [rip + 0x1a6f66c]
0000000145b88434  8b1482                 mov edx, dword ptr [rdx + rax*4]
0000000145b88437  4c8985600f0000         mov qword ptr [rbp + 0xf60], r8
0000000145b8843e  440fb6868c010000       movzx r8d, byte ptr [rsi + 0x18c]
0000000145b88446  418d40fe               lea eax, [r8 - 2]
0000000145b8844a  3c09                   cmp al, 9
0000000145b8844c  48898d280e0000         mov qword ptr [rbp + 0xe28], rcx
0000000145b88453  8995c80e0000           mov dword ptr [rbp + 0xec8], edx
0000000145b88459  4c898d680f0000         mov qword ptr [rbp + 0xf68], r9
0000000145b88460  4c8985700f0000         mov qword ptr [rbp + 0xf70], r8
0000000145b88467  7710                   ja 0x145b88479
0000000145b88469  0fb6c0                 movzx eax, al
0000000145b8846c  488d0dc5f6a601         lea rcx, [rip + 0x1a6f6c5]
0000000145b88473  4c8b24c1               mov r12, qword ptr [rcx + rax*8]
0000000145b88477  eb07                   jmp 0x145b88480
0000000145b88479  4c8d25782c3f01         lea r12, [rip + 0x13f2c78]
0000000145b88480  8b86f4000000           mov eax, dword ptr [rsi + 0xf4]
0000000145b88486  8985cc0e0000           mov dword ptr [rbp + 0xecc], eax
0000000145b8848c  488b8e08010000         mov rcx, qword ptr [rsi + 0x108]
0000000145b88493  488b9610010000         mov rdx, qword ptr [rsi + 0x110]
0000000145b8849a  e801a8efff             call 0x145a82ca0
0000000145b8849f  4989c7                 mov r15, rax
0000000145b884a2  4889b5780f0000         mov qword ptr [rbp + 0xf78], rsi
0000000145b884a9  488d5618               lea rdx, [rsi + 0x18]
0000000145b884ad  c685840f000001         mov byte ptr [rbp + 0xf84], 1
0000000145b884b4  488d4da8               lea rcx, [rbp - 0x58]
0000000145b884b8  e8d3fef9ff             call 0x145b28390
0000000145b884bd  90                     nop
0000000145b884be  4969c7f0000000         imul rax, r15, 0xf0
0000000145b884c5  488d3ddc083f01         lea rdi, [rip + 0x13f08dc]
0000000145b884cc  4801c7                 add rdi, rax
0000000145b884cf  4d8b7c2440             mov r15, qword ptr [r12 + 0x40]
0000000145b884d4  4d89e6                 mov r14, r12
0000000145b884d7  4d8b642448             mov r12, qword ptr [r12 + 0x48]
0000000145b884dc  4c89bdd00e0000         mov qword ptr [rbp + 0xed0], r15
0000000145b884e3  4c89a5d80e0000         mov qword ptr [rbp + 0xed8], r12
0000000145b884ea  4531ed                 xor r13d, r13d
0000000145b884ed  488d352c413f01         lea rsi, [rip + 0x13f412c]
0000000145b884f4  eb1b                   jmp 0x145b88511
0000000145b884f6  662e0f1f840000000000   nop word ptr cs:[rax + rax]
0000000145b88500  4983c578               add r13, 0x78
0000000145b88504  4981fdf8340000         cmp r13, 0x34f8
0000000145b8850b  0f84b2140000           je 0x145b899c3
0000000145b88511  4d39643508             cmp qword ptr [r13 + rsi + 8], r12
0000000145b88516  75e8                   jne 0x145b88500
0000000145b88518  498b4c3500             mov rcx, qword ptr [r13 + rsi]
0000000145b8851d  4c89fa                 mov rdx, r15
0000000145b88520  4d89e0                 mov r8, r12
0000000145b88523  e889b54100             call 0x145fa3ab1
0000000145b88528  85c0                   test eax, eax
0000000145b8852a  75d4                   jne 0x145b88500
0000000145b8852c  80fb06                 cmp bl, 6
0000000145b8852f  7710                   ja 0x145b88541
0000000145b88531  0fb6c3                 movzx eax, bl
0000000145b88534  488d0d85f5a601         lea rcx, [rip + 0x1a6f585]
0000000145b8853b  488b04c1               mov rax, qword ptr [rcx + rax*8]
0000000145b8853f  eb07                   jmp 0x145b88548
0000000145b88541  488d05201a3f01         lea rax, [rip + 0x13f1a20]
0000000145b88548  4901f5                 add r13, rsi
0000000145b8854b  4c8b7830               mov r15, qword ptr [rax + 0x30]
0000000145b8854f  4c8b6038               mov r12, qword ptr [rax + 0x38]
0000000145b88553  4c89bdd00e0000         mov qword ptr [rbp + 0xed0], r15
0000000145b8855a  4c89a5d80e0000         mov qword ptr [rbp + 0xed8], r12
0000000145b88561  31db                   xor ebx, ebx
0000000145b88563  eb1c                   jmp 0x145b88581
0000000145b88565  66662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145b88570  4883c378               add rbx, 0x78
0000000145b88574  4881fbf8340000         cmp rbx, 0x34f8
0000000145b8857b  0f8480140000           je 0x145b89a01
0000000145b88581  4c39643308             cmp qword ptr [rbx + rsi + 8], r12
0000000145b88586  75e8                   jne 0x145b88570
0000000145b88588  488b0c33               mov rcx, qword ptr [rbx + rsi]
0000000145b8858c  4c89fa                 mov rdx, r15
0000000145b8858f  4d89e0                 mov r8, r12
0000000145b88592  e81ab54100             call 0x145fa3ab1
0000000145b88597  85c0                   test eax, eax
0000000145b88599  75d5                   jne 0x145b88570
0000000145b8859b  f20f10b7c8000000       movsd xmm6, qword ptr [rdi + 0xc8]
0000000145b885a3  f3440f16c6             movshdup xmm8, xmm6
0000000145b885a8  4c8bbd600f0000         mov r15, qword ptr [rbp + 0xf60]
0000000145b885af  498d4f10               lea rcx, [r15 + 0x10]
0000000145b885b3  c685860f000001         mov byte ptr [rbp + 0xf86], 1
0000000145b885ba  c685850f000001         mov byte ptr [rbp + 0xf85], 1
0000000145b885c1  0f28ce                 movaps xmm1, xmm6
0000000145b885c4  410f28d0               movaps xmm2, xmm8
0000000145b885c8  e83361f5ff             call 0x145ade700
0000000145b885cd  90                     nop
0000000145b885ce  a801                   test al, 1
0000000145b885d0  7405                   je 0x145b885d7
0000000145b885d2  0f28f8                 movaps xmm7, xmm0
0000000145b885d5  eb40                   jmp 0x145b88617
0000000145b885d7  49837f68ff             cmp qword ptr [r15 + 0x68], -1
0000000145b885dc  7430                   je 0x145b8860e
0000000145b885de  498d5768               lea rdx, [r15 + 0x68]
0000000145b885e2  c685860f000001         mov byte ptr [rbp + 0xf86], 1
0000000145b885e9  c685850f000001         mov byte ptr [rbp + 0xf85], 1
0000000145b885f0  488d4d28               lea rcx, [rbp + 0x28]
0000000145b885f4  0f28d6                 movaps xmm2, xmm6
0000000145b885f7  410f28d8               movaps xmm3, xmm8
0000000145b885fb  e8a09cf5ff             call 0x145ae22a0
0000000145b88600  90                     nop
0000000145b88601  837d2801               cmp dword ptr [rbp + 0x28], 1
0000000145b88605  7507                   jne 0x145b8860e
0000000145b88607  f30f107d34             movss xmm7, dword ptr [rbp + 0x34]
0000000145b8860c  eb09                   jmp 0x145b88617
0000000145b8860e  f3410f10bfb8000000     movss xmm7, dword ptr [r15 + 0xb8]
0000000145b88617  488b85780f0000         mov rax, qword ptr [rbp + 0xf78]
0000000145b8861e  488b9020010000         mov rdx, qword ptr [rax + 0x120]
0000000145b88625  c685860f000001         mov byte ptr [rbp + 0xf86], 1
0000000145b8862c  c685850f000001         mov byte ptr [rbp + 0xf85], 1
0000000145b88633  488d4d08               lea rcx, [rbp + 8]
0000000145b88637  e8b4d00d00             call 0x145c656f0
0000000145b8863c  90                     nop
0000000145b8863d  4c8ba5780f0000         mov r12, qword ptr [rbp + 0xf78]
0000000145b88644  498b842418010000       mov rax, qword ptr [r12 + 0x118]
0000000145b8864c  488985200e0000         mov qword ptr [rbp + 0xe20], rax
0000000145b88653  f3440f1097d4000000     movss xmm10, dword ptr [rdi + 0xd4]
0000000145b8865c  f3450f108e80000000     movss xmm9, dword ptr [r14 + 0x80]
0000000145b88665  e8969b47fa             call 0x140002200
0000000145b8866a  b958000000             mov ecx, 0x58
0000000145b8866f  ba08000000             mov edx, 8
0000000145b88674  e8479b47fa             call 0x1400021c0
0000000145b88679  4885c0                 test rax, rax
0000000145b8867c  0f8409130000           je 0x145b8998b
0000000145b88682  4c8928                 mov qword ptr [rax], r13
0000000145b88685  c7400801000000         mov dword ptr [rax + 8], 1
0000000145b8868c  f2440f10255b0c6000     movsd xmm12, qword ptr [rip + 0x600c5b]
0000000145b88695  f2440f11600c           movsd qword ptr [rax + 0xc], xmm12
0000000145b8869b  48c740140000803f       mov qword ptr [rax + 0x14], 0x3f800000
0000000145b886a3  f2440f102d24b85e00     movsd xmm13, qword ptr [rip + 0x5eb824]
0000000145b886ac  f2440f11681c           movsd qword ptr [rax + 0x1c], xmm13
0000000145b886b2  0f57c0                 xorps xmm0, xmm0
0000000145b886b5  0f114024               movups xmmword ptr [rax + 0x24], xmm0
0000000145b886b9  c7403400000000         mov dword ptr [rax + 0x34], 0
0000000145b886c0  f2440f116838           movsd qword ptr [rax + 0x38], xmm13
0000000145b886c6  c7404000000000         mov dword ptr [rax + 0x40], 0
0000000145b886cd  440f281d2b0c6000       movaps xmm11, xmmword ptr [rip + 0x600c2b]
0000000145b886d5  488985c00e0000         mov qword ptr [rbp + 0xec0], rax
0000000145b886dc  440f115844             movups xmmword ptr [rax + 0x44], xmm11
0000000145b886e1  48c785880e000000000000 mov qword ptr [rbp + 0xe88], 0
0000000145b886ec  48c785900e000008000000 mov qword ptr [rbp + 0xe90], 8
0000000145b886f7  48c785980e000000000000 mov qword ptr [rbp + 0xe98], 0
0000000145b88702  4d8dbc2440010000       lea r15, [r12 + 0x140]
0000000145b8870a  498d442438             lea rax, [r12 + 0x38]
0000000145b8870f  4889442420             mov qword ptr [rsp + 0x20], rax
0000000145b88714  488d8dd00e0000         lea rcx, [rbp + 0xed0]
0000000145b8871b  488b95680f0000         mov rdx, qword ptr [rbp + 0xf68]
0000000145b88722  4c8b85700f0000         mov r8, qword ptr [rbp + 0xf70]
0000000145b88729  4d89f9                 mov r9, r15
0000000145b8872c  e82feaf6ff             call 0x145af7160
0000000145b88731  90                     nop
0000000145b88732  488d8d380f0000         lea rcx, [rbp + 0xf38]
0000000145b88739  4c89fa                 mov rdx, r15
0000000145b8873c  e89f05f7ff             call 0x145af8ce0
0000000145b88741  90                     nop
0000000145b88742  4801de                 add rsi, rbx
0000000145b88745  f3450f10be80000000     movss xmm15, dword ptr [r14 + 0x80]
0000000145b8874e  f3450f10b684000000     movss xmm14, dword ptr [r14 + 0x84]
0000000145b88757  488b95780f0000         mov rdx, qword ptr [rbp + 0xf78]
0000000145b8875e  8bbaf0000000           mov edi, dword ptr [rdx + 0xf0]
0000000145b88764  83c703                 add edi, 3
0000000145b88767  48c785e8030000ffffffff mov qword ptr [rbp + 0x3e8], 0xffffffffffffffff
0000000145b88772  0f1085880e0000         movups xmm0, xmmword ptr [rbp + 0xe88]
0000000145b88779  0f1185a0030000         movups xmmword ptr [rbp + 0x3a0], xmm0
0000000145b88780  488b85980e0000         mov rax, qword ptr [rbp + 0xe98]
0000000145b88787  488985b0030000         mov qword ptr [rbp + 0x3b0], rax
0000000145b8878e  0f1085d00e0000         movups xmm0, xmmword ptr [rbp + 0xed0]
0000000145b88795  0f108de00e0000         movups xmm1, xmmword ptr [rbp + 0xee0]
0000000145b8879c  0f1095f00e0000         movups xmm2, xmmword ptr [rbp + 0xef0]
0000000145b887a3  0f109d000f0000         movups xmm3, xmmword ptr [rbp + 0xf00]
0000000145b887aa  0f2985300e0000         movaps xmmword ptr [rbp + 0xe30], xmm0
0000000145b887b1  0f298d400e0000         movaps xmmword ptr [rbp + 0xe40], xmm1
0000000145b887b8  0f2995500e0000         movaps xmmword ptr [rbp + 0xe50], xmm2
0000000145b887bf  0f299d600e0000         movaps xmmword ptr [rbp + 0xe60], xmm3
0000000145b887c6  0f10850c0f0000         movups xmm0, xmmword ptr [rbp + 0xf0c]
0000000145b887cd  0f11856c0e0000         movups xmmword ptr [rbp + 0xe6c], xmm0
0000000145b887d4  0f1085380f0000         movups xmm0, xmmword ptr [rbp + 0xf38]
0000000145b887db  0f1185b8030000         movups xmmword ptr [rbp + 0x3b8], xmm0
0000000145b887e2  488b85480f0000         mov rax, qword ptr [rbp + 0xf48]
0000000145b887e9  488985c8030000         mov qword ptr [rbp + 0x3c8], rax
0000000145b887f0  450f57c0               xorps xmm8, xmm8
0000000145b887f4  440f11857c040000       movups xmmword ptr [rbp + 0x47c], xmm8
0000000145b887fc  c7858c04000000000000   mov dword ptr [rbp + 0x48c], 0
0000000145b88806  488d8dd8010000         lea rcx, [rbp + 0x1d8]
0000000145b8880d  41b898010000           mov r8d, 0x198
0000000145b88813  e893b24100             call 0x145fa3aab
0000000145b88818  440f2985000e0000       movaps xmmword ptr [rbp + 0xe00], xmm8
0000000145b88820  48c785100e000000000000 mov qword ptr [rbp + 0xe10], 0
0000000145b8882b  440f1185c00c0000       movups xmmword ptr [rbp + 0xcc0], xmm8
0000000145b88833  440f11858c0e0000       movups xmmword ptr [rbp + 0xe8c], xmm8
0000000145b8883b  440f1185980e0000       movups xmmword ptr [rbp + 0xe98], xmm8
0000000145b88843  440f2985c00d0000       movaps xmmword ptr [rbp + 0xdc0], xmm8
0000000145b8884b  440f2985d00d0000       movaps xmmword ptr [rbp + 0xdd0], xmm8
0000000145b88853  440f2985e00d0000       movaps xmmword ptr [rbp + 0xde0], xmm8
0000000145b8885b  440f2985f00d0000       movaps xmmword ptr [rbp + 0xdf0], xmm8
0000000145b88863  c785b00e000000000000   mov dword ptr [rbp + 0xeb0], 0
0000000145b8886d  48c785a80e000000000000 mov qword ptr [rbp + 0xea8], 0
0000000145b88878  0f1045f8               movups xmm0, xmmword ptr [rbp - 8]
0000000145b8887c  0f2985200f0000         movaps xmmword ptr [rbp + 0xf20], xmm0
0000000145b88883  0f1045e8               movups xmm0, xmmword ptr [rbp - 0x18]
0000000145b88887  0f2985100f0000         movaps xmmword ptr [rbp + 0xf10], xmm0
0000000145b8888e  0f1045a8               movups xmm0, xmmword ptr [rbp - 0x58]
0000000145b88892  0f104db8               movups xmm1, xmmword ptr [rbp - 0x48]
0000000145b88896  0f1055c8               movups xmm2, xmmword ptr [rbp - 0x38]
0000000145b8889a  0f105dd8               movups xmm3, xmmword ptr [rbp - 0x28]
0000000145b8889e  0f299d000f0000         movaps xmmword ptr [rbp + 0xf00], xmm3
0000000145b888a5  0f2995f00e0000         movaps xmmword ptr [rbp + 0xef0], xmm2
0000000145b888ac  0f298de00e0000         movaps xmmword ptr [rbp + 0xee0], xmm1
0000000145b888b3  0f2985d00e0000         movaps xmmword ptr [rbp + 0xed0], xmm0
0000000145b888ba  440f2985200d0000       movaps xmmword ptr [rbp + 0xd20], xmm8
0000000145b888c2  440f2985300d0000       movaps xmmword ptr [rbp + 0xd30], xmm8
0000000145b888ca  440f2985400d0000       movaps xmmword ptr [rbp + 0xd40], xmm8
0000000145b888d2  440f2985500d0000       movaps xmmword ptr [rbp + 0xd50], xmm8
0000000145b888da  440f2985600d0000       movaps xmmword ptr [rbp + 0xd60], xmm8
0000000145b888e2  440f2985700d0000       movaps xmmword ptr [rbp + 0xd70], xmm8
0000000145b888ea  440f2985800d0000       movaps xmmword ptr [rbp + 0xd80], xmm8
0000000145b888f2  440f2985900d0000       movaps xmmword ptr [rbp + 0xd90], xmm8
0000000145b888fa  440f2985a00d0000       movaps xmmword ptr [rbp + 0xda0], xmm8
0000000145b88902  440f2985b00d0000       movaps xmmword ptr [rbp + 0xdb0], xmm8
0000000145b8890a  440f2985d00c0000       movaps xmmword ptr [rbp + 0xcd0], xmm8
0000000145b88912  440f1185400f0000       movups xmmword ptr [rbp + 0xf40], xmm8
0000000145b8891a  440f11854c0f0000       movups xmmword ptr [rbp + 0xf4c], xmm8
0000000145b88922  440f2985e00c0000       movaps xmmword ptr [rbp + 0xce0], xmm8
0000000145b8892a  440f2985f00c0000       movaps xmmword ptr [rbp + 0xcf0], xmm8
0000000145b88932  440f2985000d0000       movaps xmmword ptr [rbp + 0xd00], xmm8
0000000145b8893a  440f2985100d0000       movaps xmmword ptr [rbp + 0xd10], xmm8
0000000145b88942  0f104508               movups xmm0, xmmword ptr [rbp + 8]
0000000145b88946  0f104d18               movups xmm1, xmmword ptr [rbp + 0x18]
0000000145b8894a  0f118d600b0000         movups xmmword ptr [rbp + 0xb60], xmm1
0000000145b88951  0f1185500b0000         movups xmmword ptr [rbp + 0xb50], xmm0
0000000145b88958  c785040c000000000000   mov dword ptr [rbp + 0xc04], 0
0000000145b88962  c685b20c000000         mov byte ptr [rbp + 0xcb2], 0
0000000145b88969  48c7857003000001000000 mov qword ptr [rbp + 0x370], 1
0000000145b88974  488b85c00e0000         mov rax, qword ptr [rbp + 0xec0]
0000000145b8897b  48898578030000         mov qword ptr [rbp + 0x378], rax
0000000145b88982  48c7858003000001000000 mov qword ptr [rbp + 0x380], 1
0000000145b8898d  48c7858803000000000000 mov qword ptr [rbp + 0x388], 0
0000000145b88998  48c7859003000008000000 mov qword ptr [rbp + 0x390], 8
0000000145b889a3  48c7859803000000000000 mov qword ptr [rbp + 0x398], 0
0000000145b889ae  48c785d003000000000000 mov qword ptr [rbp + 0x3d0], 0
0000000145b889b9  48c785d803000008000000 mov qword ptr [rbp + 0x3d8], 8
0000000145b889c4  48c785e003000000000000 mov qword ptr [rbp + 0x3e0], 0
0000000145b889cf  4889b558040000         mov qword ptr [rbp + 0x458], rsi
0000000145b889d6  c7856004000001000000   mov dword ptr [rbp + 0x460], 1
0000000145b889e0  f2440f11a564040000     movsd qword ptr [rbp + 0x464], xmm12
0000000145b889e9  48c7856c0400000000803f mov qword ptr [rbp + 0x46c], 0x3f800000
0000000145b889f4  f2440f11ad74040000     movsd qword ptr [rbp + 0x474], xmm13
0000000145b889fd  f2440f11ad90040000     movsd qword ptr [rbp + 0x490], xmm13
0000000145b88a06  c7859804000000000000   mov dword ptr [rbp + 0x498], 0
0000000145b88a10  440f119d9c040000       movups xmmword ptr [rbp + 0x49c], xmm11
0000000145b88a18  488b85200e0000         mov rax, qword ptr [rbp + 0xe20]
0000000145b88a1f  488985b0040000         mov qword ptr [rbp + 0x4b0], rax
0000000145b88a26  c785b804000000000000   mov dword ptr [rbp + 0x4b8], 0
0000000145b88a30  f20f1005c8e46c00       movsd xmm0, qword ptr [rip + 0x6ce4c8]
0000000145b88a38  f20f1185bc040000       movsd qword ptr [rbp + 0x4bc], xmm0
0000000145b88a40  c785c404000000000000   mov dword ptr [rbp + 0x4c4], 0
0000000145b88a4a  f3440f11bdc8040000     movss dword ptr [rbp + 0x4c8], xmm15
0000000145b88a53  0f280d96baa601         movaps xmm1, xmmword ptr [rip + 0x1a6ba96]
0000000145b88a5a  0f118dcc040000         movups xmmword ptr [rbp + 0x4cc], xmm1
0000000145b88a61  f20f100d97baa601       movsd xmm1, qword ptr [rip + 0x1a6ba97]
0000000145b88a69  f20f118ddc040000       movsd qword ptr [rbp + 0x4dc], xmm1
0000000145b88a71  c785e40400000000803f   mov dword ptr [rbp + 0x4e4], 0x3f800000
0000000145b88a7b  f3440f11b5e8040000     movss dword ptr [rbp + 0x4e8], xmm14
0000000145b88a84  440f119dec040000       movups xmmword ptr [rbp + 0x4ec], xmm11
0000000145b88a8c  440f118508050000       movups xmmword ptr [rbp + 0x508], xmm8
0000000145b88a94  440f1185fc040000       movups xmmword ptr [rbp + 0x4fc], xmm8
0000000145b88a9c  0f13b518050000         movlps qword ptr [rbp + 0x518], xmm6
0000000145b88aa3  f30f11bd20050000       movss dword ptr [rbp + 0x520], xmm7
0000000145b88aab  f3440f119524050000     movss dword ptr [rbp + 0x524], xmm10
0000000145b88ab4  48c7852805000001000000 mov qword ptr [rbp + 0x528], 1
0000000145b88abf  f3440f118d30050000     movss dword ptr [rbp + 0x530], xmm9
0000000145b88ac8  48c7853405000000000000 mov qword ptr [rbp + 0x534], 0
0000000145b88ad3  0f288d300e0000         movaps xmm1, xmmword ptr [rbp + 0xe30]
0000000145b88ada  0f2895400e0000         movaps xmm2, xmmword ptr [rbp + 0xe40]
0000000145b88ae1  0f289d500e0000         movaps xmm3, xmmword ptr [rbp + 0xe50]
0000000145b88ae8  0f28a5600e0000         movaps xmm4, xmmword ptr [rbp + 0xe60]
0000000145b88aef  0f118d3c050000         movups xmmword ptr [rbp + 0x53c], xmm1
0000000145b88af6  0f11954c050000         movups xmmword ptr [rbp + 0x54c], xmm2
0000000145b88afd  0f119d5c050000         movups xmmword ptr [rbp + 0x55c], xmm3
0000000145b88b04  0f11a56c050000         movups xmmword ptr [rbp + 0x56c], xmm4
0000000145b88b0b  0f108d6c0e0000         movups xmm1, xmmword ptr [rbp + 0xe6c]
0000000145b88b12  0f118d78050000         movups xmmword ptr [rbp + 0x578], xmm1
0000000145b88b19  48c7858805000000000000 mov qword ptr [rbp + 0x588], 0
0000000145b88b24  89bd90050000           mov dword ptr [rbp + 0x590], edi
0000000145b88b2a  48b80000000001000000   movabs rax, 0x100000000
0000000145b88b34  48898594050000         mov qword ptr [rbp + 0x594], rax
0000000145b88b3b  f20f100dcdb9a601       movsd xmm1, qword ptr [rip + 0x1a6b9cd]
0000000145b88b43  f20f118d9c050000       movsd qword ptr [rbp + 0x59c], xmm1
0000000145b88b4b  48c785a805000000000000 mov qword ptr [rbp + 0x5a8], 0
0000000145b88b56  48c785b005000008000000 mov qword ptr [rbp + 0x5b0], 8
0000000145b88b61  440f1185b8050000       movups xmmword ptr [rbp + 0x5b8], xmm8
0000000145b88b69  48c785c805000008000000 mov qword ptr [rbp + 0x5c8], 8
0000000145b88b74  440f1185d0050000       movups xmmword ptr [rbp + 0x5d0], xmm8
0000000145b88b7c  48c785e005000008000000 mov qword ptr [rbp + 0x5e0], 8
0000000145b88b87  440f1185080c0000       movups xmmword ptr [rbp + 0xc08], xmm8
0000000145b88b8f  440f1185e8050000       movups xmmword ptr [rbp + 0x5e8], xmm8
0000000145b88b97  48c785f805000008000000 mov qword ptr [rbp + 0x5f8], 8
0000000145b88ba2  440f118500060000       movups xmmword ptr [rbp + 0x600], xmm8
0000000145b88baa  48c7851006000008000000 mov qword ptr [rbp + 0x610], 8
0000000145b88bb5  440f118518060000       movups xmmword ptr [rbp + 0x618], xmm8
0000000145b88bbd  48c7852806000008000000 mov qword ptr [rbp + 0x628], 8
0000000145b88bc8  440f118530060000       movups xmmword ptr [rbp + 0x630], xmm8
0000000145b88bd0  48c7854006000008000000 mov qword ptr [rbp + 0x640], 8
0000000145b88bdb  440f118548060000       movups xmmword ptr [rbp + 0x648], xmm8
0000000145b88be3  48c7855806000008000000 mov qword ptr [rbp + 0x658], 8
0000000145b88bee  48c7856006000000000000 mov qword ptr [rbp + 0x660], 0
0000000145b88bf9  488b85600f0000         mov rax, qword ptr [rbp + 0xf60]
0000000145b88c00  488985480b0000         mov qword ptr [rbp + 0xb48], rax
0000000145b88c07  48c785700b000000000000 mov qword ptr [rbp + 0xb70], 0
0000000145b88c12  48c7856806000000000000 mov qword ptr [rbp + 0x668], 0
0000000145b88c1d  48c7857006000008000000 mov qword ptr [rbp + 0x670], 8
0000000145b88c28  440f118578060000       movups xmmword ptr [rbp + 0x678], xmm8
0000000145b88c30  48c7858806000008000000 mov qword ptr [rbp + 0x688], 8
0000000145b88c3b  440f118590060000       movups xmmword ptr [rbp + 0x690], xmm8
0000000145b88c43  48c785a006000008000000 mov qword ptr [rbp + 0x6a0], 8
0000000145b88c4e  440f1185a8060000       movups xmmword ptr [rbp + 0x6a8], xmm8
0000000145b88c56  440f1185180c0000       movups xmmword ptr [rbp + 0xc18], xmm8
0000000145b88c5e  48c785b806000008000000 mov qword ptr [rbp + 0x6b8], 8
0000000145b88c69  48c785c006000000000000 mov qword ptr [rbp + 0x6c0], 0
0000000145b88c74  48c7452800000000       mov qword ptr [rbp + 0x28], 0
0000000145b88c7c  c785280c000000000000   mov dword ptr [rbp + 0xc28], 0
0000000145b88c86  48c785c806000000000000 mov qword ptr [rbp + 0x6c8], 0
0000000145b88c91  48c785d006000004000000 mov qword ptr [rbp + 0x6d0], 4
0000000145b88c9c  440f1185d8060000       movups xmmword ptr [rbp + 0x6d8], xmm8
0000000145b88ca4  48c785e806000008000000 mov qword ptr [rbp + 0x6e8], 8
0000000145b88caf  48c785f006000000000000 mov qword ptr [rbp + 0x6f0], 0
0000000145b88cba  c685b00c0000ff         mov byte ptr [rbp + 0xcb0], 0xff
0000000145b88cc1  48c7453800000000       mov qword ptr [rbp + 0x38], 0
0000000145b88cc9  c7852c0c000028230000   mov dword ptr [rbp + 0xc2c], 0x2328
0000000145b88cd3  c785000b000000000000   mov dword ptr [rbp + 0xb00], 0
0000000145b88cdd  48c785080b000000000000 mov qword ptr [rbp + 0xb08], 0
0000000145b88ce8  48c785100b000001000000 mov qword ptr [rbp + 0xb10], 1
0000000145b88cf3  48c785180b000000000000 mov qword ptr [rbp + 0xb18], 0
0000000145b88cfe  48c785f806000000000000 mov qword ptr [rbp + 0x6f8], 0
0000000145b88d09  48c7850007000008000000 mov qword ptr [rbp + 0x700], 8
0000000145b88d14  0f288dc00d0000         movaps xmm1, xmmword ptr [rbp + 0xdc0]
0000000145b88d1b  0f118d08070000         movups xmmword ptr [rbp + 0x708], xmm1
0000000145b88d22  48c7851807000008000000 mov qword ptr [rbp + 0x718], 8
0000000145b88d2d  0f288dd00d0000         movaps xmm1, xmmword ptr [rbp + 0xdd0]
0000000145b88d34  0f118d20070000         movups xmmword ptr [rbp + 0x720], xmm1
0000000145b88d3b  48c7853007000008000000 mov qword ptr [rbp + 0x730], 8
0000000145b88d46  440f118538070000       movups xmmword ptr [rbp + 0x738], xmm8
0000000145b88d4e  48c7854807000004000000 mov qword ptr [rbp + 0x748], 4
0000000145b88d59  0f288de00d0000         movaps xmm1, xmmword ptr [rbp + 0xde0]
0000000145b88d60  0f118d50070000         movups xmmword ptr [rbp + 0x750], xmm1
0000000145b88d67  48c7856007000004000000 mov qword ptr [rbp + 0x760], 4
0000000145b88d72  0f288df00d0000         movaps xmm1, xmmword ptr [rbp + 0xdf0]
0000000145b88d79  0f118d68070000         movups xmmword ptr [rbp + 0x768], xmm1
0000000145b88d80  48c7857807000004000000 mov qword ptr [rbp + 0x778], 4
0000000145b88d8b  48c7858007000000000000 mov qword ptr [rbp + 0x780], 0
0000000145b88d96  488b85100e0000         mov rax, qword ptr [rbp + 0xe10]
0000000145b88d9d  48898598070000         mov qword ptr [rbp + 0x798], rax
0000000145b88da4  0f288d000e0000         movaps xmm1, xmmword ptr [rbp + 0xe00]
0000000145b88dab  0f118d88070000         movups xmmword ptr [rbp + 0x788], xmm1
0000000145b88db2  488b85c80c0000         mov rax, qword ptr [rbp + 0xcc8]
0000000145b88db9  488985b0070000         mov qword ptr [rbp + 0x7b0], rax
0000000145b88dc0  0f108db80c0000         movups xmm1, xmmword ptr [rbp + 0xcb8]
0000000145b88dc7  0f118da0070000         movups xmmword ptr [rbp + 0x7a0], xmm1
0000000145b88dce  48c785c007000000000000 mov qword ptr [rbp + 0x7c0], 0
0000000145b88dd9  c785cc07000002000000   mov dword ptr [rbp + 0x7cc], 2
0000000145b88de3  0f108d880e0000         movups xmm1, xmmword ptr [rbp + 0xe88]
0000000145b88dea  0f1095980e0000         movups xmm2, xmmword ptr [rbp + 0xe98]
0000000145b88df1  0f1195e0070000         movups xmmword ptr [rbp + 0x7e0], xmm2
0000000145b88df8  0f118dd0070000         movups xmmword ptr [rbp + 0x7d0], xmm1
0000000145b88dff  48b80a00000001000000   movabs rax, 0x10000000a
0000000145b88e09  488985300c0000         mov qword ptr [rbp + 0xc30], rax
0000000145b88e10  f30f100d58046000       movss xmm1, dword ptr [rip + 0x600458]
0000000145b88e18  0f138d380c0000         movlps qword ptr [rbp + 0xc38], xmm1
0000000145b88e1f  c785400c000000007042   mov dword ptr [rbp + 0xc40], 0x42700000
0000000145b88e29  c685b10c0000ff         mov byte ptr [rbp + 0xcb1], 0xff
0000000145b88e30  48c785780b000000000000 mov qword ptr [rbp + 0xb78], 0
0000000145b88e3b  8b85b00e0000           mov eax, dword ptr [rbp + 0xeb0]
0000000145b88e41  89854c0c0000           mov dword ptr [rbp + 0xc4c], eax
0000000145b88e47  488b85a80e0000         mov rax, qword ptr [rbp + 0xea8]
0000000145b88e4e  488985440c0000         mov qword ptr [rbp + 0xc44], rax
0000000145b88e55  f20f100dc3b6a601       movsd xmm1, qword ptr [rip + 0x1a6b6c3]
0000000145b88e5d  f20f118d500c0000       movsd qword ptr [rbp + 0xc50], xmm1
0000000145b88e65  c785580c000000007042   mov dword ptr [rbp + 0xc58], 0x42700000
0000000145b88e6f  48c785f007000000000000 mov qword ptr [rbp + 0x7f0], 0
0000000145b88e7a  48c785f807000004000000 mov qword ptr [rbp + 0x7f8], 4
0000000145b88e85  48c7850008000000000000 mov qword ptr [rbp + 0x800], 0
0000000145b88e90  c7855c0c000014000000   mov dword ptr [rbp + 0xc5c], 0x14
0000000145b88e9a  c785200b000000000000   mov dword ptr [rbp + 0xb20], 0
0000000145b88ea4  c785280b000000000000   mov dword ptr [rbp + 0xb28], 0
0000000145b88eae  c7859c0c000001000000   mov dword ptr [rbp + 0xc9c], 1
0000000145b88eb8  c685a00c000000         mov byte ptr [rbp + 0xca0], 0
0000000145b88ebf  440f1185800b0000       movups xmmword ptr [rbp + 0xb80], xmm8
0000000145b88ec7  f20f1185600c0000       movsd qword ptr [rbp + 0xc60], xmm0
0000000145b88ecf  48c7850808000000000000 mov qword ptr [rbp + 0x808], 0
0000000145b88eda  48c7851008000004000000 mov qword ptr [rbp + 0x810], 4
0000000145b88ee5  440f118518080000       movups xmmword ptr [rbp + 0x818], xmm8
0000000145b88eed  48c7852808000004000000 mov qword ptr [rbp + 0x828], 4
0000000145b88ef8  48c7853008000000000000 mov qword ptr [rbp + 0x830], 0
0000000145b88f03  66c785a10c00000000     mov word ptr [rbp + 0xca1], 0
0000000145b88f0c  c785680c0000000020c1   mov dword ptr [rbp + 0xc68], 0xc1200000
0000000145b88f16  c785c80b000000000000   mov dword ptr [rbp + 0xbc8], 0
0000000145b88f20  c785300b000000000000   mov dword ptr [rbp + 0xb30], 0
0000000145b88f2a  c785380b000000000000   mov dword ptr [rbp + 0xb38], 0
0000000145b88f34  c7856c0c000000000000   mov dword ptr [rbp + 0xc6c], 0
0000000145b88f3e  c785dc0b000000000000   mov dword ptr [rbp + 0xbdc], 0
0000000145b88f48  c785f00b000000000000   mov dword ptr [rbp + 0xbf0], 0
0000000145b88f52  c785400b000000000000   mov dword ptr [rbp + 0xb40], 0
0000000145b88f5c  c785a60c000000000000   mov dword ptr [rbp + 0xca6], 0
0000000145b88f66  c785a30c000000000000   mov dword ptr [rbp + 0xca3], 0
0000000145b88f70  0f2885200f0000         movaps xmm0, xmmword ptr [rbp + 0xf20]
0000000145b88f77  0f118588080000         movups xmmword ptr [rbp + 0x888], xmm0
0000000145b88f7e  0f2885100f0000         movaps xmm0, xmmword ptr [rbp + 0xf10]
0000000145b88f85  0f118578080000         movups xmmword ptr [rbp + 0x878], xmm0
0000000145b88f8c  0f2885d00e0000         movaps xmm0, xmmword ptr [rbp + 0xed0]
0000000145b88f93  0f288de00e0000         movaps xmm1, xmmword ptr [rbp + 0xee0]
0000000145b88f9a  0f2895f00e0000         movaps xmm2, xmmword ptr [rbp + 0xef0]
0000000145b88fa1  0f289d000f0000         movaps xmm3, xmmword ptr [rbp + 0xf00]
0000000145b88fa8  0f119d68080000         movups xmmword ptr [rbp + 0x868], xmm3
0000000145b88faf  0f119558080000         movups xmmword ptr [rbp + 0x858], xmm2
0000000145b88fb6  0f118d48080000         movups xmmword ptr [rbp + 0x848], xmm1
0000000145b88fbd  0f118538080000         movups xmmword ptr [rbp + 0x838], xmm0
0000000145b88fc4  48c7454800000000       mov qword ptr [rbp + 0x48], 0
0000000145b88fcc  48c7455800000000       mov qword ptr [rbp + 0x58], 0
0000000145b88fd4  48c7456800000000       mov qword ptr [rbp + 0x68], 0
0000000145b88fdc  48c7457800000000       mov qword ptr [rbp + 0x78], 0
0000000145b88fe4  48c7858000000008000000 mov qword ptr [rbp + 0x80], 8
0000000145b88fef  0f2885200d0000         movaps xmm0, xmmword ptr [rbp + 0xd20]
0000000145b88ff6  0f118588000000         movups xmmword ptr [rbp + 0x88], xmm0
0000000145b88ffd  48c7859800000004000000 mov qword ptr [rbp + 0x98], 4
0000000145b89008  0f2885300d0000         movaps xmm0, xmmword ptr [rbp + 0xd30]
0000000145b8900f  0f1185a0000000         movups xmmword ptr [rbp + 0xa0], xmm0
0000000145b89016  48c785b000000004000000 mov qword ptr [rbp + 0xb0], 4
0000000145b89021  0f2885400d0000         movaps xmm0, xmmword ptr [rbp + 0xd40]
0000000145b89028  0f1185b8000000         movups xmmword ptr [rbp + 0xb8], xmm0
0000000145b8902f  48c785c800000008000000 mov qword ptr [rbp + 0xc8], 8
0000000145b8903a  0f2885500d0000         movaps xmm0, xmmword ptr [rbp + 0xd50]
0000000145b89041  0f1185d0000000         movups xmmword ptr [rbp + 0xd0], xmm0
0000000145b89048  48c785e000000008000000 mov qword ptr [rbp + 0xe0], 8
0000000145b89053  0f2885600d0000         movaps xmm0, xmmword ptr [rbp + 0xd60]
0000000145b8905a  0f1185e8000000         movups xmmword ptr [rbp + 0xe8], xmm0
0000000145b89061  48c785f800000008000000 mov qword ptr [rbp + 0xf8], 8
0000000145b8906c  0f2885700d0000         movaps xmm0, xmmword ptr [rbp + 0xd70]
0000000145b89073  0f118500010000         movups xmmword ptr [rbp + 0x100], xmm0
0000000145b8907a  48c7851001000004000000 mov qword ptr [rbp + 0x110], 4
0000000145b89085  0f2885800d0000         movaps xmm0, xmmword ptr [rbp + 0xd80]
0000000145b8908c  0f118518010000         movups xmmword ptr [rbp + 0x118], xmm0
0000000145b89093  48c7852801000004000000 mov qword ptr [rbp + 0x128], 4
0000000145b8909e  0f2885900d0000         movaps xmm0, xmmword ptr [rbp + 0xd90]
0000000145b890a5  0f118530010000         movups xmmword ptr [rbp + 0x130], xmm0
0000000145b890ac  48c7854001000008000000 mov qword ptr [rbp + 0x140], 8
0000000145b890b7  0f2885a00d0000         movaps xmm0, xmmword ptr [rbp + 0xda0]
0000000145b890be  0f118548010000         movups xmmword ptr [rbp + 0x148], xmm0
0000000145b890c5  48c7855801000008000000 mov qword ptr [rbp + 0x158], 8
0000000145b890d0  0f2885b00d0000         movaps xmm0, xmmword ptr [rbp + 0xdb0]
0000000145b890d7  0f118560010000         movups xmmword ptr [rbp + 0x160], xmm0
0000000145b890de  48c7857001000004000000 mov qword ptr [rbp + 0x170], 4
0000000145b890e9  48c7857801000000000000 mov qword ptr [rbp + 0x178], 0
0000000145b890f4  c685a901000002         mov byte ptr [rbp + 0x1a9], 2
0000000145b890fb  48c7859808000000000000 mov qword ptr [rbp + 0x898], 0
0000000145b89106  440f1185c0010000       movups xmmword ptr [rbp + 0x1c0], xmm8
0000000145b8910e  440f1185b0010000       movups xmmword ptr [rbp + 0x1b0], xmm8
0000000145b89116  48c785ce01000000000000 mov qword ptr [rbp + 0x1ce], 0
0000000145b89121  48c785a008000008000000 mov qword ptr [rbp + 0x8a0], 8
0000000145b8912c  0f2885d00c0000         movaps xmm0, xmmword ptr [rbp + 0xcd0]
0000000145b89133  0f1185a8080000         movups xmmword ptr [rbp + 0x8a8], xmm0
0000000145b8913a  48c785b808000008000000 mov qword ptr [rbp + 0x8b8], 8
0000000145b89145  0f2885e00c0000         movaps xmm0, xmmword ptr [rbp + 0xce0]
0000000145b8914c  0f1185c0080000         movups xmmword ptr [rbp + 0x8c0], xmm0
0000000145b89153  48c785d008000008000000 mov qword ptr [rbp + 0x8d0], 8
0000000145b8915e  0f2885f00c0000         movaps xmm0, xmmword ptr [rbp + 0xcf0]
0000000145b89165  0f1185d8080000         movups xmmword ptr [rbp + 0x8d8], xmm0
0000000145b8916c  48c785e808000008000000 mov qword ptr [rbp + 0x8e8], 8
0000000145b89177  0f2885000d0000         movaps xmm0, xmmword ptr [rbp + 0xd00]
0000000145b8917e  0f1185f0080000         movups xmmword ptr [rbp + 0x8f0], xmm0
0000000145b89185  48c7850009000008000000 mov qword ptr [rbp + 0x900], 8
0000000145b89190  0f2885100d0000         movaps xmm0, xmmword ptr [rbp + 0xd10]
0000000145b89197  0f118508090000         movups xmmword ptr [rbp + 0x908], xmm0
0000000145b8919e  48c7851809000008000000 mov qword ptr [rbp + 0x918], 8
0000000145b891a9  440f118520090000       movups xmmword ptr [rbp + 0x920], xmm8
0000000145b891b1  c7853009000000000000   mov dword ptr [rbp + 0x930], 0
0000000145b891bb  8b85580f0000           mov eax, dword ptr [rbp + 0xf58]
0000000145b891c1  898554090000           mov dword ptr [rbp + 0x954], eax
0000000145b891c7  0f1085380f0000         movups xmm0, xmmword ptr [rbp + 0xf38]
0000000145b891ce  0f108d480f0000         movups xmm1, xmmword ptr [rbp + 0xf48]
0000000145b891d5  0f118d44090000         movups xmmword ptr [rbp + 0x944], xmm1
0000000145b891dc  0f118534090000         movups xmmword ptr [rbp + 0x934], xmm0
0000000145b891e3  48c7855d09000000000000 mov qword ptr [rbp + 0x95d], 0
0000000145b891ee  48c7855809000000000000 mov qword ptr [rbp + 0x958], 0
0000000145b891f9  0f280530b3a601         movaps xmm0, xmmword ptr [rip + 0x1a6b330]
0000000145b89200  0f1185700c0000         movups xmmword ptr [rbp + 0xc70], xmm0
0000000145b89207  48c7856809000000000000 mov qword ptr [rbp + 0x968], 0
0000000145b89212  48c7857009000008000000 mov qword ptr [rbp + 0x970], 8
0000000145b8921d  440f118578090000       movups xmmword ptr [rbp + 0x978], xmm8
0000000145b89225  48c7858809000008000000 mov qword ptr [rbp + 0x988], 8
0000000145b89230  48c7859009000000000000 mov qword ptr [rbp + 0x990], 0
0000000145b8923b  8b85cc0e0000           mov eax, dword ptr [rbp + 0xecc]
0000000145b89241  8985800c0000           mov dword ptr [rbp + 0xc80], eax
0000000145b89247  48c7859809000000000000 mov qword ptr [rbp + 0x998], 0
0000000145b89252  48c785a009000008000000 mov qword ptr [rbp + 0x9a0], 8
0000000145b8925d  440f1185a8090000       movups xmmword ptr [rbp + 0x9a8], xmm8
0000000145b89265  48c785b809000008000000 mov qword ptr [rbp + 0x9b8], 8
0000000145b89270  c785aa0c000000000000   mov dword ptr [rbp + 0xcaa], 0
0000000145b8927a  c685b30c000000         mov byte ptr [rbp + 0xcb3], 0
0000000145b89281  440f1185c0090000       movups xmmword ptr [rbp + 0x9c0], xmm8
0000000145b89289  48c785d009000008000000 mov qword ptr [rbp + 0x9d0], 8
0000000145b89294  440f1185d8090000       movups xmmword ptr [rbp + 0x9d8], xmm8
0000000145b8929c  48c785e809000008000000 mov qword ptr [rbp + 0x9e8], 8
0000000145b892a7  440f1185f0090000       movups xmmword ptr [rbp + 0x9f0], xmm8
0000000145b892af  48c785000a000008000000 mov qword ptr [rbp + 0xa00], 8
0000000145b892ba  440f1185080a0000       movups xmmword ptr [rbp + 0xa08], xmm8
0000000145b892c2  48c785180a000008000000 mov qword ptr [rbp + 0xa18], 8
0000000145b892cd  48c785840c000000000000 mov qword ptr [rbp + 0xc84], 0
0000000145b892d8  440f1185200a0000       movups xmmword ptr [rbp + 0xa20], xmm8
0000000145b892e0  48c785300a000004000000 mov qword ptr [rbp + 0xa30], 4
0000000145b892eb  440f1185380a0000       movups xmmword ptr [rbp + 0xa38], xmm8
0000000145b892f3  48c785480a000004000000 mov qword ptr [rbp + 0xa48], 4
0000000145b892fe  440f1185500a0000       movups xmmword ptr [rbp + 0xa50], xmm8
0000000145b89306  48c785600a000008000000 mov qword ptr [rbp + 0xa60], 8
0000000145b89311  48c785680a000000000000 mov qword ptr [rbp + 0xa68], 0
0000000145b8931c  440f1185a80b0000       movups xmmword ptr [rbp + 0xba8], xmm8
0000000145b89324  440f1185980b0000       movups xmmword ptr [rbp + 0xb98], xmm8
0000000145b8932c  48c785b80b000001000000 mov qword ptr [rbp + 0xbb8], 1
0000000145b89337  8b85c80e0000           mov eax, dword ptr [rbp + 0xec8]
0000000145b8933d  89858c0c0000           mov dword ptr [rbp + 0xc8c], eax
0000000145b89343  48c785c00b000000000000 mov qword ptr [rbp + 0xbc0], 0
0000000145b8934e  c785900c000000000000   mov dword ptr [rbp + 0xc90], 0
0000000145b89358  48c785700a000000000000 mov qword ptr [rbp + 0xa70], 0
0000000145b89363  48c785780a000008000000 mov qword ptr [rbp + 0xa78], 8
0000000145b8936e  440f1185800a0000       movups xmmword ptr [rbp + 0xa80], xmm8
0000000145b89376  48c785900a000008000000 mov qword ptr [rbp + 0xa90], 8
0000000145b89381  c685ae0c000000         mov byte ptr [rbp + 0xcae], 0
0000000145b89388  440f1185980a0000       movups xmmword ptr [rbp + 0xa98], xmm8
0000000145b89390  48c785a80a000008000000 mov qword ptr [rbp + 0xaa8], 8
0000000145b8939b  440f1185b00a0000       movups xmmword ptr [rbp + 0xab0], xmm8
0000000145b893a3  48c785c00a000004000000 mov qword ptr [rbp + 0xac0], 4
0000000145b893ae  440f1185c80a0000       movups xmmword ptr [rbp + 0xac8], xmm8
0000000145b893b6  48c785d80a000008000000 mov qword ptr [rbp + 0xad8], 8
0000000145b893c1  48c785940c000000000000 mov qword ptr [rbp + 0xc94], 0
0000000145b893cc  440f1185e00a0000       movups xmmword ptr [rbp + 0xae0], xmm8
0000000145b893d4  48c785f00a000008000000 mov qword ptr [rbp + 0xaf0], 8
0000000145b893df  48c785f80a000000000000 mov qword ptr [rbp + 0xaf8], 0
0000000145b893ea  c685af0c000000         mov byte ptr [rbp + 0xcaf], 0
0000000145b893f1  e80a8e47fa             call 0x140002200
0000000145b893f6  b910000000             mov ecx, 0x10
0000000145b893fb  ba08000000             mov edx, 8
0000000145b89400  e8bb8d47fa             call 0x1400021c0
0000000145b89405  4885c0                 test rax, rax
0000000145b89408  0f84a0050000           je 0x145b899ae
0000000145b8940e  488b9570080000         mov rdx, qword ptr [rbp + 0x870]
0000000145b89415  488b8d78080000         mov rcx, qword ptr [rbp + 0x878]
0000000145b8941c  4989c8                 mov r8, rcx
0000000145b8941f  49c1e006               shl r8, 6
0000000145b89423  4885c9                 test rcx, rcx
0000000145b89426  7423                   je 0x145b8944b
0000000145b89428  31c9                   xor ecx, ecx
0000000145b8942a  4531c9                 xor r9d, r9d
0000000145b8942d  0f1f00                 nop dword ptr [rax]
0000000145b89430  42803c0a1c             cmp byte ptr [rdx + r9], 0x1c
0000000145b89435  0f8438050000           je 0x145b89973
0000000145b8943b  4983c140               add r9, 0x40
0000000145b8943f  4d39c8                 cmp r8, r9
0000000145b89442  75ec                   jne 0x145b89430
0000000145b89444  4885c9                 test rcx, rcx
0000000145b89447  7409                   je 0x145b89452
0000000145b89449  eb0f                   jmp 0x145b8945a
0000000145b8944b  31c9                   xor ecx, ecx
0000000145b8944d  4885c9                 test rcx, rcx
0000000145b89450  7508                   jne 0x145b8945a
0000000145b89452  498b4e40               mov rcx, qword ptr [r14 + 0x40]
0000000145b89456  4d8b4e48               mov r9, qword ptr [r14 + 0x48]
0000000145b8945a  488908                 mov qword ptr [rax], rcx
0000000145b8945d  4c894808               mov qword ptr [rax + 8], r9
0000000145b89461  48c785380f000001000000 mov qword ptr [rbp + 0xf38], 1
0000000145b8946c  488985400f0000         mov qword ptr [rbp + 0xf40], rax
0000000145b89473  48c785480f000001000000 mov qword ptr [rbp + 0xf48], 1
0000000145b8947e  4901d0                 add r8, rdx
0000000145b89481  c685870f000001         mov byte ptr [rbp + 0xf87], 1
0000000145b89488  488d8dd00e0000         lea rcx, [rbp + 0xed0]
0000000145b8948f  e8fc380b00             call 0x145c3cd90
0000000145b89494  90                     nop
0000000145b89495  488b85d00e0000         mov rax, qword ptr [rbp + 0xed0]
0000000145b8949c  488985700f0000         mov qword ptr [rbp + 0xf70], rax
0000000145b894a3  488b85d80e0000         mov rax, qword ptr [rbp + 0xed8]
0000000145b894aa  488985680f0000         mov qword ptr [rbp + 0xf68], rax
0000000145b894b1  488b8de00e0000         mov rcx, qword ptr [rbp + 0xee0]
0000000145b894b8  4885c9                 test rcx, rcx
0000000145b894bb  0f84c7000000           je 0x145b89588
0000000145b894c1  4889c8                 mov rax, rcx
0000000145b894c4  48c1e004               shl rax, 4
0000000145b894c8  4c8ba5680f0000         mov r12, qword ptr [rbp + 0xf68]
0000000145b894cf  4c01e0                 add rax, r12
0000000145b894d2  488985600f0000         mov qword ptr [rbp + 0xf60], rax
0000000145b894d9  4c8bbd480f0000         mov r15, qword ptr [rbp + 0xf48]
0000000145b894e0  eb2e                   jmp 0x145b89510
0000000145b894e2  66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145b894f0  4a891c2f               mov qword ptr [rdi + r13], rbx
0000000145b894f4  4e89742f08             mov qword ptr [rdi + r13 + 8], r14
0000000145b894f9  49ffc7                 inc r15
0000000145b894fc  4c89bd480f0000         mov qword ptr [rbp + 0xf48], r15
0000000145b89503  4983c410               add r12, 0x10
0000000145b89507  4c3ba5600f0000         cmp r12, qword ptr [rbp + 0xf60]
0000000145b8950e  7478                   je 0x145b89588
0000000145b89510  498b1c24               mov rbx, qword ptr [r12]
0000000145b89514  4d8b742408             mov r14, qword ptr [r12 + 8]
0000000145b89519  488bbd400f0000         mov rdi, qword ptr [rbp + 0xf40]
0000000145b89520  4d89fd                 mov r13, r15
0000000145b89523  49c1e504               shl r13, 4
0000000145b89527  4d85ff                 test r15, r15
0000000145b8952a  743a                   je 0x145b89566
0000000145b8952c  31f6                   xor esi, esi
0000000145b8952e  eb09                   jmp 0x145b89539
0000000145b89530  4883c610               add rsi, 0x10
0000000145b89534  4939f5                 cmp r13, rsi
0000000145b89537  7427                   je 0x145b89560
0000000145b89539  4c39743708             cmp qword ptr [rdi + rsi + 8], r14
0000000145b8953e  75f0                   jne 0x145b89530
0000000145b89540  488b0c37               mov rcx, qword ptr [rdi + rsi]
0000000145b89544  4889da                 mov rdx, rbx
0000000145b89547  4d89f0                 mov r8, r14
0000000145b8954a  e862a54100             call 0x145fa3ab1
0000000145b8954f  85c0                   test eax, eax
0000000145b89551  75dd                   jne 0x145b89530
0000000145b89553  ebae                   jmp 0x145b89503
0000000145b89555  66662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145b89560  4983ff05               cmp r15, 5
0000000145b89564  779d                   ja 0x145b89503
0000000145b89566  4c3bbd380f0000         cmp r15, qword ptr [rbp + 0xf38]
0000000145b8956d  7581                   jne 0x145b894f0
0000000145b8956f  488d8d380f0000         lea rcx, [rbp + 0xf38]
0000000145b89576  e865ad4100             call 0x145fa42e0
0000000145b8957b  90                     nop
0000000145b8957c  488bbd400f0000         mov rdi, qword ptr [rbp + 0xf40]
0000000145b89583  e968ffffff             jmp 0x145b894f0
0000000145b89588  488b95700f0000         mov rdx, qword ptr [rbp + 0xf70]
0000000145b8958f  4885d2                 test rdx, rdx
0000000145b89592  7416                   je 0x145b895aa
0000000145b89594  48c1e204               shl rdx, 4
0000000145b89598  41b808000000           mov r8d, 8
0000000145b8959e  488b8d680f0000         mov rcx, qword ptr [rbp + 0xf68]
0000000145b895a5  e8268c47fa             call 0x1400021d0
0000000145b895aa  488b85380f0000         mov rax, qword ptr [rbp + 0xf38]
0000000145b895b1  488b8d400f0000         mov rcx, qword ptr [rbp + 0xf40]
0000000145b895b8  488b95480f0000         mov rdx, qword ptr [rbp + 0xf48]
0000000145b895bf  48c1e204               shl rdx, 4
0000000145b895c3  4801ca                 add rdx, rcx
0000000145b895c6  48898dd00e0000         mov qword ptr [rbp + 0xed0], rcx
0000000145b895cd  48898dd80e0000         mov qword ptr [rbp + 0xed8], rcx
0000000145b895d4  488985e00e0000         mov qword ptr [rbp + 0xee0], rax
0000000145b895db  488995e80e0000         mov qword ptr [rbp + 0xee8], rdx
0000000145b895e2  488d7528               lea rsi, [rbp + 0x28]
0000000145b895e6  4889b5f00e0000         mov qword ptr [rbp + 0xef0], rsi
0000000145b895ed  c685870f000000         mov byte ptr [rbp + 0xf87], 0
0000000145b895f4  488d8d300e0000         lea rcx, [rbp + 0xe30]
0000000145b895fb  488d95d00e0000         lea rdx, [rbp + 0xed0]
0000000145b89602  e889370c00             call 0x145c4cd90
0000000145b89607  90                     nop
0000000145b89608  488dbd70030000         lea rdi, [rbp + 0x370]
0000000145b8960f  488b8570030000         mov rax, qword ptr [rbp + 0x370]
0000000145b89616  4885c0                 test rax, rax
0000000145b89619  7416                   je 0x145b89631
0000000145b8961b  488b8d78030000         mov rcx, qword ptr [rbp + 0x378]
0000000145b89622  486bd058               imul rdx, rax, 0x58
0000000145b89626  41b808000000           mov r8d, 8
0000000145b8962c  e89f8b47fa             call 0x1400021d0
0000000145b89631  488b85400e0000         mov rax, qword ptr [rbp + 0xe40]
0000000145b89638  48894710               mov qword ptr [rdi + 0x10], rax
0000000145b8963c  0f1085300e0000         movups xmm0, xmmword ptr [rbp + 0xe30]
0000000145b89643  0f1107                 movups xmmword ptr [rdi], xmm0
0000000145b89646  488bbd78080000         mov rdi, qword ptr [rbp + 0x878]
0000000145b8964d  488d1cbd00000000       lea rbx, [rdi*4]
0000000145b89655  4885ff                 test rdi, rdi
0000000145b89658  0f84df020000           je 0x145b8993d
0000000145b8965e  e89d8b47fa             call 0x140002200
0000000145b89663  ba04000000             mov edx, 4
0000000145b89668  4889d9                 mov rcx, rbx
0000000145b8966b  e8808b47fa             call 0x1400021f0
0000000145b89670  4885c0                 test rax, rax
0000000145b89673  0f84c6030000           je 0x145b89a3f
0000000145b89679  4989c6                 mov r14, rax
0000000145b8967c  488b9590000000         mov rdx, qword ptr [rbp + 0x90]
0000000145b89683  4885d2                 test rdx, rdx
0000000145b89686  7416                   je 0x145b8969e
0000000145b89688  488b8d98000000         mov rcx, qword ptr [rbp + 0x98]
0000000145b8968f  48c1e202               shl rdx, 2
0000000145b89693  41b804000000           mov r8d, 4
0000000145b89699  e8328b47fa             call 0x1400021d0
0000000145b8969e  4889bd90000000         mov qword ptr [rbp + 0x90], rdi
0000000145b896a5  4c89b598000000         mov qword ptr [rbp + 0x98], r14
0000000145b896ac  4889bda0000000         mov qword ptr [rbp + 0xa0], rdi
0000000145b896b3  4885ff                 test rdi, rdi
0000000145b896b6  0f849c020000           je 0x145b89958
0000000145b896bc  e83f8b47fa             call 0x140002200
0000000145b896c1  ba04000000             mov edx, 4
0000000145b896c6  4889d9                 mov rcx, rbx
0000000145b896c9  e8228b47fa             call 0x1400021f0
0000000145b896ce  4885c0                 test rax, rax
0000000145b896d1  0f847f030000           je 0x145b89a56
0000000145b896d7  4989c6                 mov r14, rax
0000000145b896da  488b95a8000000         mov rdx, qword ptr [rbp + 0xa8]
0000000145b896e1  4885d2                 test rdx, rdx
0000000145b896e4  7416                   je 0x145b896fc
0000000145b896e6  488b8db0000000         mov rcx, qword ptr [rbp + 0xb0]
0000000145b896ed  48c1e202               shl rdx, 2
0000000145b896f1  41b804000000           mov r8d, 4
0000000145b896f7  e8d48a47fa             call 0x1400021d0
0000000145b896fc  4889bda8000000         mov qword ptr [rbp + 0xa8], rdi
0000000145b89703  4c89b5b0000000         mov qword ptr [rbp + 0xb0], r14
0000000145b8970a  4889bdb8000000         mov qword ptr [rbp + 0xb8], rdi
0000000145b89711  48c785d00e000000000000 mov qword ptr [rbp + 0xed0], 0
0000000145b8971c  48c785d80e000004000000 mov qword ptr [rbp + 0xed8], 4
0000000145b89727  48c785e00e000000000000 mov qword ptr [rbp + 0xee0], 0
0000000145b89732  c685870f000000         mov byte ptr [rbp + 0xf87], 0
0000000145b89739  488d8d300e0000         lea rcx, [rbp + 0xe30]
0000000145b89740  488d95d00e0000         lea rdx, [rbp + 0xed0]
0000000145b89747  4989f8                 mov r8, rdi
0000000145b8974a  e821bf0a00             call 0x145c35670
0000000145b8974f  90                     nop
0000000145b89750  488bbdd0000000         mov rdi, qword ptr [rbp + 0xd0]
0000000145b89757  4885ff                 test rdi, rdi
0000000145b8975a  743a                   je 0x145b89796
0000000145b8975c  488b9dc8000000         mov rbx, qword ptr [rbp + 0xc8]
0000000145b89763  4883c308               add rbx, 8
0000000145b89767  eb10                   jmp 0x145b89779
0000000145b89769  0f1f8000000000         nop dword ptr [rax]
0000000145b89770  4883c318               add rbx, 0x18
0000000145b89774  48ffcf                 dec rdi
0000000145b89777  741d                   je 0x145b89796
0000000145b89779  488b53f8               mov rdx, qword ptr [rbx - 8]
0000000145b8977d  4885d2                 test rdx, rdx
0000000145b89780  74ee                   je 0x145b89770
0000000145b89782  488b0b                 mov rcx, qword ptr [rbx]
0000000145b89785  48c1e202               shl rdx, 2
0000000145b89789  41b804000000           mov r8d, 4
0000000145b8978f  e83c8a47fa             call 0x1400021d0
0000000145b89794  ebda                   jmp 0x145b89770
0000000145b89796  488dbdc0000000         lea rdi, [rbp + 0xc0]
0000000145b8979d  488b85c0000000         mov rax, qword ptr [rbp + 0xc0]
0000000145b897a4  4885c0                 test rax, rax
0000000145b897a7  741a                   je 0x145b897c3
0000000145b897a9  488b8dc8000000         mov rcx, qword ptr [rbp + 0xc8]
0000000145b897b0  48c1e003               shl rax, 3
0000000145b897b4  488d1440               lea rdx, [rax + rax*2]
0000000145b897b8  41b808000000           mov r8d, 8
0000000145b897be  e80d8a47fa             call 0x1400021d0
0000000145b897c3  488b85400e0000         mov rax, qword ptr [rbp + 0xe40]
0000000145b897ca  48894710               mov qword ptr [rdi + 0x10], rax
0000000145b897ce  0f1085300e0000         movups xmm0, xmmword ptr [rbp + 0xe30]
0000000145b897d5  0f1107                 movups xmmword ptr [rdi], xmm0
0000000145b897d8  488b9570080000         mov rdx, qword ptr [rbp + 0x870]
0000000145b897df  4c8b8578080000         mov r8, qword ptr [rbp + 0x878]
0000000145b897e6  49c1e006               shl r8, 6
0000000145b897ea  4901d0                 add r8, rdx
0000000145b897ed  c685870f000000         mov byte ptr [rbp + 0xf87], 0
0000000145b897f4  488d8dd00e0000         lea rcx, [rbp + 0xed0]
0000000145b897fb  e890470b00             call 0x145c3df90
0000000145b89800  90                     nop
0000000145b89801  488b85d00e0000         mov rax, qword ptr [rbp + 0xed0]
0000000145b89808  488b8dd80e0000         mov rcx, qword ptr [rbp + 0xed8]
0000000145b8980f  488b95e00e0000         mov rdx, qword ptr [rbp + 0xee0]
0000000145b89816  488d1452               lea rdx, [rdx + rdx*2]
0000000145b8981a  488d14d1               lea rdx, [rcx + rdx*8]
0000000145b8981e  48898dd00e0000         mov qword ptr [rbp + 0xed0], rcx
0000000145b89825  48898dd80e0000         mov qword ptr [rbp + 0xed8], rcx
0000000145b8982c  488985e00e0000         mov qword ptr [rbp + 0xee0], rax
0000000145b89833  488995e80e0000         mov qword ptr [rbp + 0xee8], rdx
0000000145b8983a  4889b5f00e0000         mov qword ptr [rbp + 0xef0], rsi
0000000145b89841  c685870f000000         mov byte ptr [rbp + 0xf87], 0
0000000145b89848  488d8d300e0000         lea rcx, [rbp + 0xe30]
0000000145b8984f  488d95d00e0000         lea rdx, [rbp + 0xed0]
0000000145b89856  e8453b0c00             call 0x145c4d3a0
0000000145b8985b  90                     nop
0000000145b8985c  488db5d8000000         lea rsi, [rbp + 0xd8]
0000000145b89863  488b85d8000000         mov rax, qword ptr [rbp + 0xd8]
0000000145b8986a  4885c0                 test rax, rax
0000000145b8986d  741a                   je 0x145b89889
0000000145b8986f  488b8de0000000         mov rcx, qword ptr [rbp + 0xe0]
0000000145b89876  48c1e005               shl rax, 5
0000000145b8987a  488d1440               lea rdx, [rax + rax*2]
0000000145b8987e  41b808000000           mov r8d, 8
0000000145b89884  e8478947fa             call 0x1400021d0
0000000145b89889  488b85400e0000         mov rax, qword ptr [rbp + 0xe40]
0000000145b89890  48894610               mov qword ptr [rsi + 0x10], rax
0000000145b89894  0f1085300e0000         movups xmm0, xmmword ptr [rbp + 0xe30]
0000000145b8989b  0f1106                 movups xmmword ptr [rsi], xmm0
0000000145b8989e  c685870f000000         mov byte ptr [rbp + 0xf87], 0
0000000145b898a5  488d4d28               lea rcx, [rbp + 0x28]
0000000145b898a9  e87245ffff             call 0x145b7de20
0000000145b898ae  90                     nop
0000000145b898af  f30f1085c8040000       movss xmm0, dword ptr [rbp + 0x4c8]
0000000145b898b7  f30f118530050000       movss dword ptr [rbp + 0x530], xmm0
0000000145b898bf  488d5528               lea rdx, [rbp + 0x28]
0000000145b898c3  41b8900c0000           mov r8d, 0xc90
0000000145b898c9  488bb5280e0000         mov rsi, qword ptr [rbp + 0xe28]
0000000145b898d0  4889f1                 mov rcx, rsi
0000000145b898d3  e8d3a14100             call 0x145fa3aab
0000000145b898d8  4889f0                 mov rax, rsi
0000000145b898db  0f28b5900f0000         movaps xmm6, xmmword ptr [rbp + 0xf90]
0000000145b898e2  0f28bda00f0000         movaps xmm7, xmmword ptr [rbp + 0xfa0]
0000000145b898e9  440f2885b00f0000       movaps xmm8, xmmword ptr [rbp + 0xfb0]
0000000145b898f1  440f288dc00f0000       movaps xmm9, xmmword ptr [rbp + 0xfc0]
0000000145b898f9  440f2895d00f0000       movaps xmm10, xmmword ptr [rbp + 0xfd0]
0000000145b89901  440f289de00f0000       movaps xmm11, xmmword ptr [rbp + 0xfe0]
0000000145b89909  440f28a5f00f0000       movaps xmm12, xmmword ptr [rbp + 0xff0]
0000000145b89911  440f28ad00100000       movaps xmm13, xmmword ptr [rbp + 0x1000]
0000000145b89919  440f28b510100000       movaps xmm14, xmmword ptr [rbp + 0x1010]
0000000145b89921  440f28bd20100000       movaps xmm15, xmmword ptr [rbp + 0x1020]
0000000145b89929  4881c4b8100000         add rsp, 0x10b8
0000000145b89930  5b                     pop rbx
0000000145b89931  5f                     pop rdi
0000000145b89932  5e                     pop rsi
0000000145b89933  415c                   pop r12
0000000145b89935  415d                   pop r13
0000000145b89937  415e                   pop r14
0000000145b89939  415f                   pop r15
0000000145b8993b  5d                     pop rbp
0000000145b8993c  c3                     ret
0000000145b8993d  41be04000000           mov r14d, 4
0000000145b89943  488b9590000000         mov rdx, qword ptr [rbp + 0x90]
0000000145b8994a  4885d2                 test rdx, rdx
0000000145b8994d  0f8535fdffff           jne 0x145b89688
0000000145b89953  e946fdffff             jmp 0x145b8969e
0000000145b89958  41be04000000           mov r14d, 4
0000000145b8995e  488b95a8000000         mov rdx, qword ptr [rbp + 0xa8]
0000000145b89965  4885d2                 test rdx, rdx
0000000145b89968  0f8578fdffff           jne 0x145b896e6
0000000145b8996e  e989fdffff             jmp 0x145b896fc
0000000145b89973  4a8b4c0a08             mov rcx, qword ptr [rdx + r9 + 8]
0000000145b89978  4e8b4c0a10             mov r9, qword ptr [rdx + r9 + 0x10]
0000000145b8997d  4885c9                 test rcx, rcx
0000000145b89980  0f84ccfaffff           je 0x145b89452
0000000145b89986  e9cffaffff             jmp 0x145b8945a
0000000145b8998b  c685860f000001         mov byte ptr [rbp + 0xf86], 1
0000000145b89992  c685850f000001         mov byte ptr [rbp + 0xf85], 1
0000000145b89999  b908000000             mov ecx, 8
0000000145b8999e  ba58000000             mov edx, 0x58
0000000145b899a3  e8a9135c00             call 0x14614ad51
0000000145b899a8  90                     nop
0000000145b899a9  e9bd000000             jmp 0x145b89a6b
0000000145b899ae  b908000000             mov ecx, 8
0000000145b899b3  ba10000000             mov edx, 0x10
0000000145b899b8  e894135c00             call 0x14614ad51
0000000145b899bd  90                     nop
0000000145b899be  e9a8000000             jmp 0x145b89a6b
0000000145b899c3  488d85d00e0000         lea rax, [rbp + 0xed0]
0000000145b899ca  48894528               mov qword ptr [rbp + 0x28], rax
0000000145b899ce  488d05eb8647fa         lea rax, [rip - 0x5b87915]
0000000145b899d5  48894530               mov qword ptr [rbp + 0x30], rax
0000000145b899d9  c685860f000001         mov byte ptr [rbp + 0xf86], 1
0000000145b899e0  c685850f000001         mov byte ptr [rbp + 0xf85], 1
0000000145b899e7  488d0d1a1e3f01         lea rcx, [rip + 0x13f1e1a]
0000000145b899ee  4c8d05231e3f01         lea r8, [rip + 0x13f1e23]
0000000145b899f5  488d5528               lea rdx, [rbp + 0x28]
0000000145b899f9  e8e2185c00             call 0x14614b2e0
0000000145b899fe  90                     nop
0000000145b899ff  eb6a                   jmp 0x145b89a6b
0000000145b89a01  488d85d00e0000         lea rax, [rbp + 0xed0]
0000000145b89a08  48894528               mov qword ptr [rbp + 0x28], rax
0000000145b89a0c  488d05ad8647fa         lea rax, [rip - 0x5b87953]
0000000145b89a13  48894530               mov qword ptr [rbp + 0x30], rax
0000000145b89a17  c685860f000001         mov byte ptr [rbp + 0xf86], 1
0000000145b89a1e  c685850f000001         mov byte ptr [rbp + 0xf85], 1
0000000145b89a25  488d0ddc1d3f01         lea rcx, [rip + 0x13f1ddc]
0000000145b89a2c  4c8d05e51d3f01         lea r8, [rip + 0x13f1de5]
0000000145b89a33  488d5528               lea rdx, [rbp + 0x28]
0000000145b89a37  e8a4185c00             call 0x14614b2e0
0000000145b89a3c  90                     nop
0000000145b89a3d  eb2c                   jmp 0x145b89a6b
0000000145b89a3f  c685870f000000         mov byte ptr [rbp + 0xf87], 0
0000000145b89a46  b904000000             mov ecx, 4
0000000145b89a4b  4889da                 mov rdx, rbx
0000000145b89a4e  e818135c00             call 0x14614ad6b
0000000145b89a53  90                     nop
0000000145b89a54  eb15                   jmp 0x145b89a6b
0000000145b89a56  c685870f000000         mov byte ptr [rbp + 0xf87], 0
0000000145b89a5d  b904000000             mov ecx, 4
0000000145b89a62  4889da                 mov rdx, rbx
0000000145b89a65  e801135c00             call 0x14614ad6b
0000000145b89a6a  90                     nop
0000000145b89a6b  0f0b                   ud2
