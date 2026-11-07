; ownership-and-newness 0x145b023fc..0x145b025ca sha256 277348e9954ac087b627382177abfc97f33245c33e8f66dd4de5bd4c5dcfba77
0000000145b023fc 48817d58ffffff00         cmp qword ptr [rbp + 0x58], 0xffffff
0000000145b02404 0f8499000000             je 0x145b024a3
0000000145b0240a 498b842458100000         mov rax, qword ptr [r12 + 0x1058]
0000000145b02412 4d8bac2460100000         mov r13, qword ptr [r12 + 0x1060]
0000000145b0241a 4d89ec                   mov r12, r13
0000000145b0241d 4d85ed                   test r13, r13
0000000145b02420 0f842e010000             je 0x145b02554
0000000145b02426 4983fd01                 cmp r13, 1
0000000145b0242a 0f85c7000000             jne 0x145b024f7
0000000145b02430 4531e4                   xor r12d, r12d
0000000145b02433 e9e5000000               jmp 0x145b0251d
0000000145b02438 0f1f840000000000         nop dword ptr [rax + rax]
0000000145b02440 8d876079feff             lea eax, [rdi - 0x186a0]
0000000145b02446 89fa                     mov edx, edi
0000000145b02448 3ddf2e0000               cmp eax, 0x2edf
0000000145b0244d 0f8741ffffff             ja 0x145b02394
0000000145b02453 4889c1                   mov rcx, rax
0000000145b02456 bacdcccccc               mov edx, 0xcccccccd
0000000145b0245b 480fafca                 imul rcx, rdx
0000000145b0245f 48c1e923                 shr rcx, 0x23
0000000145b02463 01c9                     add ecx, ecx
0000000145b02465 8d0c89                   lea ecx, [rcx + rcx*4]
0000000145b02468 4189c0                   mov r8d, eax
0000000145b0246b 89fa                     mov edx, edi
0000000145b0246d 4129c8                   sub r8d, ecx
0000000145b02470 0f851effffff             jne 0x145b02394
0000000145b02476 69c0cdcc0000             imul eax, eax, 0xcccd
0000000145b0247c c1e813                   shr eax, 0x13
0000000145b0247f 69c0cdccffff             imul eax, eax, 0xffffcccd
0000000145b02485 ffc8                     dec eax
0000000145b02487 66d1c8                   ror ax, 1
0000000145b0248a 0fb7c0                   movzx eax, ax
0000000145b0248d 3d9a190000               cmp eax, 0x199a
0000000145b02492 7207                     jb 0x145b0249b
0000000145b02494 89fa                     mov edx, edi
0000000145b02496 e9f9feffff               jmp 0x145b02394
0000000145b0249b 8d570a                   lea edx, [rdi + 0xa]
0000000145b0249e e9f1feffff               jmp 0x145b02394
0000000145b024a3 498b8c2460100000         mov rcx, qword ptr [r12 + 0x1060]
0000000145b024ab 4885c9                   test rcx, rcx
0000000145b024ae 0f84f7000000             je 0x145b025ab
0000000145b024b4 498b842458100000         mov rax, qword ptr [r12 + 0x1058]
0000000145b024bc 31d2                     xor edx, edx
0000000145b024be 4883f901                 cmp rcx, 1
0000000145b024c2 7428                     je 0x145b024ec
0000000145b024c4 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145b024d0 4989d0                   mov r8, rdx
0000000145b024d3 4989c9                   mov r9, rcx
0000000145b024d6 49d1e9                   shr r9, 1
0000000145b024d9 4c01ca                   add rdx, r9
0000000145b024dc 393c90                   cmp dword ptr [rax + rdx*4], edi
0000000145b024df 490f47d0                 cmova rdx, r8
0000000145b024e3 4c29c9                   sub rcx, r9
0000000145b024e6 4883f901                 cmp rcx, 1
0000000145b024ea 77e4                     ja 0x145b024d0
0000000145b024ec 393c90                   cmp dword ptr [rax + rdx*4], edi
0000000145b024ef 0f95c0                   setne al
0000000145b024f2 e9b6000000               jmp 0x145b025ad
0000000145b024f7 4c89e9                   mov rcx, r13
0000000145b024fa 4531e4                   xor r12d, r12d
0000000145b024fd 0f1f00                   nop dword ptr [rax]
0000000145b02500 4c89e2                   mov rdx, r12
0000000145b02503 4989c8                   mov r8, rcx
0000000145b02506 49d1e8                   shr r8, 1
0000000145b02509 4d01c4                   add r12, r8
0000000145b0250c 42393ca0                 cmp dword ptr [rax + r12*4], edi
0000000145b02510 4c0f47e2                 cmova r12, rdx
0000000145b02514 4c29c1                   sub rcx, r8
0000000145b02517 4883f901                 cmp rcx, 1
0000000145b0251b 77e3                     ja 0x145b02500
0000000145b0251d 42393ca0                 cmp dword ptr [rax + r12*4], edi
0000000145b02521 752d                     jne 0x145b02550
0000000145b02523 c7855801000000000000     mov dword ptr [rbp + 0x158], 0
0000000145b0252d 4c8ba510010000           mov r12, qword ptr [rbp + 0x110]
0000000145b02534 48817d58ffffff00         cmp qword ptr [rbp + 0x58], 0xffffff
0000000145b0253c 0f958557010000           setne byte ptr [rbp + 0x157]
0000000145b02543 41837c241002             cmp dword ptr [r12 + 0x10], 2
0000000145b02549 747f                     je 0x145b025ca
0000000145b0254b e998000000               jmp 0x145b025e8
0000000145b02550 4983d400                 adc r12, 0
0000000145b02554 488b4d60                 mov rcx, qword ptr [rbp + 0x60]
0000000145b02558 4c3b29                   cmp r13, qword ptr [rcx]
0000000145b0255b 7518                     jne 0x145b02575
0000000145b0255d 488b4d60                 mov rcx, qword ptr [rbp + 0x60]
0000000145b02561 e87a674a00               call 0x145fa8ce0
0000000145b02566 90                       nop
0000000145b02567 488b8510010000           mov rax, qword ptr [rbp + 0x110]
0000000145b0256e 488b8058100000           mov rax, qword ptr [rax + 0x1058]
0000000145b02575 4a8d04a0                 lea rax, [rax + r12*4]
0000000145b02579 4d89e8                   mov r8, r13
0000000145b0257c 4d29e0                   sub r8, r12
0000000145b0257f 7616                     jbe 0x145b02597
0000000145b02581 488d4804                 lea rcx, [rax + 4]
0000000145b02585 49c1e002                 shl r8, 2
0000000145b02589 4989c4                   mov r12, rax
0000000145b0258c 4889c2                   mov rdx, rax
0000000145b0258f e823154a00               call 0x145fa3ab7
0000000145b02594 4c89e0                   mov rax, r12
0000000145b02597 8938                     mov dword ptr [rax], edi
0000000145b02599 49ffc5                   inc r13
0000000145b0259c 4c8ba510010000           mov r12, qword ptr [rbp + 0x110]
0000000145b025a3 4d89ac2460100000         mov qword ptr [r12 + 0x1060], r13
0000000145b025ab b001                     mov al, 1
0000000145b025ad 898558010000             mov dword ptr [rbp + 0x158], eax
0000000145b025b3 48817d58ffffff00         cmp qword ptr [rbp + 0x58], 0xffffff
0000000145b025bb 0f958557010000           setne byte ptr [rbp + 0x157]
0000000145b025c2 41837c241002             cmp dword ptr [r12 + 0x10], 2
0000000145b025c8 751e                     jne 0x145b025e8

; guest-notice-or-local-queue 0x145b02ab8..0x145b02b4d sha256 1ac93ce013e6c7c6c6cc5e957c03b58eeeea3e6fb4c66bf6f0883e78d7231ebb
0000000145b02ab8 41837c241002             cmp dword ptr [r12 + 0x10], 2
0000000145b02abe 48899518010000           mov qword ptr [rbp + 0x118], rdx
0000000145b02ac5 7537                     jne 0x145b02afe
0000000145b02ac7 498b8c24b8170000         mov rcx, qword ptr [r12 + 0x17b8]
0000000145b02acf 498b8424c0170000         mov rax, qword ptr [r12 + 0x17c0]
0000000145b02ad7 4d89e8                   mov r8, r13
0000000145b02ada ff5018                   call qword ptr [rax + 0x18]
0000000145b02add 90                       nop
0000000145b02ade 488b9548010000           mov rdx, qword ptr [rbp + 0x148]
0000000145b02ae5 4885d2                   test rdx, rdx
0000000145b02ae8 7463                     je 0x145b02b4d
0000000145b02aea 41b801000000             mov r8d, 1
0000000145b02af0 488b8d18010000           mov rcx, qword ptr [rbp + 0x118]
0000000145b02af7 e8d4f64ffa               call 0x1400021d0
0000000145b02afc eb4f                     jmp 0x145b02b4d
0000000145b02afe 498bbc2478060000         mov rdi, qword ptr [r12 + 0x678]
0000000145b02b06 493bbc2468060000         cmp rdi, qword ptr [r12 + 0x668]
0000000145b02b0e 750a                     jne 0x145b02b1a
0000000145b02b10 488b4d50                 mov rcx, qword ptr [rbp + 0x50]
0000000145b02b14 e847144a00               call 0x145fa3f60
0000000145b02b19 90                       nop
0000000145b02b1a 498b842470060000         mov rax, qword ptr [r12 + 0x670]
0000000145b02b22 488d0c7f                 lea rcx, [rdi + rdi*2]
0000000145b02b26 488b9548010000           mov rdx, qword ptr [rbp + 0x148]
0000000145b02b2d 488914c8                 mov qword ptr [rax + rcx*8], rdx
0000000145b02b31 488b9518010000           mov rdx, qword ptr [rbp + 0x118]
0000000145b02b38 488954c808               mov qword ptr [rax + rcx*8 + 8], rdx
0000000145b02b3d 4c896cc810               mov qword ptr [rax + rcx*8 + 0x10], r13
0000000145b02b42 48ffc7                   inc rdi
0000000145b02b45 4989bc2478060000         mov qword ptr [r12 + 0x678], rdi

; ownership-dirty-accumulator 0x145b02b81..0x145b02b9e sha256 a448cc06606c42266a6de9a1b29ca3d2980a7d4361798e6c5a940d282f0a1fb5
0000000145b02b81 0fb68d57010000           movzx ecx, byte ptr [rbp + 0x157]
0000000145b02b88 228d58010000             and cl, byte ptr [rbp + 0x158]
0000000145b02b8e 488b85f8000000           mov rax, qword ptr [rbp + 0xf8]
0000000145b02b95 08c8                     or al, cl
0000000145b02b97 488985f8000000           mov qword ptr [rbp + 0xf8], rax

; save-admission 0x145b02c33..0x145b02c3c sha256 9e6a9a3d1acb6285f9679dabdf5eccd1024dcb6d1ba7e5db373a0af3c5742a73
0000000145b02c33 f685f800000001           test byte ptr [rbp + 0xf8], 1
0000000145b02c3a 747c                     je 0x145b02cb8

; constructor-receiver-arguments 0x145b064ed..0x145b06505 sha256 5360f694d1f10996c00558241670626a183dedaf4ed95c30df7036e4c41fd994
0000000145b064ed 4c898d28080000           mov qword ptr [rbp + 0x828], r9
0000000145b064f4 4c898530080000           mov qword ptr [rbp + 0x830], r8
0000000145b064fb 48899538080000           mov qword ptr [rbp + 0x838], rdx
0000000145b06502 4889ce                   mov rsi, rcx

; constructor-receiver-fields 0x145b06c09..0x145b06c25 sha256 269643100c1895bf6ba34a911754c5fda8221f9e915417c471060a82500e123f
0000000145b06c09 488b8538080000           mov rax, qword ptr [rbp + 0x838]
0000000145b06c10 488986b8170000           mov qword ptr [rsi + 0x17b8], rax
0000000145b06c17 488b8530080000           mov rax, qword ptr [rbp + 0x830]
0000000145b06c1e 488986c0170000           mov qword ptr [rsi + 0x17c0], rax

; app-receiver-installation 0x14002be7f..0x14002be9a sha256 eb38b7f70e6d7d40974c2c5465617f4496ab4a42a5f304c2c161fb4fa13d94fc
000000014002be7f 488d0df2911406           lea rcx, [rip + 0x61491f2]
000000014002be86 4c8d0da3911406           lea r9, [rip + 0x61491a3]
000000014002be8d ba0d000000               mov edx, 0xd
000000014002be92 4989c0                   mov r8, rax
000000014002be95 e8f6d4ab05               call 0x145ae9390

; receiver-owned-string-copy-and-append 0x145acef85..0x145acf05a sha256 5093512615fb3304cfef460b09671767e6ea049a9045e2b64f143ffb627c5c69
0000000145acef85 4c8b6dd8                 mov r13, qword ptr [rbp - 0x28]
0000000145acef89 4d85ed                   test r13, r13
0000000145acef8c 7918                     jns 0x145acefa6
0000000145acef8e 31db                     xor ebx, ebx
0000000145acef90 448965fc                 mov dword ptr [rbp - 4], r12d
0000000145acef94 4c897de0                 mov qword ptr [rbp - 0x20], r15
0000000145acef98 4889d9                   mov rcx, rbx
0000000145acef9b 4c89ea                   mov rdx, r13
0000000145acef9e e8c8bd6700               call 0x14614ad6b
0000000145acefa3 90                       nop
0000000145acefa4 0f0b                     ud2
0000000145acefa6 7441                     je 0x145acefe9
0000000145acefa8 488b7dd0                 mov rdi, qword ptr [rbp - 0x30]
0000000145acefac e84f3253fa               call 0x140002200
0000000145acefb1 bb01000000               mov ebx, 1
0000000145acefb6 ba01000000               mov edx, 1
0000000145acefbb 4c89e9                   mov rcx, r13
0000000145acefbe e8fd3153fa               call 0x1400021c0
0000000145acefc3 4885c0                   test rax, rax
0000000145acefc6 74c8                     je 0x145acef90
0000000145acefc8 488945e8                 mov qword ptr [rbp - 0x18], rax
0000000145acefcc 4889c1                   mov rcx, rax
0000000145acefcf 4889fa                   mov rdx, rdi
0000000145acefd2 4d89e8                   mov r8, r13
0000000145acefd5 e8d14a4d00               call 0x145fa3aab
0000000145acefda 498b4f18                 mov rcx, qword ptr [r15 + 0x18]
0000000145acefde 498b4730                 mov rax, qword ptr [r15 + 0x30]
0000000145acefe2 4839c8                   cmp rax, rcx
0000000145acefe5 7418                     je 0x145acefff
0000000145acefe7 eb3f                     jmp 0x145acf028
0000000145acefe9 b801000000               mov eax, 1
0000000145acefee 488945e8                 mov qword ptr [rbp - 0x18], rax
0000000145aceff2 498b4f18                 mov rcx, qword ptr [r15 + 0x18]
0000000145aceff6 498b4730                 mov rax, qword ptr [r15 + 0x30]
0000000145aceffa 4839c8                   cmp rax, rcx
0000000145aceffd 7529                     jne 0x145acf028
0000000145acefff 4c896df0                 mov qword ptr [rbp - 0x10], r13
0000000145acf003 448965fc                 mov dword ptr [rbp - 4], r12d
0000000145acf007 4c897de0                 mov qword ptr [rbp - 0x20], r15
0000000145acf00b 4889f1                   mov rcx, rsi
0000000145acf00e e82d60e0fb               call 0x1418d5040
0000000145acf013 90                       nop
0000000145acf014 4c8b7de0                 mov r15, qword ptr [rbp - 0x20]
0000000145acf018 498b4f18                 mov rcx, qword ptr [r15 + 0x18]
0000000145acf01c 498b4730                 mov rax, qword ptr [r15 + 0x30]
0000000145acf020 448b65fc                 mov r12d, dword ptr [rbp - 4]
0000000145acf024 4c8b6df0                 mov r13, qword ptr [rbp - 0x10]
0000000145acf028 488d5001                 lea rdx, [rax + 1]
0000000145acf02c 49895730                 mov qword ptr [r15 + 0x30], rdx
0000000145acf030 49034728                 add rax, qword ptr [r15 + 0x28]
0000000145acf034 31d2                     xor edx, edx
0000000145acf036 4839c8                   cmp rax, rcx
0000000145acf039 480f43d1                 cmovae rdx, rcx
0000000145acf03d 4829d0                   sub rax, rdx
0000000145acf040 498b4f20                 mov rcx, qword ptr [r15 + 0x20]
0000000145acf044 488d0440                 lea rax, [rax + rax*2]
0000000145acf048 4c892cc1                 mov qword ptr [rcx + rax*8], r13
0000000145acf04c 488b55e8                 mov rdx, qword ptr [rbp - 0x18]
0000000145acf050 488954c108               mov qword ptr [rcx + rax*8 + 8], rdx
0000000145acf055 4c896cc110               mov qword ptr [rcx + rax*8 + 0x10], r13

; guest-lifecycle-admission 0x145b26ed9..0x145b26ef6 sha256 745812d81c82f6d5e6a33db7513cb2294f90d54d6878ec51cc6fe87d75915145
0000000145b26ed9 83bea00c000001           cmp dword ptr [rsi + 0xca0], 1
0000000145b26ee0 0f87a8010000             ja 0x145b2708e
0000000145b26ee6 4c8b8ea80f0000           mov r9, qword ptr [rsi + 0xfa8]
0000000145b26eed 4d85c9                   test r9, r9
0000000145b26ef0 0f8498010000             je 0x145b2708e

; guest-grant-budget-and-dispatch 0x145b26f49..0x145b26f9d sha256 3ff0a121735cb1641b378d976cab2c0dbf14c99174c329c49d337967e2d21dfe
0000000145b26f49 488b86c00f0000           mov rax, qword ptr [rsi + 0xfc0]
0000000145b26f50 31c9                     xor ecx, ecx
0000000145b26f52 ba40000000               mov edx, 0x40
0000000145b26f57 4829c2                   sub rdx, rax
0000000145b26f5a 480f43ca                 cmovae rcx, rdx
0000000145b26f5e 488b95e0030000           mov rdx, qword ptr [rbp + 0x3e0]
0000000145b26f65 4839d1                   cmp rcx, rdx
0000000145b26f68 480f43ca                 cmovae rcx, rdx
0000000145b26f6c 48898de0030000           mov qword ptr [rbp + 0x3e0], rcx
0000000145b26f73 4801c1                   add rcx, rax
0000000145b26f76 48898ec00f0000           mov qword ptr [rsi + 0xfc0], rcx
0000000145b26f7d c6855704000001           mov byte ptr [rbp + 0x457], 1
0000000145b26f84 c6855604000001           mov byte ptr [rbp + 0x456], 1
0000000145b26f8b 488d95d0030000           lea rdx, [rbp + 0x3d0]
0000000145b26f92 4889f1                   mov rcx, rsi
0000000145b26f95 4189d8                   mov r8d, ebx
0000000145b26f98 e833b3fdff               call 0x145b022d0

; frontend-drop-discriminator 0x14027972b..0x140279737 sha256 a36ae3a589c1ba923dcc02979a02b69585532d5e4271851d163bac83e316a005
000000014027972b 813864726f70             cmp dword ptr [rax], 0x706f7264
0000000140279731 0f85f90c0000             jne 0x14027a430

; frontend-drop-value-and-time-queues 0x14027a2e5..0x14027a3c5 sha256 6bf4401adb52db2528c378f04611c22a620c070754f9e88e5f1a9360a84ff4f6
000000014027a2e5 889d50010000             mov byte ptr [rbp + 0x150], bl
000000014027a2eb 488b8590000000           mov rax, qword ptr [rbp + 0x90]
000000014027a2f2 488b18                   mov rbx, qword ptr [rax]
000000014027a2f5 488b8500010000           mov rax, qword ptr [rbp + 0x100]
000000014027a2fc 483b18                   cmp rbx, qword ptr [rax]
000000014027a2ff 750d                     jne 0x14027a30e
000000014027a301 488b8d00010000           mov rcx, qword ptr [rbp + 0x100]
000000014027a308 e8f39ed205               call 0x145fa4200
000000014027a30d 90                       nop
000000014027a30e 488b95c0010000           mov rdx, qword ptr [rbp + 0x1c0]
000000014027a315 488b4220                 mov rax, qword ptr [rdx + 0x20]
000000014027a319 4889d9                   mov rcx, rbx
000000014027a31c 48c1e105                 shl rcx, 5
000000014027a320 0f108550010000           movups xmm0, xmmword ptr [rbp + 0x150]
000000014027a327 0f108d60010000           movups xmm1, xmmword ptr [rbp + 0x160]
000000014027a32e 0f114c0810               movups xmmword ptr [rax + rcx + 0x10], xmm1
000000014027a333 0f110408                 movups xmmword ptr [rax + rcx], xmm0
000000014027a337 48ffc3                   inc rbx
000000014027a33a 48895a28                 mov qword ptr [rdx + 0x28], rbx
000000014027a33e 488b85b0010000           mov rax, qword ptr [rbp + 0x1b0]
000000014027a345 8b8dd0010000             mov ecx, dword ptr [rbp + 0x1d0]
000000014027a34b 8908                     mov dword ptr [rax], ecx
000000014027a34d 660f6f8530010000         movdqa xmm0, xmmword ptr [rbp + 0x130]
000000014027a355 0f288d40010000           movaps xmm1, xmmword ptr [rbp + 0x140]
000000014027a35c 0f298d60010000           movaps xmmword ptr [rbp + 0x160], xmm1
000000014027a363 660f7f8550010000         movdqa xmmword ptr [rbp + 0x150], xmm0
000000014027a36b f30f11b570010000         movss dword ptr [rbp + 0x170], xmm6
000000014027a373 488b5a40                 mov rbx, qword ptr [rdx + 0x40]
000000014027a377 483b5a30                 cmp rbx, qword ptr [rdx + 0x30]
000000014027a37b 750d                     jne 0x14027a38a
000000014027a37d 488b8de8000000           mov rcx, qword ptr [rbp + 0xe8]
000000014027a384 e8e79ed205               call 0x145fa4270
000000014027a389 90                       nop
000000014027a38a 4c8b85c0010000           mov r8, qword ptr [rbp + 0x1c0]
000000014027a391 498b4038                 mov rax, qword ptr [r8 + 0x38]
000000014027a395 488d0c9b                 lea rcx, [rbx + rbx*4]
000000014027a399 488b9570010000           mov rdx, qword ptr [rbp + 0x170]
000000014027a3a0 488954c820               mov qword ptr [rax + rcx*8 + 0x20], rdx
000000014027a3a5 660f6f8550010000         movdqa xmm0, xmmword ptr [rbp + 0x150]
000000014027a3ad 0f288d60010000           movaps xmm1, xmmword ptr [rbp + 0x160]
000000014027a3b4 0f114cc810               movups xmmword ptr [rax + rcx*8 + 0x10], xmm1
000000014027a3b9 f30f7f04c8               movdqu xmmword ptr [rax + rcx*8], xmm0
000000014027a3be 48ffc3                   inc rbx
000000014027a3c1 49895840                 mov qword ptr [r8 + 0x40], rbx
