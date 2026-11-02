145b44190 55 push rbp
145b44191 56 push rsi
145b44192 57 push rdi
145b44193 53 push rbx
145b44194 4881ec08010000 sub rsp, 0x108
145b4419b 488dac2480000000 lea rbp, [rsp + 0x80]
145b441a3 48c78580000000feffffff mov qword ptr [rbp + 0x80], 0xfffffffffffffffe
145b441ae 488d4d38 lea rcx, [rbp + 0x38]
145b441b2 e8097b2b00 call 0x145dfbcc0
145b441b7 488b4538 mov rax, qword ptr [rbp + 0x38]
145b441bb 4883f8ff cmp rax, -1
145b441bf 0f84f0010000 je 0x145b443b5
145b441c5 48894578 mov qword ptr [rbp + 0x78], rax
145b441c9 488b5540 mov rdx, qword ptr [rbp + 0x40]
145b441cd 4c8b4548 mov r8, qword ptr [rbp + 0x48]
145b441d1 488d4d38 lea rcx, [rbp + 0x38]
145b441d5 48895558 mov qword ptr [rbp + 0x58], rdx
145b441d9 e862803200 call 0x145e6c240
145b441de 90 nop
145b441df 48837d38ff cmp qword ptr [rbp + 0x38], -1
145b441e4 0f84fc000000 je 0x145b442e6
145b441ea 0f104538 movups xmm0, xmmword ptr [rbp + 0x38]
145b441ee 0f104d48 movups xmm1, xmmword ptr [rbp + 0x48]
145b441f2 0f294d10 movaps xmmword ptr [rbp + 0x10], xmm1
145b441f6 0f294500 movaps xmmword ptr [rbp], xmm0
145b441fa 4c8d053a6ba901 lea r8, [rip + 0x1a96b3a]
145b44201 488d4de8 lea rcx, [rbp - 0x18]
145b44205 4889ea mov rdx, rbp
145b44208 41b926000000 mov r9d, 0x26
145b4420e e84d923200 call 0x145e6d460
145b44213 90 nop
145b44214 488b45e8 mov rax, qword ptr [rbp - 0x18]
145b44218 4883f8ff cmp rax, -1
145b4421c 0f84d3000000 je 0x145b442f5
145b44222 48894570 mov qword ptr [rbp + 0x70], rax
145b44226 488b55f0 mov rdx, qword ptr [rbp - 0x10]
145b4422a 4c8b45f8 mov r8, qword ptr [rbp - 8]
145b4422e 488d4d20 lea rcx, [rbp + 0x20]
145b44232 48895568 mov qword ptr [rbp + 0x68], rdx
145b44236 e8f5064200 call 0x145f64930
145b4423b 90 nop
145b4423c 488b4d28 mov rcx, qword ptr [rbp + 0x28]
145b44240 488b4530 mov rax, qword ptr [rbp + 0x30]
145b44244 48894d60 mov qword ptr [rbp + 0x60], rcx
145b44248 48894dd8 mov qword ptr [rbp - 0x28], rcx
145b4424c 488945e0 mov qword ptr [rbp - 0x20], rax
145b44250 488d45d8 lea rax, [rbp - 0x28]
145b44254 48894538 mov qword ptr [rbp + 0x38], rax
145b44258 488d0561de4bfa lea rax, [rip - 0x5b4219f]
145b4425f 48894540 mov qword ptr [rbp + 0x40], rax
145b44263 488d057a6aa901 lea rax, [rip + 0x1a96a7a]
145b4426a 48894548 mov qword ptr [rbp + 0x48], rax
145b4426e 488d056b474300 lea rax, [rip + 0x43476b]
145b44275 48894550 mov qword ptr [rbp + 0x50], rax
145b44279 488d15686aa901 lea rdx, [rip + 0x1a96a68]
145b44280 488d4da8 lea rcx, [rbp - 0x58]
145b44284 4c8d4538 lea r8, [rbp + 0x38]
145b44288 e8a32c4200 call 0x145f66f30
145b4428d 90 nop
145b4428e 488b5520 mov rdx, qword ptr [rbp + 0x20]
145b44292 4885d2 test rdx, rdx
145b44295 7e0f jle 0x145b442a6
145b44297 41b801000000 mov r8d, 1
145b4429d 488b4d60 mov rcx, qword ptr [rbp + 0x60]
145b442a1 e82adf4bfa call 0x1400021d0
145b442a6 0f1045a8 movups xmm0, xmmword ptr [rbp - 0x58]
145b442aa 0f2945c0 movaps xmmword ptr [rbp - 0x40], xmm0
145b442ae 488b45b8 mov rax, qword ptr [rbp - 0x48]
145b442b2 488945d0 mov qword ptr [rbp - 0x30], rax
145b442b6 488d0d7e6aa901 lea rcx, [rip + 0x1a96a7e]
145b442bd 4c8d45c0 lea r8, [rbp - 0x40]
145b442c1 ba26000000 mov edx, 0x26
145b442c6 e8a5ba3200 call 0x145e6fd70
145b442cb 90 nop
145b442cc 488b5570 mov rdx, qword ptr [rbp + 0x70]
145b442d0 4885d2 test rdx, rdx
145b442d3 7456 je 0x145b4432b
145b442d5 41b801000000 mov r8d, 1
145b442db 488b4d68 mov rcx, qword ptr [rbp + 0x68]
145b442df e8ecde4bfa call 0x1400021d0
145b442e4 eb45 jmp 0x145b4432b
145b442e6 488d4d40 lea rcx, [rbp + 0x40]
145b442ea e841273f00 call 0x145f36a30
145b442ef 90 nop
145b442f0 e9a7000000 jmp 0x145b4439c
145b442f5 488d4520 lea rax, [rbp + 0x20]
145b442f9 488b4df0 mov rcx, qword ptr [rbp - 0x10]
145b442fd 48894d20 mov qword ptr [rbp + 0x20], rcx
145b44301 48894538 mov qword ptr [rbp + 0x38], rax
145b44305 488d0504273f00 lea rax, [rip + 0x3f2704]
145b4430c 48894540 mov qword ptr [rbp + 0x40], rax
145b44310 488d0d4a6aa901 lea rcx, [rip + 0x1a96a4a]
145b44317 488d5538 lea rdx, [rbp + 0x38]
145b4431b e8d0c04000 call 0x145f503f0
145b44320 90 nop
145b44321 488d4d20 lea rcx, [rbp + 0x20]
145b44325 e806273f00 call 0x145f36a30
145b4432a 90 nop
145b4432b 488b4510 mov rax, qword ptr [rbp + 0x10]
145b4432f 48894568 mov qword ptr [rbp + 0x68], rax
145b44333 4885c0 test rax, rax
145b44336 7448 je 0x145b44380
145b44338 488b7508 mov rsi, qword ptr [rbp + 8]
145b4433c 488b7d68 mov rdi, qword ptr [rbp + 0x68]
145b44340 48f7df neg rdi
145b44343 b901000000 mov ecx, 1
145b44348 48897560 mov qword ptr [rbp + 0x60], rsi
145b4434c eb1a jmp 0x145b44368
145b4434e 6690 nop
145b44350 488b4d70 mov rcx, qword ptr [rbp + 0x70]
145b44354 488d040f lea rax, [rdi + rcx]
145b44358 48ffc0 inc rax
145b4435b 48ffc1 inc rcx
145b4435e 4883c608 add rsi, 8
145b44362 4883f801 cmp rax, 1
145b44366 7418 je 0x145b44380
145b44368 48894d70 mov qword ptr [rbp + 0x70], rcx
145b4436c 488b06 mov rax, qword ptr [rsi]
145b4436f f048ff08 lock dec qword ptr [rax]
145b44373 75db jne 0x145b44350
145b44375 4889f1 mov rcx, rsi
145b44378 e843aa3400 call 0x145e8edc0
145b4437d 90 nop
145b4437e ebd0 jmp 0x145b44350
145b44380 488b5500 mov rdx, qword ptr [rbp]
145b44384 4885d2 test rdx, rdx
145b44387 7413 je 0x145b4439c
145b44389 488b4d08 mov rcx, qword ptr [rbp + 8]
145b4438d 48c1e203 shl rdx, 3
145b44391 41b808000000 mov r8d, 8
145b44397 e834de4bfa call 0x1400021d0
145b4439c 488b5578 mov rdx, qword ptr [rbp + 0x78]
145b443a0 4885d2 test rdx, rdx
145b443a3 7410 je 0x145b443b5
145b443a5 41b801000000 mov r8d, 1
145b443ab 488b4d58 mov rcx, qword ptr [rbp + 0x58]
145b443af e81cde4bfa call 0x1400021d0
145b443b4 90 nop
145b443b5 4881c408010000 add rsp, 0x108
145b443bc 5b pop rbx
145b443bd 5f pop rdi
145b443be 5e pop rsi
145b443bf 5d pop rbp
145b443c0 c3 ret
