0000000140269940  55                     push rbp
0000000140269941  4157                   push r15
0000000140269943  4156                   push r14
0000000140269945  4155                   push r13
0000000140269947  4154                   push r12
0000000140269949  56                     push rsi
000000014026994a  57                     push rdi
000000014026994b  53                     push rbx
000000014026994c  4881ec78040000         sub rsp, 0x478
0000000140269953  488dac2480000000       lea rbp, [rsp + 0x80]
000000014026995b  440f29bde0030000       movaps xmmword ptr [rbp + 0x3e0], xmm15
0000000140269963  440f29b5d0030000       movaps xmmword ptr [rbp + 0x3d0], xmm14
000000014026996b  440f29adc0030000       movaps xmmword ptr [rbp + 0x3c0], xmm13
0000000140269973  440f29a5b0030000       movaps xmmword ptr [rbp + 0x3b0], xmm12
000000014026997b  440f299da0030000       movaps xmmword ptr [rbp + 0x3a0], xmm11
0000000140269983  440f299590030000       movaps xmmword ptr [rbp + 0x390], xmm10
000000014026998b  440f298d80030000       movaps xmmword ptr [rbp + 0x380], xmm9
0000000140269993  440f298570030000       movaps xmmword ptr [rbp + 0x370], xmm8
000000014026999b  0f29bd60030000         movaps xmmword ptr [rbp + 0x360], xmm7
00000001402699a2  0f29b550030000         movaps xmmword ptr [rbp + 0x350], xmm6
00000001402699a9  48c78548030000feffffff mov qword ptr [rbp + 0x348], 0xfffffffffffffffe
00000001402699b4  4c898d40030000         mov qword ptr [rbp + 0x340], r9
00000001402699bb  4c894500               mov qword ptr [rbp], r8
00000001402699bf  48895508               mov qword ptr [rbp + 8], rdx
00000001402699c3  48894df8               mov qword ptr [rbp - 8], rcx
00000001402699c7  0fb6bd60040000         movzx edi, byte ptr [rbp + 0x460]
00000001402699ce  e84df68c05             call 0x145b39020
00000001402699d3  4885d2                 test rdx, rdx
00000001402699d6  7474                   je 0x140269a4c
00000001402699d8  4989c4                 mov r12, rax
00000001402699db  4989d5                 mov r13, rdx
00000001402699de  4981c494000000         add r12, 0x94
00000001402699e5  4531f6                 xor r14d, r14d
00000001402699e8  4531ff                 xor r15d, r15d
00000001402699eb  31f6                   xor esi, esi
00000001402699ed  31db                   xor ebx, ebx
00000001402699ef  eb1b                   jmp 0x140269a0c
00000001402699f1  6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000140269a00  4981c498000000         add r12, 0x98
0000000140269a07  49ffcd                 dec r13
0000000140269a0a  744a                   je 0x140269a56
0000000140269a0c  41383c24               cmp byte ptr [r12], dil
0000000140269a10  75ee                   jne 0x140269a00
0000000140269a12  498b942474ffffff       mov rdx, qword ptr [r12 - 0x8c]
0000000140269a1a  4d8b84247cffffff       mov r8, qword ptr [r12 - 0x84]
0000000140269a22  488b8d40030000         mov rcx, qword ptr [rbp + 0x340]
0000000140269a29  e8525a8605             call 0x145acf480
0000000140269a2e  418b4c24fc             mov ecx, dword ptr [r12 - 4]
0000000140269a33  84c0                   test al, al
0000000140269a35  ba00000000             mov edx, 0
0000000140269a3a  0f45d1                 cmovne edx, ecx
0000000140269a3d  49ffc6                 inc r14
0000000140269a40  0fb6c0                 movzx eax, al
0000000140269a43  4901c7                 add r15, rax
0000000140269a46  01d6                   add esi, edx
0000000140269a48  01cb                   add ebx, ecx
0000000140269a4a  ebb4                   jmp 0x140269a00
0000000140269a4c  4531ff                 xor r15d, r15d
0000000140269a4f  4531f6                 xor r14d, r14d
0000000140269a52  31f6                   xor esi, esi
0000000140269a54  31db                   xor ebx, ebx
0000000140269a56  4c897df0               mov qword ptr [rbp - 0x10], r15
0000000140269a5a  4c8975e8               mov qword ptr [rbp - 0x18], r14
0000000140269a5e  89b53c030000           mov dword ptr [rbp + 0x33c], esi
0000000140269a64  899d38030000           mov dword ptr [rbp + 0x338], ebx
0000000140269a6a  89f9                   mov ecx, edi
0000000140269a6c  e85f3c8c05             call 0x145b2d6d0
0000000140269a71  488945d8               mov qword ptr [rbp - 0x28], rax
0000000140269a75  488955e0               mov qword ptr [rbp - 0x20], rdx
0000000140269a79  0f57f6                 xorps xmm6, xmm6
0000000140269a7c  0f11b510020000         movups xmmword ptr [rbp + 0x210], xmm6
0000000140269a83  0f11b500020000         movups xmmword ptr [rbp + 0x200], xmm6
0000000140269a8a  0f11b528020000         movups xmmword ptr [rbp + 0x228], xmm6
0000000140269a91  0f11b538020000         movups xmmword ptr [rbp + 0x238], xmm6
0000000140269a98  48c7854802000000000000 mov qword ptr [rbp + 0x248], 0
0000000140269aa3  0f1005660af305         movups xmm0, xmmword ptr [rip + 0x5f30a66]
0000000140269aaa  0f294510               movaps xmmword ptr [rbp + 0x10], xmm0
0000000140269aae  488b056b0af305         mov rax, qword ptr [rip + 0x5f30a6b]
0000000140269ab5  48894520               mov qword ptr [rbp + 0x20], rax
0000000140269ab9  0f1005680af305         movups xmm0, xmmword ptr [rip + 0x5f30a68]
0000000140269ac0  0f114528               movups xmmword ptr [rbp + 0x28], xmm0
0000000140269ac4  488b056d0af305         mov rax, qword ptr [rip + 0x5f30a6d]
0000000140269acb  48894538               mov qword ptr [rbp + 0x38], rax
0000000140269acf  0f10056a0af305         movups xmm0, xmmword ptr [rip + 0x5f30a6a]
0000000140269ad6  0f294540               movaps xmmword ptr [rbp + 0x40], xmm0
0000000140269ada  488b056f0af305         mov rax, qword ptr [rip + 0x5f30a6f]
0000000140269ae1  48894550               mov qword ptr [rbp + 0x50], rax
0000000140269ae5  488b057c0af305         mov rax, qword ptr [rip + 0x5f30a7c]
0000000140269aec  48894568               mov qword ptr [rbp + 0x68], rax
0000000140269af0  0f1005610af305         movups xmm0, xmmword ptr [rip + 0x5f30a61]
0000000140269af7  0f114558               movups xmmword ptr [rbp + 0x58], xmm0
0000000140269afb  4c8b75f8               mov r14, qword ptr [rbp - 8]
0000000140269aff  498b06                 mov rax, qword ptr [r14]
0000000140269b02  498d7e08               lea rdi, [r14 + 8]
0000000140269b06  488b4d60               mov rcx, qword ptr [rbp + 0x60]
0000000140269b0a  48898de8010000         mov qword ptr [rbp + 0x1e8], rcx
0000000140269b11  488b4d68               mov rcx, qword ptr [rbp + 0x68]
0000000140269b15  48898df0010000         mov qword ptr [rbp + 0x1f0], rcx
0000000140269b1c  488b4d50               mov rcx, qword ptr [rbp + 0x50]
0000000140269b20  48898dd8010000         mov qword ptr [rbp + 0x1d8], rcx
0000000140269b27  488b4d58               mov rcx, qword ptr [rbp + 0x58]
0000000140269b2b  48898de0010000         mov qword ptr [rbp + 0x1e0], rcx
0000000140269b32  0f284510               movaps xmm0, xmmword ptr [rbp + 0x10]
0000000140269b36  0f284d20               movaps xmm1, xmmword ptr [rbp + 0x20]
0000000140269b3a  0f285530               movaps xmm2, xmmword ptr [rbp + 0x30]
0000000140269b3e  0f285d40               movaps xmm3, xmmword ptr [rbp + 0x40]
0000000140269b42  0f119dc8010000         movups xmmword ptr [rbp + 0x1c8], xmm3
0000000140269b49  0f1195b8010000         movups xmmword ptr [rbp + 0x1b8], xmm2
0000000140269b50  0f118da8010000         movups xmmword ptr [rbp + 0x1a8], xmm1
0000000140269b57  0f118598010000         movups xmmword ptr [rbp + 0x198], xmm0
0000000140269b5e  48c785f801000000000000 mov qword ptr [rbp + 0x1f8], 0
0000000140269b69  48b9020000000000c842   movabs rcx, 0x42c8000000000002
0000000140269b73  48898d20020000         mov qword ptr [rbp + 0x220], rcx
0000000140269b7a  0f1005470af305         movups xmm0, xmmword ptr [rip + 0x5f30a47]
0000000140269b81  0f118550020000         movups xmmword ptr [rbp + 0x250], xmm0
0000000140269b88  0f1005490af305         movups xmm0, xmmword ptr [rip + 0x5f30a49]
0000000140269b8f  0f118560020000         movups xmmword ptr [rbp + 0x260], xmm0
0000000140269b96  0f10055b0af305         movups xmm0, xmmword ptr [rip + 0x5f30a5b]
0000000140269b9d  0f118580020000         movups xmmword ptr [rbp + 0x280], xmm0
0000000140269ba4  0f10053d0af305         movups xmm0, xmmword ptr [rip + 0x5f30a3d]
0000000140269bab  0f118570020000         movups xmmword ptr [rbp + 0x270], xmm0
0000000140269bb2  0f10055f0af305         movups xmm0, xmmword ptr [rip + 0x5f30a5f]
0000000140269bb9  0f1185a0020000         movups xmmword ptr [rbp + 0x2a0], xmm0
0000000140269bc0  0f1005410af305         movups xmm0, xmmword ptr [rip + 0x5f30a41]
0000000140269bc7  0f118590020000         movups xmmword ptr [rbp + 0x290], xmm0
0000000140269bce  0f1005630af305         movups xmm0, xmmword ptr [rip + 0x5f30a63]
0000000140269bd5  0f1185c0020000         movups xmmword ptr [rbp + 0x2c0], xmm0
0000000140269bdc  0f1005450af305         movups xmm0, xmmword ptr [rip + 0x5f30a45]
0000000140269be3  0f1185b0020000         movups xmmword ptr [rbp + 0x2b0], xmm0
0000000140269bea  440f281d4e9fef05       movaps xmm11, xmmword ptr [rip + 0x5ef9f4e]
0000000140269bf2  440f119dd0020000       movups xmmword ptr [rbp + 0x2d0], xmm11
0000000140269bfa  c785e002000001000000   mov dword ptr [rbp + 0x2e0], 1
0000000140269c04  f30f10058c9fef05       movss xmm0, dword ptr [rip + 0x5ef9f8c]
0000000140269c0c  0f1385e4020000         movlps qword ptr [rbp + 0x2e4], xmm0
0000000140269c13  c685ec02000001         mov byte ptr [rbp + 0x2ec], 1
0000000140269c1a  48c785f002000000000000 mov qword ptr [rbp + 0x2f0], 0
0000000140269c25  c785f80200000000803f   mov dword ptr [rbp + 0x2f8], 0x3f800000
0000000140269c2f  66c785fc0200000000     mov word ptr [rbp + 0x2fc], 0
0000000140269c38  0fb70d3b0af305         movzx ecx, word ptr [rip + 0x5f30a3b]
0000000140269c3f  66898d02030000         mov word ptr [rbp + 0x302], cx
0000000140269c46  8b0d2a0af305           mov ecx, dword ptr [rip + 0x5f30a2a]
0000000140269c4c  898dfe020000           mov dword ptr [rbp + 0x2fe], ecx
0000000140269c52  0fb70d270af305         movzx ecx, word ptr [rip + 0x5f30a27]
0000000140269c59  66898d08030000         mov word ptr [rbp + 0x308], cx
0000000140269c60  8b0d160af305           mov ecx, dword ptr [rip + 0x5f30a16]
0000000140269c66  898d04030000           mov dword ptr [rbp + 0x304], ecx
0000000140269c6c  48c7850a03000000000000 mov qword ptr [rbp + 0x30a], 0
0000000140269c77  c7851203000005000000   mov dword ptr [rbp + 0x312], 5
0000000140269c81  48898590010000         mov qword ptr [rbp + 0x190], rax
0000000140269c88  4c8d2581aaef05         lea r12, [rip + 0x5efaa81]
0000000140269c8f  4c8d6da0               lea r13, [rbp - 0x60]
0000000140269c93  4c8d8590010000         lea r8, [rbp + 0x190]
0000000140269c9a  4c89e9                 mov rcx, r13
0000000140269c9d  4889fa                 mov rdx, rdi
0000000140269ca0  4d89e1                 mov r9, r12
0000000140269ca3  e8c8f30400             call 0x1402b9070
0000000140269ca8  4c8d45d8               lea r8, [rbp - 0x28]
0000000140269cac  4c89e9                 mov rcx, r13
0000000140269caf  488b5d08               mov rbx, qword ptr [rbp + 8]
0000000140269cb3  4889da                 mov rdx, rbx
0000000140269cb6  e865610a00             call 0x14030fe20
0000000140269cbb  0f29b5b0000000         movaps xmmword ptr [rbp + 0xb0], xmm6
0000000140269cc2  0f29b5a0000000         movaps xmmword ptr [rbp + 0xa0], xmm6
0000000140269cc9  0f29b590000000         movaps xmmword ptr [rbp + 0x90], xmm6
0000000140269cd0  0f29b580000000         movaps xmmword ptr [rbp + 0x80], xmm6
0000000140269cd7  0f297570               movaps xmmword ptr [rbp + 0x70], xmm6
0000000140269cdb  48c785c000000000000000 mov qword ptr [rbp + 0xc0], 0
0000000140269ce6  440f1035a238f305       movups xmm14, xmmword ptr [rip + 0x5f338a2]
0000000140269cee  440f11b5c8000000       movups xmmword ptr [rbp + 0xc8], xmm14
0000000140269cf6  440f103da238f305       movups xmm15, xmmword ptr [rip + 0x5f338a2]
0000000140269cfe  440f11bdd8000000       movups xmmword ptr [rbp + 0xd8], xmm15
0000000140269d06  0f1005a338f305         movups xmm0, xmmword ptr [rip + 0x5f338a3]
0000000140269d0d  0f1185e8000000         movups xmmword ptr [rbp + 0xe8], xmm0
0000000140269d14  440f100da438f305       movups xmm9, xmmword ptr [rip + 0x5f338a4]
0000000140269d1c  440f118df8000000       movups xmmword ptr [rbp + 0xf8], xmm9
0000000140269d24  0f1005a538f305         movups xmm0, xmmword ptr [rip + 0x5f338a5]
0000000140269d2b  0f118508010000         movups xmmword ptr [rbp + 0x108], xmm0
0000000140269d32  440f1015a638f305       movups xmm10, xmmword ptr [rip + 0x5f338a6]
0000000140269d3a  440f119518010000       movups xmmword ptr [rbp + 0x118], xmm10
0000000140269d42  0f1005b738f305         movups xmm0, xmmword ptr [rip + 0x5f338b7]
0000000140269d49  0f118538010000         movups xmmword ptr [rbp + 0x138], xmm0
0000000140269d50  0f10059938f305         movups xmm0, xmmword ptr [rip + 0x5f33899]
0000000140269d57  0f118528010000         movups xmmword ptr [rbp + 0x128], xmm0
0000000140269d5e  440f10257237f305       movups xmm12, xmmword ptr [rip + 0x5f33772]
0000000140269d66  440f296510             movaps xmmword ptr [rbp + 0x10], xmm12
0000000140269d6b  48c7452000000000       mov qword ptr [rbp + 0x20], 0
0000000140269d73  440f102d7537f305       movups xmm13, xmmword ptr [rip + 0x5f33775]
0000000140269d7b  440f116d28             movups xmmword ptr [rbp + 0x28], xmm13
0000000140269d80  48c7453800000000       mov qword ptr [rbp + 0x38], 0
0000000140269d88  0f103d7937f305         movups xmm7, xmmword ptr [rip + 0x5f33779]
0000000140269d8f  0f297d40               movaps xmmword ptr [rbp + 0x40], xmm7
0000000140269d93  48c7455000000000       mov qword ptr [rbp + 0x50], 0
0000000140269d9b  440f10057d37f305       movups xmm8, xmmword ptr [rip + 0x5f3377d]
0000000140269da3  440f114558             movups xmmword ptr [rbp + 0x58], xmm8
0000000140269da8  48c7456800000000       mov qword ptr [rbp + 0x68], 0
0000000140269db0  498b36                 mov rsi, qword ptr [r14]
0000000140269db3  488d8d98010000         lea rcx, [rbp + 0x198]
0000000140269dba  488d5510               lea rdx, [rbp + 0x10]
0000000140269dbe  41b838010000           mov r8d, 0x138
0000000140269dc4  e812a4d205             call 0x145f941db
0000000140269dc9  440f119dd0020000       movups xmmword ptr [rbp + 0x2d0], xmm11
0000000140269dd1  c785e002000001000000   mov dword ptr [rbp + 0x2e0], 1
0000000140269ddb  f30f10050105f105       movss xmm0, dword ptr [rip + 0x5f10501]
0000000140269de3  0f1385e4020000         movlps qword ptr [rbp + 0x2e4], xmm0
0000000140269dea  c685ec02000001         mov byte ptr [rbp + 0x2ec], 1
0000000140269df1  48c785f002000000000000 mov qword ptr [rbp + 0x2f0], 0
0000000140269dfc  c785f80200000000803f   mov dword ptr [rbp + 0x2f8], 0x3f800000
0000000140269e06  66c785fc0200000000     mov word ptr [rbp + 0x2fc], 0
0000000140269e0f  c785fe02000000000100   mov dword ptr [rbp + 0x2fe], 0x10000
0000000140269e19  66c785020300000000     mov word ptr [rbp + 0x302], 0
0000000140269e22  c7850403000000000100   mov dword ptr [rbp + 0x304], 0x10000
0000000140269e2c  66c785080300000000     mov word ptr [rbp + 0x308], 0
0000000140269e35  48c7850a03000000000000 mov qword ptr [rbp + 0x30a], 0
0000000140269e40  c7851203000005000000   mov dword ptr [rbp + 0x312], 5
0000000140269e4a  4889b590010000         mov qword ptr [rbp + 0x190], rsi
0000000140269e51  4c8d8590010000         lea r8, [rbp + 0x190]
0000000140269e58  4c89e9                 mov rcx, r13
0000000140269e5b  4889fa                 mov rdx, rdi
0000000140269e5e  4d89e1                 mov r9, r12
0000000140269e61  e80af20400             call 0x1402b9070
0000000140269e66  48899d90010000         mov qword ptr [rbp + 0x190], rbx
0000000140269e6d  488d45f0               lea rax, [rbp - 0x10]
0000000140269e71  48898598010000         mov qword ptr [rbp + 0x198], rax
0000000140269e78  488d45e8               lea rax, [rbp - 0x18]
0000000140269e7c  488985a0010000         mov qword ptr [rbp + 0x1a0], rax
0000000140269e83  488d853c030000         lea rax, [rbp + 0x33c]
0000000140269e8a  488985a8010000         mov qword ptr [rbp + 0x1a8], rax
0000000140269e91  488d8538030000         lea rax, [rbp + 0x338]
0000000140269e98  488985b0010000         mov qword ptr [rbp + 0x1b0], rax
0000000140269e9f  488b7500               mov rsi, qword ptr [rbp]
0000000140269ea3  4889b5b8010000         mov qword ptr [rbp + 0x1b8], rsi
0000000140269eaa  488d9590010000         lea rdx, [rbp + 0x190]
0000000140269eb1  4c89e9                 mov rcx, r13
0000000140269eb4  e817510700             call 0x1402defd0
0000000140269eb9  0f11b520020000         movups xmmword ptr [rbp + 0x220], xmm6
0000000140269ec0  0f11b510020000         movups xmmword ptr [rbp + 0x210], xmm6
0000000140269ec7  0f11b500020000         movups xmmword ptr [rbp + 0x200], xmm6
0000000140269ece  48c7853002000000000000 mov qword ptr [rbp + 0x230], 0
0000000140269ed9  0f11b53c020000         movups xmmword ptr [rbp + 0x23c], xmm6
0000000140269ee0  c7854c02000000000000   mov dword ptr [rbp + 0x24c], 0
0000000140269eea  c7851003000000000000   mov dword ptr [rbp + 0x310], 0
0000000140269ef4  66c785140300000000     mov word ptr [rbp + 0x314], 0
0000000140269efd  440f296510             movaps xmmword ptr [rbp + 0x10], xmm12
0000000140269f02  48c7452000000000       mov qword ptr [rbp + 0x20], 0
0000000140269f0a  440f116d28             movups xmmword ptr [rbp + 0x28], xmm13
0000000140269f0f  48c7453800000000       mov qword ptr [rbp + 0x38], 0
0000000140269f17  0f297d40               movaps xmmword ptr [rbp + 0x40], xmm7
0000000140269f1b  48c7455000000000       mov qword ptr [rbp + 0x50], 0
0000000140269f23  440f114558             movups xmmword ptr [rbp + 0x58], xmm8
0000000140269f28  48c7456800000000       mov qword ptr [rbp + 0x68], 0
0000000140269f30  0f284540               movaps xmm0, xmmword ptr [rbp + 0x40]
0000000140269f34  0f1185c8010000         movups xmmword ptr [rbp + 0x1c8], xmm0
0000000140269f3b  0f284530               movaps xmm0, xmmword ptr [rbp + 0x30]
0000000140269f3f  0f1185b8010000         movups xmmword ptr [rbp + 0x1b8], xmm0
0000000140269f46  0f284520               movaps xmm0, xmmword ptr [rbp + 0x20]
0000000140269f4a  0f1185a8010000         movups xmmword ptr [rbp + 0x1a8], xmm0
0000000140269f51  0f284510               movaps xmm0, xmmword ptr [rbp + 0x10]
0000000140269f55  0f118598010000         movups xmmword ptr [rbp + 0x198], xmm0
0000000140269f5c  488b4560               mov rax, qword ptr [rbp + 0x60]
0000000140269f60  488985e8010000         mov qword ptr [rbp + 0x1e8], rax
0000000140269f67  488b4568               mov rax, qword ptr [rbp + 0x68]
0000000140269f6b  488985f0010000         mov qword ptr [rbp + 0x1f0], rax
0000000140269f72  488b4550               mov rax, qword ptr [rbp + 0x50]
0000000140269f76  488985d8010000         mov qword ptr [rbp + 0x1d8], rax
0000000140269f7d  488b4558               mov rax, qword ptr [rbp + 0x58]
0000000140269f81  488985e0010000         mov qword ptr [rbp + 0x1e0], rax
0000000140269f88  48c785f801000000000000 mov qword ptr [rbp + 0x1f8], 0
0000000140269f93  c7853802000001000000   mov dword ptr [rbp + 0x238], 1
0000000140269f9d  440f11b550020000       movups xmmword ptr [rbp + 0x250], xmm14
0000000140269fa5  440f11bd60020000       movups xmmword ptr [rbp + 0x260], xmm15
0000000140269fad  440f118d80020000       movups xmmword ptr [rbp + 0x280], xmm9
0000000140269fb5  450f28c1               movaps xmm8, xmm9
0000000140269fb9  440f100def35f305       movups xmm9, xmmword ptr [rip + 0x5f335ef]
0000000140269fc1  440f118d70020000       movups xmmword ptr [rbp + 0x270], xmm9
0000000140269fc9  440f1195a0020000       movups xmmword ptr [rbp + 0x2a0], xmm10
0000000140269fd1  410f28fa               movaps xmm7, xmm10
0000000140269fd5  440f1015f335f305       movups xmm10, xmmword ptr [rip + 0x5f335f3]
0000000140269fdd  440f119590020000       movups xmmword ptr [rbp + 0x290], xmm10
0000000140269fe5  0f10051436f305         movups xmm0, xmmword ptr [rip + 0x5f33614]
0000000140269fec  0f1185c0020000         movups xmmword ptr [rbp + 0x2c0], xmm0
0000000140269ff3  0f1005f635f305         movups xmm0, xmmword ptr [rip + 0x5f335f6]
0000000140269ffa  0f1185b0020000         movups xmmword ptr [rbp + 0x2b0], xmm0
000000014026a001  440f119dd0020000       movups xmmword ptr [rbp + 0x2d0], xmm11
000000014026a009  c785e002000001000000   mov dword ptr [rbp + 0x2e0], 1
000000014026a013  f30f10057539f105       movss xmm0, dword ptr [rip + 0x5f13975]
000000014026a01b  0f1385e4020000         movlps qword ptr [rbp + 0x2e4], xmm0
000000014026a022  c685ec02000001         mov byte ptr [rbp + 0x2ec], 1
000000014026a029  f20f1005ff03f105       movsd xmm0, qword ptr [rip + 0x5f103ff]
000000014026a031  f20f1185f0020000       movsd qword ptr [rbp + 0x2f0], xmm0
000000014026a039  498b06                 mov rax, qword ptr [r14]
000000014026a03c  c785f80200000000803f   mov dword ptr [rbp + 0x2f8], 0x3f800000
000000014026a046  66c785fc0200000000     mov word ptr [rbp + 0x2fc], 0
000000014026a04f  66c785020300000000     mov word ptr [rbp + 0x302], 0
000000014026a058  c785fe02000000000100   mov dword ptr [rbp + 0x2fe], 0x10000
000000014026a062  66c785080300000000     mov word ptr [rbp + 0x308], 0
000000014026a06b  c7850403000000000100   mov dword ptr [rbp + 0x304], 0x10000
000000014026a075  66c7850e0300000000     mov word ptr [rbp + 0x30e], 0
000000014026a07e  c7850a03000000000000   mov dword ptr [rbp + 0x30a], 0
000000014026a088  48898590010000         mov qword ptr [rbp + 0x190], rax
000000014026a08f  4c8d8590010000         lea r8, [rbp + 0x190]
000000014026a096  4c89e9                 mov rcx, r13
000000014026a099  4889fa                 mov rdx, rdi
000000014026a09c  4d89e1                 mov r9, r12
000000014026a09f  e8ccef0400             call 0x1402b9070
000000014026a0a4  488d8560040000         lea rax, [rbp + 0x460]
000000014026a0ab  48898590010000         mov qword ptr [rbp + 0x190], rax
000000014026a0b2  48899d98010000         mov qword ptr [rbp + 0x198], rbx
000000014026a0b9  4889b5a0010000         mov qword ptr [rbp + 0x1a0], rsi
000000014026a0c0  488b8540030000         mov rax, qword ptr [rbp + 0x340]
000000014026a0c7  488985a8010000         mov qword ptr [rbp + 0x1a8], rax
000000014026a0ce  488d9590010000         lea rdx, [rbp + 0x190]
000000014026a0d5  4c89e9                 mov rcx, r13
000000014026a0d8  e833540700             call 0x1402df510
000000014026a0dd  66c785740100000000     mov word ptr [rbp + 0x174], 0
000000014026a0e6  c6856401000001         mov byte ptr [rbp + 0x164], 1
000000014026a0ed  0f2805fc9aef05         movaps xmm0, xmmword ptr [rip + 0x5ef9afc]
000000014026a0f4  0f114578               movups xmmword ptr [rbp + 0x78], xmm0
000000014026a0f8  0f28057170f105         movaps xmm0, xmmword ptr [rip + 0x5f17071]
000000014026a0ff  0f118588000000         movups xmmword ptr [rbp + 0x88], xmm0
000000014026a106  0f28057320f305         movaps xmm0, xmmword ptr [rip + 0x5f32073]
000000014026a10d  0f118598000000         movups xmmword ptr [rbp + 0x98], xmm0
000000014026a114  48c7457000000000       mov qword ptr [rbp + 0x70], 0
000000014026a11c  0f11b5a8000000         movups xmmword ptr [rbp + 0xa8], xmm6
000000014026a123  0f11b5b8000000         movups xmmword ptr [rbp + 0xb8], xmm6
000000014026a12a  c7858801000000000000   mov dword ptr [rbp + 0x188], 0
000000014026a134  66c7858c0100000000     mov word ptr [rbp + 0x18c], 0
000000014026a13d  440f11b5c8000000       movups xmmword ptr [rbp + 0xc8], xmm14
000000014026a145  440f11bdd8000000       movups xmmword ptr [rbp + 0xd8], xmm15
000000014026a14d  440f118de8000000       movups xmmword ptr [rbp + 0xe8], xmm9
000000014026a155  440f1185f8000000       movups xmmword ptr [rbp + 0xf8], xmm8
000000014026a15d  0f11bd18010000         movups xmmword ptr [rbp + 0x118], xmm7
000000014026a164  440f119508010000       movups xmmword ptr [rbp + 0x108], xmm10
000000014026a16c  0f28059d9cef05         movaps xmm0, xmmword ptr [rip + 0x5ef9c9d]
000000014026a173  0f118528010000         movups xmmword ptr [rbp + 0x128], xmm0
000000014026a17a  0f2805af9aef05         movaps xmm0, xmmword ptr [rip + 0x5ef9aaf]
000000014026a181  0f118538010000         movups xmmword ptr [rbp + 0x138], xmm0
000000014026a188  c6858601000000         mov byte ptr [rbp + 0x186], 0
000000014026a18f  c7858201000000010000   mov dword ptr [rbp + 0x182], 0x100
000000014026a199  48c7856801000000000000 mov qword ptr [rbp + 0x168], 0
000000014026a1a4  c785700100000000803f   mov dword ptr [rbp + 0x170], 0x3f800000
000000014026a1ae  440f119d48010000       movups xmmword ptr [rbp + 0x148], xmm11
000000014026a1b6  c7855801000001000000   mov dword ptr [rbp + 0x158], 1
000000014026a1c0  48c7855c01000000000000 mov qword ptr [rbp + 0x15c], 0
000000014026a1cb  c6858701000000         mov byte ptr [rbp + 0x187], 0
000000014026a1d2  440f296510             movaps xmmword ptr [rbp + 0x10], xmm12
000000014026a1d7  48c7452000000000       mov qword ptr [rbp + 0x20], 0
000000014026a1df  440f116d28             movups xmmword ptr [rbp + 0x28], xmm13
000000014026a1e4  48c7453800000000       mov qword ptr [rbp + 0x38], 0
000000014026a1ec  0f10051533f305         movups xmm0, xmmword ptr [rip + 0x5f33315]
000000014026a1f3  0f294540               movaps xmmword ptr [rbp + 0x40], xmm0
000000014026a1f7  48c7455000000000       mov qword ptr [rbp + 0x50], 0
000000014026a1ff  0f10051a33f305         movups xmm0, xmmword ptr [rip + 0x5f3331a]
000000014026a206  0f114558               movups xmmword ptr [rbp + 0x58], xmm0
000000014026a20a  48c7456800000000       mov qword ptr [rbp + 0x68], 0
000000014026a212  66c7857a0100000000     mov word ptr [rbp + 0x17a], 0
000000014026a21b  c7857601000000000100   mov dword ptr [rbp + 0x176], 0x10000
000000014026a225  66c785800100000000     mov word ptr [rbp + 0x180], 0
000000014026a22e  c7857c01000000000100   mov dword ptr [rbp + 0x17c], 0x10000
000000014026a238  e8c37fd9ff             call 0x140002200
000000014026a23d  b940000000             mov ecx, 0x40
000000014026a242  ba04000000             mov edx, 4
000000014026a247  e8747fd9ff             call 0x1400021c0
000000014026a24c  4885c0                 test rax, rax
000000014026a24f  0f84b1010000           je 0x14026a406
000000014026a255  48898540030000         mov qword ptr [rbp + 0x340], rax
000000014026a25c  0f1005b535f305         movups xmm0, xmmword ptr [rip + 0x5f335b5]
000000014026a263  0f298590010000         movaps xmmword ptr [rbp + 0x190], xmm0
000000014026a26a  c785a001000000000000   mov dword ptr [rbp + 0x1a0], 0
000000014026a274  488d4da0               lea rcx, [rbp - 0x60]
000000014026a278  488d9590010000         lea rdx, [rbp + 0x190]
000000014026a27f  e89c56bc04             call 0x144e2f920
000000014026a284  90                     nop
000000014026a285  0f2875a0               movaps xmm6, xmmword ptr [rbp - 0x60]
000000014026a289  0f2805001ff305         movaps xmm0, xmmword ptr [rip + 0x5f31f00]
000000014026a290  0f118594010000         movups xmmword ptr [rbp + 0x194], xmm0
000000014026a297  c7859001000000000000   mov dword ptr [rbp + 0x190], 0
000000014026a2a1  488d4da0               lea rcx, [rbp - 0x60]
000000014026a2a5  488d9590010000         lea rdx, [rbp + 0x190]
000000014026a2ac  e86f56bc04             call 0x144e2f920
000000014026a2b1  90                     nop
000000014026a2b2  0f2845a0               movaps xmm0, xmmword ptr [rbp - 0x60]
000000014026a2b6  488bb540030000         mov rsi, qword ptr [rbp + 0x340]
000000014026a2bd  c70600000000           mov dword ptr [rsi], 0
000000014026a2c3  c7460801000000         mov dword ptr [rsi + 8], 1
000000014026a2ca  0f11760c               movups xmmword ptr [rsi + 0xc], xmm6
000000014026a2ce  48c7461c0000003f       mov qword ptr [rsi + 0x1c], 0x3f000000
000000014026a2d6  c7462801000000         mov dword ptr [rsi + 0x28], 1
000000014026a2dd  0f11462c               movups xmmword ptr [rsi + 0x2c], xmm0
000000014026a2e1  c7463c0000003f         mov dword ptr [rsi + 0x3c], 0x3f000000
000000014026a2e8  e8137fd9ff             call 0x140002200
000000014026a2ed  b948000000             mov ecx, 0x48
000000014026a2f2  ba08000000             mov edx, 8
000000014026a2f7  e8c47ed9ff             call 0x1400021c0
000000014026a2fc  4885c0                 test rax, rax
000000014026a2ff  0f84ef000000           je 0x14026a3f4
000000014026a305  4889c3                 mov rbx, rax
000000014026a308  48c7400802000000       mov qword ptr [rax + 8], 2
000000014026a310  48897010               mov qword ptr [rax + 0x10], rsi
000000014026a314  48c7401802000000       mov qword ptr [rax + 0x18], 2
000000014026a31c  c74020db0f4940         mov dword ptr [rax + 0x20], 0x40490fdb
000000014026a323  c6402400               mov byte ptr [rax + 0x24], 0
000000014026a327  48b80000000000000080   movabs rax, 0x8000000000000000
000000014026a331  488903                 mov qword ptr [rbx], rax
000000014026a334  488d8d98010000         lea rcx, [rbp + 0x198]
000000014026a33b  488d5510               lea rdx, [rbp + 0x10]
000000014026a33f  41b880010000           mov r8d, 0x180
000000014026a345  e8919ed205             call 0x145f941db
000000014026a34a  498b06                 mov rax, qword ptr [r14]
000000014026a34d  48c7851803000001000000 mov qword ptr [rbp + 0x318], 1
000000014026a358  48899d20030000         mov qword ptr [rbp + 0x320], rbx
000000014026a35f  48c7852803000001000000 mov qword ptr [rbp + 0x328], 1
000000014026a36a  c6853003000001         mov byte ptr [rbp + 0x330], 1
000000014026a371  48898590010000         mov qword ptr [rbp + 0x190], rax
000000014026a378  4c8d0d91a3ef05         lea r9, [rip + 0x5efa391]
000000014026a37f  488d4d10               lea rcx, [rbp + 0x10]
000000014026a383  4c8d8590010000         lea r8, [rbp + 0x190]
000000014026a38a  4889fa                 mov rdx, rdi
000000014026a38d  e81e2e0500             call 0x1402bd1b0
000000014026a392  0f28b550030000         movaps xmm6, xmmword ptr [rbp + 0x350]
000000014026a399  0f28bd60030000         movaps xmm7, xmmword ptr [rbp + 0x360]
000000014026a3a0  440f288570030000       movaps xmm8, xmmword ptr [rbp + 0x370]
000000014026a3a8  440f288d80030000       movaps xmm9, xmmword ptr [rbp + 0x380]
000000014026a3b0  440f289590030000       movaps xmm10, xmmword ptr [rbp + 0x390]
000000014026a3b8  440f289da0030000       movaps xmm11, xmmword ptr [rbp + 0x3a0]
000000014026a3c0  440f28a5b0030000       movaps xmm12, xmmword ptr [rbp + 0x3b0]
000000014026a3c8  440f28adc0030000       movaps xmm13, xmmword ptr [rbp + 0x3c0]
000000014026a3d0  440f28b5d0030000       movaps xmm14, xmmword ptr [rbp + 0x3d0]
000000014026a3d8  440f28bde0030000       movaps xmm15, xmmword ptr [rbp + 0x3e0]
000000014026a3e0  4881c478040000         add rsp, 0x478
000000014026a3e7  5b                     pop rbx
000000014026a3e8  5f                     pop rdi
000000014026a3e9  5e                     pop rsi
000000014026a3ea  415c                   pop r12
000000014026a3ec  415d                   pop r13
000000014026a3ee  415e                   pop r14
000000014026a3f0  415f                   pop r15
000000014026a3f2  5d                     pop rbp
000000014026a3f3  c3                     ret
000000014026a3f4  b908000000             mov ecx, 8
000000014026a3f9  ba48000000             mov edx, 0x48
000000014026a3fe  e89e0ded05             call 0x14613b1a1
000000014026a403  90                     nop
000000014026a404  eb10                   jmp 0x14026a416
000000014026a406  b904000000             mov ecx, 4
000000014026a40b  ba40000000             mov edx, 0x40
000000014026a410  e88c0ded05             call 0x14613b1a1
000000014026a415  90                     nop
000000014026a416  0f0b                   ud2
