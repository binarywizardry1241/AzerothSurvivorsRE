; Current0.117.0 [0x145ac3120,0x145ac31bf) SHA-256 29d7583bf774cfc3db22eeb678559332259e9b5822847ef81ee8fa76370987d7
145ac3120  4156                     push r14
145ac3122  56                       push rsi
145ac3123  57                       push rdi
145ac3124  53                       push rbx
145ac3125  4883ec28                 sub rsp, 0x28
145ac3129  4889ce                   mov rsi, rcx
145ac312c  488b4950                 mov rcx, qword ptr [rcx + 0x50]
145ac3130  488b7e58                 mov rdi, qword ptr [rsi + 0x58]
145ac3134  0fb682e4000000           movzx eax, byte ptr [rdx + 0xe4]
145ac313b  4869dfe8000000           imul rbx, rdi, 0xe8
145ac3142  4531c0                   xor r8d, r8d
145ac3145  66662e0f1f840000000000   nop word ptr cs:[rax + rax]
145ac3150  4c39c3                   cmp rbx, r8
145ac3153  7432                     je 0x145ac3187
145ac3155  4d8d88e8000000           lea r9, [r8 + 0xe8]
145ac315c  42388401e4000000         cmp byte ptr [rcx + r8 + 0xe4], al
145ac3164  4d89c8                   mov r8, r9
145ac3167  75e7                     jne 0x145ac3150
145ac3169  4c01c9                   add rcx, r9
145ac316c  4881c118ffffff           add rcx, -0xe8
145ac3173  41b8e8000000             mov r8d, 0xe8
145ac3179  4883c428                 add rsp, 0x28
145ac317d  5b                       pop rbx
145ac317e  5f                       pop rdi
145ac317f  5e                       pop rsi
145ac3180  415e                     pop r14
145ac3182  e9540b4d00               jmp 0x145f93cdb
145ac3187  483b7e48                 cmp rdi, qword ptr [rsi + 0x48]
145ac318b  7513                     jne 0x145ac31a0
145ac318d  488d4e48                 lea rcx, [rsi + 0x48]
145ac3191  4989d6                   mov r14, rdx
145ac3194  e827906500               call 0x14611c1c0
145ac3199  4c89f2                   mov rdx, r14
145ac319c  488b4e50                 mov rcx, qword ptr [rsi + 0x50]
145ac31a0  4801d9                   add rcx, rbx
145ac31a3  41b8e8000000             mov r8d, 0xe8
145ac31a9  e82d0b4d00               call 0x145f93cdb
145ac31ae  48ffc7                   inc rdi
145ac31b1  48897e58                 mov qword ptr [rsi + 0x58], rdi
145ac31b5  4883c428                 add rsp, 0x28
145ac31b9  5b                       pop rbx
145ac31ba  5f                       pop rdi
145ac31bb  5e                       pop rsi
145ac31bc  415e                     pop r14
145ac31be  c3                       ret
