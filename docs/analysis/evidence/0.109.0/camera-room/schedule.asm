; correction-registration 0x140cdf9d4..0x140cdfbea
140cdf9d4: 4c8d05e5bb2c05 lea r8, [rip + 0x52cbbe5]
140cdf9db: 488d4da0 lea rcx, [rbp - 0x60]
140cdf9df: b201 mov dl, 1
140cdf9e1: e83a15c5ff call 0x140930f20
140cdf9e6: 90 nop 
140cdf9e7: 488b0db23c3a07 mov rcx, qword ptr [rip + 0x73a3cb2]
140cdf9ee: 4c8d0583d82205 lea r8, [rip + 0x522d883]
140cdf9f5: 488d9507040000 lea rdx, [rbp + 0x407]
140cdf9fc: e89fb98aff call 0x14058b3a0
140cdfa01: 90 nop 
140cdfa02: 4989d0 mov r8, rdx
140cdfa05: 488d4da0 lea rcx, [rbp - 0x60]
140cdfa09: 4889c2 mov rdx, rax
140cdfa0c: e83fda45ff call 0x14013d450
140cdfa11: 90 nop 
140cdfa12: 0f104500 movups xmm0, xmmword ptr [rbp]
140cdfa16: 0f2985f0030000 movaps xmmword ptr [rbp + 0x3f0], xmm0
140cdfa1d: 0f1045f0 movups xmm0, xmmword ptr [rbp - 0x10]
140cdfa21: 0f2985e0030000 movaps xmmword ptr [rbp + 0x3e0], xmm0
140cdfa28: 0f1045e0 movups xmm0, xmmword ptr [rbp - 0x20]
140cdfa2c: 0f2985d0030000 movaps xmmword ptr [rbp + 0x3d0], xmm0
140cdfa33: 0f1045a0 movups xmm0, xmmword ptr [rbp - 0x60]
140cdfa37: 0f104db0 movups xmm1, xmmword ptr [rbp - 0x50]
140cdfa3b: 0f1055c0 movups xmm2, xmmword ptr [rbp - 0x40]
140cdfa3f: 0f105dd0 movups xmm3, xmmword ptr [rbp - 0x30]
140cdfa43: 0f299dc0030000 movaps xmmword ptr [rbp + 0x3c0], xmm3
140cdfa4a: 0f2995b0030000 movaps xmmword ptr [rbp + 0x3b0], xmm2
140cdfa51: 0f298da0030000 movaps xmmword ptr [rbp + 0x3a0], xmm1
140cdfa58: 0f298590030000 movaps xmmword ptr [rbp + 0x390], xmm0
140cdfa5f: 488b0d3a3c3a07 mov rcx, qword ptr [rip + 0x73a3c3a]
140cdfa66: 4c8d057b0d2305 lea r8, [rip + 0x5230d7b]
140cdfa6d: 488dbd07040000 lea rdi, [rbp + 0x407]
140cdfa74: 4889fa mov rdx, rdi
140cdfa77: e824b98aff call 0x14058b3a0
140cdfa7c: 90 nop 
140cdfa7d: 4989d0 mov r8, rdx
140cdfa80: 488d8d90030000 lea rcx, [rbp + 0x390]
140cdfa87: 4889c2 mov rdx, rax
140cdfa8a: e8c1da45ff call 0x14013d550
140cdfa8f: 90 nop 
140cdfa90: 0f2885f0030000 movaps xmm0, xmmword ptr [rbp + 0x3f0]
140cdfa97: 0f294500 movaps xmmword ptr [rbp], xmm0
140cdfa9b: 0f2885e0030000 movaps xmm0, xmmword ptr [rbp + 0x3e0]
140cdfaa2: 0f2945f0 movaps xmmword ptr [rbp - 0x10], xmm0
140cdfaa6: 0f2885d0030000 movaps xmm0, xmmword ptr [rbp + 0x3d0]
140cdfaad: 0f2945e0 movaps xmmword ptr [rbp - 0x20], xmm0
140cdfab1: 0f288590030000 movaps xmm0, xmmword ptr [rbp + 0x390]
140cdfab8: 0f288da0030000 movaps xmm1, xmmword ptr [rbp + 0x3a0]
140cdfabf: 0f2895b0030000 movaps xmm2, xmmword ptr [rbp + 0x3b0]
140cdfac6: 0f289dc0030000 movaps xmm3, xmmword ptr [rbp + 0x3c0]
140cdfacd: 0f295dd0 movaps xmmword ptr [rbp - 0x30], xmm3
140cdfad1: 0f2955c0 movaps xmmword ptr [rbp - 0x40], xmm2
140cdfad5: 0f294db0 movaps xmmword ptr [rbp - 0x50], xmm1
140cdfad9: 0f2945a0 movaps xmmword ptr [rbp - 0x60], xmm0
140cdfadd: 4889bd70030000 mov qword ptr [rbp + 0x370], rdi
140cdfae4: 488d1d15d83104 lea rbx, [rip + 0x431d815]
140cdfaeb: 48899d78030000 mov qword ptr [rbp + 0x378], rbx
140cdfaf2: c6850604000001 mov byte ptr [rbp + 0x406], 1
140cdfaf9: 488d15383e2c05 lea rdx, [rip + 0x52c3e38]
140cdfb00: 488d8d90030000 lea rcx, [rbp + 0x390]
140cdfb07: 4c8d8570030000 lea r8, [rbp + 0x370]
140cdfb0e: e81dd3ee04 call 0x145bcce30
140cdfb13: 90 nop 
140cdfb14: c6850604000001 mov byte ptr [rbp + 0x406], 1
140cdfb1b: 488d8d90030000 lea rcx, [rbp + 0x390]
140cdfb22: e8c9ae32ff call 0x14000a9f0
140cdfb27: 90 nop 
140cdfb28: 48c7857003000000000000 mov qword ptr [rbp + 0x370], 0
140cdfb33: c7858803000000000000 mov dword ptr [rbp + 0x388], 0
140cdfb3d: c6858c03000000 mov byte ptr [rbp + 0x38c], 0
140cdfb44: c6850604000000 mov byte ptr [rbp + 0x406], 0
140cdfb4b: 488d8d90030000 lea rcx, [rbp + 0x390]
140cdfb52: 488d55a0 lea rdx, [rbp - 0x60]
140cdfb56: 4c8d8570030000 lea r8, [rbp + 0x370]
140cdfb5d: e8de77fdff call 0x140cb7340
140cdfb62: 90 nop 
140cdfb63: 488b0d363b3a07 mov rcx, qword ptr [rip + 0x73a3b36]
140cdfb6a: 4c8d0557f61f05 lea r8, [rip + 0x51ff657]
140cdfb71: 488d9507040000 lea rdx, [rbp + 0x407]
140cdfb78: e823b88aff call 0x14058b3a0
140cdfb7d: 90 nop 
140cdfb7e: 4989d0 mov r8, rdx
140cdfb81: 488d8d90030000 lea rcx, [rbp + 0x390]
140cdfb88: 4889c2 mov rdx, rax
140cdfb8b: e8c0da45ff call 0x14013d650
140cdfb90: 90 nop 
140cdfb91: 0f1085f0030000 movups xmm0, xmmword ptr [rbp + 0x3f0]
140cdfb98: 0f294500 movaps xmmword ptr [rbp], xmm0
140cdfb9c: 0f1085e0030000 movups xmm0, xmmword ptr [rbp + 0x3e0]
140cdfba3: 0f2945f0 movaps xmmword ptr [rbp - 0x10], xmm0
140cdfba7: 0f1085d0030000 movups xmm0, xmmword ptr [rbp + 0x3d0]
140cdfbae: 0f2945e0 movaps xmmword ptr [rbp - 0x20], xmm0
140cdfbb2: 0f108590030000 movups xmm0, xmmword ptr [rbp + 0x390]
140cdfbb9: 0f108da0030000 movups xmm1, xmmword ptr [rbp + 0x3a0]
140cdfbc0: 0f1095b0030000 movups xmm2, xmmword ptr [rbp + 0x3b0]
140cdfbc7: 0f109dc0030000 movups xmm3, xmmword ptr [rbp + 0x3c0]
140cdfbce: 0f295dd0 movaps xmmword ptr [rbp - 0x30], xmm3
140cdfbd2: 0f2955c0 movaps xmmword ptr [rbp - 0x40], xmm2
140cdfbd6: 0f294db0 movaps xmmword ptr [rbp - 0x50], xmm1
140cdfbda: 0f2945a0 movaps xmmword ptr [rbp - 0x60], xmm0
140cdfbde: 488d55a0 lea rdx, [rbp - 0x60]
140cdfbe2: 4889f1 mov rcx, rsi
140cdfbe5: e8b6a783ff call 0x14051a3a0

; control-registration 0x140cdfc7f..0x140cdfe07
140cdfc7f: 488d1552b92c05 lea rdx, [rip + 0x52cb952]
140cdfc86: 488d4da0 lea rcx, [rbp - 0x60]
140cdfc8a: e831800b00 call 0x140d97cc0
140cdfc8f: c6857003000001 mov byte ptr [rbp + 0x370], 1
140cdfc96: 488b0d033a3a07 mov rcx, qword ptr [rip + 0x73a3a03]
140cdfc9d: 4c8d0584252d05 lea r8, [rip + 0x52d2584]
140cdfca4: 488d9570030000 lea rdx, [rbp + 0x370]
140cdfcab: e8f0b68aff call 0x14058b3a0
140cdfcb0: 90 nop 
140cdfcb1: 4989d0 mov r8, rdx
140cdfcb4: 488d4da0 lea rcx, [rbp - 0x60]
140cdfcb8: 4889c2 mov rdx, rax
140cdfcbb: e890d945ff call 0x14013d650
140cdfcc0: 90 nop 
140cdfcc1: 0f104500 movups xmm0, xmmword ptr [rbp]
140cdfcc5: 0f2985f0030000 movaps xmmword ptr [rbp + 0x3f0], xmm0
140cdfccc: 0f1045f0 movups xmm0, xmmword ptr [rbp - 0x10]
140cdfcd0: 0f2985e0030000 movaps xmmword ptr [rbp + 0x3e0], xmm0
140cdfcd7: 0f1045e0 movups xmm0, xmmword ptr [rbp - 0x20]
140cdfcdb: 0f2985d0030000 movaps xmmword ptr [rbp + 0x3d0], xmm0
140cdfce2: 0f1045a0 movups xmm0, xmmword ptr [rbp - 0x60]
140cdfce6: 0f104db0 movups xmm1, xmmword ptr [rbp - 0x50]
140cdfcea: 0f1055c0 movups xmm2, xmmword ptr [rbp - 0x40]
140cdfcee: 0f105dd0 movups xmm3, xmmword ptr [rbp - 0x30]
140cdfcf2: 0f299dc0030000 movaps xmmword ptr [rbp + 0x3c0], xmm3
140cdfcf9: 0f2995b0030000 movaps xmmword ptr [rbp + 0x3b0], xmm2
140cdfd00: 0f298da0030000 movaps xmmword ptr [rbp + 0x3a0], xmm1
140cdfd07: 0f298590030000 movaps xmmword ptr [rbp + 0x390], xmm0
140cdfd0e: 4889bd70030000 mov qword ptr [rbp + 0x370], rdi
140cdfd15: 48899d78030000 mov qword ptr [rbp + 0x378], rbx
140cdfd1c: c6850504000001 mov byte ptr [rbp + 0x405], 1
140cdfd23: 488d150e3c2c05 lea rdx, [rip + 0x52c3c0e]
140cdfd2a: 488d4da0 lea rcx, [rbp - 0x60]
140cdfd2e: 4c8d8570030000 lea r8, [rbp + 0x370]
140cdfd35: e8f6d0ee04 call 0x145bcce30
140cdfd3a: 90 nop 
140cdfd3b: c6850504000001 mov byte ptr [rbp + 0x405], 1
140cdfd42: 488d4da0 lea rcx, [rbp - 0x60]
140cdfd46: e8a5ac32ff call 0x14000a9f0
140cdfd4b: 90 nop 
140cdfd4c: 48c7857003000000000000 mov qword ptr [rbp + 0x370], 0
140cdfd57: c7858803000000000000 mov dword ptr [rbp + 0x388], 0
140cdfd61: c6858c03000000 mov byte ptr [rbp + 0x38c], 0
140cdfd68: c6850504000000 mov byte ptr [rbp + 0x405], 0
140cdfd6f: 488d4da0 lea rcx, [rbp - 0x60]
140cdfd73: 488d9590030000 lea rdx, [rbp + 0x390]
140cdfd7a: 4c8d8570030000 lea r8, [rbp + 0x370]
140cdfd81: e8ba75fdff call 0x140cb7340
140cdfd86: 90 nop 
140cdfd87: 488b0d12393a07 mov rcx, qword ptr [rip + 0x73a3912]
140cdfd8e: 4c8d0533f41f05 lea r8, [rip + 0x51ff433]
140cdfd95: 488d9507040000 lea rdx, [rbp + 0x407]
140cdfd9c: e8ffb58aff call 0x14058b3a0
140cdfda1: 90 nop 
140cdfda2: 4989d0 mov r8, rdx
140cdfda5: 488d4da0 lea rcx, [rbp - 0x60]
140cdfda9: 4889c2 mov rdx, rax
140cdfdac: e89fd845ff call 0x14013d650
140cdfdb1: 90 nop 
140cdfdb2: 0f104500 movups xmm0, xmmword ptr [rbp]
140cdfdb6: 0f2985f0030000 movaps xmmword ptr [rbp + 0x3f0], xmm0
140cdfdbd: 0f1045f0 movups xmm0, xmmword ptr [rbp - 0x10]
140cdfdc1: 0f2985e0030000 movaps xmmword ptr [rbp + 0x3e0], xmm0
140cdfdc8: 0f1045e0 movups xmm0, xmmword ptr [rbp - 0x20]
140cdfdcc: 0f2985d0030000 movaps xmmword ptr [rbp + 0x3d0], xmm0
140cdfdd3: f30f6f45a0 movdqu xmm0, xmmword ptr [rbp - 0x60]
140cdfdd8: f30f6f4db0 movdqu xmm1, xmmword ptr [rbp - 0x50]
140cdfddd: f30f6f55c0 movdqu xmm2, xmmword ptr [rbp - 0x40]
140cdfde2: f30f6f5dd0 movdqu xmm3, xmmword ptr [rbp - 0x30]
140cdfde7: 660f7f9dc0030000 movdqa xmmword ptr [rbp + 0x3c0], xmm3
140cdfdef: 660f7f95b0030000 movdqa xmmword ptr [rbp + 0x3b0], xmm2
140cdfdf7: 660f7f8da0030000 movdqa xmmword ptr [rbp + 0x3a0], xmm1
140cdfdff: 660f7f8590030000 movdqa xmmword ptr [rbp + 0x390], xmm0

; shake-registration 0x140ce06e6..0x140ce07f9
140ce06e6: 4c8d054baf2c05 lea r8, [rip + 0x52caf4b]
140ce06ed: 488d4da0 lea rcx, [rbp - 0x60]
140ce06f1: b201 mov dl, 1
140ce06f3: e8b806c5ff call 0x140930db0
140ce06f8: 90 nop 
140ce06f9: 488b0da02f3a07 mov rcx, qword ptr [rip + 0x73a2fa0]
140ce0700: 4c8d0571cb2205 lea r8, [rip + 0x522cb71]
140ce0707: 488dbd07040000 lea rdi, [rbp + 0x407]
140ce070e: 4889fa mov rdx, rdi
140ce0711: e88aac8aff call 0x14058b3a0
140ce0716: 90 nop 
140ce0717: 4989d0 mov r8, rdx
140ce071a: 488d4da0 lea rcx, [rbp - 0x60]
140ce071e: 4889c2 mov rdx, rax
140ce0721: e82acd45ff call 0x14013d450
140ce0726: 90 nop 
140ce0727: 0f104500 movups xmm0, xmmword ptr [rbp]
140ce072b: 0f2985f0030000 movaps xmmword ptr [rbp + 0x3f0], xmm0
140ce0732: 0f1045f0 movups xmm0, xmmword ptr [rbp - 0x10]
140ce0736: 0f2985e0030000 movaps xmmword ptr [rbp + 0x3e0], xmm0
140ce073d: 0f1045e0 movups xmm0, xmmword ptr [rbp - 0x20]
140ce0741: 0f2985d0030000 movaps xmmword ptr [rbp + 0x3d0], xmm0
140ce0748: 0f1045a0 movups xmm0, xmmword ptr [rbp - 0x60]
140ce074c: 0f104db0 movups xmm1, xmmword ptr [rbp - 0x50]
140ce0750: 0f1055c0 movups xmm2, xmmword ptr [rbp - 0x40]
140ce0754: 0f105dd0 movups xmm3, xmmword ptr [rbp - 0x30]
140ce0758: 0f299dc0030000 movaps xmmword ptr [rbp + 0x3c0], xmm3
140ce075f: 0f2995b0030000 movaps xmmword ptr [rbp + 0x3b0], xmm2
140ce0766: 0f298da0030000 movaps xmmword ptr [rbp + 0x3a0], xmm1
140ce076d: 0f298590030000 movaps xmmword ptr [rbp + 0x390], xmm0
140ce0774: 4889bd70030000 mov qword ptr [rbp + 0x370], rdi
140ce077b: 48899d78030000 mov qword ptr [rbp + 0x378], rbx
140ce0782: c6850304000001 mov byte ptr [rbp + 0x403], 1
140ce0789: 488d15a8312c05 lea rdx, [rip + 0x52c31a8]
140ce0790: 488d4da0 lea rcx, [rbp - 0x60]
140ce0794: 4c8d8570030000 lea r8, [rbp + 0x370]
140ce079b: e890c6ee04 call 0x145bcce30
140ce07a0: 90 nop 
140ce07a1: c6850304000001 mov byte ptr [rbp + 0x403], 1
140ce07a8: 488d4da0 lea rcx, [rbp - 0x60]
140ce07ac: e83fa232ff call 0x14000a9f0
140ce07b1: 90 nop 
140ce07b2: 48c7857003000000000000 mov qword ptr [rbp + 0x370], 0
140ce07bd: c7858803000000000000 mov dword ptr [rbp + 0x388], 0
140ce07c7: c6858c03000000 mov byte ptr [rbp + 0x38c], 0
140ce07ce: c6850304000000 mov byte ptr [rbp + 0x403], 0
140ce07d5: 488d4da0 lea rcx, [rbp - 0x60]
140ce07d9: 488d9590030000 lea rdx, [rbp + 0x390]
140ce07e0: 4c8d8570030000 lea r8, [rbp + 0x370]
140ce07e7: e8546bfdff call 0x140cb7340
140ce07ec: 90 nop 
140ce07ed: 488d55a0 lea rdx, [rbp - 0x60]
140ce07f1: 4889f1 mov rcx, rsi
140ce07f4: e8a79b83ff call 0x14051a3a0

; correction-constructor 0x140930f20..0x14093102a
140930f20: 55 push rbp
140930f21: 56 push rsi
140930f22: 57 push rdi
140930f23: 53 push rbx
140930f24: 4881ec58060000 sub rsp, 0x658
140930f2b: 488dac2480000000 lea rbp, [rsp + 0x80]
140930f33: 48c785d0050000feffffff mov qword ptr [rbp + 0x5d0], 0xfffffffffffffffe
140930f3e: 89d3 mov ebx, edx
140930f40: 4889ce mov rsi, rcx
140930f43: 48c745e0ffffffff mov qword ptr [rbp - 0x20], 0xffffffffffffffff
140930f4b: c785c005000000000000 mov dword ptr [rbp + 0x5c0], 0
140930f55: c685c405000000 mov byte ptr [rbp + 0x5c4], 0
140930f5c: e89f126dff call 0x140002200
140930f61: b928060000 mov ecx, 0x628
140930f66: ba08000000 mov edx, 8
140930f6b: e850126dff call 0x1400021c0
140930f70: 4885c0 test rax, rax
140930f73: 0f849f000000 je 0x140931018
140930f79: 4889c7 mov rdi, rax
140930f7c: 488d55a0 lea rdx, [rbp - 0x60]
140930f80: 41b828060000 mov r8d, 0x628
140930f86: 4889c1 mov rcx, rax
140930f89: e859912c05 call 0x145bfa0e7
140930f8e: 4c8d05eb125b05 lea r8, [rip + 0x55b12eb]
140930f95: 488d4da0 lea rcx, [rbp - 0x60]
140930f99: 4889fa mov rdx, rdi
140930f9c: e88fec4e04 call 0x144e1fc30
140930fa1: 889dcf050000 mov byte ptr [rbp + 0x5cf], bl
140930fa7: 488b0df2267507 mov rcx, qword ptr [rip + 0x77526f2]
140930fae: 4c8d0573126805 lea r8, [rip + 0x5681273]
140930fb5: 488d95cf050000 lea rdx, [rbp + 0x5cf]
140930fbc: e8dfa3c5ff call 0x14058b3a0
140930fc1: 90 nop 
140930fc2: 4989d0 mov r8, rdx
140930fc5: 488d4da0 lea rcx, [rbp - 0x60]
140930fc9: 4889c2 mov rdx, rax
140930fcc: e87fc680ff call 0x14013d650
140930fd1: 90 nop 
140930fd2: 0f104500 movups xmm0, xmmword ptr [rbp]
140930fd6: 0f114660 movups xmmword ptr [rsi + 0x60], xmm0
140930fda: 0f1045f0 movups xmm0, xmmword ptr [rbp - 0x10]
140930fde: 0f114650 movups xmmword ptr [rsi + 0x50], xmm0
140930fe2: 0f1045e0 movups xmm0, xmmword ptr [rbp - 0x20]
140930fe6: 0f114640 movups xmmword ptr [rsi + 0x40], xmm0
140930fea: 0f1045a0 movups xmm0, xmmword ptr [rbp - 0x60]
140930fee: 0f104db0 movups xmm1, xmmword ptr [rbp - 0x50]
140930ff2: 0f1055c0 movups xmm2, xmmword ptr [rbp - 0x40]
140930ff6: 0f105dd0 movups xmm3, xmmword ptr [rbp - 0x30]
140930ffa: 0f115e30 movups xmmword ptr [rsi + 0x30], xmm3
140930ffe: 0f115620 movups xmmword ptr [rsi + 0x20], xmm2
140931002: 0f114e10 movups xmmword ptr [rsi + 0x10], xmm1
140931006: 0f1106 movups xmmword ptr [rsi], xmm0
140931009: 4889f0 mov rax, rsi
14093100c: 4881c458060000 add rsp, 0x658
140931013: 5b pop rbx
140931014: 5f pop rdi
140931015: 5e pop rsi
140931016: 5d pop rbp
140931017: c3 ret 
140931018: b908000000 mov ecx, 8
14093101d: ba28060000 mov edx, 0x628
140931022: e87a824605 call 0x145d992a1
140931027: 90 nop 
140931028: 0f0b ud2 

; shake-constructor 0x140930db0..0x140930ebd
140930db0: 55 push rbp
140930db1: 56 push rsi
140930db2: 57 push rdi
140930db3: 53 push rbx
140930db4: 4881ecc8030000 sub rsp, 0x3c8
140930dbb: 488dac2480000000 lea rbp, [rsp + 0x80]
140930dc3: 48c78540030000feffffff mov qword ptr [rbp + 0x340], 0xfffffffffffffffe
140930dce: 89d3 mov ebx, edx
140930dd0: 4889ce mov rsi, rcx
140930dd3: 48c78590000000ffffffff mov qword ptr [rbp + 0x90], 0xffffffffffffffff
140930dde: c7853003000000000000 mov dword ptr [rbp + 0x330], 0
140930de8: c6853403000000 mov byte ptr [rbp + 0x334], 0
140930def: e80c146dff call 0x140002200
140930df4: b998030000 mov ecx, 0x398
140930df9: ba08000000 mov edx, 8
140930dfe: e8bd136dff call 0x1400021c0
140930e03: 4885c0 test rax, rax
140930e06: 0f849f000000 je 0x140930eab
140930e0c: 4889c7 mov rdi, rax
140930e0f: 488d55a0 lea rdx, [rbp - 0x60]
140930e13: 41b898030000 mov r8d, 0x398
140930e19: 4889c1 mov rcx, rax
140930e1c: e8c6922c05 call 0x145bfa0e7
140930e21: 4c8d05e8f05a05 lea r8, [rip + 0x55af0e8]
140930e28: 488d4da0 lea rcx, [rbp - 0x60]
140930e2c: 4889fa mov rdx, rdi
140930e2f: e8fced4e04 call 0x144e1fc30
140930e34: 889d3f030000 mov byte ptr [rbp + 0x33f], bl
140930e3a: 488b0d5f287507 mov rcx, qword ptr [rip + 0x775285f]
140930e41: 4c8d05e0136805 lea r8, [rip + 0x56813e0]
140930e48: 488d953f030000 lea rdx, [rbp + 0x33f]
140930e4f: e84ca5c5ff call 0x14058b3a0
140930e54: 90 nop 
140930e55: 4989d0 mov r8, rdx
140930e58: 488d4da0 lea rcx, [rbp - 0x60]
140930e5c: 4889c2 mov rdx, rax
140930e5f: e8ecc780ff call 0x14013d650
140930e64: 90 nop 
140930e65: 0f104500 movups xmm0, xmmword ptr [rbp]
140930e69: 0f114660 movups xmmword ptr [rsi + 0x60], xmm0
140930e6d: 0f1045f0 movups xmm0, xmmword ptr [rbp - 0x10]
140930e71: 0f114650 movups xmmword ptr [rsi + 0x50], xmm0
140930e75: 0f1045e0 movups xmm0, xmmword ptr [rbp - 0x20]
140930e79: 0f114640 movups xmmword ptr [rsi + 0x40], xmm0
140930e7d: 0f1045a0 movups xmm0, xmmword ptr [rbp - 0x60]
140930e81: 0f104db0 movups xmm1, xmmword ptr [rbp - 0x50]
140930e85: 0f1055c0 movups xmm2, xmmword ptr [rbp - 0x40]
140930e89: 0f105dd0 movups xmm3, xmmword ptr [rbp - 0x30]
140930e8d: 0f115e30 movups xmmword ptr [rsi + 0x30], xmm3
140930e91: 0f115620 movups xmmword ptr [rsi + 0x20], xmm2
140930e95: 0f114e10 movups xmmword ptr [rsi + 0x10], xmm1
140930e99: 0f1106 movups xmmword ptr [rsi], xmm0
140930e9c: 4889f0 mov rax, rsi
140930e9f: 4881c4c8030000 add rsp, 0x3c8
140930ea6: 5b pop rbx
140930ea7: 5f pop rdi
140930ea8: 5e pop rsi
140930ea9: 5d pop rbp
140930eaa: c3 ret 
140930eab: b908000000 mov ecx, 8
140930eb0: ba98030000 mov edx, 0x398
140930eb5: e8e7834605 call 0x145d992a1
140930eba: 90 nop 
140930ebb: 0f0b ud2 

; control-constructor 0x140d97cc0..0x140d97dc7
140d97cc0: 55 push rbp
140d97cc1: 56 push rsi
140d97cc2: 57 push rdi
140d97cc3: b8b0110000 mov eax, 0x11b0
140d97cc8: e8d318e604 call 0x145bf95a0
140d97ccd: 4829c4 sub rsp, rax
140d97cd0: 488dac2480000000 lea rbp, [rsp + 0x80]
140d97cd8: 48c78528110000feffffff mov qword ptr [rbp + 0x1128], 0xfffffffffffffffe
140d97ce3: 4889ce mov rsi, rcx
140d97ce6: 48c745a8ffffffff mov qword ptr [rbp - 0x58], 0xffffffffffffffff
140d97cee: c7851811000000000000 mov dword ptr [rbp + 0x1118], 0
140d97cf8: c6851c11000000 mov byte ptr [rbp + 0x111c], 0
140d97cff: e8fca426ff call 0x140002200
140d97d04: b978110000 mov ecx, 0x1178
140d97d09: ba08000000 mov edx, 8
140d97d0e: e8ada426ff call 0x1400021c0
140d97d13: 4885c0 test rax, rax
140d97d16: 0f8499000000 je 0x140d97db5
140d97d1c: 4889c7 mov rdi, rax
140d97d1f: 488d55a8 lea rdx, [rbp - 0x58]
140d97d23: 41b878110000 mov r8d, 0x1178
140d97d29: 4889c1 mov rcx, rax
140d97d2c: e8b623e604 call 0x145bfa0e7
140d97d31: 4c8d05d8902205 lea r8, [rip + 0x52290d8]
140d97d38: 488d4da8 lea rcx, [rbp - 0x58]
140d97d3c: 4889fa mov rdx, rdi
140d97d3f: e8ec7e0804 call 0x144e1fc30
140d97d44: 90 nop 
140d97d45: 488b0d54b92e07 mov rcx, qword ptr [rip + 0x72eb954]
140d97d4c: 4c8d0535412105 lea r8, [rip + 0x5214135]
140d97d53: 488d9527110000 lea rdx, [rbp + 0x1127]
140d97d5a: e841367fff call 0x14058b3a0
140d97d5f: 90 nop 
140d97d60: 4989d0 mov r8, rdx
140d97d63: 488d4da8 lea rcx, [rbp - 0x58]
140d97d67: 4889c2 mov rdx, rax
140d97d6a: e8e1583aff call 0x14013d650
140d97d6f: 90 nop 
140d97d70: 0f104508 movups xmm0, xmmword ptr [rbp + 8]
140d97d74: 0f114660 movups xmmword ptr [rsi + 0x60], xmm0
140d97d78: 0f1045f8 movups xmm0, xmmword ptr [rbp - 8]
140d97d7c: 0f114650 movups xmmword ptr [rsi + 0x50], xmm0
140d97d80: 0f1045e8 movups xmm0, xmmword ptr [rbp - 0x18]
140d97d84: 0f114640 movups xmmword ptr [rsi + 0x40], xmm0
140d97d88: 0f1045a8 movups xmm0, xmmword ptr [rbp - 0x58]
140d97d8c: 0f104db8 movups xmm1, xmmword ptr [rbp - 0x48]
140d97d90: 0f1055c8 movups xmm2, xmmword ptr [rbp - 0x38]
140d97d94: 0f105dd8 movups xmm3, xmmword ptr [rbp - 0x28]
140d97d98: 0f115e30 movups xmmword ptr [rsi + 0x30], xmm3
140d97d9c: 0f115620 movups xmmword ptr [rsi + 0x20], xmm2
140d97da0: 0f114e10 movups xmmword ptr [rsi + 0x10], xmm1
140d97da4: 0f1106 movups xmmword ptr [rsi], xmm0
140d97da7: 4889f0 mov rax, rsi
140d97daa: 4881c4b0110000 add rsp, 0x11b0
140d97db1: 5f pop rdi
140d97db2: 5e pop rsi
140d97db3: 5d pop rbp
140d97db4: c3 ret 
140d97db5: b908000000 mov ecx, 8
140d97dba: ba78110000 mov edx, 0x1178
140d97dbf: e8dd140005 call 0x145d992a1
140d97dc4: 90 nop 
140d97dc5: 0f0b ud2 

; control-default-set 0x14129eb00..0x14129eb84
14129eb00: 55 push rbp
14129eb01: 56 push rsi
14129eb02: 4883ec38 sub rsp, 0x38
14129eb06: 488d6c2430 lea rbp, [rsp + 0x30]
14129eb0b: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
14129eb13: 4889ce mov rsi, rcx
14129eb16: e8e536d6fe call 0x140002200
14129eb1b: b910000000 mov ecx, 0x10
14129eb20: ba08000000 mov edx, 8
14129eb25: e89636d6fe call 0x1400021c0
14129eb2a: 4885c0 test rax, rax
14129eb2d: 7444 je 0x14129eb73
14129eb2f: 488945f0 mov qword ptr [rbp - 0x10], rax
14129eb33: 488b0d664bde06 mov rcx, qword ptr [rip + 0x6de4b66]
14129eb3a: 4c8d059748d904 lea r8, [rip + 0x4d94897]
14129eb41: 488d55ff lea rdx, [rbp - 1]
14129eb45: e856c82eff call 0x14058b3a0
14129eb4a: 90 nop 
14129eb4b: 488b4df0 mov rcx, qword ptr [rbp - 0x10]
14129eb4f: 488901 mov qword ptr [rcx], rax
14129eb52: 48895108 mov qword ptr [rcx + 8], rdx
14129eb56: 48c70601000000 mov qword ptr [rsi], 1
14129eb5d: 48894e08 mov qword ptr [rsi + 8], rcx
14129eb61: 48c7461001000000 mov qword ptr [rsi + 0x10], 1
14129eb69: 4889f0 mov rax, rsi
14129eb6c: 4883c438 add rsp, 0x38
14129eb70: 5e pop rsi
14129eb71: 5d pop rbp
14129eb72: c3 ret 
14129eb73: b908000000 mov ecx, 8
14129eb78: ba10000000 mov edx, 0x10
14129eb7d: e81fa7af04 call 0x145d992a1
14129eb82: 0f0b ud2 

; shake-default-set 0x1412a4b10..0x1412a4b94
1412a4b10: 55 push rbp
1412a4b11: 56 push rsi
1412a4b12: 4883ec38 sub rsp, 0x38
1412a4b16: 488d6c2430 lea rbp, [rsp + 0x30]
1412a4b1b: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
1412a4b23: 4889ce mov rsi, rcx
1412a4b26: e8d5d6d5fe call 0x140002200
1412a4b2b: b910000000 mov ecx, 0x10
1412a4b30: ba08000000 mov edx, 8
1412a4b35: e886d6d5fe call 0x1400021c0
1412a4b3a: 4885c0 test rax, rax
1412a4b3d: 7444 je 0x1412a4b83
1412a4b3f: 488945f0 mov qword ptr [rbp - 0x10], rax
1412a4b43: 488b0d56ebdd06 mov rcx, qword ptr [rip + 0x6ddeb56]
1412a4b4a: 4c8d05c717d904 lea r8, [rip + 0x4d917c7]
1412a4b51: 488d55ff lea rdx, [rbp - 1]
1412a4b55: e846682eff call 0x14058b3a0
1412a4b5a: 90 nop 
1412a4b5b: 488b4df0 mov rcx, qword ptr [rbp - 0x10]
1412a4b5f: 488901 mov qword ptr [rcx], rax
1412a4b62: 48895108 mov qword ptr [rcx + 8], rdx
1412a4b66: 48c70601000000 mov qword ptr [rsi], 1
1412a4b6d: 48894e08 mov qword ptr [rsi + 8], rcx
1412a4b71: 48c7461001000000 mov qword ptr [rsi + 0x10], 1
1412a4b79: 4889f0 mov rax, rsi
1412a4b7c: 4883c438 add rsp, 0x38
1412a4b80: 5e pop rsi
1412a4b81: 5d pop rbp
1412a4b82: c3 ret 
1412a4b83: b908000000 mov ecx, 8
1412a4b88: ba10000000 mov edx, 0x10
1412a4b8d: e80f47af04 call 0x145d992a1
1412a4b92: 0f0b ud2 

; control-set-eq 0x140a4bd90..0x140a4bdbc
140a4bd90: 4883ec38 sub rsp, 0x38
140a4bd94: 488d4c2420 lea rcx, [rsp + 0x20]
140a4bd99: 41ff5018 call qword ptr [r8 + 0x18]
140a4bd9d: 660f6f442420 movdqa xmm0, xmmword ptr [rsp + 0x20]
140a4bda3: 660f7405759a4905 pcmpeqb xmm0, xmmword ptr [rip + 0x5499a75]
140a4bdab: 660fd7c0 pmovmskb eax, xmm0
140a4bdaf: 3dffff0000 cmp eax, 0xffff
140a4bdb4: 0f94c0 sete al
140a4bdb7: 4883c438 add rsp, 0x38
140a4bdbb: c3 ret 

; shake-set-eq 0x140a4c840..0x140a4c86c
140a4c840: 4883ec38 sub rsp, 0x38
140a4c844: 488d4c2420 lea rcx, [rsp + 0x20]
140a4c849: 41ff5018 call qword ptr [r8 + 0x18]
140a4c84d: 660f6f442420 movdqa xmm0, xmmword ptr [rsp + 0x20]
140a4c853: 660f740555934905 pcmpeqb xmm0, xmmword ptr [rip + 0x5499355]
140a4c85b: 660fd7c0 pmovmskb eax, xmm0
140a4c85f: 3dffff0000 cmp eax, 0xffff
140a4c864: 0f94c0 sete al
140a4c867: 4883c438 add rsp, 0x38
140a4c86b: c3 ret 

; dependency-constructor 0x144e07e60..0x144e07e84
144e07e60: 4889c8 mov rax, rcx
144e07e63: 885130 mov byte ptr [rcx + 0x30], dl
144e07e66: 4c8901 mov qword ptr [rcx], r8
144e07e69: 4c894908 mov qword ptr [rcx + 8], r9
144e07e6d: 0f10058c07d301 movups xmm0, xmmword ptr [rip + 0x1d3078c]
144e07e74: 0f114110 movups xmmword ptr [rcx + 0x10], xmm0
144e07e78: 0f10059107d301 movups xmm0, xmmword ptr [rip + 0x1d30791]
144e07e7f: 0f114120 movups xmmword ptr [rcx + 0x20], xmm0
144e07e83: c3 ret 

; before-config 0x14013d550..0x14013d603
14013d550: 55 push rbp
14013d551: 4156 push r14
14013d553: 56 push rsi
14013d554: 57 push rdi
14013d555: 53 push rbx
14013d556: 4883ec60 sub rsp, 0x60
14013d55a: 488d6c2460 lea rbp, [rsp + 0x60]
14013d55f: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
14013d567: 4c89c7 mov rdi, r8
14013d56a: 4889d3 mov rbx, rdx
14013d56d: 4889ce mov rsi, rcx
14013d570: 488339ff cmp qword ptr [rcx], -1
14013d574: 7459 je 0x14013d5cf
14013d576: 488d4dc0 lea rcx, [rbp - 0x40]
14013d57a: 31d2 xor edx, edx
14013d57c: 4989d8 mov r8, rbx
14013d57f: 4989f9 mov r9, rdi
14013d582: e8d9a8cc04 call 0x144e07e60
14013d587: 488b7e28 mov rdi, qword ptr [rsi + 0x28]
14013d58b: 483b7e18 cmp rdi, qword ptr [rsi + 0x18]
14013d58f: 750a jne 0x14013d59b
14013d591: 488d4e18 lea rcx, [rsi + 0x18]
14013d595: e806d8ab05 call 0x145bfada0
14013d59a: 90 nop 
14013d59b: 488b4620 mov rax, qword ptr [rsi + 0x20]
14013d59f: 486bcf38 imul rcx, rdi, 0x38
14013d5a3: 488b55f0 mov rdx, qword ptr [rbp - 0x10]
14013d5a7: 4889540830 mov qword ptr [rax + rcx + 0x30], rdx
14013d5ac: 0f1045c0 movups xmm0, xmmword ptr [rbp - 0x40]
14013d5b0: 0f104dd0 movups xmm1, xmmword ptr [rbp - 0x30]
14013d5b4: 0f1055e0 movups xmm2, xmmword ptr [rbp - 0x20]
14013d5b8: 0f11540820 movups xmmword ptr [rax + rcx + 0x20], xmm2
14013d5bd: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14013d5c2: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14013d5c6: 48ffc7 inc rdi
14013d5c9: 48897e28 mov qword ptr [rsi + 0x28], rdi
14013d5cd: eb29 jmp 0x14013d5f8
14013d5cf: 488b4618 mov rax, qword ptr [rsi + 0x18]
14013d5d3: 4885c0 test rax, rax
14013d5d6: 7420 je 0x14013d5f8
14013d5d8: 488b4e10 mov rcx, qword ptr [rsi + 0x10]
14013d5dc: 486bf070 imul rsi, rax, 0x70
14013d5e0: 4c8d7170 lea r14, [rcx + 0x70]
14013d5e4: 4889da mov rdx, rbx
14013d5e7: 4989f8 mov r8, rdi
14013d5ea: e861ffffff call 0x14013d550
14013d5ef: 4c89f1 mov rcx, r14
14013d5f2: 4883c690 add rsi, -0x70
14013d5f6: 75e8 jne 0x14013d5e0
14013d5f8: 4883c460 add rsp, 0x60
14013d5fc: 5b pop rbx
14013d5fd: 5f pop rdi
14013d5fe: 5e pop rsi
14013d5ff: 415e pop r14
14013d601: 5d pop rbp
14013d602: c3 ret 

; membership-config 0x14013d650..0x14013d6d2
14013d650: 4156 push r14
14013d652: 56 push rsi
14013d653: 57 push rdi
14013d654: 53 push rbx
14013d655: 4883ec28 sub rsp, 0x28
14013d659: 4c89c6 mov rsi, r8
14013d65c: 4889d7 mov rdi, rdx
14013d65f: 488b01 mov rax, qword ptr [rcx]
14013d662: 4883f8ff cmp rax, -1
14013d666: 7431 je 0x14013d699
14013d668: 4c8b7110 mov r14, qword ptr [rcx + 0x10]
14013d66c: 4939c6 cmp r14, rax
14013d66f: 750b jne 0x14013d67c
14013d671: 4889cb mov rbx, rcx
14013d674: e877d8ab05 call 0x145bfaef0
14013d679: 4889d9 mov rcx, rbx
14013d67c: 488b4108 mov rax, qword ptr [rcx + 8]
14013d680: 4c89f2 mov rdx, r14
14013d683: 48c1e204 shl rdx, 4
14013d687: 48893c10 mov qword ptr [rax + rdx], rdi
14013d68b: 4889741008 mov qword ptr [rax + rdx + 8], rsi
14013d690: 49ffc6 inc r14
14013d693: 4c897110 mov qword ptr [rcx + 0x10], r14
14013d697: eb2f jmp 0x14013d6c8
14013d699: 488b4118 mov rax, qword ptr [rcx + 0x18]
14013d69d: 4885c0 test rax, rax
14013d6a0: 7426 je 0x14013d6c8
14013d6a2: 488b4910 mov rcx, qword ptr [rcx + 0x10]
14013d6a6: 486bd870 imul rbx, rax, 0x70
14013d6aa: 660f1f440000 nop word ptr [rax + rax]
14013d6b0: 4c8d7170 lea r14, [rcx + 0x70]
14013d6b4: 4889fa mov rdx, rdi
14013d6b7: 4989f0 mov r8, rsi
14013d6ba: e891ffffff call 0x14013d650
14013d6bf: 4c89f1 mov rcx, r14
14013d6c2: 4883c390 add rbx, -0x70
14013d6c6: 75e8 jne 0x14013d6b0
14013d6c8: 4883c428 add rsp, 0x28
14013d6cc: 5b pop rbx
14013d6cd: 5f pop rdi
14013d6ce: 5e pop rsi
14013d6cf: 415e pop r14
14013d6d1: c3 ret 

; graph-dependency-consumer 0x144e9767f..0x144e977a6
144e9767f: 0fb67030 movzx esi, byte ptr [rax + 0x30]
144e97683: 4080fe02 cmp sil, 2
144e97687: 0f841a030000 je 0x144e979a7
144e9768d: 488b10 mov rdx, qword ptr [rax]
144e97690: 4c8b4008 mov r8, qword ptr [rax + 8]
144e97694: 0f104010 movups xmm0, xmmword ptr [rax + 0x10]
144e97698: 0f104820 movups xmm1, xmmword ptr [rax + 0x20]
144e9769c: 0f294d70 movaps xmmword ptr [rbp + 0x70], xmm1
144e976a0: 0f294560 movaps xmmword ptr [rbp + 0x60], xmm0
144e976a4: f30f6f4010 movdqu xmm0, xmmword ptr [rax + 0x10]
144e976a9: f30f6f4820 movdqu xmm1, xmmword ptr [rax + 0x20]
144e976ae: 660f7f4d10 movdqa xmmword ptr [rbp + 0x10], xmm1
144e976b3: 660f7f4500 movdqa xmmword ptr [rbp], xmm0
144e976b8: 488b8db0000000 mov rcx, qword ptr [rbp + 0xb0]
144e976bf: e8ac650000 call 0x144e9dc70
144e976c4: 90 nop 
144e976c5: 4189c2 mov r10d, eax
144e976c8: 0f284560 movaps xmm0, xmmword ptr [rbp + 0x60]
144e976cc: 0f284d70 movaps xmm1, xmmword ptr [rbp + 0x70]
144e976d0: 488d85df000000 lea rax, [rbp + 0xdf]
144e976d7: 0f114810 movups xmmword ptr [rax + 0x10], xmm1
144e976db: 0f1100 movups xmmword ptr [rax], xmm0
144e976de: 0f1085d8000000 movups xmm0, xmmword ptr [rbp + 0xd8]
144e976e5: 0f108de8000000 movups xmm1, xmmword ptr [rbp + 0xe8]
144e976ec: 0f2945a0 movaps xmmword ptr [rbp - 0x60], xmm0
144e976f0: 0f294db0 movaps xmmword ptr [rbp - 0x50], xmm1
144e976f4: 40f6c601 test sil, 1
144e976f8: 41bb01000000 mov r11d, 1
144e976fe: 488b4d48 mov rcx, qword ptr [rbp + 0x48]
144e97702: 440f45d9 cmovne r11d, ecx
144e97706: 488b85f7000000 mov rax, qword ptr [rbp + 0xf7]
144e9770d: 4489d3 mov ebx, r10d
144e97710: 4c8b4d58 mov r9, qword ptr [rbp + 0x58]
144e97714: 410f45d9 cmovne ebx, r9d
144e97718: 488945bf mov qword ptr [rbp - 0x41], rax
144e9771c: 4189d7 mov r15d, edx
144e9771f: 488b4550 mov rax, qword ptr [rbp + 0x50]
144e97723: 440f45f8 cmovne r15d, eax
144e97727: 4c8d45a7 lea r8, [rbp - 0x59]
144e9772b: f3410f6f00 movdqu xmm0, xmmword ptr [r8]
144e97730: 89ce mov esi, ecx
144e97732: b901000000 mov ecx, 1
144e97737: 0f45f1 cmovne esi, ecx
144e9773a: f3410f6f4810 movdqu xmm1, xmmword ptr [r8 + 0x10]
144e97740: 4589ce mov r14d, r9d
144e97743: 4c8955d0 mov qword ptr [rbp - 0x30], r10
144e97747: 450f45f2 cmovne r14d, r10d
144e9774b: 660f7f4d10 movdqa xmmword ptr [rbp + 0x10], xmm1
144e97750: 4189c5 mov r13d, eax
144e97753: 895534 mov dword ptr [rbp + 0x34], edx
144e97756: 440f45ea cmovne r13d, edx
144e9775a: 660f7f4500 movdqa xmmword ptr [rbp], xmm0
144e9775f: 488b8508010000 mov rax, qword ptr [rbp + 0x108]
144e97766: c680b801000001 mov byte ptr [rax + 0x1b8], 1
144e9776d: 897560 mov dword ptr [rbp + 0x60], esi
144e97770: 44897564 mov dword ptr [rbp + 0x64], r14d
144e97774: 44896d68 mov dword ptr [rbp + 0x68], r13d
144e97778: 44895d30 mov dword ptr [rbp + 0x30], r11d
144e9777c: 44899dd8000000 mov dword ptr [rbp + 0xd8], r11d
144e97783: 89df mov edi, ebx
144e97785: 899ddc000000 mov dword ptr [rbp + 0xdc], ebx
144e9778b: 4489bde0000000 mov dword ptr [rbp + 0xe0], r15d
144e97792: 488b4d40 mov rcx, qword ptr [rbp + 0x40]
144e97796: 488d5560 lea rdx, [rbp + 0x60]
144e9779a: 4c8d85d8000000 lea r8, [rbp + 0xd8]
144e977a1: e82a4a0200 call 0x144ebc1d0

; correction-system-run-call 0x1409b1980..0x1409b199c
1409b1980: 4889542430 mov qword ptr [rsp + 0x30], rdx
1409b1985: 48894c2428 mov qword ptr [rsp + 0x28], rcx
1409b198a: 4889442420 mov qword ptr [rsp + 0x20], rax
1409b198f: 488d942490000000 lea rdx, [rsp + 0x90]
1409b1997: e8f467fdff call 0x140988190

; control-system-run-call 0x140ea3b75..0x140ea3b8a
140ea3b75: 4c8d8424c0040000 lea r8, [rsp + 0x4c0]
140ea3b7d: 4c8d8c24e0040000 lea r9, [rsp + 0x4e0]
140ea3b85: e8e6f1fcff call 0x140e72d70

; shake-system-run-call 0x1409b2487..0x1409b24a0
1409b2487: 4889542430 mov qword ptr [rsp + 0x30], rdx
1409b248c: 48894c2428 mov qword ptr [rsp + 0x28], rcx
1409b2491: 4889442420 mov qword ptr [rsp + 0x20], rax
1409b2496: 488d542440 lea rdx, [rsp + 0x40]
1409b249b: e8d025fbff call 0x140964a70

; world-stage-debug 0x140d60440..0x140d60467
140d60440: 4889d0 mov rax, rdx
140d60443: 0fb609 movzx ecx, byte ptr [rcx]
140d60446: 488d15ab302505 lea rdx, [rip + 0x52530ab]
140d6044d: 4c8b04ca mov r8, qword ptr [rdx + rcx*8]
140d60451: 4c8d0dc0302505 lea r9, [rip + 0x52530c0]
140d60458: 49631489 movsxd rdx, dword ptr [r9 + rcx*4]
140d6045c: 4c01ca add rdx, r9
140d6045f: 4889c1 mov rcx, rax
140d60462: e98938e704 jmp 0x145bd3cf0

; in-world-debug 0x1409a0530..0x1409a0545
1409a0530: 4889d1 mov rcx, rdx
1409a0533: 488d158e265405 lea rdx, [rip + 0x554268e]
1409a053a: 41b80c000000 mov r8d, 0xc
1409a0540: e9ab372305 jmp 0x145bd3cf0

; condition-append 0x140cb7340..0x140cb74d7
140cb7340: 55 push rbp
140cb7341: 4156 push r14
140cb7343: 56 push rsi
140cb7344: 57 push rdi
140cb7345: 53 push rbx
140cb7346: 4883ec50 sub rsp, 0x50
140cb734a: 488d6c2450 lea rbp, [rsp + 0x50]
140cb734f: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
140cb7357: 410fb6581c movzx ebx, byte ptr [r8 + 0x1c]
140cb735c: f6c301 test bl, 1
140cb735f: 488955e8 mov qword ptr [rbp - 0x18], rdx
140cb7363: 0f8541010000 jne 0x140cb74aa
140cb7369: 4c89c7 mov rdi, r8
140cb736c: 4989d6 mov r14, rdx
140cb736f: 4889ce mov rsi, rcx
140cb7372: e889ae34ff call 0x140002200
140cb7377: b920000000 mov ecx, 0x20
140cb737c: ba08000000 mov edx, 8
140cb7381: e83aae34ff call 0x1400021c0
140cb7386: 4885c0 test rax, rax
140cb7389: 0f8409010000 je 0x140cb7498
140cb738f: 0f1007 movups xmm0, xmmword ptr [rdi]
140cb7392: 0f104f0c movups xmm1, xmmword ptr [rdi + 0xc]
140cb7396: 0f11480c movups xmmword ptr [rax + 0xc], xmm1
140cb739a: 0f1100 movups xmmword ptr [rax], xmm0
140cb739d: 88581c mov byte ptr [rax + 0x1c], bl
140cb73a0: 0fb64f1f movzx ecx, byte ptr [rdi + 0x1f]
140cb73a4: 88481f mov byte ptr [rax + 0x1f], cl
140cb73a7: 0fb74f1d movzx ecx, word ptr [rdi + 0x1d]
140cb73ab: 488945e0 mov qword ptr [rbp - 0x20], rax
140cb73af: 6689481d mov word ptr [rax + 0x1d], cx
140cb73b3: 49833eff cmp qword ptr [r14], -1
140cb73b7: 7444 je 0x140cb73fd
140cb73b9: 498b7e58 mov rdi, qword ptr [r14 + 0x58]
140cb73bd: 493b7e48 cmp rdi, qword ptr [r14 + 0x48]
140cb73c1: 750e jne 0x140cb73d1
140cb73c3: 488b45e8 mov rax, qword ptr [rbp - 0x18]
140cb73c7: 488d4848 lea rcx, [rax + 0x48]
140cb73cb: e8203bf404 call 0x145bfaef0
140cb73d0: 90 nop 
140cb73d1: 4c8b45e8 mov r8, qword ptr [rbp - 0x18]
140cb73d5: 498b4050 mov rax, qword ptr [r8 + 0x50]
140cb73d9: 4889f9 mov rcx, rdi
140cb73dc: 48c1e104 shl rcx, 4
140cb73e0: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
140cb73e4: 48891408 mov qword ptr [rax + rcx], rdx
140cb73e8: 488d1599c02e05 lea rdx, [rip + 0x52ec099]
140cb73ef: 4889540808 mov qword ptr [rax + rcx + 8], rdx
140cb73f4: 48ffc7 inc rdi
140cb73f7: 49897858 mov qword ptr [r8 + 0x58], rdi
140cb73fb: eb42 jmp 0x140cb743f
140cb73fd: 498b7e30 mov rdi, qword ptr [r14 + 0x30]
140cb7401: 493b7e20 cmp rdi, qword ptr [r14 + 0x20]
140cb7405: 750e jne 0x140cb7415
140cb7407: 488b45e8 mov rax, qword ptr [rbp - 0x18]
140cb740b: 488d4820 lea rcx, [rax + 0x20]
140cb740f: e8dc3af404 call 0x145bfaef0
140cb7414: 90 nop 
140cb7415: 4c8b45e8 mov r8, qword ptr [rbp - 0x18]
140cb7419: 498b4028 mov rax, qword ptr [r8 + 0x28]
140cb741d: 4889f9 mov rcx, rdi
140cb7420: 48c1e104 shl rcx, 4
140cb7424: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
140cb7428: 48891408 mov qword ptr [rax + rcx], rdx
140cb742c: 488d1555c02e05 lea rdx, [rip + 0x52ec055]
140cb7433: 4889540808 mov qword ptr [rax + rcx + 8], rdx
140cb7438: 48ffc7 inc rdi
140cb743b: 49897830 mov qword ptr [r8 + 0x30], rdi
140cb743f: 410f104060 movups xmm0, xmmword ptr [r8 + 0x60]
140cb7444: 0f114660 movups xmmword ptr [rsi + 0x60], xmm0
140cb7448: 498b4050 mov rax, qword ptr [r8 + 0x50]
140cb744c: 48894650 mov qword ptr [rsi + 0x50], rax
140cb7450: 498b4058 mov rax, qword ptr [r8 + 0x58]
140cb7454: 48894658 mov qword ptr [rsi + 0x58], rax
140cb7458: 410f104040 movups xmm0, xmmword ptr [r8 + 0x40]
140cb745d: 0f114640 movups xmmword ptr [rsi + 0x40], xmm0
140cb7461: 410f1000 movups xmm0, xmmword ptr [r8]
140cb7465: 410f104810 movups xmm1, xmmword ptr [r8 + 0x10]
140cb746a: 410f105020 movups xmm2, xmmword ptr [r8 + 0x20]
140cb746f: 498b4030 mov rax, qword ptr [r8 + 0x30]
140cb7473: 48894630 mov qword ptr [rsi + 0x30], rax
140cb7477: 498b4038 mov rax, qword ptr [r8 + 0x38]
140cb747b: 48894638 mov qword ptr [rsi + 0x38], rax
140cb747f: 0f115620 movups xmmword ptr [rsi + 0x20], xmm2
140cb7483: 0f114e10 movups xmmword ptr [rsi + 0x10], xmm1
140cb7487: 0f1106 movups xmmword ptr [rsi], xmm0
140cb748a: 4889f0 mov rax, rsi
140cb748d: 4883c450 add rsp, 0x50
140cb7491: 5b pop rbx
140cb7492: 5f pop rdi
140cb7493: 5e pop rsi
140cb7494: 415e pop r14
140cb7496: 5d pop rbp
140cb7497: c3 ret 
140cb7498: b908000000 mov ecx, 8
140cb749d: ba20000000 mov edx, 0x20
140cb74a2: e8fa1d0e05 call 0x145d992a1
140cb74a7: 90 nop 
140cb74a8: eb2b jmp 0x140cb74d5
140cb74aa: 488d45f7 lea rax, [rbp - 9]
140cb74ae: 488945d0 mov qword ptr [rbp - 0x30], rax
140cb74b2: 488d05475e3404 lea rax, [rip + 0x4345e47]
140cb74b9: 488945d8 mov qword ptr [rbp - 0x28], rax
140cb74bd: 488d0d54b72e05 lea rcx, [rip + 0x52eb754]
140cb74c4: 4c8d0515b82e05 lea r8, [rip + 0x52eb815]
140cb74cb: 488d55d0 lea rdx, [rbp - 0x30]
140cb74cf: e85c230e05 call 0x145d99830
140cb74d4: 90 nop 
140cb74d5: 0f0b ud2 

; negated-presence-run 0x140d04d00..0x140d04dbf
140d04d00: 4883ec38 sub rsp, 0x38
140d04d04: b801000000 mov eax, 1
140d04d09: f0410fc180b0050000 lock xadd dword ptr [r8 + 0x5b0], eax
140d04d12: 833a01 cmp dword ptr [rdx], 1
140d04d15: 7560 jne 0x140d04d77
140d04d17: 4d8b88a0050000 mov r9, qword ptr [r8 + 0x5a0]
140d04d1e: 4c894c2430 mov qword ptr [rsp + 0x30], r9
140d04d23: 4c394a10 cmp qword ptr [rdx + 0x10], r9
140d04d27: 7568 jne 0x140d04d91
140d04d29: 4c8b5208 mov r10, qword ptr [rdx + 8]
140d04d2d: 41b101 mov r9b, 1
140d04d30: 4d3b9018020000 cmp r10, qword ptr [r8 + 0x218]
140d04d37: 7328 jae 0x140d04d61
140d04d39: 4d8b9810020000 mov r11, qword ptr [r8 + 0x210]
140d04d40: 4f8b14d3 mov r10, qword ptr [r11 + r10*8]
140d04d44: 4d85d2 test r10, r10
140d04d47: 7418 je 0x140d04d61
140d04d49: 4d8b80e0010000 mov r8, qword ptr [r8 + 0x1e0]
140d04d50: 49f7d2 not r10
140d04d53: 4d6bca38 imul r9, r10, 0x38
140d04d57: 470fb64c0830 movzx r9d, byte ptr [r8 + r9 + 0x30]
140d04d5d: 4180f101 xor r9b, 1
140d04d61: 894218 mov dword ptr [rdx + 0x18], eax
140d04d64: 44884908 mov byte ptr [rcx + 8], r9b
140d04d68: 48c701fdffffff mov qword ptr [rcx], 0xfffffffffffffffd
140d04d6f: 4889c8 mov rax, rcx
140d04d72: 4883c438 add rsp, 0x38
140d04d76: c3 ret 
140d04d77: 488d0daac12a05 lea rcx, [rip + 0x52ac1aa]
140d04d7e: 4c8d0503c22a05 lea r8, [rip + 0x52ac203]
140d04d85: ba59000000 mov edx, 0x59
140d04d8a: e8e1470905 call 0x145d99570
140d04d8f: 0f0b ud2 
140d04d91: 4883c210 add rdx, 0x10
140d04d95: 488d0574c22a05 lea rax, [rip + 0x52ac274]
140d04d9c: 4889442428 mov qword ptr [rsp + 0x28], rax
140d04da1: 48c7442420df000000 mov qword ptr [rsp + 0x20], 0xdf
140d04daa: 4c8d0defc12a05 lea r9, [rip + 0x52ac1ef]
140d04db1: 4c8d442430 lea r8, [rsp + 0x30]
140d04db6: 31c9 xor ecx, ecx
140d04db8: e8603b0405 call 0x145d4891d
140d04dbd: 0f0b ud2 

; negated-presence-init 0x140d04ba0..0x140d04ccc
140d04ba0: 55 push rbp
140d04ba1: 56 push rsi
140d04ba2: 57 push rdi
140d04ba3: 53 push rbx
140d04ba4: 4881ecd8000000 sub rsp, 0xd8
140d04bab: 488dac2480000000 lea rbp, [rsp + 0x80]
140d04bb3: 48c74550feffffff mov qword ptr [rbp + 0x50], 0xfffffffffffffffe
140d04bbb: 4c89c3 mov rbx, r8
140d04bbe: 4889d7 mov rdi, rdx
140d04bc1: 4889ce mov rsi, rcx
140d04bc4: 833a01 cmp dword ptr [rdx], 1
140d04bc7: 751b jne 0x140d04be4
140d04bc9: 488b83a0050000 mov rax, qword ptr [rbx + 0x5a0]
140d04bd0: 488945b8 mov qword ptr [rbp - 0x48], rax
140d04bd4: 48394710 cmp qword ptr [rdi + 0x10], rax
140d04bd8: 0f85be000000 jne 0x140d04c9c
140d04bde: 488b5708 mov rdx, qword ptr [rdi + 8]
140d04be2: eb21 jmp 0x140d04c05
140d04be4: 4889d9 mov rcx, rbx
140d04be7: e874e40200 call 0x140d33060
140d04bec: 4889c2 mov rdx, rax
140d04bef: 488b83a0050000 mov rax, qword ptr [rbx + 0x5a0]
140d04bf6: 48c70701000000 mov qword ptr [rdi], 1
140d04bfd: 48895708 mov qword ptr [rdi + 8], rdx
140d04c01: 48894710 mov qword ptr [rdi + 0x10], rax
140d04c05: b80050cc3d mov eax, 0x3dcc5000
140d04c0a: 0383b0050000 add eax, dword ptr [rbx + 0x5b0]
140d04c10: 894718 mov dword ptr [rdi + 0x18], eax
140d04c13: 48c745d010000000 mov qword ptr [rbp - 0x30], 0x10
140d04c1b: 0f57c0 xorps xmm0, xmm0
140d04c1e: 0f1145d8 movups xmmword ptr [rbp - 0x28], xmm0
140d04c22: 48c745e810000000 mov qword ptr [rbp - 0x18], 0x10
140d04c2a: 0f1145f0 movups xmmword ptr [rbp - 0x10], xmm0
140d04c2e: 48c7450010000000 mov qword ptr [rbp], 0x10
140d04c36: 0f114508 movups xmmword ptr [rbp + 8], xmm0
140d04c3a: 48c7451810000000 mov qword ptr [rbp + 0x18], 0x10
140d04c42: 0f114520 movups xmmword ptr [rbp + 0x20], xmm0
140d04c46: 48c7453010000000 mov qword ptr [rbp + 0x30], 0x10
140d04c4e: 48c745b800000000 mov qword ptr [rbp - 0x48], 0
140d04c56: 0f114538 movups xmmword ptr [rbp + 0x38], xmm0
140d04c5a: c7454800000000 mov dword ptr [rbp + 0x48], 0
140d04c61: 48c745c008000000 mov qword ptr [rbp - 0x40], 8
140d04c69: 48c745c800000000 mov qword ptr [rbp - 0x38], 0
140d04c71: 488d4db8 lea rcx, [rbp - 0x48]
140d04c75: e8a6fc1704 call 0x144e84920
140d04c7a: 90 nop 
140d04c7b: 488d55b8 lea rdx, [rbp - 0x48]
140d04c7f: 41b898000000 mov r8d, 0x98
140d04c85: 4889f1 mov rcx, rsi
140d04c88: e85a54ef04 call 0x145bfa0e7
140d04c8d: 4889f0 mov rax, rsi
140d04c90: 4881c4d8000000 add rsp, 0xd8
140d04c97: 5b pop rbx
140d04c98: 5f pop rdi
140d04c99: 5e pop rsi
140d04c9a: 5d pop rbp
140d04c9b: c3 ret 
140d04c9c: 4883c710 add rdi, 0x10
140d04ca0: 488d0569c22a05 lea rax, [rip + 0x52ac269]
140d04ca7: 4889442428 mov qword ptr [rsp + 0x28], rax
140d04cac: 48c744242083000000 mov qword ptr [rsp + 0x20], 0x83
140d04cb5: 4c8d0d0dc22a05 lea r9, [rip + 0x52ac20d]
140d04cbc: 4c8d45b8 lea r8, [rbp - 0x48]
140d04cc0: 31c9 xor ecx, ecx
140d04cc2: 4889fa mov rdx, rdi
140d04cc5: e8533c0405 call 0x145d4891d
140d04cca: 0f0b ud2 

; gated-resource-registration 0x140d33060..0x140d33384
140d33060: 55 push rbp
140d33061: 4156 push r14
140d33063: 56 push rsi
140d33064: 57 push rdi
140d33065: 53 push rbx
140d33066: 4881ecc0000000 sub rsp, 0xc0
140d3306d: 488dac2480000000 lea rbp, [rsp + 0x80]
140d33075: 48c74538feffffff mov qword ptr [rbp + 0x38], 0xfffffffffffffffe
140d3307d: 4889c8 mov rax, rcx
140d33080: 4883c140 add rcx, 0x40
140d33084: 488d90a8050000 lea rdx, [rax + 0x5a8]
140d3308b: 48894d28 mov qword ptr [rbp + 0x28], rcx
140d3308f: 48895530 mov qword ptr [rbp + 0x30], rdx
140d33093: 48c7451000000000 mov qword ptr [rbp + 0x10], 0
140d3309b: 48c7451808000000 mov qword ptr [rbp + 0x18], 8
140d330a3: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
140d330ab: 4883b89000000000 cmp qword ptr [rax + 0x90], 0
140d330b3: 0f84a0000000 je 0x140d33159
140d330b9: 49b91444b2cd266fdff8 movabs r9, 0xf8df6f26cdb24414
140d330c3: 4c8b4078 mov r8, qword ptr [rax + 0x78]
140d330c7: 4c8b9080000000 mov r10, qword ptr [rax + 0x80]
140d330ce: 4531db xor r11d, r11d
140d330d1: 660f6f0577ff0905 movdqa xmm0, xmmword ptr [rip + 0x509ff77]
140d330d9: 660f76c9 pcmpeqd xmm1, xmm1
140d330dd: 660f6f15bb031705 movdqa xmm2, xmmword ptr [rip + 0x51703bb]
140d330e5: 4d21d1 and r9, r10
140d330e8: f3430f6f1c08 movdqu xmm3, xmmword ptr [r8 + r9]
140d330ee: 660f6fe3 movdqa xmm4, xmm3
140d330f2: 660f74e0 pcmpeqb xmm4, xmm0
140d330f6: 660fd7f4 pmovmskb esi, xmm4
140d330fa: 85f6 test esi, esi
140d330fc: 7442 je 0x140d33140
140d330fe: f30fbcfe tzcnt edi, esi
140d33102: 4c01cf add rdi, r9
140d33105: 4c21d7 and rdi, r10
140d33108: 48f7df neg rdi
140d3310b: 488d3c7f lea rdi, [rdi + rdi*2]
140d3310f: f3410f6f64f8e8 movdqu xmm4, xmmword ptr [r8 + rdi*8 - 0x18]
140d33116: 660f74e2 pcmpeqb xmm4, xmm2
140d3311a: 660fd7dc pmovmskb ebx, xmm4
140d3311e: 81fbffff0000 cmp ebx, 0xffff
140d33124: 0f84e3000000 je 0x140d3320d
140d3312a: 8d7eff lea edi, [rsi - 1]
140d3312d: 6621f7 and di, si
140d33130: 89fe mov esi, edi
140d33132: 75ca jne 0x140d330fe
140d33134: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140d33140: 660f74d9 pcmpeqb xmm3, xmm1
140d33144: 660fd7f3 pmovmskb esi, xmm3
140d33148: 85f6 test esi, esi
140d3314a: 750d jne 0x140d33159
140d3314c: 4d01d9 add r9, r11
140d3314f: 4983c110 add r9, 0x10
140d33153: 4983c310 add r11, 0x10
140d33157: eb8c jmp 0x140d330e5
140d33159: 440fb680a0000000 movzx r8d, byte ptr [rax + 0xa0]
140d33161: 4c8b80e0000000 mov r8, qword ptr [rax + 0xe0]
140d33168: 4c8b88e8000000 mov r9, qword ptr [rax + 0xe8]
140d3316f: 49ba1444b2cd266fdff8 movabs r10, 0xf8df6f26cdb24414
140d33179: 4531db xor r11d, r11d
140d3317c: 660f6f05ccfe0905 movdqa xmm0, xmmword ptr [rip + 0x509fecc]
140d33184: 660f76c9 pcmpeqd xmm1, xmm1
140d33188: 660f6f1510031705 movdqa xmm2, xmmword ptr [rip + 0x5170310]
140d33190: 4d21ca and r10, r9
140d33193: f3430f6f1c10 movdqu xmm3, xmmword ptr [r8 + r10]
140d33199: 660f6fe3 movdqa xmm4, xmm3
140d3319d: 660f74e0 pcmpeqb xmm4, xmm0
140d331a1: 660fd7dc pmovmskb ebx, xmm4
140d331a5: 85db test ebx, ebx
140d331a7: 7447 je 0x140d331f0
140d331a9: f30fbcfb tzcnt edi, ebx
140d331ad: 4c01d7 add rdi, r10
140d331b0: 4c21cf and rdi, r9
140d331b3: 4989fe mov r14, rdi
140d331b6: 49c1e607 shl r14, 7
140d331ba: 4c89c6 mov rsi, r8
140d331bd: 4c29f6 sub rsi, r14
140d331c0: f30f6f6680 movdqu xmm4, xmmword ptr [rsi - 0x80]
140d331c5: 660f74e2 pcmpeqb xmm4, xmm2
140d331c9: 66440fd7f4 pmovmskb r14d, xmm4
140d331ce: 4181feffff0000 cmp r14d, 0xffff
140d331d5: 7443 je 0x140d3321a
140d331d7: 8d73ff lea esi, [rbx - 1]
140d331da: 6621de and si, bx
140d331dd: 89f3 mov ebx, esi
140d331df: 75c8 jne 0x140d331a9
140d331e1: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140d331f0: 660f74d9 pcmpeqb xmm3, xmm1
140d331f4: 660fd7f3 pmovmskb esi, xmm3
140d331f8: 85f6 test esi, esi
140d331fa: 0f858c000000 jne 0x140d3328c
140d33200: 4d01da add r10, r11
140d33203: 4983c210 add r10, 0x10
140d33207: 4983c310 add r11, 0x10
140d3320b: eb83 jmp 0x140d33190
140d3320d: 498d04f8 lea rax, [r8 + rdi*8]
140d33211: 488b70f8 mov rsi, qword ptr [rax - 8]
140d33215: e959010000 jmp 0x140d33373
140d3321a: 4c8d57f0 lea r10, [rdi - 0x10]
140d3321e: 4d21ca and r10, r9
140d33221: f3430f6f0410 movdqu xmm0, xmmword ptr [r8 + r10]
140d33227: 660f76c9 pcmpeqd xmm1, xmm1
140d3322b: 660f74c1 pcmpeqb xmm0, xmm1
140d3322f: 66440fd7c8 pmovmskb r9d, xmm0
140d33234: f3410f6f0438 movdqu xmm0, xmmword ptr [r8 + rdi]
140d3323a: 660f74c1 pcmpeqb xmm0, xmm1
140d3323e: 66440fd7d8 pmovmskb r11d, xmm0
140d33243: 66bb1f00 mov bx, 0x1f
140d33247: 66410fbdd9 bsr bx, r9w
140d3324c: 83f30f xor ebx, 0xf
140d3324f: 4181cb00000100 or r11d, 0x10000
140d33256: f3450fbcdb tzcnt r11d, r11d
140d3325b: 4101db add r11d, ebx
140d3325e: 41b180 mov r9b, 0x80
140d33261: 664183fb0f cmp r11w, 0xf
140d33266: 770a ja 0x140d33272
140d33268: 48ff80f0000000 inc qword ptr [rax + 0xf0]
140d3326f: 41b1ff mov r9b, 0xff
140d33272: 45880c38 mov byte ptr [r8 + rdi], r9b
140d33276: 47884c1010 mov byte ptr [r8 + r10 + 0x10], r9b
140d3327b: 48ff88f8000000 dec qword ptr [rax + 0xf8]
140d33282: 4c8b4690 mov r8, qword ptr [rsi - 0x70]
140d33286: 4983f802 cmp r8, 2
140d3328a: 7576 jne 0x140d33302
140d3328c: 4889c7 mov rdi, rax
140d3328f: 488b32 mov rsi, qword ptr [rdx]
140d33292: 488d4601 lea rax, [rsi + 1]
140d33296: 488902 mov qword ptr [rdx], rax
140d33299: 66c745f00001 mov word ptr [rbp - 0x10], 0x100
140d3329f: 48c745a001000000 mov qword ptr [rbp - 0x60], 1
140d332a7: f30f6f05b1142705 movdqu xmm0, xmmword ptr [rip + 0x52714b1]
140d332af: f30f7f45a8 movdqu xmmword ptr [rbp - 0x58], xmm0
140d332b4: 48c745c801000000 mov qword ptr [rbp - 0x38], 1
140d332bc: 48c745d000000000 mov qword ptr [rbp - 0x30], 0
140d332c4: 48c745e800000000 mov qword ptr [rbp - 0x18], 0
140d332cc: c645f201 mov byte ptr [rbp - 0xe], 1
140d332d0: 48c745b800000000 mov qword ptr [rbp - 0x48], 0
140d332d8: c645d802 mov byte ptr [rbp - 0x28], 2
140d332dc: 4c8d45a0 lea r8, [rbp - 0x60]
140d332e0: 4889f2 mov rdx, rsi
140d332e3: e848c02dff call 0x14000f330
140d332e8: 90 nop 
140d332e9: 4889f9 mov rcx, rdi
140d332ec: 4883c178 add rcx, 0x78
140d332f0: 488d1569142705 lea rdx, [rip + 0x5271469]
140d332f7: 4989f0 mov r8, rsi
140d332fa: e881be2dff call 0x14000f180
140d332ff: 90 nop 
140d33300: eb71 jmp 0x140d33373
140d33302: 488b46f8 mov rax, qword ptr [rsi - 8]
140d33306: 48894508 mov qword ptr [rbp + 8], rax
140d3330a: 0f1046e8 movups xmm0, xmmword ptr [rsi - 0x18]
140d3330e: 0f1145f8 movups xmmword ptr [rbp - 8], xmm0
140d33312: 0f1046d8 movups xmm0, xmmword ptr [rsi - 0x28]
140d33316: 0f1145e8 movups xmmword ptr [rbp - 0x18], xmm0
140d3331a: f30f6f4698 movdqu xmm0, xmmword ptr [rsi - 0x68]
140d3331f: f30f6f4ea8 movdqu xmm1, xmmword ptr [rsi - 0x58]
140d33324: f30f6f56b8 movdqu xmm2, xmmword ptr [rsi - 0x48]
140d33329: f30f6f5ec8 movdqu xmm3, xmmword ptr [rsi - 0x38]
140d3332e: f30f7f5dd8 movdqu xmmword ptr [rbp - 0x28], xmm3
140d33333: f30f7f55c8 movdqu xmmword ptr [rbp - 0x38], xmm2
140d33338: f30f7f4db8 movdqu xmmword ptr [rbp - 0x48], xmm1
140d3333d: f30f7f45a8 movdqu xmmword ptr [rbp - 0x58], xmm0
140d33342: 4c8945a0 mov qword ptr [rbp - 0x60], r8
140d33346: 488d4da0 lea rcx, [rbp - 0x60]
140d3334a: 488d5510 lea rdx, [rbp + 0x10]
140d3334e: e8cd5b0d04 call 0x144e08f20
140d33353: 90 nop 
140d33354: 4889c6 mov rsi, rax
140d33357: 488b5510 mov rdx, qword ptr [rbp + 0x10]
140d3335b: 4885d2 test rdx, rdx
140d3335e: 7413 je 0x140d33373
140d33360: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
140d33364: 48c1e203 shl rdx, 3
140d33368: 41b808000000 mov r8d, 8
140d3336e: e85dee2cff call 0x1400021d0
140d33373: 4889f0 mov rax, rsi
140d33376: 4881c4c0000000 add rsp, 0xc0
140d3337d: 5b pop rbx
140d3337e: 5f pop rdi
140d3337f: 5e pop rsi
140d33380: 415e pop r14
140d33382: 5d pop rbp
140d33383: c3 ret 
