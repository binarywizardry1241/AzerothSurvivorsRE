1459a7290 55 push rbp
1459a7291 56 push rsi
1459a7292 57 push rdi
1459a7293 53 push rbx
1459a7294 4881ec38010000 sub rsp, 0x138
1459a729b 488dac2480000000 lea rbp, [rsp + 0x80]
1459a72a3 48c785b0000000feffffff mov qword ptr [rbp + 0xb0], 0xfffffffffffffffe
1459a72ae 488d4d58 lea rcx, [rbp + 0x58]
1459a72b2 e899050c00 call 0x145a67850
1459a72b7 488b4558 mov rax, qword ptr [rbp + 0x58]
1459a72bb 4883f8ff cmp rax, -1
1459a72bf 0f844c020000 je 0x1459a7511
1459a72c5 488985a8000000 mov qword ptr [rbp + 0xa8], rax
1459a72cc 488b5560 mov rdx, qword ptr [rbp + 0x60]
1459a72d0 4c8b4568 mov r8, qword ptr [rbp + 0x68]
1459a72d4 488d4d58 lea rcx, [rbp + 0x58]
1459a72d8 48899588000000 mov qword ptr [rbp + 0x88], rdx
1459a72df e86c011200 call 0x145ac7450
1459a72e4 90 nop
1459a72e5 48837d58ff cmp qword ptr [rbp + 0x58], -1
1459a72ea 0f843f010000 je 0x1459a742f
1459a72f0 0f104558 movups xmm0, xmmword ptr [rbp + 0x58]
1459a72f4 0f104d68 movups xmm1, xmmword ptr [rbp + 0x68]
1459a72f8 0f294d30 movaps xmmword ptr [rbp + 0x30], xmm1
1459a72fc 0f294520 movaps xmmword ptr [rbp + 0x20], xmm0
1459a7300 4c8d0575da8801 lea r8, [rip + 0x188da75]
1459a7307 488d4d08 lea rcx, [rbp + 8]
1459a730b 488d5520 lea rdx, [rbp + 0x20]
1459a730f 41b926000000 mov r9d, 0x26
1459a7315 e8c6141200 call 0x145ac87e0
1459a731a 90 nop
1459a731b 488b4508 mov rax, qword ptr [rbp + 8]
1459a731f 4883f8ff cmp rax, -1
1459a7323 0f8415010000 je 0x1459a743e
1459a7329 488985a0000000 mov qword ptr [rbp + 0xa0], rax
1459a7330 488b5510 mov rdx, qword ptr [rbp + 0x10]
1459a7334 4c8b4518 mov r8, qword ptr [rbp + 0x18]
1459a7338 488d4df0 lea rcx, [rbp - 0x10]
1459a733c 48899598000000 mov qword ptr [rbp + 0x98], rdx
1459a7343 e8e8342200 call 0x145bca830
1459a7348 90 nop
1459a7349 488b4df8 mov rcx, qword ptr [rbp - 8]
1459a734d 488b4500 mov rax, qword ptr [rbp]
1459a7351 48898d90000000 mov qword ptr [rbp + 0x90], rcx
1459a7358 48894de0 mov qword ptr [rbp - 0x20], rcx
1459a735c 488945e8 mov qword ptr [rbp - 0x18], rax
1459a7360 488d7540 lea rsi, [rbp + 0x40]
1459a7364 4889f1 mov rcx, rsi
1459a7367 e894bff6ff call 0x145913300
1459a736c 90 nop
1459a736d 488d45e0 lea rax, [rbp - 0x20]
1459a7371 48894558 mov qword ptr [rbp + 0x58], rax
1459a7375 488d0544ad65fa lea rax, [rip - 0x59a52bc]
1459a737c 48894560 mov qword ptr [rbp + 0x60], rax
1459a7380 488d0de1d98801 lea rcx, [rip + 0x188d9e1]
1459a7387 48894d68 mov qword ptr [rbp + 0x68], rcx
1459a738b 48894570 mov qword ptr [rbp + 0x70], rax
1459a738f 48897578 mov qword ptr [rbp + 0x78], rsi
1459a7393 488d0546ad65fa lea rax, [rip - 0x59a52ba]
1459a739a 48898580000000 mov qword ptr [rbp + 0x80], rax
1459a73a1 488d15d0d98801 lea rdx, [rip + 0x188d9d0]
1459a73a8 488d4da8 lea rcx, [rbp - 0x58]
1459a73ac 4c8d4558 lea r8, [rbp + 0x58]
1459a73b0 e87b5a2200 call 0x145bcce30
1459a73b5 90 nop
1459a73b6 488b5540 mov rdx, qword ptr [rbp + 0x40]
1459a73ba 4885d2 test rdx, rdx
1459a73bd 740f je 0x1459a73ce
1459a73bf 488b4d48 mov rcx, qword ptr [rbp + 0x48]
1459a73c3 41b801000000 mov r8d, 1
1459a73c9 e802ae65fa call 0x1400021d0
1459a73ce 488b55f0 mov rdx, qword ptr [rbp - 0x10]
1459a73d2 4885d2 test rdx, rdx
1459a73d5 7e12 jle 0x1459a73e9
1459a73d7 41b801000000 mov r8d, 1
1459a73dd 488b8d90000000 mov rcx, qword ptr [rbp + 0x90]
1459a73e4 e8e7ad65fa call 0x1400021d0
1459a73e9 0f1045a8 movups xmm0, xmmword ptr [rbp - 0x58]
1459a73ed 0f2945c0 movaps xmmword ptr [rbp - 0x40], xmm0
1459a73f1 488b45b8 mov rax, qword ptr [rbp - 0x48]
1459a73f5 488945d0 mov qword ptr [rbp - 0x30], rax
1459a73f9 488d0d7cd98801 lea rcx, [rip + 0x188d97c]
1459a7400 4c8d45c0 lea r8, [rbp - 0x40]
1459a7404 ba26000000 mov edx, 0x26
1459a7409 e832411200 call 0x145acb540
1459a740e 90 nop
1459a740f 488b95a0000000 mov rdx, qword ptr [rbp + 0xa0]
1459a7416 4885d2 test rdx, rdx
1459a7419 7459 je 0x1459a7474
1459a741b 41b801000000 mov r8d, 1
1459a7421 488b8d98000000 mov rcx, qword ptr [rbp + 0x98]
1459a7428 e8a3ad65fa call 0x1400021d0
1459a742d eb45 jmp 0x1459a7474
1459a742f 488d4d60 lea rcx, [rbp + 0x60]
1459a7433 e8385c1f00 call 0x145b9d070
1459a7438 90 nop
1459a7439 e9b4000000 jmp 0x1459a74f2
1459a743e 488b4510 mov rax, qword ptr [rbp + 0x10]
1459a7442 48894540 mov qword ptr [rbp + 0x40], rax
1459a7446 488d4540 lea rax, [rbp + 0x40]
1459a744a 48894558 mov qword ptr [rbp + 0x58], rax
1459a744e 488d05fb5b1f00 lea rax, [rip + 0x1f5bfb]
1459a7455 48894560 mov qword ptr [rbp + 0x60], rax
1459a7459 488d0d42d98801 lea rcx, [rip + 0x188d942]
1459a7460 488d5558 lea rdx, [rbp + 0x58]
1459a7464 e827f12000 call 0x145bb6590
1459a7469 90 nop
1459a746a 488d4d40 lea rcx, [rbp + 0x40]
1459a746e e8fd5b1f00 call 0x145b9d070
1459a7473 90 nop
1459a7474 488b4530 mov rax, qword ptr [rbp + 0x30]
1459a7478 48898598000000 mov qword ptr [rbp + 0x98], rax
1459a747f 4885c0 test rax, rax
1459a7482 7452 je 0x1459a74d6
1459a7484 488b7528 mov rsi, qword ptr [rbp + 0x28]
1459a7488 488bbd98000000 mov rdi, qword ptr [rbp + 0x98]
1459a748f 48f7df neg rdi
1459a7492 b901000000 mov ecx, 1
1459a7497 4889b590000000 mov qword ptr [rbp + 0x90], rsi
1459a749e eb1b jmp 0x1459a74bb
1459a74a0 488b8da0000000 mov rcx, qword ptr [rbp + 0xa0]
1459a74a7 488d040f lea rax, [rdi + rcx]
1459a74ab 48ffc0 inc rax
1459a74ae 48ffc1 inc rcx
1459a74b1 4883c608 add rsi, 8
1459a74b5 4883f801 cmp rax, 1
1459a74b9 741b je 0x1459a74d6
1459a74bb 48898da0000000 mov qword ptr [rbp + 0xa0], rcx
1459a74c2 488b06 mov rax, qword ptr [rsi]
1459a74c5 f048ff08 lock dec qword ptr [rax]
1459a74c9 75d5 jne 0x1459a74a0
1459a74cb 4889f1 mov rcx, rsi
1459a74ce e85da00c00 call 0x145a71530
1459a74d3 90 nop
1459a74d4 ebca jmp 0x1459a74a0
1459a74d6 488b5520 mov rdx, qword ptr [rbp + 0x20]
1459a74da 4885d2 test rdx, rdx
1459a74dd 7413 je 0x1459a74f2
1459a74df 488b4d28 mov rcx, qword ptr [rbp + 0x28]
1459a74e3 48c1e203 shl rdx, 3
1459a74e7 41b808000000 mov r8d, 8
1459a74ed e8deac65fa call 0x1400021d0
1459a74f2 488b95a8000000 mov rdx, qword ptr [rbp + 0xa8]
1459a74f9 4885d2 test rdx, rdx
1459a74fc 7413 je 0x1459a7511
1459a74fe 41b801000000 mov r8d, 1
1459a7504 488b8d88000000 mov rcx, qword ptr [rbp + 0x88]
1459a750b e8c0ac65fa call 0x1400021d0
1459a7510 90 nop
1459a7511 4881c438010000 add rsp, 0x138
1459a7518 5b pop rbx
1459a7519 5f pop rdi
1459a751a 5e pop rsi
1459a751b 5d pop rbp
1459a751c c3 ret
