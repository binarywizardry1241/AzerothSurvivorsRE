1459c84b0: push      rsi
1459c84b1: push      rdi
1459c84b2: push      rbx
1459c84b3: lea       rax, [r8 - 1]
1459c84b7: cmp       rax, rdx
1459c84ba: jae       0x1459c8572
1459c84c0: cmp       r8, rdx
1459c84c3: jne       0x1459c84c9
1459c84c5: pop       rbx
1459c84c6: pop       rdi
1459c84c7: pop       rsi
1459c84c8: ret
1459c84c9: lea       rax, [rcx + rdx*8]
1459c84cd: lea       rdx, [rcx + r8*8]
1459c84d1: shl       r8, 3
1459c84d5: jmp       0x1459c84f3
1459c84d7: nop       word ptr [rax + rax]
1459c84e0: mov       r11, rcx
1459c84e3: mov       qword ptr [r11], r9
1459c84e6: add       rdx, 8
1459c84ea: add       r8, 8
1459c84ee: cmp       rdx, rax
1459c84f1: je        0x1459c84c5
1459c84f3: mov       r10, qword ptr [rdx - 8]
1459c84f7: mov       r9, qword ptr [rdx]
1459c84fa: mov       r11, qword ptr [r10 + 0x30]
1459c84fe: mov       rsi, qword ptr [r9 + 0x30]
1459c8502: mov       rdi, r11
1459c8505: sar       rdi, 0x3f
1459c8509: shr       rdi, 1
1459c850c: xor       rdi, r11
1459c850f: mov       r11, rsi
1459c8512: sar       r11, 0x3f
1459c8516: shr       r11, 1
1459c8519: xor       r11, rsi
1459c851c: cmp       rdi, r11
1459c851f: jge       0x1459c84e6
1459c8521: mov       r11, r8
1459c8524: nop       word ptr cs:[rax + rax]
1459c8530: mov       qword ptr [rcx + r11], r10
1459c8534: cmp       r11, 8
1459c8538: je        0x1459c84e0
1459c853a: mov       r10, qword ptr [rcx + r11 - 0x10]
1459c853f: mov       rsi, qword ptr [r10 + 0x30]
1459c8543: mov       rdi, qword ptr [r9 + 0x30]
1459c8547: mov       rbx, rsi
1459c854a: sar       rbx, 0x3f
1459c854e: shr       rbx, 1
1459c8551: xor       rbx, rsi
1459c8554: mov       rsi, rdi
1459c8557: sar       rsi, 0x3f
1459c855b: shr       rsi, 1
1459c855e: xor       rsi, rdi
1459c8561: add       r11, -8
1459c8565: cmp       rbx, rsi
1459c8568: jl        0x1459c8530
1459c856a: add       r11, rcx
1459c856d: jmp       0x1459c84e3
1459c8572: ud2
