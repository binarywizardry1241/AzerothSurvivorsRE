145b400f0 55 push rbp
145b400f1 4157 push r15
145b400f3 4156 push r14
145b400f5 4155 push r13
145b400f7 4154 push r12
145b400f9 56 push rsi
145b400fa 57 push rdi
145b400fb 53 push rbx
145b400fc 4881ec88010000 sub rsp, 0x188
145b40103 488dac2480000000 lea rbp, [rsp + 0x80]
145b4010b 0f29b5f0000000 movaps xmmword ptr [rbp + 0xf0], xmm6
145b40112 48c785e8000000feffffff mov qword ptr [rbp + 0xe8], 0xfffffffffffffffe
145b4011d 4c89c3 mov rbx, r8
145b40120 4889d6 mov rsi, rdx
145b40123 48894d48 mov qword ptr [rbp + 0x48], rcx
145b40127 48c785a800000000000000 mov qword ptr [rbp + 0xa8], 0
145b40132 48c785b000000008000000 mov qword ptr [rbp + 0xb0], 8
145b4013d 48c785b800000000000000 mov qword ptr [rbp + 0xb8], 0
145b40148 31c9 xor ecx, ecx
145b4014a e8411b0100 call 0x145b51c90
145b4014f 803800 cmp byte ptr [rax], 0
145b40152 7406 je 0x145b4015a
145b40154 488b4008 mov rax, qword ptr [rax + 8]
145b40158 eb07 jmp 0x145b40161
145b4015a 488b05df709f02 mov rax, qword ptr [rip + 0x29f70df]
145b40161 4883f80d cmp rax, 0xd
145b40165 b90d000000 mov ecx, 0xd
145b4016a 480f42c8 cmovb rcx, rax
145b4016e c1e105 shl ecx, 5
145b40171 488d0598459f02 lea rax, [rip + 0x29f4598]
145b40178 4c8d3408 lea r14, [rax + rcx]
145b4017c 8b440118 mov eax, dword ptr [rcx + rax + 0x18]
145b40180 85c0 test eax, eax
145b40182 0f85200a0000 jne 0x145b40ba8
145b40188 4d8b6608 mov r12, qword ptr [r14 + 8]
145b4018c 4d69761098000000 imul r14, qword ptr [r14 + 0x10], 0x98
145b40194 4d01e6 add r14, r12
145b40197 488b4348 mov rax, qword ptr [rbx + 0x48]
145b4019b 48894508 mov qword ptr [rbp + 8], rax
145b4019f 4883f8ff cmp rax, -1
145b401a3 0f94c0 sete al
145b401a6 488b5368 mov rdx, qword ptr [rbx + 0x68]
145b401aa 488b4b70 mov rcx, qword ptr [rbx + 0x70]
145b401ae 48894d10 mov qword ptr [rbp + 0x10], rcx
145b401b2 488d0c89 lea rcx, [rcx + rcx*4]
145b401b6 48899588000000 mov qword ptr [rbp + 0x88], rdx
145b401bd 488d0cca lea rcx, [rdx + rcx*8]
145b401c1 48898d80000000 mov qword ptr [rbp + 0x80], rcx
145b401c8 0fb68b98000000 movzx ecx, byte ptr [rbx + 0x98]
145b401cf 488b5340 mov rdx, qword ptr [rbx + 0x40]
145b401d3 4189d0 mov r8d, edx
145b401d6 4183e00f and r8d, 0xf
145b401da 49b9f0ffffffffffff1f movabs r9, 0x1ffffffffffffff0
145b401e4 4c21ca and rdx, r9
145b401e7 83bb9400000000 cmp dword ptr [rbx + 0x94], 0
145b401ee 0f9485df000000 sete byte ptr [rbp + 0xdf]
145b401f5 f30f10b388000000 movss xmm6, dword ptr [rbx + 0x88]
145b401fd f30f10054b1b7b01 movss xmm0, dword ptr [rip + 0x17b1b4b]
145b40205 0f2ec6 ucomiss xmm0, xmm6
145b40208 0f9385e0000000 setae byte ptr [rbp + 0xe0]
145b4020f 888de7000000 mov byte ptr [rbp + 0xe7], cl
145b40215 80f101 xor cl, 1
145b40218 08c1 or cl, al
145b4021a 888de1000000 mov byte ptr [rbp + 0xe1], cl
145b40220 488b4328 mov rax, qword ptr [rbx + 0x28]
145b40224 48894558 mov qword ptr [rbp + 0x58], rax
145b40228 488d048500000000 lea rax, [rax*4]
145b40230 488d0440 lea rax, [rax + rax*2]
145b40234 48894500 mov qword ptr [rbp], rax
145b40238 0fb6437c movzx eax, byte ptr [rbx + 0x7c]
145b4023c 0fb68b9a000000 movzx ecx, byte ptr [rbx + 0x9a]
145b40243 888de2000000 mov byte ptr [rbp + 0xe2], cl
145b40249 0fb68b99000000 movzx ecx, byte ptr [rbx + 0x99]
145b40250 888de3000000 mov byte ptr [rbp + 0xe3], cl
145b40256 488b8b80000000 mov rcx, qword ptr [rbx + 0x80]
145b4025d 48894d70 mov qword ptr [rbp + 0x70], rcx
145b40261 488b4b50 mov rcx, qword ptr [rbx + 0x50]
145b40265 48894d60 mov qword ptr [rbp + 0x60], rcx
145b40269 488b4b58 mov rcx, qword ptr [rbx + 0x58]
145b4026d 48894d68 mov qword ptr [rbp + 0x68], rcx
145b40271 8b4b78 mov ecx, dword ptr [rbx + 0x78]
145b40274 898da4000000 mov dword ptr [rbp + 0xa4], ecx
145b4027a 488b4b38 mov rcx, qword ptr [rbx + 0x38]
145b4027e 4c8b4b20 mov r9, qword ptr [rbx + 0x20]
145b40282 4c898dd0000000 mov qword ptr [rbp + 0xd0], r9
145b40289 4c8b4b08 mov r9, qword ptr [rbx + 8]
145b4028d 4c894d30 mov qword ptr [rbp + 0x30], r9
145b40291 4c8b4b10 mov r9, qword ptr [rbx + 0x10]
145b40295 448b9390000000 mov r10d, dword ptr [rbx + 0x90]
145b4029c 4489959c000000 mov dword ptr [rbp + 0x9c], r10d
145b402a3 448b938c000000 mov r10d, dword ptr [rbx + 0x8c]
145b402aa 448995a0000000 mov dword ptr [rbp + 0xa0], r10d
145b402b1 8885e5000000 mov byte ptr [rbp + 0xe5], al
145b402b7 3401 xor al, 1
145b402b9 8885e4000000 mov byte ptr [rbp + 0xe4], al
145b402bf 41c1e002 shl r8d, 2
145b402c3 4c894520 mov qword ptr [rbp + 0x20], r8
145b402c7 49c1e103 shl r9, 3
145b402cb 4c894d38 mov qword ptr [rbp + 0x38], r9
145b402cf 48895518 mov qword ptr [rbp + 0x18], rdx
145b402d3 48894d28 mov qword ptr [rbp + 0x28], rcx
145b402d7 488d0491 lea rax, [rcx + rdx*4]
145b402db 48894540 mov qword ptr [rbp + 0x40], rax
145b402df 4889f7 mov rdi, rsi
145b402e2 488975f0 mov qword ptr [rbp - 0x10], rsi
145b402e6 4c8975f8 mov qword ptr [rbp - 8], r14
145b402ea eb24 jmp 0x145b40310
145b402ec 488b85b0000000 mov rax, qword ptr [rbp + 0xb0]
145b402f3 488b8dc8000000 mov rcx, qword ptr [rbp + 0xc8]
145b402fa 48890cf0 mov qword ptr [rax + rsi*8], rcx
145b402fe 48ffc6 inc rsi
145b40301 4889b5b8000000 mov qword ptr [rbp + 0xb8], rsi
145b40308 4989de mov r14, rbx
145b4030b 0f1f440000 nop dword ptr [rax + rax]
145b40310 4d39f4 cmp r12, r14
145b40313 0f845b080000 je 0x145b40b74
145b40319 4c89e0 mov rax, r12
145b4031c 4981c498000000 add r12, 0x98
145b40323 488985c8000000 mov qword ptr [rbp + 0xc8], rax
145b4032a 440fb65048 movzx r10d, byte ptr [rax + 0x48]
145b4032f 4183fa0a cmp r10d, 0xa
145b40333 73db jae 0x145b40310
145b40335 488b85c8000000 mov rax, qword ptr [rbp + 0xc8]
145b4033c 0fb64849 movzx ecx, byte ptr [rax + 0x49]
145b40340 888de6000000 mov byte ptr [rbp + 0xe6], cl
145b40346 0fb6484a movzx ecx, byte ptr [rax + 0x4a]
145b4034a 888dde000000 mov byte ptr [rbp + 0xde], cl
145b40350 448b484c mov r9d, dword ptr [rax + 0x4c]
145b40354 4c8b5850 mov r11, qword ptr [rax + 0x50]
145b40358 4c8b4058 mov r8, qword ptr [rax + 0x58]
145b4035c 0f104070 movups xmm0, xmmword ptr [rax + 0x70]
145b40360 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
145b40364 f30f6f4060 movdqu xmm0, xmmword ptr [rax + 0x60]
145b40369 660f7f45c0 movdqa xmmword ptr [rbp - 0x40], xmm0
145b4036e 488b9fb8000000 mov rbx, qword ptr [rdi + 0xb8]
145b40375 4885db test rbx, rbx
145b40378 0f84f4000000 je 0x145b40472
145b4037e 488b85c8000000 mov rax, qword ptr [rbp + 0xc8]
145b40385 488b5008 mov rdx, qword ptr [rax + 8]
145b40389 4c8b6810 mov r13, qword ptr [rax + 0x10]
145b4038d 4c8ba7b0000000 mov r12, qword ptr [rdi + 0xb0]
145b40394 4883fb01 cmp rbx, 1
145b40398 4c895de0 mov qword ptr [rbp - 0x20], r11
145b4039c 44898d94000000 mov dword ptr [rbp + 0x94], r9d
145b403a3 4c8945e8 mov qword ptr [rbp - 0x18], r8
145b403a7 44899598000000 mov dword ptr [rbp + 0x98], r10d
145b403ae 7505 jne 0x145b403b5
145b403b0 4531ff xor r15d, r15d
145b403b3 eb60 jmp 0x145b40415
145b403b5 4531ff xor r15d, r15d
145b403b8 0f1f840000000000 nop dword ptr [rax + rax]
145b403c0 4c89bdc0000000 mov qword ptr [rbp + 0xc0], r15
145b403c7 4889de mov rsi, rbx
145b403ca 48d1ee shr rsi, 1
145b403cd 4901f7 add r15, rsi
145b403d0 4b8d047f lea rax, [r15 + r15*2]
145b403d4 498b4cc408 mov rcx, qword ptr [r12 + rax*8 + 8]
145b403d9 4d8b44c410 mov r8, qword ptr [r12 + rax*8 + 0x10]
145b403de 4d89c6 mov r14, r8
145b403e1 4d29ee sub r14, r13
145b403e4 4d0f43c5 cmovae r8, r13
145b403e8 4c89ef mov rdi, r13
145b403eb 4989d5 mov r13, rdx
145b403ee e83eaa4600 call 0x145faae31
145b403f3 4c89ea mov rdx, r13
145b403f6 4989fd mov r13, rdi
145b403f9 4898 cdqe 
145b403fb 85c0 test eax, eax
145b403fd 4c0f45f0 cmovne r14, rax
145b40401 4d85f6 test r14, r14
145b40404 4c0f4fbdc0000000 cmovg r15, qword ptr [rbp + 0xc0]
145b4040c 4829f3 sub rbx, rsi
145b4040f 4883fb01 cmp rbx, 1
145b40413 77ab ja 0x145b403c0
145b40415 4b8d047f lea rax, [r15 + r15*2]
145b40419 498b4cc408 mov rcx, qword ptr [r12 + rax*8 + 8]
145b4041e 498b44c410 mov rax, qword ptr [r12 + rax*8 + 0x10]
145b40423 4889c6 mov rsi, rax
145b40426 4c29ee sub rsi, r13
145b40429 4c0f42e8 cmovb r13, rax
145b4042d 4d89e8 mov r8, r13
145b40430 e8fca94600 call 0x145faae31
145b40435 4898 cdqe 
145b40437 85c0 test eax, eax
145b40439 480f45f0 cmovne rsi, rax
145b4043d 4885f6 test rsi, rsi
145b40440 488b7df0 mov rdi, qword ptr [rbp - 0x10]
145b40444 4c8b75f8 mov r14, qword ptr [rbp - 8]
145b40448 488b85c8000000 mov rax, qword ptr [rbp + 0xc8]
145b4044f 4c8da098000000 lea r12, [rax + 0x98]
145b40456 4c8b5de0 mov r11, qword ptr [rbp - 0x20]
145b4045a 448b8d94000000 mov r9d, dword ptr [rbp + 0x94]
145b40461 4c8b45e8 mov r8, qword ptr [rbp - 0x18]
145b40465 448b9598000000 mov r10d, dword ptr [rbp + 0x98]
145b4046c 0f849efeffff je 0x145b40310
145b40472 4489d0 mov eax, r10d
145b40475 488d0de0c37b01 lea rcx, [rip + 0x17bc3e0]
145b4047c 48630481 movsxd rax, dword ptr [rcx + rax*4]
145b40480 4801c8 add rax, rcx
145b40483 ffe0 jmp rax
145b40485 44398da0000000 cmp dword ptr [rbp + 0xa0], r9d
145b4048c e981010000 jmp 0x145b40612
145b40491 0fb685df000000 movzx eax, byte ptr [rbp + 0xdf]
145b40498 f685e700000001 test byte ptr [rbp + 0xe7], 1
145b4049f 0f846bfeffff je 0x145b40310
145b404a5 e97a020000 jmp 0x145b40724
145b404aa 48837d1000 cmp qword ptr [rbp + 0x10], 0
145b404af 0f94c0 sete al
145b404b2 48837d08ff cmp qword ptr [rbp + 8], -1
145b404b7 0f94c1 sete cl
145b404ba 0fb695e6000000 movzx edx, byte ptr [rbp + 0xe6]
145b404c1 2295e4000000 and dl, byte ptr [rbp + 0xe4]
145b404c7 08c1 or cl, al
145b404c9 08d1 or cl, dl
145b404cb f6c101 test cl, 1
145b404ce 0f853cfeffff jne 0x145b40310
145b404d4 4d85c0 test r8, r8
145b404d7 0f84ae040000 je 0x145b4098b
145b404dd 4589c2 mov r10d, r8d
145b404e0 4183e20f and r10d, 0xf
145b404e4 48b8f0ffffffffffff1f movabs rax, 0x1ffffffffffffff0
145b404ee 4921c0 and r8, rax
145b404f1 4b8d3483 lea rsi, [r11 + r8*4]
145b404f5 41c1e202 shl r10d, 2
145b404f9 4c8bad88000000 mov r13, qword ptr [rbp + 0x88]
145b40500 4c896550 mov qword ptr [rbp + 0x50], r12
145b40504 4889b5c0000000 mov qword ptr [rbp + 0xc0], rsi
145b4050b eb14 jmp 0x145b40521
145b4050d 0f1f00 nop dword ptr [rax]
145b40510 4983c528 add r13, 0x28
145b40514 4c3bad80000000 cmp r13, qword ptr [rbp + 0x80]
145b4051b 0f84effdffff je 0x145b40310
145b40521 45394d18 cmp dword ptr [r13 + 0x18], r9d
145b40525 75e9 jne 0x145b40510
145b40527 4d89f4 mov r12, r14
145b4052a 4989ff mov r15, rdi
145b4052d 4c89d7 mov rdi, r10
145b40530 4d89c6 mov r14, r8
145b40533 4489ce mov esi, r9d
145b40536 4c89db mov rbx, r11
145b40539 498b5508 mov rdx, qword ptr [r13 + 8]
145b4053d 4d8b4510 mov r8, qword ptr [r13 + 0x10]
145b40541 488d4dc0 lea rcx, [rbp - 0x40]
145b40545 e80602ffff call 0x145b30750
145b4054a 90 nop 
145b4054b 84c0 test al, al
145b4054d 4989db mov r11, rbx
145b40550 4189f1 mov r9d, esi
145b40553 4d89f0 mov r8, r14
145b40556 4989fa mov r10, rdi
145b40559 4c89ff mov rdi, r15
145b4055c 4d89e6 mov r14, r12
145b4055f 4c8b6550 mov r12, qword ptr [rbp + 0x50]
145b40563 488bb5c0000000 mov rsi, qword ptr [rbp + 0xc0]
145b4056a 74a4 je 0x145b40510
145b4056c 41807d2102 cmp byte ptr [r13 + 0x21], 2
145b40571 749d je 0x145b40510
145b40573 418b451c mov eax, dword ptr [r13 + 0x1c]
145b40577 660f6ec0 movd xmm0, eax
145b4057b 660f70c000 pshufd xmm0, xmm0, 0
145b40580 31c9 xor ecx, ecx
145b40582 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b40590 4939c8 cmp r8, rcx
145b40593 7448 je 0x145b405dd
145b40595 f3410f6f0c8b movdqu xmm1, xmmword ptr [r11 + rcx*4]
145b4059b f3410f6f548b10 movdqu xmm2, xmmword ptr [r11 + rcx*4 + 0x10]
145b405a2 f3410f6f5c8b20 movdqu xmm3, xmmword ptr [r11 + rcx*4 + 0x20]
145b405a9 f3410f6f648b30 movdqu xmm4, xmmword ptr [r11 + rcx*4 + 0x30]
145b405b0 660f76d0 pcmpeqd xmm2, xmm0
145b405b4 660f76c8 pcmpeqd xmm1, xmm0
145b405b8 660f6bca packssdw xmm1, xmm2
145b405bc 660f76d8 pcmpeqd xmm3, xmm0
145b405c0 660f76e0 pcmpeqd xmm4, xmm0
145b405c4 660f6bdc packssdw xmm3, xmm4
145b405c8 660f63cb packsswb xmm1, xmm3
145b405cc 660fd7d1 pmovmskb edx, xmm1
145b405d0 4883c110 add rcx, 0x10
145b405d4 85d2 test edx, edx
145b405d6 74b8 je 0x145b40590
145b405d8 e94f010000 jmp 0x145b4072c
145b405dd 31c9 xor ecx, ecx
145b405df 90 nop 
145b405e0 4939ca cmp r10, rcx
145b405e3 0f8427ffffff je 0x145b40510
145b405e9 39040e cmp dword ptr [rsi + rcx], eax
145b405ec 488d4904 lea rcx, [rcx + 4]
145b405f0 75ee jne 0x145b405e0
145b405f2 e935010000 jmp 0x145b4072c
145b405f7 f685e700000001 test byte ptr [rbp + 0xe7], 1
145b405fe 0f840cfdffff je 0x145b40310
145b40604 4489c8 mov eax, r9d
145b40607 0f57c0 xorps xmm0, xmm0
145b4060a f3480f2ac0 cvtsi2ss xmm0, rax
145b4060f 0f2ef0 ucomiss xmm6, xmm0
145b40612 0f93c0 setae al
145b40615 84c0 test al, al
145b40617 0f84f3fcffff je 0x145b40310
145b4061d e90a010000 jmp 0x145b4072c
145b40622 0fb685e3000000 movzx eax, byte ptr [rbp + 0xe3]
145b40629 f685e700000001 test byte ptr [rbp + 0xe7], 1
145b40630 0f84dafcffff je 0x145b40310
145b40636 e9e9000000 jmp 0x145b40724
145b4063b 4489ce mov esi, r9d
145b4063e 4180fb07 cmp r11b, 7
145b40642 488b5518 mov rdx, qword ptr [rbp + 0x18]
145b40646 4c8b4520 mov r8, qword ptr [rbp + 0x20]
145b4064a 4c8b4d28 mov r9, qword ptr [rbp + 0x28]
145b4064e 4c8b5540 mov r10, qword ptr [rbp + 0x40]
145b40652 0f85fc010000 jne 0x145b40854
145b40658 660f6ec6 movd xmm0, esi
145b4065c 660f70c000 pshufd xmm0, xmm0, 0
145b40661 31c0 xor eax, eax
145b40663 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b40670 4839c2 cmp rdx, rax
145b40673 0f84bb010000 je 0x145b40834
145b40679 f3410f6f0c81 movdqu xmm1, xmmword ptr [r9 + rax*4]
145b4067f f3410f6f548110 movdqu xmm2, xmmword ptr [r9 + rax*4 + 0x10]
145b40686 f3410f6f5c8120 movdqu xmm3, xmmword ptr [r9 + rax*4 + 0x20]
145b4068d f3410f6f648130 movdqu xmm4, xmmword ptr [r9 + rax*4 + 0x30]
145b40694 660f76d0 pcmpeqd xmm2, xmm0
145b40698 660f76c8 pcmpeqd xmm1, xmm0
145b4069c 660f6bca packssdw xmm1, xmm2
145b406a0 660f76d8 pcmpeqd xmm3, xmm0
145b406a4 660f76e0 pcmpeqd xmm4, xmm0
145b406a8 660f6bdc packssdw xmm3, xmm4
145b406ac 660f63cb packsswb xmm1, xmm3
145b406b0 660fd7c9 pmovmskb ecx, xmm1
145b406b4 4883c010 add rax, 0x10
145b406b8 85c9 test ecx, ecx
145b406ba 74b4 je 0x145b40670
145b406bc e94ffcffff jmp 0x145b40310
145b406c1 0fb685e0000000 movzx eax, byte ptr [rbp + 0xe0]
145b406c8 83bd9c00000003 cmp dword ptr [rbp + 0x9c], 3
145b406cf 0f863bfcffff jbe 0x145b40310
145b406d5 eb4d jmp 0x145b40724
145b406d7 0fb685e2000000 movzx eax, byte ptr [rbp + 0xe2]
145b406de f685e700000001 test byte ptr [rbp + 0xe7], 1
145b406e5 0f8425fcffff je 0x145b40310
145b406eb eb37 jmp 0x145b40724
145b406ed 488b4d38 mov rcx, qword ptr [rbp + 0x38]
145b406f1 488b5530 mov rdx, qword ptr [rbp + 0x30]
145b406f5 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b40700 4889c8 mov rax, rcx
145b40703 4885c9 test rcx, rcx
145b40706 7416 je 0x145b4071e
145b40708 4989d0 mov r8, rdx
145b4070b 4883c208 add rdx, 8
145b4070f 488d48f8 lea rcx, [rax - 8]
145b40713 453908 cmp dword ptr [r8], r9d
145b40716 75e8 jne 0x145b40700
145b40718 45395804 cmp dword ptr [r8 + 4], r11d
145b4071c 75e2 jne 0x145b40700
145b4071e 4885c0 test rax, rax
145b40721 0f95c0 setne al
145b40724 84c0 test al, al
145b40726 0f84e4fbffff je 0x145b40310
145b4072c 4c89f3 mov rbx, r14
145b4072f 488b85c8000000 mov rax, qword ptr [rbp + 0xc8]
145b40736 4c8b7008 mov r14, qword ptr [rax + 8]
145b4073a 4c8b6810 mov r13, qword ptr [rax + 0x10]
145b4073e e8ad7f4100 call 0x145f586f0
145b40743 90 nop 
145b40744 894578 mov dword ptr [rbp + 0x78], eax
145b40747 89557c mov dword ptr [rbp + 0x7c], edx
145b4074a 488d4da8 lea rcx, [rbp - 0x58]
145b4074e 488d5578 lea rdx, [rbp + 0x78]
145b40752 41b800803ed5 mov r8d, 0xd53e8000
145b40758 41b9deb19d01 mov r9d, 0x19db1de
145b4075e e83d7f4100 call 0x145f586a0
145b40763 90 nop 
145b40764 807da800 cmp byte ptr [rbp - 0x58], 0
145b40768 7506 jne 0x145b40770
145b4076a 488b45b0 mov rax, qword ptr [rbp - 0x50]
145b4076e eb02 jmp 0x145b40772
145b40770 31c0 xor eax, eax
145b40772 4889f9 mov rcx, rdi
145b40775 4889442420 mov qword ptr [rsp + 0x20], rax
145b4077a 41b901000000 mov r9d, 1
145b40780 4c89f2 mov rdx, r14
145b40783 4d89e8 mov r8, r13
145b40786 e8a59bf4ff call 0x145a8a330
145b4078b 90 nop 
145b4078c 488bb5b8000000 mov rsi, qword ptr [rbp + 0xb8]
145b40793 483bb5a8000000 cmp rsi, qword ptr [rbp + 0xa8]
145b4079a 0f854cfbffff jne 0x145b402ec
145b407a0 488d8da8000000 lea rcx, [rbp + 0xa8]
145b407a7 e814ac4600 call 0x145fab3c0
145b407ac 90 nop 
145b407ad e93afbffff jmp 0x145b402ec
145b407b2 f685e100000001 test byte ptr [rbp + 0xe1], 1
145b407b9 0f8551fbffff jne 0x145b40310
145b407bf 4d85db test r11, r11
145b407c2 0f8459030000 je 0x145b40b21
145b407c8 498d40fe lea rax, [r8 - 2]
145b407cc 4883f806 cmp rax, 6
145b407d0 0f873afbffff ja 0x145b40310
145b407d6 488d0da7c07b01 lea rcx, [rip + 0x17bc0a7]
145b407dd 48630481 movsxd rax, dword ptr [rcx + rax*4]
145b407e1 4801c8 add rax, rcx
145b407e4 ffe0 jmp rax
145b407e6 0fb7054caf7601 movzx eax, word ptr [rip + 0x176af4c]
145b407ed 66413b03 cmp ax, word ptr [r11]
145b407f1 0f8402030000 je 0x145b40af9
145b407f7 0fb705dadb7601 movzx eax, word ptr [rip + 0x176dbda]
145b407fe 66413b03 cmp ax, word ptr [r11]
145b40802 0f8403030000 je 0x145b40b0b
145b40808 0fb70583ec7601 movzx eax, word ptr [rip + 0x176ec83]
145b4080f 66413b03 cmp ax, word ptr [r11]
145b40813 0f84f9020000 je 0x145b40b12
145b40819 0fb7053f0e7701 movzx eax, word ptr [rip + 0x1770e3f]
145b40820 66413b03 cmp ax, word ptr [r11]
145b40824 0f85a1020000 jne 0x145b40acb
145b4082a b80a000000 mov eax, 0xa
145b4082f e9e3020000 jmp 0x145b40b17
145b40834 31c0 xor eax, eax
145b40836 662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b40840 4939c0 cmp r8, rax
145b40843 740f je 0x145b40854
145b40845 41393402 cmp dword ptr [r10 + rax], esi
145b40849 488d4004 lea rax, [rax + 4]
145b4084d 75f1 jne 0x145b40840
145b4084f e9bcfaffff jmp 0x145b40310
145b40854 48837d5800 cmp qword ptr [rbp + 0x58], 0
145b40859 0f84b1faffff je 0x145b40310
145b4085f 4189f2 mov r10d, esi
145b40862 4489d8 mov eax, r11d
145b40865 c1e808 shr eax, 8
145b40868 4c89d9 mov rcx, r11
145b4086b 48c1e920 shr rcx, 0x20
145b4086f 31d2 xor edx, edx
145b40871 eb2b jmp 0x145b4089e
145b40873 4c8b85d0000000 mov r8, qword ptr [rbp + 0xd0]
145b4087a 4138441008 cmp byte ptr [r8 + rdx + 8], al
145b4087f 0f84a7feffff je 0x145b4072c
145b40885 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b40890 4883c20c add rdx, 0xc
145b40894 48395500 cmp qword ptr [rbp], rdx
145b40898 0f8472faffff je 0x145b40310
145b4089e 4c8b85d0000000 mov r8, qword ptr [rbp + 0xd0]
145b408a5 45391410 cmp dword ptr [r8 + rdx], r10d
145b408a9 75e5 jne 0x145b40890
145b408ab 4c8b85d0000000 mov r8, qword ptr [rbp + 0xd0]
145b408b2 450fb6441009 movzx r8d, byte ptr [r8 + rdx + 9]
145b408b8 450fb6cb movzx r9d, r11b
145b408bc 4c8d15ddbf7b01 lea r10, [rip + 0x17bbfdd]
145b408c3 4f630c8a movsxd r9, dword ptr [r10 + r9*4]
145b408c7 4d01d1 add r9, r10
145b408ca 4189f2 mov r10d, esi
145b408cd 41ffe1 jmp r9
145b408d0 4180f802 cmp r8b, 2
145b408d4 74ba je 0x145b40890
145b408d6 4c8b85d0000000 mov r8, qword ptr [rbp + 0xd0]
145b408dd 41394c1004 cmp dword ptr [r8 + rdx + 4], ecx
145b408e2 75ac jne 0x145b40890
145b408e4 e943feffff jmp 0x145b4072c
145b408e9 4180f802 cmp r8b, 2
145b408ed 75a1 jne 0x145b40890
145b408ef e938feffff jmp 0x145b4072c
145b408f4 4180f802 cmp r8b, 2
145b408f8 7496 je 0x145b40890
145b408fa 4c8b85d0000000 mov r8, qword ptr [rbp + 0xd0]
145b40901 41837c100400 cmp dword ptr [r8 + rdx + 4], 0
145b40907 0f8566ffffff jne 0x145b40873
145b4090d eb81 jmp 0x145b40890
145b4090f 4180f801 cmp r8b, 1
145b40913 0f8577ffffff jne 0x145b40890
145b40919 4c8b85d0000000 mov r8, qword ptr [rbp + 0xd0]
145b40920 41807c100800 cmp byte ptr [r8 + rdx + 8], 0
145b40926 0f8564ffffff jne 0x145b40890
145b4092c e9fbfdffff jmp 0x145b4072c
145b40931 4c8b85d0000000 mov r8, qword ptr [rbp + 0xd0]
145b40938 41807c100a00 cmp byte ptr [r8 + rdx + 0xa], 0
145b4093e 0f844cffffff je 0x145b40890
145b40944 e9e3fdffff jmp 0x145b4072c
145b40949 4180f802 cmp r8b, 2
145b4094d 0f843dffffff je 0x145b40890
145b40953 4c8b85d0000000 mov r8, qword ptr [rbp + 0xd0]
145b4095a 458b441004 mov r8d, dword ptr [r8 + rdx + 4]
145b4095f 4181f844010000 cmp r8d, 0x144
145b40966 0f84c0fdffff je 0x145b4072c
145b4096c 4181f8d3010000 cmp r8d, 0x1d3
145b40973 0f84b3fdffff je 0x145b4072c
145b40979 4181f8bd510000 cmp r8d, 0x51bd
145b40980 0f850affffff jne 0x145b40890
145b40986 e9a1fdffff jmp 0x145b4072c
145b4098b 488bb588000000 mov rsi, qword ptr [rbp + 0x88]
145b40992 eb1d jmp 0x145b409b1
145b40994 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b409a0 4883c628 add rsi, 0x28
145b409a4 483bb580000000 cmp rsi, qword ptr [rbp + 0x80]
145b409ab 0f845ff9ffff je 0x145b40310
145b409b1 44394e18 cmp dword ptr [rsi + 0x18], r9d
145b409b5 75e9 jne 0x145b409a0
145b409b7 4489cb mov ebx, r9d
145b409ba 488b5608 mov rdx, qword ptr [rsi + 8]
145b409be 4c8b4610 mov r8, qword ptr [rsi + 0x10]
145b409c2 488d4dc0 lea rcx, [rbp - 0x40]
145b409c6 e885fdfeff call 0x145b30750
145b409cb 90 nop 
145b409cc 84c0 test al, al
145b409ce 4189d9 mov r9d, ebx
145b409d1 74cd je 0x145b409a0
145b409d3 e954fdffff jmp 0x145b4072c
145b409d8 0fb705df907601 movzx eax, word ptr [rip + 0x17690df]
145b409df 66413303 xor ax, word ptr [r11]
145b409e3 0fb60dd6907601 movzx ecx, byte ptr [rip + 0x17690d6]
145b409ea 41324b02 xor cl, byte ptr [r11 + 2]
145b409ee 0fb6c9 movzx ecx, cl
145b409f1 6609c1 or cx, ax
145b409f4 0f84f8000000 je 0x145b40af2
145b409fa 0fb70560f97601 movzx eax, word ptr [rip + 0x176f960]
145b40a01 66413303 xor ax, word ptr [r11]
145b40a05 0fb60d57f97601 movzx ecx, byte ptr [rip + 0x176f957]
145b40a0c 41324b02 xor cl, byte ptr [r11 + 2]
145b40a10 0fb6c9 movzx ecx, cl
145b40a13 6609c1 or cx, ax
145b40a16 0f85af000000 jne 0x145b40acb
145b40a1c b809000000 mov eax, 9
145b40a21 e9f1000000 jmp 0x145b40b17
145b40a26 8b05c4717601 mov eax, dword ptr [rip + 0x17671c4]
145b40a2c 413303 xor eax, dword ptr [r11]
145b40a2f 0fb70dbe717601 movzx ecx, word ptr [rip + 0x17671be]
145b40a36 6641334b04 xor cx, word ptr [r11 + 4]
145b40a3b 0fb7c9 movzx ecx, cx
145b40a3e 09c1 or ecx, eax
145b40a40 0f84ba000000 je 0x145b40b00
145b40a46 8b05939e7601 mov eax, dword ptr [rip + 0x1769e93]
145b40a4c 413303 xor eax, dword ptr [r11]
145b40a4f 0fb70d8d9e7601 movzx ecx, word ptr [rip + 0x1769e8d]
145b40a56 6641334b04 xor cx, word ptr [r11 + 4]
145b40a5b 0fb7c9 movzx ecx, cx
145b40a5e 09c1 or ecx, eax
145b40a60 751a jne 0x145b40a7c
145b40a62 b803000000 mov eax, 3
145b40a67 e9ab000000 jmp 0x145b40b17
145b40a6c 488b0500827601 mov rax, qword ptr [rip + 0x1768200]
145b40a73 493b03 cmp rax, qword ptr [r11]
145b40a76 0f8488000000 je 0x145b40b04
145b40a7c 4983f804 cmp r8, 4
145b40a80 7453 je 0x145b40ad5
145b40a82 4983f805 cmp r8, 5
145b40a86 7428 je 0x145b40ab0
145b40a88 4983f807 cmp r8, 7
145b40a8c 0f857ef8ffff jne 0x145b40310
145b40a92 8b05e8ba7601 mov eax, dword ptr [rip + 0x176bae8]
145b40a98 413303 xor eax, dword ptr [r11]
145b40a9b 8b0de2ba7601 mov ecx, dword ptr [rip + 0x176bae2]
145b40aa1 41334b03 xor ecx, dword ptr [r11 + 3]
145b40aa5 09c1 or ecx, eax
145b40aa7 7522 jne 0x145b40acb
145b40aa9 b805000000 mov eax, 5
145b40aae eb67 jmp 0x145b40b17
145b40ab0 8b05e8c97601 mov eax, dword ptr [rip + 0x176c9e8]
145b40ab6 413303 xor eax, dword ptr [r11]
145b40ab9 0fb60de2c97601 movzx ecx, byte ptr [rip + 0x176c9e2]
145b40ac0 41324b04 xor cl, byte ptr [r11 + 4]
145b40ac4 0fb6c9 movzx ecx, cl
145b40ac7 09c1 or ecx, eax
145b40ac9 7420 je 0x145b40aeb
145b40acb 4983f804 cmp r8, 4
145b40acf 0f853bf8ffff jne 0x145b40310
145b40ad5 8b05171a7701 mov eax, dword ptr [rip + 0x1771a17]
145b40adb 413b03 cmp eax, dword ptr [r11]
145b40ade 0f852cf8ffff jne 0x145b40310
145b40ae4 b80b000000 mov eax, 0xb
145b40ae9 eb2c jmp 0x145b40b17
145b40aeb b806000000 mov eax, 6
145b40af0 eb25 jmp 0x145b40b17
145b40af2 b802000000 mov eax, 2
145b40af7 eb1e jmp 0x145b40b17
145b40af9 b804000000 mov eax, 4
145b40afe eb17 jmp 0x145b40b17
145b40b00 31c0 xor eax, eax
145b40b02 eb13 jmp 0x145b40b17
145b40b04 b801000000 mov eax, 1
145b40b09 eb0c jmp 0x145b40b17
145b40b0b b807000000 mov eax, 7
145b40b10 eb05 jmp 0x145b40b17
145b40b12 b808000000 mov eax, 8
145b40b17 483b4570 cmp rax, qword ptr [rbp + 0x70]
145b40b1b 0f85eff7ffff jne 0x145b40310
145b40b21 488d4dc0 lea rcx, [rbp - 0x40]
145b40b25 488b5560 mov rdx, qword ptr [rbp + 0x60]
145b40b29 4c8b4568 mov r8, qword ptr [rbp + 0x68]
145b40b2d e81efcfeff call 0x145b30750
145b40b32 90 nop 
145b40b33 83bda400000000 cmp dword ptr [rbp + 0xa4], 0
145b40b3a 0f95c1 setne cl
145b40b3d 84c0 test al, al
145b40b3f 0f84cbf7ffff je 0x145b40310
145b40b45 208de6000000 and byte ptr [rbp + 0xe6], cl
145b40b4b 0f85bff7ffff jne 0x145b40310
145b40b51 0fb685e5000000 movzx eax, byte ptr [rbp + 0xe5]
145b40b58 f685de00000001 test byte ptr [rbp + 0xde], 1
145b40b5f b901000000 mov ecx, 1
145b40b64 0f44c1 cmove eax, ecx
145b40b67 84c0 test al, al
145b40b69 0f84a1f7ffff je 0x145b40310
145b40b6f e9b8fbffff jmp 0x145b4072c
145b40b74 488b8db8000000 mov rcx, qword ptr [rbp + 0xb8]
145b40b7b 488b4548 mov rax, qword ptr [rbp + 0x48]
145b40b7f 48894810 mov qword ptr [rax + 0x10], rcx
145b40b83 0f1085a8000000 movups xmm0, xmmword ptr [rbp + 0xa8]
145b40b8a 0f1100 movups xmmword ptr [rax], xmm0
145b40b8d 0f28b5f0000000 movaps xmm6, xmmword ptr [rbp + 0xf0]
145b40b94 4881c488010000 add rsp, 0x188
145b40b9b 5b pop rbx
145b40b9c 5f pop rdi
145b40b9d 5e pop rsi
145b40b9e 415c pop r12
145b40ba0 415d pop r13
145b40ba2 415e pop r14
145b40ba4 415f pop r15
145b40ba6 5d pop rbp
145b40ba7 c3 ret 
145b40ba8 4c89f1 mov rcx, r14
145b40bab e80c085f00 call 0x1461313bc
145b40bb0 90 nop 
145b40bb1 e9d2f5ffff jmp 0x145b40188
