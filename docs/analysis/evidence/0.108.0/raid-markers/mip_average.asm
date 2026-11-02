1401b76c0: 56 push rsi
1401b76c1: 57 push rdi
1401b76c2: 53 push rbx
1401b76c3: 4883ec20 sub rsp, 0x20
1401b76c7: 4889ca mov rdx, rcx
1401b76ca: 448b19 mov r11d, dword ptr [rcx]
1401b76cd: 8b4904 mov ecx, dword ptr [rcx + 4]
1401b76d0: 488b4220 mov rax, qword ptr [rdx + 0x20]
1401b76d4: 448b5208 mov r10d, dword ptr [rdx + 8]
1401b76d8: 4885c0 test rax, rax
1401b76db: 7461 je 0x1401b773e
1401b76dd: 448b4228 mov r8d, dword ptr [rdx + 0x28]
1401b76e1: 8b722c mov esi, dword ptr [rdx + 0x2c]
1401b76e4: 4139f0 cmp r8d, esi
1401b76e7: 4189f1 mov r9d, esi
1401b76ea: 450f47c8 cmova r9d, r8d
1401b76ee: 4183fb01 cmp r11d, 1
1401b76f2: 750f jne 0x1401b7703
1401b76f4: 4439d1 cmp ecx, r10d
1401b76f7: 0f8281000000 jb 0x1401b777e
1401b76fd: c70200000000 mov dword ptr [rdx], 0
1401b7703: 4139f0 cmp r8d, esi
1401b7706: 7347 jae 0x1401b774f
1401b7708: 0f1f840000000000 nop dword ptr [rax + rax]
1401b7710: 4489c1 mov ecx, r8d
1401b7713: 448d4101 lea r8d, [rcx + 1]
1401b7717: 44894228 mov dword ptr [rdx + 0x28], r8d
1401b771b: 448b10 mov r10d, dword ptr [rax]
1401b771e: 48c70201000000 mov qword ptr [rdx], 1
1401b7725: 44895208 mov dword ptr [rdx + 8], r10d
1401b7729: 894a0c mov dword ptr [rdx + 0xc], ecx
1401b772c: 4585d2 test r10d, r10d
1401b772f: 754b jne 0x1401b777c
1401b7731: c70200000000 mov dword ptr [rdx], 0
1401b7737: 4539c1 cmp r9d, r8d
1401b773a: 75d4 jne 0x1401b7710
1401b773c: eb11 jmp 0x1401b774f
1401b773e: 4183fb01 cmp r11d, 1
1401b7742: 750b jne 0x1401b774f
1401b7744: 4439d1 cmp ecx, r10d
1401b7747: 7235 jb 0x1401b777e
1401b7749: c70200000000 mov dword ptr [rdx], 0
1401b774f: 31c0 xor eax, eax
1401b7751: 837a1001 cmp dword ptr [rdx + 0x10], 1
1401b7755: 7514 jne 0x1401b776b
1401b7757: 8b4a14 mov ecx, dword ptr [rdx + 0x14]
1401b775a: 3b4a18 cmp ecx, dword ptr [rdx + 0x18]
1401b775d: 7311 jae 0x1401b7770
1401b775f: 8d4101 lea eax, [rcx + 1]
1401b7762: 894214 mov dword ptr [rdx + 0x14], eax
1401b7765: 488d421c lea rax, [rdx + 0x1c]
1401b7769: eb1f jmp 0x1401b778a
1401b776b: e9b2000000 jmp 0x1401b7822
1401b7770: c7421000000000 mov dword ptr [rdx + 0x10], 0
1401b7777: e9a6000000 jmp 0x1401b7822
1401b777c: 31c9 xor ecx, ecx
1401b777e: 488d420c lea rax, [rdx + 0xc]
1401b7782: 448d4101 lea r8d, [rcx + 1]
1401b7786: 44894204 mov dword ptr [rdx + 4], r8d
1401b778a: 448b00 mov r8d, dword ptr [rax]
1401b778d: 488b5230 mov rdx, qword ptr [rdx + 0x30]
1401b7791: 01c9 add ecx, ecx
1401b7793: 4501c0 add r8d, r8d
1401b7796: 488b4208 mov rax, qword ptr [rdx + 8]
1401b779a: 8b30 mov esi, dword ptr [rax]
1401b779c: ffce dec esi
1401b779e: 4439c6 cmp esi, r8d
1401b77a1: 4489c0 mov eax, r8d
1401b77a4: 0f42c6 cmovb eax, esi
1401b77a7: 4c8b4a10 mov r9, qword ptr [rdx + 0x10]
1401b77ab: 418b39 mov edi, dword ptr [r9]
1401b77ae: 0fafc7 imul eax, edi
1401b77b1: 8d5fff lea ebx, [rdi - 1]
1401b77b4: 39cb cmp ebx, ecx
1401b77b6: 4189ca mov r10d, ecx
1401b77b9: 440f42d3 cmovb r10d, ebx
1401b77bd: 4c8b1a mov r11, qword ptr [rdx]
1401b77c0: 458d0c02 lea r9d, [r10 + rax]
1401b77c4: 498b5310 mov rdx, qword ptr [r11 + 0x10]
1401b77c8: 4c39ca cmp rdx, r9
1401b77cb: 765d jbe 0x1401b782a
1401b77cd: 83c901 or ecx, 1
1401b77d0: 39cb cmp ebx, ecx
1401b77d2: 0f42cb cmovb ecx, ebx
1401b77d5: 01c8 add eax, ecx
1401b77d7: 4839c2 cmp rdx, rax
1401b77da: 765f jbe 0x1401b783b
1401b77dc: 4183c801 or r8d, 1
1401b77e0: 4439c6 cmp esi, r8d
1401b77e3: 440f42c6 cmovb r8d, esi
1401b77e7: 440fafc7 imul r8d, edi
1401b77eb: 4501c2 add r10d, r8d
1401b77ee: 4c39d2 cmp rdx, r10
1401b77f1: 7659 jbe 0x1401b784c
1401b77f3: 4401c1 add ecx, r8d
1401b77f6: 4839ca cmp rdx, rcx
1401b77f9: 7662 jbe 0x1401b785d
1401b77fb: 498b5308 mov rdx, qword ptr [r11 + 8]
1401b77ff: f3420f10048a movss xmm0, dword ptr [rdx + r9*4]
1401b7805: f30f580482 addss xmm0, dword ptr [rdx + rax*4]
1401b780a: f3420f580492 addss xmm0, dword ptr [rdx + r10*4]
1401b7810: f30f58048a addss xmm0, dword ptr [rdx + rcx*4]
1401b7815: f30f590507e8be05 mulss xmm0, dword ptr [rip + 0x5bee807]
1401b781d: b801000000 mov eax, 1
1401b7822: 4883c420 add rsp, 0x20
1401b7826: 5b pop rbx
1401b7827: 5f pop rdi
1401b7828: 5e pop rsi
1401b7829: c3 ret
1401b782a: 4c8d0567a9c205 lea r8, [rip + 0x5c2a967]
1401b7831: 4c89c9 mov rcx, r9
1401b7834: e85ac0bd05 call 0x145d93893
1401b7839: 0f0b ud2
1401b783b: 4c8d0556a9c205 lea r8, [rip + 0x5c2a956]
1401b7842: 4889c1 mov rcx, rax
1401b7845: e849c0bd05 call 0x145d93893
1401b784a: 0f0b ud2
1401b784c: 4c8d0545a9c205 lea r8, [rip + 0x5c2a945]
1401b7853: 4c89d1 mov rcx, r10
1401b7856: e838c0bd05 call 0x145d93893
1401b785b: 0f0b ud2
1401b785d: 4c8d0534a9c205 lea r8, [rip + 0x5c2a934]
1401b7864: e82ac0bd05 call 0x145d93893
1401b7869: 0f0b ud2
