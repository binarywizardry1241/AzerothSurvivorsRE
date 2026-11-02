0x1458544c0: push rbp
0x1458544c1: push r15
0x1458544c3: push r14
0x1458544c5: push r13
0x1458544c7: push r12
0x1458544c9: push rsi
0x1458544ca: push rdi
0x1458544cb: push rbx
0x1458544cc: sub rsp, 0x3b8
0x1458544d3: lea rbp, [rsp + 0x80]
0x1458544db: movaps xmmword ptr [rbp + 0x320], xmm6
0x1458544e2: and rsp, 0xffffffffffffff80
0x1458544e6: mov rbx, rsp
0x1458544e9: mov qword ptr [rbx + 0x390], rbp
0x1458544f0: mov qword ptr [rbp + 0x318], 0xfffffffffffffffe
0x1458544fb: mov r13, r8
0x1458544fe: mov r12, rdx
0x145854501: mov rsi, rcx
0x145854504: mov qword ptr [rbx + 0x300], 1
0x14585450f: mov qword ptr [rbx + 0x308], 1
0x14585451a: mov byte ptr [rbx + 0x310], 0
0x145854521: mov word ptr [rbx + 0x280], 0
0x14585452a: mov qword ptr [rbx + 0x288], 0
0x145854535: xorps xmm6, xmm6
0x145854538: movaps xmmword ptr [rbx + 0x180], xmm6
0x14585453f: movaps xmmword ptr [rbx + 0x200], xmm6
0x145854546: mov qword ptr [rbx + 0x290], 8
0x145854551: movups xmmword ptr [rbx + 0x298], xmm6
0x145854558: mov qword ptr [rbx + 0x2a8], 8
0x145854563: mov qword ptr [rbx + 0x2b0], 0
0x14585456e: mov byte ptr [rbx + 0x2b8], 1
0x145854575: call 0x140002200
0x14585457a: mov ecx, 0x200
0x14585457f: mov edx, 0x80
0x145854584: call 0x1400021c0
0x145854589: test rax, rax
0x14585458c: je 0x145854a20
0x145854592: mov rdi, rax
0x145854595: lea rdx, [rbx + 0x180]
0x14585459c: mov r8d, 0x200
0x1458545a2: mov rcx, rax
0x1458545a5: call 0x145d145fb
0x1458545aa: mov qword ptr [rbx + 0x110], 1
0x1458545b5: mov qword ptr [rbx + 0x118], rdi
0x1458545bc: mov qword ptr [rbx + 0x120], 1
0x1458545c7: mov qword ptr [rbx + 0x128], rdi
0x1458545ce: mov qword ptr [rbx + 0x300], 1
0x1458545d9: mov qword ptr [rbx + 0x308], 1
0x1458545e4: mov byte ptr [rbx + 0x310], 0
0x1458545eb: mov word ptr [rbx + 0x280], 0
0x1458545f4: mov qword ptr [rbx + 0x288], 0
0x1458545ff: movaps xmmword ptr [rbx + 0x180], xmm6
0x145854606: movaps xmmword ptr [rbx + 0x200], xmm6
0x14585460d: mov qword ptr [rbx + 0x290], 8
0x145854618: movups xmmword ptr [rbx + 0x298], xmm6
0x14585461f: mov qword ptr [rbx + 0x2a8], 8
0x14585462a: mov qword ptr [rbx + 0x2b0], 0
0x145854635: mov byte ptr [rbx + 0x2b8], 1
0x14585463c: call 0x140002200
0x145854641: mov ecx, 0x200
0x145854646: mov edx, 0x80
0x14585464b: call 0x1400021c0
0x145854650: test rax, rax
0x145854653: je 0x145854a32
0x145854659: mov r14, rax
0x14585465c: lea rdx, [rbx + 0x180]
0x145854663: mov r8d, 0x200
0x145854669: mov rcx, rax
0x14585466c: call 0x145d145fb
0x145854671: mov qword ptr [rbx + 0x130], 1
0x14585467c: mov qword ptr [rbx + 0x138], r14
0x145854683: mov qword ptr [rbx + 0x140], 1
0x14585468e: mov qword ptr [rbx + 0x148], r14
0x145854695: call 0x140002200
0x14585469a: mov ecx, 0x18
0x14585469f: mov edx, 8
0x1458546a4: call 0x1400021c0
0x1458546a9: test rax, rax
0x1458546ac: je 0x145854a44
0x1458546b2: mov r15, rax
0x1458546b5: mov qword ptr [rax], 1
0x1458546bc: mov qword ptr [rax + 8], 1
0x1458546c4: mov byte ptr [rax + 0x10], 0
0x1458546c8: mov qword ptr [rbx + 0xe8], rax
0x1458546cf: call 0x140002200
0x1458546d4: mov ecx, 0x18
0x1458546d9: mov edx, 8
0x1458546de: call 0x1400021c0
0x1458546e3: test rax, rax
0x1458546e6: je 0x145854a64
0x1458546ec: mov qword ptr [rax], 1
0x1458546f3: mov qword ptr [rax + 8], 1
0x1458546fb: mov byte ptr [rax + 0x10], 0
0x1458546ff: mov qword ptr [rbx + 0xf0], rax
0x145854706: test r13, r13
0x145854709: jns 0x14585472d
0x14585470b: xor r12d, r12d
0x14585470e: mov byte ptr [rbx + 0xae], 1
0x145854715: mov byte ptr [rbx + 0xaf], 1
0x14585471c: mov rcx, r12
0x14585471f: mov rdx, r13
0x145854722: call 0x145eb6fcb
0x145854727: nop
0x145854728: jmp 0x145854a94
0x14585472d: mov qword ptr [rbx + 0x100], rsi
0x145854734: mov qword ptr [rbx + 0xd0], rax
0x14585473b: je 0x145854784
0x14585473d: mov rsi, r12
0x145854740: call 0x140002200
0x145854745: mov r12d, 1
0x14585474b: mov edx, 1
0x145854750: mov rcx, r13
0x145854753: call 0x1400021c0
0x145854758: test rax, rax
0x14585475b: je 0x14585470e
0x14585475d: mov qword ptr [rbx + 0xd8], rax
0x145854764: mov rcx, rax
0x145854767: mov rdx, rsi
0x14585476a: mov r8, r13
0x14585476d: call 0x145d145fb
0x145854772: mov rsi, qword ptr [rbx + 0xd0]
0x145854779: lock inc qword ptr [r15]
0x14585477d: jg 0x14585479d
0x14585477f: jmp 0x145854a94
0x145854784: mov rsi, rax
0x145854787: mov eax, 1
0x14585478c: mov qword ptr [rbx + 0xd8], rax
0x145854793: lock inc qword ptr [r15]
0x145854797: jle 0x145854a94
0x14585479d: mov qword ptr [rbx + 0xe0], r13
0x1458547a4: lock inc qword ptr [rsi]
0x1458547a8: jle 0x145854a94
0x1458547ae: mov qword ptr [rbx + 0xf8], r15
0x1458547b5: mov qword ptr [rbx + 0x108], rsi
0x1458547bc: mov qword ptr [rbx + 0x190], 0xffffffffffffffff
0x1458547c7: mov qword ptr [rbx + 0x180], 0
0x1458547d2: mov byte ptr [rbx + 0x1a8], 0
0x1458547d9: call 0x140002200
0x1458547de: mov ecx, 0xa
0x1458547e3: mov edx, 1
0x1458547e8: call 0x1400021c0
0x1458547ed: test rax, rax
0x1458547f0: mov qword ptr [rbx + 0xc8], rax
0x1458547f7: je 0x145854a84
0x1458547fd: movabs rcx, 0x6f632d6575676f72
0x145854807: mov qword ptr [rax], rcx
0x14585480a: mov word ptr [rax + 8], 0x706f
0x145854810: mov qword ptr [rbx + 0xb0], 0xa
0x14585481b: mov qword ptr [rbx + 0xb8], rax
0x145854822: mov qword ptr [rbx + 0xc0], 0xa
0x14585482d: lea rcx, [rbx + 0x150]
0x145854834: lea r12, [rbx + 0x180]
0x14585483b: lea r8, [rbx + 0xb0]
0x145854842: mov rdx, r12
0x145854845: call 0x145cbec00
0x14585484a: nop
0x14585484b: mov rsi, qword ptr [rbx + 0x100]
0x145854852: mov rax, qword ptr [rbx + 0xe0]
0x145854859: mov qword ptr [rbx + 0x1a0], rax
0x145854860: mov rcx, qword ptr [rbx + 0xd8]
0x145854867: mov qword ptr [rbx + 0x1a8], rcx
0x14585486e: mov qword ptr [rbx + 0x1b0], rax
0x145854875: mov qword ptr [rbx + 0x180], 1
0x145854880: mov qword ptr [rbx + 0x188], rdi
0x145854887: mov qword ptr [rbx + 0x190], 1
0x145854892: mov qword ptr [rbx + 0x198], r14
0x145854899: mov qword ptr [rbx + 0x1b8], r15
0x1458548a0: mov rax, qword ptr [rbx + 0xd0]
0x1458548a7: mov qword ptr [rbx + 0x1c0], rax
0x1458548ae: lea rdx, [rbx + 0x160]
0x1458548b5: mov r8, qword ptr [rbx + 0x150]
0x1458548bc: mov r9, qword ptr [rbx + 0x158]
0x1458548c3: movzx eax, byte ptr [rbx + 0x178]
0x1458548ca: mov byte ptr [rbx + 0xa6], 1
0x1458548d1: mov byte ptr [rbx + 0xa7], 1
0x1458548d8: mov qword ptr [rsp + 0x30], r12
0x1458548dd: mov byte ptr [rsp + 0x20], al
0x1458548e1: mov qword ptr [rsp + 0x28], 0
0x1458548ea: lea rcx, [rbx + 0xb0]
0x1458548f1: call 0x145850b20
0x1458548f6: nop
0x1458548f7: mov r12, qword ptr [rbx + 0xb0]
0x1458548fe: mov rax, qword ptr [rbx + 0xb8]
0x145854905: lea rdx, [rbx + 0xb8]
0x14585490c: test r12, r12
0x14585490f: je 0x14585492f
0x145854911: mov rcx, qword ptr [rbx + 0xc0]
0x145854918: mov qword ptr [rbx + 0xc0], rcx
0x14585491f: mov qword ptr [rbx + 0xb8], rax
0x145854926: mov qword ptr [rbx + 0xb0], r12
0x14585492d: jmp 0x145854947
0x14585492f: mov qword ptr [rbx + 0xb8], rax
0x145854936: mov qword ptr [rbx + 0xb0], 0
0x145854941: mov cl, 2
0x145854943: xchg byte ptr [r15 + 0x10], cl
0x145854947: mov qword ptr [rsi], 1
0x14585494e: mov qword ptr [rsi + 8], rdi
0x145854952: mov qword ptr [rsi + 0x10], 1
0x14585495a: mov qword ptr [rsi + 0x18], r14
0x14585495e: mov qword ptr [rsi + 0x20], r15
0x145854962: mov rcx, qword ptr [rbx + 0xd0]
0x145854969: mov qword ptr [rsi + 0x28], rcx
0x14585496d: test r12, r12
0x145854970: je 0x1458549c4
0x145854972: mov qword ptr [rbx + 0xc8], rdx
0x145854979: mov rcx, qword ptr [rbx + 0xc0]
0x145854980: call qword ptr [rip + 0x663f4a]
0x145854986: lock dec qword ptr [r12]
0x14585498b: jne 0x14585499a
0x14585498d: lea rcx, [rbx + 0xb0]
0x145854994: call 0x145ccca50
0x145854999: nop
0x14585499a: mov rax, qword ptr [rbx + 0xb8]
0x1458549a1: lock dec qword ptr [rax]
0x1458549a5: jne 0x145854a02
0x1458549a7: mov byte ptr [rbx + 0xa6], 1
0x1458549ae: mov byte ptr [rbx + 0xa7], 0
0x1458549b5: mov rcx, qword ptr [rbx + 0xc8]
0x1458549bc: call 0x145ccc910
0x1458549c1: nop
0x1458549c2: jmp 0x145854a02
0x1458549c4: mov ecx, eax
0x1458549c6: and ecx, 3
0x1458549c9: lea edx, [rcx - 2]
0x1458549cc: cmp edx, 2
0x1458549cf: jb 0x145854a02
0x1458549d1: test rcx, rcx
0x1458549d4: je 0x145854a02
0x1458549d6: dec rax
0x1458549d9: lea rcx, [rbx + 0x188]
0x1458549e0: mov qword ptr [rbx + 0x188], rax
0x1458549e7: mov byte ptr [rbx + 0x180], 3
0x1458549ee: mov byte ptr [rbx + 0xa6], 1
0x1458549f5: mov byte ptr [rbx + 0xa7], 0
0x1458549fc: call 0x145cf9ce0
0x145854a01: nop
0x145854a02: mov rax, rsi
0x145854a05: movaps xmm6, xmmword ptr [rbp + 0x320]
0x145854a0c: lea rsp, [rbp + 0x338]
0x145854a13: pop rbx
0x145854a14: pop rdi
0x145854a15: pop rsi
0x145854a16: pop r12
0x145854a18: pop r13
0x145854a1a: pop r14
0x145854a1c: pop r15
0x145854a1e: pop rbp
0x145854a1f: ret
0x145854a20: mov ecx, 0x80
0x145854a25: mov edx, 0x200
0x145854a2a: call 0x145eb6fb1
0x145854a2f: nop
0x145854a30: jmp 0x145854a94
0x145854a32: mov ecx, 0x80
0x145854a37: mov edx, 0x200
0x145854a3c: call 0x145eb6fb1
0x145854a41: nop
0x145854a42: jmp 0x145854a94
0x145854a44: mov byte ptr [rbx + 0xaa], 1
0x145854a4b: mov byte ptr [rbx + 0xab], 1
0x145854a52: mov ecx, 8
0x145854a57: mov edx, 0x18
0x145854a5c: call 0x145eb6fb1
0x145854a61: nop
0x145854a62: jmp 0x145854a94
0x145854a64: mov byte ptr [rbx + 0xac], 1
0x145854a6b: mov byte ptr [rbx + 0xad], 1
0x145854a72: mov ecx, 8
0x145854a77: mov edx, 0x18
0x145854a7c: call 0x145eb6fb1
0x145854a81: nop
0x145854a82: jmp 0x145854a94
0x145854a84: mov ecx, 1
0x145854a89: mov edx, 0xa
0x145854a8e: call 0x145eb6fcb
0x145854a93: nop
0x145854a94: ud2
