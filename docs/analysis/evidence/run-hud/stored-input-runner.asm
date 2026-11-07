140296690 4157 push r15
140296692 4156 push r14
140296694 56 push rsi
140296695 57 push rdi
140296696 55 push rbp
140296697 53 push rbx
140296698 4883ec78 sub rsp, 0x78
14029669c bd01000000 mov ebp, 1
1402966a1 f0410fc1a8b0050000 lock xadd dword ptr [r8 + 0x5b0], ebp
1402966aa 4883ba00010000ff cmp qword ptr [rdx + 0x100], -1
1402966b2 0f84d4000000 je 0x14029678c
1402966b8 4c89c3 mov rbx, r8
1402966bb 4889d6 mov rsi, rdx
1402966be 498b80a0050000 mov rax, qword ptr [r8 + 0x5a0]
1402966c5 4889442440 mov qword ptr [rsp + 0x40], rax
1402966ca 48394208 cmp qword ptr [rdx + 8], rax
1402966ce 0f85d2000000 jne 0x1402967a6
1402966d4 4889cf mov rdi, rcx
1402966d7 4c8d7610 lea r14, [rsi + 0x10]
1402966db 448b3e mov r15d, dword ptr [rsi]
1402966de 4c89f1 mov rcx, r14
1402966e1 4889da mov rdx, rbx
1402966e4 e877da0f00 call 0x140394160
1402966e9 488b8638010000 mov rax, qword ptr [rsi + 0x138]
1402966f0 483b8318020000 cmp rax, qword ptr [rbx + 0x218]
1402966f7 0f83da000000 jae 0x1402967d7
1402966fd 488b8b10020000 mov rcx, qword ptr [rbx + 0x210]
140296704 488b0cc1 mov rcx, qword ptr [rcx + rax*8]
140296708 4885c9 test rcx, rcx
14029670b 0f84c6000000 je 0x1402967d7
140296711 488b83e0010000 mov rax, qword ptr [rbx + 0x1e0]
140296718 48f7d1 not rcx
14029671b 486bc938 imul rcx, rcx, 0x38
14029671f 807c083000 cmp byte ptr [rax + rcx + 0x30], 0
140296724 0f84ad000000 je 0x1402967d7
14029672a 4801c8 add rax, rcx
14029672d 488b4810 mov rcx, qword ptr [rax + 0x10]
140296731 488d5028 lea rdx, [rax + 0x28]
140296735 4883c02c add rax, 0x2c
140296739 4c89742440 mov qword ptr [rsp + 0x40], r14
14029673e 48895c2448 mov qword ptr [rsp + 0x48], rbx
140296743 44897c2450 mov dword ptr [rsp + 0x50], r15d
140296748 896c2454 mov dword ptr [rsp + 0x54], ebp
14029674c 4c8d442458 lea r8, [rsp + 0x58]
140296751 48894c2458 mov qword ptr [rsp + 0x58], rcx
140296756 4889542460 mov qword ptr [rsp + 0x60], rdx
14029675b 4889442468 mov qword ptr [rsp + 0x68], rax
140296760 44897c2470 mov dword ptr [rsp + 0x70], r15d
140296765 896c2474 mov dword ptr [rsp + 0x74], ebp
140296769 488d542440 lea rdx, [rsp + 0x40]
14029676e e8cd5fffff call 0x14028c740
140296773 892e mov dword ptr [rsi], ebp
140296775 48c707fdffffff mov qword ptr [rdi], 0xfffffffffffffffd
14029677c 4889f8 mov rax, rdi
14029677f 4883c478 add rsp, 0x78
140296783 5b pop rbx
140296784 5d pop rbp
140296785 5f pop rdi
140296786 5e pop rsi
140296787 415e pop r14
140296789 415f pop r15
14029678b c3 ret
14029678c 488d0da5bdb505 lea rcx, [rip + 0x5b5bda5]
140296793 4c8d05febdb505 lea r8, [rip + 0x5b5bdfe]
14029679a ba59000000 mov edx, 0x59
14029679f e8cc2db005 call 0x145d99570
1402967a4 0f0b ud2
1402967a6 4883c608 add rsi, 8
1402967aa 488d056fbeb505 lea rax, [rip + 0x5b5be6f]
1402967b1 4889442428 mov qword ptr [rsp + 0x28], rax
1402967b6 48c7442420df000000 mov qword ptr [rsp + 0x20], 0xdf
1402967bf 4c8d0deabdb505 lea r9, [rip + 0x5b5bdea]
1402967c6 4c8d442440 lea r8, [rsp + 0x40]
1402967cb 31c9 xor ecx, ecx
1402967cd 4889f2 mov rdx, rsi
1402967d0 e84821ab05 call 0x145d4891d
1402967d5 0f0b ud2
1402967d7 4883c604 add rsi, 4
1402967db 4889742440 mov qword ptr [rsp + 0x40], rsi
1402967e0 488d05196bd604 lea rax, [rip + 0x4d66b19]
1402967e7 4889442448 mov qword ptr [rsp + 0x48], rax
1402967ec 488d4c243f lea rcx, [rsp + 0x3f]
1402967f1 48894c2450 mov qword ptr [rsp + 0x50], rcx
1402967f6 4889442458 mov qword ptr [rsp + 0x58], rax
1402967fb 488d0d66bab505 lea rcx, [rip + 0x5b5ba66]
140296802 4c8d05ffbab505 lea r8, [rip + 0x5b5baff]
140296809 488d542440 lea rdx, [rsp + 0x40]
14029680e e81d30b005 call 0x145d99830
140296813 0f0b ud2
