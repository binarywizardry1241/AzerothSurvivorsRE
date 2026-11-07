14014a330 56 push rsi
14014a331 57 push rdi
14014a332 53 push rbx
14014a333 4881ec10020000 sub rsp, 0x210
14014a33a 4889d6 mov rsi, rdx
14014a33d 4889cf mov rdi, rcx
14014a340 488d5c2458 lea rbx, [rsp + 0x58]
14014a345 41b8b8010000 mov r8d, 0x1b8
14014a34b 4889d9 mov rcx, rbx
14014a34e 4889fa mov rdx, rdi
14014a351 e891fdaa05 call 0x145bfa0e7
14014a356 4c8b87b8010000 mov r8, qword ptr [rdi + 0x1b8]
14014a35d 488d4c2438 lea rcx, [rsp + 0x38]
14014a362 4889f2 mov rdx, rsi
14014a365 4989d9 mov r9, rbx
14014a368 e813f91800 call 0x1402d9c80
14014a36d 48837c243800 cmp qword ptr [rsp + 0x38], 0
14014a373 740b je 0x14014a380
14014a375 4881c410020000 add rsp, 0x210
14014a37c 5b pop rbx
14014a37d 5f pop rdi
14014a37e 5e pop rsi
14014a37f c3 ret
14014a380 f30f6f442440 movdqu xmm0, xmmword ptr [rsp + 0x40]
14014a386 660f7f442420 movdqa xmmword ptr [rsp + 0x20], xmm0
14014a38c 488d3ded1affff lea rdi, [rip - 0xe513]
14014a393 4883be9000000000 cmp qword ptr [rsi + 0x90], 0
14014a39b 0f84d9000000 je 0x14014a47a
14014a3a1 488b4678 mov rax, qword ptr [rsi + 0x78]
14014a3a5 488b8e80000000 mov rcx, qword ptr [rsi + 0x80]
14014a3ac 48baaf56baf3dbfafd28 movabs rdx, 0x28fdfadbf3ba56af
14014a3b6 4531c0 xor r8d, r8d
14014a3b9 660f6f059f36c505 movdqa xmm0, xmmword ptr [rip + 0x5c5369f]
14014a3c1 660f76c9 pcmpeqd xmm1, xmm1
14014a3c5 660f6f151380c905 movdqa xmm2, xmmword ptr [rip + 0x5c98013]
14014a3cd 4821ca and rdx, rcx
14014a3d0 f30f6f1c10 movdqu xmm3, xmmword ptr [rax + rdx]
14014a3d5 660f6fe3 movdqa xmm4, xmm3
14014a3d9 660f74e0 pcmpeqb xmm4, xmm0
14014a3dd 66440fd7cc pmovmskb r9d, xmm4
14014a3e2 4585c9 test r9d, r9d
14014a3e5 7438 je 0x14014a41f
14014a3e7 f3450fbcd1 tzcnt r10d, r9d
14014a3ec 4901d2 add r10, rdx
14014a3ef 4921ca and r10, rcx
14014a3f2 49f7da neg r10
14014a3f5 4f8d1452 lea r10, [r10 + r10*2]
14014a3f9 f3420f6f64d0e8 movdqu xmm4, xmmword ptr [rax + r10*8 - 0x18]
14014a400 660f74e2 pcmpeqb xmm4, xmm2
14014a404 66440fd7dc pmovmskb r11d, xmm4
14014a409 4181fbffff0000 cmp r11d, 0xffff
14014a410 7428 je 0x14014a43a
14014a412 458d51ff lea r10d, [r9 - 1]
14014a416 664521ca and r10w, r9w
14014a41a 4589d1 mov r9d, r10d
14014a41d 75c8 jne 0x14014a3e7
14014a41f 660f74d9 pcmpeqb xmm3, xmm1
14014a423 66440fd7cb pmovmskb r9d, xmm3
14014a428 4585c9 test r9d, r9d
14014a42b 754d jne 0x14014a47a
14014a42d 4c01c2 add rdx, r8
14014a430 4883c210 add rdx, 0x10
14014a434 4983c010 add r8, 0x10
14014a438 eb93 jmp 0x14014a3cd
14014a43a 4a8d04d0 lea rax, [rax + r10*8]
14014a43e 488b40f8 mov rax, qword ptr [rax - 8]
14014a442 483b8618020000 cmp rax, qword ptr [rsi + 0x218]
14014a449 732f jae 0x14014a47a
14014a44b 488b8e10020000 mov rcx, qword ptr [rsi + 0x210]
14014a452 488b0cc1 mov rcx, qword ptr [rcx + rax*8]
14014a456 4885c9 test rcx, rcx
14014a459 741f je 0x14014a47a
14014a45b 488b86e0010000 mov rax, qword ptr [rsi + 0x1e0]
14014a462 48f7d1 not rcx
14014a465 486bc938 imul rcx, rcx, 0x38
14014a469 807c083001 cmp byte ptr [rax + rcx + 0x30], 1
14014a46e 750a jne 0x14014a47a
14014a470 4801c8 add rax, rcx
14014a473 488b4010 mov rax, qword ptr [rax + 0x10]
14014a477 488b38 mov rdi, qword ptr [rax]
14014a47a 488d4c2420 lea rcx, [rsp + 0x20]
14014a47f e8cc22ab05 call 0x145bfc750
14014a484 ba02000000 mov edx, 2
14014a489 4889c1 mov rcx, rax
14014a48c ffd7 call rdi
14014a48e e9e2feffff jmp 0x14014a375
