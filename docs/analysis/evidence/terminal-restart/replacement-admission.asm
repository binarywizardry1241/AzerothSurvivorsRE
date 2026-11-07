00000001458b7220: 55                             push rbp
00000001458b7221: 4157                           push r15
00000001458b7223: 4156                           push r14
00000001458b7225: 4155                           push r13
00000001458b7227: 4154                           push r12
00000001458b7229: 56                             push rsi
00000001458b722a: 57                             push rdi
00000001458b722b: 53                             push rbx
00000001458b722c: 4881ec380e0000                 sub rsp, 0xe38
00000001458b7233: 488dac2480000000               lea rbp, [rsp + 0x80]
00000001458b723b: 0f29b5a00d0000                 movaps xmmword ptr [rbp + 0xda0], xmm6
00000001458b7242: 48c785980d0000feffffff         mov qword ptr [rbp + 0xd98], 0xfffffffffffffffe
00000001458b724d: 4889cf                         mov rdi, rcx
00000001458b7250: 4883ba180f0000ff               cmp qword ptr [rdx + 0xf18], -1
00000001458b7258: 7478                           je 0x1458b72d2
00000001458b725a: 4889d3                         mov rbx, rdx
00000001458b725d: 4881c2180f0000                 add rdx, 0xf18
00000001458b7264: 488b8320100000                 mov rax, qword ptr [rbx + 0x1020]
00000001458b726b: 488985800d0000                 mov qword ptr [rbp + 0xd80], rax
00000001458b7272: 440fb6b384100000               movzx r14d, byte ptr [rbx + 0x1084]
00000001458b727a: 440fb6bb85100000               movzx r15d, byte ptr [rbx + 0x1085]
00000001458b7282: 440fb6ab86100000               movzx r13d, byte ptr [rbx + 0x1086]
00000001458b728a: 488d4db8                       lea rcx, [rbp - 0x48]
00000001458b728e: e8bde83000                     call 0x145bc5b50
00000001458b7293: 488bb3400f0000                 mov rsi, qword ptr [rbx + 0xf40]
00000001458b729a: 4989f4                         mov r12, rsi
00000001458b729d: 49c1e404                       shl r12, 4
00000001458b72a1: 4889f0                         mov rax, rsi
00000001458b72a4: 48c1e83c                       shr rax, 0x3c
00000001458b72a8: 0f95c0                         setne al
00000001458b72ab: 48b9f8ffffffffffff7f           movabs rcx, 0x7ffffffffffffff8
00000001458b72b5: 4939cc                         cmp r12, rcx
00000001458b72b8: 0f97c1                         seta cl
00000001458b72bb: 08c1                           or cl, al
00000001458b72bd: 741f                           je 0x1458b72de
00000001458b72bf: 31db                           xor ebx, ebx
00000001458b72c1: 4889d9                         mov rcx, rbx
00000001458b72c4: 4c89e2                         mov rdx, r12
00000001458b72c7: e82fc24d00                     call 0x145d934fb
00000001458b72cc: 90                             nop
00000001458b72cd: e932080000                     jmp 0x1458b7b04
00000001458b72d2: 48c70702000000                 mov qword ptr [rdi], 2
00000001458b72d9: e98f070000                     jmp 0x1458b7a6d
