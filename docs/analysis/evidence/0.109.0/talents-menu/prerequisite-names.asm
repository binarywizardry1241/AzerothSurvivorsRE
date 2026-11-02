1400a9710: push      rbp
1400a9711: push      r15
1400a9713: push      r14
1400a9715: push      r12
1400a9717: push      rsi
1400a9718: push      rdi
1400a9719: push      rbx
1400a971a: sub       rsp, 0x40
1400a971e: lea       rbp, [rsp + 0x40]
1400a9723: mov       qword ptr [rbp - 8], 0xfffffffffffffffe
1400a972b: mov       rsi, rcx
1400a972e: mov       r15, r8
1400a9731: sub       r15, rdx
1400a9734: lea       rbx, [r15 + r15]
1400a9738: movabs    rax, 0x7ffffffffffffff8
1400a9742: cmp       r15, rax
1400a9745: seta      cl
1400a9748: cmp       rbx, rax
1400a974b: seta      al
1400a974e: or        al, cl
1400a9750: je        0x1400a9762
1400a9752: xor       r14d, r14d
1400a9755: mov       rcx, r14
1400a9758: mov       rdx, rbx
1400a975b: call      0x145d992bb
1400a9760: ud2
1400a9762: mov       rdi, rdx
1400a9765: shr       r15, 3
1400a9769: test      rbx, rbx
1400a976c: je        0x1400a97d6
1400a976e: mov       r12, r8
1400a9771: call      0x140002200
1400a9776: mov       r14d, 8
1400a977c: mov       edx, 8
1400a9781: mov       rcx, rbx
1400a9784: call      0x1400021c0
1400a9789: mov       qword ptr [rbp - 0x10], rax
1400a978d: test      rax, rax
1400a9790: je        0x1400a9755
1400a9792: mov       rax, r15
1400a9795: mov       r8, r12
1400a9798: cmp       rdi, r8
1400a979b: je        0x1400a97e6
1400a979d: mov       qword ptr [rbp - 0x18], rax
1400a97a1: xor       ebx, ebx
1400a97a3: mov       r14, r15
1400a97a6: nop       word ptr cs:[rax + rax]
1400a97b0: mov       rcx, qword ptr [rdi + rbx]
1400a97b4: call      0x14590eac0
1400a97b9: nop
1400a97ba: mov       rcx, qword ptr [rbp - 0x10]
1400a97be: mov       qword ptr [rcx + rbx*2], rax
1400a97c2: mov       qword ptr [rcx + rbx*2 + 8], rdx
1400a97c7: add       rbx, 8
1400a97cb: dec       r14
1400a97ce: jne       0x1400a97b0
1400a97d0: mov       rax, qword ptr [rbp - 0x18]
1400a97d4: jmp       0x1400a97e9
1400a97d6: mov       eax, 8
1400a97db: mov       qword ptr [rbp - 0x10], rax
1400a97df: xor       eax, eax
1400a97e1: cmp       rdi, r8
1400a97e4: jne       0x1400a979d
1400a97e6: xor       r15d, r15d
1400a97e9: mov       qword ptr [rsi], rax
1400a97ec: mov       rax, qword ptr [rbp - 0x10]
1400a97f0: mov       qword ptr [rsi + 8], rax
1400a97f4: mov       qword ptr [rsi + 0x10], r15
1400a97f8: mov       rax, rsi
1400a97fb: add       rsp, 0x40
1400a97ff: pop       rbx
1400a9800: pop       rdi
1400a9801: pop       rsi
1400a9802: pop       r12
1400a9804: pop       r14
1400a9806: pop       r15
1400a9808: pop       rbp
1400a9809: ret
