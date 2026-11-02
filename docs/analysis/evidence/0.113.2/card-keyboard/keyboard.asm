00000001400b3420: 4157                           push r15
00000001400b3422: 4156                           push r14
00000001400b3424: 56                             push rsi
00000001400b3425: 57                             push rdi
00000001400b3426: 55                             push rbp
00000001400b3427: 53                             push rbx
00000001400b3428: 4881ec38010000                 sub rsp, 0x138
00000001400b342f: 0f29b42420010000               movaps xmmword ptr [rsp + 0x120], xmm6
00000001400b3437: 498b19                         mov rbx, qword ptr [r9]
00000001400b343a: 48837b1800                     cmp qword ptr [rbx + 0x18], 0
00000001400b343f: 0f845c030000                   je 0x1400b37a1
00000001400b3445: 807b1000                       cmp byte ptr [rbx + 0x10], 0
00000001400b3449: 0f8552030000                   jne 0x1400b37a1
00000001400b344f: 498b00                         mov rax, qword ptr [r8]
00000001400b3452: 80780100                       cmp byte ptr [rax + 1], 0
00000001400b3456: 0f8545030000                   jne 0x1400b37a1
00000001400b345c: 488b842498010000               mov rax, qword ptr [rsp + 0x198]
00000001400b3464: 488b8c2490010000               mov rcx, qword ptr [rsp + 0x190]
00000001400b346c: 4c8b32                         mov r14, qword ptr [rdx]
00000001400b346f: 4d8b7910                       mov r15, qword ptr [r9 + 0x10]
00000001400b3473: 418b691c                       mov ebp, dword ptr [r9 + 0x1c]
00000001400b3477: 488b31                         mov rsi, qword ptr [rcx]
00000001400b347a: 488b00                         mov rax, qword ptr [rax]
00000001400b347d: f30f10705c                     movss xmm6, dword ptr [rax + 0x5c]
00000001400b3482: c744242c56000000               mov dword ptr [rsp + 0x2c], 0x56
00000001400b348a: c744242007000000               mov dword ptr [rsp + 0x20], 7
00000001400b3492: 498d7e20                       lea rdi, [r14 + 0x20]
00000001400b3496: 49837e3800                     cmp qword ptr [r14 + 0x38], 0
00000001400b349b: 0f8447010000                   je 0x1400b35e8
00000001400b34a1: 48ba2501865be560b09f           movabs rdx, 0x9fb060e55b860125
00000001400b34ab: 4c8d442420                     lea r8, [rsp + 0x20]
00000001400b34b0: 4889f9                         mov rcx, rdi
00000001400b34b3: e808b30a00                     call 0x14015e7c0
00000001400b34b8: 4885c0                         test rax, rax
00000001400b34bb: 751c                           jne 0x1400b34d9
00000001400b34bd: 48ba6b3ddba82c015305           movabs rdx, 0x553012ca8db3d6b
00000001400b34c7: 4c8d44242c                     lea r8, [rsp + 0x2c]
00000001400b34cc: 4889f9                         mov rcx, rdi
00000001400b34cf: e8ecb20a00                     call 0x14015e7c0
00000001400b34d4: 4885c0                         test rax, rax
00000001400b34d7: 745e                           je 0x1400b3537
00000001400b34d9: 41892f                         mov dword ptr [r15], ebp
00000001400b34dc: 48837b1800                     cmp qword ptr [rbx + 0x18], 0
00000001400b34e1: 7454                           je 0x1400b3537
00000001400b34e3: 807b1000                       cmp byte ptr [rbx + 0x10], 0
00000001400b34e7: 754e                           jne 0x1400b3537
00000001400b34e9: 0f28c6                         movaps xmm0, xmm6
00000001400b34ec: f30f5c4344                     subss xmm0, dword ptr [rbx + 0x44]
00000001400b34f1: f30f100d77f0de05               movss xmm1, dword ptr [rip + 0x5def077]
00000001400b34f9: 0f2ec8                         ucomiss xmm1, xmm0
00000001400b34fc: 7739                           ja 0x1400b3537
00000001400b34fe: 48c744244000000000             mov qword ptr [rsp + 0x40], 0
00000001400b3507: c744243802000000               mov dword ptr [rsp + 0x38], 2
00000001400b350f: 488d542438                     lea rdx, [rsp + 0x38]
00000001400b3514: 4889f1                         mov rcx, rsi
00000001400b3517: e8849f0200                     call 0x1400dd4a0
00000001400b351c: c7431001000000                 mov dword ptr [rbx + 0x10], 1
00000001400b3523: f30f117314                     movss dword ptr [rbx + 0x14], xmm6
00000001400b3528: 48c70301000000                 mov qword ptr [rbx], 1
00000001400b352f: 48c7430800000000               mov qword ptr [rbx + 8], 0
00000001400b3537: 49837e3800                     cmp qword ptr [r14 + 0x38], 0
00000001400b353c: c744242c57000000               mov dword ptr [rsp + 0x2c], 0x57
00000001400b3544: c744242008000000               mov dword ptr [rsp + 0x20], 8
00000001400b354c: 0f8496000000                   je 0x1400b35e8
00000001400b3552: 48ba8b170937c2e5b55d           movabs rdx, 0x5db5e5c23709178b
00000001400b355c: 4c8d442420                     lea r8, [rsp + 0x20]
00000001400b3561: 4889f9                         mov rcx, rdi
00000001400b3564: e857b20a00                     call 0x14015e7c0
00000001400b3569: 4885c0                         test rax, rax
00000001400b356c: 751c                           jne 0x1400b358a
00000001400b356e: 48ba714e5f62747b87c5           movabs rdx, 0xc5877b74625f4e71
00000001400b3578: 4c8d44242c                     lea r8, [rsp + 0x2c]
00000001400b357d: 4889f9                         mov rcx, rdi
00000001400b3580: e83bb20a00                     call 0x14015e7c0
00000001400b3585: 4885c0                         test rax, rax
00000001400b3588: 745e                           je 0x1400b35e8
00000001400b358a: 41892f                         mov dword ptr [r15], ebp
00000001400b358d: 48837b1802                     cmp qword ptr [rbx + 0x18], 2
00000001400b3592: 7254                           jb 0x1400b35e8
00000001400b3594: 807b1000                       cmp byte ptr [rbx + 0x10], 0
00000001400b3598: 754e                           jne 0x1400b35e8
00000001400b359a: 0f28c6                         movaps xmm0, xmm6
00000001400b359d: f30f5c4344                     subss xmm0, dword ptr [rbx + 0x44]
00000001400b35a2: f30f100dc6efde05               movss xmm1, dword ptr [rip + 0x5deefc6]
00000001400b35aa: 0f2ec8                         ucomiss xmm1, xmm0
00000001400b35ad: 7739                           ja 0x1400b35e8
00000001400b35af: 48c744244001000000             mov qword ptr [rsp + 0x40], 1
00000001400b35b8: c744243802000000               mov dword ptr [rsp + 0x38], 2
00000001400b35c0: 488d542438                     lea rdx, [rsp + 0x38]
00000001400b35c5: 4889f1                         mov rcx, rsi
00000001400b35c8: e8d39e0200                     call 0x1400dd4a0
00000001400b35cd: c7431001000000                 mov dword ptr [rbx + 0x10], 1
00000001400b35d4: f30f117314                     movss dword ptr [rbx + 0x14], xmm6
00000001400b35d9: 48c70301000000                 mov qword ptr [rbx], 1
00000001400b35e0: 48c7430801000000               mov qword ptr [rbx + 8], 1
00000001400b35e8: c744242c58000000               mov dword ptr [rsp + 0x2c], 0x58
00000001400b35f0: c744242009000000               mov dword ptr [rsp + 0x20], 9
00000001400b35f8: 49837e3800                     cmp qword ptr [r14 + 0x38], 0
00000001400b35fd: 0f849e010000                   je 0x1400b37a1
00000001400b3603: 48ba65a78ee815dcd91c           movabs rdx, 0x1cd9dc15e88ea765
00000001400b360d: 4c8d442420                     lea r8, [rsp + 0x20]
00000001400b3612: 4889f9                         mov rcx, rdi
00000001400b3615: e8a6b10a00                     call 0x14015e7c0
00000001400b361a: 4885c0                         test rax, rax
00000001400b361d: 751c                           jne 0x1400b363b
00000001400b361f: 48baa45c223e5dfcf883           movabs rdx, 0x83f8fc5d3e225ca4
00000001400b3629: 4c8d44242c                     lea r8, [rsp + 0x2c]
00000001400b362e: 4889f9                         mov rcx, rdi
00000001400b3631: e88ab10a00                     call 0x14015e7c0
00000001400b3636: 4885c0                         test rax, rax
00000001400b3639: 745e                           je 0x1400b3699
00000001400b363b: 41892f                         mov dword ptr [r15], ebp
00000001400b363e: 48837b1803                     cmp qword ptr [rbx + 0x18], 3
00000001400b3643: 7254                           jb 0x1400b3699
00000001400b3645: 807b1000                       cmp byte ptr [rbx + 0x10], 0
00000001400b3649: 754e                           jne 0x1400b3699
00000001400b364b: 0f28c6                         movaps xmm0, xmm6
00000001400b364e: f30f5c4344                     subss xmm0, dword ptr [rbx + 0x44]
00000001400b3653: f30f100d15efde05               movss xmm1, dword ptr [rip + 0x5deef15]
00000001400b365b: 0f2ec8                         ucomiss xmm1, xmm0
00000001400b365e: 7739                           ja 0x1400b3699
00000001400b3660: 48c744244002000000             mov qword ptr [rsp + 0x40], 2
00000001400b3669: c744243802000000               mov dword ptr [rsp + 0x38], 2
00000001400b3671: 488d542438                     lea rdx, [rsp + 0x38]
00000001400b3676: 4889f1                         mov rcx, rsi
00000001400b3679: e8229e0200                     call 0x1400dd4a0
00000001400b367e: c7431001000000                 mov dword ptr [rbx + 0x10], 1
00000001400b3685: f30f117314                     movss dword ptr [rbx + 0x14], xmm6
00000001400b368a: 48c70301000000                 mov qword ptr [rbx], 1
00000001400b3691: 48c7430802000000               mov qword ptr [rbx + 8], 2
00000001400b3699: 49837e3800                     cmp qword ptr [r14 + 0x38], 0
00000001400b369e: c744242c59000000               mov dword ptr [rsp + 0x2c], 0x59
00000001400b36a6: c74424200a000000               mov dword ptr [rsp + 0x20], 0xa
00000001400b36ae: 0f84ed000000                   je 0x1400b37a1
00000001400b36b4: 48bad0b511447251ddda           movabs rdx, 0xdadd51724411b5d0
00000001400b36be: 4c8d442420                     lea r8, [rsp + 0x20]
00000001400b36c3: 4889f9                         mov rcx, rdi
00000001400b36c6: e8f5b00a00                     call 0x14015e7c0
00000001400b36cb: 4885c0                         test rax, rax
00000001400b36ce: 751c                           jne 0x1400b36ec
00000001400b36d0: 48ba49eca7f7e4d62c42           movabs rdx, 0x422cd6e4f7a7ec49
00000001400b36da: 4c8d44242c                     lea r8, [rsp + 0x2c]
00000001400b36df: 4889f9                         mov rcx, rdi
00000001400b36e2: e8d9b00a00                     call 0x14015e7c0
00000001400b36e7: 4885c0                         test rax, rax
00000001400b36ea: 745e                           je 0x1400b374a
00000001400b36ec: 41892f                         mov dword ptr [r15], ebp
00000001400b36ef: 48837b1804                     cmp qword ptr [rbx + 0x18], 4
00000001400b36f4: 7254                           jb 0x1400b374a
00000001400b36f6: 807b1000                       cmp byte ptr [rbx + 0x10], 0
00000001400b36fa: 754e                           jne 0x1400b374a
00000001400b36fc: 0f28c6                         movaps xmm0, xmm6
00000001400b36ff: f30f5c4344                     subss xmm0, dword ptr [rbx + 0x44]
00000001400b3704: f30f100d64eede05               movss xmm1, dword ptr [rip + 0x5deee64]
00000001400b370c: 0f2ec8                         ucomiss xmm1, xmm0
00000001400b370f: 7739                           ja 0x1400b374a
00000001400b3711: 48c744244003000000             mov qword ptr [rsp + 0x40], 3
00000001400b371a: c744243802000000               mov dword ptr [rsp + 0x38], 2
00000001400b3722: 488d542438                     lea rdx, [rsp + 0x38]
00000001400b3727: 4889f1                         mov rcx, rsi
00000001400b372a: e8719d0200                     call 0x1400dd4a0
00000001400b372f: c7431001000000                 mov dword ptr [rbx + 0x10], 1
00000001400b3736: f30f117314                     movss dword ptr [rbx + 0x14], xmm6
00000001400b373b: 48c70301000000                 mov qword ptr [rbx], 1
00000001400b3742: 48c7430803000000               mov qword ptr [rbx + 8], 3
00000001400b374a: 49837e3800                     cmp qword ptr [r14 + 0x38], 0
00000001400b374f: c744243825000000               mov dword ptr [rsp + 0x38], 0x25
00000001400b3757: 7448                           je 0x1400b37a1
00000001400b3759: 48ba66c6011672fa9724           movabs rdx, 0x2497fa721601c666
00000001400b3763: 4c8d442438                     lea r8, [rsp + 0x38]
00000001400b3768: 4889f9                         mov rcx, rdi
00000001400b376b: e850b00a00                     call 0x14015e7c0
00000001400b3770: 4885c0                         test rax, rax
00000001400b3773: 742c                           je 0x1400b37a1
00000001400b3775: 807b4801                       cmp byte ptr [rbx + 0x48], 1
00000001400b3779: 7526                           jne 0x1400b37a1
00000001400b377b: 48837b2000                     cmp qword ptr [rbx + 0x20], 0
00000001400b3780: 750a                           jne 0x1400b378c
00000001400b3782: 488b4330                       mov rax, qword ptr [rbx + 0x30]
00000001400b3786: 483b4328                       cmp rax, qword ptr [rbx + 0x28]
00000001400b378a: 7215                           jb 0x1400b37a1
00000001400b378c: c744243803000000               mov dword ptr [rsp + 0x38], 3
00000001400b3794: 488d542438                     lea rdx, [rsp + 0x38]
00000001400b3799: 4889f1                         mov rcx, rsi
00000001400b379c: e8ff9c0200                     call 0x1400dd4a0
00000001400b37a1: 0f28b42420010000               movaps xmm6, xmmword ptr [rsp + 0x120]
00000001400b37a9: 4881c438010000                 add rsp, 0x138
00000001400b37b0: 5b                             pop rbx
00000001400b37b1: 5d                             pop rbp
00000001400b37b2: 5f                             pop rdi
00000001400b37b3: 5e                             pop rsi
00000001400b37b4: 415e                           pop r14
00000001400b37b6: 415f                           pop r15
00000001400b37b8: c3                             ret
