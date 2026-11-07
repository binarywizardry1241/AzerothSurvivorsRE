145957851 488b83d0000000 mov rax, qword ptr [rbx + 0xd0]
145957858 4c8bab88010000 mov r13, qword ptr [rbx + 0x188]
14595785f 488b8db8000000 mov rcx, qword ptr [rbp + 0xb8]
145957866 488b440818 mov rax, qword ptr [rax + rcx + 0x18]
14595786b f30f591525384600 mulss xmm2, dword ptr [rip + 0x463825]
145957873 440fb6b3ad010000 movzx r14d, byte ptr [rbx + 0x1ad]
14595787b c683ad01000002 mov byte ptr [rbx + 0x1ad], 2
145957882 48898388010000 mov qword ptr [rbx + 0x188], rax
145957889 0f1006 movups xmm0, xmmword ptr [rsi]
14595788c 0f104e10 movups xmm1, xmmword ptr [rsi + 0x10]
145957890 0f105e20 movups xmm3, xmmword ptr [rsi + 0x20]
145957894 0f299d80000000 movaps xmmword ptr [rbp + 0x80], xmm3
14595789b 0f294d70 movaps xmmword ptr [rbp + 0x70], xmm1
14595789f 0f294560 movaps xmmword ptr [rbp + 0x60], xmm0
1459578a3 488d0d7e3e2b01 lea rcx, [rip + 0x12b3e7e]
1459578aa 48898b58010000 mov qword ptr [rbx + 0x158], rcx
1459578b1 48c783600100000d000000 mov qword ptr [rbx + 0x160], 0xd
1459578bc 48c7836801000000000000 mov qword ptr [rbx + 0x168], 0
1459578c7 66c783800100000000 mov word ptr [rbx + 0x180], 0
1459578d0 0fb64038 movzx eax, byte ptr [rax + 0x38]
1459578d4 88442420 mov byte ptr [rsp + 0x20], al
1459578d8 c644243000 mov byte ptr [rsp + 0x30], 0
1459578dd c644242800 mov byte ptr [rsp + 0x28], 0
1459578e2 4889d9 mov rcx, rbx
1459578e5 4c89e2 mov rdx, r12
1459578e8 4589f9 mov r9d, r15d
1459578eb e8a073feff call 0x14593ec90
1459578f0 0f284560 movaps xmm0, xmmword ptr [rbp + 0x60]
1459578f4 0f284d70 movaps xmm1, xmmword ptr [rbp + 0x70]
1459578f8 0f289580000000 movaps xmm2, xmmword ptr [rbp + 0x80]
1459578ff 0f115620 movups xmmword ptr [rsi + 0x20], xmm2
145957903 0f114e10 movups xmmword ptr [rsi + 0x10], xmm1
145957907 0f1106 movups xmmword ptr [rsi], xmm0
14595790a 4c89ab88010000 mov qword ptr [rbx + 0x188], r13
145957911 4488b3ad010000 mov byte ptr [rbx + 0x1ad], r14b
145957918 4c8badd0000000 mov r13, qword ptr [rbp + 0xd0]
14595791f e90cf5ffff jmp 0x145956e30
