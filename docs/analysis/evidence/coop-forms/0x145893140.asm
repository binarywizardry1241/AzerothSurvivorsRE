0x145893140: push rbp
0x145893141: push r15
0x145893143: push r14
0x145893145: push r13
0x145893147: push r12
0x145893149: push rsi
0x14589314a: push rdi
0x14589314b: push rbx
0x14589314c: sub rsp, 0xa8
0x145893153: lea rbp, [rsp + 0x80]
0x14589315b: mov qword ptr [rbp + 0x20], 0xfffffffffffffffe
0x145893163: mov rdi, r9
0x145893166: mov r14, r8
0x145893169: mov rbx, rdx
0x14589316c: mov rsi, rcx
0x14589316f: mov rax, qword ptr [rcx + 0xc58]
0x145893176: sub rax, 2
0x14589317a: mov r12d, 2
0x145893180: cmovae r12, rax
0x145893184: test r12, r12
0x145893187: je 0x1458931a2
0x145893189: cmp r12, 1
0x14589318d: jne 0x1458931b0
0x14589318f: lea rax, [rip + 0x179a145]
0x145893196: mov qword ptr [rbp + 0x18], rax
0x14589319a: mov r13d, 4
0x1458931a0: jmp 0x1458931c1
0x1458931a2: mov eax, 1
0x1458931a7: mov qword ptr [rbp + 0x18], rax
0x1458931ab: mov r13, r12
0x1458931ae: jmp 0x1458931c1
0x1458931b0: lea rax, [rip + 0x179a128]
0x1458931b7: mov qword ptr [rbp + 0x18], rax
0x1458931bb: mov r13d, 5
0x1458931c1: call 0x140002200
0x1458931c6: mov ecx, 1
0x1458931cb: mov edx, 1
0x1458931d0: call 0x1400021c0
0x1458931d5: test rax, rax
0x1458931d8: je 0x1458934e8
0x1458931de: mov byte ptr [rax], 0x7b
0x1458931e1: mov qword ptr [rbp - 0x30], 1
0x1458931e9: mov qword ptr [rbp - 0x28], rax
0x1458931ed: mov qword ptr [rbp - 0x20], 1
0x1458931f5: mov byte ptr [rbp - 0x18], 1
0x1458931f9: lea rax, [rip + 0x179a0e4]
0x145893200: mov qword ptr [rsp + 0x20], rax
0x145893205: mov qword ptr [rsp + 0x28], 4
0x14589320e: lea r8, [rip + 0x17994be]
0x145893215: lea r15, [rbp - 0x10]
0x145893219: lea rdx, [rbp - 0x30]
0x14589321d: mov r9d, 4
0x145893223: mov rcx, r15
0x145893226: call 0x145858350
0x14589322b: mov qword ptr [rsp + 0x28], r14
0x145893230: mov qword ptr [rsp + 0x20], rbx
0x145893235: lea r8, [rip + 0x179a0ac]
0x14589323c: lea rbx, [rbp - 0x30]
0x145893240: mov r9d, 5
0x145893246: mov rcx, rbx
0x145893249: mov rdx, r15
0x14589324c: call 0x145858350
0x145893251: mov rax, qword ptr [rbp + 0x90]
0x145893258: mov qword ptr [rsp + 0x28], rax
0x14589325d: mov qword ptr [rsp + 0x20], rdi
0x145893262: lea r8, [rip + 0x179a084]
0x145893269: lea rdi, [rbp - 0x10]
0x14589326d: mov r9d, 3
0x145893273: mov rcx, rdi
0x145893276: mov rdx, rbx
0x145893279: call 0x145858350
0x14589327e: mov qword ptr [rsp + 0x28], r13
0x145893283: mov rax, qword ptr [rbp + 0x18]
0x145893287: mov qword ptr [rsp + 0x20], rax
0x14589328c: lea r8, [rip + 0x179a05d]
0x145893293: lea rcx, [rbp - 0x30]
0x145893297: mov r9d, 4
0x14589329d: mov rdx, rdi
0x1458932a0: call 0x145858350
0x1458932a5: mov rdi, qword ptr [rsi + 0x1590]
0x1458932ac: cmp rdi, -1
0x1458932b0: je 0x1458932d7
0x1458932b2: cmp qword ptr [rsi + 0x15c0], -1
0x1458932ba: je 0x1458932d7
0x1458932bc: lea rdx, [rsi + 0x15c0]
0x1458932c3: lea rcx, [rbp - 0x48]
0x1458932c7: call 0x145ce7810
0x1458932cc: nop
0x1458932cd: mov rcx, qword ptr [rbp - 0x40]
0x1458932d1: mov rax, qword ptr [rbp - 0x38]
0x1458932d5: jmp 0x1458932e6
0x1458932d7: mov qword ptr [rbp - 0x48], 0
0x1458932df: mov ecx, 1
0x1458932e4: xor eax, eax
0x1458932e6: mov qword ptr [rsp + 0x28], rax
0x1458932eb: mov qword ptr [rbp + 0x10], rcx
0x1458932ef: mov qword ptr [rsp + 0x20], rcx
0x1458932f4: lea r8, [rip + 0x1799ff9]
0x1458932fb: lea rcx, [rbp - 0x10]
0x1458932ff: lea rdx, [rbp - 0x30]
0x145893303: mov r9d, 4
0x145893309: call 0x145858350
0x14589330e: nop
0x14589330f: test r12, r12
0x145893312: je 0x145893340
0x145893314: cmp r12, 1
0x145893318: jne 0x14589334a
0x14589331a: mov r8, qword ptr [rsi + 0xc98]
0x145893321: test r8, r8
0x145893324: je 0x145893356
0x145893326: mov rcx, qword ptr [rsi + 0xc90]
0x14589332d: mov edx, r8d
0x145893330: and edx, 3
0x145893333: cmp r8, 4
0x145893337: jae 0x14589335d
0x145893339: xor r9d, r9d
0x14589333c: xor eax, eax
0x14589333e: jmp 0x1458933ad
0x145893340: mov eax, 1
0x145893345: jmp 0x1458933e7
0x14589334a: movzx eax, byte ptr [rsi + 0xf48]
0x145893351: jmp 0x1458933e4
0x145893356: xor eax, eax
0x145893358: jmp 0x1458933e4
0x14589335d: and r8, 0xfffffffffffffffc
0x145893361: lea r10, [rcx + 0x11d8]
0x145893368: xor r9d, r9d
0x14589336b: xor eax, eax
0x14589336d: nop dword ptr [rax]
0x145893370: movzx r11d, byte ptr [r10 - 0xd68]
0x145893378: add r11, rax
0x14589337b: movzx eax, byte ptr [r10 - 0x8f0]
0x145893383: movzx ebx, byte ptr [r10 - 0x478]
0x14589338b: add rbx, rax
0x14589338e: add rbx, r11
0x145893391: movzx eax, byte ptr [r10]
0x145893395: add rax, rbx
0x145893398: add r9, 4
0x14589339c: add r10, 0x11e0
0x1458933a3: cmp r8, r9
0x1458933a6: jne 0x145893370
0x1458933a8: test rdx, rdx
0x1458933ab: je 0x1458933e4
0x1458933ad: imul r8, r9, 0x478
0x1458933b4: add rcx, r8
0x1458933b7: add rcx, 0x470
0x1458933be: imul rdx, rdx, 0x478
0x1458933c5: xor r8d, r8d
0x1458933c8: nop dword ptr [rax + rax]
0x1458933d0: movzx r9d, byte ptr [rcx + r8]
0x1458933d5: add rax, r9
0x1458933d8: add r8, 0x478
0x1458933df: cmp rdx, r8
0x1458933e2: jne 0x1458933d0
0x1458933e4: inc rax
0x1458933e7: mov dword ptr [rsp + 0x20], eax
0x1458933eb: lea r8, [rip + 0x1799f06]
0x1458933f2: lea rcx, [rbp - 0x30]
0x1458933f6: lea rdx, [rbp - 0x10]
0x1458933fa: mov r9d, 4
0x145893400: call 0x14584f0c0
0x145893405: nop
0x145893406: movzx eax, byte ptr [rsi + 0x16d1]
0x14589340d: cmp al, 5
0x14589340f: mov ecx, 5
0x145893414: cmovae eax, ecx
0x145893417: cmp rdi, -1
0x14589341b: movzx eax, al
0x14589341e: cmove eax, ecx
0x145893421: mov dword ptr [rsp + 0x20], eax
0x145893425: lea r8, [rip + 0x1799ed0]
0x14589342c: lea rcx, [rbp - 0x10]
0x145893430: lea rdx, [rbp - 0x30]
0x145893434: mov r9d, 3
0x14589343a: call 0x14584f0c0
0x14589343f: nop
0x145893440: mov rax, qword ptr [rbp - 0x10]
0x145893444: mov rdi, qword ptr [rbp]
0x145893448: cmp rax, rdi
0x14589344b: je 0x1458934bd
0x14589344d: mov qword ptr [rbp + 0x18], rax
0x145893451: mov rbx, qword ptr [rbp - 8]
0x145893455: mov byte ptr [rbx + rdi], 0x7d
0x145893459: inc rdi
0x14589345c: mov rdx, qword ptr [rbp - 0x48]
0x145893460: test rdx, rdx
0x145893463: je 0x145893474
0x145893465: mov r8d, 1
0x14589346b: mov rcx, qword ptr [rbp + 0x10]
0x14589346f: call 0x1400021d0
0x145893474: mov rcx, qword ptr [rsi + 0x16f0]
0x14589347b: mov rax, qword ptr [rsi + 0x16f8]
0x145893482: mov qword ptr [rbp + 0x10], rbx
0x145893486: mov rdx, rbx
0x145893489: mov r8, rdi
0x14589348c: call qword ptr [rax + 0x18]
0x14589348f: nop
0x145893490: mov rdx, qword ptr [rbp + 0x18]
0x145893494: test rdx, rdx
0x145893497: je 0x1458934a9
0x145893499: mov r8d, 1
0x14589349f: mov rcx, qword ptr [rbp + 0x10]
0x1458934a3: call 0x1400021d0
0x1458934a8: nop
0x1458934a9: add rsp, 0xa8
0x1458934b0: pop rbx
0x1458934b1: pop rdi
0x1458934b2: pop rsi
0x1458934b3: pop r12
0x1458934b5: pop r13
0x1458934b7: pop r14
0x1458934b9: pop r15
0x1458934bb: pop rbp
0x1458934bc: ret
0x1458934bd: mov qword ptr [rsp + 0x20], 1
0x1458934c6: lea rcx, [rbp - 0x10]
0x1458934ca: mov r8d, 1
0x1458934d0: mov r9d, 1
0x1458934d6: mov rdx, rdi
0x1458934d9: call 0x145d14a10
0x1458934de: nop
0x1458934df: mov rax, qword ptr [rbp - 0x10]
0x1458934e3: jmp 0x14589344d
0x1458934e8: mov ecx, 1
0x1458934ed: mov edx, 1
0x1458934f2: call 0x145eb6fcb
0x1458934f7: ud2
