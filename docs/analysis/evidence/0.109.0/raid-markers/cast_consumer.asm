14067e670: 55 push rbp
14067e671: 4157 push r15
14067e673: 4156 push r14
14067e675: 4155 push r13
14067e677: 4154 push r12
14067e679: 56 push rsi
14067e67a: 57 push rdi
14067e67b: 53 push rbx
14067e67c: 4881ec98020000 sub rsp, 0x298
14067e683: 488dac2480000000 lea rbp, [rsp + 0x80]
14067e68b: 48c78510020000feffffff mov qword ptr [rbp + 0x210], 0xfffffffffffffffe
14067e696: 498b00 mov rax, qword ptr [r8]
14067e699: 48898560010000 mov qword ptr [rbp + 0x160], rax
14067e6a0: 498b4020 mov rax, qword ptr [r8 + 0x20]
14067e6a4: 48898558010000 mov qword ptr [rbp + 0x158], rax
14067e6ab: 498b80a0000000 mov rax, qword ptr [r8 + 0xa0]
14067e6b2: 488985e8010000 mov qword ptr [rbp + 0x1e8], rax
14067e6b9: 4d8bb8b0000000 mov r15, qword ptr [r8 + 0xb0]
14067e6c0: 458ba8bc000000 mov r13d, dword ptr [r8 + 0xbc]
14067e6c7: 498b80c0000000 mov rax, qword ptr [r8 + 0xc0]
14067e6ce: 488985b0010000 mov qword ptr [rbp + 0x1b0], rax
14067e6d5: 4d8ba0d0000000 mov r12, qword ptr [r8 + 0xd0]
14067e6dc: 418bb8dc000000 mov edi, dword ptr [r8 + 0xdc]
14067e6e3: 4d8bb0c0010000 mov r14, qword ptr [r8 + 0x1c0]
14067e6ea: 498bb0d0010000 mov rsi, qword ptr [r8 + 0x1d0]
14067e6f1: 418b98dc010000 mov ebx, dword ptr [r8 + 0x1dc]
14067e6f8: 498b80e0010000 mov rax, qword ptr [r8 + 0x1e0]
14067e6ff: 488985f0010000 mov qword ptr [rbp + 0x1f0], rax
14067e706: 498b4110 mov rax, qword ptr [r9 + 0x10]
14067e70a: 488985c0010000 mov qword ptr [rbp + 0x1c0], rax
14067e711: 498b4118 mov rax, qword ptr [r9 + 0x18]
14067e715: 488985b8010000 mov qword ptr [rbp + 0x1b8], rax
14067e71c: 498b81d0000000 mov rax, qword ptr [r9 + 0xd0]
14067e723: 488985e0010000 mov qword ptr [rbp + 0x1e0], rax
14067e72a: 498b81e0000000 mov rax, qword ptr [r9 + 0xe0]
14067e731: 48898568010000 mov qword ptr [rbp + 0x168], rax
14067e738: 418b81ec000000 mov eax, dword ptr [r9 + 0xec]
14067e73f: 8985d0010000 mov dword ptr [rbp + 0x1d0], eax
14067e745: 488d4db0 lea rcx, [rbp - 0x50]
14067e749: 41b820010000 mov r8d, 0x120
14067e74f: e893b95705 call 0x145bfa0e7
14067e754: 48b87400000000000080 movabs rax, 0x8000000000000074
14067e75e: 483945b0 cmp qword ptr [rbp - 0x50], rax
14067e762: 0f85e2070000 jne 0x14067ef4a
14067e768: 488b45d0 mov rax, qword ptr [rbp - 0x30]
14067e76c: 8b4dd8 mov ecx, dword ptr [rbp - 0x28]
14067e76f: 0fb755e0 movzx edx, word ptr [rbp - 0x20]
14067e773: 448b45dc mov r8d, dword ptr [rbp - 0x24]
14067e777: f30f6f45b8 movdqu xmm0, xmmword ptr [rbp - 0x48]
14067e77c: 4c8b4dc8 mov r9, qword ptr [rbp - 0x38]
14067e780: 45892f mov dword ptr [r15], r13d
14067e783: 41893c24 mov dword ptr [r12], edi
14067e787: 891e mov dword ptr [rsi], ebx
14067e789: 4d8b2e mov r13, qword ptr [r14]
14067e78c: 49ffc5 inc r13
14067e78f: 4d892e mov qword ptr [r14], r13
14067e792: 48898500020000 mov qword ptr [rbp + 0x200], rax
14067e799: 898d0c020000 mov dword ptr [rbp + 0x20c], ecx
14067e79f: 668995fe010000 mov word ptr [rbp + 0x1fe], dx
14067e7a6: 44898508020000 mov dword ptr [rbp + 0x208], r8d
14067e7ad: 660f7f85d0000000 movdqa xmmword ptr [rbp + 0xd0], xmm0
14067e7b5: 4c898dd8010000 mov qword ptr [rbp + 0x1d8], r9
14067e7bc: 488b35e5e79f07 mov rsi, qword ptr [rip + 0x79fe7e5]
14067e7c3: 488b06 mov rax, qword ptr [rsi]
14067e7c6: 4883f801 cmp rax, 1
14067e7ca: 4c8ba558010000 mov r12, qword ptr [rbp + 0x158]
14067e7d1: 488bbd60010000 mov rdi, qword ptr [rbp + 0x160]
14067e7d8: 488b9df0010000 mov rbx, qword ptr [rbp + 0x1f0]
14067e7df: 0f8751010000 ja 0x14067e936
14067e7e5: 0fb615c4359c07 movzx edx, byte ptr [rip + 0x79c35c4]
14067e7ec: 0fb6c2 movzx eax, dl
14067e7ef: 8d48ff lea ecx, [rax - 1]
14067e7f2: 83f902 cmp ecx, 2
14067e7f5: 0f8333010000 jae 0x14067e92e
14067e7fb: 488b0d9e359c07 mov rcx, qword ptr [rip + 0x79c359e]
14067e802: e8c9f05d04 call 0x144c5d8d0
14067e807: 90 nop
14067e808: 84c0 test al, al
14067e80a: 0f8426010000 je 0x14067e936
14067e810: 488b0d89359c07 mov rcx, qword ptr [rip + 0x79c3589]
14067e817: 488d4130 lea rax, [rcx + 0x30]
14067e81b: 488d950c020000 lea rdx, [rbp + 0x20c]
14067e822: 488995f8000000 mov qword ptr [rbp + 0xf8], rdx
14067e829: 488d15b0005605 lea rdx, [rip + 0x55600b0]
14067e830: 48899500010000 mov qword ptr [rbp + 0x100], rdx
14067e837: 4c8d8500020000 lea r8, [rbp + 0x200]
14067e83e: 4c898508010000 mov qword ptr [rbp + 0x108], r8
14067e845: 4c8d0544f75505 lea r8, [rip + 0x555f744]
14067e84c: 4c898510010000 mov qword ptr [rbp + 0x110], r8
14067e853: 4c8d8508020000 lea r8, [rbp + 0x208]
14067e85a: 4c898518010000 mov qword ptr [rbp + 0x118], r8
14067e861: 48899520010000 mov qword ptr [rbp + 0x120], rdx
14067e868: 488d95fe010000 lea rdx, [rbp + 0x1fe]
14067e86f: 48899528010000 mov qword ptr [rbp + 0x128], rdx
14067e876: 488d15631d5605 lea rdx, [rip + 0x5561d63]
14067e87d: 48899530010000 mov qword ptr [rbp + 0x130], rdx
14067e884: 488d95d0000000 lea rdx, [rbp + 0xd0]
14067e88b: 48899538010000 mov qword ptr [rbp + 0x138], rdx
14067e892: 488d15e71b0200 lea rdx, [rip + 0x21be7]
14067e899: 48899540010000 mov qword ptr [rbp + 0x140], rdx
14067e8a0: 488d95d8010000 lea rdx, [rbp + 0x1d8]
14067e8a7: 48899548010000 mov qword ptr [rbp + 0x148], rdx
14067e8ae: 488d156b1b0200 lea rdx, [rip + 0x21b6b]
14067e8b5: 48899550010000 mov qword ptr [rbp + 0x150], rdx
14067e8bc: 488d1536188105 lea rdx, [rip + 0x5811836]
14067e8c3: 48899590010000 mov qword ptr [rbp + 0x190], rdx
14067e8ca: 488d95f8000000 lea rdx, [rbp + 0xf8]
14067e8d1: 48899598010000 mov qword ptr [rbp + 0x198], rdx
14067e8d8: 488d9590010000 lea rdx, [rbp + 0x190]
14067e8df: 488995a0010000 mov qword ptr [rbp + 0x1a0], rdx
14067e8e6: 488d1573d98005 lea rdx, [rip + 0x580d973]
14067e8ed: 488995a8010000 mov qword ptr [rbp + 0x1a8], rdx
14067e8f4: 48c7857001000001000000 mov qword ptr [rbp + 0x170], 1
14067e8ff: 488d95a0010000 lea rdx, [rbp + 0x1a0]
14067e906: 48899578010000 mov qword ptr [rbp + 0x178], rdx
14067e90d: 48c7858001000001000000 mov qword ptr [rbp + 0x180], 1
14067e918: 48898588010000 mov qword ptr [rbp + 0x188], rax
14067e91f: 488d9570010000 lea rdx, [rbp + 0x170]
14067e926: e8c5075e04 call 0x144c5f0f0
14067e92b: 90 nop
14067e92c: eb08 jmp 0x14067e936
14067e92e: 85c0 test eax, eax
14067e930: 0f85c6060000 jne 0x14067effc
14067e936: 4885db test rbx, rbx
14067e939: 0f84de010000 je 0x14067eb1d
14067e93f: 8b950c020000 mov edx, dword ptr [rbp + 0x20c]
14067e945: 4889d9 mov rcx, rbx
14067e948: e843ca4205 call 0x145aab390
14067e94d: 90 nop
14067e94e: 4885c0 test rax, rax
14067e951: 0f8497010000 je 0x14067eaee
14067e957: f6801c01000020 test byte ptr [rax + 0x11c], 0x20
14067e95e: 750d jne 0x14067e96d
14067e960: f6800c01000002 test byte ptr [rax + 0x10c], 2
14067e967: 0f8481010000 je 0x14067eaee
14067e96d: 49837c241800 cmp qword ptr [r12 + 0x18], 0
14067e973: 0f8475010000 je 0x14067eaee
14067e979: 498d4c2420 lea rcx, [r12 + 0x20]
14067e97e: 488d9500020000 lea rdx, [rbp + 0x200]
14067e985: e806e898ff call 0x14000d190
14067e98a: 4989c0 mov r8, rax
14067e98d: 49c1e839 shr r8, 0x39
14067e991: 498b0c24 mov rcx, qword ptr [r12]
14067e995: 498b542408 mov rdx, qword ptr [r12 + 8]
14067e99a: 66410f6ec0 movd xmm0, r8d
14067e99f: 660f60c0 punpcklbw xmm0, xmm0
14067e9a3: f20f70c000 pshuflw xmm0, xmm0, 0
14067e9a8: 660f70c044 pshufd xmm0, xmm0, 0x44
14067e9ad: 4531c0 xor r8d, r8d
14067e9b0: 4c8b8d00020000 mov r9, qword ptr [rbp + 0x200]
14067e9b7: 660f76c9 pcmpeqd xmm1, xmm1
14067e9bb: 4821d0 and rax, rdx
14067e9be: f30f6f1401 movdqu xmm2, xmmword ptr [rcx + rax]
14067e9c3: 660f6fda movdqa xmm3, xmm2
14067e9c7: 660f74d8 pcmpeqb xmm3, xmm0
14067e9cb: 66440fd7d3 pmovmskb r10d, xmm3
14067e9d0: 4585d2 test r10d, r10d
14067e9d3: 7435 je 0x14067ea0a
14067e9d5: 4889f3 mov rbx, rsi
14067e9d8: f3410fbcf2 tzcnt esi, r10d
14067e9dd: 4801c6 add rsi, rax
14067e9e0: 4821d6 and rsi, rdx
14067e9e3: 48c1e604 shl rsi, 4
14067e9e7: 4989cb mov r11, rcx
14067e9ea: 4929f3 sub r11, rsi
14067e9ed: 4d3b4bf0 cmp r9, qword ptr [r11 - 0x10]
14067e9f1: 7436 je 0x14067ea29
14067e9f3: 458d5aff lea r11d, [r10 - 1]
14067e9f7: 664521d3 and r11w, r10w
14067e9fb: 4589da mov r10d, r11d
14067e9fe: 4889de mov rsi, rbx
14067ea01: 488b9df0010000 mov rbx, qword ptr [rbp + 0x1f0]
14067ea08: 75cb jne 0x14067e9d5
14067ea0a: 660f74d1 pcmpeqb xmm2, xmm1
14067ea0e: 66440fd7d2 pmovmskb r10d, xmm2
14067ea13: 4585d2 test r10d, r10d
14067ea16: 0f85d2000000 jne 0x14067eaee
14067ea1c: 4c01c0 add rax, r8
14067ea1f: 4883c010 add rax, 0x10
14067ea23: 4983c010 add r8, 0x10
14067ea27: eb92 jmp 0x14067e9bb
14067ea29: 498b43f8 mov rax, qword ptr [r11 - 8]
14067ea2d: 488985c8010000 mov qword ptr [rbp + 0x1c8], rax
14067ea34: 8b85dc010000 mov eax, dword ptr [rbp + 0x1dc]
14067ea3a: 8985d4010000 mov dword ptr [rbp + 0x1d4], eax
14067ea40: 85c0 test eax, eax
14067ea42: 0f95c1 setne cl
14067ea45: 228dd8010000 and cl, byte ptr [rbp + 0x1d8]
14067ea4b: 4c8bb5c0010000 mov r14, qword ptr [rbp + 0x1c0]
14067ea52: 4d85f6 test r14, r14
14067ea55: 4c0f44b5b8010000 cmove r14, qword ptr [rbp + 0x1b8]
14067ea5d: 498b06 mov rax, qword ptr [r14]
14067ea60: 4d8b7e10 mov r15, qword ptr [r14 + 0x10]
14067ea64: 4c29f8 sub rax, r15
14067ea67: 80f901 cmp cl, 1
14067ea6a: 4889de mov rsi, rbx
14067ea6d: 753f jne 0x14067eaae
14067ea6f: 4883f817 cmp rax, 0x17
14067ea73: 488b9df0010000 mov rbx, qword ptr [rbp + 0x1f0]
14067ea7a: 0f8698050000 jbe 0x14067f018
14067ea80: 498b4608 mov rax, qword ptr [r14 + 8]
14067ea84: 488d0d153b3600 lea rcx, [rip + 0x363b15]
14067ea8b: 4a890c38 mov qword ptr [rax + r15], rcx
14067ea8f: 488b8dc8010000 mov rcx, qword ptr [rbp + 0x1c8]
14067ea96: 4a894c3808 mov qword ptr [rax + r15 + 8], rcx
14067ea9b: 8b8dd4010000 mov ecx, dword ptr [rbp + 0x1d4]
14067eaa1: 42894c3810 mov dword ptr [rax + r15 + 0x10], ecx
14067eaa6: 42c644381400 mov byte ptr [rax + r15 + 0x14], 0
14067eaac: eb38 jmp 0x14067eae6
14067eaae: 4883f817 cmp rax, 0x17
14067eab2: 488b9df0010000 mov rbx, qword ptr [rbp + 0x1f0]
14067eab9: 0f867f050000 jbe 0x14067f03e
14067eabf: 498b4608 mov rax, qword ptr [r14 + 8]
14067eac3: 488d0d96623700 lea rcx, [rip + 0x376296]
14067eaca: 4a890c38 mov qword ptr [rax + r15], rcx
14067eace: 488b8dc8010000 mov rcx, qword ptr [rbp + 0x1c8]
14067ead5: 4a894c3808 mov qword ptr [rax + r15 + 8], rcx
14067eada: 488d0d0f05fbff lea rcx, [rip - 0x4faf1]
14067eae1: 4a894c3810 mov qword ptr [rax + r15 + 0x10], rcx
14067eae6: 4983c718 add r15, 0x18
14067eaea: 4d897e10 mov qword ptr [r14 + 0x10], r15
14067eaee: 8b950c020000 mov edx, dword ptr [rbp + 0x20c]
14067eaf4: 4889d9 mov rcx, rbx
14067eaf7: e894c84205 call 0x145aab390
14067eafc: 90 nop
14067eafd: 4885c0 test rax, rax
14067eb00: 741b je 0x14067eb1d
14067eb02: 0fb6980c010000 movzx ebx, byte ptr [rax + 0x10c]
14067eb09: 80e302 and bl, 2
14067eb0c: d0eb shr bl, 1
14067eb0e: 8b0564849c07 mov eax, dword ptr [rip + 0x79c8464]
14067eb14: 85c0 test eax, eax
14067eb16: 7415 je 0x14067eb2d
14067eb18: e96f040000 jmp 0x14067ef8c
14067eb1d: 31db xor ebx, ebx
14067eb1f: 8b0553849c07 mov eax, dword ptr [rip + 0x79c8453]
14067eb25: 85c0 test eax, eax
14067eb27: 0f855f040000 jne 0x14067ef8c
14067eb2d: 488b07 mov rax, qword ptr [rdi]
14067eb30: 84053a849c07 test byte ptr [rip + 0x79c843a], al
14067eb36: 0f8444010000 je 0x14067ec80
14067eb3c: 488b7f08 mov rdi, qword ptr [rdi + 8]
14067eb40: 483bbd00020000 cmp rdi, qword ptr [rbp + 0x200]
14067eb47: 0f853f010000 jne 0x14067ec8c
14067eb4d: 488b06 mov rax, qword ptr [rsi]
14067eb50: 4883f802 cmp rax, 2
14067eb54: 0f8732010000 ja 0x14067ec8c
14067eb5a: 0fb61567329c07 movzx edx, byte ptr [rip + 0x79c3267]
14067eb61: 0fb6c2 movzx eax, dl
14067eb64: 8d48ff lea ecx, [rax - 1]
14067eb67: 83f902 cmp ecx, 2
14067eb6a: 0f83f8030000 jae 0x14067ef68
14067eb70: 488b0d41329c07 mov rcx, qword ptr [rip + 0x79c3241]
14067eb77: e854ed5d04 call 0x144c5d8d0
14067eb7c: 90 nop
14067eb7d: 84c0 test al, al
14067eb7f: 0f8407010000 je 0x14067ec8c
14067eb85: 488b0d2c329c07 mov rcx, qword ptr [rip + 0x79c322c]
14067eb8c: 488d4130 lea rax, [rcx + 0x30]
14067eb90: 488d15af158105 lea rdx, [rip + 0x58115af]
14067eb97: 4c8d05a3158105 lea r8, [rip + 0x58115a3]
14067eb9e: 84db test bl, bl
14067eba0: 4c0f45c2 cmovne r8, rdx
14067eba4: ba12000000 mov edx, 0x12
14067eba9: 41b905000000 mov r9d, 5
14067ebaf: 4c0f45ca cmovne r9, rdx
14067ebb3: 4c898590010000 mov qword ptr [rbp + 0x190], r8
14067ebba: 4c898d98010000 mov qword ptr [rbp + 0x198], r9
14067ebc1: 488d950c020000 lea rdx, [rbp + 0x20c]
14067ebc8: 488995f8000000 mov qword ptr [rbp + 0xf8], rdx
14067ebcf: 488d150afd5505 lea rdx, [rip + 0x555fd0a]
14067ebd6: 48899500010000 mov qword ptr [rbp + 0x100], rdx
14067ebdd: 4c8d8508020000 lea r8, [rbp + 0x208]
14067ebe4: 4c898508010000 mov qword ptr [rbp + 0x108], r8
14067ebeb: 48899510010000 mov qword ptr [rbp + 0x110], rdx
14067ebf2: 488d9590010000 lea rdx, [rbp + 0x190]
14067ebf9: 48899518010000 mov qword ptr [rbp + 0x118], rdx
14067ec00: 488d15b93498ff lea rdx, [rip - 0x67cb47]
14067ec07: 48899520010000 mov qword ptr [rbp + 0x120], rdx
14067ec0e: 488d1543158105 lea rdx, [rip + 0x5811543]
14067ec15: 488995a0010000 mov qword ptr [rbp + 0x1a0], rdx
14067ec1c: 488d95f8000000 lea rdx, [rbp + 0xf8]
14067ec23: 488995a8010000 mov qword ptr [rbp + 0x1a8], rdx
14067ec2a: 488d95a0010000 lea rdx, [rbp + 0x1a0]
14067ec31: 488995e8000000 mov qword ptr [rbp + 0xe8], rdx
14067ec38: 488d1521d68005 lea rdx, [rip + 0x580d621]
14067ec3f: 488995f0000000 mov qword ptr [rbp + 0xf0], rdx
14067ec46: 48c7857001000001000000 mov qword ptr [rbp + 0x170], 1
14067ec51: 488d95e8000000 lea rdx, [rbp + 0xe8]
14067ec58: 48899578010000 mov qword ptr [rbp + 0x178], rdx
14067ec5f: 48c7858001000001000000 mov qword ptr [rbp + 0x180], 1
14067ec6a: 48898588010000 mov qword ptr [rbp + 0x188], rax
14067ec71: 488d9570010000 lea rdx, [rbp + 0x170]
14067ec78: e873045e04 call 0x144c5f0f0
14067ec7d: 90 nop
14067ec7e: eb0c jmp 0x14067ec8c
14067ec80: a801 test al, 1
14067ec82: 0f84db000000 je 0x14067ed63
14067ec88: 488b7f08 mov rdi, qword ptr [rdi + 8]
14067ec8c: 483bbd00020000 cmp rdi, qword ptr [rbp + 0x200]
14067ec93: 0f94c0 sete al
14067ec96: 8bb508020000 mov esi, dword ptr [rbp + 0x208]
14067ec9c: 85f6 test esi, esi
14067ec9e: 0f95c1 setne cl
14067eca1: 84c8 test al, cl
14067eca3: 0f84ba000000 je 0x14067ed63
14067eca9: 84db test bl, bl
14067ecab: 7548 jne 0x14067ecf5
14067ecad: 8b9d0c020000 mov ebx, dword ptr [rbp + 0x20c]
14067ecb3: 488b85e8010000 mov rax, qword ptr [rbp + 0x1e8]
14067ecba: 488b7810 mov rdi, qword ptr [rax + 0x10]
14067ecbe: 483b38 cmp rdi, qword ptr [rax]
14067ecc1: 750d jne 0x14067ecd0
14067ecc3: 488b8de8010000 mov rcx, qword ptr [rbp + 0x1e8]
14067ecca: e801775a05 call 0x145c263d0
14067eccf: 90 nop
14067ecd0: 488b95e8010000 mov rdx, qword ptr [rbp + 0x1e8]
14067ecd7: 488b4208 mov rax, qword ptr [rdx + 8]
14067ecdb: 488d0c7f lea rcx, [rdi + rdi*2]
14067ecdf: c7048800000000 mov dword ptr [rax + rcx*4], 0
14067ece6: 895c8804 mov dword ptr [rax + rcx*4 + 4], ebx
14067ecea: 89748808 mov dword ptr [rax + rcx*4 + 8], esi
14067ecee: 48ffc7 inc rdi
14067ecf1: 48897a10 mov qword ptr [rdx + 0x10], rdi
14067ecf5: e886555205 call 0x145ba4280
14067ecfa: 90 nop
14067ecfb: 488b8db0010000 mov rcx, qword ptr [rbp + 0x1b0]
14067ed02: 837908ff cmp dword ptr [rcx + 8], -1
14067ed06: 745b je 0x14067ed63
14067ed08: 8b8d08020000 mov ecx, dword ptr [rbp + 0x208]
14067ed0e: 4c69c1d34d6210 imul r8, rcx, 0x10624dd3
14067ed15: 49c1e826 shr r8, 0x26
14067ed19: 4569c8e8030000 imul r9d, r8d, 0x3e8
14067ed20: 4429c9 sub ecx, r9d
14067ed23: 4469c940420f00 imul r9d, ecx, 0xf4240
14067ed2a: 488d358ff68005 lea rsi, [rip + 0x580f68f]
14067ed31: 4889742420 mov qword ptr [rsp + 0x20], rsi
14067ed36: 4889c1 mov rcx, rax
14067ed39: e8b2275405 call 0x145bc14f0
14067ed3e: 90 nop
14067ed3f: 4889742420 mov qword ptr [rsp + 0x20], rsi
14067ed44: 41b802000000 mov r8d, 2
14067ed4a: 4889c1 mov rcx, rax
14067ed4d: 4531c9 xor r9d, r9d
14067ed50: e89b275405 call 0x145bc14f0
14067ed55: 90 nop
14067ed56: 488b8db0010000 mov rcx, qword ptr [rbp + 0x1b0]
14067ed5d: 488901 mov qword ptr [rcx], rax
14067ed60: 895108 mov dword ptr [rcx + 8], edx
14067ed63: 49837c241800 cmp qword ptr [r12 + 0x18], 0
14067ed69: 0f84db010000 je 0x14067ef4a
14067ed6f: 498d4c2420 lea rcx, [r12 + 0x20]
14067ed74: 488d9500020000 lea rdx, [rbp + 0x200]
14067ed7b: e810e498ff call 0x14000d190
14067ed80: 4989c0 mov r8, rax
14067ed83: 49c1e839 shr r8, 0x39
14067ed87: 498b0c24 mov rcx, qword ptr [r12]
14067ed8b: 498b542408 mov rdx, qword ptr [r12 + 8]
14067ed90: 66410f6ec0 movd xmm0, r8d
14067ed95: 660f60c0 punpcklbw xmm0, xmm0
14067ed99: f20f70c000 pshuflw xmm0, xmm0, 0
14067ed9e: 660f70c044 pshufd xmm0, xmm0, 0x44
14067eda3: 4531c0 xor r8d, r8d
14067eda6: 4c8b8d00020000 mov r9, qword ptr [rbp + 0x200]
14067edad: 660f76c9 pcmpeqd xmm1, xmm1
14067edb1: 4821d0 and rax, rdx
14067edb4: f30f6f1401 movdqu xmm2, xmmword ptr [rcx + rax]
14067edb9: 660f6fda movdqa xmm3, xmm2
14067edbd: 660f74d8 pcmpeqb xmm3, xmm0
14067edc1: 66440fd7d3 pmovmskb r10d, xmm3
14067edc6: 4585d2 test r10d, r10d
14067edc9: 7428 je 0x14067edf3
14067edcb: f3410fbcf2 tzcnt esi, r10d
14067edd0: 4801c6 add rsi, rax
14067edd3: 4821d6 and rsi, rdx
14067edd6: 48c1e604 shl rsi, 4
14067edda: 4989cb mov r11, rcx
14067eddd: 4929f3 sub r11, rsi
14067ede0: 4d3b4bf0 cmp r9, qword ptr [r11 - 0x10]
14067ede4: 742c je 0x14067ee12
14067ede6: 458d5aff lea r11d, [r10 - 1]
14067edea: 664521d3 and r11w, r10w
14067edee: 4589da mov r10d, r11d
14067edf1: 75d8 jne 0x14067edcb
14067edf3: 660f74d1 pcmpeqb xmm2, xmm1
14067edf7: 66440fd7d2 pmovmskb r10d, xmm2
14067edfc: 4585d2 test r10d, r10d
14067edff: 0f8545010000 jne 0x14067ef4a
14067ee05: 4c01c0 add rax, r8
14067ee08: 4883c010 add rax, 0x10
14067ee0c: 4983c010 add r8, 0x10
14067ee10: eb9f jmp 0x14067edb1
14067ee12: 498b73f8 mov rsi, qword ptr [r11 - 8]
14067ee16: 83bd0802000000 cmp dword ptr [rbp + 0x208], 0
14067ee1d: 0f84a8000000 je 0x14067eecb
14067ee23: e858545205 call 0x145ba4280
14067ee28: 90 nop
14067ee29: 8b8d08020000 mov ecx, dword ptr [rbp + 0x208]
14067ee2f: 4c69c1d34d6210 imul r8, rcx, 0x10624dd3
14067ee36: 49c1e826 shr r8, 0x26
14067ee3a: 4569c8e8030000 imul r9d, r8d, 0x3e8
14067ee41: 4429c9 sub ecx, r9d
14067ee44: 4469c940420f00 imul r9d, ecx, 0xf4240
14067ee4b: 488d0d6e138105 lea rcx, [rip + 0x581136e]
14067ee52: 48894c2420 mov qword ptr [rsp + 0x20], rcx
14067ee57: 4889c1 mov rcx, rax
14067ee5a: e891265405 call 0x145bc14f0
14067ee5f: 90 nop
14067ee60: 4889c7 mov rdi, rax
14067ee63: 89d3 mov ebx, edx
14067ee65: 488b85c0010000 mov rax, qword ptr [rbp + 0x1c0]
14067ee6c: 4885c0 test rax, rax
14067ee6f: 448bbd0c020000 mov r15d, dword ptr [rbp + 0x20c]
14067ee76: 488b8db8010000 mov rcx, qword ptr [rbp + 0x1b8]
14067ee7d: 480f45c8 cmovne rcx, rax
14067ee81: 488b01 mov rax, qword ptr [rcx]
14067ee84: 4989cc mov r12, rcx
14067ee87: 4c8b7110 mov r14, qword ptr [rcx + 0x10]
14067ee8b: 4c29f0 sub rax, r14
14067ee8e: 4883f82f cmp rax, 0x2f
14067ee92: 0f863e010000 jbe 0x14067efd6
14067ee98: 498b442408 mov rax, qword ptr [r12 + 8]
14067ee9d: 488d0d5c3c3600 lea rcx, [rip + 0x363c5c]
14067eea4: 4a890c30 mov qword ptr [rax + r14], rcx
14067eea8: 4a897c3008 mov qword ptr [rax + r14 + 8], rdi
14067eead: 42895c3010 mov dword ptr [rax + r14 + 0x10], ebx
14067eeb2: 46897c3018 mov dword ptr [rax + r14 + 0x18], r15d
14067eeb7: 42c644302000 mov byte ptr [rax + r14 + 0x20], 0
14067eebd: 4a89743028 mov qword ptr [rax + r14 + 0x28], rsi
14067eec2: 4983c630 add r14, 0x30
14067eec6: 4d89742410 mov qword ptr [r12 + 0x10], r14
14067eecb: 8b9d0c020000 mov ebx, dword ptr [rbp + 0x20c]
14067eed1: 488b8568010000 mov rax, qword ptr [rbp + 0x168]
14067eed8: 8b8dd0010000 mov ecx, dword ptr [rbp + 0x1d0]
14067eede: 8908 mov dword ptr [rax], ecx
14067eee0: 488b85e0010000 mov rax, qword ptr [rbp + 0x1e0]
14067eee7: 488b7830 mov rdi, qword ptr [rax + 0x30]
14067eeeb: 4c8b7040 mov r14, qword ptr [rax + 0x40]
14067eeef: 483b7820 cmp rdi, qword ptr [rax + 0x20]
14067eef3: 7511 jne 0x14067ef06
14067eef5: 488b85e0010000 mov rax, qword ptr [rbp + 0x1e0]
14067eefc: 488d4820 lea rcx, [rax + 0x20]
14067ef00: e8bbbd5705 call 0x145bfacc0
14067ef05: 90 nop
14067ef06: 488b95e0010000 mov rdx, qword ptr [rbp + 0x1e0]
14067ef0d: 488b4228 mov rax, qword ptr [rdx + 0x28]
14067ef11: 488d0c7f lea rcx, [rdi + rdi*2]
14067ef15: 48c1e104 shl rcx, 4
14067ef19: c7040800000000 mov dword ptr [rax + rcx], 0
14067ef20: 4889740810 mov qword ptr [rax + rcx + 0x10], rsi
14067ef25: 4c896c0818 mov qword ptr [rax + rcx + 0x18], r13
14067ef2a: 895c0820 mov dword ptr [rax + rcx + 0x20], ebx
14067ef2e: 66c74408240000 mov word ptr [rax + rcx + 0x24], 0
14067ef35: c644082600 mov byte ptr [rax + rcx + 0x26], 0
14067ef3a: 4c89740828 mov qword ptr [rax + rcx + 0x28], r14
14067ef3f: 48ffc7 inc rdi
14067ef42: 48897a30 mov qword ptr [rdx + 0x30], rdi
14067ef46: 48ff4240 inc qword ptr [rdx + 0x40]
14067ef4a: 488d4db0 lea rcx, [rbp - 0x50]
14067ef4e: e8ad37f8ff call 0x140602700
14067ef53: 90 nop
14067ef54: 4881c498020000 add rsp, 0x298
14067ef5b: 5b pop rbx
14067ef5c: 5f pop rdi
14067ef5d: 5e pop rsi
14067ef5e: 415c pop r12
14067ef60: 415d pop r13
14067ef62: 415e pop r14
14067ef64: 415f pop r15
14067ef66: 5d pop rbp
14067ef67: c3 ret
14067ef68: 85c0 test eax, eax
14067ef6a: 0f841cfdffff je 0x14067ec8c
14067ef70: 488d0d412e9c07 lea rcx, [rip + 0x79c2e41]
14067ef77: e8a4626c05 call 0x145d45220
14067ef7c: 90 nop
14067ef7d: 89c2 mov edx, eax
14067ef7f: 84c0 test al, al
14067ef81: 0f85e9fbffff jne 0x14067eb70
14067ef87: e900fdffff jmp 0x14067ec8c
14067ef8c: 488d05dd7f9c07 lea rax, [rip + 0x79c7fdd]
14067ef93: 48898570010000 mov qword ptr [rbp + 0x170], rax
14067ef9a: 488d8570010000 lea rax, [rbp + 0x170]
14067efa1: 488985f8000000 mov qword ptr [rbp + 0xf8], rax
14067efa8: 488d0509d08005 lea rax, [rip + 0x580d009]
14067efaf: 4889442420 mov qword ptr [rsp + 0x20], rax
14067efb4: 488d0dbd7f9c07 lea rcx, [rip + 0x79c7fbd]
14067efbb: 4c8d0d7ecf8005 lea r9, [rip + 0x580cf7e]
14067efc2: 4c8d85f8000000 lea r8, [rbp + 0xf8]
14067efc9: b201 mov dl, 1
14067efcb: e8108e7105 call 0x145d97de0
14067efd0: 90 nop
14067efd1: e957fbffff jmp 0x14067eb2d
14067efd6: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14067efdf: 41b830000000 mov r8d, 0x30
14067efe5: 41b901000000 mov r9d, 1
14067efeb: 4c89e1 mov rcx, r12
14067efee: 4c89f2 mov rdx, r14
14067eff1: e87ab95705 call 0x145bfa970
14067eff6: 90 nop
14067eff7: e99cfeffff jmp 0x14067ee98
14067effc: 488d0d9d2d9c07 lea rcx, [rip + 0x79c2d9d]
14067f003: e818626c05 call 0x145d45220
14067f008: 90 nop
14067f009: 89c2 mov edx, eax
14067f00b: 84c0 test al, al
14067f00d: 0f85e8f7ffff jne 0x14067e7fb
14067f013: e91ef9ffff jmp 0x14067e936
14067f018: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14067f021: 41b818000000 mov r8d, 0x18
14067f027: 41b901000000 mov r9d, 1
14067f02d: 4c89f1 mov rcx, r14
14067f030: 4c89fa mov rdx, r15
14067f033: e838b95705 call 0x145bfa970
14067f038: 90 nop
14067f039: e942faffff jmp 0x14067ea80
14067f03e: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14067f047: 41b818000000 mov r8d, 0x18
14067f04d: 41b901000000 mov r9d, 1
14067f053: 4c89f1 mov rcx, r14
14067f056: 4c89fa mov rdx, r15
14067f059: e812b95705 call 0x145bfa970
14067f05e: 90 nop
14067f05f: e95bfaffff jmp 0x14067eabf
