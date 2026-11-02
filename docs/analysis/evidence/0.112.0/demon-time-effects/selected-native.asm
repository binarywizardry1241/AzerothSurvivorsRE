; ordered-gate-build: 0x14592fa3e..0x14592ffab (end exclusive)
0x14592fa3e: 4c3bae30080000 cmp r13, qword ptr [rsi + 0x830]
0x14592fa45: 73c2 jae 0x14592fa09
0x14592fa47: 488b8e28080000 mov rcx, qword ptr [rsi + 0x828]
0x14592fa4e: 4d89e8 mov r8, r13
0x14592fa51: 49c1e006 shl r8, 6
0x14592fa55: 42803c0122 cmp byte ptr [rcx + r8], 0x22
0x14592fa5a: 75ad jne 0x14592fa09
0x14592fa5c: 488b8690000000 mov rax, qword ptr [rsi + 0x90]
0x14592fa63: 4939c5 cmp r13, rax
0x14592fa66: 7359 jae 0x14592fac1
0x14592fa68: 4c8b8e88000000 mov r9, qword ptr [rsi + 0x88]
0x14592fa6f: 43833ca900 cmp dword ptr [r9 + r13*4], 0
0x14592fa74: 744b je 0x14592fac1
0x14592fa76: 0f57c0 xorps xmm0, xmm0
0x14592fa79: 4c3b6e78 cmp r13, qword ptr [rsi + 0x78]
0x14592fa7d: 730a jae 0x14592fa89
0x14592fa7f: 4c8b4e70 mov r9, qword ptr [rsi + 0x70]
0x14592fa83: f3430f1004a9 movss xmm0, dword ptr [r9 + r13*4]
0x14592fa89: 4c01c1 add rcx, r8
0x14592fa8c: f30f105108 movss xmm2, dword ptr [rcx + 8]
0x14592fa91: f30f599688040000 mulss xmm2, dword ptr [rsi + 0x488]
0x14592fa99: 0f28e2 movaps xmm4, xmm2
0x14592fa9c: f30f5f610c maxss xmm4, dword ptr [rcx + 0xc]
0x14592faa1: 0f28cc movaps xmm1, xmm4
0x14592faa4: f30fc2cc03 cmpunordss xmm1, xmm4
0x14592faa9: 0f54d1 andps xmm2, xmm1
0x14592faac: 0f55cc andnps xmm1, xmm4
0x14592faaf: 0f56ca orps xmm1, xmm2
0x14592fab2: f30f58c8 addss xmm1, xmm0
0x14592fab6: 0f2ef1 ucomiss xmm6, xmm1
0x14592fab9: 0f824affffff jb 0x14592fa09
0x14592fabf: eb11 jmp 0x14592fad2
0x14592fac1: f30f108e4c0a0000 movss xmm1, dword ptr [rsi + 0xa4c]
0x14592fac9: 0f2ef1 ucomiss xmm6, xmm1
0x14592facc: 0f8237ffffff jb 0x14592fa09
0x14592fad2: 4c8b8ed8000000 mov r9, qword ptr [rsi + 0xd8]
0x14592fad9: 4d85c9 test r9, r9
0x14592fadc: 0f84ac000000 je 0x14592fb8e
0x14592fae2: 488b8ed0000000 mov rcx, qword ptr [rsi + 0xd0]
0x14592fae9: 4983f901 cmp r9, 1
0x14592faed: 7508 jne 0x14592faf7
0x14592faef: 4531c0 xor r8d, r8d
0x14592faf2: 4531d2 xor r10d, r10d
0x14592faf5: eb72 jmp 0x14592fb69
0x14592faf7: 4489bd00010000 mov dword ptr [rbp + 0x100], r15d
0x14592fafe: 4d89cb mov r11, r9
0x14592fb01: 4983e3fe and r11, 0xfffffffffffffffe
0x14592fb05: 4c8db990000000 lea r15, [rcx + 0x90]
0x14592fb0c: 4531c0 xor r8d, r8d
0x14592fb0f: 4531d2 xor r10d, r10d
0x14592fb12: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x14592fb20: 4d396f80 cmp qword ptr [r15 - 0x80], r13
0x14592fb24: 400f94c7 sete dil
0x14592fb28: 4122bf70ffffff and dil, byte ptr [r15 - 0x90]
0x14592fb2f: 400fb6ff movzx edi, dil
0x14592fb33: 4c01d7 add rdi, r10
0x14592fb36: 4d392f cmp qword ptr [r15], r13
0x14592fb39: 410f94c2 sete r10b
0x14592fb3d: 452257f0 and r10b, byte ptr [r15 - 0x10]
0x14592fb41: 450fb6d2 movzx r10d, r10b
0x14592fb45: 4901fa add r10, rdi
0x14592fb48: 4983c002 add r8, 2
0x14592fb4c: 4981c700010000 add r15, 0x100
0x14592fb53: 4d39c3 cmp r11, r8
0x14592fb56: 75c8 jne 0x14592fb20
0x14592fb58: 41f6c101 test r9b, 1
0x14592fb5c: 488d7d40 lea rdi, [rbp + 0x40]
0x14592fb60: 448bbd00010000 mov r15d, dword ptr [rbp + 0x100]
0x14592fb67: 741b je 0x14592fb84
0x14592fb69: 4d89d1 mov r9, r10
0x14592fb6c: 49c1e007 shl r8, 7
0x14592fb70: 4e396c0110 cmp qword ptr [rcx + r8 + 0x10], r13
0x14592fb75: 410f94c2 sete r10b
0x14592fb79: 46221401 and r10b, byte ptr [rcx + r8]
0x14592fb7d: 450fb6d2 movzx r10d, r10b
0x14592fb81: 4d01ca add r10, r9
0x14592fb84: 4983fa01 cmp r10, 1
0x14592fb88: 0f877bfeffff ja 0x14592fa09
0x14592fb8e: 4c3b6e78 cmp r13, qword ptr [rsi + 0x78]
0x14592fb92: 7311 jae 0x14592fba5
0x14592fb94: 488b4670 mov rax, qword ptr [rsi + 0x70]
0x14592fb98: f3420f1134a8 movss dword ptr [rax + r13*4], xmm6
0x14592fb9e: 488b8690000000 mov rax, qword ptr [rsi + 0x90]
0x14592fba5: 4939c5 cmp r13, rax
0x14592fba8: 730b jae 0x14592fbb5
0x14592fbaa: 488b8688000000 mov rax, qword ptr [rsi + 0x88]
0x14592fbb1: 42ff04a8 inc dword ptr [rax + r13*4]
0x14592fbb5: 4c896c2420 mov qword ptr [rsp + 0x20], r13
0x14592fbba: c74424280000803f mov dword ptr [rsp + 0x28], 0x3f800000
0x14592fbc2: 4889f1 mov rcx, rsi
0x14592fbc5: 41b801000000 mov r8d, 1
0x14592fbcb: e8609f0200 call 0x145959b30
0x14592fbd0: 90 nop
0x14592fbd1: e933feffff jmp 0x14592fa09
0x14592fbd6: 4589f8 mov r8d, r15d
0x14592fbd9: 8b4808 mov ecx, dword ptr [rax + 8]
0x14592fbdc: 898d00010000 mov dword ptr [rbp + 0x100], ecx
0x14592fbe2: 448b780c mov r15d, dword ptr [rax + 0xc]
0x14592fbe6: 4489bda8000000 mov dword ptr [rbp + 0xa8], r15d
0x14592fbed: 8995ac000000 mov dword ptr [rbp + 0xac], edx
0x14592fbf3: 488b4678 mov rax, qword ptr [rsi + 0x78]
0x14592fbf7: 0f57c0 xorps xmm0, xmm0
0x14592fbfa: 4939c5 cmp r13, rax
0x14592fbfd: 730a jae 0x14592fc09
0x14592fbff: 488b4e70 mov rcx, qword ptr [rsi + 0x70]
0x14592fc03: f3420f1004a9 movss xmm0, dword ptr [rcx + r13*4]
0x14592fc09: 0f2ec6 ucomiss xmm0, xmm6
0x14592fc0c: 7608 jbe 0x14592fc16
0x14592fc0e: 4589c7 mov r15d, r8d
0x14592fc11: e9f3fdffff jmp 0x14592fa09
0x14592fc16: 80bd0801000000 cmp byte ptr [rbp + 0x108], 0
0x14592fc1d: 0f84a5000000 je 0x14592fcc8
0x14592fc23: 4939c5 cmp r13, rax
0x14592fc26: 730a jae 0x14592fc32
0x14592fc28: 488b4670 mov rax, qword ptr [rsi + 0x70]
0x14592fc2c: f3460f1104a8 movss dword ptr [rax + r13*4], xmm8
0x14592fc32: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
0x14592fc39: 4885d2 test rdx, rdx
0x14592fc3c: 4589c7 mov r15d, r8d
0x14592fc3f: 0f84c4fdffff je 0x14592fa09
0x14592fc45: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
0x14592fc4c: 48c1e207 shl rdx, 7
0x14592fc50: 4c8d4280 lea r8, [rdx - 0x80]
0x14592fc54: 4889c1 mov rcx, rax
0x14592fc57: 4584c0 test r8b, r8b
0x14592fc5a: 781e js 0x14592fc7a
0x14592fc5c: 488d8880000000 lea rcx, [rax + 0x80]
0x14592fc63: 4c8b4818 mov r9, qword ptr [rax + 0x18]
0x14592fc67: 450fb64939 movzx r9d, byte ptr [r9 + 0x39]
0x14592fc6c: 4180e10e and r9b, 0xe
0x14592fc70: 4180f906 cmp r9b, 6
0x14592fc74: 7504 jne 0x14592fc7a
0x14592fc76: c6407c01 mov byte ptr [rax + 0x7c], 1
0x14592fc7a: 4d85c0 test r8, r8
0x14592fc7d: 0f8486fdffff je 0x14592fa09
0x14592fc83: 4801d0 add rax, rdx
0x14592fc86: eb10 jmp 0x14592fc98
0x14592fc88: 4881c100010000 add rcx, 0x100
0x14592fc8f: 4839c1 cmp rcx, rax
0x14592fc92: 0f8471fdffff je 0x14592fa09
0x14592fc98: 488b5118 mov rdx, qword ptr [rcx + 0x18]
0x14592fc9c: 0fb65239 movzx edx, byte ptr [rdx + 0x39]
0x14592fca0: 80e20e and dl, 0xe
0x14592fca3: 80fa06 cmp dl, 6
0x14592fca6: 7504 jne 0x14592fcac
0x14592fca8: c6417c01 mov byte ptr [rcx + 0x7c], 1
0x14592fcac: 488b9198000000 mov rdx, qword ptr [rcx + 0x98]
0x14592fcb3: 0fb65239 movzx edx, byte ptr [rdx + 0x39]
0x14592fcb7: 80e20e and dl, 0xe
0x14592fcba: 80fa06 cmp dl, 6
0x14592fcbd: 75c9 jne 0x14592fc88
0x14592fcbf: c681fc00000001 mov byte ptr [rcx + 0xfc], 1
0x14592fcc6: ebc0 jmp 0x14592fc88
0x14592fcc8: f30f599e88040000 mulss xmm3, dword ptr [rsi + 0x488]
0x14592fcd0: f30f5f1d5c6e4800 maxss xmm3, dword ptr [rip + 0x486e5c]
0x14592fcd8: 4c3bae90000000 cmp r13, qword ptr [rsi + 0x90]
0x14592fcdf: 7335 jae 0x14592fd16
0x14592fce1: 410f2ec1 ucomiss xmm0, xmm9
0x14592fce5: 752f jne 0x14592fd16
0x14592fce7: 7a2d jp 0x14592fd16
0x14592fce9: 488b8e88000000 mov rcx, qword ptr [rsi + 0x88]
0x14592fcf0: 42833ca900 cmp dword ptr [rcx + r13*4], 0
0x14592fcf5: 751f jne 0x14592fd16
0x14592fcf7: 4939c5 cmp r13, rax
0x14592fcfa: 0f83a3020000 jae 0x14592ffa3
0x14592fd00: 488b4670 mov rax, qword ptr [rsi + 0x70]
0x14592fd04: f30f58de addss xmm3, xmm6
0x14592fd08: f3420f111ca8 movss dword ptr [rax + r13*4], xmm3
0x14592fd0e: 4589c7 mov r15d, r8d
0x14592fd11: e9f3fcffff jmp 0x14592fa09
0x14592fd16: 4180f802 cmp r8b, 2
0x14592fd1a: 7577 jne 0x14592fd93
0x14592fd1c: 488d8ed0040000 lea rcx, [rsi + 0x4d0]
0x14592fd23: 8b4108 mov eax, dword ptr [rcx + 8]
0x14592fd26: 8985e8000000 mov dword ptr [rbp + 0xe8], eax
0x14592fd2c: 488b01 mov rax, qword ptr [rcx]
0x14592fd2f: 488985e0000000 mov qword ptr [rbp + 0xe0], rax
0x14592fd36: 48c744242800000000 mov qword ptr [rsp + 0x28], 0
0x14592fd3f: 48c744242008000000 mov qword ptr [rsp + 0x20], 8
0x14592fd48: 4889f9 mov rcx, rdi
0x14592fd4b: 4889f2 mov rdx, rsi
0x14592fd4e: 4c8d85e0000000 lea r8, [rbp + 0xe0]
0x14592fd55: 0f28fb movaps xmm7, xmm3
0x14592fd58: 410f28da movaps xmm3, xmm10
0x14592fd5c: e88fb5ffff call 0x14592b2f0
0x14592fd61: 90 nop
0x14592fd62: 0f28df movaps xmm3, xmm7
0x14592fd65: 488b5540 mov rdx, qword ptr [rbp + 0x40]
0x14592fd69: 488b7d50 mov rdi, qword ptr [rbp + 0x50]
0x14592fd6d: 4885d2 test rdx, rdx
0x14592fd70: 7416 je 0x14592fd88
0x14592fd72: 488b4d48 mov rcx, qword ptr [rbp + 0x48]
0x14592fd76: 48c1e203 shl rdx, 3
0x14592fd7a: 41b808000000 mov r8d, 8
0x14592fd80: e84b246dfa call 0x1400021d0
0x14592fd85: 0f28df movaps xmm3, xmm7
0x14592fd88: 4885ff test rdi, rdi
0x14592fd8b: 410f95c0 setne r8b
0x14592fd8f: 488d7d40 lea rdi, [rbp + 0x40]
0x14592fd93: 4180f801 cmp r8b, 1
0x14592fd97: 753e jne 0x14592fdd7
0x14592fd99: 4c3b6e78 cmp r13, qword ptr [rsi + 0x78]
0x14592fd9d: 730e jae 0x14592fdad
0x14592fd9f: 488b4670 mov rax, qword ptr [rsi + 0x70]
0x14592fda3: f30f58de addss xmm3, xmm6
0x14592fda7: f3420f111ca8 movss dword ptr [rax + r13*4], xmm3
0x14592fdad: 4c3bae90000000 cmp r13, qword ptr [rsi + 0x90]
0x14592fdb4: 7329 jae 0x14592fddf
0x14592fdb6: 488b8688000000 mov rax, qword ptr [rsi + 0x88]
0x14592fdbd: 428b0ca8 mov ecx, dword ptr [rax + r13*4]
0x14592fdc1: 89ca mov edx, ecx
0x14592fdc3: 83e201 and edx, 1
0x14592fdc6: ffc1 inc ecx
0x14592fdc8: 42890ca8 mov dword ptr [rax + r13*4], ecx
0x14592fdcc: 660f6ebc95a8000000 movd xmm7, dword ptr [rbp + rdx*4 + 0xa8]
0x14592fdd5: eb0d jmp 0x14592fde4
0x14592fdd7: 4531ff xor r15d, r15d
0x14592fdda: e92afcffff jmp 0x14592fa09
0x14592fddf: 66410f6eff movd xmm7, r15d
0x14592fde4: 488d8dc0000000 lea rcx, [rbp + 0xc0]
0x14592fdeb: 488d96c8010000 lea rdx, [rsi + 0x1c8]
0x14592fdf2: e889340700 call 0x1459a3280
0x14592fdf7: 90 nop
0x14592fdf8: c7455000000000 mov dword ptr [rbp + 0x50], 0
0x14592fdff: 8b8500010000 mov eax, dword ptr [rbp + 0x100]
0x14592fe05: 894554 mov dword ptr [rbp + 0x54], eax
0x14592fe08: 488d86b8090000 lea rax, [rsi + 0x9b8]
0x14592fe0f: 48894540 mov qword ptr [rbp + 0x40], rax
0x14592fe13: 488d85c0000000 lea rax, [rbp + 0xc0]
0x14592fe1a: 48894548 mov qword ptr [rbp + 0x48], rax
0x14592fe1e: 488d8de0000000 lea rcx, [rbp + 0xe0]
0x14592fe25: 4889fa mov rdx, rdi
0x14592fe28: e873a20a00 call 0x1459da0a0
0x14592fe2d: 90 nop
0x14592fe2e: 488b85e0000000 mov rax, qword ptr [rbp + 0xe0]
0x14592fe35: 48894538 mov qword ptr [rbp + 0x38], rax
0x14592fe39: 4c8bbde8000000 mov r15, qword ptr [rbp + 0xe8]
0x14592fe40: 488b85f0000000 mov rax, qword ptr [rbp + 0xf0]
0x14592fe47: 498d04c7 lea rax, [r15 + rax*8]
0x14592fe4b: 48898500010000 mov qword ptr [rbp + 0x100], rax
0x14592fe52: 4c897d20 mov qword ptr [rbp + 0x20], r15
0x14592fe56: eb35 jmp 0x14592fe8d
0x14592fe58: 4b8b0403 mov rax, qword ptr [r11 + r8]
0x14592fe5c: 4801c1 add rcx, rax
0x14592fe5f: 4883f90b cmp rcx, 0xb
0x14592fe63: 0f87f4000000 ja 0x14592ff5d
0x14592fe69: 4983c708 add r15, 8
0x14592fe6d: 4c896c2420 mov qword ptr [rsp + 0x20], r13
0x14592fe72: c74424280000803f mov dword ptr [rsp + 0x28], 0x3f800000
0x14592fe7a: 4889f1 mov rcx, rsi
0x14592fe7d: 41b801000000 mov r8d, 1
0x14592fe83: 660f6fdf movdqa xmm3, xmm7
0x14592fe87: e8a49c0200 call 0x145959b30
0x14592fe8c: 90 nop
0x14592fe8d: 4c3bbd00010000 cmp r15, qword ptr [rbp + 0x100]
0x14592fe94: 0f84c3000000 je 0x14592ff5d
0x14592fe9a: 498b17 mov rdx, qword ptr [r15]
0x14592fe9d: 4c8b8ed8000000 mov r9, qword ptr [rsi + 0xd8]
0x14592fea4: 4d85c9 test r9, r9
0x14592fea7: 74c0 je 0x14592fe69
0x14592fea9: 4c8b9ed0000000 mov r11, qword ptr [rsi + 0xd0]
0x14592feb0: 4983f901 cmp r9, 1
0x14592feb4: 750a jne 0x14592fec0
0x14592feb6: 4531c0 xor r8d, r8d
0x14592feb9: 31c9 xor ecx, ecx
0x14592febb: e97f000000 jmp 0x14592ff3f
0x14592fec0: 488955c0 mov qword ptr [rbp - 0x40], rdx
0x14592fec4: 4d89ca mov r10, r9
0x14592fec7: 4983e2fe and r10, 0xfffffffffffffffe
0x14592fecb: 4c895de0 mov qword ptr [rbp - 0x20], r11
0x14592fecf: 4981c398000000 add r11, 0x98
0x14592fed6: 4531c0 xor r8d, r8d
0x14592fed9: 31c9 xor ecx, ecx
0x14592fedb: eb19 jmp 0x14592fef6
0x14592fedd: 0f1f00 nop dword ptr [rax]
0x14592fee0: 4801f9 add rcx, rdi
0x14592fee3: 4801c1 add rcx, rax
0x14592fee6: 4983c002 add r8, 2
0x14592feea: 4981c300010000 add r11, 0x100
0x14592fef1: 4d39c2 cmp r10, r8
0x14592fef4: 7433 je 0x14592ff29
0x14592fef6: 498b4380 mov rax, qword ptr [r11 - 0x80]
0x14592fefa: 0fb64039 movzx eax, byte ptr [rax + 0x39]
0x14592fefe: fec8 dec al
0x14592ff00: bf00000000 mov edi, 0
0x14592ff05: 3c04 cmp al, 4
0x14592ff07: 7307 jae 0x14592ff10
0x14592ff09: 498bbb68ffffff mov rdi, qword ptr [r11 - 0x98]
0x14592ff10: 498b03 mov rax, qword ptr [r11]
0x14592ff13: 0fb65039 movzx edx, byte ptr [rax + 0x39]
0x14592ff17: feca dec dl
0x14592ff19: b800000000 mov eax, 0
0x14592ff1e: 80fa04 cmp dl, 4
0x14592ff21: 73bd jae 0x14592fee0
0x14592ff23: 498b43e8 mov rax, qword ptr [r11 - 0x18]
0x14592ff27: ebb7 jmp 0x14592fee0
0x14592ff29: 41f6c101 test r9b, 1
0x14592ff2d: 488d7d40 lea rdi, [rbp + 0x40]
0x14592ff31: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
0x14592ff35: 4c8b5de0 mov r11, qword ptr [rbp - 0x20]
0x14592ff39: 0f8420ffffff je 0x14592fe5f
0x14592ff3f: 49c1e007 shl r8, 7
0x14592ff43: 4b8b440318 mov rax, qword ptr [r11 + r8 + 0x18]
0x14592ff48: 0fb64039 movzx eax, byte ptr [rax + 0x39]
0x14592ff4c: fec8 dec al
0x14592ff4e: 3c04 cmp al, 4
0x14592ff50: 0f8202ffffff jb 0x14592fe58
0x14592ff56: 31c0 xor eax, eax
0x14592ff58: e9fffeffff jmp 0x14592fe5c
0x14592ff5d: 488b5538 mov rdx, qword ptr [rbp + 0x38]
0x14592ff61: 4885d2 test rdx, rdx
0x14592ff64: 7413 je 0x14592ff79
0x14592ff66: 48c1e203 shl rdx, 3
0x14592ff6a: 41b808000000 mov r8d, 8
0x14592ff70: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
0x14592ff74: e857226dfa call 0x1400021d0
0x14592ff79: 488b95c0000000 mov rdx, qword ptr [rbp + 0xc0]
0x14592ff80: 4885d2 test rdx, rdx
0x14592ff83: 7416 je 0x14592ff9b
0x14592ff85: 488b8dc8000000 mov rcx, qword ptr [rbp + 0xc8]
0x14592ff8c: 48c1e203 shl rdx, 3
0x14592ff90: 41b808000000 mov r8d, 8
0x14592ff96: e835226dfa call 0x1400021d0
0x14592ff9b: 41b701 mov r15b, 1
0x14592ff9e: e966faffff jmp 0x14592fa09
0x14592ffa3: 4589c7 mov r15d, r8d
0x14592ffa6: e95efaffff jmp 0x14592fa09

; infernal-cooldown-inputs: 0x14593007e..0x1459301cf (end exclusive)
0x14593007e: 488b8630030000 mov rax, qword ptr [rsi + 0x330]
0x145930085: 488b9638030000 mov rdx, qword ptr [rsi + 0x338]
0x14593008c: 488d0d4c962d01 lea rcx, [rip + 0x12d964c]
0x145930093: 48898de0000000 mov qword ptr [rbp + 0xe0], rcx
0x14593009a: 48c785e800000008000000 mov qword ptr [rbp + 0xe8], 8
0x1459300a5: 31c9 xor ecx, ecx
0x1459300a7: eb18 jmp 0x1459300c1
0x1459300a9: 0f1f8000000000 nop dword ptr [rax]
0x1459300b0: 4883c178 add rcx, 0x78
0x1459300b4: 4881f9f8340000 cmp rcx, 0x34f8
0x1459300bb: 0f8437320000 je 0x1459332f8
0x1459300c1: 4a837c290808 cmp qword ptr [rcx + r13 + 8], 8
0x1459300c7: 75e7 jne 0x1459300b0
0x1459300c9: 4e8b0429 mov r8, qword ptr [rcx + r13]
0x1459300cd: 493918 cmp qword ptr [r8], rbx
0x1459300d0: 75de jne 0x1459300b0
0x1459300d2: 4c01e9 add rcx, r13
0x1459300d5: 4885d2 test rdx, rdx
0x1459300d8: 743b je 0x145930115
0x1459300da: 486bd258 imul rdx, rdx, 0x58
0x1459300de: 4531c0 xor r8d, r8d
0x1459300e1: eb16 jmp 0x1459300f9
0x1459300e3: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1459300f0: 4983c058 add r8, 0x58
0x1459300f4: 4c39c2 cmp rdx, r8
0x1459300f7: 741c je 0x145930115
0x1459300f9: 4e8b3c00 mov r15, qword ptr [rax + r8]
0x1459300fd: 49837f0808 cmp qword ptr [r15 + 8], 8
0x145930102: 75ec jne 0x1459300f0
0x145930104: 4d8b0f mov r9, qword ptr [r15]
0x145930107: 493919 cmp qword ptr [r9], rbx
0x14593010a: 75e4 jne 0x1459300f0
0x14593010c: f3420f107c0014 movss xmm7, dword ptr [rax + r8 + 0x14]
0x145930113: eb07 jmp 0x14593011c
0x145930115: 410f28f8 movaps xmm7, xmm8
0x145930119: 4989cf mov r15, rcx
0x14593011c: 4c89d9 mov rcx, r11
0x14593011f: 488d96c8010000 lea rdx, [rsi + 0x1c8]
0x145930126: 4c89df mov rdi, r11
0x145930129: e85277f6ff call 0x145897880
0x14593012e: 90 nop
0x14593012f: 488d8de0000000 lea rcx, [rbp + 0xe0]
0x145930136: 4889fa mov rdx, rdi
0x145930139: 4d89f8 mov r8, r15
0x14593013c: e86f79f6ff call 0x145897ab0
0x145930141: 90 nop
0x145930142: f3440f10bde4000000 movss xmm15, dword ptr [rbp + 0xe4]
0x14593014b: 4889f9 mov rcx, rdi
0x14593014e: e8ad61f6ff call 0x145896300
0x145930153: 49837f0808 cmp qword ptr [r15 + 8], 8
0x145930158: 410f28c1 movaps xmm0, xmm9
0x14593015c: 7512 jne 0x145930170
0x14593015e: 498b07 mov rax, qword ptr [r15]
0x145930161: 410f28c1 movaps xmm0, xmm9
0x145930165: 483918 cmp qword ptr [rax], rbx
0x145930168: 7506 jne 0x145930170
0x14593016a: 410f28c2 movaps xmm0, xmm10
0x14593016e: 6690 nop
0x145930170: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
0x145930177: 4939d6 cmp r14, rdx
0x14593017a: 0f834e320000 jae 0x1459333ce
0x145930180: f3410f104f48 movss xmm1, dword ptr [r15 + 0x48]
0x145930186: f3410f59cb mulss xmm1, xmm11
0x14593018b: f30f59f9 mulss xmm7, xmm1
0x14593018f: f3440f59ff mulss xmm15, xmm7
0x145930194: f3440f59be88040000 mulss xmm15, dword ptr [rsi + 0x488]
0x14593019d: 410f28cf movaps xmm1, xmm15
0x1459301a1: f30f5fc8 maxss xmm1, xmm0
0x1459301a5: 0f28c1 movaps xmm0, xmm1
0x1459301a8: f30fc2c103 cmpunordss xmm0, xmm1
0x1459301ad: 440f54f8 andps xmm15, xmm0
0x1459301b1: 0f55c1 andnps xmm0, xmm1
0x1459301b4: 410f56c7 orps xmm0, xmm15
0x1459301b8: f3410f5fc2 maxss xmm0, xmm10
0x1459301bd: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
0x1459301c4: f30f58c6 addss xmm0, xmm6
0x1459301c8: f3420f11442078 movss dword ptr [rax + r12 + 0x78], xmm0

; infernal-boost-and-echo: 0x1459301df..0x145930334 (end exclusive)
0x1459301df: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
0x1459301e6: 42807c207c00 cmp byte ptr [rax + r12 + 0x7c], 0
0x1459301ec: 42c644207c00 mov byte ptr [rax + r12 + 0x7c], 0
0x1459301f2: 410f28fc movaps xmm7, xmm12
0x1459301f6: 488bbdb8000000 mov rdi, qword ptr [rbp + 0xb8]
0x1459301fd: 7504 jne 0x145930203
0x1459301ff: 410f28f8 movaps xmm7, xmm8
0x145930203: 4889f1 mov rcx, rsi
0x145930206: 4c89f2 mov rdx, r14
0x145930209: 4531c0 xor r8d, r8d
0x14593020c: 0f28df movaps xmm3, xmm7
0x14593020f: e8dca90200 call 0x14595abf0
0x145930214: 488b9600080000 mov rdx, qword ptr [rsi + 0x800]
0x14593021b: 4885d2 test rdx, rdx
0x14593021e: 4c8d5d40 lea r11, [rbp + 0x40]
0x145930222: 0f8418feffff je 0x145930040
0x145930228: 488b86f8070000 mov rax, qword ptr [rsi + 0x7f8]
0x14593022f: 4883fa01 cmp rdx, 1
0x145930233: 7508 jne 0x14593023d
0x145930235: 31c9 xor ecx, ecx
0x145930237: 410f28c5 movaps xmm0, xmm13
0x14593023b: eb4d jmp 0x14593028a
0x14593023d: 4989d0 mov r8, rdx
0x145930240: 4983e0fe and r8, 0xfffffffffffffffe
0x145930244: 31c9 xor ecx, ecx
0x145930246: 410f28c5 movaps xmm0, xmm13
0x14593024a: eb0d jmp 0x145930259
0x14593024c: 0f1f4000 nop dword ptr [rax]
0x145930250: 4883c102 add rcx, 2
0x145930254: 4939c8 cmp r8, rcx
0x145930257: 742c je 0x145930285
0x145930259: 803cc81f cmp byte ptr [rax + rcx*8], 0x1f
0x14593025d: 7411 je 0x145930270
0x14593025f: 807cc8081f cmp byte ptr [rax + rcx*8 + 8], 0x1f
0x145930264: 75ea jne 0x145930250
0x145930266: eb15 jmp 0x14593027d
0x145930268: 0f1f840000000000 nop dword ptr [rax + rax]
0x145930270: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
0x145930276: 807cc8081f cmp byte ptr [rax + rcx*8 + 8], 0x1f
0x14593027b: 75d3 jne 0x145930250
0x14593027d: f30f5844c80c addss xmm0, dword ptr [rax + rcx*8 + 0xc]
0x145930283: ebcb jmp 0x145930250
0x145930285: f6c201 test dl, 1
0x145930288: 740c je 0x145930296
0x14593028a: 803cc81f cmp byte ptr [rax + rcx*8], 0x1f
0x14593028e: 7506 jne 0x145930296
0x145930290: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
0x145930296: 410f2ec6 ucomiss xmm0, xmm14
0x14593029a: 0f86a0fdffff jbe 0x145930040
0x1459302a0: 488b86d0090000 mov rax, qword ptr [rsi + 0x9d0]
0x1459302a7: 488b8eb8090000 mov rcx, qword ptr [rsi + 0x9b8]
0x1459302ae: 488b96c0090000 mov rdx, qword ptr [rsi + 0x9c0]
0x1459302b5: 4c8d0408 lea r8, [rax + rcx]
0x1459302b9: 49c1c017 rol r8, 0x17
0x1459302bd: 4901c8 add r8, rcx
0x1459302c0: 4989d1 mov r9, rdx
0x1459302c3: 49c1e111 shl r9, 0x11
0x1459302c7: 4c8b96c8090000 mov r10, qword ptr [rsi + 0x9c8]
0x1459302ce: 4931ca xor r10, rcx
0x1459302d1: 4831d0 xor rax, rdx
0x1459302d4: 4c31d2 xor rdx, r10
0x1459302d7: 488996c0090000 mov qword ptr [rsi + 0x9c0], rdx
0x1459302de: 4831c1 xor rcx, rax
0x1459302e1: 48898eb8090000 mov qword ptr [rsi + 0x9b8], rcx
0x1459302e8: 4d31ca xor r10, r9
0x1459302eb: 4c8996c8090000 mov qword ptr [rsi + 0x9c8], r10
0x1459302f2: 48c1c02d rol rax, 0x2d
0x1459302f6: 49c1e828 shr r8, 0x28
0x1459302fa: 0f57c9 xorps xmm1, xmm1
0x1459302fd: f3410f2ac8 cvtsi2ss xmm1, r8d
0x145930302: 488986d0090000 mov qword ptr [rsi + 0x9d0], rax
0x145930309: f30f590d2f275900 mulss xmm1, dword ptr [rip + 0x59272f]
0x145930311: 0f2ec1 ucomiss xmm0, xmm1
0x145930314: 0f8626fdffff jbe 0x145930040
0x14593031a: 4889f1 mov rcx, rsi
0x14593031d: 4c89f2 mov rdx, r14
0x145930320: 41b001 mov r8b, 1
0x145930323: 0f28df movaps xmm3, xmm7
0x145930326: e8c5a80200 call 0x14595abf0
0x14593032b: 4c8d5d40 lea r11, [rbp + 0x40]
0x14593032f: e90cfdffff jmp 0x145930040

; actor-follow-and-ranged-admission: 0x145930385..0x1459307d3 (end exclusive)
0x145930385: f3440f108e4c0a0000 movss xmm9, dword ptr [rsi + 0xa4c]
0x14593038e: 4889f1 mov rcx, rsi
0x145930391: e82acfffff call 0x14592d2c0
0x145930396: f2440f1086d0040000 movsd xmm8, qword ptr [rsi + 0x4d0]
0x14593039f: f30f100509504800 movss xmm0, dword ptr [rip + 0x485009]
0x1459303a7: f30f10b694040000 movss xmm6, dword ptr [rsi + 0x494]
0x1459303af: f30f59f0 mulss xmm6, xmm0
0x1459303b3: 488b86d8000000 mov rax, qword ptr [rsi + 0xd8]
0x1459303ba: 488985b8000000 mov qword ptr [rbp + 0xb8], rax
0x1459303c1: f3440f101dc60f4800 movss xmm11, dword ptr [rip + 0x480fc6]
0x1459303ca: f3450f58d9 addss xmm11, xmm9
0x1459303cf: 440f28fe movaps xmm15, xmm6
0x1459303d3: f3440f5ff8 maxss xmm15, xmm0
0x1459303d8: f3440f1035df882d01 movss xmm14, dword ptr [rip + 0x12d88df]
0x1459303e1: f3450f59f7 mulss xmm14, xmm15
0x1459303e6: f3440f593d11ad4800 mulss xmm15, dword ptr [rip + 0x48ad11]
0x1459303ef: f30f100555872d01 movss xmm0, dword ptr [rip + 0x12d8755]
0x1459303f7: f30f59c6 mulss xmm0, xmm6
0x1459303fb: f30f5f05fdde4800 maxss xmm0, dword ptr [rip + 0x48defd]
0x145930403: f30f1145e0 movss dword ptr [rbp - 0x20], xmm0
0x145930408: f30f593570d04700 mulss xmm6, dword ptr [rip + 0x47d070]
0x145930410: 410f28c3 movaps xmm0, xmm11
0x145930414: 410f14c1 unpcklps xmm0, xmm9
0x145930418: 0f2945c0 movaps xmmword ptr [rbp - 0x40], xmm0
0x14593041c: 0f57ff xorps xmm7, xmm7
0x14593041f: 4531ff xor r15d, r15d
0x145930422: eb25 jmp 0x145930449
0x145930424: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145930430: f30f16da movshdup xmm3, xmm2
0x145930434: f30f11742420 movss dword ptr [rsp + 0x20], xmm6
0x14593043a: 4889f1 mov rcx, rsi
0x14593043d: 4889da mov rdx, rbx
0x145930440: e8ab970000 call 0x145939bf0
0x145930445: 4c8b7d30 mov r15, qword ptr [rbp + 0x30]
0x145930449: 4c3bbdb8000000 cmp r15, qword ptr [rbp + 0xb8]
0x145930450: 0f835d2d0000 jae 0x1459331b3
0x145930456: 4c89fb mov rbx, r15
0x145930459: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
0x145930460: 4939d7 cmp r15, rdx
0x145930463: 0f83402f0000 jae 0x1459333a9
0x145930469: 4c8d7b01 lea r15, [rbx + 1]
0x14593046d: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
0x145930474: 4889df mov rdi, rbx
0x145930477: 48c1e707 shl rdi, 7
0x14593047b: f30f10443864 movss xmm0, dword ptr [rax + rdi + 0x64]
0x145930481: 410f2ec1 ucomiss xmm0, xmm9
0x145930485: 77c2 ja 0x145930449
0x145930487: 4801f8 add rax, rdi
0x14593048a: f3440f115864 movss dword ptr [rax + 0x64], xmm11
0x145930490: 4c8bb6d8000000 mov r14, qword ptr [rsi + 0xd8]
0x145930497: 4c39f3 cmp rbx, r14
0x14593049a: 0f831a2f0000 jae 0x1459333ba
0x1459304a0: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
0x1459304a7: 4c8d2438 lea r12, [rax + rdi]
0x1459304ab: f30f1044385c movss xmm0, dword ptr [rax + rdi + 0x5c]
0x1459304b1: 0f2ef8 ucomiss xmm7, xmm0
0x1459304b4: 4c897d30 mov qword ptr [rbp + 0x30], r15
0x1459304b8: 7366 jae 0x145930520
0x1459304ba: 410f28c9 movaps xmm1, xmm9
0x1459304be: f3410f5c4c2458 subss xmm1, dword ptr [r12 + 0x58]
0x1459304c5: f30f5ec8 divss xmm1, xmm0
0x1459304c9: 0f57c0 xorps xmm0, xmm0
0x1459304cc: f30f5fc1 maxss xmm0, xmm1
0x1459304d0: f30f100d88cd4700 movss xmm1, dword ptr [rip + 0x47cd88]
0x1459304d8: f30f5dc8 minss xmm1, xmm0
0x1459304dc: f2410f10442440 movsd xmm0, qword ptr [r12 + 0x40]
0x1459304e3: f2410f1054244c movsd xmm2, qword ptr [r12 + 0x4c]
0x1459304ea: 0f5cd0 subps xmm2, xmm0
0x1459304ed: f3440f12d1 movsldup xmm10, xmm1
0x1459304f2: 440f59d2 mulps xmm10, xmm2
0x1459304f6: 440f58d0 addps xmm10, xmm0
0x1459304fa: f3410f10442448 movss xmm0, dword ptr [r12 + 0x48]
0x145930501: f3410f10542454 movss xmm2, dword ptr [r12 + 0x54]
0x145930508: f30f5cd0 subss xmm2, xmm0
0x14593050c: f30f59d1 mulss xmm2, xmm1
0x145930510: f30f58d0 addss xmm2, xmm0
0x145930514: 440f135510 movlps qword ptr [rbp + 0x10], xmm10
0x145930519: f30f115518 movss dword ptr [rbp + 0x18], xmm2
0x14593051e: eb17 jmp 0x145930537
0x145930520: 498b4c244c mov rcx, qword ptr [r12 + 0x4c]
0x145930525: 48894d10 mov qword ptr [rbp + 0x10], rcx
0x145930529: 418b4c2454 mov ecx, dword ptr [r12 + 0x54]
0x14593052e: 894d18 mov dword ptr [rbp + 0x18], ecx
0x145930531: f2440f105510 movsd xmm10, qword ptr [rbp + 0x10]
0x145930537: 4c8b7c3818 mov r15, qword ptr [rax + rdi + 0x18]
0x14593053c: f3450f10642468 movss xmm12, dword ptr [r12 + 0x68]
0x145930543: f3440f58a6dc040000 addss xmm12, dword ptr [rsi + 0x4dc]
0x14593054c: 4531ed xor r13d, r13d
0x14593054f: 41807f3905 cmp byte ptr [r15 + 0x39], 5
0x145930554: 410f93c5 setae r13b
0x145930558: 410f28c4 movaps xmm0, xmm12
0x14593055c: e8b69e2d00 call 0x145c0a417
0x145930561: 440f28e8 movaps xmm13, xmm0
0x145930565: 410f28c4 movaps xmm0, xmm12
0x145930569: e8a39e2d00 call 0x145c0a411
0x14593056e: 440f14e8 unpcklps xmm13, xmm0
0x145930572: 488d0517882d01 lea rax, [rip + 0x12d8817]
0x145930579: f3420f1004a8 movss xmm0, dword ptr [rax + r13*4]
0x14593057f: f30f12d0 movsldup xmm2, xmm0
0x145930583: 410f59d5 mulps xmm2, xmm13
0x145930587: 410f58d0 addps xmm2, xmm8
0x14593058b: 410f28c2 movaps xmm0, xmm10
0x14593058f: 410f5cc0 subps xmm0, xmm8
0x145930593: 0f59c0 mulps xmm0, xmm0
0x145930596: f30f16c8 movshdup xmm1, xmm0
0x14593059a: f30f58c8 addss xmm1, xmm0
0x14593059e: 0f57c0 xorps xmm0, xmm0
0x1459305a1: f30f51c1 sqrtss xmm0, xmm1
0x1459305a5: 0f2e0538cf4700 ucomiss xmm0, dword ptr [rip + 0x47cf38]
0x1459305ac: 0f877efeffff ja 0x145930430
0x1459305b2: 41837f3400 cmp dword ptr [r15 + 0x34], 0
0x1459305b7: 7461 je 0x14593061a
0x1459305b9: 440f5cd2 subps xmm10, xmm2
0x1459305bd: 450f59d2 mulps xmm10, xmm10
0x1459305c1: f3410f16c2 movshdup xmm0, xmm10
0x1459305c6: f3410f58c2 addss xmm0, xmm10
0x1459305cb: f30f51c0 sqrtss xmm0, xmm0
0x1459305cf: 0f2e053eb37a00 ucomiss xmm0, dword ptr [rip + 0x7ab33e]
0x1459305d6: 761d jbe 0x1459305f5
0x1459305d8: f30f16da movshdup xmm3, xmm2
0x1459305dc: f3440f11742420 movss dword ptr [rsp + 0x20], xmm14
0x1459305e3: 4889f1 mov rcx, rsi
0x1459305e6: 4889da mov rdx, rbx
0x1459305e9: e802960000 call 0x145939bf0
0x1459305ee: 4c8bb6d8000000 mov r14, qword ptr [rsi + 0xd8]
0x1459305f5: 4c39f3 cmp rbx, r14
0x1459305f8: 0f83f22d0000 jae 0x1459333f0
0x1459305fe: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
0x145930605: 440f2e4c3860 ucomiss xmm9, dword ptr [rax + rdi + 0x60]
0x14593060b: 0f83bd000000 jae 0x1459306ce
0x145930611: 4c8d7b01 lea r15, [rbx + 1]
0x145930615: e9f7210000 jmp 0x145932811
0x14593061a: 4d8b642428 mov r12, qword ptr [r12 + 0x28]
0x14593061f: 488b8e70050000 mov rcx, qword ptr [rsi + 0x570]
0x145930626: 4885c9 test rcx, rcx
0x145930629: 0f84f5020000 je 0x145930924
0x14593062f: 488b8668050000 mov rax, qword ptr [rsi + 0x568]
0x145930636: 4869d1d8010000 imul rdx, rcx, 0x1d8
0x14593063d: 31c9 xor ecx, ecx
0x14593063f: eb1f jmp 0x145930660
0x145930641: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145930650: 4881c1d8010000 add rcx, 0x1d8
0x145930657: 4839ca cmp rdx, rcx
0x14593065a: 0f84c4020000 je 0x145930924
0x145930660: 4c39a408f0000000 cmp qword ptr [rax + rcx + 0xf0], r12
0x145930668: 75e6 jne 0x145930650
0x14593066a: 83bc08b000000001 cmp dword ptr [rax + rcx + 0xb0], 1
0x145930672: 74dc je 0x145930650
0x145930674: f30f10840890010000 movss xmm0, dword ptr [rax + rcx + 0x190]
0x14593067d: 0f2ef8 ucomiss xmm7, xmm0
0x145930680: 0f834c020000 jae 0x1459308d2
0x145930686: 410f28c9 movaps xmm1, xmm9
0x14593068a: f30f5c8c088c010000 subss xmm1, dword ptr [rax + rcx + 0x18c]
0x145930693: f30f5ec8 divss xmm1, xmm0
0x145930697: 0f57c0 xorps xmm0, xmm0
0x14593069a: f30f5fc1 maxss xmm0, xmm1
0x14593069e: f30f100dbacb4700 movss xmm1, dword ptr [rip + 0x47cbba]
0x1459306a6: f30f5dc8 minss xmm1, xmm0
0x1459306aa: f20f109c0874010000 movsd xmm3, qword ptr [rax + rcx + 0x174]
0x1459306b3: f20f10a40880010000 movsd xmm4, qword ptr [rax + rcx + 0x180]
0x1459306bc: 0f5ce3 subps xmm4, xmm3
0x1459306bf: f30f12c1 movsldup xmm0, xmm1
0x1459306c3: 0f59c4 mulps xmm0, xmm4
0x1459306c6: 0f58c3 addps xmm0, xmm3
0x1459306c9: e90d020000 jmp 0x1459308db
0x1459306ce: 41807f3900 cmp byte ptr [r15 + 0x39], 0
0x1459306d3: 7417 je 0x1459306ec
0x1459306d5: 4889f1 mov rcx, rsi
0x1459306d8: 4889da mov rdx, rbx
0x1459306db: e800800200 call 0x1459586e0
0x1459306e0: 4989c6 mov r14, rax
0x1459306e3: 4989d4 mov r12, rdx
0x1459306e6: 4c8d7b01 lea r15, [rbx + 1]
0x1459306ea: eb4c jmp 0x145930738
0x1459306ec: 488d4d40 lea rcx, [rbp + 0x40]
0x1459306f0: 4889f2 mov rdx, rsi
0x1459306f3: 4c8d4510 lea r8, [rbp + 0x10]
0x1459306f7: f30f101de1dc4800 movss xmm3, dword ptr [rip + 0x48dce1]
0x1459306ff: e8bcadffff call 0x14592b4c0
0x145930704: 488b4d48 mov rcx, qword ptr [rbp + 0x48]
0x145930708: 48837d5000 cmp qword ptr [rbp + 0x50], 0
0x14593070d: 0f84a6010000 je 0x1459308b9
0x145930713: 4c8b21 mov r12, qword ptr [rcx]
0x145930716: 41be01000000 mov r14d, 1
0x14593071c: 4c8d7b01 lea r15, [rbx + 1]
0x145930720: 488b5540 mov rdx, qword ptr [rbp + 0x40]
0x145930724: 4885d2 test rdx, rdx
0x145930727: 740f je 0x145930738
0x145930729: 48c1e203 shl rdx, 3
0x14593072d: 41b808000000 mov r8d, 8
0x145930733: e8981a6dfa call 0x1400021d0
0x145930738: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
0x14593073f: 4839d3 cmp rbx, rdx
0x145930742: 0f83bc2c0000 jae 0x145933404
0x145930748: 41f6c601 test r14b, 1
0x14593074c: b800000000 mov eax, 0
0x145930751: 490f45c4 cmovne rax, r12
0x145930755: 488b8ed0000000 mov rcx, qword ptr [rsi + 0xd0]
0x14593075c: 4889443928 mov qword ptr [rcx + rdi + 0x28], rax
0x145930761: 0f84aa200000 je 0x145932811
0x145930767: 4889f1 mov rcx, rsi
0x14593076a: 4889da mov rdx, rbx
0x14593076d: e83e910200 call 0x1459598b0
0x145930772: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
0x145930779: 4839d3 cmp rbx, rdx
0x14593077c: 0f83a42c0000 jae 0x145933426
0x145930782: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
0x145930789: f3410f58c1 addss xmm0, xmm9
0x14593078e: f30f11443860 movss dword ptr [rax + rdi + 0x60], xmm0
0x145930794: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
0x14593079b: 4839d3 cmp rbx, rdx
0x14593079e: 0f83932c0000 jae 0x145933437
0x1459307a4: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
0x1459307ab: 4c8b7c3818 mov r15, qword ptr [rax + rdi + 0x18]
0x1459307b0: 4801f8 add rax, rdi
0x1459307b3: 410fb64f39 movzx ecx, byte ptr [r15 + 0x39]
0x1459307b8: 83f901 cmp ecx, 1
0x1459307bb: 0f847f060000 je 0x145930e40
0x1459307c1: 83f907 cmp ecx, 7
0x1459307c4: 0f8472050000 je 0x145930d3c
0x1459307ca: 83f908 cmp ecx, 8
0x1459307cd: 0f85e5060000 jne 0x145930eb8

; pit-learned-target-read: 0x1459307d3..0x1459308b9 (end exclusive)
0x1459307d3: 488b8e30030000 mov rcx, qword ptr [rsi + 0x330]
0x1459307da: 4c8b8638030000 mov r8, qword ptr [rsi + 0x338]
0x1459307e1: 488d15e8af2d01 lea rdx, [rip + 0x12dafe8]
0x1459307e8: 488995e0000000 mov qword ptr [rbp + 0xe0], rdx
0x1459307ef: 48c785e80000000c000000 mov qword ptr [rbp + 0xe8], 0xc
0x1459307fa: 31d2 xor edx, edx
0x1459307fc: 4c8d1dad562c01 lea r11, [rip + 0x12c56ad]
0x145930803: 4c8d7b01 lea r15, [rbx + 1]
0x145930807: eb18 jmp 0x145930821
0x145930809: 0f1f8000000000 nop dword ptr [rax]
0x145930810: 4883c278 add rdx, 0x78
0x145930814: 4881faf8340000 cmp rdx, 0x34f8
0x14593081b: 0f84d72a0000 je 0x1459332f8
0x145930821: 4a837c1a080c cmp qword ptr [rdx + r11 + 8], 0xc
0x145930827: 75e7 jne 0x145930810
0x145930829: 4e8b0c1a mov r9, qword ptr [rdx + r11]
0x14593082d: 4d8b11 mov r10, qword ptr [r9]
0x145930830: 49be73656172696e675f movabs r14, 0x5f676e6972616573
0x14593083a: 4d31f2 xor r10, r14
0x14593083d: 458b4908 mov r9d, dword ptr [r9 + 8]
0x145930841: 4981f17061696e xor r9, 0x6e696170
0x145930848: 4d09d1 or r9, r10
0x14593084b: 75c3 jne 0x145930810
0x14593084d: 4c01da add rdx, r11
0x145930850: 4531f6 xor r14d, r14d
0x145930853: 4d85c0 test r8, r8
0x145930856: 0f84b0060000 je 0x145930f0c
0x14593085c: 4d6bc058 imul r8, r8, 0x58
0x145930860: 4531d2 xor r10d, r10d
0x145930863: eb18 jmp 0x14593087d
0x145930865: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145930870: 4983c258 add r10, 0x58
0x145930874: 4d39d0 cmp r8, r10
0x145930877: 0f848f060000 je 0x145930f0c
0x14593087d: 4e8b0c11 mov r9, qword ptr [rcx + r10]
0x145930881: 498379080c cmp qword ptr [r9 + 8], 0xc
0x145930886: 75e8 jne 0x145930870
0x145930888: 4d8b19 mov r11, qword ptr [r9]
0x14593088b: 4d8b3b mov r15, qword ptr [r11]
0x14593088e: 49bc73656172696e675f movabs r12, 0x5f676e6972616573
0x145930898: 4d31e7 xor r15, r12
0x14593089b: 458b5b08 mov r11d, dword ptr [r11 + 8]
0x14593089f: 4981f37061696e xor r11, 0x6e696170
0x1459308a6: 4d09fb or r11, r15
0x1459308a9: 4c8d7b01 lea r15, [rbx + 1]
0x1459308ad: 75c1 jne 0x145930870
0x1459308af: 468b741118 mov r14d, dword ptr [rcx + r10 + 0x18]
0x1459308b4: e956060000 jmp 0x145930f0f

; actor-melee-admission-and-prediction: 0x1459308d2..0x145930d3c (end exclusive)
0x1459308d2: f20f10840880010000 movsd xmm0, qword ptr [rax + rcx + 0x180]
0x1459308db: 410f5cc0 subps xmm0, xmm8
0x1459308df: 0f59c0 mulps xmm0, xmm0
0x1459308e2: f30f16c8 movshdup xmm1, xmm0
0x1459308e6: f30f58c8 addss xmm1, xmm0
0x1459308ea: 0f57c0 xorps xmm0, xmm0
0x1459308ed: f30f51c1 sqrtss xmm0, xmm1
0x1459308f1: f30f100dd7a85700 movss xmm1, dword ptr [rip + 0x57a8d7]
0x1459308f9: 0f2ec8 ucomiss xmm1, xmm0
0x1459308fc: 7626 jbe 0x145930924
0x1459308fe: 440f28e2 movaps xmm12, xmm2
0x145930902: 48837c0818ff cmp qword ptr [rax + rcx + 0x18], -1
0x145930908: 0f95c2 setne dl
0x14593090b: 00d2 add dl, dl
0x14593090d: 0a9408d0010000 or dl, byte ptr [rax + rcx + 0x1d0]
0x145930914: 889500010000 mov byte ptr [rbp + 0x100], dl
0x14593091a: b001 mov al, 1
0x14593091c: 898508010000 mov dword ptr [rbp + 0x108], eax
0x145930922: eb0e jmp 0x145930932
0x145930924: 440f28e2 movaps xmm12, xmm2
0x145930928: c7850801000000000000 mov dword ptr [rbp + 0x108], 0
0x145930932: 8b4518 mov eax, dword ptr [rbp + 0x18]
0x145930935: 8985e8000000 mov dword ptr [rbp + 0xe8], eax
0x14593093b: 488b4510 mov rax, qword ptr [rbp + 0x10]
0x14593093f: 488985e0000000 mov qword ptr [rbp + 0xe0], rax
0x145930946: 488d4d40 lea rcx, [rbp + 0x40]
0x14593094a: 4889f2 mov rdx, rsi
0x14593094d: 4c8d85e0000000 lea r8, [rbp + 0xe0]
0x145930954: f30f101dc4594d00 movss xmm3, dword ptr [rip + 0x4d59c4]
0x14593095c: e85fabffff call 0x14592b4c0
0x145930961: 488b4d48 mov rcx, qword ptr [rbp + 0x48]
0x145930965: 488b4550 mov rax, qword ptr [rbp + 0x50]
0x145930969: 4885c0 test rax, rax
0x14593096c: 0f84d7000000 je 0x145930a49
0x145930972: 488d04c1 lea rax, [rcx + rax*8]
0x145930976: f30f10864c0a0000 movss xmm0, dword ptr [rsi + 0xa4c]
0x14593097e: 488b9668050000 mov rdx, qword ptr [rsi + 0x568]
0x145930985: 4c698670050000d8010000 imul r8, qword ptr [rsi + 0x570], 0x1d8
0x145930990: 4989c9 mov r9, rcx
0x145930993: eb3e jmp 0x1459309d3
0x145930995: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1459309a0: f2420f104c12a8 movsd xmm1, qword ptr [rdx + r10 - 0x58]
0x1459309a7: 410f5cc8 subps xmm1, xmm8
0x1459309ab: 0f59c9 mulps xmm1, xmm1
0x1459309ae: f30f16d1 movshdup xmm2, xmm1
0x1459309b2: f30f58d1 addss xmm2, xmm1
0x1459309b6: 0f57c9 xorps xmm1, xmm1
0x1459309b9: f30f51ca sqrtss xmm1, xmm2
0x1459309bd: f30f10151bda4800 movss xmm2, dword ptr [rip + 0x48da1b]
0x1459309c5: 0f2ed1 ucomiss xmm2, xmm1
0x1459309c8: 0f877d020000 ja 0x145930c4b
0x1459309ce: 4939c1 cmp r9, rax
0x1459309d1: 7476 je 0x145930a49
0x1459309d3: 4d8b31 mov r14, qword ptr [r9]
0x1459309d6: 4983c108 add r9, 8
0x1459309da: 4531d2 xor r10d, r10d
0x1459309dd: 4989d3 mov r11, rdx
0x1459309e0: 4d39d0 cmp r8, r10
0x1459309e3: 74e9 je 0x1459309ce
0x1459309e5: 4981c2d8010000 add r10, 0x1d8
0x1459309ec: 4d39b3f0000000 cmp qword ptr [r11 + 0xf0], r14
0x1459309f3: 4d8d9bd8010000 lea r11, [r11 + 0x1d8]
0x1459309fa: 75e4 jne 0x1459309e0
0x1459309fc: f3420f104c12b8 movss xmm1, dword ptr [rdx + r10 - 0x48]
0x145930a03: 0f2ef9 ucomiss xmm7, xmm1
0x145930a06: 7398 jae 0x1459309a0
0x145930a08: 0f28d0 movaps xmm2, xmm0
0x145930a0b: f3420f5c5412b4 subss xmm2, dword ptr [rdx + r10 - 0x4c]
0x145930a12: f30f5ed1 divss xmm2, xmm1
0x145930a16: 0f57c9 xorps xmm1, xmm1
0x145930a19: f30f5fca maxss xmm1, xmm2
0x145930a1d: f30f10153bc84700 movss xmm2, dword ptr [rip + 0x47c83b]
0x145930a25: f30f5dd1 minss xmm2, xmm1
0x145930a29: f2420f105c129c movsd xmm3, qword ptr [rdx + r10 - 0x64]
0x145930a30: f2420f106412a8 movsd xmm4, qword ptr [rdx + r10 - 0x58]
0x145930a37: 0f5ce3 subps xmm4, xmm3
0x145930a3a: f30f12ca movsldup xmm1, xmm2
0x145930a3e: 0f59cc mulps xmm1, xmm4
0x145930a41: 0f58cb addps xmm1, xmm3
0x145930a44: e95effffff jmp 0x1459309a7
0x145930a49: 4531ed xor r13d, r13d
0x145930a4c: 488b5540 mov rdx, qword ptr [rbp + 0x40]
0x145930a50: 4885d2 test rdx, rdx
0x145930a53: 740f je 0x145930a64
0x145930a55: 48c1e203 shl rdx, 3
0x145930a59: 41b808000000 mov r8d, 8
0x145930a5f: e86c176dfa call 0x1400021d0
0x145930a64: b001 mov al, 1
0x145930a66: 4584ed test r13b, r13b
0x145930a69: 7459 je 0x145930ac4
0x145930a6b: 488b8e68050000 mov rcx, qword ptr [rsi + 0x568]
0x145930a72: 4c698670050000d8010000 imul r8, qword ptr [rsi + 0x570], 0x1d8
0x145930a7d: 31d2 xor edx, edx
0x145930a7f: 4989c9 mov r9, rcx
0x145930a82: 440fb69500010000 movzx r10d, byte ptr [rbp + 0x100]
0x145930a8a: 660f1f440000 nop word ptr [rax + rax]
0x145930a90: 4939d0 cmp r8, rdx
0x145930a93: 742f je 0x145930ac4
0x145930a95: 4881c2d8010000 add rdx, 0x1d8
0x145930a9c: 4d39b1f0000000 cmp qword ptr [r9 + 0xf0], r14
0x145930aa3: 4d8d89d8010000 lea r9, [r9 + 0x1d8]
0x145930aaa: 75e4 jne 0x145930a90
0x145930aac: 4883bc1140feffffff cmp qword ptr [rcx + rdx - 0x1c0], -1
0x145930ab5: 0f95c0 setne al
0x145930ab8: 00c0 add al, al
0x145930aba: 0a4411f8 or al, byte ptr [rcx + rdx - 8]
0x145930abe: 4138c2 cmp r10b, al
0x145930ac1: 0f93c0 setae al
0x145930ac4: 41807f3900 cmp byte ptr [r15 + 0x39], 0
0x145930ac9: 7413 je 0x145930ade
0x145930acb: 4889f1 mov rcx, rsi
0x145930ace: 4889da mov rdx, rbx
0x145930ad1: e80a7c0200 call 0x1459586e0
0x145930ad6: 4989c5 mov r13, rax
0x145930ad9: 4989d6 mov r14, rdx
0x145930adc: eb08 jmp 0x145930ae6
0x145930ade: 848508010000 test byte ptr [rbp + 0x108], al
0x145930ae4: 750d jne 0x145930af3
0x145930ae6: 4d89f4 mov r12, r14
0x145930ae9: 41f6c501 test r13b, 1
0x145930aed: 0f84e8000000 je 0x145930bdb
0x145930af3: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
0x145930afa: 4839d3 cmp rbx, rdx
0x145930afd: 0f8312290000 jae 0x145933415
0x145930b03: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
0x145930b0a: 4c89643828 mov qword ptr [rax + rdi + 0x28], r12
0x145930b0f: 488b8668050000 mov rax, qword ptr [rsi + 0x568]
0x145930b16: 48699670050000d8010000 imul rdx, qword ptr [rsi + 0x570], 0x1d8
0x145930b21: 31c9 xor ecx, ecx
0x145930b23: 4989c0 mov r8, rax
0x145930b26: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145930b30: 4839ca cmp rdx, rcx
0x145930b33: 0f8409010000 je 0x145930c42
0x145930b39: 4881c1d8010000 add rcx, 0x1d8
0x145930b40: 4d39a0f0000000 cmp qword ptr [r8 + 0xf0], r12
0x145930b47: 4d8d80d8010000 lea r8, [r8 + 0x1d8]
0x145930b4e: 75e0 jne 0x145930b30
0x145930b50: f30f104408b8 movss xmm0, dword ptr [rax + rcx - 0x48]
0x145930b56: 0f2ef8 ucomiss xmm7, xmm0
0x145930b59: 0f8304010000 jae 0x145930c63
0x145930b5f: f30f104c08b4 movss xmm1, dword ptr [rax + rcx - 0x4c]
0x145930b65: f30f12c9 movsldup xmm1, xmm1
0x145930b69: 0f2855c0 movaps xmm2, xmmword ptr [rbp - 0x40]
0x145930b6d: 0f5cd1 subps xmm2, xmm1
0x145930b70: f30f12c0 movsldup xmm0, xmm0
0x145930b74: 0f5ed0 divps xmm2, xmm0
0x145930b77: 0f57c0 xorps xmm0, xmm0
0x145930b7a: 0f5fc2 maxps xmm0, xmm2
0x145930b7d: 0f280d8cc94700 movaps xmm1, xmmword ptr [rip + 0x47c98c]
0x145930b84: 0fc2c801 cmpltps xmm1, xmm0
0x145930b88: 0f14c9 unpcklps xmm1, xmm1
0x145930b8b: 660f50d1 movmskpd edx, xmm1
0x145930b8f: f30f100dc9c64700 movss xmm1, dword ptr [rip + 0x47c6c9]
0x145930b97: f6c202 test dl, 2
0x145930b9a: 7504 jne 0x145930ba0
0x145930b9c: f30f16c8 movshdup xmm1, xmm0
0x145930ba0: f30f1015b8c64700 movss xmm2, dword ptr [rip + 0x47c6b8]
0x145930ba8: f6c201 test dl, 1
0x145930bab: 7503 jne 0x145930bb0
0x145930bad: 0f28d0 movaps xmm2, xmm0
0x145930bb0: f20f105c089c movsd xmm3, qword ptr [rax + rcx - 0x64]
0x145930bb6: f20f106408a8 movsd xmm4, qword ptr [rax + rcx - 0x58]
0x145930bbc: 0f5ce3 subps xmm4, xmm3
0x145930bbf: f30f12c1 movsldup xmm0, xmm1
0x145930bc3: 0f59c4 mulps xmm0, xmm4
0x145930bc6: 0f58c3 addps xmm0, xmm3
0x145930bc9: f3440f12e2 movsldup xmm12, xmm2
0x145930bce: 440f59e4 mulps xmm12, xmm4
0x145930bd2: 440f58e3 addps xmm12, xmm3
0x145930bd6: e993000000 jmp 0x145930c6e
0x145930bdb: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
0x145930be2: 4839d3 cmp rbx, rdx
0x145930be5: 0f835d280000 jae 0x145933448
0x145930beb: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
0x145930bf2: 48c744382800000000 mov qword ptr [rax + rdi + 0x28], 0
0x145930bfb: 450f5cd4 subps xmm10, xmm12
0x145930bff: 450f59d2 mulps xmm10, xmm10
0x145930c03: f3410f16c2 movshdup xmm0, xmm10
0x145930c08: f3410f58c2 addss xmm0, xmm10
0x145930c0d: f30f51c0 sqrtss xmm0, xmm0
0x145930c11: 0f2e051c5f4800 ucomiss xmm0, dword ptr [rip + 0x485f1c]
0x145930c18: 4c8d7b01 lea r15, [rbx + 1]
0x145930c1c: 0f8627f8ffff jbe 0x145930449
0x145930c22: 410f28d4 movaps xmm2, xmm12
0x145930c26: f3410f16dc movshdup xmm3, xmm12
0x145930c2b: f3440f117c2420 movss dword ptr [rsp + 0x20], xmm15
0x145930c32: 4889f1 mov rcx, rsi
0x145930c35: 4889da mov rdx, rbx
0x145930c38: e8b38f0000 call 0x145939bf0
0x145930c3d: e907f8ffff jmp 0x145930449
0x145930c42: 4c8b7d30 mov r15, qword ptr [rbp + 0x30]
0x145930c46: e9fef7ffff jmp 0x145930449
0x145930c4b: 41bd01000000 mov r13d, 1
0x145930c51: 488b5540 mov rdx, qword ptr [rbp + 0x40]
0x145930c55: 4885d2 test rdx, rdx
0x145930c58: 0f85f7fdffff jne 0x145930a55
0x145930c5e: e901feffff jmp 0x145930a64
0x145930c63: f2440f106408a8 movsd xmm12, qword ptr [rax + rcx - 0x58]
0x145930c6a: 410f28c4 movaps xmm0, xmm12
0x145930c6e: 410f28ca movaps xmm1, xmm10
0x145930c72: 0f5cc8 subps xmm1, xmm0
0x145930c75: 0f59c9 mulps xmm1, xmm1
0x145930c78: f30f16c1 movshdup xmm0, xmm1
0x145930c7c: f30f58c1 addss xmm0, xmm1
0x145930c80: f30f51c0 sqrtss xmm0, xmm0
0x145930c84: f30f100d88ac7a00 movss xmm1, dword ptr [rip + 0x7aac88]
0x145930c8c: 0f2ec8 ucomiss xmm1, xmm0
0x145930c8f: 0f8236210000 jb 0x145932dcb
0x145930c95: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
0x145930c9c: 4839d3 cmp rbx, rdx
0x145930c9f: 0f83c5270000 jae 0x14593346a
0x145930ca5: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
0x145930cac: 440f2e4c3860 ucomiss xmm9, dword ptr [rax + rdi + 0x60]
0x145930cb2: 0f8213210000 jb 0x145932dcb
0x145930cb8: 4889f1 mov rcx, rsi
0x145930cbb: 4889da mov rdx, rbx
0x145930cbe: e8ed8b0200 call 0x1459598b0
0x145930cc3: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
0x145930cca: 4839d3 cmp rbx, rdx
0x145930ccd: 0f83ca270000 jae 0x14593349d
0x145930cd3: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
0x145930cda: f3410f58c1 addss xmm0, xmm9
0x145930cdf: f30f11443860 movss dword ptr [rax + rdi + 0x60], xmm0
0x145930ce5: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
0x145930cec: 4839d3 cmp rbx, rdx
0x145930cef: 0f83b9270000 jae 0x1459334ae
0x145930cf5: 4c8baed0000000 mov r13, qword ptr [rsi + 0xd0]
0x145930cfc: 498b443d18 mov rax, qword ptr [r13 + rdi + 0x18]
0x145930d01: 4901fd add r13, rdi
0x145930d04: 48898508010000 mov qword ptr [rbp + 0x108], rax
0x145930d0b: 0fb64039 movzx eax, byte ptr [rax + 0x39]
0x145930d0f: 8d48fe lea ecx, [rax - 2]
0x145930d12: 83f902 cmp ecx, 2
0x145930d15: 0f8254080000 jb 0x14593156f
0x145930d1b: 85c0 test eax, eax
0x145930d1d: 0f8473150000 je 0x145932296
0x145930d23: 83f805 cmp eax, 5
0x145930d26: 0f854e160000 jne 0x14593237a
0x145930d2c: 48c78500010000feffffff mov qword ptr [rbp + 0x100], 0xfffffffffffffffe
0x145930d37: e93f080000 jmp 0x14593157b

; doomguard-learned-power-read: 0x145930d3c..0x145930e40 (end exclusive)
0x145930d3c: 80787c00 cmp byte ptr [rax + 0x7c], 0
0x145930d40: c6407c00 mov byte ptr [rax + 0x7c], 0
0x145930d44: f3440f10154ba34800 movss xmm10, dword ptr [rip + 0x48a34b]
0x145930d4d: 4c8d0d5c512c01 lea r9, [rip + 0x12c515c]
0x145930d54: 7509 jne 0x145930d5f
0x145930d56: f3440f101501c54700 movss xmm10, dword ptr [rip + 0x47c501]
0x145930d5f: 488b8e30030000 mov rcx, qword ptr [rsi + 0x330]
0x145930d66: 488b8638030000 mov rax, qword ptr [rsi + 0x338]
0x145930d6d: 488d15a6822d01 lea rdx, [rip + 0x12d82a6]
0x145930d74: 488995e0000000 mov qword ptr [rbp + 0xe0], rdx
0x145930d7b: 48c785e80000000b000000 mov qword ptr [rbp + 0xe8], 0xb
0x145930d86: 4531f6 xor r14d, r14d
0x145930d89: eb16 jmp 0x145930da1
0x145930d8b: 0f1f440000 nop dword ptr [rax + rax]
0x145930d90: 4983c678 add r14, 0x78
0x145930d94: 4981fef8340000 cmp r14, 0x34f8
0x145930d9b: 0f8457250000 je 0x1459332f8
0x145930da1: 4b837c0e080b cmp qword ptr [r14 + r9 + 8], 0xb
0x145930da7: 75e7 jne 0x145930d90
0x145930da9: 4b8b140e mov rdx, qword ptr [r14 + r9]
0x145930dad: 4c8b02 mov r8, qword ptr [rdx]
0x145930db0: 49ba736861646f775f62 movabs r10, 0x625f776f64616873
0x145930dba: 4d31d0 xor r8, r10
0x145930dbd: 488b5203 mov rdx, qword ptr [rdx + 3]
0x145930dc1: 49ba646f775f626f6c74 movabs r10, 0x746c6f625f776f64
0x145930dcb: 4c31d2 xor rdx, r10
0x145930dce: 4c09c2 or rdx, r8
0x145930dd1: 75bd jne 0x145930d90
0x145930dd3: 4d01ce add r14, r9
0x145930dd6: 4885c0 test rax, rax
0x145930dd9: f30f11752c movss dword ptr [rbp + 0x2c], xmm6
0x145930dde: 0f8419060000 je 0x1459313fd
0x145930de4: 486bd058 imul rdx, rax, 0x58
0x145930de8: 4531c0 xor r8d, r8d
0x145930deb: eb10 jmp 0x145930dfd
0x145930ded: 0f1f00 nop dword ptr [rax]
0x145930df0: 4983c058 add r8, 0x58
0x145930df4: 4c39c2 cmp rdx, r8
0x145930df7: 0f84e3030000 je 0x1459311e0
0x145930dfd: 4e8b0c01 mov r9, qword ptr [rcx + r8]
0x145930e01: 498379080b cmp qword ptr [r9 + 8], 0xb
0x145930e06: 75e8 jne 0x145930df0
0x145930e08: 4d8b11 mov r10, qword ptr [r9]
0x145930e0b: 4d8b1a mov r11, qword ptr [r10]
0x145930e0e: 49bf736861646f775f62 movabs r15, 0x625f776f64616873
0x145930e18: 4d31fb xor r11, r15
0x145930e1b: 4d8b5203 mov r10, qword ptr [r10 + 3]
0x145930e1f: 49bf646f775f626f6c74 movabs r15, 0x746c6f625f776f64
0x145930e29: 4d31fa xor r10, r15
0x145930e2c: 4d09da or r10, r11
0x145930e2f: 75bf jne 0x145930df0
0x145930e31: f3460f10640110 movss xmm12, dword ptr [rcx + r8 + 0x10]
0x145930e38: 4d89ce mov r14, r9
0x145930e3b: e982090000 jmp 0x1459317c2

; pit-target-count: 0x145930f0f..0x145930f36 (end exclusive)
0x145930f0f: 418b4954 mov ecx, dword ptr [r9 + 0x54]
0x145930f13: 4101ce add r14d, ecx
0x145930f16: 8b96b4040000 mov edx, dword ptr [rsi + 0x4b4]
0x145930f1c: 458d0416 lea r8d, [r14 + rdx]
0x145930f20: 4183f801 cmp r8d, 1
0x145930f24: 4111d6 adc r14d, edx
0x145930f27: 4183c602 add r14d, 2
0x145930f2b: 85c9 test ecx, ecx
0x145930f2d: b903000000 mov ecx, 3
0x145930f32: 440f44f1 cmove r14d, ecx

; pit-tail-shuffle-and-list: 0x1459310b8..0x1459311af (end exclusive)
0x1459310b8: 4889f2 mov rdx, rsi
0x1459310bb: 4c8d85a8000000 lea r8, [rbp + 0xa8]
0x1459310c2: f30f101daac34700 movss xmm3, dword ptr [rip + 0x47c3aa]
0x1459310ca: e8f1a3ffff call 0x14592b4c0
0x1459310cf: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
0x1459310d6: 4885d2 test rdx, rdx
0x1459310d9: 0f842c030000 je 0x14593140b
0x1459310df: 488b8de8000000 mov rcx, qword ptr [rbp + 0xe8]
0x1459310e6: 48ffca dec rdx
0x1459310e9: 4883c108 add rcx, 8
0x1459310ed: 4c8d86b8090000 lea r8, [rsi + 0x9b8]
0x1459310f4: e8e79b0b00 call 0x1459eace0
0x1459310f9: 90 nop
0x1459310fa: 4883bdf000000006 cmp qword ptr [rbp + 0xf0], 6
0x145931102: 720b jb 0x14593110f
0x145931104: 48c785f000000006000000 mov qword ptr [rbp + 0xf0], 6
0x14593110f: 48c7454800000000 mov qword ptr [rbp + 0x48], 0
0x145931117: 4c897550 mov qword ptr [rbp + 0x50], r14
0x14593111b: 488d85e0000000 lea rax, [rbp + 0xe0]
0x145931122: 48894540 mov qword ptr [rbp + 0x40], rax
0x145931126: 488d8dc0000000 lea rcx, [rbp + 0xc0]
0x14593112d: 488d5540 lea rdx, [rbp + 0x40]
0x145931131: e88a950a00 call 0x1459da6c0
0x145931136: 90 nop
0x145931137: 4c8bb5d0000000 mov r14, qword ptr [rbp + 0xd0]
0x14593113e: 488b95e0000000 mov rdx, qword ptr [rbp + 0xe0]
0x145931145: 4885d2 test rdx, rdx
0x145931148: 7416 je 0x145931160
0x14593114a: 488b8de8000000 mov rcx, qword ptr [rbp + 0xe8]
0x145931151: 48c1e203 shl rdx, 3
0x145931155: 41b808000000 mov r8d, 8
0x14593115b: e870106dfa call 0x1400021d0
0x145931160: 4d85f6 test r14, r14
0x145931163: 0f849a050000 je 0x145931703
0x145931169: 4c8b85c8000000 mov r8, qword ptr [rbp + 0xc8]
0x145931170: 488d0591a72d01 lea rax, [rip + 0x12da791]
0x145931177: 48894540 mov qword ptr [rbp + 0x40], rax
0x14593117b: 48c7454809000000 mov qword ptr [rbp + 0x48], 9
0x145931183: 48c7455000000000 mov qword ptr [rbp + 0x50], 0
0x14593118b: 66c745680000 mov word ptr [rbp + 0x68], 0
0x145931191: 488d4540 lea rax, [rbp + 0x40]
0x145931195: 4889442420 mov qword ptr [rsp + 0x20], rax
0x14593119a: 4889f1 mov rcx, rsi
0x14593119d: 4889da mov rdx, rbx
0x1459311a0: 4c898508010000 mov qword ptr [rbp + 0x108], r8
0x1459311a7: 4d89f1 mov r9, r14
0x1459311aa: e8c1a70200 call 0x14595b970

; doomguard-direct-power-modifiers-and-focus: 0x145931729..0x14593198a (end exclusive)
0x145931729: 4989c1 mov r9, rax
0x14593172c: 49b8fcffffffffffff01 movabs r8, 0x1fffffffffffffc
0x145931736: 4d21c1 and r9, r8
0x145931739: 4c8d9118010000 lea r10, [rcx + 0x118]
0x145931740: 4531c0 xor r8d, r8d
0x145931743: f3440f102594bd4700 movss xmm12, dword ptr [rip + 0x47bd94]
0x14593174c: 0f1f4000 nop dword ptr [rax]
0x145931750: f3450f58a2f8feffff addss xmm12, dword ptr [r10 - 0x108]
0x145931759: f3450f58a250ffffff addss xmm12, dword ptr [r10 - 0xb0]
0x145931762: f3450f5862a8 addss xmm12, dword ptr [r10 - 0x58]
0x145931768: f3450f5822 addss xmm12, dword ptr [r10]
0x14593176d: 4983c004 add r8, 4
0x145931771: 4981c260010000 add r10, 0x160
0x145931778: 4d39c1 cmp r9, r8
0x14593177b: 75d3 jne 0x145931750
0x14593177d: 4885d2 test rdx, rdx
0x145931780: 742d je 0x1459317af
0x145931782: 4d6bc058 imul r8, r8, 0x58
0x145931786: 4c01c1 add rcx, r8
0x145931789: 4883c110 add rcx, 0x10
0x14593178d: 486bd258 imul rdx, rdx, 0x58
0x145931791: 4531c0 xor r8d, r8d
0x145931794: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1459317a0: f3460f582401 addss xmm12, dword ptr [rcx + r8]
0x1459317a6: 4983c058 add r8, 0x58
0x1459317aa: 4c39c2 cmp rdx, r8
0x1459317ad: 75f1 jne 0x1459317a0
0x1459317af: f3480f2ac0 cvtsi2ss xmm0, rax
0x1459317b4: f3440f5ee0 divss xmm12, xmm0
0x1459317b9: f3440f5f259eba4700 maxss xmm12, dword ptr [rip + 0x47ba9e]
0x1459317c2: 410f28f6 movaps xmm6, xmm14
0x1459317c6: 4c8d7d40 lea r15, [rbp + 0x40]
0x1459317ca: 4c89f9 mov rcx, r15
0x1459317cd: 488d96c8010000 lea rdx, [rsi + 0x1c8]
0x1459317d4: e8a760f6ff call 0x145897880
0x1459317d9: 90 nop
0x1459317da: 488d8de0000000 lea rcx, [rbp + 0xe0]
0x1459317e1: 4c89fa mov rdx, r15
0x1459317e4: 4d89f0 mov r8, r14
0x1459317e7: e8c462f6ff call 0x145897ab0
0x1459317ec: 90 nop
0x1459317ed: f3440f10ade0000000 movss xmm13, dword ptr [rbp + 0xe0]
0x1459317f6: f3440f10b5f4000000 movss xmm14, dword ptr [rbp + 0xf4]
0x1459317ff: 4c89f9 mov rcx, r15
0x145931802: e8f94af6ff call 0x145896300
0x145931807: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
0x14593180e: 4839d3 cmp rbx, rdx
0x145931811: 0f83641c0000 jae 0x14593347b
0x145931817: 410fb64675 movzx eax, byte ptr [r14 + 0x75]
0x14593181c: 04fe add al, 0xfe
0x14593181e: f30f10053aba4700 movss xmm0, dword ptr [rip + 0x47ba3a]
0x145931826: 3c06 cmp al, 6
0x145931828: 770f ja 0x145931839
0x14593182a: 0fb6c0 movzx eax, al
0x14593182d: 488d0d50a72d01 lea rcx, [rip + 0x12da750]
0x145931834: f30f100481 movss xmm0, dword ptr [rcx + rax*4]
0x145931839: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
0x145931840: 488b4c3818 mov rcx, qword ptr [rax + rdi + 0x18]
0x145931845: 4801f8 add rax, rdi
0x145931848: f3410f105644 movss xmm2, dword ptr [r14 + 0x44]
0x14593184e: 0f28ca movaps xmm1, xmm2
0x145931851: f30f590d3bfb4700 mulss xmm1, dword ptr [rip + 0x47fb3b]
0x145931859: 4c8b8670050000 mov r8, qword ptr [rsi + 0x570]
0x145931860: 4d85c0 test r8, r8
0x145931863: f3440f117d28 movss dword ptr [rbp + 0x28], xmm15
0x145931869: 0f840a010000 je 0x145931979
0x14593186f: 488b9668050000 mov rdx, qword ptr [rsi + 0x568]
0x145931876: 4d69c0d8010000 imul r8, r8, 0x1d8
0x14593187d: 4531c9 xor r9d, r9d
0x145931880: eb1e jmp 0x1459318a0
0x145931882: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145931890: 4981c1d8010000 add r9, 0x1d8
0x145931897: 4d39c8 cmp r8, r9
0x14593189a: 0f84d9000000 je 0x145931979
0x1459318a0: 4e39a40af0000000 cmp qword ptr [rdx + r9 + 0xf0], r12
0x1459318a8: 75e6 jne 0x145931890
0x1459318aa: 4280bc0ab000000000 cmp byte ptr [rdx + r9 + 0xb0], 0
0x1459318b3: 75db jne 0x145931890
0x1459318b5: 4a837c0a18ff cmp qword ptr [rdx + r9 + 0x18], -1
0x1459318bb: 750b jne 0x1459318c8
0x1459318bd: 4280bc0ad001000000 cmp byte ptr [rdx + r9 + 0x1d0], 0
0x1459318c6: 74c8 je 0x145931890
0x1459318c8: 4c8b4030 mov r8, qword ptr [rax + 0x30]
0x1459318cc: 8b5038 mov edx, dword ptr [rax + 0x38]
0x1459318cf: 450f57ff xorps xmm15, xmm15
0x1459318d3: 4d39e0 cmp r8, r12
0x1459318d6: 0f8581000000 jne 0x14593195d
0x1459318dc: 4c8b9630080000 mov r10, qword ptr [rsi + 0x830]
0x1459318e3: 41b903000000 mov r9d, 3
0x1459318e9: 4d85d2 test r10, r10
0x1459318ec: 7456 je 0x145931944
0x1459318ee: 4c8b9e28080000 mov r11, qword ptr [rsi + 0x828]
0x1459318f5: 49c1e206 shl r10, 6
0x1459318f9: 4531f6 xor r14d, r14d
0x1459318fc: eb09 jmp 0x145931907
0x1459318fe: 4983c640 add r14, 0x40
0x145931902: 4d39f2 cmp r10, r14
0x145931905: 743d je 0x145931944
0x145931907: 43803c3321 cmp byte ptr [r11 + r14], 0x21
0x14593190c: 75f0 jne 0x1459318fe
0x14593190e: 4f8b7c3310 mov r15, qword ptr [r11 + r14 + 0x10]
0x145931913: 41807f3907 cmp byte ptr [r15 + 0x39], 7
0x145931918: 75e4 jne 0x1459318fe
0x14593191a: 470fb64c3301 movzx r9d, byte ptr [r11 + r14 + 1]
0x145931920: 4589ca mov r10d, r9d
0x145931923: 4180f903 cmp r9b, 3
0x145931927: 41bb03000000 mov r11d, 3
0x14593192d: 450f43cb cmovae r9d, r11d
0x145931931: 4180c102 add r9b, 2
0x145931935: 4584d2 test r10b, r10b
0x145931938: 450fb6c9 movzx r9d, r9b
0x14593193c: 450f44cb cmove r9d, r11d
0x145931940: 450fb6c9 movzx r9d, r9b
0x145931944: 4139d1 cmp r9d, edx
0x145931947: 440f43ca cmovae r9d, edx
0x14593194b: 450f57ff xorps xmm15, xmm15
0x14593194f: f3450f2af9 cvtsi2ss xmm15, r9d
0x145931954: f3440f593de3514800 mulss xmm15, dword ptr [rip + 0x4851e3]
0x14593195d: 4c8d4830 lea r9, [rax + 0x30]
0x145931961: 4883c038 add rax, 0x38
0x145931965: ffc2 inc edx
0x145931967: 4d39e0 cmp r8, r12
0x14593196a: 41b801000000 mov r8d, 1
0x145931970: 410f45d0 cmovne edx, r8d
0x145931974: 4d89e0 mov r8, r12
0x145931977: eb11 jmp 0x14593198a
0x145931979: 4c8d4830 lea r9, [rax + 0x30]
0x14593197d: 4883c038 add rax, 0x38
0x145931981: 450f57ff xorps xmm15, xmm15
0x145931985: 31d2 xor edx, edx
0x145931987: 4531c0 xor r8d, r8d

; doomguard-volley-capture-and-echo: 0x145931a6f..0x14593212e (end exclusive)
0x145931a6f: f30f10752c movss xmm6, dword ptr [rbp + 0x2c]
0x145931a74: e887076dfa call 0x140002200
0x145931a79: b940000000 mov ecx, 0x40
0x145931a7e: ba08000000 mov edx, 8
0x145931a83: e838076dfa call 0x1400021c0
0x145931a88: 4885c0 test rax, rax
0x145931a8b: 0f84d4180000 je 0x145933365
0x145931a91: f3450f59d5 mulss xmm10, xmm13
0x145931a96: 450f28e7 movaps xmm12, xmm15
0x145931a9a: f3440f5825bdb74700 addss xmm12, dword ptr [rip + 0x47b7bd]
0x145931aa3: f3450f59e2 mulss xmm12, xmm10
0x145931aa8: 4c8920 mov qword ptr [rax], r12
0x145931aab: f3440f116008 movss dword ptr [rax + 8], xmm12
0x145931ab1: 488d0d749d2d01 lea rcx, [rip + 0x12d9d74]
0x145931ab8: 48894810 mov qword ptr [rax + 0x10], rcx
0x145931abc: 48c740180b000000 mov qword ptr [rax + 0x18], 0xb
0x145931ac4: 4c897020 mov qword ptr [rax + 0x20], r14
0x145931ac8: 48c740280c000000 mov qword ptr [rax + 0x28], 0xc
0x145931ad0: f3440f117830 movss dword ptr [rax + 0x30], xmm15
0x145931ad6: 66c740380101 mov word ptr [rax + 0x38], 0x101
0x145931adc: 48c785c000000001000000 mov qword ptr [rbp + 0xc0], 1
0x145931ae7: 488985c8000000 mov qword ptr [rbp + 0xc8], rax
0x145931aee: 48c785d000000001000000 mov qword ptr [rbp + 0xd0], 1
0x145931af9: 488d4d40 lea rcx, [rbp + 0x40]
0x145931afd: 4889f2 mov rdx, rsi
0x145931b00: 4c8d45e8 lea r8, [rbp - 0x18]
0x145931b04: f30f101d68b94700 movss xmm3, dword ptr [rip + 0x47b968]
0x145931b0c: e8af99ffff call 0x14592b4c0
0x145931b11: 90 nop
0x145931b12: f3440f107d28 movss xmm15, dword ptr [rbp + 0x28]
0x145931b18: 488b5540 mov rdx, qword ptr [rbp + 0x40]
0x145931b1c: 488b4d48 mov rcx, qword ptr [rbp + 0x48]
0x145931b20: 488b4550 mov rax, qword ptr [rbp + 0x50]
0x145931b24: 48c1e003 shl rax, 3
0x145931b28: 4531c0 xor r8d, r8d
0x145931b2b: 0f1f440000 nop dword ptr [rax + rax]
0x145931b30: 4c39c0 cmp rax, r8
0x145931b33: 0f848e000000 je 0x145931bc7
0x145931b39: 4e8b3401 mov r14, qword ptr [rcx + r8]
0x145931b3d: 4983c008 add r8, 8
0x145931b41: 4d39e6 cmp r14, r12
0x145931b44: 74ea je 0x145931b30
0x145931b46: 48898d00010000 mov qword ptr [rbp + 0x100], rcx
0x145931b4d: 48899508010000 mov qword ptr [rbp + 0x108], rdx
0x145931b54: 4c8bbdd0000000 mov r15, qword ptr [rbp + 0xd0]
0x145931b5b: 4c3bbdc0000000 cmp r15, qword ptr [rbp + 0xc0]
0x145931b62: 750d jne 0x145931b71
0x145931b64: 488d8dc0000000 lea rcx, [rbp + 0xc0]
0x145931b6b: e8504a2e00 call 0x145c165c0
0x145931b70: 90 nop
0x145931b71: 488b85c8000000 mov rax, qword ptr [rbp + 0xc8]
0x145931b78: 4c89f9 mov rcx, r15
0x145931b7b: 48c1e106 shl rcx, 6
0x145931b7f: 4c893408 mov qword ptr [rax + rcx], r14
0x145931b83: f3440f11540808 movss dword ptr [rax + rcx + 8], xmm10
0x145931b8a: 488d159b9c2d01 lea rdx, [rip + 0x12d9c9b]
0x145931b91: 4889540810 mov qword ptr [rax + rcx + 0x10], rdx
0x145931b96: 48c74408180b000000 mov qword ptr [rax + rcx + 0x18], 0xb
0x145931b9f: 48c744082000000000 mov qword ptr [rax + rcx + 0x20], 0
0x145931ba8: 66c74408380101 mov word ptr [rax + rcx + 0x38], 0x101
0x145931baf: 49ffc7 inc r15
0x145931bb2: 4c89bdd0000000 mov qword ptr [rbp + 0xd0], r15
0x145931bb9: 488b9508010000 mov rdx, qword ptr [rbp + 0x108]
0x145931bc0: 488b8d00010000 mov rcx, qword ptr [rbp + 0x100]
0x145931bc7: 4885d2 test rdx, rdx
0x145931bca: 7410 je 0x145931bdc
0x145931bcc: 48c1e203 shl rdx, 3
0x145931bd0: 41b808000000 mov r8d, 8
0x145931bd6: e8f5056dfa call 0x1400021d0
0x145931bdb: 90 nop
0x145931bdc: 488d4d40 lea rcx, [rbp + 0x40]
0x145931be0: 488d96c8010000 lea rdx, [rsi + 0x1c8]
0x145931be7: e8945cf6ff call 0x145897880
0x145931bec: 90 nop
0x145931bed: 488b4d78 mov rcx, qword ptr [rbp + 0x78]
0x145931bf1: 488b8580000000 mov rax, qword ptr [rbp + 0x80]
0x145931bf8: 4885c0 test rax, rax
0x145931bfb: 448b7520 mov r14d, dword ptr [rbp + 0x20]
0x145931bff: 747e je 0x145931c7f
0x145931c01: 48c1e006 shl rax, 6
0x145931c05: 4801c8 add rax, rcx
0x145931c08: 4889ca mov rdx, rcx
0x145931c0b: f3440f10551c movss xmm10, dword ptr [rbp + 0x1c]
0x145931c11: eb16 jmp 0x145931c29
0x145931c13: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145931c20: 4883c240 add rdx, 0x40
0x145931c24: 4839c2 cmp rdx, rax
0x145931c27: 744a je 0x145931c73
0x145931c29: 803a06 cmp byte ptr [rdx], 6
0x145931c2c: 75f2 jne 0x145931c20
0x145931c2e: 837a1000 cmp dword ptr [rdx + 0x10], 0
0x145931c32: 75ec jne 0x145931c20
0x145931c34: 807a1801 cmp byte ptr [rdx + 0x18], 1
0x145931c38: 75e6 jne 0x145931c20
0x145931c3a: 48837a280b cmp qword ptr [rdx + 0x28], 0xb
0x145931c3f: 75df jne 0x145931c20
0x145931c41: 4c8b4220 mov r8, qword ptr [rdx + 0x20]
0x145931c45: 4d8b08 mov r9, qword ptr [r8]
0x145931c48: 4c330d842d9101 xor r9, qword ptr [rip + 0x1912d84]
0x145931c4f: 4d8b4003 mov r8, qword ptr [r8 + 3]
0x145931c53: 4c33057c2d9101 xor r8, qword ptr [rip + 0x1912d7c]
0x145931c5a: 4d09c8 or r8, r9
0x145931c5d: 75c1 jne 0x145931c20
0x145931c5f: f3440f105208 movss xmm10, dword ptr [rdx + 8]
0x145931c65: 448b7204 mov r14d, dword ptr [rdx + 4]
0x145931c69: b001 mov al, 1
0x145931c6b: 898508010000 mov dword ptr [rbp + 0x108], eax
0x145931c71: eb1c jmp 0x145931c8f
0x145931c73: c7850801000000000000 mov dword ptr [rbp + 0x108], 0
0x145931c7d: eb10 jmp 0x145931c8f
0x145931c7f: c7850801000000000000 mov dword ptr [rbp + 0x108], 0
0x145931c89: f3440f10551c movss xmm10, dword ptr [rbp + 0x1c]
0x145931c8f: 488b5570 mov rdx, qword ptr [rbp + 0x70]
0x145931c93: 4885d2 test rdx, rdx
0x145931c96: 740f je 0x145931ca7
0x145931c98: 48c1e206 shl rdx, 6
0x145931c9c: 41b808000000 mov r8d, 8
0x145931ca2: e829056dfa call 0x1400021d0
0x145931ca7: 488b5540 mov rdx, qword ptr [rbp + 0x40]
0x145931cab: 4885d2 test rdx, rdx
0x145931cae: 7413 je 0x145931cc3
0x145931cb0: 488b4d48 mov rcx, qword ptr [rbp + 0x48]
0x145931cb4: 48c1e203 shl rdx, 3
0x145931cb8: 41b804000000 mov r8d, 4
0x145931cbe: e80d056dfa call 0x1400021d0
0x145931cc3: 44897520 mov dword ptr [rbp + 0x20], r14d
0x145931cc7: 488b5558 mov rdx, qword ptr [rbp + 0x58]
0x145931ccb: 4885d2 test rdx, rdx
0x145931cce: 7413 je 0x145931ce3
0x145931cd0: 488b4d60 mov rcx, qword ptr [rbp + 0x60]
0x145931cd4: 48c1e205 shl rdx, 5
0x145931cd8: 41b808000000 mov r8d, 8
0x145931cde: e8ed046dfa call 0x1400021d0
0x145931ce3: 4c8bb590000000 mov r14, qword ptr [rbp + 0x90]
0x145931cea: 4c8bad98000000 mov r13, qword ptr [rbp + 0x98]
0x145931cf1: 4d85ed test r13, r13
0x145931cf4: 7432 je 0x145931d28
0x145931cf6: 4d8d7e08 lea r15, [r14 + 8]
0x145931cfa: eb0d jmp 0x145931d09
0x145931cfc: 0f1f4000 nop dword ptr [rax]
0x145931d00: 4983c728 add r15, 0x28
0x145931d04: 49ffcd dec r13
0x145931d07: 741f je 0x145931d28
0x145931d09: 498b57f8 mov rdx, qword ptr [r15 - 8]
0x145931d0d: 4883faff cmp rdx, -1
0x145931d11: 74ed je 0x145931d00
0x145931d13: 4885d2 test rdx, rdx
0x145931d16: 74e8 je 0x145931d00
0x145931d18: 498b0f mov rcx, qword ptr [r15]
0x145931d1b: 41b801000000 mov r8d, 1
0x145931d21: e8aa046dfa call 0x1400021d0
0x145931d26: ebd8 jmp 0x145931d00
0x145931d28: 488b8588000000 mov rax, qword ptr [rbp + 0x88]
0x145931d2f: 4885c0 test rax, rax
0x145931d32: 7416 je 0x145931d4a
0x145931d34: 48c1e003 shl rax, 3
0x145931d38: 488d1480 lea rdx, [rax + rax*4]
0x145931d3c: 41b808000000 mov r8d, 8
0x145931d42: 4c89f1 mov rcx, r14
0x145931d45: e886046dfa call 0x1400021d0
0x145931d4a: f30f10864c0a0000 movss xmm0, dword ptr [rsi + 0xa4c]
0x145931d52: 488b8668050000 mov rax, qword ptr [rsi + 0x568]
0x145931d59: 48699670050000d8010000 imul rdx, qword ptr [rsi + 0x570], 0x1d8
0x145931d64: 31c9 xor ecx, ecx
0x145931d66: 4989c0 mov r8, rax
0x145931d69: 4c8d7b01 lea r15, [rbx + 1]
0x145931d6d: 0f1f00 nop dword ptr [rax]
0x145931d70: 4839ca cmp rdx, rcx
0x145931d73: 0f8400020000 je 0x145931f79
0x145931d79: 4881c1d8010000 add rcx, 0x1d8
0x145931d80: 4d39a0f0000000 cmp qword ptr [r8 + 0xf0], r12
0x145931d87: 4d8d80d8010000 lea r8, [r8 + 0x1d8]
0x145931d8e: 75e0 jne 0x145931d70
0x145931d90: f30f104c08b8 movss xmm1, dword ptr [rax + rcx - 0x48]
0x145931d96: 0f2ef9 ucomiss xmm7, xmm1
0x145931d99: 7350 jae 0x145931deb
0x145931d9b: f30f5c4408b4 subss xmm0, dword ptr [rax + rcx - 0x4c]
0x145931da1: f30f5ec1 divss xmm0, xmm1
0x145931da5: 0f57c9 xorps xmm1, xmm1
0x145931da8: f30f5fc8 maxss xmm1, xmm0
0x145931dac: f30f1015acb44700 movss xmm2, dword ptr [rip + 0x47b4ac]
0x145931db4: f30f5dd1 minss xmm2, xmm1
0x145931db8: f20f104c089c movsd xmm1, qword ptr [rax + rcx - 0x64]
0x145931dbe: f20f105c08a8 movsd xmm3, qword ptr [rax + rcx - 0x58]
0x145931dc4: 0f5cd9 subps xmm3, xmm1
0x145931dc7: f30f12c2 movsldup xmm0, xmm2
0x145931dcb: 0f59c3 mulps xmm0, xmm3
0x145931dce: 0f58c1 addps xmm0, xmm1
0x145931dd1: f30f105c08a4 movss xmm3, dword ptr [rax + rcx - 0x5c]
0x145931dd7: f30f104c08b0 movss xmm1, dword ptr [rax + rcx - 0x50]
0x145931ddd: f30f5ccb subss xmm1, xmm3
0x145931de1: f30f59ca mulss xmm1, xmm2
0x145931de5: f30f58cb addss xmm1, xmm3
0x145931de9: eb0c jmp 0x145931df7
0x145931deb: f20f104408a8 movsd xmm0, qword ptr [rax + rcx - 0x58]
0x145931df1: f30f104c08b0 movss xmm1, dword ptr [rax + rcx - 0x50]
0x145931df7: 8b8508010000 mov eax, dword ptr [rbp + 0x108]
0x145931dfd: 84c0 test al, al
0x145931dff: 0f8474010000 je 0x145931f79
0x145931e05: 0f1385a8000000 movlps qword ptr [rbp + 0xa8], xmm0
0x145931e0c: f30f118db0000000 movss dword ptr [rbp + 0xb0], xmm1
0x145931e14: 488b95c8000000 mov rdx, qword ptr [rbp + 0xc8]
0x145931e1b: 4c8b85d0000000 mov r8, qword ptr [rbp + 0xd0]
0x145931e22: 49c1e006 shl r8, 6
0x145931e26: 4901d0 add r8, rdx
0x145931e29: 488d8de0000000 lea rcx, [rbp + 0xe0]
0x145931e30: e82b990a00 call 0x1459db760
0x145931e35: 90 nop
0x145931e36: 488b8de8000000 mov rcx, qword ptr [rbp + 0xe8]
0x145931e3d: 488b85f0000000 mov rax, qword ptr [rbp + 0xf0]
0x145931e44: 4889442428 mov qword ptr [rsp + 0x28], rax
0x145931e49: 48894df8 mov qword ptr [rbp - 8], rcx
0x145931e4d: 48894c2420 mov qword ptr [rsp + 0x20], rcx
0x145931e52: 488d4d40 lea rcx, [rbp + 0x40]
0x145931e56: 4889f2 mov rdx, rsi
0x145931e59: 4c8d85a8000000 lea r8, [rbp + 0xa8]
0x145931e60: f30f101d58f64700 movss xmm3, dword ptr [rip + 0x47f658]
0x145931e68: e88394ffff call 0x14592b2f0
0x145931e6d: 90 nop
0x145931e6e: 488b4540 mov rax, qword ptr [rbp + 0x40]
0x145931e72: 48894500 mov qword ptr [rbp], rax
0x145931e76: 488b4548 mov rax, qword ptr [rbp + 0x48]
0x145931e7a: 48898508010000 mov qword ptr [rbp + 0x108], rax
0x145931e81: 837d2000 cmp dword ptr [rbp + 0x20], 0
0x145931e85: 0f84ac000000 je 0x145931f37
0x145931e8b: 488b4550 mov rax, qword ptr [rbp + 0x50]
0x145931e8f: 8b4d20 mov ecx, dword ptr [rbp + 0x20]
0x145931e92: f3450f59e2 mulss xmm12, xmm10
0x145931e97: 48c1e003 shl rax, 3
0x145931e9b: 48898500010000 mov qword ptr [rbp + 0x100], rax
0x145931ea2: 48c1e103 shl rcx, 3
0x145931ea6: 48894d38 mov qword ptr [rbp + 0x38], rcx
0x145931eaa: 4531ed xor r13d, r13d
0x145931ead: eb52 jmp 0x145931f01
0x145931eaf: 488b85c8000000 mov rax, qword ptr [rbp + 0xc8]
0x145931eb6: 4c89f9 mov rcx, r15
0x145931eb9: 48c1e106 shl rcx, 6
0x145931ebd: 4c893408 mov qword ptr [rax + rcx], r14
0x145931ec1: f3440f11640808 movss dword ptr [rax + rcx + 8], xmm12
0x145931ec8: 488d1581992d01 lea rdx, [rip + 0x12d9981]
0x145931ecf: 4889540810 mov qword ptr [rax + rcx + 0x10], rdx
0x145931ed4: 48c74408180d000000 mov qword ptr [rax + rcx + 0x18], 0xd
0x145931edd: 48c744082000000000 mov qword ptr [rax + rcx + 0x20], 0
0x145931ee6: 66c74408380001 mov word ptr [rax + rcx + 0x38], 0x100
0x145931eed: 49ffc7 inc r15
0x145931ef0: 4c89bdd0000000 mov qword ptr [rbp + 0xd0], r15
0x145931ef7: 4983c508 add r13, 8
0x145931efb: 4c396d38 cmp qword ptr [rbp + 0x38], r13
0x145931eff: 7436 je 0x145931f37
0x145931f01: 4c39ad00010000 cmp qword ptr [rbp + 0x100], r13
0x145931f08: 742d je 0x145931f37
0x145931f0a: 488b8508010000 mov rax, qword ptr [rbp + 0x108]
0x145931f11: 4e8b3428 mov r14, qword ptr [rax + r13]
0x145931f15: 4c8bbdd0000000 mov r15, qword ptr [rbp + 0xd0]
0x145931f1c: 4c3bbdc0000000 cmp r15, qword ptr [rbp + 0xc0]
0x145931f23: 758a jne 0x145931eaf
0x145931f25: 488d8dc0000000 lea rcx, [rbp + 0xc0]
0x145931f2c: e88f462e00 call 0x145c165c0
0x145931f31: 90 nop
0x145931f32: e978ffffff jmp 0x145931eaf
0x145931f37: 488b5500 mov rdx, qword ptr [rbp]
0x145931f3b: 4885d2 test rdx, rdx
0x145931f3e: 7416 je 0x145931f56
0x145931f40: 48c1e203 shl rdx, 3
0x145931f44: 41b808000000 mov r8d, 8
0x145931f4a: 488b8d08010000 mov rcx, qword ptr [rbp + 0x108]
0x145931f51: e87a026dfa call 0x1400021d0
0x145931f56: 488b95e0000000 mov rdx, qword ptr [rbp + 0xe0]
0x145931f5d: 4885d2 test rdx, rdx
0x145931f60: 4c8d7b01 lea r15, [rbx + 1]
0x145931f64: 7413 je 0x145931f79
0x145931f66: 48c1e203 shl rdx, 3
0x145931f6a: 41b808000000 mov r8d, 8
0x145931f70: 488b4df8 mov rcx, qword ptr [rbp - 8]
0x145931f74: e857026dfa call 0x1400021d0
0x145931f79: 488b85c0000000 mov rax, qword ptr [rbp + 0xc0]
0x145931f80: 48898508010000 mov qword ptr [rbp + 0x108], rax
0x145931f87: 4c8b8dc8000000 mov r9, qword ptr [rbp + 0xc8]
0x145931f8e: 4c8bb5d0000000 mov r14, qword ptr [rbp + 0xd0]
0x145931f95: c685fd00000001 mov byte ptr [rbp + 0xfd], 1
0x145931f9c: 4c89742420 mov qword ptr [rsp + 0x20], r14
0x145931fa1: 4889f1 mov rcx, rsi
0x145931fa4: 4889da mov rdx, rbx
0x145931fa7: 4d89e0 mov r8, r12
0x145931faa: 4c898d00010000 mov qword ptr [rbp + 0x100], r9
0x145931fb1: e8fa880200 call 0x14595a8b0
0x145931fb6: 90 nop
0x145931fb7: 488b9600080000 mov rdx, qword ptr [rsi + 0x800]
0x145931fbe: 4885d2 test rdx, rdx
0x145931fc1: f3440f11551c movss dword ptr [rbp + 0x1c], xmm10
0x145931fc7: 0f847a010000 je 0x145932147
0x145931fcd: 488b86f8070000 mov rax, qword ptr [rsi + 0x7f8]
0x145931fd4: 4883fa01 cmp rdx, 1
0x145931fd8: 750c jne 0x145931fe6
0x145931fda: 31c9 xor ecx, ecx
0x145931fdc: f30f1005fcb44700 movss xmm0, dword ptr [rip + 0x47b4fc]
0x145931fe4: eb4c jmp 0x145932032
0x145931fe6: 4989d0 mov r8, rdx
0x145931fe9: 4983e0fe and r8, 0xfffffffffffffffe
0x145931fed: 31c9 xor ecx, ecx
0x145931fef: f30f1005e9b44700 movss xmm0, dword ptr [rip + 0x47b4e9]
0x145931ff7: eb10 jmp 0x145932009
0x145931ff9: 0f1f8000000000 nop dword ptr [rax]
0x145932000: 4883c102 add rcx, 2
0x145932004: 4939c8 cmp r8, rcx
0x145932007: 7424 je 0x14593202d
0x145932009: 803cc81f cmp byte ptr [rax + rcx*8], 0x1f
0x14593200d: 7409 je 0x145932018
0x14593200f: 807cc8081f cmp byte ptr [rax + rcx*8 + 8], 0x1f
0x145932014: 75ea jne 0x145932000
0x145932016: eb0d jmp 0x145932025
0x145932018: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
0x14593201e: 807cc8081f cmp byte ptr [rax + rcx*8 + 8], 0x1f
0x145932023: 75db jne 0x145932000
0x145932025: f30f5844c80c addss xmm0, dword ptr [rax + rcx*8 + 0xc]
0x14593202b: ebd3 jmp 0x145932000
0x14593202d: f6c201 test dl, 1
0x145932030: 740c je 0x14593203e
0x145932032: 803cc81f cmp byte ptr [rax + rcx*8], 0x1f
0x145932036: 7506 jne 0x14593203e
0x145932038: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
0x14593203e: 0f2ec7 ucomiss xmm0, xmm7
0x145932041: 0f8600010000 jbe 0x145932147
0x145932047: 488b86d0090000 mov rax, qword ptr [rsi + 0x9d0]
0x14593204e: 488b8eb8090000 mov rcx, qword ptr [rsi + 0x9b8]
0x145932055: 488b96c0090000 mov rdx, qword ptr [rsi + 0x9c0]
0x14593205c: 4c8d0408 lea r8, [rax + rcx]
0x145932060: 49c1c017 rol r8, 0x17
0x145932064: 4901c8 add r8, rcx
0x145932067: 4989d1 mov r9, rdx
0x14593206a: 49c1e111 shl r9, 0x11
0x14593206e: 4c8b96c8090000 mov r10, qword ptr [rsi + 0x9c8]
0x145932075: 4931ca xor r10, rcx
0x145932078: 4831d0 xor rax, rdx
0x14593207b: 4c31d2 xor rdx, r10
0x14593207e: 488996c0090000 mov qword ptr [rsi + 0x9c0], rdx
0x145932085: 4831c1 xor rcx, rax
0x145932088: 48898eb8090000 mov qword ptr [rsi + 0x9b8], rcx
0x14593208f: 4d31ca xor r10, r9
0x145932092: 4c8996c8090000 mov qword ptr [rsi + 0x9c8], r10
0x145932099: 48c1c02d rol rax, 0x2d
0x14593209d: 49c1e828 shr r8, 0x28
0x1459320a1: 0f57c9 xorps xmm1, xmm1
0x1459320a4: f3410f2ac8 cvtsi2ss xmm1, r8d
0x1459320a9: 488986d0090000 mov qword ptr [rsi + 0x9d0], rax
0x1459320b0: f30f590d88095900 mulss xmm1, dword ptr [rip + 0x590988]
0x1459320b8: 0f2ec1 ucomiss xmm0, xmm1
0x1459320bb: 0f8686000000 jbe 0x145932147
0x1459320c1: 49c1e606 shl r14, 6
0x1459320c5: 488b8500010000 mov rax, qword ptr [rbp + 0x100]
0x1459320cc: 4901c6 add r14, rax
0x1459320cf: 48894540 mov qword ptr [rbp + 0x40], rax
0x1459320d3: 48894548 mov qword ptr [rbp + 0x48], rax
0x1459320d7: 488b8508010000 mov rax, qword ptr [rbp + 0x108]
0x1459320de: 48894550 mov qword ptr [rbp + 0x50], rax
0x1459320e2: 4c897558 mov qword ptr [rbp + 0x58], r14
0x1459320e6: c685fd00000000 mov byte ptr [rbp + 0xfd], 0
0x1459320ed: 488d8de0000000 lea rcx, [rbp + 0xe0]
0x1459320f4: 488d5540 lea rdx, [rbp + 0x40]
0x1459320f8: e883960b00 call 0x1459eb780
0x1459320fd: 90 nop
0x1459320fe: 4c8b8de8000000 mov r9, qword ptr [rbp + 0xe8]
0x145932105: 488b85f0000000 mov rax, qword ptr [rbp + 0xf0]
0x14593210c: 4889442420 mov qword ptr [rsp + 0x20], rax
0x145932111: 4889f1 mov rcx, rsi
0x145932114: 4889da mov rdx, rbx
0x145932117: 4d89e0 mov r8, r12
0x14593211a: 4c894d38 mov qword ptr [rbp + 0x38], r9
0x14593211e: e88d870200 call 0x14595a8b0
0x145932123: 90 nop
0x145932124: 488b95e0000000 mov rdx, qword ptr [rbp + 0xe0]
0x14593212b: 4885d2 test rdx, rdx

; pit-echo-tail: 0x1459326e2..0x145932811 (end exclusive)
0x1459326e2: 4989d0 mov r8, rdx
0x1459326e5: 4983e0fe and r8, 0xfffffffffffffffe
0x1459326e9: 31c9 xor ecx, ecx
0x1459326eb: f30f1005edad4700 movss xmm0, dword ptr [rip + 0x47aded]
0x1459326f3: eb09 jmp 0x1459326fe
0x1459326f5: 4883c102 add rcx, 2
0x1459326f9: 4939c8 cmp r8, rcx
0x1459326fc: 7424 je 0x145932722
0x1459326fe: 803cc81f cmp byte ptr [rax + rcx*8], 0x1f
0x145932702: 7409 je 0x14593270d
0x145932704: 807cc8081f cmp byte ptr [rax + rcx*8 + 8], 0x1f
0x145932709: 75ea jne 0x1459326f5
0x14593270b: eb0d jmp 0x14593271a
0x14593270d: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
0x145932713: 807cc8081f cmp byte ptr [rax + rcx*8 + 8], 0x1f
0x145932718: 75db jne 0x1459326f5
0x14593271a: f30f5844c80c addss xmm0, dword ptr [rax + rcx*8 + 0xc]
0x145932720: ebd3 jmp 0x1459326f5
0x145932722: f6c201 test dl, 1
0x145932725: 740c je 0x145932733
0x145932727: 803cc81f cmp byte ptr [rax + rcx*8], 0x1f
0x14593272b: 7506 jne 0x145932733
0x14593272d: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
0x145932733: 0f2ec7 ucomiss xmm0, xmm7
0x145932736: 0f86b3000000 jbe 0x1459327ef
0x14593273c: 488b86d0090000 mov rax, qword ptr [rsi + 0x9d0]
0x145932743: 488b8eb8090000 mov rcx, qword ptr [rsi + 0x9b8]
0x14593274a: 488b96c0090000 mov rdx, qword ptr [rsi + 0x9c0]
0x145932751: 4c8d0408 lea r8, [rax + rcx]
0x145932755: 49c1c017 rol r8, 0x17
0x145932759: 4901c8 add r8, rcx
0x14593275c: 4989d1 mov r9, rdx
0x14593275f: 49c1e111 shl r9, 0x11
0x145932763: 4c8b96c8090000 mov r10, qword ptr [rsi + 0x9c8]
0x14593276a: 4931ca xor r10, rcx
0x14593276d: 4831d0 xor rax, rdx
0x145932770: 4c31d2 xor rdx, r10
0x145932773: 488996c0090000 mov qword ptr [rsi + 0x9c0], rdx
0x14593277a: 4831c1 xor rcx, rax
0x14593277d: 48898eb8090000 mov qword ptr [rsi + 0x9b8], rcx
0x145932784: 4d31ca xor r10, r9
0x145932787: 4c8996c8090000 mov qword ptr [rsi + 0x9c8], r10
0x14593278e: 48c1c02d rol rax, 0x2d
0x145932792: 49c1e828 shr r8, 0x28
0x145932796: f3410f2ac8 cvtsi2ss xmm1, r8d
0x14593279b: 488986d0090000 mov qword ptr [rsi + 0x9d0], rax
0x1459327a2: f30f590d96025900 mulss xmm1, dword ptr [rip + 0x590296]
0x1459327aa: 0f2ec1 ucomiss xmm0, xmm1
0x1459327ad: 7640 jbe 0x1459327ef
0x1459327af: 488d05a78e2d01 lea rax, [rip + 0x12d8ea7]
0x1459327b6: 48894540 mov qword ptr [rbp + 0x40], rax
0x1459327ba: 48c745480e000000 mov qword ptr [rbp + 0x48], 0xe
0x1459327c2: 48c7455000000000 mov qword ptr [rbp + 0x50], 0
0x1459327ca: 66c745680000 mov word ptr [rbp + 0x68], 0
0x1459327d0: 488d4540 lea rax, [rbp + 0x40]
0x1459327d4: 4889442420 mov qword ptr [rsp + 0x20], rax
0x1459327d9: 4889f1 mov rcx, rsi
0x1459327dc: 4889da mov rdx, rbx
0x1459327df: 4c8b8508010000 mov r8, qword ptr [rbp + 0x108]
0x1459327e6: 4d89f1 mov r9, r14
0x1459327e9: e882910200 call 0x14595b970
0x1459327ee: 90 nop
0x1459327ef: 488b95c0000000 mov rdx, qword ptr [rbp + 0xc0]
0x1459327f6: 4885d2 test rdx, rdx
0x1459327f9: 7416 je 0x145932811
0x1459327fb: 48c1e204 shl rdx, 4
0x1459327ff: 41b808000000 mov r8d, 8
0x145932805: 488b8d08010000 mov rcx, qword ptr [rbp + 0x108]
0x14593280c: e8bff96cfa call 0x1400021d0

; ranged-update-deadline: 0x145932811..0x14593286e (end exclusive)
0x145932811: 483b9ed8000000 cmp rbx, qword ptr [rsi + 0xd8]
0x145932818: 0f832bdcffff jae 0x145930449
0x14593281e: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
0x145932825: 488b4c3818 mov rcx, qword ptr [rax + rdi + 0x18]
0x14593282a: 80793900 cmp byte ptr [rcx + 0x39], 0
0x14593282e: 0f8415dcffff je 0x145930449
0x145932834: 4801f8 add rax, rdi
0x145932837: f30f104060 movss xmm0, dword ptr [rax + 0x60]
0x14593283c: 0f2e864c0a0000 ucomiss xmm0, dword ptr [rsi + 0xa4c]
0x145932843: 0f8600dcffff jbe 0x145930449
0x145932849: f30f104864 movss xmm1, dword ptr [rax + 0x64]
0x14593284e: 0f28d1 movaps xmm2, xmm1
0x145932851: f30f5dd0 minss xmm2, xmm0
0x145932855: 0f28c2 movaps xmm0, xmm2
0x145932858: f30fc2c203 cmpunordss xmm0, xmm2
0x14593285d: 0f28d8 movaps xmm3, xmm0
0x145932860: 0f55da andnps xmm3, xmm2
0x145932863: 0f54c1 andps xmm0, xmm1
0x145932866: 0f56c3 orps xmm0, xmm3
0x145932869: f30f114064 movss dword ptr [rax + 0x64], xmm0

; actor-melee-move-tail: 0x145932dcb..0x145932f1b (end exclusive)
0x145932dcb: 410f28fb movaps xmm7, xmm11
0x145932dcf: 450f28df movaps xmm11, xmm15
0x145932dd3: 440f28fe movaps xmm15, xmm6
0x145932dd7: 483b9ed8000000 cmp rbx, qword ptr [rsi + 0xd8]
0x145932dde: 7348 jae 0x145932e28
0x145932de0: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
0x145932de7: 488b4c3818 mov rcx, qword ptr [rax + rdi + 0x18]
0x145932dec: 80793900 cmp byte ptr [rcx + 0x39], 0
0x145932df0: 7436 je 0x145932e28
0x145932df2: 4801f8 add rax, rdi
0x145932df5: f30f104060 movss xmm0, dword ptr [rax + 0x60]
0x145932dfa: 0f2e864c0a0000 ucomiss xmm0, dword ptr [rsi + 0xa4c]
0x145932e01: 7625 jbe 0x145932e28
0x145932e03: f30f104864 movss xmm1, dword ptr [rax + 0x64]
0x145932e08: 0f28d1 movaps xmm2, xmm1
0x145932e0b: f30f5dd0 minss xmm2, xmm0
0x145932e0f: 0f28c2 movaps xmm0, xmm2
0x145932e12: f30fc2c203 cmpunordss xmm0, xmm2
0x145932e17: 0f28d8 movaps xmm3, xmm0
0x145932e1a: 0f55da andnps xmm3, xmm2
0x145932e1d: 0f54c1 andps xmm0, xmm1
0x145932e20: 0f56c3 orps xmm0, xmm3
0x145932e23: f30f114064 movss dword ptr [rax + 0x64], xmm0
0x145932e28: 41807f3900 cmp byte ptr [r15 + 0x39], 0
0x145932e2d: 7469 je 0x145932e98
0x145932e2f: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
0x145932e36: 4839d3 cmp rbx, rdx
0x145932e39: 4c8d7b01 lea r15, [rbx + 1]
0x145932e3d: 0f8316060000 jae 0x145933459
0x145932e43: 410f28f6 movaps xmm6, xmm14
0x145932e47: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
0x145932e4e: 0fb74c3820 movzx ecx, word ptr [rax + rdi + 0x20]
0x145932e53: 450f57ed xorps xmm13, xmm13
0x145932e57: f3440f2ae9 cvtsi2ss xmm13, ecx
0x145932e5c: f3440f592d1f7d4800 mulss xmm13, dword ptr [rip + 0x487d1f]
0x145932e65: f3440f586c3868 addss xmm13, dword ptr [rax + rdi + 0x68]
0x145932e6c: 410f28c5 movaps xmm0, xmm13
0x145932e70: e8a2752d00 call 0x145c0a417
0x145932e75: 440f28f0 movaps xmm14, xmm0
0x145932e79: 410f28c5 movaps xmm0, xmm13
0x145932e7d: e88f752d00 call 0x145c0a411
0x145932e82: 440f14f0 unpcklps xmm14, xmm0
0x145932e86: 440f5935225f2d01 mulps xmm14, xmmword ptr [rip + 0x12d5f22]
0x145932e8e: 450f58e6 addps xmm12, xmm14
0x145932e92: 440f28f6 movaps xmm14, xmm6
0x145932e96: eb04 jmp 0x145932e9c
0x145932e98: 4c8d7b01 lea r15, [rbx + 1]
0x145932e9c: 410f28c2 movaps xmm0, xmm10
0x145932ea0: 410f5cc4 subps xmm0, xmm12
0x145932ea4: 0f59c0 mulps xmm0, xmm0
0x145932ea7: f30f16c8 movshdup xmm1, xmm0
0x145932eab: f30f58c8 addss xmm1, xmm0
0x145932eaf: 0f57c0 xorps xmm0, xmm0
0x145932eb2: f30f51c1 sqrtss xmm0, xmm1
0x145932eb6: 0f2e053b594800 ucomiss xmm0, dword ptr [rip + 0x48593b]
0x145932ebd: 410f28f7 movaps xmm6, xmm15
0x145932ec1: 450f28fb movaps xmm15, xmm11
0x145932ec5: 440f28df movaps xmm11, xmm7
0x145932ec9: 0f57ff xorps xmm7, xmm7
0x145932ecc: 0f8677d5ffff jbe 0x145930449
0x145932ed2: 0f28c8 movaps xmm1, xmm0
0x145932ed5: f30f580d335e2d01 addss xmm1, dword ptr [rip + 0x12d5e33]
0x145932edd: f30f5ec8 divss xmm1, xmm0
0x145932ee1: 450f5ce2 subps xmm12, xmm10
0x145932ee5: f3410f16dc movshdup xmm3, xmm12
0x145932eea: f3440f59e1 mulss xmm12, xmm1
0x145932eef: f3450f58e2 addss xmm12, xmm10
0x145932ef4: f3410f16c2 movshdup xmm0, xmm10
0x145932ef9: f30f59d9 mulss xmm3, xmm1
0x145932efd: f30f58d8 addss xmm3, xmm0
0x145932f01: f30f1045e0 movss xmm0, dword ptr [rbp - 0x20]
0x145932f06: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
0x145932f0c: 4889f1 mov rcx, rsi
0x145932f0f: 4889da mov rdx, rbx
0x145932f12: 410f28d4 movaps xmm2, xmm12
0x145932f16: e8d56c0000 call 0x145939bf0

; imp-recent-scan: 0x145930fbd..0x145931008 (end exclusive)
0x145930fbd: 488b8650010000 mov rax, qword ptr [rsi + 0x150]
0x145930fc4: 4885c0 test rax, rax
0x145930fc7: 0f8433020000 je 0x145931200
0x145930fcd: 488b8e48010000 mov rcx, qword ptr [rsi + 0x148]
0x145930fd4: 4531c0 xor r8d, r8d
0x145930fd7: 660f1f840000000000 nop word ptr [rax + rax]
0x145930fe0: 410f28c2 movaps xmm0, xmm10
0x145930fe4: f3420f5c0481 subss xmm0, dword ptr [rcx + r8*4]
0x145930fea: f30f100d6ec24700 movss xmm1, dword ptr [rip + 0x47c26e]
0x145930ff2: 0f2ec8 ucomiss xmm1, xmm0
0x145930ff5: 0f869d200000 jbe 0x145933098
0x145930ffb: 49ffc0 inc r8
0x145930ffe: 4c39c0 cmp rax, r8
0x145931001: 75dd jne 0x145930fe0
0x145931003: e9fa010000 jmp 0x145931202

; imp-budget-query-and-dispatch: 0x145931200..0x1459313ca (end exclusive)
0x145931200: 31c0 xor eax, eax
0x145931202: b918000000 mov ecx, 0x18
0x145931207: 4829c1 sub rcx, rax
0x14593120a: 41be00000000 mov r14d, 0
0x145931210: 4c0f43f1 cmovae r14, rcx
0x145931214: 4c89a5a8000000 mov qword ptr [rbp + 0xa8], r12
0x14593121b: 488d85a8000000 lea rax, [rbp + 0xa8]
0x145931222: 4889442420 mov qword ptr [rsp + 0x20], rax
0x145931227: 48c744242801000000 mov qword ptr [rsp + 0x28], 1
0x145931230: 4c8d7d40 lea r15, [rbp + 0x40]
0x145931234: 4c89f9 mov rcx, r15
0x145931237: 4889f2 mov rdx, rsi
0x14593123a: 4c8d85c0000000 lea r8, [rbp + 0xc0]
0x145931241: f30f101d2bc24700 movss xmm3, dword ptr [rip + 0x47c22b]
0x145931249: e8a2a0ffff call 0x14592b2f0
0x14593124e: 488b4540 mov rax, qword ptr [rbp + 0x40]
0x145931252: 488b4d48 mov rcx, qword ptr [rbp + 0x48]
0x145931256: 488b5550 mov rdx, qword ptr [rbp + 0x50]
0x14593125a: 488d14d1 lea rdx, [rcx + rdx*8]
0x14593125e: 48894d40 mov qword ptr [rbp + 0x40], rcx
0x145931262: 48894d48 mov qword ptr [rbp + 0x48], rcx
0x145931266: 48894550 mov qword ptr [rbp + 0x50], rax
0x14593126a: 48895558 mov qword ptr [rbp + 0x58], rdx
0x14593126e: 488d8660050000 lea rax, [rsi + 0x560]
0x145931275: 48894560 mov qword ptr [rbp + 0x60], rax
0x145931279: 4c897568 mov qword ptr [rbp + 0x68], r14
0x14593127d: 488d8de0000000 lea rcx, [rbp + 0xe0]
0x145931284: 4c89fa mov rdx, r15
0x145931287: e854a80b00 call 0x1459ebae0
0x14593128c: 4c8bbde8000000 mov r15, qword ptr [rbp + 0xe8]
0x145931293: 488b85f0000000 mov rax, qword ptr [rbp + 0xf0]
0x14593129a: 488d0cc500000000 lea rcx, [rax*8]
0x1459312a2: 48894d38 mov qword ptr [rbp + 0x38], rcx
0x1459312a6: 48898508010000 mov qword ptr [rbp + 0x108], rax
0x1459312ad: 4d8d34c7 lea r14, [r15 + rax*8]
0x1459312b1: 4c89bd00010000 mov qword ptr [rbp + 0x100], r15
0x1459312b8: eb21 jmp 0x1459312db
0x1459312ba: 660f1f440000 nop word ptr [rax + rax]
0x1459312c0: 4983c708 add r15, 8
0x1459312c4: 488b8648010000 mov rax, qword ptr [rsi + 0x148]
0x1459312cb: f3460f1114a8 movss dword ptr [rax + r13*4], xmm10
0x1459312d1: 49ffc5 inc r13
0x1459312d4: 4c89ae50010000 mov qword ptr [rsi + 0x150], r13
0x1459312db: 4d39f7 cmp r15, r14
0x1459312de: 7426 je 0x145931306
0x1459312e0: 4c8bae50010000 mov r13, qword ptr [rsi + 0x150]
0x1459312e7: 4c3bae40010000 cmp r13, qword ptr [rsi + 0x140]
0x1459312ee: 75d0 jne 0x1459312c0
0x1459312f0: c685fe00000001 mov byte ptr [rbp + 0xfe], 1
0x1459312f7: 488d8e40010000 lea rcx, [rsi + 0x140]
0x1459312fe: e88de32d00 call 0x145c0f690
0x145931303: 90 nop
0x145931304: ebba jmp 0x1459312c0
0x145931306: e8f50e6dfa call 0x140002200
0x14593130b: b908000000 mov ecx, 8
0x145931310: ba08000000 mov edx, 8
0x145931315: e8a60e6dfa call 0x1400021c0
0x14593131a: 4885c0 test rax, rax
0x14593131d: 0f8426200000 je 0x145933349
0x145931323: 4989c5 mov r13, rax
0x145931326: 4c8920 mov qword ptr [rax], r12
0x145931329: 48c7454001000000 mov qword ptr [rbp + 0x40], 1
0x145931331: 48894548 mov qword ptr [rbp + 0x48], rax
0x145931335: 48c7455001000000 mov qword ptr [rbp + 0x50], 1
0x14593133d: 488b95e0000000 mov rdx, qword ptr [rbp + 0xe0]
0x145931344: 41be01000000 mov r14d, 1
0x14593134a: 4c8ba508010000 mov r12, qword ptr [rbp + 0x108]
0x145931351: 4d85e4 test r12, r12
0x145931354: 4c8d7b01 lea r15, [rbx + 1]
0x145931358: 0f85ed1d0000 jne 0x14593314b
0x14593135e: 4885d2 test rdx, rdx
0x145931361: 7416 je 0x145931379
0x145931363: 48c1e203 shl rdx, 3
0x145931367: 41b808000000 mov r8d, 8
0x14593136d: 488b8d00010000 mov rcx, qword ptr [rbp + 0x100]
0x145931374: e8570e6dfa call 0x1400021d0
0x145931379: 4d01e6 add r14, r12
0x14593137c: 488b4540 mov rax, qword ptr [rbp + 0x40]
0x145931380: 48898500010000 mov qword ptr [rbp + 0x100], rax
0x145931387: 488d0572a52d01 lea rax, [rip + 0x12da572]
0x14593138e: 48894540 mov qword ptr [rbp + 0x40], rax
0x145931392: 48c7454808000000 mov qword ptr [rbp + 0x48], 8
0x14593139a: 48c7455000000000 mov qword ptr [rbp + 0x50], 0
0x1459313a2: 66c745680000 mov word ptr [rbp + 0x68], 0
0x1459313a8: 488d4540 lea rax, [rbp + 0x40]
0x1459313ac: 4889442420 mov qword ptr [rsp + 0x20], rax
0x1459313b1: 4889f1 mov rcx, rsi
0x1459313b4: 4889da mov rdx, rbx
0x1459313b7: 4c89ad08010000 mov qword ptr [rbp + 0x108], r13
0x1459313be: 4d89e8 mov r8, r13
0x1459313c1: 4d89f1 mov r9, r14
0x1459313c4: e847ac0200 call 0x14595c010
0x1459313c9: 90 nop

; imp-recent-stable-compaction: 0x145933098..0x14593314b (end exclusive)
0x145933098: 498d5001 lea rdx, [r8 + 1]
0x14593309c: 4839c2 cmp rdx, rax
0x14593309f: 7346 jae 0x1459330e7
0x1459330a1: 468d1400 lea r10d, [rax + r8]
0x1459330a5: 4d89c1 mov r9, r8
0x1459330a8: 41f6c201 test r10b, 1
0x1459330ac: 752d jne 0x1459330db
0x1459330ae: f3420f10448104 movss xmm0, dword ptr [rcx + r8*4 + 4]
0x1459330b5: 410f28ca movaps xmm1, xmm10
0x1459330b9: f30f5cc8 subss xmm1, xmm0
0x1459330bd: f30f10159ba14700 movss xmm2, dword ptr [rip + 0x47a19b]
0x1459330c5: 0f2ed1 ucomiss xmm2, xmm1
0x1459330c8: 4d89c1 mov r9, r8
0x1459330cb: 760a jbe 0x1459330d7
0x1459330cd: f3420f110481 movss dword ptr [rcx + r8*4], xmm0
0x1459330d3: 4d8d4801 lea r9, [r8 + 1]
0x1459330d7: 498d5002 lea rdx, [r8 + 2]
0x1459330db: 4c8d50fe lea r10, [rax - 2]
0x1459330df: 4d39c2 cmp r10, r8
0x1459330e2: 4d89c8 mov r8, r9
0x1459330e5: 751b jne 0x145933102
0x1459330e7: 4c898650010000 mov qword ptr [rsi + 0x150], r8
0x1459330ee: 4c89c0 mov rax, r8
0x1459330f1: e90ce1ffff jmp 0x145931202
0x1459330f6: 4883c202 add rdx, 2
0x1459330fa: 4d89c8 mov r8, r9
0x1459330fd: 4839d0 cmp rax, rdx
0x145933100: 74e5 je 0x1459330e7
0x145933102: f30f100491 movss xmm0, dword ptr [rcx + rdx*4]
0x145933107: 410f28ca movaps xmm1, xmm10
0x14593310b: f30f5cc8 subss xmm1, xmm0
0x14593310f: f30f101549a14700 movss xmm2, dword ptr [rip + 0x47a149]
0x145933117: 0f2ed1 ucomiss xmm2, xmm1
0x14593311a: 7609 jbe 0x145933125
0x14593311c: f3420f110489 movss dword ptr [rcx + r9*4], xmm0
0x145933122: 49ffc1 inc r9
0x145933125: f30f10449104 movss xmm0, dword ptr [rcx + rdx*4 + 4]
0x14593312b: 410f28ca movaps xmm1, xmm10
0x14593312f: f30f5cc8 subss xmm1, xmm0
0x145933133: f30f101525a14700 movss xmm2, dword ptr [rip + 0x47a125]
0x14593313b: 0f2ed1 ucomiss xmm2, xmm1
0x14593313e: 76b6 jbe 0x1459330f6
0x145933140: f3420f110489 movss dword ptr [rcx + r9*4], xmm0
0x145933146: 49ffc1 inc r9
0x145933149: ebab jmp 0x1459330f6

; melee-vector-radius-and-momentum: 0x14593237a..0x1459326a1 (end exclusive)
0x14593237a: 4531f6 xor r14d, r14d
0x14593237d: 48c7850001000000000000 mov qword ptr [rbp + 0x100], 0
0x145932388: e873fe6cfa call 0x140002200
0x14593238d: b908000000 mov ecx, 8
0x145932392: ba08000000 mov edx, 8
0x145932397: e824fe6cfa call 0x1400021c0
0x14593239c: 4885c0 test rax, rax
0x14593239f: 0f84d10f0000 je 0x145933376
0x1459323a5: 4c8920 mov qword ptr [rax], r12
0x1459323a8: 48c785c000000001000000 mov qword ptr [rbp + 0xc0], 1
0x1459323b3: 488985c8000000 mov qword ptr [rbp + 0xc8], rax
0x1459323ba: 48c785d000000001000000 mov qword ptr [rbp + 0xd0], 1
0x1459323c5: 488b8508010000 mov rax, qword ptr [rbp + 0x108]
0x1459323cc: 80783905 cmp byte ptr [rax + 0x39], 5
0x1459323d0: 7579 jne 0x14593244b
0x1459323d2: f3410f10455c movss xmm0, dword ptr [r13 + 0x5c]
0x1459323d8: 0f2ef8 ucomiss xmm7, xmm0
0x1459323db: 0f835e010000 jae 0x14593253f
0x1459323e1: f30f108e4c0a0000 movss xmm1, dword ptr [rsi + 0xa4c]
0x1459323e9: f3410f5c4d58 subss xmm1, dword ptr [r13 + 0x58]
0x1459323ef: f30f5ec8 divss xmm1, xmm0
0x1459323f3: 0f57c0 xorps xmm0, xmm0
0x1459323f6: f30f5fc1 maxss xmm0, xmm1
0x1459323fa: f30f100d5eae4700 movss xmm1, dword ptr [rip + 0x47ae5e]
0x145932402: f30f5dc8 minss xmm1, xmm0
0x145932406: f3410f104548 movss xmm0, dword ptr [r13 + 0x48]
0x14593240c: f3410f105554 movss xmm2, dword ptr [r13 + 0x54]
0x145932412: f30f5cd0 subss xmm2, xmm0
0x145932416: f30f59d1 mulss xmm2, xmm1
0x14593241a: f30f58d0 addss xmm2, xmm0
0x14593241e: f2410f104540 movsd xmm0, qword ptr [r13 + 0x40]
0x145932424: f2410f105d4c movsd xmm3, qword ptr [r13 + 0x4c]
0x14593242a: 0f5cd8 subps xmm3, xmm0
0x14593242d: f30f12c9 movsldup xmm1, xmm1
0x145932431: 0f59cb mulps xmm1, xmm3
0x145932434: 0f58c8 addps xmm1, xmm0
0x145932437: 0f138de0000000 movlps qword ptr [rbp + 0xe0], xmm1
0x14593243e: f30f1195e8000000 movss dword ptr [rbp + 0xe8], xmm2
0x145932446: e909010000 jmp 0x145932554
0x14593244b: 4584f6 test r14b, r14b
0x14593244e: 0f84d5010000 je 0x145932629
0x145932454: f30f10964c0a0000 movss xmm2, dword ptr [rsi + 0xa4c]
0x14593245c: 488b8668050000 mov rax, qword ptr [rsi + 0x568]
0x145932463: 48c7c128feffff mov rcx, 0xfffffffffffffe28
0x14593246a: 4801c8 add rax, rcx
0x14593246d: 48698e70050000d8010000 imul rcx, qword ptr [rsi + 0x570], 0x1d8
0x145932478: 4885c9 test rcx, rcx
0x14593247b: 0f84a8010000 je 0x145932629
0x145932481: 488d90d8010000 lea rdx, [rax + 0x1d8]
0x145932488: 4881c128feffff add rcx, -0x1d8
0x14593248f: 4c39a0c8020000 cmp qword ptr [rax + 0x2c8], r12
0x145932496: 4889d0 mov rax, rdx
0x145932499: 75dd jne 0x145932478
0x14593249b: 4c8db5e4000000 lea r14, [rbp + 0xe4]
0x1459324a2: 4c89f1 mov rcx, r14
0x1459324a5: e8e6a70600 call 0x14599cc90
0x1459324aa: 418b4608 mov eax, dword ptr [r14 + 8]
0x1459324ae: 8985b0000000 mov dword ptr [rbp + 0xb0], eax
0x1459324b4: 498b06 mov rax, qword ptr [r14]
0x1459324b7: 488985a8000000 mov qword ptr [rbp + 0xa8], rax
0x1459324be: 4c8965e8 mov qword ptr [rbp - 0x18], r12
0x1459324c2: c6851701000001 mov byte ptr [rbp + 0x117], 1
0x1459324c9: 488d45e8 lea rax, [rbp - 0x18]
0x1459324cd: 4889442420 mov qword ptr [rsp + 0x20], rax
0x1459324d2: 48c744242801000000 mov qword ptr [rsp + 0x28], 1
0x1459324db: 488d4d40 lea rcx, [rbp + 0x40]
0x1459324df: 4889f2 mov rdx, rsi
0x1459324e2: 4c8d85a8000000 lea r8, [rbp + 0xa8]
0x1459324e9: f30f101dd7ef4700 movss xmm3, dword ptr [rip + 0x47efd7]
0x1459324f1: e8fa8dffff call 0x14592b2f0
0x1459324f6: 90 nop
0x1459324f7: 488b4540 mov rax, qword ptr [rbp + 0x40]
0x1459324fb: 488b4d48 mov rcx, qword ptr [rbp + 0x48]
0x1459324ff: 488b5550 mov rdx, qword ptr [rbp + 0x50]
0x145932503: 488d14d1 lea rdx, [rcx + rdx*8]
0x145932507: 48894d40 mov qword ptr [rbp + 0x40], rcx
0x14593250b: 48894d48 mov qword ptr [rbp + 0x48], rcx
0x14593250f: 48894550 mov qword ptr [rbp + 0x50], rax
0x145932513: 48895558 mov qword ptr [rbp + 0x58], rdx
0x145932517: 488b8500010000 mov rax, qword ptr [rbp + 0x100]
0x14593251e: 48894560 mov qword ptr [rbp + 0x60], rax
0x145932522: c6851701000001 mov byte ptr [rbp + 0x117], 1
0x145932529: 488d8dc0000000 lea rcx, [rbp + 0xc0]
0x145932530: 488d5540 lea rdx, [rbp + 0x40]
0x145932534: e817380900 call 0x1459c5d50
0x145932539: 90 nop
0x14593253a: e9ea000000 jmp 0x145932629
0x14593253f: 418b4554 mov eax, dword ptr [r13 + 0x54]
0x145932543: 8985e8000000 mov dword ptr [rbp + 0xe8], eax
0x145932549: 498b454c mov rax, qword ptr [r13 + 0x4c]
0x14593254d: 488985e0000000 mov qword ptr [rbp + 0xe0], rax
0x145932554: f30f100d4c1a7800 movss xmm1, dword ptr [rip + 0x781a4c]
0x14593255c: f30f1086a8040000 movss xmm0, dword ptr [rsi + 0x4a8]
0x145932564: f30f590594be4800 mulss xmm0, dword ptr [rip + 0x48be94]
0x14593256c: 0f2ec8 ucomiss xmm1, xmm0
0x14593256f: 733e jae 0x1459325af
0x145932571: f30f5805a7662d01 addss xmm0, dword ptr [rip + 0x12d66a7]
0x145932579: f30f10153fef4700 movss xmm2, dword ptr [rip + 0x47ef3f]
0x145932581: 410f28fb movaps xmm7, xmm11
0x145932585: 450f28df movaps xmm11, xmm15
0x145932589: 440f28fa movaps xmm15, xmm2
0x14593258d: f30f5ec2 divss xmm0, xmm2
0x145932591: 440f28e9 movaps xmm13, xmm1
0x145932595: e8a37f2d00 call 0x145c0a53d
0x14593259a: f3410f59c7 mulss xmm0, xmm15
0x14593259f: 450f28fb movaps xmm15, xmm11
0x1459325a3: 440f28df movaps xmm11, xmm7
0x1459325a7: 0f57ff xorps xmm7, xmm7
0x1459325aa: f3410f58c5 addss xmm0, xmm13
0x1459325af: 4c89a5a8000000 mov qword ptr [rbp + 0xa8], r12
0x1459325b6: c6851701000001 mov byte ptr [rbp + 0x117], 1
0x1459325bd: 488d85a8000000 lea rax, [rbp + 0xa8]
0x1459325c4: 4889442420 mov qword ptr [rsp + 0x20], rax
0x1459325c9: 48c744242801000000 mov qword ptr [rsp + 0x28], 1
0x1459325d2: 488d4d40 lea rcx, [rbp + 0x40]
0x1459325d6: 4889f2 mov rdx, rsi
0x1459325d9: 4c8d85e0000000 lea r8, [rbp + 0xe0]
0x1459325e0: 0f28d8 movaps xmm3, xmm0
0x1459325e3: e8088dffff call 0x14592b2f0
0x1459325e8: 90 nop
0x1459325e9: 488b4540 mov rax, qword ptr [rbp + 0x40]
0x1459325ed: 488b4d48 mov rcx, qword ptr [rbp + 0x48]
0x1459325f1: 488b5550 mov rdx, qword ptr [rbp + 0x50]
0x1459325f5: 488d14d1 lea rdx, [rcx + rdx*8]
0x1459325f9: 48894d40 mov qword ptr [rbp + 0x40], rcx
0x1459325fd: 48894d48 mov qword ptr [rbp + 0x48], rcx
0x145932601: 48894550 mov qword ptr [rbp + 0x50], rax
0x145932605: 48895558 mov qword ptr [rbp + 0x58], rdx
0x145932609: 48c7456009000000 mov qword ptr [rbp + 0x60], 9
0x145932611: c6851701000001 mov byte ptr [rbp + 0x117], 1
0x145932618: 488d8dc0000000 lea rcx, [rbp + 0xc0]
0x14593261f: 488d5540 lea rdx, [rbp + 0x40]
0x145932623: e828370900 call 0x1459c5d50
0x145932628: 90 nop
0x145932629: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
0x145932630: 4839d3 cmp rbx, rdx
0x145932633: 0f83860e0000 jae 0x1459334bf
0x145932639: 488b8508010000 mov rax, qword ptr [rbp + 0x108]
0x145932640: 80783905 cmp byte ptr [rax + 0x39], 5
0x145932644: 753e jne 0x145932684
0x145932646: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
0x14593264d: 488b543820 mov rdx, qword ptr [rax + rdi + 0x20]
0x145932652: 4801f8 add rax, rdi
0x145932655: 8b4874 mov ecx, dword ptr [rax + 0x74]
0x145932658: ffc1 inc ecx
0x14593265a: 894874 mov dword ptr [rax + 0x74], ecx
0x14593265d: 69c1abaaaaaa imul eax, ecx, 0xaaaaaaab
0x145932663: 41be06000000 mov r14d, 6
0x145932669: 3d55555555 cmp eax, 0x55555555
0x14593266e: 0f8640020000 jbe 0x1459328b4
0x145932674: f3440f102de3ab4700 movss xmm13, dword ptr [rip + 0x47abe3]
0x14593267d: 31c0 xor eax, eax
0x14593267f: e9e3020000 jmp 0x145932967
0x145932684: 41be05000000 mov r14d, 5
0x14593268a: f3440f102dcdab4700 movss xmm13, dword ptr [rip + 0x47abcd]
0x145932693: 31c0 xor eax, eax
0x145932695: 488d0d65732d01 lea rcx, [rip + 0x12d7365]
0x14593269c: e9cd020000 jmp 0x14593296e

; melee-momentum-visual-hit-and-echo: 0x1459328b4..0x145932bbd (end exclusive)
0x1459328b4: 4c8b8dc8000000 mov r9, qword ptr [rbp + 0xc8]
0x1459328bb: 488b85d0000000 mov rax, qword ptr [rbp + 0xd0]
0x1459328c2: 4c89a5e8000000 mov qword ptr [rbp + 0xe8], r12
0x1459328c9: c785e000000000000000 mov dword ptr [rbp + 0xe0], 0
0x1459328d3: c785a800000000000000 mov dword ptr [rbp + 0xa8], 0
0x1459328dd: c6851701000001 mov byte ptr [rbp + 0x117], 1
0x1459328e4: 488d8da8000000 lea rcx, [rbp + 0xa8]
0x1459328eb: 48894c2430 mov qword ptr [rsp + 0x30], rcx
0x1459328f0: 488d8de0000000 lea rcx, [rbp + 0xe0]
0x1459328f7: 48894c2428 mov qword ptr [rsp + 0x28], rcx
0x1459328fc: 4889442420 mov qword ptr [rsp + 0x20], rax
0x145932901: 488d4d40 lea rcx, [rbp + 0x40]
0x145932905: 41b84d030000 mov r8d, 0x34d
0x14593290b: e8c0bef9ff call 0x1458ce7d0
0x145932910: 90 nop
0x145932911: 4c8ba630060000 mov r12, qword ptr [rsi + 0x630]
0x145932918: 4c3ba620060000 cmp r12, qword ptr [rsi + 0x620]
0x14593291f: 750d jne 0x14593292e
0x145932921: 488d8e20060000 lea rcx, [rsi + 0x620]
0x145932928: e8a3b22d00 call 0x145c0dbd0
0x14593292d: 90 nop
0x14593292e: 488b8628060000 mov rax, qword ptr [rsi + 0x628]
0x145932935: 4c89e1 mov rcx, r12
0x145932938: 48c1e105 shl rcx, 5
0x14593293c: 0f104540 movups xmm0, xmmword ptr [rbp + 0x40]
0x145932940: 0f104d50 movups xmm1, xmmword ptr [rbp + 0x50]
0x145932944: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
0x145932949: 0f110408 movups xmmword ptr [rax + rcx], xmm0
0x14593294d: 49ffc4 inc r12
0x145932950: 4c89a630060000 mov qword ptr [rsi + 0x630], r12
0x145932957: f3440f102d08a94700 movss xmm13, dword ptr [rip + 0x47a908]
0x145932960: 488d05e78c2d01 lea rax, [rip + 0x12d8ce7]
0x145932967: 488d0dda8c2d01 lea rcx, [rip + 0x12d8cda]
0x14593296e: 4c8b85c8000000 mov r8, qword ptr [rbp + 0xc8]
0x145932975: 4c8b8dd0000000 mov r9, qword ptr [rbp + 0xd0]
0x14593297c: 48894d40 mov qword ptr [rbp + 0x40], rcx
0x145932980: 4c897548 mov qword ptr [rbp + 0x48], r14
0x145932984: 48894550 mov qword ptr [rbp + 0x50], rax
0x145932988: 48c745580f000000 mov qword ptr [rbp + 0x58], 0xf
0x145932990: c745600000803f mov dword ptr [rbp + 0x60], 0x3f800000
0x145932997: 66c745680000 mov word ptr [rbp + 0x68], 0
0x14593299d: c6851701000001 mov byte ptr [rbp + 0x117], 1
0x1459329a4: f3440f116c2428 movss dword ptr [rsp + 0x28], xmm13
0x1459329ab: 488d4540 lea rax, [rbp + 0x40]
0x1459329af: 4889442420 mov qword ptr [rsp + 0x20], rax
0x1459329b4: c644243000 mov byte ptr [rsp + 0x30], 0
0x1459329b9: 4889f1 mov rcx, rsi
0x1459329bc: 4889da mov rdx, rbx
0x1459329bf: e83c430200 call 0x145956d00
0x1459329c4: 90 nop
0x1459329c5: 488b9600080000 mov rdx, qword ptr [rsi + 0x800]
0x1459329cc: 4885d2 test rdx, rdx
0x1459329cf: 0f84bd010000 je 0x145932b92
0x1459329d5: 488b86f8070000 mov rax, qword ptr [rsi + 0x7f8]
0x1459329dc: 4883fa01 cmp rdx, 1
0x1459329e0: 750c jne 0x1459329ee
0x1459329e2: 31c9 xor ecx, ecx
0x1459329e4: f30f1005f4aa4700 movss xmm0, dword ptr [rip + 0x47aaf4]
0x1459329ec: eb54 jmp 0x145932a42
0x1459329ee: 4989d0 mov r8, rdx
0x1459329f1: 4983e0fe and r8, 0xfffffffffffffffe
0x1459329f5: 31c9 xor ecx, ecx
0x1459329f7: f30f1005e1aa4700 movss xmm0, dword ptr [rip + 0x47aae1]
0x1459329ff: eb18 jmp 0x145932a19
0x145932a01: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145932a10: 4883c102 add rcx, 2
0x145932a14: 4939c8 cmp r8, rcx
0x145932a17: 7424 je 0x145932a3d
0x145932a19: 803cc81f cmp byte ptr [rax + rcx*8], 0x1f
0x145932a1d: 7409 je 0x145932a28
0x145932a1f: 807cc8081f cmp byte ptr [rax + rcx*8 + 8], 0x1f
0x145932a24: 75ea jne 0x145932a10
0x145932a26: eb0d jmp 0x145932a35
0x145932a28: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
0x145932a2e: 807cc8081f cmp byte ptr [rax + rcx*8 + 8], 0x1f
0x145932a33: 75db jne 0x145932a10
0x145932a35: f30f5844c80c addss xmm0, dword ptr [rax + rcx*8 + 0xc]
0x145932a3b: ebd3 jmp 0x145932a10
0x145932a3d: f6c201 test dl, 1
0x145932a40: 740c je 0x145932a4e
0x145932a42: 803cc81f cmp byte ptr [rax + rcx*8], 0x1f
0x145932a46: 7506 jne 0x145932a4e
0x145932a48: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
0x145932a4e: 0f2ec7 ucomiss xmm0, xmm7
0x145932a51: 0f863b010000 jbe 0x145932b92
0x145932a57: 488b86d0090000 mov rax, qword ptr [rsi + 0x9d0]
0x145932a5e: 488b8eb8090000 mov rcx, qword ptr [rsi + 0x9b8]
0x145932a65: 488b96c0090000 mov rdx, qword ptr [rsi + 0x9c0]
0x145932a6c: 4c8d0408 lea r8, [rax + rcx]
0x145932a70: 49c1c017 rol r8, 0x17
0x145932a74: 4901c8 add r8, rcx
0x145932a77: 4989d1 mov r9, rdx
0x145932a7a: 49c1e111 shl r9, 0x11
0x145932a7e: 4c8b96c8090000 mov r10, qword ptr [rsi + 0x9c8]
0x145932a85: 4931ca xor r10, rcx
0x145932a88: 4831d0 xor rax, rdx
0x145932a8b: 4c31d2 xor rdx, r10
0x145932a8e: 488996c0090000 mov qword ptr [rsi + 0x9c0], rdx
0x145932a95: 4831c1 xor rcx, rax
0x145932a98: 48898eb8090000 mov qword ptr [rsi + 0x9b8], rcx
0x145932a9f: 4d31ca xor r10, r9
0x145932aa2: 4c8996c8090000 mov qword ptr [rsi + 0x9c8], r10
0x145932aa9: 48c1c02d rol rax, 0x2d
0x145932aad: 49c1e828 shr r8, 0x28
0x145932ab1: 0f57c9 xorps xmm1, xmm1
0x145932ab4: f3410f2ac8 cvtsi2ss xmm1, r8d
0x145932ab9: 488986d0090000 mov qword ptr [rsi + 0x9d0], rax
0x145932ac0: f30f590d78ff5800 mulss xmm1, dword ptr [rip + 0x58ff78]
0x145932ac8: 0f2ec1 ucomiss xmm0, xmm1
0x145932acb: 0f86c1000000 jbe 0x145932b92
0x145932ad1: 488b85c0000000 mov rax, qword ptr [rbp + 0xc0]
0x145932ad8: 488b8dc8000000 mov rcx, qword ptr [rbp + 0xc8]
0x145932adf: 488b95d0000000 mov rdx, qword ptr [rbp + 0xd0]
0x145932ae6: 488d14d1 lea rdx, [rcx + rdx*8]
0x145932aea: 48894d40 mov qword ptr [rbp + 0x40], rcx
0x145932aee: 48894d48 mov qword ptr [rbp + 0x48], rcx
0x145932af2: 48894550 mov qword ptr [rbp + 0x50], rax
0x145932af6: 48895558 mov qword ptr [rbp + 0x58], rdx
0x145932afa: 488d8660050000 lea rax, [rsi + 0x560]
0x145932b01: 48894560 mov qword ptr [rbp + 0x60], rax
0x145932b05: c6851701000000 mov byte ptr [rbp + 0x117], 0
0x145932b0c: 488d8de0000000 lea rcx, [rbp + 0xe0]
0x145932b13: 488d5540 lea rdx, [rbp + 0x40]
0x145932b17: e814940b00 call 0x1459ebf30
0x145932b1c: 90 nop
0x145932b1d: 4c8b8df0000000 mov r9, qword ptr [rbp + 0xf0]
0x145932b24: 4d85c9 test r9, r9
0x145932b27: 7450 je 0x145932b79
0x145932b29: 488d052d8b2d01 lea rax, [rip + 0x12d8b2d]
0x145932b30: 48894540 mov qword ptr [rbp + 0x40], rax
0x145932b34: 48c745480e000000 mov qword ptr [rbp + 0x48], 0xe
0x145932b3c: 48c7455000000000 mov qword ptr [rbp + 0x50], 0
0x145932b44: 66c745680000 mov word ptr [rbp + 0x68], 0
0x145932b4a: 4c8b85e8000000 mov r8, qword ptr [rbp + 0xe8]
0x145932b51: f3440f116c2428 movss dword ptr [rsp + 0x28], xmm13
0x145932b58: 488d4540 lea rax, [rbp + 0x40]
0x145932b5c: 4889442420 mov qword ptr [rsp + 0x20], rax
0x145932b61: c644243001 mov byte ptr [rsp + 0x30], 1
0x145932b66: 4889f1 mov rcx, rsi
0x145932b69: 4889da mov rdx, rbx
0x145932b6c: 4c898508010000 mov qword ptr [rbp + 0x108], r8
0x145932b73: e888410200 call 0x145956d00
0x145932b78: 90 nop
0x145932b79: 488b95e0000000 mov rdx, qword ptr [rbp + 0xe0]
0x145932b80: 4885d2 test rdx, rdx
0x145932b83: 0f8442020000 je 0x145932dcb
0x145932b89: 488b8de8000000 mov rcx, qword ptr [rbp + 0xe8]
0x145932b90: eb17 jmp 0x145932ba9
0x145932b92: 488b95c0000000 mov rdx, qword ptr [rbp + 0xc0]
0x145932b99: 4885d2 test rdx, rdx
0x145932b9c: 0f8429020000 je 0x145932dcb
0x145932ba2: 488b8dc8000000 mov rcx, qword ptr [rbp + 0xc8]
0x145932ba9: 48c1e203 shl rdx, 3
0x145932bad: 41b808000000 mov r8d, 8
0x145932bb3: e818f66cfa call 0x1400021d0
0x145932bb8: e90e020000 jmp 0x145932dcb
