// player-login-dispatch
0000000145bc27f9 0fb7d3                         movzx edx, bx
0000000145bc27fc 8d4aca                         lea ecx, [rdx - 0x36]
0000000145bc27ff 83f907                         cmp ecx, 7
0000000145bc2802 7743                           ja 0x145bc2847
0000000145bc2804 488d1511344c01                 lea rdx, [rip + 0x14c3411]
0000000145bc280b 48630c8a                       movsxd rcx, dword ptr [rdx + rcx*4]
0000000145bc280f 4801d1                         add rcx, rdx
0000000145bc2812 ffe1                           jmp rcx
// guest-sync-producer
0000000145bc298e 83f801                         cmp eax, 1
0000000145bc2991 4c89ad30310000                 mov qword ptr [rbp + 0x3130], r13
0000000145bc2998 0f870c010000                   ja 0x145bc2aaa
0000000145bc299e 488b9e90110000                 mov rbx, qword ptr [rsi + 0x1190]
0000000145bc29a5 4885db                         test rbx, rbx
0000000145bc29a8 0f84fc000000                   je 0x145bc2aaa
0000000145bc29ae 488bbe98110000                 mov rdi, qword ptr [rsi + 0x1198]
0000000145bc29b5 c686bd11000001                 mov byte ptr [rsi + 0x11bd], 1
0000000145bc29bc 488b8e80110000                 mov rcx, qword ptr [rsi + 0x1180]
0000000145bc29c3 488b9688110000                 mov rdx, qword ptr [rsi + 0x1188]
0000000145bc29ca 4c8d86080e0000                 lea r8, [rsi + 0xe08]
0000000145bc29d1 e85af2fcff                     call 0x145b91c30
0000000145bc29d6 4c8bb680110000                 mov r14, qword ptr [rsi + 0x1180]
0000000145bc29dd 4c8bbe88110000                 mov r15, qword ptr [rsi + 0x1188]
0000000145bc29e4 488d15b50b4c01                 lea rdx, [rip + 0x14c0bb5]
0000000145bc29eb 488d8d701d0000                 lea rcx, [rbp + 0x1d70]
0000000145bc29f2 e899201500                     call 0x145d14a90
0000000145bc29f7 488b95781d0000                 mov rdx, qword ptr [rbp + 0x1d78]
0000000145bc29fe 4c8b85801d0000                 mov r8, qword ptr [rbp + 0x1d80]
0000000145bc2a05 f04c01053be8a902               lock add qword ptr [rip + 0x2a9e83b], r8
0000000145bc2a0d f048ff0543e8a902               lock inc qword ptr [rip + 0x2a9e843]
0000000145bc2a15 4c89f1                         mov rcx, r14
0000000145bc2a18 48899568310000                 mov qword ptr [rbp + 0x3168], rdx
0000000145bc2a1f 41ff5718                       call qword ptr [r15 + 0x18]
0000000145bc2a23 90                             nop
0000000145bc2a24 488b95701d0000                 mov rdx, qword ptr [rbp + 0x1d70]
0000000145bc2a2b 4885d2                         test rdx, rdx
0000000145bc2a2e 7412                           je 0x145bc2a42
0000000145bc2a30 41b801000000                   mov r8d, 1
0000000145bc2a36 488b8d68310000                 mov rcx, qword ptr [rbp + 0x3168]
0000000145bc2a3d e88ef743fa                     call 0x1400021d0
0000000145bc2a42 4883be780e0000ff               cmp qword ptr [rsi + 0xe78], -1
0000000145bc2a4a 0f84af070000                   je 0x145bc31ff
0000000145bc2a50 488d96780e0000                 lea rdx, [rsi + 0xe78]
0000000145bc2a57 488d8d280e0000                 lea rcx, [rbp + 0xe28]
0000000145bc2a5e e8fd950100                     call 0x145bdc060
0000000145bc2a63 e9a2070000                     jmp 0x145bc320a
// host-bootstrap-callback
0000000145bd31f0 55                             push rbp
0000000145bd31f1 4157                           push r15
0000000145bd31f3 4156                           push r14
0000000145bd31f5 4155                           push r13
0000000145bd31f7 4154                           push r12
0000000145bd31f9 56                             push rsi
0000000145bd31fa 57                             push rdi
0000000145bd31fb 53                             push rbx
0000000145bd31fc 4881ec68030000                 sub rsp, 0x368
0000000145bd3203 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145bd320b 48c785e0020000feffffff         mov qword ptr [rbp + 0x2e0], 0xfffffffffffffffe
0000000145bd3216 83b9980d000003                 cmp dword ptr [rcx + 0xd98], 3
0000000145bd321d 0f8543040000                   jne 0x145bd3666
0000000145bd3223 4889ce                         mov rsi, rcx
0000000145bd3226 483b91d80d0000                 cmp rdx, qword ptr [rcx + 0xdd8]
0000000145bd322d 0f8333040000                   jae 0x145bd3666
0000000145bd3233 488b86d00d0000                 mov rax, qword ptr [rsi + 0xdd0]
0000000145bd323a 4869cae8040000                 imul rcx, rdx, 0x4e8
0000000145bd3241 48898dd0020000                 mov qword ptr [rbp + 0x2d0], rcx
0000000145bd3248 833c0801                       cmp dword ptr [rax + rcx], 1
0000000145bd324c 0f8514040000                   jne 0x145bd3666
0000000145bd3252 837e1002                       cmp dword ptr [rsi + 0x10], 2
0000000145bd3256 0f840a040000                   je 0x145bd3666
0000000145bd325c 488995a0020000                 mov qword ptr [rbp + 0x2a0], rdx
0000000145bd3263 488b8dd0020000                 mov rcx, qword ptr [rbp + 0x2d0]
0000000145bd326a 488b5c0808                     mov rbx, qword ptr [rax + rcx + 8]
0000000145bd326f 488d5610                       lea rdx, [rsi + 0x10]
0000000145bd3273 488d8db0020000                 lea rcx, [rbp + 0x2b0]
0000000145bd327a 488995c8020000                 mov qword ptr [rbp + 0x2c8], rdx
0000000145bd3281 4989d8                         mov r8, rbx
0000000145bd3284 e8b7a40100                     call 0x145bed740
0000000145bd3289 4c8bbe680a0000                 mov r15, qword ptr [rsi + 0xa68]
0000000145bd3290 4531f6                         xor r14d, r14d
0000000145bd3293 4889b5a8020000                 mov qword ptr [rbp + 0x2a8], rsi
0000000145bd329a eb12                           jmp 0x145bd32ae
0000000145bd329c 0f1f4000                       nop dword ptr [rax]
0000000145bd32a0 488bb5a8020000                 mov rsi, qword ptr [rbp + 0x2a8]
0000000145bd32a7 4889bdc0020000                 mov qword ptr [rbp + 0x2c0], rdi
0000000145bd32ae 4d39fe                         cmp r14, r15
0000000145bd32b1 0f8746010000                   ja 0x145bd33fd
0000000145bd32b7 4d89f0                         mov r8, r14
0000000145bd32ba 49ffc6                         inc r14
0000000145bd32bd 4939d8                         cmp r8, rbx
0000000145bd32c0 74ec                           je 0x145bd32ae
0000000145bd32c2 c685df02000001                 mov byte ptr [rbp + 0x2df], 1
0000000145bd32c9 488d8d00020000                 lea rcx, [rbp + 0x200]
0000000145bd32d0 488b95c8020000                 mov rdx, qword ptr [rbp + 0x2c8]
0000000145bd32d7 e864950100                     call 0x145bec840
0000000145bd32dc 90                             nop
0000000145bd32dd 0f108500020000                 movups xmm0, xmmword ptr [rbp + 0x200]
0000000145bd32e4 0f108d10020000                 movups xmm1, xmmword ptr [rbp + 0x210]
0000000145bd32eb 0f109520020000                 movups xmm2, xmmword ptr [rbp + 0x220]
0000000145bd32f2 0f109d30020000                 movups xmm3, xmmword ptr [rbp + 0x230]
0000000145bd32f9 488d8550020000                 lea rax, [rbp + 0x250]
0000000145bd3300 0f115830                       movups xmmword ptr [rax + 0x30], xmm3
0000000145bd3304 0f115020                       movups xmmword ptr [rax + 0x20], xmm2
0000000145bd3308 0f114810                       movups xmmword ptr [rax + 0x10], xmm1
0000000145bd330c 0f1100                         movups xmmword ptr [rax], xmm0
0000000145bd330f 48c7854002000000000000         mov qword ptr [rbp + 0x240], 0
0000000145bd331a 48c7854802000002000000         mov qword ptr [rbp + 0x248], 2
0000000145bd3325 488b85b0020000                 mov rax, qword ptr [rbp + 0x2b0]
0000000145bd332c 488bbdc0020000                 mov rdi, qword ptr [rbp + 0x2c0]
0000000145bd3333 4829f8                         sub rax, rdi
0000000145bd3336 4883f801                       cmp rax, 1
0000000145bd333a 0f868c000000                   jbe 0x145bd33cc
0000000145bd3340 488b8db8020000                 mov rcx, qword ptr [rbp + 0x2b8]
0000000145bd3347 488b8540020000                 mov rax, qword ptr [rbp + 0x240]
0000000145bd334e 488b9548020000                 mov rdx, qword ptr [rbp + 0x248]
0000000145bd3355 0f108550020000                 movups xmm0, xmmword ptr [rbp + 0x250]
0000000145bd335c 0f108d60020000                 movups xmm1, xmmword ptr [rbp + 0x260]
0000000145bd3363 0f109570020000                 movups xmm2, xmmword ptr [rbp + 0x270]
0000000145bd336a 488945b0                       mov qword ptr [rbp - 0x50], rax
0000000145bd336e 488955b8                       mov qword ptr [rbp - 0x48], rdx
0000000145bd3372 0f109d80020000                 movups xmm3, xmmword ptr [rbp + 0x280]
0000000145bd3379 0f295df0                       movaps xmmword ptr [rbp - 0x10], xmm3
0000000145bd337d 0f2955e0                       movaps xmmword ptr [rbp - 0x20], xmm2
0000000145bd3381 0f294dd0                       movaps xmmword ptr [rbp - 0x30], xmm1
0000000145bd3385 0f2945c0                       movaps xmmword ptr [rbp - 0x40], xmm0
0000000145bd3389 4c8b65b0                       mov r12, qword ptr [rbp - 0x50]
0000000145bd338d 4c8b6db8                       mov r13, qword ptr [rbp - 0x48]
0000000145bd3391 4d89e8                         mov r8, r13
0000000145bd3394 4d29e0                         sub r8, r12
0000000145bd3397 0f8403ffffff                   je 0x145bd32a0
0000000145bd339d 4889f8                         mov rax, rdi
0000000145bd33a0 48c1e005                       shl rax, 5
0000000145bd33a4 4801c1                         add rcx, rax
0000000145bd33a7 4c89e2                         mov rdx, r12
0000000145bd33aa 48c1e205                       shl rdx, 5
0000000145bd33ae 488d45c0                       lea rax, [rbp - 0x40]
0000000145bd33b2 4801c2                         add rdx, rax
0000000145bd33b5 49c1e005                       shl r8, 5
0000000145bd33b9 e85de34800                     call 0x14606171b
0000000145bd33be 4901fd                         add r13, rdi
0000000145bd33c1 4d29e5                         sub r13, r12
0000000145bd33c4 4c89ef                         mov rdi, r13
0000000145bd33c7 e9d4feffff                     jmp 0x145bd32a0
0000000145bd33cc 48c744242020000000             mov qword ptr [rsp + 0x20], 0x20
0000000145bd33d5 41b802000000                   mov r8d, 2
0000000145bd33db 41b908000000                   mov r9d, 8
0000000145bd33e1 488d8db0020000                 lea rcx, [rbp + 0x2b0]
0000000145bd33e8 4889fa                         mov rdx, rdi
0000000145bd33eb e840e74800                     call 0x146061b30
0000000145bd33f0 90                             nop
0000000145bd33f1 488bbdc0020000                 mov rdi, qword ptr [rbp + 0x2c0]
0000000145bd33f8 e943ffffff                     jmp 0x145bd3340
0000000145bd33fd c685df02000001                 mov byte ptr [rbp + 0x2df], 1
0000000145bd3404 488b8dc8020000                 mov rcx, qword ptr [rbp + 0x2c8]
0000000145bd340b 4889da                         mov rdx, rbx
0000000145bd340e e87df50100                     call 0x145bf2990
0000000145bd3413 90                             nop
0000000145bd3414 488d96d81a0000                 lea rdx, [rsi + 0x1ad8]
0000000145bd341b c685df02000001                 mov byte ptr [rbp + 0x2df], 1
0000000145bd3422 488d4db0                       lea rcx, [rbp - 0x50]
0000000145bd3426 e8e53ff2ff                     call 0x145af7410
0000000145bd342b 90                             nop
0000000145bd342c 488b85b0020000                 mov rax, qword ptr [rbp + 0x2b0]
0000000145bd3433 4c8ba5c0020000                 mov r12, qword ptr [rbp + 0x2c0]
0000000145bd343a 4939c4                         cmp r12, rax
0000000145bd343d 7514                           jne 0x145bd3453
0000000145bd343f 488d8db0020000                 lea rcx, [rbp + 0x2b0]
0000000145bd3446 e895ea4800                     call 0x146061ee0
0000000145bd344b 90                             nop
0000000145bd344c 488b85b0020000                 mov rax, qword ptr [rbp + 0x2b0]
0000000145bd3453 488b8db8020000                 mov rcx, qword ptr [rbp + 0x2b8]
0000000145bd345a 4c89e3                         mov rbx, r12
0000000145bd345d 48c1e305                       shl rbx, 5
0000000145bd3461 0f1045b0                       movups xmm0, xmmword ptr [rbp - 0x50]
0000000145bd3465 0f104dc0                       movups xmm1, xmmword ptr [rbp - 0x40]
0000000145bd3469 0f114c1910                     movups xmmword ptr [rcx + rbx + 0x10], xmm1
0000000145bd346e 0f110419                       movups xmmword ptr [rcx + rbx], xmm0
0000000145bd3472 49ffc4                         inc r12
0000000145bd3475 4c89a5c0020000                 mov qword ptr [rbp + 0x2c0], r12
0000000145bd347c 49c1e405                       shl r12, 5
0000000145bd3480 4901cc                         add r12, rcx
0000000145bd3483 48898d40020000                 mov qword ptr [rbp + 0x240], rcx
0000000145bd348a 48898590020000                 mov qword ptr [rbp + 0x290], rax
0000000145bd3491 48898550020000                 mov qword ptr [rbp + 0x250], rax
0000000145bd3498 4c89a558020000                 mov qword ptr [rbp + 0x258], r12
0000000145bd349f 4c8d7128                       lea r14, [rcx + 0x28]
0000000145bd34a3 49bd0600000000000080           movabs r13, 0x8000000000000006
0000000145bd34ad 48898d98020000                 mov qword ptr [rbp + 0x298], rcx
0000000145bd34b4 4889c8                         mov rax, rcx
0000000145bd34b7 4c89a5c8020000                 mov qword ptr [rbp + 0x2c8], r12
0000000145bd34be 4c39e0                         cmp rax, r12
0000000145bd34c1 0f843b010000                   je 0x145bd3602
0000000145bd34c7 660f1f840000000000             nop word ptr [rax + rax]
0000000145bd34d0 4c8d7820                       lea r15, [rax + 0x20]
0000000145bd34d4 4c89bd48020000                 mov qword ptr [rbp + 0x248], r15
0000000145bd34db 488b08                         mov rcx, qword ptr [rax]
0000000145bd34de 4883f9ff                       cmp rcx, -1
0000000145bd34e2 0f84e8000000                   je 0x145bd35d0
0000000145bd34e8 0fb75018                       movzx edx, word ptr [rax + 0x18]
0000000145bd34ec 0f104008                       movups xmm0, xmmword ptr [rax + 8]
0000000145bd34f0 0f2985f0010000                 movaps xmmword ptr [rbp + 0x1f0], xmm0
0000000145bd34f7 668955d0                       mov word ptr [rbp - 0x30], dx
0000000145bd34fb 48894db8                       mov qword ptr [rbp - 0x48], rcx
0000000145bd34ff 488d45c0                       lea rax, [rbp - 0x40]
0000000145bd3503 0f1100                         movups xmmword ptr [rax], xmm0
0000000145bd3506 4c896db0                       mov qword ptr [rbp - 0x50], r13
0000000145bd350a 83be980d000003                 cmp dword ptr [rsi + 0xd98], 3
0000000145bd3511 0f8599000000                   jne 0x145bd35b0
0000000145bd3517 488b85a0020000                 mov rax, qword ptr [rbp + 0x2a0]
0000000145bd351e 483b86d80d0000                 cmp rax, qword ptr [rsi + 0xdd8]
0000000145bd3525 0f8385000000                   jae 0x145bd35b0
0000000145bd352b 488bb6d00d0000                 mov rsi, qword ptr [rsi + 0xdd0]
0000000145bd3532 488d8d00020000                 lea rcx, [rbp + 0x200]
0000000145bd3539 488d55b0                       lea rdx, [rbp - 0x50]
0000000145bd353d e84e151400                     call 0x145d14a90
0000000145bd3542 90                             nop
0000000145bd3543 488b85d0020000                 mov rax, qword ptr [rbp + 0x2d0]
0000000145bd354a 488d3c06                       lea rdi, [rsi + rax]
0000000145bd354e 4c8ba788020000                 mov r12, qword ptr [rdi + 0x288]
0000000145bd3555 4c3ba778020000                 cmp r12, qword ptr [rdi + 0x278]
0000000145bd355c 7518                           jne 0x145bd3576
0000000145bd355e 488b85d0020000                 mov rax, qword ptr [rbp + 0x2d0]
0000000145bd3565 488d0c06                       lea rcx, [rsi + rax]
0000000145bd3569 4881c178020000                 add rcx, 0x278
0000000145bd3570 e85be64800                     call 0x146061bd0
0000000145bd3575 90                             nop
0000000145bd3576 488b8780020000                 mov rax, qword ptr [rdi + 0x280]
0000000145bd357d 4b8d0c64                       lea rcx, [r12 + r12*2]
0000000145bd3581 488b9510020000                 mov rdx, qword ptr [rbp + 0x210]
0000000145bd3588 488954c810                     mov qword ptr [rax + rcx*8 + 0x10], rdx
0000000145bd358d 0f108500020000                 movups xmm0, xmmword ptr [rbp + 0x200]
0000000145bd3594 0f1104c8                       movups xmmword ptr [rax + rcx*8], xmm0
0000000145bd3598 49ffc4                         inc r12
0000000145bd359b 4c89a788020000                 mov qword ptr [rdi + 0x288], r12
0000000145bd35a2 488bb5a8020000                 mov rsi, qword ptr [rbp + 0x2a8]
0000000145bd35a9 4c8ba5c8020000                 mov r12, qword ptr [rbp + 0x2c8]
0000000145bd35b0 488d4db0                       lea rcx, [rbp - 0x50]
0000000145bd35b4 e81770fdff                     call 0x145baa5d0
0000000145bd35b9 90                             nop
0000000145bd35ba 4983c620                       add r14, 0x20
0000000145bd35be 4883c3e0                       add rbx, -0x20
0000000145bd35c2 4c89f8                         mov rax, r15
0000000145bd35c5 4c39e0                         cmp rax, r12
0000000145bd35c8 0f8502ffffff                   jne 0x145bd34d0
0000000145bd35ce eb32                           jmp 0x145bd3602
0000000145bd35d0 4d39fc                         cmp r12, r15
0000000145bd35d3 742d                           je 0x145bd3602
0000000145bd35d5 48c1eb05                       shr rbx, 5
0000000145bd35d9 eb0e                           jmp 0x145bd35e9
0000000145bd35db 0f1f440000                     nop dword ptr [rax + rax]
0000000145bd35e0 4983c620                       add r14, 0x20
0000000145bd35e4 48ffcb                         dec rbx
0000000145bd35e7 7419                           je 0x145bd3602
0000000145bd35e9 498b56f8                       mov rdx, qword ptr [r14 - 8]
0000000145bd35ed 4885d2                         test rdx, rdx
0000000145bd35f0 74ee                           je 0x145bd35e0
0000000145bd35f2 498b0e                         mov rcx, qword ptr [r14]
0000000145bd35f5 41b801000000                   mov r8d, 1
0000000145bd35fb e8d0eb42fa                     call 0x1400021d0
0000000145bd3600 ebde                           jmp 0x145bd35e0
0000000145bd3602 488b9590020000                 mov rdx, qword ptr [rbp + 0x290]
0000000145bd3609 4885d2                         test rdx, rdx
0000000145bd360c 7416                           je 0x145bd3624
0000000145bd360e 48c1e205                       shl rdx, 5
0000000145bd3612 41b808000000                   mov r8d, 8
0000000145bd3618 488b8d98020000                 mov rcx, qword ptr [rbp + 0x298]
0000000145bd361f e8aceb42fa                     call 0x1400021d0
0000000145bd3624 83be980d000003                 cmp dword ptr [rsi + 0xd98], 3
0000000145bd362b 488b8da0020000                 mov rcx, qword ptr [rbp + 0x2a0]
0000000145bd3632 7522                           jne 0x145bd3656
0000000145bd3634 488b96d80d0000                 mov rdx, qword ptr [rsi + 0xdd8]
0000000145bd363b 4839d1                         cmp rcx, rdx
0000000145bd363e 733a                           jae 0x145bd367a
0000000145bd3640 488b86d00d0000                 mov rax, qword ptr [rsi + 0xdd0]
0000000145bd3647 488b8dd0020000                 mov rcx, qword ptr [rbp + 0x2d0]
0000000145bd364e c68408e504000001               mov byte ptr [rax + rcx + 0x4e5], 1
0000000145bd3656 c685df02000000                 mov byte ptr [rbp + 0x2df], 0
0000000145bd365d 4889f1                         mov rcx, rsi
0000000145bd3660 e8ab040000                     call 0x145bd3b10
0000000145bd3665 90                             nop
0000000145bd3666 4881c468030000                 add rsp, 0x368
0000000145bd366d 5b                             pop rbx
0000000145bd366e 5f                             pop rdi
0000000145bd366f 5e                             pop rsi
0000000145bd3670 415c                           pop r12
0000000145bd3672 415d                           pop r13
0000000145bd3674 415e                           pop r14
0000000145bd3676 415f                           pop r15
0000000145bd3678 5d                             pop rbp
0000000145bd3679 c3                             ret
0000000145bd367a c685df02000000                 mov byte ptr [rbp + 0x2df], 0
0000000145bd3681 4c8d05c8fe4a01                 lea r8, [rip + 0x14afec8]
0000000145bd3688 e876566300                     call 0x146208d03
0000000145bd368d 90                             nop
0000000145bd368e 0f0b                           ud2
// sync-serializer
0000000145d15b7d 488d4d58                       lea rcx, [rbp + 0x58]
0000000145d15b81 b206                           mov dl, 6
0000000145d15b83 e858b01a00                     call 0x145ec0be0
0000000145d15b88 90                             nop
0000000145d15b89 e902040000                     jmp 0x145d15f90
