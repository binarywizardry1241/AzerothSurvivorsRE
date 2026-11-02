145b89df0 4156 push r14
145b89df2 56 push rsi
145b89df3 57 push rdi
145b89df4 53 push rbx
145b89df5 4883ec28 sub rsp, 0x28
145b89df9 0fb699a20c0000 movzx ebx, byte ptr [rcx + 0xca2]
145b89e00 fecb dec bl
145b89e02 80fb02 cmp bl, 2
145b89e05 7753 ja 0x145b89e5a
145b89e07 488bb178060000 mov rsi, qword ptr [rcx + 0x678]
145b89e0e 4c8bb180060000 mov r14, qword ptr [rcx + 0x680]
145b89e15 4889cf mov rdi, rcx
145b89e18 48c7818006000000000000 mov qword ptr [rcx + 0x680], 0
145b89e23 4d85f6 test r14, r14
145b89e26 741c je 0x145b89e44
145b89e28 0f1f840000000000 nop dword ptr [rax + rax]
145b89e30 4889f1 mov rcx, rsi
145b89e33 e8c80afdff call 0x145b5a900
145b89e38 4881c6a0000000 add rsi, 0xa0
145b89e3f 49ffce dec r14
145b89e42 75ec jne 0x145b89e30
145b89e44 4889f9 mov rcx, rdi
145b89e47 c687a00c0000ff mov byte ptr [rdi + 0xca0], 0xff
145b89e4e c6878f0c000001 mov byte ptr [rdi + 0xc8f], 1
145b89e55 e8a6fdfeff call 0x145b79c00
145b89e5a 80fb03 cmp bl, 3
145b89e5d 0f92c0 setb al
145b89e60 4883c428 add rsp, 0x28
145b89e64 5b pop rbx
145b89e65 5f pop rdi
145b89e66 5e pop rsi
145b89e67 415e pop r14
145b89e69 c3 ret 
