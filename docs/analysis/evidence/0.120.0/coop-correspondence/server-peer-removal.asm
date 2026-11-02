0x145b26060: push rbp
0x145b26061: push r15
0x145b26063: push r14
0x145b26065: push r13
0x145b26067: push r12
0x145b26069: push rsi
0x145b2606a: push rdi
0x145b2606b: push rbx
0x145b2606c: sub rsp, 0x928
0x145b26073: lea rbp, [rsp + 0x80]
0x145b2607b: mov qword ptr [rbp + 0x8a0], 0xfffffffffffffffe
0x145b26086: cmp dword ptr [rcx + 0xca0], 3
0x145b2608d: jne 0x145b26184
0x145b26093: mov rdi, rdx
0x145b26096: mov rsi, rcx
0x145b26099: mov rbx, qword ptr [rcx + 0xce0]
0x145b260a0: cmp rdx, rbx
0x145b260a3: jae 0x145b26198
0x145b260a9: mov r12, qword ptr [rsi + 0xcd8]
0x145b260b0: lea r13, [rdi + rdi*8]
0x145b260b4: shl r13, 7
0x145b260b8: lea r14, [r12 + r13]
0x145b260bc: mov r15, qword ptr [r12 + r13]
0x145b260c0: lea rdx, [r12 + r13]
0x145b260c4: add rdx, 8
0x145b260c8: lea rcx, [rbp - 0x58]
0x145b260cc: mov r8d, 0x478
0x145b260d2: call 0x145fa3aab
0x145b260d7: lea rdx, [r12 + r13]
0x145b260db: add rdx, 0x480
0x145b260e2: mov rax, rdi
0x145b260e5: not rax
0x145b260e8: add rax, rbx
0x145b260eb: shl rax, 7
0x145b260ef: lea r8, [rax + rax*8]
0x145b260f3: mov rcx, r14
0x145b260f6: call 0x145fa3ab7
0x145b260fb: dec rbx
0x145b260fe: mov qword ptr [rsi + 0xce0], rbx
0x145b26105: cmp r15, 2
0x145b26109: je 0x145b26198
0x145b2610f: mov qword ptr [rbp + 0x420], r15
0x145b26116: lea rcx, [rbp + 0x428]
0x145b2611d: lea rdx, [rbp - 0x58]
0x145b26121: mov r8d, 0x478
0x145b26127: call 0x145fa3aab
0x145b2612c: cmp dword ptr [rsi + 0x10], 2
0x145b26130: setne al
0x145b26133: test al, r15b
0x145b26136: je 0x145b26149
0x145b26138: lea rcx, [rsi + 0x10]
0x145b2613c: mov rdx, qword ptr [rbp + 0x428]
0x145b26143: call 0x145b71d90
0x145b26148: nop
0x145b26149: mov rcx, rsi
0x145b2614c: call 0x145b228c0
0x145b26151: nop
0x145b26152: mov qword ptr [rsp + 0x20], 0
0x145b2615b: lea rdx, [rip + 0x1493b86]
0x145b26162: mov r8d, 4
0x145b26168: mov r9d, 1
0x145b2616e: mov rcx, rsi
0x145b26171: call 0x145b22f20
0x145b26176: nop
0x145b26177: lea rcx, [rbp + 0x420]
0x145b2617e: call 0x145b01660
0x145b26183: nop
0x145b26184: add rsp, 0x928
0x145b2618b: pop rbx
0x145b2618c: pop rdi
0x145b2618d: pop rsi
0x145b2618e: pop r12
0x145b26190: pop r13
0x145b26192: pop r14
0x145b26194: pop r15
0x145b26196: pop rbp
0x145b26197: ret
0x145b26198: lea r8, [rip + 0x1493bd1]
0x145b2619f: mov rcx, rdi
0x145b261a2: mov rdx, rbx
0x145b261a5: call 0x14614ae3b
0x145b261aa: ud2
