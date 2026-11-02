0x14599c297: 4c8b7db0 mov r15, qword ptr [rbp - 0x50]
0x14599c29b: 488b55b8 mov rdx, qword ptr [rbp - 0x48]
0x14599c29f: 4883fa01 cmp rdx, 1
0x14599c2a3: 0f84b5000000 je 0x14599c35e
0x14599c2a9: 450f57db xorps xmm11, xmm11
0x14599c2ad: 4885d2 test rdx, rdx
0x14599c2b0: 0f84ae000000 je 0x14599c364
0x14599c2b6: f3410f1007 movss xmm0, dword ptr [r15]
0x14599c2bb: 410f2ec1 ucomiss xmm0, xmm9
0x14599c2bf: 0f830f020000 jae 0x14599c4d4
0x14599c2c5: 488d04d500000000 lea rax, [rdx*8]
0x14599c2cd: 31c9 xor ecx, ecx
0x14599c2cf: 90 nop
0x14599c2d0: f3410f1004cf movss xmm0, dword ptr [r15 + rcx*8]
0x14599c2d6: 410f2ec1 ucomiss xmm0, xmm9
0x14599c2da: 730d jae 0x14599c2e9
0x14599c2dc: 48ffc1 inc rcx
0x14599c2df: 4883c0f8 add rax, -8
0x14599c2e3: 75eb jne 0x14599c2d0
0x14599c2e5: 488d4aff lea rcx, [rdx - 1]
0x14599c2e9: 4883f901 cmp rcx, 1
0x14599c2ed: 4883d100 adc rcx, 0
0x14599c2f1: 488d41ff lea rax, [rcx - 1]
0x14599c2f5: 4839d0 cmp rax, rdx
0x14599c2f8: 0f8329020000 jae 0x14599c527
0x14599c2fe: 4839d1 cmp rcx, rdx
0x14599c301: 0f8336020000 jae 0x14599c53d
0x14599c307: f3410f1044cff8 movss xmm0, dword ptr [r15 + rcx*8 - 8]
0x14599c30e: f3410f104ccffc movss xmm1, dword ptr [r15 + rcx*8 - 4]
0x14599c315: f3410f1014cf movss xmm2, dword ptr [r15 + rcx*8]
0x14599c31b: f3410f105ccf04 movss xmm3, dword ptr [r15 + rcx*8 + 4]
0x14599c322: f30f5cd9 subss xmm3, xmm1
0x14599c326: 450f28d9 movaps xmm11, xmm9
0x14599c32a: f3440f5cd8 subss xmm11, xmm0
0x14599c32f: f3440f59db mulss xmm11, xmm3
0x14599c334: f30f5cd0 subss xmm2, xmm0
0x14599c338: f30f5f15148a4400 maxss xmm2, dword ptr [rip + 0x448a14]
0x14599c340: f3440f5eda divss xmm11, xmm2
0x14599c345: f3440f58d9 addss xmm11, xmm1
0x14599c34a: 4c01f3 add rbx, r14
0x14599c34d: 488b9380000000 mov rdx, qword ptr [rbx + 0x80]
0x14599c354: 4839d7 cmp rdi, rdx
0x14599c357: 721e jb 0x14599c377
0x14599c359: e9b3010000 jmp 0x14599c511
0x14599c35e: f3450f105f04 movss xmm11, dword ptr [r15 + 4]
0x14599c364: 4c01f3 add rbx, r14
0x14599c367: 488b9380000000 mov rdx, qword ptr [rbx + 0x80]
0x14599c36e: 4839d7 cmp rdi, rdx
0x14599c371: 0f839a010000 jae 0x14599c511
0x14599c377: 488b4378 mov rax, qword ptr [rbx + 0x78]
0x14599c37b: 488d0cbf lea rcx, [rdi + rdi*4]
0x14599c37f: 48c1e104 shl rcx, 4
0x14599c383: f3440f10640830 movss xmm12, dword ptr [rax + rcx + 0x30]
0x14599c38a: f30f103d0e0f4000 movss xmm7, dword ptr [rip + 0x400f0e]
0x14599c392: 83be7009000001 cmp dword ptr [rsi + 0x970], 1
0x14599c399: 7533 jne 0x14599c3ce
0x14599c39b: 80beb80a000000 cmp byte ptr [rsi + 0xab8], 0
0x14599c3a2: 742a je 0x14599c3ce
0x14599c3a4: f30f5cb674090000 subss xmm6, dword ptr [rsi + 0x974]
0x14599c3ac: f30f5e358c414500 divss xmm6, dword ptr [rip + 0x45418c]
0x14599c3b4: 0f57c0 xorps xmm0, xmm0
0x14599c3b7: f30f5ff0 maxss xmm6, xmm0
0x14599c3bb: f30f100551d68801 movss xmm0, dword ptr [rip + 0x188d651]
0x14599c3c3: 0f28ce movaps xmm1, xmm6
0x14599c3c6: e89add2500 call 0x145bfa165
0x14599c3cb: 0f28f8 movaps xmm7, xmm0
0x14599c3ce: 0fb7beb2020000 movzx edi, word ptr [rsi + 0x2b2]
0x14599c3d5: 8bb65c070000 mov esi, dword ptr [rsi + 0x75c]
0x14599c3db: 488b55a8 mov rdx, qword ptr [rbp - 0x58]
0x14599c3df: 4885d2 test rdx, rdx
0x14599c3e2: 7412 je 0x14599c3f6
0x14599c3e4: 48c1e203 shl rdx, 3
0x14599c3e8: 41b804000000 mov r8d, 4
0x14599c3ee: 4c89f9 mov rcx, r15
0x14599c3f1: e8da5d66fa call 0x1400021d0
0x14599c3f6: 0fb7c7 movzx eax, di
0x14599c3f9: 0f57c9 xorps xmm1, xmm1
0x14599c3fc: f30f2ac8 cvtsi2ss xmm1, eax
0x14599c400: f30f5e0dc80e4000 divss xmm1, dword ptr [rip + 0x400ec8]
0x14599c408: f3440f591deb0c4300 mulss xmm11, dword ptr [rip + 0x430ceb]
0x14599c411: f3450f59c2 mulss xmm8, xmm10
0x14599c416: f3450f59d8 mulss xmm11, xmm8
0x14599c41b: f30f1005216a4300 movss xmm0, dword ptr [rip + 0x436a21]
0x14599c423: f3410f59c1 mulss xmm0, xmm9
0x14599c428: f30f1015700e4000 movss xmm2, dword ptr [rip + 0x400e70]
0x14599c430: f30f58c2 addss xmm0, xmm2
0x14599c434: f30f101d34604400 movss xmm3, dword ptr [rip + 0x446034]
0x14599c43c: f3410f59d9 mulss xmm3, xmm9
0x14599c441: f3410f59d9 mulss xmm3, xmm9
0x14599c446: f30f58d8 addss xmm3, xmm0
0x14599c44a: f3410f59d8 mulss xmm3, xmm8
0x14599c44f: f3410f59dc mulss xmm3, xmm12
0x14599c454: f30f591d54f24400 mulss xmm3, dword ptr [rip + 0x44f254]
0x14599c45c: 410f28c3 movaps xmm0, xmm11
0x14599c460: f30f5fc3 maxss xmm0, xmm3
0x14599c464: 0f28d8 movaps xmm3, xmm0
0x14599c467: f30fc2d803 cmpunordss xmm3, xmm0
0x14599c46c: 0f28e3 movaps xmm4, xmm3
0x14599c46f: 0f55e0 andnps xmm4, xmm0
0x14599c472: 410f54db andps xmm3, xmm11
0x14599c476: 0f56dc orps xmm3, xmm4
0x14599c479: f30f591d4f0a4300 mulss xmm3, dword ptr [rip + 0x430a4f]
0x14599c481: 89f0 mov eax, esi
0x14599c483: 0f57c0 xorps xmm0, xmm0
0x14599c486: f3480f2ac0 cvtsi2ss xmm0, rax
0x14599c48b: f30f59df mulss xmm3, xmm7
0x14599c48f: f30f5905ed094300 mulss xmm0, dword ptr [rip + 0x4309ed]
0x14599c497: f30f58c2 addss xmm0, xmm2
0x14599c49b: f30f59c3 mulss xmm0, xmm3
0x14599c49f: f30f59c1 mulss xmm0, xmm1
0x14599c4a3: 0f2875d0 movaps xmm6, xmmword ptr [rbp - 0x30]
0x14599c4a7: 0f287de0 movaps xmm7, xmmword ptr [rbp - 0x20]
0x14599c4ab: 440f2845f0 movaps xmm8, xmmword ptr [rbp - 0x10]
0x14599c4b0: 440f284d00 movaps xmm9, xmmword ptr [rbp]
0x14599c4b5: 440f285510 movaps xmm10, xmmword ptr [rbp + 0x10]
0x14599c4ba: 440f285d20 movaps xmm11, xmmword ptr [rbp + 0x20]
0x14599c4bf: 440f286530 movaps xmm12, xmmword ptr [rbp + 0x30]
0x14599c4c4: 4881c4c8000000 add rsp, 0xc8
0x14599c4cb: 5b pop rbx
0x14599c4cc: 5f pop rdi
0x14599c4cd: 5e pop rsi
0x14599c4ce: 415e pop r14
0x14599c4d0: 415f pop r15
0x14599c4d2: 5d pop rbp
0x14599c4d3: c3 ret
0x14599c4d4: f3440f101d175d4400 movss xmm11, dword ptr [rip + 0x445d17]
0x14599c4dd: f3450f59d9 mulss xmm11, xmm9
0x14599c4e2: f30f5f056a884400 maxss xmm0, dword ptr [rip + 0x44886a]
0x14599c4ea: f3440f5ed8 divss xmm11, xmm0
0x14599c4ef: f3440f581d040c4300 addss xmm11, dword ptr [rip + 0x430c04]
0x14599c4f8: f3450f595f04 mulss xmm11, dword ptr [r15 + 4]
0x14599c4fe: 4c01f3 add rbx, r14
0x14599c501: 488b9380000000 mov rdx, qword ptr [rbx + 0x80]
0x14599c508: 4839d7 cmp rdi, rdx
0x14599c50b: 0f8266feffff jb 0x14599c377
0x14599c511: 4c897dc0 mov qword ptr [rbp - 0x40], r15
0x14599c515: 4c8d05cc038901 lea r8, [rip + 0x18903cc]
0x14599c51c: 4889f9 mov rcx, rdi
0x14599c51f: e82fd13f00 call 0x145d99653
0x14599c524: 90 nop
0x14599c525: eb27 jmp 0x14599c54e
0x14599c527: 4c897dc0 mov qword ptr [rbp - 0x40], r15
0x14599c52b: 4c8d0586038901 lea r8, [rip + 0x1890386]
0x14599c532: 4889c1 mov rcx, rax
0x14599c535: e819d13f00 call 0x145d99653
0x14599c53a: 90 nop
0x14599c53b: eb11 jmp 0x14599c54e
0x14599c53d: 4c897dc0 mov qword ptr [rbp - 0x40], r15
0x14599c541: 4c8d0588038901 lea r8, [rip + 0x1890388]
0x14599c548: e806d13f00 call 0x145d99653
0x14599c54d: 90 nop
0x14599c54e: 0f0b ud2
