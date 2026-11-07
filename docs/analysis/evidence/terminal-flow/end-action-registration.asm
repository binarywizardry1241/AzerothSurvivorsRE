1402b7a1c f30f6f05dc5eb105 movdqu xmm0, xmmword ptr [rip + 0x5b15edc]
1402b7a24 f30f7f45b0 movdqu xmmword ptr [rbp - 0x50], xmm0
1402b7a29 48c745d001000000 mov qword ptr [rbp - 0x30], 1
1402b7a31 48c745d801000000 mov qword ptr [rbp - 0x28], 1
1402b7a39 48c745f000000000 mov qword ptr [rbp - 0x10], 0
1402b7a41 c645fa01 mov byte ptr [rbp - 6], 1
1402b7a45 48c745c002000000 mov qword ptr [rbp - 0x40], 2
1402b7a4d 488d05ec2de0ff lea rax, [rip - 0x1fd214]
1402b7a54 488945c8 mov qword ptr [rbp - 0x38], rax
1402b7a58 c645e002 mov byte ptr [rbp - 0x20], 2
1402b7a5c 4c8d45a8 lea r8, [rbp - 0x58]
1402b7a60 4889f2 mov rdx, rsi
1402b7a63 e8c878d5ff call 0x14000f330
1402b7a68 90 nop
1402b7a69 4889f9 mov rcx, rdi
1402b7a6c 4883c158 add rcx, 0x58
1402b7a70 488d15f9b1b305 lea rdx, [rip + 0x5b3b1f9]
1402b7a77 4989f0 mov r8, rsi
1402b7a7a e80177d5ff call 0x14000f180
1402b7a7f 90 nop
1402b7a80 488b7d28 mov rdi, qword ptr [rbp + 0x28]
1402b7a84 483b7d18 cmp rdi, qword ptr [rbp + 0x18]
1402b7a88 750a jne 0x1402b7a94
1402b7a8a 488d4d18 lea rcx, [rbp + 0x18]
1402b7a8e e8dd309405 call 0x145bfab70
1402b7a93 90 nop
1402b7a94 488b4520 mov rax, qword ptr [rbp + 0x20]
1402b7a98 488934f8 mov qword ptr [rax + rdi*8], rsi
1402b7a9c 48ffc7 inc rdi
1402b7a9f 48897d28 mov qword ptr [rbp + 0x28], rdi
1402b7aa3 48c745a800000000 mov qword ptr [rbp - 0x58], 0
1402b7aab 48c745b008000000 mov qword ptr [rbp - 0x50], 8
1402b7ab3 48c745b800000000 mov qword ptr [rbp - 0x48], 0
1402b7abb f30f6f058db9b305 movdqu xmm0, xmmword ptr [rip + 0x5b3b98d]
1402b7ac3 f30f7f45c0 movdqu xmmword ptr [rbp - 0x40], xmm0
1402b7ac8 f30f6f0d90b9b305 movdqu xmm1, xmmword ptr [rip + 0x5b3b990]
1402b7ad0 f30f7f4dd0 movdqu xmmword ptr [rbp - 0x30], xmm1
1402b7ad5 48c745e000000000 mov qword ptr [rbp - 0x20], 0
1402b7add 48c745e808000000 mov qword ptr [rbp - 0x18], 8
1402b7ae5 48c745f000000000 mov qword ptr [rbp - 0x10], 0
1402b7aed f30f7f45f8 movdqu xmmword ptr [rbp - 8], xmm0
1402b7af2 f30f7f4d08 movdqu xmmword ptr [rbp + 8], xmm1
1402b7af7 488b4d30 mov rcx, qword ptr [rbp + 0x30]
1402b7afb c6454701 mov byte ptr [rbp + 0x47], 1
1402b7aff 4c8d45a8 lea r8, [rbp - 0x58]
1402b7b03 4889f2 mov rdx, rsi
1402b7b06 e865ccb804 call 0x144e44770
1402b7b0b 90 nop
1402b7b0c 488b4528 mov rax, qword ptr [rbp + 0x28]
