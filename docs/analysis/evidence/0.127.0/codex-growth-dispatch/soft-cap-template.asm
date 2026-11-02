00000001403531fb c6858706000000                 mov byte ptr [rbp + 0x687], 0
0000000140353202 488d0d16ccf205                 lea rcx, [rip + 0x5f2cc16]
0000000140353209 ba68000000                     mov edx, 0x68
000000014035320e e80d508905                     call 0x145be8220
0000000140353213 90                             nop
0000000140353214 4889c6                         mov rsi, rax
0000000140353217 4889d7                         mov rdi, rdx
000000014035321a 488b9570060000                 mov rdx, qword ptr [rbp + 0x670]
0000000140353221 f30f105240                     movss xmm2, dword ptr [rdx + 0x40]
0000000140353226 f30f591506ffed05               mulss xmm2, dword ptr [rip + 0x5edff06]
000000014035322e c6858706000000                 mov byte ptr [rbp + 0x687], 0
0000000140353235 488d9dd0010000                 lea rbx, [rbp + 0x1d0]
000000014035323c 4889d9                         mov rcx, rbx
000000014035323f e8fc447d05                     call 0x145b27740
0000000140353244 90                             nop
0000000140353245 488d053bccf205                 lea rax, [rip + 0x5f2cc3b]
000000014035324c 488985e0030000                 mov qword ptr [rbp + 0x3e0], rax
0000000140353253 48c785e803000007000000         mov qword ptr [rbp + 0x3e8], 7
000000014035325e 48899df0030000                 mov qword ptr [rbp + 0x3f0], rbx
0000000140353265 4c89adf8030000                 mov qword ptr [rbp + 0x3f8], r13
000000014035326c 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000140353275 488d8df8050000                 lea rcx, [rbp + 0x5f8]
000000014035327c 4c8d8de0030000                 lea r9, [rbp + 0x3e0]
0000000140353283 4889f2                         mov rdx, rsi
0000000140353286 4989f8                         mov r8, rdi
0000000140353289 e822548905                     call 0x145be86b0
000000014035328e 90                             nop
000000014035328f 488b95d0010000                 mov rdx, qword ptr [rbp + 0x1d0]
0000000140353296 4885d2                         test rdx, rdx
0000000140353299 0f843d040000                   je 0x1403536dc
000000014035329f 488b8dd8010000                 mov rcx, qword ptr [rbp + 0x1d8]
00000001403532a6 41b801000000                   mov r8d, 1
00000001403532ac e81fefcaff                     call 0x1400021d0
00000001403532b1 e926040000                     jmp 0x1403536dc
