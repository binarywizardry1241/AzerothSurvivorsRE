; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone 5.0.7; static observations, no target execution.
0000000145bf889e 49837c2460ff                   cmp qword ptr [r12 + 0x60], -1
0000000145bf88a4 0f8435090000                   je 0x145bf91df
0000000145bf88aa 4180bc242901000000             cmp byte ptr [r12 + 0x129], 0
0000000145bf88b3 0f8526090000                   jne 0x145bf91df
0000000145bf88b9 498bb42478010000               mov rsi, qword ptr [r12 + 0x178]
0000000145bf88c1 498b8c2418010000               mov rcx, qword ptr [r12 + 0x118]
0000000145bf88c9 498b842420010000               mov rax, qword ptr [r12 + 0x120]
0000000145bf88d1 488b4028                       mov rax, qword ptr [rax + 0x28]
0000000145bf88d5 c685c702000000                 mov byte ptr [rbp + 0x2c7], 0
0000000145bf88dc ffd0                           call rax
0000000145bf88de 90                             nop
0000000145bf88df 84c0                           test al, al
0000000145bf88e1 743f                           je 0x145bf8922
0000000145bf88e3 0fb6c0                         movzx eax, al
0000000145bf88e6 83f801                         cmp eax, 1
0000000145bf88e9 0f8592000000                   jne 0x145bf8981
0000000145bf88ef c685c702000000                 mov byte ptr [rbp + 0x2c7], 0
0000000145bf88f6 488b4d08                       mov rcx, qword ptr [rbp + 8]
0000000145bf88fa e861c23500                     call 0x145f54b60
0000000145bf88ff 90                             nop
0000000145bf8900 4885c0                         test rax, rax
0000000145bf8903 7844                           js 0x145bf8949
0000000145bf8905 0f57c0                         xorps xmm0, xmm0
0000000145bf8908 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145bf890d eb52                           jmp 0x145bf8961
0000000145bf890f 31ff                           xor edi, edi
0000000145bf8911 4889f9                         mov rcx, rdi
0000000145bf8914 4889f2                         mov rdx, rsi
0000000145bf8917 e88f975500                     call 0x1461520ab
0000000145bf891c 90                             nop
0000000145bf891d e9ee030000                     jmp 0x145bf8d10
0000000145bf8922 c685c702000000                 mov byte ptr [rbp + 0x2c7], 0
0000000145bf8929 488b4d60                       mov rcx, qword ptr [rbp + 0x60]
0000000145bf892d e82ec23500                     call 0x145f54b60
0000000145bf8932 90                             nop
0000000145bf8933 4885c0                         test rax, rax
0000000145bf8936 0f889c000000                   js 0x145bf89d8
0000000145bf893c 0f57c0                         xorps xmm0, xmm0
0000000145bf893f f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145bf8944 e9a7000000                     jmp 0x145bf89f0
0000000145bf8949 4889c1                         mov rcx, rax
0000000145bf894c 48d1e9                         shr rcx, 1
0000000145bf894f 83e001                         and eax, 1
0000000145bf8952 4809c8                         or rax, rcx
0000000145bf8955 0f57c0                         xorps xmm0, xmm0
0000000145bf8958 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145bf895d f30f58c0                       addss xmm0, xmm0
0000000145bf8961 0f57c9                         xorps xmm1, xmm1
0000000145bf8964 f30f2aca                       cvtsi2ss xmm1, edx
0000000145bf8968 f30f5e0d80136000               divss xmm1, dword ptr [rip + 0x601380]
0000000145bf8970 f30f58c8                       addss xmm1, xmm0
0000000145bf8974 0f2e0dfd215800                 ucomiss xmm1, dword ptr [rip + 0x5821fd]
0000000145bf897b 0f868f000000                   jbe 0x145bf8a10
0000000145bf8981 4180bc242801000000             cmp byte ptr [r12 + 0x128], 0
0000000145bf898a 7420                           je 0x145bf89ac
0000000145bf898c 418bbc2410010000               mov edi, dword ptr [r12 + 0x110]
0000000145bf8994 83ffff                         cmp edi, -1
0000000145bf8997 0f84c0000000                   je 0x145bf8a5d
0000000145bf899d 498b842408010000               mov rax, qword ptr [r12 + 0x108]
0000000145bf89a5 89fa                           mov edx, edi
0000000145bf89a7 e9ce000000                     jmp 0x145bf8a7a
0000000145bf89ac 41c684242901000001             mov byte ptr [r12 + 0x129], 1
0000000145bf89b5 498b8c2418010000               mov rcx, qword ptr [r12 + 0x118]
0000000145bf89bd 498b842420010000               mov rax, qword ptr [r12 + 0x120]
0000000145bf89c5 488b4030                       mov rax, qword ptr [rax + 0x30]
0000000145bf89c9 c685c702000000                 mov byte ptr [rbp + 0x2c7], 0
0000000145bf89d0 ffd0                           call rax
0000000145bf89d2 90                             nop
0000000145bf89d3 e907080000                     jmp 0x145bf91df
0000000145bf89d8 4889c1                         mov rcx, rax
0000000145bf89db 48d1e9                         shr rcx, 1
0000000145bf89de 83e001                         and eax, 1
0000000145bf89e1 4809c8                         or rax, rcx
0000000145bf89e4 0f57c0                         xorps xmm0, xmm0
0000000145bf89e7 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145bf89ec f30f58c0                       addss xmm0, xmm0
0000000145bf89f0 0f57c9                         xorps xmm1, xmm1
0000000145bf89f3 f30f2aca                       cvtsi2ss xmm1, edx
0000000145bf89f7 f30f5e0df1126000               divss xmm1, dword ptr [rip + 0x6012f1]
0000000145bf89ff f30f58c8                       addss xmm1, xmm0
0000000145bf8a03 0f2e0de61f5800                 ucomiss xmm1, dword ptr [rip + 0x581fe6]
0000000145bf8a0a 0f8771ffffff                   ja 0x145bf8981
0000000145bf8a10 498b8c2418010000               mov rcx, qword ptr [r12 + 0x118]
0000000145bf8a18 498b842420010000               mov rax, qword ptr [r12 + 0x120]
0000000145bf8a20 488b4028                       mov rax, qword ptr [rax + 0x28]
0000000145bf8a24 c685c702000000                 mov byte ptr [rbp + 0x2c7], 0
0000000145bf8a2b ffd0                           call rax
0000000145bf8a2d 90                             nop
0000000145bf8a2e 3c01                           cmp al, 1
0000000145bf8a30 0f85a9070000                   jne 0x145bf91df
0000000145bf8a36 c685c702000000                 mov byte ptr [rbp + 0x2c7], 0
0000000145bf8a3d 488b4d10                       mov rcx, qword ptr [rbp + 0x10]
0000000145bf8a41 e81ac13500                     call 0x145f54b60
0000000145bf8a46 90                             nop
0000000145bf8a47 4885c0                         test rax, rax
0000000145bf8a4a 0f88e1000000                   js 0x145bf8b31
0000000145bf8a50 0f57c0                         xorps xmm0, xmm0
0000000145bf8a53 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145bf8a58 e9ec000000                     jmp 0x145bf8b49
0000000145bf8a5d c685c702000000                 mov byte ptr [rbp + 0x2c7], 0
0000000145bf8a64 e8a7bf3500                     call 0x145f54a10
0000000145bf8a69 90                             nop
0000000145bf8a6a 4989842408010000               mov qword ptr [r12 + 0x108], rax
0000000145bf8a72 4189942410010000               mov dword ptr [r12 + 0x110], edx
0000000145bf8a7a 48894520                       mov qword ptr [rbp + 0x20], rax
0000000145bf8a7e 895528                         mov dword ptr [rbp + 0x28], edx
0000000145bf8a81 c685c702000000                 mov byte ptr [rbp + 0x2c7], 0
0000000145bf8a88 488d4d20                       lea rcx, [rbp + 0x20]
0000000145bf8a8c e8cfc03500                     call 0x145f54b60
0000000145bf8a91 90                             nop
0000000145bf8a92 4885c0                         test rax, rax
0000000145bf8a95 780a                           js 0x145bf8aa1
0000000145bf8a97 0f57c0                         xorps xmm0, xmm0
0000000145bf8a9a f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145bf8a9f eb18                           jmp 0x145bf8ab9
0000000145bf8aa1 4889c1                         mov rcx, rax
0000000145bf8aa4 48d1e9                         shr rcx, 1
0000000145bf8aa7 83e001                         and eax, 1
0000000145bf8aaa 4809c8                         or rax, rcx
0000000145bf8aad 0f57c0                         xorps xmm0, xmm0
0000000145bf8ab0 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145bf8ab5 f30f58c0                       addss xmm0, xmm0
0000000145bf8ab9 0f57c9                         xorps xmm1, xmm1
0000000145bf8abc f30f2aca                       cvtsi2ss xmm1, edx
0000000145bf8ac0 f30f5e0d28126000               divss xmm1, dword ptr [rip + 0x601228]
0000000145bf8ac8 f30f58c8                       addss xmm1, xmm0
0000000145bf8acc 0f2e0da1048400                 ucomiss xmm1, dword ptr [rip + 0x8404a1]
0000000145bf8ad3 762c                           jbe 0x145bf8b01
0000000145bf8ad5 41c684242901000001             mov byte ptr [r12 + 0x129], 1
0000000145bf8ade 498b8c2418010000               mov rcx, qword ptr [r12 + 0x118]
0000000145bf8ae6 498b842420010000               mov rax, qword ptr [r12 + 0x120]
0000000145bf8aee 488b4030                       mov rax, qword ptr [rax + 0x30]
0000000145bf8af2 c685c702000000                 mov byte ptr [rbp + 0x2c7], 0
0000000145bf8af9 ffd0                           call rax
0000000145bf8afb 90                             nop
0000000145bf8afc e9de060000                     jmp 0x145bf91df
0000000145bf8b01 83ffff                         cmp edi, -1
0000000145bf8b04 0f8400010000                   je 0x145bf8c0a
0000000145bf8b0a c685c702000000                 mov byte ptr [rbp + 0x2c7], 0
0000000145bf8b11 488b4d60                       mov rcx, qword ptr [rbp + 0x60]
0000000145bf8b15 e846c03500                     call 0x145f54b60
0000000145bf8b1a 90                             nop
0000000145bf8b1b 4885c0                         test rax, rax
0000000145bf8b1e 0f88aa000000                   js 0x145bf8bce
0000000145bf8b24 0f57c0                         xorps xmm0, xmm0
0000000145bf8b27 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145bf8b2c e9b5000000                     jmp 0x145bf8be6
0000000145bf8b31 4889c1                         mov rcx, rax
0000000145bf8b34 48d1e9                         shr rcx, 1
0000000145bf8b37 83e001                         and eax, 1
0000000145bf8b3a 4809c8                         or rax, rcx
0000000145bf8b3d 0f57c0                         xorps xmm0, xmm0
0000000145bf8b40 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145bf8b45 f30f58c0                       addss xmm0, xmm0
0000000145bf8b49 0f57c9                         xorps xmm1, xmm1
0000000145bf8b4c f30f2aca                       cvtsi2ss xmm1, edx
0000000145bf8b50 f30f5e0d98116000               divss xmm1, dword ptr [rip + 0x601198]
0000000145bf8b58 f30f58c8                       addss xmm1, xmm0
0000000145bf8b5c 0f2e0d8d015a00                 ucomiss xmm1, dword ptr [rip + 0x5a018d]
0000000145bf8b63 0f8276060000                   jb 0x145bf91df
0000000145bf8b69 c685c702000000                 mov byte ptr [rbp + 0x2c7], 0
0000000145bf8b70 e89bbe3500                     call 0x145f54a10
0000000145bf8b75 90                             nop
0000000145bf8b76 49898424f8000000               mov qword ptr [r12 + 0xf8], rax
0000000145bf8b7e 4189942400010000               mov dword ptr [r12 + 0x100], edx
0000000145bf8b86 498bb42418010000               mov rsi, qword ptr [r12 + 0x118]
0000000145bf8b8e 498bbc2420010000               mov rdi, qword ptr [r12 + 0x120]
0000000145bf8b96 c685c702000000                 mov byte ptr [rbp + 0x2c7], 0
0000000145bf8b9d 488d155c5fa001                 lea rdx, [rip + 0x1a05f5c]
0000000145bf8ba4 488d8d00010000                 lea rcx, [rbp + 0x100]
0000000145bf8bab e890222100                     call 0x145e0ae40
0000000145bf8bb0 90                             nop
0000000145bf8bb1 488b4718                       mov rax, qword ptr [rdi + 0x18]
0000000145bf8bb5 c685c702000000                 mov byte ptr [rbp + 0x2c7], 0
0000000145bf8bbc 488d9500010000                 lea rdx, [rbp + 0x100]
0000000145bf8bc3 4889f1                         mov rcx, rsi
0000000145bf8bc6 ffd0                           call rax
0000000145bf8bc8 90                             nop
0000000145bf8bc9 e911060000                     jmp 0x145bf91df
0000000145bf8bce 4889c1                         mov rcx, rax
0000000145bf8bd1 48d1e9                         shr rcx, 1
0000000145bf8bd4 83e001                         and eax, 1
0000000145bf8bd7 4809c8                         or rax, rcx
0000000145bf8bda 0f57c0                         xorps xmm0, xmm0
0000000145bf8bdd f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145bf8be2 f30f58c0                       addss xmm0, xmm0
0000000145bf8be6 0f57c9                         xorps xmm1, xmm1
0000000145bf8be9 f30f2aca                       cvtsi2ss xmm1, edx
0000000145bf8bed f30f5e0dfb106000               divss xmm1, dword ptr [rip + 0x6010fb]
0000000145bf8bf5 f30f58c8                       addss xmm1, xmm0
0000000145bf8bf9 f30f10051f035a00               movss xmm0, dword ptr [rip + 0x5a031f]
0000000145bf8c01 0f2ec1                         ucomiss xmm0, xmm1
0000000145bf8c04 0f87d5050000                   ja 0x145bf91df
0000000145bf8c0a 498b8c2418010000               mov rcx, qword ptr [r12 + 0x118]
0000000145bf8c12 498b842420010000               mov rax, qword ptr [r12 + 0x120]
0000000145bf8c1a 488b4030                       mov rax, qword ptr [rax + 0x30]
0000000145bf8c1e c685c702000000                 mov byte ptr [rbp + 0x2c7], 0
0000000145bf8c25 ffd0                           call rax
0000000145bf8c27 90                             nop
0000000145bf8c28 498b4c2468                     mov rcx, qword ptr [r12 + 0x68]
0000000145bf8c2d 498b542470                     mov rdx, qword ptr [r12 + 0x70]
0000000145bf8c32 c685c702000000                 mov byte ptr [rbp + 0x2c7], 0
0000000145bf8c39 ffd6                           call rsi
0000000145bf8c3b 488985f8010000                 mov qword ptr [rbp + 0x1f8], rax
0000000145bf8c42 48899590020000                 mov qword ptr [rbp + 0x290], rdx
0000000145bf8c49 498b842418010000               mov rax, qword ptr [r12 + 0x118]
0000000145bf8c51 488985a0020000                 mov qword ptr [rbp + 0x2a0], rax
0000000145bf8c58 498b842420010000               mov rax, qword ptr [r12 + 0x120]
0000000145bf8c60 48898580020000                 mov qword ptr [rbp + 0x280], rax
0000000145bf8c67 488b00                         mov rax, qword ptr [rax]
0000000145bf8c6a 4885c0                         test rax, rax
0000000145bf8c6d 740a                           je 0x145bf8c79
0000000145bf8c6f 488b8da0020000                 mov rcx, qword ptr [rbp + 0x2a0]
0000000145bf8c76 ffd0                           call rax
0000000145bf8c78 90                             nop
0000000145bf8c79 488b8da0020000                 mov rcx, qword ptr [rbp + 0x2a0]
0000000145bf8c80 488b8580020000                 mov rax, qword ptr [rbp + 0x280]
0000000145bf8c87 488b5008                       mov rdx, qword ptr [rax + 8]
0000000145bf8c8b 4885d2                         test rdx, rdx
0000000145bf8c8e 7409                           je 0x145bf8c99
0000000145bf8c90 4c8b4010                       mov r8, qword ptr [rax + 0x10]
0000000145bf8c94 e8379540fa                     call 0x1400021d0
0000000145bf8c99 488b9d88020000                 mov rbx, qword ptr [rbp + 0x288]
0000000145bf8ca0 488b85f8010000                 mov rax, qword ptr [rbp + 0x1f8]
0000000145bf8ca7 48898318010000                 mov qword ptr [rbx + 0x118], rax
0000000145bf8cae 488b8590020000                 mov rax, qword ptr [rbp + 0x290]
0000000145bf8cb5 48898320010000                 mov qword ptr [rbx + 0x120], rax
0000000145bf8cbc c685c702000000                 mov byte ptr [rbp + 0x2c7], 0
0000000145bf8cc3 488d8d00020000                 lea rcx, [rbp + 0x200]
0000000145bf8cca 488b5578                       mov rdx, qword ptr [rbp + 0x78]
0000000145bf8cce e86d533800                     call 0x145f7e040
0000000145bf8cd3 90                             nop
0000000145bf8cd4 4c8ba3c0000000                 mov r12, qword ptr [rbx + 0xc0]
0000000145bf8cdb 8bbbd0000000                   mov edi, dword ptr [rbx + 0xd0]
0000000145bf8ce1 488d9390000000                 lea rdx, [rbx + 0x90]
0000000145bf8ce8 488d8d00010000                 lea rcx, [rbp + 0x100]
0000000145bf8cef e84c533800                     call 0x145f7e040
0000000145bf8cf4 90                             nop
0000000145bf8cf5 488bb3b8000000                 mov rsi, qword ptr [rbx + 0xb8]
0000000145bf8cfc 4885f6                         test rsi, rsi
0000000145bf8cff 7911                           jns 0x145bf8d12
0000000145bf8d01 4531ff                         xor r15d, r15d
0000000145bf8d04 4c89f9                         mov rcx, r15
0000000145bf8d07 4889f2                         mov rdx, rsi
0000000145bf8d0a e89c935500                     call 0x1461520ab
0000000145bf8d0f 90                             nop
0000000145bf8d10 0f0b                           ud2
0000000145bf8d12 4c8babc8000000                 mov r13, qword ptr [rbx + 0xc8]
0000000145bf8d19 7437                           je 0x145bf8d52
0000000145bf8d1b 4c8bb3b0000000                 mov r14, qword ptr [rbx + 0xb0]
0000000145bf8d22 e8d99440fa                     call 0x140002200
0000000145bf8d27 41bf01000000                   mov r15d, 1
0000000145bf8d2d ba01000000                     mov edx, 1
0000000145bf8d32 4889f1                         mov rcx, rsi
0000000145bf8d35 e8869440fa                     call 0x1400021c0
0000000145bf8d3a 4885c0                         test rax, rax
0000000145bf8d3d 74c5                           je 0x145bf8d04
0000000145bf8d3f 4889c3                         mov rbx, rax
0000000145bf8d42 4889c1                         mov rcx, rax
0000000145bf8d45 4c89f2                         mov rdx, r14
0000000145bf8d48 4989f0                         mov r8, rsi
0000000145bf8d4b e8db203b00                     call 0x145faae2b
0000000145bf8d50 eb05                           jmp 0x145bf8d57
0000000145bf8d52 bb01000000                     mov ebx, 1
0000000145bf8d57 488b8510020000                 mov rax, qword ptr [rbp + 0x210]
0000000145bf8d5e 48898590000000                 mov qword ptr [rbp + 0x90], rax
0000000145bf8d65 f30f6f8500020000               movdqu xmm0, xmmword ptr [rbp + 0x200]
0000000145bf8d6d 660f7f8580000000               movdqa xmmword ptr [rbp + 0x80], xmm0
0000000145bf8d75 f30f6f8d00010000               movdqu xmm1, xmmword ptr [rbp + 0x100]
0000000145bf8d7d f30f7f8d98000000               movdqu xmmword ptr [rbp + 0x98], xmm1
0000000145bf8d85 488b8510010000                 mov rax, qword ptr [rbp + 0x110]
0000000145bf8d8c 488985a8000000                 mov qword ptr [rbp + 0xa8], rax
0000000145bf8d93 f30f7f8508010000               movdqu xmmword ptr [rbp + 0x108], xmm0
0000000145bf8d9b 488b8590000000                 mov rax, qword ptr [rbp + 0x90]
0000000145bf8da2 48898518010000                 mov qword ptr [rbp + 0x118], rax
0000000145bf8da9 488b8598000000                 mov rax, qword ptr [rbp + 0x98]
0000000145bf8db0 48898520010000                 mov qword ptr [rbp + 0x120], rax
0000000145bf8db7 488b85a0000000                 mov rax, qword ptr [rbp + 0xa0]
0000000145bf8dbe 48898528010000                 mov qword ptr [rbp + 0x128], rax
0000000145bf8dc5 488b85a8000000                 mov rax, qword ptr [rbp + 0xa8]
0000000145bf8dcc 48898530010000                 mov qword ptr [rbp + 0x130], rax
0000000145bf8dd3 4889b538010000                 mov qword ptr [rbp + 0x138], rsi
0000000145bf8dda 48899d40010000                 mov qword ptr [rbp + 0x140], rbx
0000000145bf8de1 4889b548010000                 mov qword ptr [rbp + 0x148], rsi
0000000145bf8de8 4c89a550010000                 mov qword ptr [rbp + 0x150], r12
0000000145bf8def 4c89ad58010000                 mov qword ptr [rbp + 0x158], r13
0000000145bf8df6 89bd60010000                   mov dword ptr [rbp + 0x160], edi
0000000145bf8dfc 48b80a00000000000080           movabs rax, 0x800000000000000a
0000000145bf8e06 48898500010000                 mov qword ptr [rbp + 0x100], rax
0000000145bf8e0d 488d8d80000000                 lea rcx, [rbp + 0x80]
0000000145bf8e14 488d9500010000                 lea rdx, [rbp + 0x100]
0000000145bf8e1b e820202100                     call 0x145e0ae40
0000000145bf8e20 90                             nop
0000000145bf8e21 488d9580000000                 lea rdx, [rbp + 0x80]
0000000145bf8e28 488b8df8010000                 mov rcx, qword ptr [rbp + 0x1f8]
0000000145bf8e2f 488b8590020000                 mov rax, qword ptr [rbp + 0x290]
0000000145bf8e36 ff5018                         call qword ptr [rax + 0x18]
0000000145bf8e39 90                             nop
0000000145bf8e3a 488d8d00010000                 lea rcx, [rbp + 0x100]
0000000145bf8e41 e8faabffff                     call 0x145bf3a40
0000000145bf8e46 488b9d88020000                 mov rbx, qword ptr [rbp + 0x288]
0000000145bf8e4d 488bb318010000                 mov rsi, qword ptr [rbx + 0x118]
0000000145bf8e54 488bbb20010000                 mov rdi, qword ptr [rbx + 0x120]
0000000145bf8e5b c685c702000000                 mov byte ptr [rbp + 0x2c7], 0
0000000145bf8e62 488d15975ca001                 lea rdx, [rip + 0x1a05c97]
0000000145bf8e69 488d8d00010000                 lea rcx, [rbp + 0x100]
0000000145bf8e70 e8cb1f2100                     call 0x145e0ae40
0000000145bf8e75 90                             nop
0000000145bf8e76 4c8dad08010000                 lea r13, [rbp + 0x108]
0000000145bf8e7d 488b4718                       mov rax, qword ptr [rdi + 0x18]
0000000145bf8e81 c685c702000000                 mov byte ptr [rbp + 0x2c7], 0
0000000145bf8e88 488d9500010000                 lea rdx, [rbp + 0x100]
0000000145bf8e8f 4889f1                         mov rcx, rsi
0000000145bf8e92 ffd0                           call rax
0000000145bf8e94 90                             nop
0000000145bf8e95 c685c702000000                 mov byte ptr [rbp + 0x2c7], 0
0000000145bf8e9c e86fbb3500                     call 0x145f54a10
0000000145bf8ea1 90                             nop
0000000145bf8ea2 4989c3                         mov r11, rax
0000000145bf8ea5 488983d8000000                 mov qword ptr [rbx + 0xd8], rax
0000000145bf8eac 8993e0000000                   mov dword ptr [rbx + 0xe0], edx
0000000145bf8eb2 488983e8000000                 mov qword ptr [rbx + 0xe8], rax
0000000145bf8eb9 8993f0000000                   mov dword ptr [rbx + 0xf0], edx
0000000145bf8ebf 488983f8000000                 mov qword ptr [rbx + 0xf8], rax
0000000145bf8ec6 899590020000                   mov dword ptr [rbp + 0x290], edx
0000000145bf8ecc 899300010000                   mov dword ptr [rbx + 0x100], edx
0000000145bf8ed2 c683e201000000                 mov byte ptr [rbx + 0x1e2], 0
0000000145bf8ed9 488b8380010000                 mov rax, qword ptr [rbx + 0x180]
0000000145bf8ee0 488b8b98010000                 mov rcx, qword ptr [rbx + 0x198]
0000000145bf8ee7 660f6f00                       movdqa xmm0, xmmword ptr [rax]
0000000145bf8eeb 488d5010                       lea rdx, [rax + 0x10]
0000000145bf8eef 66440fd7c0                     pmovmskb r8d, xmm0
0000000145bf8ef4 41f7d0                         not r8d
0000000145bf8ef7 eb2a                           jmp 0x145bf8f23
0000000145bf8ef9 0f1f8000000000                 nop dword ptr [rax]
0000000145bf8f00 458d48ff                       lea r9d, [r8 - 1]
0000000145bf8f04 f3450fbcd0                     tzcnt r10d, r8d
0000000145bf8f09 4521c1                         and r9d, r8d
0000000145bf8f0c 49f7da                         neg r10
0000000145bf8f0f 4f8d0452                       lea r8, [r10 + r10*2]
0000000145bf8f13 49c1e004                       shl r8, 4
0000000145bf8f17 42c64400f900                   mov byte ptr [rax + r8 - 7], 0
0000000145bf8f1d 48ffc9                         dec rcx
0000000145bf8f20 4589c8                         mov r8d, r9d
0000000145bf8f23 664585c0                       test r8w, r8w
0000000145bf8f27 75d7                           jne 0x145bf8f00
0000000145bf8f29 4885c9                         test rcx, rcx
0000000145bf8f2c 7420                           je 0x145bf8f4e
0000000145bf8f2e 6690                           nop
0000000145bf8f30 660f6f02                       movdqa xmm0, xmmword ptr [rdx]
0000000145bf8f34 480500fdffff                   add rax, -0x300
0000000145bf8f3a 4883c210                       add rdx, 0x10
0000000145bf8f3e 66440fd7c0                     pmovmskb r8d, xmm0
0000000145bf8f43 4181f0ffff0000                 xor r8d, 0xffff
0000000145bf8f4a 74e4                           je 0x145bf8f30
0000000145bf8f4c ebb2                           jmp 0x145bf8f00
0000000145bf8f4e 48c7850002000000000000         mov qword ptr [rbp + 0x200], 0
0000000145bf8f59 48c7850802000008000000         mov qword ptr [rbp + 0x208], 8
0000000145bf8f64 48c7851002000000000000         mov qword ptr [rbp + 0x210], 0
0000000145bf8f6f 488bbbc8010000                 mov rdi, qword ptr [rbx + 0x1c8]
0000000145bf8f76 4885ff                         test rdi, rdi
0000000145bf8f79 0f8423010000                   je 0x145bf90a2
0000000145bf8f7f 488b4568                       mov rax, qword ptr [rbp + 0x68]
0000000145bf8f83 4c8b20                         mov r12, qword ptr [rax]
0000000145bf8f86 66410f6f0424                   movdqa xmm0, xmmword ptr [r12]
0000000145bf8f8c 660fd7f0                       pmovmskb esi, xmm0
0000000145bf8f90 f7d6                           not esi
0000000145bf8f92 4d8d6c2410                     lea r13, [r12 + 0x10]
0000000145bf8f97 49b80100000000000080           movabs r8, 0x8000000000000001
0000000145bf8fa1 8b9590020000                   mov edx, dword ptr [rbp + 0x290]
0000000145bf8fa7 eb43                           jmp 0x145bf8fec
0000000145bf8fa9 0f1f8000000000                 nop dword ptr [rax]
0000000145bf8fb0 8d46ff                         lea eax, [rsi - 1]
0000000145bf8fb3 21f0                           and eax, esi
0000000145bf8fb5 48ffcf                         dec rdi
0000000145bf8fb8 4c8bbd08020000                 mov r15, qword ptr [rbp + 0x208]
0000000145bf8fbf 488d0c9b                       lea rcx, [rbx + rbx*4]
0000000145bf8fc3 45890ccf                       mov dword ptr [r15 + rcx*8], r9d
0000000145bf8fc7 4d8944cf08                     mov qword ptr [r15 + rcx*8 + 8], r8
0000000145bf8fcc 4d8974cf10                     mov qword ptr [r15 + rcx*8 + 0x10], r14
0000000145bf8fd1 41c644cf1800                   mov byte ptr [r15 + rcx*8 + 0x18], 0
0000000145bf8fd7 48ffc3                         inc rbx
0000000145bf8fda 48899d10020000                 mov qword ptr [rbp + 0x210], rbx
0000000145bf8fe1 89c6                           mov esi, eax
0000000145bf8fe3 4885ff                         test rdi, rdi
0000000145bf8fe6 0f84a6000000                   je 0x145bf9092
0000000145bf8fec 6685f6                         test si, si
0000000145bf8fef 752c                           jne 0x145bf901d
0000000145bf8ff1 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145bf9000 66410f6f4500                   movdqa xmm0, xmmword ptr [r13]
0000000145bf9006 4981c480f9ffff                 add r12, -0x680
0000000145bf900d 4983c510                       add r13, 0x10
0000000145bf9011 660fd7f0                       pmovmskb esi, xmm0
0000000145bf9015 81f6ffff0000                   xor esi, 0xffff
0000000145bf901b 74e3                           je 0x145bf9000
0000000145bf901d f30fbcc6                       tzcnt eax, esi
0000000145bf9021 48f7d8                         neg rax
0000000145bf9024 486bc068                       imul rax, rax, 0x68
0000000145bf9028 458b4c0498                     mov r9d, dword ptr [r12 + rax - 0x68]
0000000145bf902d 41c64404f801                   mov byte ptr [r12 + rax - 8], 1
0000000145bf9033 4d895c04c0                     mov qword ptr [r12 + rax - 0x40], r11
0000000145bf9038 41895404c8                     mov dword ptr [r12 + rax - 0x38], edx
0000000145bf903d 4d8b7404e8                     mov r14, qword ptr [r12 + rax - 0x18]
0000000145bf9042 488b9d10020000                 mov rbx, qword ptr [rbp + 0x210]
0000000145bf9049 483b9d00020000                 cmp rbx, qword ptr [rbp + 0x200]
0000000145bf9050 0f855affffff                   jne 0x145bf8fb0
0000000145bf9056 c6859e02000000                 mov byte ptr [rbp + 0x29e], 0
0000000145bf905d 488d8d00020000                 lea rcx, [rbp + 0x200]
0000000145bf9064 4d89df                         mov r15, r11
0000000145bf9067 44898da0020000                 mov dword ptr [rbp + 0x2a0], r9d
0000000145bf906e e87d253b00                     call 0x145fab5f0
0000000145bf9073 448b8da0020000                 mov r9d, dword ptr [rbp + 0x2a0]
0000000145bf907a 49b80100000000000080           movabs r8, 0x8000000000000001
0000000145bf9084 8b9590020000                   mov edx, dword ptr [rbp + 0x290]
0000000145bf908a 4d89fb                         mov r11, r15
0000000145bf908d e91effffff                     jmp 0x145bf8fb0
0000000145bf9092 488bbd00020000                 mov rdi, qword ptr [rbp + 0x200]
0000000145bf9099 4c8dad08010000                 lea r13, [rbp + 0x108]
0000000145bf90a0 eb0a                           jmp 0x145bf90ac
0000000145bf90a2 41bf08000000                   mov r15d, 8
0000000145bf90a8 31db                           xor ebx, ebx
0000000145bf90aa 31ff                           xor edi, edi
0000000145bf90ac 488d04dd00000000               lea rax, [rbx*8]
0000000145bf90b4 4c8d3480                       lea r14, [rax + rax*4]
0000000145bf90b8 4f8d2437                       lea r12, [r15 + r14]
0000000145bf90bc 4c89bd80000000                 mov qword ptr [rbp + 0x80], r15
0000000145bf90c3 4889bd90000000                 mov qword ptr [rbp + 0x90], rdi
0000000145bf90ca 4c89a598000000                 mov qword ptr [rbp + 0x98], r12
0000000145bf90d1 4885db                         test rbx, rbx
0000000145bf90d4 4c89fb                         mov rbx, r15
0000000145bf90d7 0f8488000000                   je 0x145bf9165
0000000145bf90dd 498d4728                       lea rax, [r15 + 0x28]
0000000145bf90e1 488db500010000                 lea rsi, [rbp + 0x100]
0000000145bf90e8 eb11                           jmp 0x145bf90fb
0000000145bf90ea 488b9da0020000                 mov rbx, qword ptr [rbp + 0x2a0]
0000000145bf90f1 488d4328                       lea rax, [rbx + 0x28]
0000000145bf90f5 4983c6d8                       add r14, -0x28
0000000145bf90f9 746a                           je 0x145bf9165
0000000145bf90fb 4889c3                         mov rbx, rax
0000000145bf90fe 488b40e0                       mov rax, qword ptr [rax - 0x20]
0000000145bf9102 4883f8ff                       cmp rax, -1
0000000145bf9106 745d                           je 0x145bf9165
0000000145bf9108 8b53d8                         mov edx, dword ptr [rbx - 0x28]
0000000145bf910b 48898500010000                 mov qword ptr [rbp + 0x100], rax
0000000145bf9112 48898590020000                 mov qword ptr [rbp + 0x290], rax
0000000145bf9119 488b43f8                       mov rax, qword ptr [rbx - 8]
0000000145bf911d 49894510                       mov qword ptr [r13 + 0x10], rax
0000000145bf9121 48899da0020000                 mov qword ptr [rbp + 0x2a0], rbx
0000000145bf9128 f30f6f43e8                     movdqu xmm0, xmmword ptr [rbx - 0x18]
0000000145bf912d f3410f7f4500                   movdqu xmmword ptr [r13], xmm0
0000000145bf9133 488b8d88020000                 mov rcx, qword ptr [rbp + 0x288]
0000000145bf913a 4989f0                         mov r8, rsi
0000000145bf913d e8dedbffff                     call 0x145bf6d20
0000000145bf9142 90                             nop
0000000145bf9143 488b9590020000                 mov rdx, qword ptr [rbp + 0x290]
0000000145bf914a 4885d2                         test rdx, rdx
0000000145bf914d 789b                           js 0x145bf90ea
0000000145bf914f 7499                           je 0x145bf90ea
0000000145bf9151 488b8d08010000                 mov rcx, qword ptr [rbp + 0x108]
0000000145bf9158 41b801000000                   mov r8d, 1
0000000145bf915e e86d9040fa                     call 0x1400021d0
0000000145bf9163 eb85                           jmp 0x145bf90ea
0000000145bf9165 4c89e0                         mov rax, r12
0000000145bf9168 4829d8                         sub rax, rbx
0000000145bf916b 48b9cdcccccccccccccc           movabs rcx, 0xcccccccccccccccd
0000000145bf9175 48f7e1                         mul rcx
0000000145bf9178 48899d88000000                 mov qword ptr [rbp + 0x88], rbx
0000000145bf917f 4939dc                         cmp r12, rbx
0000000145bf9182 4c8ba588020000                 mov r12, qword ptr [rbp + 0x288]
0000000145bf9189 4c8bb560020000                 mov r14, qword ptr [rbp + 0x260]
0000000145bf9190 7432                           je 0x145bf91c4
0000000145bf9192 4889d6                         mov rsi, rdx
0000000145bf9195 48c1ee05                       shr rsi, 5
0000000145bf9199 4883c310                       add rbx, 0x10
0000000145bf919d eb0a                           jmp 0x145bf91a9
0000000145bf919f 90                             nop
0000000145bf91a0 4883c328                       add rbx, 0x28
0000000145bf91a4 48ffce                         dec rsi
0000000145bf91a7 741b                           je 0x145bf91c4
0000000145bf91a9 488b53f8                       mov rdx, qword ptr [rbx - 8]
0000000145bf91ad 4885d2                         test rdx, rdx
0000000145bf91b0 78ee                           js 0x145bf91a0
0000000145bf91b2 74ec                           je 0x145bf91a0
0000000145bf91b4 488b0b                         mov rcx, qword ptr [rbx]
0000000145bf91b7 41b801000000                   mov r8d, 1
0000000145bf91bd e80e9040fa                     call 0x1400021d0
0000000145bf91c2 ebdc                           jmp 0x145bf91a0
0000000145bf91c4 4885ff                         test rdi, rdi
0000000145bf91c7 7416                           je 0x145bf91df
0000000145bf91c9 48c1e703                       shl rdi, 3
0000000145bf91cd 488d14bf                       lea rdx, [rdi + rdi*4]
0000000145bf91d1 41b808000000                   mov r8d, 8
0000000145bf91d7 4c89f9                         mov rcx, r15
0000000145bf91da e8f18f40fa                     call 0x1400021d0
