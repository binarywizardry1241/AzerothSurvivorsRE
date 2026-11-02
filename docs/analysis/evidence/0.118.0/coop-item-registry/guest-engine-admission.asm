145b1ccc0: 488b8538040000 mov rax, qword ptr [rbp + 0x438]
145b1ccc7: 488b7808 mov rdi, qword ptr [rax + 8]
145b1cccb: 488b5810 mov rbx, qword ptr [rax + 0x10]
145b1cccf: 83bea00c000001 cmp dword ptr [rsi + 0xca0], 1
145b1ccd6: 7766 ja 0x145b1cd3e
145b1ccd8: f686d10f000001 test byte ptr [rsi + 0xfd1], 1
145b1ccdf: 745d je 0x145b1cd3e
145b1cce1: 488b8538040000 mov rax, qword ptr [rbp + 0x438]
145b1cce8: 440fb77020 movzx r14d, word ptr [rax + 0x20]
145b1cced: 4c8b7818 mov r15, qword ptr [rax + 0x18]
145b1ccf1: 4489f1 mov ecx, r14d
145b1ccf4: 4c89fa mov rdx, r15
145b1ccf7: e8343ffcff call 0x145ae0c30
145b1ccfc: 84c0 test al, al
145b1ccfe: 743e je 0x145b1cd3e
145b1cd00: 488b9618100000 mov rdx, qword ptr [rsi + 0x1018]
145b1cd07: 4885d2 test rdx, rdx
145b1cd0a: 7432 je 0x145b1cd3e
145b1cd0c: 488b8e10100000 mov rcx, qword ptr [rsi + 0x1010]
145b1cd13: 4869c2b0000000 imul rax, rdx, 0xb0
145b1cd1a: 4531c0 xor r8d, r8d
145b1cd1d: 4531c9 xor r9d, r9d
145b1cd20: 4280bc09a800000000 cmp byte ptr [rcx + r9 + 0xa8], 0
145b1cd29: 0f8519070000 jne 0x145b1d448
145b1cd2f: 49ffc0 inc r8
145b1cd32: 4981c1b0000000 add r9, 0xb0
145b1cd39: 4c39c8 cmp rax, r9
145b1cd3c: 75e2 jne 0x145b1cd20
145b1cd3e: 4885ff test rdi, rdi
145b1cd41: 0f849d050000 je 0x145b1d2e4
145b1cd47: 41b801000000 mov r8d, 1
145b1cd4d: 4889d9 mov rcx, rbx
145b1cd50: 4889fa mov rdx, rdi
145b1cd53: e878544efa call 0x1400021d0
145b1cd58: e987050000 jmp 0x145b1d2e4
