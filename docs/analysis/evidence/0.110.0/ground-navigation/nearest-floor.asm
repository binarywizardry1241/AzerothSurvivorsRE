1458a0450: 4157 push r15
1458a0452: 4156 push r14
1458a0454: 4155 push r13
1458a0456: 4154 push r12
1458a0458: 56 push rsi
1458a0459: 57 push rdi
1458a045a: 55 push rbp
1458a045b: 53 push rbx
1458a045c: 4881eca8000000 sub rsp, 0xa8
1458a0463: 440f298c2490000000 movaps xmmword ptr [rsp + 0x90], xmm9
1458a046c: 440f29842480000000 movaps xmmword ptr [rsp + 0x80], xmm8
1458a0475: 0f297c2470 movaps xmmword ptr [rsp + 0x70], xmm7
1458a047a: 0f29742460 movaps xmmword ptr [rsp + 0x60], xmm6
1458a047f: 0f28f3 movaps xmm6, xmm3
1458a0482: 0f28c2 movaps xmm0, xmm2
1458a0485: 4889d7 mov rdi, rdx
1458a0488: 4989ce mov r14, rcx
1458a048b: f30f107a20 movss xmm7, dword ptr [rdx + 0x20]
1458a0490: f30f5cc7 subss xmm0, xmm7
1458a0494: f30f58c0 addss xmm0, xmm0
1458a0498: e87c4d3600 call 0x145c05219
1458a049d: f30f2cd8 cvttss2si ebx, xmm0
1458a04a1: f3440f100df6925e00 movss xmm9, dword ptr [rip + 0x5e92f6]
1458a04aa: 410f2ec1 ucomiss xmm0, xmm9
1458a04ae: beffffff7f mov esi, 0x7fffffff
1458a04b3: 0f47de cmova ebx, esi
1458a04b6: 31ed xor ebp, ebp
1458a04b8: 0f2ec0 ucomiss xmm0, xmm0
1458a04bb: 0f4add cmovp ebx, ebp
1458a04be: f3440f104724 movss xmm8, dword ptr [rdi + 0x24]
1458a04c4: f3410f5cf0 subss xmm6, xmm8
1458a04c9: f30f58f6 addss xmm6, xmm6
1458a04cd: 0f28c6 movaps xmm0, xmm6
1458a04d0: e8444d3600 call 0x145c05219
1458a04d5: f3440f2ce0 cvttss2si r12d, xmm0
1458a04da: 410f2ec1 ucomiss xmm0, xmm9
1458a04de: 440f47e6 cmova r12d, esi
1458a04e2: 0f2ec0 ucomiss xmm0, xmm0
1458a04e5: 440f4ae5 cmovp r12d, ebp
1458a04e9: 448b4718 mov r8d, dword ptr [rdi + 0x18]
1458a04ed: 488b4708 mov rax, qword ptr [rdi + 8]
1458a04f1: 4889442450 mov qword ptr [rsp + 0x50], rax
1458a04f6: 488b4710 mov rax, qword ptr [rdi + 0x10]
1458a04fa: 4889442440 mov qword ptr [rsp + 0x40], rax
1458a04ff: f30f10056d7d5000 movss xmm0, dword ptr [rip + 0x507d6d]
1458a0507: 31c9 xor ecx, ecx
1458a0509: 0f1f8000000000 nop dword ptr [rax]
1458a0510: 31c0 xor eax, eax
1458a0512: f6c101 test cl, 1
1458a0515: 0f85c7010000 jne 0x1458a06e2
1458a051b: 89ef mov edi, ebp
1458a051d: 83fd14 cmp ebp, 0x14
1458a0520: 0f8fbc010000 jg 0x1458a06e2
1458a0526: 8d6f01 lea ebp, [rdi + 1]
1458a0529: 83ff14 cmp edi, 0x14
1458a052c: 0f44ef cmove ebp, edi
1458a052f: 0f94c1 sete cl
1458a0532: 89f8 mov eax, edi
1458a0534: f7d8 neg eax
1458a0536: 39c7 cmp edi, eax
1458a0538: 7cd6 jl 0x1458a0510
1458a053a: 894c2434 mov dword ptr [rsp + 0x34], ecx
1458a053e: 4c89742448 mov qword ptr [rsp + 0x48], r14
1458a0543: c744243000000000 mov dword ptr [rsp + 0x30], 0
1458a054b: 4189c7 mov r15d, eax
1458a054e: 6690 nop
1458a0550: 4531ed xor r13d, r13d
1458a0553: 4139ff cmp r15d, edi
1458a0556: 410f9cc3 setl r11b
1458a055a: 4589f9 mov r9d, r15d
1458a055d: 41f7d9 neg r9d
1458a0560: 450f48cf cmovs r9d, r15d
1458a0564: 478d1427 lea r10d, [r15 + r12]
1458a0568: 89c1 mov ecx, eax
1458a056a: 4539c2 cmp r10d, r8d
1458a056d: 0f8d1d010000 jge 0x1458a0690
1458a0573: 4489d1 mov ecx, r10d
1458a0576: 410fafc8 imul ecx, r8d
1458a057a: 48894c2458 mov qword ptr [rsp + 0x58], rcx
1458a057f: 4489f9 mov ecx, r15d
1458a0582: 410fafcf imul ecx, r15d
1458a0586: 894c243c mov dword ptr [rsp + 0x3c], ecx
1458a058a: 0f57e4 xorps xmm4, xmm4
1458a058d: f3410f2ae2 cvtsi2ss xmm4, r10d
1458a0592: f30f58e0 addss xmm4, xmm0
1458a0596: f30f59e0 mulss xmm4, xmm0
1458a059a: f3410f58e0 addss xmm4, xmm8
1458a059f: 89c6 mov esi, eax
1458a05a1: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1458a05b0: 4531f6 xor r14d, r14d
1458a05b3: 39fe cmp esi, edi
1458a05b5: 410f9cc6 setl r14b
1458a05b9: 4101f6 add r14d, esi
1458a05bc: 89f1 mov ecx, esi
1458a05be: f7d9 neg ecx
1458a05c0: 0f48ce cmovs ecx, esi
1458a05c3: 4139c9 cmp r9d, ecx
1458a05c6: 410f4fc9 cmovg ecx, r9d
1458a05ca: 39f9 cmp ecx, edi
1458a05cc: 750f jne 0x1458a05dd
1458a05ce: 8d141e lea edx, [rsi + rbx]
1458a05d1: 4439c2 cmp edx, r8d
1458a05d4: 7d07 jge 0x1458a05dd
1458a05d6: 89d1 mov ecx, edx
1458a05d8: 4409d1 or ecx, r10d
1458a05db: 7915 jns 0x1458a05f2
1458a05dd: 39fe cmp esi, edi
1458a05df: 0f8dbe000000 jge 0x1458a06a3
1458a05e5: 4489f6 mov esi, r14d
1458a05e8: 4139fe cmp r14d, edi
1458a05eb: 7ec3 jle 0x1458a05b0
1458a05ed: e9b1000000 jmp 0x1458a06a3
1458a05f2: 44885c242f mov byte ptr [rsp + 0x2f], r11b
1458a05f7: 488b4c2458 mov rcx, qword ptr [rsp + 0x58]
1458a05fc: 01d1 add ecx, edx
1458a05fe: 4863c9 movsxd rcx, ecx
1458a0601: 48394c2440 cmp qword ptr [rsp + 0x40], rcx
1458a0606: 0f860c010000 jbe 0x1458a0718
1458a060c: 4d89e3 mov r11, r12
1458a060f: 4c8b642450 mov r12, qword ptr [rsp + 0x50]
1458a0614: f3410f102c8c movss xmm5, dword ptr [r12 + rcx*4]
1458a061a: 89f1 mov ecx, esi
1458a061c: 0fafce imul ecx, esi
1458a061f: 034c243c add ecx, dword ptr [rsp + 0x3c]
1458a0623: 3b4c2438 cmp ecx, dword ptr [rsp + 0x38]
1458a0627: 410f9dc4 setge r12b
1458a062b: 0f2eed ucomiss xmm5, xmm5
1458a062e: 7a46 jp 0x1458a0676
1458a0630: 4422642430 and r12b, byte ptr [rsp + 0x30]
1458a0635: 4d89dc mov r12, r11
1458a0638: 7525 jne 0x1458a065f
1458a063a: 0f57c9 xorps xmm1, xmm1
1458a063d: f30f2aca cvtsi2ss xmm1, edx
1458a0641: f30f58c8 addss xmm1, xmm0
1458a0645: f30f59c8 mulss xmm1, xmm0
1458a0649: f30f58cf addss xmm1, xmm7
1458a064d: c744243001000000 mov dword ptr [rsp + 0x30], 1
1458a0655: 894c2438 mov dword ptr [rsp + 0x38], ecx
1458a0659: 0f28d4 movaps xmm2, xmm4
1458a065c: 0f28dd movaps xmm3, xmm5
1458a065f: 39fe cmp esi, edi
1458a0661: 440fb65c242f movzx r11d, byte ptr [rsp + 0x2f]
1458a0667: 7d3a jge 0x1458a06a3
1458a0669: 4139fe cmp r14d, edi
1458a066c: 7f35 jg 0x1458a06a3
1458a066e: 4489f6 mov esi, r14d
1458a0671: e93affffff jmp 0x1458a05b0
1458a0676: 4d89dc mov r12, r11
1458a0679: 39fe cmp esi, edi
1458a067b: 440fb65c242f movzx r11d, byte ptr [rsp + 0x2f]
1458a0681: 7ce6 jl 0x1458a0669
1458a0683: eb1e jmp 0x1458a06a3
1458a0685: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1458a0690: 31d2 xor edx, edx
1458a0692: 39f9 cmp ecx, edi
1458a0694: 410f9cc1 setl r9b
1458a0698: 7d09 jge 0x1458a06a3
1458a069a: 4488ca mov dl, r9b
1458a069d: 01d1 add ecx, edx
1458a069f: 39f9 cmp ecx, edi
1458a06a1: 7eed jle 0x1458a0690
1458a06a3: 4139ff cmp r15d, edi
1458a06a6: 7d0f jge 0x1458a06b7
1458a06a8: 4588dd mov r13b, r11b
1458a06ab: 4501ef add r15d, r13d
1458a06ae: 4139ff cmp r15d, edi
1458a06b1: 0f8e99feffff jle 0x1458a0550
1458a06b7: 837c243001 cmp dword ptr [rsp + 0x30], 1
1458a06bc: 4c8b742448 mov r14, qword ptr [rsp + 0x48]
1458a06c1: 8b4c2434 mov ecx, dword ptr [rsp + 0x34]
1458a06c5: 0f8545feffff jne 0x1458a0510
1458a06cb: f3410f114e04 movss dword ptr [r14 + 4], xmm1
1458a06d1: f3410f115608 movss dword ptr [r14 + 8], xmm2
1458a06d7: f3410f115e0c movss dword ptr [r14 + 0xc], xmm3
1458a06dd: b801000000 mov eax, 1
1458a06e2: 418906 mov dword ptr [r14], eax
1458a06e5: 4c89f0 mov rax, r14
1458a06e8: 0f28742460 movaps xmm6, xmmword ptr [rsp + 0x60]
1458a06ed: 0f287c2470 movaps xmm7, xmmword ptr [rsp + 0x70]
1458a06f2: 440f28842480000000 movaps xmm8, xmmword ptr [rsp + 0x80]
1458a06fb: 440f288c2490000000 movaps xmm9, xmmword ptr [rsp + 0x90]
1458a0704: 4881c4a8000000 add rsp, 0xa8
1458a070b: 5b pop rbx
1458a070c: 5d pop rbp
1458a070d: 5f pop rdi
1458a070e: 5e pop rsi
1458a070f: 415c pop r12
1458a0711: 415d pop r13
1458a0713: 415e pop r14
1458a0715: 415f pop r15
1458a0717: c3 ret
1458a0718: 4c8d05419e3501 lea r8, [rip + 0x1359e41]
1458a071f: 488b542440 mov rdx, qword ptr [rsp + 0x40]
1458a0724: e81a3f5000 call 0x145da4643
1458a0729: 0f0b ud2
