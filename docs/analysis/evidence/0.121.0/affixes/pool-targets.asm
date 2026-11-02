0000000145c7da10 55                             push rbp
0000000145c7da11 4157                           push r15
0000000145c7da13 4156                           push r14
0000000145c7da15 4155                           push r13
0000000145c7da17 4154                           push r12
0000000145c7da19 56                             push rsi
0000000145c7da1a 57                             push rdi
0000000145c7da1b 53                             push rbx
0000000145c7da1c 4881ec88000000                 sub rsp, 0x88
0000000145c7da23 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145c7da2b 440f2945f0                     movaps xmmword ptr [rbp - 0x10], xmm8
0000000145c7da30 0f297de0                       movaps xmmword ptr [rbp - 0x20], xmm7
0000000145c7da34 0f2975d0                       movaps xmmword ptr [rbp - 0x30], xmm6
0000000145c7da38 48c745c8feffffff               mov qword ptr [rbp - 0x38], 0xfffffffffffffffe
0000000145c7da40 4889ce                         mov rsi, rcx
0000000145c7da43 4c8b3a                         mov r15, qword ptr [rdx]
0000000145c7da46 4c8b7208                       mov r14, qword ptr [rdx + 8]
0000000145c7da4a 4d39f7                         cmp r15, r14
0000000145c7da4d 0f84b7000000                   je 0x145c7db0a
0000000145c7da53 4c8b6210                       mov r12, qword ptr [rdx + 0x10]
0000000145c7da57 4c8b6a18                       mov r13, qword ptr [rdx + 0x18]
0000000145c7da5b 4981c7e0010000                 add r15, 0x1e0
0000000145c7da62 0f57c0                         xorps xmm0, xmm0
0000000145c7da65 f30f103533a75100               movss xmm6, dword ptr [rip + 0x51a733]
0000000145c7da6d f30f103da3e75100               movss xmm7, dword ptr [rip + 0x51e7a3]
0000000145c7da75 eb38                           jmp 0x145c7daaf
0000000145c7da77 660f1f840000000000             nop word ptr [rax + rax]
0000000145c7da80 f2410f104fa8                   movsd xmm1, qword ptr [r15 - 0x58]
0000000145c7da86 f2410f105500                   movsd xmm2, qword ptr [r13]
0000000145c7da8c 0f5cca                         subps xmm1, xmm2
0000000145c7da8f 0f59c9                         mulps xmm1, xmm1
0000000145c7da92 f30f16d1                       movshdup xmm2, xmm1
0000000145c7da96 f30f58d1                       addss xmm2, xmm1
0000000145c7da9a 0f2efa                         ucomiss xmm7, xmm2
0000000145c7da9d 0f8383000000                   jae 0x145c7db26
0000000145c7daa3 4d39f7                         cmp r15, r14
0000000145c7daa6 4d8dbfe0010000                 lea r15, [r15 + 0x1e0]
0000000145c7daad 745b                           je 0x145c7db0a
0000000145c7daaf 4180bfd0feffff00               cmp byte ptr [r15 - 0x130], 0
0000000145c7dab7 75ea                           jne 0x145c7daa3
0000000145c7dab9 4183bff0feffffff               cmp dword ptr [r15 - 0x110], -1
0000000145c7dac1 75e0                           jne 0x145c7daa3
0000000145c7dac3 f3410f104fb8                   movss xmm1, dword ptr [r15 - 0x48]
0000000145c7dac9 0f2ec1                         ucomiss xmm0, xmm1
0000000145c7dacc 73b2                           jae 0x145c7da80
0000000145c7dace f3410f101424                   movss xmm2, dword ptr [r12]
0000000145c7dad4 f3410f5c57b4                   subss xmm2, dword ptr [r15 - 0x4c]
0000000145c7dada f30f5ed1                       divss xmm2, xmm1
0000000145c7dade 0f57c9                         xorps xmm1, xmm1
0000000145c7dae1 f30f5fca                       maxss xmm1, xmm2
0000000145c7dae5 0f28d6                         movaps xmm2, xmm6
0000000145c7dae8 f30f5dd1                       minss xmm2, xmm1
0000000145c7daec f2410f105f9c                   movsd xmm3, qword ptr [r15 - 0x64]
0000000145c7daf2 f2410f1067a8                   movsd xmm4, qword ptr [r15 - 0x58]
0000000145c7daf8 0f5ce3                         subps xmm4, xmm3
0000000145c7dafb f30f12ca                       movsldup xmm1, xmm2
0000000145c7daff 0f59cc                         mulps xmm1, xmm4
0000000145c7db02 0f58cb                         addps xmm1, xmm3
0000000145c7db05 e97cffffff                     jmp 0x145c7da86
0000000145c7db0a 48c70600000000                 mov qword ptr [rsi], 0
0000000145c7db11 48c7460808000000               mov qword ptr [rsi + 8], 8
0000000145c7db19 48c7461000000000               mov qword ptr [rsi + 0x10], 0
0000000145c7db21 e95d010000                     jmp 0x145c7dc83
0000000145c7db26 4c893a                         mov qword ptr [rdx], r15
0000000145c7db29 498bbf10ffffff                 mov rdi, qword ptr [r15 - 0xf0]
0000000145c7db30 e8cb4638fa                     call 0x140002200
0000000145c7db35 b920000000                     mov ecx, 0x20
0000000145c7db3a ba08000000                     mov edx, 8
0000000145c7db3f e87c4638fa                     call 0x1400021c0
0000000145c7db44 4885c0                         test rax, rax
0000000145c7db47 0f845a010000                   je 0x145c7dca7
0000000145c7db4d 488938                         mov qword ptr [rax], rdi
0000000145c7db50 48c745b004000000               mov qword ptr [rbp - 0x50], 4
0000000145c7db58 488945b8                       mov qword ptr [rbp - 0x48], rax
0000000145c7db5c 48c745c001000000               mov qword ptr [rbp - 0x40], 1
0000000145c7db64 4d39f7                         cmp r15, r14
0000000145c7db67 0f84ff000000                   je 0x145c7dc6c
0000000145c7db6d bf01000000                     mov edi, 1
0000000145c7db72 450f57c0                       xorps xmm8, xmm8
0000000145c7db76 488d4db0                       lea rcx, [rbp - 0x50]
0000000145c7db7a 4981c7e0010000                 add r15, 0x1e0
0000000145c7db81 eb3c                           jmp 0x145c7dbbf
0000000145c7db83 666666662e0f1f840000000000     nop word ptr cs:[rax + rax]
0000000145c7db90 f2410f1047a8                   movsd xmm0, qword ptr [r15 - 0x58]
0000000145c7db96 f2410f104d00                   movsd xmm1, qword ptr [r13]
0000000145c7db9c 0f5cc1                         subps xmm0, xmm1
0000000145c7db9f 0f59c0                         mulps xmm0, xmm0
0000000145c7dba2 f30f16c8                       movshdup xmm1, xmm0
0000000145c7dba6 f30f58c8                       addss xmm1, xmm0
0000000145c7dbaa 0f2ef9                         ucomiss xmm7, xmm1
0000000145c7dbad 736c                           jae 0x145c7dc1b
0000000145c7dbaf 4d39f7                         cmp r15, r14
0000000145c7dbb2 4d8dbfe0010000                 lea r15, [r15 + 0x1e0]
0000000145c7dbb9 0f84ad000000                   je 0x145c7dc6c
0000000145c7dbbf 4180bfd0feffff00               cmp byte ptr [r15 - 0x130], 0
0000000145c7dbc7 75e6                           jne 0x145c7dbaf
0000000145c7dbc9 4183bff0feffffff               cmp dword ptr [r15 - 0x110], -1
0000000145c7dbd1 75dc                           jne 0x145c7dbaf
0000000145c7dbd3 f3410f1047b8                   movss xmm0, dword ptr [r15 - 0x48]
0000000145c7dbd9 440f2ec0                       ucomiss xmm8, xmm0
0000000145c7dbdd 73b1                           jae 0x145c7db90
0000000145c7dbdf f3410f100c24                   movss xmm1, dword ptr [r12]
0000000145c7dbe5 f3410f5c4fb4                   subss xmm1, dword ptr [r15 - 0x4c]
0000000145c7dbeb f30f5ec8                       divss xmm1, xmm0
0000000145c7dbef 0f57c0                         xorps xmm0, xmm0
0000000145c7dbf2 f30f5fc1                       maxss xmm0, xmm1
0000000145c7dbf6 0f28ce                         movaps xmm1, xmm6
0000000145c7dbf9 f30f5dc8                       minss xmm1, xmm0
0000000145c7dbfd f2410f10579c                   movsd xmm2, qword ptr [r15 - 0x64]
0000000145c7dc03 f2410f105fa8                   movsd xmm3, qword ptr [r15 - 0x58]
0000000145c7dc09 0f5cda                         subps xmm3, xmm2
0000000145c7dc0c f30f12c1                       movsldup xmm0, xmm1
0000000145c7dc10 0f59c3                         mulps xmm0, xmm3
0000000145c7dc13 0f58c2                         addps xmm0, xmm2
0000000145c7dc16 e97bffffff                     jmp 0x145c7db96
0000000145c7dc1b 498b9710ffffff                 mov rdx, qword ptr [r15 - 0xf0]
0000000145c7dc22 488955a8                       mov qword ptr [rbp - 0x58], rdx
0000000145c7dc26 483b7db0                       cmp rdi, qword ptr [rbp - 0x50]
0000000145c7dc2a 7528                           jne 0x145c7dc54
0000000145c7dc2c 48c744242008000000             mov qword ptr [rsp + 0x20], 8
0000000145c7dc35 41b801000000                   mov r8d, 1
0000000145c7dc3b 41b908000000                   mov r9d, 8
0000000145c7dc41 4889cb                         mov rbx, rcx
0000000145c7dc44 4889fa                         mov rdx, rdi
0000000145c7dc47 e844e73600                     call 0x145fec390
0000000145c7dc4c 90                             nop
0000000145c7dc4d 488b45b8                       mov rax, qword ptr [rbp - 0x48]
0000000145c7dc51 4889d9                         mov rcx, rbx
0000000145c7dc54 488b55a8                       mov rdx, qword ptr [rbp - 0x58]
0000000145c7dc58 488914f8                       mov qword ptr [rax + rdi*8], rdx
0000000145c7dc5c 48ffc7                         inc rdi
0000000145c7dc5f 48897dc0                       mov qword ptr [rbp - 0x40], rdi
0000000145c7dc63 4d39f7                         cmp r15, r14
0000000145c7dc66 0f850effffff                   jne 0x145c7db7a
0000000145c7dc6c 488b45c0                       mov rax, qword ptr [rbp - 0x40]
0000000145c7dc70 48894610                       mov qword ptr [rsi + 0x10], rax
0000000145c7dc74 488b45b0                       mov rax, qword ptr [rbp - 0x50]
0000000145c7dc78 488906                         mov qword ptr [rsi], rax
0000000145c7dc7b 488b45b8                       mov rax, qword ptr [rbp - 0x48]
0000000145c7dc7f 48894608                       mov qword ptr [rsi + 8], rax
0000000145c7dc83 4889f0                         mov rax, rsi
0000000145c7dc86 0f2875d0                       movaps xmm6, xmmword ptr [rbp - 0x30]
0000000145c7dc8a 0f287de0                       movaps xmm7, xmmword ptr [rbp - 0x20]
0000000145c7dc8e 440f2845f0                     movaps xmm8, xmmword ptr [rbp - 0x10]
0000000145c7dc93 4881c488000000                 add rsp, 0x88
0000000145c7dc9a 5b                             pop rbx
0000000145c7dc9b 5f                             pop rdi
0000000145c7dc9c 5e                             pop rsi
0000000145c7dc9d 415c                           pop r12
0000000145c7dc9f 415d                           pop r13
0000000145c7dca1 415e                           pop r14
0000000145c7dca3 415f                           pop r15
0000000145c7dca5 5d                             pop rbp
0000000145c7dca6 c3                             ret
0000000145c7dca7 b908000000                     mov ecx, 8
0000000145c7dcac ba20000000                     mov edx, 0x20
0000000145c7dcb1 e805645100                     call 0x1461940bb
0000000145c7dcb6 0f0b                           ud2
