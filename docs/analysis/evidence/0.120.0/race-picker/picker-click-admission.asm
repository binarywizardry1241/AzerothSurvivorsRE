00000001402fdef0  4538f7                 cmp r15b, r14b
00000001402fdef3  0f94c0                 sete al
00000001402fdef6  4080f701               xor dil, 1
00000001402fdefa  4008c7                 or dil, al
00000001402fdefd  4889f0                 mov rax, rsi
00000001402fdf00  0f852af7ffff           jne 0x1402fd630
00000001402fdf06  0f1005c38beb05         movups xmm0, xmmword ptr [rip + 0x5eb8bc3]
00000001402fdf0d  0f298550080000         movaps xmmword ptr [rbp + 0x850], xmm0
00000001402fdf14  c785600800000000803f   mov dword ptr [rbp + 0x860], 0x3f800000
00000001402fdf1e  0f10054b8beb05         movups xmm0, xmmword ptr [rip + 0x5eb8b4b]
00000001402fdf25  488d8db8080000         lea rcx, [rbp + 0x8b8]
00000001402fdf2c  0f1141ac               movups xmmword ptr [rcx - 0x54], xmm0
00000001402fdf30  c741bc0000803f         mov dword ptr [rcx - 0x44], 0x3f800000
00000001402fdf37  0f288550080000         movaps xmm0, xmmword ptr [rbp + 0x850]
00000001402fdf3e  0f288d60080000         movaps xmm1, xmmword ptr [rbp + 0x860]
00000001402fdf45  0f298580050000         movaps xmmword ptr [rbp + 0x580], xmm0
00000001402fdf4c  0f298d90050000         movaps xmmword ptr [rbp + 0x590], xmm1
00000001402fdf53  488b8570080000         mov rax, qword ptr [rbp + 0x870]
00000001402fdf5a  488985a0050000         mov qword ptr [rbp + 0x5a0], rax
00000001402fdf61  488941c3               mov qword ptr [rcx - 0x3d], rax
00000001402fdf65  0f1149b3               movups xmmword ptr [rcx - 0x4d], xmm1
00000001402fdf69  0f1141a3               movups xmmword ptr [rcx - 0x5d], xmm0
00000001402fdf6d  488b8d28080000         mov rcx, qword ptr [rbp + 0x828]
00000001402fdf74  488b01                 mov rax, qword ptr [rcx]
00000001402fdf77  4c8b7110               mov r14, qword ptr [rcx + 0x10]
00000001402fdf7b  4c29f0                 sub rax, r14
00000001402fdf7e  4883f877               cmp rax, 0x77
00000001402fdf82  0f86d8000000           jbe 0x1402fe060
00000001402fdf88  488b9528080000         mov rdx, qword ptr [rbp + 0x828]
00000001402fdf8f  488b4208               mov rax, qword ptr [rdx + 8]
00000001402fdf93  488d0d267d0400         lea rcx, [rip + 0x47d26]
00000001402fdf9a  4a890c30               mov qword ptr [rax + r14], rcx
00000001402fdf9e  4a895c3008             mov qword ptr [rax + r14 + 8], rbx
00000001402fdfa3  42c744301004000000     mov dword ptr [rax + r14 + 0x10], 4
00000001402fdfac  46887c3014             mov byte ptr [rax + r14 + 0x14], r15b
00000001402fdfb1  0f108550080000         movups xmm0, xmmword ptr [rbp + 0x850]
00000001402fdfb8  0f108d60080000         movups xmm1, xmmword ptr [rbp + 0x860]
00000001402fdfbf  0f109570080000         movups xmm2, xmmword ptr [rbp + 0x870]
00000001402fdfc6  420f11443015           movups xmmword ptr [rax + r14 + 0x15], xmm0
00000001402fdfcc  420f114c3025           movups xmmword ptr [rax + r14 + 0x25], xmm1
00000001402fdfd2  420f11543035           movups xmmword ptr [rax + r14 + 0x35], xmm2
00000001402fdfd8  8b8d7f080000           mov ecx, dword ptr [rbp + 0x87f]
00000001402fdfde  42894c3044             mov dword ptr [rax + r14 + 0x44], ecx
00000001402fdfe3  42c744304800000040     mov dword ptr [rax + r14 + 0x48], 0x40000000
00000001402fdfec  0f1005658beb05         movups xmm0, xmmword ptr [rip + 0x5eb8b65]
00000001402fdff3  420f1144304c           movups xmmword ptr [rax + r14 + 0x4c], xmm0
00000001402fdff9  0f1005688beb05         movups xmm0, xmmword ptr [rip + 0x5eb8b68]
00000001402fe000  420f1144305c           movups xmmword ptr [rax + r14 + 0x5c], xmm0
00000001402fe006  42c644307000           mov byte ptr [rax + r14 + 0x70], 0
00000001402fe00c  4983c678               add r14, 0x78
00000001402fe010  4c897210               mov qword ptr [rdx + 0x10], r14
00000001402fe014  4889f0                 mov rax, rsi
