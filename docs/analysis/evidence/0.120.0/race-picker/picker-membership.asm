00000001402fd659  488b9568040000         mov rdx, qword ptr [rbp + 0x468]
00000001402fd660  4c8b8570040000         mov r8, qword ptr [rbp + 0x470]
00000001402fd667  4983f80f               cmp r8, 0xf
00000001402fd66b  4889b5000b0000         mov qword ptr [rbp + 0xb00], rsi
00000001402fd672  773c                   ja 0x1402fd6b0
00000001402fd674  4d85c0                 test r8, r8
00000001402fd677  744a                   je 0x1402fd6c3
00000001402fd679  49ffc8                 dec r8
00000001402fd67c  31c0                   xor eax, eax
00000001402fd67e  488db560050000         lea rsi, [rbp + 0x560]
00000001402fd685  66662e0f1f840000000000 nop word ptr cs:[rax + rax]
00000001402fd690  44383c02               cmp byte ptr [rdx + rax], r15b
00000001402fd694  400f94c7               sete dil
00000001402fd698  7432                   je 0x1402fd6cc
00000001402fd69a  4939c0                 cmp r8, rax
00000001402fd69d  488d4001               lea rax, [rax + 1]
00000001402fd6a1  75ed                   jne 0x1402fd690
00000001402fd6a3  eb27                   jmp 0x1402fd6cc
00000001402fd6a5  66662e0f1f840000000000 nop word ptr cs:[rax + rax]
00000001402fd6b0  4489f9                 mov ecx, r15d
00000001402fd6b3  e8781bc805             call 0x145f7f230
00000001402fd6b8  90                     nop
00000001402fd6b9  4883f801               cmp rax, 1
00000001402fd6bd  400f94c7               sete dil
00000001402fd6c1  eb02                   jmp 0x1402fd6c5
00000001402fd6c3  31ff                   xor edi, edi
00000001402fd6c5  488db560050000         lea rsi, [rbp + 0x560]
