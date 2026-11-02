0000000145afaed0 55                             push rbp
0000000145afaed1 4157                           push r15
0000000145afaed3 4156                           push r14
0000000145afaed5 4155                           push r13
0000000145afaed7 4154                           push r12
0000000145afaed9 56                             push rsi
0000000145afaeda 57                             push rdi
0000000145afaedb 53                             push rbx
0000000145afaedc 4881ec88010000                 sub rsp, 0x188
0000000145afaee3 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145afaeeb 66440f7f9df0000000             movdqa xmmword ptr [rbp + 0xf0], xmm11
0000000145afaef4 66440f7f95e0000000             movdqa xmmword ptr [rbp + 0xe0], xmm10
0000000145afaefd 66440f7f8dd0000000             movdqa xmmword ptr [rbp + 0xd0], xmm9
0000000145afaf06 66440f7f85c0000000             movdqa xmmword ptr [rbp + 0xc0], xmm8
0000000145afaf0f 0f29bdb0000000                 movaps xmmword ptr [rbp + 0xb0], xmm7
0000000145afaf16 0f29b5a0000000                 movaps xmmword ptr [rbp + 0xa0], xmm6
0000000145afaf1d 48c78598000000feffffff         mov qword ptr [rbp + 0x98], 0xfffffffffffffffe
0000000145afaf28 4989d6                         mov r14, rdx
0000000145afaf2b 48894de0                       mov qword ptr [rbp - 0x20], rcx
0000000145afaf2f f30f10ba740c0000               movss xmm7, dword ptr [rdx + 0xc74]
0000000145afaf37 0fb6822f0d0000                 movzx eax, byte ptr [rdx + 0xd2f]
0000000145afaf3e 888581000000                   mov byte ptr [rbp + 0x81], al
0000000145afaf44 0fb6822a0d0000                 movzx eax, byte ptr [rdx + 0xd2a]
0000000145afaf4b 888582000000                   mov byte ptr [rbp + 0x82], al
0000000145afaf51 0fb682300d0000                 movzx eax, byte ptr [rdx + 0xd30]
0000000145afaf58 888583000000                   mov byte ptr [rbp + 0x83], al
0000000145afaf5e 8b8230050000                   mov eax, dword ptr [rdx + 0x530]
0000000145afaf64 89451c                         mov dword ptr [rbp + 0x1c], eax
0000000145afaf67 8b82900b0000                   mov eax, dword ptr [rdx + 0xb90]
0000000145afaf6d 894518                         mov dword ptr [rbp + 0x18], eax
0000000145afaf70 8b820c080000                   mov eax, dword ptr [rdx + 0x80c]
0000000145afaf76 894514                         mov dword ptr [rbp + 0x14], eax
0000000145afaf79 0fb6826f030000                 movzx eax, byte ptr [rdx + 0x36f]
0000000145afaf80 888580000000                   mov byte ptr [rbp + 0x80], al
0000000145afaf86 f20f10b2f4070000               movsd xmm6, qword ptr [rdx + 0x7f4]
0000000145afaf8e 0fb6825c030000                 movzx eax, byte ptr [rdx + 0x35c]
0000000145afaf95 884578                         mov byte ptr [rbp + 0x78], al
0000000145afaf98 0fb6825d030000                 movzx eax, byte ptr [rdx + 0x35d]
0000000145afaf9f 88858f000000                   mov byte ptr [rbp + 0x8f], al
0000000145afafa5 0fb6825e030000                 movzx eax, byte ptr [rdx + 0x35e]
0000000145afafac 88858e000000                   mov byte ptr [rbp + 0x8e], al
0000000145afafb2 0fb6825f030000                 movzx eax, byte ptr [rdx + 0x35f]
0000000145afafb9 88858d000000                   mov byte ptr [rbp + 0x8d], al
0000000145afafbf 0fb68260030000                 movzx eax, byte ptr [rdx + 0x360]
0000000145afafc6 88858c000000                   mov byte ptr [rbp + 0x8c], al
0000000145afafcc 0fb68261030000                 movzx eax, byte ptr [rdx + 0x361]
0000000145afafd3 88858b000000                   mov byte ptr [rbp + 0x8b], al
0000000145afafd9 0fb68262030000                 movzx eax, byte ptr [rdx + 0x362]
0000000145afafe0 88858a000000                   mov byte ptr [rbp + 0x8a], al
0000000145afafe6 0fb68263030000                 movzx eax, byte ptr [rdx + 0x363]
0000000145afafed 888589000000                   mov byte ptr [rbp + 0x89], al
0000000145afaff3 0fb68264030000                 movzx eax, byte ptr [rdx + 0x364]
0000000145afaffa 888588000000                   mov byte ptr [rbp + 0x88], al
0000000145afb000 0fb68265030000                 movzx eax, byte ptr [rdx + 0x365]
0000000145afb007 888587000000                   mov byte ptr [rbp + 0x87], al
0000000145afb00d 0fb68266030000                 movzx eax, byte ptr [rdx + 0x366]
0000000145afb014 888585000000                   mov byte ptr [rbp + 0x85], al
0000000145afb01a 0fb68267030000                 movzx eax, byte ptr [rdx + 0x367]
0000000145afb021 888584000000                   mov byte ptr [rbp + 0x84], al
0000000145afb027 8b8208080000                   mov eax, dword ptr [rdx + 0x808]
0000000145afb02d 89452c                         mov dword ptr [rbp + 0x2c], eax
0000000145afb030 8b8204080000                   mov eax, dword ptr [rdx + 0x804]
0000000145afb036 894530                         mov dword ptr [rbp + 0x30], eax
0000000145afb039 8b82fc070000                   mov eax, dword ptr [rdx + 0x7fc]
0000000145afb03f 894528                         mov dword ptr [rbp + 0x28], eax
0000000145afb042 8b8210080000                   mov eax, dword ptr [rdx + 0x810]
0000000145afb048 894524                         mov dword ptr [rbp + 0x24], eax
0000000145afb04b 8b82d80c0000                   mov eax, dword ptr [rdx + 0xcd8]
0000000145afb051 894520                         mov dword ptr [rbp + 0x20], eax
0000000145afb054 488d925c030000                 lea rdx, [rdx + 0x35c]
0000000145afb05b 498d8e00030000                 lea rcx, [r14 + 0x300]
0000000145afb062 410fb68668030000               movzx eax, byte ptr [r14 + 0x368]
0000000145afb06a 888586000000                   mov byte ptr [rbp + 0x86], al
0000000145afb070 410fb6b669030000               movzx esi, byte ptr [r14 + 0x369]
0000000145afb078 410fb69e6a030000               movzx ebx, byte ptr [r14 + 0x36a]
0000000145afb080 450fb6a66b030000               movzx r12d, byte ptr [r14 + 0x36b]
0000000145afb088 410fb6be6c030000               movzx edi, byte ptr [r14 + 0x36c]
0000000145afb090 450fb6be6d030000               movzx r15d, byte ptr [r14 + 0x36d]
0000000145afb098 450fb6ae6e030000               movzx r13d, byte ptr [r14 + 0x36e]
0000000145afb0a0 e8bb90fcff                     call 0x145ac4160
0000000145afb0a5 4d8b86d8020000                 mov r8, qword ptr [r14 + 0x2d8]
0000000145afb0ac 4d85c0                         test r8, r8
0000000145afb0af 7910                           jns 0x145afb0c1
0000000145afb0b1 4531e4                         xor r12d, r12d
0000000145afb0b4 4c89e1                         mov rcx, r12
0000000145afb0b7 4c89c2                         mov rdx, r8
0000000145afb0ba e8fc8f6900                     call 0x1461940bb
0000000145afb0bf 0f0b                           ud2
0000000145afb0c1 4c894540                       mov qword ptr [rbp + 0x40], r8
0000000145afb0c5 4088b596000000                 mov byte ptr [rbp + 0x96], sil
0000000145afb0cc 889d95000000                   mov byte ptr [rbp + 0x95], bl
0000000145afb0d2 4488a594000000                 mov byte ptr [rbp + 0x94], r12b
0000000145afb0d9 4088bd93000000                 mov byte ptr [rbp + 0x93], dil
0000000145afb0e0 4488bd92000000                 mov byte ptr [rbp + 0x92], r15b
0000000145afb0e7 4488ad91000000                 mov byte ptr [rbp + 0x91], r13b
0000000145afb0ee 889590000000                   mov byte ptr [rbp + 0x90], dl
0000000145afb0f4 488945e8                       mov qword ptr [rbp - 0x18], rax
0000000145afb0f8 418b8600030000                 mov eax, dword ptr [r14 + 0x300]
0000000145afb0ff 894534                         mov dword ptr [rbp + 0x34], eax
0000000145afb102 418b8604030000                 mov eax, dword ptr [r14 + 0x304]
0000000145afb109 89453c                         mov dword ptr [rbp + 0x3c], eax
0000000145afb10c 418b8608030000                 mov eax, dword ptr [r14 + 0x308]
0000000145afb113 894538                         mov dword ptr [rbp + 0x38], eax
0000000145afb116 f3450f6f963c030000             movdqu xmm10, xmmword ptr [r14 + 0x33c]
0000000145afb11f f3450f6f8e2c030000             movdqu xmm9, xmmword ptr [r14 + 0x32c]
0000000145afb128 f3450f6f9e1c030000             movdqu xmm11, xmmword ptr [r14 + 0x31c]
0000000145afb131 f3450f6f860c030000             movdqu xmm8, xmmword ptr [r14 + 0x30c]
0000000145afb13a 410fb69e54030000               movzx ebx, byte ptr [r14 + 0x354]
0000000145afb142 7440                           je 0x145afb184
0000000145afb144 4d8bbed0020000                 mov r15, qword ptr [r14 + 0x2d0]
0000000145afb14b e8b07050fa                     call 0x140002200
0000000145afb150 41bc01000000                   mov r12d, 1
0000000145afb156 ba01000000                     mov edx, 1
0000000145afb15b 488b7d40                       mov rdi, qword ptr [rbp + 0x40]
0000000145afb15f 4889f9                         mov rcx, rdi
0000000145afb162 e8597050fa                     call 0x1400021c0
0000000145afb167 4989f8                         mov r8, rdi
0000000145afb16a 4885c0                         test rax, rax
0000000145afb16d 0f8441ffffff                   je 0x145afb0b4
0000000145afb173 48894548                       mov qword ptr [rbp + 0x48], rax
0000000145afb177 4889c1                         mov rcx, rax
0000000145afb17a 4c89fa                         mov rdx, r15
0000000145afb17d e8990a4f00                     call 0x145febc1b
0000000145afb182 eb09                           jmp 0x145afb18d
0000000145afb184 b801000000                     mov eax, 1
0000000145afb189 48894548                       mov qword ptr [rbp + 0x48], rax
0000000145afb18d 4d8bae70070000                 mov r13, qword ptr [r14 + 0x770]
0000000145afb194 4e8d3ced00000000               lea r15, [r13*8]
0000000145afb19c 4c89e8                         mov rax, r13
0000000145afb19f 48c1e83d                       shr rax, 0x3d
0000000145afb1a3 0f95c0                         setne al
0000000145afb1a6 49bafcffffffffffff7f           movabs r10, 0x7ffffffffffffffc
0000000145afb1b0 4d39d7                         cmp r15, r10
0000000145afb1b3 0f97c1                         seta cl
0000000145afb1b6 08c1                           or cl, al
0000000145afb1b8 440fb66578                     movzx r12d, byte ptr [rbp + 0x78]
0000000145afb1bd 7414                           je 0x145afb1d3
0000000145afb1bf 4531ed                         xor r13d, r13d
0000000145afb1c2 4c89e9                         mov rcx, r13
0000000145afb1c5 4c89fa                         mov rdx, r15
0000000145afb1c8 e8ee8e6900                     call 0x1461940bb
0000000145afb1cd 90                             nop
0000000145afb1ce e948010000                     jmp 0x145afb31b
0000000145afb1d3 889d97000000                   mov byte ptr [rbp + 0x97], bl
0000000145afb1d9 498bbe68070000                 mov rdi, qword ptr [r14 + 0x768]
0000000145afb1e0 4d85ff                         test r15, r15
0000000145afb1e3 0f8434010000                   je 0x145afb31d
0000000145afb1e9 4c89eb                         mov rbx, r13
0000000145afb1ec e80f7050fa                     call 0x140002200
0000000145afb1f1 41bd04000000                   mov r13d, 4
0000000145afb1f7 ba04000000                     mov edx, 4
0000000145afb1fc 4c89f9                         mov rcx, r15
0000000145afb1ff e8bc6f50fa                     call 0x1400021c0
0000000145afb204 48894560                       mov qword ptr [rbp + 0x60], rax
0000000145afb208 4885c0                         test rax, rax
0000000145afb20b 74b5                           je 0x145afb1c2
0000000145afb20d 4989dd                         mov r13, rbx
0000000145afb210 48895d50                       mov qword ptr [rbp + 0x50], rbx
0000000145afb214 440fb66578                     movzx r12d, byte ptr [rbp + 0x78]
0000000145afb219 49bafcffffffffffff7f           movabs r10, 0x7ffffffffffffffc
0000000145afb223 4d85ed                         test r13, r13
0000000145afb226 7419                           je 0x145afb241
0000000145afb228 488b4d60                       mov rcx, qword ptr [rbp + 0x60]
0000000145afb22c 4889fa                         mov rdx, rdi
0000000145afb22f 4d89f8                         mov r8, r15
0000000145afb232 e8e4094f00                     call 0x145febc1b
0000000145afb237 49bafcffffffffffff7f           movabs r10, 0x7ffffffffffffffc
0000000145afb241 498b9e88070000                 mov rbx, qword ptr [r14 + 0x788]
0000000145afb248 488d049d00000000               lea rax, [rbx*4]
0000000145afb250 4c8d3c40                       lea r15, [rax + rax*2]
0000000145afb254 48b8aaaaaaaaaaaaaa0a           movabs rax, 0xaaaaaaaaaaaaaaa
0000000145afb25e 4839c3                         cmp rbx, rax
0000000145afb261 7614                           jbe 0x145afb277
0000000145afb263 4531ed                         xor r13d, r13d
0000000145afb266 4c89e9                         mov rcx, r13
0000000145afb269 4c89fa                         mov rdx, r15
0000000145afb26c e84a8e6900                     call 0x1461940bb
0000000145afb271 90                             nop
0000000145afb272 e9a4000000                     jmp 0x145afb31b
0000000145afb277 498bb680070000                 mov rsi, qword ptr [r14 + 0x780]
0000000145afb27e 4d85ff                         test r15, r15
0000000145afb281 4c896df0                       mov qword ptr [rbp - 0x10], r13
0000000145afb285 0f8474040000                   je 0x145afb6ff
0000000145afb28b e8706f50fa                     call 0x140002200
0000000145afb290 41bd04000000                   mov r13d, 4
0000000145afb296 ba04000000                     mov edx, 4
0000000145afb29b 4c89f9                         mov rcx, r15
0000000145afb29e e81d6f50fa                     call 0x1400021c0
0000000145afb2a3 4885c0                         test rax, rax
0000000145afb2a6 74be                           je 0x145afb266
0000000145afb2a8 4989c3                         mov r11, rax
0000000145afb2ab 48895d58                       mov qword ptr [rbp + 0x58], rbx
0000000145afb2af 440fb66578                     movzx r12d, byte ptr [rbp + 0x78]
0000000145afb2b4 49bafcffffffffffff7f           movabs r10, 0x7ffffffffffffffc
0000000145afb2be 48895df8                       mov qword ptr [rbp - 8], rbx
0000000145afb2c2 4885db                         test rbx, rbx
0000000145afb2c5 741e                           je 0x145afb2e5
0000000145afb2c7 4c89d9                         mov rcx, r11
0000000145afb2ca 4889f2                         mov rdx, rsi
0000000145afb2cd 4d89f8                         mov r8, r15
0000000145afb2d0 4c89de                         mov rsi, r11
0000000145afb2d3 e843094f00                     call 0x145febc1b
0000000145afb2d8 4989f3                         mov r11, rsi
0000000145afb2db 49bafcffffffffffff7f           movabs r10, 0x7ffffffffffffffc
0000000145afb2e5 498b9ea0070000                 mov rbx, qword ptr [r14 + 0x7a0]
0000000145afb2ec 4c8d3c9d00000000               lea r15, [rbx*4]
0000000145afb2f4 4889d8                         mov rax, rbx
0000000145afb2f7 48c1e83e                       shr rax, 0x3e
0000000145afb2fb 0f95c0                         setne al
0000000145afb2fe 4d39d7                         cmp r15, r10
0000000145afb301 0f97c1                         seta cl
0000000145afb304 08c1                           or cl, al
0000000145afb306 4c895d08                       mov qword ptr [rbp + 8], r11
0000000145afb30a 7430                           je 0x145afb33c
0000000145afb30c 4531ed                         xor r13d, r13d
0000000145afb30f 4c89e9                         mov rcx, r13
0000000145afb312 4c89fa                         mov rdx, r15
0000000145afb315 e8a18d6900                     call 0x1461940bb
0000000145afb31a 90                             nop
0000000145afb31b 0f0b                           ud2
0000000145afb31d b804000000                     mov eax, 4
0000000145afb322 48894560                       mov qword ptr [rbp + 0x60], rax
0000000145afb326 48c7455000000000               mov qword ptr [rbp + 0x50], 0
0000000145afb32e 4d85ed                         test r13, r13
0000000145afb331 0f85f1feffff                   jne 0x145afb228
0000000145afb337 e905ffffff                     jmp 0x145afb241
0000000145afb33c 498b9698070000                 mov rdx, qword ptr [r14 + 0x798]
0000000145afb343 4d85ff                         test r15, r15
0000000145afb346 0f84d3030000                   je 0x145afb71f
0000000145afb34c 48895500                       mov qword ptr [rbp], rdx
0000000145afb350 e8ab6e50fa                     call 0x140002200
0000000145afb355 41bd04000000                   mov r13d, 4
0000000145afb35b ba04000000                     mov edx, 4
0000000145afb360 4c89f9                         mov rcx, r15
0000000145afb363 e8586e50fa                     call 0x1400021c0
0000000145afb368 48894568                       mov qword ptr [rbp + 0x68], rax
0000000145afb36c 4885c0                         test rax, rax
0000000145afb36f 749e                           je 0x145afb30f
0000000145afb371 48895d70                       mov qword ptr [rbp + 0x70], rbx
0000000145afb375 440fb66578                     movzx r12d, byte ptr [rbp + 0x78]
0000000145afb37a 488b5500                       mov rdx, qword ptr [rbp]
0000000145afb37e 4885db                         test rbx, rbx
0000000145afb381 740d                           je 0x145afb390
0000000145afb383 488b4d68                       mov rcx, qword ptr [rbp + 0x68]
0000000145afb387 4d89f8                         mov r8, r15
0000000145afb38a e88c084f00                     call 0x145febc1b
0000000145afb38f 90                             nop
0000000145afb390 48895d78                       mov qword ptr [rbp + 0x78], rbx
0000000145afb394 488d4da8                       lea rcx, [rbp - 0x58]
0000000145afb398 4c89f2                         mov rdx, r14
0000000145afb39b e820750c00                     call 0x145bc28c0
0000000145afb3a0 90                             nop
0000000145afb3a1 410fb6cc                       movzx ecx, r12b
0000000145afb3a5 0fb6b58f000000                 movzx esi, byte ptr [rbp + 0x8f]
0000000145afb3ac 0fb6958e000000                 movzx edx, byte ptr [rbp + 0x8e]
0000000145afb3b3 440fb6858d000000               movzx r8d, byte ptr [rbp + 0x8d]
0000000145afb3bb 440fb68d8c000000               movzx r9d, byte ptr [rbp + 0x8c]
0000000145afb3c3 440fb6958b000000               movzx r10d, byte ptr [rbp + 0x8b]
0000000145afb3cb 440fb69d8a000000               movzx r11d, byte ptr [rbp + 0x8a]
0000000145afb3d3 0fb6bd89000000                 movzx edi, byte ptr [rbp + 0x89]
0000000145afb3da 440fb6b588000000               movzx r14d, byte ptr [rbp + 0x88]
0000000145afb3e2 4038f1                         cmp cl, sil
0000000145afb3e5 0f47f1                         cmova esi, ecx
0000000145afb3e8 4038d6                         cmp sil, dl
0000000145afb3eb 0f46f2                         cmovbe esi, edx
0000000145afb3ee 4438c6                         cmp sil, r8b
0000000145afb3f1 410f46f0                       cmovbe esi, r8d
0000000145afb3f5 4438ce                         cmp sil, r9b
0000000145afb3f8 410f46f1                       cmovbe esi, r9d
0000000145afb3fc 4438d6                         cmp sil, r10b
0000000145afb3ff 410f46f2                       cmovbe esi, r10d
0000000145afb403 4438de                         cmp sil, r11b
0000000145afb406 410f46f3                       cmovbe esi, r11d
0000000145afb40a 4038fe                         cmp sil, dil
0000000145afb40d 0f46f7                         cmovbe esi, edi
0000000145afb410 4438f6                         cmp sil, r14b
0000000145afb413 410f46f6                       cmovbe esi, r14d
0000000145afb417 0fb68d87000000                 movzx ecx, byte ptr [rbp + 0x87]
0000000145afb41e 4038ce                         cmp sil, cl
0000000145afb421 0f46f1                         cmovbe esi, ecx
0000000145afb424 0fb68d85000000                 movzx ecx, byte ptr [rbp + 0x85]
0000000145afb42b 4038ce                         cmp sil, cl
0000000145afb42e 0f46f1                         cmovbe esi, ecx
0000000145afb431 0fb68d84000000                 movzx ecx, byte ptr [rbp + 0x84]
0000000145afb438 4038ce                         cmp sil, cl
0000000145afb43b 0f46f1                         cmovbe esi, ecx
0000000145afb43e 0fb68d86000000                 movzx ecx, byte ptr [rbp + 0x86]
0000000145afb445 4038ce                         cmp sil, cl
0000000145afb448 0f46f1                         cmovbe esi, ecx
0000000145afb44b 0fb68d96000000                 movzx ecx, byte ptr [rbp + 0x96]
0000000145afb452 4038ce                         cmp sil, cl
0000000145afb455 0f46f1                         cmovbe esi, ecx
0000000145afb458 0fb68d95000000                 movzx ecx, byte ptr [rbp + 0x95]
0000000145afb45f 4038ce                         cmp sil, cl
0000000145afb462 0f46f1                         cmovbe esi, ecx
0000000145afb465 0fb68d94000000                 movzx ecx, byte ptr [rbp + 0x94]
0000000145afb46c 4038ce                         cmp sil, cl
0000000145afb46f 0f46f1                         cmovbe esi, ecx
0000000145afb472 0fb68d93000000                 movzx ecx, byte ptr [rbp + 0x93]
0000000145afb479 4038ce                         cmp sil, cl
0000000145afb47c 0f46f1                         cmovbe esi, ecx
0000000145afb47f 0fb68d92000000                 movzx ecx, byte ptr [rbp + 0x92]
0000000145afb486 4038ce                         cmp sil, cl
0000000145afb489 0f46f1                         cmovbe esi, ecx
0000000145afb48c 0fb68d91000000                 movzx ecx, byte ptr [rbp + 0x91]
0000000145afb493 4038ce                         cmp sil, cl
0000000145afb496 0f46f1                         cmovbe esi, ecx
0000000145afb499 8b4534                         mov eax, dword ptr [rbp + 0x34]
0000000145afb49c 0b453c                         or eax, dword ptr [rbp + 0x3c]
0000000145afb49f 0b4538                         or eax, dword ptr [rbp + 0x38]
0000000145afb4a2 660fefc0                       pxor xmm0, xmm0
0000000145afb4a6 66440f76c0                     pcmpeqd xmm8, xmm0
0000000145afb4ab 66440f76d8                     pcmpeqd xmm11, xmm0
0000000145afb4b0 66450f6bc3                     packssdw xmm8, xmm11
0000000145afb4b5 66440f76c8                     pcmpeqd xmm9, xmm0
0000000145afb4ba 66440f76d0                     pcmpeqd xmm10, xmm0
0000000145afb4bf 66450f6bca                     packssdw xmm9, xmm10
0000000145afb4c4 66450f63c1                     packsswb xmm8, xmm9
0000000145afb4c9 410f94c3                       sete r11b
0000000145afb4cd 66450fd7c8                     pmovmskb r9d, xmm8
0000000145afb4d2 4489ca                         mov edx, r9d
0000000145afb4d5 c1ea0f                         shr edx, 0xf
0000000145afb4d8 4589c8                         mov r8d, r9d
0000000145afb4db 41c1e80e                       shr r8d, 0xe
0000000145afb4df 4589ca                         mov r10d, r9d
0000000145afb4e2 41c1ea0d                       shr r10d, 0xd
0000000145afb4e6 4489cf                         mov edi, r9d
0000000145afb4e9 c1ef0c                         shr edi, 0xc
0000000145afb4ec 4589ce                         mov r14d, r9d
0000000145afb4ef 41c1ee0b                       shr r14d, 0xb
0000000145afb4f3 4489c9                         mov ecx, r9d
0000000145afb4f6 c1e90a                         shr ecx, 0xa
0000000145afb4f9 4589cc                         mov r12d, r9d
0000000145afb4fc 41c1ec09                       shr r12d, 9
0000000145afb500 4589cd                         mov r13d, r9d
0000000145afb503 41c1ed08                       shr r13d, 8
0000000145afb507 4584c9                         test r9b, r9b
0000000145afb50a 410f98c7                       sets r15b
0000000145afb50e 4520ef                         and r15b, r13b
0000000145afb511 4520e7                         and r15b, r12b
0000000145afb514 4589cc                         mov r12d, r9d
0000000145afb517 41c0ec05                       shr r12b, 5
0000000145afb51b 4589cd                         mov r13d, r9d
0000000145afb51e 41c0ed04                       shr r13b, 4
0000000145afb522 4520e5                         and r13b, r12b
0000000145afb525 4589cc                         mov r12d, r9d
0000000145afb528 41c0ec06                       shr r12b, 6
0000000145afb52c 4520e5                         and r13b, r12b
0000000145afb52f 4589cc                         mov r12d, r9d
0000000145afb532 41c0ec03                       shr r12b, 3
0000000145afb536 4489cb                         mov ebx, r9d
0000000145afb539 c0eb02                         shr bl, 2
0000000145afb53c 4420e3                         and bl, r12b
0000000145afb53f 4520cb                         and r11b, r9b
0000000145afb542 41d0e9                         shr r9b, 1
0000000145afb545 4520d9                         and r9b, r11b
0000000145afb548 4120d9                         and r9b, bl
0000000145afb54b 4520e9                         and r9b, r13b
0000000145afb54e 4520cf                         and r15b, r9b
0000000145afb551 4420f1                         and cl, r14b
0000000145afb554 4020f9                         and cl, dil
0000000145afb557 4420d1                         and cl, r10b
0000000145afb55a 4420c1                         and cl, r8b
0000000145afb55d 4420f9                         and cl, r15b
0000000145afb560 20d1                           and cl, dl
0000000145afb562 488b45e8                       mov rax, qword ptr [rbp - 0x18]
0000000145afb566 fec0                           inc al
0000000145afb568 4531c0                         xor r8d, r8d
0000000145afb56b 80bd9000000002                 cmp byte ptr [rbp + 0x90], 2
0000000145afb572 0fb6d0                         movzx edx, al
0000000145afb575 410f44d0                       cmove edx, r8d
0000000145afb579 80bd8200000000                 cmp byte ptr [rbp + 0x82], 0
0000000145afb580 440fb68583000000               movzx r8d, byte ptr [rbp + 0x83]
0000000145afb588 440fb68d81000000               movzx r9d, byte ptr [rbp + 0x81]
0000000145afb590 450f44c1                       cmove r8d, r9d
0000000145afb594 4180e006                       and r8b, 6
0000000145afb598 4180f804                       cmp r8b, 4
0000000145afb59c 488b45e0                       mov rax, qword ptr [rbp - 0x20]
0000000145afb5a0 f30f11b898000000               movss dword ptr [rax + 0x98], xmm7
0000000145afb5a8 448888c3000000                 mov byte ptr [rax + 0xc3], r9b
0000000145afb5af 0f9480c0000000                 sete byte ptr [rax + 0xc0]
0000000145afb5b6 448b451c                       mov r8d, dword ptr [rbp + 0x1c]
0000000145afb5ba 4489809c000000                 mov dword ptr [rax + 0x9c], r8d
0000000145afb5c1 448b4518                       mov r8d, dword ptr [rbp + 0x18]
0000000145afb5c5 448880c1000000                 mov byte ptr [rax + 0xc1], r8b
0000000145afb5cc f30f104530                     movss xmm0, dword ptr [rbp + 0x30]
0000000145afb5d1 f30f104d2c                     movss xmm1, dword ptr [rbp + 0x2c]
0000000145afb5d6 f30f105528                     movss xmm2, dword ptr [rbp + 0x28]
0000000145afb5db f30f105d14                     movss xmm3, dword ptr [rbp + 0x14]
0000000145afb5e0 0f14c1                         unpcklps xmm0, xmm1
0000000145afb5e3 0f14d3                         unpcklps xmm2, xmm3
0000000145afb5e6 0f16d0                         movlhps xmm2, xmm0
0000000145afb5e9 0f1190a0000000                 movups xmmword ptr [rax + 0xa0], xmm2
0000000145afb5f0 448b4524                       mov r8d, dword ptr [rbp + 0x24]
0000000145afb5f4 448980b0000000                 mov dword ptr [rax + 0xb0], r8d
0000000145afb5fb 440fb68580000000               movzx r8d, byte ptr [rbp + 0x80]
0000000145afb603 448880c4000000                 mov byte ptr [rax + 0xc4], r8b
0000000145afb60a 448b4520                       mov r8d, dword ptr [rbp + 0x20]
0000000145afb60e 448980b4000000                 mov dword ptr [rax + 0xb4], r8d
0000000145afb615 0f13b0b8000000                 movlps qword ptr [rax + 0xb8], xmm6
0000000145afb61c 4088b0c5000000                 mov byte ptr [rax + 0xc5], sil
0000000145afb623 8890c6000000                   mov byte ptr [rax + 0xc6], dl
0000000145afb629 8888c2000000                   mov byte ptr [rax + 0xc2], cl
0000000145afb62f 0fb68d97000000                 movzx ecx, byte ptr [rbp + 0x97]
0000000145afb636 8888c7000000                   mov byte ptr [rax + 0xc7], cl
0000000145afb63c 488b5540                       mov rdx, qword ptr [rbp + 0x40]
0000000145afb640 488910                         mov qword ptr [rax], rdx
0000000145afb643 488b4d48                       mov rcx, qword ptr [rbp + 0x48]
0000000145afb647 48894808                       mov qword ptr [rax + 8], rcx
0000000145afb64b 48895010                       mov qword ptr [rax + 0x10], rdx
0000000145afb64f 488b4d50                       mov rcx, qword ptr [rbp + 0x50]
0000000145afb653 48894818                       mov qword ptr [rax + 0x18], rcx
0000000145afb657 488b4d60                       mov rcx, qword ptr [rbp + 0x60]
0000000145afb65b 48894820                       mov qword ptr [rax + 0x20], rcx
0000000145afb65f 488b4df0                       mov rcx, qword ptr [rbp - 0x10]
0000000145afb663 48894828                       mov qword ptr [rax + 0x28], rcx
0000000145afb667 488b4d58                       mov rcx, qword ptr [rbp + 0x58]
0000000145afb66b 48894830                       mov qword ptr [rax + 0x30], rcx
0000000145afb66f 488b4d08                       mov rcx, qword ptr [rbp + 8]
0000000145afb673 48894838                       mov qword ptr [rax + 0x38], rcx
0000000145afb677 488b4df8                       mov rcx, qword ptr [rbp - 8]
0000000145afb67b 48894840                       mov qword ptr [rax + 0x40], rcx
0000000145afb67f 488b4d70                       mov rcx, qword ptr [rbp + 0x70]
0000000145afb683 48894848                       mov qword ptr [rax + 0x48], rcx
0000000145afb687 488b4d68                       mov rcx, qword ptr [rbp + 0x68]
0000000145afb68b 48894850                       mov qword ptr [rax + 0x50], rcx
0000000145afb68f 488b4d78                       mov rcx, qword ptr [rbp + 0x78]
0000000145afb693 48894858                       mov qword ptr [rax + 0x58], rcx
0000000145afb697 488b4dd8                       mov rcx, qword ptr [rbp - 0x28]
0000000145afb69b 48898890000000                 mov qword ptr [rax + 0x90], rcx
0000000145afb6a2 0f1045a8                       movups xmm0, xmmword ptr [rbp - 0x58]
0000000145afb6a6 0f104db8                       movups xmm1, xmmword ptr [rbp - 0x48]
0000000145afb6aa 0f1055c8                       movups xmm2, xmmword ptr [rbp - 0x38]
0000000145afb6ae 0f119080000000                 movups xmmword ptr [rax + 0x80], xmm2
0000000145afb6b5 0f114870                       movups xmmword ptr [rax + 0x70], xmm1
0000000145afb6b9 0f114060                       movups xmmword ptr [rax + 0x60], xmm0
0000000145afb6bd 0f28b5a0000000                 movaps xmm6, xmmword ptr [rbp + 0xa0]
0000000145afb6c4 0f28bdb0000000                 movaps xmm7, xmmword ptr [rbp + 0xb0]
0000000145afb6cb 440f2885c0000000               movaps xmm8, xmmword ptr [rbp + 0xc0]
0000000145afb6d3 440f288dd0000000               movaps xmm9, xmmword ptr [rbp + 0xd0]
0000000145afb6db 440f2895e0000000               movaps xmm10, xmmword ptr [rbp + 0xe0]
0000000145afb6e3 440f289df0000000               movaps xmm11, xmmword ptr [rbp + 0xf0]
0000000145afb6eb 4881c488010000                 add rsp, 0x188
0000000145afb6f2 5b                             pop rbx
0000000145afb6f3 5f                             pop rdi
0000000145afb6f4 5e                             pop rsi
0000000145afb6f5 415c                           pop r12
0000000145afb6f7 415d                           pop r13
0000000145afb6f9 415e                           pop r14
0000000145afb6fb 415f                           pop r15
0000000145afb6fd 5d                             pop rbp
0000000145afb6fe c3                             ret
0000000145afb6ff 41bb04000000                   mov r11d, 4
0000000145afb705 48c7455800000000               mov qword ptr [rbp + 0x58], 0
0000000145afb70d 48895df8                       mov qword ptr [rbp - 8], rbx
0000000145afb711 4885db                         test rbx, rbx
0000000145afb714 0f85adfbffff                   jne 0x145afb2c7
0000000145afb71a e9c6fbffff                     jmp 0x145afb2e5
0000000145afb71f b804000000                     mov eax, 4
0000000145afb724 48894568                       mov qword ptr [rbp + 0x68], rax
0000000145afb728 48c7457000000000               mov qword ptr [rbp + 0x70], 0
0000000145afb730 4885db                         test rbx, rbx
0000000145afb733 0f854afcffff                   jne 0x145afb383
0000000145afb739 e952fcffff                     jmp 0x145afb390
