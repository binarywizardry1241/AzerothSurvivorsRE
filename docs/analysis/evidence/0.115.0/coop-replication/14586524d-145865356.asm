0x14586524d: mov rax, qword ptr [rbp + 0x2f8]
0x145865254: mov qword ptr [rbp + 0x30], rax
0x145865258: mov rax, qword ptr [rbp + 0x290]
0x14586525f: mov qword ptr [rbp + 0x28], rax
0x145865263: mov byte ptr [rbp + 0x321], 1
0x14586526a: lea rsi, [rip + 0x17c625b]
0x145865271: mov edi, 7
0x145865276: mov edx, 7
0x14586527b: mov rcx, rsi
0x14586527e: call 0x1458dff90
0x145865283: nop
0x145865284: jmp 0x1458652d0
0x145865286: mov qword ptr [rbp + 0x290], 0xffffffffffffffff
0x145865291: cmp byte ptr [r12 + 0x75], 0xb
0x145865297: je 0x14586524d
0x145865299: mov rax, qword ptr [rbp + 0x2f8]
0x1458652a0: mov qword ptr [rbp + 0x30], rax
0x1458652a4: mov rax, qword ptr [rbp + 0x290]
0x1458652ab: mov qword ptr [rbp + 0x28], rax
0x1458652af: mov byte ptr [rbp + 0x321], 1
0x1458652b6: lea rsi, [rip + 0x17c6216]
0x1458652bd: mov edi, 9
0x1458652c2: mov edx, 9
0x1458652c7: mov rcx, rsi
0x1458652ca: call 0x1458dff90
0x1458652cf: nop
0x1458652d0: test rax, rax
0x1458652d3: cmove rdx, rdi
0x1458652d7: cmovne rsi, rax
0x1458652db: test rdx, rdx
0x1458652de: jns 0x14586530d
0x1458652e0: xor edi, edi
0x1458652e2: mov rax, qword ptr [rbp + 0x2f8]
0x1458652e9: mov qword ptr [rbp + 0x30], rax
0x1458652ed: mov rax, qword ptr [rbp + 0x290]
0x1458652f4: mov qword ptr [rbp + 0x28], rax
0x1458652f8: mov byte ptr [rbp + 0x321], 1
0x1458652ff: mov rcx, rdi
0x145865302: call 0x145eb6fcb
0x145865307: nop
0x145865308: jmp 0x14586664c
0x14586530d: mov qword ptr [rbp + 0x10], rdx
0x145865311: je 0x14586545b
0x145865317: call 0x140002200
0x14586531c: mov edi, 1
0x145865321: mov edx, 1
0x145865326: mov rbx, qword ptr [rbp + 0x10]
0x14586532a: mov rcx, rbx
0x14586532d: call 0x1400021c0
0x145865332: mov rdx, rbx
0x145865335: test rax, rax
0x145865338: je 0x1458652e2
0x14586533a: mov qword ptr [rbp + 0x18], rax
0x14586533e: mov rcx, rax
0x145865341: mov r8, rdx
0x145865344: mov rdx, rsi
0x145865347: call 0x145d145fb
0x14586534c: cmp byte ptr [r12 + 0x75], 0xb
0x145865352: mov dword ptr [rbp - 0x14], r13d
