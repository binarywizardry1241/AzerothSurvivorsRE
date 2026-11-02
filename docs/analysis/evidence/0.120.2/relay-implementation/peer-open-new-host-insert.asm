; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone 5.0.7; static observations, no target execution.
0000000145bf7f6e 460fb60c00                     movzx r9d, byte ptr [rax + r8]
0000000145bf7f73 4584c9                         test r9b, r9b
0000000145bf7f76 0f89a3080000                   jns 0x145bf881f
0000000145bf7f7c 4c8b9520020000                 mov r10, qword ptr [rbp + 0x220]
0000000145bf7f83 4c8d9d08010000                 lea r11, [rbp + 0x108]
0000000145bf7f8a 4d89531c                       mov qword ptr [r11 + 0x1c], r10
0000000145bf7f8e 0f108500020000                 movups xmm0, xmmword ptr [rbp + 0x200]
0000000145bf7f95 0f108d10020000                 movups xmm1, xmmword ptr [rbp + 0x210]
0000000145bf7f9c 410f114b0c                     movups xmmword ptr [r11 + 0xc], xmm1
0000000145bf7fa1 410f1143fc                     movups xmmword ptr [r11 - 4], xmm0
0000000145bf7fa6 4180e101                       and r9b, 1
0000000145bf7faa 4d8d50f0                       lea r10, [r8 - 0x10]
0000000145bf7fae 4921d2                         and r10, rdx
0000000145bf7fb1 42880c00                       mov byte ptr [rax + r8], cl
0000000145bf7fb5 42884c1010                     mov byte ptr [rax + r10 + 0x10], cl
0000000145bf7fba f3410f6f842490010000           movdqu xmm0, xmmword ptr [r12 + 0x190]
0000000145bf7fc4 410fb6c9                       movzx ecx, r9b
0000000145bf7fc8 660f6ec9                       movd xmm1, ecx
0000000145bf7fcc 410fc6c8e4                     shufps xmm1, xmm8, 0xe4
0000000145bf7fd1 660ffbc1                       psubq xmm0, xmm1
0000000145bf7fd5 f3410f7f842490010000           movdqu xmmword ptr [r12 + 0x190], xmm0
0000000145bf7fdf 49f7d8                         neg r8
0000000145bf7fe2 4b8d0c40                       lea rcx, [r8 + r8*2]
0000000145bf7fe6 48c1e104                       shl rcx, 4
0000000145bf7fea 8b95a8020000                   mov edx, dword ptr [rbp + 0x2a8]
0000000145bf7ff0 895408d0                       mov dword ptr [rax + rcx - 0x30], edx
0000000145bf7ff4 f30f6f8500010000               movdqu xmm0, xmmword ptr [rbp + 0x100]
0000000145bf7ffc f30f6f8d10010000               movdqu xmm1, xmmword ptr [rbp + 0x110]
0000000145bf8004 f30f6f951c010000               movdqu xmm2, xmmword ptr [rbp + 0x11c]
0000000145bf800c f30f7f4408d4                   movdqu xmmword ptr [rax + rcx - 0x2c], xmm0
0000000145bf8012 f30f7f4c08e4                   movdqu xmmword ptr [rax + rcx - 0x1c], xmm1
0000000145bf8018 f30f7f5408f0                   movdqu xmmword ptr [rax + rcx - 0x10], xmm2
