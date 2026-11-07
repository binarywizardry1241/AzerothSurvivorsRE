0x14020cb50: push rbp
0x14020cb51: push r15
0x14020cb53: push r14
0x14020cb55: push r13
0x14020cb57: push r12
0x14020cb59: push rsi
0x14020cb5a: push rdi
0x14020cb5b: push rbx
0x14020cb5c: sub rsp, 0x358
0x14020cb63: lea rbp, [rsp + 0x80]
0x14020cb6b: mov qword ptr [rbp + 0x2d0], 0xfffffffffffffffe
0x14020cb76: mov rbx, rdx
0x14020cb79: mov r14, rcx
0x14020cb7c: mov rsi, qword ptr [rbp + 0x358]
0x14020cb83: mov r12, qword ptr [rbp + 0x350]
0x14020cb8a: movaps xmm0, xmmword ptr [rbp + 0x340]
0x14020cb91: mov byte ptr [rbp + 0x2ce], r9b
0x14020cb98: movups xmmword ptr [rbp + 0x2a8], xmm0
0x14020cb9f: cmp r8b, r9b
0x14020cba2: sete byte ptr [rbp + 0x2cd]
0x14020cba9: test rsi, rsi
0x14020cbac: je 0x14020cbd5
0x14020cbae: cmp byte ptr [rbp + 0x370], 0
0x14020cbb5: je 0x14020cc2c
0x14020cbb7: mov rcx, r12
0x14020cbba: mov rdx, rsi
0x14020cbbd: cmp rsi, 0x20
0x14020cbc1: jae 0x14020cc40
0x14020cbc3: call 0x145cefab0
0x14020cbc8: mov r13, rax
0x14020cbcb: test rax, rax
0x14020cbce: jne 0x14020cc4d
0x14020cbd0: jmp 0x14020cc78
0x14020cbd5: mov r15, qword ptr [rbp + 0x368]
0x14020cbdc: test r15, r15
0x14020cbdf: js 0x14020cc69
0x14020cbe5: je 0x14020cc78
0x14020cbeb: call 0x140002200
0x14020cbf0: mov edi, 1
0x14020cbf5: mov edx, 1
0x14020cbfa: mov rcx, r15
0x14020cbfd: call 0x1400021c0
0x14020cc02: test rax, rax
0x14020cc05: je 0x14020cc6b
0x14020cc07: mov rdx, qword ptr [rbp + 0x360]
0x14020cc0e: mov qword ptr [rbp + 0x2c0], rax
0x14020cc15: mov rcx, rax
0x14020cc18: mov r8, r15
0x14020cc1b: call 0x145d145fb
0x14020cc20: mov qword ptr [rbp + 0x2b8], r15
0x14020cc27: jmp 0x14020cd8a
0x14020cc2c: test rsi, rsi
0x14020cc2f: jns 0x14020cc97
0x14020cc31: xor edi, edi
0x14020cc33: mov rcx, rdi
0x14020cc36: mov rdx, rsi
0x14020cc39: call 0x145eb6fcb
0x14020cc3e: ud2
0x14020cc40: call 0x145cef490
0x14020cc45: mov r13, rax
0x14020cc48: test rax, rax
0x14020cc4b: je 0x14020cc78
0x14020cc4d: mov ecx, 3
0x14020cc52: mov rax, r13
0x14020cc55: mul rcx
0x14020cc58: jo 0x14020cfc6
0x14020cc5e: mov r12, rax
0x14020cc61: mov r15, rax
0x14020cc64: test rax, rax
0x14020cc67: jns 0x14020ccd7
0x14020cc69: xor edi, edi
0x14020cc6b: mov rcx, rdi
0x14020cc6e: mov rdx, r15
0x14020cc71: call 0x145eb6fcb
0x14020cc76: ud2
0x14020cc78: mov eax, 1
0x14020cc7d: mov qword ptr [rbp + 0x2c0], rax
0x14020cc84: mov qword ptr [rbp + 0x2b8], 0
0x14020cc8f: xor r15d, r15d
0x14020cc92: jmp 0x14020cd8a
0x14020cc97: call 0x140002200
0x14020cc9c: mov edi, 1
0x14020cca1: mov edx, 1
0x14020cca6: mov rcx, rsi
0x14020cca9: call 0x1400021c0
0x14020ccae: test rax, rax
0x14020ccb1: je 0x14020cc33
0x14020ccb3: mov qword ptr [rbp + 0x2c0], rax
0x14020ccba: mov rcx, rax
0x14020ccbd: mov rdx, r12
0x14020ccc0: mov r8, rsi
0x14020ccc3: call 0x145d145fb
0x14020ccc8: mov qword ptr [rbp + 0x2b8], rsi
0x14020cccf: mov r15, rsi
0x14020ccd2: jmp 0x14020cd8a
0x14020ccd7: call 0x140002200
0x14020ccdc: mov edi, 1
0x14020cce1: mov edx, 1
0x14020cce6: mov rcx, r15
0x14020cce9: call 0x1400021c0
0x14020ccee: test rax, rax
0x14020ccf1: je 0x14020cc6b
0x14020ccf7: mov rdx, rax
0x14020ccfa: mov qword ptr [rbp + 0x120], r15
0x14020cd01: mov qword ptr [rbp + 0x128], rax
0x14020cd08: mov qword ptr [rbp + 0x130], 0
0x14020cd13: cmp r12, 2
0x14020cd17: jbe 0x14020cfe0
0x14020cd1d: xor edi, edi
0x14020cd1f: mov byte ptr [rdx + rdi + 2], 0xa2
0x14020cd24: mov word ptr [rdx + rdi], 0x80e2
0x14020cd2a: add rdi, 3
0x14020cd2e: shr r13, 1
0x14020cd31: mov qword ptr [rbp + 0x2c0], rdx
0x14020cd38: je 0x14020cd5b
0x14020cd3a: nop word ptr [rax + rax]
0x14020cd40: lea rcx, [rdx + rdi]
0x14020cd44: mov r8, rdi
0x14020cd47: call 0x145d145fb
0x14020cd4c: mov rdx, qword ptr [rbp + 0x2c0]
0x14020cd53: add rdi, rdi
0x14020cd56: shr r13, 1
0x14020cd59: jne 0x14020cd40
0x14020cd5b: sub r12, rdi
0x14020cd5e: je 0x14020cd75
0x14020cd60: mov rdx, qword ptr [rbp + 0x2c0]
0x14020cd67: add rdi, rdx
0x14020cd6a: mov rcx, rdi
0x14020cd6d: mov r8, r12
0x14020cd70: call 0x145d145fb
0x14020cd75: mov rax, qword ptr [rbp + 0x120]
0x14020cd7c: mov qword ptr [rbp + 0x2b8], rax
0x14020cd83: mov r12, qword ptr [rbp + 0x350]
0x14020cd8a: xorps xmm0, xmm0
0x14020cd8d: movaps xmmword ptr [rbp + 0x80], xmm0
0x14020cd94: movaps xmmword ptr [rbp + 0x70], xmm0
0x14020cd98: movaps xmmword ptr [rbp + 0x60], xmm0
0x14020cd9c: movaps xmmword ptr [rbp + 0x50], xmm0
0x14020cda0: movaps xmmword ptr [rbp + 0x40], xmm0
0x14020cda4: mov qword ptr [rbp + 0x90], 0
0x14020cdaf: movups xmm0, xmmword ptr [rip + 0x5d03c4a]
0x14020cdb6: movups xmmword ptr [rbp + 0x98], xmm0
0x14020cdbd: movups xmm0, xmmword ptr [rip + 0x5d03c4c]
0x14020cdc4: movups xmmword ptr [rbp + 0xa8], xmm0
0x14020cdcb: movups xmm0, xmmword ptr [rip + 0x5d03c4e]
0x14020cdd2: movups xmmword ptr [rbp + 0xb8], xmm0
0x14020cdd9: movups xmm0, xmmword ptr [rip + 0x5d03c50]
0x14020cde0: movups xmmword ptr [rbp + 0xc8], xmm0
0x14020cde7: movups xmm0, xmmword ptr [rip + 0x5d03c52]
0x14020cdee: movups xmmword ptr [rbp + 0xd8], xmm0
0x14020cdf5: movups xmm0, xmmword ptr [rip + 0x5d03c54]
0x14020cdfc: movups xmmword ptr [rbp + 0xe8], xmm0
0x14020ce03: movups xmm0, xmmword ptr [rip + 0x5d03c66]
0x14020ce0a: movups xmmword ptr [rbp + 0x108], xmm0
0x14020ce11: movups xmm0, xmmword ptr [rip + 0x5d03c48]
0x14020ce18: movups xmmword ptr [rbp + 0xf8], xmm0
0x14020ce1f: movups xmm0, xmmword ptr [rip + 0x5d03b22]
0x14020ce26: movaps xmmword ptr [rbp - 0x20], xmm0
0x14020ce2a: mov qword ptr [rbp - 0x10], 0
0x14020ce32: movups xmm0, xmmword ptr [rip + 0x5d03b27]
0x14020ce39: movups xmmword ptr [rbp - 8], xmm0
0x14020ce3d: mov qword ptr [rbp + 8], 0
0x14020ce45: movups xmm0, xmmword ptr [rip + 0x5d03b2c]
0x14020ce4c: movaps xmmword ptr [rbp + 0x10], xmm0
0x14020ce50: mov qword ptr [rbp + 0x20], 0
0x14020ce58: movups xmm0, xmmword ptr [rip + 0x5d03b31]
0x14020ce5f: movups xmmword ptr [rbp + 0x28], xmm0
0x14020ce63: mov qword ptr [rbp + 0x38], 0
0x14020ce6b: mov rdi, qword ptr [r14]
0x14020ce6e: add r14, 8
0x14020ce72: lea rcx, [rbp + 0x128]
0x14020ce79: lea rdx, [rbp - 0x20]
0x14020ce7d: mov r8d, 0x138
0x14020ce83: call 0x145d145fb
0x14020ce88: movaps xmm0, xmmword ptr [rip + 0x5cd3071]
0x14020ce8f: movups xmmword ptr [rbp + 0x260], xmm0
0x14020ce96: mov dword ptr [rbp + 0x270], 1
0x14020cea0: movss xmm0, dword ptr [rip + 0x5cd36ec]
0x14020cea8: movlps qword ptr [rbp + 0x274], xmm0
0x14020ceaf: mov byte ptr [rbp + 0x27c], 1
0x14020ceb6: mov qword ptr [rbp + 0x280], 0
0x14020cec1: mov dword ptr [rbp + 0x288], 0x3f800000
0x14020cecb: mov word ptr [rbp + 0x28c], 0
0x14020ced4: mov dword ptr [rbp + 0x28e], 0x10000
0x14020cede: mov word ptr [rbp + 0x292], 0
0x14020cee7: mov dword ptr [rbp + 0x294], 0x10000
0x14020cef1: mov word ptr [rbp + 0x298], 0
0x14020cefa: mov qword ptr [rbp + 0x29a], 0
0x14020cf05: mov dword ptr [rbp + 0x2a2], 5
0x14020cf0f: mov qword ptr [rbp + 0x120], rdi
0x14020cf16: mov byte ptr [rbp + 0x2cf], 0
0x14020cf1d: lea r9, [rip + 0x5cd3c1c]
0x14020cf24: lea rcx, [rbp - 0x50]
0x14020cf28: lea r8, [rbp + 0x120]
0x14020cf2f: mov rdx, r14
0x14020cf32: call 0x1402b57b0
0x14020cf37: nop
0x14020cf38: mov qword ptr [rbp + 0x138], rbx
0x14020cf3f: lea rax, [rbp + 0x2a8]
0x14020cf46: mov qword ptr [rbp + 0x140], rax
0x14020cf4d: lea rax, [rbp + 0x2ce]
0x14020cf54: mov qword ptr [rbp + 0x148], rax
0x14020cf5b: lea rax, [rbp + 0x2cd]
0x14020cf62: mov qword ptr [rbp + 0x150], rax
0x14020cf69: mov qword ptr [rbp + 0x158], r12
0x14020cf70: mov qword ptr [rbp + 0x160], rsi
0x14020cf77: mov rax, qword ptr [rbp + 0x2b8]
0x14020cf7e: mov qword ptr [rbp + 0x120], rax
0x14020cf85: mov rax, qword ptr [rbp + 0x2c0]
0x14020cf8c: mov qword ptr [rbp + 0x128], rax
0x14020cf93: mov qword ptr [rbp + 0x130], r15
0x14020cf9a: mov byte ptr [rbp + 0x2cf], 1
0x14020cfa1: lea rcx, [rbp - 0x50]
0x14020cfa5: lea rdx, [rbp + 0x120]
0x14020cfac: call 0x1402ee800
0x14020cfb1: nop
0x14020cfb2: add rsp, 0x358
0x14020cfb9: pop rbx
0x14020cfba: pop rdi
0x14020cfbb: pop rsi
0x14020cfbc: pop r12
0x14020cfbe: pop r13
0x14020cfc0: pop r14
0x14020cfc2: pop r15
0x14020cfc4: pop rbp
0x14020cfc5: ret
0x14020cfc6: lea rcx, [rip + 0x5d036d3]
0x14020cfcd: lea r8, [rip + 0x5d0372c]
0x14020cfd4: mov edx, 0x11
0x14020cfd9: call 0x145eb7280
0x14020cfde: ud2
0x14020cfe0: mov qword ptr [rsp + 0x20], 1
0x14020cfe9: lea rcx, [rbp + 0x120]
0x14020cff0: mov r8d, 3
0x14020cff6: mov r9d, 1
0x14020cffc: xor edx, edx
0x14020cffe: call 0x145d14a10
0x14020d003: nop
0x14020d004: mov rdx, qword ptr [rbp + 0x128]
0x14020d00b: mov rdi, qword ptr [rbp + 0x130]
0x14020d012: jmp 0x14020cd1f
