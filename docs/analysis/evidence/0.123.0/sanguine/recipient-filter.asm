0000000145ca02b0 55                             push rbp
0000000145ca02b1 4157                           push r15
0000000145ca02b3 4156                           push r14
0000000145ca02b5 4155                           push r13
0000000145ca02b7 4154                           push r12
0000000145ca02b9 56                             push rsi
0000000145ca02ba 57                             push rdi
0000000145ca02bb 53                             push rbx
0000000145ca02bc 4881ec88000000                 sub rsp, 0x88
0000000145ca02c3 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145ca02cb 440f2945f0                     movaps xmmword ptr [rbp - 0x10], xmm8
0000000145ca02d0 0f297de0                       movaps xmmword ptr [rbp - 0x20], xmm7
0000000145ca02d4 0f2975d0                       movaps xmmword ptr [rbp - 0x30], xmm6
0000000145ca02d8 48c745c8feffffff               mov qword ptr [rbp - 0x38], 0xfffffffffffffffe
0000000145ca02e0 4889ce                         mov rsi, rcx
0000000145ca02e3 4c8b3a                         mov r15, qword ptr [rdx]
0000000145ca02e6 4c8b7208                       mov r14, qword ptr [rdx + 8]
0000000145ca02ea 4d39f7                         cmp r15, r14
0000000145ca02ed 0f84cb000000                   je 0x145ca03be
0000000145ca02f3 4c8b6210                       mov r12, qword ptr [rdx + 0x10]
0000000145ca02f7 4c8b6a18                       mov r13, qword ptr [rdx + 0x18]
0000000145ca02fb 4981c7e0010000                 add r15, 0x1e0
0000000145ca0302 0f57c0                         xorps xmm0, xmm0
0000000145ca0305 f30f1035f31e5100               movss xmm6, dword ptr [rip + 0x511ef3]
0000000145ca030d f30f103d53d55300               movss xmm7, dword ptr [rip + 0x53d553]
0000000145ca0315 eb38                           jmp 0x145ca034f
0000000145ca0317 660f1f840000000000             nop word ptr [rax + rax]
0000000145ca0320 f2410f104fa8                   movsd xmm1, qword ptr [r15 - 0x58]
0000000145ca0326 f2410f105500                   movsd xmm2, qword ptr [r13]
0000000145ca032c 0f5cca                         subps xmm1, xmm2
0000000145ca032f 0f59c9                         mulps xmm1, xmm1
0000000145ca0332 f30f16d1                       movshdup xmm2, xmm1
0000000145ca0336 f30f58d1                       addss xmm2, xmm1
0000000145ca033a 0f2efa                         ucomiss xmm7, xmm2
0000000145ca033d 0f8397000000                   jae 0x145ca03da
0000000145ca0343 4d39f7                         cmp r15, r14
0000000145ca0346 4d8dbfe0010000                 lea r15, [r15 + 0x1e0]
0000000145ca034d 746f                           je 0x145ca03be
0000000145ca034f 4180bfd0feffff00               cmp byte ptr [r15 - 0x130], 0
0000000145ca0357 75ea                           jne 0x145ca0343
0000000145ca0359 4183bff0feffffff               cmp dword ptr [r15 - 0x110], -1
0000000145ca0361 75e0                           jne 0x145ca0343
0000000145ca0363 4983bf38feffffff               cmp qword ptr [r15 - 0x1c8], -1
0000000145ca036b 75d6                           jne 0x145ca0343
0000000145ca036d 4983bf78feffffff               cmp qword ptr [r15 - 0x188], -1
0000000145ca0375 75cc                           jne 0x145ca0343
0000000145ca0377 f3410f104fb8                   movss xmm1, dword ptr [r15 - 0x48]
0000000145ca037d 0f2ec1                         ucomiss xmm0, xmm1
0000000145ca0380 739e                           jae 0x145ca0320
0000000145ca0382 f3410f101424                   movss xmm2, dword ptr [r12]
0000000145ca0388 f3410f5c57b4                   subss xmm2, dword ptr [r15 - 0x4c]
0000000145ca038e f30f5ed1                       divss xmm2, xmm1
0000000145ca0392 0f57c9                         xorps xmm1, xmm1
0000000145ca0395 f30f5fca                       maxss xmm1, xmm2
0000000145ca0399 0f28d6                         movaps xmm2, xmm6
0000000145ca039c f30f5dd1                       minss xmm2, xmm1
0000000145ca03a0 f2410f105f9c                   movsd xmm3, qword ptr [r15 - 0x64]
0000000145ca03a6 f2410f1067a8                   movsd xmm4, qword ptr [r15 - 0x58]
0000000145ca03ac 0f5ce3                         subps xmm4, xmm3
0000000145ca03af f30f12ca                       movsldup xmm1, xmm2
0000000145ca03b3 0f59cc                         mulps xmm1, xmm4
0000000145ca03b6 0f58cb                         addps xmm1, xmm3
0000000145ca03b9 e968ffffff                     jmp 0x145ca0326
0000000145ca03be 48c70600000000                 mov qword ptr [rsi], 0
0000000145ca03c5 48c7460808000000               mov qword ptr [rsi + 8], 8
0000000145ca03cd 48c7461000000000               mov qword ptr [rsi + 0x10], 0
0000000145ca03d5 e971010000                     jmp 0x145ca054b
0000000145ca03da 4c893a                         mov qword ptr [rdx], r15
0000000145ca03dd 498bbf10ffffff                 mov rdi, qword ptr [r15 - 0xf0]
0000000145ca03e4 e8171e36fa                     call 0x140002200
0000000145ca03e9 b920000000                     mov ecx, 0x20
0000000145ca03ee ba08000000                     mov edx, 8
0000000145ca03f3 e8c81d36fa                     call 0x1400021c0
0000000145ca03f8 4885c0                         test rax, rax
0000000145ca03fb 0f846e010000                   je 0x145ca056f
0000000145ca0401 488938                         mov qword ptr [rax], rdi
0000000145ca0404 48c745b004000000               mov qword ptr [rbp - 0x50], 4
0000000145ca040c 488945b8                       mov qword ptr [rbp - 0x48], rax
0000000145ca0410 48c745c001000000               mov qword ptr [rbp - 0x40], 1
0000000145ca0418 4d39f7                         cmp r15, r14
0000000145ca041b 0f8413010000                   je 0x145ca0534
0000000145ca0421 bf01000000                     mov edi, 1
0000000145ca0426 450f57c0                       xorps xmm8, xmm8
0000000145ca042a 488d4db0                       lea rcx, [rbp - 0x50]
0000000145ca042e 4981c7e0010000                 add r15, 0x1e0
0000000145ca0435 eb3c                           jmp 0x145ca0473
0000000145ca0437 660f1f840000000000             nop word ptr [rax + rax]
0000000145ca0440 f2410f1047a8                   movsd xmm0, qword ptr [r15 - 0x58]
0000000145ca0446 f2410f104d00                   movsd xmm1, qword ptr [r13]
0000000145ca044c 0f5cc1                         subps xmm0, xmm1
0000000145ca044f 0f59c0                         mulps xmm0, xmm0
0000000145ca0452 f30f16c8                       movshdup xmm1, xmm0
0000000145ca0456 f30f58c8                       addss xmm1, xmm0
0000000145ca045a 0f2ef9                         ucomiss xmm7, xmm1
0000000145ca045d 0f8380000000                   jae 0x145ca04e3
0000000145ca0463 4d39f7                         cmp r15, r14
0000000145ca0466 4d8dbfe0010000                 lea r15, [r15 + 0x1e0]
0000000145ca046d 0f84c1000000                   je 0x145ca0534
0000000145ca0473 4180bfd0feffff00               cmp byte ptr [r15 - 0x130], 0
0000000145ca047b 75e6                           jne 0x145ca0463
0000000145ca047d 4183bff0feffffff               cmp dword ptr [r15 - 0x110], -1
0000000145ca0485 75dc                           jne 0x145ca0463
0000000145ca0487 4983bf38feffffff               cmp qword ptr [r15 - 0x1c8], -1
0000000145ca048f 75d2                           jne 0x145ca0463
0000000145ca0491 4983bf78feffffff               cmp qword ptr [r15 - 0x188], -1
0000000145ca0499 75c8                           jne 0x145ca0463
0000000145ca049b f3410f1047b8                   movss xmm0, dword ptr [r15 - 0x48]
0000000145ca04a1 440f2ec0                       ucomiss xmm8, xmm0
0000000145ca04a5 7399                           jae 0x145ca0440
0000000145ca04a7 f3410f100c24                   movss xmm1, dword ptr [r12]
0000000145ca04ad f3410f5c4fb4                   subss xmm1, dword ptr [r15 - 0x4c]
0000000145ca04b3 f30f5ec8                       divss xmm1, xmm0
0000000145ca04b7 0f57c0                         xorps xmm0, xmm0
0000000145ca04ba f30f5fc1                       maxss xmm0, xmm1
0000000145ca04be 0f28ce                         movaps xmm1, xmm6
0000000145ca04c1 f30f5dc8                       minss xmm1, xmm0
0000000145ca04c5 f2410f10579c                   movsd xmm2, qword ptr [r15 - 0x64]
0000000145ca04cb f2410f105fa8                   movsd xmm3, qword ptr [r15 - 0x58]
0000000145ca04d1 0f5cda                         subps xmm3, xmm2
0000000145ca04d4 f30f12c1                       movsldup xmm0, xmm1
0000000145ca04d8 0f59c3                         mulps xmm0, xmm3
0000000145ca04db 0f58c2                         addps xmm0, xmm2
0000000145ca04de e963ffffff                     jmp 0x145ca0446
0000000145ca04e3 498b9710ffffff                 mov rdx, qword ptr [r15 - 0xf0]
0000000145ca04ea 488955a8                       mov qword ptr [rbp - 0x58], rdx
0000000145ca04ee 483b7db0                       cmp rdi, qword ptr [rbp - 0x50]
0000000145ca04f2 7528                           jne 0x145ca051c
0000000145ca04f4 48c744242008000000             mov qword ptr [rsp + 0x20], 8
0000000145ca04fd 41b801000000                   mov r8d, 1
0000000145ca0503 41b908000000                   mov r9d, 8
0000000145ca0509 4889cb                         mov rbx, rcx
0000000145ca050c 4889fa                         mov rdx, rdi
0000000145ca050f e8dc583600                     call 0x146005df0
0000000145ca0514 90                             nop
0000000145ca0515 488b45b8                       mov rax, qword ptr [rbp - 0x48]
0000000145ca0519 4889d9                         mov rcx, rbx
0000000145ca051c 488b55a8                       mov rdx, qword ptr [rbp - 0x58]
0000000145ca0520 488914f8                       mov qword ptr [rax + rdi*8], rdx
0000000145ca0524 48ffc7                         inc rdi
0000000145ca0527 48897dc0                       mov qword ptr [rbp - 0x40], rdi
0000000145ca052b 4d39f7                         cmp r15, r14
0000000145ca052e 0f85fafeffff                   jne 0x145ca042e
0000000145ca0534 488b45c0                       mov rax, qword ptr [rbp - 0x40]
0000000145ca0538 48894610                       mov qword ptr [rsi + 0x10], rax
0000000145ca053c 488b45b0                       mov rax, qword ptr [rbp - 0x50]
0000000145ca0540 488906                         mov qword ptr [rsi], rax
0000000145ca0543 488b45b8                       mov rax, qword ptr [rbp - 0x48]
0000000145ca0547 48894608                       mov qword ptr [rsi + 8], rax
0000000145ca054b 4889f0                         mov rax, rsi
0000000145ca054e 0f2875d0                       movaps xmm6, xmmword ptr [rbp - 0x30]
0000000145ca0552 0f287de0                       movaps xmm7, xmmword ptr [rbp - 0x20]
0000000145ca0556 440f2845f0                     movaps xmm8, xmmword ptr [rbp - 0x10]
0000000145ca055b 4881c488000000                 add rsp, 0x88
0000000145ca0562 5b                             pop rbx
0000000145ca0563 5f                             pop rdi
0000000145ca0564 5e                             pop rsi
0000000145ca0565 415c                           pop r12
0000000145ca0567 415d                           pop r13
0000000145ca0569 415e                           pop r14
0000000145ca056b 415f                           pop r15
0000000145ca056d 5d                             pop rbp
0000000145ca056e c3                             ret
0000000145ca056f b908000000                     mov ecx, 8
0000000145ca0574 ba20000000                     mov edx, 0x20
0000000145ca0579 e8ddd75000                     call 0x1461add5b
0000000145ca057e 0f0b                           ud2
