1404034ae 4c8d0564bdb005 lea r8, [rip + 0x5b0bd64]
1404034b5 488d4db0 lea rcx, [rbp - 0x50]
1404034b9 41b90a000000 mov r9d, 0xa
1404034bf 4889f2 mov rdx, rsi
1404034c2 e8e97b1c00 call 0x1405cb0b0
1404034c7 488b45b0 mov rax, qword ptr [rbp - 0x50]
1404034cb 41b601 mov r14b, 1
1404034ce c685b800000001 mov byte ptr [rbp + 0xb8], 1
1404034d5 4883f8ff cmp rax, -1
1404034d9 744e je 0x140403529
1404034db 488985c8000000 mov qword ptr [rbp + 0xc8], rax
1404034e2 488b4db8 mov rcx, qword ptr [rbp - 0x48]
1404034e6 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1404034ea 48898d98000000 mov qword ptr [rbp + 0x98], rcx
1404034f1 e89abcc1ff call 0x14001f190
1404034f6 90 nop
1404034f7 b101 mov cl, 1
1404034f9 4883fa01 cmp rdx, 1
1404034fd 7506 jne 0x140403505
1404034ff 803830 cmp byte ptr [rax], 0x30
140403502 0f95c1 setne cl
140403505 888db8000000 mov byte ptr [rbp + 0xb8], cl
