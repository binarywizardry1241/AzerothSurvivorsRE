000000014032a0d0  55                     push rbp
000000014032a0d1  4157                   push r15
000000014032a0d3  4156                   push r14
000000014032a0d5  4155                   push r13
000000014032a0d7  4154                   push r12
000000014032a0d9  56                     push rsi
000000014032a0da  57                     push rdi
000000014032a0db  53                     push rbx
000000014032a0dc  4881ece8070000         sub rsp, 0x7e8
000000014032a0e3  488dac2480000000       lea rbp, [rsp + 0x80]
000000014032a0eb  440f29b550070000       movaps xmmword ptr [rbp + 0x750], xmm14
000000014032a0f3  440f29ad40070000       movaps xmmword ptr [rbp + 0x740], xmm13
000000014032a0fb  440f29a530070000       movaps xmmword ptr [rbp + 0x730], xmm12
000000014032a103  440f299d20070000       movaps xmmword ptr [rbp + 0x720], xmm11
000000014032a10b  440f299510070000       movaps xmmword ptr [rbp + 0x710], xmm10
000000014032a113  440f298d00070000       movaps xmmword ptr [rbp + 0x700], xmm9
000000014032a11b  440f2985f0060000       movaps xmmword ptr [rbp + 0x6f0], xmm8
000000014032a123  0f29bde0060000         movaps xmmword ptr [rbp + 0x6e0], xmm7
000000014032a12a  0f29b5d0060000         movaps xmmword ptr [rbp + 0x6d0], xmm6
000000014032a131  48c785c8060000feffffff mov qword ptr [rbp + 0x6c8], 0xfffffffffffffffe
000000014032a13c  4989ce                 mov r14, rcx
000000014032a13f  4c8b21                 mov r12, qword ptr [rcx]
000000014032a142  488b4128               mov rax, qword ptr [rcx + 0x28]
000000014032a146  4c89a520030000         mov qword ptr [rbp + 0x320], r12
000000014032a14d  0f104108               movups xmm0, xmmword ptr [rcx + 8]
000000014032a151  0f118528030000         movups xmmword ptr [rbp + 0x328], xmm0
000000014032a158  0f104118               movups xmm0, xmmword ptr [rcx + 0x18]
000000014032a15c  0f118538030000         movups xmmword ptr [rbp + 0x338], xmm0
000000014032a163  48898548030000         mov qword ptr [rbp + 0x348], rax
000000014032a16a  66c785040300000000     mov word ptr [rbp + 0x304], 0
000000014032a173  c685f402000001         mov byte ptr [rbp + 0x2f4], 1
000000014032a17a  0f57c0                 xorps xmm0, xmm0
000000014032a17d  0f118508020000         movups xmmword ptr [rbp + 0x208], xmm0
000000014032a184  0f118518020000         movups xmmword ptr [rbp + 0x218], xmm0
000000014032a18b  660f6f0d2db8e805       movdqa xmm1, xmmword ptr [rip + 0x5e8b82d]
000000014032a193  f30f7f8d28020000       movdqu xmmword ptr [rbp + 0x228], xmm1
000000014032a19b  48c7850002000000000000 mov qword ptr [rbp + 0x200], 0
000000014032a1a6  0f118538020000         movups xmmword ptr [rbp + 0x238], xmm0
000000014032a1ad  0f118548020000         movups xmmword ptr [rbp + 0x248], xmm0
000000014032a1b4  c7851803000000000000   mov dword ptr [rbp + 0x318], 0
000000014032a1be  66c7851c0300000000     mov word ptr [rbp + 0x31c], 0
000000014032a1c7  0f10353ac6e805         movups xmm6, xmmword ptr [rip + 0x5e8c63a]
000000014032a1ce  0f11b558020000         movups xmmword ptr [rbp + 0x258], xmm6
000000014032a1d5  0f103d3cc6e805         movups xmm7, xmmword ptr [rip + 0x5e8c63c]
000000014032a1dc  0f11bd68020000         movups xmmword ptr [rbp + 0x268], xmm7
000000014032a1e3  440f10053dc6e805       movups xmm8, xmmword ptr [rip + 0x5e8c63d]
000000014032a1eb  440f118578020000       movups xmmword ptr [rbp + 0x278], xmm8
000000014032a1f3  440f100d3dc6e805       movups xmm9, xmmword ptr [rip + 0x5e8c63d]
000000014032a1fb  440f118d88020000       movups xmmword ptr [rbp + 0x288], xmm9
000000014032a203  0f28054696e405         movaps xmm0, xmmword ptr [rip + 0x5e49646]
000000014032a20a  0f118598020000         movups xmmword ptr [rbp + 0x298], xmm0
000000014032a211  0f1185a8020000         movups xmmword ptr [rbp + 0x2a8], xmm0
000000014032a218  0f280511f3e505         movaps xmm0, xmmword ptr [rip + 0x5e5f311]
000000014032a21f  0f1185b8020000         movups xmmword ptr [rbp + 0x2b8], xmm0
000000014032a226  0f1185c8020000         movups xmmword ptr [rbp + 0x2c8], xmm0
000000014032a22d  c6851603000000         mov byte ptr [rbp + 0x316], 0
000000014032a234  c7851203000000000000   mov dword ptr [rbp + 0x312], 0
000000014032a23e  48c785f802000000000000 mov qword ptr [rbp + 0x2f8], 0
000000014032a249  c7850003000000000000   mov dword ptr [rbp + 0x300], 0
000000014032a253  0f28051696e405         movaps xmm0, xmmword ptr [rip + 0x5e49616]
000000014032a25a  0f1185d8020000         movups xmmword ptr [rbp + 0x2d8], xmm0
000000014032a261  c785e802000001000000   mov dword ptr [rbp + 0x2e8], 1
000000014032a26b  48c785ec02000000000000 mov qword ptr [rbp + 0x2ec], 0
000000014032a276  c6851703000000         mov byte ptr [rbp + 0x317], 0
000000014032a27d  440f1015cbc4e805       movups xmm10, xmmword ptr [rip + 0x5e8c4cb]
000000014032a285  440f2995a0010000       movaps xmmword ptr [rbp + 0x1a0], xmm10
000000014032a28d  48c785b001000000000000 mov qword ptr [rbp + 0x1b0], 0
000000014032a298  440f101dc8c4e805       movups xmm11, xmmword ptr [rip + 0x5e8c4c8]
000000014032a2a0  440f119db8010000       movups xmmword ptr [rbp + 0x1b8], xmm11
000000014032a2a8  48c785c801000000000000 mov qword ptr [rbp + 0x1c8], 0
000000014032a2b3  440f1025c5c4e805       movups xmm12, xmmword ptr [rip + 0x5e8c4c5]
000000014032a2bb  440f29a5d0010000       movaps xmmword ptr [rbp + 0x1d0], xmm12
000000014032a2c3  48c785e001000000000000 mov qword ptr [rbp + 0x1e0], 0
000000014032a2ce  440f102dc2c4e805       movups xmm13, xmmword ptr [rip + 0x5e8c4c2]
000000014032a2d6  440f11ade8010000       movups xmmword ptr [rbp + 0x1e8], xmm13
000000014032a2de  48c785f801000000000000 mov qword ptr [rbp + 0x1f8], 0
000000014032a2e9  66c7850a0300000000     mov word ptr [rbp + 0x30a], 0
000000014032a2f2  c7850603000000000100   mov dword ptr [rbp + 0x306], 0x10000
000000014032a2fc  66c785100300000000     mov word ptr [rbp + 0x310], 0
000000014032a305  c7850c03000000000100   mov dword ptr [rbp + 0x30c], 0x10000
000000014032a30f  488995b8060000         mov qword ptr [rbp + 0x6b8], rdx
000000014032a316  4c8b7a18               mov r15, qword ptr [rdx + 0x18]
000000014032a31a  41803f00               cmp byte ptr [r15], 0
000000014032a31e  7409                   je 0x14032a329
000000014032a320  0f100549c7e805         movups xmm0, xmmword ptr [rip + 0x5e8c749]
000000014032a327  eb07                   jmp 0x14032a330
000000014032a329  0f1005a0c7e805         movups xmm0, xmmword ptr [rip + 0x5e8c7a0]
000000014032a330  0f298580060000         movaps xmmword ptr [rbp + 0x680], xmm0
000000014032a337  c785900600000000803f   mov dword ptr [rbp + 0x690], 0x3f800000
000000014032a341  8b8590060000           mov eax, dword ptr [rbp + 0x690]
000000014032a347  898510060000           mov dword ptr [rbp + 0x610], eax
000000014032a34d  660f6f8580060000       movdqa xmm0, xmmword ptr [rbp + 0x680]
000000014032a355  660f7f8500060000       movdqa xmmword ptr [rbp + 0x600], xmm0
000000014032a35d  f30f7f8514060000       movdqu xmmword ptr [rbp + 0x614], xmm0
000000014032a365  898524060000           mov dword ptr [rbp + 0x624], eax
000000014032a36b  f30f7f8528060000       movdqu xmmword ptr [rbp + 0x628], xmm0
000000014032a373  898538060000           mov dword ptr [rbp + 0x638], eax
000000014032a379  f30f7f853c060000       movdqu xmmword ptr [rbp + 0x63c], xmm0
000000014032a381  89854c060000           mov dword ptr [rbp + 0x64c], eax
000000014032a387  488b85b8060000         mov rax, qword ptr [rbp + 0x6b8]
000000014032a38e  488b7820               mov rdi, qword ptr [rax + 0x20]
000000014032a392  e8697ecdff             call 0x140002200
000000014032a397  b942000000             mov ecx, 0x42
000000014032a39c  ba01000000             mov edx, 1
000000014032a3a1  e81a7ecdff             call 0x1400021c0
000000014032a3a6  4885c0                 test rax, rax
000000014032a3a9  0f843f090000           je 0x14032acee
000000014032a3af  0f10055ec7e805         movups xmm0, xmmword ptr [rip + 0x5e8c75e]
000000014032a3b6  0f114030               movups xmmword ptr [rax + 0x30], xmm0
000000014032a3ba  0f100543c7e805         movups xmm0, xmmword ptr [rip + 0x5e8c743]
000000014032a3c1  0f114020               movups xmmword ptr [rax + 0x20], xmm0
000000014032a3c5  0f100528c7e805         movups xmm0, xmmword ptr [rip + 0x5e8c728]
000000014032a3cc  0f114010               movups xmmword ptr [rax + 0x10], xmm0
000000014032a3d0  f30f6f050cc7e805       movdqu xmm0, xmmword ptr [rip + 0x5e8c70c]
000000014032a3d8  f30f7f00               movdqu xmmword ptr [rax], xmm0
000000014032a3dc  66c740406c70           mov word ptr [rax + 0x40], 0x706c
000000014032a3e2  48c7855003000042000000 mov qword ptr [rbp + 0x350], 0x42
000000014032a3ed  48898558030000         mov qword ptr [rbp + 0x358], rax
000000014032a3f4  48c7856003000042000000 mov qword ptr [rbp + 0x360], 0x42
000000014032a3ff  488d05f245e805         lea rax, [rip + 0x5e845f2]
000000014032a406  4889442420             mov qword ptr [rsp + 0x20], rax
000000014032a40b  488d4db0               lea rcx, [rbp - 0x50]
000000014032a40f  4c8d8550030000         lea r8, [rbp + 0x350]
000000014032a416  41b901000000           mov r9d, 1
000000014032a41c  4889fa                 mov rdx, rdi
000000014032a41f  e85c28f0ff             call 0x14022cc80
000000014032a424  90                     nop
000000014032a425  488dbd28030000         lea rdi, [rbp + 0x328]
000000014032a42c  488b85b8060000         mov rax, qword ptr [rbp + 0x6b8]
000000014032a433  488b5828               mov rbx, qword ptr [rax + 0x28]
000000014032a437  488b4030               mov rax, qword ptr [rax + 0x30]
000000014032a43b  80783a01               cmp byte ptr [rax + 0x3a], 1
000000014032a43f  410f94c0               sete r8b
000000014032a443  488d8db4050000         lea rcx, [rbp + 0x5b4]
000000014032a44a  4889da                 mov rdx, rbx
000000014032a44d  e8ae4fd6ff             call 0x14008f400
000000014032a452  410fb637               movzx esi, byte ptr [r15]
000000014032a456  85f6                   test esi, esi
000000014032a458  4c89b558060000         mov qword ptr [rbp + 0x658], r14
000000014032a45f  750b                   jne 0x14032a46c
000000014032a461  f3440f10356eede505     movss xmm14, dword ptr [rip + 0x5e5ed6e]
000000014032a46a  eb09                   jmp 0x14032a475
000000014032a46c  f3440f10352b94e405     movss xmm14, dword ptr [rip + 0x5e4942b]
000000014032a475  488b45c0               mov rax, qword ptr [rbp - 0x40]
000000014032a479  48898570050000         mov qword ptr [rbp + 0x570], rax
000000014032a480  0f1045b0               movups xmm0, xmmword ptr [rbp - 0x50]
000000014032a484  0f118560050000         movups xmmword ptr [rbp + 0x560], xmm0
000000014032a48b  4c8d75b0               lea r14, [rbp - 0x50]
000000014032a48f  488d95a0010000         lea rdx, [rbp + 0x1a0]
000000014032a496  41b880010000           mov r8d, 0x180
000000014032a49c  4c89f1                 mov rcx, r14
000000014032a49f  e80796c705             call 0x145fa3aab
000000014032a4a4  0f288500060000         movaps xmm0, xmmword ptr [rbp + 0x600]
000000014032a4ab  0f288d10060000         movaps xmm1, xmmword ptr [rbp + 0x610]
000000014032a4b2  0f289520060000         movaps xmm2, xmmword ptr [rbp + 0x620]
000000014032a4b9  0f289d30060000         movaps xmm3, xmmword ptr [rbp + 0x630]
000000014032a4c0  0f118530010000         movups xmmword ptr [rbp + 0x130], xmm0
000000014032a4c7  0f118d40010000         movups xmmword ptr [rbp + 0x140], xmm1
000000014032a4ce  0f119550010000         movups xmmword ptr [rbp + 0x150], xmm2
000000014032a4d5  0f119d60010000         movups xmmword ptr [rbp + 0x160], xmm3
000000014032a4dc  0f288540060000         movaps xmm0, xmmword ptr [rbp + 0x640]
000000014032a4e3  0f118570010000         movups xmmword ptr [rbp + 0x170], xmm0
000000014032a4ea  0f100557c5e805         movups xmm0, xmmword ptr [rip + 0x5e8c557]
000000014032a4f1  0f118580010000         movups xmmword ptr [rbp + 0x180], xmm0
000000014032a4f8  c785900100000000803f   mov dword ptr [rbp + 0x190], 0x3f800000
000000014032a502  488d8d58030000         lea rcx, [rbp + 0x358]
000000014032a509  41b8e8010000           mov r8d, 0x1e8
000000014032a50f  4c89f2                 mov rdx, r14
000000014032a512  e89495c705             call 0x145fa3aab
000000014032a517  c6854005000002         mov byte ptr [rbp + 0x540], 2
000000014032a51e  660f6ec6               movd xmm0, esi
000000014032a522  660f70c000             pshufd xmm0, xmm0, 0
000000014032a527  660f72f01f             pslld xmm0, 0x1f
000000014032a52c  660f72e01f             psrad xmm0, 0x1f
000000014032a531  660f6fc8               movdqa xmm1, xmm0
000000014032a535  660fdf0d23c0e805       pandn xmm1, xmmword ptr [rip + 0x5e8c023]
000000014032a53d  89b578050000           mov dword ptr [rbp + 0x578], esi
000000014032a543  660fdb058599e405       pand xmm0, xmmword ptr [rip + 0x5e49985]
000000014032a54b  660febc1               por xmm0, xmm1
000000014032a54f  660fd6857c050000       movq qword ptr [rbp + 0x57c], xmm0
000000014032a557  f3440f11b584050000     movss dword ptr [rbp + 0x584], xmm14
000000014032a560  48b80000803f02000000   movabs rax, 0x23f800000
000000014032a56a  48898588050000         mov qword ptr [rbp + 0x588], rax
000000014032a571  c785b005000001000000   mov dword ptr [rbp + 0x5b0], 1
000000014032a57b  66c785c40500000000     mov word ptr [rbp + 0x5c4], 0
000000014032a584  4c89a598060000         mov qword ptr [rbp + 0x698], r12
000000014032a58b  4c89a550030000         mov qword ptr [rbp + 0x350], r12
000000014032a592  c685c706000001         mov byte ptr [rbp + 0x6c7], 1
000000014032a599  488d8da0010000         lea rcx, [rbp + 0x1a0]
000000014032a5a0  4c8d8550030000         lea r8, [rbp + 0x350]
000000014032a5a7  4889fa                 mov rdx, rdi
000000014032a5aa  e8e19ff6ff             call 0x140294590
000000014032a5af  90                     nop
000000014032a5b0  660fefc0               pxor xmm0, xmm0
000000014032a5b4  660f7f4550             movdqa xmmword ptr [rbp + 0x50], xmm0
000000014032a5b9  660f7f4540             movdqa xmmword ptr [rbp + 0x40], xmm0
000000014032a5be  660f7f4530             movdqa xmmword ptr [rbp + 0x30], xmm0
000000014032a5c3  660f7f4520             movdqa xmmword ptr [rbp + 0x20], xmm0
000000014032a5c8  660f7f4510             movdqa xmmword ptr [rbp + 0x10], xmm0
000000014032a5cd  48c7456000000000       mov qword ptr [rbp + 0x60], 0
000000014032a5d5  66c785d40400000000     mov word ptr [rbp + 0x4d4], 0
000000014032a5de  c785d004000000000000   mov dword ptr [rbp + 0x4d0], 0
000000014032a5e8  0f117568               movups xmmword ptr [rbp + 0x68], xmm6
000000014032a5ec  0f117d78               movups xmmword ptr [rbp + 0x78], xmm7
000000014032a5f0  440f118588000000       movups xmmword ptr [rbp + 0x88], xmm8
000000014032a5f8  440f118d98000000       movups xmmword ptr [rbp + 0x98], xmm9
000000014032a600  0f100551c2e805         movups xmm0, xmmword ptr [rip + 0x5e8c251]
000000014032a607  0f1185b8000000         movups xmmword ptr [rbp + 0xb8], xmm0
000000014032a60e  0f100533c2e805         movups xmm0, xmmword ptr [rip + 0x5e8c233]
000000014032a615  0f1185a8000000         movups xmmword ptr [rbp + 0xa8], xmm0
000000014032a61c  0f100555c2e805         movups xmm0, xmmword ptr [rip + 0x5e8c255]
000000014032a623  0f1185d8000000         movups xmmword ptr [rbp + 0xd8], xmm0
000000014032a62a  0f100537c2e805         movups xmm0, xmmword ptr [rip + 0x5e8c237]
000000014032a631  0f1185c8000000         movups xmmword ptr [rbp + 0xc8], xmm0
000000014032a638  440f2955b0             movaps xmmword ptr [rbp - 0x50], xmm10
000000014032a63d  48c745c000000000       mov qword ptr [rbp - 0x40], 0
000000014032a645  440f115dc8             movups xmmword ptr [rbp - 0x38], xmm11
000000014032a64a  48c745d800000000       mov qword ptr [rbp - 0x28], 0
000000014032a652  440f2965e0             movaps xmmword ptr [rbp - 0x20], xmm12
000000014032a657  48c745f000000000       mov qword ptr [rbp - 0x10], 0
000000014032a65f  440f116df8             movups xmmword ptr [rbp - 8], xmm13
000000014032a664  48c7450800000000       mov qword ptr [rbp + 8], 0
000000014032a66c  488d8d58030000         lea rcx, [rbp + 0x358]
000000014032a673  488d55b0               lea rdx, [rbp - 0x50]
000000014032a677  41b838010000           mov r8d, 0x138
000000014032a67d  e82994c705             call 0x145fa3aab
000000014032a682  0f280517ede505         movaps xmm0, xmmword ptr [rip + 0x5e5ed17]
000000014032a689  0f118590040000         movups xmmword ptr [rbp + 0x490], xmm0
000000014032a690  c785a004000001000000   mov dword ptr [rbp + 0x4a0], 1
000000014032a69a  48c785a404000000000000 mov qword ptr [rbp + 0x4a4], 0
000000014032a6a5  c685ac04000001         mov byte ptr [rbp + 0x4ac], 1
000000014032a6ac  f30f7e058c93e405       movq xmm0, qword ptr [rip + 0x5e4938c]
000000014032a6b4  660fd685b0040000       movq qword ptr [rbp + 0x4b0], xmm0
000000014032a6bc  c785b80400000000803f   mov dword ptr [rbp + 0x4b8], 0x3f800000
000000014032a6c6  66c785bc0400000000     mov word ptr [rbp + 0x4bc], 0
000000014032a6cf  c785be04000000000100   mov dword ptr [rbp + 0x4be], 0x10000
000000014032a6d9  66c785c20400000000     mov word ptr [rbp + 0x4c2], 0
000000014032a6e2  c785c404000000000100   mov dword ptr [rbp + 0x4c4], 0x10000
000000014032a6ec  66c785c80400000000     mov word ptr [rbp + 0x4c8], 0
000000014032a6f5  c785ca04000000000000   mov dword ptr [rbp + 0x4ca], 0
000000014032a6ff  66c785ce0400000100     mov word ptr [rbp + 0x4ce], 1
000000014032a708  488b8598060000         mov rax, qword ptr [rbp + 0x698]
000000014032a70f  48898550030000         mov qword ptr [rbp + 0x350], rax
000000014032a716  c685c706000001         mov byte ptr [rbp + 0x6c7], 1
000000014032a71d  488d8d00060000         lea rcx, [rbp + 0x600]
000000014032a724  4c8d8550030000         lea r8, [rbp + 0x350]
000000014032a72b  488d9528030000         lea rdx, [rbp + 0x328]
000000014032a732  e8898bf6ff             call 0x1402932c0
000000014032a737  90                     nop
000000014032a738  488b85b8060000         mov rax, qword ptr [rbp + 0x6b8]
000000014032a73f  488b7838               mov rdi, qword ptr [rax + 0x38]
000000014032a743  488b7040               mov rsi, qword ptr [rax + 0x40]
000000014032a747  4c8bad00060000         mov r13, qword ptr [rbp + 0x600]
000000014032a74e  488b8528060000         mov rax, qword ptr [rbp + 0x628]
000000014032a755  4c89ada0010000         mov qword ptr [rbp + 0x1a0], r13
000000014032a75c  0f108508060000         movups xmm0, xmmword ptr [rbp + 0x608]
000000014032a763  0f1185a8010000         movups xmmword ptr [rbp + 0x1a8], xmm0
000000014032a76a  0f108518060000         movups xmm0, xmmword ptr [rbp + 0x618]
000000014032a771  0f1185b8010000         movups xmmword ptr [rbp + 0x1b8], xmm0
000000014032a778  488985c8010000         mov qword ptr [rbp + 0x1c8], rax
000000014032a77f  41803f00               cmp byte ptr [r15], 0
000000014032a783  740a                   je 0x14032a78f
000000014032a785  f30f6f0597c1e805       movdqu xmm0, xmmword ptr [rip + 0x5e8c197]
000000014032a78d  eb08                   jmp 0x14032a797
000000014032a78f  f30f6f0575bfe805       movdqu xmm0, xmmword ptr [rip + 0x5e8bf75]
000000014032a797  660f7f8550030000       movdqa xmmword ptr [rbp + 0x350], xmm0
000000014032a79f  c785600300000000803f   mov dword ptr [rbp + 0x360], 0x3f800000
000000014032a7a9  c685c706000001         mov byte ptr [rbp + 0x6c7], 1
000000014032a7b0  4889d9                 mov rcx, rbx
000000014032a7b3  e868437505             call 0x145a7eb20
000000014032a7b8  90                     nop
000000014032a7b9  4989d6                 mov r14, rdx
000000014032a7bc  4885d2                 test rdx, rdx
000000014032a7bf  791b                   jns 0x14032a7dc
000000014032a7c1  4531e4                 xor r12d, r12d
000000014032a7c4  c685c706000001         mov byte ptr [rbp + 0x6c7], 1
000000014032a7cb  4c89e1                 mov rcx, r12
000000014032a7ce  4c89f2                 mov rdx, r14
000000014032a7d1  e89505e205             call 0x14614ad6b
000000014032a7d6  90                     nop
000000014032a7d7  e922050000             jmp 0x14032acfe
000000014032a7dc  4d85f6                 test r14, r14
000000014032a7df  7455                   je 0x14032a836
000000014032a7e1  4889c3                 mov rbx, rax
000000014032a7e4  e8177acdff             call 0x140002200
000000014032a7e9  41bc01000000           mov r12d, 1
000000014032a7ef  ba01000000             mov edx, 1
000000014032a7f4  4c89f1                 mov rcx, r14
000000014032a7f7  e8c479cdff             call 0x1400021c0
000000014032a7fc  4885c0                 test rax, rax
000000014032a7ff  74c3                   je 0x14032a7c4
000000014032a801  4989c7                 mov r15, rax
000000014032a804  4889c1                 mov rcx, rax
000000014032a807  4889da                 mov rdx, rbx
000000014032a80a  4d89f0                 mov r8, r14
000000014032a80d  e89992c705             call 0x145fa3aab
000000014032a812  803f01                 cmp byte ptr [rdi], 1
000000014032a815  752a                   jne 0x14032a841
000000014032a817  8b4701                 mov eax, dword ptr [rdi + 1]
000000014032a81a  8b4f04                 mov ecx, dword ptr [rdi + 4]
000000014032a81d  898db3060000           mov dword ptr [rbp + 0x6b3], ecx
000000014032a823  8985b0060000           mov dword ptr [rbp + 0x6b0], eax
000000014032a829  488b4708               mov rax, qword ptr [rdi + 8]
000000014032a82d  0fb64f10               movzx ecx, byte ptr [rdi + 0x10]
000000014032a831  41b101                 mov r9b, 1
000000014032a834  eb1c                   jmp 0x14032a852
000000014032a836  41bf01000000           mov r15d, 1
000000014032a83c  803f01                 cmp byte ptr [rdi], 1
000000014032a83f  74d6                   je 0x14032a817
000000014032a841  488b4708               mov rax, qword ptr [rdi + 8]
000000014032a845  f048ff00               lock inc qword ptr [rax]
000000014032a849  0f8eaf040000           jle 0x14032acfe
000000014032a84f  4531c9                 xor r9d, r9d
000000014032a852  488d95a8010000         lea rdx, [rbp + 0x1a8]
000000014032a859  448b8560030000         mov r8d, dword ptr [rbp + 0x360]
000000014032a860  44898571060000         mov dword ptr [rbp + 0x671], r8d
000000014032a867  0f288550030000         movaps xmm0, xmmword ptr [rbp + 0x350]
000000014032a86e  0f118561060000         movups xmmword ptr [rbp + 0x661], xmm0
000000014032a875  4c89b558030000         mov qword ptr [rbp + 0x358], r14
000000014032a87c  4c89bd60030000         mov qword ptr [rbp + 0x360], r15
000000014032a883  4c89b568030000         mov qword ptr [rbp + 0x368], r14
000000014032a88a  48c7857003000000000000 mov qword ptr [rbp + 0x370], 0
000000014032a895  48c7857803000004000000 mov qword ptr [rbp + 0x378], 4
000000014032a8a0  48c7858003000000000000 mov qword ptr [rbp + 0x380], 0
000000014032a8ab  44888d88030000         mov byte ptr [rbp + 0x388], r9b
000000014032a8b2  448b8db0060000         mov r9d, dword ptr [rbp + 0x6b0]
000000014032a8b9  448b85b3060000         mov r8d, dword ptr [rbp + 0x6b3]
000000014032a8c0  44898d89030000         mov dword ptr [rbp + 0x389], r9d
000000014032a8c7  4489858c030000         mov dword ptr [rbp + 0x38c], r8d
000000014032a8ce  48898590030000         mov qword ptr [rbp + 0x390], rax
000000014032a8d5  48898d98030000         mov qword ptr [rbp + 0x398], rcx
000000014032a8dc  c785a003000000007041   mov dword ptr [rbp + 0x3a0], 0x41700000
000000014032a8e6  66c785a40300009001     mov word ptr [rbp + 0x3a4], 0x190
000000014032a8ef  c685a603000001         mov byte ptr [rbp + 0x3a6], 1
000000014032a8f6  f30f6f8560060000       movdqu xmm0, xmmword ptr [rbp + 0x660]
000000014032a8fe  f30f7f85a7030000       movdqu xmmword ptr [rbp + 0x3a7], xmm0
000000014032a906  488b856d060000         mov rax, qword ptr [rbp + 0x66d]
000000014032a90d  488985b4030000         mov qword ptr [rbp + 0x3b4], rax
000000014032a914  8b1da645e805           mov ebx, dword ptr [rip + 0x5e845a6]
000000014032a91a  899dcc030000           mov dword ptr [rbp + 0x3cc], ebx
000000014032a920  0f10358945e805         movups xmm6, xmmword ptr [rip + 0x5e84589]
000000014032a927  0f11b5bc030000         movups xmmword ptr [rbp + 0x3bc], xmm6
000000014032a92e  f20f103d8a91e405       movsd xmm7, qword ptr [rip + 0x5e4918a]
000000014032a936  f20f11bdd0030000       movsd qword ptr [rbp + 0x3d0], xmm7
000000014032a93e  4c89ad50030000         mov qword ptr [rbp + 0x350], r13
000000014032a945  c685c706000001         mov byte ptr [rbp + 0x6c7], 1
000000014032a94c  488d4db0               lea rcx, [rbp - 0x50]
000000014032a950  4c8d8550030000         lea r8, [rbp + 0x350]
000000014032a957  e874edf7ff             call 0x1402a96d0
000000014032a95c  90                     nop
000000014032a95d  c685c706000001         mov byte ptr [rbp + 0x6c7], 1
000000014032a964  488d0d68f5e805         lea rcx, [rip + 0x5e8f568]
000000014032a96b  ba16000000             mov edx, 0x16
000000014032a970  e86ba78205             call 0x145b550e0
000000014032a975  90                     nop
000000014032a976  4989c6                 mov r14, rax
000000014032a979  4989d7                 mov r15, rdx
000000014032a97c  488b5608               mov rdx, qword ptr [rsi + 8]
000000014032a980  4c8b4610               mov r8, qword ptr [rsi + 0x10]
000000014032a984  c685c706000001         mov byte ptr [rbp + 0x6c7], 1
000000014032a98b  48c744242002000000     mov qword ptr [rsp + 0x20], 2
000000014032a994  4c8d0d4ef5e805         lea r9, [rip + 0x5e8f54e]
000000014032a99b  4c8da5e8050000         lea r12, [rbp + 0x5e8]
000000014032a9a2  4c89e1                 mov rcx, r12
000000014032a9a5  e8366bd5ff             call 0x1400814e0
000000014032a9aa  90                     nop
000000014032a9ab  488d0539f5e805         lea rax, [rip + 0x5e8f539]
000000014032a9b2  48898560060000         mov qword ptr [rbp + 0x660], rax
000000014032a9b9  48c7856806000007000000 mov qword ptr [rbp + 0x668], 7
000000014032a9c4  4c89a570060000         mov qword ptr [rbp + 0x670], r12
000000014032a9cb  488d0566c2e805         lea rax, [rip + 0x5e8c266]
000000014032a9d2  48898578060000         mov qword ptr [rbp + 0x678], rax
000000014032a9d9  48c744242001000000     mov qword ptr [rsp + 0x20], 1
000000014032a9e2  488d4db0               lea rcx, [rbp - 0x50]
000000014032a9e6  4c8d8d60060000         lea r9, [rbp + 0x660]
000000014032a9ed  4c89f2                 mov rdx, r14
000000014032a9f0  4d89f8                 mov r8, r15
000000014032a9f3  e878ab8205             call 0x145b55570
000000014032a9f8  90                     nop
000000014032a9f9  803f01                 cmp byte ptr [rdi], 1
000000014032a9fc  751e                   jne 0x14032aa1c
000000014032a9fe  8b4701                 mov eax, dword ptr [rdi + 1]
000000014032aa01  8b4f04                 mov ecx, dword ptr [rdi + 4]
000000014032aa04  898dab060000           mov dword ptr [rbp + 0x6ab], ecx
000000014032aa0a  8985a8060000           mov dword ptr [rbp + 0x6a8], eax
000000014032aa10  488b4708               mov rax, qword ptr [rdi + 8]
000000014032aa14  0fb64f10               movzx ecx, byte ptr [rdi + 0x10]
000000014032aa18  b201                   mov dl, 1
000000014032aa1a  eb10                   jmp 0x14032aa2c
000000014032aa1c  488b4708               mov rax, qword ptr [rdi + 8]
000000014032aa20  f048ff00               lock inc qword ptr [rax]
000000014032aa24  0f8ed4020000           jle 0x14032acfe
000000014032aa2a  31d2                   xor edx, edx
000000014032aa2c  4c8b45c0               mov r8, qword ptr [rbp - 0x40]
000000014032aa30  4c898568030000         mov qword ptr [rbp + 0x368], r8
000000014032aa37  0f1045b0               movups xmm0, xmmword ptr [rbp - 0x50]
000000014032aa3b  0f118558030000         movups xmmword ptr [rbp + 0x358], xmm0
000000014032aa42  0f1005c3bce805         movups xmm0, xmmword ptr [rip + 0x5e8bcc3]
000000014032aa49  0f1185d4050000         movups xmmword ptr [rbp + 0x5d4], xmm0
000000014032aa50  c785e40500000000803f   mov dword ptr [rbp + 0x5e4], 0x3f800000
000000014032aa5a  48c7857003000000000000 mov qword ptr [rbp + 0x370], 0
000000014032aa65  48c7857803000004000000 mov qword ptr [rbp + 0x378], 4
000000014032aa70  48c7858003000000000000 mov qword ptr [rbp + 0x380], 0
000000014032aa7b  889588030000           mov byte ptr [rbp + 0x388], dl
000000014032aa81  8b95a8060000           mov edx, dword ptr [rbp + 0x6a8]
000000014032aa87  448b85ab060000         mov r8d, dword ptr [rbp + 0x6ab]
000000014032aa8e  899589030000           mov dword ptr [rbp + 0x389], edx
000000014032aa94  4489858c030000         mov dword ptr [rbp + 0x38c], r8d
000000014032aa9b  48898590030000         mov qword ptr [rbp + 0x390], rax
000000014032aaa2  48898d98030000         mov qword ptr [rbp + 0x398], rcx
000000014032aaa9  c785a003000000003041   mov dword ptr [rbp + 0x3a0], 0x41300000
000000014032aab3  66c785a40300009001     mov word ptr [rbp + 0x3a4], 0x190
000000014032aabc  c685a603000001         mov byte ptr [rbp + 0x3a6], 1
000000014032aac3  488b85e0050000         mov rax, qword ptr [rbp + 0x5e0]
000000014032aaca  488985b4030000         mov qword ptr [rbp + 0x3b4], rax
000000014032aad1  f30f6f85d3050000       movdqu xmm0, xmmword ptr [rbp + 0x5d3]
000000014032aad9  f30f7f85a7030000       movdqu xmmword ptr [rbp + 0x3a7], xmm0
000000014032aae1  899dcc030000           mov dword ptr [rbp + 0x3cc], ebx
000000014032aae7  0f11b5bc030000         movups xmmword ptr [rbp + 0x3bc], xmm6
000000014032aaee  f20f11bdd0030000       movsd qword ptr [rbp + 0x3d0], xmm7
000000014032aaf6  4c89ad50030000         mov qword ptr [rbp + 0x350], r13
000000014032aafd  488d4db0               lea rcx, [rbp - 0x50]
000000014032ab01  4c8d8550030000         lea r8, [rbp + 0x350]
000000014032ab08  488d95a8010000         lea rdx, [rbp + 0x1a8]
000000014032ab0f  e8bcebf7ff             call 0x1402a96d0
000000014032ab14  90                     nop
000000014032ab15  488b95e8050000         mov rdx, qword ptr [rbp + 0x5e8]
000000014032ab1c  4885d2                 test rdx, rdx
000000014032ab1f  7412                   je 0x14032ab33
000000014032ab21  488b8df0050000         mov rcx, qword ptr [rbp + 0x5f0]
000000014032ab28  41b801000000           mov r8d, 1
000000014032ab2e  e89d76cdff             call 0x1400021d0
000000014032ab33  488b85b8060000         mov rax, qword ptr [rbp + 0x6b8]
000000014032ab3a  488b4048               mov rax, qword ptr [rax + 0x48]
000000014032ab3e  8b4810                 mov ecx, dword ptr [rax + 0x10]
000000014032ab41  898d60030000           mov dword ptr [rbp + 0x360], ecx
000000014032ab47  f30f6f00               movdqu xmm0, xmmword ptr [rax]
000000014032ab4b  660f7f8550030000       movdqa xmmword ptr [rbp + 0x350], xmm0
000000014032ab53  803f01                 cmp byte ptr [rdi], 1
000000014032ab56  4c8b9598060000         mov r10, qword ptr [rbp + 0x698]
000000014032ab5d  751f                   jne 0x14032ab7e
000000014032ab5f  8b4701                 mov eax, dword ptr [rdi + 1]
000000014032ab62  8b4f04                 mov ecx, dword ptr [rdi + 4]
000000014032ab65  898da3060000           mov dword ptr [rbp + 0x6a3], ecx
000000014032ab6b  8985a0060000           mov dword ptr [rbp + 0x6a0], eax
000000014032ab71  488b4708               mov rax, qword ptr [rdi + 8]
000000014032ab75  0fb64f10               movzx ecx, byte ptr [rdi + 0x10]
000000014032ab79  41b301                 mov r11b, 1
000000014032ab7c  eb11                   jmp 0x14032ab8f
000000014032ab7e  488b4708               mov rax, qword ptr [rdi + 8]
000000014032ab82  f048ff00               lock inc qword ptr [rax]
000000014032ab86  0f8e72010000           jle 0x14032acfe
000000014032ab8c  4531db                 xor r11d, r11d
000000014032ab8f  488d9528030000         lea rdx, [rbp + 0x328]
000000014032ab96  448b8560030000         mov r8d, dword ptr [rbp + 0x360]
000000014032ab9d  448985b1010000         mov dword ptr [rbp + 0x1b1], r8d
000000014032aba4  0f288550030000         movaps xmm0, xmmword ptr [rbp + 0x350]
000000014032abab  0f1185a1010000         movups xmmword ptr [rbp + 0x1a1], xmm0
000000014032abb2  4c8b8db8060000         mov r9, qword ptr [rbp + 0x6b8]
000000014032abb9  4d8b4110               mov r8, qword ptr [r9 + 0x10]
000000014032abbd  4c898568030000         mov qword ptr [rbp + 0x368], r8
000000014032abc4  410f1001               movups xmm0, xmmword ptr [r9]
000000014032abc8  0f118558030000         movups xmmword ptr [rbp + 0x358], xmm0
000000014032abcf  48c7857003000000000000 mov qword ptr [rbp + 0x370], 0
000000014032abda  48c7857803000004000000 mov qword ptr [rbp + 0x378], 4
000000014032abe5  48c7858003000000000000 mov qword ptr [rbp + 0x380], 0
000000014032abf0  44889d88030000         mov byte ptr [rbp + 0x388], r11b
000000014032abf7  448b8da0060000         mov r9d, dword ptr [rbp + 0x6a0]
000000014032abfe  448b85a3060000         mov r8d, dword ptr [rbp + 0x6a3]
000000014032ac05  44898d89030000         mov dword ptr [rbp + 0x389], r9d
000000014032ac0c  4489858c030000         mov dword ptr [rbp + 0x38c], r8d
000000014032ac13  48898590030000         mov qword ptr [rbp + 0x390], rax
000000014032ac1a  48898d98030000         mov qword ptr [rbp + 0x398], rcx
000000014032ac21  c785a003000000005041   mov dword ptr [rbp + 0x3a0], 0x41500000
000000014032ac2b  66c785a40300009001     mov word ptr [rbp + 0x3a4], 0x190
000000014032ac34  c685a603000001         mov byte ptr [rbp + 0x3a6], 1
000000014032ac3b  f30f6f85a0010000       movdqu xmm0, xmmword ptr [rbp + 0x1a0]
000000014032ac43  f30f7f85a7030000       movdqu xmmword ptr [rbp + 0x3a7], xmm0
000000014032ac4b  488b85ad010000         mov rax, qword ptr [rbp + 0x1ad]
000000014032ac52  488985b4030000         mov qword ptr [rbp + 0x3b4], rax
000000014032ac59  899dcc030000           mov dword ptr [rbp + 0x3cc], ebx
000000014032ac5f  0f11b5bc030000         movups xmmword ptr [rbp + 0x3bc], xmm6
000000014032ac66  f20f11bdd0030000       movsd qword ptr [rbp + 0x3d0], xmm7
000000014032ac6e  4c899550030000         mov qword ptr [rbp + 0x350], r10
000000014032ac75  c685c706000000         mov byte ptr [rbp + 0x6c7], 0
000000014032ac7c  488d4db0               lea rcx, [rbp - 0x50]
000000014032ac80  4c8d8550030000         lea r8, [rbp + 0x350]
000000014032ac87  e844eaf7ff             call 0x1402a96d0
000000014032ac8c  90                     nop
000000014032ac8d  488b8558060000         mov rax, qword ptr [rbp + 0x658]
000000014032ac94  0f28b5d0060000         movaps xmm6, xmmword ptr [rbp + 0x6d0]
000000014032ac9b  0f28bde0060000         movaps xmm7, xmmword ptr [rbp + 0x6e0]
000000014032aca2  440f2885f0060000       movaps xmm8, xmmword ptr [rbp + 0x6f0]
000000014032acaa  440f288d00070000       movaps xmm9, xmmword ptr [rbp + 0x700]
000000014032acb2  440f289510070000       movaps xmm10, xmmword ptr [rbp + 0x710]
000000014032acba  440f289d20070000       movaps xmm11, xmmword ptr [rbp + 0x720]
000000014032acc2  440f28a530070000       movaps xmm12, xmmword ptr [rbp + 0x730]
000000014032acca  440f28ad40070000       movaps xmm13, xmmword ptr [rbp + 0x740]
000000014032acd2  440f28b550070000       movaps xmm14, xmmword ptr [rbp + 0x750]
000000014032acda  4881c4e8070000         add rsp, 0x7e8
000000014032ace1  5b                     pop rbx
000000014032ace2  5f                     pop rdi
000000014032ace3  5e                     pop rsi
000000014032ace4  415c                   pop r12
000000014032ace6  415d                   pop r13
000000014032ace8  415e                   pop r14
000000014032acea  415f                   pop r15
000000014032acec  5d                     pop rbp
000000014032aced  c3                     ret
000000014032acee  b901000000             mov ecx, 1
000000014032acf3  ba42000000             mov edx, 0x42
000000014032acf8  e86e00e205             call 0x14614ad6b
000000014032acfd  90                     nop
000000014032acfe  0f0b                   ud2
