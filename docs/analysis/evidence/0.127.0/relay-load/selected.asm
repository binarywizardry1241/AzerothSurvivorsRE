// packet-header
0000000145cbd1af 4983f909                       cmp r9, 9
0000000145cbd1b3 0f82590c0000                   jb 0x145cbde12
0000000145cbd1b9 410fb600                       movzx eax, byte ptr [r8]
0000000145cbd1bd 4883f804                       cmp rax, 4
0000000145cbd1c1 0f874b0c0000                   ja 0x145cbde12
0000000145cbd1c7 4889cf                         mov rdi, rcx
0000000145cbd1ca 4d8b7001                       mov r14, qword ptr [r8 + 1]
0000000145cbd1ce 488d0d4bfca501                 lea rcx, [rip + 0x1a5fc4b]
0000000145cbd1d5 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000145cbd1d9 4801c8                         add rax, rcx
0000000145cbd1dc ffe0                           jmp rax
// packet-variants
0000000145cbd22c 4983f910                       cmp r9, 0x10
0000000145cbd230 0f86dc0b0000                   jbe 0x145cbde12
0000000145cbd236 4d8b4809                       mov r9, qword ptr [r8 + 9]
0000000145cbd23a 4c89c8                         mov rax, r9
0000000145cbd23d 482500ffffff                   and rax, 0xffffffffffffff00
0000000145cbd243 48b90300000000000080           movabs rcx, 0x8000000000000003
0000000145cbd24d eb4c                           jmp 0x145cbd29b
0000000145cbd24f 4983f909                       cmp r9, 9
0000000145cbd253 0f84b90b0000                   je 0x145cbde12
0000000145cbd259 4531c9                         xor r9d, r9d
0000000145cbd25c 4180780900                     cmp byte ptr [r8 + 9], 0
0000000145cbd261 410f95c1                       setne r9b
0000000145cbd265 48b80100000000000080           movabs rax, 0x8000000000000001
0000000145cbd26f 488985e8000000                 mov qword ptr [rbp + 0xe8], rax
0000000145cbd276 31c0                           xor eax, eax
0000000145cbd278 eb40                           jmp 0x145cbd2ba
0000000145cbd27a 4983f910                       cmp r9, 0x10
0000000145cbd27e 0f868e0b0000                   jbe 0x145cbde12
0000000145cbd284 4d8b4809                       mov r9, qword ptr [r8 + 9]
0000000145cbd288 4c89c8                         mov rax, r9
0000000145cbd28b 482500ffffff                   and rax, 0xffffffffffffff00
0000000145cbd291 48b90200000000000080           movabs rcx, 0x8000000000000002
0000000145cbd29b 48898de8000000                 mov qword ptr [rbp + 0xe8], rcx
0000000145cbd2a2 eb16                           jmp 0x145cbd2ba
0000000145cbd2a4 31c0                           xor eax, eax
0000000145cbd2a6 48b90000000000000080           movabs rcx, 0x8000000000000000
0000000145cbd2b0 48898de8000000                 mov qword ptr [rbp + 0xe8], rcx
0000000145cbd2b7 4531c9                         xor r9d, r9d
0000000145cbd2ba 4c89f6                         mov rsi, r14
0000000145cbd2bd eb15                           jmp 0x145cbd2d4
// control-data-gate
0000000145cbd5f4 498b4dc0                       mov rcx, qword ptr [r13 - 0x40]
0000000145cbd5f8 488d4101                       lea rax, [rcx + 1]
0000000145cbd5fc 4939c6                         cmp r14, rax
0000000145cbd5ff 0f97c2                         seta dl
0000000145cbd602 418455f8                       test byte ptr [r13 - 8], dl
0000000145cbd606 0f84d1020000                   je 0x145cbd8dd
// control-reset
0000000145cbd798 498b8558ffffff                 mov rax, qword ptr [r13 - 0xa8]
0000000145cbd79f 49c745b000000000               mov qword ptr [r13 - 0x50], 0
0000000145cbd7a7 498945b8                       mov qword ptr [r13 - 0x48], rax
0000000145cbd7ab 41c645f800                     mov byte ptr [r13 - 8], 0
0000000145cbd7b0 41c78578ffffffffffffff         mov dword ptr [r13 - 0x88], 0xffffffff
// range-high-clamp
0000000145cbd7fb 498b45a0                       mov rax, qword ptr [r13 - 0x60]
0000000145cbd7ff 4c39e0                         cmp rax, r12
0000000145cbd802 4c0f42e0                       cmovb r12, rax
// range-slice-prefix
0000000145cbd854 4d8b8558ffffff                 mov r8, qword ptr [r13 - 0xa8]
0000000145cbd85b 4d85c0                         test r8, r8
0000000145cbd85e 0f849e010000                   je 0x145cbda02
0000000145cbd864 498b8d40ffffff                 mov rcx, qword ptr [r13 - 0xc0]
0000000145cbd86b 498b8550ffffff                 mov rax, qword ptr [r13 - 0xb0]
0000000145cbd872 31d2                           xor edx, edx
0000000145cbd874 4839c8                         cmp rax, rcx
0000000145cbd877 480f43d1                       cmovae rdx, rcx
0000000145cbd87b 4829d0                         sub rax, rdx
0000000145cbd87e 4989c9                         mov r9, rcx
0000000145cbd881 4929c1                         sub r9, rax
0000000145cbd884 4c89c2                         mov rdx, r8
0000000145cbd887 4c29ca                         sub rdx, r9
0000000145cbd88a 0f8778010000                   ja 0x145cbda08
0000000145cbd890 4901c0                         add r8, rax
0000000145cbd893 31d2                           xor edx, edx
0000000145cbd895 4c89c1                         mov rcx, r8
0000000145cbd898 e96b010000                     jmp 0x145cbda08
// ack-high-clamp
0000000145cbd89d 498b55a0                       mov rdx, qword ptr [r13 - 0x60]
0000000145cbd8a1 4839f2                         cmp rdx, rsi
0000000145cbd8a4 480f43d6                       cmovae rdx, rsi
// received-highwater
0000000145cbd8dd 498b55f0                       mov rdx, qword ptr [r13 - 0x10]
0000000145cbd8e1 4939d6                         cmp r14, rdx
0000000145cbd8e4 490f47d6                       cmova rdx, r14
0000000145cbd8e8 498955f0                       mov qword ptr [r13 - 0x10], rdx
0000000145cbd8ec 4939ce                         cmp r14, rcx
0000000145cbd8ef 7670                           jbe 0x145cbd961
// duplicate-ack
0000000145cbd961 498b45c8                       mov rax, qword ptr [r13 - 0x38]
0000000145cbd965 4983fe01                       cmp r14, 1
0000000145cbd969 4983d6ff                       adc r14, -1
0000000145cbd96d 4939c6                         cmp r14, rax
0000000145cbd970 4c0f43f0                       cmovae r14, rax
0000000145cbd974 4d8975c8                       mov qword ptr [r13 - 0x38], r14
// range-sent-prefix
0000000145cbda08 4d8b8548ffffff                 mov r8, qword ptr [r13 - 0xb8]
0000000145cbda0f 48c1e005                       shl rax, 5
0000000145cbda13 4c01c0                         add rax, r8
0000000145cbda16 48c1e105                       shl rcx, 5
0000000145cbda1a 4c01c1                         add rcx, r8
0000000145cbda1d 48c1e205                       shl rdx, 5
0000000145cbda21 4c01c2                         add rdx, r8
0000000145cbda24 48894558                       mov qword ptr [rbp + 0x58], rax
0000000145cbda28 48894d60                       mov qword ptr [rbp + 0x60], rcx
0000000145cbda2c 4c894568                       mov qword ptr [rbp + 0x68], r8
0000000145cbda30 48895570                       mov qword ptr [rbp + 0x70], rdx
0000000145cbda34 498b45b0                       mov rax, qword ptr [r13 - 0x50]
0000000145cbda38 48894578                       mov qword ptr [rbp + 0x78], rax
0000000145cbda3c 488d45a8                       lea rax, [rbp - 0x58]
0000000145cbda40 48898580000000                 mov qword ptr [rbp + 0x80], rax
0000000145cbda47 488d45f0                       lea rax, [rbp - 0x10]
0000000145cbda4b 48898588000000                 mov qword ptr [rbp + 0x88], rax
0000000145cbda52 488d85b0000000                 lea rax, [rbp + 0xb0]
0000000145cbda59 48898590000000                 mov qword ptr [rbp + 0x90], rax
0000000145cbda60 c6859800000000                 mov byte ptr [rbp + 0x98], 0
// contiguous-drain-bookkeeping
0000000145cbe05a 488b7548                       mov rsi, qword ptr [rbp + 0x48]
0000000145cbe05e 492975e8                       sub qword ptr [r13 - 0x18], rsi
0000000145cbe062 49ff45c0                       inc qword ptr [r13 - 0x40]
0000000145cbe066 4c8bb5c0000000                 mov r14, qword ptr [rbp + 0xc0]
0000000145cbe06d 4c3bb5b0000000                 cmp r14, qword ptr [rbp + 0xb0]
0000000145cbe074 0f8502ffffff                   jne 0x145cbdf7c
0000000145cbe07a 488d8db0000000                 lea rcx, [rbp + 0xb0]
0000000145cbe081 e84a3b3a00                     call 0x146061bd0
0000000145cbe086 90                             nop
0000000145cbe087 e9f0feffff                     jmp 0x145cbdf7c
0000000145cbe08c 49837de000                     cmp qword ptr [r13 - 0x20], 0
0000000145cbe091 7452                           je 0x145cbe0e5
0000000145cbe093 e868d23400                     call 0x14600b300
0000000145cbe098 90                             nop
0000000145cbe099 eb4f                           jmp 0x145cbe0ea
0000000145cbe09b c685fb00000001                 mov byte ptr [rbp + 0xfb], 1
0000000145cbe0a2 e859d23400                     call 0x14600b300
0000000145cbe0a7 90                             nop
0000000145cbe0a8 49894580                       mov qword ptr [r13 - 0x80], rax
0000000145cbe0ac 41895588                       mov dword ptr [r13 - 0x78], edx
// buffer-pressure-clock
0000000145cbe0b0 488945f0                       mov qword ptr [rbp - 0x10], rax
0000000145cbe0b4 8955f8                         mov dword ptr [rbp - 8], edx
0000000145cbe0b7 49817de800008000               cmp qword ptr [r13 - 0x18], 0x800000
0000000145cbe0bf 0f87bf000000                   ja 0x145cbe184
0000000145cbe0c5 c685fb00000001                 mov byte ptr [rbp + 0xfb], 1
0000000145cbe0cc 488d4df0                       lea rcx, [rbp - 0x10]
0000000145cbe0d0 e87bd33400                     call 0x14600b450
0000000145cbe0d5 90                             nop
0000000145cbe0d6 4885c0                         test rax, rax
0000000145cbe0d9 7877                           js 0x145cbe152
0000000145cbe0db f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145cbe0e0 e982000000                     jmp 0x145cbe167
0000000145cbe0e5 baffffffff                     mov edx, 0xffffffff
0000000145cbe0ea 49894580                       mov qword ptr [r13 - 0x80], rax
0000000145cbe0ee 41895588                       mov dword ptr [r13 - 0x78], edx
0000000145cbe0f2 41c74598ffffffff               mov dword ptr [r13 - 0x68], 0xffffffff
0000000145cbe0fa 488b85b0000000                 mov rax, qword ptr [rbp + 0xb0]
0000000145cbe101 488b8db8000000                 mov rcx, qword ptr [rbp + 0xb8]
0000000145cbe108 488b95c0000000                 mov rdx, qword ptr [rbp + 0xc0]
0000000145cbe10f 488d1452                       lea rdx, [rdx + rdx*2]
0000000145cbe113 488d14d1                       lea rdx, [rcx + rdx*8]
0000000145cbe117 48894d58                       mov qword ptr [rbp + 0x58], rcx
0000000145cbe11b 48894568                       mov qword ptr [rbp + 0x68], rax
0000000145cbe11f 48894d60                       mov qword ptr [rbp + 0x60], rcx
0000000145cbe123 48895570                       mov qword ptr [rbp + 0x70], rdx
0000000145cbe127 488d4df0                       lea rcx, [rbp - 0x10]
0000000145cbe12b 488d5558                       lea rdx, [rbp + 0x58]
0000000145cbe12f e85c0a0400                     call 0x145cfeb90
0000000145cbe134 90                             nop
0000000145cbe135 f30f6f45f0                     movdqu xmm0, xmmword ptr [rbp - 0x10]
0000000145cbe13a 660f7f85b0000000               movdqa xmmword ptr [rbp + 0xb0], xmm0
0000000145cbe142 488b4500                       mov rax, qword ptr [rbp]
0000000145cbe146 488985c0000000                 mov qword ptr [rbp + 0xc0], rax
0000000145cbe14d e95df8ffff                     jmp 0x145cbd9af
0000000145cbe152 4889c1                         mov rcx, rax
0000000145cbe155 48d1e9                         shr rcx, 1
0000000145cbe158 83e001                         and eax, 1
0000000145cbe15b 4809c8                         or rax, rcx
0000000145cbe15e f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145cbe163 f30f58c0                       addss xmm0, xmm0
0000000145cbe167 f30f2aca                       cvtsi2ss xmm1, edx
0000000145cbe16b f30f5e0d6db16000               divss xmm1, dword ptr [rip + 0x60b16d]
0000000145cbe173 f30f58c8                       addss xmm1, xmm0
0000000145cbe177 0f2e0dd24f5700                 ucomiss xmm1, dword ptr [rip + 0x574fd2]
0000000145cbe17e 0f86fd000000                   jbe 0x145cbe281
// buffer-flush-publication
0000000145cbe184 488b4610                       mov rax, qword ptr [rsi + 0x10]
0000000145cbe188 48894540                       mov qword ptr [rbp + 0x40], rax
0000000145cbe18c f30f6f06                       movdqu xmm0, xmmword ptr [rsi]
0000000145cbe190 660f7f4530                     movdqa xmmword ptr [rbp + 0x30], xmm0
0000000145cbe195 49c745d000000000               mov qword ptr [r13 - 0x30], 0
0000000145cbe19d 660fefc0                       pxor xmm0, xmm0
0000000145cbe1a1 f3410f7f45e0                   movdqu xmmword ptr [r13 - 0x20], xmm0
0000000145cbe1a7 41c74588ffffffff               mov dword ptr [r13 - 0x78], 0xffffffff
0000000145cbe1af 41c74598ffffffff               mov dword ptr [r13 - 0x68], 0xffffffff
0000000145cbe1b7 488b7530                       mov rsi, qword ptr [rbp + 0x30]
0000000145cbe1bb 4c8b7538                       mov r14, qword ptr [rbp + 0x38]
0000000145cbe1bf 4531ff                         xor r15d, r15d
0000000145cbe1c2 4989f4                         mov r12, rsi
0000000145cbe1c5 4885f6                         test rsi, rsi
0000000145cbe1c8 410f95c7                       setne r15b
0000000145cbe1cc 7404                           je 0x145cbe1d2
0000000145cbe1ce 4c8b6540                       mov r12, qword ptr [rbp + 0x40]
0000000145cbe1d2 4c897d58                       mov qword ptr [rbp + 0x58], r15
0000000145cbe1d6 48c7456000000000               mov qword ptr [rbp + 0x60], 0
0000000145cbe1de 48897568                       mov qword ptr [rbp + 0x68], rsi
0000000145cbe1e2 4c897570                       mov qword ptr [rbp + 0x70], r14
0000000145cbe1e6 4c897d78                       mov qword ptr [rbp + 0x78], r15
0000000145cbe1ea 48c7858000000000000000         mov qword ptr [rbp + 0x80], 0
0000000145cbe1f5 4889b588000000                 mov qword ptr [rbp + 0x88], rsi
0000000145cbe1fc 4c89b590000000                 mov qword ptr [rbp + 0x90], r14
0000000145cbe203 4c89a598000000                 mov qword ptr [rbp + 0x98], r12
0000000145cbe20a c685f900000001                 mov byte ptr [rbp + 0xf9], 1
0000000145cbe211 488d4d58                       lea rcx, [rbp + 0x58]
0000000145cbe215 e836def2ff                     call 0x145bec050
0000000145cbe21a 90                             nop
0000000145cbe21b 4885c0                         test rax, rax
0000000145cbe21e 498d4dc0                       lea rcx, [r13 - 0x40]
0000000145cbe222 480f44c1                       cmove rax, rcx
0000000145cbe226 488b00                         mov rax, qword ptr [rax]
// sender-credit
0000000145cbe8af 66480f6ec0                     movq xmm0, rax
0000000145cbe8b4 660f620594e95400               punpckldq xmm0, xmmword ptr [rip + 0x54e994]
0000000145cbe8bc 660f5c059ce95400               subpd xmm0, xmmword ptr [rip + 0x54e99c]
0000000145cbe8c4 660f28c8                       movapd xmm1, xmm0
0000000145cbe8c8 660f15c8                       unpckhpd xmm1, xmm0
0000000145cbe8cc f20f58c8                       addsd xmm1, xmm0
0000000145cbe8d0 0f57c0                         xorps xmm0, xmm0
0000000145cbe8d3 f20f2ac2                       cvtsi2sd xmm0, edx
0000000145cbe8d7 f20f5e0591e95400               divsd xmm0, qword ptr [rip + 0x54e991]
0000000145cbe8df f20f58c1                       addsd xmm0, xmm1
0000000145cbe8e3 f20f100d656b7201               movsd xmm1, qword ptr [rip + 0x1726b65]
0000000145cbe8eb f20f59c1                       mulsd xmm0, xmm1
0000000145cbe8ef f20f58c6                       addsd xmm0, xmm6
0000000145cbe8f3 f20f5dc1                       minsd xmm0, xmm1
0000000145cbe8f7 f20f118668010000               movsd qword ptr [rsi + 0x168], xmm0
// sender-gate-and-charge
0000000145cbe9c8 488b4fb0                       mov rcx, qword ptr [rdi - 0x50]
0000000145cbe9cc 483b8f58ffffff                 cmp rcx, qword ptr [rdi - 0xa8]
0000000145cbe9d3 0f83a2010000                   jae 0x145cbeb7b
0000000145cbe9d9 488b57b8                       mov rdx, qword ptr [rdi - 0x48]
0000000145cbe9dd f20f108668010000               movsd xmm0, qword ptr [rsi + 0x168]
0000000145cbe9e5 4839d1                         cmp rcx, rdx
0000000145cbe9e8 730a                           jae 0x145cbe9f4
0000000145cbe9ea 660f2ec6                       ucomisd xmm0, xmm6
0000000145cbe9ee 0f8693010000                   jbe 0x145cbeb87
0000000145cbe9f4 488b8750ffffff                 mov rax, qword ptr [rdi - 0xb0]
0000000145cbe9fb 4801c8                         add rax, rcx
0000000145cbe9fe 4c8b8740ffffff                 mov r8, qword ptr [rdi - 0xc0]
0000000145cbea05 4c39c0                         cmp rax, r8
0000000145cbea08 4d0f42c1                       cmovb r8, r9
0000000145cbea0c 4c29c0                         sub rax, r8
0000000145cbea0f 48c1e005                       shl rax, 5
0000000145cbea13 48038748ffffff                 add rax, qword ptr [rdi - 0xb8]
0000000145cbea1a 4839d1                         cmp rcx, rdx
0000000145cbea1d 7315                           jae 0x145cbea34
0000000145cbea1f 0f57c9                         xorps xmm1, xmm1
0000000145cbea22 f2480f2a4818                   cvtsi2sd xmm1, qword ptr [rax + 0x18]
0000000145cbea28 f20f5cc1                       subsd xmm0, xmm1
0000000145cbea2c f20f118668010000               movsd qword ptr [rsi + 0x168], xmm0
// pending-limit
0000000145cbf1c2 49817c24a800000001             cmp qword ptr [r12 - 0x58], 0x1000000
0000000145cbf1cb 0f86a6000000                   jbe 0x145cbf277
// ack-drain
0000000145cc1a30 4157                           push r15
0000000145cc1a32 4156                           push r14
0000000145cc1a34 4155                           push r13
0000000145cc1a36 4154                           push r12
0000000145cc1a38 56                             push rsi
0000000145cc1a39 57                             push rdi
0000000145cc1a3a 55                             push rbp
0000000145cc1a3b 53                             push rbx
0000000145cc1a3c 4883ec38                       sub rsp, 0x38
0000000145cc1a40 488b5918                       mov rbx, qword ptr [rcx + 0x18]
0000000145cc1a44 4885db                         test rbx, rbx
0000000145cc1a47 0f84af010000                   je 0x145cc1bfc
0000000145cc1a4d 4989d1                         mov r9, rdx
0000000145cc1a50 4889ce                         mov rsi, rcx
0000000145cc1a53 488b4110                       mov rax, qword ptr [rcx + 0x10]
0000000145cc1a57 4c8b31                         mov r14, qword ptr [rcx]
0000000145cc1a5a 4c8b7908                       mov r15, qword ptr [rcx + 8]
0000000145cc1a5e 31c9                           xor ecx, ecx
0000000145cc1a60 4c39f0                         cmp rax, r14
0000000145cc1a63 490f43ce                       cmovae rcx, r14
0000000145cc1a67 4889c2                         mov rdx, rax
0000000145cc1a6a 4829ca                         sub rdx, rcx
0000000145cc1a6d 48c1e205                       shl rdx, 5
0000000145cc1a71 4d390c17                       cmp qword ptr [r15 + rdx], r9
0000000145cc1a75 0f8781010000                   ja 0x145cc1bfc
0000000145cc1a7b 488d4801                       lea rcx, [rax + 1]
0000000145cc1a7f 31d2                           xor edx, edx
0000000145cc1a81 4c39f1                         cmp rcx, r14
0000000145cc1a84 490f43d6                       cmovae rdx, r14
0000000145cc1a88 48f7da                         neg rdx
0000000145cc1a8b 488d3c10                       lea rdi, [rax + rdx]
0000000145cc1a8f 48ffc7                         inc rdi
0000000145cc1a92 48897e10                       mov qword ptr [rsi + 0x10], rdi
0000000145cc1a96 4c8d5bff                       lea r11, [rbx - 1]
0000000145cc1a9a 4c895e18                       mov qword ptr [rsi + 0x18], r11
0000000145cc1a9e 48c1e005                       shl rax, 5
0000000145cc1aa2 498b540708                     mov rdx, qword ptr [r15 + rax + 8]
0000000145cc1aa7 4883faff                       cmp rdx, -1
0000000145cc1aab 0f845c010000                   je 0x145cc1c0d
0000000145cc1ab1 4d8d0407                       lea r8, [r15 + rax]
0000000145cc1ab5 498b4c0710                     mov rcx, qword ptr [r15 + rax + 0x10]
0000000145cc1aba 4c8b5668                       mov r10, qword ptr [rsi + 0x68]
0000000145cc1abe 4d2b5018                       sub r10, qword ptr [r8 + 0x18]
0000000145cc1ac2 4c8b6e70                       mov r13, qword ptr [rsi + 0x70]
0000000145cc1ac6 4983fd01                       cmp r13, 1
0000000145cc1aca 4983d5ff                       adc r13, -1
0000000145cc1ace 4c895668                       mov qword ptr [rsi + 0x68], r10
0000000145cc1ad2 4c896e70                       mov qword ptr [rsi + 0x70], r13
0000000145cc1ad6 488b6e78                       mov rbp, qword ptr [rsi + 0x78]
0000000145cc1ada 4883fd01                       cmp rbp, 1
0000000145cc1ade 4883d5ff                       adc rbp, -1
0000000145cc1ae2 48896e78                       mov qword ptr [rsi + 0x78], rbp
0000000145cc1ae6 4885d2                         test rdx, rdx
0000000145cc1ae9 741f                           je 0x145cc1b0a
0000000145cc1aeb 41b801000000                   mov r8d, 1
0000000145cc1af1 4c894c2428                     mov qword ptr [rsp + 0x28], r9
0000000145cc1af6 4d89d4                         mov r12, r10
0000000145cc1af9 e8d20634fa                     call 0x1400021d0
0000000145cc1afe 4c8d5bff                       lea r11, [rbx - 1]
0000000145cc1b02 4d89e2                         mov r10, r12
0000000145cc1b05 4c8b4c2428                     mov r9, qword ptr [rsp + 0x28]
0000000145cc1b0a 4d85db                         test r11, r11
0000000145cc1b0d 0f84dd000000                   je 0x145cc1bf0
0000000145cc1b13 4883c3fe                       add rbx, -2
0000000145cc1b17 4889742430                     mov qword ptr [rsp + 0x30], rsi
0000000145cc1b1c eb0f                           jmp 0x145cc1b2d
0000000145cc1b1e 6690                           nop
0000000145cc1b20 4c89e7                         mov rdi, r12
0000000145cc1b23 4883c3ff                       add rbx, -1
0000000145cc1b27 0f83c3000000                   jae 0x145cc1bf0
0000000145cc1b2d 4c39f7                         cmp rdi, r14
0000000145cc1b30 4c89f0                         mov rax, r14
0000000145cc1b33 b900000000                     mov ecx, 0
0000000145cc1b38 480f42c1                       cmovb rax, rcx
0000000145cc1b3c 4889f9                         mov rcx, rdi
0000000145cc1b3f 4829c1                         sub rcx, rax
0000000145cc1b42 48c1e105                       shl rcx, 5
0000000145cc1b46 4d390c0f                       cmp qword ptr [r15 + rcx], r9
0000000145cc1b4a 0f87a0000000                   ja 0x145cc1bf0
0000000145cc1b50 488d4701                       lea rax, [rdi + 1]
0000000145cc1b54 4c39f0                         cmp rax, r14
0000000145cc1b57 b800000000                     mov eax, 0
0000000145cc1b5c 490f43c6                       cmovae rax, r14
0000000145cc1b60 48f7d8                         neg rax
0000000145cc1b63 4c8d2407                       lea r12, [rdi + rax]
0000000145cc1b67 49ffc4                         inc r12
0000000145cc1b6a 4c896610                       mov qword ptr [rsi + 0x10], r12
0000000145cc1b6e 48895e18                       mov qword ptr [rsi + 0x18], rbx
0000000145cc1b72 48c1e705                       shl rdi, 5
0000000145cc1b76 498b543f08                     mov rdx, qword ptr [r15 + rdi + 8]
0000000145cc1b7b 4883faff                       cmp rdx, -1
0000000145cc1b7f 0f8488000000                   je 0x145cc1c0d
0000000145cc1b85 498d043f                       lea rax, [r15 + rdi]
0000000145cc1b89 4c2b5018                       sub r10, qword ptr [rax + 0x18]
0000000145cc1b8d 498b4c3f10                     mov rcx, qword ptr [r15 + rdi + 0x10]
0000000145cc1b92 4c895668                       mov qword ptr [rsi + 0x68], r10
0000000145cc1b96 4983fd01                       cmp r13, 1
0000000145cc1b9a 4983d5ff                       adc r13, -1
0000000145cc1b9e 4c896e70                       mov qword ptr [rsi + 0x70], r13
0000000145cc1ba2 4883fd01                       cmp rbp, 1
0000000145cc1ba6 4883d5ff                       adc rbp, -1
0000000145cc1baa 48896e78                       mov qword ptr [rsi + 0x78], rbp
0000000145cc1bae 4885d2                         test rdx, rdx
0000000145cc1bb1 0f8469ffffff                   je 0x145cc1b20
0000000145cc1bb7 41b801000000                   mov r8d, 1
0000000145cc1bbd 4c89cf                         mov rdi, r9
0000000145cc1bc0 4889ee                         mov rsi, rbp
0000000145cc1bc3 4c89ed                         mov rbp, r13
0000000145cc1bc6 4d89f5                         mov r13, r14
0000000145cc1bc9 4d89fe                         mov r14, r15
0000000145cc1bcc 4d89d7                         mov r15, r10
0000000145cc1bcf e8fc0534fa                     call 0x1400021d0
0000000145cc1bd4 4d89fa                         mov r10, r15
0000000145cc1bd7 4d89f7                         mov r15, r14
0000000145cc1bda 4d89ee                         mov r14, r13
0000000145cc1bdd 4989ed                         mov r13, rbp
0000000145cc1be0 4889f5                         mov rbp, rsi
0000000145cc1be3 488b742430                     mov rsi, qword ptr [rsp + 0x30]
0000000145cc1be8 4989f9                         mov r9, rdi
0000000145cc1beb e930ffffff                     jmp 0x145cc1b20
0000000145cc1bf0 e80b973400                     call 0x14600b300
0000000145cc1bf5 48894620                       mov qword ptr [rsi + 0x20], rax
0000000145cc1bf9 895628                         mov dword ptr [rsi + 0x28], edx
0000000145cc1bfc 4883c438                       add rsp, 0x38
0000000145cc1c00 5b                             pop rbx
0000000145cc1c01 5d                             pop rbp
0000000145cc1c02 5f                             pop rdi
0000000145cc1c03 5e                             pop rsi
0000000145cc1c04 415c                           pop r12
0000000145cc1c06 415d                           pop r13
0000000145cc1c08 415e                           pop r14
0000000145cc1c0a 415f                           pop r15
0000000145cc1c0c c3                             ret
0000000145cc1c0d 488d0dbc417201                 lea rcx, [rip + 0x17241bc]
0000000145cc1c14 4c8d05c5417201                 lea r8, [rip + 0x17241c5]
0000000145cc1c1b ba09000000                     mov edx, 9
0000000145cc1c20 e8fb6f5400                     call 0x146208c20
0000000145cc1c25 0f0b                           ud2
// missing-range
0000000145cc1c30 55                             push rbp
0000000145cc1c31 56                             push rsi
0000000145cc1c32 57                             push rdi
0000000145cc1c33 53                             push rbx
0000000145cc1c34 4883ec38                       sub rsp, 0x38
0000000145cc1c38 488d6c2430                     lea rbp, [rsp + 0x30]
0000000145cc1c3d 48c74500feffffff               mov qword ptr [rbp], 0xfffffffffffffffe
0000000145cc1c45 4889d7                         mov rdi, rdx
0000000145cc1c48 4889ce                         mov rsi, rcx
0000000145cc1c4b 488b8290000000                 mov rax, qword ptr [rdx + 0x90]
0000000145cc1c52 4885c0                         test rax, rax
0000000145cc1c55 0f84a1000000                   je 0x145cc1cfc
0000000145cc1c5b 4883bfa000000000               cmp qword ptr [rdi + 0xa0], 0
0000000145cc1c63 0f8493000000                   je 0x145cc1cfc
0000000145cc1c69 488b8f98000000                 mov rcx, qword ptr [rdi + 0x98]
0000000145cc1c70 4885c9                         test rcx, rcx
0000000145cc1c73 7479                           je 0x145cc1cee
0000000145cc1c75 4889ca                         mov rdx, rcx
0000000145cc1c78 4883e207                       and rdx, 7
0000000145cc1c7c 0f84da000000                   je 0x145cc1d5c
0000000145cc1c82 4531c0                         xor r8d, r8d
0000000145cc1c85 66662e0f1f840000000000         nop word ptr cs:[rax + rax]
0000000145cc1c90 488b8070010000                 mov rax, qword ptr [rax + 0x170]
0000000145cc1c97 49ffc0                         inc r8
0000000145cc1c9a 4c39c2                         cmp rdx, r8
0000000145cc1c9d 75f1                           jne 0x145cc1c90
0000000145cc1c9f 4889ca                         mov rdx, rcx
0000000145cc1ca2 4c29c2                         sub rdx, r8
0000000145cc1ca5 4883f908                       cmp rcx, 8
0000000145cc1ca9 7243                           jb 0x145cc1cee
0000000145cc1cab 0f1f440000                     nop dword ptr [rax + rax]
0000000145cc1cb0 488b8070010000                 mov rax, qword ptr [rax + 0x170]
0000000145cc1cb7 488b8070010000                 mov rax, qword ptr [rax + 0x170]
0000000145cc1cbe 488b8070010000                 mov rax, qword ptr [rax + 0x170]
0000000145cc1cc5 488b8070010000                 mov rax, qword ptr [rax + 0x170]
0000000145cc1ccc 488b8070010000                 mov rax, qword ptr [rax + 0x170]
0000000145cc1cd3 488b8070010000                 mov rax, qword ptr [rax + 0x170]
0000000145cc1cda 488b8070010000                 mov rax, qword ptr [rax + 0x170]
0000000145cc1ce1 488b8070010000                 mov rax, qword ptr [rax + 0x170]
0000000145cc1ce8 4883c2f8                       add rdx, -8
0000000145cc1cec 75c2                           jne 0x145cc1cb0
0000000145cc1cee 6683b86a01000000               cmp word ptr [rax + 0x16a], 0
0000000145cc1cf6 7426                           je 0x145cc1d1e
0000000145cc1cf8 31c9                           xor ecx, ecx
0000000145cc1cfa eb53                           jmp 0x145cc1d4f
0000000145cc1cfc 488b9fb0000000                 mov rbx, qword ptr [rdi + 0xb0]
0000000145cc1d03 483b9f80000000                 cmp rbx, qword ptr [rdi + 0x80]
0000000145cc1d0a 0f862b010000                   jbe 0x145cc1e3b
0000000145cc1d10 8b5748                         mov edx, dword ptr [rdi + 0x48]
0000000145cc1d13 83faff                         cmp edx, -1
0000000145cc1d16 7453                           je 0x145cc1d6b
0000000145cc1d18 488b4740                       mov rax, qword ptr [rdi + 0x40]
0000000145cc1d1c eb59                           jmp 0x145cc1d77
0000000145cc1d1e 4889c2                         mov rdx, rax
0000000145cc1d21 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145cc1d30 488b02                         mov rax, qword ptr [rdx]
0000000145cc1d33 4885c0                         test rax, rax
0000000145cc1d36 0f843c010000                   je 0x145cc1e78
0000000145cc1d3c 0fb78a68010000                 movzx ecx, word ptr [rdx + 0x168]
0000000145cc1d43 4889c2                         mov rdx, rax
0000000145cc1d46 663b886a010000                 cmp cx, word ptr [rax + 0x16a]
0000000145cc1d4d 73e1                           jae 0x145cc1d30
0000000145cc1d4f 0fb7c9                         movzx ecx, cx
0000000145cc1d52 488b5cc808                     mov rbx, qword ptr [rax + rcx*8 + 8]
0000000145cc1d57 48ffcb                         dec rbx
0000000145cc1d5a eb7c                           jmp 0x145cc1dd8
0000000145cc1d5c 4889ca                         mov rdx, rcx
0000000145cc1d5f 4883f908                       cmp rcx, 8
0000000145cc1d63 0f8347ffffff                   jae 0x145cc1cb0
0000000145cc1d69 eb83                           jmp 0x145cc1cee
0000000145cc1d6b e890953400                     call 0x14600b300
0000000145cc1d70 48894740                       mov qword ptr [rdi + 0x40], rax
0000000145cc1d74 895748                         mov dword ptr [rdi + 0x48], edx
0000000145cc1d77 488945f0                       mov qword ptr [rbp - 0x10], rax
0000000145cc1d7b 8955f8                         mov dword ptr [rbp - 8], edx
0000000145cc1d7e 488d4df0                       lea rcx, [rbp - 0x10]
0000000145cc1d82 e8c9963400                     call 0x14600b450
0000000145cc1d87 4885c0                         test rax, rax
0000000145cc1d8a 7807                           js 0x145cc1d93
0000000145cc1d8c f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145cc1d91 eb15                           jmp 0x145cc1da8
0000000145cc1d93 4889c1                         mov rcx, rax
0000000145cc1d96 48d1e9                         shr rcx, 1
0000000145cc1d99 83e001                         and eax, 1
0000000145cc1d9c 4809c8                         or rax, rcx
0000000145cc1d9f f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145cc1da4 f30f58c0                       addss xmm0, xmm0
0000000145cc1da8 f30f2aca                       cvtsi2ss xmm1, edx
0000000145cc1dac f30f5e0d2c756000               divss xmm1, dword ptr [rip + 0x60752c]
0000000145cc1db4 f30f58c8                       addss xmm1, xmm0
0000000145cc1db8 0f2e0d91135700                 ucomiss xmm1, dword ptr [rip + 0x571391]
0000000145cc1dbf 7617                           jbe 0x145cc1dd8
0000000145cc1dc1 48899f80000000                 mov qword ptr [rdi + 0x80], rbx
0000000145cc1dc8 c74748ffffffff                 mov dword ptr [rdi + 0x48], 0xffffffff
0000000145cc1dcf c74758ffffffff                 mov dword ptr [rdi + 0x58], 0xffffffff
0000000145cc1dd6 eb63                           jmp 0x145cc1e3b
0000000145cc1dd8 8b4758                         mov eax, dword ptr [rdi + 0x58]
0000000145cc1ddb 83f8ff                         cmp eax, -1
0000000145cc1dde 7464                           je 0x145cc1e44
0000000145cc1de0 488b4f50                       mov rcx, qword ptr [rdi + 0x50]
0000000145cc1de4 48894df0                       mov qword ptr [rbp - 0x10], rcx
0000000145cc1de8 8945f8                         mov dword ptr [rbp - 8], eax
0000000145cc1deb 488d4df0                       lea rcx, [rbp - 0x10]
0000000145cc1def e85c963400                     call 0x14600b450
0000000145cc1df4 4885c0                         test rax, rax
0000000145cc1df7 780a                           js 0x145cc1e03
0000000145cc1df9 0f57c0                         xorps xmm0, xmm0
0000000145cc1dfc f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145cc1e01 eb18                           jmp 0x145cc1e1b
0000000145cc1e03 4889c1                         mov rcx, rax
0000000145cc1e06 48d1e9                         shr rcx, 1
0000000145cc1e09 83e001                         and eax, 1
0000000145cc1e0c 4809c8                         or rax, rcx
0000000145cc1e0f 0f57c0                         xorps xmm0, xmm0
0000000145cc1e12 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145cc1e17 f30f58c0                       addss xmm0, xmm0
0000000145cc1e1b 0f57c9                         xorps xmm1, xmm1
0000000145cc1e1e f30f2aca                       cvtsi2ss xmm1, edx
0000000145cc1e22 f30f5e0db6746000               divss xmm1, dword ptr [rip + 0x6074b6]
0000000145cc1e2a f30f58c8                       addss xmm1, xmm0
0000000145cc1e2e f30f1005b2125700               movss xmm0, dword ptr [rip + 0x5712b2]
0000000145cc1e36 0f2ec1                         ucomiss xmm0, xmm1
0000000145cc1e39 7609                           jbe 0x145cc1e44
0000000145cc1e3b 48c706ffffffff                 mov qword ptr [rsi], 0xffffffffffffffff
0000000145cc1e42 eb2b                           jmp 0x145cc1e6f
0000000145cc1e44 e8b7943400                     call 0x14600b300
0000000145cc1e49 48894750                       mov qword ptr [rdi + 0x50], rax
0000000145cc1e4d 895758                         mov dword ptr [rdi + 0x58], edx
0000000145cc1e50 488b8780000000                 mov rax, qword ptr [rdi + 0x80]
0000000145cc1e57 48ffc0                         inc rax
0000000145cc1e5a 48b90200000000000080           movabs rcx, 0x8000000000000002
0000000145cc1e64 48890e                         mov qword ptr [rsi], rcx
0000000145cc1e67 48894608                       mov qword ptr [rsi + 8], rax
0000000145cc1e6b 48895e10                       mov qword ptr [rsi + 0x10], rbx
0000000145cc1e6f 4883c438                       add rsp, 0x38
0000000145cc1e73 5b                             pop rbx
0000000145cc1e74 5f                             pop rdi
0000000145cc1e75 5e                             pop rsi
0000000145cc1e76 5d                             pop rbp
0000000145cc1e77 c3                             ret
0000000145cc1e78 488d0db1433c01                 lea rcx, [rip + 0x13c43b1]
0000000145cc1e7f e8dc6d5400                     call 0x146208c60
0000000145cc1e84 90                             nop
0000000145cc1e85 0f0b                           ud2
// range-reply-iterator
0000000145bebb40 4157                           push r15
0000000145bebb42 4156                           push r14
0000000145bebb44 4154                           push r12
0000000145bebb46 56                             push rsi
0000000145bebb47 57                             push rdi
0000000145bebb48 55                             push rbp
0000000145bebb49 53                             push rbx
0000000145bebb4a 4883ec20                       sub rsp, 0x20
0000000145bebb4e 48c7c6ffffffff                 mov rsi, 0xffffffffffffffff
0000000145bebb55 b808000000                     mov eax, 8
0000000145bebb5a 807a4000                       cmp byte ptr [rdx + 0x40], 0
0000000145bebb5e 0f8542010000                   jne 0x145bebca6
0000000145bebb64 4c8b4a20                       mov r9, qword ptr [rdx + 0x20]
0000000145bebb68 4d85c9                         test r9, r9
0000000145bebb6b 0f8435010000                   je 0x145bebca6
0000000145bebb71 488b1a                         mov rbx, qword ptr [rdx]
0000000145bebb74 488b7a08                       mov rdi, qword ptr [rdx + 8]
0000000145bebb78 4c8b5228                       mov r10, qword ptr [rdx + 0x28]
0000000145bebb7c 4c8b5a30                       mov r11, qword ptr [rdx + 0x30]
0000000145bebb80 49ffc9                         dec r9
0000000145bebb83 666666662e0f1f840000000000     nop word ptr cs:[rax + rax]
0000000145bebb90 4839fb                         cmp rbx, rdi
0000000145bebb93 742f                           je 0x145bebbc4
0000000145bebb95 4c8d4320                       lea r8, [rbx + 0x20]
0000000145bebb99 4c8902                         mov qword ptr [rdx], r8
0000000145bebb9c 4c894a20                       mov qword ptr [rdx + 0x20], r9
0000000145bebba0 488b1b                         mov rbx, qword ptr [rbx]
0000000145bebba3 49391a                         cmp qword ptr [r10], rbx
0000000145bebba6 410f96c6                       setbe r14b
0000000145bebbaa 493b1b                         cmp rbx, qword ptr [r11]
0000000145bebbad 400f96c5                       setbe bpl
0000000145bebbb1 4420f5                         and bpl, r14b
0000000145bebbb4 4983e901                       sub r9, 1
0000000145bebbb8 724d                           jb 0x145bebc07
0000000145bebbba 4c89c3                         mov rbx, r8
0000000145bebbbd 4084ed                         test bpl, bpl
0000000145bebbc0 74ce                           je 0x145bebb90
0000000145bebbc2 eb43                           jmp 0x145bebc07
0000000145bebbc4 488b5a10                       mov rbx, qword ptr [rdx + 0x10]
0000000145bebbc8 488b7a18                       mov rdi, qword ptr [rdx + 0x18]
0000000145bebbcc 0f1f4000                       nop dword ptr [rax]
0000000145bebbd0 4839fb                         cmp rbx, rdi
0000000145bebbd3 0f84cd000000                   je 0x145bebca6
0000000145bebbd9 4c8d4320                       lea r8, [rbx + 0x20]
0000000145bebbdd 4c894210                       mov qword ptr [rdx + 0x10], r8
0000000145bebbe1 4c894a20                       mov qword ptr [rdx + 0x20], r9
0000000145bebbe5 488b1b                         mov rbx, qword ptr [rbx]
0000000145bebbe8 49391a                         cmp qword ptr [r10], rbx
0000000145bebbeb 410f96c6                       setbe r14b
0000000145bebbef 493b1b                         cmp rbx, qword ptr [r11]
0000000145bebbf2 400f96c5                       setbe bpl
0000000145bebbf6 4420f5                         and bpl, r14b
0000000145bebbf9 4983e901                       sub r9, 1
0000000145bebbfd 7208                           jb 0x145bebc07
0000000145bebbff 4c89c3                         mov rbx, r8
0000000145bebc02 4084ed                         test bpl, bpl
0000000145bebc05 74c9                           je 0x145bebbd0
0000000145bebc07 4084ed                         test bpl, bpl
0000000145bebc0a 0f8496000000                   je 0x145bebca6
0000000145bebc10 4983c0e0                       add r8, -0x20
0000000145bebc14 4c8b5238                       mov r10, qword ptr [rdx + 0x38]
0000000145bebc18 4d8b1a                         mov r11, qword ptr [r10]
0000000145bebc1b 4d8b4818                       mov r9, qword ptr [r8 + 0x18]
0000000145bebc1f 4d01d9                         add r9, r11
0000000145bebc22 4d890a                         mov qword ptr [r10], r9
0000000145bebc25 4d85db                         test r11, r11
0000000145bebc28 740f                           je 0x145bebc39
0000000145bebc2a 4981f901000400                 cmp r9, 0x40001
0000000145bebc31 7206                           jb 0x145bebc39
0000000145bebc33 c6424001                       mov byte ptr [rdx + 0x40], 1
0000000145bebc37 eb6d                           jmp 0x145bebca6
0000000145bebc39 498b7018                       mov rsi, qword ptr [r8 + 0x18]
0000000145bebc3d 4885f6                         test rsi, rsi
0000000145bebc40 7910                           jns 0x145bebc52
0000000145bebc42 4531f6                         xor r14d, r14d
0000000145bebc45 4c89f1                         mov rcx, r14
0000000145bebc48 4889f2                         mov rdx, rsi
0000000145bebc4b e81bcd6100                     call 0x14620896b
0000000145bebc50 0f0b                           ud2
0000000145bebc52 4d8b38                         mov r15, qword ptr [r8]
0000000145bebc55 743a                           je 0x145bebc91
0000000145bebc57 4989cc                         mov r12, rcx
0000000145bebc5a 498b5810                       mov rbx, qword ptr [r8 + 0x10]
0000000145bebc5e e89d6541fa                     call 0x140002200
0000000145bebc63 41be01000000                   mov r14d, 1
0000000145bebc69 ba01000000                     mov edx, 1
0000000145bebc6e 4889f1                         mov rcx, rsi
0000000145bebc71 e84a6541fa                     call 0x1400021c0
0000000145bebc76 4885c0                         test rax, rax
0000000145bebc79 74ca                           je 0x145bebc45
0000000145bebc7b 4889c7                         mov rdi, rax
0000000145bebc7e 4889c1                         mov rcx, rax
0000000145bebc81 4889da                         mov rdx, rbx
0000000145bebc84 4989f0                         mov r8, rsi
0000000145bebc87 e88f5a4700                     call 0x14606171b
0000000145bebc8c 4c89e1                         mov rcx, r12
0000000145bebc8f eb05                           jmp 0x145bebc96
0000000145bebc91 bf01000000                     mov edi, 1
0000000145bebc96 4c8939                         mov qword ptr [rcx], r15
0000000145bebc99 48897108                       mov qword ptr [rcx + 8], rsi
0000000145bebc9d 48897910                       mov qword ptr [rcx + 0x10], rdi
0000000145bebca1 b818000000                     mov eax, 0x18
0000000145bebca6 48893401                       mov qword ptr [rcx + rax], rsi
0000000145bebcaa 4889c8                         mov rax, rcx
0000000145bebcad 4883c420                       add rsp, 0x20
0000000145bebcb1 5b                             pop rbx
0000000145bebcb2 5d                             pop rbp
0000000145bebcb3 5f                             pop rdi
0000000145bebcb4 5e                             pop rsi
0000000145bebcb5 415c                           pop r12
0000000145bebcb7 415e                           pop r14
0000000145bebcb9 415f                           pop r15
0000000145bebcbb c3                             ret
// peer-control-and-ack-clocks
0000000145cba79a 4885c0                         test rax, rax
0000000145cba79d 780a                           js 0x145cba7a9
0000000145cba79f 0f57c0                         xorps xmm0, xmm0
0000000145cba7a2 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145cba7a7 eb18                           jmp 0x145cba7c1
0000000145cba7a9 4889c1                         mov rcx, rax
0000000145cba7ac 48d1e9                         shr rcx, 1
0000000145cba7af 83e001                         and eax, 1
0000000145cba7b2 4809c8                         or rax, rcx
0000000145cba7b5 0f57c0                         xorps xmm0, xmm0
0000000145cba7b8 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145cba7bd f30f58c0                       addss xmm0, xmm0
0000000145cba7c1 0f57c9                         xorps xmm1, xmm1
0000000145cba7c4 f30f2aca                       cvtsi2ss xmm1, edx
0000000145cba7c8 f30f5ecf                       divss xmm1, xmm7
0000000145cba7cc f30f58c8                       addss xmm1, xmm0
0000000145cba7d0 410f2ec8                       ucomiss xmm1, xmm8
0000000145cba7d4 734a                           jae 0x145cba820
0000000145cba7d6 410f2ef1                       ucomiss xmm6, xmm9
0000000145cba7da 0f8201020000                   jb 0x145cba9e1
0000000145cba7e0 488b5fb0                       mov rbx, qword ptr [rdi - 0x50]
0000000145cba7e4 4885db                         test rbx, rbx
0000000145cba7e7 0f94c0                         sete al
0000000145cba7ea 0a47f8                         or al, byte ptr [rdi - 8]
0000000145cba7ed 0f85df000000                   jne 0x145cba8d2
0000000145cba7f3 488d8f60ffffff                 lea rcx, [rdi - 0xa0]
0000000145cba7fa c6855f03000001                 mov byte ptr [rbp + 0x35f], 1
0000000145cba801 e84a0c3500                     call 0x14600b450
0000000145cba806 90                             nop
0000000145cba807 4885c0                         test rax, rax
0000000145cba80a 0f8895000000                   js 0x145cba8a5
0000000145cba810 0f57c0                         xorps xmm0, xmm0
0000000145cba813 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145cba818 e9a0000000                     jmp 0x145cba8bd
// peer-tail-clock
0000000145cba8a5 4889c1                         mov rcx, rax
0000000145cba8a8 48d1e9                         shr rcx, 1
0000000145cba8ab 83e001                         and eax, 1
0000000145cba8ae 4809c8                         or rax, rcx
0000000145cba8b1 0f57c0                         xorps xmm0, xmm0
0000000145cba8b4 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145cba8b9 f30f58c0                       addss xmm0, xmm0
0000000145cba8bd 0f57c9                         xorps xmm1, xmm1
0000000145cba8c0 f30f2aca                       cvtsi2ss xmm1, edx
0000000145cba8c4 f30f5ecf                       divss xmm1, xmm7
0000000145cba8c8 f30f58c8                       addss xmm1, xmm0
0000000145cba8cc 440f2ec9                       ucomiss xmm9, xmm1
0000000145cba8d0 7663                           jbe 0x145cba935
0000000145cba8d2 4c8b67c0                       mov r12, qword ptr [rdi - 0x40]
0000000145cba8d6 4c3b67c8                       cmp r12, qword ptr [rdi - 0x38]
0000000145cba8da 0f8601010000                   jbe 0x145cba9e1
0000000145cba8e0 4c8967c8                       mov qword ptr [rdi - 0x38], r12
// oldest-payload-clock
0000000145cbaac8 4885c0                         test rax, rax
0000000145cbaacb 780a                           js 0x145cbaad7
0000000145cbaacd 0f57c0                         xorps xmm0, xmm0
0000000145cbaad0 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145cbaad5 eb18                           jmp 0x145cbaaef
0000000145cbaad7 4889c1                         mov rcx, rax
0000000145cbaada 48d1e9                         shr rcx, 1
0000000145cbaadd 83e001                         and eax, 1
0000000145cbaae0 4809c8                         or rax, rcx
0000000145cbaae3 0f57c0                         xorps xmm0, xmm0
0000000145cbaae6 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145cbaaeb f30f58c0                       addss xmm0, xmm0
0000000145cbaaef 0f57c9                         xorps xmm1, xmm1
0000000145cbaaf2 f30f2aca                       cvtsi2ss xmm1, edx
0000000145cbaaf6 f30f5ecf                       divss xmm1, xmm7
0000000145cbaafa f30f58c8                       addss xmm1, xmm0
0000000145cbaafe 440f2ed1                       ucomiss xmm10, xmm1
0000000145cbab02 4c8ba548030000                 mov r12, qword ptr [rbp + 0x348]
0000000145cbab09 0f87e1fbffff                   ja 0x145cba6f0
// global-ack-clock
0000000145cbac4e 0f2e356b825700                 ucomiss xmm6, dword ptr [rip + 0x57826b]
0000000145cbac55 7224                           jb 0x145cbac7b
0000000145cbac57 c6855f03000001                 mov byte ptr [rbp + 0x35f], 1
0000000145cbac5e e89d063500                     call 0x14600b300
0000000145cbac63 90                             nop
0000000145cbac64 4c8ba548030000                 mov r12, qword ptr [rbp + 0x348]
0000000145cbac6b 4989842458010000               mov qword ptr [r12 + 0x158], rax
0000000145cbac73 4189942460010000               mov dword ptr [r12 + 0x160], edx
