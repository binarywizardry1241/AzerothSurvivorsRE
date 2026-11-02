; Current0.120.2 PE-declared helper extent; native decoded instructions, not original source.
0000000145b53040 55                             push rbp
0000000145b53041 4157                           push r15
0000000145b53043 4156                           push r14
0000000145b53045 4155                           push r13
0000000145b53047 4154                           push r12
0000000145b53049 56                             push rsi
0000000145b5304a 57                             push rdi
0000000145b5304b 53                             push rbx
0000000145b5304c b888130000                     mov eax, 0x1388
0000000145b53051 e86a724500                     call 0x145faa2c0
0000000145b53056 4829c4                         sub rsp, rax
0000000145b53059 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145b53061 48c78500130000feffffff         mov qword ptr [rbp + 0x1300], 0xfffffffffffffffe
0000000145b5306c 4889d7                         mov rdi, rdx
0000000145b5306f 4889ce                         mov rsi, rcx
0000000145b53072 4d85c0                         test r8, r8
0000000145b53075 740f                           je 0x145b53086
0000000145b53077 4c8bb798090000                 mov r14, qword ptr [rdi + 0x998]
0000000145b5307e 4d89f7                         mov r15, r14
0000000145b53081 4d29c7                         sub r15, r8
0000000145b53084 7334                           jae 0x145b530ba
0000000145b53086 488d97b0010000                 lea rdx, [rdi + 0x1b0]
0000000145b5308d 488d8d38090000                 lea rcx, [rbp + 0x938]
0000000145b53094 e8a7af4200                     call 0x145f7e040
0000000145b53099 90                             nop
0000000145b5309a 4889f9                         mov rcx, rdi
0000000145b5309d e88e8f0100                     call 0x145b6c030
0000000145b530a2 90                             nop
0000000145b530a3 488b8548090000                 mov rax, qword ptr [rbp + 0x948]
0000000145b530aa 48894610                       mov qword ptr [rsi + 0x10], rax
0000000145b530ae 0f108538090000                 movups xmm0, xmmword ptr [rbp + 0x938]
0000000145b530b5 e9a1020000                     jmp 0x145b5335b
0000000145b530ba 4889b5d0120000                 mov qword ptr [rbp + 0x12d0], rsi
0000000145b530c1 4c8985c8120000                 mov qword ptr [rbp + 0x12c8], r8
0000000145b530c8 498d40ff                       lea rax, [r8 - 1]
0000000145b530cc 4c39f0                         cmp rax, r14
0000000145b530cf 488985f0120000                 mov qword ptr [rbp + 0x12f0], rax
0000000145b530d6 0f83ae020000                   jae 0x145b5338a
0000000145b530dc 488bb790090000                 mov rsi, qword ptr [rdi + 0x990]
0000000145b530e3 4869d890090000                 imul rbx, rax, 0x990
0000000145b530ea 4c8d241e                       lea r12, [rsi + rbx]
0000000145b530ee 4c8b2c1e                       mov r13, qword ptr [rsi + rbx]
0000000145b530f2 488d141e                       lea rdx, [rsi + rbx]
0000000145b530f6 4883c208                       add rdx, 8
0000000145b530fa 488d8d38090000                 lea rcx, [rbp + 0x938]
0000000145b53101 41b888090000                   mov r8d, 0x988
0000000145b53107 e81f7d4500                     call 0x145faae2b
0000000145b5310c 488d141e                       lea rdx, [rsi + rbx]
0000000145b53110 4881c290090000                 add rdx, 0x990
0000000145b53117 4d69c790090000                 imul r8, r15, 0x990
0000000145b5311e 4c89e1                         mov rcx, r12
0000000145b53121 e8117d4500                     call 0x145faae37
0000000145b53126 49ffce                         dec r14
0000000145b53129 4c89b798090000                 mov qword ptr [rdi + 0x998], r14
0000000145b53130 4983fd02                       cmp r13, 2
0000000145b53134 0f8450020000                   je 0x145b5338a
0000000145b5313a 4c896da8                       mov qword ptr [rbp - 0x58], r13
0000000145b5313e 488d4db0                       lea rcx, [rbp - 0x50]
0000000145b53142 488d9538090000                 lea rdx, [rbp + 0x938]
0000000145b53149 41b888090000                   mov r8d, 0x988
0000000145b5314f e8d77c4500                     call 0x145faae2b
0000000145b53154 80bf9d0c000001                 cmp byte ptr [rdi + 0xc9d], 1
0000000145b5315b 488bb5f0120000                 mov rsi, qword ptr [rbp + 0x12f0]
0000000145b53162 0f85f6000000                   jne 0x145b5325e
0000000145b53168 488b87980b0000                 mov rax, qword ptr [rdi + 0xb98]
0000000145b5316f 488985d8120000                 mov qword ptr [rbp + 0x12d8], rax
0000000145b53176 488d8740060000                 lea rax, [rdi + 0x640]
0000000145b5317d 488b8f48060000                 mov rcx, qword ptr [rdi + 0x648]
0000000145b53184 488b9750060000                 mov rdx, qword ptr [rdi + 0x650]
0000000145b5318b 48c7875006000000000000         mov qword ptr [rdi + 0x650], 0
0000000145b53196 48899550090000                 mov qword ptr [rbp + 0x950], rdx
0000000145b5319d 48c1e205                       shl rdx, 5
0000000145b531a1 4801ca                         add rdx, rcx
0000000145b531a4 48c7855809000000000000         mov qword ptr [rbp + 0x958], 0
0000000145b531af 48898d38090000                 mov qword ptr [rbp + 0x938], rcx
0000000145b531b6 48899540090000                 mov qword ptr [rbp + 0x940], rdx
0000000145b531bd 48898548090000                 mov qword ptr [rbp + 0x948], rax
0000000145b531c4 488d8f480a0000                 lea rcx, [rdi + 0xa48]
0000000145b531cb 4c8dbdd8120000                 lea r15, [rbp + 0x12d8]
0000000145b531d2 4c89bd60090000                 mov qword ptr [rbp + 0x960], r15
0000000145b531d9 c685ff12000001                 mov byte ptr [rbp + 0x12ff], 1
0000000145b531e0 488d9538090000                 lea rdx, [rbp + 0x938]
0000000145b531e7 e894a90f00                     call 0x145c4db80
0000000145b531ec 90                             nop
0000000145b531ed 488d8758060000                 lea rax, [rdi + 0x658]
0000000145b531f4 488b8f60060000                 mov rcx, qword ptr [rdi + 0x660]
0000000145b531fb 488b9768060000                 mov rdx, qword ptr [rdi + 0x668]
0000000145b53202 48c7876806000000000000         mov qword ptr [rdi + 0x668], 0
0000000145b5320d 4c8d0452                       lea r8, [rdx + rdx*2]
0000000145b53211 4e8d04c1                       lea r8, [rcx + r8*8]
0000000145b53215 48899550090000                 mov qword ptr [rbp + 0x950], rdx
0000000145b5321c 48c7855809000000000000         mov qword ptr [rbp + 0x958], 0
0000000145b53227 48898d38090000                 mov qword ptr [rbp + 0x938], rcx
0000000145b5322e 4c898540090000                 mov qword ptr [rbp + 0x940], r8
0000000145b53235 48898548090000                 mov qword ptr [rbp + 0x948], rax
0000000145b5323c 488d8f600a0000                 lea rcx, [rdi + 0xa60]
0000000145b53243 4c89bd60090000                 mov qword ptr [rbp + 0x960], r15
0000000145b5324a c685ff12000001                 mov byte ptr [rbp + 0x12ff], 1
0000000145b53251 488d9538090000                 lea rdx, [rbp + 0x938]
0000000145b53258 e853a80f00                     call 0x145c4dab0
0000000145b5325d 90                             nop
0000000145b5325e 488d55a8                       lea rdx, [rbp - 0x58]
0000000145b53262 4889f9                         mov rcx, rdi
0000000145b53265 e8068f0300                     call 0x145b8c170
0000000145b5326a 488b85c8120000                 mov rax, qword ptr [rbp + 0x12c8]
0000000145b53271 488987980b0000                 mov qword ptr [rdi + 0xb98], rax
0000000145b53278 488b97e0020000                 mov rdx, qword ptr [rdi + 0x2e0]
0000000145b5327f 4c8b87e8020000                 mov r8, qword ptr [rdi + 0x2e8]
0000000145b53286 c685ff12000001                 mov byte ptr [rbp + 0x12ff], 1
0000000145b5328d 488d8dd8120000                 lea rcx, [rbp + 0x12d8]
0000000145b53294 4989f9                         mov r9, rdi
0000000145b53297 e85424ffff                     call 0x145b456f0
0000000145b5329c 90                             nop
0000000145b5329d c685fe12000001                 mov byte ptr [rbp + 0x12fe], 1
0000000145b532a4 4889f9                         mov rcx, rdi
0000000145b532a7 e8848d0100                     call 0x145b6c030
0000000145b532ac 90                             nop
0000000145b532ad 48c787980b000000000000         mov qword ptr [rdi + 0xb98], 0
0000000145b532b8 4c8d7da8                       lea r15, [rbp - 0x58]
0000000145b532bc 4889f9                         mov rcx, rdi
0000000145b532bf 4c89fa                         mov rdx, r15
0000000145b532c2 e8a98e0300                     call 0x145b8c170
0000000145b532c7 488d8d38090000                 lea rcx, [rbp + 0x938]
0000000145b532ce 41b890090000                   mov r8d, 0x990
0000000145b532d4 4c89fa                         mov rdx, r15
0000000145b532d7 e84f7b4500                     call 0x145faae2b
0000000145b532dc 4c8bbf98090000                 mov r15, qword ptr [rdi + 0x998]
0000000145b532e3 4939f7                         cmp r15, rsi
0000000145b532e6 0f8289000000                   jb 0x145b53375
0000000145b532ec 488d8f88090000                 lea rcx, [rdi + 0x988]
0000000145b532f3 4c3b39                         cmp r15, qword ptr [rcx]
0000000145b532f6 7506                           jne 0x145b532fe
0000000145b532f8 e8e3de5d00                     call 0x1461311e0
0000000145b532fd 90                             nop
0000000145b532fe 48039f90090000                 add rbx, qword ptr [rdi + 0x990]
0000000145b53305 4c89f8                         mov rax, r15
0000000145b53308 4829f0                         sub rax, rsi
0000000145b5330b 7616                           jbe 0x145b53323
0000000145b5330d 488d8b90090000                 lea rcx, [rbx + 0x990]
0000000145b53314 4c69c090090000                 imul r8, rax, 0x990
0000000145b5331b 4889da                         mov rdx, rbx
0000000145b5331e e8147b4500                     call 0x145faae37
0000000145b53323 488d9538090000                 lea rdx, [rbp + 0x938]
0000000145b5332a 41b890090000                   mov r8d, 0x990
0000000145b53330 4889d9                         mov rcx, rbx
0000000145b53333 e8f37a4500                     call 0x145faae2b
0000000145b53338 49ffc7                         inc r15
0000000145b5333b 4c89bf98090000                 mov qword ptr [rdi + 0x998], r15
0000000145b53342 488b85e8120000                 mov rax, qword ptr [rbp + 0x12e8]
0000000145b53349 488bb5d0120000                 mov rsi, qword ptr [rbp + 0x12d0]
0000000145b53350 48894610                       mov qword ptr [rsi + 0x10], rax
0000000145b53354 0f1085d8120000                 movups xmm0, xmmword ptr [rbp + 0x12d8]
0000000145b5335b 0f1106                         movups xmmword ptr [rsi], xmm0
0000000145b5335e 4889f0                         mov rax, rsi
0000000145b53361 4881c488130000                 add rsp, 0x1388
0000000145b53368 5b                             pop rbx
0000000145b53369 5f                             pop rdi
0000000145b5336a 5e                             pop rsi
0000000145b5336b 415c                           pop r12
0000000145b5336d 415d                           pop r13
0000000145b5336f 415e                           pop r14
0000000145b53371 415f                           pop r15
0000000145b53373 5d                             pop rbp
0000000145b53374 c3                             ret
0000000145b53375 4c8d05d473aa01                 lea r8, [rip + 0x1aa73d4]
0000000145b5337c 4889f1                         mov rcx, rsi
0000000145b5337f 4c89fa                         mov rdx, r15
0000000145b53382 e86ded5f00                     call 0x1461520f4
0000000145b53387 90                             nop
0000000145b53388 0f0b                           ud2
0000000145b5338a 4c8d05a773aa01                 lea r8, [rip + 0x1aa73a7]
0000000145b53391 488b8df0120000                 mov rcx, qword ptr [rbp + 0x12f0]
0000000145b53398 4c89f2                         mov rdx, r14
0000000145b5339b e8dbed5f00                     call 0x14615217b
0000000145b533a0 0f0b                           ud2
