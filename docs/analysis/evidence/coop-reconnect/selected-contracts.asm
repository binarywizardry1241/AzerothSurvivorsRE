// peer-departure-entry
0000000145bd88d8 8bb5c8000000                   mov esi, dword ptr [rbp + 0xc8]
0000000145bd88de 89b540010000                   mov dword ptr [rbp + 0x140], esi
0000000145bd88e4 488bbd00030000                 mov rdi, qword ptr [rbp + 0x300]
0000000145bd88eb 4883bfb001000000               cmp qword ptr [rdi + 0x1b0], 0
0000000145bd88f3 0f84f2020000                   je 0x145bd8beb
// peer-endpoint-closed
0000000145bd8bdd 4c01d1                         add rcx, r10
0000000145bd8be0 c641f800                       mov byte ptr [rcx - 8], 0
// peer-inner-remove
0000000145bd8c8f 496bc370                       imul rax, r11, 0x70
0000000145bd8c93 48c1f804                       sar rax, 4
0000000145bd8c97 49b9b76ddbb66ddbb66d           movabs r9, 0x6db6db6db6db6db7
0000000145bd8ca1 490fafc1                       imul rax, r9
0000000145bd8ca5 4c8d48f0                       lea r9, [rax - 0x10]
0000000145bd8ca9 4921d1                         and r9, rdx
0000000145bd8cac f3420f6f0409                   movdqu xmm0, xmmword ptr [rcx + r9]
0000000145bd8cb2 660f74c7                       pcmpeqb xmm0, xmm7
0000000145bd8cb6 660fd7d0                       pmovmskb edx, xmm0
0000000145bd8cba f30f6f0401                     movdqu xmm0, xmmword ptr [rcx + rax]
0000000145bd8cbf 660f74c7                       pcmpeqb xmm0, xmm7
0000000145bd8cc3 66440fd7d0                     pmovmskb r10d, xmm0
0000000145bd8cc8 6641bb1f00                     mov r11w, 0x1f
0000000145bd8ccd 66440fbdda                     bsr r11w, dx
0000000145bd8cd2 4183f30f                       xor r11d, 0xf
0000000145bd8cd6 4181ca00000100                 or r10d, 0x10000
0000000145bd8cdd f3450fbcd2                     tzcnt r10d, r10d
0000000145bd8ce2 4501da                         add r10d, r11d
0000000145bd8ce5 b280                           mov dl, 0x80
0000000145bd8ce7 664183fa0f                     cmp r10w, 0xf
0000000145bd8cec 7710                           ja 0x145bd8cfe
0000000145bd8cee 488b9500030000                 mov rdx, qword ptr [rbp + 0x300]
0000000145bd8cf5 48ff82d8010000                 inc qword ptr [rdx + 0x1d8]
0000000145bd8cfc b2ff                           mov dl, 0xff
0000000145bd8cfe 881401                         mov byte ptr [rcx + rax], dl
0000000145bd8d01 4288540910                     mov byte ptr [rcx + r9 + 0x10], dl
0000000145bd8d06 488b8500030000                 mov rax, qword ptr [rbp + 0x300]
0000000145bd8d0d 48ff88e0010000                 dec qword ptr [rax + 0x1e0]
0000000145bd8d14 4901c8                         add r8, rcx
0000000145bd8d17 498b7098                       mov rsi, qword ptr [r8 - 0x68]
0000000145bd8d1b 4883feff                       cmp rsi, -1
0000000145bd8d1f 0f849b090000                   je 0x145bd96c0
0000000145bd8d25 498b40a0                       mov rax, qword ptr [r8 - 0x60]
0000000145bd8d29 488985e0020000                 mov qword ptr [rbp + 0x2e0], rax
0000000145bd8d30 498b78b0                       mov rdi, qword ptr [r8 - 0x50]
// retry-deadline
0000000145bd9c92 0f57c9                         xorps xmm1, xmm1
0000000145bd9c95 f30f2aca                       cvtsi2ss xmm1, edx
0000000145bd9c99 f30f5e0dcfd56700               divss xmm1, dword ptr [rip + 0x67d5cf]
0000000145bd9ca1 f30f58c8                       addss xmm1, xmm0
0000000145bd9ca5 0f2e0d88448d00                 ucomiss xmm1, dword ptr [rip + 0x8d4488]
0000000145bd9cac 762c                           jbe 0x145bd9cda
0000000145bd9cae 41c684244101000001             mov byte ptr [r12 + 0x141], 1
0000000145bd9cb7 498b8c2430010000               mov rcx, qword ptr [r12 + 0x130]
0000000145bd9cbf 498b842438010000               mov rax, qword ptr [r12 + 0x138]
0000000145bd9cc7 488b4030                       mov rax, qword ptr [rax + 0x30]
0000000145bd9ccb c6851703000000                 mov byte ptr [rbp + 0x317], 0
0000000145bd9cd2 ffd0                           call rax
0000000145bd9cd4 90                             nop
0000000145bd9cd5 e9bd090000                     jmp 0x145bda697
// retry-spacing
0000000145bd9e4a 0f57c9                         xorps xmm1, xmm1
0000000145bd9e4d f30f2aca                       cvtsi2ss xmm1, edx
0000000145bd9e51 f30f5e0d17d46700               divss xmm1, dword ptr [rip + 0x67d417]
0000000145bd9e59 f30f58c8                       addss xmm1, xmm0
0000000145bd9e5d f30f100517845d00               movss xmm0, dword ptr [rip + 0x5d8417]
0000000145bd9e65 0f2ec1                         ucomiss xmm0, xmm1
0000000145bd9e68 0f8729080000                   ja 0x145bda697
// host-receive-cap
0000000145c0e4f4 4881fbc7000000                 cmp rbx, 0xc7
0000000145c0e4fb 0f8757010000                   ja 0x145c0e658
// host-peer-liveness
0000000145c0e5d7 4d85e4                         test r12, r12
0000000145c0e5da 0f84ccfeffff                   je 0x145c0e4ac
0000000145c0e5e0 660f28c6                       movapd xmm0, xmm6
0000000145c0e5e4 f2410f5cc1                     subsd xmm0, xmm9
0000000145c0e5e9 66410f2ec0                     ucomisd xmm0, xmm8
0000000145c0e5ee 0f96c1                         setbe cl
0000000145c0e5f1 84c1                           test cl, al
0000000145c0e5f3 7563                           jne 0x145c0e658
0000000145c0e5f5 66410f2ec0                     ucomisd xmm0, xmm8
0000000145c0e5fa 0f86b4feffff                   jbe 0x145c0e4b4
// host-peer-removal
0000000145c2f510 55                             push rbp
0000000145c2f511 4157                           push r15
0000000145c2f513 4156                           push r14
0000000145c2f515 4155                           push r13
0000000145c2f517 4154                           push r12
0000000145c2f519 56                             push rsi
0000000145c2f51a 57                             push rdi
0000000145c2f51b 53                             push rbx
0000000145c2f51c 4881ecb8090000                 sub rsp, 0x9b8
0000000145c2f523 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145c2f52b 48c78530090000feffffff         mov qword ptr [rbp + 0x930], 0xfffffffffffffffe
0000000145c2f536 83b9700d000003                 cmp dword ptr [rcx + 0xd70], 3
0000000145c2f53d 0f85ef000000                   jne 0x145c2f632
0000000145c2f543 4889d7                         mov rdi, rdx
0000000145c2f546 4889ce                         mov rsi, rcx
0000000145c2f549 488b99b00d0000                 mov rbx, qword ptr [rcx + 0xdb0]
0000000145c2f550 4839da                         cmp rdx, rbx
0000000145c2f553 0f83ed000000                   jae 0x145c2f646
0000000145c2f559 4c8ba6a80d0000                 mov r12, qword ptr [rsi + 0xda8]
0000000145c2f560 4c69efc8040000                 imul r13, rdi, 0x4c8
0000000145c2f567 4f8d342c                       lea r14, [r12 + r13]
0000000145c2f56b 4f8b3c2c                       mov r15, qword ptr [r12 + r13]
0000000145c2f56f 4b8d142c                       lea rdx, [r12 + r13]
0000000145c2f573 4883c208                       add rdx, 8
0000000145c2f577 488d4da8                       lea rcx, [rbp - 0x58]
0000000145c2f57b 41b8c0040000                   mov r8d, 0x4c0
0000000145c2f581 e8c55a3d00                     call 0x14600504b
0000000145c2f586 4b8d142c                       lea rdx, [r12 + r13]
0000000145c2f58a 4881c2c8040000                 add rdx, 0x4c8
0000000145c2f591 4889f8                         mov rax, rdi
0000000145c2f594 48f7d0                         not rax
0000000145c2f597 4801d8                         add rax, rbx
0000000145c2f59a 4c69c0c8040000                 imul r8, rax, 0x4c8
0000000145c2f5a1 4c89f1                         mov rcx, r14
0000000145c2f5a4 e8ae5a3d00                     call 0x146005057
0000000145c2f5a9 48ffcb                         dec rbx
0000000145c2f5ac 48899eb00d0000                 mov qword ptr [rsi + 0xdb0], rbx
0000000145c2f5b3 4983ff02                       cmp r15, 2
0000000145c2f5b7 0f8489000000                   je 0x145c2f646
0000000145c2f5bd 4c89bd68040000                 mov qword ptr [rbp + 0x468], r15
0000000145c2f5c4 488d8d70040000                 lea rcx, [rbp + 0x470]
0000000145c2f5cb 488d55a8                       lea rdx, [rbp - 0x58]
0000000145c2f5cf 41b8c0040000                   mov r8d, 0x4c0
0000000145c2f5d5 e8715a3d00                     call 0x14600504b
0000000145c2f5da 837e1002                       cmp dword ptr [rsi + 0x10], 2
0000000145c2f5de 0f95c0                         setne al
0000000145c2f5e1 4484f8                         test al, r15b
0000000145c2f5e4 7411                           je 0x145c2f5f7
0000000145c2f5e6 488d4e10                       lea rcx, [rsi + 0x10]
0000000145c2f5ea 488b9570040000                 mov rdx, qword ptr [rbp + 0x470]
0000000145c2f5f1 e88ad2ecff                     call 0x145afc880
0000000145c2f5f6 90                             nop
0000000145c2f5f7 4889f1                         mov rcx, rsi
0000000145c2f5fa e841c7ffff                     call 0x145c2bd40
0000000145c2f5ff 90                             nop
0000000145c2f600 48c744242000000000             mov qword ptr [rsp + 0x20], 0
0000000145c2f609 488d1540b4a701                 lea rdx, [rip + 0x1a7b440]
0000000145c2f610 41b804000000                   mov r8d, 4
0000000145c2f616 41b901000000                   mov r9d, 1
0000000145c2f61c 4889f1                         mov rcx, rsi
0000000145c2f61f e81ccdffff                     call 0x145c2c340
0000000145c2f624 90                             nop
0000000145c2f625 488d8d68040000                 lea rcx, [rbp + 0x468]
0000000145c2f62c e8bf4ffdff                     call 0x145c045f0
0000000145c2f631 90                             nop
0000000145c2f632 4881c4b8090000                 add rsp, 0x9b8
0000000145c2f639 5b                             pop rbx
0000000145c2f63a 5f                             pop rdi
0000000145c2f63b 5e                             pop rsi
0000000145c2f63c 415c                           pop r12
0000000145c2f63e 415d                           pop r13
0000000145c2f640 415e                           pop r14
0000000145c2f642 415f                           pop r15
0000000145c2f644 5d                             pop rbp
0000000145c2f645 c3                             ret
0000000145c2f646 4c8d05a3b4a701                 lea r8, [rip + 0x1a7b4a3]
0000000145c2f64d 4889f9                         mov rcx, rdi
0000000145c2f650 4889da                         mov rdx, rbx
0000000145c2f653 e8d3e75700                     call 0x1461ade2b
0000000145c2f658 0f0b                           ud2
// record-transport-drop
0000000145c04607 488b81b0040000                 mov rax, qword ptr [rcx + 0x4b0]
0000000145c0460e 488945e0                       mov qword ptr [rbp - 0x20], rax
0000000145c04612 48894df0                       mov qword ptr [rbp - 0x10], rcx
0000000145c04616 488b81b8040000                 mov rax, qword ptr [rcx + 0x4b8]
0000000145c0461d 488945e8                       mov qword ptr [rbp - 0x18], rax
0000000145c04621 488b00                         mov rax, qword ptr [rax]
0000000145c04624 4885c0                         test rax, rax
0000000145c04627 7407                           je 0x145c04630
0000000145c04629 488b4de0                       mov rcx, qword ptr [rbp - 0x20]
0000000145c0462d ffd0                           call rax
0000000145c0462f 90                             nop
// transport-shared-drop
0000000145bd4870 488b01                         mov rax, qword ptr [rcx]
0000000145bd4873 f048ff08                       lock dec qword ptr [rax]
0000000145bd4877 7505                           jne 0x145bd487e
0000000145bd4879 e922f80100                     jmp 0x145bf40a0
0000000145bd487e c3                             ret
// host-open-peer-liveness
0000000145c0e4ac 84c0                           test al, al
0000000145c0e4ae 0f85a4010000                   jne 0x145c0e658
// wire25-decoded-variant
0000000145e655ea c6859801000000                 mov byte ptr [rbp + 0x198], 0
0000000145e655f1 48ba0500000000000080           movabs rdx, 0x8000000000000005
0000000145e655fb 4531e4                         xor r12d, r12d
0000000145e655fe e916080000                     jmp 0x145e65e19
// actor-departure-admission
0000000145afc8da 4885d2                         test rdx, rdx
0000000145afc8dd 0f84ff070000                   je 0x145afd0e2
0000000145afc8e3 4889d7                         mov rdi, rdx
0000000145afc8e6 4889ce                         mov rsi, rcx
0000000145afc8e9 483b91300a0000                 cmp rdx, qword ptr [rcx + 0xa30]
0000000145afc8f0 0f87ec070000                   ja 0x145afd0e2
0000000145afc8f6 4889f1                         mov rcx, rsi
0000000145afc8f9 e8d2ceffff                     call 0x145af97d0
// actor-departure-context
0000000145afcb84 90                             nop
0000000145afcb85 488d55a0                       lea rdx, [rbp - 0x60]
0000000145afcb89 4889f1                         mov rcx, rsi
0000000145afcb8c e88f380200                     call 0x145b20420
0000000145afcb91 4889be500c0000                 mov qword ptr [rsi + 0xc50], rdi
0000000145afcb98 488b8ef0020000                 mov rcx, qword ptr [rsi + 0x2f0]
0000000145afcb9f 488b96f8020000                 mov rdx, qword ptr [rsi + 0x2f8]
0000000145afcba6 c685d713000001                 mov byte ptr [rbp + 0x13d7], 1
0000000145afcbad 4989f0                         mov r8, rsi
0000000145afcbb0 e84be30b00                     call 0x145bbaf00
0000000145afcbb5 90                             nop
0000000145afcbb6 c685d713000001                 mov byte ptr [rbp + 0x13d7], 1
0000000145afcbbd 4889f1                         mov rcx, rsi
0000000145afcbc0 e85bfbffff                     call 0x145afc720
0000000145afcbc5 90                             nop
0000000145afcbc6 48c786500c000000000000         mov qword ptr [rsi + 0xc50], 0
0000000145afcbd1 488d7da0                       lea rdi, [rbp - 0x60]
0000000145afcbd5 4889f1                         mov rcx, rsi
0000000145afcbd8 4889fa                         mov rdx, rdi
0000000145afcbdb e840380200                     call 0x145b20420
0000000145afcbe0 488d8d90090000                 lea rcx, [rbp + 0x990]
0000000145afcbe7 41b8f0090000                   mov r8d, 0x9f0
0000000145afcbed 4889fa                         mov rdx, rdi
0000000145afcbf0 e856845000                     call 0x14600504b
0000000145afcbf5 488bbe300a0000                 mov rdi, qword ptr [rsi + 0xa30]
0000000145afcbfc 4c39f7                         cmp rdi, r14
0000000145afcbff 0f8279050000                   jb 0x145afd17e
0000000145afcc05 488d8e200a0000                 lea rcx, [rsi + 0xa20]
0000000145afcc0c 483b39                         cmp rdi, qword ptr [rcx]
0000000145afcc0f 7506                           jne 0x145afcc17
0000000145afcc11 e83af46800                     call 0x14618c050
0000000145afcc16 90                             nop
0000000145afcc17 48039e280a0000                 add rbx, qword ptr [rsi + 0xa28]
0000000145afcc1e 4889f8                         mov rax, rdi
0000000145afcc21 4c29f0                         sub rax, r14
0000000145afcc24 7616                           jbe 0x145afcc3c
0000000145afcc26 488d8bf0090000                 lea rcx, [rbx + 0x9f0]
0000000145afcc2d 4c69c0f0090000                 imul r8, rax, 0x9f0
0000000145afcc34 4889da                         mov rdx, rbx
0000000145afcc37 e81b845000                     call 0x146005057
0000000145afcc3c 488d9590090000                 lea rdx, [rbp + 0x990]
0000000145afcc43 41b8f0090000                   mov r8d, 0x9f0
0000000145afcc49 4889d9                         mov rcx, rbx
0000000145afcc4c e8fa835000                     call 0x14600504b
0000000145afcc51 48ffc7                         inc rdi
0000000145afcc54 4889be300a0000                 mov qword ptr [rsi + 0xa30], rdi
0000000145afcc5b 4889f1                         mov rcx, rsi
0000000145afcc5e e86dcbffff                     call 0x145af97d0
// host-send-admission
0000000145be3f9f 4c01d1                         add rcx, r10
0000000145be3fa2 8079f801                       cmp byte ptr [rcx - 8], 1
0000000145be3fa6 7574                           jne 0x145be401c
// host-send-producer
0000000145be4004 498d4f18                       lea rcx, [r15 + 0x18]
0000000145be4008 4c8d45d0                       lea r8, [rbp - 0x30]
0000000145be400c 89da                           mov edx, ebx
0000000145be400e e8dd97ffff                     call 0x145bdd7f0
// control-reply-send
0000000145bdce05 488955c0                       mov qword ptr [rbp - 0x40], rdx
0000000145bdce09 488945c8                       mov qword ptr [rbp - 0x38], rax
0000000145bdce0d c645d001                       mov byte ptr [rbp - 0x30], 1
0000000145bdce11 c6450f00                       mov byte ptr [rbp + 0xf], 0
0000000145bdce15 4c8d45c0                       lea r8, [rbp - 0x40]
0000000145bdce19 488b4d00                       mov rcx, qword ptr [rbp]
0000000145bdce1d 89da                           mov edx, ebx
0000000145bdce1f e87cacffff                     call 0x145bd7aa0
