; 0.108.0 SHA256 dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b
; original PE range 0x1458e81c0..0x1458e8333 (371 bytes), SHA256 284f0d3fb61feba69a857ddb13265a6a0e46c4ddcfd503693fc3668d7ef261fd
0x1458e81c0: push rbp
0x1458e81c1: push rsi
0x1458e81c2: push rdi
0x1458e81c3: push rbx
0x1458e81c4: sub rsp, 0x98
0x1458e81cb: lea rbp, [rsp + 0x80]
0x1458e81d3: mov qword ptr [rbp + 0x10], 0xfffffffffffffffe
0x1458e81db: mov rsi, r9
0x1458e81de: mov rdi, r8
0x1458e81e1: mov qword ptr [rbp - 0x50], rcx
0x1458e81e5: mov qword ptr [rbp - 0x48], rdx
0x1458e81e9: lea rcx, [rbp - 0x18]
0x1458e81ed: call 0x1458e8400
0x1458e81f2: mov rax, qword ptr [rbp - 0x18]
0x1458e81f6: cmp rax, -1
0x1458e81fa: je 0x1458e8327
0x1458e8200: mov qword ptr [rbp - 0x20], rax
0x1458e8204: mov rdx, qword ptr [rbp - 0x10]
0x1458e8208: mov rbx, qword ptr [rbp - 8]
0x1458e820c: mov byte ptr [rbp - 0x18], 1
0x1458e8210: lea rcx, [rbp - 0x18]
0x1458e8214: mov qword ptr [rbp - 0x28], rdx
0x1458e8218: mov r8, rbx
0x1458e821b: call 0x145ba69a0
0x1458e8220: nop
0x1458e8221: test rax, rax
0x1458e8224: je 0x1458e824d
0x1458e8226: mov ecx, eax
0x1458e8228: and ecx, 3
0x1458e822b: lea edx, [rcx - 2]
0x1458e822e: cmp edx, 2
0x1458e8231: jb 0x1458e824d
0x1458e8233: test rcx, rcx
0x1458e8236: je 0x1458e824d
0x1458e8238: dec rax
0x1458e823b: lea rcx, [rbp - 0x10]
0x1458e823f: mov qword ptr [rbp - 0x10], rax
0x1458e8243: mov byte ptr [rbp - 0x18], 3
0x1458e8247: call 0x145bd8020
0x1458e824c: nop
0x1458e824d: lea rax, [rbp - 0x50]
0x1458e8251: mov qword ptr [rbp - 0x18], rax
0x1458e8255: lea rax, [rip - 0x58e619c]
0x1458e825c: mov qword ptr [rbp - 0x10], rax
0x1458e8260: lea rdx, [rip + 0x15b03fe]
0x1458e8267: lea rcx, [rbp - 0x40]
0x1458e826b: lea r8, [rbp - 0x18]
0x1458e826f: call 0x145bc5690
0x1458e8274: nop
0x1458e8275: mov r9, qword ptr [rbp - 0x38]
0x1458e8279: mov rax, qword ptr [rbp - 0x30]
0x1458e827d: mov qword ptr [rsp + 0x20], rax
0x1458e8282: lea rcx, [rbp - 0x18]
0x1458e8286: mov rdx, qword ptr [rbp - 0x28]
0x1458e828a: mov r8, rbx
0x1458e828d: mov qword ptr [rbp + 8], r9
0x1458e8291: call 0x145b9f5a0
0x1458e8296: nop
0x1458e8297: mov rdx, qword ptr [rbp - 0x40]
0x1458e829b: test rdx, rdx
0x1458e829e: je 0x1458e82af
0x1458e82a0: mov r8d, 1
0x1458e82a6: mov rcx, qword ptr [rbp + 8]
0x1458e82aa: call 0x1400021d0
0x1458e82af: mov rcx, qword ptr [rbp - 0x10]
0x1458e82b3: mov rdx, qword ptr [rbp - 8]
0x1458e82b7: mov qword ptr [rbp + 8], rcx
0x1458e82bb: mov r8, rdi
0x1458e82be: mov r9, rsi
0x1458e82c1: call 0x145bb5fb0
0x1458e82c6: nop
0x1458e82c7: mov rsi, rax
0x1458e82ca: mov rdx, qword ptr [rbp - 0x18]
0x1458e82ce: test rdx, rdx
0x1458e82d1: je 0x1458e82e2
0x1458e82d3: mov r8d, 1
0x1458e82d9: mov rcx, qword ptr [rbp + 8]
0x1458e82dd: call 0x1400021d0
0x1458e82e2: test rsi, rsi
0x1458e82e5: je 0x1458e830e
0x1458e82e7: mov eax, esi
0x1458e82e9: and eax, 3
0x1458e82ec: lea ecx, [rax - 2]
0x1458e82ef: cmp ecx, 2
0x1458e82f2: jb 0x1458e830e
0x1458e82f4: test rax, rax
0x1458e82f7: je 0x1458e830e
0x1458e82f9: dec rsi
0x1458e82fc: lea rcx, [rbp - 0x10]
0x1458e8300: mov qword ptr [rbp - 0x10], rsi
0x1458e8304: mov byte ptr [rbp - 0x18], 3
0x1458e8308: call 0x145bd8020
0x1458e830d: nop
0x1458e830e: mov rdx, qword ptr [rbp - 0x20]
0x1458e8312: test rdx, rdx
0x1458e8315: je 0x1458e8327
0x1458e8317: mov r8d, 1
0x1458e831d: mov rcx, qword ptr [rbp - 0x28]
0x1458e8321: call 0x1400021d0
0x1458e8326: nop
0x1458e8327: add rsp, 0x98
0x1458e832e: pop rbx
0x1458e832f: pop rdi
0x1458e8330: pop rsi
0x1458e8331: pop rbp
0x1458e8332: ret
