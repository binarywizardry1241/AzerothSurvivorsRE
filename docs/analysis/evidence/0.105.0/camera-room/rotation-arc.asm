144fe3290: sub rsp, 0x28
144fe3294: movaps xmmword ptr [rsp + 0x10], xmm7
144fe3299: movaps xmmword ptr [rsp], xmm6
144fe329d: mov rax, rcx
144fe32a0: movsd xmm0, qword ptr [rdx]
144fe32a4: movsd xmm1, qword ptr [rdx + 4]
144fe32a9: movsd xmm2, qword ptr [r8]
144fe32ae: movsd xmm3, qword ptr [r8 + 4]
144fe32b4: movaps xmm4, xmm1
144fe32b7: mulps xmm4, xmm3
144fe32ba: movaps xmm5, xmm0
144fe32bd: mulss xmm5, xmm2
144fe32c1: addss xmm5, xmm4
144fe32c5: movshdup xmm4, xmm4
144fe32c9: addss xmm4, xmm5
144fe32cd: ucomiss xmm4, dword ptr [rip + 0x11d7e1c]
144fe32d4: jbe 0x144fe32e2
144fe32d6: movaps xmm0, xmmword ptr [rip + 0xe69a13]
144fe32dd: jmp 0x144fe33d9
144fe32e2: movss xmm5, dword ptr [rip + 0x11d7e0a]
144fe32ea: ucomiss xmm5, xmm4
144fe32ed: jbe 0x144fe335d
144fe32ef: movshdup xmm2, xmm1
144fe32f3: movaps xmm3, xmmword ptr [rip + 0xd8a4e6]
144fe32fa: movaps xmm4, xmm2
144fe32fd: andps xmm4, xmm3
144fe3300: orps xmm4, xmmword ptr [rip + 0xd8a559]
144fe3307: movaps xmm5, xmm2
144fe330a: cmpunordss xmm5, xmm2
144fe330f: movss xmm6, dword ptr [rip + 0xd8a559]
144fe3317: andps xmm6, xmm5
144fe331a: andnps xmm5, xmm4
144fe331d: orps xmm5, xmm6
144fe3320: addss xmm2, xmm5
144fe3324: movss xmm4, dword ptr [rip + 0xd909e8]
144fe332c: divss xmm4, xmm2
144fe3330: mulss xmm0, xmm1
144fe3334: mulss xmm0, xmm4
144fe3338: movaps xmm2, xmm1
144fe333b: mulss xmm2, xmm1
144fe333f: mulss xmm2, xmm4
144fe3343: addss xmm2, xmm5
144fe3347: unpcklps xmm0, xmm2
144fe334a: xorps xmm1, xmm3
144fe334d: movss xmm2, dword ptr [rip + 0x11d7da3]
144fe3355: unpcklps xmm1, xmm2
144fe3358: movlhps xmm0, xmm1
144fe335b: jmp 0x144fe33d9
144fe335d: movaps xmm5, xmm1
144fe3360: movlhps xmm5, xmm0
144fe3363: shufps xmm1, xmm0, 0x11
144fe3367: movlhps xmm4, xmm0
144fe336a: shufps xmm1, xmm4, 0x22
144fe336e: movss xmm4, dword ptr [rip + 0xd89ff6]
144fe3376: movaps xmm6, xmm4
144fe3379: shufps xmm6, xmm2, 0xd4
144fe337d: movaps xmm7, xmm2
144fe3380: shufps xmm7, xmm6, 0x20
144fe3384: movshdup xmm3, xmm3
144fe3388: movss xmm7, xmm3
144fe338c: mulps xmm1, xmm7
144fe338f: movaps xmm3, xmm4
144fe3392: shufps xmm3, xmm0, 0xd4
144fe3396: shufps xmm5, xmm3, 0x29
144fe339a: movlhps xmm4, xmm2
144fe339d: shufps xmm7, xmm4, 0x22
144fe33a1: mulps xmm7, xmm5
144fe33a4: movaps xmm0, xmm1
144fe33a7: subps xmm0, xmm7
144fe33aa: addps xmm7, xmm1
144fe33ad: shufps xmm7, xmm0, 0x23
144fe33b1: shufps xmm0, xmm7, 0x24
144fe33b5: movaps xmm1, xmm0
144fe33b8: mulps xmm1, xmm0
144fe33bb: movaps xmm2, xmm1
144fe33be: shufps xmm2, xmm1, 0xe
144fe33c2: addps xmm2, xmm1
144fe33c5: movaps xmm1, xmm2
144fe33c8: shufps xmm1, xmm2, 0
144fe33cc: shufps xmm2, xmm2, 0x55
144fe33d0: addps xmm2, xmm1
144fe33d3: sqrtps xmm1, xmm2
144fe33d6: divps xmm0, xmm1
144fe33d9: movaps xmmword ptr [rax], xmm0
144fe33dc: movaps xmm6, xmmword ptr [rsp]
144fe33e0: movaps xmm7, xmmword ptr [rsp + 0x10]
144fe33e5: add rsp, 0x28
144fe33e9: ret
