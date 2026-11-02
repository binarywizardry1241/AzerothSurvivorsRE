0000000145b184eb 488b8fb00f0000                 mov rcx, qword ptr [rdi + 0xfb0]
0000000145b184f2 488b87b80f0000                 mov rax, qword ptr [rdi + 0xfb8]
0000000145b184f9 ff5028                         call qword ptr [rax + 0x28]
0000000145b184fc 84c0                           test al, al
0000000145b184fe 0f8535010000                   jne 0x145b18639
0000000145b18504 488b8fb00f0000                 mov rcx, qword ptr [rdi + 0xfb0]
0000000145b1850b 488b87b80f0000                 mov rax, qword ptr [rdi + 0xfb8]
0000000145b18512 ff5048                         call qword ptr [rax + 0x48]
0000000145b18515 84c0                           test al, al
0000000145b18517 0f84870c0000                   je 0x145b191a4
0000000145b1851d 488d15a7444a01                 lea rdx, [rip + 0x14a44a7]
0000000145b18524 41b821000000                   mov r8d, 0x21
0000000145b1852a e9820c0000                     jmp 0x145b191b1
