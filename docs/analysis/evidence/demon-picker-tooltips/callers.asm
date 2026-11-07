; current caller 0x140291110; tooltip call 0x140293359
1402932fd 0f10051839b705 movups xmm0, xmmword ptr [rip + 0x5b73918]
140293304 488d8564040000 lea rax, [rbp + 0x464]
14029330b 0f1100 movups xmmword ptr [rax], xmm0
14029330e c740100000803f mov dword ptr [rax + 0x10], 0x3f800000
140293315 498b7500 mov rsi, qword ptr [r13]
140293319 498b7d08 mov rdi, qword ptr [r13 + 8]
14029331d ba15000000 mov edx, 0x15
140293322 488d0d3b57b705 lea rcx, [rip + 0x5b7573b]
140293329 e8f2a96f05 call 0x14598dd20
14029332e 90 nop
14029332f 80bd6808000000 cmp byte ptr [rbp + 0x868], 0
140293336 b900000000 mov ecx, 0
14029333b 480f44c1 cmove rax, rcx
14029333f 4889542428 mov qword ptr [rsp + 0x28], rdx
140293344 4889442420 mov qword ptr [rsp + 0x20], rax
140293349 4c89e1 mov rcx, r12
14029334c 488b9550080000 mov rdx, qword ptr [rbp + 0x850]
140293353 4989f0 mov r8, rsi
140293356 4989f9 mov r9, rdi
140293359 e832dadaff call 0x140040d90
14029335e 90 nop
14029335f 4983c510 add r13, 0x10
140293363 41b880010000 mov r8d, 0x180
140293369 4c89f1 mov rcx, r14
14029336c 4c89fa mov rdx, r15
; current caller 0x14029fd50; tooltip call 0x1402a2d04
1402a2cad 0f1005683fb605 movups xmm0, xmmword ptr [rip + 0x5b63f68]
1402a2cb4 0f118504040000 movups xmmword ptr [rbp + 0x404], xmm0
1402a2cbb c785140400000000803f mov dword ptr [rbp + 0x414], 0x3f800000
1402a2cc5 488b8508050000 mov rax, qword ptr [rbp + 0x508]
1402a2ccc 488b5830 mov rbx, qword ptr [rax + 0x30]
1402a2cd0 4c8b7038 mov r14, qword ptr [rax + 0x38]
1402a2cd4 488d0d755eb605 lea rcx, [rip + 0x5b65e75]
1402a2cdb ba12000000 mov edx, 0x12
1402a2ce0 e83bb06e05 call 0x14598dd20
1402a2ce5 90 nop
1402a2ce6 4889542428 mov qword ptr [rsp + 0x28], rdx
1402a2ceb 4889442420 mov qword ptr [rsp + 0x20], rax
1402a2cf0 488d8d00010000 lea rcx, [rbp + 0x100]
1402a2cf7 488b9598080000 mov rdx, qword ptr [rbp + 0x898]
1402a2cfe 4989d8 mov r8, rbx
1402a2d01 4d89f1 mov r9, r14
1402a2d04 e887e0d9ff call 0x140040d90
1402a2d09 90 nop
1402a2d0a 488d9dd8000000 lea rbx, [rbp + 0xd8]
1402a2d11 4c8db550010000 lea r14, [rbp + 0x150]
1402a2d18 488d95a0050000 lea rdx, [rbp + 0x5a0]
