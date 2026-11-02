0x1458bb880: 55                       push rbp
0x1458bb881: 56                       push rsi
0x1458bb882: 57                       push rdi
0x1458bb883: 4883ec70                 sub rsp, 0x70
0x1458bb887: 488d6c2470               lea rbp, [rsp + 0x70]
0x1458bb88c: 48c745f8feffffff         mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x1458bb894: 4889d6                   mov rsi, rdx
0x1458bb897: 80ba6111000000           cmp byte ptr [rdx + 0x1161], 0
0x1458bb89e: 0f84be000000             je 0x1458bb962
0x1458bb8a4: 4889cf                   mov rdi, rcx
0x1458bb8a7: e8546974fa               call 0x140002200
0x1458bb8ac: b938000000               mov ecx, 0x38
0x1458bb8b1: ba08000000               mov edx, 8
0x1458bb8b6: e8056974fa               call 0x1400021c0
0x1458bb8bb: 4885c0                   test rax, rax
0x1458bb8be: 0f84eb000000             je 0x1458bb9af
0x1458bb8c4: 488945f0                 mov qword ptr [rbp - 0x10], rax
0x1458bb8c8: 488d96f00c0000           lea rdx, [rsi + 0xcf0]
0x1458bb8cf: 488d4db8                 lea rcx, [rbp - 0x48]
0x1458bb8d3: e8181a3100               call 0x145bcd2f0
0x1458bb8d8: 90                       nop
0x1458bb8d9: 0fb686280d0000           movzx eax, byte ptr [rsi + 0xd28]
0x1458bb8e0: 0fb68e290d0000           movzx ecx, byte ptr [rsi + 0xd29]
0x1458bb8e7: 0fb6962a0d0000           movzx edx, byte ptr [rsi + 0xd2a]
0x1458bb8ee: 440fb6862f0d0000         movzx r8d, byte ptr [rsi + 0xd2f]
0x1458bb8f6: 448845ef                 mov byte ptr [rbp - 0x11], r8b
0x1458bb8fa: 448b862b0d0000           mov r8d, dword ptr [rsi + 0xd2b]
0x1458bb901: 448945eb                 mov dword ptr [rbp - 0x15], r8d
0x1458bb905: 48c745d0feffff00         mov qword ptr [rbp - 0x30], 0xfffffe
0x1458bb90d: 884de8                   mov byte ptr [rbp - 0x18], cl
0x1458bb910: 8845e9                   mov byte ptr [rbp - 0x17], al
0x1458bb913: 8855ea                   mov byte ptr [rbp - 0x16], dl
0x1458bb916: f30f100502f85200         movss xmm0, dword ptr [rip + 0x52f802]
0x1458bb91e: 0f1145d8                 movups xmmword ptr [rbp - 0x28], xmm0
0x1458bb922: 0f1045b8                 movups xmm0, xmmword ptr [rbp - 0x48]
0x1458bb926: 488b4df0                 mov rcx, qword ptr [rbp - 0x10]
0x1458bb92a: 0f1101                   movups xmmword ptr [rcx], xmm0
0x1458bb92d: 488b45c8                 mov rax, qword ptr [rbp - 0x38]
0x1458bb931: 48894110                 mov qword ptr [rcx + 0x10], rax
0x1458bb935: 488b45d0                 mov rax, qword ptr [rbp - 0x30]
0x1458bb939: 48894118                 mov qword ptr [rcx + 0x18], rax
0x1458bb93d: 0f1045d8                 movups xmm0, xmmword ptr [rbp - 0x28]
0x1458bb941: 0f114120                 movups xmmword ptr [rcx + 0x20], xmm0
0x1458bb945: 488b45e8                 mov rax, qword ptr [rbp - 0x18]
0x1458bb949: 48894130                 mov qword ptr [rcx + 0x30], rax
0x1458bb94d: 48c70701000000           mov qword ptr [rdi], 1
0x1458bb954: 48894f08                 mov qword ptr [rdi + 8], rcx
0x1458bb958: 48c7471001000000         mov qword ptr [rdi + 0x10], 1
0x1458bb960: eb45                     jmp 0x1458bb9a7
0x1458bb962: 488d86e00e0000           lea rax, [rsi + 0xee0]
0x1458bb969: 31d2                     xor edx, edx
0x1458bb96b: 4883bee00e0000ff         cmp qword ptr [rsi + 0xee0], -1
0x1458bb973: 480f45d0                 cmovne rdx, rax
0x1458bb977: 488b86280b0000           mov rax, qword ptr [rsi + 0xb28]
0x1458bb97e: 4c6b86300b000038         imul r8, qword ptr [rsi + 0xb30], 0x38
0x1458bb986: 4901c0                   add r8, rax
0x1458bb989: 48c745b801000000         mov qword ptr [rbp - 0x48], 1
0x1458bb991: 488955c0                 mov qword ptr [rbp - 0x40], rdx
0x1458bb995: 488945c8                 mov qword ptr [rbp - 0x38], rax
0x1458bb999: 4c8945d0                 mov qword ptr [rbp - 0x30], r8
0x1458bb99d: 488d55b8                 lea rdx, [rbp - 0x48]
0x1458bb9a1: e8aadc1000               call 0x1459c9650
0x1458bb9a6: 90                       nop
0x1458bb9a7: 4883c470                 add rsp, 0x70
0x1458bb9ab: 5f                       pop rdi
0x1458bb9ac: 5e                       pop rsi
0x1458bb9ad: 5d                       pop rbp
0x1458bb9ae: c3                       ret
0x1458bb9af: b908000000               mov ecx, 8
0x1458bb9b4: ba38000000               mov edx, 0x38
0x1458bb9b9: e8e3d84d00               call 0x145d992a1
0x1458bb9be: 0f0b                     ud2
