; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone 5.0.7; static observations, no target execution.
0000000145bfd820 55                             push rbp
0000000145bfd821 4157                           push r15
0000000145bfd823 4156                           push r14
0000000145bfd825 56                             push rsi
0000000145bfd826 57                             push rdi
0000000145bfd827 53                             push rbx
0000000145bfd828 4881eca8030000                 sub rsp, 0x3a8
0000000145bfd82f 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145bfd837 0f29bd10030000                 movaps xmmword ptr [rbp + 0x310], xmm7
0000000145bfd83e 0f29b500030000                 movaps xmmword ptr [rbp + 0x300], xmm6
0000000145bfd845 48c785f8020000feffffff         mov qword ptr [rbp + 0x2f8], 0xfffffffffffffffe
0000000145bfd850 4c89ce                         mov rsi, r9
0000000145bfd853 4c89c7                         mov rdi, r8
0000000145bfd856 488995e0020000                 mov qword ptr [rbp + 0x2e0], rdx
0000000145bfd85d 48898de8020000                 mov qword ptr [rbp + 0x2e8], rcx
0000000145bfd864 e8974940fa                     call 0x140002200
0000000145bfd869 b907000000                     mov ecx, 7
0000000145bfd86e ba01000000                     mov edx, 1
0000000145bfd873 e8484940fa                     call 0x1400021c0
0000000145bfd878 4885c0                         test rax, rax
0000000145bfd87b 0f84a6030000                   je 0x145bfdc27
0000000145bfd881 4989c7                         mov r15, rax
0000000145bfd884 c7400332302e32                 mov dword ptr [rax + 3], 0x322e3032
0000000145bfd88b c700302e3132                   mov dword ptr [rax], 0x32312e30
0000000145bfd891 4885f6                         test rsi, rsi
0000000145bfd894 791b                           jns 0x145bfd8b1
0000000145bfd896 4531f6                         xor r14d, r14d
0000000145bfd899 4c89bda8020000                 mov qword ptr [rbp + 0x2a8], r15
0000000145bfd8a0 4c89f1                         mov rcx, r14
0000000145bfd8a3 4889f2                         mov rdx, rsi
0000000145bfd8a6 e800485500                     call 0x1461520ab
0000000145bfd8ab 90                             nop
0000000145bfd8ac e98d030000                     jmp 0x145bfdc3e
0000000145bfd8b1 7430                           je 0x145bfd8e3
0000000145bfd8b3 e8484940fa                     call 0x140002200
0000000145bfd8b8 41be01000000                   mov r14d, 1
0000000145bfd8be ba01000000                     mov edx, 1
0000000145bfd8c3 4889f1                         mov rcx, rsi
0000000145bfd8c6 e8f54840fa                     call 0x1400021c0
0000000145bfd8cb 4885c0                         test rax, rax
0000000145bfd8ce 74c9                           je 0x145bfd899
0000000145bfd8d0 4889c3                         mov rbx, rax
0000000145bfd8d3 4889c1                         mov rcx, rax
0000000145bfd8d6 4889fa                         mov rdx, rdi
0000000145bfd8d9 4989f0                         mov r8, rsi
0000000145bfd8dc e84ad53a00                     call 0x145faae2b
0000000145bfd8e1 eb05                           jmp 0x145bfd8e8
0000000145bfd8e3 bb01000000                     mov ebx, 1
0000000145bfd8e8 c785d801000003000000           mov dword ptr [rbp + 0x1d8], 3
0000000145bfd8f2 48c785a801000007000000         mov qword ptr [rbp + 0x1a8], 7
0000000145bfd8fd 4c89bdb0010000                 mov qword ptr [rbp + 0x1b0], r15
0000000145bfd904 48c785b801000007000000         mov qword ptr [rbp + 0x1b8], 7
0000000145bfd90f 4889b5c0010000                 mov qword ptr [rbp + 0x1c0], rsi
0000000145bfd916 48899dc8010000                 mov qword ptr [rbp + 0x1c8], rbx
0000000145bfd91d 4889b5d0010000                 mov qword ptr [rbp + 0x1d0], rsi
0000000145bfd924 c685dc01000001                 mov byte ptr [rbp + 0x1dc], 1
0000000145bfd92b 48b80000000000000080           movabs rax, 0x8000000000000000
0000000145bfd935 488985a0010000                 mov qword ptr [rbp + 0x1a0], rax
0000000145bfd93c c685f702000001                 mov byte ptr [rbp + 0x2f7], 1
0000000145bfd943 488d4da0                       lea rcx, [rbp - 0x60]
0000000145bfd947 488d95a0010000                 lea rdx, [rbp + 0x1a0]
0000000145bfd94e e8edd42000                     call 0x145e0ae40
0000000145bfd953 90                             nop
0000000145bfd954 488b85e0020000                 mov rax, qword ptr [rbp + 0x2e0]
0000000145bfd95b 488b4018                       mov rax, qword ptr [rax + 0x18]
0000000145bfd95f c685f702000001                 mov byte ptr [rbp + 0x2f7], 1
0000000145bfd966 488d55a0                       lea rdx, [rbp - 0x60]
0000000145bfd96a 488b8de8020000                 mov rcx, qword ptr [rbp + 0x2e8]
0000000145bfd971 ffd0                           call rax
0000000145bfd973 90                             nop
0000000145bfd974 c685f702000001                 mov byte ptr [rbp + 0x2f7], 1
0000000145bfd97b e890703500                     call 0x145f54a10
0000000145bfd980 90                             nop
0000000145bfd981 4889c6                         mov rsi, rax
0000000145bfd984 89d7                           mov edi, edx
0000000145bfd986 48c7858802000000000000         mov qword ptr [rbp + 0x288], 0
0000000145bfd991 0f57c0                         xorps xmm0, xmm0
0000000145bfd994 0f118598020000                 movups xmmword ptr [rbp + 0x298], xmm0
0000000145bfd99b 48c7859002000008000000         mov qword ptr [rbp + 0x290], 8
0000000145bfd9a6 e855653500                     call 0x145f53f00
0000000145bfd9ab 90                             nop
0000000145bfd9ac 4889c3                         mov rbx, rax
0000000145bfd9af 80781001                       cmp byte ptr [rax + 0x10], 1
0000000145bfd9b3 0f8530020000                   jne 0x145bfdbe9
0000000145bfd9b9 488b03                         mov rax, qword ptr [rbx]
0000000145bfd9bc 488b5308                       mov rdx, qword ptr [rbx + 8]
0000000145bfd9c0 488d4801                       lea rcx, [rax + 1]
0000000145bfd9c4 48890b                         mov qword ptr [rbx], rcx
0000000145bfd9c7 0f1035b20ca001                 movups xmm6, xmmword ptr [rip + 0x1a00cb2]
0000000145bfd9ce 0f29b5c0020000                 movaps xmmword ptr [rbp + 0x2c0], xmm6
0000000145bfd9d5 0f103d940ca001                 movups xmm7, xmmword ptr [rip + 0x1a00c94]
0000000145bfd9dc 0f29bdb0020000                 movaps xmmword ptr [rbp + 0x2b0], xmm7
0000000145bfd9e3 488985d0020000                 mov qword ptr [rbp + 0x2d0], rax
0000000145bfd9ea 488995d8020000                 mov qword ptr [rbp + 0x2d8], rdx
0000000145bfd9f1 48c7856802000000000000         mov qword ptr [rbp + 0x268], 0
0000000145bfd9fc 0f57c0                         xorps xmm0, xmm0
0000000145bfd9ff 0f118578020000                 movups xmmword ptr [rbp + 0x278], xmm0
0000000145bfda06 48c7857002000008000000         mov qword ptr [rbp + 0x270], 8
0000000145bfda11 e8ea643500                     call 0x145f53f00
0000000145bfda16 90                             nop
0000000145bfda17 4889c3                         mov rbx, rax
0000000145bfda1a 80781001                       cmp byte ptr [rax + 0x10], 1
0000000145bfda1e 0f85db010000                   jne 0x145bfdbff
0000000145bfda24 488b03                         mov rax, qword ptr [rbx]
0000000145bfda27 488b5308                       mov rdx, qword ptr [rbx + 8]
0000000145bfda2b 488d4801                       lea rcx, [rax + 1]
0000000145bfda2f 48890b                         mov qword ptr [rbx], rcx
0000000145bfda32 0f108588020000                 movups xmm0, xmmword ptr [rbp + 0x288]
0000000145bfda39 0f108d98020000                 movups xmm1, xmmword ptr [rbp + 0x298]
0000000145bfda40 0f298d50020000                 movaps xmmword ptr [rbp + 0x250], xmm1
0000000145bfda47 0f298540020000                 movaps xmmword ptr [rbp + 0x240], xmm0
0000000145bfda4e 0f2885b0020000                 movaps xmm0, xmmword ptr [rbp + 0x2b0]
0000000145bfda55 0f288dc0020000                 movaps xmm1, xmmword ptr [rbp + 0x2c0]
0000000145bfda5c 0f2895d0020000                 movaps xmm2, xmmword ptr [rbp + 0x2d0]
0000000145bfda63 0f119558010000                 movups xmmword ptr [rbp + 0x158], xmm2
0000000145bfda6a 0f118d48010000                 movups xmmword ptr [rbp + 0x148], xmm1
0000000145bfda71 0f118538010000                 movups xmmword ptr [rbp + 0x138], xmm0
0000000145bfda78 0f57c0                         xorps xmm0, xmm0
0000000145bfda7b 0f1145e8                       movups xmmword ptr [rbp - 0x18], xmm0
0000000145bfda7f 0f108568020000                 movups xmm0, xmmword ptr [rbp + 0x268]
0000000145bfda86 0f108d78020000                 movups xmm1, xmmword ptr [rbp + 0x278]
0000000145bfda8d 0f1145f8                       movups xmmword ptr [rbp - 8], xmm0
0000000145bfda91 0f114d08                       movups xmmword ptr [rbp + 8], xmm1
0000000145bfda95 0f288540020000                 movaps xmm0, xmmword ptr [rbp + 0x240]
0000000145bfda9c 0f288d50020000                 movaps xmm1, xmmword ptr [rbp + 0x250]
0000000145bfdaa3 0f118dc6020000                 movups xmmword ptr [rbp + 0x2c6], xmm1
0000000145bfdaaa 0f1185b6020000                 movups xmmword ptr [rbp + 0x2b6], xmm0
0000000145bfdab1 48c745a001000000               mov qword ptr [rbp - 0x60], 1
0000000145bfdab9 48c745a801000000               mov qword ptr [rbp - 0x58], 1
0000000145bfdac1 66c745b00000                   mov word ptr [rbp - 0x50], 0
0000000145bfdac7 488b8dce020000                 mov rcx, qword ptr [rbp + 0x2ce]
0000000145bfdace 48894dd0                       mov qword ptr [rbp - 0x30], rcx
0000000145bfdad2 0f1085b0020000                 movups xmm0, xmmword ptr [rbp + 0x2b0]
0000000145bfdad9 0f108dc0020000                 movups xmm1, xmmword ptr [rbp + 0x2c0]
0000000145bfdae0 0f114dc2                       movups xmmword ptr [rbp - 0x3e], xmm1
0000000145bfdae4 0f1145b2                       movups xmmword ptr [rbp - 0x4e], xmm0
0000000145bfdae8 48c745d800000000               mov qword ptr [rbp - 0x28], 0
0000000145bfdaf0 48c745e004000000               mov qword ptr [rbp - 0x20], 4
0000000145bfdaf8 48c74518ffffffff               mov qword ptr [rbp + 0x18], 0xffffffffffffffff
0000000145bfdb00 4889b5e8000000                 mov qword ptr [rbp + 0xe8], rsi
0000000145bfdb07 89bdf0000000                   mov dword ptr [rbp + 0xf0], edi
0000000145bfdb0d 4889b5f8000000                 mov qword ptr [rbp + 0xf8], rsi
0000000145bfdb14 89bd00010000                   mov dword ptr [rbp + 0x100], edi
0000000145bfdb1a 48b90000000000003841           movabs rcx, 0x4138000000000000
0000000145bfdb24 48898d08010000                 mov qword ptr [rbp + 0x108], rcx
0000000145bfdb2b 4889b510010000                 mov qword ptr [rbp + 0x110], rsi
0000000145bfdb32 89bd18010000                   mov dword ptr [rbp + 0x118], edi
0000000145bfdb38 488b8de8020000                 mov rcx, qword ptr [rbp + 0x2e8]
0000000145bfdb3f 48898d20010000                 mov qword ptr [rbp + 0x120], rcx
0000000145bfdb46 488b8de0020000                 mov rcx, qword ptr [rbp + 0x2e0]
0000000145bfdb4d 48898d28010000                 mov qword ptr [rbp + 0x128], rcx
0000000145bfdb54 488d0d05cde9ff                 lea rcx, [rip - 0x1632fb]
0000000145bfdb5b 48898d30010000                 mov qword ptr [rbp + 0x130], rcx
0000000145bfdb62 0f11b578010000                 movups xmmword ptr [rbp + 0x178], xmm6
0000000145bfdb69 0f11bd68010000                 movups xmmword ptr [rbp + 0x168], xmm7
0000000145bfdb70 48898588010000                 mov qword ptr [rbp + 0x188], rax
0000000145bfdb77 48899590010000                 mov qword ptr [rbp + 0x190], rdx
0000000145bfdb7e 66c785980100000000             mov word ptr [rbp + 0x198], 0
0000000145bfdb87 c6859a01000000                 mov byte ptr [rbp + 0x19a], 0
0000000145bfdb8e e86d4640fa                     call 0x140002200
0000000145bfdb93 b900020000                     mov ecx, 0x200
0000000145bfdb98 ba08000000                     mov edx, 8
0000000145bfdb9d e81e4640fa                     call 0x1400021c0
0000000145bfdba2 4885c0                         test rax, rax
0000000145bfdba5 746e                           je 0x145bfdc15
0000000145bfdba7 488d55a0                       lea rdx, [rbp - 0x60]
0000000145bfdbab 41b800020000                   mov r8d, 0x200
0000000145bfdbb1 4889c1                         mov rcx, rax
0000000145bfdbb4 4889c6                         mov rsi, rax
0000000145bfdbb7 e86fd23a00                     call 0x145faae2b
0000000145bfdbbc 488d8da0010000                 lea rcx, [rbp + 0x1a0]
0000000145bfdbc3 e8785effff                     call 0x145bf3a40
0000000145bfdbc8 4889f0                         mov rax, rsi
0000000145bfdbcb 0f28b500030000                 movaps xmm6, xmmword ptr [rbp + 0x300]
0000000145bfdbd2 0f28bd10030000                 movaps xmm7, xmmword ptr [rbp + 0x310]
0000000145bfdbd9 4881c4a8030000                 add rsp, 0x3a8
0000000145bfdbe0 5b                             pop rbx
0000000145bfdbe1 5f                             pop rdi
0000000145bfdbe2 5e                             pop rsi
0000000145bfdbe3 415e                           pop r14
0000000145bfdbe5 415f                           pop r15
0000000145bfdbe7 5d                             pop rbp
0000000145bfdbe8 c3                             ret
0000000145bfdbe9 e852a33600                     call 0x145f67f40
0000000145bfdbee 90                             nop
0000000145bfdbef 488903                         mov qword ptr [rbx], rax
0000000145bfdbf2 48895308                       mov qword ptr [rbx + 8], rdx
0000000145bfdbf6 c6431001                       mov byte ptr [rbx + 0x10], 1
0000000145bfdbfa e9c1fdffff                     jmp 0x145bfd9c0
0000000145bfdbff e83ca33600                     call 0x145f67f40
0000000145bfdc04 90                             nop
0000000145bfdc05 488903                         mov qword ptr [rbx], rax
0000000145bfdc08 48895308                       mov qword ptr [rbx + 8], rdx
0000000145bfdc0c c6431001                       mov byte ptr [rbx + 0x10], 1
0000000145bfdc10 e916feffff                     jmp 0x145bfda2b
0000000145bfdc15 b908000000                     mov ecx, 8
0000000145bfdc1a ba00020000                     mov edx, 0x200
0000000145bfdc1f e86d445500                     call 0x146152091
0000000145bfdc24 90                             nop
0000000145bfdc25 eb17                           jmp 0x145bfdc3e
0000000145bfdc27 c685f602000001                 mov byte ptr [rbp + 0x2f6], 1
0000000145bfdc2e b901000000                     mov ecx, 1
0000000145bfdc33 ba07000000                     mov edx, 7
0000000145bfdc38 e86e445500                     call 0x1461520ab
0000000145bfdc3d 90                             nop
0000000145bfdc3e 0f0b                           ud2
