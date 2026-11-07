;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x1459c3dd0..0x1459c4445 SHA256 fb3ffe3ec809eb337e2db57ca9aafc2d92f92e8ee19d4c126264b1e47cf1f6a7
0x1459c3dd0: push rbp
0x1459c3dd1: push r15
0x1459c3dd3: push r14
0x1459c3dd5: push r13
0x1459c3dd7: push r12
0x1459c3dd9: push rsi
0x1459c3dda: push rdi
0x1459c3ddb: push rbx
0x1459c3ddc: sub rsp, 0xc8
0x1459c3de3: lea rbp, [rsp + 0x80]
0x1459c3deb: mov qword ptr [rbp + 0x40], 0xfffffffffffffffe
0x1459c3df3: mov rbx, rdx
0x1459c3df6: mov qword ptr [rbp + 8], rcx
0x1459c3dfa: lea rdi, [rdx + 0x10]
0x1459c3dfe: lea r14, [rbp - 0x40]
0x1459c3e02: mov si, 0xa
0x1459c3e06: jmp 0x1459c3e20
0x1459c3e08: nop dword ptr [rax + rax]
0x1459c3e10: mov r12d, 1
0x1459c3e16: test r12b, 1
0x1459c3e1a: je 0x1459c4005
0x1459c3e20: cmp byte ptr [rbx + 0x41], 0
0x1459c3e24: jne 0x1459c3fe5
0x1459c3e2a: mov r15, qword ptr [rdi]
0x1459c3e2d: mov rcx, r14
0x1459c3e30: mov rdx, rdi
0x1459c3e33: call 0x1459c7330
0x1459c3e38: cmp dword ptr [rbp - 0x40], 1
0x1459c3e3c: jne 0x1459c3e60
0x1459c3e3e: mov rcx, qword ptr [rbp - 0x38]
0x1459c3e42: mov rax, qword ptr [rbp - 0x30]
0x1459c3e46: mov rdx, qword ptr [rbx]
0x1459c3e49: sub rcx, rdx
0x1459c3e4c: add r15, rdx
0x1459c3e4f: mov qword ptr [rbx], rax
0x1459c3e52: test rcx, rcx
0x1459c3e55: jne 0x1459c3e8e
0x1459c3e57: jmp 0x1459c3e10
0x1459c3e59: nop dword ptr [rax]
0x1459c3e60: cmp byte ptr [rbx + 0x41], 0
0x1459c3e64: jne 0x1459c3fe5
0x1459c3e6a: mov byte ptr [rbx + 0x41], 1
0x1459c3e6e: mov r15, qword ptr [rbx]
0x1459c3e71: mov rcx, qword ptr [rbx + 8]
0x1459c3e75: sub rcx, r15
0x1459c3e78: setne al
0x1459c3e7b: or al, byte ptr [rbx + 0x40]
0x1459c3e7e: cmp al, 1
0x1459c3e80: jne 0x1459c3fe5
0x1459c3e86: add r15, qword ptr [rdi]
0x1459c3e89: test rcx, rcx
0x1459c3e8c: je 0x1459c3e10
0x1459c3e8e: cmp rcx, 1
0x1459c3e92: jne 0x1459c3ec0
0x1459c3e94: movzx edx, byte ptr [r15]
0x1459c3e98: mov r12d, 0x101
0x1459c3e9e: cmp edx, 0x2b
0x1459c3ea1: je 0x1459c3e16
0x1459c3ea7: cmp edx, 0x2d
0x1459c3eaa: je 0x1459c3e16
0x1459c3eb0: jmp 0x1459c3ec4
0x1459c3eb2: nop word ptr cs:[rax + rax]
0x1459c3ec0: movzx edx, byte ptr [r15]
0x1459c3ec4: xor eax, eax
0x1459c3ec6: cmp dl, 0x2b
0x1459c3ec9: sete al
0x1459c3ecc: mov rdx, rcx
0x1459c3ecf: sub rdx, rax
0x1459c3ed2: add r15, rax
0x1459c3ed5: cmp rdx, 5
0x1459c3ed9: jae 0x1459c3f70
0x1459c3edf: test rdx, rdx
0x1459c3ee2: je 0x1459c3fbb
0x1459c3ee8: movzx eax, byte ptr [r15]
0x1459c3eec: add eax, -0x30
0x1459c3eef: mov r12d, 0x101
0x1459c3ef5: cmp eax, 9
0x1459c3ef8: ja 0x1459c3e16
0x1459c3efe: cmp rdx, 1
0x1459c3f02: je 0x1459c3fbd
0x1459c3f08: movzx ecx, byte ptr [r15 + 1]
0x1459c3f0d: add ecx, -0x30
0x1459c3f10: cmp ecx, 9
0x1459c3f13: ja 0x1459c3e16
0x1459c3f19: cwde
0x1459c3f1a: add eax, eax
0x1459c3f1c: lea eax, [rax + rax*4]
0x1459c3f1f: add eax, ecx
0x1459c3f21: cmp rdx, 2
0x1459c3f25: je 0x1459c3fbd
0x1459c3f2b: movzx ecx, byte ptr [r15 + 2]
0x1459c3f30: add ecx, -0x30
0x1459c3f33: cmp ecx, 9
0x1459c3f36: ja 0x1459c3e16
0x1459c3f3c: add eax, eax
0x1459c3f3e: lea eax, [rax + rax*4]
0x1459c3f41: add eax, ecx
0x1459c3f43: cmp rdx, 3
0x1459c3f47: je 0x1459c3fbd
0x1459c3f49: movzx ecx, byte ptr [r15 + 3]
0x1459c3f4e: add ecx, -0x30
0x1459c3f51: cmp ecx, 9
0x1459c3f54: ja 0x1459c3e16
0x1459c3f5a: add eax, eax
0x1459c3f5c: lea eax, [rax + rax*4]
0x1459c3f5f: add eax, ecx
0x1459c3f61: jmp 0x1459c3fbd
0x1459c3f63: nop word ptr cs:[rax + rax]
0x1459c3f70: neg rax
0x1459c3f73: add rcx, rax
0x1459c3f76: neg rcx
0x1459c3f79: xor r8d, r8d
0x1459c3f7c: xor eax, eax
0x1459c3f7e: nop
0x1459c3f80: mov rdx, rcx
0x1459c3f83: add rdx, r8
0x1459c3f86: je 0x1459c3fbd
0x1459c3f88: mul si
0x1459c3f8b: movzx edx, byte ptr [r15 + r8]
0x1459c3f90: jo 0x1459c3fc8
0x1459c3f92: movzx edx, dl
0x1459c3f95: add edx, -0x30
0x1459c3f98: cmp edx, 0xa
0x1459c3f9b: jae 0x1459c3fb0
0x1459c3f9d: inc r8
0x1459c3fa0: add ax, dx
0x1459c3fa3: jae 0x1459c3f80
0x1459c3fa5: mov r12d, 0x201
0x1459c3fab: jmp 0x1459c3e16
0x1459c3fb0: mov r12d, 0x101
0x1459c3fb6: jmp 0x1459c3e16
0x1459c3fbb: xor eax, eax
0x1459c3fbd: shl eax, 0x10
0x1459c3fc0: mov r12d, eax
0x1459c3fc3: jmp 0x1459c3e16
0x1459c3fc8: add dl, 0xd0
0x1459c3fcb: xor r12d, r12d
0x1459c3fce: cmp dl, 0xa
0x1459c3fd1: setb r12b
0x1459c3fd5: shl r12d, 8
0x1459c3fd9: add r12d, 0x101
0x1459c3fe0: jmp 0x1459c3e16
0x1459c3fe5: mov rax, qword ptr [rbp + 8]
0x1459c3fe9: mov qword ptr [rax], 0
0x1459c3ff0: mov qword ptr [rax + 8], 2
0x1459c3ff8: mov qword ptr [rax + 0x10], 0
0x1459c4000: jmp 0x1459c4406
0x1459c4005: call 0x140002200
0x1459c400a: mov ecx, 8
0x1459c400f: mov edx, 2
0x1459c4014: call 0x1400021c0
0x1459c4019: test rax, rax
0x1459c401c: je 0x1459c441a
0x1459c4022: shr r12d, 0x10
0x1459c4026: mov word ptr [rax], r12w
0x1459c402a: mov qword ptr [rbp + 0x18], 4
0x1459c4032: mov qword ptr [rbp + 0x10], rax
0x1459c4036: mov qword ptr [rbp + 0x20], rax
0x1459c403a: mov qword ptr [rbp + 0x28], 1
0x1459c4042: movups xmm0, xmmword ptr [rbx]
0x1459c4045: movups xmm1, xmmword ptr [rbx + 0x10]
0x1459c4049: movups xmm2, xmmword ptr [rbx + 0x20]
0x1459c404d: movups xmm3, xmmword ptr [rbx + 0x30]
0x1459c4051: movaps xmmword ptr [rbp - 0x30], xmm1
0x1459c4055: movaps xmmword ptr [rbp - 0x20], xmm2
0x1459c4059: movaps xmmword ptr [rbp - 0x10], xmm3
0x1459c405d: movaps xmmword ptr [rbp - 0x40], xmm0
0x1459c4061: mov rcx, qword ptr [rbx + 0x40]
0x1459c4065: mov qword ptr [rbp - 0x50], rcx
0x1459c4069: mov qword ptr [rbp], rcx
0x1459c406d: mov r15, qword ptr [rbp - 0x30]
0x1459c4071: mov rdi, qword ptr [rbp - 0x28]
0x1459c4075: mov rsi, qword ptr [rbp - 0x18]
0x1459c4079: movzx eax, byte ptr [rbp - 8]
0x1459c407d: mov byte ptr [rbp + 0x3f], al
0x1459c4080: movzx ebx, al
0x1459c4083: mov eax, 1
0x1459c4088: mov qword ptr [rbp + 0x30], rax
0x1459c408c: mov rax, qword ptr [rbp - 0x38]
0x1459c4090: mov qword ptr [rbp - 0x48], rax
0x1459c4094: movzx ecx, byte ptr [rbp + 1]
0x1459c4098: jmp 0x1459c40b0
0x1459c409a: nop word ptr [rax + rax]
0x1459c40a0: mov r12d, 1
0x1459c40a6: test r12b, 1
0x1459c40aa: je 0x1459c43a1
0x1459c40b0: test cl, 1
0x1459c40b3: jne 0x1459c43f3
0x1459c40b9: cmp rsi, rdi
0x1459c40bc: seta al
0x1459c40bf: mov r12, qword ptr [rbp - 0x20]
0x1459c40c3: cmp rsi, r12
0x1459c40c6: setb cl
0x1459c40c9: or cl, al
0x1459c40cb: jne 0x1459c41fb
0x1459c40d1: movzx r13d, byte ptr [rbp + rbx - 0x11]
0x1459c40d7: cmp byte ptr [rbp + 0x3f], 5
0x1459c40db: jb 0x1459c4169
0x1459c40e1: mov r8, rsi
0x1459c40e4: sub r8, r12
0x1459c40e7: lea rax, [r15 + r12]
0x1459c40eb: cmp r8, 0xf
0x1459c40ef: ja 0x1459c4115
0x1459c40f1: xor edx, edx
0x1459c40f3: test r8, r8
0x1459c40f6: je 0x1459c4111
0x1459c40f8: nop dword ptr [rax + rax]
0x1459c4100: cmp byte ptr [rax + rdx], r13b
0x1459c4104: je 0x1459c4123
0x1459c4106: inc rdx
0x1459c4109: cmp r8, rdx
0x1459c410c: jne 0x1459c4100
0x1459c410e: mov rdx, r8
0x1459c4111: xor eax, eax
0x1459c4113: jmp 0x1459c4128
0x1459c4115: mov ecx, r13d
0x1459c4118: mov rdx, rax
0x1459c411b: call 0x145bd5860
0x1459c4120: nop
0x1459c4121: jmp 0x1459c4128
0x1459c4123: mov eax, 1
0x1459c4128: cmp rax, 1
0x1459c412c: jne 0x1459c41f7
0x1459c4132: add r12, rdx
0x1459c4135: inc r12
0x1459c4138: mov qword ptr [rbp - 0x20], r12
0x1459c413c: cmp r12, rbx
0x1459c413f: setb al
0x1459c4142: cmp r12, rdi
0x1459c4145: seta cl
0x1459c4148: or cl, al
0x1459c414a: je 0x1459c442b
0x1459c4150: cmp rsi, r12
0x1459c4153: jae 0x1459c40e1
0x1459c4155: jmp 0x1459c41fb
0x1459c415a: nop word ptr [rax + rax]
0x1459c4160: cmp rsi, r12
0x1459c4163: jb 0x1459c41fb
0x1459c4169: mov r8, rsi
0x1459c416c: sub r8, r12
0x1459c416f: lea rax, [r15 + r12]
0x1459c4173: cmp r8, 0x10
0x1459c4177: jae 0x1459c41a0
0x1459c4179: xor edx, edx
0x1459c417b: test r8, r8
0x1459c417e: je 0x1459c4191
0x1459c4180: cmp byte ptr [rax + rdx], r13b
0x1459c4184: je 0x1459c41ec
0x1459c4186: inc rdx
0x1459c4189: cmp r8, rdx
0x1459c418c: jne 0x1459c4180
0x1459c418e: mov rdx, r8
0x1459c4191: xor eax, eax
0x1459c4193: cmp rax, 1
0x1459c4197: je 0x1459c41b2
0x1459c4199: jmp 0x1459c41f7
0x1459c419b: nop dword ptr [rax + rax]
0x1459c41a0: mov ecx, r13d
0x1459c41a3: mov rdx, rax
0x1459c41a6: call 0x145bd5860
0x1459c41ab: nop
0x1459c41ac: cmp rax, 1
0x1459c41b0: jne 0x1459c41f7
0x1459c41b2: add r12, rdx
0x1459c41b5: inc r12
0x1459c41b8: mov qword ptr [rbp - 0x20], r12
0x1459c41bc: mov r14, r12
0x1459c41bf: sub r14, rbx
0x1459c41c2: setb al
0x1459c41c5: cmp r12, rdi
0x1459c41c8: seta cl
0x1459c41cb: or cl, al
0x1459c41cd: jne 0x1459c4160
0x1459c41cf: lea rcx, [r15 + r14]
0x1459c41d3: lea rdx, [rbp - 0x10]
0x1459c41d7: mov r8, rbx
0x1459c41da: call 0x145bfa0e1
0x1459c41df: test eax, eax
0x1459c41e1: jne 0x1459c4160
0x1459c41e7: jmp 0x1459c435c
0x1459c41ec: mov eax, 1
0x1459c41f1: cmp rax, 1
0x1459c41f5: je 0x1459c41b2
0x1459c41f7: mov qword ptr [rbp - 0x20], rsi
0x1459c41fb: mov byte ptr [rbp + 1], 1
0x1459c41ff: mov r8, qword ptr [rbp - 0x40]
0x1459c4203: mov r14, qword ptr [rbp - 0x48]
0x1459c4207: sub r14, r8
0x1459c420a: setne al
0x1459c420d: or al, byte ptr [rbp - 0x50]
0x1459c4210: test al, 1
0x1459c4212: je 0x1459c43f3
0x1459c4218: mov cl, 1
0x1459c421a: test r14, r14
0x1459c421d: je 0x1459c40a0
0x1459c4223: add r8, r15
0x1459c4226: cmp r14, 1
0x1459c422a: jne 0x1459c4250
0x1459c422c: movzx edx, byte ptr [r8]
0x1459c4230: mov r12d, 0x101
0x1459c4236: cmp edx, 0x2b
0x1459c4239: je 0x1459c40a6
0x1459c423f: cmp edx, 0x2d
0x1459c4242: je 0x1459c40a6
0x1459c4248: jmp 0x1459c4254
0x1459c424a: nop word ptr [rax + rax]
0x1459c4250: movzx edx, byte ptr [r8]
0x1459c4254: xor eax, eax
0x1459c4256: cmp dl, 0x2b
0x1459c4259: sete al
0x1459c425c: mov rdx, r14
0x1459c425f: sub rdx, rax
0x1459c4262: add r8, rax
0x1459c4265: cmp rdx, 5
0x1459c4269: jae 0x1459c4300
0x1459c426f: test rdx, rdx
0x1459c4272: je 0x1459c4377
0x1459c4278: movzx eax, byte ptr [r8]
0x1459c427c: add eax, -0x30
0x1459c427f: mov r12d, 0x101
0x1459c4285: cmp eax, 9
0x1459c4288: ja 0x1459c40a6
0x1459c428e: cmp rdx, 1
0x1459c4292: je 0x1459c4379
0x1459c4298: movzx r9d, byte ptr [r8 + 1]
0x1459c429d: add r9d, -0x30
0x1459c42a1: cmp r9d, 9
0x1459c42a5: ja 0x1459c40a6
0x1459c42ab: cwde
0x1459c42ac: add eax, eax
0x1459c42ae: lea eax, [rax + rax*4]
0x1459c42b1: add eax, r9d
0x1459c42b4: cmp rdx, 2
0x1459c42b8: je 0x1459c4379
0x1459c42be: movzx r9d, byte ptr [r8 + 2]
0x1459c42c3: add r9d, -0x30
0x1459c42c7: cmp r9d, 9
0x1459c42cb: ja 0x1459c40a6
0x1459c42d1: add eax, eax
0x1459c42d3: lea eax, [rax + rax*4]
0x1459c42d6: add eax, r9d
0x1459c42d9: cmp rdx, 3
0x1459c42dd: je 0x1459c4379
0x1459c42e3: movzx edx, byte ptr [r8 + 3]
0x1459c42e8: add edx, -0x30
0x1459c42eb: cmp edx, 9
0x1459c42ee: ja 0x1459c40a6
0x1459c42f4: add eax, eax
0x1459c42f6: lea eax, [rax + rax*4]
0x1459c42f9: add eax, edx
0x1459c42fb: jmp 0x1459c4379
0x1459c4300: neg rax
0x1459c4303: add r14, rax
0x1459c4306: neg r14
0x1459c4309: xor r9d, r9d
0x1459c430c: xor eax, eax
0x1459c430e: mov r10w, 0xa
0x1459c4313: nop word ptr cs:[rax + rax]
0x1459c4320: mov rdx, r14
0x1459c4323: add rdx, r9
0x1459c4326: je 0x1459c4379
0x1459c4328: mul r10w
0x1459c432c: movzx edx, byte ptr [r8 + r9]
0x1459c4331: jo 0x1459c4384
0x1459c4333: movzx edx, dl
0x1459c4336: add edx, -0x30
0x1459c4339: cmp edx, 0xa
0x1459c433c: jae 0x1459c4351
0x1459c433e: inc r9
0x1459c4341: add ax, dx
0x1459c4344: jae 0x1459c4320
0x1459c4346: mov r12d, 0x201
0x1459c434c: jmp 0x1459c40a6
0x1459c4351: mov r12d, 0x101
0x1459c4357: jmp 0x1459c40a6
0x1459c435c: mov r8, qword ptr [rbp - 0x40]
0x1459c4360: sub r14, r8
0x1459c4363: mov qword ptr [rbp - 0x40], r12
0x1459c4367: xor ecx, ecx
0x1459c4369: test r14, r14
0x1459c436c: jne 0x1459c4223
0x1459c4372: jmp 0x1459c40a0
0x1459c4377: xor eax, eax
0x1459c4379: shl eax, 0x10
0x1459c437c: mov r12d, eax
0x1459c437f: jmp 0x1459c40a6
0x1459c4384: add dl, 0xd0
0x1459c4387: xor r12d, r12d
0x1459c438a: cmp dl, 0xa
0x1459c438d: setb r12b
0x1459c4391: shl r12d, 8
0x1459c4395: add r12d, 0x101
0x1459c439c: jmp 0x1459c40a6
0x1459c43a1: mov rdx, qword ptr [rbp + 0x30]
0x1459c43a5: cmp rdx, qword ptr [rbp + 0x18]
0x1459c43a9: mov rax, qword ptr [rbp + 0x10]
0x1459c43ad: jne 0x1459c43d6
0x1459c43af: mov qword ptr [rsp + 0x20], 2
0x1459c43b8: mov r8d, 1
0x1459c43be: mov r9d, 2
0x1459c43c4: lea rcx, [rbp + 0x18]
0x1459c43c8: call 0x145bfa970
0x1459c43cd: nop
0x1459c43ce: mov rax, qword ptr [rbp + 0x20]
0x1459c43d2: mov rdx, qword ptr [rbp + 0x30]
0x1459c43d6: shr r12d, 0x10
0x1459c43da: mov qword ptr [rbp + 0x10], rax
0x1459c43de: mov word ptr [rax + rdx*2], r12w
0x1459c43e3: inc rdx
0x1459c43e6: mov qword ptr [rbp + 0x30], rdx
0x1459c43ea: mov qword ptr [rbp + 0x28], rdx
0x1459c43ee: jmp 0x1459c4094
0x1459c43f3: mov rcx, qword ptr [rbp + 0x28]
0x1459c43f7: mov rax, qword ptr [rbp + 8]
0x1459c43fb: mov qword ptr [rax + 0x10], rcx
0x1459c43ff: movups xmm0, xmmword ptr [rbp + 0x18]
0x1459c4403: movups xmmword ptr [rax], xmm0
0x1459c4406: add rsp, 0xc8
0x1459c440d: pop rbx
0x1459c440e: pop rdi
0x1459c440f: pop rsi
0x1459c4410: pop r12
0x1459c4412: pop r13
0x1459c4414: pop r14
0x1459c4416: pop r15
0x1459c4418: pop rbp
0x1459c4419: ret
0x1459c441a: mov ecx, 2
0x1459c441f: mov edx, 8
0x1459c4424: call 0x145d992bb
0x1459c4429: ud2
0x1459c442b: lea r9, [rip + 0x18728ae]
0x1459c4432: mov r8d, 4
0x1459c4438: xor ecx, ecx
0x1459c443a: mov rdx, rbx
0x1459c443d: call 0x145d99860
0x1459c4442: nop
0x1459c4443: ud2
