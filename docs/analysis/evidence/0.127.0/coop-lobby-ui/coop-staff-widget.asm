0x140334b70: push r15
0x140334b72: push r14
0x140334b74: push r12
0x140334b76: push rsi
0x140334b77: push rdi
0x140334b78: push rbp
0x140334b79: push rbx
0x140334b7a: sub rsp, 0x390
0x140334b81: movaps xmmword ptr [rsp + 0x380], xmm8
0x140334b8a: movaps xmmword ptr [rsp + 0x370], xmm7
0x140334b92: movaps xmmword ptr [rsp + 0x360], xmm6
0x140334b9a: mov rdi, rdx
0x140334b9d: mov rsi, rcx
0x140334ba0: mov r14, qword ptr [rcx]
0x140334ba3: mov rax, qword ptr [rcx + 0x28]
0x140334ba7: mov qword ptr [rsp + 0x330], r14
0x140334baf: movups xmm0, xmmword ptr [rcx + 8]
0x140334bb3: movups xmmword ptr [rsp + 0x338], xmm0
0x140334bbb: movups xmm0, xmmword ptr [rcx + 0x18]
0x140334bbf: movups xmmword ptr [rsp + 0x348], xmm0
0x140334bc7: mov qword ptr [rsp + 0x358], rax
0x140334bcf: mov r12, qword ptr [rdx + 0x18]
0x140334bd3: mov rax, qword ptr [rdx + 0x20]
0x140334bd7: movss xmm0, dword ptr [rax]
0x140334bdb: cmp byte ptr [r12], 1
0x140334be0: jne 0x140334c03
0x140334be2: mov eax, dword ptr [r12 + 1]
0x140334be7: mov ecx, dword ptr [r12 + 4]
0x140334bec: mov dword ptr [rsp + 0x2b], ecx
0x140334bf0: mov dword ptr [rsp + 0x28], eax
0x140334bf4: mov rax, qword ptr [r12 + 8]
0x140334bf9: movzx ecx, byte ptr [r12 + 0x10]
0x140334bff: mov dl, 1
0x140334c01: jmp 0x140334c14
0x140334c03: mov rax, qword ptr [r12 + 8]
0x140334c08: lock inc qword ptr [rax]
0x140334c0c: jle 0x14033520e
0x140334c12: xor edx, edx
0x140334c14: lea rbx, [rsp + 0x338]
0x140334c1c: movups xmm8, xmmword ptr [rip + 0x5f4adfc]
0x140334c24: movups xmmword ptr [rsp + 0x31], xmm8
0x140334c2a: mov dword ptr [rsp + 0x41], 0x3f800000
0x140334c32: mov r8, qword ptr [rdi + 0x10]
0x140334c36: mov qword ptr [rsp + 0xf0], r8
0x140334c3e: movups xmm1, xmmword ptr [rdi]
0x140334c41: movups xmmword ptr [rsp + 0xe0], xmm1
0x140334c49: mov qword ptr [rsp + 0xf8], 0
0x140334c55: mov qword ptr [rsp + 0x100], 4
0x140334c61: mov qword ptr [rsp + 0x108], 0
0x140334c6d: mov byte ptr [rsp + 0x110], dl
0x140334c74: mov edx, dword ptr [rsp + 0x28]
0x140334c78: mov r8d, dword ptr [rsp + 0x2b]
0x140334c7d: mov dword ptr [rsp + 0x111], edx
0x140334c84: mov dword ptr [rsp + 0x114], r8d
0x140334c8c: mov qword ptr [rsp + 0x118], rax
0x140334c94: mov qword ptr [rsp + 0x120], rcx
0x140334c9c: movss dword ptr [rsp + 0x128], xmm0
0x140334ca5: mov word ptr [rsp + 0x12c], 0x190
0x140334caf: mov byte ptr [rsp + 0x12e], 1
0x140334cb7: movups xmm0, xmmword ptr [rsp + 0x30]
0x140334cbc: movups xmmword ptr [rsp + 0x12f], xmm0
0x140334cc4: mov rax, qword ptr [rsp + 0x3d]
0x140334cc9: mov qword ptr [rsp + 0x13c], rax
0x140334cd1: mov ebp, dword ptr [rip + 0x5f2bb99]
0x140334cd7: mov dword ptr [rsp + 0x154], ebp
0x140334cde: movups xmm6, xmmword ptr [rip + 0x5f2bb7b]
0x140334ce5: movups xmmword ptr [rsp + 0x144], xmm6
0x140334ced: movsd xmm7, qword ptr [rip + 0x5efe23b]
0x140334cf5: movsd qword ptr [rsp + 0x158], xmm7
0x140334cfe: mov qword ptr [rsp + 0xd8], r14
0x140334d06: lea rcx, [rsp + 0x80]
0x140334d0e: lea r8, [rsp + 0xd8]
0x140334d16: mov rdx, rbx
0x140334d19: call 0x1402fea40
0x140334d1e: movups xmm0, xmmword ptr [rip + 0x5f46b93]
0x140334d25: movaps xmmword ptr [rsp + 0x2d0], xmm0
0x140334d2d: mov qword ptr [rsp + 0x2e0], 0
0x140334d39: movups xmm0, xmmword ptr [rip + 0x5f46b90]
0x140334d40: movups xmmword ptr [rsp + 0x2e8], xmm0
0x140334d48: mov qword ptr [rsp + 0x2f8], 0
0x140334d54: movups xmm0, xmmword ptr [rip + 0x5f46b8d]
0x140334d5b: movaps xmmword ptr [rsp + 0x300], xmm0
0x140334d63: mov qword ptr [rsp + 0x310], 0
0x140334d6f: movups xmm0, xmmword ptr [rip + 0x5f46b8a]
0x140334d76: movups xmmword ptr [rsp + 0x318], xmm0
0x140334d7e: mov qword ptr [rsp + 0x328], 0
0x140334d8a: movaps xmmword ptr [rsp + 0x30], xmm8
0x140334d90: mov dword ptr [rsp + 0x40], 0x3f800000
0x140334d98: movups xmmword ptr [rsp + 0x44], xmm8
0x140334d9e: mov dword ptr [rsp + 0x54], 0x3f800000
0x140334da6: movups xmmword ptr [rsp + 0x58], xmm8
0x140334dac: mov dword ptr [rsp + 0x68], 0x3f800000
0x140334db4: movups xmmword ptr [rsp + 0x6c], xmm8
0x140334dba: mov dword ptr [rsp + 0x7c], 0x3f800000
0x140334dc2: xorps xmm0, xmm0
0x140334dc5: movups xmmword ptr [rsp + 0x14c], xmm0
0x140334dcd: mov dword ptr [rsp + 0x15c], 0
0x140334dd8: movups xmmword ptr [rsp + 0x168], xmm0
0x140334de0: movups xmmword ptr [rsp + 0x178], xmm0
0x140334de8: movups xmmword ptr [rsp + 0x188], xmm0
0x140334df0: mov rax, qword ptr [rsp + 0x70]
0x140334df5: mov qword ptr [rsp + 0xc2], rax
0x140334dfd: mov eax, dword ptr [rsp + 0x78]
0x140334e01: mov dword ptr [rsp + 0xca], eax
0x140334e08: mov eax, dword ptr [rsp + 0x7c]
0x140334e0c: mov dword ptr [rsp + 0xce], eax
0x140334e13: movaps xmm0, xmmword ptr [rsp + 0x30]
0x140334e18: movaps xmm1, xmmword ptr [rsp + 0x40]
0x140334e1d: movaps xmm2, xmmword ptr [rsp + 0x50]
0x140334e22: movaps xmm3, xmmword ptr [rsp + 0x60]
0x140334e27: movups xmmword ptr [rsp + 0xb2], xmm3
0x140334e2f: movups xmmword ptr [rsp + 0xa2], xmm2
0x140334e37: movups xmmword ptr [rsp + 0x92], xmm1
0x140334e3f: movups xmmword ptr [rsp + 0x82], xmm0
0x140334e47: movaps xmm0, xmmword ptr [rsp + 0x2d0]
0x140334e4f: movaps xmm1, xmmword ptr [rsp + 0x2e0]
0x140334e57: movaps xmm2, xmmword ptr [rsp + 0x2f0]
0x140334e5f: movaps xmm3, xmmword ptr [rsp + 0x300]
0x140334e67: movups xmmword ptr [rsp + 0xe0], xmm0
0x140334e6f: movups xmmword ptr [rsp + 0xf0], xmm1
0x140334e77: movups xmmword ptr [rsp + 0x100], xmm2
0x140334e7f: movups xmmword ptr [rsp + 0x110], xmm3
0x140334e87: movaps xmm0, xmmword ptr [rsp + 0x310]
0x140334e8f: movups xmmword ptr [rsp + 0x120], xmm0
0x140334e97: movaps xmm0, xmmword ptr [rsp + 0x320]
0x140334e9f: movups xmmword ptr [rsp + 0x130], xmm0
0x140334ea7: mov qword ptr [rsp + 0x140], 0
0x140334eb3: mov dword ptr [rsp + 0x148], 1
0x140334ebe: movabs rax, 0x42c8000000000002
0x140334ec8: mov qword ptr [rsp + 0x160], rax
0x140334ed0: movaps xmm0, xmmword ptr [rip + 0x5efe089]
0x140334ed7: movups xmmword ptr [rsp + 0x198], xmm0
0x140334edf: movaps xmm0, xmmword ptr [rip + 0x5f17aba]
0x140334ee6: movups xmmword ptr [rsp + 0x1a8], xmm0
0x140334eee: movaps xmm0, xmmword ptr [rip + 0x5f1790b]
0x140334ef5: movups xmmword ptr [rsp + 0x1b8], xmm0
0x140334efd: movaps xmm0, xmmword ptr [rip + 0x5efe09c]
0x140334f04: movups xmmword ptr [rsp + 0x1c8], xmm0
0x140334f0c: movaps xmm0, xmmword ptr [rip + 0x5efe09d]
0x140334f13: movups xmmword ptr [rsp + 0x1d8], xmm0
0x140334f1b: movups xmmword ptr [rsp + 0x1e8], xmm0
0x140334f23: movaps xmm0, xmmword ptr [rip + 0x5efe0b6]
0x140334f2a: movups xmmword ptr [rsp + 0x1f8], xmm0
0x140334f32: movups xmmword ptr [rsp + 0x208], xmm0
0x140334f3a: movaps xmm0, xmmword ptr [rip + 0x5efe00f]
0x140334f41: movups xmmword ptr [rsp + 0x218], xmm0
0x140334f49: mov dword ptr [rsp + 0x228], 1
0x140334f54: mov qword ptr [rsp + 0x22c], 0
0x140334f60: mov byte ptr [rsp + 0x234], 1
0x140334f68: mov qword ptr [rsp + 0x238], 0
0x140334f74: mov dword ptr [rsp + 0x240], 0x3f800000
0x140334f7f: mov word ptr [rsp + 0x244], 0
0x140334f89: mov word ptr [rsp + 0x24a], 0
0x140334f93: mov dword ptr [rsp + 0x246], 0x10000
0x140334f9e: mov dword ptr [rsp + 0x24c], 0x10000
0x140334fa9: mov word ptr [rsp + 0x250], 0
0x140334fb3: mov dword ptr [rsp + 0x252], 0x3000100
0x140334fbe: mov qword ptr [rsp + 0x256], 0
0x140334fca: movups xmm0, xmmword ptr [rsp + 0x80]
0x140334fd2: movups xmm1, xmmword ptr [rsp + 0x90]
0x140334fda: movups xmm2, xmmword ptr [rsp + 0xa0]
0x140334fe2: movups xmm3, xmmword ptr [rsp + 0xb0]
0x140334fea: movups xmmword ptr [rsp + 0x25e], xmm0
0x140334ff2: movups xmmword ptr [rsp + 0x26e], xmm1
0x140334ffa: movups xmmword ptr [rsp + 0x27e], xmm2
0x140335002: movups xmmword ptr [rsp + 0x28e], xmm3
0x14033500a: movups xmm0, xmmword ptr [rsp + 0xc0]
0x140335012: movups xmmword ptr [rsp + 0x29e], xmm0
0x14033501a: movzx eax, word ptr [rsp + 0xd0]
0x140335022: mov word ptr [rsp + 0x2ae], ax
0x14033502a: mov dword ptr [rsp + 0x2b0], 0
0x140335035: movaps xmm0, xmmword ptr [rip + 0x5f45d54]
0x14033503c: movups xmmword ptr [rsp + 0x2b4], xmm0
0x140335044: mov dword ptr [rsp + 0x2c4], 0x2328
0x14033504f: mov word ptr [rsp + 0x2c8], 0
0x140335059: mov qword ptr [rsp + 0xd8], r14
0x140335061: lea rcx, [rsp + 0x30]
0x140335066: lea r8, [rsp + 0xd8]
0x14033506e: mov rdx, rbx
0x140335071: call 0x1402fe500
0x140335076: mov rbx, qword ptr [rdi + 0x30]
0x14033507a: test rbx, rbx
0x14033507d: jns 0x14033508f
0x14033507f: xor r15d, r15d
0x140335082: mov rcx, r15
0x140335085: mov rdx, rbx
0x140335088: call 0x14620896b
0x14033508d: ud2 
0x14033508f: je 0x1403350f1
0x140335091: mov r14, qword ptr [rdi + 0x28]
0x140335095: call 0x140002200
0x14033509a: mov r15d, 1
0x1403350a0: mov edx, 1
0x1403350a5: mov rcx, rbx
0x1403350a8: call 0x1400021c0
0x1403350ad: test rax, rax
0x1403350b0: je 0x140335082
0x1403350b2: mov rdi, rax
0x1403350b5: mov rcx, rax
0x1403350b8: mov rdx, r14
0x1403350bb: mov r8, rbx
0x1403350be: call 0x14606171b
0x1403350c3: cmp byte ptr [r12], 1
0x1403350c8: jne 0x1403350fd
0x1403350ca: mov eax, dword ptr [r12 + 1]
0x1403350cf: mov ecx, dword ptr [r12 + 4]
0x1403350d4: mov dword ptr [rsp + 0x83], ecx
0x1403350db: mov dword ptr [rsp + 0x80], eax
0x1403350e2: mov rax, qword ptr [r12 + 8]
0x1403350e7: movzx ecx, byte ptr [r12 + 0x10]
0x1403350ed: mov dl, 1
0x1403350ef: jmp 0x14033510e
0x1403350f1: mov edi, 1
0x1403350f6: cmp byte ptr [r12], 1
0x1403350fb: je 0x1403350ca
0x1403350fd: mov rax, qword ptr [r12 + 8]
0x140335102: lock inc qword ptr [rax]
0x140335106: jle 0x14033520e
0x14033510c: xor edx, edx
0x14033510e: mov qword ptr [rsp + 0xd8], rbx
0x140335116: mov qword ptr [rsp + 0xe0], rdi
0x14033511e: mov qword ptr [rsp + 0xe8], rbx
0x140335126: mov qword ptr [rsp + 0xf0], 0
0x140335132: mov qword ptr [rsp + 0xf8], 4
0x14033513e: mov qword ptr [rsp + 0x100], 0
0x14033514a: mov byte ptr [rsp + 0x108], dl
0x140335151: mov edx, dword ptr [rsp + 0x80]
0x140335158: mov r8d, dword ptr [rsp + 0x83]
0x140335160: mov dword ptr [rsp + 0x109], edx
0x140335167: mov dword ptr [rsp + 0x10c], r8d
0x14033516f: mov qword ptr [rsp + 0x110], rax
0x140335177: mov qword ptr [rsp + 0x118], rcx
0x14033517f: mov dword ptr [rsp + 0x120], 0x41500000
0x14033518a: mov word ptr [rsp + 0x124], 0x190
0x140335194: mov byte ptr [rsp + 0x126], 1
0x14033519c: movups xmm0, xmmword ptr [rip + 0x5f4a891]
0x1403351a3: movups xmmword ptr [rsp + 0x128], xmm0
0x1403351ab: mov dword ptr [rsp + 0x138], 0x3f800000
0x1403351b6: mov dword ptr [rsp + 0x14c], ebp
0x1403351bd: movups xmmword ptr [rsp + 0x13c], xmm6
0x1403351c5: movsd qword ptr [rsp + 0x150], xmm7
0x1403351ce: lea rcx, [rsp + 0x30]
0x1403351d3: lea rdx, [rsp + 0xd8]
0x1403351db: call 0x1403133a0
0x1403351e0: mov rax, rsi
0x1403351e3: movaps xmm6, xmmword ptr [rsp + 0x360]
0x1403351eb: movaps xmm7, xmmword ptr [rsp + 0x370]
0x1403351f3: movaps xmm8, xmmword ptr [rsp + 0x380]
0x1403351fc: add rsp, 0x390
0x140335203: pop rbx
0x140335204: pop rbp
0x140335205: pop rdi
0x140335206: pop rsi
0x140335207: pop r12
0x140335209: pop r14
0x14033520b: pop r15
0x14033520d: ret 
0x14033520e: ud2 
