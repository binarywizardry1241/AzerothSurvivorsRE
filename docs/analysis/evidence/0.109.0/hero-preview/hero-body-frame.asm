140bcb130: 56 push rsi
140bcb131: 4881ec20010000 sub rsp, 0x120
140bcb138: 440f29bc2410010000 movaps xmmword ptr [rsp + 0x110], xmm15
140bcb141: 440f29b42400010000 movaps xmmword ptr [rsp + 0x100], xmm14
140bcb14a: 440f29ac24f0000000 movaps xmmword ptr [rsp + 0xf0], xmm13
140bcb153: 440f29a424e0000000 movaps xmmword ptr [rsp + 0xe0], xmm12
140bcb15c: 440f299c24d0000000 movaps xmmword ptr [rsp + 0xd0], xmm11
140bcb165: 440f299424c0000000 movaps xmmword ptr [rsp + 0xc0], xmm10
140bcb16e: 440f298c24b0000000 movaps xmmword ptr [rsp + 0xb0], xmm9
140bcb177: 440f298424a0000000 movaps xmmword ptr [rsp + 0xa0], xmm8
140bcb180: 0f29bc2490000000 movaps xmmword ptr [rsp + 0x90], xmm7
140bcb188: 0f29b42480000000 movaps xmmword ptr [rsp + 0x80], xmm6
140bcb190: f30f1154242c movss dword ptr [rsp + 0x2c], xmm2
140bcb196: 4889ce mov rsi, rcx
140bcb199: 450f57db xorps xmm11, xmm11
140bcb19d: f6422c01 test byte ptr [rdx + 0x2c], 1
140bcb1a1: 743a je 0x140bcb1dd
140bcb1a3: f30f104254 movss xmm0, dword ptr [rdx + 0x54]
140bcb1a8: f30f11442428 movss dword ptr [rsp + 0x28], xmm0
140bcb1ae: f2440f10524c movsd xmm10, qword ptr [rdx + 0x4c]
140bcb1b4: f3440f104248 movss xmm8, dword ptr [rdx + 0x48]
140bcb1ba: 488d4a40 lea rcx, [rdx + 0x40]
140bcb1be: 488d423c lea rax, [rdx + 0x3c]
140bcb1c2: f3440f107238 movss xmm14, dword ptr [rdx + 0x38]
140bcb1c8: f2440f106a30 movsd xmm13, qword ptr [rdx + 0x30]
140bcb1ce: 4883c244 add rdx, 0x44
140bcb1d2: f3440f5905c9201d05 mulss xmm8, dword ptr [rip + 0x51d20c9]
140bcb1db: eb39 jmp 0x140bcb216
140bcb1dd: 488d4268 lea rax, [rdx + 0x68]
140bcb1e1: 488d4a6c lea rcx, [rdx + 0x6c]
140bcb1e5: 4883c270 add rdx, 0x70
140bcb1e9: f2440f102d7e293705 movsd xmm13, qword ptr [rip + 0x537297e]
140bcb1f2: f2440f101585293705 movsd xmm10, qword ptr [rip + 0x5372985]
140bcb1fb: f30f10058d293705 movss xmm0, dword ptr [rip + 0x537298d]
140bcb203: f30f11442428 movss dword ptr [rsp + 0x28], xmm0
140bcb209: f3440f103582293705 movss xmm14, dword ptr [rip + 0x5372982]
140bcb212: 450f57c0 xorps xmm8, xmm8
140bcb216: f3440f100a movss xmm9, dword ptr [rdx]
140bcb21b: 66440f6e39 movd xmm15, dword ptr [rcx]
140bcb220: 660f6e30 movd xmm6, dword ptr [rax]
140bcb224: f3450f5cce subss xmm9, xmm14
140bcb229: 450f28e1 movaps xmm12, xmm9
140bcb22d: f3450f59e1 mulss xmm12, xmm9
140bcb232: 410f28c0 movaps xmm0, xmm8
140bcb236: e8dcee0205 call 0x145bfa117
140bcb23b: 0f28f8 movaps xmm7, xmm0
140bcb23e: 410f28c0 movaps xmm0, xmm8
140bcb242: e8d6ee0205 call 0x145bfa11d
140bcb247: 440f136c2460 movlps qword ptr [rsp + 0x60], xmm13
140bcb24d: f3440f11742468 movss dword ptr [rsp + 0x68], xmm14
140bcb254: 48b80000803f0000803f movabs rax, 0x3f8000003f800000
140bcb25e: 488944246c mov qword ptr [rsp + 0x6c], rax
140bcb263: c74424740000803f mov dword ptr [rsp + 0x74], 0x3f800000
140bcb26b: 66410f62f7 punpckldq xmm6, xmm15
140bcb270: f30f7ece movq xmm1, xmm6
140bcb274: 410f5ccd subps xmm1, xmm13
140bcb278: f30f16d1 movshdup xmm2, xmm1
140bcb27c: 0f28d9 movaps xmm3, xmm1
140bcb27f: 0f59d9 mulps xmm3, xmm1
140bcb282: f30f16e3 movshdup xmm4, xmm3
140bcb286: f30f58e3 addss xmm4, xmm3
140bcb28a: f3410f58e4 addss xmm4, xmm12
140bcb28f: f30f51e4 sqrtss xmm4, xmm4
140bcb293: f30f101d05201d05 movss xmm3, dword ptr [rip + 0x51d2005]
140bcb29b: f30f5edc divss xmm3, xmm4
140bcb29f: 660f7ed8 movd eax, xmm3
140bcb2a3: 85c0 test eax, eax
140bcb2a5: 0f99c1 setns cl
140bcb2a8: 89c2 mov edx, eax
140bcb2aa: 81e2ffffff7f and edx, 0x7fffffff
140bcb2b0: 81c2000080ff add edx, 0xff800000
140bcb2b6: 81fa0000007f cmp edx, 0x7f000000
140bcb2bc: 0f92c2 setb dl
140bcb2bf: 20ca and dl, cl
140bcb2c1: ffc8 dec eax
140bcb2c3: 3dffff7f00 cmp eax, 0x7fffff
140bcb2c8: 0f92c0 setb al
140bcb2cb: 08d0 or al, dl
140bcb2cd: 7409 je 0x140bcb2d8
140bcb2cf: 440f28d9 movaps xmm11, xmm1
140bcb2d3: f3440f59db mulss xmm11, xmm3
140bcb2d8: f3440f59df mulss xmm11, xmm7
140bcb2dd: 410f28e1 movaps xmm4, xmm9
140bcb2e1: f30f59e3 mulss xmm4, xmm3
140bcb2e5: f30f59d3 mulss xmm2, xmm3
140bcb2e9: 0f14d4 unpcklps xmm2, xmm4
140bcb2ec: 0fb6c0 movzx eax, al
140bcb2ef: 660f6ed8 movd xmm3, eax
140bcb2f3: 660f70db00 pshufd xmm3, xmm3, 0
140bcb2f8: 660f72f31f pslld xmm3, 0x1f
140bcb2fd: 660f72e31f psrad xmm3, 0x1f
140bcb302: f30f7ed2 movq xmm2, xmm2
140bcb306: 660fdbd3 pand xmm2, xmm3
140bcb30a: f30f12df movsldup xmm3, xmm7
140bcb30e: 0f59da mulps xmm3, xmm2
140bcb311: 410f28d3 movaps xmm2, xmm11
140bcb315: 0f16d3 movlhps xmm2, xmm3
140bcb318: 0f28e2 movaps xmm4, xmm2
140bcb31b: 0fc6e3d8 shufps xmm4, xmm3, 0xd8
140bcb31f: 0fc6c3d4 shufps xmm0, xmm3, 0xd4
140bcb323: 0fc6d028 shufps xmm2, xmm0, 0x28
140bcb327: 0f28ea movaps xmm5, xmm2
140bcb32a: 0f59ea mulps xmm5, xmm2
140bcb32d: 0f28c5 movaps xmm0, xmm5
140bcb330: 0fc6c5aa shufps xmm0, xmm5, 0xaa
140bcb334: f30f16f5 movshdup xmm6, xmm5
140bcb338: f30f58f5 addss xmm6, xmm5
140bcb33c: 0fc6f600 shufps xmm6, xmm6, 0
140bcb340: 0f58f0 addps xmm6, xmm0
140bcb343: 0fc6edff shufps xmm5, xmm5, 0xff
140bcb347: 0f5cee subps xmm5, xmm6
140bcb34a: f20f1005ee201d05 movsd xmm0, qword ptr [rip + 0x51d20ee]
140bcb352: 0f59e8 mulps xmm5, xmm0
140bcb355: 0f59c4 mulps xmm0, xmm4
140bcb358: f30f16f0 movshdup xmm6, xmm0
140bcb35c: f30f58f0 addss xmm6, xmm0
140bcb360: 0f12c0 movhlps xmm0, xmm0
140bcb363: f30f58c6 addss xmm0, xmm6
140bcb367: f30f58c0 addss xmm0, xmm0
140bcb36b: 0fc6c000 shufps xmm0, xmm0, 0
140bcb36f: 0f59c4 mulps xmm0, xmm4
140bcb372: 0f58c5 addps xmm0, xmm5
140bcb375: 440fc6db30 shufps xmm11, xmm3, 0x30
140bcb37a: 410fc6db84 shufps xmm3, xmm11, 0x84
140bcb37f: 0f591dda3d2f05 mulps xmm3, xmmword ptr [rip + 0x52f3dda]
140bcb386: 0fc6e4d2 shufps xmm4, xmm4, 0xd2
140bcb38a: f30f102d0e1f1d05 movss xmm5, dword ptr [rip + 0x51d1f0e]
140bcb392: 0f59ec mulps xmm5, xmm4
140bcb395: 0f5cdd subps xmm3, xmm5
140bcb398: 0f58d2 addps xmm2, xmm2
140bcb39b: 0fc6d2ff shufps xmm2, xmm2, 0xff
140bcb39f: 0f59d3 mulps xmm2, xmm3
140bcb3a2: 0f58d0 addps xmm2, xmm0
140bcb3a5: 0f13542430 movlps qword ptr [rsp + 0x30], xmm2
140bcb3aa: 0f12d2 movhlps xmm2, xmm2
140bcb3ad: f30f11542438 movss dword ptr [rsp + 0x38], xmm2
140bcb3b3: 0f134c2440 movlps qword ptr [rsp + 0x40], xmm1
140bcb3b8: f3440f114c2448 movss dword ptr [rsp + 0x48], xmm9
140bcb3bf: 488d4c2450 lea rcx, [rsp + 0x50]
140bcb3c4: 488d542440 lea rdx, [rsp + 0x40]
140bcb3c9: 4c8d442430 lea r8, [rsp + 0x30]
140bcb3ce: e89dbac1ff call 0x1407e6e70
140bcb3d3: e8286e43ff call 0x140002200
140bcb3d8: b910000000 mov ecx, 0x10
140bcb3dd: ba04000000 mov edx, 4
140bcb3e2: e8d96d43ff call 0x1400021c0
140bcb3e7: 4885c0 test rax, rax
140bcb3ea: 0f84ae000000 je 0x140bcb49e
140bcb3f0: 440f1310 movlps qword ptr [rax], xmm10
140bcb3f4: f30f10442428 movss xmm0, dword ptr [rsp + 0x28]
140bcb3fa: f30f114008 movss dword ptr [rax + 8], xmm0
140bcb3ff: f30f1044242c movss xmm0, dword ptr [rsp + 0x2c]
140bcb405: f30f11400c movss dword ptr [rax + 0xc], xmm0
140bcb40a: 0f28442450 movaps xmm0, xmmword ptr [rsp + 0x50]
140bcb40f: 0f284c2460 movaps xmm1, xmmword ptr [rsp + 0x60]
140bcb414: 0f28542470 movaps xmm2, xmmword ptr [rsp + 0x70]
140bcb419: 0f295620 movaps xmmword ptr [rsi + 0x20], xmm2
140bcb41d: 0f294e10 movaps xmmword ptr [rsi + 0x10], xmm1
140bcb421: 0f2906 movaps xmmword ptr [rsi], xmm0
140bcb424: c7463008000000 mov dword ptr [rsi + 0x30], 8
140bcb42b: 48894638 mov qword ptr [rsi + 0x38], rax
140bcb42f: 488d05bad13705 lea rax, [rip + 0x537d1ba]
140bcb436: 48894640 mov qword ptr [rsi + 0x40], rax
140bcb43a: 4889f0 mov rax, rsi
140bcb43d: 0f28b42480000000 movaps xmm6, xmmword ptr [rsp + 0x80]
140bcb445: 0f28bc2490000000 movaps xmm7, xmmword ptr [rsp + 0x90]
140bcb44d: 440f288424a0000000 movaps xmm8, xmmword ptr [rsp + 0xa0]
140bcb456: 440f288c24b0000000 movaps xmm9, xmmword ptr [rsp + 0xb0]
140bcb45f: 440f289424c0000000 movaps xmm10, xmmword ptr [rsp + 0xc0]
140bcb468: 440f289c24d0000000 movaps xmm11, xmmword ptr [rsp + 0xd0]
140bcb471: 440f28a424e0000000 movaps xmm12, xmmword ptr [rsp + 0xe0]
140bcb47a: 440f28ac24f0000000 movaps xmm13, xmmword ptr [rsp + 0xf0]
140bcb483: 440f28b42400010000 movaps xmm14, xmmword ptr [rsp + 0x100]
140bcb48c: 440f28bc2410010000 movaps xmm15, xmmword ptr [rsp + 0x110]
140bcb495: 4881c420010000 add rsp, 0x120
140bcb49c: 5e pop rsi
140bcb49d: c3 ret
140bcb49e: b904000000 mov ecx, 4
140bcb4a3: ba10000000 mov edx, 0x10
140bcb4a8: e8f4dd1c05 call 0x145d992a1
140bcb4ad: 0f0b ud2
