0000000145a92054  4c89f1                 mov rcx, r14
0000000145a92057  8801                   mov byte ptr [rcx], al
0000000145a92059  498d4602               lea rax, [r14 + 2]
0000000145a9205d  4883fe02               cmp rsi, 2
0000000145a92061  753b                   jne 0x145a9209e
0000000145a92063  488bb5d8000000         mov rsi, qword ptr [rbp + 0xd8]
0000000145a9206a  4883fe02               cmp rsi, 2
0000000145a9206e  0f821de0ffff           jb 0x145a90091
0000000145a92074  4c8bb5d0000000         mov r14, qword ptr [rbp + 0xd0]
0000000145a9207b  488d46ff               lea rax, [rsi - 1]
0000000145a9207f  31d2                   xor edx, edx
0000000145a92081  410fb64c1601           movzx ecx, byte ptr [r14 + rdx + 1]
0000000145a92087  413a0c16               cmp cl, byte ptr [r14 + rdx]
0000000145a9208b  0f8494000000           je 0x145a92125
0000000145a92091  48ffc2                 inc rdx
0000000145a92094  4839d0                 cmp rax, rdx
0000000145a92097  75e8                   jne 0x145a92081
0000000145a92099  e9f3dfffff             jmp 0x145a90091
0000000145a9209e  4c01f6                 add rsi, r14
0000000145a920a1  488d4801               lea rcx, [rax + 1]
0000000145a920a5  eb13                   jmp 0x145a920ba
0000000145a920a7  4d89f1                 mov r9, r14
0000000145a920aa  418811                 mov byte ptr [r9], dl
0000000145a920ad  4883c002               add rax, 2
0000000145a920b1  4883c102               add rcx, 2
0000000145a920b5  4839f0                 cmp rax, rsi
0000000145a920b8  74a9                   je 0x145a92063
0000000145a920ba  440fb640ff             movzx r8d, byte ptr [rax - 1]
0000000145a920bf  0fb610                 movzx edx, byte ptr [rax]
0000000145a920c2  4438c2                 cmp dl, r8b
0000000145a920c5  731e                   jae 0x145a920e5
0000000145a920c7  4989c2                 mov r10, rax
0000000145a920ca  4d8d4aff               lea r9, [r10 - 1]
0000000145a920ce  458802                 mov byte ptr [r10], r8b
0000000145a920d1  4d39f1                 cmp r9, r14
0000000145a920d4  741e                   je 0x145a920f4
0000000145a920d6  450fb642fe             movzx r8d, byte ptr [r10 - 2]
0000000145a920db  4d89ca                 mov r10, r9
0000000145a920de  4438c2                 cmp dl, r8b
0000000145a920e1  72e7                   jb 0x145a920ca
0000000145a920e3  eb12                   jmp 0x145a920f7
0000000145a920e5  440fb600               movzx r8d, byte ptr [rax]
0000000145a920e9  0fb65001               movzx edx, byte ptr [rax + 1]
0000000145a920ed  4438c2                 cmp dl, r8b
0000000145a920f0  73bb                   jae 0x145a920ad
0000000145a920f2  eb13                   jmp 0x145a92107
0000000145a920f4  4d89f1                 mov r9, r14
0000000145a920f7  418811                 mov byte ptr [r9], dl
0000000145a920fa  440fb600               movzx r8d, byte ptr [rax]
0000000145a920fe  0fb65001               movzx edx, byte ptr [rax + 1]
0000000145a92102  4438c2                 cmp dl, r8b
0000000145a92105  73a6                   jae 0x145a920ad
0000000145a92107  4989ca                 mov r10, rcx
0000000145a9210a  4d8d4aff               lea r9, [r10 - 1]
0000000145a9210e  458802                 mov byte ptr [r10], r8b
0000000145a92111  4d39f1                 cmp r9, r14
0000000145a92114  7491                   je 0x145a920a7
0000000145a92116  450fb642fe             movzx r8d, byte ptr [r10 - 2]
0000000145a9211b  4d89ca                 mov r10, r9
0000000145a9211e  4438c2                 cmp dl, r8b
0000000145a92121  72e7                   jb 0x145a9210a
0000000145a92123  eb85                   jmp 0x145a920aa
0000000145a92125  488d4a02               lea rcx, [rdx + 2]
0000000145a92129  488d4201               lea rax, [rdx + 1]
0000000145a9212d  4839f1                 cmp rcx, rsi
0000000145a92130  732e                   jae 0x145a92160
0000000145a92132  4189f1                 mov r9d, esi
0000000145a92135  4129d1                 sub r9d, edx
0000000145a92138  4c8d46fd               lea r8, [rsi - 3]
0000000145a9213c  41f6c101               test r9b, 1
0000000145a92140  7419                   je 0x145a9215b
0000000145a92142  410fb64c1602           movzx ecx, byte ptr [r14 + rdx + 2]
0000000145a92148  413a0c16               cmp cl, byte ptr [r14 + rdx]
0000000145a9214c  7409                   je 0x145a92157
0000000145a9214e  41884c1601             mov byte ptr [r14 + rdx + 1], cl
0000000145a92153  488d4202               lea rax, [rdx + 2]
0000000145a92157  488d4a03               lea rcx, [rdx + 3]
0000000145a9215b  4939d0                 cmp r8, rdx
0000000145a9215e  7515                   jne 0x145a92175
0000000145a92160  488985d8000000         mov qword ptr [rbp + 0xd8], rax
0000000145a92167  e925dfffff             jmp 0x145a90091
0000000145a9216c  4883c102               add rcx, 2
0000000145a92170  4839ce                 cmp rsi, rcx
0000000145a92173  74eb                   je 0x145a92160
0000000145a92175  410fb6140e             movzx edx, byte ptr [r14 + rcx]
0000000145a9217a  413a5406ff             cmp dl, byte ptr [r14 + rax - 1]
0000000145a9217f  750f                   jne 0x145a92190
0000000145a92181  410fb6540e01           movzx edx, byte ptr [r14 + rcx + 1]
0000000145a92187  413a5406ff             cmp dl, byte ptr [r14 + rax - 1]
0000000145a9218c  74de                   je 0x145a9216c
0000000145a9218e  eb14                   jmp 0x145a921a4
0000000145a92190  41881406               mov byte ptr [r14 + rax], dl
0000000145a92194  48ffc0                 inc rax
0000000145a92197  410fb6540e01           movzx edx, byte ptr [r14 + rcx + 1]
0000000145a9219d  413a5406ff             cmp dl, byte ptr [r14 + rax - 1]
0000000145a921a2  74c8                   je 0x145a9216c
0000000145a921a4  41881406               mov byte ptr [r14 + rax], dl
0000000145a921a8  48ffc0                 inc rax
0000000145a921ab  ebbf                   jmp 0x145a9216c
