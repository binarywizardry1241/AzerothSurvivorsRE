1458c6fb2: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c6fb6: 891c10 mov dword ptr [rax + rdx], ebx
1458c6fb9: 4883c204 add rdx, 4
1458c6fbd: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c6fc1: 0f1045d0 movups xmm0, xmmword ptr [rbp - 0x30]
1458c6fc5: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c6fc9: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c6fcd: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c6fd1: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c6fd5: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c6fd9: 488b5dc0 mov rbx, qword ptr [rbp - 0x40]
1458c6fdd: 483b5db0 cmp rbx, qword ptr [rbp - 0x50]
1458c6fe1: 750a jne 0x1458c6fed
1458c6fe3: 488d4db0 lea rcx, [rbp - 0x50]
1458c6fe7: e8c4214d00 call 0x145d991b0
1458c6fec: 90 nop
1458c6fed: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458c6ff1: c6041804 mov byte ptr [rax + rbx], 4
1458c6ff5: 48ffc3 inc rbx
1458c6ff8: 48895dc0 mov qword ptr [rbp - 0x40], rbx
1458c6ffc: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458c7000: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c7004: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c7008: 488945e0 mov qword ptr [rbp - 0x20], rax
1458c700c: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458c7010: 488945e8 mov qword ptr [rbp - 0x18], rax
1458c7014: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c7018: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458c701c: 4829d0 sub rax, rdx
1458c701f: 4883f803 cmp rax, 3
1458c7023: 0f8636010000 jbe 0x1458c715f
1458c7029: f30f104550 movss xmm0, dword ptr [rbp + 0x50]
1458c702e: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c7032: f30f110410 movss dword ptr [rax + rdx], xmm0
1458c7037: 4883c204 add rdx, 4
1458c703b: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c703f: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c7043: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c7047: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c704b: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c704f: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c7053: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c7057: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458c705b: 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458c705f: 4829d0 sub rax, rdx
1458c7062: 4883f803 cmp rax, 3
1458c7066: 0f861b010000 jbe 0x1458c7187
1458c706c: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458c7070: c7041000010000 mov dword ptr [rax + rdx], 0x100
1458c7077: 4883c204 add rdx, 4
1458c707b: 488955c0 mov qword ptr [rbp - 0x40], rdx
1458c707f: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458c7083: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c7087: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c708b: 488945e0 mov qword ptr [rbp - 0x20], rax
1458c708f: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458c7093: 488945e8 mov qword ptr [rbp - 0x18], rax
1458c7097: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c709b: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458c709f: 4829d0 sub rax, rdx
1458c70a2: 4883f803 cmp rax, 3
1458c70a6: 0f8603010000 jbe 0x1458c71af
1458c70ac: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c70b0: c7041001000000 mov dword ptr [rax + rdx], 1
1458c70b7: 4883c204 add rdx, 4
1458c70bb: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c70bf: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c70c3: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c70c7: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c70cb: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c70cf: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c70d3: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c70d7: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458c70db: 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458c70df: 4829d0 sub rax, rdx
1458c70e2: 4883f803 cmp rax, 3
1458c70e6: 0f86eb000000 jbe 0x1458c71d7
1458c70ec: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458c70f0: c7041001000000 mov dword ptr [rax + rdx], 1
1458c70f7: 4883c204 add rdx, 4
1458c70fb: 488955c0 mov qword ptr [rbp - 0x40], rdx
1458c70ff: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458c7103: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c7107: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c710b: 488945e0 mov qword ptr [rbp - 0x20], rax
1458c710f: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458c7113: 488945e8 mov qword ptr [rbp - 0x18], rax
1458c7117: 488d55d0 lea rdx, [rbp - 0x30]
1458c711b: 4889f1 mov rcx, rsi
1458c711e: 4989f8 mov r8, rdi
1458c7121: e87a5cfeff call 0x1458acda0
