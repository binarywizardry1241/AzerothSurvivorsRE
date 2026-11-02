0000000145b74ad5 4889ce                         mov rsi, rcx
0000000145b74ad8 488b1a                         mov rbx, qword ptr [rdx]
0000000145b74adb b101                           mov cl, 1
0000000145b74add 31c0                           xor eax, eax
0000000145b74adf f00fb04b10                     lock cmpxchg byte ptr [rbx + 0x10], cl
0000000145b74ae4 0f85b5000000                   jne 0x145b74b9f
0000000145b74aea 488b3d87309c02                 mov rdi, qword ptr [rip + 0x29c3087]
0000000145b74af1 488b07                         mov rax, qword ptr [rdi]
0000000145b74af4 48d1e0                         shl rax, 1
0000000145b74af7 4885c0                         test rax, rax
0000000145b74afa 0f85ad000000                   jne 0x145b74bad
0000000145b74b00 c745fc00000000                 mov dword ptr [rbp - 4], 0
0000000145b74b07 0fb64311                       movzx eax, byte ptr [rbx + 0x11]
0000000145b74b0b 488d4b18                       lea rcx, [rbx + 0x18]
0000000145b74b0f 48895df0                       mov qword ptr [rbp - 0x10], rbx
0000000145b74b13 e8b801ffff                     call 0x145b64cd0
0000000145b74b18 90                             nop
