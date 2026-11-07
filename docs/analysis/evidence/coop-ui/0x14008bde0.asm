0x000000014008bde0: push rbp
0x000000014008bde1: push rsi
0x000000014008bde2: push rdi
0x000000014008bde3: push rbx
0x000000014008bde4: sub rsp, 0x48
0x000000014008bde8: lea rbp, [rsp + 0x40]
0x000000014008bded: mov qword ptr [rbp], 0xfffffffffffffffe
0x000000014008bdf5: mov rsi, rcx
0x000000014008bdf8: mov rdx, qword ptr [rcx]
0x000000014008bdfb: test rdx, rdx
0x000000014008bdfe: je 0x14008be0f
0x000000014008be00: mov rcx, qword ptr [rsi + 8]
0x000000014008be04: mov r8d, 1
0x000000014008be0a: call 0x1400021d0
0x000000014008be0f: mov rdx, qword ptr [rsi + 0x18]
0x000000014008be13: test rdx, rdx
0x000000014008be16: je 0x14008be27
0x000000014008be18: mov rcx, qword ptr [rsi + 0x20]
0x000000014008be1c: mov r8d, 1
0x000000014008be22: call 0x1400021d0
0x000000014008be27: mov rdx, qword ptr [rsi + 0x30]
0x000000014008be2b: test rdx, rdx
0x000000014008be2e: je 0x14008be3f
0x000000014008be30: mov rcx, qword ptr [rsi + 0x38]
0x000000014008be34: mov r8d, 1
0x000000014008be3a: call 0x1400021d0
0x000000014008be3f: mov rdx, qword ptr [rsi + 0x48]
0x000000014008be43: test rdx, rdx
0x000000014008be46: je 0x14008be57
0x000000014008be48: mov rcx, qword ptr [rsi + 0x50]
0x000000014008be4c: mov r8d, 1
0x000000014008be52: call 0x1400021d0
0x000000014008be57: mov rcx, qword ptr [rsi + 0x68]
0x000000014008be5b: mov qword ptr [rbp - 8], rsi
0x000000014008be5f: mov rax, qword ptr [rsi + 0x70]
0x000000014008be63: mov qword ptr [rbp - 0x18], rax
0x000000014008be67: mov qword ptr [rbp - 0x10], 0
0x000000014008be6f: mov qword ptr [rbp - 0x20], rcx
0x000000014008be73: nop word ptr cs:[rax + rax]
0x000000014008be80: mov rax, qword ptr [rbp - 0x10]
0x000000014008be84: cmp qword ptr [rbp - 0x18], rax
0x000000014008be88: je 0x14008bea3
0x000000014008be8a: inc rax
0x000000014008be8d: mov qword ptr [rbp - 0x10], rax
0x000000014008be91: lea rsi, [rcx + 0xf0]
0x000000014008be98: call 0x1400cd080
0x000000014008be9d: nop
0x000000014008be9e: mov rcx, rsi
0x000000014008bea1: jmp 0x14008be80
0x000000014008bea3: mov rsi, qword ptr [rbp - 8]
0x000000014008bea7: mov rax, qword ptr [rsi + 0x60]
0x000000014008beab: test rax, rax
0x000000014008beae: je 0x14008bec6
0x000000014008beb0: mov rcx, qword ptr [rsi + 0x68]
0x000000014008beb4: imul rdx, rax, 0xf0
0x000000014008bebb: mov r8d, 8
0x000000014008bec1: call 0x1400021d0
0x000000014008bec6: mov rdx, qword ptr [rsi + 0x108]
0x000000014008becd: cmp rdx, -1
0x000000014008bed1: je 0x14008beea
0x000000014008bed3: test rdx, rdx
0x000000014008bed6: je 0x14008beea
0x000000014008bed8: mov rcx, qword ptr [rsi + 0x110]
0x000000014008bedf: mov r8d, 1
0x000000014008bee5: call 0x1400021d0
0x000000014008beea: lea rcx, [rsi + 0x78]
0x000000014008beee: mov qword ptr [rbp - 0x10], rcx
0x000000014008bef2: call 0x1400f1030
0x000000014008bef7: nop
0x000000014008bef8: mov rax, qword ptr [rbp - 0x10]
0x000000014008befc: mov rax, qword ptr [rax]
0x000000014008beff: test rax, rax
0x000000014008bf02: mov rsi, qword ptr [rbp - 8]
0x000000014008bf06: je 0x14008bf1e
0x000000014008bf08: mov rcx, qword ptr [rsi + 0x80]
0x000000014008bf0f: imul rdx, rax, 0x70
0x000000014008bf13: mov r8d, 8
0x000000014008bf19: call 0x1400021d0
0x000000014008bf1e: mov rdx, qword ptr [rsi + 0x90]
0x000000014008bf25: test rdx, rdx
0x000000014008bf28: je 0x14008bf3c
0x000000014008bf2a: mov rcx, qword ptr [rsi + 0x98]
0x000000014008bf31: mov r8d, 1
0x000000014008bf37: call 0x1400021d0
0x000000014008bf3c: mov rdx, qword ptr [rsi + 0xa8]
0x000000014008bf43: test rdx, rdx
0x000000014008bf46: je 0x14008bf5a
0x000000014008bf48: mov rcx, qword ptr [rsi + 0xb0]
0x000000014008bf4f: mov r8d, 1
0x000000014008bf55: call 0x1400021d0
0x000000014008bf5a: mov rdx, qword ptr [rsi + 0xc0]
0x000000014008bf61: test rdx, rdx
0x000000014008bf64: je 0x14008bf78
0x000000014008bf66: mov rcx, qword ptr [rsi + 0xc8]
0x000000014008bf6d: mov r8d, 1
0x000000014008bf73: call 0x1400021d0
0x000000014008bf78: mov rdx, qword ptr [rsi + 0xd8]
0x000000014008bf7f: test rdx, rdx
0x000000014008bf82: je 0x14008bf96
0x000000014008bf84: mov rcx, qword ptr [rsi + 0xe0]
0x000000014008bf8b: mov r8d, 1
0x000000014008bf91: call 0x1400021d0
0x000000014008bf96: mov rdx, qword ptr [rsi + 0xf0]
0x000000014008bf9d: test rdx, rdx
0x000000014008bfa0: je 0x14008bfbc
0x000000014008bfa2: mov rcx, qword ptr [rsi + 0xf8]
0x000000014008bfa9: mov r8d, 1
0x000000014008bfaf: add rsp, 0x48
0x000000014008bfb3: pop rbx
0x000000014008bfb4: pop rdi
0x000000014008bfb5: pop rsi
0x000000014008bfb6: pop rbp
0x000000014008bfb7: jmp 0x1400021d0
0x000000014008bfbc: add rsp, 0x48
0x000000014008bfc0: pop rbx
0x000000014008bfc1: pop rdi
0x000000014008bfc2: pop rsi
0x000000014008bfc3: pop rbp
0x000000014008bfc4: ret
