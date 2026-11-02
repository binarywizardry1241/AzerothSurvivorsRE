145970560: 55 push rbp
145970561: 4157 push r15
145970563: 4156 push r14
145970565: 4155 push r13
145970567: 4154 push r12
145970569: 56 push rsi
14597056a: 57 push rdi
14597056b: 53 push rbx
14597056c: 4881ec08030000 sub rsp, 0x308
145970573: 488dac2480000000 lea rbp, [rsp + 0x80]
14597057b: 440f29bd70020000 movaps xmmword ptr [rbp + 0x270], xmm15
145970583: 440f29b560020000 movaps xmmword ptr [rbp + 0x260], xmm14
14597058b: 440f29ad50020000 movaps xmmword ptr [rbp + 0x250], xmm13
145970593: 440f29a540020000 movaps xmmword ptr [rbp + 0x240], xmm12
14597059b: 440f299d30020000 movaps xmmword ptr [rbp + 0x230], xmm11
1459705a3: 440f299520020000 movaps xmmword ptr [rbp + 0x220], xmm10
1459705ab: 440f298d10020000 movaps xmmword ptr [rbp + 0x210], xmm9
1459705b3: 440f298500020000 movaps xmmword ptr [rbp + 0x200], xmm8
1459705bb: 0f29bdf0010000 movaps xmmword ptr [rbp + 0x1f0], xmm7
1459705c2: 0f29b5e0010000 movaps xmmword ptr [rbp + 0x1e0], xmm6
1459705c9: 48c785d8010000feffffff mov qword ptr [rbp + 0x1d8], 0xfffffffffffffffe
1459705d4: 4c89c7 mov rdi, r8
1459705d7: 4989d6 mov r14, rdx
1459705da: 4889ce mov rsi, rcx
1459705dd: 4c8b8168050000 mov r8, qword ptr [rcx + 0x568]
1459705e4: 4d85c0 test r8, r8
1459705e7: 741a je 0x145970603
1459705e9: 488b8660050000 mov rax, qword ptr [rsi + 0x560]
1459705f0: 4489c2 mov edx, r8d
1459705f3: 83e203 and edx, 3
1459705f6: 4983f804 cmp r8, 4
1459705fa: 730e jae 0x14597060a
1459705fc: 4531c9 xor r9d, r9d
1459705ff: 31c9 xor ecx, ecx
145970601: eb66 jmp 0x145970669
145970603: 31c9 xor ecx, ecx
145970605: e99d000000 jmp 0x1459706a7
14597060a: 4983e0fc and r8, 0xfffffffffffffffc
14597060e: 4c8d9038060000 lea r10, [rax + 0x638]
145970615: 4531c9 xor r9d, r9d
145970618: 31c9 xor ecx, ecx
14597061a: 660f1f440000 nop word ptr [rax + rax]
145970620: 458b9a78faffff mov r11d, dword ptr [r10 - 0x588]
145970627: 418b9a50fcffff mov ebx, dword ptr [r10 - 0x3b0]
14597062e: 4983f301 xor r11, 1
145970632: 4901cb add r11, rcx
145970635: 4883f301 xor rbx, 1
145970639: 458bba28feffff mov r15d, dword ptr [r10 - 0x1d8]
145970640: 4983f701 xor r15, 1
145970644: 4901df add r15, rbx
145970647: 4d01df add r15, r11
14597064a: 418b0a mov ecx, dword ptr [r10]
14597064d: 4883f101 xor rcx, 1
145970651: 4c01f9 add rcx, r15
145970654: 4983c104 add r9, 4
145970658: 4981c260070000 add r10, 0x760
14597065f: 4d39c8 cmp r8, r9
145970662: 75bc jne 0x145970620
145970664: 4885d2 test rdx, rdx
145970667: 743e je 0x1459706a7
145970669: 4d69c1d8010000 imul r8, r9, 0x1d8
145970670: 4c01c0 add rax, r8
145970673: 4805b0000000 add rax, 0xb0
145970679: 4869d2d8010000 imul rdx, rdx, 0x1d8
145970680: 4531c0 xor r8d, r8d
145970683: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145970690: 468b0c00 mov r9d, dword ptr [rax + r8]
145970694: 4983f101 xor r9, 1
145970698: 4c01c9 add rcx, r9
14597069b: 4981c0d8010000 add r8, 0x1d8
1459706a2: 4c39c2 cmp rdx, r8
1459706a5: 75e9 jne 0x145970690
1459706a7: 0fb786b0020000 movzx eax, word ptr [rsi + 0x2b0]
1459706ae: f30f2ac0 cvtsi2ss xmm0, eax
1459706b2: f30f5e0516cc4200 divss xmm0, dword ptr [rip + 0x42cc16]
1459706ba: f30f59051e345300 mulss xmm0, dword ptr [rip + 0x53341e]
1459706c2: f3480f2cc0 cvttss2si rax, xmm0
1459706c7: 4889c2 mov rdx, rax
1459706ca: 48c1fa3f sar rdx, 0x3f
1459706ce: 0f28c8 movaps xmm1, xmm0
1459706d1: f30f5c0d07cf4200 subss xmm1, dword ptr [rip + 0x42cf07]
1459706d9: f34c0f2cc1 cvttss2si r8, xmm1
1459706de: 4921d0 and r8, rdx
1459706e1: 4909c0 or r8, rax
1459706e4: 31c0 xor eax, eax
1459706e6: 0f57c9 xorps xmm1, xmm1
1459706e9: 0f2ec1 ucomiss xmm0, xmm1
1459706ec: 4c0f42c0 cmovb r8, rax
1459706f0: 0f2e05edce4200 ucomiss xmm0, dword ptr [rip + 0x42ceed]
1459706f7: 48c7c2ffffffff mov rdx, 0xffffffffffffffff
1459706fe: 490f46d0 cmovbe rdx, r8
145970702: 4883fa33 cmp rdx, 0x33
145970706: 41b832000000 mov r8d, 0x32
14597070c: 4c0f43c2 cmovae r8, rdx
145970710: 4983f878 cmp r8, 0x78
145970714: ba78000000 mov edx, 0x78
145970719: 490f42d0 cmovb rdx, r8
14597071d: 4839d1 cmp rcx, rdx
145970720: 0f8377070000 jae 0x145970e9d
145970726: 488b8e90020000 mov rcx, qword ptr [rsi + 0x290]
14597072d: 488b9698020000 mov rdx, qword ptr [rsi + 0x298]
145970734: e897c9f1ff call 0x14588d0d0
145970739: 4869c0f0000000 imul rax, rax, 0xf0
145970740: 488d1d49dc2601 lea rbx, [rip + 0x126dc49]
145970747: 488b941880000000 mov rdx, qword ptr [rax + rbx + 0x80]
14597074f: 488d4aff lea rcx, [rdx - 1]
145970753: 4c39f1 cmp rcx, r14
145970756: 4c0f42f1 cmovb r14, rcx
14597075a: 4939d6 cmp r14, rdx
14597075d: 0f839f070000 jae 0x145970f02
145970763: 4801c3 add rbx, rax
145970766: 4f8d3cb6 lea r15, [r14 + r14*4]
14597076a: 49c1e704 shl r15, 4
14597076e: 4c037b78 add r15, qword ptr [rbx + 0x78]
145970772: 803f00 cmp byte ptr [rdi], 0
145970775: 7416 je 0x14597078d
145970777: 8b470c mov eax, dword ptr [rdi + 0xc]
14597077a: 8985d0010000 mov dword ptr [rbp + 0x1d0], eax
145970780: 488b4704 mov rax, qword ptr [rdi + 4]
145970784: 488985c8010000 mov qword ptr [rbp + 0x1c8], rax
14597078b: eb27 jmp 0x1459707b4
14597078d: c74424200000003f mov dword ptr [rsp + 0x20], 0x3f000000
145970795: 488d8dc8010000 lea rcx, [rbp + 0x1c8]
14597079c: f30f10154ca84700 movss xmm2, dword ptr [rip + 0x47a84c]
1459707a4: f30f101de4cf4200 movss xmm3, dword ptr [rip + 0x42cfe4]
1459707ac: 4889f2 mov rdx, rsi
1459707af: e81cf5ffff call 0x14596fcd0
1459707b4: f30f1086340a0000 movss xmm0, dword ptr [rsi + 0xa34]
1459707bc: 0f28f0 movaps xmm6, xmm0
1459707bf: f30f5e3579fd4700 divss xmm6, dword ptr [rip + 0x47fd79]
1459707c7: 450f57ed xorps xmm13, xmm13
1459707cb: 83be7009000001 cmp dword ptr [rsi + 0x970], 1
1459707d2: 7524 jne 0x1459707f8
1459707d4: 80beb80a000000 cmp byte ptr [rsi + 0xab8], 0
1459707db: 741b je 0x1459707f8
1459707dd: f30f5c8674090000 subss xmm0, dword ptr [rsi + 0x974]
1459707e5: f30f5e0553fd4700 divss xmm0, dword ptr [rip + 0x47fd53]
1459707ed: 0f57c9 xorps xmm1, xmm1
1459707f0: f30f5fc1 maxss xmm0, xmm1
1459707f4: 440f28e8 movaps xmm13, xmm0
1459707f8: 410fb6574c movzx edx, byte ptr [r15 + 0x4c]
1459707fd: 488d05bce10200 lea rax, [rip + 0x2e1bc]
145970804: 488d0d05e20200 lea rcx, [rip + 0x2e205]
14597080b: 8895d7010000 mov byte ptr [rbp + 0x1d7], dl
145970811: 84d2 test dl, dl
145970813: 480f45c8 cmovne rcx, rax
145970817: f30f1086b2020000 movss xmm0, dword ptr [rsi + 0x2b2]
14597081f: 0f2985a0010000 movaps xmmword ptr [rbp + 0x1a0], xmm0
145970826: 0fb786b6020000 movzx eax, word ptr [rsi + 0x2b6]
14597082d: 668985d4010000 mov word ptr [rbp + 0x1d4], ax
145970834: f3450f105730 movss xmm10, dword ptr [r15 + 0x30]
14597083a: f30f108be0000000 movss xmm1, dword ptr [rbx + 0xe0]
145970842: f3440f10b3e4000000 movss xmm14, dword ptr [rbx + 0xe4]
14597084b: f30f598ea80a0000 mulss xmm1, dword ptr [rsi + 0xaa8]
145970853: 0f28c6 movaps xmm0, xmm6
145970856: f30f118dc0010000 movss dword ptr [rbp + 0x1c0], xmm1
14597085e: ffd1 call rcx
145970860: 440f28c0 movaps xmm8, xmm0
145970864: f3410f104734 movss xmm0, dword ptr [r15 + 0x34]
14597086a: f30f1185c4010000 movss dword ptr [rbp + 0x1c4], xmm0
145970872: 418b4720 mov eax, dword ptr [r15 + 0x20]
145970876: 488985b8010000 mov qword ptr [rbp + 0x1b8], rax
14597087d: 448bae600a0000 mov r13d, dword ptr [rsi + 0xa60]
145970884: 41ffc5 inc r13d
145970887: 4489ae600a0000 mov dword ptr [rsi + 0xa60], r13d
14597088e: 4c8bb6a0090000 mov r14, qword ptr [rsi + 0x9a0]
145970895: 488bbea8090000 mov rdi, qword ptr [rsi + 0x9a8]
14597089c: 488b9eb8090000 mov rbx, qword ptr [rsi + 0x9b8]
1459708a3: 4c8ba6b0090000 mov r12, qword ptr [rsi + 0x9b0]
1459708aa: f3440f102511c84500 movss xmm12, dword ptr [rip + 0x45c811]
1459708b3: f30f100585c84500 movss xmm0, dword ptr [rip + 0x45c885]
1459708bb: 0f1f440000 nop dword ptr [rax + rax]
1459708c0: 498d041e lea rax, [r14 + rbx]
1459708c4: 48c1c017 rol rax, 0x17
1459708c8: 4c01f0 add rax, r14
1459708cb: 4889f9 mov rcx, rdi
1459708ce: 48c1e111 shl rcx, 0x11
1459708d2: 4d31f4 xor r12, r14
1459708d5: 4831fb xor rbx, rdi
1459708d8: 4c31e7 xor rdi, r12
1459708db: 4931de xor r14, rbx
1459708de: 48c1c32d rol rbx, 0x2d
1459708e2: 4931cc xor r12, rcx
1459708e5: 48c1e829 shr rax, 0x29
1459708e9: 0d0000803f or eax, 0x3f800000
1459708ee: 66440f6ed8 movd xmm11, eax
1459708f3: f3450f58dc addss xmm11, xmm12
1459708f8: f3440f59d8 mulss xmm11, xmm0
1459708fd: 410f2ec3 ucomiss xmm0, xmm11
145970901: 76bd jbe 0x1459708c0
145970903: 80bdd701000000 cmp byte ptr [rbp + 0x1d7], 0
14597090a: 751a jne 0x145970926
14597090c: f3440f103d2f918b01 movss xmm15, dword ptr [rip + 0x18b912f]
145970915: f3440f100d82c94200 movss xmm9, dword ptr [rip + 0x42c982]
14597091e: 410f28f9 movaps xmm7, xmm9
145970922: 741a je 0x14597093e
145970924: eb20 jmp 0x145970946
145970926: f3440f103d11918b01 movss xmm15, dword ptr [rip + 0x18b9111]
14597092f: f3440f100d68c94200 movss xmm9, dword ptr [rip + 0x42c968]
145970938: 410f28f9 movaps xmm7, xmm9
14597093c: 7508 jne 0x145970946
14597093e: f30f103d7ad05c00 movss xmm7, dword ptr [rip + 0x5cd07a]
145970946: 0f28c6 movaps xmm0, xmm6
145970949: f30f5e05cfc84200 divss xmm0, dword ptr [rip + 0x42c8cf]
145970951: f3450f59fa mulss xmm15, xmm10
145970956: 0f57c9 xorps xmm1, xmm1
145970959: f30f5fc8 maxss xmm1, xmm0
14597095d: 410f28c1 movaps xmm0, xmm9
145970961: f30f5dc1 minss xmm0, xmm1
145970965: f3440f59f0 mulss xmm14, xmm0
14597096a: f3440f59f0 mulss xmm14, xmm0
14597096f: f3450f58f1 addss xmm14, xmm9
145970974: 660f6e0598908b01 movd xmm0, dword ptr [rip + 0x18b9098]
14597097c: 410f28cd movaps xmm1, xmm13
145970980: e8e0972800 call 0x145bfa165
145970985: 66440f6fd0 movdqa xmm10, xmm0
14597098a: 660fefc0 pxor xmm0, xmm0
14597098e: 660f6f8da0010000 movdqa xmm1, xmmword ptr [rbp + 0x1a0]
145970996: 660f61c8 punpcklwd xmm1, xmm0
14597099a: 0f5bd1 cvtdq2ps xmm2, xmm1
14597099d: f30f59bdc4010000 mulss xmm7, dword ptr [rbp + 0x1c4]
1459709a5: 440f14f7 unpcklps xmm14, xmm7
1459709a9: f30f100503454600 movss xmm0, dword ptr [rip + 0x464503]
1459709b1: f30f59c6 mulss xmm0, xmm6
1459709b5: f3410f58c1 addss xmm0, xmm9
1459709ba: f30f100d7e7d6f00 movss xmm1, dword ptr [rip + 0x6f7d7e]
1459709c2: f30f59ce mulss xmm1, xmm6
1459709c6: f30f59ce mulss xmm1, xmm6
1459709ca: f30f58c8 addss xmm1, xmm0
1459709ce: f30f1005da6c7e00 movss xmm0, dword ptr [rip + 0x7e6cda]
1459709d6: f30f59c6 mulss xmm0, xmm6
1459709da: f30f59c6 mulss xmm0, xmm6
1459709de: f30f59c6 mulss xmm0, xmm6
1459709e2: f30f58c1 addss xmm0, xmm1
1459709e6: 440f14f8 unpcklps xmm15, xmm0
1459709ea: f30f1085c0010000 movss xmm0, dword ptr [rbp + 0x1c0]
1459709f2: f30f51f0 sqrtss xmm6, xmm0
1459709f6: 660f6e0512908b01 movd xmm0, dword ptr [rip + 0x18b9012]
1459709fe: 410f28cd movaps xmm1, xmm13
145970a02: 440f28ea movaps xmm13, xmm2
145970a06: e85a972800 call 0x145bfa165
145970a0b: 440f14c6 unpcklps xmm8, xmm6
145970a0f: 450f59c7 mulps xmm8, xmm15
145970a13: 450f59c6 mulps xmm8, xmm14
145970a17: 66440f62d0 punpckldq xmm10, xmm0
145970a1c: 440f5e2d9c621701 divps xmm13, xmmword ptr [rip + 0x117629c]
145970a24: 450f59d0 mulps xmm10, xmm8
145970a28: 450f59ea mulps xmm13, xmm10
145970a2c: 4c8b85b8010000 mov r8, qword ptr [rbp + 0x1b8]
145970a33: 4489c0 mov eax, r8d
145970a36: 25ffffff00 and eax, 0xffffff
145970a3b: 48c1e018 shl rax, 0x18
145970a3f: 4181e5ffffff00 and r13d, 0xffffff
145970a46: 4909c5 or r13, rax
145970a49: 48b800000000000030f1 movabs rax, 0xf130000000000000
145970a53: 4c09e8 or rax, r13
145970a56: 4c89b6a0090000 mov qword ptr [rsi + 0x9a0], r14
145970a5d: 48899eb8090000 mov qword ptr [rsi + 0x9b8], rbx
145970a64: 4889bea8090000 mov qword ptr [rsi + 0x9a8], rdi
145970a6b: 4c89a6b0090000 mov qword ptr [rsi + 0x9b0], r12
145970a72: 4989c4 mov r12, rax
145970a75: f3410f104728 movss xmm0, dword ptr [r15 + 0x28]
145970a7b: 458b4f24 mov r9d, dword ptr [r15 + 0x24]
145970a7f: 410fb6474c movzx eax, byte ptr [r15 + 0x4c]
145970a84: 488d8dc8010000 lea rcx, [rbp + 0x1c8]
145970a8b: 48894c2438 mov qword ptr [rsp + 0x38], rcx
145970a90: 88442430 mov byte ptr [rsp + 0x30], al
145970a94: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
145970a9a: f3440f116c2428 movss dword ptr [rsp + 0x28], xmm13
145970aa1: 4889f1 mov rcx, rsi
145970aa4: 4c89e2 mov rdx, r12
145970aa7: e894e2ffff call 0x14596ed40
145970aac: f30f10b6340a0000 movss xmm6, dword ptr [rsi + 0xa34]
145970ab4: f3450f104728 movss xmm8, dword ptr [r15 + 0x28]
145970aba: f3450f104f38 movss xmm9, dword ptr [r15 + 0x38]
145970ac0: f3440f10158f434600 movss xmm10, dword ptr [rip + 0x46438f]
145970ac9: f3450f59d0 mulss xmm10, xmm8
145970ace: f3440f5815918c8b01 addss xmm10, dword ptr [rip + 0x18b8c91]
145970ad7: f30f103dc5c74200 movss xmm7, dword ptr [rip + 0x42c7c5]
145970adf: f3410f59f9 mulss xmm7, xmm9
145970ae4: 0fb785d4010000 movzx eax, word ptr [rbp + 0x1d4]
145970aeb: 450f57f6 xorps xmm14, xmm14
145970aef: f3440f2af0 cvtsi2ss xmm14, eax
145970af4: f3440f5e35d3c74200 divss xmm14, dword ptr [rip + 0x42c7d3]
145970afd: f3440f593592d05c00 mulss xmm14, dword ptr [rip + 0x5cd092]
145970b06: 410fb65f4c movzx ebx, byte ptr [r15 + 0x4c]
145970b0b: f3450f59773c mulss xmm14, dword ptr [r15 + 0x3c]
145970b11: 488b96a0090000 mov rdx, qword ptr [rsi + 0x9a0]
145970b18: 488b86a8090000 mov rax, qword ptr [rsi + 0x9a8]
145970b1f: 4c8b86b8090000 mov r8, qword ptr [rsi + 0x9b8]
145970b26: 488b8eb0090000 mov rcx, qword ptr [rsi + 0x9b0]
145970b2d: f30f1005bb164700 movss xmm0, dword ptr [rip + 0x4716bb]
145970b35: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
145970b40: 4e8d0c02 lea r9, [rdx + r8]
145970b44: 49c1c117 rol r9, 0x17
145970b48: 4901d1 add r9, rdx
145970b4b: 4989c2 mov r10, rax
145970b4e: 49c1e211 shl r10, 0x11
145970b52: 4831d1 xor rcx, rdx
145970b55: 4931c0 xor r8, rax
145970b58: 4831c8 xor rax, rcx
145970b5b: 4c31c2 xor rdx, r8
145970b5e: 49c1c02d rol r8, 0x2d
145970b62: 4c31d1 xor rcx, r10
145970b65: 49c1e929 shr r9, 0x29
145970b69: 4181c90000803f or r9d, 0x3f800000
145970b70: 66450f6ef9 movd xmm15, r9d
145970b75: f3450f58fc addss xmm15, xmm12
145970b7a: f3440f59f8 mulss xmm15, xmm0
145970b7f: 410f2ec7 ucomiss xmm0, xmm15
145970b83: 76bb jbe 0x145970b40
145970b85: 0f57c0 xorps xmm0, xmm0
145970b88: f3440f58d8 addss xmm11, xmm0
145970b8d: f3440f58f8 addss xmm15, xmm0
145970b92: 488996a0090000 mov qword ptr [rsi + 0x9a0], rdx
145970b99: 4c8986b8090000 mov qword ptr [rsi + 0x9b8], r8
145970ba0: 488986a8090000 mov qword ptr [rsi + 0x9a8], rax
145970ba7: 48898eb0090000 mov qword ptr [rsi + 0x9b0], rcx
145970bae: f3440f58fe addss xmm15, xmm6
145970bb3: 48c745c800000000 mov qword ptr [rbp - 0x38], 0
145970bbb: 48c745d008000000 mov qword ptr [rbp - 0x30], 8
145970bc3: 48c745d800000000 mov qword ptr [rbp - 0x28], 0
145970bcb: 48c745e0ffffffff mov qword ptr [rbp - 0x20], 0xffffffffffffffff
145970bd3: 48c74520ffffffff mov qword ptr [rbp + 0x20], 0xffffffffffffffff
145970bdb: c7457800000000 mov dword ptr [rbp + 0x78], 0
145970be2: c7858000000000000000 mov dword ptr [rbp + 0x80], 0
145970bec: c7858800000000000000 mov dword ptr [rbp + 0x88], 0
145970bf6: c78598000000ffffffff mov dword ptr [rbp + 0x98], 0xffffffff
145970c00: 4c89a5b8000000 mov qword ptr [rbp + 0xb8], r12
145970c07: 4c89bdc0000000 mov qword ptr [rbp + 0xc0], r15
145970c0e: 450f57e4 xorps xmm12, xmm12
145970c12: 440f11a5c8000000 movups xmmword ptr [rbp + 0xc8], xmm12
145970c1a: 440f11a5d8000000 movups xmmword ptr [rbp + 0xd8], xmm12
145970c22: 440f11a5e8000000 movups xmmword ptr [rbp + 0xe8], xmm12
145970c2a: 440f11a5f8000000 movups xmmword ptr [rbp + 0xf8], xmm12
145970c32: 440f11a508010000 movups xmmword ptr [rbp + 0x108], xmm12
145970c3a: 48c7851801000000000000 mov qword ptr [rbp + 0x118], 0
145970c45: f3440f11ad20010000 movss dword ptr [rbp + 0x120], xmm13
145970c4e: 440f13ad24010000 movlps qword ptr [rbp + 0x124], xmm13
145970c56: f3440f11b52c010000 movss dword ptr [rbp + 0x12c], xmm14
145970c5f: f3440f118d30010000 movss dword ptr [rbp + 0x130], xmm9
145970c68: f3440f119534010000 movss dword ptr [rbp + 0x134], xmm10
145970c71: f3440f118538010000 movss dword ptr [rbp + 0x138], xmm8
145970c7a: 8b85d0010000 mov eax, dword ptr [rbp + 0x1d0]
145970c80: 898544010000 mov dword ptr [rbp + 0x144], eax
145970c86: 488b8dc8010000 mov rcx, qword ptr [rbp + 0x1c8]
145970c8d: 48898d3c010000 mov qword ptr [rbp + 0x13c], rcx
145970c94: 898550010000 mov dword ptr [rbp + 0x150], eax
145970c9a: 48898d48010000 mov qword ptr [rbp + 0x148], rcx
145970ca1: 0f57c0 xorps xmm0, xmm0
145970ca4: f30f10c6 movss xmm0, xmm6
145970ca8: 0f138554010000 movlps qword ptr [rbp + 0x154], xmm0
145970caf: f3440f11bd5c010000 movss dword ptr [rbp + 0x15c], xmm15
145970cb8: f30f11bd60010000 movss dword ptr [rbp + 0x160], xmm7
145970cc0: 440f11a564010000 movups xmmword ptr [rbp + 0x164], xmm12
145970cc8: 440f11a574010000 movups xmmword ptr [rbp + 0x174], xmm12
145970cd0: f3440f119d84010000 movss dword ptr [rbp + 0x184], xmm11
145970cd9: 440f11a588010000 movups xmmword ptr [rbp + 0x188], xmm12
145970ce1: c7859801000000000000 mov dword ptr [rbp + 0x198], 0
145970ceb: 889d9c010000 mov byte ptr [rbp + 0x19c], bl
145970cf1: 488bbe68050000 mov rdi, qword ptr [rsi + 0x568]
145970cf8: 483bbe58050000 cmp rdi, qword ptr [rsi + 0x558]
145970cff: 750d jne 0x145970d0e
145970d01: 488d8e58050000 lea rcx, [rsi + 0x558]
145970d08: e8f3d64000 call 0x145d7e400
145970d0d: 90 nop
145970d0e: 488b8660050000 mov rax, qword ptr [rsi + 0x560]
145970d15: 4869cfd8010000 imul rcx, rdi, 0x1d8
145970d1c: 48c7040800000000 mov qword ptr [rax + rcx], 0
145970d24: 48c744080808000000 mov qword ptr [rax + rcx + 8], 8
145970d2d: 48c744081000000000 mov qword ptr [rax + rcx + 0x10], 0
145970d36: 48c7440818ffffffff mov qword ptr [rax + rcx + 0x18], 0xffffffffffffffff
145970d3f: 48c7440858ffffffff mov qword ptr [rax + rcx + 0x58], 0xffffffffffffffff
145970d48: c78408b000000000000000 mov dword ptr [rax + rcx + 0xb0], 0
145970d53: c78408b800000000000000 mov dword ptr [rax + rcx + 0xb8], 0
145970d5e: c78408c000000000000000 mov dword ptr [rax + rcx + 0xc0], 0
145970d69: c78408d0000000ffffffff mov dword ptr [rax + rcx + 0xd0], 0xffffffff
145970d74: 4c89a408f0000000 mov qword ptr [rax + rcx + 0xf0], r12
145970d7c: 4c89bc08f8000000 mov qword ptr [rax + rcx + 0xf8], r15
145970d84: 440f11a40800010000 movups xmmword ptr [rax + rcx + 0x100], xmm12
145970d8d: 440f11a40810010000 movups xmmword ptr [rax + rcx + 0x110], xmm12
145970d96: 440f11a40820010000 movups xmmword ptr [rax + rcx + 0x120], xmm12
145970d9f: 440f11a40830010000 movups xmmword ptr [rax + rcx + 0x130], xmm12
145970da8: 440f11a40840010000 movups xmmword ptr [rax + rcx + 0x140], xmm12
145970db1: 48c784085001000000000000 mov qword ptr [rax + rcx + 0x150], 0
145970dbd: f3440f11ac0858010000 movss dword ptr [rax + rcx + 0x158], xmm13
145970dc7: 440f13ac085c010000 movlps qword ptr [rax + rcx + 0x15c], xmm13
145970dd0: f3440f11b40864010000 movss dword ptr [rax + rcx + 0x164], xmm14
145970dda: f3440f118c0868010000 movss dword ptr [rax + rcx + 0x168], xmm9
145970de4: f3440f1194086c010000 movss dword ptr [rax + rcx + 0x16c], xmm10
145970dee: f3440f11840870010000 movss dword ptr [rax + rcx + 0x170], xmm8
145970df8: 8b95d0010000 mov edx, dword ptr [rbp + 0x1d0]
145970dfe: 8994087c010000 mov dword ptr [rax + rcx + 0x17c], edx
145970e05: 488b95c8010000 mov rdx, qword ptr [rbp + 0x1c8]
145970e0c: 4889940874010000 mov qword ptr [rax + rcx + 0x174], rdx
145970e14: 488b95c8010000 mov rdx, qword ptr [rbp + 0x1c8]
145970e1b: 4889940880010000 mov qword ptr [rax + rcx + 0x180], rdx
145970e23: 8b95d0010000 mov edx, dword ptr [rbp + 0x1d0]
145970e29: 89940888010000 mov dword ptr [rax + rcx + 0x188], edx
145970e30: f30f11b4088c010000 movss dword ptr [rax + rcx + 0x18c], xmm6
145970e39: c784089001000000000000 mov dword ptr [rax + rcx + 0x190], 0
145970e44: f3440f11bc0894010000 movss dword ptr [rax + rcx + 0x194], xmm15
145970e4e: f30f11bc0898010000 movss dword ptr [rax + rcx + 0x198], xmm7
145970e57: 440f11a4089c010000 movups xmmword ptr [rax + rcx + 0x19c], xmm12
145970e60: 440f11a408ac010000 movups xmmword ptr [rax + rcx + 0x1ac], xmm12
145970e69: f3440f119c08bc010000 movss dword ptr [rax + rcx + 0x1bc], xmm11
145970e73: 440f11a408c0010000 movups xmmword ptr [rax + rcx + 0x1c0], xmm12
145970e7c: c78408d001000000000000 mov dword ptr [rax + rcx + 0x1d0], 0
145970e87: 889c08d4010000 mov byte ptr [rax + rcx + 0x1d4], bl
145970e8e: 48ffc7 inc rdi
145970e91: 4889be68050000 mov qword ptr [rsi + 0x568], rdi
145970e98: b801000000 mov eax, 1
145970e9d: 4c89e2 mov rdx, r12
145970ea0: 0f28b5e0010000 movaps xmm6, xmmword ptr [rbp + 0x1e0]
145970ea7: 0f28bdf0010000 movaps xmm7, xmmword ptr [rbp + 0x1f0]
145970eae: 440f288500020000 movaps xmm8, xmmword ptr [rbp + 0x200]
145970eb6: 440f288d10020000 movaps xmm9, xmmword ptr [rbp + 0x210]
145970ebe: 440f289520020000 movaps xmm10, xmmword ptr [rbp + 0x220]
145970ec6: 440f289d30020000 movaps xmm11, xmmword ptr [rbp + 0x230]
145970ece: 440f28a540020000 movaps xmm12, xmmword ptr [rbp + 0x240]
145970ed6: 440f28ad50020000 movaps xmm13, xmmword ptr [rbp + 0x250]
145970ede: 440f28b560020000 movaps xmm14, xmmword ptr [rbp + 0x260]
145970ee6: 440f28bd70020000 movaps xmm15, xmmword ptr [rbp + 0x270]
145970eee: 4881c408030000 add rsp, 0x308
145970ef5: 5b pop rbx
145970ef6: 5f pop rdi
145970ef7: 5e pop rsi
145970ef8: 415c pop r12
145970efa: 415d pop r13
145970efc: 415e pop r14
145970efe: 415f pop r15
145970f00: 5d pop rbp
145970f01: c3 ret
145970f02: 4c8d05ffa58b01 lea r8, [rip + 0x18ba5ff]
145970f09: 4c89f1 mov rcx, r14
145970f0c: e842874200 call 0x145d99653
145970f11: 0f0b ud2
