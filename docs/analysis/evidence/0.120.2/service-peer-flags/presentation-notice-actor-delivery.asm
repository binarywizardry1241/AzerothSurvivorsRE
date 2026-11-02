; Current0.120.2 PE-declared helper extent; native decoded instructions, not original source.
0000000145b24860 55                             push rbp
0000000145b24861 4157                           push r15
0000000145b24863 4156                           push r14
0000000145b24865 56                             push rsi
0000000145b24866 57                             push rdi
0000000145b24867 53                             push rbx
0000000145b24868 4881ec38020000                 sub rsp, 0x238
0000000145b2486f 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145b24877 48c785b0010000feffffff         mov qword ptr [rbp + 0x1b0], 0xfffffffffffffffe
0000000145b24882 4885d2                         test rdx, rdx
0000000145b24885 0f849f000000                   je 0x145b2492a
0000000145b2488b 83b9b80c000003                 cmp dword ptr [rcx + 0xcb8], 3
0000000145b24892 0f8534010000                   jne 0x145b249cc
0000000145b24898 488b81f80c0000                 mov rax, qword ptr [rcx + 0xcf8]
0000000145b2489f 4885c0                         test rax, rax
0000000145b248a2 0f8424010000                   je 0x145b249cc
0000000145b248a8 488bb1f00c0000                 mov rsi, qword ptr [rcx + 0xcf0]
0000000145b248af 488d04c0                       lea rax, [rax + rax*8]
0000000145b248b3 48c1e007                       shl rax, 7
0000000145b248b7 4801f0                         add rax, rsi
0000000145b248ba 4881c660020000                 add rsi, 0x260
0000000145b248c1 eb2b                           jmp 0x145b248ee
0000000145b248c3 666666662e0f1f840000000000     nop word ptr cs:[rax + rax]
0000000145b248d0 488d8ea0fdffff                 lea rcx, [rsi - 0x260]
0000000145b248d7 4881c680040000                 add rsi, 0x480
0000000145b248de 4881c180040000                 add rcx, 0x480
0000000145b248e5 4839c1                         cmp rcx, rax
0000000145b248e8 0f84de000000                   je 0x145b249cc
0000000145b248ee 83bea0fdffff01                 cmp dword ptr [rsi - 0x260], 1
0000000145b248f5 75d9                           jne 0x145b248d0
0000000145b248f7 483996a8fdffff                 cmp qword ptr [rsi - 0x258], rdx
0000000145b248fe 75d0                           jne 0x145b248d0
0000000145b24900 80be1902000001                 cmp byte ptr [rsi + 0x219], 1
0000000145b24907 0f85bf000000                   jne 0x145b249cc
0000000145b2490d 498b7810                       mov rdi, qword ptr [r8 + 0x10]
0000000145b24911 4885ff                         test rdi, rdi
0000000145b24914 0f89c2000000                   jns 0x145b249dc
0000000145b2491a 4531f6                         xor r14d, r14d
0000000145b2491d 4c89f1                         mov rcx, r14
0000000145b24920 4889fa                         mov rdx, rdi
0000000145b24923 e883d76200                     call 0x1461520ab
0000000145b24928 0f0b                           ud2
0000000145b2492a 48c7c050ffffff                 mov rax, 0xffffffffffffff50
0000000145b24931 48038128100000                 add rax, qword ptr [rcx + 0x1028]
0000000145b24938 48698930100000b0000000         imul rcx, qword ptr [rcx + 0x1030], 0xb0
0000000145b24943 666666662e0f1f840000000000     nop word ptr cs:[rax + rax]
0000000145b24950 4885c9                         test rcx, rcx
0000000145b24953 7477                           je 0x145b249cc
0000000145b24955 488db0b0000000                 lea rsi, [rax + 0xb0]
0000000145b2495c 4881c150ffffff                 add rcx, -0xb0
0000000145b24963 80b85801000000                 cmp byte ptr [rax + 0x158], 0
0000000145b2496a 4889f0                         mov rax, rsi
0000000145b2496d 74e1                           je 0x145b24950
0000000145b2496f 48c745a800000000               mov qword ptr [rbp - 0x58], 0
0000000145b24977 48c745b001000000               mov qword ptr [rbp - 0x50], 1
0000000145b2497f 48c745b800000000               mov qword ptr [rbp - 0x48], 0
0000000145b24987 488d45a8                       lea rax, [rbp - 0x58]
0000000145b2498b 4889f1                         mov rcx, rsi
0000000145b2498e 4c89c2                         mov rdx, r8
0000000145b24991 4989c0                         mov r8, rax
0000000145b24994 e8d7841000                     call 0x145c2ce70
0000000145b24999 90                             nop
0000000145b2499a 488b8e90000000                 mov rcx, qword ptr [rsi + 0x90]
0000000145b249a1 4883c110                       add rcx, 0x10
0000000145b249a5 488b55b0                       mov rdx, qword ptr [rbp - 0x50]
0000000145b249a9 4c8b45b8                       mov r8, qword ptr [rbp - 0x48]
0000000145b249ad e84e971700                     call 0x145c9e100
0000000145b249b2 90                             nop
0000000145b249b3 488b55a8                       mov rdx, qword ptr [rbp - 0x58]
0000000145b249b7 4885d2                         test rdx, rdx
0000000145b249ba 7410                           je 0x145b249cc
0000000145b249bc 488b4db0                       mov rcx, qword ptr [rbp - 0x50]
0000000145b249c0 41b801000000                   mov r8d, 1
0000000145b249c6 e805d84dfa                     call 0x1400021d0
0000000145b249cb 90                             nop
0000000145b249cc 4881c438020000                 add rsp, 0x238
0000000145b249d3 5b                             pop rbx
0000000145b249d4 5f                             pop rdi
0000000145b249d5 5e                             pop rsi
0000000145b249d6 415e                           pop r14
0000000145b249d8 415f                           pop r15
0000000145b249da 5d                             pop rbp
0000000145b249db c3                             ret
0000000145b249dc 450fb77818                     movzx r15d, word ptr [r8 + 0x18]
0000000145b249e1 7441                           je 0x145b24a24
0000000145b249e3 498b5808                       mov rbx, qword ptr [r8 + 8]
0000000145b249e7 e814d84dfa                     call 0x140002200
0000000145b249ec 41be01000000                   mov r14d, 1
0000000145b249f2 ba01000000                     mov edx, 1
0000000145b249f7 4889f9                         mov rcx, rdi
0000000145b249fa e8c1d74dfa                     call 0x1400021c0
0000000145b249ff 4885c0                         test rax, rax
0000000145b24a02 0f8415ffffff                   je 0x145b2491d
0000000145b24a08 48897db0                       mov qword ptr [rbp - 0x50], rdi
0000000145b24a0c 488945b8                       mov qword ptr [rbp - 0x48], rax
0000000145b24a10 4889c1                         mov rcx, rax
0000000145b24a13 4889da                         mov rdx, rbx
0000000145b24a16 4989f8                         mov r8, rdi
0000000145b24a19 e80d644800                     call 0x145faae2b
0000000145b24a1e 48897dc0                       mov qword ptr [rbp - 0x40], rdi
0000000145b24a22 eb18                           jmp 0x145b24a3c
0000000145b24a24 48c745b000000000               mov qword ptr [rbp - 0x50], 0
0000000145b24a2c 48c745b801000000               mov qword ptr [rbp - 0x48], 1
0000000145b24a34 48c745c000000000               mov qword ptr [rbp - 0x40], 0
0000000145b24a3c 6644897dc8                     mov word ptr [rbp - 0x38], r15w
0000000145b24a41 48b80600000000000080           movabs rax, 0x8000000000000006
0000000145b24a4b 488945a8                       mov qword ptr [rbp - 0x58], rax
0000000145b24a4f 488d8d98010000                 lea rcx, [rbp + 0x198]
0000000145b24a56 488d55a8                       lea rdx, [rbp - 0x58]
0000000145b24a5a e8f1a3fcff                     call 0x145aeee50
0000000145b24a5f 90                             nop
0000000145b24a60 488b7e10                       mov rdi, qword ptr [rsi + 0x10]
0000000145b24a64 483b3e                         cmp rdi, qword ptr [rsi]
0000000145b24a67 7509                           jne 0x145b24a72
0000000145b24a69 4889f1                         mov rcx, rsi
0000000145b24a6c e86f684800                     call 0x145fab2e0
0000000145b24a71 90                             nop
0000000145b24a72 488b4608                       mov rax, qword ptr [rsi + 8]
0000000145b24a76 488d0c7f                       lea rcx, [rdi + rdi*2]
0000000145b24a7a 488b95a8010000                 mov rdx, qword ptr [rbp + 0x1a8]
0000000145b24a81 488954c810                     mov qword ptr [rax + rcx*8 + 0x10], rdx
0000000145b24a86 0f108598010000                 movups xmm0, xmmword ptr [rbp + 0x198]
0000000145b24a8d 0f1104c8                       movups xmmword ptr [rax + rcx*8], xmm0
0000000145b24a91 48ffc7                         inc rdi
0000000145b24a94 48897e10                       mov qword ptr [rsi + 0x10], rdi
0000000145b24a98 488d4da8                       lea rcx, [rbp - 0x58]
0000000145b24a9c e88faafdff                     call 0x145aff530
0000000145b24aa1 e926ffffff                     jmp 0x145b249cc
