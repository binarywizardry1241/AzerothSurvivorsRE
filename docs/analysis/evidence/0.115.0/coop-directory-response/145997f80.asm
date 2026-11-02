0x145997f80: push rbp
0x145997f81: push r15
0x145997f83: push r14
0x145997f85: push r13
0x145997f87: push r12
0x145997f89: push rsi
0x145997f8a: push rdi
0x145997f8b: push rbx
0x145997f8c: sub rsp, 0x1b8
0x145997f93: lea rbp, [rsp + 0x80]
0x145997f9b: movaps xmmword ptr [rbp + 0x120], xmm6
0x145997fa2: mov qword ptr [rbp + 0x118], 0xfffffffffffffffe
0x145997fad: mov rsi, r9
0x145997fb0: mov rdi, r8
0x145997fb3: mov r12, rdx
0x145997fb6: mov qword ptr [rbp - 0x28], rcx
0x145997fba: call 0x140002200
0x145997fbf: mov ecx, 1
0x145997fc4: mov edx, 1
0x145997fc9: call 0x1400021c0
0x145997fce: test rax, rax
0x145997fd1: je 0x14599906d
0x145997fd7: mov rcx, qword ptr [rbp + 0x1a0]
0x145997fde: mov byte ptr [rax], 0x5b
0x145997fe1: imul rdx, rdi, 0xc8
0x145997fe8: add rdx, r12
0x145997feb: mov qword ptr [rbp - 0x40], rdx
0x145997fef: movzx r13d, byte ptr [rcx]
0x145997ff3: lea rdi, [rbp + 0x109]
0x145997ffa: mov rbx, qword ptr [rsi + 0x20]
0x145997ffe: mov rcx, qword ptr [rsi + 0x28]
0x145998002: shl rcx, 4
0x145998006: mov qword ptr [rbp - 0x38], rcx
0x14599800a: mov byte ptr [rbp + 0x114], 1
0x145998011: lea rdx, [rbp + 0xf0]
0x145998018: lea r14, [rbp + 0xb0]
0x14599801f: movsd xmm6, qword ptr [rip + 0x54bc61]
0x145998027: mov ecx, 1
0x14599802c: mov qword ptr [rbp + 0x60], rcx
0x145998030: mov qword ptr [rbp + 0x78], rcx
0x145998034: mov byte ptr [rbp + 0xd7], r13b
0x14599803b: mov qword ptr [rbp - 0x30], rbx
0x14599803f: mov qword ptr [rbp + 0x58], rax
0x145998043: cmp r12, qword ptr [rbp - 0x40]
0x145998047: je 0x145998e55
0x14599804d: nop dword ptr [rax]
0x145998050: movzx eax, byte ptr [r12 + 0xc2]
0x145998059: dec al
0x14599805b: cmp al, 0xb
0x14599805d: mov qword ptr [rbp + 0xa0], r12
0x145998064: jae 0x145998140
0x14599806a: movzx eax, al
0x14599806d: mov ecx, 0x5df
0x145998072: bt ecx, eax
0x145998075: jae 0x145998140
0x14599807b: lea rcx, [rip + 0x19a1d9e]
0x145998082: mov rsi, qword ptr [rcx + rax*8]
0x145998086: lea rax, [rsi + 0x10]
0x14599808a: mov qword ptr [rbp + 0xb0], rax
0x145998091: lea rax, [rip - 0x5995fd8]
0x145998098: mov qword ptr [rbp + 0xb8], rax
0x14599809f: mov byte ptr [rbp + 0x115], 1
0x1459980a6: mov rcx, rdx
0x1459980a9: lea rdx, [rip + 0x131cd72]
0x1459980b0: mov r8, r14
0x1459980b3: call 0x145ce7350
0x1459980b8: nop
0x1459980b9: mov rcx, qword ptr [rbp + 0xf8]
0x1459980c0: mov rdx, qword ptr [rbp + 0x100]
0x1459980c7: mov rax, qword ptr [rsi + 0x20]
0x1459980cb: mov qword ptr [rbp + 0x88], rax
0x1459980d2: mov rbx, qword ptr [rsi + 0x28]
0x1459980d6: mov qword ptr [rbp + 0xe8], rcx
0x1459980dd: call 0x1458dff90
0x1459980e2: nop
0x1459980e3: mov rsi, rax
0x1459980e6: mov rcx, rdx
0x1459980e9: mov rdx, qword ptr [rbp + 0xf0]
0x1459980f0: test rdx, rdx
0x1459980f3: je 0x14599810d
0x1459980f5: mov r8d, 1
0x1459980fb: mov r13, rcx
0x1459980fe: mov rcx, qword ptr [rbp + 0xe8]
0x145998105: call 0x1400021d0
0x14599810a: mov rcx, r13
0x14599810d: test rsi, rsi
0x145998110: mov rax, qword ptr [rbp + 0x88]
0x145998117: cmovne rax, rsi
0x14599811b: mov qword ptr [rbp + 0x88], rax
0x145998122: cmove rcx, rbx
0x145998126: mov qword ptr [rbp + 0x68], rcx
0x14599812a: lea rdx, [rbp + 0xf0]
0x145998131: mov r12, qword ptr [rbp + 0xa0]
0x145998138: jmp 0x145998154
0x14599813a: nop word ptr [rax + rax]
0x145998140: mov eax, 1
0x145998145: mov qword ptr [rbp + 0x88], rax
0x14599814c: mov qword ptr [rbp + 0x68], 0
0x145998154: mov r15, qword ptr [r12 + 0x68]
0x145998159: mov rcx, qword ptr [r12 + 0x70]
0x14599815e: lea rax, [rcx - 2]
0x145998162: mov qword ptr [rbp + 0xd8], r15
0x145998169: mov qword ptr [rbp + 0x80], rcx
0x145998170: cmp rax, 6
0x145998174: ja 0x14599843b
0x14599817a: lea rcx, [rip + 0x19a1cf7]
0x145998181: movsxd rax, dword ptr [rcx + rax*4]
0x145998185: add rax, rcx
0x145998188: jmp rax
0x14599818a: movzx eax, word ptr [rip + 0x13209e8]
0x145998191: lea rsi, [rip + 0x1328f30]
0x145998198: mov rcx, qword ptr [rbp + 0xd8]
0x14599819f: cmp ax, word ptr [rcx]
0x1459981a2: je 0x1459983a9
0x1459981a8: movzx eax, word ptr [rip + 0x1323669]
0x1459981af: lea rsi, [rip + 0x13291e2]
0x1459981b6: mov rcx, qword ptr [rbp + 0xd8]
0x1459981bd: cmp ax, word ptr [rcx]
0x1459981c0: je 0x1459983a9
0x1459981c6: movzx eax, word ptr [rip + 0x1324705]
0x1459981cd: lea rsi, [rip + 0x13292b4]
0x1459981d4: mov rcx, qword ptr [rbp + 0xd8]
0x1459981db: cmp ax, word ptr [rcx]
0x1459981de: je 0x1459983a9
0x1459981e4: movzx eax, word ptr [rip + 0x13268b4]
0x1459981eb: lea rsi, [rip + 0x1329476]
0x1459981f2: mov rcx, qword ptr [rbp + 0xd8]
0x1459981f9: cmp ax, word ptr [rcx]
0x1459981fc: jne 0x14599836a
0x145998202: jmp 0x1459983a9
0x145998207: movzx eax, word ptr [rip + 0x131ecf0]
0x14599820e: mov r8, qword ptr [rbp + 0xd8]
0x145998215: xor ax, word ptr [r8]
0x145998219: movzx ecx, byte ptr [rip + 0x131ece0]
0x145998220: xor cl, byte ptr [r8 + 2]
0x145998224: movzx ecx, cl
0x145998227: or cx, ax
0x14599822a: lea rsi, [rip + 0x1328cb7]
0x145998231: je 0x1459983a9
0x145998237: movzx eax, word ptr [rip + 0x1325563]
0x14599823e: mov r8, qword ptr [rbp + 0xd8]
0x145998245: xor ax, word ptr [r8]
0x145998249: movzx ecx, byte ptr [rip + 0x1325553]
0x145998250: xor cl, byte ptr [r8 + 2]
0x145998254: movzx ecx, cl
0x145998257: or cx, ax
0x14599825a: lea rsi, [rip + 0x1329317]
0x145998261: jne 0x14599836a
0x145998267: jmp 0x1459983a9
0x14599826c: mov eax, dword ptr [rip + 0x131cdbe]
0x145998272: mov r8, qword ptr [rbp + 0xd8]
0x145998279: xor eax, dword ptr [r8]
0x14599827c: movzx ecx, word ptr [rip + 0x131cdb1]
0x145998283: xor cx, word ptr [r8 + 4]
0x145998288: movzx ecx, cx
0x14599828b: or ecx, eax
0x14599828d: lea rsi, [rip + 0x1328a74]
0x145998294: je 0x1459983a9
0x14599829a: mov eax, dword ptr [rip + 0x131fa7f]
0x1459982a0: mov r8, qword ptr [rbp + 0xd8]
0x1459982a7: xor eax, dword ptr [r8]
0x1459982aa: movzx ecx, word ptr [rip + 0x131fa72]
0x1459982b1: xor cx, word ptr [r8 + 4]
0x1459982b6: movzx ecx, cx
0x1459982b9: or ecx, eax
0x1459982bb: lea rsi, [rip + 0x1328d16]
0x1459982c2: jne 0x1459982e7
0x1459982c4: jmp 0x1459983a9
0x1459982c9: mov rax, qword ptr [rip + 0x131dde3]
0x1459982d0: lea rsi, [rip + 0x1328b21]
0x1459982d7: mov rcx, qword ptr [rbp + 0xd8]
0x1459982de: cmp rax, qword ptr [rcx]
0x1459982e1: je 0x1459983a9
0x1459982e7: cmp qword ptr [rbp + 0x80], 4
0x1459982ef: je 0x145998385
0x1459982f5: cmp qword ptr [rbp + 0x80], 5
0x1459982fd: je 0x145998341
0x1459982ff: mov r15, qword ptr [rbp + 0xd8]
0x145998306: mov rax, qword ptr [rbp + 0x80]
0x14599830d: mov rcx, rax
0x145998310: cmp rax, 7
0x145998314: jne 0x14599843b
0x14599831a: mov eax, dword ptr [rip + 0x13216a0]
0x145998320: mov r8, qword ptr [rbp + 0xd8]
0x145998327: xor eax, dword ptr [r8]
0x14599832a: mov ecx, dword ptr [rip + 0x1321693]
0x145998330: xor ecx, dword ptr [r8 + 3]
0x145998334: or ecx, eax
0x145998336: lea rsi, [rip + 0x1328e7b]
0x14599833d: jne 0x14599836a
0x14599833f: jmp 0x1459983a9
0x145998341: mov eax, dword ptr [rip + 0x1322597]
0x145998347: mov r8, qword ptr [rbp + 0xd8]
0x14599834e: xor eax, dword ptr [r8]
0x145998351: movzx ecx, byte ptr [rip + 0x132258a]
0x145998358: xor cl, byte ptr [r8 + 4]
0x14599835c: movzx ecx, cl
0x14599835f: or ecx, eax
0x145998361: lea rsi, [rip + 0x1328f40]
0x145998368: je 0x1459983a9
0x14599836a: mov r15, qword ptr [rbp + 0xd8]
0x145998371: mov rax, qword ptr [rbp + 0x80]
0x145998378: mov rcx, rax
0x14599837b: cmp rax, 4
0x14599837f: jne 0x14599843b
0x145998385: mov eax, dword ptr [rip + 0x13275a7]
0x14599838b: lea rsi, [rip + 0x13293c6]
0x145998392: mov rcx, qword ptr [rbp + 0xd8]
0x145998399: mov r15, rcx
0x14599839c: cmp eax, dword ptr [rcx]
0x14599839e: mov ecx, 4
0x1459983a3: jne 0x14599843b
0x1459983a9: lea rax, [rsi + 8]
0x1459983ad: mov qword ptr [rbp + 0xb0], rax
0x1459983b4: lea rax, [rip - 0x59962fb]
0x1459983bb: mov qword ptr [rbp + 0xb8], rax
0x1459983c2: mov byte ptr [rbp + 0x115], 1
0x1459983c9: mov rcx, rdx
0x1459983cc: lea rdx, [rip + 0x131cb23]
0x1459983d3: mov r8, r14
0x1459983d6: call 0x145ce7350
0x1459983db: nop
0x1459983dc: mov rcx, qword ptr [rbp + 0xf8]
0x1459983e3: mov rdx, qword ptr [rbp + 0x100]
0x1459983ea: mov r15, qword ptr [rsi + 0x18]
0x1459983ee: mov rsi, qword ptr [rsi + 0x20]
0x1459983f2: mov qword ptr [rbp + 0xe8], rcx
0x1459983f9: call 0x1458dff90
0x1459983fe: nop
0x1459983ff: mov r14, rax
0x145998402: mov rcx, rdx
0x145998405: mov rdx, qword ptr [rbp + 0xf0]
0x14599840c: test rdx, rdx
0x14599840f: je 0x145998429
0x145998411: mov r8d, 1
0x145998417: mov rbx, rcx
0x14599841a: mov rcx, qword ptr [rbp + 0xe8]
0x145998421: call 0x1400021d0
0x145998426: mov rcx, rbx
0x145998429: test r14, r14
0x14599842c: cmovne r15, r14
0x145998430: cmove rcx, rsi
0x145998434: lea r14, [rbp + 0xb0]
0x14599843b: mov qword ptr [rbp - 0x50], rcx
0x14599843f: mov rbx, qword ptr [r12 + 0x98]
0x145998447: mov r13, qword ptr [r12 + 0xa0]
0x14599844f: call 0x140002200
0x145998454: mov ecx, 1
0x145998459: mov edx, 1
0x14599845e: call 0x1400021c0
0x145998463: test rax, rax
0x145998466: je 0x145999026
0x14599846c: mov qword ptr [rbp - 0x48], r15
0x145998470: mov qword ptr [rbp + 0x98], rax
0x145998477: mov byte ptr [rax], 0x5b
0x14599847a: test r13, r13
0x14599847d: je 0x1459986e0
0x145998483: mov r12b, 1
0x145998486: mov eax, 1
0x14599848b: mov qword ptr [rbp + 0xe8], rax
0x145998492: mov edx, 1
0x145998497: xor r15d, r15d
0x14599849a: jmp 0x1459984cb
0x14599849c: nop dword ptr [rax]
0x1459984a0: mov rdx, rsi
0x1459984a3: add rdx, r14
0x1459984a6: mov eax, dword ptr [rbp + 0xb0]
0x1459984ac: mov ecx, dword ptr [rbp + 0xb3]
0x1459984b2: mov dword ptr [rbp + 0x30], eax
0x1459984b5: mov dword ptr [rbp + 0x33], ecx
0x1459984b8: inc r15
0x1459984bb: cmp r15, r13
0x1459984be: lea r14, [rbp + 0xb0]
0x1459984c5: je 0x1459986c0
0x1459984cb: mov rax, qword ptr [rbp + 0xe8]
0x1459984d2: mov qword ptr [rbp + 0xf0], rax
0x1459984d9: mov rax, qword ptr [rbp + 0x98]
0x1459984e0: mov qword ptr [rbp + 0xf8], rax
0x1459984e7: mov rsi, rdx
0x1459984ea: mov qword ptr [rbp + 0x100], rdx
0x1459984f1: mov byte ptr [rbp + 0x108], r12b
0x1459984f8: mov eax, dword ptr [rbp + 0x30]
0x1459984fb: mov ecx, dword ptr [rbp + 0x33]
0x1459984fe: mov dword ptr [rdi + 3], ecx
0x145998501: mov dword ptr [rdi], eax
0x145998503: movzx ecx, byte ptr [rbx + r15]
0x145998508: cvtsi2sd xmm0, ecx
0x14599850c: ucomisd xmm0, xmm6
0x145998510: movabs rax, 0x7fffffffffffffff
0x14599851a: ja 0x14599851f
0x14599851c: mov rax, rcx
0x14599851f: ucomisd xmm0, xmm0
0x145998523: mov ecx, 0
0x145998528: cmovnp rcx, rax
0x14599852c: mov qword ptr [rbp - 0x20], rcx
0x145998530: lea rax, [rbp - 0x20]
0x145998534: mov qword ptr [rbp], rax
0x145998538: lea rax, [rip + 0x361881]
0x14599853f: mov qword ptr [rbp + 8], rax
0x145998543: mov rdi, qword ptr [rbp + 0xe8]
0x14599854a: mov qword ptr [rbp + 0x28], rdi
0x14599854e: mov byte ptr [rbp + 0x113], 0
0x145998555: mov rcx, r14
0x145998558: lea rdx, [rip + 0x1674da5]
0x14599855f: mov r8, rbp
0x145998562: call 0x145ce7350
0x145998567: nop
0x145998568: mov rax, qword ptr [rbp + 0xb0]
0x14599856f: mov qword ptr [rbp + 0x50], rax
0x145998573: mov rax, qword ptr [rbp + 0xb8]
0x14599857a: mov qword ptr [rbp + 0xa8], rax
0x145998581: mov r14, qword ptr [rbp + 0xc0]
0x145998588: test r12b, 1
0x14599858c: jne 0x1459985ac
0x14599858e: cmp rdi, rsi
0x145998591: je 0x145998675
0x145998597: mov rax, qword ptr [rbp + 0x98]
0x14599859e: mov byte ptr [rax + rsi], 0x2c
0x1459985a2: inc rsi
0x1459985a5: mov qword ptr [rbp + 0x100], rsi
0x1459985ac: mov byte ptr [rbp + 0x108], 0
0x1459985b3: mov rax, rdi
0x1459985b6: sub rax, rsi
0x1459985b9: cmp r14, rax
0x1459985bc: ja 0x145998638
0x1459985be: mov qword ptr [rbp + 0xe8], rdi
0x1459985c5: xor r12d, r12d
0x1459985c8: mov rdi, qword ptr [rbp + 0xf8]
0x1459985cf: test r14, r14
0x1459985d2: je 0x1459985f5
0x1459985d4: lea rcx, [rdi + rsi]
0x1459985d8: mov rdx, qword ptr [rbp + 0xa8]
0x1459985df: mov r8, r14
0x1459985e2: call 0x145d145fb
0x1459985e7: mov rax, qword ptr [rbp + 0xf0]
0x1459985ee: mov qword ptr [rbp + 0xe8], rax
0x1459985f5: mov qword ptr [rbp + 0x98], rdi
0x1459985fc: lea rdi, [rbp + 0x109]
0x145998603: mov eax, dword ptr [rdi]
0x145998605: mov ecx, dword ptr [rdi + 3]
0x145998608: mov dword ptr [rbp + 0xb3], ecx
0x14599860e: mov dword ptr [rbp + 0xb0], eax
0x145998614: mov rdx, qword ptr [rbp + 0x50]
0x145998618: test rdx, rdx
0x14599861b: je 0x1459984a0
0x145998621: mov r8d, 1
0x145998627: mov rcx, qword ptr [rbp + 0xa8]
0x14599862e: call 0x1400021d0
0x145998633: jmp 0x1459984a0
0x145998638: mov qword ptr [rsp + 0x20], 1
0x145998641: mov r9d, 1
0x145998647: lea rcx, [rbp + 0xf0]
0x14599864e: mov rdx, rsi
0x145998651: mov r8, r14
0x145998654: call 0x145d14a10
0x145998659: nop
0x14599865a: mov rdi, qword ptr [rbp + 0xf8]
0x145998661: mov rsi, qword ptr [rbp + 0x100]
0x145998668: movzx r12d, byte ptr [rbp + 0x108]
0x145998670: jmp 0x1459985d4
0x145998675: mov qword ptr [rsp + 0x20], 1
0x14599867e: mov r8d, 1
0x145998684: mov r9d, 1
0x14599868a: lea rcx, [rbp + 0xf0]
0x145998691: mov rdx, rdi
0x145998694: call 0x145d14a10
0x145998699: nop
0x14599869a: mov rdi, qword ptr [rbp + 0xf0]
0x1459986a1: mov rax, qword ptr [rbp + 0xf8]
0x1459986a8: mov qword ptr [rbp + 0x98], rax
0x1459986af: jmp 0x145998597
0x1459986b4: nop word ptr cs:[rax + rax]
0x1459986c0: mov qword ptr [rbp + 0xa8], rdx
0x1459986c7: mov eax, dword ptr [rbp + 0x30]
0x1459986ca: mov ecx, dword ptr [rbp + 0x33]
0x1459986cd: mov dword ptr [rbp + 0x73], ecx
0x1459986d0: mov dword ptr [rbp + 0x70], eax
0x1459986d3: jmp 0x1459986f6
0x1459986d5: nop word ptr cs:[rax + rax]
0x1459986e0: mov eax, 1
0x1459986e5: mov qword ptr [rbp + 0xa8], rax
0x1459986ec: mov r12b, 1
0x1459986ef: mov qword ptr [rbp + 0xe8], rax
0x1459986f6: mov rax, qword ptr [rbp + 0x78]
0x1459986fa: mov qword ptr [rbp - 0x20], rax
0x1459986fe: mov rax, qword ptr [rbp + 0x58]
0x145998702: mov qword ptr [rbp - 0x18], rax
0x145998706: mov rax, qword ptr [rbp + 0x60]
0x14599870a: mov qword ptr [rbp - 0x10], rax
0x14599870e: movzx eax, byte ptr [rbp + 0x114]
0x145998715: mov byte ptr [rbp - 8], al
0x145998718: mov eax, dword ptr [rbp + 0x90]
0x14599871e: mov ecx, dword ptr [rbp + 0x93]
0x145998724: lea rdx, [rbp - 7]
0x145998728: mov dword ptr [rdx + 3], ecx
0x14599872b: mov dword ptr [rdx], eax
0x14599872d: call 0x140002200
0x145998732: mov ecx, 1
0x145998737: mov edx, 1
0x14599873c: call 0x1400021c0
0x145998741: test rax, rax
0x145998744: mov rbx, qword ptr [rbp - 0x38]
0x145998748: je 0x14599903f
0x14599874e: mov byte ptr [rax], 0x7b
0x145998751: mov qword ptr [rbp + 0xf0], 1
0x14599875c: mov qword ptr [rbp + 0xf8], rax
0x145998763: mov qword ptr [rbp + 0x100], 1
0x14599876e: mov byte ptr [rbp + 0x108], 1
0x145998775: mov r15, qword ptr [rbp + 0xa0]
0x14599877c: movups xmm0, xmmword ptr [r15 + 8]
0x145998781: mov r13, qword ptr [rbp + 0xe8]
0x145998788: mov qword ptr [rbp + 0xe0], r13
0x14599878f: mov byte ptr [rbp + 0x117], 1
0x145998796: mov byte ptr [rbp + 0x116], 1
0x14599879d: movups xmmword ptr [rsp + 0x20], xmm0
0x1459987a2: mov r9d, 4
0x1459987a8: mov rcx, r14
0x1459987ab: mov rsi, r14
0x1459987ae: lea r14, [rbp + 0xf0]
0x1459987b5: mov rdx, r14
0x1459987b8: lea r8, [rip + 0x19a0efd]
0x1459987bf: call 0x145858350
0x1459987c4: nop
0x1459987c5: movups xmm0, xmmword ptr [r15 + 0x20]
0x1459987ca: mov qword ptr [rbp + 0xe0], r13
0x1459987d1: mov byte ptr [rbp + 0x117], 1
0x1459987d8: mov byte ptr [rbp + 0x116], 1
0x1459987df: movups xmmword ptr [rsp + 0x20], xmm0
0x1459987e4: mov r9d, 4
0x1459987ea: mov rcx, r14
0x1459987ed: mov rdx, rsi
0x1459987f0: lea r8, [rip + 0x19a0ec9]
0x1459987f7: call 0x145858350
0x1459987fc: nop
0x1459987fd: movups xmm0, xmmword ptr [r15 + 0x38]
0x145998802: mov qword ptr [rbp + 0xe0], r13
0x145998809: mov byte ptr [rbp + 0x117], 1
0x145998810: mov byte ptr [rbp + 0x116], 1
0x145998817: movups xmmword ptr [rsp + 0x20], xmm0
0x14599881c: mov r9d, 0xb
0x145998822: mov rcx, rsi
0x145998825: mov rdx, r14
0x145998828: lea r8, [rip + 0x19a0e95]
0x14599882f: call 0x145858350
0x145998834: nop
0x145998835: movups xmm0, xmmword ptr [r15 + 0xb0]
0x14599883d: mov qword ptr [rbp + 0xe0], r13
0x145998844: mov byte ptr [rbp + 0x117], 1
0x14599884b: mov byte ptr [rbp + 0x116], 1
0x145998852: movups xmmword ptr [rsp + 0x20], xmm0
0x145998857: mov r9d, 9
0x14599885d: mov rcx, rbp
0x145998860: mov rdx, rsi
0x145998863: lea r8, [rip + 0x19a0e65]
0x14599886a: call 0x145858350
0x14599886f: nop
0x145998870: mov qword ptr [rbp + 0xf0], r13
0x145998877: mov r8, qword ptr [rbp + 0x98]
0x14599887e: mov qword ptr [rbp + 0xf8], r8
0x145998885: mov rdx, qword ptr [rbp + 0xa8]
0x14599888c: mov qword ptr [rbp + 0x100], rdx
0x145998893: mov byte ptr [rbp + 0x108], r12b
0x14599889a: mov eax, dword ptr [rbp + 0x70]
0x14599889d: mov ecx, dword ptr [rbp + 0x73]
0x1459988a0: mov dword ptr [rdi + 3], ecx
0x1459988a3: mov dword ptr [rdi], eax
0x1459988a5: mov rax, r8
0x1459988a8: cmp r13, rdx
0x1459988ab: mov r12, rsi
0x1459988ae: je 0x145998d69
0x1459988b4: mov byte ptr [rax + rdx], 0x5d
0x1459988b8: inc rdx
0x1459988bb: mov qword ptr [rbp + 0xc0], rdx
0x1459988c2: mov rax, qword ptr [rbp + 0xf0]
0x1459988c9: mov qword ptr [rbp + 0xb0], rax
0x1459988d0: mov rax, qword ptr [rbp + 0xf8]
0x1459988d7: mov qword ptr [rbp + 0xb8], rax
0x1459988de: mov qword ptr [rbp + 0x20], r13
0x1459988e2: mov byte ptr [rbp + 0x112], 0
0x1459988e9: mov qword ptr [rsp + 0x20], r12
0x1459988ee: mov r9d, 7
0x1459988f4: lea rsi, [rbp + 0xf0]
0x1459988fb: mov rcx, rsi
0x1459988fe: mov rdx, rbp
0x145998901: lea r8, [rip + 0x19a0dd0]
0x145998908: call 0x145858210
0x14599890d: nop
0x14599890e: mov r14, qword ptr [rbp + 0xa0]
0x145998915: movupd xmm0, xmmword ptr [r14 + 0x50]
0x14599891b: mov qword ptr [rbp + 0xe0], r13
0x145998922: mov byte ptr [rbp + 0x117], 1
0x145998929: mov byte ptr [rbp + 0x116], 0
0x145998930: movupd xmmword ptr [rsp + 0x20], xmm0
0x145998936: mov r9d, 4
0x14599893c: mov rcx, r12
0x14599893f: mov rdx, rsi
0x145998942: lea r8, [rip + 0x19a0d96]
0x145998949: call 0x145858350
0x14599894e: nop
0x14599894f: mov qword ptr [rbp + 0xe0], r13
0x145998956: mov byte ptr [rbp + 0x117], 1
0x14599895d: mov byte ptr [rbp + 0x116], 0
0x145998964: mov rax, qword ptr [rbp + 0x68]
0x145998968: mov qword ptr [rsp + 0x28], rax
0x14599896d: mov rax, qword ptr [rbp + 0x88]
0x145998974: mov qword ptr [rsp + 0x20], rax
0x145998979: mov r9d, 5
0x14599897f: mov rcx, rsi
0x145998982: mov rdx, r12
0x145998985: lea r8, [rip + 0x19a0d57]
0x14599898c: call 0x145858350
0x145998991: nop
0x145998992: mov qword ptr [rbp + 0xe0], r13
0x145998999: mov byte ptr [rbp + 0x117], 1
0x1459989a0: mov byte ptr [rbp + 0x116], 0
0x1459989a7: mov rax, qword ptr [rbp - 0x50]
0x1459989ab: mov qword ptr [rsp + 0x28], rax
0x1459989b0: mov rax, qword ptr [rbp - 0x48]
0x1459989b4: mov qword ptr [rsp + 0x20], rax
0x1459989b9: mov r9d, 4
0x1459989bf: mov rcx, r12
0x1459989c2: mov rdx, rsi
0x1459989c5: lea r8, [rip + 0x19a0d1c]
0x1459989cc: call 0x145858350
0x1459989d1: nop
0x1459989d2: lea r13, [r14 + 0xc8]
0x1459989d9: mov rcx, qword ptr [rbp + 0xd8]
0x1459989e0: mov rdx, qword ptr [rbp + 0x80]
0x1459989e7: call 0x1458095e0
0x1459989ec: mov rsi, rax
0x1459989ef: xor eax, eax
0x1459989f1: movzx edx, byte ptr [rbp + 0xd7]
0x1459989f8: mov r8, qword ptr [rbp - 0x30]
0x1459989fc: nop dword ptr [rax]
0x145998a00: cmp rbx, rax
0x145998a03: je 0x145998a40
0x145998a05: lea rcx, [rax + 0x10]
0x145998a09: cmp byte ptr [r8 + rax], dl
0x145998a0d: mov rax, rcx
0x145998a10: jne 0x145998a00
0x145998a12: mov rax, qword ptr [r8 + rcx - 8]
0x145998a17: cmp rax, 0xc
0x145998a1b: mov ebx, 0xc
0x145998a20: cmovb rbx, rax
0x145998a24: test rax, rax
0x145998a27: mov eax, 1
0x145998a2c: cmove rbx, rax
0x145998a30: jmp 0x145998a45
0x145998a32: nop word ptr cs:[rax + rax]
0x145998a40: mov ebx, 1
0x145998a45: mov r8d, 6
0x145998a4b: mov rcx, r12
0x145998a4e: lea rdx, [rip + 0x19a0c97]
0x145998a55: call 0x1458580a0
0x145998a5a: nop
0x145998a5b: cmp rsi, rbx
0x145998a5e: mov r14d, 5
0x145998a64: sbb r14, 0
0x145998a68: mov rax, qword ptr [rbp + 0xb0]
0x145998a6f: mov rcx, qword ptr [rbp + 0xc0]
0x145998a76: sub rax, rcx
0x145998a79: cmp r14, rax
0x145998a7c: ja 0x145998da5
0x145998a82: cmp rsi, rbx
0x145998a85: lea rdx, [rip + 0x16745d9]
0x145998a8c: lea rax, [rip + 0x16745d7]
0x145998a93: cmovb rdx, rax
0x145998a97: add rcx, qword ptr [rbp + 0xb8]
0x145998a9e: mov r8, r14
0x145998aa1: call 0x145d145fb
0x145998aa6: add qword ptr [rbp + 0xc0], r14
0x145998aad: movups xmm0, xmmword ptr [rbp + 0xb0]
0x145998ab4: movaps xmmword ptr [rbp + 0xf0], xmm0
0x145998abb: movups xmm0, xmmword ptr [rbp + 0xc0]
0x145998ac2: movaps xmmword ptr [rbp + 0x100], xmm0
0x145998ac9: mov rbx, qword ptr [rbp + 0xa0]
0x145998ad0: movzx eax, byte ptr [rbx + 0xc3]
0x145998ad7: mov r15, qword ptr [rbp + 0xe8]
0x145998ade: mov qword ptr [rbp + 0xe0], r15
0x145998ae5: mov byte ptr [rbp + 0x117], 1
0x145998aec: mov byte ptr [rbp + 0x116], 0
0x145998af3: mov byte ptr [rsp + 0x20], al
0x145998af7: mov r9d, 7
0x145998afd: lea r14, [rbp + 0xb0]
0x145998b04: mov rcx, r14
0x145998b07: lea rsi, [rbp + 0xf0]
0x145998b0e: mov rdx, rsi
0x145998b11: lea r8, [rip + 0x19a0bda]
0x145998b18: call 0x14584ef40
0x145998b1d: nop
0x145998b1e: movzx eax, byte ptr [rbx + 0xc4]
0x145998b25: mov qword ptr [rbp + 0xe0], r15
0x145998b2c: mov byte ptr [rbp + 0x117], 1
0x145998b33: mov byte ptr [rbp + 0x116], 0
0x145998b3a: mov byte ptr [rsp + 0x20], al
0x145998b3e: mov r9d, 3
0x145998b44: mov rcx, rsi
0x145998b47: mov rdx, r14
0x145998b4a: lea r8, [rip + 0x19a0ba8]
0x145998b51: call 0x14584ef40
0x145998b56: nop
0x145998b57: mov bl, byte ptr [rbx + 0xc0]
0x145998b5d: mov r8d, 6
0x145998b63: mov rcx, rsi
0x145998b66: lea rdx, [rip + 0x19a0b8f]
0x145998b6d: call 0x1458580a0
0x145998b72: nop
0x145998b73: movzx esi, bl
0x145998b76: xor rsi, 5
0x145998b7a: mov rax, qword ptr [rbp + 0xf0]
0x145998b81: mov rcx, qword ptr [rbp + 0x100]
0x145998b88: sub rax, rcx
0x145998b8b: cmp rsi, rax
0x145998b8e: ja 0x145998dd3
0x145998b94: test bl, bl
0x145998b96: lea rdx, [rip + 0x16744c8]
0x145998b9d: lea rax, [rip + 0x16744c6]
0x145998ba4: cmovne rdx, rax
0x145998ba8: add rcx, qword ptr [rbp + 0xf8]
0x145998baf: mov r8, rsi
0x145998bb2: call 0x145d145fb
0x145998bb7: add qword ptr [rbp + 0x100], rsi
0x145998bbe: movups xmm0, xmmword ptr [rbp + 0xf0]
0x145998bc5: movaps xmmword ptr [rbp + 0xb0], xmm0
0x145998bcc: movups xmm0, xmmword ptr [rbp + 0x100]
0x145998bd3: movaps xmmword ptr [rbp + 0xc0], xmm0
0x145998bda: mov rax, qword ptr [rbp + 0xa0]
0x145998be1: mov bl, byte ptr [rax + 0xc1]
0x145998be7: mov r8d, 4
0x145998bed: mov rcx, r14
0x145998bf0: lea rdx, [rip + 0x19a0b0b]
0x145998bf7: call 0x1458580a0
0x145998bfc: nop
0x145998bfd: movzx esi, bl
0x145998c00: xor rsi, 5
0x145998c04: mov rax, qword ptr [rbp + 0xb0]
0x145998c0b: mov rcx, qword ptr [rbp + 0xc0]
0x145998c12: sub rax, rcx
0x145998c15: cmp rsi, rax
0x145998c18: ja 0x145998e01
0x145998c1e: test bl, bl
0x145998c20: lea rdx, [rip + 0x167443e]
0x145998c27: lea rax, [rip + 0x167443c]
0x145998c2e: cmovne rdx, rax
0x145998c32: add rcx, qword ptr [rbp + 0xb8]
0x145998c39: mov r8, rsi
0x145998c3c: call 0x145d145fb
0x145998c41: add qword ptr [rbp + 0xc0], rsi
0x145998c48: movaps xmm0, xmmword ptr [rbp + 0xb0]
0x145998c4f: movaps xmmword ptr [rbp + 0xf0], xmm0
0x145998c56: movaps xmm0, xmmword ptr [rbp + 0xc0]
0x145998c5d: movaps xmmword ptr [rbp + 0x100], xmm0
0x145998c64: mov rax, qword ptr [rbp + 0xa0]
0x145998c6b: movups xmm0, xmmword ptr [rax + 0x80]
0x145998c72: mov rax, qword ptr [rbp + 0xe8]
0x145998c79: mov qword ptr [rbp + 0xe0], rax
0x145998c80: mov byte ptr [rbp + 0x117], 1
0x145998c87: mov byte ptr [rbp + 0x116], 0
0x145998c8e: movups xmmword ptr [rsp + 0x20], xmm0
0x145998c93: mov r9d, 7
0x145998c99: mov rcx, r14
0x145998c9c: lea rdx, [rbp + 0xf0]
0x145998ca3: lea r8, [rip + 0x19a0a5c]
0x145998caa: call 0x145858350
0x145998caf: nop
0x145998cb0: mov rsi, qword ptr [rbp + 0xc0]
0x145998cb7: cmp qword ptr [rbp + 0xb0], rsi
0x145998cbe: je 0x145998e2b
0x145998cc4: mov rax, qword ptr [rbp + 0xb8]
0x145998ccb: mov byte ptr [rax + rsi], 0x7d
0x145998ccf: inc rsi
0x145998cd2: mov qword ptr [rbp + 0x100], rsi
0x145998cd9: movupd xmm0, xmmword ptr [rbp + 0xb0]
0x145998ce1: movapd xmmword ptr [rbp + 0xf0], xmm0
0x145998ce9: mov rax, qword ptr [rbp + 0xe8]
0x145998cf0: mov qword ptr [rbp + 0xe0], rax
0x145998cf7: mov byte ptr [rbp + 0x117], 0
0x145998cfe: mov byte ptr [rbp + 0x116], 0
0x145998d05: lea rcx, [rbp + 0x30]
0x145998d09: lea rdx, [rbp - 0x20]
0x145998d0d: lea rsi, [rbp + 0xf0]
0x145998d14: mov r8, rsi
0x145998d17: call 0x145855000
0x145998d1c: nop
0x145998d1d: mov rax, qword ptr [rbp + 0x30]
0x145998d21: mov qword ptr [rbp + 0x78], rax
0x145998d25: mov rax, qword ptr [rbp + 0x38]
0x145998d29: mov rcx, qword ptr [rbp + 0x40]
0x145998d2d: mov qword ptr [rbp + 0x60], rcx
0x145998d31: movzx ecx, byte ptr [rbp + 0x48]
0x145998d35: mov byte ptr [rbp + 0x114], cl
0x145998d3b: lea rcx, [rbp + 0x49]
0x145998d3f: mov edx, dword ptr [rcx]
0x145998d41: mov ecx, dword ptr [rcx + 3]
0x145998d44: mov dword ptr [rbp + 0x90], edx
0x145998d4a: mov dword ptr [rbp + 0x93], ecx
0x145998d50: mov r12, r13
0x145998d53: mov rdx, rsi
0x145998d56: mov qword ptr [rbp + 0x58], rax
0x145998d5a: cmp r12, qword ptr [rbp - 0x40]
0x145998d5e: jne 0x145998050
0x145998d64: jmp 0x145998e55
0x145998d69: mov qword ptr [rsp + 0x20], 1
0x145998d72: mov r8d, 1
0x145998d78: mov r9d, 1
0x145998d7e: lea rcx, [rbp + 0xf0]
0x145998d85: call 0x145d14a10
0x145998d8a: nop
0x145998d8b: mov rax, qword ptr [rbp + 0xf8]
0x145998d92: mov r13, qword ptr [rbp + 0xe8]
0x145998d99: mov rdx, qword ptr [rbp + 0xa8]
0x145998da0: jmp 0x1459988b4
0x145998da5: mov qword ptr [rsp + 0x20], 1
0x145998dae: mov r9d, 1
0x145998db4: mov rdx, rcx
0x145998db7: lea rcx, [rbp + 0xb0]
0x145998dbe: mov r8, r14
0x145998dc1: call 0x145d14a10
0x145998dc6: nop
0x145998dc7: mov rcx, qword ptr [rbp + 0xc0]
0x145998dce: jmp 0x145998a82
0x145998dd3: mov qword ptr [rsp + 0x20], 1
0x145998ddc: mov r9d, 1
0x145998de2: mov rdx, rcx
0x145998de5: lea rcx, [rbp + 0xf0]
0x145998dec: mov r8, rsi
0x145998def: call 0x145d14a10
0x145998df4: nop
0x145998df5: mov rcx, qword ptr [rbp + 0x100]
0x145998dfc: jmp 0x145998b94
0x145998e01: mov qword ptr [rsp + 0x20], 1
0x145998e0a: mov r9d, 1
0x145998e10: mov rdx, rcx
0x145998e13: mov rcx, r14
0x145998e16: mov r8, rsi
0x145998e19: call 0x145d14a10
0x145998e1e: nop
0x145998e1f: mov rcx, qword ptr [rbp + 0xc0]
0x145998e26: jmp 0x145998c1e
0x145998e2b: mov qword ptr [rsp + 0x20], 1
0x145998e34: mov r8d, 1
0x145998e3a: mov r9d, 1
0x145998e40: lea rcx, [rbp + 0xb0]
0x145998e47: mov rdx, rsi
0x145998e4a: call 0x145d14a10
0x145998e4f: nop
0x145998e50: jmp 0x145998cc4
0x145998e55: call 0x140002200
0x145998e5a: mov ecx, 1
0x145998e5f: mov edx, 1
0x145998e64: call 0x1400021c0
0x145998e69: test rax, rax
0x145998e6c: je 0x14599907e
0x145998e72: mov byte ptr [rax], 0x7b
0x145998e75: mov qword ptr [rbp + 0xf0], 1
0x145998e80: mov qword ptr [rbp + 0xf8], rax
0x145998e87: mov qword ptr [rbp + 0x100], 1
0x145998e92: mov byte ptr [rbp + 0x108], 1
0x145998e99: mov byte ptr [rbp + 0x115], 1
0x145998ea0: lea rax, [rip + 0x19a086a]
0x145998ea7: mov qword ptr [rsp + 0x20], rax
0x145998eac: mov qword ptr [rsp + 0x28], 7
0x145998eb5: lea r8, [rip + 0x19a0851]
0x145998ebc: lea rcx, [rbp + 0xb0]
0x145998ec3: lea rdx, [rbp + 0xf0]
0x145998eca: mov r9d, 4
0x145998ed0: call 0x145858350
0x145998ed5: nop
0x145998ed6: mov r8, qword ptr [rbp + 0x78]
0x145998eda: mov qword ptr [rbp + 0xf0], r8
0x145998ee1: mov rdx, qword ptr [rbp + 0x58]
0x145998ee5: mov qword ptr [rbp + 0xf8], rdx
0x145998eec: mov rsi, qword ptr [rbp + 0x60]
0x145998ef0: mov qword ptr [rbp + 0x100], rsi
0x145998ef7: movzx eax, byte ptr [rbp + 0x114]
0x145998efe: mov byte ptr [rbp + 0x108], al
0x145998f04: mov eax, dword ptr [rbp + 0x90]
0x145998f0a: mov ecx, dword ptr [rbp + 0x93]
0x145998f10: mov dword ptr [rbp + 0x109], eax
0x145998f16: mov dword ptr [rbp + 0x10c], ecx
0x145998f1c: mov rax, rdx
0x145998f1f: cmp r8, rsi
0x145998f22: je 0x145998fcb
0x145998f28: mov byte ptr [rax + rsi], 0x5d
0x145998f2c: inc rsi
0x145998f2f: mov qword ptr [rbp + 0x10], rsi
0x145998f33: mov rax, qword ptr [rbp + 0xf0]
0x145998f3a: mov qword ptr [rbp], rax
0x145998f3e: mov rax, qword ptr [rbp + 0xf8]
0x145998f45: mov qword ptr [rbp + 8], rax
0x145998f49: mov byte ptr [rbp + 0x111], 0
0x145998f50: mov rax, rbp
0x145998f53: mov qword ptr [rsp + 0x20], rax
0x145998f58: lea r8, [rip + 0x19a07b9]
0x145998f5f: lea rcx, [rbp + 0xf0]
0x145998f66: lea rdx, [rbp + 0xb0]
0x145998f6d: mov r9d, 4
0x145998f73: call 0x145858210
0x145998f78: nop
0x145998f79: mov rsi, qword ptr [rbp + 0x100]
0x145998f80: cmp qword ptr [rbp + 0xf0], rsi
0x145998f87: je 0x145998ffc
0x145998f89: mov rax, qword ptr [rbp + 0xf8]
0x145998f90: mov byte ptr [rax + rsi], 0x7d
0x145998f94: inc rsi
0x145998f97: mov qword ptr [rbp + 0x100], rsi
0x145998f9e: mov rax, qword ptr [rbp - 0x28]
0x145998fa2: mov qword ptr [rax + 0x10], rsi
0x145998fa6: movups xmm0, xmmword ptr [rbp + 0xf0]
0x145998fad: movups xmmword ptr [rax], xmm0
0x145998fb0: movaps xmm6, xmmword ptr [rbp + 0x120]
0x145998fb7: add rsp, 0x1b8
0x145998fbe: pop rbx
0x145998fbf: pop rdi
0x145998fc0: pop rsi
0x145998fc1: pop r12
0x145998fc3: pop r13
0x145998fc5: pop r14
0x145998fc7: pop r15
0x145998fc9: pop rbp
0x145998fca: ret
0x145998fcb: mov qword ptr [rsp + 0x20], 1
0x145998fd4: lea rcx, [rbp + 0xf0]
0x145998fdb: mov r8d, 1
0x145998fe1: mov r9d, 1
0x145998fe7: mov rdx, rsi
0x145998fea: call 0x145d14a10
0x145998fef: nop
0x145998ff0: mov rax, qword ptr [rbp + 0xf8]
0x145998ff7: jmp 0x145998f28
0x145998ffc: mov qword ptr [rsp + 0x20], 1
0x145999005: lea rcx, [rbp + 0xf0]
0x14599900c: mov r8d, 1
0x145999012: mov r9d, 1
0x145999018: mov rdx, rsi
0x14599901b: call 0x145d14a10
0x145999020: nop
0x145999021: jmp 0x145998f89
0x145999026: mov byte ptr [rbp + 0x115], 1
0x14599902d: mov ecx, 1
0x145999032: mov edx, 1
0x145999037: call 0x145eb6fcb
0x14599903c: nop
0x14599903d: jmp 0x145999095
0x14599903f: mov rax, qword ptr [rbp + 0xe8]
0x145999046: mov qword ptr [rbp + 0xe0], rax
0x14599904d: mov byte ptr [rbp + 0x117], 1
0x145999054: mov byte ptr [rbp + 0x116], 1
0x14599905b: mov ecx, 1
0x145999060: mov edx, 1
0x145999065: call 0x145eb6fcb
0x14599906a: nop
0x14599906b: jmp 0x145999095
0x14599906d: mov ecx, 1
0x145999072: mov edx, 1
0x145999077: call 0x145eb6fcb
0x14599907c: ud2
0x14599907e: mov byte ptr [rbp + 0x115], 1
0x145999085: mov ecx, 1
0x14599908a: mov edx, 1
0x14599908f: call 0x145eb6fcb
0x145999094: nop
0x145999095: ud2
