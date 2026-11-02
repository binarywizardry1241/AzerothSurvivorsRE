0x14599c67a: f30f103d1e0c4000 movss xmm7, dword ptr [rip + 0x400c1e]
0x14599c682: 83be7009000001 cmp dword ptr [rsi + 0x970], 1
0x14599c689: 0f28c7 movaps xmm0, xmm7
0x14599c68c: 7534 jne 0x14599c6c2
0x14599c68e: 80beb80a000000 cmp byte ptr [rsi + 0xab8], 0
0x14599c695: 0f28c7 movaps xmm0, xmm7
0x14599c698: 7428 je 0x14599c6c2
0x14599c69a: 410f28ca movaps xmm1, xmm10
0x14599c69e: f30f5c8e74090000 subss xmm1, dword ptr [rsi + 0x974]
0x14599c6a6: f30f5e0d923e4500 divss xmm1, dword ptr [rip + 0x453e92]
0x14599c6ae: 0f57c0 xorps xmm0, xmm0
0x14599c6b1: f30f5fc8 maxss xmm1, xmm0
0x14599c6b5: f30f100553d38801 movss xmm0, dword ptr [rip + 0x188d353]
0x14599c6bd: e8a3da2500 call 0x145bfa165
0x14599c6c2: f3440f5e15753e4500 divss xmm10, dword ptr [rip + 0x453e75]
0x14599c6cb: f30f100df5834300 movss xmm1, dword ptr [rip + 0x4383f5]
0x14599c6d3: f3410f59ca mulss xmm1, xmm10
0x14599c6d8: f30f58cf addss xmm1, xmm7
0x14599c6dc: f30f1015f8d38801 movss xmm2, dword ptr [rip + 0x188d3f8]
0x14599c6e4: f3410f59d2 mulss xmm2, xmm10
0x14599c6e9: f3410f59d2 mulss xmm2, xmm10
0x14599c6ee: f30f58d1 addss xmm2, xmm1
0x14599c6f2: f3450f59c1 mulss xmm8, xmm9
0x14599c6f7: 0f57c9 xorps xmm1, xmm1
0x14599c6fa: f3410f51c8 sqrtss xmm1, xmm8
0x14599c6ff: f30f59ca mulss xmm1, xmm2
0x14599c703: f30f59f1 mulss xmm6, xmm1
0x14599c707: f30f593571074300 mulss xmm6, dword ptr [rip + 0x430771]
0x14599c70f: f30f59f0 mulss xmm6, xmm0
0x14599c713: 8b865c070000 mov eax, dword ptr [rsi + 0x75c]
0x14599c719: 0f57c9 xorps xmm1, xmm1
0x14599c71c: f3480f2ac8 cvtsi2ss xmm1, rax
0x14599c721: f30f590d5f074300 mulss xmm1, dword ptr [rip + 0x43075f]
0x14599c729: f30f58cf addss xmm1, xmm7
0x14599c72d: f30f59ce mulss xmm1, xmm6
0x14599c731: 0fb786b4020000 movzx eax, word ptr [rsi + 0x2b4]
0x14599c738: 0f57c0 xorps xmm0, xmm0
0x14599c73b: f30f2ac0 cvtsi2ss xmm0, eax
0x14599c73f: f30f5e05890b4000 divss xmm0, dword ptr [rip + 0x400b89]
0x14599c747: f30f59c1 mulss xmm0, xmm1
0x14599c74b: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
0x14599c750: 0f287c2430 movaps xmm7, xmmword ptr [rsp + 0x30]
0x14599c755: 440f28442440 movaps xmm8, xmmword ptr [rsp + 0x40]
0x14599c75b: 440f284c2450 movaps xmm9, xmmword ptr [rsp + 0x50]
0x14599c761: 440f28542460 movaps xmm10, xmmword ptr [rsp + 0x60]
0x14599c767: 4883c478 add rsp, 0x78
0x14599c76b: 5f pop rdi
0x14599c76c: 5e pop rsi
0x14599c76d: c3 ret
0x14599c76e: 4c8d05a3018901 lea r8, [rip + 0x18901a3]
0x14599c775: 4889f9 mov rcx, rdi
0x14599c778: e8d6ce3f00 call 0x145d99653
0x14599c77d: 0f0b ud2
