145978ab6: f2450f108e80010000 movsd xmm9, qword ptr [r14 + 0x180]
145978abf: f3450f109688010000 movss xmm10, dword ptr [r14 + 0x188]
145978ac8: 498bb6f0000000 mov rsi, qword ptr [r14 + 0xf0]
145978acf: 4981c6d0000000 add r14, 0xd0
145978ad6: 0f2ef0 ucomiss xmm6, xmm0
145978ad9: 0f93c3 setae bl
145978adc: 410f1006 movups xmm0, xmmword ptr [r14]
145978ae0: 0f298560020000 movaps xmmword ptr [rbp + 0x260], xmm0
145978ae7: 488bbd08010000 mov rdi, qword ptr [rbp + 0x108]
145978aee: 483bbdf8000000 cmp rdi, qword ptr [rbp + 0xf8]
145978af5: 7561 jne 0x145978b58
145978af7: c6853703000001 mov byte ptr [rbp + 0x337], 1
145978afe: c6853603000001 mov byte ptr [rbp + 0x336], 1
145978b05: c6853503000001 mov byte ptr [rbp + 0x335], 1
145978b0c: c6853403000001 mov byte ptr [rbp + 0x334], 1
145978b13: c6853303000001 mov byte ptr [rbp + 0x333], 1
145978b1a: c6853203000001 mov byte ptr [rbp + 0x332], 1
145978b21: c6853103000001 mov byte ptr [rbp + 0x331], 1
145978b28: c6853003000001 mov byte ptr [rbp + 0x330], 1
145978b2f: c6852f03000001 mov byte ptr [rbp + 0x32f], 1
145978b36: c6852e03000001 mov byte ptr [rbp + 0x32e], 1
145978b3d: c6852d03000001 mov byte ptr [rbp + 0x32d], 1
145978b44: c6852c03000001 mov byte ptr [rbp + 0x32c], 1
145978b4b: 488d8df8000000 lea rcx, [rbp + 0xf8]
145978b52: e829232800 call 0x145bfae80
145978b57: 90 nop
145978b58: 488b8500010000 mov rax, qword ptr [rbp + 0x100]
145978b5f: 488d0cbf lea rcx, [rdi + rdi*4]
145978b63: 0f288560020000 movaps xmm0, xmmword ptr [rbp + 0x260]
145978b6a: 0f1104c8 movups xmmword ptr [rax + rcx*8], xmm0
145978b6e: 488974c810 mov qword ptr [rax + rcx*8 + 0x10], rsi
145978b73: 440f134cc818 movlps qword ptr [rax + rcx*8 + 0x18], xmm9
145978b79: f3440f1154c820 movss dword ptr [rax + rcx*8 + 0x20], xmm10
145978b80: 885cc824 mov byte ptr [rax + rcx*8 + 0x24], bl
145978b84: 48ffc7 inc rdi
