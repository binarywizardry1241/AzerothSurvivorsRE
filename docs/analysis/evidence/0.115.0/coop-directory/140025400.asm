0x140025400: push r15
0x140025402: push r14
0x140025404: push r13
0x140025406: push r12
0x140025408: push rsi
0x140025409: push rdi
0x14002540a: push rbx
0x14002540b: sub rsp, 0x30
0x14002540f: mov rbx, r8
0x140025412: mov rsi, rdx
0x140025415: mov rdi, rcx
0x140025418: movabs rax, 0x1ffffffffffffff8
0x140025422: test r9, rax
0x140025425: je 0x140025496
0x140025427: mov r13, qword ptr [rsp + 0x90]
0x14002542f: shr r9, 3
0x140025433: imul r14, r9, 0x3c0
0x14002543a: lea rdx, [rdi + r14]
0x14002543e: imul r15, r9, 0x690
0x140025445: lea r8, [rdi + r15]
0x140025449: mov qword ptr [rsp + 0x20], r13
0x14002544e: mov rcx, rdi
0x140025451: mov r12, r9
0x140025454: call 0x140025400
0x140025459: mov rdi, rax
0x14002545c: lea rdx, [rsi + r14]
0x140025460: lea r8, [rsi + r15]
0x140025464: mov qword ptr [rsp + 0x20], r13
0x140025469: mov rcx, rsi
0x14002546c: mov r9, r12
0x14002546f: call 0x140025400
0x140025474: mov rsi, rax
0x140025477: add r14, rbx
0x14002547a: add r15, rbx
0x14002547d: mov qword ptr [rsp + 0x20], r13
0x140025482: mov rcx, rbx
0x140025485: mov rdx, r14
0x140025488: mov r8, r15
0x14002548b: mov r9, r12
0x14002548e: call 0x140025400
0x140025493: mov rbx, rax
0x140025496: mov rax, qword ptr [rdi + 0xd0]
0x14002549d: test rax, rax
0x1400254a0: setne cl
0x1400254a3: cmp qword ptr [rsi + 0xd0], 0
0x1400254ab: sete dl
0x1400254ae: setne r8b
0x1400254b2: and cl, dl
0x1400254b4: cmp qword ptr [rbx + 0xd0], 0
0x1400254bc: sete r9b
0x1400254c0: xor dl, r9b
0x1400254c3: and r8b, r9b
0x1400254c6: xor r8b, cl
0x1400254c9: cmovne rsi, rbx
0x1400254cd: test dl, dl
0x1400254cf: cmove rdi, rsi
0x1400254d3: test rax, rax
0x1400254d6: cmove rdi, rsi
0x1400254da: mov rax, rdi
0x1400254dd: add rsp, 0x30
0x1400254e1: pop rbx
0x1400254e2: pop rdi
0x1400254e3: pop rsi
0x1400254e4: pop r12
0x1400254e6: pop r13
0x1400254e8: pop r14
0x1400254ea: pop r15
0x1400254ec: ret
