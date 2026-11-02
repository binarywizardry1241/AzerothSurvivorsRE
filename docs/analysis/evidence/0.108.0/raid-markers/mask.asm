1400ebdc0: 53 push rbx
1400ebdc1: 4883ec50 sub rsp, 0x50
1400ebdc5: 440f29442440 movaps xmmword ptr [rsp + 0x40], xmm8
1400ebdcb: 0f297c2430 movaps xmmword ptr [rsp + 0x30], xmm7
1400ebdd0: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
1400ebdd5: 89cb mov ebx, ecx
1400ebdd7: 440f28c3 movaps xmm8, xmm3
1400ebddb: 0f28f2 movaps xmm6, xmm2
1400ebdde: 0f28f9 movaps xmm7, xmm1
1400ebde1: 0f28c1 movaps xmm0, xmm1
1400ebde4: f30f58c1 addss xmm0, xmm1
1400ebde8: f30f100dcca3cb05 movss xmm1, dword ptr [rip + 0x5cba3cc]
1400ebdf0: f30f58c1 addss xmm0, xmm1
1400ebdf4: f30f58f2 addss xmm6, xmm2
1400ebdf8: f30f58f1 addss xmm6, xmm1
1400ebdfc: 0f28ce movaps xmm1, xmm6
1400ebdff: e8916bb005 call 0x145bf2995
1400ebe04: 0fb6c3 movzx eax, bl
1400ebe07: 488d0df273ce05 lea rcx, [rip + 0x5ce73f2]
1400ebe0e: 48630481 movsxd rax, dword ptr [rcx + rax*4]
1400ebe12: 4801c8 add rax, rcx
1400ebe15: ffe0 jmp rax
1400ebe17: 0f28c8 movaps xmm1, xmm0
1400ebe1a: f30f1005eeb7ca05 movss xmm0, dword ptr [rip + 0x5cab7ee]
1400ebe22: 0f28d1 movaps xmm2, xmm1
1400ebe25: f30f5dd0 minss xmm2, xmm0
1400ebe29: 0f28da movaps xmm3, xmm2
1400ebe2c: f30f59da mulss xmm3, xmm2
1400ebe30: f30f59da mulss xmm3, xmm2
1400ebe34: f30f591d9449ce05 mulss xmm3, dword ptr [rip + 0x5ce4994]
1400ebe3c: f30f581dc465cb05 addss xmm3, dword ptr [rip + 0x5cb65c4]
1400ebe44: 0f28d0 movaps xmm2, xmm0
1400ebe47: f30f5cd1 subss xmm2, xmm1
1400ebe4b: f3410f5ed0 divss xmm2, xmm8
1400ebe50: 0f57c9 xorps xmm1, xmm1
1400ebe53: f30f5fca maxss xmm1, xmm2
1400ebe57: f30f5dc1 minss xmm0, xmm1
1400ebe5b: f30f59c3 mulss xmm0, xmm3
1400ebe5f: e93d030000 jmp 0x1400ec1a1
1400ebe64: 0f543525bcca05 andps xmm6, xmmword ptr [rip + 0x5cabc25]
1400ebe6b: f30f1005d111ce05 movss xmm0, dword ptr [rip + 0x5ce11d1]
1400ebe73: f30f59c6 mulss xmm0, xmm6
1400ebe77: e8136bb005 call 0x145bf298f
1400ebe7c: 0f28c8 movaps xmm1, xmm0
1400ebe7f: f30f590d8db7ca05 mulss xmm1, dword ptr [rip + 0x5cab78d]
1400ebe87: 660f70c6a0 pshufd xmm0, xmm6, 0xa0
1400ebe8c: 0f58051d49ce05 addps xmm0, xmmword ptr [rip + 0x5ce491d]
1400ebe93: 0f5e052649ce05 divps xmm0, xmmword ptr [rip + 0x5ce4926]
1400ebe9a: 0f57d2 xorps xmm2, xmm2
1400ebe9d: 0f5fd0 maxps xmm2, xmm0
1400ebea0: 0f2805e965cb05 movaps xmm0, xmmword ptr [rip + 0x5cb65e9]
1400ebea7: 0fc2c201 cmpltps xmm0, xmm2
1400ebeab: 0f14c0 unpcklps xmm0, xmm0
1400ebeae: 660f50c0 movmskpd eax, xmm0
1400ebeb2: f30f100556b7ca05 movss xmm0, dword ptr [rip + 0x5cab756]
1400ebeba: 0f28e0 movaps xmm4, xmm0
1400ebebd: a802 test al, 2
1400ebebf: 7504 jne 0x1400ebec5
1400ebec1: f30f16e2 movshdup xmm4, xmm2
1400ebec5: 0f28ec movaps xmm5, xmm4
1400ebec8: f30f59ec mulss xmm5, xmm4
1400ebecc: f30f58e4 addss xmm4, xmm4
1400ebed0: f30f101d3865cb05 movss xmm3, dword ptr [rip + 0x5cb6538]
1400ebed8: 0f28f3 movaps xmm6, xmm3
1400ebedb: f30f5cf4 subss xmm6, xmm4
1400ebedf: f30f59f5 mulss xmm6, xmm5
1400ebee3: 0f28e0 movaps xmm4, xmm0
1400ebee6: f30f5ce6 subss xmm4, xmm6
1400ebeea: 0f28ec movaps xmm5, xmm4
1400ebeed: f30f5fe9 maxss xmm5, xmm1
1400ebef1: 0f28cd movaps xmm1, xmm5
1400ebef4: f30fc2cd03 cmpunordss xmm1, xmm5
1400ebef9: 0f54e1 andps xmm4, xmm1
1400ebefc: 0f55cd andnps xmm1, xmm5
1400ebeff: 0f56cc orps xmm1, xmm4
1400ebf02: 0f28e0 movaps xmm4, xmm0
1400ebf05: a801 test al, 1
1400ebf07: 7503 jne 0x1400ebf0c
1400ebf09: 0f28e2 movaps xmm4, xmm2
1400ebf0c: 0f28d4 movaps xmm2, xmm4
1400ebf0f: f30f59d4 mulss xmm2, xmm4
1400ebf13: f30f58e4 addss xmm4, xmm4
1400ebf17: f30f5cdc subss xmm3, xmm4
1400ebf1b: f30f59da mulss xmm3, xmm2
1400ebf1f: f30f5cc3 subss xmm0, xmm3
1400ebf23: e975020000 jmp 0x1400ec19d
1400ebf28: 0f543561bbca05 andps xmm6, xmmword ptr [rip + 0x5cabb61]
1400ebf2f: 0f28c6 movaps xmm0, xmm6
1400ebf32: f30f59c6 mulss xmm0, xmm6
1400ebf36: f30f59c6 mulss xmm0, xmm6
1400ebf3a: f30f59058e48ce05 mulss xmm0, dword ptr [rip + 0x5ce488e]
1400ebf42: f30f5805be64cb05 addss xmm0, dword ptr [rip + 0x5cb64be]
1400ebf4a: e952020000 jmp 0x1400ec1a1
1400ebf4f: f30f1005b9b6ca05 movss xmm0, dword ptr [rip + 0x5cab6b9]
1400ebf57: e945020000 jmp 0x1400ec1a1
1400ebf5c: f30f10052c48ce05 movss xmm0, dword ptr [rip + 0x5ce482c]
1400ebf64: f30f59c7 mulss xmm0, xmm7
1400ebf68: e80a6ab005 call 0x145bf2977
1400ebf6d: 0f28f0 movaps xmm6, xmm0
1400ebf70: f30f593d1c48ce05 mulss xmm7, dword ptr [rip + 0x5ce481c]
1400ebf78: f30f583d1848ce05 addss xmm7, dword ptr [rip + 0x5ce4818]
1400ebf80: 0f28c7 movaps xmm0, xmm7
1400ebf83: e8ef69b005 call 0x145bf2977
1400ebf88: 0f28c8 movaps xmm1, xmm0
1400ebf8b: 0f28c6 movaps xmm0, xmm6
1400ebf8e: 0f14c1 unpcklps xmm0, xmm1
1400ebf91: 0f280d9810ce05 movaps xmm1, xmmword ptr [rip + 0x5ce1098]
1400ebf98: 0f59c1 mulps xmm0, xmm1
1400ebf9b: 0f58c1 addps xmm0, xmm1
1400ebf9e: f30f16c8 movshdup xmm1, xmm0
1400ebfa2: f30f5905faa1cb05 mulss xmm0, dword ptr [rip + 0x5cba1fa]
1400ebfaa: f30f59c1 mulss xmm0, xmm1
1400ebfae: f30f5805faa1cb05 addss xmm0, dword ptr [rip + 0x5cba1fa]
1400ebfb6: e9e6010000 jmp 0x1400ec1a1
1400ebfbb: 0f28c8 movaps xmm1, xmm0
1400ebfbe: f30f10054ab6ca05 movss xmm0, dword ptr [rip + 0x5cab64a]
1400ebfc6: 0f28d0 movaps xmm2, xmm0
1400ebfc9: f30f5cd1 subss xmm2, xmm1
1400ebfcd: f3410f5ed0 divss xmm2, xmm8
1400ebfd2: 0f57c9 xorps xmm1, xmm1
1400ebfd5: f30f5fca maxss xmm1, xmm2
1400ebfd9: f30f5dc1 minss xmm0, xmm1
1400ebfdd: e9bf010000 jmp 0x1400ec1a1
1400ebfe2: 0f57c0 xorps xmm0, xmm0
1400ebfe5: 0f2ef0 ucomiss xmm6, xmm0
1400ebfe8: 7656 jbe 0x1400ec040
1400ebfea: f30f1005ae47ce05 movss xmm0, dword ptr [rip + 0x5ce47ae]
1400ebff2: f30f59c6 mulss xmm0, xmm6
1400ebff6: e89469b005 call 0x145bf298f
1400ebffb: 0f28c8 movaps xmm1, xmm0
1400ebffe: f30f590daaa1cb05 mulss xmm1, dword ptr [rip + 0x5cba1aa]
1400ec006: e9ac000000 jmp 0x1400ec0b7
1400ec00b: f30f583da9a1cb05 addss xmm7, dword ptr [rip + 0x5cba1a9]
1400ec013: 0f57c0 xorps xmm0, xmm0
1400ec016: 0f2ef8 ucomiss xmm7, xmm0
1400ec019: 0f86bb000000 jbe 0x1400ec0da
1400ec01f: f30f10057947ce05 movss xmm0, dword ptr [rip + 0x5ce4779]
1400ec027: f30f59c7 mulss xmm0, xmm7
1400ec02b: e85f69b005 call 0x145bf298f
1400ec030: 0f28c8 movaps xmm1, xmm0
1400ec033: f30f590d75a1cb05 mulss xmm1, dword ptr [rip + 0x5cba175]
1400ec03b: e911010000 jmp 0x1400ec151
1400ec040: f30f100d8ca0cb05 movss xmm1, dword ptr [rip + 0x5cba08c]
1400ec048: f30f5cce subss xmm1, xmm6
1400ec04c: f30f5e0d4847ce05 divss xmm1, dword ptr [rip + 0x5ce4748]
1400ec054: f30f5fc1 maxss xmm0, xmm1
1400ec058: f30f103db0b5ca05 movss xmm7, dword ptr [rip + 0x5cab5b0]
1400ec060: 0f28cf movaps xmm1, xmm7
1400ec063: f30f5dc8 minss xmm1, xmm0
1400ec067: 0f28c1 movaps xmm0, xmm1
1400ec06a: f30f59c1 mulss xmm0, xmm1
1400ec06e: f30f58c9 addss xmm1, xmm1
1400ec072: f30f10159663cb05 movss xmm2, dword ptr [rip + 0x5cb6396]
1400ec07a: f30f5cd1 subss xmm2, xmm1
1400ec07e: f30f59d0 mulss xmm2, xmm0
1400ec082: f30f5cfa subss xmm7, xmm2
1400ec086: f30f10054210ce05 movss xmm0, dword ptr [rip + 0x5ce1042]
1400ec08e: f30f59c6 mulss xmm0, xmm6
1400ec092: e8f868b005 call 0x145bf298f
1400ec097: f30f59050d10ce05 mulss xmm0, dword ptr [rip + 0x5ce100d]
1400ec09f: 0f28d7 movaps xmm2, xmm7
1400ec0a2: f30f5fd0 maxss xmm2, xmm0
1400ec0a6: 0f28ca movaps xmm1, xmm2
1400ec0a9: f30fc2ca03 cmpunordss xmm1, xmm2
1400ec0ae: 0f54f9 andps xmm7, xmm1
1400ec0b1: 0f55ca andnps xmm1, xmm2
1400ec0b4: 0f56cf orps xmm1, xmm7
1400ec0b7: 0f5435d2b9ca05 andps xmm6, xmmword ptr [rip + 0x5cab9d2]
1400ec0be: f30f5835de46ce05 addss xmm6, dword ptr [rip + 0x5ce46de]
1400ec0c6: f30f5e35da46ce05 divss xmm6, dword ptr [rip + 0x5ce46da]
1400ec0ce: 0f57d2 xorps xmm2, xmm2
1400ec0d1: f30f5fd6 maxss xmm2, xmm6
1400ec0d5: e995000000 jmp 0x1400ec16f
1400ec0da: f30f100df29fcb05 movss xmm1, dword ptr [rip + 0x5cb9ff2]
1400ec0e2: f30f5ccf subss xmm1, xmm7
1400ec0e6: f30f5e0dae46ce05 divss xmm1, dword ptr [rip + 0x5ce46ae]
1400ec0ee: f30f5fc1 maxss xmm0, xmm1
1400ec0f2: f30f103516b5ca05 movss xmm6, dword ptr [rip + 0x5cab516]
1400ec0fa: 0f28ce movaps xmm1, xmm6
1400ec0fd: f30f5dc8 minss xmm1, xmm0
1400ec101: 0f28c1 movaps xmm0, xmm1
1400ec104: f30f59c1 mulss xmm0, xmm1
1400ec108: f30f58c9 addss xmm1, xmm1
1400ec10c: f30f1015fc62cb05 movss xmm2, dword ptr [rip + 0x5cb62fc]
1400ec114: f30f5cd1 subss xmm2, xmm1
1400ec118: f30f59d0 mulss xmm2, xmm0
1400ec11c: f30f5cf2 subss xmm6, xmm2
1400ec120: f30f1005a80fce05 movss xmm0, dword ptr [rip + 0x5ce0fa8]
1400ec128: f30f59c7 mulss xmm0, xmm7
1400ec12c: e85e68b005 call 0x145bf298f
1400ec131: f30f5905730fce05 mulss xmm0, dword ptr [rip + 0x5ce0f73]
1400ec139: 0f28d6 movaps xmm2, xmm6
1400ec13c: f30f5fd0 maxss xmm2, xmm0
1400ec140: 0f28ca movaps xmm1, xmm2
1400ec143: f30fc2ca03 cmpunordss xmm1, xmm2
1400ec148: 0f54f1 andps xmm6, xmm1
1400ec14b: 0f55ca andnps xmm1, xmm2
1400ec14e: 0f56ce orps xmm1, xmm6
1400ec151: 0f543d38b9ca05 andps xmm7, xmmword ptr [rip + 0x5cab938]
1400ec158: f30f583d4446ce05 addss xmm7, dword ptr [rip + 0x5ce4644]
1400ec160: f30f5e3d4046ce05 divss xmm7, dword ptr [rip + 0x5ce4640]
1400ec168: 0f57d2 xorps xmm2, xmm2
1400ec16b: f30f5fd7 maxss xmm2, xmm7
1400ec16f: f30f100599b4ca05 movss xmm0, dword ptr [rip + 0x5cab499]
1400ec177: 0f28d8 movaps xmm3, xmm0
1400ec17a: f30f5dda minss xmm3, xmm2
1400ec17e: 0f28d3 movaps xmm2, xmm3
1400ec181: f30f59d3 mulss xmm2, xmm3
1400ec185: f30f58db addss xmm3, xmm3
1400ec189: f30f10257f62cb05 movss xmm4, dword ptr [rip + 0x5cb627f]
1400ec191: f30f5ce3 subss xmm4, xmm3
1400ec195: f30f59e2 mulss xmm4, xmm2
1400ec199: f30f5cc4 subss xmm0, xmm4
1400ec19d: f30f59c1 mulss xmm0, xmm1
1400ec1a1: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
1400ec1a6: 0f287c2430 movaps xmm7, xmmword ptr [rsp + 0x30]
1400ec1ab: 440f28442440 movaps xmm8, xmmword ptr [rsp + 0x40]
1400ec1b1: 4883c450 add rsp, 0x50
1400ec1b5: 5b pop rbx
1400ec1b6: c3 ret
