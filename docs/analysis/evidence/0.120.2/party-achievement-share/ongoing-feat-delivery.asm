145b01b00 55 push rbp
145b01b01 56 push rsi
145b01b02 57 push rdi
145b01b03 53 push rbx
145b01b04 4881ec88010000 sub rsp, 0x188
145b01b0b 488dac2480000000 lea rbp, [rsp + 0x80]
145b01b13 48c78500010000feffffff mov qword ptr [rbp + 0x100], 0xfffffffffffffffe
145b01b1e 4889ce mov rsi, rcx
145b01b21 488d4da0 lea rcx, [rbp - 0x60]
145b01b25 4889f2 mov rdx, rsi
145b01b28 e873ea0100 call 0x145b205a0
145b01b2d 48837da0ff cmp qword ptr [rbp - 0x60], -1
145b01b32 0f848f000000 je 0x145b01bc7
145b01b38 488d5d40 lea rbx, [rbp + 0x40]
145b01b3c 488d55a0 lea rdx, [rbp - 0x60]
145b01b40 41b8a0000000 mov r8d, 0xa0
145b01b46 4889d9 mov rcx, rbx
145b01b49 e8dd924a00 call 0x145faae2b
145b01b4e 488dbe38100000 lea rdi, [rsi + 0x1038]
145b01b55 488d8de0000000 lea rcx, [rbp + 0xe0]
145b01b5c 4889fa mov rdx, rdi
145b01b5f 4989d8 mov r8, rbx
145b01b62 e889e50300 call 0x145b400f0
145b01b67 90 nop 
145b01b68 4883bdf000000000 cmp qword ptr [rbp + 0xf0], 0
145b01b70 7429 je 0x145b01b9b
145b01b72 c685ff00000001 mov byte ptr [rbp + 0xff], 1
145b01b79 4889f9 mov rcx, rdi
145b01b7c e80f05f9ff call 0x145a92090
145b01b81 90 nop 
145b01b82 c685ff00000000 mov byte ptr [rbp + 0xff], 0
145b01b89 488d95e0000000 lea rdx, [rbp + 0xe0]
145b01b90 4889f1 mov rcx, rsi
145b01b93 e818be0100 call 0x145b1d9b0
145b01b98 90 nop 
145b01b99 eb22 jmp 0x145b01bbd
145b01b9b 488b95e0000000 mov rdx, qword ptr [rbp + 0xe0]
145b01ba2 4885d2 test rdx, rdx
145b01ba5 7416 je 0x145b01bbd
145b01ba7 488b8de8000000 mov rcx, qword ptr [rbp + 0xe8]
145b01bae 48c1e203 shl rdx, 3
145b01bb2 41b808000000 mov r8d, 8
145b01bb8 e8130650fa call 0x1400021d0
145b01bbd 488d4d40 lea rcx, [rbp + 0x40]
145b01bc1 e8cac0ffff call 0x145afdc90
145b01bc6 90 nop 
145b01bc7 4881c488010000 add rsp, 0x188
145b01bce 5b pop rbx
145b01bcf 5f pop rdi
145b01bd0 5e pop rsi
145b01bd1 5d pop rbp
145b01bd2 c3 ret 
