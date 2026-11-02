00000001458b72f3: 4889bd700d0000                 mov qword ptr [rbp + 0xd70], rdi
00000001458b72fa: 488bbb10100000                 mov rdi, qword ptr [rbx + 0x1010]
00000001458b7301: 4c8bb318100000                 mov r14, qword ptr [rbx + 0x1018]
00000001458b7308: 48899d880d0000                 mov qword ptr [rbp + 0xd88], rbx
00000001458b730f: 4c8bab380f0000                 mov r13, qword ptr [rbx + 0xf38]
00000001458b7316: 4d85e4                         test r12, r12
00000001458b7319: 0f8429020000                   je 0x1458b7548
00000001458b731f: e8dcae74fa                     call 0x140002200
00000001458b7324: bb08000000                     mov ebx, 8
00000001458b7329: ba08000000                     mov edx, 8
00000001458b732e: 4c89e1                         mov rcx, r12
00000001458b7331: e88aae74fa                     call 0x1400021c0
00000001458b7336: 4885c0                         test rax, rax
00000001458b7339: 7486                           je 0x1458b72c1
00000001458b733b: 4989c7                         mov r15, rax
00000001458b733e: 4889f3                         mov rbx, rsi
00000001458b7341: 4885f6                         test rsi, rsi
00000001458b7344: 740e                           je 0x1458b7354
00000001458b7346: 4c89f9                         mov rcx, r15
00000001458b7349: 4c89ea                         mov rdx, r13
00000001458b734c: 4d89e0                         mov r8, r12
00000001458b734f: e8e7b53300                     call 0x145bf293b
00000001458b7354: 4c8bad880d0000                 mov r13, qword ptr [rbp + 0xd88]
00000001458b735b: 498d95480f0000                 lea rdx, [r13 + 0xf48]
00000001458b7362: 4d8ba530100000                 mov r12, qword ptr [r13 + 0x1030]
00000001458b7369: 410f1085e00f0000               movups xmm0, xmmword ptr [r13 + 0xfe0]
00000001458b7371: 410f108df00f0000               movups xmm1, xmmword ptr [r13 + 0xff0]
00000001458b7379: 410f109500100000               movups xmm2, xmmword ptr [r13 + 0x1000]
00000001458b7381: 0f1195680b0000                 movups xmmword ptr [rbp + 0xb68], xmm2
00000001458b7388: 0f118d580b0000                 movups xmmword ptr [rbp + 0xb58], xmm1
00000001458b738f: 0f1185480b0000                 movups xmmword ptr [rbp + 0xb48], xmm0
00000001458b7396: 410fb6858b100000               movzx eax, byte ptr [r13 + 0x108b]
00000001458b739e: 8885f30b0000                   mov byte ptr [rbp + 0xbf3], al
00000001458b73a4: 418b8587100000                 mov eax, dword ptr [r13 + 0x1087]
00000001458b73ab: 8985ef0b0000                   mov dword ptr [rbp + 0xbef], eax
00000001458b73b1: 0f1045b8                       movups xmm0, xmmword ptr [rbp - 0x48]
00000001458b73b5: 0f2985800a0000                 movaps xmmword ptr [rbp + 0xa80], xmm0
00000001458b73bc: 488b45c8                       mov rax, qword ptr [rbp - 0x38]
00000001458b73c0: 488985900a0000                 mov qword ptr [rbp + 0xa90], rax
00000001458b73c7: 410f108538100000               movups xmm0, xmmword ptr [r13 + 0x1038]
00000001458b73cf: 410f108d48100000               movups xmm1, xmmword ptr [r13 + 0x1048]
00000001458b73d7: 410f109558100000               movups xmm2, xmmword ptr [r13 + 0x1058]
00000001458b73df: 410f109d68100000               movups xmm3, xmmword ptr [r13 + 0x1068]
00000001458b73e7: 0f2985a00b0000                 movaps xmmword ptr [rbp + 0xba0], xmm0
00000001458b73ee: 0f298db00b0000                 movaps xmmword ptr [rbp + 0xbb0], xmm1
00000001458b73f5: 0f2995c00b0000                 movaps xmmword ptr [rbp + 0xbc0], xmm2
00000001458b73fc: 0f299dd00b0000                 movaps xmmword ptr [rbp + 0xbd0], xmm3
00000001458b7403: 410f108574100000               movups xmm0, xmmword ptr [r13 + 0x1074]
00000001458b740b: 0f1185dc0b0000                 movups xmmword ptr [rbp + 0xbdc], xmm0
00000001458b7412: 488d8db00a0000                 lea rcx, [rbp + 0xab0]
00000001458b7419: 41b898000000                   mov r8d, 0x98
00000001458b741f: e817b53300                     call 0x145bf293b
00000001458b7424: 48899d980a0000                 mov qword ptr [rbp + 0xa98], rbx
00000001458b742b: 4c89bda00a0000                 mov qword ptr [rbp + 0xaa0], r15
00000001458b7432: 4889b5a80a0000                 mov qword ptr [rbp + 0xaa8], rsi
00000001458b7439: 4889bd780b0000                 mov qword ptr [rbp + 0xb78], rdi
00000001458b7440: 4c89b5800b0000                 mov qword ptr [rbp + 0xb80], r14
00000001458b7447: 488b85800d0000                 mov rax, qword ptr [rbp + 0xd80]
00000001458b744e: 488985880b0000                 mov qword ptr [rbp + 0xb88], rax
00000001458b7455: 4c89a5980b0000                 mov qword ptr [rbp + 0xb98], r12
00000001458b745c: 440fb6bd950d0000               movzx r15d, byte ptr [rbp + 0xd95]
00000001458b7464: 4488bdec0b0000                 mov byte ptr [rbp + 0xbec], r15b
00000001458b746b: 0fb685780d0000                 movzx eax, byte ptr [rbp + 0xd78]
00000001458b7472: 8885ed0b0000                   mov byte ptr [rbp + 0xbed], al
00000001458b7478: 0fb685960d0000                 movzx eax, byte ptr [rbp + 0xd96]
00000001458b747f: 8885ee0b0000                   mov byte ptr [rbp + 0xbee], al
00000001458b7485: 48b82d7f954c2df45158           movabs rax, 0x5851f42d4c957f2d
00000001458b748f: 490faf8518110000               imul rax, qword ptr [r13 + 0x1118]
00000001458b7497: 48b94f8167f77e7b0514           movabs rcx, 0x14057b7ef767814f
00000001458b74a1: 4801c1                         add rcx, rax
00000001458b74a4: 49898d18110000                 mov qword ptr [r13 + 0x1118], rcx
00000001458b74ab: 48898d900b0000                 mov qword ptr [rbp + 0xb90], rcx
