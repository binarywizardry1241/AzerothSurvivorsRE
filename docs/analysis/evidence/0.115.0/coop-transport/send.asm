0x1458adf20: push r14
0x1458adf22: push rsi
0x1458adf23: push rdi
0x1458adf24: push rbx
0x1458adf25: sub rsp, 0x28
0x1458adf29: mov rsi, r8
0x1458adf2c: mov r8, qword ptr [rcx + 0x18]
0x1458adf30: mov rdi, qword ptr [rcx + 0x28]
0x1458adf34: mov rax, r8
0x1458adf37: sub rax, rdi
0x1458adf3a: cmp rax, 3
0x1458adf3e: jbe 0x1458adf85
0x1458adf40: mov rax, qword ptr [rcx + 0x20]
0x1458adf44: mov dword ptr [rax + rdi], esi
0x1458adf47: add rdi, 4
0x1458adf4b: mov qword ptr [rcx + 0x28], rdi
0x1458adf4f: sub r8, rdi
0x1458adf52: cmp rsi, r8
0x1458adf55: ja 0x1458adfbf
0x1458adf57: test rsi, rsi
0x1458adf5a: je 0x1458adf70
0x1458adf5c: add rax, rdi
0x1458adf5f: mov rbx, rcx
0x1458adf62: mov rcx, rax
0x1458adf65: mov r8, rsi
0x1458adf68: call 0x145d145fb
0x1458adf6d: mov rcx, rbx
0x1458adf70: add rdi, rsi
0x1458adf73: mov qword ptr [rcx + 0x28], rdi
0x1458adf77: add rsp, 0x28
0x1458adf7b: pop rbx
0x1458adf7c: pop rdi
0x1458adf7d: pop rsi
0x1458adf7e: pop r14
0x1458adf80: jmp 0x1458ace80
0x1458adf85: lea rax, [rcx + 0x18]
0x1458adf89: mov qword ptr [rsp + 0x20], 1
0x1458adf92: mov r8d, 4
0x1458adf98: mov r9d, 1
0x1458adf9e: mov rbx, rcx
0x1458adfa1: mov rcx, rax
0x1458adfa4: mov r14, rdx
0x1458adfa7: mov rdx, rdi
0x1458adfaa: call 0x145d14a10
0x1458adfaf: mov rdx, r14
0x1458adfb2: mov rcx, rbx
0x1458adfb5: mov r8, qword ptr [rbx + 0x18]
0x1458adfb9: mov rdi, qword ptr [rbx + 0x28]
0x1458adfbd: jmp 0x1458adf40
0x1458adfbf: lea rax, [rcx + 0x18]
0x1458adfc3: mov qword ptr [rsp + 0x20], 1
0x1458adfcc: mov r9d, 1
0x1458adfd2: mov rbx, rcx
0x1458adfd5: mov rcx, rax
0x1458adfd8: mov r14, rdx
0x1458adfdb: mov rdx, rdi
0x1458adfde: mov r8, rsi
0x1458adfe1: call 0x145d14a10
0x1458adfe6: mov rdx, r14
0x1458adfe9: mov rcx, rbx
0x1458adfec: mov rax, qword ptr [rbx + 0x20]
0x1458adff0: mov rdi, qword ptr [rbx + 0x28]
0x1458adff4: jmp 0x1458adf5c
