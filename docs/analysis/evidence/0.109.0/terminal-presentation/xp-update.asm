1400cedcb f30f10725c movss xmm6, dword ptr [rdx + 0x5c]
1400cedd0 0f28c6 movaps xmm0, xmm6
1400cedd3 488b85d8000000 mov rax, qword ptr [rbp + 0xd8]
1400cedda f30f5c4028 subss xmm0, dword ptr [rax + 0x28]
1400ceddf 488b95f8000000 mov rdx, qword ptr [rbp + 0xf8]
1400cede6 4c8b82f8000000 mov r8, qword ptr [rdx + 0xf8]
1400ceded 488b8200010000 mov rax, qword ptr [rdx + 0x100]
1400cedf4 4d8d0c80 lea r9, [r8 + rax*4]
1400cedf8 0fb68208010000 movzx eax, byte ptr [rdx + 0x108]
1400cedff 884578 mov byte ptr [rbp + 0x78], al
1400cee02 f30f100d3ae3cf05 movss xmm1, dword ptr [rip + 0x5cfe33a]
1400cee0a f30f58c8 addss xmm1, xmm0
1400cee0e b808000000 mov eax, 8
1400cee13 48894550 mov qword ptr [rbp + 0x50], rax
1400cee17 31f6 xor esi, esi
1400cee19 f30f10150f40d005 movss xmm2, dword ptr [rip + 0x5d0400f]
1400cee21 f30f101d9fe6cc05 movss xmm3, dword ptr [rip + 0x5cce69f]
1400cee29 f30f103d6fe4cc05 movss xmm7, dword ptr [rip + 0x5cce46f]
1400cee31 f30f10258be2cf05 movss xmm4, dword ptr [rip + 0x5cfe28b]
1400cee39 f30f102d3fe5cc05 movss xmm5, dword ptr [rip + 0x5cce53f]
1400cee41 4531db xor r11d, r11d
1400cee44 4531ff xor r15d, r15d
1400cee47 48c785e000000000000000 mov qword ptr [rbp + 0xe0], 0
1400cee52 4531f6 xor r14d, r14d
1400cee55 eb57 jmp 0x1400ceeae
1400cee57 660f1f840000000000 nop word ptr [rax + rax]
1400cee60 8b85d0000000 mov eax, dword ptr [rbp + 0xd0]
1400cee66 8903 mov dword ptr [rbx], eax
1400cee68 f3450f114210 movss dword ptr [r10 + 0x10], xmm8
1400cee6e 440f28cf movaps xmm9, xmm7
1400cee72 f3450f5cc8 subss xmm9, xmm8
1400cee77 450f28c1 movaps xmm8, xmm9
1400cee7b f3450f59c1 mulss xmm8, xmm9
1400cee80 f3450f59c1 mulss xmm8, xmm9
1400cee85 f3440f58c4 addss xmm8, xmm4
1400cee8a f3440f58c7 addss xmm8, xmm7
1400cee8f f3440f59c5 mulss xmm8, xmm5
1400cee94 41890424 mov dword ptr [r12], eax
1400cee98 41c7450001000000 mov dword ptr [r13], 1
1400ceea0 f3450f114504 movss dword ptr [r13 + 4], xmm8
1400ceea6 49c7450801000000 mov qword ptr [r13 + 8], 1
1400cf10e 488b00 mov rax, qword ptr [rax]
1400cf111 4885c0 test rax, rax
1400cf114 781a js 0x1400cf130
1400cf116 450f57c0 xorps xmm8, xmm8
1400cf11a f34c0f2ac0 cvtsi2ss xmm8, rax
1400cf11f eb29 jmp 0x1400cf14a
1400cf121 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400cf130 4889c2 mov rdx, rax
1400cf133 48d1ea shr rdx, 1
1400cf136 83e001 and eax, 1
1400cf139 4809d0 or rax, rdx
1400cf13c 450f57c0 xorps xmm8, xmm8
1400cf140 f34c0f2ac0 cvtsi2ss xmm8, rax
1400cf145 f3450f58c0 addss xmm8, xmm8
1400cf14a ffc6 inc esi
1400cf14c f3440f59c2 mulss xmm8, xmm2
1400cf151 f3440f58c1 addss xmm8, xmm1
1400cf156 f3440f59c3 mulss xmm8, xmm3
1400cf15b 450f57c9 xorps xmm9, xmm9
1400cf15f f3450f5fc8 maxss xmm9, xmm8
1400cf164 440f28c7 movaps xmm8, xmm7
1400cf168 f3450f5dc1 minss xmm8, xmm9
1400cf16d 410f2e7a10 ucomiss xmm7, dword ptr [r10 + 0x10]
1400cf172 0f87e8fcffff ja 0x1400cee60
1400cf178 410f2ef8 ucomiss xmm7, xmm8
1400cf17c 0f862cfdffff jbe 0x1400ceeae
1400cf182 e9d9fcffff jmp 0x1400cee60
1400cf187 488b95d8000000 mov rdx, qword ptr [rbp + 0xd8]
1400cf18e 488b4220 mov rax, qword ptr [rdx + 0x20]
1400cf192 4885c0 test rax, rax
1400cf195 780a js 0x1400cf1a1
1400cf197 0f57c9 xorps xmm1, xmm1
1400cf19a f3480f2ac8 cvtsi2ss xmm1, rax
1400cf19f eb18 jmp 0x1400cf1b9
1400cf1a1 4889c1 mov rcx, rax
1400cf1a4 48d1e9 shr rcx, 1
1400cf1a7 83e001 and eax, 1
1400cf1aa 4809c8 or rax, rcx
1400cf1ad 0f57c9 xorps xmm1, xmm1
1400cf1b0 f3480f2ac8 cvtsi2ss xmm1, rax
1400cf1b5 f30f58c9 addss xmm1, xmm1
1400cf1b9 f30f590d733cd005 mulss xmm1, dword ptr [rip + 0x5d03c73]
1400cf1c1 f30f580d6f3cd005 addss xmm1, dword ptr [rip + 0x5d03c6f]
1400cf1c9 f30f580d6b3cd005 addss xmm1, dword ptr [rip + 0x5d03c6b]
1400cf1d1 8b722c mov esi, dword ptr [rdx + 0x2c]
1400cf1d4 8b4230 mov eax, dword ptr [rdx + 0x30]
1400cf1d7 8d1430 lea edx, [rax + rsi]
1400cf1da 41b86e000000 mov r8d, 0x6e
1400cf1e0 b902000000 mov ecx, 2
1400cf1e5 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400cf1f0 458d48e2 lea r9d, [r8 - 0x1e]
1400cf1f4 4429ca sub edx, r9d
1400cf1f7 7225 jb 0x1400cf21e
1400cf1f9 458d48f1 lea r9d, [r8 - 0xf]
1400cf1fd 4429ca sub edx, r9d
1400cf200 7221 jb 0x1400cf223
1400cf202 4429c2 sub edx, r8d
1400cf205 721e jb 0x1400cf225
1400cf207 4183c02d add r8d, 0x2d
1400cf20b 83c103 add ecx, 3
1400cf20e 4181f86b030000 cmp r8d, 0x36b
1400cf215 75d9 jne 0x1400cf1f0
1400cf217 b933000000 mov ecx, 0x33
1400cf21c eb07 jmp 0x1400cf225
1400cf21e 83c1fe add ecx, -2
1400cf221 eb02 jmp 0x1400cf225
1400cf223 ffc9 dec ecx
1400cf225 41b86e000000 mov r8d, 0x6e
1400cf22b ba02000000 mov edx, 2
1400cf230 4189f1 mov r9d, esi
1400cf233 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400cf240 458d50e2 lea r10d, [r8 - 0x1e]
1400cf244 4529d1 sub r9d, r10d
1400cf247 7225 jb 0x1400cf26e
1400cf249 458d50f1 lea r10d, [r8 - 0xf]
1400cf24d 4529d1 sub r9d, r10d
1400cf250 7221 jb 0x1400cf273
1400cf252 4529c1 sub r9d, r8d
1400cf255 721e jb 0x1400cf275
1400cf257 4183c02d add r8d, 0x2d
1400cf25b 83c203 add edx, 3
1400cf25e 4181f86b030000 cmp r8d, 0x36b
1400cf265 75d9 jne 0x1400cf240
1400cf267 ba33000000 mov edx, 0x33
1400cf26c eb07 jmp 0x1400cf275
1400cf26e 83c2fe add edx, -2
1400cf271 eb02 jmp 0x1400cf275
1400cf273 ffca dec edx
1400cf275 29d1 sub ecx, edx
1400cf277 0f57d2 xorps xmm2, xmm2
1400cf27a f3480f2ad1 cvtsi2ss xmm2, rcx
1400cf27f f30f591531decf05 mulss xmm2, dword ptr [rip + 0x5cfde31]
1400cf287 f30f58154ddecf05 addss xmm2, dword ptr [rip + 0x5cfde4d]
1400cf28f f30f5d1519decf05 minss xmm2, dword ptr [rip + 0x5cfde19]
1400cf297 f30f5cc1 subss xmm0, xmm1
1400cf29b f30f5ec2 divss xmm0, xmm2
1400cf29f 450f57c0 xorps xmm8, xmm8
1400cf2a3 0f57c9 xorps xmm1, xmm1
1400cf2a6 f30f5fc8 maxss xmm1, xmm0
1400cf2aa 0f28c7 movaps xmm0, xmm7
1400cf2ad f30f5dc1 minss xmm0, xmm1
1400cf2b1 0f28cf movaps xmm1, xmm7
1400cf2b4 f30f5cc8 subss xmm1, xmm0
1400cf2b8 0f28c1 movaps xmm0, xmm1
1400cf2bb f30f59c1 mulss xmm0, xmm1
1400cf2bf f30f59c1 mulss xmm0, xmm1
1400cf2c3 0f28cf movaps xmm1, xmm7
1400cf2c6 f30f5cc8 subss xmm1, xmm0
1400cf2ca 89c0 mov eax, eax
1400cf2cc 0f57c0 xorps xmm0, xmm0
1400cf2cf f3480f2ac0 cvtsi2ss xmm0, rax
1400cf2d4 f30f59c1 mulss xmm0, xmm1
1400cf2d8 e82eaeb205 call 0x145bfa10b
1400cf2dd f3480f2cd0 cvttss2si rdx, xmm0
1400cf2e2 31c0 xor eax, eax
1400cf2e4 410f2ec0 ucomiss xmm0, xmm8
1400cf2e8 0f42d0 cmovb edx, eax
1400cf2eb 0f2e054e3bd005 ucomiss xmm0, dword ptr [rip + 0x5d03b4e]
1400cf2f2 b9ffffffff mov ecx, 0xffffffff
1400cf2f7 0f46ca cmovbe ecx, edx
1400cf2fa 894d68 mov dword ptr [rbp + 0x68], ecx
1400cf2fd 01f1 add ecx, esi
1400cf2ff bb6e000000 mov ebx, 0x6e
1400cf304 be02000000 mov esi, 2
1400cf309 0f1f8000000000 nop dword ptr [rax]
1400cf310 8d53e2 lea edx, [rbx - 0x1e]
1400cf313 4189ce mov r14d, ecx
1400cf316 4129d6 sub r14d, edx
1400cf319 722d jb 0x1400cf348
1400cf31b 8d4bf1 lea ecx, [rbx - 0xf]
1400cf31e 4489f2 mov edx, r14d
1400cf321 29ca sub edx, ecx
1400cf323 7234 jb 0x1400cf359
1400cf325 89d1 mov ecx, edx
1400cf327 29d9 sub ecx, ebx
1400cf329 723b jb 0x1400cf366
1400cf32b 83c003 add eax, 3
1400cf32e 83c32d add ebx, 0x2d
1400cf331 83c603 add esi, 3
1400cf334 81fb6b030000 cmp ebx, 0x36b
1400cf33a 75d4 jne 0x1400cf310
1400cf33c be33000000 mov esi, 0x33
1400cf341 4531f6 xor r14d, r14d
1400cf344 31db xor ebx, ebx
1400cf346 eb21 jmp 0x1400cf369
1400cf348 8d0480 lea eax, [rax + rax*4]
1400cf34b 8d1c40 lea ebx, [rax + rax*2]
1400cf34e 83c350 add ebx, 0x50
1400cf351 83c6fe add esi, -2
1400cf354 4189ce mov r14d, ecx
1400cf357 eb10 jmp 0x1400cf369
1400cf359 8d0480 lea eax, [rax + rax*4]
1400cf35c 8d1c40 lea ebx, [rax + rax*2]
1400cf35f 83c35f add ebx, 0x5f
1400cf362 ffce dec esi
1400cf364 eb03 jmp 0x1400cf369
1400cf366 4189d6 mov r14d, edx
1400cf872 4c8b85d8000000 mov r8, qword ptr [rbp + 0xd8]
1400cf879 418b402c mov eax, dword ptr [r8 + 0x2c]
1400cf87d b96e000000 mov ecx, 0x6e
1400cf882 41bc02000000 mov r12d, 2
1400cf888 0f1f840000000000 nop dword ptr [rax + rax]
1400cf890 8d51e2 lea edx, [rcx - 0x1e]
1400cf893 29d0 sub eax, edx
1400cf895 7230 jb 0x1400cf8c7
1400cf897 8d51f1 lea edx, [rcx - 0xf]
1400cf89a 29d0 sub eax, edx
1400cf89c 0f8205030000 jb 0x1400cfba7
1400cf8a2 29c8 sub eax, ecx
1400cf8a4 7225 jb 0x1400cf8cb
1400cf8a6 83c12d add ecx, 0x2d
1400cf8a9 4183c403 add r12d, 3
1400cf8ad 81f96b030000 cmp ecx, 0x36b
1400cf8b3 75db jne 0x1400cf890
1400cf8b5 41bc33000000 mov r12d, 0x33
1400cf8bb 413b7034 cmp esi, dword ptr [r8 + 0x34]
1400cf8bf 0f86ef020000 jbe 0x1400cfbb4
1400cf8c5 eb0e jmp 0x1400cf8d5
1400cf8c7 4183c4fe add r12d, -2
1400cf8cb 413b7034 cmp esi, dword ptr [r8 + 0x34]
1400cf8cf 0f86df020000 jbe 0x1400cfbb4
1400cf8d5 41897034 mov dword ptr [r8 + 0x34], esi
1400cf8d9 8b85e8000000 mov eax, dword ptr [rbp + 0xe8]
1400cf8df 418903 mov dword ptr [r11], eax
1400cf8e2 41c7401801000000 mov dword ptr [r8 + 0x18], 1
1400cf8ea f3410f11701c movss dword ptr [r8 + 0x1c], xmm6
1400cf8f0 410f104008 movups xmm0, xmmword ptr [r8 + 8]
1400cf8f5 0f118598000000 movups xmmword ptr [rbp + 0x98], xmm0
1400cf8fc 8975d8 mov dword ptr [rbp - 0x28], esi
1400cfba7 41ffcc dec r12d
1400cfbaa 413b7034 cmp esi, dword ptr [r8 + 0x34]
1400cfbae 0f8721fdffff ja 0x1400cf8d5
1400cfbb4 450fb67818 movzx r15d, byte ptr [r8 + 0x18]
1400cfbb9 4584ff test r15b, r15b
1400cfbbc 7406 je 0x1400cfbc4
1400cfbbe f3410f5c701c subss xmm6, dword ptr [r8 + 0x1c]
1400cfc2b 8b454c mov eax, dword ptr [rbp + 0x4c]
1400cfc2e 488b5540 mov rdx, qword ptr [rbp + 0x40]
1400cfc32 488b4d30 mov rcx, qword ptr [rbp + 0x30]
1400cfc36 448b452c mov r8d, dword ptr [rbp + 0x2c]
1400cfc3a 4c8b4d10 mov r9, qword ptr [rbp + 0x10]
1400cfc3e 4c8b5520 mov r10, qword ptr [rbp + 0x20]
1400cfc42 0f28c6 movaps xmm0, xmm6
1400cfc45 f30f5e05f731d005 divss xmm0, dword ptr [rip + 0x5d031f7]
1400cfc4d 458902 mov dword ptr [r10], r8d
1400cfc50 0f100d453fd005 movups xmm1, xmmword ptr [rip + 0x5d03f45]
1400cfc57 410f1109 movups xmmword ptr [r9], xmm1
1400cfc5b 0f28ce movaps xmm1, xmm6
1400cfc5e f30f5e0dd231d005 divss xmm1, dword ptr [rip + 0x5d031d2]
1400cfc66 0f57d2 xorps xmm2, xmm2
1400cfc69 f30f5fd1 maxss xmm2, xmm1
1400cfc6d 0f28cf movaps xmm1, xmm7
1400cfc70 f30f5dca minss xmm1, xmm2
1400cfc74 0f28d7 movaps xmm2, xmm7
1400cfc77 f30f5cd1 subss xmm2, xmm1
1400cfc7b 0f28ca movaps xmm1, xmm2
1400cfc7e f30f59ca mulss xmm1, xmm2
1400cfc82 f30f59ca mulss xmm1, xmm2
1400cfc86 f30f5dc7 minss xmm0, xmm7
1400cfc8a f30f580d32d4cf05 addss xmm1, dword ptr [rip + 0x5cfd432]
1400cfc92 f3410f114110 movss dword ptr [r9 + 0x10], xmm0
1400cfc98 f30f58cf addss xmm1, xmm7
1400cfc9c f30f590d58d4cf05 mulss xmm1, dword ptr [rip + 0x5cfd458]
1400cfca4 f30f58cf addss xmm1, xmm7
1400cfca8 8902 mov dword ptr [rdx], eax
1400cfcaa f30f114910 movss dword ptr [rcx + 0x10], xmm1
1400cfcaf f30f114914 movss dword ptr [rcx + 0x14], xmm1
1400cfe94 4885d2 test rdx, rdx
1400cfe97 0f8466030000 je 0x1400d0203
1400cfe9d f30f1005a32fd005 movss xmm0, dword ptr [rip + 0x5d02fa3]
1400cfea5 0f2ec6 ucomiss xmm0, xmm6
1400cfea8 0f97c0 seta al
1400cfeab 4184c7 test r15b, al
1400cfeae 7464 je 0x1400cff14
1400cfeb0 83fb01 cmp ebx, 1
1400cfeb3 89d8 mov eax, ebx
1400cfeb5 83d000 adc eax, 0
1400cfeb8 f30f100510d4cc05 movss xmm0, dword ptr [rip + 0x5ccd410]
1400cfec0 85db test ebx, ebx
1400cfec2 0f84f1020000 je 0x1400d01b9
1400cfec8 468d04b500000000 lea r8d, [r14*4]
1400cfed0 4139c0 cmp r8d, eax
1400cfed3 7347 jae 0x1400cff1c
1400cfed5 e9df020000 jmp 0x1400d01b9
1400cff14 85db test ebx, ebx
1400cff16 0f8495020000 je 0x1400d01b1
1400cff1c 0f57c0 xorps xmm0, xmm0
1400cff1f f3410f2ac6 cvtsi2ss xmm0, r14d
1400cff24 f30f5905a4d3cc05 mulss xmm0, dword ptr [rip + 0x5ccd3a4]
1400cff2c 0f57c9 xorps xmm1, xmm1
1400cff2f f30f2acb cvtsi2ss xmm1, ebx
1400cff33 f30f5ec1 divss xmm0, xmm1
1400cff37 e97d020000 jmp 0x1400d01b9
1400cff9d 4c8b6df0 mov r13, qword ptr [rbp - 0x10]
1400cffa1 4d85ed test r13, r13
1400cffa4 0f84c5010000 je 0x1400d016f
1400cffaa 488b4500 mov rax, qword ptr [rbp]
1400cffae 488985d0000000 mov qword ptr [rbp + 0xd0], rax
1400cffb5 8b450c mov eax, dword ptr [rbp + 0xc]
1400cffb8 8985e8000000 mov dword ptr [rbp + 0xe8], eax
1400cffbe 4429e6 sub esi, r12d
1400cffc1 897564 mov dword ptr [rbp + 0x64], esi
1400cffc4 83fe01 cmp esi, 1
1400cffc7 7547 jne 0x1400d0010
1400d01b1 f30f100517d1cc05 movss xmm0, dword ptr [rip + 0x5ccd117]
1400d01b9 8b8288000000 mov eax, dword ptr [rdx + 0x88]
1400d01bf 85c0 test eax, eax
1400d01c1 742b je 0x1400d01ee
1400d01c3 83f802 cmp eax, 2
1400d01c6 750d jne 0x1400d01d5
1400d01c8 f30f108a8c000000 movss xmm1, dword ptr [rdx + 0x8c]
1400d01d0 0f2ec8 ucomiss xmm1, xmm0
1400d01d3 eb15 jmp 0x1400d01ea
1400d01d5 f30f10928c000000 movss xmm2, dword ptr [rdx + 0x8c]
1400d01dd 0f57c9 xorps xmm1, xmm1
1400d01e0 0f2ed1 ucomiss xmm2, xmm1
1400d01e3 7509 jne 0x1400d01ee
1400d01e5 7a07 jp 0x1400d01ee
1400d01e7 0f2ec1 ucomiss xmm0, xmm1
1400d01ea 7502 jne 0x1400d01ee
1400d01ec 7b15 jnp 0x1400d0203
1400d01ee 448921 mov dword ptr [rcx], r12d
1400d01f1 c7828800000002000000 mov dword ptr [rdx + 0x88], 2
1400d01fb f30f11828c000000 movss dword ptr [rdx + 0x8c], xmm0
1400d03c5 0f57c0 xorps xmm0, xmm0
1400d03c8 4584ff test r15b, r15b
1400d03cb 741f je 0x1400d03ec
1400d03cd f30f5e35772ad005 divss xmm6, dword ptr [rip + 0x5d02a77]
1400d03d5 f30f5835c3cecc05 addss xmm6, dword ptr [rip + 0x5cccec3]
1400d03dd f30f5ff0 maxss xmm6, xmm0
1400d03e1 f30f593513cdcf05 mulss xmm6, dword ptr [rip + 0x5cfcd13]
1400d03e9 0f28c6 movaps xmm0, xmm6
