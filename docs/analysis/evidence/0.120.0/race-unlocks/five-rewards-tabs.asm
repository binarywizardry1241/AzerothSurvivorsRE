0000000140324c20  80bf8c00000000         cmp byte ptr [rdi + 0x8c], 0
0000000140324c27  410f94c1               sete r9b
0000000140324c2b  4c8d75b0               lea r14, [rbp - 0x50]
0000000140324c2f  4c89f1                 mov rcx, r14
0000000140324c32  4889da                 mov rdx, rbx
0000000140324c35  4531c0                 xor r8d, r8d
0000000140324c38  e8037de7ff             call 0x14019c940
0000000140324c3d  80bf8c00000001         cmp byte ptr [rdi + 0x8c], 1
0000000140324c44  410f94c1               sete r9b
0000000140324c48  41b701                 mov r15b, 1
0000000140324c4b  4c89f1                 mov rcx, r14
0000000140324c4e  4889da                 mov rdx, rbx
0000000140324c51  41b001                 mov r8b, 1
0000000140324c54  e8e77ce7ff             call 0x14019c940
0000000140324c59  80bf8c00000002         cmp byte ptr [rdi + 0x8c], 2
0000000140324c60  410f94c1               sete r9b
0000000140324c64  4c89f1                 mov rcx, r14
0000000140324c67  4889da                 mov rdx, rbx
0000000140324c6a  41b002                 mov r8b, 2
0000000140324c6d  e8ce7ce7ff             call 0x14019c940
0000000140324c72  80bf8c00000003         cmp byte ptr [rdi + 0x8c], 3
0000000140324c79  410f94c1               sete r9b
0000000140324c7d  4c89f1                 mov rcx, r14
0000000140324c80  4889da                 mov rdx, rbx
0000000140324c83  41b003                 mov r8b, 3
0000000140324c86  e8b57ce7ff             call 0x14019c940
0000000140324c8b  80bf8c00000004         cmp byte ptr [rdi + 0x8c], 4
0000000140324c92  410f94c1               sete r9b
0000000140324c96  4c89f1                 mov rcx, r14
0000000140324c99  4889da                 mov rdx, rbx
0000000140324c9c  41b004                 mov r8b, 4
0000000140324c9f  e89c7ce7ff             call 0x14019c940
