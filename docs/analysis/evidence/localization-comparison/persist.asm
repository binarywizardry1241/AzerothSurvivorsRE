; 0.108.0 SHA256 dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b
; original PE range 0x1458e7200..0x1458e7247 (71 bytes), SHA256 1774529f8cc701c02ad19885058858e8a950c02c29b00c2a02ebe37279062256
0x1458e7200: sub rsp, 0x28
0x1458e7204: call 0x1458e59e0
0x1458e7209: mov rax, qword ptr [rip + 0x276aec0]
0x1458e7210: cmp rax, 0xd
0x1458e7214: mov ecx, 0xd
0x1458e7219: cmovb rcx, rax
0x1458e721d: imul rax, rcx, 0x38
0x1458e7221: lea rcx, [rip + 0x15ae228]
0x1458e7228: mov r8, qword ptr [rax + rcx]
0x1458e722c: lea rcx, [rip + 0x130407d]
0x1458e7233: mov edx, 8
0x1458e7238: mov r9d, 2
0x1458e723e: add rsp, 0x28
0x1458e7242: jmp 0x1458e81c0
