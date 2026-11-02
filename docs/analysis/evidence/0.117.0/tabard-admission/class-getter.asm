; EXE 0.117.0 SHA-256 507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293
; Preferred VA [0x145acb7a0, 0x145acb925); bytes SHA-256 1e129a23fdf3c2a1f986abfbcec5f69c0ef64a3b0a31d7bba0d2db980e7aad66
; Capstone 5.0.7; current static bytes, no native process.
0000000145acb7a0: 55                       push rbp
0000000145acb7a1: 56                       push rsi
0000000145acb7a2: 57                       push rdi
0000000145acb7a3: 53                       push rbx
0000000145acb7a4: 4881ec38010000           sub rsp, 0x138
0000000145acb7ab: 488dac2480000000         lea rbp, [rsp + 0x80]
0000000145acb7b3: 48c785b0000000feffffff   mov qword ptr [rbp + 0xb0], 0xfffffffffffffffe
0000000145acb7be: 4489cb                   mov ebx, r9d
0000000145acb7c1: 4889ce                   mov rsi, rcx
0000000145acb7c4: 488b4250                 mov rax, qword ptr [rdx + 0x50]
0000000145acb7c8: 48694a58e8000000         imul rcx, qword ptr [rdx + 0x58], 0xe8
0000000145acb7d0: 4531c9                   xor r9d, r9d
0000000145acb7d3: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145acb7e0: 4c39c9                   cmp rcx, r9
0000000145acb7e3: 743a                     je 0x145acb81f
0000000145acb7e5: 4d8d91e8000000           lea r10, [r9 + 0xe8]
0000000145acb7ec: 46388408e4000000         cmp byte ptr [rax + r9 + 0xe4], r8b
0000000145acb7f4: 4d89d1                   mov r9, r10
0000000145acb7f7: 75e7                     jne 0x145acb7e0
0000000145acb7f9: 4c01d0                   add rax, r10
0000000145acb7fc: 480518ffffff             add rax, -0xe8
0000000145acb802: 488d4da8                 lea rcx, [rbp - 0x58]
0000000145acb806: 41b8e8000000             mov r8d, 0xe8
0000000145acb80c: 4889d7                   mov rdi, rdx
0000000145acb80f: 4889c2                   mov rdx, rax
0000000145acb812: e8c4844c00               call 0x145f93cdb
0000000145acb817: 4889fa                   mov rdx, rdi
0000000145acb81a: e9a3000000               jmp 0x145acb8c2
0000000145acb81f: 0f57c0                   xorps xmm0, xmm0
0000000145acb822: 0f11457c                 movups xmmword ptr [rbp + 0x7c], xmm0
0000000145acb826: 0f114570                 movups xmmword ptr [rbp + 0x70], xmm0
0000000145acb82a: 0f114560                 movups xmmword ptr [rbp + 0x60], xmm0
0000000145acb82e: 0f114550                 movups xmmword ptr [rbp + 0x50], xmm0
0000000145acb832: 0f114540                 movups xmmword ptr [rbp + 0x40], xmm0
0000000145acb836: 4488858c000000           mov byte ptr [rbp + 0x8c], r8b
0000000145acb83d: c745a800000000           mov dword ptr [rbp - 0x58], 0
0000000145acb844: c745b000000000           mov dword ptr [rbp - 0x50], 0
0000000145acb84b: c745b800000000           mov dword ptr [rbp - 0x48], 0
0000000145acb852: c745c000000000           mov dword ptr [rbp - 0x40], 0
0000000145acb859: c745c800000000           mov dword ptr [rbp - 0x38], 0
0000000145acb860: c745d000000000           mov dword ptr [rbp - 0x30], 0
0000000145acb867: c745d800000000           mov dword ptr [rbp - 0x28], 0
0000000145acb86e: c745e000000000           mov dword ptr [rbp - 0x20], 0
0000000145acb875: c745e800000000           mov dword ptr [rbp - 0x18], 0
0000000145acb87c: c745f000000000           mov dword ptr [rbp - 0x10], 0
0000000145acb883: c745f800000000           mov dword ptr [rbp - 8], 0
0000000145acb88a: c7450000000000           mov dword ptr [rbp], 0
0000000145acb891: c7450800000000           mov dword ptr [rbp + 8], 0
0000000145acb898: c7451000000000           mov dword ptr [rbp + 0x10], 0
0000000145acb89f: c7451800000000           mov dword ptr [rbp + 0x18], 0
0000000145acb8a6: c7452000000000           mov dword ptr [rbp + 0x20], 0
0000000145acb8ad: c7452800000000           mov dword ptr [rbp + 0x28], 0
0000000145acb8b4: c7453000000000           mov dword ptr [rbp + 0x30], 0
0000000145acb8bb: c7453800000000           mov dword ptr [rbp + 0x38], 0
0000000145acb8c2: 488d8d90000000           lea rcx, [rbp + 0x90]
0000000145acb8c9: e83295ffff               call 0x145ac4e00
0000000145acb8ce: 4c8b8598000000           mov r8, qword ptr [rbp + 0x98]
0000000145acb8d5: 4c8b8da0000000           mov r9, qword ptr [rbp + 0xa0]
0000000145acb8dc: 885c2420                 mov byte ptr [rsp + 0x20], bl
0000000145acb8e0: 488d55a8                 lea rdx, [rbp - 0x58]
0000000145acb8e4: 4889f1                   mov rcx, rsi
0000000145acb8e7: 4c8985a8000000           mov qword ptr [rbp + 0xa8], r8
0000000145acb8ee: e8dd6fffff               call 0x145ac28d0
0000000145acb8f3: 90                       nop
0000000145acb8f4: 488b9590000000           mov rdx, qword ptr [rbp + 0x90]
0000000145acb8fb: 4885d2                   test rdx, rdx
0000000145acb8fe: 7416                     je 0x145acb916
0000000145acb900: 48c1e202                 shl rdx, 2
0000000145acb904: 41b804000000             mov r8d, 4
0000000145acb90a: 488b8da8000000           mov rcx, qword ptr [rbp + 0xa8]
0000000145acb911: e8ba6853fa               call 0x1400021d0
0000000145acb916: 4889f0                   mov rax, rsi
0000000145acb919: 4881c438010000           add rsp, 0x138
0000000145acb920: 5b                       pop rbx
0000000145acb921: 5f                       pop rdi
0000000145acb922: 5e                       pop rsi
0000000145acb923: 5d                       pop rbp
0000000145acb924: c3                       ret
