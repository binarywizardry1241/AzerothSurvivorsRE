; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone 5.0.7; static observations, no target execution.
0000000145bfdf90 55                             push rbp
0000000145bfdf91 56                             push rsi
0000000145bfdf92 57                             push rdi
0000000145bfdf93 53                             push rbx
0000000145bfdf94 4883ec58                       sub rsp, 0x58
0000000145bfdf98 488d6c2450                     lea rbp, [rsp + 0x50]
0000000145bfdf9d 48c74500feffffff               mov qword ptr [rbp], 0xfffffffffffffffe
0000000145bfdfa5 488b19                         mov rbx, qword ptr [rcx]
0000000145bfdfa8 b101                           mov cl, 1
0000000145bfdfaa 31c0                           xor eax, eax
0000000145bfdfac f00fb04b10                     lock cmpxchg byte ptr [rbx + 0x10], cl
0000000145bfdfb1 756b                           jne 0x145bfe01e
0000000145bfdfb3 488b3dbe6b9302                 mov rdi, qword ptr [rip + 0x2936bbe]
0000000145bfdfba 488b07                         mov rax, qword ptr [rdi]
0000000145bfdfbd 48d1e0                         shl rax, 1
0000000145bfdfc0 4885c0                         test rax, rax
0000000145bfdfc3 756a                           jne 0x145bfe02f
0000000145bfdfc5 c745fc00000000                 mov dword ptr [rbp - 4], 0
0000000145bfdfcc 0fb64311                       movzx eax, byte ptr [rbx + 0x11]
0000000145bfdfd0 488bb380010000                 mov rsi, qword ptr [rbx + 0x180]
0000000145bfdfd7 48895df0                       mov qword ptr [rbp - 0x10], rbx
0000000145bfdfdb 488b9b88010000                 mov rbx, qword ptr [rbx + 0x188]
0000000145bfdfe2 488d4dd8                       lea rcx, [rbp - 0x28]
0000000145bfdfe6 e855ce2000                     call 0x145e0ae40
0000000145bfdfeb 90                             nop
0000000145bfdfec 488d55d8                       lea rdx, [rbp - 0x28]
0000000145bfdff0 4889f1                         mov rcx, rsi
0000000145bfdff3 ff5318                         call qword ptr [rbx + 0x18]
0000000145bfdff6 90                             nop
0000000145bfdff7 807dfc00                       cmp byte ptr [rbp - 4], 0
0000000145bfdffb 488b75f0                       mov rsi, qword ptr [rbp - 0x10]
0000000145bfdfff 750b                           jne 0x145bfe00c
0000000145bfe001 488b07                         mov rax, qword ptr [rdi]
0000000145bfe004 48d1e0                         shl rax, 1
0000000145bfe007 4885c0                         test rax, rax
0000000145bfe00a 7543                           jne 0x145bfe04f
0000000145bfe00c 31c0                           xor eax, eax
0000000145bfe00e 864610                         xchg byte ptr [rsi + 0x10], al
0000000145bfe011 3c02                           cmp al, 2
0000000145bfe013 742c                           je 0x145bfe041
0000000145bfe015 4883c458                       add rsp, 0x58
0000000145bfe019 5b                             pop rbx
0000000145bfe01a 5f                             pop rdi
0000000145bfe01b 5e                             pop rsi
0000000145bfe01c 5d                             pop rbp
0000000145bfe01d c3                             ret
0000000145bfe01e 488d4b10                       lea rcx, [rbx + 0x10]
0000000145bfe022 4889d6                         mov rsi, rdx
0000000145bfe025 e826275500                     call 0x146150750
0000000145bfe02a 4889f2                         mov rdx, rsi
0000000145bfe02d eb84                           jmp 0x145bfdfb3
0000000145bfe02f 4889d6                         mov rsi, rdx
0000000145bfe032 e8a9345500                     call 0x1461514e0
0000000145bfe037 4889f2                         mov rdx, rsi
0000000145bfe03a 3401                           xor al, 1
0000000145bfe03c 8945fc                         mov dword ptr [rbp - 4], eax
0000000145bfe03f eb8b                           jmp 0x145bfdfcc
0000000145bfe041 4883c610                       add rsi, 0x10
0000000145bfe045 4889f1                         mov rcx, rsi
0000000145bfe048 e8c3275500                     call 0x146150810
0000000145bfe04d ebc6                           jmp 0x145bfe015
0000000145bfe04f e88c345500                     call 0x1461514e0
0000000145bfe054 84c0                           test al, al
0000000145bfe056 75b4                           jne 0x145bfe00c
0000000145bfe058 c6461101                       mov byte ptr [rsi + 0x11], 1
0000000145bfe05c ebae                           jmp 0x145bfe00c
