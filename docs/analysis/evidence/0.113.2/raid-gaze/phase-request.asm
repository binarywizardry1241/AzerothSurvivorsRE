14594810a: b801000000 mov eax, 1
14594810f: 4489f1 mov ecx, r14d
145948112: d3e0 shl eax, cl
145948114: 410980a4000000 or dword ptr [r8 + 0xa4], eax
14594811b: 488b5728 mov rdx, qword ptr [rdi + 0x28]
14594811f: 4939d6 cmp r14, rdx
145948122: 0f832b350000 jae 0x14594b653
145948128: 488b4720 mov rax, qword ptr [rdi + 0x20]
14594812c: 4b8d34f6 lea rsi, [r14 + r14*8]
145948130: 0f1044f010 movups xmm0, xmmword ptr [rax + rsi*8 + 0x10]
145948135: 0f104cf020 movups xmm1, xmmword ptr [rax + rsi*8 + 0x20]
14594813a: 0f1054f030 movups xmm2, xmmword ptr [rax + rsi*8 + 0x30]
14594813f: 0f2995b0020000 movaps xmmword ptr [rbp + 0x2b0], xmm2
145948146: 0f298da0020000 movaps xmmword ptr [rbp + 0x2a0], xmm1
14594814d: 0f298590020000 movaps xmmword ptr [rbp + 0x290], xmm0
145948154: 488b9d80020000 mov rbx, qword ptr [rbp + 0x280]
14594815b: 483b9d70020000 cmp rbx, qword ptr [rbp + 0x270]
145948162: 7568 jne 0x1459481cc
145948164: c685b703000001 mov byte ptr [rbp + 0x3b7], 1
14594816b: c685b603000001 mov byte ptr [rbp + 0x3b6], 1
145948172: c685b503000001 mov byte ptr [rbp + 0x3b5], 1
145948179: c685b403000001 mov byte ptr [rbp + 0x3b4], 1
145948180: c685b303000001 mov byte ptr [rbp + 0x3b3], 1
145948187: c685b203000001 mov byte ptr [rbp + 0x3b2], 1
14594818e: c685b103000001 mov byte ptr [rbp + 0x3b1], 1
145948195: c685b003000001 mov byte ptr [rbp + 0x3b0], 1
14594819c: c685af03000001 mov byte ptr [rbp + 0x3af], 1
1459481a3: c685ae03000001 mov byte ptr [rbp + 0x3ae], 1
1459481aa: c685ad03000001 mov byte ptr [rbp + 0x3ad], 1
1459481b1: c685ac03000001 mov byte ptr [rbp + 0x3ac], 1
1459481b8: c685ab03000001 mov byte ptr [rbp + 0x3ab], 1
1459481bf: 488d8d70020000 lea rcx, [rbp + 0x270]
1459481c6: e8a51e3b00 call 0x145cfa070
1459481cb: 90 nop
1459481cc: 488b8578020000 mov rax, qword ptr [rbp + 0x278]
1459481d3: 486bcb38 imul rcx, rbx, 0x38
1459481d7: 4c8bbde8020000 mov r15, qword ptr [rbp + 0x2e8]
1459481de: 4c893c08 mov qword ptr [rax + rcx], r15
1459481e2: 0f288590020000 movaps xmm0, xmmword ptr [rbp + 0x290]
1459481e9: 0f288da0020000 movaps xmm1, xmmword ptr [rbp + 0x2a0]
1459481f0: 0f2895b0020000 movaps xmm2, xmmword ptr [rbp + 0x2b0]
1459481f7: 0f11440808 movups xmmword ptr [rax + rcx + 8], xmm0
1459481fc: 0f114c0818 movups xmmword ptr [rax + rcx + 0x18], xmm1
145948201: 0f11540828 movups xmmword ptr [rax + rcx + 0x28], xmm2
145948206: 48ffc3 inc rbx
145948209: 48899d80020000 mov qword ptr [rbp + 0x280], rbx
145948210: 488b5728 mov rdx, qword ptr [rdi + 0x28]
145948214: 4939d6 cmp r14, rdx
145948217: 0f83a3340000 jae 0x14594b6c0
14594821d: 488b4720 mov rax, qword ptr [rdi + 0x20]
145948221: 0fb644f03d movzx eax, byte ptr [rax + rsi*8 + 0x3d]
145948226: 2c03 sub al, 3
145948228: 0fb6c0 movzx eax, al
14594822b: bb1d000000 mov ebx, 0x1d
145948230: 0f42c3 cmovb eax, ebx
145948233: 3c09 cmp al, 9
145948235: 4c8b85a0030000 mov r8, qword ptr [rbp + 0x3a0]
14594823c: 0f841f050000 je 0x145948761
145948242: 0fb6c0 movzx eax, al
145948245: 83f817 cmp eax, 0x17
145948248: 0f8413050000 je 0x145948761
