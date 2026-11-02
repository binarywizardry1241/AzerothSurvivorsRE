; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone 5.0.7; static observations, no target execution.
0000000145c04f50 56                             push rsi
0000000145c04f51 57                             push rdi
0000000145c04f52 4883ec28                       sub rsp, 0x28
0000000145c04f56 80790801                       cmp byte ptr [rcx + 8], 1
0000000145c04f5a 753e                           jne 0x145c04f9a
0000000145c04f5c 488b31                         mov rsi, qword ptr [rcx]
0000000145c04f5f b101                           mov cl, 1
0000000145c04f61 31c0                           xor eax, eax
0000000145c04f63 f00fb04e10                     lock cmpxchg byte ptr [rsi + 0x10], cl
0000000145c04f68 757a                           jne 0x145c04fe4
0000000145c04f6a 488b3d07fc9202                 mov rdi, qword ptr [rip + 0x292fc07]
0000000145c04f71 488b07                         mov rax, qword ptr [rdi]
0000000145c04f74 48d1e0                         shl rax, 1
0000000145c04f77 4885c0                         test rax, rax
0000000145c04f7a 7576                           jne 0x145c04ff2
0000000145c04f7c 31c9                           xor ecx, ecx
0000000145c04f7e 0fb64611                       movzx eax, byte ptr [rsi + 0x11]
0000000145c04f82 48837e78ff                     cmp qword ptr [rsi + 0x78], -1
0000000145c04f87 7409                           je 0x145c04f92
0000000145c04f89 80be4101000001                 cmp byte ptr [rsi + 0x141], 1
0000000145c04f90 7511                           jne 0x145c04fa3
0000000145c04f92 31c0                           xor eax, eax
0000000145c04f94 84c9                           test cl, cl
0000000145c04f96 7419                           je 0x145c04fb1
0000000145c04f98 eb29                           jmp 0x145c04fc3
0000000145c04f9a 31c0                           xor eax, eax
0000000145c04f9c 4883c428                       add rsp, 0x28
0000000145c04fa0 5f                             pop rdi
0000000145c04fa1 5e                             pop rsi
0000000145c04fa2 c3                             ret
0000000145c04fa3 83be28010000ff                 cmp dword ptr [rsi + 0x128], -1
0000000145c04faa 0f95c0                         setne al
0000000145c04fad 84c9                           test cl, cl
0000000145c04faf 7512                           jne 0x145c04fc3
0000000145c04fb1 48b9ffffffffffffff7f           movabs rcx, 0x7fffffffffffffff
0000000145c04fbb 488b17                         mov rdx, qword ptr [rdi]
0000000145c04fbe 4885ca                         test rdx, rcx
0000000145c04fc1 7546                           jne 0x145c05009
0000000145c04fc3 31c9                           xor ecx, ecx
0000000145c04fc5 864e10                         xchg byte ptr [rsi + 0x10], cl
0000000145c04fc8 80f902                         cmp cl, 2
0000000145c04fcb 75cf                           jne 0x145c04f9c
0000000145c04fcd 4883c610                       add rsi, 0x10
0000000145c04fd1 4889f1                         mov rcx, rsi
0000000145c04fd4 89c6                           mov esi, eax
0000000145c04fd6 e835b85400                     call 0x146150810
0000000145c04fdb 89f0                           mov eax, esi
0000000145c04fdd 4883c428                       add rsp, 0x28
0000000145c04fe1 5f                             pop rdi
0000000145c04fe2 5e                             pop rsi
0000000145c04fe3 c3                             ret
0000000145c04fe4 488d4e10                       lea rcx, [rsi + 0x10]
0000000145c04fe8 e863b75400                     call 0x146150750
0000000145c04fed e978ffffff                     jmp 0x145c04f6a
0000000145c04ff2 e8e9c45400                     call 0x1461514e0
0000000145c04ff7 89c1                           mov ecx, eax
0000000145c04ff9 80f101                         xor cl, 1
0000000145c04ffc 0fb64611                       movzx eax, byte ptr [rsi + 0x11]
0000000145c05000 48837e78ff                     cmp qword ptr [rsi + 0x78], -1
0000000145c05005 7582                           jne 0x145c04f89
0000000145c05007 eb89                           jmp 0x145c04f92
0000000145c05009 89c7                           mov edi, eax
0000000145c0500b e8d0c45400                     call 0x1461514e0
0000000145c05010 89c1                           mov ecx, eax
0000000145c05012 89f8                           mov eax, edi
0000000145c05014 84c9                           test cl, cl
0000000145c05016 75ab                           jne 0x145c04fc3
0000000145c05018 c6461101                       mov byte ptr [rsi + 0x11], 1
0000000145c0501c eba5                           jmp 0x145c04fc3
