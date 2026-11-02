0000000145a91d60  4c8bb5d0000000         mov r14, qword ptr [rbp + 0xd0]
0000000145a91d67  4883fe15               cmp rsi, 0x15
0000000145a91d6b  0f838f050000           jae 0x145a92300
0000000145a91d71  40f6c601               test sil, 1
0000000145a91d75  0f850a010000           jne 0x145a91e85
0000000145a91d7b  410fb616               movzx edx, byte ptr [r14]
0000000145a91d7f  410fb64601             movzx eax, byte ptr [r14 + 1]
0000000145a91d84  38d0                   cmp al, dl
0000000145a91d86  0f83cd020000           jae 0x145a92059
0000000145a91d8c  b901000000             mov ecx, 1
0000000145a91d91  4188140e               mov byte ptr [r14 + rcx], dl
0000000145a91d95  4883f901               cmp rcx, 1
0000000145a91d99  0f84b5020000           je 0x145a92054
0000000145a91d9f  410fb6540efe           movzx edx, byte ptr [r14 + rcx - 2]
0000000145a91da5  48ffc9                 dec rcx
0000000145a91da8  38d0                   cmp al, dl
0000000145a91daa  72e5                   jb 0x145a91d91
0000000145a91dac  4c01f1                 add rcx, r14
0000000145a91daf  e9a3020000             jmp 0x145a92057
