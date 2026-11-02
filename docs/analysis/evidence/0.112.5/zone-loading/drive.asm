140971f30 push rbp
140971f31 push r15
140971f33 push r14
140971f35 push r13
140971f37 push r12
140971f39 push rsi
140971f3a push rdi
140971f3b push rbx
140971f3c sub rsp, 0x538
140971f43 lea rbp, [rsp + 0x80]
140971f4b movaps xmmword ptr [rbp + 0x4a0], xmm6
140971f52 mov qword ptr [rbp + 0x498], 0xfffffffffffffffe
140971f5d movups xmm0, xmmword ptr [rdx]
140971f60 movups xmm1, xmmword ptr [rdx + 0x10]
140971f64 movaps xmmword ptr [rbp - 0x30], xmm1
140971f68 movaps xmmword ptr [rbp - 0x40], xmm0
140971f6c movups xmm0, xmmword ptr [r8]
140971f70 movups xmm1, xmmword ptr [r8 + 0x10]
140971f75 movups xmm2, xmmword ptr [r8 + 0x20]
140971f7a movups xmm3, xmmword ptr [r8 + 0x30]
140971f7f mov rdx, qword ptr [rbp + 0x580]
140971f86 movaps xmmword ptr [rbp + 0x10], xmm3
140971f8a movaps xmmword ptr [rbp], xmm2
140971f8e movups xmm2, xmmword ptr [r9]
140971f92 movups xmm3, xmmword ptr [r9 + 0x10]
140971f97 mov rax, qword ptr [rbp + 0x520]
140971f9e movaps xmmword ptr [rbp - 0x10], xmm1
140971fa2 movaps xmmword ptr [rbp - 0x20], xmm0
140971fa6 movups xmm0, xmmword ptr [rax]
140971fa9 movups xmm1, xmmword ptr [rax + 0x10]
140971fad mov rax, qword ptr [rbp + 0x528]
140971fb4 movaps xmmword ptr [rbp + 0xf0], xmm3
140971fbb movaps xmmword ptr [rbp + 0xe0], xmm2
140971fc2 movups xmm2, xmmword ptr [rax]
140971fc5 movups xmm3, xmmword ptr [rax + 0x10]
140971fc9 mov rax, qword ptr [rbp + 0x530]
140971fd0 movaps xmmword ptr [rbp + 0x110], xmm1
140971fd7 movaps xmmword ptr [rbp + 0x100], xmm0
140971fde movups xmm0, xmmword ptr [rax]
140971fe1 movups xmm1, xmmword ptr [rax + 0x10]
140971fe5 mov rax, qword ptr [rbp + 0x538]
140971fec movaps xmmword ptr [rbp + 0x120], xmm2
140971ff3 movaps xmmword ptr [rbp + 0x130], xmm3
140971ffa movups xmm2, xmmword ptr [rax]
140971ffd movups xmm3, xmmword ptr [rax + 0x10]
140972001 mov rax, qword ptr [rbp + 0x540]
140972008 movaps xmmword ptr [rbp + 0x140], xmm0
14097200f movaps xmmword ptr [rbp + 0x150], xmm1
140972016 movaps xmmword ptr [rbp + 0x20], xmm2
14097201a movaps xmmword ptr [rbp + 0x30], xmm3
14097201e movups xmm0, xmmword ptr [rax]
140972021 mov rax, qword ptr [rax + 0x10]
140972025 mov qword ptr [rbp + 0x50], rax
140972029 mov rax, qword ptr [rbp + 0x548]
140972030 movaps xmmword ptr [rbp + 0x40], xmm0
140972034 movups xmm0, xmmword ptr [rax]
140972037 mov rax, qword ptr [rax + 0x10]
14097203b mov qword ptr [rbp + 0x68], rax
14097203f mov rax, qword ptr [rbp + 0x550]
140972046 movups xmmword ptr [rbp + 0x58], xmm0
14097204a movups xmm0, xmmword ptr [rax]
14097204d mov rax, qword ptr [rax + 0x10]
140972051 mov qword ptr [rbp + 0x80], rax
140972058 mov rax, qword ptr [rbp + 0x558]
14097205f movaps xmmword ptr [rbp + 0x70], xmm0
140972063 movups xmm0, xmmword ptr [rax]
140972066 mov rax, qword ptr [rax + 0x10]
14097206a mov qword ptr [rbp + 0x98], rax
140972071 mov rax, qword ptr [rbp + 0x560]
140972078 movups xmm1, xmmword ptr [rax]
14097207b movups xmm2, xmmword ptr [rax + 0x10]
14097207f mov rax, qword ptr [rbp + 0x568]
140972086 movups xmmword ptr [rbp + 0x88], xmm0
14097208d movups xmm0, xmmword ptr [rax]
140972090 movups xmm3, xmmword ptr [rax + 0x10]
140972094 mov rax, qword ptr [rbp + 0x570]
14097209b movaps xmmword ptr [rbp + 0x170], xmm2
1409720a2 movaps xmmword ptr [rbp + 0x160], xmm1
1409720a9 movups xmm1, xmmword ptr [rax]
1409720ac movups xmm2, xmmword ptr [rax + 0x10]
1409720b0 mov rax, qword ptr [rbp + 0x578]
1409720b7 movaps xmmword ptr [rbp + 0xa0], xmm0
1409720be movaps xmmword ptr [rbp + 0xb0], xmm3
1409720c5 movaps xmmword ptr [rbp + 0xc0], xmm1
1409720cc movaps xmmword ptr [rbp + 0xd0], xmm2
1409720d3 movups xmm0, xmmword ptr [rax]
1409720d6 movups xmm1, xmmword ptr [rax + 0x10]
1409720da movaps xmmword ptr [rbp + 0x180], xmm0
1409720e1 movaps xmmword ptr [rbp + 0x190], xmm1
1409720e8 lea rcx, [rbp + 0x1a0]
1409720ef mov r8d, 0x150
1409720f5 call 0x145c1d4fb
1409720fa mov rax, qword ptr [rbp + 0xe0]
140972101 mov r8, qword ptr [rbp + 0x160]
140972108 test rax, rax
14097210b je 0x140972121
14097210d mov eax, dword ptr [rax]
14097210f mov dword ptr [rbp + 0x3e4], eax
140972115 mov dword ptr [rbp + 0x444], 1
14097211f jmp 0x14097212b
140972121 mov dword ptr [rbp + 0x444], 0
14097212b mov rdx, qword ptr [rbp + 0xa0]
140972132 mov rax, qword ptr [rbp + 0x1c0]
140972139 mov rcx, qword ptr [rbp + 0x1c8]
140972140 test r8, r8
140972143 je 0x14097214f
140972145 movzx r8d, byte ptr [r8 + 0xeb]
14097214d jmp 0x140972152
14097214f xor r8d, r8d
140972152 mov r9, qword ptr [rbp + 0x1a0]
140972159 mov qword ptr [rbp + 0x488], r9
140972160 mov r12, qword ptr [rbp + 0x1e8]
140972167 mov r14, qword ptr [rbp + 0x1f0]
14097216e mov r9, qword ptr [rbp + 0x210]
140972175 mov qword ptr [rbp + 0x320], r9
14097217c mov r9, qword ptr [rbp + 0x218]
140972183 mov qword ptr [rbp + 0x328], r9
14097218a movss xmm6, dword ptr [rdx + 0x8c]
140972192 mov byte ptr [rbp + 0x497], r8b
140972199 mov rdx, qword ptr [rax]
14097219c xor r11d, r11d
14097219f mov r8, rdx
1409721a2 sub r8, qword ptr [rcx + 0x18]
1409721a6 cmovb r8, r11
1409721aa sub rdx, qword ptr [rcx + 0x38]
1409721ae cmovb rdx, r11
1409721b2 mov r10, qword ptr [rcx + 0x10]
1409721b6 mov r9, qword ptr [rcx + 0x30]
1409721ba mov rsi, r10
1409721bd sub rsi, r8
1409721c0 cmovb rsi, r11
1409721c4 mov rdi, r9
1409721c7 sub rdi, rdx
1409721ca cmovb rdi, r11
1409721ce mov r11, qword ptr [rbp + 0x238]
1409721d5 mov qword ptr [rbp + 0x3e8], r11
1409721dc add rdi, rsi
1409721df mov r11, qword ptr [rbp + 0x240]
1409721e6 mov qword ptr [rbp + 0x2f8], r11
1409721ed mov r11, qword ptr [rcx + 0x40]
1409721f1 sub r11, rdi
1409721f4 mov rcx, qword ptr [rbp + 0x260]
1409721fb mov qword ptr [rbp + 0x310], rcx
140972202 mov rcx, qword ptr [rbp + 0x268]
140972209 mov qword ptr [rbp + 0x318], rcx
140972210 mov rcx, qword ptr [rbp + 0x288]
140972217 mov qword ptr [rbp + 0x300], rcx
14097221e mov rcx, qword ptr [rbp + 0x290]
140972225 mov qword ptr [rbp + 0x308], rcx
14097222c mov rsi, qword ptr [rbp + 0x2b0]
140972233 mov r13, qword ptr [rbp + 0x2c0]
14097223a mov r15d, dword ptr [rbp + 0x2c8]
140972241 mov edi, dword ptr [rbp + 0x2cc]
140972247 mov rcx, qword ptr [rbp + 0x2d0]
14097224e mov qword ptr [rax], r11
140972251 cmp r10, r8
140972254 ja 0x14097225f
140972256 cmp r9, rdx
140972259 jbe 0x140972303
14097225f inc r11
140972262 mov qword ptr [rax], r11
140972265 mov rax, qword ptr [rbp + 0x488]
14097226c cmp byte ptr [rax], 2
14097226f je 0x140972303
140972275 xor eax, eax
140972277 test rcx, rcx
14097227a je 0x1409722c5
14097227c cmp dword ptr [rcx], 1
14097227f jne 0x1409722c5
140972281 mov rdx, qword ptr [rcx + 8]
140972285 imul r8, qword ptr [rcx + 0x20], 0xe8
14097228d mov rcx, qword ptr [rcx + 0x18]
140972291 xor eax, eax
140972293 xor r9d, r9d
140972296 mov r10, rcx
140972299 nop dword ptr [rax]
1409722a0 cmp r8, r9
1409722a3 je 0x1409722c5
1409722a5 add r9, 0xe8
1409722ac cmp qword ptr [r10 + 0x18], rdx
1409722b0 lea r10, [r10 + 0xe8]
1409722b7 jne 0x1409722a0
1409722b9 mov edx, dword ptr [rcx + r9 - 0x2c]
1409722be mov eax, 1
1409722c3 jmp 0x1409722c5
1409722c5 mov ebx, dword ptr [rbp - 0x24]
1409722c8 mov rcx, qword ptr [rbp - 0x30]
1409722cc mov dword ptr [rcx], ebx
1409722ce mov rcx, qword ptr [rbp - 0x40]
1409722d2 movss dword ptr [rsp + 0x30], xmm6
1409722d8 mov dword ptr [rsp + 0x28], edx
1409722dc mov dword ptr [rsp + 0x20], eax
1409722e0 lea rdx, [rip + 0x5597fd3]
1409722e7 mov r8d, 0xb
1409722ed mov r9b, 1
1409722f0 call 0x14093fd70
1409722f5 mov rax, qword ptr [rbp - 0x30]
1409722f9 mov dword ptr [rax], ebx
1409722fb mov rax, qword ptr [rbp - 0x40]
1409722ff mov byte ptr [rax + 0x4d], 0
140972303 test rsi, rsi
140972306 je 0x140972379
140972308 mov eax, edi
14097230a sub eax, dword ptr [r13]
14097230e sub edi, r15d
140972311 cmp edi, 0xc233b000
140972317 mov ecx, 0xc233b000
14097231c cmovb ecx, edi
14097231f cmp eax, ecx
140972321 jae 0x140972379
140972323 mov eax, dword ptr [rsi]
140972325 cmp eax, 2
140972328 je 0x140972368
14097232a cmp eax, 1
14097232d je 0x140972379
14097232f mov eax, dword ptr [rbp - 0x24]
140972332 mov rcx, qword ptr [rbp - 0x30]
140972336 mov dword ptr [rcx], eax
140972338 mov rcx, qword ptr [rbp - 0x40]
14097233c mov eax, dword ptr [rsi + 8]
14097233f movss dword ptr [rsp + 0x30], xmm6
140972345 mov dword ptr [rsp + 0x28], eax
140972349 mov dword ptr [rsp + 0x20], 1
140972351 lea rdx, [rip + 0x5597f6d]
140972358 mov r8d, 0x10
14097235e mov r9b, 1
140972361 call 0x14093fd70
140972366 jmp 0x140972379
140972368 mov eax, dword ptr [rbp - 0x24]
14097236b mov rcx, qword ptr [rbp - 0x30]
14097236f mov dword ptr [rcx], eax
140972371 mov rax, qword ptr [rbp - 0x40]
140972375 mov byte ptr [rax + 0x49], 0
140972379 mov r8, qword ptr [r12]
14097237d xor edx, edx
14097237f mov rcx, r8
140972382 sub rcx, qword ptr [r14 + 0x18]
140972386 cmovb rcx, rdx
14097238a sub r8, qword ptr [r14 + 0x38]
14097238e cmovb r8, rdx
140972392 lea rax, [rcx + rcx*4]
140972396 shl rax, 3
14097239a add rax, qword ptr [r14 + 8]
14097239e mov r9, qword ptr [r14 + 0x10]
1409723a2 mov r10, qword ptr [r14 + 0x30]
1409723a6 sub r9, rcx
1409723a9 cmovb r9, rdx
1409723ad mov r11d, 8
1409723b3 cmovb rax, r11
1409723b7 lea rcx, [r8 + r8*4]
1409723bb shl rcx, 3
1409723bf add rcx, qword ptr [r14 + 0x28]
1409723c3 sub r10, r8
1409723c6 cmovb rcx, r11
1409723ca cmovb r10, rdx
1409723ce mov rdx, qword ptr [r14 + 0x40]
1409723d2 sub rdx, r10
1409723d5 sub rdx, r9
1409723d8 mov qword ptr [r12], rdx
1409723dc lea rdx, [r9 + r9*4]
1409723e0 lea rdi, [rax + rdx*8]
1409723e4 lea rdx, [r10 + r10*4]
1409723e8 lea rsi, [rcx + rdx*8]
1409723ec lea r14, [rip + 0x559808d]
1409723f3 jmp 0x14097240a
1409723f5 test eax, eax
1409723f7 jne 0x140972592
1409723fd nop dword ptr [rax]
140972400 mov byte ptr [rbx + 0x49], 0
140972404 mov rcx, r15
140972407 mov rax, r13
14097240a test rax, rax
14097240d je 0x140972420
14097240f cmp rax, rdi
140972412 je 0x140972420
140972414 lea r13, [rax + 0x28]
140972418 mov r15, rcx
14097241b jmp 0x14097243c
14097241d nop dword ptr [rax]
140972420 test rcx, rcx
140972423 je 0x1409725ad
140972429 cmp rcx, rsi
14097242c je 0x1409725ad
140972432 lea r15, [rcx + 0x28]
140972436 xor r13d, r13d
140972439 mov rax, rcx
14097243c inc qword ptr [r12]
140972440 mov ecx, dword ptr [rbp - 0x24]
140972443 mov rdx, qword ptr [rbp - 0x30]
140972447 mov dword ptr [rdx], ecx
140972449 mov rbx, qword ptr [rbp - 0x40]
14097244d mov eax, dword ptr [rax + 8]
140972450 cmp byte ptr [rbx + 0x48], 1
140972454 jne 0x140972560
14097245a cmp dword ptr [rbx], 0
14097245d je 0x140972400
14097245f mov ecx, dword ptr [rbx + 4]
140972462 mov dword ptr [rbp + 0x430], ecx
140972468 mov dword ptr [rbp + 0x478], eax
14097246e cmp ecx, eax
140972470 je 0x140972400
140972472 mov rax, qword ptr [rip + 0x773eb2f]
140972479 mov rax, qword ptr [rax]
14097247c cmp rax, 2
140972480 ja 0x140972400
140972486 movzx edx, byte ptr [rip + 0x7706853]
14097248d movzx eax, dl
140972490 lea ecx, [rax - 1]
140972493 cmp ecx, 2
140972496 jae 0x1409723f5
14097249c mov rcx, qword ptr [rip + 0x770682d]
1409724a3 call 0x144c7d510
1409724a8 test al, al
1409724aa je 0x140972400
1409724b0 mov rcx, qword ptr [rip + 0x7706819]
1409724b7 lea rax, [rcx + 0x30]
1409724bb lea rdx, [rbp + 0x478]
1409724c2 mov qword ptr [rbp + 0x3f0], rdx
1409724c9 lea r8, [rip + 0x528f830]
1409724d0 mov qword ptr [rbp + 0x3f8], r8
1409724d7 lea rdx, [rbp + 0x430]
1409724de mov qword ptr [rbp + 0x400], rdx
1409724e5 mov qword ptr [rbp + 0x408], r8
1409724ec lea rdx, [rip + 0x55962dd]
1409724f3 mov qword ptr [rbp + 0x460], rdx
1409724fa lea rdx, [rbp + 0x3f0]
140972501 mov qword ptr [rbp + 0x468], rdx
140972508 lea rdx, [rbp + 0x460]
14097250f mov qword ptr [rbp + 0x448], rdx
140972516 lea rdx, [rip + 0x5594353]
14097251d mov qword ptr [rbp + 0x450], rdx
140972524 mov qword ptr [rbp + 0x340], 1
14097252f lea rdx, [rbp + 0x448]
140972536 mov qword ptr [rbp + 0x348], rdx
14097253d mov qword ptr [rbp + 0x350], 1
140972548 mov qword ptr [rbp + 0x358], rax
14097254f lea rdx, [rbp + 0x340]
140972556 call 0x144c7ed30
14097255b jmp 0x140972400
140972560 mov rdx, qword ptr [rbp - 0x30]
140972564 mov dword ptr [rdx], ecx
140972566 mov rcx, qword ptr [rbp - 0x40]
14097256a movss dword ptr [rsp + 0x30], xmm6
140972570 mov dword ptr [rsp + 0x28], eax
140972574 mov dword ptr [rsp + 0x20], 1
14097257c mov r8d, 9
140972582 mov rdx, r14
140972585 xor r9d, r9d
140972588 call 0x14093fd70
14097258d jmp 0x140972404
140972592 lea rcx, [rip + 0x7706737]
140972599 call 0x145d6a190
14097259e mov edx, eax
1409725a0 test al, al
1409725a2 jne 0x14097249c
1409725a8 jmp 0x140972400
1409725ad mov rsi, qword ptr [rbp + 0x320]
1409725b4 mov rax, qword ptr [rsi]
1409725b7 xor edx, edx
1409725b9 mov r8, rax
1409725bc mov rdi, qword ptr [rbp + 0x328]
1409725c3 sub r8, qword ptr [rdi + 0x18]
1409725c7 cmovb r8, rdx
1409725cb sub rax, qword ptr [rdi + 0x38]
1409725cf cmovb rax, rdx
1409725d3 mov r9, qword ptr [rdi + 0x10]
1409725d7 mov rcx, qword ptr [rdi + 0x30]
1409725db mov r10, r9
1409725de sub r10, r8
1409725e1 cmovb r10, rdx
1409725e5 mov r11, rcx
1409725e8 sub r11, rax
1409725eb cmovb r11, rdx
1409725ef mov rdx, qword ptr [rdi + 0x40]
1409725f3 add r11, r10
1409725f6 sub rdx, r11
1409725f9 mov qword ptr [rsi], rdx
1409725fc cmp r9, r8
1409725ff ja 0x140972606
140972601 cmp rcx, rax
140972604 jbe 0x14097261d
140972606 inc rdx
140972609 mov qword ptr [rsi], rdx
14097260c mov eax, dword ptr [rbp - 0x24]
14097260f mov rcx, qword ptr [rbp - 0x30]
140972613 mov dword ptr [rcx], eax
140972615 mov rax, qword ptr [rbp - 0x40]
140972619 mov byte ptr [rax + 0x49], 0
14097261d mov r15, qword ptr [rbp + 0x310]
140972624 mov rax, qword ptr [r15]
140972627 xor r8d, r8d
14097262a mov r10, rax
14097262d mov r14, qword ptr [rbp + 0x318]
140972634 sub r10, qword ptr [r14 + 0x18]
140972638 cmovb r10, r8
14097263c sub rax, qword ptr [r14 + 0x38]
140972640 cmovb rax, r8
140972644 lea rdx, [r10 + r10*4]
140972648 shl rdx, 3
14097264c add rdx, qword ptr [r14 + 8]
140972650 mov r11, qword ptr [r14 + 0x10]
140972654 lea rcx, [rax + rax*4]
140972658 shl rcx, 3
14097265c add rcx, qword ptr [r14 + 0x28]
140972660 mov r9, r11
140972663 sub r9, r10
140972666 cmovb r9, r8
14097266a mov rsi, qword ptr [r14 + 0x30]
14097266e mov edi, 8
140972673 cmovb rdx, rdi
140972677 cmovb r10, r11
14097267b mov rbx, rsi
14097267e sub rbx, rax
140972681 cmovb rcx, rdi
140972685 cmovb rbx, r8
140972689 mov r8, qword ptr [r14 + 0x40]
14097268d cmovb rax, rsi
140972691 add rax, r8
140972694 sub r8, rbx
140972697 sub r8, r9
14097269a mov qword ptr [r15], r8
14097269d lea r8, [r9 + r9*4]
1409726a1 lea r8, [rdx + r8*8]
1409726a5 lea r9, [rbx + rbx*4]
1409726a9 lea r9, [rcx + r9*8]
1409726ad add rax, r10
1409726b0 sub rax, rsi
1409726b3 sub rax, r11
1409726b6 inc rax
1409726b9 lea r12, [rbp + 0x58]
1409726bd mov rsi, qword ptr [rbp + 0x3e8]
1409726c4 jmp 0x1409726e3
1409726c6 nop word ptr cs:[rax + rax]
1409726d0 lea r10, [rdx + 0x28]
1409726d4 mov qword ptr [r15], rax
1409726d7 inc rax
1409726da cmp byte ptr [rdx + 0x19], 1
1409726de mov rdx, r10
1409726e1 je 0x140972706
1409726e3 test rdx, rdx
1409726e6 je 0x1409726ed
1409726e8 cmp rdx, r8
1409726eb jne 0x1409726d0
1409726ed xor r14d, r14d
1409726f0 test rcx, rcx
1409726f3 je 0x140972709
1409726f5 cmp rcx, r9
1409726f8 je 0x140972709
1409726fa mov rdx, rcx
1409726fd add rcx, 0x28
140972701 xor r10d, r10d
140972704 jmp 0x1409726d4
140972706 mov r14b, 1
140972709 mov r10, qword ptr [rbp + 0x300]
140972710 mov rcx, qword ptr [r10]
140972713 xor eax, eax
140972715 mov rdx, rcx
140972718 mov r11, qword ptr [rbp + 0x308]
14097271f sub rdx, qword ptr [r11 + 0x18]
140972723 cmovb rdx, rax
140972727 sub rcx, qword ptr [r11 + 0x38]
14097272b cmovb rcx, rax
14097272f mov r8, qword ptr [r11 + 0x30]
140972733 sub r8, rcx
140972736 cmovb r8, rax
14097273a seta cl
14097273d mov r9, qword ptr [r11 + 0x10]
140972741 sub r9, rdx
140972744 cmovb r9, rax
140972748 mov rdx, qword ptr [r11 + 0x40]
14097274c seta bl
14097274f add r9, r8
140972752 sub rdx, r9
140972755 or bl, cl
140972757 movzx ecx, bl
14097275a add rcx, rdx
14097275d mov qword ptr [r10], rcx
140972760 mov rcx, qword ptr [rsi]
140972763 mov r8, rcx
140972766 mov rdi, qword ptr [rbp + 0x2f8]
14097276d sub r8, qword ptr [rdi + 0x18]
140972771 cmovb r8, rax
140972775 sub rcx, qword ptr [rdi + 0x38]
140972779 cmovb rcx, rax
14097277d mov r9, qword ptr [rdi + 0x10]
140972781 mov rdx, qword ptr [rdi + 0x30]
140972785 mov r10, r9
140972788 sub r10, r8
14097278b cmovb r10, rax
14097278f mov r11, rdx
140972792 sub r11, rcx
140972795 cmovb r11, rax
140972799 mov rax, qword ptr [rdi + 0x40]
14097279d add r11, r10
1409727a0 sub rax, r11
1409727a3 mov qword ptr [rsi], rax
1409727a6 cmp r9, r8
1409727a9 ja 0x1409727be
1409727ab cmp rdx, rcx
1409727ae ja 0x1409727be
1409727b0 mov eax, r14d
1409727b3 or al, bl
1409727b5 cmp al, 1
1409727b7 je 0x1409727c4
1409727b9 jmp 0x14097292c
1409727be inc rax
1409727c1 mov qword ptr [rsi], rax
1409727c4 mov eax, dword ptr [rbp - 0x24]
1409727c7 mov rcx, qword ptr [rbp - 0x30]
1409727cb mov dword ptr [rcx], eax
1409727cd mov rcx, qword ptr [rbp - 0x40]
1409727d1 mov byte ptr [rcx + 0x48], 1
1409727d5 mov rcx, qword ptr [rbp - 0x30]
1409727d9 mov dword ptr [rcx], eax
1409727db mov rax, qword ptr [rbp - 0x40]
1409727df mov byte ptr [rax + 0x4b], 1
1409727e3 mov eax, dword ptr [rbp - 0x24]
1409727e6 mov rcx, qword ptr [rbp - 0x30]
1409727ea mov dword ptr [rcx], eax
1409727ec mov rcx, qword ptr [rbp - 0x40]
1409727f0 mov byte ptr [rcx + 0x49], 0
1409727f4 mov rcx, qword ptr [rbp - 0x30]
1409727f8 mov dword ptr [rcx], eax
1409727fa mov rax, qword ptr [rbp - 0x40]
1409727fe mov dword ptr [rax + 0x38], 0
140972805 mov rax, qword ptr [rip + 0x773e79c]
14097280c mov rax, qword ptr [rax]
14097280f cmp rax, 3
140972813 jae 0x14097292c
140972819 movzx edx, byte ptr [rip + 0x7706730]
140972820 movzx eax, dl
140972823 lea ecx, [rax - 1]
140972826 cmp ecx, 2
140972829 jae 0x140972924
14097282f mov rcx, qword ptr [rip + 0x770670a]
140972836 call 0x144c7d510
14097283b test al, al
14097283d je 0x14097292c
140972843 mov rcx, qword ptr [rip + 0x77066f6]
14097284a lea rax, [rcx + 0x30]
14097284e test bl, bl
140972850 mov edx, 0x17
140972855 mov r8d, 6
14097285b cmovne r8, rdx
14097285f lea rdx, [rip + 0x5597a75]
140972866 lea r9, [rip + 0x5597a68]
14097286d cmovne r9, rdx
140972871 lea rdx, [rip + 0x5597a7a]
140972878 test r14b, r14b
14097287b cmove rdx, r9
14097287f mov r9d, 0xc
140972885 cmove r9, r8
140972889 mov qword ptr [rbp + 0x460], rdx
140972890 mov qword ptr [rbp + 0x468], r9
140972897 lea rdx, [rbp + 0x460]
14097289e mov qword ptr [rbp + 0x3f0], rdx
1409728a5 lea rdx, [rip - 0x9707ec]
1409728ac mov qword ptr [rbp + 0x3f8], rdx
1409728b3 lea rdx, [rip + 0x5597a44]
1409728ba mov qword ptr [rbp + 0x448], rdx
1409728c1 lea rdx, [rbp + 0x3f0]
1409728c8 mov qword ptr [rbp + 0x450], rdx
1409728cf lea rdx, [rbp + 0x448]
1409728d6 mov qword ptr [rbp + 0x478], rdx
1409728dd lea rdx, [rip + 0x5593f8c]
1409728e4 mov qword ptr [rbp + 0x480], rdx
1409728eb mov qword ptr [rbp + 0x340], 1
1409728f6 lea rdx, [rbp + 0x478]
1409728fd mov qword ptr [rbp + 0x348], rdx
140972904 mov qword ptr [rbp + 0x350], 1
14097290f mov qword ptr [rbp + 0x358], rax
140972916 lea rdx, [rbp + 0x340]
14097291d call 0x144c7ed30
140972922 jmp 0x14097292c
140972924 test eax, eax
140972926 jne 0x140973854
14097292c mov rax, qword ptr [rbp - 0x40]
140972930 cmp byte ptr [rax + 0x4b], 0
140972934 je 0x14097295d
140972936 mov rcx, qword ptr [rbp + 0x488]
14097293d cmp byte ptr [rcx], 2
140972940 je 0x14097295d
140972942 mov eax, dword ptr [rbp - 0x24]
140972945 mov rcx, qword ptr [rbp - 0x30]
140972949 mov dword ptr [rcx], eax
14097294b mov rax, qword ptr [rbp - 0x40]
14097294f mov byte ptr [rax + 0x48], 0
140972953 mov byte ptr [rax + 0x4d], 1
140972957 mov word ptr [rax + 0x4a], 0
14097295d cmp byte ptr [rax + 0x48], 0
140972961 je 0x140972bae
140972967 cmp byte ptr [rax + 0x4c], 0
14097296b jne 0x140972c30
140972971 mov rsi, qword ptr [rbp - 0x20]
140972975 lea rdi, [rsi + 8]
140972979 mov rcx, qword ptr [rsi + 8]
14097297d test rcx, rcx
140972980 je 0x1409729a6
140972982 cmp qword ptr [rsi], rcx
140972985 jb 0x1409729a6
140972987 cmp byte ptr [rsi + 0x3d], 1
14097298b jne 0x1409729a6
14097298d cmp qword ptr [rsi + 0x10], 0
140972992 jne 0x1409729a6
140972994 cmp qword ptr [rsi + 0x18], 0
140972999 jne 0x1409729a6
14097299b cmp qword ptr [rsi + 0x28], 0
1409729a0 je 0x1409736e7
1409729a6 mov eax, dword ptr [rbp - 0x24]
1409729a9 mov rcx, qword ptr [rbp - 0x30]
1409729ad mov dword ptr [rcx], eax
1409729af mov rcx, qword ptr [rbp - 0x40]
1409729b3 mov dword ptr [rcx + 0x38], 0
1409729ba movaps xmm0, xmm6
1409729bd subss xmm0, dword ptr [rcx + 0x40]
1409729c2 ucomiss xmm0, dword ptr [rip + 0x544f98b]
1409729c9 jbe 0x140972c30
1409729cf movaps xmm0, xmm6
1409729d2 subss xmm0, dword ptr [rcx + 0x44]
1409729d7 ucomiss xmm0, dword ptr [rip + 0x544fb06]
1409729de jb 0x140972c30
1409729e4 mov rcx, qword ptr [rbp - 0x30]
1409729e8 mov dword ptr [rcx], eax
1409729ea mov rax, qword ptr [rbp - 0x40]
1409729ee movss dword ptr [rax + 0x44], xmm6
1409729f3 mov rax, qword ptr [rip + 0x773e5ae]
1409729fa mov rax, qword ptr [rax]
1409729fd cmp rax, 2
140972a01 ja 0x140972c30
140972a07 movzx edx, byte ptr [rip + 0x770655a]
140972a0e movzx eax, dl
140972a11 lea ecx, [rax - 1]
140972a14 cmp ecx, 2
140972a17 jae 0x140972c28
140972a1d mov rcx, qword ptr [rip + 0x7706534]
140972a24 call 0x144c7d510
140972a29 test al, al
140972a2b je 0x140972c30
140972a31 mov rcx, qword ptr [rbp - 0x40]
140972a35 mov rax, qword ptr [rbp + 0xc0]
140972a3c subss xmm6, dword ptr [rcx + 0x40]
140972a41 movss dword ptr [rbp + 0x478], xmm6
140972a49 movzx eax, byte ptr [rax + 0x78]
140972a4d lea rdx, [rbp + 0x478]
140972a54 mov qword ptr [rbp + 0x340], rdx
140972a5b lea rdx, [rip + 0x528e59e]
140972a62 mov qword ptr [rbp + 0x348], rdx
140972a69 mov qword ptr [rbp + 0x350], rsi
140972a70 lea rdx, [rip + 0x5290179]
140972a77 mov qword ptr [rbp + 0x358], rdx
140972a7e mov qword ptr [rbp + 0x360], rdi
140972a85 lea r8, [rsi + 0x20]
140972a89 mov qword ptr [rbp + 0x368], rdx
140972a90 mov qword ptr [rbp + 0x370], r8
140972a97 lea r8, [rsi + 0x10]
140972a9b mov qword ptr [rbp + 0x378], rdx
140972aa2 mov qword ptr [rbp + 0x380], r8
140972aa9 lea r8, [rsi + 0x18]
140972aad mov qword ptr [rbp + 0x388], rdx
140972ab4 mov qword ptr [rbp + 0x390], r8
140972abb add rcx, 0x49
140972abf mov qword ptr [rbp + 0x398], rdx
140972ac6 mov qword ptr [rbp + 0x3a0], rcx
140972acd lea rcx, [rip + 0x529025c]
140972ad4 mov qword ptr [rbp + 0x3a8], rcx
140972adb lea rdx, [rbp + 0x497]
140972ae2 mov qword ptr [rbp + 0x3b0], rdx
140972ae9 mov qword ptr [rbp + 0x3b8], rcx
140972af0 lea rdx, [rbp + 0x330]
140972af7 mov qword ptr [rbp + 0x3c0], rdx
140972afe mov qword ptr [rbp + 0x3c8], rcx
140972b05 lea rdx, [rbp + 0x430]
140972b0c mov qword ptr [rbp + 0x3d0], rdx
140972b13 mov qword ptr [rbp + 0x3d8], rcx
140972b1a lea rcx, [rip + 0x5597843]
140972b21 mov qword ptr [rbp + 0x460], rcx
140972b28 lea rcx, [rbp + 0x340]
140972b2f mov qword ptr [rbp + 0x468], rcx
140972b36 mov rcx, qword ptr [rip + 0x770641b]
140972b3d mov qword ptr [rbp + 0x3f0], 1
140972b48 lea rdx, [rbp + 0x448]
140972b4f mov qword ptr [rbp + 0x3f8], rdx
140972b56 lea rdx, [rcx + 0x30]
140972b5a cmp qword ptr [rbp + 0x180], 0
140972b62 setne byte ptr [rbp + 0x430]
140972b69 mov qword ptr [rbp + 0x400], 1
140972b74 mov qword ptr [rbp + 0x408], rdx
140972b7b mov byte ptr [rbp + 0x330], al
140972b81 lea rax, [rbp + 0x460]
140972b88 mov qword ptr [rbp + 0x448], rax
140972b8f lea rax, [rip + 0x5593cda]
140972b96 mov qword ptr [rbp + 0x450], rax
140972b9d lea rdx, [rbp + 0x3f0]
140972ba4 call 0x144c7ed30
140972ba9 jmp 0x140972c30
140972bae mov rax, qword ptr [rbp - 0x20]
140972bb2 cmp byte ptr [rax + 0x3c], 0
140972bb6 jne 0x140972c30
140972bb8 mov rax, qword ptr [rbp]
140972bbc cmp byte ptr [rax + 0x24], 1
140972bc0 jne 0x140972c30
140972bc2 cmp dword ptr [rax], 0
140972bc5 je 0x140972c30
140972bc7 cmp byte ptr [rbp + 0x497], 0
140972bce jne 0x140972c30
140972bd0 mov rax, qword ptr [rbp + 0x488]
140972bd7 cmp byte ptr [rax], 2
140972bda jne 0x140972c30
140972bdc mov eax, dword ptr [rbp - 0x24]
140972bdf mov rcx, qword ptr [rbp - 0x30]
140972be3 mov dword ptr [rcx], eax
140972be5 mov rcx, qword ptr [rbp - 0x40]
140972be9 movss dword ptr [rsp + 0x30], xmm6
140972bef mov eax, dword ptr [rbp + 0x3e4]
140972bf5 mov dword ptr [rsp + 0x28], eax
140972bf9 mov eax, dword ptr [rbp + 0x444]
140972bff mov dword ptr [rsp + 0x20], eax
140972c03 lea rdx, [rip + 0x5597713]
140972c0a mov r8d, 0x12
140972c10 xor r9d, r9d
140972c13 call 0x14093fd70
140972c18 mov rax, qword ptr [rbp - 0x40]
140972c1c cmp byte ptr [rax + 0x48], 0
140972c20 jne 0x140972967
140972c26 jmp 0x140972c30
140972c28 test eax, eax
140972c2a jne 0x1409738a3
140972c30 mov r11, qword ptr [rbp + 0x40]
140972c34 mov rax, qword ptr [rbp + 0x48]
140972c38 mov rdx, qword ptr [r11 + 0xf8]
140972c3f mov r8, qword ptr [r11 + 0x100]
140972c46 movzx r9d, byte ptr [r11 + 0x108]
140972c4e lea rsi, [r8*4]
140972c56 mov rcx, rdx
140972c59 test r9b, r9b
140972c5c je 0x140972cc0
140972c5e nop
140972c60 test rsi, rsi
140972c63 je 0x140972d85
140972c69 mov r10d, dword ptr [rcx]
140972c6c add rcx, 4
140972c70 mov rdi, qword ptr [rax + 0x1a8]
140972c77 lea rbx, [r10 + r10*8]
140972c7b mov r10, qword ptr [rdi + rbx*8 + 0x10]
140972c80 add rsi, -4
140972c84 test r10, r10
140972c87 je 0x140972c60
140972c89 lea rsi, [rdi + rbx*8]
140972c8d mov r11, qword ptr [r11 + 0x110]
140972c94 mov rdi, qword ptr [rsi + 0x18]
140972c98 mov rsi, qword ptr [rsi + 0x38]
140972c9c mov r11, qword ptr [rsi + r11*8]
140972ca0 not r11
140972ca3 lea r11, [r11 + r11*2]
140972ca7 shl r11, 4
140972cab mov rsi, qword ptr [rdi + r11 + 0x10]
140972cb0 mov r11, qword ptr [rdi + r11 + 0x28]
140972cb5 jmp 0x140972d3d
140972cba nop word ptr [rax + rax]
140972cc0 test rsi, rsi
140972cc3 je 0x140972d85
140972cc9 mov r10d, dword ptr [rcx]
140972ccc add rcx, 4
140972cd0 mov rdi, qword ptr [rax + 0x108]
140972cd7 lea rbx, [r10 + r10*4]
140972cdb shl rbx, 5
140972cdf mov r10, qword ptr [rdi + rbx + 0x58]
140972ce4 add rsi, -4
140972ce8 test r10, r10
140972ceb je 0x140972cc0
140972ced add rdi, rbx
140972cf0 mov esi, dword ptr [rdi + 0x94]
140972cf6 mov rbx, qword ptr [rax + 0x1a8]
140972cfd lea rsi, [rsi + rsi*8]
140972d01 mov r11, qword ptr [r11 + 0x110]
140972d08 mov r14, qword ptr [rbx + rsi*8 + 0x18]
140972d0d mov rsi, qword ptr [rbx + rsi*8 + 0x38]
140972d12 mov rsi, qword ptr [rsi + r11*8]
140972d16 not rsi
140972d19 mov r11, qword ptr [rdi + 0x50]
140972d1d mov r11d, dword ptr [r11 + 8]
140972d21 lea rdi, [rsi + rsi*2]
140972d25 shl rdi, 4
140972d29 not r11d
140972d2c mov rsi, qword ptr [r14 + rdi + 0x10]
140972d31 add rsi, r11
140972d34 shl r11, 2
140972d38 add r11, qword ptr [r14 + rdi + 0x28]
140972d3d mov ebx, 1
140972d42 mov edi, dword ptr [rbp + 0x54]
140972d45 lea rdx, [rdx + r8*4]
140972d49 test r9b, r9b
140972d4c jne 0x140972d98
140972d4e cmp ebx, r10d
140972d51 jne 0x140972dd5
140972d57 nop word ptr [rax + rax]
140972d60 cmp rcx, rdx
140972d63 je 0x140972dc1
140972d65 mov r8d, dword ptr [rcx]
140972d68 add rcx, 4
140972d6c mov r9, qword ptr [rax + 0x108]
140972d73 lea r8, [r8 + r8*4]
140972d77 shl r8, 5
140972d7b cmp qword ptr [r9 + r8 + 0x58], 0
140972d81 je 0x140972d60
140972d83 jmp 0x140972dd5
140972d85 xor r10d, r10d
140972d88 xor ebx, ebx
140972d8a xor esi, esi
140972d8c mov edi, dword ptr [rbp + 0x54]
140972d8f lea rdx, [rdx + r8*4]
140972d93 test r9b, r9b
140972d96 je 0x140972d4e
140972d98 cmp ebx, r10d
140972d9b jne 0x140972dd5
140972d9d nop dword ptr [rax]
140972da0 cmp rcx, rdx
140972da3 je 0x140972dc1
140972da5 mov r8d, dword ptr [rcx]
140972da8 add rcx, 4
140972dac mov r9, qword ptr [rax + 0x1a8]
140972db3 lea r8, [r8 + r8*8]
140972db7 cmp qword ptr [r9 + r8*8 + 0x10], 0
140972dbd je 0x140972da0
140972dbf jmp 0x140972dd5
140972dc1 test rsi, rsi
140972dc4 je 0x140972dd5
140972dc6 mov rax, qword ptr [rbp - 0x40]
140972dca movzx eax, byte ptr [rax + 0x48]
140972dce inc al
140972dd0 mov dword ptr [r11], edi
140972dd3 mov byte ptr [rsi], al
140972dd5 mov rax, qword ptr [rbp - 0x40]
140972dd9 movzx ebx, byte ptr [rax + 0x4b]
140972ddd lea rcx, [rbp + 0x340]
140972de4 mov rdx, r12
140972de7 call 0x1409400e0
140972dec cmp qword ptr [rbp + 0x340], 0
140972df4 je 0x140972e12
140972df6 mov rax, qword ptr [rbp + 0x360]
140972dfd cmp byte ptr [rax], bl
140972dff je 0x140972e12
140972e01 mov ecx, dword ptr [rbp + 0x37c]
140972e07 mov rdx, qword ptr [rbp + 0x370]
140972e0e mov dword ptr [rdx], ecx
140972e10 mov byte ptr [rax], bl
140972e12 mov rax, qword ptr [rbp + 0x88]
140972e19 mov rcx, qword ptr [rbp + 0x90]
140972e20 mov edx, dword ptr [rbp + 0x9c]
140972e26 mov r8, qword ptr [rax + 0xf8]
140972e2d mov r9, qword ptr [rax + 0x100]
140972e34 lea r9, [r8 + r9*4]
140972e38 cmp byte ptr [rax + 0x108], 0
140972e3f je 0x140972eb8
140972e41 xor r10d, r10d
140972e44 xor esi, esi
140972e46 xor edi, edi
140972e48 cmp edi, r10d
140972e4b jne 0x140972ea3
140972e4d nop dword ptr [rax]
140972e50 cmp r8, r9
140972e53 je 0x140972f68
140972e59 mov r10d, dword ptr [r8]
140972e5c add r8, 4
140972e60 mov r11, qword ptr [rcx + 0x1a8]
140972e67 lea rsi, [r10 + r10*8]
140972e6b mov r10, qword ptr [r11 + rsi*8 + 0x10]
140972e70 test r10, r10
140972e73 je 0x140972e50
140972e75 lea r11, [r11 + rsi*8]
140972e79 mov rsi, qword ptr [rax + 0x110]
140972e80 mov rdi, qword ptr [r11 + 0x18]
140972e84 mov r11, qword ptr [r11 + 0x38]
140972e88 mov r11, qword ptr [r11 + rsi*8]
140972e8c not r11
140972e8f lea r11, [r11 + r11*2]
140972e93 shl r11, 4
140972e97 mov rsi, qword ptr [rdi + r11 + 0x10]
140972e9c mov r11, qword ptr [rdi + r11 + 0x28]
140972ea1 xor edi, edi
140972ea3 mov r14d, edi
140972ea6 inc edi
140972ea8 cmp byte ptr [rsi + r14], bl
140972eac je 0x140972e48
140972eae mov dword ptr [r11 + r14*4], edx
140972eb2 mov byte ptr [rsi + r14], bl
140972eb6 jmp 0x140972e48
140972eb8 xor r10d, r10d
140972ebb mov r11d, 8
140972ec1 xor edi, edi
140972ec3 xor r14d, r14d
140972ec6 cmp r14d, r10d
140972ec9 jne 0x140972f3f
140972ecb nop dword ptr [rax + rax]
140972ed0 cmp r8, r9
140972ed3 je 0x140972f68
140972ed9 mov r10d, dword ptr [r8]
140972edc add r8, 4
140972ee0 mov r11, qword ptr [rcx + 0x108]
140972ee7 lea rsi, [r10 + r10*4]
140972eeb shl rsi, 5
140972eef mov r10, qword ptr [r11 + rsi + 0x58]
140972ef4 test r10, r10
140972ef7 je 0x140972ed0
140972ef9 add r11, rsi
140972efc mov esi, dword ptr [r11 + 0x94]
140972f03 mov rdi, qword ptr [rcx + 0x1a8]
140972f0a lea rsi, [rsi + rsi*8]
140972f0e mov r14, qword ptr [rax + 0x110]
140972f15 mov r15, qword ptr [rdi + rsi*8 + 0x18]
140972f1a mov rsi, qword ptr [rdi + rsi*8 + 0x38]
140972f1f mov rsi, qword ptr [rsi + r14*8]
140972f23 not rsi
140972f26 lea rsi, [rsi + rsi*2]
140972f2a shl rsi, 4
140972f2e mov rdi, qword ptr [r15 + rsi + 0x10]
140972f33 mov rsi, qword ptr [r15 + rsi + 0x28]
140972f38 mov r11, qword ptr [r11 + 0x50]
140972f3c xor r14d, r14d
140972f3f mov r15d, r14d
140972f42 shl r15, 4
140972f46 inc r14d
140972f49 mov r15d, dword ptr [r11 + r15 + 8]
140972f4e not r15d
140972f51 cmp byte ptr [rdi + r15], bl
140972f55 je 0x140972ec6
140972f5b mov dword ptr [rsi + r15*4], edx
140972f5f mov byte ptr [rdi + r15], bl
140972f63 jmp 0x140972ec6
140972f68 mov rsi, qword ptr [rbp - 0x40]
140972f6c cmp byte ptr [rsi + 0x48], 1
140972f70 jne 0x140972f78
140972f72 cmp byte ptr [rsi + 0x4b], 0
140972f76 je 0x140972f93
140972f78 movaps xmm6, xmmword ptr [rbp + 0x4a0]
140972f7f add rsp, 0x538
140972f86 pop rbx
140972f87 pop rdi
140972f88 pop rsi
140972f89 pop r12
140972f8b pop r13
140972f8d pop r14
140972f8f pop r15
140972f91 pop rbp
140972f92 ret
140972f93 cmp byte ptr [rsi + 0x4a], 0
140972f97 jne 0x140973426
140972f9d lea rcx, [rbp + 0x340]
140972fa4 mov rdx, r12
140972fa7 call 0x1409400e0
140972fac mov rdi, qword ptr [rbp + 0x340]
140972fb3 test rdi, rdi
140972fb6 je 0x140972ff3
140972fb8 add rdi, 0x38
140972fbc lea rdx, [rip + 0x5593e2d]
140972fc3 mov rcx, rdi
140972fc6 call 0x1409d87e0
140972fcb test al, al
140972fcd jne 0x140972ff3
140972fcf mov eax, dword ptr [rbp + 0x35c]
140972fd5 mov rcx, qword ptr [rbp + 0x350]
140972fdc mov dword ptr [rcx], eax
140972fde movups xmm0, xmmword ptr [rip + 0x5593e0b]
140972fe5 movups xmmword ptr [rdi], xmm0
140972fe8 mov dword ptr [rdi + 0x10], 0x3f800000
140972fef mov rsi, qword ptr [rbp - 0x40]
140972ff3 cmp qword ptr [rbp + 0x140], 0
140972ffb je 0x140973426
140973001 mov rdi, qword ptr [rbp + 0x120]
140973008 test rdi, rdi
14097300b je 0x140973426
140973011 mov rcx, qword ptr [rbp + 0x100]
140973018 test rcx, rcx
14097301b je 0x140973426
140973021 cmp byte ptr [rsi], 0
140973024 je 0x140973426
14097302a mov edx, dword ptr [rsi + 4]
14097302d mov dword ptr [rbp + 0x440], edx
140973033 call 0x145aa75a0
140973038 test al, 1
14097303a je 0x1409730f8
140973040 mov rcx, rdi
140973043 call 0x145a8d820
140973048 test rax, rax
14097304b je 0x1409730f8
140973051 mov rbx, rax
140973054 mov rdi, rdx
140973057 mov qword ptr [rsp + 0x20], 1
140973060 lea rcx, [rbp + 0x340]
140973067 mov r9d, 1
14097306d xor r8d, r8d
140973070 call 0x1402994a0
140973075 mov rsi, qword ptr [rbp + 0x348]
14097307c cmp byte ptr [rbp + 0x340], 0
140973083 jne 0x140973892
140973089 mov r14, qword ptr [rbp + 0x350]
140973090 test rdi, rdi
140973093 je 0x1409730a3
140973095 mov rcx, r14
140973098 mov rdx, rbx
14097309b mov r8, rdi
14097309e call 0x145c1d4fb
1409730a3 lea rax, [rbp - 0x40]
1409730a7 mov qword ptr [rbp + 0x3f0], rax
1409730ae lea rax, [rbp + 0x140]
1409730b5 mov qword ptr [rbp + 0x3f8], rax
1409730bc lea rax, [rbp + 0x20]
1409730c0 mov qword ptr [rbp + 0x400], rax
1409730c7 mov qword ptr [rbp + 0x340], rsi
1409730ce mov qword ptr [rbp + 0x348], r14
1409730d5 mov qword ptr [rbp + 0x350], rdi
1409730dc lea rcx, [rbp + 0x448]
1409730e3 lea rdx, [rbp + 0x3f0]
1409730ea lea r8, [rbp + 0x340]
1409730f1 call 0x14093c7d0
1409730f6 jmp 0x1409730ff
1409730f8 mov byte ptr [rbp + 0x448], 2
1409730ff lea rcx, [rbp + 0x3f0]
140973106 mov rdx, r12
140973109 call 0x1409400e0
14097310e mov rax, qword ptr [rbp + 0x458]
140973115 mov qword ptr [rbp + 0x350], rax
14097311c movups xmm0, xmmword ptr [rbp + 0x448]
140973123 movaps xmmword ptr [rbp + 0x340], xmm0
14097312a movups xmm0, xmmword ptr [rbp + 0x3f0]
140973131 movups xmm1, xmmword ptr [rbp + 0x400]
140973138 movups xmm2, xmmword ptr [rbp + 0x410]
14097313f movups xmm3, xmmword ptr [rbp + 0x420]
140973146 movups xmmword ptr [rbp + 0x358], xmm0
14097314d movups xmmword ptr [rbp + 0x368], xmm1
140973154 movups xmmword ptr [rbp + 0x378], xmm2
14097315b movups xmmword ptr [rbp + 0x388], xmm3
140973162 cmp byte ptr [rbp + 0x340], 2
140973169 sete al
14097316c mov rsi, qword ptr [rbp + 0x358]
140973173 test rsi, rsi
140973176 sete r8b
14097317a or r8b, al
14097317d je 0x140973265
140973183 mov rax, qword ptr [rip + 0x773de1e]
14097318a mov rax, qword ptr [rax]
14097318d cmp rax, 3
140973191 ja 0x1409733dd
140973197 movzx edx, byte ptr [rip + 0x7705dfa]
14097319e movzx eax, dl
1409731a1 lea ecx, [rax - 1]
1409731a4 cmp ecx, 2
1409731a7 jae 0x1409733d5
1409731ad mov byte ptr [rbp + 0x488], r8b
1409731b4 mov rcx, qword ptr [rip + 0x7705dcd]
1409731bb call 0x144c7d510
1409731c0 nop
1409731c1 test al, al
1409731c3 je 0x1409733dd
1409731c9 mov rcx, qword ptr [rip + 0x7705db8]
1409731d0 lea rax, [rcx + 0x30]
1409731d4 lea rdx, [rbp + 0x440]
1409731db mov qword ptr [rbp + 0x460], rdx
1409731e2 lea rdx, [rip + 0x528eb17]
1409731e9 mov qword ptr [rbp + 0x468], rdx
1409731f0 lea rdx, [rip + 0x5597247]
1409731f7 mov qword ptr [rbp + 0x478], rdx
1409731fe lea rdx, [rbp + 0x460]
140973205 mov qword ptr [rbp + 0x480], rdx
14097320c lea rdx, [rbp + 0x478]
140973213 mov qword ptr [rbp + 0x430], rdx
14097321a lea rdx, [rip + 0x559364f]
140973221 mov qword ptr [rbp + 0x438], rdx
140973228 mov qword ptr [rbp + 0x3f0], 1
140973233 lea rdx, [rbp + 0x430]
14097323a mov qword ptr [rbp + 0x3f8], rdx
140973241 mov qword ptr [rbp + 0x400], 1
14097324c mov qword ptr [rbp + 0x408], rax
140973253 lea rdx, [rbp + 0x3f0]
14097325a call 0x144c7ed30
14097325f nop
140973260 jmp 0x1409733dd
140973265 mov byte ptr [rbp + 0x488], r8b
14097326c mov rax, qword ptr [rbp + 0x458]
140973273 mov qword ptr [rbp + 0x470], rax
14097327a movups xmm0, xmmword ptr [rbp + 0x448]
140973281 movaps xmmword ptr [rbp + 0x460], xmm0
140973288 mov rdi, qword ptr [rbp + 0x368]
14097328f mov ebx, dword ptr [rbp + 0x374]
140973295 mov dword ptr [rdi], ebx
140973297 lea rax, [rsi + 0x20]
14097329b mov qword ptr [rbp + 0x3e8], rax
1409732a2 cmp byte ptr [rsi + 0x20], 0
1409732a6 jne 0x1409732bf
1409732a8 mov rax, qword ptr [rsi + 0x28]
1409732ac lock dec qword ptr [rax]
1409732b0 jne 0x1409732bf
1409732b2 mov rcx, rsi
1409732b5 add rcx, 0x28
1409732b9 call 0x1449a58a0
1409732be nop
1409732bf mov rax, qword ptr [rbp + 0x470]
1409732c6 lea rcx, [rsi + 0x20]
1409732ca mov qword ptr [rcx + 0x10], rax
1409732ce movaps xmm0, xmmword ptr [rbp + 0x460]
1409732d5 movups xmmword ptr [rcx], xmm0
1409732d8 mov dword ptr [rdi], ebx
1409732da movups xmm0, xmmword ptr [rip + 0x5593cbf]
1409732e1 movups xmmword ptr [rsi + 0x38], xmm0
1409732e5 mov dword ptr [rsi + 0x48], 0x3f800000
1409732ec mov eax, dword ptr [rbp - 0x24]
1409732ef mov rcx, qword ptr [rbp - 0x30]
1409732f3 mov dword ptr [rcx], eax
1409732f5 mov rax, qword ptr [rbp - 0x40]
1409732f9 mov byte ptr [rax + 0x4a], 1
1409732fd mov rax, qword ptr [rip + 0x773dca4]
140973304 mov rax, qword ptr [rax]
140973307 cmp rax, 2
14097330b ja 0x140973422
140973311 movzx edx, byte ptr [rip + 0x7705c68]
140973318 movzx eax, dl
14097331b lea ecx, [rax - 1]
14097331e cmp ecx, 2
140973321 jae 0x14097341a
140973327 mov rcx, qword ptr [rip + 0x7705c42]
14097332e call 0x144c7d510
140973333 nop
140973334 test al, al
140973336 je 0x140973422
14097333c mov rcx, qword ptr [rip + 0x7705c2d]
140973343 lea rax, [rcx + 0x30]
140973347 lea rdx, [rbp + 0x440]
14097334e mov qword ptr [rbp + 0x478], rdx
140973355 lea rdx, [rip + 0x528e9a4]
14097335c mov qword ptr [rbp + 0x480], rdx
140973363 lea rdx, [rip + 0x55970a6]
14097336a mov qword ptr [rbp + 0x430], rdx
140973371 lea rdx, [rbp + 0x478]
140973378 mov qword ptr [rbp + 0x438], rdx
14097337f lea rdx, [rbp + 0x430]
140973386 mov qword ptr [rbp + 0x330], rdx
14097338d lea rdx, [rip + 0x55934dc]
140973394 mov qword ptr [rbp + 0x338], rdx
14097339b mov qword ptr [rbp + 0x3f0], 1
1409733a6 lea rdx, [rbp + 0x330]
1409733ad mov qword ptr [rbp + 0x3f8], rdx
1409733b4 mov qword ptr [rbp + 0x400], 1
1409733bf mov qword ptr [rbp + 0x408], rax
1409733c6 lea rdx, [rbp + 0x3f0]
1409733cd call 0x144c7ed30
1409733d2 nop
1409733d3 jmp 0x140973422
1409733d5 test eax, eax
1409733d7 jne 0x1409738be
1409733dd mov eax, dword ptr [rbp - 0x24]
1409733e0 mov rcx, qword ptr [rbp - 0x30]
1409733e4 mov dword ptr [rcx], eax
1409733e6 mov rax, qword ptr [rbp - 0x40]
1409733ea mov dword ptr [rax], 0
1409733f0 movzx eax, byte ptr [rbp + 0x340]
1409733f7 cmp al, 2
1409733f9 je 0x140973422
1409733fb test al, al
1409733fd jne 0x140973422
1409733ff mov rax, qword ptr [rbp + 0x348]
140973406 lock dec qword ptr [rax]
14097340a jne 0x140973422
14097340c lea rcx, [rbp + 0x348]
140973413 call 0x1449a58a0
140973418 jmp 0x140973422
14097341a test eax, eax
14097341c jne 0x1409738e9
140973422 mov rsi, qword ptr [rbp - 0x40]
140973426 cmp byte ptr [rsi + 0x49], 1
14097342a jne 0x140973436
14097342c movss xmm0, dword ptr [rsi + 0x3c]
140973431 jmp 0x140973512
140973436 mov rcx, qword ptr [rbp - 0x20]
14097343a mov rsi, qword ptr [rbp + 0x180]
140973441 call 0x1419104b0
140973446 test rsi, rsi
140973449 je 0x1409734dc
14097344f mulss xmm0, dword ptr [rip + 0x545dccd]
140973457 mov rax, qword ptr [rsi + 0x118]
14097345e test rax, rax
140973461 je 0x140973496
140973463 mov rcx, qword ptr [rsi + 0x110]
14097346a test rcx, rcx
14097346d js 0x14097349b
14097346f xorps xmm1, xmm1
140973472 cvtsi2ss xmm1, rcx
140973477 test rax, rax
14097347a jns 0x1409734b8
14097347c mov rcx, rax
14097347f shr rcx, 1
140973482 and eax, 1
140973485 or rax, rcx
140973488 xorps xmm2, xmm2
14097348b cvtsi2ss xmm2, rax
140973490 addss xmm2, xmm2
140973494 jmp 0x1409734c0
140973496 xorps xmm2, xmm2
140973499 jmp 0x1409734d8
14097349b mov rdx, rcx
14097349e shr rdx, 1
1409734a1 and ecx, 1
1409734a4 or rcx, rdx
1409734a7 xorps xmm1, xmm1
1409734aa cvtsi2ss xmm1, rcx
1409734af addss xmm1, xmm1
1409734b3 test rax, rax
1409734b6 js 0x14097347c
1409734b8 xorps xmm2, xmm2
1409734bb cvtsi2ss xmm2, rax
1409734c0 divss xmm1, xmm2
1409734c4 movss xmm2, dword ptr [rip + 0x544ecb8]
1409734cc minss xmm2, xmm1
1409734d0 mulss xmm2, dword ptr [rip + 0x544ef6c]
1409734d8 addss xmm0, xmm2
1409734dc mov rax, qword ptr [rbp - 0x40]
1409734e0 mov rcx, qword ptr [rbp - 0x30]
1409734e4 movss xmm1, dword ptr [rax + 0x3c]
1409734e9 movaps xmm2, xmm1
1409734ec maxss xmm2, xmm0
1409734f0 movaps xmm0, xmm2
1409734f3 cmpunordss xmm0, xmm2
1409734f8 movaps xmm3, xmm0
1409734fb andnps xmm3, xmm2
1409734fe andps xmm0, xmm1
140973501 orps xmm0, xmm3
140973504 mov eax, dword ptr [rbp - 0x24]
140973507 mov dword ptr [rcx], eax
140973509 mov rax, qword ptr [rbp - 0x40]
14097350d movss dword ptr [rax + 0x3c], xmm0
140973512 mov r11, qword ptr [rbp + 0x70]
140973516 mov rax, qword ptr [rbp + 0x78]
14097351a mov rdx, qword ptr [r11 + 0xf8]
140973521 mov r8, qword ptr [r11 + 0x100]
140973528 movzx r9d, byte ptr [r11 + 0x108]
140973530 lea rsi, [r8*4]
140973538 mov rcx, rdx
14097353b test r9b, r9b
14097353e je 0x1409735a0
140973540 test rsi, rsi
140973543 je 0x140973668
140973549 mov r10d, dword ptr [rcx]
14097354c add rcx, 4
140973550 mov rdi, qword ptr [rax + 0x1a8]
140973557 lea rbx, [r10 + r10*8]
14097355b mov r10, qword ptr [rdi + rbx*8 + 0x10]
140973560 add rsi, -4
140973564 test r10, r10
140973567 je 0x140973540
140973569 lea rsi, [rdi + rbx*8]
14097356d mov r11, qword ptr [r11 + 0x110]
140973574 mov rdi, qword ptr [rsi + 0x18]
140973578 mov rsi, qword ptr [rsi + 0x38]
14097357c mov r11, qword ptr [rsi + r11*8]
140973580 not r11
140973583 lea r11, [r11 + r11*2]
140973587 shl r11, 4
14097358b mov rsi, qword ptr [rdi + r11 + 0x10]
140973590 mov r11, qword ptr [rdi + r11 + 0x28]
140973595 jmp 0x140973622
14097359a nop word ptr [rax + rax]
1409735a0 test rsi, rsi
1409735a3 je 0x140973668
1409735a9 mov r10d, dword ptr [rcx]
1409735ac add rcx, 4
1409735b0 mov rdi, qword ptr [rax + 0x108]
1409735b7 lea rbx, [r10 + r10*4]
1409735bb shl rbx, 5
1409735bf mov r10, qword ptr [rdi + rbx + 0x58]
1409735c4 add rsi, -4
1409735c8 test r10, r10
1409735cb je 0x1409735a0
1409735cd add rdi, rbx
1409735d0 mov esi, dword ptr [rdi + 0x94]
1409735d6 mov rbx, qword ptr [rax + 0x1a8]
1409735dd lea rsi, [rsi + rsi*8]
1409735e1 mov r11, qword ptr [r11 + 0x110]
1409735e8 mov r14, qword ptr [rbx + rsi*8 + 0x18]
1409735ed mov rsi, qword ptr [rbx + rsi*8 + 0x38]
1409735f2 mov rsi, qword ptr [rsi + r11*8]
1409735f6 not rsi
1409735f9 mov r11, qword ptr [rdi + 0x50]
1409735fd mov r11d, dword ptr [r11 + 8]
140973601 lea rdi, [rsi + rsi*2]
140973605 shl rdi, 4
140973609 not r11d
14097360c lea rsi, [r11 + r11*2]
140973610 shl rsi, 7
140973614 add rsi, qword ptr [r14 + rdi + 0x10]
140973619 shl r11, 2
14097361d add r11, qword ptr [r14 + rdi + 0x28]
140973622 mov ebx, 1
140973627 mov edi, dword ptr [rbp + 0x84]
14097362d lea rdx, [rdx + r8*4]
140973631 test r9b, r9b
140973634 jne 0x14097367e
140973636 cmp ebx, r10d
140973639 jne 0x140972f78
14097363f nop
140973640 cmp rcx, rdx
140973643 je 0x1409736b4
140973645 mov r8d, dword ptr [rcx]
140973648 add rcx, 4
14097364c mov r9, qword ptr [rax + 0x108]
140973653 lea r8, [r8 + r8*4]
140973657 shl r8, 5
14097365b cmp qword ptr [r9 + r8 + 0x58], 0
140973661 je 0x140973640
140973663 jmp 0x140972f78
140973668 xor r10d, r10d
14097366b xor ebx, ebx
14097366d xor esi, esi
14097366f mov edi, dword ptr [rbp + 0x84]
140973675 lea rdx, [rdx + r8*4]
140973679 test r9b, r9b
14097367c je 0x140973636
14097367e cmp ebx, r10d
140973681 jne 0x140972f78
140973687 nop word ptr [rax + rax]
140973690 cmp rcx, rdx
140973693 je 0x1409736b4
140973695 mov r8d, dword ptr [rcx]
140973698 add rcx, 4
14097369c mov r9, qword ptr [rax + 0x1a8]
1409736a3 lea r8, [r8 + r8*8]
1409736a7 cmp qword ptr [r9 + r8*8 + 0x10], 0
1409736ad je 0x140973690
1409736af jmp 0x140972f78
1409736b4 test rsi, rsi
1409736b7 je 0x140972f78
1409736bd mulss xmm0, dword ptr [rip + 0x5590eab]
1409736c5 mulss xmm0, dword ptr [rip + 0x5451c03]
1409736cd mov dword ptr [r11], edi
1409736d0 mov dword ptr [rsi + 0x88], 2
1409736da movss dword ptr [rsi + 0x8c], xmm0
1409736e2 jmp 0x140972f78
1409736e7 cmp byte ptr [rax + 0x49], 0
1409736eb jne 0x1409729a6
1409736f1 cmp byte ptr [rbp + 0x497], 0
1409736f8 jne 0x1409729a6
1409736fe mov rax, qword ptr [rbp + 0xc0]
140973705 cmp byte ptr [rax + 0x78], 1
140973709 jne 0x1409729a6
14097370f cmp qword ptr [rbp + 0x180], 0
140973717 jne 0x1409729a6
14097371d mov eax, dword ptr [rbp - 0x24]
140973720 mov rcx, qword ptr [rbp - 0x30]
140973724 mov dword ptr [rcx], eax
140973726 mov rcx, qword ptr [rbp - 0x40]
14097372a mov edx, dword ptr [rcx + 0x38]
14097372d inc edx
14097372f mov dword ptr [rcx + 0x38], edx
140973732 cmp edx, 3
140973735 jb 0x140972c30
14097373b mov rcx, qword ptr [rbp - 0x30]
14097373f mov dword ptr [rcx], eax
140973741 mov rax, qword ptr [rbp - 0x40]
140973745 mov byte ptr [rax + 0x48], 0
140973749 mov byte ptr [rax + 0x4d], 1
14097374d mov word ptr [rax + 0x4a], 0
140973753 mov rax, qword ptr [rip + 0x773d84e]
14097375a mov rax, qword ptr [rax]
14097375d cmp rax, 2
140973761 ja 0x140972c30
140973767 movzx edx, byte ptr [rip + 0x7705842]
14097376e movzx eax, dl
140973771 lea ecx, [rax - 1]
140973774 cmp ecx, 2
140973777 jae 0x14097386f
14097377d mov rcx, qword ptr [rip + 0x770581c]
140973784 call 0x144c7d510
140973789 test al, al
14097378b je 0x140972c30
140973791 mov rcx, qword ptr [rip + 0x7705808]
140973798 lea rax, [rcx + 0x30]
14097379c mov rdx, qword ptr [rbp - 0x40]
1409737a0 subss xmm6, dword ptr [rdx + 0x40]
1409737a5 movss dword ptr [rbp + 0x478], xmm6
1409737ad mov qword ptr [rbp + 0x340], rsi
1409737b4 lea rdx, [rip + 0x528f435]
1409737bb mov qword ptr [rbp + 0x348], rdx
1409737c2 mov qword ptr [rbp + 0x350], rdi
1409737c9 mov qword ptr [rbp + 0x358], rdx
1409737d0 lea rdx, [rbp + 0x478]
1409737d7 mov qword ptr [rbp + 0x360], rdx
1409737de lea rdx, [rip + 0x528d81b]
1409737e5 mov qword ptr [rbp + 0x368], rdx
1409737ec lea rdx, [rip + 0x5596b3c]
1409737f3 mov qword ptr [rbp + 0x460], rdx
1409737fa lea rdx, [rbp + 0x340]
140973801 mov qword ptr [rbp + 0x468], rdx
140973808 lea rdx, [rbp + 0x460]
14097380f mov qword ptr [rbp + 0x448], rdx
140973816 lea rdx, [rip + 0x5593053]
14097381d mov qword ptr [rbp + 0x450], rdx
140973824 mov qword ptr [rbp + 0x3f0], 1
14097382f lea rdx, [rbp + 0x448]
140973836 mov qword ptr [rbp + 0x3f8], rdx
14097383d mov qword ptr [rbp + 0x400], 1
140973848 mov qword ptr [rbp + 0x408], rax
14097384f jmp 0x140972b9d
140973854 lea rcx, [rip + 0x77056e5]
14097385b call 0x145d6a190
140973860 mov edx, eax
140973862 test al, al
140973864 jne 0x14097282f
14097386a jmp 0x14097292c
14097386f test eax, eax
140973871 je 0x140972c30
140973877 lea rcx, [rip + 0x7705722]
14097387e call 0x145d6a190
140973883 mov edx, eax
140973885 test al, al
140973887 jne 0x14097377d
14097388d jmp 0x140972c30
140973892 mov rdx, qword ptr [rbp + 0x350]
140973899 mov rcx, rsi
14097389c call 0x145dbdb4b
1409738a1 ud2
1409738a3 lea rcx, [rip + 0x77056ae]
1409738aa call 0x145d6a190
1409738af mov edx, eax
1409738b1 test al, al
1409738b3 jne 0x140972a1d
1409738b9 jmp 0x140972c30
1409738be mov byte ptr [rbp + 0x488], r8b
1409738c5 lea rcx, [rip + 0x77056bc]
1409738cc call 0x145d6a190
1409738d1 nop
1409738d2 mov edx, eax
1409738d4 test al, al
1409738d6 movzx r8d, byte ptr [rbp + 0x488]
1409738de jne 0x1409731ad
1409738e4 jmp 0x1409733dd
1409738e9 lea rcx, [rip + 0x7705680]
1409738f0 call 0x145d6a190
1409738f5 nop
1409738f6 mov edx, eax
1409738f8 test al, al
1409738fa jne 0x140973327
140973900 jmp 0x140973422
