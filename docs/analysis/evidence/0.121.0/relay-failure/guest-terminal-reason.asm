0000000145b15efc 488b8f88100000                 mov rcx, qword ptr [rdi + 0x1088]
0000000145b15f03 488b8790100000                 mov rax, qword ptr [rdi + 0x1090]
0000000145b15f0a ff5028                         call qword ptr [rax + 0x28]
0000000145b15f0d 84c0                           test al, al
0000000145b15f0f 0f8535010000                   jne 0x145b1604a
0000000145b15f15 488b8f88100000                 mov rcx, qword ptr [rdi + 0x1088]
0000000145b15f1c 488b8790100000                 mov rax, qword ptr [rdi + 0x1090]
0000000145b15f23 ff5048                         call qword ptr [rax + 0x48]
0000000145b15f26 84c0                           test al, al
0000000145b15f28 0f84860c0000                   je 0x145b16bb4
0000000145b15f2e 488d154ed5b401                 lea rdx, [rip + 0x1b4d54e]
0000000145b15f35 41b821000000                   mov r8d, 0x21
0000000145b15f3b e9810c0000                     jmp 0x145b16bc1
