0x14584b280: push rbp
0x14584b281: push rsi
0x14584b282: push rdi
0x14584b283: sub rsp, 0xc0
0x14584b28a: lea rbp, [rsp + 0x80]
0x14584b292: mov qword ptr [rbp + 0x38], 0xfffffffffffffffe
0x14584b29a: mov qword ptr [rbp + 0x28], rdx
0x14584b29e: mov rsi, rcx
0x14584b2a1: mov rdx, qword ptr [rbp + 0x80]
0x14584b2a8: mov byte ptr [rbp + 0x36], r8b
0x14584b2ac: mov rcx, r9
0x14584b2af: call 0x1458095e0
0x14584b2b4: mov qword ptr [rbp + 0x20], rax
0x14584b2b8: lea rax, [rbp + 0x36]
0x14584b2bc: mov qword ptr [rbp - 0x58], rax
0x14584b2c0: lea rax, [rbp + 0x20]
0x14584b2c4: mov qword ptr [rbp - 0x50], rax
0x14584b2c8: mov qword ptr [rbp - 0x48], 0
0x14584b2d0: mov qword ptr [rbp - 0x40], 5
0x14584b2d8: mov qword ptr [rbp - 0x38], 0
0x14584b2e0: mov qword ptr [rbp - 0x18], 0
0x14584b2e8: mov byte ptr [rbp + 0x37], 1
0x14584b2ec: lea rdi, [rbp + 8]
0x14584b2f0: lea rdx, [rbp - 0x58]
0x14584b2f4: mov rcx, rdi
0x14584b2f7: call 0x1400e27e0
0x14584b2fc: nop
0x14584b2fd: mov rdx, qword ptr [rbp + 0x28]
0x14584b301: mov rax, qword ptr [rdx]
0x14584b304: mov rcx, qword ptr [rdx + 8]
0x14584b308: mov rdx, qword ptr [rdx + 0x10]
0x14584b30c: lea rdx, [rcx + rdx*4]
0x14584b310: mov qword ptr [rbp - 0x58], rcx
0x14584b314: mov qword ptr [rbp - 0x50], rcx
0x14584b318: mov qword ptr [rbp - 0x48], rax
0x14584b31c: mov qword ptr [rbp - 0x40], rdx
0x14584b320: mov qword ptr [rbp - 0x38], rdi
0x14584b324: mov qword ptr [rbp - 0x30], 0x10
0x14584b32c: lea rdx, [rbp - 0x58]
0x14584b330: mov rcx, rsi
0x14584b333: call 0x1458e62f0
0x14584b338: nop
0x14584b339: mov rdx, qword ptr [rbp + 8]
0x14584b33d: test rdx, rdx
0x14584b340: je 0x14584b355
0x14584b342: mov rcx, qword ptr [rbp + 0x10]
0x14584b346: shl rdx, 2
0x14584b34a: mov r8d, 4
0x14584b350: call 0x1400021d0
0x14584b355: mov rax, rsi
0x14584b358: add rsp, 0xc0
0x14584b35f: pop rdi
0x14584b360: pop rsi
0x14584b361: pop rbp
0x14584b362: ret
