0x145b7a240: push r15
0x145b7a242: push r14
0x145b7a244: push r12
0x145b7a246: push rsi
0x145b7a247: push rdi
0x145b7a248: push rbp
0x145b7a249: push rbx
0x145b7a24a: sub rsp, 0x20
0x145b7a24e: mov rsi, rdx
0x145b7a251: mov rbx, rcx
0x145b7a254: mov rdx, qword ptr [rcx + 8]
0x145b7a258: mov r14, qword ptr [rcx + 0x10]
0x145b7a25c: mov r15, qword ptr [rsi]
0x145b7a25f: mov rdi, qword ptr [rsi + 0x10]
0x145b7a263: mov rax, r15
0x145b7a266: sub rax, rdi
0x145b7a269: cmp rax, 3
0x145b7a26d: jbe 0x145b7a3b2
0x145b7a273: mov r12, qword ptr [rsi + 8]
0x145b7a277: mov dword ptr [r12 + rdi], r14d
0x145b7a27b: add rdi, 4
0x145b7a27f: mov qword ptr [rsi + 0x10], rdi
0x145b7a283: mov rax, r15
0x145b7a286: sub rax, rdi
0x145b7a289: cmp r14, rax
0x145b7a28c: ja 0x145b7a3d5
0x145b7a292: test r14, r14
0x145b7a295: je 0x145b7a2a3
0x145b7a297: lea rcx, [r12 + rdi]
0x145b7a29b: mov r8, r14
0x145b7a29e: call 0x145d145fb
0x145b7a2a3: add rdi, r14
0x145b7a2a6: mov qword ptr [rsi + 0x10], rdi
0x145b7a2aa: mov r14, qword ptr [rbx + 0x48]
0x145b7a2ae: sub r15, rdi
0x145b7a2b1: cmp r15, 7
0x145b7a2b5: jbe 0x145b7a3f9
0x145b7a2bb: mov qword ptr [r12 + rdi], r14
0x145b7a2bf: add rdi, 8
0x145b7a2c3: mov qword ptr [rsi + 0x10], rdi
0x145b7a2c7: mov ebp, dword ptr [rbx + 0x58]
0x145b7a2ca: mov rax, qword ptr [rsi]
0x145b7a2cd: mov rcx, rax
0x145b7a2d0: sub rcx, rdi
0x145b7a2d3: cmp rcx, 3
0x145b7a2d7: jbe 0x145b7a417
0x145b7a2dd: mov rcx, qword ptr [rsi + 8]
0x145b7a2e1: mov dword ptr [rcx + rdi], ebp
0x145b7a2e4: add rdi, 4
0x145b7a2e8: mov qword ptr [rsi + 0x10], rdi
0x145b7a2ec: mov rdx, qword ptr [rbx + 0x20]
0x145b7a2f0: mov r14, qword ptr [rbx + 0x28]
0x145b7a2f4: mov r8, rax
0x145b7a2f7: sub r8, rdi
0x145b7a2fa: cmp r8, 3
0x145b7a2fe: jbe 0x145b7a434
0x145b7a304: mov dword ptr [rcx + rdi], r14d
0x145b7a308: add rdi, 4
0x145b7a30c: mov qword ptr [rsi + 0x10], rdi
0x145b7a310: mov r8, rax
0x145b7a313: sub r8, rdi
0x145b7a316: cmp r14, r8
0x145b7a319: ja 0x145b7a45b
0x145b7a31f: test r14, r14
0x145b7a322: je 0x145b7a332
0x145b7a324: add rcx, rdi
0x145b7a327: mov r8, r14
0x145b7a32a: call 0x145d145fb
0x145b7a32f: mov rax, qword ptr [rsi]
0x145b7a332: add rdi, r14
0x145b7a335: mov qword ptr [rsi + 0x10], rdi
0x145b7a339: mov r14, qword ptr [rbx + 0x50]
0x145b7a33d: mov rcx, rax
0x145b7a340: sub rcx, rdi
0x145b7a343: cmp rcx, 7
0x145b7a347: jbe 0x145b7a47c
0x145b7a34d: mov rcx, qword ptr [rsi + 8]
0x145b7a351: mov qword ptr [rcx + rdi], r14
0x145b7a355: add rdi, 8
0x145b7a359: mov qword ptr [rsi + 0x10], rdi
0x145b7a35d: mov rdx, qword ptr [rbx + 0x38]
0x145b7a361: mov rbx, qword ptr [rbx + 0x40]
0x145b7a365: mov r8, rax
0x145b7a368: sub r8, rdi
0x145b7a36b: cmp r8, 3
0x145b7a36f: jbe 0x145b7a499
0x145b7a375: mov dword ptr [rcx + rdi], ebx
0x145b7a378: add rdi, 4
0x145b7a37c: mov qword ptr [rsi + 0x10], rdi
0x145b7a380: sub rax, rdi
0x145b7a383: cmp rbx, rax
0x145b7a386: ja 0x145b7a4c0
0x145b7a38c: test rbx, rbx
0x145b7a38f: je 0x145b7a39c
0x145b7a391: add rcx, rdi
0x145b7a394: mov r8, rbx
0x145b7a397: call 0x145d145fb
0x145b7a39c: add rdi, rbx
0x145b7a39f: mov qword ptr [rsi + 0x10], rdi
0x145b7a3a3: add rsp, 0x20
0x145b7a3a7: pop rbx
0x145b7a3a8: pop rbp
0x145b7a3a9: pop rdi
0x145b7a3aa: pop rsi
0x145b7a3ab: pop r12
0x145b7a3ad: pop r14
0x145b7a3af: pop r15
0x145b7a3b1: ret
0x145b7a3b2: mov r8d, 4
0x145b7a3b8: mov rcx, rsi
0x145b7a3bb: mov r15, rdx
0x145b7a3be: mov rdx, rdi
0x145b7a3c1: call 0x145e9e020
0x145b7a3c6: mov rdx, r15
0x145b7a3c9: mov r15, qword ptr [rsi]
0x145b7a3cc: mov rdi, qword ptr [rsi + 0x10]
0x145b7a3d0: jmp 0x145b7a273
0x145b7a3d5: mov rcx, rsi
0x145b7a3d8: mov r15, rdx
0x145b7a3db: mov rdx, rdi
0x145b7a3de: mov r8, r14
0x145b7a3e1: call 0x145e9e020
0x145b7a3e6: mov rdx, r15
0x145b7a3e9: mov rdi, qword ptr [rsi + 0x10]
0x145b7a3ed: mov r15, qword ptr [rsi]
0x145b7a3f0: mov r12, qword ptr [rsi + 8]
0x145b7a3f4: jmp 0x145b7a297
0x145b7a3f9: mov r8d, 8
0x145b7a3ff: mov rcx, rsi
0x145b7a402: mov rdx, rdi
0x145b7a405: call 0x145e9e020
0x145b7a40a: mov r12, qword ptr [rsi + 8]
0x145b7a40e: mov rdi, qword ptr [rsi + 0x10]
0x145b7a412: jmp 0x145b7a2bb
0x145b7a417: mov r8d, 4
0x145b7a41d: mov rcx, rsi
0x145b7a420: mov rdx, rdi
0x145b7a423: call 0x145e9e020
0x145b7a428: mov rax, qword ptr [rsi]
0x145b7a42b: mov rdi, qword ptr [rsi + 0x10]
0x145b7a42f: jmp 0x145b7a2dd
0x145b7a434: mov r8d, 4
0x145b7a43a: mov rcx, rsi
0x145b7a43d: mov r15, rdx
0x145b7a440: mov rdx, rdi
0x145b7a443: call 0x145e9e020
0x145b7a448: mov rdx, r15
0x145b7a44b: mov rdi, qword ptr [rsi + 0x10]
0x145b7a44f: mov rax, qword ptr [rsi]
0x145b7a452: mov rcx, qword ptr [rsi + 8]
0x145b7a456: jmp 0x145b7a304
0x145b7a45b: mov rcx, rsi
0x145b7a45e: mov r15, rdx
0x145b7a461: mov rdx, rdi
0x145b7a464: mov r8, r14
0x145b7a467: call 0x145e9e020
0x145b7a46c: mov rdx, r15
0x145b7a46f: mov rcx, qword ptr [rsi + 8]
0x145b7a473: mov rdi, qword ptr [rsi + 0x10]
0x145b7a477: jmp 0x145b7a324
0x145b7a47c: mov r8d, 8
0x145b7a482: mov rcx, rsi
0x145b7a485: mov rdx, rdi
0x145b7a488: call 0x145e9e020
0x145b7a48d: mov rax, qword ptr [rsi]
0x145b7a490: mov rdi, qword ptr [rsi + 0x10]
0x145b7a494: jmp 0x145b7a34d
0x145b7a499: mov r8d, 4
0x145b7a49f: mov rcx, rsi
0x145b7a4a2: mov r14, rdx
0x145b7a4a5: mov rdx, rdi
0x145b7a4a8: call 0x145e9e020
0x145b7a4ad: mov rdx, r14
0x145b7a4b0: mov rdi, qword ptr [rsi + 0x10]
0x145b7a4b4: mov rax, qword ptr [rsi]
0x145b7a4b7: mov rcx, qword ptr [rsi + 8]
0x145b7a4bb: jmp 0x145b7a375
0x145b7a4c0: mov rcx, rsi
0x145b7a4c3: mov r14, rdx
0x145b7a4c6: mov rdx, rdi
0x145b7a4c9: mov r8, rbx
0x145b7a4cc: call 0x145e9e020
0x145b7a4d1: mov rdx, r14
0x145b7a4d4: mov rcx, qword ptr [rsi + 8]
0x145b7a4d8: mov rdi, qword ptr [rsi + 0x10]
0x145b7a4dc: jmp 0x145b7a391
