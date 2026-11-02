; guest-end-settlement 0x145b1c26f..0x145b1c370
145b1c26f 488b86a00c0000 mov rax, qword ptr [rsi + 0xca0]
145b1c276 4883f801 cmp rax, 1
145b1c27a 7749 ja 0x145b1c2c5
145b1c27c 4883bea80f000000 cmp qword ptr [rsi + 0xfa8], 0
145b1c284 743f je 0x145b1c2c5
145b1c286 4883bed00e0000ff cmp qword ptr [rsi + 0xed0], -1
145b1c28e 7435 je 0x145b1c2c5
145b1c290 c6855704000001 mov byte ptr [rbp + 0x457], 1
145b1c297 c6855604000001 mov byte ptr [rbp + 0x456], 1
145b1c29e 4889f1 mov rcx, rsi
145b1c2a1 e87a34ffff call 0x145b0f720
145b1c2a6 90 nop
145b1c2a7 c6855704000001 mov byte ptr [rbp + 0x457], 1
145b1c2ae c6855604000001 mov byte ptr [rbp + 0x456], 1
145b1c2b5 4889f1 mov rcx, rsi
145b1c2b8 e82392ffff call 0x145b154e0
145b1c2bd 90 nop
145b1c2be 488b86a00c0000 mov rax, qword ptr [rsi + 0xca0]
145b1c2c5 83f801 cmp eax, 1
145b1c2c8 7727 ja 0x145b1c2f1
145b1c2ca f686d10f000001 test byte ptr [rsi + 0xfd1], 1
145b1c2d1 741e je 0x145b1c2f1
145b1c2d3 c6855704000001 mov byte ptr [rbp + 0x457], 1
145b1c2da c6855604000001 mov byte ptr [rbp + 0x456], 1
145b1c2e1 4889f1 mov rcx, rsi
145b1c2e4 e897e2ffff call 0x145b1a580
145b1c2e9 90 nop
145b1c2ea 488b86a00c0000 mov rax, qword ptr [rsi + 0xca0]
145b1c2f1 83f801 cmp eax, 1
145b1c2f4 772b ja 0x145b1c321
145b1c2f6 488dbed00e0000 lea rdi, [rsi + 0xed0]
145b1c2fd 48c786a80f000000000000 mov qword ptr [rsi + 0xfa8], 0
145b1c308 4883bed00e0000ff cmp qword ptr [rsi + 0xed0], -1
145b1c310 7408 je 0x145b1c31a
145b1c312 4889f9 mov rcx, rdi
145b1c315 e846a4f8ff call 0x145aa6760
145b1c31a 48c707ffffffff mov qword ptr [rdi], 0xffffffffffffffff
145b1c321 c6855704000001 mov byte ptr [rbp + 0x457], 1
145b1c328 c6855604000001 mov byte ptr [rbp + 0x456], 1
145b1c32f 4889f1 mov rcx, rsi
145b1c332 e809d9ffff call 0x145b19c40
145b1c337 90 nop
145b1c338 c6855704000001 mov byte ptr [rbp + 0x457], 1
145b1c33f c6855604000001 mov byte ptr [rbp + 0x456], 1
145b1c346 48c744242000000000 mov qword ptr [rsp + 0x20], 0
145b1c34f 488d15f2fa7b01 lea rdx, [rip + 0x17bfaf2]
145b1c356 41b806000000 mov r8d, 6
145b1c35c 41b901000000 mov r9d, 1
145b1c362 4889f1 mov rcx, rsi
145b1c365 e876cbffff call 0x145b18ee0
145b1c36a 90 nop
145b1c36b e9340f0000 jmp 0x145b1d2a4

; guest-summary-started-admission 0x145b0f76c..0x145b0f7b5
145b0f76c 4889ce mov rsi, rcx
145b0f76f 488d8d28010000 lea rcx, [rbp + 0x128]
145b0f776 4889f2 mov rdx, rsi
145b0f779 e852550000 call 0x145b14cd0
145b0f77e 4883bd28010000ff cmp qword ptr [rbp + 0x128], -1
145b0f786 0f84f2110000 je 0x145b1097e
145b0f78c 488d4db0 lea rcx, [rbp - 0x50]
145b0f790 488d9528010000 lea rdx, [rbp + 0x128]
145b0f797 bbc8000000 mov ebx, 0xc8
145b0f79c 41b8c8000000 mov r8d, 0xc8
145b0f7a2 e8b4454800 call 0x145f93d5b
145b0f7a7 0fb6456f movzx eax, byte ptr [rbp + 0x6f]
145b0f7ab 04fa add al, 0xfa
145b0f7ad 3cfb cmp al, 0xfb
145b0f7af 0f82c0110000 jb 0x145b10975

; guest-snapshot-source 0x145b14d0d..0x145b14d77
145b14d0d 837a1002 cmp dword ptr [rdx + 0x10], 2
145b14d11 0f85a5000000 jne 0x145b14dbc
145b14d17 83baa00c000001 cmp dword ptr [rdx + 0xca0], 1
145b14d1e 0f87ce000000 ja 0x145b14df2
145b14d24 4883bad00e0000ff cmp qword ptr [rdx + 0xed0], -1
145b14d2c 0f84c0000000 je 0x145b14df2
145b14d32 4989cc mov r12, rcx
145b14d35 488d82d00e0000 lea rax, [rdx + 0xed0]
145b14d3c f3440f1082680f0000 movss xmm8, dword ptr [rdx + 0xf68]
145b14d45 440f108a6c0f0000 movups xmm9, xmmword ptr [rdx + 0xf6c]
145b14d4d f20f10b27c0f0000 movsd xmm6, qword ptr [rdx + 0xf7c]
145b14d55 f2440f1092840f0000 movsd xmm10, qword ptr [rdx + 0xf84]
145b14d5e f30f10ba8c0f0000 movss xmm7, dword ptr [rdx + 0xf8c]
145b14d66 0fb69a900f0000 movzx ebx, byte ptr [rdx + 0xf90]
145b14d6d 488d4dd8 lea rcx, [rbp - 0x28]
145b14d71 4989d5 mov r13, rdx
145b14d74 4889c2 mov rdx, rax

; guest-finalize-save-xp 0x145b0fb87..0x145b0fc43
145b0fb87 48894730 mov qword ptr [rdi + 0x30], rax
145b0fb8b 0f1085c0000000 movups xmm0, xmmword ptr [rbp + 0xc0]
145b0fb92 0f108dd0000000 movups xmm1, xmmword ptr [rbp + 0xd0]
145b0fb99 0f1095e0000000 movups xmm2, xmmword ptr [rbp + 0xe0]
145b0fba0 0f115720 movups xmmword ptr [rdi + 0x20], xmm2
145b0fba4 0f114f10 movups xmmword ptr [rdi + 0x10], xmm1
145b0fba8 0f1107 movups xmmword ptr [rdi], xmm0
145b0fbab 40b701 mov dil, 1
145b0fbae 4981fcffffff00 cmp r12, 0xffffff
145b0fbb5 0f95c3 setne bl
145b0fbb8 0f84280c0000 je 0x145b107e6
145b0fbbe 4585c0 test r8d, r8d
145b0fbc1 0f841f0c0000 je 0x145b107e6
145b0fbc7 4c898d70020000 mov qword ptr [rbp + 0x270], r9
145b0fbce 4d8dbe20100000 lea r15, [r14 + 0x1020]
145b0fbd5 498b8688100000 mov rax, qword ptr [r14 + 0x1088]
145b0fbdc 498b8e90100000 mov rcx, qword ptr [r14 + 0x1090]
145b0fbe3 48c1e103 shl rcx, 3
145b0fbe7 488d0c89 lea rcx, [rcx + rcx*4]
145b0fbeb 31f6 xor esi, esi
145b0fbed 4531d2 xor r10d, r10d
145b0fbf0 488b95f0010000 mov rdx, qword ptr [rbp + 0x1f0]
145b0fbf7 660f1f840000000000 nop word ptr [rax + rax]
145b0fc00 4c39d1 cmp rcx, r10
145b0fc03 7413 je 0x145b0fc18
145b0fc05 4d8d4a28 lea r9, [r10 + 0x28]
145b0fc09 4238541004 cmp byte ptr [rax + r10 + 4], dl
145b0fc0e 4d89ca mov r10, r9
145b0fc11 75ed jne 0x145b0fc00
145b0fc13 428b7408d8 mov esi, dword ptr [rax + r9 - 0x28]
145b0fc18 c685a602000001 mov byte ptr [rbp + 0x2a6], 1
145b0fc1f 4c89f9 mov rcx, r15
145b0fc22 e8d93efbff call 0x145ac3b00
145b0fc27 898560020000 mov dword ptr [rbp + 0x260], eax
145b0fc2d 89956c020000 mov dword ptr [rbp + 0x26c], edx
145b0fc33 c685a602000001 mov byte ptr [rbp + 0x2a6], 1
145b0fc3a 4c89f9 mov rcx, r15
145b0fc3d e8fea8fbff call 0x145aca540
145b0fc42 90 nop

; cooperative-history-admission 0x145b1576e..0x145b15791
145b1576e 4c89b608110000 mov qword ptr [rsi + 0x1108], r14
145b15775 4883bd78010000ff cmp qword ptr [rbp + 0x178], -1
145b1577d 0f84aa000000 je 0x145b1582d
145b15783 4883bd8801000002 cmp qword ptr [rbp + 0x188], 2
145b1578b 0f829c000000 jb 0x145b1582d

; party-any-dispatch 0x145b336ba..0x145b336eb
145b336ba 488b01 mov rax, qword ptr [rcx]
145b336bd 4989c1 mov r9, rax
145b336c0 4983e903 sub r9, 3
145b336c4 41ba03000000 mov r10d, 3
145b336ca 4d0f43d1 cmovae r10, r9
145b336ce 4c8d0d7beeaa01 lea r9, [rip + 0x1aaee7b]
145b336d5 4f631491 movsxd r10, dword ptr [r9 + r10*4]
145b336d9 4d01ca add r10, r9
145b336dc 41ffe2 jmp r10
145b336df 4983f802 cmp r8, 2
145b336e3 0f93c0 setae al
145b336e6 e928010000 jmp 0x145b33813

; party-run-boss-members-a 0x145b42f60..0x145b42fa6
145b42f60 4983c528 add r13, 0x28
145b42f64 4c3bad80000000 cmp r13, qword ptr [rbp + 0x80]
145b42f6b 0f84effdffff je 0x145b42d60
145b42f71 45394d18 cmp dword ptr [r13 + 0x18], r9d
145b42f75 75e9 jne 0x145b42f60
145b42f77 4d89f4 mov r12, r14
145b42f7a 4989ff mov r15, rdi
145b42f7d 4c89d7 mov rdi, r10
145b42f80 4d89c6 mov r14, r8
145b42f83 4489ce mov esi, r9d
145b42f86 4c89db mov rbx, r11
145b42f89 498b5508 mov rdx, qword ptr [r13 + 8]
145b42f8d 4d8b4510 mov r8, qword ptr [r13 + 0x10]
145b42f91 488d4dc0 lea rcx, [rbp - 0x40]
145b42f95 e81607ffff call 0x145b336b0
145b42f9a 90 nop
145b42f9b 84c0 test al, al
145b42f9d 4989db mov r11, rbx
145b42fa0 4189f1 mov r9d, esi
145b42fa3 4d89f0 mov r8, r14

; party-run-boss-members-b 0x145b433f0..0x145b43428
145b433f0 4883c628 add rsi, 0x28
145b433f4 483bb580000000 cmp rsi, qword ptr [rbp + 0x80]
145b433fb 0f845ff9ffff je 0x145b42d60
145b43401 44394e18 cmp dword ptr [rsi + 0x18], r9d
145b43405 75e9 jne 0x145b433f0
145b43407 4489cb mov ebx, r9d
145b4340a 488b5608 mov rdx, qword ptr [rsi + 8]
145b4340e 4c8b4610 mov r8, qword ptr [rsi + 0x10]
145b43412 488d4dc0 lea rcx, [rbp - 0x40]
145b43416 e89502ffff call 0x145b336b0
145b4341b 90 nop
145b4341c 84c0 test al, al
145b4341e 4189d9 mov r9d, ebx
145b43421 74cd je 0x145b433f0
145b43423 e954fdffff jmp 0x145b4317c

; party-run-victory-members 0x145b43571..0x145b43595
145b43571 488d4dc0 lea rcx, [rbp - 0x40]
145b43575 488b5560 mov rdx, qword ptr [rbp + 0x60]
145b43579 4c8b4568 mov r8, qword ptr [rbp + 0x68]
145b4357d e82e01ffff call 0x145b336b0
145b43582 90 nop
145b43583 83bda400000000 cmp dword ptr [rbp + 0xa4], 0
145b4358a 0f95c1 setne cl
145b4358d 84c0 test al, al
145b4358f 0f84cbf7ffff je 0x145b42d60

; revive-snapshot-flags 0x145b7e5dd..0x145b7e642
145b7e5dd 410fb684248a0c0000 movzx eax, byte ptr [r12 + 0xc8a]
145b7e5e6 fec8 dec al
145b7e5e8 400f94c6 sete sil
145b7e5ec 3c02 cmp al, 2
145b7e5ee 410f92c6 setb r14b
145b7e5f2 488bbd00130000 mov rdi, qword ptr [rbp + 0x1300]
145b7e5f9 483bbdf0120000 cmp rdi, qword ptr [rbp + 0x12f0]
145b7e600 750d jne 0x145b7e60f
145b7e602 488d8df0120000 lea rcx, [rbp + 0x12f0]
145b7e609 e8e2614400 call 0x145fc47f0
145b7e60e 90 nop
145b7e60f 4d8dac24f0040000 lea r13, [r12 + 0x4f0]
145b7e617 488b85f8120000 mov rax, qword ptr [rbp + 0x12f8]
145b7e61e 4889f9 mov rcx, rdi
145b7e621 48c1e104 shl rcx, 4
145b7e625 418b5508 mov edx, dword ptr [r13 + 8]
145b7e629 89540808 mov dword ptr [rax + rcx + 8], edx
145b7e62d 498b5500 mov rdx, qword ptr [r13]
145b7e631 48891408 mov qword ptr [rax + rcx], rdx
145b7e635 448874080c mov byte ptr [rax + rcx + 0xc], r14b
145b7e63a 408874080d mov byte ptr [rax + rcx + 0xd], sil
145b7e63f 48ffc7 inc rdi

; revive-nearby-helper-collection 0x145c33508..0x145c33541
145c33508 4839f8 cmp rax, rdi
145c3350b 74e3 je 0x145c334f0
145c3350d 41807e0c01 cmp byte ptr [r14 + 0xc], 1
145c33512 75dc jne 0x145c334f0
145c33514 f2410f1006 movsd xmm0, qword ptr [r14]
145c33519 f2410f104d00 movsd xmm1, qword ptr [r13]
145c3351f 0f5cc1 subps xmm0, xmm1
145c33522 0f59c0 mulps xmm0, xmm0
145c33525 f30f16c8 movshdup xmm1, xmm0
145c33529 f30f58c8 addss xmm1, xmm0
145c3352d 488d5f01 lea rbx, [rdi + 1]
145c33531 0f2ef1 ucomiss xmm6, xmm1
145c33534 48895a10 mov qword ptr [rdx + 0x10], rbx
145c33538 72be jb 0x145c334f8
145c3353a 4983c610 add r14, 0x10
145c3353e 4c8932 mov qword ptr [rdx], r14

; revive-three-way-timer 0x145b7e937..0x145b7ea0b
145b7e937 488b8550130000 mov rax, qword ptr [rbp + 0x1350]
145b7e93e 4885c0 test rax, rax
145b7e941 747d je 0x145b7e9c0
145b7e943 4c8b8548130000 mov r8, qword ptr [rbp + 0x1348]
145b7e94a 4c8b8df8120000 mov r9, qword ptr [rbp + 0x12f8]
145b7e951 488b9500130000 mov rdx, qword ptr [rbp + 0x1300]
145b7e958 4c8d14c500000000 lea r10, [rax*8]
145b7e960 4531db xor r11d, r11d
145b7e963 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b7e970 4d39da cmp r10, r11
145b7e973 0f8458020000 je 0x145b7ebd1
145b7e979 4b8b0c18 mov rcx, qword ptr [r8 + r11]
145b7e97d 4839d1 cmp rcx, rdx
145b7e980 0f83a42a0000 jae 0x145b8142a
145b7e986 48c1e104 shl rcx, 4
145b7e98a 4983c308 add r11, 8
145b7e98e 41807c090d00 cmp byte ptr [r9 + rcx + 0xd], 0
145b7e994 74da je 0x145b7e970
145b7e996 f3410f108424680c0000 movss xmm0, dword ptr [r12 + 0xc68]
145b7e9a0 488b4da8 mov rcx, qword ptr [rbp - 0x58]
145b7e9a4 f30f5801 addss xmm0, dword ptr [rcx]
145b7e9a8 f3410f118424680c0000 movss dword ptr [r12 + 0xc68], xmm0
145b7e9b2 0f2e0567545e00 ucomiss xmm0, dword ptr [rip + 0x5e5467]
145b7e9b9 7235 jb 0x145b7e9f0
145b7e9bb e932020000 jmp 0x145b7ebf2
145b7e9c0 f3410f108424680c0000 movss xmm0, dword ptr [r12 + 0xc68]
145b7e9ca 488b4da8 mov rcx, qword ptr [rbp - 0x58]
145b7e9ce f30f5c01 subss xmm0, dword ptr [rcx]
145b7e9d2 0f57c9 xorps xmm1, xmm1
145b7e9d5 f30f5fc1 maxss xmm0, xmm1
145b7e9d9 f3410f118424680c0000 movss dword ptr [r12 + 0xc68], xmm0
145b7e9e3 0f2e0536545e00 ucomiss xmm0, dword ptr [rip + 0x5e5436]
145b7e9ea 0f8302020000 jae 0x145b7ebf2
145b7e9f0 f30f5e0528545e00 divss xmm0, dword ptr [rip + 0x5e5428]
145b7e9f8 0f57c9 xorps xmm1, xmm1
145b7e9fb f30f5fc8 maxss xmm1, xmm0
145b7e9ff f30f10358d515e00 movss xmm6, dword ptr [rip + 0x5e518d]
145b7ea07 f30f5df1 minss xmm6, xmm1

; revive-hold-path 0x145b7ebd1..0x145b7ebf2
145b7ebd1 f3410f108424680c0000 movss xmm0, dword ptr [r12 + 0xc68]
145b7ebdb f3410f118424680c0000 movss dword ptr [r12 + 0xc68], xmm0
145b7ebe5 0f2e0534525e00 ucomiss xmm0, dword ptr [rip + 0x5e5234]
145b7ebec 0f82fefdffff jb 0x145b7e9f0

; guest-close-wrapper 0x145b189a9..0x145b189ef
145b189a9 4c8db1a00c0000 lea r14, [rcx + 0xca0]
145b189b0 83b9a00c000001 cmp dword ptr [rcx + 0xca0], 1
145b189b7 7724 ja 0x145b189dd
145b189b9 4883bfa80f000000 cmp qword ptr [rdi + 0xfa8], 0
145b189c1 741a je 0x145b189dd
145b189c3 4883bfd00e0000ff cmp qword ptr [rdi + 0xed0], -1
145b189cb 7410 je 0x145b189dd
145b189cd 4889f9 mov rcx, rdi
145b189d0 e84b6dffff call 0x145b0f720
145b189d5 4889f9 mov rcx, rdi
145b189d8 e803cbffff call 0x145b154e0
145b189dd 488d4da8 lea rcx, [rbp - 0x58]
145b189e1 41b838030000 mov r8d, 0x338
145b189e7 4c89f2 mov rdx, r14
145b189ea e86cb34700 call 0x145f93d5b

; party-close-wrapper 0x145b18ae6..0x145b18b2c
145b18ae6 4889ce mov rsi, rcx
145b18ae9 488b81a00c0000 mov rax, qword ptr [rcx + 0xca0]
145b18af0 4883f801 cmp rax, 1
145b18af4 772b ja 0x145b18b21
145b18af6 4883bea80f000000 cmp qword ptr [rsi + 0xfa8], 0
145b18afe 7421 je 0x145b18b21
145b18b00 4883bed00e0000ff cmp qword ptr [rsi + 0xed0], -1
145b18b08 7417 je 0x145b18b21
145b18b0a 4889f1 mov rcx, rsi
145b18b0d e80e6cffff call 0x145b0f720
145b18b12 4889f1 mov rcx, rsi
145b18b15 e8c6c9ffff call 0x145b154e0
145b18b1a 488b86a00c0000 mov rax, qword ptr [rsi + 0xca0]
145b18b21 48c786a00c000002000000 mov qword ptr [rsi + 0xca0], 2

; hakkar-descriptor-lookup 0x145b3e61d..0x145b3e6b3
145b3e61d 488d0dbe9ba901 lea rcx, [rip + 0x1a99bbe]
145b3e624 be0f000000 mov esi, 0xf
145b3e629 ba0f000000 mov edx, 0xf
145b3e62e 48898d380d0000 mov qword ptr [rbp + 0xd38], rcx
145b3e635 e8c6b3feff call 0x145b29a00
145b3e63a 488995400d0000 mov qword ptr [rbp + 0xd40], rdx
145b3e641 4885c0 test rax, rax
145b3e644 488b8d380d0000 mov rcx, qword ptr [rbp + 0xd38]
145b3e64b 480f45c8 cmovne rcx, rax
145b3e64f 48898d380d0000 mov qword ptr [rbp + 0xd38], rcx
145b3e656 488b85400d0000 mov rax, qword ptr [rbp + 0xd40]
145b3e65d 480f44c6 cmove rax, rsi
145b3e661 488985400d0000 mov qword ptr [rbp + 0xd40], rax
145b3e668 488d0d829ba901 lea rcx, [rip + 0x1a99b82]
145b3e66f be65000000 mov esi, 0x65
145b3e674 ba65000000 mov edx, 0x65
145b3e679 48898d480d0000 mov qword ptr [rbp + 0xd48], rcx
145b3e680 e87bb3feff call 0x145b29a00
145b3e685 488995500d0000 mov qword ptr [rbp + 0xd50], rdx
145b3e68c 4885c0 test rax, rax
145b3e68f 488b8d480d0000 mov rcx, qword ptr [rbp + 0xd48]
145b3e696 480f45c8 cmovne rcx, rax
145b3e69a 48898d480d0000 mov qword ptr [rbp + 0xd48], rcx
145b3e6a1 488b85500d0000 mov rax, qword ptr [rbp + 0xd50]
145b3e6a8 480f44c6 cmove rax, rsi
145b3e6ac 488985500d0000 mov qword ptr [rbp + 0xd50], rax
