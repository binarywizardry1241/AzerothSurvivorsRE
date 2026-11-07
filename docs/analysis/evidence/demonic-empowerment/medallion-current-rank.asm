1458a1550 55 push rbp
1458a1551 4156 push r14
1458a1553 56 push rsi
1458a1554 57 push rdi
1458a1555 53 push rbx
1458a1556 4881ec80000000 sub rsp, 0x80
1458a155d 488dac2480000000 lea rbp, [rsp + 0x80]
1458a1565 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
1458a156d 4889d7 mov rdi, rdx
1458a1570 488b4260 mov rax, qword ptr [rdx + 0x60]
1458a1574 4883f804 cmp rax, 4
1458a1578 ba04000000 mov edx, 4
1458a157d 480f42d0 cmovb rdx, rax
1458a1581 89d0 mov eax, edx
1458a1583 488d15320d3601 lea rdx, [rip + 0x1360d32]
1458a158a f30f100482 movss xmm0, dword ptr [rdx + rax*4]
1458a158f f30f590589bf5000 mulss xmm0, dword ptr [rip + 0x50bf89]
1458a1597 f30f5805c1bc5000 addss xmm0, dword ptr [rip + 0x50bcc1]
1458a159f 8b4768 mov eax, dword ptr [rdi + 0x68]
1458a15a2 83f801 cmp eax, 1
1458a15a5 83d0ff adc eax, -1
1458a15a8 4889ce mov rsi, rcx
1458a15ab f30f2ac8 cvtsi2ss xmm1, eax
1458a15af e8b18e3600 call 0x145c0a465
1458a15b4 f30f58c0 addss xmm0, xmm0
1458a15b8 f30f100dc0be5000 movss xmm1, dword ptr [rip + 0x50bec0]
1458a15c0 f30f5cc8 subss xmm1, xmm0
1458a15c4 f30f114dd8 movss dword ptr [rbp - 0x28], xmm1
1458a15c9 488b4738 mov rax, qword ptr [rdi + 0x38]
1458a15cd 488b4f40 mov rcx, qword ptr [rdi + 0x40]
1458a15d1 48c1e106 shl rcx, 6
1458a15d5 4801c1 add rcx, rax
1458a15d8 488945c0 mov qword ptr [rbp - 0x40], rax
1458a15dc 48894dc8 mov qword ptr [rbp - 0x38], rcx
1458a15e0 488d45d8 lea rax, [rbp - 0x28]
1458a15e4 488945d0 mov qword ptr [rbp - 0x30], rax
1458a15e8 488d4da8 lea rcx, [rbp - 0x58]
1458a15ec 488d55c0 lea rdx, [rbp - 0x40]
1458a15f0 e84b831300 call 0x1459d9940
