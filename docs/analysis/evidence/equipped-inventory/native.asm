; Installed0.113.2 58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb
; Byte-addressed current Capstone extracts; Win64 ABI supplies parameter roles.

; temporary_slot_map 0x14596fe72..0x14596ff88
14596fe72 0f1005d7c19901 movups xmm0, xmmword ptr [rip + 0x199c1d7]
14596fe79 0f1145c0 movups xmmword ptr [rbp - 0x40], xmm0
14596fe7d 0f1005dcc19901 movups xmm0, xmmword ptr [rip + 0x199c1dc]
14596fe84 0f1145a9 movups xmmword ptr [rbp - 0x57], xmm0
14596fe88 48c785f800000000000000 mov qword ptr [rbp + 0xf8], 0
14596fe93 48c7850001000002000000 mov qword ptr [rbp + 0x100], 2
14596fe9e 488d9d08010000 lea rbx, [rbp + 0x108]
14596fea5 c6850801000000 mov byte ptr [rbp + 0x108], 0
14596feac 0f1045b9 movups xmm0, xmmword ptr [rbp - 0x47]
14596feb0 0f118509010000 movups xmmword ptr [rbp + 0x109], xmm0
14596feb7 488b45c8 mov rax, qword ptr [rbp - 0x38]
14596febb 48898518010000 mov qword ptr [rbp + 0x118], rax
14596fec2 c6852001000001 mov byte ptr [rbp + 0x120], 1
14596fec9 0f1045a2 movups xmm0, xmmword ptr [rbp - 0x5e]
14596fecd 0f118521010000 movups xmmword ptr [rbp + 0x121], xmm0
14596fed4 488b45b1 mov rax, qword ptr [rbp - 0x4f]
14596fed8 48898530010000 mov qword ptr [rbp + 0x130], rax
14596fedf b808000000 mov eax, 8
14596fee4 4531f6 xor r14d, r14d
14596fee7 0f57f6 xorps xmm6, xmm6
14596feea 4531ff xor r15d, r15d
14596feed 4c8ba5a8020000 mov r12, qword ptr [rbp + 0x2a8]
14596fef4 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14596ff00 4983ff02 cmp r15, 2
14596ff04 0f84f4030000 je 0x1459702fe
14596ff0a 4b8d147f lea rdx, [r15 + r15*2]
14596ff0e 0fb60cd3 movzx ecx, byte ptr [rbx + rdx*8]
14596ff12 80f902 cmp cl, 2
14596ff15 0f84e3030000 je 0x1459702fe
14596ff1b 49ffc7 inc r15
14596ff1e 488d14d3 lea rdx, [rbx + rdx*8]
14596ff22 888db7020000 mov byte ptr [rbp + 0x2b7], cl
14596ff28 0f104208 movups xmm0, xmmword ptr [rdx + 8]
14596ff2c 488d9578010000 lea rdx, [rbp + 0x178]
14596ff33 0f1102 movups xmmword ptr [rdx], xmm0
14596ff36 498bbc2448030000 mov rdi, qword ptr [r12 + 0x348]
14596ff3e 498b8c2450030000 mov rcx, qword ptr [r12 + 0x350]
14596ff46 488d0c49 lea rcx, [rcx + rcx*2]
14596ff4a 488d34cf lea rsi, [rdi + rcx*8]
14596ff4e 0f117210 movups xmmword ptr [rdx + 0x10], xmm6
14596ff52 4889b558010000 mov qword ptr [rbp + 0x158], rsi
14596ff59 488d8db7020000 lea rcx, [rbp + 0x2b7]
14596ff60 48898d60010000 mov qword ptr [rbp + 0x160], rcx
14596ff67 48c7856801000000000000 mov qword ptr [rbp + 0x168], 0
14596ff72 48c7857001000002000000 mov qword ptr [rbp + 0x170], 2
14596ff7d 31c9 xor ecx, ecx
14596ff7f 4839f7 cmp rdi, rsi
14596ff82 0f8478ffffff je 0x14596ff00

; amulet_rank_name_and_lines 0x14597030d..0x145970417
14597030d 418b842408040000 mov eax, dword ptr [r12 + 0x408]
145970315 4883f801 cmp rax, 1
145970319 761b jbe 0x145970336
14597031b 83f80b cmp eax, 0xb
14597031e 7339 jae 0x145970359
145970320 48c1e004 shl rax, 4
145970324 488d15fdb19901 lea rdx, [rip + 0x199b1fd]
14597032b 488b0c10 mov rcx, qword ptr [rax + rdx]
14597032f 488b441008 mov rax, qword ptr [rax + rdx + 8]
145970334 eb2f jmp 0x145970365
145970336 48c7854002000000000000 mov qword ptr [rbp + 0x240], 0
145970341 48c7854802000001000000 mov qword ptr [rbp + 0x248], 1
14597034c 48c7855002000000000000 mov qword ptr [rbp + 0x250], 0
145970357 eb74 jmp 0x1459703cd
145970359 b802000000 mov eax, 2
14597035e 488d0d73b29901 lea rcx, [rip + 0x199b273]
145970365 488d95f8000000 lea rdx, [rbp + 0xf8]
14597036c 48898df8000000 mov qword ptr [rbp + 0xf8], rcx
145970373 48898500010000 mov qword ptr [rbp + 0x100], rax
14597037a 48899550010000 mov qword ptr [rbp + 0x150], rdx
145970381 488d05381d69fa lea rax, [rip - 0x596e2c8]
145970388 48898558010000 mov qword ptr [rbp + 0x158], rax
14597038f c685c602000001 mov byte ptr [rbp + 0x2c6], 1
145970396 488d153db29901 lea rdx, [rip + 0x199b23d]
14597039d 488d8dd0010000 lea rcx, [rbp + 0x1d0]
1459703a4 4c8d8550010000 lea r8, [rbp + 0x150]
1459703ab e830c33500 call 0x145ccc6e0
1459703b0 90 nop
1459703b1 0f1085d0010000 movups xmm0, xmmword ptr [rbp + 0x1d0]
1459703b8 0f298540020000 movaps xmmword ptr [rbp + 0x240], xmm0
1459703bf 488b85e0010000 mov rax, qword ptr [rbp + 0x1e0]
1459703c6 48898550020000 mov qword ptr [rbp + 0x250], rax
1459703cd 498d8424b8030000 lea rax, [r12 + 0x3b8]
1459703d5 488985d0010000 mov qword ptr [rbp + 0x1d0], rax
1459703dc 488d0dfd1c69fa lea rcx, [rip - 0x596e303]
1459703e3 48898dd8010000 mov qword ptr [rbp + 0x1d8], rcx
1459703ea 488d8540020000 lea rax, [rbp + 0x240]
1459703f1 488985e0010000 mov qword ptr [rbp + 0x1e0], rax
1459703f8 48898de8010000 mov qword ptr [rbp + 0x1e8], rcx
1459703ff 488d15d8b19901 lea rdx, [rip + 0x199b1d8]
145970406 488d9d50010000 lea rbx, [rbp + 0x150]
14597040d 4c8d85d0010000 lea r8, [rbp + 0x1d0]
145970414 4889d9 mov rcx, rbx

; amulet_scale_then_lines 0x145970460..0x14597061b
145970460 498b842400040000 mov rax, qword ptr [r12 + 0x400]
145970468 4883f804 cmp rax, 4
14597046c b904000000 mov ecx, 4
145970471 480f42c8 cmovb rcx, rax
145970475 89c8 mov eax, ecx
145970477 488d0db6f86901 lea rcx, [rip + 0x169f8b6]
14597047e f30f100481 movss xmm0, dword ptr [rcx + rax*4]
145970483 f30f59056d1e5700 mulss xmm0, dword ptr [rip + 0x571e6d]
14597048b f30f5805f11b5300 addss xmm0, dword ptr [rip + 0x531bf1]
145970493 418b842408040000 mov eax, dword ptr [r12 + 0x408]
14597049b 83f801 cmp eax, 1
14597049e 83d0ff adc eax, -1
1459704a1 0f57c9 xorps xmm1, xmm1
1459704a4 f30f2ac8 cvtsi2ss xmm1, eax
1459704a8 e868953800 call 0x145cf9a15
1459704ad f30f58c0 addss xmm0, xmm0
1459704b1 f30f100d07215300 movss xmm1, dword ptr [rip + 0x532107]
1459704b9 f30f5cc8 subss xmm1, xmm0
1459704bd f30f118d50010000 movss dword ptr [rbp + 0x150], xmm1
1459704c5 498b8424d8030000 mov rax, qword ptr [r12 + 0x3d8]
1459704cd 498b8c24e0030000 mov rcx, qword ptr [r12 + 0x3e0]
1459704d5 48c1e106 shl rcx, 6
1459704d9 4801c1 add rcx, rax
1459704dc 488985d0010000 mov qword ptr [rbp + 0x1d0], rax
1459704e3 48898dd8010000 mov qword ptr [rbp + 0x1d8], rcx
1459704ea 48899de0010000 mov qword ptr [rbp + 0x1e0], rbx
1459704f1 488d8df8000000 lea rcx, [rbp + 0xf8]
1459704f8 488d95d0010000 lea rdx, [rbp + 0x1d0]
1459704ff e8cc0b0200 call 0x1459910d0
145970504 90 nop
145970505 4c8bad00010000 mov r13, qword ptr [rbp + 0x100]
14597050c 4c8bbd08010000 mov r15, qword ptr [rbp + 0x108]
145970513 4d85ff test r15, r15
145970516 4c89ad88020000 mov qword ptr [rbp + 0x288], r13
14597051d 7436 je 0x145970555
14597051f 4a8d04fd00000000 lea rax, [r15*8]
145970527 488d1c40 lea rbx, [rax + rax*2]
14597052b e8d01c69fa call 0x140002200
145970530 ba08000000 mov edx, 8
145970535 4889d9 mov rcx, rbx
145970538 e8831c69fa call 0x1400021c0
14597053d 4885c0 test rax, rax
145970540 7518 jne 0x14597055a
145970542 b908000000 mov ecx, 8
145970547 4889da mov rdx, rbx
14597054a e83cb85200 call 0x145e9bd8b
14597054f 90 nop
145970550 e9c50d0000 jmp 0x14597131a
145970555 b808000000 mov eax, 8
14597055a 4c89fa mov rdx, r15
14597055d 48c1e206 shl rdx, 6
145970561 4c01ea add rdx, r13
145970564 4c89bd50010000 mov qword ptr [rbp + 0x150], r15
14597056b 48898558010000 mov qword ptr [rbp + 0x158], rax
145970572 488d8d60010000 lea rcx, [rbp + 0x160]
145970579 48c7856001000000000000 mov qword ptr [rbp + 0x160], 0
145970584 488985e0010000 mov qword ptr [rbp + 0x1e0], rax
14597058b 48898dd0010000 mov qword ptr [rbp + 0x1d0], rcx
145970592 48c785d801000000000000 mov qword ptr [rbp + 0x1d8], 0
14597059d 4c8d85d0010000 lea r8, [rbp + 0x1d0]
1459705a4 4c89e9 mov rcx, r13
1459705a7 e884980300 call 0x1459a9e30
1459705ac 90 nop
1459705ad 41ffc6 inc r14d
1459705b0 0f108550010000 movups xmm0, xmmword ptr [rbp + 0x150]
1459705b7 0f1185e8010000 movups xmmword ptr [rbp + 0x1e8], xmm0
1459705be 488b8560010000 mov rax, qword ptr [rbp + 0x160]
1459705c5 488985f8010000 mov qword ptr [rbp + 0x1f8], rax
1459705cc 48c7850002000001000000 mov qword ptr [rbp + 0x200], 1
1459705d7 c7850802000000000000 mov dword ptr [rbp + 0x208], 0
1459705e1 488b85b8020000 mov rax, qword ptr [rbp + 0x2b8]
1459705e8 488985d0010000 mov qword ptr [rbp + 0x1d0], rax
1459705ef 488b85a0020000 mov rax, qword ptr [rbp + 0x2a0]
1459705f6 488985d8010000 mov qword ptr [rbp + 0x1d8], rax
1459705fd 4889b5e0010000 mov qword ptr [rbp + 0x1e0], rsi
145970604 4489b50c020000 mov dword ptr [rbp + 0x20c], r14d
14597060b c7851002000002000000 mov dword ptr [rbp + 0x210], 2
145970615 89bd14020000 mov dword ptr [rbp + 0x214], edi

; ordinary_guid_and_descriptor 0x1458f9630..0x1458f972a
1458f9630 4883fb4c cmp rbx, 0x4c
1458f9634 0f8403010000 je 0x1458f973d
1458f963a 4d89e5 mov r13, r12
1458f963d 49ffc4 inc r12
1458f9640 8b741da0 mov esi, dword ptr [rbp + rbx - 0x60]
1458f9644 4883c304 add rbx, 4
1458f9648 85f6 test esi, esi
1458f964a 74e4 je 0x1458f9630
1458f964c 4981c500010000 add r13, 0x100
1458f9653 48c745f800000000 mov qword ptr [rbp - 8], 0
1458f965b 48c7450800000000 mov qword ptr [rbp + 8], 0
1458f9663 4c89f9 mov rcx, r15
1458f9666 31d2 xor edx, edx
1458f9668 4589e8 mov r8d, r13d
1458f966b e850820a00 call 0x1459a18c0
1458f9670 90 nop
1458f9671 48b80000000000000040 movabs rax, 0x4000000000000000
1458f967b 4909c5 or r13, rax
1458f967e 4d89e8 mov r8, r13
1458f9681 49c1e820 shr r8, 0x20
1458f9685 4c89f9 mov rcx, r15
1458f9688 66ba0100 mov dx, 1
1458f968c e82f820a00 call 0x1459a18c0
1458f9691 90 nop
1458f9692 4c89f9 mov rcx, r15
1458f9695 66ba0200 mov dx, 2
1458f9699 41b803000000 mov r8d, 3
1458f969f e81c820a00 call 0x1459a18c0
1458f96a4 90 nop
1458f96a5 4c89f9 mov rcx, r15
1458f96a8 66ba0300 mov dx, 3
1458f96ac 4189f0 mov r8d, esi
1458f96af e80c820a00 call 0x1459a18c0
1458f96b4 90 nop
1458f96b5 4c89f9 mov rcx, r15
1458f96b8 66ba0400 mov dx, 4
1458f96bc 41b80000803f mov r8d, 0x3f800000
1458f96c2 e8f9810a00 call 0x1459a18c0
1458f96c7 90 nop
1458f96c8 4c89f9 mov rcx, r15
1458f96cb 66ba0600 mov dx, 6
1458f96cf 4189f8 mov r8d, edi
1458f96d2 e8e9810a00 call 0x1459a18c0
1458f96d7 90 nop
1458f96d8 4c89f9 mov rcx, r15
1458f96db 66ba0700 mov dx, 7
1458f96df 4589f0 mov r8d, r14d
1458f96e2 e8d9810a00 call 0x1459a18c0
1458f96e7 90 nop
1458f96e8 4c89f9 mov rcx, r15
1458f96eb 66ba0800 mov dx, 8
1458f96ef 4189f8 mov r8d, edi
1458f96f2 e8c9810a00 call 0x1459a18c0
1458f96f7 90 nop
1458f96f8 4c89f9 mov rcx, r15
1458f96fb 66ba0900 mov dx, 9
1458f96ff 4589f0 mov r8d, r14d
1458f9702 e8b9810a00 call 0x1459a18c0
1458f9707 90 nop
1458f9708 4c89f9 mov rcx, r15
1458f970b 66ba0e00 mov dx, 0xe
1458f970f 41b801000000 mov r8d, 1
1458f9715 e8a6810a00 call 0x1459a18c0
1458f971a 90 nop
1458f971b 488d4d28 lea rcx, [rbp + 0x28]
1458f971f 4c89ea mov rdx, r13
1458f9722 4d89f8 mov r8, r15
1458f9725 e806d4faff call 0x1458a6b30

; true_and_visible_fields 0x1458fbfe6..0x1458fc120
1458fbfe6 bef4040000 mov esi, 0x4f4
1458fbfeb 31c0 xor eax, eax
1458fbfed 4889eb mov rbx, rbp
1458fbff0 4881fe40050000 cmp rsi, 0x540
1458fbff7 7426 je 0x1458fc01f
1458fbff9 448d7001 lea r14d, [rax + 1]
1458fbffd 448b0437 mov r8d, dword ptr [rdi + rsi]
1458fc001 4883c604 add rsi, 4
1458fc005 c1e002 shl eax, 2
1458fc008 8d1440 lea edx, [rax + rax*2]
1458fc00b 81c204010000 add edx, 0x104
1458fc011 4889d9 mov rcx, rbx
1458fc014 e8a7580a00 call 0x1459a18c0
1458fc019 90 nop
1458fc01a 4489f0 mov eax, r14d
1458fc01d ebd1 jmp 0x1458fbff0
1458fc01f 488d4dac lea rcx, [rbp - 0x54]
1458fc023 4889fa mov rdx, rdi
1458fc026 e825540100 call 0x145911450
1458fc02b 90 nop
1458fc02c 31c0 xor eax, eax
1458fc02e 4889eb mov rbx, rbp
1458fc031 31f6 xor esi, esi
1458fc033 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1458fc040 4883f84c cmp rax, 0x4c
1458fc044 7458 je 0x1458fc09e
1458fc046 4989f4 mov r12, rsi
1458fc049 4c8d7804 lea r15, [rax + 4]
1458fc04d 48ffc6 inc rsi
1458fc050 837c05ac00 cmp dword ptr [rbp + rax - 0x54], 0
1458fc055 4c89f8 mov rax, r15
1458fc058 74e6 je 0x1458fc040
1458fc05a 428d1465e6010000 lea edx, [r12*2 + 0x1e6]
1458fc062 4d89e6 mov r14, r12
1458fc065 4981c600010000 add r14, 0x100
1458fc06c 4889d9 mov rcx, rbx
1458fc06f 4589f0 mov r8d, r14d
1458fc072 e849580a00 call 0x1459a18c0
1458fc077 90 nop
1458fc078 438d1424 lea edx, [r12 + r12]
1458fc07c 81c2e7010000 add edx, 0x1e7
1458fc082 49c1ee20 shr r14, 0x20
1458fc086 4181ce00000040 or r14d, 0x40000000
1458fc08d 4889d9 mov rcx, rbx
1458fc090 4589f0 mov r8d, r14d
1458fc093 e828580a00 call 0x1459a18c0
1458fc098 90 nop
1458fc099 4c89f8 mov rax, r15
1458fc09c eba2 jmp 0x1458fc040
1458fc09e 488b9f60030000 mov rbx, qword ptr [rdi + 0x360]
1458fc0a5 488b8768030000 mov rax, qword ptr [rdi + 0x368]
1458fc0ac 488d04c0 lea rax, [rax + rax*8]
1458fc0b0 488d34c3 lea rsi, [rbx + rax*8]
1458fc0b4 440fb6b70d0c0000 movzx r14d, byte ptr [rdi + 0xc0d]
1458fc0bc 4889ef mov rdi, rbp
1458fc0bf 90 nop
1458fc0c0 4839f3 cmp rbx, rsi
1458fc0c3 745b je 0x1458fc120
1458fc0c5 4989df mov r15, rbx
1458fc0c8 8b5b30 mov ebx, dword ptr [rbx + 0x30]
1458fc0cb 458b4738 mov r8d, dword ptr [r15 + 0x38]
1458fc0cf 8d145de6010000 lea edx, [rbx*2 + 0x1e6]
1458fc0d6 4889f9 mov rcx, rdi
1458fc0d9 e8e2570a00 call 0x1459a18c0
1458fc0de 90 nop
1458fc0df 01db add ebx, ebx
1458fc0e1 81c3e7010000 add ebx, 0x1e7
1458fc0e7 4889f9 mov rcx, rdi
1458fc0ea 89da mov edx, ebx
1458fc0ec 41b800000040 mov r8d, 0x40000000
1458fc0f2 e8c9570a00 call 0x1459a18c0
1458fc0f7 90 nop
1458fc0f8 498d5f48 lea rbx, [r15 + 0x48]
1458fc0fc 4584f6 test r14b, r14b
1458fc0ff 74bf je 0x1458fc0c0
1458fc101 418b4730 mov eax, dword ptr [r15 + 0x30]
1458fc105 458b4738 mov r8d, dword ptr [r15 + 0x38]
1458fc109 c1e002 shl eax, 2
1458fc10c 8d1440 lea edx, [rax + rax*2]
1458fc10f 81c204010000 add edx, 0x104
1458fc115 4889f9 mov rcx, rdi
1458fc118 e8a3570a00 call 0x1459a18c0
1458fc11d 90 nop
1458fc11e eba0 jmp 0x1458fc0c0

; dynamic_slot_and_rank 0x14596ffc0..0x14597007b
14596ffc0 4883f902 cmp rcx, 2
14596ffc4 0f8436ffffff je 0x14596ff00
14596ffca 488d5901 lea rbx, [rcx + 1]
14596ffce 48899d68010000 mov qword ptr [rbp + 0x168], rbx
14596ffd5 4c8bb4cd78010000 mov r14, qword ptr [rbp + rcx*8 + 0x178]
14596ffdd 8b4714 mov eax, dword ptr [rdi + 0x14]
14596ffe0 4883f801 cmp rax, 1
14596ffe4 4c89bdb8020000 mov qword ptr [rbp + 0x2b8], r15
14596ffeb 48899d88020000 mov qword ptr [rbp + 0x288], rbx
14596fff2 4c89b5a0020000 mov qword ptr [rbp + 0x2a0], r14
14596fff9 7675 jbe 0x145970070
14596fffb b902000000 mov ecx, 2
145970000 488d15d1b59901 lea rdx, [rip + 0x199b5d1]
145970007 83f80b cmp eax, 0xb
14597000a 7314 jae 0x145970020
14597000c 48c1e004 shl rax, 4
145970010 488d0d11b59901 lea rcx, [rip + 0x199b511]
145970017 488b1408 mov rdx, qword ptr [rax + rcx]
14597001b 488b4c0808 mov rcx, qword ptr [rax + rcx + 8]
145970020 488995b0010000 mov qword ptr [rbp + 0x1b0], rdx
145970027 48898db8010000 mov qword ptr [rbp + 0x1b8], rcx
14597002e 488d85b0010000 lea rax, [rbp + 0x1b0]
145970035 48898540020000 mov qword ptr [rbp + 0x240], rax
14597003c 488d057d2069fa lea rax, [rip - 0x596df83]
145970043 48898548020000 mov qword ptr [rbp + 0x248], rax
14597004a c685c602000001 mov byte ptr [rbp + 0x2c6], 1
145970051 488d8d68020000 lea rcx, [rbp + 0x268]
145970058 488d157bb59901 lea rdx, [rip + 0x199b57b]
14597005f 4c8d8540020000 lea r8, [rbp + 0x240]
145970066 e875c63500 call 0x145ccc6e0
14597006b 90 nop
14597006c eb23 jmp 0x145970091
14597006e 6690 nop
145970070 48c7856802000000000000 mov qword ptr [rbp + 0x268], 0

; dynamic_inventory_type 0x14597019c..0x1459701e8
14597019c 488b5f08 mov rbx, qword ptr [rdi + 8]
1459701a0 41807c244501 cmp byte ptr [r12 + 0x45], 1
1459701a6 41bd0c000000 mov r13d, 0xc
1459701ac 4183dd00 sbb r13d, 0
1459701b0 498b4c2420 mov rcx, qword ptr [r12 + 0x20]
1459701b5 498b542428 mov rdx, qword ptr [r12 + 0x28]
1459701ba e801a7edff call 0x14584a8c0
1459701bf 90 nop
1459701c0 4189c6 mov r14d, eax
1459701c3 f30f105710 movss xmm2, dword ptr [rdi + 0x10]
1459701c8 488d8d40020000 lea rcx, [rbp + 0x240]
1459701cf 4c89e2 mov rdx, r12
1459701d2 e8798eedff call 0x145849050
1459701d7 90 nop
1459701d8 ffc3 inc ebx
1459701da 488b85a0020000 mov rax, qword ptr [rbp + 0x2a0]
1459701e1 48898500020000 mov qword ptr [rbp + 0x200], rax

; identity_and_clone 0x1459708d0..0x1459709e4
1459708d0 4883c748 add rdi, 0x48
1459708d4 483bbdb8020000 cmp rdi, qword ptr [rbp + 0x2b8]
1459708db 0f84ff010000 je 0x145970ae0
1459708e1 4c396f30 cmp qword ptr [rdi + 0x30], r13
1459708e5 75e9 jne 0x1459708d0
1459708e7 4c396710 cmp qword ptr [rdi + 0x10], r12
1459708eb 75e3 jne 0x1459708d0
1459708ed 488b4f08 mov rcx, qword ptr [rdi + 8]
1459708f1 488b9588020000 mov rdx, qword ptr [rbp + 0x288]
1459708f8 4d89e0 mov r8, r12
1459708fb e891903800 call 0x145cf9991
145970900 85c0 test eax, eax
145970902 75cc jne 0x1459708d0
145970904 8b8584020000 mov eax, dword ptr [rbp + 0x284]
14597090a 39473c cmp dword ptr [rdi + 0x3c], eax
14597090d 75c1 jne 0x1459708d0
14597090f 48395f28 cmp qword ptr [rdi + 0x28], rbx
145970913 75bb jne 0x1459708d0
145970915 4885db test rbx, rbx
145970918 744e je 0x145970968
14597091a 4c8b7f20 mov r15, qword ptr [rdi + 0x20]
14597091e 41be10000000 mov r14d, 0x10
145970924 4889de mov rsi, rbx
145970927 660f1f840000000000 nop word ptr [rax + rax]
145970930 4f8b0437 mov r8, qword ptr [r15 + r14]
145970934 488b85a0020000 mov rax, qword ptr [rbp + 0x2a0]
14597093b 4e3b0430 cmp r8, qword ptr [rax + r14]
14597093f 758f jne 0x1459708d0
145970941 488b85a0020000 mov rax, qword ptr [rbp + 0x2a0]
145970948 4a8b5430f8 mov rdx, qword ptr [rax + r14 - 8]
14597094d 4b8b4c37f8 mov rcx, qword ptr [r15 + r14 - 8]
145970952 e83a903800 call 0x145cf9991
145970957 85c0 test eax, eax
145970959 0f8571ffffff jne 0x1459708d0
14597095f 4983c618 add r14, 0x18
145970963 48ffce dec rsi
145970966 75c8 jne 0x145970930
145970968 8b7738 mov esi, dword ptr [rdi + 0x38]
14597096b c685c702000001 mov byte ptr [rbp + 0x2c7], 1
145970972 488d8db0010000 lea rcx, [rbp + 0x1b0]
145970979 4889fa mov rdx, rdi
14597097c e81fc23500 call 0x145cccba0
145970981 90 nop
145970982 4c8ba5a8020000 mov r12, qword ptr [rbp + 0x2a8]
145970989 4c8bbdd8000000 mov r15, qword ptr [rbp + 0xd8]
145970990 f20f10773c movsd xmm6, qword ptr [rdi + 0x3c]
145970995 448b7744 mov r14d, dword ptr [rdi + 0x44]
145970999 4883c718 add rdi, 0x18
14597099d 488d8d40020000 lea rcx, [rbp + 0x240]
1459709a4 4889fa mov rdx, rdi
1459709a7 e8a4310200 call 0x145993b50
1459709ac 90 nop
1459709ad 4c89ad00020000 mov qword ptr [rbp + 0x200], r13
1459709b4 89b508020000 mov dword ptr [rbp + 0x208], esi
1459709ba 0f1085b0010000 movups xmm0, xmmword ptr [rbp + 0x1b0]
1459709c1 0f2985d0010000 movaps xmmword ptr [rbp + 0x1d0], xmm0
1459709c8 488b85c0010000 mov rax, qword ptr [rbp + 0x1c0]
1459709cf 488985e0010000 mov qword ptr [rbp + 0x1e0], rax
1459709d6 0f13b50c020000 movlps qword ptr [rbp + 0x20c], xmm6
1459709dd 4489b514020000 mov dword ptr [rbp + 0x214], r14d

; new_entry_create_then_fields 0x145970ae0..0x145970bd1
145970ae0 b801000000 mov eax, 1
145970ae5 f00fc105ebc58702 lock xadd dword ptr [rip + 0x287c5eb], eax
145970aed 4869c8893be655 imul rcx, rax, 0x55e63b89
145970af4 48c1e939 shr rcx, 0x39
145970af8 69c900e1f505 imul ecx, ecx, 0x5f5e100
145970afe f7d9 neg ecx
145970b00 8d3c08 lea edi, [rax + rcx]
145970b03 81c7a0bb0d00 add edi, 0xdbba0
145970b09 897d08 mov dword ptr [rbp + 8], edi
145970b0c 4c8ba5a8020000 mov r12, qword ptr [rbp + 0x2a8]
145970b13 498b942468040000 mov rdx, qword ptr [r12 + 0x468]
145970b1b c685c702000001 mov byte ptr [rbp + 0x2c7], 1
145970b22 488db5d0010000 lea rsi, [rbp + 0x1d0]
145970b29 4889f1 mov rcx, rsi
145970b2c 4189f8 mov r8d, edi
145970b2f e88cedf8ff call 0x1458ff8c0
145970b34 90 nop
145970b35 4c8bbdd8000000 mov r15, qword ptr [rbp + 0xd8]
145970b3c 89fa mov edx, edi
145970b3e 48b80000000000000040 movabs rax, 0x4000000000000000
145970b48 4809c2 or rdx, rax
145970b4b 488d8df8000000 lea rcx, [rbp + 0xf8]
145970b52 4989f0 mov r8, rsi
145970b55 e8d65ff3ff call 0x1458a6b30
145970b5a 90 nop
145970b5b c685c702000001 mov byte ptr [rbp + 0x2c7], 1
145970b62 4889f1 mov rcx, rsi
145970b65 e8b6150300 call 0x1459a2120
145970b6a 90 nop
145970b6b 8b7500 mov esi, dword ptr [rbp]
145970b6e 8d1475e6010000 lea edx, [rsi*2 + 0x1e6]
145970b75 c685c702000001 mov byte ptr [rbp + 0x2c7], 1
145970b7c 4c89f9 mov rcx, r15
145970b7f 4189f8 mov r8d, edi
145970b82 e8390d0300 call 0x1459a18c0
145970b87 90 nop
145970b88 8d1436 lea edx, [rsi + rsi]
145970b8b 81c2e7010000 add edx, 0x1e7
145970b91 c685c702000001 mov byte ptr [rbp + 0x2c7], 1
145970b98 4c89f9 mov rcx, r15
145970b9b 41b800000040 mov r8d, 0x40000000
145970ba1 e81a0d0300 call 0x1459a18c0
145970ba6 90 nop
145970ba7 4180bc240d0c000000 cmp byte ptr [r12 + 0xc0d], 0
145970bb0 741f je 0x145970bd1
145970bb2 c1e602 shl esi, 2
145970bb5 8d1476 lea edx, [rsi + rsi*2]
145970bb8 81c204010000 add edx, 0x104
145970bbe c685c702000001 mov byte ptr [rbp + 0x2c7], 1
145970bc5 4c89f9 mov rcx, r15
145970bc8 4189f8 mov r8d, edi
145970bcb e8f00c0300 call 0x1459a18c0
145970bd0 90 nop

; removed_slot_clear 0x145970d00..0x145970d81
145970d00 8d145de6010000 lea edx, [rbx*2 + 0x1e6]
145970d07 c685c502000001 mov byte ptr [rbp + 0x2c5], 1
145970d0e c685c402000001 mov byte ptr [rbp + 0x2c4], 1
145970d15 4c89f9 mov rcx, r15
145970d18 4531c0 xor r8d, r8d
145970d1b e8a00b0300 call 0x1459a18c0
145970d20 90 nop
145970d21 8d141b lea edx, [rbx + rbx]
145970d24 81c2e7010000 add edx, 0x1e7
145970d2a c685c502000001 mov byte ptr [rbp + 0x2c5], 1
145970d31 c685c402000001 mov byte ptr [rbp + 0x2c4], 1
145970d38 4c89f9 mov rcx, r15
145970d3b 4531c0 xor r8d, r8d
145970d3e e87d0b0300 call 0x1459a18c0
145970d43 90 nop
145970d44 4180bc240d0c000001 cmp byte ptr [r12 + 0xc0d], 1
145970d4d 0f853dffffff jne 0x145970c90
145970d53 8b4730 mov eax, dword ptr [rdi + 0x30]
145970d56 c1e002 shl eax, 2
145970d59 8d1440 lea edx, [rax + rax*2]
145970d5c 81c204010000 add edx, 0x104
145970d62 c685c502000001 mov byte ptr [rbp + 0x2c5], 1
145970d69 c685c402000001 mov byte ptr [rbp + 0x2c4], 1
145970d70 4c89f9 mov rcx, r15
145970d73 4531c0 xor r8d, r8d
145970d76 e8450b0300 call 0x1459a18c0
145970d7b 90 nop
145970d7c e90fffffff jmp 0x145970c90

; item_query_before_removals 0x145970d81..0x145970f0d
145970d81 83bd1001000000 cmp dword ptr [rbp + 0x110], 0
145970d88 0f849b000000 je 0x145970e29
145970d8e 0f1085f8000000 movups xmm0, xmmword ptr [rbp + 0xf8]
145970d95 0f108d08010000 movups xmm1, xmmword ptr [rbp + 0x108]
145970d9c 0f298de0010000 movaps xmmword ptr [rbp + 0x1e0], xmm1
145970da3 0f2985d0010000 movaps xmmword ptr [rbp + 0x1d0], xmm0
145970daa c685c502000000 mov byte ptr [rbp + 0x2c5], 0
145970db1 c685c402000001 mov byte ptr [rbp + 0x2c4], 1
145970db8 488d8d50010000 lea rcx, [rbp + 0x150]
145970dbf 488d95d0010000 lea rdx, [rbp + 0x1d0]
145970dc6 e8c566f3ff call 0x1458a7490
145970dcb 90 nop
145970dcc 498bb42430060000 mov rsi, qword ptr [r12 + 0x630]
145970dd4 493bb42420060000 cmp rsi, qword ptr [r12 + 0x620]
145970ddc 750e jne 0x145970dec
145970dde 498d8c2420060000 lea rcx, [r12 + 0x620]
145970de6 e8f5923800 call 0x145cfa0e0
145970deb 90 nop
145970dec 498b842428060000 mov rax, qword ptr [r12 + 0x628]
145970df4 4889f1 mov rcx, rsi
145970df7 48c1e105 shl rcx, 5
145970dfb 0f108550010000 movups xmm0, xmmword ptr [rbp + 0x150]
145970e02 0f108d60010000 movups xmm1, xmmword ptr [rbp + 0x160]
145970e09 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145970e0e 0f110408 movups xmmword ptr [rax + rcx], xmm0
145970e12 48ffc6 inc rsi
145970e15 4989b42430060000 mov qword ptr [r12 + 0x630], rsi
145970e1d c7858402000000000000 mov dword ptr [rbp + 0x284], 0
145970e27 eb08 jmp 0x145970e31
145970e29 b001 mov al, 1
145970e2b 898584020000 mov dword ptr [rbp + 0x284], eax
145970e31 488b8540020000 mov rax, qword ptr [rbp + 0x240]
145970e38 48898588020000 mov qword ptr [rbp + 0x288], rax
145970e3f 488b8548020000 mov rax, qword ptr [rbp + 0x248]
145970e46 488985a0020000 mov qword ptr [rbp + 0x2a0], rax
145970e4d 488bb550020000 mov rsi, qword ptr [rbp + 0x250]
145970e54 4885f6 test rsi, rsi
145970e57 0f84b0000000 je 0x145970f0d
145970e5d 48c1e603 shl rsi, 3
145970e61 498dbc2420060000 lea rdi, [r12 + 0x620]
145970e69 31db xor ebx, ebx
145970e6b eb4a jmp 0x145970eb7
145970e6d 0f1f00 nop dword ptr [rax]
145970e70 498b842428060000 mov rax, qword ptr [r12 + 0x628]
145970e78 4c89f1 mov rcx, r14
145970e7b 48c1e105 shl rcx, 5
145970e7f 48c7040820000000 mov qword ptr [rax + rcx], 0x20
145970e87 488b95b8020000 mov rdx, qword ptr [rbp + 0x2b8]
145970e8e 4889540808 mov qword ptr [rax + rcx + 8], rdx
145970e93 48c744081008000000 mov qword ptr [rax + rcx + 0x10], 8
145970e9c 66c7440818aa00 mov word ptr [rax + rcx + 0x18], 0xaa
145970ea3 49ffc6 inc r14
145970ea6 4d89b42430060000 mov qword ptr [r12 + 0x630], r14
145970eae 4883c308 add rbx, 8
145970eb2 4839de cmp rsi, rbx
145970eb5 7456 je 0x145970f0d
145970eb7 488b85a0020000 mov rax, qword ptr [rbp + 0x2a0]
145970ebe 4c8b3418 mov r14, qword ptr [rax + rbx]
145970ec2 e8391369fa call 0x140002200
145970ec7 b920000000 mov ecx, 0x20
145970ecc ba01000000 mov edx, 1
145970ed1 e8ea1269fa call 0x1400021c0
145970ed6 4885c0 test rax, rax
145970ed9 0f84e7030000 je 0x1459712c6
145970edf 488985b8020000 mov qword ptr [rbp + 0x2b8], rax
145970ee6 4c8930 mov qword ptr [rax], r14
145970ee9 4d8bb42430060000 mov r14, qword ptr [r12 + 0x630]
145970ef1 4d3bb42420060000 cmp r14, qword ptr [r12 + 0x620]
145970ef9 0f8571ffffff jne 0x145970e70
145970eff 4889f9 mov rcx, rdi
145970f02 e8d9913800 call 0x145cfa0e0
145970f07 90 nop
145970f08 e963ffffff jmp 0x145970e70

; overflow_tooltip_separator 0x1458d19d6..0x1458d1a22
1458d19d6 4c897550 mov qword ptr [rbp + 0x50], r14
1458d19da 4983ff04 cmp r15, 4
1458d19de 0f8695000000 jbe 0x1458d1a79
1458d19e4 4d8d47fc lea r8, [r15 - 4]
1458d19e8 4883c360 add rbx, 0x60
1458d19ec 488b4550 mov rax, qword ptr [rbp + 0x50]
1458d19f0 48894548 mov qword ptr [rbp + 0x48], rax
1458d19f4 488b4558 mov rax, qword ptr [rbp + 0x58]
1458d19f8 48894540 mov qword ptr [rbp + 0x40], rax
1458d19fc c685af00000001 mov byte ptr [rbp + 0xaf], 1
1458d1a03 48c744242008000000 mov qword ptr [rsp + 0x20], 8
1458d1a0c 4c8d0d8593a301 lea r9, [rip + 0x1a39385]
1458d1a13 488d8d80000000 lea rcx, [rbp + 0x80]
1458d1a1a 4889da mov rdx, rbx
1458d1a1d e85eca0c00 call 0x14599e480
