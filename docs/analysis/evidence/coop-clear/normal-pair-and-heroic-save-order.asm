0000000145c279c4 448833                         mov byte ptr [rbx], r14b
0000000145c279c7 48897b08                       mov qword ptr [rbx + 8], rdi
0000000145c279cb 49ffc7                         inc r15
0000000145c279ce 4c89be80120000                 mov qword ptr [rsi + 0x1280], r15
0000000145c279d5 41b401                         mov r12b, 1
0000000145c279d8 eb03                           jmp 0x145c279dd
0000000145c279da 4531e4                         xor r12d, r12d
0000000145c279dd 488d9e98110000                 lea rbx, [rsi + 0x1198]
0000000145c279e4 4889d9                         mov rcx, rbx
0000000145c279e7 4489f2                         mov edx, r14d
0000000145c279ea 4989f8                         mov r8, rdi
0000000145c279ed 440fb68df0010000               movzx r9d, byte ptr [rbp + 0x1f0]
0000000145c279f5 e8162deaff                     call 0x145aca710
0000000145c279fa 90                             nop
0000000145c279fb 4189c7                         mov r15d, eax
0000000145c279fe 4584e4                         test r12b, r12b
0000000145c27a01 7414                           je 0x145c27a17
0000000145c27a03 4889d9                         mov rcx, rbx
0000000145c27a06 e805d5eaff                     call 0x145ad4f10
0000000145c27a0b 90                             nop
0000000145c27a0c 4584ff                         test r15b, r15b
0000000145c27a0f 0f8485feffff                   je 0x145c2789a
0000000145c27a15 eb12                           jmp 0x145c27a29
0000000145c27a17 4584ff                         test r15b, r15b
0000000145c27a1a 0f847afeffff                   je 0x145c2789a
0000000145c27a20 4889d9                         mov rcx, rbx
0000000145c27a23 e8e8d4eaff                     call 0x145ad4f10
0000000145c27a28 90                             nop
0000000145c27a29 837e1002                       cmp dword ptr [rsi + 0x10], 2
0000000145c27a2d 751a                           jne 0x145c27a49
0000000145c27a2f 83be700d000001                 cmp dword ptr [rsi + 0xd70], 1
0000000145c27a36 0f875efeffff                   ja 0x145c2789a
0000000145c27a3c 80be4d11000000                 cmp byte ptr [rsi + 0x114d], 0
0000000145c27a43 0f8451feffff                   je 0x145c2789a
