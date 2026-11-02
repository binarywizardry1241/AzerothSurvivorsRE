0x1402df1f0: push rbp
0x1402df1f1: push r15
0x1402df1f3: push r14
0x1402df1f5: push r13
0x1402df1f7: push r12
0x1402df1f9: push rsi
0x1402df1fa: push rdi
0x1402df1fb: push rbx
0x1402df1fc: sub rsp, 0x128
0x1402df203: lea rbp, [rsp + 0x80]
0x1402df20b: mov qword ptr [rbp + 0xa0], 0xfffffffffffffffe
0x1402df216: mov rax, qword ptr [rdx + 0x10]
0x1402df21a: mov ecx, dword ptr [rdx + 0x1c]
0x1402df21d: mov r9d, ecx
0x1402df220: sub r9d, dword ptr [rax]
0x1402df223: sub ecx, dword ptr [rdx + 0x18]
0x1402df226: cmp ecx, 0xc233b000
0x1402df22c: mov eax, 0xc233b000
0x1402df231: cmovb eax, ecx
0x1402df234: cmp r9d, eax
0x1402df237: jae 0x1402df67e
0x1402df23d: mov rsi, qword ptr [rdx]
0x1402df240: mov r15, qword ptr [r8]
0x1402df243: mov r12, qword ptr [r8 + 8]
0x1402df247: mov eax, dword ptr [r8 + 0x14]
0x1402df24b: mov dword ptr [rbp + 0x64], eax
0x1402df24e: cmp qword ptr [rsi + 0x50], 0
0x1402df253: je 0x1402df2e2
0x1402df259: mov rax, qword ptr [rsi + 0x98]
0x1402df260: cmp rax, 1
0x1402df264: adc rax, 0
0x1402df268: mov qword ptr [rbp + 0x48], rax
0x1402df26c: cmp qword ptr [rsi + 0x68], 0
0x1402df271: je 0x1402df30f
0x1402df277: lea rdi, [rsi + 0x58]
0x1402df27b: lea rcx, [rip + 0x5f99077]
0x1402df282: mov edx, 0x13
0x1402df287: call 0x145be8220
0x1402df28c: mov r8, rdx
0x1402df28f: lea rcx, [rip + 0x5f9909a]
0x1402df296: mov qword ptr [rbp - 0x10], rcx
0x1402df29a: mov qword ptr [rbp - 8], 4
0x1402df2a2: mov qword ptr [rbp], rdi
0x1402df2a6: lea rcx, [rip + 0x5f99063]
0x1402df2ad: mov qword ptr [rbp + 8], rcx
0x1402df2b1: lea rcx, [rip + 0x5f99040]
0x1402df2b8: mov qword ptr [rbp + 0x10], rcx
0x1402df2bc: mov qword ptr [rbp + 0x18], 1
0x1402df2c4: lea rcx, [rbp + 0x48]
0x1402df2c8: mov qword ptr [rbp + 0x20], rcx
0x1402df2cc: lea rcx, [rip + 0x5f99005]
0x1402df2d3: mov qword ptr [rbp + 0x28], rcx
0x1402df2d7: mov qword ptr [rsp + 0x20], 2
0x1402df2e0: jmp 0x1402df352
0x1402df2e2: lea rcx, [rip + 0x5f98fcf]
0x1402df2e9: mov edx, 0x11
0x1402df2ee: call 0x145be8220
0x1402df2f3: mov rsi, rdx
0x1402df2f6: test rdx, rdx
0x1402df2f9: jns 0x1402df445
0x1402df2ff: xor r14d, r14d
0x1402df302: mov rcx, r14
0x1402df305: mov rdx, rsi
0x1402df308: call 0x14620896b
0x1402df30d: ud2 
0x1402df30f: lea rcx, [rip + 0x5f98fb3]
0x1402df316: mov edx, 0xc
0x1402df31b: call 0x145be8220
0x1402df320: mov r8, rdx
0x1402df323: lea rcx, [rip + 0x5f98fce]
0x1402df32a: mov qword ptr [rbp - 0x10], rcx
0x1402df32e: mov qword ptr [rbp - 8], 1
0x1402df336: lea rcx, [rbp + 0x48]
0x1402df33a: mov qword ptr [rbp], rcx
0x1402df33e: lea rcx, [rip + 0x5f98f93]
0x1402df345: mov qword ptr [rbp + 8], rcx
0x1402df349: mov qword ptr [rsp + 0x20], 1
0x1402df352: lea rcx, [rbp + 0x30]
0x1402df356: lea r9, [rbp - 0x10]
0x1402df35a: mov rdx, rax
0x1402df35d: call 0x145be86b0
0x1402df362: mov rax, qword ptr [rsi + 0x1a0]
0x1402df369: test rax, rax
0x1402df36c: je 0x1402df430
0x1402df372: mov qword ptr [rbp - 0x18], rax
0x1402df376: lea rcx, [rip + 0x5f98fb7]
0x1402df37d: mov edx, 7
0x1402df382: call 0x145be8220
0x1402df387: nop 
0x1402df388: mov r8, rdx
0x1402df38b: lea rcx, [rip + 0x5f98f66]
0x1402df392: mov qword ptr [rbp - 0x50], rcx
0x1402df396: mov qword ptr [rbp - 0x48], 1
0x1402df39e: lea rcx, [rbp - 0x18]
0x1402df3a2: mov qword ptr [rbp - 0x40], rcx
0x1402df3a6: lea rcx, [rip + 0x5f98f2b]
0x1402df3ad: mov qword ptr [rbp - 0x38], rcx
0x1402df3b1: mov qword ptr [rsp + 0x20], 1
0x1402df3ba: lea rsi, [rbp - 0x30]
0x1402df3be: lea r9, [rbp - 0x50]
0x1402df3c2: mov rcx, rsi
0x1402df3c5: mov rdx, rax
0x1402df3c8: call 0x145be86b0
0x1402df3cd: nop 
0x1402df3ce: lea rax, [rbp + 0x30]
0x1402df3d2: mov qword ptr [rbp - 0x10], rax
0x1402df3d6: lea rax, [rip - 0x2dd2fd]
0x1402df3dd: mov qword ptr [rbp - 8], rax
0x1402df3e1: mov qword ptr [rbp], rsi
0x1402df3e5: mov qword ptr [rbp + 8], rax
0x1402df3e9: lea rdx, [rip + 0x5f98f4b]
0x1402df3f0: lea rcx, [rbp + 0x70]
0x1402df3f4: lea r8, [rbp - 0x10]
0x1402df3f8: call 0x146034470
0x1402df3fd: nop 
0x1402df3fe: mov rdx, qword ptr [rbp - 0x30]
0x1402df402: test rdx, rdx
0x1402df405: je 0x1402df416
0x1402df407: mov rcx, qword ptr [rbp - 0x28]
0x1402df40b: mov r8d, 1
0x1402df411: call 0x1400021d0
0x1402df416: mov rdx, qword ptr [rbp + 0x30]
0x1402df41a: test rdx, rdx
0x1402df41d: je 0x1402df492
0x1402df41f: mov rcx, qword ptr [rbp + 0x38]
0x1402df423: mov r8d, 1
0x1402df429: call 0x1400021d0
0x1402df42e: jmp 0x1402df492
0x1402df430: mov rax, qword ptr [rbp + 0x40]
0x1402df434: mov qword ptr [rbp + 0x80], rax
0x1402df43b: movups xmm0, xmmword ptr [rbp + 0x30]
0x1402df43f: movaps xmmword ptr [rbp + 0x70], xmm0
0x1402df443: jmp 0x1402df492
0x1402df445: je 0x1402df47e
0x1402df447: mov rbx, rax
0x1402df44a: call 0x140002200
0x1402df44f: mov r14d, 1
0x1402df455: mov edx, 1
0x1402df45a: mov rcx, rsi
0x1402df45d: call 0x1400021c0
0x1402df462: test rax, rax
0x1402df465: je 0x1402df302
0x1402df46b: mov rdi, rax
0x1402df46e: mov rcx, rax
0x1402df471: mov rdx, rbx
0x1402df474: mov r8, rsi
0x1402df477: call 0x14606171b
0x1402df47c: jmp 0x1402df483
0x1402df47e: mov edi, 1
0x1402df483: mov qword ptr [rbp + 0x70], rsi
0x1402df487: mov qword ptr [rbp + 0x78], rdi
0x1402df48b: mov qword ptr [rbp + 0x80], rsi
0x1402df492: mov rbx, qword ptr [r15 + 0xf8]
0x1402df499: mov rax, qword ptr [r15 + 0x100]
0x1402df4a0: lea r14, [rbx + rax*4]
0x1402df4a4: mov qword ptr [rbp + 0x58], r15
0x1402df4a8: movzx eax, byte ptr [r15 + 0x108]
0x1402df4b0: mov byte ptr [rbp + 0x9f], al
0x1402df4b6: xor r13d, r13d
0x1402df4b9: mov eax, 8
0x1402df4be: mov qword ptr [rbp + 0x50], rax
0x1402df4c2: mov qword ptr [rbp + 0x90], 0
0x1402df4cd: xor esi, esi
0x1402df4cf: jmp 0x1402df4f3
0x1402df4d1: nop word ptr cs:[rax + rax]
0x1402df4e0: mov eax, dword ptr [rbp + 0x64]
0x1402df4e3: mov dword ptr [r15], eax
0x1402df4e6: mov rcx, rdi
0x1402df4e9: lea rdx, [rbp + 0x70]
0x1402df4ed: call 0x1460348c0
0x1402df4f2: nop 
0x1402df4f3: cmp byte ptr [rbp + 0x9f], 0
0x1402df4fa: je 0x1402df580
0x1402df500: cmp esi, r13d
0x1402df503: jne 0x1402df572
0x1402df505: nop word ptr cs:[rax + rax]
0x1402df510: cmp rbx, r14
0x1402df513: je 0x1402df665
0x1402df519: mov ecx, dword ptr [rbx]
0x1402df51b: add rbx, 4
0x1402df51f: mov rax, qword ptr [r12 + 0x1a8]
0x1402df527: lea rcx, [rcx + rcx*8]
0x1402df52b: mov r13, qword ptr [rax + rcx*8 + 0x10]
0x1402df530: test r13, r13
0x1402df533: je 0x1402df510
0x1402df535: lea rax, [rax + rcx*8]
0x1402df539: mov rcx, qword ptr [rbp + 0x58]
0x1402df53d: mov rcx, qword ptr [rcx + 0x110]
0x1402df544: mov rdx, qword ptr [rax + 0x18]
0x1402df548: mov rax, qword ptr [rax + 0x38]
0x1402df54c: mov rax, qword ptr [rax + rcx*8]
0x1402df550: not rax
0x1402df553: lea rax, [rax + rax*2]
0x1402df557: shl rax, 4
0x1402df55b: mov rcx, qword ptr [rdx + rax + 0x10]
0x1402df560: mov qword ptr [rbp + 0x90], rcx
0x1402df567: mov rax, qword ptr [rdx + rax + 0x28]
0x1402df56c: mov qword ptr [rbp + 0x68], rax
0x1402df570: xor esi, esi
0x1402df572: mov eax, esi
0x1402df574: jmp 0x1402df621
0x1402df579: nop dword ptr [rax]
0x1402df580: cmp esi, r13d
0x1402df583: jne 0x1402df611
0x1402df589: nop dword ptr [rax]
0x1402df590: cmp rbx, r14
0x1402df593: je 0x1402df665
0x1402df599: mov ecx, dword ptr [rbx]
0x1402df59b: add rbx, 4
0x1402df59f: mov rax, qword ptr [r12 + 0x108]
0x1402df5a7: lea rcx, [rcx + rcx*4]
0x1402df5ab: shl rcx, 5
0x1402df5af: mov r13, qword ptr [rax + rcx + 0x58]
0x1402df5b4: test r13, r13
0x1402df5b7: je 0x1402df590
0x1402df5b9: add rax, rcx
0x1402df5bc: mov ecx, dword ptr [rax + 0x94]
0x1402df5c2: mov rdx, qword ptr [r12 + 0x1a8]
0x1402df5ca: lea rcx, [rcx + rcx*8]
0x1402df5ce: mov r8, qword ptr [rbp + 0x58]
0x1402df5d2: mov r8, qword ptr [r8 + 0x110]
0x1402df5d9: mov r9, qword ptr [rdx + rcx*8 + 0x18]
0x1402df5de: mov rcx, qword ptr [rdx + rcx*8 + 0x38]
0x1402df5e3: mov rcx, qword ptr [rcx + r8*8]
0x1402df5e7: not rcx
0x1402df5ea: lea rcx, [rcx + rcx*2]
0x1402df5ee: shl rcx, 4
0x1402df5f2: mov rdx, qword ptr [r9 + rcx + 0x10]
0x1402df5f7: mov qword ptr [rbp + 0x90], rdx
0x1402df5fe: mov rcx, qword ptr [r9 + rcx + 0x28]
0x1402df603: mov qword ptr [rbp + 0x68], rcx
0x1402df607: mov rax, qword ptr [rax + 0x50]
0x1402df60b: mov qword ptr [rbp + 0x50], rax
0x1402df60f: xor esi, esi
0x1402df611: mov eax, esi
0x1402df613: shl rax, 4
0x1402df617: mov rcx, qword ptr [rbp + 0x50]
0x1402df61b: mov eax, dword ptr [rcx + rax + 8]
0x1402df61f: not eax
0x1402df621: lea rcx, [rax + rax*2]
0x1402df625: mov rdx, qword ptr [rbp + 0x90]
0x1402df62c: lea rdi, [rdx + rcx*8]
0x1402df630: mov rcx, qword ptr [rbp + 0x68]
0x1402df634: lea r15, [rcx + rax*4]
0x1402df638: inc esi
0x1402df63a: mov r8, qword ptr [rdi + 0x10]
0x1402df63e: cmp r8, qword ptr [rbp + 0x80]
0x1402df645: jne 0x1402df4e0
0x1402df64b: mov rdx, qword ptr [rbp + 0x78]
0x1402df64f: mov rcx, qword ptr [rdi + 8]
0x1402df653: call 0x146061721
0x1402df658: test eax, eax
0x1402df65a: jne 0x1402df4e0
0x1402df660: jmp 0x1402df4f3
0x1402df665: mov rdx, qword ptr [rbp + 0x70]
0x1402df669: test rdx, rdx
0x1402df66c: je 0x1402df67e
0x1402df66e: mov rcx, qword ptr [rbp + 0x78]
0x1402df672: mov r8d, 1
0x1402df678: call 0x1400021d0
0x1402df67d: nop 
0x1402df67e: add rsp, 0x128
0x1402df685: pop rbx
0x1402df686: pop rdi
0x1402df687: pop rsi
0x1402df688: pop r12
0x1402df68a: pop r13
0x1402df68c: pop r14
0x1402df68e: pop r15
0x1402df690: pop rbp
0x1402df691: ret 
