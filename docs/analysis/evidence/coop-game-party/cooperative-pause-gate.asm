0x14591a310: push rbp
0x14591a311: push rsi
0x14591a312: push rdi
0x14591a313: push rbx
0x14591a314: sub rsp, 0x88
0x14591a31b: lea rbp, [rsp + 0x80]
0x14591a323: mov qword ptr [rbp], 0xfffffffffffffffe
0x14591a32b: cmp byte ptr [rcx + 0xc46], 1
0x14591a332: jne 0x14591a426
0x14591a338: mov rsi, rcx
0x14591a33b: cmp byte ptr [rcx + 0xc41], 0
0x14591a342: jne 0x14591a426
0x14591a348: mov byte ptr [rsi + 0xc46], 3
0x14591a34f: mov rcx, rsi
0x14591a352: call 0x145905dc0
0x14591a357: call 0x140002200
0x14591a35c: mov ecx, 1
0x14591a361: mov edx, 1
0x14591a366: call 0x1400021c0
0x14591a36b: test rax, rax
0x14591a36e: je 0x14591a45d
0x14591a374: mov byte ptr [rax], 0x7b
0x14591a377: mov qword ptr [rbp - 0x50], 1
0x14591a37f: mov qword ptr [rbp - 0x48], rax
0x14591a383: mov qword ptr [rbp - 0x40], 1
0x14591a38b: mov byte ptr [rbp - 0x38], 1
0x14591a38f: lea rax, [rip + 0x1a15799]
0x14591a396: mov qword ptr [rsp + 0x20], rax
0x14591a39b: mov qword ptr [rsp + 0x28], 6
0x14591a3a4: lea r8, [rip + 0x1a15425]
0x14591a3ab: lea rcx, [rbp - 0x30]
0x14591a3af: lea rdx, [rbp - 0x50]
0x14591a3b3: mov r9d, 4
0x14591a3b9: call 0x145858350
0x14591a3be: mov rax, qword ptr [rbp - 0x30]
0x14591a3c2: mov rdi, qword ptr [rbp - 0x20]
0x14591a3c6: cmp rax, rdi
0x14591a3c9: je 0x14591a432
0x14591a3cb: mov qword ptr [rbp - 8], rax
0x14591a3cf: mov rax, qword ptr [rbp - 0x28]
0x14591a3d3: mov qword ptr [rbp - 0x10], rax
0x14591a3d7: mov byte ptr [rax + rdi], 0x7d
0x14591a3db: mov rbx, qword ptr [rsi + 0x658]
0x14591a3e2: cmp rbx, qword ptr [rsi + 0x648]
0x14591a3e9: jne 0x14591a3f8
0x14591a3eb: lea rcx, [rsi + 0x648]
0x14591a3f2: call 0x145d14e50
0x14591a3f7: nop
0x14591a3f8: inc rdi
0x14591a3fb: mov rax, qword ptr [rsi + 0x650]
0x14591a402: lea rcx, [rbx + rbx*2]
0x14591a406: mov rdx, qword ptr [rbp - 8]
0x14591a40a: mov qword ptr [rax + rcx*8], rdx
0x14591a40e: mov rdx, qword ptr [rbp - 0x10]
0x14591a412: mov qword ptr [rax + rcx*8 + 8], rdx
0x14591a417: mov qword ptr [rax + rcx*8 + 0x10], rdi
0x14591a41c: inc rbx
0x14591a41f: mov qword ptr [rsi + 0x658], rbx
0x14591a426: add rsp, 0x88
0x14591a42d: pop rbx
0x14591a42e: pop rdi
0x14591a42f: pop rsi
0x14591a430: pop rbp
0x14591a431: ret
0x14591a432: mov qword ptr [rsp + 0x20], 1
0x14591a43b: lea rcx, [rbp - 0x30]
0x14591a43f: mov r8d, 1
0x14591a445: mov r9d, 1
0x14591a44b: mov rdx, rdi
0x14591a44e: call 0x145d14a10
0x14591a453: nop
0x14591a454: mov rax, qword ptr [rbp - 0x30]
0x14591a458: jmp 0x14591a3cb
0x14591a45d: mov ecx, 1
0x14591a462: mov edx, 1
0x14591a467: call 0x145eb6fcb
0x14591a46c: ud2
