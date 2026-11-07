; 0.115.0 SHA-256 0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c
; Owner 0x14010bc00..0x14010cc91; curated slices only.

; Slice 0x14010bc00..0x14010bc34
0x14010bc00: push rbp
0x14010bc01: push r15
0x14010bc03: push r14
0x14010bc05: push r13
0x14010bc07: push r12
0x14010bc09: push rsi
0x14010bc0a: push rdi
0x14010bc0b: push rbx
0x14010bc0c: sub rsp, 0x2e8
0x14010bc13: lea rbp, [rsp + 0x80]
0x14010bc1b: movaps xmmword ptr [rbp + 0x250], xmm6
0x14010bc22: mov qword ptr [rbp + 0x248], 0xfffffffffffffffe
0x14010bc2d: mov r11, qword ptr [rbp + 0x2f8]

; Slice 0x14010bd75..0x14010bd8e
0x14010bd75: mov rax, qword ptr [r11]
0x14010bd78: mov qword ptr [rbp - 0x28], rax
0x14010bd7c: mov rax, qword ptr [r11 + 0x10]
0x14010bd80: mov qword ptr [rbp - 0x20], rax
0x14010bd84: mov eax, dword ptr [r11 + 0x1c]
0x14010bd88: mov dword ptr [rbp + 0x170], eax

; Slice 0x14010c254..0x14010c267
0x14010c254: movzx ecx, byte ptr [rax]
0x14010c257: lea rdx, [rip + 0x5de72da]
0x14010c25e: movsxd rcx, dword ptr [rdx + rcx*4]
0x14010c262: add rcx, rdx
0x14010c265: jmp rcx

; Slice 0x14010c8f5..0x14010c911
0x14010c8f5: mov rax, qword ptr [rbp - 0x20]
0x14010c8f9: mov ecx, dword ptr [rbp + 0x170]
0x14010c8ff: mov dword ptr [rax], ecx
0x14010c901: mov rax, qword ptr [rbp - 0x28]
0x14010c905: mov byte ptr [rax + 0x12c], 1
0x14010c90c: jmp 0x14010be70
