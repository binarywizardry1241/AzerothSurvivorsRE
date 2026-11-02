0x1406167ed: 41c7864b02000000000000   mov dword ptr [r14 + 0x24b], 0
0x1406167f8: 498b96f0000000           mov rdx, qword ptr [r14 + 0xf0]
0x1406167ff: 4d8b86f8000000           mov r8, qword ptr [r14 + 0xf8]
0x140616806: 410f108600010000         movups xmm0, xmmword ptr [r14 + 0x100]
0x14061680e: 410f1106                 movups xmmword ptr [r14], xmm0
0x140616812: 498b9e10010000           mov rbx, qword ptr [r14 + 0x110]
0x140616819: 4c89f1                   mov rcx, r14
0x14061681c: 4d8bb618010000           mov r14, qword ptr [r14 + 0x118]
0x140616823: 8b81d0010000             mov eax, dword ptr [rcx + 0x1d0]
0x140616829: 8981d4010000             mov dword ptr [rcx + 0x1d4], eax
0x14061682f: 488d8df0040000           lea rcx, [rbp + 0x4f0]
0x140616836: 6641b98c0e               mov r9w, 0xe8c
0x14061683b: e8000c4005               call 0x145a17440
0x140616840: 90                       nop
0x140616841: 0f1085f0040000           movups xmm0, xmmword ptr [rbp + 0x4f0]
0x140616848: 488b8dc8070000           mov rcx, qword ptr [rbp + 0x7c8]
0x14061684f: 0f114110                 movups xmmword ptr [rcx + 0x10], xmm0
0x140616853: 0fb78500050000           movzx eax, word ptr [rbp + 0x500]
0x14061685a: 668981d8010000           mov word ptr [rcx + 0x1d8], ax
0x140616861: 488b11                   mov rdx, qword ptr [rcx]
0x140616864: 4c8b4108                 mov r8, qword ptr [rcx + 8]
0x140616868: 488d8df0040000           lea rcx, [rbp + 0x4f0]
0x14061686f: e84c4ea300               call 0x14104b6c0
0x140616874: 90                       nop
0x140616875: 488b85f0040000           mov rax, qword ptr [rbp + 0x4f0]
0x14061687c: 4883f8ff                 cmp rax, -1
0x140616880: 0f844a010000             je 0x1406169d0
0x140616886: 0f1085f8040000           movups xmm0, xmmword ptr [rbp + 0x4f8]
0x14061688d: 488b8dc8070000           mov rcx, qword ptr [rbp + 0x7c8]
0x140616894: c6814e02000001           mov byte ptr [rcx + 0x24e], 1
0x14061689b: 48898120010000           mov qword ptr [rcx + 0x120], rax
0x1406168a2: 0f118128010000           movups xmmword ptr [rcx + 0x128], xmm0
0x1406168a9: 488d8df0040000           lea rcx, [rbp + 0x4f0]
0x1406168b0: 4889da                   mov rdx, rbx
0x1406168b3: 4d89f0                   mov r8, r14
0x1406168b6: e8054ea300               call 0x14104b6c0
0x1406168bb: 90                       nop
0x1406168bc: 488b85f0040000           mov rax, qword ptr [rbp + 0x4f0]
0x1406168c3: 4883f8ff                 cmp rax, -1
0x1406168c7: 0f8453010000             je 0x140616a20
0x1406168cd: 0f1085f8040000           movups xmm0, xmmword ptr [rbp + 0x4f8]
0x1406168d4: 4c8bb5c8070000           mov r14, qword ptr [rbp + 0x7c8]
0x1406168db: 41c6864d02000001         mov byte ptr [r14 + 0x24d], 1
0x1406168e3: 49898638010000           mov qword ptr [r14 + 0x138], rax
0x1406168ea: 410f118640010000         movups xmmword ptr [r14 + 0x140], xmm0
0x1406168f2: 49c7463000000000         mov qword ptr [r14 + 0x30], 0
0x1406168fa: 48b80000000008000000     movabs rax, 0x800000000
0x140616904: 49898650010000           mov qword ptr [r14 + 0x150], rax
0x14061690b: 31ff                     xor edi, edi
0x14061690d: b908000000               mov ecx, 8
0x140616912: 31c0                     xor eax, eax
0x140616914: e991060000               jmp 0x140616faa
