;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x14007de60..0x14007e3eb SHA256 e7536a6bbea778c636bb8445c687257cd46056c5fbd71de7f5b1a5db3df3ea2a
0x14007de60: push rbp
0x14007de61: push r15
0x14007de63: push r14
0x14007de65: push r13
0x14007de67: push r12
0x14007de69: push rsi
0x14007de6a: push rdi
0x14007de6b: push rbx
0x14007de6c: sub rsp, 0x48
0x14007de70: lea rbp, [rsp + 0x40]
0x14007de75: mov qword ptr [rbp], 0xfffffffffffffffe
0x14007de7d: movzx eax, byte ptr [rcx]
0x14007de80: cmp al, byte ptr [rdx]
0x14007de82: jne 0x14007e397
0x14007de88: mov eax, eax
0x14007de8a: lea r8, [rip + 0x5d52fe3]
0x14007de91: movsxd rax, dword ptr [r8 + rax*4]
0x14007de95: add rax, r8
0x14007de98: jmp rax
0x14007de9a: mov al, 1
0x14007de9c: jmp 0x14007e399
0x14007dea1: mov rbx, qword ptr [rcx + 0x18]
0x14007dea5: cmp rbx, qword ptr [rdx + 0x18]
0x14007dea9: jne 0x14007e397
0x14007deaf: mov al, 1
0x14007deb1: test rbx, rbx
0x14007deb4: je 0x14007e399
0x14007deba: mov rsi, qword ptr [rdx + 0x10]
0x14007debe: mov rdi, qword ptr [rcx + 0x10]
0x14007dec2: dec rbx
0x14007dec5: nop word ptr cs:[rax + rax]
0x14007ded0: mov rcx, rdi
0x14007ded3: mov rdx, rsi
0x14007ded6: call 0x14007de60
0x14007dedb: add rbx, -1
0x14007dedf: setb cl
0x14007dee2: test al, al
0x14007dee4: je 0x14007e399
0x14007deea: add rsi, 0x20
0x14007deee: add rdi, 0x20
0x14007def2: test cl, cl
0x14007def4: jne 0x14007ded0
0x14007def6: jmp 0x14007e399
0x14007defb: mov rax, qword ptr [rcx + 8]
0x14007deff: cmp rax, qword ptr [rdx + 8]
0x14007df03: jne 0x14007e397
0x14007df09: cmp eax, 2
0x14007df0c: je 0x14007e3aa
0x14007df12: cmp eax, 1
0x14007df15: mov rax, qword ptr [rcx + 0x10]
0x14007df19: cmp rax, qword ptr [rdx + 0x10]
0x14007df1d: sete al
0x14007df20: jmp 0x14007e399
0x14007df25: mov r8, qword ptr [rcx + 0x18]
0x14007df29: cmp r8, qword ptr [rdx + 0x18]
0x14007df2d: jne 0x14007e397
0x14007df33: mov rdx, qword ptr [rdx + 0x10]
0x14007df37: mov rcx, qword ptr [rcx + 0x10]
0x14007df3b: call 0x145bfa0e1
0x14007df40: test eax, eax
0x14007df42: sete al
0x14007df45: jmp 0x14007e399
0x14007df4a: movzx eax, byte ptr [rcx + 1]
0x14007df4e: cmp al, byte ptr [rdx + 1]
0x14007df51: sete al
0x14007df54: jmp 0x14007e399
0x14007df59: mov rbx, qword ptr [rcx + 0x18]
0x14007df5d: cmp rbx, qword ptr [rdx + 0x18]
0x14007df61: jne 0x14007e397
0x14007df67: mov r8, qword ptr [rcx + 8]
0x14007df6b: mov r13, qword ptr [rcx + 0x10]
0x14007df6f: mov rax, qword ptr [rdx + 8]
0x14007df73: mov r14, qword ptr [rdx + 0x10]
0x14007df77: test rax, rax
0x14007df7a: setne dl
0x14007df7d: mov r11, rbx
0x14007df80: cmove r11, rax
0x14007df84: test r8, r8
0x14007df87: setne r9b
0x14007df8b: cmove rbx, r8
0x14007df8f: xor r15d, r15d
0x14007df92: xor r12d, r12d
0x14007df95: nop word ptr cs:[rax + rax]
0x14007dfa0: sub rbx, 1
0x14007dfa4: jb 0x14007de9a
0x14007dfaa: test r9b, 1
0x14007dfae: je 0x14007e3dd
0x14007dfb4: test r12, r12
0x14007dfb7: je 0x14007dfd3
0x14007dfb9: movzx ecx, word ptr [r12 + 0x272]
0x14007dfc2: cmp r13, rcx
0x14007dfc5: jae 0x14007e080
0x14007dfcb: mov rsi, r12
0x14007dfce: jmp 0x14007e0aa
0x14007dfd3: test r13, r13
0x14007dfd6: je 0x14007e00e
0x14007dfd8: mov rcx, r13
0x14007dfdb: mov r12, r8
0x14007dfde: and rcx, 7
0x14007dfe2: je 0x14007e013
0x14007dfe4: xor r8d, r8d
0x14007dfe7: nop word ptr [rax + rax]
0x14007dff0: mov r12, qword ptr [r12 + 0x278]
0x14007dff8: inc r8
0x14007dffb: cmp rcx, r8
0x14007dffe: jne 0x14007dff0
0x14007e000: mov rcx, r13
0x14007e003: sub rcx, r8
0x14007e006: cmp r13, 8
0x14007e00a: jae 0x14007e020
0x14007e00c: jmp 0x14007e05f
0x14007e00e: mov r12, r8
0x14007e011: jmp 0x14007e05f
0x14007e013: mov rcx, r13
0x14007e016: cmp r13, 8
0x14007e01a: jb 0x14007e05f
0x14007e01c: nop dword ptr [rax]
0x14007e020: mov r8, qword ptr [r12 + 0x278]
0x14007e028: mov r8, qword ptr [r8 + 0x278]
0x14007e02f: mov r8, qword ptr [r8 + 0x278]
0x14007e036: mov r8, qword ptr [r8 + 0x278]
0x14007e03d: mov r8, qword ptr [r8 + 0x278]
0x14007e044: mov r8, qword ptr [r8 + 0x278]
0x14007e04b: mov r8, qword ptr [r8 + 0x278]
0x14007e052: mov r12, qword ptr [r8 + 0x278]
0x14007e059: add rcx, -8
0x14007e05d: jne 0x14007e020
0x14007e05f: xor r8d, r8d
0x14007e062: xor r13d, r13d
0x14007e065: movzx ecx, word ptr [r12 + 0x272]
0x14007e06e: cmp r13, rcx
0x14007e071: jb 0x14007dfcb
0x14007e077: nop word ptr [rax + rax]
0x14007e080: mov rsi, qword ptr [r12 + 0x160]
0x14007e088: test rsi, rsi
0x14007e08b: je 0x14007e3bf
0x14007e091: inc r8
0x14007e094: movzx r13d, word ptr [r12 + 0x270]
0x14007e09d: mov r12, rsi
0x14007e0a0: cmp r13w, word ptr [rsi + 0x272]
0x14007e0a8: jae 0x14007e080
0x14007e0aa: test r8, r8
0x14007e0ad: je 0x14007e140
0x14007e0b3: lea rcx, [rsi + r13*8]
0x14007e0b7: add rcx, 0x280
0x14007e0be: mov r9, r8
0x14007e0c1: and r9, 7
0x14007e0c5: je 0x14007e1ad
0x14007e0cb: xor r10d, r10d
0x14007e0ce: nop
0x14007e0d0: mov r12, qword ptr [rcx]
0x14007e0d3: lea rcx, [r12 + 0x278]
0x14007e0db: inc r10
0x14007e0de: cmp r9, r10
0x14007e0e1: jne 0x14007e0d0
0x14007e0e3: mov r9, r8
0x14007e0e6: sub r9, r10
0x14007e0e9: cmp r8, 8
0x14007e0ed: jb 0x14007e132
0x14007e0ef: nop
0x14007e0f0: mov rcx, qword ptr [rcx]
0x14007e0f3: mov rcx, qword ptr [rcx + 0x278]
0x14007e0fa: mov rcx, qword ptr [rcx + 0x278]
0x14007e101: mov rcx, qword ptr [rcx + 0x278]
0x14007e108: mov rcx, qword ptr [rcx + 0x278]
0x14007e10f: mov rcx, qword ptr [rcx + 0x278]
0x14007e116: mov rcx, qword ptr [rcx + 0x278]
0x14007e11d: mov r12, qword ptr [rcx + 0x278]
0x14007e124: lea rcx, [r12 + 0x278]
0x14007e12c: add r9, -8
0x14007e130: jne 0x14007e0f0
0x14007e132: xor r9d, r9d
0x14007e135: sub r11, 1
0x14007e139: jae 0x14007e151
0x14007e13b: jmp 0x14007de9a
0x14007e140: lea r9, [r13 + 1]
0x14007e144: mov r12, rsi
0x14007e147: sub r11, 1
0x14007e14b: jb 0x14007de9a
0x14007e151: test dl, 1
0x14007e154: je 0x14007e3dd
0x14007e15a: test r15, r15
0x14007e15d: je 0x14007e178
0x14007e15f: movzx ecx, word ptr [r15 + 0x272]
0x14007e167: cmp r14, rcx
0x14007e16a: jae 0x14007e230
0x14007e170: mov rdi, r15
0x14007e173: jmp 0x14007e258
0x14007e178: test r14, r14
0x14007e17b: je 0x14007e1bf
0x14007e17d: mov rcx, r14
0x14007e180: mov r15, rax
0x14007e183: and rcx, 7
0x14007e187: je 0x14007e1c4
0x14007e189: xor edx, edx
0x14007e18b: nop dword ptr [rax + rax]
0x14007e190: mov r15, qword ptr [r15 + 0x278]
0x14007e197: inc rdx
0x14007e19a: cmp rcx, rdx
0x14007e19d: jne 0x14007e190
0x14007e19f: mov rax, r14
0x14007e1a2: sub rax, rdx
0x14007e1a5: cmp r14, 8
0x14007e1a9: jae 0x14007e1d0
0x14007e1ab: jmp 0x14007e20e
0x14007e1ad: mov r9, r8
0x14007e1b0: cmp r8, 8
0x14007e1b4: jb 0x14007e132
0x14007e1ba: jmp 0x14007e0f0
0x14007e1bf: mov r15, rax
0x14007e1c2: jmp 0x14007e20e
0x14007e1c4: mov rax, r14
0x14007e1c7: cmp r14, 8
0x14007e1cb: jb 0x14007e20e
0x14007e1cd: nop dword ptr [rax]
0x14007e1d0: mov rcx, qword ptr [r15 + 0x278]
0x14007e1d7: mov rcx, qword ptr [rcx + 0x278]
0x14007e1de: mov rcx, qword ptr [rcx + 0x278]
0x14007e1e5: mov rcx, qword ptr [rcx + 0x278]
0x14007e1ec: mov rcx, qword ptr [rcx + 0x278]
0x14007e1f3: mov rcx, qword ptr [rcx + 0x278]
0x14007e1fa: mov rcx, qword ptr [rcx + 0x278]
0x14007e201: mov r15, qword ptr [rcx + 0x278]
0x14007e208: add rax, -8
0x14007e20c: jne 0x14007e1d0
0x14007e20e: xor r14d, r14d
0x14007e211: xor eax, eax
0x14007e213: movzx ecx, word ptr [r15 + 0x272]
0x14007e21b: cmp r14, rcx
0x14007e21e: jb 0x14007e170
0x14007e224: nop word ptr cs:[rax + rax]
0x14007e230: mov rdi, qword ptr [r15 + 0x160]
0x14007e237: test rdi, rdi
0x14007e23a: je 0x14007e3ce
0x14007e240: inc rax
0x14007e243: movzx r14d, word ptr [r15 + 0x270]
0x14007e24b: mov r15, rdi
0x14007e24e: cmp r14w, word ptr [rdi + 0x272]
0x14007e256: jae 0x14007e230
0x14007e258: test rax, rax
0x14007e25b: je 0x14007e2eb
0x14007e261: lea rcx, [rdi + r14*8]
0x14007e265: add rcx, 0x280
0x14007e26c: mov rdx, rax
0x14007e26f: and rdx, 7
0x14007e273: je 0x14007e385
0x14007e279: xor r8d, r8d
0x14007e27c: nop dword ptr [rax]
0x14007e280: mov r15, qword ptr [rcx]
0x14007e283: lea rcx, [r15 + 0x278]
0x14007e28a: inc r8
0x14007e28d: cmp rdx, r8
0x14007e290: jne 0x14007e280
0x14007e292: mov rdx, rax
0x14007e295: sub rdx, r8
0x14007e298: cmp rax, 8
0x14007e29c: jb 0x14007e2e1
0x14007e29e: nop
0x14007e2a0: mov rax, qword ptr [rcx]
0x14007e2a3: mov rax, qword ptr [rax + 0x278]
0x14007e2aa: mov rax, qword ptr [rax + 0x278]
0x14007e2b1: mov rax, qword ptr [rax + 0x278]
0x14007e2b8: mov rax, qword ptr [rax + 0x278]
0x14007e2bf: mov rax, qword ptr [rax + 0x278]
0x14007e2c6: mov rax, qword ptr [rax + 0x278]
0x14007e2cd: mov r15, qword ptr [rax + 0x278]
0x14007e2d4: lea rcx, [r15 + 0x278]
0x14007e2db: add rdx, -8
0x14007e2df: jne 0x14007e2a0
0x14007e2e1: mov qword ptr [rbp - 8], 0
0x14007e2e9: jmp 0x14007e2f6
0x14007e2eb: lea rax, [r14 + 1]
0x14007e2ef: mov qword ptr [rbp - 8], rax
0x14007e2f3: mov r15, rdi
0x14007e2f6: lea rax, [r13*2]
0x14007e2fe: add rax, r13
0x14007e301: lea rax, [rsi + rax*8]
0x14007e305: add rax, 0x168
0x14007e30b: lea rcx, [r14 + r14*2]
0x14007e30f: mov r8, qword ptr [rax + 0x10]
0x14007e313: cmp r8, qword ptr [rdi + rcx*8 + 0x178]
0x14007e31b: jne 0x14007e397
0x14007e31d: mov qword ptr [rbp - 0x10], r9
0x14007e321: mov qword ptr [rbp - 0x18], rbx
0x14007e325: mov rbx, r11
0x14007e328: lea rcx, [rdi + rcx*8]
0x14007e32c: add rcx, 0x168
0x14007e333: mov rdx, qword ptr [rcx + 8]
0x14007e337: mov rcx, qword ptr [rax + 8]
0x14007e33b: call 0x145bfa0e1
0x14007e340: test eax, eax
0x14007e342: jne 0x14007e397
0x14007e344: shl r13, 5
0x14007e348: add rsi, r13
0x14007e34b: shl r14, 5
0x14007e34f: add rdi, r14
0x14007e352: mov rcx, rsi
0x14007e355: mov rdx, rdi
0x14007e358: call 0x14007de60
0x14007e35d: mov ecx, eax
0x14007e35f: mov dl, 1
0x14007e361: xor eax, eax
0x14007e363: mov r8d, 0
0x14007e369: mov r9b, 1
0x14007e36c: test cl, cl
0x14007e36e: mov r11, rbx
0x14007e371: mov rbx, qword ptr [rbp - 0x18]
0x14007e375: mov r14, qword ptr [rbp - 8]
0x14007e379: mov r13, qword ptr [rbp - 0x10]
0x14007e37d: jne 0x14007dfa0
0x14007e383: jmp 0x14007e399
0x14007e385: mov rdx, rax
0x14007e388: cmp rax, 8
0x14007e38c: jb 0x14007e2e1
0x14007e392: jmp 0x14007e2a0
0x14007e397: xor eax, eax
0x14007e399: add rsp, 0x48
0x14007e39d: pop rbx
0x14007e39e: pop rdi
0x14007e39f: pop rsi
0x14007e3a0: pop r12
0x14007e3a2: pop r13
0x14007e3a4: pop r14
0x14007e3a6: pop r15
0x14007e3a8: pop rbp
0x14007e3a9: ret
0x14007e3aa: movsd xmm0, qword ptr [rdx + 0x10]
0x14007e3af: cmpeqsd xmm0, qword ptr [rcx + 0x10]
0x14007e3b5: movq rax, xmm0
0x14007e3ba: and eax, 1
0x14007e3bd: jmp 0x14007e399
0x14007e3bf: lea rcx, [rip + 0x5d50012]
0x14007e3c6: call 0x145d995b0
0x14007e3cb: nop
0x14007e3cc: jmp 0x14007e3db
0x14007e3ce: lea rcx, [rip + 0x5d50003]
0x14007e3d5: call 0x145d995b0
0x14007e3da: nop
0x14007e3db: ud2
0x14007e3dd: lea rcx, [rip + 0x5d5282c]
0x14007e3e4: call 0x145d995b0
0x14007e3e9: ud2
