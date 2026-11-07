000000014024c7d2  4189de                 mov r14d, ebx
000000014024c7d5  4e8b24f7               mov r12, qword ptr [rdi + r14*8]
000000014024c7d9  4585e4                 test r12d, r12d
000000014024c7dc  7432                   je 0x14024c810
000000014024c7de  4f8d0c33               lea r9, [r11 + r14]
000000014024c7e2  4e8d3c76               lea r15, [rsi + r14*2]
000000014024c7e6  4d89e6                 mov r14, r12
000000014024c7e9  49c1ee20               shr r14, 0x20
000000014024c7ed  4c89b568050000         mov qword ptr [rbp + 0x568], r14
000000014024c7f4  ffc3                   inc ebx
000000014024c7f6  4585e4                 test r12d, r12d
000000014024c7f9  0f841effffff           je 0x14024c71d
000000014024c7ff  eb1d                   jmp 0x14024c81e
000000014024c801  6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
000000014024c810  4531e4                 xor r12d, r12d
000000014024c813  ffc3                   inc ebx
000000014024c815  4585e4                 test r12d, r12d
000000014024c818  0f84fffeffff           je 0x14024c71d
000000014024c81e  4c89bd60050000         mov qword ptr [rbp + 0x560], r15
000000014024c825  41803902               cmp byte ptr [r9], 2
000000014024c829  0f84e7feffff           je 0x14024c716
