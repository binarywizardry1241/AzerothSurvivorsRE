0x14006d1a0: push r15
0x14006d1a2: push r14
0x14006d1a4: push r13
0x14006d1a6: push r12
0x14006d1a8: push rsi
0x14006d1a9: push rdi
0x14006d1aa: push rbp
0x14006d1ab: push rbx
0x14006d1ac: sub rsp, 0x188
0x14006d1b3: mov rsi, r9
0x14006d1b6: mov rdi, r8
0x14006d1b9: mov rbx, rdx
0x14006d1bc: mov r13, rcx
0x14006d1bf: cmp rdx, 0x21
0x14006d1c3: jae 0x14006d1e8
0x14006d1c5: mov rax, qword ptr [rsp + 0x200]
0x14006d1cd: mov qword ptr [rsp + 0x20], rax
0x14006d1d2: mov rcx, r13
0x14006d1d5: mov rdx, rbx
0x14006d1d8: mov r8, rdi
0x14006d1db: mov r9, rsi
0x14006d1de: call 0x1401f6c60
0x14006d1e3: jmp 0x14006d7c3
0x14006d1e8: mov rax, qword ptr [rsp + 0x1f8]
0x14006d1f0: mov qword ptr [rsp + 0x70], rax
0x14006d1f5: mov ebp, dword ptr [rsp + 0x1f0]
0x14006d1fc: mov qword ptr [rsp + 0x60], rsi
0x14006d201: mov r14, rbx
0x14006d204: mov qword ptr [rsp + 0x40], r13
0x14006d209: nop dword ptr [rax]
0x14006d210: test ebp, ebp
0x14006d212: je 0x14006d79f
0x14006d218: mov r9, r14
0x14006d21b: shr r9, 3
0x14006d21f: imul rdx, r9, 0x3c0
0x14006d226: add rdx, r13
0x14006d229: imul r8, r9, 0x690
0x14006d230: add r8, r13
0x14006d233: cmp r14, 0x40
0x14006d237: jae 0x14006d290
0x14006d239: mov rax, qword ptr [r13 + 0xd0]
0x14006d240: test rax, rax
0x14006d243: setne cl
0x14006d246: cmp qword ptr [rdx + 0xd0], 0
0x14006d24e: sete r9b
0x14006d252: setne r10b
0x14006d256: and cl, r9b
0x14006d259: cmp qword ptr [r8 + 0xd0], 0
0x14006d261: sete r11b
0x14006d265: xor r9b, r11b
0x14006d268: and r10b, r11b
0x14006d26b: xor r10b, cl
0x14006d26e: cmovne rdx, r8
0x14006d272: test r9b, r9b
0x14006d275: mov r12, rdx
0x14006d278: cmovne r12, r13
0x14006d27c: test rax, rax
0x14006d27f: cmove r12, rdx
0x14006d283: jmp 0x14006d2a8
0x14006d285: nop word ptr cs:[rax + rax]
0x14006d290: mov rax, qword ptr [rsp + 0x200]
0x14006d298: mov qword ptr [rsp + 0x20], rax
0x14006d29d: mov rcx, r13
0x14006d2a0: call 0x140025400
0x14006d2a5: mov r12, rax
0x14006d2a8: dec ebp
0x14006d2aa: mov r15, r12
0x14006d2ad: sub r15, r13
0x14006d2b0: shr r15, 4
0x14006d2b4: movabs rax, 0xeeeeeeeeeeeeeeef
0x14006d2be: imul r15, rax
0x14006d2c2: mov r8d, 0xf0
0x14006d2c8: lea rcx, [rsp + 0x98]
0x14006d2d0: mov rdx, r12
0x14006d2d3: call 0x145d145fb
0x14006d2d8: cmp qword ptr [rsp + 0x70], 0
0x14006d2de: mov qword ptr [rsp + 0x48], r14
0x14006d2e3: mov dword ptr [rsp + 0x54], ebp
0x14006d2e7: je 0x14006d30b
0x14006d2e9: mov rax, qword ptr [rsp + 0x70]
0x14006d2ee: cmp qword ptr [rax + 0xd0], 0
0x14006d2f6: je 0x14006d590
0x14006d2fc: cmp qword ptr [r12 + 0xd0], 0
0x14006d305: jne 0x14006d590
0x14006d30b: cmp rsi, r14
0x14006d30e: jb 0x14006d7fe
0x14006d314: imul rax, r14, 0xf0
0x14006d31b: mov qword ptr [rsp + 0x68], rax
0x14006d320: lea rbp, [rdi + rax]
0x14006d324: xor ebx, ebx
0x14006d326: mov r14, r13
0x14006d329: mov qword ptr [rsp + 0x80], rbp
0x14006d331: mov qword ptr [rsp + 0x90], r15
0x14006d339: nop dword ptr [rax]
0x14006d340: imul rsi, r15, 0xf0
0x14006d347: add rsi, r13
0x14006d34a: cmp r14, rsi
0x14006d34d: jae 0x14006d3a6
0x14006d34f: nop
0x14006d350: mov r13, rbx
0x14006d353: cmp qword ptr [r14 + 0xd0], 0
0x14006d35b: setne al
0x14006d35e: cmp qword ptr [r12 + 0xd0], 0
0x14006d367: sete bl
0x14006d36a: and bl, al
0x14006d36c: add rbp, -0xf0
0x14006d373: test bl, bl
0x14006d375: mov rax, rbp
0x14006d378: cmovne rax, rdi
0x14006d37c: imul rcx, r13, 0xf0
0x14006d383: add rcx, rax
0x14006d386: mov r8d, 0xf0
0x14006d38c: mov rdx, r14
0x14006d38f: call 0x145d145fb
0x14006d394: movzx ebx, bl
0x14006d397: add rbx, r13
0x14006d39a: add r14, 0xf0
0x14006d3a1: cmp r14, rsi
0x14006d3a4: jb 0x14006d350
0x14006d3a6: mov rax, qword ptr [rsp + 0x48]
0x14006d3ab: cmp r15, rax
0x14006d3ae: mov r15, rax
0x14006d3b1: je 0x14006d3f0
0x14006d3b3: imul rax, rbx, 0xf0
0x14006d3ba: lea rcx, [rax + rbp]
0x14006d3be: add rcx, -0xf0
0x14006d3c5: add rbp, -0xf0
0x14006d3cc: mov r8d, 0xf0
0x14006d3d2: mov rdx, r14
0x14006d3d5: call 0x145d145fb
0x14006d3da: add r14, 0xf0
0x14006d3e1: mov r13, qword ptr [rsp + 0x40]
0x14006d3e6: jmp 0x14006d340
0x14006d3eb: nop dword ptr [rax + rax]
0x14006d3f0: imul r8, rbx, 0xf0
0x14006d3f7: mov r13, qword ptr [rsp + 0x40]
0x14006d3fc: mov rcx, r13
0x14006d3ff: mov rdx, rdi
0x14006d402: mov qword ptr [rsp + 0x58], r8
0x14006d407: call 0x145d145fb
0x14006d40c: mov rdx, r15
0x14006d40f: sub rdx, rbx
0x14006d412: je 0x14006d51d
0x14006d418: mov rax, qword ptr [rsp + 0x58]
0x14006d41d: lea rcx, [rax + r13]
0x14006d421: lea rax, [rbx + 1]
0x14006d425: cmp qword ptr [rsp + 0x48], rax
0x14006d42a: jne 0x14006d440
0x14006d42c: xor r15d, r15d
0x14006d42f: jmp 0x14006d4ed
0x14006d434: nop word ptr cs:[rax + rax]
0x14006d440: mov qword ptr [rsp + 0x88], rdx
0x14006d448: and rdx, 0xfffffffffffffffe
0x14006d44c: mov qword ptr [rsp + 0x78], rdx
0x14006d451: lea rax, [rdi - 0xf0]
0x14006d458: mov rsi, qword ptr [rsp + 0x68]
0x14006d45d: add rsi, rax
0x14006d460: mov qword ptr [rsp + 0x68], rcx
0x14006d465: mov r14, rcx
0x14006d468: xor r15d, r15d
0x14006d46b: mov rbp, qword ptr [rsp + 0x80]
0x14006d473: nop word ptr cs:[rax + rax]
0x14006d480: mov r13, r15
0x14006d483: mov r8d, 0xf0
0x14006d489: mov rcx, r14
0x14006d48c: mov rdx, rsi
0x14006d48f: call 0x145d145fb
0x14006d494: add r15, 2
0x14006d498: movabs rax, 0xffffffffffffffe
0x14006d4a2: xor r13, rax
0x14006d4a5: imul rdx, r13, 0xf0
0x14006d4ac: add rdx, rbp
0x14006d4af: lea rcx, [r14 + 0xf0]
0x14006d4b6: mov r8d, 0xf0
0x14006d4bc: call 0x145d145fb
0x14006d4c1: add r14, 0x1e0
0x14006d4c8: add rsi, -0x1e0
0x14006d4cf: cmp qword ptr [rsp + 0x78], r15
0x14006d4d4: jne 0x14006d480
0x14006d4d6: mov rdx, qword ptr [rsp + 0x88]
0x14006d4de: test dl, 1
0x14006d4e1: mov r13, qword ptr [rsp + 0x40]
0x14006d4e6: mov rcx, qword ptr [rsp + 0x68]
0x14006d4eb: je 0x14006d51d
0x14006d4ed: imul rax, r15, 0xf0
0x14006d4f4: not r15
0x14006d4f7: imul r8, r15, 0xf0
0x14006d4fe: mov rsi, rdx
0x14006d501: mov rdx, qword ptr [rsp + 0x80]
0x14006d509: add rdx, r8
0x14006d50c: add rcx, rax
0x14006d50f: mov r8d, 0xf0
0x14006d515: call 0x145d145fb
0x14006d51a: mov rdx, rsi
0x14006d51d: test rbx, rbx
0x14006d520: mov rsi, qword ptr [rsp + 0x60]
0x14006d525: mov ebp, dword ptr [rsp + 0x54]
0x14006d529: mov r14, qword ptr [rsp + 0x48]
0x14006d52e: mov r15, qword ptr [rsp + 0x90]
0x14006d536: je 0x14006d590
0x14006d538: cmp r14, rbx
0x14006d53b: jb 0x14006d7e6
0x14006d541: mov rcx, qword ptr [rsp + 0x58]
0x14006d546: add rcx, r13
0x14006d549: mov rax, qword ptr [rsp + 0x200]
0x14006d551: mov qword ptr [rsp + 0x30], rax
0x14006d556: lea rax, [rsp + 0x98]
0x14006d55e: mov qword ptr [rsp + 0x28], rax
0x14006d563: mov dword ptr [rsp + 0x20], ebp
0x14006d567: mov r8, rdi
0x14006d56a: mov r9, rsi
0x14006d56d: call 0x14006d1a0
0x14006d572: mov r14, rbx
0x14006d575: cmp rbx, 0x21
0x14006d579: jae 0x14006d210
0x14006d57f: jmp 0x14006d1c5
0x14006d584: nop word ptr cs:[rax + rax]
0x14006d590: cmp rsi, r14
0x14006d593: jb 0x14006d7fe
0x14006d599: imul rax, r14, 0xf0
0x14006d5a0: mov qword ptr [rsp + 0x58], rax
0x14006d5a5: lea rbp, [rdi + rax]
0x14006d5a9: xor r14d, r14d
0x14006d5ac: nop dword ptr [rax]
0x14006d5b0: mov rsi, r15
0x14006d5b3: imul rbx, r15, 0xf0
0x14006d5ba: add rbx, qword ptr [rsp + 0x40]
0x14006d5bf: cmp r13, rbx
0x14006d5c2: jae 0x14006d62a
0x14006d5c4: nop word ptr cs:[rax + rax]
0x14006d5d0: mov r15, r14
0x14006d5d3: cmp qword ptr [r12 + 0xd0], 0
0x14006d5dc: sete al
0x14006d5df: cmp qword ptr [r13 + 0xd0], 0
0x14006d5e7: setne r14b
0x14006d5eb: or r14b, al
0x14006d5ee: add rbp, -0xf0
0x14006d5f5: test r14b, r14b
0x14006d5f8: mov rax, rbp
0x14006d5fb: cmovne rax, rdi
0x14006d5ff: imul rcx, r15, 0xf0
0x14006d606: add rcx, rax
0x14006d609: mov r8d, 0xf0
0x14006d60f: mov rdx, r13
0x14006d612: call 0x145d145fb
0x14006d617: movzx r14d, r14b
0x14006d61b: add r14, r15
0x14006d61e: add r13, 0xf0
0x14006d625: cmp r13, rbx
0x14006d628: jb 0x14006d5d0
0x14006d62a: mov r15, qword ptr [rsp + 0x48]
0x14006d62f: cmp rsi, r15
0x14006d632: je 0x14006d670
0x14006d634: add rbp, -0xf0
0x14006d63b: imul rcx, r14, 0xf0
0x14006d642: add rcx, rdi
0x14006d645: mov r8d, 0xf0
0x14006d64b: mov rdx, r13
0x14006d64e: call 0x145d145fb
0x14006d653: inc r14
0x14006d656: add r13, 0xf0
0x14006d65d: jmp 0x14006d5b0
0x14006d662: nop word ptr cs:[rax + rax]
0x14006d670: imul r12, r14, 0xf0
0x14006d677: mov r13, qword ptr [rsp + 0x40]
0x14006d67c: mov rcx, r13
0x14006d67f: mov rdx, rdi
0x14006d682: mov r8, r12
0x14006d685: call 0x145d145fb
0x14006d68a: mov rbx, r15
0x14006d68d: sub rbx, r14
0x14006d690: mov rdx, qword ptr [rsp + 0x58]
0x14006d695: lea rbp, [rdi + rdx]
0x14006d699: je 0x14006d7d7
0x14006d69f: add r13, r12
0x14006d6a2: lea rax, [r14 + 1]
0x14006d6a6: cmp r15, rax
0x14006d6a9: jne 0x14006d6b3
0x14006d6ab: xor r15d, r15d
0x14006d6ae: jmp 0x14006d74a
0x14006d6b3: mov rax, rbx
0x14006d6b6: and rax, 0xfffffffffffffffe
0x14006d6ba: mov qword ptr [rsp + 0x78], rax
0x14006d6bf: lea rax, [rdi - 0xf0]
0x14006d6c6: add rdx, rax
0x14006d6c9: mov qword ptr [rsp + 0x40], r13
0x14006d6ce: mov r12, r13
0x14006d6d1: xor r15d, r15d
0x14006d6d4: nop word ptr cs:[rax + rax]
0x14006d6e0: mov r13, rbp
0x14006d6e3: mov rbp, r15
0x14006d6e6: mov r8d, 0xf0
0x14006d6ec: mov rcx, r12
0x14006d6ef: mov rsi, rdx
0x14006d6f2: call 0x145d145fb
0x14006d6f7: add r15, 2
0x14006d6fb: movabs rax, 0xffffffffffffffe
0x14006d705: xor rbp, rax
0x14006d708: imul rdx, rbp, 0xf0
0x14006d70f: mov rbp, r13
0x14006d712: add rdx, r13
0x14006d715: lea rcx, [r12 + 0xf0]
0x14006d71d: mov r8d, 0xf0
0x14006d723: call 0x145d145fb
0x14006d728: mov rdx, rsi
0x14006d72b: add r12, 0x1e0
0x14006d732: add rdx, -0x1e0
0x14006d739: cmp qword ptr [rsp + 0x78], r15
0x14006d73e: jne 0x14006d6e0
0x14006d740: test bl, 1
0x14006d743: mov r13, qword ptr [rsp + 0x40]
0x14006d748: je 0x14006d76f
0x14006d74a: imul rcx, r15, 0xf0
0x14006d751: not r15
0x14006d754: imul rax, r15, 0xf0
0x14006d75b: add rbp, rax
0x14006d75e: add rcx, r13
0x14006d761: mov r8d, 0xf0
0x14006d767: mov rdx, rbp
0x14006d76a: call 0x145d145fb
0x14006d76f: mov rdx, qword ptr [rsp + 0x48]
0x14006d774: cmp rdx, r14
0x14006d777: jb 0x14006d800
0x14006d77d: mov eax, 0
0x14006d782: mov qword ptr [rsp + 0x70], rax
0x14006d787: cmp rbx, 0x21
0x14006d78b: mov rsi, qword ptr [rsp + 0x60]
0x14006d790: mov ebp, dword ptr [rsp + 0x54]
0x14006d794: jae 0x14006d201
0x14006d79a: jmp 0x14006d1c5
0x14006d79f: mov rax, qword ptr [rsp + 0x200]
0x14006d7a7: mov qword ptr [rsp + 0x28], rax
0x14006d7ac: mov byte ptr [rsp + 0x20], 1
0x14006d7b1: mov rcx, r13
0x14006d7b4: mov rdx, r14
0x14006d7b7: mov r8, rdi
0x14006d7ba: mov r9, rsi
0x14006d7bd: call 0x1400f8f00
0x14006d7c2: nop
0x14006d7c3: add rsp, 0x188
0x14006d7ca: pop rbx
0x14006d7cb: pop rbp
0x14006d7cc: pop rdi
0x14006d7cd: pop rsi
0x14006d7ce: pop r12
0x14006d7d0: pop r13
0x14006d7d2: pop r14
0x14006d7d4: pop r15
0x14006d7d6: ret
0x14006d7d7: add r13, rdx
0x14006d7da: xor ebx, ebx
0x14006d7dc: mov rsi, qword ptr [rsp + 0x60]
0x14006d7e1: jmp 0x14006d1c5
0x14006d7e6: lea rcx, [rip + 0x5e76b2f]
0x14006d7ed: lea r8, [rip + 0x5e7679c]
0x14006d7f4: mov edx, 0x13
0x14006d7f9: call 0x145eb7540
0x14006d7fe: ud2
0x14006d800: lea r9, [rip + 0x5e767a1]
0x14006d807: mov rcx, r14
0x14006d80a: mov r8, rdx
0x14006d80d: call 0x145eb7570
0x14006d812: ud2
