00000001403532b6 c6858706000000                 mov byte ptr [rbp + 0x687], 0
00000001403532bd 488d0dc3caf205                 lea rcx, [rip + 0x5f2cac3]
00000001403532c4 ba86000000                     mov edx, 0x86
00000001403532c9 e8524f8905                     call 0x145be8220
00000001403532ce 90                             nop
00000001403532cf 4889c6                         mov rsi, rax
00000001403532d2 4889d7                         mov rdi, rdx
00000001403532d5 488b8570060000                 mov rax, qword ptr [rbp + 0x670]
00000001403532dc f30f104040                     movss xmm0, dword ptr [rax + 0x40]
00000001403532e1 f30f59054bfeed05               mulss xmm0, dword ptr [rip + 0x5edfe4b]
00000001403532e9 f30f590507feed05               mulss xmm0, dword ptr [rip + 0x5edfe07]
00000001403532f1 f30f1145c0                     movss dword ptr [rbp - 0x40], xmm0
00000001403532f6 488d45c0                       lea rax, [rbp - 0x40]
00000001403532fa 488985d0010000                 mov qword ptr [rbp + 0x1d0], rax
0000000140353301 488d1d181fcf05                 lea rbx, [rip + 0x5cf1f18]
0000000140353308 48899dd8010000                 mov qword ptr [rbp + 0x1d8], rbx
000000014035330f c6858706000000                 mov byte ptr [rbp + 0x687], 0
0000000140353316 488d15f0caf205                 lea rdx, [rip + 0x5f2caf0]
000000014035331d 488d8de0030000                 lea rcx, [rbp + 0x3e0]
0000000140353324 4c8d85d0010000                 lea r8, [rbp + 0x1d0]
000000014035332b e84011ce05                     call 0x146034470
0000000140353330 90                             nop
0000000140353331 0f1085e0030000                 movups xmm0, xmmword ptr [rbp + 0x3e0]
0000000140353338 0f2945c0                       movaps xmmword ptr [rbp - 0x40], xmm0
000000014035333c 488b85f0030000                 mov rax, qword ptr [rbp + 0x3f0]
0000000140353343 488945d0                       mov qword ptr [rbp - 0x30], rax
0000000140353347 488b8570060000                 mov rax, qword ptr [rbp + 0x670]
000000014035334e f30f104040                     movss xmm0, dword ptr [rax + 0x40]
0000000140353353 f30f5905d9fded05               mulss xmm0, dword ptr [rip + 0x5edfdd9]
000000014035335b f30f5905c5c8ef05               mulss xmm0, dword ptr [rip + 0x5efc8c5]
0000000140353363 f30f59058dfded05               mulss xmm0, dword ptr [rip + 0x5edfd8d]
000000014035336b f30f1185f8050000               movss dword ptr [rbp + 0x5f8], xmm0
0000000140353373 488d85f8050000                 lea rax, [rbp + 0x5f8]
000000014035337a 488985d0010000                 mov qword ptr [rbp + 0x1d0], rax
0000000140353381 48899dd8010000                 mov qword ptr [rbp + 0x1d8], rbx
0000000140353388 488d1588caf205                 lea rdx, [rip + 0x5f2ca88]
000000014035338f 488d8de0030000                 lea rcx, [rbp + 0x3e0]
0000000140353396 488d9dd0010000                 lea rbx, [rbp + 0x1d0]
000000014035339d 4989d8                         mov r8, rbx
00000001403533a0 e8cb10ce05                     call 0x146034470
00000001403533a5 90                             nop
00000001403533a6 0f1085e0030000                 movups xmm0, xmmword ptr [rbp + 0x3e0]
00000001403533ad 0f2985d0010000                 movaps xmmword ptr [rbp + 0x1d0], xmm0
00000001403533b4 488b85f0030000                 mov rax, qword ptr [rbp + 0x3f0]
00000001403533bb 488985e0010000                 mov qword ptr [rbp + 0x1e0], rax
00000001403533c2 488d054ccaf205                 lea rax, [rip + 0x5f2ca4c]
00000001403533c9 488985e0030000                 mov qword ptr [rbp + 0x3e0], rax
00000001403533d0 48c785e803000002000000         mov qword ptr [rbp + 0x3e8], 2
00000001403533db 488d45c0                       lea rax, [rbp - 0x40]
00000001403533df 488985f0030000                 mov qword ptr [rbp + 0x3f0], rax
00000001403533e6 4c89adf8030000                 mov qword ptr [rbp + 0x3f8], r13
00000001403533ed 488d0529caf205                 lea rax, [rip + 0x5f2ca29]
00000001403533f4 48898500040000                 mov qword ptr [rbp + 0x400], rax
00000001403533fb 48c7850804000002000000         mov qword ptr [rbp + 0x408], 2
0000000140353406 48899d10040000                 mov qword ptr [rbp + 0x410], rbx
000000014035340d 4c89ad18040000                 mov qword ptr [rbp + 0x418], r13
0000000140353414 48c744242002000000             mov qword ptr [rsp + 0x20], 2
000000014035341d 488d8df8050000                 lea rcx, [rbp + 0x5f8]
0000000140353424 4c8d8de0030000                 lea r9, [rbp + 0x3e0]
000000014035342b 4889f2                         mov rdx, rsi
000000014035342e 4989f8                         mov r8, rdi
0000000140353431 e87a528905                     call 0x145be86b0
0000000140353436 90                             nop
0000000140353437 488b95d0010000                 mov rdx, qword ptr [rbp + 0x1d0]
000000014035343e 4885d2                         test rdx, rdx
0000000140353441 7412                           je 0x140353455
0000000140353443 488b8dd8010000                 mov rcx, qword ptr [rbp + 0x1d8]
000000014035344a 41b801000000                   mov r8d, 1
0000000140353450 e87bedcaff                     call 0x1400021d0
0000000140353455 488b55c0                       mov rdx, qword ptr [rbp - 0x40]
0000000140353459 4885d2                         test rdx, rdx
000000014035345c 0f8461020000                   je 0x1403536c3
0000000140353462 488b4dc8                       mov rcx, qword ptr [rbp - 0x38]
0000000140353466 e94d020000                     jmp 0x1403536b8
