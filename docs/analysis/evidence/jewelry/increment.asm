14589e0e0: 440fb64944 movzx r9d, byte ptr [rcx + 0x44]
14589e0e5: 4183f910 cmp r9d, 0x10
14589e0e9: 7516 jne 0x14589e101
14589e0eb: 31c0 xor eax, eax
14589e0ed: 4883fa03 cmp rdx, 3
14589e0f1: 0f93c0 setae al
14589e0f4: 488d0d55d96a00 lea rcx, [rip + 0x6ad955]
14589e0fb: f30f100481 movss xmm0, dword ptr [rcx + rax*4]
14589e100: c3 ret
14589e101: 410fb600 movzx eax, byte ptr [r8]
14589e105: 84c0 test al, al
14589e107: 750f jne 0x14589e118
14589e109: 0f57d2 xorps xmm2, xmm2
14589e10c: 7412 je 0x14589e120
14589e10e: f30f10054af15000 movss xmm0, dword ptr [rip + 0x50f14a]
14589e116: eb10 jmp 0x14589e128
14589e118: f3410f105004 movss xmm2, dword ptr [r8 + 4]
14589e11e: 75ee jne 0x14589e10e
14589e120: f30f100570cf5100 movss xmm0, dword ptr [rip + 0x51cf70]
14589e128: 4883fa04 cmp rdx, 4
14589e12c: 41ba04000000 mov r10d, 4
14589e132: 4c0f42d2 cmovb r10, rdx
14589e136: 418b5008 mov edx, dword ptr [r8 + 8]
14589e13a: f30f105940 movss xmm3, dword ptr [rcx + 0x40]
14589e13f: 4489d1 mov ecx, r10d
14589e142: 4c8d05b70f3601 lea r8, [rip + 0x1360fb7]
14589e149: f3410f100c88 movss xmm1, dword ptr [r8 + rcx*4]
14589e14f: f30f59cb mulss xmm1, xmm3
14589e153: f30f59c8 mulss xmm1, xmm0
14589e157: f30f100569335100 movss xmm0, dword ptr [rip + 0x513369]
14589e15f: 4183f913 cmp r9d, 0x13
14589e163: 772f ja 0x14589e194
14589e165: 4489c9 mov ecx, r9d
14589e168: 4c8d05a57c3601 lea r8, [rip + 0x1367ca5]
14589e16f: 49630c88 movsxd rcx, dword ptr [r8 + rcx*4]
14589e173: 4c01c1 add rcx, r8
14589e176: ffe1 jmp rcx
14589e178: f30f100514825600 movss xmm0, dword ptr [rip + 0x568214]
14589e180: eb16 jmp 0x14589e198
14589e182: f30f1005f6f25000 movss xmm0, dword ptr [rip + 0x50f2f6]
14589e18a: eb08 jmp 0x14589e194
14589e18c: f30f1005a0895100 movss xmm0, dword ptr [rip + 0x5189a0]
14589e194: f30f59c3 mulss xmm0, xmm3
14589e198: f30f5cc2 subss xmm0, xmm2
14589e19c: 0f57e4 xorps xmm4, xmm4
14589e19f: f30f5fc4 maxss xmm0, xmm4
14589e1a3: 410fb6c9 movzx ecx, r9b
14589e1a7: 80f909 cmp cl, 9
14589e1aa: 0f873a050000 ja 0x14589e6ea
14589e1b0: 41b81b030000 mov r8d, 0x31b
14589e1b6: 410fa3c8 bt r8d, ecx
14589e1ba: 733f jae 0x14589e1fb
14589e1bc: f30f10159cf05000 movss xmm2, dword ptr [rip + 0x50f09c]
14589e1c4: 84c0 test al, al
14589e1c6: 7416 je 0x14589e1de
14589e1c8: 89d0 mov eax, edx
14589e1ca: 0f57db xorps xmm3, xmm3
14589e1cd: f3480f2ad8 cvtsi2ss xmm3, rax
14589e1d2: f30f591daaf25000 mulss xmm3, dword ptr [rip + 0x50f2aa]
14589e1da: f30f58d3 addss xmm2, xmm3
14589e1de: f30f5eca divss xmm1, xmm2
14589e1e2: 0f28d1 movaps xmm2, xmm1
14589e1e5: f30f5dd0 minss xmm2, xmm0
14589e1e9: 0f28c2 movaps xmm0, xmm2
14589e1ec: f30fc2c203 cmpunordss xmm0, xmm2
14589e1f1: 0f54c8 andps xmm1, xmm0
14589e1f4: 0f55c2 andnps xmm0, xmm2
14589e1f7: 0f56c1 orps xmm0, xmm1
14589e1fa: c3 ret
14589e1fb: b864000000 mov eax, 0x64
14589e200: 0fa3c8 bt eax, ecx
14589e203: 0f83e1040000 jae 0x14589e6ea
14589e209: f30f591d6ff25000 mulss xmm3, dword ptr [rip + 0x50f26f]
14589e211: f30f590d3b5c8100 mulss xmm1, dword ptr [rip + 0x815c3b]
14589e219: 0f2eda ucomiss xmm3, xmm2
14589e21c: 0f8387020000 jae 0x14589e4a9
14589e222: 0f28c3 movaps xmm0, xmm3
14589e225: f30f5ec2 divss xmm0, xmm2
14589e229: f30f59c0 mulss xmm0, xmm0
14589e22d: f30f59055b315100 mulss xmm0, dword ptr [rip + 0x51315b]
14589e235: f30f59c1 mulss xmm0, xmm1
14589e239: f30f58c2 addss xmm0, xmm2
14589e23d: 0f2ed8 ucomiss xmm3, xmm0
14589e240: 0f828c020000 jb 0x14589e4d2
14589e246: f30f10257ebc6900 movss xmm4, dword ptr [rip + 0x69bc7e]
14589e24e: f30f59e0 mulss xmm4, xmm0
14589e252: f30f5ee3 divss xmm4, xmm3
14589e256: f30f582502f05000 addss xmm4, dword ptr [rip + 0x50f002]
14589e25e: f30f59e1 mulss xmm4, xmm1
14589e262: f30f58c4 addss xmm0, xmm4
14589e266: 0f2ed8 ucomiss xmm3, xmm0
14589e269: 0f8287020000 jb 0x14589e4f6
14589e26f: f30f102555bc6900 movss xmm4, dword ptr [rip + 0x69bc55]
14589e277: f30f59e0 mulss xmm4, xmm0
14589e27b: f30f5ee3 divss xmm4, xmm3
14589e27f: f30f5825d9ef5000 addss xmm4, dword ptr [rip + 0x50efd9]
14589e287: f30f59e1 mulss xmm4, xmm1
14589e28b: f30f58c4 addss xmm0, xmm4
14589e28f: 0f2ed8 ucomiss xmm3, xmm0
14589e292: 0f8282020000 jb 0x14589e51a
14589e298: f30f10252cbc6900 movss xmm4, dword ptr [rip + 0x69bc2c]
14589e2a0: f30f59e0 mulss xmm4, xmm0
14589e2a4: f30f5ee3 divss xmm4, xmm3
14589e2a8: f30f5825b0ef5000 addss xmm4, dword ptr [rip + 0x50efb0]
14589e2b0: f30f59e1 mulss xmm4, xmm1
14589e2b4: f30f58c4 addss xmm0, xmm4
14589e2b8: 0f2ed8 ucomiss xmm3, xmm0
14589e2bb: 0f827d020000 jb 0x14589e53e
14589e2c1: f30f102503bc6900 movss xmm4, dword ptr [rip + 0x69bc03]
14589e2c9: f30f59e0 mulss xmm4, xmm0
14589e2cd: f30f5ee3 divss xmm4, xmm3
14589e2d1: f30f582587ef5000 addss xmm4, dword ptr [rip + 0x50ef87]
14589e2d9: f30f59e1 mulss xmm4, xmm1
14589e2dd: f30f58c4 addss xmm0, xmm4
14589e2e1: 0f2ed8 ucomiss xmm3, xmm0
14589e2e4: 0f8278020000 jb 0x14589e562
14589e2ea: f30f1025dabb6900 movss xmm4, dword ptr [rip + 0x69bbda]
14589e2f2: f30f59e0 mulss xmm4, xmm0
14589e2f6: f30f5ee3 divss xmm4, xmm3
14589e2fa: f30f58255eef5000 addss xmm4, dword ptr [rip + 0x50ef5e]
14589e302: f30f59e1 mulss xmm4, xmm1
14589e306: f30f58c4 addss xmm0, xmm4
14589e30a: 0f2ed8 ucomiss xmm3, xmm0
14589e30d: 0f8273020000 jb 0x14589e586
14589e313: f30f1025b1bb6900 movss xmm4, dword ptr [rip + 0x69bbb1]
14589e31b: f30f59e0 mulss xmm4, xmm0
14589e31f: f30f5ee3 divss xmm4, xmm3
14589e323: f30f582535ef5000 addss xmm4, dword ptr [rip + 0x50ef35]
14589e32b: f30f59e1 mulss xmm4, xmm1
14589e32f: f30f58c4 addss xmm0, xmm4
14589e333: 0f2ed8 ucomiss xmm3, xmm0
14589e336: 0f826e020000 jb 0x14589e5aa
14589e33c: f30f102588bb6900 movss xmm4, dword ptr [rip + 0x69bb88]
14589e344: f30f59e0 mulss xmm4, xmm0
14589e348: f30f5ee3 divss xmm4, xmm3
14589e34c: f30f58250cef5000 addss xmm4, dword ptr [rip + 0x50ef0c]
14589e354: f30f59e1 mulss xmm4, xmm1
14589e358: f30f58c4 addss xmm0, xmm4
14589e35c: 0f2ed8 ucomiss xmm3, xmm0
14589e35f: 0f8269020000 jb 0x14589e5ce
14589e365: f30f10255fbb6900 movss xmm4, dword ptr [rip + 0x69bb5f]
14589e36d: f30f59e0 mulss xmm4, xmm0
14589e371: f30f5ee3 divss xmm4, xmm3
14589e375: f30f5825e3ee5000 addss xmm4, dword ptr [rip + 0x50eee3]
14589e37d: f30f59e1 mulss xmm4, xmm1
14589e381: f30f58c4 addss xmm0, xmm4
14589e385: 0f2ed8 ucomiss xmm3, xmm0
14589e388: 0f8264020000 jb 0x14589e5f2
14589e38e: f30f102536bb6900 movss xmm4, dword ptr [rip + 0x69bb36]
14589e396: f30f59e0 mulss xmm4, xmm0
14589e39a: f30f5ee3 divss xmm4, xmm3
14589e39e: f30f5825baee5000 addss xmm4, dword ptr [rip + 0x50eeba]
14589e3a6: f30f59e1 mulss xmm4, xmm1
14589e3aa: f30f58c4 addss xmm0, xmm4
14589e3ae: 0f2ed8 ucomiss xmm3, xmm0
14589e3b1: 0f825f020000 jb 0x14589e616
14589e3b7: f30f10250dbb6900 movss xmm4, dword ptr [rip + 0x69bb0d]
14589e3bf: f30f59e0 mulss xmm4, xmm0
14589e3c3: f30f5ee3 divss xmm4, xmm3
14589e3c7: f30f582591ee5000 addss xmm4, dword ptr [rip + 0x50ee91]
14589e3cf: f30f59e1 mulss xmm4, xmm1
14589e3d3: f30f58c4 addss xmm0, xmm4
14589e3d7: 0f2ed8 ucomiss xmm3, xmm0
14589e3da: 0f825a020000 jb 0x14589e63a
14589e3e0: f30f1025e4ba6900 movss xmm4, dword ptr [rip + 0x69bae4]
14589e3e8: f30f59e0 mulss xmm4, xmm0
14589e3ec: f30f5ee3 divss xmm4, xmm3
14589e3f0: f30f582568ee5000 addss xmm4, dword ptr [rip + 0x50ee68]
14589e3f8: f30f59e1 mulss xmm4, xmm1
14589e3fc: f30f58c4 addss xmm0, xmm4
14589e400: 0f2ed8 ucomiss xmm3, xmm0
14589e403: 0f8255020000 jb 0x14589e65e
14589e409: f30f1025bbba6900 movss xmm4, dword ptr [rip + 0x69babb]
14589e411: f30f59e0 mulss xmm4, xmm0
14589e415: f30f5ee3 divss xmm4, xmm3
14589e419: f30f58253fee5000 addss xmm4, dword ptr [rip + 0x50ee3f]
14589e421: f30f59e1 mulss xmm4, xmm1
14589e425: f30f58c4 addss xmm0, xmm4
14589e429: 0f2ed8 ucomiss xmm3, xmm0
14589e42c: 0f8250020000 jb 0x14589e682
14589e432: f30f102592ba6900 movss xmm4, dword ptr [rip + 0x69ba92]
14589e43a: f30f59e0 mulss xmm4, xmm0
14589e43e: f30f5ee3 divss xmm4, xmm3
14589e442: f30f582516ee5000 addss xmm4, dword ptr [rip + 0x50ee16]
14589e44a: f30f59e1 mulss xmm4, xmm1
14589e44e: f30f58c4 addss xmm0, xmm4
14589e452: 0f2ed8 ucomiss xmm3, xmm0
14589e455: 0f824b020000 jb 0x14589e6a6
14589e45b: f30f102569ba6900 movss xmm4, dword ptr [rip + 0x69ba69]
14589e463: f30f59e0 mulss xmm4, xmm0
14589e467: f30f5ee3 divss xmm4, xmm3
14589e46b: f30f5825eded5000 addss xmm4, dword ptr [rip + 0x50eded]
14589e473: f30f59e1 mulss xmm4, xmm1
14589e477: f30f58c4 addss xmm0, xmm4
14589e47b: 0f2ed8 ucomiss xmm3, xmm0
14589e47e: 0f8246020000 jb 0x14589e6ca
14589e484: f30f102540ba6900 movss xmm4, dword ptr [rip + 0x69ba40]
14589e48c: f30f59e0 mulss xmm4, xmm0
14589e490: f30f5ee3 divss xmm4, xmm3
14589e494: f30f5825c4ed5000 addss xmm4, dword ptr [rip + 0x50edc4]
14589e49c: f30f59cc mulss xmm1, xmm4
14589e4a0: f30f58c1 addss xmm0, xmm1
14589e4a4: f30f5cc2 subss xmm0, xmm2
14589e4a8: c3 ret
14589e4a9: f30f10051bba6900 movss xmm0, dword ptr [rip + 0x69ba1b]
14589e4b1: f30f59c2 mulss xmm0, xmm2
14589e4b5: f30f5ec3 divss xmm0, xmm3
14589e4b9: f30f58059fed5000 addss xmm0, dword ptr [rip + 0x50ed9f]
14589e4c1: f30f59c1 mulss xmm0, xmm1
14589e4c5: f30f58c2 addss xmm0, xmm2
14589e4c9: 0f2ed8 ucomiss xmm3, xmm0
14589e4cc: 0f8374fdffff jae 0x14589e246
14589e4d2: 0f28e3 movaps xmm4, xmm3
14589e4d5: f30f5ee0 divss xmm4, xmm0
14589e4d9: f30f59e4 mulss xmm4, xmm4
14589e4dd: f30f5925ab2e5100 mulss xmm4, dword ptr [rip + 0x512eab]
14589e4e5: f30f59e1 mulss xmm4, xmm1
14589e4e9: f30f58c4 addss xmm0, xmm4
14589e4ed: 0f2ed8 ucomiss xmm3, xmm0
14589e4f0: 0f8379fdffff jae 0x14589e26f
14589e4f6: 0f28e3 movaps xmm4, xmm3
14589e4f9: f30f5ee0 divss xmm4, xmm0
14589e4fd: f30f59e4 mulss xmm4, xmm4
14589e501: f30f5925872e5100 mulss xmm4, dword ptr [rip + 0x512e87]
14589e509: f30f59e1 mulss xmm4, xmm1
14589e50d: f30f58c4 addss xmm0, xmm4
14589e511: 0f2ed8 ucomiss xmm3, xmm0
14589e514: 0f837efdffff jae 0x14589e298
14589e51a: 0f28e3 movaps xmm4, xmm3
14589e51d: f30f5ee0 divss xmm4, xmm0
14589e521: f30f59e4 mulss xmm4, xmm4
14589e525: f30f5925632e5100 mulss xmm4, dword ptr [rip + 0x512e63]
14589e52d: f30f59e1 mulss xmm4, xmm1
14589e531: f30f58c4 addss xmm0, xmm4
14589e535: 0f2ed8 ucomiss xmm3, xmm0
14589e538: 0f8383fdffff jae 0x14589e2c1
14589e53e: 0f28e3 movaps xmm4, xmm3
14589e541: f30f5ee0 divss xmm4, xmm0
14589e545: f30f59e4 mulss xmm4, xmm4
14589e549: f30f59253f2e5100 mulss xmm4, dword ptr [rip + 0x512e3f]
14589e551: f30f59e1 mulss xmm4, xmm1
14589e555: f30f58c4 addss xmm0, xmm4
14589e559: 0f2ed8 ucomiss xmm3, xmm0
14589e55c: 0f8388fdffff jae 0x14589e2ea
14589e562: 0f28e3 movaps xmm4, xmm3
14589e565: f30f5ee0 divss xmm4, xmm0
14589e569: f30f59e4 mulss xmm4, xmm4
14589e56d: f30f59251b2e5100 mulss xmm4, dword ptr [rip + 0x512e1b]
14589e575: f30f59e1 mulss xmm4, xmm1
14589e579: f30f58c4 addss xmm0, xmm4
14589e57d: 0f2ed8 ucomiss xmm3, xmm0
14589e580: 0f838dfdffff jae 0x14589e313
14589e586: 0f28e3 movaps xmm4, xmm3
14589e589: f30f5ee0 divss xmm4, xmm0
14589e58d: f30f59e4 mulss xmm4, xmm4
14589e591: f30f5925f72d5100 mulss xmm4, dword ptr [rip + 0x512df7]
14589e599: f30f59e1 mulss xmm4, xmm1
14589e59d: f30f58c4 addss xmm0, xmm4
14589e5a1: 0f2ed8 ucomiss xmm3, xmm0
14589e5a4: 0f8392fdffff jae 0x14589e33c
14589e5aa: 0f28e3 movaps xmm4, xmm3
14589e5ad: f30f5ee0 divss xmm4, xmm0
14589e5b1: f30f59e4 mulss xmm4, xmm4
14589e5b5: f30f5925d32d5100 mulss xmm4, dword ptr [rip + 0x512dd3]
14589e5bd: f30f59e1 mulss xmm4, xmm1
14589e5c1: f30f58c4 addss xmm0, xmm4
14589e5c5: 0f2ed8 ucomiss xmm3, xmm0
14589e5c8: 0f8397fdffff jae 0x14589e365
14589e5ce: 0f28e3 movaps xmm4, xmm3
14589e5d1: f30f5ee0 divss xmm4, xmm0
14589e5d5: f30f59e4 mulss xmm4, xmm4
14589e5d9: f30f5925af2d5100 mulss xmm4, dword ptr [rip + 0x512daf]
14589e5e1: f30f59e1 mulss xmm4, xmm1
14589e5e5: f30f58c4 addss xmm0, xmm4
14589e5e9: 0f2ed8 ucomiss xmm3, xmm0
14589e5ec: 0f839cfdffff jae 0x14589e38e
14589e5f2: 0f28e3 movaps xmm4, xmm3
14589e5f5: f30f5ee0 divss xmm4, xmm0
14589e5f9: f30f59e4 mulss xmm4, xmm4
14589e5fd: f30f59258b2d5100 mulss xmm4, dword ptr [rip + 0x512d8b]
14589e605: f30f59e1 mulss xmm4, xmm1
14589e609: f30f58c4 addss xmm0, xmm4
14589e60d: 0f2ed8 ucomiss xmm3, xmm0
14589e610: 0f83a1fdffff jae 0x14589e3b7
14589e616: 0f28e3 movaps xmm4, xmm3
14589e619: f30f5ee0 divss xmm4, xmm0
14589e61d: f30f59e4 mulss xmm4, xmm4
14589e621: f30f5925672d5100 mulss xmm4, dword ptr [rip + 0x512d67]
14589e629: f30f59e1 mulss xmm4, xmm1
14589e62d: f30f58c4 addss xmm0, xmm4
14589e631: 0f2ed8 ucomiss xmm3, xmm0
14589e634: 0f83a6fdffff jae 0x14589e3e0
14589e63a: 0f28e3 movaps xmm4, xmm3
14589e63d: f30f5ee0 divss xmm4, xmm0
14589e641: f30f59e4 mulss xmm4, xmm4
14589e645: f30f5925432d5100 mulss xmm4, dword ptr [rip + 0x512d43]
14589e64d: f30f59e1 mulss xmm4, xmm1
14589e651: f30f58c4 addss xmm0, xmm4
14589e655: 0f2ed8 ucomiss xmm3, xmm0
14589e658: 0f83abfdffff jae 0x14589e409
14589e65e: 0f28e3 movaps xmm4, xmm3
14589e661: f30f5ee0 divss xmm4, xmm0
14589e665: f30f59e4 mulss xmm4, xmm4
14589e669: f30f59251f2d5100 mulss xmm4, dword ptr [rip + 0x512d1f]
14589e671: f30f59e1 mulss xmm4, xmm1
14589e675: f30f58c4 addss xmm0, xmm4
14589e679: 0f2ed8 ucomiss xmm3, xmm0
14589e67c: 0f83b0fdffff jae 0x14589e432
14589e682: 0f28e3 movaps xmm4, xmm3
14589e685: f30f5ee0 divss xmm4, xmm0
14589e689: f30f59e4 mulss xmm4, xmm4
14589e68d: f30f5925fb2c5100 mulss xmm4, dword ptr [rip + 0x512cfb]
14589e695: f30f59e1 mulss xmm4, xmm1
14589e699: f30f58c4 addss xmm0, xmm4
14589e69d: 0f2ed8 ucomiss xmm3, xmm0
14589e6a0: 0f83b5fdffff jae 0x14589e45b
14589e6a6: 0f28e3 movaps xmm4, xmm3
14589e6a9: f30f5ee0 divss xmm4, xmm0
14589e6ad: f30f59e4 mulss xmm4, xmm4
14589e6b1: f30f5925d72c5100 mulss xmm4, dword ptr [rip + 0x512cd7]
14589e6b9: f30f59e1 mulss xmm4, xmm1
14589e6bd: f30f58c4 addss xmm0, xmm4
14589e6c1: 0f2ed8 ucomiss xmm3, xmm0
14589e6c4: 0f83bafdffff jae 0x14589e484
14589e6ca: f30f5ed8 divss xmm3, xmm0
14589e6ce: f30f59db mulss xmm3, xmm3
14589e6d2: f30f591db62c5100 mulss xmm3, dword ptr [rip + 0x512cb6]
14589e6da: 0f28e3 movaps xmm4, xmm3
14589e6dd: f30f59cc mulss xmm1, xmm4
14589e6e1: f30f58c1 addss xmm0, xmm1
14589e6e5: f30f5cc2 subss xmm0, xmm2
14589e6e9: c3 ret
14589e6ea: f30f59c8 mulss xmm1, xmm0
14589e6ee: f30f1015d22d5100 movss xmm2, dword ptr [rip + 0x512dd2]
14589e6f6: 83c1f9 add ecx, -7
14589e6f9: 83f90c cmp ecx, 0xc
14589e6fc: 774a ja 0x14589e748
14589e6fe: 488d055f773601 lea rax, [rip + 0x136775f]
14589e705: 48630c88 movsxd rcx, dword ptr [rax + rcx*4]
14589e709: 4801c1 add rcx, rax
14589e70c: ffe1 jmp rcx
14589e70e: f30f10156aed5000 movss xmm2, dword ptr [rip + 0x50ed6a]
14589e716: eb30 jmp 0x14589e748
14589e718: f30f100510305100 movss xmm0, dword ptr [rip + 0x513010]
14589e720: f30f5cc2 subss xmm0, xmm2
14589e724: 0f57d2 xorps xmm2, xmm2
14589e727: f30f5fc2 maxss xmm0, xmm2
14589e72b: f30f10152deb5000 movss xmm2, dword ptr [rip + 0x50eb2d]
14589e733: 84c0 test al, al
14589e735: 0f858dfaffff jne 0x14589e1c8
14589e73b: e99efaffff jmp 0x14589e1de
14589e740: f30f1015ec835100 movss xmm2, dword ptr [rip + 0x5183ec]
14589e748: f30f59da mulss xmm3, xmm2
14589e74c: f30f5ecb divss xmm1, xmm3
14589e750: e98dfaffff jmp 0x14589e1e2
