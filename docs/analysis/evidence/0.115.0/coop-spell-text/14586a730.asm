0x14586a730: push r15
0x14586a732: push r14
0x14586a734: push rsi
0x14586a735: push rdi
0x14586a736: push rbx
0x14586a737: sub rsp, 0x50
0x14586a73b: mov rsi, rcx
0x14586a73e: cmp edx, 1
0x14586a741: je 0x14586a75b
0x14586a743: cmp edx, 2
0x14586a746: jne 0x14586a79b
0x14586a748: lea rdi, [rip + 0x17c1083]
0x14586a74f: mov ebx, 5
0x14586a754: mov edx, 5
0x14586a759: jmp 0x14586a76c
0x14586a75b: lea rdi, [rip + 0x17c106c]
0x14586a762: mov ebx, 4
0x14586a767: mov edx, 4
0x14586a76c: mov rcx, rdi
0x14586a76f: call 0x1458dff90
0x14586a774: test rax, rax
0x14586a777: cmove rax, rdi
0x14586a77b: mov rdi, rdx
0x14586a77e: cmove rdi, rbx
0x14586a782: test rdi, rdi
0x14586a785: jns 0x14586a80c
0x14586a78b: xor r15d, r15d
0x14586a78e: mov rcx, r15
0x14586a791: mov rdx, rdi
0x14586a794: call 0x145eb6fcb
0x14586a799: ud2
0x14586a79b: mov dword ptr [rsp + 0x2c], edx
0x14586a79f: lea rdi, [rip + 0x17c1031]
0x14586a7a6: mov ebx, 9
0x14586a7ab: mov edx, 9
0x14586a7b0: mov rcx, rdi
0x14586a7b3: call 0x1458dff90
0x14586a7b8: test rax, rax
0x14586a7bb: cmovne rdi, rax
0x14586a7bf: cmovne rbx, rdx
0x14586a7c3: lea rax, [rip + 0x17a23c6]
0x14586a7ca: mov qword ptr [rsp + 0x30], rax
0x14586a7cf: mov qword ptr [rsp + 0x38], 1
0x14586a7d8: lea rax, [rsp + 0x2c]
0x14586a7dd: mov qword ptr [rsp + 0x40], rax
0x14586a7e2: lea rax, [rip + 0x17a242f]
0x14586a7e9: mov qword ptr [rsp + 0x48], rax
0x14586a7ee: mov qword ptr [rsp + 0x20], 1
0x14586a7f7: lea r9, [rsp + 0x30]
0x14586a7fc: mov rcx, rsi
0x14586a7ff: mov rdx, rdi
0x14586a802: mov r8, rbx
0x14586a805: call 0x1458e0370
0x14586a80a: jmp 0x14586a855
0x14586a80c: je 0x14586a845
0x14586a80e: mov r14, rax
0x14586a811: call 0x140002200
0x14586a816: mov r15d, 1
0x14586a81c: mov edx, 1
0x14586a821: mov rcx, rdi
0x14586a824: call 0x1400021c0
0x14586a829: test rax, rax
0x14586a82c: je 0x14586a78e
0x14586a832: mov rbx, rax
0x14586a835: mov rcx, rax
0x14586a838: mov rdx, r14
0x14586a83b: mov r8, rdi
0x14586a83e: call 0x145d145fb
0x14586a843: jmp 0x14586a84a
0x14586a845: mov ebx, 1
0x14586a84a: mov qword ptr [rsi], rdi
0x14586a84d: mov qword ptr [rsi + 8], rbx
0x14586a851: mov qword ptr [rsi + 0x10], rdi
0x14586a855: add rsp, 0x50
0x14586a859: pop rbx
0x14586a85a: pop rdi
0x14586a85b: pop rsi
0x14586a85c: pop r14
0x14586a85e: pop r15
0x14586a860: ret
