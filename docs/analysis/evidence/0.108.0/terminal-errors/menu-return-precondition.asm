0000000145944640  55                       push rbp
0000000145944641  4156                     push r14
0000000145944643  56                       push rsi
0000000145944644  57                       push rdi
0000000145944645  53                       push rbx
0000000145944646  4883ec50                 sub rsp, 0x50
000000014594464a  488d6c2450               lea rbp, [rsp + 0x50]
000000014594464f  48c745f8feffffff         mov qword ptr [rbp - 8], 0xfffffffffffffffe
0000000145944657  0fb699c70a0000           movzx ebx, byte ptr [rcx + 0xac7]
000000014594465e  fecb                     dec bl
0000000145944660  80fb02                   cmp bl, 2
0000000145944663  0f87de000000             ja 0x145944747
0000000145944669  4889ce                   mov rsi, rcx
000000014594466c  488bb950060000           mov rdi, qword ptr [rcx + 0x650]
0000000145944673  4c8bb158060000           mov r14, qword ptr [rcx + 0x658]
000000014594467a  48c7815806000000000000   mov qword ptr [rcx + 0x658], 0
0000000145944685  4d85f6                   test r14, r14
0000000145944688  741a                     je 0x1459446a4
000000014594468a  660f1f440000             nop word ptr [rax + rax]
0000000145944690  4889f9                   mov rcx, rdi
0000000145944693  e878b5fcff               call 0x14590fc10
0000000145944698  4881c7a0000000           add rdi, 0xa0
000000014594469f  49ffce                   dec r14
00000001459446a2  75ec                     jne 0x145944690
00000001459446a4  c686c50a0000ff           mov byte ptr [rsi + 0xac5], 0xff
00000001459446ab  c686b70a000001           mov byte ptr [rsi + 0xab7], 1
00000001459446b2  c686c70a000004           mov byte ptr [rsi + 0xac7], 4
00000001459446b9  f30f1086340a0000         movss xmm0, dword ptr [rsi + 0xa34]
00000001459446c1  c7867809000001000000     mov dword ptr [rsi + 0x978], 1
00000001459446cb  f30f11867c090000         movss dword ptr [rsi + 0x97c], xmm0
00000001459446d3  4889f1                   mov rcx, rsi
00000001459446d6  e84593fdff               call 0x14591da20
00000001459446db  4c8d05dfb28a01           lea r8, [rip + 0x18ab2df]
00000001459446e2  488d4dd0                 lea rcx, [rbp - 0x30]
00000001459446e6  41b906000000             mov r9d, 6
00000001459446ec  4889f2                   mov rdx, rsi
00000001459446ef  e84c0b0000               call 0x145945240
00000001459446f4  488bbe40060000           mov rdi, qword ptr [rsi + 0x640]
00000001459446fb  483bbe30060000           cmp rdi, qword ptr [rsi + 0x630]
0000000145944702  751d                     jne 0x145944721
0000000145944704  488d8e30060000           lea rcx, [rsi + 0x630]
000000014594470b  488b45d0                 mov rax, qword ptr [rbp - 0x30]
000000014594470f  488945f0                 mov qword ptr [rbp - 0x10], rax
0000000145944713  488b45d8                 mov rax, qword ptr [rbp - 0x28]
0000000145944717  488945e8                 mov qword ptr [rbp - 0x18], rax
000000014594471b  e890052b00               call 0x145bf4cb0
0000000145944720  90                       nop
0000000145944721  488b8638060000           mov rax, qword ptr [rsi + 0x638]
0000000145944728  488d0c7f                 lea rcx, [rdi + rdi*2]
000000014594472c  488b55e0                 mov rdx, qword ptr [rbp - 0x20]
0000000145944730  488954c810               mov qword ptr [rax + rcx*8 + 0x10], rdx
0000000145944735  0f1045d0                 movups xmm0, xmmword ptr [rbp - 0x30]
0000000145944739  0f1104c8                 movups xmmword ptr [rax + rcx*8], xmm0
000000014594473d  48ffc7                   inc rdi
0000000145944740  4889be40060000           mov qword ptr [rsi + 0x640], rdi
0000000145944747  80fb03                   cmp bl, 3
000000014594474a  0f92c0                   setb al
000000014594474d  4883c450                 add rsp, 0x50
0000000145944751  5b                       pop rbx
0000000145944752  5f                       pop rdi
0000000145944753  5e                       pop rsi
0000000145944754  415e                     pop r14
0000000145944756  5d                       pop rbp
0000000145944757  c3                       ret
