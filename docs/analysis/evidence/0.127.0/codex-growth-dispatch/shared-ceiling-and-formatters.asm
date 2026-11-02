0000000140353592 f30f10159afbed05               movss xmm2, dword ptr [rip + 0x5edfb9a]
000000014035359a eb15                           jmp 0x1403535b1
000000014035359c f30f101590fbed05               movss xmm2, dword ptr [rip + 0x5edfb90]
00000001403535a4 e98f000000                     jmp 0x140353638
00000001403535a9 f30f101577c6ef05               movss xmm2, dword ptr [rip + 0x5efc677]
00000001403535b1 488b9570060000                 mov rdx, qword ptr [rbp + 0x670]
00000001403535b8 f30f595240                     mulss xmm2, dword ptr [rdx + 0x40]
00000001403535bd c6858706000000                 mov byte ptr [rbp + 0x687], 0
00000001403535c4 488d9dd0010000                 lea rbx, [rbp + 0x1d0]
00000001403535cb 4889d9                         mov rcx, rbx
00000001403535ce e86d417d05                     call 0x145b27740
00000001403535d3 90                             nop
00000001403535d4 488d05acc8f205                 lea rax, [rip + 0x5f2c8ac]
00000001403535db 488985e0030000                 mov qword ptr [rbp + 0x3e0], rax
00000001403535e2 48c785e803000007000000         mov qword ptr [rbp + 0x3e8], 7
00000001403535ed 48899df0030000                 mov qword ptr [rbp + 0x3f0], rbx
00000001403535f4 4c89adf8030000                 mov qword ptr [rbp + 0x3f8], r13
00000001403535fb 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000140353604 488d8df8050000                 lea rcx, [rbp + 0x5f8]
000000014035360b 4c8d8de0030000                 lea r9, [rbp + 0x3e0]
0000000140353612 4889f2                         mov rdx, rsi
0000000140353615 4989f8                         mov r8, rdi
0000000140353618 e893508905                     call 0x145be86b0
000000014035361d 90                             nop
000000014035361e e982000000                     jmp 0x1403536a5
0000000140353623 f30f1015bdfaed05               movss xmm2, dword ptr [rip + 0x5edfabd]
000000014035362b e98ffeffff                     jmp 0x1403534bf
0000000140353630 f30f1015f0c5ef05               movss xmm2, dword ptr [rip + 0x5efc5f0]
0000000140353638 488b9570060000                 mov rdx, qword ptr [rbp + 0x670]
000000014035363f f30f595240                     mulss xmm2, dword ptr [rdx + 0x40]
0000000140353644 c6858706000000                 mov byte ptr [rbp + 0x687], 0
000000014035364b 488d9dd0010000                 lea rbx, [rbp + 0x1d0]
0000000140353652 4889d9                         mov rcx, rbx
0000000140353655 e8e6407d05                     call 0x145b27740
000000014035365a 90                             nop
000000014035365b 488d0525c8f205                 lea rax, [rip + 0x5f2c825]
0000000140353662 488985e0030000                 mov qword ptr [rbp + 0x3e0], rax
0000000140353669 48c785e803000007000000         mov qword ptr [rbp + 0x3e8], 7
0000000140353674 48899df0030000                 mov qword ptr [rbp + 0x3f0], rbx
000000014035367b 4c89adf8030000                 mov qword ptr [rbp + 0x3f8], r13
0000000140353682 48c744242001000000             mov qword ptr [rsp + 0x20], 1
000000014035368b 488d8df8050000                 lea rcx, [rbp + 0x5f8]
0000000140353692 4c8d8de0030000                 lea r9, [rbp + 0x3e0]
0000000140353699 4889f2                         mov rdx, rsi
000000014035369c 4989f8                         mov r8, rdi
000000014035369f e80c508905                     call 0x145be86b0
00000001403536a4 90                             nop
00000001403536a5 488b95d0010000                 mov rdx, qword ptr [rbp + 0x1d0]
00000001403536ac 4885d2                         test rdx, rdx
00000001403536af 7412                           je 0x1403536c3
00000001403536b1 488b8dd8010000                 mov rcx, qword ptr [rbp + 0x1d8]
00000001403536b8 41b801000000                   mov r8d, 1
00000001403536be e80debcaff                     call 0x1400021d0
00000001403536c3 f2440f100564f8ed05             movsd xmm8, qword ptr [rip + 0x5edf864]
00000001403536cc 440f10358cd1f005               movups xmm14, xmmword ptr [rip + 0x5f0d18c]
00000001403536d4 440f103de083f205               movups xmm15, xmmword ptr [rip + 0x5f283e0]
