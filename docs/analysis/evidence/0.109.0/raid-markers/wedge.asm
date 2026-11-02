1401477f0: 56 push rsi
1401477f1: 57 push rdi
1401477f2: 4881ecb8000000 sub rsp, 0xb8
1401477f9: 440f29b424a0000000 movaps xmmword ptr [rsp + 0xa0], xmm14
140147802: 440f29ac2490000000 movaps xmmword ptr [rsp + 0x90], xmm13
14014780b: 440f29a42480000000 movaps xmmword ptr [rsp + 0x80], xmm12
140147814: 440f295c2470 movaps xmmword ptr [rsp + 0x70], xmm11
14014781a: 440f29542460 movaps xmmword ptr [rsp + 0x60], xmm10
140147820: 440f294c2450 movaps xmmword ptr [rsp + 0x50], xmm9
140147826: 440f29442440 movaps xmmword ptr [rsp + 0x40], xmm8
14014782c: 0f297c2430 movaps xmmword ptr [rsp + 0x30], xmm7
140147831: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
140147836: 0f28fa movaps xmm7, xmm2
140147839: 0f28f1 movaps xmm6, xmm1
14014783c: 4889ce mov rsi, rcx
14014783f: f3440f101d5c5ac505 movss xmm11, dword ptr [rip + 0x5c55a5c]
140147848: f3440f59da mulss xmm11, xmm2
14014784d: e8aea9ebff call 0x140002200
140147852: f30f100546abc905 movss xmm0, dword ptr [rip + 0x5c9ab46]
14014785a: 0f2ec7 ucomiss xmm0, xmm7
14014785d: 0f83e1000000 jae 0x140147944
140147863: b930000000 mov ecx, 0x30
140147868: ba04000000 mov edx, 4
14014786d: e84ea9ebff call 0x1400021c0
140147872: 4885c0 test rax, rax
140147875: 0f84a6010000 je 0x140147a21
14014787b: 4889c7 mov rdi, rax
14014787e: 440f28c6 movaps xmm8, xmm6
140147882: f3450f5cc3 subss xmm8, xmm11
140147887: 410f28c0 movaps xmm0, xmm8
14014788b: e88d28ab05 call 0x145bfa11d
140147890: 0f28f8 movaps xmm7, xmm0
140147893: 410f28c0 movaps xmm0, xmm8
140147897: e87b28ab05 call 0x145bfa117
14014789c: 440f28c0 movaps xmm8, xmm0
1401478a0: 440f2825f857c805 movaps xmm12, xmmword ptr [rip + 0x5c857f8]
1401478a8: 450f57c4 xorps xmm8, xmm12
1401478ac: 0f28c6 movaps xmm0, xmm6
1401478af: e86928ab05 call 0x145bfa11d
1401478b4: 440f28c8 movaps xmm9, xmm0
1401478b8: 0f28c6 movaps xmm0, xmm6
1401478bb: e85728ab05 call 0x145bfa117
1401478c0: 440f28d0 movaps xmm10, xmm0
1401478c4: 450f28e9 movaps xmm13, xmm9
1401478c8: 450f57ec xorps xmm13, xmm12
1401478cc: f3410f58f3 addss xmm6, xmm11
1401478d1: 440f28f0 movaps xmm14, xmm0
1401478d5: 450f57f4 xorps xmm14, xmm12
1401478d9: 0f28c6 movaps xmm0, xmm6
1401478dc: e83c28ab05 call 0x145bfa11d
1401478e1: 440f28d8 movaps xmm11, xmm0
1401478e5: 0f28c6 movaps xmm0, xmm6
1401478e8: e82a28ab05 call 0x145bfa117
1401478ed: 450f57dc xorps xmm11, xmm12
1401478f1: f3440f1107 movss dword ptr [rdi], xmm8
1401478f6: f30f117f04 movss dword ptr [rdi + 4], xmm7
1401478fb: c7470800000000 mov dword ptr [rdi + 8], 0
140147902: f3440f11570c movss dword ptr [rdi + 0xc], xmm10
140147908: f3440f116f10 movss dword ptr [rdi + 0x10], xmm13
14014790e: c7471400000000 mov dword ptr [rdi + 0x14], 0
140147915: f3440f117718 movss dword ptr [rdi + 0x18], xmm14
14014791b: f3440f114f1c movss dword ptr [rdi + 0x1c], xmm9
140147921: c7472000000000 mov dword ptr [rdi + 0x20], 0
140147928: f30f114724 movss dword ptr [rdi + 0x24], xmm0
14014792d: f3440f115f28 movss dword ptr [rdi + 0x28], xmm11
140147933: c7472c00000000 mov dword ptr [rdi + 0x2c], 0
14014793a: b802000000 mov eax, 2
14014793f: e98b000000 jmp 0x1401479cf
140147944: b918000000 mov ecx, 0x18
140147949: ba04000000 mov edx, 4
14014794e: e86da8ebff call 0x1400021c0
140147953: 4885c0 test rax, rax
140147956: 0f84d6000000 je 0x140147a32
14014795c: 4889c7 mov rdi, rax
14014795f: 0f28fe movaps xmm7, xmm6
140147962: f3410f5cfb subss xmm7, xmm11
140147967: f3410f58f3 addss xmm6, xmm11
14014796c: 0f28c7 movaps xmm0, xmm7
14014796f: e8a927ab05 call 0x145bfa11d
140147974: 440f28c0 movaps xmm8, xmm0
140147978: 0f28c7 movaps xmm0, xmm7
14014797b: e89727ab05 call 0x145bfa117
140147980: 0f28f8 movaps xmm7, xmm0
140147983: 440f28151557c805 movaps xmm10, xmmword ptr [rip + 0x5c85715]
14014798b: 410f57fa xorps xmm7, xmm10
14014798f: 0f28c6 movaps xmm0, xmm6
140147992: e88627ab05 call 0x145bfa11d
140147997: 440f28c8 movaps xmm9, xmm0
14014799b: 0f28c6 movaps xmm0, xmm6
14014799e: e87427ab05 call 0x145bfa117
1401479a3: 450f57ca xorps xmm9, xmm10
1401479a7: f30f113f movss dword ptr [rdi], xmm7
1401479ab: f3440f114704 movss dword ptr [rdi + 4], xmm8
1401479b1: c7470800000000 mov dword ptr [rdi + 8], 0
1401479b8: f30f11470c movss dword ptr [rdi + 0xc], xmm0
1401479bd: f3440f114f10 movss dword ptr [rdi + 0x10], xmm9
1401479c3: c7471400000000 mov dword ptr [rdi + 0x14], 0
1401479ca: b801000000 mov eax, 1
1401479cf: 488906 mov qword ptr [rsi], rax
1401479d2: 48897e08 mov qword ptr [rsi + 8], rdi
1401479d6: 48894610 mov qword ptr [rsi + 0x10], rax
1401479da: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
1401479df: 0f287c2430 movaps xmm7, xmmword ptr [rsp + 0x30]
1401479e4: 440f28442440 movaps xmm8, xmmword ptr [rsp + 0x40]
1401479ea: 440f284c2450 movaps xmm9, xmmword ptr [rsp + 0x50]
1401479f0: 440f28542460 movaps xmm10, xmmword ptr [rsp + 0x60]
1401479f6: 440f285c2470 movaps xmm11, xmmword ptr [rsp + 0x70]
1401479fc: 440f28a42480000000 movaps xmm12, xmmword ptr [rsp + 0x80]
140147a05: 440f28ac2490000000 movaps xmm13, xmmword ptr [rsp + 0x90]
140147a0e: 440f28b424a0000000 movaps xmm14, xmmword ptr [rsp + 0xa0]
140147a17: 4881c4b8000000 add rsp, 0xb8
140147a1e: 5f pop rdi
140147a1f: 5e pop rsi
140147a20: c3 ret
140147a21: b904000000 mov ecx, 4
140147a26: ba30000000 mov edx, 0x30
140147a2b: e87118c505 call 0x145d992a1
140147a30: 0f0b ud2
140147a32: b904000000 mov ecx, 4
140147a37: ba18000000 mov edx, 0x18
140147a3c: e86018c505 call 0x145d992a1
140147a41: 0f0b ud2
