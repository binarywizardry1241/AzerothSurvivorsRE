1400e3230 55 push rbp
1400e3231 4157 push r15
1400e3233 4156 push r14
1400e3235 4155 push r13
1400e3237 4154 push r12
1400e3239 56 push rsi
1400e323a 57 push rdi
1400e323b 53 push rbx
1400e323c 4881ece8000000 sub rsp, 0xe8
1400e3243 488dac2480000000 lea rbp, [rsp + 0x80]
1400e324b 0f297550 movaps xmmword ptr [rbp + 0x50], xmm6
1400e324f 48c74548feffffff mov qword ptr [rbp + 0x48], 0xfffffffffffffffe
1400e3257 4889d7 mov rdi, rdx
1400e325a 4889ce mov rsi, rcx
1400e325d 488b4a18 mov rcx, qword ptr [rdx + 0x18]
1400e3261 4883793000 cmp qword ptr [rcx + 0x30], 0
1400e3266 0f849f000000 je 0x1400e330b
1400e326c 48baf1999d566a917702 movabs rdx, 0x277916a569d99f1
1400e3276 488b4118 mov rax, qword ptr [rcx + 0x18]
1400e327a 4c8b4120 mov r8, qword ptr [rcx + 0x20]
1400e327e 4531c9 xor r9d, r9d
1400e3281 660f6f05274acb05 movdqa xmm0, xmmword ptr [rip + 0x5cb4a27]
1400e3289 660f76c9 pcmpeqd xmm1, xmm1
1400e328d 660f6f158b9fce05 movdqa xmm2, xmmword ptr [rip + 0x5ce9f8b]
1400e3295 4c21c2 and rdx, r8
1400e3298 f30f6f1c10 movdqu xmm3, xmmword ptr [rax + rdx]
1400e329d 660f6fe3 movdqa xmm4, xmm3
1400e32a1 660f74e0 pcmpeqb xmm4, xmm0
1400e32a5 66440fd7d4 pmovmskb r10d, xmm4
1400e32aa 4585d2 test r10d, r10d
1400e32ad 7441 je 0x1400e32f0
1400e32af f3450fbcda tzcnt r11d, r10d
1400e32b4 4901d3 add r11, rdx
1400e32b7 4d21c3 and r11, r8
1400e32ba 49f7db neg r11
1400e32bd 4f8d1c5b lea r11, [r11 + r11*2]
1400e32c1 f3420f6f64d8e8 movdqu xmm4, xmmword ptr [rax + r11*8 - 0x18]
1400e32c8 660f74e2 pcmpeqb xmm4, xmm2
1400e32cc 660fd7dc pmovmskb ebx, xmm4
1400e32d0 81fbffff0000 cmp ebx, 0xffff
1400e32d6 0f84e6000000 je 0x1400e33c2
1400e32dc 458d5aff lea r11d, [r10 - 1]
1400e32e0 664521d3 and r11w, r10w
1400e32e4 4589da mov r10d, r11d
1400e32e7 75c6 jne 0x1400e32af
1400e32e9 0f1f8000000000 nop dword ptr [rax]
1400e32f0 660f74d9 pcmpeqb xmm3, xmm1
1400e32f4 66440fd7d3 pmovmskb r10d, xmm3
1400e32f9 4585d2 test r10d, r10d
1400e32fc 750d jne 0x1400e330b
1400e32fe 4c01ca add rdx, r9
1400e3301 4883c210 add rdx, 0x10
1400e3305 4983c110 add r9, 0x10
1400e3309 eb8a jmp 0x1400e3295
1400e330b 0fb64160 movzx eax, byte ptr [rcx + 0x60]
1400e330f 488b8180000000 mov rax, qword ptr [rcx + 0x80]
1400e3316 488b9188000000 mov rdx, qword ptr [rcx + 0x88]
1400e331d 49b8f1999d566a917702 movabs r8, 0x277916a569d99f1
1400e3327 4531c9 xor r9d, r9d
1400e332a 660f6f057e49cb05 movdqa xmm0, xmmword ptr [rip + 0x5cb497e]
1400e3332 660f76c9 pcmpeqd xmm1, xmm1
1400e3336 660f6f15e29ece05 movdqa xmm2, xmmword ptr [rip + 0x5ce9ee2]
1400e333e 4921d0 and r8, rdx
1400e3341 f3420f6f1c00 movdqu xmm3, xmmword ptr [rax + r8]
1400e3347 660f6fe3 movdqa xmm4, xmm3
1400e334b 660f74e0 pcmpeqb xmm4, xmm0
1400e334f 660fd7dc pmovmskb ebx, xmm4
1400e3353 85db test ebx, ebx
1400e3355 7449 je 0x1400e33a0
1400e3357 f3440fbcdb tzcnt r11d, ebx
1400e335c 4d01c3 add r11, r8
1400e335f 4921d3 and r11, rdx
1400e3362 4d89de mov r14, r11
1400e3365 49c1e607 shl r14, 7
1400e3369 4989c2 mov r10, rax
1400e336c 4d29f2 sub r10, r14
1400e336f f3410f6f6280 movdqu xmm4, xmmword ptr [r10 - 0x80]
1400e3375 660f74e2 pcmpeqb xmm4, xmm2
1400e3379 66440fd7f4 pmovmskb r14d, xmm4
1400e337e 4181feffff0000 cmp r14d, 0xffff
1400e3385 7459 je 0x1400e33e0
1400e3387 448d53ff lea r10d, [rbx - 1]
1400e338b 664121da and r10w, bx
1400e338f 4489d3 mov ebx, r10d
1400e3392 75c3 jne 0x1400e3357
1400e3394 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400e33a0 660f74d9 pcmpeqb xmm3, xmm1
1400e33a4 66440fd7d3 pmovmskb r10d, xmm3
1400e33a9 4585d2 test r10d, r10d
1400e33ac 0f85a0000000 jne 0x1400e3452
1400e33b2 4d01c8 add r8, r9
1400e33b5 4983c010 add r8, 0x10
1400e33b9 4983c110 add r9, 0x10
1400e33bd e97cffffff jmp 0x1400e333e
1400e33c2 4a8d04d8 lea rax, [rax + r11*8]
1400e33c6 4c8b48f8 mov r9, qword ptr [rax - 8]
1400e33ca 488b5708 mov rdx, qword ptr [rdi + 8]
1400e33ce 4c8b4710 mov r8, qword ptr [rdi + 0x10]
1400e33d2 4c894d30 mov qword ptr [rbp + 0x30], r9
1400e33d6 e815ffd704 call 0x144e632f0
1400e33db e941020000 jmp 0x1400e3621
1400e33e0 4d8d43f0 lea r8, [r11 - 0x10]
1400e33e4 4921d0 and r8, rdx
1400e33e7 f3420f6f0400 movdqu xmm0, xmmword ptr [rax + r8]
1400e33ed 660f76c9 pcmpeqd xmm1, xmm1
1400e33f1 660f74c1 pcmpeqb xmm0, xmm1
1400e33f5 660fd7d0 pmovmskb edx, xmm0
1400e33f9 f3420f6f0418 movdqu xmm0, xmmword ptr [rax + r11]
1400e33ff 660f74c1 pcmpeqb xmm0, xmm1
1400e3403 66440fd7c8 pmovmskb r9d, xmm0
1400e3408 66bb1f00 mov bx, 0x1f
1400e340c 660fbdda bsr bx, dx
1400e3410 83f30f xor ebx, 0xf
1400e3413 4181c900000100 or r9d, 0x10000
1400e341a f3450fbcc9 tzcnt r9d, r9d
1400e341f 4101d9 add r9d, ebx
1400e3422 b280 mov dl, 0x80
1400e3424 664183f90f cmp r9w, 0xf
1400e3429 7709 ja 0x1400e3434
1400e342b 48ff8190000000 inc qword ptr [rcx + 0x90]
1400e3432 b2ff mov dl, 0xff
1400e3434 42881418 mov byte ptr [rax + r11], dl
1400e3438 4288540010 mov byte ptr [rax + r8 + 0x10], dl
1400e343d 48ff8998000000 dec qword ptr [rcx + 0x98]
1400e3444 498b4290 mov rax, qword ptr [r10 - 0x70]
1400e3448 4883f802 cmp rax, 2
1400e344c 0f8575010000 jne 0x1400e35c7
1400e3452 488b4720 mov rax, qword ptr [rdi + 0x20]
1400e3456 4c8b30 mov r14, qword ptr [rax]
1400e3459 498d5601 lea rdx, [r14 + 1]
1400e345d 488910 mov qword ptr [rax], rdx
1400e3460 66c745100001 mov word ptr [rbp + 0x10], 0x100
1400e3466 48c745c001000000 mov qword ptr [rbp - 0x40], 1
1400e346e 0f10057339cc05 movups xmm0, xmmword ptr [rip + 0x5cc3973]
1400e3475 0f1145c8 movups xmmword ptr [rbp - 0x38], xmm0
1400e3479 48c745e801000000 mov qword ptr [rbp - 0x18], 1
1400e3481 48c745f000000000 mov qword ptr [rbp - 0x10], 0
1400e3489 48c7450800000000 mov qword ptr [rbp + 8], 0
1400e3491 c6451201 mov byte ptr [rbp + 0x12], 1
1400e3495 48c745d800000000 mov qword ptr [rbp - 0x28], 0
1400e349d c645f802 mov byte ptr [rbp - 8], 2
1400e34a1 4c8d45c0 lea r8, [rbp - 0x40]
1400e34a5 4889cb mov rbx, rcx
1400e34a8 4c89f2 mov rdx, r14
1400e34ab e83052f3ff call 0x1400186e0
1400e34b0 4883c318 add rbx, 0x18
1400e34b4 488d157d9fce05 lea rdx, [rip + 0x5ce9f7d]
1400e34bb 4889d9 mov rcx, rbx
1400e34be 4d89f0 mov r8, r14
1400e34c1 e86a50f3ff call 0x140018530
1400e34c6 488b5f10 mov rbx, qword ptr [rdi + 0x10]
1400e34ca 483b1f cmp rbx, qword ptr [rdi]
1400e34cd 7508 jne 0x1400e34d7
1400e34cf 4889f9 mov rcx, rdi
1400e34d2 e86917b105 call 0x145bf4c40
1400e34d7 488b4708 mov rax, qword ptr [rdi + 8]
1400e34db 4c8934d8 mov qword ptr [rax + rbx*8], r14
1400e34df 48ffc3 inc rbx
1400e34e2 48895f10 mov qword ptr [rdi + 0x10], rbx
1400e34e6 48c745c000000000 mov qword ptr [rbp - 0x40], 0
1400e34ee 48c745c808000000 mov qword ptr [rbp - 0x38], 8
1400e34f6 48c745d000000000 mov qword ptr [rbp - 0x30], 0
1400e34fe 0f1005fba1ce05 movups xmm0, xmmword ptr [rip + 0x5cea1fb]
1400e3505 0f1145d8 movups xmmword ptr [rbp - 0x28], xmm0
1400e3509 0f100d00a2ce05 movups xmm1, xmmword ptr [rip + 0x5cea200]
1400e3510 0f114de8 movups xmmword ptr [rbp - 0x18], xmm1
1400e3514 48c745f800000000 mov qword ptr [rbp - 8], 0
1400e351c 48c7450008000000 mov qword ptr [rbp], 8
1400e3524 48c7450800000000 mov qword ptr [rbp + 8], 0
1400e352c 0f114510 movups xmmword ptr [rbp + 0x10], xmm0
1400e3530 0f114d20 movups xmmword ptr [rbp + 0x20], xmm1
1400e3534 488b4f18 mov rcx, qword ptr [rdi + 0x18]
1400e3538 c6454701 mov byte ptr [rbp + 0x47], 1
1400e353c 4c8d45c0 lea r8, [rbp - 0x40]
1400e3540 4c89f2 mov rdx, r14
1400e3543 e8e8aed504 call 0x144e3e430
1400e3548 90 nop
1400e3549 488b4710 mov rax, qword ptr [rdi + 0x10]
1400e354d 4885c0 test rax, rax
1400e3550 7407 je 0x1400e3559
1400e3552 48ffc8 dec rax
1400e3555 48894710 mov qword ptr [rdi + 0x10], rax
1400e3559 488b4718 mov rax, qword ptr [rdi + 0x18]
1400e355d 488b4008 mov rax, qword ptr [rax + 8]
1400e3561 4c89f3 mov rbx, r14
1400e3564 4969ce30010000 imul rcx, r14, 0x130
1400e356b 4801c1 add rcx, rax
1400e356e 4883c158 add rcx, 0x58
1400e3572 48894d38 mov qword ptr [rbp + 0x38], rcx
1400e3576 e8c5caf2ff call 0x140010040
1400e357b 90 nop
1400e357c f30f6f45c0 movdqu xmm0, xmmword ptr [rbp - 0x40]
1400e3581 f30f6f4dd0 movdqu xmm1, xmmword ptr [rbp - 0x30]
1400e3586 f30f6f55e0 movdqu xmm2, xmmword ptr [rbp - 0x20]
1400e358b f30f6f5df0 movdqu xmm3, xmmword ptr [rbp - 0x10]
1400e3590 f30f6f6500 movdqu xmm4, xmmword ptr [rbp]
1400e3595 0f106d10 movups xmm5, xmmword ptr [rbp + 0x10]
1400e3599 0f107520 movups xmm6, xmmword ptr [rbp + 0x20]
1400e359d 488b4538 mov rax, qword ptr [rbp + 0x38]
1400e35a1 0f117060 movups xmmword ptr [rax + 0x60], xmm6
1400e35a5 0f116850 movups xmmword ptr [rax + 0x50], xmm5
1400e35a9 f30f7f6040 movdqu xmmword ptr [rax + 0x40], xmm4
1400e35ae f30f7f5830 movdqu xmmword ptr [rax + 0x30], xmm3
1400e35b3 f30f7f5020 movdqu xmmword ptr [rax + 0x20], xmm2
1400e35b8 f30f7f4810 movdqu xmmword ptr [rax + 0x10], xmm1
1400e35bd f30f7f00 movdqu xmmword ptr [rax], xmm0
1400e35c1 48895d30 mov qword ptr [rbp + 0x30], rbx
1400e35c5 eb5a jmp 0x1400e3621
1400e35c7 498b4af8 mov rcx, qword ptr [r10 - 8]
1400e35cb 48894d28 mov qword ptr [rbp + 0x28], rcx
1400e35cf 410f1042e8 movups xmm0, xmmword ptr [r10 - 0x18]
1400e35d4 0f114518 movups xmmword ptr [rbp + 0x18], xmm0
1400e35d8 410f1042d8 movups xmm0, xmmword ptr [r10 - 0x28]
1400e35dd 0f114508 movups xmmword ptr [rbp + 8], xmm0
1400e35e1 f3410f6f4298 movdqu xmm0, xmmword ptr [r10 - 0x68]
1400e35e7 f3410f6f4aa8 movdqu xmm1, xmmword ptr [r10 - 0x58]
1400e35ed f3410f6f52b8 movdqu xmm2, xmmword ptr [r10 - 0x48]
1400e35f3 f3410f6f5ac8 movdqu xmm3, xmmword ptr [r10 - 0x38]
1400e35f9 f30f7f5df8 movdqu xmmword ptr [rbp - 8], xmm3
1400e35fe f30f7f55e8 movdqu xmmword ptr [rbp - 0x18], xmm2
1400e3603 f30f7f4dd8 movdqu xmmword ptr [rbp - 0x28], xmm1
1400e3608 f30f7f45c8 movdqu xmmword ptr [rbp - 0x38], xmm0
1400e360d 488945c0 mov qword ptr [rbp - 0x40], rax
1400e3611 488d4dc0 lea rcx, [rbp - 0x40]
1400e3615 4889fa mov rdx, rdi
1400e3618 e8c3f5d104 call 0x144e02be0
1400e361d 48894530 mov qword ptr [rbp + 0x30], rax
1400e3621 4889f9 mov rcx, rdi
1400e3624 e80742feff call 0x1400c7830
1400e3629 48894538 mov qword ptr [rbp + 0x38], rax
1400e362d 4889f9 mov rcx, rdi
1400e3630 e8bb472b00 call 0x140397df0
1400e3635 488945a8 mov qword ptr [rbp - 0x58], rax
1400e3639 488955b0 mov qword ptr [rbp - 0x50], rdx
1400e363d 4889f9 mov rcx, rdi
1400e3640 e80b510600 call 0x140148750
1400e3645 4989c5 mov r13, rax
1400e3648 488955b8 mov qword ptr [rbp - 0x48], rdx
1400e364c 4889f9 mov rcx, rdi
1400e364f e88c390600 call 0x140146fe0
1400e3654 4989d6 mov r14, rdx
1400e3657 4889f9 mov rcx, rdi
1400e365a e81103fbff call 0x140093970
1400e365f 48c7868800000001000000 mov qword ptr [rsi + 0x88], 1
1400e366a 4c89b690000000 mov qword ptr [rsi + 0x90], r14
1400e3671 c6869800000001 mov byte ptr [rsi + 0x98], 1
1400e3678 48894678 mov qword ptr [rsi + 0x78], rax
1400e367c 48899680000000 mov qword ptr [rsi + 0x80], rdx
1400e3683 4889f9 mov rcx, rdi
1400e3686 e8955a0600 call 0x140149120
1400e368b 4989c6 mov r14, rax
1400e368e 4989d7 mov r15, rdx
1400e3691 4889f9 mov rcx, rdi
1400e3694 e8f73d0600 call 0x140147490
1400e3699 4989c4 mov r12, rax
1400e369c 4889d3 mov rbx, rdx
1400e369f 4889f9 mov rcx, rdi
1400e36a2 e8c993f7ff call 0x14005ca70
1400e36a7 4c896610 mov qword ptr [rsi + 0x10], r12
1400e36ab 48895e18 mov qword ptr [rsi + 0x18], rbx
1400e36af 4c897620 mov qword ptr [rsi + 0x20], r14
1400e36b3 4c897e28 mov qword ptr [rsi + 0x28], r15
1400e36b7 4c896e30 mov qword ptr [rsi + 0x30], r13
1400e36bb 488b4db8 mov rcx, qword ptr [rbp - 0x48]
1400e36bf 48894e38 mov qword ptr [rsi + 0x38], rcx
1400e36c3 488b4da8 mov rcx, qword ptr [rbp - 0x58]
1400e36c7 48894e40 mov qword ptr [rsi + 0x40], rcx
1400e36cb 488b4db0 mov rcx, qword ptr [rbp - 0x50]
1400e36cf 48894e48 mov qword ptr [rsi + 0x48], rcx
1400e36d3 48c7465001000000 mov qword ptr [rsi + 0x50], 1
1400e36db 488b4d38 mov rcx, qword ptr [rbp + 0x38]
1400e36df 48894e58 mov qword ptr [rsi + 0x58], rcx
1400e36e3 48c7466001000000 mov qword ptr [rsi + 0x60], 1
1400e36eb 488b4d30 mov rcx, qword ptr [rbp + 0x30]
1400e36ef 48894e68 mov qword ptr [rsi + 0x68], rcx
1400e36f3 c6467001 mov byte ptr [rsi + 0x70], 1
1400e36f7 488906 mov qword ptr [rsi], rax
1400e36fa 48895608 mov qword ptr [rsi + 8], rdx
1400e36fe 4889f0 mov rax, rsi
1400e3701 0f287550 movaps xmm6, xmmword ptr [rbp + 0x50]
1400e3705 4881c4e8000000 add rsp, 0xe8
1400e370c 5b pop rbx
1400e370d 5f pop rdi
1400e370e 5e pop rsi
1400e370f 415c pop r12
1400e3711 415d pop r13
1400e3713 415e pop r14
1400e3715 415f pop r15
1400e3717 5d pop rbp
1400e3718 c3 ret
