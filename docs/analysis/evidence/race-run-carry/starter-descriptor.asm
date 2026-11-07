0000000145af6ba0  55                     push rbp
0000000145af6ba1  4157                   push r15
0000000145af6ba3  4156                   push r14
0000000145af6ba5  4155                   push r13
0000000145af6ba7  4154                   push r12
0000000145af6ba9  56                     push rsi
0000000145af6baa  57                     push rdi
0000000145af6bab  53                     push rbx
0000000145af6bac  4883ec68               sub rsp, 0x68
0000000145af6bb0  488d6c2460             lea rbp, [rsp + 0x60]
0000000145af6bb5  48c74500feffffff       mov qword ptr [rbp], 0xfffffffffffffffe
0000000145af6bbd  4189d4                 mov r12d, edx
0000000145af6bc0  4889ce                 mov rsi, rcx
0000000145af6bc3  81fa38080000           cmp edx, 0x838
0000000145af6bc9  7f39                   jg 0x145af6c04
0000000145af6bcb  4181fc72050000         cmp r12d, 0x572
0000000145af6bd2  0f8fd1000000           jg 0x145af6ca9
0000000145af6bd8  418d4424e7             lea eax, [r12 - 0x19]
0000000145af6bdd  3d81000000             cmp eax, 0x81
0000000145af6be2  0f87e0020000           ja 0x145af6ec8
0000000145af6be8  488d0da91b4c01         lea rcx, [rip + 0x14c1ba9]
0000000145af6bef  48630481               movsxd rax, dword ptr [rcx + rax*4]
0000000145af6bf3  4801c8                 add rax, rcx
0000000145af6bf6  ffe0                   jmp rax
0000000145af6bf8  4c8d2df1bd4b01         lea r13, [rip + 0x14bbdf1]
0000000145af6bff  e9c1030000             jmp 0x145af6fc5
0000000145af6c04  4181fc4c0e0000         cmp r12d, 0xe4c
0000000145af6c0b  7e2d                   jle 0x145af6c3a
0000000145af6c0d  418d842430e8ffff       lea eax, [r12 - 0x17d0]
0000000145af6c15  83f830                 cmp eax, 0x30
0000000145af6c18  0f87e0000000           ja 0x145af6cfe
0000000145af6c1e  488d0d7b1d4c01         lea rcx, [rip + 0x14c1d7b]
0000000145af6c25  48630481               movsxd rax, dword ptr [rcx + rax*4]
0000000145af6c29  4801c8                 add rax, rcx
0000000145af6c2c  ffe0                   jmp rax
0000000145af6c2e  4c8d2d23c44b01         lea r13, [rip + 0x14bc423]
0000000145af6c35  e98b030000             jmp 0x145af6fc5
0000000145af6c3a  4181fcc7090000         cmp r12d, 0x9c7
0000000145af6c41  7e33                   jle 0x145af6c76
0000000145af6c43  4181fc820b0000         cmp r12d, 0xb82
0000000145af6c4a  0f8f8c000000           jg 0x145af6cdc
0000000145af6c50  4181fcc8090000         cmp r12d, 0x9c8
0000000145af6c57  0f84c7000000           je 0x145af6d24
0000000145af6c5d  4181fccc090000         cmp r12d, 0x9cc
0000000145af6c64  0f855e020000           jne 0x145af6ec8
0000000145af6c6a  4c8d2d47c34b01         lea r13, [rip + 0x14bc347]
0000000145af6c71  e94f030000             jmp 0x145af6fc5
0000000145af6c76  4181fc39080000         cmp r12d, 0x839
0000000145af6c7d  0f84c5000000           je 0x145af6d48
0000000145af6c83  4181fc39090000         cmp r12d, 0x939
0000000145af6c8a  0f84ac000000           je 0x145af6d3c
0000000145af6c90  4181fc3a090000         cmp r12d, 0x93a
0000000145af6c97  0f852b020000           jne 0x145af6ec8
0000000145af6c9d  4c8d2dc4c24b01         lea r13, [rip + 0x14bc2c4]
0000000145af6ca4  e91c030000             jmp 0x145af6fc5
0000000145af6ca9  4181fc73050000         cmp r12d, 0x573
0000000145af6cb0  0f8406020000           je 0x145af6ebc
0000000145af6cb6  4181fc74050000         cmp r12d, 0x574
0000000145af6cbd  0f84ed010000           je 0x145af6eb0
0000000145af6cc3  4181fc2c080000         cmp r12d, 0x82c
0000000145af6cca  0f85f8010000           jne 0x145af6ec8
0000000145af6cd0  4c8d2d19c24b01         lea r13, [rip + 0x14bc219]
0000000145af6cd7  e9e9020000             jmp 0x145af6fc5
0000000145af6cdc  4181fc830b0000         cmp r12d, 0xb83
0000000145af6ce3  744b                   je 0x145af6d30
0000000145af6ce5  4181fc270c0000         cmp r12d, 0xc27
0000000145af6cec  0f85d6010000           jne 0x145af6ec8
0000000145af6cf2  4c8d2d0fc34b01         lea r13, [rip + 0x14bc30f]
0000000145af6cf9  e9c7020000             jmp 0x145af6fc5
0000000145af6cfe  4181fc4d0e0000         cmp r12d, 0xe4d
0000000145af6d05  0f84b3020000           je 0x145af6fbe
0000000145af6d0b  4181fcfa2f0000         cmp r12d, 0x2ffa
0000000145af6d12  0f85b0010000           jne 0x145af6ec8
0000000145af6d18  4c8d2df9c64b01         lea r13, [rip + 0x14bc6f9]
0000000145af6d1f  e9a1020000             jmp 0x145af6fc5
0000000145af6d24  4c8d2d65c24b01         lea r13, [rip + 0x14bc265]
0000000145af6d2b  e995020000             jmp 0x145af6fc5
0000000145af6d30  4c8d2da9c24b01         lea r13, [rip + 0x14bc2a9]
0000000145af6d37  e989020000             jmp 0x145af6fc5
0000000145af6d3c  4c8d2dfdc14b01         lea r13, [rip + 0x14bc1fd]
0000000145af6d43  e97d020000             jmp 0x145af6fc5
0000000145af6d48  4c8d2dc9c14b01         lea r13, [rip + 0x14bc1c9]
0000000145af6d4f  e971020000             jmp 0x145af6fc5
0000000145af6d54  4c8d2db5bf4b01         lea r13, [rip + 0x14bbfb5]
0000000145af6d5b  e965020000             jmp 0x145af6fc5
0000000145af6d60  4c8d2d71c04b01         lea r13, [rip + 0x14bc071]
0000000145af6d67  e959020000             jmp 0x145af6fc5
0000000145af6d6c  4c8d2dedbf4b01         lea r13, [rip + 0x14bbfed]
0000000145af6d73  e94d020000             jmp 0x145af6fc5
0000000145af6d78  4c8d2da9c04b01         lea r13, [rip + 0x14bc0a9]
0000000145af6d7f  e941020000             jmp 0x145af6fc5
0000000145af6d84  4c8d2de5be4b01         lea r13, [rip + 0x14bbee5]
0000000145af6d8b  e935020000             jmp 0x145af6fc5
0000000145af6d90  4c8d2d81bc4b01         lea r13, [rip + 0x14bbc81]
0000000145af6d97  e929020000             jmp 0x145af6fc5
0000000145af6d9c  4c8d2d15bd4b01         lea r13, [rip + 0x14bbd15]
0000000145af6da3  e91d020000             jmp 0x145af6fc5
0000000145af6da8  4c8d2de1bc4b01         lea r13, [rip + 0x14bbce1]
0000000145af6daf  e911020000             jmp 0x145af6fc5
0000000145af6db4  4c8d2d85bc4b01         lea r13, [rip + 0x14bbc85]
0000000145af6dbb  e905020000             jmp 0x145af6fc5
0000000145af6dc0  4c8d2df9be4b01         lea r13, [rip + 0x14bbef9]
0000000145af6dc7  e9f9010000             jmp 0x145af6fc5
0000000145af6dcc  4c8d2d95bc4b01         lea r13, [rip + 0x14bbc95]
0000000145af6dd3  e9ed010000             jmp 0x145af6fc5
0000000145af6dd8  4c8d2d79bd4b01         lea r13, [rip + 0x14bbd79]
0000000145af6ddf  e9e1010000             jmp 0x145af6fc5
0000000145af6de4  4c8d2d1dbd4b01         lea r13, [rip + 0x14bbd1d]
0000000145af6deb  e9d5010000             jmp 0x145af6fc5
0000000145af6df0  4c8d2dd9bd4b01         lea r13, [rip + 0x14bbdd9]
0000000145af6df7  e9c9010000             jmp 0x145af6fc5
0000000145af6dfc  4c8d2dddbc4b01         lea r13, [rip + 0x14bbcdd]
0000000145af6e03  e9bd010000             jmp 0x145af6fc5
0000000145af6e08  4c8d2d89be4b01         lea r13, [rip + 0x14bbe89]
0000000145af6e0f  e9b1010000             jmp 0x145af6fc5
0000000145af6e14  4c8d2dcdbe4b01         lea r13, [rip + 0x14bbecd]
0000000145af6e1b  e9a5010000             jmp 0x145af6fc5
0000000145af6e20  4c8d2d09bd4b01         lea r13, [rip + 0x14bbd09]
0000000145af6e27  e999010000             jmp 0x145af6fc5
0000000145af6e2c  4c8d2dc5bd4b01         lea r13, [rip + 0x14bbdc5]
0000000145af6e33  e98d010000             jmp 0x145af6fc5
0000000145af6e38  4c8d2de1bd4b01         lea r13, [rip + 0x14bbde1]
0000000145af6e3f  e981010000             jmp 0x145af6fc5
0000000145af6e44  4c8d2d35bd4b01         lea r13, [rip + 0x14bbd35]
0000000145af6e4b  e975010000             jmp 0x145af6fc5
0000000145af6e50  4c8d2d31bf4b01         lea r13, [rip + 0x14bbf31]
0000000145af6e57  e969010000             jmp 0x145af6fc5
0000000145af6e5c  4c8d2dedbf4b01         lea r13, [rip + 0x14bbfed]
0000000145af6e63  e95d010000             jmp 0x145af6fc5
0000000145af6e68  4c8d2d91bf4b01         lea r13, [rip + 0x14bbf91]
0000000145af6e6f  e951010000             jmp 0x145af6fc5
0000000145af6e74  4c8d2dfdbf4b01         lea r13, [rip + 0x14bbffd]
0000000145af6e7b  e945010000             jmp 0x145af6fc5
0000000145af6e80  4c8d2d21bd4b01         lea r13, [rip + 0x14bbd21]
0000000145af6e87  e939010000             jmp 0x145af6fc5
0000000145af6e8c  4c8d2d1dbf4b01         lea r13, [rip + 0x14bbf1d]
0000000145af6e93  e92d010000             jmp 0x145af6fc5
0000000145af6e98  4c8d2da9bd4b01         lea r13, [rip + 0x14bbda9]
0000000145af6e9f  e921010000             jmp 0x145af6fc5
0000000145af6ea4  4c8d2d8dbe4b01         lea r13, [rip + 0x14bbe8d]
0000000145af6eab  e915010000             jmp 0x145af6fc5
0000000145af6eb0  4c8d2d11c04b01         lea r13, [rip + 0x14bc011]
0000000145af6eb7  e909010000             jmp 0x145af6fc5
0000000145af6ebc  4c8d2dddbf4b01         lea r13, [rip + 0x14bbfdd]
0000000145af6ec3  e9fd000000             jmp 0x145af6fc5
0000000145af6ec8  48c706ffffffff         mov qword ptr [rsi], 0xffffffffffffffff
0000000145af6ecf  e91f020000             jmp 0x145af70f3
0000000145af6ed4  4c8d2dc5c44b01         lea r13, [rip + 0x14bc4c5]
0000000145af6edb  e9e5000000             jmp 0x145af6fc5
0000000145af6ee0  4c8d2d91c44b01         lea r13, [rip + 0x14bc491]
0000000145af6ee7  e9d9000000             jmp 0x145af6fc5
0000000145af6eec  4c8d2d0dc44b01         lea r13, [rip + 0x14bc40d]
0000000145af6ef3  e9cd000000             jmp 0x145af6fc5
0000000145af6ef8  4c8d2db1c34b01         lea r13, [rip + 0x14bc3b1]
0000000145af6eff  e9c1000000             jmp 0x145af6fc5
0000000145af6f04  4c8d2d3dc24b01         lea r13, [rip + 0x14bc23d]
0000000145af6f0b  e9b5000000             jmp 0x145af6fc5
0000000145af6f10  4c8d2d39c44b01         lea r13, [rip + 0x14bc439]
0000000145af6f17  e9a9000000             jmp 0x145af6fc5
0000000145af6f1c  4c8d2dd5c14b01         lea r13, [rip + 0x14bc1d5]
0000000145af6f23  e99d000000             jmp 0x145af6fc5
0000000145af6f28  4c8d2da9c34b01         lea r13, [rip + 0x14bc3a9]
0000000145af6f2f  e991000000             jmp 0x145af6fc5
0000000145af6f34  4c8d2d95c14b01         lea r13, [rip + 0x14bc195]
0000000145af6f3b  e985000000             jmp 0x145af6fc5
0000000145af6f40  4c8d2d51c24b01         lea r13, [rip + 0x14bc251]
0000000145af6f47  eb7c                   jmp 0x145af6fc5
0000000145af6f49  4c8d2d38c34b01         lea r13, [rip + 0x14bc338]
0000000145af6f50  eb73                   jmp 0x145af6fc5
0000000145af6f52  4c8d2d4fc14b01         lea r13, [rip + 0x14bc14f]
0000000145af6f59  eb6a                   jmp 0x145af6fc5
0000000145af6f5b  4c8d2d1ec14b01         lea r13, [rip + 0x14bc11e]
0000000145af6f62  eb61                   jmp 0x145af6fc5
0000000145af6f64  4c8d2d05c24b01         lea r13, [rip + 0x14bc205]
0000000145af6f6b  eb58                   jmp 0x145af6fc5
0000000145af6f6d  4c8d2decc24b01         lea r13, [rip + 0x14bc2ec]
0000000145af6f74  eb4f                   jmp 0x145af6fc5
0000000145af6f76  4c8d2d93c24b01         lea r13, [rip + 0x14bc293]
0000000145af6f7d  eb46                   jmp 0x145af6fc5
0000000145af6f7f  4c8d2d9ac14b01         lea r13, [rip + 0x14bc19a]
0000000145af6f86  eb3d                   jmp 0x145af6fc5
0000000145af6f88  4c8d2d31c24b01         lea r13, [rip + 0x14bc231]
0000000145af6f8f  eb34                   jmp 0x145af6fc5
0000000145af6f91  4c8d2d50c24b01         lea r13, [rip + 0x14bc250]
0000000145af6f98  eb2b                   jmp 0x145af6fc5
0000000145af6f9a  4c8d2d87c34b01         lea r13, [rip + 0x14bc387]
0000000145af6fa1  eb22                   jmp 0x145af6fc5
0000000145af6fa3  4c8d2d8ec24b01         lea r13, [rip + 0x14bc28e]
0000000145af6faa  eb19                   jmp 0x145af6fc5
0000000145af6fac  4c8d2d15c44b01         lea r13, [rip + 0x14bc415]
0000000145af6fb3  eb10                   jmp 0x145af6fc5
0000000145af6fb5  4c8d2d34c44b01         lea r13, [rip + 0x14bc434]
0000000145af6fbc  eb07                   jmp 0x145af6fc5
0000000145af6fbe  4c8d2d6bc04b01         lea r13, [rip + 0x14bc06b]
0000000145af6fc5  418b4518               mov eax, dword ptr [r13 + 0x18]
0000000145af6fc9  ffc8                   dec eax
0000000145af6fcb  40b711                 mov dil, 0x11
0000000145af6fce  83f817                 cmp eax, 0x17
0000000145af6fd1  730d                   jae 0x145af6fe0
0000000145af6fd3  89c0                   mov eax, eax
0000000145af6fd5  488d0df40e4c01         lea rcx, [rip + 0x14c0ef4]
0000000145af6fdc  0fb63c08               movzx edi, byte ptr [rax + rcx]
0000000145af6fe0  498d4510               lea rax, [r13 + 0x10]
0000000145af6fe4  488945c8               mov qword ptr [rbp - 0x38], rax
0000000145af6fe8  488d05c1124900         lea rax, [rip + 0x4912c1]
0000000145af6fef  488945d0               mov qword ptr [rbp - 0x30], rax
0000000145af6ff3  488d15a4d24b01         lea rdx, [rip + 0x14bd2a4]
0000000145af6ffa  488d4dd8               lea rcx, [rbp - 0x28]
0000000145af6ffe  4c8d45c8               lea r8, [rbp - 0x38]
0000000145af7002  e8f9f74700             call 0x145f76800
0000000145af7007  488b4de0               mov rcx, qword ptr [rbp - 0x20]
0000000145af700b  488b55e8               mov rdx, qword ptr [rbp - 0x18]
0000000145af700f  4d8b7500               mov r14, qword ptr [r13]
0000000145af7013  4d8b7d08               mov r15, qword ptr [r13 + 8]
0000000145af7017  48894df8               mov qword ptr [rbp - 8], rcx
0000000145af701b  e870e10500             call 0x145b55190
0000000145af7020  90                     nop
0000000145af7021  4889d3                 mov rbx, rdx
0000000145af7024  4885c0                 test rax, rax
0000000145af7027  4c0f45f0               cmovne r14, rax
0000000145af702b  490f44df               cmove rbx, r15
0000000145af702f  4885db                 test rbx, rbx
0000000145af7032  7911                   jns 0x145af7045
0000000145af7034  4531e4                 xor r12d, r12d
0000000145af7037  4c89e1                 mov rcx, r12
0000000145af703a  4889da                 mov rdx, rbx
0000000145af703d  e8293d6500             call 0x14614ad6b
0000000145af7042  90                     nop
0000000145af7043  0f0b                   ud2
0000000145af7045  7438                   je 0x145af707f
0000000145af7047  4c8965f0               mov qword ptr [rbp - 0x10], r12
0000000145af704b  e8b0b150fa             call 0x140002200
0000000145af7050  41bc01000000           mov r12d, 1
0000000145af7056  ba01000000             mov edx, 1
0000000145af705b  4889d9                 mov rcx, rbx
0000000145af705e  e85db150fa             call 0x1400021c0
0000000145af7063  4885c0                 test rax, rax
0000000145af7066  74cf                   je 0x145af7037
0000000145af7068  4989c7                 mov r15, rax
0000000145af706b  4889c1                 mov rcx, rax
0000000145af706e  4c89f2                 mov rdx, r14
0000000145af7071  4989d8                 mov r8, rbx
0000000145af7074  e832ca4a00             call 0x145fa3aab
0000000145af7079  4c8b65f0               mov r12, qword ptr [rbp - 0x10]
0000000145af707d  eb06                   jmp 0x145af7085
0000000145af707f  41bf01000000           mov r15d, 1
0000000145af7085  418b4524               mov eax, dword ptr [r13 + 0x24]
0000000145af7089  48891e                 mov qword ptr [rsi], rbx
0000000145af708c  4c897e08               mov qword ptr [rsi + 8], r15
0000000145af7090  48895e10               mov qword ptr [rsi + 0x10], rbx
0000000145af7094  48c7461800000000       mov qword ptr [rsi + 0x18], 0
0000000145af709c  48c7462004000000       mov qword ptr [rsi + 0x20], 4
0000000145af70a4  48c7464800000000       mov qword ptr [rsi + 0x48], 0
0000000145af70ac  0f57c0                 xorps xmm0, xmm0
0000000145af70af  0f114628               movups xmmword ptr [rsi + 0x28], xmm0
0000000145af70b3  48c7463800000000       mov qword ptr [rsi + 0x38], 0
0000000145af70bb  44896650               mov dword ptr [rsi + 0x50], r12d
0000000145af70bf  f3410f6f4514           movdqu xmm0, xmmword ptr [r13 + 0x14]
0000000145af70c5  660f70c078             pshufd xmm0, xmm0, 0x78
0000000145af70ca  f30f7f4654             movdqu xmmword ptr [rsi + 0x54], xmm0
0000000145af70cf  894664                 mov dword ptr [rsi + 0x64], eax
0000000145af70d2  40887e68               mov byte ptr [rsi + 0x68], dil
0000000145af70d6  c6466900               mov byte ptr [rsi + 0x69], 0
0000000145af70da  488b55d8               mov rdx, qword ptr [rbp - 0x28]
0000000145af70de  4885d2                 test rdx, rdx
0000000145af70e1  7410                   je 0x145af70f3
0000000145af70e3  41b801000000           mov r8d, 1
0000000145af70e9  488b4df8               mov rcx, qword ptr [rbp - 8]
0000000145af70ed  e8deb050fa             call 0x1400021d0
0000000145af70f2  90                     nop
0000000145af70f3  4883c468               add rsp, 0x68
0000000145af70f7  5b                     pop rbx
0000000145af70f8  5f                     pop rdi
0000000145af70f9  5e                     pop rsi
0000000145af70fa  415c                   pop r12
0000000145af70fc  415d                   pop r13
0000000145af70fe  415e                   pop r14
0000000145af7100  415f                   pop r15
0000000145af7102  5d                     pop rbp
0000000145af7103  c3                     ret
