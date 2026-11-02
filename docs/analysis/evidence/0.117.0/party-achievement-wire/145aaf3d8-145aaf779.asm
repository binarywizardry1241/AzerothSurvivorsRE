145aaf3d8 488d4d58 lea rcx, [rbp + 0x58]
145aaf3dc b20f mov dl, 0xf
145aaf3de e8cd4e3400 call 0x145df42b0
145aaf3e3 90 nop
145aaf3e4 f30f108fa0000000 movss xmm1, dword ptr [rdi + 0xa0]
145aaf3ec 488d4d58 lea rcx, [rbp + 0x58]
145aaf3f0 e8fb4e3400 call 0x145df42f0
145aaf3f5 90 nop
145aaf3f6 0fb697c7000000 movzx edx, byte ptr [rdi + 0xc7]
145aaf3fd 4889c1 mov rcx, rax
145aaf400 e8ab4e3400 call 0x145df42b0
145aaf405 90 nop
145aaf406 0fb697c4000000 movzx edx, byte ptr [rdi + 0xc4]
145aaf40d 4889c1 mov rcx, rax
145aaf410 e89b4e3400 call 0x145df42b0
145aaf415 90 nop
145aaf416 8b97a4000000 mov edx, dword ptr [rdi + 0xa4]
145aaf41c 4889c1 mov rcx, rax
145aaf41f e82c503400 call 0x145df4450
145aaf424 90 nop
145aaf425 0fb697c5000000 movzx edx, byte ptr [rdi + 0xc5]
145aaf42c 4889c1 mov rcx, rax
145aaf42f e87c4e3400 call 0x145df42b0
145aaf434 90 nop
145aaf435 8b97a8000000 mov edx, dword ptr [rdi + 0xa8]
145aaf43b 488d4d58 lea rcx, [rbp + 0x58]
145aaf43f e80c503400 call 0x145df4450
145aaf444 90 nop
145aaf445 8b97ac000000 mov edx, dword ptr [rdi + 0xac]
145aaf44b 4889c1 mov rcx, rax
145aaf44e e8fd4f3400 call 0x145df4450
145aaf453 90 nop
145aaf454 8b97b0000000 mov edx, dword ptr [rdi + 0xb0]
145aaf45a 4889c1 mov rcx, rax
145aaf45d e8ee4f3400 call 0x145df4450
145aaf462 90 nop
145aaf463 8b97b4000000 mov edx, dword ptr [rdi + 0xb4]
145aaf469 4889c1 mov rcx, rax
145aaf46c e8df4f3400 call 0x145df4450
145aaf471 90 nop
145aaf472 8b97b8000000 mov edx, dword ptr [rdi + 0xb8]
145aaf478 4889c1 mov rcx, rax
145aaf47b e8d04f3400 call 0x145df4450
145aaf480 90 nop
145aaf481 f30f108fbc000000 movss xmm1, dword ptr [rdi + 0xbc]
145aaf489 488d4d58 lea rcx, [rbp + 0x58]
145aaf48d e85e4e3400 call 0x145df42f0
145aaf492 90 nop
145aaf493 f30f108fc0000000 movss xmm1, dword ptr [rdi + 0xc0]
145aaf49b 4889c1 mov rcx, rax
145aaf49e e84d4e3400 call 0x145df42f0
145aaf4a3 90 nop
145aaf4a4 0fb697c6000000 movzx edx, byte ptr [rdi + 0xc6]
145aaf4ab 4889c1 mov rcx, rax
145aaf4ae e8fd4d3400 call 0x145df42b0
145aaf4b3 90 nop
145aaf4b4 0fb697c8000000 movzx edx, byte ptr [rdi + 0xc8]
145aaf4bb 4889c1 mov rcx, rax
145aaf4be e8ed4d3400 call 0x145df42b0
145aaf4c3 90 nop
145aaf4c4 488b5710 mov rdx, qword ptr [rdi + 0x10]
145aaf4c8 4c8b4718 mov r8, qword ptr [rdi + 0x18]
145aaf4cc 4889c1 mov rcx, rax
145aaf4cf e87c4e3400 call 0x145df4350
145aaf4d4 90 nop
145aaf4d5 488b5f30 mov rbx, qword ptr [rdi + 0x30]
145aaf4d9 488d4d58 lea rcx, [rbp + 0x58]
145aaf4dd 89da mov edx, ebx
145aaf4df e86c4f3400 call 0x145df4450
145aaf4e4 90 nop
145aaf4e5 4885db test rbx, rbx
145aaf4e8 743b je 0x145aaf525
145aaf4ea 4c8b7f28 mov r15, qword ptr [rdi + 0x28]
145aaf4ee 4d8d24df lea r12, [r15 + rbx*8]
145aaf4f2 488d5d58 lea rbx, [rbp + 0x58]
145aaf4f6 662e0f1f840000000000 nop word ptr cs:[rax + rax]
145aaf500 418b17 mov edx, dword ptr [r15]
145aaf503 458b7704 mov r14d, dword ptr [r15 + 4]
145aaf507 4889d9 mov rcx, rbx
145aaf50a e8414f3400 call 0x145df4450
145aaf50f 90 nop
145aaf510 4889c1 mov rcx, rax
145aaf513 4489f2 mov edx, r14d
145aaf516 e8354f3400 call 0x145df4450
145aaf51b 90 nop
145aaf51c 4983c708 add r15, 8
145aaf520 4d39e7 cmp r15, r12
145aaf523 75db jne 0x145aaf500
145aaf525 488b5f48 mov rbx, qword ptr [rdi + 0x48]
145aaf529 488d4d58 lea rcx, [rbp + 0x58]
145aaf52d 89da mov edx, ebx
145aaf52f e81c4f3400 call 0x145df4450
145aaf534 90 nop
145aaf535 4885db test rbx, rbx
145aaf538 7462 je 0x145aaf59c
145aaf53a 4c8b7740 mov r14, qword ptr [rdi + 0x40]
145aaf53e 488d045b lea rax, [rbx + rbx*2]
145aaf542 4d8d3c86 lea r15, [r14 + rax*4]
145aaf546 488d5d58 lea rbx, [rbp + 0x58]
145aaf54a 660f1f440000 nop word ptr [rax + rax]
145aaf550 418b16 mov edx, dword ptr [r14]
145aaf553 4889d9 mov rcx, rbx
145aaf556 e8f54e3400 call 0x145df4450
145aaf55b 90 nop
145aaf55c 418b5604 mov edx, dword ptr [r14 + 4]
145aaf560 4889c1 mov rcx, rax
145aaf563 e8e84e3400 call 0x145df4450
145aaf568 90 nop
145aaf569 410fb65608 movzx edx, byte ptr [r14 + 8]
145aaf56e 4889c1 mov rcx, rax
145aaf571 e83a4d3400 call 0x145df42b0
145aaf576 90 nop
145aaf577 410fb65609 movzx edx, byte ptr [r14 + 9]
145aaf57c 4889c1 mov rcx, rax
145aaf57f e82c4d3400 call 0x145df42b0
145aaf584 90 nop
145aaf585 410fb6560a movzx edx, byte ptr [r14 + 0xa]
145aaf58a 4889c1 mov rcx, rax
145aaf58d e81e4d3400 call 0x145df42b0
145aaf592 90 nop
145aaf593 4983c60c add r14, 0xc
145aaf597 4d39fe cmp r14, r15
145aaf59a 75b4 jne 0x145aaf550
145aaf59c 488b5f60 mov rbx, qword ptr [rdi + 0x60]
145aaf5a0 488d4d58 lea rcx, [rbp + 0x58]
145aaf5a4 89da mov edx, ebx
145aaf5a6 e8a54e3400 call 0x145df4450
145aaf5ab 90 nop
145aaf5ac 4885db test rbx, rbx
145aaf5af 7424 je 0x145aaf5d5
145aaf5b1 4c8b7758 mov r14, qword ptr [rdi + 0x58]
145aaf5b5 4d8d3c9e lea r15, [r14 + rbx*4]
145aaf5b9 488d5d58 lea rbx, [rbp + 0x58]
145aaf5bd 0f1f00 nop dword ptr [rax]
145aaf5c0 418b16 mov edx, dword ptr [r14]
145aaf5c3 4889d9 mov rcx, rbx
145aaf5c6 e8854e3400 call 0x145df4450
145aaf5cb 90 nop
145aaf5cc 4983c604 add r14, 4
145aaf5d0 4d39fe cmp r14, r15
145aaf5d3 75eb jne 0x145aaf5c0
145aaf5d5 488b5f68 mov rbx, qword ptr [rdi + 0x68]
145aaf5d9 4883fbff cmp rbx, -1
145aaf5dd 0f95c2 setne dl
145aaf5e0 488d4d58 lea rcx, [rbp + 0x58]
145aaf5e4 e8c74c3400 call 0x145df42b0
145aaf5e9 90 nop
145aaf5ea 4883fbff cmp rbx, -1
145aaf5ee 0f84760c0000 je 0x145ab026a
145aaf5f4 4c8b7770 mov r14, qword ptr [rdi + 0x70]
145aaf5f8 4c8b7f78 mov r15, qword ptr [rdi + 0x78]
145aaf5fc 4983ff05 cmp r15, 5
145aaf600 bb05000000 mov ebx, 5
145aaf605 490f42df cmovb rbx, r15
145aaf609 488d4d58 lea rcx, [rbp + 0x58]
145aaf60d 89da mov edx, ebx
145aaf60f e83c4e3400 call 0x145df4450
145aaf614 90 nop
145aaf615 4d85ff test r15, r15
145aaf618 7447 je 0x145aaf661
145aaf61a 4d8d3cde lea r15, [r14 + rbx*8]
145aaf61e 488d5d58 lea rbx, [rbp + 0x58]
145aaf622 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145aaf630 410fb65604 movzx edx, byte ptr [r14 + 4]
145aaf635 4889d9 mov rcx, rbx
145aaf638 e8734c3400 call 0x145df42b0
145aaf63d 90 nop
145aaf63e 418b16 mov edx, dword ptr [r14]
145aaf641 4889c1 mov rcx, rax
145aaf644 e8074e3400 call 0x145df4450
145aaf649 90 nop
145aaf64a 410fb65605 movzx edx, byte ptr [r14 + 5]
145aaf64f 4889c1 mov rcx, rax
145aaf652 e8594c3400 call 0x145df42b0
145aaf657 90 nop
145aaf658 4983c608 add r14, 8
145aaf65c 4d39fe cmp r14, r15
145aaf65f 75cf jne 0x145aaf630
145aaf661 8b9798000000 mov edx, dword ptr [rdi + 0x98]
145aaf667 488d4d58 lea rcx, [rbp + 0x58]
145aaf66b e8e04d3400 call 0x145df4450
145aaf670 90 nop
145aaf671 0fb6979c000000 movzx edx, byte ptr [rdi + 0x9c]
145aaf678 4889c1 mov rcx, rax
145aaf67b e8304c3400 call 0x145df42b0
145aaf680 90 nop
145aaf681 488b9f90000000 mov rbx, qword ptr [rdi + 0x90]
145aaf688 488d4d58 lea rcx, [rbp + 0x58]
145aaf68c 89da mov edx, ebx
145aaf68e e8bd4d3400 call 0x145df4450
145aaf693 90 nop
145aaf694 4885db test rbx, rbx
145aaf697 0f84cd0b0000 je 0x145ab026a
145aaf69d 4c8bb788000000 mov r14, qword ptr [rdi + 0x88]
145aaf6a4 488d049b lea rax, [rbx + rbx*4]
145aaf6a8 4d8d3cc6 lea r15, [r14 + rax*8]
145aaf6ac 488d7d58 lea rdi, [rbp + 0x58]
145aaf6b0 eb1b jmp 0x145aaf6cd
145aaf6b2 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145aaf6c0 4983c628 add r14, 0x28
145aaf6c4 4d39fe cmp r14, r15
145aaf6c7 0f849d0b0000 je 0x145ab026a
145aaf6cd 418b5618 mov edx, dword ptr [r14 + 0x18]
145aaf6d1 4889f9 mov rcx, rdi
145aaf6d4 e8774d3400 call 0x145df4450
145aaf6d9 90 nop
145aaf6da 418b561c mov edx, dword ptr [r14 + 0x1c]
145aaf6de 4889c1 mov rcx, rax
145aaf6e1 e86a4d3400 call 0x145df4450
145aaf6e6 90 nop
145aaf6e7 410fb65620 movzx edx, byte ptr [r14 + 0x20]
145aaf6ec 4889c1 mov rcx, rax
145aaf6ef e8bc4b3400 call 0x145df42b0
145aaf6f4 90 nop
145aaf6f5 410fb65621 movzx edx, byte ptr [r14 + 0x21]
145aaf6fa 4889c1 mov rcx, rax
145aaf6fd e8ae4b3400 call 0x145df42b0
145aaf702 90 nop
145aaf703 410fb65622 movzx edx, byte ptr [r14 + 0x22]
145aaf708 4889c1 mov rcx, rax
145aaf70b e8a04b3400 call 0x145df42b0
145aaf710 90 nop
145aaf711 4d8b6608 mov r12, qword ptr [r14 + 8]
145aaf715 4d8b6e10 mov r13, qword ptr [r14 + 0x10]
145aaf719 4983fd05 cmp r13, 5
145aaf71d bb05000000 mov ebx, 5
145aaf722 490f42dd cmovb rbx, r13
145aaf726 4889f9 mov rcx, rdi
145aaf729 89da mov edx, ebx
145aaf72b e8204d3400 call 0x145df4450
145aaf730 90 nop
145aaf731 4d85ed test r13, r13
145aaf734 748a je 0x145aaf6c0
145aaf736 498d1cdc lea rbx, [r12 + rbx*8]
145aaf73a 660f1f440000 nop word ptr [rax + rax]
145aaf740 410fb6542404 movzx edx, byte ptr [r12 + 4]
145aaf746 4889f9 mov rcx, rdi
145aaf749 e8624b3400 call 0x145df42b0
145aaf74e 90 nop
145aaf74f 418b1424 mov edx, dword ptr [r12]
145aaf753 4889c1 mov rcx, rax
145aaf756 e8f54c3400 call 0x145df4450
145aaf75b 90 nop
145aaf75c 410fb6542405 movzx edx, byte ptr [r12 + 5]
145aaf762 4889c1 mov rcx, rax
145aaf765 e8464b3400 call 0x145df42b0
145aaf76a 90 nop
145aaf76b 4983c408 add r12, 8
145aaf76f 4939dc cmp r12, rbx
145aaf772 75cc jne 0x145aaf740
145aaf774 e947ffffff jmp 0x145aaf6c0
