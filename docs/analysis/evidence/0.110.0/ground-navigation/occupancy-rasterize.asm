1459a4390: 55 push rbp
1459a4391: 4157 push r15
1459a4393: 4156 push r14
1459a4395: 4155 push r13
1459a4397: 4154 push r12
1459a4399: 56 push rsi
1459a439a: 57 push rdi
1459a439b: 53 push rbx
1459a439c: 4881ec78010000 sub rsp, 0x178
1459a43a3: 488dac2480000000 lea rbp, [rsp + 0x80]
1459a43ab: 440f29bde0000000 movaps xmmword ptr [rbp + 0xe0], xmm15
1459a43b3: 440f29b5d0000000 movaps xmmword ptr [rbp + 0xd0], xmm14
1459a43bb: 440f29adc0000000 movaps xmmword ptr [rbp + 0xc0], xmm13
1459a43c3: 440f29a5b0000000 movaps xmmword ptr [rbp + 0xb0], xmm12
1459a43cb: 440f299da0000000 movaps xmmword ptr [rbp + 0xa0], xmm11
1459a43d3: 440f299590000000 movaps xmmword ptr [rbp + 0x90], xmm10
1459a43db: 440f298d80000000 movaps xmmword ptr [rbp + 0x80], xmm9
1459a43e3: 440f294570 movaps xmmword ptr [rbp + 0x70], xmm8
1459a43e8: 0f297d60 movaps xmmword ptr [rbp + 0x60], xmm7
1459a43ec: 0f297550 movaps xmmword ptr [rbp + 0x50], xmm6
1459a43f0: 48c74548feffffff mov qword ptr [rbp + 0x48], 0xfffffffffffffffe
1459a43f8: 4889d3 mov rbx, rdx
1459a43fb: 4889cf mov rdi, rcx
1459a43fe: 488bb570010000 mov rsi, qword ptr [rbp + 0x170]
1459a4405: 4c8bb568010000 mov r14, qword ptr [rbp + 0x168]
1459a440c: f30f108560010000 movss xmm0, dword ptr [rbp + 0x160]
1459a4414: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
1459a441a: 488d4de0 lea rcx, [rbp - 0x20]
1459a441e: e89dd60000 call 0x1459b1ac0
1459a4423: 48b8abaaaaaaaaaaaaaa movabs rax, 0xaaaaaaaaaaaaaaab
1459a442d: 48f76328 mul qword ptr [rbx + 0x28]
1459a4431: 48d1ea shr rdx, 1
1459a4434: 4c8d0452 lea r8, [rdx + rdx*2]
1459a4438: 4983f803 cmp r8, 3
1459a443c: 737c jae 0x1459a44ba
1459a443e: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1459a4442: 4885c0 test rax, rax
1459a4445: 0f8487000000 je 0x1459a44d2
1459a444b: 488b4de8 mov rcx, qword ptr [rbp - 0x18]
1459a444f: 48c1e002 shl rax, 2
1459a4453: 488d1440 lea rdx, [rax + rax*2]
1459a4457: 41b804000000 mov r8d, 4
1459a445d: 0f287550 movaps xmm6, xmmword ptr [rbp + 0x50]
1459a4461: 0f287d60 movaps xmm7, xmmword ptr [rbp + 0x60]
1459a4465: 440f284570 movaps xmm8, xmmword ptr [rbp + 0x70]
1459a446a: 440f288d80000000 movaps xmm9, xmmword ptr [rbp + 0x80]
1459a4472: 440f289590000000 movaps xmm10, xmmword ptr [rbp + 0x90]
1459a447a: 440f289da0000000 movaps xmm11, xmmword ptr [rbp + 0xa0]
1459a4482: 440f28a5b0000000 movaps xmm12, xmmword ptr [rbp + 0xb0]
1459a448a: 440f28adc0000000 movaps xmm13, xmmword ptr [rbp + 0xc0]
1459a4492: 440f28b5d0000000 movaps xmm14, xmmword ptr [rbp + 0xd0]
1459a449a: 440f28bde0000000 movaps xmm15, xmmword ptr [rbp + 0xe0]
1459a44a2: 4881c478010000 add rsp, 0x178
1459a44a9: 5b pop rbx
1459a44aa: 5f pop rdi
1459a44ab: 5e pop rsi
1459a44ac: 415c pop r12
1459a44ae: 415d pop r13
1459a44b0: 415e pop r14
1459a44b2: 415f pop r15
1459a44b4: 5d pop rbp
1459a44b5: e916dd65fa jmp 0x1400021d0
1459a44ba: f20f107720 movsd xmm6, qword ptr [rdi + 0x20]
1459a44bf: 4c8b6718 mov r12, qword ptr [rdi + 0x18]
1459a44c3: 4d85e4 test r12, r12
1459a44c6: 7863 js 0x1459a452b
1459a44c8: 0f57c0 xorps xmm0, xmm0
1459a44cb: f3490f2ac4 cvtsi2ss xmm0, r12
1459a44d0: eb74 jmp 0x1459a4546
1459a44d2: 0f287550 movaps xmm6, xmmword ptr [rbp + 0x50]
1459a44d6: 0f287d60 movaps xmm7, xmmword ptr [rbp + 0x60]
1459a44da: 440f284570 movaps xmm8, xmmword ptr [rbp + 0x70]
1459a44df: 440f288d80000000 movaps xmm9, xmmword ptr [rbp + 0x80]
1459a44e7: 440f289590000000 movaps xmm10, xmmword ptr [rbp + 0x90]
1459a44ef: 440f289da0000000 movaps xmm11, xmmword ptr [rbp + 0xa0]
1459a44f7: 440f28a5b0000000 movaps xmm12, xmmword ptr [rbp + 0xb0]
1459a44ff: 440f28adc0000000 movaps xmm13, xmmword ptr [rbp + 0xc0]
1459a4507: 440f28b5d0000000 movaps xmm14, xmmword ptr [rbp + 0xd0]
1459a450f: 440f28bde0000000 movaps xmm15, xmmword ptr [rbp + 0xe0]
1459a4517: 4881c478010000 add rsp, 0x178
1459a451e: 5b pop rbx
1459a451f: 5f pop rdi
1459a4520: 5e pop rsi
1459a4521: 415c pop r12
1459a4523: 415d pop r13
1459a4525: 415e pop r14
1459a4527: 415f pop r15
1459a4529: 5d pop rbp
1459a452a: c3 ret
1459a452b: 4c89e0 mov rax, r12
1459a452e: 48d1e8 shr rax, 1
1459a4531: 4489e1 mov ecx, r12d
1459a4534: 83e101 and ecx, 1
1459a4537: 4809c1 or rcx, rax
1459a453a: 0f57c0 xorps xmm0, xmm0
1459a453d: f3480f2ac1 cvtsi2ss xmm0, rcx
1459a4542: f30f58c0 addss xmm0, xmm0
1459a4546: 4c8b4b20 mov r9, qword ptr [rbx + 0x20]
1459a454a: f30f12c0 movsldup xmm0, xmm0
1459a454e: 0f58c6 addps xmm0, xmm6
1459a4551: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1459a4555: 488b4708 mov rax, qword ptr [rdi + 8]
1459a4559: 488945f8 mov qword ptr [rbp - 8], rax
1459a455d: 488b4710 mov rax, qword ptr [rdi + 0x10]
1459a4561: 48894520 mov qword ptr [rbp + 0x20], rax
1459a4565: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1459a4569: 48894540 mov qword ptr [rbp + 0x40], rax
1459a456d: 488b55f0 mov rdx, qword ptr [rbp - 0x10]
1459a4571: f3440f1025d6d34000 movss xmm12, dword ptr [rip + 0x40d3d6]
1459a457a: 4531ff xor r15d, r15d
1459a457d: 450f57ed xorps xmm13, xmm13
1459a4581: f3440f1035cad34000 movss xmm14, dword ptr [rip + 0x40d3ca]
1459a458a: 49c7c5ffffffff mov r13, 0xffffffffffffffff
1459a4591: 450f57ff xorps xmm15, xmm15
1459a4595: f3440f101dbed54000 movss xmm11, dword ptr [rip + 0x40d5be]
1459a459e: f3440f100dfd1a4100 movss xmm9, dword ptr [rip + 0x411afd]
1459a45a7: 48895528 mov qword ptr [rbp + 0x28], rdx
1459a45ab: eb21 jmp 0x1459a45ce
1459a45ad: 0f1f00 nop dword ptr [rax]
1459a45b0: 4c8b4d08 mov r9, qword ptr [rbp + 8]
1459a45b4: 4983c10c add r9, 0xc
1459a45b8: 4c8b4500 mov r8, qword ptr [rbp]
1459a45bc: 4983c0fd add r8, -3
1459a45c0: 4983f803 cmp r8, 3
1459a45c4: 488b5528 mov rdx, qword ptr [rbp + 0x28]
1459a45c8: 0f8270feffff jb 0x1459a443e
1459a45ce: 418b09 mov ecx, dword ptr [r9]
1459a45d1: 4839ca cmp rdx, rcx
1459a45d4: 0f86a2040000 jbe 0x1459a4a7c
1459a45da: 418b4104 mov eax, dword ptr [r9 + 4]
1459a45de: 4839c2 cmp rdx, rax
1459a45e1: 0f8683040000 jbe 0x1459a4a6a
1459a45e7: 4c894500 mov qword ptr [rbp], r8
1459a45eb: 4c894d08 mov qword ptr [rbp + 8], r9
1459a45ef: 458b4908 mov r9d, dword ptr [r9 + 8]
1459a45f3: 4c39ca cmp rdx, r9
1459a45f6: 0f8658040000 jbe 0x1459a4a54
1459a45fc: 488d0c49 lea rcx, [rcx + rcx*2]
1459a4600: 4c8b4540 mov r8, qword ptr [rbp + 0x40]
1459a4604: f2450f101488 movsd xmm10, qword ptr [r8 + rcx*4]
1459a460a: 488d0440 lea rax, [rax + rax*2]
1459a460e: f2410f100c80 movsd xmm1, qword ptr [r8 + rax*4]
1459a4614: 4b8d1449 lea rdx, [r9 + r9*2]
1459a4618: f2410f100490 movsd xmm0, qword ptr [r8 + rdx*4]
1459a461e: 410f28d2 movaps xmm2, xmm10
1459a4622: 0f5fd1 maxps xmm2, xmm1
1459a4625: 0f28da movaps xmm3, xmm2
1459a4628: 0fc2da03 cmpunordps xmm3, xmm2
1459a462c: 410f28e2 movaps xmm4, xmm10
1459a4630: 0f54e3 andps xmm4, xmm3
1459a4633: 0f55da andnps xmm3, xmm2
1459a4636: 0f56dc orps xmm3, xmm4
1459a4639: 0f28e3 movaps xmm4, xmm3
1459a463c: 0f5fe0 maxps xmm4, xmm0
1459a463f: 0f28d4 movaps xmm2, xmm4
1459a4642: 0fc2d403 cmpunordps xmm2, xmm4
1459a4646: 0f54da andps xmm3, xmm2
1459a4649: 0f55d4 andnps xmm2, xmm4
1459a464c: 0f56d3 orps xmm2, xmm3
1459a464f: 0fc2d601 cmpltps xmm2, xmm6
1459a4653: 410f28da movaps xmm3, xmm10
1459a4657: 0f294d10 movaps xmmword ptr [rbp + 0x10], xmm1
1459a465b: 0f5dd9 minps xmm3, xmm1
1459a465e: 0f28e3 movaps xmm4, xmm3
1459a4661: 0fc2e303 cmpunordps xmm4, xmm3
1459a4665: 410f28ea movaps xmm5, xmm10
1459a4669: 0f54ec andps xmm5, xmm4
1459a466c: 0f55e3 andnps xmm4, xmm3
1459a466f: 0f56e5 orps xmm4, xmm5
1459a4672: 0f28dc movaps xmm3, xmm4
1459a4675: 0f5dd8 minps xmm3, xmm0
1459a4678: 0f28eb movaps xmm5, xmm3
1459a467b: 0fc2eb03 cmpunordps xmm5, xmm3
1459a467f: 0f54e5 andps xmm4, xmm5
1459a4682: 0f55eb andnps xmm5, xmm3
1459a4685: 0f56ec orps xmm5, xmm4
1459a4688: 0f285db0 movaps xmm3, xmmword ptr [rbp - 0x50]
1459a468c: 0fc2dd01 cmpltps xmm3, xmm5
1459a4690: 0f56da orps xmm3, xmm2
1459a4693: 660f70d350 pshufd xmm2, xmm3, 0x50
1459a4698: 66440f50c2 movmskpd r8d, xmm2
1459a469d: 4585c0 test r8d, r8d
1459a46a0: 0f850affffff jne 0x1459a45b0
1459a46a6: 4c8b4540 mov r8, qword ptr [rbp + 0x40]
1459a46aa: f3410f104c8808 movss xmm1, dword ptr [r8 + rcx*4 + 8]
1459a46b1: f3410f105c8008 movss xmm3, dword ptr [r8 + rax*4 + 8]
1459a46b8: f3410f107c9008 movss xmm7, dword ptr [r8 + rdx*4 + 8]
1459a46bf: 0f285510 movaps xmm2, xmmword ptr [rbp + 0x10]
1459a46c3: 410f5cd2 subps xmm2, xmm10
1459a46c7: f30f115d3c movss dword ptr [rbp + 0x3c], xmm3
1459a46cc: f30f5cd9 subss xmm3, xmm1
1459a46d0: 440f28c0 movaps xmm8, xmm0
1459a46d4: 450f5cc2 subps xmm8, xmm10
1459a46d8: f30f117d38 movss dword ptr [rbp + 0x38], xmm7
1459a46dd: f30f114d34 movss dword ptr [rbp + 0x34], xmm1
1459a46e2: f30f5cf9 subss xmm7, xmm1
1459a46e6: 0f28eb movaps xmm5, xmm3
1459a46e9: f3410f59e8 mulss xmm5, xmm8
1459a46ee: 0f28e2 movaps xmm4, xmm2
1459a46f1: f30f59e7 mulss xmm4, xmm7
1459a46f5: f30f5cec subss xmm5, xmm4
1459a46f9: f30f59ed mulss xmm5, xmm5
1459a46fd: 0f28e7 movaps xmm4, xmm7
1459a4700: 410fc6e0d4 shufps xmm4, xmm8, 0xd4
1459a4705: 410fc6e0f2 shufps xmm4, xmm8, 0xf2
1459a470a: 0f59e2 mulps xmm4, xmm2
1459a470d: 0f295dd0 movaps xmmword ptr [rbp - 0x30], xmm3
1459a4711: 0fc6dad4 shufps xmm3, xmm2, 0xd4
1459a4715: 0f2955c0 movaps xmmword ptr [rbp - 0x40], xmm2
1459a4719: 0fc6daf2 shufps xmm3, xmm2, 0xf2
1459a471d: 410f59d8 mulps xmm3, xmm8
1459a4721: 0f5ce3 subps xmm4, xmm3
1459a4724: 0f28dc movaps xmm3, xmm4
1459a4727: 0f59dc mulps xmm3, xmm4
1459a472a: f30f16cb movshdup xmm1, xmm3
1459a472e: f30f58cd addss xmm1, xmm5
1459a4732: f30f58cb addss xmm1, xmm3
1459a4736: 0f57ed xorps xmm5, xmm5
1459a4739: f30f51e9 sqrtss xmm5, xmm1
1459a473d: f30f100d2b1b5000 movss xmm1, dword ptr [rip + 0x501b2b]
1459a4745: 0f2ecd ucomiss xmm1, xmm5
1459a4748: 0f8762feffff ja 0x1459a45b0
1459a474e: 0f54255bf04000 andps xmm4, xmmword ptr [rip + 0x40f05b]
1459a4755: f30f5ee5 divss xmm4, xmm5
1459a4759: 0f2e25a0894400 ucomiss xmm4, dword ptr [rip + 0x4489a0]
1459a4760: 0f874afeffff ja 0x1459a45b0
1459a4766: 0f284dc0 movaps xmm1, xmmword ptr [rbp - 0x40]
1459a476a: 0f59c9 mulps xmm1, xmm1
1459a476d: f30f16d9 movshdup xmm3, xmm1
1459a4771: f30f58d9 addss xmm3, xmm1
1459a4775: 0f284dd0 movaps xmm1, xmmword ptr [rbp - 0x30]
1459a4779: f30f59c9 mulss xmm1, xmm1
1459a477d: f30f58cb addss xmm1, xmm3
1459a4781: f30f51c9 sqrtss xmm1, xmm1
1459a4785: 410f28d8 movaps xmm3, xmm8
1459a4789: 410f59d8 mulps xmm3, xmm8
1459a478d: f30f16e3 movshdup xmm4, xmm3
1459a4791: f30f58e3 addss xmm4, xmm3
1459a4795: 0f28df movaps xmm3, xmm7
1459a4798: f30f59df mulss xmm3, xmm7
1459a479c: f30f58dc addss xmm3, xmm4
1459a47a0: f30f51db sqrtss xmm3, xmm3
1459a47a4: 0f28e1 movaps xmm4, xmm1
1459a47a7: f30f5fe3 maxss xmm4, xmm3
1459a47ab: 0f28dc movaps xmm3, xmm4
1459a47ae: f30fc2dc03 cmpunordss xmm3, xmm4
1459a47b3: 0f28eb movaps xmm5, xmm3
1459a47b6: 0f55ec andnps xmm5, xmm4
1459a47b9: 0f54d9 andps xmm3, xmm1
1459a47bc: 0f56dd orps xmm3, xmm5
1459a47bf: f30f105538 movss xmm2, dword ptr [rbp + 0x38]
1459a47c4: f30f5c553c subss xmm2, dword ptr [rbp + 0x3c]
1459a47c9: 0f5c4510 subps xmm0, xmmword ptr [rbp + 0x10]
1459a47cd: 0f59c0 mulps xmm0, xmm0
1459a47d0: f30f16c8 movshdup xmm1, xmm0
1459a47d4: f30f58c8 addss xmm1, xmm0
1459a47d8: f30f59d2 mulss xmm2, xmm2
1459a47dc: f30f58d1 addss xmm2, xmm1
1459a47e0: 0f57c0 xorps xmm0, xmm0
1459a47e3: f30f51c2 sqrtss xmm0, xmm2
1459a47e7: 0f28cb movaps xmm1, xmm3
1459a47ea: f30f5fc8 maxss xmm1, xmm0
1459a47ee: 0f28c1 movaps xmm0, xmm1
1459a47f1: f30fc2c103 cmpunordss xmm0, xmm1
1459a47f6: 0f54d8 andps xmm3, xmm0
1459a47f9: 0f55c1 andnps xmm0, xmm1
1459a47fc: 0f56c3 orps xmm0, xmm3
1459a47ff: f30f5e0519184100 divss xmm0, dword ptr [rip + 0x411819]
1459a4807: e8ef092600 call 0x145c051fb
1459a480c: f3480f2cc0 cvttss2si rax, xmm0
1459a4811: 4889c1 mov rcx, rax
1459a4814: 48c1f93f sar rcx, 0x3f
1459a4818: 0f28c8 movaps xmm1, xmm0
1459a481b: f3410f5ccc subss xmm1, xmm12
1459a4820: f3480f2cd1 cvttss2si rdx, xmm1
1459a4825: 4821ca and rdx, rcx
1459a4828: 4809c2 or rdx, rax
1459a482b: 410f2ec5 ucomiss xmm0, xmm13
1459a482f: 490f42d7 cmovb rdx, r15
1459a4833: 410f2ec6 ucomiss xmm0, xmm14
1459a4837: 490f47d5 cmova rdx, r13
1459a483b: 4881fa90010000 cmp rdx, 0x190
1459a4842: 41b990010000 mov r9d, 0x190
1459a4848: 4c0f42ca cmovb r9, rdx
1459a484c: 4885d2 test rdx, rdx
1459a484f: b801000000 mov eax, 1
1459a4854: 4c0f44c8 cmove r9, rax
1459a4858: 0f57c0 xorps xmm0, xmm0
1459a485b: f3490f2ac1 cvtsi2ss xmm0, r9
1459a4860: 31d2 xor edx, edx
1459a4862: 4c894d10 mov qword ptr [rbp + 0x10], r9
1459a4866: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459a4870: 4531c0 xor r8d, r8d
1459a4873: 4929d1 sub r9, rdx
1459a4876: 0f97c1 seta cl
1459a4879: 4885d2 test rdx, rdx
1459a487c: 7812 js 0x1459a4890
1459a487e: 0f57c9 xorps xmm1, xmm1
1459a4881: f3480f2aca cvtsi2ss xmm1, rdx
1459a4886: eb24 jmp 0x1459a48ac
1459a4888: 0f1f840000000000 nop dword ptr [rax + rax]
1459a4890: 4989d2 mov r10, rdx
1459a4893: 49d1ea shr r10, 1
1459a4896: 4189d3 mov r11d, edx
1459a4899: 4183e301 and r11d, 1
1459a489d: 4d09d3 or r11, r10
1459a48a0: 0f57c9 xorps xmm1, xmm1
1459a48a3: f3490f2acb cvtsi2ss xmm1, r11
1459a48a8: f30f58c9 addss xmm1, xmm1
1459a48ac: 4188c8 mov r8b, cl
1459a48af: 4901d0 add r8, rdx
1459a48b2: f30f5ec8 divss xmm1, xmm0
1459a48b6: f30f12d1 movsldup xmm2, xmm1
1459a48ba: 0f5955c0 mulps xmm2, xmmword ptr [rbp - 0x40]
1459a48be: 410f58d2 addps xmm2, xmm10
1459a48c2: f30f594dd0 mulss xmm1, dword ptr [rbp - 0x30]
1459a48c7: f30f584d34 addss xmm1, dword ptr [rbp + 0x34]
1459a48cc: 4531db xor r11d, r11d
1459a48cf: 4531d2 xor r10d, r10d
1459a48d2: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459a48e0: 4d39cb cmp r11, r9
1459a48e3: 4983d200 adc r10, 0
1459a48e7: 4d85db test r11, r11
1459a48ea: 7814 js 0x1459a4900
1459a48ec: 0f57db xorps xmm3, xmm3
1459a48ef: f3490f2adb cvtsi2ss xmm3, r11
1459a48f4: eb25 jmp 0x1459a491b
1459a48f6: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459a4900: 4c89d9 mov rcx, r11
1459a4903: 48d1e9 shr rcx, 1
1459a4906: 4489df mov edi, r11d
1459a4909: 83e701 and edi, 1
1459a490c: 4809cf or rdi, rcx
1459a490f: 0f57db xorps xmm3, xmm3
1459a4912: f3480f2adf cvtsi2ss xmm3, rdi
1459a4917: f30f58db addss xmm3, xmm3
1459a491b: f30f5ed8 divss xmm3, xmm0
1459a491f: f30f12e3 movsldup xmm4, xmm3
1459a4923: 410f59e0 mulps xmm4, xmm8
1459a4927: 0f58e2 addps xmm4, xmm2
1459a492a: 0f5ce6 subps xmm4, xmm6
1459a492d: 0f28ec movaps xmm5, xmm4
1459a4930: 410fc2ef01 cmpltps xmm5, xmm15
1459a4935: 0f14ed unpcklps xmm5, xmm5
1459a4938: 660f50cd movmskpd ecx, xmm5
1459a493c: 85c9 test ecx, ecx
1459a493e: 0f85bc000000 jne 0x1459a4a00
1459a4944: 0f28ec movaps xmm5, xmm4
1459a4947: f3410f5cec subss xmm5, xmm12
1459a494c: f3480f2ccd cvttss2si rcx, xmm5
1459a4951: f3480f2cdc cvttss2si rbx, xmm4
1459a4956: 4889df mov rdi, rbx
1459a4959: 48c1ff3f sar rdi, 0x3f
1459a495d: 4821cf and rdi, rcx
1459a4960: 4809df or rdi, rbx
1459a4963: 410f2ee5 ucomiss xmm4, xmm13
1459a4967: 490f42ff cmovb rdi, r15
1459a496b: 410f2ee6 ucomiss xmm4, xmm14
1459a496f: 490f47fd cmova rdi, r13
1459a4973: f30f16e4 movshdup xmm4, xmm4
1459a4977: 0f28ec movaps xmm5, xmm4
1459a497a: f3410f5cec subss xmm5, xmm12
1459a497f: f3480f2cdd cvttss2si rbx, xmm5
1459a4984: f3480f2cc4 cvttss2si rax, xmm4
1459a4989: 4889c1 mov rcx, rax
1459a498c: 48c1f93f sar rcx, 0x3f
1459a4990: 4821d9 and rcx, rbx
1459a4993: 4809c1 or rcx, rax
1459a4996: 410f2ee5 ucomiss xmm4, xmm13
1459a499a: 490f42cf cmovb rcx, r15
1459a499e: 410f2ee6 ucomiss xmm4, xmm14
1459a49a2: 490f47cd cmova rcx, r13
1459a49a6: 4c39e7 cmp rdi, r12
1459a49a9: 0f93c0 setae al
1459a49ac: 4c39e1 cmp rcx, r12
1459a49af: 0f93c3 setae bl
1459a49b2: 08c3 or bl, al
1459a49b4: 754a jne 0x1459a4a00
1459a49b6: 490fafcc imul rcx, r12
1459a49ba: 4801f9 add rcx, rdi
1459a49bd: 4839f1 cmp rcx, rsi
1459a49c0: 736d jae 0x1459a4a2f
1459a49c2: f3410f10248e movss xmm4, dword ptr [r14 + rcx*4]
1459a49c8: 0f2ee4 ucomiss xmm4, xmm4
1459a49cb: 7a33 jp 0x1459a4a00
1459a49cd: f30f59df mulss xmm3, xmm7
1459a49d1: f30f58d9 addss xmm3, xmm1
1459a49d5: 0f28ec movaps xmm5, xmm4
1459a49d8: f3410f58eb addss xmm5, xmm11
1459a49dd: 0f2edd ucomiss xmm3, xmm5
1459a49e0: f3410f58e1 addss xmm4, xmm9
1459a49e5: 7619 jbe 0x1459a4a00
1459a49e7: 0f2ee3 ucomiss xmm4, xmm3
1459a49ea: 7614 jbe 0x1459a4a00
1459a49ec: 483b4d20 cmp rcx, qword ptr [rbp + 0x20]
1459a49f0: 734f jae 0x1459a4a41
1459a49f2: 488b45f8 mov rax, qword ptr [rbp - 8]
1459a49f6: c6040801 mov byte ptr [rax + rcx], 1
1459a49fa: 660f1f440000 nop word ptr [rax + rax]
1459a4a00: 4d39cb cmp r11, r9
1459a4a03: 730c jae 0x1459a4a11
1459a4a05: 4d89d3 mov r11, r10
1459a4a08: 4d39ca cmp r10, r9
1459a4a0b: 0f86cffeffff jbe 0x1459a48e0
1459a4a11: 4c8b4d10 mov r9, qword ptr [rbp + 0x10]
1459a4a15: 4939d1 cmp r9, rdx
1459a4a18: 0f8692fbffff jbe 0x1459a45b0
1459a4a1e: 4c89c2 mov rdx, r8
1459a4a21: 4d39c8 cmp r8, r9
1459a4a24: 0f8646feffff jbe 0x1459a4870
1459a4a2a: e981fbffff jmp 0x1459a45b0
1459a4a2f: 4c8d052ae88901 lea r8, [rip + 0x189e82a]
1459a4a36: 4889f2 mov rdx, rsi
1459a4a39: e805fc3f00 call 0x145da4643
1459a4a3e: 90 nop
1459a4a3f: eb48 jmp 0x1459a4a89
1459a4a41: 4c8d0530e88901 lea r8, [rip + 0x189e830]
1459a4a48: 488b5520 mov rdx, qword ptr [rbp + 0x20]
1459a4a4c: e8f2fb3f00 call 0x145da4643
1459a4a51: 90 nop
1459a4a52: eb35 jmp 0x1459a4a89
1459a4a54: 4c8d05ede78901 lea r8, [rip + 0x189e7ed]
1459a4a5b: 4c89c9 mov rcx, r9
1459a4a5e: 488b5528 mov rdx, qword ptr [rbp + 0x28]
1459a4a62: e8dcfb3f00 call 0x145da4643
1459a4a67: 90 nop
1459a4a68: eb1f jmp 0x1459a4a89
1459a4a6a: 4c8d05bfe78901 lea r8, [rip + 0x189e7bf]
1459a4a71: 4889c1 mov rcx, rax
1459a4a74: e8cafb3f00 call 0x145da4643
1459a4a79: 90 nop
1459a4a7a: eb0d jmp 0x1459a4a89
1459a4a7c: 4c8d0595e78901 lea r8, [rip + 0x189e795]
1459a4a83: e8bbfb3f00 call 0x145da4643
1459a4a88: 90 nop
1459a4a89: 0f0b ud2
