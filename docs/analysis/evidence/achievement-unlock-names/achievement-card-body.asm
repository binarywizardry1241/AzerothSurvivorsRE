00000001402d9570  55                     push rbp
00000001402d9571  4157                   push r15
00000001402d9573  4156                   push r14
00000001402d9575  4155                   push r13
00000001402d9577  4154                   push r12
00000001402d9579  56                     push rsi
00000001402d957a  57                     push rdi
00000001402d957b  53                     push rbx
00000001402d957c  4881ec88080000         sub rsp, 0x888
00000001402d9583  488dac2480000000       lea rbp, [rsp + 0x80]
00000001402d958b  440f29bdf0070000       movaps xmmword ptr [rbp + 0x7f0], xmm15
00000001402d9593  440f29b5e0070000       movaps xmmword ptr [rbp + 0x7e0], xmm14
00000001402d959b  440f29add0070000       movaps xmmword ptr [rbp + 0x7d0], xmm13
00000001402d95a3  440f29a5c0070000       movaps xmmword ptr [rbp + 0x7c0], xmm12
00000001402d95ab  440f299db0070000       movaps xmmword ptr [rbp + 0x7b0], xmm11
00000001402d95b3  440f2995a0070000       movaps xmmword ptr [rbp + 0x7a0], xmm10
00000001402d95bb  440f298d90070000       movaps xmmword ptr [rbp + 0x790], xmm9
00000001402d95c3  440f298580070000       movaps xmmword ptr [rbp + 0x780], xmm8
00000001402d95cb  0f29bd70070000         movaps xmmword ptr [rbp + 0x770], xmm7
00000001402d95d2  0f29b560070000         movaps xmmword ptr [rbp + 0x760], xmm6
00000001402d95d9  48c78558070000feffffff mov qword ptr [rbp + 0x758], 0xfffffffffffffffe
00000001402d95e4  4989d7                 mov r15, rdx
00000001402d95e7  488b01                 mov rax, qword ptr [rcx]
00000001402d95ea  488b5128               mov rdx, qword ptr [rcx + 0x28]
00000001402d95ee  48894540               mov qword ptr [rbp + 0x40], rax
00000001402d95f2  4c8d7548               lea r14, [rbp + 0x48]
00000001402d95f6  0f104108               movups xmm0, xmmword ptr [rcx + 8]
00000001402d95fa  0f114548               movups xmmword ptr [rbp + 0x48], xmm0
00000001402d95fe  48898d08020000         mov qword ptr [rbp + 0x208], rcx
00000001402d9605  0f104118               movups xmm0, xmmword ptr [rcx + 0x18]
00000001402d9609  0f114558               movups xmmword ptr [rbp + 0x58], xmm0
00000001402d960d  48895568               mov qword ptr [rbp + 0x68], rdx
00000001402d9611  4d8b2f                 mov r13, qword ptr [r15]
00000001402d9614  410fb65d00             movzx ebx, byte ptr [r13]
00000001402d9619  84db                   test bl, bl
00000001402d961b  0f840e070000           je 0x1402d9d2f
00000001402d9621  66c785d40100000000     mov word ptr [rbp + 0x1d4], 0
00000001402d962a  c685c401000001         mov byte ptr [rbp + 0x1c4], 1
00000001402d9631  0f2805d8a7e805         movaps xmm0, xmmword ptr [rip + 0x5e8a7d8]
00000001402d9638  0f1185d8000000         movups xmmword ptr [rbp + 0xd8], xmm0
00000001402d963f  48c785e800000001000000 mov qword ptr [rbp + 0xe8], 1
00000001402d964a  c785f000000001000000   mov dword ptr [rbp + 0xf0], 1
00000001402d9654  48c785d000000000000000 mov qword ptr [rbp + 0xd0], 0
00000001402d965f  0f57c0                 xorps xmm0, xmm0
00000001402d9662  0f1185f4000000         movups xmmword ptr [rbp + 0xf4], xmm0
00000001402d9669  0f118504010000         movups xmmword ptr [rbp + 0x104], xmm0
00000001402d9670  0f118514010000         movups xmmword ptr [rbp + 0x114], xmm0
00000001402d9677  c7852401000000000000   mov dword ptr [rbp + 0x124], 0
00000001402d9681  c785e801000000000000   mov dword ptr [rbp + 0x1e8], 0
00000001402d968b  66c785ec0100000000     mov word ptr [rbp + 0x1ec], 0
00000001402d9694  0f10051df5ec05         movups xmm0, xmmword ptr [rip + 0x5ecf51d]
00000001402d969b  0f118538010000         movups xmmword ptr [rbp + 0x138], xmm0
00000001402d96a2  0f1005fff4ec05         movups xmm0, xmmword ptr [rip + 0x5ecf4ff]
00000001402d96a9  0f118528010000         movups xmmword ptr [rbp + 0x128], xmm0
00000001402d96b0  0f100521f5ec05         movups xmm0, xmmword ptr [rip + 0x5ecf521]
00000001402d96b7  0f118558010000         movups xmmword ptr [rbp + 0x158], xmm0
00000001402d96be  440f101502f5ec05       movups xmm10, xmmword ptr [rip + 0x5ecf502]
00000001402d96c6  440f119548010000       movups xmmword ptr [rbp + 0x148], xmm10
00000001402d96ce  440f101d22f5ec05       movups xmm11, xmmword ptr [rip + 0x5ecf522]
00000001402d96d6  440f119d78010000       movups xmmword ptr [rbp + 0x178], xmm11
00000001402d96de  440f102502f5ec05       movups xmm12, xmmword ptr [rip + 0x5ecf502]
00000001402d96e6  440f11a568010000       movups xmmword ptr [rbp + 0x168], xmm12
00000001402d96ee  440f102d22f5ec05       movups xmm13, xmmword ptr [rip + 0x5ecf522]
00000001402d96f6  440f11ad98010000       movups xmmword ptr [rbp + 0x198], xmm13
00000001402d96fe  440f103502f5ec05       movups xmm14, xmmword ptr [rip + 0x5ecf502]
00000001402d9706  440f11b588010000       movups xmmword ptr [rbp + 0x188], xmm14
00000001402d970e  c685e601000000         mov byte ptr [rbp + 0x1e6], 0
00000001402d9715  c785e201000000010000   mov dword ptr [rbp + 0x1e2], 0x100
00000001402d971f  48c785c801000000000000 mov qword ptr [rbp + 0x1c8], 0
00000001402d972a  c785d00100000000803f   mov dword ptr [rbp + 0x1d0], 0x3f800000
00000001402d9734  440f283d04a4e805       movaps xmm15, xmmword ptr [rip + 0x5e8a404]
00000001402d973c  440f11bda8010000       movups xmmword ptr [rbp + 0x1a8], xmm15
00000001402d9744  c785b801000001000000   mov dword ptr [rbp + 0x1b8], 1
00000001402d974e  48c785bc01000000000000 mov qword ptr [rbp + 0x1bc], 0
00000001402d9759  c685e701000000         mov byte ptr [rbp + 0x1e7], 0
00000001402d9760  0f103589f3ec05         movups xmm6, xmmword ptr [rip + 0x5ecf389]
00000001402d9767  0f297570               movaps xmmword ptr [rbp + 0x70], xmm6
00000001402d976b  48c7858000000000000000 mov qword ptr [rbp + 0x80], 0
00000001402d9776  0f103d8bf3ec05         movups xmm7, xmmword ptr [rip + 0x5ecf38b]
00000001402d977d  0f11bd88000000         movups xmmword ptr [rbp + 0x88], xmm7
00000001402d9784  48c7859800000000000000 mov qword ptr [rbp + 0x98], 0
00000001402d978f  440f100589f3ec05       movups xmm8, xmmword ptr [rip + 0x5ecf389]
00000001402d9797  440f2985a0000000       movaps xmmword ptr [rbp + 0xa0], xmm8
00000001402d979f  48c785b000000000000000 mov qword ptr [rbp + 0xb0], 0
00000001402d97aa  440f100d86f3ec05       movups xmm9, xmmword ptr [rip + 0x5ecf386]
00000001402d97b2  440f118db8000000       movups xmmword ptr [rbp + 0xb8], xmm9
00000001402d97ba  48c785c800000000000000 mov qword ptr [rbp + 0xc8], 0
00000001402d97c5  66c785da0100000000     mov word ptr [rbp + 0x1da], 0
00000001402d97ce  c785d601000000000100   mov dword ptr [rbp + 0x1d6], 0x10000
00000001402d97d8  66c785e00100000000     mov word ptr [rbp + 0x1e0], 0
00000001402d97e1  c785dc01000000000100   mov dword ptr [rbp + 0x1dc], 0x10000
00000001402d97eb  498b7708               mov rsi, qword ptr [r15 + 8]
00000001402d97ef  e80c8ad2ff             call 0x140002200
00000001402d97f4  b939000000             mov ecx, 0x39
00000001402d97f9  ba01000000             mov edx, 1
00000001402d97fe  e8bd89d2ff             call 0x1400021c0
00000001402d9803  4885c0                 test rax, rax
00000001402d9806  0f84841d0000           je 0x1402db590
00000001402d980c  0f1005ae2ded05         movups xmm0, xmmword ptr [rip + 0x5ed2dae]
00000001402d9813  0f114029               movups xmmword ptr [rax + 0x29], xmm0
00000001402d9817  0f10059a2ded05         movups xmm0, xmmword ptr [rip + 0x5ed2d9a]
00000001402d981e  0f114020               movups xmmword ptr [rax + 0x20], xmm0
00000001402d9822  0f10057f2ded05         movups xmm0, xmmword ptr [rip + 0x5ed2d7f]
00000001402d9829  0f114010               movups xmmword ptr [rax + 0x10], xmm0
00000001402d982d  0f1005642ded05         movups xmm0, xmmword ptr [rip + 0x5ed2d64]
00000001402d9834  0f1100                 movups xmmword ptr [rax], xmm0
00000001402d9837  48c7859004000039000000 mov qword ptr [rbp + 0x490], 0x39
00000001402d9842  48898598040000         mov qword ptr [rbp + 0x498], rax
00000001402d9849  48c785a004000039000000 mov qword ptr [rbp + 0x4a0], 0x39
00000001402d9854  488d052dfceb05         lea rax, [rip + 0x5ebfc2d]
00000001402d985b  4889442420             mov qword ptr [rsp + 0x20], rax
00000001402d9860  488d8d30020000         lea rcx, [rbp + 0x230]
00000001402d9867  4c8d8590040000         lea r8, [rbp + 0x490]
00000001402d986e  41b901000000           mov r9d, 1
00000001402d9874  4889f2                 mov rdx, rsi
00000001402d9877  e834c0f4ff             call 0x1402258b0
00000001402d987c  90                     nop
00000001402d987d  0f10056cf6ec05         movups xmm0, xmmword ptr [rip + 0x5ecf66c]
00000001402d9884  0f118540040000         movups xmmword ptr [rbp + 0x440], xmm0
00000001402d988b  48b80000803f02000000   movabs rax, 0x23f800000
00000001402d9895  48898550040000         mov qword ptr [rbp + 0x450], rax
00000001402d989c  0f100565f6ec05         movups xmm0, xmmword ptr [rip + 0x5ecf665]
00000001402d98a3  0f118528040000         movups xmmword ptr [rbp + 0x428], xmm0
00000001402d98aa  48c7853804000046000000 mov qword ptr [rbp + 0x438], 0x46
00000001402d98b5  c6850804000002         mov byte ptr [rbp + 0x408], 2
00000001402d98bc  66c7858c0400000000     mov word ptr [rbp + 0x48c], 0
00000001402d98c5  c7857804000000000000   mov dword ptr [rbp + 0x478], 0
00000001402d98cf  0f108530020000         movups xmm0, xmmword ptr [rbp + 0x230]
00000001402d98d6  0f298510070000         movaps xmmword ptr [rbp + 0x710], xmm0
00000001402d98dd  488b8540020000         mov rax, qword ptr [rbp + 0x240]
00000001402d98e4  48898520070000         mov qword ptr [rbp + 0x720], rax
00000001402d98eb  0f108518040000         movups xmm0, xmmword ptr [rbp + 0x418]
00000001402d98f2  0f298500070000         movaps xmmword ptr [rbp + 0x700], xmm0
00000001402d98f9  0fb68508040000         movzx eax, byte ptr [rbp + 0x408]
00000001402d9900  8885f0060000           mov byte ptr [rbp + 0x6f0], al
00000001402d9906  488b8509040000         mov rax, qword ptr [rbp + 0x409]
00000001402d990d  488985f1060000         mov qword ptr [rbp + 0x6f1], rax
00000001402d9914  8b8511040000           mov eax, dword ptr [rbp + 0x411]
00000001402d991a  8985f9060000           mov dword ptr [rbp + 0x6f9], eax
00000001402d9920  0fb78515040000         movzx eax, word ptr [rbp + 0x415]
00000001402d9927  668985fd060000         mov word ptr [rbp + 0x6fd], ax
00000001402d992e  0fb68517040000         movzx eax, byte ptr [rbp + 0x417]
00000001402d9935  8885ff060000           mov byte ptr [rbp + 0x6ff], al
00000001402d993b  8b8578040000           mov eax, dword ptr [rbp + 0x478]
00000001402d9941  898588060000           mov dword ptr [rbp + 0x688], eax
00000001402d9947  488b857c040000         mov rax, qword ptr [rbp + 0x47c]
00000001402d994e  4889858c060000         mov qword ptr [rbp + 0x68c], rax
00000001402d9955  8b8584040000           mov eax, dword ptr [rbp + 0x484]
00000001402d995b  898594060000           mov dword ptr [rbp + 0x694], eax
00000001402d9961  8b8588040000           mov eax, dword ptr [rbp + 0x488]
00000001402d9967  898598060000           mov dword ptr [rbp + 0x698], eax
00000001402d996d  0f108554040000         movups xmm0, xmmword ptr [rbp + 0x454]
00000001402d9974  0f118564060000         movups xmmword ptr [rbp + 0x664], xmm0
00000001402d997b  0f108564040000         movups xmm0, xmmword ptr [rbp + 0x464]
00000001402d9982  0f118574060000         movups xmmword ptr [rbp + 0x674], xmm0
00000001402d9989  8b8574040000           mov eax, dword ptr [rbp + 0x474]
00000001402d998f  898584060000           mov dword ptr [rbp + 0x684], eax
00000001402d9995  488db530020000         lea rsi, [rbp + 0x230]
00000001402d999c  488d5570               lea rdx, [rbp + 0x70]
00000001402d99a0  41b880010000           mov r8d, 0x180
00000001402d99a6  4889f1                 mov rcx, rsi
00000001402d99a9  e82da8cb05             call 0x145f941db
00000001402d99ae  0f2885f0060000         movaps xmm0, xmmword ptr [rbp + 0x6f0]
00000001402d99b5  0f288d00070000         movaps xmm1, xmmword ptr [rbp + 0x700]
00000001402d99bc  0f289510070000         movaps xmm2, xmmword ptr [rbp + 0x710]
00000001402d99c3  0f1185b0030000         movups xmmword ptr [rbp + 0x3b0], xmm0
00000001402d99ca  0f118dc0030000         movups xmmword ptr [rbp + 0x3c0], xmm1
00000001402d99d1  0f1195d0030000         movups xmmword ptr [rbp + 0x3d0], xmm2
00000001402d99d8  488b8520070000         mov rax, qword ptr [rbp + 0x720]
00000001402d99df  488985e0030000         mov qword ptr [rbp + 0x3e0], rax
00000001402d99e6  488b7d40               mov rdi, qword ptr [rbp + 0x40]
00000001402d99ea  488d8d98040000         lea rcx, [rbp + 0x498]
00000001402d99f1  41b8b8010000           mov r8d, 0x1b8
00000001402d99f7  4889f2                 mov rdx, rsi
00000001402d99fa  e8dca7cb05             call 0x145f941db
00000001402d99ff  c7855006000000000000   mov dword ptr [rbp + 0x650], 0
00000001402d9a09  0f2805f0e3ec05         movaps xmm0, xmmword ptr [rip + 0x5ece3f0]
00000001402d9a10  0f118554060000         movups xmmword ptr [rbp + 0x654], xmm0
00000001402d9a17  66c7859c0600000000     mov word ptr [rbp + 0x69c], 0
00000001402d9a20  4889bd90040000         mov qword ptr [rbp + 0x490], rdi
00000001402d9a27  488d4d70               lea rcx, [rbp + 0x70]
00000001402d9a2b  4c8d8590040000         lea r8, [rbp + 0x490]
00000001402d9a32  4c89f2                 mov rdx, r14
00000001402d9a35  e8263afeff             call 0x1402bd460
00000001402d9a3a  90                     nop
00000001402d9a3b  80bd2804000000         cmp byte ptr [rbp + 0x428], 0
00000001402d9a42  7519                   jne 0x1402d9a5d
00000001402d9a44  488b8530040000         mov rax, qword ptr [rbp + 0x430]
00000001402d9a4b  f048ff08               lock dec qword ptr [rax]
00000001402d9a4f  750c                   jne 0x1402d9a5d
00000001402d9a51  488d8d30040000         lea rcx, [rbp + 0x430]
00000001402d9a58  e803798604             call 0x144b41360
00000001402d9a5d  66c785940300000000     mov word ptr [rbp + 0x394], 0
00000001402d9a66  c6858403000001         mov byte ptr [rbp + 0x384], 1
00000001402d9a6d  0f28059ca3e805         movaps xmm0, xmmword ptr [rip + 0x5e8a39c]
00000001402d9a74  0f118598020000         movups xmmword ptr [rbp + 0x298], xmm0
00000001402d9a7b  48c785a802000001000000 mov qword ptr [rbp + 0x2a8], 1
00000001402d9a86  c785b002000001000000   mov dword ptr [rbp + 0x2b0], 1
00000001402d9a90  48c7859002000000000000 mov qword ptr [rbp + 0x290], 0
00000001402d9a9b  0f57c0                 xorps xmm0, xmm0
00000001402d9a9e  0f1185b4020000         movups xmmword ptr [rbp + 0x2b4], xmm0
00000001402d9aa5  0f1185c4020000         movups xmmword ptr [rbp + 0x2c4], xmm0
00000001402d9aac  0f1185d4020000         movups xmmword ptr [rbp + 0x2d4], xmm0
00000001402d9ab3  c785e402000000000000   mov dword ptr [rbp + 0x2e4], 0
00000001402d9abd  c785a803000000000000   mov dword ptr [rbp + 0x3a8], 0
00000001402d9ac7  66c785ac0300000000     mov word ptr [rbp + 0x3ac], 0
00000001402d9ad0  0f1005e1f0ec05         movups xmm0, xmmword ptr [rip + 0x5ecf0e1]
00000001402d9ad7  0f1185f8020000         movups xmmword ptr [rbp + 0x2f8], xmm0
00000001402d9ade  0f1005c3f0ec05         movups xmm0, xmmword ptr [rip + 0x5ecf0c3]
00000001402d9ae5  0f1185e8020000         movups xmmword ptr [rbp + 0x2e8], xmm0
00000001402d9aec  0f1005e5f0ec05         movups xmm0, xmmword ptr [rip + 0x5ecf0e5]
00000001402d9af3  0f118518030000         movups xmmword ptr [rbp + 0x318], xmm0
00000001402d9afa  440f119508030000       movups xmmword ptr [rbp + 0x308], xmm10
00000001402d9b02  440f119d38030000       movups xmmword ptr [rbp + 0x338], xmm11
00000001402d9b0a  440f11a528030000       movups xmmword ptr [rbp + 0x328], xmm12
00000001402d9b12  440f11ad58030000       movups xmmword ptr [rbp + 0x358], xmm13
00000001402d9b1a  440f11b548030000       movups xmmword ptr [rbp + 0x348], xmm14
00000001402d9b22  c685a603000000         mov byte ptr [rbp + 0x3a6], 0
00000001402d9b29  c785a203000000010000   mov dword ptr [rbp + 0x3a2], 0x100
00000001402d9b33  48c7858803000000000000 mov qword ptr [rbp + 0x388], 0
00000001402d9b3e  c785900300000000803f   mov dword ptr [rbp + 0x390], 0x3f800000
00000001402d9b48  440f11bd68030000       movups xmmword ptr [rbp + 0x368], xmm15
00000001402d9b50  c7857803000001000000   mov dword ptr [rbp + 0x378], 1
00000001402d9b5a  48c7857c03000000000000 mov qword ptr [rbp + 0x37c], 0
00000001402d9b65  c685a703000000         mov byte ptr [rbp + 0x3a7], 0
00000001402d9b6c  0f29b530020000         movaps xmmword ptr [rbp + 0x230], xmm6
00000001402d9b73  48c7854002000000000000 mov qword ptr [rbp + 0x240], 0
00000001402d9b7e  0f11bd48020000         movups xmmword ptr [rbp + 0x248], xmm7
00000001402d9b85  48c7855802000000000000 mov qword ptr [rbp + 0x258], 0
00000001402d9b90  440f298560020000       movaps xmmword ptr [rbp + 0x260], xmm8
00000001402d9b98  48c7857002000000000000 mov qword ptr [rbp + 0x270], 0
00000001402d9ba3  440f118d78020000       movups xmmword ptr [rbp + 0x278], xmm9
00000001402d9bab  48c7858802000000000000 mov qword ptr [rbp + 0x288], 0
00000001402d9bb6  66c7859a0300000000     mov word ptr [rbp + 0x39a], 0
00000001402d9bbf  c7859603000000000100   mov dword ptr [rbp + 0x396], 0x10000
00000001402d9bc9  66c785a00300000000     mov word ptr [rbp + 0x3a0], 0
00000001402d9bd2  c7859c03000000000100   mov dword ptr [rbp + 0x39c], 0x10000
00000001402d9bdc  e81f86d2ff             call 0x140002200
00000001402d9be1  b940000000             mov ecx, 0x40
00000001402d9be6  ba04000000             mov edx, 4
00000001402d9beb  e8d085d2ff             call 0x1400021c0
00000001402d9bf0  4885c0                 test rax, rax
00000001402d9bf3  0f8485190000           je 0x1402db57e
00000001402d9bf9  48898550070000         mov qword ptr [rbp + 0x750], rax
00000001402d9c00  0f280509e2ec05         movaps xmm0, xmmword ptr [rip + 0x5ece209]
00000001402d9c07  0f118594040000         movups xmmword ptr [rbp + 0x494], xmm0
00000001402d9c0e  c7859004000000000000   mov dword ptr [rbp + 0x490], 0
00000001402d9c18  488d4d70               lea rcx, [rbp + 0x70]
00000001402d9c1c  488d9590040000         lea rdx, [rbp + 0x490]
00000001402d9c23  e8f85cb504             call 0x144e2f920
00000001402d9c28  90                     nop
00000001402d9c29  0f287570               movaps xmm6, xmmword ptr [rbp + 0x70]
00000001402d9c2d  0f10054cfdec05         movups xmm0, xmmword ptr [rip + 0x5ecfd4c]
00000001402d9c34  0f298590040000         movaps xmmword ptr [rbp + 0x490], xmm0
00000001402d9c3b  c785a004000000000000   mov dword ptr [rbp + 0x4a0], 0
00000001402d9c45  488d4d70               lea rcx, [rbp + 0x70]
00000001402d9c49  488d9590040000         lea rdx, [rbp + 0x490]
00000001402d9c50  e8cb5cb504             call 0x144e2f920
00000001402d9c55  90                     nop
00000001402d9c56  0f284570               movaps xmm0, xmmword ptr [rbp + 0x70]
00000001402d9c5a  488bbd50070000         mov rdi, qword ptr [rbp + 0x750]
00000001402d9c61  c70700000000           mov dword ptr [rdi], 0
00000001402d9c67  c7470801000000         mov dword ptr [rdi + 8], 1
00000001402d9c6e  0f11770c               movups xmmword ptr [rdi + 0xc], xmm6
00000001402d9c72  48c7471c0000003f       mov qword ptr [rdi + 0x1c], 0x3f000000
00000001402d9c7a  c7472801000000         mov dword ptr [rdi + 0x28], 1
00000001402d9c81  0f11472c               movups xmmword ptr [rdi + 0x2c], xmm0
00000001402d9c85  c7473c0000003f         mov dword ptr [rdi + 0x3c], 0x3f000000
00000001402d9c8c  e86f85d2ff             call 0x140002200
00000001402d9c91  b948000000             mov ecx, 0x48
00000001402d9c96  ba08000000             mov edx, 8
00000001402d9c9b  e82085d2ff             call 0x1400021c0
00000001402d9ca0  4885c0                 test rax, rax
00000001402d9ca3  0f84c3180000           je 0x1402db56c
00000001402d9ca9  4889c6                 mov rsi, rax
00000001402d9cac  48c7400802000000       mov qword ptr [rax + 8], 2
00000001402d9cb4  48897810               mov qword ptr [rax + 0x10], rdi
00000001402d9cb8  48c7401802000000       mov qword ptr [rax + 0x18], 2
00000001402d9cc0  c74020db0fc93f         mov dword ptr [rax + 0x20], 0x3fc90fdb
00000001402d9cc7  c6402400               mov byte ptr [rax + 0x24], 0
00000001402d9ccb  48b80000000000000080   movabs rax, 0x8000000000000000
00000001402d9cd5  488906                 mov qword ptr [rsi], rax
00000001402d9cd8  488d8d98040000         lea rcx, [rbp + 0x498]
00000001402d9cdf  488d9530020000         lea rdx, [rbp + 0x230]
00000001402d9ce6  41b880010000           mov r8d, 0x180
00000001402d9cec  e8eaa4cb05             call 0x145f941db
00000001402d9cf1  488b4540               mov rax, qword ptr [rbp + 0x40]
00000001402d9cf5  48c7851806000001000000 mov qword ptr [rbp + 0x618], 1
00000001402d9d00  4889b520060000         mov qword ptr [rbp + 0x620], rsi
00000001402d9d07  48c7852806000001000000 mov qword ptr [rbp + 0x628], 1
00000001402d9d12  48898590040000         mov qword ptr [rbp + 0x490], rax
00000001402d9d19  488d8d30020000         lea rcx, [rbp + 0x230]
00000001402d9d20  4c8d8590040000         lea r8, [rbp + 0x490]
00000001402d9d27  4c89f2                 mov rdx, r14
00000001402d9d2a  e8d131feff             call 0x1402bcf00
00000001402d9d2f  498b5708               mov rdx, qword ptr [r15 + 8]
00000001402d9d33  498b7f10               mov rdi, qword ptr [r15 + 0x10]
00000001402d9d37  4c8b8780000000         mov r8, qword ptr [rdi + 0x80]
00000001402d9d3e  4c8b8f88000000         mov r9, qword ptr [rdi + 0x88]
00000001402d9d45  885c2420               mov byte ptr [rsp + 0x20], bl
00000001402d9d49  488d4d40               lea rcx, [rbp + 0x40]
00000001402d9d4d  48899528070000         mov qword ptr [rbp + 0x728], rdx
00000001402d9d54  e80799f8ff             call 0x140263660
00000001402d9d59  0f57c0                 xorps xmm0, xmm0
00000001402d9d5c  0f2985d0020000         movaps xmmword ptr [rbp + 0x2d0], xmm0
00000001402d9d63  0f2985c0020000         movaps xmmword ptr [rbp + 0x2c0], xmm0
00000001402d9d6a  0f2985b0020000         movaps xmmword ptr [rbp + 0x2b0], xmm0
00000001402d9d71  0f2985a0020000         movaps xmmword ptr [rbp + 0x2a0], xmm0
00000001402d9d78  0f298590020000         movaps xmmword ptr [rbp + 0x290], xmm0
00000001402d9d7f  48c785e002000000000000 mov qword ptr [rbp + 0x2e0], 0
00000001402d9d8a  66c785140600000000     mov word ptr [rbp + 0x614], 0
00000001402d9d93  c7851006000000000000   mov dword ptr [rbp + 0x610], 0
00000001402d9d9d  0f100504eeec05         movups xmm0, xmmword ptr [rip + 0x5ecee04]
00000001402d9da4  0f1185e8020000         movups xmmword ptr [rbp + 0x2e8], xmm0
00000001402d9dab  0f100506eeec05         movups xmm0, xmmword ptr [rip + 0x5ecee06]
00000001402d9db2  0f1185f8020000         movups xmmword ptr [rbp + 0x2f8], xmm0
00000001402d9db9  0f100508eeec05         movups xmm0, xmmword ptr [rip + 0x5ecee08]
00000001402d9dc0  0f118508030000         movups xmmword ptr [rbp + 0x308], xmm0
00000001402d9dc7  0f10050aeeec05         movups xmm0, xmmword ptr [rip + 0x5ecee0a]
00000001402d9dce  0f118518030000         movups xmmword ptr [rbp + 0x318], xmm0
00000001402d9dd5  0f10051ceeec05         movups xmm0, xmmword ptr [rip + 0x5ecee1c]
00000001402d9ddc  0f118538030000         movups xmmword ptr [rbp + 0x338], xmm0
00000001402d9de3  0f1005feedec05         movups xmm0, xmmword ptr [rip + 0x5ecedfe]
00000001402d9dea  0f118528030000         movups xmmword ptr [rbp + 0x328], xmm0
00000001402d9df1  0f100520eeec05         movups xmm0, xmmword ptr [rip + 0x5ecee20]
00000001402d9df8  0f118558030000         movups xmmword ptr [rbp + 0x358], xmm0
00000001402d9dff  0f100502eeec05         movups xmm0, xmmword ptr [rip + 0x5ecee02]
00000001402d9e06  0f118548030000         movups xmmword ptr [rbp + 0x348], xmm0
00000001402d9e0d  0f1005dcecec05         movups xmm0, xmmword ptr [rip + 0x5ececdc]
00000001402d9e14  0f298530020000         movaps xmmword ptr [rbp + 0x230], xmm0
00000001402d9e1b  48c7854002000000000000 mov qword ptr [rbp + 0x240], 0
00000001402d9e26  0f1005dbecec05         movups xmm0, xmmword ptr [rip + 0x5ececdb]
00000001402d9e2d  0f118548020000         movups xmmword ptr [rbp + 0x248], xmm0
00000001402d9e34  48c7855802000000000000 mov qword ptr [rbp + 0x258], 0
00000001402d9e3f  0f1005daecec05         movups xmm0, xmmword ptr [rip + 0x5ececda]
00000001402d9e46  0f298560020000         movaps xmmword ptr [rbp + 0x260], xmm0
00000001402d9e4d  48c7857002000000000000 mov qword ptr [rbp + 0x270], 0
00000001402d9e58  0f1005d9ecec05         movups xmm0, xmmword ptr [rip + 0x5ececd9]
00000001402d9e5f  0f118578020000         movups xmmword ptr [rbp + 0x278], xmm0
00000001402d9e66  48c7858802000000000000 mov qword ptr [rbp + 0x288], 0
00000001402d9e71  488b7540               mov rsi, qword ptr [rbp + 0x40]
00000001402d9e75  488d8d98040000         lea rcx, [rbp + 0x498]
00000001402d9e7c  488d9530020000         lea rdx, [rbp + 0x230]
00000001402d9e83  41b838010000           mov r8d, 0x138
00000001402d9e89  e84da3cb05             call 0x145f941db
00000001402d9e8e  0f28052bb9ec05         movaps xmm0, xmmword ptr [rip + 0x5ecb92b]
00000001402d9e95  0f1185d0050000         movups xmmword ptr [rbp + 0x5d0], xmm0
00000001402d9e9c  c785e005000001000000   mov dword ptr [rbp + 0x5e0], 1
00000001402d9ea6  48c785e405000000000000 mov qword ptr [rbp + 0x5e4], 0
00000001402d9eb1  c685ec05000001         mov byte ptr [rbp + 0x5ec], 1
00000001402d9eb8  f20f10057005ea05       movsd xmm0, qword ptr [rip + 0x5ea0570]
00000001402d9ec0  f20f1185f0050000       movsd qword ptr [rbp + 0x5f0], xmm0
00000001402d9ec8  c785f80500000000803f   mov dword ptr [rbp + 0x5f8], 0x3f800000
00000001402d9ed2  66c785fc0500000000     mov word ptr [rbp + 0x5fc], 0
00000001402d9edb  c785fe05000000000100   mov dword ptr [rbp + 0x5fe], 0x10000
00000001402d9ee5  66c785020600000000     mov word ptr [rbp + 0x602], 0
00000001402d9eee  c7850406000000000100   mov dword ptr [rbp + 0x604], 0x10000
00000001402d9ef8  66c785080600000000     mov word ptr [rbp + 0x608], 0
00000001402d9f01  c7850a06000000000000   mov dword ptr [rbp + 0x60a], 0
00000001402d9f0b  66c7850e0600000100     mov word ptr [rbp + 0x60e], 1
00000001402d9f14  4889b590040000         mov qword ptr [rbp + 0x490], rsi
00000001402d9f1b  488d4db0               lea rcx, [rbp - 0x50]
00000001402d9f1f  4c8d8590040000         lea r8, [rbp + 0x490]
00000001402d9f26  4c89f2                 mov rdx, r14
00000001402d9f29  e842f1fdff             call 0x1402b9070
00000001402d9f2e  498b4718               mov rax, qword ptr [r15 + 0x18]
00000001402d9f32  48898548070000         mov qword ptr [rbp + 0x748], rax
00000001402d9f39  4d8b7720               mov r14, qword ptr [r15 + 0x20]
00000001402d9f3d  4c89bd00020000         mov qword ptr [rbp + 0x200], r15
00000001402d9f44  498b5728               mov rdx, qword ptr [r15 + 0x28]
00000001402d9f48  488b4db0               mov rcx, qword ptr [rbp - 0x50]
00000001402d9f4c  488b45d8               mov rax, qword ptr [rbp - 0x28]
00000001402d9f50  48898d38070000         mov qword ptr [rbp + 0x738], rcx
00000001402d9f57  48894d10               mov qword ptr [rbp + 0x10], rcx
00000001402d9f5b  0f1045b8               movups xmm0, xmmword ptr [rbp - 0x48]
00000001402d9f5f  0f114518               movups xmmword ptr [rbp + 0x18], xmm0
00000001402d9f63  0f1045c8               movups xmm0, xmmword ptr [rbp - 0x38]
00000001402d9f67  0f114528               movups xmmword ptr [rbp + 0x28], xmm0
00000001402d9f6b  48894538               mov qword ptr [rbp + 0x38], rax
00000001402d9f6f  4c89ad00040000         mov qword ptr [rbp + 0x400], r13
00000001402d9f76  450fb66d00             movzx r13d, byte ptr [r13]
00000001402d9f7b  4584ed                 test r13b, r13b
00000001402d9f7e  7409                   je 0x1402d9f89
00000001402d9f80  0f100555ebec05         movups xmm0, xmmword ptr [rip + 0x5eceb55]
00000001402d9f87  eb07                   jmp 0x1402d9f90
00000001402d9f89  0f1005dc0bed05         movups xmm0, xmmword ptr [rip + 0x5ed0bdc]
00000001402d9f90  0f298530020000         movaps xmmword ptr [rbp + 0x230], xmm0
00000001402d9f97  c785400200000000803f   mov dword ptr [rbp + 0x240], 0x3f800000
00000001402d9fa1  488b7728               mov rsi, qword ptr [rdi + 0x28]
00000001402d9fa5  4885f6                 test rsi, rsi
00000001402d9fa8  4c8bbd48070000         mov r15, qword ptr [rbp + 0x748]
00000001402d9faf  0f88bc010000           js 0x1402da171
00000001402d9fb5  48899550070000         mov qword ptr [rbp + 0x750], rdx
00000001402d9fbc  7467                   je 0x1402da025
00000001402d9fbe  4989fc                 mov r12, rdi
00000001402d9fc1  488b5f20               mov rbx, qword ptr [rdi + 0x20]
00000001402d9fc5  e83682d2ff             call 0x140002200
00000001402d9fca  41bf01000000           mov r15d, 1
00000001402d9fd0  ba01000000             mov edx, 1
00000001402d9fd5  4889f1                 mov rcx, rsi
00000001402d9fd8  e8e381d2ff             call 0x1400021c0
00000001402d9fdd  4885c0                 test rax, rax
00000001402d9fe0  0f848e010000           je 0x1402da174
00000001402d9fe6  4889c7                 mov rdi, rax
00000001402d9fe9  4889c1                 mov rcx, rax
00000001402d9fec  4889da                 mov rdx, rbx
00000001402d9fef  4989f0                 mov r8, rsi
00000001402d9ff2  e8e4a1cb05             call 0x145f941db
00000001402d9ff7  4c8bbd48070000         mov r15, qword ptr [rbp + 0x748]
00000001402d9ffe  41803f01               cmp byte ptr [r15], 1
00000001402da002  752f                   jne 0x1402da033
00000001402da004  418b4701               mov eax, dword ptr [r15 + 1]
00000001402da008  418b4f04               mov ecx, dword ptr [r15 + 4]
00000001402da00c  898d0b040000           mov dword ptr [rbp + 0x40b], ecx
00000001402da012  898508040000           mov dword ptr [rbp + 0x408], eax
00000001402da018  498b4708               mov rax, qword ptr [r15 + 8]
00000001402da01c  450fb65710             movzx r10d, byte ptr [r15 + 0x10]
00000001402da021  b101                   mov cl, 1
00000001402da023  eb1e                   jmp 0x1402da043
00000001402da025  4989fc                 mov r12, rdi
00000001402da028  bf01000000             mov edi, 1
00000001402da02d  41803f01               cmp byte ptr [r15], 1
00000001402da031  74d1                   je 0x1402da004
00000001402da033  498b4708               mov rax, qword ptr [r15 + 8]
00000001402da037  f048ff00               lock inc qword ptr [rax]
00000001402da03b  0f8e5f150000           jle 0x1402db5a0
00000001402da041  31c9                   xor ecx, ecx
00000001402da043  488d5518               lea rdx, [rbp + 0x18]
00000001402da047  448b8508040000         mov r8d, dword ptr [rbp + 0x408]
00000001402da04e  448b8d0b040000         mov r9d, dword ptr [rbp + 0x40b]
00000001402da055  44898dcc040000         mov dword ptr [rbp + 0x4cc], r9d
00000001402da05c  448985c9040000         mov dword ptr [rbp + 0x4c9], r8d
00000001402da063  0f288530020000         movaps xmm0, xmmword ptr [rbp + 0x230]
00000001402da06a  0f114571               movups xmmword ptr [rbp + 0x71], xmm0
00000001402da06e  448b8540020000         mov r8d, dword ptr [rbp + 0x240]
00000001402da075  44898581000000         mov dword ptr [rbp + 0x81], r8d
00000001402da07c  4889b598040000         mov qword ptr [rbp + 0x498], rsi
00000001402da083  4889bda0040000         mov qword ptr [rbp + 0x4a0], rdi
00000001402da08a  4889b5a8040000         mov qword ptr [rbp + 0x4a8], rsi
00000001402da091  48c785b004000000000000 mov qword ptr [rbp + 0x4b0], 0
00000001402da09c  48c785b804000004000000 mov qword ptr [rbp + 0x4b8], 4
00000001402da0a7  48c785c004000000000000 mov qword ptr [rbp + 0x4c0], 0
00000001402da0b2  888dc8040000           mov byte ptr [rbp + 0x4c8], cl
00000001402da0b8  488985d0040000         mov qword ptr [rbp + 0x4d0], rax
00000001402da0bf  4c8995d8040000         mov qword ptr [rbp + 0x4d8], r10
00000001402da0c6  c785e004000000008041   mov dword ptr [rbp + 0x4e0], 0x41800000
00000001402da0d0  66c785e40400009001     mov word ptr [rbp + 0x4e4], 0x190
00000001402da0d9  c685e604000001         mov byte ptr [rbp + 0x4e6], 1
00000001402da0e0  488b457d               mov rax, qword ptr [rbp + 0x7d]
00000001402da0e4  488985f4040000         mov qword ptr [rbp + 0x4f4], rax
00000001402da0eb  0f104570               movups xmm0, xmmword ptr [rbp + 0x70]
00000001402da0ef  0f1185e7040000         movups xmmword ptr [rbp + 0x4e7], xmm0
00000001402da0f6  8b0544f9eb05           mov eax, dword ptr [rip + 0x5ebf944]
00000001402da0fc  89850c050000           mov dword ptr [rbp + 0x50c], eax
00000001402da102  0f100527f9eb05         movups xmm0, xmmword ptr [rip + 0x5ebf927]
00000001402da109  0f1185fc040000         movups xmmword ptr [rbp + 0x4fc], xmm0
00000001402da110  f20f1005e89ae805       movsd xmm0, qword ptr [rip + 0x5e89ae8]
00000001402da118  f20f118510050000       movsd qword ptr [rbp + 0x510], xmm0
00000001402da120  488b8538070000         mov rax, qword ptr [rbp + 0x738]
00000001402da127  48898590040000         mov qword ptr [rbp + 0x490], rax
00000001402da12e  488d8d30020000         lea rcx, [rbp + 0x230]
00000001402da135  4c8d8590040000         lea r8, [rbp + 0x490]
00000001402da13c  e83f53ffff             call 0x1402cf480
00000001402da141  4584ed                 test r13b, r13b
00000001402da144  7409                   je 0x1402da14f
00000001402da146  0f100577ebec05         movups xmm0, xmmword ptr [rip + 0x5eceb77]
00000001402da14d  eb07                   jmp 0x1402da156
00000001402da14f  0f100556e9ec05         movups xmm0, xmmword ptr [rip + 0x5ece956]
00000001402da156  0f298530020000         movaps xmmword ptr [rbp + 0x230], xmm0
00000001402da15d  c785400200000000803f   mov dword ptr [rbp + 0x240], 0x3f800000
00000001402da167  498b742440             mov rsi, qword ptr [r12 + 0x40]
00000001402da16c  4885f6                 test rsi, rsi
00000001402da16f  7910                   jns 0x1402da181
00000001402da171  4531ff                 xor r15d, r15d
00000001402da174  4c89f9                 mov rcx, r15
00000001402da177  4889f2                 mov rdx, rsi
00000001402da17a  e83c10e605             call 0x14613b1bb
00000001402da17f  0f0b                   ud2
00000001402da181  4c89a510020000         mov qword ptr [rbp + 0x210], r12
00000001402da188  7468                   je 0x1402da1f2
00000001402da18a  498b5c2438             mov rbx, qword ptr [r12 + 0x38]
00000001402da18f  e86c80d2ff             call 0x140002200
00000001402da194  41bf01000000           mov r15d, 1
00000001402da19a  ba01000000             mov edx, 1
00000001402da19f  4889f1                 mov rcx, rsi
00000001402da1a2  e81980d2ff             call 0x1400021c0
00000001402da1a7  4885c0                 test rax, rax
00000001402da1aa  74c8                   je 0x1402da174
00000001402da1ac  4889c7                 mov rdi, rax
00000001402da1af  4889c1                 mov rcx, rax
00000001402da1b2  4889da                 mov rdx, rbx
00000001402da1b5  4989f0                 mov r8, rsi
00000001402da1b8  e81ea0cb05             call 0x145f941db
00000001402da1bd  4c8bbd48070000         mov r15, qword ptr [rbp + 0x748]
00000001402da1c4  4c8ba550070000         mov r12, qword ptr [rbp + 0x750]
00000001402da1cb  41803f01               cmp byte ptr [r15], 1
00000001402da1cf  7533                   jne 0x1402da204
00000001402da1d1  418b4701               mov eax, dword ptr [r15 + 1]
00000001402da1d5  418b4f04               mov ecx, dword ptr [r15 + 4]
00000001402da1d9  898d0b040000           mov dword ptr [rbp + 0x40b], ecx
00000001402da1df  898508040000           mov dword ptr [rbp + 0x408], eax
00000001402da1e5  498b4708               mov rax, qword ptr [r15 + 8]
00000001402da1e9  410fb65710             movzx edx, byte ptr [r15 + 0x10]
00000001402da1ee  b101                   mov cl, 1
00000001402da1f0  eb22                   jmp 0x1402da214
00000001402da1f2  bf01000000             mov edi, 1
00000001402da1f7  4c8ba550070000         mov r12, qword ptr [rbp + 0x750]
00000001402da1fe  41803f01               cmp byte ptr [r15], 1
00000001402da202  74cd                   je 0x1402da1d1
00000001402da204  498b4708               mov rax, qword ptr [r15 + 8]
00000001402da208  f048ff00               lock inc qword ptr [rax]
00000001402da20c  0f8e8e130000           jle 0x1402db5a0
00000001402da212  31c9                   xor ecx, ecx
00000001402da214  448b8508040000         mov r8d, dword ptr [rbp + 0x408]
00000001402da21b  448b8d0b040000         mov r9d, dword ptr [rbp + 0x40b]
00000001402da222  44898dcc040000         mov dword ptr [rbp + 0x4cc], r9d
00000001402da229  448985c9040000         mov dword ptr [rbp + 0x4c9], r8d
00000001402da230  0f288530020000         movaps xmm0, xmmword ptr [rbp + 0x230]
00000001402da237  0f114571               movups xmmword ptr [rbp + 0x71], xmm0
00000001402da23b  448b8540020000         mov r8d, dword ptr [rbp + 0x240]
00000001402da242  44898581000000         mov dword ptr [rbp + 0x81], r8d
00000001402da249  4889b598040000         mov qword ptr [rbp + 0x498], rsi
00000001402da250  4889bda0040000         mov qword ptr [rbp + 0x4a0], rdi
00000001402da257  4889b5a8040000         mov qword ptr [rbp + 0x4a8], rsi
00000001402da25e  48c785b004000000000000 mov qword ptr [rbp + 0x4b0], 0
00000001402da269  48c785b804000004000000 mov qword ptr [rbp + 0x4b8], 4
00000001402da274  48c785c004000000000000 mov qword ptr [rbp + 0x4c0], 0
00000001402da27f  888dc8040000           mov byte ptr [rbp + 0x4c8], cl
00000001402da285  488985d0040000         mov qword ptr [rbp + 0x4d0], rax
00000001402da28c  488995d8040000         mov qword ptr [rbp + 0x4d8], rdx
00000001402da293  c785e004000000004041   mov dword ptr [rbp + 0x4e0], 0x41400000
00000001402da29d  66c785e40400009001     mov word ptr [rbp + 0x4e4], 0x190
00000001402da2a6  c685e604000001         mov byte ptr [rbp + 0x4e6], 1
00000001402da2ad  488b457d               mov rax, qword ptr [rbp + 0x7d]
00000001402da2b1  488985f4040000         mov qword ptr [rbp + 0x4f4], rax
00000001402da2b8  0f104570               movups xmm0, xmmword ptr [rbp + 0x70]
00000001402da2bc  0f1185e7040000         movups xmmword ptr [rbp + 0x4e7], xmm0
00000001402da2c3  8b0577f7eb05           mov eax, dword ptr [rip + 0x5ebf777]
00000001402da2c9  89850c050000           mov dword ptr [rbp + 0x50c], eax
00000001402da2cf  0f10055af7eb05         movups xmm0, xmmword ptr [rip + 0x5ebf75a]
00000001402da2d6  0f1185fc040000         movups xmmword ptr [rbp + 0x4fc], xmm0
00000001402da2dd  f20f10051b99e805       movsd xmm0, qword ptr [rip + 0x5e8991b]
00000001402da2e5  f20f118510050000       movsd qword ptr [rbp + 0x510], xmm0
00000001402da2ed  488b8538070000         mov rax, qword ptr [rbp + 0x738]
00000001402da2f4  48898590040000         mov qword ptr [rbp + 0x490], rax
00000001402da2fb  488d8d30020000         lea rcx, [rbp + 0x230]
00000001402da302  4c8d8590040000         lea r8, [rbp + 0x490]
00000001402da309  488d5518               lea rdx, [rbp + 0x18]
00000001402da30d  e86e51ffff             call 0x1402cf480
00000001402da312  41833e01               cmp dword ptr [r14], 1
00000001402da316  0f8524060000           jne 0x1402da940
00000001402da31c  498b5e08               mov rbx, qword ptr [r14 + 8]
00000001402da320  498b7e10               mov rdi, qword ptr [r14 + 0x10]
00000001402da324  0f57f6                 xorps xmm6, xmm6
00000001402da327  0f29b5d0020000         movaps xmmword ptr [rbp + 0x2d0], xmm6
00000001402da32e  0f29b5c0020000         movaps xmmword ptr [rbp + 0x2c0], xmm6
00000001402da335  0f29b5b0020000         movaps xmmword ptr [rbp + 0x2b0], xmm6
00000001402da33c  0f29b5a0020000         movaps xmmword ptr [rbp + 0x2a0], xmm6
00000001402da343  0f29b590020000         movaps xmmword ptr [rbp + 0x290], xmm6
00000001402da34a  48c785e002000000000000 mov qword ptr [rbp + 0x2e0], 0
00000001402da355  440f103593e7ec05       movups xmm14, xmmword ptr [rip + 0x5ece793]
00000001402da35d  440f29b530020000       movaps xmmword ptr [rbp + 0x230], xmm14
00000001402da365  48c7854002000000000000 mov qword ptr [rbp + 0x240], 0
00000001402da370  440f103d90e7ec05       movups xmm15, xmmword ptr [rip + 0x5ece790]
00000001402da378  440f11bd48020000       movups xmmword ptr [rbp + 0x248], xmm15
00000001402da380  48c7855802000000000000 mov qword ptr [rbp + 0x258], 0
00000001402da38b  0f10058ee7ec05         movups xmm0, xmmword ptr [rip + 0x5ece78e]
00000001402da392  0f298560020000         movaps xmmword ptr [rbp + 0x260], xmm0
00000001402da399  48c7857002000000000000 mov qword ptr [rbp + 0x270], 0
00000001402da3a4  0f10058de7ec05         movups xmm0, xmmword ptr [rip + 0x5ece78d]
00000001402da3ab  0f118578020000         movups xmmword ptr [rbp + 0x278], xmm0
00000001402da3b2  48c7858802000000000000 mov qword ptr [rbp + 0x288], 0
00000001402da3bd  488d8d98040000         lea rcx, [rbp + 0x498]
00000001402da3c4  488d9530020000         lea rdx, [rbp + 0x230]
00000001402da3cb  41b8b8000000           mov r8d, 0xb8
00000001402da3d1  e8059ecb05             call 0x145f941db
00000001402da3d6  0f2805339ae805         movaps xmm0, xmmword ptr [rip + 0x5e89a33]
00000001402da3dd  0f118550050000         movups xmmword ptr [rbp + 0x550], xmm0
00000001402da3e4  0f280535daec05         movaps xmm0, xmmword ptr [rip + 0x5ecda35]
00000001402da3eb  0f118560050000         movups xmmword ptr [rbp + 0x560], xmm0
00000001402da3f2  440f1005cee7ec05       movups xmm8, xmmword ptr [rip + 0x5ece7ce]
00000001402da3fa  440f118570050000       movups xmmword ptr [rbp + 0x570], xmm8
00000001402da402  440f100dcee7ec05       movups xmm9, xmmword ptr [rip + 0x5ece7ce]
00000001402da40a  440f118d80050000       movups xmmword ptr [rbp + 0x580], xmm9
00000001402da412  440f101dcee7ec05       movups xmm11, xmmword ptr [rip + 0x5ece7ce]
00000001402da41a  440f119d90050000       movups xmmword ptr [rbp + 0x590], xmm11
00000001402da422  440f1015cee7ec05       movups xmm10, xmmword ptr [rip + 0x5ece7ce]
00000001402da42a  440f1195a0050000       movups xmmword ptr [rbp + 0x5a0], xmm10
00000001402da432  440f102dcee7ec05       movups xmm13, xmmword ptr [rip + 0x5ece7ce]
00000001402da43a  440f11adb0050000       movups xmmword ptr [rbp + 0x5b0], xmm13
00000001402da442  440f1025cee7ec05       movups xmm12, xmmword ptr [rip + 0x5ece7ce]
00000001402da44a  440f11a5c0050000       movups xmmword ptr [rbp + 0x5c0], xmm12
00000001402da452  0f283de796e805         movaps xmm7, xmmword ptr [rip + 0x5e896e7]
00000001402da459  0f11bdd0050000         movups xmmword ptr [rbp + 0x5d0], xmm7
00000001402da460  c785e005000001000000   mov dword ptr [rbp + 0x5e0], 1
00000001402da46a  f30f10058e99e805       movss xmm0, dword ptr [rip + 0x5e8998e]
00000001402da472  0f1385e4050000         movlps qword ptr [rbp + 0x5e4], xmm0
00000001402da479  c685ec05000001         mov byte ptr [rbp + 0x5ec], 1
00000001402da480  48c785f005000000000000 mov qword ptr [rbp + 0x5f0], 0
00000001402da48b  c785f80500000000803f   mov dword ptr [rbp + 0x5f8], 0x3f800000
00000001402da495  66c785fc0500000000     mov word ptr [rbp + 0x5fc], 0
00000001402da49e  66c785020600000000     mov word ptr [rbp + 0x602], 0
00000001402da4a7  c785fe05000000000100   mov dword ptr [rbp + 0x5fe], 0x10000
00000001402da4b1  c7850406000000000100   mov dword ptr [rbp + 0x604], 0x10000
00000001402da4bb  66c785080600000000     mov word ptr [rbp + 0x608], 0
00000001402da4c4  48c7850a06000000000000 mov qword ptr [rbp + 0x60a], 0
00000001402da4cf  c7851206000005000000   mov dword ptr [rbp + 0x612], 5
00000001402da4d9  488b8538070000         mov rax, qword ptr [rbp + 0x738]
00000001402da4e0  48898590040000         mov qword ptr [rbp + 0x490], rax
00000001402da4e7  488d8df0060000         lea rcx, [rbp + 0x6f0]
00000001402da4ee  4c8d8590040000         lea r8, [rbp + 0x490]
00000001402da4f5  488d5518               lea rdx, [rbp + 0x18]
00000001402da4f9  e872ebfdff             call 0x1402b9070
00000001402da4fe  4c8bb5f0060000         mov r14, qword ptr [rbp + 0x6f0]
00000001402da505  488b8518070000         mov rax, qword ptr [rbp + 0x718]
00000001402da50c  4c89b508040000         mov qword ptr [rbp + 0x408], r14
00000001402da513  488db510040000         lea rsi, [rbp + 0x410]
00000001402da51a  0f1085f8060000         movups xmm0, xmmword ptr [rbp + 0x6f8]
00000001402da521  0f118510040000         movups xmmword ptr [rbp + 0x410], xmm0
00000001402da528  0f108508070000         movups xmm0, xmmword ptr [rbp + 0x708]
00000001402da52f  0f118520040000         movups xmmword ptr [rbp + 0x420], xmm0
00000001402da536  48898530040000         mov qword ptr [rbp + 0x430], rax
00000001402da53d  0f29b5d0020000         movaps xmmword ptr [rbp + 0x2d0], xmm6
00000001402da544  0f29b5c0020000         movaps xmmword ptr [rbp + 0x2c0], xmm6
00000001402da54b  0f29b5b0020000         movaps xmmword ptr [rbp + 0x2b0], xmm6
00000001402da552  0f29b5a0020000         movaps xmmword ptr [rbp + 0x2a0], xmm6
00000001402da559  0f29b590020000         movaps xmmword ptr [rbp + 0x290], xmm6
00000001402da560  48c785e002000000000000 mov qword ptr [rbp + 0x2e0], 0
00000001402da56b  66c785140600000000     mov word ptr [rbp + 0x614], 0
00000001402da574  c7851006000000000000   mov dword ptr [rbp + 0x610], 0
00000001402da57e  0f100523e6ec05         movups xmm0, xmmword ptr [rip + 0x5ece623]
00000001402da585  0f1185e8020000         movups xmmword ptr [rbp + 0x2e8], xmm0
00000001402da58c  0f100525e6ec05         movups xmm0, xmmword ptr [rip + 0x5ece625]
00000001402da593  0f1185f8020000         movups xmmword ptr [rbp + 0x2f8], xmm0
00000001402da59a  440f118508030000       movups xmmword ptr [rbp + 0x308], xmm8
00000001402da5a2  440f118d18030000       movups xmmword ptr [rbp + 0x318], xmm9
00000001402da5aa  440f119538030000       movups xmmword ptr [rbp + 0x338], xmm10
00000001402da5b2  440f119d28030000       movups xmmword ptr [rbp + 0x328], xmm11
00000001402da5ba  440f11a558030000       movups xmmword ptr [rbp + 0x358], xmm12
00000001402da5c2  440f11ad48030000       movups xmmword ptr [rbp + 0x348], xmm13
00000001402da5ca  440f29b530020000       movaps xmmword ptr [rbp + 0x230], xmm14
00000001402da5d2  48c7854002000000000000 mov qword ptr [rbp + 0x240], 0
00000001402da5dd  440f11bd48020000       movups xmmword ptr [rbp + 0x248], xmm15
00000001402da5e5  48c7855802000000000000 mov qword ptr [rbp + 0x258], 0
00000001402da5f0  0f100529e5ec05         movups xmm0, xmmword ptr [rip + 0x5ece529]
00000001402da5f7  0f298560020000         movaps xmmword ptr [rbp + 0x260], xmm0
00000001402da5fe  48c7857002000000000000 mov qword ptr [rbp + 0x270], 0
00000001402da609  0f100528e5ec05         movups xmm0, xmmword ptr [rip + 0x5ece528]
00000001402da610  0f118578020000         movups xmmword ptr [rbp + 0x278], xmm0
00000001402da617  48c7858802000000000000 mov qword ptr [rbp + 0x288], 0
00000001402da622  488d8d98040000         lea rcx, [rbp + 0x498]
00000001402da629  488d9530020000         lea rdx, [rbp + 0x230]
00000001402da630  41b838010000           mov r8d, 0x138
00000001402da636  e8a09bcb05             call 0x145f941db
00000001402da63b  0f11bdd0050000         movups xmmword ptr [rbp + 0x5d0], xmm7
00000001402da642  c785e005000001000000   mov dword ptr [rbp + 0x5e0], 1
00000001402da64c  48c785e405000000000000 mov qword ptr [rbp + 0x5e4], 0
00000001402da657  c685ec05000001         mov byte ptr [rbp + 0x5ec], 1
00000001402da65e  f20f1005cafde905       movsd xmm0, qword ptr [rip + 0x5e9fdca]
00000001402da666  f20f1185f0050000       movsd qword ptr [rbp + 0x5f0], xmm0
00000001402da66e  c785f80500000000803f   mov dword ptr [rbp + 0x5f8], 0x3f800000
00000001402da678  66c785fc0500000000     mov word ptr [rbp + 0x5fc], 0
00000001402da681  c785fe05000000000100   mov dword ptr [rbp + 0x5fe], 0x10000
00000001402da68b  66c785020600000000     mov word ptr [rbp + 0x602], 0
00000001402da694  c7850406000000000100   mov dword ptr [rbp + 0x604], 0x10000
00000001402da69e  66c785080600000000     mov word ptr [rbp + 0x608], 0
00000001402da6a7  c7850a06000000000000   mov dword ptr [rbp + 0x60a], 0
00000001402da6b1  66c7850e0600000100     mov word ptr [rbp + 0x60e], 1
00000001402da6ba  4c89b590040000         mov qword ptr [rbp + 0x490], r14
00000001402da6c1  488d4d70               lea rcx, [rbp + 0x70]
00000001402da6c5  4c8d8590040000         lea r8, [rbp + 0x490]
00000001402da6cc  4889f2                 mov rdx, rsi
00000001402da6cf  e89ce9fdff             call 0x1402b9070
00000001402da6d4  488b4570               mov rax, qword ptr [rbp + 0x70]
00000001402da6d8  488b8d98000000         mov rcx, qword ptr [rbp + 0x98]
00000001402da6df  48898590040000         mov qword ptr [rbp + 0x490], rax
00000001402da6e6  0f104578               movups xmm0, xmmword ptr [rbp + 0x78]
00000001402da6ea  0f118598040000         movups xmmword ptr [rbp + 0x498], xmm0
00000001402da6f1  0f108588000000         movups xmm0, xmmword ptr [rbp + 0x88]
00000001402da6f8  0f1185a8040000         movups xmmword ptr [rbp + 0x4a8], xmm0
00000001402da6ff  48898db8040000         mov qword ptr [rbp + 0x4b8], rcx
00000001402da706  4885db                 test rbx, rbx
00000001402da709  7826                   js 0x1402da731
00000001402da70b  f3480f2ad3             cvtsi2ss xmm2, rbx
00000001402da710  4885ff                 test rdi, rdi
00000001402da713  7938                   jns 0x1402da74d
00000001402da715  4889f8                 mov rax, rdi
00000001402da718  48d1e8                 shr rax, 1
00000001402da71b  89f9                   mov ecx, edi
00000001402da71d  83e101                 and ecx, 1
00000001402da720  4809c1                 or rcx, rax
00000001402da723  0f57c0                 xorps xmm0, xmm0
00000001402da726  f3480f2ac1             cvtsi2ss xmm0, rcx
00000001402da72b  f30f58c0               addss xmm0, xmm0
00000001402da72f  eb24                   jmp 0x1402da755
00000001402da731  4889d8                 mov rax, rbx
00000001402da734  48d1e8                 shr rax, 1
00000001402da737  89d9                   mov ecx, ebx
00000001402da739  83e101                 and ecx, 1
00000001402da73c  4809c1                 or rcx, rax
00000001402da73f  f3480f2ad1             cvtsi2ss xmm2, rcx
00000001402da744  f30f58d2               addss xmm2, xmm2
00000001402da748  4885ff                 test rdi, rdi
00000001402da74b  78c8                   js 0x1402da715
00000001402da74d  0f57c0                 xorps xmm0, xmm0
00000001402da750  f3480f2ac7             cvtsi2ss xmm0, rdi
00000001402da755  f30f5ed0               divss xmm2, xmm0
00000001402da759  488d8d90040000         lea rcx, [rbp + 0x490]
00000001402da760  f30f101dd099e805       movss xmm3, dword ptr [rip + 0x5e899d0]
00000001402da768  488b9528070000         mov rdx, qword ptr [rbp + 0x728]
00000001402da76f  e8bc95f8ff             call 0x140263d30
00000001402da774  4839df                 cmp rdi, rbx
00000001402da777  480f42df               cmovb rbx, rdi
00000001402da77b  4c8d7d70               lea r15, [rbp + 0x70]
00000001402da77f  4c89f9                 mov rcx, r15
00000001402da782  4889da                 mov rdx, rbx
00000001402da785  e8b6d3f8ff             call 0x140267b40
00000001402da78a  90                     nop
00000001402da78b  488d9d30020000         lea rbx, [rbp + 0x230]
00000001402da792  4889d9                 mov rcx, rbx
00000001402da795  4889fa                 mov rdx, rdi
00000001402da798  e8a3d3f8ff             call 0x140267b40
00000001402da79d  90                     nop
00000001402da79e  4c89bd90040000         mov qword ptr [rbp + 0x490], r15
00000001402da7a5  488d053479d2ff         lea rax, [rip - 0x2d86cc]
00000001402da7ac  48898598040000         mov qword ptr [rbp + 0x498], rax
00000001402da7b3  48899da0040000         mov qword ptr [rbp + 0x4a0], rbx
00000001402da7ba  488985a8040000         mov qword ptr [rbp + 0x4a8], rax
00000001402da7c1  488d15b4e7ec05         lea rdx, [rip + 0x5ece7b4]
00000001402da7c8  488d4de0               lea rcx, [rbp - 0x20]
00000001402da7cc  4c8d8590040000         lea r8, [rbp + 0x490]
00000001402da7d3  e858c7c805             call 0x145f66f30
00000001402da7d8  90                     nop
00000001402da7d9  488b9530020000         mov rdx, qword ptr [rbp + 0x230]
00000001402da7e0  4885d2                 test rdx, rdx
00000001402da7e3  4c8bbd48070000         mov r15, qword ptr [rbp + 0x748]
00000001402da7ea  7412                   je 0x1402da7fe
00000001402da7ec  488b8d38020000         mov rcx, qword ptr [rbp + 0x238]
00000001402da7f3  41b801000000           mov r8d, 1
00000001402da7f9  e8d279d2ff             call 0x1400021d0
00000001402da7fe  488b5570               mov rdx, qword ptr [rbp + 0x70]
00000001402da802  4885d2                 test rdx, rdx
00000001402da805  740f                   je 0x1402da816
00000001402da807  488b4d78               mov rcx, qword ptr [rbp + 0x78]
00000001402da80b  41b801000000           mov r8d, 1
00000001402da811  e8ba79d2ff             call 0x1400021d0
00000001402da816  41803f01               cmp byte ptr [r15], 1
00000001402da81a  7521                   jne 0x1402da83d
00000001402da81c  418b4701               mov eax, dword ptr [r15 + 1]
00000001402da820  418b4f04               mov ecx, dword ptr [r15 + 4]
00000001402da824  898d33020000           mov dword ptr [rbp + 0x233], ecx
00000001402da82a  898530020000           mov dword ptr [rbp + 0x230], eax
00000001402da830  498b4708               mov rax, qword ptr [r15 + 8]
00000001402da834  410fb65710             movzx edx, byte ptr [r15 + 0x10]
00000001402da839  b101                   mov cl, 1
00000001402da83b  eb10                   jmp 0x1402da84d
00000001402da83d  498b4708               mov rax, qword ptr [r15 + 8]
00000001402da841  f048ff00               lock inc qword ptr [rax]
00000001402da845  0f8e550d0000           jle 0x1402db5a0
00000001402da84b  31c9                   xor ecx, ecx
00000001402da84d  4c8b45f0               mov r8, qword ptr [rbp - 0x10]
00000001402da851  4c8985a8040000         mov qword ptr [rbp + 0x4a8], r8
00000001402da858  0f1045e0               movups xmm0, xmmword ptr [rbp - 0x20]
00000001402da85c  0f118598040000         movups xmmword ptr [rbp + 0x498], xmm0
00000001402da863  448b8530020000         mov r8d, dword ptr [rbp + 0x230]
00000001402da86a  448b8d33020000         mov r9d, dword ptr [rbp + 0x233]
00000001402da871  448985c9040000         mov dword ptr [rbp + 0x4c9], r8d
00000001402da878  44898dcc040000         mov dword ptr [rbp + 0x4cc], r9d
00000001402da87f  0f100526e2ec05         movups xmm0, xmmword ptr [rip + 0x5ece226]
00000001402da886  0f114571               movups xmmword ptr [rbp + 0x71], xmm0
00000001402da88a  c785810000000000803f   mov dword ptr [rbp + 0x81], 0x3f800000
00000001402da894  48c785b004000000000000 mov qword ptr [rbp + 0x4b0], 0
00000001402da89f  48c785b804000004000000 mov qword ptr [rbp + 0x4b8], 4
00000001402da8aa  48c785c004000000000000 mov qword ptr [rbp + 0x4c0], 0
00000001402da8b5  888dc8040000           mov byte ptr [rbp + 0x4c8], cl
00000001402da8bb  488985d0040000         mov qword ptr [rbp + 0x4d0], rax
00000001402da8c2  488995d8040000         mov qword ptr [rbp + 0x4d8], rdx
00000001402da8c9  c785e004000000003041   mov dword ptr [rbp + 0x4e0], 0x41300000
00000001402da8d3  66c785e40400009001     mov word ptr [rbp + 0x4e4], 0x190
00000001402da8dc  c685e604000001         mov byte ptr [rbp + 0x4e6], 1
00000001402da8e3  488b457d               mov rax, qword ptr [rbp + 0x7d]
00000001402da8e7  488985f4040000         mov qword ptr [rbp + 0x4f4], rax
00000001402da8ee  0f104570               movups xmm0, xmmword ptr [rbp + 0x70]
00000001402da8f2  0f1185e7040000         movups xmmword ptr [rbp + 0x4e7], xmm0
00000001402da8f9  8b0541f1eb05           mov eax, dword ptr [rip + 0x5ebf141]
00000001402da8ff  89850c050000           mov dword ptr [rbp + 0x50c], eax
00000001402da905  0f100524f1eb05         movups xmm0, xmmword ptr [rip + 0x5ebf124]
00000001402da90c  0f1185fc040000         movups xmmword ptr [rbp + 0x4fc], xmm0
00000001402da913  f20f1005e592e805       movsd xmm0, qword ptr [rip + 0x5e892e5]
00000001402da91b  f20f118510050000       movsd qword ptr [rbp + 0x510], xmm0
00000001402da923  4c89b590040000         mov qword ptr [rbp + 0x490], r14
00000001402da92a  488d8d30020000         lea rcx, [rbp + 0x230]
00000001402da931  4c8d8590040000         lea r8, [rbp + 0x490]
00000001402da938  4889f2                 mov rdx, rsi
00000001402da93b  e8404bffff             call 0x1402cf480
00000001402da940  498b442410             mov rax, qword ptr [r12 + 0x10]
00000001402da945  4885c0                 test rax, rax
00000001402da948  0f84f4060000           je 0x1402db042
00000001402da94e  498b5c2408             mov rbx, qword ptr [r12 + 8]
00000001402da953  48c1e004               shl rax, 4
00000001402da957  488d3c40               lea rdi, [rax + rax*2]
00000001402da95b  4c8db5f8040000         lea r14, [rbp + 0x4f8]
00000001402da962  488db548020000         lea rsi, [rbp + 0x248]
00000001402da969  498d4701               lea rax, [r15 + 1]
00000001402da96d  488985f8010000         mov qword ptr [rbp + 0x1f8], rax
00000001402da974  450f57e4               xorps xmm12, xmm12
00000001402da978  4c8da530020000         lea r12, [rbp + 0x230]
00000001402da97f  4c8dad90040000         lea r13, [rbp + 0x490]
00000001402da986  0f283d03a1e905         movaps xmm7, xmmword ptr [rip + 0x5e9a103]
00000001402da98d  440f100553e4ec05       movups xmm8, xmmword ptr [rip + 0x5ece453]
00000001402da995  e938010000             jmp 0x1402daad2
00000001402da99a  660f1f440000           nop word ptr [rax + rax]
00000001402da9a0  488b8df8010000         mov rcx, qword ptr [rbp + 0x1f8]
00000001402da9a7  8b01                   mov eax, dword ptr [rcx]
00000001402da9a9  8b4903                 mov ecx, dword ptr [rcx + 3]
00000001402da9ac  898d1b020000           mov dword ptr [rbp + 0x21b], ecx
00000001402da9b2  898518020000           mov dword ptr [rbp + 0x218], eax
00000001402da9b8  498b4708               mov rax, qword ptr [r15 + 8]
00000001402da9bc  410fb65710             movzx edx, byte ptr [r15 + 0x10]
00000001402da9c1  b101                   mov cl, 1
00000001402da9c3  4883c330               add rbx, 0x30
00000001402da9c7  4c8b8580000000         mov r8, qword ptr [rbp + 0x80]
00000001402da9ce  4c8d8d98040000         lea r9, [rbp + 0x498]
00000001402da9d5  4d894110               mov qword ptr [r9 + 0x10], r8
00000001402da9d9  0f104570               movups xmm0, xmmword ptr [rbp + 0x70]
00000001402da9dd  410f1101               movups xmmword ptr [r9], xmm0
00000001402da9e1  448b8518020000         mov r8d, dword ptr [rbp + 0x218]
00000001402da9e8  448b8d1b020000         mov r9d, dword ptr [rbp + 0x21b]
00000001402da9ef  45894ed4               mov dword ptr [r14 - 0x2c], r9d
00000001402da9f3  458946d1               mov dword ptr [r14 - 0x2f], r8d
00000001402da9f7  448b8540020000         mov r8d, dword ptr [rbp + 0x240]
00000001402da9fe  4c8d8d27040000         lea r9, [rbp + 0x427]
00000001402daa05  458941f2               mov dword ptr [r9 - 0xe], r8d
00000001402daa09  0f288530020000         movaps xmm0, xmmword ptr [rbp + 0x230]
00000001402daa10  410f1141e2             movups xmmword ptr [r9 - 0x1e], xmm0
00000001402daa15  48c785b004000000000000 mov qword ptr [rbp + 0x4b0], 0
00000001402daa20  48c785b804000004000000 mov qword ptr [rbp + 0x4b8], 4
00000001402daa2b  48c785c004000000000000 mov qword ptr [rbp + 0x4c0], 0
00000001402daa36  888dc8040000           mov byte ptr [rbp + 0x4c8], cl
00000001402daa3c  488985d0040000         mov qword ptr [rbp + 0x4d0], rax
00000001402daa43  488995d8040000         mov qword ptr [rbp + 0x4d8], rdx
00000001402daa4a  c785e004000000004041   mov dword ptr [rbp + 0x4e0], 0x41400000
00000001402daa54  66c785e40400009001     mov word ptr [rbp + 0x4e4], 0x190
00000001402daa5d  c685e604000001         mov byte ptr [rbp + 0x4e6], 1
00000001402daa64  488b8515040000         mov rax, qword ptr [rbp + 0x415]
00000001402daa6b  498946fc               mov qword ptr [r14 - 4], rax
00000001402daa6f  0f108508040000         movups xmm0, xmmword ptr [rbp + 0x408]
00000001402daa76  410f1146ef             movups xmmword ptr [r14 - 0x11], xmm0
00000001402daa7b  8b05bfefeb05           mov eax, dword ptr [rip + 0x5ebefbf]
00000001402daa81  41894614               mov dword ptr [r14 + 0x14], eax
00000001402daa85  0f1005a4efeb05         movups xmm0, xmmword ptr [rip + 0x5ebefa4]
00000001402daa8c  410f114604             movups xmmword ptr [r14 + 4], xmm0
00000001402daa91  f20f10056791e805       movsd xmm0, qword ptr [rip + 0x5e89167]
00000001402daa99  f20f118510050000       movsd qword ptr [rbp + 0x510], xmm0
00000001402daaa1  488b8550070000         mov rax, qword ptr [rbp + 0x750]
00000001402daaa8  48898590040000         mov qword ptr [rbp + 0x490], rax
00000001402daaaf  4c8da530020000         lea r12, [rbp + 0x230]
00000001402daab6  4c89e1                 mov rcx, r12
00000001402daab9  488d95f8060000         lea rdx, [rbp + 0x6f8]
00000001402daac0  4d89e8                 mov r8, r13
00000001402daac3  e8b849ffff             call 0x1402cf480
00000001402daac8  4883c7d0               add rdi, -0x30
00000001402daacc  0f8470050000           je 0x1402db042
00000001402daad2  440f11a688000000       movups xmmword ptr [rsi + 0x88], xmm12
00000001402daada  440f116678             movups xmmword ptr [rsi + 0x78], xmm12
00000001402daadf  440f116668             movups xmmword ptr [rsi + 0x68], xmm12
00000001402daae4  440f116658             movups xmmword ptr [rsi + 0x58], xmm12
00000001402daae9  440f116648             movups xmmword ptr [rsi + 0x48], xmm12
00000001402daaee  48c7869800000000000000 mov qword ptr [rsi + 0x98], 0
00000001402daaf9  440f101defdfec05       movups xmm11, xmmword ptr [rip + 0x5ecdfef]
00000001402dab01  440f299d30020000       movaps xmmword ptr [rbp + 0x230], xmm11
00000001402dab09  48c7854002000000000000 mov qword ptr [rbp + 0x240], 0
00000001402dab14  440f1015ecdfec05       movups xmm10, xmmword ptr [rip + 0x5ecdfec]
00000001402dab1c  440f1116               movups xmmword ptr [rsi], xmm10
00000001402dab20  48c7461000000000       mov qword ptr [rsi + 0x10], 0
00000001402dab28  440f1035f0dfec05       movups xmm14, xmmword ptr [rip + 0x5ecdff0]
00000001402dab30  440f117618             movups xmmword ptr [rsi + 0x18], xmm14
00000001402dab35  48c7462800000000       mov qword ptr [rsi + 0x28], 0
00000001402dab3d  440f103df3dfec05       movups xmm15, xmmword ptr [rip + 0x5ecdff3]
00000001402dab45  440f117e30             movups xmmword ptr [rsi + 0x30], xmm15
00000001402dab4a  48c7464000000000       mov qword ptr [rsi + 0x40], 0
00000001402dab52  41b8b8000000           mov r8d, 0xb8
00000001402dab58  488d8d98040000         lea rcx, [rbp + 0x498]
00000001402dab5f  4c89e2                 mov rdx, r12
00000001402dab62  e87496cb05             call 0x145f941db
00000001402dab67  0f2805a292e805         movaps xmm0, xmmword ptr [rip + 0x5e892a2]
00000001402dab6e  0f118550050000         movups xmmword ptr [rbp + 0x550], xmm0
00000001402dab75  0f2805b4d2ec05         movaps xmm0, xmmword ptr [rip + 0x5ecd2b4]
00000001402dab7c  0f118560050000         movups xmmword ptr [rbp + 0x560], xmm0
00000001402dab83  440f100d4de0ec05       movups xmm9, xmmword ptr [rip + 0x5ece04d]
00000001402dab8b  450f118e88000000       movups xmmword ptr [r14 + 0x88], xmm9
00000001402dab93  440f102d2de0ec05       movups xmm13, xmmword ptr [rip + 0x5ece02d]
00000001402dab9b  450f116e78             movups xmmword ptr [r14 + 0x78], xmm13
00000001402daba0  0f100551e0ec05         movups xmm0, xmmword ptr [rip + 0x5ece051]
00000001402daba7  410f1186a8000000       movups xmmword ptr [r14 + 0xa8], xmm0
00000001402dabaf  0f100532e0ec05         movups xmm0, xmmword ptr [rip + 0x5ece032]
00000001402dabb6  410f118698000000       movups xmmword ptr [r14 + 0x98], xmm0
00000001402dabbe  0f100543e0ec05         movups xmm0, xmmword ptr [rip + 0x5ece043]
00000001402dabc5  410f1186b8000000       movups xmmword ptr [r14 + 0xb8], xmm0
00000001402dabcd  0f100544e0ec05         movups xmm0, xmmword ptr [rip + 0x5ece044]
00000001402dabd4  410f1186c8000000       movups xmmword ptr [r14 + 0xc8], xmm0
00000001402dabdc  0f28355d8fe805         movaps xmm6, xmmword ptr [rip + 0x5e88f5d]
00000001402dabe3  0f11b5d0050000         movups xmmword ptr [rbp + 0x5d0], xmm6
00000001402dabea  c785e005000001000000   mov dword ptr [rbp + 0x5e0], 1
00000001402dabf4  f30f10052492e805       movss xmm0, dword ptr [rip + 0x5e89224]
00000001402dabfc  0f1385e4050000         movlps qword ptr [rbp + 0x5e4], xmm0
00000001402dac03  c685ec05000001         mov byte ptr [rbp + 0x5ec], 1
00000001402dac0a  48c785f005000000000000 mov qword ptr [rbp + 0x5f0], 0
00000001402dac15  c785f80500000000803f   mov dword ptr [rbp + 0x5f8], 0x3f800000
00000001402dac1f  66c785fc0500000000     mov word ptr [rbp + 0x5fc], 0
00000001402dac28  41c7860601000000000100 mov dword ptr [r14 + 0x106], 0x10000
00000001402dac33  6641c7860a0100000000   mov word ptr [r14 + 0x10a], 0
00000001402dac3d  6641c786100100000000   mov word ptr [r14 + 0x110], 0
00000001402dac47  41c7860c01000000000100 mov dword ptr [r14 + 0x10c], 0x10000
00000001402dac52  48c7850a06000000000000 mov qword ptr [rbp + 0x60a], 0
00000001402dac5d  c7851206000005000000   mov dword ptr [rbp + 0x612], 5
00000001402dac67  488b8538070000         mov rax, qword ptr [rbp + 0x738]
00000001402dac6e  48898590040000         mov qword ptr [rbp + 0x490], rax
00000001402dac75  488d4de0               lea rcx, [rbp - 0x20]
00000001402dac79  488d5518               lea rdx, [rbp + 0x18]
00000001402dac7d  4d89ec                 mov r12, r13
00000001402dac80  4d89e8                 mov r8, r13
00000001402dac83  e8e8e3fdff             call 0x1402b9070
00000001402dac88  488b4de0               mov rcx, qword ptr [rbp - 0x20]
00000001402dac8c  488b4508               mov rax, qword ptr [rbp + 8]
00000001402dac90  48898d50070000         mov qword ptr [rbp + 0x750], rcx
00000001402dac97  48898df0060000         mov qword ptr [rbp + 0x6f0], rcx
00000001402dac9e  0f1045e8               movups xmm0, xmmword ptr [rbp - 0x18]
00000001402daca2  0f1185f8060000         movups xmmword ptr [rbp + 0x6f8], xmm0
00000001402daca9  0f1045f8               movups xmm0, xmmword ptr [rbp - 8]
00000001402dacad  0f118508070000         movups xmmword ptr [rbp + 0x708], xmm0
00000001402dacb4  48898518070000         mov qword ptr [rbp + 0x718], rax
00000001402dacbb  66c785f40500000000     mov word ptr [rbp + 0x5f4], 0
00000001402dacc4  c685e405000001         mov byte ptr [rbp + 0x5e4], 1
00000001402daccb  450f116610             movups xmmword ptr [r14 + 0x10], xmm12
00000001402dacd0  450f1126               movups xmmword ptr [r14], xmm12
00000001402dacd4  0f28052594e805         movaps xmm0, xmmword ptr [rip + 0x5e89425]
00000001402dacdb  0f118518050000         movups xmmword ptr [rbp + 0x518], xmm0
00000001402dace2  48c785f004000000000000 mov qword ptr [rbp + 0x4f0], 0
00000001402daced  450f116640             movups xmmword ptr [r14 + 0x40], xmm12
00000001402dacf2  450f116630             movups xmmword ptr [r14 + 0x30], xmm12
00000001402dacf7  6641c786140100000000   mov word ptr [r14 + 0x114], 0
00000001402dad01  41c7861001000000000000 mov dword ptr [r14 + 0x110], 0
00000001402dad0c  0f1005a5deec05         movups xmm0, xmmword ptr [rip + 0x5ecdea5]
00000001402dad13  410f114660             movups xmmword ptr [r14 + 0x60], xmm0
00000001402dad18  0f100589deec05         movups xmm0, xmmword ptr [rip + 0x5ecde89]
00000001402dad1f  410f114650             movups xmmword ptr [r14 + 0x50], xmm0
00000001402dad24  450f116e70             movups xmmword ptr [r14 + 0x70], xmm13
00000001402dad29  450f118e80000000       movups xmmword ptr [r14 + 0x80], xmm9
00000001402dad31  0f2805b88ee805         movaps xmm0, xmmword ptr [rip + 0x5e88eb8]
00000001402dad38  0f118588050000         movups xmmword ptr [rbp + 0x588], xmm0
00000001402dad3f  0f118598050000         movups xmmword ptr [rbp + 0x598], xmm0
00000001402dad46  0f11bda8050000         movups xmmword ptr [rbp + 0x5a8], xmm7
00000001402dad4d  0f11bdb8050000         movups xmmword ptr [rbp + 0x5b8], xmm7
00000001402dad54  66c785060600000000     mov word ptr [rbp + 0x606], 0
00000001402dad5d  c7850206000000000000   mov dword ptr [rbp + 0x602], 0
00000001402dad67  48c785e805000000000000 mov qword ptr [rbp + 0x5e8], 0
00000001402dad72  c785f00500000000803f   mov dword ptr [rbp + 0x5f0], 0x3f800000
00000001402dad7c  0f11b5c8050000         movups xmmword ptr [rbp + 0x5c8], xmm6
00000001402dad83  c785d805000001000000   mov dword ptr [rbp + 0x5d8], 1
00000001402dad8d  48c785dc05000000000000 mov qword ptr [rbp + 0x5dc], 0
00000001402dad98  440f299d90040000       movaps xmmword ptr [rbp + 0x490], xmm11
00000001402dada0  48c785a004000000000000 mov qword ptr [rbp + 0x4a0], 0
00000001402dadab  450f1156b0             movups xmmword ptr [r14 - 0x50], xmm10
00000001402dadb0  49c746c000000000       mov qword ptr [r14 - 0x40], 0
00000001402dadb8  450f1176c8             movups xmmword ptr [r14 - 0x38], xmm14
00000001402dadbd  49c746d800000000       mov qword ptr [r14 - 0x28], 0
00000001402dadc5  450f117ee0             movups xmmword ptr [r14 - 0x20], xmm15
00000001402dadca  49c746f000000000       mov qword ptr [r14 - 0x10], 0
00000001402dadd2  41c786fe00000000000100 mov dword ptr [r14 + 0xfe], 0x10000
00000001402daddd  6641c786020100000000   mov word ptr [r14 + 0x102], 0
00000001402dade7  6641c786080100000000   mov word ptr [r14 + 0x108], 0
00000001402dadf1  41c7860401000000000100 mov dword ptr [r14 + 0x104], 0x10000
00000001402dadfc  440f294570             movaps xmmword ptr [rbp + 0x70], xmm8
00000001402dae01  c785800000000000803f   mov dword ptr [rbp + 0x80], 0x3f800000
00000001402dae0b  488d8584000000         lea rax, [rbp + 0x84]
00000001402dae12  440f1100               movups xmmword ptr [rax], xmm8
00000001402dae16  c740100000803f         mov dword ptr [rax + 0x10], 0x3f800000
00000001402dae1d  440f114014             movups xmmword ptr [rax + 0x14], xmm8
00000001402dae22  c740240000803f         mov dword ptr [rax + 0x24], 0x3f800000
00000001402dae29  440f114028             movups xmmword ptr [rax + 0x28], xmm8
00000001402dae2e  c740380000803f         mov dword ptr [rax + 0x38], 0x3f800000
00000001402dae35  4c8b4320               mov r8, qword ptr [rbx + 0x20]
00000001402dae39  4c8b4b28               mov r9, qword ptr [rbx + 0x28]
00000001402dae3d  488d8d18020000         lea rcx, [rbp + 0x218]
00000001402dae44  488b9528070000         mov rdx, qword ptr [rbp + 0x728]
00000001402dae4b  e840b8f5ff             call 0x140236690
00000001402dae50  90                     nop
00000001402dae51  4889bd40070000         mov qword ptr [rbp + 0x740], rdi
00000001402dae58  488b8500040000         mov rax, qword ptr [rbp + 0x400]
00000001402dae5f  440fb638               movzx r15d, byte ptr [rax]
00000001402dae63  f30f1005298de805       movss xmm0, dword ptr [rip + 0x5e88d29]
00000001402dae6b  4585ff                 test r15d, r15d
00000001402dae6e  7508                   jne 0x1402dae78
00000001402dae70  f30f1005a892e805       movss xmm0, dword ptr [rip + 0x5e892a8]
00000001402dae78  440f282db0f5e905       movaps xmm13, xmmword ptr [rip + 0x5e9f5b0]
00000001402dae80  f3440f10e8             movss xmm13, xmm0
00000001402dae85  488b8528020000         mov rax, qword ptr [rbp + 0x228]
00000001402dae8c  488d8d27040000         lea rcx, [rbp + 0x427]
00000001402dae93  48894110               mov qword ptr [rcx + 0x10], rax
00000001402dae97  0f108518020000         movups xmm0, xmmword ptr [rbp + 0x218]
00000001402dae9e  0f1101                 movups xmmword ptr [rcx], xmm0
00000001402daea1  41b880010000           mov r8d, 0x180
00000001402daea7  488dbd30020000         lea rdi, [rbp + 0x230]
00000001402daeae  4889f9                 mov rcx, rdi
00000001402daeb1  4c89e2                 mov rdx, r12
00000001402daeb4  e82293cb05             call 0x145f941db
00000001402daeb9  0f284570               movaps xmm0, xmmword ptr [rbp + 0x70]
00000001402daebd  0f288d80000000         movaps xmm1, xmmword ptr [rbp + 0x80]
00000001402daec4  0f289590000000         movaps xmm2, xmmword ptr [rbp + 0x90]
00000001402daecb  0f289da0000000         movaps xmm3, xmmword ptr [rbp + 0xa0]
00000001402daed2  0f118668010000         movups xmmword ptr [rsi + 0x168], xmm0
00000001402daed9  0f118e78010000         movups xmmword ptr [rsi + 0x178], xmm1
00000001402daee0  0f119688010000         movups xmmword ptr [rsi + 0x188], xmm2
00000001402daee7  0f119e98010000         movups xmmword ptr [rsi + 0x198], xmm3
00000001402daeee  0f2885b0000000         movaps xmm0, xmmword ptr [rbp + 0xb0]
00000001402daef5  0f1186a8010000         movups xmmword ptr [rsi + 0x1a8], xmm0
00000001402daefc  41b8d0010000           mov r8d, 0x1d0
00000001402daf02  488d8d98040000         lea rcx, [rbp + 0x498]
00000001402daf09  4889fa                 mov rdx, rdi
00000001402daf0c  e8ca92cb05             call 0x145f941db
00000001402daf11  c6856806000002         mov byte ptr [rbp + 0x668], 2
00000001402daf18  0f108508040000         movups xmm0, xmmword ptr [rbp + 0x408]
00000001402daf1f  0f108d18040000         movups xmm1, xmmword ptr [rbp + 0x418]
00000001402daf26  0f109528040000         movups xmm2, xmmword ptr [rbp + 0x428]
00000001402daf2d  410f118671010000       movups xmmword ptr [r14 + 0x171], xmm0
00000001402daf35  410f118e81010000       movups xmmword ptr [r14 + 0x181], xmm1
00000001402daf3d  410f119691010000       movups xmmword ptr [r14 + 0x191], xmm2
00000001402daf45  488b8537040000         mov rax, qword ptr [rbp + 0x437]
00000001402daf4c  498986a0010000         mov qword ptr [r14 + 0x1a0], rax
00000001402daf53  4489bda0060000         mov dword ptr [rbp + 0x6a0], r15d
00000001402daf5a  450fc6ed40             shufps xmm13, xmm13, 0x40
00000001402daf5f  440f11ada4060000       movups xmmword ptr [rbp + 0x6a4], xmm13
00000001402daf67  c785b406000002000000   mov dword ptr [rbp + 0x6b4], 2
00000001402daf71  c785d806000000000000   mov dword ptr [rbp + 0x6d8], 0
00000001402daf7b  66c785ec0600000000     mov word ptr [rbp + 0x6ec], 0
00000001402daf84  488b8550070000         mov rax, qword ptr [rbp + 0x750]
00000001402daf8b  48898590040000         mov qword ptr [rbp + 0x490], rax
00000001402daf92  488d4d70               lea rcx, [rbp + 0x70]
00000001402daf96  488d95f8060000         lea rdx, [rbp + 0x6f8]
00000001402daf9d  4d89e0                 mov r8, r12
00000001402dafa0  e86b01feff             call 0x1402bb110
00000001402dafa5  4585ff                 test r15d, r15d
00000001402dafa8  7416                   je 0x1402dafc0
00000001402dafaa  0f1005b7dfec05         movups xmm0, xmmword ptr [rip + 0x5ecdfb7]
00000001402dafb1  eb14                   jmp 0x1402dafc7
00000001402dafb3  666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
00000001402dafc0  0f1005bddfec05         movups xmm0, xmmword ptr [rip + 0x5ecdfbd]
00000001402dafc7  0f298530020000         movaps xmmword ptr [rbp + 0x230], xmm0
00000001402dafce  c785400200000000803f   mov dword ptr [rbp + 0x240], 0x3f800000
00000001402dafd8  4c8bbd48070000         mov r15, qword ptr [rbp + 0x748]
00000001402dafdf  488bbd40070000         mov rdi, qword ptr [rbp + 0x740]
00000001402dafe6  488d4310               lea rax, [rbx + 0x10]
00000001402dafea  48899d90040000         mov qword ptr [rbp + 0x490], rbx
00000001402daff1  488d0dc870d2ff         lea rcx, [rip - 0x2d8f38]
00000001402daff8  48898d98040000         mov qword ptr [rbp + 0x498], rcx
00000001402dafff  488985a0040000         mov qword ptr [rbp + 0x4a0], rax
00000001402db006  48898da8040000         mov qword ptr [rbp + 0x4a8], rcx
00000001402db00d  488d4d70               lea rcx, [rbp + 0x70]
00000001402db011  488d1580dfec05         lea rdx, [rip + 0x5ecdf80]
00000001402db018  4d89e5                 mov r13, r12
00000001402db01b  4d89e0                 mov r8, r12
00000001402db01e  e80dbfc805             call 0x145f66f30
00000001402db023  41803f01               cmp byte ptr [r15], 1
00000001402db027  0f8473f9ffff           je 0x1402da9a0
00000001402db02d  498b4708               mov rax, qword ptr [r15 + 8]
00000001402db031  f048ff00               lock inc qword ptr [rax]
00000001402db035  0f8e65050000           jle 0x1402db5a0
00000001402db03b  31c9                   xor ecx, ecx
00000001402db03d  e981f9ffff             jmp 0x1402da9c3
00000001402db042  0f57c0                 xorps xmm0, xmm0
00000001402db045  0f118510050000         movups xmmword ptr [rbp + 0x510], xmm0
00000001402db04c  0f118500050000         movups xmmword ptr [rbp + 0x500], xmm0
00000001402db053  0f118528050000         movups xmmword ptr [rbp + 0x528], xmm0
00000001402db05a  0f118538050000         movups xmmword ptr [rbp + 0x538], xmm0
00000001402db061  48c7854805000000000000 mov qword ptr [rbp + 0x548], 0
00000001402db06c  0f10057ddaec05         movups xmm0, xmmword ptr [rip + 0x5ecda7d]
00000001402db073  0f298530020000         movaps xmmword ptr [rbp + 0x230], xmm0
00000001402db07a  48c7854002000000000000 mov qword ptr [rbp + 0x240], 0
00000001402db085  0f10057cdaec05         movups xmm0, xmmword ptr [rip + 0x5ecda7c]
00000001402db08c  0f118548020000         movups xmmword ptr [rbp + 0x248], xmm0
00000001402db093  48c7855802000000000000 mov qword ptr [rbp + 0x258], 0
00000001402db09e  0f10057bdaec05         movups xmm0, xmmword ptr [rip + 0x5ecda7b]
00000001402db0a5  0f298560020000         movaps xmmword ptr [rbp + 0x260], xmm0
00000001402db0ac  48c7857002000000000000 mov qword ptr [rbp + 0x270], 0
00000001402db0b7  0f10057adaec05         movups xmm0, xmmword ptr [rip + 0x5ecda7a]
00000001402db0be  0f118578020000         movups xmmword ptr [rbp + 0x278], xmm0
00000001402db0c5  48c7858802000000000000 mov qword ptr [rbp + 0x288], 0
00000001402db0d0  488b4540               mov rax, qword ptr [rbp + 0x40]
00000001402db0d4  488b8d80020000         mov rcx, qword ptr [rbp + 0x280]
00000001402db0db  48898de8040000         mov qword ptr [rbp + 0x4e8], rcx
00000001402db0e2  488b8d88020000         mov rcx, qword ptr [rbp + 0x288]
00000001402db0e9  48898df0040000         mov qword ptr [rbp + 0x4f0], rcx
00000001402db0f0  488b8d70020000         mov rcx, qword ptr [rbp + 0x270]
00000001402db0f7  48898dd8040000         mov qword ptr [rbp + 0x4d8], rcx
00000001402db0fe  488b8d78020000         mov rcx, qword ptr [rbp + 0x278]
00000001402db105  48898de0040000         mov qword ptr [rbp + 0x4e0], rcx
00000001402db10c  0f288530020000         movaps xmm0, xmmword ptr [rbp + 0x230]
00000001402db113  0f288d40020000         movaps xmm1, xmmword ptr [rbp + 0x240]
00000001402db11a  0f289550020000         movaps xmm2, xmmword ptr [rbp + 0x250]
00000001402db121  0f289d60020000         movaps xmm3, xmmword ptr [rbp + 0x260]
00000001402db128  0f119dc8040000         movups xmmword ptr [rbp + 0x4c8], xmm3
00000001402db12f  0f1195b8040000         movups xmmword ptr [rbp + 0x4b8], xmm2
00000001402db136  0f118da8040000         movups xmmword ptr [rbp + 0x4a8], xmm1
00000001402db13d  0f118598040000         movups xmmword ptr [rbp + 0x498], xmm0
00000001402db144  48c785f804000000000000 mov qword ptr [rbp + 0x4f8], 0
00000001402db14f  48b90100000000009442   movabs rcx, 0x4294000000000001
00000001402db159  48898d20050000         mov qword ptr [rbp + 0x520], rcx
00000001402db160  0f100551daec05         movups xmm0, xmmword ptr [rip + 0x5ecda51]
00000001402db167  0f118560050000         movups xmmword ptr [rbp + 0x560], xmm0
00000001402db16e  0f100533daec05         movups xmm0, xmmword ptr [rip + 0x5ecda33]
00000001402db175  0f118550050000         movups xmmword ptr [rbp + 0x550], xmm0
00000001402db17c  0f100555daec05         movups xmm0, xmmword ptr [rip + 0x5ecda55]
00000001402db183  0f118580050000         movups xmmword ptr [rbp + 0x580], xmm0
00000001402db18a  0f100537daec05         movups xmm0, xmmword ptr [rip + 0x5ecda37]
00000001402db191  0f118570050000         movups xmmword ptr [rbp + 0x570], xmm0
00000001402db198  0f100559daec05         movups xmm0, xmmword ptr [rip + 0x5ecda59]
00000001402db19f  0f1185a0050000         movups xmmword ptr [rbp + 0x5a0], xmm0
00000001402db1a6  0f10053bdaec05         movups xmm0, xmmword ptr [rip + 0x5ecda3b]
00000001402db1ad  0f118590050000         movups xmmword ptr [rbp + 0x590], xmm0
00000001402db1b4  0f10055ddaec05         movups xmm0, xmmword ptr [rip + 0x5ecda5d]
00000001402db1bb  0f1185c0050000         movups xmmword ptr [rbp + 0x5c0], xmm0
00000001402db1c2  0f10053fdaec05         movups xmm0, xmmword ptr [rip + 0x5ecda3f]
00000001402db1c9  0f1185b0050000         movups xmmword ptr [rbp + 0x5b0], xmm0
00000001402db1d0  0f280559f3e905         movaps xmm0, xmmword ptr [rip + 0x5e9f359]
00000001402db1d7  0f1185d0050000         movups xmmword ptr [rbp + 0x5d0], xmm0
00000001402db1de  c785e005000001000000   mov dword ptr [rbp + 0x5e0], 1
00000001402db1e8  48c785e405000000000000 mov qword ptr [rbp + 0x5e4], 0
00000001402db1f3  c685ec05000001         mov byte ptr [rbp + 0x5ec], 1
00000001402db1fa  48c785f605000000000000 mov qword ptr [rbp + 0x5f6], 0
00000001402db205  48c785f005000000000000 mov qword ptr [rbp + 0x5f0], 0
00000001402db210  66c785020600000000     mov word ptr [rbp + 0x602], 0
00000001402db219  c785fe05000000000100   mov dword ptr [rbp + 0x5fe], 0x10000
00000001402db223  66c785080600000000     mov word ptr [rbp + 0x608], 0
00000001402db22c  c7850406000000000100   mov dword ptr [rbp + 0x604], 0x10000
00000001402db236  c7850a06000000000000   mov dword ptr [rbp + 0x60a], 0
00000001402db240  48b90100000005000000   movabs rcx, 0x500000001
00000001402db24a  48898d0e060000         mov qword ptr [rbp + 0x60e], rcx
00000001402db251  48898590040000         mov qword ptr [rbp + 0x490], rax
00000001402db258  488d8d08040000         lea rcx, [rbp + 0x408]
00000001402db25f  4c8d8590040000         lea r8, [rbp + 0x490]
00000001402db266  488d5548               lea rdx, [rbp + 0x48]
00000001402db26a  e801defdff             call 0x1402b9070
00000001402db26f  488b8500020000         mov rax, qword ptr [rbp + 0x200]
00000001402db276  488b7030               mov rsi, qword ptr [rax + 0x30]
00000001402db27a  488b8508040000         mov rax, qword ptr [rbp + 0x408]
00000001402db281  488b8d30040000         mov rcx, qword ptr [rbp + 0x430]
00000001402db288  48894570               mov qword ptr [rbp + 0x70], rax
00000001402db28c  0f108510040000         movups xmm0, xmmword ptr [rbp + 0x410]
00000001402db293  0f114578               movups xmmword ptr [rbp + 0x78], xmm0
00000001402db297  0f108520040000         movups xmm0, xmmword ptr [rbp + 0x420]
00000001402db29e  0f118588000000         movups xmmword ptr [rbp + 0x88], xmm0
00000001402db2a5  48898d98000000         mov qword ptr [rbp + 0x98], rcx
00000001402db2ac  488bbd10020000         mov rdi, qword ptr [rbp + 0x210]
00000001402db2b3  448b8f90000000         mov r9d, dword ptr [rdi + 0x90]
00000001402db2ba  488b8500040000         mov rax, qword ptr [rbp + 0x400]
00000001402db2c1  0fb618                 movzx ebx, byte ptr [rax]
00000001402db2c4  885c2420               mov byte ptr [rsp + 0x20], bl
00000001402db2c8  488d4d70               lea rcx, [rbp + 0x70]
00000001402db2cc  4c89fa                 mov rdx, r15
00000001402db2cf  4c8b8528070000         mov r8, qword ptr [rbp + 0x728]
00000001402db2d6  e8759df8ff             call 0x140265050
00000001402db2db  80fb01                 cmp bl, 1
00000001402db2de  0f851f020000           jne 0x1402db503
00000001402db2e4  488b5708               mov rdx, qword ptr [rdi + 8]
00000001402db2e8  4c8b4710               mov r8, qword ptr [rdi + 0x10]
00000001402db2ec  4889f1                 mov rcx, rsi
00000001402db2ef  e8ac427f05             call 0x145acf5a0
00000001402db2f4  4889c7                 mov rdi, rax
00000001402db2f7  4889d6                 mov rsi, rdx
00000001402db2fa  488d0d7ff8ec05         lea rcx, [rip + 0x5ecf87f]
00000001402db301  ba06000000             mov edx, 6
00000001402db306  e8f5e68405             call 0x145b29a00
00000001402db30b  4989d6                 mov r14, rdx
00000001402db30e  4885d2                 test rdx, rdx
00000001402db311  7910                   jns 0x1402db323
00000001402db313  4531ff                 xor r15d, r15d
00000001402db316  4c89f9                 mov rcx, r15
00000001402db319  4c89f2                 mov rdx, r14
00000001402db31c  e89afee505             call 0x14613b1bb
00000001402db321  0f0b                   ud2
00000001402db323  747c                   je 0x1402db3a1
00000001402db325  4889c3                 mov rbx, rax
00000001402db328  e8d36ed2ff             call 0x140002200
00000001402db32d  41bf01000000           mov r15d, 1
00000001402db333  ba01000000             mov edx, 1
00000001402db338  4c89f1                 mov rcx, r14
00000001402db33b  e8806ed2ff             call 0x1400021c0
00000001402db340  4885c0                 test rax, rax
00000001402db343  74d1                   je 0x1402db316
00000001402db345  4989c4                 mov r12, rax
00000001402db348  4889c1                 mov rcx, rax
00000001402db34b  4889da                 mov rdx, rbx
00000001402db34e  4d89f0                 mov r8, r14
00000001402db351  e8858ecb05             call 0x145f941db
00000001402db356  4c8bbd48070000         mov r15, qword ptr [rbp + 0x748]
00000001402db35d  4883ff01               cmp rdi, 1
00000001402db361  754a                   jne 0x1402db3ad
00000001402db363  4c89a540070000         mov qword ptr [rbp + 0x740], r12
00000001402db36a  4c89b550070000         mov qword ptr [rbp + 0x750], r14
00000001402db371  488d8d30020000         lea rcx, [rbp + 0x230]
00000001402db378  4889f2                 mov rdx, rsi
00000001402db37b  e800dd8505             call 0x145b39080
00000001402db380  90                     nop
00000001402db381  488b9550070000         mov rdx, qword ptr [rbp + 0x750]
00000001402db388  4885d2                 test rdx, rdx
00000001402db38b  7435                   je 0x1402db3c2
00000001402db38d  41b801000000           mov r8d, 1
00000001402db393  488b8d40070000         mov rcx, qword ptr [rbp + 0x740]
00000001402db39a  e8316ed2ff             call 0x1400021d0
00000001402db39f  eb21                   jmp 0x1402db3c2
00000001402db3a1  41bc01000000           mov r12d, 1
00000001402db3a7  4883ff01               cmp rdi, 1
00000001402db3ab  74b6                   je 0x1402db363
00000001402db3ad  4c89b530020000         mov qword ptr [rbp + 0x230], r14
00000001402db3b4  4c89a538020000         mov qword ptr [rbp + 0x238], r12
00000001402db3bb  4c89b540020000         mov qword ptr [rbp + 0x240], r14
00000001402db3c2  41803f01               cmp byte ptr [r15], 1
00000001402db3c6  7522                   jne 0x1402db3ea
00000001402db3c8  418b4701               mov eax, dword ptr [r15 + 1]
00000001402db3cc  418b4f04               mov ecx, dword ptr [r15 + 4]
00000001402db3d0  898d33070000           mov dword ptr [rbp + 0x733], ecx
00000001402db3d6  898530070000           mov dword ptr [rbp + 0x730], eax
00000001402db3dc  498b4708               mov rax, qword ptr [r15 + 8]
00000001402db3e0  410fb64f10             movzx ecx, byte ptr [r15 + 0x10]
00000001402db3e5  41b001                 mov r8b, 1
00000001402db3e8  eb11                   jmp 0x1402db3fb
00000001402db3ea  498b4708               mov rax, qword ptr [r15 + 8]
00000001402db3ee  f048ff00               lock inc qword ptr [rax]
00000001402db3f2  0f8ea8010000           jle 0x1402db5a0
00000001402db3f8  4531c0                 xor r8d, r8d
00000001402db3fb  488d5578               lea rdx, [rbp + 0x78]
00000001402db3ff  4c8b8d40020000         mov r9, qword ptr [rbp + 0x240]
00000001402db406  4c898da8040000         mov qword ptr [rbp + 0x4a8], r9
00000001402db40d  0f108530020000         movups xmm0, xmmword ptr [rbp + 0x230]
00000001402db414  0f118598040000         movups xmmword ptr [rbp + 0x498], xmm0
00000001402db41b  0f1005eed9ec05         movups xmm0, xmmword ptr [rip + 0x5ecd9ee]
00000001402db422  0f1185f1060000         movups xmmword ptr [rbp + 0x6f1], xmm0
00000001402db429  c785010700000000803f   mov dword ptr [rbp + 0x701], 0x3f800000
00000001402db433  4c8b4d70               mov r9, qword ptr [rbp + 0x70]
00000001402db437  48c785b004000000000000 mov qword ptr [rbp + 0x4b0], 0
00000001402db442  48c785b804000004000000 mov qword ptr [rbp + 0x4b8], 4
00000001402db44d  48c785c004000000000000 mov qword ptr [rbp + 0x4c0], 0
00000001402db458  448885c8040000         mov byte ptr [rbp + 0x4c8], r8b
00000001402db45f  448b8530070000         mov r8d, dword ptr [rbp + 0x730]
00000001402db466  448b9533070000         mov r10d, dword ptr [rbp + 0x733]
00000001402db46d  448985c9040000         mov dword ptr [rbp + 0x4c9], r8d
00000001402db474  448995cc040000         mov dword ptr [rbp + 0x4cc], r10d
00000001402db47b  488985d0040000         mov qword ptr [rbp + 0x4d0], rax
00000001402db482  48898dd8040000         mov qword ptr [rbp + 0x4d8], rcx
00000001402db489  c785e004000000002041   mov dword ptr [rbp + 0x4e0], 0x41200000
00000001402db493  66c785e40400009001     mov word ptr [rbp + 0x4e4], 0x190
00000001402db49c  c685e604000001         mov byte ptr [rbp + 0x4e6], 1
00000001402db4a3  488b85fd060000         mov rax, qword ptr [rbp + 0x6fd]
00000001402db4aa  488985f4040000         mov qword ptr [rbp + 0x4f4], rax
00000001402db4b1  0f1085f0060000         movups xmm0, xmmword ptr [rbp + 0x6f0]
00000001402db4b8  0f1185e7040000         movups xmmword ptr [rbp + 0x4e7], xmm0
00000001402db4bf  8b057be5eb05           mov eax, dword ptr [rip + 0x5ebe57b]
00000001402db4c5  89850c050000           mov dword ptr [rbp + 0x50c], eax
00000001402db4cb  0f10055ee5eb05         movups xmm0, xmmword ptr [rip + 0x5ebe55e]
00000001402db4d2  0f1185fc040000         movups xmmword ptr [rbp + 0x4fc], xmm0
00000001402db4d9  f20f10051f87e805       movsd xmm0, qword ptr [rip + 0x5e8871f]
00000001402db4e1  f20f118510050000       movsd qword ptr [rbp + 0x510], xmm0
00000001402db4e9  4c898d90040000         mov qword ptr [rbp + 0x490], r9
00000001402db4f0  488d8d30020000         lea rcx, [rbp + 0x230]
00000001402db4f7  4c8d8590040000         lea r8, [rbp + 0x490]
00000001402db4fe  e87d3fffff             call 0x1402cf480
00000001402db503  488b8508020000         mov rax, qword ptr [rbp + 0x208]
00000001402db50a  0f28b560070000         movaps xmm6, xmmword ptr [rbp + 0x760]
00000001402db511  0f28bd70070000         movaps xmm7, xmmword ptr [rbp + 0x770]
00000001402db518  440f288580070000       movaps xmm8, xmmword ptr [rbp + 0x780]
00000001402db520  440f288d90070000       movaps xmm9, xmmword ptr [rbp + 0x790]
00000001402db528  440f2895a0070000       movaps xmm10, xmmword ptr [rbp + 0x7a0]
00000001402db530  440f289db0070000       movaps xmm11, xmmword ptr [rbp + 0x7b0]
00000001402db538  440f28a5c0070000       movaps xmm12, xmmword ptr [rbp + 0x7c0]
00000001402db540  440f28add0070000       movaps xmm13, xmmword ptr [rbp + 0x7d0]
00000001402db548  440f28b5e0070000       movaps xmm14, xmmword ptr [rbp + 0x7e0]
00000001402db550  440f28bdf0070000       movaps xmm15, xmmword ptr [rbp + 0x7f0]
00000001402db558  4881c488080000         add rsp, 0x888
00000001402db55f  5b                     pop rbx
00000001402db560  5f                     pop rdi
00000001402db561  5e                     pop rsi
00000001402db562  415c                   pop r12
00000001402db564  415d                   pop r13
00000001402db566  415e                   pop r14
00000001402db568  415f                   pop r15
00000001402db56a  5d                     pop rbp
00000001402db56b  c3                     ret
00000001402db56c  b908000000             mov ecx, 8
00000001402db571  ba48000000             mov edx, 0x48
00000001402db576  e826fce505             call 0x14613b1a1
00000001402db57b  90                     nop
00000001402db57c  eb22                   jmp 0x1402db5a0
00000001402db57e  b904000000             mov ecx, 4
00000001402db583  ba40000000             mov edx, 0x40
00000001402db588  e814fce505             call 0x14613b1a1
00000001402db58d  90                     nop
00000001402db58e  eb10                   jmp 0x1402db5a0
00000001402db590  b901000000             mov ecx, 1
00000001402db595  ba39000000             mov edx, 0x39
00000001402db59a  e81cfce505             call 0x14613b1bb
00000001402db59f  90                     nop
00000001402db5a0  0f0b                   ud2
