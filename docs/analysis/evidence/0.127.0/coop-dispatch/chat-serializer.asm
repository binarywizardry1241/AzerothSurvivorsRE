0000000145d15b8e 488d4d58                       lea rcx, [rbp + 0x58]
0000000145d15b92 b216                           mov dl, 0x16
0000000145d15b94 e847b01a00                     call 0x145ec0be0
0000000145d15b99 90                             nop 
0000000145d15b9a 488b5738                       mov rdx, qword ptr [rdi + 0x38]
0000000145d15b9e 4889c1                         mov rcx, rax
0000000145d15ba1 e83ab21a00                     call 0x145ec0de0
0000000145d15ba6 90                             nop 
0000000145d15ba7 488b5710                       mov rdx, qword ptr [rdi + 0x10]
0000000145d15bab 4c8b4718                       mov r8, qword ptr [rdi + 0x18]
0000000145d15baf 4889c1                         mov rcx, rax
0000000145d15bb2 e8c9b01a00                     call 0x145ec0c80
0000000145d15bb7 90                             nop 
0000000145d15bb8 0fb65740                       movzx edx, byte ptr [rdi + 0x40]
0000000145d15bbc 4889c1                         mov rcx, rax
0000000145d15bbf e81cb01a00                     call 0x145ec0be0
0000000145d15bc4 90                             nop 
0000000145d15bc5 488b5728                       mov rdx, qword ptr [rdi + 0x28]
0000000145d15bc9 4c8b4730                       mov r8, qword ptr [rdi + 0x30]
0000000145d15bcd 4889c1                         mov rcx, rax
0000000145d15bd0 e8abb01a00                     call 0x145ec0c80
0000000145d15bd5 90                             nop 
0000000145d15bd6 e9b5030000                     jmp 0x145d15f90
