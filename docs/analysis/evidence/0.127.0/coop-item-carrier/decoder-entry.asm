0000000145d106f0 55                             push rbp
0000000145d106f1 4157                           push r15
0000000145d106f3 4156                           push r14
0000000145d106f5 4155                           push r13
0000000145d106f7 4154                           push r12
0000000145d106f9 56                             push rsi
0000000145d106fa 57                             push rdi
0000000145d106fb 53                             push rbx
0000000145d106fc 4881ec48060000                 sub rsp, 0x648
0000000145d10703 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145d1070b 66440f7f8db0050000             movdqa xmmword ptr [rbp + 0x5b0], xmm9
0000000145d10714 440f2985a0050000               movaps xmmword ptr [rbp + 0x5a0], xmm8
0000000145d1071c 660f7fbd90050000               movdqa xmmword ptr [rbp + 0x590], xmm7
0000000145d10724 660f7fb580050000               movdqa xmmword ptr [rbp + 0x580], xmm6
0000000145d1072c 48c78578050000feffffff         mov qword ptr [rbp + 0x578], 0xfffffffffffffffe
0000000145d10737 48898d38010000                 mov qword ptr [rbp + 0x138], rcx
0000000145d1073e 48899528050000                 mov qword ptr [rbp + 0x528], rdx
0000000145d10745 4c898530050000                 mov qword ptr [rbp + 0x530], r8
0000000145d1074c 48c7853805000000000000         mov qword ptr [rbp + 0x538], 0
0000000145d10757 c6854005000001                 mov byte ptr [rbp + 0x540], 1
0000000145d1075e 488db528050000                 lea rsi, [rbp + 0x528]
0000000145d10765 4889f1                         mov rcx, rsi
0000000145d10768 e8d32e1b00                     call 0x145ec3640
0000000145d1076d 0fb6c0                         movzx eax, al
0000000145d10770 ffc8                           dec eax
0000000145d10772 83f818                         cmp eax, 0x18
0000000145d10775 0f8710100000                   ja 0x145d1178b
0000000145d1077b 488d0db2e8a001                 lea rcx, [rip + 0x1a0e8b2]
0000000145d10782 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000145d10786 4801c8                         add rax, rcx
0000000145d10789 ffe0                           jmp rax
