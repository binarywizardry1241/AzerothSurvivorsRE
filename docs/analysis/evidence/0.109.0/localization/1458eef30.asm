; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x1458eef30..0x1458ef0a3 SHA256 e191328b87089797d0eb844347be71bfbf77232bd3feec8d2bd213da867faf10
0x1458eef30: push rbp
0x1458eef31: push rsi
0x1458eef32: push rdi
0x1458eef33: push rbx
0x1458eef34: sub rsp, 0x98
0x1458eef3b: lea rbp, [rsp + 0x80]
0x1458eef43: mov qword ptr [rbp + 0x10], 0xfffffffffffffffe
0x1458eef4b: mov rsi, r9
0x1458eef4e: mov rdi, r8
0x1458eef51: mov qword ptr [rbp - 0x50], rcx
0x1458eef55: mov qword ptr [rbp - 0x48], rdx
0x1458eef59: lea rcx, [rbp - 0x18]
0x1458eef5d: call 0x1458ef170
0x1458eef62: mov rax, qword ptr [rbp - 0x18]
0x1458eef66: cmp rax, -1
0x1458eef6a: je 0x1458ef097
0x1458eef70: mov qword ptr [rbp - 0x20], rax
0x1458eef74: mov rdx, qword ptr [rbp - 0x10]
0x1458eef78: mov rbx, qword ptr [rbp - 8]
0x1458eef7c: mov byte ptr [rbp - 0x18], 1
0x1458eef80: lea rcx, [rbp - 0x18]
0x1458eef84: mov qword ptr [rbp - 0x28], rdx
0x1458eef88: mov r8, rbx
0x1458eef8b: call 0x145bae140
0x1458eef90: nop
0x1458eef91: test rax, rax
0x1458eef94: je 0x1458eefbd
0x1458eef96: mov ecx, eax
0x1458eef98: and ecx, 3
0x1458eef9b: lea edx, [rcx - 2]
0x1458eef9e: cmp edx, 2
0x1458eefa1: jb 0x1458eefbd
0x1458eefa3: test rcx, rcx
0x1458eefa6: je 0x1458eefbd
0x1458eefa8: dec rax
0x1458eefab: lea rcx, [rbp - 0x10]
0x1458eefaf: mov qword ptr [rbp - 0x10], rax
0x1458eefb3: mov byte ptr [rbp - 0x18], 3
0x1458eefb7: call 0x145bdf7c0
0x1458eefbc: nop
0x1458eefbd: lea rax, [rbp - 0x50]
0x1458eefc1: mov qword ptr [rbp - 0x18], rax
0x1458eefc5: lea rax, [rip - 0x58ecf0c]
0x1458eefcc: mov qword ptr [rbp - 0x10], rax
0x1458eefd0: lea rdx, [rip + 0x15e3996]
0x1458eefd7: lea rcx, [rbp - 0x40]
0x1458eefdb: lea r8, [rbp - 0x18]
0x1458eefdf: call 0x145bcce30
0x1458eefe4: nop
0x1458eefe5: mov r9, qword ptr [rbp - 0x38]
0x1458eefe9: mov rax, qword ptr [rbp - 0x30]
0x1458eefed: mov qword ptr [rsp + 0x20], rax
0x1458eeff2: lea rcx, [rbp - 0x18]
0x1458eeff6: mov rdx, qword ptr [rbp - 0x28]
0x1458eeffa: mov r8, rbx
0x1458eeffd: mov qword ptr [rbp + 8], r9
0x1458ef001: call 0x145ba6d40
0x1458ef006: nop
0x1458ef007: mov rdx, qword ptr [rbp - 0x40]
0x1458ef00b: test rdx, rdx
0x1458ef00e: je 0x1458ef01f
0x1458ef010: mov r8d, 1
0x1458ef016: mov rcx, qword ptr [rbp + 8]
0x1458ef01a: call 0x1400021d0
0x1458ef01f: mov rcx, qword ptr [rbp - 0x10]
0x1458ef023: mov rdx, qword ptr [rbp - 8]
0x1458ef027: mov qword ptr [rbp + 8], rcx
0x1458ef02b: mov r8, rdi
0x1458ef02e: mov r9, rsi
0x1458ef031: call 0x145bbd750
0x1458ef036: nop
0x1458ef037: mov rsi, rax
0x1458ef03a: mov rdx, qword ptr [rbp - 0x18]
0x1458ef03e: test rdx, rdx
0x1458ef041: je 0x1458ef052
0x1458ef043: mov r8d, 1
0x1458ef049: mov rcx, qword ptr [rbp + 8]
0x1458ef04d: call 0x1400021d0
0x1458ef052: test rsi, rsi
0x1458ef055: je 0x1458ef07e
0x1458ef057: mov eax, esi
0x1458ef059: and eax, 3
0x1458ef05c: lea ecx, [rax - 2]
0x1458ef05f: cmp ecx, 2
0x1458ef062: jb 0x1458ef07e
0x1458ef064: test rax, rax
0x1458ef067: je 0x1458ef07e
0x1458ef069: dec rsi
0x1458ef06c: lea rcx, [rbp - 0x10]
0x1458ef070: mov qword ptr [rbp - 0x10], rsi
0x1458ef074: mov byte ptr [rbp - 0x18], 3
0x1458ef078: call 0x145bdf7c0
0x1458ef07d: nop
0x1458ef07e: mov rdx, qword ptr [rbp - 0x20]
0x1458ef082: test rdx, rdx
0x1458ef085: je 0x1458ef097
0x1458ef087: mov r8d, 1
0x1458ef08d: mov rcx, qword ptr [rbp - 0x28]
0x1458ef091: call 0x1400021d0
0x1458ef096: nop
0x1458ef097: add rsp, 0x98
0x1458ef09e: pop rbx
0x1458ef09f: pop rdi
0x1458ef0a0: pop rsi
0x1458ef0a1: pop rbp
0x1458ef0a2: ret
