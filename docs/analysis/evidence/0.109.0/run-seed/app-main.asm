0x1400015ba: e83169ba05               call 0x145ba7ef0
0x1400015bf: 90                       nop
0x1400015c0: 8985f0000000             mov dword ptr [rbp + 0xf0], eax
0x1400015c6: 8995f4000000             mov dword ptr [rbp + 0xf4], edx
0x1400015cc: 488d8d80000000           lea rcx, [rbp + 0x80]
0x1400015d3: 488d95f0000000           lea rdx, [rbp + 0xf0]
0x1400015da: 41b800803ed5             mov r8d, 0xd53e8000
0x1400015e0: 41b9deb19d01             mov r9d, 0x19db1de
0x1400015e6: e8b568ba05               call 0x145ba7ea0
0x1400015eb: 90                       nop
0x1400015ec: be01000000               mov esi, 1
0x1400015f1: 80bd8000000000           cmp byte ptr [rbp + 0x80], 0
0x1400015f8: 751f                     jne 0x140001619
0x1400015fa: 48698588000000e8030000   imul rax, qword ptr [rbp + 0x88], 0x3e8
0x140001605: 8b8d90000000             mov ecx, dword ptr [rbp + 0x90]
0x14000160b: 4869f183de1b43           imul rsi, rcx, 0x431bde83
0x140001612: 48c1ee32                 shr rsi, 0x32
0x140001616: 4801c6                   add rsi, rax
0x140001a5b: 488d8df0000000           lea rcx, [rbp + 0xf0]
0x140001a62: 4889f2                   mov rdx, rsi
0x140001a65: e826cc0000               call 0x14000e690
