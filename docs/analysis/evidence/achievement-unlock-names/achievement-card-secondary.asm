00000001402df510  55                     push rbp
00000001402df511  4157                   push r15
00000001402df513  4156                   push r14
00000001402df515  4155                   push r13
00000001402df517  4154                   push r12
00000001402df519  56                     push rsi
00000001402df51a  57                     push rdi
00000001402df51b  53                     push rbx
00000001402df51c  4881ecf8040000         sub rsp, 0x4f8
00000001402df523  488dac2480000000       lea rbp, [rsp + 0x80]
00000001402df52b  440f29bd60040000       movaps xmmword ptr [rbp + 0x460], xmm15
00000001402df533  440f29b550040000       movaps xmmword ptr [rbp + 0x450], xmm14
00000001402df53b  440f29ad40040000       movaps xmmword ptr [rbp + 0x440], xmm13
00000001402df543  440f29a530040000       movaps xmmword ptr [rbp + 0x430], xmm12
00000001402df54b  440f299d20040000       movaps xmmword ptr [rbp + 0x420], xmm11
00000001402df553  440f299510040000       movaps xmmword ptr [rbp + 0x410], xmm10
00000001402df55b  440f298d00040000       movaps xmmword ptr [rbp + 0x400], xmm9
00000001402df563  440f2985f0030000       movaps xmmword ptr [rbp + 0x3f0], xmm8
00000001402df56b  0f29bde0030000         movaps xmmword ptr [rbp + 0x3e0], xmm7
00000001402df572  0f29b5d0030000         movaps xmmword ptr [rbp + 0x3d0], xmm6
00000001402df579  48c785c8030000feffffff mov qword ptr [rbp + 0x3c8], 0xfffffffffffffffe
00000001402df584  4889d7                 mov rdi, rdx
00000001402df587  4c8b31                 mov r14, qword ptr [rcx]
00000001402df58a  488b4128               mov rax, qword ptr [rcx + 0x28]
00000001402df58e  4c89b5a0010000         mov qword ptr [rbp + 0x1a0], r14
00000001402df595  488d9da8010000         lea rbx, [rbp + 0x1a8]
00000001402df59c  0f104108               movups xmm0, xmmword ptr [rcx + 8]
00000001402df5a0  0f1185a8010000         movups xmmword ptr [rbp + 0x1a8], xmm0
00000001402df5a7  48898db8030000         mov qword ptr [rbp + 0x3b8], rcx
00000001402df5ae  0f104118               movups xmm0, xmmword ptr [rcx + 0x18]
00000001402df5b2  0f1185b8010000         movups xmmword ptr [rbp + 0x1b8], xmm0
00000001402df5b9  488985c8010000         mov qword ptr [rbp + 0x1c8], rax
00000001402df5c0  0f10352995ec05         movups xmm6, xmmword ptr [rip + 0x5ec9529]
00000001402df5c7  0f29b550030000         movaps xmmword ptr [rbp + 0x350], xmm6
00000001402df5ce  48c7856003000000000000 mov qword ptr [rbp + 0x360], 0
00000001402df5d9  0f10052895ec05         movups xmm0, xmmword ptr [rip + 0x5ec9528]
00000001402df5e0  0f118568030000         movups xmmword ptr [rbp + 0x368], xmm0
00000001402df5e7  48c7857803000000000000 mov qword ptr [rbp + 0x378], 0
00000001402df5f2  0f103d2795ec05         movups xmm7, xmmword ptr [rip + 0x5ec9527]
00000001402df5f9  0f29bd80030000         movaps xmmword ptr [rbp + 0x380], xmm7
00000001402df600  48c7859003000000000000 mov qword ptr [rbp + 0x390], 0
00000001402df60b  440f10052595ec05       movups xmm8, xmmword ptr [rip + 0x5ec9525]
00000001402df613  440f118598030000       movups xmmword ptr [rbp + 0x398], xmm8
00000001402df61b  48c785a803000000000000 mov qword ptr [rbp + 0x3a8], 0
00000001402df626  0f29b5d0010000         movaps xmmword ptr [rbp + 0x1d0], xmm6
00000001402df62d  488b8560030000         mov rax, qword ptr [rbp + 0x360]
00000001402df634  488985e0010000         mov qword ptr [rbp + 0x1e0], rax
00000001402df63b  488b8568030000         mov rax, qword ptr [rbp + 0x368]
00000001402df642  488985e8010000         mov qword ptr [rbp + 0x1e8], rax
00000001402df649  488b8570030000         mov rax, qword ptr [rbp + 0x370]
00000001402df650  488985f0010000         mov qword ptr [rbp + 0x1f0], rax
00000001402df657  488b8578030000         mov rax, qword ptr [rbp + 0x378]
00000001402df65e  488985f8010000         mov qword ptr [rbp + 0x1f8], rax
00000001402df665  0f29bd00020000         movaps xmmword ptr [rbp + 0x200], xmm7
00000001402df66c  488b8590030000         mov rax, qword ptr [rbp + 0x390]
00000001402df673  48898510020000         mov qword ptr [rbp + 0x210], rax
00000001402df67a  488b8598030000         mov rax, qword ptr [rbp + 0x398]
00000001402df681  48898518020000         mov qword ptr [rbp + 0x218], rax
00000001402df688  0f2885a0030000         movaps xmm0, xmmword ptr [rbp + 0x3a0]
00000001402df68f  0f298520020000         movaps xmmword ptr [rbp + 0x220], xmm0
00000001402df696  450f57c9               xorps xmm9, xmm9
00000001402df69a  440f298d60020000       movaps xmmword ptr [rbp + 0x260], xmm9
00000001402df6a2  440f298d50020000       movaps xmmword ptr [rbp + 0x250], xmm9
00000001402df6aa  440f298d40020000       movaps xmmword ptr [rbp + 0x240], xmm9
00000001402df6b2  440f298d30020000       movaps xmmword ptr [rbp + 0x230], xmm9
00000001402df6ba  440f118dbc000000       movups xmmword ptr [rbp + 0xbc], xmm9
00000001402df6c2  c785cc00000000000000   mov dword ptr [rbp + 0xcc], 0
00000001402df6cc  c7858f01000000000000   mov dword ptr [rbp + 0x18f], 0
00000001402df6d6  c7859201000000000000   mov dword ptr [rbp + 0x192], 0
00000001402df6e0  488d4d18               lea rcx, [rbp + 0x18]
00000001402df6e4  488d95d0010000         lea rdx, [rbp + 0x1d0]
00000001402df6eb  41b8a0000000           mov r8d, 0xa0
00000001402df6f1  e8e54acb05             call 0x145f941db
00000001402df6f6  c785b800000001000000   mov dword ptr [rbp + 0xb8], 1
00000001402df700  440f1015a094ec05       movups xmm10, xmmword ptr [rip + 0x5ec94a0]
00000001402df708  440f1195d0000000       movups xmmword ptr [rbp + 0xd0], xmm10
00000001402df710  440f101da094ec05       movups xmm11, xmmword ptr [rip + 0x5ec94a0]
00000001402df718  440f119de0000000       movups xmmword ptr [rbp + 0xe0], xmm11
00000001402df720  0f1005a194ec05         movups xmm0, xmmword ptr [rip + 0x5ec94a1]
00000001402df727  0f1185f0000000         movups xmmword ptr [rbp + 0xf0], xmm0
00000001402df72e  0f1005a394ec05         movups xmm0, xmmword ptr [rip + 0x5ec94a3]
00000001402df735  0f118500010000         movups xmmword ptr [rbp + 0x100], xmm0
00000001402df73c  440f1025a494ec05       movups xmm12, xmmword ptr [rip + 0x5ec94a4]
00000001402df744  440f11a510010000       movups xmmword ptr [rbp + 0x110], xmm12
00000001402df74c  440f1035a494ec05       movups xmm14, xmmword ptr [rip + 0x5ec94a4]
00000001402df754  440f11b520010000       movups xmmword ptr [rbp + 0x120], xmm14
00000001402df75c  440f102da494ec05       movups xmm13, xmmword ptr [rip + 0x5ec94a4]
00000001402df764  440f11ad30010000       movups xmmword ptr [rbp + 0x130], xmm13
00000001402df76c  440f103da494ec05       movups xmm15, xmmword ptr [rip + 0x5ec94a4]
00000001402df774  440f11bd40010000       movups xmmword ptr [rbp + 0x140], xmm15
00000001402df77c  0f2805bd43e805         movaps xmm0, xmmword ptr [rip + 0x5e843bd]
00000001402df783  0f118550010000         movups xmmword ptr [rbp + 0x150], xmm0
00000001402df78a  c7856001000001000000   mov dword ptr [rbp + 0x160], 1
00000001402df794  48c7856401000000000000 mov qword ptr [rbp + 0x164], 0
00000001402df79f  c6856c01000001         mov byte ptr [rbp + 0x16c], 1
00000001402df7a6  f20f100582ace905       movsd xmm0, qword ptr [rip + 0x5e9ac82]
00000001402df7ae  f20f118570010000       movsd qword ptr [rbp + 0x170], xmm0
00000001402df7b6  c785780100000000803f   mov dword ptr [rbp + 0x178], 0x3f800000
00000001402df7c0  66c7857c0100000003     mov word ptr [rbp + 0x17c], 0x300
00000001402df7c9  66c785820100000000     mov word ptr [rbp + 0x182], 0
00000001402df7d2  c7857e01000000000100   mov dword ptr [rbp + 0x17e], 0x10000
00000001402df7dc  c7858401000000000100   mov dword ptr [rbp + 0x184], 0x10000
00000001402df7e6  66c785880100000000     mov word ptr [rbp + 0x188], 0
00000001402df7ef  c7858a01000000000000   mov dword ptr [rbp + 0x18a], 0
00000001402df7f9  c6858e01000001         mov byte ptr [rbp + 0x18e], 1
00000001402df800  48c7859801000000000000 mov qword ptr [rbp + 0x198], 0
00000001402df80b  4c897510               mov qword ptr [rbp + 0x10], r14
00000001402df80f  488d4de0               lea rcx, [rbp - 0x20]
00000001402df813  4c8d4510               lea r8, [rbp + 0x10]
00000001402df817  4889da                 mov rdx, rbx
00000001402df81a  e851f8fdff             call 0x1402bf070
00000001402df81f  4c8b2f                 mov r13, qword ptr [rdi]
00000001402df822  488b5f08               mov rbx, qword ptr [rdi + 8]
00000001402df826  4c8b7710               mov r14, qword ptr [rdi + 0x10]
00000001402df82a  4c8b7f18               mov r15, qword ptr [rdi + 0x18]
00000001402df82e  488b75e0               mov rsi, qword ptr [rbp - 0x20]
00000001402df832  488b4508               mov rax, qword ptr [rbp + 8]
00000001402df836  488975b0               mov qword ptr [rbp - 0x50], rsi
00000001402df83a  4c8d65b8               lea r12, [rbp - 0x48]
00000001402df83e  0f1045e8               movups xmm0, xmmword ptr [rbp - 0x18]
00000001402df842  0f1145b8               movups xmmword ptr [rbp - 0x48], xmm0
00000001402df846  0f1045f8               movups xmm0, xmmword ptr [rbp - 8]
00000001402df84a  0f1145c8               movups xmmword ptr [rbp - 0x38], xmm0
00000001402df84e  488945d8               mov qword ptr [rbp - 0x28], rax
00000001402df852  488d8de8010000         lea rcx, [rbp + 0x1e8]
00000001402df859  c7452800000200         mov dword ptr [rbp + 0x28], 0x20000
00000001402df860  0f280589e4ea05         movaps xmm0, xmmword ptr [rip + 0x5eae489]
00000001402df867  0f114510               movups xmmword ptr [rbp + 0x10], xmm0
00000001402df86b  48c7452001000000       mov qword ptr [rbp + 0x20], 1
00000001402df873  488d5510               lea rdx, [rbp + 0x10]
00000001402df877  e804456002             call 0x1428e3d80
00000001402df87c  66c785340300000000     mov word ptr [rbp + 0x334], 0
00000001402df885  c6852403000001         mov byte ptr [rbp + 0x324], 1
00000001402df88c  440f298d30020000       movaps xmmword ptr [rbp + 0x230], xmm9
00000001402df894  440f298d40020000       movaps xmmword ptr [rbp + 0x240], xmm9
00000001402df89c  440f298d50020000       movaps xmmword ptr [rbp + 0x250], xmm9
00000001402df8a4  440f298d60020000       movaps xmmword ptr [rbp + 0x260], xmm9
00000001402df8ac  440f298d70020000       movaps xmmword ptr [rbp + 0x270], xmm9
00000001402df8b4  48c7858002000000000000 mov qword ptr [rbp + 0x280], 0
00000001402df8bf  c7854803000000000000   mov dword ptr [rbp + 0x348], 0
00000001402df8c9  66c7854c0300000000     mov word ptr [rbp + 0x34c], 0
00000001402df8d2  440f119588020000       movups xmmword ptr [rbp + 0x288], xmm10
00000001402df8da  440f119d98020000       movups xmmword ptr [rbp + 0x298], xmm11
00000001402df8e2  0f280537ace905         movaps xmm0, xmmword ptr [rip + 0x5e9ac37]
00000001402df8e9  0f1185a8020000         movups xmmword ptr [rbp + 0x2a8], xmm0
00000001402df8f0  0f28051945e805         movaps xmm0, xmmword ptr [rip + 0x5e84519]
00000001402df8f7  0f1185b8020000         movups xmmword ptr [rbp + 0x2b8], xmm0
00000001402df8fe  440f11b5d8020000       movups xmmword ptr [rbp + 0x2d8], xmm14
00000001402df906  440f11a5c8020000       movups xmmword ptr [rbp + 0x2c8], xmm12
00000001402df90e  440f11bdf8020000       movups xmmword ptr [rbp + 0x2f8], xmm15
00000001402df916  440f11ade8020000       movups xmmword ptr [rbp + 0x2e8], xmm13
00000001402df91e  66c785460300000000     mov word ptr [rbp + 0x346], 0
00000001402df927  c7854203000000000001   mov dword ptr [rbp + 0x342], 0x1000000
00000001402df931  48c7852803000000000000 mov qword ptr [rbp + 0x328], 0
00000001402df93c  c785300300000000803f   mov dword ptr [rbp + 0x330], 0x3f800000
00000001402df946  0f280513ade905         movaps xmm0, xmmword ptr [rip + 0x5e9ad13]
00000001402df94d  0f118508030000         movups xmmword ptr [rbp + 0x308], xmm0
00000001402df954  c7851803000001000000   mov dword ptr [rbp + 0x318], 1
00000001402df95e  f30f10052a48e805       movss xmm0, dword ptr [rip + 0x5e8482a]
00000001402df966  0f13851c030000         movlps qword ptr [rbp + 0x31c], xmm0
00000001402df96d  0f29b5d0010000         movaps xmmword ptr [rbp + 0x1d0], xmm6
00000001402df974  48c785e001000000000000 mov qword ptr [rbp + 0x1e0], 0
00000001402df97f  0f29bd00020000         movaps xmmword ptr [rbp + 0x200], xmm7
00000001402df986  48c7851002000000000000 mov qword ptr [rbp + 0x210], 0
00000001402df991  440f118518020000       movups xmmword ptr [rbp + 0x218], xmm8
00000001402df999  48c7852802000000000000 mov qword ptr [rbp + 0x228], 0
00000001402df9a4  66c7853a0300000000     mov word ptr [rbp + 0x33a], 0
00000001402df9ad  c7853603000000000100   mov dword ptr [rbp + 0x336], 0x10000
00000001402df9b7  66c785400300000000     mov word ptr [rbp + 0x340], 0
00000001402df9c0  c7853c03000000000100   mov dword ptr [rbp + 0x33c], 0x10000
00000001402df9ca  488d4d18               lea rcx, [rbp + 0x18]
00000001402df9ce  488d95d0010000         lea rdx, [rbp + 0x1d0]
00000001402df9d5  41b880010000           mov r8d, 0x180
00000001402df9db  e8fb47cb05             call 0x145f941db
00000001402df9e0  4889b5c0030000         mov qword ptr [rbp + 0x3c0], rsi
00000001402df9e7  48897510               mov qword ptr [rbp + 0x10], rsi
00000001402df9eb  488d8d50030000         lea rcx, [rbp + 0x350]
00000001402df9f2  4c8d4510               lea r8, [rbp + 0x10]
00000001402df9f6  4c89e2                 mov rdx, r12
00000001402df9f9  e87296fdff             call 0x1402b9070
00000001402df9fe  90                     nop
00000001402df9ff  488b8550030000         mov rax, qword ptr [rbp + 0x350]
00000001402dfa06  488b8d78030000         mov rcx, qword ptr [rbp + 0x378]
00000001402dfa0d  48894510               mov qword ptr [rbp + 0x10], rax
00000001402dfa11  0f108558030000         movups xmm0, xmmword ptr [rbp + 0x358]
00000001402dfa18  0f114518               movups xmmword ptr [rbp + 0x18], xmm0
00000001402dfa1c  0f108568030000         movups xmm0, xmmword ptr [rbp + 0x368]
00000001402dfa23  0f114528               movups xmmword ptr [rbp + 0x28], xmm0
00000001402dfa27  48894d38               mov qword ptr [rbp + 0x38], rcx
00000001402dfa2b  458a6d00               mov r13b, byte ptr [r13]
00000001402dfa2f  e8ec958505             call 0x145b39020
00000001402dfa34  90                     nop
00000001402dfa35  4885d2                 test rdx, rdx
00000001402dfa38  7447                   je 0x1402dfa81
00000001402dfa3a  4869f298000000         imul rsi, rdx, 0x98
00000001402dfa41  4801c6                 add rsi, rax
00000001402dfa44  4c8d6510               lea r12, [rbp + 0x10]
00000001402dfa48  eb0e                   jmp 0x1402dfa58
00000001402dfa4a  660f1f440000           nop word ptr [rax + rax]
00000001402dfa50  4889f8                 mov rax, rdi
00000001402dfa53  4839f7                 cmp rdi, rsi
00000001402dfa56  7429                   je 0x1402dfa81
00000001402dfa58  488db898000000         lea rdi, [rax + 0x98]
00000001402dfa5f  4438a894000000         cmp byte ptr [rax + 0x94], r13b
00000001402dfa66  75e8                   jne 0x1402dfa50
00000001402dfa68  4889442420             mov qword ptr [rsp + 0x20], rax
00000001402dfa6d  4c89e1                 mov rcx, r12
00000001402dfa70  4889da                 mov rdx, rbx
00000001402dfa73  4d89f0                 mov r8, r14
00000001402dfa76  4d89f9                 mov r9, r15
00000001402dfa79  e8f250f8ff             call 0x140264b70
00000001402dfa7e  90                     nop
00000001402dfa7f  ebcf                   jmp 0x1402dfa50
00000001402dfa81  488d8da0010000         lea rcx, [rbp + 0x1a0]
00000001402dfa88  488b95c0030000         mov rdx, qword ptr [rbp + 0x3c0]
00000001402dfa8f  e80c35f9ff             call 0x140272fa0
00000001402dfa94  488b85b8030000         mov rax, qword ptr [rbp + 0x3b8]
00000001402dfa9b  0f28b5d0030000         movaps xmm6, xmmword ptr [rbp + 0x3d0]
00000001402dfaa2  0f28bde0030000         movaps xmm7, xmmword ptr [rbp + 0x3e0]
00000001402dfaa9  440f2885f0030000       movaps xmm8, xmmword ptr [rbp + 0x3f0]
00000001402dfab1  440f288d00040000       movaps xmm9, xmmword ptr [rbp + 0x400]
00000001402dfab9  440f289510040000       movaps xmm10, xmmword ptr [rbp + 0x410]
00000001402dfac1  440f289d20040000       movaps xmm11, xmmword ptr [rbp + 0x420]
00000001402dfac9  440f28a530040000       movaps xmm12, xmmword ptr [rbp + 0x430]
00000001402dfad1  440f28ad40040000       movaps xmm13, xmmword ptr [rbp + 0x440]
00000001402dfad9  440f28b550040000       movaps xmm14, xmmword ptr [rbp + 0x450]
00000001402dfae1  440f28bd60040000       movaps xmm15, xmmword ptr [rbp + 0x460]
00000001402dfae9  4881c4f8040000         add rsp, 0x4f8
00000001402dfaf0  5b                     pop rbx
00000001402dfaf1  5f                     pop rdi
00000001402dfaf2  5e                     pop rsi
00000001402dfaf3  415c                   pop r12
00000001402dfaf5  415d                   pop r13
00000001402dfaf7  415e                   pop r14
00000001402dfaf9  415f                   pop r15
00000001402dfafb  5d                     pop rbp
00000001402dfafc  c3                     ret
