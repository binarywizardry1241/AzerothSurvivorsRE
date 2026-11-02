0x1458f31be: 48897da8                 mov qword ptr [rbp - 0x58], rdi
0x1458f31c2: 48897560                 mov qword ptr [rbp + 0x60], rsi
0x1458f31c6: 488975b0                 mov qword ptr [rbp - 0x50], rsi
0x1458f31ca: 48897d38                 mov qword ptr [rbp + 0x38], rdi
0x1458f31ce: 48897db8                 mov qword ptr [rbp - 0x48], rdi
0x1458f31d2: 488b9510020000           mov rdx, qword ptr [rbp + 0x210]
0x1458f31d9: 4885d2                   test rdx, rdx
0x1458f31dc: 7e0f                     jle 0x1458f31ed
0x1458f31de: 41b801000000             mov r8d, 1
0x1458f31e4: 4889d9                   mov rcx, rbx
0x1458f31e7: e8e4ef70fa               call 0x1400021d0
0x1458f31ec: 90                       nop
0x1458f31ed: 488d8d50010000           lea rcx, [rbp + 0x150]
0x1458f31f4: 488d55a8                 lea rdx, [rbp - 0x58]
0x1458f31f8: e8d3940100               call 0x14590c6d0
0x1458f31fd: 90                       nop
0x1458f31fe: 4883bd50010000ff         cmp qword ptr [rbp + 0x150], -1
0x1458f3206: 7417                     je 0x1458f321f
0x1458f3208: 488b8560010000           mov rax, qword ptr [rbp + 0x160]
0x1458f320f: 48898580000000           mov qword ptr [rbp + 0x80], rax
0x1458f3216: 0f108550010000           movups xmm0, xmmword ptr [rbp + 0x150]
0x1458f321d: eb39                     jmp 0x1458f3258
0x1458f321f: 41b801000000             mov r8d, 1
0x1458f3225: 4c89f1                   mov rcx, r14
0x1458f3228: 488d157bff5d01           lea rdx, [rip + 0x15dff7b]
0x1458f322f: e8cc960100               call 0x14590c900
0x1458f3234: 90                       nop
0x1458f3235: 4883bd10020000ff         cmp qword ptr [rbp + 0x210], -1
0x1458f323d: 0f84cc0c0000             je 0x1458f3f0f
0x1458f3243: 488b8520020000           mov rax, qword ptr [rbp + 0x220]
0x1458f324a: 48898580000000           mov qword ptr [rbp + 0x80], rax
0x1458f3251: 0f108510020000           movups xmm0, xmmword ptr [rbp + 0x210]
0x1458f3258: 0f294570                 movaps xmmword ptr [rbp + 0x70], xmm0
0x1458f325c: 488d8d50010000           lea rcx, [rbp + 0x150]
0x1458f3263: 488b5508                 mov rdx, qword ptr [rbp + 8]
0x1458f3267: e864940100               call 0x14590c6d0
0x1458f326c: 90                       nop
0x1458f326d: 4883bd50010000ff         cmp qword ptr [rbp + 0x150], -1
0x1458f3275: 7417                     je 0x1458f328e
0x1458f3277: 488b8560010000           mov rax, qword ptr [rbp + 0x160]
0x1458f327e: 48898540010000           mov qword ptr [rbp + 0x140], rax
0x1458f3285: 0f108550010000           movups xmm0, xmmword ptr [rbp + 0x150]
0x1458f328c: eb39                     jmp 0x1458f32c7
0x1458f328e: 41b801000000             mov r8d, 1
0x1458f3294: 4c89f1                   mov rcx, r14
0x1458f3297: 488d150cff5d01           lea rdx, [rip + 0x15dff0c]
0x1458f329e: e85d960100               call 0x14590c900
0x1458f32a3: 90                       nop
0x1458f32a4: 4883bd10020000ff         cmp qword ptr [rbp + 0x210], -1
0x1458f32ac: 0f84970c0000             je 0x1458f3f49
0x1458f32b2: 488b8520020000           mov rax, qword ptr [rbp + 0x220]
0x1458f32b9: 48898540010000           mov qword ptr [rbp + 0x140], rax
0x1458f32c0: 0f108510020000           movups xmm0, xmmword ptr [rbp + 0x210]
0x1458f32c7: 0f298530010000           movaps xmmword ptr [rbp + 0x130], xmm0
0x1458f32ce: 4c89f1                   mov rcx, r14
0x1458f32d1: 488d5570                 lea rdx, [rbp + 0x70]
0x1458f32d5: 4c8d8530010000           lea r8, [rbp + 0x130]
0x1458f32dc: e8ff821500               call 0x145a4b5e0
