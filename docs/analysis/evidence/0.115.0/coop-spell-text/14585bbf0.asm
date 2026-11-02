0x14585bbf0: push rbp
0x14585bbf1: push r14
0x14585bbf3: push rsi
0x14585bbf4: push rdi
0x14585bbf5: push rbx
0x14585bbf6: sub rsp, 0x60
0x14585bbfa: lea rbp, [rsp + 0x60]
0x14585bbff: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x14585bc07: mov rsi, rcx
0x14585bc0a: movss dword ptr [rbp - 0xc], xmm1
0x14585bc0f: lea rax, [rbp - 0xc]
0x14585bc13: mov qword ptr [rbp - 0x40], rax
0x14585bc17: lea rax, [rip + 0x49c4e2]
0x14585bc1e: mov qword ptr [rbp - 0x38], rax
0x14585bc22: lea rdx, [rip + 0x17ceb87]
0x14585bc29: lea rcx, [rbp - 0x30]
0x14585bc2d: lea r8, [rbp - 0x40]
0x14585bc31: call 0x145ce7350
0x14585bc36: mov r14, qword ptr [rbp - 0x28]
0x14585bc3a: mov rcx, qword ptr [rbp - 0x20]
0x14585bc3e: jmp 0x14585bc4f
0x14585bc40: dec rcx
0x14585bc43: sub rcx, r14
0x14585bc46: cmp edx, 0x30
0x14585bc49: jne 0x14585bcdb
0x14585bc4f: mov rax, rcx
0x14585bc52: test rcx, rcx
0x14585bc55: je 0x14585bcdb
0x14585bc5b: lea rcx, [r14 + rax]
0x14585bc5f: movsx edx, byte ptr [rcx - 1]
0x14585bc63: test edx, edx
0x14585bc65: jns 0x14585bc40
0x14585bc67: movzx r8d, byte ptr [rcx - 2]
0x14585bc6c: cmp r8b, 0xc0
0x14585bc70: jge 0x14585bc97
0x14585bc72: movzx r9d, byte ptr [rcx - 3]
0x14585bc77: cmp r9b, 0xc0
0x14585bc7b: jge 0x14585bca1
0x14585bc7d: movzx r10d, byte ptr [rcx - 4]
0x14585bc82: add rcx, -4
0x14585bc86: and r10d, 7
0x14585bc8a: shl r10d, 6
0x14585bc8e: and r9d, 0x3f
0x14585bc92: or r9d, r10d
0x14585bc95: jmp 0x14585bca9
0x14585bc97: add rcx, -2
0x14585bc9b: and r8d, 0x1f
0x14585bc9f: jmp 0x14585bcb4
0x14585bca1: add rcx, -3
0x14585bca5: and r9d, 0xf
0x14585bca9: shl r9d, 6
0x14585bcad: and r8d, 0x3f
0x14585bcb1: or r8d, r9d
0x14585bcb4: shl r8d, 6
0x14585bcb8: and dl, 0x3f
0x14585bcbb: movzx edx, dl
0x14585bcbe: or edx, r8d
0x14585bcc1: sub rcx, r14
0x14585bcc4: cmp edx, 0x30
0x14585bcc7: je 0x14585bc4f
0x14585bcc9: jmp 0x14585bcdb
0x14585bccb: nop dword ptr [rax + rax]
0x14585bcd0: dec rax
0x14585bcd3: sub rax, r14
0x14585bcd6: cmp ecx, 0x2e
0x14585bcd9: jne 0x14585bd55
0x14585bcdb: mov rdx, rax
0x14585bcde: test rax, rax
0x14585bce1: je 0x14585bd68
0x14585bce7: lea rax, [r14 + rdx]
0x14585bceb: movsx ecx, byte ptr [rax - 1]
0x14585bcef: test ecx, ecx
0x14585bcf1: jns 0x14585bcd0
0x14585bcf3: movzx r8d, byte ptr [rax - 2]
0x14585bcf8: cmp r8b, 0xc0
0x14585bcfc: jge 0x14585bd23
0x14585bcfe: movzx r9d, byte ptr [rax - 3]
0x14585bd03: cmp r9b, 0xc0
0x14585bd07: jge 0x14585bd2d
0x14585bd09: movzx r10d, byte ptr [rax - 4]
0x14585bd0e: add rax, -4
0x14585bd12: and r10d, 7
0x14585bd16: shl r10d, 6
0x14585bd1a: and r9d, 0x3f
0x14585bd1e: or r9d, r10d
0x14585bd21: jmp 0x14585bd35
0x14585bd23: add rax, -2
0x14585bd27: and r8d, 0x1f
0x14585bd2b: jmp 0x14585bd40
0x14585bd2d: add rax, -3
0x14585bd31: and r9d, 0xf
0x14585bd35: shl r9d, 6
0x14585bd39: and r8d, 0x3f
0x14585bd3d: or r8d, r9d
0x14585bd40: shl r8d, 6
0x14585bd44: and cl, 0x3f
0x14585bd47: movzx ecx, cl
0x14585bd4a: or ecx, r8d
0x14585bd4d: sub rax, r14
0x14585bd50: cmp ecx, 0x2e
0x14585bd53: je 0x14585bcdb
0x14585bd55: test rdx, rdx
0x14585bd58: mov qword ptr [rbp - 0x18], r14
0x14585bd5c: jns 0x14585bd9b
0x14585bd5e: xor ecx, ecx
0x14585bd60: call 0x145eb6fcb
0x14585bd65: nop
0x14585bd66: ud2
0x14585bd68: mov ebx, 1
0x14585bd6d: mov qword ptr [rsi], rdx
0x14585bd70: mov qword ptr [rsi + 8], rbx
0x14585bd74: mov qword ptr [rsi + 0x10], rdx
0x14585bd78: mov rdx, qword ptr [rbp - 0x30]
0x14585bd7c: test rdx, rdx
0x14585bd7f: je 0x14585bd90
0x14585bd81: mov r8d, 1
0x14585bd87: mov rcx, r14
0x14585bd8a: call 0x1400021d0
0x14585bd8f: nop
0x14585bd90: add rsp, 0x60
0x14585bd94: pop rbx
0x14585bd95: pop rdi
0x14585bd96: pop rsi
0x14585bd97: pop r14
0x14585bd99: pop rbp
0x14585bd9a: ret
0x14585bd9b: mov rdi, rdx
0x14585bd9e: call 0x140002200
0x14585bda3: mov edx, 1
0x14585bda8: mov rcx, rdi
0x14585bdab: call 0x1400021c0
0x14585bdb0: mov ecx, 1
0x14585bdb5: mov rdx, rdi
0x14585bdb8: test rax, rax
0x14585bdbb: je 0x14585bd60
0x14585bdbd: mov rbx, rax
0x14585bdc0: mov rcx, rax
0x14585bdc3: mov r14, qword ptr [rbp - 0x18]
0x14585bdc7: mov rdx, r14
0x14585bdca: mov r8, rdi
0x14585bdcd: call 0x145d145fb
0x14585bdd2: mov rdx, rdi
0x14585bdd5: jmp 0x14585bd6d
