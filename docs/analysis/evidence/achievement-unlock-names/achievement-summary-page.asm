0000000140265680  55                     push rbp
0000000140265681  4157                   push r15
0000000140265683  4156                   push r14
0000000140265685  4155                   push r13
0000000140265687  4154                   push r12
0000000140265689  56                     push rsi
000000014026568a  57                     push rdi
000000014026568b  53                     push rbx
000000014026568c  4881ec48080000         sub rsp, 0x848
0000000140265693  488dac2480000000       lea rbp, [rsp + 0x80]
000000014026569b  440f29bdb0070000       movaps xmmword ptr [rbp + 0x7b0], xmm15
00000001402656a3  440f29b5a0070000       movaps xmmword ptr [rbp + 0x7a0], xmm14
00000001402656ab  440f29ad90070000       movaps xmmword ptr [rbp + 0x790], xmm13
00000001402656b3  440f29a580070000       movaps xmmword ptr [rbp + 0x780], xmm12
00000001402656bb  440f299d70070000       movaps xmmword ptr [rbp + 0x770], xmm11
00000001402656c3  440f299560070000       movaps xmmword ptr [rbp + 0x760], xmm10
00000001402656cb  440f298d50070000       movaps xmmword ptr [rbp + 0x750], xmm9
00000001402656d3  440f298540070000       movaps xmmword ptr [rbp + 0x740], xmm8
00000001402656db  0f29bd30070000         movaps xmmword ptr [rbp + 0x730], xmm7
00000001402656e2  0f29b520070000         movaps xmmword ptr [rbp + 0x720], xmm6
00000001402656e9  48c78518070000feffffff mov qword ptr [rbp + 0x718], 0xfffffffffffffffe
00000001402656f4  4d89ce                 mov r14, r9
00000001402656f7  4d89c5                 mov r13, r8
00000001402656fa  488995b0060000         mov qword ptr [rbp + 0x6b0], rdx
0000000140265701  48898d88060000         mov qword ptr [rbp + 0x688], rcx
0000000140265708  4c8bbd30080000         mov r15, qword ptr [rbp + 0x830]
000000014026570f  488d8db8030000         lea rcx, [rbp + 0x3b8]
0000000140265716  4c89fa                 mov rdx, r15
0000000140265719  e83279e8ff             call 0x1400ed050
000000014026571e  4983bf68010000ff       cmp qword ptr [r15 + 0x168], -1
0000000140265726  4c89b540060000         mov qword ptr [rbp + 0x640], r14
000000014026572d  0f84d7000000           je 0x14026580a
0000000140265733  498d9768010000         lea rdx, [r15 + 0x168]
000000014026573a  418a9fa0010000         mov bl, byte ptr [r15 + 0x1a0]
0000000140265741  418ab7a1010000         mov sil, byte ptr [r15 + 0x1a1]
0000000140265748  418abfa2010000         mov dil, byte ptr [r15 + 0x1a2]
000000014026574f  488d8d58060000         lea rcx, [rbp + 0x658]
0000000140265756  e8951cd005             call 0x145f673f0
000000014026575b  90                     nop
000000014026575c  498d9780010000         lea rdx, [r15 + 0x180]
0000000140265763  488d8db0010000         lea rcx, [rbp + 0x1b0]
000000014026576a  e8811cd005             call 0x145f673f0
000000014026576f  90                     nop
0000000140265770  410fb687a7010000       movzx eax, byte ptr [r15 + 0x1a7]
0000000140265778  88850f040000           mov byte ptr [rbp + 0x40f], al
000000014026577e  418b87a3010000         mov eax, dword ptr [r15 + 0x1a3]
0000000140265785  89850b040000           mov dword ptr [rbp + 0x40b], eax
000000014026578b  498b8798010000         mov rax, qword ptr [r15 + 0x198]
0000000140265792  488b8d68060000         mov rcx, qword ptr [rbp + 0x668]
0000000140265799  48894dc0               mov qword ptr [rbp - 0x40], rcx
000000014026579d  0f108558060000         movups xmm0, xmmword ptr [rbp + 0x658]
00000001402657a4  488b8dc0010000         mov rcx, qword ptr [rbp + 0x1c0]
00000001402657ab  48894dd8               mov qword ptr [rbp - 0x28], rcx
00000001402657af  0f108db0010000         movups xmm1, xmmword ptr [rbp + 0x1b0]
00000001402657b6  0f114dc8               movups xmmword ptr [rbp - 0x38], xmm1
00000001402657ba  0f2985d0030000         movaps xmmword ptr [rbp + 0x3d0], xmm0
00000001402657c1  488b4dd0               mov rcx, qword ptr [rbp - 0x30]
00000001402657c5  48898df0030000         mov qword ptr [rbp + 0x3f0], rcx
00000001402657cc  488b4dd8               mov rcx, qword ptr [rbp - 0x28]
00000001402657d0  48898df8030000         mov qword ptr [rbp + 0x3f8], rcx
00000001402657d7  488b4dc0               mov rcx, qword ptr [rbp - 0x40]
00000001402657db  48898de0030000         mov qword ptr [rbp + 0x3e0], rcx
00000001402657e2  488b4dc8               mov rcx, qword ptr [rbp - 0x38]
00000001402657e6  48898de8030000         mov qword ptr [rbp + 0x3e8], rcx
00000001402657ed  48898500040000         mov qword ptr [rbp + 0x400], rax
00000001402657f4  889d08040000           mov byte ptr [rbp + 0x408], bl
00000001402657fa  4088b509040000         mov byte ptr [rbp + 0x409], sil
0000000140265801  4088bd0a040000         mov byte ptr [rbp + 0x40a], dil
0000000140265808  eb0b                   jmp 0x140265815
000000014026580a  48c785d0030000ffffffff mov qword ptr [rbp + 0x3d0], 0xffffffffffffffff
0000000140265815  498b7f28               mov rdi, qword ptr [r15 + 0x28]
0000000140265819  4989fc                 mov r12, rdi
000000014026581c  49c1e404               shl r12, 4
0000000140265820  4889f8                 mov rax, rdi
0000000140265823  48c1e83c               shr rax, 0x3c
0000000140265827  0f95c0                 setne al
000000014026582a  49bef8ffffffffffff7f   movabs r14, 0x7ffffffffffffff8
0000000140265834  4d39f4                 cmp r12, r14
0000000140265837  0f97c1                 seta cl
000000014026583a  08c1                   or cl, al
000000014026583c  7413                   je 0x140265851
000000014026583e  31f6                   xor esi, esi
0000000140265840  4889f1                 mov rcx, rsi
0000000140265843  4c89e2                 mov rdx, r12
0000000140265846  e87059ed05             call 0x14613b1bb
000000014026584b  90                     nop
000000014026584c  e9bd040000             jmp 0x140265d0e
0000000140265851  4c89adc0060000         mov qword ptr [rbp + 0x6c0], r13
0000000140265858  4d8b6f20               mov r13, qword ptr [r15 + 0x20]
000000014026585c  4d85e4                 test r12, r12
000000014026585f  0f84f8000000           je 0x14026595d
0000000140265865  e896c9d9ff             call 0x140002200
000000014026586a  be08000000             mov esi, 8
000000014026586f  ba08000000             mov edx, 8
0000000140265874  4c89e1                 mov rcx, r12
0000000140265877  e844c9d9ff             call 0x1400021c0
000000014026587c  4885c0                 test rax, rax
000000014026587f  74bf                   je 0x140265840
0000000140265881  4889c3                 mov rbx, rax
0000000140265884  4889bdb8060000         mov qword ptr [rbp + 0x6b8], rdi
000000014026588b  4885ff                 test rdi, rdi
000000014026588e  740e                   je 0x14026589e
0000000140265890  4889d9                 mov rcx, rbx
0000000140265893  4c89ea                 mov rdx, r13
0000000140265896  4d89e0                 mov r8, r12
0000000140265899  e83de9d205             call 0x145f941db
000000014026589e  48899d90060000         mov qword ptr [rbp + 0x690], rbx
00000001402658a5  498b5f40               mov rbx, qword ptr [r15 + 0x40]
00000001402658a9  4c8d249d00000000       lea r12, [rbx*4]
00000001402658b1  4889d8                 mov rax, rbx
00000001402658b4  48c1e83e               shr rax, 0x3e
00000001402658b8  0f95c0                 setne al
00000001402658bb  48b9fcffffffffffff7f   movabs rcx, 0x7ffffffffffffffc
00000001402658c5  4939cc                 cmp r12, rcx
00000001402658c8  0f97c1                 seta cl
00000001402658cb  08c1                   or cl, al
00000001402658cd  7413                   je 0x1402658e2
00000001402658cf  31f6                   xor esi, esi
00000001402658d1  4889f1                 mov rcx, rsi
00000001402658d4  4c89e2                 mov rdx, r12
00000001402658d7  e8df58ed05             call 0x14613b1bb
00000001402658dc  90                     nop
00000001402658dd  e92c040000             jmp 0x140265d0e
00000001402658e2  4d8b6f38               mov r13, qword ptr [r15 + 0x38]
00000001402658e6  4d85e4                 test r12, r12
00000001402658e9  0f8415010000           je 0x140265a04
00000001402658ef  e80cc9d9ff             call 0x140002200
00000001402658f4  be04000000             mov esi, 4
00000001402658f9  ba04000000             mov edx, 4
00000001402658fe  4c89e1                 mov rcx, r12
0000000140265901  e8bac8d9ff             call 0x1400021c0
0000000140265906  488985f8060000         mov qword ptr [rbp + 0x6f8], rax
000000014026590d  4885c0                 test rax, rax
0000000140265910  74bf                   je 0x1402658d1
0000000140265912  4889de                 mov rsi, rbx
0000000140265915  4885db                 test rbx, rbx
0000000140265918  7412                   je 0x14026592c
000000014026591a  488b8df8060000         mov rcx, qword ptr [rbp + 0x6f8]
0000000140265921  4c89ea                 mov rdx, r13
0000000140265924  4d89e0                 mov r8, r12
0000000140265927  e8afe8d205             call 0x145f941db
000000014026592c  4d8b6f58               mov r13, qword ptr [r15 + 0x58]
0000000140265930  4969d5e8000000         imul rdx, r13, 0xe8
0000000140265937  48b8b0dcd308cb3d8d00   movabs rax, 0x8d3dcb08d3dcb0
0000000140265941  4939c5                 cmp r13, rax
0000000140265944  4889b598060000         mov qword ptr [rbp + 0x698], rsi
000000014026594b  762e                   jbe 0x14026597b
000000014026594d  31f6                   xor esi, esi
000000014026594f  4889f1                 mov rcx, rsi
0000000140265952  e86458ed05             call 0x14613b1bb
0000000140265957  90                     nop
0000000140265958  e9b1030000             jmp 0x140265d0e
000000014026595d  bb08000000             mov ebx, 8
0000000140265962  48c785b806000000000000 mov qword ptr [rbp + 0x6b8], 0
000000014026596d  4885ff                 test rdi, rdi
0000000140265970  0f851affffff           jne 0x140265890
0000000140265976  e923ffffff             jmp 0x14026589e
000000014026597b  4885d2                 test rdx, rdx
000000014026597e  488995e8060000         mov qword ptr [rbp + 0x6e8], rdx
0000000140265985  4c89ada0060000         mov qword ptr [rbp + 0x6a0], r13
000000014026598c  0f848e000000           je 0x140265a20
0000000140265992  4d8b6750               mov r12, qword ptr [r15 + 0x50]
0000000140265996  e865c8d9ff             call 0x140002200
000000014026599b  be04000000             mov esi, 4
00000001402659a0  ba04000000             mov edx, 4
00000001402659a5  488b8de8060000         mov rcx, qword ptr [rbp + 0x6e8]
00000001402659ac  e80fc8d9ff             call 0x1400021c0
00000001402659b1  488b95e8060000         mov rdx, qword ptr [rbp + 0x6e8]
00000001402659b8  488985f0060000         mov qword ptr [rbp + 0x6f0], rax
00000001402659bf  4885c0                 test rax, rax
00000001402659c2  748b                   je 0x14026594f
00000001402659c4  4d85ed                 test r13, r13
00000001402659c7  7463                   je 0x140265a2c
00000001402659c9  31f6                   xor esi, esi
00000001402659cb  0f1f440000             nop dword ptr [rax + rax]
00000001402659d0  4839f2                 cmp rdx, rsi
00000001402659d3  7457                   je 0x140265a2c
00000001402659d5  498d1434               lea rdx, [r12 + rsi]
00000001402659d9  488b85f0060000         mov rax, qword ptr [rbp + 0x6f0]
00000001402659e0  488d0c30               lea rcx, [rax + rsi]
00000001402659e4  41b8e8000000           mov r8d, 0xe8
00000001402659ea  e8ece7d205             call 0x145f941db
00000001402659ef  488b95e8060000         mov rdx, qword ptr [rbp + 0x6e8]
00000001402659f6  4881c6e8000000         add rsi, 0xe8
00000001402659fd  49ffcd                 dec r13
0000000140265a00  75ce                   jne 0x1402659d0
0000000140265a02  eb28                   jmp 0x140265a2c
0000000140265a04  b804000000             mov eax, 4
0000000140265a09  488985f8060000         mov qword ptr [rbp + 0x6f8], rax
0000000140265a10  31f6                   xor esi, esi
0000000140265a12  4885db                 test rbx, rbx
0000000140265a15  0f85fffeffff           jne 0x14026591a
0000000140265a1b  e90cffffff             jmp 0x14026592c
0000000140265a20  b804000000             mov eax, 4
0000000140265a25  488985f0060000         mov qword ptr [rbp + 0x6f0], rax
0000000140265a2c  498d5760               lea rdx, [r15 + 0x60]
0000000140265a30  488d8da0030000         lea rcx, [rbp + 0x3a0]
0000000140265a37  e88488e8ff             call 0x1400ee2c0
0000000140265a3c  90                     nop
0000000140265a3d  498d5778               lea rdx, [r15 + 0x78]
0000000140265a41  488d8d28060000         lea rcx, [rbp + 0x628]
0000000140265a48  e84383e8ff             call 0x1400edd90
0000000140265a4d  90                     nop
0000000140265a4e  498d9790000000         lea rdx, [r15 + 0x90]
0000000140265a55  488d8d10060000         lea rcx, [rbp + 0x610]
0000000140265a5c  e80f80e8ff             call 0x1400eda70
0000000140265a61  90                     nop
0000000140265a62  498d97a8000000         lea rdx, [r15 + 0xa8]
0000000140265a69  488d8df8050000         lea rcx, [rbp + 0x5f8]
0000000140265a70  e8cb65e8ff             call 0x1400ec040
0000000140265a75  90                     nop
0000000140265a76  498d97c0000000         lea rdx, [r15 + 0xc0]
0000000140265a7d  488d8de0050000         lea rcx, [rbp + 0x5e0]
0000000140265a84  e87781e8ff             call 0x1400edc00
0000000140265a89  90                     nop
0000000140265a8a  498bb7e8000000         mov rsi, qword ptr [r15 + 0xe8]
0000000140265a91  4989f4                 mov r12, rsi
0000000140265a94  49c1e404               shl r12, 4
0000000140265a98  4889f0                 mov rax, rsi
0000000140265a9b  48c1e83c               shr rax, 0x3c
0000000140265a9f  0f95c0                 setne al
0000000140265aa2  4d39f4                 cmp r12, r14
0000000140265aa5  0f97c1                 seta cl
0000000140265aa8  08c1                   or cl, al
0000000140265aaa  7413                   je 0x140265abf
0000000140265aac  31f6                   xor esi, esi
0000000140265aae  4889f1                 mov rcx, rsi
0000000140265ab1  4c89e2                 mov rdx, r12
0000000140265ab4  e80257ed05             call 0x14613b1bb
0000000140265ab9  90                     nop
0000000140265aba  e94f020000             jmp 0x140265d0e
0000000140265abf  498b97e0000000         mov rdx, qword ptr [r15 + 0xe0]
0000000140265ac6  4d85e4                 test r12, r12
0000000140265ac9  0f84d4000000           je 0x140265ba3
0000000140265acf  48899508070000         mov qword ptr [rbp + 0x708], rdx
0000000140265ad6  4989f5                 mov r13, rsi
0000000140265ad9  e822c7d9ff             call 0x140002200
0000000140265ade  be08000000             mov esi, 8
0000000140265ae3  ba08000000             mov edx, 8
0000000140265ae8  4c89e1                 mov rcx, r12
0000000140265aeb  e8d0c6d9ff             call 0x1400021c0
0000000140265af0  48898500070000         mov qword ptr [rbp + 0x700], rax
0000000140265af7  4885c0                 test rax, rax
0000000140265afa  74b2                   je 0x140265aae
0000000140265afc  4c89ee                 mov rsi, r13
0000000140265aff  4c89adc8060000         mov qword ptr [rbp + 0x6c8], r13
0000000140265b06  488b9508070000         mov rdx, qword ptr [rbp + 0x708]
0000000140265b0d  4885f6                 test rsi, rsi
0000000140265b10  740f                   je 0x140265b21
0000000140265b12  488b8d00070000         mov rcx, qword ptr [rbp + 0x700]
0000000140265b19  4d89e0                 mov r8, r12
0000000140265b1c  e8bae6d205             call 0x145f941db
0000000140265b21  4d8baf00010000         mov r13, qword ptr [r15 + 0x100]
0000000140265b28  4e8d24ed00000000       lea r12, [r13*8]
0000000140265b30  4c89e8                 mov rax, r13
0000000140265b33  48c1e83d               shr rax, 0x3d
0000000140265b37  0f95c0                 setne al
0000000140265b3a  4d39f4                 cmp r12, r14
0000000140265b3d  0f97c1                 seta cl
0000000140265b40  08c1                   or cl, al
0000000140265b42  7413                   je 0x140265b57
0000000140265b44  31f6                   xor esi, esi
0000000140265b46  4889f1                 mov rcx, rsi
0000000140265b49  4c89e2                 mov rdx, r12
0000000140265b4c  e86a56ed05             call 0x14613b1bb
0000000140265b51  90                     nop
0000000140265b52  e9b7010000             jmp 0x140265d0e
0000000140265b57  498b97f8000000         mov rdx, qword ptr [r15 + 0xf8]
0000000140265b5e  4d85e4                 test r12, r12
0000000140265b61  7465                   je 0x140265bc8
0000000140265b63  48899510070000         mov qword ptr [rbp + 0x710], rdx
0000000140265b6a  4989f6                 mov r14, rsi
0000000140265b6d  e88ec6d9ff             call 0x140002200
0000000140265b72  be08000000             mov esi, 8
0000000140265b77  ba08000000             mov edx, 8
0000000140265b7c  4c89e1                 mov rcx, r12
0000000140265b7f  e83cc6d9ff             call 0x1400021c0
0000000140265b84  48898508070000         mov qword ptr [rbp + 0x708], rax
0000000140265b8b  4885c0                 test rax, rax
0000000140265b8e  74b6                   je 0x140265b46
0000000140265b90  4c89add0060000         mov qword ptr [rbp + 0x6d0], r13
0000000140265b97  4c89f6                 mov rsi, r14
0000000140265b9a  488b9510070000         mov rdx, qword ptr [rbp + 0x710]
0000000140265ba1  eb3c                   jmp 0x140265bdf
0000000140265ba3  b808000000             mov eax, 8
0000000140265ba8  48898500070000         mov qword ptr [rbp + 0x700], rax
0000000140265baf  48c785c806000000000000 mov qword ptr [rbp + 0x6c8], 0
0000000140265bba  4885f6                 test rsi, rsi
0000000140265bbd  0f854fffffff           jne 0x140265b12
0000000140265bc3  e959ffffff             jmp 0x140265b21
0000000140265bc8  b808000000             mov eax, 8
0000000140265bcd  48898508070000         mov qword ptr [rbp + 0x708], rax
0000000140265bd4  48c785d006000000000000 mov qword ptr [rbp + 0x6d0], 0
0000000140265bdf  4d85ed                 test r13, r13
0000000140265be2  740f                   je 0x140265bf3
0000000140265be4  488b8d08070000         mov rcx, qword ptr [rbp + 0x708]
0000000140265beb  4d89e0                 mov r8, r12
0000000140265bee  e8e8e5d205             call 0x145f941db
0000000140265bf3  498d9708010000         lea rdx, [r15 + 0x108]
0000000140265bfa  488d8d58060000         lea rcx, [rbp + 0x658]
0000000140265c01  e86a7ee8ff             call 0x1400eda70
0000000140265c06  90                     nop
0000000140265c07  4d8bb730010000         mov r14, qword ptr [r15 + 0x130]
0000000140265c0e  4e8d24b500000000       lea r12, [r14*4]
0000000140265c16  4c89f0                 mov rax, r14
0000000140265c19  48c1e83e               shr rax, 0x3e
0000000140265c1d  0f95c0                 setne al
0000000140265c20  48b9fcffffffffffff7f   movabs rcx, 0x7ffffffffffffffc
0000000140265c2a  4939cc                 cmp r12, rcx
0000000140265c2d  0f97c1                 seta cl
0000000140265c30  08c1                   or cl, al
0000000140265c32  7413                   je 0x140265c47
0000000140265c34  31f6                   xor esi, esi
0000000140265c36  4889f1                 mov rcx, rsi
0000000140265c39  4c89e2                 mov rdx, r12
0000000140265c3c  e87a55ed05             call 0x14613b1bb
0000000140265c41  90                     nop
0000000140265c42  e9c7000000             jmp 0x140265d0e
0000000140265c47  498b9728010000         mov rdx, qword ptr [r15 + 0x128]
0000000140265c4e  4d85e4                 test r12, r12
0000000140265c51  4889b548060000         mov qword ptr [rbp + 0x648], rsi
0000000140265c58  743a                   je 0x140265c94
0000000140265c5a  488995e0060000         mov qword ptr [rbp + 0x6e0], rdx
0000000140265c61  e89ac5d9ff             call 0x140002200
0000000140265c66  be04000000             mov esi, 4
0000000140265c6b  ba04000000             mov edx, 4
0000000140265c70  4c89e1                 mov rcx, r12
0000000140265c73  e848c5d9ff             call 0x1400021c0
0000000140265c78  48898510070000         mov qword ptr [rbp + 0x710], rax
0000000140265c7f  4885c0                 test rax, rax
0000000140265c82  74b2                   je 0x140265c36
0000000140265c84  4c89b5d8060000         mov qword ptr [rbp + 0x6d8], r14
0000000140265c8b  488b95e0060000         mov rdx, qword ptr [rbp + 0x6e0]
0000000140265c92  eb17                   jmp 0x140265cab
0000000140265c94  b804000000             mov eax, 4
0000000140265c99  48898510070000         mov qword ptr [rbp + 0x710], rax
0000000140265ca0  48c785d806000000000000 mov qword ptr [rbp + 0x6d8], 0
0000000140265cab  4d85f6                 test r14, r14
0000000140265cae  740f                   je 0x140265cbf
0000000140265cb0  488b8d10070000         mov rcx, qword ptr [rbp + 0x710]
0000000140265cb7  4d89e0                 mov r8, r12
0000000140265cba  e81ce5d205             call 0x145f941db
0000000140265cbf  418b87e0010000         mov eax, dword ptr [r15 + 0x1e0]
0000000140265cc6  8985e0060000           mov dword ptr [rbp + 0x6e0], eax
0000000140265ccc  498d9738010000         lea rdx, [r15 + 0x138]
0000000140265cd3  488d4db0               lea rcx, [rbp - 0x50]
0000000140265cd7  e86463e8ff             call 0x1400ec040
0000000140265cdc  90                     nop
0000000140265cdd  4d8b9760010000         mov r10, qword ptr [r15 + 0x160]
0000000140265ce4  4e8d24d500000000       lea r12, [r10*8]
0000000140265cec  4c89d0                 mov rax, r10
0000000140265cef  48c1e83d               shr rax, 0x3d
0000000140265cf3  0f95c0                 setne al
0000000140265cf6  4d85e4                 test r12, r12
0000000140265cf9  0f98c1                 sets cl
0000000140265cfc  08c1                   or cl, al
0000000140265cfe  7410                   je 0x140265d10
0000000140265d00  31f6                   xor esi, esi
0000000140265d02  4889f1                 mov rcx, rsi
0000000140265d05  4c89e2                 mov rdx, r12
0000000140265d08  e8ae54ed05             call 0x14613b1bb
0000000140265d0d  90                     nop
0000000140265d0e  0f0b                   ud2
0000000140265d10  498b9758010000         mov rdx, qword ptr [r15 + 0x158]
0000000140265d17  4d85e4                 test r12, r12
0000000140265d1a  4c8995a8060000         mov qword ptr [rbp + 0x6a8], r10
0000000140265d21  7439                   je 0x140265d5c
0000000140265d23  48899550060000         mov qword ptr [rbp + 0x650], rdx
0000000140265d2a  e8d1c4d9ff             call 0x140002200
0000000140265d2f  be01000000             mov esi, 1
0000000140265d34  ba01000000             mov edx, 1
0000000140265d39  4c89e1                 mov rcx, r12
0000000140265d3c  e87fc4d9ff             call 0x1400021c0
0000000140265d41  4885c0                 test rax, rax
0000000140265d44  74bc                   je 0x140265d02
0000000140265d46  4989c0                 mov r8, rax
0000000140265d49  4c8b95a8060000         mov r10, qword ptr [rbp + 0x6a8]
0000000140265d50  4d89d1                 mov r9, r10
0000000140265d53  488b9550060000         mov rdx, qword ptr [rbp + 0x650]
0000000140265d5a  eb09                   jmp 0x140265d65
0000000140265d5c  41b801000000           mov r8d, 1
0000000140265d62  4531c9                 xor r9d, r9d
0000000140265d65  4d85d2                 test r10, r10
0000000140265d68  741e                   je 0x140265d88
0000000140265d6a  4c89c1                 mov rcx, r8
0000000140265d6d  4c89c6                 mov rsi, r8
0000000140265d70  4d89e0                 mov r8, r12
0000000140265d73  4d89cc                 mov r12, r9
0000000140265d76  e860e4d205             call 0x145f941db
0000000140265d7b  4d89e1                 mov r9, r12
0000000140265d7e  4989f0                 mov r8, rsi
0000000140265d81  4c8b95a8060000         mov r10, qword ptr [rbp + 0x6a8]
0000000140265d88  488b85c8030000         mov rax, qword ptr [rbp + 0x3c8]
0000000140265d8f  488985c0010000         mov qword ptr [rbp + 0x1c0], rax
0000000140265d96  0f1085b8030000         movups xmm0, xmmword ptr [rbp + 0x3b8]
0000000140265d9d  0f2985b0010000         movaps xmmword ptr [rbp + 0x1b0], xmm0
0000000140265da4  0f2885d0030000         movaps xmm0, xmmword ptr [rbp + 0x3d0]
0000000140265dab  0f288de0030000         movaps xmm1, xmmword ptr [rbp + 0x3e0]
0000000140265db2  0f2895f0030000         movaps xmm2, xmmword ptr [rbp + 0x3f0]
0000000140265db9  0f289d00040000         movaps xmm3, xmmword ptr [rbp + 0x400]
0000000140265dc0  0f118518030000         movups xmmword ptr [rbp + 0x318], xmm0
0000000140265dc7  0f118d28030000         movups xmmword ptr [rbp + 0x328], xmm1
0000000140265dce  0f119538030000         movups xmmword ptr [rbp + 0x338], xmm2
0000000140265dd5  0f119d48030000         movups xmmword ptr [rbp + 0x348], xmm3
0000000140265ddc  488b85b8060000         mov rax, qword ptr [rbp + 0x6b8]
0000000140265de3  488985c8010000         mov qword ptr [rbp + 0x1c8], rax
0000000140265dea  488b8590060000         mov rax, qword ptr [rbp + 0x690]
0000000140265df1  488985d0010000         mov qword ptr [rbp + 0x1d0], rax
0000000140265df8  4889bdd8010000         mov qword ptr [rbp + 0x1d8], rdi
0000000140265dff  488b8598060000         mov rax, qword ptr [rbp + 0x698]
0000000140265e06  488985e0010000         mov qword ptr [rbp + 0x1e0], rax
0000000140265e0d  488b85f8060000         mov rax, qword ptr [rbp + 0x6f8]
0000000140265e14  488985e8010000         mov qword ptr [rbp + 0x1e8], rax
0000000140265e1b  48899df0010000         mov qword ptr [rbp + 0x1f0], rbx
0000000140265e22  488b85a0060000         mov rax, qword ptr [rbp + 0x6a0]
0000000140265e29  488985f8010000         mov qword ptr [rbp + 0x1f8], rax
0000000140265e30  488b8df0060000         mov rcx, qword ptr [rbp + 0x6f0]
0000000140265e37  48898d00020000         mov qword ptr [rbp + 0x200], rcx
0000000140265e3e  48898508020000         mov qword ptr [rbp + 0x208], rax
0000000140265e45  488b85b0030000         mov rax, qword ptr [rbp + 0x3b0]
0000000140265e4c  48898520020000         mov qword ptr [rbp + 0x220], rax
0000000140265e53  0f1085a0030000         movups xmm0, xmmword ptr [rbp + 0x3a0]
0000000140265e5a  0f298510020000         movaps xmmword ptr [rbp + 0x210], xmm0
0000000140265e61  488b8538060000         mov rax, qword ptr [rbp + 0x638]
0000000140265e68  48898538020000         mov qword ptr [rbp + 0x238], rax
0000000140265e6f  0f108528060000         movups xmm0, xmmword ptr [rbp + 0x628]
0000000140265e76  0f118528020000         movups xmmword ptr [rbp + 0x228], xmm0
0000000140265e7d  488b8520060000         mov rax, qword ptr [rbp + 0x620]
0000000140265e84  48898550020000         mov qword ptr [rbp + 0x250], rax
0000000140265e8b  0f108510060000         movups xmm0, xmmword ptr [rbp + 0x610]
0000000140265e92  0f298540020000         movaps xmmword ptr [rbp + 0x240], xmm0
0000000140265e99  488b8508060000         mov rax, qword ptr [rbp + 0x608]
0000000140265ea0  48898568020000         mov qword ptr [rbp + 0x268], rax
0000000140265ea7  0f1085f8050000         movups xmm0, xmmword ptr [rbp + 0x5f8]
0000000140265eae  0f118558020000         movups xmmword ptr [rbp + 0x258], xmm0
0000000140265eb5  488b85f0050000         mov rax, qword ptr [rbp + 0x5f0]
0000000140265ebc  48898580020000         mov qword ptr [rbp + 0x280], rax
0000000140265ec3  0f1085e0050000         movups xmm0, xmmword ptr [rbp + 0x5e0]
0000000140265eca  0f298570020000         movaps xmmword ptr [rbp + 0x270], xmm0
0000000140265ed1  498b87d8010000         mov rax, qword ptr [r15 + 0x1d8]
0000000140265ed8  48898588030000         mov qword ptr [rbp + 0x388], rax
0000000140265edf  410f1087a8010000       movups xmm0, xmmword ptr [r15 + 0x1a8]
0000000140265ee7  410f108fb8010000       movups xmm1, xmmword ptr [r15 + 0x1b8]
0000000140265eef  410f1097c8010000       movups xmm2, xmmword ptr [r15 + 0x1c8]
0000000140265ef7  0f119578030000         movups xmmword ptr [rbp + 0x378], xmm2
0000000140265efe  0f118d68030000         movups xmmword ptr [rbp + 0x368], xmm1
0000000140265f05  0f118558030000         movups xmmword ptr [rbp + 0x358], xmm0
0000000140265f0c  488b85c8060000         mov rax, qword ptr [rbp + 0x6c8]
0000000140265f13  48898588020000         mov qword ptr [rbp + 0x288], rax
0000000140265f1a  488b8500070000         mov rax, qword ptr [rbp + 0x700]
0000000140265f21  48898590020000         mov qword ptr [rbp + 0x290], rax
0000000140265f28  488b8548060000         mov rax, qword ptr [rbp + 0x648]
0000000140265f2f  48898598020000         mov qword ptr [rbp + 0x298], rax
0000000140265f36  488b85d0060000         mov rax, qword ptr [rbp + 0x6d0]
0000000140265f3d  488985a0020000         mov qword ptr [rbp + 0x2a0], rax
0000000140265f44  488b8508070000         mov rax, qword ptr [rbp + 0x708]
0000000140265f4b  488985a8020000         mov qword ptr [rbp + 0x2a8], rax
0000000140265f52  4c89adb0020000         mov qword ptr [rbp + 0x2b0], r13
0000000140265f59  488b8568060000         mov rax, qword ptr [rbp + 0x668]
0000000140265f60  488985c8020000         mov qword ptr [rbp + 0x2c8], rax
0000000140265f67  0f108558060000         movups xmm0, xmmword ptr [rbp + 0x658]
0000000140265f6e  0f1185b8020000         movups xmmword ptr [rbp + 0x2b8], xmm0
0000000140265f75  488b85d8060000         mov rax, qword ptr [rbp + 0x6d8]
0000000140265f7c  488985d0020000         mov qword ptr [rbp + 0x2d0], rax
0000000140265f83  488b8510070000         mov rax, qword ptr [rbp + 0x710]
0000000140265f8a  488985d8020000         mov qword ptr [rbp + 0x2d8], rax
0000000140265f91  4c89b5e0020000         mov qword ptr [rbp + 0x2e0], r14
0000000140265f98  8b85e0060000           mov eax, dword ptr [rbp + 0x6e0]
0000000140265f9e  898590030000           mov dword ptr [rbp + 0x390], eax
0000000140265fa4  488b45c0               mov rax, qword ptr [rbp - 0x40]
0000000140265fa8  488985f8020000         mov qword ptr [rbp + 0x2f8], rax
0000000140265faf  0f1045b0               movups xmm0, xmmword ptr [rbp - 0x50]
0000000140265fb3  0f1185e8020000         movups xmmword ptr [rbp + 0x2e8], xmm0
0000000140265fba  4c898d00030000         mov qword ptr [rbp + 0x300], r9
0000000140265fc1  4c898508030000         mov qword ptr [rbp + 0x308], r8
0000000140265fc8  4c899510030000         mov qword ptr [rbp + 0x310], r10
0000000140265fcf  488d8dd0030000         lea rcx, [rbp + 0x3d0]
0000000140265fd6  488d95b0010000         lea rdx, [rbp + 0x1b0]
0000000140265fdd  e8deb38d05             call 0x145b413c0
0000000140265fe2  90                     nop
0000000140265fe3  488b95d0030000         mov rdx, qword ptr [rbp + 0x3d0]
0000000140265fea  4885d2                 test rdx, rdx
0000000140265fed  488bb540060000         mov rsi, qword ptr [rbp + 0x640]
0000000140265ff4  7416                   je 0x14026600c
0000000140265ff6  488b8dd8030000         mov rcx, qword ptr [rbp + 0x3d8]
0000000140265ffd  48c1e203               shl rdx, 3
0000000140266001  41b808000000           mov r8d, 8
0000000140266007  e8c4c1d9ff             call 0x1400021d0
000000014026600c  8a5e76                 mov bl, byte ptr [rsi + 0x76]
000000014026600f  889d28060000           mov byte ptr [rbp + 0x628], bl
0000000140266015  4c8db5b0010000         lea r14, [rbp + 0x1b0]
000000014026601c  4c89f1                 mov rcx, r14
000000014026601f  e8dcb18d05             call 0x145b41200
0000000140266024  90                     nop
0000000140266025  89c6                   mov esi, eax
0000000140266027  e8942e8d05             call 0x145b38ec0
000000014026602c  90                     nop
000000014026602d  89b510060000           mov dword ptr [rbp + 0x610], esi
0000000140266033  8985f8050000           mov dword ptr [rbp + 0x5f8], eax
0000000140266039  e8e22f8d05             call 0x145b39020
000000014026603e  90                     nop
000000014026603f  4989d4                 mov r12, rdx
0000000140266042  4885d2                 test rdx, rdx
0000000140266045  7438                   je 0x14026607f
0000000140266047  4989c7                 mov r15, rax
000000014026604a  31f6                   xor esi, esi
000000014026604c  4c8dadb0010000         lea r13, [rbp + 0x1b0]
0000000140266053  31ff                   xor edi, edi
0000000140266055  4869c798000000         imul rax, rdi, 0x98
000000014026605c  498b540708             mov rdx, qword ptr [r15 + rax + 8]
0000000140266061  4d8b440710             mov r8, qword ptr [r15 + rax + 0x10]
0000000140266066  4c89e9                 mov rcx, r13
0000000140266069  e812948605             call 0x145acf480
000000014026606e  90                     nop
000000014026606f  0fb6c0                 movzx eax, al
0000000140266072  4801c6                 add rsi, rax
0000000140266075  48ffc7                 inc rdi
0000000140266078  4c39e7                 cmp rdi, r12
000000014026607b  75d8                   jne 0x140266055
000000014026607d  eb02                   jmp 0x140266081
000000014026607f  31f6                   xor esi, esi
0000000140266081  4889b5e0050000         mov qword ptr [rbp + 0x5e0], rsi
0000000140266088  66c785340500000000     mov word ptr [rbp + 0x534], 0
0000000140266091  c6852405000001         mov byte ptr [rbp + 0x524], 1
0000000140266098  0f57c0                 xorps xmm0, xmm0
000000014026609b  0f118538040000         movups xmmword ptr [rbp + 0x438], xmm0
00000001402660a2  0f118548040000         movups xmmword ptr [rbp + 0x448], xmm0
00000001402660a9  48b80100000000009643   movabs rax, 0x4396000000000001
00000001402660b3  48898558040000         mov qword ptr [rbp + 0x458], rax
00000001402660ba  0f298560040000         movaps xmmword ptr [rbp + 0x460], xmm0
00000001402660c1  c7857004000001000000   mov dword ptr [rbp + 0x470], 1
00000001402660cb  48c7853004000000000000 mov qword ptr [rbp + 0x430], 0
00000001402660d6  0f118574040000         movups xmmword ptr [rbp + 0x474], xmm0
00000001402660dd  c7858404000000000000   mov dword ptr [rbp + 0x484], 0
00000001402660e7  c7854805000000000000   mov dword ptr [rbp + 0x548], 0
00000001402660f1  66c7854c0500000000     mov word ptr [rbp + 0x54c], 0
00000001402660fa  0f10058f74f305         movups xmm0, xmmword ptr [rip + 0x5f3748f]
0000000140266101  0f118588040000         movups xmmword ptr [rbp + 0x488], xmm0
0000000140266108  0f103d9174f305         movups xmm7, xmmword ptr [rip + 0x5f37491]
000000014026610f  0f11bd98040000         movups xmmword ptr [rbp + 0x498], xmm7
0000000140266116  0f2805e3dfef05         movaps xmm0, xmmword ptr [rip + 0x5efdfe3]
000000014026611d  0f1185a8040000         movups xmmword ptr [rbp + 0x4a8], xmm0
0000000140266124  440f280534daef05       movaps xmm8, xmmword ptr [rip + 0x5efda34]
000000014026612c  440f1185b8040000       movups xmmword ptr [rbp + 0x4b8], xmm8
0000000140266134  440f100da474f305       movups xmm9, xmmword ptr [rip + 0x5f374a4]
000000014026613c  440f118dd8040000       movups xmmword ptr [rbp + 0x4d8], xmm9
0000000140266144  440f10158474f305       movups xmm10, xmmword ptr [rip + 0x5f37484]
000000014026614c  440f1195c8040000       movups xmmword ptr [rbp + 0x4c8], xmm10
0000000140266154  440f101d9474f305       movups xmm11, xmmword ptr [rip + 0x5f37494]
000000014026615c  440f119de8040000       movups xmmword ptr [rbp + 0x4e8], xmm11
0000000140266164  440f10359474f305       movups xmm14, xmmword ptr [rip + 0x5f37494]
000000014026616c  440f11b5f8040000       movups xmmword ptr [rbp + 0x4f8], xmm14
0000000140266174  66c785460500000100     mov word ptr [rbp + 0x546], 1
000000014026617d  c7854205000000000000   mov dword ptr [rbp + 0x542], 0
0000000140266187  48c7852805000000000000 mov qword ptr [rbp + 0x528], 0
0000000140266192  c7853005000000000000   mov dword ptr [rbp + 0x530], 0
000000014026619c  0f2805bd44f105         movaps xmm0, xmmword ptr [rip + 0x5f144bd]
00000001402661a3  0f118508050000         movups xmmword ptr [rbp + 0x508], xmm0
00000001402661aa  c7851805000001000000   mov dword ptr [rbp + 0x518], 1
00000001402661b4  48c7851c05000000000000 mov qword ptr [rbp + 0x51c], 0
00000001402661bf  440f10251173f305       movups xmm12, xmmword ptr [rip + 0x5f37311]
00000001402661c7  440f29a5d0030000       movaps xmmword ptr [rbp + 0x3d0], xmm12
00000001402661cf  48c785e003000000000000 mov qword ptr [rbp + 0x3e0], 0
00000001402661da  440f102d0e73f305       movups xmm13, xmmword ptr [rip + 0x5f3730e]
00000001402661e2  440f11ade8030000       movups xmmword ptr [rbp + 0x3e8], xmm13
00000001402661ea  48c785f803000000000000 mov qword ptr [rbp + 0x3f8], 0
00000001402661f5  440f103d0b73f305       movups xmm15, xmmword ptr [rip + 0x5f3730b]
00000001402661fd  440f29bd00040000       movaps xmmword ptr [rbp + 0x400], xmm15
0000000140266205  48c7851004000000000000 mov qword ptr [rbp + 0x410], 0
0000000140266210  0f10350973f305         movups xmm6, xmmword ptr [rip + 0x5f37309]
0000000140266217  0f11b518040000         movups xmmword ptr [rbp + 0x418], xmm6
000000014026621e  48c7852804000000000000 mov qword ptr [rbp + 0x428], 0
0000000140266229  66c7853a0500000000     mov word ptr [rbp + 0x53a], 0
0000000140266232  c7853605000000000100   mov dword ptr [rbp + 0x536], 0x10000
000000014026623c  66c785400500000000     mov word ptr [rbp + 0x540], 0
0000000140266245  c7853c05000000000100   mov dword ptr [rbp + 0x53c], 0x10000
000000014026624f  488d4db0               lea rcx, [rbp - 0x50]
0000000140266253  488d95d0030000         lea rdx, [rbp + 0x3d0]
000000014026625a  e8d10cfdff             call 0x140236f30
000000014026625f  90                     nop
0000000140266260  488b8588060000         mov rax, qword ptr [rbp + 0x688]
0000000140266267  488b30                 mov rsi, qword ptr [rax]
000000014026626a  4c8d7808               lea r15, [rax + 8]
000000014026626e  488d8dd8030000         lea rcx, [rbp + 0x3d8]
0000000140266275  488d55b0               lea rdx, [rbp - 0x50]
0000000140266279  41b800020000           mov r8d, 0x200
000000014026627f  e857dfd205             call 0x145f941db
0000000140266284  4889b5d0030000         mov qword ptr [rbp + 0x3d0], rsi
000000014026628b  4c8d0d7ee4ef05         lea r9, [rip + 0x5efe47e]
0000000140266292  488d8d58060000         lea rcx, [rbp + 0x658]
0000000140266299  4c8d85d0030000         lea r8, [rbp + 0x3d0]
00000001402662a0  4c89fa                 mov rdx, r15
00000001402662a3  e8b84b0500             call 0x1402bae60
00000001402662a8  90                     nop
00000001402662a9  488b85b0060000         mov rax, qword ptr [rbp + 0x6b0]
00000001402662b0  488985d0030000         mov qword ptr [rbp + 0x3d0], rax
00000001402662b7  488b85c0060000         mov rax, qword ptr [rbp + 0x6c0]
00000001402662be  488985d8030000         mov qword ptr [rbp + 0x3d8], rax
00000001402662c5  488d8510060000         lea rax, [rbp + 0x610]
00000001402662cc  488985e0030000         mov qword ptr [rbp + 0x3e0], rax
00000001402662d3  488d85f8050000         lea rax, [rbp + 0x5f8]
00000001402662da  488985e8030000         mov qword ptr [rbp + 0x3e8], rax
00000001402662e1  488d8528060000         lea rax, [rbp + 0x628]
00000001402662e8  488985f0030000         mov qword ptr [rbp + 0x3f0], rax
00000001402662ef  4c89b5f8030000         mov qword ptr [rbp + 0x3f8], r14
00000001402662f6  488d85e0050000         lea rax, [rbp + 0x5e0]
00000001402662fd  48898500040000         mov qword ptr [rbp + 0x400], rax
0000000140266304  488d8d58060000         lea rcx, [rbp + 0x658]
000000014026630b  488d95d0030000         lea rdx, [rbp + 0x3d0]
0000000140266312  e8c95f0700             call 0x1402dc2e0
0000000140266317  90                     nop
0000000140266318  66c785340500000101     mov word ptr [rbp + 0x534], 0x101
0000000140266321  c6852405000001         mov byte ptr [rbp + 0x524], 1
0000000140266328  0f57c0                 xorps xmm0, xmm0
000000014026632b  0f118538040000         movups xmmword ptr [rbp + 0x438], xmm0
0000000140266332  0f118548040000         movups xmmword ptr [rbp + 0x448], xmm0
0000000140266339  0f118558040000         movups xmmword ptr [rbp + 0x458], xmm0
0000000140266340  48c7856804000000000000 mov qword ptr [rbp + 0x468], 0
000000014026634b  c7857004000001000000   mov dword ptr [rbp + 0x470], 1
0000000140266355  48c7853004000000000000 mov qword ptr [rbp + 0x430], 0
0000000140266360  0f118574040000         movups xmmword ptr [rbp + 0x474], xmm0
0000000140266367  c7858404000000000000   mov dword ptr [rbp + 0x484], 0
0000000140266371  c7854805000000000000   mov dword ptr [rbp + 0x548], 0
000000014026637b  66c7854c0500000000     mov word ptr [rbp + 0x54c], 0
0000000140266384  0f10050572f305         movups xmm0, xmmword ptr [rip + 0x5f37205]
000000014026638b  0f118588040000         movups xmmword ptr [rbp + 0x488], xmm0
0000000140266392  0f11bd98040000         movups xmmword ptr [rbp + 0x498], xmm7
0000000140266399  0f28055076f105         movaps xmm0, xmmword ptr [rip + 0x5f17650]
00000001402663a0  0f1185a8040000         movups xmmword ptr [rbp + 0x4a8], xmm0
00000001402663a7  440f1185b8040000       movups xmmword ptr [rbp + 0x4b8], xmm8
00000001402663af  440f118dd8040000       movups xmmword ptr [rbp + 0x4d8], xmm9
00000001402663b7  440f1195c8040000       movups xmmword ptr [rbp + 0x4c8], xmm10
00000001402663bf  440f11b5f8040000       movups xmmword ptr [rbp + 0x4f8], xmm14
00000001402663c7  440f119de8040000       movups xmmword ptr [rbp + 0x4e8], xmm11
00000001402663cf  c6854605000001         mov byte ptr [rbp + 0x546], 1
00000001402663d6  c7854205000000000000   mov dword ptr [rbp + 0x542], 0
00000001402663e0  f20f10054840f105       movsd xmm0, qword ptr [rip + 0x5f14048]
00000001402663e8  f20f118528050000       movsd qword ptr [rbp + 0x528], xmm0
00000001402663f0  c785300500000000803f   mov dword ptr [rbp + 0x530], 0x3f800000
00000001402663fa  0f2805bf78f205         movaps xmm0, xmmword ptr [rip + 0x5f278bf]
0000000140266401  0f118508050000         movups xmmword ptr [rbp + 0x508], xmm0
0000000140266408  c7851805000001000000   mov dword ptr [rbp + 0x518], 1
0000000140266412  48c7851c05000000000000 mov qword ptr [rbp + 0x51c], 0
000000014026641d  c6854705000000         mov byte ptr [rbp + 0x547], 0
0000000140266424  440f29a5d0030000       movaps xmmword ptr [rbp + 0x3d0], xmm12
000000014026642c  48c785e003000000000000 mov qword ptr [rbp + 0x3e0], 0
0000000140266437  440f11ade8030000       movups xmmword ptr [rbp + 0x3e8], xmm13
000000014026643f  48c785f803000000000000 mov qword ptr [rbp + 0x3f8], 0
000000014026644a  440f29bd00040000       movaps xmmword ptr [rbp + 0x400], xmm15
0000000140266452  48c7851004000000000000 mov qword ptr [rbp + 0x410], 0
000000014026645d  0f11b518040000         movups xmmword ptr [rbp + 0x418], xmm6
0000000140266464  48c7852804000000000000 mov qword ptr [rbp + 0x428], 0
000000014026646f  66c7853a0500000000     mov word ptr [rbp + 0x53a], 0
0000000140266478  c7853605000000000100   mov dword ptr [rbp + 0x536], 0x10000
0000000140266482  66c785400500000000     mov word ptr [rbp + 0x540], 0
000000014026648b  c7853c05000000000100   mov dword ptr [rbp + 0x53c], 0x10000
0000000140266495  488d4db0               lea rcx, [rbp - 0x50]
0000000140266499  488d95d0030000         lea rdx, [rbp + 0x3d0]
00000001402664a0  e88b0afdff             call 0x140236f30
00000001402664a5  90                     nop
00000001402664a6  488b8588060000         mov rax, qword ptr [rbp + 0x688]
00000001402664ad  488b30                 mov rsi, qword ptr [rax]
00000001402664b0  488d8dd8030000         lea rcx, [rbp + 0x3d8]
00000001402664b7  488d55b0               lea rdx, [rbp - 0x50]
00000001402664bb  41b800020000           mov r8d, 0x200
00000001402664c1  e815ddd205             call 0x145f941db
00000001402664c6  4889b5d0030000         mov qword ptr [rbp + 0x3d0], rsi
00000001402664cd  4c8d0d3ce2ef05         lea r9, [rip + 0x5efe23c]
00000001402664d4  488d8d58060000         lea rcx, [rbp + 0x658]
00000001402664db  4c8d85d0030000         lea r8, [rbp + 0x3d0]
00000001402664e2  4c89fa                 mov rdx, r15
00000001402664e5  e876490500             call 0x1402bae60
00000001402664ea  90                     nop
00000001402664eb  488b8558060000         mov rax, qword ptr [rbp + 0x658]
00000001402664f2  488b8d80060000         mov rcx, qword ptr [rbp + 0x680]
00000001402664f9  488985d0030000         mov qword ptr [rbp + 0x3d0], rax
0000000140266500  0f108560060000         movups xmm0, xmmword ptr [rbp + 0x660]
0000000140266507  0f1185d8030000         movups xmmword ptr [rbp + 0x3d8], xmm0
000000014026650e  0f108570060000         movups xmm0, xmmword ptr [rbp + 0x670]
0000000140266515  0f1185e8030000         movups xmmword ptr [rbp + 0x3e8], xmm0
000000014026651c  48898df8030000         mov qword ptr [rbp + 0x3f8], rcx
0000000140266523  80fbff                 cmp bl, 0xff
0000000140266526  7428                   je 0x140266550
0000000140266528  885c2420               mov byte ptr [rsp + 0x20], bl
000000014026652c  488d8dd0030000         lea rcx, [rbp + 0x3d0]
0000000140266533  4c8d8db0010000         lea r9, [rbp + 0x1b0]
000000014026653a  488b95b0060000         mov rdx, qword ptr [rbp + 0x6b0]
0000000140266541  4c8b85c0060000         mov r8, qword ptr [rbp + 0x6c0]
0000000140266548  e8f3330000             call 0x140269940
000000014026654d  90                     nop
000000014026654e  eb22                   jmp 0x140266572
0000000140266550  488d8dd0030000         lea rcx, [rbp + 0x3d0]
0000000140266557  4c8d8db0010000         lea r9, [rbp + 0x1b0]
000000014026655e  488b95b0060000         mov rdx, qword ptr [rbp + 0x6b0]
0000000140266565  4c8b85c0060000         mov r8, qword ptr [rbp + 0x6c0]
000000014026656c  e8bf190000             call 0x140267f30
0000000140266571  90                     nop
0000000140266572  488d8db0010000         lea rcx, [rbp + 0x1b0]
0000000140266579  e882daecff             call 0x140134000
000000014026657e  0f28b520070000         movaps xmm6, xmmword ptr [rbp + 0x720]
0000000140266585  0f28bd30070000         movaps xmm7, xmmword ptr [rbp + 0x730]
000000014026658c  440f288540070000       movaps xmm8, xmmword ptr [rbp + 0x740]
0000000140266594  440f288d50070000       movaps xmm9, xmmword ptr [rbp + 0x750]
000000014026659c  440f289560070000       movaps xmm10, xmmword ptr [rbp + 0x760]
00000001402665a4  440f289d70070000       movaps xmm11, xmmword ptr [rbp + 0x770]
00000001402665ac  440f28a580070000       movaps xmm12, xmmword ptr [rbp + 0x780]
00000001402665b4  440f28ad90070000       movaps xmm13, xmmword ptr [rbp + 0x790]
00000001402665bc  440f28b5a0070000       movaps xmm14, xmmword ptr [rbp + 0x7a0]
00000001402665c4  440f28bdb0070000       movaps xmm15, xmmword ptr [rbp + 0x7b0]
00000001402665cc  4881c448080000         add rsp, 0x848
00000001402665d3  5b                     pop rbx
00000001402665d4  5f                     pop rdi
00000001402665d5  5e                     pop rsi
00000001402665d6  415c                   pop r12
00000001402665d8  415d                   pop r13
00000001402665da  415e                   pop r14
00000001402665dc  415f                   pop r15
00000001402665de  5d                     pop rbp
00000001402665df  c3                     ret
