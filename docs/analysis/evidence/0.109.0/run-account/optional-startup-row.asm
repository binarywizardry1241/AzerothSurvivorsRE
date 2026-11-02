1458ad1b3 4c8b8560020000 mov r8, qword ptr [rbp + 0x260]
1458ad1ba 498b00 mov rax, qword ptr [r8]
1458ad1bd 48ba0000000000000080 movabs rdx, 0x8000000000000000
1458ad1c7 4831c2 xor rdx, rax
1458ad1ca 4885c0 test rax, rax
1458ad1cd b902000000 mov ecx, 2
1458ad1d2 480f48ca cmovs rcx, rdx
1458ad1d6 49c7c6ffffffff mov r14, 0xffffffffffffffff
1458ad1dd 4885c9 test rcx, rcx
1458ad1e0 740a je 0x1458ad1ec
1458ad1e2 4883f901 cmp rcx, 1
1458ad1e6 7508 jne 0x1458ad1f0
1458ad1e8 31db xor ebx, ebx
1458ad1ea eb2d jmp 0x1458ad219
1458ad1ec b301 mov bl, 1
1458ad1ee eb29 jmp 0x1458ad219
1458ad1f0 410f104008 movups xmm0, xmmword ptr [r8 + 8]
1458ad1f5 410f104818 movups xmm1, xmmword ptr [r8 + 0x18]
1458ad1fa 410f105028 movups xmm2, xmmword ptr [r8 + 0x28]
1458ad1ff 0f2995b0010000 movaps xmmword ptr [rbp + 0x1b0], xmm2
1458ad206 0f298da0010000 movaps xmmword ptr [rbp + 0x1a0], xmm1
1458ad20d 0f298590010000 movaps xmmword ptr [rbp + 0x190], xmm0
1458ad214 31db xor ebx, ebx
1458ad216 4989c6 mov r14, rax
1458ad2e0 4c89b6e00e0000 mov qword ptr [rsi + 0xee0], r14
1458ad2e7 0f288d90010000 movaps xmm1, xmmword ptr [rbp + 0x190]
1458ad2ee 0f2895a0010000 movaps xmm2, xmmword ptr [rbp + 0x1a0]
1458ad2f5 0f289db0010000 movaps xmm3, xmmword ptr [rbp + 0x1b0]
1458ad2fc 0f118ee80e0000 movups xmmword ptr [rsi + 0xee8], xmm1
1458ad303 0f1196f80e0000 movups xmmword ptr [rsi + 0xef8], xmm2
1458ad30a 0f119e080f0000 movups xmmword ptr [rsi + 0xf08], xmm3
1458ad311 889e61110000 mov byte ptr [rsi + 0x1161], bl
