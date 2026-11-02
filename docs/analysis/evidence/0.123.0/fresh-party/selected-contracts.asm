// service-field-bindings
0000000145bd7db6 498d8798010000                 lea rax, [r15 + 0x198]
0000000145bd7dbd 488945f8                       mov qword ptr [rbp - 8], rax
0000000145bd7dc1 498d87b8010000                 lea rax, [r15 + 0x1b8]
0000000145bd7dc8 488985a0020000                 mov qword ptr [rbp + 0x2a0], rax
0000000145bd7dcf 498d4768                       lea rax, [r15 + 0x68]
0000000145bd7dd3 48894548                       mov qword ptr [rbp + 0x48], rax
0000000145bd7dd7 498d87c8010000                 lea rax, [r15 + 0x1c8]
0000000145bd7dde 488985b8020000                 mov qword ptr [rbp + 0x2b8], rax
0000000145bd7de5 498d4740                       lea rax, [r15 + 0x40]
0000000145bd7de9 488985c0020000                 mov qword ptr [rbp + 0x2c0], rax
// service-dispatch
0000000145bd7ff4 48b90000000000000080           movabs rcx, 0x8000000000000000
0000000145bd7ffe 4831c8                         xor rax, rcx
0000000145bd8001 4885ff                         test rdi, rdi
0000000145bd8004 b90a000000                     mov ecx, 0xa
0000000145bd8009 480f49c1                       cmovns rax, rcx
0000000145bd800d 48ffc8                         dec rax
0000000145bd8010 4883f80b                       cmp rax, 0xb
0000000145bd8014 0f8776060000                   ja 0x145bd8690
0000000145bd801a 488d0d7b9eac01                 lea rcx, [rip + 0x1ac9e7b]
0000000145bd8021 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000145bd8025 4801c8                         add rax, rcx
0000000145bd8028 ffe0                           jmp rax
// hosted-reset
0000000145bd8229 488b85c8000000                 mov rax, qword ptr [rbp + 0xc8]
0000000145bd8230 488985e0020000                 mov qword ptr [rbp + 0x2e0], rax
0000000145bd8237 488b85d0000000                 mov rax, qword ptr [rbp + 0xd0]
0000000145bd823e 488985f0020000                 mov qword ptr [rbp + 0x2f0], rax
0000000145bd8245 488bb5d8000000                 mov rsi, qword ptr [rbp + 0xd8]
0000000145bd824c 488b8db8020000                 mov rcx, qword ptr [rbp + 0x2b8]
0000000145bd8253 e8387f0000                     call 0x145be0190
0000000145bd8258 c685ef02000001                 mov byte ptr [rbp + 0x2ef], 1
0000000145bd825f 488b8dc0020000                 mov rcx, qword ptr [rbp + 0x2c0]
0000000145bd8266 31d2                           xor edx, edx
0000000145bd8268 e883400f00                     call 0x145ccc2f0
0000000145bd826d 90                             nop
0000000145bd826e 488bbd00030000                 mov rdi, qword ptr [rbp + 0x300]
0000000145bd8275 48c7475000000000               mov qword ptr [rdi + 0x50], 0
0000000145bd827d 66c787f90100000000             mov word ptr [rdi + 0x1f9], 0
// joined-reset
0000000145bd80ff 488b85c8000000                 mov rax, qword ptr [rbp + 0xc8]
0000000145bd8106 488985e0020000                 mov qword ptr [rbp + 0x2e0], rax
0000000145bd810d 488b85d0000000                 mov rax, qword ptr [rbp + 0xd0]
0000000145bd8114 488985f0020000                 mov qword ptr [rbp + 0x2f0], rax
0000000145bd811b 488bb5d8000000                 mov rsi, qword ptr [rbp + 0xd8]
0000000145bd8122 488bbd00030000                 mov rdi, qword ptr [rbp + 0x300]
0000000145bd8129 c687f801000001                 mov byte ptr [rdi + 0x1f8], 1
0000000145bd8130 488b8db8020000                 mov rcx, qword ptr [rbp + 0x2b8]
0000000145bd8137 e854800000                     call 0x145be0190
0000000145bd813c c685ee02000001                 mov byte ptr [rbp + 0x2ee], 1
0000000145bd8143 488b8dc0020000                 mov rcx, qword ptr [rbp + 0x2c0]
0000000145bd814a 31d2                           xor edx, edx
0000000145bd814c e89f410f00                     call 0x145ccc2f0
0000000145bd8151 90                             nop
0000000145bd8152 48c7475000000000               mov qword ptr [rdi + 0x50], 0
0000000145bd815a 66c787f90100000000             mov word ptr [rdi + 0x1f9], 0
// closed-reset
0000000145bd82fa 488b9dc8000000                 mov rbx, qword ptr [rbp + 0xc8]
0000000145bd8301 488b85d0000000                 mov rax, qword ptr [rbp + 0xd0]
0000000145bd8308 488985e0020000                 mov qword ptr [rbp + 0x2e0], rax
0000000145bd830f 488bbdd8000000                 mov rdi, qword ptr [rbp + 0xd8]
0000000145bd8316 488b8d00030000                 mov rcx, qword ptr [rbp + 0x300]
0000000145bd831d c681f801000000                 mov byte ptr [rcx + 0x1f8], 0
0000000145bd8324 488b4160                       mov rax, qword ptr [rcx + 0x60]
0000000145bd8328 48c74160ffffffff               mov qword ptr [rcx + 0x60], 0xffffffffffffffff
0000000145bd8330 4883f8ff                       cmp rax, -1
0000000145bd8334 48899df0020000                 mov qword ptr [rbp + 0x2f0], rbx
0000000145bd833b 746f                           je 0x145bd83ac
0000000145bd833d 48898540010000                 mov qword ptr [rbp + 0x140], rax
0000000145bd8344 41b8e0000000                   mov r8d, 0xe0
0000000145bd834a 488d8d48010000                 lea rcx, [rbp + 0x148]
0000000145bd8351 488b5548                       mov rdx, qword ptr [rbp + 0x48]
0000000145bd8355 e8f1cc4200                     call 0x14600504b
0000000145bd835a 488bb510020000                 mov rsi, qword ptr [rbp + 0x210]
0000000145bd8361 488b9d18020000                 mov rbx, qword ptr [rbp + 0x218]
0000000145bd8368 488d8d30020000                 lea rcx, [rbp + 0x230]
0000000145bd836f 488d154a90ac01                 lea rdx, [rip + 0x1ac904a]
0000000145bd8376 e8a5c72800                     call 0x145e64b20
0000000145bd837b 90                             nop
0000000145bd837c 4889f1                         mov rcx, rsi
0000000145bd837f 488d9530020000                 lea rdx, [rbp + 0x230]
0000000145bd8386 ff5318                         call qword ptr [rbx + 0x18]
0000000145bd8389 90                             nop
0000000145bd838a 4889f1                         mov rcx, rsi
0000000145bd838d ff5330                         call qword ptr [rbx + 0x30]
0000000145bd8390 90                             nop
0000000145bd8391 c6850b03000001                 mov byte ptr [rbp + 0x30b], 1
0000000145bd8398 488d8d40010000                 lea rcx, [rbp + 0x140]
0000000145bd839f e85cc3ffff                     call 0x145bd4700
0000000145bd83a4 90                             nop
0000000145bd83a5 488b9df0020000                 mov rbx, qword ptr [rbp + 0x2f0]
0000000145bd83ac 488b8db8020000                 mov rcx, qword ptr [rbp + 0x2b8]
0000000145bd83b3 e8d87d0000                     call 0x145be0190
// inner-map-clear
0000000145be0190 4157                           push r15
0000000145be0192 4156                           push r14
0000000145be0194 4155                           push r13
0000000145be0196 4154                           push r12
0000000145be0198 56                             push rsi
0000000145be0199 57                             push rdi
0000000145be019a 55                             push rbp
0000000145be019b 53                             push rbx
0000000145be019c 4883ec48                       sub rsp, 0x48
0000000145be01a0 488b5918                       mov rbx, qword ptr [rcx + 0x18]
0000000145be01a4 4885db                         test rbx, rbx
0000000145be01a7 0f84e1010000                   je 0x145be038e
0000000145be01ad 48894c2428                     mov qword ptr [rsp + 0x28], rcx
0000000145be01b2 4c8b21                         mov r12, qword ptr [rcx]
0000000145be01b5 66410f6f0424                   movdqa xmm0, xmmword ptr [r12]
0000000145be01bb 4d8d742410                     lea r14, [r12 + 0x10]
0000000145be01c0 66440fd7e8                     pmovmskb r13d, xmm0
0000000145be01c5 41f7d5                         not r13d
0000000145be01c8 4c89642420                     mov qword ptr [rsp + 0x20], r12
0000000145be01cd eb14                           jmp 0x145be01e3
0000000145be01cf 90                             nop
0000000145be01d0 418d45ff                       lea eax, [r13 - 1]
0000000145be01d4 4421e8                         and eax, r13d
0000000145be01d7 4189c5                         mov r13d, eax
0000000145be01da 48ffcb                         dec rbx
0000000145be01dd 0f8463010000                   je 0x145be0346
0000000145be01e3 664585ed                       test r13w, r13w
0000000145be01e7 7525                           jne 0x145be020e
0000000145be01e9 0f1f8000000000                 nop dword ptr [rax]
0000000145be01f0 66410f6f06                     movdqa xmm0, xmmword ptr [r14]
0000000145be01f5 4981c400f9ffff                 add r12, -0x700
0000000145be01fc 4983c610                       add r14, 0x10
0000000145be0200 66440fd7e8                     pmovmskb r13d, xmm0
0000000145be0205 4181f5ffff0000                 xor r13d, 0xffff
0000000145be020c 74e2                           je 0x145be01f0
0000000145be020e f3410fbcc5                     tzcnt eax, r13d
0000000145be0213 48f7d8                         neg rax
0000000145be0216 486bc070                       imul rax, rax, 0x70
0000000145be021a 498d2c04                       lea rbp, [r12 + rax]
0000000145be021e 4d8b7c04b0                     mov r15, qword ptr [r12 + rax - 0x50]
0000000145be0223 4d85ff                         test r15, r15
0000000145be0226 0f84a4000000                   je 0x145be02d0
0000000145be022c 48895c2440                     mov qword ptr [rsp + 0x40], rbx
0000000145be0231 488b45a8                       mov rax, qword ptr [rbp - 0x58]
0000000145be0235 488b5598                       mov rdx, qword ptr [rbp - 0x68]
0000000145be0239 48896c2438                     mov qword ptr [rsp + 0x38], rbp
0000000145be023e 488b7da0                       mov rdi, qword ptr [rbp - 0x60]
0000000145be0242 4839d0                         cmp rax, rdx
0000000145be0245 4889d1                         mov rcx, rdx
0000000145be0248 41b900000000                   mov r9d, 0
0000000145be024e 490f42c9                       cmovb rcx, r9
0000000145be0252 4989c0                         mov r8, rax
0000000145be0255 4929c8                         sub r8, rcx
0000000145be0258 4989d2                         mov r10, rdx
0000000145be025b 4d29c2                         sub r10, r8
0000000145be025e 4b8d2c38                       lea rbp, [r8 + r15]
0000000145be0262 4c89fe                         mov rsi, r15
0000000145be0265 4c89542430                     mov qword ptr [rsp + 0x30], r10
0000000145be026a 4c29d6                         sub rsi, r10
0000000145be026d 490f42f1                       cmovb rsi, r9
0000000145be0271 480f47ea                       cmova rbp, rdx
0000000145be0275 4c29c5                         sub rbp, r8
0000000145be0278 0f8582000000                   jne 0x145be0300
0000000145be027e 4c397c2430                     cmp qword ptr [rsp + 0x30], r15
0000000145be0283 488b5c2440                     mov rbx, qword ptr [rsp + 0x40]
0000000145be0288 488b6c2438                     mov rbp, qword ptr [rsp + 0x38]
0000000145be028d 7341                           jae 0x145be02d0
0000000145be028f 4883c710                       add rdi, 0x10
0000000145be0293 eb14                           jmp 0x145be02a9
0000000145be0295 66662e0f1f840000000000         nop word ptr cs:[rax + rax]
0000000145be02a0 4883c720                       add rdi, 0x20
0000000145be02a4 48ffce                         dec rsi
0000000145be02a7 7427                           je 0x145be02d0
0000000145be02a9 488b57f8                       mov rdx, qword ptr [rdi - 8]
0000000145be02ad 4885d2                         test rdx, rdx
0000000145be02b0 74ee                           je 0x145be02a0
0000000145be02b2 488b0f                         mov rcx, qword ptr [rdi]
0000000145be02b5 41b801000000                   mov r8d, 1
0000000145be02bb e8101f42fa                     call 0x1400021d0
0000000145be02c0 ebde                           jmp 0x145be02a0
0000000145be02c2 66666666662e0f1f840000000000   nop word ptr cs:[rax + rax]
0000000145be02d0 488b5598                       mov rdx, qword ptr [rbp - 0x68]
0000000145be02d4 4885d2                         test rdx, rdx
0000000145be02d7 0f84f3feffff                   je 0x145be01d0
0000000145be02dd 488b4da0                       mov rcx, qword ptr [rbp - 0x60]
0000000145be02e1 48c1e205                       shl rdx, 5
0000000145be02e5 41b808000000                   mov r8d, 8
0000000145be02eb e8e01e42fa                     call 0x1400021d0
0000000145be02f0 e9dbfeffff                     jmp 0x145be01d0
0000000145be02f5 66662e0f1f840000000000         nop word ptr cs:[rax + rax]
0000000145be0300 48c1e005                       shl rax, 5
0000000145be0304 48c1e105                       shl rcx, 5
0000000145be0308 4829c8                         sub rax, rcx
0000000145be030b 488d1c07                       lea rbx, [rdi + rax]
0000000145be030f 4883c310                       add rbx, 0x10
0000000145be0313 eb18                           jmp 0x145be032d
0000000145be0315 66662e0f1f840000000000         nop word ptr cs:[rax + rax]
0000000145be0320 4883c320                       add rbx, 0x20
0000000145be0324 48ffcd                         dec rbp
0000000145be0327 0f8451ffffff                   je 0x145be027e
0000000145be032d 488b53f8                       mov rdx, qword ptr [rbx - 8]
0000000145be0331 4885d2                         test rdx, rdx
0000000145be0334 74ea                           je 0x145be0320
0000000145be0336 488b0b                         mov rcx, qword ptr [rbx]
0000000145be0339 41b801000000                   mov r8d, 1
0000000145be033f e88c1e42fa                     call 0x1400021d0
0000000145be0344 ebda                           jmp 0x145be0320
0000000145be0346 488b7c2428                     mov rdi, qword ptr [rsp + 0x28]
0000000145be034b 488b7708                       mov rsi, qword ptr [rdi + 8]
0000000145be034f 4885f6                         test rsi, rsi
0000000145be0352 742c                           je 0x145be0380
0000000145be0354 4c8d4611                       lea r8, [rsi + 0x11]
0000000145be0358 488b4c2420                     mov rcx, qword ptr [rsp + 0x20]
0000000145be035d b2ff                           mov dl, 0xff
0000000145be035f e8f94c4200                     call 0x14600505d
0000000145be0364 488d4601                       lea rax, [rsi + 1]
0000000145be0368 4889c1                         mov rcx, rax
0000000145be036b 48c1e903                       shr rcx, 3
0000000145be036f 4883e0f8                       and rax, 0xfffffffffffffff8
0000000145be0373 4829c8                         sub rax, rcx
0000000145be0376 4883fe08                       cmp rsi, 8
0000000145be037a 480f42c6                       cmovb rax, rsi
0000000145be037e eb02                           jmp 0x145be0382
0000000145be0380 31c0                           xor eax, eax
0000000145be0382 48c7471800000000               mov qword ptr [rdi + 0x18], 0
0000000145be038a 48894710                       mov qword ptr [rdi + 0x10], rax
0000000145be038e 4883c448                       add rsp, 0x48
0000000145be0392 5b                             pop rbx
0000000145be0393 5d                             pop rbp
0000000145be0394 5f                             pop rdi
0000000145be0395 5e                             pop rsi
0000000145be0396 415c                           pop r12
0000000145be0398 415d                           pop r13
0000000145be039a 415e                           pop r14
0000000145be039c 415f                           pop r15
0000000145be039e c3                             ret
// guest-deque-truncate
0000000145ccc2f0 4157                           push r15
0000000145ccc2f2 4156                           push r14
0000000145ccc2f4 4154                           push r12
0000000145ccc2f6 56                             push rsi
0000000145ccc2f7 57                             push rdi
0000000145ccc2f8 53                             push rbx
0000000145ccc2f9 4883ec28                       sub rsp, 0x28
0000000145ccc2fd 488b5918                       mov rbx, qword ptr [rcx + 0x18]
0000000145ccc301 4839da                         cmp rdx, rbx
0000000145ccc304 0f83d8000000                   jae 0x145ccc3e2
0000000145ccc30a 4c8b4110                       mov r8, qword ptr [rcx + 0x10]
0000000145ccc30e 4c8b09                         mov r9, qword ptr [rcx]
0000000145ccc311 488b7908                       mov rdi, qword ptr [rcx + 8]
0000000145ccc315 4531d2                         xor r10d, r10d
0000000145ccc318 4d39c8                         cmp r8, r9
0000000145ccc31b 4c89c8                         mov rax, r9
0000000145ccc31e 490f42c2                       cmovb rax, r10
0000000145ccc322 4d89c3                         mov r11, r8
0000000145ccc325 4929c3                         sub r11, rax
0000000145ccc328 4d89cf                         mov r15, r9
0000000145ccc32b 4d29df                         sub r15, r11
0000000145ccc32e 4889de                         mov rsi, rbx
0000000145ccc331 4c29fe                         sub rsi, r15
0000000145ccc334 490f42f2                       cmovb rsi, r10
0000000145ccc338 4d8d341b                       lea r14, [r11 + rbx]
0000000145ccc33c 4d0f47f1                       cmova r14, r9
0000000145ccc340 4d29de                         sub r14, r11
0000000145ccc343 4989d1                         mov r9, rdx
0000000145ccc346 48895118                       mov qword ptr [rcx + 0x18], rdx
0000000145ccc34a 4d29f1                         sub r9, r14
0000000145ccc34d 7653                           jbe 0x145ccc3a2
0000000145ccc34f 4c29ce                         sub rsi, r9
0000000145ccc352 0f848a000000                   je 0x145ccc3e2
0000000145ccc358 48c1e203                       shl rdx, 3
0000000145ccc35c 488d0452                       lea rax, [rdx + rdx*2]
0000000145ccc360 49c1e603                       shl r14, 3
0000000145ccc364 4b8d0c76                       lea rcx, [r14 + r14*2]
0000000145ccc368 4829c8                         sub rax, rcx
0000000145ccc36b 4801c7                         add rdi, rax
0000000145ccc36e 4883c708                       add rdi, 8
0000000145ccc372 eb15                           jmp 0x145ccc389
0000000145ccc374 6666662e0f1f840000000000       nop word ptr cs:[rax + rax]
0000000145ccc380 4883c718                       add rdi, 0x18
0000000145ccc384 48ffce                         dec rsi
0000000145ccc387 7459                           je 0x145ccc3e2
0000000145ccc389 488b57f8                       mov rdx, qword ptr [rdi - 8]
0000000145ccc38d 4885d2                         test rdx, rdx
0000000145ccc390 74ee                           je 0x145ccc380
0000000145ccc392 488b0f                         mov rcx, qword ptr [rdi]
0000000145ccc395 41b801000000                   mov r8d, 1
0000000145ccc39b e8305e33fa                     call 0x1400021d0
0000000145ccc3a0 ebde                           jmp 0x145ccc380
0000000145ccc3a2 4929d6                         sub r14, rdx
0000000145ccc3a5 7549                           jne 0x145ccc3f0
0000000145ccc3a7 4939df                         cmp r15, rbx
0000000145ccc3aa 7336                           jae 0x145ccc3e2
0000000145ccc3ac 4883c708                       add rdi, 8
0000000145ccc3b0 eb17                           jmp 0x145ccc3c9
0000000145ccc3b2 66666666662e0f1f840000000000   nop word ptr cs:[rax + rax]
0000000145ccc3c0 4883c718                       add rdi, 0x18
0000000145ccc3c4 48ffce                         dec rsi
0000000145ccc3c7 7419                           je 0x145ccc3e2
0000000145ccc3c9 488b57f8                       mov rdx, qword ptr [rdi - 8]
0000000145ccc3cd 4885d2                         test rdx, rdx
0000000145ccc3d0 74ee                           je 0x145ccc3c0
0000000145ccc3d2 488b0f                         mov rcx, qword ptr [rdi]
0000000145ccc3d5 41b801000000                   mov r8d, 1
0000000145ccc3db e8f05d33fa                     call 0x1400021d0
0000000145ccc3e0 ebde                           jmp 0x145ccc3c0
0000000145ccc3e2 4883c428                       add rsp, 0x28
0000000145ccc3e6 5b                             pop rbx
0000000145ccc3e7 5f                             pop rdi
0000000145ccc3e8 5e                             pop rsi
0000000145ccc3e9 415c                           pop r12
0000000145ccc3eb 415e                           pop r14
0000000145ccc3ed 415f                           pop r15
0000000145ccc3ef c3                             ret
0000000145ccc3f0 4b8d0c40                       lea rcx, [r8 + r8*2]
0000000145ccc3f4 488d1452                       lea rdx, [rdx + rdx*2]
0000000145ccc3f8 48c1e203                       shl rdx, 3
0000000145ccc3fc 488d0cca                       lea rcx, [rdx + rcx*8]
0000000145ccc400 48c1e003                       shl rax, 3
0000000145ccc404 488d0440                       lea rax, [rax + rax*2]
0000000145ccc408 4829c1                         sub rcx, rax
0000000145ccc40b 4c8d2439                       lea r12, [rcx + rdi]
0000000145ccc40f 4983c408                       add r12, 8
0000000145ccc413 eb18                           jmp 0x145ccc42d
0000000145ccc415 66662e0f1f840000000000         nop word ptr cs:[rax + rax]
0000000145ccc420 4983c418                       add r12, 0x18
0000000145ccc424 49ffce                         dec r14
0000000145ccc427 0f847affffff                   je 0x145ccc3a7
0000000145ccc42d 498b5424f8                     mov rdx, qword ptr [r12 - 8]
0000000145ccc432 4885d2                         test rdx, rdx
0000000145ccc435 74e9                           je 0x145ccc420
0000000145ccc437 498b0c24                       mov rcx, qword ptr [r12]
0000000145ccc43b 41b801000000                   mov r8d, 1
0000000145ccc441 e88a5d33fa                     call 0x1400021d0
0000000145ccc446 ebd8                           jmp 0x145ccc420
// wire-parser-dispatch
0000000145e653b2 4d85c0                         test r8, r8
0000000145e653b5 7464                           je 0x145e6541b
0000000145e653b7 48c7859001000001000000         mov qword ptr [rbp + 0x190], 1
0000000145e653c2 0fb602                         movzx eax, byte ptr [rdx]
0000000145e653c5 83c0ec                         add eax, -0x14
0000000145e653c8 83f80c                         cmp eax, 0xc
0000000145e653cb 774e                           ja 0x145e6541b
0000000145e653cd 488d0de84f8c01                 lea rcx, [rip + 0x18c4fe8]
0000000145e653d4 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000145e653d8 4801c8                         add rax, rcx
0000000145e653db ffe0                           jmp rax
// wire-hosted-discriminant
0000000145e655b1 488d4d50                       lea rcx, [rbp + 0x50]
0000000145e655b5 488d9580010000                 lea rdx, [rbp + 0x180]
0000000145e655bc e8ef140000                     call 0x145e66ab0
0000000145e655c1 448b6550                       mov r12d, dword ptr [rbp + 0x50]
0000000145e655c5 448b7d54                       mov r15d, dword ptr [rbp + 0x54]
0000000145e655c9 488b7d58                       mov rdi, qword ptr [rbp + 0x58]
0000000145e655cd 488b5d60                       mov rbx, qword ptr [rbp + 0x60]
0000000145e655d1 48ba0100000000000080           movabs rdx, 0x8000000000000001
0000000145e655db e939080000                     jmp 0x145e65e19
// wire-joined-discriminant
0000000145e65524 488d4d50                       lea rcx, [rbp + 0x50]
0000000145e65528 488d9580010000                 lea rdx, [rbp + 0x180]
0000000145e6552f e87c150000                     call 0x145e66ab0
0000000145e65534 448b6550                       mov r12d, dword ptr [rbp + 0x50]
0000000145e65538 448b7d54                       mov r15d, dword ptr [rbp + 0x54]
0000000145e6553c 488b7d58                       mov rdi, qword ptr [rbp + 0x58]
0000000145e65540 488b5d60                       mov rbx, qword ptr [rbp + 0x60]
0000000145e65544 48ba0200000000000080           movabs rdx, 0x8000000000000002
0000000145e6554e e9c6080000                     jmp 0x145e65e19
// wire-closed-discriminant
0000000145e65582 488d4d50                       lea rcx, [rbp + 0x50]
0000000145e65586 488d9580010000                 lea rdx, [rbp + 0x180]
0000000145e6558d e81e150000                     call 0x145e66ab0
0000000145e65592 448b6550                       mov r12d, dword ptr [rbp + 0x50]
0000000145e65596 448b7d54                       mov r15d, dword ptr [rbp + 0x54]
0000000145e6559a 488b7d58                       mov rdi, qword ptr [rbp + 0x58]
0000000145e6559e 488b5d60                       mov rbx, qword ptr [rbp + 0x60]
0000000145e655a2 48ba0700000000000080           movabs rdx, 0x8000000000000007
0000000145e655ac e968080000                     jmp 0x145e65e19
