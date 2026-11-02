145aa75a0 push rsi
145aa75a1 push rdi
145aa75a2 sub rsp, 0x28
145aa75a6 mov dword ptr [rsp + 0x24], edx
145aa75aa cmp qword ptr [rcx + 0x78], 0
145aa75af je 0x145aa766c
145aa75b5 mov esi, edx
145aa75b7 lea rax, [rcx + 0x80]
145aa75be lea rdx, [rsp + 0x24]
145aa75c3 mov rdi, rcx
145aa75c6 mov rcx, rax
145aa75c9 call 0x140f96f70
145aa75ce mov rcx, rax
145aa75d1 shr rcx, 0x39
145aa75d5 mov r8, qword ptr [rdi + 0x60]
145aa75d9 mov r9, qword ptr [rdi + 0x68]
145aa75dd movd xmm0, ecx
145aa75e1 punpcklbw xmm0, xmm0
145aa75e5 pshuflw xmm0, xmm0, 0
145aa75ea pshufd xmm0, xmm0, 0x44
145aa75ef xor r10d, r10d
145aa75f2 pcmpeqd xmm1, xmm1
145aa75f6 and rax, r9
145aa75f9 movdqu xmm2, xmmword ptr [r8 + rax]
145aa75ff movdqa xmm3, xmm2
145aa7603 pcmpeqb xmm3, xmm0
145aa7607 pmovmskb ecx, xmm3
145aa760b test ecx, ecx
145aa760d je 0x145aa7640
145aa760f tzcnt edx, ecx
145aa7613 add rdx, rax
145aa7616 and rdx, r9
145aa7619 lea r11, [rdx*8]
145aa7621 mov rdi, r8
145aa7624 sub rdi, r11
145aa7627 cmp esi, dword ptr [rdi - 8]
145aa762a je 0x145aa765d
145aa762c lea edx, [rcx - 1]
145aa762f and dx, cx
145aa7632 mov ecx, edx
145aa7634 jne 0x145aa760f
145aa7636 nop word ptr cs:[rax + rax]
145aa7640 pcmpeqb xmm2, xmm1
145aa7644 pmovmskb r11d, xmm2
145aa7649 xor ecx, ecx
145aa764b test r11d, r11d
145aa764e jne 0x145aa766e
145aa7650 add rax, r10
145aa7653 add rax, 0x10
145aa7657 add r10, 0x10
145aa765b jmp 0x145aa75f6
145aa765d neg rdx
145aa7660 mov edx, dword ptr [r8 + rdx*8 - 4]
145aa7665 mov ecx, 1
145aa766a jmp 0x145aa766e
145aa766c xor ecx, ecx
145aa766e mov eax, ecx
145aa7670 add rsp, 0x28
145aa7674 pop rdi
145aa7675 pop rsi
145aa7676 ret
