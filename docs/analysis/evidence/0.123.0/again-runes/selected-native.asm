; restart-publication
0000000145c24b79 8b85981f0000                     mov eax, dword ptr [rbp + 0x1f98]
0000000145c24b7f 898570280000                     mov dword ptr [rbp + 0x2870], eax
0000000145c24b85 488b85901f0000                   mov rax, qword ptr [rbp + 0x1f90]
0000000145c24b8c 48898568280000                   mov qword ptr [rbp + 0x2868], rax
0000000145c24b93 448bb550050000                   mov r14d, dword ptr [rbp + 0x550]
0000000145c24b9a c685bf28000001                   mov byte ptr [rbp + 0x28bf], 1
0000000145c24ba1 488d8d100d0000                   lea rcx, [rbp + 0xd10]
0000000145c24ba8 488d95701a0000                   lea rdx, [rbp + 0x1a70]
0000000145c24baf e86c41eeff                       call 0x145b08d20
0000000145c24bb4 90                               nop 
0000000145c24bb5 488b8e88110000                   mov rcx, qword ptr [rsi + 0x1188]
0000000145c24bbc 488b9690110000                   mov rdx, qword ptr [rsi + 0x1190]
0000000145c24bc3 c685bf28000001                   mov byte ptr [rbp + 0x28bf], 1
0000000145c24bca 4c8d8d100d0000                   lea r9, [rbp + 0xd10]
0000000145c24bd1 4989f8                           mov r8, rdi
0000000145c24bd4 e8a771feff                       call 0x145c0bd80
0000000145c24bd9 90                               nop 
0000000145c24bda 458d460a                         lea r8d, [r14 + 0xa]
0000000145c24bde 488b9d201f0000                   mov rbx, qword ptr [rbp + 0x1f20]
0000000145c24be5 c685bf28000001                   mov byte ptr [rbp + 0x28bf], 1
0000000145c24bec 488d8d100d0000                   lea rcx, [rbp + 0xd10]
0000000145c24bf3 4889da                           mov rdx, rbx
0000000145c24bf6 e8252a0400                       call 0x145c67620
0000000145c24bfb 90                               nop 
0000000145c24bfc 488b8e88110000                   mov rcx, qword ptr [rsi + 0x1188]
0000000145c24c03 488b9690110000                   mov rdx, qword ptr [rsi + 0x1190]
0000000145c24c0a c685bf28000001                   mov byte ptr [rbp + 0x28bf], 1
0000000145c24c11 4c8d8d100d0000                   lea r9, [rbp + 0xd10]
0000000145c24c18 4989f8                           mov r8, rdi
0000000145c24c1b e86071feff                       call 0x145c0bd80
0000000145c24c20 90                               nop 
0000000145c24c21 488b8d401d0000                   mov rcx, qword ptr [rbp + 0x1d40]
0000000145c24c28 488b95481d0000                   mov rdx, qword ptr [rbp + 0x1d48]
0000000145c24c2f e81ca3e8ff                       call 0x145aaef50
0000000145c24c34 4869c0f0000000                   imul rax, rax, 0xf0
0000000145c24c3b 488d0d2e433b01                   lea rcx, [rip + 0x13b432e]
0000000145c24c42 458d460b                         lea r8d, [r14 + 0xb]
0000000145c24c46 f30f108408d4000000               movss xmm0, dword ptr [rax + rcx + 0xd4]
0000000145c24c4f c685bf28000001                   mov byte ptr [rbp + 0x28bf], 1
0000000145c24c56 f30f11442420                     movss dword ptr [rsp + 0x20], xmm0
0000000145c24c5c 488d8d100d0000                   lea rcx, [rbp + 0xd10]
0000000145c24c63 4c8d8d68280000                   lea r9, [rbp + 0x2868]
0000000145c24c6a 4889da                           mov rdx, rbx
0000000145c24c6d e88efe0400                       call 0x145c74b00
0000000145c24c72 90                               nop 
0000000145c24c73 488b8e88110000                   mov rcx, qword ptr [rsi + 0x1188]
0000000145c24c7a 488b9690110000                   mov rdx, qword ptr [rsi + 0x1190]
0000000145c24c81 c685bf28000001                   mov byte ptr [rbp + 0x28bf], 1
0000000145c24c88 4c8d8d100d0000                   lea r9, [rbp + 0xd10]
0000000145c24c8f 4989f8                           mov r8, rdi
0000000145c24c92 e8e970feff                       call 0x145c0bd80
0000000145c24c97 90                               nop 
0000000145c24c98 458d460c                         lea r8d, [r14 + 0xc]
0000000145c24c9c f30f109d14200000                 movss xmm3, dword ptr [rbp + 0x2014]
0000000145c24ca4 c685bf28000001                   mov byte ptr [rbp + 0x28bf], 1
0000000145c24cab 488d8d100d0000                   lea rcx, [rbp + 0xd10]
0000000145c24cb2 4889da                           mov rdx, rbx
0000000145c24cb5 e8865c0400                       call 0x145c6a940
0000000145c24cba 90                               nop 
0000000145c24cbb 488b8e88110000                   mov rcx, qword ptr [rsi + 0x1188]
0000000145c24cc2 488b9690110000                   mov rdx, qword ptr [rsi + 0x1190]
0000000145c24cc9 c685bf28000001                   mov byte ptr [rbp + 0x28bf], 1
0000000145c24cd0 4c8d8d100d0000                   lea r9, [rbp + 0xd10]
0000000145c24cd7 4989f8                           mov r8, rdi
0000000145c24cda e8a170feff                       call 0x145c0bd80
0000000145c24cdf 90                               nop 
0000000145c24ce0 4183c60d                         add r14d, 0xd
0000000145c24ce4 4489b510200000                   mov dword ptr [rbp + 0x2010], r14d
0000000145c24ceb c685bf28000001                   mov byte ptr [rbp + 0x28bf], 1
0000000145c24cf2 488d8d701a0000                   lea rcx, [rbp + 0x1a70]
0000000145c24cf9 e85230f6ff                       call 0x145b87d50
0000000145c24cfe 90                               nop 

; aura-reset-descriptor
0000000145b08d20 55                               push rbp
0000000145b08d21 4157                             push r15
0000000145b08d23 4156                             push r14
0000000145b08d25 4155                             push r13
0000000145b08d27 4154                             push r12
0000000145b08d29 56                               push rsi
0000000145b08d2a 57                               push rdi
0000000145b08d2b 53                               push rbx
0000000145b08d2c 4881ec28010000                   sub rsp, 0x128
0000000145b08d33 488dac2480000000                 lea rbp, [rsp + 0x80]
0000000145b08d3b 48c785a0000000feffffff           mov qword ptr [rbp + 0xa0], 0xfffffffffffffffe
0000000145b08d46 48894d50                         mov qword ptr [rbp + 0x50], rcx
0000000145b08d4a 488d5d58                         lea rbx, [rbp + 0x58]
0000000145b08d4e 4889d9                           mov rcx, rbx
0000000145b08d51 48895570                         mov qword ptr [rbp + 0x70], rdx
0000000145b08d55 e806e2ffff                       call 0x145b06f60
0000000145b08d5a 31f6                             xor esi, esi
0000000145b08d5c 4c8d75a0                         lea r14, [rbp - 0x60]
0000000145b08d60 4c8d7df0                         lea r15, [rbp - 0x10]
0000000145b08d64 eb14                             jmp 0x145b08d7a
0000000145b08d66 662e0f1f840000000000             nop word ptr cs:[rax + rax]
0000000145b08d70 c744910800000000                 mov dword ptr [rcx + rdx*4 + 8], 0
0000000145b08d78 ffc6                             inc esi
0000000145b08d7a 6683fe30                         cmp si, 0x30
0000000145b08d7e 0f839d000000                     jae 0x145b08e21
0000000145b08d84 8d462f                           lea eax, [rsi + 0x2f]
0000000145b08d87 488b4d58                         mov rcx, qword ptr [rbp + 0x58]
0000000145b08d8b 4885c9                           test rcx, rcx
0000000145b08d8e 7460                             je 0x145b08df0
0000000145b08d90 4c8b4560                         mov r8, qword ptr [rbp + 0x60]
0000000145b08d94 440fb74936                       movzx r9d, word ptr [rcx + 0x36]
0000000145b08d99 4589ca                           mov r10d, r9d
0000000145b08d9c 4501d2                           add r10d, r10d
0000000145b08d9f 48c7c2ffffffff                   mov rdx, 0xffffffffffffffff
0000000145b08da6 662e0f1f840000000000             nop word ptr cs:[rax + rax]
0000000145b08db0 4d85d2                           test r10, r10
0000000145b08db3 742b                             je 0x145b08de0
0000000145b08db5 663b44513a                       cmp ax, word ptr [rcx + rdx*2 + 0x3a]
0000000145b08dba 410f97c3                         seta r11b
0000000145b08dbe 4180db00                         sbb r11b, 0
0000000145b08dc2 48ffc2                           inc rdx
0000000145b08dc5 4983c2fe                         add r10, -2
0000000145b08dc9 4180fb01                         cmp r11b, 1
0000000145b08dcd 74e1                             je 0x145b08db0
0000000145b08dcf 450fb6cb                         movzx r9d, r11b
0000000145b08dd3 4585c9                           test r9d, r9d
0000000145b08dd6 7498                             je 0x145b08d70
0000000145b08dd8 4983e801                         sub r8, 1
0000000145b08ddc 730b                             jae 0x145b08de9
0000000145b08dde eb12                             jmp 0x145b08df2
0000000145b08de0 4c89ca                           mov rdx, r9
0000000145b08de3 4983e801                         sub r8, 1
0000000145b08de7 7209                             jb 0x145b08df2
0000000145b08de9 488b4cd150                       mov rcx, qword ptr [rcx + rdx*8 + 0x50]
0000000145b08dee eba4                             jmp 0x145b08d94
0000000145b08df0 31c9                             xor ecx, ecx
0000000145b08df2 0fb7c0                           movzx eax, ax
0000000145b08df5 48895df0                         mov qword ptr [rbp - 0x10], rbx
0000000145b08df9 48894df8                         mov qword ptr [rbp - 8], rcx
0000000145b08dfd 48c7450000000000                 mov qword ptr [rbp], 0
0000000145b08e05 48895508                         mov qword ptr [rbp + 8], rdx
0000000145b08e09 48894510                         mov qword ptr [rbp + 0x10], rax
0000000145b08e0d 4c89f1                           mov rcx, r14
0000000145b08e10 4c89fa                           mov rdx, r15
0000000145b08e13 4531c0                           xor r8d, r8d
0000000145b08e16 e8a5ff0800                       call 0x145b98dc0
0000000145b08e1b 90                               nop 
0000000145b08e1c e957ffffff                       jmp 0x145b08d78
0000000145b08e21 31f6                             xor esi, esi
0000000145b08e23 4c8d75a0                         lea r14, [rbp - 0x60]
0000000145b08e27 4c8d7df0                         lea r15, [rbp - 0x10]
0000000145b08e2b eb0d                             jmp 0x145b08e3a
0000000145b08e2d 0f1f00                           nop dword ptr [rax]
0000000145b08e30 c744910800000000                 mov dword ptr [rcx + rdx*4 + 8], 0
0000000145b08e38 ffc6                             inc esi
0000000145b08e3a 6683fe06                         cmp si, 6
0000000145b08e3e 0f839d000000                     jae 0x145b08ee1
0000000145b08e44 8d465f                           lea eax, [rsi + 0x5f]
0000000145b08e47 488b4d58                         mov rcx, qword ptr [rbp + 0x58]
0000000145b08e4b 4885c9                           test rcx, rcx
0000000145b08e4e 7460                             je 0x145b08eb0
0000000145b08e50 4c8b4560                         mov r8, qword ptr [rbp + 0x60]
0000000145b08e54 440fb74936                       movzx r9d, word ptr [rcx + 0x36]
0000000145b08e59 4589ca                           mov r10d, r9d
0000000145b08e5c 4501d2                           add r10d, r10d
0000000145b08e5f 48c7c2ffffffff                   mov rdx, 0xffffffffffffffff
0000000145b08e66 662e0f1f840000000000             nop word ptr cs:[rax + rax]
0000000145b08e70 4d85d2                           test r10, r10
0000000145b08e73 742b                             je 0x145b08ea0
0000000145b08e75 663b44513a                       cmp ax, word ptr [rcx + rdx*2 + 0x3a]
0000000145b08e7a 410f97c3                         seta r11b
0000000145b08e7e 4180db00                         sbb r11b, 0
0000000145b08e82 48ffc2                           inc rdx
0000000145b08e85 4983c2fe                         add r10, -2
0000000145b08e89 4180fb01                         cmp r11b, 1
0000000145b08e8d 74e1                             je 0x145b08e70
0000000145b08e8f 450fb6cb                         movzx r9d, r11b
0000000145b08e93 4585c9                           test r9d, r9d
0000000145b08e96 7498                             je 0x145b08e30
0000000145b08e98 4983e801                         sub r8, 1
0000000145b08e9c 730b                             jae 0x145b08ea9
0000000145b08e9e eb12                             jmp 0x145b08eb2
0000000145b08ea0 4c89ca                           mov rdx, r9
0000000145b08ea3 4983e801                         sub r8, 1
0000000145b08ea7 7209                             jb 0x145b08eb2
0000000145b08ea9 488b4cd150                       mov rcx, qword ptr [rcx + rdx*8 + 0x50]
0000000145b08eae eba4                             jmp 0x145b08e54
0000000145b08eb0 31c9                             xor ecx, ecx
0000000145b08eb2 0fb7c0                           movzx eax, ax
0000000145b08eb5 48895df0                         mov qword ptr [rbp - 0x10], rbx
0000000145b08eb9 48894df8                         mov qword ptr [rbp - 8], rcx
0000000145b08ebd 48c7450000000000                 mov qword ptr [rbp], 0
0000000145b08ec5 48895508                         mov qword ptr [rbp + 8], rdx
0000000145b08ec9 48894510                         mov qword ptr [rbp + 0x10], rax
0000000145b08ecd 4c89f1                           mov rcx, r14
0000000145b08ed0 4c89fa                           mov rdx, r15
0000000145b08ed3 4531c0                           xor r8d, r8d
0000000145b08ed6 e8e5fe0800                       call 0x145b98dc0
0000000145b08edb 90                               nop 
0000000145b08edc e957ffffff                       jmp 0x145b08e38
0000000145b08ee1 488d4da0                         lea rcx, [rbp - 0x60]
0000000145b08ee5 488b5570                         mov rdx, qword ptr [rbp + 0x70]
0000000145b08ee9 e8326c0100                       call 0x145b1fb20
0000000145b08eee 90                               nop 
0000000145b08eef 4c8d7508                         lea r14, [rbp + 8]
0000000145b08ef3 0f1005c62a8201                   movups xmm0, xmmword ptr [rip + 0x1822ac6]
0000000145b08efa 0f114508                         movups xmmword ptr [rbp + 8], xmm0
0000000145b08efe 0f1005ab2a8201                   movups xmm0, xmmword ptr [rip + 0x1822aab]
0000000145b08f05 0f114530                         movups xmmword ptr [rbp + 0x30], xmm0
0000000145b08f09 488b4570                         mov rax, qword ptr [rbp + 0x70]
0000000145b08f0d 4c8bb8a8030000                   mov r15, qword ptr [rax + 0x3a8]
0000000145b08f14 488b80b0030000                   mov rax, qword ptr [rax + 0x3b0]
0000000145b08f1b 48c1e003                         shl rax, 3
0000000145b08f1f 4c8d24c0                         lea r12, [rax + rax*8]
0000000145b08f23 bf01000000                       mov edi, 1
0000000145b08f28 4531ed                           xor r13d, r13d
0000000145b08f2b bb01000000                       mov ebx, 1
0000000145b08f30 31f6                             xor esi, esi
0000000145b08f32 eb1c                             jmp 0x145b08f50
0000000145b08f34 8d144de6010000                   lea edx, [rcx*2 + 0x1e6]
0000000145b08f3b 488d4d58                         lea rcx, [rbp + 0x58]
0000000145b08f3f 4531c0                           xor r8d, r8d
0000000145b08f42 e89925faff                       call 0x145aab4e0
0000000145b08f47 90                               nop 
0000000145b08f48 0f1f840000000000                 nop dword ptr [rax + rax]
0000000145b08f50 4883fb02                         cmp rbx, 2
0000000145b08f54 753a                             jne 0x145b08f90
0000000145b08f56 4883fe02                         cmp rsi, 2
0000000145b08f5a 0f84b0000000                     je 0x145b09010
0000000145b08f60 498d04f6                         lea rax, [r14 + rsi*8]
0000000145b08f64 48ffc6                           inc rsi
0000000145b08f67 bb02000000                       mov ebx, 2
0000000145b08f6c 488b08                           mov rcx, qword ptr [rax]
0000000145b08f6f 4883f913                         cmp rcx, 0x13
0000000145b08f73 0f8383000000                     jae 0x145b08ffc
0000000145b08f79 837c8da000                       cmp dword ptr [rbp + rcx*4 - 0x60], 0
0000000145b08f7e 4c89e0                           mov rax, r12
0000000145b08f81 4c89fa                           mov rdx, r15
0000000145b08f84 75ca                             jne 0x145b08f50
0000000145b08f86 eb28                             jmp 0x145b08fb0
0000000145b08f88 0f1f840000000000                 nop dword ptr [rax + rax]
0000000145b08f90 4883ff01                         cmp rdi, 1
0000000145b08f94 753a                             jne 0x145b08fd0
0000000145b08f96 b901000000                       mov ecx, 1
0000000145b08f9b 31ff                             xor edi, edi
0000000145b08f9d bb01000000                       mov ebx, 1
0000000145b08fa2 837c8da000                       cmp dword ptr [rbp + rcx*4 - 0x60], 0
0000000145b08fa7 4c89e0                           mov rax, r12
0000000145b08faa 4c89fa                           mov rdx, r15
0000000145b08fad 75a1                             jne 0x145b08f50
0000000145b08faf 90                               nop 
0000000145b08fb0 4885c0                           test rax, rax
0000000145b08fb3 0f847bffffff                     je 0x145b08f34
0000000145b08fb9 4883c0b8                         add rax, -0x48
0000000145b08fbd 48394a30                         cmp qword ptr [rdx + 0x30], rcx
0000000145b08fc1 488d5248                         lea rdx, [rdx + 0x48]
0000000145b08fc5 75e9                             jne 0x145b08fb0
0000000145b08fc7 eb87                             jmp 0x145b08f50
0000000145b08fc9 0f1f8000000000                   nop dword ptr [rax]
0000000145b08fd0 bf02000000                       mov edi, 2
0000000145b08fd5 4983fd02                         cmp r13, 2
0000000145b08fd9 0f8477ffffff                     je 0x145b08f56
0000000145b08fdf 4b8d04ee                         lea rax, [r14 + r13*8]
0000000145b08fe3 4883c028                         add rax, 0x28
0000000145b08fe7 49ffc5                           inc r13
0000000145b08fea bb01000000                       mov ebx, 1
0000000145b08fef 488b08                           mov rcx, qword ptr [rax]
0000000145b08ff2 4883f913                         cmp rcx, 0x13
0000000145b08ff6 0f827dffffff                     jb 0x145b08f79
0000000145b08ffc 4c8d05cd298201                   lea r8, [rip + 0x18229cd]
0000000145b09003 ba13000000                       mov edx, 0x13
0000000145b09008 e8e6506a00                       call 0x1461ae0f3
0000000145b0900d 90                               nop 
0000000145b0900e 0f0b                             ud2 
0000000145b09010 c7859000000000000000             mov dword ptr [rbp + 0x90], 0
0000000145b0901a 48c7457800000000                 mov qword ptr [rbp + 0x78], 0
0000000145b09022 48c7858000000001000000           mov qword ptr [rbp + 0x80], 1
0000000145b0902d 48c7858800000000000000           mov qword ptr [rbp + 0x88], 0
0000000145b09038 48837d6800                       cmp qword ptr [rbp + 0x68], 0
0000000145b0903d 488b7550                         mov rsi, qword ptr [rbp + 0x50]
0000000145b09041 7460                             je 0x145b090a3
0000000145b09043 488b4570                         mov rax, qword ptr [rbp + 0x70]
0000000145b09047 488bb8b0040000                   mov rdi, qword ptr [rax + 0x4b0]
0000000145b0904e c6859f00000001                   mov byte ptr [rbp + 0x9f], 1
0000000145b09055 488d4d78                         lea rcx, [rbp + 0x78]
0000000145b09059 e8f24b6a00                       call 0x1461adc50
0000000145b0905e 90                               nop 
0000000145b0905f 488b8580000000                   mov rax, qword ptr [rbp + 0x80]
0000000145b09066 c60000                           mov byte ptr [rax], 0
0000000145b09069 48c7858800000001000000           mov qword ptr [rbp + 0x88], 1
0000000145b09074 c6859f00000001                   mov byte ptr [rbp + 0x9f], 1
0000000145b0907b 488d5578                         lea rdx, [rbp + 0x78]
0000000145b0907f 4889f9                           mov rcx, rdi
0000000145b09082 e8e95afaff                       call 0x145aaeb70
0000000145b09087 90                               nop 
0000000145b09088 c6859f00000001                   mov byte ptr [rbp + 0x9f], 1
0000000145b0908f 488d4d58                         lea rcx, [rbp + 0x58]
0000000145b09093 488d5578                         lea rdx, [rbp + 0x78]
0000000145b09097 e86426faff                       call 0x145aab700
0000000145b0909c 90                               nop 
0000000145b0909d ff8590000000                     inc dword ptr [rbp + 0x90]
0000000145b090a3 488b4578                         mov rax, qword ptr [rbp + 0x78]
0000000145b090a7 488b8d80000000                   mov rcx, qword ptr [rbp + 0x80]
0000000145b090ae 488b9588000000                   mov rdx, qword ptr [rbp + 0x88]
0000000145b090b5 48895500                         mov qword ptr [rbp], rdx
0000000145b090b9 8b9590000000                     mov edx, dword ptr [rbp + 0x90]
0000000145b090bf 895508                           mov dword ptr [rbp + 8], edx
0000000145b090c2 8b9594000000                     mov edx, dword ptr [rbp + 0x94]
0000000145b090c8 89550c                           mov dword ptr [rbp + 0xc], edx
0000000145b090cb 488945f0                         mov qword ptr [rbp - 0x10], rax
0000000145b090cf 48894df8                         mov qword ptr [rbp - 8], rcx
0000000145b090d3 c6859f00000000                   mov byte ptr [rbp + 0x9f], 0
0000000145b090da 488d55f0                         lea rdx, [rbp - 0x10]
0000000145b090de 4889f1                           mov rcx, rsi
0000000145b090e1 e81a09faff                       call 0x145aa9a00
0000000145b090e6 90                               nop 
0000000145b090e7 488d4d58                         lea rcx, [rbp + 0x58]
0000000145b090eb e8307ffaff                       call 0x145ab1020
0000000145b090f0 4889f0                           mov rax, rsi
0000000145b090f3 4881c428010000                   add rsp, 0x128
0000000145b090fa 5b                               pop rbx
0000000145b090fb 5f                               pop rdi
0000000145b090fc 5e                               pop rsi
0000000145b090fd 415c                             pop r12
0000000145b090ff 415d                             pop r13
0000000145b09101 415e                             pop r14
0000000145b09103 415f                             pop r15
0000000145b09105 5d                               pop rbp
0000000145b09106 c3                               ret 

; fresh-game-constructor
0000000145b15970 55                               push rbp
0000000145b15971 4157                             push r15
0000000145b15973 4156                             push r14
0000000145b15975 4155                             push r13
0000000145b15977 4154                             push r12
0000000145b15979 56                               push rsi
0000000145b1597a 57                               push rdi
0000000145b1597b 53                               push rbx
0000000145b1597c b8b8110000                       mov eax, 0x11b8
0000000145b15981 e85aeb4e00                       call 0x1460044e0
0000000145b15986 4829c4                           sub rsp, rax
0000000145b15989 488dac2480000000                 lea rbp, [rsp + 0x80]
0000000145b15991 440f29bd20110000                 movaps xmmword ptr [rbp + 0x1120], xmm15
0000000145b15999 440f29b510110000                 movaps xmmword ptr [rbp + 0x1110], xmm14
0000000145b159a1 440f29ad00110000                 movaps xmmword ptr [rbp + 0x1100], xmm13
0000000145b159a9 440f29a5f0100000                 movaps xmmword ptr [rbp + 0x10f0], xmm12
0000000145b159b1 440f299de0100000                 movaps xmmword ptr [rbp + 0x10e0], xmm11
0000000145b159b9 440f2995d0100000                 movaps xmmword ptr [rbp + 0x10d0], xmm10
0000000145b159c1 440f298dc0100000                 movaps xmmword ptr [rbp + 0x10c0], xmm9
0000000145b159c9 440f2985b0100000                 movaps xmmword ptr [rbp + 0x10b0], xmm8
0000000145b159d1 0f29bda0100000                   movaps xmmword ptr [rbp + 0x10a0], xmm7
0000000145b159d8 0f29b590100000                   movaps xmmword ptr [rbp + 0x1090], xmm6
0000000145b159df 48c78588100000feffffff           mov qword ptr [rbp + 0x1088], 0xfffffffffffffffe
0000000145b159ea 4989d7                           mov r15, rdx
0000000145b159ed 48898d280f0000                   mov qword ptr [rbp + 0xf28], rcx
0000000145b159f4 4c898568100000                   mov qword ptr [rbp + 0x1068], r8
0000000145b159fb 4c8985c00f0000                   mov qword ptr [rbp + 0xfc0], r8
0000000145b15a02 0fb682a5010000                   movzx eax, byte ptr [rdx + 0x1a5]
0000000145b15a09 48898570100000                   mov qword ptr [rbp + 0x1070], rax
0000000145b15a10 8d78fe                           lea edi, [rax - 2]
0000000145b15a13 bb01000000                       mov ebx, 1
0000000145b15a18 4080ff07                         cmp dil, 7
0000000145b15a1c 730e                             jae 0x145b15a2c
0000000145b15a1e 400fb6c7                         movzx eax, dil
0000000145b15a22 488d0d07848101                   lea rcx, [rip + 0x1818407]
0000000145b15a29 8b1c81                           mov ebx, dword ptr [rcx + rax*4]
0000000145b15a2c 418b870c010000                   mov eax, dword ptr [r15 + 0x10c]
0000000145b15a33 8985d00f0000                     mov dword ptr [rbp + 0xfd0], eax
0000000145b15a39 458ab7bf010000                   mov r14b, byte ptr [r15 + 0x1bf]
0000000145b15a40 31f6                             xor esi, esi
0000000145b15a42 4180fe03                         cmp r14b, 3
0000000145b15a46 0f938578100000                   setae byte ptr [rbp + 0x1078]
0000000145b15a4d 4d8ba720010000                   mov r12, qword ptr [r15 + 0x120]
0000000145b15a54 4d8baf28010000                   mov r13, qword ptr [r15 + 0x128]
0000000145b15a5b 4c89e1                           mov rcx, r12
0000000145b15a5e 4c89ea                           mov rdx, r13
0000000145b15a61 e8ea94f9ff                       call 0x145aaef50
0000000145b15a66 418b8f9c010000                   mov ecx, dword ptr [r15 + 0x19c]
0000000145b15a6d 4c8d04c8                         lea r8, [rax + rcx*8]
0000000145b15a71 4929c8                           sub r8, rcx
0000000145b15a74 c6858410000001                   mov byte ptr [rbp + 0x1084], 1
0000000145b15a7b 488d8d080f0000                   lea rcx, [rbp + 0xf08]
0000000145b15a82 4488b581100000                   mov byte ptr [rbp + 0x1081], r14b
0000000145b15a89 4489f2                           mov edx, r14d
0000000145b15a8c 4c89bdd80f0000                   mov qword ptr [rbp + 0xfd8], r15
0000000145b15a93 e808a90c00                       call 0x145be03a0
0000000145b15a98 90                               nop 
0000000145b15a99 899dd40f0000                     mov dword ptr [rbp + 0xfd4], ebx
0000000145b15a9f 410fb68fa4010000                 movzx ecx, byte ptr [r15 + 0x1a4]
0000000145b15aa7 8d41fe                           lea eax, [rcx - 2]
0000000145b15aaa 3c09                             cmp al, 9
0000000145b15aac 48898d200f0000                   mov qword ptr [rbp + 0xf20], rcx
0000000145b15ab3 7710                             ja 0x145b15ac5
0000000145b15ab5 0fb6c0                           movzx eax, al
0000000145b15ab8 488d0d69848101                   lea rcx, [rip + 0x1818469]
0000000145b15abf 488b1cc1                         mov rbx, qword ptr [rcx + rax*8]
0000000145b15ac3 eb07                             jmp 0x145b15acc
0000000145b15ac5 488d1df4574c01                   lea rbx, [rip + 0x14c57f4]
0000000145b15acc 4c89e1                           mov rcx, r12
0000000145b15acf 4c89ea                           mov rdx, r13
0000000145b15ad2 e87994f9ff                       call 0x145aaef50
0000000145b15ad7 4989c4                           mov r12, rax
0000000145b15ada c6858310000001                   mov byte ptr [rbp + 0x1083], 1
0000000145b15ae1 c6858210000001                   mov byte ptr [rbp + 0x1082], 1
0000000145b15ae8 488d4da8                         lea rcx, [rbp - 0x58]
0000000145b15aec 4c89fa                           mov rdx, r15
0000000145b15aef e8fc7e0700                       call 0x145b8d9f0
0000000145b15af4 90                               nop 
0000000145b15af5 0fb68578100000                   movzx eax, byte ptr [rbp + 0x1078]
0000000145b15afc 4088c6                           mov sil, al
0000000145b15aff 8d04b6                           lea eax, [rsi + rsi*4]
0000000145b15b02 83c014                           add eax, 0x14
0000000145b15b05 898578100000                     mov dword ptr [rbp + 0x1078], eax
0000000145b15b0b 4969c4f0000000                   imul rax, r12, 0xf0
0000000145b15b12 4c8d3d57344c01                   lea r15, [rip + 0x14c3457]
0000000145b15b19 4901c7                           add r15, rax
0000000145b15b1c 4c8b6340                         mov r12, qword ptr [rbx + 0x40]
0000000145b15b20 4c8b6b48                         mov r13, qword ptr [rbx + 0x48]
0000000145b15b24 4c89a5e00f0000                   mov qword ptr [rbp + 0xfe0], r12
0000000145b15b2b 4c89ade80f0000                   mov qword ptr [rbp + 0xfe8], r13
0000000145b15b32 4531f6                           xor r14d, r14d
0000000145b15b35 488d35dc6c4c01                   lea rsi, [rip + 0x14c6cdc]
0000000145b15b3c eb13                             jmp 0x145b15b51
0000000145b15b3e 6690                             nop 
0000000145b15b40 4983c678                         add r14, 0x78
0000000145b15b44 4981fef8340000                   cmp r14, 0x34f8
0000000145b15b4b 0f847f150000                     je 0x145b170d0
0000000145b15b51 4d396c3608                       cmp qword ptr [r14 + rsi + 8], r13
0000000145b15b56 75e8                             jne 0x145b15b40
0000000145b15b58 498b0c36                         mov rcx, qword ptr [r14 + rsi]
0000000145b15b5c 4c89e2                           mov rdx, r12
0000000145b15b5f 4d89e8                           mov r8, r13
0000000145b15b62 e8eaf44e00                       call 0x146005051
0000000145b15b67 85c0                             test eax, eax
0000000145b15b69 75d5                             jne 0x145b15b40
0000000145b15b6b 4080ff06                         cmp dil, 6
0000000145b15b6f 7711                             ja 0x145b15b82
0000000145b15b71 400fb6c7                         movzx eax, dil
0000000145b15b75 488d0d34838101                   lea rcx, [rip + 0x1818334]
0000000145b15b7c 488b04c1                         mov rax, qword ptr [rcx + rax*8]
0000000145b15b80 eb07                             jmp 0x145b15b89
0000000145b15b82 488d05a7454c01                   lea rax, [rip + 0x14c45a7]
0000000145b15b89 4901f6                           add r14, rsi
0000000145b15b8c 4c8b6030                         mov r12, qword ptr [rax + 0x30]
0000000145b15b90 4c8b6838                         mov r13, qword ptr [rax + 0x38]
0000000145b15b94 4c89a5e00f0000                   mov qword ptr [rbp + 0xfe0], r12
0000000145b15b9b 4c89ade80f0000                   mov qword ptr [rbp + 0xfe8], r13
0000000145b15ba2 31ff                             xor edi, edi
0000000145b15ba4 eb1b                             jmp 0x145b15bc1
0000000145b15ba6 662e0f1f840000000000             nop word ptr cs:[rax + rax]
0000000145b15bb0 4883c778                         add rdi, 0x78
0000000145b15bb4 4881fff8340000                   cmp rdi, 0x34f8
0000000145b15bbb 0f844d150000                     je 0x145b1710e
0000000145b15bc1 4c396c3708                       cmp qword ptr [rdi + rsi + 8], r13
0000000145b15bc6 75e8                             jne 0x145b15bb0
0000000145b15bc8 488b0c37                         mov rcx, qword ptr [rdi + rsi]
0000000145b15bcc 4c89e2                           mov rdx, r12
0000000145b15bcf 4d89e8                           mov r8, r13
0000000145b15bd2 e87af44e00                       call 0x146005051
0000000145b15bd7 85c0                             test eax, eax
0000000145b15bd9 75d5                             jne 0x145b15bb0
0000000145b15bdb f2410f10b7c8000000               movsd xmm6, qword ptr [r15 + 0xc8]
0000000145b15be4 f3440f16c6                       movshdup xmm8, xmm6
0000000145b15be9 4c8ba568100000                   mov r12, qword ptr [rbp + 0x1068]
0000000145b15bf0 498d4c2410                       lea rcx, [r12 + 0x10]
0000000145b15bf5 c6858610000001                   mov byte ptr [rbp + 0x1086], 1
0000000145b15bfc c6858510000001                   mov byte ptr [rbp + 0x1085], 1
0000000145b15c03 0f28ce                           movaps xmm1, xmm6
0000000145b15c06 410f28d0                         movaps xmm2, xmm8
0000000145b15c0a e8b18b0d00                       call 0x145bee7c0
0000000145b15c0f 90                               nop 
0000000145b15c10 a801                             test al, 1
0000000145b15c12 7405                             je 0x145b15c19
0000000145b15c14 0f28f8                           movaps xmm7, xmm0
0000000145b15c17 eb43                             jmp 0x145b15c5c
0000000145b15c19 49837c2468ff                     cmp qword ptr [r12 + 0x68], -1
0000000145b15c1f 7431                             je 0x145b15c52
0000000145b15c21 498d542468                       lea rdx, [r12 + 0x68]
0000000145b15c26 c6858610000001                   mov byte ptr [rbp + 0x1086], 1
0000000145b15c2d c6858510000001                   mov byte ptr [rbp + 0x1085], 1
0000000145b15c34 488d4d08                         lea rcx, [rbp + 8]
0000000145b15c38 0f28d6                           movaps xmm2, xmm6
0000000145b15c3b 410f28d8                         movaps xmm3, xmm8
0000000145b15c3f e8bcc00d00                       call 0x145bf1d00
0000000145b15c44 90                               nop 
0000000145b15c45 837d0801                         cmp dword ptr [rbp + 8], 1
0000000145b15c49 7507                             jne 0x145b15c52
0000000145b15c4b f30f107d14                       movss xmm7, dword ptr [rbp + 0x14]
0000000145b15c50 eb0a                             jmp 0x145b15c5c
0000000145b15c52 f3410f10bc24b8000000             movss xmm7, dword ptr [r12 + 0xb8]
0000000145b15c5c 488b85d80f0000                   mov rax, qword ptr [rbp + 0xfd8]
0000000145b15c63 488b9038010000                   mov rdx, qword ptr [rax + 0x138]
0000000145b15c6a c6858610000001                   mov byte ptr [rbp + 0x1086], 1
0000000145b15c71 c6858510000001                   mov byte ptr [rbp + 0x1085], 1
0000000145b15c78 488d8d680d0000                   lea rcx, [rbp + 0xd68]
0000000145b15c7f e86cbd1a00                       call 0x145cc19f0
0000000145b15c84 90                               nop 
0000000145b15c85 4c8badd80f0000                   mov r13, qword ptr [rbp + 0xfd8]
0000000145b15c8c 4d8ba530010000                   mov r12, qword ptr [r13 + 0x130]
0000000145b15c93 f3450f1097d4000000               movss xmm10, dword ptr [r15 + 0xd4]
0000000145b15c9c 4989df                           mov r15, rbx
0000000145b15c9f f3440f108b80000000               movss xmm9, dword ptr [rbx + 0x80]
0000000145b15ca8 e853c54efa                       call 0x140002200
0000000145b15cad b958000000                       mov ecx, 0x58
0000000145b15cb2 ba08000000                       mov edx, 8
0000000145b15cb7 e804c54efa                       call 0x1400021c0
0000000145b15cbc 4885c0                           test rax, rax
0000000145b15cbf 0f84d3130000                     je 0x145b17098
0000000145b15cc5 4c89e3                           mov rbx, r12
0000000145b15cc8 4c8930                           mov qword ptr [rax], r14
0000000145b15ccb c7400801000000                   mov dword ptr [rax + 8], 1
0000000145b15cd2 f2440f1025a5c46900               movsd xmm12, qword ptr [rip + 0x69c4a5]
0000000145b15cdb f2440f11600c                     movsd qword ptr [rax + 0xc], xmm12
0000000145b15ce1 48c740140000803f                 mov qword ptr [rax + 0x14], 0x3f800000
0000000145b15ce9 f2440f102d9ec46900               movsd xmm13, qword ptr [rip + 0x69c49e]
0000000145b15cf2 f2440f11681c                     movsd qword ptr [rax + 0x1c], xmm13
0000000145b15cf8 0f57c0                           xorps xmm0, xmm0
0000000145b15cfb 0f114024                         movups xmmword ptr [rax + 0x24], xmm0
0000000145b15cff c7403400000000                   mov dword ptr [rax + 0x34], 0
0000000145b15d06 f2440f116838                     movsd qword ptr [rax + 0x38], xmm13
0000000145b15d0c c7404000000000                   mov dword ptr [rax + 0x40], 0
0000000145b15d13 440f281d85c46900                 movaps xmm11, xmmword ptr [rip + 0x69c485]
0000000145b15d1b 488985c80f0000                   mov qword ptr [rbp + 0xfc8], rax
0000000145b15d22 440f115844                       movups xmmword ptr [rax + 0x44], xmm11
0000000145b15d27 48c785880f000000000000           mov qword ptr [rbp + 0xf88], 0
0000000145b15d32 48c785900f000008000000           mov qword ptr [rbp + 0xf90], 8
0000000145b15d3d 48c785980f000000000000           mov qword ptr [rbp + 0xf98], 0
0000000145b15d48 4d8da550010000                   lea r12, [r13 + 0x150]
0000000145b15d4f 498d4550                         lea rax, [r13 + 0x50]
0000000145b15d53 4889442420                       mov qword ptr [rsp + 0x20], rax
0000000145b15d58 488d8de00f0000                   lea rcx, [rbp + 0xfe0]
0000000145b15d5f 488b9570100000                   mov rdx, qword ptr [rbp + 0x1070]
0000000145b15d66 4c8b85200f0000                   mov r8, qword ptr [rbp + 0xf20]
0000000145b15d6d 4d89e1                           mov r9, r12
0000000145b15d70 e8db0f0e00                       call 0x145bf6d50
0000000145b15d75 90                               nop 
0000000145b15d76 4d8d85ac010000                   lea r8, [r13 + 0x1ac]
0000000145b15d7d 488d8d40100000                   lea rcx, [rbp + 0x1040]
0000000145b15d84 4c89e2                           mov rdx, r12
0000000145b15d87 e8442b0e00                       call 0x145bf88d0
0000000145b15d8c 90                               nop 
0000000145b15d8d 4801fe                           add rsi, rdi
0000000145b15d90 31c0                             xor eax, eax
0000000145b15d92 80bd8110000003                   cmp byte ptr [rbp + 0x1081], 3
0000000145b15d99 0f92c0                           setb al
0000000145b15d9c f3450f10bf80000000               movss xmm15, dword ptr [r15 + 0x80]
0000000145b15da5 f3450f10b784000000               movss xmm14, dword ptr [r15 + 0x84]
0000000145b15dae 418b8d08010000                   mov ecx, dword ptr [r13 + 0x108]
0000000145b15db5 8d7c4101                         lea edi, [rcx + rax*2 + 1]
0000000145b15db9 48c785f0030000ffffffff           mov qword ptr [rbp + 0x3f0], 0xffffffffffffffff
0000000145b15dc4 0f1085880f0000                   movups xmm0, xmmword ptr [rbp + 0xf88]
0000000145b15dcb 0f1185a8030000                   movups xmmword ptr [rbp + 0x3a8], xmm0
0000000145b15dd2 488b85980f0000                   mov rax, qword ptr [rbp + 0xf98]
0000000145b15dd9 488985b8030000                   mov qword ptr [rbp + 0x3b8], rax
0000000145b15de0 0f1085e00f0000                   movups xmm0, xmmword ptr [rbp + 0xfe0]
0000000145b15de7 0f108df00f0000                   movups xmm1, xmmword ptr [rbp + 0xff0]
0000000145b15dee 0f109500100000                   movups xmm2, xmmword ptr [rbp + 0x1000]
0000000145b15df5 0f109d10100000                   movups xmm3, xmmword ptr [rbp + 0x1010]
0000000145b15dfc 0f2985300f0000                   movaps xmmword ptr [rbp + 0xf30], xmm0
0000000145b15e03 0f298d400f0000                   movaps xmmword ptr [rbp + 0xf40], xmm1
0000000145b15e0a 0f2995500f0000                   movaps xmmword ptr [rbp + 0xf50], xmm2
0000000145b15e11 0f299d600f0000                   movaps xmmword ptr [rbp + 0xf60], xmm3
0000000145b15e18 0f10851c100000                   movups xmm0, xmmword ptr [rbp + 0x101c]
0000000145b15e1f 0f11856c0f0000                   movups xmmword ptr [rbp + 0xf6c], xmm0
0000000145b15e26 0f108540100000                   movups xmm0, xmmword ptr [rbp + 0x1040]
0000000145b15e2d 0f1185c0030000                   movups xmmword ptr [rbp + 0x3c0], xmm0
0000000145b15e34 488b8550100000                   mov rax, qword ptr [rbp + 0x1050]
0000000145b15e3b 488985d0030000                   mov qword ptr [rbp + 0x3d0], rax
0000000145b15e42 450f57c0                         xorps xmm8, xmm8
0000000145b15e46 440f118584040000                 movups xmmword ptr [rbp + 0x484], xmm8
0000000145b15e4e c7859404000000000000             mov dword ptr [rbp + 0x494], 0
0000000145b15e58 488d8db8010000                   lea rcx, [rbp + 0x1b8]
0000000145b15e5f 41b8c0010000                     mov r8d, 0x1c0
0000000145b15e65 4c89ea                           mov rdx, r13
0000000145b15e68 e8def14e00                       call 0x14600504b
0000000145b15e6d 440f2985f00e0000                 movaps xmmword ptr [rbp + 0xef0], xmm8
0000000145b15e75 48c785000f000000000000           mov qword ptr [rbp + 0xf00], 0
0000000145b15e80 440f1185900d0000                 movups xmmword ptr [rbp + 0xd90], xmm8
0000000145b15e88 440f118544100000                 movups xmmword ptr [rbp + 0x1044], xmm8
0000000145b15e90 440f118554100000                 movups xmmword ptr [rbp + 0x1054], xmm8
0000000145b15e98 c7856410000000000000             mov dword ptr [rbp + 0x1064], 0
0000000145b15ea2 440f2985900e0000                 movaps xmmword ptr [rbp + 0xe90], xmm8
0000000145b15eaa 440f2985a00e0000                 movaps xmmword ptr [rbp + 0xea0], xmm8
0000000145b15eb2 440f2985b00e0000                 movaps xmmword ptr [rbp + 0xeb0], xmm8
0000000145b15eba 440f2985c00e0000                 movaps xmmword ptr [rbp + 0xec0], xmm8
0000000145b15ec2 c785b80f000000000000             mov dword ptr [rbp + 0xfb8], 0
0000000145b15ecc 48c785b00f000000000000           mov qword ptr [rbp + 0xfb0], 0
0000000145b15ed7 488b85180f0000                   mov rax, qword ptr [rbp + 0xf18]
0000000145b15ede 488985e00e0000                   mov qword ptr [rbp + 0xee0], rax
0000000145b15ee5 0f1085080f0000                   movups xmm0, xmmword ptr [rbp + 0xf08]
0000000145b15eec 0f2985d00e0000                   movaps xmmword ptr [rbp + 0xed0], xmm0
0000000145b15ef3 0f1045f8                         movups xmm0, xmmword ptr [rbp - 8]
0000000145b15ef7 0f298530100000                   movaps xmmword ptr [rbp + 0x1030], xmm0
0000000145b15efe 0f1045e8                         movups xmm0, xmmword ptr [rbp - 0x18]
0000000145b15f02 0f298520100000                   movaps xmmword ptr [rbp + 0x1020], xmm0
0000000145b15f09 0f1045a8                         movups xmm0, xmmword ptr [rbp - 0x58]
0000000145b15f0d 0f104db8                         movups xmm1, xmmword ptr [rbp - 0x48]
0000000145b15f11 0f1055c8                         movups xmm2, xmmword ptr [rbp - 0x38]
0000000145b15f15 0f105dd8                         movups xmm3, xmmword ptr [rbp - 0x28]
0000000145b15f19 0f299d10100000                   movaps xmmword ptr [rbp + 0x1010], xmm3
0000000145b15f20 0f299500100000                   movaps xmmword ptr [rbp + 0x1000], xmm2
0000000145b15f27 0f298df00f0000                   movaps xmmword ptr [rbp + 0xff0], xmm1
0000000145b15f2e 0f2985e00f0000                   movaps xmmword ptr [rbp + 0xfe0], xmm0
0000000145b15f35 440f2985f00d0000                 movaps xmmword ptr [rbp + 0xdf0], xmm8
0000000145b15f3d 440f2985000e0000                 movaps xmmword ptr [rbp + 0xe00], xmm8
0000000145b15f45 440f2985100e0000                 movaps xmmword ptr [rbp + 0xe10], xmm8
0000000145b15f4d 440f2985200e0000                 movaps xmmword ptr [rbp + 0xe20], xmm8
0000000145b15f55 440f2985300e0000                 movaps xmmword ptr [rbp + 0xe30], xmm8
0000000145b15f5d 440f2985400e0000                 movaps xmmword ptr [rbp + 0xe40], xmm8
0000000145b15f65 440f2985500e0000                 movaps xmmword ptr [rbp + 0xe50], xmm8
0000000145b15f6d 440f2985600e0000                 movaps xmmword ptr [rbp + 0xe60], xmm8
0000000145b15f75 440f2985700e0000                 movaps xmmword ptr [rbp + 0xe70], xmm8
0000000145b15f7d 440f2985800e0000                 movaps xmmword ptr [rbp + 0xe80], xmm8
0000000145b15f85 440f2985a00d0000                 movaps xmmword ptr [rbp + 0xda0], xmm8
0000000145b15f8d 440f1185900f0000                 movups xmmword ptr [rbp + 0xf90], xmm8
0000000145b15f95 440f11859c0f0000                 movups xmmword ptr [rbp + 0xf9c], xmm8
0000000145b15f9d 440f2985b00d0000                 movaps xmmword ptr [rbp + 0xdb0], xmm8
0000000145b15fa5 440f2985c00d0000                 movaps xmmword ptr [rbp + 0xdc0], xmm8
0000000145b15fad 440f2985d00d0000                 movaps xmmword ptr [rbp + 0xdd0], xmm8
0000000145b15fb5 440f2985e00d0000                 movaps xmmword ptr [rbp + 0xde0], xmm8
0000000145b15fbd 0f1085680d0000                   movups xmm0, xmmword ptr [rbp + 0xd68]
0000000145b15fc4 0f108d780d0000                   movups xmm1, xmmword ptr [rbp + 0xd78]
0000000145b15fcb 0f118d100c0000                   movups xmmword ptr [rbp + 0xc10], xmm1
0000000145b15fd2 0f1185000c0000                   movups xmmword ptr [rbp + 0xc00], xmm0
0000000145b15fd9 c785a00c000000000000             mov dword ptr [rbp + 0xca0], 0
0000000145b15fe3 c6855f0d000000                   mov byte ptr [rbp + 0xd5f], 0
0000000145b15fea 48c7857803000001000000           mov qword ptr [rbp + 0x378], 1
0000000145b15ff5 488b85c80f0000                   mov rax, qword ptr [rbp + 0xfc8]
0000000145b15ffc 48898580030000                   mov qword ptr [rbp + 0x380], rax
0000000145b16003 48c7858803000001000000           mov qword ptr [rbp + 0x388], 1
0000000145b1600e 48c7859003000000000000           mov qword ptr [rbp + 0x390], 0
0000000145b16019 48c7859803000008000000           mov qword ptr [rbp + 0x398], 8
0000000145b16024 48c785a003000000000000           mov qword ptr [rbp + 0x3a0], 0
0000000145b1602f 48c785d803000000000000           mov qword ptr [rbp + 0x3d8], 0
0000000145b1603a 48c785e003000008000000           mov qword ptr [rbp + 0x3e0], 8
0000000145b16045 48c785e803000000000000           mov qword ptr [rbp + 0x3e8], 0
0000000145b16050 4889b560040000                   mov qword ptr [rbp + 0x460], rsi
0000000145b16057 c7856804000001000000             mov dword ptr [rbp + 0x468], 1
0000000145b16061 f2440f11a56c040000               movsd qword ptr [rbp + 0x46c], xmm12
0000000145b1606a 48c785740400000000803f           mov qword ptr [rbp + 0x474], 0x3f800000
0000000145b16075 f2440f11ad7c040000               movsd qword ptr [rbp + 0x47c], xmm13
0000000145b1607e f2440f11ad98040000               movsd qword ptr [rbp + 0x498], xmm13
0000000145b16087 c785a004000000000000             mov dword ptr [rbp + 0x4a0], 0
0000000145b16091 440f119da4040000                 movups xmmword ptr [rbp + 0x4a4], xmm11
0000000145b16099 48899db8040000                   mov qword ptr [rbp + 0x4b8], rbx
0000000145b160a0 c785c004000000000000             mov dword ptr [rbp + 0x4c0], 0
0000000145b160aa f20f10056e387c00                 movsd xmm0, qword ptr [rip + 0x7c386e]
0000000145b160b2 f20f1185c4040000                 movsd qword ptr [rbp + 0x4c4], xmm0
0000000145b160ba c785cc04000000000000             mov dword ptr [rbp + 0x4cc], 0
0000000145b160c4 f3440f11bdd0040000               movss dword ptr [rbp + 0x4d0], xmm15
0000000145b160cd 0f280d1c468101                   movaps xmm1, xmmword ptr [rip + 0x181461c]
0000000145b160d4 0f118dd4040000                   movups xmmword ptr [rbp + 0x4d4], xmm1
0000000145b160db f20f100d1d468101                 movsd xmm1, qword ptr [rip + 0x181461d]
0000000145b160e3 f20f118de4040000                 movsd qword ptr [rbp + 0x4e4], xmm1
0000000145b160eb c785ec0400000000803f             mov dword ptr [rbp + 0x4ec], 0x3f800000
0000000145b160f5 f3440f11b5f0040000               movss dword ptr [rbp + 0x4f0], xmm14
0000000145b160fe 440f119df4040000                 movups xmmword ptr [rbp + 0x4f4], xmm11
0000000145b16106 440f118514050000                 movups xmmword ptr [rbp + 0x514], xmm8
0000000145b1610e 440f118504050000                 movups xmmword ptr [rbp + 0x504], xmm8
0000000145b16116 c7852405000000000000             mov dword ptr [rbp + 0x524], 0
0000000145b16120 0f13b528050000                   movlps qword ptr [rbp + 0x528], xmm6
0000000145b16127 f30f11bd30050000                 movss dword ptr [rbp + 0x530], xmm7
0000000145b1612f f3440f119534050000               movss dword ptr [rbp + 0x534], xmm10
0000000145b16138 48c7853805000001000000           mov qword ptr [rbp + 0x538], 1
0000000145b16143 f3440f118d40050000               movss dword ptr [rbp + 0x540], xmm9
0000000145b1614c 48c7854405000000000000           mov qword ptr [rbp + 0x544], 0
0000000145b16157 0f288d300f0000                   movaps xmm1, xmmword ptr [rbp + 0xf30]
0000000145b1615e 0f2895400f0000                   movaps xmm2, xmmword ptr [rbp + 0xf40]
0000000145b16165 0f289d500f0000                   movaps xmm3, xmmword ptr [rbp + 0xf50]
0000000145b1616c 0f28a5600f0000                   movaps xmm4, xmmword ptr [rbp + 0xf60]
0000000145b16173 0f118d4c050000                   movups xmmword ptr [rbp + 0x54c], xmm1
0000000145b1617a 0f11955c050000                   movups xmmword ptr [rbp + 0x55c], xmm2
0000000145b16181 0f119d6c050000                   movups xmmword ptr [rbp + 0x56c], xmm3
0000000145b16188 0f11a57c050000                   movups xmmword ptr [rbp + 0x57c], xmm4
0000000145b1618f 0f108d6c0f0000                   movups xmm1, xmmword ptr [rbp + 0xf6c]
0000000145b16196 0f118d88050000                   movups xmmword ptr [rbp + 0x588], xmm1
0000000145b1619d 48c7859805000000000000           mov qword ptr [rbp + 0x598], 0
0000000145b161a8 89bda0050000                     mov dword ptr [rbp + 0x5a0], edi
0000000145b161ae 48b80000000001000000             movabs rax, 0x100000000
0000000145b161b8 488985a4050000                   mov qword ptr [rbp + 0x5a4], rax
0000000145b161bf f20f100d49458101                 movsd xmm1, qword ptr [rip + 0x1814549]
0000000145b161c7 f20f118dac050000                 movsd qword ptr [rbp + 0x5ac], xmm1
0000000145b161cf 48c785b805000000000000           mov qword ptr [rbp + 0x5b8], 0
0000000145b161da 48c785c005000008000000           mov qword ptr [rbp + 0x5c0], 8
0000000145b161e5 440f1185c8050000                 movups xmmword ptr [rbp + 0x5c8], xmm8
0000000145b161ed 48c785d805000008000000           mov qword ptr [rbp + 0x5d8], 8
0000000145b161f8 440f1185e0050000                 movups xmmword ptr [rbp + 0x5e0], xmm8
0000000145b16200 48c785f005000008000000           mov qword ptr [rbp + 0x5f0], 8
0000000145b1620b 440f1185a40c0000                 movups xmmword ptr [rbp + 0xca4], xmm8
0000000145b16213 440f1185f8050000                 movups xmmword ptr [rbp + 0x5f8], xmm8
0000000145b1621b 48c7850806000008000000           mov qword ptr [rbp + 0x608], 8
0000000145b16226 440f118510060000                 movups xmmword ptr [rbp + 0x610], xmm8
0000000145b1622e 48c7852006000008000000           mov qword ptr [rbp + 0x620], 8
0000000145b16239 440f118528060000                 movups xmmword ptr [rbp + 0x628], xmm8
0000000145b16241 48c7853806000008000000           mov qword ptr [rbp + 0x638], 8
0000000145b1624c 440f118540060000                 movups xmmword ptr [rbp + 0x640], xmm8
0000000145b16254 48c7855006000008000000           mov qword ptr [rbp + 0x650], 8
0000000145b1625f 440f118558060000                 movups xmmword ptr [rbp + 0x658], xmm8
0000000145b16267 48c7856806000008000000           mov qword ptr [rbp + 0x668], 8
0000000145b16272 48c7857006000000000000           mov qword ptr [rbp + 0x670], 0
0000000145b1627d 488b8568100000                   mov rax, qword ptr [rbp + 0x1068]
0000000145b16284 488985f80b0000                   mov qword ptr [rbp + 0xbf8], rax
0000000145b1628b 48c785200c000000000000           mov qword ptr [rbp + 0xc20], 0
0000000145b16296 48c7857806000000000000           mov qword ptr [rbp + 0x678], 0
0000000145b162a1 48c7858006000008000000           mov qword ptr [rbp + 0x680], 8
0000000145b162ac 440f118588060000                 movups xmmword ptr [rbp + 0x688], xmm8
0000000145b162b4 48c7859806000008000000           mov qword ptr [rbp + 0x698], 8
0000000145b162bf 440f1185a0060000                 movups xmmword ptr [rbp + 0x6a0], xmm8
0000000145b162c7 48c785b006000008000000           mov qword ptr [rbp + 0x6b0], 8
0000000145b162d2 440f1185b8060000                 movups xmmword ptr [rbp + 0x6b8], xmm8
0000000145b162da 440f1185b40c0000                 movups xmmword ptr [rbp + 0xcb4], xmm8
0000000145b162e2 48c785c806000008000000           mov qword ptr [rbp + 0x6c8], 8
0000000145b162ed 48c785d006000000000000           mov qword ptr [rbp + 0x6d0], 0
0000000145b162f8 48c7450800000000                 mov qword ptr [rbp + 8], 0
0000000145b16300 48c785d806000000000000           mov qword ptr [rbp + 0x6d8], 0
0000000145b1630b 48c785e006000004000000           mov qword ptr [rbp + 0x6e0], 4
0000000145b16316 48c785c40c000000000000           mov qword ptr [rbp + 0xcc4], 0
0000000145b16321 440f1185e8060000                 movups xmmword ptr [rbp + 0x6e8], xmm8
0000000145b16329 48c785f806000004000000           mov qword ptr [rbp + 0x6f8], 4
0000000145b16334 440f118500070000                 movups xmmword ptr [rbp + 0x700], xmm8
0000000145b1633c 48c7851007000008000000           mov qword ptr [rbp + 0x710], 8
0000000145b16347 48c7851807000000000000           mov qword ptr [rbp + 0x718], 0
0000000145b16352 c6855d0d0000ff                   mov byte ptr [rbp + 0xd5d], 0xff
0000000145b16359 48c7451800000000                 mov qword ptr [rbp + 0x18], 0
0000000145b16361 c785900b000000000000             mov dword ptr [rbp + 0xb90], 0
0000000145b1636b 48c785980b000000000000           mov qword ptr [rbp + 0xb98], 0
0000000145b16376 48c785a00b000001000000           mov qword ptr [rbp + 0xba0], 1
0000000145b16381 48c785a80b000000000000           mov qword ptr [rbp + 0xba8], 0
0000000145b1638c 48c7852007000000000000           mov qword ptr [rbp + 0x720], 0
0000000145b16397 48c7852807000008000000           mov qword ptr [rbp + 0x728], 8
0000000145b163a2 0f288d900e0000                   movaps xmm1, xmmword ptr [rbp + 0xe90]
0000000145b163a9 0f118d30070000                   movups xmmword ptr [rbp + 0x730], xmm1
0000000145b163b0 48c7854007000008000000           mov qword ptr [rbp + 0x740], 8
0000000145b163bb 0f288da00e0000                   movaps xmm1, xmmword ptr [rbp + 0xea0]
0000000145b163c2 0f118d48070000                   movups xmmword ptr [rbp + 0x748], xmm1
0000000145b163c9 48c7855807000008000000           mov qword ptr [rbp + 0x758], 8
0000000145b163d4 440f118560070000                 movups xmmword ptr [rbp + 0x760], xmm8
0000000145b163dc 48c7857007000004000000           mov qword ptr [rbp + 0x770], 4
0000000145b163e7 0f288db00e0000                   movaps xmm1, xmmword ptr [rbp + 0xeb0]
0000000145b163ee 0f118d78070000                   movups xmmword ptr [rbp + 0x778], xmm1
0000000145b163f5 48c7858807000004000000           mov qword ptr [rbp + 0x788], 4
0000000145b16400 0f288dc00e0000                   movaps xmm1, xmmword ptr [rbp + 0xec0]
0000000145b16407 0f118d90070000                   movups xmmword ptr [rbp + 0x790], xmm1
0000000145b1640e 48c785a007000004000000           mov qword ptr [rbp + 0x7a0], 4
0000000145b16419 48c785a807000000000000           mov qword ptr [rbp + 0x7a8], 0
0000000145b16424 488b85000f0000                   mov rax, qword ptr [rbp + 0xf00]
0000000145b1642b 488985c0070000                   mov qword ptr [rbp + 0x7c0], rax
0000000145b16432 0f288df00e0000                   movaps xmm1, xmmword ptr [rbp + 0xef0]
0000000145b16439 0f118db0070000                   movups xmmword ptr [rbp + 0x7b0], xmm1
0000000145b16440 488b85980d0000                   mov rax, qword ptr [rbp + 0xd98]
0000000145b16447 488985d8070000                   mov qword ptr [rbp + 0x7d8], rax
0000000145b1644e 0f108d880d0000                   movups xmm1, xmmword ptr [rbp + 0xd88]
0000000145b16455 0f118dc8070000                   movups xmmword ptr [rbp + 0x7c8], xmm1
0000000145b1645c 48c785e807000000000000           mov qword ptr [rbp + 0x7e8], 0
0000000145b16467 c785f407000002000000             mov dword ptr [rbp + 0x7f4], 2
0000000145b16471 488b8560100000                   mov rax, qword ptr [rbp + 0x1060]
0000000145b16478 48898518080000                   mov qword ptr [rbp + 0x818], rax
0000000145b1647f 0f108d40100000                   movups xmm1, xmmword ptr [rbp + 0x1040]
0000000145b16486 0f109550100000                   movups xmm2, xmmword ptr [rbp + 0x1050]
0000000145b1648d 0f119508080000                   movups xmmword ptr [rbp + 0x808], xmm2
0000000145b16494 0f118df8070000                   movups xmmword ptr [rbp + 0x7f8], xmm1
0000000145b1649b 0f280d7e428101                   movaps xmm1, xmmword ptr [rip + 0x181427e]
0000000145b164a2 0f118dcc0c0000                   movups xmmword ptr [rbp + 0xccc], xmm1
0000000145b164a9 f30f100dcfbe6900                 movss xmm1, dword ptr [rip + 0x69becf]
0000000145b164b1 0f138ddc0c0000                   movlps qword ptr [rbp + 0xcdc], xmm1
0000000145b164b8 c785e40c000000007042             mov dword ptr [rbp + 0xce4], 0x42700000
0000000145b164c2 c6855e0d0000ff                   mov byte ptr [rbp + 0xd5e], 0xff
0000000145b164c9 48c785280c000000000000           mov qword ptr [rbp + 0xc28], 0
0000000145b164d4 8b85b80f0000                     mov eax, dword ptr [rbp + 0xfb8]
0000000145b164da 8985f00c0000                     mov dword ptr [rbp + 0xcf0], eax
0000000145b164e0 488b85b00f0000                   mov rax, qword ptr [rbp + 0xfb0]
0000000145b164e7 488985e80c0000                   mov qword ptr [rbp + 0xce8], rax
0000000145b164ee f20f100d3a428101                 movsd xmm1, qword ptr [rip + 0x181423a]
0000000145b164f6 f20f118df40c0000                 movsd qword ptr [rbp + 0xcf4], xmm1
0000000145b164fe c785fc0c000000007042             mov dword ptr [rbp + 0xcfc], 0x42700000
0000000145b16508 48c7852008000000000000           mov qword ptr [rbp + 0x820], 0
0000000145b16513 48c7852808000004000000           mov qword ptr [rbp + 0x828], 4
0000000145b1651e 48c7853008000000000000           mov qword ptr [rbp + 0x830], 0
0000000145b16529 8b8578100000                     mov eax, dword ptr [rbp + 0x1078]
0000000145b1652f 8985000d0000                     mov dword ptr [rbp + 0xd00], eax
0000000145b16535 48c785300c000000000000           mov qword ptr [rbp + 0xc30], 0
0000000145b16540 48c785040d000000000000           mov qword ptr [rbp + 0xd04], 0
0000000145b1654b 488b85e00e0000                   mov rax, qword ptr [rbp + 0xee0]
0000000145b16552 48898548080000                   mov qword ptr [rbp + 0x848], rax
0000000145b16559 0f288dd00e0000                   movaps xmm1, xmmword ptr [rbp + 0xed0]
0000000145b16560 0f118d38080000                   movups xmmword ptr [rbp + 0x838], xmm1
0000000145b16567 48c7855008000000000000           mov qword ptr [rbp + 0x850], 0
0000000145b16572 48c7855808000008000000           mov qword ptr [rbp + 0x858], 8
0000000145b1657d 48c7856008000000000000           mov qword ptr [rbp + 0x860], 0
0000000145b16588 c785b00b000000000000             mov dword ptr [rbp + 0xbb0], 0
0000000145b16592 c785b80b000000000000             mov dword ptr [rbp + 0xbb8], 0
0000000145b1659c c785480d000001000000             mov dword ptr [rbp + 0xd48], 1
0000000145b165a6 48c785380c000000000000           mov qword ptr [rbp + 0xc38], 0
0000000145b165b1 c6854c0d000000                   mov byte ptr [rbp + 0xd4c], 0
0000000145b165b8 f20f11850c0d0000                 movsd qword ptr [rbp + 0xd0c], xmm0
0000000145b165c0 48c7856808000000000000           mov qword ptr [rbp + 0x868], 0
0000000145b165cb 48c7857008000004000000           mov qword ptr [rbp + 0x870], 4
0000000145b165d6 440f118578080000                 movups xmmword ptr [rbp + 0x878], xmm8
0000000145b165de 48c7858808000004000000           mov qword ptr [rbp + 0x888], 4
0000000145b165e9 48c7859008000000000000           mov qword ptr [rbp + 0x890], 0
0000000145b165f4 66c7854d0d00000000               mov word ptr [rbp + 0xd4d], 0
0000000145b165fd c785140d0000000020c1             mov dword ptr [rbp + 0xd14], 0xc1200000
0000000145b16607 c785c00b000000000000             mov dword ptr [rbp + 0xbc0], 0
0000000145b16611 c785d80b000000000000             mov dword ptr [rbp + 0xbd8], 0
0000000145b1661b c785e00b000000000000             mov dword ptr [rbp + 0xbe0], 0
0000000145b16625 c785e80b000000000000             mov dword ptr [rbp + 0xbe8], 0
0000000145b1662f c785180d000000000000             mov dword ptr [rbp + 0xd18], 0
0000000145b16639 c785780c000000000000             mov dword ptr [rbp + 0xc78], 0
0000000145b16643 c7858c0c000000000000             mov dword ptr [rbp + 0xc8c], 0
0000000145b1664d c785f00b000000000000             mov dword ptr [rbp + 0xbf0], 0
0000000145b16657 c785520d000000000000             mov dword ptr [rbp + 0xd52], 0
0000000145b16661 c7854f0d000000000000             mov dword ptr [rbp + 0xd4f], 0
0000000145b1666b 0f288530100000                   movaps xmm0, xmmword ptr [rbp + 0x1030]
0000000145b16672 0f1185e8080000                   movups xmmword ptr [rbp + 0x8e8], xmm0
0000000145b16679 0f288520100000                   movaps xmm0, xmmword ptr [rbp + 0x1020]
0000000145b16680 0f1185d8080000                   movups xmmword ptr [rbp + 0x8d8], xmm0
0000000145b16687 0f2885e00f0000                   movaps xmm0, xmmword ptr [rbp + 0xfe0]
0000000145b1668e 0f288df00f0000                   movaps xmm1, xmmword ptr [rbp + 0xff0]
0000000145b16695 0f289500100000                   movaps xmm2, xmmword ptr [rbp + 0x1000]
0000000145b1669c 0f289d10100000                   movaps xmm3, xmmword ptr [rbp + 0x1010]
0000000145b166a3 0f119dc8080000                   movups xmmword ptr [rbp + 0x8c8], xmm3
0000000145b166aa 0f1195b8080000                   movups xmmword ptr [rbp + 0x8b8], xmm2
0000000145b166b1 0f118da8080000                   movups xmmword ptr [rbp + 0x8a8], xmm1
0000000145b166b8 0f118598080000                   movups xmmword ptr [rbp + 0x898], xmm0
0000000145b166bf 48c7452800000000                 mov qword ptr [rbp + 0x28], 0
0000000145b166c7 48c7453800000000                 mov qword ptr [rbp + 0x38], 0
0000000145b166cf 48c7454800000000                 mov qword ptr [rbp + 0x48], 0
0000000145b166d7 48c7455800000000                 mov qword ptr [rbp + 0x58], 0
0000000145b166df 48c7456008000000                 mov qword ptr [rbp + 0x60], 8
0000000145b166e7 0f2885f00d0000                   movaps xmm0, xmmword ptr [rbp + 0xdf0]
0000000145b166ee 0f114568                         movups xmmword ptr [rbp + 0x68], xmm0
0000000145b166f2 48c7457804000000                 mov qword ptr [rbp + 0x78], 4
0000000145b166fa 0f2885000e0000                   movaps xmm0, xmmword ptr [rbp + 0xe00]
0000000145b16701 0f118580000000                   movups xmmword ptr [rbp + 0x80], xmm0
0000000145b16708 48c7859000000004000000           mov qword ptr [rbp + 0x90], 4
0000000145b16713 0f2885100e0000                   movaps xmm0, xmmword ptr [rbp + 0xe10]
0000000145b1671a 0f118598000000                   movups xmmword ptr [rbp + 0x98], xmm0
0000000145b16721 48c785a800000008000000           mov qword ptr [rbp + 0xa8], 8
0000000145b1672c 0f2885200e0000                   movaps xmm0, xmmword ptr [rbp + 0xe20]
0000000145b16733 0f1185b0000000                   movups xmmword ptr [rbp + 0xb0], xmm0
0000000145b1673a 48c785c000000008000000           mov qword ptr [rbp + 0xc0], 8
0000000145b16745 0f2885300e0000                   movaps xmm0, xmmword ptr [rbp + 0xe30]
0000000145b1674c 0f1185c8000000                   movups xmmword ptr [rbp + 0xc8], xmm0
0000000145b16753 48c785d800000008000000           mov qword ptr [rbp + 0xd8], 8
0000000145b1675e 0f2885400e0000                   movaps xmm0, xmmword ptr [rbp + 0xe40]
0000000145b16765 0f1185e0000000                   movups xmmword ptr [rbp + 0xe0], xmm0
0000000145b1676c 48c785f000000004000000           mov qword ptr [rbp + 0xf0], 4
0000000145b16777 0f2885500e0000                   movaps xmm0, xmmword ptr [rbp + 0xe50]
0000000145b1677e 0f1185f8000000                   movups xmmword ptr [rbp + 0xf8], xmm0
0000000145b16785 48c7850801000004000000           mov qword ptr [rbp + 0x108], 4
0000000145b16790 0f2885600e0000                   movaps xmm0, xmmword ptr [rbp + 0xe60]
0000000145b16797 0f118510010000                   movups xmmword ptr [rbp + 0x110], xmm0
0000000145b1679e 48c7852001000008000000           mov qword ptr [rbp + 0x120], 8
0000000145b167a9 0f2885700e0000                   movaps xmm0, xmmword ptr [rbp + 0xe70]
0000000145b167b0 0f118528010000                   movups xmmword ptr [rbp + 0x128], xmm0
0000000145b167b7 48c7853801000008000000           mov qword ptr [rbp + 0x138], 8
0000000145b167c2 0f2885800e0000                   movaps xmm0, xmmword ptr [rbp + 0xe80]
0000000145b167c9 0f118540010000                   movups xmmword ptr [rbp + 0x140], xmm0
0000000145b167d0 48c7855001000004000000           mov qword ptr [rbp + 0x150], 4
0000000145b167db 48c7855801000000000000           mov qword ptr [rbp + 0x158], 0
0000000145b167e6 c6858901000002                   mov byte ptr [rbp + 0x189], 2
0000000145b167ed 48c785f808000000000000           mov qword ptr [rbp + 0x8f8], 0
0000000145b167f8 440f1185a0010000                 movups xmmword ptr [rbp + 0x1a0], xmm8
0000000145b16800 440f118590010000                 movups xmmword ptr [rbp + 0x190], xmm8
0000000145b16808 48c785af01000000000000           mov qword ptr [rbp + 0x1af], 0
0000000145b16813 48c7850009000008000000           mov qword ptr [rbp + 0x900], 8
0000000145b1681e 0f2885a00d0000                   movaps xmm0, xmmword ptr [rbp + 0xda0]
0000000145b16825 0f118508090000                   movups xmmword ptr [rbp + 0x908], xmm0
0000000145b1682c 48c7851809000008000000           mov qword ptr [rbp + 0x918], 8
0000000145b16837 0f2885b00d0000                   movaps xmm0, xmmword ptr [rbp + 0xdb0]
0000000145b1683e 0f118520090000                   movups xmmword ptr [rbp + 0x920], xmm0
0000000145b16845 48c7853009000008000000           mov qword ptr [rbp + 0x930], 8
0000000145b16850 0f2885c00d0000                   movaps xmm0, xmmword ptr [rbp + 0xdc0]
0000000145b16857 0f118538090000                   movups xmmword ptr [rbp + 0x938], xmm0
0000000145b1685e 48c7854809000008000000           mov qword ptr [rbp + 0x948], 8
0000000145b16869 0f2885d00d0000                   movaps xmm0, xmmword ptr [rbp + 0xdd0]
0000000145b16870 0f118550090000                   movups xmmword ptr [rbp + 0x950], xmm0
0000000145b16877 48c7856009000008000000           mov qword ptr [rbp + 0x960], 8
0000000145b16882 0f2885e00d0000                   movaps xmm0, xmmword ptr [rbp + 0xde0]
0000000145b16889 0f118568090000                   movups xmmword ptr [rbp + 0x968], xmm0
0000000145b16890 48c7857809000008000000           mov qword ptr [rbp + 0x978], 8
0000000145b1689b 440f118580090000                 movups xmmword ptr [rbp + 0x980], xmm8
0000000145b168a3 c7859009000000000000             mov dword ptr [rbp + 0x990], 0
0000000145b168ad 8b85a80f0000                     mov eax, dword ptr [rbp + 0xfa8]
0000000145b168b3 8985b4090000                     mov dword ptr [rbp + 0x9b4], eax
0000000145b168b9 0f1085880f0000                   movups xmm0, xmmword ptr [rbp + 0xf88]
0000000145b168c0 0f108d980f0000                   movups xmm1, xmmword ptr [rbp + 0xf98]
0000000145b168c7 0f118da4090000                   movups xmmword ptr [rbp + 0x9a4], xmm1
0000000145b168ce 0f118594090000                   movups xmmword ptr [rbp + 0x994], xmm0
0000000145b168d5 48c785bd09000000000000           mov qword ptr [rbp + 0x9bd], 0
0000000145b168e0 48c785b809000000000000           mov qword ptr [rbp + 0x9b8], 0
0000000145b168eb 0f28054e3e8101                   movaps xmm0, xmmword ptr [rip + 0x1813e4e]
0000000145b168f2 0f11851c0d0000                   movups xmmword ptr [rbp + 0xd1c], xmm0
0000000145b168f9 48c785c809000000000000           mov qword ptr [rbp + 0x9c8], 0
0000000145b16904 48c785d009000008000000           mov qword ptr [rbp + 0x9d0], 8
0000000145b1690f 440f1185d8090000                 movups xmmword ptr [rbp + 0x9d8], xmm8
0000000145b16917 48c785e809000008000000           mov qword ptr [rbp + 0x9e8], 8
0000000145b16922 48c785f009000000000000           mov qword ptr [rbp + 0x9f0], 0
0000000145b1692d 8b85d00f0000                     mov eax, dword ptr [rbp + 0xfd0]
0000000145b16933 89852c0d0000                     mov dword ptr [rbp + 0xd2c], eax
0000000145b16939 c785560d000000000000             mov dword ptr [rbp + 0xd56], 0
0000000145b16943 48c785f809000000000000           mov qword ptr [rbp + 0x9f8], 0
0000000145b1694e 48c785000a000008000000           mov qword ptr [rbp + 0xa00], 8
0000000145b16959 440f1185080a0000                 movups xmmword ptr [rbp + 0xa08], xmm8
0000000145b16961 48c785180a000008000000           mov qword ptr [rbp + 0xa18], 8
0000000145b1696c 440f1185200a0000                 movups xmmword ptr [rbp + 0xa20], xmm8
0000000145b16974 48c785300a000008000000           mov qword ptr [rbp + 0xa30], 8
0000000145b1697f c6855a0d000000                   mov byte ptr [rbp + 0xd5a], 0
0000000145b16986 c685600d000000                   mov byte ptr [rbp + 0xd60], 0
0000000145b1698d 440f1185380a0000                 movups xmmword ptr [rbp + 0xa38], xmm8
0000000145b16995 48c785480a000008000000           mov qword ptr [rbp + 0xa48], 8
0000000145b169a0 440f1185500a0000                 movups xmmword ptr [rbp + 0xa50], xmm8
0000000145b169a8 48c785600a000008000000           mov qword ptr [rbp + 0xa60], 8
0000000145b169b3 440f1185680a0000                 movups xmmword ptr [rbp + 0xa68], xmm8
0000000145b169bb 48c785780a000008000000           mov qword ptr [rbp + 0xa78], 8
0000000145b169c6 440f1185800a0000                 movups xmmword ptr [rbp + 0xa80], xmm8
0000000145b169ce 48c785900a000008000000           mov qword ptr [rbp + 0xa90], 8
0000000145b169d9 48c785300d000000000000           mov qword ptr [rbp + 0xd30], 0
0000000145b169e4 440f1185980a0000                 movups xmmword ptr [rbp + 0xa98], xmm8
0000000145b169ec 48c785a80a000004000000           mov qword ptr [rbp + 0xaa8], 4
0000000145b169f7 440f1185b00a0000                 movups xmmword ptr [rbp + 0xab0], xmm8
0000000145b169ff 48c785c00a000004000000           mov qword ptr [rbp + 0xac0], 4
0000000145b16a0a 440f1185c80a0000                 movups xmmword ptr [rbp + 0xac8], xmm8
0000000145b16a12 48c785d80a000008000000           mov qword ptr [rbp + 0xad8], 8
0000000145b16a1d 48c785e00a000000000000           mov qword ptr [rbp + 0xae0], 0
0000000145b16a28 440f1185580c0000                 movups xmmword ptr [rbp + 0xc58], xmm8
0000000145b16a30 440f1185480c0000                 movups xmmword ptr [rbp + 0xc48], xmm8
0000000145b16a38 48c785680c000001000000           mov qword ptr [rbp + 0xc68], 1
0000000145b16a43 8b85d40f0000                     mov eax, dword ptr [rbp + 0xfd4]
0000000145b16a49 8985380d0000                     mov dword ptr [rbp + 0xd38], eax
0000000145b16a4f 48c785700c000000000000           mov qword ptr [rbp + 0xc70], 0
0000000145b16a5a c7853c0d000000000000             mov dword ptr [rbp + 0xd3c], 0
0000000145b16a64 48c785e80a000000000000           mov qword ptr [rbp + 0xae8], 0
0000000145b16a6f 48c785f00a000008000000           mov qword ptr [rbp + 0xaf0], 8
0000000145b16a7a 440f1185f80a0000                 movups xmmword ptr [rbp + 0xaf8], xmm8
0000000145b16a82 48c785080b000008000000           mov qword ptr [rbp + 0xb08], 8
0000000145b16a8d c6855b0d000000                   mov byte ptr [rbp + 0xd5b], 0
0000000145b16a94 440f1185100b0000                 movups xmmword ptr [rbp + 0xb10], xmm8
0000000145b16a9c 48c785200b000008000000           mov qword ptr [rbp + 0xb20], 8
0000000145b16aa7 440f1185280b0000                 movups xmmword ptr [rbp + 0xb28], xmm8
0000000145b16aaf 48c785380b000004000000           mov qword ptr [rbp + 0xb38], 4
0000000145b16aba 440f1185400b0000                 movups xmmword ptr [rbp + 0xb40], xmm8
0000000145b16ac2 48c785500b000008000000           mov qword ptr [rbp + 0xb50], 8
0000000145b16acd 48c785400d000000000000           mov qword ptr [rbp + 0xd40], 0
0000000145b16ad8 440f1185580b0000                 movups xmmword ptr [rbp + 0xb58], xmm8
0000000145b16ae0 48c785680b000008000000           mov qword ptr [rbp + 0xb68], 8
0000000145b16aeb 440f1185700b0000                 movups xmmword ptr [rbp + 0xb70], xmm8
0000000145b16af3 48c785800b000008000000           mov qword ptr [rbp + 0xb80], 8
0000000145b16afe 48c785880b000000000000           mov qword ptr [rbp + 0xb88], 0
0000000145b16b09 c6855c0d000000                   mov byte ptr [rbp + 0xd5c], 0
0000000145b16b10 e8ebb64efa                       call 0x140002200
0000000145b16b15 b910000000                       mov ecx, 0x10
0000000145b16b1a ba08000000                       mov edx, 8
0000000145b16b1f e89cb64efa                       call 0x1400021c0
0000000145b16b24 4885c0                           test rax, rax
0000000145b16b27 0f848e050000                     je 0x145b170bb
0000000145b16b2d 488b95d0080000                   mov rdx, qword ptr [rbp + 0x8d0]
0000000145b16b34 488b8dd8080000                   mov rcx, qword ptr [rbp + 0x8d8]
0000000145b16b3b 4989c8                           mov r8, rcx
0000000145b16b3e 49c1e006                         shl r8, 6
0000000145b16b42 4885c9                           test rcx, rcx
0000000145b16b45 7424                             je 0x145b16b6b
0000000145b16b47 31c9                             xor ecx, ecx
0000000145b16b49 4531c9                           xor r9d, r9d
0000000145b16b4c 0f1f4000                         nop dword ptr [rax]
0000000145b16b50 42803c0a1d                       cmp byte ptr [rdx + r9], 0x1d
0000000145b16b55 0f8425050000                     je 0x145b17080
0000000145b16b5b 4983c140                         add r9, 0x40
0000000145b16b5f 4d39c8                           cmp r8, r9
0000000145b16b62 75ec                             jne 0x145b16b50
0000000145b16b64 4885c9                           test rcx, rcx
0000000145b16b67 7409                             je 0x145b16b72
0000000145b16b69 eb0f                             jmp 0x145b16b7a
0000000145b16b6b 31c9                             xor ecx, ecx
0000000145b16b6d 4885c9                           test rcx, rcx
0000000145b16b70 7508                             jne 0x145b16b7a
0000000145b16b72 498b4f40                         mov rcx, qword ptr [r15 + 0x40]
0000000145b16b76 4d8b4f48                         mov r9, qword ptr [r15 + 0x48]
0000000145b16b7a 488908                           mov qword ptr [rax], rcx
0000000145b16b7d 4c894808                         mov qword ptr [rax + 8], r9
0000000145b16b81 48c7854010000001000000           mov qword ptr [rbp + 0x1040], 1
0000000145b16b8c 48898548100000                   mov qword ptr [rbp + 0x1048], rax
0000000145b16b93 48c7855010000001000000           mov qword ptr [rbp + 0x1050], 1
0000000145b16b9e 4901d0                           add r8, rdx
0000000145b16ba1 c6858710000001                   mov byte ptr [rbp + 0x1087], 1
0000000145b16ba8 488d8de00f0000                   lea rcx, [rbp + 0xfe0]
0000000145b16baf e89cfe1700                       call 0x145c96a50
0000000145b16bb4 90                               nop 
0000000145b16bb5 488b85e00f0000                   mov rax, qword ptr [rbp + 0xfe0]
0000000145b16bbc 48898570100000                   mov qword ptr [rbp + 0x1070], rax
0000000145b16bc3 488b85e80f0000                   mov rax, qword ptr [rbp + 0xfe8]
0000000145b16bca 48898578100000                   mov qword ptr [rbp + 0x1078], rax
0000000145b16bd1 488b8df00f0000                   mov rcx, qword ptr [rbp + 0xff0]
0000000145b16bd8 4885c9                           test rcx, rcx
0000000145b16bdb 0f84c7000000                     je 0x145b16ca8
0000000145b16be1 4889c8                           mov rax, rcx
0000000145b16be4 48c1e004                         shl rax, 4
0000000145b16be8 4c8ba578100000                   mov r12, qword ptr [rbp + 0x1078]
0000000145b16bef 4c01e0                           add rax, r12
0000000145b16bf2 48898568100000                   mov qword ptr [rbp + 0x1068], rax
0000000145b16bf9 4c8bbd50100000                   mov r15, qword ptr [rbp + 0x1050]
0000000145b16c00 eb2e                             jmp 0x145b16c30
0000000145b16c02 66666666662e0f1f840000000000     nop word ptr cs:[rax + rax]
0000000145b16c10 4a891c2f                         mov qword ptr [rdi + r13], rbx
0000000145b16c14 4e89742f08                       mov qword ptr [rdi + r13 + 8], r14
0000000145b16c19 49ffc7                           inc r15
0000000145b16c1c 4c89bd50100000                   mov qword ptr [rbp + 0x1050], r15
0000000145b16c23 4983c410                         add r12, 0x10
0000000145b16c27 4c3ba568100000                   cmp r12, qword ptr [rbp + 0x1068]
0000000145b16c2e 7478                             je 0x145b16ca8
0000000145b16c30 498b1c24                         mov rbx, qword ptr [r12]
0000000145b16c34 4d8b742408                       mov r14, qword ptr [r12 + 8]
0000000145b16c39 488bbd48100000                   mov rdi, qword ptr [rbp + 0x1048]
0000000145b16c40 4d89fd                           mov r13, r15
0000000145b16c43 49c1e504                         shl r13, 4
0000000145b16c47 4d85ff                           test r15, r15
0000000145b16c4a 743a                             je 0x145b16c86
0000000145b16c4c 31f6                             xor esi, esi
0000000145b16c4e eb09                             jmp 0x145b16c59
0000000145b16c50 4883c610                         add rsi, 0x10
0000000145b16c54 4939f5                           cmp r13, rsi
0000000145b16c57 7427                             je 0x145b16c80
0000000145b16c59 4c39743708                       cmp qword ptr [rdi + rsi + 8], r14
0000000145b16c5e 75f0                             jne 0x145b16c50
0000000145b16c60 488b0c37                         mov rcx, qword ptr [rdi + rsi]
0000000145b16c64 4889da                           mov rdx, rbx
0000000145b16c67 4d89f0                           mov r8, r14
0000000145b16c6a e8e2e34e00                       call 0x146005051
0000000145b16c6f 85c0                             test eax, eax
0000000145b16c71 75dd                             jne 0x145b16c50
0000000145b16c73 ebae                             jmp 0x145b16c23
0000000145b16c75 66662e0f1f840000000000           nop word ptr cs:[rax + rax]
0000000145b16c80 4983ff05                         cmp r15, 5
0000000145b16c84 779d                             ja 0x145b16c23
0000000145b16c86 4c3bbd40100000                   cmp r15, qword ptr [rbp + 0x1040]
0000000145b16c8d 7581                             jne 0x145b16c10
0000000145b16c8f 488d8d40100000                   lea rcx, [rbp + 0x1040]
0000000145b16c96 e815f94e00                       call 0x1460065b0
0000000145b16c9b 90                               nop 
0000000145b16c9c 488bbd48100000                   mov rdi, qword ptr [rbp + 0x1048]
0000000145b16ca3 e968ffffff                       jmp 0x145b16c10
0000000145b16ca8 488b9570100000                   mov rdx, qword ptr [rbp + 0x1070]
0000000145b16caf 4885d2                           test rdx, rdx
0000000145b16cb2 7416                             je 0x145b16cca
0000000145b16cb4 48c1e204                         shl rdx, 4
0000000145b16cb8 41b808000000                     mov r8d, 8
0000000145b16cbe 488b8d78100000                   mov rcx, qword ptr [rbp + 0x1078]
0000000145b16cc5 e806b54efa                       call 0x1400021d0
0000000145b16cca 488b8540100000                   mov rax, qword ptr [rbp + 0x1040]
0000000145b16cd1 488b8d48100000                   mov rcx, qword ptr [rbp + 0x1048]
0000000145b16cd8 488b9550100000                   mov rdx, qword ptr [rbp + 0x1050]
0000000145b16cdf 48c1e204                         shl rdx, 4
0000000145b16ce3 4801ca                           add rdx, rcx
0000000145b16ce6 48898de00f0000                   mov qword ptr [rbp + 0xfe0], rcx
0000000145b16ced 48898de80f0000                   mov qword ptr [rbp + 0xfe8], rcx
0000000145b16cf4 488985f00f0000                   mov qword ptr [rbp + 0xff0], rax
0000000145b16cfb 488995f80f0000                   mov qword ptr [rbp + 0xff8], rdx
0000000145b16d02 488d7508                         lea rsi, [rbp + 8]
0000000145b16d06 4889b500100000                   mov qword ptr [rbp + 0x1000], rsi
0000000145b16d0d c6858710000000                   mov byte ptr [rbp + 0x1087], 0
0000000145b16d14 488d8d300f0000                   lea rcx, [rbp + 0xf30]
0000000145b16d1b 488d95e00f0000                   lea rdx, [rbp + 0xfe0]
0000000145b16d22 e8290e1900                       call 0x145ca7b50
0000000145b16d27 90                               nop 
0000000145b16d28 488dbd78030000                   lea rdi, [rbp + 0x378]
0000000145b16d2f 488b8578030000                   mov rax, qword ptr [rbp + 0x378]
0000000145b16d36 4885c0                           test rax, rax
0000000145b16d39 7416                             je 0x145b16d51
0000000145b16d3b 488b8d80030000                   mov rcx, qword ptr [rbp + 0x380]
0000000145b16d42 486bd058                         imul rdx, rax, 0x58
0000000145b16d46 41b808000000                     mov r8d, 8
0000000145b16d4c e87fb44efa                       call 0x1400021d0
0000000145b16d51 488b85400f0000                   mov rax, qword ptr [rbp + 0xf40]
0000000145b16d58 48894710                         mov qword ptr [rdi + 0x10], rax
0000000145b16d5c 0f1085300f0000                   movups xmm0, xmmword ptr [rbp + 0xf30]
0000000145b16d63 0f1107                           movups xmmword ptr [rdi], xmm0
0000000145b16d66 488bbdd8080000                   mov rdi, qword ptr [rbp + 0x8d8]
0000000145b16d6d 488d1cbd00000000                 lea rbx, [rdi*4]
0000000145b16d75 4885ff                           test rdi, rdi
0000000145b16d78 0f84cf020000                     je 0x145b1704d
0000000145b16d7e e87db44efa                       call 0x140002200
0000000145b16d83 ba04000000                       mov edx, 4
0000000145b16d88 4889d9                           mov rcx, rbx
0000000145b16d8b e860b44efa                       call 0x1400021f0
0000000145b16d90 4885c0                           test rax, rax
0000000145b16d93 0f84b3030000                     je 0x145b1714c
0000000145b16d99 4989c6                           mov r14, rax
0000000145b16d9c 488b5570                         mov rdx, qword ptr [rbp + 0x70]
0000000145b16da0 4885d2                           test rdx, rdx
0000000145b16da3 7413                             je 0x145b16db8
0000000145b16da5 488b4d78                         mov rcx, qword ptr [rbp + 0x78]
0000000145b16da9 48c1e202                         shl rdx, 2
0000000145b16dad 41b804000000                     mov r8d, 4
0000000145b16db3 e818b44efa                       call 0x1400021d0
0000000145b16db8 48897d70                         mov qword ptr [rbp + 0x70], rdi
0000000145b16dbc 4c897578                         mov qword ptr [rbp + 0x78], r14
0000000145b16dc0 4889bd80000000                   mov qword ptr [rbp + 0x80], rdi
0000000145b16dc7 4885ff                           test rdi, rdi
0000000145b16dca 0f8495020000                     je 0x145b17065
0000000145b16dd0 e82bb44efa                       call 0x140002200
0000000145b16dd5 ba04000000                       mov edx, 4
0000000145b16dda 4889d9                           mov rcx, rbx
0000000145b16ddd e80eb44efa                       call 0x1400021f0
0000000145b16de2 4885c0                           test rax, rax
0000000145b16de5 0f8478030000                     je 0x145b17163
0000000145b16deb 4989c6                           mov r14, rax
0000000145b16dee 488b9588000000                   mov rdx, qword ptr [rbp + 0x88]
0000000145b16df5 4885d2                           test rdx, rdx
0000000145b16df8 7416                             je 0x145b16e10
0000000145b16dfa 488b8d90000000                   mov rcx, qword ptr [rbp + 0x90]
0000000145b16e01 48c1e202                         shl rdx, 2
0000000145b16e05 41b804000000                     mov r8d, 4
0000000145b16e0b e8c0b34efa                       call 0x1400021d0
0000000145b16e10 4889bd88000000                   mov qword ptr [rbp + 0x88], rdi
0000000145b16e17 4c89b590000000                   mov qword ptr [rbp + 0x90], r14
0000000145b16e1e 4889bd98000000                   mov qword ptr [rbp + 0x98], rdi
0000000145b16e25 48c785e00f000000000000           mov qword ptr [rbp + 0xfe0], 0
0000000145b16e30 48c785e80f000004000000           mov qword ptr [rbp + 0xfe8], 4
0000000145b16e3b 48c785f00f000000000000           mov qword ptr [rbp + 0xff0], 0
0000000145b16e46 c6858710000000                   mov byte ptr [rbp + 0x1087], 0
0000000145b16e4d 488d8d300f0000                   lea rcx, [rbp + 0xf30]
0000000145b16e54 488d95e00f0000                   lea rdx, [rbp + 0xfe0]
0000000145b16e5b 4989f8                           mov r8, rdi
0000000145b16e5e e8ed7d1700                       call 0x145c8ec50
0000000145b16e63 90                               nop 
0000000145b16e64 488bbdb0000000                   mov rdi, qword ptr [rbp + 0xb0]
0000000145b16e6b 4885ff                           test rdi, rdi
0000000145b16e6e 7436                             je 0x145b16ea6
0000000145b16e70 488b9da8000000                   mov rbx, qword ptr [rbp + 0xa8]
0000000145b16e77 4883c308                         add rbx, 8
0000000145b16e7b eb0c                             jmp 0x145b16e89
0000000145b16e7d 0f1f00                           nop dword ptr [rax]
0000000145b16e80 4883c318                         add rbx, 0x18
0000000145b16e84 48ffcf                           dec rdi
0000000145b16e87 741d                             je 0x145b16ea6
0000000145b16e89 488b53f8                         mov rdx, qword ptr [rbx - 8]
0000000145b16e8d 4885d2                           test rdx, rdx
0000000145b16e90 74ee                             je 0x145b16e80
0000000145b16e92 488b0b                           mov rcx, qword ptr [rbx]
0000000145b16e95 48c1e202                         shl rdx, 2
0000000145b16e99 41b804000000                     mov r8d, 4
0000000145b16e9f e82cb34efa                       call 0x1400021d0
0000000145b16ea4 ebda                             jmp 0x145b16e80
0000000145b16ea6 488dbda0000000                   lea rdi, [rbp + 0xa0]
0000000145b16ead 488b85a0000000                   mov rax, qword ptr [rbp + 0xa0]
0000000145b16eb4 4885c0                           test rax, rax
0000000145b16eb7 741a                             je 0x145b16ed3
0000000145b16eb9 488b8da8000000                   mov rcx, qword ptr [rbp + 0xa8]
0000000145b16ec0 48c1e003                         shl rax, 3
0000000145b16ec4 488d1440                         lea rdx, [rax + rax*2]
0000000145b16ec8 41b808000000                     mov r8d, 8
0000000145b16ece e8fdb24efa                       call 0x1400021d0
0000000145b16ed3 488b85400f0000                   mov rax, qword ptr [rbp + 0xf40]
0000000145b16eda 48894710                         mov qword ptr [rdi + 0x10], rax
0000000145b16ede 0f1085300f0000                   movups xmm0, xmmword ptr [rbp + 0xf30]
0000000145b16ee5 0f1107                           movups xmmword ptr [rdi], xmm0
0000000145b16ee8 488b95d0080000                   mov rdx, qword ptr [rbp + 0x8d0]
0000000145b16eef 4c8b85d8080000                   mov r8, qword ptr [rbp + 0x8d8]
0000000145b16ef6 49c1e006                         shl r8, 6
0000000145b16efa 4901d0                           add r8, rdx
0000000145b16efd c6858710000000                   mov byte ptr [rbp + 0x1087], 0
0000000145b16f04 488d8de00f0000                   lea rcx, [rbp + 0xfe0]
0000000145b16f0b e8400d1800                       call 0x145c97c50
0000000145b16f10 90                               nop 
0000000145b16f11 488b85e00f0000                   mov rax, qword ptr [rbp + 0xfe0]
0000000145b16f18 488b8de80f0000                   mov rcx, qword ptr [rbp + 0xfe8]
0000000145b16f1f 488b95f00f0000                   mov rdx, qword ptr [rbp + 0xff0]
0000000145b16f26 488d1452                         lea rdx, [rdx + rdx*2]
0000000145b16f2a 488d14d1                         lea rdx, [rcx + rdx*8]
0000000145b16f2e 48898de00f0000                   mov qword ptr [rbp + 0xfe0], rcx
0000000145b16f35 48898de80f0000                   mov qword ptr [rbp + 0xfe8], rcx
0000000145b16f3c 488985f00f0000                   mov qword ptr [rbp + 0xff0], rax
0000000145b16f43 488995f80f0000                   mov qword ptr [rbp + 0xff8], rdx
0000000145b16f4a 4889b500100000                   mov qword ptr [rbp + 0x1000], rsi
0000000145b16f51 c6858710000000                   mov byte ptr [rbp + 0x1087], 0
0000000145b16f58 488d8d300f0000                   lea rcx, [rbp + 0xf30]
0000000145b16f5f 488d95e00f0000                   lea rdx, [rbp + 0xfe0]
0000000145b16f66 e8f5111900                       call 0x145ca8160
0000000145b16f6b 90                               nop 
0000000145b16f6c 488db5b8000000                   lea rsi, [rbp + 0xb8]
0000000145b16f73 488b85b8000000                   mov rax, qword ptr [rbp + 0xb8]
0000000145b16f7a 4885c0                           test rax, rax
0000000145b16f7d 741a                             je 0x145b16f99
0000000145b16f7f 488b8dc0000000                   mov rcx, qword ptr [rbp + 0xc0]
0000000145b16f86 48c1e005                         shl rax, 5
0000000145b16f8a 488d1440                         lea rdx, [rax + rax*2]
0000000145b16f8e 41b808000000                     mov r8d, 8
0000000145b16f94 e837b24efa                       call 0x1400021d0
0000000145b16f99 488b85400f0000                   mov rax, qword ptr [rbp + 0xf40]
0000000145b16fa0 48894610                         mov qword ptr [rsi + 0x10], rax
0000000145b16fa4 0f1085300f0000                   movups xmm0, xmmword ptr [rbp + 0xf30]
0000000145b16fab 0f1106                           movups xmmword ptr [rsi], xmm0
0000000145b16fae c6858710000000                   mov byte ptr [rbp + 0x1087], 0
0000000145b16fb5 488d4d08                         lea rcx, [rbp + 8]
0000000145b16fb9 e8223fffff                       call 0x145b0aee0
0000000145b16fbe 90                               nop 
0000000145b16fbf f30f1085d0040000                 movss xmm0, dword ptr [rbp + 0x4d0]
0000000145b16fc7 f30f118540050000                 movss dword ptr [rbp + 0x540], xmm0
0000000145b16fcf 488d5508                         lea rdx, [rbp + 8]
0000000145b16fd3 41b8600d0000                     mov r8d, 0xd60
0000000145b16fd9 488bb5280f0000                   mov rsi, qword ptr [rbp + 0xf28]
0000000145b16fe0 4889f1                           mov rcx, rsi
0000000145b16fe3 e863e04e00                       call 0x14600504b
0000000145b16fe8 4889f0                           mov rax, rsi
0000000145b16feb 0f28b590100000                   movaps xmm6, xmmword ptr [rbp + 0x1090]
0000000145b16ff2 0f28bda0100000                   movaps xmm7, xmmword ptr [rbp + 0x10a0]
0000000145b16ff9 440f2885b0100000                 movaps xmm8, xmmword ptr [rbp + 0x10b0]
0000000145b17001 440f288dc0100000                 movaps xmm9, xmmword ptr [rbp + 0x10c0]
0000000145b17009 440f2895d0100000                 movaps xmm10, xmmword ptr [rbp + 0x10d0]
0000000145b17011 440f289de0100000                 movaps xmm11, xmmword ptr [rbp + 0x10e0]
0000000145b17019 440f28a5f0100000                 movaps xmm12, xmmword ptr [rbp + 0x10f0]
0000000145b17021 440f28ad00110000                 movaps xmm13, xmmword ptr [rbp + 0x1100]
0000000145b17029 440f28b510110000                 movaps xmm14, xmmword ptr [rbp + 0x1110]
0000000145b17031 440f28bd20110000                 movaps xmm15, xmmword ptr [rbp + 0x1120]
0000000145b17039 4881c4b8110000                   add rsp, 0x11b8
0000000145b17040 5b                               pop rbx
0000000145b17041 5f                               pop rdi
0000000145b17042 5e                               pop rsi
0000000145b17043 415c                             pop r12
0000000145b17045 415d                             pop r13
0000000145b17047 415e                             pop r14
0000000145b17049 415f                             pop r15
0000000145b1704b 5d                               pop rbp
0000000145b1704c c3                               ret 
0000000145b1704d 41be04000000                     mov r14d, 4
0000000145b17053 488b5570                         mov rdx, qword ptr [rbp + 0x70]
0000000145b17057 4885d2                           test rdx, rdx
0000000145b1705a 0f8545fdffff                     jne 0x145b16da5
0000000145b17060 e953fdffff                       jmp 0x145b16db8
0000000145b17065 41be04000000                     mov r14d, 4
0000000145b1706b 488b9588000000                   mov rdx, qword ptr [rbp + 0x88]
0000000145b17072 4885d2                           test rdx, rdx
0000000145b17075 0f857ffdffff                     jne 0x145b16dfa
0000000145b1707b e990fdffff                       jmp 0x145b16e10
0000000145b17080 4a8b4c0a08                       mov rcx, qword ptr [rdx + r9 + 8]
0000000145b17085 4e8b4c0a10                       mov r9, qword ptr [rdx + r9 + 0x10]
0000000145b1708a 4885c9                           test rcx, rcx
0000000145b1708d 0f84dffaffff                     je 0x145b16b72
0000000145b17093 e9e2faffff                       jmp 0x145b16b7a
0000000145b17098 c6858610000001                   mov byte ptr [rbp + 0x1086], 1
0000000145b1709f c6858510000001                   mov byte ptr [rbp + 0x1085], 1
0000000145b170a6 b908000000                       mov ecx, 8
0000000145b170ab ba58000000                       mov edx, 0x58
0000000145b170b0 e88c6c6900                       call 0x1461add41
0000000145b170b5 90                               nop 
0000000145b170b6 e9bd000000                       jmp 0x145b17178
0000000145b170bb b908000000                       mov ecx, 8
0000000145b170c0 ba10000000                       mov edx, 0x10
0000000145b170c5 e8776c6900                       call 0x1461add41
0000000145b170ca 90                               nop 
0000000145b170cb e9a8000000                       jmp 0x145b17178
0000000145b170d0 488d85e00f0000                   lea rax, [rbp + 0xfe0]
0000000145b170d7 48894508                         mov qword ptr [rbp + 8], rax
0000000145b170db 488d05deaf4efa                   lea rax, [rip - 0x5b15022]
0000000145b170e2 48894510                         mov qword ptr [rbp + 0x10], rax
0000000145b170e6 c6858610000001                   mov byte ptr [rbp + 0x1086], 1
0000000145b170ed c6858510000001                   mov byte ptr [rbp + 0x1085], 1
0000000145b170f4 488d0d05494c01                   lea rcx, [rip + 0x14c4905]
0000000145b170fb 4c8d050e494c01                   lea r8, [rip + 0x14c490e]
0000000145b17102 488d5508                         lea rdx, [rbp + 8]
0000000145b17106 e8c5716900                       call 0x1461ae2d0
0000000145b1710b 90                               nop 
0000000145b1710c eb6a                             jmp 0x145b17178
0000000145b1710e 488d85e00f0000                   lea rax, [rbp + 0xfe0]
0000000145b17115 48894508                         mov qword ptr [rbp + 8], rax
0000000145b17119 488d05a0af4efa                   lea rax, [rip - 0x5b15060]
0000000145b17120 48894510                         mov qword ptr [rbp + 0x10], rax
0000000145b17124 c6858610000001                   mov byte ptr [rbp + 0x1086], 1
0000000145b1712b c6858510000001                   mov byte ptr [rbp + 0x1085], 1
0000000145b17132 488d0dc7484c01                   lea rcx, [rip + 0x14c48c7]
0000000145b17139 4c8d05d0484c01                   lea r8, [rip + 0x14c48d0]
0000000145b17140 488d5508                         lea rdx, [rbp + 8]
0000000145b17144 e887716900                       call 0x1461ae2d0
0000000145b17149 90                               nop 
0000000145b1714a eb2c                             jmp 0x145b17178
0000000145b1714c c6858710000000                   mov byte ptr [rbp + 0x1087], 0
0000000145b17153 b904000000                       mov ecx, 4
0000000145b17158 4889da                           mov rdx, rbx
0000000145b1715b e8fb6b6900                       call 0x1461add5b
0000000145b17160 90                               nop 
0000000145b17161 eb15                             jmp 0x145b17178
0000000145b17163 c6858710000000                   mov byte ptr [rbp + 0x1087], 0
0000000145b1716a b904000000                       mov ecx, 4
0000000145b1716f 4889da                           mov rdx, rbx
0000000145b17172 e8e46b6900                       call 0x1461add5b
0000000145b17177 90                               nop 
0000000145b17178 0f0b                             ud2 

; speed-packet
0000000145c6a940 55                               push rbp
0000000145c6a941 56                               push rsi
0000000145c6a942 57                               push rdi
0000000145c6a943 53                               push rbx
0000000145c6a944 4881ec98000000                   sub rsp, 0x98
0000000145c6a94b 488dac2480000000                 lea rbp, [rsp + 0x80]
0000000145c6a953 0f297500                         movaps xmmword ptr [rbp], xmm6
0000000145c6a957 48c745f8feffffff                 mov qword ptr [rbp - 8], 0xfffffffffffffffe
0000000145c6a95f 0f28f3                           movaps xmm6, xmm3
0000000145c6a962 4489c7                           mov edi, r8d
0000000145c6a965 4889d3                           mov rbx, rdx
0000000145c6a968 4889ce                           mov rsi, rcx
0000000145c6a96b e8907839fa                       call 0x140002200
0000000145c6a970 b920000000                       mov ecx, 0x20
0000000145c6a975 ba01000000                       mov edx, 1
0000000145c6a97a e8417839fa                       call 0x1400021c0
0000000145c6a97f 4885c0                           test rax, rax
0000000145c6a982 0f840b010000                     je 0x145c6aa93
0000000145c6a988 66c745e8e200                     mov word ptr [rbp - 0x18], 0xe2
0000000145c6a98e 48c745d020000000                 mov qword ptr [rbp - 0x30], 0x20
0000000145c6a996 488945d8                         mov qword ptr [rbp - 0x28], rax
0000000145c6a99a 48c745e000000000                 mov qword ptr [rbp - 0x20], 0
0000000145c6a9a2 488d55d0                         lea rdx, [rbp - 0x30]
0000000145c6a9a6 4889d9                           mov rcx, rbx
0000000145c6a9a9 e8c241e4ff                       call 0x145aaeb70
0000000145c6a9ae 90                               nop 
0000000145c6a9af 0f1045d0                         movups xmm0, xmmword ptr [rbp - 0x30]
0000000145c6a9b3 0f104de0                         movups xmm1, xmmword ptr [rbp - 0x20]
0000000145c6a9b7 0f294dc0                         movaps xmmword ptr [rbp - 0x40], xmm1
0000000145c6a9bb 0f2945b0                         movaps xmmword ptr [rbp - 0x50], xmm0
0000000145c6a9bf 488b55c0                         mov rdx, qword ptr [rbp - 0x40]
0000000145c6a9c3 488b45b0                         mov rax, qword ptr [rbp - 0x50]
0000000145c6a9c7 4829d0                           sub rax, rdx
0000000145c6a9ca 4883f803                         cmp rax, 3
0000000145c6a9ce 7673                             jbe 0x145c6aa43
0000000145c6a9d0 488b45b8                         mov rax, qword ptr [rbp - 0x48]
0000000145c6a9d4 893c10                           mov dword ptr [rax + rdx], edi
0000000145c6a9d7 4883c204                         add rdx, 4
0000000145c6a9db 488955c0                         mov qword ptr [rbp - 0x40], rdx
0000000145c6a9df 0f2845b0                         movaps xmm0, xmmword ptr [rbp - 0x50]
0000000145c6a9e3 0f2945d0                         movaps xmmword ptr [rbp - 0x30], xmm0
0000000145c6a9e7 488b45c0                         mov rax, qword ptr [rbp - 0x40]
0000000145c6a9eb 488945e0                         mov qword ptr [rbp - 0x20], rax
0000000145c6a9ef 488b45c8                         mov rax, qword ptr [rbp - 0x38]
0000000145c6a9f3 488945e8                         mov qword ptr [rbp - 0x18], rax
0000000145c6a9f7 488b55e0                         mov rdx, qword ptr [rbp - 0x20]
0000000145c6a9fb 488b45d0                         mov rax, qword ptr [rbp - 0x30]
0000000145c6a9ff 4829d0                           sub rax, rdx
0000000145c6aa02 4883f803                         cmp rax, 3
0000000145c6aa06 7663                             jbe 0x145c6aa6b
0000000145c6aa08 488b45d8                         mov rax, qword ptr [rbp - 0x28]
0000000145c6aa0c f30f113410                       movss dword ptr [rax + rdx], xmm6
0000000145c6aa11 4883c204                         add rdx, 4
0000000145c6aa15 488955e0                         mov qword ptr [rbp - 0x20], rdx
0000000145c6aa19 0f2845d0                         movaps xmm0, xmmword ptr [rbp - 0x30]
0000000145c6aa1d 0f1106                           movups xmmword ptr [rsi], xmm0
0000000145c6aa20 488b45e0                         mov rax, qword ptr [rbp - 0x20]
0000000145c6aa24 48894610                         mov qword ptr [rsi + 0x10], rax
0000000145c6aa28 488b45e8                         mov rax, qword ptr [rbp - 0x18]
0000000145c6aa2c 48894618                         mov qword ptr [rsi + 0x18], rax
0000000145c6aa30 4889f0                           mov rax, rsi
0000000145c6aa33 0f287500                         movaps xmm6, xmmword ptr [rbp]
0000000145c6aa37 4881c498000000                   add rsp, 0x98
0000000145c6aa3e 5b                               pop rbx
0000000145c6aa3f 5f                               pop rdi
0000000145c6aa40 5e                               pop rsi
0000000145c6aa41 5d                               pop rbp
0000000145c6aa42 c3                               ret 
0000000145c6aa43 48c744242001000000               mov qword ptr [rsp + 0x20], 1
0000000145c6aa4c 488d4db0                         lea rcx, [rbp - 0x50]
0000000145c6aa50 41b804000000                     mov r8d, 4
0000000145c6aa56 41b901000000                     mov r9d, 1
0000000145c6aa5c e88fb33900                       call 0x146005df0
0000000145c6aa61 90                               nop 
0000000145c6aa62 488b55c0                         mov rdx, qword ptr [rbp - 0x40]
0000000145c6aa66 e965ffffff                       jmp 0x145c6a9d0
0000000145c6aa6b 48c744242001000000               mov qword ptr [rsp + 0x20], 1
0000000145c6aa74 488d4dd0                         lea rcx, [rbp - 0x30]
0000000145c6aa78 41b804000000                     mov r8d, 4
0000000145c6aa7e 41b901000000                     mov r9d, 1
0000000145c6aa84 e867b33900                       call 0x146005df0
0000000145c6aa89 90                               nop 
0000000145c6aa8a 488b55e0                         mov rdx, qword ptr [rbp - 0x20]
0000000145c6aa8e e975ffffff                       jmp 0x145c6aa08
0000000145c6aa93 b901000000                       mov ecx, 1
0000000145c6aa98 ba20000000                       mov edx, 0x20
0000000145c6aa9d e8b9325400                       call 0x1461add5b
0000000145c6aaa2 0f0b                             ud2 

; unroot-packet
0000000145c67620 55                               push rbp
0000000145c67621 56                               push rsi
0000000145c67622 57                               push rdi
0000000145c67623 53                               push rbx
0000000145c67624 4883ec78                         sub rsp, 0x78
0000000145c67628 488d6c2470                       lea rbp, [rsp + 0x70]
0000000145c6762d 48c74500feffffff                 mov qword ptr [rbp], 0xfffffffffffffffe
0000000145c67635 4489c7                           mov edi, r8d
0000000145c67638 4889d3                           mov rbx, rdx
0000000145c6763b 4889ce                           mov rsi, rcx
0000000145c6763e e8bdab39fa                       call 0x140002200
0000000145c67643 b920000000                       mov ecx, 0x20
0000000145c67648 ba01000000                       mov edx, 1
0000000145c6764d e86eab39fa                       call 0x1400021c0
0000000145c67652 4885c0                           test rax, rax
0000000145c67655 0f849f000000                     je 0x145c676fa
0000000145c6765b 66c745d8ea00                     mov word ptr [rbp - 0x28], 0xea
0000000145c67661 48c745c020000000                 mov qword ptr [rbp - 0x40], 0x20
0000000145c67669 488945c8                         mov qword ptr [rbp - 0x38], rax
0000000145c6766d 48c745d000000000                 mov qword ptr [rbp - 0x30], 0
0000000145c67675 488d55c0                         lea rdx, [rbp - 0x40]
0000000145c67679 4889d9                           mov rcx, rbx
0000000145c6767c e8ef74e4ff                       call 0x145aaeb70
0000000145c67681 90                               nop 
0000000145c67682 0f1045c0                         movups xmm0, xmmword ptr [rbp - 0x40]
0000000145c67686 0f104dd0                         movups xmm1, xmmword ptr [rbp - 0x30]
0000000145c6768a 0f294df0                         movaps xmmword ptr [rbp - 0x10], xmm1
0000000145c6768e 0f2945e0                         movaps xmmword ptr [rbp - 0x20], xmm0
0000000145c67692 488b55f0                         mov rdx, qword ptr [rbp - 0x10]
0000000145c67696 488b45e0                         mov rax, qword ptr [rbp - 0x20]
0000000145c6769a 4829d0                           sub rax, rdx
0000000145c6769d 4883f803                         cmp rax, 3
0000000145c676a1 7632                             jbe 0x145c676d5
0000000145c676a3 488b45e8                         mov rax, qword ptr [rbp - 0x18]
0000000145c676a7 893c10                           mov dword ptr [rax + rdx], edi
0000000145c676aa 4883c204                         add rdx, 4
0000000145c676ae 488955f0                         mov qword ptr [rbp - 0x10], rdx
0000000145c676b2 0f2845e0                         movaps xmm0, xmmword ptr [rbp - 0x20]
0000000145c676b6 0f1106                           movups xmmword ptr [rsi], xmm0
0000000145c676b9 488b45f0                         mov rax, qword ptr [rbp - 0x10]
0000000145c676bd 48894610                         mov qword ptr [rsi + 0x10], rax
0000000145c676c1 488b45f8                         mov rax, qword ptr [rbp - 8]
0000000145c676c5 48894618                         mov qword ptr [rsi + 0x18], rax
0000000145c676c9 4889f0                           mov rax, rsi
0000000145c676cc 4883c478                         add rsp, 0x78
0000000145c676d0 5b                               pop rbx
0000000145c676d1 5f                               pop rdi
0000000145c676d2 5e                               pop rsi
0000000145c676d3 5d                               pop rbp
0000000145c676d4 c3                               ret 
0000000145c676d5 48c744242001000000               mov qword ptr [rsp + 0x20], 1
0000000145c676de 488d4de0                         lea rcx, [rbp - 0x20]
0000000145c676e2 41b804000000                     mov r8d, 4
0000000145c676e8 41b901000000                     mov r9d, 1
0000000145c676ee e8fde63900                       call 0x146005df0
0000000145c676f3 90                               nop 
0000000145c676f4 488b55f0                         mov rdx, qword ptr [rbp - 0x10]
0000000145c676f8 eba9                             jmp 0x145c676a3
0000000145c676fa b901000000                       mov ecx, 1
0000000145c676ff ba20000000                       mov edx, 0x20
0000000145c67704 e852665400                       call 0x1461add5b
0000000145c67709 0f0b                             ud2 
