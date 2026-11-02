1459176cc cmp bl, 6
1459176cf ja 0x1459176e1
1459176d1 movzx eax, bl
1459176d4 lea rcx, [rip + 0x1a1b19d]
1459176db mov rax, qword ptr [rcx + rax*8]
1459176df jmp 0x1459176e8
1459176e1 lea rax, [rip + 0x13aa7e0]
1459176e8 add r13, rsi
1459176eb mov r15, qword ptr [rax + 0x30]
1459176ef mov r12, qword ptr [rax + 0x38]
1459176f3 mov qword ptr [rbp + 0xe90], r15
1459176fa mov qword ptr [rbp + 0xe98], r12
145917701 xor ebx, ebx
145917703 jmp 0x145917721
145917705 nop word ptr cs:[rax + rax]
145917710 add rbx, 0x78
145917714 cmp rbx, 0x34f8
14591771b je 0x145918b81
145917721 cmp qword ptr [rbx + rsi + 8], r12
145917726 jne 0x145917710
145917728 mov rcx, qword ptr [rbx + rsi]
14591772c mov rdx, r15
14591772f mov r8, r12
145917732 call 0x145d14601
145917737 test eax, eax
145917739 jne 0x145917710
