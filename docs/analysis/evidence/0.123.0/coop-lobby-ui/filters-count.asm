0x140287190: push rbp
0x140287191: push r15
0x140287193: push r14
0x140287195: push r13
0x140287197: push r12
0x140287199: push rsi
0x14028719a: push rdi
0x14028719b: push rbx
0x14028719c: sub rsp, 0x1e8
0x1402871a3: lea rbp, [rsp + 0x80]
0x1402871ab: mov qword ptr [rbp + 0x160], 0xfffffffffffffffe
0x1402871b6: mov rbx, r8
0x1402871b9: mov rsi, rdx
0x1402871bc: mov rax, qword ptr [rcx]
0x1402871bf: mov rdx, qword ptr [rcx + 0x28]
0x1402871c3: mov qword ptr [rbp - 0x20], rax
0x1402871c7: movups xmm0, xmmword ptr [rcx + 8]
0x1402871cb: movups xmmword ptr [rbp - 0x18], xmm0
0x1402871cf: mov qword ptr [rbp + 0x78], rcx
0x1402871d3: movups xmm0, xmmword ptr [rcx + 0x18]
0x1402871d7: movups xmmword ptr [rbp - 8], xmm0
0x1402871db: mov qword ptr [rbp + 8], rdx
0x1402871df: mov byte ptr [rbp + 0x80], 0xa
0x1402871e6: lea rcx, [rip + 0x5f8aa1a]
0x1402871ed: mov edx, 8
0x1402871f2: call 0x145bbfea0
0x1402871f7: movzx ecx, byte ptr [rbx + 0x16e]
0x1402871fe: mov byte ptr [rbp + 0x15f], cl
0x140287204: mov byte ptr [rsp + 0x28], cl
0x140287208: mov qword ptr [rsp + 0x20], rdx
0x14028720d: lea r14, [rbp - 0x20]
0x140287211: lea r8, [rbp + 0x80]
0x140287218: mov rcx, r14
0x14028721b: mov rdx, rsi
0x14028721e: mov r9, rax
0x140287221: call 0x140148ec0
0x140287226: mov byte ptr [rbp + 0x80], 0xb
0x14028722d: lea rcx, [rip + 0x5f8a9db]
0x140287234: mov edx, 0xb
0x140287239: call 0x145bbfea0
0x14028723e: movzx edi, byte ptr [rbx + 0x16f]
0x140287245: mov byte ptr [rsp + 0x28], dil
0x14028724a: mov qword ptr [rsp + 0x20], rdx
0x14028724f: lea r8, [rbp + 0x80]
0x140287256: mov rcx, r14
0x140287259: mov qword ptr [rbp + 0x148], rsi
0x140287260: mov rdx, rsi
0x140287263: mov r9, rax
0x140287266: call 0x140148ec0
0x14028726b: mov rsi, qword ptr [rbx + 0x148]
0x140287272: cmp rsi, -1
0x140287276: je 0x1402872fc
0x14028727c: lea rax, [rbx + 0x148]
0x140287283: mov qword ptr [rbp + 0x30], rax
0x140287287: lea rcx, [rip + 0x5f8a995]
0x14028728e: mov edx, 0xc
0x140287293: call 0x145bbfea0
0x140287298: mov r8, rdx
0x14028729b: lea rcx, [rip + 0x5f86dee]
0x1402872a2: mov qword ptr [rbp + 0x80], rcx
0x1402872a9: mov qword ptr [rbp + 0x88], 4
0x1402872b4: lea rcx, [rbp + 0x30]
0x1402872b8: mov qword ptr [rbp + 0x90], rcx
0x1402872bf: lea rcx, [rip + 0x5f8a96a]
0x1402872c6: mov qword ptr [rbp + 0x98], rcx
0x1402872cd: mov qword ptr [rsp + 0x20], 1
0x1402872d6: lea rcx, [rbp + 0x128]
0x1402872dd: lea r9, [rbp + 0x80]
0x1402872e4: mov rdx, rax
0x1402872e7: call 0x145bc0330
0x1402872ec: mov r9, qword ptr [rbp + 0x130]
0x1402872f3: mov r14, qword ptr [rbp + 0x138]
0x1402872fa: jmp 0x140287378
0x1402872fc: lea rcx, [rip + 0x5f8a917]
0x140287303: mov edx, 9
0x140287308: call 0x145bbfea0
0x14028730d: mov r14, rdx
0x140287310: test rdx, rdx
0x140287313: jns 0x140287325
0x140287315: xor r12d, r12d
0x140287318: mov rcx, r12
0x14028731b: mov rdx, r14
0x14028731e: call 0x1461add5b
0x140287323: ud2 
0x140287325: je 0x14028735d
0x140287327: mov r15, rax
0x14028732a: call 0x140002200
0x14028732f: mov r12d, 1
0x140287335: mov edx, 1
0x14028733a: mov rcx, r14
0x14028733d: call 0x1400021c0
0x140287342: test rax, rax
0x140287345: je 0x140287318
0x140287347: mov rcx, rax
0x14028734a: mov rdx, r15
0x14028734d: mov r8, r14
0x140287350: mov r15, rax
0x140287353: call 0x14600504b
0x140287358: mov r9, r15
0x14028735b: jmp 0x140287363
0x14028735d: mov r9d, 1
0x140287363: mov qword ptr [rbp + 0x128], r14
0x14028736a: mov qword ptr [rbp + 0x130], r9
0x140287371: mov qword ptr [rbp + 0x138], r14
0x140287378: mov rdx, qword ptr [rbp + 0x148]
0x14028737f: mov byte ptr [rbp + 0x80], 0xc
0x140287386: cmp rsi, -1
0x14028738a: setne byte ptr [rsp + 0x28]
0x14028738f: mov qword ptr [rsp + 0x20], r14
0x140287394: lea rcx, [rbp - 0x20]
0x140287398: lea r8, [rbp + 0x80]
0x14028739f: call 0x140148ec0
0x1402873a4: nop 
0x1402873a5: mov r13, qword ptr [rbx]
0x1402873a8: cmp r13, 1
0x1402873ac: jne 0x140287462
0x1402873b2: mov r12, qword ptr [rbx + 8]
0x1402873b6: lea rcx, [rip + 0x5f8a8a2]
0x1402873bd: mov edx, 0x18
0x1402873c2: call 0x145bbfea0
0x1402873c7: nop 
0x1402873c8: mov r14, rax
0x1402873cb: mov r15, rdx
0x1402873ce: mov ecx, r12d
0x1402873d1: call 0x145be05d0
0x1402873d6: nop 
0x1402873d7: lea r12, [rbp + 0x30]
0x1402873db: mov rcx, r12
0x1402873de: mov edx, eax
0x1402873e0: call 0x145be05e0
0x1402873e5: nop 
0x1402873e6: lea rax, [rip + 0x5f8a7ba]
0x1402873ed: mov qword ptr [rbp + 0x80], rax
0x1402873f4: mov qword ptr [rbp + 0x88], 0xa
0x1402873ff: mov qword ptr [rbp + 0x90], r12
0x140287406: lea rax, [rip + 0x5f86c63]
0x14028740d: mov qword ptr [rbp + 0x98], rax
0x140287414: mov qword ptr [rsp + 0x20], 1
0x14028741d: lea rcx, [rbp + 0x108]
0x140287424: lea r9, [rbp + 0x80]
0x14028742b: mov rdx, r14
0x14028742e: mov r8, r15
0x140287431: call 0x145bc0330
0x140287436: nop 
0x140287437: mov rdx, qword ptr [rbp + 0x30]
0x14028743b: test rdx, rdx
0x14028743e: je 0x14028744f
0x140287440: mov rcx, qword ptr [rbp + 0x38]
0x140287444: mov r8d, 1
0x14028744a: call 0x1400021d0
0x14028744f: mov r9, qword ptr [rbp + 0x110]
0x140287456: mov r14, qword ptr [rbp + 0x118]
0x14028745d: jmp 0x1402874ee
0x140287462: lea rcx, [rip + 0x5f8a7e7]
0x140287469: mov edx, 0xf
0x14028746e: call 0x145bbfea0
0x140287473: nop 
0x140287474: mov r14, rdx
0x140287477: test rdx, rdx
0x14028747a: jns 0x140287490
0x14028747c: xor r12d, r12d
0x14028747f: mov rcx, r12
0x140287482: mov rdx, r14
0x140287485: call 0x1461add5b
0x14028748a: nop 
0x14028748b: jmp 0x140287c15
0x140287490: test r14, r14
0x140287493: je 0x1402874d3
0x140287495: mov qword ptr [rbp + 0x150], rax
0x14028749c: call 0x140002200
0x1402874a1: mov r12d, 1
0x1402874a7: mov edx, 1
0x1402874ac: mov rcx, r14
0x1402874af: call 0x1400021c0
0x1402874b4: test rax, rax
0x1402874b7: je 0x14028747f
0x1402874b9: mov r15, rax
0x1402874bc: mov rcx, rax
0x1402874bf: mov rdx, qword ptr [rbp + 0x150]
0x1402874c6: mov r8, r14
0x1402874c9: call 0x14600504b
0x1402874ce: mov r9, r15
0x1402874d1: jmp 0x1402874d9
0x1402874d3: mov r9d, 1
0x1402874d9: mov qword ptr [rbp + 0x108], r14
0x1402874e0: mov qword ptr [rbp + 0x110], r9
0x1402874e7: mov qword ptr [rbp + 0x118], r14
0x1402874ee: mov rdx, qword ptr [rbp + 0x148]
0x1402874f5: mov byte ptr [rbp + 0x80], 0xd
0x1402874fc: mov byte ptr [rsp + 0x28], r13b
0x140287501: mov qword ptr [rsp + 0x20], r14
0x140287506: lea rcx, [rbp - 0x20]
0x14028750a: lea r8, [rbp + 0x80]
0x140287511: mov qword ptr [rbp + 0x120], r9
0x140287518: call 0x140148ec0
0x14028751d: nop 
0x14028751e: mov r10, qword ptr [rbx + 0x80]
0x140287525: test r10, r10
0x140287528: mov qword ptr [rbp + 0x150], r10
0x14028752f: je 0x1402875d6
0x140287535: mov r12, qword ptr [rbx + 0x78]
0x140287539: xor r13b, 1
0x14028753d: mov r15, qword ptr [rbx + 8]
0x140287541: cmp rsi, -1
0x140287545: je 0x1402875dd
0x14028754b: mov r14, qword ptr [rbx + 0x158]
0x140287552: mov rbx, qword ptr [rbx + 0x150]
0x140287559: cmp byte ptr [rbp + 0x15f], 0
0x140287560: je 0x140287606
0x140287566: test dil, dil
0x140287569: je 0x1402876a8
0x14028756f: add r12, 0x121
0x140287576: xor esi, esi
0x140287578: mov rdi, qword ptr [rbp + 0x150]
0x14028757f: nop 
0x140287580: cmp byte ptr [r12 - 1], 1
0x140287586: jne 0x1402875b0
0x140287588: cmp byte ptr [r12], 0
0x14028758d: jne 0x1402875b0
0x14028758f: cmp r14, qword ptr [r12 - 0x81]
0x140287597: jne 0x1402875b0
0x140287599: mov rdx, qword ptr [r12 - 0x89]
0x1402875a1: mov rcx, rbx
0x1402875a4: mov r8, r14
0x1402875a7: call 0x146005051
0x1402875ac: test eax, eax
0x1402875ae: je 0x1402875c6
0x1402875b0: xor eax, eax
0x1402875b2: add rsi, rax
0x1402875b5: add r12, 0x128
0x1402875bc: dec rdi
0x1402875bf: jne 0x140287580
0x1402875c1: jmp 0x140287a05
0x1402875c6: cmp r15, qword ptr [r12 - 0x19]
0x1402875cb: sete al
0x1402875ce: or al, r13b
0x1402875d1: movzx eax, al
0x1402875d4: jmp 0x1402875b2
0x1402875d6: xor esi, esi
0x1402875d8: jmp 0x140287a05
0x1402875dd: cmp byte ptr [rbp + 0x15f], 0
0x1402875e4: je 0x14028768c
0x1402875ea: test dil, dil
0x1402875ed: je 0x140287781
0x1402875f3: cmp r10, 1
0x1402875f7: jne 0x1402877a7
0x1402875fd: xor eax, eax
0x1402875ff: xor esi, esi
0x140287601: jmp 0x140287997
0x140287606: add r12, 0x98
0x14028760d: xor esi, esi
0x14028760f: test dil, dil
0x140287612: je 0x14028771c
0x140287618: mov rdi, qword ptr [rbp + 0x150]
0x14028761f: jmp 0x140287645
0x140287621: nop word ptr cs:[rax + rax]
0x140287630: xor eax, eax
0x140287632: add rsi, rax
0x140287635: add r12, 0x128
0x14028763c: dec rdi
0x14028763f: je 0x140287a05
0x140287645: cmp byte ptr [r12 + 0x89], 0
0x14028764e: jne 0x140287630
0x140287650: cmp r14, qword ptr [r12 + 8]
0x140287655: jne 0x140287630
0x140287657: mov rdx, qword ptr [r12]
0x14028765b: mov rcx, rbx
0x14028765e: mov r8, r14
0x140287661: call 0x146005051
0x140287666: test eax, eax
0x140287668: jne 0x140287630
0x14028766a: cmp r15, qword ptr [r12 + 0x70]
0x14028766f: sete al
0x140287672: or al, r13b
0x140287675: movzx eax, al
0x140287678: add rsi, rax
0x14028767b: add r12, 0x128
0x140287682: dec rdi
0x140287685: jne 0x140287645
0x140287687: jmp 0x140287a05
0x14028768c: test dil, dil
0x14028768f: je 0x140287794
0x140287695: cmp r10, 1
0x140287699: jne 0x140287828
0x14028769f: xor eax, eax
0x1402876a1: xor esi, esi
0x1402876a3: jmp 0x1402879bf
0x1402876a8: add r12, 0x98
0x1402876af: xor esi, esi
0x1402876b1: mov rdi, qword ptr [rbp + 0x150]
0x1402876b8: jmp 0x1402876d5
0x1402876ba: nop word ptr [rax + rax]
0x1402876c0: xor eax, eax
0x1402876c2: add rsi, rax
0x1402876c5: add r12, 0x128
0x1402876cc: dec rdi
0x1402876cf: je 0x140287a05
0x1402876d5: cmp byte ptr [r12 + 0x88], 1
0x1402876de: jne 0x1402876c0
0x1402876e0: cmp r14, qword ptr [r12 + 8]
0x1402876e5: jne 0x1402876c0
0x1402876e7: mov rdx, qword ptr [r12]
0x1402876eb: mov rcx, rbx
0x1402876ee: mov r8, r14
0x1402876f1: call 0x146005051
0x1402876f6: test eax, eax
0x1402876f8: jne 0x1402876c0
0x1402876fa: cmp r15, qword ptr [r12 + 0x70]
0x1402876ff: sete al
0x140287702: or al, r13b
0x140287705: movzx eax, al
0x140287708: add rsi, rax
0x14028770b: add r12, 0x128
0x140287712: dec rdi
0x140287715: jne 0x1402876d5
0x140287717: jmp 0x140287a05
0x14028771c: mov rdi, qword ptr [rbp + 0x150]
0x140287723: jmp 0x140287745
0x140287725: nop word ptr cs:[rax + rax]
0x140287730: xor eax, eax
0x140287732: add rsi, rax
0x140287735: add r12, 0x128
0x14028773c: dec rdi
0x14028773f: je 0x140287a05
0x140287745: cmp r14, qword ptr [r12 + 8]
0x14028774a: jne 0x140287730
0x14028774c: mov rdx, qword ptr [r12]
0x140287750: mov rcx, rbx
0x140287753: mov r8, r14
0x140287756: call 0x146005051
0x14028775b: test eax, eax
0x14028775d: jne 0x140287730
0x14028775f: cmp r15, qword ptr [r12 + 0x70]
0x140287764: sete al
0x140287767: or al, r13b
0x14028776a: movzx eax, al
0x14028776d: add rsi, rax
0x140287770: add r12, 0x128
0x140287777: dec rdi
0x14028777a: jne 0x140287745
0x14028777c: jmp 0x140287a05
0x140287781: cmp r10, 1
0x140287785: jne 0x14028789c
0x14028778b: xor eax, eax
0x14028778d: xor esi, esi
0x14028778f: jmp 0x1402879ee
0x140287794: cmp r10, 1
0x140287798: jne 0x14028791d
0x14028779e: xor eax, eax
0x1402877a0: xor esi, esi
0x1402877a2: jmp 0x140287970
0x1402877a7: mov rcx, r10
0x1402877aa: and rcx, 0xfffffffffffffffe
0x1402877ae: lea rdx, [r12 + 0x249]
0x1402877b6: xor eax, eax
0x1402877b8: xor esi, esi
0x1402877ba: jmp 0x1402877dd
0x1402877bc: nop dword ptr [rax]
0x1402877c0: xor r9d, r9d
0x1402877c3: add rsi, r8
0x1402877c6: add rsi, r9
0x1402877c9: add rax, 2
0x1402877cd: add rdx, 0x250
0x1402877d4: cmp rcx, rax
0x1402877d7: je 0x140287991
0x1402877dd: cmp byte ptr [rdx - 0x129], 1
0x1402877e4: jne 0x1402877ef
0x1402877e6: cmp byte ptr [rdx - 0x128], 0
0x1402877ed: je 0x1402877fa
0x1402877ef: xor r8d, r8d
0x1402877f2: cmp byte ptr [rdx - 1], 1
0x1402877f6: jne 0x1402877c0
0x1402877f8: jmp 0x140287812
0x1402877fa: cmp r15, qword ptr [rdx - 0x141]
0x140287801: sete r8b
0x140287805: or r8b, r13b
0x140287808: movzx r8d, r8b
0x14028780c: cmp byte ptr [rdx - 1], 1
0x140287810: jne 0x1402877c0
0x140287812: cmp byte ptr [rdx], 0
0x140287815: jne 0x1402877c0
0x140287817: cmp r15, qword ptr [rdx - 0x19]
0x14028781b: sete r9b
0x14028781f: or r9b, r13b
0x140287822: movzx r9d, r9b
0x140287826: jmp 0x1402877c3
0x140287828: mov rcx, r10
0x14028782b: and rcx, 0xfffffffffffffffe
0x14028782f: lea rdx, [r12 + 0x249]
0x140287837: xor eax, eax
0x140287839: xor esi, esi
0x14028783b: jmp 0x140287869
0x14028783d: nop dword ptr [rax]
0x140287840: cmp r15, qword ptr [rdx - 0x19]
0x140287844: sete r9b
0x140287848: or r9b, r13b
0x14028784b: movzx r9d, r9b
0x14028784f: add rsi, r8
0x140287852: add rsi, r9
0x140287855: add rax, 2
0x140287859: add rdx, 0x250
0x140287860: cmp rcx, rax
0x140287863: je 0x1402879b9
0x140287869: cmp byte ptr [rdx - 0x128], 0
0x140287870: je 0x140287880
0x140287872: xor r8d, r8d
0x140287875: cmp byte ptr [rdx], 0
0x140287878: je 0x140287840
0x14028787a: jmp 0x140287897
0x14028787c: nop dword ptr [rax]
0x140287880: cmp r15, qword ptr [rdx - 0x141]
0x140287887: sete r8b
0x14028788b: or r8b, r13b
0x14028788e: movzx r8d, r8b
0x140287892: cmp byte ptr [rdx], 0
0x140287895: je 0x140287840
0x140287897: xor r9d, r9d
0x14028789a: jmp 0x14028784f
0x14028789c: mov rcx, r10
0x14028789f: and rcx, 0xfffffffffffffffe
0x1402878a3: lea rdx, [r12 + 0x248]
0x1402878ab: xor eax, eax
0x1402878ad: xor esi, esi
0x1402878af: jmp 0x1402878e9
0x1402878b1: nop word ptr cs:[rax + rax]
0x1402878c0: cmp r15, qword ptr [rdx - 0x18]
0x1402878c4: sete r9b
0x1402878c8: or r9b, r13b
0x1402878cb: movzx r9d, r9b
0x1402878cf: add rsi, r8
0x1402878d2: add rsi, r9
0x1402878d5: add rax, 2
0x1402878d9: add rdx, 0x250
0x1402878e0: cmp rcx, rax
0x1402878e3: je 0x1402879e8
0x1402878e9: cmp byte ptr [rdx - 0x128], 1
0x1402878f0: jne 0x140287910
0x1402878f2: cmp r15, qword ptr [rdx - 0x140]
0x1402878f9: sete r8b
0x1402878fd: or r8b, r13b
0x140287900: movzx r8d, r8b
0x140287904: cmp byte ptr [rdx], 1
0x140287907: je 0x1402878c0
0x140287909: jmp 0x140287918
0x14028790b: nop dword ptr [rax + rax]
0x140287910: xor r8d, r8d
0x140287913: cmp byte ptr [rdx], 1
0x140287916: je 0x1402878c0
0x140287918: xor r9d, r9d
0x14028791b: jmp 0x1402878cf
0x14028791d: mov rcx, r10
0x140287920: and rcx, 0xfffffffffffffffe
0x140287924: lea rdx, [r12 + 0x230]
0x14028792c: xor eax, eax
0x14028792e: xor esi, esi
0x140287930: cmp r15, qword ptr [rdx - 0x128]
0x140287937: sete r8b
0x14028793b: or r8b, r13b
0x14028793e: movzx r8d, r8b
0x140287942: add r8, rsi
0x140287945: cmp r15, qword ptr [rdx]
0x140287948: sete r9b
0x14028794c: or r9b, r13b
0x14028794f: movzx esi, r9b
0x140287953: add rsi, r8
0x140287956: add rax, 2
0x14028795a: add rdx, 0x250
0x140287961: cmp rcx, rax
0x140287964: jne 0x140287930
0x140287966: test r10b, 1
0x14028796a: je 0x140287a05
0x140287970: mov rcx, rsi
0x140287973: imul rax, rax, 0x128
0x14028797a: cmp r15, qword ptr [r12 + rax + 0x108]
0x140287982: sete al
0x140287985: or r13b, al
0x140287988: movzx esi, r13b
0x14028798c: add rsi, rcx
0x14028798f: jmp 0x140287a05
0x140287991: test r10b, 1
0x140287995: je 0x140287a05
0x140287997: imul rax, rax, 0x128
0x14028799e: cmp byte ptr [r12 + rax + 0x120], 1
0x1402879a7: jne 0x140287a00
0x1402879a9: add r12, rax
0x1402879ac: cmp byte ptr [r12 + 0x121], 0
0x1402879b5: je 0x1402879d4
0x1402879b7: jmp 0x140287a00
0x1402879b9: test r10b, 1
0x1402879bd: je 0x140287a05
0x1402879bf: imul rax, rax, 0x128
0x1402879c6: cmp byte ptr [r12 + rax + 0x121], 0
0x1402879cf: jne 0x140287a00
0x1402879d1: add r12, rax
0x1402879d4: cmp r15, qword ptr [r12 + 0x108]
0x1402879dc: sete al
0x1402879df: or r13b, al
0x1402879e2: movzx eax, r13b
0x1402879e6: jmp 0x140287a02
0x1402879e8: test r10b, 1
0x1402879ec: je 0x140287a05
0x1402879ee: imul rax, rax, 0x128
0x1402879f5: cmp byte ptr [r12 + rax + 0x120], 1
0x1402879fe: je 0x1402879d1
0x140287a00: xor eax, eax
0x140287a02: add rsi, rax
0x140287a05: mov qword ptr [rbp + 0x70], rsi
0x140287a09: mov rdi, qword ptr [rbp + 0x150]
0x140287a10: cmp rsi, rdi
0x140287a13: jae 0x140287bc1
0x140287a19: lea rcx, [rip + 0x5f8a257]
0x140287a20: mov edx, 0x16
0x140287a25: call 0x145bbfea0
0x140287a2a: nop 
0x140287a2b: mov r8, rdx
0x140287a2e: mov qword ptr [rbp + 0x28], rdi
0x140287a32: lea rcx, [rip + 0x5f8a254]
0x140287a39: mov qword ptr [rbp + 0x30], rcx
0x140287a3d: mov qword ptr [rbp + 0x38], 5
0x140287a45: lea rcx, [rbp + 0x70]
0x140287a49: mov qword ptr [rbp + 0x40], rcx
0x140287a4d: lea rcx, [rip + 0x5f86384]
0x140287a54: mov qword ptr [rbp + 0x48], rcx
0x140287a58: lea rdx, [rip + 0x5f8639d]
0x140287a5f: mov qword ptr [rbp + 0x50], rdx
0x140287a63: mov qword ptr [rbp + 0x58], 3
0x140287a6b: lea rdx, [rbp + 0x28]
0x140287a6f: mov qword ptr [rbp + 0x60], rdx
0x140287a73: mov qword ptr [rbp + 0x68], rcx
0x140287a77: mov qword ptr [rsp + 0x20], 2
0x140287a80: lea rcx, [rbp - 0x50]
0x140287a84: lea r9, [rbp + 0x30]
0x140287a88: mov rdx, rax
0x140287a8b: call 0x145bc0330
0x140287a90: nop 
0x140287a91: mov rdx, qword ptr [rbp + 0x148]
0x140287a98: cmp byte ptr [rdx], 1
0x140287a9b: jne 0x140287abc
0x140287a9d: mov eax, dword ptr [rdx + 1]
0x140287aa0: mov ecx, dword ptr [rdx + 4]
0x140287aa3: mov dword ptr [rbp + 0x143], ecx
0x140287aa9: mov dword ptr [rbp + 0x140], eax
0x140287aaf: mov rax, qword ptr [rdx + 8]
0x140287ab3: movzx ecx, byte ptr [rdx + 0x10]
0x140287ab7: mov r8b, 1
0x140287aba: jmp 0x140287acd
0x140287abc: mov rax, qword ptr [rdx + 8]
0x140287ac0: lock inc qword ptr [rax]
0x140287ac4: jle 0x140287c15
0x140287aca: xor r8d, r8d
0x140287acd: lea rdx, [rbp - 0x18]
0x140287ad1: mov r9, qword ptr [rbp - 0x40]
0x140287ad5: mov qword ptr [rbp + 0x98], r9
0x140287adc: movups xmm0, xmmword ptr [rbp - 0x50]
0x140287ae0: movups xmmword ptr [rbp + 0x88], xmm0
0x140287ae7: movups xmm0, xmmword ptr [rip + 0x5f861ee]
0x140287aee: movups xmmword ptr [rbp + 0x14], xmm0
0x140287af2: mov dword ptr [rbp + 0x24], 0x3f800000
0x140287af9: mov r9, qword ptr [rbp - 0x20]
0x140287afd: mov qword ptr [rbp + 0xa0], 0
0x140287b08: mov qword ptr [rbp + 0xa8], 4
0x140287b13: mov qword ptr [rbp + 0xb0], 0
0x140287b1e: mov byte ptr [rbp + 0xb8], r8b
0x140287b25: mov r8d, dword ptr [rbp + 0x140]
0x140287b2c: mov r10d, dword ptr [rbp + 0x143]
0x140287b33: mov dword ptr [rbp + 0xb9], r8d
0x140287b3a: mov dword ptr [rbp + 0xbc], r10d
0x140287b41: mov qword ptr [rbp + 0xc0], rax
0x140287b48: mov qword ptr [rbp + 0xc8], rcx
0x140287b4f: mov dword ptr [rbp + 0xd0], 0x41500000
0x140287b59: mov word ptr [rbp + 0xd4], 0x190
0x140287b62: mov byte ptr [rbp + 0xd6], 1
0x140287b69: mov rax, qword ptr [rbp + 0x20]
0x140287b6d: mov qword ptr [rbp + 0xe4], rax
0x140287b74: movups xmm0, xmmword ptr [rbp + 0x13]
0x140287b78: movups xmmword ptr [rbp + 0xd7], xmm0
0x140287b7f: mov eax, dword ptr [rip + 0x5f3c71b]
0x140287b85: mov dword ptr [rbp + 0xfc], eax
0x140287b8b: movups xmm0, xmmword ptr [rip + 0x5f3c6fe]
0x140287b92: movups xmmword ptr [rbp + 0xec], xmm0
0x140287b99: movsd xmm0, qword ptr [rip + 0x5f2a94f]
0x140287ba1: movsd qword ptr [rbp + 0x100], xmm0
0x140287ba9: mov qword ptr [rbp + 0x80], r9
0x140287bb0: lea rcx, [rbp - 0x50]
0x140287bb4: lea r8, [rbp + 0x80]
0x140287bbb: call 0x14025a890
0x140287bc0: nop 
0x140287bc1: mov rdx, qword ptr [rbp + 0x108]
0x140287bc8: test rdx, rdx
0x140287bcb: mov rcx, qword ptr [rbp + 0x120]
0x140287bd2: je 0x140287bdf
0x140287bd4: mov r8d, 1
0x140287bda: call 0x1400021d0
0x140287bdf: mov rdx, qword ptr [rbp + 0x128]
0x140287be6: test rdx, rdx
0x140287be9: je 0x140287bfd
0x140287beb: mov rcx, qword ptr [rbp + 0x130]
0x140287bf2: mov r8d, 1
0x140287bf8: call 0x1400021d0
0x140287bfd: mov rax, qword ptr [rbp + 0x78]
0x140287c01: add rsp, 0x1e8
0x140287c08: pop rbx
0x140287c09: pop rdi
0x140287c0a: pop rsi
0x140287c0b: pop r12
0x140287c0d: pop r13
0x140287c0f: pop r14
0x140287c11: pop r15
0x140287c13: pop rbp
0x140287c14: ret 
0x140287c15: ud2 
