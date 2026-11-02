;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x1459c7330..0x1459c74ea SHA256 b7f7db9bb08042bd8a8e9b14e121ee54f893b8522f6e995ee58c35cc078541ff
0x1459c7330: push r15
0x1459c7332: push r14
0x1459c7334: push r13
0x1459c7336: push r12
0x1459c7338: push rsi
0x1459c7339: push rdi
0x1459c733a: push rbp
0x1459c733b: push rbx
0x1459c733c: sub rsp, 0x28
0x1459c7340: mov rdi, rdx
0x1459c7343: mov r12, qword ptr [rdx + 8]
0x1459c7347: mov r15, qword ptr [rdx + 0x18]
0x1459c734b: cmp r15, r12
0x1459c734e: seta al
0x1459c7351: mov r14, qword ptr [rdx + 0x10]
0x1459c7355: cmp r15, r14
0x1459c7358: setb dl
0x1459c735b: or dl, al
0x1459c735d: jne 0x1459c74bb
0x1459c7363: mov rsi, qword ptr [rdi]
0x1459c7366: movzx ebx, byte ptr [rdi + 0x28]
0x1459c736a: movzx ebp, byte ptr [rdi + rbx + 0x1f]
0x1459c736f: cmp rbx, 5
0x1459c7373: mov qword ptr [rsp + 0x20], rcx
0x1459c7378: jb 0x1459c7409
0x1459c737e: mov r8, r15
0x1459c7381: sub r8, r14
0x1459c7384: lea rax, [rsi + r14]
0x1459c7388: cmp r8, 0xf
0x1459c738c: ja 0x1459c73aa
0x1459c738e: xor edx, edx
0x1459c7390: test r8, r8
0x1459c7393: je 0x1459c73b6
0x1459c7395: cmp byte ptr [rax + rdx], bpl
0x1459c7399: je 0x1459c73ba
0x1459c739b: inc rdx
0x1459c739e: cmp r8, rdx
0x1459c73a1: jne 0x1459c7395
0x1459c73a3: mov rdx, r8
0x1459c73a6: xor eax, eax
0x1459c73a8: jmp 0x1459c73bf
0x1459c73aa: mov ecx, ebp
0x1459c73ac: mov rdx, rax
0x1459c73af: call 0x145bd5860
0x1459c73b4: jmp 0x1459c73bf
0x1459c73b6: xor eax, eax
0x1459c73b8: jmp 0x1459c73bf
0x1459c73ba: mov eax, 1
0x1459c73bf: cmp rax, 1
0x1459c73c3: jne 0x1459c74a9
0x1459c73c9: add r14, rdx
0x1459c73cc: inc r14
0x1459c73cf: mov qword ptr [rdi + 0x10], r14
0x1459c73d3: cmp r14, rbx
0x1459c73d6: setb al
0x1459c73d9: cmp r14, r12
0x1459c73dc: seta cl
0x1459c73df: or cl, al
0x1459c73e1: je 0x1459c74d1
0x1459c73e7: cmp r15, r14
0x1459c73ea: mov rcx, qword ptr [rsp + 0x20]
0x1459c73ef: mov eax, 0
0x1459c73f4: jae 0x1459c737e
0x1459c73f6: jmp 0x1459c74bd
0x1459c73fb: nop dword ptr [rax + rax]
0x1459c7400: cmp r15, r14
0x1459c7403: jb 0x1459c74b6
0x1459c7409: mov r8, r15
0x1459c740c: sub r8, r14
0x1459c740f: lea rax, [rsi + r14]
0x1459c7413: cmp r8, 0x10
0x1459c7417: jae 0x1459c7440
0x1459c7419: xor edx, edx
0x1459c741b: test r8, r8
0x1459c741e: je 0x1459c7431
0x1459c7420: cmp byte ptr [rax + rdx], bpl
0x1459c7424: je 0x1459c7452
0x1459c7426: inc rdx
0x1459c7429: cmp r8, rdx
0x1459c742c: jne 0x1459c7420
0x1459c742e: mov rdx, r8
0x1459c7431: xor eax, eax
0x1459c7433: cmp rax, 1
0x1459c7437: je 0x1459c7460
0x1459c7439: jmp 0x1459c74a9
0x1459c743b: nop dword ptr [rax + rax]
0x1459c7440: mov ecx, ebp
0x1459c7442: mov rdx, rax
0x1459c7445: call 0x145bd5860
0x1459c744a: cmp rax, 1
0x1459c744e: je 0x1459c7460
0x1459c7450: jmp 0x1459c74a9
0x1459c7452: mov eax, 1
0x1459c7457: cmp rax, 1
0x1459c745b: jne 0x1459c74a9
0x1459c745d: nop dword ptr [rax]
0x1459c7460: add r14, rdx
0x1459c7463: inc r14
0x1459c7466: mov qword ptr [rdi + 0x10], r14
0x1459c746a: mov r13, r14
0x1459c746d: sub r13, rbx
0x1459c7470: setb al
0x1459c7473: cmp r14, r12
0x1459c7476: seta cl
0x1459c7479: or cl, al
0x1459c747b: jne 0x1459c7400
0x1459c747d: lea rcx, [rsi + r13]
0x1459c7481: lea rdx, [rdi + 0x20]
0x1459c7485: mov r8, rbx
0x1459c7488: call 0x145bfa0e1
0x1459c748d: test eax, eax
0x1459c748f: jne 0x1459c7400
0x1459c7495: mov rcx, qword ptr [rsp + 0x20]
0x1459c749a: mov qword ptr [rcx + 8], r13
0x1459c749e: mov qword ptr [rcx + 0x10], r14
0x1459c74a2: mov eax, 1
0x1459c74a7: jmp 0x1459c74bd
0x1459c74a9: mov qword ptr [rdi + 0x10], r15
0x1459c74ad: xor eax, eax
0x1459c74af: mov rcx, qword ptr [rsp + 0x20]
0x1459c74b4: jmp 0x1459c74bd
0x1459c74b6: mov rcx, qword ptr [rsp + 0x20]
0x1459c74bb: xor eax, eax
0x1459c74bd: mov qword ptr [rcx], rax
0x1459c74c0: add rsp, 0x28
0x1459c74c4: pop rbx
0x1459c74c5: pop rbp
0x1459c74c6: pop rdi
0x1459c74c7: pop rsi
0x1459c74c8: pop r12
0x1459c74ca: pop r13
0x1459c74cc: pop r14
0x1459c74ce: pop r15
0x1459c74d0: ret
0x1459c74d1: lea r9, [rip + 0x186f808]
0x1459c74d8: mov r8d, 4
0x1459c74de: xor ecx, ecx
0x1459c74e0: mov rdx, rbx
0x1459c74e3: call 0x145d99860
0x1459c74e8: ud2
