0x1458ada10: push rbp
0x1458ada11: push rsi
0x1458ada12: sub rsp, 0x88
0x1458ada19: lea rbp, [rsp + 0x80]
0x1458ada21: mov qword ptr [rbp], 0xfffffffffffffffe
0x1458ada29: mov rdx, rcx
0x1458ada2c: lea rcx, [rbp - 0x58]
0x1458ada30: call 0x145cc2580
0x1458ada35: cmp word ptr [rbp - 0x50], 2
0x1458ada3a: mov rdx, qword ptr [rbp - 0x58]
0x1458ada3e: jne 0x1458ada63
0x1458ada40: mov eax, edx
0x1458ada42: and eax, 3
0x1458ada45: lea ecx, [rax - 2]
0x1458ada48: cmp ecx, 2
0x1458ada4b: jb 0x1458adac3
0x1458ada4d: test rax, rax
0x1458ada50: je 0x1458adac3
0x1458ada52: dec rdx
0x1458ada55: lea rcx, [rbp - 0x10]
0x1458ada59: mov qword ptr [rbp - 0x10], rdx
0x1458ada5d: mov byte ptr [rbp - 0x18], 3
0x1458ada61: jmp 0x1458adabe
0x1458ada63: mov qword ptr [rbp - 8], rdx
0x1458ada67: mov qword ptr [rbp - 0x18], rdx
0x1458ada6b: lea rcx, [rbp - 0x18]
0x1458ada6f: mov dl, 1
0x1458ada71: call 0x145cbe5a0
0x1458ada76: nop
0x1458ada77: mov rsi, rax
0x1458ada7a: test rax, rax
0x1458ada7d: jne 0x1458ada93
0x1458ada7f: lea rcx, [rbp - 0x18]
0x1458ada83: mov dl, 1
0x1458ada85: call 0x145cbe6f0
0x1458ada8a: nop
0x1458ada8b: mov rsi, rax
0x1458ada8e: test rax, rax
0x1458ada91: je 0x1458adad6
0x1458ada93: mov rcx, qword ptr [rbp - 8]
0x1458ada97: call qword ptr [rip + 0x60b343]
0x1458ada9d: mov eax, esi
0x1458ada9f: and eax, 3
0x1458adaa2: lea ecx, [rax - 2]
0x1458adaa5: cmp ecx, 2
0x1458adaa8: jb 0x1458adac3
0x1458adaaa: test rax, rax
0x1458adaad: je 0x1458adac3
0x1458adaaf: dec rsi
0x1458adab2: lea rcx, [rbp - 0x50]
0x1458adab6: mov qword ptr [rbp - 0x50], rsi
0x1458adaba: mov byte ptr [rbp - 0x58], 3
0x1458adabe: call 0x145cf9ce0
0x1458adac3: xor eax, eax
0x1458adac5: lea rdx, [rip + 0x1782b4c]
0x1458adacc: add rsp, 0x88
0x1458adad3: pop rsi
0x1458adad4: pop rbp
0x1458adad5: ret
0x1458adad6: xorps xmm0, xmm0
0x1458adad9: movups xmmword ptr [rbp - 0x48], xmm0
0x1458adadd: mov qword ptr [rbp - 0x58], 0
0x1458adae5: mov qword ptr [rbp - 0x50], 1
0x1458adaed: mov qword ptr [rbp - 0x38], 1
0x1458adaf5: mov qword ptr [rbp - 0x30], 0
0x1458adafd: mov rax, qword ptr [rbp - 8]
0x1458adb01: mov qword ptr [rbp - 0x28], rax
0x1458adb05: mov byte ptr [rbp - 0x20], 1
0x1458adb09: call 0x140002200
0x1458adb0e: mov ecx, 0x40
0x1458adb13: mov edx, 8
0x1458adb18: call 0x1400021c0
0x1458adb1d: test rax, rax
0x1458adb20: je 0x1458adb43
0x1458adb22: movups xmm0, xmmword ptr [rbp - 0x58]
0x1458adb26: movups xmm1, xmmword ptr [rbp - 0x48]
0x1458adb2a: movups xmm2, xmmword ptr [rbp - 0x38]
0x1458adb2e: movups xmm3, xmmword ptr [rbp - 0x28]
0x1458adb32: movups xmmword ptr [rax + 0x30], xmm3
0x1458adb36: movups xmmword ptr [rax + 0x20], xmm2
0x1458adb3a: movups xmmword ptr [rax + 0x10], xmm1
0x1458adb3e: movups xmmword ptr [rax], xmm0
0x1458adb41: jmp 0x1458adac5
0x1458adb43: mov ecx, 8
0x1458adb48: mov edx, 0x40
0x1458adb4d: call 0x145eb6fb1
0x1458adb52: nop
0x1458adb53: ud2
