00000001401b740b  410fb64301             movzx eax, byte ptr [r11 + 1]
00000001401b7410  888528030000           mov byte ptr [rbp + 0x328], al
00000001401b7416  488d8d70020000         lea rcx, [rbp + 0x270]
00000001401b741d  4c89f2                 mov rdx, r14
00000001401b7420  4c8b8510030000         mov r8, qword ptr [rbp + 0x310]
00000001401b7427  e8648ffeff             call 0x1401a0390
00000001401b742c  0fb68528030000         movzx eax, byte ptr [rbp + 0x328]
00000001401b7433  488b8da8020000         mov rcx, qword ptr [rbp + 0x2a8]
00000001401b743a  4c8bb5b0020000         mov r14, qword ptr [rbp + 0x2b0]
00000001401b7441  4d85f6                 test r14, r14
00000001401b7444  741c                   je 0x1401b7462
00000001401b7446  4531c0                 xor r8d, r8d
00000001401b7449  0f1f8000000000         nop dword ptr [rax]
00000001401b7450  42380401               cmp byte ptr [rcx + r8], al
00000001401b7454  0f84d3030000           je 0x1401b782d
00000001401b745a  49ffc0                 inc r8
00000001401b745d  4d39c6                 cmp r14, r8
00000001401b7460  75ee                   jne 0x1401b7450
00000001401b7462  4c89b5e8020000         mov qword ptr [rbp + 0x2e8], r14
00000001401b7469  4c3bb5a0020000         cmp r14, qword ptr [rbp + 0x2a0]
00000001401b7470  4c8bb508030000         mov r14, qword ptr [rbp + 0x308]
00000001401b7477  7514                   jne 0x1401b748d
00000001401b7479  488d8da0020000         lea rcx, [rbp + 0x2a0]
00000001401b7480  e8db37f905             call 0x14614ac60
00000001401b7485  90                     nop
00000001401b7486  488b8da8020000         mov rcx, qword ptr [rbp + 0x2a8]
00000001401b748d  488b95e8020000         mov rdx, qword ptr [rbp + 0x2e8]
00000001401b7494  0fb68528030000         movzx eax, byte ptr [rbp + 0x328]
00000001401b749b  880411                 mov byte ptr [rcx + rdx], al
00000001401b749e  b801000000             mov eax, 1
00000001401b74a3  e9ab030000             jmp 0x1401b7853
