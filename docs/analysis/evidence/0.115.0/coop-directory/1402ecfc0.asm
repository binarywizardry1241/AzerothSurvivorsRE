0x1402ecfc0: push r15
0x1402ecfc2: push r14
0x1402ecfc4: push r12
0x1402ecfc6: push rsi
0x1402ecfc7: push rdi
0x1402ecfc8: push rbp
0x1402ecfc9: push rbx
0x1402ecfca: sub rsp, 0x390
0x1402ecfd1: movaps xmmword ptr [rsp + 0x380], xmm8
0x1402ecfda: movaps xmmword ptr [rsp + 0x370], xmm7
0x1402ecfe2: movaps xmmword ptr [rsp + 0x360], xmm6
0x1402ecfea: mov rdi, rdx
0x1402ecfed: mov rsi, rcx
0x1402ecff0: mov r14, qword ptr [rcx]
0x1402ecff3: mov rax, qword ptr [rcx + 0x28]
0x1402ecff7: mov qword ptr [rsp + 0x330], r14
0x1402ecfff: movups xmm0, xmmword ptr [rcx + 8]
0x1402ed003: movups xmmword ptr [rsp + 0x338], xmm0
0x1402ed00b: movups xmm0, xmmword ptr [rcx + 0x18]
0x1402ed00f: movups xmmword ptr [rsp + 0x348], xmm0
0x1402ed017: mov qword ptr [rsp + 0x358], rax
0x1402ed01f: mov r12, qword ptr [rdx + 0x18]
0x1402ed023: mov rax, qword ptr [rdx + 0x20]
0x1402ed027: movss xmm0, dword ptr [rax]
0x1402ed02b: cmp byte ptr [r12], 1
0x1402ed030: jne 0x1402ed053
0x1402ed032: mov eax, dword ptr [r12 + 1]
0x1402ed037: mov ecx, dword ptr [r12 + 4]
0x1402ed03c: mov dword ptr [rsp + 0x2b], ecx
0x1402ed040: mov dword ptr [rsp + 0x28], eax
0x1402ed044: mov rax, qword ptr [r12 + 8]
0x1402ed049: movzx ecx, byte ptr [r12 + 0x10]
0x1402ed04f: mov dl, 1
0x1402ed051: jmp 0x1402ed064
0x1402ed053: mov rax, qword ptr [r12 + 8]
0x1402ed058: lock inc qword ptr [rax]
0x1402ed05c: jle 0x1402ed65e
0x1402ed062: xor edx, edx
0x1402ed064: lea rbx, [rsp + 0x338]
0x1402ed06c: movups xmm8, xmmword ptr [rip + 0x5c3a9dc]
0x1402ed074: movups xmmword ptr [rsp + 0x31], xmm8
0x1402ed07a: mov dword ptr [rsp + 0x41], 0x3f800000
0x1402ed082: mov r8, qword ptr [rdi + 0x10]
0x1402ed086: mov qword ptr [rsp + 0xf0], r8
0x1402ed08e: movups xmm1, xmmword ptr [rdi]
0x1402ed091: movups xmmword ptr [rsp + 0xe0], xmm1
0x1402ed099: mov qword ptr [rsp + 0xf8], 0
0x1402ed0a5: mov qword ptr [rsp + 0x100], 4
0x1402ed0b1: mov qword ptr [rsp + 0x108], 0
0x1402ed0bd: mov byte ptr [rsp + 0x110], dl
0x1402ed0c4: mov edx, dword ptr [rsp + 0x28]
0x1402ed0c8: mov r8d, dword ptr [rsp + 0x2b]
0x1402ed0cd: mov dword ptr [rsp + 0x111], edx
0x1402ed0d4: mov dword ptr [rsp + 0x114], r8d
0x1402ed0dc: mov qword ptr [rsp + 0x118], rax
0x1402ed0e4: mov qword ptr [rsp + 0x120], rcx
0x1402ed0ec: movss dword ptr [rsp + 0x128], xmm0
0x1402ed0f5: mov word ptr [rsp + 0x12c], 0x190
0x1402ed0ff: mov byte ptr [rsp + 0x12e], 1
0x1402ed107: movups xmm0, xmmword ptr [rsp + 0x30]
0x1402ed10c: movups xmmword ptr [rsp + 0x12f], xmm0
0x1402ed114: mov rax, qword ptr [rsp + 0x3d]
0x1402ed119: mov qword ptr [rsp + 0x13c], rax
0x1402ed121: mov ebp, dword ptr [rip + 0x5c281b9]
0x1402ed127: mov dword ptr [rsp + 0x154], ebp
0x1402ed12e: movups xmm6, xmmword ptr [rip + 0x5c2819b]
0x1402ed135: movups xmmword ptr [rsp + 0x144], xmm6
0x1402ed13d: movsd xmm7, qword ptr [rip + 0x5bf2e2b]
0x1402ed145: movsd qword ptr [rsp + 0x158], xmm7
0x1402ed14e: mov qword ptr [rsp + 0xd8], r14
0x1402ed156: lea rcx, [rsp + 0x80]
0x1402ed15e: lea r8, [rsp + 0xd8]
0x1402ed166: mov rdx, rbx
0x1402ed169: call 0x1402bfa00
0x1402ed16e: movups xmm0, xmmword ptr [rip + 0x5c3730b]
0x1402ed175: movaps xmmword ptr [rsp + 0x2d0], xmm0
0x1402ed17d: mov qword ptr [rsp + 0x2e0], 0
0x1402ed189: movups xmm0, xmmword ptr [rip + 0x5c37308]
0x1402ed190: movups xmmword ptr [rsp + 0x2e8], xmm0
0x1402ed198: mov qword ptr [rsp + 0x2f8], 0
0x1402ed1a4: movups xmm0, xmmword ptr [rip + 0x5c37305]
0x1402ed1ab: movaps xmmword ptr [rsp + 0x300], xmm0
0x1402ed1b3: mov qword ptr [rsp + 0x310], 0
0x1402ed1bf: movups xmm0, xmmword ptr [rip + 0x5c37302]
0x1402ed1c6: movups xmmword ptr [rsp + 0x318], xmm0
0x1402ed1ce: mov qword ptr [rsp + 0x328], 0
0x1402ed1da: movaps xmmword ptr [rsp + 0x30], xmm8
0x1402ed1e0: mov dword ptr [rsp + 0x40], 0x3f800000
0x1402ed1e8: movups xmmword ptr [rsp + 0x44], xmm8
0x1402ed1ee: mov dword ptr [rsp + 0x54], 0x3f800000
0x1402ed1f6: movups xmmword ptr [rsp + 0x58], xmm8
0x1402ed1fc: mov dword ptr [rsp + 0x68], 0x3f800000
0x1402ed204: movups xmmword ptr [rsp + 0x6c], xmm8
0x1402ed20a: mov dword ptr [rsp + 0x7c], 0x3f800000
0x1402ed212: xorps xmm0, xmm0
0x1402ed215: movups xmmword ptr [rsp + 0x14c], xmm0
0x1402ed21d: mov dword ptr [rsp + 0x15c], 0
0x1402ed228: movups xmmword ptr [rsp + 0x168], xmm0
0x1402ed230: movups xmmword ptr [rsp + 0x178], xmm0
0x1402ed238: movups xmmword ptr [rsp + 0x188], xmm0
0x1402ed240: mov rax, qword ptr [rsp + 0x70]
0x1402ed245: mov qword ptr [rsp + 0xc2], rax
0x1402ed24d: mov eax, dword ptr [rsp + 0x78]
0x1402ed251: mov dword ptr [rsp + 0xca], eax
0x1402ed258: mov eax, dword ptr [rsp + 0x7c]
0x1402ed25c: mov dword ptr [rsp + 0xce], eax
0x1402ed263: movaps xmm0, xmmword ptr [rsp + 0x30]
0x1402ed268: movaps xmm1, xmmword ptr [rsp + 0x40]
0x1402ed26d: movaps xmm2, xmmword ptr [rsp + 0x50]
0x1402ed272: movaps xmm3, xmmword ptr [rsp + 0x60]
0x1402ed277: movups xmmword ptr [rsp + 0xb2], xmm3
0x1402ed27f: movups xmmword ptr [rsp + 0xa2], xmm2
0x1402ed287: movups xmmword ptr [rsp + 0x92], xmm1
0x1402ed28f: movups xmmword ptr [rsp + 0x82], xmm0
0x1402ed297: movaps xmm0, xmmword ptr [rsp + 0x2d0]
0x1402ed29f: movaps xmm1, xmmword ptr [rsp + 0x2e0]
0x1402ed2a7: movaps xmm2, xmmword ptr [rsp + 0x2f0]
0x1402ed2af: movaps xmm3, xmmword ptr [rsp + 0x300]
0x1402ed2b7: movups xmmword ptr [rsp + 0xe0], xmm0
0x1402ed2bf: movups xmmword ptr [rsp + 0xf0], xmm1
0x1402ed2c7: movups xmmword ptr [rsp + 0x100], xmm2
0x1402ed2cf: movups xmmword ptr [rsp + 0x110], xmm3
0x1402ed2d7: movaps xmm0, xmmword ptr [rsp + 0x310]
0x1402ed2df: movups xmmword ptr [rsp + 0x120], xmm0
0x1402ed2e7: movaps xmm0, xmmword ptr [rsp + 0x320]
0x1402ed2ef: movups xmmword ptr [rsp + 0x130], xmm0
0x1402ed2f7: mov qword ptr [rsp + 0x140], 0
0x1402ed303: mov dword ptr [rsp + 0x148], 1
0x1402ed30e: movabs rax, 0x42c8000000000002
0x1402ed318: mov qword ptr [rsp + 0x160], rax
0x1402ed320: movaps xmm0, xmmword ptr [rip + 0x5bf2f19]
0x1402ed327: movups xmmword ptr [rsp + 0x198], xmm0
0x1402ed32f: movaps xmm0, xmmword ptr [rip + 0x5c2782a]
0x1402ed336: movups xmmword ptr [rsp + 0x1a8], xmm0
0x1402ed33e: movaps xmm0, xmmword ptr [rip + 0x5bf816b]
0x1402ed345: movups xmmword ptr [rsp + 0x1b8], xmm0
0x1402ed34d: movaps xmm0, xmmword ptr [rip + 0x5bf837c]
0x1402ed354: movups xmmword ptr [rsp + 0x1c8], xmm0
0x1402ed35c: movaps xmm0, xmmword ptr [rip + 0x5bf2c4d]
0x1402ed363: movups xmmword ptr [rsp + 0x1d8], xmm0
0x1402ed36b: movups xmmword ptr [rsp + 0x1e8], xmm0
0x1402ed373: movaps xmm0, xmmword ptr [rip + 0x5bf2f66]
0x1402ed37a: movups xmmword ptr [rsp + 0x1f8], xmm0
0x1402ed382: movups xmmword ptr [rsp + 0x208], xmm0
0x1402ed38a: movaps xmm0, xmmword ptr [rip + 0x5bf2b6f]
0x1402ed391: movups xmmword ptr [rsp + 0x218], xmm0
0x1402ed399: mov dword ptr [rsp + 0x228], 1
0x1402ed3a4: mov qword ptr [rsp + 0x22c], 0
0x1402ed3b0: mov byte ptr [rsp + 0x234], 1
0x1402ed3b8: mov qword ptr [rsp + 0x238], 0
0x1402ed3c4: mov dword ptr [rsp + 0x240], 0x3f800000
0x1402ed3cf: mov word ptr [rsp + 0x244], 0
0x1402ed3d9: mov word ptr [rsp + 0x24a], 0
0x1402ed3e3: mov dword ptr [rsp + 0x246], 0x10000
0x1402ed3ee: mov dword ptr [rsp + 0x24c], 0x10000
0x1402ed3f9: mov word ptr [rsp + 0x250], 0
0x1402ed403: mov dword ptr [rsp + 0x252], 0x3000100
0x1402ed40e: mov qword ptr [rsp + 0x256], 0
0x1402ed41a: movups xmm0, xmmword ptr [rsp + 0x80]
0x1402ed422: movups xmm1, xmmword ptr [rsp + 0x90]
0x1402ed42a: movups xmm2, xmmword ptr [rsp + 0xa0]
0x1402ed432: movups xmm3, xmmword ptr [rsp + 0xb0]
0x1402ed43a: movups xmmword ptr [rsp + 0x25e], xmm0
0x1402ed442: movups xmmword ptr [rsp + 0x26e], xmm1
0x1402ed44a: movups xmmword ptr [rsp + 0x27e], xmm2
0x1402ed452: movups xmmword ptr [rsp + 0x28e], xmm3
0x1402ed45a: movups xmm0, xmmword ptr [rsp + 0xc0]
0x1402ed462: movups xmmword ptr [rsp + 0x29e], xmm0
0x1402ed46a: movzx eax, word ptr [rsp + 0xd0]
0x1402ed472: mov word ptr [rsp + 0x2ae], ax
0x1402ed47a: mov dword ptr [rsp + 0x2b0], 0
0x1402ed485: movaps xmm0, xmmword ptr [rip + 0x5c36534]
0x1402ed48c: movups xmmword ptr [rsp + 0x2b4], xmm0
0x1402ed494: mov dword ptr [rsp + 0x2c4], 0x2328
0x1402ed49f: mov word ptr [rsp + 0x2c8], 0
0x1402ed4a9: mov qword ptr [rsp + 0xd8], r14
0x1402ed4b1: lea rcx, [rsp + 0x30]
0x1402ed4b6: lea r8, [rsp + 0xd8]
0x1402ed4be: mov rdx, rbx
0x1402ed4c1: call 0x1402bf4c0
0x1402ed4c6: mov rbx, qword ptr [rdi + 0x30]
0x1402ed4ca: test rbx, rbx
0x1402ed4cd: jns 0x1402ed4df
0x1402ed4cf: xor r15d, r15d
0x1402ed4d2: mov rcx, r15
0x1402ed4d5: mov rdx, rbx
0x1402ed4d8: call 0x145eb6fcb
0x1402ed4dd: ud2
0x1402ed4df: je 0x1402ed541
0x1402ed4e1: mov r14, qword ptr [rdi + 0x28]
0x1402ed4e5: call 0x140002200
0x1402ed4ea: mov r15d, 1
0x1402ed4f0: mov edx, 1
0x1402ed4f5: mov rcx, rbx
0x1402ed4f8: call 0x1400021c0
0x1402ed4fd: test rax, rax
0x1402ed500: je 0x1402ed4d2
0x1402ed502: mov rdi, rax
0x1402ed505: mov rcx, rax
0x1402ed508: mov rdx, r14
0x1402ed50b: mov r8, rbx
0x1402ed50e: call 0x145d145fb
0x1402ed513: cmp byte ptr [r12], 1
0x1402ed518: jne 0x1402ed54d
0x1402ed51a: mov eax, dword ptr [r12 + 1]
0x1402ed51f: mov ecx, dword ptr [r12 + 4]
0x1402ed524: mov dword ptr [rsp + 0x83], ecx
0x1402ed52b: mov dword ptr [rsp + 0x80], eax
0x1402ed532: mov rax, qword ptr [r12 + 8]
0x1402ed537: movzx ecx, byte ptr [r12 + 0x10]
0x1402ed53d: mov dl, 1
0x1402ed53f: jmp 0x1402ed55e
0x1402ed541: mov edi, 1
0x1402ed546: cmp byte ptr [r12], 1
0x1402ed54b: je 0x1402ed51a
0x1402ed54d: mov rax, qword ptr [r12 + 8]
0x1402ed552: lock inc qword ptr [rax]
0x1402ed556: jle 0x1402ed65e
0x1402ed55c: xor edx, edx
0x1402ed55e: mov qword ptr [rsp + 0xd8], rbx
0x1402ed566: mov qword ptr [rsp + 0xe0], rdi
0x1402ed56e: mov qword ptr [rsp + 0xe8], rbx
0x1402ed576: mov qword ptr [rsp + 0xf0], 0
0x1402ed582: mov qword ptr [rsp + 0xf8], 4
0x1402ed58e: mov qword ptr [rsp + 0x100], 0
0x1402ed59a: mov byte ptr [rsp + 0x108], dl
0x1402ed5a1: mov edx, dword ptr [rsp + 0x80]
0x1402ed5a8: mov r8d, dword ptr [rsp + 0x83]
0x1402ed5b0: mov dword ptr [rsp + 0x109], edx
0x1402ed5b7: mov dword ptr [rsp + 0x10c], r8d
0x1402ed5bf: mov qword ptr [rsp + 0x110], rax
0x1402ed5c7: mov qword ptr [rsp + 0x118], rcx
0x1402ed5cf: mov dword ptr [rsp + 0x120], 0x41500000
0x1402ed5da: mov word ptr [rsp + 0x124], 0x190
0x1402ed5e4: mov byte ptr [rsp + 0x126], 1
0x1402ed5ec: movups xmm0, xmmword ptr [rip + 0x5c3a471]
0x1402ed5f3: movups xmmword ptr [rsp + 0x128], xmm0
0x1402ed5fb: mov dword ptr [rsp + 0x138], 0x3f800000
0x1402ed606: mov dword ptr [rsp + 0x14c], ebp
0x1402ed60d: movups xmmword ptr [rsp + 0x13c], xmm6
0x1402ed615: movsd qword ptr [rsp + 0x150], xmm7
0x1402ed61e: lea rcx, [rsp + 0x30]
0x1402ed623: lea rdx, [rsp + 0xd8]
0x1402ed62b: call 0x1402d2c30
0x1402ed630: mov rax, rsi
0x1402ed633: movaps xmm6, xmmword ptr [rsp + 0x360]
0x1402ed63b: movaps xmm7, xmmword ptr [rsp + 0x370]
0x1402ed643: movaps xmm8, xmmword ptr [rsp + 0x380]
0x1402ed64c: add rsp, 0x390
0x1402ed653: pop rbx
0x1402ed654: pop rbp
0x1402ed655: pop rdi
0x1402ed656: pop rsi
0x1402ed657: pop r12
0x1402ed659: pop r14
0x1402ed65b: pop r15
0x1402ed65d: ret
0x1402ed65e: ud2
