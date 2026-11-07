14594e55a: 488bbe68050000           mov rdi, qword ptr [rsi + 0x568]
14594e561: 483bbe58050000           cmp rdi, qword ptr [rsi + 0x558]
14594e568: 750d                     jne 0x14594e577
14594e56a: 488d8e58050000           lea rcx, [rsi + 0x558]
14594e571: e88afe4200               call 0x145d7e400
14594e576: 90                       nop
14594e577: 4869cfd8010000           imul rcx, rdi, 0x1d8
14594e57e: 48038e60050000           add rcx, qword ptr [rsi + 0x560]
14594e585: 488d55c0                 lea rdx, [rbp - 0x40]
14594e589: 41b8d8010000             mov r8d, 0x1d8
14594e58f: e853bb2a00               call 0x145bfa0e7
14594e594: 48ffc7                   inc rdi
14594e597: 4889be68050000           mov qword ptr [rsi + 0x568], rdi
