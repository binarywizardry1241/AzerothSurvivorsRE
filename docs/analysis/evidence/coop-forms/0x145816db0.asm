0x145816db0: push rbp
0x145816db1: push r15
0x145816db3: push r14
0x145816db5: push r13
0x145816db7: push r12
0x145816db9: push rsi
0x145816dba: push rdi
0x145816dbb: push rbx
0x145816dbc: sub rsp, 0x298
0x145816dc3: lea rbp, [rsp + 0x80]
0x145816dcb: movaps xmmword ptr [rbp + 0x200], xmm8
0x145816dd3: movdqa xmmword ptr [rbp + 0x1f0], xmm7
0x145816ddb: movaps xmmword ptr [rbp + 0x1e0], xmm6
0x145816de2: mov qword ptr [rbp + 0x1d8], 0xfffffffffffffffe
0x145816ded: mov r12, rcx
0x145816df0: cmp dword ptr [rcx + 0x88], -1
0x145816df7: je 0x145816e5e
0x145816df9: mov rcx, qword ptr [r12 + 0x70]
0x145816dfe: mov rax, qword ptr [r12 + 0x78]
0x145816e03: call qword ptr [rax + 0x28]
0x145816e06: test al, al
0x145816e08: jne 0x145816e5e
0x145816e0a: lea rcx, [r12 + 0x80]
0x145816e12: call 0x145cbe440
0x145816e17: test rax, rax
0x145816e1a: js 0x145816e23
0x145816e1c: cvtsi2ss xmm0, rax
0x145816e21: jmp 0x145816e38
0x145816e23: mov rcx, rax
0x145816e26: shr rcx, 1
0x145816e29: and eax, 1
0x145816e2c: or rax, rcx
0x145816e2f: cvtsi2ss xmm0, rax
0x145816e34: addss xmm0, xmm0
0x145816e38: cvtsi2ss xmm1, edx
0x145816e3c: divss xmm1, dword ptr [rip + 0x75663c]
0x145816e44: addss xmm1, xmm0
0x145816e48: ucomiss xmm1, dword ptr [rip + 0x6c9115]
0x145816e4f: jbe 0x145816e5e
0x145816e51: mov rcx, qword ptr [r12 + 0x70]
0x145816e56: mov rax, qword ptr [r12 + 0x78]
0x145816e5b: call qword ptr [rax + 0x30]
0x145816e5e: mov qword ptr [rbp + 0x168], 0
0x145816e69: mov qword ptr [rbp + 0x170], 8
0x145816e74: mov qword ptr [rbp + 0x178], 0
0x145816e7f: lea rsi, [rbp + 0xc0]
0x145816e86: lea rdi, [rbp + 0x168]
0x145816e8d: jmp 0x145816ebc
0x145816e8f: nop
0x145816e90: mov rax, qword ptr [rbp + 0x170]
0x145816e97: lea rcx, [rbx + rbx*2]
0x145816e9b: mov rdx, qword ptr [rbp + 0xd0]
0x145816ea2: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x145816ea7: movups xmm0, xmmword ptr [rbp + 0xc0]
0x145816eae: movups xmmword ptr [rax + rcx*8], xmm0
0x145816eb2: inc rbx
0x145816eb5: mov qword ptr [rbp + 0x178], rbx
0x145816ebc: mov rdx, qword ptr [r12 + 0x90]
0x145816ec4: mov rax, qword ptr [r12 + 0x98]
0x145816ecc: mov rax, qword ptr [rax + 0x20]
0x145816ed0: mov byte ptr [rbp + 0x1d7], 1
0x145816ed7: mov rcx, rsi
0x145816eda: call rax
0x145816edc: nop
0x145816edd: mov rax, qword ptr [rbp + 0xc0]
0x145816ee4: cmp rax, -1
0x145816ee8: je 0x145816f1d
0x145816eea: mov qword ptr [rbp + 0x1a8], rax
0x145816ef1: mov rbx, qword ptr [rbp + 0x178]
0x145816ef8: cmp rbx, qword ptr [rbp + 0x168]
0x145816eff: jne 0x145816e90
0x145816f01: mov rax, qword ptr [rbp + 0xc8]
0x145816f08: mov qword ptr [rbp + 0x188], rax
0x145816f0f: mov rcx, rdi
0x145816f12: call 0x145d14e50
0x145816f17: nop
0x145816f18: jmp 0x145816e90
0x145816f1d: cmp dword ptr [r12 + 0x88], -1
0x145816f26: je 0x145816fc7
0x145816f2c: lea rsi, [rbp + 0xc0]
0x145816f33: lea rdi, [rbp + 0x168]
0x145816f3a: jmp 0x145816f6c
0x145816f3c: nop dword ptr [rax]
0x145816f40: mov rax, qword ptr [rbp + 0x170]
0x145816f47: lea rcx, [rbx + rbx*2]
0x145816f4b: mov rdx, qword ptr [rbp + 0xd0]
0x145816f52: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x145816f57: movups xmm0, xmmword ptr [rbp + 0xc0]
0x145816f5e: movups xmmword ptr [rax + rcx*8], xmm0
0x145816f62: inc rbx
0x145816f65: mov qword ptr [rbp + 0x178], rbx
0x145816f6c: mov rdx, qword ptr [r12 + 0x70]
0x145816f71: mov rax, qword ptr [r12 + 0x78]
0x145816f76: mov rax, qword ptr [rax + 0x20]
0x145816f7a: mov byte ptr [rbp + 0x1d7], 1
0x145816f81: mov rcx, rsi
0x145816f84: call rax
0x145816f86: nop
0x145816f87: mov rax, qword ptr [rbp + 0xc0]
0x145816f8e: cmp rax, -1
0x145816f92: je 0x145816fc7
0x145816f94: mov qword ptr [rbp + 0x1a8], rax
0x145816f9b: mov rbx, qword ptr [rbp + 0x178]
0x145816fa2: cmp rbx, qword ptr [rbp + 0x168]
0x145816fa9: jne 0x145816f40
0x145816fab: mov rax, qword ptr [rbp + 0xc8]
0x145816fb2: mov qword ptr [rbp + 0x188], rax
0x145816fb9: mov rcx, rdi
0x145816fbc: call 0x145d14e50
0x145816fc1: nop
0x145816fc2: jmp 0x145816f40
0x145816fc7: mov rdx, qword ptr [rbp + 0x168]
0x145816fce: mov rcx, qword ptr [rbp + 0x170]
0x145816fd5: mov rax, qword ptr [rbp + 0x178]
0x145816fdc: shl rax, 3
0x145816fe0: lea r13, [rax + rax*2]
0x145816fe4: add r13, rcx
0x145816fe7: mov qword ptr [rbp - 0x60], rcx
0x145816feb: mov qword ptr [rbp - 0x40], rdx
0x145816fef: mov qword ptr [rbp - 0x50], rdx
0x145816ff3: mov qword ptr [rbp - 0x48], r13
0x145816ff7: lea rdx, [r12 + 0xa8]
0x145816fff: mov qword ptr [rbp - 0x20], rdx
0x145817003: lea rdx, [r12 + 0xc8]
0x14581700b: mov qword ptr [rbp + 0x160], rdx
0x145817012: lea rdx, [r12 + 0x40]
0x145817017: mov qword ptr [rbp - 0x28], rdx
0x14581701b: lea rdx, [r12 + 0x20]
0x145817020: mov qword ptr [rbp - 0x30], rdx
0x145817024: lea rdi, [rax + rax*2 - 0x18]
0x145817029: lea r14, [rcx + 0x20]
0x14581702d: lea rbx, [rbp + 0xc0]
0x145817034: xorps xmm6, xmm6
0x145817037: pcmpeqd xmm7, xmm7
0x14581703b: movaps xmm8, xmmword ptr [rip + 0x6c8edd]
0x145817043: mov qword ptr [rbp - 0x38], rcx
0x145817047: mov rax, rcx
0x14581704a: mov qword ptr [rbp + 0xa8], r12
0x145817051: mov qword ptr [rbp + 0xa0], r13
0x145817058: jmp 0x14581706b
0x14581705a: nop word ptr [rax + rax]
0x145817060: add rdi, -0x18
0x145817064: add r14, 0x18
0x145817068: mov rax, r15
0x14581706b: cmp rax, r13
0x14581706e: je 0x145817e02
0x145817074: lea r15, [rax + 0x18]
0x145817078: mov qword ptr [rbp - 0x58], r15
0x14581707c: mov rcx, qword ptr [rax]
0x14581707f: cmp rcx, -1
0x145817083: je 0x145817dbc
0x145817089: mov qword ptr [rbp + 0x1a8], rcx
0x145817090: mov rdx, qword ptr [rax + 8]
0x145817094: mov r8, qword ptr [rax + 0x10]
0x145817098: mov rcx, rbx
0x14581709b: mov qword ptr [rbp + 0x188], rdx
0x1458170a2: call 0x145b7af90
0x1458170a7: nop
0x1458170a8: cmp qword ptr [rbp + 0xc0], -1
0x1458170b0: je 0x145817d10
0x1458170b6: mov rax, qword ptr [rbp + 0x130]
0x1458170bd: mov qword ptr [rbp + 0x80], rax
0x1458170c4: movups xmm0, xmmword ptr [rbp + 0x120]
0x1458170cb: movaps xmmword ptr [rbp + 0x70], xmm0
0x1458170cf: movups xmm0, xmmword ptr [rbp + 0x110]
0x1458170d6: movaps xmmword ptr [rbp + 0x60], xmm0
0x1458170da: movups xmm0, xmmword ptr [rbp + 0x100]
0x1458170e1: movaps xmmword ptr [rbp + 0x50], xmm0
0x1458170e5: movdqu xmm0, xmmword ptr [rbp + 0xc0]
0x1458170ed: movdqu xmm1, xmmword ptr [rbp + 0xd0]
0x1458170f5: movdqu xmm2, xmmword ptr [rbp + 0xe0]
0x1458170fd: movups xmm3, xmmword ptr [rbp + 0xf0]
0x145817104: movaps xmmword ptr [rbp + 0x40], xmm3
0x145817108: movdqa xmmword ptr [rbp + 0x30], xmm2
0x14581710d: movdqa xmmword ptr [rbp + 0x20], xmm1
0x145817112: movdqa xmmword ptr [rbp + 0x10], xmm0
0x145817117: mov rcx, qword ptr [rbp + 0x10]
0x14581711b: mov rsi, rcx
0x14581711e: movabs rax, 0x8000000000000000
0x145817128: xor rsi, rax
0x14581712b: mov qword ptr [rbp + 0x190], rcx
0x145817132: test rcx, rcx
0x145817135: mov eax, 0xa
0x14581713a: cmovns rsi, rax
0x14581713e: lea rdx, [rsi - 2]
0x145817142: cmp rdx, 8
0x145817146: ja 0x1458171b4
0x145817148: lea rcx, [rip + 0x14b3ed5]
0x14581714f: movsxd rax, dword ptr [rcx + rdx*4]
0x145817153: add rax, rcx
0x145817156: jmp rax
0x145817158: mov qword ptr [rbp + 0x198], rdx
0x14581715f: lea rcx, [rbp + 0x28]
0x145817163: mov rax, qword ptr [rcx]
0x145817166: lea rdx, [rbp + 0xc8]
0x14581716d: mov qword ptr [rdx + 0x10], rax
0x145817171: movdqu xmm0, xmmword ptr [rcx - 0x10]
0x145817176: movdqu xmmword ptr [rdx], xmm0
0x14581717a: mov byte ptr [r12 + 0xd8], 1
0x145817183: movabs rax, 0x8000000000000002
0x14581718d: mov qword ptr [rbp + 0xc0], rax
0x145817194: mov rcx, qword ptr [r12]
0x145817198: mov rax, qword ptr [r12 + 0x18]
0x14581719d: cmp rax, rcx
0x1458171a0: jne 0x1458173b4
0x1458171a6: mov rcx, r12
0x1458171a9: call 0x145992190
0x1458171ae: nop
0x1458171af: jmp 0x1458173ab
0x1458171b4: mov qword ptr [rbp + 0x198], rdx
0x1458171bb: mov rax, qword ptr [rbp + 0x80]
0x1458171c2: mov qword ptr [rbp + 0x130], rax
0x1458171c9: movaps xmm0, xmmword ptr [rbp + 0x70]
0x1458171cd: movaps xmmword ptr [rbp + 0x120], xmm0
0x1458171d4: movaps xmm0, xmmword ptr [rbp + 0x60]
0x1458171d8: movaps xmmword ptr [rbp + 0x110], xmm0
0x1458171df: movaps xmm0, xmmword ptr [rbp + 0x50]
0x1458171e3: movaps xmmword ptr [rbp + 0x100], xmm0
0x1458171ea: movdqa xmm0, xmmword ptr [rbp + 0x10]
0x1458171ef: movdqa xmm1, xmmword ptr [rbp + 0x20]
0x1458171f4: movdqa xmm2, xmmword ptr [rbp + 0x30]
0x1458171f9: movaps xmm3, xmmword ptr [rbp + 0x40]
0x1458171fd: movaps xmmword ptr [rbp + 0xf0], xmm3
0x145817204: movdqa xmmword ptr [rbp + 0xe0], xmm2
0x14581720c: movdqa xmmword ptr [rbp + 0xd0], xmm1
0x145817214: movdqa xmmword ptr [rbp + 0xc0], xmm0
0x14581721c: mov rax, qword ptr [r12]
0x145817220: mov rcx, qword ptr [r12 + 0x18]
0x145817225: cmp rcx, rax
0x145817228: jne 0x14581723c
0x14581722a: mov rcx, r12
0x14581722d: call 0x145992190
0x145817232: nop
0x145817233: mov rax, qword ptr [r12]
0x145817237: mov rcx, qword ptr [r12 + 0x18]
0x14581723c: lea rdx, [rcx + 1]
0x145817240: mov qword ptr [r12 + 0x18], rdx
0x145817245: add rcx, qword ptr [r12 + 0x10]
0x14581724a: cmp rcx, rax
0x14581724d: mov edx, 0
0x145817252: cmovb rax, rdx
0x145817256: sub rcx, rax
0x145817259: mov rax, qword ptr [r12 + 8]
0x14581725e: imul rcx, rcx, 0x78
0x145817262: mov rdx, qword ptr [rbp + 0x130]
0x145817269: mov qword ptr [rax + rcx + 0x70], rdx
0x14581726e: movaps xmm0, xmmword ptr [rbp + 0x120]
0x145817275: movups xmmword ptr [rax + rcx + 0x60], xmm0
0x14581727a: movaps xmm0, xmmword ptr [rbp + 0x110]
0x145817281: movups xmmword ptr [rax + rcx + 0x50], xmm0
0x145817286: movaps xmm0, xmmword ptr [rbp + 0x100]
0x14581728d: movups xmmword ptr [rax + rcx + 0x40], xmm0
0x145817292: movaps xmm0, xmmword ptr [rbp + 0xc0]
0x145817299: movaps xmm1, xmmword ptr [rbp + 0xd0]
0x1458172a0: movdqa xmm2, xmmword ptr [rbp + 0xe0]
0x1458172a8: movaps xmm3, xmmword ptr [rbp + 0xf0]
0x1458172af: movups xmmword ptr [rax + rcx + 0x30], xmm3
0x1458172b4: movdqu xmmword ptr [rax + rcx + 0x20], xmm2
0x1458172ba: movups xmmword ptr [rax + rcx + 0x10], xmm1
0x1458172bf: movups xmmword ptr [rax + rcx], xmm0
0x1458172c3: jmp 0x145817d10
0x1458172c8: mov qword ptr [rbp + 0x198], rdx
0x1458172cf: mov rax, qword ptr [rbp + 0x18]
0x1458172d3: mov qword ptr [rbp + 0x1c0], rax
0x1458172da: mov rax, qword ptr [rbp + 0x20]
0x1458172de: mov qword ptr [rbp + 0x1b8], rax
0x1458172e5: mov rsi, qword ptr [rbp + 0x28]
0x1458172e9: mov byte ptr [r12 + 0xd8], 0
0x1458172f2: mov rcx, qword ptr [r12 + 0x70]
0x1458172f7: mov rdx, qword ptr [r12 + 0x78]
0x1458172fc: mov eax, dword ptr [r12 + 0x88]
0x145817304: mov dword ptr [r12 + 0x88], 0xffffffff
0x145817310: cmp eax, -1
0x145817313: je 0x145817360
0x145817315: mov qword ptr [rbp + 0x1a0], rcx
0x14581731c: mov qword ptr [rbp + 0x1b0], rdx
0x145817323: call qword ptr [rdx + 0x30]
0x145817326: nop
0x145817327: mov rax, qword ptr [rbp + 0x1b0]
0x14581732e: mov rax, qword ptr [rax]
0x145817331: test rax, rax
0x145817334: je 0x145817340
0x145817336: mov rcx, qword ptr [rbp + 0x1a0]
0x14581733d: call rax
0x14581733f: nop
0x145817340: mov rax, qword ptr [rbp + 0x1b0]
0x145817347: mov rdx, qword ptr [rax + 8]
0x14581734b: test rdx, rdx
0x14581734e: mov rcx, qword ptr [rbp + 0x1a0]
0x145817355: je 0x145817360
0x145817357: mov r8, qword ptr [rax + 0x10]
0x14581735b: call 0x1400021d0
0x145817360: mov rax, qword ptr [rbp + 0x1c0]
0x145817367: mov qword ptr [rbp + 0xc8], rax
0x14581736e: mov rax, qword ptr [rbp + 0x1b8]
0x145817375: mov qword ptr [rbp + 0xd0], rax
0x14581737c: mov qword ptr [rbp + 0xd8], rsi
0x145817383: movabs rax, 0x8000000000000007
0x14581738d: mov qword ptr [rbp + 0xc0], rax
0x145817394: mov rcx, qword ptr [r12]
0x145817398: mov rax, qword ptr [r12 + 0x18]
0x14581739d: cmp rax, rcx
0x1458173a0: jne 0x1458173b4
0x1458173a2: mov rcx, r12
0x1458173a5: call 0x145992190
0x1458173aa: nop
0x1458173ab: mov rcx, qword ptr [r12]
0x1458173af: mov rax, qword ptr [r12 + 0x18]
0x1458173b4: lea rdx, [rax + 1]
0x1458173b8: mov qword ptr [r12 + 0x18], rdx
0x1458173bd: add rax, qword ptr [r12 + 0x10]
0x1458173c2: cmp rax, rcx
0x1458173c5: mov edx, 0
0x1458173ca: cmovae rdx, rcx
0x1458173ce: sub rax, rdx
0x1458173d1: mov rcx, qword ptr [r12 + 8]
0x1458173d6: imul rax, rax, 0x78
0x1458173da: mov rdx, qword ptr [rbp + 0x130]
0x1458173e1: mov qword ptr [rcx + rax + 0x70], rdx
0x1458173e6: movups xmm0, xmmword ptr [rbp + 0x120]
0x1458173ed: movups xmmword ptr [rcx + rax + 0x60], xmm0
0x1458173f2: movups xmm0, xmmword ptr [rbp + 0x110]
0x1458173f9: movups xmmword ptr [rcx + rax + 0x50], xmm0
0x1458173fe: movups xmm0, xmmword ptr [rbp + 0x100]
0x145817405: movups xmmword ptr [rcx + rax + 0x40], xmm0
0x14581740a: movups xmm0, xmmword ptr [rbp + 0xc0]
0x145817411: movups xmm1, xmmword ptr [rbp + 0xd0]
0x145817418: movdqu xmm2, xmmword ptr [rbp + 0xe0]
0x145817420: movups xmm3, xmmword ptr [rbp + 0xf0]
0x145817427: movups xmmword ptr [rcx + rax + 0x30], xmm3
0x14581742c: movdqu xmmword ptr [rcx + rax + 0x20], xmm2
0x145817432: movups xmmword ptr [rcx + rax + 0x10], xmm1
0x145817437: movups xmmword ptr [rcx + rax], xmm0
0x14581743b: jmp 0x145817d10
0x145817440: mov qword ptr [rbp + 0x198], rdx
0x145817447: mov rax, qword ptr [rbp + 0x18]
0x14581744b: mov qword ptr [rbp + 0x1b0], rax
0x145817452: mov rbx, qword ptr [rbp + 0x20]
0x145817456: mov rcx, qword ptr [r12 + 0x70]
0x14581745b: mov rdx, qword ptr [r12 + 0x78]
0x145817460: mov eax, dword ptr [r12 + 0x88]
0x145817468: mov dword ptr [r12 + 0x88], 0xffffffff
0x145817474: cmp eax, -1
0x145817477: lea rsi, [rbp - 0x18]
0x14581747b: je 0x1458174c8
0x14581747d: mov qword ptr [rbp + 0x1b8], rcx
0x145817484: mov qword ptr [rbp + 0x1c0], rdx
0x14581748b: call qword ptr [rdx + 0x30]
0x14581748e: nop
0x14581748f: mov rax, qword ptr [rbp + 0x1c0]
0x145817496: mov rax, qword ptr [rax]
0x145817499: test rax, rax
0x14581749c: je 0x1458174a8
0x14581749e: mov rcx, qword ptr [rbp + 0x1b8]
0x1458174a5: call rax
0x1458174a7: nop
0x1458174a8: mov rax, qword ptr [rbp + 0x1c0]
0x1458174af: mov rdx, qword ptr [rax + 8]
0x1458174b3: test rdx, rdx
0x1458174b6: mov rcx, qword ptr [rbp + 0x1b8]
0x1458174bd: je 0x1458174c8
0x1458174bf: mov r8, qword ptr [rax + 0x10]
0x1458174c3: call 0x1400021d0
0x1458174c8: mov rax, qword ptr [r12 + 0xa0]
0x1458174d0: mov byte ptr [rbp + 0x1d1], 1
0x1458174d7: mov rcx, qword ptr [rbp + 0x1b0]
0x1458174de: mov rdx, rbx
0x1458174e1: call rax
0x1458174e3: mov qword ptr [rbp + 0x1b8], rax
0x1458174ea: mov qword ptr [rbp + 0x1c0], rdx
0x1458174f1: lea rax, [rbp + 0x28]
0x1458174f5: movups xmm0, xmmword ptr [rax + 0x50]
0x1458174f9: lea rcx, [rbp + 0xc8]
0x145817500: movups xmmword ptr [rcx + 0x50], xmm0
0x145817504: movups xmm0, xmmword ptr [rax + 0x40]
0x145817508: movups xmmword ptr [rcx + 0x40], xmm0
0x14581750c: movdqu xmm0, xmmword ptr [rax]
0x145817510: movdqu xmm1, xmmword ptr [rax + 0x10]
0x145817515: movdqu xmm2, xmmword ptr [rax + 0x20]
0x14581751a: movups xmm3, xmmword ptr [rax + 0x30]
0x14581751e: movups xmmword ptr [rcx + 0x30], xmm3
0x145817522: movdqu xmmword ptr [rcx + 0x20], xmm2
0x145817527: movdqu xmmword ptr [rcx + 0x10], xmm1
0x14581752c: movdqu xmmword ptr [rcx], xmm0
0x145817530: movabs rax, 0x800000000000000a
0x14581753a: mov qword ptr [rbp + 0xc0], rax
0x145817541: mov rcx, rsi
0x145817544: lea rbx, [rbp + 0xc0]
0x14581754b: mov rdx, rbx
0x14581754e: call 0x145b7a740
0x145817553: nop
0x145817554: mov rcx, qword ptr [rbp + 0x1b8]
0x14581755b: mov rdx, rsi
0x14581755e: mov rax, qword ptr [rbp + 0x1c0]
0x145817565: call qword ptr [rax + 0x18]
0x145817568: nop
0x145817569: mov rcx, rbx
0x14581756c: call 0x145811f80
0x145817571: nop
0x145817572: call 0x145cbe2f0
0x145817577: nop
0x145817578: mov esi, edx
0x14581757a: mov qword ptr [rbp + 0x1a0], rax
0x145817581: cmp dword ptr [r12 + 0x88], -1
0x14581758a: je 0x1458175e9
0x14581758c: mov dword ptr [rbp + 0x184], esi
0x145817592: mov rax, qword ptr [r12 + 0x70]
0x145817597: mov qword ptr [rbp + 0xb0], rax
0x14581759e: mov rax, qword ptr [r12 + 0x78]
0x1458175a3: mov qword ptr [rbp + 0xb8], rax
0x1458175aa: mov rax, qword ptr [rax]
0x1458175ad: test rax, rax
0x1458175b0: je 0x1458175bc
0x1458175b2: mov rcx, qword ptr [rbp + 0xb0]
0x1458175b9: call rax
0x1458175bb: nop
0x1458175bc: mov rcx, qword ptr [rbp + 0xb0]
0x1458175c3: mov rax, qword ptr [rbp + 0xb8]
0x1458175ca: mov rdx, qword ptr [rax + 8]
0x1458175ce: test rdx, rdx
0x1458175d1: mov r12, qword ptr [rbp + 0xa8]
0x1458175d8: mov esi, dword ptr [rbp + 0x184]
0x1458175de: je 0x1458175e9
0x1458175e0: mov r8, qword ptr [rax + 0x10]
0x1458175e4: call 0x1400021d0
0x1458175e9: mov rax, qword ptr [rbp + 0x1b8]
0x1458175f0: mov qword ptr [r12 + 0x70], rax
0x1458175f5: mov rax, qword ptr [rbp + 0x1c0]
0x1458175fc: mov qword ptr [r12 + 0x78], rax
0x145817601: mov rax, qword ptr [rbp + 0x1a0]
0x145817608: mov qword ptr [r12 + 0x80], rax
0x145817610: mov dword ptr [r12 + 0x88], esi
0x145817618: cmp qword ptr [rbp + 0x190], 0
0x145817620: je 0x145817d10
0x145817626: mov r8d, 1
0x14581762c: mov rcx, qword ptr [rbp + 0x1b0]
0x145817633: mov rdx, qword ptr [rbp + 0x190]
0x14581763a: call 0x1400021d0
0x14581763f: jmp 0x145817d10
0x145817644: mov qword ptr [rbp + 0x198], rdx
0x14581764b: mov ecx, dword ptr [rbp + 0x18]
0x14581764e: mov qword ptr [rbp - 0x18], 0
0x145817656: mov qword ptr [rbp - 0x10], 8
0x14581765e: lea rax, [rbp - 8]
0x145817662: movups xmmword ptr [rax], xmm6
0x145817665: mov byte ptr [rbp + 8], 1
0x145817669: mov dword ptr [rbp + 0x1c0], ecx
0x14581766f: mov dword ptr [rbp + 0x94], ecx
0x145817675: mov rcx, qword ptr [rbp + 0x160]
0x14581767c: lea rdx, [rbp + 0x94]
0x145817683: call 0x140f02e30
0x145817688: mov rbx, rax
0x14581768b: cmp qword ptr [r12 + 0xb8], 0
0x145817694: je 0x145817d86
0x14581769a: mov rax, qword ptr [r12 + 0xa8]
0x1458176a2: mov rdx, qword ptr [r12 + 0xb0]
0x1458176aa: mov rcx, rbx
0x1458176ad: shr rcx, 0x39
0x1458176b1: movd xmm0, ecx
0x1458176b5: punpcklbw xmm0, xmm0
0x1458176b9: pshuflw xmm0, xmm0, 0
0x1458176be: pshufd xmm0, xmm0, 0x44
0x1458176c3: xor r13d, r13d
0x1458176c6: xor r9d, r9d
0x1458176c9: mov qword ptr [rbp + 0x98], rdi
0x1458176d0: and rbx, rdx
0x1458176d3: movdqu xmm1, xmmword ptr [rax + rbx]
0x1458176d8: movdqa xmm2, xmm1
0x1458176dc: pcmpeqb xmm2, xmm0
0x1458176e0: pmovmskb r11d, xmm2
0x1458176e5: test r11d, r11d
0x1458176e8: je 0x145817730
0x1458176ea: mov r10, r9
0x1458176ed: tzcnt edi, r11d
0x1458176f2: add rdi, rbx
0x1458176f5: and rdi, rdx
0x1458176f8: neg rdi
0x1458176fb: lea rdi, [rdi + rdi*2]
0x1458176ff: shl rdi, 4
0x145817703: mov r9d, dword ptr [rbp + 0x1c0]
0x14581770a: cmp r9d, dword ptr [rax + rdi - 0x30]
0x14581770f: je 0x1458178eb
0x145817715: lea edi, [r11 - 1]
0x145817719: and di, r11w
0x14581771d: mov r11d, edi
0x145817720: mov r9, r10
0x145817723: jne 0x1458176ea
0x145817725: nop word ptr cs:[rax + rax]
0x145817730: cmp r13, 1
0x145817734: je 0x14581774b
0x145817736: pmovmskb r8d, xmm1
0x14581773b: test r8d, r8d
0x14581773e: je 0x145817765
0x145817740: tzcnt r8d, r8d
0x145817745: add r8, rbx
0x145817748: and r8, rdx
0x14581774b: pcmpeqb xmm1, xmm7
0x14581774f: pmovmskb r10d, xmm1
0x145817754: test r10d, r10d
0x145817757: jne 0x145817b09
0x14581775d: mov r13d, 1
0x145817763: jmp 0x145817768
0x145817765: xor r13d, r13d
0x145817768: add rbx, r9
0x14581776b: add rbx, 0x10
0x14581776f: add r9, 0x10
0x145817773: jmp 0x1458176d0
0x145817778: mov ebx, dword ptr [rbp + 0x18]
0x14581777b: mov dword ptr [rbp + 0xc0], ebx
0x145817781: cmp qword ptr [r12 + 0xc0], 0
0x14581778a: je 0x145817af3
0x145817790: mov rcx, qword ptr [rbp + 0x160]
0x145817797: lea rdx, [rbp + 0xc0]
0x14581779e: call 0x140f02e30
0x1458177a3: mov r8, rax
0x1458177a6: shr r8, 0x39
0x1458177aa: mov rcx, qword ptr [r12 + 0xa8]
0x1458177b2: mov rdx, qword ptr [r12 + 0xb0]
0x1458177ba: movd xmm0, r8d
0x1458177bf: punpcklbw xmm0, xmm0
0x1458177c3: pshuflw xmm0, xmm0, 0
0x1458177c8: pshufd xmm0, xmm0, 0x44
0x1458177cd: xor r8d, r8d
0x1458177d0: and rax, rdx
0x1458177d3: movdqu xmm1, xmmword ptr [rcx + rax]
0x1458177d8: movdqa xmm2, xmm1
0x1458177dc: pcmpeqb xmm2, xmm0
0x1458177e0: pmovmskb r9d, xmm2
0x1458177e5: test r9d, r9d
0x1458177e8: je 0x145817820
0x1458177ea: tzcnt r10d, r9d
0x1458177ef: add r10, rax
0x1458177f2: and r10, rdx
0x1458177f5: neg r10
0x1458177f8: lea r10, [r10 + r10*2]
0x1458177fc: shl r10, 4
0x145817800: cmp ebx, dword ptr [rcx + r10 - 0x30]
0x145817805: je 0x145817aec
0x14581780b: lea r10d, [r9 - 1]
0x14581780f: and r10w, r9w
0x145817813: mov r9d, r10d
0x145817816: jne 0x1458177ea
0x145817818: nop dword ptr [rax + rax]
0x145817820: pcmpeqb xmm1, xmm7
0x145817824: pmovmskb r9d, xmm1
0x145817829: test r9d, r9d
0x14581782c: jne 0x145817af3
0x145817832: add rax, r8
0x145817835: add rax, 0x10
0x145817839: add r8, 0x10
0x14581783d: jmp 0x1458177d0
0x14581783f: mov qword ptr [rbp + 0x198], rdx
0x145817846: mov ebx, dword ptr [rbp + 0x30]
0x145817849: test ebx, ebx
0x14581784b: jne 0x1458179d6
0x145817851: cmp byte ptr [r12 + 0xd8], 0
0x14581785a: je 0x1458179d6
0x145817860: mov rax, qword ptr [rbp + 0x18]
0x145817864: mov qword ptr [rbp + 0x1c0], rax
0x14581786b: mov rax, qword ptr [rbp + 0x20]
0x14581786f: mov qword ptr [rbp + 0x1b8], rax
0x145817876: mov rsi, qword ptr [rbp + 0x28]
0x14581787a: mov rcx, qword ptr [r12 + 0x40]
0x14581787f: mov rax, qword ptr [r12 + 0x58]
0x145817884: cmp rax, rcx
0x145817887: lea rbx, [rbp + 0xc0]
0x14581788e: jne 0x1458178a4
0x145817890: mov rcx, qword ptr [rbp - 0x28]
0x145817894: call 0x1416aeb00
0x145817899: nop
0x14581789a: mov rcx, qword ptr [r12 + 0x40]
0x14581789f: mov rax, qword ptr [r12 + 0x58]
0x1458178a4: lea rdx, [rax + 1]
0x1458178a8: mov qword ptr [r12 + 0x58], rdx
0x1458178ad: add rax, qword ptr [r12 + 0x50]
0x1458178b2: cmp rax, rcx
0x1458178b5: mov edx, 0
0x1458178ba: cmovae rdx, rcx
0x1458178be: sub rax, rdx
0x1458178c1: mov rcx, qword ptr [r12 + 0x48]
0x1458178c6: lea rax, [rax + rax*2]
0x1458178ca: mov rdx, qword ptr [rbp + 0x1c0]
0x1458178d1: mov qword ptr [rcx + rax*8], rdx
0x1458178d5: mov rdx, qword ptr [rbp + 0x1b8]
0x1458178dc: mov qword ptr [rcx + rax*8 + 8], rdx
0x1458178e1: mov qword ptr [rcx + rax*8 + 0x10], rsi
0x1458178e6: jmp 0x145817d10
0x1458178eb: add rax, rdi
0x1458178ee: mov rbx, qword ptr [rax - 0x28]
0x1458178f2: mov rcx, qword ptr [rax - 0x20]
0x1458178f6: mov qword ptr [rbp + 0x1b8], rcx
0x1458178fd: mov rcx, qword ptr [rax - 0x18]
0x145817901: mov r9, qword ptr [rax - 0x10]
0x145817905: mov rdx, qword ptr [rbp + 8]
0x145817909: mov qword ptr [rax - 8], rdx
0x14581790d: movdqu xmm0, xmmword ptr [rbp - 0x18]
0x145817912: movdqu xmm1, xmmword ptr [rbp - 8]
0x145817917: movdqu xmmword ptr [rax - 0x28], xmm0
0x14581791c: movdqu xmmword ptr [rax - 0x18], xmm1
0x145817921: cmp rbx, -1
0x145817925: mov r13, qword ptr [rbp + 0xa0]
0x14581792c: je 0x145817bb7
0x145817932: test r9, r9
0x145817935: je 0x145817abd
0x14581793b: cmp rcx, rbx
0x14581793e: mov rax, rbx
0x145817941: mov r8d, 0
0x145817947: cmovb rax, r8
0x14581794b: mov rdx, rcx
0x14581794e: sub rdx, rax
0x145817951: mov r10, rbx
0x145817954: sub r10, rdx
0x145817957: lea r12, [rdx + r9]
0x14581795b: mov qword ptr [rbp + 0x1b0], r9
0x145817962: mov r13, r9
0x145817965: mov qword ptr [rbp + 0x1a0], r10
0x14581796c: sub r13, r10
0x14581796f: cmovb r13, r8
0x145817973: cmova r12, rbx
0x145817977: sub r12, rdx
0x14581797a: jne 0x145817d37
0x145817980: mov rax, qword ptr [rbp + 0x1a0]
0x145817987: cmp rax, qword ptr [rbp + 0x1b0]
0x14581798e: mov r12, qword ptr [rbp + 0xa8]
0x145817995: jae 0x145817abd
0x14581799b: mov rax, qword ptr [rbp + 0x1b8]
0x1458179a2: lea rdi, [rax + 8]
0x1458179a6: jmp 0x1458179bd
0x1458179a8: nop dword ptr [rax + rax]
0x1458179b0: add rdi, 0x18
0x1458179b4: dec r13
0x1458179b7: je 0x145817abd
0x1458179bd: mov rdx, qword ptr [rdi - 8]
0x1458179c1: test rdx, rdx
0x1458179c4: je 0x1458179b0
0x1458179c6: mov rcx, qword ptr [rdi]
0x1458179c9: mov r8d, 1
0x1458179cf: call 0x1400021d0
0x1458179d4: jmp 0x1458179b0
0x1458179d6: mov qword ptr [rbp + 0x98], rdi
0x1458179dd: mov rdi, r13
0x1458179e0: mov dword ptr [rbp + 0xc0], ebx
0x1458179e6: mov rax, qword ptr [rbp + 0x18]
0x1458179ea: mov qword ptr [rbp + 0x1c0], rax
0x1458179f1: mov rax, qword ptr [rbp + 0x20]
0x1458179f5: mov qword ptr [rbp + 0x1b8], rax
0x1458179fc: cmp qword ptr [r12 + 0xc0], 0
0x145817a05: je 0x145817c45
0x145817a0b: mov rax, qword ptr [rbp + 0x28]
0x145817a0f: mov qword ptr [rbp + 0x1b0], rax
0x145817a16: mov rcx, qword ptr [rbp + 0x160]
0x145817a1d: lea rdx, [rbp + 0xc0]
0x145817a24: call 0x140f02e30
0x145817a29: mov rdx, rax
0x145817a2c: shr rdx, 0x39
0x145817a30: mov r13, qword ptr [r12 + 0xa8]
0x145817a38: mov rcx, qword ptr [r12 + 0xb0]
0x145817a40: movd xmm0, edx
0x145817a44: punpcklbw xmm0, xmm0
0x145817a48: pshuflw xmm0, xmm0, 0
0x145817a4d: pshufd xmm0, xmm0, 0x44
0x145817a52: xor edx, edx
0x145817a54: and rax, rcx
0x145817a57: movdqu xmm1, xmmword ptr [r13 + rax]
0x145817a5e: movdqa xmm2, xmm1
0x145817a62: pcmpeqb xmm2, xmm0
0x145817a66: pmovmskb r8d, xmm2
0x145817a6b: test r8d, r8d
0x145817a6e: je 0x145817a9e
0x145817a70: tzcnt r9d, r8d
0x145817a75: add r9, rax
0x145817a78: and r9, rcx
0x145817a7b: neg r9
0x145817a7e: lea r9, [r9 + r9*2]
0x145817a82: shl r9, 4
0x145817a86: cmp ebx, dword ptr [r13 + r9 - 0x30]
0x145817a8b: je 0x145817c70
0x145817a91: lea r9d, [r8 - 1]
0x145817a95: and r9w, r8w
0x145817a99: mov r8d, r9d
0x145817a9c: jne 0x145817a70
0x145817a9e: pcmpeqb xmm1, xmm7
0x145817aa2: pmovmskb r8d, xmm1
0x145817aa7: test r8d, r8d
0x145817aaa: jne 0x145817c45
0x145817ab0: add rax, rdx
0x145817ab3: add rax, 0x10
0x145817ab7: add rdx, 0x10
0x145817abb: jmp 0x145817a54
0x145817abd: test rbx, rbx
0x145817ac0: mov r13, qword ptr [rbp + 0xa0]
0x145817ac7: je 0x145817bb7
0x145817acd: shl rbx, 3
0x145817ad1: lea rdx, [rbx + rbx*2]
0x145817ad5: mov r8d, 8
0x145817adb: mov rcx, qword ptr [rbp + 0x1b8]
0x145817ae2: call 0x1400021d0
0x145817ae7: jmp 0x145817bb7
0x145817aec: add rcx, r10
0x145817aef: mov byte ptr [rcx - 8], 0
0x145817af3: lea rbx, [rbp + 0xc0]
0x145817afa: cmp rsi, 0xa
0x145817afe: jbe 0x145817cef
0x145817b04: jmp 0x145817cfa
0x145817b09: movzx r9d, byte ptr [rax + r8]
0x145817b0e: test r9b, r9b
0x145817b11: mov r13, qword ptr [rbp + 0xa0]
0x145817b18: jns 0x145817da4
0x145817b1e: mov r10, qword ptr [rbp + 8]
0x145817b22: lea r11, [rbp + 0xc8]
0x145817b29: mov qword ptr [r11 + 0x1c], r10
0x145817b2d: movups xmm0, xmmword ptr [rbp - 0x18]
0x145817b31: movups xmm1, xmmword ptr [rbp - 8]
0x145817b35: movups xmmword ptr [r11 + 0xc], xmm1
0x145817b3a: movups xmmword ptr [r11 - 4], xmm0
0x145817b3f: and r9b, 1
0x145817b43: lea r10, [r8 - 0x10]
0x145817b47: and r10, rdx
0x145817b4a: mov byte ptr [rax + r8], cl
0x145817b4e: mov byte ptr [rax + r10 + 0x10], cl
0x145817b53: movdqu xmm0, xmmword ptr [r12 + 0xb8]
0x145817b5d: movzx ecx, r9b
0x145817b61: movd xmm1, ecx
0x145817b65: shufps xmm1, xmm8, 0xe4
0x145817b6a: psubq xmm0, xmm1
0x145817b6e: movdqu xmmword ptr [r12 + 0xb8], xmm0
0x145817b78: neg r8
0x145817b7b: lea rcx, [r8 + r8*2]
0x145817b7f: shl rcx, 4
0x145817b83: mov edx, dword ptr [rbp + 0x1c0]
0x145817b89: mov dword ptr [rax + rcx - 0x30], edx
0x145817b8d: movdqu xmm0, xmmword ptr [rbp + 0xc0]
0x145817b95: movdqu xmm1, xmmword ptr [rbp + 0xd0]
0x145817b9d: movdqu xmm2, xmmword ptr [rbp + 0xdc]
0x145817ba5: movdqu xmmword ptr [rax + rcx - 0x2c], xmm0
0x145817bab: movdqu xmmword ptr [rax + rcx - 0x1c], xmm1
0x145817bb1: movdqu xmmword ptr [rax + rcx - 0x10], xmm2
0x145817bb7: mov rcx, qword ptr [r12 + 0x20]
0x145817bbc: mov rax, qword ptr [r12 + 0x38]
0x145817bc1: cmp rax, rcx
0x145817bc4: mov rdi, qword ptr [rbp + 0x98]
0x145817bcb: lea rbx, [rbp + 0xc0]
0x145817bd2: jne 0x145817c0b
0x145817bd4: mov byte ptr [rbp + 0x1d6], 1
0x145817bdb: mov byte ptr [rbp + 0x1d5], 1
0x145817be2: mov byte ptr [rbp + 0x1d4], 1
0x145817be9: mov byte ptr [rbp + 0x1d3], 1
0x145817bf0: mov byte ptr [rbp + 0x1d2], 1
0x145817bf7: mov rcx, qword ptr [rbp - 0x30]
0x145817bfb: call 0x142194da0
0x145817c00: nop
0x145817c01: mov rcx, qword ptr [r12 + 0x20]
0x145817c06: mov rax, qword ptr [r12 + 0x38]
0x145817c0b: lea rdx, [rax + 1]
0x145817c0f: mov qword ptr [r12 + 0x38], rdx
0x145817c14: add rax, qword ptr [r12 + 0x30]
0x145817c19: cmp rax, rcx
0x145817c1c: mov edx, 0
0x145817c21: cmovae rdx, rcx
0x145817c25: sub rax, rdx
0x145817c28: mov rcx, qword ptr [r12 + 0x28]
0x145817c2d: mov edx, dword ptr [rbp + 0x1c0]
0x145817c33: mov dword ptr [rcx + rax*4], edx
0x145817c36: cmp rsi, 0xa
0x145817c3a: jbe 0x145817cef
0x145817c40: jmp 0x145817cfa
0x145817c45: mov rdx, qword ptr [rbp + 0x1c0]
0x145817c4c: test rdx, rdx
0x145817c4f: lea rbx, [rbp + 0xc0]
0x145817c56: je 0x145817cdf
0x145817c5c: mov r8d, 1
0x145817c62: mov rcx, qword ptr [rbp + 0x1b8]
0x145817c69: call 0x1400021d0
0x145817c6e: jmp 0x145817cdf
0x145817c70: add r13, r9
0x145817c73: mov rcx, qword ptr [r13 - 0x28]
0x145817c77: mov rax, qword ptr [r13 - 0x10]
0x145817c7b: cmp rax, rcx
0x145817c7e: lea rbx, [rbp + 0xc0]
0x145817c85: jne 0x145817c99
0x145817c87: lea rcx, [r13 - 0x28]
0x145817c8b: call 0x1416aeb00
0x145817c90: nop
0x145817c91: mov rcx, qword ptr [r13 - 0x28]
0x145817c95: mov rax, qword ptr [r13 - 0x10]
0x145817c99: lea rdx, [rax + 1]
0x145817c9d: mov qword ptr [r13 - 0x10], rdx
0x145817ca1: add rax, qword ptr [r13 - 0x18]
0x145817ca5: cmp rax, rcx
0x145817ca8: mov edx, 0
0x145817cad: cmovae rdx, rcx
0x145817cb1: sub rax, rdx
0x145817cb4: mov rcx, qword ptr [r13 - 0x20]
0x145817cb8: lea rax, [rax + rax*2]
0x145817cbc: mov rdx, qword ptr [rbp + 0x1c0]
0x145817cc3: mov qword ptr [rcx + rax*8], rdx
0x145817cc7: mov rdx, qword ptr [rbp + 0x1b8]
0x145817cce: mov qword ptr [rcx + rax*8 + 8], rdx
0x145817cd3: mov rdx, qword ptr [rbp + 0x1b0]
0x145817cda: mov qword ptr [rcx + rax*8 + 0x10], rdx
0x145817cdf: mov r13, rdi
0x145817ce2: mov rdi, qword ptr [rbp + 0x98]
0x145817ce9: cmp rsi, 0xa
0x145817ced: ja 0x145817cfa
0x145817cef: mov eax, 0x4c4
0x145817cf4: bt rax, rsi
0x145817cf8: jb 0x145817d10
0x145817cfa: lea rcx, [rbp + 0x10]
0x145817cfe: call 0x145811d50
0x145817d03: nop
0x145817d04: nop word ptr cs:[rax + rax]
0x145817d10: mov rdx, qword ptr [rbp + 0x1a8]
0x145817d17: test rdx, rdx
0x145817d1a: je 0x145817060
0x145817d20: mov r8d, 1
0x145817d26: mov rcx, qword ptr [rbp + 0x188]
0x145817d2d: call 0x1400021d0
0x145817d32: jmp 0x145817060
0x145817d37: shl rcx, 3
0x145817d3b: lea rcx, [rcx + rcx*2]
0x145817d3f: shl rax, 3
0x145817d43: lea rax, [rax + rax*2]
0x145817d47: sub rcx, rax
0x145817d4a: mov rax, qword ptr [rbp + 0x1b8]
0x145817d51: lea rdi, [rax + rcx]
0x145817d55: add rdi, 8
0x145817d59: jmp 0x145817d6d
0x145817d5b: nop dword ptr [rax + rax]
0x145817d60: add rdi, 0x18
0x145817d64: dec r12
0x145817d67: je 0x145817980
0x145817d6d: mov rdx, qword ptr [rdi - 8]
0x145817d71: test rdx, rdx
0x145817d74: je 0x145817d60
0x145817d76: mov rcx, qword ptr [rdi]
0x145817d79: mov r8d, 1
0x145817d7f: call 0x1400021d0
0x145817d84: jmp 0x145817d60
0x145817d86: mov edx, 1
0x145817d8b: mov rcx, qword ptr [rbp - 0x20]
0x145817d8f: mov r8, qword ptr [rbp + 0x160]
0x145817d96: mov r9b, 1
0x145817d99: call 0x145e96ce0
0x145817d9e: nop
0x145817d9f: jmp 0x14581769a
0x145817da4: movdqa xmm0, xmmword ptr [rax]
0x145817da8: pmovmskb r8d, xmm0
0x145817dad: tzcnt r8d, r8d
0x145817db2: movzx r9d, byte ptr [rax + r8]
0x145817db7: jmp 0x145817b1e
0x145817dbc: cmp r13, r15
0x145817dbf: je 0x145817e02
0x145817dc1: movabs rcx, 0xaaaaaaaaaaaaaaab
0x145817dcb: mov rax, rdi
0x145817dce: mul rcx
0x145817dd1: mov rdi, rdx
0x145817dd4: shr rdi, 4
0x145817dd8: jmp 0x145817de9
0x145817dda: nop word ptr [rax + rax]
0x145817de0: add r14, 0x18
0x145817de4: dec rdi
0x145817de7: je 0x145817e02
0x145817de9: mov rdx, qword ptr [r14 - 8]
0x145817ded: test rdx, rdx
0x145817df0: je 0x145817de0
0x145817df2: mov rcx, qword ptr [r14]
0x145817df5: mov r8d, 1
0x145817dfb: call 0x1400021d0
0x145817e00: jmp 0x145817de0
0x145817e02: mov rax, qword ptr [rbp - 0x40]
0x145817e06: test rax, rax
0x145817e09: je 0x145817e22
0x145817e0b: shl rax, 3
0x145817e0f: lea rdx, [rax + rax*2]
0x145817e13: mov r8d, 8
0x145817e19: mov rcx, qword ptr [rbp - 0x38]
0x145817e1d: call 0x1400021d0
0x145817e22: mov rcx, qword ptr [r12 + 0x90]
0x145817e2a: mov rax, qword ptr [r12 + 0x98]
0x145817e32: mov rax, qword ptr [rax + 0x28]
0x145817e36: mov byte ptr [rbp + 0x1d7], 0
0x145817e3d: call rax
0x145817e3f: nop
0x145817e40: cmp al, 1
0x145817e42: jne 0x145817f43
0x145817e48: lea rcx, [r12 + 0x60]
0x145817e4d: mov byte ptr [rbp + 0x1d7], 0
0x145817e54: call 0x145cbe440
0x145817e59: nop
0x145817e5a: test rax, rax
0x145817e5d: js 0x145817e69
0x145817e5f: xorps xmm0, xmm0
0x145817e62: cvtsi2ss xmm0, rax
0x145817e67: jmp 0x145817e81
0x145817e69: mov rcx, rax
0x145817e6c: shr rcx, 1
0x145817e6f: and eax, 1
0x145817e72: or rax, rcx
0x145817e75: xorps xmm0, xmm0
0x145817e78: cvtsi2ss xmm0, rax
0x145817e7d: addss xmm0, xmm0
0x145817e81: xorps xmm1, xmm1
0x145817e84: cvtsi2ss xmm1, edx
0x145817e88: divss xmm1, dword ptr [rip + 0x7555f0]
0x145817e90: addss xmm1, xmm0
0x145817e94: ucomiss xmm1, dword ptr [rip + 0x6dc289]
0x145817e9b: jb 0x145817f43
0x145817ea1: mov byte ptr [rbp + 0x1d7], 0
0x145817ea8: call 0x145cbe2f0
0x145817ead: nop
0x145817eae: mov qword ptr [r12 + 0x60], rax
0x145817eb3: mov dword ptr [r12 + 0x68], edx
0x145817eb8: mov rsi, qword ptr [r12 + 0x90]
0x145817ec0: mov rdi, qword ptr [r12 + 0x98]
0x145817ec8: mov byte ptr [rbp + 0x1d7], 0
0x145817ecf: lea rdx, [rip + 0x14b2b22]
0x145817ed6: lea rcx, [rbp + 0xc0]
0x145817edd: call 0x145b7a740
0x145817ee2: nop
0x145817ee3: mov rax, qword ptr [rdi + 0x18]
0x145817ee7: mov byte ptr [rbp + 0x1d7], 0
0x145817eee: lea rdx, [rbp + 0xc0]
0x145817ef5: mov rcx, rsi
0x145817ef8: call rax
0x145817efa: nop
0x145817efb: cmp dword ptr [r12 + 0x88], -1
0x145817f04: je 0x145817f43
0x145817f06: mov rsi, qword ptr [r12 + 0x70]
0x145817f0b: mov rdi, qword ptr [r12 + 0x78]
0x145817f10: mov byte ptr [rbp + 0x1d7], 0
0x145817f17: lea rdx, [rip + 0x14b2ada]
0x145817f1e: lea rcx, [rbp + 0xc0]
0x145817f25: call 0x145b7a740
0x145817f2a: nop
0x145817f2b: mov rax, qword ptr [rdi + 0x18]
0x145817f2f: mov byte ptr [rbp + 0x1d7], 0
0x145817f36: lea rdx, [rbp + 0xc0]
0x145817f3d: mov rcx, rsi
0x145817f40: call rax
0x145817f42: nop
0x145817f43: movaps xmm6, xmmword ptr [rbp + 0x1e0]
0x145817f4a: movaps xmm7, xmmword ptr [rbp + 0x1f0]
0x145817f51: movaps xmm8, xmmword ptr [rbp + 0x200]
0x145817f59: add rsp, 0x298
0x145817f60: pop rbx
0x145817f61: pop rdi
0x145817f62: pop rsi
0x145817f63: pop r12
0x145817f65: pop r13
0x145817f67: pop r14
0x145817f69: pop r15
0x145817f6b: pop rbp
0x145817f6c: ret
