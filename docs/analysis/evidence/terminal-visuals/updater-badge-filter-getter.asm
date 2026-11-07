1402ff150 55 push rbp
1402ff151 4156 push r14
1402ff153 56 push rsi
1402ff154 57 push rdi
1402ff155 53 push rbx
1402ff156 4881ece0000000 sub rsp, 0xe0
1402ff15d 488dac2480000000 lea rbp, [rsp + 0x80]
1402ff165 0f297550 movaps xmmword ptr [rbp + 0x50], xmm6
1402ff169 48c74548feffffff mov qword ptr [rbp + 0x48], 0xfffffffffffffffe
1402ff171 4889c8 mov rax, rcx
1402ff174 4883c140 add rcx, 0x40
1402ff178 488d90a8050000 lea rdx, [rax + 0x5a8]
1402ff17f 48894d30 mov qword ptr [rbp + 0x30], rcx
1402ff183 48895538 mov qword ptr [rbp + 0x38], rdx
1402ff187 48c7451800000000 mov qword ptr [rbp + 0x18], 0
1402ff18f 48c7452008000000 mov qword ptr [rbp + 0x20], 8
1402ff197 48c7452800000000 mov qword ptr [rbp + 0x28], 0
1402ff19f 4883787000 cmp qword ptr [rax + 0x70], 0
1402ff1a4 0f849f000000 je 0x1402ff249
1402ff1aa 49b9f1999d566a917702 movabs r9, 0x277916a569d99f1
1402ff1b4 4c8b4058 mov r8, qword ptr [rax + 0x58]
1402ff1b8 4c8b5060 mov r10, qword ptr [rax + 0x60]
1402ff1bc 4531db xor r11d, r11d
1402ff1bf 660f6f05e98aa905 movdqa xmm0, xmmword ptr [rip + 0x5a98ae9]
1402ff1c7 660f76c9 pcmpeqd xmm1, xmm1
1402ff1cb 660f6f154de0ac05 movdqa xmm2, xmmword ptr [rip + 0x5ace04d]
1402ff1d3 4d21d1 and r9, r10
1402ff1d6 f3430f6f1c08 movdqu xmm3, xmmword ptr [r8 + r9]
1402ff1dc 660f6fe3 movdqa xmm4, xmm3
1402ff1e0 660f74e0 pcmpeqb xmm4, xmm0
1402ff1e4 660fd7f4 pmovmskb esi, xmm4
1402ff1e8 85f6 test esi, esi
1402ff1ea 7444 je 0x1402ff230
1402ff1ec f30fbcfe tzcnt edi, esi
1402ff1f0 4c01cf add rdi, r9
1402ff1f3 4c21d7 and rdi, r10
1402ff1f6 48f7df neg rdi
1402ff1f9 488d3c7f lea rdi, [rdi + rdi*2]
1402ff1fd f3410f6f64f8e8 movdqu xmm4, xmmword ptr [r8 + rdi*8 - 0x18]
1402ff204 660f74e2 pcmpeqb xmm4, xmm2
1402ff208 660fd7dc pmovmskb ebx, xmm4
1402ff20c 81fbffff0000 cmp ebx, 0xffff
1402ff212 0f84e5000000 je 0x1402ff2fd
1402ff218 8d7eff lea edi, [rsi - 1]
1402ff21b 6621f7 and di, si
1402ff21e 89fe mov esi, edi
1402ff220 75ca jne 0x1402ff1ec
1402ff222 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1402ff230 660f74d9 pcmpeqb xmm3, xmm1
1402ff234 660fd7f3 pmovmskb esi, xmm3
1402ff238 85f6 test esi, esi
1402ff23a 750d jne 0x1402ff249
1402ff23c 4d01d9 add r9, r11
1402ff23f 4983c110 add r9, 0x10
1402ff243 4983c310 add r11, 0x10
1402ff247 eb8a jmp 0x1402ff1d3
1402ff249 440fb680a0000000 movzx r8d, byte ptr [rax + 0xa0]
1402ff251 4c8b80c0000000 mov r8, qword ptr [rax + 0xc0]
1402ff258 4c8b88c8000000 mov r9, qword ptr [rax + 0xc8]
1402ff25f 49baf1999d566a917702 movabs r10, 0x277916a569d99f1
1402ff269 4531db xor r11d, r11d
1402ff26c 660f6f053c8aa905 movdqa xmm0, xmmword ptr [rip + 0x5a98a3c]
1402ff274 660f76c9 pcmpeqd xmm1, xmm1
1402ff278 660f6f15a0dfac05 movdqa xmm2, xmmword ptr [rip + 0x5acdfa0]
1402ff280 4d21ca and r10, r9
1402ff283 f3430f6f1c10 movdqu xmm3, xmmword ptr [r8 + r10]
1402ff289 660f6fe3 movdqa xmm4, xmm3
1402ff28d 660f74e0 pcmpeqb xmm4, xmm0
1402ff291 660fd7dc pmovmskb ebx, xmm4
1402ff295 85db test ebx, ebx
1402ff297 7447 je 0x1402ff2e0
1402ff299 f30fbcfb tzcnt edi, ebx
1402ff29d 4c01d7 add rdi, r10
1402ff2a0 4c21cf and rdi, r9
1402ff2a3 4989fe mov r14, rdi
1402ff2a6 49c1e607 shl r14, 7
1402ff2aa 4c89c6 mov rsi, r8
1402ff2ad 4c29f6 sub rsi, r14
1402ff2b0 f30f6f6680 movdqu xmm4, xmmword ptr [rsi - 0x80]
1402ff2b5 660f74e2 pcmpeqb xmm4, xmm2
1402ff2b9 66440fd7f4 pmovmskb r14d, xmm4
1402ff2be 4181feffff0000 cmp r14d, 0xffff
1402ff2c5 7454 je 0x1402ff31b
1402ff2c7 8d73ff lea esi, [rbx - 1]
1402ff2ca 6621de and si, bx
1402ff2cd 89f3 mov ebx, esi
1402ff2cf 75c8 jne 0x1402ff299
1402ff2d1 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1402ff2e0 660f74d9 pcmpeqb xmm3, xmm1
1402ff2e4 660fd7f3 pmovmskb esi, xmm3
1402ff2e8 85f6 test esi, esi
1402ff2ea 0f85a1000000 jne 0x1402ff391
1402ff2f0 4d01da add r10, r11
1402ff2f3 4983c210 add r10, 0x10
1402ff2f7 4983c310 add r11, 0x10
1402ff2fb eb83 jmp 0x1402ff280
1402ff2fd 498d04f8 lea rax, [r8 + rdi*8]
1402ff301 488b70f8 mov rsi, qword ptr [rax - 8]
1402ff305 ba08000000 mov edx, 8
1402ff30a 4531c0 xor r8d, r8d
1402ff30d 4989f1 mov r9, rsi
1402ff310 e8db3fb604 call 0x144e632f0
1402ff315 90 nop
1402ff316 e9eb010000 jmp 0x1402ff506
1402ff31b 4c8d57f0 lea r10, [rdi - 0x10]
1402ff31f 4d21ca and r10, r9
1402ff322 f3430f6f0410 movdqu xmm0, xmmword ptr [r8 + r10]
1402ff328 660f76c9 pcmpeqd xmm1, xmm1
1402ff32c 660f74c1 pcmpeqb xmm0, xmm1
1402ff330 66440fd7c8 pmovmskb r9d, xmm0
1402ff335 f3410f6f0438 movdqu xmm0, xmmword ptr [r8 + rdi]
1402ff33b 660f74c1 pcmpeqb xmm0, xmm1
1402ff33f 66440fd7d8 pmovmskb r11d, xmm0
1402ff344 66bb1f00 mov bx, 0x1f
1402ff348 66410fbdd9 bsr bx, r9w
1402ff34d 83f30f xor ebx, 0xf
1402ff350 4181cb00000100 or r11d, 0x10000
1402ff357 f3450fbcdb tzcnt r11d, r11d
1402ff35c 4101db add r11d, ebx
1402ff35f 41b180 mov r9b, 0x80
1402ff362 664183fb0f cmp r11w, 0xf
1402ff367 770a ja 0x1402ff373
1402ff369 48ff80d0000000 inc qword ptr [rax + 0xd0]
1402ff370 41b1ff mov r9b, 0xff
1402ff373 45880c38 mov byte ptr [r8 + rdi], r9b
1402ff377 47884c1010 mov byte ptr [r8 + r10 + 0x10], r9b
1402ff37c 48ff88d8000000 dec qword ptr [rax + 0xd8]
1402ff383 4c8b4690 mov r8, qword ptr [rsi - 0x70]
1402ff387 4983f802 cmp r8, 2
1402ff38b 0f85a6010000 jne 0x1402ff537
1402ff391 4889c7 mov rdi, rax
1402ff394 488b32 mov rsi, qword ptr [rdx]
1402ff397 488d4601 lea rax, [rsi + 1]
1402ff39b 488902 mov qword ptr [rdx], rax
1402ff39e 66c745f80001 mov word ptr [rbp - 8], 0x100
1402ff3a4 48c745a801000000 mov qword ptr [rbp - 0x58], 1
1402ff3ac f30f6f05347aaa05 movdqu xmm0, xmmword ptr [rip + 0x5aa7a34]
1402ff3b4 f30f7f45b0 movdqu xmmword ptr [rbp - 0x50], xmm0
1402ff3b9 48c745d001000000 mov qword ptr [rbp - 0x30], 1
1402ff3c1 48c745d800000000 mov qword ptr [rbp - 0x28], 0
1402ff3c9 48c745f000000000 mov qword ptr [rbp - 0x10], 0
1402ff3d1 c645fa01 mov byte ptr [rbp - 6], 1
1402ff3d5 48c745c000000000 mov qword ptr [rbp - 0x40], 0
1402ff3dd c645e002 mov byte ptr [rbp - 0x20], 2
1402ff3e1 4c8d45a8 lea r8, [rbp - 0x58]
1402ff3e5 4889f2 mov rdx, rsi
1402ff3e8 e8f392d1ff call 0x1400186e0
1402ff3ed 90 nop
1402ff3ee 4889f9 mov rcx, rdi
1402ff3f1 4883c158 add rcx, 0x58
1402ff3f5 488d15745eaf05 lea rdx, [rip + 0x5af5e74]
1402ff3fc 4989f0 mov r8, rsi
1402ff3ff e82c91d1ff call 0x140018530
1402ff404 90 nop
1402ff405 488b7d28 mov rdi, qword ptr [rbp + 0x28]
1402ff409 483b7d18 cmp rdi, qword ptr [rbp + 0x18]
1402ff40d 750a jne 0x1402ff419
1402ff40f 488d4d18 lea rcx, [rbp + 0x18]
1402ff413 e828588f05 call 0x145bf4c40
1402ff418 90 nop
1402ff419 488b4520 mov rax, qword ptr [rbp + 0x20]
1402ff41d 488934f8 mov qword ptr [rax + rdi*8], rsi
1402ff421 48ffc7 inc rdi
1402ff424 48897d28 mov qword ptr [rbp + 0x28], rdi
1402ff428 48c745a800000000 mov qword ptr [rbp - 0x58], 0
1402ff430 48c745b008000000 mov qword ptr [rbp - 0x50], 8
1402ff438 48c745b800000000 mov qword ptr [rbp - 0x48], 0
1402ff440 f30f6f059861af05 movdqu xmm0, xmmword ptr [rip + 0x5af6198]
1402ff448 f30f7f45c0 movdqu xmmword ptr [rbp - 0x40], xmm0
1402ff44d f30f6f0d9b61af05 movdqu xmm1, xmmword ptr [rip + 0x5af619b]
1402ff455 f30f7f4dd0 movdqu xmmword ptr [rbp - 0x30], xmm1
1402ff45a 48c745e000000000 mov qword ptr [rbp - 0x20], 0
1402ff462 48c745e808000000 mov qword ptr [rbp - 0x18], 8
1402ff46a 48c745f000000000 mov qword ptr [rbp - 0x10], 0
1402ff472 f30f7f45f8 movdqu xmmword ptr [rbp - 8], xmm0
1402ff477 f30f7f4d08 movdqu xmmword ptr [rbp + 8], xmm1
1402ff47c 488b4d30 mov rcx, qword ptr [rbp + 0x30]
1402ff480 c6454701 mov byte ptr [rbp + 0x47], 1
1402ff484 4c8d45a8 lea r8, [rbp - 0x58]
1402ff488 4889f2 mov rdx, rsi
1402ff48b e8a0efb304 call 0x144e3e430
1402ff490 90 nop
1402ff491 488b4528 mov rax, qword ptr [rbp + 0x28]
1402ff495 4885c0 test rax, rax
1402ff498 7407 je 0x1402ff4a1
1402ff49a 48ffc8 dec rax
1402ff49d 48894528 mov qword ptr [rbp + 0x28], rax
1402ff4a1 488b4530 mov rax, qword ptr [rbp + 0x30]
1402ff4a5 488b4008 mov rax, qword ptr [rax + 8]
1402ff4a9 4869ce30010000 imul rcx, rsi, 0x130
1402ff4b0 4801c1 add rcx, rax
1402ff4b3 4883c158 add rcx, 0x58
1402ff4b7 48894da0 mov qword ptr [rbp - 0x60], rcx
1402ff4bb e8800bd1ff call 0x140010040
1402ff4c0 90 nop
1402ff4c1 f30f6f45a8 movdqu xmm0, xmmword ptr [rbp - 0x58]
1402ff4c6 f30f6f4db8 movdqu xmm1, xmmword ptr [rbp - 0x48]
1402ff4cb f30f6f55c8 movdqu xmm2, xmmword ptr [rbp - 0x38]
1402ff4d0 f30f6f5dd8 movdqu xmm3, xmmword ptr [rbp - 0x28]
1402ff4d5 f30f6f65e8 movdqu xmm4, xmmword ptr [rbp - 0x18]
1402ff4da 0f106df8 movups xmm5, xmmword ptr [rbp - 8]
1402ff4de 0f107508 movups xmm6, xmmword ptr [rbp + 8]
1402ff4e2 488b45a0 mov rax, qword ptr [rbp - 0x60]
1402ff4e6 0f117060 movups xmmword ptr [rax + 0x60], xmm6
1402ff4ea 0f116850 movups xmmword ptr [rax + 0x50], xmm5
1402ff4ee f30f7f6040 movdqu xmmword ptr [rax + 0x40], xmm4
1402ff4f3 f30f7f5830 movdqu xmmword ptr [rax + 0x30], xmm3
1402ff4f8 f30f7f5020 movdqu xmmword ptr [rax + 0x20], xmm2
1402ff4fd f30f7f4810 movdqu xmmword ptr [rax + 0x10], xmm1
1402ff502 f30f7f00 movdqu xmmword ptr [rax], xmm0
1402ff506 488b5518 mov rdx, qword ptr [rbp + 0x18]
1402ff50a 4885d2 test rdx, rdx
1402ff50d 7413 je 0x1402ff522
1402ff50f 488b4d20 mov rcx, qword ptr [rbp + 0x20]
1402ff513 48c1e203 shl rdx, 3
1402ff517 41b808000000 mov r8d, 8
1402ff51d e8ae2cd0ff call 0x1400021d0
1402ff522 4889f0 mov rax, rsi
1402ff525 0f287550 movaps xmm6, xmmword ptr [rbp + 0x50]
1402ff529 4881c4e0000000 add rsp, 0xe0
1402ff530 5b pop rbx
1402ff531 5f pop rdi
1402ff532 5e pop rsi
1402ff533 415e pop r14
1402ff535 5d pop rbp
1402ff536 c3 ret
1402ff537 488b46f8 mov rax, qword ptr [rsi - 8]
1402ff53b 48894510 mov qword ptr [rbp + 0x10], rax
1402ff53f 0f1046e8 movups xmm0, xmmword ptr [rsi - 0x18]
1402ff543 0f114500 movups xmmword ptr [rbp], xmm0
1402ff547 0f1046d8 movups xmm0, xmmword ptr [rsi - 0x28]
1402ff54b 0f1145f0 movups xmmword ptr [rbp - 0x10], xmm0
1402ff54f f30f6f4698 movdqu xmm0, xmmword ptr [rsi - 0x68]
1402ff554 f30f6f4ea8 movdqu xmm1, xmmword ptr [rsi - 0x58]
1402ff559 f30f6f56b8 movdqu xmm2, xmmword ptr [rsi - 0x48]
1402ff55e f30f6f5ec8 movdqu xmm3, xmmword ptr [rsi - 0x38]
1402ff563 f30f7f5de0 movdqu xmmword ptr [rbp - 0x20], xmm3
1402ff568 f30f7f55d0 movdqu xmmword ptr [rbp - 0x30], xmm2
1402ff56d f30f7f4dc0 movdqu xmmword ptr [rbp - 0x40], xmm1
1402ff572 f30f7f45b0 movdqu xmmword ptr [rbp - 0x50], xmm0
1402ff577 4c8945a8 mov qword ptr [rbp - 0x58], r8
1402ff57b 488d4da8 lea rcx, [rbp - 0x58]
1402ff57f 488d5518 lea rdx, [rbp + 0x18]
1402ff583 e85836b004 call 0x144e02be0
1402ff588 90 nop
1402ff589 4889c6 mov rsi, rax
1402ff58c 488b5518 mov rdx, qword ptr [rbp + 0x18]
1402ff590 4885d2 test rdx, rdx
1402ff593 0f8576ffffff jne 0x1402ff50f
1402ff599 eb87 jmp 0x1402ff522
