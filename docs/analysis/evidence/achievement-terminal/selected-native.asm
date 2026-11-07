1458ba014 83791002 cmp dword ptr [rcx + 0x10], 2
1458ba018 0f84ed180000 je 0x1458bb90b
1458ba01e 80b9ef0a000000 cmp byte ptr [rcx + 0xaef], 0
1458ba025 0f84e0180000 je 0x1458bb90b
1458ba02b 8b81f0040000 mov eax, dword ptr [rcx + 0x4f0]
1458ba031 8985c0000000 mov dword ptr [rbp + 0xc0], eax
1458ba037 f3440f10815c0a0000 movss xmm8, dword ptr [rcx + 0xa5c]
1458ba040 8bb198090000 mov esi, dword ptr [rcx + 0x998]
1458ba046 488b81d0100000 mov rax, qword ptr [rcx + 0x10d0]
1458ba04d 488985a0000000 mov qword ptr [rbp + 0xa0], rax
1458ba054 0fb6812c030000 movzx eax, byte ptr [rcx + 0x32c]
1458ba05b 48898568010000 mov qword ptr [rbp + 0x168], rax
1458ba062 4c8b81b8020000 mov r8, qword ptr [rcx + 0x2b8]
1458ba069 488b91c0020000 mov rdx, qword ptr [rcx + 0x2c0]
1458ba070 8b819c070000 mov eax, dword ptr [rcx + 0x79c]
1458ba076 f3480f2ac0 cvtsi2ss xmm0, rax
1458ba07b 0fb781d8020000 movzx eax, word ptr [rcx + 0x2d8]
1458ba082 450f57ed xorps xmm13, xmm13
1458ba086 f3440f2ae8 cvtsi2ss xmm13, eax
1458ba08b f3440f1025f4334f00 movss xmm12, dword ptr [rip + 0x4f33f4]
1458ba094 410f28cd movaps xmm1, xmm13
1458ba098 f3410f5ecc divss xmm1, xmm12
1458ba09d f30f5ec1 divss xmm0, xmm1
1458ba0a1 f3480f2cf8 cvttss2si rdi, xmm0
1458ba0a6 4531f6 xor r14d, r14d
1458ba0a9 450f57c9 xorps xmm9, xmm9
1458ba0ad 410f2ec1 ucomiss xmm0, xmm9
1458ba0b1 410f42fe cmovb edi, r14d
1458ba0b5 f3440f101586ca4f00 movss xmm10, dword ptr [rip + 0x4fca86]
1458ba0be 410f2ec2 ucomiss xmm0, xmm10
1458ba0c2 b8ffffffff mov eax, 0xffffffff
1458ba0c7 0f47f8 cmova edi, eax
1458ba0ca 48898da8000000 mov qword ptr [rbp + 0xa8], rcx
1458ba0d1 8b99a8070000 mov ebx, dword ptr [rcx + 0x7a8]
1458ba0d7 4c8985b0000000 mov qword ptr [rbp + 0xb0], r8
1458ba0de 4c89c1 mov rcx, r8
1458ba0e1 488995b8000000 mov qword ptr [rbp + 0xb8], rdx
1458ba0e8 e8d3ecfdff call 0x145898dc0
1458ba0ed f3480f2af7 cvtsi2ss xmm6, rdi
1458ba0f2 48898578010000 mov qword ptr [rbp + 0x178], rax
1458ba0f9 4889df mov rdi, rbx
1458ba0fc 488d1cdd00000000 lea rbx, [rbx*8]
1458ba104 f30f59356c334f00 mulss xmm6, dword ptr [rip + 0x4f336c]
1458ba10c 0f28c6 movaps xmm0, xmm6
1458ba10f e809033500 call 0x145c0a41d
1458ba114 f34c0f2cf8 cvttss2si r15, xmm0
1458ba119 f3440f101d2e475d00 movss xmm11, dword ptr [rip + 0x5d472e]
1458ba122 410f2ec3 ucomiss xmm0, xmm11
1458ba126 49bdffffffffffffff7f movabs r13, 0x7fffffffffffffff
1458ba130 4d0f47fd cmova r15, r13
1458ba134 0f2ec0 ucomiss xmm0, xmm0
1458ba137 4d0f4afe cmovp r15, r14
1458ba13b 410f28f8 movaps xmm7, xmm8
1458ba13f f30f5e3d99e64f00 divss xmm7, dword ptr [rip + 0x4fe699]
1458ba147 f30f593d75734f00 mulss xmm7, dword ptr [rip + 0x4f7375]
1458ba14f 0f28c7 movaps xmm0, xmm7
1458ba152 e8c6023500 call 0x145c0a41d
1458ba157 f34c0f2ce0 cvttss2si r12, xmm0
1458ba15c 410f2ec3 ucomiss xmm0, xmm11
1458ba160 4d0f47e5 cmova r12, r13
1458ba164 0f2ec0 ucomiss xmm0, xmm0
1458ba167 4d0f4ae6 cmovp r12, r14
1458ba16b 488d1c9b lea rbx, [rbx + rbx*4]
1458ba16f 4885f6 test rsi, rsi
1458ba172 49c7c538ffffff mov r13, 0xffffffffffffff38
1458ba179 4c0f44ee cmove r13, rsi
1458ba17d 41bec8000000 mov r14d, 0xc8
1458ba183 48897538 mov qword ptr [rbp + 0x38], rsi
1458ba187 4c0f44f6 cmove r14, rsi
1458ba18b 7505 jne 0x1458ba192
1458ba18d 0f57c9 xorps xmm1, xmm1
1458ba190 eb08 jmp 0x1458ba19a
1458ba192 f30f100df6e54f00 movss xmm1, dword ptr [rip + 0x4fe5f6]
1458ba19a f3480f2ad7 cvtsi2ss xmm2, rdi
1458ba19f f30f58fe addss xmm7, xmm6
1458ba1a3 488bb5a8000000 mov rsi, qword ptr [rbp + 0xa8]
1458ba1aa 488d4610 lea rax, [rsi + 0x10]
1458ba1ae 48894540 mov qword ptr [rbp + 0x40], rax
1458ba1b2 f30f59152a334f00 mulss xmm2, dword ptr [rip + 0x4f332a]
1458ba1ba f30f58d7 addss xmm2, xmm7
1458ba1be 0f57c0 xorps xmm0, xmm0
1458ba1c1 f30f2a8578010000 cvtsi2ss xmm0, dword ptr [rbp + 0x178]
1458ba1c9 f30f5905bf0e5000 mulss xmm0, dword ptr [rip + 0x500ebf]
1458ba1d1 f30f5e0567a36f00 divss xmm0, dword ptr [rip + 0x6fa367]
1458ba1d9 f30f58d1 addss xmm2, xmm1
1458ba1dd f30f10357b304f00 movss xmm6, dword ptr [rip + 0x4f307b]
1458ba1e5 f30f58c6 addss xmm0, xmm6
1458ba1e9 f30f59c2 mulss xmm0, xmm2
1458ba1ed e82b023500 call 0x145c0a41d
1458ba1f2 f3480f2cc0 cvttss2si rax, xmm0
1458ba1f7 410f2ec1 ucomiss xmm0, xmm9
1458ba1fb b900000000 mov ecx, 0
1458ba200 0f42c1 cmovb eax, ecx
1458ba203 410f2ec2 ucomiss xmm0, xmm10
1458ba207 b9ffffffff mov ecx, 0xffffffff
1458ba20c 0f47c1 cmova eax, ecx
1458ba20f 498d3c1c lea rdi, [r12 + rbx]
1458ba213 4c01ff add rdi, r15
1458ba216 4929fd sub r13, rdi
1458ba219 4901c5 add r13, rax
1458ba21c 4c8965d8 mov qword ptr [rbp - 0x28], r12
1458ba220 4c897de0 mov qword ptr [rbp - 0x20], r15
1458ba224 4989f7 mov r15, rsi
1458ba227 4c01f7 add rdi, r14
1458ba22a 4c01ef add rdi, r13
1458ba22d 0f57c9 xorps xmm1, xmm1
1458ba230 f3480f2acf cvtsi2ss xmm1, rdi
1458ba235 48895de8 mov qword ptr [rbp - 0x18], rbx
1458ba239 f30f1015dff3c600 movss xmm2, dword ptr [rip + 0xc6f3df]
1458ba241 f3440f58ea addss xmm13, xmm2
1458ba246 f3450f5eec divss xmm13, xmm12
1458ba24b 0fb786da020000 movzx eax, word ptr [rsi + 0x2da]
1458ba252 0f57c0 xorps xmm0, xmm0
1458ba255 f30f2ac0 cvtsi2ss xmm0, eax
1458ba259 f3440f592d36714f00 mulss xmm13, dword ptr [rip + 0x4f7136]
1458ba262 f30f58c2 addss xmm0, xmm2
1458ba266 f3410f5ec4 divss xmm0, xmm12
1458ba26b f30f59058d085000 mulss xmm0, dword ptr [rip + 0x50088d]
1458ba273 f3410f58c5 addss xmm0, xmm13
1458ba278 0fb786dc020000 movzx eax, word ptr [rsi + 0x2dc]
1458ba27f f30f2ad8 cvtsi2ss xmm3, eax
1458ba283 f30f58da addss xmm3, xmm2
1458ba287 f3410f5edc divss xmm3, xmm12
1458ba28c f30f591d9c744f00 mulss xmm3, dword ptr [rip + 0x4f749c]
1458ba294 f30f58d8 addss xmm3, xmm0
1458ba298 0fb786de020000 movzx eax, word ptr [rsi + 0x2de]
1458ba29f 0f57c0 xorps xmm0, xmm0
1458ba2a2 f30f2ac0 cvtsi2ss xmm0, eax
1458ba2a6 4c8975f0 mov qword ptr [rbp - 0x10], r14
1458ba2aa f30f58c2 addss xmm0, xmm2
1458ba2ae f3410f5ec4 divss xmm0, xmm12
1458ba2b3 f30f58c0 addss xmm0, xmm0
1458ba2b7 f30f58c3 addss xmm0, xmm3
1458ba2bb f30f58c6 addss xmm0, xmm6
1458ba2bf f30f5d05a12f4f00 minss xmm0, dword ptr [rip + 0x4f2fa1]
1458ba2c7 4c896df8 mov qword ptr [rbp - 8], r13
1458ba2cb f30f580595704f00 addss xmm0, dword ptr [rip + 0x4f7095]
1458ba2d3 f30f59c1 mulss xmm0, xmm1
1458ba2d7 e841013500 call 0x145c0a41d
1458ba2dc f3480f2cc0 cvttss2si rax, xmm0
1458ba2e1 410f2ec3 ucomiss xmm0, xmm11
1458ba2e5 48beffffffffffffff7f movabs rsi, 0x7fffffffffffffff
1458ba2ef 480f47c6 cmova rax, rsi
1458ba2f3 0f2ec0 ucomiss xmm0, xmm0
1458ba2f6 b900000000 mov ecx, 0
1458ba2fb 480f4ac1 cmovp rax, rcx
1458ba2ff 48894500 mov qword ptr [rbp], rax
1458ba303 4801f8 add rax, rdi
1458ba306 f34d0f2ce8 cvttss2si r13, xmm8
1458ba30b 450f2ec1 ucomiss xmm8, xmm9
1458ba30f 440f42e9 cmovb r13d, ecx
1458ba313 31ff xor edi, edi
1458ba315 450f2ec2 ucomiss xmm8, xmm10
1458ba319 b9ffffffff mov ecx, 0xffffffff
1458ba31e 440f47e9 cmova r13d, ecx
1458ba322 0f57c0 xorps xmm0, xmm0
1458ba325 f3480f2ac0 cvtsi2ss xmm0, rax
1458ba32a f3410f598750110000 mulss xmm0, dword ptr [r15 + 0x1150]
1458ba333 e8e5003500 call 0x145c0a41d
1458ba338 f3480f2cc0 cvttss2si rax, xmm0
1458ba33d 410f2ec3 ucomiss xmm0, xmm11
1458ba341 480f47c6 cmova rax, rsi
1458ba345 0f2ec0 ucomiss xmm0, xmm0
1458ba348 480f4ac7 cmovp rax, rdi
1458ba34c 48894508 mov qword ptr [rbp + 8], rax
1458ba3f5 4489e0 mov eax, r12d
1458ba3f8 83e003 and eax, 3
1458ba3fb b904000000 mov ecx, 4
1458ba400 480f45c8 cmovne rcx, rax
1458ba404 4c89e0 mov rax, r12
1458ba407 4829c8 sub rax, rcx
1458ba40a 498d4b28 lea rcx, [r11 + 0x28]
1458ba40e 0f57c0 xorps xmm0, xmm0
1458ba411 4889c2 mov rdx, rax
1458ba414 0f57c9 xorps xmm1, xmm1
1458ba417 660f1f840000000000 nop word ptr [rax + rax]
1458ba420 f30f7e51f0 movq xmm2, qword ptr [rcx - 0x10]
1458ba425 f30f6f59e0 movdqu xmm3, xmmword ptr [rcx - 0x20]
1458ba42a 660f6cda punpcklqdq xmm3, xmm2
1458ba42e 660fd4cb paddq xmm1, xmm3
1458ba432 f30f6f11 movdqu xmm2, xmmword ptr [rcx]
1458ba436 f30f7e5910 movq xmm3, qword ptr [rcx + 0x10]
1458ba43b 660f6cd3 punpcklqdq xmm2, xmm3
1458ba43f 660fd4c2 paddq xmm0, xmm2
1458ba443 4883c140 add rcx, 0x40
1458ba447 4883c2fc add rdx, -4
1458ba44b 75d3 jne 0x1458ba420
1458ba44d 660fd4c1 paddq xmm0, xmm1
1458ba451 660f70c8ee pshufd xmm1, xmm0, 0xee
1458ba456 660fd4c8 paddq xmm1, xmm0
1458ba45a 66480f7ec9 movq rcx, xmm1
1458ba45f 4889c2 mov rdx, rax
1458ba462 48c1e204 shl rdx, 4
1458ba466 4c01da add rdx, r11
1458ba469 4883c208 add rdx, 8
1458ba46d 0f1f00 nop dword ptr [rax]
1458ba470 48030a add rcx, qword ptr [rdx]
1458ba473 48ffc0 inc rax
1458ba476 4883c210 add rdx, 0x10
1458ba47a 4939c4 cmp r12, rax
1458ba47d 75f1 jne 0x1458ba470
1458ba47f 4531c0 xor r8d, r8d
1458ba482 4885c9 test rcx, rcx
1458ba485 4c0f4fc1 cmovg r8, rcx
1458ba489 4489853c010000 mov dword ptr [rbp + 0x13c], r8d
1458ba490 488b4508 mov rax, qword ptr [rbp + 8]
1458ba494 48894730 mov qword ptr [rdi + 0x30], rax
1458ba498 0f1045d8 movups xmm0, xmmword ptr [rbp - 0x28]
1458ba49c 0f104de8 movups xmm1, xmmword ptr [rbp - 0x18]
1458ba4a0 0f1055f8 movups xmm2, xmmword ptr [rbp - 8]
1458ba4a4 0f115720 movups xmmword ptr [rdi + 0x20], xmm2
1458ba4a8 0f114f10 movups xmmword ptr [rdi + 0x10], xmm1
1458ba4ac 0f1107 movups xmmword ptr [rdi], xmm0
1458ba4af 41b101 mov r9b, 1
1458ba4b2 4881fbffffff00 cmp rbx, 0xffffff
1458ba4b9 410f95c6 setne r14b
1458ba4bd 0f849c0b0000 je 0x1458bb05f
1458ba4c3 4585c0 test r8d, r8d
1458ba4c6 0f84930b0000 je 0x1458bb05f
1458ba4cc 498dbf380b0000 lea rdi, [r15 + 0xb38]
1458ba4d3 498b87a00b0000 mov rax, qword ptr [r15 + 0xba0]
1458ba4da 498b8fa80b0000 mov rcx, qword ptr [r15 + 0xba8]
1458ba4e1 48c1e105 shl rcx, 5
1458ba4e5 4531d2 xor r10d, r10d
1458ba4e8 488b9568010000 mov rdx, qword ptr [rbp + 0x168]
1458ba4ef 4c896d30 mov qword ptr [rbp + 0x30], r13
1458ba4f3 4c899dd0000000 mov qword ptr [rbp + 0xd0], r11
1458ba4fa 660f1f440000 nop word ptr [rax + rax]
1458ba500 4c39d1 cmp rcx, r10
1458ba503 7419 je 0x1458ba51e
1458ba505 4d8d4a20 lea r9, [r10 + 0x20]
1458ba509 4238541004 cmp byte ptr [rax + r10 + 4], dl
1458ba50e 4d89ca mov r10, r9
1458ba511 75ed jne 0x1458ba500
1458ba513 428b4408e0 mov eax, dword ptr [rax + r9 - 0x20]
1458ba518 48894528 mov qword ptr [rbp + 0x28], rax
1458ba51c eb08 jmp 0x1458ba526
1458ba51e 48c7452800000000 mov qword ptr [rbp + 0x28], 0
1458ba526 c6858701000001 mov byte ptr [rbp + 0x187], 1
1458ba52d 4889f9 mov rcx, rdi
1458ba530 e8ab8a0100 call 0x1458d2fe0
1458ba535 90 nop
1458ba536 89c6 mov esi, eax
1458ba538 4189d6 mov r14d, edx
1458ba53b c6858701000001 mov byte ptr [rbp + 0x187], 1
1458ba542 4889f9 mov rcx, rdi
1458ba545 e8b6f00100 call 0x1458d9600
1458bb05f 4d8da7380b0000 lea r12, [r15 + 0xb38]
1458bb066 498b87400b0000 mov rax, qword ptr [r15 + 0xb40]
1458bb06d 496b97480b000038 imul rdx, qword ptr [r15 + 0xb48], 0x38
1458bb075 31c9 xor ecx, ecx
1458bb077 4989c0 mov r8, rax
1458bb07a 660f1f440000 nop word ptr [rax + rax]
1458bb080 4839ca cmp rdx, rcx
1458bb083 7437 je 0x1458bb0bc
1458bb085 4883c138 add rcx, 0x38
1458bb089 49395818 cmp qword ptr [r8 + 0x18], rbx
1458bb08d 4d8d4038 lea r8, [r8 + 0x38]
1458bb091 75ed jne 0x1458bb080
1458bb093 8b5408e8 mov edx, dword ptr [rax + rcx - 0x18]
1458bb097 448b85c0000000 mov r8d, dword ptr [rbp + 0xc0]
1458bb09e 4139d0 cmp r8d, edx
1458bb0a1 410f47d0 cmova edx, r8d
1458bb0a5 448b4408ec mov r8d, dword ptr [rax + rcx - 0x14]
1458bb0aa 895408e8 mov dword ptr [rax + rcx - 0x18], edx
1458bb0ae 4539c5 cmp r13d, r8d
1458bb0b1 450f47c5 cmova r8d, r13d
1458bb0b5 44894408ec mov dword ptr [rax + rcx - 0x14], r8d
1458bb0ba eb2c jmp 0x1458bb0e8
1458bb0bc 4983bf100f0000ff cmp qword ptr [r15 + 0xf10], -1
1458bb0c4 7422 je 0x1458bb0e8
1458bb0c6 49399f280f0000 cmp qword ptr [r15 + 0xf28], rbx
1458bb0cd 7519 jne 0x1458bb0e8
1458bb0cf 418b87300f0000 mov eax, dword ptr [r15 + 0xf30]
1458bb0d6 8b8dc0000000 mov ecx, dword ptr [rbp + 0xc0]
1458bb0dc 39c1 cmp ecx, eax
1458bb0de 0f47c1 cmova eax, ecx
1458bb0e1 418987300f0000 mov dword ptr [r15 + 0xf30], eax
1458bb0e8 4180bf9211000000 cmp byte ptr [r15 + 0x1192], 0
1458bb0f0 7418 je 0x1458bb10a
1458bb0f2 44888d87010000 mov byte ptr [rbp + 0x187], r9b
1458bb0f9 4c89e1 mov rcx, r12
1458bb0fc 4489ce mov esi, r9d
1458bb0ff e8fce40100 call 0x1458d9600
1458bb104 90 nop
1458bb105 e9df070000 jmp 0x1458bb8e9
1458bb10a 44898d78010000 mov dword ptr [rbp + 0x178], r9d
1458bb111 41c6879211000001 mov byte ptr [r15 + 0x1192], 1
1458bb119 44847538 test byte ptr [rbp + 0x38], r14b
1458bb11d 0f8436070000 je 0x1458bb859
1458bb123 488b8db0000000 mov rcx, qword ptr [rbp + 0xb0]
1458bb12a 488b95b8000000 mov rdx, qword ptr [rbp + 0xb8]
1458bb131 e88adcfdff call 0x145898dc0
1458bb136 4883f80a cmp rax, 0xa
1458bb13a 0f8719070000 ja 0x1458bb859
1458bb140 488d5001 lea rdx, [rax + 1]
1458bb144 4869caf0000000 imul rcx, rdx, 0xf0
1458bb14b 4c8d2dde743301 lea r13, [rip + 0x13374de]
1458bb152 4901cd add r13, rcx
1458bb155 498b8f580b0000 mov rcx, qword ptr [r15 + 0xb58]
1458bb15c 498bb7600b0000 mov rsi, qword ptr [r15 + 0xb60]
1458bb163 4889f7 mov rdi, rsi
1458bb166 48c1e704 shl rdi, 4
1458bb16a 4531c0 xor r8d, r8d
1458bb16d 4c8b9568010000 mov r10, qword ptr [rbp + 0x168]
1458bb174 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1458bb180 4c39c7 cmp rdi, r8
1458bb183 742e je 0x1458bb1b3
1458bb185 4d8d4810 lea r9, [r8 + 0x10]
1458bb189 46381401 cmp byte ptr [rcx + r8], r10b
1458bb18d 4d89c8 mov r8, r9
1458bb190 75ee jne 0x1458bb180
1458bb192 4e8b4c09f8 mov r9, qword ptr [rcx + r9 - 8]
1458bb197 4983f90c cmp r9, 0xc
1458bb19b 41b80c000000 mov r8d, 0xc
1458bb1a1 4d0f42c1 cmovb r8, r9
1458bb1a5 4d85c9 test r9, r9
1458bb1a8 7409 je 0x1458bb1b3
1458bb1aa 4939d0 cmp r8, rdx
1458bb1ad 0f87a6060000 ja 0x1458bb859
1458bb1b3 31d2 xor edx, edx
1458bb1b5 4c8b8d68010000 mov r9, qword ptr [rbp + 0x168]
1458bb1bc 0f1f4000 nop dword ptr [rax]
1458bb1c0 4839d7 cmp rdi, rdx
1458bb1c3 7418 je 0x1458bb1dd
1458bb1c5 4c8d4210 lea r8, [rdx + 0x10]
1458bb1c9 44380c11 cmp byte ptr [rcx + rdx], r9b
1458bb1cd 4c89c2 mov rdx, r8
1458bb1d0 75ee jne 0x1458bb1c0
1458bb1d2 4883c002 add rax, 2
1458bb1d6 4a894401f8 mov qword ptr [rcx + r8 - 8], rax
1458bb1db eb4d jmp 0x1458bb22a
1458bb1dd 493bb7500b0000 cmp rsi, qword ptr [r15 + 0xb50]
1458bb1e4 752d jne 0x1458bb213
1458bb1e6 4889c3 mov rbx, rax
1458bb1e9 498d8f500b0000 lea rcx, [r15 + 0xb50]
1458bb1f0 8b8578010000 mov eax, dword ptr [rbp + 0x178]
1458bb1f6 888587010000 mov byte ptr [rbp + 0x187], al
1458bb1fc e8af2a3500 call 0x145c0dcb0
1458bb201 90 nop
1458bb202 498b8f580b0000 mov rcx, qword ptr [r15 + 0xb58]
1458bb209 4889d8 mov rax, rbx
1458bb20c 4c8b8d68010000 mov r9, qword ptr [rbp + 0x168]
1458bb213 4883c002 add rax, 2
1458bb217 44880c39 mov byte ptr [rcx + rdi], r9b
1458bb21b 4889443908 mov qword ptr [rcx + rdi + 8], rax
1458bb220 48ffc6 inc rsi
1458bb223 4989b7600b0000 mov qword ptr [r15 + 0xb60], rsi
1458bb22a 8b8578010000 mov eax, dword ptr [rbp + 0x178]
1458bb230 888587010000 mov byte ptr [rbp + 0x187], al
1458bb236 4c89e1 mov rcx, r12
1458bb239 e8c2e30100 call 0x1458d9600
1458bb859 498b87400b0000 mov rax, qword ptr [r15 + 0xb40]
1458bb860 496b97480b000038 imul rdx, qword ptr [r15 + 0xb48], 0x38
1458bb868 31c9 xor ecx, ecx
1458bb86a 4989c0 mov r8, rax
1458bb86d 448b8d78010000 mov r9d, dword ptr [rbp + 0x178]
1458bb874 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1458bb880 4839ca cmp rdx, rcx
1458bb883 741a je 0x1458bb89f
1458bb885 4883c138 add rcx, 0x38
1458bb889 49395818 cmp qword ptr [r8 + 0x18], rbx
1458bb88d 4d8d4038 lea r8, [r8 + 0x38]
1458bb891 75ed jne 0x1458bb880
1458bb893 ff4408f0 inc dword ptr [rax + rcx - 0x10]
1458bb897 488b5538 mov rdx, qword ptr [rbp + 0x38]
1458bb89b 015408f4 add dword ptr [rax + rcx - 0xc], edx
1458bb89f 4584f6 test r14b, r14b
1458bb8a2 7432 je 0x1458bb8d6
1458bb8a4 498b87e80c0000 mov rax, qword ptr [r15 + 0xce8]
1458bb8ab 48ffc0 inc rax
1458bb8ae 48c7c1ffffffff mov rcx, 0xffffffffffffffff
1458bb8b5 480f44c1 cmove rax, rcx
1458bb8b9 498987e80c0000 mov qword ptr [r15 + 0xce8], rax
1458bb8c0 488b4538 mov rax, qword ptr [rbp + 0x38]
1458bb8c4 490387f00c0000 add rax, qword ptr [r15 + 0xcf0]
1458bb8cb 480f42c1 cmovb rax, rcx
1458bb8cf 498987f00c0000 mov qword ptr [r15 + 0xcf0], rax
1458bb8d6 44888d87010000 mov byte ptr [rbp + 0x187], r9b
1458bb8dd 4c89e1 mov rcx, r12
1458bb8e0 4489ce mov esi, r9d
1458bb8e3 e818dd0100 call 0x1458d9600
1458bb8e8 90 nop
1459da4d6 4c39f6 cmp rsi, r14
1459da4d9 0f8346010000 jae 0x1459da625
1459da4df 4883fe07 cmp rsi, 7
1459da4e3 0f8365010000 jae 0x1459da64e
1459da4e9 4c8b02 mov r8, qword ptr [rdx]
1459da4ec 4c8b5a08 mov r11, qword ptr [rdx + 8]
1459da4f0 4c8d4e01 lea r9, [rsi + 1]
1459da4f4 498b14f0 mov rdx, qword ptr [r8 + rsi*8]
1459da4f8 492b14f3 sub rdx, qword ptr [r11 + rsi*8]
1459da4fc 488930 mov qword ptr [rax], rsi
1459da4ff 48895008 mov qword ptr [rax + 8], rdx
1459da503 ba01000000 mov edx, 1
1459da508 4d39f1 cmp r9, r14
1459da50b 0f8416010000 je 0x1459da627
1459da511 4883fe06 cmp rsi, 6
1459da515 0f842b010000 je 0x1459da646
1459da51b 4c8d5602 lea r10, [rsi + 2]
1459da51f 498b54f008 mov rdx, qword ptr [r8 + rsi*8 + 8]
1459da524 492b54f308 sub rdx, qword ptr [r11 + rsi*8 + 8]
1459da529 4c894810 mov qword ptr [rax + 0x10], r9
1459da52d 48895018 mov qword ptr [rax + 0x18], rdx
1459da531 ba02000000 mov edx, 2
1459da536 4d39f2 cmp r10, r14
1459da539 0f84e8000000 je 0x1459da627
1459da53f 4883fe04 cmp rsi, 4
1459da543 0f8702010000 ja 0x1459da64b
1459da549 4c8d4e03 lea r9, [rsi + 3]
1459da54d 498b54f010 mov rdx, qword ptr [r8 + rsi*8 + 0x10]
1459da552 492b54f310 sub rdx, qword ptr [r11 + rsi*8 + 0x10]
1459da557 4c895020 mov qword ptr [rax + 0x20], r10
1459da55b 48895028 mov qword ptr [rax + 0x28], rdx
1459da55f ba03000000 mov edx, 3
1459da564 4d39f1 cmp r9, r14
1459da567 0f84ba000000 je 0x1459da627
1459da56d 4883fe04 cmp rsi, 4
1459da571 0f84cf000000 je 0x1459da646
1459da577 4c8d5604 lea r10, [rsi + 4]
1459da57b 498b54f018 mov rdx, qword ptr [r8 + rsi*8 + 0x18]
1459da580 492b54f318 sub rdx, qword ptr [r11 + rsi*8 + 0x18]
1459da585 4c894830 mov qword ptr [rax + 0x30], r9
1459da589 48895038 mov qword ptr [rax + 0x38], rdx
1459da58d ba04000000 mov edx, 4
1459da592 4d39f2 cmp r10, r14
1459da595 0f848c000000 je 0x1459da627
1459da59b 4883fe02 cmp rsi, 2
1459da59f 0f87a6000000 ja 0x1459da64b
1459da5a5 4c8d4e05 lea r9, [rsi + 5]
1459da5a9 498b54f020 mov rdx, qword ptr [r8 + rsi*8 + 0x20]
1459da5ae 492b54f320 sub rdx, qword ptr [r11 + rsi*8 + 0x20]
1459da5b3 4c895040 mov qword ptr [rax + 0x40], r10
1459da5b7 48895048 mov qword ptr [rax + 0x48], rdx
1459da5bb ba05000000 mov edx, 5
1459da5c0 4d39f1 cmp r9, r14
1459da5c3 7462 je 0x1459da627
1459da5c5 4883fe02 cmp rsi, 2
1459da5c9 747b je 0x1459da646
1459da5cb 4c8d5606 lea r10, [rsi + 6]
1459da5cf 498b54f028 mov rdx, qword ptr [r8 + rsi*8 + 0x28]
1459da5d4 492b54f328 sub rdx, qword ptr [r11 + rsi*8 + 0x28]
1459da5d9 4c894850 mov qword ptr [rax + 0x50], r9
1459da5dd 48895058 mov qword ptr [rax + 0x58], rdx
1459da5e1 ba06000000 mov edx, 6
1459da5e6 4d39f2 cmp r10, r14
1459da5e9 743c je 0x1459da627
1459da5eb 4885f6 test rsi, rsi
1459da5ee 755b jne 0x1459da64b
1459da5f0 498b54f030 mov rdx, qword ptr [r8 + rsi*8 + 0x30]
1459da5f5 492b54f330 sub rdx, qword ptr [r11 + rsi*8 + 0x30]
1459da5fa 4c895060 mov qword ptr [rax + 0x60], r10
1459da5fe 48895068 mov qword ptr [rax + 0x68], rdx
1459da602 be07000000 mov esi, 7
1459da607 ba07000000 mov edx, 7
1459da60c 4983fe07 cmp r14, 7
1459da610 7415 je 0x1459da627
1459da612 eb3a jmp 0x1459da64e
1459da614 b808000000 mov eax, 8
1459da619 4531ed xor r13d, r13d
1459da61c 4c39f6 cmp rsi, r14
1459da61f 0f82bafeffff jb 0x1459da4df
1459da625 31d2 xor edx, edx
1459da627 4c8929 mov qword ptr [rcx], r13
1459da62a 48894108 mov qword ptr [rcx + 8], rax
1459da62e 48895110 mov qword ptr [rcx + 0x10], rdx
1459da632 4889c8 mov rax, rcx
1458d2fe0 4157 push r15
1458d2fe2 4156 push r14
1458d2fe4 56 push rsi
1458d2fe5 57 push rdi
1458d2fe6 55 push rbp
1458d2fe7 53 push rbx
1458d2fe8 4883ec28 sub rsp, 0x28
1458d2fec 4c8b4968 mov r9, qword ptr [rcx + 0x68]
1458d2ff0 488b7170 mov rsi, qword ptr [rcx + 0x70]
1458d2ff4 4889f7 mov rdi, rsi
1458d2ff7 48c1e705 shl rdi, 5
1458d2ffb 4531d2 xor r10d, r10d
1458d2ffe 31c0 xor eax, eax
1458d3000 4839c7 cmp rdi, rax
1458d3003 7413 je 0x1458d3018
1458d3005 4c8d5820 lea r11, [rax + 0x20]
1458d3009 4138540104 cmp byte ptr [r9 + rax + 4], dl
1458d300e 4c89d8 mov rax, r11
1458d3011 75ed jne 0x1458d3000
1458d3013 478b5419e0 mov r10d, dword ptr [r9 + r11 - 0x20]
1458d3018 41bb6e000000 mov r11d, 0x6e
1458d301e b802000000 mov eax, 2
1458d3023 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1458d3030 418d5be2 lea ebx, [r11 - 0x1e]
1458d3034 4129da sub r10d, ebx
1458d3037 7225 jb 0x1458d305e
1458d3039 418d5bf1 lea ebx, [r11 - 0xf]
1458d303d 4129da sub r10d, ebx
1458d3040 7221 jb 0x1458d3063
1458d3042 4529da sub r10d, r11d
1458d3045 721e jb 0x1458d3065
1458d3047 4183c32d add r11d, 0x2d
1458d304b 83c003 add eax, 3
1458d304e 4181fb6b030000 cmp r11d, 0x36b
1458d3055 75d9 jne 0x1458d3030
1458d3057 b833000000 mov eax, 0x33
1458d305c eb07 jmp 0x1458d3065
1458d305e 83c0fe add eax, -2
1458d3061 eb02 jmp 0x1458d3065
1458d3063 ffc8 dec eax
1458d3065 4531d2 xor r10d, r10d
1458d3068 0f1f840000000000 nop dword ptr [rax + rax]
1458d3070 4c39d7 cmp rdi, r10
1458d3073 7423 je 0x1458d3098
1458d3075 4d8d5a20 lea r11, [r10 + 0x20]
1458d3079 4338541104 cmp byte ptr [r9 + r10 + 4], dl
1458d307e 4d89da mov r10, r11
1458d3081 75ed jne 0x1458d3070
1458d3083 47034419e0 add r8d, dword ptr [r9 + r11 - 0x20]
1458d3088 b9ffffffff mov ecx, 0xffffffff
1458d308d 410f43c8 cmovae ecx, r8d
1458d3091 43894c19e0 mov dword ptr [r9 + r11 - 0x20], ecx
1458d3096 eb5b jmp 0x1458d30f3
1458d3098 483b7160 cmp rsi, qword ptr [rcx + 0x60]
1458d309c 7526 jne 0x1458d30c4
1458d309e 4c8d4960 lea r9, [rcx + 0x60]
1458d30a2 4889cb mov rbx, rcx
1458d30a5 4c89c9 mov rcx, r9
1458d30a8 89c5 mov ebp, eax
1458d30aa 4189d7 mov r15d, edx
1458d30ad 4589c6 mov r14d, r8d
1458d30b0 e81bab3300 call 0x145c0dbd0
1458d30b5 4589f0 mov r8d, r14d
1458d30b8 4889d9 mov rcx, rbx
1458d30bb 4489fa mov edx, r15d
1458d30be 89e8 mov eax, ebp
1458d30c0 4c8b4b68 mov r9, qword ptr [rbx + 0x68]
1458d30c4 45890439 mov dword ptr [r9 + rdi], r8d
1458d30c8 4188543904 mov byte ptr [r9 + rdi + 4], dl
1458d30cd 49c744390800000000 mov qword ptr [r9 + rdi + 8], 0
1458d30d6 49c744391008000000 mov qword ptr [r9 + rdi + 0x10], 8
1458d30df 49c744391800000000 mov qword ptr [r9 + rdi + 0x18], 0
1458d30e8 48ffc6 inc rsi
1458d30eb 48897170 mov qword ptr [rcx + 0x70], rsi
1458d30ef 4c8b4968 mov r9, qword ptr [rcx + 0x68]
1458d30f3 48c1e605 shl rsi, 5
1458d30f7 31c9 xor ecx, ecx
1458d30f9 4531c0 xor r8d, r8d
1458d30fc 0f1f4000 nop dword ptr [rax]
1458d3100 4c39c6 cmp rsi, r8
1458d3103 7413 je 0x1458d3118
1458d3105 4d8d5020 lea r10, [r8 + 0x20]
1458d3109 4338540104 cmp byte ptr [r9 + r8 + 4], dl
1458d310e 4d89d0 mov r8, r10
1458d3111 75ed jne 0x1458d3100
1458d3113 438b4c11e0 mov ecx, dword ptr [r9 + r10 - 0x20]
1458d3118 41b86e000000 mov r8d, 0x6e
1458d311e ba02000000 mov edx, 2
1458d3123 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1458d3130 458d48e2 lea r9d, [r8 - 0x1e]
1458d3134 4429c9 sub ecx, r9d
1458d3137 7225 jb 0x1458d315e
1458d3139 458d48f1 lea r9d, [r8 - 0xf]
1458d313d 4429c9 sub ecx, r9d
1458d3140 7221 jb 0x1458d3163
1458d3142 4429c1 sub ecx, r8d
1458d3145 721e jb 0x1458d3165
1458d3147 4183c02d add r8d, 0x2d
1458d314b 83c203 add edx, 3
1458d314e 4181f86b030000 cmp r8d, 0x36b
1458d3155 75d9 jne 0x1458d3130
1458d3157 ba33000000 mov edx, 0x33
1458d315c eb07 jmp 0x1458d3165
1458d315e 83c2fe add edx, -2
1458d3161 eb02 jmp 0x1458d3165
1458d3163 ffca dec edx
1458d3165 4883c428 add rsp, 0x28
1458d3169 5b pop rbx
1458d316a 5d pop rbp
1458d316b 5f pop rdi
1458d316c 5e pop rsi
1458d316d 415e pop r14
1458d316f 415f pop r15
1458d3171 c3 ret
1458b0828 41833c2402 cmp dword ptr [r12], 2
1458b082d 488bb568050000 mov rsi, qword ptr [rbp + 0x568]
1458b0834 0f845d050000 je 0x1458b0d97
1458b083a 0fb686ef0a0000 movzx eax, byte ptr [rsi + 0xaef]
1458b0841 89c1 mov ecx, eax
1458b0843 80e106 and cl, 6
1458b0846 80f904 cmp cl, 4
1458b0849 750c jne 0x1458b0857
1458b084b 388696110000 cmp byte ptr [rsi + 0x1196], al
1458b0851 0f8539020000 jne 0x1458b0a90
1458b0a90 888696110000 mov byte ptr [rsi + 0x1196], al
1458b0a96 4889f1 mov rcx, rsi
1458b0a99 e812950000 call 0x1458b9fb0
1458b0a9e 837e1002 cmp dword ptr [rsi + 0x10], 2
1458b0aa2 0f84ef020000 je 0x1458b0d97
1458b0aa8 4881bed0100000ffffff00 cmp qword ptr [rsi + 0x10d0], 0xffffff
1458b0ab3 0f8472130000 je 0x1458b1e2b
1458b0ab9 80bee80a000000 cmp byte ptr [rsi + 0xae8], 0
1458b0ac0 0f8565130000 jne 0x1458b1e2b
1458b0ac6 8bbe9c070000 mov edi, dword ptr [rsi + 0x79c]
1458b0acc 448bb6ac070000 mov r14d, dword ptr [rsi + 0x7ac]
1458b0ad3 448bbea4070000 mov r15d, dword ptr [rsi + 0x7a4]
1458b0ada 448ba6a8070000 mov r12d, dword ptr [rsi + 0x7a8]
1458b0ae1 448baeb0070000 mov r13d, dword ptr [rsi + 0x7b0]
1458b0ae8 0fb69e2c030000 movzx ebx, byte ptr [rsi + 0x32c]
1458b0aef 488b8eb8020000 mov rcx, qword ptr [rsi + 0x2b8]
1458b0af6 488b96c0020000 mov rdx, qword ptr [rsi + 0x2c0]
1458b0afd e8be82feff call 0x145898dc0
1458b0b02 31c9 xor ecx, ecx
1458b0b04 4189f8 mov r8d, edi
1458b0b07 442b8654110000 sub r8d, dword ptr [rsi + 0x1154]
1458b0b0e 440f42c1 cmovb r8d, ecx
1458b0b12 4c0386c80c0000 add r8, qword ptr [rsi + 0xcc8]
1458b0b19 4c8d8e380b0000 lea r9, [rsi + 0xb38]
1458b0b20 48c7c2ffffffff mov rdx, 0xffffffffffffffff
1458b0b27 4c0f42c2 cmovb r8, rdx
1458b0b2b 4c8986c80c0000 mov qword ptr [rsi + 0xcc8], r8
1458b0b32 4589f0 mov r8d, r14d
1458b0b35 442b8658110000 sub r8d, dword ptr [rsi + 0x1158]
1458b0b3c 440f42c1 cmovb r8d, ecx
1458b0b40 4c0386d00c0000 add r8, qword ptr [rsi + 0xcd0]
1458b0b47 4c0f42c2 cmovb r8, rdx
1458b0b4b 4c8986d00c0000 mov qword ptr [rsi + 0xcd0], r8
1458b0b52 4589f8 mov r8d, r15d
1458b0b55 442b865c110000 sub r8d, dword ptr [rsi + 0x115c]
1458b0b5c 440f42c1 cmovb r8d, ecx
1458b0b60 4c0386d80c0000 add r8, qword ptr [rsi + 0xcd8]
1458b0b67 4c0f42c2 cmovb r8, rdx
1458b0b6b 4c8986d80c0000 mov qword ptr [rsi + 0xcd8], r8
1458b0b72 4589e0 mov r8d, r12d
1458b0b75 442b8660110000 sub r8d, dword ptr [rsi + 0x1160]
1458b0b7c 440f42c1 cmovb r8d, ecx
1458b0b80 4c0386e00c0000 add r8, qword ptr [rsi + 0xce0]
1458b0b87 4c0f42c2 cmovb r8, rdx
1458b0b8b 4c8986e00c0000 mov qword ptr [rsi + 0xce0], r8
1458b0b92 4589e8 mov r8d, r13d
1458b0b95 442b8664110000 sub r8d, dword ptr [rsi + 0x1164]
1458b0b9c 440f42c1 cmovb r8d, ecx
1458b0ba0 4c0386f80c0000 add r8, qword ptr [rsi + 0xcf8]
1458b0ba7 4c0f42c2 cmovb r8, rdx
1458b0bab 83be9809000000 cmp dword ptr [rsi + 0x998], 0
1458b0bb2 4c8986f80c0000 mov qword ptr [rsi + 0xcf8], r8
1458b0bb9 89be54110000 mov dword ptr [rsi + 0x1154], edi
1458b0bbf 4489b658110000 mov dword ptr [rsi + 0x1158], r14d
1458b0bc6 4489be5c110000 mov dword ptr [rsi + 0x115c], r15d
1458b0bcd 4489a660110000 mov dword ptr [rsi + 0x1160], r12d
1458b0bd4 4489ae64110000 mov dword ptr [rsi + 0x1164], r13d
1458b0bdb 4c89ce mov rsi, r9
1458b0bde 740d je 0x1458b0bed
1458b0be0 4889f1 mov rcx, rsi
1458b0be3 89da mov edx, ebx
1458b0be5 4989c0 mov r8, rax
1458b0be8 e893290200 call 0x1458d3580
1458b1d05 c6855f05000001 mov byte ptr [rbp + 0x55f], 1
1458b1d0c e8df643000 call 0x145bb81f0
1458b1d11 90 nop
1458b1d12 8985b0030000 mov dword ptr [rbp + 0x3b0], eax
1458b1d18 8995b4030000 mov dword ptr [rbp + 0x3b4], edx
1458b1d1e c6855f05000001 mov byte ptr [rbp + 0x55f], 1
1458b1d25 488d8da0000000 lea rcx, [rbp + 0xa0]
1458b1d2c 488d95b0030000 lea rdx, [rbp + 0x3b0]
1458b1d33 41b800803ed5 mov r8d, 0xd53e8000
1458b1d39 41b9deb19d01 mov r9d, 0x19db1de
1458b1d3f e85c643000 call 0x145bb81a0
1458b1d44 90 nop
1458b1d45 80bda000000000 cmp byte ptr [rbp + 0xa0], 0
1458b1d4c 7509 jne 0x1458b1d57
1458b1d4e 4c8b8da8000000 mov r9, qword ptr [rbp + 0xa8]
1458b1d55 eb03 jmp 0x1458b1d5a
1458b1d57 4531c9 xor r9d, r9d
1458b1d5a c6855f05000001 mov byte ptr [rbp + 0x55f], 1
1458b1d61 488d8da0000000 lea rcx, [rbp + 0xa0]
1458b1d68 41b801000000 mov r8d, 1
1458b1d6e 4889f2 mov rdx, rsi
1458b1d71 e89a461000 call 0x1459b6410
1458b1dee c6855f05000001 mov byte ptr [rbp + 0x55f], 1
1458b1df5 4889f1 mov rcx, rsi
1458b1df8 e803780200 call 0x1458d9600
1458d3580 4157 push r15
1458d3582 4156 push r14
1458d3584 4154 push r12
1458d3586 56 push rsi
1458d3587 57 push rdi
1458d3588 53 push rbx
1458d3589 4883ec28 sub rsp, 0x28
1458d358d 4c89c7 mov rdi, r8
1458d3590 89d3 mov ebx, edx
1458d3592 4889ce mov rsi, rcx
1458d3595 488b81e0000000 mov rax, qword ptr [rcx + 0xe0]
1458d359c 4c8bb9e8000000 mov r15, qword ptr [rcx + 0xe8]
1458d35a3 4d89fc mov r12, r15
1458d35a6 4d85ff test r15, r15
1458d35a9 7479 je 0x1458d3624
1458d35ab 4531e4 xor r12d, r12d
1458d35ae 4983ff01 cmp r15, 1
1458d35b2 744a je 0x1458d35fe
1458d35b4 4c89f9 mov rcx, r15
1458d35b7 660f1f840000000000 nop word ptr [rax + rax]
1458d35c0 4c89e2 mov rdx, r12
1458d35c3 4989c8 mov r8, rcx
1458d35c6 49d1e8 shr r8, 1
1458d35c9 4d01c4 add r12, r8
1458d35cc 4d89e1 mov r9, r12
1458d35cf 49c1e104 shl r9, 4
1458d35d3 4531d2 xor r10d, r10d
1458d35d6 4a397c0808 cmp qword ptr [rax + r9 + 8], rdi
1458d35db 410f97c2 seta r10b
1458d35df 4531db xor r11d, r11d
1458d35e2 42381c08 cmp byte ptr [rax + r9], bl
1458d35e6 410f97c3 seta r11b
1458d35ea 450f44da cmove r11d, r10d
1458d35ee 4584db test r11b, r11b
1458d35f1 4c0f45e2 cmovne r12, rdx
1458d35f5 4c29c1 sub rcx, r8
1458d35f8 4883f901 cmp rcx, 1
1458d35fc 77c2 ja 0x1458d35c0
1458d35fe 4c89e1 mov rcx, r12
1458d3601 48c1e104 shl rcx, 4
1458d3605 381c08 cmp byte ptr [rax + rcx], bl
1458d3608 7505 jne 0x1458d360f
1458d360a 48397c0808 cmp qword ptr [rax + rcx + 8], rdi
1458d360f 0f97c1 seta cl
1458d3612 80d900 sbb cl, 0
1458d3615 84c9 test cl, cl
1458d3617 745e je 0x1458d3677
1458d3619 31d2 xor edx, edx
1458d361b 80f9ff cmp cl, 0xff
1458d361e 0f94c2 sete dl
1458d3621 4901d4 add r12, rdx
1458d3624 4c3bbed8000000 cmp r15, qword ptr [rsi + 0xd8]
1458d362b 7513 jne 0x1458d3640
1458d362d 488d8ed8000000 lea rcx, [rsi + 0xd8]
1458d3634 e877a63300 call 0x145c0dcb0
1458d3639 488b86e0000000 mov rax, qword ptr [rsi + 0xe0]
1458d3640 4d89e6 mov r14, r12
1458d3643 49c1e604 shl r14, 4
1458d3647 4901c6 add r14, rax
1458d364a 4d89f8 mov r8, r15
1458d364d 4d29e0 sub r8, r12
1458d3650 7610 jbe 0x1458d3662
1458d3652 498d4e10 lea rcx, [r14 + 0x10]
1458d3656 49c1e004 shl r8, 4
1458d365a 4c89f2 mov rdx, r14
1458d365d e88b6d3300 call 0x145c0a3ed
1458d3662 41881e mov byte ptr [r14], bl
1458d3665 49897e08 mov qword ptr [r14 + 8], rdi
1458d3669 49ffc7 inc r15
1458d366c 4c89bee8000000 mov qword ptr [rsi + 0xe8], r15
1458d3673 b001 mov al, 1
1458d3675 eb02 jmp 0x1458d3679
1458d3677 31c0 xor eax, eax
1458d3679 4883c428 add rsp, 0x28
1458d367d 5b pop rbx
1458d367e 5f pop rdi
1458d367f 5e pop rsi
1458d3680 415c pop r12
1458d3682 415e pop r14
1458d3684 415f pop r15
1458d3686 c3 ret
1458d9600 55 push rbp
1458d9601 4157 push r15
1458d9603 4156 push r14
1458d9605 56 push rsi
1458d9606 57 push rdi
1458d9607 53 push rbx
1458d9608 4881ec58020000 sub rsp, 0x258
1458d960f 488dac2480000000 lea rbp, [rsp + 0x80]
1458d9617 48c785d0010000feffffff mov qword ptr [rbp + 0x1d0], 0xfffffffffffffffe
1458d9622 4889cf mov rdi, rcx
1458d9625 488d8d88010000 lea rcx, [rbp + 0x188]
1458d962c 4889fa mov rdx, rdi
1458d962f e81c0c0000 call 0x1458da250
1458d9634 488b9590010000 mov rdx, qword ptr [rbp + 0x190]
1458d963b 488b9d98010000 mov rbx, qword ptr [rbp + 0x198]
1458d9642 488d8d70010000 lea rcx, [rbp + 0x170]
1458d9649 488995b0010000 mov qword ptr [rbp + 0x1b0], rdx
1458d9650 4989d8 mov r8, rbx
1458d9653 e858a10900 call 0x1459737b0
1458d9658 90 nop
1458d9659 488b9578010000 mov rdx, qword ptr [rbp + 0x178]
1458d9660 488bb580010000 mov rsi, qword ptr [rbp + 0x180]
1458d9667 488d4da0 lea rcx, [rbp - 0x60]
1458d966b 488995b8010000 mov qword ptr [rbp + 0x1b8], rdx
1458d9672 4989f0 mov r8, rsi
1458d9675 e8f69c0900 call 0x145973370
1458d967a 90 nop
