14596e07f: 488bbe68050000           mov rdi, qword ptr [rsi + 0x568]
14596e086: 483bbe58050000           cmp rdi, qword ptr [rsi + 0x558]
14596e08d: 750d                     jne 0x14596e09c
14596e08f: 488d8e58050000           lea rcx, [rsi + 0x558]
14596e096: e865034100               call 0x145d7e400
14596e09b: 90                       nop
14596e09c: 4d8d7d40                 lea r15, [r13 + 0x40]
14596e0a0: 4869cfd8010000           imul rcx, rdi, 0x1d8
14596e0a7: 48038e60050000           add rcx, qword ptr [rsi + 0x560]
14596e0ae: 488d55c0                 lea rdx, [rbp - 0x40]
14596e0b2: 41b8d8010000             mov r8d, 0x1d8
14596e0b8: e82ac02800               call 0x145bfa0e7
14596e0bd: 48ffc7                   inc rdi
14596e0c0: 4889be68050000           mov qword ptr [rsi + 0x568], rdi
