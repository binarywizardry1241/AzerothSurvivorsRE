0x14048dbb0: push rbp
0x14048dbb1: push r15
0x14048dbb3: push r14
0x14048dbb5: push r12
0x14048dbb7: push rsi
0x14048dbb8: push rdi
0x14048dbb9: push rbx
0x14048dbba: sub rsp, 0x2b0
0x14048dbc1: lea rbp, [rsp + 0x80]
0x14048dbc9: mov qword ptr [rbp + 0x228], 0xfffffffffffffffe
0x14048dbd4: mov rdi, rdx
0x14048dbd7: mov rsi, rcx
0x14048dbda: mov rcx, rdx
0x14048dbdd: call 0x1403cc550
0x14048dbe2: mov rbx, rax
0x14048dbe5: mov rcx, rdi
0x14048dbe8: call 0x1403deb60
0x14048dbed: mov r14, rax
0x14048dbf0: lea rcx, [rbp + 0x50]
0x14048dbf4: call 0x1450bde00
0x14048dbf9: movzx eax, byte ptr [rbp + 0xe0]
0x14048dc00: cmp rbx, qword ptr [rbp + 0x78]
0x14048dc04: jae 0x14048dd1f
0x14048dc0a: mov rcx, qword ptr [rbp + 0x68]
0x14048dc0e: mov rdx, rbx
0x14048dc11: shr rdx, 6
0x14048dc15: mov rcx, qword ptr [rcx + rdx*8]
0x14048dc19: bt rcx, rbx
0x14048dc1d: sbb al, 0
0x14048dc1f: jne 0x14048dd27
0x14048dc25: mov byte ptr [rbp + 0x227], 1
0x14048dc2c: lea rcx, [rbp + 0x50]
0x14048dc30: mov rdx, rbx
0x14048dc33: call 0x1450b76d0
0x14048dc38: nop 
0x14048dc39: mov byte ptr [rbp + 0x227], 1
0x14048dc40: lea rcx, [rbp - 0x60]
0x14048dc44: call 0x1450bde00
0x14048dc49: nop 
0x14048dc4a: lea rcx, [rbp - 0x60]
0x14048dc4e: mov rdx, r14
0x14048dc51: call 0x1450b7e20
0x14048dc56: nop 
0x14048dc57: lea rcx, [rbp + 0x50]
0x14048dc5b: lea rdx, [rbp - 0x60]
0x14048dc5f: call 0x1450b77a0
0x14048dc64: nop 
0x14048dc65: mov r15b, 1
0x14048dc68: cmp qword ptr [rdi + 0x90], 0
0x14048dc70: je 0x14048ddc1
0x14048dc76: mov rax, qword ptr [rdi + 0x78]
0x14048dc7a: mov rcx, qword ptr [rdi + 0x80]
0x14048dc81: movabs rdx, 0x870797e381bc5f60
0x14048dc8b: xor r8d, r8d
0x14048dc8e: movdqa xmm0, xmmword ptr [rip + 0x5da48aa]
0x14048dc96: pcmpeqd xmm1, xmm1
0x14048dc9a: movdqa xmm2, xmmword ptr [rip + 0x5df4dae]
0x14048dca2: and rdx, rcx
0x14048dca5: movdqu xmm3, xmmword ptr [rax + rdx]
0x14048dcaa: movdqa xmm4, xmm3
0x14048dcae: pcmpeqb xmm4, xmm0
0x14048dcb2: pmovmskb r9d, xmm4
0x14048dcb7: test r9d, r9d
0x14048dcba: je 0x14048dd00
0x14048dcbc: tzcnt r10d, r9d
0x14048dcc1: add r10, rdx
0x14048dcc4: and r10, rcx
0x14048dcc7: neg r10
0x14048dcca: lea r10, [r10 + r10*2]
0x14048dcce: movdqu xmm4, xmmword ptr [rax + r10*8 - 0x18]
0x14048dcd5: pcmpeqb xmm4, xmm2
0x14048dcd9: pmovmskb r11d, xmm4
0x14048dcde: cmp r11d, 0xffff
0x14048dce5: je 0x14048dd67
0x14048dceb: lea r10d, [r9 - 1]
0x14048dcef: and r10w, r9w
0x14048dcf3: mov r9d, r10d
0x14048dcf6: jne 0x14048dcbc
0x14048dcf8: nop dword ptr [rax + rax]
0x14048dd00: pcmpeqb xmm3, xmm1
0x14048dd04: pmovmskb r9d, xmm3
0x14048dd09: test r9d, r9d
0x14048dd0c: jne 0x14048ddc1
0x14048dd12: add rdx, r8
0x14048dd15: add rdx, 0x10
0x14048dd19: add r8, 0x10
0x14048dd1d: jmp 0x14048dca2
0x14048dd1f: test al, al
0x14048dd21: je 0x14048dc25
0x14048dd27: lea rax, [rbp + 0x226]
0x14048dd2e: mov qword ptr [rbp + 0x100], rax
0x14048dd35: lea rax, [rip + 0x4d935d4]
0x14048dd3c: mov qword ptr [rbp + 0x108], rax
0x14048dd43: mov byte ptr [rbp + 0x227], 1
0x14048dd4a: lea rcx, [rip + 0x5dca35c]
0x14048dd51: lea r8, [rip + 0x5dca3b8]
0x14048dd58: lea rdx, [rbp + 0x100]
0x14048dd5f: call 0x146208ee0
0x14048dd64: nop 
0x14048dd65: ud2 
0x14048dd67: lea rax, [rax + r10*8]
0x14048dd6b: mov rax, qword ptr [rax - 8]
0x14048dd6f: cmp rax, qword ptr [rdi + 0x218]
0x14048dd76: jae 0x14048ddc1
0x14048dd78: mov rcx, qword ptr [rdi + 0x210]
0x14048dd7f: mov rcx, qword ptr [rcx + rax*8]
0x14048dd83: test rcx, rcx
0x14048dd86: je 0x14048ddc1
0x14048dd88: mov rax, qword ptr [rdi + 0x1e0]
0x14048dd8f: not rcx
0x14048dd92: imul rcx, rcx, 0x38
0x14048dd96: cmp byte ptr [rax + rcx + 0x30], 1
0x14048dd9b: jne 0x14048ddc1
0x14048dd9d: add rax, rcx
0x14048dda0: mov r15, qword ptr [rax + 0x10]
0x14048dda4: lea rdx, [rbp + 0x50]
0x14048dda8: mov rcx, r15
0x14048ddab: call 0x14502ef60
0x14048ddb0: nop 
0x14048ddb1: lea rdx, [rdi + 0x40]
0x14048ddb5: mov rcx, r15
0x14048ddb8: call 0x14502f0c0
0x14048ddbd: nop 
0x14048ddbe: mov r15d, eax
0x14048ddc1: mov r12, qword ptr [rdi + 0x5a0]
0x14048ddc8: lea rcx, [rbp + 0x140]
0x14048ddcf: lea rdx, [rbp + 0x50]
0x14048ddd3: mov r8d, 0xb0
0x14048ddd9: call 0x14606171b
0x14048ddde: mov qword ptr [rbp + 0x100], r12
0x14048dde5: mov dword ptr [rbp + 0x108], 0
0x14048ddef: mov qword ptr [rbp + 0x110], 0x10
0x14048ddfa: pxor xmm0, xmm0
0x14048ddfe: movdqu xmmword ptr [rbp + 0x118], xmm0
0x14048de06: mov qword ptr [rbp + 0x128], 0x10
0x14048de11: movdqu xmmword ptr [rbp + 0x130], xmm0
0x14048de19: mov qword ptr [rbp + 0x1f0], 0
0x14048de24: mov qword ptr [rbp + 0x1f8], 4
0x14048de2f: mov qword ptr [rbp + 0x200], 0
0x14048de3a: mov byte ptr [rbp + 0x208], r15b
0x14048de41: mov qword ptr [rbp + 0x210], rbx
0x14048de48: mov qword ptr [rbp + 0x218], r14
0x14048de4f: mov byte ptr [rbp + 0x227], 0
0x14048de56: lea rcx, [rbp - 0x60]
0x14048de5a: call 0x140471980
0x14048de5f: nop 
0x14048de60: lea rcx, [rbp + 0x100]
0x14048de67: mov rdx, rdi
0x14048de6a: call 0x1404790a0
0x14048de6f: nop 
0x14048de70: lea rdx, [rbp + 0x100]
0x14048de77: mov r8d, 0x120
0x14048de7d: mov rcx, rsi
0x14048de80: call 0x14606171b
0x14048de85: mov rax, rsi
0x14048de88: add rsp, 0x2b0
0x14048de8f: pop rbx
0x14048de90: pop rdi
0x14048de91: pop rsi
0x14048de92: pop r12
0x14048de94: pop r14
0x14048de96: pop r15
0x14048de98: pop rbp
0x14048de99: ret 
