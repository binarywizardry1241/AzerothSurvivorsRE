; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone5.0.7
0000000145bf6d20 55                             push rbp
0000000145bf6d21 56                             push rsi
0000000145bf6d22 57                             push rdi
0000000145bf6d23 4881ece0000000                 sub rsp, 0xe0
0000000145bf6d2a 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145bf6d32 48c74558feffffff               mov qword ptr [rbp + 0x58], 0xfffffffffffffffe
0000000145bf6d3a 89d7                           mov edi, edx
0000000145bf6d3c 4889ce                         mov rsi, rcx
0000000145bf6d3f 488d4da8                       lea rcx, [rbp - 0x58]
0000000145bf6d43 4c89c2                         mov rdx, r8
0000000145bf6d46 e885f1ffff                     call 0x145bf5ed0
0000000145bf6d4b 897dc0                         mov dword ptr [rbp - 0x40], edi
0000000145bf6d4e 48b80500000000000080           movabs rax, 0x8000000000000005
0000000145bf6d58 488945a0                       mov qword ptr [rbp - 0x60], rax
0000000145bf6d5c 48837e60ff                     cmp qword ptr [rsi + 0x60], -1
0000000145bf6d61 7429                           je 0x145bf6d8c
0000000145bf6d63 488bbe18010000                 mov rdi, qword ptr [rsi + 0x118]
0000000145bf6d6a 488bb620010000                 mov rsi, qword ptr [rsi + 0x120]
0000000145bf6d71 488d4d40                       lea rcx, [rbp + 0x40]
0000000145bf6d75 488d55a0                       lea rdx, [rbp - 0x60]
0000000145bf6d79 e8c2402100                     call 0x145e0ae40
0000000145bf6d7e 90                             nop 
0000000145bf6d7f 488d5540                       lea rdx, [rbp + 0x40]
0000000145bf6d83 4889f9                         mov rcx, rdi
0000000145bf6d86 ff5618                         call qword ptr [rsi + 0x18]
0000000145bf6d89 90                             nop 
0000000145bf6d8a eb27                           jmp 0x145bf6db3
0000000145bf6d8c 488bbe68010000                 mov rdi, qword ptr [rsi + 0x168]
0000000145bf6d93 488bb670010000                 mov rsi, qword ptr [rsi + 0x170]
0000000145bf6d9a 488d4d40                       lea rcx, [rbp + 0x40]
0000000145bf6d9e 488d55a0                       lea rdx, [rbp - 0x60]
0000000145bf6da2 e899402100                     call 0x145e0ae40
0000000145bf6da7 90                             nop 
0000000145bf6da8 488d5540                       lea rdx, [rbp + 0x40]
0000000145bf6dac 4889f9                         mov rcx, rdi
0000000145bf6daf ff5618                         call qword ptr [rsi + 0x18]
0000000145bf6db2 90                             nop 
0000000145bf6db3 488d4da0                       lea rcx, [rbp - 0x60]
0000000145bf6db7 e884ccffff                     call 0x145bf3a40
0000000145bf6dbc 90                             nop 
0000000145bf6dbd 4881c4e0000000                 add rsp, 0xe0
0000000145bf6dc4 5f                             pop rdi
0000000145bf6dc5 5e                             pop rsi
0000000145bf6dc6 5d                             pop rbp
0000000145bf6dc7 c3                             ret 
