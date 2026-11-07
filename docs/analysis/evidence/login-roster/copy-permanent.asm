1458e86e0 55 push rbp
1458e86e1 4157 push r15
1458e86e3 4156 push r14
1458e86e5 4154 push r12
1458e86e7 56 push rsi
1458e86e8 57 push rdi
1458e86e9 53 push rbx
1458e86ea 4881ec80000000 sub rsp, 0x80
1458e86f1 488dac2480000000 lea rbp, [rsp + 0x80]
1458e86f9 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
1458e8701 498b00 mov rax, qword ptr [r8]
1458e8704 4d8b4808 mov r9, qword ptr [r8 + 8]
1458e8708 4839d1 cmp rcx, rdx
1458e870b 0f84c4000000 je 0x1458e87d5
1458e8711 4889ce mov rsi, rcx
1458e8714 488945e8 mov qword ptr [rbp - 0x18], rax
1458e8718 4829ca sub rdx, rcx
1458e871b 48c1ea03 shr rdx, 3
1458e871f 48b99324499224499224 movabs rcx, 0x2492492492492493
1458e8729 4889d0 mov rax, rdx
1458e872c 48f7e1 mul rcx
1458e872f 4889d7 mov rdi, rdx
1458e8732 4c8d75db lea r14, [rbp - 0x25]
1458e8736 4c894df0 mov qword ptr [rbp - 0x10], r9
1458e873a 4d6bf938 imul r15, r9, 0x38
1458e873e 4d037810 add r15, qword ptr [r8 + 0x10]
1458e8742 48f7df neg rdi
1458e8745 31c0 xor eax, eax
1458e8747 488d5da8 lea rbx, [rbp - 0x58]
1458e874b 0f1f440000 nop dword ptr [rax + rax]
1458e8750 488945e0 mov qword ptr [rbp - 0x20], rax
1458e8754 4c8b6618 mov r12, qword ptr [rsi + 0x18]
1458e8758 4889d9 mov rcx, rbx
1458e875b 4889f2 mov rdx, rsi
1458e875e e88d4b2e00 call 0x145bcd2f0
1458e8763 90 nop
1458e8764 0fb74630 movzx eax, word ptr [rsi + 0x30]
1458e8768 0fb64e32 movzx ecx, byte ptr [rsi + 0x32]
1458e876c 0fb65637 movzx edx, byte ptr [rsi + 0x37]
1458e8770 41885604 mov byte ptr [r14 + 4], dl
1458e8774 8b5633 mov edx, dword ptr [rsi + 0x33]
1458e8777 418916 mov dword ptr [r14], edx
1458e877a 4c8965c0 mov qword ptr [rbp - 0x40], r12
1458e877e 668945d8 mov word ptr [rbp - 0x28], ax
1458e8782 884dda mov byte ptr [rbp - 0x26], cl
1458e8785 0f104620 movups xmm0, xmmword ptr [rsi + 0x20]
1458e8789 0f1145c8 movups xmmword ptr [rbp - 0x38], xmm0
1458e878d 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458e8791 49894730 mov qword ptr [r15 + 0x30], rax
1458e8795 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458e8799 49894710 mov qword ptr [r15 + 0x10], rax
1458e879d 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458e87a1 49894718 mov qword ptr [r15 + 0x18], rax
1458e87a5 0f1045a8 movups xmm0, xmmword ptr [rbp - 0x58]
1458e87a9 410f1107 movups xmmword ptr [r15], xmm0
1458e87ad 0f1045c8 movups xmm0, xmmword ptr [rbp - 0x38]
1458e87b1 410f114720 movups xmmword ptr [r15 + 0x20], xmm0
1458e87b6 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458e87ba 48ffc8 dec rax
1458e87bd 4983c738 add r15, 0x38
1458e87c1 4883c638 add rsi, 0x38
1458e87c5 4839c7 cmp rdi, rax
1458e87c8 7586 jne 0x1458e8750
1458e87ca 4c8b4df0 mov r9, qword ptr [rbp - 0x10]
1458e87ce 4929c1 sub r9, rax
1458e87d1 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458e87d5 4c8908 mov qword ptr [rax], r9
1458e87d8 4881c480000000 add rsp, 0x80
1458e87df 5b pop rbx
1458e87e0 5f pop rdi
1458e87e1 5e pop rsi
1458e87e2 415c pop r12
1458e87e4 415e pop r14
1458e87e6 415f pop r15
1458e87e8 5d pop rbp
1458e87e9 c3 ret
