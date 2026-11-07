14593e5db: 498bb568050000           mov rsi, qword ptr [r13 + 0x568]
14593e5e2: 493bb558050000           cmp rsi, qword ptr [r13 + 0x558]
14593e5e9: 750d                     jne 0x14593e5f8
14593e5eb: 488b8d80030000           mov rcx, qword ptr [rbp + 0x380]
14593e5f2: e809fe4300               call 0x145d7e400
14593e5f7: 90                       nop
14593e5f8: 4869ced8010000           imul rcx, rsi, 0x1d8
14593e5ff: 49038d60050000           add rcx, qword ptr [r13 + 0x560]
14593e606: 41b8d8010000             mov r8d, 0x1d8
14593e60c: 488d5570                 lea rdx, [rbp + 0x70]
14593e610: e8d2ba2b00               call 0x145bfa0e7
14593e615: 48ffc6                   inc rsi
14593e618: 4989b568050000           mov qword ptr [r13 + 0x568], rsi
