; local-helper-flags 0x145b7e69d..0x145b7e709
145b7e69d 410fb684248a0c0000 movzx eax, byte ptr [r12 + 0xc8a]
145b7e6a6 fec8 dec al
145b7e6a8 400f94c6 sete sil
145b7e6ac 3c02 cmp al, 2
145b7e6ae 410f92c6 setb r14b
145b7e6b2 488bbd00130000 mov rdi, qword ptr [rbp + 0x1300]
145b7e6b9 483bbdf0120000 cmp rdi, qword ptr [rbp + 0x12f0]
145b7e6c0 750d jne 0x145b7e6cf
145b7e6c2 488d8df0120000 lea rcx, [rbp + 0x12f0]
145b7e6c9 e8a2654400 call 0x145fc4c70
145b7e6ce 90 nop
145b7e6cf 4d8dac24f0040000 lea r13, [r12 + 0x4f0]
145b7e6d7 488b85f8120000 mov rax, qword ptr [rbp + 0x12f8]
145b7e6de 4889f9 mov rcx, rdi
145b7e6e1 48c1e104 shl rcx, 4
145b7e6e5 418b5508 mov edx, dword ptr [r13 + 8]
145b7e6e9 89540808 mov dword ptr [rax + rcx + 8], edx
145b7e6ed 498b5500 mov rdx, qword ptr [r13]
145b7e6f1 48891408 mov qword ptr [rax + rcx], rdx
145b7e6f5 448874080c mov byte ptr [rax + rcx + 0xc], r14b
145b7e6fa 408874080d mov byte ptr [rax + rcx + 0xd], sil
145b7e6ff 48ffc7 inc rdi
145b7e702 4889bd00130000 mov qword ptr [rbp + 0x1300], rdi

; remote-helper-flags 0x145b2387f..0x145b238d7
145b2387f 410fb6828a0c0000 movzx eax, byte ptr [r10 + 0xc8a]
145b23887 fec8 dec al
145b23889 410f94c4 sete r12b
145b2388d 3c02 cmp al, 2
145b2388f 400f92c6 setb sil
145b23893 4c8b6b10 mov r13, qword ptr [rbx + 0x10]
145b23897 4c3b2b cmp r13, qword ptr [rbx]
145b2389a 7510 jne 0x145b238ac
145b2389c 4889d9 mov rcx, rbx
145b2389f 4c8955e0 mov qword ptr [rbp - 0x20], r10
145b238a3 e8c8134a00 call 0x145fc4c70
145b238a8 4c8b55e0 mov r10, qword ptr [rbp - 0x20]
145b238ac 488b4308 mov rax, qword ptr [rbx + 8]
145b238b0 4c89e9 mov rcx, r13
145b238b3 48c1e104 shl rcx, 4
145b238b7 418b5708 mov edx, dword ptr [r15 + 8]
145b238bb 89540808 mov dword ptr [rax + rcx + 8], edx
145b238bf 498b17 mov rdx, qword ptr [r15]
145b238c2 48891408 mov qword ptr [rax + rcx], rdx
145b238c6 408874080c mov byte ptr [rax + rcx + 0xc], sil
145b238cb 448864080d mov byte ptr [rax + rcx + 0xd], r12b
145b238d0 49ffc5 inc r13
145b238d3 4c896b10 mov qword ptr [rbx + 0x10], r13

; nearby-helper-first 0x145c33988..0x145c339be
145c33988 4839f8 cmp rax, rdi
145c3398b 74e3 je 0x145c33970
145c3398d 41807e0c01 cmp byte ptr [r14 + 0xc], 1
145c33992 75dc jne 0x145c33970
145c33994 f2410f1006 movsd xmm0, qword ptr [r14]
145c33999 f2410f104d00 movsd xmm1, qword ptr [r13]
145c3399f 0f5cc1 subps xmm0, xmm1
145c339a2 0f59c0 mulps xmm0, xmm0
145c339a5 f30f16c8 movshdup xmm1, xmm0
145c339a9 f30f58c8 addss xmm1, xmm0
145c339ad 488d5f01 lea rbx, [rdi + 1]
145c339b1 0f2ef1 ucomiss xmm6, xmm1
145c339b4 48895a10 mov qword ptr [rdx + 0x10], rbx
145c339b8 72be jb 0x145c33978
145c339ba 4983c610 add r14, 0x10

; nearby-helper-later 0x145c33a1c..0x145c33a46
145c33a1c 4839da cmp rdx, rbx
145c33a1f 74ef je 0x145c33a10
145c33a21 41807e0c01 cmp byte ptr [r14 + 0xc], 1
145c33a26 75e8 jne 0x145c33a10
145c33a28 f2410f1006 movsd xmm0, qword ptr [r14]
145c33a2d f2410f104d00 movsd xmm1, qword ptr [r13]
145c33a33 0f5cc1 subps xmm0, xmm1
145c33a36 0f59c0 mulps xmm0, xmm0
145c33a39 f30f16c8 movshdup xmm1, xmm0
145c33a3d f30f58c8 addss xmm1, xmm0
145c33a41 0f2ef1 ucomiss xmm6, xmm1
145c33a44 72ca jb 0x145c33a10

; nearby-radius-load 0x145c33964..0x145c3396c
145c33964 f30f1035ac106000 movss xmm6, dword ptr [rip + 0x6010ac]

; down-finished-admission 0x145b7e957..0x145b7e975
145b7e957 4180bc248a0c000004 cmp byte ptr [r12 + 0xc8a], 4
145b7e960 0f857f030000 jne 0x145b7ece5
145b7e966 4180bc24770c000000 cmp byte ptr [r12 + 0xc77], 0
145b7e96f 0f8570030000 jne 0x145b7ece5

; nearby-collector-call 0x145b7e98a..0x145b7e9f7
145b7e98a 4d8bbc24800b0000 mov r15, qword ptr [r12 + 0xb80]
145b7e992 4c89bdc8120000 mov qword ptr [rbp + 0x12c8], r15
145b7e999 488b85f8120000 mov rax, qword ptr [rbp + 0x12f8]
145b7e9a0 488b8d00130000 mov rcx, qword ptr [rbp + 0x1300]
145b7e9a7 48c1e104 shl rcx, 4
145b7e9ab 4801c1 add rcx, rax
145b7e9ae 48898530090000 mov qword ptr [rbp + 0x930], rax
145b7e9b5 48898d38090000 mov qword ptr [rbp + 0x938], rcx
145b7e9bc 48c7854009000000000000 mov qword ptr [rbp + 0x940], 0
145b7e9c7 488d85c8120000 lea rax, [rbp + 0x12c8]
145b7e9ce 48898548090000 mov qword ptr [rbp + 0x948], rax
145b7e9d5 488d85d0120000 lea rax, [rbp + 0x12d0]
145b7e9dc 48898550090000 mov qword ptr [rbp + 0x950], rax
145b7e9e3 488d8d40130000 lea rcx, [rbp + 0x1340]
145b7e9ea 488d9530090000 lea rdx, [rbp + 0x930]
145b7e9f1 e82a4f0b00 call 0x145c33920
145b7e9f6 90 nop

; three-way-timer 0x145b7e9f7..0x145b7eacb
145b7e9f7 488b8550130000 mov rax, qword ptr [rbp + 0x1350]
145b7e9fe 4885c0 test rax, rax
145b7ea01 747d je 0x145b7ea80
145b7ea03 4c8b8548130000 mov r8, qword ptr [rbp + 0x1348]
145b7ea0a 4c8b8df8120000 mov r9, qword ptr [rbp + 0x12f8]
145b7ea11 488b9500130000 mov rdx, qword ptr [rbp + 0x1300]
145b7ea18 4c8d14c500000000 lea r10, [rax*8]
145b7ea20 4531db xor r11d, r11d
145b7ea23 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b7ea30 4d39da cmp r10, r11
145b7ea33 0f8458020000 je 0x145b7ec91
145b7ea39 4b8b0c18 mov rcx, qword ptr [r8 + r11]
145b7ea3d 4839d1 cmp rcx, rdx
145b7ea40 0f83a42a0000 jae 0x145b814ea
145b7ea46 48c1e104 shl rcx, 4
145b7ea4a 4983c308 add r11, 8
145b7ea4e 41807c090d00 cmp byte ptr [r9 + rcx + 0xd], 0
145b7ea54 74da je 0x145b7ea30
145b7ea56 f3410f108424680c0000 movss xmm0, dword ptr [r12 + 0xc68]
145b7ea60 488b4da8 mov rcx, qword ptr [rbp - 0x58]
145b7ea64 f30f5801 addss xmm0, dword ptr [rcx]
145b7ea68 f3410f118424680c0000 movss dword ptr [r12 + 0xc68], xmm0
145b7ea72 0f2e05a7535e00 ucomiss xmm0, dword ptr [rip + 0x5e53a7]
145b7ea79 7235 jb 0x145b7eab0
145b7ea7b e932020000 jmp 0x145b7ecb2
145b7ea80 f3410f108424680c0000 movss xmm0, dword ptr [r12 + 0xc68]
145b7ea8a 488b4da8 mov rcx, qword ptr [rbp - 0x58]
145b7ea8e f30f5c01 subss xmm0, dword ptr [rcx]
145b7ea92 0f57c9 xorps xmm1, xmm1
145b7ea95 f30f5fc1 maxss xmm0, xmm1
145b7ea99 f3410f118424680c0000 movss dword ptr [r12 + 0xc68], xmm0
145b7eaa3 0f2e0576535e00 ucomiss xmm0, dword ptr [rip + 0x5e5376]
145b7eaaa 0f8302020000 jae 0x145b7ecb2
145b7eab0 f30f5e0568535e00 divss xmm0, dword ptr [rip + 0x5e5368]
145b7eab8 0f57c9 xorps xmm1, xmm1
145b7eabb f30f5fc8 maxss xmm1, xmm0
145b7eabf f30f1035cd505e00 movss xmm6, dword ptr [rip + 0x5e50cd]
145b7eac7 f30f5df1 minss xmm6, xmm1

; interaction-rows 0x145b7eacb..0x145b7ec91
145b7eacb 488b8d40130000 mov rcx, qword ptr [rbp + 0x1340]
145b7ead2 48898d68130000 mov qword ptr [rbp + 0x1368], rcx
145b7ead9 4c8bb548130000 mov r14, qword ptr [rbp + 0x1348]
145b7eae0 498d04c6 lea rax, [r14 + rax*8]
145b7eae4 488985a0130000 mov qword ptr [rbp + 0x13a0], rax
145b7eaeb 488b7db0 mov rdi, qword ptr [rbp - 0x50]
145b7eaef 4c8b65b8 mov r12, qword ptr [rbp - 0x48]
145b7eaf3 4b8d047f lea rax, [r15 + r15*2]
145b7eaf7 48c1e003 shl rax, 3
145b7eafb 48898580130000 mov qword ptr [rbp + 0x1380], rax
145b7eb02 4c89b5e0120000 mov qword ptr [rbp + 0x12e0], r14
145b7eb09 eb57 jmp 0x145b7eb62
145b7eb0b 0f1f440000 nop dword ptr [rax + rax]
145b7eb10 4983c608 add r14, 8
145b7eb14 488b4708 mov rax, qword ptr [rdi + 8]
145b7eb18 488d0cf6 lea rcx, [rsi + rsi*8]
145b7eb1c 488b9570090000 mov rdx, qword ptr [rbp + 0x970]
145b7eb23 488954c840 mov qword ptr [rax + rcx*8 + 0x40], rdx
145b7eb28 0f108530090000 movups xmm0, xmmword ptr [rbp + 0x930]
145b7eb2f 0f108d40090000 movups xmm1, xmmword ptr [rbp + 0x940]
145b7eb36 f30f6f9550090000 movdqu xmm2, xmmword ptr [rbp + 0x950]
145b7eb3e f30f6f9d60090000 movdqu xmm3, xmmword ptr [rbp + 0x960]
145b7eb46 f30f7f5cc830 movdqu xmmword ptr [rax + rcx*8 + 0x30], xmm3
145b7eb4c f30f7f54c820 movdqu xmmword ptr [rax + rcx*8 + 0x20], xmm2
145b7eb52 0f114cc810 movups xmmword ptr [rax + rcx*8 + 0x10], xmm1
145b7eb57 0f1104c8 movups xmmword ptr [rax + rcx*8], xmm0
145b7eb5b 48ffc6 inc rsi
145b7eb5e 48897710 mov qword ptr [rdi + 0x10], rsi
145b7eb62 4c3bb5a0130000 cmp r14, qword ptr [rbp + 0x13a0]
145b7eb69 0f8406010000 je 0x145b7ec75
145b7eb6f 498b1e mov rbx, qword ptr [r14]
145b7eb72 498b442410 mov rax, qword ptr [r12 + 0x10]
145b7eb77 be01000000 mov esi, 1
145b7eb7c 4839c3 cmp rbx, rax
145b7eb7f 733f jae 0x145b7ebc0
145b7eb81 488d145b lea rdx, [rbx + rbx*2]
145b7eb85 48c1e203 shl rdx, 3
145b7eb89 4903542408 add rdx, qword ptr [r12 + 8]
145b7eb8e 488d8d30090000 lea rcx, [rbp + 0x930]
145b7eb95 e856883e00 call 0x145f673f0
145b7eb9a 90 nop
145b7eb9b 488b9530090000 mov rdx, qword ptr [rbp + 0x930]
145b7eba2 4c8b8538090000 mov r8, qword ptr [rbp + 0x938]
145b7eba9 4c8bad40090000 mov r13, qword ptr [rbp + 0x940]
145b7ebb0 498b442410 mov rax, qword ptr [r12 + 0x10]
145b7ebb5 4939c7 cmp r15, rax
145b7ebb8 7216 jb 0x145b7ebd0
145b7ebba 31c0 xor eax, eax
145b7ebbc 31c9 xor ecx, ecx
145b7ebbe eb5a jmp 0x145b7ec1a
145b7ebc0 31d2 xor edx, edx
145b7ebc2 41b801000000 mov r8d, 1
145b7ebc8 4531ed xor r13d, r13d
145b7ebcb 4939c7 cmp r15, rax
145b7ebce 73ea jae 0x145b7ebba
145b7ebd0 4c898588130000 mov qword ptr [rbp + 0x1388], r8
145b7ebd7 48899590130000 mov qword ptr [rbp + 0x1390], rdx
145b7ebde 498b542408 mov rdx, qword ptr [r12 + 8]
145b7ebe3 48039580130000 add rdx, qword ptr [rbp + 0x1380]
145b7ebea 488d8d30090000 lea rcx, [rbp + 0x930]
145b7ebf1 e8fa873e00 call 0x145f673f0
145b7ebf6 90 nop
145b7ebf7 488b8530090000 mov rax, qword ptr [rbp + 0x930]
145b7ebfe 488bb538090000 mov rsi, qword ptr [rbp + 0x938]
145b7ec05 488b8d40090000 mov rcx, qword ptr [rbp + 0x940]
145b7ec0c 488b9590130000 mov rdx, qword ptr [rbp + 0x1390]
145b7ec13 4c8b8588130000 mov r8, qword ptr [rbp + 0x1388]
145b7ec1a 48899d60090000 mov qword ptr [rbp + 0x960], rbx
145b7ec21 48899530090000 mov qword ptr [rbp + 0x930], rdx
145b7ec28 4c898538090000 mov qword ptr [rbp + 0x938], r8
145b7ec2f 4c89ad40090000 mov qword ptr [rbp + 0x940], r13
145b7ec36 4c89bd68090000 mov qword ptr [rbp + 0x968], r15
145b7ec3d 48898548090000 mov qword ptr [rbp + 0x948], rax
145b7ec44 4889b550090000 mov qword ptr [rbp + 0x950], rsi
145b7ec4b 48898d58090000 mov qword ptr [rbp + 0x958], rcx
145b7ec52 f30f11b570090000 movss dword ptr [rbp + 0x970], xmm6
145b7ec5a 488b7710 mov rsi, qword ptr [rdi + 0x10]
145b7ec5e 483b37 cmp rsi, qword ptr [rdi]
145b7ec61 0f85a9feffff jne 0x145b7eb10
145b7ec67 4889f9 mov rcx, rdi
145b7ec6a e8915a4100 call 0x145f94700
145b7ec6f 90 nop
145b7ec70 e99bfeffff jmp 0x145b7eb10
145b7ec75 488b9568130000 mov rdx, qword ptr [rbp + 0x1368]
145b7ec7c 4885d2 test rdx, rdx
145b7ec7f 4c8ba570130000 mov r12, qword ptr [rbp + 0x1370]
145b7ec86 488b8de0120000 mov rcx, qword ptr [rbp + 0x12e0]
145b7ec8d 7546 jne 0x145b7ecd5
145b7ec8f eb54 jmp 0x145b7ece5

; chooser-hold-completion 0x145b7ec91..0x145b7ecc2
145b7ec91 f3410f108424680c0000 movss xmm0, dword ptr [r12 + 0xc68]
145b7ec9b f3410f118424680c0000 movss dword ptr [r12 + 0xc68], xmm0
145b7eca5 0f2e0574515e00 ucomiss xmm0, dword ptr [rip + 0x5e5174]
145b7ecac 0f82fefdffff jb 0x145b7eab0
145b7ecb2 c6856713000001 mov byte ptr [rbp + 0x1367], 1
145b7ecb9 4c89e1 mov rcx, r12
145b7ecbc e89f880000 call 0x145b87560
145b7ecc1 90 nop

; revive-completion 0x145b87560..0x145b87a87
145b87560 55 push rbp
145b87561 4157 push r15
145b87563 4156 push r14
145b87565 4155 push r13
145b87567 4154 push r12
145b87569 56 push rsi
145b8756a 57 push rdi
145b8756b 53 push rbx
145b8756c 4881ec08010000 sub rsp, 0x108
145b87573 488dac2480000000 lea rbp, [rsp + 0x80]
145b8757b 440f294570 movaps xmmword ptr [rbp + 0x70], xmm8
145b87580 0f297d60 movaps xmmword ptr [rbp + 0x60], xmm7
145b87584 0f297550 movaps xmmword ptr [rbp + 0x50], xmm6
145b87588 48c74548feffffff mov qword ptr [rbp + 0x48], 0xfffffffffffffffe
145b87590 4889ce mov rsi, rcx
145b87593 c781680c000000000000 mov dword ptr [rcx + 0xc68], 0
145b8759d c6818a0c000001 mov byte ptr [rcx + 0xc8a], 1
145b875a4 c781000b000000000000 mov dword ptr [rcx + 0xb00], 0
145b875ae 488db940060000 lea rdi, [rcx + 0x640]
145b875b5 488b9188040000 mov rdx, qword ptr [rcx + 0x488]
145b875bc 448b8170050000 mov r8d, dword ptr [rcx + 0x570]
145b875c3 488d4dd0 lea rcx, [rbp - 0x30]
145b875c7 e8c493fdff call 0x145b60990
145b875cc 488b9e50060000 mov rbx, qword ptr [rsi + 0x650]
145b875d3 483b9e40060000 cmp rbx, qword ptr [rsi + 0x640]
145b875da 7509 jne 0x145b875e5
145b875dc 4889f9 mov rcx, rdi
145b875df e84cd34000 call 0x145f94930
145b875e4 90 nop
145b875e5 488b8648060000 mov rax, qword ptr [rsi + 0x648]
145b875ec 4889d9 mov rcx, rbx
145b875ef 48c1e105 shl rcx, 5
145b875f3 0f1045d0 movups xmm0, xmmword ptr [rbp - 0x30]
145b875f7 0f104de0 movups xmm1, xmmword ptr [rbp - 0x20]
145b875fb 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145b87600 0f110408 movups xmmword ptr [rax + rcx], xmm0
145b87604 48ffc3 inc rbx
145b87607 48899e50060000 mov qword ptr [rsi + 0x650], rbx
145b8760e ff8670050000 inc dword ptr [rsi + 0x570]
145b87614 488d9e600b0000 lea rbx, [rsi + 0xb60]
145b8761b 4531e4 xor r12d, r12d
145b8761e 4889d9 mov rcx, rbx
145b87621 66ba8a00 mov dx, 0x8a
145b87625 4531c0 xor r8d, r8d
145b87628 e893d4eeff call 0x145a74ac0
145b8762d f30f10b6a0040000 movss xmm6, dword ptr [rsi + 0x4a0]
145b87635 f30f10057bca5d00 movss xmm0, dword ptr [rip + 0x5dca7b]
145b8763d f30f59c6 mulss xmm0, xmm6
145b87641 f30f118608050000 movss dword ptr [rsi + 0x508], xmm0
145b87649 0f57ff xorps xmm7, xmm7
145b8764c f30f5fc7 maxss xmm0, xmm7
145b87650 e8f2cb4000 call 0x145f94247
145b87655 f34c0f2cf0 cvttss2si r14, xmm0
145b8765a 0f2ec7 ucomiss xmm0, xmm7
145b8765d 450f42f4 cmovb r14d, r12d
145b87661 f3440f10052a9b5f00 movss xmm8, dword ptr [rip + 0x5f9b2a]
145b8766a 410f2ec0 ucomiss xmm0, xmm8
145b8766e 41bdffffffff mov r13d, 0xffffffff
145b87674 450f47f5 cmova r14d, r13d
145b87678 0f28c6 movaps xmm0, xmm6
145b8767b e8c7cb4000 call 0x145f94247
145b87680 f34c0f2cf8 cvttss2si r15, xmm0
145b87685 0f2ec7 ucomiss xmm0, xmm7
145b87688 450f42fc cmovb r15d, r12d
145b8768c 410f2ec0 ucomiss xmm0, xmm8
145b87690 450f47fd cmova r15d, r13d
145b87694 4889d9 mov rcx, rbx
145b87697 66ba1600 mov dx, 0x16
145b8769b 4589f0 mov r8d, r14d
145b8769e e81dd4eeff call 0x145a74ac0
145b876a3 4889d9 mov rcx, rbx
145b876a6 66ba1c00 mov dx, 0x1c
145b876aa 4589f8 mov r8d, r15d
145b876ad e80ed4eeff call 0x145a74ac0
145b876b2 488b9688040000 mov rdx, qword ptr [rsi + 0x488]
145b876b9 488955c8 mov qword ptr [rbp - 0x38], rdx
145b876bd c7451802000000 mov dword ptr [rbp + 0x18], 2
145b876c4 c745bc00000000 mov dword ptr [rbp - 0x44], 0
145b876cb 488d45bc lea rax, [rbp - 0x44]
145b876cf 4889442430 mov qword ptr [rsp + 0x30], rax
145b876d4 488d4518 lea rax, [rbp + 0x18]
145b876d8 4889442428 mov qword ptr [rsp + 0x28], rax
145b876dd 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145b876e6 488d4dd0 lea rcx, [rbp - 0x30]
145b876ea 4c8d4dc8 lea r9, [rbp - 0x38]
145b876ee 41b8b1520000 mov r8d, 0x52b1
145b876f4 e8074dfeff call 0x145b6c400
145b876f9 488b9e50060000 mov rbx, qword ptr [rsi + 0x650]
145b87700 483b9e40060000 cmp rbx, qword ptr [rsi + 0x640]
145b87707 7509 jne 0x145b87712
145b87709 4889f9 mov rcx, rdi
145b8770c e81fd24000 call 0x145f94930
145b87711 90 nop
145b87712 488b8648060000 mov rax, qword ptr [rsi + 0x648]
145b87719 4889d9 mov rcx, rbx
145b8771c 48c1e105 shl rcx, 5
145b87720 0f1045d0 movups xmm0, xmmword ptr [rbp - 0x30]
145b87724 0f104de0 movups xmm1, xmmword ptr [rbp - 0x20]
145b87728 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145b8772d 0f110408 movups xmmword ptr [rax + rcx], xmm0
145b87731 48ffc3 inc rbx
145b87734 48899e50060000 mov qword ptr [rsi + 0x650], rbx
145b8773b 488bbeb8030000 mov rdi, qword ptr [rsi + 0x3b8]
145b87742 4885ff test rdi, rdi
145b87745 7434 je 0x145b8777b
145b87747 488b86b0030000 mov rax, qword ptr [rsi + 0x3b0]
145b8774e 488d5034 lea rdx, [rax + 0x34]
145b87752 31c9 xor ecx, ecx
145b87754 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b87760 817ae0fc030000 cmp dword ptr [rdx - 0x20], 0x3fc
145b87767 0f84ee010000 je 0x145b8795b
145b8776d 48ffc1 inc rcx
145b87770 4883c220 add rdx, 0x20
145b87774 4839cf cmp rdi, rcx
145b87777 75e7 jne 0x145b87760
145b87779 eb02 jmp 0x145b8777d
145b8777b 31ff xor edi, edi
145b8777d f30f10b6dc0b0000 movss xmm6, dword ptr [rsi + 0xbdc]
145b87785 f30f583593c45d00 addss xmm6, dword ptr [rip + 0x5dc493]
145b8778d 483bbea8030000 cmp rdi, qword ptr [rsi + 0x3a8]
145b87794 750c jne 0x145b877a2
145b87796 488d8ea8030000 lea rcx, [rsi + 0x3a8]
145b8779d e88ed14000 call 0x145f94930
145b877a2 488b86b0030000 mov rax, qword ptr [rsi + 0x3b0]
145b877a9 4889f9 mov rcx, rdi
145b877ac 48c1e105 shl rcx, 5
145b877b0 48c7040800000000 mov qword ptr [rax + rcx], 0
145b877b8 c74408080c000000 mov dword ptr [rax + rcx + 8], 0xc
145b877c0 c7440814fc030000 mov dword ptr [rax + rcx + 0x14], 0x3fc
145b877c8 f30f11740818 movss dword ptr [rax + rcx + 0x18], xmm6
145b877ce c744081c00000000 mov dword ptr [rax + rcx + 0x1c], 0
145b877d6 48ffc7 inc rdi
145b877d9 4889beb8030000 mov qword ptr [rsi + 0x3b8], rdi
145b877e0 4889f1 mov rcx, rsi
145b877e3 e878450000 call 0x145b8bd60
145b877e8 e813aa47fa call 0x140002200
145b877ed b901000000 mov ecx, 1
145b877f2 ba01000000 mov edx, 1
145b877f7 e8c4a947fa call 0x1400021c0
145b877fc 4885c0 test rax, rax
145b877ff 0f8471020000 je 0x145b87a76
145b87805 c6007b mov byte ptr [rax], 0x7b
145b87808 48c745d001000000 mov qword ptr [rbp - 0x30], 1
145b87810 488945d8 mov qword ptr [rbp - 0x28], rax
145b87814 48c745e001000000 mov qword ptr [rbp - 0x20], 1
145b8781c c645e801 mov byte ptr [rbp - 0x18], 1
145b87820 488d052dc5a501 lea rax, [rip + 0x1a5c52d]
145b87827 4889442420 mov qword ptr [rsp + 0x20], rax
145b8782c 48c744242807000000 mov qword ptr [rsp + 0x28], 7
145b87835 4c8d05ecbda501 lea r8, [rip + 0x1a5bdec]
145b8783c 488d4d18 lea rcx, [rbp + 0x18]
145b87840 488d55d0 lea rdx, [rbp - 0x30]
145b87844 41b904000000 mov r9d, 4
145b8784a e8e125f5ff call 0x145ad9e30
145b8784f 488b4518 mov rax, qword ptr [rbp + 0x18]
145b87853 488b7d28 mov rdi, qword ptr [rbp + 0x28]
145b87857 4839f8 cmp rax, rdi
145b8785a 0f84eb010000 je 0x145b87a4b
145b87860 48894540 mov qword ptr [rbp + 0x40], rax
145b87864 488b4520 mov rax, qword ptr [rbp + 0x20]
145b87868 48894538 mov qword ptr [rbp + 0x38], rax
145b8786c c604387d mov byte ptr [rax + rdi], 0x7d
145b87870 488b9e68060000 mov rbx, qword ptr [rsi + 0x668]
145b87877 483b9e58060000 cmp rbx, qword ptr [rsi + 0x658]
145b8787e 750d jne 0x145b8788d
145b87880 488d8e58060000 lea rcx, [rsi + 0x658]
145b87887 e804ce4000 call 0x145f94690
145b8788c 90 nop
145b8788d 48ffc7 inc rdi
145b87890 488b8660060000 mov rax, qword ptr [rsi + 0x660]
145b87897 488d0c5b lea rcx, [rbx + rbx*2]
145b8789b 488b5540 mov rdx, qword ptr [rbp + 0x40]
145b8789f 488914c8 mov qword ptr [rax + rcx*8], rdx
145b878a3 488b5538 mov rdx, qword ptr [rbp + 0x38]
145b878a7 488954c808 mov qword ptr [rax + rcx*8 + 8], rdx
145b878ac 48897cc810 mov qword ptr [rax + rcx*8 + 0x10], rdi
145b878b1 48ffc3 inc rbx
145b878b4 48899e68060000 mov qword ptr [rsi + 0x668], rbx
145b878bb 488d3d86ea7101 lea rdi, [rip + 0x171ea86]
145b878c2 bb1a000000 mov ebx, 0x1a
145b878c7 ba1a000000 mov edx, 0x1a
145b878cc 4889f9 mov rcx, rdi
145b878cf e8dc21faff call 0x145b29ab0
145b878d4 4885c0 test rax, rax
145b878d7 480f45f8 cmovne rdi, rax
145b878db 480f45da cmovne rbx, rdx
145b878df 48c744242000000000 mov qword ptr [rsp + 0x20], 0
145b878e8 4c8d75d0 lea r14, [rbp - 0x30]
145b878ec 41b908000000 mov r9d, 8
145b878f2 4c89f1 mov rcx, r14
145b878f5 4889fa mov rdx, rdi
145b878f8 4989d8 mov r8, rbx
145b878fb e89025faff call 0x145b29e90
145b87900 488d0566e97101 lea rax, [rip + 0x171e966]
145b87907 48894500 mov qword ptr [rbp], rax
145b8790b 48c7450807000000 mov qword ptr [rbp + 8], 7
145b87913 48c745e800000000 mov qword ptr [rbp - 0x18], 0
145b8791b 48c745f001000000 mov qword ptr [rbp - 0x10], 1
145b87923 48c745f800000000 mov qword ptr [rbp - 8], 0
145b8792b c6451000 mov byte ptr [rbp + 0x10], 0
145b8792f 4889f1 mov rcx, rsi
145b87932 4c89f2 mov rdx, r14
145b87935 e816e60100 call 0x145ba5f50
145b8793a 0f287550 movaps xmm6, xmmword ptr [rbp + 0x50]
145b8793e 0f287d60 movaps xmm7, xmmword ptr [rbp + 0x60]
145b87942 440f284570 movaps xmm8, xmmword ptr [rbp + 0x70]
145b87947 4881c408010000 add rsp, 0x108
145b8794e 5b pop rbx
145b8794f 5f pop rdi
145b87950 5e pop rsi
145b87951 415c pop r12
145b87953 415d pop r13
145b87955 415e pop r14
145b87957 415f pop r15
145b87959 5d pop rbp
145b8795a c3 ret
145b8795b 4c8d4901 lea r9, [rcx + 1]
145b8795f 4939f9 cmp r9, rdi
145b87962 7341 jae 0x145b879a5
145b87964 4c8d47fe lea r8, [rdi - 2]
145b87968 448d1c0f lea r11d, [rdi + rcx]
145b8796c 4989ca mov r10, rcx
145b8796f 41f6c301 test r11b, 1
145b87973 7528 jne 0x145b8799d
145b87975 813afc030000 cmp dword ptr [rdx], 0x3fc
145b8797b 4989ca mov r10, rcx
145b8797e 7419 je 0x145b87999
145b87980 4c8d4aec lea r9, [rdx - 0x14]
145b87984 410f1001 movups xmm0, xmmword ptr [r9]
145b87988 410f104910 movups xmm1, xmmword ptr [r9 + 0x10]
145b8798d 0f114adc movups xmmword ptr [rdx - 0x24], xmm1
145b87991 0f1142cc movups xmmword ptr [rdx - 0x34], xmm0
145b87995 4c8d5101 lea r10, [rcx + 1]
145b87999 4c8d4902 lea r9, [rcx + 2]
145b8799d 4939c8 cmp r8, rcx
145b879a0 4c89d1 mov rcx, r10
145b879a3 752c jne 0x145b879d1
145b879a5 48898eb8030000 mov qword ptr [rsi + 0x3b8], rcx
145b879ac 4889cf mov rdi, rcx
145b879af f30f10b6dc0b0000 movss xmm6, dword ptr [rsi + 0xbdc]
145b879b7 f30f583561c25d00 addss xmm6, dword ptr [rip + 0x5dc261]
145b879bf 483bbea8030000 cmp rdi, qword ptr [rsi + 0x3a8]
145b879c6 0f84cafdffff je 0x145b87796
145b879cc e9d1fdffff jmp 0x145b877a2
145b879d1 4c29cf sub rdi, r9
145b879d4 49c1e105 shl r9, 5
145b879d8 498d1401 lea rdx, [r9 + rax]
145b879dc 4883c234 add rdx, 0x34
145b879e0 4c89d1 mov rcx, r10
145b879e3 eb0a jmp 0x145b879ef
145b879e5 4883c240 add rdx, 0x40
145b879e9 4883c7fe add rdi, -2
145b879ed 74b6 je 0x145b879a5
145b879ef 817ae0fc030000 cmp dword ptr [rdx - 0x20], 0x3fc
145b879f6 750a jne 0x145b87a02
145b879f8 813afc030000 cmp dword ptr [rdx], 0x3fc
145b879fe 74e5 je 0x145b879e5
145b87a00 eb2a jmp 0x145b87a2c
145b87a02 4c8d42cc lea r8, [rdx - 0x34]
145b87a06 4989c9 mov r9, rcx
145b87a09 49c1e105 shl r9, 5
145b87a0d 410f1000 movups xmm0, xmmword ptr [r8]
145b87a11 410f104810 movups xmm1, xmmword ptr [r8 + 0x10]
145b87a16 420f114c0810 movups xmmword ptr [rax + r9 + 0x10], xmm1
145b87a1c 420f110408 movups xmmword ptr [rax + r9], xmm0
145b87a21 48ffc1 inc rcx
145b87a24 813afc030000 cmp dword ptr [rdx], 0x3fc
145b87a2a 74b9 je 0x145b879e5
145b87a2c 4989c8 mov r8, rcx
145b87a2f 49c1e005 shl r8, 5
145b87a33 0f1042ec movups xmm0, xmmword ptr [rdx - 0x14]
145b87a37 0f104afc movups xmm1, xmmword ptr [rdx - 4]
145b87a3b 420f114c0010 movups xmmword ptr [rax + r8 + 0x10], xmm1
145b87a41 420f110400 movups xmmword ptr [rax + r8], xmm0
145b87a46 48ffc1 inc rcx
145b87a49 eb9a jmp 0x145b879e5
145b87a4b 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145b87a54 488d4d18 lea rcx, [rbp + 0x18]
145b87a58 41b801000000 mov r8d, 1
145b87a5e 41b901000000 mov r9d, 1
145b87a64 4889fa mov rdx, rdi
145b87a67 e884cb4000 call 0x145f945f0
145b87a6c 90 nop
145b87a6d 488b4518 mov rax, qword ptr [rbp + 0x18]
145b87a71 e9eafdffff jmp 0x145b87860
145b87a76 b901000000 mov ecx, 1
145b87a7b ba01000000 mov edx, 1
145b87a80 e836375b00 call 0x14613b1bb
145b87a85 0f0b ud2

; remote-snapshot-caller 0x145b7e800..0x145b7e85a
145b7e800 48ffc6 inc rsi
145b7e803 4c89e1 mov rcx, r12
145b7e806 e8259d0200 call 0x145ba8530
145b7e80b 4989b424800b0000 mov qword ptr [r12 + 0xb80], rsi
145b7e813 498b8c24e0020000 mov rcx, qword ptr [r12 + 0x2e0]
145b7e81b 498b9424e8020000 mov rdx, qword ptr [r12 + 0x2e8]
145b7e823 4989f8 mov r8, rdi
145b7e826 4d89e1 mov r9, r12
145b7e829 e8124ffaff call 0x145b23740
145b7e82e 90 nop
145b7e82f 4c89e1 mov rcx, r12
145b7e832 e8199c0000 call 0x145b88450
145b7e837 90 nop
145b7e838 488b9590130000 mov rdx, qword ptr [rbp + 0x1390]
145b7e83f 4c8db290090000 lea r14, [rdx + 0x990]
145b7e846 49c78424800b000000000000 mov qword ptr [r12 + 0xb80], 0
145b7e852 4c89e1 mov rcx, r12
145b7e855 e8d69c0200 call 0x145ba8530

; hud-revive-gates-value 0x145b995d7..0x145b9962e
145b995d7 0fb69e850c0000 movzx ebx, byte ptr [rsi + 0xc85]
145b995de 89d8 mov eax, ebx
145b995e0 3401 xor al, 1
145b995e2 4180fc04 cmp r12b, 4
145b995e6 0f95c1 setne cl
145b995e9 08c1 or cl, al
145b995eb 0f85ba010000 jne 0x145b997ab
145b995f1 80be770c000000 cmp byte ptr [rsi + 0xc77], 0
145b995f8 0f85ad010000 jne 0x145b997ab
145b995fe 80be8b0c000001 cmp byte ptr [rsi + 0xc8b], 1
145b99605 0f85a0010000 jne 0x145b997ab
145b9960b f30f1086680c0000 movss xmm0, dword ptr [rsi + 0xc68]
145b99613 f30f5e0505a85c00 divss xmm0, dword ptr [rip + 0x5ca805]
145b9961b 0f57c9 xorps xmm1, xmm1
145b9961e f30f5fc8 maxss xmm1, xmm0
145b99622 f30f10056aa55c00 movss xmm0, dword ptr [rip + 0x5ca56a]
145b9962a f30f5dc1 minss xmm0, xmm1

; hud-revive-key-consumer 0x145b99651..0x145b99678
145b99651 f30f11442420 movss dword ptr [rsp + 0x20], xmm0
145b99657 4c8d05b1ada401 lea r8, [rip + 0x1a4adb1]
145b9965e 488d8d10020000 lea rcx, [rbp + 0x210]
145b99665 488d9540020000 lea rdx, [rbp + 0x240]
145b9966c 41b906000000 mov r9d, 6
145b99672 e889b3f3ff call 0x145ad4a00
145b99677 90 nop

; addon-revive-gates-value 0x145b7aec6..0x145b7af2a
145b7aec6 80ba850c000000 cmp byte ptr [rdx + 0xc85], 0
145b7aecd 0f8405010000 je 0x145b7afd8
145b7aed3 4889d7 mov rdi, rdx
145b7aed6 440fb6b28a0c0000 movzx r14d, byte ptr [rdx + 0xc8a]
145b7aede 4180fe04 cmp r14b, 4
145b7aee2 0f850c010000 jne 0x145b7aff4
145b7aee8 80bf770c000000 cmp byte ptr [rdi + 0xc77], 0
145b7aeef 0f85ff000000 jne 0x145b7aff4
145b7aef5 80bf8b0c000001 cmp byte ptr [rdi + 0xc8b], 1
145b7aefc 0f85f2000000 jne 0x145b7aff4
145b7af02 f30f1087680c0000 movss xmm0, dword ptr [rdi + 0xc68]
145b7af0a f30f5e050e8f5e00 divss xmm0, dword ptr [rip + 0x5e8f0e]
145b7af12 0f57c9 xorps xmm1, xmm1
145b7af15 f30f5fc8 maxss xmm1, xmm0
145b7af19 f30f1005738c5e00 movss xmm0, dword ptr [rip + 0x5e8c73]
145b7af21 f30f5dc1 minss xmm0, xmm1
145b7af25 f30f1145ec movss dword ptr [rbp - 0x14], xmm0

; remote-recipient-remove-swap-hud 0x145b71740..0x145b71b4b
145b71740 55 push rbp
145b71741 4157 push r15
145b71743 4156 push r14
145b71745 4155 push r13
145b71747 4154 push r12
145b71749 56 push rsi
145b7174a 57 push rdi
145b7174b 53 push rbx
145b7174c b8f8160000 mov eax, 0x16f8
145b71751 e81a1f4200 call 0x145f93670
145b71756 4829c4 sub rsp, rax
145b71759 488dac2480000000 lea rbp, [rsp + 0x80]
145b71761 48c78570160000feffffff mov qword ptr [rbp + 0x1670], 0xfffffffffffffffe
145b7176c 4889d7 mov rdi, rdx
145b7176f 4889ce mov rsi, rcx
145b71772 4d85c0 test r8, r8
145b71775 7413 je 0x145b7178a
145b71777 4c8bb798090000 mov r14, qword ptr [rdi + 0x998]
145b7177e 4d89f4 mov r12, r14
145b71781 4d29c4 sub r12, r8
145b71784 0f83c9000000 jae 0x145b71853
145b7178a 498b19 mov rbx, qword ptr [r9]
145b7178d 488d8d30160000 lea rcx, [rbp + 0x1630]
145b71794 4889fa mov rdx, rdi
145b71797 e8944f0200 call 0x145b96730
145b7179c 90 nop
145b7179d 488d8d18160000 lea rcx, [rbp + 0x1618]
145b717a4 4889fa mov rdx, rdi
145b717a7 e854cc0400 call 0x145bbe400
145b717ac 90 nop
145b717ad 488d8dd8120000 lea rcx, [rbp + 0x12d8]
145b717b4 4889fa mov rdx, rdi
145b717b7 e8d4990100 call 0x145b8b190
145b717bc 90 nop
145b717bd 488d4db0 lea rcx, [rbp - 0x50]
145b717c1 4889fa mov rdx, rdi
145b717c4 4989d8 mov r8, rbx
145b717c7 e834ab0e00 call 0x145c5c300
145b717cc 90 nop
145b717cd 488b8540160000 mov rax, qword ptr [rbp + 0x1640]
145b717d4 48898550090000 mov qword ptr [rbp + 0x950], rax
145b717db 0f108530160000 movups xmm0, xmmword ptr [rbp + 0x1630]
145b717e2 0f298540090000 movaps xmmword ptr [rbp + 0x940], xmm0
145b717e9 0f108518160000 movups xmm0, xmmword ptr [rbp + 0x1618]
145b717f0 0f118558090000 movups xmmword ptr [rbp + 0x958], xmm0
145b717f7 488b8528160000 mov rax, qword ptr [rbp + 0x1628]
145b717fe 48898568090000 mov qword ptr [rbp + 0x968], rax
145b71805 0f1085d8120000 movups xmm0, xmmword ptr [rbp + 0x12d8]
145b7180c 0f298570090000 movaps xmmword ptr [rbp + 0x970], xmm0
145b71813 488b85e8120000 mov rax, qword ptr [rbp + 0x12e8]
145b7181a 48898580090000 mov qword ptr [rbp + 0x980], rax
145b71821 488d8d88090000 lea rcx, [rbp + 0x988]
145b71828 488d55b0 lea rdx, [rbp - 0x50]
145b7182c 41b8f8020000 mov r8d, 0x2f8
145b71832 e8a4294200 call 0x145f941db
145b71837 90 nop
145b71838 4889f9 mov rcx, rdi
145b7183b e8106c0100 call 0x145b88450
145b71840 90 nop
145b71841 488d9540090000 lea rdx, [rbp + 0x940]
145b71848 41b840030000 mov r8d, 0x340
145b7184e e9ac020000 jmp 0x145b71aff
145b71853 4889b558160000 mov qword ptr [rbp + 0x1658], rsi
145b7185a 4c898d48160000 mov qword ptr [rbp + 0x1648], r9
145b71861 4c898550160000 mov qword ptr [rbp + 0x1650], r8
145b71868 498d40ff lea rax, [r8 - 1]
145b7186c 4c39f0 cmp rax, r14
145b7186f 48898560160000 mov qword ptr [rbp + 0x1660], rax
145b71876 0f83b7020000 jae 0x145b71b33
145b7187c 488bb790090000 mov rsi, qword ptr [rdi + 0x990]
145b71883 4869d890090000 imul rbx, rax, 0x990
145b7188a 4c8d2c1e lea r13, [rsi + rbx]
145b7188e 4c8b3c1e mov r15, qword ptr [rsi + rbx]
145b71892 488d141e lea rdx, [rsi + rbx]
145b71896 4883c208 add rdx, 8
145b7189a 488d8d40090000 lea rcx, [rbp + 0x940]
145b718a1 41b888090000 mov r8d, 0x988
145b718a7 e82f294200 call 0x145f941db
145b718ac 488d141e lea rdx, [rsi + rbx]
145b718b0 4881c290090000 add rdx, 0x990
145b718b7 4d69c490090000 imul r8, r12, 0x990
145b718be 4c89e9 mov rcx, r13
145b718c1 e81b294200 call 0x145f941e1
145b718c6 49ffce dec r14
145b718c9 4c89b798090000 mov qword ptr [rdi + 0x998], r14
145b718d0 4983ff02 cmp r15, 2
145b718d4 0f8459020000 je 0x145b71b33
145b718da 4c897db0 mov qword ptr [rbp - 0x50], r15
145b718de 488d4db8 lea rcx, [rbp - 0x48]
145b718e2 488d9540090000 lea rdx, [rbp + 0x940]
145b718e9 41b888090000 mov r8d, 0x988
145b718ef e8e7284200 call 0x145f941db
145b718f4 80bf850c000001 cmp byte ptr [rdi + 0xc85], 1
145b718fb 488bb560160000 mov rsi, qword ptr [rbp + 0x1660]
145b71902 0f85f6000000 jne 0x145b719fe
145b71908 488b87800b0000 mov rax, qword ptr [rdi + 0xb80]
145b7190f 488985d8120000 mov qword ptr [rbp + 0x12d8], rax
145b71916 488d8740060000 lea rax, [rdi + 0x640]
145b7191d 488b8f48060000 mov rcx, qword ptr [rdi + 0x648]
145b71924 488b9750060000 mov rdx, qword ptr [rdi + 0x650]
145b7192b 48c7875006000000000000 mov qword ptr [rdi + 0x650], 0
145b71936 48899558090000 mov qword ptr [rbp + 0x958], rdx
145b7193d 48c1e205 shl rdx, 5
145b71941 4801ca add rdx, rcx
145b71944 48c7856009000000000000 mov qword ptr [rbp + 0x960], 0
145b7194f 48898d40090000 mov qword ptr [rbp + 0x940], rcx
145b71956 48899548090000 mov qword ptr [rbp + 0x948], rdx
145b7195d 48898550090000 mov qword ptr [rbp + 0x950], rax
145b71964 488d8f480a0000 lea rcx, [rdi + 0xa48]
145b7196b 4c8dbdd8120000 lea r15, [rbp + 0x12d8]
145b71972 4c89bd68090000 mov qword ptr [rbp + 0x968], r15
145b71979 c6856f16000001 mov byte ptr [rbp + 0x166f], 1
145b71980 488d9540090000 lea rdx, [rbp + 0x940]
145b71987 e8b4160b00 call 0x145c23040
145b7198c 90 nop
145b7198d 488d8758060000 lea rax, [rdi + 0x658]
145b71994 488b8f60060000 mov rcx, qword ptr [rdi + 0x660]
145b7199b 488b9768060000 mov rdx, qword ptr [rdi + 0x668]
145b719a2 48c7876806000000000000 mov qword ptr [rdi + 0x668], 0
145b719ad 4c8d0452 lea r8, [rdx + rdx*2]
145b719b1 4e8d04c1 lea r8, [rcx + r8*8]
145b719b5 48899558090000 mov qword ptr [rbp + 0x958], rdx
145b719bc 48c7856009000000000000 mov qword ptr [rbp + 0x960], 0
145b719c7 48898d40090000 mov qword ptr [rbp + 0x940], rcx
145b719ce 4c898548090000 mov qword ptr [rbp + 0x948], r8
145b719d5 48898550090000 mov qword ptr [rbp + 0x950], rax
145b719dc 488d8f600a0000 lea rcx, [rdi + 0xa60]
145b719e3 4c89bd68090000 mov qword ptr [rbp + 0x968], r15
145b719ea c6856f16000001 mov byte ptr [rbp + 0x166f], 1
145b719f1 488d9540090000 lea rdx, [rbp + 0x940]
145b719f8 e873150b00 call 0x145c22f70
145b719fd 90 nop
145b719fe 488d55b0 lea rdx, [rbp - 0x50]
145b71a02 4889f9 mov rcx, rdi
145b71a05 e8266b0300 call 0x145ba8530
145b71a0a 488b8550160000 mov rax, qword ptr [rbp + 0x1650]
145b71a11 488987800b0000 mov qword ptr [rdi + 0xb80], rax
145b71a18 488b97e0020000 mov rdx, qword ptr [rdi + 0x2e0]
145b71a1f 4c8b87e8020000 mov r8, qword ptr [rdi + 0x2e8]
145b71a26 c6856f16000001 mov byte ptr [rbp + 0x166f], 1
145b71a2d 48897c2420 mov qword ptr [rsp + 0x20], rdi
145b71a32 488d8dd8120000 lea rcx, [rbp + 0x12d8]
145b71a39 4c8b8d48160000 mov r9, qword ptr [rbp + 0x1648]
145b71a40 e86bfbfaff call 0x145b215b0
145b71a45 90 nop
145b71a46 c6856e16000001 mov byte ptr [rbp + 0x166e], 1
145b71a4d 4889f9 mov rcx, rdi
145b71a50 e8fb690100 call 0x145b88450
145b71a55 90 nop
145b71a56 48c787800b000000000000 mov qword ptr [rdi + 0xb80], 0
145b71a61 4c8d7db0 lea r15, [rbp - 0x50]
145b71a65 4889f9 mov rcx, rdi
145b71a68 4c89fa mov rdx, r15
145b71a6b e8c06a0300 call 0x145ba8530
145b71a70 488d8d40090000 lea rcx, [rbp + 0x940]
145b71a77 41b890090000 mov r8d, 0x990
145b71a7d 4c89fa mov rdx, r15
145b71a80 e856274200 call 0x145f941db
145b71a85 4c8bbf98090000 mov r15, qword ptr [rdi + 0x998]
145b71a8c 4939f7 cmp r15, rsi
145b71a8f 0f8289000000 jb 0x145b71b1e
145b71a95 488d8f88090000 lea rcx, [rdi + 0x988]
145b71a9c 4c3b39 cmp r15, qword ptr [rcx]
145b71a9f 7506 jne 0x145b71aa7
145b71aa1 e86aad5a00 call 0x14611c810
145b71aa6 90 nop
145b71aa7 48039f90090000 add rbx, qword ptr [rdi + 0x990]
145b71aae 4c89f8 mov rax, r15
145b71ab1 4829f0 sub rax, rsi
145b71ab4 7616 jbe 0x145b71acc
145b71ab6 488d8b90090000 lea rcx, [rbx + 0x990]
145b71abd 4c69c090090000 imul r8, rax, 0x990
145b71ac4 4889da mov rdx, rbx
145b71ac7 e815274200 call 0x145f941e1
145b71acc 488d9540090000 lea rdx, [rbp + 0x940]
145b71ad3 41b890090000 mov r8d, 0x990
145b71ad9 4889d9 mov rcx, rbx
145b71adc e8fa264200 call 0x145f941db
145b71ae1 49ffc7 inc r15
145b71ae4 4c89bf98090000 mov qword ptr [rdi + 0x998], r15
145b71aeb 488d95d8120000 lea rdx, [rbp + 0x12d8]
145b71af2 41b840030000 mov r8d, 0x340
145b71af8 488bb558160000 mov rsi, qword ptr [rbp + 0x1658]
145b71aff 4889f1 mov rcx, rsi
145b71b02 e8d4264200 call 0x145f941db
145b71b07 4889f0 mov rax, rsi
145b71b0a 4881c4f8160000 add rsp, 0x16f8
145b71b11 5b pop rbx
145b71b12 5f pop rdi
145b71b13 5e pop rsi
145b71b14 415c pop r12
145b71b16 415d pop r13
145b71b18 415e pop r14
145b71b1a 415f pop r15
145b71b1c 5d pop rbp
145b71b1d c3 ret
145b71b1e 4c8d05cb19a701 lea r8, [rip + 0x1a719cb]
145b71b25 4889f1 mov rcx, rsi
145b71b28 4c89fa mov rdx, r15
145b71b2b e8d4965c00 call 0x14613b204
145b71b30 90 nop
145b71b31 0f0b ud2
145b71b33 4c8d059e19a701 lea r8, [rip + 0x1a7199e]
145b71b3a 488b8d60160000 mov rcx, qword ptr [rbp + 0x1660]
145b71b41 4c89f2 mov rdx, r14
145b71b44 e842975c00 call 0x14613b28b
145b71b49 0f0b ud2

; localized-recipient-hud-call 0x145b216e0..0x145b21731
145b216e0 49898668030000 mov qword ptr [r14 + 0x368], rax
145b216e7 49898e70030000 mov qword ptr [r14 + 0x370], rcx
145b216ee 498b19 mov rbx, qword ptr [r9]
145b216f1 488d8d10060000 lea rcx, [rbp + 0x610]
145b216f8 4889fa mov rdx, rdi
145b216fb e830500700 call 0x145b96730
145b21700 90 nop
145b21701 488d8df8050000 lea rcx, [rbp + 0x5f8]
145b21708 4889fa mov rdx, rdi
145b2170b e8f0cc0900 call 0x145bbe400
145b21710 90 nop
145b21711 488d8de0050000 lea rcx, [rbp + 0x5e0]
145b21718 4889fa mov rdx, rdi
145b2171b e8709a0600 call 0x145b8b190
145b21720 90 nop
145b21721 488d4da8 lea rcx, [rbp - 0x58]
145b21725 4889fa mov rdx, rdi
145b21728 4989d8 mov r8, rbx
145b2172b e8d0ab1300 call 0x145c5c300
145b21730 90 nop
; recipient-revive-timer-swap 0x145ba985a..0x145ba9876
145ba985a f30f1081680c0000 movss xmm0, dword ptr [rcx + 0xc68]
145ba9862 8b8278090000 mov eax, dword ptr [rdx + 0x978]
145ba9868 8981680c0000 mov dword ptr [rcx + 0xc68], eax
145ba986e f30f118278090000 movss dword ptr [rdx + 0x978], xmm0
