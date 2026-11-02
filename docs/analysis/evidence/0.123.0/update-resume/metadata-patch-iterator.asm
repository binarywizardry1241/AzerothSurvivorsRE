00000001400aecc0 55                             push rbp
00000001400aecc1 4157                           push r15
00000001400aecc3 4156                           push r14
00000001400aecc5 4155                           push r13
00000001400aecc7 4154                           push r12
00000001400aecc9 56                             push rsi
00000001400aecca 57                             push rdi
00000001400aeccb 53                             push rbx
00000001400aeccc 4881ecf8010000                 sub rsp, 0x1f8
00000001400aecd3 488dac2480000000               lea rbp, [rsp + 0x80]
00000001400aecdb 66440f7f9d60010000             movdqa xmmword ptr [rbp + 0x160], xmm11
00000001400aece4 66440f7f9550010000             movdqa xmmword ptr [rbp + 0x150], xmm10
00000001400aeced 66440f7f8d40010000             movdqa xmmword ptr [rbp + 0x140], xmm9
00000001400aecf6 66440f7f8530010000             movdqa xmmword ptr [rbp + 0x130], xmm8
00000001400aecff 660f7fbd20010000               movdqa xmmword ptr [rbp + 0x120], xmm7
00000001400aed07 660f7fb510010000               movdqa xmmword ptr [rbp + 0x110], xmm6
00000001400aed0f 48c78508010000feffffff         mov qword ptr [rbp + 0x108], 0xfffffffffffffffe
00000001400aed1a 48898dd8000000                 mov qword ptr [rbp + 0xd8], rcx
00000001400aed21 4c8b22                         mov r12, qword ptr [rdx]
00000001400aed24 488b4208                       mov rax, qword ptr [rdx + 8]
00000001400aed28 48898500010000                 mov qword ptr [rbp + 0x100], rax
00000001400aed2f 4939c4                         cmp r12, rax
00000001400aed32 0f8415050000                   je 0x1400af24d
00000001400aed38 4889d7                         mov rdi, rdx
00000001400aed3b 488b4220                       mov rax, qword ptr [rdx + 0x20]
00000001400aed3f 488985f0000000                 mov qword ptr [rbp + 0xf0], rax
00000001400aed46 488db5a0000000                 lea rsi, [rbp + 0xa0]
00000001400aed4d 488b5a10                       mov rbx, qword ptr [rdx + 0x10]
00000001400aed51 4c8b7218                       mov r14, qword ptr [rdx + 0x18]
00000001400aed55 660f6f35a3931006               movdqa xmm6, xmmword ptr [rip + 0x61093a3]
00000001400aed5d 660f6f3dab931006               movdqa xmm7, xmmword ptr [rip + 0x61093ab]
00000001400aed65 66440f6f05b2931006             movdqa xmm8, xmmword ptr [rip + 0x61093b2]
00000001400aed6e 66440f6f0dd9921006             movdqa xmm9, xmmword ptr [rip + 0x61092d9]
00000001400aed77 66440f6f15e0921006             movdqa xmm10, xmmword ptr [rip + 0x61092e0]
00000001400aed80 66440f6f1de7921006             movdqa xmm11, xmmword ptr [rip + 0x61092e7]
00000001400aed89 4d8d7c2420                     lea r15, [r12 + 0x20]
00000001400aed8e 4c893f                         mov qword ptr [rdi], r15
00000001400aed91 4d89f0                         mov r8, r14
00000001400aed94 eb0f                           jmp 0x1400aeda5
00000001400aed96 662e0f1f840000000000           nop word ptr cs:[rax + rax]
00000001400aeda0 4d39f0                         cmp r8, r14
00000001400aeda3 773b                           ja 0x1400aede0
00000001400aeda5 b12f                           mov cl, 0x2f
00000001400aeda7 4889da                         mov rdx, rbx
00000001400aedaa e8111bf305                     call 0x145fe08c0
00000001400aedaf 4883f801                       cmp rax, 1
00000001400aedb3 752b                           jne 0x1400aede0
00000001400aedb5 4989d0                         mov r8, rdx
00000001400aedb8 4c39f2                         cmp rdx, r14
00000001400aedbb 73e3                           jae 0x1400aeda0
00000001400aedbd 42803c032f                     cmp byte ptr [rbx + r8], 0x2f
00000001400aedc2 75dc                           jne 0x1400aeda0
00000001400aedc4 4d8d4801                       lea r9, [r8 + 1]
00000001400aedc8 4d39f1                         cmp r9, r14
00000001400aedcb 7316                           jae 0x1400aede3
00000001400aedcd 42803c0bbf                     cmp byte ptr [rbx + r9], 0xbf
00000001400aedd2 7f0f                           jg 0x1400aede3
00000001400aedd4 e92c050000                     jmp 0x1400af305
00000001400aedd9 0f1f8000000000                 nop dword ptr [rax]
00000001400aede0 4531c9                         xor r9d, r9d
00000001400aede3 488d4dc0                       lea rcx, [rbp - 0x40]
00000001400aede7 4c89e2                         mov rdx, r12
00000001400aedea 4989d8                         mov r8, rbx
00000001400aeded e87eebfaff                     call 0x14005d970
00000001400aedf2 488b45c0                       mov rax, qword ptr [rbp - 0x40]
00000001400aedf6 4c8b65c8                       mov r12, qword ptr [rbp - 0x38]
00000001400aedfa 4c8b6dd0                       mov r13, qword ptr [rbp - 0x30]
00000001400aedfe 4883f8ff                       cmp rax, -1
00000001400aee02 0f84c8030000                   je 0x1400af1d0
00000001400aee08 488d55d8                       lea rdx, [rbp - 0x28]
00000001400aee0c 488b4a30                       mov rcx, qword ptr [rdx + 0x30]
00000001400aee10 48894e30                       mov qword ptr [rsi + 0x30], rcx
00000001400aee14 f30f6f02                       movdqu xmm0, xmmword ptr [rdx]
00000001400aee18 f30f6f4a10                     movdqu xmm1, xmmword ptr [rdx + 0x10]
00000001400aee1d f30f6f5220                     movdqu xmm2, xmmword ptr [rdx + 0x20]
00000001400aee22 f30f7f5620                     movdqu xmmword ptr [rsi + 0x20], xmm2
00000001400aee27 f30f7f4e10                     movdqu xmmword ptr [rsi + 0x10], xmm1
00000001400aee2c f30f7f06                       movdqu xmmword ptr [rsi], xmm0
00000001400aee30 48898588000000                 mov qword ptr [rbp + 0x88], rax
00000001400aee37 4c89a590000000                 mov qword ptr [rbp + 0x90], r12
00000001400aee3e 4c89ad98000000                 mov qword ptr [rbp + 0x98], r13
00000001400aee45 4d85ed                         test r13, r13
00000001400aee48 0f8859020000                   js 0x1400af0a7
00000001400aee4e 0f8471020000                   je 0x1400af0c5
00000001400aee54 4c89bde8000000                 mov qword ptr [rbp + 0xe8], r15
00000001400aee5b 4d89e7                         mov r15, r12
00000001400aee5e e89d33f5ff                     call 0x140002200
00000001400aee63 41bc01000000                   mov r12d, 1
00000001400aee69 ba01000000                     mov edx, 1
00000001400aee6e 4c89e9                         mov rcx, r13
00000001400aee71 e84a33f5ff                     call 0x1400021c0
00000001400aee76 4885c0                         test rax, rax
00000001400aee79 0f847a040000                   je 0x1400af2f9
00000001400aee7f 488985f8000000                 mov qword ptr [rbp + 0xf8], rax
00000001400aee86 4889c1                         mov rcx, rax
00000001400aee89 4c89fa                         mov rdx, r15
00000001400aee8c 4d89e8                         mov r8, r13
00000001400aee8f e8b761f505                     call 0x14600504b
00000001400aee94 4983fd08                       cmp r13, 8
00000001400aee98 7316                           jae 0x1400aeeb0
00000001400aee9a 31c0                           xor eax, eax
00000001400aee9c 488b8df8000000                 mov rcx, qword ptr [rbp + 0xf8]
00000001400aeea3 e9f8000000                     jmp 0x1400aefa0
00000001400aeea8 0f1f840000000000               nop dword ptr [rax + rax]
00000001400aeeb0 4983fd20                       cmp r13, 0x20
00000001400aeeb4 730e                           jae 0x1400aeec4
00000001400aeeb6 31c0                           xor eax, eax
00000001400aeeb8 488b8df8000000                 mov rcx, qword ptr [rbp + 0xf8]
00000001400aeebf e984000000                     jmp 0x1400aef48
00000001400aeec4 4c89e8                         mov rax, r13
00000001400aeec7 48b9e0ffffffffffff7f           movabs rcx, 0x7fffffffffffffe0
00000001400aeed1 4821c8                         and rax, rcx
00000001400aeed4 31d2                           xor edx, edx
00000001400aeed6 488b8df8000000                 mov rcx, qword ptr [rbp + 0xf8]
00000001400aeedd 0f1f00                         nop dword ptr [rax]
00000001400aeee0 f30f6f0411                     movdqu xmm0, xmmword ptr [rcx + rdx]
00000001400aeee5 f30f6f4c1110                   movdqu xmm1, xmmword ptr [rcx + rdx + 0x10]
00000001400aeeeb 660f6fd0                       movdqa xmm2, xmm0
00000001400aeeef 66410ffcd1                     paddb xmm2, xmm9
00000001400aeef4 660f6fd9                       movdqa xmm3, xmm1
00000001400aeef8 66410ffcd9                     paddb xmm3, xmm9
00000001400aeefd 660f6fe2                       movdqa xmm4, xmm2
00000001400aef01 66410fdae2                     pminub xmm4, xmm10
00000001400aef06 660f74e2                       pcmpeqb xmm4, xmm2
00000001400aef0a 66410fdbe3                     pand xmm4, xmm11
00000001400aef0f 660f6fd3                       movdqa xmm2, xmm3
00000001400aef13 66410fdad2                     pminub xmm2, xmm10
00000001400aef18 660f74d3                       pcmpeqb xmm2, xmm3
00000001400aef1c 66410fdbd3                     pand xmm2, xmm11
00000001400aef21 660febe0                       por xmm4, xmm0
00000001400aef25 660febd1                       por xmm2, xmm1
00000001400aef29 f30f7f2411                     movdqu xmmword ptr [rcx + rdx], xmm4
00000001400aef2e f30f7f541110                   movdqu xmmword ptr [rcx + rdx + 0x10], xmm2
00000001400aef34 4883c220                       add rdx, 0x20
00000001400aef38 4839d0                         cmp rax, rdx
00000001400aef3b 75a3                           jne 0x1400aeee0
00000001400aef3d 4c39e8                         cmp rax, r13
00000001400aef40 747e                           je 0x1400aefc0
00000001400aef42 41f6c518                       test r13b, 0x18
00000001400aef46 7458                           je 0x1400aefa0
00000001400aef48 4889c2                         mov rdx, rax
00000001400aef4b 4c89e8                         mov rax, r13
00000001400aef4e 49b8f8ffffffffffff7f           movabs r8, 0x7ffffffffffffff8
00000001400aef58 4c21c0                         and rax, r8
00000001400aef5b 0f1f440000                     nop dword ptr [rax + rax]
00000001400aef60 f30f7e0411                     movq xmm0, qword ptr [rcx + rdx]
00000001400aef65 660f6fc8                       movdqa xmm1, xmm0
00000001400aef69 660ffcce                       paddb xmm1, xmm6
00000001400aef6d 660f6fd1                       movdqa xmm2, xmm1
00000001400aef71 660fded7                       pmaxub xmm2, xmm7
00000001400aef75 660f74d1                       pcmpeqb xmm2, xmm1
00000001400aef79 66410fdfd0                     pandn xmm2, xmm8
00000001400aef7e 660febd0                       por xmm2, xmm0
00000001400aef82 660fd61411                     movq qword ptr [rcx + rdx], xmm2
00000001400aef87 4883c208                       add rdx, 8
00000001400aef8b 4839d0                         cmp rax, rdx
00000001400aef8e 75d0                           jne 0x1400aef60
00000001400aef90 4c39e8                         cmp rax, r13
00000001400aef93 742b                           je 0x1400aefc0
00000001400aef95 66662e0f1f840000000000         nop word ptr cs:[rax + rax]
00000001400aefa0 440fb60401                     movzx r8d, byte ptr [rcx + rax]
00000001400aefa5 418d50bf                       lea edx, [r8 - 0x41]
00000001400aefa9 80fa1a                         cmp dl, 0x1a
00000001400aefac 0f92c2                         setb dl
00000001400aefaf c0e205                         shl dl, 5
00000001400aefb2 4408c2                         or dl, r8b
00000001400aefb5 881401                         mov byte ptr [rcx + rax], dl
00000001400aefb8 48ffc0                         inc rax
00000001400aefbb 4939c5                         cmp r13, rax
00000001400aefbe 75e0                           jne 0x1400aefa0
00000001400aefc0 4983fd0b                       cmp r13, 0xb
00000001400aefc4 0f85f2000000                   jne 0x1400af0bc
00000001400aefca 8b01                           mov eax, dword ptr [rcx]
00000001400aefcc ba70617463                     mov edx, 0x63746170
00000001400aefd1 31d0                           xor eax, edx
00000001400aefd3 0fb75104                       movzx edx, word ptr [rcx + 4]
00000001400aefd7 81f2682d0000                   xor edx, 0x2d68
00000001400aefdd 09c2                           or edx, eax
00000001400aefdf 0f85d7000000                   jne 0x1400af0bc
00000001400aefe5 42817c29fc2e6d7071             cmp dword ptr [rcx + r13 - 4], 0x71706d2e
00000001400aefee 0f85c8000000                   jne 0x1400af0bc
00000001400aeff4 0fb64106                       movzx eax, byte ptr [rcx + 6]
00000001400aeff8 8d50d0                         lea edx, [rax - 0x30]
00000001400aeffb 80fa0a                         cmp dl, 0xa
00000001400aeffe 720c                           jb 0x1400af00c
00000001400af000 24df                           and al, 0xdf
00000001400af002 04bf                           add al, 0xbf
00000001400af004 3c19                           cmp al, 0x19
00000001400af006 0f87b0000000                   ja 0x1400af0bc
00000001400af00c 4c89ea                         mov rdx, r13
00000001400af00f 4c8ba588000000                 mov r12, qword ptr [rbp + 0x88]
00000001400af016 4c8bbd90000000                 mov r15, qword ptr [rbp + 0x90]
00000001400af01d 4c8bad98000000                 mov r13, qword ptr [rbp + 0x98]
00000001400af024 0f1006                         movups xmm0, xmmword ptr [rsi]
00000001400af027 0f104e10                       movups xmm1, xmmword ptr [rsi + 0x10]
00000001400af02b 0f105620                       movups xmm2, xmmword ptr [rsi + 0x20]
00000001400af02f 0f294510                       movaps xmmword ptr [rbp + 0x10], xmm0
00000001400af033 0f294d20                       movaps xmmword ptr [rbp + 0x20], xmm1
00000001400af037 0f295530                       movaps xmmword ptr [rbp + 0x30], xmm2
00000001400af03b 488b4630                       mov rax, qword ptr [rsi + 0x30]
00000001400af03f 48894540                       mov qword ptr [rbp + 0x40], rax
00000001400af043 41b801000000                   mov r8d, 1
00000001400af049 e88231f5ff                     call 0x1400021d0
00000001400af04e 4983fcff                       cmp r12, -1
00000001400af052 0f8445020000                   je 0x1400af29d
00000001400af058 488b4540                       mov rax, qword ptr [rbp + 0x40]
00000001400af05c 48898580000000                 mov qword ptr [rbp + 0x80], rax
00000001400af063 660f6f4510                     movdqa xmm0, xmmword ptr [rbp + 0x10]
00000001400af068 660f6f4d20                     movdqa xmm1, xmmword ptr [rbp + 0x20]
00000001400af06d 660f6f5530                     movdqa xmm2, xmmword ptr [rbp + 0x30]
00000001400af072 660f7f5570                     movdqa xmmword ptr [rbp + 0x70], xmm2
00000001400af077 660f7f4d60                     movdqa xmmword ptr [rbp + 0x60], xmm1
00000001400af07c 660f7f4550                     movdqa xmmword ptr [rbp + 0x50], xmm0
00000001400af081 4983fcfe                       cmp r12, -2
00000001400af085 0f8531020000                   jne 0x1400af2bc
00000001400af08b 488b85e8000000                 mov rax, qword ptr [rbp + 0xe8]
00000001400af092 4989c4                         mov r12, rax
00000001400af095 483b8500010000                 cmp rax, qword ptr [rbp + 0x100]
00000001400af09c 0f85e7fcffff                   jne 0x1400aed89
00000001400af0a2 e9a6010000                     jmp 0x1400af24d
00000001400af0a7 4531e4                         xor r12d, r12d
00000001400af0aa 4c89e1                         mov rcx, r12
00000001400af0ad 488b95f8000000                 mov rdx, qword ptr [rbp + 0xf8]
00000001400af0b4 e8a2ec0f06                     call 0x1461add5b
00000001400af0b9 90                             nop
00000001400af0ba 0f0b                           ud2
00000001400af0bc 4c89ad00010000                 mov qword ptr [rbp + 0x100], r13
00000001400af0c3 eb13                           jmp 0x1400af0d8
00000001400af0c5 4c89ad00010000                 mov qword ptr [rbp + 0x100], r13
00000001400af0cc b801000000                     mov eax, 1
00000001400af0d1 488985f8000000                 mov qword ptr [rbp + 0xf8], rax
00000001400af0d8 488d8588000000                 lea rax, [rbp + 0x88]
00000001400af0df 488945c0                       mov qword ptr [rbp - 0x40], rax
00000001400af0e3 488d05f62ff5ff                 lea rax, [rip - 0xad00a]
00000001400af0ea 488945c8                       mov qword ptr [rbp - 0x38], rax
00000001400af0ee 488d155cd01006                 lea rdx, [rip + 0x610d05c]
00000001400af0f5 488d4da8                       lea rcx, [rbp - 0x58]
00000001400af0f9 4c8d45c0                       lea r8, [rbp - 0x40]
00000001400af0fd e89e8cf205                     call 0x145fd7da0
00000001400af102 90                             nop
00000001400af103 488d4da8                       lea rcx, [rbp - 0x58]
00000001400af107 e8b495f205                     call 0x145fd86c0
00000001400af10c 90                             nop
00000001400af10d 4989c4                         mov r12, rax
00000001400af110 4989d5                         mov r13, rdx
00000001400af113 488b9500010000                 mov rdx, qword ptr [rbp + 0x100]
00000001400af11a 4885d2                         test rdx, rdx
00000001400af11d 7412                           je 0x1400af131
00000001400af11f 41b801000000                   mov r8d, 1
00000001400af125 488b8df8000000                 mov rcx, qword ptr [rbp + 0xf8]
00000001400af12c e89f30f5ff                     call 0x1400021d0
00000001400af131 488b9588000000                 mov rdx, qword ptr [rbp + 0x88]
00000001400af138 4885d2                         test rdx, rdx
00000001400af13b 7412                           je 0x1400af14f
00000001400af13d 488b8d90000000                 mov rcx, qword ptr [rbp + 0x90]
00000001400af144 41b801000000                   mov r8d, 1
00000001400af14a e88130f5ff                     call 0x1400021d0
00000001400af14f 488b95a0000000                 mov rdx, qword ptr [rbp + 0xa0]
00000001400af156 4885d2                         test rdx, rdx
00000001400af159 7412                           je 0x1400af16d
00000001400af15b 488b8da8000000                 mov rcx, qword ptr [rbp + 0xa8]
00000001400af162 41b801000000                   mov r8d, 1
00000001400af168 e86330f5ff                     call 0x1400021d0
00000001400af16d 488b9dc0000000                 mov rbx, qword ptr [rbp + 0xc0]
00000001400af174 488bb5c8000000                 mov rsi, qword ptr [rbp + 0xc8]
00000001400af17b 4885f6                         test rsi, rsi
00000001400af17e 7432                           je 0x1400af1b2
00000001400af180 4c8d7308                       lea r14, [rbx + 8]
00000001400af184 eb13                           jmp 0x1400af199
00000001400af186 662e0f1f840000000000           nop word ptr cs:[rax + rax]
00000001400af190 4983c620                       add r14, 0x20
00000001400af194 48ffce                         dec rsi
00000001400af197 7419                           je 0x1400af1b2
00000001400af199 498b56f8                       mov rdx, qword ptr [r14 - 8]
00000001400af19d 4885d2                         test rdx, rdx
00000001400af1a0 74ee                           je 0x1400af190
00000001400af1a2 498b0e                         mov rcx, qword ptr [r14]
00000001400af1a5 41b801000000                   mov r8d, 1
00000001400af1ab e82030f5ff                     call 0x1400021d0
00000001400af1b0 ebde                           jmp 0x1400af190
00000001400af1b2 488b95b8000000                 mov rdx, qword ptr [rbp + 0xb8]
00000001400af1b9 4885d2                         test rdx, rdx
00000001400af1bc 7412                           je 0x1400af1d0
00000001400af1be 48c1e205                       shl rdx, 5
00000001400af1c2 41b808000000                   mov r8d, 8
00000001400af1c8 4889d9                         mov rcx, rbx
00000001400af1cb e80030f5ff                     call 0x1400021d0
00000001400af1d0 488bb5f0000000                 mov rsi, qword ptr [rbp + 0xf0]
00000001400af1d7 488b06                         mov rax, qword ptr [rsi]
00000001400af1da 488985f8000000                 mov qword ptr [rbp + 0xf8], rax
00000001400af1e1 4885c0                         test rax, rax
00000001400af1e4 7460                           je 0x1400af246
00000001400af1e6 4c89ade0000000                 mov qword ptr [rbp + 0xe0], r13
00000001400af1ed 4c89a5e8000000                 mov qword ptr [rbp + 0xe8], r12
00000001400af1f4 488b4608                       mov rax, qword ptr [rsi + 8]
00000001400af1f8 48898500010000                 mov qword ptr [rbp + 0x100], rax
00000001400af1ff 488b00                         mov rax, qword ptr [rax]
00000001400af202 4885c0                         test rax, rax
00000001400af205 740a                           je 0x1400af211
00000001400af207 488b8df8000000                 mov rcx, qword ptr [rbp + 0xf8]
00000001400af20e ffd0                           call rax
00000001400af210 90                             nop
00000001400af211 488b8500010000                 mov rax, qword ptr [rbp + 0x100]
00000001400af218 488b5008                       mov rdx, qword ptr [rax + 8]
00000001400af21c 4885d2                         test rdx, rdx
00000001400af21f 488bb5f0000000                 mov rsi, qword ptr [rbp + 0xf0]
00000001400af226 4c8ba5e8000000                 mov r12, qword ptr [rbp + 0xe8]
00000001400af22d 4c8bade0000000                 mov r13, qword ptr [rbp + 0xe0]
00000001400af234 7410                           je 0x1400af246
00000001400af236 4c8b4010                       mov r8, qword ptr [rax + 0x10]
00000001400af23a 488b8df8000000                 mov rcx, qword ptr [rbp + 0xf8]
00000001400af241 e88a2ff5ff                     call 0x1400021d0
00000001400af246 4c8926                         mov qword ptr [rsi], r12
00000001400af249 4c896e08                       mov qword ptr [rsi + 8], r13
00000001400af24d 488b85d8000000                 mov rax, qword ptr [rbp + 0xd8]
00000001400af254 48c700ffffffff                 mov qword ptr [rax], 0xffffffffffffffff
00000001400af25b 0f28b510010000                 movaps xmm6, xmmword ptr [rbp + 0x110]
00000001400af262 0f28bd20010000                 movaps xmm7, xmmword ptr [rbp + 0x120]
00000001400af269 440f288530010000               movaps xmm8, xmmword ptr [rbp + 0x130]
00000001400af271 440f288d40010000               movaps xmm9, xmmword ptr [rbp + 0x140]
00000001400af279 440f289550010000               movaps xmm10, xmmword ptr [rbp + 0x150]
00000001400af281 440f289d60010000               movaps xmm11, xmmword ptr [rbp + 0x160]
00000001400af289 4881c4f8010000                 add rsp, 0x1f8
00000001400af290 5b                             pop rbx
00000001400af291 5f                             pop rdi
00000001400af292 5e                             pop rsi
00000001400af293 415c                           pop r12
00000001400af295 415d                           pop r13
00000001400af297 415e                           pop r14
00000001400af299 415f                           pop r15
00000001400af29b 5d                             pop rbp
00000001400af29c c3                             ret
00000001400af29d 488bb5f0000000                 mov rsi, qword ptr [rbp + 0xf0]
00000001400af2a4 4d89fc                         mov r12, r15
00000001400af2a7 488b06                         mov rax, qword ptr [rsi]
00000001400af2aa 488985f8000000                 mov qword ptr [rbp + 0xf8], rax
00000001400af2b1 4885c0                         test rax, rax
00000001400af2b4 0f852cffffff                   jne 0x1400af1e6
00000001400af2ba eb8a                           jmp 0x1400af246
00000001400af2bc 488b8580000000                 mov rax, qword ptr [rbp + 0x80]
00000001400af2c3 488b8dd8000000                 mov rcx, qword ptr [rbp + 0xd8]
00000001400af2ca 48894148                       mov qword ptr [rcx + 0x48], rax
00000001400af2ce 4889c8                         mov rax, rcx
00000001400af2d1 0f284550                       movaps xmm0, xmmword ptr [rbp + 0x50]
00000001400af2d5 0f284d60                       movaps xmm1, xmmword ptr [rbp + 0x60]
00000001400af2d9 0f285570                       movaps xmm2, xmmword ptr [rbp + 0x70]
00000001400af2dd 0f115138                       movups xmmword ptr [rcx + 0x38], xmm2
00000001400af2e1 0f114928                       movups xmmword ptr [rcx + 0x28], xmm1
00000001400af2e5 0f114118                       movups xmmword ptr [rcx + 0x18], xmm0
00000001400af2e9 4c8921                         mov qword ptr [rcx], r12
00000001400af2ec 4c897908                       mov qword ptr [rcx + 8], r15
00000001400af2f0 4c896910                       mov qword ptr [rcx + 0x10], r13
00000001400af2f4 e962ffffff                     jmp 0x1400af25b
00000001400af2f9 4c89adf8000000                 mov qword ptr [rbp + 0xf8], r13
00000001400af300 e9a5fdffff                     jmp 0x1400af0aa
00000001400af305 488d05eca21006                 lea rax, [rip + 0x610a2ec]
00000001400af30c 4889442420                     mov qword ptr [rsp + 0x20], rax
00000001400af311 4889d9                         mov rcx, rbx
00000001400af314 4c89f2                         mov rdx, r14
00000001400af317 4531c0                         xor r8d, r8d
00000001400af31a e851ec0f06                     call 0x1461adf70
00000001400af31f 0f0b                           ud2
