1458a0e10 55 push rbp
1458a0e11 4156 push r14
1458a0e13 56 push rsi
1458a0e14 57 push rdi
1458a0e15 53 push rbx
1458a0e16 4881ec80000000 sub rsp, 0x80
1458a0e1d 488dac2480000000 lea rbp, [rsp + 0x80]
1458a0e25 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
1458a0e2d 4889d7 mov rdi, rdx
1458a0e30 8b4268 mov eax, dword ptr [rdx + 0x68]
1458a0e33 ffc0 inc eax
1458a0e35 488b5260 mov rdx, qword ptr [rdx + 0x60]
1458a0e39 4883fa04 cmp rdx, 4
1458a0e3d 41b804000000 mov r8d, 4
1458a0e43 4c0f42c2 cmovb r8, rdx
1458a0e47 4489c2 mov edx, r8d
1458a0e4a 4c8d056b143601 lea r8, [rip + 0x136146b]
1458a0e51 f3410f100490 movss xmm0, dword ptr [r8 + rdx*4]
1458a0e57 f30f5905c1c65000 mulss xmm0, dword ptr [rip + 0x50c6c1]
1458a0e5f f30f5805f9c35000 addss xmm0, dword ptr [rip + 0x50c3f9]
1458a0e67 83f801 cmp eax, 1
1458a0e6a 83d0ff adc eax, -1
1458a0e6d 4889ce mov rsi, rcx
1458a0e70 f30f2ac8 cvtsi2ss xmm1, eax
1458a0e74 e8ec953600 call 0x145c0a465
1458a0e79 f30f58c0 addss xmm0, xmm0
1458a0e7d f30f100dfbc55000 movss xmm1, dword ptr [rip + 0x50c5fb]
1458a0e85 f30f5cc8 subss xmm1, xmm0
1458a0e89 f30f114dd8 movss dword ptr [rbp - 0x28], xmm1
1458a0e8e 488b4738 mov rax, qword ptr [rdi + 0x38]
1458a0e92 488b4f40 mov rcx, qword ptr [rdi + 0x40]
1458a0e96 48c1e106 shl rcx, 6
1458a0e9a 4801c1 add rcx, rax
1458a0e9d 488945c0 mov qword ptr [rbp - 0x40], rax
1458a0ea1 48894dc8 mov qword ptr [rbp - 0x38], rcx
1458a0ea5 488d45d8 lea rax, [rbp - 0x28]
1458a0ea9 488945d0 mov qword ptr [rbp - 0x30], rax
1458a0ead 488d4da8 lea rcx, [rbp - 0x58]
1458a0eb1 488d55c0 lea rdx, [rbp - 0x40]
1458a0eb5 e8868a1300 call 0x1459d9940
