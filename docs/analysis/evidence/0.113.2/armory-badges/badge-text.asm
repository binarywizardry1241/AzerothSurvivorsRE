0000000140304e60: push r15
0000000140304e62: push r14
0000000140304e64: push rsi
0000000140304e65: push rdi
0000000140304e66: push rbx
0000000140304e67: sub rsp, 0x340
0000000140304e6e: movaps xmmword ptr [rsp + 0x330], xmm6
0000000140304e76: mov rsi, r9
0000000140304e79: mov rbx, r8
0000000140304e7c: mov rdi, rdx
0000000140304e7f: mov rdx, rcx
0000000140304e82: movzx r8d, byte ptr [rsp + 0x398]
0000000140304e8b: movups xmm0, xmmword ptr [rip + 0x5bf8b3e]
0000000140304e92: movaps xmmword ptr [rsp + 0xe0], xmm0
0000000140304e9a: mov qword ptr [rsp + 0xf0], 0
0000000140304ea6: movups xmm0, xmmword ptr [rip + 0x5bf8b3b]
0000000140304ead: movups xmmword ptr [rsp + 0xf8], xmm0
0000000140304eb5: mov qword ptr [rsp + 0x108], 0
0000000140304ec1: movups xmm0, xmmword ptr [rip + 0x5bf8b38]
0000000140304ec8: movaps xmmword ptr [rsp + 0x110], xmm0
0000000140304ed0: mov qword ptr [rsp + 0x120], 0
0000000140304edc: movups xmm0, xmmword ptr [rip + 0x5bf8b35]
0000000140304ee3: movups xmmword ptr [rsp + 0x128], xmm0
0000000140304eeb: mov qword ptr [rsp + 0x138], 0
0000000140304ef7: movss xmm2, dword ptr [rip + 0x5bdd19d]
0000000140304eff: xorps xmm1, xmm1
0000000140304f02: movaps xmm0, xmm2
0000000140304f05: test r8b, r8b
0000000140304f08: jne 0x140304f0d
0000000140304f0a: xorps xmm0, xmm0
0000000140304f0d: mov rcx, qword ptr [rsp + 0x390]
0000000140304f15: movzx eax, r8b
0000000140304f19: jne 0x140304f1e
0000000140304f1b: movaps xmm1, xmm2
0000000140304f1e: xor r8b, 1
0000000140304f22: movzx r8d, r8b
0000000140304f26: movups xmm6, xmmword ptr [rip + 0x5bf8d9b]
0000000140304f2d: movaps xmmword ptr [rsp + 0x30], xmm6
0000000140304f32: mov dword ptr [rsp + 0x40], 0x3f800000
0000000140304f3a: movups xmmword ptr [rsp + 0x44], xmm6
0000000140304f3f: mov dword ptr [rsp + 0x54], 0x3f800000
0000000140304f47: movups xmmword ptr [rsp + 0x58], xmm6
0000000140304f4c: mov dword ptr [rsp + 0x68], 0x3f800000
0000000140304f54: movups xmmword ptr [rsp + 0x6c], xmm6
0000000140304f59: mov dword ptr [rsp + 0x7c], 0x3f800000
0000000140304f61: xorps xmm2, xmm2
0000000140304f64: movups xmmword ptr [rsp + 0x1f0], xmm2
0000000140304f6c: movups xmmword ptr [rsp + 0x1e0], xmm2
0000000140304f74: mov dword ptr [rsp + 0x2bc], 0
0000000140304f7f: mov word ptr [rsp + 0x2c0], 0
0000000140304f89: mov r9, qword ptr [rsp + 0x60]
0000000140304f8e: mov qword ptr [rsp + 0xc0], r9
0000000140304f96: mov r9d, dword ptr [rsp + 0x68]
0000000140304f9b: mov dword ptr [rsp + 0xc8], r9d
0000000140304fa3: mov r9d, dword ptr [rsp + 0x6c]
0000000140304fa8: mov dword ptr [rsp + 0xcc], r9d
0000000140304fb0: mov r9d, dword ptr [rsp + 0x50]
0000000140304fb5: mov dword ptr [rsp + 0xb0], r9d
0000000140304fbd: mov r9d, dword ptr [rsp + 0x54]
0000000140304fc2: mov dword ptr [rsp + 0xb4], r9d
0000000140304fca: mov r9, qword ptr [rsp + 0x58]
0000000140304fcf: mov qword ptr [rsp + 0xb8], r9
0000000140304fd7: movaps xmm2, xmmword ptr [rsp + 0x30]
0000000140304fdc: movaps xmm3, xmmword ptr [rsp + 0x40]
0000000140304fe1: movaps xmm4, xmmword ptr [rsp + 0x70]
0000000140304fe6: movups xmmword ptr [rsp + 0xd0], xmm4
0000000140304fee: movups xmmword ptr [rsp + 0xa0], xmm3
0000000140304ff6: movups xmmword ptr [rsp + 0x90], xmm2
0000000140304ffe: movups xmm2, xmmword ptr [rcx]
0000000140305001: movups xmmword ptr [rsp + 0x318], xmm2
0000000140305009: mov ecx, dword ptr [rcx + 0x10]
000000014030500c: mov dword ptr [rsp + 0x328], ecx
0000000140305013: mov rcx, qword ptr [rdx]
0000000140305016: add rdx, 8
000000014030501a: movaps xmm2, xmmword ptr [rsp + 0x130]
0000000140305022: movups xmmword ptr [rsp + 0x198], xmm2
000000014030502a: movaps xmm2, xmmword ptr [rsp + 0x120]
0000000140305032: movups xmmword ptr [rsp + 0x188], xmm2
000000014030503a: movaps xmm2, xmmword ptr [rsp + 0xe0]
0000000140305042: movaps xmm3, xmmword ptr [rsp + 0xf0]
000000014030504a: movaps xmm4, xmmword ptr [rsp + 0x100]
0000000140305052: movaps xmm5, xmmword ptr [rsp + 0x110]
000000014030505a: movups xmmword ptr [rsp + 0x178], xmm5
0000000140305062: movups xmmword ptr [rsp + 0x168], xmm4
000000014030506a: movups xmmword ptr [rsp + 0x158], xmm3
0000000140305072: movups xmmword ptr [rsp + 0x148], xmm2
000000014030507a: mov qword ptr [rsp + 0x1a8], 0
0000000140305086: mov dword ptr [rsp + 0x1b0], r8d
000000014030508e: movss dword ptr [rsp + 0x1b4], xmm1
0000000140305097: mov dword ptr [rsp + 0x1b8], eax
000000014030509e: movss dword ptr [rsp + 0x1bc], xmm0
00000001403050a7: movsd xmm0, qword ptr [rip + 0x5bf87d1]
00000001403050af: movups xmmword ptr [rsp + 0x1c0], xmm0
00000001403050b7: movaps xmm0, xmmword ptr [rip + 0x5bdd082]
00000001403050be: movups xmmword ptr [rsp + 0x1d0], xmm0
00000001403050c6: movups xmm0, xmmword ptr [rip + 0x5bf89cb]
00000001403050cd: movups xmmword ptr [rsp + 0x210], xmm0
00000001403050d5: movups xmm0, xmmword ptr [rip + 0x5bf89ac]
00000001403050dc: movups xmmword ptr [rsp + 0x200], xmm0
00000001403050e4: movups xmm0, xmmword ptr [rip + 0x5bf89bd]
00000001403050eb: movups xmmword ptr [rsp + 0x220], xmm0
00000001403050f3: movups xmm0, xmmword ptr [rip + 0x5bf89be]
00000001403050fa: movups xmmword ptr [rsp + 0x230], xmm0
0000000140305102: movaps xmm0, xmmword ptr [rip + 0x5b9cf57]
0000000140305109: movups xmmword ptr [rsp + 0x240], xmm0
0000000140305111: movups xmmword ptr [rsp + 0x250], xmm0
0000000140305119: movaps xmm0, xmmword ptr [rip + 0x5bf7d80]
0000000140305120: movups xmmword ptr [rsp + 0x260], xmm0
0000000140305128: movups xmmword ptr [rsp + 0x270], xmm0
0000000140305130: movaps xmm0, xmmword ptr [rip + 0x5b9cef9]
0000000140305137: movups xmmword ptr [rsp + 0x280], xmm0
000000014030513f: mov dword ptr [rsp + 0x290], 1
000000014030514a: mov qword ptr [rsp + 0x294], 0
0000000140305156: mov byte ptr [rsp + 0x29c], 1
000000014030515e: mov qword ptr [rsp + 0x2a0], 0
000000014030516a: mov dword ptr [rsp + 0x2a8], 0x3f800000
0000000140305175: mov word ptr [rsp + 0x2ac], 0
000000014030517f: mov word ptr [rsp + 0x2b2], 0
0000000140305189: mov dword ptr [rsp + 0x2ae], 0x10000
0000000140305194: movabs rax, 0x100000000010000
000000014030519e: mov qword ptr [rsp + 0x2b4], rax
00000001403051a6: mov dword ptr [rsp + 0x2c2], 0x5000005
00000001403051b1: movzx eax, word ptr [rsp + 0xde]
00000001403051b9: mov word ptr [rsp + 0x316], ax
00000001403051c1: movups xmm0, xmmword ptr [rsp + 0xce]
00000001403051c9: movups xmmword ptr [rsp + 0x306], xmm0
00000001403051d1: movups xmm0, xmmword ptr [rsp + 0x8e]
00000001403051d9: movups xmm1, xmmword ptr [rsp + 0x9e]
00000001403051e1: movups xmm2, xmmword ptr [rsp + 0xae]
00000001403051e9: movups xmm3, xmmword ptr [rsp + 0xbe]
00000001403051f1: movups xmmword ptr [rsp + 0x2f6], xmm3
00000001403051f9: movups xmmword ptr [rsp + 0x2e6], xmm2
0000000140305201: movups xmmword ptr [rsp + 0x2d6], xmm1
0000000140305209: movups xmmword ptr [rsp + 0x2c6], xmm0
0000000140305211: mov qword ptr [rsp + 0x140], rcx
0000000140305219: lea rcx, [rsp + 0x30]
000000014030521e: lea r8, [rsp + 0x140]
0000000140305226: call 0x140263620
000000014030522b: test rsi, rsi
000000014030522e: jns 0x140305240
0000000140305230: xor r15d, r15d
0000000140305233: mov rcx, r15
0000000140305236: mov rdx, rsi
0000000140305239: call 0x145e9bd8b
000000014030523e: ud2
0000000140305240: je 0x14030528f
0000000140305242: call 0x140002200
0000000140305247: mov r15d, 1
000000014030524d: mov edx, 1
0000000140305252: mov rcx, rsi
0000000140305255: call 0x1400021c0
000000014030525a: test rax, rax
000000014030525d: je 0x140305233
000000014030525f: mov r14, rax
0000000140305262: mov rcx, rax
0000000140305265: mov rdx, rbx
0000000140305268: mov r8, rsi
000000014030526b: call 0x145cf998b
0000000140305270: cmp byte ptr [rdi], 0
0000000140305273: je 0x14030529a
0000000140305275: mov eax, dword ptr [rdi + 1]
0000000140305278: mov ecx, dword ptr [rdi + 4]
000000014030527b: mov dword ptr [rsp + 0x2b], ecx
000000014030527f: mov dword ptr [rsp + 0x28], eax
0000000140305283: movzx eax, byte ptr [rdi + 0x10]
0000000140305287: add rdi, 8
000000014030528b: mov cl, 1
000000014030528d: jmp 0x1403052ae
000000014030528f: mov r14d, 1
0000000140305295: cmp byte ptr [rdi], 0
0000000140305298: jne 0x140305275
000000014030529a: mov rax, qword ptr [rdi + 8]
000000014030529e: lock inc qword ptr [rax]
00000001403052a2: jle 0x140305375
00000001403052a8: add rdi, 8
00000001403052ac: xor ecx, ecx
00000001403052ae: mov rdx, qword ptr [rdi]
00000001403052b1: mov qword ptr [rsp + 0x158], 0
00000001403052bd: mov qword ptr [rsp + 0x160], 4
00000001403052c9: mov qword ptr [rsp + 0x168], 0
00000001403052d5: mov qword ptr [rsp + 0x140], rsi
00000001403052dd: mov qword ptr [rsp + 0x148], r14
00000001403052e5: mov qword ptr [rsp + 0x150], rsi
00000001403052ed: mov byte ptr [rsp + 0x170], cl
00000001403052f4: mov ecx, dword ptr [rsp + 0x28]
00000001403052f8: mov r8d, dword ptr [rsp + 0x2b]
00000001403052fd: mov dword ptr [rsp + 0x171], ecx
0000000140305304: mov dword ptr [rsp + 0x174], r8d
000000014030530c: mov qword ptr [rsp + 0x178], rdx
0000000140305314: mov qword ptr [rsp + 0x180], rax
000000014030531c: mov dword ptr [rsp + 0x188], 0x41300000
0000000140305327: mov word ptr [rsp + 0x18c], 0x190
0000000140305331: mov byte ptr [rsp + 0x18e], 1
0000000140305339: movups xmmword ptr [rsp + 0x190], xmm6
0000000140305341: mov dword ptr [rsp + 0x1a0], 0x3f800000
000000014030534c: lea rcx, [rsp + 0x30]
0000000140305351: lea rdx, [rsp + 0x140]
0000000140305359: call 0x14027fc90
000000014030535e: movaps xmm6, xmmword ptr [rsp + 0x330]
0000000140305366: add rsp, 0x340
000000014030536d: pop rbx
000000014030536e: pop rdi
000000014030536f: pop rsi
0000000140305370: pop r14
0000000140305372: pop r15
0000000140305374: ret
0000000140305375: ud2
