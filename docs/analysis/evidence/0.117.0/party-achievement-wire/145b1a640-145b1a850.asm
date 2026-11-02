145b1a640 55 push rbp
145b1a641 4157 push r15
145b1a643 4156 push r14
145b1a645 56 push rsi
145b1a646 57 push rdi
145b1a647 53 push rbx
145b1a648 4881ec88000000 sub rsp, 0x88
145b1a64f 488dac2480000000 lea rbp, [rsp + 0x80]
145b1a657 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
145b1a65f 83b9a00c000001 cmp dword ptr [rcx + 0xca0], 1
145b1a666 7707 ja 0x145b1a66f
145b1a668 c681d10f000000 mov byte ptr [rcx + 0xfd1], 0
145b1a66f 488bb118100000 mov rsi, qword ptr [rcx + 0x1018]
145b1a676 4885f6 test rsi, rsi
145b1a679 0f8471010000 je 0x145b1a7f0
145b1a67f 488bb910100000 mov rdi, qword ptr [rcx + 0x1010]
145b1a686 4869c6b0000000 imul rax, rsi, 0xb0
145b1a68d 31db xor ebx, ebx
145b1a68f 31d2 xor edx, edx
145b1a691 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b1a6a0 80bc17a800000000 cmp byte ptr [rdi + rdx + 0xa8], 0
145b1a6a8 7514 jne 0x145b1a6be
145b1a6aa 48ffc3 inc rbx
145b1a6ad 4881c2b0000000 add rdx, 0xb0
145b1a6b4 4839d0 cmp rax, rdx
145b1a6b7 75e7 jne 0x145b1a6a0
145b1a6b9 e932010000 jmp 0x145b1a7f0
145b1a6be 4989cf mov r15, rcx
145b1a6c1 c68417a800000000 mov byte ptr [rdi + rdx + 0xa8], 0
145b1a6c9 4c8d75d0 lea r14, [rbp - 0x30]
145b1a6cd ba08000000 mov edx, 8
145b1a6d2 4c89f1 mov rcx, r14
145b1a6d5 4531c0 xor r8d, r8d
145b1a6d8 4531c9 xor r9d, r9d
145b1a6db e840500400 call 0x145b5f720
145b1a6e0 4889f9 mov rcx, rdi
145b1a6e3 4889f2 mov rdx, rsi
145b1a6e6 4989d8 mov r8, rbx
145b1a6e9 4d89f1 mov r9, r14
145b1a6ec e86f28feff call 0x145afcf60
145b1a6f1 e80a7b4efa call 0x140002200
145b1a6f6 b920000000 mov ecx, 0x20
145b1a6fb ba01000000 mov edx, 1
145b1a700 e8bb7a4efa call 0x1400021c0
145b1a705 4885c0 test rax, rax
145b1a708 0f8420010000 je 0x145b1a82e
145b1a70e 66c745e84d00 mov word ptr [rbp - 0x18], 0x4d
145b1a714 48c745d020000000 mov qword ptr [rbp - 0x30], 0x20
145b1a71c 488945d8 mov qword ptr [rbp - 0x28], rax
145b1a720 48c745e000000000 mov qword ptr [rbp - 0x20], 0
145b1a728 4c8d4dd0 lea r9, [rbp - 0x30]
145b1a72c 4889f9 mov rcx, rdi
145b1a72f 4889f2 mov rdx, rsi
145b1a732 4989d8 mov r8, rbx
145b1a735 e82628feff call 0x145afcf60
145b1a73a 498bb7a0170000 mov rsi, qword ptr [r15 + 0x17a0]
145b1a741 498bbfa8170000 mov rdi, qword ptr [r15 + 0x17a8]
145b1a748 e8b37a4efa call 0x140002200
145b1a74d b901000000 mov ecx, 1
145b1a752 ba01000000 mov edx, 1
145b1a757 e8647a4efa call 0x1400021c0
145b1a75c 4885c0 test rax, rax
145b1a75f 0f84da000000 je 0x145b1a83f
145b1a765 c6007b mov byte ptr [rax], 0x7b
145b1a768 48c745d001000000 mov qword ptr [rbp - 0x30], 1
145b1a770 488945d8 mov qword ptr [rbp - 0x28], rax
145b1a774 48c745e001000000 mov qword ptr [rbp - 0x20], 1
145b1a77c c645e801 mov byte ptr [rbp - 0x18], 1
145b1a780 488d0521fe7b01 lea rax, [rip + 0x17bfe21]
145b1a787 4889442420 mov qword ptr [rsp + 0x20], rax
145b1a78c 48c744242806000000 mov qword ptr [rsp + 0x28], 6
145b1a795 4c8d05effa7b01 lea r8, [rip + 0x17bfaef]
145b1a79c 488d4db0 lea rcx, [rbp - 0x50]
145b1a7a0 488d55d0 lea rdx, [rbp - 0x30]
145b1a7a4 41b904000000 mov r9d, 4
145b1a7aa e871f4fbff call 0x145ad9c20
145b1a7af 488b45b0 mov rax, qword ptr [rbp - 0x50]
145b1a7b3 4c8b45c0 mov r8, qword ptr [rbp - 0x40]
145b1a7b7 4c39c0 cmp rax, r8
145b1a7ba 7444 je 0x145b1a800
145b1a7bc 488945f8 mov qword ptr [rbp - 8], rax
145b1a7c0 488b55b8 mov rdx, qword ptr [rbp - 0x48]
145b1a7c4 42c604027d mov byte ptr [rdx + r8], 0x7d
145b1a7c9 49ffc0 inc r8
145b1a7cc 4889f1 mov rcx, rsi
145b1a7cf 488955f0 mov qword ptr [rbp - 0x10], rdx
145b1a7d3 ff5718 call qword ptr [rdi + 0x18]
145b1a7d6 90 nop
145b1a7d7 488b55f8 mov rdx, qword ptr [rbp - 8]
145b1a7db 4885d2 test rdx, rdx
145b1a7de 7410 je 0x145b1a7f0
145b1a7e0 41b801000000 mov r8d, 1
145b1a7e6 488b4df0 mov rcx, qword ptr [rbp - 0x10]
145b1a7ea e8e1794efa call 0x1400021d0
145b1a7ef 90 nop
145b1a7f0 4881c488000000 add rsp, 0x88
145b1a7f7 5b pop rbx
145b1a7f8 5f pop rdi
145b1a7f9 5e pop rsi
145b1a7fa 415e pop r14
145b1a7fc 415f pop r15
145b1a7fe 5d pop rbp
145b1a7ff c3 ret
145b1a800 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145b1a809 488d4db0 lea rcx, [rbp - 0x50]
145b1a80d 4c89c2 mov rdx, r8
145b1a810 41b801000000 mov r8d, 1
145b1a816 41b901000000 mov r9d, 1
145b1a81c 4889d3 mov rbx, rdx
145b1a81f e8cc984700 call 0x145f940f0
145b1a824 90 nop
145b1a825 488b45b0 mov rax, qword ptr [rbp - 0x50]
145b1a829 4989d8 mov r8, rbx
145b1a82c eb8e jmp 0x145b1a7bc
145b1a82e b901000000 mov ecx, 1
145b1a833 ba20000000 mov edx, 0x20
145b1a838 e87e046200 call 0x14613acbb
145b1a83d 0f0b ud2
145b1a83f b901000000 mov ecx, 1
145b1a844 ba01000000 mov edx, 1
145b1a849 e86d046200 call 0x14613acbb
145b1a84e 0f0b ud2
