0x145c527be: lea r13, [r15 + 0x30]
0x145c527c2: cmp byte ptr [r15 + 0x7d], 0
0x145c527c7: jne 0x145c53994
0x145c527cd: movss xmm0, dword ptr [rbp + 0x21c]
0x145c527d5: ucomiss xmm0, dword ptr [r15 + 0x54]
0x145c527da: jb 0x145c53994
0x145c527e0: lea rdi, [r15 + 0x40]
0x145c527e4: movsd xmm15, qword ptr [r15 + 0x40]
0x145c527ea: movss xmm13, dword ptr [r15 + 0x4c]
0x145c527f0: mov esi, dword ptr [r15 + 0x30]
0x145c527f4: movss xmm8, dword ptr [r15 + 0x34]
0x145c527fa: movss xmm0, dword ptr [r15 + 0x38]
0x145c52800: movss dword ptr [rbp + 0x268], xmm0
0x145c52808: subps xmm12, xmm15
0x145c5280c: movshdup xmm14, xmm12
0x145c52811: movaps xmm0, xmm12
0x145c52815: movaps xmm1, xmm14
0x145c52819: call 0x14606177b
0x145c5281e: lea rcx, [rip + 0x178ef97]
0x145c52825: movsxd rax, dword ptr [rcx + rsi*4]
0x145c52829: add rax, rcx
0x145c5282c: jmp rax
0x145c5282e: ucomiss xmm8, xmm0
0x145c52832: jb 0x145c52ab3
0x145c52838: movaps xmm0, xmmword ptr [rbp + 0x200]
0x145c5283f: subps xmm0, xmm15
0x145c52843: movshdup xmm1, xmm0
0x145c52847: call 0x14606177b
0x145c5284c: ucomiss xmm8, xmm0
0x145c52850: setae al
0x145c52853: mov ecx, dword ptr [r15 + 0x10]
0x145c52857: lea rdx, [rip + 0x178ef6e]
0x145c5285e: movsxd rcx, dword ptr [rdx + rcx*4]
0x145c52862: add rcx, rdx
0x145c52865: jmp rcx
0x145c52867: movss dword ptr [rbp + 0x258], xmm8
0x145c52870: movaps xmm0, xmm13
0x145c52874: call 0x146061769
0x145c52879: movaps xmm14, xmm0
0x145c5287d: movaps xmm0, xmm13
0x145c52881: call 0x146061751
0x145c52886: movaps xmm2, xmm14
0x145c5288a: unpcklps xmm2, xmm0
0x145c5288d: mulps xmm2, xmm12
0x145c52891: movshdup xmm1, xmm2
0x145c52895: addss xmm1, xmm2
0x145c52899: xor eax, eax
0x145c5289b: xorps xmm2, xmm2
0x145c5289e: ucomiss xmm1, xmm2
0x145c528a1: jb 0x145c52ab5
0x145c528a7: movss xmm2, dword ptr [rbp + 0x258]
0x145c528af: ucomiss xmm2, xmm1
0x145c528b2: jb 0x145c52ab5
0x145c528b8: movaps xmm13, xmm0
0x145c528bc: unpcklps xmm13, xmm14
0x145c528c0: mulps xmm12, xmm13
0x145c528c4: movshdup xmm1, xmm12
0x145c528c9: subss xmm1, xmm12
0x145c528ce: andps xmm1, xmm6
0x145c528d1: movss xmm2, dword ptr [rbp + 0x268]
0x145c528d9: mulss xmm2, xmm7
0x145c528dd: ucomiss xmm2, xmm1
0x145c528e0: jb 0x145c52ab3
0x145c528e6: movss dword ptr [rbp + 0x268], xmm2
0x145c528ee: movaps xmm12, xmmword ptr [rbp + 0x200]
0x145c528f6: subps xmm12, xmm15
0x145c528fa: movshdup xmm15, xmm12
0x145c528ff: movaps xmm8, xmm0
0x145c52903: movaps xmm0, xmm12
0x145c52907: movaps xmm1, xmm15
0x145c5290b: call 0x14606177b
0x145c52910: movaps xmm0, xmm8
0x145c52914: mulss xmm14, xmm12
0x145c52919: mulss xmm0, xmm15
0x145c5291e: addss xmm0, xmm14
0x145c52923: xor eax, eax
0x145c52925: xorps xmm1, xmm1
0x145c52928: ucomiss xmm0, xmm1
0x145c5292b: jb 0x145c52ab5
0x145c52931: movss xmm1, dword ptr [rbp + 0x258]
0x145c52939: ucomiss xmm1, xmm0
0x145c5293c: movss xmm1, dword ptr [rbp + 0x268]
0x145c52944: jb 0x145c52ab5
0x145c5294a: mulps xmm12, xmm13
0x145c5294e: movshdup xmm0, xmm12
0x145c52953: subss xmm0, xmm12
0x145c52958: andps xmm0, xmm6
0x145c5295b: ucomiss xmm1, xmm0
0x145c5295e: setae al
0x145c52961: mov ecx, dword ptr [r15 + 0x10]
0x145c52965: lea rdx, [rip + 0x178ee60]
0x145c5296c: movsxd rcx, dword ptr [rdx + rcx*4]
0x145c52970: add rcx, rdx
0x145c52973: jmp rcx
0x145c52975: movss dword ptr [rbp + 0x258], xmm8
0x145c5297e: ucomiss xmm0, xmm8
0x145c52982: ja 0x145c52ab3
0x145c52988: ucomiss xmm7, xmm0
0x145c5298b: ja 0x145c529ec
0x145c5298d: movaps xmm0, xmm14
0x145c52991: movaps xmm1, xmm12
0x145c52995: call 0x146061763
0x145c5299a: subss xmm0, xmm13
0x145c5299f: addss xmm0, dword ptr [rip + 0x5e0755]
0x145c529a7: movaps xmm1, xmm9
0x145c529ab: call 0x14606178d
0x145c529b0: movaps xmm1, xmm0
0x145c529b3: addss xmm1, xmm9
0x145c529b8: movaps xmm2, xmm0
0x145c529bb: xorps xmm3, xmm3
0x145c529be: cmpltss xmm2, xmm3
0x145c529c3: andps xmm1, xmm2
0x145c529c6: andnps xmm2, xmm0
0x145c529c9: orps xmm2, xmm1
0x145c529cc: addss xmm2, dword ptr [rip + 0x7066c4]
0x145c529d4: andps xmm2, xmm6
0x145c529d7: movss xmm0, dword ptr [rbp + 0x268]
0x145c529df: mulss xmm0, xmm7
0x145c529e3: ucomiss xmm0, xmm2
0x145c529e6: jb 0x145c52ab3
0x145c529ec: movaps xmm12, xmmword ptr [rbp + 0x200]
0x145c529f4: subps xmm12, xmm15
0x145c529f8: movshdup xmm14, xmm12
0x145c529fd: movaps xmm0, xmm12
0x145c52a01: movaps xmm1, xmm14
0x145c52a05: call 0x14606177b
0x145c52a0a: ucomiss xmm0, dword ptr [rbp + 0x258]
0x145c52a11: ja 0x145c52ab3
0x145c52a17: mov al, 1
0x145c52a19: ucomiss xmm7, xmm0
0x145c52a1c: ja 0x145c52ab5
0x145c52a22: movaps xmm0, xmm14
0x145c52a26: movaps xmm1, xmm12
0x145c52a2a: call 0x146061763
0x145c52a2f: subss xmm0, xmm13
0x145c52a34: addss xmm0, dword ptr [rip + 0x5e06c0]
0x145c52a3c: movaps xmm1, xmm9
0x145c52a40: call 0x14606178d
0x145c52a45: movaps xmm1, xmm0
0x145c52a48: addss xmm1, xmm9
0x145c52a4d: movaps xmm2, xmm0
0x145c52a50: xorps xmm3, xmm3
0x145c52a53: cmpltss xmm2, xmm3
0x145c52a58: andps xmm1, xmm2
0x145c52a5b: andnps xmm2, xmm0
0x145c52a5e: orps xmm2, xmm1
0x145c52a61: addss xmm2, dword ptr [rip + 0x70662f]
0x145c52a69: andps xmm2, xmm6
0x145c52a6c: movss xmm0, dword ptr [rbp + 0x268]
0x145c52a74: mulss xmm0, xmm7
0x145c52a78: ucomiss xmm0, xmm2
0x145c52a7b: setae al
0x145c52a7e: jmp 0x145c52ab5
0x145c52a80: xor eax, eax
0x145c52a82: ucomiss xmm0, xmm8
0x145c52a86: jb 0x145c52ab5
0x145c52a88: movss xmm1, dword ptr [rbp + 0x268]
0x145c52a90: ucomiss xmm1, xmm0
0x145c52a93: jb 0x145c52ab5
0x145c52a95: movaps xmm0, xmmword ptr [rbp + 0x200]
0x145c52a9c: subps xmm0, xmm15
0x145c52aa0: movshdup xmm1, xmm0
0x145c52aa4: call 0x14606177b
0x145c52aa9: ucomiss xmm0, xmm8
0x145c52aad: jae 0x145c52b4f
0x145c52ab3: xor eax, eax
0x145c52ab5: mov ecx, dword ptr [r15 + 0x10]
0x145c52ab9: lea rdx, [rip + 0x178ed0c]
0x145c52ac0: movsxd rcx, dword ptr [rdx + rcx*4]
0x145c52ac4: add rcx, rdx
0x145c52ac7: jmp rcx
0x145c52ac9: test al, al
0x145c52acb: je 0x145c52b3a
