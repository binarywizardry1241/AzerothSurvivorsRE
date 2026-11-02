0000000145c0002c 488d8dd00c0000                 lea rcx, [rbp + 0xcd0]
0000000145c00033 488d55b8                       lea rdx, [rbp - 0x48]
0000000145c00037 4c8d8580050000                 lea r8, [rbp + 0x580]
0000000145c0003e e8cdd3ffff                     call 0x145bfd410
0000000145c00043 90                             nop
0000000145c00044 0fb685d00c0000                 movzx eax, byte ptr [rbp + 0xcd0]
0000000145c0004b 83f802                         cmp eax, 2
0000000145c0004e 0f852cffffff                   jne 0x145bfff80
0000000145c00054 488bb5d80c0000                 mov rsi, qword ptr [rbp + 0xcd8]
0000000145c0005b 89f7                           mov edi, esi
0000000145c0005d 83e703                         and edi, 3
0000000145c00060 488d0dd11da001                 lea rcx, [rip + 0x1a01dd1]
0000000145c00067 486304b9                       movsxd rax, dword ptr [rcx + rdi*4]
0000000145c0006b 4801c8                         add rax, rcx
0000000145c0006e ffe0                           jmp rax
0000000145c00070 0fb64610                       movzx eax, byte ptr [rsi + 0x10]
0000000145c00074 3c0d                           cmp al, 0xd
0000000145c00076 744c                           je 0x145c000c4
0000000145c00078 e958100000                     jmp 0x145c010d5
0000000145c0007d c685d30e000001                 mov byte ptr [rbp + 0xed3], 1
0000000145c00084 e847673800                     call 0x145f867d0
0000000145c00089 90                             nop
0000000145c0008a 4889f1                         mov rcx, rsi
0000000145c0008d 48c1e920                       shr rcx, 0x20
0000000145c00091 488b4008                       mov rax, qword ptr [rax + 8]
0000000145c00095 c685d30e000001                 mov byte ptr [rbp + 0xed3], 1
0000000145c0009c ffd0                           call rax
0000000145c0009e 90                             nop
0000000145c0009f 3c0d                           cmp al, 0xd
0000000145c000a1 7421                           je 0x145c000c4
0000000145c000a3 e92d100000                     jmp 0x145c010d5
0000000145c000a8 4889f0                         mov rax, rsi
0000000145c000ab 48c1e820                       shr rax, 0x20
0000000145c000af 3c0d                           cmp al, 0xd
0000000145c000b1 7411                           je 0x145c000c4
0000000145c000b3 e91d100000                     jmp 0x145c010d5
0000000145c000b8 0fb6461f                       movzx eax, byte ptr [rsi + 0x1f]
0000000145c000bc 3c0d                           cmp al, 0xd
0000000145c000be 0f8511100000                   jne 0x145c010d5
0000000145c000c4 8d47fe                         lea eax, [rdi - 2]
0000000145c000c7 83f802                         cmp eax, 2
0000000145c000ca 0f82bbfeffff                   jb 0x145bfff8b
0000000145c000d0 4885ff                         test rdi, rdi
0000000145c000d3 0f84b2feffff                   je 0x145bfff8b
0000000145c000d9 48ffce                         dec rsi
0000000145c000dc 4889b588050000                 mov qword ptr [rbp + 0x588], rsi
0000000145c000e3 c6858005000003                 mov byte ptr [rbp + 0x580], 3
0000000145c000ea c685d30e000000                 mov byte ptr [rbp + 0xed3], 0
0000000145c000f1 488d8d88050000                 lea rcx, [rbp + 0x588]
0000000145c000f8 e813043900                     call 0x145f90510
0000000145c000fd 90                             nop
0000000145c000fe e988feffff                     jmp 0x145bfff8b
