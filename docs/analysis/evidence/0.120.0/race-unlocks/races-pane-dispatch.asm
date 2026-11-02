000000014019f6e4  488b054dbf3808         mov rax, qword ptr [rip + 0x838bf4d]
000000014019f6eb  488b4808               mov rcx, qword ptr [rax + 8]
000000014019f6ef  4885c9                 test rcx, rcx
000000014019f6f2  747a                   je 0x14019f76e
000000014019f6f4  448bbdb0030000         mov r15d, dword ptr [rbp + 0x3b0]
000000014019f6fb  4c8ba5a8030000         mov r12, qword ptr [rbp + 0x3a8]
000000014019f702  4c8bada0030000         mov r13, qword ptr [rbp + 0x3a0]
000000014019f709  488b38                 mov rdi, qword ptr [rax]
000000014019f70c  486bf158               imul rsi, rcx, 0x58
000000014019f710  4801fe                 add rsi, rdi
000000014019f713  4c8db548010000         lea r14, [rbp + 0x148]
000000014019f71a  eb0c                   jmp 0x14019f728
000000014019f71c  0f1f4000               nop dword ptr [rax]
000000014019f720  4889df                 mov rdi, rbx
000000014019f723  4839f3                 cmp rbx, rsi
000000014019f726  7446                   je 0x14019f76e
000000014019f728  0fb64f50               movzx ecx, byte ptr [rdi + 0x50]
000000014019f72c  e81fa19a05             call 0x145b49850
000000014019f731  90                     nop
000000014019f732  488d5f58               lea rbx, [rdi + 0x58]
000000014019f736  84c0                   test al, al
000000014019f738  74e6                   je 0x14019f720
000000014019f73a  48897c2438             mov qword ptr [rsp + 0x38], rdi
000000014019f73f  44897c2430             mov dword ptr [rsp + 0x30], r15d
000000014019f744  4c89642428             mov qword ptr [rsp + 0x28], r12
000000014019f749  4c896c2420             mov qword ptr [rsp + 0x20], r13
000000014019f74e  4c89f1                 mov rcx, r14
000000014019f751  488b9520030000         mov rdx, qword ptr [rbp + 0x320]
000000014019f758  4c8b8518030000         mov r8, qword ptr [rbp + 0x318]
000000014019f75f  4c8b8d10030000         mov r9, qword ptr [rbp + 0x310]
000000014019f766  e8b51e0000             call 0x1401a1620
000000014019f76b  90                     nop
000000014019f76c  ebb2                   jmp 0x14019f720
