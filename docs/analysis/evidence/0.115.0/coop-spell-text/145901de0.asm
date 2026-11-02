0x145901de0: push rbp
0x145901de1: push r15
0x145901de3: push r14
0x145901de5: push r13
0x145901de7: push r12
0x145901de9: push rsi
0x145901dea: push rdi
0x145901deb: push rbx
0x145901dec: sub rsp, 0x218
0x145901df3: lea rbp, [rsp + 0x80]
0x145901dfb: movaps xmmword ptr [rbp + 0x180], xmm6
0x145901e02: mov qword ptr [rbp + 0x178], 0xfffffffffffffffe
0x145901e0d: mov qword ptr [rbp - 0x48], rcx
0x145901e11: lea rax, [rdx + 0x338]
0x145901e18: lea rcx, [rdx + 0x490]
0x145901e1f: mov qword ptr [rbp + 0x148], rcx
0x145901e26: mov qword ptr [rbp + 0x168], rdx
0x145901e2d: movzx ecx, byte ptr [rdx + 0x32c]
0x145901e34: mov qword ptr [rbp - 0x50], rcx
0x145901e38: add ecx, -2
0x145901e3b: cmp cl, 9
0x145901e3e: ja 0x145901e50
0x145901e40: movzx ecx, cl
0x145901e43: lea rdx, [rip + 0x1a30aa6]
0x145901e4a: mov rcx, qword ptr [rdx + rcx*8]
0x145901e4e: jmp 0x145901e57
0x145901e50: lea rcx, [rip + 0x13c1201]
0x145901e57: mov rdx, qword ptr [rcx + 0x30]
0x145901e5b: mov rcx, qword ptr [rcx + 0x38]
0x145901e5f: shl rcx, 4
0x145901e63: add rcx, rdx
0x145901e66: mov qword ptr [rbp - 8], rdx
0x145901e6a: mov qword ptr [rbp], rcx
0x145901e6e: mov rsi, qword ptr [rbp + 0x168]
0x145901e75: mov qword ptr [rbp + 8], rsi
0x145901e79: mov qword ptr [rbp + 0x10], rax
0x145901e7d: mov rdi, qword ptr [rbp + 0x148]
0x145901e84: mov qword ptr [rbp + 0x18], rdi
0x145901e88: lea rcx, [rbp + 0x128]
0x145901e8f: lea rdx, [rbp - 8]
0x145901e93: call 0x1459d5480
0x145901e98: lea rdx, [rsi + 0x420]
0x145901e9f: mov qword ptr [rbp + 0x108], 0
0x145901eaa: mov qword ptr [rbp + 0x110], 8
0x145901eb5: mov qword ptr [rbp + 0x118], 0
0x145901ec0: lea rax, [rbp + 0x108]
0x145901ec7: mov qword ptr [rsp + 0x20], rax
0x145901ecc: lea rcx, [rbp - 8]
0x145901ed0: mov qword ptr [rbp + 0xf8], rdx
0x145901ed7: mov r8, rdi
0x145901eda: mov r9b, 2
0x145901edd: call 0x1458629b0
0x145901ee2: nop
0x145901ee3: mov r15, qword ptr [rbp + 0x138]
0x145901eea: cmp r15, qword ptr [rbp + 0x128]
0x145901ef1: jne 0x145901f00
0x145901ef3: lea rcx, [rbp + 0x128]
0x145901efa: call 0x145d40d30
0x145901eff: nop
0x145901f00: mov r13, qword ptr [rbp + 0x130]
0x145901f07: imul rcx, r15, 0xb0
0x145901f0e: add rcx, r13
0x145901f11: lea rdi, [rbp - 8]
0x145901f15: mov r8d, 0xb0
0x145901f1b: mov rdx, rdi
0x145901f1e: call 0x145d145fb
0x145901f23: inc r15
0x145901f26: mov qword ptr [rbp + 0x138], r15
0x145901f2d: mov rcx, qword ptr [rbp + 0x168]
0x145901f34: mov rbx, qword ptr [rcx + 0xb8]
0x145901f3b: mov rax, qword ptr [rcx + 0xc0]
0x145901f42: lea r12, [rax + rax*2]
0x145901f46: shl r12, 5
0x145901f4a: add r12, rbx
0x145901f4d: mov rax, qword ptr [rcx + 0x1d0]
0x145901f54: mov r14, qword ptr [rcx + 0x1d8]
0x145901f5b: shl r14, 4
0x145901f5f: mov qword ptr [rbp + 0x150], rax
0x145901f66: add r14, rax
0x145901f69: lea rsi, [rbp - 0x30]
0x145901f6d: jmp 0x145901f99
0x145901f6f: nop
0x145901f70: mov r13, qword ptr [rbp + 0x130]
0x145901f77: imul rcx, r15, 0xb0
0x145901f7e: add rcx, r13
0x145901f81: mov r8d, 0xb0
0x145901f87: mov rdx, rdi
0x145901f8a: call 0x145d145fb
0x145901f8f: inc r15
0x145901f92: mov qword ptr [rbp + 0x138], r15
0x145901f99: imul rax, r15, 0xb0
0x145901fa0: mov r15, rbx
0x145901fa3: cmp rbx, r12
0x145901fa6: je 0x145902085
0x145901fac: lea rbx, [r15 + 0x60]
0x145901fb0: mov rcx, qword ptr [r15]
0x145901fb3: mov edx, dword ptr [rcx + 0x40]
0x145901fb6: mov r8, rax
0x145901fb9: mov r9, r13
0x145901fbc: nop dword ptr [rax]
0x145901fc0: test r8, r8
0x145901fc3: je 0x145901fe0
0x145901fc5: add r8, -0xb0
0x145901fcc: cmp dword ptr [r9 + 0xa8], edx
0x145901fd3: lea r9, [r9 + 0xb0]
0x145901fda: jne 0x145901fc0
0x145901fdc: jmp 0x145901fa0
0x145901fde: nop
0x145901fe0: mov qword ptr [rbp - 0x30], rcx
0x145901fe4: mov qword ptr [rbp + 0xe0], rcx
0x145901feb: mov qword ptr [rbp + 0xe8], rsi
0x145901ff2: mov qword ptr [rbp + 0xc8], rsi
0x145901ff9: mov qword ptr [rbp + 0xd0], rcx
0x145902000: mov rax, qword ptr [rbp + 0x150]
0x145902007: mov qword ptr [rbp - 8], rax
0x14590200b: mov qword ptr [rbp], r14
0x14590200f: lea rax, [rbp + 0xe0]
0x145902016: mov qword ptr [rbp + 8], rax
0x14590201a: lea rax, [rbp + 0xc8]
0x145902021: mov qword ptr [rbp + 0x10], rax
0x145902025: mov qword ptr [rbp + 0x18], rcx
0x145902029: mov qword ptr [rbp + 0x20], rsi
0x14590202d: lea rcx, [rbp + 0x108]
0x145902034: mov rdx, rdi
0x145902037: call 0x1459c2b50
0x14590203c: nop
0x14590203d: lea rax, [rbp + 0x108]
0x145902044: mov qword ptr [rsp + 0x20], rax
0x145902049: mov rcx, rdi
0x14590204c: mov rdx, r15
0x14590204f: mov r8, qword ptr [rbp + 0x148]
0x145902056: mov r9b, 3
0x145902059: call 0x1458629b0
0x14590205e: nop
0x14590205f: mov r15, qword ptr [rbp + 0x138]
0x145902066: cmp r15, qword ptr [rbp + 0x128]
0x14590206d: jne 0x145901f70
0x145902073: lea rcx, [rbp + 0x128]
0x14590207a: call 0x145d40d30
0x14590207f: nop
0x145902080: jmp 0x145901f70
0x145902085: lea r15, [rip + 0x1a2df88]
0x14590208c: mov esi, 5
0x145902091: mov edx, 5
0x145902096: mov rcx, r15
0x145902099: call 0x1458dff90
0x14590209e: mov qword ptr [rbp + 0x148], rdx
0x1459020a5: test rax, rax
0x1459020a8: cmovne r15, rax
0x1459020ac: mov rax, qword ptr [rbp + 0x148]
0x1459020b3: cmove rax, rsi
0x1459020b7: mov qword ptr [rbp + 0x148], rax
0x1459020be: lea rbx, [rip + 0x1a2df54]
0x1459020c5: mov esi, 0x20
0x1459020ca: mov edx, 0x20
0x1459020cf: mov rcx, rbx
0x1459020d2: call 0x1458dff90
0x1459020d7: mov qword ptr [rbp + 0x150], rdx
0x1459020de: test rax, rax
0x1459020e1: cmovne rbx, rax
0x1459020e5: mov rax, qword ptr [rbp + 0x150]
0x1459020ec: cmove rax, rsi
0x1459020f0: mov qword ptr [rbp + 0x150], rax
0x1459020f7: lea rdi, [rip + 0x1a2df3b]
0x1459020fe: mov edx, 0xa
0x145902103: mov rcx, rdi
0x145902106: call 0x1458dff90
0x14590210b: nop
0x14590210c: mov r12, rax
0x14590210f: mov r13, rdx
0x145902112: lea rsi, [rip + 0x1a2df2a]
0x145902119: mov r14d, 0x18
0x14590211f: mov edx, 0x18
0x145902124: mov rcx, rsi
0x145902127: call 0x1458dff90
0x14590212c: nop
0x14590212d: test r12, r12
0x145902130: mov ecx, 0xa
0x145902135: cmove r13, rcx
0x145902139: cmovne rdi, r12
0x14590213d: test rax, rax
0x145902140: cmovne rsi, rax
0x145902144: cmove rdx, r14
0x145902148: mov r12, qword ptr [rbp + 0x148]
0x14590214f: test r12, r12
0x145902152: jns 0x145902165
0x145902154: xor r12d, r12d
0x145902157: mov rcx, r12
0x14590215a: call 0x145eb6fcb
0x14590215f: nop
0x145902160: jmp 0x145903156
0x145902165: mov qword ptr [rbp + 0x140], r13
0x14590216c: je 0x1459021d0
0x14590216e: mov r14, rdx
0x145902171: call 0x140002200
0x145902176: mov r13, r12
0x145902179: mov r12d, 1
0x14590217f: mov edx, 1
0x145902184: mov rcx, r13
0x145902187: call 0x1400021c0
0x14590218c: test rax, rax
0x14590218f: je 0x1459030f3
0x145902195: mov rcx, rax
0x145902198: mov rdx, r15
0x14590219b: mov r8, r13
0x14590219e: mov r15, rax
0x1459021a1: call 0x145d145fb
0x1459021a6: mov rax, r15
0x1459021a9: mov rdx, r14
0x1459021ac: mov r12, r13
0x1459021af: mov r13, qword ptr [rbp + 0x150]
0x1459021b6: test r13, r13
0x1459021b9: jns 0x1459021e1
0x1459021bb: xor ecx, ecx
0x1459021bd: mov qword ptr [rbp - 0x18], r12
0x1459021c1: mov qword ptr [rbp - 0x20], rax
0x1459021c5: call 0x145eb6fcb
0x1459021ca: nop
0x1459021cb: jmp 0x145903156
0x1459021d0: mov eax, 1
0x1459021d5: mov r13, qword ptr [rbp + 0x150]
0x1459021dc: test r13, r13
0x1459021df: js 0x1459021bb
0x1459021e1: mov qword ptr [rbp + 0x160], rdx
0x1459021e8: je 0x145902259
0x1459021ea: mov qword ptr [rbp + 0x158], rax
0x1459021f1: call 0x140002200
0x1459021f6: mov edx, 1
0x1459021fb: mov rcx, r13
0x1459021fe: call 0x1400021c0
0x145902203: test rax, rax
0x145902206: je 0x145903129
0x14590220c: mov r14, rax
0x14590220f: mov rcx, rax
0x145902212: mov rdx, rbx
0x145902215: mov r8, r13
0x145902218: call 0x145d145fb
0x14590221d: call 0x140002200
0x145902222: mov edx, 1
0x145902227: mov rcx, r13
0x14590222a: call 0x1400021c0
0x14590222f: test rax, rax
0x145902232: je 0x14590313d
0x145902238: mov r15, rax
0x14590223b: mov rcx, rax
0x14590223e: mov rdx, rbx
0x145902241: mov r8, r13
0x145902244: call 0x145d145fb
0x145902249: mov qword ptr [rbp + 0x148], r14
0x145902250: mov rax, qword ptr [rbp + 0x158]
0x145902257: jmp 0x145902271
0x145902259: mov r15d, 1
0x14590225f: mov r14d, 1
0x145902265: mov ecx, 1
0x14590226a: mov qword ptr [rbp + 0x148], rcx
0x145902271: mov dword ptr [rbp + 0xa0], 0x5b9b
0x14590227b: mov qword ptr [rbp - 8], r12
0x14590227f: mov rbx, rax
0x145902282: mov qword ptr [rbp], rax
0x145902286: mov qword ptr [rbp + 8], r12
0x14590228a: mov qword ptr [rbp + 0x40], 0xffffffffffffffff
0x145902292: mov qword ptr [rbp + 0x58], 0xffffffffffffffff
0x14590229a: mov qword ptr [rbp + 0x70], 0xffffffffffffffff
0x1459022a2: mov qword ptr [rbp + 0x88], 0xffffffffffffffff
0x1459022ad: mov qword ptr [rbp + 0x10], r13
0x1459022b1: mov qword ptr [rbp + 0x18], r14
0x1459022b5: mov qword ptr [rbp + 0x20], r13
0x1459022b9: mov qword ptr [rbp + 0x28], r13
0x1459022bd: mov qword ptr [rbp + 0x30], r15
0x1459022c1: mov qword ptr [rbp + 0x38], r13
0x1459022c5: mov r14, qword ptr [rbp + 0x138]
0x1459022cc: cmp r14, qword ptr [rbp + 0x128]
0x1459022d3: jne 0x1459022e2
0x1459022d5: lea rcx, [rbp + 0x128]
0x1459022dc: call 0x145d40d30
0x1459022e1: nop
0x1459022e2: imul rcx, r14, 0xb0
0x1459022e9: add rcx, qword ptr [rbp + 0x130]
0x1459022f0: lea rdx, [rbp - 8]
0x1459022f4: mov r8d, 0xb0
0x1459022fa: call 0x145d145fb
0x1459022ff: inc r14
0x145902302: mov qword ptr [rbp + 0x138], r14
0x145902309: mov r15, qword ptr [rbp + 0x140]
0x145902310: test r15, r15
0x145902313: jns 0x145902320
0x145902315: xor r12d, r12d
0x145902318: mov rdx, rbx
0x14590231b: jmp 0x145902157
0x145902320: je 0x145902374
0x145902322: call 0x140002200
0x145902327: mov r12d, 1
0x14590232d: mov edx, 1
0x145902332: mov rcx, r15
0x145902335: call 0x1400021c0
0x14590233a: test rax, rax
0x14590233d: je 0x145903158
0x145902343: mov rcx, rax
0x145902346: mov rdx, rdi
0x145902349: mov r8, r15
0x14590234c: mov rdi, rax
0x14590234f: call 0x145d145fb
0x145902354: mov rax, rdi
0x145902357: mov rbx, qword ptr [rbp + 0x160]
0x14590235e: test rbx, rbx
0x145902361: jns 0x145902385
0x145902363: xor ecx, ecx
0x145902365: mov r12, r15
0x145902368: mov rdx, qword ptr [rbp + 0x148]
0x14590236f: jmp 0x1459021bd
0x145902374: mov eax, 1
0x145902379: mov rbx, qword ptr [rbp + 0x160]
0x145902380: test rbx, rbx
0x145902383: js 0x145902363
0x145902385: je 0x1459023f2
0x145902387: mov r14, rax
0x14590238a: call 0x140002200
0x14590238f: mov edx, 1
0x145902394: mov rcx, rbx
0x145902397: call 0x1400021c0
0x14590239c: test rax, rax
0x14590239f: je 0x145903160
0x1459023a5: mov qword ptr [rbp + 0x120], rax
0x1459023ac: mov rcx, rax
0x1459023af: mov rdx, rsi
0x1459023b2: mov r8, rbx
0x1459023b5: call 0x145d145fb
0x1459023ba: call 0x140002200
0x1459023bf: mov edx, 1
0x1459023c4: mov rcx, rbx
0x1459023c7: call 0x1400021c0
0x1459023cc: test rax, rax
0x1459023cf: je 0x145903173
0x1459023d5: mov rdi, rax
0x1459023d8: mov rcx, rax
0x1459023db: mov rdx, rsi
0x1459023de: mov r8, rbx
0x1459023e1: call 0x145d145fb
0x1459023e6: mov rax, r14
0x1459023e9: mov rcx, qword ptr [rbp + 0x120]
0x1459023f0: jmp 0x1459023fc
0x1459023f2: mov edi, 1
0x1459023f7: mov ecx, 1
0x1459023fc: mov dword ptr [rbp + 0xa0], 0x5bd1
0x145902406: mov qword ptr [rbp - 8], r15
0x14590240a: mov qword ptr [rbp], rax
0x14590240e: mov qword ptr [rbp + 8], r15
0x145902412: mov qword ptr [rbp + 0x40], 0xffffffffffffffff
0x14590241a: mov qword ptr [rbp + 0x58], 0xffffffffffffffff
0x145902422: mov qword ptr [rbp + 0x70], 0xffffffffffffffff
0x14590242a: mov qword ptr [rbp + 0x88], 0xffffffffffffffff
0x145902435: mov qword ptr [rbp + 0x10], rbx
0x145902439: mov qword ptr [rbp + 0x18], rcx
0x14590243d: mov qword ptr [rbp + 0x20], rbx
0x145902441: mov qword ptr [rbp + 0x28], rbx
0x145902445: mov qword ptr [rbp + 0x30], rdi
0x145902449: mov qword ptr [rbp + 0x38], rbx
0x14590244d: mov rsi, qword ptr [rbp + 0x138]
0x145902454: cmp rsi, qword ptr [rbp + 0x128]
0x14590245b: jne 0x14590246a
0x14590245d: lea rcx, [rbp + 0x128]
0x145902464: call 0x145d40d30
0x145902469: nop
0x14590246a: imul rcx, rsi, 0xb0
0x145902471: add rcx, qword ptr [rbp + 0x130]
0x145902478: lea rdx, [rbp - 8]
0x14590247c: mov r8d, 0xb0
0x145902482: call 0x145d145fb
0x145902487: inc rsi
0x14590248a: mov qword ptr [rbp + 0x138], rsi
0x145902491: mov qword ptr [rbp + 0xe0], 0
0x14590249c: mov qword ptr [rbp + 0xe8], 8
0x1459024a7: mov qword ptr [rbp + 0xf0], 0
0x1459024b2: mov rsi, qword ptr [rbp + 0x168]
0x1459024b9: mov rdx, qword ptr [rsi + 0x838]
0x1459024c0: mov r8, qword ptr [rsi + 0x840]
0x1459024c7: lea rcx, [rbp - 8]
0x1459024cb: mov qword ptr [rbp + 0x150], rdx
0x1459024d2: mov qword ptr [rbp + 0x140], r8
0x1459024d9: call 0x1458f72c0
0x1459024de: nop
0x1459024df: mov rax, qword ptr [rbp - 8]
0x1459024e3: mov qword ptr [rbp + 0x120], rax
0x1459024ea: mov r12, qword ptr [rbp]
0x1459024ee: mov r15, qword ptr [rbp + 8]
0x1459024f2: shl r15, 4
0x1459024f6: add r15, r12
0x1459024f9: mov r14, qword ptr [rsi + 0x850]
0x145902500: mov rax, qword ptr [rsi + 0x858]
0x145902507: mov qword ptr [rbp + 0x148], rax
0x14590250e: mov rax, qword ptr [rsi + 0x58]
0x145902512: mov qword ptr [rbp - 0x40], rax
0x145902516: mov rdi, qword ptr [rsi + 0x60]
0x14590251a: movss xmm0, dword ptr [rsi + 0x4fc]
0x145902522: xorps xmm6, xmm6
0x145902525: maxss xmm0, xmm6
0x145902529: call 0x145d1463d
0x14590252e: cvttss2si rax, xmm0
0x145902533: xor ecx, ecx
0x145902535: ucomiss xmm0, xmm6
0x145902538: cmovb eax, ecx
0x14590253b: ucomiss xmm0, dword ptr [rip + 0x5fe672]
0x145902542: mov ecx, 0xffffffff
0x145902547: cmovbe ecx, eax
0x14590254a: mov dword ptr [rbp - 0xc], ecx
0x14590254d: shl rdi, 4
0x145902551: mov qword ptr [rbp - 0x38], rdi
0x145902555: movss xmm6, dword ptr [rip + 0x5dd953]
0x14590255d: mov qword ptr [rbp + 0xb8], r12
0x145902564: mov rax, qword ptr [rbp + 0x168]
0x14590256b: mov qword ptr [rbp + 0x100], r13
0x145902572: cmp r12, r15
0x145902575: je 0x145902988
0x14590257b: test r14, r14
0x14590257e: sete al
0x145902581: mov rdi, qword ptr [r12]
0x145902585: movzx ebx, byte ptr [r12 + 8]
0x14590258b: cmp rdi, qword ptr [rbp + 0x148]
0x145902592: setae cl
0x145902595: or cl, al
0x145902597: cmp cl, 1
0x14590259a: jne 0x1459025cb
0x14590259c: mov esi, 1
0x1459025a1: mov ecx, 1
0x1459025a6: xor edx, edx
0x1459025a8: mov r8d, ebx
0x1459025ab: call 0x14585c570
0x1459025b0: mov dword ptr [rbp + 0x160], eax
0x1459025b6: xor r10d, r10d
0x1459025b9: cmp rdi, qword ptr [rbp + 0x140]
0x1459025c0: jb 0x145902692
0x1459025c6: jmp 0x1459030fb
0x1459025cb: mov qword ptr [rbp + 0x158], r12
0x1459025d2: mov rsi, r15
0x1459025d5: lea rax, [rdi + rdi*4]
0x1459025d9: mov r15, qword ptr [r14 + rax*8 + 8]
0x1459025de: mov r13, r14
0x1459025e1: mov r14, qword ptr [r14 + rax*8 + 0x10]
0x1459025e6: mov rcx, r15
0x1459025e9: mov rdx, r14
0x1459025ec: mov r8d, ebx
0x1459025ef: call 0x14585c570
0x1459025f4: mov dword ptr [rbp + 0x160], eax
0x1459025fa: test r14, r14
0x1459025fd: js 0x145902970
0x145902603: je 0x14590265d
0x145902605: mov r12, r14
0x145902608: mov qword ptr [rbp + 0xa8], r13
0x14590260f: call 0x140002200
0x145902614: mov r13d, 1
0x14590261a: mov edx, 1
0x14590261f: mov rcx, r14
0x145902622: call 0x1400021c0
0x145902627: test rax, rax
0x14590262a: je 0x14590318a
0x145902630: mov rcx, rax
0x145902633: mov rdx, r15
0x145902636: mov r8, r12
0x145902639: mov r15, rax
0x14590263c: call 0x145d145fb
0x145902641: mov qword ptr [rbp + 0xb0], r15
0x145902648: mov rcx, r15
0x14590264b: mov r14, qword ptr [rbp + 0xa8]
0x145902652: mov r15, rsi
0x145902655: mov rsi, rcx
0x145902658: mov r10, r12
0x14590265b: jmp 0x145902677
0x14590265d: mov eax, 1
0x145902662: mov qword ptr [rbp + 0xb0], rax
0x145902669: mov r15, rsi
0x14590266c: mov esi, 1
0x145902671: xor r10d, r10d
0x145902674: mov r14, r13
0x145902677: mov r13, qword ptr [rbp + 0x100]
0x14590267e: mov r12, qword ptr [rbp + 0x158]
0x145902685: cmp rdi, qword ptr [rbp + 0x140]
0x14590268c: jae 0x1459030fb
0x145902692: movzx edx, bl
0x145902695: mov rax, rdi
0x145902698: shl rax, 6
0x14590269c: mov rcx, qword ptr [rbp + 0x150]
0x1459026a3: movzx ecx, byte ptr [rcx + rax]
0x1459026a7: cmp edx, 1
0x1459026aa: je 0x1459026bb
0x1459026ac: cmp edx, 2
0x1459026af: jne 0x1459026f3
0x1459026b1: cmp cl, 0x13
0x1459026b4: jne 0x1459026c4
0x1459026b6: jmp 0x14590278f
0x1459026bb: cmp cl, 0xf
0x1459026be: je 0x145902810
0x1459026c4: test r10, r10
0x1459026c7: je 0x1459026da
0x1459026c9: mov r8d, 1
0x1459026cf: mov rcx, rsi
0x1459026d2: mov rdx, r10
0x1459026d5: call 0x1400021d0
0x1459026da: add r12, 0x10
0x1459026de: mov rax, qword ptr [rbp + 0x168]
0x1459026e5: cmp r12, r15
0x1459026e8: jne 0x14590257b
0x1459026ee: jmp 0x145902988
0x1459026f3: mov qword ptr [rbp + 0xc0], rsi
0x1459026fa: mov qword ptr [rbp + 0x158], r10
0x145902701: mov byte ptr [rbp + 0x177], 1
0x145902708: mov edx, 0x13
0x14590270d: lea rcx, [rip + 0x1a2d754]
0x145902714: call 0x1458dff90
0x145902719: nop
0x14590271a: mov r8, rdx
0x14590271d: test rax, rax
0x145902720: lea rcx, [rip + 0x1a2d741]
0x145902727: cmove rax, rcx
0x14590272b: mov ecx, 0x13
0x145902730: cmove r8, rcx
0x145902734: mov ecx, dword ptr [rbp - 0xc]
0x145902737: mov dword ptr [rbp + 0x108], ecx
0x14590273d: lea rcx, [rip + 0x1a2d75c]
0x145902744: mov qword ptr [rbp - 8], rcx
0x145902748: mov qword ptr [rbp], 1
0x145902750: lea rcx, [rbp + 0x108]
0x145902757: mov qword ptr [rbp + 8], rcx
0x14590275b: lea rcx, [rip + 0x1a2d71e]
0x145902762: mov qword ptr [rbp + 0x10], rcx
0x145902766: mov byte ptr [rbp + 0x177], 1
0x14590276d: mov qword ptr [rsp + 0x20], 1
0x145902776: lea rcx, [rbp + 0xc8]
0x14590277d: mov rdx, rax
0x145902780: lea r9, [rbp - 8]
0x145902784: call 0x1458e0370
0x145902789: nop
0x14590278a: jmp 0x145902897
0x14590278f: mov qword ptr [rbp + 0xc0], rsi
0x145902796: mov qword ptr [rbp + 0x158], r10
0x14590279d: mov byte ptr [rbp + 0x177], 1
0x1459027a4: mov edx, 0x43
0x1459027a9: lea rcx, [rip + 0x1a2d6f1]
0x1459027b0: call 0x1458dff90
0x1459027b5: nop
0x1459027b6: mov rdi, rdx
0x1459027b9: test rax, rax
0x1459027bc: lea rcx, [rip + 0x1a2d6de]
0x1459027c3: cmove rax, rcx
0x1459027c7: mov ecx, 0x43
0x1459027cc: cmove rdi, rcx
0x1459027d0: test rdi, rdi
0x1459027d3: js 0x145902d4a
0x1459027d9: je 0x14590287c
0x1459027df: mov rbx, rax
0x1459027e2: call 0x140002200
0x1459027e7: mov edx, 1
0x1459027ec: mov rcx, rdi
0x1459027ef: call 0x1400021c0
0x1459027f4: test rax, rax
0x1459027f7: je 0x1459031a7
0x1459027fd: mov r13, rax
0x145902800: mov rcx, rax
0x145902803: mov rdx, rbx
0x145902806: mov r8, rdi
0x145902809: call 0x145d145fb
0x14590280e: jmp 0x145902882
0x145902810: add rax, qword ptr [rbp + 0x150]
0x145902817: movss xmm2, dword ptr [rax + 4]
0x14590281c: movzx edx, byte ptr [rax + 1]
0x145902820: xor eax, eax
0x145902822: mov r8, qword ptr [rbp - 0x40]
0x145902826: mov r9, qword ptr [rbp - 0x38]
0x14590282a: mov qword ptr [rbp + 0x158], r10
0x145902831: mov qword ptr [rbp + 0xc0], rsi
0x145902838: cmp r9, rax
0x14590283b: je 0x14590285f
0x14590283d: lea rcx, [rax + 0x10]
0x145902841: cmp qword ptr [r8 + rax], rdi
0x145902845: mov rax, rcx
0x145902848: jne 0x145902838
0x14590284a: mov eax, dword ptr [r8 + rcx - 8]
0x14590284f: cmp eax, 1
0x145902852: adc eax, 0
0x145902855: xorps xmm0, xmm0
0x145902858: cvtsi2ss xmm0, rax
0x14590285d: jmp 0x145902862
0x14590285f: movaps xmm0, xmm6
0x145902862: mulss xmm2, xmm0
0x145902866: mov byte ptr [rbp + 0x177], 1
0x14590286d: lea rcx, [rbp + 0xc8]
0x145902874: call 0x145844b50
0x145902879: nop
0x14590287a: jmp 0x145902897
0x14590287c: mov r13d, 1
0x145902882: mov qword ptr [rbp + 0xc8], rdi
0x145902889: mov qword ptr [rbp + 0xd0], r13
0x145902890: mov qword ptr [rbp + 0xd8], rdi
0x145902897: lea rcx, [rbp + 0x108]
0x14590289e: lea rdx, [rbp + 0xc8]
0x1459028a5: call 0x145ce7810
0x1459028aa: nop
0x1459028ab: mov rax, qword ptr [rbp + 0xd8]
0x1459028b2: lea rcx, [rbp + 0x10]
0x1459028b6: mov qword ptr [rcx + 0x28], rax
0x1459028ba: movups xmm0, xmmword ptr [rbp + 0xc8]
0x1459028c1: movups xmmword ptr [rcx + 0x18], xmm0
0x1459028c5: mov eax, dword ptr [rbp + 0x160]
0x1459028cb: mov dword ptr [rbp + 0xa0], eax
0x1459028d1: mov rax, qword ptr [rbp + 0x158]
0x1459028d8: mov qword ptr [rbp - 8], rax
0x1459028dc: mov rdx, qword ptr [rbp + 0xc0]
0x1459028e3: mov qword ptr [rbp], rdx
0x1459028e7: mov qword ptr [rbp + 8], rax
0x1459028eb: mov qword ptr [rbp + 0x40], 0xffffffffffffffff
0x1459028f3: mov qword ptr [rbp + 0x58], 0xffffffffffffffff
0x1459028fb: mov qword ptr [rbp + 0x70], 0xffffffffffffffff
0x145902903: mov qword ptr [rbp + 0x88], 0xffffffffffffffff
0x14590290e: mov rax, qword ptr [rbp + 0x118]
0x145902915: mov qword ptr [rcx + 0x10], rax
0x145902919: movups xmm0, xmmword ptr [rbp + 0x108]
0x145902920: movups xmmword ptr [rcx], xmm0
0x145902923: mov rsi, qword ptr [rbp + 0xf0]
0x14590292a: cmp rsi, qword ptr [rbp + 0xe0]
0x145902931: jne 0x145902940
0x145902933: lea rcx, [rbp + 0xe0]
0x14590293a: call 0x145d40d30
0x14590293f: nop
0x145902940: add r12, 0x10
0x145902944: imul rcx, rsi, 0xb0
0x14590294b: add rcx, qword ptr [rbp + 0xe8]
0x145902952: mov r8d, 0xb0
0x145902958: lea rdx, [rbp - 8]
0x14590295c: call 0x145d145fb
0x145902961: inc rsi
0x145902964: mov qword ptr [rbp + 0xf0], rsi
0x14590296b: jmp 0x145902564
0x145902970: xor r13d, r13d
0x145902973: mov rcx, r13
0x145902976: mov rdx, qword ptr [rbp + 0xb0]
0x14590297d: call 0x145eb6fcb
0x145902982: nop
0x145902983: jmp 0x145903156
0x145902988: mov rdx, qword ptr [rbp + 0x120]
0x14590298f: test rdx, rdx
0x145902992: je 0x1459029b1
0x145902994: shl rdx, 4
0x145902998: mov r8d, 8
0x14590299e: mov rcx, qword ptr [rbp + 0xb8]
0x1459029a5: call 0x1400021d0
0x1459029aa: mov rax, qword ptr [rbp + 0x168]
0x1459029b1: mov r15, qword ptr [rax + 0x340]
0x1459029b8: mov rcx, qword ptr [rax + 0x420]
0x1459029bf: mov qword ptr [rbp + 0xb0], rcx
0x1459029c6: imul rbx, qword ptr [rax + 0x348], 0x58
0x1459029ce: add rbx, r15
0x1459029d1: lea r12, [rip - 0x5900918]
0x1459029d8: lea r13, [rip + 0x13b24a1]
0x1459029df: mov qword ptr [rbp + 0x168], 0
0x1459029ea: mov qword ptr [rbp + 0xb8], rbx
0x1459029f1: mov qword ptr [rbp + 0xa8], r14
0x1459029f8: test r15, r15
0x1459029fb: je 0x145902a14
0x1459029fd: cmp r15, rbx
0x145902a00: je 0x145902a14
0x145902a02: mov rax, qword ptr [r15]
0x145902a05: cmp dword ptr [rax + 0x68], 0xc
0x145902a09: je 0x145902a5d
0x145902a0b: add r15, 0x58
0x145902a0f: cmp r15, rbx
0x145902a12: jne 0x145902a02
0x145902a14: cmp qword ptr [rbp + 0x168], 0
0x145902a1c: jne 0x145902d61
0x145902a22: mov rax, qword ptr [rbp + 0xb0]
0x145902a29: cmp dword ptr [rax + 0x68], 0xc
0x145902a2d: jne 0x145902d61
0x145902a33: mov dword ptr [rbp + 0x158], 0x1a84
0x145902a3d: mov eax, 1
0x145902a42: mov qword ptr [rbp + 0x168], rax
0x145902a49: mov qword ptr [rbp + 0x120], 0
0x145902a54: mov r15, qword ptr [rbp + 0xf8]
0x145902a5b: jmp 0x145902a72
0x145902a5d: lea rax, [r15 + 0x58]
0x145902a61: mov qword ptr [rbp + 0x120], rax
0x145902a68: mov dword ptr [rbp + 0x158], 0x64ab
0x145902a72: mov edx, 0x35
0x145902a77: lea rcx, [rip + 0x1a2d36d]
0x145902a7e: call 0x1458dff90
0x145902a83: nop
0x145902a84: mov rsi, rax
0x145902a87: mov rdi, rdx
0x145902a8a: mov rbx, qword ptr [r15]
0x145902a8d: mov qword ptr [rbp + 0x108], rbx
0x145902a94: mov qword ptr [rbp + 0x110], r12
0x145902a9b: lea rcx, [rbp - 8]
0x145902a9f: mov rdx, r13
0x145902aa2: lea r8, [rbp + 0x108]
0x145902aa9: call 0x145ce7350
0x145902aae: nop
0x145902aaf: mov rcx, qword ptr [rbp]
0x145902ab3: mov rdx, qword ptr [rbp + 8]
0x145902ab7: mov r14, qword ptr [rbx + 0x10]
0x145902abb: mov r13, qword ptr [rbx + 0x18]
0x145902abf: mov qword ptr [rbp + 0x160], rcx
0x145902ac6: call 0x1458dff90
0x145902acb: nop
0x145902acc: mov r12, rax
0x145902acf: mov rbx, rdx
0x145902ad2: mov rdx, qword ptr [rbp - 8]
0x145902ad6: test rdx, rdx
0x145902ad9: je 0x145902aed
0x145902adb: mov r8d, 1
0x145902ae1: mov rcx, qword ptr [rbp + 0x160]
0x145902ae8: call 0x1400021d0
0x145902aed: test rsi, rsi
0x145902af0: mov eax, 0x35
0x145902af5: cmove rdi, rax
0x145902af9: lea rax, [rip + 0x1a2d2eb]
0x145902b00: cmove rsi, rax
0x145902b04: test r12, r12
0x145902b07: cmovne r14, r12
0x145902b0b: cmove rbx, r13
0x145902b0f: mov qword ptr [rbp + 0x108], r14
0x145902b16: mov qword ptr [rbp + 0x110], rbx
0x145902b1d: lea rax, [rip + 0x1a2d2fc]
0x145902b24: mov qword ptr [rbp - 8], rax
0x145902b28: mov qword ptr [rbp], 5
0x145902b30: lea rax, [rbp + 0x108]
0x145902b37: mov qword ptr [rbp + 8], rax
0x145902b3b: lea rax, [rip + 0x1a2cd56]
0x145902b42: mov qword ptr [rbp + 0x10], rax
0x145902b46: mov qword ptr [rsp + 0x20], 1
0x145902b4f: lea rcx, [rbp + 0xc8]
0x145902b56: mov rdx, rsi
0x145902b59: mov r8, rdi
0x145902b5c: lea r9, [rbp - 8]
0x145902b60: call 0x1458e0370
0x145902b65: nop
0x145902b66: lea r12, [rip - 0x5900aad]
0x145902b6d: lea r13, [rip + 0x13b230c]
0x145902b74: mov rdi, qword ptr [r15]
0x145902b77: mov qword ptr [rbp - 0x30], rdi
0x145902b7b: mov qword ptr [rbp - 0x28], r12
0x145902b7f: mov byte ptr [rbp + 0x176], 1
0x145902b86: lea rcx, [rbp + 0x108]
0x145902b8d: mov rdx, r13
0x145902b90: lea r8, [rbp - 0x30]
0x145902b94: call 0x145ce7350
0x145902b99: nop
0x145902b9a: mov rcx, qword ptr [rbp + 0x110]
0x145902ba1: mov rdx, qword ptr [rbp + 0x118]
0x145902ba8: mov rsi, qword ptr [rdi + 0x10]
0x145902bac: mov rbx, qword ptr [rdi + 0x18]
0x145902bb0: mov qword ptr [rbp + 0x160], rcx
0x145902bb7: call 0x1458dff90
0x145902bbc: nop
0x145902bbd: mov rdi, rax
0x145902bc0: mov r15, rdx
0x145902bc3: mov rdx, qword ptr [rbp + 0x108]
0x145902bca: test rdx, rdx
0x145902bcd: je 0x145902be1
0x145902bcf: mov r8d, 1
0x145902bd5: mov rcx, qword ptr [rbp + 0x160]
0x145902bdc: call 0x1400021d0
0x145902be1: test rdi, rdi
0x145902be4: cmovne rsi, rdi
0x145902be8: cmove r15, rbx
0x145902bec: test r15, r15
0x145902bef: js 0x145902d2f
0x145902bf5: mov qword ptr [rbp + 0x160], r15
0x145902bfc: je 0x145902c37
0x145902bfe: call 0x140002200
0x145902c03: mov edx, 1
0x145902c08: mov rcx, r15
0x145902c0b: call 0x1400021c0
0x145902c10: test rax, rax
0x145902c13: mov rbx, qword ptr [rbp + 0xb8]
0x145902c1a: je 0x145903196
0x145902c20: mov qword ptr [rbp + 0x100], rax
0x145902c27: mov rcx, rax
0x145902c2a: mov rdx, rsi
0x145902c2d: mov r8, r15
0x145902c30: call 0x145d145fb
0x145902c35: jmp 0x145902c4a
0x145902c37: mov eax, 1
0x145902c3c: mov qword ptr [rbp + 0x100], rax
0x145902c43: mov rbx, qword ptr [rbp + 0xb8]
0x145902c4a: lea rcx, [rbp + 0x108]
0x145902c51: lea rdx, [rbp + 0xc8]
0x145902c58: call 0x145ce7810
0x145902c5d: nop
0x145902c5e: mov rax, qword ptr [rbp + 0xd8]
0x145902c65: lea rcx, [rbp + 0x10]
0x145902c69: mov qword ptr [rcx + 0x28], rax
0x145902c6d: movups xmm0, xmmword ptr [rbp + 0xc8]
0x145902c74: movups xmmword ptr [rcx + 0x18], xmm0
0x145902c78: mov eax, dword ptr [rbp + 0x158]
0x145902c7e: mov dword ptr [rbp + 0xa0], eax
0x145902c84: mov rdx, qword ptr [rbp + 0x160]
0x145902c8b: mov qword ptr [rbp - 8], rdx
0x145902c8f: mov rax, qword ptr [rbp + 0x100]
0x145902c96: mov qword ptr [rbp], rax
0x145902c9a: mov qword ptr [rbp + 8], rdx
0x145902c9e: mov qword ptr [rbp + 0x40], 0xffffffffffffffff
0x145902ca6: mov qword ptr [rbp + 0x58], 0xffffffffffffffff
0x145902cae: mov qword ptr [rbp + 0x70], 0xffffffffffffffff
0x145902cb6: mov qword ptr [rbp + 0x88], 0xffffffffffffffff
0x145902cc1: mov rax, qword ptr [rbp + 0x118]
0x145902cc8: mov qword ptr [rcx + 0x10], rax
0x145902ccc: movups xmm0, xmmword ptr [rbp + 0x108]
0x145902cd3: movups xmmword ptr [rcx], xmm0
0x145902cd6: mov rsi, qword ptr [rbp + 0xf0]
0x145902cdd: cmp rsi, qword ptr [rbp + 0xe0]
0x145902ce4: jne 0x145902cf3
0x145902ce6: lea rcx, [rbp + 0xe0]
0x145902ced: call 0x145d40d30
0x145902cf2: nop
0x145902cf3: imul rcx, rsi, 0xb0
0x145902cfa: add rcx, qword ptr [rbp + 0xe8]
0x145902d01: mov r8d, 0xb0
0x145902d07: lea rdx, [rbp - 8]
0x145902d0b: call 0x145d145fb
0x145902d10: inc rsi
0x145902d13: mov qword ptr [rbp + 0xf0], rsi
0x145902d1a: mov r15, qword ptr [rbp + 0x120]
0x145902d21: test r15, r15
0x145902d24: jne 0x1459029fd
0x145902d2a: jmp 0x145902a14
0x145902d2f: xor ecx, ecx
0x145902d31: mov byte ptr [rbp + 0x176], 1
0x145902d38: mov rdx, qword ptr [rbp + 0x100]
0x145902d3f: call 0x145eb6fcb
0x145902d44: nop
0x145902d45: jmp 0x145903156
0x145902d4a: xor ecx, ecx
0x145902d4c: mov byte ptr [rbp + 0x177], 1
0x145902d53: mov rdx, r13
0x145902d56: call 0x145eb6fcb
0x145902d5b: nop
0x145902d5c: jmp 0x145903156
0x145902d61: mov r15, qword ptr [rbp + 0x140]
0x145902d68: shl r15, 6
0x145902d6c: add r15, qword ptr [rbp + 0x150]
0x145902d73: xor ecx, ecx
0x145902d75: mov rax, qword ptr [rbp + 0x150]
0x145902d7c: cmp rax, r15
0x145902d7f: je 0x145902fda
0x145902d85: mov rbx, rcx
0x145902d88: lea rcx, [rax + 0x40]
0x145902d8c: mov qword ptr [rbp + 0x150], rcx
0x145902d93: lea rcx, [rbx + 1]
0x145902d97: cmp byte ptr [rax], 0x19
0x145902d9a: jne 0x145902d75
0x145902d9c: mov rsi, rcx
0x145902d9f: mov r13, r15
0x145902da2: mov edi, dword ptr [rax + 4]
0x145902da5: mov rcx, qword ptr [rbp - 0x50]
0x145902da9: mov edx, edi
0x145902dab: call 0x14585c430
0x145902db0: nop
0x145902db1: mov r12, rax
0x145902db4: test rax, rax
0x145902db7: mov r15, r13
0x145902dba: mov rcx, rsi
0x145902dbd: je 0x145902d75
0x145902dbf: cmp rbx, qword ptr [rbp + 0x148]
0x145902dc6: jae 0x145902e41
0x145902dc8: lea rax, [rbx + rbx*4]
0x145902dcc: mov rcx, qword ptr [rbp + 0xa8]
0x145902dd3: mov r14, qword ptr [rcx + rax*8 + 0x10]
0x145902dd8: test r14, r14
0x145902ddb: js 0x14590309a
0x145902de1: je 0x145902ec0
0x145902de7: mov rcx, qword ptr [rbp + 0xa8]
0x145902dee: mov rbx, qword ptr [rcx + rax*8 + 8]
0x145902df3: call 0x140002200
0x145902df8: mov edx, 1
0x145902dfd: mov qword ptr [rbp + 0x168], r14
0x145902e04: mov rcx, r14
0x145902e07: call 0x1400021c0
0x145902e0c: mov qword ptr [rbp + 0x140], rax
0x145902e13: test rax, rax
0x145902e16: je 0x1459031c7
0x145902e1c: mov r14, qword ptr [rbp + 0x140]
0x145902e23: mov rcx, r14
0x145902e26: mov rdx, rbx
0x145902e29: mov r8, qword ptr [rbp + 0x168]
0x145902e30: call 0x145d145fb
0x145902e35: mov qword ptr [rbp + 0xf8], r14
0x145902e3c: jmp 0x145902eec
0x145902e41: mov r14, qword ptr [r12 + 0x40]
0x145902e46: mov rbx, qword ptr [r12 + 0x48]
0x145902e4b: mov rcx, r14
0x145902e4e: mov rdx, rbx
0x145902e51: call 0x1458dff90
0x145902e56: nop
0x145902e57: mov r15, rdx
0x145902e5a: test rax, rax
0x145902e5d: cmovne r14, rax
0x145902e61: cmove r15, rbx
0x145902e65: test r15, r15
0x145902e68: js 0x1459030ae
0x145902e6e: je 0x145902ece
0x145902e70: call 0x140002200
0x145902e75: mov ebx, 1
0x145902e7a: mov edx, 1
0x145902e7f: mov qword ptr [rbp + 0x168], r15
0x145902e86: mov rcx, r15
0x145902e89: call 0x1400021c0
0x145902e8e: mov qword ptr [rbp + 0x160], rax
0x145902e95: test rax, rax
0x145902e98: je 0x1459031b4
0x145902e9e: mov rbx, qword ptr [rbp + 0x160]
0x145902ea5: mov rcx, rbx
0x145902ea8: mov rdx, r14
0x145902eab: mov r8, qword ptr [rbp + 0x168]
0x145902eb2: call 0x145d145fb
0x145902eb7: mov qword ptr [rbp + 0xf8], rbx
0x145902ebe: jmp 0x145902eec
0x145902ec0: mov eax, 1
0x145902ec5: mov qword ptr [rbp + 0x140], rax
0x145902ecc: jmp 0x145902eda
0x145902ece: mov eax, 1
0x145902ed3: mov qword ptr [rbp + 0x160], rax
0x145902eda: mov qword ptr [rbp + 0x168], 0
0x145902ee5: mov qword ptr [rbp + 0xf8], rax
0x145902eec: mov byte ptr [rbp + 0x175], 1
0x145902ef3: lea rbx, [rbp + 0xc8]
0x145902efa: mov rcx, rbx
0x145902efd: mov rdx, r12
0x145902f00: mov r8b, 1
0x145902f03: call 0x145855690
0x145902f08: nop
0x145902f09: mov r15, r13
0x145902f0c: lea rcx, [rbp + 0x108]
0x145902f13: mov rdx, rbx
0x145902f16: call 0x145ce7810
0x145902f1b: nop
0x145902f1c: mov rax, qword ptr [rbp + 0xd8]
0x145902f23: lea rcx, [rbp + 0x10]
0x145902f27: mov qword ptr [rcx + 0x28], rax
0x145902f2b: movups xmm0, xmmword ptr [rbp + 0xc8]
0x145902f32: movups xmmword ptr [rcx + 0x18], xmm0
0x145902f36: mov dword ptr [rbp + 0xa0], edi
0x145902f3c: mov rax, qword ptr [rbp + 0x168]
0x145902f43: mov qword ptr [rbp - 8], rax
0x145902f47: mov rdx, qword ptr [rbp + 0xf8]
0x145902f4e: mov qword ptr [rbp], rdx
0x145902f52: mov qword ptr [rbp + 8], rax
0x145902f56: mov qword ptr [rbp + 0x40], 0xffffffffffffffff
0x145902f5e: mov qword ptr [rbp + 0x58], 0xffffffffffffffff
0x145902f66: mov qword ptr [rbp + 0x70], 0xffffffffffffffff
0x145902f6e: mov qword ptr [rbp + 0x88], 0xffffffffffffffff
0x145902f79: mov rax, qword ptr [rbp + 0x118]
0x145902f80: mov qword ptr [rcx + 0x10], rax
0x145902f84: movups xmm0, xmmword ptr [rbp + 0x108]
0x145902f8b: movups xmmword ptr [rcx], xmm0
0x145902f8e: mov rdi, qword ptr [rbp + 0xf0]
0x145902f95: cmp rdi, qword ptr [rbp + 0xe0]
0x145902f9c: jne 0x145902fab
0x145902f9e: lea rcx, [rbp + 0xe0]
0x145902fa5: call 0x145d40d30
0x145902faa: nop
0x145902fab: imul rcx, rdi, 0xb0
0x145902fb2: add rcx, qword ptr [rbp + 0xe8]
0x145902fb9: mov r8d, 0xb0
0x145902fbf: lea rdx, [rbp - 8]
0x145902fc3: call 0x145d145fb
0x145902fc8: inc rdi
0x145902fcb: mov qword ptr [rbp + 0xf0], rdi
0x145902fd2: mov rcx, rsi
0x145902fd5: jmp 0x145902d75
0x145902fda: mov r15, qword ptr [rbp + 0xe0]
0x145902fe1: mov rsi, qword ptr [rbp + 0xe8]
0x145902fe8: mov rdi, qword ptr [rbp + 0xf0]
0x145902fef: imul rbx, rdi, 0xb0
0x145902ff6: lea rax, [rsi + rbx]
0x145902ffa: mov qword ptr [rbp - 8], rsi
0x145902ffe: mov qword ptr [rbp + 8], r15
0x145903002: mov qword ptr [rbp], rsi
0x145903006: mov qword ptr [rbp + 0x10], rax
0x14590300a: mov rax, qword ptr [rbp + 0x128]
0x145903011: mov r14, qword ptr [rbp + 0x138]
0x145903018: sub rax, r14
0x14590301b: cmp rdi, rax
0x14590301e: ja 0x1459030c5
0x145903024: test rdi, rdi
0x145903027: je 0x145903042
0x145903029: imul rcx, r14, 0xb0
0x145903030: add rcx, qword ptr [rbp + 0x130]
0x145903037: mov rdx, rsi
0x14590303a: mov r8, rbx
0x14590303d: call 0x145d145fb
0x145903042: add r14, rdi
0x145903045: mov qword ptr [rbp + 0x138], r14
0x14590304c: test r15, r15
0x14590304f: je 0x145903066
0x145903051: imul rdx, r15, 0xb0
0x145903058: mov r8d, 8
0x14590305e: mov rcx, rsi
0x145903061: call 0x1400021d0
0x145903066: mov rcx, qword ptr [rbp + 0x138]
0x14590306d: mov rax, qword ptr [rbp - 0x48]
0x145903071: mov qword ptr [rax + 0x10], rcx
0x145903075: movups xmm0, xmmword ptr [rbp + 0x128]
0x14590307c: movups xmmword ptr [rax], xmm0
0x14590307f: movaps xmm6, xmmword ptr [rbp + 0x180]
0x145903086: add rsp, 0x218
0x14590308d: pop rbx
0x14590308e: pop rdi
0x14590308f: pop rsi
0x145903090: pop r12
0x145903092: pop r13
0x145903094: pop r14
0x145903096: pop r15
0x145903098: pop rbp
0x145903099: ret
0x14590309a: xor ecx, ecx
0x14590309c: mov rdx, qword ptr [rbp + 0x140]
0x1459030a3: call 0x145eb6fcb
0x1459030a8: nop
0x1459030a9: jmp 0x145903156
0x1459030ae: xor ebx, ebx
0x1459030b0: mov rcx, rbx
0x1459030b3: mov rdx, qword ptr [rbp + 0x160]
0x1459030ba: call 0x145eb6fcb
0x1459030bf: nop
0x1459030c0: jmp 0x145903156
0x1459030c5: mov qword ptr [rsp + 0x20], 0xb0
0x1459030ce: lea rcx, [rbp + 0x128]
0x1459030d5: mov r9d, 8
0x1459030db: mov rdx, r14
0x1459030de: mov r8, rdi
0x1459030e1: call 0x145d14a10
0x1459030e6: nop
0x1459030e7: mov r14, qword ptr [rbp + 0x138]
0x1459030ee: jmp 0x145903029
0x1459030f3: mov rdx, r13
0x1459030f6: jmp 0x145902157
0x1459030fb: mov qword ptr [rbp + 0xc0], rsi
0x145903102: mov qword ptr [rbp + 0x158], r10
0x145903109: mov byte ptr [rbp + 0x177], 1
0x145903110: lea r8, [rip + 0x1a2cd39]
0x145903117: mov rcx, rdi
0x14590311a: mov rdx, qword ptr [rbp + 0x140]
0x145903121: call 0x145eb7363
0x145903126: nop
0x145903127: jmp 0x145903156
0x145903129: mov rdx, r13
0x14590312c: mov ecx, 1
0x145903131: mov rax, qword ptr [rbp + 0x158]
0x145903138: jmp 0x1459021bd
0x14590313d: mov qword ptr [rbp + 0x120], r14
0x145903144: mov ecx, 1
0x145903149: mov rdx, qword ptr [rbp + 0x150]
0x145903150: call 0x145eb6fcb
0x145903155: nop
0x145903156: ud2
0x145903158: mov rdx, r15
0x14590315b: jmp 0x145902157
0x145903160: mov r12, r15
0x145903163: mov rdx, rbx
0x145903166: mov ecx, 1
0x14590316b: mov rax, r14
0x14590316e: jmp 0x1459021bd
0x145903173: mov qword ptr [rbp + 0x158], r14
0x14590317a: mov qword ptr [rbp + 0x148], r15
0x145903181: mov qword ptr [rbp + 0x150], rbx
0x145903188: jmp 0x145903144
0x14590318a: mov qword ptr [rbp + 0xb0], r12
0x145903191: jmp 0x145902973
0x145903196: mov qword ptr [rbp + 0x100], r15
0x14590319d: mov ecx, 1
0x1459031a2: jmp 0x145902d31
0x1459031a7: mov r13, rdi
0x1459031aa: mov ecx, 1
0x1459031af: jmp 0x145902d4c
0x1459031b4: mov rax, qword ptr [rbp + 0x168]
0x1459031bb: mov qword ptr [rbp + 0x160], rax
0x1459031c2: jmp 0x1459030b0
0x1459031c7: mov rax, qword ptr [rbp + 0x168]
0x1459031ce: mov qword ptr [rbp + 0x140], rax
0x1459031d5: mov ecx, 1
0x1459031da: jmp 0x14590309c
