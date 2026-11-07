0000000145b1c2a5  4c3bb688110000         cmp r14, qword ptr [rsi + 0x1188]
0000000145b1c2ac  7514                   jne 0x145b1c2c2
0000000145b1c2ae  488d8e88110000         lea rcx, [rsi + 0x1188]
0000000145b1c2b5  e816026100             call 0x14612c4d0
0000000145b1c2ba  90                     nop
0000000145b1c2bb  488b8690110000         mov rax, qword ptr [rsi + 0x1190]
0000000145b1c2c2  4a891cf0               mov qword ptr [rax + r14*8], rbx
0000000145b1c2c6  49ffc6                 inc r14
0000000145b1c2c9  4c89b698110000         mov qword ptr [rsi + 0x1198], r14
0000000145b1c2d0  4889f9                 mov rcx, rdi
0000000145b1c2d3  e8286cf7ff             call 0x145a92f00
0000000145b1c2d8  90                     nop
