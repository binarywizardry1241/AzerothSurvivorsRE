14594e2e0: 55 push rbp
14594e2e1: 4157 push r15
14594e2e3: 4156 push r14
14594e2e5: 56 push rsi
14594e2e6: 57 push rdi
14594e2e7: 53 push rbx
14594e2e8: 4881ec48020000 sub rsp, 0x248
14594e2ef: 488dac2480000000 lea rbp, [rsp + 0x80]
14594e2f7: 0f29bdb0010000 movaps xmmword ptr [rbp + 0x1b0], xmm7
14594e2fe: 0f29b5a0010000 movaps xmmword ptr [rbp + 0x1a0], xmm6
14594e305: 48c78598010000feffffff mov qword ptr [rbp + 0x198], 0xfffffffffffffffe
14594e310: 4c89cb mov rbx, r9
14594e313: 4889d7 mov rdi, rdx
14594e316: 4889ce mov rsi, rcx
14594e319: 4c8bbd20020000 mov r15, qword ptr [rbp + 0x220]
14594e320: f30f10b528020000 movss xmm6, dword ptr [rbp + 0x228]
14594e328: 4983f80b cmp r8, 0xb
14594e32c: b80b000000 mov eax, 0xb
14594e331: 490f42c0 cmovb rax, r8
14594e335: c1e005 shl eax, 5
14594e338: 488d0d39292901 lea rcx, [rip + 0x1292939]
14594e33f: 448b440810 mov r8d, dword ptr [rax + rcx + 0x10]
14594e344: 448b4c0814 mov r9d, dword ptr [rax + rcx + 0x14]
14594e349: 8b96600a0000 mov edx, dword ptr [rsi + 0xa60]
14594e34f: ffc2 inc edx
14594e351: 8996600a0000 mov dword ptr [rsi + 0xa60], edx
14594e357: 4589c2 mov r10d, r8d
14594e35a: 4181e2ffffff00 and r10d, 0xffffff
14594e361: 49c1e218 shl r10, 0x18
14594e365: 81e2ffffff00 and edx, 0xffffff
14594e36b: 4c09d2 or rdx, r10
14594e36e: 49be00000000000030f1 movabs r14, 0xf130000000000000
14594e378: 4909d6 or r14, rdx
14594e37b: f30f5f351def4400 maxss xmm6, dword ptr [rip + 0x44ef1d]
14594e383: f30f107c0818 movss xmm7, dword ptr [rax + rcx + 0x18]
14594e389: 4c897c2438 mov qword ptr [rsp + 0x38], r15
14594e38e: f30f11742428 movss dword ptr [rsp + 0x28], xmm6
14594e394: f30f117c2420 movss dword ptr [rsp + 0x20], xmm7
14594e39a: c644243000 mov byte ptr [rsp + 0x30], 0
14594e39f: 4889f1 mov rcx, rsi
14594e3a2: 4c89f2 mov rdx, r14
14594e3a5: e896090200 call 0x14596ed40
14594e3aa: 488b8e90020000 mov rcx, qword ptr [rsi + 0x290]
14594e3b1: 488b9698020000 mov rdx, qword ptr [rsi + 0x298]
14594e3b8: e813edf3ff call 0x14588d0d0
14594e3bd: 4869c0f0000000 imul rax, rax, 0xf0
14594e3c4: 488d0dc5ff2801 lea rcx, [rip + 0x128ffc5]
14594e3cb: 488b440878 mov rax, qword ptr [rax + rcx + 0x78]
14594e3d0: f30f1086340a0000 movss xmm0, dword ptr [rsi + 0xa34]
14594e3d8: f30f105028 movss xmm2, dword ptr [rax + 0x28]
14594e3dd: f30f105838 movss xmm3, dword ptr [rax + 0x38]
14594e3e2: f30f59156e6a4800 mulss xmm2, dword ptr [rip + 0x486a6e]
14594e3ea: f30f581576b38d01 addss xmm2, dword ptr [rip + 0x18db376]
14594e3f2: f30f1025aaee4400 movss xmm4, dword ptr [rip + 0x44eeaa]
14594e3fa: f30f59e3 mulss xmm4, xmm3
14594e3fe: 0f57c9 xorps xmm1, xmm1
14594e401: 0f118d08010000 movups xmmword ptr [rbp + 0x108], xmm1
14594e408: 0f118df8000000 movups xmmword ptr [rbp + 0xf8], xmm1
14594e40f: 0f118de8000000 movups xmmword ptr [rbp + 0xe8], xmm1
14594e416: 0f118dd8000000 movups xmmword ptr [rbp + 0xd8], xmm1
14594e41d: 4c89b5b0000000 mov qword ptr [rbp + 0xb0], r14
14594e424: 48c745d8ffffffff mov qword ptr [rbp - 0x28], 0xffffffffffffffff
14594e42c: f30f119d28010000 movss dword ptr [rbp + 0x128], xmm3
14594e434: f30f11952c010000 movss dword ptr [rbp + 0x12c], xmm2
14594e43c: 418b4708 mov eax, dword ptr [r15 + 8]
14594e440: 89853c010000 mov dword ptr [rbp + 0x13c], eax
14594e446: 498b07 mov rax, qword ptr [r15]
14594e449: 48898534010000 mov qword ptr [rbp + 0x134], rax
14594e450: 498b07 mov rax, qword ptr [r15]
14594e453: 48898540010000 mov qword ptr [rbp + 0x140], rax
14594e45a: 418b4708 mov eax, dword ptr [r15 + 8]
14594e45e: 898548010000 mov dword ptr [rbp + 0x148], eax
14594e464: f30f11854c010000 movss dword ptr [rbp + 0x14c], xmm0
14594e46c: c7855001000000000000 mov dword ptr [rbp + 0x150], 0
14594e476: f30f118554010000 movss dword ptr [rbp + 0x154], xmm0
14594e47e: f30f11a558010000 movss dword ptr [rbp + 0x158], xmm4
14594e486: 48c745c000000000 mov qword ptr [rbp - 0x40], 0
14594e48e: 0f118dc0000000 movups xmmword ptr [rbp + 0xc0], xmm1
14594e495: 48c785d000000000000000 mov qword ptr [rbp + 0xd0], 0
14594e4a0: 0f118d5c010000 movups xmmword ptr [rbp + 0x15c], xmm1
14594e4a7: 0f118d6c010000 movups xmmword ptr [rbp + 0x16c], xmm1
14594e4ae: 48c745c808000000 mov qword ptr [rbp - 0x38], 8
14594e4b6: 48c745d000000000 mov qword ptr [rbp - 0x30], 0
14594e4be: c7857c01000000000000 mov dword ptr [rbp + 0x17c], 0
14594e4c8: c7457000000000 mov dword ptr [rbp + 0x70], 0
14594e4cf: c7457800000000 mov dword ptr [rbp + 0x78], 0
14594e4d6: 48c74518ffffffff mov qword ptr [rbp + 0x18], 0xffffffffffffffff
14594e4de: c7858000000000000000 mov dword ptr [rbp + 0x80], 0
14594e4e8: 48c785b800000000000000 mov qword ptr [rbp + 0xb8], 0
14594e4f3: 0f118d80010000 movups xmmword ptr [rbp + 0x180], xmm1
14594e4fa: 48c7858d01000000000000 mov qword ptr [rbp + 0x18d], 0
14594e505: f30f11b518010000 movss dword ptr [rbp + 0x118], xmm6
14594e50d: f30f11b51c010000 movss dword ptr [rbp + 0x11c], xmm6
14594e515: 48c7852001000000000000 mov qword ptr [rbp + 0x120], 0
14594e520: f30f11bd30010000 movss dword ptr [rbp + 0x130], xmm7
14594e528: 0f100b movups xmm1, xmmword ptr [rbx]
14594e52b: 0f118d90000000 movups xmmword ptr [rbp + 0x90], xmm1
14594e532: 4889bda0000000 mov qword ptr [rbp + 0xa0], rdi
14594e539: f30f108d30020000 movss xmm1, dword ptr [rbp + 0x230]
14594e541: 0f2815f8ee4400 movaps xmm2, xmmword ptr [rip + 0x44eef8]
14594e548: f30f10d1 movss xmm2, xmm1
14594e54c: f30f12c0 movsldup xmm0, xmm0
14594e550: 0f58c2 addps xmm0, xmm2
14594e553: 0f1385a8000000 movlps qword ptr [rbp + 0xa8], xmm0
14594e55a: 488bbe68050000 mov rdi, qword ptr [rsi + 0x568]
14594e561: 483bbe58050000 cmp rdi, qword ptr [rsi + 0x558]
14594e568: 750d jne 0x14594e577
14594e56a: 488d8e58050000 lea rcx, [rsi + 0x558]
14594e571: e88afe4200 call 0x145d7e400
14594e576: 90 nop
14594e577: 4869cfd8010000 imul rcx, rdi, 0x1d8
14594e57e: 48038e60050000 add rcx, qword ptr [rsi + 0x560]
14594e585: 488d55c0 lea rdx, [rbp - 0x40]
14594e589: 41b8d8010000 mov r8d, 0x1d8
14594e58f: e853bb2a00 call 0x145bfa0e7
14594e594: 48ffc7 inc rdi
14594e597: 4889be68050000 mov qword ptr [rsi + 0x568], rdi
14594e59e: 0f28b5a0010000 movaps xmm6, xmmword ptr [rbp + 0x1a0]
14594e5a5: 0f28bdb0010000 movaps xmm7, xmmword ptr [rbp + 0x1b0]
14594e5ac: 4881c448020000 add rsp, 0x248
14594e5b3: 5b pop rbx
14594e5b4: 5f pop rdi
14594e5b5: 5e pop rsi
14594e5b6: 415e pop r14
14594e5b8: 415f pop r15
14594e5ba: 5d pop rbp
14594e5bb: c3 ret
