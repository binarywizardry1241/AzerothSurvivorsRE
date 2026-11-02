0x14586535c: mov rcx, qword ptr [rbp + 0x2f0]
0x145865363: mov rdx, qword ptr [rbp + 0x2e8]
0x14586536a: call 0x14580a670
0x14586536f: test al, 1
0x145865371: je 0x1458655b8
0x145865377: movaps xmm7, xmm0
0x14586537a: mov byte ptr [rbp + 0x322], 1
0x145865381: lea rsi, [rip + 0x17a77d5]
0x145865388: mov edx, 0x10
0x14586538d: mov rcx, rsi
0x145865390: call 0x1458dff90
0x145865395: nop
0x145865396: mov rdi, rax
0x145865399: mov r15, rdx
0x14586539c: mov byte ptr [rbp + 0x322], 1
0x1458653a3: lea rbx, [rbp + 0x1d0]
0x1458653aa: mov rcx, rbx
0x1458653ad: movaps xmm1, xmm7
0x1458653b0: call 0x1458627d0
0x1458653b5: nop
0x1458653b6: test rdi, rdi
0x1458653b9: mov eax, 0x10
0x1458653be: cmove r15, rax
0x1458653c2: cmovne rsi, rdi
0x1458653c6: lea rax, [rip + 0x17a77c3]
0x1458653cd: mov qword ptr [rbp + 0xe0], rax
0x1458653d4: mov qword ptr [rbp + 0xe8], 1
0x1458653df: mov qword ptr [rbp + 0xf0], rbx
0x1458653e6: lea rax, [rip + 0x17a7783]
0x1458653ed: mov qword ptr [rbp + 0xf8], rax
0x1458653f4: mov qword ptr [rsp + 0x20], 1
0x1458653fd: lea rcx, [rbp + 0x298]
0x145865404: lea r9, [rbp + 0xe0]
0x14586540b: mov rdx, rsi
0x14586540e: mov r8, r15
0x145865411: call 0x1458e0370
0x145865416: nop
0x145865417: mov rdx, qword ptr [rbp + 0x1d0]
0x14586541e: test rdx, rdx
0x145865421: je 0x145865435
0x145865423: mov rcx, qword ptr [rbp + 0x1d8]
0x14586542a: mov r8d, 1
0x145865430: call 0x1400021d0
0x145865435: mov rax, qword ptr [rbp + 0x298]
0x14586543c: mov qword ptr [rbp + 0x38], rax
0x145865440: mov rax, qword ptr [rbp + 0x2a0]
0x145865447: mov qword ptr [rbp + 0x20], rax
0x14586544b: mov rax, qword ptr [rbp + 0x2a8]
0x145865452: mov qword ptr [rbp - 0x20], rax
