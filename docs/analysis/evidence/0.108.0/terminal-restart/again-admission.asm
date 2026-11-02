00000001458b4eee: 4889f1                         mov rcx, rsi
00000001458b4ef1: e8bac9ffff                     call 0x1458b18b0
00000001458b4ef6: 488b4610                       mov rax, qword ptr [rsi + 0x10]
00000001458b4efa: 48c7461002000000               mov qword ptr [rsi + 0x10], 2
00000001458b4f02: 4883f802                       cmp rax, 2
00000001458b4f06: 0f846c150000                   je 0x1458b6478
00000001458b4f0c: 488d5618                       lea rdx, [rsi + 0x18]
00000001458b4f10: 488945b0                       mov qword ptr [rbp - 0x50], rax
00000001458b4f14: 488d4db8                       lea rcx, [rbp - 0x48]
00000001458b4f18: 41b8c00a0000                   mov r8d, 0xac0
00000001458b4f1e: e818da3300                     call 0x145bf293b
00000001458b4f23: 488b8e180b0000                 mov rcx, qword ptr [rsi + 0xb18]
00000001458b4f2a: 4885c9                         test rcx, rcx
00000001458b4f2d: 0f843b150000                   je 0x1458b646e
00000001458b4f33: 488b86100b0000                 mov rax, qword ptr [rsi + 0xb10]
00000001458b4f3a: 4869c9b0000000                 imul rcx, rcx, 0xb0
00000001458b4f41: 31db                           xor ebx, ebx
00000001458b4f43: 31d2                           xor edx, edx
00000001458b4f45: 66662e0f1f840000000000         nop word ptr cs:[rax + rax]
00000001458b4f50: 80bc10a800000000               cmp byte ptr [rax + rdx + 0xa8], 0
00000001458b4f58: 0f85540d0000                   jne 0x1458b5cb2
00000001458b4f5e: 48ffc3                         inc rbx
00000001458b4f61: 4881c2b0000000                 add rdx, 0xb0
00000001458b4f68: 4839d1                         cmp rcx, rdx
00000001458b4f6b: 75e3                           jne 0x1458b4f50
00000001458b4f6d: e9fc140000                     jmp 0x1458b646e
