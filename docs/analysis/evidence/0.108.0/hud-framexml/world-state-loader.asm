1459a01d0 55 push rbp
1459a01d1 56 push rsi
1459a01d2 57 push rdi
1459a01d3 53 push rbx
1459a01d4 4881ec38010000 sub rsp, 0x138
1459a01db 488dac2480000000 lea rbp, [rsp + 0x80]
1459a01e3 48c785b0000000feffffff mov qword ptr [rbp + 0xb0], 0xfffffffffffffffe
1459a01ee 488d4d58 lea rcx, [rbp + 0x58]
1459a01f2 e899050c00 call 0x145a60790
1459a01f7 488b4558 mov rax, qword ptr [rbp + 0x58]
1459a01fb 4883f8ff cmp rax, -1
1459a01ff 0f844c020000 je 0x1459a0451
1459a0205 488985a8000000 mov qword ptr [rbp + 0xa8], rax
1459a020c 488b5560 mov rdx, qword ptr [rbp + 0x60]
1459a0210 4c8b4568 mov r8, qword ptr [rbp + 0x68]
1459a0214 488d4d58 lea rcx, [rbp + 0x58]
1459a0218 48899588000000 mov qword ptr [rbp + 0x88], rdx
1459a021f e83cfb1200 call 0x145acfd60
1459a0224 90 nop
1459a0225 48837d58ff cmp qword ptr [rbp + 0x58], -1
1459a022a 0f843f010000 je 0x1459a036f
1459a0230 0f104558 movups xmm0, xmmword ptr [rbp + 0x58]
1459a0234 0f104d68 movups xmm1, xmmword ptr [rbp + 0x68]
1459a0238 0f294d30 movaps xmmword ptr [rbp + 0x30], xmm1
1459a023c 0f294520 movaps xmmword ptr [rbp + 0x20], xmm0
1459a0240 4c8d0525a88501 lea r8, [rip + 0x185a825]
1459a0247 488d4d08 lea rcx, [rbp + 8]
1459a024b 488d5520 lea rdx, [rbp + 0x20]
1459a024f 41b926000000 mov r9d, 0x26
1459a0255 e8960e1300 call 0x145ad10f0
1459a025a 90 nop
1459a025b 488b4508 mov rax, qword ptr [rbp + 8]
1459a025f 4883f8ff cmp rax, -1
1459a0263 0f8415010000 je 0x1459a037e
1459a0269 488985a0000000 mov qword ptr [rbp + 0xa0], rax
1459a0270 488b5510 mov rdx, qword ptr [rbp + 0x10]
1459a0274 4c8b4518 mov r8, qword ptr [rbp + 0x18]
1459a0278 488d4df0 lea rcx, [rbp - 0x10]
1459a027c 48899598000000 mov qword ptr [rbp + 0x98], rdx
1459a0283 e8082e2200 call 0x145bc3090
1459a0288 90 nop
1459a0289 488b4df8 mov rcx, qword ptr [rbp - 8]
1459a028d 488b4500 mov rax, qword ptr [rbp]
1459a0291 48898d90000000 mov qword ptr [rbp + 0x90], rcx
1459a0298 48894de0 mov qword ptr [rbp - 0x20], rcx
1459a029c 488945e8 mov qword ptr [rbp - 0x18], rax
1459a02a0 488d7540 lea rsi, [rbp + 0x40]
1459a02a4 4889f1 mov rcx, rsi
1459a02a7 e864c3f6ff call 0x14590c610
1459a02ac 90 nop
1459a02ad 488d45e0 lea rax, [rbp - 0x20]
1459a02b1 48894558 mov qword ptr [rbp + 0x58], rax
1459a02b5 488d05041e66fa lea rax, [rip - 0x599e1fc]
1459a02bc 48894560 mov qword ptr [rbp + 0x60], rax
1459a02c0 488d0d91a78501 lea rcx, [rip + 0x185a791]
1459a02c7 48894d68 mov qword ptr [rbp + 0x68], rcx
1459a02cb 48894570 mov qword ptr [rbp + 0x70], rax
1459a02cf 48897578 mov qword ptr [rbp + 0x78], rsi
1459a02d3 488d05061e66fa lea rax, [rip - 0x599e1fa]
1459a02da 48898580000000 mov qword ptr [rbp + 0x80], rax
1459a02e1 488d1580a78501 lea rdx, [rip + 0x185a780]
1459a02e8 488d4da8 lea rcx, [rbp - 0x58]
1459a02ec 4c8d4558 lea r8, [rbp + 0x58]
1459a02f0 e89b532200 call 0x145bc5690
1459a02f5 90 nop
1459a02f6 488b5540 mov rdx, qword ptr [rbp + 0x40]
1459a02fa 4885d2 test rdx, rdx
1459a02fd 740f je 0x1459a030e
1459a02ff 488b4d48 mov rcx, qword ptr [rbp + 0x48]
1459a0303 41b801000000 mov r8d, 1
1459a0309 e8c21e66fa call 0x1400021d0
1459a030e 488b55f0 mov rdx, qword ptr [rbp - 0x10]
1459a0312 4885d2 test rdx, rdx
1459a0315 7e12 jle 0x1459a0329
1459a0317 41b801000000 mov r8d, 1
1459a031d 488b8d90000000 mov rcx, qword ptr [rbp + 0x90]
1459a0324 e8a71e66fa call 0x1400021d0
1459a0329 0f1045a8 movups xmm0, xmmword ptr [rbp - 0x58]
1459a032d 0f2945c0 movaps xmmword ptr [rbp - 0x40], xmm0
1459a0331 488b45b8 mov rax, qword ptr [rbp - 0x48]
1459a0335 488945d0 mov qword ptr [rbp - 0x30], rax
1459a0339 488d0d2ca78501 lea rcx, [rip + 0x185a72c]
1459a0340 4c8d45c0 lea r8, [rbp - 0x40]
1459a0344 ba26000000 mov edx, 0x26
1459a0349 e8023b1300 call 0x145ad3e50
1459a034e 90 nop
1459a034f 488b95a0000000 mov rdx, qword ptr [rbp + 0xa0]
1459a0356 4885d2 test rdx, rdx
1459a0359 7459 je 0x1459a03b4
1459a035b 41b801000000 mov r8d, 1
1459a0361 488b8d98000000 mov rcx, qword ptr [rbp + 0x98]
1459a0368 e8631e66fa call 0x1400021d0
1459a036d eb45 jmp 0x1459a03b4
1459a036f 488d4d60 lea rcx, [rbp + 0x60]
1459a0373 e858551f00 call 0x145b958d0
1459a0378 90 nop
1459a0379 e9b4000000 jmp 0x1459a0432
1459a037e 488b4510 mov rax, qword ptr [rbp + 0x10]
1459a0382 48894540 mov qword ptr [rbp + 0x40], rax
1459a0386 488d4540 lea rax, [rbp + 0x40]
1459a038a 48894558 mov qword ptr [rbp + 0x58], rax
1459a038e 488d051b551f00 lea rax, [rip + 0x1f551b]
1459a0395 48894560 mov qword ptr [rbp + 0x60], rax
1459a0399 488d0df2a68501 lea rcx, [rip + 0x185a6f2]
1459a03a0 488d5558 lea rdx, [rbp + 0x58]
1459a03a4 e847ea2000 call 0x145baedf0
1459a03a9 90 nop
1459a03aa 488d4d40 lea rcx, [rbp + 0x40]
1459a03ae e81d551f00 call 0x145b958d0
1459a03b3 90 nop
1459a03b4 488b4530 mov rax, qword ptr [rbp + 0x30]
1459a03b8 48898598000000 mov qword ptr [rbp + 0x98], rax
1459a03bf 4885c0 test rax, rax
1459a03c2 7452 je 0x1459a0416
1459a03c4 488b7528 mov rsi, qword ptr [rbp + 0x28]
1459a03c8 488bbd98000000 mov rdi, qword ptr [rbp + 0x98]
1459a03cf 48f7df neg rdi
1459a03d2 b901000000 mov ecx, 1
1459a03d7 4889b590000000 mov qword ptr [rbp + 0x90], rsi
1459a03de eb1b jmp 0x1459a03fb
1459a03e0 488b8da0000000 mov rcx, qword ptr [rbp + 0xa0]
1459a03e7 488d040f lea rax, [rdi + rcx]
1459a03eb 48ffc0 inc rax
1459a03ee 48ffc1 inc rcx
1459a03f1 4883c608 add rsi, 8
1459a03f5 4883f801 cmp rax, 1
1459a03f9 741b je 0x1459a0416
1459a03fb 48898da0000000 mov qword ptr [rbp + 0xa0], rcx
1459a0402 488b06 mov rax, qword ptr [rsi]
1459a0405 f048ff08 lock dec qword ptr [rax]
1459a0409 75d5 jne 0x1459a03e0
1459a040b 4889f1 mov rcx, rsi
1459a040e e89d260e00 call 0x145a82ab0
1459a0413 90 nop
1459a0414 ebca jmp 0x1459a03e0
1459a0416 488b5520 mov rdx, qword ptr [rbp + 0x20]
1459a041a 4885d2 test rdx, rdx
1459a041d 7413 je 0x1459a0432
1459a041f 488b4d28 mov rcx, qword ptr [rbp + 0x28]
1459a0423 48c1e203 shl rdx, 3
1459a0427 41b808000000 mov r8d, 8
1459a042d e89e1d66fa call 0x1400021d0
1459a0432 488b95a8000000 mov rdx, qword ptr [rbp + 0xa8]
1459a0439 4885d2 test rdx, rdx
1459a043c 7413 je 0x1459a0451
1459a043e 41b801000000 mov r8d, 1
1459a0444 488b8d88000000 mov rcx, qword ptr [rbp + 0x88]
1459a044b e8801d66fa call 0x1400021d0
1459a0450 90 nop
1459a0451 4881c438010000 add rsp, 0x138
1459a0458 5b pop rbx
1459a0459 5f pop rdi
1459a045a 5e pop rsi
1459a045b 5d pop rbp
1459a045c c3 ret
