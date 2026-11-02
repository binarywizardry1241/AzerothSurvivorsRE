0000000145b921e5 8b85a00a0000                   mov eax, dword ptr [rbp + 0xaa0]
0000000145b921eb 488985a80b0000                 mov qword ptr [rbp + 0xba8], rax
0000000145b921f2 488bb5a80a0000                 mov rsi, qword ptr [rbp + 0xaa8]
0000000145b921f9 c685bf0b000001                 mov byte ptr [rbp + 0xbbf], 1
0000000145b92200 e8fb904700                     call 0x14600b300
0000000145b92205 90                             nop 
0000000145b92206 488985080b0000                 mov qword ptr [rbp + 0xb08], rax
0000000145b9220d 8995100b0000                   mov dword ptr [rbp + 0xb10], edx
0000000145b92213 c685bf0b000001                 mov byte ptr [rbp + 0xbbf], 1
0000000145b9221a 488d8dd00a0000                 lea rcx, [rbp + 0xad0]
0000000145b92221 e82a924700                     call 0x14600b450
0000000145b92226 90                             nop 
0000000145b92227 4885f6                         test rsi, rsi
0000000145b9222a 7464                           je 0x145b92290
0000000145b9222c 488b8da80b0000                 mov rcx, qword ptr [rbp + 0xba8]
0000000145b92233 803906                         cmp byte ptr [rcx], 6
0000000145b92236 0f94c1                         sete cl
0000000145b92239 4883fe0a                       cmp rsi, 0xa
0000000145b9223d 410f93c0                       setae r8b
0000000145b92241 4120c8                         and r8b, cl
0000000145b92244 4180f801                       cmp r8b, 1
0000000145b92248 7546                           jne 0x145b92290
0000000145b9224a 488b8da80b0000                 mov rcx, qword ptr [rbp + 0xba8]
0000000145b92251 80790905                       cmp byte ptr [rcx + 9], 5
0000000145b92255 0f94c1                         sete cl
0000000145b92258 4883fe12                       cmp rsi, 0x12
0000000145b9225c 410f93c0                       setae r8b
0000000145b92260 4120c8                         and r8b, cl
0000000145b92263 4180f801                       cmp r8b, 1
0000000145b92267 7527                           jne 0x145b92290
0000000145b92269 4869c040420f00                 imul rax, rax, 0xf4240
0000000145b92270 89d1                           mov ecx, edx
0000000145b92272 4869c9d34d6210                 imul rcx, rcx, 0x10624dd3
0000000145b92279 48c1e926                       shr rcx, 0x26
0000000145b9227d 4801c1                         add rcx, rax
0000000145b92280 488b85a80b0000                 mov rax, qword ptr [rbp + 0xba8]
0000000145b92287 4889480a                       mov qword ptr [rax + 0xa], rcx
0000000145b9228b 0f1f440000                     nop dword ptr [rax + rax]
