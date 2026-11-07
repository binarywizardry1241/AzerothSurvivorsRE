000000014024c91c  4189de                 mov r14d, ebx
000000014024c91f  49c1e604               shl r14, 4
000000014024c923  4e8b2437               mov r12, qword ptr [rdi + r14]
000000014024c927  4585e4                 test r12d, r12d
000000014024c92a  7434                   je 0x14024c960
000000014024c92c  4901fe                 add r14, rdi
000000014024c92f  458b7608               mov r14d, dword ptr [r14 + 8]
000000014024c933  41f7d6                 not r14d
000000014024c936  4f8d0c33               lea r9, [r11 + r14]
000000014024c93a  4e8d3c76               lea r15, [rsi + r14*2]
000000014024c93e  4d89e6                 mov r14, r12
000000014024c941  49c1ee20               shr r14, 0x20
000000014024c945  4c89b568050000         mov qword ptr [rbp + 0x568], r14
000000014024c94c  ffc3                   inc ebx
000000014024c94e  4585e4                 test r12d, r12d
000000014024c951  0f84fafeffff           je 0x14024c851
000000014024c957  eb15                   jmp 0x14024c96e
000000014024c959  0f1f8000000000         nop dword ptr [rax]
000000014024c960  4531e4                 xor r12d, r12d
000000014024c963  ffc3                   inc ebx
000000014024c965  4585e4                 test r12d, r12d
000000014024c968  0f84e3feffff           je 0x14024c851
000000014024c96e  4c89bd60050000         mov qword ptr [rbp + 0x560], r15
000000014024c975  41803902               cmp byte ptr [r9], 2
000000014024c979  0f84cbfeffff           je 0x14024c84a
000000014024c97f  eb0a                   jmp 0x14024c98b
