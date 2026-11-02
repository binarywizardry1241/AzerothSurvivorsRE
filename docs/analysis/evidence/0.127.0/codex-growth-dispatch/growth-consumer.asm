00000001403536dc 488b9568060000                 mov rdx, qword ptr [rbp + 0x668]
00000001403536e3 803a01                         cmp byte ptr [rdx], 1
00000001403536e6 7524                           jne 0x14035370c
00000001403536e8 488b8d38060000                 mov rcx, qword ptr [rbp + 0x638]
00000001403536ef 8b01                           mov eax, dword ptr [rcx]
00000001403536f1 8b4903                         mov ecx, dword ptr [rcx + 3]
00000001403536f4 898dc3030000                   mov dword ptr [rbp + 0x3c3], ecx
00000001403536fa 8985c0030000                   mov dword ptr [rbp + 0x3c0], eax
0000000140353700 488b4208                       mov rax, qword ptr [rdx + 8]
0000000140353704 0fb64a10                       movzx ecx, byte ptr [rdx + 0x10]
0000000140353708 b201                           mov dl, 1
000000014035370a eb10                           jmp 0x14035371c
000000014035370c 488b4208                       mov rax, qword ptr [rdx + 8]
0000000140353710 f048ff00                       lock inc qword ptr [rax]
0000000140353714 0f8e5e010000                   jle 0x140353878
000000014035371a 31d2                           xor edx, edx
000000014035371c 4c8b8508060000                 mov r8, qword ptr [rbp + 0x608]
0000000140353723 4c8985f8030000                 mov qword ptr [rbp + 0x3f8], r8
000000014035372a 0f1085f8050000                 movups xmm0, xmmword ptr [rbp + 0x5f8]
0000000140353731 0f1185e8030000                 movups xmmword ptr [rbp + 0x3e8], xmm0
0000000140353738 440f117dc1                     movups xmmword ptr [rbp - 0x3f], xmm15
000000014035373d c745d10000803f                 mov dword ptr [rbp - 0x2f], 0x3f800000
0000000140353744 48c7850004000000000000         mov qword ptr [rbp + 0x400], 0
000000014035374f 48c7850804000004000000         mov qword ptr [rbp + 0x408], 4
000000014035375a 48c7851004000000000000         mov qword ptr [rbp + 0x410], 0
0000000140353765 889518040000                   mov byte ptr [rbp + 0x418], dl
000000014035376b 8b95c0030000                   mov edx, dword ptr [rbp + 0x3c0]
0000000140353771 448b85c3030000                 mov r8d, dword ptr [rbp + 0x3c3]
0000000140353778 899519040000                   mov dword ptr [rbp + 0x419], edx
000000014035377e 4489851c040000                 mov dword ptr [rbp + 0x41c], r8d
0000000140353785 48898520040000                 mov qword ptr [rbp + 0x420], rax
000000014035378c 48898d28040000                 mov qword ptr [rbp + 0x428], rcx
0000000140353793 c7853004000000004041           mov dword ptr [rbp + 0x430], 0x41400000
000000014035379d 66c785340400009001             mov word ptr [rbp + 0x434], 0x190
00000001403537a6 c6853604000001                 mov byte ptr [rbp + 0x436], 1
00000001403537ad 488b45cd                       mov rax, qword ptr [rbp - 0x33]
00000001403537b1 48898544040000                 mov qword ptr [rbp + 0x444], rax
00000001403537b8 0f1045c0                       movups xmm0, xmmword ptr [rbp - 0x40]
00000001403537bc 0f118537040000                 movups xmmword ptr [rbp + 0x437], xmm0
00000001403537c3 440f11b54c040000               movups xmmword ptr [rbp + 0x44c], xmm14
00000001403537cb 8b059fd0f005                   mov eax, dword ptr [rip + 0x5f0d09f]
00000001403537d1 89855c040000                   mov dword ptr [rbp + 0x45c], eax
00000001403537d7 f2440f118560040000             movsd qword ptr [rbp + 0x460], xmm8
00000001403537e0 488b8550060000                 mov rax, qword ptr [rbp + 0x650]
00000001403537e7 488985e0030000                 mov qword ptr [rbp + 0x3e0], rax
00000001403537ee c6858706000000                 mov byte ptr [rbp + 0x687], 0
00000001403537f5 488d8dd0010000                 lea rcx, [rbp + 0x1d0]
00000001403537fc 4c8d85e0030000                 lea r8, [rbp + 0x3e0]
0000000140353803 488d95a8010000                 lea rdx, [rbp + 0x1a8]
000000014035380a e85162faff                     call 0x1402f9a60
000000014035380f 90                             nop
0000000140353810 e937f9ffff                     jmp 0x14035314c
