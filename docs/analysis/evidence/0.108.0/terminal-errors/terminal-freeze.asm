000000014591da20  55                       push rbp
000000014591da21  4157                     push r15
000000014591da23  4156                     push r14
000000014591da25  4155                     push r13
000000014591da27  4154                     push r12
000000014591da29  56                       push rsi
000000014591da2a  57                       push rdi
000000014591da2b  53                       push rbx
000000014591da2c  4881ec58010000           sub rsp, 0x158
000000014591da33  488dac2480000000         lea rbp, [rsp + 0x80]
000000014591da3b  440f29b5c0000000         movaps xmmword ptr [rbp + 0xc0], xmm14
000000014591da43  440f29adb0000000         movaps xmmword ptr [rbp + 0xb0], xmm13
000000014591da4b  440f29a5a0000000         movaps xmmword ptr [rbp + 0xa0], xmm12
000000014591da53  440f299d90000000         movaps xmmword ptr [rbp + 0x90], xmm11
000000014591da5b  440f299580000000         movaps xmmword ptr [rbp + 0x80], xmm10
000000014591da63  440f294d70               movaps xmmword ptr [rbp + 0x70], xmm9
000000014591da68  440f294560               movaps xmmword ptr [rbp + 0x60], xmm8
000000014591da6d  0f297d50                 movaps xmmword ptr [rbp + 0x50], xmm7
000000014591da71  0f297540                 movaps xmmword ptr [rbp + 0x40], xmm6
000000014591da75  48c74538feffffff         mov qword ptr [rbp + 0x38], 0xfffffffffffffffe
000000014591da7d  4889ce                   mov rsi, rcx
000000014591da80  f3440f1089340a0000       movss xmm9, dword ptr [rcx + 0xa34]
000000014591da89  f3440f1091340a0000       movss xmm10, dword ptr [rcx + 0xa34]
000000014591da92  48c745e800000000         mov qword ptr [rbp - 0x18], 0
000000014591da9a  48c745f008000000         mov qword ptr [rbp - 0x10], 8
000000014591daa2  48c745f800000000         mov qword ptr [rbp - 8], 0
000000014591daaa  488b9960050000           mov rbx, qword ptr [rcx + 0x560]
000000014591dab1  48698168050000d8010000   imul rax, qword ptr [rcx + 0x568], 0x1d8
000000014591dabc  4801d8                   add rax, rbx
000000014591dabf  4531f6                   xor r14d, r14d
000000014591dac2  450f57db                 xorps xmm11, xmm11
000000014591dac6  f3440f1005419b4700       movss xmm8, dword ptr [rip + 0x479b41]
000000014591dacf  488d7de8                 lea rdi, [rbp - 0x18]
000000014591dad3  488945b0                 mov qword ptr [rbp - 0x50], rax
000000014591dad7  660f1f840000000000       nop word ptr [rax + rax]
000000014591dae0  4881c3d8010000           add rbx, 0x1d8
000000014591dae7  488d8b28feffff           lea rcx, [rbx - 0x1d8]
000000014591daee  4839c1                   cmp rcx, rax
000000014591daf1  0f84f4000000             je 0x14591dbeb
000000014591daf7  83b9b000000000           cmp dword ptr [rcx + 0xb0], 0
000000014591dafe  75e0                     jne 0x14591dae0
000000014591db00  f30f1043b8               movss xmm0, dword ptr [rbx - 0x48]
000000014591db05  410f2ec3                 ucomiss xmm0, xmm11
000000014591db09  76d5                     jbe 0x14591dae0
000000014591db0b  f30f104bb4               movss xmm1, dword ptr [rbx - 0x4c]
000000014591db10  0f28d0                   movaps xmm2, xmm0
000000014591db13  f30f58d1                 addss xmm2, xmm1
000000014591db17  410f2ed1                 ucomiss xmm2, xmm9
000000014591db1b  76c3                     jbe 0x14591dae0
000000014591db1d  48894da8                 mov qword ptr [rbp - 0x58], rcx
000000014591db21  488b8e98090000           mov rcx, qword ptr [rsi + 0x998]
000000014591db28  410f28d1                 movaps xmm2, xmm9
000000014591db2c  f30f5cd1                 subss xmm2, xmm1
000000014591db30  f30f5ed0                 divss xmm2, xmm0
000000014591db34  0f57c0                   xorps xmm0, xmm0
000000014591db37  f30f5fc2                 maxss xmm0, xmm2
000000014591db3b  450f28e0                 movaps xmm12, xmm8
000000014591db3f  f3440f5de0               minss xmm12, xmm0
000000014591db44  f20f10439c               movsd xmm0, qword ptr [rbx - 0x64]
000000014591db49  f20f104ba8               movsd xmm1, qword ptr [rbx - 0x58]
000000014591db4e  0f5cc8                   subps xmm1, xmm0
000000014591db51  f3410f12f4               movsldup xmm6, xmm12
000000014591db56  0f59f1                   mulps xmm6, xmm1
000000014591db59  0f58f0                   addps xmm6, xmm0
000000014591db5c  f30f16d6                 movshdup xmm2, xmm6
000000014591db60  f3440f106ba4             movss xmm13, dword ptr [rbx - 0x5c]
000000014591db66  f3440f1073b0             movss xmm14, dword ptr [rbx - 0x50]
000000014591db6c  4883c110                 add rcx, 0x10
000000014591db70  0f28ce                   movaps xmm1, xmm6
000000014591db73  e8a826fbff               call 0x1458d0220
000000014591db78  90                       nop
000000014591db79  0f28f8                   movaps xmm7, xmm0
000000014591db7c  a801                     test al, 1
000000014591db7e  7513                     jne 0x14591db93
000000014591db80  f3450f5cf5               subss xmm14, xmm13
000000014591db85  f3450f59e6               mulss xmm12, xmm14
000000014591db8a  f3450f58e5               addss xmm12, xmm13
000000014591db8f  410f28fc                 movaps xmm7, xmm12
000000014591db93  0f13739c                 movlps qword ptr [rbx - 0x64], xmm6
000000014591db97  f30f117ba4               movss dword ptr [rbx - 0x5c], xmm7
000000014591db9c  0f1373a8                 movlps qword ptr [rbx - 0x58], xmm6
000000014591dba0  f30f117bb0               movss dword ptr [rbx - 0x50], xmm7
000000014591dba5  440f1353b4               movlps qword ptr [rbx - 0x4c], xmm10
000000014591dbaa  4c8bbb18ffffff           mov r15, qword ptr [rbx - 0xe8]
000000014591dbb1  4c8b75f8                 mov r14, qword ptr [rbp - 8]
000000014591dbb5  4c3b75e8                 cmp r14, qword ptr [rbp - 0x18]
000000014591dbb9  7509                     jne 0x14591dbc4
000000014591dbbb  4889f9                   mov rcx, rdi
000000014591dbbe  e8ed702d00               call 0x145bf4cb0
000000014591dbc3  90                       nop
000000014591dbc4  488b45f0                 mov rax, qword ptr [rbp - 0x10]
000000014591dbc8  4b8d0c76                 lea rcx, [r14 + r14*2]
000000014591dbcc  4c893cc8                 mov qword ptr [rax + rcx*8], r15
000000014591dbd0  0f1374c808               movlps qword ptr [rax + rcx*8 + 8], xmm6
000000014591dbd5  f30f117cc810             movss dword ptr [rax + rcx*8 + 0x10], xmm7
000000014591dbdb  49ffc6                   inc r14
000000014591dbde  4c8975f8                 mov qword ptr [rbp - 8], r14
000000014591dbe2  488b45b0                 mov rax, qword ptr [rbp - 0x50]
000000014591dbe6  e9f5feffff               jmp 0x14591dae0
000000014591dbeb  48894da8                 mov qword ptr [rbp - 0x58], rcx
000000014591dbef  488b45e8                 mov rax, qword ptr [rbp - 0x18]
000000014591dbf3  48894530                 mov qword ptr [rbp + 0x30], rax
000000014591dbf7  4c8b65f0                 mov r12, qword ptr [rbp - 0x10]
000000014591dbfb  4b8d0476                 lea rax, [r14 + r14*2]
000000014591dbff  4d8d3cc4                 lea r15, [r12 + rax*8]
000000014591dc03  488dbe18060000           lea rdi, [rsi + 0x618]
000000014591dc0a  488d5db8                 lea rbx, [rbp - 0x48]
000000014591dc0e  4c8d7510                 lea r14, [rbp + 0x10]
000000014591dc12  4c896528                 mov qword ptr [rbp + 0x28], r12
000000014591dc16  eb35                     jmp 0x14591dc4d
000000014591dc18  0f1f840000000000         nop dword ptr [rax + rax]
000000014591dc20  4983c418                 add r12, 0x18
000000014591dc24  488b8620060000           mov rax, qword ptr [rsi + 0x620]
000000014591dc2b  4c89e9                   mov rcx, r13
000000014591dc2e  48c1e105                 shl rcx, 5
000000014591dc32  0f1045b8                 movups xmm0, xmmword ptr [rbp - 0x48]
000000014591dc36  0f104dc8                 movups xmm1, xmmword ptr [rbp - 0x38]
000000014591dc3a  0f114c0810               movups xmmword ptr [rax + rcx + 0x10], xmm1
000000014591dc3f  0f110408                 movups xmmword ptr [rax + rcx], xmm0
000000014591dc43  49ffc5                   inc r13
000000014591dc46  4c89ae28060000           mov qword ptr [rsi + 0x628], r13
000000014591dc4d  4d39fc                   cmp r12, r15
000000014591dc50  744d                     je 0x14591dc9f
000000014591dc52  498b1424                 mov rdx, qword ptr [r12]
000000014591dc56  418b442410               mov eax, dword ptr [r12 + 0x10]
000000014591dc5b  894518                   mov dword ptr [rbp + 0x18], eax
000000014591dc5e  498b442408               mov rax, qword ptr [r12 + 8]
000000014591dc63  48894510                 mov qword ptr [rbp + 0x10], rax
000000014591dc67  448b8e640a0000           mov r9d, dword ptr [rsi + 0xa64]
000000014591dc6e  41ffc1                   inc r9d
000000014591dc71  44898e640a0000           mov dword ptr [rsi + 0xa64], r9d
000000014591dc78  4889d9                   mov rcx, rbx
000000014591dc7b  4d89f0                   mov r8, r14
000000014591dc7e  e84d21faff               call 0x1458bfdd0
000000014591dc83  90                       nop
000000014591dc84  4c8bae28060000           mov r13, qword ptr [rsi + 0x628]
000000014591dc8b  4c3bae18060000           cmp r13, qword ptr [rsi + 0x618]
000000014591dc92  758c                     jne 0x14591dc20
000000014591dc94  4889f9                   mov rcx, rdi
000000014591dc97  e844722d00               call 0x145bf4ee0
000000014591dc9c  90                       nop
000000014591dc9d  eb81                     jmp 0x14591dc20
000000014591dc9f  488b4530                 mov rax, qword ptr [rbp + 0x30]
000000014591dca3  4885c0                   test rax, rax
000000014591dca6  7417                     je 0x14591dcbf
000000014591dca8  48c1e003                 shl rax, 3
000000014591dcac  488d1440                 lea rdx, [rax + rax*2]
000000014591dcb0  41b808000000             mov r8d, 8
000000014591dcb6  488b4d28                 mov rcx, qword ptr [rbp + 0x28]
000000014591dcba  e811456efa               call 0x1400021d0
000000014591dcbf  f3440f108e340a0000       movss xmm9, dword ptr [rsi + 0xa34]
000000014591dcc8  f3440f1096340a0000       movss xmm10, dword ptr [rsi + 0xa34]
000000014591dcd1  48c7451000000000         mov qword ptr [rbp + 0x10], 0
000000014591dcd9  48c7451808000000         mov qword ptr [rbp + 0x18], 8
000000014591dce1  48c7452000000000         mov qword ptr [rbp + 0x20], 0
000000014591dce9  4c8bbed0000000           mov r15, qword ptr [rsi + 0xd0]
000000014591dcf0  486b86d800000078         imul rax, qword ptr [rsi + 0xd8], 0x78
000000014591dcf8  4c01f8                   add rax, r15
000000014591dcfb  488b9e98090000           mov rbx, qword ptr [rsi + 0x998]
000000014591dd02  4883c310                 add rbx, 0x10
000000014591dd06  4531e4                   xor r12d, r12d
000000014591dd09  450f57db                 xorps xmm11, xmm11
000000014591dd0d  4c8d7510                 lea r14, [rbp + 0x10]
000000014591dd11  48894500                 mov qword ptr [rbp], rax
000000014591dd15  66662e0f1f840000000000   nop word ptr cs:[rax + rax]
000000014591dd20  4983c778                 add r15, 0x78
000000014591dd24  498d4f88                 lea rcx, [r15 - 0x78]
000000014591dd28  4839c1                   cmp rcx, rax
000000014591dd2b  0f84ed000000             je 0x14591de1e
000000014591dd31  f30f10415c               movss xmm0, dword ptr [rcx + 0x5c]
000000014591dd36  410f2ec3                 ucomiss xmm0, xmm11
000000014591dd3a  76e4                     jbe 0x14591dd20
000000014591dd3c  f3410f104fe0             movss xmm1, dword ptr [r15 - 0x20]
000000014591dd42  0f28d0                   movaps xmm2, xmm0
000000014591dd45  f30f58d1                 addss xmm2, xmm1
000000014591dd49  410f2ed1                 ucomiss xmm2, xmm9
000000014591dd4d  76d1                     jbe 0x14591dd20
000000014591dd4f  48894d08                 mov qword ptr [rbp + 8], rcx
000000014591dd53  410f28d1                 movaps xmm2, xmm9
000000014591dd57  f30f5cd1                 subss xmm2, xmm1
000000014591dd5b  f30f5ed0                 divss xmm2, xmm0
000000014591dd5f  0f57c0                   xorps xmm0, xmm0
000000014591dd62  f30f5fc2                 maxss xmm0, xmm2
000000014591dd66  450f28e0                 movaps xmm12, xmm8
000000014591dd6a  f3440f5de0               minss xmm12, xmm0
000000014591dd6f  f2410f1047c8             movsd xmm0, qword ptr [r15 - 0x38]
000000014591dd75  f2410f104fd4             movsd xmm1, qword ptr [r15 - 0x2c]
000000014591dd7b  0f5cc8                   subps xmm1, xmm0
000000014591dd7e  f3410f12f4               movsldup xmm6, xmm12
000000014591dd83  0f59f1                   mulps xmm6, xmm1
000000014591dd86  0f58f0                   addps xmm6, xmm0
000000014591dd89  f30f16d6                 movshdup xmm2, xmm6
000000014591dd8d  f3450f106fd0             movss xmm13, dword ptr [r15 - 0x30]
000000014591dd93  f3450f1077dc             movss xmm14, dword ptr [r15 - 0x24]
000000014591dd99  4889d9                   mov rcx, rbx
000000014591dd9c  0f28ce                   movaps xmm1, xmm6
000000014591dd9f  e87c24fbff               call 0x1458d0220
000000014591dda4  90                       nop
000000014591dda5  0f28f8                   movaps xmm7, xmm0
000000014591dda8  a801                     test al, 1
000000014591ddaa  7513                     jne 0x14591ddbf
000000014591ddac  f3450f5cf5               subss xmm14, xmm13
000000014591ddb1  f3450f59e6               mulss xmm12, xmm14
000000014591ddb6  f3450f58e5               addss xmm12, xmm13
000000014591ddbb  410f28fc                 movaps xmm7, xmm12
000000014591ddbf  410f1377c8               movlps qword ptr [r15 - 0x38], xmm6
000000014591ddc4  f3410f117fd0             movss dword ptr [r15 - 0x30], xmm7
000000014591ddca  410f1377d4               movlps qword ptr [r15 - 0x2c], xmm6
000000014591ddcf  f3410f117fdc             movss dword ptr [r15 - 0x24], xmm7
000000014591ddd5  450f1357e0               movlps qword ptr [r15 - 0x20], xmm10
000000014591ddda  f3450f114fec             movss dword ptr [r15 - 0x14], xmm9
000000014591dde0  4d8b6fa8                 mov r13, qword ptr [r15 - 0x58]
000000014591dde4  4c8b6520                 mov r12, qword ptr [rbp + 0x20]
000000014591dde8  4c3b6510                 cmp r12, qword ptr [rbp + 0x10]
000000014591ddec  7509                     jne 0x14591ddf7
000000014591ddee  4c89f1                   mov rcx, r14
000000014591ddf1  e8ba6e2d00               call 0x145bf4cb0
000000014591ddf6  90                       nop
000000014591ddf7  488b4518                 mov rax, qword ptr [rbp + 0x18]
000000014591ddfb  4b8d0c64                 lea rcx, [r12 + r12*2]
000000014591ddff  4c892cc8                 mov qword ptr [rax + rcx*8], r13
000000014591de03  0f1374c808               movlps qword ptr [rax + rcx*8 + 8], xmm6
000000014591de08  f30f117cc810             movss dword ptr [rax + rcx*8 + 0x10], xmm7
000000014591de0e  49ffc4                   inc r12
000000014591de11  4c896520                 mov qword ptr [rbp + 0x20], r12
000000014591de15  488b4500                 mov rax, qword ptr [rbp]
000000014591de19  e902ffffff               jmp 0x14591dd20
000000014591de1e  488b4510                 mov rax, qword ptr [rbp + 0x10]
000000014591de22  48894530                 mov qword ptr [rbp + 0x30], rax
000000014591de26  488b5518                 mov rdx, qword ptr [rbp + 0x18]
000000014591de2a  4b8d0464                 lea rax, [r12 + r12*2]
000000014591de2e  4c8d3cc2                 lea r15, [rdx + rax*8]
000000014591de32  488d5db8                 lea rbx, [rbp - 0x48]
000000014591de36  4c8d75d8                 lea r14, [rbp - 0x28]
000000014591de3a  48895528                 mov qword ptr [rbp + 0x28], rdx
000000014591de3e  4989d4                   mov r12, rdx
000000014591de41  48894d08                 mov qword ptr [rbp + 8], rcx
000000014591de45  eb36                     jmp 0x14591de7d
000000014591de47  660f1f840000000000       nop word ptr [rax + rax]
000000014591de50  4983c418                 add r12, 0x18
000000014591de54  488b8620060000           mov rax, qword ptr [rsi + 0x620]
000000014591de5b  4c89e9                   mov rcx, r13
000000014591de5e  48c1e105                 shl rcx, 5
000000014591de62  0f1045b8                 movups xmm0, xmmword ptr [rbp - 0x48]
000000014591de66  0f104dc8                 movups xmm1, xmmword ptr [rbp - 0x38]
000000014591de6a  0f114c0810               movups xmmword ptr [rax + rcx + 0x10], xmm1
000000014591de6f  0f110408                 movups xmmword ptr [rax + rcx], xmm0
000000014591de73  49ffc5                   inc r13
000000014591de76  4c89ae28060000           mov qword ptr [rsi + 0x628], r13
000000014591de7d  4d39fc                   cmp r12, r15
000000014591de80  744d                     je 0x14591decf
000000014591de82  498b1424                 mov rdx, qword ptr [r12]
000000014591de86  418b442410               mov eax, dword ptr [r12 + 0x10]
000000014591de8b  8945e0                   mov dword ptr [rbp - 0x20], eax
000000014591de8e  498b442408               mov rax, qword ptr [r12 + 8]
000000014591de93  488945d8                 mov qword ptr [rbp - 0x28], rax
000000014591de97  448b8e640a0000           mov r9d, dword ptr [rsi + 0xa64]
000000014591de9e  41ffc1                   inc r9d
000000014591dea1  44898e640a0000           mov dword ptr [rsi + 0xa64], r9d
000000014591dea8  4889d9                   mov rcx, rbx
000000014591deab  4d89f0                   mov r8, r14
000000014591deae  e81d1ffaff               call 0x1458bfdd0
000000014591deb3  90                       nop
000000014591deb4  4c8bae28060000           mov r13, qword ptr [rsi + 0x628]
000000014591debb  4c3bae18060000           cmp r13, qword ptr [rsi + 0x618]
000000014591dec2  758c                     jne 0x14591de50
000000014591dec4  4889f9                   mov rcx, rdi
000000014591dec7  e814702d00               call 0x145bf4ee0
000000014591decc  90                       nop
000000014591decd  eb81                     jmp 0x14591de50
000000014591decf  488b4530                 mov rax, qword ptr [rbp + 0x30]
000000014591ded3  4885c0                   test rax, rax
000000014591ded6  7417                     je 0x14591deef
000000014591ded8  48c1e003                 shl rax, 3
000000014591dedc  488d1440                 lea rdx, [rax + rax*2]
000000014591dee0  41b808000000             mov r8d, 8
000000014591dee6  488b4d28                 mov rcx, qword ptr [rbp + 0x28]
000000014591deea  e8e1426efa               call 0x1400021d0
000000014591deef  f3440f108e340a0000       movss xmm9, dword ptr [rsi + 0xa34]
000000014591def8  f3440f1096340a0000       movss xmm10, dword ptr [rsi + 0xa34]
000000014591df01  48c7451000000000         mov qword ptr [rbp + 0x10], 0
000000014591df09  48c7451808000000         mov qword ptr [rbp + 0x18], 8
000000014591df11  48c7452000000000         mov qword ptr [rbp + 0x20], 0
000000014591df19  4c8bbe40090000           mov r15, qword ptr [rsi + 0x940]
000000014591df20  488b9e98090000           mov rbx, qword ptr [rsi + 0x998]
000000014591df27  486b864809000070         imul rax, qword ptr [rsi + 0x948], 0x70
000000014591df2f  4c01f8                   add rax, r15
000000014591df32  4883c310                 add rbx, 0x10
000000014591df36  4531e4                   xor r12d, r12d
000000014591df39  450f57db                 xorps xmm11, xmm11
000000014591df3d  4c8d7510                 lea r14, [rbp + 0x10]
000000014591df41  48894500                 mov qword ptr [rbp], rax
000000014591df45  66662e0f1f840000000000   nop word ptr cs:[rax + rax]
000000014591df50  4c89f9                   mov rcx, r15
000000014591df53  4939c7                   cmp r15, rax
000000014591df56  0f84fc000000             je 0x14591e058
000000014591df5c  4c8d7970                 lea r15, [rcx + 0x70]
000000014591df60  f30f104958               movss xmm1, dword ptr [rcx + 0x58]
000000014591df65  f30f10415c               movss xmm0, dword ptr [rcx + 0x5c]
000000014591df6a  0f28d1                   movaps xmm2, xmm1
000000014591df6d  f30f58d0                 addss xmm2, xmm0
000000014591df71  440f2eca                 ucomiss xmm9, xmm2
000000014591df75  73d9                     jae 0x14591df50
000000014591df77  440f2ed8                 ucomiss xmm11, xmm0
000000014591df7b  48894d28                 mov qword ptr [rbp + 0x28], rcx
000000014591df7f  7351                     jae 0x14591dfd2
000000014591df81  410f28d1                 movaps xmm2, xmm9
000000014591df85  f30f5cd1                 subss xmm2, xmm1
000000014591df89  f30f5ed0                 divss xmm2, xmm0
000000014591df8d  0f57c0                   xorps xmm0, xmm0
000000014591df90  f30f5fc2                 maxss xmm0, xmm2
000000014591df94  410f28c8                 movaps xmm1, xmm8
000000014591df98  f30f5dc8                 minss xmm1, xmm0
000000014591df9c  f2410f1047d0             movsd xmm0, qword ptr [r15 - 0x30]
000000014591dfa2  f2410f1057dc             movsd xmm2, qword ptr [r15 - 0x24]
000000014591dfa8  0f5cd0                   subps xmm2, xmm0
000000014591dfab  f30f12f1                 movsldup xmm6, xmm1
000000014591dfaf  0f59f2                   mulps xmm6, xmm2
000000014591dfb2  0f58f0                   addps xmm6, xmm0
000000014591dfb5  f3410f1047d8             movss xmm0, dword ptr [r15 - 0x28]
000000014591dfbb  f3450f1067e4             movss xmm12, dword ptr [r15 - 0x1c]
000000014591dfc1  f3440f5ce0               subss xmm12, xmm0
000000014591dfc6  f3440f59e1               mulss xmm12, xmm1
000000014591dfcb  f3440f58e0               addss xmm12, xmm0
000000014591dfd0  eb0c                     jmp 0x14591dfde
000000014591dfd2  f2410f1077dc             movsd xmm6, qword ptr [r15 - 0x24]
000000014591dfd8  f3450f1067e4             movss xmm12, dword ptr [r15 - 0x1c]
000000014591dfde  f30f16d6                 movshdup xmm2, xmm6
000000014591dfe2  4889d9                   mov rcx, rbx
000000014591dfe5  0f28ce                   movaps xmm1, xmm6
000000014591dfe8  e83322fbff               call 0x1458d0220
000000014591dfed  90                       nop
000000014591dfee  0f28f8                   movaps xmm7, xmm0
000000014591dff1  a801                     test al, 1
000000014591dff3  7504                     jne 0x14591dff9
000000014591dff5  410f28fc                 movaps xmm7, xmm12
000000014591dff9  410f1377d0               movlps qword ptr [r15 - 0x30], xmm6
000000014591dffe  f3410f117fd8             movss dword ptr [r15 - 0x28], xmm7
000000014591e004  410f1377dc               movlps qword ptr [r15 - 0x24], xmm6
000000014591e009  f3410f117fe4             movss dword ptr [r15 - 0x1c], xmm7
000000014591e00f  450f1357e8               movlps qword ptr [r15 - 0x18], xmm10
000000014591e014  f3450f114ff0             movss dword ptr [r15 - 0x10], xmm9
000000014591e01a  4d8b6fc8                 mov r13, qword ptr [r15 - 0x38]
000000014591e01e  4c8b6520                 mov r12, qword ptr [rbp + 0x20]
000000014591e022  4c3b6510                 cmp r12, qword ptr [rbp + 0x10]
000000014591e026  7509                     jne 0x14591e031
000000014591e028  4c89f1                   mov rcx, r14
000000014591e02b  e8806c2d00               call 0x145bf4cb0
000000014591e030  90                       nop
000000014591e031  488b4518                 mov rax, qword ptr [rbp + 0x18]
000000014591e035  4b8d0c64                 lea rcx, [r12 + r12*2]
000000014591e039  4c892cc8                 mov qword ptr [rax + rcx*8], r13
000000014591e03d  0f1374c808               movlps qword ptr [rax + rcx*8 + 8], xmm6
000000014591e042  f30f117cc810             movss dword ptr [rax + rcx*8 + 0x10], xmm7
000000014591e048  49ffc4                   inc r12
000000014591e04b  4c896520                 mov qword ptr [rbp + 0x20], r12
000000014591e04f  488b4500                 mov rax, qword ptr [rbp]
000000014591e053  e9f8feffff               jmp 0x14591df50
000000014591e058  488b4510                 mov rax, qword ptr [rbp + 0x10]
000000014591e05c  48894530                 mov qword ptr [rbp + 0x30], rax
000000014591e060  488b5518                 mov rdx, qword ptr [rbp + 0x18]
000000014591e064  4b8d0464                 lea rax, [r12 + r12*2]
000000014591e068  4c8d3cc2                 lea r15, [rdx + rax*8]
000000014591e06c  488d5db8                 lea rbx, [rbp - 0x48]
000000014591e070  4c8d75d8                 lea r14, [rbp - 0x28]
000000014591e074  48895508                 mov qword ptr [rbp + 8], rdx
000000014591e078  4989d4                   mov r12, rdx
000000014591e07b  48894d28                 mov qword ptr [rbp + 0x28], rcx
000000014591e07f  eb3c                     jmp 0x14591e0bd
000000014591e081  6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
000000014591e090  4983c418                 add r12, 0x18
000000014591e094  488b8620060000           mov rax, qword ptr [rsi + 0x620]
000000014591e09b  4c89e9                   mov rcx, r13
000000014591e09e  48c1e105                 shl rcx, 5
000000014591e0a2  0f1045b8                 movups xmm0, xmmword ptr [rbp - 0x48]
000000014591e0a6  0f104dc8                 movups xmm1, xmmword ptr [rbp - 0x38]
000000014591e0aa  0f114c0810               movups xmmword ptr [rax + rcx + 0x10], xmm1
000000014591e0af  0f110408                 movups xmmword ptr [rax + rcx], xmm0
000000014591e0b3  49ffc5                   inc r13
000000014591e0b6  4c89ae28060000           mov qword ptr [rsi + 0x628], r13
000000014591e0bd  4d39fc                   cmp r12, r15
000000014591e0c0  744d                     je 0x14591e10f
000000014591e0c2  498b1424                 mov rdx, qword ptr [r12]
000000014591e0c6  418b442410               mov eax, dword ptr [r12 + 0x10]
000000014591e0cb  8945e0                   mov dword ptr [rbp - 0x20], eax
000000014591e0ce  498b442408               mov rax, qword ptr [r12 + 8]
000000014591e0d3  488945d8                 mov qword ptr [rbp - 0x28], rax
000000014591e0d7  448b8e640a0000           mov r9d, dword ptr [rsi + 0xa64]
000000014591e0de  41ffc1                   inc r9d
000000014591e0e1  44898e640a0000           mov dword ptr [rsi + 0xa64], r9d
000000014591e0e8  4889d9                   mov rcx, rbx
000000014591e0eb  4d89f0                   mov r8, r14
000000014591e0ee  e8dd1cfaff               call 0x1458bfdd0
000000014591e0f3  90                       nop
000000014591e0f4  4c8bae28060000           mov r13, qword ptr [rsi + 0x628]
000000014591e0fb  4c3bae18060000           cmp r13, qword ptr [rsi + 0x618]
000000014591e102  758c                     jne 0x14591e090
000000014591e104  4889f9                   mov rcx, rdi
000000014591e107  e8d46d2d00               call 0x145bf4ee0
000000014591e10c  90                       nop
000000014591e10d  eb81                     jmp 0x14591e090
000000014591e10f  488b4530                 mov rax, qword ptr [rbp + 0x30]
000000014591e113  4885c0                   test rax, rax
000000014591e116  7417                     je 0x14591e12f
000000014591e118  48c1e003                 shl rax, 3
000000014591e11c  488d1440                 lea rdx, [rax + rax*2]
000000014591e120  41b808000000             mov r8d, 8
000000014591e126  488b4d08                 mov rcx, qword ptr [rbp + 8]
000000014591e12a  e8a1406efa               call 0x1400021d0
000000014591e12f  0f287540                 movaps xmm6, xmmword ptr [rbp + 0x40]
000000014591e133  0f287d50                 movaps xmm7, xmmword ptr [rbp + 0x50]
000000014591e137  440f284560               movaps xmm8, xmmword ptr [rbp + 0x60]
000000014591e13c  440f284d70               movaps xmm9, xmmword ptr [rbp + 0x70]
000000014591e141  440f289580000000         movaps xmm10, xmmword ptr [rbp + 0x80]
000000014591e149  440f289d90000000         movaps xmm11, xmmword ptr [rbp + 0x90]
000000014591e151  440f28a5a0000000         movaps xmm12, xmmword ptr [rbp + 0xa0]
000000014591e159  440f28adb0000000         movaps xmm13, xmmword ptr [rbp + 0xb0]
000000014591e161  440f28b5c0000000         movaps xmm14, xmmword ptr [rbp + 0xc0]
000000014591e169  4881c458010000           add rsp, 0x158
000000014591e170  5b                       pop rbx
000000014591e171  5f                       pop rdi
000000014591e172  5e                       pop rsi
000000014591e173  415c                     pop r12
000000014591e175  415d                     pop r13
000000014591e177  415e                     pop r14
000000014591e179  415f                     pop r15
000000014591e17b  5d                       pop rbp
000000014591e17c  c3                       ret
