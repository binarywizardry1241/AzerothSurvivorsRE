0x14588dbf0: push rbp
0x14588dbf1: push r15
0x14588dbf3: push r14
0x14588dbf5: push r13
0x14588dbf7: push r12
0x14588dbf9: push rsi
0x14588dbfa: push rdi
0x14588dbfb: push rbx
0x14588dbfc: sub rsp, 0x98
0x14588dc03: lea rbp, [rsp + 0x80]
0x14588dc0b: movaps xmmword ptr [rbp], xmm6
0x14588dc0f: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x14588dc17: mov rsi, rcx
0x14588dc1a: call 0x145889ce0
0x14588dc1f: xor r14d, r14d
0x14588dc22: cmp dword ptr [rsi + 0x10], 2
0x14588dc26: je 0x14588dc3b
0x14588dc28: cmp byte ptr [rsi + 0xc51], 0
0x14588dc2f: je 0x14588dc3b
0x14588dc31: mov r14, qword ptr [rsi + 0x998]
0x14588dc38: inc r14
0x14588dc3b: xor edi, edi
0x14588dc3d: lea rbx, [rbp - 0x58]
0x14588dc41: mov edx, 8
0x14588dc46: mov rcx, rbx
0x14588dc49: xor r8d, r8d
0x14588dc4c: xor r9d, r9d
0x14588dc4f: call 0x1459a9e30
0x14588dc54: cmp rdi, r14
0x14588dc57: jae 0x14588dc77
0x14588dc59: nop dword ptr [rax]
0x14588dc60: mov rcx, rsi
0x14588dc63: mov rdx, rdi
0x14588dc66: mov r8, rbx
0x14588dc69: call 0x145894fe0
0x14588dc6e: nop
0x14588dc6f: inc rdi
0x14588dc72: cmp rdi, r14
0x14588dc75: jb 0x14588dc60
0x14588dc77: cmp dword ptr [rsi + 0xc58], 3
0x14588dc7e: jne 0x14588dee9
0x14588dc84: mov r13, qword ptr [rsi + 0xc90]
0x14588dc8b: imul r15, qword ptr [rsi + 0xc98], 0x478
0x14588dc96: add r15, r13
0x14588dc99: xorps xmm6, xmm6
0x14588dc9c: lea rdi, [rip + 0x179f65d]
0x14588dca3: lea rbx, [rbp - 0x38]
0x14588dca7: cmp r13, r15
0x14588dcaa: je 0x14588dede
0x14588dcb0: cmp qword ptr [r13], 0
0x14588dcb5: mov qword ptr [r13], 0
0x14588dcbd: je 0x14588dd31
0x14588dcbf: mov rcx, qword ptr [r13 + 0x460]
0x14588dcc6: mov rdx, qword ptr [r13 + 0x468]
0x14588dccd: lea r8, [r13 + 0x260]
0x14588dcd4: call 0x145824200
0x14588dcd9: nop
0x14588dcda: mov r14, qword ptr [r13 + 0x460]
0x14588dce1: mov r12, qword ptr [r13 + 0x468]
0x14588dce8: mov rcx, rbx
0x14588dceb: mov rdx, rdi
0x14588dcee: call 0x14581c690
0x14588dcf3: nop
0x14588dcf4: mov rdx, qword ptr [rbp - 0x30]
0x14588dcf8: mov r8, qword ptr [rbp - 0x28]
0x14588dcfc: lock add qword ptr [rip + 0x2989444], r8
0x14588dd04: lock inc qword ptr [rip + 0x298944c]
0x14588dd0c: mov rcx, r14
0x14588dd0f: mov qword ptr [rbp - 0x18], rdx
0x14588dd13: call qword ptr [r12 + 0x18]
0x14588dd18: nop
0x14588dd19: mov rdx, qword ptr [rbp - 0x38]
0x14588dd1d: test rdx, rdx
0x14588dd20: je 0x14588dd31
0x14588dd22: mov r8d, 1
0x14588dd28: mov rcx, qword ptr [rbp - 0x18]
0x14588dd2c: call 0x1400021d0
0x14588dd31: mov qword ptr [rbp - 0x20], r13
0x14588dd35: mov byte ptr [r13 + 0x471], 0
0x14588dd3d: lea rcx, [r13 + 0x20]
0x14588dd41: call 0x145871fc0
0x14588dd46: nop
0x14588dd47: mov rax, qword ptr [rbp - 0x20]
0x14588dd4b: mov qword ptr [rax + 0x20], 0
0x14588dd53: mov qword ptr [rax + 0x28], 8
0x14588dd5b: movups xmmword ptr [rax + 0x30], xmm6
0x14588dd5f: mov qword ptr [rax + 0x40], 4
0x14588dd67: movups xmmword ptr [rax + 0x48], xmm6
0x14588dd6b: mov qword ptr [rax + 0x58], 1
0x14588dd73: movups xmmword ptr [rax + 0x60], xmm6
0x14588dd77: mov qword ptr [rax + 0x70], 1
0x14588dd7f: movups xmmword ptr [rax + 0x78], xmm6
0x14588dd83: mov qword ptr [rax + 0x88], 1
0x14588dd8e: movups xmmword ptr [rax + 0x90], xmm6
0x14588dd95: mov qword ptr [rax + 0xa0], 1
0x14588dda0: movups xmmword ptr [rax + 0xa8], xmm6
0x14588dda7: mov qword ptr [rax + 0xb8], 1
0x14588ddb2: movups xmmword ptr [rax + 0xc0], xmm6
0x14588ddb9: mov qword ptr [rax + 0xd0], 1
0x14588ddc4: movups xmmword ptr [rax + 0xd8], xmm6
0x14588ddcb: mov qword ptr [rax + 0xe8], 1
0x14588ddd6: movups xmmword ptr [rax + 0xf0], xmm6
0x14588dddd: mov qword ptr [rax + 0x100], 1
0x14588dde8: movups xmmword ptr [rax + 0x108], xmm6
0x14588ddef: mov qword ptr [rax + 0x118], 1
0x14588ddfa: movups xmmword ptr [rax + 0x120], xmm6
0x14588de01: mov qword ptr [rax + 0x130], 1
0x14588de0c: movups xmmword ptr [rax + 0x138], xmm6
0x14588de13: mov qword ptr [rax + 0x148], 1
0x14588de1e: movups xmmword ptr [rax + 0x150], xmm6
0x14588de25: mov qword ptr [rax + 0x160], 1
0x14588de30: movups xmmword ptr [rax + 0x168], xmm6
0x14588de37: mov qword ptr [rax + 0x178], 1
0x14588de42: movups xmmword ptr [rax + 0x180], xmm6
0x14588de49: mov qword ptr [rax + 0x190], 1
0x14588de54: movups xmmword ptr [rax + 0x198], xmm6
0x14588de5b: mov qword ptr [rax + 0x1a8], 1
0x14588de66: movups xmmword ptr [rax + 0x1b0], xmm6
0x14588de6d: mov qword ptr [rax + 0x1c0], 1
0x14588de78: movups xmmword ptr [rax + 0x1c8], xmm6
0x14588de7f: mov qword ptr [rax + 0x1d8], 1
0x14588de8a: movups xmmword ptr [rax + 0x1e0], xmm6
0x14588de91: mov qword ptr [rax + 0x1f0], 1
0x14588de9c: movups xmmword ptr [rax + 0x1f8], xmm6
0x14588dea3: mov qword ptr [rax + 0x208], 1
0x14588deae: movups xmmword ptr [rax + 0x210], xmm6
0x14588deb5: mov qword ptr [rax + 0x220], 1
0x14588dec0: movups xmmword ptr [rax + 0x238], xmm6
0x14588dec7: movups xmmword ptr [rax + 0x228], xmm6
0x14588dece: lea r13, [rax + 0x478]
0x14588ded5: cmp r13, r15
0x14588ded8: jne 0x14588dcb0
0x14588dede: mov qword ptr [rsi + 0xc60], 0
0x14588dee9: mov rdx, qword ptr [rbp - 0x58]
0x14588deed: test rdx, rdx
0x14588def0: je 0x14588df01
0x14588def2: mov rcx, qword ptr [rbp - 0x50]
0x14588def6: mov r8d, 1
0x14588defc: call 0x1400021d0
0x14588df01: lea rax, [rsi + 0x10]
0x14588df05: mov qword ptr [rbp - 0x10], rax
0x14588df09: cmp dword ptr [rax], 2
0x14588df0c: je 0x14588df18
0x14588df0e: mov rcx, qword ptr [rbp - 0x10]
0x14588df12: call 0x14586fe00
0x14588df17: nop
0x14588df18: mov qword ptr [rsi + 0x10], 2
0x14588df20: mov rdx, qword ptr [rsi + 0x1408]
0x14588df27: cmp rdx, -1
0x14588df2b: je 0x14588df66
0x14588df2d: test rdx, rdx
0x14588df30: je 0x14588df44
0x14588df32: mov rcx, qword ptr [rsi + 0x1410]
0x14588df39: mov r8d, 1
0x14588df3f: call 0x1400021d0
0x14588df44: mov rdx, qword ptr [rsi + 0x1420]
0x14588df4b: test rdx, rdx
0x14588df4e: je 0x14588df66
0x14588df50: mov rcx, qword ptr [rsi + 0x1428]
0x14588df57: shl rdx, 4
0x14588df5b: mov r8d, 8
0x14588df61: call 0x1400021d0
0x14588df66: mov qword ptr [rsi + 0x1408], 0xffffffffffffffff
0x14588df71: movaps xmm6, xmmword ptr [rbp]
0x14588df75: add rsp, 0x98
0x14588df7c: pop rbx
0x14588df7d: pop rdi
0x14588df7e: pop rsi
0x14588df7f: pop r12
0x14588df81: pop r13
0x14588df83: pop r14
0x14588df85: pop r15
0x14588df87: pop rbp
0x14588df88: ret
