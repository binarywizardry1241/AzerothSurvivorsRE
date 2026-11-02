0x145ae46c0: push rbp
0x145ae46c1: push r15
0x145ae46c3: push r14
0x145ae46c5: push r13
0x145ae46c7: push r12
0x145ae46c9: push rsi
0x145ae46ca: push rdi
0x145ae46cb: push rbx
0x145ae46cc: sub rsp, 0x98
0x145ae46d3: lea rbp, [rsp + 0x80]
0x145ae46db: mov qword ptr [rbp + 0x10], 0xfffffffffffffffe
0x145ae46e3: mov rsi, r8
0x145ae46e6: cmp dx, 0x51
0x145ae46ea: je 0x145ae4744
0x145ae46ec: movzx eax, dx
0x145ae46ef: cmp eax, 0x96
0x145ae46f4: jne 0x145ae476f
0x145ae46f6: mov qword ptr [rbp - 0x20], rcx
0x145ae46fa: mov r13, qword ptr [rsi + 0x10]
0x145ae46fe: cmp r13, 5
0x145ae4702: jb 0x145ae4905
0x145ae4708: mov rax, qword ptr [rsi + 8]
0x145ae470c: mov qword ptr [rbp - 0x18], rax
0x145ae4710: movzx eax, byte ptr [rax]
0x145ae4713: cmp rax, 8
0x145ae4717: ja 0x145ae4905
0x145ae471d: lea rcx, [rip + 0x17f9360]
0x145ae4724: movsxd rax, dword ptr [rcx + rax*4]
0x145ae4728: add rax, rcx
0x145ae472b: jmp rax
0x145ae472d: mov ecx, 0x15
0x145ae4732: lea rdi, [rcx + 4]
0x145ae4736: cmp rdi, r13
0x145ae4739: jbe 0x145ae48c4
0x145ae473f: jmp 0x145ae4905
0x145ae4744: mov rdi, qword ptr [rsi + 0x10]
0x145ae4748: cmp rdi, 9
0x145ae474c: jb 0x145ae476f
0x145ae474e: mov rbx, qword ptr [rsi + 8]
0x145ae4752: lea r15, [rbx + 8]
0x145ae4756: lea r13, [rdi - 8]
0x145ae475a: xor r12d, r12d
0x145ae475d: nop dword ptr [rax]
0x145ae4760: cmp byte ptr [r15 + r12], 0
0x145ae4765: je 0x145ae4785
0x145ae4767: inc r12
0x145ae476a: cmp r13, r12
0x145ae476d: jne 0x145ae4760
0x145ae476f: mov rax, qword ptr [rsi + 0x10]
0x145ae4773: mov qword ptr [rcx + 0x10], rax
0x145ae4777: movups xmm0, xmmword ptr [rsi]
0x145ae477a: movups xmmword ptr [rcx], xmm0
0x145ae477d: mov rax, rcx
0x145ae4780: jmp 0x145ae4917
0x145ae4785: mov qword ptr [rbp - 0x20], rcx
0x145ae4789: call 0x140002200
0x145ae478e: mov ecx, 8
0x145ae4793: mov edx, 1
0x145ae4798: call 0x1400021c0
0x145ae479d: test rax, rax
0x145ae47a0: mov qword ptr [rbp - 0x28], rsi
0x145ae47a4: je 0x145ae4f09
0x145ae47aa: lea rdx, [r12 + 8]
0x145ae47af: mov qword ptr [rbp - 0x10], 8
0x145ae47b7: mov qword ptr [rbp - 8], rax
0x145ae47bb: mov qword ptr [rbp - 0x18], rbx
0x145ae47bf: mov rcx, qword ptr [rbx]
0x145ae47c2: mov qword ptr [rax], rcx
0x145ae47c5: mov qword ptr [rbp], 8
0x145ae47cd: cmp r12, -9
0x145ae47d1: ja 0x145ae4e02
0x145ae47d7: cmp rdx, rdi
0x145ae47da: ja 0x145ae4e02
0x145ae47e0: lea rbx, [r15 + r12]
0x145ae47e4: mov r14d, 8
0x145ae47ea: lea rcx, [rbp - 0x10]
0x145ae47ee: nop
0x145ae47f0: cmp rbx, r15
0x145ae47f3: je 0x145ae483b
0x145ae47f5: movzx esi, byte ptr [r15]
0x145ae47f9: inc r15
0x145ae47fc: cmp sil, 0x7c
0x145ae4800: je 0x145ae47f0
0x145ae4802: cmp r14, qword ptr [rbp - 0x10]
0x145ae4806: jne 0x145ae482e
0x145ae4808: mov qword ptr [rsp + 0x20], 1
0x145ae4811: mov r8d, 1
0x145ae4817: mov r9d, 1
0x145ae481d: mov rdx, r14
0x145ae4820: call 0x145f977f0
0x145ae4825: nop
0x145ae4826: mov rax, qword ptr [rbp - 8]
0x145ae482a: lea rcx, [rbp - 0x10]
0x145ae482e: mov byte ptr [rax + r14], sil
0x145ae4832: inc r14
0x145ae4835: mov qword ptr [rbp], r14
0x145ae4839: jmp 0x145ae47f0
0x145ae483b: mov r8, rdi
0x145ae483e: sub r8, r12
0x145ae4841: add r8, -8
0x145ae4845: mov rax, qword ptr [rbp - 0x10]
0x145ae4849: sub rax, r14
0x145ae484c: cmp r8, rax
0x145ae484f: ja 0x145ae4e1c
0x145ae4855: cmp r13, r12
0x145ae4858: je 0x145ae4869
0x145ae485a: mov rcx, qword ptr [rbp - 8]
0x145ae485e: add rcx, r14
0x145ae4861: mov rdx, rbx
0x145ae4864: call 0x145f973db
0x145ae4869: add rdi, r14
0x145ae486c: sub rdi, r12
0x145ae486f: add rdi, -8
0x145ae4873: mov qword ptr [rbp], rdi
0x145ae4877: mov rsi, qword ptr [rbp - 0x20]
0x145ae487b: mov qword ptr [rsi + 0x10], rdi
0x145ae487f: movups xmm0, xmmword ptr [rbp - 0x10]
0x145ae4883: movups xmmword ptr [rsi], xmm0
0x145ae4886: mov rax, qword ptr [rbp - 0x28]
0x145ae488a: mov rdx, qword ptr [rax]
0x145ae488d: test rdx, rdx
0x145ae4890: je 0x145ae48a1
0x145ae4892: mov r8d, 1
0x145ae4898: mov rcx, qword ptr [rbp - 0x18]
0x145ae489c: call 0x1400021d0
0x145ae48a1: mov rax, rsi
0x145ae48a4: jmp 0x145ae4917
0x145ae48a6: mov rax, qword ptr [rbp - 0x18]
0x145ae48aa: cmp dword ptr [rax + 1], -1
0x145ae48ae: jne 0x145ae472d
0x145ae48b4: jmp 0x145ae4905
0x145ae48b6: mov ecx, 0xd
0x145ae48bb: lea rdi, [rcx + 4]
0x145ae48bf: cmp rdi, r13
0x145ae48c2: ja 0x145ae4905
0x145ae48c4: mov rax, qword ptr [rbp - 0x18]
0x145ae48c8: mov r8d, dword ptr [rax + rcx]
0x145ae48cc: cmp r8, 1
0x145ae48d0: mov qword ptr [rbp - 0x58], r8
0x145ae48d4: adc r8, -1
0x145ae48d8: lea rax, [r8 + rdi]
0x145ae48dc: cmp rax, r13
0x145ae48df: ja 0x145ae4905
0x145ae48e1: mov qword ptr [rbp - 0x50], rcx
0x145ae48e5: mov qword ptr [rbp - 0x28], rsi
0x145ae48e9: mov rax, qword ptr [rbp - 0x18]
0x145ae48ed: lea rdx, [rax + rdi]
0x145ae48f1: lea rcx, [rbp - 0x10]
0x145ae48f5: call 0x145f72950
0x145ae48fa: nop
0x145ae48fb: cmp dword ptr [rbp - 0x10], 1
0x145ae48ff: jne 0x145ae492b
0x145ae4901: mov rsi, qword ptr [rbp - 0x28]
0x145ae4905: mov rcx, qword ptr [rsi + 0x10]
0x145ae4909: mov rax, qword ptr [rbp - 0x20]
0x145ae490d: mov qword ptr [rax + 0x10], rcx
0x145ae4911: movups xmm0, xmmword ptr [rsi]
0x145ae4914: movups xmmword ptr [rax], xmm0
0x145ae4917: add rsp, 0x98
0x145ae491e: pop rbx
0x145ae491f: pop rdi
0x145ae4920: pop rsi
0x145ae4921: pop r12
0x145ae4923: pop r13
0x145ae4925: pop r14
0x145ae4927: pop r15
0x145ae4929: pop rbp
0x145ae492a: ret
0x145ae492b: mov rsi, rdi
0x145ae492e: mov r14, qword ptr [rbp - 8]
0x145ae4932: mov r15, qword ptr [rbp]
0x145ae4936: mov qword ptr [rsp + 0x20], 1
0x145ae493f: lea rcx, [rbp - 0x10]
0x145ae4943: mov r9d, 1
0x145ae4949: mov rdx, r15
0x145ae494c: xor r8d, r8d
0x145ae494f: call 0x1400156a0
0x145ae4954: mov rcx, qword ptr [rbp - 8]
0x145ae4958: cmp dword ptr [rbp - 0x10], 1
0x145ae495c: je 0x145ae4e50
0x145ae4962: mov rax, qword ptr [rbp]
0x145ae4966: mov qword ptr [rbp - 0x40], rcx
0x145ae496a: mov qword ptr [rbp - 0x38], rax
0x145ae496e: mov qword ptr [rbp - 0x30], 0
0x145ae4976: add r15, r14
0x145ae4979: mov r12d, 0xfffffffe
0x145ae497f: xor ebx, ebx
0x145ae4981: lea rcx, [rbp - 0x40]
0x145ae4985: jmp 0x145ae49a4
0x145ae4987: or dl, 0xc0
0x145ae498a: mov byte ptr [rax + rbx], dl
0x145ae498d: mov byte ptr [rax + rbx + 1], r9b
0x145ae4992: mov edx, 2
0x145ae4997: add rbx, rdx
0x145ae499a: mov qword ptr [rbp - 0x30], rbx
0x145ae499e: mov r12d, 0xfffffffe
0x145ae49a4: cmp r12d, -2
0x145ae49a8: je 0x145ae49e0
0x145ae49aa: cmp r12d, -1
0x145ae49ae: je 0x145ae4cac
0x145ae49b4: cmp r12d, 0x80
0x145ae49bb: jae 0x145ae4add
0x145ae49c1: cmp qword ptr [rbp - 0x40], rbx
0x145ae49c5: je 0x145ae4c31
0x145ae49cb: mov rax, qword ptr [rbp - 0x38]
0x145ae49cf: mov byte ptr [rax + rbx], r12b
0x145ae49d3: mov edx, 1
0x145ae49d8: jmp 0x145ae4997
0x145ae49da: nop word ptr [rax + rax]
0x145ae49e0: cmp r14, r15
0x145ae49e3: je 0x145ae4cac
0x145ae49e9: movzx edx, byte ptr [r14]
0x145ae49ed: movzx r12d, dl
0x145ae49f1: test r12b, r12b
0x145ae49f4: js 0x145ae4a53
0x145ae49f6: inc r14
0x145ae49f9: mov rdi, r14
0x145ae49fc: cmp r12d, 0x7c
0x145ae4a00: jne 0x145ae4acd
0x145ae4a06: mov rdx, qword ptr [rbp - 0x40]
0x145ae4a0a: sub rdx, rbx
0x145ae4a0d: cmp rdx, 1
0x145ae4a11: jbe 0x145ae4c7b
0x145ae4a17: mov word ptr [rax + rbx], 0x7c7c
0x145ae4a1d: add rbx, 2
0x145ae4a21: mov qword ptr [rbp - 0x30], rbx
0x145ae4a25: mov r12d, 0xffffffff
0x145ae4a2b: mov r14, r15
0x145ae4a2e: cmp rdi, r15
0x145ae4a31: je 0x145ae49a4
0x145ae4a37: movzx r8d, byte ptr [rdi]
0x145ae4a3b: movzx r10d, r8b
0x145ae4a3f: test r10b, r10b
0x145ae4a42: js 0x145ae4b8d
0x145ae4a48: inc rdi
0x145ae4a4b: mov r14, rdi
0x145ae4a4e: jmp 0x145ae4c0a
0x145ae4a53: mov r9d, r12d
0x145ae4a56: and r9d, 0x1f
0x145ae4a5a: movzx r8d, byte ptr [r14 + 1]
0x145ae4a5f: and r8d, 0x3f
0x145ae4a63: cmp r12b, 0xdf
0x145ae4a67: jbe 0x145ae4ab2
0x145ae4a69: movzx r12d, byte ptr [r14 + 2]
0x145ae4a6e: shl r8d, 6
0x145ae4a72: and r12d, 0x3f
0x145ae4a76: or r12d, r8d
0x145ae4a79: cmp dl, 0xf0
0x145ae4a7c: jb 0x145ae4bdd
0x145ae4a82: movzx edx, byte ptr [r14 + 3]
0x145ae4a87: add r14, 4
0x145ae4a8b: and r9d, 7
0x145ae4a8f: shl r9d, 0x12
0x145ae4a93: shl r12d, 6
0x145ae4a97: and edx, 0x3f
0x145ae4a9a: or edx, r12d
0x145ae4a9d: or edx, r9d
0x145ae4aa0: mov rdi, r14
0x145ae4aa3: mov r12d, edx
0x145ae4aa6: cmp r12d, 0x7c
0x145ae4aaa: je 0x145ae4a06
0x145ae4ab0: jmp 0x145ae4acd
0x145ae4ab2: add r14, 2
0x145ae4ab6: shl r9d, 6
0x145ae4aba: or r9d, r8d
0x145ae4abd: mov rdi, r14
0x145ae4ac0: mov r12d, r9d
0x145ae4ac3: cmp r12d, 0x7c
0x145ae4ac7: je 0x145ae4a06
0x145ae4acd: mov r14, rdi
0x145ae4ad0: cmp r12d, 0x80
0x145ae4ad7: jb 0x145ae49c1
0x145ae4add: cmp r12d, 0x10000
0x145ae4ae4: mov r8d, 4
0x145ae4aea: sbb r8, 0
0x145ae4aee: cmp r12d, 0x800
0x145ae4af5: mov eax, 2
0x145ae4afa: cmovb r8, rax
0x145ae4afe: mov rax, qword ptr [rbp - 0x40]
0x145ae4b02: sub rax, rbx
0x145ae4b05: cmp r8, rax
0x145ae4b08: ja 0x145ae4c59
0x145ae4b0e: mov r9d, r12d
0x145ae4b11: and r9b, 0x3f
0x145ae4b15: or r9b, 0x80
0x145ae4b19: mov edx, r12d
0x145ae4b1c: shr edx, 6
0x145ae4b1f: mov rax, qword ptr [rbp - 0x38]
0x145ae4b23: cmp r12d, 0x800
0x145ae4b2a: jb 0x145ae4987
0x145ae4b30: and dl, 0x3f
0x145ae4b33: or dl, 0x80
0x145ae4b36: mov r8d, r12d
0x145ae4b39: shr r8d, 0xc
0x145ae4b3d: cmp r12d, 0xffff
0x145ae4b44: ja 0x145ae4b61
0x145ae4b46: or r8b, 0xe0
0x145ae4b4a: mov byte ptr [rax + rbx], r8b
0x145ae4b4e: mov byte ptr [rax + rbx + 1], dl
0x145ae4b52: mov byte ptr [rax + rbx + 2], r9b
0x145ae4b57: mov edx, 3
0x145ae4b5c: jmp 0x145ae4997
0x145ae4b61: and r8b, 0x3f
0x145ae4b65: or r8b, 0x80
0x145ae4b69: shr r12d, 0x12
0x145ae4b6d: or r12b, 0xf0
0x145ae4b71: mov byte ptr [rax + rbx], r12b
0x145ae4b75: mov byte ptr [rax + rbx + 1], r8b
0x145ae4b7a: mov byte ptr [rax + rbx + 2], dl
0x145ae4b7e: mov byte ptr [rax + rbx + 3], r9b
0x145ae4b83: mov edx, 4
0x145ae4b88: jmp 0x145ae4997
0x145ae4b8d: mov edx, r10d
0x145ae4b90: and edx, 0x1f
0x145ae4b93: movzx r9d, byte ptr [rdi + 1]
0x145ae4b98: and r9d, 0x3f
0x145ae4b9c: cmp r10b, 0xdf
0x145ae4ba0: jbe 0x145ae4bfa
0x145ae4ba2: movzx r10d, byte ptr [rdi + 2]
0x145ae4ba7: shl r9d, 6
0x145ae4bab: and r10d, 0x3f
0x145ae4baf: or r10d, r9d
0x145ae4bb2: cmp r8b, 0xf0
0x145ae4bb6: jb 0x145ae4c22
0x145ae4bb8: movzx r8d, byte ptr [rdi + 3]
0x145ae4bbd: add rdi, 4
0x145ae4bc1: and edx, 7
0x145ae4bc4: shl edx, 0x12
0x145ae4bc7: shl r10d, 6
0x145ae4bcb: and r8d, 0x3f
0x145ae4bcf: or r8d, r10d
0x145ae4bd2: or r8d, edx
0x145ae4bd5: mov r14, rdi
0x145ae4bd8: mov r10d, r8d
0x145ae4bdb: jmp 0x145ae4c0a
0x145ae4bdd: add r14, 3
0x145ae4be1: shl r9d, 0xc
0x145ae4be5: or r12d, r9d
0x145ae4be8: mov rdi, r14
0x145ae4beb: cmp r12d, 0x7c
0x145ae4bef: je 0x145ae4a06
0x145ae4bf5: jmp 0x145ae4acd
0x145ae4bfa: add rdi, 2
0x145ae4bfe: shl edx, 6
0x145ae4c01: or edx, r9d
0x145ae4c04: mov r14, rdi
0x145ae4c07: mov r10d, edx
0x145ae4c0a: mov r12d, 0xfffffffe
0x145ae4c10: cmp r10d, 0x7c
0x145ae4c14: je 0x145ae49a4
0x145ae4c1a: mov r12d, r10d
0x145ae4c1d: jmp 0x145ae49a4
0x145ae4c22: add rdi, 3
0x145ae4c26: shl edx, 0xc
0x145ae4c29: or r10d, edx
0x145ae4c2c: jmp 0x145ae4a4b
0x145ae4c31: mov qword ptr [rsp + 0x20], 1
0x145ae4c3a: mov r8d, 1
0x145ae4c40: mov r9d, 1
0x145ae4c46: mov rdx, rbx
0x145ae4c49: mov rdi, rcx
0x145ae4c4c: call 0x145f977f0
0x145ae4c51: mov rcx, rdi
0x145ae4c54: jmp 0x145ae49cb
0x145ae4c59: mov qword ptr [rsp + 0x20], 1
0x145ae4c62: mov r9d, 1
0x145ae4c68: mov rdx, rbx
0x145ae4c6b: mov rdi, rcx
0x145ae4c6e: call 0x145f977f0
0x145ae4c73: mov rcx, rdi
0x145ae4c76: jmp 0x145ae4b0e
0x145ae4c7b: mov qword ptr [rsp + 0x20], 1
0x145ae4c84: mov r8d, 2
0x145ae4c8a: mov r9d, 1
0x145ae4c90: mov rdx, rbx
0x145ae4c93: mov rbx, rcx
0x145ae4c96: call 0x145f977f0
0x145ae4c9b: nop
0x145ae4c9c: mov rcx, rbx
0x145ae4c9f: mov rax, qword ptr [rbp - 0x38]
0x145ae4ca3: mov rbx, qword ptr [rbp - 0x30]
0x145ae4ca7: jmp 0x145ae4a17
0x145ae4cac: mov qword ptr [rsp + 0x20], 1
0x145ae4cb5: lea rcx, [rbp - 0x10]
0x145ae4cb9: mov r9d, 1
0x145ae4cbf: mov rdi, qword ptr [rbp - 0x50]
0x145ae4cc3: mov rdx, rdi
0x145ae4cc6: xor r8d, r8d
0x145ae4cc9: call 0x1400156a0
0x145ae4cce: mov r15, qword ptr [rbp - 8]
0x145ae4cd2: cmp byte ptr [rbp - 0x10], 0
0x145ae4cd6: jne 0x145ae4e5f
0x145ae4cdc: mov r12, qword ptr [rbp]
0x145ae4ce0: mov qword ptr [rbp - 0x10], r15
0x145ae4ce4: mov qword ptr [rbp - 8], r12
0x145ae4ce8: mov rcx, r12
0x145ae4ceb: mov rdx, qword ptr [rbp - 0x18]
0x145ae4cef: mov r8, rdi
0x145ae4cf2: call 0x145f973db
0x145ae4cf7: mov qword ptr [rbp], rdi
0x145ae4cfb: mov rax, r15
0x145ae4cfe: sub rax, rdi
0x145ae4d01: cmp rax, 3
0x145ae4d05: jbe 0x145ae4e71
0x145ae4d0b: mov r14, rsi
0x145ae4d0e: lea eax, [rbx + 1]
0x145ae4d11: mov dword ptr [r12 + rdi], eax
0x145ae4d15: mov qword ptr [rbp], r14
0x145ae4d19: mov rdi, qword ptr [rbp - 0x38]
0x145ae4d1d: mov rax, r15
0x145ae4d20: sub rax, r14
0x145ae4d23: cmp rbx, rax
0x145ae4d26: ja 0x145ae4ea8
0x145ae4d2c: test rbx, rbx
0x145ae4d2f: je 0x145ae4d40
0x145ae4d31: lea rcx, [r12 + r14]
0x145ae4d35: mov rdx, rdi
0x145ae4d38: mov r8, rbx
0x145ae4d3b: call 0x145f973db
0x145ae4d40: add r14, rbx
0x145ae4d43: mov qword ptr [rbp], r14
0x145ae4d47: cmp r14, r15
0x145ae4d4a: jne 0x145ae4d5a
0x145ae4d4c: lea rcx, [rbp - 0x10]
0x145ae4d50: call 0x14613e2b0
0x145ae4d55: nop
0x145ae4d56: mov r12, qword ptr [rbp - 8]
0x145ae4d5a: mov byte ptr [r12 + r14], 0
0x145ae4d5f: inc r14
0x145ae4d62: mov qword ptr [rbp], r14
0x145ae4d66: add rsi, qword ptr [rbp - 0x58]
0x145ae4d6a: cmp r13, rsi
0x145ae4d6d: mov r15, rsi
0x145ae4d70: cmovb r15, r13
0x145ae4d74: mov rbx, r13
0x145ae4d77: sub rbx, r15
0x145ae4d7a: mov rax, qword ptr [rbp - 0x10]
0x145ae4d7e: sub rax, r14
0x145ae4d81: cmp rbx, rax
0x145ae4d84: ja 0x145ae4ed8
0x145ae4d8a: cmp r13, rsi
0x145ae4d8d: jbe 0x145ae4da9
0x145ae4d8f: add r15, qword ptr [rbp - 0x18]
0x145ae4d93: add r14, qword ptr [rbp - 8]
0x145ae4d97: mov rcx, r14
0x145ae4d9a: mov rdx, r15
0x145ae4d9d: mov r8, rbx
0x145ae4da0: call 0x145f973db
0x145ae4da5: mov r14, qword ptr [rbp]
0x145ae4da9: mov rsi, qword ptr [rbp - 0x20]
0x145ae4dad: add r14, rbx
0x145ae4db0: mov qword ptr [rbp], r14
0x145ae4db4: mov qword ptr [rsi + 0x10], r14
0x145ae4db8: movups xmm0, xmmword ptr [rbp - 0x10]
0x145ae4dbc: movups xmmword ptr [rsi], xmm0
0x145ae4dbf: mov rdx, qword ptr [rbp - 0x40]
0x145ae4dc3: test rdx, rdx
0x145ae4dc6: je 0x145ae4dda
0x145ae4dc8: mov r8d, 1
0x145ae4dce: mov rcx, rdi
0x145ae4dd1: call 0x1400021d0
0x145ae4dd6: mov rsi, qword ptr [rbp - 0x20]
0x145ae4dda: mov rax, qword ptr [rbp - 0x28]
0x145ae4dde: mov rdx, qword ptr [rax]
0x145ae4de1: test rdx, rdx
0x145ae4de4: je 0x145ae48a1
0x145ae4dea: mov r8d, 1
0x145ae4df0: mov rcx, qword ptr [rbp - 0x18]
0x145ae4df4: call 0x1400021d0
0x145ae4df9: mov rsi, qword ptr [rbp - 0x20]
0x145ae4dfd: jmp 0x145ae48a1
0x145ae4e02: lea r9, [rip + 0x17f6d27]
0x145ae4e09: mov ecx, 8
0x145ae4e0e: mov r8, rdi
0x145ae4e11: call 0x14613e960
0x145ae4e16: nop
0x145ae4e17: jmp 0x145ae4f21
0x145ae4e1c: mov qword ptr [rsp + 0x20], 1
0x145ae4e25: lea rcx, [rbp - 0x10]
0x145ae4e29: mov r9d, 1
0x145ae4e2f: mov rdx, r14
0x145ae4e32: mov rsi, r8
0x145ae4e35: call 0x145f977f0
0x145ae4e3a: nop
0x145ae4e3b: mov r14, qword ptr [rbp]
0x145ae4e3f: mov r8, rsi
0x145ae4e42: cmp r13, r12
0x145ae4e45: jne 0x145ae485a
0x145ae4e4b: jmp 0x145ae4869
0x145ae4e50: mov rdx, qword ptr [rbp]
0x145ae4e54: call 0x14613e3bb
0x145ae4e59: nop
0x145ae4e5a: jmp 0x145ae4f21
0x145ae4e5f: mov rdx, qword ptr [rbp]
0x145ae4e63: mov rcx, r15
0x145ae4e66: call 0x14613e3bb
0x145ae4e6b: nop
0x145ae4e6c: jmp 0x145ae4f21
0x145ae4e71: mov qword ptr [rsp + 0x20], 1
0x145ae4e7a: lea rcx, [rbp - 0x10]
0x145ae4e7e: mov r8d, 4
0x145ae4e84: mov r9d, 1
0x145ae4e8a: mov rdx, rdi
0x145ae4e8d: call 0x145f977f0
0x145ae4e92: nop
0x145ae4e93: mov rdi, qword ptr [rbp]
0x145ae4e97: mov r15, qword ptr [rbp - 0x10]
0x145ae4e9b: mov r12, qword ptr [rbp - 8]
0x145ae4e9f: lea r14, [rdi + 4]
0x145ae4ea3: jmp 0x145ae4d0e
0x145ae4ea8: mov qword ptr [rsp + 0x20], 1
0x145ae4eb1: lea rcx, [rbp - 0x10]
0x145ae4eb5: mov r9d, 1
0x145ae4ebb: mov rdx, r14
0x145ae4ebe: mov r8, rbx
0x145ae4ec1: call 0x145f977f0
0x145ae4ec6: nop
0x145ae4ec7: mov r14, qword ptr [rbp]
0x145ae4ecb: mov r15, qword ptr [rbp - 0x10]
0x145ae4ecf: mov r12, qword ptr [rbp - 8]
0x145ae4ed3: jmp 0x145ae4d31
0x145ae4ed8: mov qword ptr [rsp + 0x20], 1
0x145ae4ee1: lea rcx, [rbp - 0x10]
0x145ae4ee5: mov r9d, 1
0x145ae4eeb: mov rdx, r14
0x145ae4eee: mov r8, rbx
0x145ae4ef1: call 0x145f977f0
0x145ae4ef6: nop
0x145ae4ef7: mov r14, qword ptr [rbp]
0x145ae4efb: cmp r13, rsi
0x145ae4efe: ja 0x145ae4d8f
0x145ae4f04: jmp 0x145ae4da9
0x145ae4f09: mov qword ptr [rbp - 0x48], rbx
0x145ae4f0d: mov byte ptr [rbp + 0xf], 1
0x145ae4f11: mov ecx, 1
0x145ae4f16: mov edx, 8
0x145ae4f1b: call 0x14613e3bb
0x145ae4f20: nop
0x145ae4f21: ud2
