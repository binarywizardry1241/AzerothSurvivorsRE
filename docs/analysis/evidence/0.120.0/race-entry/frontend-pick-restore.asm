00000001400851d0  55                     push rbp
00000001400851d1  4156                   push r14
00000001400851d3  56                     push rsi
00000001400851d4  57                     push rdi
00000001400851d5  53                     push rbx
00000001400851d6  4881ec00030000         sub rsp, 0x300
00000001400851dd  488dac2480000000       lea rbp, [rsp + 0x80]
00000001400851e5  48c78578020000feffffff mov qword ptr [rbp + 0x278], 0xfffffffffffffffe
00000001400851f0  4889ce                 mov rsi, rcx
00000001400851f3  488d4da0               lea rcx, [rbp - 0x60]
00000001400851f7  e80477a005             call 0x145a8c900
00000001400851fc  4883bd20010000ff       cmp qword ptr [rbp + 0x120], -1
0000000140085204  0f84f0000000           je 0x1400852fa
000000014008520a  488d9520010000         lea rdx, [rbp + 0x120]
0000000140085211  8a9d58010000           mov bl, byte ptr [rbp + 0x158]
0000000140085217  408abd59010000         mov dil, byte ptr [rbp + 0x159]
000000014008521e  448ab55a010000         mov r14b, byte ptr [rbp + 0x15a]
0000000140085225  488d8d18020000         lea rcx, [rbp + 0x218]
000000014008522c  e88f1aef05             call 0x145f76cc0
0000000140085231  90                     nop
0000000140085232  488d9538010000         lea rdx, [rbp + 0x138]
0000000140085239  488d8da0010000         lea rcx, [rbp + 0x1a0]
0000000140085240  e87b1aef05             call 0x145f76cc0
0000000140085245  90                     nop
0000000140085246  0fb6855f010000         movzx eax, byte ptr [rbp + 0x15f]
000000014008524d  88856f020000           mov byte ptr [rbp + 0x26f], al
0000000140085253  8b855b010000           mov eax, dword ptr [rbp + 0x15b]
0000000140085259  89856b020000           mov dword ptr [rbp + 0x26b], eax
000000014008525f  488b8550010000         mov rax, qword ptr [rbp + 0x150]
0000000140085266  0f108518020000         movups xmm0, xmmword ptr [rbp + 0x218]
000000014008526d  0f2985e0010000         movaps xmmword ptr [rbp + 0x1e0], xmm0
0000000140085274  488b8d28020000         mov rcx, qword ptr [rbp + 0x228]
000000014008527b  48898df0010000         mov qword ptr [rbp + 0x1f0], rcx
0000000140085282  488b8db0010000         mov rcx, qword ptr [rbp + 0x1b0]
0000000140085289  48898d08020000         mov qword ptr [rbp + 0x208], rcx
0000000140085290  0f108da0010000         movups xmm1, xmmword ptr [rbp + 0x1a0]
0000000140085297  0f118df8010000         movups xmmword ptr [rbp + 0x1f8], xmm1
000000014008529e  0f298530020000         movaps xmmword ptr [rbp + 0x230], xmm0
00000001400852a5  488b8df0010000         mov rcx, qword ptr [rbp + 0x1f0]
00000001400852ac  48898d40020000         mov qword ptr [rbp + 0x240], rcx
00000001400852b3  488b8df8010000         mov rcx, qword ptr [rbp + 0x1f8]
00000001400852ba  48898d48020000         mov qword ptr [rbp + 0x248], rcx
00000001400852c1  488b8d00020000         mov rcx, qword ptr [rbp + 0x200]
00000001400852c8  48898d50020000         mov qword ptr [rbp + 0x250], rcx
00000001400852cf  488b8d08020000         mov rcx, qword ptr [rbp + 0x208]
00000001400852d6  48898d58020000         mov qword ptr [rbp + 0x258], rcx
00000001400852dd  48898560020000         mov qword ptr [rbp + 0x260], rax
00000001400852e4  889d68020000           mov byte ptr [rbp + 0x268], bl
00000001400852ea  4088bd69020000         mov byte ptr [rbp + 0x269], dil
00000001400852f1  4488b56a020000         mov byte ptr [rbp + 0x26a], r14b
00000001400852f8  eb0d                   jmp 0x140085307
00000001400852fa  488d8d30020000         lea rcx, [rbp + 0x230]
0000000140085301  e8da4aa105             call 0x145a99de0
0000000140085306  90                     nop
0000000140085307  488d8da0010000         lea rcx, [rbp + 0x1a0]
000000014008530e  488d9530020000         lea rdx, [rbp + 0x230]
0000000140085315  e8462ea105             call 0x145a98160
000000014008531a  90                     nop
000000014008531b  488d8d30020000         lea rcx, [rbp + 0x230]
0000000140085322  488d55a0               lea rdx, [rbp - 0x60]
0000000140085326  4c8d85a0010000         lea r8, [rbp + 0x1a0]
000000014008532d  e88e61a005             call 0x145a8b4c0
0000000140085332  90                     nop
0000000140085333  4883bd4002000004       cmp qword ptr [rbp + 0x240], 4
000000014008533b  7552                   jne 0x14008538f
000000014008533d  488bbd38020000         mov rdi, qword ptr [rbp + 0x238]
0000000140085344  813f4865726f           cmp dword ptr [rdi], 0x6f726548
000000014008534a  7543                   jne 0x14008538f
000000014008534c  488d8da0010000         lea rcx, [rbp + 0x1a0]
0000000140085353  e8685d0000             call 0x14008b0c0
0000000140085358  90                     nop
0000000140085359  488b9530020000         mov rdx, qword ptr [rbp + 0x230]
0000000140085360  4885d2                 test rdx, rdx
0000000140085363  740e                   je 0x140085373
0000000140085365  41b801000000           mov r8d, 1
000000014008536b  4889f9                 mov rcx, rdi
000000014008536e  e85dcef7ff             call 0x1400021d0
0000000140085373  488b85b0010000         mov rax, qword ptr [rbp + 0x1b0]
000000014008537a  48898540020000         mov qword ptr [rbp + 0x240], rax
0000000140085381  0f1085a0010000         movups xmm0, xmmword ptr [rbp + 0x1a0]
0000000140085388  0f298530020000         movaps xmmword ptr [rbp + 0x230], xmm0
000000014008538f  0f288530020000         movaps xmm0, xmmword ptr [rbp + 0x230]
0000000140085396  488b8540020000         mov rax, qword ptr [rbp + 0x240]
000000014008539d  488b8d48020000         mov rcx, qword ptr [rbp + 0x248]
00000001400853a4  0f288d50020000         movaps xmm1, xmmword ptr [rbp + 0x250]
00000001400853ab  0f289560020000         movaps xmm2, xmmword ptr [rbp + 0x260]
00000001400853b2  0f115630               movups xmmword ptr [rsi + 0x30], xmm2
00000001400853b6  0f114e20               movups xmmword ptr [rsi + 0x20], xmm1
00000001400853ba  48894610               mov qword ptr [rsi + 0x10], rax
00000001400853be  48894e18               mov qword ptr [rsi + 0x18], rcx
00000001400853c2  0f1106                 movups xmmword ptr [rsi], xmm0
00000001400853c5  488d4da0               lea rcx, [rbp - 0x60]
00000001400853c9  e8e23cfaff             call 0x1400290b0
00000001400853ce  4889f0                 mov rax, rsi
00000001400853d1  4881c400030000         add rsp, 0x300
00000001400853d8  5b                     pop rbx
00000001400853d9  5f                     pop rdi
00000001400853da  5e                     pop rsi
00000001400853db  415e                   pop r14
00000001400853dd  5d                     pop rbp
00000001400853de  c3                     ret
