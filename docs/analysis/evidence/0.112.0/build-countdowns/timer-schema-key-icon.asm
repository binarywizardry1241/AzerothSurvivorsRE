1458f54eb 4b8d0ca4 lea rcx, [r12 + r12*4]
1458f54ef 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458f54f3 4c8d34ca lea r14, [rdx + rcx*8]
1458f54f7 c6007b mov byte ptr [rax], 0x7b
1458f54fa 48c785d001000001000000 mov qword ptr [rbp + 0x1d0], 1
1458f5505 488985d8010000 mov qword ptr [rbp + 0x1d8], rax
1458f550c 48c785e001000001000000 mov qword ptr [rbp + 0x1e0], 1
1458f5517 c685e801000001 mov byte ptr [rbp + 0x1e8], 1
1458f551e 410f104608 movups xmm0, xmmword ptr [r14 + 8]
1458f5523 c685fb01000001 mov byte ptr [rbp + 0x1fb], 1
1458f552a 0f11442420 movups xmmword ptr [rsp + 0x20], xmm0
1458f552f 41b904000000 mov r9d, 4
1458f5535 488d8d70010000 lea rcx, [rbp + 0x170]
1458f553c 4889fe mov rsi, rdi
1458f553f 4889fa mov rdx, rdi
1458f5542 4c8d05fa453101 lea r8, [rip + 0x13145fa]
1458f5549 e8a27a0900 call 0x14598cff0
1458f554e 90 nop
1458f554f 410f104618 movups xmm0, xmmword ptr [r14 + 0x18]
1458f5554 c685fb01000001 mov byte ptr [rbp + 0x1fb], 1
1458f555b 0f11442420 movups xmmword ptr [rsp + 0x20], xmm0
1458f5560 41b904000000 mov r9d, 4
1458f5566 4889f1 mov rcx, rsi
1458f5569 488d9570010000 lea rdx, [rbp + 0x170]
1458f5570 4c8d05d0453101 lea r8, [rip + 0x13145d0]
1458f5577 e8747a0900 call 0x14598cff0
1458f557c 90 nop
