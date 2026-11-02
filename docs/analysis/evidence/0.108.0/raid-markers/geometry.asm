140116c00: 55 push rbp
140116c01: 4157 push r15
140116c03: 4156 push r14
140116c05: 4155 push r13
140116c07: 4154 push r12
140116c09: 56 push rsi
140116c0a: 57 push rdi
140116c0b: 53 push rbx
140116c0c: 4881ecf8040000 sub rsp, 0x4f8
140116c13: 488dac2480000000 lea rbp, [rsp + 0x80]
140116c1b: 440f29bd60040000 movaps xmmword ptr [rbp + 0x460], xmm15
140116c23: 440f29b550040000 movaps xmmword ptr [rbp + 0x450], xmm14
140116c2b: 440f29ad40040000 movaps xmmword ptr [rbp + 0x440], xmm13
140116c33: 440f29a530040000 movaps xmmword ptr [rbp + 0x430], xmm12
140116c3b: 440f299d20040000 movaps xmmword ptr [rbp + 0x420], xmm11
140116c43: 440f299510040000 movaps xmmword ptr [rbp + 0x410], xmm10
140116c4b: 440f298d00040000 movaps xmmword ptr [rbp + 0x400], xmm9
140116c53: 440f2985f0030000 movaps xmmword ptr [rbp + 0x3f0], xmm8
140116c5b: 0f29bde0030000 movaps xmmword ptr [rbp + 0x3e0], xmm7
140116c62: 0f29b5d0030000 movaps xmmword ptr [rbp + 0x3d0], xmm6
140116c69: 48c785c8030000feffffff mov qword ptr [rbp + 0x3c8], 0xfffffffffffffffe
140116c74: 488b85e8040000 mov rax, qword ptr [rbp + 0x4e8]
140116c7b: 488b8de0040000 mov rcx, qword ptr [rbp + 0x4e0]
140116c82: 0f1002 movups xmm0, xmmword ptr [rdx]
140116c85: 0f104a10 movups xmm1, xmmword ptr [rdx + 0x10]
140116c89: 0f294d00 movaps xmmword ptr [rbp], xmm1
140116c8d: 0f2945f0 movaps xmmword ptr [rbp - 0x10], xmm0
140116c91: 410f1000 movups xmm0, xmmword ptr [r8]
140116c95: 410f104810 movups xmm1, xmmword ptr [r8 + 0x10]
140116c9a: 0f294d20 movaps xmmword ptr [rbp + 0x20], xmm1
140116c9e: 0f294510 movaps xmmword ptr [rbp + 0x10], xmm0
140116ca2: 410f1001 movups xmm0, xmmword ptr [r9]
140116ca6: 410f104910 movups xmm1, xmmword ptr [r9 + 0x10]
140116cab: 0f294d40 movaps xmmword ptr [rbp + 0x40], xmm1
140116caf: 0f294530 movaps xmmword ptr [rbp + 0x30], xmm0
140116cb3: 488b5110 mov rdx, qword ptr [rcx + 0x10]
140116cb7: 48895560 mov qword ptr [rbp + 0x60], rdx
140116cbb: 0f1001 movups xmm0, xmmword ptr [rcx]
140116cbe: 0f294550 movaps xmmword ptr [rbp + 0x50], xmm0
140116cc2: 0f1000 movups xmm0, xmmword ptr [rax]
140116cc5: 0f104810 movups xmm1, xmmword ptr [rax + 0x10]
140116cc9: 0f114d78 movups xmmword ptr [rbp + 0x78], xmm1
140116ccd: 0f114568 movups xmmword ptr [rbp + 0x68], xmm0
140116cd1: 488b7510 mov rsi, qword ptr [rbp + 0x10]
140116cd5: 488b4d68 mov rcx, qword ptr [rbp + 0x68]
140116cd9: 48837e1800 cmp qword ptr [rsi + 0x18], 0
140116cde: 0f8592050000 jne 0x140117276
140116ce4: 48898de8000000 mov qword ptr [rbp + 0xe8], rcx
140116ceb: 48c7859000000008000000 mov qword ptr [rbp + 0x90], 8
140116cf6: 48b80001020304050607 movabs rax, 0x706050403020100
140116d00: 48898598000000 mov qword ptr [rbp + 0x98], rax
140116d07: 8b452c mov eax, dword ptr [rbp + 0x2c]
140116d0a: 898530030000 mov dword ptr [rbp + 0x330], eax
140116d10: 488b4520 mov rax, qword ptr [rbp + 0x20]
140116d14: 48898590030000 mov qword ptr [rbp + 0x390], rax
140116d1b: 8b454c mov eax, dword ptr [rbp + 0x4c]
140116d1e: 8985f0010000 mov dword ptr [rbp + 0x1f0], eax
140116d24: 488b4540 mov rax, qword ptr [rbp + 0x40]
140116d28: 48898500010000 mov qword ptr [rbp + 0x100], rax
140116d2f: 488b5d30 mov rbx, qword ptr [rbp + 0x30]
140116d33: f30f103d55b5c805 movss xmm7, dword ptr [rip + 0x5c8b555]
140116d3b: f2440f1005dc9ecb05 movsd xmm8, qword ptr [rip + 0x5cb9edc]
140116d44: f3440f100dcb9ecb05 movss xmm9, dword ptr [rip + 0x5cb9ecb]
140116d4d: 4c8dbd10010000 lea r15, [rbp + 0x110]
140116d54: 4c8dadf8020000 lea r13, [rbp + 0x2f8]
140116d5b: 31c0 xor eax, eax
140116d5d: 4889b5c0000000 mov qword ptr [rbp + 0xc0], rsi
140116d64: 48899df0000000 mov qword ptr [rbp + 0xf0], rbx
140116d6b: eb0a jmp 0x140116d77
140116d6d: 0f1f00 nop dword ptr [rax]
140116d70: 488b85e0020000 mov rax, qword ptr [rbp + 0x2e0]
140116d77: 4883f808 cmp rax, 8
140116d7b: 0f84ee040000 je 0x14011726f
140116d81: 488d4801 lea rcx, [rax + 1]
140116d85: 48898de0020000 mov qword ptr [rbp + 0x2e0], rcx
140116d8c: 48898d88000000 mov qword ptr [rbp + 0x88], rcx
140116d93: 440fb6840598000000 movzx r8d, byte ptr [rbp + rax + 0x98]
140116d9c: 8b8530030000 mov eax, dword ptr [rbp + 0x330]
140116da2: 488b8d90030000 mov rcx, qword ptr [rbp + 0x390]
140116da9: 8901 mov dword ptr [rcx], eax
140116dab: 8b85f0010000 mov eax, dword ptr [rbp + 0x1f0]
140116db1: 488b8d00010000 mov rcx, qword ptr [rbp + 0x100]
140116db8: 8901 mov dword ptr [rcx], eax
140116dba: 4489c0 mov eax, r8d
140116dbd: c1e002 shl eax, 2
140116dc0: 488d0de1c3cb05 lea rcx, [rip + 0x5cbc3e1]
140116dc7: 8b0c08 mov ecx, dword ptr [rax + rcx]
140116dca: 488d15f7c3cb05 lea rdx, [rip + 0x5cbc3f7]
140116dd1: 8b0410 mov eax, dword ptr [rax + rdx]
140116dd4: 898d2c030000 mov dword ptr [rbp + 0x32c], ecx
140116dda: 39c8 cmp eax, ecx
140116ddc: 0f42c8 cmovb ecx, eax
140116ddf: 0f57c0 xorps xmm0, xmm0
140116de2: f30f2ac1 cvtsi2ss xmm0, ecx
140116de6: 898528030000 mov dword ptr [rbp + 0x328], eax
140116dec: 488d8d2c030000 lea rcx, [rbp + 0x32c]
140116df3: 48898d10010000 mov qword ptr [rbp + 0x110], rcx
140116dfa: 488d8d28030000 lea rcx, [rbp + 0x328]
140116e01: 48898d18010000 mov qword ptr [rbp + 0x118], rcx
140116e08: 488d8d8f030000 lea rcx, [rbp + 0x38f]
140116e0f: 48898d20010000 mov qword ptr [rbp + 0x120], rcx
140116e16: 488d8ddc000000 lea rcx, [rbp + 0xdc]
140116e1d: 48898d28010000 mov qword ptr [rbp + 0x128], rcx
140116e24: c7853001000000000000 mov dword ptr [rbp + 0x130], 0
140116e2e: 898534010000 mov dword ptr [rbp + 0x134], eax
140116e34: 44898570030000 mov dword ptr [rbp + 0x370], r8d
140116e3b: 4488858f030000 mov byte ptr [rbp + 0x38f], r8b
140116e42: 0f28cf movaps xmm1, xmm7
140116e45: f30f5ec8 divss xmm1, xmm0
140116e49: f30f118ddc000000 movss dword ptr [rbp + 0xdc], xmm1
140116e51: c68550010000ff mov byte ptr [rbp + 0x150], 0xff
140116e58: c6856c010000ff mov byte ptr [rbp + 0x16c], 0xff
140116e5f: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140116e66: 4c89fa mov rdx, r15
140116e69: e802f20900 call 0x1401b6070
140116e6e: 8b852c030000 mov eax, dword ptr [rbp + 0x32c]
140116e74: 898524030000 mov dword ptr [rbp + 0x324], eax
140116e7a: 8b8528030000 mov eax, dword ptr [rbp + 0x328]
140116e80: 898520030000 mov dword ptr [rbp + 0x320], eax
140116e86: 48c7854003000000000000 mov qword ptr [rbp + 0x340], 0
140116e91: 48c7854803000001000000 mov qword ptr [rbp + 0x348], 1
140116e9c: 48c7855003000000000000 mov qword ptr [rbp + 0x350], 0
140116ea7: 31f6 xor esi, esi
140116ea9: 41be01000000 mov r14d, 1
140116eaf: 31ff xor edi, edi
140116eb1: eb36 jmp 0x140116ee9
140116eb3: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140116ec0: 488b8510020000 mov rax, qword ptr [rbp + 0x210]
140116ec7: 488985b0030000 mov qword ptr [rbp + 0x3b0], rax
140116ece: 0f108500020000 movups xmm0, xmmword ptr [rbp + 0x200]
140116ed5: 0f2985a0030000 movaps xmmword ptr [rbp + 0x3a0], xmm0
140116edc: 899d24030000 mov dword ptr [rbp + 0x324], ebx
140116ee2: 4489a520030000 mov dword ptr [rbp + 0x320], r12d
140116ee9: 488b9da8030000 mov rbx, qword ptr [rbp + 0x3a8]
140116ef0: 488b85b0030000 mov rax, qword ptr [rbp + 0x3b0]
140116ef7: 4c8d2483 lea r12, [rbx + rax*4]
140116efb: 4c39e3 cmp rbx, r12
140116efe: 0f849c000000 je 0x140116fa0
140116f04: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140116f10: f30f1033 movss xmm6, dword ptr [rbx]
140116f14: 488b8540030000 mov rax, qword ptr [rbp + 0x340]
140116f1b: 4829f0 sub rax, rsi
140116f1e: 4883f803 cmp rax, 3
140116f22: 7642 jbe 0x140116f66
140116f24: f3410f59f1 mulss xmm6, xmm9
140116f29: 0f28c6 movaps xmm0, xmm6
140116f2c: e83abaad05 call 0x145bf296b
140116f31: 0f57c9 xorps xmm1, xmm1
140116f34: f30f5fc8 maxss xmm1, xmm0
140116f38: 410f28c1 movaps xmm0, xmm9
140116f3c: f30f5dc1 minss xmm0, xmm1
140116f40: f30f2cc0 cvttss2si eax, xmm0
140116f44: c1e018 shl eax, 0x18
140116f47: 0dffffff00 or eax, 0xffffff
140116f4c: 41890436 mov dword ptr [r14 + rsi], eax
140116f50: 4883c604 add rsi, 4
140116f54: 4889b550030000 mov qword ptr [rbp + 0x350], rsi
140116f5b: 4883c304 add rbx, 4
140116f5f: 4c39e3 cmp rbx, r12
140116f62: 75ac jne 0x140116f10
140116f64: eb3a jmp 0x140116fa0
140116f66: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
140116f6f: 41b804000000 mov r8d, 4
140116f75: 41b901000000 mov r9d, 1
140116f7b: 488d8d40030000 lea rcx, [rbp + 0x340]
140116f82: 4889f2 mov rdx, rsi
140116f85: e806dbad05 call 0x145bf4a90
140116f8a: 90 nop
140116f8b: 4c8bb548030000 mov r14, qword ptr [rbp + 0x348]
140116f92: 488bb550030000 mov rsi, qword ptr [rbp + 0x350]
140116f99: eb89 jmp 0x140116f24
140116f9b: 0f1f440000 nop dword ptr [rax + rax]
140116fa0: ffc7 inc edi
140116fa2: 8b9d24030000 mov ebx, dword ptr [rbp + 0x324]
140116fa8: 89d8 mov eax, ebx
140116faa: 83f001 xor eax, 1
140116fad: 448ba520030000 mov r12d, dword ptr [rbp + 0x320]
140116fb4: 4489e1 mov ecx, r12d
140116fb7: 83f101 xor ecx, 1
140116fba: 09c1 or ecx, eax
140116fbc: 0f84be000000 je 0x140117080
140116fc2: d1eb shr ebx, 1
140116fc4: 83fb01 cmp ebx, 1
140116fc7: 83d300 adc ebx, 0
140116fca: 41d1ec shr r12d, 1
140116fcd: 4183fc01 cmp r12d, 1
140116fd1: 4183d400 adc r12d, 0
140116fd5: 899dd8000000 mov dword ptr [rbp + 0xd8], ebx
140116fdb: 488d85a0030000 lea rax, [rbp + 0x3a0]
140116fe2: 488985f8020000 mov qword ptr [rbp + 0x2f8], rax
140116fe9: 488d8520030000 lea rax, [rbp + 0x320]
140116ff0: 48898500030000 mov qword ptr [rbp + 0x300], rax
140116ff7: 488d8524030000 lea rax, [rbp + 0x324]
140116ffe: 48898508030000 mov qword ptr [rbp + 0x308], rax
140117005: c7851001000000000000 mov dword ptr [rbp + 0x110], 0
14011700f: c7852001000000000000 mov dword ptr [rbp + 0x120], 0
140117019: 488d85d8000000 lea rax, [rbp + 0xd8]
140117020: 48898530010000 mov qword ptr [rbp + 0x130], rax
140117027: c7853801000000000000 mov dword ptr [rbp + 0x138], 0
140117031: 4489a53c010000 mov dword ptr [rbp + 0x13c], r12d
140117038: 4c89ad40010000 mov qword ptr [rbp + 0x140], r13
14011703f: 488d8d00020000 lea rcx, [rbp + 0x200]
140117046: 4c89fa mov rdx, r15
140117049: e892ed0900 call 0x1401b5de0
14011704e: 90 nop
14011704f: 488b95a0030000 mov rdx, qword ptr [rbp + 0x3a0]
140117056: 4885d2 test rdx, rdx
140117059: 0f8461feffff je 0x140116ec0
14011705f: 488b8da8030000 mov rcx, qword ptr [rbp + 0x3a8]
140117066: 48c1e202 shl rdx, 2
14011706a: 41b804000000 mov r8d, 4
140117070: e85bb1eeff call 0x1400021d0
140117075: e946feffff jmp 0x140116ec0
14011707a: 660f1f440000 nop word ptr [rax + rax]
140117080: 8b852c030000 mov eax, dword ptr [rbp + 0x32c]
140117086: 8b8d28030000 mov ecx, dword ptr [rbp + 0x328]
14011708c: 0f108540030000 movups xmm0, xmmword ptr [rbp + 0x340]
140117093: 0f298500020000 movaps xmmword ptr [rbp + 0x200], xmm0
14011709a: 488b9550030000 mov rdx, qword ptr [rbp + 0x350]
1401170a1: 48899510020000 mov qword ptr [rbp + 0x210], rdx
1401170a8: 48c78518020000ffffffff mov qword ptr [rbp + 0x218], 0xffffffffffffffff
1401170b3: f2440f118530020000 movsd qword ptr [rbp + 0x230], xmm8
1401170bc: 66c785380200001000 mov word ptr [rbp + 0x238], 0x10
1401170c5: 48ba010101000000ffff movabs rdx, 0xffff000000010101
1401170cf: 4889953a020000 mov qword ptr [rbp + 0x23a], rdx
1401170d6: c7854802000002000000 mov dword ptr [rbp + 0x248], 2
1401170e0: 48c7859002000000000000 mov qword ptr [rbp + 0x290], 0
1401170eb: 8985a0020000 mov dword ptr [rbp + 0x2a0], eax
1401170f1: 898da4020000 mov dword ptr [rbp + 0x2a4], ecx
1401170f7: c785a802000001000000 mov dword ptr [rbp + 0x2a8], 1
140117101: 89bdac020000 mov dword ptr [rbp + 0x2ac], edi
140117107: c785b002000001000000 mov dword ptr [rbp + 0x2b0], 1
140117111: c785b402000001000000 mov dword ptr [rbp + 0x2b4], 1
14011711b: c785b802000016000000 mov dword ptr [rbp + 0x2b8], 0x16
140117125: c785c402000007000000 mov dword ptr [rbp + 0x2c4], 7
14011712f: 48c785c802000004000000 mov qword ptr [rbp + 0x2c8], 4
14011713a: 48c785d002000000000000 mov qword ptr [rbp + 0x2d0], 0
140117145: 66c785d80200000000 mov word ptr [rbp + 0x2d8], 0
14011714e: c685da02000002 mov byte ptr [rbp + 0x2da], 2
140117155: 488b95a0030000 mov rdx, qword ptr [rbp + 0x3a0]
14011715c: 4885d2 test rdx, rdx
14011715f: 7416 je 0x140117177
140117161: 488b8da8030000 mov rcx, qword ptr [rbp + 0x3a8]
140117168: 48c1e202 shl rdx, 2
14011716c: 41b804000000 mov r8d, 4
140117172: e859b0eeff call 0x1400021d0
140117177: 488b9df0000000 mov rbx, qword ptr [rbp + 0xf0]
14011717e: 488b4b50 mov rcx, qword ptr [rbx + 0x50]
140117182: 4883c110 add rcx, 0x10
140117186: c685c603000001 mov byte ptr [rbp + 0x3c6], 1
14011718d: e8be558404 call 0x14495c750
140117192: 90 nop
140117193: 89c6 mov esi, eax
140117195: 89d7 mov edi, edx
140117197: 41b8e0000000 mov r8d, 0xe0
14011719d: 4c89f9 mov rcx, r15
1401171a0: 488d9500020000 lea rdx, [rbp + 0x200]
1401171a7: e88fb7ad05 call 0x145bf293b
1401171ac: c685c603000000 mov byte ptr [rbp + 0x3c6], 0
1401171b3: 4c897c2420 mov qword ptr [rsp + 0x20], r15
1401171b8: 4c89e9 mov rcx, r13
1401171bb: 4889da mov rdx, rbx
1401171be: 4189f0 mov r8d, esi
1401171c1: 4189f9 mov r9d, edi
1401171c4: e8a706f7ff call 0x140087870
1401171c9: 90 nop
1401171ca: 83bdf802000002 cmp dword ptr [rbp + 0x2f8], 2
1401171d1: 0f8508200000 jne 0x1401191df
1401171d7: 48c78510010000ffffffff mov qword ptr [rbp + 0x110], 0xffffffffffffffff
1401171e2: c685c603000000 mov byte ptr [rbp + 0x3c6], 0
1401171e9: 4c897c2420 mov qword ptr [rsp + 0x20], r15
1401171ee: 48c744242800000000 mov qword ptr [rsp + 0x28], 0
1401171f7: 4889d9 mov rcx, rbx
1401171fa: 89f2 mov edx, esi
1401171fc: 4189f8 mov r8d, edi
1401171ff: 4531c9 xor r9d, r9d
140117202: e8c9808504 call 0x14496f2d0
140117207: 90 nop
140117208: 48898518010000 mov qword ptr [rbp + 0x118], rax
14011720f: c6851001000000 mov byte ptr [rbp + 0x110], 0
140117216: 488d8d58030000 lea rcx, [rbp + 0x358]
14011721d: 488bb5c0000000 mov rsi, qword ptr [rbp + 0xc0]
140117224: 4889f2 mov rdx, rsi
140117227: 448b8570030000 mov r8d, dword ptr [rbp + 0x370]
14011722e: 4d89f9 mov r9, r15
140117231: e86a290600 call 0x140179ba0
140117236: 0fb68558030000 movzx eax, byte ptr [rbp + 0x358]
14011723d: 3c02 cmp al, 2
14011723f: 0f842bfbffff je 0x140116d70
140117245: 84c0 test al, al
140117247: 0f8523fbffff jne 0x140116d70
14011724d: 488b8560030000 mov rax, qword ptr [rbp + 0x360]
140117254: f048ff08 lock dec qword ptr [rax]
140117258: 0f8512fbffff jne 0x140116d70
14011725e: 488d8d60030000 lea rcx, [rbp + 0x360]
140117265: e896798604 call 0x14497ec00
14011726a: e901fbffff jmp 0x140116d70
14011726f: 488b8de8000000 mov rcx, qword ptr [rbp + 0xe8]
140117276: 488d4550 lea rax, [rbp + 0x50]
14011727a: f30f10415c movss xmm0, dword ptr [rcx + 0x5c]
14011727f: 488b4df0 mov rcx, qword ptr [rbp - 0x10]
140117283: 488b5500 mov rdx, qword ptr [rbp]
140117287: f30f5c411c subss xmm0, dword ptr [rcx + 0x1c]
14011728c: 0f57c9 xorps xmm1, xmm1
14011728f: f30f5fc8 maxss xmm1, xmm0
140117293: f30f10056db1c805 movss xmm0, dword ptr [rip + 0x5c8b16d]
14011729b: f30f5dc1 minss xmm0, xmm1
14011729f: f30f584118 addss xmm0, dword ptr [rcx + 0x18]
1401172a4: f30f1185e8000000 movss dword ptr [rbp + 0xe8], xmm0
1401172ac: 48898510030000 mov qword ptr [rbp + 0x310], rax
1401172b3: 4889b518030000 mov qword ptr [rbp + 0x318], rsi
1401172ba: 48c785f802000000000000 mov qword ptr [rbp + 0x2f8], 0
1401172c5: 48c7850003000004000000 mov qword ptr [rbp + 0x300], 4
1401172d0: 48c7850803000000000000 mov qword ptr [rbp + 0x308], 0
1401172db: 8b450c mov eax, dword ptr [rbp + 0xc]
1401172de: 8902 mov dword ptr [rdx], eax
1401172e0: 4c8b7908 mov r15, qword ptr [rcx + 8]
1401172e4: 4c8b6910 mov r13, qword ptr [rcx + 0x10]
1401172e8: 49c1e507 shl r13, 7
1401172ec: 4d01fd add r13, r15
1401172ef: 488dbd29010000 lea rdi, [rbp + 0x129]
1401172f6: 440f281dd2b1c805 movaps xmm11, xmmword ptr [rip + 0x5c8b1d2]
1401172fe: 488d9d00020000 lea rbx, [rbp + 0x200]
140117305: 4c8da510010000 lea r12, [rbp + 0x110]
14011730c: f3440f1005c794cb05 movss xmm8, dword ptr [rip + 0x5cb94c7]
140117315: eb22 jmp 0x140117339
140117317: 660f1f840000000000 nop word ptr [rax + rax]
140117320: 4983ef80 sub r15, -0x80
140117324: 488b8520010000 mov rax, qword ptr [rbp + 0x120]
14011732b: 48894610 mov qword ptr [rsi + 0x10], rax
14011732f: 0f288510010000 movaps xmm0, xmmword ptr [rbp + 0x110]
140117336: 0f1106 movups xmmword ptr [rsi], xmm0
140117339: 4d39ef cmp r15, r13
14011733c: 0f84151e0000 je 0x140119157
140117342: 410fb6777d movzx esi, byte ptr [r15 + 0x7d]
140117347: 4080fe01 cmp sil, 1
14011734b: 770b ja 0x140117358
14011734d: 41837f3000 cmp dword ptr [r15 + 0x30], 0
140117352: 0f846f050000 je 0x1401178c7
140117358: 4531f6 xor r14d, r14d
14011735b: f3440f1025ac02c805 movss xmm12, dword ptr [rip + 0x5c802ac]
140117364: f3450f116778 movss dword ptr [r15 + 0x78], xmm12
14011736a: 498d5760 lea rdx, [r15 + 0x60]
14011736e: f3410f107f6c movss xmm7, dword ptr [r15 + 0x6c]
140117374: 41807f4000 cmp byte ptr [r15 + 0x40], 0
140117379: 7445 je 0x1401173c0
14011737b: f3410f104744 movss xmm0, dword ptr [r15 + 0x44]
140117381: 410f2e4760 ucomiss xmm0, dword ptr [r15 + 0x60]
140117386: 7538 jne 0x1401173c0
140117388: 7a36 jp 0x1401173c0
14011738a: f3410f104748 movss xmm0, dword ptr [r15 + 0x48]
140117390: 410f2e4764 ucomiss xmm0, dword ptr [r15 + 0x64]
140117395: 7529 jne 0x1401173c0
140117397: 7a27 jp 0x1401173c0
140117399: f3410f10474c movss xmm0, dword ptr [r15 + 0x4c]
14011739f: 410f2e4768 ucomiss xmm0, dword ptr [r15 + 0x68]
1401173a4: 751a jne 0x1401173c0
1401173a6: 7a18 jp 0x1401173c0
1401173a8: f3410f104750 movss xmm0, dword ptr [r15 + 0x50]
1401173ae: 0f2ec7 ucomiss xmm0, xmm7
1401173b1: 750d jne 0x1401173c0
1401173b3: 0f8b69140000 jnp 0x140118822
1401173b9: 0f1f8000000000 nop dword ptr [rax]
1401173c0: 440f29a5e0020000 movaps xmmword ptr [rbp + 0x2e0], xmm12
1401173c8: 418b4754 mov eax, dword ptr [r15 + 0x54]
1401173cc: f3450f106758 movss xmm12, dword ptr [r15 + 0x58]
1401173d2: f3450f106f5c movss xmm13, dword ptr [r15 + 0x5c]
1401173d8: 8b4a08 mov ecx, dword ptr [rdx + 8]
1401173db: 898d60030000 mov dword ptr [rbp + 0x360], ecx
1401173e1: 488b0a mov rcx, qword ptr [rdx]
1401173e4: 48898d58030000 mov qword ptr [rbp + 0x358], rcx
1401173eb: 48c785a003000000000000 mov qword ptr [rbp + 0x3a0], 0
1401173f6: 48c785a803000008000000 mov qword ptr [rbp + 0x3a8], 8
140117401: 48c785b003000000000000 mov qword ptr [rbp + 0x3b0], 0
14011740c: 83f803 cmp eax, 3
14011740f: 0f851b020000 jne 0x140117630
140117415: 440f2e2d1398cb05 ucomiss xmm13, dword ptr [rip + 0x5cb9813]
14011741d: 0f820d020000 jb 0x140117630
140117423: 410f28f4 movaps xmm6, xmm12
140117427: f30f5935f192cb05 mulss xmm6, dword ptr [rip + 0x5cb92f1]
14011742f: f30f5d3599edc805 minss xmm6, dword ptr [rip + 0x5c8ed99]
140117437: 410f28c4 movaps xmm0, xmm12
14011743b: 410f57c3 xorps xmm0, xmm11
14011743f: 410f28cc movaps xmm1, xmm12
140117443: f30f590dd9ebc805 mulss xmm1, dword ptr [rip + 0x5c8ebd9]
14011744b: f30f580de503c805 addss xmm1, dword ptr [rip + 0x5c803e5]
140117453: f30f109558030000 movss xmm2, dword ptr [rbp + 0x358]
14011745b: f30f109d5c030000 movss xmm3, dword ptr [rbp + 0x35c]
140117463: 0f28e3 movaps xmm4, xmm3
140117466: 410f57e3 xorps xmm4, xmm11
14011746a: f30f10ad60030000 movss xmm5, dword ptr [rbp + 0x360]
140117472: 0f28fa movaps xmm7, xmm2
140117475: 410f57fb xorps xmm7, xmm11
140117479: 440f28c1 movaps xmm8, xmm1
14011747d: 450f57c3 xorps xmm8, xmm11
140117481: f30f11a500020000 movss dword ptr [rbp + 0x200], xmm4
140117489: f30f11ad04020000 movss dword ptr [rbp + 0x204], xmm5
140117491: f30f11bd08020000 movss dword ptr [rbp + 0x208], xmm7
140117499: f20f10253f93cb05 movsd xmm4, qword ptr [rip + 0x5cb933f]
1401174a1: f20f11a50c020000 movsd qword ptr [rbp + 0x20c], xmm4
1401174a9: f30f118514020000 movss dword ptr [rbp + 0x214], xmm0
1401174b1: f3440f11a518020000 movss dword ptr [rbp + 0x218], xmm12
1401174ba: f30f11851c020000 movss dword ptr [rbp + 0x21c], xmm0
1401174c2: f3440f11a520020000 movss dword ptr [rbp + 0x220], xmm12
1401174cb: f3440f118524020000 movss dword ptr [rbp + 0x224], xmm8
1401174d4: f30f118d28020000 movss dword ptr [rbp + 0x228], xmm1
1401174dc: f30f115c2430 movss dword ptr [rsp + 0x30], xmm3
1401174e2: f30f11542428 movss dword ptr [rsp + 0x28], xmm2
1401174e8: 48895c2420 mov qword ptr [rsp + 0x20], rbx
1401174ed: 48c744244000000000 mov qword ptr [rsp + 0x40], 0
1401174f6: 48c744243804000000 mov qword ptr [rsp + 0x38], 4
1401174ff: 4c89e1 mov rcx, r12
140117502: 488d95f8020000 lea rdx, [rbp + 0x2f8]
140117509: 4531c0 xor r8d, r8d
14011750c: 4531c9 xor r9d, r9d
14011750f: e81c57fdff call 0x1400ecc30
140117514: 90 nop
140117515: 4c8ba5b0030000 mov r12, qword ptr [rbp + 0x3b0]
14011751c: 4c3ba5a0030000 cmp r12, qword ptr [rbp + 0x3a0]
140117523: 750d jne 0x140117532
140117525: 488d8da0030000 lea rcx, [rbp + 0x3a0]
14011752c: e85fd8ad05 call 0x145bf4d90
140117531: 90 nop
140117532: 488b85a8030000 mov rax, qword ptr [rbp + 0x3a8]
140117539: 4b8d0c64 lea rcx, [r12 + r12*2]
14011753d: 48c1e104 shl rcx, 4
140117541: 0f108510010000 movups xmm0, xmmword ptr [rbp + 0x110]
140117548: 0f108d20010000 movups xmm1, xmmword ptr [rbp + 0x120]
14011754f: 0f109530010000 movups xmm2, xmmword ptr [rbp + 0x130]
140117556: 0f11540820 movups xmmword ptr [rax + rcx + 0x20], xmm2
14011755b: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
140117560: 0f110408 movups xmmword ptr [rax + rcx], xmm0
140117564: 49ffc4 inc r12
140117567: 4c89a5b0030000 mov qword ptr [rbp + 0x3b0], r12
14011756e: f30f11742440 movss dword ptr [rsp + 0x40], xmm6
140117574: f3440f11642428 movss dword ptr [rsp + 0x28], xmm12
14011757b: 488d8558030000 lea rax, [rbp + 0x358]
140117582: 4889442420 mov qword ptr [rsp + 0x20], rax
140117587: c7442438db0fc940 mov dword ptr [rsp + 0x38], 0x40c90fdb
14011758f: c744243000000000 mov dword ptr [rsp + 0x30], 0
140117597: 488d8d10010000 lea rcx, [rbp + 0x110]
14011759e: 488d95f8020000 lea rdx, [rbp + 0x2f8]
1401175a5: 41b001 mov r8b, 1
1401175a8: 41b104 mov r9b, 4
1401175ab: e8d04ffdff call 0x1400ec580
1401175b0: 90 nop
1401175b1: 4c8ba5b0030000 mov r12, qword ptr [rbp + 0x3b0]
1401175b8: 4c3ba5a0030000 cmp r12, qword ptr [rbp + 0x3a0]
1401175bf: 750d jne 0x1401175ce
1401175c1: 488d8da0030000 lea rcx, [rbp + 0x3a0]
1401175c8: e8c3d7ad05 call 0x145bf4d90
1401175cd: 90 nop
1401175ce: 488b85a8030000 mov rax, qword ptr [rbp + 0x3a8]
1401175d5: 4b8d0c64 lea rcx, [r12 + r12*2]
1401175d9: 48c1e104 shl rcx, 4
1401175dd: 0f108510010000 movups xmm0, xmmword ptr [rbp + 0x110]
1401175e4: 0f108d20010000 movups xmm1, xmmword ptr [rbp + 0x120]
1401175eb: f30f6f9530010000 movdqu xmm2, xmmword ptr [rbp + 0x130]
1401175f3: f30f7f540820 movdqu xmmword ptr [rax + rcx + 0x20], xmm2
1401175f9: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
1401175fe: 0f110408 movups xmmword ptr [rax + rcx], xmm0
140117602: 49ffc4 inc r12
140117605: 4c89a5b0030000 mov qword ptr [rbp + 0x3b0], r12
14011760c: 440f28a5e0020000 movaps xmm12, xmmword ptr [rbp + 0x2e0]
140117614: 4080fe01 cmp sil, 1
140117618: 0f84a20f0000 je 0x1401185c0
14011761e: e935110000 jmp 0x140118758
140117623: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140117630: 89c0 mov eax, eax
140117632: 488d0d4fbccb05 lea rcx, [rip + 0x5cbbc4f]
140117639: 48630481 movsxd rax, dword ptr [rcx + rax*4]
14011763d: 4801c8 add rax, rcx
140117640: ffe0 jmp rax
140117642: 410f28f5 movaps xmm6, xmm13
140117646: f3410f5cf4 subss xmm6, xmm12
14011764b: f30f5935cd90cb05 mulss xmm6, dword ptr [rip + 0x5cb90cd]
140117653: f30f5d3575ebc805 minss xmm6, dword ptr [rip + 0x5c8eb75]
14011765b: f3440f11642430 movss dword ptr [rsp + 0x30], xmm12
140117662: f3440f116c2428 movss dword ptr [rsp + 0x28], xmm13
140117669: 488d8558030000 lea rax, [rbp + 0x358]
140117670: 4889442420 mov qword ptr [rsp + 0x20], rax
140117675: 4c89e1 mov rcx, r12
140117678: 488d95f8020000 lea rdx, [rbp + 0x2f8]
14011767f: 4531c0 xor r8d, r8d
140117682: 4531c9 xor r9d, r9d
140117685: e88662fdff call 0x1400ed910
14011768a: 90 nop
14011768b: 4c8ba5b0030000 mov r12, qword ptr [rbp + 0x3b0]
140117692: 4c3ba5a0030000 cmp r12, qword ptr [rbp + 0x3a0]
140117699: 750d jne 0x1401176a8
14011769b: 488d8da0030000 lea rcx, [rbp + 0x3a0]
1401176a2: e8e9d6ad05 call 0x145bf4d90
1401176a7: 90 nop
1401176a8: 488b85a8030000 mov rax, qword ptr [rbp + 0x3a8]
1401176af: 4b8d0c64 lea rcx, [r12 + r12*2]
1401176b3: 48c1e104 shl rcx, 4
1401176b7: 0f108510010000 movups xmm0, xmmword ptr [rbp + 0x110]
1401176be: 0f108d20010000 movups xmm1, xmmword ptr [rbp + 0x120]
1401176c5: f30f6f9530010000 movdqu xmm2, xmmword ptr [rbp + 0x130]
1401176cd: f30f7f540820 movdqu xmmword ptr [rax + rcx + 0x20], xmm2
1401176d3: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
1401176d8: 0f110408 movups xmmword ptr [rax + rcx], xmm0
1401176dc: 49ffc4 inc r12
1401176df: 4c89a5b0030000 mov qword ptr [rbp + 0x3b0], r12
1401176e6: f30f11742440 movss dword ptr [rsp + 0x40], xmm6
1401176ec: f3440f116c2428 movss dword ptr [rsp + 0x28], xmm13
1401176f3: 488d8558030000 lea rax, [rbp + 0x358]
1401176fa: 4889442420 mov qword ptr [rsp + 0x20], rax
1401176ff: c7442438db0fc940 mov dword ptr [rsp + 0x38], 0x40c90fdb
140117707: c744243000000000 mov dword ptr [rsp + 0x30], 0
14011770f: 4889d9 mov rcx, rbx
140117712: 488d95f8020000 lea rdx, [rbp + 0x2f8]
140117719: 41b001 mov r8b, 1
14011771c: 41b104 mov r9b, 4
14011771f: e85c4efdff call 0x1400ec580
140117724: 90 nop
140117725: 488d8d10010000 lea rcx, [rbp + 0x110]
14011772c: 4489b530030000 mov dword ptr [rbp + 0x330], r14d
140117733: 4188f6 mov r14b, sil
140117736: 4889fe mov rsi, rdi
140117739: 4c89ef mov rdi, r13
14011773c: c6859f03000001 mov byte ptr [rbp + 0x39f], 1
140117743: f30f11742440 movss dword ptr [rsp + 0x40], xmm6
140117749: f3440f11642428 movss dword ptr [rsp + 0x28], xmm12
140117750: 488d8558030000 lea rax, [rbp + 0x358]
140117757: 4889442420 mov qword ptr [rsp + 0x20], rax
14011775c: c7442438db0fc940 mov dword ptr [rsp + 0x38], 0x40c90fdb
140117764: c744243000000000 mov dword ptr [rsp + 0x30], 0
14011776c: 488d95f8020000 lea rdx, [rbp + 0x2f8]
140117773: 41b001 mov r8b, 1
140117776: 41b104 mov r9b, 4
140117779: e8024efdff call 0x1400ec580
14011777e: 90 nop
14011777f: 488b8510010000 mov rax, qword ptr [rbp + 0x110]
140117786: 48898590030000 mov qword ptr [rbp + 0x390], rax
14011778d: 488b8518010000 mov rax, qword ptr [rbp + 0x118]
140117794: 48898570030000 mov qword ptr [rbp + 0x370], rax
14011779b: 4c8ba520010000 mov r12, qword ptr [rbp + 0x120]
1401177a2: 488b8500020000 mov rax, qword ptr [rbp + 0x200]
1401177a9: 4c8bad10020000 mov r13, qword ptr [rbp + 0x210]
1401177b0: 4c29e8 sub rax, r13
1401177b3: 4939c4 cmp r12, rax
1401177b6: 0f874b190000 ja 0x140119107
1401177bc: 4d85e4 test r12, r12
1401177bf: 440f28a5e0020000 movaps xmm12, xmmword ptr [rbp + 0x2e0]
1401177c7: 742e je 0x1401177f7
1401177c9: 4a8d04a500000000 lea rax, [r12*4]
1401177d1: 4c8d04c0 lea r8, [rax + rax*8]
1401177d5: 4a8d0ced00000000 lea rcx, [r13*8]
1401177dd: 4c01e9 add rcx, r13
1401177e0: 48c1e102 shl rcx, 2
1401177e4: 48038d08020000 add rcx, qword ptr [rbp + 0x208]
1401177eb: 488b9570030000 mov rdx, qword ptr [rbp + 0x370]
1401177f2: e844b1ad05 call 0x145bf293b
1401177f7: 4d01e5 add r13, r12
1401177fa: 4c89ad10020000 mov qword ptr [rbp + 0x210], r13
140117801: 488b8590030000 mov rax, qword ptr [rbp + 0x390]
140117808: 4885c0 test rax, rax
14011780b: 741a je 0x140117827
14011780d: 48c1e002 shl rax, 2
140117811: 488d14c0 lea rdx, [rax + rax*8]
140117815: 41b804000000 mov r8d, 4
14011781b: 488b8d70030000 mov rcx, qword ptr [rbp + 0x370]
140117822: e8a9a9eeff call 0x1400021d0
140117827: 488b8500020000 mov rax, qword ptr [rbp + 0x200]
14011782e: 48898570030000 mov qword ptr [rbp + 0x370], rax
140117835: 488b8508020000 mov rax, qword ptr [rbp + 0x208]
14011783c: 48898590030000 mov qword ptr [rbp + 0x390], rax
140117843: 4c8ba5b0030000 mov r12, qword ptr [rbp + 0x3b0]
14011784a: 4c3ba5a0030000 cmp r12, qword ptr [rbp + 0x3a0]
140117851: 4989fd mov r13, rdi
140117854: 750d jne 0x140117863
140117856: 488d8da0030000 lea rcx, [rbp + 0x3a0]
14011785d: e82ed5ad05 call 0x145bf4d90
140117862: 90 nop
140117863: 488b85a8030000 mov rax, qword ptr [rbp + 0x3a8]
14011786a: 4b8d0c64 lea rcx, [r12 + r12*2]
14011786e: 48c1e104 shl rcx, 4
140117872: 488b9570030000 mov rdx, qword ptr [rbp + 0x370]
140117879: 48891408 mov qword ptr [rax + rcx], rdx
14011787d: 488b9590030000 mov rdx, qword ptr [rbp + 0x390]
140117884: 4889540808 mov qword ptr [rax + rcx + 8], rdx
140117889: 488d9510020000 lea rdx, [rbp + 0x210]
140117890: 0f1002 movups xmm0, xmmword ptr [rdx]
140117893: 0f104a10 movups xmm1, xmmword ptr [rdx + 0x10]
140117897: 0f11440810 movups xmmword ptr [rax + rcx + 0x10], xmm0
14011789c: 0f114c0820 movups xmmword ptr [rax + rcx + 0x20], xmm1
1401178a1: 49ffc4 inc r12
1401178a4: 4c89a5b0030000 mov qword ptr [rbp + 0x3b0], r12
1401178ab: 4889f7 mov rdi, rsi
1401178ae: 4489f6 mov esi, r14d
1401178b1: 448bb530030000 mov r14d, dword ptr [rbp + 0x330]
1401178b8: 4080fe01 cmp sil, 1
1401178bc: 0f84fe0c0000 je 0x1401185c0
1401178c2: e9910e0000 jmp 0x140118758
1401178c7: f3410f104770 movss xmm0, dword ptr [r15 + 0x70]
1401178cd: f3410f104f74 movss xmm1, dword ptr [r15 + 0x74]
1401178d3: f30f1095e8000000 movss xmm2, dword ptr [rbp + 0xe8]
1401178db: f30f5cd0 subss xmm2, xmm0
1401178df: f30f5cc8 subss xmm1, xmm0
1401178e3: f30f5f0d3de7c805 maxss xmm1, dword ptr [rip + 0x5c8e73d]
1401178eb: f30f5ed1 divss xmm2, xmm1
1401178ef: 0f57c0 xorps xmm0, xmm0
1401178f2: f30f5fc2 maxss xmm0, xmm2
1401178f6: f3440f102511fdc705 movss xmm12, dword ptr [rip + 0x5c7fd11]
1401178ff: f3440f5de0 minss xmm12, xmm0
140117904: 41b601 mov r14b, 1
140117907: e958faffff jmp 0x140117364
14011790c: 410f28c5 movaps xmm0, xmm13
140117910: f30f5905088ecb05 mulss xmm0, dword ptr [rip + 0x5cb8e08]
140117918: f30f5d05b0e8c805 minss xmm0, dword ptr [rip + 0x5c8e8b0]
140117920: 0f2985a0000000 movaps xmmword ptr [rbp + 0xa0], xmm0
140117927: f3410f12f5 movsldup xmm6, xmm13
14011792c: 0f59350d93cb05 mulps xmm6, xmmword ptr [rip + 0x5cb930d]
140117933: 440f29a570030000 movaps xmmword ptr [rbp + 0x370], xmm12
14011793b: f30f11bd90030000 movss dword ptr [rbp + 0x390], xmm7
140117943: f30f10bd90030000 movss xmm7, dword ptr [rbp + 0x390]
14011794b: f3410f58f8 addss xmm7, xmm8
140117950: 440f28b570030000 movaps xmm14, xmmword ptr [rbp + 0x370]
140117958: f3440f5935c3e6c805 mulss xmm14, dword ptr [rip + 0x5c8e6c3]
140117961: f3440f5835cefec705 addss xmm14, dword ptr [rip + 0x5c7fece]
14011796a: f3440f10bd58030000 movss xmm15, dword ptr [rbp + 0x358]
140117973: f3440f108d5c030000 movss xmm9, dword ptr [rbp + 0x35c]
14011797c: 450f28c1 movaps xmm8, xmm9
140117980: 450f57c3 xorps xmm8, xmm11
140117984: f3440f109560030000 movss xmm10, dword ptr [rbp + 0x360]
14011798d: 450f28df movaps xmm11, xmm15
140117991: 440f571d37abc805 xorps xmm11, xmmword ptr [rip + 0x5c8ab37]
140117999: 0f28c7 movaps xmm0, xmm7
14011799c: e8d6afad05 call 0x145bf2977
1401179a1: 440f28e0 movaps xmm12, xmm0
1401179a5: f30f11bde4000000 movss dword ptr [rbp + 0xe4], xmm7
1401179ad: 0f28c7 movaps xmm0, xmm7
1401179b0: 0f28bd70030000 movaps xmm7, xmmword ptr [rbp + 0x370]
1401179b7: e8c1afad05 call 0x145bf297d
1401179bc: 410f28ce movaps xmm1, xmm14
1401179c0: 0f570d09abc805 xorps xmm1, xmmword ptr [rip + 0x5c8ab09]
1401179c7: f3440f118500020000 movss dword ptr [rbp + 0x200], xmm8
1401179d0: f3440f1195b0000000 movss dword ptr [rbp + 0xb0], xmm10
1401179d9: f3440f119504020000 movss dword ptr [rbp + 0x204], xmm10
1401179e2: f3440f119d08020000 movss dword ptr [rbp + 0x208], xmm11
1401179eb: f3440f11a5e0000000 movss dword ptr [rbp + 0xe0], xmm12
1401179f4: f3440f11a50c020000 movss dword ptr [rbp + 0x20c], xmm12
1401179fd: 440f28e7 movaps xmm12, xmm7
140117a01: 0f28f8 movaps xmm7, xmm0
140117a04: f30f118510020000 movss dword ptr [rbp + 0x210], xmm0
140117a0c: c7851402000000000000 mov dword ptr [rbp + 0x214], 0
140117a16: f3440f11a518020000 movss dword ptr [rbp + 0x218], xmm12
140117a1f: 0f13b51c020000 movlps qword ptr [rbp + 0x21c], xmm6
140117a26: 0f298df0010000 movaps xmmword ptr [rbp + 0x1f0], xmm1
140117a2d: f30f118d24020000 movss dword ptr [rbp + 0x224], xmm1
140117a35: 440f29b500010000 movaps xmmword ptr [rbp + 0x100], xmm14
140117a3d: f3440f11b528020000 movss dword ptr [rbp + 0x228], xmm14
140117a46: 450f28c1 movaps xmm8, xmm9
140117a4a: f3440f114c2430 movss dword ptr [rsp + 0x30], xmm9
140117a51: f3440f117c2428 movss dword ptr [rsp + 0x28], xmm15
140117a58: 48895c2420 mov qword ptr [rsp + 0x20], rbx
140117a5d: 48c744244000000000 mov qword ptr [rsp + 0x40], 0
140117a66: 48c744243804000000 mov qword ptr [rsp + 0x38], 4
140117a6f: 4c89e1 mov rcx, r12
140117a72: 488d95f8020000 lea rdx, [rbp + 0x2f8]
140117a79: 4531c0 xor r8d, r8d
140117a7c: 41b102 mov r9b, 2
140117a7f: e8ac51fdff call 0x1400ecc30
140117a84: 90 nop
140117a85: 440f29bd30030000 movaps xmmword ptr [rbp + 0x330], xmm15
140117a8d: 440f29adc0000000 movaps xmmword ptr [rbp + 0xc0], xmm13
140117a95: 4c8ba5b0030000 mov r12, qword ptr [rbp + 0x3b0]
140117a9c: 4c3ba5a0030000 cmp r12, qword ptr [rbp + 0x3a0]
140117aa3: 750d jne 0x140117ab2
140117aa5: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140117aac: e8dfd2ad05 call 0x145bf4d90
140117ab1: 90 nop
140117ab2: 488b85a8030000 mov rax, qword ptr [rbp + 0x3a8]
140117ab9: 4b8d0c64 lea rcx, [r12 + r12*2]
140117abd: 48c1e104 shl rcx, 4
140117ac1: 0f108510010000 movups xmm0, xmmword ptr [rbp + 0x110]
140117ac8: f30f6f8d20010000 movdqu xmm1, xmmword ptr [rbp + 0x120]
140117ad0: f30f6f9530010000 movdqu xmm2, xmmword ptr [rbp + 0x130]
140117ad8: f30f7f540820 movdqu xmmword ptr [rax + rcx + 0x20], xmm2
140117ade: f30f7f4c0810 movdqu xmmword ptr [rax + rcx + 0x10], xmm1
140117ae4: 0f110408 movups xmmword ptr [rax + rcx], xmm0
140117ae8: 49ffc4 inc r12
140117aeb: 4c89a5b0030000 mov qword ptr [rbp + 0x3b0], r12
140117af2: f3440f108d90030000 movss xmm9, dword ptr [rbp + 0x390]
140117afb: 410f28c1 movaps xmm0, xmm9
140117aff: e879aead05 call 0x145bf297d
140117b04: 440f28d0 movaps xmm10, xmm0
140117b08: 410f28c1 movaps xmm0, xmm9
140117b0c: e866aead05 call 0x145bf2977
140117b11: 4c8ba518030000 mov r12, qword ptr [rbp + 0x318]
140117b18: c6854003000004 mov byte ptr [rbp + 0x340], 4
140117b1f: 49837c241800 cmp qword ptr [r12 + 0x18], 0
140117b25: 440f288da0000000 movaps xmm9, xmmword ptr [rbp + 0xa0]
140117b2d: 0f8406160000 je 0x140119139
140117b33: 440f28f8 movaps xmm15, xmm0
140117b37: 440f28f7 movaps xmm14, xmm7
140117b3b: 4088b590030000 mov byte ptr [rbp + 0x390], sil
140117b42: f30f16c6 movshdup xmm0, xmm6
140117b46: 410f28ff movaps xmm7, xmm15
140117b4a: f30f59f8 mulss xmm7, xmm0
140117b4e: 0f288d30030000 movaps xmm1, xmmword ptr [rbp + 0x330]
140117b55: f30f58f9 addss xmm7, xmm1
140117b59: f3410f59c2 mulss xmm0, xmm10
140117b5e: 410f28d0 movaps xmm2, xmm8
140117b62: 450f28e8 movaps xmm13, xmm8
140117b66: f3440f5ce8 subss xmm13, xmm0
140117b6b: 450f28df movaps xmm11, xmm15
140117b6f: f3440f59de mulss xmm11, xmm6
140117b74: f3440f58d9 addss xmm11, xmm1
140117b79: f3410f59f2 mulss xmm6, xmm10
140117b7e: f30f5cd6 subss xmm2, xmm6
140117b82: 0f2955d0 movaps xmmword ptr [rbp - 0x30], xmm2
140117b86: f3450f59d4 mulss xmm10, xmm12
140117b8b: f3440f58d7 addss xmm10, xmm7
140117b90: f3450f59fc mulss xmm15, xmm12
140117b95: f3450f58fd addss xmm15, xmm13
140117b9a: 498d4c2420 lea rcx, [r12 + 0x20]
140117b9f: 488d9540030000 lea rdx, [rbp + 0x340]
140117ba6: e815fbefff call 0x1400176c0
140117bab: 4989c0 mov r8, rax
140117bae: 49c1e839 shr r8, 0x39
140117bb2: 498b0c24 mov rcx, qword ptr [r12]
140117bb6: 498b542408 mov rdx, qword ptr [r12 + 8]
140117bbb: 66410f6ec0 movd xmm0, r8d
140117bc0: 660f60c0 punpcklbw xmm0, xmm0
140117bc4: f20f70c000 pshuflw xmm0, xmm0, 0
140117bc9: 660f70c044 pshufd xmm0, xmm0, 0x44
140117bce: 4531c0 xor r8d, r8d
140117bd1: 4821d0 and rax, rdx
140117bd4: f30f6f0c01 movdqu xmm1, xmmword ptr [rcx + rax]
140117bd9: 660f6fd1 movdqa xmm2, xmm1
140117bdd: 660f74d0 pcmpeqb xmm2, xmm0
140117be1: 66440fd7ca pmovmskb r9d, xmm2
140117be6: 4585c9 test r9d, r9d
140117be9: 488db510010000 lea rsi, [rbp + 0x110]
140117bf0: 4c8da5f8020000 lea r12, [rbp + 0x2f8]
140117bf7: 7437 je 0x140117c30
140117bf9: f3450fbcd9 tzcnt r11d, r9d
140117bfe: 4901c3 add r11, rax
140117c01: 4921d3 and r11, rdx
140117c04: 49c1e305 shl r11, 5
140117c08: 4989ca mov r10, rcx
140117c0b: 4d29da sub r10, r11
140117c0e: 41807ae004 cmp byte ptr [r10 - 0x20], 4
140117c13: 0f842c050000 je 0x140118145
140117c19: 458d51ff lea r10d, [r9 - 1]
140117c1d: 664521ca and r10w, r9w
140117c21: 4589d1 mov r9d, r10d
140117c24: 75d3 jne 0x140117bf9
140117c26: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
140117c30: 660f76d2 pcmpeqd xmm2, xmm2
140117c34: 660f74ca pcmpeqb xmm1, xmm2
140117c38: 66440fd7c9 pmovmskb r9d, xmm1
140117c3d: 4585c9 test r9d, r9d
140117c40: 0f85f3140000 jne 0x140119139
140117c46: 4c01c0 add rax, r8
140117c49: 4883c010 add rax, 0x10
140117c4d: 4983c010 add r8, 0x10
140117c51: e97bffffff jmp 0x140117bd1
140117c56: 450f28c4 movaps xmm8, xmm12
140117c5a: f3440f5905bd8acb05 mulss xmm8, dword ptr [rip + 0x5cb8abd]
140117c63: f3440f5d0564e5c805 minss xmm8, dword ptr [rip + 0x5c8e564]
140117c6c: 450f28cd movaps xmm9, xmm13
140117c70: f3440f590d9bf9c705 mulss xmm9, dword ptr [rip + 0x5c7f99b]
140117c79: 410f28c4 movaps xmm0, xmm12
140117c7d: 410f57c3 xorps xmm0, xmm11
140117c81: 450f28fc movaps xmm15, xmm12
140117c85: f3440f593d96e3c805 mulss xmm15, dword ptr [rip + 0x5c8e396]
140117c8e: f3440f583da1fbc705 addss xmm15, dword ptr [rip + 0x5c7fba1]
140117c97: f3440f109558030000 movss xmm10, dword ptr [rbp + 0x358]
140117ca0: f3440f10b55c030000 movss xmm14, dword ptr [rbp + 0x35c]
140117ca9: 410f28ce movaps xmm1, xmm14
140117cad: 410f57cb xorps xmm1, xmm11
140117cb1: f30f109560030000 movss xmm2, dword ptr [rbp + 0x360]
140117cb9: 410f28da movaps xmm3, xmm10
140117cbd: 410f57db xorps xmm3, xmm11
140117cc1: 0f298d00010000 movaps xmmword ptr [rbp + 0x100], xmm1
140117cc8: f30f118d00020000 movss dword ptr [rbp + 0x200], xmm1
140117cd0: f30f1195f0000000 movss dword ptr [rbp + 0xf0], xmm2
140117cd8: f30f119504020000 movss dword ptr [rbp + 0x204], xmm2
140117ce0: 0f299dc0000000 movaps xmmword ptr [rbp + 0xc0], xmm3
140117ce7: f30f119d08020000 movss dword ptr [rbp + 0x208], xmm3
140117cef: f20f100de98acb05 movsd xmm1, qword ptr [rip + 0x5cb8ae9]
140117cf7: f20f118d0c020000 movsd qword ptr [rbp + 0x20c], xmm1
140117cff: f30f118514020000 movss dword ptr [rbp + 0x214], xmm0
140117d07: f3440f11a518020000 movss dword ptr [rbp + 0x218], xmm12
140117d10: f30f11851c020000 movss dword ptr [rbp + 0x21c], xmm0
140117d18: 410f28d5 movaps xmm2, xmm13
140117d1c: 410f28c7 movaps xmm0, xmm15
140117d20: 410f57c3 xorps xmm0, xmm11
140117d24: f3440f11a520020000 movss dword ptr [rbp + 0x220], xmm12
140117d2d: 0f2985a0000000 movaps xmmword ptr [rbp + 0xa0], xmm0
140117d34: f30f118524020000 movss dword ptr [rbp + 0x224], xmm0
140117d3c: f3440f11bd28020000 movss dword ptr [rbp + 0x228], xmm15
140117d45: 488d8d40030000 lea rcx, [rbp + 0x340]
140117d4c: 0f28cf movaps xmm1, xmm7
140117d4f: e8ac02feff call 0x1400f8000
140117d54: 90 nop
140117d55: 488b8d48030000 mov rcx, qword ptr [rbp + 0x348]
140117d5c: 488b8550030000 mov rax, qword ptr [rbp + 0x350]
140117d63: 4889442440 mov qword ptr [rsp + 0x40], rax
140117d68: 48898d70030000 mov qword ptr [rbp + 0x370], rcx
140117d6f: 48894c2438 mov qword ptr [rsp + 0x38], rcx
140117d74: f3440f11742430 movss dword ptr [rsp + 0x30], xmm14
140117d7b: f3440f11542428 movss dword ptr [rsp + 0x28], xmm10
140117d82: 48895c2420 mov qword ptr [rsp + 0x20], rbx
140117d87: 4c89e1 mov rcx, r12
140117d8a: 488d95f8020000 lea rdx, [rbp + 0x2f8]
140117d91: 4531c0 xor r8d, r8d
140117d94: 4531c9 xor r9d, r9d
140117d97: e8944efdff call 0x1400ecc30
140117d9c: 90 nop
140117d9d: 4c8ba5b0030000 mov r12, qword ptr [rbp + 0x3b0]
140117da4: 4c3ba5a0030000 cmp r12, qword ptr [rbp + 0x3a0]
140117dab: 750d jne 0x140117dba
140117dad: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140117db4: e8d7cfad05 call 0x145bf4d90
140117db9: 90 nop
140117dba: 4088b590030000 mov byte ptr [rbp + 0x390], sil
140117dc1: 488b85a8030000 mov rax, qword ptr [rbp + 0x3a8]
140117dc8: 4b8d0c64 lea rcx, [r12 + r12*2]
140117dcc: 48c1e104 shl rcx, 4
140117dd0: 0f108510010000 movups xmm0, xmmword ptr [rbp + 0x110]
140117dd7: 0f108d20010000 movups xmm1, xmmword ptr [rbp + 0x120]
140117dde: f30f6f9530010000 movdqu xmm2, xmmword ptr [rbp + 0x130]
140117de6: f30f7f540820 movdqu xmmword ptr [rax + rcx + 0x20], xmm2
140117dec: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
140117df1: 0f110408 movups xmmword ptr [rax + rcx], xmm0
140117df5: 49ffc4 inc r12
140117df8: 4c89a5b0030000 mov qword ptr [rbp + 0x3b0], r12
140117dff: 488b8540030000 mov rax, qword ptr [rbp + 0x340]
140117e06: 4885c0 test rax, rax
140117e09: 741a je 0x140117e25
140117e0b: 48c1e003 shl rax, 3
140117e0f: 488d1440 lea rdx, [rax + rax*2]
140117e13: 41b804000000 mov r8d, 4
140117e19: 488b8d70030000 mov rcx, qword ptr [rbp + 0x370]
140117e20: e8aba3eeff call 0x1400021d0
140117e25: 0f28f7 movaps xmm6, xmm7
140117e28: f3410f5cf1 subss xmm6, xmm9
140117e2d: f3440f58cf addss xmm9, xmm7
140117e32: f3440f11442440 movss dword ptr [rsp + 0x40], xmm8
140117e39: f3440f114c2438 movss dword ptr [rsp + 0x38], xmm9
140117e40: f30f11742430 movss dword ptr [rsp + 0x30], xmm6
140117e46: f3440f11642428 movss dword ptr [rsp + 0x28], xmm12
140117e4d: 488d8558030000 lea rax, [rbp + 0x358]
140117e54: 4889442420 mov qword ptr [rsp + 0x20], rax
140117e59: 488d8d10010000 lea rcx, [rbp + 0x110]
140117e60: 488d95f8020000 lea rdx, [rbp + 0x2f8]
140117e67: 41b001 mov r8b, 1
140117e6a: 41b104 mov r9b, 4
140117e6d: e80e47fdff call 0x1400ec580
140117e72: 90 nop
140117e73: 4489f6 mov esi, r14d
140117e76: 4d89ee mov r14, r13
140117e79: 4989fd mov r13, rdi
140117e7c: 0f28c7 movaps xmm0, xmm7
140117e7f: e8f9aaad05 call 0x145bf297d
140117e84: 440f299530030000 movaps xmmword ptr [rbp + 0x330], xmm10
140117e8c: 440f28d0 movaps xmm10, xmm0
140117e90: 0f28c7 movaps xmm0, xmm7
140117e93: e8dfaaad05 call 0x145bf2977
140117e98: 0f2985b0000000 movaps xmmword ptr [rbp + 0xb0], xmm0
140117e9f: 410f57c3 xorps xmm0, xmm11
140117ea3: f30f118540030000 movss dword ptr [rbp + 0x340], xmm0
140117eab: f3440f119544030000 movss dword ptr [rbp + 0x344], xmm10
140117eb4: c7854803000000000000 mov dword ptr [rbp + 0x348], 0
140117ebe: 440f29b5f0010000 movaps xmmword ptr [rbp + 0x1f0], xmm14
140117ec6: 410f28fc movaps xmm7, xmm12
140117eca: 450f28e0 movaps xmm12, xmm8
140117ece: 450f57e3 xorps xmm12, xmm11
140117ed2: f30f10050289cb05 movss xmm0, dword ptr [rip + 0x5cb8902]
140117eda: f3440f58c8 addss xmm9, xmm0
140117edf: 410f28c1 movaps xmm0, xmm9
140117ee3: e88faaad05 call 0x145bf2977
140117ee8: 440f28d8 movaps xmm11, xmm0
140117eec: 410f28c1 movaps xmm0, xmm9
140117ef0: e888aaad05 call 0x145bf297d
140117ef5: 440f288d00010000 movaps xmm9, xmmword ptr [rbp + 0x100]
140117efd: f3440f118d00020000 movss dword ptr [rbp + 0x200], xmm9
140117f06: f3440f10b5f0000000 movss xmm14, dword ptr [rbp + 0xf0]
140117f0f: f3440f11b504020000 movss dword ptr [rbp + 0x204], xmm14
140117f18: 440f28adc0000000 movaps xmm13, xmmword ptr [rbp + 0xc0]
140117f20: f3440f11ad08020000 movss dword ptr [rbp + 0x208], xmm13
140117f29: f3440f119d0c020000 movss dword ptr [rbp + 0x20c], xmm11
140117f32: f30f118510020000 movss dword ptr [rbp + 0x210], xmm0
140117f3a: c7851402000000000000 mov dword ptr [rbp + 0x214], 0
140117f44: 0f29bd70030000 movaps xmmword ptr [rbp + 0x370], xmm7
140117f4b: f30f11bd18020000 movss dword ptr [rbp + 0x218], xmm7
140117f53: f3440f11a51c020000 movss dword ptr [rbp + 0x21c], xmm12
140117f5c: f3440f118520020000 movss dword ptr [rbp + 0x220], xmm8
140117f65: 440f289da0000000 movaps xmm11, xmmword ptr [rbp + 0xa0]
140117f6d: f3440f119d24020000 movss dword ptr [rbp + 0x224], xmm11
140117f76: f3440f11bd28020000 movss dword ptr [rbp + 0x228], xmm15
140117f7f: c6859e03000001 mov byte ptr [rbp + 0x39e], 1
140117f86: 488dbd40030000 lea rdi, [rbp + 0x340]
140117f8d: 48897c2428 mov qword ptr [rsp + 0x28], rdi
140117f92: 0f2885f0010000 movaps xmm0, xmmword ptr [rbp + 0x1f0]
140117f99: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
140117f9f: 48c744243001000000 mov qword ptr [rsp + 0x30], 1
140117fa8: 4c8da5f8020000 lea r12, [rbp + 0x2f8]
140117faf: 4c89e1 mov rcx, r12
140117fb2: 488d9510010000 lea rdx, [rbp + 0x110]
140117fb9: 4989d8 mov r8, rbx
140117fbc: 0f289d30030000 movaps xmm3, xmmword ptr [rbp + 0x330]
140117fc3: e8086afdff call 0x1400ee9d0
140117fc8: 90 nop
140117fc9: 440f5715ffa4c805 xorps xmm10, xmmword ptr [rip + 0x5c8a4ff]
140117fd1: 0f2885b0000000 movaps xmm0, xmmword ptr [rbp + 0xb0]
140117fd8: f30f118540030000 movss dword ptr [rbp + 0x340], xmm0
140117fe0: f3440f119544030000 movss dword ptr [rbp + 0x344], xmm10
140117fe9: c7854803000000000000 mov dword ptr [rbp + 0x348], 0
140117ff3: f30f5835e187cb05 addss xmm6, dword ptr [rip + 0x5cb87e1]
140117ffb: 0f28c6 movaps xmm0, xmm6
140117ffe: e874a9ad05 call 0x145bf2977
140118003: 0f28f8 movaps xmm7, xmm0
140118006: 0f28c6 movaps xmm0, xmm6
140118009: e86fa9ad05 call 0x145bf297d
14011800e: f3440f118d00020000 movss dword ptr [rbp + 0x200], xmm9
140118017: f3440f11b504020000 movss dword ptr [rbp + 0x204], xmm14
140118020: f3440f11ad08020000 movss dword ptr [rbp + 0x208], xmm13
140118029: f30f11bd0c020000 movss dword ptr [rbp + 0x20c], xmm7
140118031: f30f118510020000 movss dword ptr [rbp + 0x210], xmm0
140118039: c7851402000000000000 mov dword ptr [rbp + 0x214], 0
140118043: 0f288570030000 movaps xmm0, xmmword ptr [rbp + 0x370]
14011804a: f30f118518020000 movss dword ptr [rbp + 0x218], xmm0
140118052: f3440f11a51c020000 movss dword ptr [rbp + 0x21c], xmm12
14011805b: f3440f118520020000 movss dword ptr [rbp + 0x220], xmm8
140118064: f3440f119d24020000 movss dword ptr [rbp + 0x224], xmm11
14011806d: f3440f11bd28020000 movss dword ptr [rbp + 0x228], xmm15
140118076: c6859e03000001 mov byte ptr [rbp + 0x39e], 1
14011807d: 48897c2428 mov qword ptr [rsp + 0x28], rdi
140118082: 0f2885f0010000 movaps xmm0, xmmword ptr [rbp + 0x1f0]
140118089: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14011808f: 48c744243001000000 mov qword ptr [rsp + 0x30], 1
140118098: 4c89e1 mov rcx, r12
14011809b: 488d9510010000 lea rdx, [rbp + 0x110]
1401180a2: 4989d8 mov r8, rbx
1401180a5: 0f289d30030000 movaps xmm3, xmmword ptr [rbp + 0x330]
1401180ac: e81f69fdff call 0x1400ee9d0
1401180b1: 90 nop
1401180b2: 440f281d16a4c805 movaps xmm11, xmmword ptr [rip + 0x5c8a416]
1401180ba: 488b8510010000 mov rax, qword ptr [rbp + 0x110]
1401180c1: 48898570030000 mov qword ptr [rbp + 0x370], rax
1401180c8: 488b8518010000 mov rax, qword ptr [rbp + 0x118]
1401180cf: 48898530030000 mov qword ptr [rbp + 0x330], rax
1401180d6: 4c8ba5b0030000 mov r12, qword ptr [rbp + 0x3b0]
1401180dd: 4c3ba5a0030000 cmp r12, qword ptr [rbp + 0x3a0]
1401180e4: 750d jne 0x1401180f3
1401180e6: 488d8da0030000 lea rcx, [rbp + 0x3a0]
1401180ed: e89eccad05 call 0x145bf4d90
1401180f2: 90 nop
1401180f3: 488b85a8030000 mov rax, qword ptr [rbp + 0x3a8]
1401180fa: 4b8d0c64 lea rcx, [r12 + r12*2]
1401180fe: 48c1e104 shl rcx, 4
140118102: 488b9570030000 mov rdx, qword ptr [rbp + 0x370]
140118109: 48891408 mov qword ptr [rax + rcx], rdx
14011810d: 488b9530030000 mov rdx, qword ptr [rbp + 0x330]
140118114: 4889540808 mov qword ptr [rax + rcx + 8], rdx
140118119: 4c89ef mov rdi, r13
14011811c: 410f1045f7 movups xmm0, xmmword ptr [r13 - 9]
140118121: 410f104d07 movups xmm1, xmmword ptr [r13 + 7]
140118126: 0f11440810 movups xmmword ptr [rax + rcx + 0x10], xmm0
14011812b: 0f114c0820 movups xmmword ptr [rax + rcx + 0x20], xmm1
140118130: 49ffc4 inc r12
140118133: 4c89a5b0030000 mov qword ptr [rbp + 0x3b0], r12
14011813a: 4d89f5 mov r13, r14
14011813d: 4189f6 mov r14d, esi
140118140: e962040000 jmp 0x1401185a7
140118145: 440f2955e0 movaps xmmword ptr [rbp - 0x20], xmm10
14011814a: 41807ae800 cmp byte ptr [r10 - 0x18], 0
14011814f: 7434 je 0x140118185
140118151: 410fb642eb movzx eax, byte ptr [r10 - 0x15]
140118156: 888502020000 mov byte ptr [rbp + 0x202], al
14011815c: 410fb742e9 movzx eax, word ptr [r10 - 0x17]
140118161: 66898500020000 mov word ptr [rbp + 0x200], ax
140118168: 498d42ec lea rax, [r10 - 0x14]
14011816c: 498d4af0 lea rcx, [r10 - 0x10]
140118170: 458b42f4 mov r8d, dword ptr [r10 - 0xc]
140118174: 410fb652f8 movzx edx, byte ptr [r10 - 8]
140118179: 48c1e220 shl rdx, 0x20
14011817d: 4c09c2 or rdx, r8
140118180: 41b001 mov r8b, 1
140118183: eb0f jmp 0x140118194
140118185: 498b4af0 mov rcx, qword ptr [r10 - 0x10]
140118189: 488d4168 lea rax, [rcx + 0x68]
14011818d: 4883c16c add rcx, 0x6c
140118191: 4531c0 xor r8d, r8d
140118194: 410f28c8 movaps xmm1, xmm8
140118198: f3440f1085b0000000 movss xmm8, dword ptr [rbp + 0xb0]
1401181a1: 0f289df0010000 movaps xmm3, xmmword ptr [rbp + 0x1f0]
1401181a8: 450f28d1 movaps xmm10, xmm9
1401181ac: 0f298df0000000 movaps xmmword ptr [rbp + 0xf0], xmm1
1401181b3: 8b09 mov ecx, dword ptr [rcx]
1401181b5: 8b00 mov eax, dword ptr [rax]
1401181b7: c6853c01000001 mov byte ptr [rbp + 0x13c], 1
1401181be: 44888528010000 mov byte ptr [rbp + 0x128], r8b
1401181c5: 440fb68502020000 movzx r8d, byte ptr [rbp + 0x202]
1401181cd: 44884702 mov byte ptr [rdi + 2], r8b
1401181d1: 440fb78500020000 movzx r8d, word ptr [rbp + 0x200]
1401181d9: 66448907 mov word ptr [rdi], r8w
1401181dd: 89852c010000 mov dword ptr [rbp + 0x12c], eax
1401181e3: 898d30010000 mov dword ptr [rbp + 0x130], ecx
1401181e9: 48899534010000 mov qword ptr [rbp + 0x134], rdx
1401181f0: 48c7851001000000000000 mov qword ptr [rbp + 0x110], 0
1401181fb: 48c7851801000004000000 mov qword ptr [rbp + 0x118], 4
140118206: 48c7852001000000000000 mov qword ptr [rbp + 0x120], 0
140118211: 410f28f1 movaps xmm6, xmm9
140118215: 0f2805b4a2c805 movaps xmm0, xmmword ptr [rip + 0x5c8a2b4]
14011821c: 0f57f0 xorps xmm6, xmm0
14011821f: 440f57e8 xorps xmm13, xmm0
140118223: 0f57f8 xorps xmm7, xmm0
140118226: f3440f11ad00020000 movss dword ptr [rbp + 0x200], xmm13
14011822f: f3440f118504020000 movss dword ptr [rbp + 0x204], xmm8
140118238: f30f11bd08020000 movss dword ptr [rbp + 0x208], xmm7
140118240: f3440f108de0000000 movss xmm9, dword ptr [rbp + 0xe0]
140118249: f3440f118d0c020000 movss dword ptr [rbp + 0x20c], xmm9
140118252: f3440f11b510020000 movss dword ptr [rbp + 0x210], xmm14
14011825b: c7851402000000000000 mov dword ptr [rbp + 0x214], 0
140118265: f3440f11a518020000 movss dword ptr [rbp + 0x218], xmm12
14011826e: f30f11b51c020000 movss dword ptr [rbp + 0x21c], xmm6
140118276: f3440f119520020000 movss dword ptr [rbp + 0x220], xmm10
14011827f: f30f119d24020000 movss dword ptr [rbp + 0x224], xmm3
140118287: 0f288500010000 movaps xmm0, xmmword ptr [rbp + 0x100]
14011828e: f30f118528020000 movss dword ptr [rbp + 0x228], xmm0
140118296: c685c703000001 mov byte ptr [rbp + 0x3c7], 1
14011829d: f30f114c2420 movss dword ptr [rsp + 0x20], xmm1
1401182a3: 48c744243000000000 mov qword ptr [rsp + 0x30], 0
1401182ac: 48c744242804000000 mov qword ptr [rsp + 0x28], 4
1401182b5: 4c89e1 mov rcx, r12
1401182b8: 4889f2 mov rdx, rsi
1401182bb: 4989d8 mov r8, rbx
1401182be: 0f289d30030000 movaps xmm3, xmmword ptr [rbp + 0x330]
1401182c5: e80667fdff call 0x1400ee9d0
1401182ca: 90 nop
1401182cb: 0f2805fea1c805 movaps xmm0, xmmword ptr [rip + 0x5c8a1fe]
1401182d2: 0f284dd0 movaps xmm1, xmmword ptr [rbp - 0x30]
1401182d6: 0f57c8 xorps xmm1, xmm0
1401182d9: 440f57d8 xorps xmm11, xmm0
1401182dd: f30f118d00020000 movss dword ptr [rbp + 0x200], xmm1
1401182e5: f3440f118504020000 movss dword ptr [rbp + 0x204], xmm8
1401182ee: f3440f119d08020000 movss dword ptr [rbp + 0x208], xmm11
1401182f7: f3440f118d0c020000 movss dword ptr [rbp + 0x20c], xmm9
140118300: f3440f11b510020000 movss dword ptr [rbp + 0x210], xmm14
140118309: c7851402000000000000 mov dword ptr [rbp + 0x214], 0
140118313: f3440f11a518020000 movss dword ptr [rbp + 0x218], xmm12
14011831c: f30f11b51c020000 movss dword ptr [rbp + 0x21c], xmm6
140118324: f3440f119520020000 movss dword ptr [rbp + 0x220], xmm10
14011832d: 0f2885f0010000 movaps xmm0, xmmword ptr [rbp + 0x1f0]
140118334: f30f118524020000 movss dword ptr [rbp + 0x224], xmm0
14011833c: 0f288500010000 movaps xmm0, xmmword ptr [rbp + 0x100]
140118343: f30f118528020000 movss dword ptr [rbp + 0x228], xmm0
14011834b: c685c703000001 mov byte ptr [rbp + 0x3c7], 1
140118352: 0f2885f0000000 movaps xmm0, xmmword ptr [rbp + 0xf0]
140118359: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14011835f: 48c744243000000000 mov qword ptr [rsp + 0x30], 0
140118368: 48c744242804000000 mov qword ptr [rsp + 0x28], 4
140118371: 4c89e1 mov rcx, r12
140118374: 4889f2 mov rdx, rsi
140118377: 4989d8 mov r8, rbx
14011837a: 0f289d30030000 movaps xmm3, xmmword ptr [rbp + 0x330]
140118381: e84a66fdff call 0x1400ee9d0
140118386: 90 nop
140118387: f3440f108de4000000 movss xmm9, dword ptr [rbp + 0xe4]
140118390: f3440f580d4384cb05 addss xmm9, dword ptr [rip + 0x5cb8443]
140118399: 410f28c1 movaps xmm0, xmm9
14011839d: e8d5a5ad05 call 0x145bf2977
1401183a2: 440f28d8 movaps xmm11, xmm0
1401183a6: 410f28c1 movaps xmm0, xmm9
1401183aa: e8cea5ad05 call 0x145bf297d
1401183af: 440f28c8 movaps xmm9, xmm0
1401183b3: f3440f11ad00020000 movss dword ptr [rbp + 0x200], xmm13
1401183bc: f3440f118504020000 movss dword ptr [rbp + 0x204], xmm8
1401183c5: f30f11bd08020000 movss dword ptr [rbp + 0x208], xmm7
1401183cd: f3440f119d0c020000 movss dword ptr [rbp + 0x20c], xmm11
1401183d6: f30f118510020000 movss dword ptr [rbp + 0x210], xmm0
1401183de: c7851402000000000000 mov dword ptr [rbp + 0x214], 0
1401183e8: 0f2885c0000000 movaps xmm0, xmmword ptr [rbp + 0xc0]
1401183ef: f30f118518020000 movss dword ptr [rbp + 0x218], xmm0
1401183f7: f30f11b51c020000 movss dword ptr [rbp + 0x21c], xmm6
1401183ff: f3440f119520020000 movss dword ptr [rbp + 0x220], xmm10
140118408: 0f2885f0010000 movaps xmm0, xmmword ptr [rbp + 0x1f0]
14011840f: f30f118524020000 movss dword ptr [rbp + 0x224], xmm0
140118417: 0f288500010000 movaps xmm0, xmmword ptr [rbp + 0x100]
14011841e: f30f118528020000 movss dword ptr [rbp + 0x228], xmm0
140118426: c685c703000001 mov byte ptr [rbp + 0x3c7], 1
14011842d: 0f2885f0000000 movaps xmm0, xmmword ptr [rbp + 0xf0]
140118434: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14011843a: 48c744243000000000 mov qword ptr [rsp + 0x30], 0
140118443: 48c744242804000000 mov qword ptr [rsp + 0x28], 4
14011844c: 4c89e1 mov rcx, r12
14011844f: 4889f2 mov rdx, rsi
140118452: 4989d8 mov r8, rbx
140118455: 0f289d30030000 movaps xmm3, xmmword ptr [rbp + 0x330]
14011845c: e86f65fdff call 0x1400ee9d0
140118461: 90 nop
140118462: 0f280567a0c805 movaps xmm0, xmmword ptr [rip + 0x5c8a067]
140118469: 440f57f8 xorps xmm15, xmm0
14011846d: 0f284de0 movaps xmm1, xmmword ptr [rbp - 0x20]
140118471: 0f57c8 xorps xmm1, xmm0
140118474: f3440f11bd00020000 movss dword ptr [rbp + 0x200], xmm15
14011847d: f3440f118504020000 movss dword ptr [rbp + 0x204], xmm8
140118486: f30f118d08020000 movss dword ptr [rbp + 0x208], xmm1
14011848e: f3440f119d0c020000 movss dword ptr [rbp + 0x20c], xmm11
140118497: f3440f118d10020000 movss dword ptr [rbp + 0x210], xmm9
1401184a0: c7851402000000000000 mov dword ptr [rbp + 0x214], 0
1401184aa: 0f2885c0000000 movaps xmm0, xmmword ptr [rbp + 0xc0]
1401184b1: f30f118518020000 movss dword ptr [rbp + 0x218], xmm0
1401184b9: f30f11b51c020000 movss dword ptr [rbp + 0x21c], xmm6
1401184c1: f3440f119520020000 movss dword ptr [rbp + 0x220], xmm10
1401184ca: 0f2885f0010000 movaps xmm0, xmmword ptr [rbp + 0x1f0]
1401184d1: f30f118524020000 movss dword ptr [rbp + 0x224], xmm0
1401184d9: 0f288500010000 movaps xmm0, xmmword ptr [rbp + 0x100]
1401184e0: f30f118528020000 movss dword ptr [rbp + 0x228], xmm0
1401184e8: c685c703000001 mov byte ptr [rbp + 0x3c7], 1
1401184ef: 0f2885f0000000 movaps xmm0, xmmword ptr [rbp + 0xf0]
1401184f6: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
1401184fc: 48c744243000000000 mov qword ptr [rsp + 0x30], 0
140118505: 48c744242804000000 mov qword ptr [rsp + 0x28], 4
14011850e: 4c89e1 mov rcx, r12
140118511: 4889f2 mov rdx, rsi
140118514: 4989d8 mov r8, rbx
140118517: 0f289d30030000 movaps xmm3, xmmword ptr [rbp + 0x330]
14011851e: e8ad64fdff call 0x1400ee9d0
140118523: 90 nop
140118524: 488b8510010000 mov rax, qword ptr [rbp + 0x110]
14011852b: 48898570030000 mov qword ptr [rbp + 0x370], rax
140118532: 488b8518010000 mov rax, qword ptr [rbp + 0x118]
140118539: 48898530030000 mov qword ptr [rbp + 0x330], rax
140118540: 4c8ba5b0030000 mov r12, qword ptr [rbp + 0x3b0]
140118547: 4c3ba5a0030000 cmp r12, qword ptr [rbp + 0x3a0]
14011854e: 750d jne 0x14011855d
140118550: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140118557: e834c8ad05 call 0x145bf4d90
14011855c: 90 nop
14011855d: 488b85a8030000 mov rax, qword ptr [rbp + 0x3a8]
140118564: 4b8d0c64 lea rcx, [r12 + r12*2]
140118568: 48c1e104 shl rcx, 4
14011856c: 488b9570030000 mov rdx, qword ptr [rbp + 0x370]
140118573: 48891408 mov qword ptr [rax + rcx], rdx
140118577: 488b9530030000 mov rdx, qword ptr [rbp + 0x330]
14011857e: 4889540808 mov qword ptr [rax + rcx + 8], rdx
140118583: 0f1047f7 movups xmm0, xmmword ptr [rdi - 9]
140118587: 0f104f07 movups xmm1, xmmword ptr [rdi + 7]
14011858b: 0f11440810 movups xmmword ptr [rax + rcx + 0x10], xmm0
140118590: 0f114c0820 movups xmmword ptr [rax + rcx + 0x20], xmm1
140118595: 49ffc4 inc r12
140118598: 4c89a5b0030000 mov qword ptr [rbp + 0x3b0], r12
14011859f: 440f281d299fc805 movaps xmm11, xmmword ptr [rip + 0x5c89f29]
1401185a7: 440f28a5e0020000 movaps xmm12, xmmword ptr [rbp + 0x2e0]
1401185af: 0fb6b590030000 movzx esi, byte ptr [rbp + 0x390]
1401185b6: 4080fe01 cmp sil, 1
1401185ba: 0f8598010000 jne 0x140118758
1401185c0: 488d8558030000 lea rax, [rbp + 0x358]
1401185c7: 4889442420 mov qword ptr [rsp + 0x20], rax
1401185cc: c74424409a99993e mov dword ptr [rsp + 0x40], 0x3e99999a
1401185d4: c7442438db0fc940 mov dword ptr [rsp + 0x38], 0x40c90fdb
1401185dc: c744243000000000 mov dword ptr [rsp + 0x30], 0
1401185e4: c7442428cccc2c3f mov dword ptr [rsp + 0x28], 0x3f2ccccc
1401185ec: 4c8da510010000 lea r12, [rbp + 0x110]
1401185f3: 4c89e1 mov rcx, r12
1401185f6: 488d95f8020000 lea rdx, [rbp + 0x2f8]
1401185fd: 41b004 mov r8b, 4
140118600: 41b104 mov r9b, 4
140118603: e8783ffdff call 0x1400ec580
140118608: 90 nop
140118609: 488bb5b0030000 mov rsi, qword ptr [rbp + 0x3b0]
140118610: 483bb5a0030000 cmp rsi, qword ptr [rbp + 0x3a0]
140118617: 750d jne 0x140118626
140118619: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140118620: e86bc7ad05 call 0x145bf4d90
140118625: 90 nop
140118626: 488b85a8030000 mov rax, qword ptr [rbp + 0x3a8]
14011862d: 488d0c76 lea rcx, [rsi + rsi*2]
140118631: 48c1e104 shl rcx, 4
140118635: 0f108510010000 movups xmm0, xmmword ptr [rbp + 0x110]
14011863c: 0f108d20010000 movups xmm1, xmmword ptr [rbp + 0x120]
140118643: 0f109530010000 movups xmm2, xmmword ptr [rbp + 0x130]
14011864a: 0f11540820 movups xmmword ptr [rax + rcx + 0x20], xmm2
14011864f: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
140118654: 0f110408 movups xmmword ptr [rax + rcx], xmm0
140118658: 48ffc6 inc rsi
14011865b: 4889b5b0030000 mov qword ptr [rbp + 0x3b0], rsi
140118662: f30f108558030000 movss xmm0, dword ptr [rbp + 0x358]
14011866a: f30f108d5c030000 movss xmm1, dword ptr [rbp + 0x35c]
140118672: 0f28d1 movaps xmm2, xmm1
140118675: 410f57d3 xorps xmm2, xmm11
140118679: f30f109d60030000 movss xmm3, dword ptr [rbp + 0x360]
140118681: 0f28e0 movaps xmm4, xmm0
140118684: 410f57e3 xorps xmm4, xmm11
140118688: f30f119500020000 movss dword ptr [rbp + 0x200], xmm2
140118690: f30f119d04020000 movss dword ptr [rbp + 0x204], xmm3
140118698: f30f11a508020000 movss dword ptr [rbp + 0x208], xmm4
1401186a0: 0f2815a985cb05 movaps xmm2, xmmword ptr [rip + 0x5cb85a9]
1401186a7: 0f11950c020000 movups xmmword ptr [rbp + 0x20c], xmm2
1401186ae: 0f2815ab85cb05 movaps xmm2, xmmword ptr [rip + 0x5cb85ab]
1401186b5: 0f11951c020000 movups xmmword ptr [rbp + 0x21c], xmm2
1401186bc: f30f114c2430 movss dword ptr [rsp + 0x30], xmm1
1401186c2: f30f11442428 movss dword ptr [rsp + 0x28], xmm0
1401186c8: 48895c2420 mov qword ptr [rsp + 0x20], rbx
1401186cd: 48c744244000000000 mov qword ptr [rsp + 0x40], 0
1401186d6: 48c744243804000000 mov qword ptr [rsp + 0x38], 4
1401186df: 4c89e1 mov rcx, r12
1401186e2: 488d95f8020000 lea rdx, [rbp + 0x2f8]
1401186e9: 41b005 mov r8b, 5
1401186ec: 41b101 mov r9b, 1
1401186ef: e83c45fdff call 0x1400ecc30
1401186f4: 90 nop
1401186f5: 488bb5b0030000 mov rsi, qword ptr [rbp + 0x3b0]
1401186fc: 483bb5a0030000 cmp rsi, qword ptr [rbp + 0x3a0]
140118703: 750d jne 0x140118712
140118705: 488d8da0030000 lea rcx, [rbp + 0x3a0]
14011870c: e87fc6ad05 call 0x145bf4d90
140118711: 90 nop
140118712: 488b85a8030000 mov rax, qword ptr [rbp + 0x3a8]
140118719: 488d0c76 lea rcx, [rsi + rsi*2]
14011871d: 48c1e104 shl rcx, 4
140118721: 0f108510010000 movups xmm0, xmmword ptr [rbp + 0x110]
140118728: 0f108d20010000 movups xmm1, xmmword ptr [rbp + 0x120]
14011872f: f30f6f9530010000 movdqu xmm2, xmmword ptr [rbp + 0x130]
140118737: f30f7f540820 movdqu xmmword ptr [rax + rcx + 0x20], xmm2
14011873d: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
140118742: 0f110408 movups xmmword ptr [rax + rcx], xmm0
140118746: 48ffc6 inc rsi
140118749: 4889b5b0030000 mov qword ptr [rbp + 0x3b0], rsi
140118750: 440f28a5e0020000 movaps xmm12, xmmword ptr [rbp + 0x2e0]
140118758: 488b85b0030000 mov rax, qword ptr [rbp + 0x3b0]
14011875f: 48898520010000 mov qword ptr [rbp + 0x120], rax
140118766: 0f1085a0030000 movups xmm0, xmmword ptr [rbp + 0x3a0]
14011876d: 0f298510010000 movaps xmmword ptr [rbp + 0x110], xmm0
140118774: 498b7710 mov rsi, qword ptr [r15 + 0x10]
140118778: 4885f6 test rsi, rsi
14011877b: 7443 je 0x1401187c0
14011877d: 4d8b6708 mov r12, qword ptr [r15 + 8]
140118781: 4983c408 add r12, 8
140118785: eb12 jmp 0x140118799
140118787: 660f1f840000000000 nop word ptr [rax + rax]
140118790: 4983c430 add r12, 0x30
140118794: 48ffce dec rsi
140118797: 7427 je 0x1401187c0
140118799: 498b4424f8 mov rax, qword ptr [r12 - 8]
14011879e: 4885c0 test rax, rax
1401187a1: 74ed je 0x140118790
1401187a3: 498b0c24 mov rcx, qword ptr [r12]
1401187a7: 48c1e002 shl rax, 2
1401187ab: 488d14c0 lea rdx, [rax + rax*8]
1401187af: 41b804000000 mov r8d, 4
1401187b5: e8169aeeff call 0x1400021d0
1401187ba: ebd4 jmp 0x140118790
1401187bc: 0f1f4000 nop dword ptr [rax]
1401187c0: 498b07 mov rax, qword ptr [r15]
1401187c3: 4885c0 test rax, rax
1401187c6: 7417 je 0x1401187df
1401187c8: 498b4f08 mov rcx, qword ptr [r15 + 8]
1401187cc: 48c1e004 shl rax, 4
1401187d0: 488d1440 lea rdx, [rax + rax*2]
1401187d4: 41b808000000 mov r8d, 8
1401187da: e8f199eeff call 0x1400021d0
1401187df: 488b8520010000 mov rax, qword ptr [rbp + 0x120]
1401187e6: 49894710 mov qword ptr [r15 + 0x10], rax
1401187ea: 0f288510010000 movaps xmm0, xmmword ptr [rbp + 0x110]
1401187f1: 410f1107 movups xmmword ptr [r15], xmm0
1401187f5: f3410f107f6c movss xmm7, dword ptr [r15 + 0x6c]
1401187fb: 41c7474001000000 mov dword ptr [r15 + 0x40], 1
140118803: 498d5760 lea rdx, [r15 + 0x60]
140118807: 488b02 mov rax, qword ptr [rdx]
14011880a: 49894744 mov qword ptr [r15 + 0x44], rax
14011880e: 8b4208 mov eax, dword ptr [rdx + 8]
140118811: 4189474c mov dword ptr [r15 + 0x4c], eax
140118815: f3410f117f50 movss dword ptr [r15 + 0x50], xmm7
14011881b: 4c8da510010000 lea r12, [rbp + 0x110]
140118822: 418b4754 mov eax, dword ptr [r15 + 0x54]
140118826: f2450f104f58 movsd xmm9, qword ptr [r15 + 0x58]
14011882c: 8b4a08 mov ecx, dword ptr [rdx + 8]
14011882f: 898d60030000 mov dword ptr [rbp + 0x360], ecx
140118835: 488b0a mov rcx, qword ptr [rdx]
140118838: 48898d58030000 mov qword ptr [rbp + 0x358], rcx
14011883f: 48c785a003000000000000 mov qword ptr [rbp + 0x3a0], 0
14011884a: 48c785a803000008000000 mov qword ptr [rbp + 0x3a8], 8
140118855: 48c785b003000000000000 mov qword ptr [rbp + 0x3b0], 0
140118860: f30f1005d847cb05 movss xmm0, dword ptr [rip + 0x5cb47d8]
140118868: 410f2ec4 ucomiss xmm0, xmm12
14011886c: 0f8317020000 jae 0x140118a89
140118872: f3450f16c1 movshdup xmm8, xmm9
140118877: 410f28f0 movaps xmm6, xmm8
14011887b: 83f803 cmp eax, 3
14011887e: 0f85bc020000 jne 0x140118b40
140118884: 0f2e35a583cb05 ucomiss xmm6, dword ptr [rip + 0x5cb83a5]
14011888b: 0f82af020000 jb 0x140118b40
140118891: f3450f59e1 mulss xmm12, xmm9
140118896: 410f28c4 movaps xmm0, xmm12
14011889a: 440f28052e9cc805 movaps xmm8, xmmword ptr [rip + 0x5c89c2e]
1401188a2: 410f57c0 xorps xmm0, xmm8
1401188a6: 410f28c9 movaps xmm1, xmm9
1401188aa: f30f590d72d7c805 mulss xmm1, dword ptr [rip + 0x5c8d772]
1401188b2: f30f580d7eefc705 addss xmm1, dword ptr [rip + 0x5c7ef7e]
1401188ba: f30f109558030000 movss xmm2, dword ptr [rbp + 0x358]
1401188c2: f30f109d5c030000 movss xmm3, dword ptr [rbp + 0x35c]
1401188ca: 0f28e3 movaps xmm4, xmm3
1401188cd: 410f57e0 xorps xmm4, xmm8
1401188d1: f30f10ad60030000 movss xmm5, dword ptr [rbp + 0x360]
1401188d9: 0f28f2 movaps xmm6, xmm2
1401188dc: 410f57f0 xorps xmm6, xmm8
1401188e0: 0f28f9 movaps xmm7, xmm1
1401188e3: 410f57f8 xorps xmm7, xmm8
1401188e7: f30f11a500020000 movss dword ptr [rbp + 0x200], xmm4
1401188ef: f30f11ad04020000 movss dword ptr [rbp + 0x204], xmm5
1401188f7: f30f11b508020000 movss dword ptr [rbp + 0x208], xmm6
1401188ff: f20f1025d97ecb05 movsd xmm4, qword ptr [rip + 0x5cb7ed9]
140118907: f20f11a50c020000 movsd qword ptr [rbp + 0x20c], xmm4
14011890f: f30f118514020000 movss dword ptr [rbp + 0x214], xmm0
140118917: f3440f11a518020000 movss dword ptr [rbp + 0x218], xmm12
140118920: f30f11851c020000 movss dword ptr [rbp + 0x21c], xmm0
140118928: f3440f11a520020000 movss dword ptr [rbp + 0x220], xmm12
140118931: f30f11bd24020000 movss dword ptr [rbp + 0x224], xmm7
140118939: f30f118d28020000 movss dword ptr [rbp + 0x228], xmm1
140118941: f30f115c2430 movss dword ptr [rsp + 0x30], xmm3
140118947: f30f11542428 movss dword ptr [rsp + 0x28], xmm2
14011894d: 48895c2420 mov qword ptr [rsp + 0x20], rbx
140118952: 48c744244000000000 mov qword ptr [rsp + 0x40], 0
14011895b: 48c744243804000000 mov qword ptr [rsp + 0x38], 4
140118964: 4c89e1 mov rcx, r12
140118967: 488d95f8020000 lea rdx, [rbp + 0x2f8]
14011896e: 41b002 mov r8b, 2
140118971: 41b101 mov r9b, 1
140118974: e8b742fdff call 0x1400ecc30
140118979: 90 nop
14011897a: 488bb5b0030000 mov rsi, qword ptr [rbp + 0x3b0]
140118981: 483bb5a0030000 cmp rsi, qword ptr [rbp + 0x3a0]
140118988: 750d jne 0x140118997
14011898a: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140118991: e8fac3ad05 call 0x145bf4d90
140118996: 90 nop
140118997: 488b85a8030000 mov rax, qword ptr [rbp + 0x3a8]
14011899e: 488d0c76 lea rcx, [rsi + rsi*2]
1401189a2: 48c1e104 shl rcx, 4
1401189a6: 0f108510010000 movups xmm0, xmmword ptr [rbp + 0x110]
1401189ad: 0f108d20010000 movups xmm1, xmmword ptr [rbp + 0x120]
1401189b4: 0f109530010000 movups xmm2, xmmword ptr [rbp + 0x130]
1401189bb: 0f11540820 movups xmmword ptr [rax + rcx + 0x20], xmm2
1401189c0: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
1401189c5: 0f110408 movups xmmword ptr [rax + rcx], xmm0
1401189c9: 48ffc6 inc rsi
1401189cc: 4889b5b0030000 mov qword ptr [rbp + 0x3b0], rsi
1401189d3: 4584f6 test r14b, r14b
1401189d6: 0f84ad000000 je 0x140118a89
1401189dc: f3440f590d3b7dcb05 mulss xmm9, dword ptr [rip + 0x5cb7d3b]
1401189e5: f3440f5d0dee46cb05 minss xmm9, dword ptr [rip + 0x5cb46ee]
1401189ee: f3440f114c2440 movss dword ptr [rsp + 0x40], xmm9
1401189f5: f3440f11642428 movss dword ptr [rsp + 0x28], xmm12
1401189fc: 488d8558030000 lea rax, [rbp + 0x358]
140118a03: 4889442420 mov qword ptr [rsp + 0x20], rax
140118a08: c7442438db0fc940 mov dword ptr [rsp + 0x38], 0x40c90fdb
140118a10: c744243000000000 mov dword ptr [rsp + 0x30], 0
140118a18: 4c89e1 mov rcx, r12
140118a1b: 488d95f8020000 lea rdx, [rbp + 0x2f8]
140118a22: 41b003 mov r8b, 3
140118a25: 41b105 mov r9b, 5
140118a28: e8533bfdff call 0x1400ec580
140118a2d: 90 nop
140118a2e: 488bb5b0030000 mov rsi, qword ptr [rbp + 0x3b0]
140118a35: 483bb5a0030000 cmp rsi, qword ptr [rbp + 0x3a0]
140118a3c: 750d jne 0x140118a4b
140118a3e: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140118a45: e846c3ad05 call 0x145bf4d90
140118a4a: 90 nop
140118a4b: 488b85a8030000 mov rax, qword ptr [rbp + 0x3a8]
140118a52: 488d0c76 lea rcx, [rsi + rsi*2]
140118a56: 48c1e104 shl rcx, 4
140118a5a: 0f108510010000 movups xmm0, xmmword ptr [rbp + 0x110]
140118a61: 0f108d20010000 movups xmm1, xmmword ptr [rbp + 0x120]
140118a68: f30f6f9530010000 movdqu xmm2, xmmword ptr [rbp + 0x130]
140118a70: f30f7f540820 movdqu xmmword ptr [rax + rcx + 0x20], xmm2
140118a76: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
140118a7b: 0f110408 movups xmmword ptr [rax + rcx], xmm0
140118a7f: 48ffc6 inc rsi
140118a82: 4889b5b0030000 mov qword ptr [rbp + 0x3b0], rsi
140118a89: 488b85b0030000 mov rax, qword ptr [rbp + 0x3b0]
140118a90: 48898520010000 mov qword ptr [rbp + 0x120], rax
140118a97: 488b85a0030000 mov rax, qword ptr [rbp + 0x3a0]
140118a9e: 48898510010000 mov qword ptr [rbp + 0x110], rax
140118aa5: 488b85a8030000 mov rax, qword ptr [rbp + 0x3a8]
140118aac: 48898518010000 mov qword ptr [rbp + 0x118], rax
140118ab3: 498b7728 mov rsi, qword ptr [r15 + 0x28]
140118ab7: 4885f6 test rsi, rsi
140118aba: f3440f1005197dcb05 movss xmm8, dword ptr [rip + 0x5cb7d19]
140118ac3: 743b je 0x140118b00
140118ac5: 4d8b7720 mov r14, qword ptr [r15 + 0x20]
140118ac9: 4983c608 add r14, 8
140118acd: eb0a jmp 0x140118ad9
140118acf: 90 nop
140118ad0: 4983c630 add r14, 0x30
140118ad4: 48ffce dec rsi
140118ad7: 7427 je 0x140118b00
140118ad9: 498b46f8 mov rax, qword ptr [r14 - 8]
140118add: 4885c0 test rax, rax
140118ae0: 74ee je 0x140118ad0
140118ae2: 498b0e mov rcx, qword ptr [r14]
140118ae5: 48c1e002 shl rax, 2
140118ae9: 488d14c0 lea rdx, [rax + rax*8]
140118aed: 41b804000000 mov r8d, 4
140118af3: e8d896eeff call 0x1400021d0
140118af8: ebd6 jmp 0x140118ad0
140118afa: 660f1f440000 nop word ptr [rax + rax]
140118b00: 498d7718 lea rsi, [r15 + 0x18]
140118b04: 488b06 mov rax, qword ptr [rsi]
140118b07: 4885c0 test rax, rax
140118b0a: 440f281dbe99c805 movaps xmm11, xmmword ptr [rip + 0x5c899be]
140118b12: 0f8408e8ffff je 0x140117320
140118b18: 498b4f20 mov rcx, qword ptr [r15 + 0x20]
140118b1c: 48c1e004 shl rax, 4
140118b20: 488d1440 lea rdx, [rax + rax*2]
140118b24: 41b808000000 mov r8d, 8
140118b2a: e8a196eeff call 0x1400021d0
140118b2f: e9ece7ffff jmp 0x140117320
140118b34: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140118b40: 89c0 mov eax, eax
140118b42: 488d0d4fa7cb05 lea rcx, [rip + 0x5cba74f]
140118b49: 48630481 movsxd rax, dword ptr [rcx + rax*4]
140118b4d: 4801c8 add rax, rcx
140118b50: ffe0 jmp rax
140118b52: 410f28f8 movaps xmm7, xmm8
140118b56: f3410f5cf9 subss xmm7, xmm9
140118b5b: 410f28c4 movaps xmm0, xmm12
140118b5f: f30f59c7 mulss xmm0, xmm7
140118b63: f3440f5cc0 subss xmm8, xmm0
140118b68: f3440f11442430 movss dword ptr [rsp + 0x30], xmm8
140118b6f: f30f11742428 movss dword ptr [rsp + 0x28], xmm6
140118b75: 488d8558030000 lea rax, [rbp + 0x358]
140118b7c: 4889442420 mov qword ptr [rsp + 0x20], rax
140118b81: 4c89e1 mov rcx, r12
140118b84: 488d95f8020000 lea rdx, [rbp + 0x2f8]
140118b8b: 41b002 mov r8b, 2
140118b8e: 41b101 mov r9b, 1
140118b91: e87a4dfdff call 0x1400ed910
140118b96: 90 nop
140118b97: 488bb5b0030000 mov rsi, qword ptr [rbp + 0x3b0]
140118b9e: 483bb5a0030000 cmp rsi, qword ptr [rbp + 0x3a0]
140118ba5: 750d jne 0x140118bb4
140118ba7: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140118bae: e8ddc1ad05 call 0x145bf4d90
140118bb3: 90 nop
140118bb4: 488b85a8030000 mov rax, qword ptr [rbp + 0x3a8]
140118bbb: 488d0c76 lea rcx, [rsi + rsi*2]
140118bbf: 48c1e104 shl rcx, 4
140118bc3: 0f108510010000 movups xmm0, xmmword ptr [rbp + 0x110]
140118bca: 0f108d20010000 movups xmm1, xmmword ptr [rbp + 0x120]
140118bd1: 0f109530010000 movups xmm2, xmmword ptr [rbp + 0x130]
140118bd8: 0f11540820 movups xmmword ptr [rax + rcx + 0x20], xmm2
140118bdd: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
140118be2: 0f110408 movups xmmword ptr [rax + rcx], xmm0
140118be6: 48ffc6 inc rsi
140118be9: 4889b5b0030000 mov qword ptr [rbp + 0x3b0], rsi
140118bf0: f30f10058c80cb05 movss xmm0, dword ptr [rip + 0x5cb808c]
140118bf8: 410f2ec4 ucomiss xmm0, xmm12
140118bfc: 0f96c0 setbe al
140118bff: 4180f601 xor r14b, 1
140118c03: 4108c6 or r14b, al
140118c06: 0f857dfeffff jne 0x140118a89
140118c0c: f30f593d0c7bcb05 mulss xmm7, dword ptr [rip + 0x5cb7b0c]
140118c14: f30f5d3dc044cb05 minss xmm7, dword ptr [rip + 0x5cb44c0]
140118c1c: f30f117c2440 movss dword ptr [rsp + 0x40], xmm7
140118c22: f3440f11442428 movss dword ptr [rsp + 0x28], xmm8
140118c29: 488d8558030000 lea rax, [rbp + 0x358]
140118c30: 4889442420 mov qword ptr [rsp + 0x20], rax
140118c35: c744243800000000 mov dword ptr [rsp + 0x38], 0
140118c3d: c7442430db0fc940 mov dword ptr [rsp + 0x30], 0x40c90fdb
140118c45: 4c89e1 mov rcx, r12
140118c48: 488d95f8020000 lea rdx, [rbp + 0x2f8]
140118c4f: 41b003 mov r8b, 3
140118c52: 41b105 mov r9b, 5
140118c55: e82639fdff call 0x1400ec580
140118c5a: 90 nop
140118c5b: 488bb5b0030000 mov rsi, qword ptr [rbp + 0x3b0]
140118c62: 483bb5a0030000 cmp rsi, qword ptr [rbp + 0x3a0]
140118c69: 0f85dcfdffff jne 0x140118a4b
140118c6f: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140118c76: e815c1ad05 call 0x145bf4d90
140118c7b: 90 nop
140118c7c: e9cafdffff jmp 0x140118a4b
140118c81: 440f2815e77fcb05 movaps xmm10, xmmword ptr [rip + 0x5cb7fe7]
140118c89: f3450f10d4 movss xmm10, xmm12
140118c8e: 450f59d1 mulps xmm10, xmm9
140118c92: f30f59357ae9c705 mulss xmm6, dword ptr [rip + 0x5c7e97a]
140118c9a: f30f583d3a7bcb05 addss xmm7, dword ptr [rip + 0x5cb7b3a]
140118ca2: f3440f590d79d3c805 mulss xmm9, dword ptr [rip + 0x5c8d379]
140118cab: f3440f580d84ebc705 addss xmm9, dword ptr [rip + 0x5c7eb84]
140118cb4: f3440f109d58030000 movss xmm11, dword ptr [rbp + 0x358]
140118cbd: f3440f10a55c030000 movss xmm12, dword ptr [rbp + 0x35c]
140118cc6: 450f28ec movaps xmm13, xmm12
140118cca: 0f2805ff97c805 movaps xmm0, xmmword ptr [rip + 0x5c897ff]
140118cd1: 440f57e8 xorps xmm13, xmm0
140118cd5: f30f108d60030000 movss xmm1, dword ptr [rbp + 0x360]
140118cdd: f30f118de0020000 movss dword ptr [rbp + 0x2e0], xmm1
140118ce5: 450f28fb movaps xmm15, xmm11
140118ce9: 440f57f8 xorps xmm15, xmm0
140118ced: 0f28c7 movaps xmm0, xmm7
140118cf0: e8829cad05 call 0x145bf2977
140118cf5: 440f28c0 movaps xmm8, xmm0
140118cf9: 0f28c7 movaps xmm0, xmm7
140118cfc: e87c9cad05 call 0x145bf297d
140118d01: 450f28f1 movaps xmm14, xmm9
140118d05: 440f5735c397c805 xorps xmm14, xmmword ptr [rip + 0x5c897c3]
140118d0d: f30f10bde0020000 movss xmm7, dword ptr [rbp + 0x2e0]
140118d15: f3440f11ad00020000 movss dword ptr [rbp + 0x200], xmm13
140118d1e: f30f11bd04020000 movss dword ptr [rbp + 0x204], xmm7
140118d26: f3440f11bd08020000 movss dword ptr [rbp + 0x208], xmm15
140118d2f: f3440f118570030000 movss dword ptr [rbp + 0x370], xmm8
140118d38: f3440f11850c020000 movss dword ptr [rbp + 0x20c], xmm8
140118d41: 440f28c0 movaps xmm8, xmm0
140118d45: f30f118510020000 movss dword ptr [rbp + 0x210], xmm0
140118d4d: c7851402000000000000 mov dword ptr [rbp + 0x214], 0
140118d57: 440f139518020000 movlps qword ptr [rbp + 0x218], xmm10
140118d5f: f30f11b520020000 movss dword ptr [rbp + 0x220], xmm6
140118d67: f3440f11b524020000 movss dword ptr [rbp + 0x224], xmm14
140118d70: f3440f118d28020000 movss dword ptr [rbp + 0x228], xmm9
140118d79: f3440f11642430 movss dword ptr [rsp + 0x30], xmm12
140118d80: f3440f115c2428 movss dword ptr [rsp + 0x28], xmm11
140118d87: 48895c2420 mov qword ptr [rsp + 0x20], rbx
140118d8c: 48c744244000000000 mov qword ptr [rsp + 0x40], 0
140118d95: 48c744243804000000 mov qword ptr [rsp + 0x38], 4
140118d9e: 4c89e1 mov rcx, r12
140118da1: 488d95f8020000 lea rdx, [rbp + 0x2f8]
140118da8: 41b002 mov r8b, 2
140118dab: 41b103 mov r9b, 3
140118dae: e87d3efdff call 0x1400ecc30
140118db3: 90 nop
140118db4: 488bb5b0030000 mov rsi, qword ptr [rbp + 0x3b0]
140118dbb: 483bb5a0030000 cmp rsi, qword ptr [rbp + 0x3a0]
140118dc2: 750d jne 0x140118dd1
140118dc4: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140118dcb: e8c0bfad05 call 0x145bf4d90
140118dd0: 90 nop
140118dd1: 488b85a8030000 mov rax, qword ptr [rbp + 0x3a8]
140118dd8: 488d0c76 lea rcx, [rsi + rsi*2]
140118ddc: 48c1e104 shl rcx, 4
140118de0: 0f108510010000 movups xmm0, xmmword ptr [rbp + 0x110]
140118de7: 0f108d20010000 movups xmm1, xmmword ptr [rbp + 0x120]
140118dee: 0f109530010000 movups xmm2, xmmword ptr [rbp + 0x130]
140118df5: 0f11540820 movups xmmword ptr [rax + rcx + 0x20], xmm2
140118dfa: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
140118dff: 0f110408 movups xmmword ptr [rax + rcx], xmm0
140118e03: 48ffc6 inc rsi
140118e06: 4889b5b0030000 mov qword ptr [rbp + 0x3b0], rsi
140118e0d: 4584f6 test r14b, r14b
140118e10: 0f8473fcffff je 0x140118a89
140118e16: 410f28c2 movaps xmm0, xmm10
140118e1a: f30f58055e7ecb05 addss xmm0, dword ptr [rip + 0x5cb7e5e]
140118e22: 0f57c9 xorps xmm1, xmm1
140118e25: f30f5fc1 maxss xmm0, xmm1
140118e29: f3440f11ad00020000 movss dword ptr [rbp + 0x200], xmm13
140118e32: f30f11bd04020000 movss dword ptr [rbp + 0x204], xmm7
140118e3a: f3440f11bd08020000 movss dword ptr [rbp + 0x208], xmm15
140118e43: f30f108d70030000 movss xmm1, dword ptr [rbp + 0x370]
140118e4b: f30f118d0c020000 movss dword ptr [rbp + 0x20c], xmm1
140118e53: f3440f118510020000 movss dword ptr [rbp + 0x210], xmm8
140118e5c: f30f118514020000 movss dword ptr [rbp + 0x214], xmm0
140118e64: 440f139518020000 movlps qword ptr [rbp + 0x218], xmm10
140118e6c: f30f11b520020000 movss dword ptr [rbp + 0x220], xmm6
140118e74: f3440f11b524020000 movss dword ptr [rbp + 0x224], xmm14
140118e7d: f3440f118d28020000 movss dword ptr [rbp + 0x228], xmm9
140118e86: f3440f11642430 movss dword ptr [rsp + 0x30], xmm12
140118e8d: f3440f115c2428 movss dword ptr [rsp + 0x28], xmm11
140118e94: 48895c2420 mov qword ptr [rsp + 0x20], rbx
140118e99: 48c744244000000000 mov qword ptr [rsp + 0x40], 0
140118ea2: 48c744243804000000 mov qword ptr [rsp + 0x38], 4
140118eab: 4c89e1 mov rcx, r12
140118eae: 488d95f8020000 lea rdx, [rbp + 0x2f8]
140118eb5: 41b003 mov r8b, 3
140118eb8: 41b106 mov r9b, 6
140118ebb: e8703dfdff call 0x1400ecc30
140118ec0: 90 nop
140118ec1: 488bb5b0030000 mov rsi, qword ptr [rbp + 0x3b0]
140118ec8: 483bb5a0030000 cmp rsi, qword ptr [rbp + 0x3a0]
140118ecf: 0f8576fbffff jne 0x140118a4b
140118ed5: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140118edc: e8afbead05 call 0x145bf4d90
140118ee1: 90 nop
140118ee2: e964fbffff jmp 0x140118a4b
140118ee7: f3450f59e1 mulss xmm12, xmm9
140118eec: 410f28c4 movaps xmm0, xmm12
140118ef0: 0f2815d995c805 movaps xmm2, xmmword ptr [rip + 0x5c895d9]
140118ef7: 0f57c2 xorps xmm0, xmm2
140118efa: f3440f109558030000 movss xmm10, dword ptr [rbp + 0x358]
140118f03: f3440f109d5c030000 movss xmm11, dword ptr [rbp + 0x35c]
140118f0c: 410f28cb movaps xmm1, xmm11
140118f10: 0f57ca xorps xmm1, xmm2
140118f13: f30f118d00020000 movss dword ptr [rbp + 0x200], xmm1
140118f1b: f30f108d60030000 movss xmm1, dword ptr [rbp + 0x360]
140118f23: f30f118d04020000 movss dword ptr [rbp + 0x204], xmm1
140118f2b: 410f28ca movaps xmm1, xmm10
140118f2f: 0f57ca xorps xmm1, xmm2
140118f32: f30f118d08020000 movss dword ptr [rbp + 0x208], xmm1
140118f3a: 410f28c9 movaps xmm1, xmm9
140118f3e: f30f590dded0c805 mulss xmm1, dword ptr [rip + 0x5c8d0de]
140118f46: f30f580deae8c705 addss xmm1, dword ptr [rip + 0x5c7e8ea]
140118f4e: f20f101d8a78cb05 movsd xmm3, qword ptr [rip + 0x5cb788a]
140118f56: f20f119d0c020000 movsd qword ptr [rbp + 0x20c], xmm3
140118f5e: f30f118514020000 movss dword ptr [rbp + 0x214], xmm0
140118f66: f3440f11a518020000 movss dword ptr [rbp + 0x218], xmm12
140118f6f: f30f11851c020000 movss dword ptr [rbp + 0x21c], xmm0
140118f77: 0f28c1 movaps xmm0, xmm1
140118f7a: 0f57c2 xorps xmm0, xmm2
140118f7d: f3440f11a520020000 movss dword ptr [rbp + 0x220], xmm12
140118f86: f30f118524020000 movss dword ptr [rbp + 0x224], xmm0
140118f8e: f30f118d28020000 movss dword ptr [rbp + 0x228], xmm1
140118f96: 440f28c6 movaps xmm8, xmm6
140118f9a: f3440f590571e6c705 mulss xmm8, dword ptr [rip + 0x5c7e671]
140118fa3: 488d8d40030000 lea rcx, [rbp + 0x340]
140118faa: 0f28cf movaps xmm1, xmm7
140118fad: 0f28d6 movaps xmm2, xmm6
140118fb0: e84bf0fdff call 0x1400f8000
140118fb5: 90 nop
140118fb6: 488b8d48030000 mov rcx, qword ptr [rbp + 0x348]
140118fbd: 488b8550030000 mov rax, qword ptr [rbp + 0x350]
140118fc4: 4889442440 mov qword ptr [rsp + 0x40], rax
140118fc9: 48898de0020000 mov qword ptr [rbp + 0x2e0], rcx
140118fd0: 48894c2438 mov qword ptr [rsp + 0x38], rcx
140118fd5: f3440f115c2430 movss dword ptr [rsp + 0x30], xmm11
140118fdc: f3440f11542428 movss dword ptr [rsp + 0x28], xmm10
140118fe3: 48895c2420 mov qword ptr [rsp + 0x20], rbx
140118fe8: 4c89e1 mov rcx, r12
140118feb: 488d95f8020000 lea rdx, [rbp + 0x2f8]
140118ff2: 41b002 mov r8b, 2
140118ff5: 41b101 mov r9b, 1
140118ff8: e8333cfdff call 0x1400ecc30
140118ffd: 90 nop
140118ffe: 488bb5b0030000 mov rsi, qword ptr [rbp + 0x3b0]
140119005: 483bb5a0030000 cmp rsi, qword ptr [rbp + 0x3a0]
14011900c: 750d jne 0x14011901b
14011900e: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140119015: e876bdad05 call 0x145bf4d90
14011901a: 90 nop
14011901b: 488b85a8030000 mov rax, qword ptr [rbp + 0x3a8]
140119022: 488d0c76 lea rcx, [rsi + rsi*2]
140119026: 48c1e104 shl rcx, 4
14011902a: 0f108510010000 movups xmm0, xmmword ptr [rbp + 0x110]
140119031: 0f108d20010000 movups xmm1, xmmword ptr [rbp + 0x120]
140119038: 0f109530010000 movups xmm2, xmmword ptr [rbp + 0x130]
14011903f: 0f11540820 movups xmmword ptr [rax + rcx + 0x20], xmm2
140119044: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
140119049: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14011904d: 48ffc6 inc rsi
140119050: 4889b5b0030000 mov qword ptr [rbp + 0x3b0], rsi
140119057: 488b8540030000 mov rax, qword ptr [rbp + 0x340]
14011905e: 4885c0 test rax, rax
140119061: 741a je 0x14011907d
140119063: 48c1e003 shl rax, 3
140119067: 488d1440 lea rdx, [rax + rax*2]
14011906b: 41b804000000 mov r8d, 4
140119071: 488b8de0020000 mov rcx, qword ptr [rbp + 0x2e0]
140119078: e85391eeff call 0x1400021d0
14011907d: 4584f6 test r14b, r14b
140119080: 0f8403faffff je 0x140118a89
140119086: 0f28c7 movaps xmm0, xmm7
140119089: f3410f5cc0 subss xmm0, xmm8
14011908e: f3410f58f8 addss xmm7, xmm8
140119093: f3440f590d8476cb05 mulss xmm9, dword ptr [rip + 0x5cb7684]
14011909c: f3440f5d0d3740cb05 minss xmm9, dword ptr [rip + 0x5cb4037]
1401190a5: f3440f114c2440 movss dword ptr [rsp + 0x40], xmm9
1401190ac: f30f117c2438 movss dword ptr [rsp + 0x38], xmm7
1401190b2: f30f11442430 movss dword ptr [rsp + 0x30], xmm0
1401190b8: f3440f11642428 movss dword ptr [rsp + 0x28], xmm12
1401190bf: 488d8558030000 lea rax, [rbp + 0x358]
1401190c6: 4889442420 mov qword ptr [rsp + 0x20], rax
1401190cb: 4c89e1 mov rcx, r12
1401190ce: 488d95f8020000 lea rdx, [rbp + 0x2f8]
1401190d5: 41b003 mov r8b, 3
1401190d8: 41b105 mov r9b, 5
1401190db: e8a034fdff call 0x1400ec580
1401190e0: 90 nop
1401190e1: 488bb5b0030000 mov rsi, qword ptr [rbp + 0x3b0]
1401190e8: 483bb5a0030000 cmp rsi, qword ptr [rbp + 0x3a0]
1401190ef: 0f8556f9ffff jne 0x140118a4b
1401190f5: 488d8da0030000 lea rcx, [rbp + 0x3a0]
1401190fc: e88fbcad05 call 0x145bf4d90
140119101: 90 nop
140119102: e944f9ffff jmp 0x140118a4b
140119107: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
140119110: 41b904000000 mov r9d, 4
140119116: 4889d9 mov rcx, rbx
140119119: 4c89ea mov rdx, r13
14011911c: 4d89e0 mov r8, r12
14011911f: e86cb9ad05 call 0x145bf4a90
140119124: 90 nop
140119125: 440f28a5e0020000 movaps xmm12, xmmword ptr [rbp + 0x2e0]
14011912d: 4c8bad10020000 mov r13, qword ptr [rbp + 0x210]
140119134: e990e6ffff jmp 0x1401177c9
140119139: 488d0ddb84cb05 lea rcx, [rip + 0x5cb84db]
140119140: 4c8d05f184cb05 lea r8, [rip + 0x5cb84f1]
140119147: ba16000000 mov edx, 0x16
14011914c: e85fa6c705 call 0x145d937b0
140119151: 90 nop
140119152: e9c9000000 jmp 0x140119220
140119157: 488b85f8020000 mov rax, qword ptr [rbp + 0x2f8]
14011915e: 4885c0 test rax, rax
140119161: 741a je 0x14011917d
140119163: 488b8d00030000 mov rcx, qword ptr [rbp + 0x300]
14011916a: 48c1e002 shl rax, 2
14011916e: 488d14c0 lea rdx, [rax + rax*8]
140119172: 41b804000000 mov r8d, 4
140119178: e85390eeff call 0x1400021d0
14011917d: 0f28b5d0030000 movaps xmm6, xmmword ptr [rbp + 0x3d0]
140119184: 0f28bde0030000 movaps xmm7, xmmword ptr [rbp + 0x3e0]
14011918b: 440f2885f0030000 movaps xmm8, xmmword ptr [rbp + 0x3f0]
140119193: 440f288d00040000 movaps xmm9, xmmword ptr [rbp + 0x400]
14011919b: 440f289510040000 movaps xmm10, xmmword ptr [rbp + 0x410]
1401191a3: 440f289d20040000 movaps xmm11, xmmword ptr [rbp + 0x420]
1401191ab: 440f28a530040000 movaps xmm12, xmmword ptr [rbp + 0x430]
1401191b3: 440f28ad40040000 movaps xmm13, xmmword ptr [rbp + 0x440]
1401191bb: 440f28b550040000 movaps xmm14, xmmword ptr [rbp + 0x450]
1401191c3: 440f28bd60040000 movaps xmm15, xmmword ptr [rbp + 0x460]
1401191cb: 4881c4f8040000 add rsp, 0x4f8
1401191d2: 5b pop rbx
1401191d3: 5f pop rdi
1401191d4: 5e pop rsi
1401191d5: 415c pop r12
1401191d7: 415d pop r13
1401191d9: 415e pop r14
1401191db: 415f pop r15
1401191dd: 5d pop rbp
1401191de: c3 ret
1401191df: 0f1085f8020000 movups xmm0, xmmword ptr [rbp + 0x2f8]
1401191e6: 0f298510010000 movaps xmmword ptr [rbp + 0x110], xmm0
1401191ed: c685c603000000 mov byte ptr [rbp + 0x3c6], 0
1401191f4: 488d05c57ecb05 lea rax, [rip + 0x5cb7ec5]
1401191fb: 4889442420 mov qword ptr [rsp + 0x20], rax
140119200: 488d0dd182cb05 lea rcx, [rip + 0x5cb82d1]
140119207: 4c8d0daa82cb05 lea r9, [rip + 0x5cb82aa]
14011920e: 4c8d8510010000 lea r8, [rbp + 0x110]
140119215: ba2b000000 mov edx, 0x2b
14011921a: e8f1a5c705 call 0x145d93810
14011921f: 90 nop
140119220: 0f0b ud2
