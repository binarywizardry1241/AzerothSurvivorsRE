145ba54d0 55 push rbp
145ba54d1 56 push rsi
145ba54d2 57 push rdi
145ba54d3 53 push rbx
145ba54d4 4881ec08010000 sub rsp, 0x108
145ba54db 488dac2480000000 lea rbp, [rsp + 0x80]
145ba54e3 48c78580000000feffffff mov qword ptr [rbp + 0x80], 0xfffffffffffffffe
145ba54ee 488d4d38 lea rcx, [rbp + 0x38]
145ba54f2 e8292e3200 call 0x145ec8320
145ba54f7 488b4538 mov rax, qword ptr [rbp + 0x38]
145ba54fb 4883f8ff cmp rax, -1
145ba54ff 0f84f0010000 je 0x145ba56f5
145ba5505 48894578 mov qword ptr [rbp + 0x78], rax
145ba5509 488b5540 mov rdx, qword ptr [rbp + 0x40]
145ba550d 4c8b4548 mov r8, qword ptr [rbp + 0x48]
145ba5511 488d4d38 lea rcx, [rbp + 0x38]
145ba5515 48895558 mov qword ptr [rbp + 0x58], rdx
145ba5519 e872a23900 call 0x145f3f790
145ba551e 90 nop
145ba551f 48837d38ff cmp qword ptr [rbp + 0x38], -1
145ba5524 0f84fc000000 je 0x145ba5626
145ba552a 0f104538 movups xmm0, xmmword ptr [rbp + 0x38]
145ba552e 0f104d48 movups xmm1, xmmword ptr [rbp + 0x48]
145ba5532 0f294d10 movaps xmmword ptr [rbp + 0x10], xmm1
145ba5536 0f294500 movaps xmmword ptr [rbp], xmm0
145ba553a 4c8d05eaa24d01 lea r8, [rip + 0x14da2ea]
145ba5541 488d4de8 lea rcx, [rbp - 0x18]
145ba5545 4889ea mov rdx, rbp
145ba5548 41b926000000 mov r9d, 0x26
145ba554e e85db43900 call 0x145f409b0
145ba5553 90 nop
145ba5554 488b45e8 mov rax, qword ptr [rbp - 0x18]
145ba5558 4883f8ff cmp rax, -1
145ba555c 0f84d3000000 je 0x145ba5635
145ba5562 48894570 mov qword ptr [rbp + 0x70], rax
145ba5566 488b55f0 mov rdx, qword ptr [rbp - 0x10]
145ba556a 4c8b45f8 mov r8, qword ptr [rbp - 8]
145ba556e 488d4d20 lea rcx, [rbp + 0x20]
145ba5572 48895568 mov qword ptr [rbp + 0x68], rdx
145ba5576 e8f5c84800 call 0x146031e70
145ba557b 90 nop
145ba557c 488b4d28 mov rcx, qword ptr [rbp + 0x28]
145ba5580 488b4530 mov rax, qword ptr [rbp + 0x30]
145ba5584 48894d60 mov qword ptr [rbp + 0x60], rcx
145ba5588 48894dd8 mov qword ptr [rbp - 0x28], rcx
145ba558c 488945e0 mov qword ptr [rbp - 0x20], rax
145ba5590 488d45d8 lea rax, [rbp - 0x28]
145ba5594 48894538 mov qword ptr [rbp + 0x38], rax
145ba5598 488d0521cb45fa lea rax, [rip - 0x5ba34df]
145ba559f 48894540 mov qword ptr [rbp + 0x40], rax
145ba55a3 488d052aa24d01 lea rax, [rip + 0x14da22a]
145ba55aa 48894548 mov qword ptr [rbp + 0x48], rax
145ba55ae 488d056b094a00 lea rax, [rip + 0x4a096b]
145ba55b5 48894550 mov qword ptr [rbp + 0x50], rax
145ba55b9 488d1518a24d01 lea rdx, [rip + 0x14da218]
145ba55c0 488d4da8 lea rcx, [rbp - 0x58]
145ba55c4 4c8d4538 lea r8, [rbp + 0x38]
145ba55c8 e8a3ee4800 call 0x146034470
145ba55cd 90 nop
145ba55ce 488b5520 mov rdx, qword ptr [rbp + 0x20]
145ba55d2 4885d2 test rdx, rdx
145ba55d5 7e0f jle 0x145ba55e6
145ba55d7 41b801000000 mov r8d, 1
145ba55dd 488b4d60 mov rcx, qword ptr [rbp + 0x60]
145ba55e1 e8eacb45fa call 0x1400021d0
145ba55e6 0f1045a8 movups xmm0, xmmword ptr [rbp - 0x58]
145ba55ea 0f2945c0 movaps xmmword ptr [rbp - 0x40], xmm0
145ba55ee 488b45b8 mov rax, qword ptr [rbp - 0x48]
145ba55f2 488945d0 mov qword ptr [rbp - 0x30], rax
145ba55f6 488d0d2ea24d01 lea rcx, [rip + 0x14da22e]
145ba55fd 4c8d45c0 lea r8, [rbp - 0x40]
145ba5601 ba26000000 mov edx, 0x26
145ba5606 e8b5dc3900 call 0x145f432c0
145ba560b 90 nop
145ba560c 488b5570 mov rdx, qword ptr [rbp + 0x70]
145ba5610 4885d2 test rdx, rdx
145ba5613 7456 je 0x145ba566b
145ba5615 41b801000000 mov r8d, 1
145ba561b 488b4d68 mov rcx, qword ptr [rbp + 0x68]
145ba561f e8accb45fa call 0x1400021d0
145ba5624 eb45 jmp 0x145ba566b
145ba5626 488d4d40 lea rcx, [rbp + 0x40]
145ba562a e841e94500 call 0x146003f70
145ba562f 90 nop
145ba5630 e9a7000000 jmp 0x145ba56dc
145ba5635 488d4520 lea rax, [rbp + 0x20]
145ba5639 488b4df0 mov rcx, qword ptr [rbp - 0x10]
145ba563d 48894d20 mov qword ptr [rbp + 0x20], rcx
145ba5641 48894538 mov qword ptr [rbp + 0x38], rax
145ba5645 488d0504e94500 lea rax, [rip + 0x45e904]
145ba564c 48894540 mov qword ptr [rbp + 0x40], rax
145ba5650 488d0dfaa14d01 lea rcx, [rip + 0x14da1fa]
145ba5657 488d5538 lea rdx, [rbp + 0x38]
145ba565b e8d0824700 call 0x14601d930
145ba5660 90 nop
145ba5661 488d4d20 lea rcx, [rbp + 0x20]
145ba5665 e806e94500 call 0x146003f70
145ba566a 90 nop
145ba566b 488b4510 mov rax, qword ptr [rbp + 0x10]
145ba566f 48894568 mov qword ptr [rbp + 0x68], rax
145ba5673 4885c0 test rax, rax
145ba5676 7448 je 0x145ba56c0
145ba5678 488b7508 mov rsi, qword ptr [rbp + 8]
145ba567c 488b7d68 mov rdi, qword ptr [rbp + 0x68]
145ba5680 48f7df neg rdi
145ba5683 b901000000 mov ecx, 1
145ba5688 48897560 mov qword ptr [rbp + 0x60], rsi
145ba568c eb1a jmp 0x145ba56a8
145ba568e 6690 nop
145ba5690 488b4d70 mov rcx, qword ptr [rbp + 0x70]
145ba5694 488d040f lea rax, [rdi + rcx]
145ba5698 48ffc0 inc rax
145ba569b 48ffc1 inc rcx
145ba569e 4883c608 add rsi, 8
145ba56a2 4883f801 cmp rax, 1
145ba56a6 7418 je 0x145ba56c0
145ba56a8 48894d70 mov qword ptr [rbp + 0x70], rcx
145ba56ac 488b06 mov rax, qword ptr [rsi]
145ba56af f048ff08 lock dec qword ptr [rax]
145ba56b3 75db jne 0x145ba5690
145ba56b5 4889f1 mov rcx, rsi
145ba56b8 e8c3c13b00 call 0x145f61880
145ba56bd 90 nop
145ba56be ebd0 jmp 0x145ba5690
145ba56c0 488b5500 mov rdx, qword ptr [rbp]
145ba56c4 4885d2 test rdx, rdx
145ba56c7 7413 je 0x145ba56dc
145ba56c9 488b4d08 mov rcx, qword ptr [rbp + 8]
145ba56cd 48c1e203 shl rdx, 3
145ba56d1 41b808000000 mov r8d, 8
145ba56d7 e8f4ca45fa call 0x1400021d0
145ba56dc 488b5578 mov rdx, qword ptr [rbp + 0x78]
145ba56e0 4885d2 test rdx, rdx
145ba56e3 7410 je 0x145ba56f5
145ba56e5 41b801000000 mov r8d, 1
145ba56eb 488b4d58 mov rcx, qword ptr [rbp + 0x58]
145ba56ef e8dcca45fa call 0x1400021d0
145ba56f4 90 nop
145ba56f5 4881c408010000 add rsp, 0x108
145ba56fc 5b pop rbx
145ba56fd 5f pop rdi
145ba56fe 5e pop rsi
145ba56ff 5d pop rbp
145ba5700 c3 ret
