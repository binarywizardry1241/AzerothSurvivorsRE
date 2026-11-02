00000001458e0854  4883f801                 cmp rax, 1
00000001458e0858  7541                     jne 0x1458e089b
00000001458e085a  48895608                 mov qword ptr [rsi + 8], rdx
00000001458e085e  48c70600000000           mov qword ptr [rsi], 0
00000001458e0865  488b4540                 mov rax, qword ptr [rbp + 0x40]
00000001458e0869  f048ff08                 lock dec qword ptr [rax]
00000001458e086d  750a                     jne 0x1458e0879
00000001458e086f  488d4d40                 lea rcx, [rbp + 0x40]
00000001458e0873  e878a62c00               call 0x145baaef0
00000001458e0878  90                       nop
00000001458e0879  488b4550                 mov rax, qword ptr [rbp + 0x50]
00000001458e087d  f048ff08                 lock dec qword ptr [rax]
00000001458e0881  752b                     jne 0x1458e08ae
00000001458e0883  c6455f00                 mov byte ptr [rbp + 0x5f], 0
00000001458e0887  c6455e00                 mov byte ptr [rbp + 0x5e], 0
00000001458e088b  c6455d00                 mov byte ptr [rbp + 0x5d], 0
00000001458e088f  488d4d50                 lea rcx, [rbp + 0x50]
00000001458e0893  e898a72c00               call 0x145bab030
00000001458e0898  90                       nop
00000001458e0899  eb13                     jmp 0x1458e08ae
00000001458e089b  488b4550                 mov rax, qword ptr [rbp + 0x50]
00000001458e089f  488b4d40                 mov rcx, qword ptr [rbp + 0x40]
00000001458e08a3  488906                   mov qword ptr [rsi], rax
00000001458e08a6  48894e08                 mov qword ptr [rsi + 8], rcx
00000001458e08aa  48895610                 mov qword ptr [rsi + 0x10], rdx
00000001458e08ae  4889f0                   mov rax, rsi
