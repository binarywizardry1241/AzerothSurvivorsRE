0x145be05e0: push r15
0x145be05e2: push r14
0x145be05e4: push rsi
0x145be05e5: push rdi
0x145be05e6: push rbx
0x145be05e7: sub rsp, 0xa0
0x145be05ee: mov rsi, rcx
0x145be05f1: test dl, dl
0x145be05f3: je 0x145be06f6
0x145be05f9: mov ebx, edx
0x145be05fb: lea rdi, [rip + 0x1ac0fca]
0x145be0602: mov r14d, 6
0x145be0608: mov edx, 6
0x145be060d: mov rcx, rdi
0x145be0610: call 0x145bbff50
0x145be0615: test rax, rax
0x145be0618: cmove rax, rdi
0x145be061c: cmove rdx, r14
0x145be0620: mov qword ptr [rsp + 0x20], rax
0x145be0625: mov qword ptr [rsp + 0x28], rdx
0x145be062a: lea rax, [rip + 0x1ac0fa1]
0x145be0631: mov qword ptr [rsp + 0x40], rax
0x145be0636: mov qword ptr [rsp + 0x48], 1
0x145be063f: lea rax, [rip + 0x1ac0f8d]
0x145be0646: mov qword ptr [rsp + 0x50], rax
0x145be064b: mov qword ptr [rsp + 0x58], 2
0x145be0654: lea rax, [rip + 0x1ac0f7a]
0x145be065b: mov qword ptr [rsp + 0x60], rax
0x145be0660: mov qword ptr [rsp + 0x68], 3
0x145be0669: lea rax, [rip + 0x1ac0f68]
0x145be0670: mov qword ptr [rsp + 0x70], rax
0x145be0675: mov qword ptr [rsp + 0x78], 2
0x145be067e: lea rax, [rip + 0x1ac0f55]
0x145be0685: mov qword ptr [rsp + 0x80], rax
0x145be068d: mov qword ptr [rsp + 0x88], 1
0x145be0699: movzx ecx, bl
0x145be069c: cmp bl, 6
0x145be069f: jae 0x145be0789
0x145be06a5: shl ecx, 4
0x145be06a8: movups xmm0, xmmword ptr [rsp + rcx + 0x30]
0x145be06ad: movups xmmword ptr [rsp + 0x90], xmm0
0x145be06b5: lea rax, [rsp + 0x20]
0x145be06ba: mov qword ptr [rsp + 0x30], rax
0x145be06bf: lea rax, [rip - 0x5bde606]
0x145be06c6: mov qword ptr [rsp + 0x38], rax
0x145be06cb: lea rcx, [rsp + 0x90]
0x145be06d3: mov qword ptr [rsp + 0x40], rcx
0x145be06d8: mov qword ptr [rsp + 0x48], rax
0x145be06dd: lea rdx, [rip + 0x1ac0f14]
0x145be06e4: lea r8, [rsp + 0x30]
0x145be06e9: mov rcx, rsi
0x145be06ec: call 0x145fd7da0
0x145be06f1: jmp 0x145be0777
0x145be06f6: lea rdi, [rip + 0x1ac0ec9]
0x145be06fd: mov ebx, 6
0x145be0702: mov edx, 6
0x145be0707: mov rcx, rdi
0x145be070a: call 0x145bbff50
0x145be070f: test rax, rax
0x145be0712: cmove rax, rdi
0x145be0716: mov rdi, rdx
0x145be0719: cmove rdi, rbx
0x145be071d: test rdi, rdi
0x145be0720: jns 0x145be0732
0x145be0722: xor r15d, r15d
0x145be0725: mov rcx, r15
0x145be0728: mov rdx, rdi
0x145be072b: call 0x1461add5b
0x145be0730: ud2 
0x145be0732: je 0x145be0767
0x145be0734: mov r14, rax
0x145be0737: call 0x140002200
0x145be073c: mov r15d, 1
0x145be0742: mov edx, 1
0x145be0747: mov rcx, rdi
0x145be074a: call 0x1400021c0
0x145be074f: test rax, rax
0x145be0752: je 0x145be0725
0x145be0754: mov rbx, rax
0x145be0757: mov rcx, rax
0x145be075a: mov rdx, r14
0x145be075d: mov r8, rdi
0x145be0760: call 0x14600504b
0x145be0765: jmp 0x145be076c
0x145be0767: mov ebx, 1
0x145be076c: mov qword ptr [rsi], rdi
0x145be076f: mov qword ptr [rsi + 8], rbx
0x145be0773: mov qword ptr [rsi + 0x10], rdi
0x145be0777: mov rax, rsi
0x145be077a: add rsp, 0xa0
0x145be0781: pop rbx
0x145be0782: pop rdi
0x145be0783: pop rsi
0x145be0784: pop r14
0x145be0786: pop r15
0x145be0788: ret 
0x145be0789: lea r8, [rip + 0x1ac0e50]
0x145be0790: mov edx, 6
0x145be0795: call 0x1461ae0f3
0x145be079a: ud2 
