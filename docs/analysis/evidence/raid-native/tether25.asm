14595ab76: 448b31 mov r14d, dword ptr [rcx]
14595ab79: f30f107904 movss xmm7, dword ptr [rcx + 4]
14595ab7e: 450f28ca movaps xmm9, xmm10
14595ab82: f3440f105108 movss xmm10, dword ptr [rcx + 8]
14595ab88: f3440f597110 mulss xmm14, dword ptr [rcx + 0x10]
14595ab8e: f3440f104114 movss xmm8, dword ptr [rcx + 0x14]
14595ab94: f3450f58fa addss xmm15, xmm10
14595ab99: f3440f58790c addss xmm15, dword ptr [rcx + 0xc]
14595ab9f: 4889f1 mov rcx, rsi
14595aba2: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
14595aba9: 4889fa mov rdx, rdi
14595abac: 4589f0 mov r8d, r14d
14595abaf: 410f28da movaps xmm3, xmm10
14595abb3: e838ccffff call 0x1459577f0
14595abb8: 410f28c5 movaps xmm0, xmm13
14595abbc: 410f28cc movaps xmm1, xmm12
14595abc0: e86af52900 call 0x145bfa12f
14595abc5: 0f28f0 movaps xmm6, xmm0
14595abc8: f30f5f35d0264400 maxss xmm6, dword ptr [rip + 0x4426d0]
14595abd0: f30f11b564010000 movss dword ptr [rbp + 0x164], xmm6
14595abd8: c78568010000cdcccc3f mov dword ptr [rbp + 0x168], 0x3fcccccd
14595abe2: c7856001000002000000 mov dword ptr [rbp + 0x160], 2
14595abec: f30f11bd14010000 movss dword ptr [rbp + 0x114], xmm7
14595abf4: f3440f11bd18010000 movss dword ptr [rbp + 0x118], xmm15
14595abfd: f3440f11851c010000 movss dword ptr [rbp + 0x11c], xmm8
14595ac06: c7851001000006000000 mov dword ptr [rbp + 0x110], 6
14595ac10: 488d8510010000 lea rax, [rbp + 0x110]
14595ac17: 4889442448 mov qword ptr [rsp + 0x48], rax
14595ac1c: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
14595ac23: 4489742438 mov dword ptr [rsp + 0x38], r14d
14595ac28: f3440f11542430 movss dword ptr [rsp + 0x30], xmm10
14595ac2f: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
14595ac37: f30f11442428 movss dword ptr [rsp + 0x28], xmm0
14595ac3d: f3440f114c2420 movss dword ptr [rsp + 0x20], xmm9
14595ac44: 4c8d8560010000 lea r8, [rbp + 0x160]
14595ac4b: 4889f1 mov rcx, rsi
14595ac4e: 4889fa mov rdx, rdi
14595ac51: 0f289d50010000 movaps xmm3, xmmword ptr [rbp + 0x150]
14595ac58: e883c9ffff call 0x1459575e0
14595ac5d: 488b9698050000 mov rdx, qword ptr [rsi + 0x598]
14595ac64: 4839d0 cmp rax, rdx
14595ac67: 0f8317200000 jae 0x14595cc84
14595ac6d: 488b8e90050000 mov rcx, qword ptr [rsi + 0x590]
14595ac74: 4989c0 mov r8, rax
14595ac77: 49c1e007 shl r8, 7
14595ac7b: 42c644017c01 mov byte ptr [rcx + r8 + 0x7c], 1
14595ac81: 488b9698050000 mov rdx, qword ptr [rsi + 0x598]
14595ac88: 4839d0 cmp rax, rdx
14595ac8b: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
14595ac92: 0f8361200000 jae 0x14595ccf9
14595ac98: 488b8690050000 mov rax, qword ptr [rsi + 0x590]
14595ac9f: f3420f11740078 movss dword ptr [rax + r8 + 0x78], xmm6
14595aca6: 488b9668050000 mov rdx, qword ptr [rsi + 0x568]
14595acad: 4839d1 cmp rcx, rdx
14595acb0: 0f837e200000 jae 0x14595cd34
14595acb6: 48039e60050000 add rbx, qword ptr [rsi + 0x560]
14595acbd: 4889d9 mov rcx, rbx
14595acc0: e8db2cfbff call 0x14590d9a0
14595acc5: 4889c7 mov rdi, rax
14595acc8: 4889d3 mov rbx, rdx
14595accb: 4881c618060000 add rsi, 0x618
14595acd2: 4c8d35df008d01 lea r14, [rip + 0x18d00df]
14595acd9: 41bf2d000000 mov r15d, 0x2d
14595acdf: ba2d000000 mov edx, 0x2d
14595ace4: e9b4040000 jmp 0x14595b19d
