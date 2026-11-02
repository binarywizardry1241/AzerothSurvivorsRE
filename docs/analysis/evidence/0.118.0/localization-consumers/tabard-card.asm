0000000140347000  55                     push rbp
0000000140347001  4157                   push r15
0000000140347003  4156                   push r14
0000000140347005  4155                   push r13
0000000140347007  4154                   push r12
0000000140347009  56                     push rsi
000000014034700a  57                     push rdi
000000014034700b  53                     push rbx
000000014034700c  4881ec08040000         sub rsp, 0x408
0000000140347013  488dac2480000000       lea rbp, [rsp + 0x80]
000000014034701b  0f29bd70030000         movaps xmmword ptr [rbp + 0x370], xmm7
0000000140347022  0f29b560030000         movaps xmmword ptr [rbp + 0x360], xmm6
0000000140347029  48c78558030000feffffff mov qword ptr [rbp + 0x358], 0xfffffffffffffffe
0000000140347034  4989d2                 mov r10, rdx
0000000140347037  4889ce                 mov rsi, rcx
000000014034703a  488b01                 mov rax, qword ptr [rcx]
000000014034703d  488b4928               mov rcx, qword ptr [rcx + 0x28]
0000000140347041  48898550010000         mov qword ptr [rbp + 0x150], rax
0000000140347048  0f104608               movups xmm0, xmmword ptr [rsi + 8]
000000014034704c  0f118558010000         movups xmmword ptr [rbp + 0x158], xmm0
0000000140347053  0f104618               movups xmm0, xmmword ptr [rsi + 0x18]
0000000140347057  0f118568010000         movups xmmword ptr [rbp + 0x168], xmm0
000000014034705e  48898d78010000         mov qword ptr [rbp + 0x178], rcx
0000000140347065  488b5218               mov rdx, qword ptr [rdx + 0x18]
0000000140347069  498b7a20               mov rdi, qword ptr [r10 + 0x20]
000000014034706d  4c8b4710               mov r8, qword ptr [rdi + 0x10]
0000000140347071  4c8b4f18               mov r9, qword ptr [rdi + 0x18]
0000000140347075  4c899548030000         mov qword ptr [rbp + 0x348], r10
000000014034707c  4d8b7228               mov r14, qword ptr [r10 + 0x28]
0000000140347080  b001                   mov al, 1
0000000140347082  41803e00               cmp byte ptr [r14], 0
0000000140347086  750e                   jne 0x140347096
0000000140347088  488b8548030000         mov rax, qword ptr [rbp + 0x348]
000000014034708f  488b4030               mov rax, qword ptr [rax + 0x30]
0000000140347093  0fb600                 movzx eax, byte ptr [rax]
0000000140347096  c6855603000001         mov byte ptr [rbp + 0x356], 1
000000014034709d  88442428               mov byte ptr [rsp + 0x28], al
00000001403470a1  c74424200000f041       mov dword ptr [rsp + 0x20], 0x41f00000
00000001403470a9  488d8d50010000         lea rcx, [rbp + 0x150]
00000001403470b0  e8fb32ecff             call 0x14020a3b0
00000001403470b5  90                     nop
00000001403470b6  488d9d58010000         lea rbx, [rbp + 0x158]
00000001403470bd  0f57c0                 xorps xmm0, xmm0
00000001403470c0  0f294550               movaps xmmword ptr [rbp + 0x50], xmm0
00000001403470c4  0f294540               movaps xmmword ptr [rbp + 0x40], xmm0
00000001403470c8  0f294530               movaps xmmword ptr [rbp + 0x30], xmm0
00000001403470cc  0f294520               movaps xmmword ptr [rbp + 0x20], xmm0
00000001403470d0  0f294510               movaps xmmword ptr [rbp + 0x10], xmm0
00000001403470d4  48c7456000000000       mov qword ptr [rbp + 0x60], 0
00000001403470dc  66c785040300000000     mov word ptr [rbp + 0x304], 0
00000001403470e5  c7850003000000000000   mov dword ptr [rbp + 0x300], 0
00000001403470ef  0f1005021be605         movups xmm0, xmmword ptr [rip + 0x5e61b02]
00000001403470f6  0f114568               movups xmmword ptr [rbp + 0x68], xmm0
00000001403470fa  0f1005071be605         movups xmm0, xmmword ptr [rip + 0x5e61b07]
0000000140347101  0f114578               movups xmmword ptr [rbp + 0x78], xmm0
0000000140347105  0f10050c1be605         movups xmm0, xmmword ptr [rip + 0x5e61b0c]
000000014034710c  0f118588000000         movups xmmword ptr [rbp + 0x88], xmm0
0000000140347113  0f10050e1be605         movups xmm0, xmmword ptr [rip + 0x5e61b0e]
000000014034711a  0f118598000000         movups xmmword ptr [rbp + 0x98], xmm0
0000000140347121  0f1005201be605         movups xmm0, xmmword ptr [rip + 0x5e61b20]
0000000140347128  0f1185b8000000         movups xmmword ptr [rbp + 0xb8], xmm0
000000014034712f  0f1005021be605         movups xmm0, xmmword ptr [rip + 0x5e61b02]
0000000140347136  0f1185a8000000         movups xmmword ptr [rbp + 0xa8], xmm0
000000014034713d  0f1005241be605         movups xmm0, xmmword ptr [rip + 0x5e61b24]
0000000140347144  0f1185d8000000         movups xmmword ptr [rbp + 0xd8], xmm0
000000014034714b  0f1005061be605         movups xmm0, xmmword ptr [rip + 0x5e61b06]
0000000140347152  0f1185c8000000         movups xmmword ptr [rbp + 0xc8], xmm0
0000000140347159  0f1005e019e605         movups xmm0, xmmword ptr [rip + 0x5e619e0]
0000000140347160  0f2945b0               movaps xmmword ptr [rbp - 0x50], xmm0
0000000140347164  48c745c000000000       mov qword ptr [rbp - 0x40], 0
000000014034716c  0f1005e519e605         movups xmm0, xmmword ptr [rip + 0x5e619e5]
0000000140347173  0f1145c8               movups xmmword ptr [rbp - 0x38], xmm0
0000000140347177  48c745d800000000       mov qword ptr [rbp - 0x28], 0
000000014034717f  0f1005ea19e605         movups xmm0, xmmword ptr [rip + 0x5e619ea]
0000000140347186  0f2945e0               movaps xmmword ptr [rbp - 0x20], xmm0
000000014034718a  48c745f000000000       mov qword ptr [rbp - 0x10], 0
0000000140347192  0f1005ef19e605         movups xmm0, xmmword ptr [rip + 0x5e619ef]
0000000140347199  0f1145f8               movups xmmword ptr [rbp - 8], xmm0
000000014034719d  48c7450800000000       mov qword ptr [rbp + 8], 0
00000001403471a5  4c8bbd50010000         mov r15, qword ptr [rbp + 0x150]
00000001403471ac  488d8d88010000         lea rcx, [rbp + 0x188]
00000001403471b3  488d55b0               lea rdx, [rbp - 0x50]
00000001403471b7  41b838010000           mov r8d, 0x138
00000001403471bd  e899cbc405             call 0x145f93d5b
00000001403471c2  0f280577c9e105         movaps xmm0, xmmword ptr [rip + 0x5e1c977]
00000001403471c9  0f1185c0020000         movups xmmword ptr [rbp + 0x2c0], xmm0
00000001403471d0  c785d002000001000000   mov dword ptr [rbp + 0x2d0], 1
00000001403471da  48c785d402000000000000 mov qword ptr [rbp + 0x2d4], 0
00000001403471e5  c685dc02000001         mov byte ptr [rbp + 0x2dc], 1
00000001403471ec  f20f10051c32e305       movsd xmm0, qword ptr [rip + 0x5e3321c]
00000001403471f4  f20f1185e0020000       movsd qword ptr [rbp + 0x2e0], xmm0
00000001403471fc  c785e80200000000803f   mov dword ptr [rbp + 0x2e8], 0x3f800000
0000000140347206  66c785ec0200000000     mov word ptr [rbp + 0x2ec], 0
000000014034720f  c785ee02000000000100   mov dword ptr [rbp + 0x2ee], 0x10000
0000000140347219  66c785f20200000000     mov word ptr [rbp + 0x2f2], 0
0000000140347222  c785f402000000000100   mov dword ptr [rbp + 0x2f4], 0x10000
000000014034722c  66c785f80200000000     mov word ptr [rbp + 0x2f8], 0
0000000140347235  c785fa02000000000000   mov dword ptr [rbp + 0x2fa], 0
000000014034723f  66c785fe0200000100     mov word ptr [rbp + 0x2fe], 1
0000000140347248  4c89bd80010000         mov qword ptr [rbp + 0x180], r15
000000014034724f  c6855603000001         mov byte ptr [rbp + 0x356], 1
0000000140347256  488d8d20010000         lea rcx, [rbp + 0x120]
000000014034725d  4c8d8580010000         lea r8, [rbp + 0x180]
0000000140347264  4889da                 mov rdx, rbx
0000000140347267  e8641df7ff             call 0x1402b8fd0
000000014034726c  90                     nop
000000014034726d  488b8d48030000         mov rcx, qword ptr [rbp + 0x348]
0000000140347274  4c8b6938               mov r13, qword ptr [rcx + 0x38]
0000000140347278  488b4130               mov rax, qword ptr [rcx + 0x30]
000000014034727c  4c8b7940               mov r15, qword ptr [rcx + 0x40]
0000000140347280  488b11                 mov rdx, qword ptr [rcx]
0000000140347283  488b4908               mov rcx, qword ptr [rcx + 8]
0000000140347287  48898d10030000         mov qword ptr [rbp + 0x310], rcx
000000014034728e  4c8ba520010000         mov r12, qword ptr [rbp + 0x120]
0000000140347295  488b8d48010000         mov rcx, qword ptr [rbp + 0x148]
000000014034729c  4c89a5f0000000         mov qword ptr [rbp + 0xf0], r12
00000001403472a3  0f108528010000         movups xmm0, xmmword ptr [rbp + 0x128]
00000001403472aa  0f1185f8000000         movups xmmword ptr [rbp + 0xf8], xmm0
00000001403472b1  0f108538010000         movups xmm0, xmmword ptr [rbp + 0x138]
00000001403472b8  0f118508010000         movups xmmword ptr [rbp + 0x108], xmm0
00000001403472bf  48898d18010000         mov qword ptr [rbp + 0x118], rcx
00000001403472c6  41803e00               cmp byte ptr [r14], 0
00000001403472ca  48899508030000         mov qword ptr [rbp + 0x308], rdx
00000001403472d1  7505                   jne 0x1403472d8
00000001403472d3  803801                 cmp byte ptr [rax], 1
00000001403472d6  7509                   jne 0x1403472e1
00000001403472d8  0f1005351ae605         movups xmm0, xmmword ptr [rip + 0x5e61a35]
00000001403472df  eb07                   jmp 0x1403472e8
00000001403472e1  0f10051418e605         movups xmm0, xmmword ptr [rip + 0x5e61814]
00000001403472e8  0f298580010000         movaps xmmword ptr [rbp + 0x180], xmm0
00000001403472ef  c785900100000000803f   mov dword ptr [rbp + 0x190], 0x3f800000
00000001403472f9  c6855703000000         mov byte ptr [rbp + 0x357], 0
0000000140347300  4889f9                 mov rcx, rdi
0000000140347303  e818417605             call 0x145aab420
0000000140347308  90                     nop
0000000140347309  4889d3                 mov rbx, rdx
000000014034730c  4885d2                 test rdx, rdx
000000014034730f  791b                   jns 0x14034732c
0000000140347311  4531ff                 xor r15d, r15d
0000000140347314  c6855703000000         mov byte ptr [rbp + 0x357], 0
000000014034731b  4c89f9                 mov rcx, r15
000000014034731e  4889da                 mov rdx, rbx
0000000140347321  e8153adf05             call 0x14613ad3b
0000000140347326  90                     nop
0000000140347327  e9ff020000             jmp 0x14034762b
000000014034732c  4885db                 test rbx, rbx
000000014034732f  746d                   je 0x14034739e
0000000140347331  4c89a518030000         mov qword ptr [rbp + 0x318], r12
0000000140347338  4d89fc                 mov r12, r15
000000014034733b  4889c7                 mov rdi, rax
000000014034733e  e8bdaecbff             call 0x140002200
0000000140347343  41bf01000000           mov r15d, 1
0000000140347349  ba01000000             mov edx, 1
000000014034734e  4889d9                 mov rcx, rbx
0000000140347351  e86aaecbff             call 0x1400021c0
0000000140347356  4885c0                 test rax, rax
0000000140347359  74b9                   je 0x140347314
000000014034735b  4989c6                 mov r14, rax
000000014034735e  4889c1                 mov rcx, rax
0000000140347361  4889fa                 mov rdx, rdi
0000000140347364  4989d8                 mov r8, rbx
0000000140347367  e8efc9c405             call 0x145f93d5b
000000014034736c  4d89e7                 mov r15, r12
000000014034736f  4c8ba518030000         mov r12, qword ptr [rbp + 0x318]
0000000140347376  41807d0001             cmp byte ptr [r13], 1
000000014034737b  752e                   jne 0x1403473ab
000000014034737d  418b4501               mov eax, dword ptr [r13 + 1]
0000000140347381  418b4d04               mov ecx, dword ptr [r13 + 4]
0000000140347385  898d43030000           mov dword ptr [rbp + 0x343], ecx
000000014034738b  898540030000           mov dword ptr [rbp + 0x340], eax
0000000140347391  498b4508               mov rax, qword ptr [r13 + 8]
0000000140347395  410fb64d10             movzx ecx, byte ptr [r13 + 0x10]
000000014034739a  b201                   mov dl, 1
000000014034739c  eb1d                   jmp 0x1403473bb
000000014034739e  41be01000000           mov r14d, 1
00000001403473a4  41807d0001             cmp byte ptr [r13], 1
00000001403473a9  74d2                   je 0x14034737d
00000001403473ab  498b4508               mov rax, qword ptr [r13 + 8]
00000001403473af  f048ff00               lock inc qword ptr [rax]
00000001403473b3  0f8e72020000           jle 0x14034762b
00000001403473b9  31d2                   xor edx, edx
00000001403473bb  488dbdf8000000         lea rdi, [rbp + 0xf8]
00000001403473c2  448b8590010000         mov r8d, dword ptr [rbp + 0x190]
00000001403473c9  44898534030000         mov dword ptr [rbp + 0x334], r8d
00000001403473d0  0f288580010000         movaps xmm0, xmmword ptr [rbp + 0x180]
00000001403473d7  0f118524030000         movups xmmword ptr [rbp + 0x324], xmm0
00000001403473de  48899d88010000         mov qword ptr [rbp + 0x188], rbx
00000001403473e5  4c89b590010000         mov qword ptr [rbp + 0x190], r14
00000001403473ec  48899d98010000         mov qword ptr [rbp + 0x198], rbx
00000001403473f3  48c785a001000000000000 mov qword ptr [rbp + 0x1a0], 0
00000001403473fe  48c785a801000004000000 mov qword ptr [rbp + 0x1a8], 4
0000000140347409  48c785b001000000000000 mov qword ptr [rbp + 0x1b0], 0
0000000140347414  8895b8010000           mov byte ptr [rbp + 0x1b8], dl
000000014034741a  8b9540030000           mov edx, dword ptr [rbp + 0x340]
0000000140347420  448b8543030000         mov r8d, dword ptr [rbp + 0x343]
0000000140347427  8995b9010000           mov dword ptr [rbp + 0x1b9], edx
000000014034742d  448985bc010000         mov dword ptr [rbp + 0x1bc], r8d
0000000140347434  488985c0010000         mov qword ptr [rbp + 0x1c0], rax
000000014034743b  48898dc8010000         mov qword ptr [rbp + 0x1c8], rcx
0000000140347442  c785d001000000005041   mov dword ptr [rbp + 0x1d0], 0x41500000
000000014034744c  66c785d40100009001     mov word ptr [rbp + 0x1d4], 0x190
0000000140347455  c685d601000001         mov byte ptr [rbp + 0x1d6], 1
000000014034745c  0f108523030000         movups xmm0, xmmword ptr [rbp + 0x323]
0000000140347463  0f1185d7010000         movups xmmword ptr [rbp + 0x1d7], xmm0
000000014034746a  488b8530030000         mov rax, qword ptr [rbp + 0x330]
0000000140347471  488985e4010000         mov qword ptr [rbp + 0x1e4], rax
0000000140347478  8b1d1226e505           mov ebx, dword ptr [rip + 0x5e52612]
000000014034747e  899dfc010000           mov dword ptr [rbp + 0x1fc], ebx
0000000140347484  0f1035f525e505         movups xmm6, xmmword ptr [rip + 0x5e525f5]
000000014034748b  0f11b5ec010000         movups xmmword ptr [rbp + 0x1ec], xmm6
0000000140347492  f20f103d66c7e105       movsd xmm7, qword ptr [rip + 0x5e1c766]
000000014034749a  f20f11bd00020000       movsd qword ptr [rbp + 0x200], xmm7
00000001403474a2  4c89a580010000         mov qword ptr [rbp + 0x180], r12
00000001403474a9  c6855703000000         mov byte ptr [rbp + 0x357], 0
00000001403474b0  488d4db0               lea rcx, [rbp - 0x50]
00000001403474b4  4c8d8580010000         lea r8, [rbp + 0x180]
00000001403474bb  4889fa                 mov rdx, rdi
00000001403474be  e84d70f7ff             call 0x1402be510
00000001403474c3  90                     nop
00000001403474c4  418b4710               mov eax, dword ptr [r15 + 0x10]
00000001403474c8  898590010000           mov dword ptr [rbp + 0x190], eax
00000001403474ce  410f1007               movups xmm0, xmmword ptr [r15]
00000001403474d2  0f298580010000         movaps xmmword ptr [rbp + 0x180], xmm0
00000001403474d9  41807d0001             cmp byte ptr [r13], 1
00000001403474de  7521                   jne 0x140347501
00000001403474e0  418b4501               mov eax, dword ptr [r13 + 1]
00000001403474e4  418b4d04               mov ecx, dword ptr [r13 + 4]
00000001403474e8  898d3b030000           mov dword ptr [rbp + 0x33b], ecx
00000001403474ee  898538030000           mov dword ptr [rbp + 0x338], eax
00000001403474f4  498b4508               mov rax, qword ptr [r13 + 8]
00000001403474f8  410fb64d10             movzx ecx, byte ptr [r13 + 0x10]
00000001403474fd  b201                   mov dl, 1
00000001403474ff  eb10                   jmp 0x140347511
0000000140347501  498b4508               mov rax, qword ptr [r13 + 8]
0000000140347505  f048ff00               lock inc qword ptr [rax]
0000000140347509  0f8e1c010000           jle 0x14034762b
000000014034750f  31d2                   xor edx, edx
0000000140347511  448b8590010000         mov r8d, dword ptr [rbp + 0x190]
0000000140347518  44898534030000         mov dword ptr [rbp + 0x334], r8d
000000014034751f  0f288580010000         movaps xmm0, xmmword ptr [rbp + 0x180]
0000000140347526  0f118524030000         movups xmmword ptr [rbp + 0x324], xmm0
000000014034752d  4c8b8d48030000         mov r9, qword ptr [rbp + 0x348]
0000000140347534  4d8b4110               mov r8, qword ptr [r9 + 0x10]
0000000140347538  4c898598010000         mov qword ptr [rbp + 0x198], r8
000000014034753f  410f1001               movups xmm0, xmmword ptr [r9]
0000000140347543  0f118588010000         movups xmmword ptr [rbp + 0x188], xmm0
000000014034754a  48c785a001000000000000 mov qword ptr [rbp + 0x1a0], 0
0000000140347555  48c785a801000004000000 mov qword ptr [rbp + 0x1a8], 4
0000000140347560  48c785b001000000000000 mov qword ptr [rbp + 0x1b0], 0
000000014034756b  8895b8010000           mov byte ptr [rbp + 0x1b8], dl
0000000140347571  8b9538030000           mov edx, dword ptr [rbp + 0x338]
0000000140347577  448b853b030000         mov r8d, dword ptr [rbp + 0x33b]
000000014034757e  8995b9010000           mov dword ptr [rbp + 0x1b9], edx
0000000140347584  448985bc010000         mov dword ptr [rbp + 0x1bc], r8d
000000014034758b  488985c0010000         mov qword ptr [rbp + 0x1c0], rax
0000000140347592  48898dc8010000         mov qword ptr [rbp + 0x1c8], rcx
0000000140347599  c785d001000000003041   mov dword ptr [rbp + 0x1d0], 0x41300000
00000001403475a3  66c785d40100009001     mov word ptr [rbp + 0x1d4], 0x190
00000001403475ac  c685d601000001         mov byte ptr [rbp + 0x1d6], 1
00000001403475b3  0f108523030000         movups xmm0, xmmword ptr [rbp + 0x323]
00000001403475ba  0f1185d7010000         movups xmmword ptr [rbp + 0x1d7], xmm0
00000001403475c1  488b8530030000         mov rax, qword ptr [rbp + 0x330]
00000001403475c8  488985e4010000         mov qword ptr [rbp + 0x1e4], rax
00000001403475cf  899dfc010000           mov dword ptr [rbp + 0x1fc], ebx
00000001403475d5  0f11b5ec010000         movups xmmword ptr [rbp + 0x1ec], xmm6
00000001403475dc  f20f11bd00020000       movsd qword ptr [rbp + 0x200], xmm7
00000001403475e4  4c89a580010000         mov qword ptr [rbp + 0x180], r12
00000001403475eb  c6855703000001         mov byte ptr [rbp + 0x357], 1
00000001403475f2  488d4db0               lea rcx, [rbp - 0x50]
00000001403475f6  4c8d8580010000         lea r8, [rbp + 0x180]
00000001403475fd  4889fa                 mov rdx, rdi
0000000140347600  e80b6ff7ff             call 0x1402be510
0000000140347605  90                     nop
0000000140347606  4889f0                 mov rax, rsi
0000000140347609  0f28b560030000         movaps xmm6, xmmword ptr [rbp + 0x360]
0000000140347610  0f28bd70030000         movaps xmm7, xmmword ptr [rbp + 0x370]
0000000140347617  4881c408040000         add rsp, 0x408
000000014034761e  5b                     pop rbx
000000014034761f  5f                     pop rdi
0000000140347620  5e                     pop rsi
0000000140347621  415c                   pop r12
0000000140347623  415d                   pop r13
0000000140347625  415e                   pop r14
0000000140347627  415f                   pop r15
0000000140347629  5d                     pop rbp
000000014034762a  c3                     ret
000000014034762b  0f0b                   ud2
