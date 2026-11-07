1402d0010 55 push rbp
1402d0011 4157 push r15
1402d0013 4156 push r14
1402d0015 4155 push r13
1402d0017 4154 push r12
1402d0019 56 push rsi
1402d001a 57 push rdi
1402d001b 53 push rbx
1402d001c 4881ecc8000000 sub rsp, 0xc8
1402d0023 488dac2480000000 lea rbp, [rsp + 0x80]
1402d002b 0f297530 movaps xmmword ptr [rbp + 0x30], xmm6
1402d002f 48c74528feffffff mov qword ptr [rbp + 0x28], 0xfffffffffffffffe
1402d0037 4889d7 mov rdi, rdx
1402d003a 4889ce mov rsi, rcx
1402d003d 488b4a18 mov rcx, qword ptr [rdx + 0x18]
1402d0041 4883793000 cmp qword ptr [rcx + 0x30], 0
1402d0046 0f849f000000 je 0x1402d00eb
1402d004c 48baa7c6cd2bce7857b4 movabs rdx, 0xb45778ce2bcdc6a7
1402d0056 488b4118 mov rax, qword ptr [rcx + 0x18]
1402d005a 4c8b4120 mov r8, qword ptr [rcx + 0x20]
1402d005e 4531c9 xor r9d, r9d
1402d0061 660f6f05f77dac05 movdqa xmm0, xmmword ptr [rip + 0x5ac7df7]
1402d0069 660f76c9 pcmpeqd xmm1, xmm1
1402d006d 660f6f155b73ac05 movdqa xmm2, xmmword ptr [rip + 0x5ac735b]
1402d0075 4c21c2 and rdx, r8
1402d0078 f30f6f1c10 movdqu xmm3, xmmword ptr [rax + rdx]
1402d007d 660f6fe3 movdqa xmm4, xmm3
1402d0081 660f74e0 pcmpeqb xmm4, xmm0
1402d0085 66440fd7d4 pmovmskb r10d, xmm4
1402d008a 4585d2 test r10d, r10d
1402d008d 7441 je 0x1402d00d0
1402d008f f3450fbcda tzcnt r11d, r10d
1402d0094 4901d3 add r11, rdx
1402d0097 4d21c3 and r11, r8
1402d009a 49f7db neg r11
1402d009d 4f8d1c5b lea r11, [r11 + r11*2]
1402d00a1 f3420f6f64d8e8 movdqu xmm4, xmmword ptr [rax + r11*8 - 0x18]
1402d00a8 660f74e2 pcmpeqb xmm4, xmm2
1402d00ac 660fd7dc pmovmskb ebx, xmm4
1402d00b0 81fbffff0000 cmp ebx, 0xffff
1402d00b6 0f84e6000000 je 0x1402d01a2
1402d00bc 458d5aff lea r11d, [r10 - 1]
1402d00c0 664521d3 and r11w, r10w
1402d00c4 4589da mov r10d, r11d
1402d00c7 75c6 jne 0x1402d008f
1402d00c9 0f1f8000000000 nop dword ptr [rax]
1402d00d0 660f74d9 pcmpeqb xmm3, xmm1
1402d00d4 66440fd7d3 pmovmskb r10d, xmm3
1402d00d9 4585d2 test r10d, r10d
1402d00dc 750d jne 0x1402d00eb
1402d00de 4c01ca add rdx, r9
1402d00e1 4883c210 add rdx, 0x10
1402d00e5 4983c110 add r9, 0x10
1402d00e9 eb8a jmp 0x1402d0075
1402d00eb 0fb64160 movzx eax, byte ptr [rcx + 0x60]
1402d00ef 488b8180000000 mov rax, qword ptr [rcx + 0x80]
1402d00f6 488b9188000000 mov rdx, qword ptr [rcx + 0x88]
1402d00fd 49b8a7c6cd2bce7857b4 movabs r8, 0xb45778ce2bcdc6a7
1402d0107 4531c9 xor r9d, r9d
1402d010a 660f6f054e7dac05 movdqa xmm0, xmmword ptr [rip + 0x5ac7d4e]
1402d0112 660f76c9 pcmpeqd xmm1, xmm1
1402d0116 660f6f15b272ac05 movdqa xmm2, xmmword ptr [rip + 0x5ac72b2]
1402d011e 4921d0 and r8, rdx
1402d0121 f3420f6f1c00 movdqu xmm3, xmmword ptr [rax + r8]
1402d0127 660f6fe3 movdqa xmm4, xmm3
1402d012b 660f74e0 pcmpeqb xmm4, xmm0
1402d012f 660fd7dc pmovmskb ebx, xmm4
1402d0133 85db test ebx, ebx
1402d0135 7449 je 0x1402d0180
1402d0137 f3440fbcdb tzcnt r11d, ebx
1402d013c 4d01c3 add r11, r8
1402d013f 4921d3 and r11, rdx
1402d0142 4d89de mov r14, r11
1402d0145 49c1e607 shl r14, 7
1402d0149 4989c2 mov r10, rax
1402d014c 4d29f2 sub r10, r14
1402d014f f3410f6f6280 movdqu xmm4, xmmword ptr [r10 - 0x80]
1402d0155 660f74e2 pcmpeqb xmm4, xmm2
1402d0159 66440fd7f4 pmovmskb r14d, xmm4
1402d015e 4181feffff0000 cmp r14d, 0xffff
1402d0165 7459 je 0x1402d01c0
1402d0167 448d53ff lea r10d, [rbx - 1]
1402d016b 664121da and r10w, bx
1402d016f 4489d3 mov ebx, r10d
1402d0172 75c3 jne 0x1402d0137
1402d0174 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1402d0180 660f74d9 pcmpeqb xmm3, xmm1
1402d0184 66440fd7d3 pmovmskb r10d, xmm3
1402d0189 4585d2 test r10d, r10d
1402d018c 0f85a0000000 jne 0x1402d0232
1402d0192 4d01c8 add r8, r9
1402d0195 4983c010 add r8, 0x10
1402d0199 4983c110 add r9, 0x10
1402d019d e97cffffff jmp 0x1402d011e
1402d01a2 4a8d04d8 lea rax, [rax + r11*8]
1402d01a6 4c8b48f8 mov r9, qword ptr [rax - 8]
1402d01aa 488b5708 mov rdx, qword ptr [rdi + 8]
1402d01ae 4c8b4710 mov r8, qword ptr [rdi + 0x10]
1402d01b2 4c894d18 mov qword ptr [rbp + 0x18], r9
1402d01b6 e83531b904 call 0x144e632f0
1402d01bb e94c020000 jmp 0x1402d040c
1402d01c0 4d8d43f0 lea r8, [r11 - 0x10]
1402d01c4 4921d0 and r8, rdx
1402d01c7 f3420f6f0400 movdqu xmm0, xmmword ptr [rax + r8]
1402d01cd 660f76c9 pcmpeqd xmm1, xmm1
1402d01d1 660f74c1 pcmpeqb xmm0, xmm1
1402d01d5 660fd7d0 pmovmskb edx, xmm0
1402d01d9 f3420f6f0418 movdqu xmm0, xmmword ptr [rax + r11]
1402d01df 660f74c1 pcmpeqb xmm0, xmm1
1402d01e3 66440fd7c8 pmovmskb r9d, xmm0
1402d01e8 66bb1f00 mov bx, 0x1f
1402d01ec 660fbdda bsr bx, dx
1402d01f0 83f30f xor ebx, 0xf
1402d01f3 4181c900000100 or r9d, 0x10000
1402d01fa f3450fbcc9 tzcnt r9d, r9d
1402d01ff 4101d9 add r9d, ebx
1402d0202 b280 mov dl, 0x80
1402d0204 664183f90f cmp r9w, 0xf
1402d0209 7709 ja 0x1402d0214
1402d020b 48ff8190000000 inc qword ptr [rcx + 0x90]
1402d0212 b2ff mov dl, 0xff
1402d0214 42881418 mov byte ptr [rax + r11], dl
1402d0218 4288540010 mov byte ptr [rax + r8 + 0x10], dl
1402d021d 48ff8998000000 dec qword ptr [rcx + 0x98]
1402d0224 498b4290 mov rax, qword ptr [r10 - 0x70]
1402d0228 4883f802 cmp rax, 2
1402d022c 0f8580010000 jne 0x1402d03b2
1402d0232 488b4720 mov rax, qword ptr [rdi + 0x20]
1402d0236 4c8b38 mov r15, qword ptr [rax]
1402d0239 498d5701 lea rdx, [r15 + 1]
1402d023d 488910 mov qword ptr [rax], rdx
1402d0240 66c745f80001 mov word ptr [rbp - 8], 0x100
1402d0246 48c745a801000000 mov qword ptr [rbp - 0x58], 1
1402d024e 0f10051368ad05 movups xmm0, xmmword ptr [rip + 0x5ad6813]
1402d0255 0f1145b0 movups xmmword ptr [rbp - 0x50], xmm0
1402d0259 48c745d001000000 mov qword ptr [rbp - 0x30], 1
1402d0261 48c745d801000000 mov qword ptr [rbp - 0x28], 1
1402d0269 48c745f000000000 mov qword ptr [rbp - 0x10], 0
1402d0271 c645fa01 mov byte ptr [rbp - 6], 1
1402d0275 48c745c002000000 mov qword ptr [rbp - 0x40], 2
1402d027d 488d056c1fd4ff lea rax, [rip - 0x2be094]
1402d0284 488945c8 mov qword ptr [rbp - 0x38], rax
1402d0288 c645e002 mov byte ptr [rbp - 0x20], 2
1402d028c 4c8d45a8 lea r8, [rbp - 0x58]
1402d0290 4989ce mov r14, rcx
1402d0293 4c89fa mov rdx, r15
1402d0296 e84584d4ff call 0x1400186e0
1402d029b 4983c618 add r14, 0x18
1402d029f 488d15ca28b205 lea rdx, [rip + 0x5b228ca]
1402d02a6 4c89f1 mov rcx, r14
1402d02a9 4d89f8 mov r8, r15
1402d02ac e87f82d4ff call 0x140018530
1402d02b1 488b5f10 mov rbx, qword ptr [rdi + 0x10]
1402d02b5 483b1f cmp rbx, qword ptr [rdi]
1402d02b8 7508 jne 0x1402d02c2
1402d02ba 4889f9 mov rcx, rdi
1402d02bd e87e499205 call 0x145bf4c40
1402d02c2 488b4708 mov rax, qword ptr [rdi + 8]
1402d02c6 4c893cd8 mov qword ptr [rax + rbx*8], r15
1402d02ca 48ffc3 inc rbx
1402d02cd 48895f10 mov qword ptr [rdi + 0x10], rbx
1402d02d1 48c745a800000000 mov qword ptr [rbp - 0x58], 0
1402d02d9 48c745b008000000 mov qword ptr [rbp - 0x50], 8
1402d02e1 48c745b800000000 mov qword ptr [rbp - 0x48], 0
1402d02e9 0f1005602eb205 movups xmm0, xmmword ptr [rip + 0x5b22e60]
1402d02f0 0f1145c0 movups xmmword ptr [rbp - 0x40], xmm0
1402d02f4 0f100d652eb205 movups xmm1, xmmword ptr [rip + 0x5b22e65]
1402d02fb 0f114dd0 movups xmmword ptr [rbp - 0x30], xmm1
1402d02ff 48c745e000000000 mov qword ptr [rbp - 0x20], 0
1402d0307 48c745e808000000 mov qword ptr [rbp - 0x18], 8
1402d030f 48c745f000000000 mov qword ptr [rbp - 0x10], 0
1402d0317 0f1145f8 movups xmmword ptr [rbp - 8], xmm0
1402d031b 0f114d08 movups xmmword ptr [rbp + 8], xmm1
1402d031f 488b4f18 mov rcx, qword ptr [rdi + 0x18]
1402d0323 c6452701 mov byte ptr [rbp + 0x27], 1
1402d0327 4c8d45a8 lea r8, [rbp - 0x58]
1402d032b 4c89fa mov rdx, r15
1402d032e e8fde0b604 call 0x144e3e430
1402d0333 90 nop
1402d0334 488b4710 mov rax, qword ptr [rdi + 0x10]
1402d0338 4885c0 test rax, rax
1402d033b 7407 je 0x1402d0344
1402d033d 48ffc8 dec rax
1402d0340 48894710 mov qword ptr [rdi + 0x10], rax
1402d0344 488b4718 mov rax, qword ptr [rdi + 0x18]
1402d0348 488b4008 mov rax, qword ptr [rax + 8]
1402d034c 4c89fb mov rbx, r15
1402d034f 4969cf30010000 imul rcx, r15, 0x130
1402d0356 4801c1 add rcx, rax
1402d0359 4883c158 add rcx, 0x58
1402d035d 48894d18 mov qword ptr [rbp + 0x18], rcx
1402d0361 e8dafcd3ff call 0x140010040
1402d0366 90 nop
1402d0367 f30f6f45a8 movdqu xmm0, xmmword ptr [rbp - 0x58]
1402d036c f30f6f4db8 movdqu xmm1, xmmword ptr [rbp - 0x48]
1402d0371 f30f6f55c8 movdqu xmm2, xmmword ptr [rbp - 0x38]
1402d0376 f30f6f5dd8 movdqu xmm3, xmmword ptr [rbp - 0x28]
1402d037b f30f6f65e8 movdqu xmm4, xmmword ptr [rbp - 0x18]
1402d0380 0f106df8 movups xmm5, xmmword ptr [rbp - 8]
1402d0384 0f107508 movups xmm6, xmmword ptr [rbp + 8]
1402d0388 488b4518 mov rax, qword ptr [rbp + 0x18]
1402d038c 0f117060 movups xmmword ptr [rax + 0x60], xmm6
1402d0390 0f116850 movups xmmword ptr [rax + 0x50], xmm5
1402d0394 f30f7f6040 movdqu xmmword ptr [rax + 0x40], xmm4
1402d0399 f30f7f5830 movdqu xmmword ptr [rax + 0x30], xmm3
1402d039e f30f7f5020 movdqu xmmword ptr [rax + 0x20], xmm2
1402d03a3 f30f7f4810 movdqu xmmword ptr [rax + 0x10], xmm1
1402d03a8 f30f7f00 movdqu xmmword ptr [rax], xmm0
1402d03ac 48895d18 mov qword ptr [rbp + 0x18], rbx
1402d03b0 eb5a jmp 0x1402d040c
1402d03b2 498b4af8 mov rcx, qword ptr [r10 - 8]
1402d03b6 48894d10 mov qword ptr [rbp + 0x10], rcx
1402d03ba 410f1042e8 movups xmm0, xmmword ptr [r10 - 0x18]
1402d03bf 0f114500 movups xmmword ptr [rbp], xmm0
1402d03c3 410f1042d8 movups xmm0, xmmword ptr [r10 - 0x28]
1402d03c8 0f1145f0 movups xmmword ptr [rbp - 0x10], xmm0
1402d03cc f3410f6f4298 movdqu xmm0, xmmword ptr [r10 - 0x68]
1402d03d2 f3410f6f4aa8 movdqu xmm1, xmmword ptr [r10 - 0x58]
1402d03d8 f3410f6f52b8 movdqu xmm2, xmmword ptr [r10 - 0x48]
1402d03de f3410f6f5ac8 movdqu xmm3, xmmword ptr [r10 - 0x38]
1402d03e4 f30f7f5de0 movdqu xmmword ptr [rbp - 0x20], xmm3
1402d03e9 f30f7f55d0 movdqu xmmword ptr [rbp - 0x30], xmm2
1402d03ee f30f7f4dc0 movdqu xmmword ptr [rbp - 0x40], xmm1
1402d03f3 f30f7f45b0 movdqu xmmword ptr [rbp - 0x50], xmm0
1402d03f8 488945a8 mov qword ptr [rbp - 0x58], rax
1402d03fc 488d4da8 lea rcx, [rbp - 0x58]
1402d0400 4889fa mov rdx, rdi
1402d0403 e8d827b304 call 0x144e02be0
1402d0408 48894518 mov qword ptr [rbp + 0x18], rax
1402d040c 4889f9 mov rcx, rdi
1402d040f e8dc790c00 call 0x140397df0
1402d0414 4989c6 mov r14, rax
1402d0417 4989d7 mov r15, rdx
1402d041a 4889f9 mov rcx, rdi
1402d041d e82e83e7ff call 0x140148750
1402d0422 4989c4 mov r12, rax
1402d0425 4989d5 mov r13, rdx
1402d0428 4889f9 mov rcx, rdi
1402d042b e8b06be7ff call 0x140146fe0
1402d0430 4889d3 mov rbx, rdx
1402d0433 4889f9 mov rcx, rdi
1402d0436 e83535dcff call 0x140093970
1402d043b 48c7465801000000 mov qword ptr [rsi + 0x58], 1
1402d0443 48895e60 mov qword ptr [rsi + 0x60], rbx
1402d0447 c6466801 mov byte ptr [rsi + 0x68], 1
1402d044b 48894648 mov qword ptr [rsi + 0x48], rax
1402d044f 48895650 mov qword ptr [rsi + 0x50], rdx
1402d0453 4889f9 mov rcx, rdi
1402d0456 e8c58ce7ff call 0x140149120
1402d045b 4c896610 mov qword ptr [rsi + 0x10], r12
1402d045f 4c896e18 mov qword ptr [rsi + 0x18], r13
1402d0463 4c897620 mov qword ptr [rsi + 0x20], r14
1402d0467 4c897e28 mov qword ptr [rsi + 0x28], r15
1402d046b 48c7463001000000 mov qword ptr [rsi + 0x30], 1
1402d0473 488b4d18 mov rcx, qword ptr [rbp + 0x18]
1402d0477 48894e38 mov qword ptr [rsi + 0x38], rcx
1402d047b c6464001 mov byte ptr [rsi + 0x40], 1
1402d047f 488906 mov qword ptr [rsi], rax
1402d0482 48895608 mov qword ptr [rsi + 8], rdx
1402d0486 4889f0 mov rax, rsi
1402d0489 0f287530 movaps xmm6, xmmword ptr [rbp + 0x30]
1402d048d 4881c4c8000000 add rsp, 0xc8
1402d0494 5b pop rbx
1402d0495 5f pop rdi
1402d0496 5e pop rsi
1402d0497 415c pop r12
1402d0499 415d pop r13
1402d049b 415e pop r14
1402d049d 415f pop r15
1402d049f 5d pop rbp
1402d04a0 c3 ret
