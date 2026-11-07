0x140288f10: push r15
0x140288f12: push r14
0x140288f14: push r13
0x140288f16: push r12
0x140288f18: push rsi
0x140288f19: push rdi
0x140288f1a: push rbp
0x140288f1b: push rbx
0x140288f1c: sub rsp, 0x648
0x140288f23: movaps xmmword ptr [rsp + 0x630], xmm15
0x140288f2c: movaps xmmword ptr [rsp + 0x620], xmm14
0x140288f35: movaps xmmword ptr [rsp + 0x610], xmm13
0x140288f3e: movaps xmmword ptr [rsp + 0x600], xmm12
0x140288f47: movaps xmmword ptr [rsp + 0x5f0], xmm11
0x140288f50: movaps xmmword ptr [rsp + 0x5e0], xmm10
0x140288f59: movaps xmmword ptr [rsp + 0x5d0], xmm9
0x140288f62: movaps xmmword ptr [rsp + 0x5c0], xmm8
0x140288f6b: movaps xmmword ptr [rsp + 0x5b0], xmm7
0x140288f73: movaps xmmword ptr [rsp + 0x5a0], xmm6
0x140288f7b: mov rdi, rdx
0x140288f7e: mov rbp, rcx
0x140288f81: mov rsi, qword ptr [rcx]
0x140288f84: mov rax, qword ptr [rcx + 0x28]
0x140288f88: mov qword ptr [rsp + 0x4e0], rsi
0x140288f90: lea rbx, [rsp + 0x4e8]
0x140288f98: movups xmm0, xmmword ptr [rcx + 8]
0x140288f9c: movups xmmword ptr [rsp + 0x4e8], xmm0
0x140288fa4: movups xmm0, xmmword ptr [rcx + 0x18]
0x140288fa8: movups xmmword ptr [rsp + 0x4f8], xmm0
0x140288fb0: mov qword ptr [rsp + 0x508], rax
0x140288fb8: mov rax, qword ptr [rdx]
0x140288fbb: cmp byte ptr [rax], 1
0x140288fbe: jne 0x14028925b
0x140288fc4: movzx ecx, byte ptr [rax + 1]
0x140288fc8: mov r14, qword ptr [rdi + 0x30]
0x140288fcc: call 0x145aaf610
0x140288fd1: mov r8, qword ptr [rax + 0x60]
0x140288fd5: mov r9, qword ptr [rax + 0x68]
0x140288fd9: lea r15, [rsp + 0xa0]
0x140288fe1: mov rcx, r15
0x140288fe4: mov rdx, r14
0x140288fe7: call 0x14014d5a0
0x140288fec: lea r14, [rsp + 0x2d0]
0x140288ff4: mov rcx, r14
0x140288ff7: mov rdx, r15
0x140288ffa: call 0x1428de760
0x140288fff: movups xmm0, xmmword ptr [rip + 0x5f84ad2]
0x140289006: movaps xmmword ptr [rsp + 0xa0], xmm0
0x14028900e: mov qword ptr [rsp + 0xb0], 0
0x14028901a: movups xmm1, xmmword ptr [rip + 0x5f84acf]
0x140289021: movups xmmword ptr [rsp + 0xb8], xmm1
0x140289029: mov qword ptr [rsp + 0xc8], 0
0x140289035: movups xmm1, xmmword ptr [rip + 0x5f84acc]
0x14028903c: movaps xmmword ptr [rsp + 0xd0], xmm1
0x140289044: mov qword ptr [rsp + 0xe0], 0
0x140289050: movups xmm2, xmmword ptr [rip + 0x5f84ac9]
0x140289057: movups xmmword ptr [rsp + 0xe8], xmm2
0x14028905f: mov qword ptr [rsp + 0xf8], 0
0x14028906b: movups xmmword ptr [rsp + 0x358], xmm0
0x140289073: movups xmmword ptr [rsp + 0x388], xmm1
0x14028907b: mov rax, qword ptr [rsp + 0xb0]
0x140289083: mov qword ptr [rsp + 0x368], rax
0x14028908b: mov rax, qword ptr [rsp + 0xb8]
0x140289093: mov qword ptr [rsp + 0x370], rax
0x14028909b: mov rax, qword ptr [rsp + 0xc0]
0x1402890a3: mov qword ptr [rsp + 0x378], rax
0x1402890ab: mov rax, qword ptr [rsp + 0xc8]
0x1402890b3: mov qword ptr [rsp + 0x380], rax
0x1402890bb: mov rax, qword ptr [rsp + 0xe0]
0x1402890c3: mov qword ptr [rsp + 0x398], rax
0x1402890cb: mov rax, qword ptr [rsp + 0xe8]
0x1402890d3: mov qword ptr [rsp + 0x3a0], rax
0x1402890db: movaps xmm0, xmmword ptr [rsp + 0xf0]
0x1402890e3: movups xmmword ptr [rsp + 0x3a8], xmm0
0x1402890eb: xorps xmm0, xmm0
0x1402890ee: movups xmmword ptr [rsp + 0x3c8], xmm0
0x1402890f6: movups xmmword ptr [rsp + 0x3b8], xmm0
0x1402890fe: mov qword ptr [rsp + 0x3d8], 0
0x14028910a: movaps xmm1, xmmword ptr [rip + 0x5f83c6f]
0x140289111: movups xmmword ptr [rsp + 0x3e0], xmm1
0x140289119: movups xmmword ptr [rsp + 0x400], xmm0
0x140289121: movups xmmword ptr [rsp + 0x3f0], xmm0
0x140289129: movups xmm0, xmmword ptr [rip + 0x5f84a70]
0x140289130: movups xmmword ptr [rsp + 0x420], xmm0
0x140289138: movups xmm0, xmmword ptr [rip + 0x5f84a51]
0x14028913f: movups xmmword ptr [rsp + 0x410], xmm0
0x140289147: movups xmm0, xmmword ptr [rip + 0x5f84a72]
0x14028914e: movups xmmword ptr [rsp + 0x440], xmm0
0x140289156: movups xmm0, xmmword ptr [rip + 0x5f84a53]
0x14028915d: movups xmmword ptr [rsp + 0x430], xmm0
0x140289165: movups xmm0, xmmword ptr [rip + 0x5f84a74]
0x14028916c: movups xmmword ptr [rsp + 0x460], xmm0
0x140289174: movups xmm0, xmmword ptr [rip + 0x5f84a55]
0x14028917b: movups xmmword ptr [rsp + 0x450], xmm0
0x140289183: movups xmm0, xmmword ptr [rip + 0x5f84a76]
0x14028918a: movups xmmword ptr [rsp + 0x480], xmm0
0x140289192: movups xmm0, xmmword ptr [rip + 0x5f84a57]
0x140289199: movups xmmword ptr [rsp + 0x470], xmm0
0x1402891a1: movaps xmm0, xmmword ptr [rip + 0x5f29048]
0x1402891a8: movups xmmword ptr [rsp + 0x490], xmm0
0x1402891b0: mov dword ptr [rsp + 0x4a0], 1
0x1402891bb: mov qword ptr [rsp + 0x4a4], 0
0x1402891c7: mov byte ptr [rsp + 0x4ac], 1
0x1402891cf: mov qword ptr [rsp + 0x4b6], 0
0x1402891db: mov qword ptr [rsp + 0x4b0], 0
0x1402891e7: mov word ptr [rsp + 0x4c2], 0
0x1402891f1: mov dword ptr [rsp + 0x4be], 0x10000
0x1402891fc: mov word ptr [rsp + 0x4c8], 0
0x140289206: mov dword ptr [rsp + 0x4c4], 0x10000
0x140289211: mov dword ptr [rsp + 0x4d2], 0
0x14028921c: mov qword ptr [rsp + 0x4ca], 0
0x140289228: lea rcx, [rsp + 0xa8]
0x140289230: mov r8d, 0x208
0x140289236: mov rdx, r14
0x140289239: call 0x14600504b
0x14028923e: mov qword ptr [rsp + 0xa0], rsi
0x140289246: lea rcx, [rsp + 0x50]
0x14028924b: lea r8, [rsp + 0xa0]
0x140289253: mov rdx, rbx
0x140289256: call 0x14025ab20
0x14028925b: xorps xmm0, xmm0
0x14028925e: movaps xmmword ptr [rsp + 0x370], xmm0
0x140289266: movaps xmmword ptr [rsp + 0x360], xmm0
0x14028926e: movaps xmmword ptr [rsp + 0x350], xmm0
0x140289276: movaps xmmword ptr [rsp + 0x340], xmm0
0x14028927e: movaps xmmword ptr [rsp + 0x330], xmm0
0x140289286: mov qword ptr [rsp + 0x380], 0
0x140289292: mov word ptr [rsp + 0x224], 0
0x14028929c: mov dword ptr [rsp + 0x220], 0
0x1402892a7: movups xmm0, xmmword ptr [rip + 0x5f848e2]
0x1402892ae: movups xmmword ptr [rsp + 0x388], xmm0
0x1402892b6: movups xmm0, xmmword ptr [rip + 0x5f848e3]
0x1402892bd: movups xmmword ptr [rsp + 0x398], xmm0
0x1402892c5: movups xmm8, xmmword ptr [rip + 0x5f848e3]
0x1402892cd: movups xmmword ptr [rsp + 0x3a8], xmm8
0x1402892d6: movups xmm9, xmmword ptr [rip + 0x5f848e2]
0x1402892de: movups xmmword ptr [rsp + 0x3b8], xmm9
0x1402892e7: movups xmm10, xmmword ptr [rip + 0x5f848f1]
0x1402892ef: movups xmmword ptr [rsp + 0x3d8], xmm10
0x1402892f8: movups xmm11, xmmword ptr [rip + 0x5f848d0]
0x140289300: movups xmmword ptr [rsp + 0x3c8], xmm11
0x140289309: movups xmm12, xmmword ptr [rip + 0x5f848ef]
0x140289311: movups xmmword ptr [rsp + 0x3f8], xmm12
0x14028931a: movups xmm13, xmmword ptr [rip + 0x5f848ce]
0x140289322: movups xmmword ptr [rsp + 0x3e8], xmm13
0x14028932b: movups xmm14, xmmword ptr [rip + 0x5f847a5]
0x140289333: movaps xmmword ptr [rsp + 0x2d0], xmm14
0x14028933c: mov qword ptr [rsp + 0x2e0], 0
0x140289348: movups xmm15, xmmword ptr [rip + 0x5f847a0]
0x140289350: movups xmmword ptr [rsp + 0x2e8], xmm15
0x140289359: mov qword ptr [rsp + 0x2f8], 0
0x140289365: movups xmm6, xmmword ptr [rip + 0x5f8479c]
0x14028936c: movaps xmmword ptr [rsp + 0x300], xmm6
0x140289374: mov qword ptr [rsp + 0x310], 0
0x140289380: movups xmm7, xmmword ptr [rip + 0x5f84799]
0x140289387: movups xmmword ptr [rsp + 0x318], xmm7
0x14028938f: mov qword ptr [rsp + 0x328], 0
0x14028939b: lea rcx, [rsp + 0xa8]
0x1402893a3: lea rdx, [rsp + 0x2d0]
0x1402893ab: mov r8d, 0x138
0x1402893b1: call 0x14600504b
0x1402893b6: movaps xmm0, xmmword ptr [rip + 0x5f37743]
0x1402893bd: movups xmmword ptr [rsp + 0x1e0], xmm0
0x1402893c5: mov dword ptr [rsp + 0x1f0], 1
0x1402893d0: mov qword ptr [rsp + 0x1f4], 0
0x1402893dc: mov byte ptr [rsp + 0x1fc], 1
0x1402893e4: movsd xmm0, qword ptr [rip + 0x5f28ec4]
0x1402893ec: movsd qword ptr [rsp + 0x200], xmm0
0x1402893f5: mov dword ptr [rsp + 0x208], 0x3f800000
0x140289400: mov word ptr [rsp + 0x20c], 0
0x14028940a: mov dword ptr [rsp + 0x20e], 0x10000
0x140289415: mov word ptr [rsp + 0x212], 0
0x14028941f: mov dword ptr [rsp + 0x214], 0x10000
0x14028942a: mov word ptr [rsp + 0x218], 0
0x140289434: mov dword ptr [rsp + 0x21a], 0
0x14028943f: mov word ptr [rsp + 0x21e], 1
0x140289449: mov qword ptr [rsp + 0xa0], rsi
0x140289451: lea rcx, [rsp + 0x510]
0x140289459: lea r8, [rsp + 0xa0]
0x140289461: mov rdx, rbx
0x140289464: call 0x1402441d0
0x140289469: mov rbx, qword ptr [rdi + 0x38]
0x14028946d: mov rax, qword ptr [rdi + 0x40]
0x140289471: mov r8, qword ptr [rdi + 8]
0x140289475: mov rdx, qword ptr [rdi + 0x10]
0x140289479: mov r12, qword ptr [rdi + 0x18]
0x14028947d: mov r14, qword ptr [rdi + 0x20]
0x140289481: mov rsi, qword ptr [rsp + 0x510]
0x140289489: mov rcx, qword ptr [rsp + 0x538]
0x140289491: mov qword ptr [rsp + 0x540], rsi
0x140289499: movups xmm0, xmmword ptr [rsp + 0x518]
0x1402894a1: movups xmmword ptr [rsp + 0x548], xmm0
0x1402894a9: movups xmm0, xmmword ptr [rsp + 0x528]
0x1402894b1: movups xmmword ptr [rsp + 0x558], xmm0
0x1402894b9: mov qword ptr [rsp + 0x568], rcx
0x1402894c1: mov r13, qword ptr [rax + 8]
0x1402894c5: test r13, r13
0x1402894c8: jns 0x1402894da
0x1402894ca: xor r14d, r14d
0x1402894cd: mov rcx, r14
0x1402894d0: mov rdx, r13
0x1402894d3: call 0x1461add5b
0x1402894d8: ud2 
0x1402894da: mov qword ptr [rsp + 0x90], r8
0x1402894e2: mov qword ptr [rsp + 0x98], rdx
0x1402894ea: mov qword ptr [rsp + 0x88], rbp
0x1402894f2: je 0x140289560
0x1402894f4: mov qword ptr [rsp + 0x80], rsi
0x1402894fc: mov rsi, r12
0x1402894ff: mov r12, r14
0x140289502: mov r15, qword ptr [rax]
0x140289505: call 0x140002200
0x14028950a: mov r14d, 1
0x140289510: mov edx, 1
0x140289515: mov rcx, r13
0x140289518: call 0x1400021c0
0x14028951d: test rax, rax
0x140289520: je 0x1402894cd
0x140289522: mov rbp, rax
0x140289525: mov rcx, rax
0x140289528: mov rdx, r15
0x14028952b: mov r8, r13
0x14028952e: call 0x14600504b
0x140289533: mov r14, r12
0x140289536: mov r12, rsi
0x140289539: mov rsi, qword ptr [rsp + 0x80]
0x140289541: cmp byte ptr [rbx], 1
0x140289544: jne 0x14028956a
0x140289546: mov eax, dword ptr [rbx + 1]
0x140289549: mov ecx, dword ptr [rbx + 4]
0x14028954c: mov dword ptr [rsp + 0x3b], ecx
0x140289550: mov dword ptr [rsp + 0x38], eax
0x140289554: mov rax, qword ptr [rbx + 8]
0x140289558: movzx ecx, byte ptr [rbx + 0x10]
0x14028955c: mov dl, 1
0x14028955e: jmp 0x14028957a
0x140289560: mov ebp, 1
0x140289565: cmp byte ptr [rbx], 1
0x140289568: je 0x140289546
0x14028956a: mov rax, qword ptr [rbx + 8]
0x14028956e: lock inc qword ptr [rax]
0x140289572: jle 0x140289bfd
0x140289578: xor edx, edx
0x14028957a: lea r15, [rsp + 0x548]
0x140289582: movups xmm0, xmmword ptr [rip + 0x5f84753]
0x140289589: movups xmmword ptr [rsp + 0x51], xmm0
0x14028958e: mov dword ptr [rsp + 0x61], 0x3f800000
0x140289596: mov qword ptr [rsp + 0xa8], r13
0x14028959e: mov qword ptr [rsp + 0xb0], rbp
0x1402895a6: mov qword ptr [rsp + 0xb8], r13
0x1402895ae: mov qword ptr [rsp + 0xc0], 0
0x1402895ba: mov qword ptr [rsp + 0xc8], 4
0x1402895c6: mov qword ptr [rsp + 0xd0], 0
0x1402895d2: mov byte ptr [rsp + 0xd8], dl
0x1402895d9: mov edx, dword ptr [rsp + 0x38]
0x1402895dd: mov r8d, dword ptr [rsp + 0x3b]
0x1402895e2: mov dword ptr [rsp + 0xd9], edx
0x1402895e9: mov dword ptr [rsp + 0xdc], r8d
0x1402895f1: mov qword ptr [rsp + 0xe0], rax
0x1402895f9: mov qword ptr [rsp + 0xe8], rcx
0x140289601: mov dword ptr [rsp + 0xf0], 0x41400000
0x14028960c: mov word ptr [rsp + 0xf4], 0x190
0x140289616: mov byte ptr [rsp + 0xf6], 1
0x14028961e: movups xmm0, xmmword ptr [rsp + 0x50]
0x140289623: movups xmmword ptr [rsp + 0xf7], xmm0
0x14028962b: mov rax, qword ptr [rsp + 0x5d]
0x140289630: mov qword ptr [rsp + 0x104], rax
0x140289638: mov ebp, dword ptr [rip + 0x5f3ac62]
0x14028963e: mov dword ptr [rsp + 0x11c], ebp
0x140289645: movups xmm0, xmmword ptr [rip + 0x5f3ac44]
0x14028964c: movups xmmword ptr [rsp + 0x10c], xmm0
0x140289654: movsd xmm0, qword ptr [rip + 0x5f28e94]
0x14028965c: movsd qword ptr [rsp + 0x120], xmm0
0x140289665: mov qword ptr [rsp + 0xa0], rsi
0x14028966d: lea rcx, [rsp + 0x2d0]
0x140289675: lea r8, [rsp + 0xa0]
0x14028967d: mov rdx, r15
0x140289680: call 0x14025a890
0x140289685: mov rdx, qword ptr [rsp + 0x90]
0x14028968d: cmp qword ptr [rdx + 0x10], 0
0x140289692: mov r13, qword ptr [rsp + 0x98]
0x14028969a: je 0x1402897e1
0x1402896a0: lea rcx, [rsp + 0x2d0]
0x1402896a8: call 0x145fd8260
0x1402896ad: cmp byte ptr [rbx], 1
0x1402896b0: jne 0x1402896cc
0x1402896b2: mov eax, dword ptr [rbx + 1]
0x1402896b5: mov ecx, dword ptr [rbx + 4]
0x1402896b8: mov dword ptr [rsp + 0x43], ecx
0x1402896bc: mov dword ptr [rsp + 0x40], eax
0x1402896c0: mov rax, qword ptr [rbx + 8]
0x1402896c4: movzx ecx, byte ptr [rbx + 0x10]
0x1402896c8: mov dl, 1
0x1402896ca: jmp 0x1402896dc
0x1402896cc: mov rax, qword ptr [rbx + 8]
0x1402896d0: lock inc qword ptr [rax]
0x1402896d4: jle 0x140289bfd
0x1402896da: xor edx, edx
0x1402896dc: mov r8, qword ptr [rsp + 0x2e0]
0x1402896e4: mov qword ptr [rsp + 0xb8], r8
0x1402896ec: movups xmm0, xmmword ptr [rsp + 0x2d0]
0x1402896f4: movups xmmword ptr [rsp + 0xa8], xmm0
0x1402896fc: movups xmm0, xmmword ptr [rip + 0x5f84671]
0x140289703: movups xmmword ptr [rsp + 0x51], xmm0
0x140289708: mov dword ptr [rsp + 0x61], 0x3f800000
0x140289710: mov qword ptr [rsp + 0xc0], 0
0x14028971c: mov qword ptr [rsp + 0xc8], 4
0x140289728: mov qword ptr [rsp + 0xd0], 0
0x140289734: mov byte ptr [rsp + 0xd8], dl
0x14028973b: mov edx, dword ptr [rsp + 0x40]
0x14028973f: mov r8d, dword ptr [rsp + 0x43]
0x140289744: mov dword ptr [rsp + 0xd9], edx
0x14028974b: mov dword ptr [rsp + 0xdc], r8d
0x140289753: mov qword ptr [rsp + 0xe0], rax
0x14028975b: mov qword ptr [rsp + 0xe8], rcx
0x140289763: mov dword ptr [rsp + 0xf0], 0x41880000
0x14028976e: mov word ptr [rsp + 0xf4], 0x190
0x140289778: mov byte ptr [rsp + 0xf6], 1
0x140289780: mov rax, qword ptr [rsp + 0x5d]
0x140289785: mov qword ptr [rsp + 0x104], rax
0x14028978d: movups xmm0, xmmword ptr [rsp + 0x50]
0x140289792: movups xmmword ptr [rsp + 0xf7], xmm0
0x14028979a: mov dword ptr [rsp + 0x11c], ebp
0x1402897a1: movups xmm0, xmmword ptr [rip + 0x5f3aae8]
0x1402897a8: movups xmmword ptr [rsp + 0x10c], xmm0
0x1402897b0: movsd xmm0, qword ptr [rip + 0x5f28d38]
0x1402897b8: movsd qword ptr [rsp + 0x120], xmm0
0x1402897c1: mov qword ptr [rsp + 0xa0], rsi
0x1402897c9: lea rcx, [rsp + 0x2d0]
0x1402897d1: lea r8, [rsp + 0xa0]
0x1402897d9: mov rdx, r15
0x1402897dc: call 0x14025a890
0x1402897e1: xorps xmm0, xmm0
0x1402897e4: movaps xmmword ptr [rsp + 0x370], xmm0
0x1402897ec: movaps xmmword ptr [rsp + 0x360], xmm0
0x1402897f4: movaps xmmword ptr [rsp + 0x350], xmm0
0x1402897fc: movaps xmmword ptr [rsp + 0x340], xmm0
0x140289804: movaps xmmword ptr [rsp + 0x330], xmm0
0x14028980c: mov qword ptr [rsp + 0x380], 0
0x140289818: movups xmm0, xmmword ptr [rip + 0x5f84371]
0x14028981f: movups xmmword ptr [rsp + 0x388], xmm0
0x140289827: movups xmm0, xmmword ptr [rip + 0x5f84372]
0x14028982e: movups xmmword ptr [rsp + 0x398], xmm0
0x140289836: movups xmmword ptr [rsp + 0x3a8], xmm8
0x14028983f: movups xmmword ptr [rsp + 0x3b8], xmm9
0x140289848: movups xmmword ptr [rsp + 0x3c8], xmm11
0x140289851: movups xmmword ptr [rsp + 0x3d8], xmm10
0x14028985a: movups xmmword ptr [rsp + 0x3f8], xmm12
0x140289863: movups xmmword ptr [rsp + 0x3e8], xmm13
0x14028986c: movaps xmmword ptr [rsp + 0x2d0], xmm14
0x140289875: mov qword ptr [rsp + 0x2e0], 0
0x140289881: movups xmmword ptr [rsp + 0x2e8], xmm15
0x14028988a: mov qword ptr [rsp + 0x2f8], 0
0x140289896: movaps xmmword ptr [rsp + 0x300], xmm6
0x14028989e: mov qword ptr [rsp + 0x310], 0
0x1402898aa: movups xmmword ptr [rsp + 0x318], xmm7
0x1402898b2: mov qword ptr [rsp + 0x328], 0
0x1402898be: lea rcx, [rsp + 0xa8]
0x1402898c6: lea rdx, [rsp + 0x2d0]
0x1402898ce: mov r8d, 0x138
0x1402898d4: call 0x14600504b
0x1402898d9: movaps xmm0, xmmword ptr [rip + 0x5f28910]
0x1402898e0: movups xmmword ptr [rsp + 0x1e0], xmm0
0x1402898e8: mov dword ptr [rsp + 0x1f0], 1
0x1402898f3: movss xmm0, dword ptr [rip + 0x5f28b15]
0x1402898fb: movlps qword ptr [rsp + 0x1f4], xmm0
0x140289903: mov byte ptr [rsp + 0x1fc], 1
0x14028990b: mov qword ptr [rsp + 0x200], 0
0x140289917: mov dword ptr [rsp + 0x208], 0x3f800000
0x140289922: mov word ptr [rsp + 0x20c], 0
0x14028992c: mov dword ptr [rsp + 0x20e], 0x10000
0x140289937: mov word ptr [rsp + 0x212], 0
0x140289941: mov dword ptr [rsp + 0x214], 0x10000
0x14028994c: mov word ptr [rsp + 0x218], 0
0x140289956: mov qword ptr [rsp + 0x21a], 0
0x140289962: mov dword ptr [rsp + 0x222], 5
0x14028996d: mov qword ptr [rsp + 0xa0], rsi
0x140289975: lea rcx, [rsp + 0x570]
0x14028997d: lea r8, [rsp + 0xa0]
0x140289985: mov rdx, r15
0x140289988: call 0x1402441d0
0x14028998d: mov rsi, qword ptr [rsp + 0x570]
0x140289995: mov rax, qword ptr [rsp + 0x598]
0x14028999d: mov qword ptr [rsp + 0x50], rsi
0x1402899a2: movups xmm0, xmmword ptr [rsp + 0x578]
0x1402899aa: movups xmmword ptr [rsp + 0x58], xmm0
0x1402899af: movups xmm0, xmmword ptr [rsp + 0x588]
0x1402899b7: movups xmmword ptr [rsp + 0x68], xmm0
0x1402899bc: mov qword ptr [rsp + 0x78], rax
0x1402899c1: lea rcx, [rsp + 0x2d0]
0x1402899c9: mov rdx, r13
0x1402899cc: call 0x145fd8260
0x1402899d1: cmp byte ptr [rbx], 1
0x1402899d4: jne 0x1402899f1
0x1402899d6: mov eax, dword ptr [rbx + 1]
0x1402899d9: mov ecx, dword ptr [rbx + 4]
0x1402899dc: mov dword ptr [rsp + 0x4b], ecx
0x1402899e0: mov dword ptr [rsp + 0x48], eax
0x1402899e4: mov rax, qword ptr [rbx + 8]
0x1402899e8: movzx ecx, byte ptr [rbx + 0x10]
0x1402899ec: mov r8b, 1
0x1402899ef: jmp 0x140289a02
0x1402899f1: mov rax, qword ptr [rbx + 8]
0x1402899f5: lock inc qword ptr [rax]
0x1402899f9: jle 0x140289bfd
0x1402899ff: xor r8d, r8d
0x140289a02: lea rdx, [rsp + 0x58]
0x140289a07: mov r9, qword ptr [rsp + 0x2e0]
0x140289a0f: mov qword ptr [rsp + 0xb8], r9
0x140289a17: movups xmm0, xmmword ptr [rsp + 0x2d0]
0x140289a1f: movups xmmword ptr [rsp + 0xa8], xmm0
0x140289a27: movups xmm0, xmmword ptr [rip + 0x5f8425a]
0x140289a2e: movups xmmword ptr [rsp + 0x2bc], xmm0
0x140289a36: mov dword ptr [rsp + 0x2cc], 0x3f800000
0x140289a41: mov qword ptr [rsp + 0xc0], 0
0x140289a4d: mov qword ptr [rsp + 0xc8], 4
0x140289a59: mov qword ptr [rsp + 0xd0], 0
0x140289a65: mov byte ptr [rsp + 0xd8], r8b
0x140289a6d: mov r8d, dword ptr [rsp + 0x48]
0x140289a72: mov r9d, dword ptr [rsp + 0x4b]
0x140289a77: mov dword ptr [rsp + 0xd9], r8d
0x140289a7f: mov dword ptr [rsp + 0xdc], r9d
0x140289a87: mov qword ptr [rsp + 0xe0], rax
0x140289a8f: mov qword ptr [rsp + 0xe8], rcx
0x140289a97: mov dword ptr [rsp + 0xf0], 0x41800000
0x140289aa2: mov word ptr [rsp + 0xf4], 0x190
0x140289aac: mov byte ptr [rsp + 0xf6], 1
0x140289ab4: mov rax, qword ptr [rsp + 0x2c8]
0x140289abc: mov qword ptr [rsp + 0x104], rax
0x140289ac4: movups xmm0, xmmword ptr [rsp + 0x2bb]
0x140289acc: movups xmmword ptr [rsp + 0xf7], xmm0
0x140289ad4: mov dword ptr [rsp + 0x11c], ebp
0x140289adb: movups xmm0, xmmword ptr [rip + 0x5f3a7ae]
0x140289ae2: movups xmmword ptr [rsp + 0x10c], xmm0
0x140289aea: movsd xmm0, qword ptr [rip + 0x5f289fe]
0x140289af2: movsd qword ptr [rsp + 0x120], xmm0
0x140289afb: mov qword ptr [rsp + 0xa0], rsi
0x140289b03: lea rcx, [rsp + 0x2d0]
0x140289b0b: lea r8, [rsp + 0xa0]
0x140289b13: call 0x14025a890
0x140289b18: movzx r8d, byte ptr [r12]
0x140289b1d: mov r9, qword ptr [r14 + 8]
0x140289b21: mov rax, qword ptr [r14 + 0x10]
0x140289b25: mov qword ptr [rsp + 0x20], rax
0x140289b2a: mov dword ptr [rsp + 0x28], 0x41500000
0x140289b32: lea rcx, [rsp + 0x50]
0x140289b37: mov rdx, rbx
0x140289b3a: call 0x140145800
0x140289b3f: mov rax, qword ptr [rdi + 0x28]
0x140289b43: cmp byte ptr [rax], 1
0x140289b46: jne 0x140289b89
0x140289b48: mov byte ptr [rsp + 0xa0], 0xf
0x140289b50: lea rcx, [rip + 0x5f8813b]
0x140289b57: mov edx, 0x11
0x140289b5c: call 0x145bbfea0
0x140289b61: mov qword ptr [rsp + 0x20], rdx
0x140289b66: mov dword ptr [rsp + 0x28], 0x41600000
0x140289b6e: lea rcx, [rsp + 0x4e0]
0x140289b76: lea r8, [rsp + 0xa0]
0x140289b7e: mov rdx, rbx
0x140289b81: mov r9, rax
0x140289b84: call 0x1401488f0
0x140289b89: mov rax, qword ptr [rsp + 0x88]
0x140289b91: movaps xmm6, xmmword ptr [rsp + 0x5a0]
0x140289b99: movaps xmm7, xmmword ptr [rsp + 0x5b0]
0x140289ba1: movaps xmm8, xmmword ptr [rsp + 0x5c0]
0x140289baa: movaps xmm9, xmmword ptr [rsp + 0x5d0]
0x140289bb3: movaps xmm10, xmmword ptr [rsp + 0x5e0]
0x140289bbc: movaps xmm11, xmmword ptr [rsp + 0x5f0]
0x140289bc5: movaps xmm12, xmmword ptr [rsp + 0x600]
0x140289bce: movaps xmm13, xmmword ptr [rsp + 0x610]
0x140289bd7: movaps xmm14, xmmword ptr [rsp + 0x620]
0x140289be0: movaps xmm15, xmmword ptr [rsp + 0x630]
0x140289be9: add rsp, 0x648
0x140289bf0: pop rbx
0x140289bf1: pop rbp
0x140289bf2: pop rdi
0x140289bf3: pop rsi
0x140289bf4: pop r12
0x140289bf6: pop r13
0x140289bf8: pop r14
0x140289bfa: pop r15
0x140289bfc: ret 
0x140289bfd: ud2 
