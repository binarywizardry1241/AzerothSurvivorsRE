14595870b: 448b31 mov r14d, dword ptr [rcx]
14595870e: f30f10710c movss xmm6, dword ptr [rcx + 0xc]
145958713: f30f107910 movss xmm7, dword ptr [rcx + 0x10]
145958718: 0f28d6 movaps xmm2, xmm6
14595871b: f30f58d7 addss xmm2, xmm7
14595871f: f2440f104104 movsd xmm8, qword ptr [rcx + 4]
145958725: f3440f597114 mulss xmm14, dword ptr [rcx + 0x14]
14595872b: f3440f108d78010000 movss xmm9, dword ptr [rbp + 0x178]
145958734: f3440f114c2420 movss dword ptr [rsp + 0x20], xmm9
14595873b: 4889f1 mov rcx, rsi
14595873e: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
145958745: 41b901000000 mov r9d, 1
14595874b: e8d0ebffff call 0x145957320
145958750: 4889f1 mov rcx, rsi
145958753: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
14595875a: 4889fa mov rdx, rdi
14595875d: 4589f0 mov r8d, r14d
145958760: 0f28de movaps xmm3, xmm6
145958763: e888f0ffff call 0x1459577f0
145958768: 488b86b8090000 mov rax, qword ptr [rsi + 0x9b8]
14595876f: 488b8ea0090000 mov rcx, qword ptr [rsi + 0x9a0]
145958776: 488d1408 lea rdx, [rax + rcx]
14595877a: 48c1c217 rol rdx, 0x17
14595877e: 4c8b86a8090000 mov r8, qword ptr [rsi + 0x9a8]
145958785: 4801ca add rdx, rcx
145958788: 4d89c1 mov r9, r8
14595878b: 49c1e111 shl r9, 0x11
14595878f: 4c8b96b0090000 mov r10, qword ptr [rsi + 0x9b0]
145958796: 4931ca xor r10, rcx
145958799: 4c31c0 xor rax, r8
14595879c: 4d31d0 xor r8, r10
14595879f: 4c8986a8090000 mov qword ptr [rsi + 0x9a8], r8
1459587a6: 4831c1 xor rcx, rax
1459587a9: 48898ea0090000 mov qword ptr [rsi + 0x9a0], rcx
1459587b0: 4d31ca xor r10, r9
1459587b3: 4c8996b0090000 mov qword ptr [rsi + 0x9b0], r10
1459587ba: 48c1c02d rol rax, 0x2d
1459587be: 488986b8090000 mov qword ptr [rsi + 0x9b8], rax
1459587c5: 48c1ea3f shr rdx, 0x3f
1459587c9: 488d05b8118d01 lea rax, [rip + 0x18d11b8]
1459587d0: f30f100490 movss xmm0, dword ptr [rax + rdx*4]
1459587d5: f30f5ec7 divss xmm0, xmm7
1459587d9: f2440f118564010000 movsd qword ptr [rbp + 0x164], xmm8
1459587e2: c7856001000002000000 mov dword ptr [rbp + 0x160], 2
1459587ec: f3440f58fe addss xmm15, xmm6
1459587f1: f3440f58ff addss xmm15, xmm7
1459587f6: f3440f11bd14010000 movss dword ptr [rbp + 0x114], xmm15
1459587ff: c785180100000000803e mov dword ptr [rbp + 0x118], 0x3e800000
145958809: f30f11851c010000 movss dword ptr [rbp + 0x11c], xmm0
145958811: c7851001000003000000 mov dword ptr [rbp + 0x110], 3
14595881b: 488d8510010000 lea rax, [rbp + 0x110]
145958822: 4889442448 mov qword ptr [rsp + 0x48], rax
145958827: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
14595882e: 4489742438 mov dword ptr [rsp + 0x38], r14d
145958833: f30f11742430 movss dword ptr [rsp + 0x30], xmm6
145958839: f3440f114c2428 movss dword ptr [rsp + 0x28], xmm9
145958840: f3440f11542420 movss dword ptr [rsp + 0x20], xmm10
145958847: 4c8d8560010000 lea r8, [rbp + 0x160]
14595884e: 4889f1 mov rcx, rsi
145958851: 4889fa mov rdx, rdi
145958854: 0f289d50010000 movaps xmm3, xmmword ptr [rbp + 0x150]
14595885b: e880edffff call 0x1459575e0
145958860: 488b9698050000 mov rdx, qword ptr [rsi + 0x598]
145958867: 4839d0 cmp rax, rdx
14595886a: 0f836c430000 jae 0x14595cbdc
145958870: 488b8e90050000 mov rcx, qword ptr [rsi + 0x590]
145958877: 48c1e007 shl rax, 7
14595887b: c644017c01 mov byte ptr [rcx + rax + 0x7c], 1
145958880: 488b9668050000 mov rdx, qword ptr [rsi + 0x568]
145958887: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
14595888e: 4839d1 cmp rcx, rdx
145958891: 0f8354440000 jae 0x14595cceb
145958897: 48039e60050000 add rbx, qword ptr [rsi + 0x560]
14595889e: 4881c618060000 add rsi, 0x618
1459588a5: 4889d9 mov rcx, rbx
1459588a8: e8f350fbff call 0x14590d9a0
1459588ad: 4889c7 mov rdi, rax
1459588b0: 4889d3 mov rbx, rdx
1459588b3: 4c8d354e238d01 lea r14, [rip + 0x18d234e]
1459588ba: 41bf1b000000 mov r15d, 0x1b
1459588c0: ba1b000000 mov edx, 0x1b
1459588c5: e9d3280000 jmp 0x14595b19d
