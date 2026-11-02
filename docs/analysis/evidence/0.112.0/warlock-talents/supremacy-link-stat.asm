1458f2a52 f30f10b64c0a0000 movss xmm6, dword ptr [rsi + 0xa4c]
1458f2a5a 488b9600080000 mov rdx, qword ptr [rsi + 0x800]
1458f2a61 4885d2 test rdx, rdx
1458f2a64 0f8423010000 je 0x1458f2b8d
1458f2a6a 488b86f8070000 mov rax, qword ptr [rsi + 0x7f8]
1458f2a71 4883fa01 cmp rdx, 1
1458f2a75 750c jne 0x1458f2a83
1458f2a77 f30f100561aa4b00 movss xmm0, dword ptr [rip + 0x4baa61]
1458f2a7f 31c9 xor ecx, ecx
1458f2a81 eb57 jmp 0x1458f2ada
1458f2a83 4989d0 mov r8, rdx
1458f2a86 4983e0fe and r8, 0xfffffffffffffffe
1458f2a8a f30f10054eaa4b00 movss xmm0, dword ptr [rip + 0x4baa4e]
1458f2a92 31c9 xor ecx, ecx
1458f2a94 eb13 jmp 0x1458f2aa9
1458f2a96 662e0f1f840000000000 nop word ptr cs:[rax + rax]
1458f2aa0 4883c102 add rcx, 2
1458f2aa4 4939c8 cmp r8, rcx
1458f2aa7 742c je 0x1458f2ad5
1458f2aa9 803cc820 cmp byte ptr [rax + rcx*8], 0x20
1458f2aad 7411 je 0x1458f2ac0
1458f2aaf 807cc80820 cmp byte ptr [rax + rcx*8 + 8], 0x20
1458f2ab4 75ea jne 0x1458f2aa0
1458f2ab6 eb15 jmp 0x1458f2acd
1458f2ab8 0f1f840000000000 nop dword ptr [rax + rax]
1458f2ac0 f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
1458f2ac6 807cc80820 cmp byte ptr [rax + rcx*8 + 8], 0x20
1458f2acb 75d3 jne 0x1458f2aa0
1458f2acd f30f5844c80c addss xmm0, dword ptr [rax + rcx*8 + 0xc]
1458f2ad3 ebcb jmp 0x1458f2aa0
1458f2ad5 f6c201 test dl, 1
1458f2ad8 740c je 0x1458f2ae6
1458f2ada 803cc820 cmp byte ptr [rax + rcx*8], 0x20
1458f2ade 7506 jne 0x1458f2ae6
1458f2ae0 f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
1458f2ae6 0f57c9 xorps xmm1, xmm1
1458f2ae9 0f2ec1 ucomiss xmm0, xmm1
1458f2aec 0f869b000000 jbe 0x1458f2b8d
1458f2af2 488b86d8010000 mov rax, qword ptr [rsi + 0x1d8]
1458f2af9 4885c0 test rax, rax
1458f2afc 0f848b000000 je 0x1458f2b8d
1458f2b02 488b8ed0010000 mov rcx, qword ptr [rsi + 0x1d0]
1458f2b09 48c1e004 shl rax, 4
1458f2b0d 31d2 xor edx, edx
1458f2b0f 49b8736f756c5f6c696e movabs r8, 0x6e696c5f6c756f73
1458f2b19 eb0e jmp 0x1458f2b29
1458f2b1b 0f1f440000 nop dword ptr [rax + rax]
1458f2b20 4883c210 add rdx, 0x10
1458f2b24 4839d0 cmp rax, rdx
1458f2b27 7464 je 0x1458f2b8d
1458f2b29 4c8b0c11 mov r9, qword ptr [rcx + rdx]
1458f2b2d 4983793809 cmp qword ptr [r9 + 0x38], 9
1458f2b32 75ec jne 0x1458f2b20
1458f2b34 4d8b4930 mov r9, qword ptr [r9 + 0x30]
1458f2b38 4d8b11 mov r10, qword ptr [r9]
1458f2b3b 4d31c2 xor r10, r8
1458f2b3e 450fb64908 movzx r9d, byte ptr [r9 + 8]
1458f2b43 4983f16b xor r9, 0x6b
1458f2b47 4d09d1 or r9, r10
1458f2b4a 75d4 jne 0x1458f2b20
1458f2b4c 0fb65c1108 movzx ebx, byte ptr [rcx + rdx + 8]
1458f2b51 84db test bl, bl
1458f2b53 7438 je 0x1458f2b8d
1458f2b55 4d39fd cmp r13, r15
1458f2b58 750e jne 0x1458f2b68
1458f2b5a 488d4d68 lea rcx, [rbp + 0x68]
1458f2b5e e80d393200 call 0x145c16470
1458f2b63 90 nop
1458f2b64 488b7d70 mov rdi, qword ptr [rbp + 0x70]
1458f2b68 0fb6c3 movzx eax, bl
1458f2b6b 0f57c0 xorps xmm0, xmm0
1458f2b6e f30f2ac0 cvtsi2ss xmm0, eax
1458f2b72 f30f590522854c00 mulss xmm0, dword ptr [rip + 0x4c8522]
1458f2b7a 42c604ef05 mov byte ptr [rdi + r13*8], 5
1458f2b7f f3420f1144ef04 movss dword ptr [rdi + r13*8 + 4], xmm0
1458f2b86 49ffc5 inc r13
1458f2b89 4c896d78 mov qword ptr [rbp + 0x78], r13
