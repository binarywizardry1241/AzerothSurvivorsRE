0000000145b25d7e 837a3805                       cmp dword ptr [rdx + 0x38], 5
0000000145b25d82 4c8d353ec37c01                 lea r14, [rip + 0x17cc33e]
0000000145b25d89 bb1f000000                     mov ebx, 0x1f
0000000145b25d8e 0f8582020000                   jne 0x145b26016
0000000145b25d94 48837a1807                     cmp qword ptr [rdx + 0x18], 7
0000000145b25d99 0f8577020000                   jne 0x145b26016
0000000145b25d9f b8302e3132                     mov eax, 0x32312e30
0000000145b25da4 413302                         xor eax, dword ptr [r10]
0000000145b25da7 b932302e34                     mov ecx, 0x342e3032
0000000145b25dac 41334a03                       xor ecx, dword ptr [r10 + 3]
0000000145b25db0 09c1                           or ecx, eax
0000000145b25db2 0f855e020000                   jne 0x145b26016
