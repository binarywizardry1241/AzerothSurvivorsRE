145b1c32f 488b86a00c0000 mov rax, qword ptr [rsi + 0xca0]
145b1c336 4883f801 cmp rax, 1
145b1c33a 7727 ja 0x145b1c363
145b1c33c f686d10f000001 test byte ptr [rsi + 0xfd1], 1
145b1c343 741e je 0x145b1c363
145b1c345 c6855704000001 mov byte ptr [rbp + 0x457], 1
145b1c34c c6855604000001 mov byte ptr [rbp + 0x456], 1
145b1c353 4889f1 mov rcx, rsi
145b1c356 e8e5e2ffff call 0x145b1a640
145b1c35b 90 nop
145b1c35c 488b86a00c0000 mov rax, qword ptr [rsi + 0xca0]
145b1c363 83f801 cmp eax, 1
145b1c366 772b ja 0x145b1c393
145b1c368 48c786a80f000000000000 mov qword ptr [rsi + 0xfa8], 0
145b1c373 488dbed00e0000 lea rdi, [rsi + 0xed0]
145b1c37a 4883bed00e0000ff cmp qword ptr [rsi + 0xed0], -1
145b1c382 7408 je 0x145b1c38c
145b1c384 4889f9 mov rcx, rdi
145b1c387 e894a7f8ff call 0x145aa6b20
145b1c38c 48c707ffffffff mov qword ptr [rdi], 0xffffffffffffffff
145b1c393 c6855704000001 mov byte ptr [rbp + 0x457], 1
145b1c39a c6855604000001 mov byte ptr [rbp + 0x456], 1
145b1c3a1 4889f1 mov rcx, rsi
145b1c3a4 e857d9ffff call 0x145b19d00
145b1c3a9 90 nop
145b1c3aa c6855704000001 mov byte ptr [rbp + 0x457], 1
145b1c3b1 c6855604000001 mov byte ptr [rbp + 0x456], 1
145b1c3b8 48c744242000000000 mov qword ptr [rsp + 0x20], 0
145b1c3c1 488d15d0ed7b01 lea rdx, [rip + 0x17bedd0]
145b1c3c8 41b806000000 mov r8d, 6
145b1c3ce 41b901000000 mov r9d, 1
145b1c3d4 4889f1 mov rcx, rsi
145b1c3d7 e8a4caffff call 0x145b18e80
145b1c3dc 90 nop
145b1c3dd e9320f0000 jmp 0x145b1d314
