1400db390 4157 push r15
1400db392 4156 push r14
1400db394 4155 push r13
1400db396 4154 push r12
1400db398 56 push rsi
1400db399 57 push rdi
1400db39a 55 push rbp
1400db39b 53 push rbx
1400db39c 4881ec08010000 sub rsp, 0x108
1400db3a3 41be01000000 mov r14d, 1
1400db3a9 f0450fc1b0b0050000 lock xadd dword ptr [r8 + 0x5b0], r14d
1400db3b2 4883baf0000000ff cmp qword ptr [rdx + 0xf0], -1
1400db3ba 0f8441020000 je 0x1400db601
1400db3c0 4c89c3 mov rbx, r8
1400db3c3 4889d6 mov rsi, rdx
1400db3c6 498b80a0050000 mov rax, qword ptr [r8 + 0x5a0]
1400db3cd 4889442458 mov qword ptr [rsp + 0x58], rax
1400db3d2 483982f8060000 cmp qword ptr [rdx + 0x6f8], rax
1400db3d9 0f853c020000 jne 0x1400db61b
1400db3df 48894c2450 mov qword ptr [rsp + 0x50], rcx
1400db3e4 488b86c8050000 mov rax, qword ptr [rsi + 0x5c8]
1400db3eb 483b8318020000 cmp rax, qword ptr [rbx + 0x218]
1400db3f2 0f8357020000 jae 0x1400db64f
1400db3f8 488b8b10020000 mov rcx, qword ptr [rbx + 0x210]
1400db3ff 488b04c1 mov rax, qword ptr [rcx + rax*8]
1400db403 4885c0 test rax, rax
1400db406 0f8443020000 je 0x1400db64f
1400db40c 4c8ba3e0010000 mov r12, qword ptr [rbx + 0x1e0]
1400db413 48f7d0 not rax
1400db416 486bc038 imul rax, rax, 0x38
1400db41a 41807c043000 cmp byte ptr [r12 + rax + 0x30], 0
1400db420 0f8429020000 je 0x1400db64f
1400db426 4901c4 add r12, rax
1400db429 488dae50020000 lea rbp, [rsi + 0x250]
1400db430 488dbe28010000 lea rdi, [rsi + 0x128]
1400db437 4d8b6c2410 mov r13, qword ptr [r12 + 0x10]
1400db43c 498d442428 lea rax, [r12 + 0x28]
1400db441 4889442448 mov qword ptr [rsp + 0x48], rax
1400db446 4983c42c add r12, 0x2c
1400db44a 448bbe00070000 mov r15d, dword ptr [rsi + 0x700]
1400db451 4889f1 mov rcx, rsi
1400db454 4889da mov rdx, rbx
1400db457 e854d32d00 call 0x1403b87b0
1400db45c 4889f9 mov rcx, rdi
1400db45f 4889da mov rdx, rbx
1400db462 e849d32d00 call 0x1403b87b0
1400db467 4889e9 mov rcx, rbp
1400db46a 4889da mov rdx, rbx
1400db46d e86e232f00 call 0x1403cd7e0
1400db472 488d8e80030000 lea rcx, [rsi + 0x380]
1400db479 4889da mov rdx, rbx
1400db47c e83fb32d00 call 0x1403b67c0
1400db481 488d8ea0040000 lea rcx, [rsi + 0x4a0]
1400db488 4889da mov rdx, rbx
1400db48b e820d32d00 call 0x1403b87b0
1400db490 488d8ed0050000 lea rcx, [rsi + 0x5d0]
1400db497 4889da mov rdx, rbx
1400db49a e8917c2e00 call 0x1403c3130
1400db49f 4c896c2458 mov qword ptr [rsp + 0x58], r13
1400db4a4 488b442448 mov rax, qword ptr [rsp + 0x48]
1400db4a9 4889442460 mov qword ptr [rsp + 0x60], rax
1400db4ae 4c89642468 mov qword ptr [rsp + 0x68], r12
1400db4b3 44897c2470 mov dword ptr [rsp + 0x70], r15d
1400db4b8 4489742474 mov dword ptr [rsp + 0x74], r14d
1400db4bd 4c8d442478 lea r8, [rsp + 0x78]
1400db4c2 4889742478 mov qword ptr [rsp + 0x78], rsi
1400db4c7 48899c2480000000 mov qword ptr [rsp + 0x80], rbx
1400db4cf 4489bc2488000000 mov dword ptr [rsp + 0x88], r15d
1400db4d7 4489b4248c000000 mov dword ptr [rsp + 0x8c], r14d
1400db4df 4c8d8c2490000000 lea r9, [rsp + 0x90]
1400db4e7 4889bc2490000000 mov qword ptr [rsp + 0x90], rdi
1400db4ef 48899c2498000000 mov qword ptr [rsp + 0x98], rbx
1400db4f7 4489bc24a0000000 mov dword ptr [rsp + 0xa0], r15d
1400db4ff 4489b424a4000000 mov dword ptr [rsp + 0xa4], r14d
1400db507 488d8424a8000000 lea rax, [rsp + 0xa8]
1400db50f 4889ac24a8000000 mov qword ptr [rsp + 0xa8], rbp
1400db517 48899c24b0000000 mov qword ptr [rsp + 0xb0], rbx
1400db51f 4489bc24b8000000 mov dword ptr [rsp + 0xb8], r15d
1400db527 4489b424bc000000 mov dword ptr [rsp + 0xbc], r14d
1400db52f 488d8c24c0000000 lea rcx, [rsp + 0xc0]
1400db537 488d9680030000 lea rdx, [rsi + 0x380]
1400db53e 48899424c0000000 mov qword ptr [rsp + 0xc0], rdx
1400db546 48899c24c8000000 mov qword ptr [rsp + 0xc8], rbx
1400db54e 4489bc24d0000000 mov dword ptr [rsp + 0xd0], r15d
1400db556 4489b424d4000000 mov dword ptr [rsp + 0xd4], r14d
1400db55e 488d9424d8000000 lea rdx, [rsp + 0xd8]
1400db566 4c8d96a0040000 lea r10, [rsi + 0x4a0]
1400db56d 4c899424d8000000 mov qword ptr [rsp + 0xd8], r10
1400db575 48899c24e0000000 mov qword ptr [rsp + 0xe0], rbx
1400db57d 4489bc24e8000000 mov dword ptr [rsp + 0xe8], r15d
1400db585 4489b424ec000000 mov dword ptr [rsp + 0xec], r14d
1400db58d 4c8d9424f0000000 lea r10, [rsp + 0xf0]
1400db595 4c8d9ed0050000 lea r11, [rsi + 0x5d0]
1400db59c 4c899c24f0000000 mov qword ptr [rsp + 0xf0], r11
1400db5a4 48899c24f8000000 mov qword ptr [rsp + 0xf8], rbx
1400db5ac 4489bc2400010000 mov dword ptr [rsp + 0x100], r15d
1400db5b4 4489b42404010000 mov dword ptr [rsp + 0x104], r14d
1400db5bc 4c89542438 mov qword ptr [rsp + 0x38], r10
1400db5c1 4889542430 mov qword ptr [rsp + 0x30], rdx
1400db5c6 48894c2428 mov qword ptr [rsp + 0x28], rcx
1400db5cb 4889442420 mov qword ptr [rsp + 0x20], rax
1400db5d0 488d542458 lea rdx, [rsp + 0x58]
1400db5d5 e8b630ffff call 0x1400ce690
1400db5da 4489b600070000 mov dword ptr [rsi + 0x700], r14d
1400db5e1 488b442450 mov rax, qword ptr [rsp + 0x50]
1400db5e6 48c700fdffffff mov qword ptr [rax], 0xfffffffffffffffd
1400db5ed 4881c408010000 add rsp, 0x108
1400db5f4 5b pop rbx
1400db5f5 5d pop rbp
1400db5f6 5f pop rdi
1400db5f7 5e pop rsi
1400db5f8 415c pop r12
1400db5fa 415d pop r13
1400db5fc 415e pop r14
1400db5fe 415f pop r15
1400db600 c3 ret
1400db601 488d0dc844cf05 lea rcx, [rip + 0x5cf44c8]
1400db608 4c8d052145cf05 lea r8, [rip + 0x5cf4521]
1400db60f ba59000000 mov edx, 0x59
1400db614 e89781cb05 call 0x145d937b0
1400db619 0f0b ud2
1400db61b 4881c6f8060000 add rsi, 0x6f8
1400db622 488d058f45cf05 lea rax, [rip + 0x5cf458f]
1400db629 4889442428 mov qword ptr [rsp + 0x28], rax
1400db62e 48c7442420df000000 mov qword ptr [rsp + 0x20], 0xdf
1400db637 4c8d0d0a45cf05 lea r9, [rip + 0x5cf450a]
1400db63e 4c8d442458 lea r8, [rsp + 0x58]
1400db643 31c9 xor ecx, ecx
1400db645 4889f2 mov rdx, rsi
1400db648 e8b06ec605 call 0x145d424fd
1400db64d 0f0b ud2
1400db64f 4881c604070000 add rsi, 0x704
1400db656 4889742458 mov qword ptr [rsp + 0x58], rsi
1400db65b 488d05beb8f104 lea rax, [rip + 0x4f1b8be]
1400db662 4889442460 mov qword ptr [rsp + 0x60], rax
1400db667 488d4c2447 lea rcx, [rsp + 0x47]
1400db66c 48894c2468 mov qword ptr [rsp + 0x68], rcx
1400db671 4889442470 mov qword ptr [rsp + 0x70], rax
1400db676 488d0d433fcf05 lea rcx, [rip + 0x5cf3f43]
1400db67d 4c8d05dc3fcf05 lea r8, [rip + 0x5cf3fdc]
1400db684 488d542458 lea rdx, [rsp + 0x58]
1400db689 e8e283cb05 call 0x145d93a70
1400db68e 0f0b ud2
