0000000145c13e00  55                     push rbp
0000000145c13e01  4157                   push r15
0000000145c13e03  4156                   push r14
0000000145c13e05  4155                   push r13
0000000145c13e07  4154                   push r12
0000000145c13e09  56                     push rsi
0000000145c13e0a  57                     push rdi
0000000145c13e0b  53                     push rbx
0000000145c13e0c  4881ec08010000         sub rsp, 0x108
0000000145c13e13  488dac2480000000       lea rbp, [rsp + 0x80]
0000000145c13e1b  48c78580000000feffffff mov qword ptr [rbp + 0x80], 0xfffffffffffffffe
0000000145c13e26  4889cb                 mov rbx, rcx
0000000145c13e29  498b00                 mov rax, qword ptr [r8]
0000000145c13e2c  48894518               mov qword ptr [rbp + 0x18], rax
0000000145c13e30  498b4808               mov rcx, qword ptr [r8 + 8]
0000000145c13e34  4839d3                 cmp rbx, rdx
0000000145c13e37  0f845c030000           je 0x145c14199
0000000145c13e3d  498b4010               mov rax, qword ptr [r8 + 0x10]
0000000145c13e41  488945e0               mov qword ptr [rbp - 0x20], rax
0000000145c13e45  4829da                 sub rdx, rbx
0000000145c13e48  48c1ea03               shr rdx, 3
0000000145c13e4c  48b8b76ddbb66ddbb66d   movabs rax, 0x6db6db6db6db6db7
0000000145c13e56  480fafc2               imul rax, rdx
0000000145c13e5a  488945e8               mov qword ptr [rbp - 0x18], rax
0000000145c13e5e  4531e4                 xor r12d, r12d
0000000145c13e61  4c8d6d20               lea r13, [rbp + 0x20]
0000000145c13e65  4c8d3d54e23efa         lea r15, [rip - 0x5c11dac]
0000000145c13e6c  488d7550               lea rsi, [rbp + 0x50]
0000000145c13e70  4c8d75a0               lea r14, [rbp - 0x60]
0000000145c13e74  48895dd8               mov qword ptr [rbp - 0x28], rbx
0000000145c13e78  eb67                   jmp 0x145c13ee1
0000000145c13e7a  660f1f440000           nop word ptr [rax + rax]
0000000145c13e80  0f1045a0               movups xmm0, xmmword ptr [rbp - 0x60]
0000000145c13e84  0f104db0               movups xmm1, xmmword ptr [rbp - 0x50]
0000000145c13e88  0f1055c0               movups xmm2, xmmword ptr [rbp - 0x40]
0000000145c13e8c  0f294520               movaps xmmword ptr [rbp + 0x20], xmm0
0000000145c13e90  0f294d30               movaps xmmword ptr [rbp + 0x30], xmm1
0000000145c13e94  0f295540               movaps xmmword ptr [rbp + 0x40], xmm2
0000000145c13e98  488b4d10               mov rcx, qword ptr [rbp + 0x10]
0000000145c13e9c  488d0449               lea rax, [rcx + rcx*2]
0000000145c13ea0  48c1e004               shl rax, 4
0000000145c13ea4  488b55e0               mov rdx, qword ptr [rbp - 0x20]
0000000145c13ea8  0f11540220             movups xmmword ptr [rdx + rax + 0x20], xmm2
0000000145c13ead  0f114c0210             movups xmmword ptr [rdx + rax + 0x10], xmm1
0000000145c13eb2  0f110402               movups xmmword ptr [rdx + rax], xmm0
0000000145c13eb6  48ffc1                 inc rcx
0000000145c13eb9  4c8b6570               mov r12, qword ptr [rbp + 0x70]
0000000145c13ebd  49ffc4                 inc r12
0000000145c13ec0  4c3b65e8               cmp r12, qword ptr [rbp - 0x18]
0000000145c13ec4  488b5dd8               mov rbx, qword ptr [rbp - 0x28]
0000000145c13ec8  4c8d6d20               lea r13, [rbp + 0x20]
0000000145c13ecc  4c8d3dede13efa         lea r15, [rip - 0x5c11e13]
0000000145c13ed3  488d7550               lea rsi, [rbp + 0x50]
0000000145c13ed7  4c8d75a0               lea r14, [rbp - 0x60]
0000000145c13edb  0f84b8020000           je 0x145c14199
0000000145c13ee1  48894d10               mov qword ptr [rbp + 0x10], rcx
0000000145c13ee5  496bfc38               imul rdi, r12, 0x38
0000000145c13ee9  488b543b20             mov rdx, qword ptr [rbx + rdi + 0x20]
0000000145c13eee  4c8b443b28             mov r8, qword ptr [rbx + rdi + 0x28]
0000000145c13ef3  4c89e9                 mov rcx, r13
0000000145c13ef6  e8d572f1ff             call 0x145b2b1d0
0000000145c13efb  90                     nop
0000000145c13efc  4801df                 add rdi, rbx
0000000145c13eff  837d2001               cmp dword ptr [rbp + 0x20], 1
0000000145c13f03  0f85b7000000           jne 0x145c13fc0
0000000145c13f09  488d4d28               lea rcx, [rbp + 0x28]
0000000145c13f0d  488b4110               mov rax, qword ptr [rcx + 0x10]
0000000145c13f11  48894500               mov qword ptr [rbp], rax
0000000145c13f15  0f1001                 movups xmm0, xmmword ptr [rcx]
0000000145c13f18  0f2945f0               movaps xmmword ptr [rbp - 0x10], xmm0
0000000145c13f1c  48897da0               mov qword ptr [rbp - 0x60], rdi
0000000145c13f20  4c897da8               mov qword ptr [rbp - 0x58], r15
0000000145c13f24  488d45f0               lea rax, [rbp - 0x10]
0000000145c13f28  488945b0               mov qword ptr [rbp - 0x50], rax
0000000145c13f2c  488d05ade13efa         lea rax, [rip - 0x5c11e53]
0000000145c13f33  488945b8               mov qword ptr [rbp - 0x48], rax
0000000145c13f37  4889f1                 mov rcx, rsi
0000000145c13f3a  488d153f319d01         lea rdx, [rip + 0x19d313f]
0000000145c13f41  4d89f0                 mov r8, r14
0000000145c13f44  e8e72f3500             call 0x145f66f30
0000000145c13f49  90                     nop
0000000145c13f4a  488b4550               mov rax, qword ptr [rbp + 0x50]
0000000145c13f4e  48894570               mov qword ptr [rbp + 0x70], rax
0000000145c13f52  488b4d58               mov rcx, qword ptr [rbp + 0x58]
0000000145c13f56  488b4560               mov rax, qword ptr [rbp + 0x60]
0000000145c13f5a  48894d68               mov qword ptr [rbp + 0x68], rcx
0000000145c13f5e  48894d50               mov qword ptr [rbp + 0x50], rcx
0000000145c13f62  48894558               mov qword ptr [rbp + 0x58], rax
0000000145c13f66  488975a0               mov qword ptr [rbp - 0x60], rsi
0000000145c13f6a  4c897da8               mov qword ptr [rbp - 0x58], r15
0000000145c13f6e  488d0dd3a06c01         lea rcx, [rip + 0x16ca0d3]
0000000145c13f75  4c89f2                 mov rdx, r14
0000000145c13f78  e873c43300             call 0x145f503f0
0000000145c13f7d  90                     nop
0000000145c13f7e  488b5570               mov rdx, qword ptr [rbp + 0x70]
0000000145c13f82  4885d2                 test rdx, rdx
0000000145c13f85  740f                   je 0x145c13f96
0000000145c13f87  41b801000000           mov r8d, 1
0000000145c13f8d  488b4d68               mov rcx, qword ptr [rbp + 0x68]
0000000145c13f91  e83ae23efa             call 0x1400021d0
0000000145c13f96  488b55f0               mov rdx, qword ptr [rbp - 0x10]
0000000145c13f9a  4885d2                 test rdx, rdx
0000000145c13f9d  740f                   je 0x145c13fae
0000000145c13f9f  488b4df8               mov rcx, qword ptr [rbp - 8]
0000000145c13fa3  41b801000000           mov r8d, 1
0000000145c13fa9  e822e23efa             call 0x1400021d0
0000000145c13fae  b808000000             mov eax, 8
0000000145c13fb3  31d2                   xor edx, edx
0000000145c13fb5  31c9                   xor ecx, ecx
0000000145c13fb7  eb13                   jmp 0x145c13fcc
0000000145c13fb9  0f1f8000000000         nop dword ptr [rax]
0000000145c13fc0  488b4d28               mov rcx, qword ptr [rbp + 0x28]
0000000145c13fc4  488b4530               mov rax, qword ptr [rbp + 0x30]
0000000145c13fc8  488b5538               mov rdx, qword ptr [rbp + 0x38]
0000000145c13fcc  488d1452               lea rdx, [rdx + rdx*2]
0000000145c13fd0  48c1e204               shl rdx, 4
0000000145c13fd4  4801c2                 add rdx, rax
0000000145c13fd7  48894520               mov qword ptr [rbp + 0x20], rax
0000000145c13fdb  48894528               mov qword ptr [rbp + 0x28], rax
0000000145c13fdf  48894d30               mov qword ptr [rbp + 0x30], rcx
0000000145c13fe3  48895538               mov qword ptr [rbp + 0x38], rdx
0000000145c13fe7  4c89f1                 mov rcx, r14
0000000145c13fea  4c89ea                 mov rdx, r13
0000000145c13fed  e8ae37e9ff             call 0x145aa77a0
0000000145c13ff2  90                     nop
0000000145c13ff3  4c896570               mov qword ptr [rbp + 0x70], r12
0000000145c13ff7  488b17                 mov rdx, qword ptr [rdi]
0000000145c13ffa  4c8b4708               mov r8, qword ptr [rdi + 8]
0000000145c13ffe  4c89e9                 mov rcx, r13
0000000145c14001  e84a4ef1ff             call 0x145b28e50
0000000145c14006  90                     nop
0000000145c14007  488b4520               mov rax, qword ptr [rbp + 0x20]
0000000145c1400b  4c8b6d28               mov r13, qword ptr [rbp + 0x28]
0000000145c1400f  488b4d30               mov rcx, qword ptr [rbp + 0x30]
0000000145c14013  4c8d3c49               lea r15, [rcx + rcx*2]
0000000145c14017  49c1e704               shl r15, 4
0000000145c1401b  4d01ef                 add r15, r13
0000000145c1401e  4c896d20               mov qword ptr [rbp + 0x20], r13
0000000145c14022  4c896d28               mov qword ptr [rbp + 0x28], r13
0000000145c14026  48894568               mov qword ptr [rbp + 0x68], rax
0000000145c1402a  48894530               mov qword ptr [rbp + 0x30], rax
0000000145c1402e  4c897d38               mov qword ptr [rbp + 0x38], r15
0000000145c14032  4c89e8                 mov rax, r13
0000000145c14035  4c896dd0               mov qword ptr [rbp - 0x30], r13
0000000145c14039  4885c9                 test rcx, rcx
0000000145c1403c  0f84be000000           je 0x145c14100
0000000145c14042  66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145c14050  4c8d6830               lea r13, [rax + 0x30]
0000000145c14054  4c896d28               mov qword ptr [rbp + 0x28], r13
0000000145c14058  4c8b00                 mov r8, qword ptr [rax]
0000000145c1405b  4983f8ff               cmp r8, -1
0000000145c1405f  0f849b000000           je 0x145c14100
0000000145c14065  0f104008               movups xmm0, xmmword ptr [rax + 8]
0000000145c14069  488d5558               lea rdx, [rbp + 0x58]
0000000145c1406d  0f1102                 movups xmmword ptr [rdx], xmm0
0000000145c14070  488b7818               mov rdi, qword ptr [rax + 0x18]
0000000145c14074  488b4820               mov rcx, qword ptr [rax + 0x20]
0000000145c14078  488b5828               mov rbx, qword ptr [rax + 0x28]
0000000145c1407c  4c894550               mov qword ptr [rbp + 0x50], r8
0000000145c14080  4839df                 cmp rdi, rbx
0000000145c14083  762b                   jbe 0x145c140b0
0000000145c14085  4885db                 test rbx, rbx
0000000145c14088  742b                   je 0x145c140b5
0000000145c1408a  41b801000000           mov r8d, 1
0000000145c14090  4889fa                 mov rdx, rdi
0000000145c14093  4889ce                 mov rsi, rcx
0000000145c14096  4989d9                 mov r9, rbx
0000000145c14099  e842e13efa             call 0x1400021e0
0000000145c1409e  4989c4                 mov r12, rax
0000000145c140a1  4885c0                 test rax, rax
0000000145c140a4  752a                   jne 0x145c140d0
0000000145c140a6  e909010000             jmp 0x145c141b4
0000000145c140ab  0f1f440000             nop dword ptr [rax + rax]
0000000145c140b0  4989cc                 mov r12, rcx
0000000145c140b3  eb1b                   jmp 0x145c140d0
0000000145c140b5  41bc01000000           mov r12d, 1
0000000145c140bb  41b801000000           mov r8d, 1
0000000145c140c1  4889fa                 mov rdx, rdi
0000000145c140c4  e807e13efa             call 0x1400021d0
0000000145c140c9  0f1f8000000000         nop dword ptr [rax]
0000000145c140d0  c6457f00               mov byte ptr [rbp + 0x7f], 0
0000000145c140d4  4c89f1                 mov rcx, r14
0000000145c140d7  488d5550               lea rdx, [rbp + 0x50]
0000000145c140db  4d89e0                 mov r8, r12
0000000145c140de  4989d9                 mov r9, rbx
0000000145c140e1  e8ea7ef3ff             call 0x145b4bfd0
0000000145c140e6  90                     nop
0000000145c140e7  4c89e8                 mov rax, r13
0000000145c140ea  4d39fd                 cmp r13, r15
0000000145c140ed  0f855dffffff           jne 0x145c14050
0000000145c140f3  eb7b                   jmp 0x145c14170
0000000145c140f5  66662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145c14100  4c89f8                 mov rax, r15
0000000145c14103  4c29e8                 sub rax, r13
0000000145c14106  48b9abaaaaaaaaaaaaaa   movabs rcx, 0xaaaaaaaaaaaaaaab
0000000145c14110  48f7e1                 mul rcx
0000000145c14113  4d39ef                 cmp r15, r13
0000000145c14116  7458                   je 0x145c14170
0000000145c14118  4889d3                 mov rbx, rdx
0000000145c1411b  48c1eb05               shr rbx, 5
0000000145c1411f  4983c520               add r13, 0x20
0000000145c14123  eb14                   jmp 0x145c14139
0000000145c14125  66662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145c14130  4983c530               add r13, 0x30
0000000145c14134  48ffcb                 dec rbx
0000000145c14137  7437                   je 0x145c14170
0000000145c14139  498b55e0               mov rdx, qword ptr [r13 - 0x20]
0000000145c1413d  4885d2                 test rdx, rdx
0000000145c14140  740f                   je 0x145c14151
0000000145c14142  498b4de8               mov rcx, qword ptr [r13 - 0x18]
0000000145c14146  41b801000000           mov r8d, 1
0000000145c1414c  e87fe03efa             call 0x1400021d0
0000000145c14151  498b55f8               mov rdx, qword ptr [r13 - 8]
0000000145c14155  4885d2                 test rdx, rdx
0000000145c14158  74d6                   je 0x145c14130
0000000145c1415a  498b4d00               mov rcx, qword ptr [r13]
0000000145c1415e  41b801000000           mov r8d, 1
0000000145c14164  e867e03efa             call 0x1400021d0
0000000145c14169  ebc5                   jmp 0x145c14130
0000000145c1416b  0f1f440000             nop dword ptr [rax + rax]
0000000145c14170  488b4568               mov rax, qword ptr [rbp + 0x68]
0000000145c14174  4885c0                 test rax, rax
0000000145c14177  0f8403fdffff           je 0x145c13e80
0000000145c1417d  48c1e004               shl rax, 4
0000000145c14181  488d1440               lea rdx, [rax + rax*2]
0000000145c14185  41b808000000           mov r8d, 8
0000000145c1418b  488b4dd0               mov rcx, qword ptr [rbp - 0x30]
0000000145c1418f  e83ce03efa             call 0x1400021d0
0000000145c14194  e9e7fcffff             jmp 0x145c13e80
0000000145c14199  488b4518               mov rax, qword ptr [rbp + 0x18]
0000000145c1419d  488908                 mov qword ptr [rax], rcx
0000000145c141a0  4881c408010000         add rsp, 0x108
0000000145c141a7  5b                     pop rbx
0000000145c141a8  5f                     pop rdi
0000000145c141a9  5e                     pop rsi
0000000145c141aa  415c                   pop r12
0000000145c141ac  415d                   pop r13
0000000145c141ae  415e                   pop r14
0000000145c141b0  415f                   pop r15
0000000145c141b2  5d                     pop rbp
0000000145c141b3  c3                     ret
0000000145c141b4  48897568               mov qword ptr [rbp + 0x68], rsi
0000000145c141b8  48897d70               mov qword ptr [rbp + 0x70], rdi
0000000145c141bc  b901000000             mov ecx, 1
0000000145c141c1  4889da                 mov rdx, rbx
0000000145c141c4  e8f26f5200             call 0x14613b1bb
0000000145c141c9  90                     nop
0000000145c141ca  0f0b                   ud2
