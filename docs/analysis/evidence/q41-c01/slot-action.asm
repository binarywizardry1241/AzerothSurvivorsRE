000000014014786b: 0fb64e04                       movzx ecx, byte ptr [rsi + 4]
000000014014786f: 4c8b8520020000                 mov r8, qword ptr [rbp + 0x220]
0000000140147876: 448b8d50020000                 mov r9d, dword ptr [rbp + 0x250]
000000014014787d: 458908                         mov dword ptr [r8], r9d
0000000140147880: 488b9518020000                 mov rdx, qword ptr [rbp + 0x218]
0000000140147887: c6427001                       mov byte ptr [rdx + 0x70], 1
000000014014788b: 884a71                         mov byte ptr [rdx + 0x71], cl
000000014014788e: 4883f913                       cmp rcx, 0x13
0000000140147892: 0f8305030000                   jae 0x140147b9d
0000000140147898: 8b448d40                       mov eax, dword ptr [rbp + rcx*4 + 0x40]
000000014014789c: 31c9                           xor ecx, ecx
000000014014789e: 85c0                           test eax, eax
00000001401478a0: 0f95c1                         setne cl
00000001401478a3: 458908                         mov dword ptr [r8], r9d
00000001401478a6: 894a48                         mov dword ptr [rdx + 0x48], ecx
00000001401478a9: 89424c                         mov dword ptr [rdx + 0x4c], eax
00000001401478ac: e9f5f8ffff                     jmp 0x1401471a6
