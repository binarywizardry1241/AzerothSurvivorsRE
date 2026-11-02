0000000145d15a40 488d4d58                       lea rcx, [rbp + 0x58]
0000000145d15a44 b211                           mov dl, 0x11
0000000145d15a46 e895b11a00                     call 0x145ec0be0
0000000145d15a4b 90                             nop 
0000000145d15a4c 488b5f18                       mov rbx, qword ptr [rdi + 0x18]
0000000145d15a50 4889c1                         mov rcx, rax
0000000145d15a53 89da                           mov edx, ebx
0000000145d15a55 e826b31a00                     call 0x145ec0d80
0000000145d15a5a 90                             nop 
0000000145d15a5b 4c8b7710                       mov r14, qword ptr [rdi + 0x10]
0000000145d15a5f 4c69fbb8000000                 imul r15, rbx, 0xb8
0000000145d15a66 4d01f7                         add r15, r14
0000000145d15a69 488d5d58                       lea rbx, [rbp + 0x58]
0000000145d15a6d 4d89f4                         mov r12, r14
0000000145d15a70 eb1e                           jmp 0x145d15a90
0000000145d15a72 66666666662e0f1f840000000000   nop word ptr cs:[rax + rax]
0000000145d15a80 4981c4b8000000                 add r12, 0xb8
0000000145d15a87 4889c1                         mov rcx, rax
0000000145d15a8a e891b21a00                     call 0x145ec0d20
0000000145d15a8f 90                             nop 
0000000145d15a90 4d39fc                         cmp r12, r15
0000000145d15a93 0f846f030000                   je 0x145d15e08
0000000145d15a99 498b9424a0000000               mov rdx, qword ptr [r12 + 0xa0]
0000000145d15aa1 4889d9                         mov rcx, rbx
0000000145d15aa4 e837b31a00                     call 0x145ec0de0
0000000145d15aa9 90                             nop 
0000000145d15aaa 498b542408                     mov rdx, qword ptr [r12 + 8]
0000000145d15aaf 4d8b442410                     mov r8, qword ptr [r12 + 0x10]
0000000145d15ab4 4889c1                         mov rcx, rax
0000000145d15ab7 e8c4b11a00                     call 0x145ec0c80
0000000145d15abc 90                             nop 
0000000145d15abd 410fb69424b1000000             movzx edx, byte ptr [r12 + 0xb1]
0000000145d15ac6 4889c1                         mov rcx, rax
0000000145d15ac9 e812b11a00                     call 0x145ec0be0
0000000145d15ace 90                             nop 
0000000145d15acf 410fb69424b2000000             movzx edx, byte ptr [r12 + 0xb2]
0000000145d15ad8 4889c1                         mov rcx, rax
0000000145d15adb e800b11a00                     call 0x145ec0be0
0000000145d15ae0 90                             nop 
0000000145d15ae1 49837c2430ff                   cmp qword ptr [r12 + 0x30], -1
0000000145d15ae7 7427                           je 0x145d15b10
0000000145d15ae9 4889d9                         mov rcx, rbx
0000000145d15aec b201                           mov dl, 1
0000000145d15aee e8edb01a00                     call 0x145ec0be0
0000000145d15af3 90                             nop 
0000000145d15af4 498d4c2430                     lea rcx, [r12 + 0x30]
0000000145d15af9 4889da                         mov rdx, rbx
0000000145d15afc e83fd81a00                     call 0x145ec3340
0000000145d15b01 90                             nop 
0000000145d15b02 eb17                           jmp 0x145d15b1b
0000000145d15b04 6666662e0f1f840000000000       nop word ptr cs:[rax + rax]
0000000145d15b10 4889d9                         mov rcx, rbx
0000000145d15b13 31d2                           xor edx, edx
0000000145d15b15 e8c6b01a00                     call 0x145ec0be0
0000000145d15b1a 90                             nop 
0000000145d15b1b 418b9424ac000000               mov edx, dword ptr [r12 + 0xac]
0000000145d15b23 4889d9                         mov rcx, rbx
0000000145d15b26 e855b21a00                     call 0x145ec0d80
0000000145d15b2b 90                             nop 
0000000145d15b2c 410fb69424b0000000             movzx edx, byte ptr [r12 + 0xb0]
0000000145d15b35 4889c1                         mov rcx, rax
0000000145d15b38 e8a3b01a00                     call 0x145ec0be0
0000000145d15b3d 90                             nop 
0000000145d15b3e 66baffff                       mov dx, 0xffff
0000000145d15b42 664183bc24a800000001           cmp word ptr [r12 + 0xa8], 1
0000000145d15b4c 0f852effffff                   jne 0x145d15a80
0000000145d15b52 410fb79424aa000000             movzx edx, word ptr [r12 + 0xaa]
0000000145d15b5b e920ffffff                     jmp 0x145d15a80
