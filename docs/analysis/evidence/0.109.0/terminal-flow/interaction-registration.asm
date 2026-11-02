1402a7f4c f30f6f058c56b205 movdqu xmm0, xmmword ptr [rip + 0x5b2568c]
1402a7f54 f30f7f45b0 movdqu xmmword ptr [rbp - 0x50], xmm0
1402a7f59 48c745d001000000 mov qword ptr [rbp - 0x30], 1
1402a7f61 48c745d801000000 mov qword ptr [rbp - 0x28], 1
1402a7f69 48c745f000000000 mov qword ptr [rbp - 0x10], 0
1402a7f71 c645fa01 mov byte ptr [rbp - 6], 1
1402a7f75 48c745c002000000 mov qword ptr [rbp - 0x40], 2
1402a7f7d 488d055c14e1ff lea rax, [rip - 0x1eeba4]
1402a7f84 488945c8 mov qword ptr [rbp - 0x38], rax
1402a7f88 c645e002 mov byte ptr [rbp - 0x20], 2
1402a7f8c 4c8d45a8 lea r8, [rbp - 0x58]
1402a7f90 4889f2 mov rdx, rsi
1402a7f93 e89873d6ff call 0x14000f330
1402a7f98 90 nop
1402a7f99 4889f9 mov rcx, rdi
1402a7f9c 4883c158 add rcx, 0x58
1402a7fa0 488d15e9a9b405 lea rdx, [rip + 0x5b4a9e9]
1402a7fa7 4989f0 mov r8, rsi
1402a7faa e8d171d6ff call 0x14000f180
1402a7faf 90 nop
1402a7fb0 488b7d28 mov rdi, qword ptr [rbp + 0x28]
1402a7fb4 483b7d18 cmp rdi, qword ptr [rbp + 0x18]
1402a7fb8 750a jne 0x1402a7fc4
1402a7fba 488d4d18 lea rcx, [rbp + 0x18]
1402a7fbe e8ad2b9505 call 0x145bfab70
1402a7fc3 90 nop
1402a7fc4 488b4520 mov rax, qword ptr [rbp + 0x20]
1402a7fc8 488934f8 mov qword ptr [rax + rdi*8], rsi
1402a7fcc 48ffc7 inc rdi
1402a7fcf 48897d28 mov qword ptr [rbp + 0x28], rdi
1402a7fd3 48c745a800000000 mov qword ptr [rbp - 0x58], 0
1402a7fdb 48c745b008000000 mov qword ptr [rbp - 0x50], 8
1402a7fe3 48c745b800000000 mov qword ptr [rbp - 0x48], 0
1402a7feb f30f6f055db4b405 movdqu xmm0, xmmword ptr [rip + 0x5b4b45d]
1402a7ff3 f30f7f45c0 movdqu xmmword ptr [rbp - 0x40], xmm0
1402a7ff8 f30f6f0d60b4b405 movdqu xmm1, xmmword ptr [rip + 0x5b4b460]
1402a8000 f30f7f4dd0 movdqu xmmword ptr [rbp - 0x30], xmm1
1402a8005 48c745e000000000 mov qword ptr [rbp - 0x20], 0
1402a800d 48c745e808000000 mov qword ptr [rbp - 0x18], 8
1402a8015 48c745f000000000 mov qword ptr [rbp - 0x10], 0
1402a801d f30f7f45f8 movdqu xmmword ptr [rbp - 8], xmm0
1402a8022 f30f7f4d08 movdqu xmmword ptr [rbp + 8], xmm1
1402a8027 488b4d30 mov rcx, qword ptr [rbp + 0x30]
1402a802b c6454701 mov byte ptr [rbp + 0x47], 1
1402a802f 4c8d45a8 lea r8, [rbp - 0x58]
1402a8033 4889f2 mov rdx, rsi
1402a8036 e835c7b904 call 0x144e44770
1402a803b 90 nop
1402a803c 488b4528 mov rax, qword ptr [rbp + 0x28]
