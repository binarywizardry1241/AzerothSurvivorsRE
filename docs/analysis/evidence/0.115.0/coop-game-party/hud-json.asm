; Current0.115.0 SHA256 0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c
; Selected 0x14590f169..0x14590f19f
0x14590f169: mov rsi, qword ptr [rdi + 0x340]
0x14590f170: imul rcx, qword ptr [rdi + 0x348], 0x58
0x14590f178: add rcx, rsi
0x14590f17b: mov qword ptr [rbp + 0x188], rcx
0x14590f182: movss xmm7, dword ptr [rdi + 0x498]
0x14590f18a: mov qword ptr [rbp + 0x1e8], rdi
0x14590f191: lea rcx, [rdi + 0x490]
0x14590f198: mov qword ptr [rbp + 0x48], rcx
0x14590f19c: mov r9b, 1
; Selected 0x14590f268..0x14590f496
0x14590f268: mov rax, qword ptr [rsi]
0x14590f26b: movups xmm0, xmmword ptr [rax]
0x14590f26e: mov byte ptr [rbp + 0x23f], 1
0x14590f275: movups xmmword ptr [rsp + 0x20], xmm0
0x14590f27a: mov r9d, 3
0x14590f280: mov rcx, rbx
0x14590f283: mov rdx, r14
0x14590f286: lea r8, [rip + 0x1a21241] ; b'keyrankcdcdMaxslotamuletraritytexthudphasetimelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdama'
0x14590f28d: call 0x145858350
0x14590f292: nop
0x14590f293: mov rax, qword ptr [rsi]
0x14590f296: mov eax, dword ptr [rax + 0x40]
0x14590f299: mov byte ptr [rbp + 0x23f], 1
0x14590f2a0: mov dword ptr [rsp + 0x20], eax
0x14590f2a4: mov r9d, 5
0x14590f2aa: mov rcx, r14
0x14590f2ad: mov rdx, rbx
0x14590f2b0: lea r8, [rip + 0x1a20b69] ; b'spellcrates\\wenilla-rogue\\src\\game\\auras.rs'
0x14590f2b7: call 0x14584f0c0
0x14590f2bc: nop
0x14590f2bd: mov rdi, qword ptr [rsi]
0x14590f2c0: mov qword ptr [rbp + 0x68], rdi
0x14590f2c4: lea rax, [rip - 0x590d20b] ; b'I\x89\xd0H\x8b\x01H\x8bQ\x08H\x89\xc1\xe9n\x81\xcf\x05\xcc\xcc\xcc\xcc\xcc\xcc\xcc\xcc\xcc\xcc\xcc\xcc\xcc\xccI\x89\xd0H\x8bA\x08H\x8bQ\x10H\x89\xc1\xe9M\x81\xcf\x05\xcc\xcc\xcc\xcc\xcc\xcc\xcc\xcc\xcc\xcc\xcc\xcc\xccAVVWSH\x83\xec8L\x89\xc3H\x89\xd6H\x89\xcfL\x8dt$ \xeb\x0c\x0f\x1f\x80'
0x14590f2cb: mov qword ptr [rbp + 0x70], rax
0x14590f2cf: mov byte ptr [rbp + 0x1d7], 1
0x14590f2d6: mov rcx, rbx
0x14590f2d9: lea rdx, [rip + 0x13a5ba0] ; b'\x08ability.\xc0\x05.name'
0x14590f2e0: lea r8, [rbp + 0x68]
0x14590f2e4: call 0x145ce7350
0x14590f2e9: nop
0x14590f2ea: mov rcx, qword ptr [rbp + 0x218]
0x14590f2f1: mov rdx, qword ptr [rbp + 0x220]
0x14590f2f8: mov r12, qword ptr [rdi + 0x10]
0x14590f2fc: mov r15, qword ptr [rdi + 0x18]
0x14590f300: mov qword ptr [rbp + 0x1a0], rcx
0x14590f307: call 0x1458dff90
0x14590f30c: nop
0x14590f30d: mov rdi, rax
0x14590f310: mov r13, rdx
0x14590f313: mov rdx, qword ptr [rbp + 0x210]
0x14590f31a: test rdx, rdx
0x14590f31d: je 0x14590f331
0x14590f31f: mov r8d, 1
0x14590f325: mov rcx, qword ptr [rbp + 0x1a0]
0x14590f32c: call 0x1400021d0
0x14590f331: test rdi, rdi
0x14590f334: cmovne r12, rdi
0x14590f338: cmove r13, r15
0x14590f33c: mov byte ptr [rbp + 0x1d7], 0
0x14590f343: mov qword ptr [rsp + 0x28], r13
0x14590f348: mov qword ptr [rsp + 0x20], r12
0x14590f34d: mov r9d, 4
0x14590f353: mov rcx, rbx
0x14590f356: mov rdx, r14
0x14590f359: lea r8, [rip + 0x1a20b89] ; b'nameicondmgcolortoprevived\x0csink-test t=\xc5 '
0x14590f360: call 0x145858350
0x14590f365: nop
0x14590f366: mov rax, qword ptr [rsi]
0x14590f369: movups xmm0, xmmword ptr [rax + 0x20]
0x14590f36d: mov byte ptr [rbp + 0x23f], 1
0x14590f374: movups xmmword ptr [rsp + 0x20], xmm0
0x14590f379: mov r9d, 4
0x14590f37f: mov rcx, r14
0x14590f382: mov rdx, rbx
0x14590f385: lea r8, [rip + 0x1a20b61] ; b'icondmgcolortoprevived\x0csink-test t=\xc5 '
0x14590f38c: call 0x145858350
0x14590f391: nop
0x14590f392: mov eax, dword ptr [rsi + 8]
0x14590f395: mov byte ptr [rbp + 0x23f], 1
0x14590f39c: mov dword ptr [rsp + 0x20], eax
0x14590f3a0: mov r9d, 4
0x14590f3a6: mov rcx, rbx
0x14590f3a9: mov rdx, r14
0x14590f3ac: lea r8, [rip + 0x1a2111e] ; b'rankcdcdMaxslotamuletraritytexthudphasetimelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagec'
0x14590f3b3: call 0x14584f0c0
0x14590f3b8: nop
0x14590f3b9: movss xmm0, dword ptr [rsi + 0xc]
0x14590f3be: maxss xmm0, xmm6
0x14590f3c2: mov byte ptr [rbp + 0x23f], 1
0x14590f3c9: movss dword ptr [rsp + 0x20], xmm0
0x14590f3cf: mov r9d, 2
0x14590f3d5: mov rcx, r14
0x14590f3d8: mov rdx, rbx
0x14590f3db: lea r8, [rip + 0x1a210f3] ; b'cdcdMaxslotamuletraritytexthudphasetimelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecoold'
0x14590f3e2: call 0x14584edc0
0x14590f3e7: nop
0x14590f3e8: mov rax, qword ptr [rsi]
0x14590f3eb: cmp byte ptr [rax + 0x75], 0xb
0x14590f3ef: jne 0x14590f410
0x14590f3f1: mov rcx, rsi
0x14590f3f4: mov rdx, qword ptr [rbp + 0x48]
0x14590f3f8: call 0x14580a670
0x14590f3fd: test al, 1
0x14590f3ff: jne 0x14590f470
0x14590f401: xorps xmm0, xmm0
0x14590f404: jmp 0x14590f470
0x14590f406: nop word ptr cs:[rax + rax]
0x14590f410: cmp qword ptr [rax + 8], 8
0x14590f415: movaps xmm0, xmm8
0x14590f419: jne 0x14590f440
0x14590f41b: mov rcx, qword ptr [rax]
0x14590f41e: movaps xmm0, xmm8
0x14590f422: movabs rdx, 0x657269666c6c6568
0x14590f42c: cmp qword ptr [rcx], rdx
0x14590f42f: jne 0x14590f440
0x14590f431: movaps xmm0, xmm9
0x14590f435: nop word ptr cs:[rax + rax]
0x14590f440: movss xmm1, dword ptr [rax + 0x48]
0x14590f445: mulss xmm1, xmm10
0x14590f44a: mulss xmm1, dword ptr [rsi + 0x14]
0x14590f44f: mulss xmm1, dword ptr [rsi + 0x3c]
0x14590f454: mulss xmm1, xmm7
0x14590f458: movaps xmm2, xmm1
0x14590f45b: maxss xmm2, xmm0
0x14590f45f: movaps xmm0, xmm2
0x14590f462: cmpunordss xmm0, xmm2
0x14590f467: andps xmm1, xmm0
0x14590f46a: andnps xmm0, xmm2
0x14590f46d: orps xmm0, xmm1
0x14590f470: mov byte ptr [rbp + 0x23f], 1
0x14590f477: movss dword ptr [rsp + 0x20], xmm0
0x14590f47d: mov r9d, 5
0x14590f483: mov rcx, rbx
0x14590f486: mov rdx, r14
0x14590f489: lea r8, [rip + 0x1a21047] ; b'cdMaxslotamuletraritytexthudphasetimelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldow'
0x14590f490: call 0x14584edc0
0x14590f495: nop
; Selected 0x14590f605..0x14590f642
0x14590f605: movzx r13d, byte ptr [rbp + rax - 0x10]
0x14590f60b: test r13, r13
0x14590f60e: lea rcx, [rip + 0x1a20fd4] ; b'ringtrinket{subtitle} \xe2\x80\x94 survive the onslaught!subtitleYou have gained {damage}% damage, {health} maximum health and {regen} heal'
0x14590f615: lea rax, [rip + 0x1a20fd1] ; b'trinket{subtitle} \xe2\x80\x94 survive the onslaught!subtitleYou have gained {damage}% damage, {health} maximum health and {regen} health p'
0x14590f61c: cmovne rcx, rax
0x14590f620: mov qword ptr [rbp + 0x188], rcx
0x14590f627: mov r14, qword ptr [rbp + 0xd8]
0x14590f62e: nop
0x14590f630: cmp r14, rbx
0x14590f633: je 0x14590f5f0
0x14590f635: mov rdx, qword ptr [r14]
0x14590f638: add r14, 0x18
0x14590f63c: cmp byte ptr [rdx + 0x45], r13b
0x14590f640: jne 0x14590f630
; Selected 0x14590f846..0x14590f974
0x14590f846: test r12, r12
0x14590f849: cmovne rdi, r12
0x14590f84d: cmove rsi, r15
0x14590f851: mov byte ptr [rbp + 0x1d3], 0
0x14590f858: mov qword ptr [rsp + 0x28], rsi
0x14590f85d: mov qword ptr [rsp + 0x20], rdi
0x14590f862: mov r9d, 4
0x14590f868: lea r15, [rbp + 0x210]
0x14590f86f: mov rcx, r15
0x14590f872: lea rdi, [rbp + 0x240]
0x14590f879: mov rdx, rdi
0x14590f87c: lea r8, [rip + 0x1a20666] ; b'nameicondmgcolortoprevived\x0csink-test t=\xc5 '
0x14590f883: call 0x145858350
0x14590f888: nop
0x14590f889: mov rax, qword ptr [r14 - 0x18]
0x14590f88d: movups xmm0, xmmword ptr [rax + 0x20]
0x14590f891: mov byte ptr [rbp + 0x23d], 1
0x14590f898: movups xmmword ptr [rsp + 0x20], xmm0
0x14590f89d: mov r9d, 4
0x14590f8a3: mov rcx, rdi
0x14590f8a6: mov rdx, r15
0x14590f8a9: lea r8, [rip + 0x1a2063d] ; b'icondmgcolortoprevived\x0csink-test t=\xc5 '
0x14590f8b0: call 0x145858350
0x14590f8b5: nop
0x14590f8b6: mov byte ptr [rbp + 0x23d], 1
0x14590f8bd: lea rax, [r13*2 + 4]
0x14590f8c5: add rax, r13
0x14590f8c8: mov qword ptr [rsp + 0x28], rax
0x14590f8cd: mov rax, qword ptr [rbp + 0x188]
0x14590f8d4: mov qword ptr [rsp + 0x20], rax
0x14590f8d9: mov r9d, 4
0x14590f8df: mov rcx, r15
0x14590f8e2: mov rdx, rdi
0x14590f8e5: lea r8, [rip + 0x1a20bf0] ; b'slotamuletraritytexthudphasetimelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncrit'
0x14590f8ec: call 0x145858350
0x14590f8f1: nop
0x14590f8f2: mov eax, dword ptr [r14 - 4]
0x14590f8f6: mov byte ptr [rbp + 0x23d], 1
0x14590f8fd: mov dword ptr [rsp + 0x20], eax
0x14590f901: mov r9d, 4
0x14590f907: mov rcx, rdi
0x14590f90a: mov rdx, r15
0x14590f90d: lea r8, [rip + 0x1a20bbd] ; b'rankcdcdMaxslotamuletraritytexthudphasetimelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagec'
0x14590f914: call 0x14584f0c0
0x14590f919: nop
0x14590f91a: mov eax, dword ptr [r14 - 0x10]
0x14590f91e: mov byte ptr [rbp + 0x23d], 1
0x14590f925: mov dword ptr [rsp + 0x20], eax
0x14590f929: mov r9d, 6
0x14590f92f: mov rcx, r15
0x14590f932: mov rdx, rdi
0x14590f935: lea r8, [rip + 0x1a20baa] ; b'raritytexthudphasetimelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritspeedarmor'
0x14590f93c: call 0x14584f0c0
0x14590f941: nop
0x14590f942: mov rsi, qword ptr [rbp + 0x70]
0x14590f946: mov rax, qword ptr [rbp + 0x78]
0x14590f94a: mov byte ptr [rbp + 0x23d], 1
0x14590f951: mov qword ptr [rsp + 0x28], rax
0x14590f956: mov qword ptr [rsp + 0x20], rsi
0x14590f95b: mov r9d, 4
0x14590f961: mov rcx, rdi
0x14590f964: mov rdx, r15
0x14590f967: lea r8, [rip + 0x1a20b7e] ; b'texthudphasetimelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritspeedarmorregenp'
0x14590f96e: call 0x145858350
0x14590f973: nop
; Selected 0x14590faf4..0x14590fc34
0x14590faf4: movups xmm0, xmmword ptr [rbx + 0x3d0]
0x14590fafb: movups xmmword ptr [rsp + 0x20], xmm0
0x14590fb00: lea r8, [rip + 0x1a203e2] ; b'nameicondmgcolortoprevived\x0csink-test t=\xc5 '
0x14590fb07: lea rcx, [rbp + 0x210]
0x14590fb0e: lea rdx, [rbp + 0x240]
0x14590fb15: mov r9d, 4
0x14590fb1b: call 0x145858350
0x14590fb20: nop
0x14590fb21: movups xmm0, xmmword ptr [rbx + 0x3f8]
0x14590fb28: movups xmmword ptr [rsp + 0x20], xmm0
0x14590fb2d: lea r8, [rip + 0x1a203b9] ; b'icondmgcolortoprevived\x0csink-test t=\xc5 '
0x14590fb34: lea rcx, [rbp + 0x240]
0x14590fb3b: lea rdx, [rbp + 0x210]
0x14590fb42: mov r9d, 4
0x14590fb48: call 0x145858350
0x14590fb4d: nop
0x14590fb4e: lea rax, [rip + 0x1a2098b] ; b'amuletraritytexthudphasetimelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritspee'
0x14590fb55: mov qword ptr [rsp + 0x20], rax
0x14590fb5a: mov qword ptr [rsp + 0x28], 6
0x14590fb63: lea r8, [rip + 0x1a20972] ; b'slotamuletraritytexthudphasetimelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncrit'
0x14590fb6a: lea rcx, [rbp + 0x210]
0x14590fb71: lea rdx, [rbp + 0x240]
0x14590fb78: mov r9d, 4
0x14590fb7e: call 0x145858350
0x14590fb83: nop
0x14590fb84: mov eax, dword ptr [rbx + 0x418]
0x14590fb8a: mov dword ptr [rsp + 0x20], eax
0x14590fb8e: lea r8, [rip + 0x1a2093c] ; b'rankcdcdMaxslotamuletraritytexthudphasetimelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagec'
0x14590fb95: lea rcx, [rbp + 0x240]
0x14590fb9c: lea rdx, [rbp + 0x210]
0x14590fba3: mov r9d, 4
0x14590fba9: call 0x14584f0c0
0x14590fbae: nop
0x14590fbaf: mov eax, dword ptr [rbx + 0x408]
0x14590fbb5: mov dword ptr [rsp + 0x20], eax
0x14590fbb9: lea r8, [rip + 0x1a20926] ; b'raritytexthudphasetimelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritspeedarmor'
0x14590fbc0: lea rcx, [rbp + 0x210]
0x14590fbc7: lea rdx, [rbp + 0x240]
0x14590fbce: mov r9d, 6
0x14590fbd4: call 0x14584f0c0
0x14590fbd9: nop
0x14590fbda: lea rdx, [rbx + 0x3b0]
0x14590fbe1: lea rcx, [rbp + 0x160]
0x14590fbe8: call 0x14583cdd0
0x14590fbed: nop
0x14590fbee: mov rcx, qword ptr [rbp + 0x168]
0x14590fbf5: mov rax, qword ptr [rbp + 0x170]
0x14590fbfc: mov byte ptr [rbp + 0x1d6], 1
0x14590fc03: mov qword ptr [rsp + 0x28], rax
0x14590fc08: mov qword ptr [rbp + 0x188], rcx
0x14590fc0f: mov qword ptr [rsp + 0x20], rcx
0x14590fc14: lea r8, [rip + 0x1a208d1] ; b'texthudphasetimelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritspeedarmorregenp'
0x14590fc1b: lea rcx, [rbp + 0x240]
0x14590fc22: lea rdx, [rbp + 0x210]
0x14590fc29: mov r9d, 4
0x14590fc2f: call 0x145858350
; Selected 0x14590fd20..0x14590fd43
0x14590fd20: add rbx, 0x1e0
0x14590fd27: add rax, -0x1e0
0x14590fd2d: je 0x14590fd41
0x14590fd2f: cmp qword ptr [rbx + 0x18], -1
0x14590fd34: je 0x14590fd20
0x14590fd36: cmp dword ptr [rbx + 0xb0], 1
0x14590fd3d: je 0x14590fd20
0x14590fd3f: jmp 0x14590fd43
0x14590fd41: xor ebx, ebx
; Selected 0x14590fddb..0x14590fe75
0x14590fddb: mov byte ptr [rbp + 0x194], 1
0x14590fde2: mov rcx, rsi
0x14590fde5: call 0x1458bd0c0
0x14590fdea: nop
0x14590fdeb: mov byte ptr [rbp + 0x194], 0
0x14590fdf2: mov qword ptr [rsp + 0x28], rdx
0x14590fdf7: mov qword ptr [rsp + 0x20], rax
0x14590fdfc: mov r9d, 4
0x14590fe02: mov rcx, rdi
0x14590fe05: mov rdx, r14
0x14590fe08: lea r8, [rip + 0x1a200da] ; b'nameicondmgcolortoprevived\x0csink-test t=\xc5 '
0x14590fe0f: call 0x145858350
0x14590fe14: nop
0x14590fe15: movss xmm0, dword ptr [rsi + 0x160]
0x14590fe1d: maxss xmm0, xmm6
0x14590fe21: mov byte ptr [rbp + 0x237], 1
0x14590fe28: movss dword ptr [rsp + 0x20], xmm0
0x14590fe2e: mov r9d, 2
0x14590fe34: mov rcx, r14
0x14590fe37: mov rdx, rdi
0x14590fe3a: lea r8, [rip + 0x1a206c8] ; b'hphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritspeedarmorregenpickupabilitiesjewelrybuffstim'
0x14590fe41: call 0x14584edc0
0x14590fe46: nop
0x14590fe47: movss xmm0, dword ptr [rsi + 0x164]
0x14590fe4f: mov byte ptr [rbp + 0x237], 1
0x14590fe56: movss dword ptr [rsp + 0x20], xmm0
0x14590fe5c: mov r9d, 5
0x14590fe62: mov rcx, rdi
0x14590fe65: mov rdx, r14
0x14590fe68: lea r8, [rip + 0x1a2069c] ; b'hpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritspeedarmorregenpickupabilitiesjewelrybuffstimer'
0x14590fe6f: call 0x14584edc0
0x14590fe74: nop
; Selected 0x14590ff40..0x14590ffa3
0x14590ff40: add rax, 0x1e0
0x14590ff46: cmp rax, r15
0x14590ff49: je 0x14590ff77
0x14590ff4b: cmp byte ptr [rax + 0xb0], 0
0x14590ff52: jne 0x14590ff40
0x14590ff54: cmp qword ptr [rax + 0x18], -1
0x14590ff59: je 0x14590ff40
0x14590ff5b: lea r13, [rax + 0x1e0]
0x14590ff62: mov r12, rsi
0x14590ff65: mov rsi, rax
0x14590ff68: jmp 0x14590ffa3
0x14590ff6a: nop word ptr [rax + rax]
0x14590ff70: add rsi, 0x1e0
0x14590ff77: cmp rsi, r15
0x14590ff7a: je 0x145910018
0x14590ff80: cmp byte ptr [rsi + 0xb0], 0
0x14590ff87: jne 0x14590ff70
0x14590ff89: cmp qword ptr [rsi + 0x58], -1
0x14590ff8e: je 0x14590ff70
0x14590ff90: cmp byte ptr [rsi + 0xa8], 0
0x14590ff97: je 0x14590ff70
0x14590ff99: lea r12, [rsi + 0x1e0]
0x14590ffa0: xor r13d, r13d
; Selected 0x1459101b6..0x14591029e
0x1459101b6: movss xmm9, dword ptr [r12 + 0x10]
0x1459101bd: ucomiss xmm9, xmm8
0x1459101c1: jbe 0x1459101a9
0x1459101c3: mov rax, qword ptr [rbp + 0x130]
0x1459101ca: mov qword ptr [rbp + 0x1b0], rax
0x1459101d1: mov qword ptr [rbp + 0xe8], rsi
0x1459101d8: mov qword ptr [rbp + 0x1b8], rsi
0x1459101df: mov qword ptr [rbp + 0x1c0], rdx
0x1459101e6: mov byte ptr [rbp + 0x1c8], r8b
0x1459101ed: mov eax, dword ptr [rbp + 0xc0]
0x1459101f3: mov ecx, dword ptr [rbp + 0xc3]
0x1459101f9: lea rdx, [rbp + 0x1c9]
0x145910200: mov dword ptr [rdx + 3], ecx
0x145910203: mov dword ptr [rdx], eax
0x145910205: call 0x140002200
0x14591020a: mov ecx, 1
0x14591020f: mov edx, 1
0x145910214: call 0x1400021c0
0x145910219: test rax, rax
0x14591021c: je 0x1459138a9
0x145910222: mov byte ptr [rax], 0x7b
0x145910225: mov qword ptr [rbp + 0x240], 1
0x145910230: mov qword ptr [rbp + 0x248], rax
0x145910237: mov qword ptr [rbp + 0x250], 1
0x145910242: mov byte ptr [rbp + 0x258], 1
0x145910249: mov eax, dword ptr [r12 + 0xc]
0x14591024e: mov byte ptr [rbp + 0x1fb], 1
0x145910255: mov dword ptr [rsp + 0x20], eax
0x145910259: mov r9d, 5
0x14591025f: mov rcx, rdi
0x145910262: mov rdx, r15
0x145910265: lea r8, [rip + 0x1a1fbb4] ; b'spellcrates\\wenilla-rogue\\src\\game\\auras.rs'
0x14591026c: call 0x14584f0c0
0x145910271: nop
0x145910272: subss xmm9, xmm8
0x145910277: mov byte ptr [rbp + 0x1fb], 1
0x14591027e: movss dword ptr [rsp + 0x20], xmm9
0x145910285: mov r9d, 4
0x14591028b: mov rcx, r15
0x14591028e: mov rdx, rdi
0x145910291: lea r8, [rip + 0x1a1f7c0] ; b'left\x07result=\xc0\x03;t=\xc5 '
0x145910298: call 0x14584edc0
0x14591029d: nop
; Selected 0x145910470..0x14591050e
0x145910470: cmp byte ptr [r15], 0x22
0x145910474: jne 0x145910460
0x145910476: cmp r12, r11
0x145910479: jae 0x145910500
0x14591047f: mov rcx, r12
0x145910482: shl rcx, 6
0x145910486: cmp byte ptr [r8 + rcx], 0x22
0x14591048b: jne 0x145910500
0x14591048d: mov al, 1
0x14591048f: cmp r12, qword ptr [rbp + 0x188]
0x145910496: jae 0x14591067c
0x14591049c: mov r9, qword ptr [rbp - 0x38]
0x1459104a0: cmp dword ptr [r9 + r12*4], 0
0x1459104a5: je 0x14591067c
0x1459104ab: xorps xmm0, xmm0
0x1459104ae: cmp r12, qword ptr [rbp - 0x30]
0x1459104b2: jae 0x1459104be
0x1459104b4: mov r9, qword ptr [rbp - 0x28]
0x1459104b8: movss xmm0, dword ptr [r9 + r12*4]
0x1459104be: add rcx, r8
0x1459104c1: movss xmm1, dword ptr [rcx + 8]
0x1459104c6: mulss xmm1, xmm7
0x1459104ca: movaps xmm2, xmm1
0x1459104cd: maxss xmm2, dword ptr [rcx + 0xc]
0x1459104d2: movaps xmm10, xmm2
0x1459104d6: cmpunordss xmm10, xmm2
0x1459104dc: andps xmm1, xmm10
0x1459104e0: andnps xmm10, xmm2
0x1459104e4: orps xmm10, xmm1
0x1459104e8: addss xmm10, xmm0
0x1459104ed: cmp r12, r10
0x1459104f0: jae 0x145910460
0x1459104f6: jmp 0x14591050b
0x1459104f8: nop dword ptr [rax + rax]
0x145910500: xor eax, eax
0x145910502: cmp r12, r10
0x145910505: jae 0x145910460
0x14591050b: test al, al
0x14591050d: je 0x145910460
; Selected 0x14591056d..0x14591063e
0x14591056e: je 0x1459138c5
0x145910574: lea rcx, [r12 + r12*4]
0x145910578: mov rdx, qword ptr [rbp + 0x1a8]
0x14591057f: lea r14, [rdx + rcx*8]
0x145910583: mov byte ptr [rax], 0x7b
0x145910586: mov qword ptr [rbp + 0x240], 1
0x145910591: mov qword ptr [rbp + 0x248], rax
0x145910598: mov qword ptr [rbp + 0x250], 1
0x1459105a3: mov byte ptr [rbp + 0x258], 1
0x1459105aa: movups xmm0, xmmword ptr [r14 + 8]
0x1459105af: mov byte ptr [rbp + 0x235], 1
0x1459105b6: movups xmmword ptr [rsp + 0x20], xmm0
0x1459105bb: mov r9d, 4
0x1459105c1: lea rcx, [rbp + 0x210]
0x1459105c8: mov rdi, rsi
0x1459105cb: mov rdx, rsi
0x1459105ce: lea r8, [rip + 0x1a1f914] ; b'nameicondmgcolortoprevived\x0csink-test t=\xc5 '
0x1459105d5: call 0x145858350
0x1459105da: nop
0x1459105db: movups xmm0, xmmword ptr [r14 + 0x18]
0x1459105e0: mov byte ptr [rbp + 0x235], 1
0x1459105e7: movups xmmword ptr [rsp + 0x20], xmm0
0x1459105ec: mov r9d, 4
0x1459105f2: mov rcx, rdi
0x1459105f5: lea rdx, [rbp + 0x210]
0x1459105fc: lea r8, [rip + 0x1a1f8ea] ; b'icondmgcolortoprevived\x0csink-test t=\xc5 '
0x145910603: call 0x145858350
0x145910608: nop
0x145910609: subss xmm10, xmm8
0x14591060e: maxss xmm10, xmm9
0x145910613: mov byte ptr [rbp + 0x235], 1
0x14591061a: movss dword ptr [rsp + 0x20], xmm10
0x145910621: mov r9d, 4
0x145910627: lea rcx, [rbp + 0x210]
0x14591062e: mov rdx, rdi
0x145910631: lea r8, [rip + 0x1a1f420] ; b'left\x07result=\xc0\x03;t=\xc5 '
0x145910638: call 0x14584edc0
0x14591063d: nop
; Selected 0x145910725..0x145910c12
0x145910725: lea rax, [rip + 0x1a1fdc4] ; b'hudphasetimelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritspeedarmorregenpicku'
0x14591072c: mov qword ptr [rsp + 0x20], rax
0x145910731: mov qword ptr [rsp + 0x28], 3
0x14591073a: lea r8, [rip + 0x1a1f08f] ; b'typeendlesscrates\\wenilla-rogue\\src\\game\\hazards.rs'
0x145910741: lea rcx, [rbp + 0x210]
0x145910748: lea rdx, [rbp + 0x240]
0x14591074f: mov r9d, 4
0x145910755: call 0x145858350
0x14591075a: nop
0x14591075b: mov r13, qword ptr [rbp + 0x28]
0x14591075f: mov rax, qword ptr [rbp + 0x1e8]
0x145910766: movzx r12d, byte ptr [rax + 0xc46]
0x14591076e: lea eax, [r12*8]
0x145910776: lea rcx, [rip + 0x1a2207b] ; b'\x05'
0x14591077d: mov rcx, qword ptr [rax + rcx]
0x145910781: lea rdx, [rip + 0x1a220a0] ; b'\x1b\xfb2G\x01'
0x145910788: mov rax, qword ptr [rax + rdx]
0x14591078c: mov qword ptr [rbp + 0x208], rdi
0x145910793: mov qword ptr [rbp + 0x200], r15
0x14591079a: mov byte ptr [rbp + 0x267], 1
0x1459107a1: mov byte ptr [rbp + 0x266], 1
0x1459107a8: mov byte ptr [rbp + 0x265], 1
0x1459107af: mov byte ptr [rbp + 0x264], 1
0x1459107b6: mov byte ptr [rbp + 0x263], 1
0x1459107bd: mov qword ptr [rsp + 0x28], rcx
0x1459107c2: mov qword ptr [rsp + 0x20], rax
0x1459107c7: lea r8, [rip + 0x1a1fd25] ; b'phasetimelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritspeedarmorregenpickupab'
0x1459107ce: lea rcx, [rbp + 0x240]
0x1459107d5: lea rdx, [rbp + 0x210]
0x1459107dc: mov r9d, 5
0x1459107e2: call 0x145858350
0x1459107e7: nop
0x1459107e8: mov qword ptr [rbp + 0x208], rdi
0x1459107ef: mov qword ptr [rbp + 0x200], r15
0x1459107f6: mov byte ptr [rbp + 0x267], 1
0x1459107fd: mov byte ptr [rbp + 0x266], 1
0x145910804: mov byte ptr [rbp + 0x265], 1
0x14591080b: mov byte ptr [rbp + 0x264], 1
0x145910812: mov byte ptr [rbp + 0x263], 1
0x145910819: movss dword ptr [rsp + 0x20], xmm8
0x145910820: lea r8, [rip + 0x1a1fcd1] ; b'timelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritspeedarmorregenpickupabiliti'
0x145910827: lea rcx, [rbp + 0x210]
0x14591082e: lea rdx, [rbp + 0x240]
0x145910835: mov r9d, 4
0x14591083b: call 0x14584edc0
0x145910840: nop
0x145910841: mov rax, qword ptr [rbp + 0x1e8]
0x145910848: mov esi, dword ptr [rax + 0x4f0]
0x14591084e: mov qword ptr [rbp + 0x208], rdi
0x145910855: mov qword ptr [rbp + 0x200], r15
0x14591085c: mov byte ptr [rbp + 0x267], 1
0x145910863: mov byte ptr [rbp + 0x266], 1
0x14591086a: mov byte ptr [rbp + 0x265], 1
0x145910871: mov byte ptr [rbp + 0x264], 1
0x145910878: mov byte ptr [rbp + 0x263], 1
0x14591087f: mov dword ptr [rsp + 0x20], esi
0x145910883: lea r8, [rip + 0x1a1fc72] ; b'levelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritspeedarmorregenpickupabilitiesje'
0x14591088a: lea rcx, [rbp + 0x240]
0x145910891: lea rdx, [rbp + 0x210]
0x145910898: mov r9d, 5
0x14591089e: call 0x14584f0c0
0x1459108a3: nop
0x1459108a4: mov rax, qword ptr [rbp + 0x1e8]
0x1459108ab: mov eax, dword ptr [rax + 0x4f4]
0x1459108b1: mov qword ptr [rbp + 0x208], rdi
0x1459108b8: mov qword ptr [rbp + 0x200], r15
0x1459108bf: mov byte ptr [rbp + 0x267], 1
0x1459108c6: mov byte ptr [rbp + 0x266], 1
0x1459108cd: mov byte ptr [rbp + 0x265], 1
0x1459108d4: mov byte ptr [rbp + 0x264], 1
0x1459108db: mov byte ptr [rbp + 0x263], 1
0x1459108e2: mov dword ptr [rsp + 0x20], eax
0x1459108e6: lea r8, [rip + 0x1a1fc14] ; b'xpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritspeedarmorregenpickupabilitiesjewelry'
0x1459108ed: lea rcx, [rbp + 0x210]
0x1459108f4: lea rdx, [rbp + 0x240]
0x1459108fb: mov r9d, 2
0x145910901: call 0x14584f0c0
0x145910906: nop
0x145910907: cmp esi, 1
0x14591090a: adc esi, -1
0x14591090d: cvtsi2ss xmm1, rsi
0x145910912: movss xmm2, dword ptr [rip + 0x5d4ca6] ; b''
0x14591091a: mulss xmm2, xmm1
0x14591091e: addss xmm2, dword ptr [rip + 0x5cf8da] ; b''
0x145910926: movss xmm0, dword ptr [rip + 0x5cf696] ; b'33\xb3>'
0x14591092e: mulss xmm0, xmm1
0x145910932: mulss xmm0, xmm1
0x145910936: addss xmm0, xmm2
0x14591093a: call 0x145d1463d
0x14591093f: cvttss2si rax, xmm0
0x145910944: xor ecx, ecx
0x145910946: xorps xmm9, xmm9
0x14591094a: ucomiss xmm0, xmm9
0x14591094e: cmovae ecx, eax
0x145910951: ucomiss xmm0, dword ptr [rip + 0x5f025c] ; b'\xff\xff\x7fOff\xe6\xbe'
0x145910958: mov eax, 0xffffffff
0x14591095d: cmovbe eax, ecx
0x145910960: mov qword ptr [rbp + 0x208], rdi
0x145910967: mov qword ptr [rbp + 0x200], r15
0x14591096e: mov byte ptr [rbp + 0x267], 1
0x145910975: mov byte ptr [rbp + 0x266], 1
0x14591097c: mov byte ptr [rbp + 0x265], 1
0x145910983: mov byte ptr [rbp + 0x264], 1
0x14591098a: mov byte ptr [rbp + 0x263], 1
0x145910991: mov dword ptr [rsp + 0x20], eax
0x145910995: lea r8, [rip + 0x1a1fb67] ; b'xpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritspeedarmorregenpickupabilitiesjewelrybu'
0x14591099c: lea rcx, [rbp + 0x240]
0x1459109a3: lea rdx, [rbp + 0x210]
0x1459109aa: mov r9d, 6
0x1459109b0: call 0x14584f0c0
0x1459109b5: nop
0x1459109b6: mov rax, qword ptr [rbp + 0x1e8]
0x1459109bd: movss xmm0, dword ptr [rax + 0x4f8]
0x1459109c5: maxss xmm0, xmm9
0x1459109ca: mov qword ptr [rbp + 0x208], rdi
0x1459109d1: mov qword ptr [rbp + 0x200], r15
0x1459109d8: mov byte ptr [rbp + 0x267], 1
0x1459109df: mov byte ptr [rbp + 0x266], 1
0x1459109e6: mov byte ptr [rbp + 0x265], 1
0x1459109ed: mov byte ptr [rbp + 0x264], 1
0x1459109f4: mov byte ptr [rbp + 0x263], 1
0x1459109fb: movss dword ptr [rsp + 0x20], xmm0
0x145910a01: lea r8, [rip + 0x1a1fb01] ; b'hphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritspeedarmorregenpickupabilitiesjewelrybuffstim'
0x145910a08: lea rcx, [rbp + 0x210]
0x145910a0f: lea rdx, [rbp + 0x240]
0x145910a16: mov r9d, 2
0x145910a1c: call 0x14584edc0
0x145910a21: nop
0x145910a22: mov rax, qword ptr [rbp + 0x48]
0x145910a26: movss xmm0, dword ptr [rax]
0x145910a2a: mov qword ptr [rbp + 0x208], rdi
0x145910a31: mov qword ptr [rbp + 0x200], r15
0x145910a38: mov byte ptr [rbp + 0x267], 1
0x145910a3f: mov byte ptr [rbp + 0x266], 1
0x145910a46: mov byte ptr [rbp + 0x265], 1
0x145910a4d: mov byte ptr [rbp + 0x264], 1
0x145910a54: mov byte ptr [rbp + 0x263], 1
0x145910a5b: movss dword ptr [rsp + 0x20], xmm0
0x145910a61: lea r8, [rip + 0x1a1faa3] ; b'hpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritspeedarmorregenpickupabilitiesjewelrybuffstimer'
0x145910a68: lea rcx, [rbp + 0x240]
0x145910a6f: lea rdx, [rbp + 0x210]
0x145910a76: mov r9d, 5
0x145910a7c: call 0x14584edc0
0x145910a81: nop
0x145910a82: mov rax, qword ptr [rbp + 0x1e8]
0x145910a89: movss xmm0, dword ptr [rax + 0x4fc]
0x145910a91: mov qword ptr [rbp + 0x208], rdi
0x145910a98: mov qword ptr [rbp + 0x200], r15
0x145910a9f: mov byte ptr [rbp + 0x267], 1
0x145910aa6: mov byte ptr [rbp + 0x266], 1
0x145910aad: mov byte ptr [rbp + 0x265], 1
0x145910ab4: mov byte ptr [rbp + 0x264], 1
0x145910abb: mov byte ptr [rbp + 0x263], 1
0x145910ac2: movss dword ptr [rsp + 0x20], xmm0
0x145910ac8: lea r8, [rip + 0x1a1fa41] ; b'shieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritspeedarmorregenpickupabilitiesjewelrybuffstimersmete'
0x145910acf: lea rcx, [rbp + 0x210]
0x145910ad6: lea rdx, [rbp + 0x240]
0x145910add: mov r9d, 6
0x145910ae3: call 0x14584edc0
0x145910ae8: nop
0x145910ae9: mov rax, qword ptr [rbp + 0x1e8]
0x145910af0: mov eax, dword ptr [rax + 0x500]
0x145910af6: mov qword ptr [rbp + 0x208], rdi
0x145910afd: mov qword ptr [rbp + 0x200], r15
0x145910b04: mov byte ptr [rbp + 0x267], 1
0x145910b0b: mov byte ptr [rbp + 0x266], 1
0x145910b12: mov byte ptr [rbp + 0x265], 1
0x145910b19: mov byte ptr [rbp + 0x264], 1
0x145910b20: mov byte ptr [rbp + 0x263], 1
0x145910b27: mov dword ptr [rsp + 0x20], eax
0x145910b2b: lea r8, [rip + 0x1a1f9e4] ; b'goldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritspeedarmorregenpickupabilitiesjewelrybuffstimersmeterheale'
0x145910b32: lea rcx, [rbp + 0x240]
0x145910b39: lea rdx, [rbp + 0x210]
0x145910b40: mov r9d, 4
0x145910b46: call 0x14584f0c0
0x145910b4b: nop
0x145910b4c: mov rax, qword ptr [rbp + 0x1e8]
0x145910b53: mov eax, dword ptr [rax + 0xbf4]
0x145910b59: mov qword ptr [rbp + 0x208], rdi
0x145910b60: mov qword ptr [rbp + 0x200], r15
0x145910b67: mov byte ptr [rbp + 0x267], 1
0x145910b6e: mov byte ptr [rbp + 0x266], 1
0x145910b75: mov byte ptr [rbp + 0x265], 1
0x145910b7c: mov byte ptr [rbp + 0x264], 1
0x145910b83: mov byte ptr [rbp + 0x263], 1
0x145910b8a: mov dword ptr [rsp + 0x20], eax
0x145910b8e: lea r8, [rip + 0x1a1f985] ; b'chestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritspeedarmorregenpickupabilitiesjewelrybuffstimersmeterhealedhea'
0x145910b95: lea rcx, [rbp + 0x210]
0x145910b9c: lea rdx, [rbp + 0x240]
0x145910ba3: mov r9d, 9
0x145910ba9: call 0x14584f0c0
0x145910bae: nop
0x145910baf: mov rax, qword ptr [rbp + 0x1e8]
0x145910bb6: mov eax, dword ptr [rax + 0x79c]
0x145910bbc: mov qword ptr [rbp + 0x208], rdi
0x145910bc3: mov qword ptr [rbp + 0x200], r15
0x145910bca: mov byte ptr [rbp + 0x267], 1
0x145910bd1: mov byte ptr [rbp + 0x266], 1
0x145910bd8: mov byte ptr [rbp + 0x265], 1
0x145910bdf: mov byte ptr [rbp + 0x264], 1
0x145910be6: mov byte ptr [rbp + 0x263], 1
0x145910bed: mov dword ptr [rsp + 0x20], eax
0x145910bf1: lea r8, [rip + 0x1a1f92b] ; b'killsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritspeedarmorregenpickupabilitiesjewelrybuffstimersmeterhealedhealingbossM'
0x145910bf8: lea rcx, [rbp + 0x240]
0x145910bff: lea rdx, [rbp + 0x210]
0x145910c06: mov r9d, 5
0x145910c0c: call 0x14584f0c0
0x145910c11: nop
; Selected 0x145910d12..0x1459111cc
0x145910d13: lea rcx, [rbp + 0x210]
0x145910d1a: lea rdx, [rbp + 0x240]
0x145910d21: mov r9d, 7
0x145910d27: call 0x14584f0c0
0x145910d2c: nop
0x145910d2d: mov rax, qword ptr [rbp + 0x1e8]
0x145910d34: mov esi, dword ptr [rax + 0x558]
0x145910d3a: mov qword ptr [rbp + 0x208], rdi
0x145910d41: mov qword ptr [rbp + 0x200], r15
0x145910d48: mov byte ptr [rbp + 0x267], 1
0x145910d4f: mov byte ptr [rbp + 0x266], 1
0x145910d56: mov byte ptr [rbp + 0x265], 1
0x145910d5d: mov byte ptr [rbp + 0x264], 1
0x145910d64: mov byte ptr [rbp + 0x263], 1
0x145910d6b: mov dword ptr [rsp + 0x20], esi
0x145910d6f: lea r8, [rip + 0x1a1f7b9] ; b'rerollsrerollCoststoredLevelsdamagecooldowncritspeedarmorregenpickupabilitiesjewelrybuffstimersmeterhealedhealingbossMeterbossesne'
0x145910d76: lea rcx, [rbp + 0x240]
0x145910d7d: lea rdx, [rbp + 0x210]
0x145910d84: mov r9d, 7
0x145910d8a: call 0x14584f0c0
0x145910d8f: nop
0x145910d90: xor ecx, ecx
0x145910d92: test esi, esi
0x145910d94: jne 0x145910e42
0x145910d9a: mov rax, qword ptr [rbp + 0x1e8]
0x145910da1: mov r8d, dword ptr [rax + 0x55c]
0x145910da8: mov eax, 1
0x145910dad: test r8d, r8d
0x145910db0: je 0x145910e2b
0x145910db2: test r8b, 1
0x145910db6: je 0x145910dc3
0x145910db8: mov eax, 3
0x145910dbd: cmp r8d, 1
0x145910dc1: je 0x145910e2b
0x145910dc3: test r8b, 2
0x145910dc7: je 0x145910dd7
0x145910dc9: lea eax, [rax + rax*8]
0x145910dcc: mov ecx, r8d
0x145910dcf: and ecx, 0xfffffffe
0x145910dd2: cmp ecx, 2
0x145910dd5: je 0x145910e2b
0x145910dd7: test r8b, 4
0x145910ddb: je 0x145910dee
0x145910ddd: lea eax, [rax + rax*8]
0x145910de0: lea eax, [rax + rax*8]
0x145910de3: mov ecx, r8d
0x145910de6: and ecx, 0xfffffffc
0x145910de9: cmp ecx, 4
0x145910dec: je 0x145910e2b
0x145910dee: test r8b, 8
0x145910df2: je 0x145910e05
0x145910df4: imul eax, eax, 0x19a1
0x145910dfa: mov ecx, r8d
0x145910dfd: and ecx, 0xfffffff8
0x145910e00: cmp ecx, 8
0x145910e03: je 0x145910e2b
0x145910e05: mov r9b, 1
0x145910e08: mov ecx, 0xffffff9c
0x145910e0d: test r8b, 0x10
0x145910e11: je 0x145910e38
0x145910e13: mov edx, 0x290d741
0x145910e18: mul edx
0x145910e1a: seto dl
0x145910e1d: and r8d, 0xfffffff0
0x145910e21: cmp r8d, 0x10
0x145910e25: jne 0x145910e38
0x145910e27: test dl, dl
0x145910e29: jne 0x145910e38
0x145910e2b: mov ecx, 0x64
0x145910e30: mul ecx
0x145910e32: mov ecx, eax
0x145910e34: seto r9b
0x145910e38: test r9b, 1
0x145910e3c: jne 0x1459137d0
0x145910e42: mov qword ptr [rbp + 0x208], rdi
0x145910e49: mov qword ptr [rbp + 0x200], r15
0x145910e50: mov byte ptr [rbp + 0x267], 1
0x145910e57: mov byte ptr [rbp + 0x266], 1
0x145910e5e: mov byte ptr [rbp + 0x265], 1
0x145910e65: mov byte ptr [rbp + 0x264], 1
0x145910e6c: mov byte ptr [rbp + 0x263], 1
0x145910e73: mov dword ptr [rsp + 0x20], ecx
0x145910e77: lea r8, [rip + 0x1a1f6b8] ; b'rerollCoststoredLevelsdamagecooldowncritspeedarmorregenpickupabilitiesjewelrybuffstimersmeterhealedhealingbossMeterbossesnextBossr'
0x145910e7e: lea rcx, [rbp + 0x210]
0x145910e85: lea rdx, [rbp + 0x240]
0x145910e8c: mov r9d, 0xa
0x145910e92: call 0x14584f0c0
0x145910e97: nop
0x145910e98: xor eax, eax
0x145910e9a: mov rcx, qword ptr [rbp + 0x1e8]
0x145910ea1: cmp byte ptr [rcx + 0xc38], 0
0x145910ea8: je 0x145910eb7
0x145910eaa: mov rax, qword ptr [rbp + 0x1e8]
0x145910eb1: mov eax, dword ptr [rax + 0xbb0]
0x145910eb7: mov qword ptr [rbp + 0x208], rdi
0x145910ebe: mov qword ptr [rbp + 0x200], r15
0x145910ec5: mov byte ptr [rbp + 0x267], 1
0x145910ecc: mov byte ptr [rbp + 0x266], 1
0x145910ed3: mov byte ptr [rbp + 0x265], 1
0x145910eda: mov byte ptr [rbp + 0x264], 1
0x145910ee1: mov byte ptr [rbp + 0x263], 1
0x145910ee8: mov dword ptr [rsp + 0x20], eax
0x145910eec: lea r8, [rip + 0x1a1f64d] ; b'storedLevelsdamagecooldowncritspeedarmorregenpickupabilitiesjewelrybuffstimersmeterhealedhealingbossMeterbossesnextBossrevivereviv'
0x145910ef3: lea rcx, [rbp + 0x240]
0x145910efa: lea rdx, [rbp + 0x210]
0x145910f01: mov r9d, 0xc
0x145910f07: call 0x14584f0c0
0x145910f0c: nop
0x145910f0d: mov rax, qword ptr [rbp + 0x1e8]
0x145910f14: movss xmm0, dword ptr [rax + 0x494]
0x145910f1c: mov qword ptr [rbp + 0x208], rdi
0x145910f23: mov qword ptr [rbp + 0x200], r15
0x145910f2a: mov byte ptr [rbp + 0x267], 1
0x145910f31: mov byte ptr [rbp + 0x266], 1
0x145910f38: mov byte ptr [rbp + 0x265], 1
0x145910f3f: mov byte ptr [rbp + 0x264], 1
0x145910f46: mov byte ptr [rbp + 0x263], 1
0x145910f4d: movss dword ptr [rsp + 0x20], xmm0
0x145910f53: lea r8, [rip + 0x1a1f5f2] ; b'damagecooldowncritspeedarmorregenpickupabilitiesjewelrybuffstimersmeterhealedhealingbossMeterbossesnextBossreviverevivedByshareres'
0x145910f5a: lea rcx, [rbp + 0x210]
0x145910f61: lea rdx, [rbp + 0x240]
0x145910f68: mov r9d, 6
0x145910f6e: call 0x14584edc0
0x145910f73: nop
0x145910f74: mov qword ptr [rbp + 0x208], rdi
0x145910f7b: mov qword ptr [rbp + 0x200], r15
0x145910f82: mov byte ptr [rbp + 0x267], 1
0x145910f89: mov byte ptr [rbp + 0x266], 1
0x145910f90: mov byte ptr [rbp + 0x265], 1
0x145910f97: mov byte ptr [rbp + 0x264], 1
0x145910f9e: mov byte ptr [rbp + 0x263], 1
0x145910fa5: movss dword ptr [rsp + 0x20], xmm7
0x145910fab: lea r8, [rip + 0x1a1f5a0] ; b'cooldowncritspeedarmorregenpickupabilitiesjewelrybuffstimersmeterhealedhealingbossMeterbossesnextBossreviverevivedBysharerescuepar'
0x145910fb2: lea rcx, [rbp + 0x240]
0x145910fb9: lea rdx, [rbp + 0x210]
0x145910fc0: mov r9d, 8
0x145910fc6: call 0x14584edc0
0x145910fcb: nop
0x145910fcc: mov rax, qword ptr [rbp + 0x1e8]
0x145910fd3: movss xmm0, dword ptr [rax + 0x49c]
0x145910fdb: mov qword ptr [rbp + 0x208], rdi
0x145910fe2: mov qword ptr [rbp + 0x200], r15
0x145910fe9: mov byte ptr [rbp + 0x267], 1
0x145910ff0: mov byte ptr [rbp + 0x266], 1
0x145910ff7: mov byte ptr [rbp + 0x265], 1
0x145910ffe: mov byte ptr [rbp + 0x264], 1
0x145911005: mov byte ptr [rbp + 0x263], 1
0x14591100c: movss dword ptr [rsp + 0x20], xmm0
0x145911012: lea r8, [rip + 0x1a1f541] ; b'critspeedarmorregenpickupabilitiesjewelrybuffstimersmeterhealedhealingbossMeterbossesnextBossreviverevivedBysharerescuepartyMeter{'
0x145911019: lea rcx, [rbp + 0x210]
0x145911020: lea rdx, [rbp + 0x240]
0x145911027: mov r9d, 4
0x14591102d: call 0x14584edc0
0x145911032: nop
0x145911033: mov rax, qword ptr [rbp + 0x1e8]
0x14591103a: movss xmm0, dword ptr [rax + 0x4a4]
0x145911042: mov qword ptr [rbp + 0x208], rdi
0x145911049: mov qword ptr [rbp + 0x200], r15
0x145911050: mov byte ptr [rbp + 0x267], 1
0x145911057: mov byte ptr [rbp + 0x266], 1
0x14591105e: mov byte ptr [rbp + 0x265], 1
0x145911065: mov byte ptr [rbp + 0x264], 1
0x14591106c: mov byte ptr [rbp + 0x263], 1
0x145911073: movss dword ptr [rsp + 0x20], xmm0
0x145911079: lea r8, [rip + 0x1a1f4de] ; b'speedarmorregenpickupabilitiesjewelrybuffstimersmeterhealedhealingbossMeterbossesnextBossreviverevivedBysharerescuepartyMeter{n} l'
0x145911080: lea rcx, [rbp + 0x240]
0x145911087: lea rdx, [rbp + 0x210]
0x14591108e: mov r9d, 5
0x145911094: call 0x14584edc0
0x145911099: nop
0x14591109a: mov rax, qword ptr [rbp + 0x1e8]
0x1459110a1: movss xmm0, dword ptr [rax + 0x4b0]
0x1459110a9: mov qword ptr [rbp + 0x208], rdi
0x1459110b0: mov qword ptr [rbp + 0x200], r15
0x1459110b7: mov byte ptr [rbp + 0x267], 1
0x1459110be: mov byte ptr [rbp + 0x266], 1
0x1459110c5: mov byte ptr [rbp + 0x265], 1
0x1459110cc: mov byte ptr [rbp + 0x264], 1
0x1459110d3: mov byte ptr [rbp + 0x263], 1
0x1459110da: movss dword ptr [rsp + 0x20], xmm0
0x1459110e0: lea r8, [rip + 0x1a1f47c] ; b'armorregenpickupabilitiesjewelrybuffstimersmeterhealedhealingbossMeterbossesnextBossreviverevivedBysharerescuepartyMeter{n} lives '
0x1459110e7: lea rcx, [rbp + 0x210]
0x1459110ee: lea rdx, [rbp + 0x240]
0x1459110f5: mov r9d, 5
0x1459110fb: call 0x14584edc0
0x145911100: nop
0x145911101: mov rax, qword ptr [rbp + 0x1e8]
0x145911108: movss xmm0, dword ptr [rax + 0x4b4]
0x145911110: mov qword ptr [rbp + 0x208], rdi
0x145911117: mov qword ptr [rbp + 0x200], r15
0x14591111e: mov byte ptr [rbp + 0x267], 1
0x145911125: mov byte ptr [rbp + 0x266], 1
0x14591112c: mov byte ptr [rbp + 0x265], 1
0x145911133: mov byte ptr [rbp + 0x264], 1
0x14591113a: mov byte ptr [rbp + 0x263], 1
0x145911141: movss dword ptr [rsp + 0x20], xmm0
0x145911147: lea r8, [rip + 0x1a1f41a] ; b'regenpickupabilitiesjewelrybuffstimersmeterhealedhealingbossMeterbossesnextBossreviverevivedBysharerescuepartyMeter{n} lives leftr'
0x14591114e: lea rcx, [rbp + 0x240]
0x145911155: lea rdx, [rbp + 0x210]
0x14591115c: mov r9d, 5
0x145911162: call 0x14584edc0
0x145911167: nop
0x145911168: mov rax, qword ptr [rbp + 0x1e8]
0x14591116f: movss xmm0, dword ptr [rax + 0x4a8]
0x145911177: mov qword ptr [rbp + 0x208], rdi
0x14591117e: mov qword ptr [rbp + 0x200], r15
0x145911185: mov byte ptr [rbp + 0x267], 1
0x14591118c: mov byte ptr [rbp + 0x266], 1
0x145911193: mov byte ptr [rbp + 0x265], 1
0x14591119a: mov byte ptr [rbp + 0x264], 1
0x1459111a1: mov byte ptr [rbp + 0x263], 1
0x1459111a8: movss dword ptr [rsp + 0x20], xmm0
0x1459111ae: lea r8, [rip + 0x1a1f3b8] ; b'pickupabilitiesjewelrybuffstimersmeterhealedhealingbossMeterbossesnextBossreviverevivedBysharerescuepartyMeter{n} lives leftringtr'
0x1459111b5: lea rcx, [rbp + 0x210]
0x1459111bc: lea rdx, [rbp + 0x240]
0x1459111c3: mov r9d, 6
0x1459111c9: call 0x14584edc0
; Selected 0x14591160e..0x1459116b5
0x14591160e: call 0x145d14667
0x145911613: mov qword ptr [rbp + 0x208], rsi
0x14591161a: mov qword ptr [rbp + 0x200], r15
0x145911621: mov byte ptr [rbp + 0x267], 0
0x145911628: mov byte ptr [rbp + 0x266], 0
0x14591162f: mov byte ptr [rbp + 0x265], 1
0x145911636: mov byte ptr [rbp + 0x264], 0
0x14591163d: mov byte ptr [rbp + 0x263], 0
0x145911644: movsd qword ptr [rsp + 0x20], xmm0
0x14591164a: lea r8, [rip + 0x1a1ee34] ; b'dealtsecslivelines'
0x145911651: lea rcx, [rbp + 0x210]
0x145911658: lea rdx, [rbp + 0x240]
0x14591165f: mov r9d, 5
0x145911665: call 0x14584ec40
0x14591166a: nop
0x14591166b: mov byte ptr [rbp + 0x19b], 1
0x145911672: lea r15, [rbp + 0x1b0]
0x145911679: mov rcx, r15
0x14591167c: mov rdx, rdi
0x14591167f: mov r8, r14
0x145911682: call 0x145983f40
0x145911687: nop
0x145911688: mov byte ptr [rbp + 0x19b], 0
0x14591168f: mov qword ptr [rsp + 0x20], r15
0x145911694: lea r8, [rip + 0x1a1eef3] ; b'meterhealedhealingbossMeterbossesnextBossreviverevivedBysharerescuepartyMeter{n} lives leftringtrinket{subtitle} \xe2\x80\x94 survive the o'
0x14591169b: lea rcx, [rbp + 0x240]
0x1459116a2: lea rdx, [rbp + 0x210]
0x1459116a9: mov r9d, 5
0x1459116af: call 0x145858210
0x1459116b4: nop
; Selected 0x14591179e..0x145911845
0x14591179e: call 0x145d14667
0x1459117a3: mov qword ptr [rbp + 0x208], rsi
0x1459117aa: mov qword ptr [rbp + 0x200], r15
0x1459117b1: mov byte ptr [rbp + 0x267], 0
0x1459117b8: mov byte ptr [rbp + 0x266], 0
0x1459117bf: mov byte ptr [rbp + 0x265], 1
0x1459117c6: mov byte ptr [rbp + 0x264], 0
0x1459117cd: mov byte ptr [rbp + 0x263], 0
0x1459117d4: movsd qword ptr [rsp + 0x20], xmm0
0x1459117da: lea r8, [rip + 0x1a1edb2] ; b'healedhealingbossMeterbossesnextBossreviverevivedBysharerescuepartyMeter{n} lives leftringtrinket{subtitle} \xe2\x80\x94 survive the onslau'
0x1459117e1: lea rcx, [rbp + 0x210]
0x1459117e8: lea rdx, [rbp + 0x240]
0x1459117ef: mov r9d, 6
0x1459117f5: call 0x14584ec40
0x1459117fa: nop
0x1459117fb: mov byte ptr [rbp + 0x19a], 1
0x145911802: lea r15, [rbp + 0x240]
0x145911809: mov rcx, r15
0x14591180c: mov rdx, rdi
0x14591180f: mov r8, r14
0x145911812: call 0x145983f40
0x145911817: nop
0x145911818: mov byte ptr [rbp + 0x19a], 0
0x14591181f: mov qword ptr [rsp + 0x20], r15
0x145911824: lea r8, [rip + 0x1a1ed6e] ; b'healingbossMeterbossesnextBossreviverevivedBysharerescuepartyMeter{n} lives leftringtrinket{subtitle} \xe2\x80\x94 survive the onslaught!su'
0x14591182b: lea rcx, [rbp + 0x1b0]
0x145911832: lea rdx, [rbp + 0x210]
0x145911839: mov r9d, 7
0x14591183f: call 0x145858210
0x145911844: nop
; Selected 0x1459118f9..0x14591195d
0x1459118f9: movss xmm9, dword ptr [r14 + 0x790]
0x145911902: movss xmm7, dword ptr [r14 + 0x798]
0x14591190b: call 0x140002200
0x145911910: mov ecx, 1
0x145911915: mov edx, 1
0x14591191a: call 0x1400021c0
0x14591191f: test rax, rax
0x145911922: je 0x145913a5e
0x145911928: mov byte ptr [rax], 0x7b
0x14591192b: mov qword ptr [rbp + 0x240], 1
0x145911936: mov qword ptr [rbp + 0x248], rax
0x14591193d: mov qword ptr [rbp + 0x250], 1
0x145911948: mov byte ptr [rbp + 0x258], 1
0x14591194f: mov rdi, qword ptr [r14 + 0x6f8]
0x145911956: mov r14, qword ptr [r14 + 0x700]
; Selected 0x1459119fe..0x145911bb2
0x1459119fe: call 0x145d14667
0x145911a03: mov byte ptr [rbp + 0x23e], 1
0x145911a0a: movsd qword ptr [rsp + 0x20], xmm0
0x145911a10: lea r8, [rip + 0x1a1ea6e] ; b'dealtsecslivelines'
0x145911a17: lea rcx, [rbp + 0x210]
0x145911a1e: lea rdx, [rbp + 0x240]
0x145911a25: mov r9d, 5
0x145911a2b: call 0x14584ec40
0x145911a30: nop
0x145911a31: test sil, 1
0x145911a35: jne 0x145911a3b
0x145911a37: movaps xmm7, xmm8
0x145911a3b: subss xmm7, xmm9
0x145911a40: mov byte ptr [rbp + 0x23e], 1
0x145911a47: movss dword ptr [rsp + 0x20], xmm7
0x145911a4d: lea r8, [rip + 0x1a1ea36] ; b'secslivelines'
0x145911a54: lea rcx, [rbp + 0x240]
0x145911a5b: lea rdx, [rbp + 0x210]
0x145911a62: mov r9d, 4
0x145911a68: call 0x14584edc0
0x145911a6d: nop
0x145911a6e: lea rdx, [rip + 0x1a1ea19] ; b'livelines'
0x145911a75: lea rcx, [rbp + 0x240]
0x145911a7c: mov r8d, 4
0x145911a82: call 0x1458580a0
0x145911a87: nop
0x145911a88: xor r15d, r15d
0x145911a8b: cmp esi, 1
0x145911a8e: sete r15b
0x145911a92: or r15, 4
0x145911a96: mov rax, qword ptr [rbp + 0x240]
0x145911a9d: mov rdx, qword ptr [rbp + 0x250]
0x145911aa4: sub rax, rdx
0x145911aa7: cmp r15, rax
0x145911aaa: ja 0x1459136dc
0x145911ab0: cmp esi, 1
0x145911ab3: lea rax, [rip + 0x16fb5b0] ; b'true\x01"\xc0\x01"'
0x145911aba: cmovne r13, rax
0x145911abe: add rdx, qword ptr [rbp + 0x248]
0x145911ac5: mov rcx, rdx
0x145911ac8: mov rdx, r13
0x145911acb: mov r8, r15
0x145911ace: call 0x145d145fb
0x145911ad3: add qword ptr [rbp + 0x250], r15
0x145911ada: movups xmm0, xmmword ptr [rbp + 0x240]
0x145911ae1: movaps xmmword ptr [rbp + 0x210], xmm0
0x145911ae8: movupd xmm0, xmmword ptr [rbp + 0x250]
0x145911af0: movapd xmmword ptr [rbp + 0x220], xmm0
0x145911af8: mov byte ptr [rbp + 0x199], 1
0x145911aff: lea rsi, [rbp + 0x160]
0x145911b06: mov rcx, rsi
0x145911b09: mov rdx, rdi
0x145911b0c: mov r8, r14
0x145911b0f: call 0x145983f40
0x145911b14: nop
0x145911b15: mov byte ptr [rbp + 0x199], 0
0x145911b1c: mov qword ptr [rsp + 0x20], rsi
0x145911b21: lea r8, [rip + 0x1a1e96a] ; b'lines'
0x145911b28: lea rcx, [rbp + 0x240]
0x145911b2f: lea rdx, [rbp + 0x210]
0x145911b36: mov r9d, 5
0x145911b3c: call 0x145858210
0x145911b41: nop
0x145911b42: mov rsi, qword ptr [rbp + 0x250]
0x145911b49: cmp qword ptr [rbp + 0x240], rsi
0x145911b50: je 0x145913707
0x145911b56: mov rax, qword ptr [rbp + 0x248]
0x145911b5d: mov byte ptr [rax + rsi], 0x7d
0x145911b61: inc rsi
0x145911b64: mov qword ptr [rbp + 0x170], rsi
0x145911b6b: movupd xmm0, xmmword ptr [rbp + 0x240]
0x145911b73: movapd xmmword ptr [rbp + 0x160], xmm0
0x145911b7b: lea rcx, [rbp + 0x160]
0x145911b82: mov byte ptr [rbp + 0x23e], 0
0x145911b89: mov qword ptr [rsp + 0x20], rcx
0x145911b8e: lea r8, [rip + 0x1a1ea0b] ; b'bossMeterbossesnextBossreviverevivedBysharerescuepartyMeter{n} lives leftringtrinket{subtitle} \xe2\x80\x94 survive the onslaught!subtitleY'
0x145911b95: lea rcx, [rbp + 0x210]
0x145911b9c: lea rsi, [rbp + 0x1b0]
0x145911ba3: mov r9d, 9
0x145911ba9: mov rdx, rsi
0x145911bac: call 0x145858210
0x145911bb1: nop
; Selected 0x145911c3b..0x145911c61
0x145911c3b: mov qword ptr [rsp + 0x20], rsi
0x145911c40: lea r8, [rip + 0x1a1e962] ; b'bossesnextBossreviverevivedBysharerescuepartyMeter{n} lives leftringtrinket{subtitle} \xe2\x80\x94 survive the onslaught!subtitleYou have g'
0x145911c47: lea rcx, [rbp + 0x100]
0x145911c4e: lea rdx, [rbp + 0x210]
0x145911c55: mov r9d, 6
0x145911c5b: call 0x145858210
0x145911c60: nop
; Selected 0x145911e86..0x145911ee5
0x145911e86: ucomiss xmm6, xmm1
0x145911e89: movaps xmmword ptr [rbp + 0x100], xmm0
0x145911e90: seta al
0x145911e93: test byte ptr [rbp + 0xa0], al
0x145911e99: je 0x145911ef1
0x145911e9b: movaps xmm0, xmmword ptr [rbp + 0x100]
0x145911ea2: movaps xmm1, xmmword ptr [rbp + 0x110]
0x145911ea9: movaps xmmword ptr [rbp + 0x250], xmm1
0x145911eb0: movaps xmmword ptr [rbp + 0x240], xmm0
0x145911eb7: mov byte ptr [rbp + 0x262], 0
0x145911ebe: movss dword ptr [rsp + 0x20], xmm6
0x145911ec4: lea r8, [rip + 0x1a1e6e4] ; b'nextBossreviverevivedBysharerescuepartyMeter{n} lives leftringtrinket{subtitle} \xe2\x80\x94 survive the onslaught!subtitleYou have gained '
0x145911ecb: lea rcx, [rbp + 0x210]
0x145911ed2: lea rdx, [rbp + 0x240]
0x145911ed9: mov r9d, 8
0x145911edf: call 0x14584edc0
0x145911ee4: nop
; Selected 0x145911f97..0x1459120fe
0x145911f97: movzx ebx, byte ptr [rsi + 0xc41]
0x145911f9e: mov eax, ebx
0x145911fa0: xor al, 1
0x145911fa2: cmp r12b, 4
0x145911fa6: setne cl
0x145911fa9: or cl, al
0x145911fab: jne 0x14591216b
0x145911fb1: cmp byte ptr [rsi + 0xc33], 0
0x145911fb8: jne 0x14591216b
0x145911fbe: cmp byte ptr [rsi + 0xc47], 1
0x145911fc5: jne 0x14591216b
0x145911fcb: movss xmm0, dword ptr [rsi + 0xc28]
0x145911fd3: divss xmm0, dword ptr [rip + 0x5cdfe5] ; b''
0x145911fdb: xorps xmm1, xmm1
0x145911fde: maxss xmm1, xmm0
0x145911fe2: movss xmm0, dword ptr [rip + 0x5cdec6] ; b''
0x145911fea: minss xmm0, xmm1
0x145911fee: movaps xmm1, xmmword ptr [rbp + 0x100]
0x145911ff5: movaps xmm2, xmmword ptr [rbp + 0x110]
0x145911ffc: movaps xmmword ptr [rbp + 0x250], xmm2
0x145912003: movaps xmmword ptr [rbp + 0x240], xmm1
0x14591200a: mov byte ptr [rbp + 0x262], 0
0x145912011: movss dword ptr [rsp + 0x20], xmm0
0x145912017: lea r8, [rip + 0x1a1e599] ; b'reviverevivedBysharerescuepartyMeter{n} lives leftringtrinket{subtitle} \xe2\x80\x94 survive the onslaught!subtitleYou have gained {damage}'
0x14591201e: lea rcx, [rbp + 0x210]
0x145912025: lea rdx, [rbp + 0x240]
0x14591202c: mov r9d, 6
0x145912032: call 0x14584edc0
0x145912037: nop
0x145912038: movups xmm0, xmmword ptr [rbp + 0x210]
0x14591203f: movups xmm1, xmmword ptr [rbp + 0x220]
0x145912046: movaps xmmword ptr [rbp + 0x100], xmm0
0x14591204d: movaps xmmword ptr [rbp + 0x110], xmm1
0x145912054: mov rdx, qword ptr [rbp + 0x1e8]
0x14591205b: mov rax, qword ptr [rdx + 0x9c8]
0x145912062: mov rcx, qword ptr [rdx + 0x9d0]
0x145912069: lea rcx, [rcx + rcx*8]
0x14591206d: lea rcx, [rax + rcx*8]
0x145912071: mov qword ptr [rbp + 0x240], rax
0x145912078: mov qword ptr [rbp + 0x248], rcx
0x14591207f: mov qword ptr [rbp + 0x250], rdx
0x145912086: mov byte ptr [rbp + 0x262], 1
0x14591208d: lea rcx, [rbp + 0x1b0]
0x145912094: lea rdx, [rbp + 0x240]
0x14591209b: call 0x1459c2890
0x1459120a0: nop
0x1459120a1: mov rsi, qword ptr [rbp + 0x1b8]
0x1459120a8: mov rdi, qword ptr [rbp + 0x1c0]
0x1459120af: test rdi, rdi
0x1459120b2: je 0x145912142
0x1459120b8: movaps xmm0, xmmword ptr [rbp + 0x100]
0x1459120bf: movaps xmm1, xmmword ptr [rbp + 0x110]
0x1459120c6: movaps xmmword ptr [rbp + 0x250], xmm1
0x1459120cd: movaps xmmword ptr [rbp + 0x240], xmm0
0x1459120d4: movups xmm0, xmmword ptr [rsi + 8]
0x1459120d8: movups xmmword ptr [rsp + 0x20], xmm0
0x1459120dd: lea r8, [rip + 0x1a1e4d9] ; b'revivedBysharerescuepartyMeter{n} lives leftringtrinket{subtitle} \xe2\x80\x94 survive the onslaught!subtitleYou have gained {damage}% dama'
0x1459120e4: lea rcx, [rbp + 0x210]
0x1459120eb: lea rdx, [rbp + 0x240]
0x1459120f2: mov r9d, 9
0x1459120f8: call 0x145858350
0x1459120fd: nop
; Selected 0x14591216b..0x145912228
0x14591216b: mov rax, qword ptr [rsi + 0x9d0]
0x145912172: test rax, rax
0x145912175: je 0x1459123d3
0x14591217b: dec r12b
0x14591217e: cmp r12b, 1
0x145912182: ja 0x1459123d3
0x145912188: mov rcx, qword ptr [rbp + 0x1e8]
0x14591218f: mov rdx, qword ptr [rcx + 0x9c8]
0x145912196: shl rax, 3
0x14591219a: lea rax, [rax + rax*8]
0x14591219e: mov rcx, qword ptr [rcx + 0xb40]
0x1459121a5: lea r9, [rax - 0x48]
0x1459121a9: xor r8d, r8d
0x1459121ac: nop dword ptr [rax]
0x1459121b0: cmp qword ptr [rdx + r8 + 0x30], rcx
0x1459121b5: je 0x1459121c5
0x1459121b7: add r8, 0x48
0x1459121bb: cmp rax, r8
0x1459121be: jne 0x1459121b0
0x1459121c0: jmp 0x1459123d3
0x1459121c5: lea rsi, [rdx + r8]
0x1459121c9: cmp r9, r8
0x1459121cc: je 0x145912228
0x1459121ce: sub rax, r8
0x1459121d1: add rax, -0x48
0x1459121d5: add r8, rdx
0x1459121d8: add r8, 0x48
0x1459121dc: movabs rdx, 0xe38e38e38e38e38f
0x1459121e6: mul rdx
0x1459121e9: shr rdx, 6
0x1459121ed: jmp 0x1459121f9
0x1459121ef: nop
0x1459121f0: add r8, 0x48
0x1459121f4: dec rdx
0x1459121f7: je 0x145912228
0x1459121f9: cmp qword ptr [r8 + 0x30], rcx
0x1459121fd: jne 0x1459121f0
0x1459121ff: mov eax, dword ptr [rsi + 0x40]
0x145912202: mov r9d, dword ptr [r8 + 0x40]
0x145912206: mov r10d, eax
0x145912209: sar r10d, 0x1f
0x14591220d: shr r10d, 1
0x145912210: xor r10d, eax
0x145912213: mov eax, r9d
0x145912216: sar eax, 0x1f
0x145912219: shr eax, 1
0x14591221b: xor eax, r9d
0x14591221e: cmp r10d, eax
0x145912221: jg 0x1459121f0
0x145912223: mov rsi, r8
0x145912226: jmp 0x1459121f0
; Selected 0x1459122d2..0x145912399
0x1459122d2: mov byte ptr [rbp + 0x1f6], 1
0x1459122d9: mov qword ptr [rsp + 0x28], rsi
0x1459122de: mov qword ptr [rsp + 0x20], rdi
0x1459122e3: lea r8, [rip + 0x1a1dbff] ; b'nameicondmgcolortoprevived\x0csink-test t=\xc5 '
0x1459122ea: lea rcx, [rbp + 0x210]
0x1459122f1: lea rdx, [rbp + 0x240]
0x1459122f8: mov r9d, 4
0x1459122fe: call 0x145858350
0x145912303: nop
0x145912304: mov byte ptr [rbp + 0x1f6], 1
0x14591230b: movss dword ptr [rsp + 0x20], xmm6
0x145912311: lea r8, [rip + 0x1a1e2ae] ; b'sharerescuepartyMeter{n} lives leftringtrinket{subtitle} \xe2\x80\x94 survive the onslaught!subtitleYou have gained {damage}% damage, {heal'
0x145912318: lea rcx, [rbp + 0x240]
0x14591231f: lea rsi, [rbp + 0x210]
0x145912326: mov r9d, 5
0x14591232c: mov rdx, rsi
0x14591232f: call 0x14584edc0
0x145912334: nop
0x145912335: mov rdi, qword ptr [rbp + 0x250]
0x14591233c: cmp qword ptr [rbp + 0x240], rdi
0x145912343: je 0x145913808
0x145912349: mov rax, qword ptr [rbp + 0x248]
0x145912350: mov byte ptr [rax + rdi], 0x7d
0x145912354: inc rdi
0x145912357: mov qword ptr [rbp + 0x220], rdi
0x14591235e: movups xmm0, xmmword ptr [rbp + 0x240]
0x145912365: movaps xmmword ptr [rbp + 0x210], xmm0
0x14591236c: mov byte ptr [rbp + 0x1f6], 0
0x145912373: mov qword ptr [rsp + 0x20], rsi
0x145912378: lea r8, [rip + 0x1a1e24c] ; b'rescuepartyMeter{n} lives leftringtrinket{subtitle} \xe2\x80\x94 survive the onslaught!subtitleYou have gained {damage}% damage, {health} m'
0x14591237f: lea rcx, [rbp + 0x240]
0x145912386: lea rdx, [rbp + 0x1b0]
0x14591238d: mov r9d, 6
0x145912393: call 0x145858210
0x145912398: nop
; Selected 0x1459125eb..0x145912615
0x1459125eb: mov qword ptr [rbp + 0x1e8], rax
0x1459125f2: movzx eax, byte ptr [rax + 0x48]
0x1459125f6: add al, 0xfe
0x1459125f8: lea rcx, [rip + 0x13b0a59] ; b'\x01'
0x1459125ff: cmp al, 9
0x145912601: ja 0x145912611
0x145912603: movzx eax, al
0x145912606: lea rcx, [rip + 0x1a202e3] ; b'\xe80\xccF\x01'
0x14591260d: mov rcx, qword ptr [rcx + rax*8]
0x145912611: mov qword ptr [rbp + 0x20], rcx
; Selected 0x14591311a..0x14591320c
0x14591311a: mov rax, qword ptr [rbp + 0x1e8]
0x145913121: movdqu xmm0, xmmword ptr [rax + 8]
0x145913126: mov byte ptr [rbp + 0x23a], 1
0x14591312d: mov byte ptr [rbp + 0x239], 1
0x145913134: movdqu xmmword ptr [rsp + 0x20], xmm0
0x14591313a: mov r9d, 4
0x145913140: mov rcx, r12
0x145913143: lea rdx, [rbp + 0x240]
0x14591314a: lea r8, [rip + 0x1a1cd98] ; b'nameicondmgcolortoprevived\x0csink-test t=\xc5 '
0x145913151: call 0x145858350
0x145913156: nop
0x145913157: lea rsi, [rbp + 0x1b0]
0x14591315e: mov rbx, qword ptr [rbp + 0x20]
0x145913162: movdqu xmm0, xmmword ptr [rbx + 0x10]
0x145913167: mov byte ptr [rbp + 0x23a], 1
0x14591316e: mov byte ptr [rbp + 0x239], 1
0x145913175: movdqu xmmword ptr [rsp + 0x20], xmm0
0x14591317b: mov r9d, 5
0x145913181: lea rcx, [rbp + 0x240]
0x145913188: mov rdx, r12
0x14591318b: lea r8, [rip + 0x1a1c72a] ; b'classzone\x0c|cffffd100- \xc0\x02|r'
0x145913192: call 0x145858350
0x145913197: nop
0x145913198: movdqu xmm0, xmmword ptr [rbx + 0x50]
0x14591319d: mov byte ptr [rbp + 0x23a], 1
0x1459131a4: mov byte ptr [rbp + 0x239], 1
0x1459131ab: movdqu xmmword ptr [rsp + 0x20], xmm0
0x1459131b1: mov r9d, 5
0x1459131b7: mov rcx, r12
0x1459131ba: lea rdx, [rbp + 0x240]
0x1459131c1: lea r8, [rip + 0x1a1cd2c] ; b'colortoprevived\x0csink-test t=\xc5 '
0x1459131c8: call 0x145858350
0x1459131cd: nop
0x1459131ce: mov rax, qword ptr [rbp + 0x1e8]
0x1459131d5: movq xmm0, qword ptr [rax + 0x30]
0x1459131da: call 0x145d14667
0x1459131df: mov byte ptr [rbp + 0x23a], 1
0x1459131e6: mov byte ptr [rbp + 0x239], 1
0x1459131ed: movq qword ptr [rsp + 0x20], xmm0
0x1459131f3: mov r9d, 3
0x1459131f9: mov rcx, rsi
0x1459131fc: mov rdx, r12
0x1459131ff: lea r8, [rip + 0x1a1cceb] ; b'dmgcolortoprevived\x0csink-test t=\xc5 '
0x145913206: call 0x14584ec40
0x14591320b: nop
; Selected 0x14591328e..0x1459132b0
0x14591328e: mov qword ptr [rsp + 0x20], r12
0x145913293: mov r9d, 3
0x145913299: lea rcx, [rbp + 0x240]
0x1459132a0: mov rdx, rsi
0x1459132a3: lea r8, [rip + 0x1a1cc4f] ; b'toprevived\x0csink-test t=\xc5 '
0x1459132aa: call 0x145858210
0x1459132af: nop
; Selected 0x14591343f..0x145913469
0x14591343f: mov byte ptr [rbp + 0x1d4], 0
0x145913446: mov qword ptr [rsp + 0x20], r12
0x14591344b: lea r8, [rip + 0x1a1d17f] ; b'partyMeter{n} lives leftringtrinket{subtitle} \xe2\x80\x94 survive the onslaught!subtitleYou have gained {damage}% damage, {health} maximum'
0x145913452: lea rcx, [rbp + 0x240]
0x145913459: lea rdx, [rbp - 0x20]
0x14591345d: mov r9d, 0xa
0x145913463: call 0x145858210
0x145913468: nop
