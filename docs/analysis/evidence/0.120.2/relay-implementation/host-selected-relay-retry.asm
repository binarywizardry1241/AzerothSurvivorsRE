; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone 5.0.7; static observations, no target execution.
0000000145c03ec0 56                             push rsi
0000000145c03ec1 57                             push rdi
0000000145c03ec2 4883ec28                       sub rsp, 0x28
0000000145c03ec6 488b31                         mov rsi, qword ptr [rcx]
0000000145c03ec9 b101                           mov cl, 1
0000000145c03ecb 31c0                           xor eax, eax
0000000145c03ecd f00fb04e10                     lock cmpxchg byte ptr [rsi + 0x10], cl
0000000145c03ed2 7561                           jne 0x145c03f35
0000000145c03ed4 488b3d9d0c9302                 mov rdi, qword ptr [rip + 0x2930c9d]
0000000145c03edb 488b07                         mov rax, qword ptr [rdi]
0000000145c03ede 48d1e0                         shl rax, 1
0000000145c03ee1 4885c0                         test rax, rax
0000000145c03ee4 755a                           jne 0x145c03f40
0000000145c03ee6 31c9                           xor ecx, ecx
0000000145c03ee8 0fb64611                       movzx eax, byte ptr [rsi + 0x11]
0000000145c03eec 48837e78ff                     cmp qword ptr [rsi + 0x78], -1
0000000145c03ef1 7409                           je 0x145c03efc
0000000145c03ef3 80be4101000001                 cmp byte ptr [rsi + 0x141], 1
0000000145c03efa 7508                           jne 0x145c03f04
0000000145c03efc 31c0                           xor eax, eax
0000000145c03efe 84c9                           test cl, cl
0000000145c03f00 7410                           je 0x145c03f12
0000000145c03f02 eb20                           jmp 0x145c03f24
0000000145c03f04 83be28010000ff                 cmp dword ptr [rsi + 0x128], -1
0000000145c03f0b 0f95c0                         setne al
0000000145c03f0e 84c9                           test cl, cl
0000000145c03f10 7512                           jne 0x145c03f24
0000000145c03f12 48b9ffffffffffffff7f           movabs rcx, 0x7fffffffffffffff
0000000145c03f1c 488b17                         mov rdx, qword ptr [rdi]
0000000145c03f1f 4885ca                         test rdx, rcx
0000000145c03f22 754a                           jne 0x145c03f6e
0000000145c03f24 31c9                           xor ecx, ecx
0000000145c03f26 864e10                         xchg byte ptr [rsi + 0x10], cl
0000000145c03f29 80f902                         cmp cl, 2
0000000145c03f2c 7429                           je 0x145c03f57
0000000145c03f2e 4883c428                       add rsp, 0x28
0000000145c03f32 5f                             pop rdi
0000000145c03f33 5e                             pop rsi
0000000145c03f34 c3                             ret
0000000145c03f35 488d4e10                       lea rcx, [rsi + 0x10]
0000000145c03f39 e812c85400                     call 0x146150750
0000000145c03f3e eb94                           jmp 0x145c03ed4
0000000145c03f40 e89bd55400                     call 0x1461514e0
0000000145c03f45 89c1                           mov ecx, eax
0000000145c03f47 80f101                         xor cl, 1
0000000145c03f4a 0fb64611                       movzx eax, byte ptr [rsi + 0x11]
0000000145c03f4e 48837e78ff                     cmp qword ptr [rsi + 0x78], -1
0000000145c03f53 759e                           jne 0x145c03ef3
0000000145c03f55 eba5                           jmp 0x145c03efc
0000000145c03f57 4883c610                       add rsi, 0x10
0000000145c03f5b 4889f1                         mov rcx, rsi
0000000145c03f5e 89c6                           mov esi, eax
0000000145c03f60 e8abc85400                     call 0x146150810
0000000145c03f65 89f0                           mov eax, esi
0000000145c03f67 4883c428                       add rsp, 0x28
0000000145c03f6b 5f                             pop rdi
0000000145c03f6c 5e                             pop rsi
0000000145c03f6d c3                             ret
0000000145c03f6e 89c7                           mov edi, eax
0000000145c03f70 e86bd55400                     call 0x1461514e0
0000000145c03f75 89c1                           mov ecx, eax
0000000145c03f77 89f8                           mov eax, edi
0000000145c03f79 84c9                           test cl, cl
0000000145c03f7b 75a7                           jne 0x145c03f24
0000000145c03f7d c6461101                       mov byte ptr [rsi + 0x11], 1
0000000145c03f81 eba1                           jmp 0x145c03f24
