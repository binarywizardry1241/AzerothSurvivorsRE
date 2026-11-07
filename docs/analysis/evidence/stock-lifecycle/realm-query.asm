0x140624950: 55                       push rbp
0x140624951: 4157                     push r15
0x140624953: 4156                     push r14
0x140624955: 56                       push rsi
0x140624956: 57                       push rdi
0x140624957: 53                       push rbx
0x140624958: 4881ec98010000           sub rsp, 0x198
0x14062495f: 488dac2480000000         lea rbp, [rsp + 0x80]
0x140624967: 48c78510010000feffffff   mov qword ptr [rbp + 0x110], 0xfffffffffffffffe
0x140624972: 4889d6                   mov rsi, rdx
0x140624975: 4989c8                   mov r8, rcx
0x140624978: 0fb64131                 movzx eax, byte ptr [rcx + 0x31]
0x14062497c: 488d0d1ddd8705           lea rcx, [rip + 0x587dd1d]
0x140624983: 48630481                 movsxd rax, dword ptr [rcx + rax*4]
0x140624987: 4801c8                   add rax, rcx
0x14062498a: 4c898500010000           mov qword ptr [rbp + 0x100], r8
0x140624991: ffe0                     jmp rax
0x140624993: 410f104018               movups xmm0, xmmword ptr [r8 + 0x18]
0x140624998: 498b4818                 mov rcx, qword ptr [r8 + 0x18]
0x14062499c: 498b4028                 mov rax, qword ptr [r8 + 0x28]
0x1406249a0: 410f1100                 movups xmmword ptr [r8], xmm0
0x1406249a4: 49894010                 mov qword ptr [r8 + 0x10], rax
0x1406249a8: 49c7403805000000         mov qword ptr [r8 + 0x38], 5
0x1406249b0: 41c7404000000000         mov dword ptr [r8 + 0x40], 0
0x1406249b8: 49894848                 mov qword ptr [r8 + 0x48], rcx
0x1406249bc: 498d98b0010000           lea rbx, [r8 + 0x1b0]
0x1406249c3: 41c680b001000000         mov byte ptr [r8 + 0x1b0], 0
0x1406249cb: ba05000000               mov edx, 5
0x1406249d0: 31c0                     xor eax, eax
0x1406249d2: eb2b                     jmp 0x1406249ff
0x1406249d4: 498d98b0010000           lea rbx, [r8 + 0x1b0]
0x1406249db: 410fb680b0010000         movzx eax, byte ptr [r8 + 0x1b0]
0x1406249e3: 488d0dcadc8705           lea rcx, [rip + 0x587dcca]
0x1406249ea: 48630481                 movsxd rax, dword ptr [rcx + rax*4]
0x1406249ee: 4801c8                   add rax, rcx
0x1406249f1: ffe0                     jmp rax
0x1406249f3: 498b4848                 mov rcx, qword ptr [r8 + 0x48]
0x1406249f7: 498b5038                 mov rdx, qword ptr [r8 + 0x38]
0x1406249fb: 418b4040                 mov eax, dword ptr [r8 + 0x40]
0x1406249ff: 49894850                 mov qword ptr [r8 + 0x50], rcx
0x140624a03: 49895058                 mov qword ptr [r8 + 0x58], rdx
0x140624a07: 41894060                 mov dword ptr [r8 + 0x60], eax
0x140624a0b: 803900                   cmp byte ptr [rcx], 0
0x140624a0e: 7421                     je 0x140624a31
0x140624a10: 498d4058                 lea rax, [r8 + 0x58]
0x140624a14: 4883c108                 add rcx, 8
0x140624a18: 49894868                 mov qword ptr [r8 + 0x68], rcx
0x140624a1c: 49894070                 mov qword ptr [r8 + 0x70], rax
0x140624a20: 4d8db0a8010000           lea r14, [r8 + 0x1a8]
0x140624a27: 41c680a801000000         mov byte ptr [r8 + 0x1a8], 0
0x140624a2f: eb3c                     jmp 0x140624a6d
0x140624a31: 41c680b001000001         mov byte ptr [r8 + 0x1b0], 1
0x140624a39: 41c6403000               mov byte ptr [r8 + 0x30], 0
0x140624a3e: e960030000               jmp 0x140624da3
0x140624a43: 4d8db0a8010000           lea r14, [r8 + 0x1a8]
0x140624a4a: 410fb680a8010000         movzx eax, byte ptr [r8 + 0x1a8]
0x140624a52: 488d0d6bdc8705           lea rcx, [rip + 0x587dc6b]
0x140624a59: 48630481                 movsxd rax, dword ptr [rcx + rax*4]
0x140624a5d: 4801c8                   add rax, rcx
0x140624a60: ffe0                     jmp rax
0x140624a62: 498b4868                 mov rcx, qword ptr [r8 + 0x68]
0x140624a66: 498b4070                 mov rax, qword ptr [r8 + 0x70]
0x140624a6a: 488b10                   mov rdx, qword ptr [rax]
0x140624a6d: 448b4008                 mov r8d, dword ptr [rax + 8]
0x140624a71: 48899de8000000           mov qword ptr [rbp + 0xe8], rbx
0x140624a78: 4c89b5e0000000           mov qword ptr [rbp + 0xe0], r14
0x140624a7f: e85c3d3f05               call 0x145a187e0
0x140624a84: 90                       nop
0x140624a85: 4885c0                   test rax, rax
0x140624a88: 48899df8000000           mov qword ptr [rbp + 0xf8], rbx
0x140624a8f: 741c                     je 0x140624aad
0x140624a91: 48899de8000000           mov qword ptr [rbp + 0xe8], rbx
0x140624a98: 4c89b5e0000000           mov qword ptr [rbp + 0xe0], r14
0x140624a9f: 4889c1                   mov rcx, rax
0x140624aa2: e889566005               call 0x145c2a130
0x140624aa7: 90                       nop
0x140624aa8: e95a020000               jmp 0x140624d07
0x140624aad: 488b8500010000           mov rax, qword ptr [rbp + 0x100]
0x140624ab4: 488b4868                 mov rcx, qword ptr [rax + 0x68]
0x140624ab8: c7454100000000           mov dword ptr [rbp + 0x41], 0
0x140624abf: c6454010                 mov byte ptr [rbp + 0x40], 0x10
0x140624ac3: 48899de8000000           mov qword ptr [rbp + 0xe8], rbx
0x140624aca: 4c89b5e0000000           mov qword ptr [rbp + 0xe0], r14
0x140624ad1: 488d5540                 lea rdx, [rbp + 0x40]
0x140624ad5: 41b805000000             mov r8d, 5
0x140624adb: e8605cb300               call 0x14115a740
0x140624ae0: 90                       nop
0x140624ae1: 4889c7                   mov rdi, rax
0x140624ae4: 4885c0                   test rax, rax
0x140624ae7: 4c89b5f0000000           mov qword ptr [rbp + 0xf0], r14
0x140624aee: 746e                     je 0x140624b5e
0x140624af0: 48897d28                 mov qword ptr [rbp + 0x28], rdi
0x140624af4: c6850f01000001           mov byte ptr [rbp + 0x10f], 1
0x140624afb: 488d4d40                 lea rcx, [rbp + 0x40]
0x140624aff: e87c2c5805               call 0x145ba7780
0x140624b04: 90                       nop
0x140624b05: 0f104540                 movups xmm0, xmmword ptr [rbp + 0x40]
0x140624b09: 0f104d50                 movups xmm1, xmmword ptr [rbp + 0x50]
0x140624b0d: 0f105560                 movups xmm2, xmmword ptr [rbp + 0x60]
0x140624b11: 0f295510                 movaps xmmword ptr [rbp + 0x10], xmm2
0x140624b15: 0f294d00                 movaps xmmword ptr [rbp], xmm1
0x140624b19: 0f2945f0                 movaps xmmword ptr [rbp - 0x10], xmm0
0x140624b1d: 488d059f7f8605           lea rax, [rip + 0x5867f9f]
0x140624b24: 48894540                 mov qword ptr [rbp + 0x40], rax
0x140624b28: 48c7454815000000         mov qword ptr [rbp + 0x48], 0x15
0x140624b30: 48897d50                 mov qword ptr [rbp + 0x50], rdi
0x140624b34: c6850f01000000           mov byte ptr [rbp + 0x10f], 0
0x140624b3b: 488d4d40                 lea rcx, [rbp + 0x40]
0x140624b3f: 488d55f0                 lea rdx, [rbp - 0x10]
0x140624b43: e878456005               call 0x145c290c0
0x140624b48: 90                       nop
0x140624b49: e9b9010000               jmp 0x140624d07
0x140624b4e: 4c89b5f0000000           mov qword ptr [rbp + 0xf0], r14
0x140624b55: 48899df8000000           mov qword ptr [rbp + 0xf8], rbx
0x140624b5c: eb1a                     jmp 0x140624b78
0x140624b5e: 4c8b8500010000           mov r8, qword ptr [rbp + 0x100]
0x140624b65: 498b4068                 mov rax, qword ptr [r8 + 0x68]
0x140624b69: 498980c8000000           mov qword ptr [r8 + 0xc8], rax
0x140624b70: 41c680de00000000         mov byte ptr [r8 + 0xde], 0
0x140624b78: 498d5078                 lea rdx, [r8 + 0x78]
0x140624b7c: 488d4d40                 lea rcx, [rbp + 0x40]
0x140624b80: 48895538                 mov qword ptr [rbp + 0x38], rdx
0x140624b84: 4989f0                   mov r8, rsi
0x140624b87: e8c400ffff               call 0x140614c50
0x140624b8c: 90                       nop
0x140624b8d: 488b5d40                 mov rbx, qword ptr [rbp + 0x40]
0x140624b91: 4883fbfe                 cmp rbx, -2
0x140624b95: 751d                     jne 0x140624bb4
0x140624b97: 488b85f0000000           mov rax, qword ptr [rbp + 0xf0]
0x140624b9e: c60003                   mov byte ptr [rax], 3
0x140624ba1: 488b85f8000000           mov rax, qword ptr [rbp + 0xf8]
0x140624ba8: c60003                   mov byte ptr [rax], 3
0x140624bab: b002                     mov al, 2
0x140624bad: b103                     mov cl, 3
0x140624baf: e901040000               jmp 0x140624fb5
0x140624bb4: 488b7d48                 mov rdi, qword ptr [rbp + 0x48]
0x140624bb8: 4c8b7550                 mov r14, qword ptr [rbp + 0x50]
0x140624bbc: 488b4d38                 mov rcx, qword ptr [rbp + 0x38]
0x140624bc0: e84ba1fdff               call 0x1405fed10
0x140624bc5: 4883fbff                 cmp rbx, -1
0x140624bc9: 4c8bbd00010000           mov r15, qword ptr [rbp + 0x100]
0x140624bd0: 0f84e8000000             je 0x140624cbe
0x140624bd6: 41c687a801000001         mov byte ptr [r15 + 0x1a8], 1
0x140624bde: 48899dc8000000           mov qword ptr [rbp + 0xc8], rbx
0x140624be5: 4889bdd0000000           mov qword ptr [rbp + 0xd0], rdi
0x140624bec: 4c89b5d8000000           mov qword ptr [rbp + 0xd8], r14
0x140624bf3: 4c897550                 mov qword ptr [rbp + 0x50], r14
0x140624bf7: 488b85c8000000           mov rax, qword ptr [rbp + 0xc8]
0x140624bfe: 48894540                 mov qword ptr [rbp + 0x40], rax
0x140624c02: 488b85d0000000           mov rax, qword ptr [rbp + 0xd0]
0x140624c09: 48894548                 mov qword ptr [rbp + 0x48], rax
0x140624c0d: 498b7f50                 mov rdi, qword ptr [r15 + 0x50]
0x140624c11: 488b5f28                 mov rbx, qword ptr [rdi + 0x28]
0x140624c15: 4885db                   test rbx, rbx
0x140624c18: 7450                     je 0x140624c6a
0x140624c1a: 4c8b7720                 mov r14, qword ptr [rdi + 0x20]
0x140624c1e: 4983c620                 add r14, 0x20
0x140624c22: eb15                     jmp 0x140624c39
0x140624c24: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x140624c30: 4983c640                 add r14, 0x40
0x140624c34: 48ffcb                   dec rbx
0x140624c37: 7431                     je 0x140624c6a
0x140624c39: 498b56e0                 mov rdx, qword ptr [r14 - 0x20]
0x140624c3d: 4885d2                   test rdx, rdx
0x140624c40: 740f                     je 0x140624c51
0x140624c42: 498b4ee8                 mov rcx, qword ptr [r14 - 0x18]
0x140624c46: 41b801000000             mov r8d, 1
0x140624c4c: e87fd59dff               call 0x1400021d0
0x140624c51: 498b56f8                 mov rdx, qword ptr [r14 - 8]
0x140624c55: 4885d2                   test rdx, rdx
0x140624c58: 74d6                     je 0x140624c30
0x140624c5a: 498b0e                   mov rcx, qword ptr [r14]
0x140624c5d: 41b801000000             mov r8d, 1
0x140624c63: e868d59dff               call 0x1400021d0
0x140624c68: ebc6                     jmp 0x140624c30
0x140624c6a: 488b5718                 mov rdx, qword ptr [rdi + 0x18]
0x140624c6e: 4885d2                   test rdx, rdx
0x140624c71: 7413                     je 0x140624c86
0x140624c73: 488b4f20                 mov rcx, qword ptr [rdi + 0x20]
0x140624c77: 48c1e206                 shl rdx, 6
0x140624c7b: 41b808000000             mov r8d, 8
0x140624c81: e84ad59dff               call 0x1400021d0
0x140624c86: 488d8dd0000000           lea rcx, [rbp + 0xd0]
0x140624c8d: 498b4750                 mov rax, qword ptr [r15 + 0x50]
0x140624c91: 488b5550                 mov rdx, qword ptr [rbp + 0x50]
0x140624c95: 48895028                 mov qword ptr [rax + 0x28], rdx
0x140624c99: 0f284540                 movaps xmm0, xmmword ptr [rbp + 0x40]
0x140624c9d: 0f114018                 movups xmmword ptr [rax + 0x18], xmm0
0x140624ca1: 40b701                   mov dil, 1
0x140624ca4: 488b85f8000000           mov rax, qword ptr [rbp + 0xf8]
0x140624cab: 4883bdc8000000ff         cmp qword ptr [rbp + 0xc8], -1
0x140624cb3: 0f85ce000000             jne 0x140624d87
0x140624cb9: e9bc000000               jmp 0x140624d7a
0x140624cbe: 488d05537e8605           lea rax, [rip + 0x5867e53]
0x140624cc5: 488945f0                 mov qword ptr [rbp - 0x10], rax
0x140624cc9: 48c745f812000000         mov qword ptr [rbp - 8], 0x12
0x140624cd1: 48897d00                 mov qword ptr [rbp], rdi
0x140624cd5: 48c74540ffffffff         mov qword ptr [rbp + 0x40], 0xffffffffffffffff
0x140624cdd: 488b85f8000000           mov rax, qword ptr [rbp + 0xf8]
0x140624ce4: 488985e8000000           mov qword ptr [rbp + 0xe8], rax
0x140624ceb: 488b85f0000000           mov rax, qword ptr [rbp + 0xf0]
0x140624cf2: 488985e0000000           mov qword ptr [rbp + 0xe0], rax
0x140624cf9: 488d4df0                 lea rcx, [rbp - 0x10]
0x140624cfd: 488d5540                 lea rdx, [rbp + 0x40]
0x140624d01: e8ea416005               call 0x145c28ef0
0x140624d06: 90                       nop
0x140624d07: 488b8d00010000           mov rcx, qword ptr [rbp + 0x100]
0x140624d0e: c681a801000001           mov byte ptr [rcx + 0x1a8], 1
0x140624d15: 48c785c8000000ffffffff   mov qword ptr [rbp + 0xc8], 0xffffffffffffffff
0x140624d20: 488985d0000000           mov qword ptr [rbp + 0xd0], rax
0x140624d27: 488b4950                 mov rcx, qword ptr [rcx + 0x50]
0x140624d2b: 48833900                 cmp qword ptr [rcx], 0
0x140624d2f: 741d                     je 0x140624d4e
0x140624d31: 4883790800               cmp qword ptr [rcx + 8], 0
0x140624d36: 740c                     je 0x140624d44
0x140624d38: 4883c108                 add rcx, 8
0x140624d3c: e85ffafdff               call 0x1406047a0
0x140624d41: 90                       nop
0x140624d42: eb0a                     jmp 0x140624d4e
0x140624d44: 488b4910                 mov rcx, qword ptr [rcx + 0x10]
0x140624d48: ff1582607705             call qword ptr [rip + 0x5776082]
0x140624d4e: 488d8dd0000000           lea rcx, [rbp + 0xd0]
0x140624d55: 488b8500010000           mov rax, qword ptr [rbp + 0x100]
0x140624d5c: 488b4050                 mov rax, qword ptr [rax + 0x50]
0x140624d60: 48c70000000000           mov qword ptr [rax], 0
0x140624d67: 31ff                     xor edi, edi
0x140624d69: 488b85f8000000           mov rax, qword ptr [rbp + 0xf8]
0x140624d70: 4883bdc8000000ff         cmp qword ptr [rbp + 0xc8], -1
0x140624d78: 750d                     jne 0x140624d87
0x140624d7a: 488985c0000000           mov qword ptr [rbp + 0xc0], rax
0x140624d81: e8ea825705               call 0x145b9d070
0x140624d86: 90                       nop
0x140624d87: 4c8b8500010000           mov r8, qword ptr [rbp + 0x100]
0x140624d8e: 41c680b001000001         mov byte ptr [r8 + 0x1b0], 1
0x140624d96: 41887830                 mov byte ptr [r8 + 0x30], dil
0x140624d9a: 4084ff                   test dil, dil
0x140624d9d: 0f85f8010000             jne 0x140624f9b
0x140624da3: 498b4008                 mov rax, qword ptr [r8 + 8]
0x140624da7: 0f104008                 movups xmm0, xmmword ptr [rax + 8]
0x140624dab: 0f104820                 movups xmm1, xmmword ptr [rax + 0x20]
0x140624daf: 0f105038                 movups xmm2, xmmword ptr [rax + 0x38]
0x140624db3: 8b4050                   mov eax, dword ptr [rax + 0x50]
0x140624db6: 410f119028010000         movups xmmword ptr [r8 + 0x128], xmm2
0x140624dbe: 410f118038010000         movups xmmword ptr [r8 + 0x138], xmm0
0x140624dc6: 410f118848010000         movups xmmword ptr [r8 + 0x148], xmm1
0x140624dce: 41898008020000           mov dword ptr [r8 + 0x208], eax
0x140624dd5: 41c6808702000000         mov byte ptr [r8 + 0x287], 0
0x140624ddd: 498d5038                 lea rdx, [r8 + 0x38]
0x140624de1: 488d4d40                 lea rcx, [rbp + 0x40]
0x140624de5: 488995f8000000           mov qword ptr [rbp + 0xf8], rdx
0x140624dec: 4989f0                   mov r8, rsi
0x140624def: e8ac19ffff               call 0x1406167a0
0x140624df4: 90                       nop
0x140624df5: 488b7540                 mov rsi, qword ptr [rbp + 0x40]
0x140624df9: 4883feff                 cmp rsi, -1
0x140624dfd: 0f8425010000             je 0x140624f28
0x140624e03: 488b7d48                 mov rdi, qword ptr [rbp + 0x48]
0x140624e07: 0f104550                 movups xmm0, xmmword ptr [rbp + 0x50]
0x140624e0b: 0f2945a0                 movaps xmmword ptr [rbp - 0x60], xmm0
0x140624e0f: 0f104560                 movups xmm0, xmmword ptr [rbp + 0x60]
0x140624e13: 0f2945b0                 movaps xmmword ptr [rbp - 0x50], xmm0
0x140624e17: 0f104570                 movups xmm0, xmmword ptr [rbp + 0x70]
0x140624e1b: 0f2945c0                 movaps xmmword ptr [rbp - 0x40], xmm0
0x140624e1f: 0f108580000000           movups xmm0, xmmword ptr [rbp + 0x80]
0x140624e26: 0f2945d0                 movaps xmmword ptr [rbp - 0x30], xmm0
0x140624e2a: 488b8590000000           mov rax, qword ptr [rbp + 0x90]
0x140624e31: 488945e0                 mov qword ptr [rbp - 0x20], rax
0x140624e35: 488b8df8000000           mov rcx, qword ptr [rbp + 0xf8]
0x140624e3c: e83fa2fdff               call 0x1405ff080
0x140624e41: 90                       nop
0x140624e42: 83fe02                   cmp esi, 2
0x140624e45: 0f85e6000000             jne 0x140624f31
0x140624e4b: 4889bdb8000000           mov qword ptr [rbp + 0xb8], rdi
0x140624e52: 488b054f81a507           mov rax, qword ptr [rip + 0x7a5814f]
0x140624e59: 488b00                   mov rax, qword ptr [rax]
0x140624e5c: 4883e0fe                 and rax, 0xfffffffffffffffe
0x140624e60: 4883f804                 cmp rax, 4
0x140624e64: 0f849f000000             je 0x140624f09
0x140624e6a: 0fb615f7c5a107           movzx edx, byte ptr [rip + 0x7a1c5f7]
0x140624e71: 80fa03                   cmp dl, 3
0x140624e74: 0f8355010000             jae 0x140624fcf
0x140624e7a: 84d2                     test dl, dl
0x140624e7c: 0f8487000000             je 0x140624f09
0x140624e82: 488b0dcfc5a107           mov rcx, qword ptr [rip + 0x7a1c5cf]
0x140624e89: e8428a6304               call 0x144c5d8d0
0x140624e8e: 90                       nop
0x140624e8f: 84c0                     test al, al
0x140624e91: 7476                     je 0x140624f09
0x140624e93: 488b0dbec5a107           mov rcx, qword ptr [rip + 0x7a1c5be]
0x140624e9a: 488d4130                 lea rax, [rcx + 0x30]
0x140624e9e: 488d95b8000000           lea rdx, [rbp + 0xb8]
0x140624ea5: 488955f0                 mov qword ptr [rbp - 0x10], rdx
0x140624ea9: 488d15a0815705           lea rdx, [rip + 0x55781a0]
0x140624eb0: 488955f8                 mov qword ptr [rbp - 8], rdx
0x140624eb4: 488d15f58a8605           lea rdx, [rip + 0x5868af5]
0x140624ebb: 488995c8000000           mov qword ptr [rbp + 0xc8], rdx
0x140624ec2: 488d55f0                 lea rdx, [rbp - 0x10]
0x140624ec6: 488995d0000000           mov qword ptr [rbp + 0xd0], rdx
0x140624ecd: 488d95c8000000           lea rdx, [rbp + 0xc8]
0x140624ed4: 48895528                 mov qword ptr [rbp + 0x28], rdx
0x140624ed8: 488d1581738605           lea rdx, [rip + 0x5867381]
0x140624edf: 48895530                 mov qword ptr [rbp + 0x30], rdx
0x140624ee3: 48c7454001000000         mov qword ptr [rbp + 0x40], 1
0x140624eeb: 488d5528                 lea rdx, [rbp + 0x28]
0x140624eef: 48895548                 mov qword ptr [rbp + 0x48], rdx
0x140624ef3: 48c7455001000000         mov qword ptr [rbp + 0x50], 1
0x140624efb: 48894558                 mov qword ptr [rbp + 0x58], rax
0x140624eff: 488d5540                 lea rdx, [rbp + 0x40]
0x140624f03: e8e8a16304               call 0x144c5f0f0
0x140624f08: 90                       nop
0x140624f09: 488d8db8000000           lea rcx, [rbp + 0xb8]
0x140624f10: e85b815705               call 0x145b9d070
0x140624f15: 90                       nop
0x140624f16: 4c8b8500010000           mov r8, qword ptr [rbp + 0x100]
0x140624f1d: 450fb64830               movzx r9d, byte ptr [r8 + 0x30]
0x140624f22: 4180f101                 xor r9b, 1
0x140624f26: eb76                     jmp 0x140624f9e
0x140624f28: b002                     mov al, 2
0x140624f2a: b104                     mov cl, 4
0x140624f2c: e984000000               jmp 0x140624fb5
0x140624f31: 4889bdf0000000           mov qword ptr [rbp + 0xf0], rdi
0x140624f38: 4889b5f8000000           mov qword ptr [rbp + 0xf8], rsi
0x140624f3f: 488b8500010000           mov rax, qword ptr [rbp + 0x100]
0x140624f46: 488b08                   mov rcx, qword ptr [rax]
0x140624f49: e812c4fdff               call 0x140601360
0x140624f4e: 90                       nop
0x140624f4f: 4c8b8500010000           mov r8, qword ptr [rbp + 0x100]
0x140624f56: 498b00                   mov rax, qword ptr [r8]
0x140624f59: 488b8df8000000           mov rcx, qword ptr [rbp + 0xf8]
0x140624f60: 488908                   mov qword ptr [rax], rcx
0x140624f63: 488b8df0000000           mov rcx, qword ptr [rbp + 0xf0]
0x140624f6a: 48894808                 mov qword ptr [rax + 8], rcx
0x140624f6e: 0f2845a0                 movaps xmm0, xmmword ptr [rbp - 0x60]
0x140624f72: 0f284db0                 movaps xmm1, xmmword ptr [rbp - 0x50]
0x140624f76: 0f2855c0                 movaps xmm2, xmmword ptr [rbp - 0x40]
0x140624f7a: 0f285dd0                 movaps xmm3, xmmword ptr [rbp - 0x30]
0x140624f7e: 0f114010                 movups xmmword ptr [rax + 0x10], xmm0
0x140624f82: 0f114820                 movups xmmword ptr [rax + 0x20], xmm1
0x140624f86: 0f115030                 movups xmmword ptr [rax + 0x30], xmm2
0x140624f8a: 0f115840                 movups xmmword ptr [rax + 0x40], xmm3
0x140624f8e: 488b4de0                 mov rcx, qword ptr [rbp - 0x20]
0x140624f92: 48894850                 mov qword ptr [rax + 0x50], rcx
0x140624f96: 41c6403001               mov byte ptr [r8 + 0x30], 1
0x140624f9b: 4531c9                   xor r9d, r9d
0x140624f9e: 498b00                   mov rax, qword ptr [r8]
0x140624fa1: 498b4810                 mov rcx, qword ptr [r8 + 0x10]
0x140624fa5: 488b5020                 mov rdx, qword ptr [rax + 0x20]
0x140624fa9: 4c8b4028                 mov r8, qword ptr [rax + 0x28]
0x140624fad: e8de440200               call 0x140649490
0x140624fb2: 90                       nop
0x140624fb3: b101                     mov cl, 1
0x140624fb5: 488b9500010000           mov rdx, qword ptr [rbp + 0x100]
0x140624fbc: 884a31                   mov byte ptr [rdx + 0x31], cl
0x140624fbf: 4881c498010000           add rsp, 0x198
0x140624fc6: 5b                       pop rbx
0x140624fc7: 5f                       pop rdi
0x140624fc8: 5e                       pop rsi
0x140624fc9: 415e                     pop r14
0x140624fcb: 415f                     pop r15
0x140624fcd: 5d                       pop rbp
0x140624fce: c3                       ret
0x140624fcf: 488d0d82c4a107           lea rcx, [rip + 0x7a1c482]
0x140624fd6: e845027205               call 0x145d45220
0x140624fdb: 90                       nop
0x140624fdc: 89c2                     mov edx, eax
0x140624fde: 84d2                     test dl, dl
0x140624fe0: 0f859cfeffff             jne 0x140624e82
0x140624fe6: e91effffff               jmp 0x140624f09
0x140624feb: 488d0da6898605           lea rcx, [rip + 0x58689a6]
0x140624ff2: e899497705               call 0x145d99990
0x140624ff7: 0f0b                     ud2
0x140624ff9: 488d0d98898605           lea rcx, [rip + 0x5868998]
0x140625000: e8ab497705               call 0x145d999b0
0x140625005: 0f0b                     ud2
0x140625007: 48899da0000000           mov qword ptr [rbp + 0xa0], rbx
0x14062500e: 488d0d437e8605           lea rcx, [rip + 0x5867e43]
0x140625015: e896497705               call 0x145d999b0
0x14062501a: 90                       nop
0x14062501b: eb4e                     jmp 0x14062506b
0x14062501d: 48899da0000000           mov qword ptr [rbp + 0xa0], rbx
0x140625024: 488d0d2d7e8605           lea rcx, [rip + 0x5867e2d]
0x14062502b: e860497705               call 0x145d99990
0x140625030: 90                       nop
0x140625031: eb38                     jmp 0x14062506b
0x140625033: 48899db0000000           mov qword ptr [rbp + 0xb0], rbx
0x14062503a: 4c89b5a8000000           mov qword ptr [rbp + 0xa8], r14
0x140625041: 488d0db87a8605           lea rcx, [rip + 0x5867ab8]
0x140625048: e863497705               call 0x145d999b0
0x14062504d: 90                       nop
0x14062504e: eb1b                     jmp 0x14062506b
0x140625050: 48899db0000000           mov qword ptr [rbp + 0xb0], rbx
0x140625057: 4c89b5a8000000           mov qword ptr [rbp + 0xa8], r14
0x14062505e: 488d0d9b7a8605           lea rcx, [rip + 0x5867a9b]
0x140625065: e826497705               call 0x145d99990
0x14062506a: 90                       nop
0x14062506b: 0f0b                     ud2
