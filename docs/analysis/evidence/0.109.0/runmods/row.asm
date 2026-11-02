;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x140269200..0x140269d6e SHA256 2cd90122629f36532803dc67c09dc8d0122449fd2da7986ff7d22c3dce1be24a
0x140269200: push r15
0x140269202: push r14
0x140269204: push r13
0x140269206: push r12
0x140269208: push rsi
0x140269209: push rdi
0x14026920a: push rbp
0x14026920b: push rbx
0x14026920c: sub rsp, 0x4b8
0x140269213: movaps xmmword ptr [rsp + 0x4a0], xmm15
0x14026921c: movaps xmmword ptr [rsp + 0x490], xmm14
0x140269225: movaps xmmword ptr [rsp + 0x480], xmm13
0x14026922e: movaps xmmword ptr [rsp + 0x470], xmm12
0x140269237: movaps xmmword ptr [rsp + 0x460], xmm11
0x140269240: movaps xmmword ptr [rsp + 0x450], xmm10
0x140269249: movaps xmmword ptr [rsp + 0x440], xmm9
0x140269252: movaps xmmword ptr [rsp + 0x430], xmm8
0x14026925b: movaps xmmword ptr [rsp + 0x420], xmm7
0x140269263: movaps xmmword ptr [rsp + 0x410], xmm6
0x14026926b: mov r14, rdx
0x14026926e: mov rsi, rcx
0x140269271: mov rdi, qword ptr [rcx]
0x140269274: mov rax, qword ptr [rcx + 0x28]
0x140269278: mov qword ptr [rsp + 0x218], rdi
0x140269280: lea rbx, [rsp + 0x220]
0x140269288: movups xmm0, xmmword ptr [rcx + 8]
0x14026928c: movups xmmword ptr [rsp + 0x220], xmm0
0x140269294: movups xmm0, xmmword ptr [rcx + 0x18]
0x140269298: movups xmmword ptr [rsp + 0x230], xmm0
0x1402692a0: mov qword ptr [rsp + 0x240], rax
0x1402692a8: xorps xmm0, xmm0
0x1402692ab: movaps xmmword ptr [rsp + 0x370], xmm0
0x1402692b3: movaps xmmword ptr [rsp + 0x360], xmm0
0x1402692bb: movaps xmmword ptr [rsp + 0x350], xmm0
0x1402692c3: movaps xmmword ptr [rsp + 0x340], xmm0
0x1402692cb: movaps xmmword ptr [rsp + 0x330], xmm0
0x1402692d3: mov qword ptr [rsp + 0x380], 0
0x1402692df: mov word ptr [rsp + 0x1d4], 0
0x1402692e9: mov dword ptr [rsp + 0x1d0], 0
0x1402692f4: movups xmm0, xmmword ptr [rip + 0x5b826bd]
0x1402692fb: movups xmmword ptr [rsp + 0x388], xmm0
0x140269303: movups xmm0, xmmword ptr [rip + 0x5b826be]
0x14026930a: movups xmmword ptr [rsp + 0x398], xmm0
0x140269312: movups xmm0, xmmword ptr [rip + 0x5b826bf]
0x140269319: movups xmmword ptr [rsp + 0x3a8], xmm0
0x140269321: movups xmm9, xmmword ptr [rip + 0x5b826bf]
0x140269329: movups xmmword ptr [rsp + 0x3b8], xmm9
0x140269332: movups xmm10, xmmword ptr [rip + 0x5b826ce]
0x14026933a: movups xmmword ptr [rsp + 0x3d8], xmm10
0x140269343: movups xmm11, xmmword ptr [rip + 0x5b826ad]
0x14026934b: movups xmmword ptr [rsp + 0x3c8], xmm11
0x140269354: movups xmm12, xmmword ptr [rip + 0x5b826cc]
0x14026935c: movups xmmword ptr [rsp + 0x3f8], xmm12
0x140269365: movups xmm13, xmmword ptr [rip + 0x5b826ab]
0x14026936d: movups xmmword ptr [rsp + 0x3e8], xmm13
0x140269376: movups xmm15, xmmword ptr [rip + 0x5b82582]
0x14026937e: movaps xmmword ptr [rsp + 0x2d0], xmm15
0x140269387: mov qword ptr [rsp + 0x2e0], 0
0x140269393: movups xmm6, xmmword ptr [rip + 0x5b8257e]
0x14026939a: movups xmmword ptr [rsp + 0x2e8], xmm6
0x1402693a2: mov qword ptr [rsp + 0x2f8], 0
0x1402693ae: movups xmm7, xmmword ptr [rip + 0x5b8257b]
0x1402693b5: movaps xmmword ptr [rsp + 0x300], xmm7
0x1402693bd: mov qword ptr [rsp + 0x310], 0
0x1402693c9: movups xmm8, xmmword ptr [rip + 0x5b82577]
0x1402693d1: movups xmmword ptr [rsp + 0x318], xmm8
0x1402693da: mov qword ptr [rsp + 0x328], 0
0x1402693e6: lea rcx, [rsp + 0x58]
0x1402693eb: lea rdx, [rsp + 0x2d0]
0x1402693f3: mov r8d, 0x138
0x1402693f9: call 0x145bfa0e7
0x1402693fe: movaps xmm14, xmmword ptr [rip + 0x5b33e6a]
0x140269406: movups xmmword ptr [rsp + 0x190], xmm14
0x14026940f: mov dword ptr [rsp + 0x1a0], 1
0x14026941a: mov qword ptr [rsp + 0x1a4], 0
0x140269426: mov byte ptr [rsp + 0x1ac], 1
0x14026942e: movsd xmm0, qword ptr [rip + 0x5b3400a]
0x140269436: movsd qword ptr [rsp + 0x1b0], xmm0
0x14026943f: mov dword ptr [rsp + 0x1b8], 0x3f800000
0x14026944a: mov word ptr [rsp + 0x1bc], 0
0x140269454: mov dword ptr [rsp + 0x1be], 0x10000
0x14026945f: mov word ptr [rsp + 0x1c2], 0
0x140269469: mov dword ptr [rsp + 0x1c4], 0x10000
0x140269474: mov word ptr [rsp + 0x1c8], 0
0x14026947e: mov dword ptr [rsp + 0x1ca], 0
0x140269489: mov word ptr [rsp + 0x1ce], 1
0x140269493: mov qword ptr [rsp + 0x50], rdi
0x140269498: lea rcx, [rsp + 0x290]
0x1402694a0: lea r8, [rsp + 0x50]
0x1402694a5: mov rdx, rbx
0x1402694a8: call 0x1401de510
0x1402694ad: mov rdi, qword ptr [r14]
0x1402694b0: mov r15, qword ptr [r14 + 8]
0x1402694b4: mov rbx, qword ptr [rsp + 0x290]
0x1402694bc: mov rax, qword ptr [rsp + 0x2b8]
0x1402694c4: mov qword ptr [rsp + 0x1e0], rbx
0x1402694cc: movups xmm0, xmmword ptr [rsp + 0x298]
0x1402694d4: movups xmmword ptr [rsp + 0x1e8], xmm0
0x1402694dc: movups xmm0, xmmword ptr [rsp + 0x2a8]
0x1402694e4: movups xmmword ptr [rsp + 0x1f8], xmm0
0x1402694ec: mov qword ptr [rsp + 0x208], rax
0x1402694f4: mov rcx, r15
0x1402694f7: call 0x14590d390
0x1402694fc: mov r13, rdx
0x1402694ff: test rdx, rdx
0x140269502: jns 0x140269514
0x140269504: xor r14d, r14d
0x140269507: mov rcx, r14
0x14026950a: mov rdx, r13
0x14026950d: call 0x145d992bb
0x140269512: ud2
0x140269514: mov qword ptr [rsp + 0x48], r14
0x140269519: je 0x14026956c
0x14026951b: mov r12, rax
0x14026951e: call 0x140002200
0x140269523: mov r14d, 1
0x140269529: mov edx, 1
0x14026952e: mov rcx, r13
0x140269531: call 0x1400021c0
0x140269536: test rax, rax
0x140269539: je 0x140269507
0x14026953b: mov rbp, rax
0x14026953e: mov rcx, rax
0x140269541: mov rdx, r12
0x140269544: mov r8, r13
0x140269547: call 0x145bfa0e7
0x14026954c: cmp byte ptr [rdi], 1
0x14026954f: jne 0x140269576
0x140269551: mov eax, dword ptr [rdi + 1]
0x140269554: mov ecx, dword ptr [rdi + 4]
0x140269557: mov dword ptr [rsp + 0x3b], ecx
0x14026955b: mov dword ptr [rsp + 0x38], eax
0x14026955f: mov rax, qword ptr [rdi + 8]
0x140269563: movzx ecx, byte ptr [rdi + 0x10]
0x140269567: mov r8b, 1
0x14026956a: jmp 0x140269587
0x14026956c: mov ebp, 1
0x140269571: cmp byte ptr [rdi], 1
0x140269574: je 0x140269551
0x140269576: mov rax, qword ptr [rdi + 8]
0x14026957a: lock inc qword ptr [rax]
0x14026957e: jle 0x140269d6c
0x140269584: xor r8d, r8d
0x140269587: lea rdx, [rsp + 0x1e8]
0x14026958f: movups xmm0, xmmword ptr [rip + 0x5b8283e]
0x140269596: movups xmmword ptr [rsp + 0x249], xmm0
0x14026959e: mov dword ptr [rsp + 0x259], 0x3f800000
0x1402695a9: mov qword ptr [rsp + 0x58], r13
0x1402695ae: mov qword ptr [rsp + 0x60], rbp
0x1402695b3: mov qword ptr [rsp + 0x68], r13
0x1402695b8: mov qword ptr [rsp + 0x70], 0
0x1402695c1: mov qword ptr [rsp + 0x78], 4
0x1402695ca: mov qword ptr [rsp + 0x80], 0
0x1402695d6: mov byte ptr [rsp + 0x88], r8b
0x1402695de: mov r9d, dword ptr [rsp + 0x38]
0x1402695e3: mov r8d, dword ptr [rsp + 0x3b]
0x1402695e8: mov dword ptr [rsp + 0x89], r9d
0x1402695f0: mov dword ptr [rsp + 0x8c], r8d
0x1402695f8: mov qword ptr [rsp + 0x90], rax
0x140269600: mov qword ptr [rsp + 0x98], rcx
0x140269608: mov dword ptr [rsp + 0xa0], 0x41900000
0x140269613: mov word ptr [rsp + 0xa4], 0x190
0x14026961d: mov byte ptr [rsp + 0xa6], 1
0x140269625: movups xmm0, xmmword ptr [rsp + 0x248]
0x14026962d: movups xmmword ptr [rsp + 0xa7], xmm0
0x140269635: mov rax, qword ptr [rsp + 0x255]
0x14026963d: mov qword ptr [rsp + 0xb4], rax
0x140269645: mov eax, dword ptr [rip + 0x5b6c455]
0x14026964b: mov dword ptr [rsp + 0xcc], eax
0x140269652: movups xmm0, xmmword ptr [rip + 0x5b6c437]
0x140269659: movups xmmword ptr [rsp + 0xbc], xmm0
0x140269661: movsd xmm0, qword ptr [rip + 0x5b33e37]
0x140269669: movsd qword ptr [rsp + 0xd0], xmm0
0x140269672: mov qword ptr [rsp + 0x50], rbx
0x140269677: lea rcx, [rsp + 0x2d0]
0x14026967f: lea r8, [rsp + 0x50]
0x140269684: mov r12, rdx
0x140269687: call 0x1401f2bf0
0x14026968c: lea rcx, [rip + 0x5b8442d]
0x140269693: mov edx, 0x1a
0x140269698: call 0x1458ec450
0x14026969d: mov r13, rax
0x1402696a0: mov rbp, rdx
0x1402696a3: mov rcx, r15
0x1402696a6: call 0x1458d32c0
0x1402696ab: mov qword ptr [rsp + 0x2c0], rax
0x1402696b3: mov qword ptr [rsp + 0x2c8], rdx
0x1402696bb: lea r14, [r15 + 0x24]
0x1402696bf: add r15, 0x26
0x1402696c3: lea rax, [rip + 0x5b84410]
0x1402696ca: mov qword ptr [rsp + 0x2d0], rax
0x1402696d2: mov qword ptr [rsp + 0x2d8], 4
0x1402696de: lea rax, [rsp + 0x2c0]
0x1402696e6: mov qword ptr [rsp + 0x2e0], rax
0x1402696ee: lea rax, [rip + 0x5b82963]
0x1402696f5: mov qword ptr [rsp + 0x2e8], rax
0x1402696fd: lea rax, [rip + 0x5b843fc]
0x140269704: mov qword ptr [rsp + 0x2f0], rax
0x14026970c: mov qword ptr [rsp + 0x2f8], 3
0x140269718: mov qword ptr [rsp + 0x300], r14
0x140269720: lea rax, [rip + 0x5b843b9]
0x140269727: mov qword ptr [rsp + 0x308], rax
0x14026972f: lea rcx, [rip + 0x5b8420c]
0x140269736: mov qword ptr [rsp + 0x310], rcx
0x14026973e: mov qword ptr [rsp + 0x318], 3
0x14026974a: mov qword ptr [rsp + 0x320], r15
0x140269752: mov qword ptr [rsp + 0x328], rax
0x14026975a: mov qword ptr [rsp + 0x20], 3
0x140269763: lea rcx, [rsp + 0x248]
0x14026976b: lea r9, [rsp + 0x2d0]
0x140269773: mov rdx, r13
0x140269776: mov r8, rbp
0x140269779: call 0x1458ec8b0
0x14026977e: cmp byte ptr [rdi], 1
0x140269781: jne 0x1402697ab
0x140269783: mov eax, dword ptr [rdi + 1]
0x140269786: mov ecx, dword ptr [rdi + 4]
0x140269789: mov dword ptr [rsp + 0x43], ecx
0x14026978d: mov dword ptr [rsp + 0x40], eax
0x140269791: mov rax, qword ptr [rdi + 8]
0x140269795: movzx ecx, byte ptr [rdi + 0x10]
0x140269799: mov r9b, 1
0x14026979c: mov r15, qword ptr [rsp + 0x48]
0x1402697a1: lea r13, [rsp + 0x220]
0x1402697a9: jmp 0x1402697c9
0x1402697ab: mov rax, qword ptr [rdi + 8]
0x1402697af: lock inc qword ptr [rax]
0x1402697b3: mov r15, qword ptr [rsp + 0x48]
0x1402697b8: lea r13, [rsp + 0x220]
0x1402697c0: jle 0x140269d6c
0x1402697c6: xor r9d, r9d
0x1402697c9: mov ebp, dword ptr [rip + 0x5b6c2d1]
0x1402697cf: mov rdx, r12
0x1402697d2: mov r8, qword ptr [rsp + 0x258]
0x1402697da: mov qword ptr [rsp + 0x68], r8
0x1402697df: movups xmm0, xmmword ptr [rsp + 0x248]
0x1402697e7: movups xmmword ptr [rsp + 0x58], xmm0
0x1402697ec: movups xmm0, xmmword ptr [rip + 0x5b820c9]
0x1402697f3: movups xmmword ptr [rsp + 0x27c], xmm0
0x1402697fb: mov dword ptr [rsp + 0x28c], 0x3f800000
0x140269806: mov qword ptr [rsp + 0x70], 0
0x14026980f: mov qword ptr [rsp + 0x78], 4
0x140269818: mov qword ptr [rsp + 0x80], 0
0x140269824: mov byte ptr [rsp + 0x88], r9b
0x14026982c: mov r9d, dword ptr [rsp + 0x40]
0x140269831: mov r8d, dword ptr [rsp + 0x43]
0x140269836: mov dword ptr [rsp + 0x89], r9d
0x14026983e: mov dword ptr [rsp + 0x8c], r8d
0x140269846: mov qword ptr [rsp + 0x90], rax
0x14026984e: mov qword ptr [rsp + 0x98], rcx
0x140269856: mov dword ptr [rsp + 0xa0], 0x41400000
0x140269861: mov word ptr [rsp + 0xa4], 0x190
0x14026986b: mov byte ptr [rsp + 0xa6], 1
0x140269873: mov rax, qword ptr [rsp + 0x288]
0x14026987b: mov qword ptr [rsp + 0xb4], rax
0x140269883: movups xmm0, xmmword ptr [rsp + 0x27b]
0x14026988b: movups xmmword ptr [rsp + 0xa7], xmm0
0x140269893: mov dword ptr [rsp + 0xcc], ebp
0x14026989a: movups xmm0, xmmword ptr [rip + 0x5b6c1ef]
0x1402698a1: movups xmmword ptr [rsp + 0xbc], xmm0
0x1402698a9: movsd xmm0, qword ptr [rip + 0x5b33bef]
0x1402698b1: movsd qword ptr [rsp + 0xd0], xmm0
0x1402698ba: mov qword ptr [rsp + 0x50], rbx
0x1402698bf: lea rcx, [rsp + 0x248]
0x1402698c7: lea r8, [rsp + 0x50]
0x1402698cc: call 0x1401f2bf0
0x1402698d1: mov rax, qword ptr [r15 + 0x10]
0x1402698d5: mov rbx, qword ptr [rax]
0x1402698d8: mov qword ptr [rsp + 0x58], rbx
0x1402698dd: movabs rax, 0xffffffff00000000
0x1402698e7: mov qword ptr [rsp + 0x50], rax
0x1402698ec: mov dword ptr [rsp + 0x28], 0x41a00000
0x1402698f4: mov qword ptr [rsp + 0x20], 3
0x1402698fd: lea r9, [rip + 0x5b8624a]
0x140269904: lea rcx, [rsp + 0x218]
0x14026990c: lea r8, [rsp + 0x50]
0x140269911: mov rdx, rdi
0x140269914: call 0x1401c0870
0x140269919: xorps xmm0, xmm0
0x14026991c: movups xmmword ptr [rsp + 0xd0], xmm0
0x140269924: movups xmmword ptr [rsp + 0xc0], xmm0
0x14026992c: movups xmmword ptr [rsp + 0xe8], xmm0
0x140269934: movups xmmword ptr [rsp + 0xf8], xmm0
0x14026993c: mov qword ptr [rsp + 0x108], 0
0x140269948: mov dword ptr [rsp + 0x1d0], 0
0x140269953: mov byte ptr [rsp + 0x1d4], 0
0x14026995b: movaps xmmword ptr [rsp + 0x2d0], xmm15
0x140269964: mov qword ptr [rsp + 0x2e0], 0
0x140269970: movups xmmword ptr [rsp + 0x2e8], xmm6
0x140269978: mov qword ptr [rsp + 0x2f8], 0
0x140269984: movaps xmmword ptr [rsp + 0x300], xmm7
0x14026998c: mov qword ptr [rsp + 0x310], 0
0x140269998: movups xmmword ptr [rsp + 0x318], xmm8
0x1402699a1: mov qword ptr [rsp + 0x328], 0
0x1402699ad: mov rax, qword ptr [rsp + 0x218]
0x1402699b5: mov rcx, qword ptr [rsp + 0x320]
0x1402699bd: mov qword ptr [rsp + 0xa8], rcx
0x1402699c5: mov rcx, qword ptr [rsp + 0x328]
0x1402699cd: mov qword ptr [rsp + 0xb0], rcx
0x1402699d5: mov rcx, qword ptr [rsp + 0x310]
0x1402699dd: mov qword ptr [rsp + 0x98], rcx
0x1402699e5: mov rcx, qword ptr [rsp + 0x318]
0x1402699ed: mov qword ptr [rsp + 0xa0], rcx
0x1402699f5: movaps xmm0, xmmword ptr [rsp + 0x2d0]
0x1402699fd: movaps xmm1, xmmword ptr [rsp + 0x2e0]
0x140269a05: movaps xmm2, xmmword ptr [rsp + 0x2f0]
0x140269a0d: movaps xmm3, xmmword ptr [rsp + 0x300]
0x140269a15: movups xmmword ptr [rsp + 0x88], xmm3
0x140269a1d: movups xmmword ptr [rsp + 0x78], xmm2
0x140269a22: movups xmmword ptr [rsp + 0x68], xmm1
0x140269a27: movups xmmword ptr [rsp + 0x58], xmm0
0x140269a2c: mov qword ptr [rsp + 0xb8], 0
0x140269a38: movabs rcx, 0x42a8000000000001
0x140269a42: mov qword ptr [rsp + 0xe0], rcx
0x140269a4a: movups xmm0, xmmword ptr [rip + 0x5b81f77]
0x140269a51: movups xmmword ptr [rsp + 0x120], xmm0
0x140269a59: movups xmm0, xmmword ptr [rip + 0x5b81f58]
0x140269a60: movups xmmword ptr [rsp + 0x110], xmm0
0x140269a68: movups xmmword ptr [rsp + 0x140], xmm9
0x140269a71: movups xmm0, xmmword ptr [rip + 0x5b81f60]
0x140269a78: movups xmmword ptr [rsp + 0x130], xmm0
0x140269a80: movups xmmword ptr [rsp + 0x160], xmm10
0x140269a89: movups xmmword ptr [rsp + 0x150], xmm11
0x140269a92: movups xmmword ptr [rsp + 0x180], xmm12
0x140269a9b: movups xmmword ptr [rsp + 0x170], xmm13
0x140269aa4: movups xmmword ptr [rsp + 0x190], xmm14
0x140269aad: mov dword ptr [rsp + 0x1a0], 1
0x140269ab8: mov qword ptr [rsp + 0x1a4], 0
0x140269ac4: mov byte ptr [rsp + 0x1ac], 1
0x140269acc: mov qword ptr [rsp + 0x1b0], 0
0x140269ad8: mov dword ptr [rsp + 0x1b8], 0x3f800000
0x140269ae3: mov word ptr [rsp + 0x1bc], 0
0x140269aed: mov word ptr [rsp + 0x1c2], 0
0x140269af7: mov dword ptr [rsp + 0x1be], 0x10000
0x140269b02: mov word ptr [rsp + 0x1c8], 0
0x140269b0c: mov dword ptr [rsp + 0x1c4], 0x10000
0x140269b17: mov word ptr [rsp + 0x1ce], 0
0x140269b21: mov dword ptr [rsp + 0x1ca], 0
0x140269b2c: mov byte ptr [rsp + 0x1d5], 5
0x140269b34: mov qword ptr [rsp + 0x50], rax
0x140269b39: lea rcx, [rsp + 0x248]
0x140269b41: lea r8, [rsp + 0x50]
0x140269b46: mov rdx, r13
0x140269b49: call 0x1401de510
0x140269b4e: mov rax, qword ptr [r15 + 0x18]
0x140269b52: movzx ecx, word ptr [rax]
0x140269b55: cmp cx, word ptr [r14]
0x140269b59: jbe 0x140269b64
0x140269b5b: movups xmm0, xmmword ptr [rip + 0x5b81d76]
0x140269b62: jmp 0x140269b6b
0x140269b64: movups xmm0, xmmword ptr [rip + 0x5b81d0d]
0x140269b6b: movaps xmmword ptr [rsp + 0x1e0], xmm0
0x140269b73: mov dword ptr [rsp + 0x1f0], 0x3f800000
0x140269b7e: mov qword ptr [rsp + 0x50], rax
0x140269b83: lea rax, [rip + 0x5974096]
0x140269b8a: mov qword ptr [rsp + 0x58], rax
0x140269b8f: lea rdx, [rip + 0x5b821f8]
0x140269b96: lea rcx, [rsp + 0x2d0]
0x140269b9e: lea r8, [rsp + 0x50]
0x140269ba3: call 0x145bcce30
0x140269ba8: cmp byte ptr [rdi + 0x18], 1
0x140269bac: jne 0x140269bce
0x140269bae: mov eax, dword ptr [rdi + 0x19]
0x140269bb1: mov ecx, dword ptr [rdi + 0x1c]
0x140269bb4: mov dword ptr [rsp + 0x293], ecx
0x140269bbb: mov dword ptr [rsp + 0x290], eax
0x140269bc2: mov rax, qword ptr [rdi + 0x20]
0x140269bc6: movzx ecx, byte ptr [rdi + 0x28]
0x140269bca: mov dl, 1
0x140269bcc: jmp 0x140269bde
0x140269bce: mov rax, qword ptr [rdi + 0x20]
0x140269bd2: lock inc qword ptr [rax]
0x140269bd6: jle 0x140269d6c
0x140269bdc: xor edx, edx
0x140269bde: mov r8, qword ptr [rsp + 0x2e0]
0x140269be6: mov qword ptr [rsp + 0x60], r8
0x140269beb: movups xmm0, xmmword ptr [rsp + 0x2d0]
0x140269bf3: movaps xmmword ptr [rsp + 0x50], xmm0
0x140269bf8: mov qword ptr [rsp + 0x68], 0
0x140269c01: mov qword ptr [rsp + 0x70], 4
0x140269c0a: mov qword ptr [rsp + 0x78], 0
0x140269c13: mov byte ptr [rsp + 0x80], dl
0x140269c1a: mov edx, dword ptr [rsp + 0x290]
0x140269c21: mov r8d, dword ptr [rsp + 0x293]
0x140269c29: mov dword ptr [rsp + 0x81], edx
0x140269c30: mov dword ptr [rsp + 0x84], r8d
0x140269c38: mov qword ptr [rsp + 0x88], rax
0x140269c40: mov qword ptr [rsp + 0x90], rcx
0x140269c48: mov dword ptr [rsp + 0x98], 0x41c00000
0x140269c53: mov word ptr [rsp + 0x9c], 0x190
0x140269c5d: mov byte ptr [rsp + 0x9e], 1
0x140269c65: mov eax, dword ptr [rsp + 0x1f0]
0x140269c6c: mov dword ptr [rsp + 0xb0], eax
0x140269c73: movaps xmm0, xmmword ptr [rsp + 0x1e0]
0x140269c7b: movaps xmmword ptr [rsp + 0xa0], xmm0
0x140269c83: movups xmm0, xmmword ptr [rip + 0x5b6be06]
0x140269c8a: movups xmmword ptr [rsp + 0xb4], xmm0
0x140269c92: mov dword ptr [rsp + 0xc4], ebp
0x140269c99: movsd xmm0, qword ptr [rip + 0x5b337ff]
0x140269ca1: movsd qword ptr [rsp + 0xc8], xmm0
0x140269caa: lea rcx, [rsp + 0x248]
0x140269cb2: lea rdx, [rsp + 0x50]
0x140269cb7: call 0x1401f9650
0x140269cbc: mov qword ptr [rsp + 0x58], rbx
0x140269cc1: movabs rax, 0x100000000
0x140269ccb: mov qword ptr [rsp + 0x50], rax
0x140269cd0: mov dword ptr [rsp + 0x28], 0x41a00000
0x140269cd8: mov qword ptr [rsp + 0x20], 1
0x140269ce1: lea r9, [rip + 0x5b824c6]
0x140269ce8: lea rcx, [rsp + 0x218]
0x140269cf0: lea r8, [rsp + 0x50]
0x140269cf5: mov rdx, rdi
0x140269cf8: call 0x1401c0870
0x140269cfd: mov rax, rsi
0x140269d00: movaps xmm6, xmmword ptr [rsp + 0x410]
0x140269d08: movaps xmm7, xmmword ptr [rsp + 0x420]
0x140269d10: movaps xmm8, xmmword ptr [rsp + 0x430]
0x140269d19: movaps xmm9, xmmword ptr [rsp + 0x440]
0x140269d22: movaps xmm10, xmmword ptr [rsp + 0x450]
0x140269d2b: movaps xmm11, xmmword ptr [rsp + 0x460]
0x140269d34: movaps xmm12, xmmword ptr [rsp + 0x470]
0x140269d3d: movaps xmm13, xmmword ptr [rsp + 0x480]
0x140269d46: movaps xmm14, xmmword ptr [rsp + 0x490]
0x140269d4f: movaps xmm15, xmmword ptr [rsp + 0x4a0]
0x140269d58: add rsp, 0x4b8
0x140269d5f: pop rbx
0x140269d60: pop rbp
0x140269d61: pop rdi
0x140269d62: pop rsi
0x140269d63: pop r12
0x140269d65: pop r13
0x140269d67: pop r14
0x140269d69: pop r15
0x140269d6b: ret
0x140269d6c: ud2
