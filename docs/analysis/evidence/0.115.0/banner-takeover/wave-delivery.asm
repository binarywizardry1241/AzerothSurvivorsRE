14596134a 4989d5 mov r13, rdx
14596134d 4885c0 test rax, rax
145961350 4c0f44ef cmove r13, rdi
145961354 4c0f45e0 cmovne r12, rax
145961358 488b5518 mov rdx, qword ptr [rbp + 0x18]
14596135c 488b8d90000000 mov rcx, qword ptr [rbp + 0x90]
145961363 4839d1 cmp rcx, rdx
145961366 0f83d2080000 jae 0x145961c3e
14596136c 488d3c89 lea rdi, [rcx + rcx*4]
145961370 48c1e704 shl rdi, 4
145961374 488b4508 mov rax, qword ptr [rbp + 8]
145961378 4801f8 add rax, rdi
14596137b 4883c020 add rax, 0x20
14596137f 48894528 mov qword ptr [rbp + 0x28], rax
145961383 488d05767a3900 lea rax, [rip + 0x397a76]
14596138a 48894530 mov qword ptr [rbp + 0x30], rax
14596138e 488d15fc3a3501 lea rdx, [rip + 0x1353afc]
145961395 488d4d40 lea rcx, [rbp + 0x40]
145961399 4c8d4528 lea r8, [rbp + 0x28]
14596139d e8ae5f3800 call 0x145ce7350
1459613a2 90 nop
1459613a3 488b4508 mov rax, qword ptr [rbp + 8]
1459613a7 4801f8 add rax, rdi
1459613aa 488b4d48 mov rcx, qword ptr [rbp + 0x48]
1459613ae 488b5550 mov rdx, qword ptr [rbp + 0x50]
1459613b2 4c8b7010 mov r14, qword ptr [rax + 0x10]
1459613b6 488b5818 mov rbx, qword ptr [rax + 0x18]
1459613ba 48898d98000000 mov qword ptr [rbp + 0x98], rcx
1459613c1 e8caebf7ff call 0x1458dff90
1459613c6 90 nop
1459613c7 4889c7 mov rdi, rax
1459613ca 4989d7 mov r15, rdx
1459613cd 488b5540 mov rdx, qword ptr [rbp + 0x40]
1459613d1 4885d2 test rdx, rdx
1459613d4 7412 je 0x1459613e8
1459613d6 41b801000000 mov r8d, 1
1459613dc 488b8d98000000 mov rcx, qword ptr [rbp + 0x98]
1459613e3 e8e80d6afa call 0x1400021d0
1459613e8 4885ff test rdi, rdi
1459613eb 4c0f45f7 cmovne r14, rdi
1459613ef 4c0f44fb cmove r15, rbx
1459613f3 4c896c2420 mov qword ptr [rsp + 0x20], r13
1459613f8 488d4d40 lea rcx, [rbp + 0x40]
1459613fc 4c89f2 mov rdx, r14
1459613ff 4d89f8 mov r8, r15
145961402 4d89e1 mov r9, r12
145961405 e8567f0400 call 0x1459a9360
