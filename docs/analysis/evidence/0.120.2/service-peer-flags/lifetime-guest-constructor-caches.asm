; Current0.120.2 PE-declared helper extent; native decoded instructions, not original source.
0000000145b21850 55                             push rbp
0000000145b21851 4157                           push r15
0000000145b21853 4156                           push r14
0000000145b21855 4154                           push r12
0000000145b21857 56                             push rsi
0000000145b21858 57                             push rdi
0000000145b21859 53                             push rbx
0000000145b2185a 4881ec60020000                 sub rsp, 0x260
0000000145b21861 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145b21869 48c785d8010000feffffff         mov qword ptr [rbp + 0x1d8], 0xfffffffffffffffe
0000000145b21874 488995c0010000                 mov qword ptr [rbp + 0x1c0], rdx
0000000145b2187b 83791002                       cmp dword ptr [rcx + 0x10], 2
0000000145b2187f 4c8985c8010000                 mov qword ptr [rbp + 0x1c8], r8
0000000145b21886 7563                           jne 0x145b218eb
0000000145b21888 83b9b80c000002                 cmp dword ptr [rcx + 0xcb8], 2
0000000145b2188f 755a                           jne 0x145b218eb
0000000145b21891 4c89cf                         mov rdi, r9
0000000145b21894 4989cf                         mov r15, rcx
0000000145b21897 e864094efa                     call 0x140002200
0000000145b2189c b907000000                     mov ecx, 7
0000000145b218a1 ba01000000                     mov edx, 1
0000000145b218a6 e815094efa                     call 0x1400021c0
0000000145b218ab 4885c0                         test rax, rax
0000000145b218ae 0f8419020000                   je 0x145b21acd
0000000145b218b4 4989c4                         mov r12, rax
0000000145b218b7 488bb540020000                 mov rsi, qword ptr [rbp + 0x240]
0000000145b218be c7400332302e32                 mov dword ptr [rax + 3], 0x322e3032
0000000145b218c5 c700302e3132                   mov dword ptr [rax], 0x32312e30
0000000145b218cb 4885f6                         test rsi, rsi
0000000145b218ce 7961                           jns 0x145b21931
0000000145b218d0 4531f6                         xor r14d, r14d
0000000145b218d3 4c89a5b8010000                 mov qword ptr [rbp + 0x1b8], r12
0000000145b218da 4c89f1                         mov rcx, r14
0000000145b218dd 4889f2                         mov rdx, rsi
0000000145b218e0 e8c6076300                     call 0x1461520ab
0000000145b218e5 90                             nop
0000000145b218e6 e9f9010000                     jmp 0x145b21ae4
0000000145b218eb 498b00                         mov rax, qword ptr [r8]
0000000145b218ee 4885c0                         test rax, rax
0000000145b218f1 740a                           je 0x145b218fd
0000000145b218f3 488b8dc0010000                 mov rcx, qword ptr [rbp + 0x1c0]
0000000145b218fa ffd0                           call rax
0000000145b218fc 90                             nop
0000000145b218fd 488b85c8010000                 mov rax, qword ptr [rbp + 0x1c8]
0000000145b21904 488b5008                       mov rdx, qword ptr [rax + 8]
0000000145b21908 4885d2                         test rdx, rdx
0000000145b2190b 7410                           je 0x145b2191d
0000000145b2190d 4c8b4010                       mov r8, qword ptr [rax + 0x10]
0000000145b21911 488b8dc0010000                 mov rcx, qword ptr [rbp + 0x1c0]
0000000145b21918 e8b3084efa                     call 0x1400021d0
0000000145b2191d 31c0                           xor eax, eax
0000000145b2191f 4881c460020000                 add rsp, 0x260
0000000145b21926 5b                             pop rbx
0000000145b21927 5f                             pop rdi
0000000145b21928 5e                             pop rsi
0000000145b21929 415c                           pop r12
0000000145b2192b 415e                           pop r14
0000000145b2192d 415f                           pop r15
0000000145b2192f 5d                             pop rbp
0000000145b21930 c3                             ret
0000000145b21931 7430                           je 0x145b21963
0000000145b21933 e8c8084efa                     call 0x140002200
0000000145b21938 41be01000000                   mov r14d, 1
0000000145b2193e ba01000000                     mov edx, 1
0000000145b21943 4889f1                         mov rcx, rsi
0000000145b21946 e875084efa                     call 0x1400021c0
0000000145b2194b 4885c0                         test rax, rax
0000000145b2194e 7483                           je 0x145b218d3
0000000145b21950 4889c3                         mov rbx, rax
0000000145b21953 4889c1                         mov rcx, rax
0000000145b21956 4889fa                         mov rdx, rdi
0000000145b21959 4989f0                         mov r8, rsi
0000000145b2195c e8ca944800                     call 0x145faae2b
0000000145b21961 eb05                           jmp 0x145b21968
0000000145b21963 bb01000000                     mov ebx, 1
0000000145b21968 c745e805000000                 mov dword ptr [rbp - 0x18], 5
0000000145b2196f 48c745b807000000               mov qword ptr [rbp - 0x48], 7
0000000145b21977 4c8965c0                       mov qword ptr [rbp - 0x40], r12
0000000145b2197b 48c745c807000000               mov qword ptr [rbp - 0x38], 7
0000000145b21983 488975d0                       mov qword ptr [rbp - 0x30], rsi
0000000145b21987 48895dd8                       mov qword ptr [rbp - 0x28], rbx
0000000145b2198b 488975e0                       mov qword ptr [rbp - 0x20], rsi
0000000145b2198f 48b80000000000000080           movabs rax, 0x8000000000000000
0000000145b21999 488945b0                       mov qword ptr [rbp - 0x50], rax
0000000145b2199d 488d8da0010000                 lea rcx, [rbp + 0x1a0]
0000000145b219a4 488d55b0                       lea rdx, [rbp - 0x50]
0000000145b219a8 e8a3d4fcff                     call 0x145aeee50
0000000145b219ad 90                             nop
0000000145b219ae 488b95a8010000                 mov rdx, qword ptr [rbp + 0x1a8]
0000000145b219b5 4c8b85b0010000                 mov r8, qword ptr [rbp + 0x1b0]
0000000145b219bc f04c01058458a102               lock add qword ptr [rip + 0x2a15884], r8
0000000145b219c4 f048ff058c58a102               lock inc qword ptr [rip + 0x2a1588c]
0000000145b219cc 488b8dc0010000                 mov rcx, qword ptr [rbp + 0x1c0]
0000000145b219d3 488995b8010000                 mov qword ptr [rbp + 0x1b8], rdx
0000000145b219da 488b85c8010000                 mov rax, qword ptr [rbp + 0x1c8]
0000000145b219e1 ff5018                         call qword ptr [rax + 0x18]
0000000145b219e4 90                             nop
0000000145b219e5 488b95a0010000                 mov rdx, qword ptr [rbp + 0x1a0]
0000000145b219ec 4885d2                         test rdx, rdx
0000000145b219ef 7412                           je 0x145b21a03
0000000145b219f1 41b801000000                   mov r8d, 1
0000000145b219f7 488b8db8010000                 mov rcx, qword ptr [rbp + 0x1b8]
0000000145b219fe e8cd074efa                     call 0x1400021d0
0000000145b21a03 c685d701000001                 mov byte ptr [rbp + 0x1d7], 1
0000000145b21a0a 488d4db0                       lea rcx, [rbp - 0x50]
0000000145b21a0e e81ddbfdff                     call 0x145aff530
0000000145b21a13 90                             nop
0000000145b21a14 4c89f9                         mov rcx, r15
0000000145b21a17 49c787b80c000000000000         mov qword ptr [r15 + 0xcb8], 0
0000000145b21a22 49c787c80c0000ffffffff         mov qword ptr [r15 + 0xcc8], 0xffffffffffffffff
0000000145b21a2d 49c787e00c000000000000         mov qword ptr [r15 + 0xce0], 0
0000000145b21a38 49c787e80c000008000000         mov qword ptr [r15 + 0xce8], 8
0000000145b21a43 49c787f00c000000000000         mov qword ptr [r15 + 0xcf0], 0
0000000145b21a4e 49c787f80c0000ffffffff         mov qword ptr [r15 + 0xcf8], 0xffffffffffffffff
0000000145b21a59 49c787e80e0000ffffffff         mov qword ptr [r15 + 0xee8], 0xffffffffffffffff
0000000145b21a64 488b85c0010000                 mov rax, qword ptr [rbp + 0x1c0]
0000000145b21a6b 498987b00f0000                 mov qword ptr [r15 + 0xfb0], rax
0000000145b21a72 488b85c8010000                 mov rax, qword ptr [rbp + 0x1c8]
0000000145b21a79 498987b80f0000                 mov qword ptr [r15 + 0xfb8], rax
0000000145b21a80 49c787c00f000000000000         mov qword ptr [r15 + 0xfc0], 0
0000000145b21a8b 0f57c0                         xorps xmm0, xmm0
0000000145b21a8e 410f1187d00f0000               movups xmmword ptr [r15 + 0xfd0], xmm0
0000000145b21a96 410f1187dc0f0000               movups xmmword ptr [r15 + 0xfdc], xmm0
0000000145b21a9e c685d701000000                 mov byte ptr [rbp + 0x1d7], 0
0000000145b21aa5 48c744242000000000             mov qword ptr [rsp + 0x20], 0
0000000145b21aae 488d15e8db7c01                 lea rdx, [rip + 0x17cdbe8]
0000000145b21ab5 41b807000000                   mov r8d, 7
0000000145b21abb 41b901000000                   mov r9d, 1
0000000145b21ac1 e84a110000                     call 0x145b22c10
0000000145b21ac6 b001                           mov al, 1
0000000145b21ac8 e952feffff                     jmp 0x145b2191f
0000000145b21acd c685d701000001                 mov byte ptr [rbp + 0x1d7], 1
0000000145b21ad4 b901000000                     mov ecx, 1
0000000145b21ad9 ba07000000                     mov edx, 7
0000000145b21ade e8c8056300                     call 0x1461520ab
0000000145b21ae3 90                             nop
0000000145b21ae4 0f0b                           ud2
