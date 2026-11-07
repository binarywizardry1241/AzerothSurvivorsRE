1400f4090: push       rbp
1400f4091: push       r15
1400f4093: push       r14
1400f4095: push       r13
1400f4097: push       r12
1400f4099: push       rsi
1400f409a: push       rdi
1400f409b: push       rbx
1400f409c: sub        rsp, 0x128
1400f40a3: lea        rbp, [rsp + 0x80]
1400f40ab: movaps     xmmword ptr [rbp + 0x90], xmm10
1400f40b3: movaps     xmmword ptr [rbp + 0x80], xmm9
1400f40bb: movaps     xmmword ptr [rbp + 0x70], xmm8
1400f40c0: movaps     xmmword ptr [rbp + 0x60], xmm7
1400f40c4: movaps     xmmword ptr [rbp + 0x50], xmm6
1400f40c8: mov        qword ptr [rbp + 0x48], 0xfffffffffffffffe
1400f40d0: mov        rax, qword ptr [rbp + 0x128]
1400f40d7: mov        rcx, qword ptr [rbp + 0x120]
1400f40de: mov        r10, qword ptr [rbp + 0x118]
1400f40e5: mov        r11, qword ptr [rbp + 0x110]
1400f40ec: mov        r12, qword ptr [rdx]
1400f40ef: mov        rsi, qword ptr [rdx + 0x10]
1400f40f3: mov        qword ptr [rbp + 0x40], rsi
1400f40f7: mov        edx, dword ptr [rdx + 0x1c]
1400f40fa: mov        dword ptr [rbp + 0x30], edx
1400f40fd: mov        rbx, qword ptr [r11]
1400f4100: mov        rsi, qword ptr [r10]
1400f4103: mov        rdx, qword ptr [rcx]
1400f4106: mov        qword ptr [rbp + 0x28], rdx
1400f410a: mov        r13, qword ptr [rcx + 8]
1400f410e: mov        ecx, dword ptr [rcx + 0x14]
1400f4111: mov        dword ptr [rbp - 0xc], ecx
1400f4114: mov        rcx, qword ptr [rax]
1400f4117: mov        qword ptr [rbp - 0x58], rcx
1400f411b: mov        r15, qword ptr [rax + 8]
1400f411f: mov        eax, dword ptr [rax + 0x14]
1400f4122: mov        dword ptr [rbp - 0x10], eax
1400f4125: movss      xmm6, dword ptr [rsi + 0x5c]
1400f412a: cmp        byte ptr [r12 + 0x1c], 1
1400f4130: mov        qword ptr [rbp - 0x20], rsi
1400f4134: mov        qword ptr [rbp - 0x60], rbx
1400f4138: jne        0x1400f414e
1400f413a: mov        rax, qword ptr [r8]
1400f413d: cmp        byte ptr [rax + 0xd], 1
1400f4141: jne        0x1400f414e
1400f4143: cmp        byte ptr [rax + 0xe], 1
1400f4147: jne        0x1400f414e
1400f4149: cmp        byte ptr [rax], 0
1400f414c: je         0x1400f41c8
1400f414e: xor        ebx, ebx
1400f4150: mov        rsi, qword ptr [r12]
1400f4154: test       rsi, rsi
1400f4157: mov        qword ptr [rbp + 0x20], r15
1400f415b: je         0x1400f42cf
1400f4161: mov        rdi, qword ptr [r12 + 8]
1400f4166: test       rbx, rbx
1400f4169: setne      al
1400f416c: cmp        rdi, r14
1400f416f: sete       cl
1400f4172: test       al, cl
1400f4174: je         0x1400f418c
1400f4176: mov        rcx, rsi
1400f4179: mov        rdx, rbx
1400f417c: mov        r8, r14
1400f417f: call       0x145c1d501
1400f4184: test       eax, eax
1400f4186: je         0x1400f42f4
1400f418c: xorps      xmm0, xmm0
1400f418f: ucomiss    xmm0, dword ptr [r12 + 0x18]
1400f4195: jb         0x1400f42f7
1400f419b: mov        rax, qword ptr [rbp + 0x40]
1400f419f: mov        ecx, dword ptr [rbp + 0x30]
1400f41a2: mov        dword ptr [rax], ecx
1400f41a4: mov        qword ptr [r12], rbx
1400f41a8: mov        qword ptr [r12 + 8], r14
1400f41ad: movss      dword ptr [r12 + 0x10], xmm6
1400f41b4: mov        rsi, rbx
1400f41b7: mov        rdi, r14
1400f41ba: test       rbx, rbx
1400f41bd: jne        0x1400f42f7
1400f41c3: jmp        0x1400f457a
1400f41c8: mov        rax, qword ptr [r9]
1400f41cb: mov        rdi, qword ptr [rax + 0x20]
1400f41cf: mov        r14, qword ptr [rax + 0x28]
1400f41d3: lea        rdx, [rip + 0x5d11576]
1400f41da: lea        rcx, [rbp - 0x50]
1400f41de: mov        r8d, 0x12
1400f41e4: call       0x145be0d70
1400f41e9: mov        rdx, qword ptr [rbp - 0x50]
1400f41ed: cmp        rdx, -2
1400f41f1: mov        qword ptr [rbp + 0x20], r14
1400f41f5: je         0x1400f421e
1400f41f7: cmp        rdx, -1
1400f41fb: je         0x1400f42a7
1400f4201: test       rdx, rdx
1400f4204: je         0x1400f42a7
1400f420a: mov        rcx, qword ptr [rbp - 0x48]
1400f420e: mov        r8d, 1
1400f4214: call       0x1400021d0
1400f4219: jmp        0x1400f42a7
1400f421e: mov        rdx, qword ptr [rbp - 0x48]
1400f4222: cmp        rdx, -1
1400f4226: je         0x1400f42a7
1400f4228: mov        rbx, qword ptr [rbp - 0x40]
1400f422c: mov        rax, qword ptr [rip + 0x7fca175]
1400f4233: mov        rcx, qword ptr [rax + 8]
1400f4237: test       rcx, rcx
1400f423a: je         0x1400f428c
1400f423c: mov        qword ptr [rbp - 0x18], rdx
1400f4240: mov        qword ptr [rbp + 0x38], r12
1400f4244: mov        rsi, qword ptr [rbp - 0x38]
1400f4248: mov        r14, qword ptr [rax]
1400f424b: imul       r12, rcx, 0xf0
1400f4252: jmp        0x1400f4264
1400f4254: add        r14, 0xf0
1400f425b: add        r12, -0xf0
1400f4262: je         0x1400f427f
1400f4264: cmp        qword ptr [r14 + 0x10], rsi
1400f4268: jne        0x1400f4254
1400f426a: mov        rcx, qword ptr [r14 + 8]
1400f426e: mov        rdx, rbx
1400f4271: mov        r8, rsi
1400f4274: call       0x145c1d501
1400f4279: test       eax, eax
1400f427b: jne        0x1400f4254
1400f427d: jmp        0x1400f4282
1400f427f: xor        r14d, r14d
1400f4282: mov        r12, qword ptr [rbp + 0x38]
1400f4286: mov        rdx, qword ptr [rbp - 0x18]
1400f428a: jmp        0x1400f428f
1400f428c: xor        r14d, r14d
1400f428f: test       rdx, rdx
1400f4292: je         0x1400f42a2
1400f4294: mov        r8d, 1
1400f429a: mov        rcx, rbx
1400f429d: call       0x1400021d0
1400f42a2: test       r14, r14
1400f42a5: jne        0x1400f42b6
1400f42a7: mov        rcx, rdi
1400f42aa: mov        rdx, qword ptr [rbp + 0x20]
1400f42ae: call       0x1458ac880
1400f42b3: mov        r14, rax
1400f42b6: mov        rbx, qword ptr [r14 + 8]
1400f42ba: mov        r14, qword ptr [r14 + 0x10]
1400f42be: mov        rsi, qword ptr [r12]
1400f42c2: test       rsi, rsi
1400f42c5: mov        qword ptr [rbp + 0x20], r15
1400f42c9: jne        0x1400f4161
1400f42cf: test       rbx, rbx
1400f42d2: je         0x1400f457a
1400f42d8: mov        rax, qword ptr [rbp + 0x40]
1400f42dc: mov        ecx, dword ptr [rbp + 0x30]
1400f42df: mov        dword ptr [rax], ecx
1400f42e1: mov        qword ptr [r12], rbx
1400f42e5: mov        qword ptr [r12 + 8], r14
1400f42ea: movss      dword ptr [r12 + 0x10], xmm6
1400f42f1: mov        rsi, rbx
1400f42f4: mov        rdi, r14
1400f42f7: xor        eax, eax
1400f42f9: test       rbx, rbx
1400f42fc: je         0x1400f4316
1400f42fe: cmp        rdi, r14
1400f4301: jne        0x1400f4316
1400f4303: mov        rcx, rsi
1400f4306: mov        rdx, rbx
1400f4309: mov        r8, r14
1400f430c: call       0x145c1d501
1400f4311: test       eax, eax
1400f4313: sete       al
1400f4316: mov        dword ptr [rbp - 0x18], eax
1400f4319: subss      xmm6, dword ptr [r12 + 0x10]
1400f4320: mov        rcx, rsi
1400f4323: mov        rdx, rdi
1400f4326: call       0x1458ac880
1400f432b: mov        rbx, rax
1400f432e: lea        rcx, [rbp - 0x50]
1400f4332: mov        rdx, rax
1400f4335: call       0x1458d0ed0
1400f433a: lea        rdx, [rip + 0x5d11421]
1400f4341: mov        rcx, rbp
1400f4344: mov        r8d, 0x18
1400f434a: call       0x145be0d70
1400f434f: mov        rdx, qword ptr [rbp]
1400f4353: cmp        rdx, -2
1400f4357: je         0x1400f4375
1400f4359: cmp        rdx, -1
1400f435d: je         0x1400f43c3
1400f435f: test       rdx, rdx
1400f4362: je         0x1400f43c3
1400f4364: mov        rcx, qword ptr [rbp + 8]
1400f4368: mov        r8d, 1
1400f436e: call       0x1400021d0
1400f4373: jmp        0x1400f43c3
1400f4375: mov        rax, qword ptr [rbp + 8]
1400f4379: mov        qword ptr [rbp + 0x38], rax
1400f437d: cmp        rax, -1
1400f4381: je         0x1400f43c3
1400f4383: mov        rcx, qword ptr [rbp + 0x10]
1400f4387: mov        rdx, qword ptr [rbp + 0x18]
1400f438b: mov        qword ptr [rbp - 8], rcx
1400f438f: call       0x145bfecf0
1400f4394: nop
1400f4395: mov        r14, rax
1400f4398: mov        rdx, qword ptr [rbp + 0x38]
1400f439c: test       rdx, rdx
1400f439f: je         0x1400f43b0
1400f43a1: mov        r8d, 1
1400f43a7: mov        rcx, qword ptr [rbp - 8]
1400f43ab: call       0x1400021d0
1400f43b0: test       r14b, 1
1400f43b4: jne        0x1400f43c3
1400f43b6: shr        r14, 0x20
1400f43ba: movd       xmm0, r14d
1400f43bf: mulss      xmm6, xmm0
1400f43c3: mov        ebx, dword ptr [rbx + 0xc0]
1400f43c9: mov        rax, qword ptr [rip + 0x7fc9fd8]
1400f43d0: mov        rcx, qword ptr [rax + 8]
1400f43d4: test       rcx, rcx
1400f43d7: je         0x1400f443f
1400f43d9: mov        dword ptr [rbp - 8], ebx
1400f43dc: mov        qword ptr [rbp + 0x38], r12
1400f43e0: mov        rbx, qword ptr [rax]
1400f43e3: imul       r12, rcx, 0xf0
1400f43ea: xor        r14d, r14d
1400f43ed: xor        r15d, r15d
1400f43f0: jmp        0x1400f440f
1400f43f2: nop        word ptr cs:[rax + rax]
1400f4400: dec        r14
1400f4403: add        r15, 0xf0
1400f440a: cmp        r12, r15
1400f440d: je         0x1400f442f
1400f440f: cmp        qword ptr [rbx + r15 + 0x10], rdi
1400f4414: jne        0x1400f4400
1400f4416: mov        rcx, qword ptr [rbx + r15 + 8]
1400f441b: mov        rdx, rsi
1400f441e: mov        r8, rdi
1400f4421: call       0x145c1d501
1400f4426: test       eax, eax
1400f4428: jne        0x1400f4400
1400f442a: neg        r14d
1400f442d: jmp        0x1400f4432
1400f442f: xor        r14d, r14d
1400f4432: mov        r15, qword ptr [rbp + 0x20]
1400f4436: mov        r12, qword ptr [rbp + 0x38]
1400f443a: mov        ebx, dword ptr [rbp - 8]
1400f443d: jmp        0x1400f4442
1400f443f: xor        r14d, r14d
1400f4442: movss      xmm8, dword ptr [rbp - 0x38]
1400f4448: movss      xmm9, dword ptr [rip + 0x5d0ec4f]
1400f4451: mulss      xmm6, xmm9
1400f4456: divss      xmm6, dword ptr [rbp - 0x34]
1400f445b: movaps     xmm0, xmm6
1400f445e: call       0x145c1d52b
1400f4463: movaps     xmm7, xmm0
1400f4466: cmpnless   xmm9, xmm8
1400f446c: mulss      xmm8, xmm0
1400f4471: movaps     xmm0, xmm9
1400f4475: andnps     xmm0, xmm6
1400f4478: andps      xmm8, xmm9
1400f447c: orps       xmm8, xmm0
1400f4480: movss      xmm10, dword ptr [rbp - 0x44]
1400f4486: movss      xmm9, dword ptr [rbp - 0x48]
1400f448c: addss      xmm8, dword ptr [rbp - 0x3c]
1400f4492: movaps     xmm0, xmm8
1400f4496: call       0x145c1d52b
1400f449b: movaps     xmm6, xmm0
1400f449e: mulss      xmm7, dword ptr [rbp - 0x28]
1400f44a3: addss      xmm7, xmm10
1400f44a8: movaps     xmm0, xmm8
1400f44ac: call       0x145c1d555
1400f44b1: movaps     xmm1, xmm7
1400f44b4: mulss      xmm1, xmm0
1400f44b8: mulss      xmm10, dword ptr [rbp - 0x30]
1400f44be: movss      xmm2, dword ptr [rbp - 0x2c]
1400f44c3: addss      xmm2, xmm9
1400f44c8: movss      xmm3, dword ptr [rbp - 0x24]
1400f44cd: movsd      xmm4, qword ptr [rbp - 0x50]
1400f44d2: addss      xmm1, xmm4
1400f44d6: unpcklps   xmm0, xmm6
1400f44d9: movss      xmm5, dword ptr [rbp - 0x40]
1400f44de: unpcklps   xmm7, xmm5
1400f44e1: movlhps    xmm7, xmm0
1400f44e4: movss      xmm0, dword ptr [rip + 0x5ccdc98]
1400f44ec: unpcklps   xmm6, xmm0
1400f44ef: shufps     xmm6, xmm10, 4
1400f44f4: mulps      xmm6, xmm7
1400f44f7: movddup    xmm0, xmm4
1400f44fb: shufps     xmm9, xmm4, 0xd4
1400f4500: shufps     xmm9, xmm4, 0x42
1400f4505: addps      xmm9, xmm6
1400f4509: subps      xmm0, xmm6
1400f450c: movsd      xmm0, xmm9
1400f4511: mov        dword ptr [rbp - 0x4c], ebx
1400f4514: mov        dword ptr [rbp - 0x48], r14d
1400f4518: movss      dword ptr [rbp - 0x44], xmm1
1400f451d: movupd     xmmword ptr [rbp - 0x40], xmm0
1400f4522: movss      dword ptr [rbp - 0x30], xmm2
1400f4527: movss      dword ptr [rbp - 0x2c], xmm3
1400f452c: mov        dword ptr [rbp - 0x50], 1
1400f4533: lea        rcx, [rbp - 0x50]
1400f4537: call       0x140829170
1400f453c: mov        rax, qword ptr [rbp - 0x60]
1400f4540: movzx      ecx, byte ptr [rax + 0x72]
1400f4544: call       0x140829090
1400f4549: cmp        byte ptr [rbp - 0x18], 0
1400f454d: mov        rsi, qword ptr [rbp - 0x20]
1400f4551: je         0x1400f459b
1400f4553: call       0x1408292a0
1400f4558: movss      xmm0, dword ptr [rsi + 0x58]
1400f455d: test       al, al
1400f455f: je         0x1400f45a0
1400f4561: divss      xmm0, dword ptr [rip + 0x5d040fb]
1400f4569: addss      xmm0, dword ptr [r12 + 0x18]
1400f4570: minss      xmm0, dword ptr [rip + 0x5ccdc0c]
1400f4578: jmp        0x1400f45b6
1400f457a: mov        dword ptr [rbp - 0x50], 0
1400f4581: lea        rcx, [rbp - 0x50]
1400f4585: call       0x140829170
1400f458a: mov        rax, qword ptr [rbp - 0x60]
1400f458e: movzx      ecx, byte ptr [rax + 0x72]
1400f4592: call       0x140829090
1400f4597: mov        rsi, qword ptr [rbp - 0x20]
1400f459b: movss      xmm0, dword ptr [rsi + 0x58]
1400f45a0: divss      xmm0, dword ptr [rip + 0x5d0eafc]
1400f45a8: addss      xmm0, dword ptr [r12 + 0x18]
1400f45af: xorps      xmm1, xmm1
1400f45b2: maxss      xmm0, xmm1
1400f45b6: mov        rax, qword ptr [rbp + 0x40]
1400f45ba: mov        ecx, dword ptr [rbp + 0x30]
1400f45bd: mov        dword ptr [rax], ecx
1400f45bf: movss      dword ptr [r12 + 0x18], xmm0
1400f45c6: movaps     xmm1, xmm0
1400f45c9: mulss      xmm1, xmm0
1400f45cd: addss      xmm0, xmm0
1400f45d1: movss      xmm2, dword ptr [rip + 0x5ccdd7b]
1400f45d9: subss      xmm2, xmm0
1400f45dd: mulss      xmm2, xmm1
1400f45e1: movss      xmm6, dword ptr [rip + 0x5ccdb9b]
1400f45e9: subss      xmm6, xmm2
1400f45ed: cmp        byte ptr [r12 + 0x1c], 0
1400f45f3: movaps     xmm7, xmm6
1400f45f6: jne        0x1400f45fb
1400f45f8: xorps      xmm7, xmm7
1400f45fb: mov        rcx, qword ptr [rbp + 0x28]
1400f45ff: mov        rbx, qword ptr [rcx + 0xf8]
1400f4606: mov        rax, qword ptr [rcx + 0x100]
1400f460d: lea        r14, [rbx + rax*4]
1400f4611: cmp        byte ptr [rcx + 0x108], 0
1400f4618: je         0x1400f4711
1400f461e: xor        r12d, r12d
1400f4621: movsd      xmm8, qword ptr [rip + 0x5d0ea86]
1400f462a: mov        qword ptr [rbp + 0x40], 0
1400f4632: xor        esi, esi
1400f4634: jmp        0x1400f4646
1400f4636: nop        word ptr cs:[rax + rax]
1400f4640: inc        esi
1400f4642: mov        r15, qword ptr [rbp + 0x20]
1400f4646: cmp        esi, r12d
1400f4649: jne        0x1400f46ae
1400f464b: nop        dword ptr [rax + rax]
1400f4650: cmp        rbx, r14
1400f4653: je         0x1400f483e
1400f4659: mov        ecx, dword ptr [rbx]
1400f465b: add        rbx, 4
1400f465f: mov        rax, qword ptr [r13 + 0x1a8]
1400f4666: lea        rcx, [rcx + rcx*8]
1400f466a: mov        r12, qword ptr [rax + rcx*8 + 0x10]
1400f466f: test       r12, r12
1400f4672: je         0x1400f4650
1400f4674: lea        rax, [rax + rcx*8]
1400f4678: mov        rcx, qword ptr [rbp + 0x28]
1400f467c: mov        rcx, qword ptr [rcx + 0x110]
1400f4683: mov        rdx, qword ptr [rax + 0x18]
1400f4687: mov        rax, qword ptr [rax + 0x38]
1400f468b: mov        rax, qword ptr [rax + rcx*8]
1400f468f: not        rax
1400f4692: lea        rax, [rax + rax*2]
1400f4696: shl        rax, 4
1400f469a: mov        rcx, qword ptr [rdx + rax + 0x10]
1400f469f: mov        qword ptr [rbp + 0x40], rcx
1400f46a3: mov        rax, qword ptr [rdx + rax + 0x28]
1400f46a8: mov        qword ptr [rbp + 0x30], rax
1400f46ac: xor        esi, esi
1400f46ae: mov        r15d, esi
1400f46b1: mov        rax, r15
1400f46b4: shl        rax, 7
1400f46b8: lea        rax, [rax + r15*8]
1400f46bc: movsd      qword ptr [rbp + 4], xmm8
1400f46c2: mov        dword ptr [rbp + 0xc], 0x3eb851ec
1400f46c9: movss      dword ptr [rbp + 0x10], xmm7
1400f46ce: mov        dword ptr [rbp], 0
1400f46d5: mov        rcx, qword ptr [rbp + 0x40]
1400f46d9: lea        rdi, [rcx + rax]
1400f46dd: add        rdi, 0x38
1400f46e1: mov        rcx, rdi
1400f46e4: mov        rdx, rbp
1400f46e7: call       0x1400ff830
1400f46ec: test       al, al
1400f46ee: jne        0x1400f4640
1400f46f4: mov        eax, dword ptr [rbp - 0xc]
1400f46f7: mov        rcx, qword ptr [rbp + 0x30]
1400f46fb: mov        dword ptr [rcx + r15*4], eax
1400f46ff: mov        eax, dword ptr [rbp + 0x10]
1400f4702: mov        dword ptr [rdi + 0x10], eax
1400f4705: movups     xmm0, xmmword ptr [rbp]
1400f4709: movups     xmmword ptr [rdi], xmm0
1400f470c: jmp        0x1400f4640
1400f4711: xor        r12d, r12d
1400f4714: mov        eax, 8
1400f4719: mov        qword ptr [rbp + 0x40], rax
1400f471d: movsd      xmm8, qword ptr [rip + 0x5d0e98a]
1400f4726: mov        qword ptr [rbp + 0x30], 0
1400f472e: xor        esi, esi
1400f4730: jmp        0x1400f4746
1400f4732: nop        word ptr cs:[rax + rax]
1400f4740: inc        esi
1400f4742: mov        r15, qword ptr [rbp + 0x20]
1400f4746: cmp        esi, r12d
1400f4749: jne        0x1400f47cc
1400f474f: nop
1400f4750: cmp        rbx, r14
1400f4753: je         0x1400f483e
1400f4759: mov        ecx, dword ptr [rbx]
1400f475b: add        rbx, 4
1400f475f: mov        rax, qword ptr [r13 + 0x108]
1400f4766: lea        rcx, [rcx + rcx*4]
1400f476a: shl        rcx, 5
1400f476e: mov        r12, qword ptr [rax + rcx + 0x58]
1400f4773: test       r12, r12
1400f4776: je         0x1400f4750
1400f4778: add        rax, rcx
1400f477b: mov        ecx, dword ptr [rax + 0x94]
1400f4781: mov        rdx, qword ptr [r13 + 0x1a8]
1400f4788: lea        rcx, [rcx + rcx*8]
1400f478c: mov        r8, qword ptr [rbp + 0x28]
1400f4790: mov        r8, qword ptr [r8 + 0x110]
1400f4797: mov        r9, qword ptr [rdx + rcx*8 + 0x18]
1400f479c: mov        rcx, qword ptr [rdx + rcx*8 + 0x38]
1400f47a1: mov        rcx, qword ptr [rcx + r8*8]
1400f47a5: not        rcx
1400f47a8: lea        rcx, [rcx + rcx*2]
1400f47ac: shl        rcx, 4
1400f47b0: mov        rdx, qword ptr [r9 + rcx + 0x10]
1400f47b5: mov        qword ptr [rbp + 0x30], rdx
1400f47b9: mov        rcx, qword ptr [r9 + rcx + 0x28]
1400f47be: mov        qword ptr [rbp - 0x20], rcx
1400f47c2: mov        rax, qword ptr [rax + 0x50]
1400f47c6: mov        qword ptr [rbp + 0x40], rax
1400f47ca: xor        esi, esi
1400f47cc: mov        eax, esi
1400f47ce: shl        rax, 4
1400f47d2: mov        rcx, qword ptr [rbp + 0x40]
1400f47d6: mov        r15d, dword ptr [rcx + rax + 8]
1400f47db: not        r15d
1400f47de: mov        rax, r15
1400f47e1: shl        rax, 7
1400f47e5: lea        rax, [rax + r15*8]
1400f47e9: movsd      qword ptr [rbp + 4], xmm8
1400f47ef: mov        dword ptr [rbp + 0xc], 0x3eb851ec
1400f47f6: movss      dword ptr [rbp + 0x10], xmm7
1400f47fb: mov        dword ptr [rbp], 0
1400f4802: mov        rcx, qword ptr [rbp + 0x30]
1400f4806: lea        rdi, [rcx + rax]
1400f480a: add        rdi, 0x38
1400f480e: mov        rcx, rdi
1400f4811: mov        rdx, rbp
1400f4814: call       0x1400ff830
1400f4819: test       al, al
1400f481b: jne        0x1400f4740
1400f4821: mov        eax, dword ptr [rbp - 0xc]
1400f4824: mov        rcx, qword ptr [rbp - 0x20]
1400f4828: mov        dword ptr [rcx + r15*4], eax
1400f482c: mov        eax, dword ptr [rbp + 0x10]
1400f482f: mov        dword ptr [rdi + 0x10], eax
1400f4832: movups     xmm0, xmmword ptr [rbp]
1400f4836: movups     xmmword ptr [rdi], xmm0
1400f4839: jmp        0x1400f4740
1400f483e: mov        rcx, qword ptr [rbp - 0x58]
1400f4842: mov        rbx, qword ptr [rcx + 0xf8]
1400f4849: mov        rax, qword ptr [rcx + 0x100]
1400f4850: lea        r14, [rbx + rax*4]
1400f4854: cmp        byte ptr [rcx + 0x108], 0
1400f485b: je         0x1400f493e
1400f4861: xor        r12d, r12d
1400f4864: movsd      xmm7, qword ptr [rip + 0x5d0e854]
1400f486c: xor        esi, esi
1400f486e: xor        r13d, r13d
1400f4871: jmp        0x1400f4887
1400f4873: nop        word ptr cs:[rax + rax]
1400f4880: inc        r13d
1400f4883: mov        r15, qword ptr [rbp + 0x20]
1400f4887: cmp        r13d, r12d
1400f488a: jne        0x1400f48eb
1400f488c: nop        dword ptr [rax]
1400f4890: cmp        rbx, r14
1400f4893: je         0x1400f4a4c
1400f4899: mov        ecx, dword ptr [rbx]
1400f489b: add        rbx, 4
1400f489f: mov        rax, qword ptr [r15 + 0x1a8]
1400f48a6: lea        rcx, [rcx + rcx*8]
1400f48aa: mov        r12, qword ptr [rax + rcx*8 + 0x10]
1400f48af: test       r12, r12
1400f48b2: je         0x1400f4890
1400f48b4: lea        rax, [rax + rcx*8]
1400f48b8: mov        rcx, qword ptr [rbp - 0x58]
1400f48bc: mov        rcx, qword ptr [rcx + 0x110]
1400f48c3: mov        rdx, qword ptr [rax + 0x18]
1400f48c7: mov        rax, qword ptr [rax + 0x38]
1400f48cb: mov        rax, qword ptr [rax + rcx*8]
1400f48cf: not        rax
1400f48d2: lea        rax, [rax + rax*2]
1400f48d6: shl        rax, 4
1400f48da: mov        rsi, qword ptr [rdx + rax + 0x10]
1400f48df: mov        rax, qword ptr [rdx + rax + 0x28]
1400f48e4: mov        qword ptr [rbp + 0x28], rax
1400f48e8: xor        r13d, r13d
1400f48eb: mov        r15d, r13d
1400f48ee: lea        rax, [r15 + r15*4]
1400f48f2: lea        rdi, [rsi + rax*4]
1400f48f6: movsd      qword ptr [rbp + 4], xmm7
1400f48fb: mov        dword ptr [rbp + 0xc], 0x3c449ba6
1400f4902: movss      dword ptr [rbp + 0x10], xmm6
1400f4907: mov        dword ptr [rbp], 0
1400f490e: mov        rcx, rdi
1400f4911: mov        rdx, rbp
1400f4914: call       0x1400ff830
1400f4919: test       al, al
1400f491b: jne        0x1400f4880
1400f4921: mov        eax, dword ptr [rbp - 0x10]
1400f4924: mov        rcx, qword ptr [rbp + 0x28]
1400f4928: mov        dword ptr [rcx + r15*4], eax
1400f492c: mov        eax, dword ptr [rbp + 0x10]
1400f492f: mov        dword ptr [rdi + 0x10], eax
1400f4932: movups     xmm0, xmmword ptr [rbp]
1400f4936: movups     xmmword ptr [rdi], xmm0
1400f4939: jmp        0x1400f4880
1400f493e: xor        r12d, r12d
1400f4941: mov        eax, 8
1400f4946: mov        qword ptr [rbp + 0x28], rax
1400f494a: movsd      xmm7, qword ptr [rip + 0x5d0e76e]
1400f4952: xor        esi, esi
1400f4954: xor        r13d, r13d
1400f4957: jmp        0x1400f4967
1400f4959: nop        dword ptr [rax]
1400f4960: inc        r13d
1400f4963: mov        r15, qword ptr [rbp + 0x20]
1400f4967: cmp        r13d, r12d
1400f496a: jne        0x1400f49e9
1400f496c: nop        dword ptr [rax]
1400f4970: cmp        rbx, r14
1400f4973: je         0x1400f4a4c
1400f4979: mov        ecx, dword ptr [rbx]
1400f497b: add        rbx, 4
1400f497f: mov        rax, qword ptr [r15 + 0x108]
1400f4986: lea        rcx, [rcx + rcx*4]
1400f498a: shl        rcx, 5
1400f498e: mov        r12, qword ptr [rax + rcx + 0x58]
1400f4993: test       r12, r12
1400f4996: je         0x1400f4970
1400f4998: add        rax, rcx
1400f499b: mov        ecx, dword ptr [rax + 0x94]
1400f49a1: mov        rdx, qword ptr [r15 + 0x1a8]
1400f49a8: lea        rcx, [rcx + rcx*8]
1400f49ac: mov        r8, qword ptr [rbp - 0x58]
1400f49b0: mov        r8, qword ptr [r8 + 0x110]
1400f49b7: mov        r9, qword ptr [rdx + rcx*8 + 0x18]
1400f49bc: mov        rcx, qword ptr [rdx + rcx*8 + 0x38]
1400f49c1: mov        rcx, qword ptr [rcx + r8*8]
1400f49c5: not        rcx
1400f49c8: lea        rcx, [rcx + rcx*2]
1400f49cc: shl        rcx, 4
1400f49d0: mov        rsi, qword ptr [r9 + rcx + 0x10]
1400f49d5: mov        rcx, qword ptr [r9 + rcx + 0x28]
1400f49da: mov        qword ptr [rbp + 0x40], rcx
1400f49de: mov        rax, qword ptr [rax + 0x50]
1400f49e2: mov        qword ptr [rbp + 0x28], rax
1400f49e6: xor        r13d, r13d
1400f49e9: mov        eax, r13d
1400f49ec: shl        rax, 4
1400f49f0: mov        rcx, qword ptr [rbp + 0x28]
1400f49f4: mov        r15d, dword ptr [rcx + rax + 8]
1400f49f9: not        r15d
1400f49fc: lea        rax, [r15 + r15*4]
1400f4a00: lea        rdi, [rsi + rax*4]
1400f4a04: movsd      qword ptr [rbp + 4], xmm7
1400f4a09: mov        dword ptr [rbp + 0xc], 0x3c449ba6
1400f4a10: movss      dword ptr [rbp + 0x10], xmm6
1400f4a15: mov        dword ptr [rbp], 0
1400f4a1c: mov        rcx, rdi
1400f4a1f: mov        rdx, rbp
1400f4a22: call       0x1400ff830
1400f4a27: test       al, al
1400f4a29: jne        0x1400f4960
1400f4a2f: mov        eax, dword ptr [rbp - 0x10]
1400f4a32: mov        rcx, qword ptr [rbp + 0x40]
1400f4a36: mov        dword ptr [rcx + r15*4], eax
1400f4a3a: mov        eax, dword ptr [rbp + 0x10]
1400f4a3d: mov        dword ptr [rdi + 0x10], eax
1400f4a40: movups     xmm0, xmmword ptr [rbp]
1400f4a44: movups     xmmword ptr [rdi], xmm0
1400f4a47: jmp        0x1400f4960
1400f4a4c: movaps     xmm6, xmmword ptr [rbp + 0x50]
1400f4a50: movaps     xmm7, xmmword ptr [rbp + 0x60]
1400f4a54: movaps     xmm8, xmmword ptr [rbp + 0x70]
1400f4a59: movaps     xmm9, xmmword ptr [rbp + 0x80]
1400f4a61: movaps     xmm10, xmmword ptr [rbp + 0x90]
1400f4a69: add        rsp, 0x128
1400f4a70: pop        rbx
1400f4a71: pop        rdi
1400f4a72: pop        rsi
1400f4a73: pop        r12
1400f4a75: pop        r13
1400f4a77: pop        r14
1400f4a79: pop        r15
1400f4a7b: pop        rbp
1400f4a7c: ret
