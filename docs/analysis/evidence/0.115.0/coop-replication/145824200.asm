0x145824200: push rbp
0x145824201: push r15
0x145824203: push r14
0x145824205: push rsi
0x145824206: push rdi
0x145824207: push rbx
0x145824208: sub rsp, 0x238
0x14582420f: lea rbp, [rsp + 0x80]
0x145824217: mov qword ptr [rbp + 0x1b0], 0xfffffffffffffffe
0x145824222: mov rbx, qword ptr [r8 + 0x10]
0x145824226: test rbx, rbx
0x145824229: je 0x145824357
0x14582422f: mov rsi, rdx
0x145824232: mov rdi, rcx
0x145824235: cmp rbx, 1
0x145824239: jne 0x1458242a8
0x14582423b: mov qword ptr [r8 + 0x10], 0
0x145824243: mov rax, qword ptr [r8 + 8]
0x145824247: mov rcx, qword ptr [rax]
0x14582424a: mov qword ptr [rbp + 0x1a8], rcx
0x145824251: mov rdx, qword ptr [rax + 8]
0x145824255: mov r8, qword ptr [rax + 0x10]
0x145824259: lock add qword ptr [rip + 0x29f2ee7], r8
0x145824261: lock inc qword ptr [rip + 0x29f2eef]
0x145824269: mov rcx, rdi
0x14582426c: mov qword ptr [rbp + 0x1a0], rdx
0x145824273: call qword ptr [rsi + 0x18]
0x145824276: nop
0x145824277: mov rdx, qword ptr [rbp + 0x1a8]
0x14582427e: test rdx, rdx
0x145824281: je 0x145824357
0x145824287: mov r8d, 1
0x14582428d: mov rcx, qword ptr [rbp + 0x1a0]
0x145824294: add rsp, 0x238
0x14582429b: pop rbx
0x14582429c: pop rdi
0x14582429d: pop rsi
0x14582429e: pop r14
0x1458242a0: pop r15
0x1458242a2: pop rbp
0x1458242a3: jmp 0x1400021d0
0x1458242a8: mov r14, qword ptr [r8 + 8]
0x1458242ac: lea rcx, [rbp - 0x60]
0x1458242b0: mov rdx, r14
0x1458242b3: mov r15, r8
0x1458242b6: mov r8, rbx
0x1458242b9: call 0x145820d40
0x1458242be: mov qword ptr [r15 + 0x10], 0
0x1458242c6: add r14, 8
0x1458242ca: jmp 0x1458242d9
0x1458242cc: nop dword ptr [rax]
0x1458242d0: add r14, 0x18
0x1458242d4: dec rbx
0x1458242d7: je 0x1458242f2
0x1458242d9: mov rdx, qword ptr [r14 - 8]
0x1458242dd: test rdx, rdx
0x1458242e0: je 0x1458242d0
0x1458242e2: mov rcx, qword ptr [r14]
0x1458242e5: mov r8d, 1
0x1458242eb: call 0x1400021d0
0x1458242f0: jmp 0x1458242d0
0x1458242f2: lea rcx, [rbp + 0x188]
0x1458242f9: lea rdx, [rbp - 0x60]
0x1458242fd: call 0x14581c690
0x145824302: nop
0x145824303: mov rdx, qword ptr [rbp + 0x190]
0x14582430a: mov r8, qword ptr [rbp + 0x198]
0x145824311: lock add qword ptr [rip + 0x29f2e2f], r8
0x145824319: lock inc qword ptr [rip + 0x29f2e37]
0x145824321: mov rcx, rdi
0x145824324: mov qword ptr [rbp + 0x1a8], rdx
0x14582432b: call qword ptr [rsi + 0x18]
0x14582432e: nop
0x14582432f: mov rdx, qword ptr [rbp + 0x188]
0x145824336: test rdx, rdx
0x145824339: je 0x14582434d
0x14582433b: mov r8d, 1
0x145824341: mov rcx, qword ptr [rbp + 0x1a8]
0x145824348: call 0x1400021d0
0x14582434d: lea rcx, [rbp - 0x60]
0x145824351: call 0x145812e60
0x145824356: nop
0x145824357: add rsp, 0x238
0x14582435e: pop rbx
0x14582435f: pop rdi
0x145824360: pop rsi
0x145824361: pop r14
0x145824363: pop r15
0x145824365: pop rbp
0x145824366: ret
