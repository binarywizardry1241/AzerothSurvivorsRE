1459534e7: 488b4550 mov rax, qword ptr [rbp + 0x50]
1459534eb: 48898570020000 mov qword ptr [rbp + 0x270], rax
1459534f2: 488b4558 mov rax, qword ptr [rbp + 0x58]
1459534f6: 488b7560 mov rsi, qword ptr [rbp + 0x60]
1459534fa: 48c1e604 shl rsi, 4
1459534fe: 48898538020000 mov qword ptr [rbp + 0x238], rax
145953505: 488b9d48020000 mov rbx, qword ptr [rbp + 0x248]
14595350c: 0f1f4000 nop dword ptr [rax]
145953510: 4885f6 test rsi, rsi
145953513: 7422 je 0x145953537
145953515: 488d7810 lea rdi, [rax + 0x10]
145953519: 488b10 mov rdx, qword ptr [rax]
14595351c: f30f105008 movss xmm2, dword ptr [rax + 8]
145953521: 448b480c mov r9d, dword ptr [rax + 0xc]
145953525: 4883c6f0 add rsi, -0x10
145953529: 4889d9 mov rcx, rbx
14595352c: e8ffa7ffff call 0x14594dd30
145953531: 90 nop
145953532: 4889f8 mov rax, rdi
145953535: ebd9 jmp 0x145953510
