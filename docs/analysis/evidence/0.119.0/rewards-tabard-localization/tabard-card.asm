00000001403470a0  55                     push rbp
00000001403470a1  4157                   push r15
00000001403470a3  4156                   push r14
00000001403470a5  4155                   push r13
00000001403470a7  4154                   push r12
00000001403470a9  56                     push rsi
00000001403470aa  57                     push rdi
00000001403470ab  53                     push rbx
00000001403470ac  4881ec08040000         sub rsp, 0x408
00000001403470b3  488dac2480000000       lea rbp, [rsp + 0x80]
00000001403470bb  0f29bd70030000         movaps xmmword ptr [rbp + 0x370], xmm7
00000001403470c2  0f29b560030000         movaps xmmword ptr [rbp + 0x360], xmm6
00000001403470c9  48c78558030000feffffff mov qword ptr [rbp + 0x358], 0xfffffffffffffffe
00000001403470d4  4989d2                 mov r10, rdx
00000001403470d7  4889ce                 mov rsi, rcx
00000001403470da  488b01                 mov rax, qword ptr [rcx]
00000001403470dd  488b4928               mov rcx, qword ptr [rcx + 0x28]
00000001403470e1  48898550010000         mov qword ptr [rbp + 0x150], rax
00000001403470e8  0f104608               movups xmm0, xmmword ptr [rsi + 8]
00000001403470ec  0f118558010000         movups xmmword ptr [rbp + 0x158], xmm0
00000001403470f3  0f104618               movups xmm0, xmmword ptr [rsi + 0x18]
00000001403470f7  0f118568010000         movups xmmword ptr [rbp + 0x168], xmm0
00000001403470fe  48898d78010000         mov qword ptr [rbp + 0x178], rcx
0000000140347105  488b5218               mov rdx, qword ptr [rdx + 0x18]
0000000140347109  498b7a20               mov rdi, qword ptr [r10 + 0x20]
000000014034710d  4c8b4710               mov r8, qword ptr [rdi + 0x10]
0000000140347111  4c8b4f18               mov r9, qword ptr [rdi + 0x18]
0000000140347115  4c899548030000         mov qword ptr [rbp + 0x348], r10
000000014034711c  4d8b7228               mov r14, qword ptr [r10 + 0x28]
0000000140347120  b001                   mov al, 1
0000000140347122  41803e00               cmp byte ptr [r14], 0
0000000140347126  750e                   jne 0x140347136
0000000140347128  488b8548030000         mov rax, qword ptr [rbp + 0x348]
000000014034712f  488b4030               mov rax, qword ptr [rax + 0x30]
0000000140347133  0fb600                 movzx eax, byte ptr [rax]
0000000140347136  c6855603000001         mov byte ptr [rbp + 0x356], 1
000000014034713d  88442428               mov byte ptr [rsp + 0x28], al
0000000140347141  c74424200000f041       mov dword ptr [rsp + 0x20], 0x41f00000
0000000140347149  488d8d50010000         lea rcx, [rbp + 0x150]
0000000140347150  e81b33ecff             call 0x14020a470
0000000140347155  90                     nop
0000000140347156  488d9d58010000         lea rbx, [rbp + 0x158]
000000014034715d  0f57c0                 xorps xmm0, xmm0
0000000140347160  0f294550               movaps xmmword ptr [rbp + 0x50], xmm0
0000000140347164  0f294540               movaps xmmword ptr [rbp + 0x40], xmm0
0000000140347168  0f294530               movaps xmmword ptr [rbp + 0x30], xmm0
000000014034716c  0f294520               movaps xmmword ptr [rbp + 0x20], xmm0
0000000140347170  0f294510               movaps xmmword ptr [rbp + 0x10], xmm0
0000000140347174  48c7456000000000       mov qword ptr [rbp + 0x60], 0
000000014034717c  66c785040300000000     mov word ptr [rbp + 0x304], 0
0000000140347185  c7850003000000000000   mov dword ptr [rbp + 0x300], 0
000000014034718f  0f1005121ae605         movups xmm0, xmmword ptr [rip + 0x5e61a12]
0000000140347196  0f114568               movups xmmword ptr [rbp + 0x68], xmm0
000000014034719a  0f1005171ae605         movups xmm0, xmmword ptr [rip + 0x5e61a17]
00000001403471a1  0f114578               movups xmmword ptr [rbp + 0x78], xmm0
00000001403471a5  0f10051c1ae605         movups xmm0, xmmword ptr [rip + 0x5e61a1c]
00000001403471ac  0f118588000000         movups xmmword ptr [rbp + 0x88], xmm0
00000001403471b3  0f10051e1ae605         movups xmm0, xmmword ptr [rip + 0x5e61a1e]
00000001403471ba  0f118598000000         movups xmmword ptr [rbp + 0x98], xmm0
00000001403471c1  0f1005301ae605         movups xmm0, xmmword ptr [rip + 0x5e61a30]
00000001403471c8  0f1185b8000000         movups xmmword ptr [rbp + 0xb8], xmm0
00000001403471cf  0f1005121ae605         movups xmm0, xmmword ptr [rip + 0x5e61a12]
00000001403471d6  0f1185a8000000         movups xmmword ptr [rbp + 0xa8], xmm0
00000001403471dd  0f1005341ae605         movups xmm0, xmmword ptr [rip + 0x5e61a34]
00000001403471e4  0f1185d8000000         movups xmmword ptr [rbp + 0xd8], xmm0
00000001403471eb  0f1005161ae605         movups xmm0, xmmword ptr [rip + 0x5e61a16]
00000001403471f2  0f1185c8000000         movups xmmword ptr [rbp + 0xc8], xmm0
00000001403471f9  0f1005f018e605         movups xmm0, xmmword ptr [rip + 0x5e618f0]
0000000140347200  0f2945b0               movaps xmmword ptr [rbp - 0x50], xmm0
0000000140347204  48c745c000000000       mov qword ptr [rbp - 0x40], 0
000000014034720c  0f1005f518e605         movups xmm0, xmmword ptr [rip + 0x5e618f5]
0000000140347213  0f1145c8               movups xmmword ptr [rbp - 0x38], xmm0
0000000140347217  48c745d800000000       mov qword ptr [rbp - 0x28], 0
000000014034721f  0f1005fa18e605         movups xmm0, xmmword ptr [rip + 0x5e618fa]
0000000140347226  0f2945e0               movaps xmmword ptr [rbp - 0x20], xmm0
000000014034722a  48c745f000000000       mov qword ptr [rbp - 0x10], 0
0000000140347232  0f1005ff18e605         movups xmm0, xmmword ptr [rip + 0x5e618ff]
0000000140347239  0f1145f8               movups xmmword ptr [rbp - 8], xmm0
000000014034723d  48c7450800000000       mov qword ptr [rbp + 8], 0
0000000140347245  4c8bbd50010000         mov r15, qword ptr [rbp + 0x150]
000000014034724c  488d8d88010000         lea rcx, [rbp + 0x188]
0000000140347253  488d55b0               lea rdx, [rbp - 0x50]
0000000140347257  41b838010000           mov r8d, 0x138
000000014034725d  e879cfc405             call 0x145f941db
0000000140347262  0f2805d7c8e105         movaps xmm0, xmmword ptr [rip + 0x5e1c8d7]
0000000140347269  0f1185c0020000         movups xmmword ptr [rbp + 0x2c0], xmm0
0000000140347270  c785d002000001000000   mov dword ptr [rbp + 0x2d0], 1
000000014034727a  48c785d402000000000000 mov qword ptr [rbp + 0x2d4], 0
0000000140347285  c685dc02000001         mov byte ptr [rbp + 0x2dc], 1
000000014034728c  f20f10059c31e305       movsd xmm0, qword ptr [rip + 0x5e3319c]
0000000140347294  f20f1185e0020000       movsd qword ptr [rbp + 0x2e0], xmm0
000000014034729c  c785e80200000000803f   mov dword ptr [rbp + 0x2e8], 0x3f800000
00000001403472a6  66c785ec0200000000     mov word ptr [rbp + 0x2ec], 0
00000001403472af  c785ee02000000000100   mov dword ptr [rbp + 0x2ee], 0x10000
00000001403472b9  66c785f20200000000     mov word ptr [rbp + 0x2f2], 0
00000001403472c2  c785f402000000000100   mov dword ptr [rbp + 0x2f4], 0x10000
00000001403472cc  66c785f80200000000     mov word ptr [rbp + 0x2f8], 0
00000001403472d5  c785fa02000000000000   mov dword ptr [rbp + 0x2fa], 0
00000001403472df  66c785fe0200000100     mov word ptr [rbp + 0x2fe], 1
00000001403472e8  4c89bd80010000         mov qword ptr [rbp + 0x180], r15
00000001403472ef  c6855603000001         mov byte ptr [rbp + 0x356], 1
00000001403472f6  488d8d20010000         lea rcx, [rbp + 0x120]
00000001403472fd  4c8d8580010000         lea r8, [rbp + 0x180]
0000000140347304  4889da                 mov rdx, rbx
0000000140347307  e8641df7ff             call 0x1402b9070
000000014034730c  90                     nop
000000014034730d  488b8d48030000         mov rcx, qword ptr [rbp + 0x348]
0000000140347314  4c8b6938               mov r13, qword ptr [rcx + 0x38]
0000000140347318  488b4130               mov rax, qword ptr [rcx + 0x30]
000000014034731c  4c8b7940               mov r15, qword ptr [rcx + 0x40]
0000000140347320  488b11                 mov rdx, qword ptr [rcx]
0000000140347323  488b4908               mov rcx, qword ptr [rcx + 8]
0000000140347327  48898d10030000         mov qword ptr [rbp + 0x310], rcx
000000014034732e  4c8ba520010000         mov r12, qword ptr [rbp + 0x120]
0000000140347335  488b8d48010000         mov rcx, qword ptr [rbp + 0x148]
000000014034733c  4c89a5f0000000         mov qword ptr [rbp + 0xf0], r12
0000000140347343  0f108528010000         movups xmm0, xmmword ptr [rbp + 0x128]
000000014034734a  0f1185f8000000         movups xmmword ptr [rbp + 0xf8], xmm0
0000000140347351  0f108538010000         movups xmm0, xmmword ptr [rbp + 0x138]
0000000140347358  0f118508010000         movups xmmword ptr [rbp + 0x108], xmm0
000000014034735f  48898d18010000         mov qword ptr [rbp + 0x118], rcx
0000000140347366  41803e00               cmp byte ptr [r14], 0
000000014034736a  48899508030000         mov qword ptr [rbp + 0x308], rdx
0000000140347371  7505                   jne 0x140347378
0000000140347373  803801                 cmp byte ptr [rax], 1
0000000140347376  7509                   jne 0x140347381
0000000140347378  0f10054519e605         movups xmm0, xmmword ptr [rip + 0x5e61945]
000000014034737f  eb07                   jmp 0x140347388
0000000140347381  0f10052417e605         movups xmm0, xmmword ptr [rip + 0x5e61724]
0000000140347388  0f298580010000         movaps xmmword ptr [rbp + 0x180], xmm0
000000014034738f  c785900100000000803f   mov dword ptr [rbp + 0x190], 0x3f800000
0000000140347399  c6855703000000         mov byte ptr [rbp + 0x357], 0
00000001403473a0  4889f9                 mov rcx, rdi
00000001403473a3  e8f8407605             call 0x145aab4a0
00000001403473a8  90                     nop
00000001403473a9  4889d3                 mov rbx, rdx
00000001403473ac  4885d2                 test rdx, rdx
00000001403473af  791b                   jns 0x1403473cc
00000001403473b1  4531ff                 xor r15d, r15d
00000001403473b4  c6855703000000         mov byte ptr [rbp + 0x357], 0
00000001403473bb  4c89f9                 mov rcx, r15
00000001403473be  4889da                 mov rdx, rbx
00000001403473c1  e8f53ddf05             call 0x14613b1bb
00000001403473c6  90                     nop
00000001403473c7  e9ff020000             jmp 0x1403476cb
00000001403473cc  4885db                 test rbx, rbx
00000001403473cf  746d                   je 0x14034743e
00000001403473d1  4c89a518030000         mov qword ptr [rbp + 0x318], r12
00000001403473d8  4d89fc                 mov r12, r15
00000001403473db  4889c7                 mov rdi, rax
00000001403473de  e81daecbff             call 0x140002200
00000001403473e3  41bf01000000           mov r15d, 1
00000001403473e9  ba01000000             mov edx, 1
00000001403473ee  4889d9                 mov rcx, rbx
00000001403473f1  e8caadcbff             call 0x1400021c0
00000001403473f6  4885c0                 test rax, rax
00000001403473f9  74b9                   je 0x1403473b4
00000001403473fb  4989c6                 mov r14, rax
00000001403473fe  4889c1                 mov rcx, rax
0000000140347401  4889fa                 mov rdx, rdi
0000000140347404  4989d8                 mov r8, rbx
0000000140347407  e8cfcdc405             call 0x145f941db
000000014034740c  4d89e7                 mov r15, r12
000000014034740f  4c8ba518030000         mov r12, qword ptr [rbp + 0x318]
0000000140347416  41807d0001             cmp byte ptr [r13], 1
000000014034741b  752e                   jne 0x14034744b
000000014034741d  418b4501               mov eax, dword ptr [r13 + 1]
0000000140347421  418b4d04               mov ecx, dword ptr [r13 + 4]
0000000140347425  898d43030000           mov dword ptr [rbp + 0x343], ecx
000000014034742b  898540030000           mov dword ptr [rbp + 0x340], eax
0000000140347431  498b4508               mov rax, qword ptr [r13 + 8]
0000000140347435  410fb64d10             movzx ecx, byte ptr [r13 + 0x10]
000000014034743a  b201                   mov dl, 1
000000014034743c  eb1d                   jmp 0x14034745b
000000014034743e  41be01000000           mov r14d, 1
0000000140347444  41807d0001             cmp byte ptr [r13], 1
0000000140347449  74d2                   je 0x14034741d
000000014034744b  498b4508               mov rax, qword ptr [r13 + 8]
000000014034744f  f048ff00               lock inc qword ptr [rax]
0000000140347453  0f8e72020000           jle 0x1403476cb
0000000140347459  31d2                   xor edx, edx
000000014034745b  488dbdf8000000         lea rdi, [rbp + 0xf8]
0000000140347462  448b8590010000         mov r8d, dword ptr [rbp + 0x190]
0000000140347469  44898534030000         mov dword ptr [rbp + 0x334], r8d
0000000140347470  0f288580010000         movaps xmm0, xmmword ptr [rbp + 0x180]
0000000140347477  0f118524030000         movups xmmword ptr [rbp + 0x324], xmm0
000000014034747e  48899d88010000         mov qword ptr [rbp + 0x188], rbx
0000000140347485  4c89b590010000         mov qword ptr [rbp + 0x190], r14
000000014034748c  48899d98010000         mov qword ptr [rbp + 0x198], rbx
0000000140347493  48c785a001000000000000 mov qword ptr [rbp + 0x1a0], 0
000000014034749e  48c785a801000004000000 mov qword ptr [rbp + 0x1a8], 4
00000001403474a9  48c785b001000000000000 mov qword ptr [rbp + 0x1b0], 0
00000001403474b4  8895b8010000           mov byte ptr [rbp + 0x1b8], dl
00000001403474ba  8b9540030000           mov edx, dword ptr [rbp + 0x340]
00000001403474c0  448b8543030000         mov r8d, dword ptr [rbp + 0x343]
00000001403474c7  8995b9010000           mov dword ptr [rbp + 0x1b9], edx
00000001403474cd  448985bc010000         mov dword ptr [rbp + 0x1bc], r8d
00000001403474d4  488985c0010000         mov qword ptr [rbp + 0x1c0], rax
00000001403474db  48898dc8010000         mov qword ptr [rbp + 0x1c8], rcx
00000001403474e2  c785d001000000005041   mov dword ptr [rbp + 0x1d0], 0x41500000
00000001403474ec  66c785d40100009001     mov word ptr [rbp + 0x1d4], 0x190
00000001403474f5  c685d601000001         mov byte ptr [rbp + 0x1d6], 1
00000001403474fc  0f108523030000         movups xmm0, xmmword ptr [rbp + 0x323]
0000000140347503  0f1185d7010000         movups xmmword ptr [rbp + 0x1d7], xmm0
000000014034750a  488b8530030000         mov rax, qword ptr [rbp + 0x330]
0000000140347511  488985e4010000         mov qword ptr [rbp + 0x1e4], rax
0000000140347518  8b1d2225e505           mov ebx, dword ptr [rip + 0x5e52522]
000000014034751e  899dfc010000           mov dword ptr [rbp + 0x1fc], ebx
0000000140347524  0f10350525e505         movups xmm6, xmmword ptr [rip + 0x5e52505]
000000014034752b  0f11b5ec010000         movups xmmword ptr [rbp + 0x1ec], xmm6
0000000140347532  f20f103dc6c6e105       movsd xmm7, qword ptr [rip + 0x5e1c6c6]
000000014034753a  f20f11bd00020000       movsd qword ptr [rbp + 0x200], xmm7
0000000140347542  4c89a580010000         mov qword ptr [rbp + 0x180], r12
0000000140347549  c6855703000000         mov byte ptr [rbp + 0x357], 0
0000000140347550  488d4db0               lea rcx, [rbp - 0x50]
0000000140347554  4c8d8580010000         lea r8, [rbp + 0x180]
000000014034755b  4889fa                 mov rdx, rdi
000000014034755e  e81d7ff8ff             call 0x1402cf480
0000000140347563  90                     nop
0000000140347564  418b4710               mov eax, dword ptr [r15 + 0x10]
0000000140347568  898590010000           mov dword ptr [rbp + 0x190], eax
000000014034756e  410f1007               movups xmm0, xmmword ptr [r15]
0000000140347572  0f298580010000         movaps xmmword ptr [rbp + 0x180], xmm0
0000000140347579  41807d0001             cmp byte ptr [r13], 1
000000014034757e  7521                   jne 0x1403475a1
0000000140347580  418b4501               mov eax, dword ptr [r13 + 1]
0000000140347584  418b4d04               mov ecx, dword ptr [r13 + 4]
0000000140347588  898d3b030000           mov dword ptr [rbp + 0x33b], ecx
000000014034758e  898538030000           mov dword ptr [rbp + 0x338], eax
0000000140347594  498b4508               mov rax, qword ptr [r13 + 8]
0000000140347598  410fb64d10             movzx ecx, byte ptr [r13 + 0x10]
000000014034759d  b201                   mov dl, 1
000000014034759f  eb10                   jmp 0x1403475b1
00000001403475a1  498b4508               mov rax, qword ptr [r13 + 8]
00000001403475a5  f048ff00               lock inc qword ptr [rax]
00000001403475a9  0f8e1c010000           jle 0x1403476cb
00000001403475af  31d2                   xor edx, edx
00000001403475b1  448b8590010000         mov r8d, dword ptr [rbp + 0x190]
00000001403475b8  44898534030000         mov dword ptr [rbp + 0x334], r8d
00000001403475bf  0f288580010000         movaps xmm0, xmmword ptr [rbp + 0x180]
00000001403475c6  0f118524030000         movups xmmword ptr [rbp + 0x324], xmm0
00000001403475cd  4c8b8d48030000         mov r9, qword ptr [rbp + 0x348]
00000001403475d4  4d8b4110               mov r8, qword ptr [r9 + 0x10]
00000001403475d8  4c898598010000         mov qword ptr [rbp + 0x198], r8
00000001403475df  410f1001               movups xmm0, xmmword ptr [r9]
00000001403475e3  0f118588010000         movups xmmword ptr [rbp + 0x188], xmm0
00000001403475ea  48c785a001000000000000 mov qword ptr [rbp + 0x1a0], 0
00000001403475f5  48c785a801000004000000 mov qword ptr [rbp + 0x1a8], 4
0000000140347600  48c785b001000000000000 mov qword ptr [rbp + 0x1b0], 0
000000014034760b  8895b8010000           mov byte ptr [rbp + 0x1b8], dl
0000000140347611  8b9538030000           mov edx, dword ptr [rbp + 0x338]
0000000140347617  448b853b030000         mov r8d, dword ptr [rbp + 0x33b]
000000014034761e  8995b9010000           mov dword ptr [rbp + 0x1b9], edx
0000000140347624  448985bc010000         mov dword ptr [rbp + 0x1bc], r8d
000000014034762b  488985c0010000         mov qword ptr [rbp + 0x1c0], rax
0000000140347632  48898dc8010000         mov qword ptr [rbp + 0x1c8], rcx
0000000140347639  c785d001000000003041   mov dword ptr [rbp + 0x1d0], 0x41300000
0000000140347643  66c785d40100009001     mov word ptr [rbp + 0x1d4], 0x190
000000014034764c  c685d601000001         mov byte ptr [rbp + 0x1d6], 1
0000000140347653  0f108523030000         movups xmm0, xmmword ptr [rbp + 0x323]
000000014034765a  0f1185d7010000         movups xmmword ptr [rbp + 0x1d7], xmm0
0000000140347661  488b8530030000         mov rax, qword ptr [rbp + 0x330]
0000000140347668  488985e4010000         mov qword ptr [rbp + 0x1e4], rax
000000014034766f  899dfc010000           mov dword ptr [rbp + 0x1fc], ebx
0000000140347675  0f11b5ec010000         movups xmmword ptr [rbp + 0x1ec], xmm6
000000014034767c  f20f11bd00020000       movsd qword ptr [rbp + 0x200], xmm7
0000000140347684  4c89a580010000         mov qword ptr [rbp + 0x180], r12
000000014034768b  c6855703000001         mov byte ptr [rbp + 0x357], 1
0000000140347692  488d4db0               lea rcx, [rbp - 0x50]
0000000140347696  4c8d8580010000         lea r8, [rbp + 0x180]
000000014034769d  4889fa                 mov rdx, rdi
00000001403476a0  e8db7df8ff             call 0x1402cf480
00000001403476a5  90                     nop
00000001403476a6  4889f0                 mov rax, rsi
00000001403476a9  0f28b560030000         movaps xmm6, xmmword ptr [rbp + 0x360]
00000001403476b0  0f28bd70030000         movaps xmm7, xmmword ptr [rbp + 0x370]
00000001403476b7  4881c408040000         add rsp, 0x408
00000001403476be  5b                     pop rbx
00000001403476bf  5f                     pop rdi
00000001403476c0  5e                     pop rsi
00000001403476c1  415c                   pop r12
00000001403476c3  415d                   pop r13
00000001403476c5  415e                   pop r14
00000001403476c7  415f                   pop r15
00000001403476c9  5d                     pop rbp
00000001403476ca  c3                     ret
00000001403476cb  0f0b                   ud2
