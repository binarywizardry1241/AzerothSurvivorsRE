0000000145c07d00 55                             push rbp
0000000145c07d01 56                             push rsi
0000000145c07d02 53                             push rbx
0000000145c07d03 4881ecc0010000                 sub rsp, 0x1c0
0000000145c07d0a 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145c07d12 48c78538010000feffffff         mov qword ptr [rbp + 0x138], 0xfffffffffffffffe
0000000145c07d1d 4889ce                         mov rsi, rcx
0000000145c07d20 488d4da8                       lea rcx, [rbp - 0x58]
0000000145c07d24 4889f2                         mov rdx, rsi
0000000145c07d27 e8e4f20100                     call 0x145c27010
0000000145c07d2c 48837da8ff                     cmp qword ptr [rbp - 0x58], -1
0000000145c07d31 7478                           je 0x145c07dab
0000000145c07d33 488d4d70                       lea rcx, [rbp + 0x70]
0000000145c07d37 488d55a8                       lea rdx, [rbp - 0x58]
0000000145c07d3b 41b8c8000000                   mov r8d, 0xc8
0000000145c07d41 e805d33f00                     call 0x14600504b
0000000145c07d46 4881c698110000                 add rsi, 0x1198
0000000145c07d4d 8a9d37010000                   mov bl, byte ptr [rbp + 0x137]
0000000145c07d53 488b4d78                       mov rcx, qword ptr [rbp + 0x78]
0000000145c07d57 488b9580000000                 mov rdx, qword ptr [rbp + 0x80]
0000000145c07d5e e8ed71eaff                     call 0x145aaef50
0000000145c07d63 4869c0f0000000                 imul rax, rax, 0xf0
0000000145c07d6a 488d15ff113d01                 lea rdx, [rip + 0x13d11ff]
0000000145c07d71 488b4c1008                     mov rcx, qword ptr [rax + rdx + 8]
0000000145c07d76 488b541010                     mov rdx, qword ptr [rax + rdx + 0x10]
0000000145c07d7b e8d071eaff                     call 0x145aaef50
0000000145c07d80 90                             nop
0000000145c07d81 4889f1                         mov rcx, rsi
0000000145c07d84 89da                           mov edx, ebx
0000000145c07d86 4989c0                         mov r8, rax
0000000145c07d89 e89225ecff                     call 0x145aca320
0000000145c07d8e 90                             nop
0000000145c07d8f 8bb534010000                   mov esi, dword ptr [rbp + 0x134]
0000000145c07d95 0fb6c0                         movzx eax, al
0000000145c07d98 4038f0                         cmp al, sil
0000000145c07d9b 0f42f0                         cmovb esi, eax
0000000145c07d9e 488d4d70                       lea rcx, [rbp + 0x70]
0000000145c07da2 e8f922eeff                     call 0x145aea0a0
0000000145c07da7 89f0                           mov eax, esi
0000000145c07da9 eb02                           jmp 0x145c07dad
0000000145c07dab 31c0                           xor eax, eax
0000000145c07dad 4881c4c0010000                 add rsp, 0x1c0
0000000145c07db4 5b                             pop rbx
0000000145c07db5 5e                             pop rsi
0000000145c07db6 5d                             pop rbp
0000000145c07db7 c3                             ret
