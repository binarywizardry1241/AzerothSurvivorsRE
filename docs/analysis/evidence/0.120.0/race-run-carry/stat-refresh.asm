0000000145b7de20  55                     push rbp
0000000145b7de21  4157                   push r15
0000000145b7de23  4156                   push r14
0000000145b7de25  4155                   push r13
0000000145b7de27  4154                   push r12
0000000145b7de29  56                     push rsi
0000000145b7de2a  57                     push rdi
0000000145b7de2b  53                     push rbx
0000000145b7de2c  4881ece8010000         sub rsp, 0x1e8
0000000145b7de33  488dac2480000000       lea rbp, [rsp + 0x80]
0000000145b7de3b  440f29bd50010000       movaps xmmword ptr [rbp + 0x150], xmm15
0000000145b7de43  440f29b540010000       movaps xmmword ptr [rbp + 0x140], xmm14
0000000145b7de4b  440f29ad30010000       movaps xmmword ptr [rbp + 0x130], xmm13
0000000145b7de53  440f29a520010000       movaps xmmword ptr [rbp + 0x120], xmm12
0000000145b7de5b  440f299d10010000       movaps xmmword ptr [rbp + 0x110], xmm11
0000000145b7de63  440f299500010000       movaps xmmword ptr [rbp + 0x100], xmm10
0000000145b7de6b  440f298df0000000       movaps xmmword ptr [rbp + 0xf0], xmm9
0000000145b7de73  440f2985e0000000       movaps xmmword ptr [rbp + 0xe0], xmm8
0000000145b7de7b  0f29bdd0000000         movaps xmmword ptr [rbp + 0xd0], xmm7
0000000145b7de82  0f29b5c0000000         movaps xmmword ptr [rbp + 0xc0], xmm6
0000000145b7de89  48c785b8000000feffffff mov qword ptr [rbp + 0xb8], 0xfffffffffffffffe
0000000145b7de94  4889ce                 mov rsi, rcx
0000000145b7de97  0fb6813c030000         movzx eax, byte ptr [rcx + 0x33c]
0000000145b7de9e  04fe                   add al, 0xfe
0000000145b7dea0  3c09                   cmp al, 9
0000000145b7dea2  7724                   ja 0x145b7dec8
0000000145b7dea4  0fb6c0                 movzx eax, al
0000000145b7dea7  488d0d8a9ca701         lea rcx, [rip + 0x1a79c8a]
0000000145b7deae  488b14c1               mov rdx, qword ptr [rcx + rax*8]
0000000145b7deb2  0fb6863d030000         movzx eax, byte ptr [rsi + 0x33d]
0000000145b7deb9  04fe                   add al, 0xfe
0000000145b7debb  3c06                   cmp al, 6
0000000145b7debd  761d                   jbe 0x145b7dedc
0000000145b7debf  4c8d05a2c03f01         lea r8, [rip + 0x13fc0a2]
0000000145b7dec6  eb22                   jmp 0x145b7deea
0000000145b7dec8  488d1529d23f01         lea rdx, [rip + 0x13fd229]
0000000145b7decf  0fb6863d030000         movzx eax, byte ptr [rsi + 0x33d]
0000000145b7ded6  04fe                   add al, 0xfe
0000000145b7ded8  3c06                   cmp al, 6
0000000145b7deda  77e3                   ja 0x145b7debf
0000000145b7dedc  0fb6c0                 movzx eax, al
0000000145b7dedf  488d0dda9ba701         lea rcx, [rip + 0x1a79bda]
0000000145b7dee6  4c8b04c1               mov r8, qword ptr [rcx + rax*8]
0000000145b7deea  4c8bae20080000         mov r13, qword ptr [rsi + 0x820]
0000000145b7def1  4a8d1ced00000000       lea rbx, [r13*8]
0000000145b7def9  4c89e8                 mov rax, r13
0000000145b7defc  48c1e83d               shr rax, 0x3d
0000000145b7df00  0f95c0                 setne al
0000000145b7df03  48b9fcffffffffffff7f   movabs rcx, 0x7ffffffffffffffc
0000000145b7df0d  4839cb                 cmp rbx, rcx
0000000145b7df10  0f97c1                 seta cl
0000000145b7df13  08c1                   or cl, al
0000000145b7df15  7410                   je 0x145b7df27
0000000145b7df17  4531ff                 xor r15d, r15d
0000000145b7df1a  4c89f9                 mov rcx, r15
0000000145b7df1d  4889da                 mov rdx, rbx
0000000145b7df20  e846ce5c00             call 0x14614ad6b
0000000145b7df25  0f0b                   ud2
0000000145b7df27  4c8985a0000000         mov qword ptr [rbp + 0xa0], r8
0000000145b7df2e  48895500               mov qword ptr [rbp], rdx
0000000145b7df32  4c8bb618080000         mov r14, qword ptr [rsi + 0x818]
0000000145b7df39  4885db                 test rbx, rbx
0000000145b7df3c  7425                   je 0x145b7df63
0000000145b7df3e  e8bd4248fa             call 0x140002200
0000000145b7df43  41bf04000000           mov r15d, 4
0000000145b7df49  ba04000000             mov edx, 4
0000000145b7df4e  4889d9                 mov rcx, rbx
0000000145b7df51  e86a4248fa             call 0x1400021c0
0000000145b7df56  4885c0                 test rax, rax
0000000145b7df59  74bf                   je 0x145b7df1a
0000000145b7df5b  4889c7                 mov rdi, rax
0000000145b7df5e  4d89ef                 mov r15, r13
0000000145b7df61  eb08                   jmp 0x145b7df6b
0000000145b7df63  bf04000000             mov edi, 4
0000000145b7df68  4531ff                 xor r15d, r15d
0000000145b7df6b  4c897d30               mov qword ptr [rbp + 0x30], r15
0000000145b7df6f  48897d38               mov qword ptr [rbp + 0x38], rdi
0000000145b7df73  48c7454000000000       mov qword ptr [rbp + 0x40], 0
0000000145b7df7b  4d85ed                 test r13, r13
0000000145b7df7e  7412                   je 0x145b7df92
0000000145b7df80  4889f9                 mov rcx, rdi
0000000145b7df83  4c89f2                 mov rdx, r14
0000000145b7df86  4989d8                 mov r8, rbx
0000000145b7df89  e81d5b4200             call 0x145fa3aab
0000000145b7df8e  4c896d40               mov qword ptr [rbp + 0x40], r13
0000000145b7df92  f30f10b6dc0b0000       movss xmm6, dword ptr [rsi + 0xbdc]
0000000145b7df9a  488b9620080000         mov rdx, qword ptr [rsi + 0x820]
0000000145b7dfa1  4885d2                 test rdx, rdx
0000000145b7dfa4  0f8423010000           je 0x145b7e0cd
0000000145b7dfaa  488b8618080000         mov rax, qword ptr [rsi + 0x818]
0000000145b7dfb1  4883fa01               cmp rdx, 1
0000000145b7dfb5  750c                   jne 0x145b7dfc3
0000000145b7dfb7  f30f1005f15d5f00       movss xmm0, dword ptr [rip + 0x5f5df1]
0000000145b7dfbf  31c9                   xor ecx, ecx
0000000145b7dfc1  eb57                   jmp 0x145b7e01a
0000000145b7dfc3  4989d0                 mov r8, rdx
0000000145b7dfc6  4983e0fe               and r8, 0xfffffffffffffffe
0000000145b7dfca  f30f1005de5d5f00       movss xmm0, dword ptr [rip + 0x5f5dde]
0000000145b7dfd2  31c9                   xor ecx, ecx
0000000145b7dfd4  eb13                   jmp 0x145b7dfe9
0000000145b7dfd6  662e0f1f840000000000   nop word ptr cs:[rax + rax]
0000000145b7dfe0  4883c102               add rcx, 2
0000000145b7dfe4  4939c8                 cmp r8, rcx
0000000145b7dfe7  742c                   je 0x145b7e015
0000000145b7dfe9  803cc820               cmp byte ptr [rax + rcx*8], 0x20
0000000145b7dfed  7411                   je 0x145b7e000
0000000145b7dfef  807cc80820             cmp byte ptr [rax + rcx*8 + 8], 0x20
0000000145b7dff4  75ea                   jne 0x145b7dfe0
0000000145b7dff6  eb15                   jmp 0x145b7e00d
0000000145b7dff8  0f1f840000000000       nop dword ptr [rax + rax]
0000000145b7e000  f30f5844c804           addss xmm0, dword ptr [rax + rcx*8 + 4]
0000000145b7e006  807cc80820             cmp byte ptr [rax + rcx*8 + 8], 0x20
0000000145b7e00b  75d3                   jne 0x145b7dfe0
0000000145b7e00d  f30f5844c80c           addss xmm0, dword ptr [rax + rcx*8 + 0xc]
0000000145b7e013  ebcb                   jmp 0x145b7dfe0
0000000145b7e015  f6c201                 test dl, 1
0000000145b7e018  740c                   je 0x145b7e026
0000000145b7e01a  803cc820               cmp byte ptr [rax + rcx*8], 0x20
0000000145b7e01e  7506                   jne 0x145b7e026
0000000145b7e020  f30f5844c804           addss xmm0, dword ptr [rax + rcx*8 + 4]
0000000145b7e026  0f57c9                 xorps xmm1, xmm1
0000000145b7e029  0f2ec1                 ucomiss xmm0, xmm1
0000000145b7e02c  0f869b000000           jbe 0x145b7e0cd
0000000145b7e032  488b86d8010000         mov rax, qword ptr [rsi + 0x1d8]
0000000145b7e039  4885c0                 test rax, rax
0000000145b7e03c  0f848b000000           je 0x145b7e0cd
0000000145b7e042  488b8ed0010000         mov rcx, qword ptr [rsi + 0x1d0]
0000000145b7e049  48c1e004               shl rax, 4
0000000145b7e04d  31d2                   xor edx, edx
0000000145b7e04f  49b8736f756c5f6c696e   movabs r8, 0x6e696c5f6c756f73
0000000145b7e059  eb0e                   jmp 0x145b7e069
0000000145b7e05b  0f1f440000             nop dword ptr [rax + rax]
0000000145b7e060  4883c210               add rdx, 0x10
0000000145b7e064  4839d0                 cmp rax, rdx
0000000145b7e067  7464                   je 0x145b7e0cd
0000000145b7e069  4c8b0c11               mov r9, qword ptr [rcx + rdx]
0000000145b7e06d  4983793809             cmp qword ptr [r9 + 0x38], 9
0000000145b7e072  75ec                   jne 0x145b7e060
0000000145b7e074  4d8b4930               mov r9, qword ptr [r9 + 0x30]
0000000145b7e078  4d8b11                 mov r10, qword ptr [r9]
0000000145b7e07b  4d31c2                 xor r10, r8
0000000145b7e07e  450fb64908             movzx r9d, byte ptr [r9 + 8]
0000000145b7e083  4983f16b               xor r9, 0x6b
0000000145b7e087  4d09d1                 or r9, r10
0000000145b7e08a  75d4                   jne 0x145b7e060
0000000145b7e08c  0fb65c1108             movzx ebx, byte ptr [rcx + rdx + 8]
0000000145b7e091  84db                   test bl, bl
0000000145b7e093  7438                   je 0x145b7e0cd
0000000145b7e095  4d39fd                 cmp r13, r15
0000000145b7e098  750e                   jne 0x145b7e0a8
0000000145b7e09a  488d4d30               lea rcx, [rbp + 0x30]
0000000145b7e09e  e84d5a4500             call 0x145fd3af0
0000000145b7e0a3  90                     nop
0000000145b7e0a4  488b7d38               mov rdi, qword ptr [rbp + 0x38]
0000000145b7e0a8  0fb6c3                 movzx eax, bl
0000000145b7e0ab  0f57c0                 xorps xmm0, xmm0
0000000145b7e0ae  f30f2ac0               cvtsi2ss xmm0, eax
0000000145b7e0b2  f30f590502b56000       mulss xmm0, dword ptr [rip + 0x60b502]
0000000145b7e0ba  42c604ef05             mov byte ptr [rdi + r13*8], 5
0000000145b7e0bf  f3420f1144ef04         movss dword ptr [rdi + r13*8 + 4], xmm0
0000000145b7e0c6  49ffc5                 inc r13
0000000145b7e0c9  4c896d40               mov qword ptr [rbp + 0x40], r13
0000000145b7e0cd  4c8b7658               mov r14, qword ptr [rsi + 0x58]
0000000145b7e0d1  4c8b7e60               mov r15, qword ptr [rsi + 0x60]
0000000145b7e0d5  49c1e704               shl r15, 4
0000000145b7e0d9  4d01f7                 add r15, r14
0000000145b7e0dc  4c8ba650080000         mov r12, qword ptr [rsi + 0x850]
0000000145b7e0e3  488bbe48080000         mov rdi, qword ptr [rsi + 0x848]
0000000145b7e0ea  4a8d1ced00000000       lea rbx, [r13*8]
0000000145b7e0f2  488d4d30               lea rcx, [rbp + 0x30]
0000000145b7e0f6  662e0f1f840000000000   nop word ptr cs:[rax + rax]
0000000145b7e100  4983c610               add r14, 0x10
0000000145b7e104  498d46f0               lea rax, [r14 - 0x10]
0000000145b7e108  4c39f8                 cmp rax, r15
0000000145b7e10b  7472                   je 0x145b7e17f
0000000145b7e10d  0f2e700c               ucomiss xmm6, dword ptr [rax + 0xc]
0000000145b7e111  73ed                   jae 0x145b7e100
0000000145b7e113  488b00                 mov rax, qword ptr [rax]
0000000145b7e116  4c39e0                 cmp rax, r12
0000000145b7e119  73e5                   jae 0x145b7e100
0000000145b7e11b  48c1e006               shl rax, 6
0000000145b7e11f  803c070f               cmp byte ptr [rdi + rax], 0xf
0000000145b7e123  75db                   jne 0x145b7e100
0000000145b7e125  4889b580000000         mov qword ptr [rbp + 0x80], rsi
0000000145b7e12c  4801f8                 add rax, rdi
0000000145b7e12f  458b46f8               mov r8d, dword ptr [r14 - 8]
0000000145b7e133  4c89ea                 mov rdx, r13
0000000145b7e136  440fb66801             movzx r13d, byte ptr [rax + 1]
0000000145b7e13b  0f57ff                 xorps xmm7, xmm7
0000000145b7e13e  f3490f2af8             cvtsi2ss xmm7, r8
0000000145b7e143  f30f597804             mulss xmm7, dword ptr [rax + 4]
0000000145b7e148  4889d6                 mov rsi, rdx
0000000145b7e14b  483b5530               cmp rdx, qword ptr [rbp + 0x30]
0000000145b7e14f  7509                   jne 0x145b7e15a
0000000145b7e151  e89a594500             call 0x145fd3af0
0000000145b7e156  488d4d30               lea rcx, [rbp + 0x30]
0000000145b7e15a  488b4538               mov rax, qword ptr [rbp + 0x38]
0000000145b7e15e  44882cf0               mov byte ptr [rax + rsi*8], r13b
0000000145b7e162  4989f5                 mov r13, rsi
0000000145b7e165  f30f117cf004           movss dword ptr [rax + rsi*8 + 4], xmm7
0000000145b7e16b  49ffc5                 inc r13
0000000145b7e16e  4c896d40               mov qword ptr [rbp + 0x40], r13
0000000145b7e172  4883c308               add rbx, 8
0000000145b7e176  488bb580000000         mov rsi, qword ptr [rbp + 0x80]
0000000145b7e17d  eb81                   jmp 0x145b7e100
0000000145b7e17f  8b8600050000           mov eax, dword ptr [rsi + 0x500]
0000000145b7e185  f34c0f2ac8             cvtsi2ss xmm9, rax
0000000145b7e18a  f3440f580dadb06000     addss xmm9, dword ptr [rip + 0x60b0ad]
0000000145b7e193  f3440f1025f02e6100     movss xmm12, dword ptr [rip + 0x612ef0]
0000000145b7e19c  f30f1005fcd06200       movss xmm0, dword ptr [rip + 0x62d0fc]
0000000145b7e1a4  f3410f59c1             mulss xmm0, xmm9
0000000145b7e1a9  f3440f1005ee565f00     movss xmm8, dword ptr [rip + 0x5f56ee]
0000000145b7e1b2  f3410f58c0             addss xmm0, xmm8
0000000145b7e1b7  0f298590000000         movaps xmmword ptr [rbp + 0x90], xmm0
0000000145b7e1be  488b7d00               mov rdi, qword ptr [rbp]
0000000145b7e1c2  f30f108784000000       movss xmm0, dword ptr [rdi + 0x84]
0000000145b7e1ca  0f298580000000         movaps xmmword ptr [rbp + 0x80], xmm0
0000000145b7e1d1  f30f1005875c5f00       movss xmm0, dword ptr [rip + 0x5f5c87]
0000000145b7e1d9  f3490f2cc9             cvttss2si rcx, xmm9
0000000145b7e1de  31c0                   xor eax, eax
0000000145b7e1e0  0f57d2                 xorps xmm2, xmm2
0000000145b7e1e3  0f57c9                 xorps xmm1, xmm1
0000000145b7e1e6  0f294d20               movaps xmmword ptr [rbp + 0x20], xmm1
0000000145b7e1ea  440f2eca               ucomiss xmm9, xmm2
0000000145b7e1ee  0f42c8                 cmovb ecx, eax
0000000145b7e1f1  f3410f59c1             mulss xmm0, xmm9
0000000145b7e1f6  440f2e0db6e86000       ucomiss xmm9, dword ptr [rip + 0x60e8b6]
0000000145b7e1fe  baffffffff             mov edx, 0xffffffff
0000000145b7e203  0f46d1                 cmovbe edx, ecx
0000000145b7e206  f30f580506316300       addss xmm0, dword ptr [rip + 0x633106]
0000000145b7e20e  ffc2                   inc edx
0000000145b7e210  41b889888888           mov r8d, 0x88888889
0000000145b7e216  4c0fafc2               imul r8, rdx
0000000145b7e21a  49c1e823               shr r8, 0x23
0000000145b7e21e  4183f803               cmp r8d, 3
0000000145b7e222  b903000000             mov ecx, 3
0000000145b7e227  410f42c8               cmovb ecx, r8d
0000000145b7e22b  488b95a0000000         mov rdx, qword ptr [rbp + 0xa0]
0000000145b7e232  4c8b4228               mov r8, qword ptr [rdx + 0x28]
0000000145b7e236  4d85c0                 test r8, r8
0000000145b7e239  0f8405010000           je 0x145b7e344
0000000145b7e23f  488b5220               mov rdx, qword ptr [rdx + 0x20]
0000000145b7e243  4e8d04c2               lea r8, [rdx + r8*8]
0000000145b7e247  f30f10153d2e6100       movss xmm2, dword ptr [rip + 0x612e3d]
0000000145b7e24f  f30f100dbdb06000       movss xmm1, dword ptr [rip + 0x60b0bd]
0000000145b7e257  0f294d70               movaps xmmword ptr [rbp + 0x70], xmm1
0000000145b7e25b  450f57d2               xorps xmm10, xmm10
0000000145b7e25f  f30f101d39565f00       movss xmm3, dword ptr [rip + 0x5f5639]
0000000145b7e267  4c8d0df699a701         lea r9, [rip + 0x1a799f6]
0000000145b7e26e  0f28fb                 movaps xmm7, xmm3
0000000145b7e271  0f299da0000000         movaps xmmword ptr [rbp + 0xa0], xmm3
0000000145b7e278  440f28fb               movaps xmm15, xmm3
0000000145b7e27c  450f57ed               xorps xmm13, xmm13
0000000145b7e280  0f295d50               movaps xmmword ptr [rbp + 0x50], xmm3
0000000145b7e284  0f57f6                 xorps xmm6, xmm6
0000000145b7e287  eb14                   jmp 0x145b7e29d
0000000145b7e289  f30f58f1               addss xmm6, xmm1
0000000145b7e28d  0f1f00                 nop dword ptr [rax]
0000000145b7e290  4883c208               add rdx, 8
0000000145b7e294  4c39c2                 cmp rdx, r8
0000000145b7e297  0f84d7000000           je 0x145b7e374
0000000145b7e29d  448b12                 mov r10d, dword ptr [rdx]
0000000145b7e2a0  f30f104a04             movss xmm1, dword ptr [rdx + 4]
0000000145b7e2a5  4f631491               movsxd r10, dword ptr [r9 + r10*4]
0000000145b7e2a9  4d01ca                 add r10, r9
0000000145b7e2ac  41ffe2                 jmp r10
0000000145b7e2af  f30f58f9               addss xmm7, xmm1
0000000145b7e2b3  ebdb                   jmp 0x145b7e290
0000000145b7e2b5  440f285d70             movaps xmm11, xmmword ptr [rbp + 0x70]
0000000145b7e2ba  f3440f58d9             addss xmm11, xmm1
0000000145b7e2bf  440f295d70             movaps xmmword ptr [rbp + 0x70], xmm11
0000000145b7e2c4  ebca                   jmp 0x145b7e290
0000000145b7e2c6  440f287550             movaps xmm14, xmmword ptr [rbp + 0x50]
0000000145b7e2cb  f3440f58f1             addss xmm14, xmm1
0000000145b7e2d0  440f297550             movaps xmmword ptr [rbp + 0x50], xmm14
0000000145b7e2d5  ebb9                   jmp 0x145b7e290
0000000145b7e2d7  f3440f58d1             addss xmm10, xmm1
0000000145b7e2dc  ebb2                   jmp 0x145b7e290
0000000145b7e2de  0f28ada0000000         movaps xmm5, xmmword ptr [rbp + 0xa0]
0000000145b7e2e5  f30f58e9               addss xmm5, xmm1
0000000145b7e2e9  0f29ada0000000         movaps xmmword ptr [rbp + 0xa0], xmm5
0000000145b7e2f0  eb9e                   jmp 0x145b7e290
0000000145b7e2f2  f30f58cb               addss xmm1, xmm3
0000000145b7e2f6  f30f59d1               mulss xmm2, xmm1
0000000145b7e2fa  eb94                   jmp 0x145b7e290
0000000145b7e2fc  0f28a590000000         movaps xmm4, xmmword ptr [rbp + 0x90]
0000000145b7e303  f30f58e1               addss xmm4, xmm1
0000000145b7e307  0f29a590000000         movaps xmmword ptr [rbp + 0x90], xmm4
0000000145b7e30e  eb80                   jmp 0x145b7e290
0000000145b7e310  0f28ad80000000         movaps xmm5, xmmword ptr [rbp + 0x80]
0000000145b7e317  f30f58e9               addss xmm5, xmm1
0000000145b7e31b  0f29ad80000000         movaps xmmword ptr [rbp + 0x80], xmm5
0000000145b7e322  e969ffffff             jmp 0x145b7e290
0000000145b7e327  f30f58c1               addss xmm0, xmm1
0000000145b7e32b  e960ffffff             jmp 0x145b7e290
0000000145b7e330  f3440f58e9             addss xmm13, xmm1
0000000145b7e335  e956ffffff             jmp 0x145b7e290
0000000145b7e33a  f3440f58f9             addss xmm15, xmm1
0000000145b7e33f  e94cffffff             jmp 0x145b7e290
0000000145b7e344  f30f100dc8af6000       movss xmm1, dword ptr [rip + 0x60afc8]
0000000145b7e34c  0f294d70               movaps xmmword ptr [rbp + 0x70], xmm1
0000000145b7e350  0f57f6                 xorps xmm6, xmm6
0000000145b7e353  440f294550             movaps xmmword ptr [rbp + 0x50], xmm8
0000000145b7e358  450f57ed               xorps xmm13, xmm13
0000000145b7e35c  450f28f8               movaps xmm15, xmm8
0000000145b7e360  410f28d4               movaps xmm2, xmm12
0000000145b7e364  440f2985a0000000       movaps xmmword ptr [rbp + 0xa0], xmm8
0000000145b7e36c  450f57d2               xorps xmm10, xmm10
0000000145b7e370  410f28f8               movaps xmm7, xmm8
0000000145b7e374  f3450f59cc             mulss xmm9, xmm12
0000000145b7e379  488b96a0030000         mov rdx, qword ptr [rsi + 0x3a0]
0000000145b7e380  4885d2                 test rdx, rdx
0000000145b7e383  7448                   je 0x145b7e3cd
0000000145b7e385  4c8b8698030000         mov r8, qword ptr [rsi + 0x398]
0000000145b7e38c  48c1e203               shl rdx, 3
0000000145b7e390  31c0                   xor eax, eax
0000000145b7e392  f3440f100505555f00     movss xmm8, dword ptr [rip + 0x5f5505]
0000000145b7e39b  f30f102d2db26000       movss xmm5, dword ptr [rip + 0x60b22d]
0000000145b7e3a3  0f57c9                 xorps xmm1, xmm1
0000000145b7e3a6  0f294d20               movaps xmmword ptr [rbp + 0x20], xmm1
0000000145b7e3aa  458b1400               mov r10d, dword ptr [r8 + rax]
0000000145b7e3ae  4c8d0ddf98a701         lea r9, [rip + 0x1a798df]
0000000145b7e3b5  4f631c91               movsxd r11, dword ptr [r9 + r10*4]
0000000145b7e3b9  4d01cb                 add r11, r9
0000000145b7e3bc  0f57db                 xorps xmm3, xmm3
0000000145b7e3bf  4531d2                 xor r10d, r10d
0000000145b7e3c2  440f28f7               movaps xmm14, xmm7
0000000145b7e3c6  410f28fa               movaps xmm7, xmm10
0000000145b7e3ca  41ffe3                 jmp r11
0000000145b7e3cd  f30f102dfbb16000       movss xmm5, dword ptr [rip + 0x60b1fb]
0000000145b7e3d5  0f57db                 xorps xmm3, xmm3
0000000145b7e3d8  440f28f7               movaps xmm14, xmm7
0000000145b7e3dc  410f28fa               movaps xmm7, xmm10
0000000145b7e3e0  eb00                   jmp 0x145b7e3e2
0000000145b7e3e2  f30f115d14             movss dword ptr [rbp + 0x14], xmm3
0000000145b7e3e7  488b5530               mov rdx, qword ptr [rbp + 0x30]
0000000145b7e3eb  48895518               mov qword ptr [rbp + 0x18], rdx
0000000145b7e3ef  f3440f588f80000000     addss xmm9, dword ptr [rdi + 0x80]
0000000145b7e3f8  f3440f114d10           movss dword ptr [rbp + 0x10], xmm9
0000000145b7e3fe  4c8b7538               mov r14, qword ptr [rbp + 0x38]
0000000145b7e402  4c8b8670030000         mov r8, qword ptr [rsi + 0x370]
0000000145b7e409  4d85c0                 test r8, r8
0000000145b7e40c  7439                   je 0x145b7e447
0000000145b7e40e  488b9668030000         mov rdx, qword ptr [rsi + 0x368]
0000000145b7e415  49c1e003               shl r8, 3
0000000145b7e419  4f8d0440               lea r8, [r8 + r8*2]
0000000145b7e41d  0f57db                 xorps xmm3, xmm3
0000000145b7e420  4531c9                 xor r9d, r9d
0000000145b7e423  f3460f104c0a10         movss xmm9, dword ptr [rdx + r9 + 0x10]
0000000145b7e42a  4e8b1c0a               mov r11, qword ptr [rdx + r9]
0000000145b7e42e  410fb67b44             movzx edi, byte ptr [r11 + 0x44]
0000000145b7e433  4c8d158e98a701         lea r10, [rip + 0x1a7988e]
0000000145b7e43a  49633cba               movsxd rdi, dword ptr [r10 + rdi*4]
0000000145b7e43e  4c01d7                 add rdi, r10
0000000145b7e441  450f57d2               xorps xmm10, xmm10
0000000145b7e445  ffe7                   jmp rdi
0000000145b7e447  0f57db                 xorps xmm3, xmm3
0000000145b7e44a  450f57d2               xorps xmm10, xmm10
0000000145b7e44e  f30f1025d6b06000       movss xmm4, dword ptr [rip + 0x60b0d6]
0000000145b7e456  4d85ed                 test r13, r13
0000000145b7e459  440f2955a0             movaps xmmword ptr [rbp - 0x60], xmm10
0000000145b7e45e  0f85e1010000           jne 0x145b7e645
0000000145b7e464  450f57e4               xorps xmm12, xmm12
0000000145b7e468  440f28db               movaps xmm11, xmm3
0000000145b7e46c  0f296de0               movaps xmmword ptr [rbp - 0x20], xmm5
0000000145b7e470  450f28ce               movaps xmm9, xmm14
0000000145b7e474  440f28f7               movaps xmm14, xmm7
0000000145b7e478  0f2955d0               movaps xmmword ptr [rbp - 0x30], xmm2
0000000145b7e47c  440f297dc0             movaps xmmword ptr [rbp - 0x40], xmm15
0000000145b7e481  0f286d70               movaps xmm5, xmmword ptr [rbp + 0x70]
0000000145b7e485  0f2975b0               movaps xmmword ptr [rbp - 0x50], xmm6
0000000145b7e489  0f57c9                 xorps xmm1, xmm1
0000000145b7e48c  f30f114d6c             movss dword ptr [rbp + 0x6c], xmm1
0000000145b7e491  0f57db                 xorps xmm3, xmm3
0000000145b7e494  e9dd010000             jmp 0x145b7e676
0000000145b7e499  0f288d90000000         movaps xmm1, xmmword ptr [rbp + 0x90]
0000000145b7e4a0  f3430f584c1004         addss xmm1, dword ptr [r8 + r10 + 4]
0000000145b7e4a7  0f298d90000000         movaps xmmword ptr [rbp + 0x90], xmm1
0000000145b7e4ae  4983c208               add r10, 8
0000000145b7e4b2  4c39d2                 cmp rdx, r10
0000000145b7e4b5  0f855d010000           jne 0x145b7e618
0000000145b7e4bb  e922ffffff             jmp 0x145b7e3e2
0000000145b7e4c0  f3430f587c1004         addss xmm7, dword ptr [r8 + r10 + 4]
0000000145b7e4c7  4983c208               add r10, 8
0000000145b7e4cb  4c39d2                 cmp rdx, r10
0000000145b7e4ce  0f8544010000           jne 0x145b7e618
0000000145b7e4d4  e909ffffff             jmp 0x145b7e3e2
0000000145b7e4d9  f3430f585c1004         addss xmm3, dword ptr [r8 + r10 + 4]
0000000145b7e4e0  4983c208               add r10, 8
0000000145b7e4e4  4c39d2                 cmp rdx, r10
0000000145b7e4e7  0f852b010000           jne 0x145b7e618
0000000145b7e4ed  e9f0feffff             jmp 0x145b7e3e2
0000000145b7e4f2  0f284d70               movaps xmm1, xmmword ptr [rbp + 0x70]
0000000145b7e4f6  f3430f584c1004         addss xmm1, dword ptr [r8 + r10 + 4]
0000000145b7e4fd  0f294d70               movaps xmmword ptr [rbp + 0x70], xmm1
0000000145b7e501  4983c208               add r10, 8
0000000145b7e505  4c39d2                 cmp rdx, r10
0000000145b7e508  0f850a010000           jne 0x145b7e618
0000000145b7e50e  e9cffeffff             jmp 0x145b7e3e2
0000000145b7e513  f3430f586c1004         addss xmm5, dword ptr [r8 + r10 + 4]
0000000145b7e51a  4983c208               add r10, 8
0000000145b7e51e  4c39d2                 cmp rdx, r10
0000000145b7e521  0f85f1000000           jne 0x145b7e618
0000000145b7e527  e9b6feffff             jmp 0x145b7e3e2
0000000145b7e52c  0f288da0000000         movaps xmm1, xmmword ptr [rbp + 0xa0]
0000000145b7e533  f3430f584c1004         addss xmm1, dword ptr [r8 + r10 + 4]
0000000145b7e53a  0f298da0000000         movaps xmmword ptr [rbp + 0xa0], xmm1
0000000145b7e541  4983c208               add r10, 8
0000000145b7e545  4c39d2                 cmp rdx, r10
0000000145b7e548  0f85ca000000           jne 0x145b7e618
0000000145b7e54e  e98ffeffff             jmp 0x145b7e3e2
0000000145b7e553  0f288d80000000         movaps xmm1, xmmword ptr [rbp + 0x80]
0000000145b7e55a  f3430f584c1004         addss xmm1, dword ptr [r8 + r10 + 4]
0000000145b7e561  0f298d80000000         movaps xmmword ptr [rbp + 0x80], xmm1
0000000145b7e568  4983c208               add r10, 8
0000000145b7e56c  4c39d2                 cmp rdx, r10
0000000145b7e56f  0f85a3000000           jne 0x145b7e618
0000000145b7e575  e968feffff             jmp 0x145b7e3e2
0000000145b7e57a  f3430f58441004         addss xmm0, dword ptr [r8 + r10 + 4]
0000000145b7e581  4983c208               add r10, 8
0000000145b7e585  4c39d2                 cmp rdx, r10
0000000145b7e588  0f858a000000           jne 0x145b7e618
0000000145b7e58e  e94ffeffff             jmp 0x145b7e3e2
0000000145b7e593  0f28ca                 movaps xmm1, xmm2
0000000145b7e596  f3430f10541004         movss xmm2, dword ptr [r8 + r10 + 4]
0000000145b7e59d  f30f5815fb525f00       addss xmm2, dword ptr [rip + 0x5f52fb]
0000000145b7e5a5  f30f59d1               mulss xmm2, xmm1
0000000145b7e5a9  4983c208               add r10, 8
0000000145b7e5ad  4c39d2                 cmp rdx, r10
0000000145b7e5b0  7566                   jne 0x145b7e618
0000000145b7e5b2  e92bfeffff             jmp 0x145b7e3e2
0000000145b7e5b7  0f284d50               movaps xmm1, xmmword ptr [rbp + 0x50]
0000000145b7e5bb  f3430f584c1004         addss xmm1, dword ptr [r8 + r10 + 4]
0000000145b7e5c2  0f294d50               movaps xmmword ptr [rbp + 0x50], xmm1
0000000145b7e5c6  4983c208               add r10, 8
0000000145b7e5ca  4c39d2                 cmp rdx, r10
0000000145b7e5cd  7549                   jne 0x145b7e618
0000000145b7e5cf  e90efeffff             jmp 0x145b7e3e2
0000000145b7e5d4  f3470f58441004         addss xmm8, dword ptr [r8 + r10 + 4]
0000000145b7e5db  4983c208               add r10, 8
0000000145b7e5df  4c39d2                 cmp rdx, r10
0000000145b7e5e2  7534                   jne 0x145b7e618
0000000145b7e5e4  e9f9fdffff             jmp 0x145b7e3e2
0000000145b7e5e9  4303441004             add eax, dword ptr [r8 + r10 + 4]
0000000145b7e5ee  4983c208               add r10, 8
0000000145b7e5f2  4c39d2                 cmp rdx, r10
0000000145b7e5f5  7521                   jne 0x145b7e618
0000000145b7e5f7  e9e6fdffff             jmp 0x145b7e3e2
0000000145b7e5fc  0f284d20               movaps xmm1, xmmword ptr [rbp + 0x20]
0000000145b7e600  f3430f584c1004         addss xmm1, dword ptr [r8 + r10 + 4]
0000000145b7e607  0f294d20               movaps xmmword ptr [rbp + 0x20], xmm1
0000000145b7e60b  4983c208               add r10, 8
0000000145b7e60f  4c39d2                 cmp rdx, r10
0000000145b7e612  0f84cafdffff           je 0x145b7e3e2
0000000145b7e618  478b1c10               mov r11d, dword ptr [r8 + r10]
0000000145b7e61c  4f631c99               movsxd r11, dword ptr [r9 + r11*4]
0000000145b7e620  4d01cb                 add r11, r9
0000000145b7e623  41ffe3                 jmp r11
0000000145b7e626  f3440f5d15a9ab6000     minss xmm10, dword ptr [rip + 0x60aba9]
0000000145b7e62f  f30f1025f5ae6000       movss xmm4, dword ptr [rip + 0x60aef5]
0000000145b7e637  4d85ed                 test r13, r13
0000000145b7e63a  440f2955a0             movaps xmmword ptr [rbp - 0x60], xmm10
0000000145b7e63f  0f841ffeffff           je 0x145b7e464
0000000145b7e645  0f295d00               movaps xmmword ptr [rbp], xmm3
0000000145b7e649  498d5604               lea rdx, [r14 + 4]
0000000145b7e64d  f3440f101dd6ae6000     movss xmm11, dword ptr [rip + 0x60aed6]
0000000145b7e656  450f57e4               xorps xmm12, xmm12
0000000145b7e65a  440fb64afc             movzx r9d, byte ptr [rdx - 4]
0000000145b7e65f  4c8d05b296a701         lea r8, [rip + 0x1a796b2]
0000000145b7e666  4f630c88               movsxd r9, dword ptr [r8 + r9*4]
0000000145b7e66a  4d01c1                 add r9, r8
0000000145b7e66d  0f57e4                 xorps xmm4, xmm4
0000000145b7e670  0f57db                 xorps xmm3, xmm3
0000000145b7e673  41ffe1                 jmp r9
0000000145b7e676  0fb696850c0000         movzx edx, byte ptr [rsi + 0xc85]
0000000145b7e67d  f30f1096ac020000       movss xmm2, dword ptr [rsi + 0x2ac]
0000000145b7e685  f3440f1096dc0b0000     movss xmm10, dword ptr [rsi + 0xbdc]
0000000145b7e68e  4c8b8eb0030000         mov r9, qword ptr [rsi + 0x3b0]
0000000145b7e695  4c8b86b8030000         mov r8, qword ptr [rsi + 0x3b8]
0000000145b7e69c  49c1e005               shl r8, 5
0000000145b7e6a0  4d01c8                 add r8, r9
0000000145b7e6a3  f30f103df5515f00       movss xmm7, dword ptr [rip + 0x5f51f5]
0000000145b7e6ab  f3410f58fb             addss xmm7, xmm11
0000000145b7e6b0  f30f100dec515f00       movss xmm1, dword ptr [rip + 0x5f51ec]
0000000145b7e6b8  4d89ca                 mov r10, r9
0000000145b7e6bb  0f1f440000             nop dword ptr [rax + rax]
0000000145b7e6c0  4d39c2                 cmp r10, r8
0000000145b7e6c3  0f84aa000000           je 0x145b7e773
0000000145b7e6c9  4d8d4a20               lea r9, [r10 + 0x20]
0000000145b7e6cd  450f2e5218             ucomiss xmm10, dword ptr [r10 + 0x18]
0000000145b7e6d2  4d89ca                 mov r10, r9
0000000145b7e6d5  73e9                   jae 0x145b7e6c0
0000000145b7e6d7  458b51e8               mov r10d, dword ptr [r9 - 0x18]
0000000145b7e6db  450f28f8               movaps xmm15, xmm8
0000000145b7e6df  4183fa08               cmp r10d, 8
0000000145b7e6e3  7448                   je 0x145b7e72d
0000000145b7e6e5  4183fa09               cmp r10d, 9
0000000145b7e6e9  7510                   jne 0x145b7e6fb
0000000145b7e6eb  f3450f1041ec           movss xmm8, dword ptr [r9 - 0x14]
0000000145b7e6f1  f3440f59c7             mulss xmm8, xmm7
0000000145b7e6f6  f3450f58f0             addss xmm14, xmm8
0000000145b7e6fb  458b51f4               mov r10d, dword ptr [r9 - 0xc]
0000000145b7e6ff  4181fad15b0000         cmp r10d, 0x5bd1
0000000145b7e706  7450                   je 0x145b7e758
0000000145b7e708  4181fa9b5b0000         cmp r10d, 0x5b9b
0000000145b7e70f  450f28c7               movaps xmm8, xmm15
0000000145b7e713  75a3                   jne 0x145b7e6b8
0000000145b7e715  0f28b5a0000000         movaps xmm6, xmmword ptr [rbp + 0xa0]
0000000145b7e71c  f30f583508ae6000       addss xmm6, dword ptr [rip + 0x60ae08]
0000000145b7e724  0f29b5a0000000         movaps xmmword ptr [rbp + 0xa0], xmm6
0000000145b7e72b  eb8b                   jmp 0x145b7e6b8
0000000145b7e72d  f3450f1041ec           movss xmm8, dword ptr [r9 - 0x14]
0000000145b7e733  f3440f59c7             mulss xmm8, xmm7
0000000145b7e738  0f28b590000000         movaps xmm6, xmmword ptr [rbp + 0x90]
0000000145b7e73f  f3410f58f0             addss xmm6, xmm8
0000000145b7e744  0f29b590000000         movaps xmmword ptr [rbp + 0x90], xmm6
0000000145b7e74b  458b51f4               mov r10d, dword ptr [r9 - 0xc]
0000000145b7e74f  4181fad15b0000         cmp r10d, 0x5bd1
0000000145b7e756  75b0                   jne 0x145b7e708
0000000145b7e758  0f28b590000000         movaps xmm6, xmmword ptr [rbp + 0x90]
0000000145b7e75f  f30f58f1               addss xmm6, xmm1
0000000145b7e763  0f29b590000000         movaps xmmword ptr [rbp + 0x90], xmm6
0000000145b7e76a  450f28c7               movaps xmm8, xmm15
0000000145b7e76e  e945ffffff             jmp 0x145b7e6b8
0000000145b7e773  410f28f0               movaps xmm6, xmm8
0000000145b7e777  84d2                   test dl, dl
0000000145b7e779  7405                   je 0x145b7e780
0000000145b7e77b  f3440f58ea             addss xmm13, xmm2
0000000145b7e780  f30f105510             movss xmm2, dword ptr [rbp + 0x10]
0000000145b7e785  f3440f107d14           movss xmm15, dword ptr [rbp + 0x14]
0000000145b7e78b  f3440f58fa             addss xmm15, xmm2
0000000145b7e790  f3450f59f9             mulss xmm15, xmm9
0000000145b7e795  f3440f100d02515f00     movss xmm9, dword ptr [rip + 0x5f5102]
0000000145b7e79e  f3410f5fd1             maxss xmm2, xmm9
0000000145b7e7a3  450f28c7               movaps xmm8, xmm15
0000000145b7e7a7  f3440f5ec2             divss xmm8, xmm2
0000000145b7e7ac  f3410f59df             mulss xmm3, xmm15
0000000145b7e7b1  f30f58c3               addss xmm0, xmm3
0000000145b7e7b5  f3450f58f1             addss xmm14, xmm9
0000000145b7e7ba  31d2                   xor edx, edx
0000000145b7e7bc  410f2ee9               ucomiss xmm5, xmm9
0000000145b7e7c0  f3450f5ece             divss xmm9, xmm14
0000000145b7e7c5  440f28b580000000       movaps xmm14, xmmword ptr [rbp + 0x80]
0000000145b7e7cd  410f28d6               movaps xmm2, xmm14
0000000145b7e7d1  f30f5cd4               subss xmm2, xmm4
0000000145b7e7d5  0f57c9                 xorps xmm1, xmm1
0000000145b7e7d8  f30f5fd1               maxss xmm2, xmm1
0000000145b7e7dc  f3440f59e2             mulss xmm12, xmm2
0000000145b7e7e1  410f28d6               movaps xmm2, xmm14
0000000145b7e7e5  f30f5dd4               minss xmm2, xmm4
0000000145b7e7e9  440f28d2               movaps xmm10, xmm2
0000000145b7e7ed  f3440fc2d203           cmpunordss xmm10, xmm2
0000000145b7e7f3  410f28fa               movaps xmm7, xmm10
0000000145b7e7f7  0f55fa                 andnps xmm7, xmm2
0000000145b7e7fa  450f54d6               andps xmm10, xmm14
0000000145b7e7fe  440f56d7               orps xmm10, xmm7
0000000145b7e802  410f28fa               movaps xmm7, xmm10
0000000145b7e806  f3440f59556c           mulss xmm10, dword ptr [rbp + 0x6c]
0000000145b7e80c  f3440f5e15fb505f00     divss xmm10, dword ptr [rip + 0x5f50fb]
0000000145b7e815  f3450f58d4             addss xmm10, xmm12
0000000145b7e81a  f3440f589590000000     addss xmm10, dword ptr [rbp + 0x90]
0000000145b7e823  410f28d7               movaps xmm2, xmm15
0000000145b7e827  f30f5c96a0040000       subss xmm2, dword ptr [rsi + 0x4a0]
0000000145b7e82f  450f28e7               movaps xmm12, xmm15
0000000145b7e833  f3440f11bea0040000     movss dword ptr [rsi + 0x4a0], xmm15
0000000145b7e83c  f3440f1196a4040000     movss dword ptr [rsi + 0x4a4], xmm10
0000000145b7e845  f3440f118ea8040000     movss dword ptr [rsi + 0x4a8], xmm9
0000000145b7e84e  f30f1025eaa96000       movss xmm4, dword ptr [rip + 0x60a9ea]
0000000145b7e856  f3440f58c4             addss xmm8, xmm4
0000000145b7e85b  f30f58e5               addss xmm4, xmm5
0000000145b7e85f  0f285de0               movaps xmm3, xmmword ptr [rbp - 0x20]
0000000145b7e863  f30f58e3               addss xmm4, xmm3
0000000145b7e867  440f280d01e06e00       movaps xmm9, xmmword ptr [rip + 0x6ee001]
0000000145b7e86f  440f14cc               unpcklps xmm9, xmm4
0000000145b7e873  0f14eb                 unpcklps xmm5, xmm3
0000000145b7e876  0f97c2                 seta dl
0000000145b7e879  660f6ee2               movd xmm4, edx
0000000145b7e87d  660f70e400             pshufd xmm4, xmm4, 0
0000000145b7e882  660f72f41f             pslld xmm4, 0x1f
0000000145b7e887  660f72e41f             psrad xmm4, 0x1f
0000000145b7e88c  440f54cc               andps xmm9, xmm4
0000000145b7e890  0f55e5                 andnps xmm4, xmm5
0000000145b7e893  410f56e1               orps xmm4, xmm9
0000000145b7e897  0f13a6ac040000         movlps qword ptr [rsi + 0x4ac], xmm4
0000000145b7e89e  0f28a5a0000000         movaps xmm4, xmmword ptr [rbp + 0xa0]
0000000145b7e8a5  f30f5d25375ca701       minss xmm4, dword ptr [rip + 0x1a75c37]
0000000145b7e8ad  0f28dc                 movaps xmm3, xmm4
0000000145b7e8b0  f30f11a6b4040000       movss dword ptr [rsi + 0x4b4], xmm4
0000000145b7e8b8  0f2865d0               movaps xmm4, xmmword ptr [rbp - 0x30]
0000000145b7e8bc  f30f11a6b8040000       movss dword ptr [rsi + 0x4b8], xmm4
0000000145b7e8c4  0f2865c0               movaps xmm4, xmmword ptr [rbp - 0x40]
0000000145b7e8c8  f30f11a6bc040000       movss dword ptr [rsi + 0x4bc], xmm4
0000000145b7e8d0  f30f11bec0040000       movss dword ptr [rsi + 0x4c0], xmm7
0000000145b7e8d8  f30f1186c4040000       movss dword ptr [rsi + 0x4c4], xmm0
0000000145b7e8e0  f30f11b6c8040000       movss dword ptr [rsi + 0x4c8], xmm6
0000000145b7e8e8  f3440f11aecc040000     movss dword ptr [rsi + 0x4cc], xmm13
0000000145b7e8f1  0f284550               movaps xmm0, xmmword ptr [rbp + 0x50]
0000000145b7e8f5  f30f1186d0040000       movss dword ptr [rsi + 0x4d0], xmm0
0000000145b7e8fd  8986d4040000           mov dword ptr [rsi + 0x4d4], eax
0000000145b7e903  0f284520               movaps xmm0, xmmword ptr [rbp + 0x20]
0000000145b7e907  f30f1186d8040000       movss dword ptr [rsi + 0x4d8], xmm0
0000000145b7e90f  0f2845b0               movaps xmm0, xmmword ptr [rbp - 0x50]
0000000145b7e913  f30f1186dc040000       movss dword ptr [rsi + 0x4dc], xmm0
0000000145b7e91b  f3440f119ee0040000     movss dword ptr [rsi + 0x4e0], xmm11
0000000145b7e924  898ee4040000           mov dword ptr [rsi + 0x4e4], ecx
0000000145b7e92a  0f2845a0               movaps xmm0, xmmword ptr [rbp - 0x60]
0000000145b7e92e  f30f1186e8040000       movss dword ptr [rsi + 0x4e8], xmm0
0000000145b7e936  f3440f1186ec040000     movss dword ptr [rsi + 0x4ec], xmm8
0000000145b7e93f  0f2ed1                 ucomiss xmm2, xmm1
0000000145b7e942  f30f108e08050000       movss xmm1, dword ptr [rsi + 0x508]
0000000145b7e94a  4c8975f8               mov qword ptr [rbp - 8], r14
0000000145b7e94e  760c                   jbe 0x145b7e95c
0000000145b7e950  f30f58ca               addss xmm1, xmm2
0000000145b7e954  f30f118e08050000       movss dword ptr [rsi + 0x508], xmm1
0000000145b7e95c  0f28d1                 movaps xmm2, xmm1
0000000145b7e95f  410f28f4               movaps xmm6, xmm12
0000000145b7e963  f3410f5dd4             minss xmm2, xmm12
0000000145b7e968  0f28c2                 movaps xmm0, xmm2
0000000145b7e96b  f30fc2c203             cmpunordss xmm0, xmm2
0000000145b7e970  0f28e0                 movaps xmm4, xmm0
0000000145b7e973  0f55e2                 andnps xmm4, xmm2
0000000145b7e976  0f54c1                 andps xmm0, xmm1
0000000145b7e979  0f56c4                 orps xmm0, xmm4
0000000145b7e97c  f30f118608050000       movss dword ptr [rsi + 0x508], xmm0
0000000145b7e984  f30f591d580b6100       mulss xmm3, dword ptr [rip + 0x610b58]
0000000145b7e98c  0f28cb                 movaps xmm1, xmm3
0000000145b7e98f  f30f5c8e74050000       subss xmm1, dword ptr [rsi + 0x574]
0000000145b7e997  0f540d22545f00         andps xmm1, xmmword ptr [rip + 0x5f5422]
0000000145b7e99e  0f2e0d17ac6000         ucomiss xmm1, dword ptr [rip + 0x60ac17]
0000000145b7e9a5  0f8680000000           jbe 0x145b7ea2b
0000000145b7e9ab  f30f119e74050000       movss dword ptr [rsi + 0x574], xmm3
0000000145b7e9b3  448b8670050000         mov r8d, dword ptr [rsi + 0x570]
0000000145b7e9ba  418d4001               lea eax, [r8 + 1]
0000000145b7e9be  898670050000           mov dword ptr [rsi + 0x570], eax
0000000145b7e9c4  488b9688040000         mov rdx, qword ptr [rsi + 0x488]
0000000145b7e9cb  488d4d30               lea rcx, [rbp + 0x30]
0000000145b7e9cf  e8dcff0800             call 0x145c0e9b0
0000000145b7e9d4  90                     nop
0000000145b7e9d5  488bbe50060000         mov rdi, qword ptr [rsi + 0x650]
0000000145b7e9dc  483bbe40060000         cmp rdi, qword ptr [rsi + 0x640]
0000000145b7e9e3  750d                   jne 0x145b7e9f2
0000000145b7e9e5  488d8e40060000         lea rcx, [rsi + 0x640]
0000000145b7e9ec  e80f584200             call 0x145fa4200
0000000145b7e9f1  90                     nop
0000000145b7e9f2  488b8648060000         mov rax, qword ptr [rsi + 0x648]
0000000145b7e9f9  4889f9                 mov rcx, rdi
0000000145b7e9fc  48c1e105               shl rcx, 5
0000000145b7ea00  0f104530               movups xmm0, xmmword ptr [rbp + 0x30]
0000000145b7ea04  0f104d40               movups xmm1, xmmword ptr [rbp + 0x40]
0000000145b7ea08  0f114c0810             movups xmmword ptr [rax + rcx + 0x10], xmm1
0000000145b7ea0d  0f110408               movups xmmword ptr [rax + rcx], xmm0
0000000145b7ea11  48ffc7                 inc rdi
0000000145b7ea14  4889be50060000         mov qword ptr [rsi + 0x650], rdi
0000000145b7ea1b  f30f10b6a0040000       movss xmm6, dword ptr [rsi + 0x4a0]
0000000145b7ea23  f30f108608050000       movss xmm0, dword ptr [rsi + 0x508]
0000000145b7ea2b  0f57ff                 xorps xmm7, xmm7
0000000145b7ea2e  f30f5fc7               maxss xmm0, xmm7
0000000145b7ea32  e8c2504200             call 0x145fa3af9
0000000145b7ea37  f34c0f2cc0             cvttss2si r8, xmm0
0000000145b7ea3c  31db                   xor ebx, ebx
0000000145b7ea3e  0f2ec7                 ucomiss xmm0, xmm7
0000000145b7ea41  440f42c3               cmovb r8d, ebx
0000000145b7ea45  0f2e0568e06000         ucomiss xmm0, dword ptr [rip + 0x60e068]
0000000145b7ea4c  41beffffffff           mov r14d, 0xffffffff
0000000145b7ea52  450f47c6               cmova r8d, r14d
0000000145b7ea56  488dbe600b0000         lea rdi, [rsi + 0xb60]
0000000145b7ea5d  4889f9                 mov rcx, rdi
0000000145b7ea60  66ba1600               mov dx, 0x16
0000000145b7ea64  e8e70df0ff             call 0x145a7f850
0000000145b7ea69  90                     nop
0000000145b7ea6a  0f28c6                 movaps xmm0, xmm6
0000000145b7ea6d  e887504200             call 0x145fa3af9
0000000145b7ea72  f34c0f2cc0             cvttss2si r8, xmm0
0000000145b7ea77  0f2ec7                 ucomiss xmm0, xmm7
0000000145b7ea7a  440f42c3               cmovb r8d, ebx
0000000145b7ea7e  0f2e052fe06000         ucomiss xmm0, dword ptr [rip + 0x60e02f]
0000000145b7ea85  450f47c6               cmova r8d, r14d
0000000145b7ea89  4889f9                 mov rcx, rdi
0000000145b7ea8c  66ba1c00               mov dx, 0x1c
0000000145b7ea90  e8bb0df0ff             call 0x145a7f850
0000000145b7ea95  90                     nop
0000000145b7ea96  f30f1086ac040000       movss xmm0, dword ptr [rsi + 0x4ac]
0000000145b7ea9e  f30f59052a4e5f00       mulss xmm0, dword ptr [rip + 0x5f4e2a]
0000000145b7eaa6  66410f7ec0             movd r8d, xmm0
0000000145b7eaab  4889f9                 mov rcx, rdi
0000000145b7eaae  66ba5504               mov dx, 0x455
0000000145b7eab2  e8990df0ff             call 0x145a7f850
0000000145b7eab7  90                     nop
0000000145b7eab8  488b5518               mov rdx, qword ptr [rbp + 0x18]
0000000145b7eabc  4885d2                 test rdx, rdx
0000000145b7eabf  7413                   je 0x145b7ead4
0000000145b7eac1  48c1e203               shl rdx, 3
0000000145b7eac5  41b804000000           mov r8d, 4
0000000145b7eacb  488b4df8               mov rcx, qword ptr [rbp - 8]
0000000145b7eacf  e8fc3648fa             call 0x1400021d0
0000000145b7ead4  0f28b5c0000000         movaps xmm6, xmmword ptr [rbp + 0xc0]
0000000145b7eadb  0f28bdd0000000         movaps xmm7, xmmword ptr [rbp + 0xd0]
0000000145b7eae2  440f2885e0000000       movaps xmm8, xmmword ptr [rbp + 0xe0]
0000000145b7eaea  440f288df0000000       movaps xmm9, xmmword ptr [rbp + 0xf0]
0000000145b7eaf2  440f289500010000       movaps xmm10, xmmword ptr [rbp + 0x100]
0000000145b7eafa  440f289d10010000       movaps xmm11, xmmword ptr [rbp + 0x110]
0000000145b7eb02  440f28a520010000       movaps xmm12, xmmword ptr [rbp + 0x120]
0000000145b7eb0a  440f28ad30010000       movaps xmm13, xmmword ptr [rbp + 0x130]
0000000145b7eb12  440f28b540010000       movaps xmm14, xmmword ptr [rbp + 0x140]
0000000145b7eb1a  440f28bd50010000       movaps xmm15, xmmword ptr [rbp + 0x150]
0000000145b7eb22  4881c4e8010000         add rsp, 0x1e8
0000000145b7eb29  5b                     pop rbx
0000000145b7eb2a  5f                     pop rdi
0000000145b7eb2b  5e                     pop rsi
0000000145b7eb2c  415c                   pop r12
0000000145b7eb2e  415d                   pop r13
0000000145b7eb30  415e                   pop r14
0000000145b7eb32  415f                   pop r15
0000000145b7eb34  5d                     pop rbp
0000000145b7eb35  c3                     ret
0000000145b7eb36  0f288d90000000         movaps xmm1, xmmword ptr [rbp + 0x90]
0000000145b7eb3d  f3410f58c9             addss xmm1, xmm9
0000000145b7eb42  0f298d90000000         movaps xmmword ptr [rbp + 0x90], xmm1
0000000145b7eb49  e9c2000000             jmp 0x145b7ec10
0000000145b7eb4e  f3410f58f9             addss xmm7, xmm9
0000000145b7eb53  e9b8000000             jmp 0x145b7ec10
0000000145b7eb58  f3450f58f1             addss xmm14, xmm9
0000000145b7eb5d  e9ae000000             jmp 0x145b7ec10
0000000145b7eb62  0f284d70               movaps xmm1, xmmword ptr [rbp + 0x70]
0000000145b7eb66  f3410f58c9             addss xmm1, xmm9
0000000145b7eb6b  0f294d70               movaps xmmword ptr [rbp + 0x70], xmm1
0000000145b7eb6f  e99c000000             jmp 0x145b7ec10
0000000145b7eb74  f3410f58e9             addss xmm5, xmm9
0000000145b7eb79  e992000000             jmp 0x145b7ec10
0000000145b7eb7e  f3450f58f1             addss xmm14, xmm9
0000000145b7eb83  f3440f590d447e6100     mulss xmm9, dword ptr [rip + 0x617e44]
0000000145b7eb8c  f3440f5d0d2faa6000     minss xmm9, dword ptr [rip + 0x60aa2f]
0000000145b7eb95  0f288d80000000         movaps xmm1, xmmword ptr [rbp + 0x80]
0000000145b7eb9c  f3410f58c9             addss xmm1, xmm9
0000000145b7eba1  0f298d80000000         movaps xmmword ptr [rbp + 0x80], xmm1
0000000145b7eba8  eb66                   jmp 0x145b7ec10
0000000145b7ebaa  f3410f58c1             addss xmm0, xmm9
0000000145b7ebaf  eb5f                   jmp 0x145b7ec10
0000000145b7ebb1  f3450f58c1             addss xmm8, xmm9
0000000145b7ebb6  eb58                   jmp 0x145b7ec10
0000000145b7ebb8  0f284d20               movaps xmm1, xmmword ptr [rbp + 0x20]
0000000145b7ebbc  f3410f58c9             addss xmm1, xmm9
0000000145b7ebc1  0f294d20               movaps xmmword ptr [rbp + 0x20], xmm1
0000000145b7ebc5  eb49                   jmp 0x145b7ec10
0000000145b7ebc7  0f288da0000000         movaps xmm1, xmmword ptr [rbp + 0xa0]
0000000145b7ebce  f3410f58c9             addss xmm1, xmm9
0000000145b7ebd3  0f298da0000000         movaps xmmword ptr [rbp + 0xa0], xmm1
0000000145b7ebda  eb34                   jmp 0x145b7ec10
0000000145b7ebdc  f3440f580dbb4c5f00     addss xmm9, dword ptr [rip + 0x5f4cbb]
0000000145b7ebe5  f3410f59d1             mulss xmm2, xmm9
0000000145b7ebea  eb24                   jmp 0x145b7ec10
0000000145b7ebec  f3450f58f9             addss xmm15, xmm9
0000000145b7ebf1  eb1d                   jmp 0x145b7ec10
0000000145b7ebf3  0f284d50               movaps xmm1, xmmword ptr [rbp + 0x50]
0000000145b7ebf7  f3410f58c9             addss xmm1, xmm9
0000000145b7ebfc  0f294d50               movaps xmmword ptr [rbp + 0x50], xmm1
0000000145b7ec00  eb0e                   jmp 0x145b7ec10
0000000145b7ec02  f3450f58e9             addss xmm13, xmm9
0000000145b7ec07  eb07                   jmp 0x145b7ec10
0000000145b7ec09  f3410f58f1             addss xmm6, xmm9
0000000145b7ec0e  6690                   nop
0000000145b7ec10  4983c118               add r9, 0x18
0000000145b7ec14  4d39c8                 cmp r8, r9
0000000145b7ec17  0f8409faffff           je 0x145b7e626
0000000145b7ec1d  f3460f104c0a10         movss xmm9, dword ptr [rdx + r9 + 0x10]
0000000145b7ec24  4e8b1c0a               mov r11, qword ptr [rdx + r9]
0000000145b7ec28  410fb67b44             movzx edi, byte ptr [r11 + 0x44]
0000000145b7ec2d  49633cba               movsxd rdi, dword ptr [r10 + rdi*4]
0000000145b7ec31  4c01d7                 add rdi, r10
0000000145b7ec34  ffe7                   jmp rdi
0000000145b7ec36  0f288d80000000         movaps xmm1, xmmword ptr [rbp + 0x80]
0000000145b7ec3d  450f28e0               movaps xmm12, xmm8
0000000145b7ec41  0f28e0                 movaps xmm4, xmm0
0000000145b7ec44  410f28c2               movaps xmm0, xmm10
0000000145b7ec48  450f28d5               movaps xmm10, xmm13
0000000145b7ec4c  440f28ee               movaps xmm13, xmm6
0000000145b7ec50  0f28f2                 movaps xmm6, xmm2
0000000145b7ec53  f3410f105340           movss xmm2, dword ptr [r11 + 0x40]
0000000145b7ec59  f30f59150fa66000       mulss xmm2, dword ptr [rip + 0x60a60f]
0000000145b7ec61  440f28c3               movaps xmm8, xmm3
0000000145b7ec65  410f28de               movaps xmm3, xmm14
0000000145b7ec69  450f28f1               movaps xmm14, xmm9
0000000145b7ec6d  f3440f5df2             minss xmm14, xmm2
0000000145b7ec72  450f28df               movaps xmm11, xmm15
0000000145b7ec76  440f28ff               movaps xmm15, xmm7
0000000145b7ec7a  410f28fe               movaps xmm7, xmm14
0000000145b7ec7e  f3410fc2fe03           cmpunordss xmm7, xmm14
0000000145b7ec84  0f28d7                 movaps xmm2, xmm7
0000000145b7ec87  410f55d6               andnps xmm2, xmm14
0000000145b7ec8b  440f28f3               movaps xmm14, xmm3
0000000145b7ec8f  410f28d8               movaps xmm3, xmm8
0000000145b7ec93  410f54f9               andps xmm7, xmm9
0000000145b7ec97  0f56fa                 orps xmm7, xmm2
0000000145b7ec9a  0f28d6                 movaps xmm2, xmm6
0000000145b7ec9d  410f28f5               movaps xmm6, xmm13
0000000145b7eca1  450f28ea               movaps xmm13, xmm10
0000000145b7eca5  440f28d0               movaps xmm10, xmm0
0000000145b7eca9  0f28c4                 movaps xmm0, xmm4
0000000145b7ecac  450f28c4               movaps xmm8, xmm12
0000000145b7ecb0  440f28e7               movaps xmm12, xmm7
0000000145b7ecb4  410f28ff               movaps xmm7, xmm15
0000000145b7ecb8  450f28fb               movaps xmm15, xmm11
0000000145b7ecbc  f3440f58e1             addss xmm12, xmm1
0000000145b7ecc1  440f29a580000000       movaps xmmword ptr [rbp + 0x80], xmm12
0000000145b7ecc9  f3440f590d164e5f00     mulss xmm9, dword ptr [rip + 0x5f4e16]
0000000145b7ecd2  f3450f58f1             addss xmm14, xmm9
0000000145b7ecd7  e934ffffff             jmp 0x145b7ec10
0000000145b7ecdc  f3450f58d1             addss xmm10, xmm9
0000000145b7ece1  e92affffff             jmp 0x145b7ec10
0000000145b7ece6  f3410f58d9             addss xmm3, xmm9
0000000145b7eceb  e920ffffff             jmp 0x145b7ec10
0000000145b7ecf0  4883c3f8               add rbx, -8
0000000145b7ecf4  7427                   je 0x145b7ed1d
0000000145b7ecf6  4883c208               add rdx, 8
0000000145b7ecfa  440fb64afc             movzx r9d, byte ptr [rdx - 4]
0000000145b7ecff  4f630c88               movsxd r9, dword ptr [r8 + r9*4]
0000000145b7ed03  4d01c1                 add r9, r8
0000000145b7ed06  41ffe1                 jmp r9
0000000145b7ed09  0f288d90000000         movaps xmm1, xmmword ptr [rbp + 0x90]
0000000145b7ed10  f30f580a               addss xmm1, dword ptr [rdx]
0000000145b7ed14  0f298d90000000         movaps xmmword ptr [rbp + 0x90], xmm1
0000000145b7ed1b  ebd3                   jmp 0x145b7ecf0
0000000145b7ed1d  f30f11656c             movss dword ptr [rbp + 0x6c], xmm4
0000000145b7ed22  410f28e3               movaps xmm4, xmm11
0000000145b7ed26  440f285d00             movaps xmm11, xmmword ptr [rbp]
0000000145b7ed2b  0f296de0               movaps xmmword ptr [rbp - 0x20], xmm5
0000000145b7ed2f  450f28ce               movaps xmm9, xmm14
0000000145b7ed33  440f28f7               movaps xmm14, xmm7
0000000145b7ed37  0f2955d0               movaps xmmword ptr [rbp - 0x30], xmm2
0000000145b7ed3b  440f297dc0             movaps xmmword ptr [rbp - 0x40], xmm15
0000000145b7ed40  0f286d70               movaps xmm5, xmmword ptr [rbp + 0x70]
0000000145b7ed44  0f2975b0               movaps xmmword ptr [rbp - 0x50], xmm6
0000000145b7ed48  e929f9ffff             jmp 0x145b7e676
0000000145b7ed4d  f30f5822               addss xmm4, dword ptr [rdx]
0000000145b7ed51  eb9d                   jmp 0x145b7ecf0
0000000145b7ed53  0f284d00               movaps xmm1, xmmword ptr [rbp]
0000000145b7ed57  f30f580a               addss xmm1, dword ptr [rdx]
0000000145b7ed5b  0f294d00               movaps xmmword ptr [rbp], xmm1
0000000145b7ed5f  eb8f                   jmp 0x145b7ecf0
0000000145b7ed61  f3440f582a             addss xmm13, dword ptr [rdx]
0000000145b7ed66  eb88                   jmp 0x145b7ecf0
0000000145b7ed68  0f288d80000000         movaps xmm1, xmmword ptr [rbp + 0x80]
0000000145b7ed6f  f30f580a               addss xmm1, dword ptr [rdx]
0000000145b7ed73  0f298d80000000         movaps xmmword ptr [rbp + 0x80], xmm1
0000000145b7ed7a  e971ffffff             jmp 0x145b7ecf0
0000000145b7ed7f  0f284d20               movaps xmm1, xmmword ptr [rbp + 0x20]
0000000145b7ed83  f30f580a               addss xmm1, dword ptr [rdx]
0000000145b7ed87  0f294d20               movaps xmmword ptr [rbp + 0x20], xmm1
0000000145b7ed8b  e960ffffff             jmp 0x145b7ecf0
0000000145b7ed90  f3440f583a             addss xmm15, dword ptr [rdx]
0000000145b7ed95  e956ffffff             jmp 0x145b7ecf0
0000000145b7ed9a  0f284d70               movaps xmm1, xmmword ptr [rbp + 0x70]
0000000145b7ed9e  f30f580a               addss xmm1, dword ptr [rdx]
0000000145b7eda2  0f294d70               movaps xmmword ptr [rbp + 0x70], xmm1
0000000145b7eda6  e945ffffff             jmp 0x145b7ecf0
0000000145b7edab  f30f581a               addss xmm3, dword ptr [rdx]
0000000145b7edaf  e93cffffff             jmp 0x145b7ecf0
0000000145b7edb4  f30f582a               addss xmm5, dword ptr [rdx]
0000000145b7edb8  e933ffffff             jmp 0x145b7ecf0
0000000145b7edbd  f3440f5802             addss xmm8, dword ptr [rdx]
0000000145b7edc2  e929ffffff             jmp 0x145b7ecf0
0000000145b7edc7  f30f583a               addss xmm7, dword ptr [rdx]
0000000145b7edcb  e920ffffff             jmp 0x145b7ecf0
0000000145b7edd0  f3440f5832             addss xmm14, dword ptr [rdx]
0000000145b7edd5  e916ffffff             jmp 0x145b7ecf0
0000000145b7edda  f3440f5822             addss xmm12, dword ptr [rdx]
0000000145b7eddf  e90cffffff             jmp 0x145b7ecf0
0000000145b7ede4  f30f5802               addss xmm0, dword ptr [rdx]
0000000145b7ede8  e903ffffff             jmp 0x145b7ecf0
0000000145b7eded  f30f5832               addss xmm6, dword ptr [rdx]
0000000145b7edf1  e9fafeffff             jmp 0x145b7ecf0
0000000145b7edf6  0f288da0000000         movaps xmm1, xmmword ptr [rbp + 0xa0]
0000000145b7edfd  f30f580a               addss xmm1, dword ptr [rdx]
0000000145b7ee01  0f298da0000000         movaps xmmword ptr [rbp + 0xa0], xmm1
0000000145b7ee08  e9e3feffff             jmp 0x145b7ecf0
0000000145b7ee0d  f3440f581a             addss xmm11, dword ptr [rdx]
0000000145b7ee12  e9d9feffff             jmp 0x145b7ecf0
0000000145b7ee17  0f284d50               movaps xmm1, xmmword ptr [rbp + 0x50]
0000000145b7ee1b  f30f580a               addss xmm1, dword ptr [rdx]
0000000145b7ee1f  0f294d50               movaps xmmword ptr [rbp + 0x50], xmm1
0000000145b7ee23  e9c8feffff             jmp 0x145b7ecf0
0000000145b7ee28  0f28ca                 movaps xmm1, xmm2
0000000145b7ee2b  f30f1012               movss xmm2, dword ptr [rdx]
0000000145b7ee2f  f30f5815694a5f00       addss xmm2, dword ptr [rip + 0x5f4a69]
0000000145b7ee37  f30f59d1               mulss xmm2, xmm1
0000000145b7ee3b  e9b0feffff             jmp 0x145b7ecf0
