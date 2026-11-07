0x1459d5600: 55 push rbp
0x1459d5601: 4157 push r15
0x1459d5603: 4156 push r14
0x1459d5605: 4155 push r13
0x1459d5607: 4154 push r12
0x1459d5609: 56 push rsi
0x1459d560a: 57 push rdi
0x1459d560b: 53 push rbx
0x1459d560c: 4883ec68 sub rsp, 0x68
0x1459d5610: 488d6c2460 lea rbp, [rsp + 0x60]
0x1459d5615: 0f2975f0 movaps xmmword ptr [rbp - 0x10], xmm6
0x1459d5619: 48c745e8feffffff mov qword ptr [rbp - 0x18], 0xfffffffffffffffe
0x1459d5621: 4889ce mov rsi, rcx
0x1459d5624: 488b02 mov rax, qword ptr [rdx]
0x1459d5627: 4c8b7208 mov r14, qword ptr [rdx + 8]
0x1459d562b: 4c39f0 cmp rax, r14
0x1459d562e: 0f841c010000 je 0x1459d5750
0x1459d5634: 4c8b7a10 mov r15, qword ptr [rdx + 0x10]
0x1459d5638: f30f1035745f4d00 movss xmm6, dword ptr [rip + 0x4d5f74]
0x1459d5640: eb1b jmp 0x1459d565d
0x1459d5642: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1459d5650: 4883e880 sub rax, -0x80
0x1459d5654: 4c39f0 cmp rax, r14
0x1459d5657: 0f84f3000000 je 0x1459d5750
0x1459d565d: 48833801 cmp qword ptr [rax], 1
0x1459d5661: 75ed jne 0x1459d5650
0x1459d5663: f3410f1007 movss xmm0, dword ptr [r15]
0x1459d5668: f30f58c6 addss xmm0, xmm6
0x1459d566c: 0f2e4008 ucomiss xmm0, dword ptr [rax + 8]
0x1459d5670: 72de jb 0x1459d5650
0x1459d5672: 4c8da080000000 lea r12, [rax + 0x80]
0x1459d5679: 4c8922 mov qword ptr [rdx], r12
0x1459d567c: 488b7820 mov rdi, qword ptr [rax + 0x20]
0x1459d5680: e87bcb62fa call 0x140002200
0x1459d5685: b920000000 mov ecx, 0x20
0x1459d568a: ba08000000 mov edx, 8
0x1459d568f: e82ccb62fa call 0x1400021c0
0x1459d5694: 4885c0 test rax, rax
0x1459d5697: 0f84e2000000 je 0x1459d577f
0x1459d569d: 488938 mov qword ptr [rax], rdi
0x1459d56a0: 48c745d004000000 mov qword ptr [rbp - 0x30], 4
0x1459d56a8: 488945d8 mov qword ptr [rbp - 0x28], rax
0x1459d56ac: 48c745e001000000 mov qword ptr [rbp - 0x20], 1
0x1459d56b4: 4d39f4 cmp r12, r14
0x1459d56b7: 747e je 0x1459d5737
0x1459d56b9: bf01000000 mov edi, 1
0x1459d56be: 488d5dd0 lea rbx, [rbp - 0x30]
0x1459d56c2: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1459d56d0: 49833c2401 cmp qword ptr [r12], 1
0x1459d56d5: 7511 jne 0x1459d56e8
0x1459d56d7: f3410f1007 movss xmm0, dword ptr [r15]
0x1459d56dc: f30f58c6 addss xmm0, xmm6
0x1459d56e0: 410f2e442408 ucomiss xmm0, dword ptr [r12 + 8]
0x1459d56e6: 730b jae 0x1459d56f3
0x1459d56e8: 4983ec80 sub r12, -0x80
0x1459d56ec: 4d39f4 cmp r12, r14
0x1459d56ef: 75df jne 0x1459d56d0
0x1459d56f1: eb44 jmp 0x1459d5737
0x1459d56f3: 4d8b6c2420 mov r13, qword ptr [r12 + 0x20]
0x1459d56f8: 483b7dd0 cmp rdi, qword ptr [rbp - 0x30]
0x1459d56fc: 7525 jne 0x1459d5723
0x1459d56fe: 48c744242008000000 mov qword ptr [rsp + 0x20], 8
0x1459d5707: 41b801000000 mov r8d, 1
0x1459d570d: 41b908000000 mov r9d, 8
0x1459d5713: 4889d9 mov rcx, rbx
0x1459d5716: 4889fa mov rdx, rdi
0x1459d5719: e8527d2300 call 0x145c0d470
0x1459d571e: 90 nop
0x1459d571f: 488b45d8 mov rax, qword ptr [rbp - 0x28]
0x1459d5723: 4983ec80 sub r12, -0x80
0x1459d5727: 4c892cf8 mov qword ptr [rax + rdi*8], r13
0x1459d572b: 48ffc7 inc rdi
0x1459d572e: 48897de0 mov qword ptr [rbp - 0x20], rdi
0x1459d5732: 4d39f4 cmp r12, r14
0x1459d5735: 7599 jne 0x1459d56d0
0x1459d5737: 488b45e0 mov rax, qword ptr [rbp - 0x20]
0x1459d573b: 48894610 mov qword ptr [rsi + 0x10], rax
0x1459d573f: 488b45d0 mov rax, qword ptr [rbp - 0x30]
0x1459d5743: 488906 mov qword ptr [rsi], rax
0x1459d5746: 488b45d8 mov rax, qword ptr [rbp - 0x28]
0x1459d574a: 48894608 mov qword ptr [rsi + 8], rax
0x1459d574e: eb17 jmp 0x1459d5767
0x1459d5750: 48c70600000000 mov qword ptr [rsi], 0
0x1459d5757: 48c7460808000000 mov qword ptr [rsi + 8], 8
0x1459d575f: 48c7461000000000 mov qword ptr [rsi + 0x10], 0
0x1459d5767: 4889f0 mov rax, rsi
0x1459d576a: 0f2875f0 movaps xmm6, xmmword ptr [rbp - 0x10]
0x1459d576e: 4883c468 add rsp, 0x68
0x1459d5772: 5b pop rbx
0x1459d5773: 5f pop rdi
0x1459d5774: 5e pop rsi
0x1459d5775: 415c pop r12
0x1459d5777: 415d pop r13
0x1459d5779: 415e pop r14
0x1459d577b: 415f pop r15
0x1459d577d: 5d pop rbp
0x1459d577e: c3 ret
0x1459d577f: b908000000 mov ecx, 8
0x1459d5784: ba20000000 mov edx, 0x20
0x1459d5789: e85d3d3d00 call 0x145da94eb
0x1459d578e: 0f0b ud2
