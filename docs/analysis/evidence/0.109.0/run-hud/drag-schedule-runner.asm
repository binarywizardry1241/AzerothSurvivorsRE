14029a5b0 4157 push r15
14029a5b2 4156 push r14
14029a5b4 4155 push r13
14029a5b6 4154 push r12
14029a5b8 56 push rsi
14029a5b9 57 push rdi
14029a5ba 55 push rbp
14029a5bb 53 push rbx
14029a5bc 4881ece8000000 sub rsp, 0xe8
14029a5c3 bd01000000 mov ebp, 1
14029a5c8 f0410fc1a8b0050000 lock xadd dword ptr [r8 + 0x5b0], ebp
14029a5d1 4883ba18010000ff cmp qword ptr [rdx + 0x118], -1
14029a5d9 0f8424020000 je 0x14029a803
14029a5df 4c89c3 mov rbx, r8
14029a5e2 4889d6 mov rsi, rdx
14029a5e5 498b80a0050000 mov rax, qword ptr [r8 + 0x5a0]
14029a5ec 4889442440 mov qword ptr [rsp + 0x40], rax
14029a5f1 48394208 cmp qword ptr [rdx + 8], rax
14029a5f5 0f8522020000 jne 0x14029a81d
14029a5fb 488b4610 mov rax, qword ptr [rsi + 0x10]
14029a5ff 483b8318020000 cmp rax, qword ptr [rbx + 0x218]
14029a606 0f8380020000 jae 0x14029a88c
14029a60c 488b9310020000 mov rdx, qword ptr [rbx + 0x210]
14029a613 488b04c2 mov rax, qword ptr [rdx + rax*8]
14029a617 4885c0 test rax, rax
14029a61a 0f846c020000 je 0x14029a88c
14029a620 4c8bbbe0010000 mov r15, qword ptr [rbx + 0x1e0]
14029a627 48f7d0 not rax
14029a62a 486bc038 imul rax, rax, 0x38
14029a62e 41807c073000 cmp byte ptr [r15 + rax + 0x30], 0
14029a634 0f8452020000 je 0x14029a88c
14029a63a 4901c7 add r15, rax
14029a63d 4d8b5710 mov r10, qword ptr [r15 + 0x10]
14029a641 8b83b0050000 mov eax, dword ptr [rbx + 0x5b0]
14029a647 488b4618 mov rax, qword ptr [rsi + 0x18]
14029a64b 4c8b8b18020000 mov r9, qword ptr [rbx + 0x218]
14029a652 4c39c8 cmp rax, r9
14029a655 0f83f3010000 jae 0x14029a84e
14029a65b 488b9310020000 mov rdx, qword ptr [rbx + 0x210]
14029a662 4c8b04c2 mov r8, qword ptr [rdx + rax*8]
14029a666 4d85c0 test r8, r8
14029a669 0f84df010000 je 0x14029a84e
14029a66f 488b83e0010000 mov rax, qword ptr [rbx + 0x1e0]
14029a676 49f7d0 not r8
14029a679 4d6be838 imul r13, r8, 0x38
14029a67d 42807c283000 cmp byte ptr [rax + r13 + 0x30], 0
14029a683 0f84c5010000 je 0x14029a84e
14029a689 4c899424d8000000 mov qword ptr [rsp + 0xd8], r10
14029a691 48898c24e0000000 mov qword ptr [rsp + 0xe0], rcx
14029a699 4c8b4620 mov r8, qword ptr [rsi + 0x20]
14029a69d 4d39c8 cmp r8, r9
14029a6a0 0f83a8010000 jae 0x14029a84e
14029a6a6 4a8b0cc2 mov rcx, qword ptr [rdx + r8*8]
14029a6aa 4885c9 test rcx, rcx
14029a6ad 0f849b010000 je 0x14029a84e
14029a6b3 48f7d1 not rcx
14029a6b6 4c6be138 imul r12, rcx, 0x38
14029a6ba 42807c203000 cmp byte ptr [rax + r12 + 0x30], 0
14029a6c0 0f8488010000 je 0x14029a84e
14029a6c6 8b3e mov edi, dword ptr [rsi]
14029a6c8 4901c5 add r13, rax
14029a6cb 498b4d10 mov rcx, qword ptr [r13 + 0x10]
14029a6cf 48898c24d0000000 mov qword ptr [rsp + 0xd0], rcx
14029a6d7 4901c4 add r12, rax
14029a6da 498d452c lea rax, [r13 + 0x2c]
14029a6de 48898424c8000000 mov qword ptr [rsp + 0xc8], rax
14029a6e6 4983c528 add r13, 0x28
14029a6ea 4d8d772c lea r14, [r15 + 0x2c]
14029a6ee 4983c728 add r15, 0x28
14029a6f2 488d4e28 lea rcx, [rsi + 0x28]
14029a6f6 498b442410 mov rax, qword ptr [r12 + 0x10]
14029a6fb 48898424c0000000 mov qword ptr [rsp + 0xc0], rax
14029a703 498d442428 lea rax, [r12 + 0x28]
14029a708 48898424b8000000 mov qword ptr [rsp + 0xb8], rax
14029a710 4983c42c add r12, 0x2c
14029a714 4889da mov rdx, rbx
14029a717 e8f4cc0e00 call 0x140387410
14029a71c 488b8424d8000000 mov rax, qword ptr [rsp + 0xd8]
14029a724 4889442440 mov qword ptr [rsp + 0x40], rax
14029a729 4c897c2448 mov qword ptr [rsp + 0x48], r15
14029a72e 4c89742450 mov qword ptr [rsp + 0x50], r14
14029a733 897c2458 mov dword ptr [rsp + 0x58], edi
14029a737 896c245c mov dword ptr [rsp + 0x5c], ebp
14029a73b 4c8d442460 lea r8, [rsp + 0x60]
14029a740 488b8424d0000000 mov rax, qword ptr [rsp + 0xd0]
14029a748 4889442460 mov qword ptr [rsp + 0x60], rax
14029a74d 4c896c2468 mov qword ptr [rsp + 0x68], r13
14029a752 488b8424c8000000 mov rax, qword ptr [rsp + 0xc8]
14029a75a 4889442470 mov qword ptr [rsp + 0x70], rax
14029a75f 897c2478 mov dword ptr [rsp + 0x78], edi
14029a763 896c247c mov dword ptr [rsp + 0x7c], ebp
14029a767 4c8d8c2480000000 lea r9, [rsp + 0x80]
14029a76f 488b8424c0000000 mov rax, qword ptr [rsp + 0xc0]
14029a777 4889842480000000 mov qword ptr [rsp + 0x80], rax
14029a77f 488b8424b8000000 mov rax, qword ptr [rsp + 0xb8]
14029a787 4889842488000000 mov qword ptr [rsp + 0x88], rax
14029a78f 4c89a42490000000 mov qword ptr [rsp + 0x90], r12
14029a797 89bc2498000000 mov dword ptr [rsp + 0x98], edi
14029a79e 89ac249c000000 mov dword ptr [rsp + 0x9c], ebp
14029a7a5 488d8424a0000000 lea rax, [rsp + 0xa0]
14029a7ad 488d4e28 lea rcx, [rsi + 0x28]
14029a7b1 48898c24a0000000 mov qword ptr [rsp + 0xa0], rcx
14029a7b9 48899c24a8000000 mov qword ptr [rsp + 0xa8], rbx
14029a7c1 89bc24b0000000 mov dword ptr [rsp + 0xb0], edi
14029a7c8 89ac24b4000000 mov dword ptr [rsp + 0xb4], ebp
14029a7cf 4889442420 mov qword ptr [rsp + 0x20], rax
14029a7d4 488d542440 lea rdx, [rsp + 0x40]
14029a7d9 e8c2c4feff call 0x140286ca0
14029a7de 892e mov dword ptr [rsi], ebp
14029a7e0 488b8424e0000000 mov rax, qword ptr [rsp + 0xe0]
14029a7e8 48c700fdffffff mov qword ptr [rax], 0xfffffffffffffffd
14029a7ef 4881c4e8000000 add rsp, 0xe8
14029a7f6 5b pop rbx
14029a7f7 5d pop rbp
14029a7f8 5f pop rdi
14029a7f9 5e pop rsi
14029a7fa 415c pop r12
14029a7fc 415d pop r13
14029a7fe 415e pop r14
14029a800 415f pop r15
14029a802 c3 ret
14029a803 488d0d2e7db505 lea rcx, [rip + 0x5b57d2e]
14029a80a 4c8d05877db505 lea r8, [rip + 0x5b57d87]
14029a811 ba59000000 mov edx, 0x59
14029a816 e855edaf05 call 0x145d99570
14029a81b 0f0b ud2
14029a81d 4883c608 add rsi, 8
14029a821 488d05f87db505 lea rax, [rip + 0x5b57df8]
14029a828 4889442428 mov qword ptr [rsp + 0x28], rax
14029a82d 48c7442420df000000 mov qword ptr [rsp + 0x20], 0xdf
14029a836 4c8d0d737db505 lea r9, [rip + 0x5b57d73]
14029a83d 4c8d442440 lea r8, [rsp + 0x40]
14029a842 31c9 xor ecx, ecx
14029a844 4889f2 mov rdx, rsi
14029a847 e8d1e0aa05 call 0x145d4891d
14029a84c 0f0b ud2
14029a84e 4883c604 add rsi, 4
14029a852 4889742440 mov qword ptr [rsp + 0x40], rsi
14029a857 488d05a22ad604 lea rax, [rip + 0x4d62aa2]
14029a85e 4889442448 mov qword ptr [rsp + 0x48], rax
14029a863 488d4c243f lea rcx, [rsp + 0x3f]
14029a868 48894c2450 mov qword ptr [rsp + 0x50], rcx
14029a86d 4889442458 mov qword ptr [rsp + 0x58], rax
14029a872 488d0def79b505 lea rcx, [rip + 0x5b579ef]
14029a879 4c8d05887ab505 lea r8, [rip + 0x5b57a88]
14029a880 488d542440 lea rdx, [rsp + 0x40]
14029a885 e8a6efaf05 call 0x145d99830
14029a88a 0f0b ud2
14029a88c 4883c604 add rsi, 4
14029a890 4889742440 mov qword ptr [rsp + 0x40], rsi
14029a895 488d05642ad604 lea rax, [rip + 0x4d62a64]
14029a89c 4889442448 mov qword ptr [rsp + 0x48], rax
14029a8a1 488d4c243f lea rcx, [rsp + 0x3f]
14029a8a6 48894c2450 mov qword ptr [rsp + 0x50], rcx
14029a8ab 4889442458 mov qword ptr [rsp + 0x58], rax
14029a8b0 488d0db179b505 lea rcx, [rip + 0x5b579b1]
14029a8b7 4c8d05627ab505 lea r8, [rip + 0x5b57a62]
14029a8be 488d542440 lea rdx, [rsp + 0x40]
14029a8c3 e868efaf05 call 0x145d99830
14029a8c8 0f0b ud2
