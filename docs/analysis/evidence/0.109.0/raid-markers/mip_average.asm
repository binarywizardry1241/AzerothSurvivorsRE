1400a6800: 56 push rsi
1400a6801: 57 push rdi
1400a6802: 53 push rbx
1400a6803: 4883ec20 sub rsp, 0x20
1400a6807: 4889ca mov rdx, rcx
1400a680a: 448b19 mov r11d, dword ptr [rcx]
1400a680d: 8b4904 mov ecx, dword ptr [rcx + 4]
1400a6810: 488b4220 mov rax, qword ptr [rdx + 0x20]
1400a6814: 448b5208 mov r10d, dword ptr [rdx + 8]
1400a6818: 4885c0 test rax, rax
1400a681b: 7461 je 0x1400a687e
1400a681d: 448b4228 mov r8d, dword ptr [rdx + 0x28]
1400a6821: 8b722c mov esi, dword ptr [rdx + 0x2c]
1400a6824: 4139f0 cmp r8d, esi
1400a6827: 4189f1 mov r9d, esi
1400a682a: 450f47c8 cmova r9d, r8d
1400a682e: 4183fb01 cmp r11d, 1
1400a6832: 750f jne 0x1400a6843
1400a6834: 4439d1 cmp ecx, r10d
1400a6837: 0f8281000000 jb 0x1400a68be
1400a683d: c70200000000 mov dword ptr [rdx], 0
1400a6843: 4139f0 cmp r8d, esi
1400a6846: 7347 jae 0x1400a688f
1400a6848: 0f1f840000000000 nop dword ptr [rax + rax]
1400a6850: 4489c1 mov ecx, r8d
1400a6853: 448d4101 lea r8d, [rcx + 1]
1400a6857: 44894228 mov dword ptr [rdx + 0x28], r8d
1400a685b: 448b10 mov r10d, dword ptr [rax]
1400a685e: 48c70201000000 mov qword ptr [rdx], 1
1400a6865: 44895208 mov dword ptr [rdx + 8], r10d
1400a6869: 894a0c mov dword ptr [rdx + 0xc], ecx
1400a686c: 4585d2 test r10d, r10d
1400a686f: 754b jne 0x1400a68bc
1400a6871: c70200000000 mov dword ptr [rdx], 0
1400a6877: 4539c1 cmp r9d, r8d
1400a687a: 75d4 jne 0x1400a6850
1400a687c: eb11 jmp 0x1400a688f
1400a687e: 4183fb01 cmp r11d, 1
1400a6882: 750b jne 0x1400a688f
1400a6884: 4439d1 cmp ecx, r10d
1400a6887: 7235 jb 0x1400a68be
1400a6889: c70200000000 mov dword ptr [rdx], 0
1400a688f: 31c0 xor eax, eax
1400a6891: 837a1001 cmp dword ptr [rdx + 0x10], 1
1400a6895: 7514 jne 0x1400a68ab
1400a6897: 8b4a14 mov ecx, dword ptr [rdx + 0x14]
1400a689a: 3b4a18 cmp ecx, dword ptr [rdx + 0x18]
1400a689d: 7311 jae 0x1400a68b0
1400a689f: 8d4101 lea eax, [rcx + 1]
1400a68a2: 894214 mov dword ptr [rdx + 0x14], eax
1400a68a5: 488d421c lea rax, [rdx + 0x1c]
1400a68a9: eb1f jmp 0x1400a68ca
1400a68ab: e9b2000000 jmp 0x1400a6962
1400a68b0: c7421000000000 mov dword ptr [rdx + 0x10], 0
1400a68b7: e9a6000000 jmp 0x1400a6962
1400a68bc: 31c9 xor ecx, ecx
1400a68be: 488d420c lea rax, [rdx + 0xc]
1400a68c2: 448d4101 lea r8d, [rcx + 1]
1400a68c6: 44894204 mov dword ptr [rdx + 4], r8d
1400a68ca: 448b00 mov r8d, dword ptr [rax]
1400a68cd: 488b5230 mov rdx, qword ptr [rdx + 0x30]
1400a68d1: 01c9 add ecx, ecx
1400a68d3: 4501c0 add r8d, r8d
1400a68d6: 488b4208 mov rax, qword ptr [rdx + 8]
1400a68da: 8b30 mov esi, dword ptr [rax]
1400a68dc: ffce dec esi
1400a68de: 4439c6 cmp esi, r8d
1400a68e1: 4489c0 mov eax, r8d
1400a68e4: 0f42c6 cmovb eax, esi
1400a68e7: 4c8b4a10 mov r9, qword ptr [rdx + 0x10]
1400a68eb: 418b39 mov edi, dword ptr [r9]
1400a68ee: 0fafc7 imul eax, edi
1400a68f1: 8d5fff lea ebx, [rdi - 1]
1400a68f4: 39cb cmp ebx, ecx
1400a68f6: 4189ca mov r10d, ecx
1400a68f9: 440f42d3 cmovb r10d, ebx
1400a68fd: 4c8b1a mov r11, qword ptr [rdx]
1400a6900: 458d0c02 lea r9d, [r10 + rax]
1400a6904: 498b5310 mov rdx, qword ptr [r11 + 0x10]
1400a6908: 4c39ca cmp rdx, r9
1400a690b: 765d jbe 0x1400a696a
1400a690d: 83c901 or ecx, 1
1400a6910: 39cb cmp ebx, ecx
1400a6912: 0f42cb cmovb ecx, ebx
1400a6915: 01c8 add eax, ecx
1400a6917: 4839c2 cmp rdx, rax
1400a691a: 765f jbe 0x1400a697b
1400a691c: 4183c801 or r8d, 1
1400a6920: 4439c6 cmp esi, r8d
1400a6923: 440f42c6 cmovb r8d, esi
1400a6927: 440fafc7 imul r8d, edi
1400a692b: 4501c2 add r10d, r8d
1400a692e: 4c39d2 cmp rdx, r10
1400a6931: 7659 jbe 0x1400a698c
1400a6933: 4401c1 add ecx, r8d
1400a6936: 4839ca cmp rdx, rcx
1400a6939: 7662 jbe 0x1400a699d
1400a693b: 498b5308 mov rdx, qword ptr [r11 + 8]
1400a693f: f3420f10048a movss xmm0, dword ptr [rdx + r9*4]
1400a6945: f30f580482 addss xmm0, dword ptr [rdx + rax*4]
1400a694a: f3420f580492 addss xmm0, dword ptr [rdx + r10*4]
1400a6950: f30f58048a addss xmm0, dword ptr [rdx + rcx*4]
1400a6955: f30f59052765d205 mulss xmm0, dword ptr [rip + 0x5d26527]
1400a695d: b801000000 mov eax, 1
1400a6962: 4883c420 add rsp, 0x20
1400a6966: 5b pop rbx
1400a6967: 5f pop rdi
1400a6968: 5e pop rsi
1400a6969: c3 ret
1400a696a: 4c8d05dfaad205 lea r8, [rip + 0x5d2aadf]
1400a6971: 4c89c9 mov rcx, r9
1400a6974: e8da2ccf05 call 0x145d99653
1400a6979: 0f0b ud2
1400a697b: 4c8d05ceaad205 lea r8, [rip + 0x5d2aace]
1400a6982: 4889c1 mov rcx, rax
1400a6985: e8c92ccf05 call 0x145d99653
1400a698a: 0f0b ud2
1400a698c: 4c8d05bdaad205 lea r8, [rip + 0x5d2aabd]
1400a6993: 4c89d1 mov rcx, r10
1400a6996: e8b82ccf05 call 0x145d99653
1400a699b: 0f0b ud2
1400a699d: 4c8d05acaad205 lea r8, [rip + 0x5d2aaac]
1400a69a4: e8aa2ccf05 call 0x145d99653
1400a69a9: 0f0b ud2
