0x145891330: push rbp
0x145891331: push rsi
0x145891332: push rdi
0x145891333: sub rsp, 0xc0
0x14589133a: lea rbp, [rsp + 0x80]
0x145891342: movaps xmmword ptr [rbp + 0x30], xmm6
0x145891346: mov qword ptr [rbp + 0x28], 0xfffffffffffffffe
0x14589134e: mov al, 1
0x145891350: cmp qword ptr [rcx + 0x1590], -1
0x145891358: jne 0x14589150a
0x14589135e: cmp qword ptr [rcx + 0x16d8], -1
0x145891366: je 0x1458914e6
0x14589136c: movaps xmm6, xmm1
0x14589136f: mov rdi, rcx
0x145891372: lea rdx, [rcx + 0x16d8]
0x145891379: lea rcx, [rbp - 0x28]
0x14589137d: call 0x145ce7810
0x145891382: nop
0x145891383: lea rcx, [rbp - 0x10]
0x145891387: call 0x1458e2590
0x14589138c: nop
0x14589138d: mov rsi, qword ptr [rbp - 0x20]
0x145891391: mov r8, qword ptr [rbp - 0x18]
0x145891395: mov byte ptr [rbp + 0x27], 1
0x145891399: lea rcx, [rbp - 0x58]
0x14589139d: mov rdx, rsi
0x1458913a0: call 0x1458544c0
0x1458913a5: nop
0x1458913a6: call 0x140002200
0x1458913ab: mov ecx, 0x30
0x1458913b0: mov edx, 8
0x1458913b5: call 0x1400021c0
0x1458913ba: test rax, rax
0x1458913bd: je 0x145891519
0x1458913c3: movups xmm0, xmmword ptr [rbp - 0x58]
0x1458913c7: movups xmm1, xmmword ptr [rbp - 0x48]
0x1458913cb: movups xmm2, xmmword ptr [rbp - 0x38]
0x1458913cf: movups xmmword ptr [rax + 0x20], xmm2
0x1458913d3: movups xmmword ptr [rax + 0x10], xmm1
0x1458913d7: movups xmmword ptr [rax], xmm0
0x1458913da: mov r8, qword ptr [rbp - 8]
0x1458913de: mov r9, qword ptr [rbp]
0x1458913e2: mov byte ptr [rbp + 0x27], 1
0x1458913e6: lea rdx, [rip + 0x179fa13]
0x1458913ed: mov rcx, rax
0x1458913f0: call 0x14581e050
0x1458913f5: mov qword ptr [rbp + 8], rax
0x1458913f9: movsd qword ptr [rbp + 0x18], xmm6
0x1458913fe: mov qword ptr [rbp + 0x10], rdi
0x145891402: lea rcx, [rdi + 0x1590]
0x145891409: cmp qword ptr [rcx], -1
0x14589140d: je 0x145891415
0x14589140f: call 0x145871650
0x145891414: nop
0x145891415: mov rcx, qword ptr [rbp + 0x10]
0x145891419: mov qword ptr [rcx + 0x1590], 0
0x145891424: mov qword ptr [rcx + 0x1598], 1
0x14589142f: mov qword ptr [rcx + 0x15a0], 0
0x14589143a: movups xmm0, xmmword ptr [rbp - 0x10]
0x14589143e: movups xmmword ptr [rcx + 0x15a8], xmm0
0x145891445: mov rax, qword ptr [rbp]
0x145891449: mov qword ptr [rcx + 0x15b8], rax
0x145891450: mov qword ptr [rcx + 0x15c0], 0xffffffffffffffff
0x14589145b: mov qword ptr [rcx + 0x15d8], 0xffffffffffffffff
0x145891466: mov qword ptr [rcx + 0x1628], 0xffffffffffffffff
0x145891471: mov qword ptr [rcx + 0x16a0], 0xffffffffffffffff
0x14589147c: mov rax, qword ptr [rbp + 8]
0x145891480: mov qword ptr [rcx + 0x16b8], rax
0x145891487: movsd xmm0, qword ptr [rbp + 0x18]
0x14589148c: movsd qword ptr [rcx + 0x16c0], xmm0
0x145891494: movsd qword ptr [rcx + 0x16c8], xmm0
0x14589149c: mov word ptr [rcx + 0x16d0], 0x500
0x1458914a5: mov byte ptr [rbp + 0x27], 0
0x1458914a9: mov qword ptr [rsp + 0x20], 0
0x1458914b2: lea rdx, [rip + 0x179b851]
0x1458914b9: mov r8d, 0xa
0x1458914bf: mov r9d, 1
0x1458914c5: call 0x145893140
0x1458914ca: nop
0x1458914cb: mov rdx, qword ptr [rbp - 0x28]
0x1458914cf: test rdx, rdx
0x1458914d2: je 0x1458914e2
0x1458914d4: mov r8d, 1
0x1458914da: mov rcx, rsi
0x1458914dd: call 0x1400021d0
0x1458914e2: mov al, 1
0x1458914e4: jmp 0x14589150a
0x1458914e6: mov qword ptr [rsp + 0x20], 0x1b
0x1458914ef: lea rdx, [rip + 0x179b7ee]
0x1458914f6: lea r9, [rip + 0x179b7f2]
0x1458914fd: mov r8d, 0xb
0x145891503: call 0x145893140
0x145891508: xor eax, eax
0x14589150a: movaps xmm6, xmmword ptr [rbp + 0x30]
0x14589150e: add rsp, 0xc0
0x145891515: pop rdi
0x145891516: pop rsi
0x145891517: pop rbp
0x145891518: ret
0x145891519: mov ecx, 8
0x14589151e: mov edx, 0x30
0x145891523: call 0x145eb6fb1
0x145891528: nop
0x145891529: ud2
