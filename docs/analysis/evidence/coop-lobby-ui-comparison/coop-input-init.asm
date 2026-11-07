0x1401691b0: push rbp
0x1401691b1: push r15
0x1401691b3: push r14
0x1401691b5: push r13
0x1401691b7: push r12
0x1401691b9: push rsi
0x1401691ba: push rdi
0x1401691bb: push rbx
0x1401691bc: sub rsp, 0x2a8
0x1401691c3: lea rbp, [rsp + 0x80]
0x1401691cb: mov qword ptr [rbp + 0x220], 0xfffffffffffffffe
0x1401691d6: mov rdi, r8
0x1401691d9: mov rsi, rcx
0x1401691dc: cmp qword ptr [rdx + 0x100], -1
0x1401691e4: je 0x140169228
0x1401691e6: mov rax, qword ptr [rdi + 0x5a0]
0x1401691ed: mov qword ptr [rbp - 0x48], rax
0x1401691f1: cmp qword ptr [rdx + 8], rax
0x1401691f5: je 0x140169419
0x1401691fb: add rdx, 8
0x1401691ff: lea rax, [rip + 0x605dbb2]
0x140169206: mov qword ptr [rsp + 0x28], rax
0x14016920b: mov qword ptr [rsp + 0x20], 0x83
0x140169214: lea r9, [rip + 0x605db55]
0x14016921b: lea r8, [rbp - 0x48]
0x14016921f: xor ecx, ecx
0x140169221: call 0x1461574ad
0x140169226: ud2 
0x140169228: mov qword ptr [rbp + 0x208], rdx
0x14016922f: lea rcx, [rbp - 0x48]
0x140169233: mov rdx, rdi
0x140169236: call 0x140469b90
0x14016923b: lea rbx, [rdi + 0x40]
0x14016923f: lea r15, [rdi + 0x5a8]
0x140169246: mov qword ptr [rbp + 0xf8], rbx
0x14016924d: mov qword ptr [rbp + 0x100], r15
0x140169254: mov qword ptr [rbp + 0xe0], 0
0x14016925f: mov qword ptr [rbp + 0xe8], 8
0x14016926a: mov qword ptr [rbp + 0xf0], 0
0x140169275: lea rdx, [rip + 0x60ab88c]
0x14016927c: lea rcx, [rbp + 0xe0]
0x140169283: call 0x14030f080
0x140169288: nop 
0x140169289: mov r14, rax
0x14016928c: mov rdx, qword ptr [rbp + 0xe0]
0x140169293: test rdx, rdx
0x140169296: je 0x1401692ae
0x140169298: mov rcx, qword ptr [rbp + 0xe8]
0x14016929f: shl rdx, 3
0x1401692a3: mov r8d, 8
0x1401692a9: call 0x1400021d0
0x1401692ae: mov qword ptr [rbp + 0xf8], rbx
0x1401692b5: mov qword ptr [rbp + 0x100], r15
0x1401692bc: mov qword ptr [rbp + 0xe0], 0
0x1401692c7: mov qword ptr [rbp + 0xe8], 8
0x1401692d2: mov qword ptr [rbp + 0xf0], 0
0x1401692dd: lea rdx, [rip + 0x60ab934]
0x1401692e4: lea rcx, [rbp + 0xe0]
0x1401692eb: call 0x140312300
0x1401692f0: nop 
0x1401692f1: mov r12, rax
0x1401692f4: mov rdx, qword ptr [rbp + 0xe0]
0x1401692fb: test rdx, rdx
0x1401692fe: je 0x140169316
0x140169300: mov rcx, qword ptr [rbp + 0xe8]
0x140169307: shl rdx, 3
0x14016930b: mov r8d, 8
0x140169311: call 0x1400021d0
0x140169316: mov qword ptr [rbp + 0xf8], rbx
0x14016931d: mov qword ptr [rbp + 0x100], r15
0x140169324: mov qword ptr [rbp + 0xe0], 0
0x14016932f: mov qword ptr [rbp + 0xe8], 8
0x14016933a: mov qword ptr [rbp + 0xf0], 0
0x140169345: lea rdx, [rip + 0x60ab84c]
0x14016934c: lea rcx, [rbp + 0xe0]
0x140169353: call 0x140311100
0x140169358: nop 
0x140169359: mov rbx, rax
0x14016935c: mov qword ptr [rbp + 0x210], r12
0x140169363: mov rdx, qword ptr [rbp + 0xe0]
0x14016936a: test rdx, rdx
0x14016936d: je 0x140169386
0x14016936f: mov rcx, qword ptr [rbp + 0xe8]
0x140169376: shl rdx, 3
0x14016937a: mov r8d, 8
0x140169380: call 0x1400021d0
0x140169385: nop 
0x140169386: mov qword ptr [rbp + 0x218], rbx
0x14016938d: mov r15, r14
0x140169390: mov rcx, rdi
0x140169393: call 0x14032e2a0
0x140169398: nop 
0x140169399: mov r12, rax
0x14016939c: mov rcx, rdi
0x14016939f: call 0x14032f060
0x1401693a4: nop 
0x1401693a5: mov r13, rax
0x1401693a8: lea rbx, [rbp + 0xe0]
0x1401693af: lea rdx, [rbp - 0x48]
0x1401693b3: mov r8d, 0x128
0x1401693b9: mov rcx, rbx
0x1401693bc: call 0x14600504b
0x1401693c1: mov rax, qword ptr [rdi + 0x5a0]
0x1401693c8: mov r14, qword ptr [rbp + 0x208]
0x1401693cf: mov qword ptr [r14 + 8], rax
0x1401693d3: lea rcx, [r14 + 0x10]
0x1401693d7: mov r8d, 0x128
0x1401693dd: mov rdx, rbx
0x1401693e0: call 0x14600504b
0x1401693e5: mov rdx, r14
0x1401693e8: mov qword ptr [r14 + 0x138], r15
0x1401693ef: mov rax, qword ptr [rbp + 0x210]
0x1401693f6: mov qword ptr [r14 + 0x140], rax
0x1401693fd: mov rax, qword ptr [rbp + 0x218]
0x140169404: mov qword ptr [r14 + 0x148], rax
0x14016940b: mov qword ptr [r14 + 0x150], r12
0x140169412: mov qword ptr [r14 + 0x158], r13
0x140169419: mov eax, 0x3dcc5000
0x14016941e: add eax, dword ptr [rdi + 0x5b0]
0x140169424: mov dword ptr [rdx], eax
0x140169426: mov qword ptr [rbp - 0x30], 0x10
0x14016942e: xorps xmm0, xmm0
0x140169431: movups xmmword ptr [rbp - 0x28], xmm0
0x140169435: mov qword ptr [rbp - 0x18], 0x10
0x14016943d: movups xmmword ptr [rbp - 0x10], xmm0
0x140169441: mov qword ptr [rbp], 0x10
0x140169449: movups xmmword ptr [rbp + 8], xmm0
0x14016944d: mov qword ptr [rbp + 0x18], 0x10
0x140169455: movups xmmword ptr [rbp + 0x20], xmm0
0x140169459: mov qword ptr [rbp + 0x30], 0x10
0x140169461: mov qword ptr [rbp - 0x48], 0
0x140169469: movups xmmword ptr [rbp + 0x38], xmm0
0x14016946d: mov dword ptr [rbp + 0x48], 0
0x140169474: mov qword ptr [rbp - 0x40], 8
0x14016947c: mov qword ptr [rbp - 0x38], 0
0x140169484: lea rcx, [rdx + 0x10]
0x140169488: lea r8, [rbp - 0x48]
0x14016948c: mov r9, rdi
0x14016948f: call 0x1401790b0
0x140169494: nop 
0x140169495: lea rdx, [rbp - 0x48]
0x140169499: mov r8d, 0x98
0x14016949f: mov rcx, rsi
0x1401694a2: call 0x14600504b
0x1401694a7: mov rax, rsi
0x1401694aa: add rsp, 0x2a8
0x1401694b1: pop rbx
0x1401694b2: pop rdi
0x1401694b3: pop rsi
0x1401694b4: pop r12
0x1401694b6: pop r13
0x1401694b8: pop r14
0x1401694ba: pop r15
0x1401694bc: pop rbp
0x1401694bd: ret 
