0000000140063af7 8b08                           mov ecx, dword ptr [rax]
0000000140063af9 ba726f7374                     mov edx, 0x74736f72
0000000140063afe 31d1                           xor ecx, edx
0000000140063b00 0fb75004                       movzx edx, word ptr [rax + 4]
0000000140063b04 81f265720000                   xor edx, 0x7265
0000000140063b0a 09ca                           or edx, ecx
0000000140063b0c 0f8431040000                   je 0x140063f43
0000000140063b12 8b08                           mov ecx, dword ptr [rax]
0000000140063b14 ba7069636b                     mov edx, 0x6b636970
0000000140063b19 31d1                           xor ecx, edx
0000000140063b1b 0fb75004                       movzx edx, word ptr [rax + 4]
0000000140063b1f 81f265640000                   xor edx, 0x6465
0000000140063b25 09ca                           or edx, ecx
0000000140063b27 0f844f070000                   je 0x14006427c
0000000140063b2d 8b08                           mov ecx, dword ptr [rax]
0000000140063b2f ba70617573                     mov edx, 0x73756170
0000000140063b34 31d1                           xor ecx, edx
0000000140063b36 0fb75004                       movzx edx, word ptr [rax + 4]
0000000140063b3a 81f265640000                   xor edx, 0x6465
0000000140063b40 09ca                           or edx, ecx
0000000140063b42 0f849d070000                   je 0x1400642e5
0000000140063b48 8b08                           mov ecx, dword ptr [rax]
0000000140063b4a ba72657375                     mov edx, 0x75736572
0000000140063b4f 31d1                           xor ecx, edx
0000000140063b51 0fb75004                       movzx edx, word ptr [rax + 4]
0000000140063b55 81f26d650000                   xor edx, 0x656d
0000000140063b5b 09ca                           or edx, ecx
0000000140063b5d 0f84a4070000                   je 0x140064307
0000000140063b63 8b08                           mov ecx, dword ptr [rax]
0000000140063b65 ba62616e6e                     mov edx, 0x6e6e6162
0000000140063b6a 31d1                           xor ecx, edx
0000000140063b6c 0fb75004                       movzx edx, word ptr [rax + 4]
0000000140063b70 81f265720000                   xor edx, 0x7265
0000000140063b76 09ca                           or edx, ecx
0000000140063b78 0f8472080000                   je 0x1400643f0
0000000140063b7e 8b08                           mov ecx, dword ptr [rax]
0000000140063b80 ba64656665                     mov edx, 0x65666564
0000000140063b85 31d1                           xor ecx, edx
0000000140063b87 0fb75004                       movzx edx, word ptr [rax + 4]
0000000140063b8b 81f261740000                   xor edx, 0x7461
0000000140063b91 09ca                           or edx, ecx
0000000140063b93 0f845f020000                   je 0x140063df8
0000000140063b99 8b08                           mov ecx, dword ptr [rax]
0000000140063b9b ba6c6f676f                     mov edx, 0x6f676f6c
0000000140063ba0 31d1                           xor ecx, edx
0000000140063ba2 0fb74004                       movzx eax, word ptr [rax + 4]
0000000140063ba6 3575740000                     xor eax, 0x7475
0000000140063bab 09c8                           or eax, ecx
0000000140063bad 0f852d0b0000                   jne 0x1400646e0
