0000000145c2fb28 488b8500050000                 mov rax, qword ptr [rbp + 0x500]
0000000145c2fb2f 488d5008                       lea rdx, [rax + 8]
0000000145c2fb33 83be700d000001                 cmp dword ptr [rsi + 0xd70], 1
0000000145c2fb3a 0f871d0c0000                   ja 0x145c3075d
0000000145c2fb40 488bbe20110000                 mov rdi, qword ptr [rsi + 0x1120]
0000000145c2fb47 4885ff                         test rdi, rdi
0000000145c2fb4a 0f840d0c0000                   je 0x145c3075d
0000000145c2fb50 8a9e60140000                   mov bl, byte ptr [rsi + 0x1460]
0000000145c2fb56 4c8bbe28110000                 mov r15, qword ptr [rsi + 0x1128]
0000000145c2fb5d 4c8d75b0                       lea r14, [rbp - 0x50]
0000000145c2fb61 41b8c8000000                   mov r8d, 0xc8
0000000145c2fb67 4c89f1                         mov rcx, r14
0000000145c2fb6a e8dc543d00                     call 0x14600504b
