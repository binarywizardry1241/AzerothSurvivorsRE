1459175f3: f3410f104558 movss xmm0, dword ptr [r13 + 0x58]
1459175f9: 0f2e8534020000 ucomiss xmm0, dword ptr [rbp + 0x234]
145917600: 7613 jbe 0x145917615
145917602: 450f134d40 movlps qword ptr [r13 + 0x40], xmm9
145917607: f30f108528020000 movss xmm0, dword ptr [rbp + 0x228]
14591760f: f3410f114548 movss dword ptr [r13 + 0x48], xmm0
145917615: f3410f104570 movss xmm0, dword ptr [r13 + 0x70]
14591761b: 0f57c9 xorps xmm1, xmm1
14591761e: 0f2ec1 ucomiss xmm0, xmm1
145917621: 0f86d9010000 jbe 0x145917800
145917627: 41807d7d00 cmp byte ptr [r13 + 0x7d], 0
14591762c: 0f84ce010000 je 0x145917800
145917632: f2410f104540 movsd xmm0, qword ptr [r13 + 0x40]
145917638: 410f28f1 movaps xmm6, xmm9
14591763c: 0f5cf0 subps xmm6, xmm0
14591763f: f30f16ce movshdup xmm1, xmm6
145917643: 0f28c6 movaps xmm0, xmm6
145917646: e8e42d2f00 call 0x145c0a42f
14591764b: 0f2e05469d4900 ucomiss xmm0, dword ptr [rip + 0x499d46]
145917652: 0f86a8010000 jbe 0x145917800
145917658: f3410f104d70 movss xmm1, dword ptr [r13 + 0x70]
14591765e: f30f598dd8010000 mulss xmm1, dword ptr [rbp + 0x1d8]
145917666: 0f28d1 movaps xmm2, xmm1
145917669: f30f5dd0 minss xmm2, xmm0
14591766d: 0f28da movaps xmm3, xmm2
145917670: f30fc2da03 cmpunordss xmm3, xmm2
145917675: 0f54cb andps xmm1, xmm3
145917678: 0f55da andnps xmm3, xmm2
14591767b: 0f56d9 orps xmm3, xmm1
14591767e: f30f12c0 movsldup xmm0, xmm0
145917682: 0f5ef0 divps xmm6, xmm0
145917685: f2410f104540 movsd xmm0, qword ptr [r13 + 0x40]
14591768b: f3440f12f3 movsldup xmm14, xmm3
145917690: 440f59f6 mulps xmm14, xmm6
145917694: 440f58f0 addps xmm14, xmm0
145917698: f3450f16fe movshdup xmm15, xmm14
14591769d: 488b8548020000 mov rax, qword ptr [rbp + 0x248]
1459176a4: 488bb0b0090000 mov rsi, qword ptr [rax + 0x9b0]
1459176ab: 488d4e10 lea rcx, [rsi + 0x10]
1459176af: 488b8578020000 mov rax, qword ptr [rbp + 0x278]
1459176b6: 48898568020000 mov qword ptr [rbp + 0x268], rax
1459176bd: 488b8580020000 mov rax, qword ptr [rbp + 0x280]
1459176c4: 48898560020000 mov qword ptr [rbp + 0x260], rax
1459176cb: 488b8588020000 mov rax, qword ptr [rbp + 0x288]
1459176d2: 48898558020000 mov qword ptr [rbp + 0x258], rax
1459176d9: 488b8590020000 mov rax, qword ptr [rbp + 0x290]
1459176e0: 48898550020000 mov qword ptr [rbp + 0x250], rax
1459176e7: c685a702000001 mov byte ptr [rbp + 0x2a7], 1
1459176ee: c685a602000001 mov byte ptr [rbp + 0x2a6], 1
1459176f5: c685a502000001 mov byte ptr [rbp + 0x2a5], 1
1459176fc: c685a402000001 mov byte ptr [rbp + 0x2a4], 1
145917703: c685a302000001 mov byte ptr [rbp + 0x2a3], 1
14591770a: c685a202000001 mov byte ptr [rbp + 0x2a2], 1
145917711: c685a102000001 mov byte ptr [rbp + 0x2a1], 1
145917718: c685a002000001 mov byte ptr [rbp + 0x2a0], 1
14591771f: c6859f02000001 mov byte ptr [rbp + 0x29f], 1
145917726: 410f28ce movaps xmm1, xmm14
14591772a: 410f28d7 movaps xmm2, xmm15
14591772e: e80d94f8ff call 0x1458a0b40
145917733: 90 nop
145917734: a801 test al, 1
145917736: 0f85b6000000 jne 0x1459177f2
14591773c: 48837e68ff cmp qword ptr [rsi + 0x68], -1
145917741: 0f84a3000000 je 0x1459177ea
145917747: 488d5668 lea rdx, [rsi + 0x68]
14591774b: 488b8578020000 mov rax, qword ptr [rbp + 0x278]
145917752: 48898568020000 mov qword ptr [rbp + 0x268], rax
145917759: 488b8580020000 mov rax, qword ptr [rbp + 0x280]
145917760: 48898560020000 mov qword ptr [rbp + 0x260], rax
145917767: 488b8588020000 mov rax, qword ptr [rbp + 0x288]
14591776e: 48898558020000 mov qword ptr [rbp + 0x258], rax
145917775: 488b8590020000 mov rax, qword ptr [rbp + 0x290]
14591777c: 48898550020000 mov qword ptr [rbp + 0x250], rax
145917783: c685a702000001 mov byte ptr [rbp + 0x2a7], 1
14591778a: c685a602000001 mov byte ptr [rbp + 0x2a6], 1
145917791: c685a502000001 mov byte ptr [rbp + 0x2a5], 1
145917798: c685a402000001 mov byte ptr [rbp + 0x2a4], 1
14591779f: c685a302000001 mov byte ptr [rbp + 0x2a3], 1
1459177a6: c685a202000001 mov byte ptr [rbp + 0x2a2], 1
1459177ad: c685a102000001 mov byte ptr [rbp + 0x2a1], 1
1459177b4: c685a002000001 mov byte ptr [rbp + 0x2a0], 1
1459177bb: c6859f02000001 mov byte ptr [rbp + 0x29f], 1
1459177c2: 488d8de0010000 lea rcx, [rbp + 0x1e0]
1459177c9: 410f28d6 movaps xmm2, xmm14
1459177cd: 410f28df movaps xmm3, xmm15
1459177d1: e88ad5f8ff call 0x1458a4d60
1459177d6: 90 nop
1459177d7: 83bde001000001 cmp dword ptr [rbp + 0x1e0], 1
1459177de: 750a jne 0x1459177ea
1459177e0: f30f1085ec010000 movss xmm0, dword ptr [rbp + 0x1ec]
1459177e8: eb08 jmp 0x1459177f2
1459177ea: f30f1086b8000000 movss xmm0, dword ptr [rsi + 0xb8]
1459177f2: 450f137540 movlps qword ptr [r13 + 0x40], xmm14
1459177f7: f3410f114548 movss dword ptr [r13 + 0x48], xmm0
1459177fd: 0f1f00 nop dword ptr [rax]
145917800: 41837d1006 cmp dword ptr [r13 + 0x10], 6
145917805: 0f8545010000 jne 0x145917950
14591780b: 41837d3002 cmp dword ptr [r13 + 0x30], 2
145917810: 0f853a010000 jne 0x145917950
145917816: 450f28f1 movaps xmm14, xmm9
14591781a: f3450f5c7540 subss xmm14, dword ptr [r13 + 0x40]
145917820: f3450f104538 movss xmm8, dword ptr [r13 + 0x38]
145917826: 450f28fa movaps xmm15, xmm10
14591782a: f3450f5c7d44 subss xmm15, dword ptr [r13 + 0x44]
145917830: 410f28c6 movaps xmm0, xmm14
145917834: 410f28cf movaps xmm1, xmm15
145917838: e8f22b2f00 call 0x145c0a42f
14591783d: 0f28f0 movaps xmm6, xmm0
145917840: f30f5f35185a4900 maxss xmm6, dword ptr [rip + 0x495a18]
145917848: 410f28c7 movaps xmm0, xmm15
14591784c: 410f28ce movaps xmm1, xmm14
145917850: e8f22b2f00 call 0x145c0a447
145917855: f3410f11454c movss dword ptr [r13 + 0x4c], xmm0
14591785b: 41c7453002000000 mov dword ptr [r13 + 0x30], 2
145917863: f3410f117534 movss dword ptr [r13 + 0x34], xmm6
145917869: f3450f114538 movss dword ptr [r13 + 0x38], xmm8
14591786f: 41807d7e01 cmp byte ptr [r13 + 0x7e], 1
145917874: 0f85d6000000 jne 0x145917950
14591787a: 0f28c6 movaps xmm0, xmm6
14591787d: f3410f5c4578 subss xmm0, dword ptr [r13 + 0x78]
145917883: 410f54c3 andps xmm0, xmm11
145917887: 0f2e05d2594900 ucomiss xmm0, dword ptr [rip + 0x4959d2]
14591788e: 0f86bc000000 jbe 0x145917950
145917894: f3410f117578 movss dword ptr [r13 + 0x78], xmm6
14591789a: 488bb538010000 mov rsi, qword ptr [rbp + 0x138]
1459178a1: 483bb528010000 cmp rsi, qword ptr [rbp + 0x128]
1459178a8: 0f8584000000 jne 0x145917932
145917932: 488b8530010000 mov rax, qword ptr [rbp + 0x130]
145917939: 4c8934f0 mov qword ptr [rax + rsi*8], r14
14591793d: 48ffc6 inc rsi
145917940: 4889b538010000 mov qword ptr [rbp + 0x138], rsi
145917947: 660f1f840000000000 nop word ptr [rax + rax]
145917950: 418b4510 mov eax, dword ptr [r13 + 0x10]
145917954: 83f804 cmp eax, 4
145917957: 0f85fd020000 jne 0x145917c5a
14591795d: f30f108534020000 movss xmm0, dword ptr [rbp + 0x234]
145917965: 410f2e4514 ucomiss xmm0, dword ptr [r13 + 0x14]
14591796a: 0f8296050000 jb 0x145917f06
145917970: f3410f104d54 movss xmm1, dword ptr [r13 + 0x54]
145917976: 0f2ec8 ucomiss xmm1, xmm0
145917979: 0f8687050000 jbe 0x145917f06
1459179b8: 440f2ec0 ucomiss xmm8, xmm0
1459179bc: 0f82fe000000 jb 0x145917ac0
1459179c2: e98f020000 jmp 0x145917c56
145917ac0: f3410f107560 movss xmm6, dword ptr [r13 + 0x60]
145917ac6: 498b4520 mov rax, qword ptr [r13 + 0x20]
145917aca: 488985a8010000 mov qword ptr [rbp + 0x1a8], rax
145917ad1: 418b7d5c mov edi, dword ptr [r13 + 0x5c]
145917ad5: 488bb578010000 mov rsi, qword ptr [rbp + 0x178]
145917adc: 483bb568010000 cmp rsi, qword ptr [rbp + 0x168]
145917ae3: 0f8584000000 jne 0x145917b6d
145917b6d: 488b8570010000 mov rax, qword ptr [rbp + 0x170]
145917b74: 488d0c76 lea rcx, [rsi + rsi*2]
145917b78: 488b95a8010000 mov rdx, qword ptr [rbp + 0x1a8]
145917b7f: 488914c8 mov qword ptr [rax + rcx*8], rdx
145917b83: 897cc808 mov dword ptr [rax + rcx*8 + 8], edi
145917b87: 440f134cc80c movlps qword ptr [rax + rcx*8 + 0xc], xmm9
145917b8d: f30f108528020000 movss xmm0, dword ptr [rbp + 0x228]
145917b95: f30f1144c814 movss dword ptr [rax + rcx*8 + 0x14], xmm0
145917b9b: 48ffc6 inc rsi
145917b9e: 4889b578010000 mov qword ptr [rbp + 0x178], rsi
145917ba5: f30f108538020000 movss xmm0, dword ptr [rbp + 0x238]
145917bad: f30f58c6 addss xmm0, xmm6
145917bb1: f30f118538020000 movss dword ptr [rbp + 0x238], xmm0
145917bb9: 488bb5c0010000 mov rsi, qword ptr [rbp + 0x1c0]
145917bc0: 483bb5b0010000 cmp rsi, qword ptr [rbp + 0x1b0]
145917bc7: 0f85d3f6ffff jne 0x1459172a0
145917c5a: 83f803 cmp eax, 3
145917c5d: 0f85a3020000 jne 0x145917f06
145917c63: b001 mov al, 1
145917c65: 41807d7d00 cmp byte ptr [r13 + 0x7d], 0
145917c6a: 741a je 0x145917c86
145917c6c: f3410f10451c movss xmm0, dword ptr [r13 + 0x1c]
145917c72: f30f5985d8010000 mulss xmm0, dword ptr [rbp + 0x1d8]
145917c7a: f3410f58454c addss xmm0, dword ptr [r13 + 0x4c]
145917c80: f3410f11454c movss dword ptr [r13 + 0x4c], xmm0
1459185b0: 84c0 test al, al
1459185b2: 0f8410050000 je 0x145918ac8
1459185b8: f30f108538020000 movss xmm0, dword ptr [rbp + 0x238]
1459185c0: f3410f584560 addss xmm0, dword ptr [r13 + 0x60]
1459185c6: f30f118538020000 movss dword ptr [rbp + 0x238], xmm0
1459185ce: 498b7d20 mov rdi, qword ptr [r13 + 0x20]
1459185d2: 4889bda8010000 mov qword ptr [rbp + 0x1a8], rdi
1459185d9: e9ee040000 jmp 0x145918acc
145918ac8: 498b7d20 mov rdi, qword ptr [r13 + 0x20]
145918acc: 418b451c mov eax, dword ptr [r13 + 0x1c]
145918ad0: 898570020000 mov dword ptr [rbp + 0x270], eax
145918ad6: 418b455c mov eax, dword ptr [r13 + 0x5c]
145918ada: 8985d0000000 mov dword ptr [rbp + 0xd0], eax
145918ae0: 8b4608 mov eax, dword ptr [rsi + 8]
145918ae3: 8985e8010000 mov dword ptr [rbp + 0x1e8], eax
145918ae9: 488b06 mov rax, qword ptr [rsi]
145918aec: 488985e0010000 mov qword ptr [rbp + 0x1e0], rax
145918af3: 488bb578010000 mov rsi, qword ptr [rbp + 0x178]
145918afa: 483bb568010000 cmp rsi, qword ptr [rbp + 0x168]
145918b01: 0f8584000000 jne 0x145918b8b
145918b8b: 488b8570010000 mov rax, qword ptr [rbp + 0x170]
145918b92: 488d0c76 lea rcx, [rsi + rsi*2]
145918b96: 48893cc8 mov qword ptr [rax + rcx*8], rdi
145918b9a: 8b95d0000000 mov edx, dword ptr [rbp + 0xd0]
145918ba0: 8954c808 mov dword ptr [rax + rcx*8 + 8], edx
145918ba4: 488b95e0010000 mov rdx, qword ptr [rbp + 0x1e0]
145918bab: 488954c80c mov qword ptr [rax + rcx*8 + 0xc], rdx
145918bb0: 8b95e8010000 mov edx, dword ptr [rbp + 0x1e8]
145918bb6: 8954c814 mov dword ptr [rax + rcx*8 + 0x14], edx
145918bba: 48ffc6 inc rsi
145918bbd: 4889b578010000 mov qword ptr [rbp + 0x178], rsi
145918bc4: 41c6457d01 mov byte ptr [r13 + 0x7d], 1
145918bc9: f30f108534020000 movss xmm0, dword ptr [rbp + 0x234]
145918bd1: f30f580587464900 addss xmm0, dword ptr [rip + 0x494687]
145918bd9: f3410f114568 movss dword ptr [r13 + 0x68], xmm0
145918bdf: 41c7455800000000 mov dword ptr [r13 + 0x58], 0
145918be7: 83bd7002000000 cmp dword ptr [rbp + 0x270], 0
145918bee: 7408 je 0x145918bf8
145918bf0: 49c74528ffffffff mov qword ptr [r13 + 0x28], 0xffffffffffffffff
145918bf8: 488bb538010000 mov rsi, qword ptr [rbp + 0x138]
145918bff: 483bb528010000 cmp rsi, qword ptr [rbp + 0x128]
145918c06: 0f853e020000 jne 0x145918e4a
145918cad: 41807d0000 cmp byte ptr [r13], 0
145918cb2: 0f8489020000 je 0x145918f41
145918cb8: 498b7d08 mov rdi, qword ptr [r13 + 8]
145918cbc: 8b4608 mov eax, dword ptr [rsi + 8]
145918cbf: 8985e8010000 mov dword ptr [rbp + 0x1e8], eax
145918cc5: 488b06 mov rax, qword ptr [rsi]
145918cc8: 488985e0010000 mov qword ptr [rbp + 0x1e0], rax
145918ccf: 488bb5a8000000 mov rsi, qword ptr [rbp + 0xa8]
145918cd6: 483bb598000000 cmp rsi, qword ptr [rbp + 0x98]
145918cdd: 0f8584000000 jne 0x145918d67
145918d67: 488b85a0000000 mov rax, qword ptr [rbp + 0xa0]
145918d6e: 488d0c76 lea rcx, [rsi + rsi*2]
145918d72: 48893cc8 mov qword ptr [rax + rcx*8], rdi
145918d76: 488b95e0010000 mov rdx, qword ptr [rbp + 0x1e0]
145918d7d: 488954c808 mov qword ptr [rax + rcx*8 + 8], rdx
145918d82: 8b95e8010000 mov edx, dword ptr [rbp + 0x1e8]
145918d88: 8954c810 mov dword ptr [rax + rcx*8 + 0x10], edx
145918d8c: 48ffc6 inc rsi
145918d8f: 4889b5a8000000 mov qword ptr [rbp + 0xa8], rsi
145918d96: 498d7540 lea rsi, [r13 + 0x40]
145918d9a: e9a2010000 jmp 0x145918f41
145918e4a: 488b8530010000 mov rax, qword ptr [rbp + 0x130]
145918e51: 4c8934f0 mov qword ptr [rax + rsi*8], r14
145918e55: 48ffc6 inc rsi
145918e58: 4889b538010000 mov qword ptr [rbp + 0x138], rsi
145918e5f: e9ce030000 jmp 0x145919232
14591925c: f30f108d34020000 movss xmm1, dword ptr [rbp + 0x234]
145919264: 410f2e4d14 ucomiss xmm1, dword ptr [r13 + 0x14]
145919269: 0f8374030000 jae 0x1459195e3
14591926f: f3410f104568 movss xmm0, dword ptr [r13 + 0x68]
145919275: 0f2ec8 ucomiss xmm1, xmm0
145919278: 0f8237e0ffff jb 0x1459172b5
14591927e: f3410f104d18 movss xmm1, dword ptr [r13 + 0x18]
145919284: f30f118d70020000 movss dword ptr [rbp + 0x270], xmm1
14591928c: f30f5805cc3f4900 addss xmm0, dword ptr [rip + 0x493fcc]
145919294: f3410f114568 movss dword ptr [r13 + 0x68], xmm0
14591929a: f3450f10454c movss xmm8, dword ptr [r13 + 0x4c]
1459192a0: f2410f104540 movsd xmm0, qword ptr [r13 + 0x40]
1459192a6: 450f28f1 movaps xmm14, xmm9
1459192aa: 440f5cf0 subps xmm14, xmm0
1459192ae: f3410f16f6 movshdup xmm6, xmm14
1459192b3: 410f28c6 movaps xmm0, xmm14
1459192b7: 0f28ce movaps xmm1, xmm6
1459192ba: e870112f00 call 0x145c0a42f
1459192bf: 418b4530 mov eax, dword ptr [r13 + 0x30]
1459192c3: f3450f107d34 movss xmm15, dword ptr [r13 + 0x34]
1459192c9: 488d0de82f2f01 lea rcx, [rip + 0x12f2fe8]
1459192d0: 48630481 movsxd rax, dword ptr [rcx + rax*4]
1459192d4: 4801c8 add rax, rcx
1459192d7: ffe0 jmp rax
1459192d9: 440f2ef8 ucomiss xmm15, xmm0
1459192dd: 0f82d2dfffff jb 0x1459172b5
1459192e3: e987050000 jmp 0x14591986f
1459192e8: f30f108d34020000 movss xmm1, dword ptr [rbp + 0x234]
1459192f0: 410f2e4d14 ucomiss xmm1, dword ptr [r13 + 0x14]
1459192f5: 0f83ae010000 jae 0x1459194a9
1459192fb: f3410f104568 movss xmm0, dword ptr [r13 + 0x68]
145919301: 0f2ec8 ucomiss xmm1, xmm0
145919304: 0f82abdfffff jb 0x1459172b5
14591930a: f3410f584518 addss xmm0, dword ptr [r13 + 0x18]
145919310: f3410f114568 movss dword ptr [r13 + 0x68], xmm0
145919316: f3450f10454c movss xmm8, dword ptr [r13 + 0x4c]
14591931c: f2410f104540 movsd xmm0, qword ptr [r13 + 0x40]
145919322: 450f28f1 movaps xmm14, xmm9
145919326: 440f5cf0 subps xmm14, xmm0
14591932a: f3410f16f6 movshdup xmm6, xmm14
14591932f: 410f28c6 movaps xmm0, xmm14
145919333: 0f28ce movaps xmm1, xmm6
145919336: e8f4102f00 call 0x145c0a42f
14591933b: 418b4530 mov eax, dword ptr [r13 + 0x30]
14591933f: f3450f107d34 movss xmm15, dword ptr [r13 + 0x34]
145919345: 488d0d5c2f2f01 lea rcx, [rip + 0x12f2f5c]
14591934c: 48630481 movsxd rax, dword ptr [rcx + rax*4]
145919350: 4801c8 add rax, rcx
145919353: ffe0 jmp rax
145919355: 440f2ef8 ucomiss xmm15, xmm0
145919359: 0f8256dfffff jb 0x1459172b5
14591935f: e96f040000 jmp 0x1459197d3
145919364: f3450f107514 movss xmm14, dword ptr [r13 + 0x14]
14591936a: f3450f104518 movss xmm8, dword ptr [r13 + 0x18]
145919370: 410f28c1 movaps xmm0, xmm9
145919374: f3410f5c4540 subss xmm0, dword ptr [r13 + 0x40]
14591937a: f3410f10751c movss xmm6, dword ptr [r13 + 0x1c]
145919380: 410f28ca movaps xmm1, xmm10
145919384: f3410f5c4d44 subss xmm1, dword ptr [r13 + 0x44]
14591938a: e8a0102f00 call 0x145c0a42f
14591938f: 410f2ec6 ucomiss xmm0, xmm14
145919393: 0f87ad010000 ja 0x145919546
145919399: f30f108d34020000 movss xmm1, dword ptr [rbp + 0x234]
1459193a1: 410f2ec8 ucomiss xmm1, xmm8
1459193a5: 0f839b010000 jae 0x145919546
1459193ab: f3410f104568 movss xmm0, dword ptr [r13 + 0x68]
1459193b1: 0f2ec8 ucomiss xmm1, xmm0
1459193b4: 0f82fbdeffff jb 0x1459172b5
1459193ba: f30f58c7 addss xmm0, xmm7
1459193be: f3410f114568 movss dword ptr [r13 + 0x68], xmm0
1459193c4: f3450f107560 movss xmm14, dword ptr [r13 + 0x60]
1459193ca: 498b4520 mov rax, qword ptr [r13 + 0x20]
1459193ce: 488985a8010000 mov qword ptr [rbp + 0x1a8], rax
1459193d5: 418b7d5c mov edi, dword ptr [r13 + 0x5c]
1459193d9: 488b7560 mov rsi, qword ptr [rbp + 0x60]
1459193dd: 483b7550 cmp rsi, qword ptr [rbp + 0x50]
1459193e1: 0f8581000000 jne 0x145919468
145919468: 488b4558 mov rax, qword ptr [rbp + 0x58]
14591946c: 4889f1 mov rcx, rsi
14591946f: 48c1e104 shl rcx, 4
145919473: 488b95a8010000 mov rdx, qword ptr [rbp + 0x1a8]
14591947a: 48891408 mov qword ptr [rax + rcx], rdx
14591947e: f30f11740808 movss dword ptr [rax + rcx + 8], xmm6
145919484: 897c080c mov dword ptr [rax + rcx + 0xc], edi
145919488: 48ffc6 inc rsi
14591948b: 48897560 mov qword ptr [rbp + 0x60], rsi
14591948f: f30f108538020000 movss xmm0, dword ptr [rbp + 0x238]
145919497: f3410f58c6 addss xmm0, xmm14
14591949c: f30f118538020000 movss dword ptr [rbp + 0x238], xmm0
1459194a4: e90cdeffff jmp 0x1459172b5
145919680: 410f28c0 movaps xmm0, xmm8
145919684: e88e0d2f00 call 0x145c0a417
145919689: 0f28f0 movaps xmm6, xmm0
14591968c: 410f28c0 movaps xmm0, xmm8
145919690: e87c0d2f00 call 0x145c0a411
145919695: 0f28d6 movaps xmm2, xmm6
145919698: 0f14d0 unpcklps xmm2, xmm0
14591969b: 410f59d6 mulps xmm2, xmm14
14591969f: f30f16ca movshdup xmm1, xmm2
1459196a3: f30f58ca addss xmm1, xmm2
1459196a7: 0f57d2 xorps xmm2, xmm2
1459196aa: 0f2eca ucomiss xmm1, xmm2
1459196ad: 0f8202dcffff jb 0x1459172b5
1459196b3: 440f2ef9 ucomiss xmm15, xmm1
1459196b7: 0f82f8dbffff jb 0x1459172b5
1459196bd: 0f14c6 unpcklps xmm0, xmm6
1459196c0: 440f59f0 mulps xmm14, xmm0
1459196c4: f3410f16c6 movshdup xmm0, xmm14
1459196c9: f3410f5cc6 subss xmm0, xmm14
1459196ce: 410f54c3 andps xmm0, xmm11
1459196d2: f3410f104d38 movss xmm1, dword ptr [r13 + 0x38]
1459196d8: f30f59cf mulss xmm1, xmm7
1459196dc: e9e9000000 jmp 0x1459197ca
1459197ca: 0f2ec8 ucomiss xmm1, xmm0
1459197cd: 0f82e2daffff jb 0x1459172b5
1459197d3: f30f108538020000 movss xmm0, dword ptr [rbp + 0x238]
1459197db: f3410f584560 addss xmm0, dword ptr [r13 + 0x60]
1459197e1: e999000000 jmp 0x14591987f
14591986f: f30f108538020000 movss xmm0, dword ptr [rbp + 0x238]
145919877: f30f588570020000 addss xmm0, dword ptr [rbp + 0x270]
14591987f: f30f118538020000 movss dword ptr [rbp + 0x238], xmm0
145919887: 498b4520 mov rax, qword ptr [r13 + 0x20]
14591988b: 488985a8010000 mov qword ptr [rbp + 0x1a8], rax
145919892: e91edaffff jmp 0x1459172b5
145919cc1: 498bb424a0050000 mov rsi, qword ptr [r12 + 0x5a0]
145919cc9: 31db xor ebx, ebx
145919ccb: 4c8d75d8 lea r14, [rbp - 0x28]
145919ccf: 90 nop
145919cd0: 4839f3 cmp rbx, rsi
145919cd3: 0f831a010000 jae 0x145919df3
145919cd9: 4889df mov rdi, rbx
145919cdc: 498b9424a0050000 mov rdx, qword ptr [r12 + 0x5a0]
145919ce4: 4839d3 cmp rbx, rdx
145919ce7: 0f8384190000 jae 0x14591b671
145919ced: 488d5f01 lea rbx, [rdi + 1]
145919cf1: 498b8c2498050000 mov rcx, qword ptr [r12 + 0x598]
145919cf9: 4989ff mov r15, rdi
145919cfc: 49c1e707 shl r15, 7
145919d00: 4a837c3928ff cmp qword ptr [rcx + r15 + 0x28], -1
145919d06: 75c8 jne 0x145919cd0
145919d08: 4c01f9 add rcx, r15
145919d0b: 448b4110 mov r8d, dword ptr [rcx + 0x10]
145919d0f: 8b411c mov eax, dword ptr [rcx + 0x1c]
145919d12: f30f105934 movss xmm3, dword ptr [rcx + 0x34]
145919d17: 4183f002 xor r8d, 2
145919d1b: 440b4130 or r8d, dword ptr [rcx + 0x30]
145919d1f: 410f95c0 setne r8b
145919d23: 448b4948 mov r9d, dword ptr [rcx + 0x48]
145919d27: 44894de0 mov dword ptr [rbp - 0x20], r9d
145919d2b: 488b4940 mov rcx, qword ptr [rcx + 0x40]
145919d2f: 48894dd8 mov qword ptr [rbp - 0x28], rcx
145919d33: 85c0 test eax, eax
145919d35: 0f94c1 sete cl
145919d38: 4408c1 or cl, r8b
145919d3b: 7407 je 0x145919d44
145919d3d: 31c0 xor eax, eax
145919d3f: e994000000 jmp 0x145919dd8
145919d44: 488b8d78020000 mov rcx, qword ptr [rbp + 0x278]
145919d4b: 48898d68020000 mov qword ptr [rbp + 0x268], rcx
145919d52: 488b8d80020000 mov rcx, qword ptr [rbp + 0x280]
145919d59: 48898d60020000 mov qword ptr [rbp + 0x260], rcx
145919d60: 488b8d88020000 mov rcx, qword ptr [rbp + 0x288]
145919d67: 48898d58020000 mov qword ptr [rbp + 0x258], rcx
145919d6e: 488b8d90020000 mov rcx, qword ptr [rbp + 0x290]
145919d75: 48898d50020000 mov qword ptr [rbp + 0x250], rcx
145919d7c: c685a702000001 mov byte ptr [rbp + 0x2a7], 1
145919d83: c685a602000001 mov byte ptr [rbp + 0x2a6], 1
145919d8a: c685a502000001 mov byte ptr [rbp + 0x2a5], 1
145919d91: c685a402000001 mov byte ptr [rbp + 0x2a4], 1
145919d98: c685a302000001 mov byte ptr [rbp + 0x2a3], 1
145919d9f: c685a202000001 mov byte ptr [rbp + 0x2a2], 1
145919da6: c685a102000001 mov byte ptr [rbp + 0x2a1], 1
145919dad: c685a002000001 mov byte ptr [rbp + 0x2a0], 1
145919db4: c6859f02000001 mov byte ptr [rbp + 0x29f], 1
145919dbb: 4c89e1 mov rcx, r12
145919dbe: 89c2 mov edx, eax
145919dc0: 4d89f0 mov r8, r14
145919dc3: e8081f0100 call 0x14592bcd0
145919dc8: 90 nop
145919dc9: 4c8ba548020000 mov r12, qword ptr [rbp + 0x248]
145919dd0: 498b9424a0050000 mov rdx, qword ptr [r12 + 0x5a0]
145919dd8: 4839d7 cmp rdi, rdx
145919ddb: 0f83031a0000 jae 0x14591b7e4
145919de1: 498b8c2498050000 mov rcx, qword ptr [r12 + 0x598]
145919de9: 4a89443928 mov qword ptr [rcx + r15 + 0x28], rax
145919dee: e9ddfeffff jmp 0x145919cd0
14591afd0: 488b8598000000 mov rax, qword ptr [rbp + 0x98]
14591afd7: 48898538020000 mov qword ptr [rbp + 0x238], rax
14591afde: 488b85a0000000 mov rax, qword ptr [rbp + 0xa0]
14591afe5: 48898570020000 mov qword ptr [rbp + 0x270], rax
14591afec: 488b85a8000000 mov rax, qword ptr [rbp + 0xa8]
14591aff3: 4885c0 test rax, rax
14591aff6: 7458 je 0x14591b050
14591aff8: 488d0440 lea rax, [rax + rax*2]
14591affc: 4c8bb570020000 mov r14, qword ptr [rbp + 0x270]
14591b003: 498d34c6 lea rsi, [r14 + rax*8]
14591b007: 488d9de4010000 lea rbx, [rbp + 0x1e4]
14591b00e: 488dbde0010000 lea rdi, [rbp + 0x1e0]
14591b015: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
14591b020: 498b16 mov rdx, qword ptr [r14]
14591b023: 418b4610 mov eax, dword ptr [r14 + 0x10]
14591b027: 894308 mov dword ptr [rbx + 8], eax
14591b02a: 498b4608 mov rax, qword ptr [r14 + 8]
14591b02e: 488903 mov qword ptr [rbx], rax
14591b031: c785e001000001000000 mov dword ptr [rbp + 0x1e0], 1
14591b03b: 4c89f9 mov rcx, r15
14591b03e: 4989f8 mov r8, rdi
14591b041: e84a2d0200 call 0x14593dd90
14591b046: 90 nop
14591b047: 4983c618 add r14, 0x18
14591b04b: 4939f6 cmp r14, rsi
14591b04e: 75d0 jne 0x14591b020
14591b296: 488b8548020000 mov rax, qword ptr [rbp + 0x248]
14591b29d: 488b9070050000 mov rdx, qword ptr [rax + 0x570]
14591b2a4: 4885d2 test rdx, rdx
14591b2a7: 74dd je 0x14591b286
14591b2a9: 488b01 mov rax, qword ptr [rcx]
14591b2ac: f30f104108 movss xmm0, dword ptr [rcx + 8]
14591b2b1: 488b8d48020000 mov rcx, qword ptr [rbp + 0x248]
14591b2b8: 488b8968050000 mov rcx, qword ptr [rcx + 0x568]
14591b2bf: 4869d2d8010000 imul rdx, rdx, 0x1d8
14591b2c6: eb18 jmp 0x14591b2e0
14591b2d0: 4881c1d8010000 add rcx, 0x1d8
14591b2d7: 4881c228feffff add rdx, -0x1d8
14591b2de: 74a6 je 0x14591b286
14591b2e0: 483981f0000000 cmp qword ptr [rcx + 0xf0], rax
14591b2e7: 75e7 jne 0x14591b2d0
14591b2e9: 83b9b000000001 cmp dword ptr [rcx + 0xb0], 1
14591b2f0: 74de je 0x14591b2d0
14591b2f2: f30f588534020000 addss xmm0, dword ptr [rbp + 0x234]
14591b2fa: f30f1181cc010000 movss dword ptr [rcx + 0x1cc], xmm0
14591b302: c781c801000000000000 mov dword ptr [rcx + 0x1c8], 0
14591b397: 488b4550 mov rax, qword ptr [rbp + 0x50]
14591b39b: 48898570020000 mov qword ptr [rbp + 0x270], rax
14591b3a2: 488b4558 mov rax, qword ptr [rbp + 0x58]
14591b3a6: 488b7560 mov rsi, qword ptr [rbp + 0x60]
14591b3aa: 48c1e604 shl rsi, 4
14591b3ae: 48898538020000 mov qword ptr [rbp + 0x238], rax
14591b3b5: 488b9d48020000 mov rbx, qword ptr [rbp + 0x248]
14591b3bc: 0f1f4000 nop dword ptr [rax]
14591b3c0: 4885f6 test rsi, rsi
14591b3c3: 7422 je 0x14591b3e7
14591b3c5: 488d7810 lea rdi, [rax + 0x10]
14591b3c9: 488b10 mov rdx, qword ptr [rax]
14591b3cc: f30f105008 movss xmm2, dword ptr [rax + 8]
14591b3d1: 448b480c mov r9d, dword ptr [rax + 0xc]
14591b3d5: 4883c6f0 add rsi, -0x10
14591b3d9: 4889d9 mov rcx, rbx
14591b3dc: e8ffa7ffff call 0x145915be0
14591b3e1: 90 nop
14591b3e2: 4889f8 mov rax, rdi
14591b3e5: ebd9 jmp 0x14591b3c0
