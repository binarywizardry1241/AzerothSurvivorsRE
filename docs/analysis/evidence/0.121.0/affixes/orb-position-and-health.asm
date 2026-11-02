0000000145c29258 f20f10b620050000               movsd xmm6, qword ptr [rsi + 0x520]
0000000145c29260 4c8b86c00b0000                 mov r8, qword ptr [rsi + 0xbc0]
0000000145c29267 488b96d80b0000                 mov rdx, qword ptr [rsi + 0xbd8]
0000000145c2926e 488b8ec80b0000                 mov rcx, qword ptr [rsi + 0xbc8]
0000000145c29275 488b86d00b0000                 mov rax, qword ptr [rsi + 0xbd0]
0000000145c2927c f30f1005acef5600               movss xmm0, dword ptr [rip + 0x56efac]
0000000145c29284 f30f100d98f05600               movss xmm1, dword ptr [rip + 0x56f098]
0000000145c2928c 0f1f4000                       nop dword ptr [rax]
0000000145c29290 4d8d0c10                       lea r9, [r8 + rdx]
0000000145c29294 49c1c117                       rol r9, 0x17
0000000145c29298 4d01c1                         add r9, r8
0000000145c2929b 4989ca                         mov r10, rcx
0000000145c2929e 49c1e211                       shl r10, 0x11
0000000145c292a2 4c31c0                         xor rax, r8
0000000145c292a5 4831ca                         xor rdx, rcx
0000000145c292a8 4831c1                         xor rcx, rax
0000000145c292ab 4931d0                         xor r8, rdx
0000000145c292ae 48c1c22d                       rol rdx, 0x2d
0000000145c292b2 4c31d0                         xor rax, r10
0000000145c292b5 49c1e929                       shr r9, 0x29
0000000145c292b9 4181c90000803f                 or r9d, 0x3f800000
0000000145c292c0 66450f6ec1                     movd xmm8, r9d
0000000145c292c5 f3440f58c0                     addss xmm8, xmm0
0000000145c292ca f3440f59c1                     mulss xmm8, xmm1
0000000145c292cf 410f2ec8                       ucomiss xmm1, xmm8
0000000145c292d3 76bb                           jbe 0x145c29290
0000000145c292d5 4c8986c00b0000                 mov qword ptr [rsi + 0xbc0], r8
0000000145c292dc 488996d80b0000                 mov qword ptr [rsi + 0xbd8], rdx
0000000145c292e3 48898ec80b0000                 mov qword ptr [rsi + 0xbc8], rcx
0000000145c292ea 488986d00b0000                 mov qword ptr [rsi + 0xbd0], rax
0000000145c292f1 f30f100d2ff05600               movss xmm1, dword ptr [rip + 0x56f02f]
0000000145c292f9 f30f10157ff05600               movss xmm2, dword ptr [rip + 0x56f07f]
0000000145c29301 f30f101d97f35600               movss xmm3, dword ptr [rip + 0x56f397]
0000000145c29309 0f1f8000000000                 nop dword ptr [rax]
0000000145c29310 4d8d0c10                       lea r9, [r8 + rdx]
0000000145c29314 49c1c117                       rol r9, 0x17
0000000145c29318 4d01c1                         add r9, r8
0000000145c2931b 4989ca                         mov r10, rcx
0000000145c2931e 49c1e211                       shl r10, 0x11
0000000145c29322 4c31c0                         xor rax, r8
0000000145c29325 4831ca                         xor rdx, rcx
0000000145c29328 4831c1                         xor rcx, rax
0000000145c2932b 4931d0                         xor r8, rdx
0000000145c2932e 4c31d0                         xor rax, r10
0000000145c29331 48c1c22d                       rol rdx, 0x2d
0000000145c29335 49c1e929                       shr r9, 0x29
0000000145c29339 4181c90000803f                 or r9d, 0x3f800000
0000000145c29340 66450f6ed9                     movd xmm11, r9d
0000000145c29345 f3440f58d8                     addss xmm11, xmm0
0000000145c2934a f3440f59d9                     mulss xmm11, xmm1
0000000145c2934f f3440f58da                     addss xmm11, xmm2
0000000145c29354 410f2edb                       ucomiss xmm3, xmm11
0000000145c29358 76b6                           jbe 0x145c29310
0000000145c2935a 0f57c0                         xorps xmm0, xmm0
0000000145c2935d f3440f58c0                     addss xmm8, xmm0
0000000145c29362 4c8986c00b0000                 mov qword ptr [rsi + 0xbc0], r8
0000000145c29369 488996d80b0000                 mov qword ptr [rsi + 0xbd8], rdx
0000000145c29370 48898ec80b0000                 mov qword ptr [rsi + 0xbc8], rcx
0000000145c29377 488986d00b0000                 mov qword ptr [rsi + 0xbd0], rax
0000000145c2937e 410f28c0                       movaps xmm0, xmm8
0000000145c29382 e8e2283c00                     call 0x145febc69
0000000145c29387 440f28c8                       movaps xmm9, xmm0
0000000145c2938b 410f28c0                       movaps xmm0, xmm8
0000000145c2938f e8c3283c00                     call 0x145febc57
0000000145c29394 440f14c8                       unpcklps xmm9, xmm0
0000000145c29398 f3410f12c3                     movsldup xmm0, xmm11
0000000145c2939d 410f59c1                       mulps xmm0, xmm9
0000000145c293a1 0f58f0                         addps xmm6, xmm0
0000000145c293a4 f3440f16c6                     movshdup xmm8, xmm6
0000000145c293a9 488bbeb80b0000                 mov rdi, qword ptr [rsi + 0xbb8]
0000000145c293b0 488d4f10                       lea rcx, [rdi + 0x10]
0000000145c293b4 c6853701000000                 mov byte ptr [rbp + 0x137], 0
0000000145c293bb 0f28ce                         movaps xmm1, xmm6
0000000145c293be 410f28d0                       movaps xmm2, xmm8
0000000145c293c2 e89977f6ff                     call 0x145b90b60
0000000145c293c7 90                             nop
0000000145c293c8 a801                           test al, 1
0000000145c293ca 7541                           jne 0x145c2940d
0000000145c293cc 48837f68ff                     cmp qword ptr [rdi + 0x68], -1
0000000145c293d1 7432                           je 0x145c29405
0000000145c293d3 488d5768                       lea rdx, [rdi + 0x68]
0000000145c293d7 c6853701000000                 mov byte ptr [rbp + 0x137], 0
0000000145c293de 488d8dd0000000                 lea rcx, [rbp + 0xd0]
0000000145c293e5 0f28d6                         movaps xmm2, xmm6
0000000145c293e8 410f28d8                       movaps xmm3, xmm8
0000000145c293ec e8efcff6ff                     call 0x145b963e0
0000000145c293f1 90                             nop
0000000145c293f2 83bdd000000001                 cmp dword ptr [rbp + 0xd0], 1
0000000145c293f9 750a                           jne 0x145c29405
0000000145c293fb f30f1085dc000000               movss xmm0, dword ptr [rbp + 0xdc]
0000000145c29403 eb08                           jmp 0x145c2940d
0000000145c29405 f30f1087b8000000               movss xmm0, dword ptr [rdi + 0xb8]
0000000145c2940d 0f13b598000000                 movlps qword ptr [rbp + 0x98], xmm6
0000000145c29414 f30f1185a0000000               movss dword ptr [rbp + 0xa0], xmm0
0000000145c2941c 488b8ed0020000                 mov rcx, qword ptr [rsi + 0x2d0]
0000000145c29423 488b96d8020000                 mov rdx, qword ptr [rsi + 0x2d8]
0000000145c2942a e8612de7ff                     call 0x145a9c190
0000000145c2942f 4869c8f0000000                 imul rcx, rax, 0xf0
0000000145c29436 488d05134e3901                 lea rax, [rip + 0x1394e13]
0000000145c2943d 4801c8                         add rax, rcx
0000000145c29440 0fb68e6f030000                 movzx ecx, byte ptr [rsi + 0x36f]
0000000145c29447 8d51fa                         lea edx, [rcx - 6]
0000000145c2944a 80fafb                         cmp dl, 0xfb
0000000145c2944d 0f92c2                         setb dl
0000000145c29450 4c8d0449                       lea r8, [rcx + rcx*2]
0000000145c29454 41c1e004                       shl r8d, 4
0000000145c29458 488d0d810e3a01                 lea rcx, [rip + 0x13a0e81]
0000000145c2945f 4c01c1                         add rcx, r8
0000000145c29462 4883f930                       cmp rcx, 0x30
0000000145c29466 410f94c0                       sete r8b
0000000145c2946a 4108d0                         or r8b, dl
0000000145c2946d 7506                           jne 0x145c29475
0000000145c2946f f3440f1051f0                   movss xmm10, dword ptr [rcx - 0x10]
0000000145c29475 f30f1086740c0000               movss xmm0, dword ptr [rsi + 0xc74]
0000000145c2947d f30f108ef80c0000               movss xmm1, dword ptr [rsi + 0xcf8]
0000000145c29485 488b4878                       mov rcx, qword ptr [rax + 0x78]
0000000145c29489 f30f105130                     movss xmm2, dword ptr [rcx + 0x30]
0000000145c2948e f30f59151e62a601               mulss xmm2, dword ptr [rip + 0x1a6621e]
0000000145c29496 f30f5988e0000000               mulss xmm1, dword ptr [rax + 0xe0]
0000000145c2949e f30f5e058a045c00               divss xmm0, dword ptr [rip + 0x5c048a]
0000000145c294a6 f30f101d06ee5600               movss xmm3, dword ptr [rip + 0x56ee06]
0000000145c294ae f30f59d8                       mulss xmm3, xmm0
0000000145c294b2 f30f581de6ec5600               addss xmm3, dword ptr [rip + 0x56ece6]
0000000145c294ba f30f1025ae62a601               movss xmm4, dword ptr [rip + 0x1a662ae]
0000000145c294c2 f30f59e0                       mulss xmm4, xmm0
0000000145c294c6 f30f59e0                       mulss xmm4, xmm0
0000000145c294ca f30f58e3                       addss xmm4, xmm3
0000000145c294ce f30f101d9e62a601               movss xmm3, dword ptr [rip + 0x1a6629e]
0000000145c294d6 f30f59d8                       mulss xmm3, xmm0
0000000145c294da f30f59d8                       mulss xmm3, xmm0
0000000145c294de f30f59d8                       mulss xmm3, xmm0
0000000145c294e2 f30f58dc                       addss xmm3, xmm4
0000000145c294e6 f30f59d9                       mulss xmm3, xmm1
0000000145c294ea f30f59da                       mulss xmm3, xmm2
0000000145c294ee f3410f59da                     mulss xmm3, xmm10
0000000145c294f3 f30f58db                       addss xmm3, xmm3
0000000145c294f7 48b803000000cdcccc3e           movabs rax, 0x3ecccccd00000003
0000000145c29501 488985d0000000                 mov qword ptr [rbp + 0xd0], rax
0000000145c29508 c6853701000000                 mov byte ptr [rbp + 0x137], 0
0000000145c2950f 4c896c2420                     mov qword ptr [rsp + 0x20], r13
0000000145c29514 f30f115c2428                   movss dword ptr [rsp + 0x28], xmm3
0000000145c2951a c744243000000041               mov dword ptr [rsp + 0x30], 0x41000000
0000000145c29522 4c8d8dd0000000                 lea r9, [rbp + 0xd0]
0000000145c29529 41b80c000000                   mov r8d, 0xc
0000000145c2952f 4889f1                         mov rcx, rsi
0000000145c29532 31d2                           xor edx, edx
0000000145c29534 e8d7f7fbff                     call 0x145be8d10
