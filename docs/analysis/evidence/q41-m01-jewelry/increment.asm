14583f9c0: movzx r9d, byte ptr [rcx + 0x44]
14583f9c5: cmp r9d, 0x10
14583f9c9: jne 0x14583f9e1
14583f9cb: xor eax, eax
14583f9cd: cmp rdx, 3
14583f9d1: setae al
14583f9d4: lea rcx, [rip + 0x80273d]
14583f9db: movss xmm0, dword ptr [rcx + rax*4]
14583f9e0: ret
14583f9e1: movzx eax, byte ptr [r8]
14583f9e5: test al, al
14583f9e7: jne 0x14583f9f8
14583f9e9: xorps xmm2, xmm2
14583f9ec: je 0x14583fa00
14583f9ee: movss xmm0, dword ptr [rip + 0x66268e]
14583f9f6: jmp 0x14583fa08
14583f9f8: movss xmm2, dword ptr [r8 + 4]
14583f9fe: jne 0x14583f9ee
14583fa00: movss xmm0, dword ptr [rip + 0x68bf00]
14583fa08: cmp rdx, 4
14583fa0c: mov r10d, 4
14583fa12: cmovb r10, rdx
14583fa16: mov edx, dword ptr [r8 + 8]
14583fa1a: movss xmm3, dword ptr [rcx + 0x40]
14583fa1f: mov ecx, r10d
14583fa22: lea r8, [rip + 0x17cc27b]
14583fa29: movss xmm1, dword ptr [r8 + rcx*4]
14583fa2f: mulss xmm1, xmm3
14583fa33: mulss xmm1, xmm0
14583fa37: movss xmm0, dword ptr [rip + 0x662ae1]
14583fa3f: cmp r9d, 0x13
14583fa43: ja 0x14583fa74
14583fa45: mov ecx, r9d
14583fa48: lea r8, [rip + 0x17d54ed]
14583fa4f: movsxd rcx, dword ptr [r8 + rcx*4]
14583fa53: add rcx, r8
14583fa56: jmp rcx
14583fa58: movss xmm0, dword ptr [rip + 0x6bd6c4]
14583fa60: jmp 0x14583fa78
14583fa62: movss xmm0, dword ptr [rip + 0x662b56]
14583fa6a: jmp 0x14583fa74
14583fa6c: movss xmm0, dword ptr [rip + 0x696f04]
14583fa74: mulss xmm0, xmm3
14583fa78: subss xmm0, xmm2
14583fa7c: xorps xmm4, xmm4
14583fa7f: maxss xmm0, xmm4
14583fa83: movzx ecx, r9b
14583fa87: cmp cl, 9
14583fa8a: ja 0x14583ffca
14583fa90: mov r8d, 0x31b
14583fa96: bt r8d, ecx
14583fa9a: jae 0x14583fadb
14583fa9c: movss xmm2, dword ptr [rip + 0x6625e0]
14583faa4: test al, al
14583faa6: je 0x14583fabe
14583faa8: mov eax, edx
14583faaa: xorps xmm3, xmm3
14583faad: cvtsi2ss xmm3, rax
14583fab2: mulss xmm3, dword ptr [rip + 0x68bc8e]
14583faba: addss xmm2, xmm3
14583fabe: divss xmm1, xmm2
14583fac2: movaps xmm2, xmm1
14583fac5: minss xmm2, xmm0
14583fac9: movaps xmm0, xmm2
14583facc: cmpunordss xmm0, xmm2
14583fad1: andps xmm1, xmm0
14583fad4: andnps xmm0, xmm2
14583fad7: orps xmm0, xmm1
14583fada: ret
14583fadb: mov eax, 0x64
14583fae0: bt eax, ecx
14583fae3: jae 0x14583ffca
14583fae9: mulss xmm3, dword ptr [rip + 0x662acf]
14583faf1: mulss xmm1, dword ptr [rip + 0x93a5db]
14583faf9: ucomiss xmm3, xmm2
14583fafc: jae 0x14583fd89
14583fb02: movaps xmm0, xmm3
14583fb05: divss xmm0, xmm2
14583fb09: mulss xmm0, xmm0
14583fb0d: mulss xmm0, dword ptr [rip + 0x662aaf]
14583fb15: mulss xmm0, xmm1
14583fb19: addss xmm0, xmm2
14583fb1d: ucomiss xmm3, xmm0
14583fb20: jb 0x14583fdb2
14583fb26: movss xmm4, dword ptr [rip + 0x763c12]
14583fb2e: mulss xmm4, xmm0
14583fb32: divss xmm4, xmm3
14583fb36: addss xmm4, dword ptr [rip + 0x662546]
14583fb3e: mulss xmm4, xmm1
14583fb42: addss xmm0, xmm4
14583fb46: ucomiss xmm3, xmm0
14583fb49: jb 0x14583fdd6
14583fb4f: movss xmm4, dword ptr [rip + 0x763be9]
14583fb57: mulss xmm4, xmm0
14583fb5b: divss xmm4, xmm3
14583fb5f: addss xmm4, dword ptr [rip + 0x66251d]
14583fb67: mulss xmm4, xmm1
14583fb6b: addss xmm0, xmm4
14583fb6f: ucomiss xmm3, xmm0
14583fb72: jb 0x14583fdfa
14583fb78: movss xmm4, dword ptr [rip + 0x763bc0]
14583fb80: mulss xmm4, xmm0
14583fb84: divss xmm4, xmm3
14583fb88: addss xmm4, dword ptr [rip + 0x6624f4]
14583fb90: mulss xmm4, xmm1
14583fb94: addss xmm0, xmm4
14583fb98: ucomiss xmm3, xmm0
14583fb9b: jb 0x14583fe1e
14583fba1: movss xmm4, dword ptr [rip + 0x763b97]
14583fba9: mulss xmm4, xmm0
14583fbad: divss xmm4, xmm3
14583fbb1: addss xmm4, dword ptr [rip + 0x6624cb]
14583fbb9: mulss xmm4, xmm1
14583fbbd: addss xmm0, xmm4
14583fbc1: ucomiss xmm3, xmm0
14583fbc4: jb 0x14583fe42
14583fbca: movss xmm4, dword ptr [rip + 0x763b6e]
14583fbd2: mulss xmm4, xmm0
14583fbd6: divss xmm4, xmm3
14583fbda: addss xmm4, dword ptr [rip + 0x6624a2]
14583fbe2: mulss xmm4, xmm1
14583fbe6: addss xmm0, xmm4
14583fbea: ucomiss xmm3, xmm0
14583fbed: jb 0x14583fe66
14583fbf3: movss xmm4, dword ptr [rip + 0x763b45]
14583fbfb: mulss xmm4, xmm0
14583fbff: divss xmm4, xmm3
14583fc03: addss xmm4, dword ptr [rip + 0x662479]
14583fc0b: mulss xmm4, xmm1
14583fc0f: addss xmm0, xmm4
14583fc13: ucomiss xmm3, xmm0
14583fc16: jb 0x14583fe8a
14583fc1c: movss xmm4, dword ptr [rip + 0x763b1c]
14583fc24: mulss xmm4, xmm0
14583fc28: divss xmm4, xmm3
14583fc2c: addss xmm4, dword ptr [rip + 0x662450]
14583fc34: mulss xmm4, xmm1
14583fc38: addss xmm0, xmm4
14583fc3c: ucomiss xmm3, xmm0
14583fc3f: jb 0x14583feae
14583fc45: movss xmm4, dword ptr [rip + 0x763af3]
14583fc4d: mulss xmm4, xmm0
14583fc51: divss xmm4, xmm3
14583fc55: addss xmm4, dword ptr [rip + 0x662427]
14583fc5d: mulss xmm4, xmm1
14583fc61: addss xmm0, xmm4
14583fc65: ucomiss xmm3, xmm0
14583fc68: jb 0x14583fed2
14583fc6e: movss xmm4, dword ptr [rip + 0x763aca]
14583fc76: mulss xmm4, xmm0
14583fc7a: divss xmm4, xmm3
14583fc7e: addss xmm4, dword ptr [rip + 0x6623fe]
14583fc86: mulss xmm4, xmm1
14583fc8a: addss xmm0, xmm4
14583fc8e: ucomiss xmm3, xmm0
14583fc91: jb 0x14583fef6
14583fc97: movss xmm4, dword ptr [rip + 0x763aa1]
14583fc9f: mulss xmm4, xmm0
14583fca3: divss xmm4, xmm3
14583fca7: addss xmm4, dword ptr [rip + 0x6623d5]
14583fcaf: mulss xmm4, xmm1
14583fcb3: addss xmm0, xmm4
14583fcb7: ucomiss xmm3, xmm0
14583fcba: jb 0x14583ff1a
14583fcc0: movss xmm4, dword ptr [rip + 0x763a78]
14583fcc8: mulss xmm4, xmm0
14583fccc: divss xmm4, xmm3
14583fcd0: addss xmm4, dword ptr [rip + 0x6623ac]
14583fcd8: mulss xmm4, xmm1
14583fcdc: addss xmm0, xmm4
14583fce0: ucomiss xmm3, xmm0
14583fce3: jb 0x14583ff3e
14583fce9: movss xmm4, dword ptr [rip + 0x763a4f]
14583fcf1: mulss xmm4, xmm0
14583fcf5: divss xmm4, xmm3
14583fcf9: addss xmm4, dword ptr [rip + 0x662383]
14583fd01: mulss xmm4, xmm1
14583fd05: addss xmm0, xmm4
14583fd09: ucomiss xmm3, xmm0
14583fd0c: jb 0x14583ff62
14583fd12: movss xmm4, dword ptr [rip + 0x763a26]
14583fd1a: mulss xmm4, xmm0
14583fd1e: divss xmm4, xmm3
14583fd22: addss xmm4, dword ptr [rip + 0x66235a]
14583fd2a: mulss xmm4, xmm1
14583fd2e: addss xmm0, xmm4
14583fd32: ucomiss xmm3, xmm0
14583fd35: jb 0x14583ff86
14583fd3b: movss xmm4, dword ptr [rip + 0x7639fd]
14583fd43: mulss xmm4, xmm0
14583fd47: divss xmm4, xmm3
14583fd4b: addss xmm4, dword ptr [rip + 0x662331]
14583fd53: mulss xmm4, xmm1
14583fd57: addss xmm0, xmm4
14583fd5b: ucomiss xmm3, xmm0
14583fd5e: jb 0x14583ffaa
14583fd64: movss xmm4, dword ptr [rip + 0x7639d4]
14583fd6c: mulss xmm4, xmm0
14583fd70: divss xmm4, xmm3
14583fd74: addss xmm4, dword ptr [rip + 0x662308]
14583fd7c: mulss xmm1, xmm4
14583fd80: addss xmm0, xmm1
14583fd84: subss xmm0, xmm2
14583fd88: ret
14583fd89: movss xmm0, dword ptr [rip + 0x7639af]
14583fd91: mulss xmm0, xmm2
14583fd95: divss xmm0, xmm3
14583fd99: addss xmm0, dword ptr [rip + 0x6622e3]
14583fda1: mulss xmm0, xmm1
14583fda5: addss xmm0, xmm2
14583fda9: ucomiss xmm3, xmm0
14583fdac: jae 0x14583fb26
14583fdb2: movaps xmm4, xmm3
14583fdb5: divss xmm4, xmm0
14583fdb9: mulss xmm4, xmm4
14583fdbd: mulss xmm4, dword ptr [rip + 0x6627ff]
14583fdc5: mulss xmm4, xmm1
14583fdc9: addss xmm0, xmm4
14583fdcd: ucomiss xmm3, xmm0
14583fdd0: jae 0x14583fb4f
14583fdd6: movaps xmm4, xmm3
14583fdd9: divss xmm4, xmm0
14583fddd: mulss xmm4, xmm4
14583fde1: mulss xmm4, dword ptr [rip + 0x6627db]
14583fde9: mulss xmm4, xmm1
14583fded: addss xmm0, xmm4
14583fdf1: ucomiss xmm3, xmm0
14583fdf4: jae 0x14583fb78
14583fdfa: movaps xmm4, xmm3
14583fdfd: divss xmm4, xmm0
14583fe01: mulss xmm4, xmm4
14583fe05: mulss xmm4, dword ptr [rip + 0x6627b7]
14583fe0d: mulss xmm4, xmm1
14583fe11: addss xmm0, xmm4
14583fe15: ucomiss xmm3, xmm0
14583fe18: jae 0x14583fba1
14583fe1e: movaps xmm4, xmm3
14583fe21: divss xmm4, xmm0
14583fe25: mulss xmm4, xmm4
14583fe29: mulss xmm4, dword ptr [rip + 0x662793]
14583fe31: mulss xmm4, xmm1
14583fe35: addss xmm0, xmm4
14583fe39: ucomiss xmm3, xmm0
14583fe3c: jae 0x14583fbca
14583fe42: movaps xmm4, xmm3
14583fe45: divss xmm4, xmm0
14583fe49: mulss xmm4, xmm4
14583fe4d: mulss xmm4, dword ptr [rip + 0x66276f]
14583fe55: mulss xmm4, xmm1
14583fe59: addss xmm0, xmm4
14583fe5d: ucomiss xmm3, xmm0
14583fe60: jae 0x14583fbf3
14583fe66: movaps xmm4, xmm3
14583fe69: divss xmm4, xmm0
14583fe6d: mulss xmm4, xmm4
14583fe71: mulss xmm4, dword ptr [rip + 0x66274b]
14583fe79: mulss xmm4, xmm1
14583fe7d: addss xmm0, xmm4
14583fe81: ucomiss xmm3, xmm0
14583fe84: jae 0x14583fc1c
14583fe8a: movaps xmm4, xmm3
14583fe8d: divss xmm4, xmm0
14583fe91: mulss xmm4, xmm4
14583fe95: mulss xmm4, dword ptr [rip + 0x662727]
14583fe9d: mulss xmm4, xmm1
14583fea1: addss xmm0, xmm4
14583fea5: ucomiss xmm3, xmm0
14583fea8: jae 0x14583fc45
14583feae: movaps xmm4, xmm3
14583feb1: divss xmm4, xmm0
14583feb5: mulss xmm4, xmm4
14583feb9: mulss xmm4, dword ptr [rip + 0x662703]
14583fec1: mulss xmm4, xmm1
14583fec5: addss xmm0, xmm4
14583fec9: ucomiss xmm3, xmm0
14583fecc: jae 0x14583fc6e
14583fed2: movaps xmm4, xmm3
14583fed5: divss xmm4, xmm0
14583fed9: mulss xmm4, xmm4
14583fedd: mulss xmm4, dword ptr [rip + 0x6626df]
14583fee5: mulss xmm4, xmm1
14583fee9: addss xmm0, xmm4
14583feed: ucomiss xmm3, xmm0
14583fef0: jae 0x14583fc97
14583fef6: movaps xmm4, xmm3
14583fef9: divss xmm4, xmm0
14583fefd: mulss xmm4, xmm4
14583ff01: mulss xmm4, dword ptr [rip + 0x6626bb]
14583ff09: mulss xmm4, xmm1
14583ff0d: addss xmm0, xmm4
14583ff11: ucomiss xmm3, xmm0
14583ff14: jae 0x14583fcc0
14583ff1a: movaps xmm4, xmm3
14583ff1d: divss xmm4, xmm0
14583ff21: mulss xmm4, xmm4
14583ff25: mulss xmm4, dword ptr [rip + 0x662697]
14583ff2d: mulss xmm4, xmm1
14583ff31: addss xmm0, xmm4
14583ff35: ucomiss xmm3, xmm0
14583ff38: jae 0x14583fce9
14583ff3e: movaps xmm4, xmm3
14583ff41: divss xmm4, xmm0
14583ff45: mulss xmm4, xmm4
14583ff49: mulss xmm4, dword ptr [rip + 0x662673]
14583ff51: mulss xmm4, xmm1
14583ff55: addss xmm0, xmm4
14583ff59: ucomiss xmm3, xmm0
14583ff5c: jae 0x14583fd12
14583ff62: movaps xmm4, xmm3
14583ff65: divss xmm4, xmm0
14583ff69: mulss xmm4, xmm4
14583ff6d: mulss xmm4, dword ptr [rip + 0x66264f]
14583ff75: mulss xmm4, xmm1
14583ff79: addss xmm0, xmm4
14583ff7d: ucomiss xmm3, xmm0
14583ff80: jae 0x14583fd3b
14583ff86: movaps xmm4, xmm3
14583ff89: divss xmm4, xmm0
14583ff8d: mulss xmm4, xmm4
14583ff91: mulss xmm4, dword ptr [rip + 0x66262b]
14583ff99: mulss xmm4, xmm1
14583ff9d: addss xmm0, xmm4
14583ffa1: ucomiss xmm3, xmm0
14583ffa4: jae 0x14583fd64
14583ffaa: divss xmm3, xmm0
14583ffae: mulss xmm3, xmm3
14583ffb2: mulss xmm3, dword ptr [rip + 0x66260a]
14583ffba: movaps xmm4, xmm3
14583ffbd: mulss xmm1, xmm4
14583ffc1: addss xmm0, xmm1
14583ffc5: subss xmm0, xmm2
14583ffc9: ret
14583ffca: mulss xmm1, xmm0
14583ffce: movss xmm2, dword ptr [rip + 0x66254a]
14583ffd6: add ecx, -7
14583ffd9: cmp ecx, 0xc
14583ffdc: ja 0x145840028
14583ffde: lea rax, [rip + 0x17d4fa7]
14583ffe5: movsxd rcx, dword ptr [rax + rcx*4]
14583ffe9: add rcx, rax
14583ffec: jmp rcx
14583ffee: movss xmm2, dword ptr [rip + 0x6625ca]
14583fff6: jmp 0x145840028
14583fff8: movss xmm0, dword ptr [rip + 0x662504]
145840000: subss xmm0, xmm2
145840004: xorps xmm2, xmm2
145840007: maxss xmm0, xmm2
14584000b: movss xmm2, dword ptr [rip + 0x662071]
145840013: test al, al
145840015: jne 0x14583faa8
14584001b: jmp 0x14583fabe
145840020: movss xmm2, dword ptr [rip + 0x696950]
145840028: mulss xmm3, xmm2
14584002c: divss xmm1, xmm3
145840030: jmp 0x14583fac2
