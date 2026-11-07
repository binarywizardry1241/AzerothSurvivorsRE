145b1f210 55 push rbp
145b1f211 4157 push r15
145b1f213 4156 push r14
145b1f215 4155 push r13
145b1f217 4154 push r12
145b1f219 56 push rsi
145b1f21a 57 push rdi
145b1f21b 53 push rbx
145b1f21c 4881ecb8020000 sub rsp, 0x2b8
145b1f223 488dac2480000000 lea rbp, [rsp + 0x80]
145b1f22b 48c78530020000feffffff mov qword ptr [rbp + 0x230], 0xfffffffffffffffe
145b1f236 4889ce mov rsi, rcx
145b1f239 488d4d50 lea rcx, [rbp + 0x50]
145b1f23d 4889f2 mov rdx, rsi
145b1f240 e8bbf7ffff call 0x145b1ea00
145b1f245 48837d50ff cmp qword ptr [rbp + 0x50], -1
145b1f24a 0f8499040000 je 0x145b1f6e9
145b1f250 488d8d18010000 lea rcx, [rbp + 0x118]
145b1f257 488d5550 lea rdx, [rbp + 0x50]
145b1f25b 41b8c8000000 mov r8d, 0xc8
145b1f261 e8c5bb4800 call 0x145faae2b
145b1f266 4881bee0170000ffffff00 cmp qword ptr [rsi + 0x17e0], 0xffffff
145b1f271 0f8465040000 je 0x145b1f6dc
145b1f277 837e1002 cmp dword ptr [rsi + 0x10], 2
145b1f27b 740d je 0x145b1f28a
145b1f27d f686a80c000001 test byte ptr [rsi + 0xca8], 1
145b1f284 0f8552040000 jne 0x145b1f6dc
145b1f28a 8bbdb8010000 mov edi, dword ptr [rbp + 0x1b8]
145b1f290 89bd20020000 mov dword ptr [rbp + 0x220], edi
145b1f296 8b9dbc010000 mov ebx, dword ptr [rbp + 0x1bc]
145b1f29c 448ba5c0010000 mov r12d, dword ptr [rbp + 0x1c0]
145b1f2a3 448badc4010000 mov r13d, dword ptr [rbp + 0x1c4]
145b1f2aa 448bb5c8010000 mov r14d, dword ptr [rbp + 0x1c8]
145b1f2b1 440fb6bdd8010000 movzx r15d, byte ptr [rbp + 0x1d8]
145b1f2b9 488b8d20010000 mov rcx, qword ptr [rbp + 0x120]
145b1f2c0 488b9528010000 mov rdx, qword ptr [rbp + 0x128]
145b1f2c7 e8c45bf6ff call 0x145a84e90
145b1f2cc 4869c0f0000000 imul rax, rax, 0xf0
145b1f2d3 488d15ee457901 lea rdx, [rip + 0x17945ee]
145b1f2da 488b4c1008 mov rcx, qword ptr [rax + rdx + 8]
145b1f2df 488b541010 mov rdx, qword ptr [rax + rdx + 0x10]
145b1f2e4 e8a75bf6ff call 0x145a84e90
145b1f2e9 31d2 xor edx, edx
145b1f2eb 89f9 mov ecx, edi
145b1f2ed 2b8eac180000 sub ecx, dword ptr [rsi + 0x18ac]
145b1f2f3 0f42ca cmovb ecx, edx
145b1f2f6 48038ef8110000 add rcx, qword ptr [rsi + 0x11f8]
145b1f2fd 49c7c0ffffffff mov r8, 0xffffffffffffffff
145b1f304 490f42c8 cmovb rcx, r8
145b1f308 4189d9 mov r9d, ebx
145b1f30b 442b8eb0180000 sub r9d, dword ptr [rsi + 0x18b0]
145b1f312 440f42ca cmovb r9d, edx
145b1f316 4c038e00120000 add r9, qword ptr [rsi + 0x1200]
145b1f31d 4d0f42c8 cmovb r9, r8
145b1f321 4589e2 mov r10d, r12d
145b1f324 442b96b4180000 sub r10d, dword ptr [rsi + 0x18b4]
145b1f32b 440f42d2 cmovb r10d, edx
145b1f32f 4c039608120000 add r10, qword ptr [rsi + 0x1208]
145b1f336 4d0f42d0 cmovb r10, r8
145b1f33a 4589eb mov r11d, r13d
145b1f33d 442b9eb8180000 sub r11d, dword ptr [rsi + 0x18b8]
145b1f344 440f42da cmovb r11d, edx
145b1f348 4c039e10120000 add r11, qword ptr [rsi + 0x1210]
145b1f34f 4889c7 mov rdi, rax
145b1f352 4d0f42d8 cmovb r11, r8
145b1f356 4489f0 mov eax, r14d
145b1f359 2b86bc180000 sub eax, dword ptr [rsi + 0x18bc]
145b1f35f 0f42c2 cmovb eax, edx
145b1f362 48038628120000 add rax, qword ptr [rsi + 0x1228]
145b1f369 490f42c0 cmovb rax, r8
145b1f36d 48898ef8110000 mov qword ptr [rsi + 0x11f8], rcx
145b1f374 4c898e00120000 mov qword ptr [rsi + 0x1200], r9
145b1f37b 4c899608120000 mov qword ptr [rsi + 0x1208], r10
145b1f382 4c899e10120000 mov qword ptr [rsi + 0x1210], r11
145b1f389 48898628120000 mov qword ptr [rsi + 0x1228], rax
145b1f390 8b8520020000 mov eax, dword ptr [rbp + 0x220]
145b1f396 8986ac180000 mov dword ptr [rsi + 0x18ac], eax
145b1f39c 899eb0180000 mov dword ptr [rsi + 0x18b0], ebx
145b1f3a2 4489a6b4180000 mov dword ptr [rsi + 0x18b4], r12d
145b1f3a9 4489aeb8180000 mov dword ptr [rsi + 0x18b8], r13d
145b1f3b0 4489b6bc180000 mov dword ptr [rsi + 0x18bc], r14d
145b1f3b7 80bdd501000000 cmp byte ptr [rbp + 0x1d5], 0
145b1f3be 0f8499010000 je 0x145b1f55d
145b1f3c4 488b8618110000 mov rax, qword ptr [rsi + 0x1118]
145b1f3cb 4c8bb620110000 mov r14, qword ptr [rsi + 0x1120]
145b1f3d2 4d89f4 mov r12, r14
145b1f3d5 4d85f6 test r14, r14
145b1f3d8 747b je 0x145b1f455
145b1f3da 4531e4 xor r12d, r12d
145b1f3dd 4983fe01 cmp r14, 1
145b1f3e1 744b je 0x145b1f42e
145b1f3e3 4c89f1 mov rcx, r14
145b1f3e6 662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b1f3f0 4c89e2 mov rdx, r12
145b1f3f3 4989c8 mov r8, rcx
145b1f3f6 49d1e8 shr r8, 1
145b1f3f9 4d01c4 add r12, r8
145b1f3fc 4d89e1 mov r9, r12
145b1f3ff 49c1e104 shl r9, 4
145b1f403 4531d2 xor r10d, r10d
145b1f406 4a397c0808 cmp qword ptr [rax + r9 + 8], rdi
145b1f40b 410f97c2 seta r10b
145b1f40f 4531db xor r11d, r11d
145b1f412 46383c08 cmp byte ptr [rax + r9], r15b
145b1f416 410f97c3 seta r11b
145b1f41a 450f44da cmove r11d, r10d
145b1f41e 4584db test r11b, r11b
145b1f421 4c0f45e2 cmovne r12, rdx
145b1f425 4c29c1 sub rcx, r8
145b1f428 4883f901 cmp rcx, 1
145b1f42c 77c2 ja 0x145b1f3f0
145b1f42e 4c89e1 mov rcx, r12
145b1f431 48c1e104 shl rcx, 4
145b1f435 44383c08 cmp byte ptr [rax + rcx], r15b
145b1f439 7505 jne 0x145b1f440
145b1f43b 48397c0808 cmp qword ptr [rax + rcx + 8], rdi
145b1f440 0f97c1 seta cl
145b1f443 80d900 sbb cl, 0
145b1f446 84c9 test cl, cl
145b1f448 745b je 0x145b1f4a5
145b1f44a 31d2 xor edx, edx
145b1f44c 80f9ff cmp cl, 0xff
145b1f44f 0f94c2 sete dl
145b1f452 4901d4 add r12, rdx
145b1f455 4c3bb610110000 cmp r14, qword ptr [rsi + 0x1110]
145b1f45c 7514 jne 0x145b1f472
145b1f45e 488d8e10110000 lea rcx, [rsi + 0x1110]
145b1f465 e8f6c14800 call 0x145fab660
145b1f46a 90 nop 
145b1f46b 488b8618110000 mov rax, qword ptr [rsi + 0x1118]
145b1f472 4c89e3 mov rbx, r12
145b1f475 48c1e304 shl rbx, 4
145b1f479 4801c3 add rbx, rax
145b1f47c 4d89f0 mov r8, r14
145b1f47f 4d29e0 sub r8, r12
145b1f482 7610 jbe 0x145b1f494
145b1f484 488d4b10 lea rcx, [rbx + 0x10]
145b1f488 49c1e004 shl r8, 4
145b1f48c 4889da mov rdx, rbx
145b1f48f e8a3b94800 call 0x145faae37
145b1f494 44883b mov byte ptr [rbx], r15b
145b1f497 48897b08 mov qword ptr [rbx + 8], rdi
145b1f49b 49ffc6 inc r14
145b1f49e 4c89b620110000 mov qword ptr [rsi + 0x1120], r14
145b1f4a5 4883bd78010000ff cmp qword ptr [rbp + 0x178], -1
145b1f4ad 0f84aa000000 je 0x145b1f55d
145b1f4b3 4883bd8801000002 cmp qword ptr [rbp + 0x188], 2
145b1f4bb 0f829c000000 jb 0x145b1f55d
145b1f4c1 488b8630110000 mov rax, qword ptr [rsi + 0x1130]
145b1f4c8 4c8bb638110000 mov r14, qword ptr [rsi + 0x1138]
145b1f4cf 4d89f7 mov r15, r14
145b1f4d2 4d85f6 test r14, r14
145b1f4d5 7440 je 0x145b1f517
145b1f4d7 4531ff xor r15d, r15d
145b1f4da 4983fe01 cmp r14, 1
145b1f4de 742d je 0x145b1f50d
145b1f4e0 4c89f1 mov rcx, r14
145b1f4e3 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b1f4f0 4c89fa mov rdx, r15
145b1f4f3 4989c8 mov r8, rcx
145b1f4f6 49d1e8 shr r8, 1
145b1f4f9 4d01c7 add r15, r8
145b1f4fc 4a393cf8 cmp qword ptr [rax + r15*8], rdi
145b1f500 4c0f47fa cmova r15, rdx
145b1f504 4c29c1 sub rcx, r8
145b1f507 4883f901 cmp rcx, 1
145b1f50b 77e3 ja 0x145b1f4f0
145b1f50d 4a393cf8 cmp qword ptr [rax + r15*8], rdi
145b1f511 744a je 0x145b1f55d
145b1f513 4983d700 adc r15, 0
145b1f517 4c3bb628110000 cmp r14, qword ptr [rsi + 0x1128]
145b1f51e 7514 jne 0x145b1f534
145b1f520 488d8e28110000 lea rcx, [rsi + 0x1128]
145b1f527 e894be4800 call 0x145fab3c0
145b1f52c 90 nop 
145b1f52d 488b8630110000 mov rax, qword ptr [rsi + 0x1130]
145b1f534 4a8d1cf8 lea rbx, [rax + r15*8]
145b1f538 4d89f0 mov r8, r14
145b1f53b 4d29f8 sub r8, r15
145b1f53e 7610 jbe 0x145b1f550
145b1f540 488d4b08 lea rcx, [rbx + 8]
145b1f544 49c1e003 shl r8, 3
145b1f548 4889da mov rdx, rbx
145b1f54b e8e7b84800 call 0x145faae37
145b1f550 48893b mov qword ptr [rbx], rdi
145b1f553 49ffc6 inc r14
145b1f556 4c89b638110000 mov qword ptr [rsi + 0x1138], r14
145b1f55d 488d4db0 lea rcx, [rbp - 0x50]
145b1f561 4889f2 mov rdx, rsi
145b1f564 e837100000 call 0x145b205a0
145b1f569 90 nop 
145b1f56a 488dbe38100000 lea rdi, [rsi + 0x1038]
145b1f571 48837db0ff cmp qword ptr [rbp - 0x50], -1
145b1f576 7451 je 0x145b1f5c9
145b1f578 488d5d50 lea rbx, [rbp + 0x50]
145b1f57c 488d55b0 lea rdx, [rbp - 0x50]
145b1f580 41b8a0000000 mov r8d, 0xa0
145b1f586 4889d9 mov rcx, rbx
145b1f589 e89db84800 call 0x145faae2b
145b1f58e 90 nop 
145b1f58f 488d8de0010000 lea rcx, [rbp + 0x1e0]
145b1f596 4889fa mov rdx, rdi
145b1f599 4989d8 mov r8, rbx
145b1f59c e84f0b0200 call 0x145b400f0
145b1f5a1 90 nop 
145b1f5a2 488d4db0 lea rcx, [rbp - 0x50]
145b1f5a6 e8e5e6fdff call 0x145afdc90
145b1f5ab 0f1085e0010000 movups xmm0, xmmword ptr [rbp + 0x1e0]
145b1f5b2 0f298500020000 movaps xmmword ptr [rbp + 0x200], xmm0
145b1f5b9 488b85f0010000 mov rax, qword ptr [rbp + 0x1f0]
145b1f5c0 48898510020000 mov qword ptr [rbp + 0x210], rax
145b1f5c7 eb21 jmp 0x145b1f5ea
145b1f5c9 48c7850002000000000000 mov qword ptr [rbp + 0x200], 0
145b1f5d4 48c7850802000008000000 mov qword ptr [rbp + 0x208], 8
145b1f5df 48c7851002000000000000 mov qword ptr [rbp + 0x210], 0
145b1f5ea c6852f02000001 mov byte ptr [rbp + 0x22f], 1
145b1f5f1 e8fa904300 call 0x145f586f0
145b1f5f6 90 nop 
145b1f5f7 8945b0 mov dword ptr [rbp - 0x50], eax
145b1f5fa 8955b4 mov dword ptr [rbp - 0x4c], edx
145b1f5fd c6852f02000001 mov byte ptr [rbp + 0x22f], 1
145b1f604 488d4d50 lea rcx, [rbp + 0x50]
145b1f608 488d55b0 lea rdx, [rbp - 0x50]
145b1f60c 41b800803ed5 mov r8d, 0xd53e8000
145b1f612 41b9deb19d01 mov r9d, 0x19db1de
145b1f618 e883904300 call 0x145f586a0
145b1f61d 90 nop 
145b1f61e 807d5000 cmp byte ptr [rbp + 0x50], 0
145b1f622 7506 jne 0x145b1f62a
145b1f624 4c8b4d58 mov r9, qword ptr [rbp + 0x58]
145b1f628 eb03 jmp 0x145b1f62d
145b1f62a 4531c9 xor r9d, r9d
145b1f62d c6852f02000001 mov byte ptr [rbp + 0x22f], 1
145b1f634 488d4d50 lea rcx, [rbp + 0x50]
145b1f638 41b801000000 mov r8d, 1
145b1f63e 4889fa mov rdx, rdi
145b1f641 e8da150200 call 0x145b40c20
145b1f646 90 nop 
145b1f647 4c8b7d50 mov r15, qword ptr [rbp + 0x50]
145b1f64b 4c8b6558 mov r12, qword ptr [rbp + 0x58]
145b1f64f 488b5d60 mov rbx, qword ptr [rbp + 0x60]
145b1f653 488b8500020000 mov rax, qword ptr [rbp + 0x200]
145b1f65a 4c8bb510020000 mov r14, qword ptr [rbp + 0x210]
145b1f661 4c29f0 sub rax, r14
145b1f664 4839c3 cmp rbx, rax
145b1f667 0f8790000000 ja 0x145b1f6fd
145b1f66d 4885db test rbx, rbx
145b1f670 741f je 0x145b1f691
145b1f672 4c8d04dd00000000 lea r8, [rbx*8]
145b1f67a 4a8d0cf500000000 lea rcx, [r14*8]
145b1f682 48038d08020000 add rcx, qword ptr [rbp + 0x208]
145b1f689 4c89e2 mov rdx, r12
145b1f68c e89ab74800 call 0x145faae2b
145b1f691 4901de add r14, rbx
145b1f694 4c89b510020000 mov qword ptr [rbp + 0x210], r14
145b1f69b 4d85ff test r15, r15
145b1f69e 7415 je 0x145b1f6b5
145b1f6a0 49c1e703 shl r15, 3
145b1f6a4 41b808000000 mov r8d, 8
145b1f6aa 4c89e1 mov rcx, r12
145b1f6ad 4c89fa mov rdx, r15
145b1f6b0 e81b2b4efa call 0x1400021d0
145b1f6b5 c6852f02000001 mov byte ptr [rbp + 0x22f], 1
145b1f6bc 4889f9 mov rcx, rdi
145b1f6bf e8cc29f7ff call 0x145a92090
145b1f6c4 90 nop 
145b1f6c5 c6852f02000000 mov byte ptr [rbp + 0x22f], 0
145b1f6cc 488d9500020000 lea rdx, [rbp + 0x200]
145b1f6d3 4889f1 mov rcx, rsi
145b1f6d6 e8d5e2ffff call 0x145b1d9b0
145b1f6db 90 nop 
145b1f6dc 488d8d18010000 lea rcx, [rbp + 0x118]
145b1f6e3 e878e6f7ff call 0x145a9dd60
145b1f6e8 90 nop 
145b1f6e9 4881c4b8020000 add rsp, 0x2b8
145b1f6f0 5b pop rbx
145b1f6f1 5f pop rdi
145b1f6f2 5e pop rsi
145b1f6f3 415c pop r12
145b1f6f5 415d pop r13
145b1f6f7 415e pop r14
145b1f6f9 415f pop r15
145b1f6fb 5d pop rbp
145b1f6fc c3 ret 
145b1f6fd 4c89a5f8010000 mov qword ptr [rbp + 0x1f8], r12
145b1f704 4c89bd20020000 mov qword ptr [rbp + 0x220], r15
145b1f70b 48c744242008000000 mov qword ptr [rsp + 0x20], 8
145b1f714 488d8d00020000 lea rcx, [rbp + 0x200]
145b1f71b 41b908000000 mov r9d, 8
145b1f721 4c89f2 mov rdx, r14
145b1f724 4989d8 mov r8, rbx
145b1f727 e814bb4800 call 0x145fab240
145b1f72c 90 nop 
145b1f72d 4c8bb510020000 mov r14, qword ptr [rbp + 0x210]
145b1f734 4c8bbd20020000 mov r15, qword ptr [rbp + 0x220]
145b1f73b 4c8ba5f8010000 mov r12, qword ptr [rbp + 0x1f8]
145b1f742 e92bffffff jmp 0x145b1f672
