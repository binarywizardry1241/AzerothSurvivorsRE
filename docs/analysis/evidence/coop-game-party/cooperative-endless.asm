; Current0.115.0 SHA256 0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c
; Selected 0x1458feff0..0x1458ff04b
0x1458feff0: push rbp
0x1458feff1: push r15
0x1458feff3: push r14
0x1458feff5: push rsi
0x1458feff6: push rdi
0x1458feff7: push rbx
0x1458feff8: sub rsp, 0xb8
0x1458fefff: lea rbp, [rsp + 0x80]
0x1458ff007: mov qword ptr [rbp + 0x30], 0xfffffffffffffffe
0x1458ff00f: cmp byte ptr [rcx + 0xc41], 1
0x1458ff016: jne 0x1458ff283
0x1458ff01c: mov r14, rcx
0x1458ff01f: cmp byte ptr [rcx + 0xc47], 5
0x1458ff026: jne 0x1458ff283
0x1458ff02c: xorps xmm0, xmm0
0x1458ff02f: ucomiss xmm0, dword ptr [r14 + 0x4f8]
0x1458ff037: jae 0x1458ff043
0x1458ff039: mov rcx, r14
0x1458ff03c: call 0x145903b80
0x1458ff041: jmp 0x1458ff04b
0x1458ff043: mov byte ptr [r14 + 0xc46], 4
; Selected 0x1458ff126..0x1458ff1f0
0x1458ff126: cmp qword ptr [r14 + 0x988], 0
0x1458ff12e: je 0x1458ff27b
0x1458ff134: lea r15, [r14 + 0x978]
0x1458ff13b: mov rax, qword ptr [r15 + 0x10]
0x1458ff13f: mov qword ptr [rbp], rax
0x1458ff143: movups xmm0, xmmword ptr [r15]
0x1458ff147: movaps xmmword ptr [rbp - 0x10], xmm0
0x1458ff14b: mov qword ptr [r14 + 0x978], 0
0x1458ff156: mov qword ptr [r14 + 0x980], 8
0x1458ff161: mov qword ptr [r14 + 0x988], 0
0x1458ff16c: imul rax, qword ptr [rbp], 0x980
0x1458ff174: mov rdx, qword ptr [rbp - 8]
0x1458ff178: add rax, rdx
0x1458ff17b: mov qword ptr [rbp - 0x28], rax
0x1458ff17f: xor edi, edi
0x1458ff181: lea rsi, [rbp + 0x27]
0x1458ff185: cmp rdx, qword ptr [rbp - 0x28]
0x1458ff189: mov qword ptr [rbp + 0x18], rdx
0x1458ff18d: je 0x1458ff1f0
0x1458ff18f: nop
0x1458ff190: inc rdi
0x1458ff193: mov rcx, r14
0x1458ff196: call 0x145920ed0
0x1458ff19b: mov qword ptr [r14 + 0xb40], rdi
0x1458ff1a2: mov rcx, qword ptr [r14 + 0x2d0]
0x1458ff1a9: mov rdx, qword ptr [r14 + 0x2d8]
0x1458ff1b0: mov r8, rsi
0x1458ff1b3: mov r9, r14
0x1458ff1b6: call 0x1458d9f00
0x1458ff1bb: nop
0x1458ff1bc: mov rcx, r14
0x1458ff1bf: call 0x145901040
0x1458ff1c4: nop
0x1458ff1c5: mov rdx, qword ptr [rbp + 0x18]
0x1458ff1c9: lea rbx, [rdx + 0x980]
0x1458ff1d0: mov qword ptr [r14 + 0xb40], 0
0x1458ff1db: mov rcx, r14
0x1458ff1de: call 0x145920ed0
0x1458ff1e3: mov rdx, rbx
0x1458ff1e6: cmp rdx, qword ptr [rbp - 0x28]
0x1458ff1ea: mov qword ptr [rbp + 0x18], rdx
0x1458ff1ee: jne 0x1458ff190
; Selected 0x1458ff27b..0x1458ff293
0x1458ff27b: mov byte ptr [r14 + 0xc47], 1
0x1458ff283: add rsp, 0xb8
0x1458ff28a: pop rbx
0x1458ff28b: pop rdi
0x1458ff28c: pop rsi
0x1458ff28d: pop r14
0x1458ff28f: pop r15
0x1458ff291: pop rbp
0x1458ff292: ret
