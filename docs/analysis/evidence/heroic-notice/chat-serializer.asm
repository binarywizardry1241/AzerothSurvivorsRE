0000000145b7e450 55                             push rbp
0000000145b7e451 4157                           push r15
0000000145b7e453 4156                           push r14
0000000145b7e455 56                             push rsi
0000000145b7e456 57                             push rdi
0000000145b7e457 53                             push rbx
0000000145b7e458 4881ec98000000                 sub rsp, 0x98
0000000145b7e45f 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145b7e467 48c74510feffffff               mov qword ptr [rbp + 0x10], 0xfffffffffffffffe
0000000145b7e46f 4c89c7                         mov rdi, r8
0000000145b7e472 4889d3                         mov rbx, rdx
0000000145b7e475 4889ce                         mov rsi, rcx
0000000145b7e478 e8833d48fa                     call 0x140002200
0000000145b7e47d b920000000                     mov ecx, 0x20
0000000145b7e482 ba01000000                     mov edx, 1
0000000145b7e487 e8343d48fa                     call 0x1400021c0
0000000145b7e48c 4885c0                         test rax, rax
0000000145b7e48f 0f84ee010000                   je 0x145b7e683
0000000145b7e495 c6000a                         mov byte ptr [rax], 0xa
0000000145b7e498 48c745b020000000               mov qword ptr [rbp - 0x50], 0x20
0000000145b7e4a0 488945b8                       mov qword ptr [rbp - 0x48], rax
0000000145b7e4a4 66c745c89600                   mov word ptr [rbp - 0x38], 0x96
0000000145b7e4aa c7400100000000                 mov dword ptr [rax + 1], 0
0000000145b7e4b1 48c745c005000000               mov qword ptr [rbp - 0x40], 5
0000000145b7e4b9 488b4db0                       mov rcx, qword ptr [rbp - 0x50]
0000000145b7e4bd 4883c1fb                       add rcx, -5
0000000145b7e4c1 b805000000                     mov eax, 5
0000000145b7e4c6 4883f907                       cmp rcx, 7
0000000145b7e4ca 0f8632010000                   jbe 0x145b7e602
0000000145b7e4d0 488b4db8                       mov rcx, qword ptr [rbp - 0x48]
0000000145b7e4d4 48c7040100000000               mov qword ptr [rcx + rax], 0
0000000145b7e4dc 4883c008                       add rax, 8
0000000145b7e4e0 488945c0                       mov qword ptr [rbp - 0x40], rax
0000000145b7e4e4 488b45c0                       mov rax, qword ptr [rbp - 0x40]
0000000145b7e4e8 48894500                       mov qword ptr [rbp], rax
0000000145b7e4ec 0fb745c8                       movzx eax, word ptr [rbp - 0x38]
0000000145b7e4f0 66894508                       mov word ptr [rbp + 8], ax
0000000145b7e4f4 8b45ca                         mov eax, dword ptr [rbp - 0x36]
0000000145b7e4f7 89450a                         mov dword ptr [rbp + 0xa], eax
0000000145b7e4fa 0fb745ce                       movzx eax, word ptr [rbp - 0x32]
0000000145b7e4fe 6689450e                       mov word ptr [rbp + 0xe], ax
0000000145b7e502 0f1045b0                       movups xmm0, xmmword ptr [rbp - 0x50]
0000000145b7e506 0f2945f0                       movaps xmmword ptr [rbp - 0x10], xmm0
0000000145b7e50a 488b5500                       mov rdx, qword ptr [rbp]
0000000145b7e50e 488b45f0                       mov rax, qword ptr [rbp - 0x10]
0000000145b7e512 4829d0                         sub rax, rdx
0000000145b7e515 4883f803                       cmp rax, 3
0000000145b7e519 0f8610010000                   jbe 0x145b7e62f
0000000145b7e51f 8d4701                         lea eax, [rdi + 1]
0000000145b7e522 488b4df8                       mov rcx, qword ptr [rbp - 8]
0000000145b7e526 890411                         mov dword ptr [rcx + rdx], eax
0000000145b7e529 4883c204                       add rdx, 4
0000000145b7e52d 48895500                       mov qword ptr [rbp], rdx
0000000145b7e531 0f2845f0                       movaps xmm0, xmmword ptr [rbp - 0x10]
0000000145b7e535 0f2945d0                       movaps xmmword ptr [rbp - 0x30], xmm0
0000000145b7e539 488b4500                       mov rax, qword ptr [rbp]
0000000145b7e53d 488945e0                       mov qword ptr [rbp - 0x20], rax
0000000145b7e541 488b4508                       mov rax, qword ptr [rbp + 8]
0000000145b7e545 488945e8                       mov qword ptr [rbp - 0x18], rax
0000000145b7e549 4c8b75e0                       mov r14, qword ptr [rbp - 0x20]
0000000145b7e54d 4c8b7dd0                       mov r15, qword ptr [rbp - 0x30]
0000000145b7e551 4c89f8                         mov rax, r15
0000000145b7e554 4c29f0                         sub rax, r14
0000000145b7e557 4839c7                         cmp rdi, rax
0000000145b7e55a 0f87f7000000                   ja 0x145b7e657
0000000145b7e560 4885ff                         test rdi, rdi
0000000145b7e563 7412                           je 0x145b7e577
0000000145b7e565 488b4dd8                       mov rcx, qword ptr [rbp - 0x28]
0000000145b7e569 4c01f1                         add rcx, r14
0000000145b7e56c 4889da                         mov rdx, rbx
0000000145b7e56f 4989f8                         mov r8, rdi
0000000145b7e572 e8a4d64600                     call 0x145febc1b
0000000145b7e577 4901fe                         add r14, rdi
0000000145b7e57a 4c8975e0                       mov qword ptr [rbp - 0x20], r14
0000000145b7e57e 4d39fe                         cmp r14, r15
0000000145b7e581 750a                           jne 0x145b7e58d
0000000145b7e583 488d4dd0                       lea rcx, [rbp - 0x30]
0000000145b7e587 e8245a6100                     call 0x146193fb0
0000000145b7e58c 90                             nop
0000000145b7e58d 488b45d8                       mov rax, qword ptr [rbp - 0x28]
0000000145b7e591 42c6043000                     mov byte ptr [rax + r14], 0
0000000145b7e596 49ffc6                         inc r14
0000000145b7e599 4c8975e0                       mov qword ptr [rbp - 0x20], r14
0000000145b7e59d 0f2845d0                       movaps xmm0, xmmword ptr [rbp - 0x30]
0000000145b7e5a1 0f2945f0                       movaps xmmword ptr [rbp - 0x10], xmm0
0000000145b7e5a5 488b45e0                       mov rax, qword ptr [rbp - 0x20]
0000000145b7e5a9 48894500                       mov qword ptr [rbp], rax
0000000145b7e5ad 488b45e8                       mov rax, qword ptr [rbp - 0x18]
0000000145b7e5b1 48894508                       mov qword ptr [rbp + 8], rax
0000000145b7e5b5 488b7d00                       mov rdi, qword ptr [rbp]
0000000145b7e5b9 483b7df0                       cmp rdi, qword ptr [rbp - 0x10]
0000000145b7e5bd 750a                           jne 0x145b7e5c9
0000000145b7e5bf 488d4df0                       lea rcx, [rbp - 0x10]
0000000145b7e5c3 e8e8596100                     call 0x146193fb0
0000000145b7e5c8 90                             nop
0000000145b7e5c9 488b45f8                       mov rax, qword ptr [rbp - 8]
0000000145b7e5cd c6043800                       mov byte ptr [rax + rdi], 0
0000000145b7e5d1 48ffc7                         inc rdi
0000000145b7e5d4 48897d00                       mov qword ptr [rbp], rdi
0000000145b7e5d8 0f2845f0                       movaps xmm0, xmmword ptr [rbp - 0x10]
0000000145b7e5dc 0f1106                         movups xmmword ptr [rsi], xmm0
0000000145b7e5df 488b4500                       mov rax, qword ptr [rbp]
0000000145b7e5e3 48894610                       mov qword ptr [rsi + 0x10], rax
0000000145b7e5e7 488b4508                       mov rax, qword ptr [rbp + 8]
0000000145b7e5eb 48894618                       mov qword ptr [rsi + 0x18], rax
0000000145b7e5ef 4889f0                         mov rax, rsi
0000000145b7e5f2 4881c498000000                 add rsp, 0x98
0000000145b7e5f9 5b                             pop rbx
0000000145b7e5fa 5f                             pop rdi
0000000145b7e5fb 5e                             pop rsi
0000000145b7e5fc 415e                           pop r14
0000000145b7e5fe 415f                           pop r15
0000000145b7e600 5d                             pop rbp
0000000145b7e601 c3                             ret
0000000145b7e602 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145b7e60b 488d4db0                       lea rcx, [rbp - 0x50]
0000000145b7e60f ba05000000                     mov edx, 5
0000000145b7e614 41b808000000                   mov r8d, 8
0000000145b7e61a 41b901000000                   mov r9d, 1
0000000145b7e620 e86bdd4600                     call 0x145fec390
0000000145b7e625 90                             nop
0000000145b7e626 488b45c0                       mov rax, qword ptr [rbp - 0x40]
0000000145b7e62a e9a1feffff                     jmp 0x145b7e4d0
0000000145b7e62f 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145b7e638 488d4df0                       lea rcx, [rbp - 0x10]
0000000145b7e63c 41b804000000                   mov r8d, 4
0000000145b7e642 41b901000000                   mov r9d, 1
0000000145b7e648 e843dd4600                     call 0x145fec390
0000000145b7e64d 90                             nop
0000000145b7e64e 488b5500                       mov rdx, qword ptr [rbp]
0000000145b7e652 e9c8feffff                     jmp 0x145b7e51f
0000000145b7e657 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145b7e660 488d4dd0                       lea rcx, [rbp - 0x30]
0000000145b7e664 41b901000000                   mov r9d, 1
0000000145b7e66a 4c89f2                         mov rdx, r14
0000000145b7e66d 4989f8                         mov r8, rdi
0000000145b7e670 e81bdd4600                     call 0x145fec390
0000000145b7e675 90                             nop
0000000145b7e676 4c8b7dd0                       mov r15, qword ptr [rbp - 0x30]
0000000145b7e67a 4c8b75e0                       mov r14, qword ptr [rbp - 0x20]
0000000145b7e67e e9e2feffff                     jmp 0x145b7e565
0000000145b7e683 b901000000                     mov ecx, 1
0000000145b7e688 ba20000000                     mov edx, 0x20
0000000145b7e68d e8295a6100                     call 0x1461940bb
0000000145b7e692 0f0b                           ud2
