1458b031c: cmp       rbx, qword ptr [r12 + 0x10]
1458b0321: jne       0x1458b033b
1458b0323: mov       rdx, qword ptr [r12 + 8]
1458b0328: mov       rcx, rsi
1458b032b: mov       r8, rbx
1458b032e: call      0x145bfa0e1
1458b0333: test      eax, eax
1458b0335: je        0x1458b03e2
1458b033b: mov       r13, qword ptr [rbp + 0x528]
1458b0342: mov       rdx, qword ptr [r13 + 0x470]
1458b0349: mov       qword ptr [rsp + 0x28], rbx
1458b034e: mov       qword ptr [rbp + 0x510], rsi
1458b0355: mov       qword ptr [rsp + 0x20], rsi
1458b035a: mov       rcx, rdi
1458b035d: mov       r8, r14
1458b0360: mov       r9, r15
1458b0363: call      0x1458c35d0
