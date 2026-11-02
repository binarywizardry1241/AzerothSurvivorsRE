1458aa2a0: 55 push rbp
1458aa2a1: 4157 push r15
1458aa2a3: 4156 push r14
1458aa2a5: 56 push rsi
1458aa2a6: 57 push rdi
1458aa2a7: 53 push rbx
1458aa2a8: 4883ec68 sub rsp, 0x68
1458aa2ac: 488d6c2460 lea rbp, [rsp + 0x60]
1458aa2b1: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
1458aa2b9: 4889ce mov rsi, rcx
1458aa2bc: f30f590dc4315000 mulss xmm1, dword ptr [rip + 0x5031c4]
1458aa2c4: f30f114dfc movss dword ptr [rbp - 4], xmm1
1458aa2c9: 488d45fc lea rax, [rbp - 4]
1458aa2cd: 488945e0 mov qword ptr [rbp - 0x20], rax
1458aa2d1: 488d05083c3400 lea rax, [rip + 0x343c08]
1458aa2d8: 488945e8 mov qword ptr [rbp - 0x18], rax
1458aa2dc: 488d15314e3501 lea rdx, [rip + 0x1354e31]
1458aa2e3: 488d4dc8 lea rcx, [rbp - 0x38]
1458aa2e7: 4c8d45e0 lea r8, [rbp - 0x20]
1458aa2eb: e8402e3300 call 0x145bdd130
1458aa2f0: 488b5dd0 mov rbx, qword ptr [rbp - 0x30]
1458aa2f4: 488b7dd8 mov rdi, qword ptr [rbp - 0x28]
1458aa2f8: 4883ff02 cmp rdi, 2
1458aa2fc: 7305 jae 0x1458aa303
1458aa2fe: 4531f6 xor r14d, r14d
1458aa301: eb0b jmp 0x1458aa30e
1458aa303: 66817c3bfe2e30 cmp word ptr [rbx + rdi - 2], 0x302e
1458aa30a: 410f94c6 sete r14b
1458aa30e: 488d4de0 lea rcx, [rbp - 0x20]
1458aa312: 488d55c8 lea rdx, [rbp - 0x38]
1458aa316: e8d5323300 call 0x145bdd5f0
1458aa31b: 90 nop
1458aa31c: 4584f6 test r14b, r14b
1458aa31f: 741a je 0x1458aa33b
1458aa321: 4883c7fe add rdi, -2
1458aa325: 4885ff test rdi, rdi
1458aa328: 7922 jns 0x1458aa34c
1458aa32a: 4531ff xor r15d, r15d
1458aa32d: 4c89f9 mov rcx, r15
1458aa330: 4889fa mov rdx, rdi
1458aa333: e8b3f14f00 call 0x145da94eb
1458aa338: 90 nop
1458aa339: 0f0b ud2
1458aa33b: 488b45f0 mov rax, qword ptr [rbp - 0x10]
1458aa33f: 48894610 mov qword ptr [rsi + 0x10], rax
1458aa343: 0f1045e0 movups xmm0, xmmword ptr [rbp - 0x20]
1458aa347: 0f1106 movups xmmword ptr [rsi], xmm0
1458aa34a: eb5b jmp 0x1458aa3a7
1458aa34c: 7430 je 0x1458aa37e
1458aa34e: e8ad7e75fa call 0x140002200
1458aa353: 41bf01000000 mov r15d, 1
1458aa359: ba01000000 mov edx, 1
1458aa35e: 4889f9 mov rcx, rdi
1458aa361: e85a7e75fa call 0x1400021c0
1458aa366: 4885c0 test rax, rax
1458aa369: 74c2 je 0x1458aa32d
1458aa36b: 4989c6 mov r14, rax
1458aa36e: 4889c1 mov rcx, rax
1458aa371: 4889da mov rdx, rbx
1458aa374: 4989f8 mov r8, rdi
1458aa377: e85f003600 call 0x145c0a3db
1458aa37c: eb06 jmp 0x1458aa384
1458aa37e: 41be01000000 mov r14d, 1
1458aa384: 48893e mov qword ptr [rsi], rdi
1458aa387: 4c897608 mov qword ptr [rsi + 8], r14
1458aa38b: 48897e10 mov qword ptr [rsi + 0x10], rdi
1458aa38f: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458aa393: 4885d2 test rdx, rdx
1458aa396: 740f je 0x1458aa3a7
1458aa398: 488b4de8 mov rcx, qword ptr [rbp - 0x18]
1458aa39c: 41b801000000 mov r8d, 1
1458aa3a2: e8297e75fa call 0x1400021d0
1458aa3a7: 488b55c8 mov rdx, qword ptr [rbp - 0x38]
1458aa3ab: 4885d2 test rdx, rdx
1458aa3ae: 7410 je 0x1458aa3c0
1458aa3b0: 488b4dd0 mov rcx, qword ptr [rbp - 0x30]
1458aa3b4: 41b801000000 mov r8d, 1
1458aa3ba: e8117e75fa call 0x1400021d0
1458aa3bf: 90 nop
1458aa3c0: 4883c468 add rsp, 0x68
1458aa3c4: 5b pop rbx
1458aa3c5: 5f pop rdi
1458aa3c6: 5e pop rsi
1458aa3c7: 415e pop r14
1458aa3c9: 415f pop r15
1458aa3cb: 5d pop rbp
1458aa3cc: c3 ret
