1459ca650 55 push rbp
1459ca651 4157 push r15
1459ca653 4156 push r14
1459ca655 4155 push r13
1459ca657 4154 push r12
1459ca659 56 push rsi
1459ca65a 57 push rdi
1459ca65b 53 push rbx
1459ca65c 4883ec38 sub rsp, 0x38
1459ca660 488d6c2430 lea rbp, [rsp + 0x30]
1459ca665 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
1459ca66d 488b7210 mov rsi, qword ptr [rdx + 0x10]
1459ca671 4c8b7218 mov r14, qword ptr [rdx + 0x18]
1459ca675 31db xor ebx, ebx
1459ca677 4d89f5 mov r13, r14
1459ca67a 4929f5 sub r13, rsi
1459ca67d 4c0f42eb cmovb r13, rbx
1459ca681 4c89ef mov rdi, r13
1459ca684 48c1e704 shl rdi, 4
1459ca688 4c89e8 mov rax, r13
1459ca68b 48c1e83c shr rax, 0x3c
1459ca68f 0f95c0 setne al
1459ca692 49b8f8ffffffffffff7f movabs r8, 0x7ffffffffffffff8
1459ca69c 4c39c7 cmp rdi, r8
1459ca69f 410f97c0 seta r8b
1459ca6a3 4108c0 or r8b, al
1459ca6a6 740d je 0x1459ca6b5
1459ca6a8 4889d9 mov rcx, rbx
1459ca6ab 4889fa mov rdx, rdi
1459ca6ae e808ec3c00 call 0x145d992bb
1459ca6b3 0f0b ud2
1459ca6b5 4885ff test rdi, rdi
1459ca6b8 0f8466010000 je 0x1459ca824
1459ca6be 4989cf mov r15, rcx
1459ca6c1 4989d4 mov r12, rdx
1459ca6c4 e8377b63fa call 0x140002200
1459ca6c9 bb08000000 mov ebx, 8
1459ca6ce ba08000000 mov edx, 8
1459ca6d3 4889f9 mov rcx, rdi
1459ca6d6 e8e57a63fa call 0x1400021c0
1459ca6db 4885c0 test rax, rax
1459ca6de 74c8 je 0x1459ca6a8
1459ca6e0 4c89e2 mov rdx, r12
1459ca6e3 4c89f9 mov rcx, r15
1459ca6e6 4c39f6 cmp rsi, r14
1459ca6e9 0f8346010000 jae 0x1459ca835
1459ca6ef 4883fe07 cmp rsi, 7
1459ca6f3 0f8365010000 jae 0x1459ca85e
1459ca6f9 4c8b02 mov r8, qword ptr [rdx]
1459ca6fc 4c8b5a08 mov r11, qword ptr [rdx + 8]
1459ca700 4c8d4e01 lea r9, [rsi + 1]
1459ca704 498b14f0 mov rdx, qword ptr [r8 + rsi*8]
1459ca708 492b14f3 sub rdx, qword ptr [r11 + rsi*8]
1459ca70c 488930 mov qword ptr [rax], rsi
1459ca70f 48895008 mov qword ptr [rax + 8], rdx
1459ca713 ba01000000 mov edx, 1
1459ca718 4d39f1 cmp r9, r14
1459ca71b 0f8416010000 je 0x1459ca837
1459ca721 4883fe06 cmp rsi, 6
1459ca725 0f842b010000 je 0x1459ca856
1459ca72b 4c8d5602 lea r10, [rsi + 2]
1459ca72f 498b54f008 mov rdx, qword ptr [r8 + rsi*8 + 8]
1459ca734 492b54f308 sub rdx, qword ptr [r11 + rsi*8 + 8]
1459ca739 4c894810 mov qword ptr [rax + 0x10], r9
1459ca73d 48895018 mov qword ptr [rax + 0x18], rdx
1459ca741 ba02000000 mov edx, 2
1459ca746 4d39f2 cmp r10, r14
1459ca749 0f84e8000000 je 0x1459ca837
1459ca74f 4883fe04 cmp rsi, 4
1459ca753 0f8702010000 ja 0x1459ca85b
1459ca759 4c8d4e03 lea r9, [rsi + 3]
1459ca75d 498b54f010 mov rdx, qword ptr [r8 + rsi*8 + 0x10]
1459ca762 492b54f310 sub rdx, qword ptr [r11 + rsi*8 + 0x10]
1459ca767 4c895020 mov qword ptr [rax + 0x20], r10
1459ca76b 48895028 mov qword ptr [rax + 0x28], rdx
1459ca76f ba03000000 mov edx, 3
1459ca774 4d39f1 cmp r9, r14
1459ca777 0f84ba000000 je 0x1459ca837
1459ca77d 4883fe04 cmp rsi, 4
1459ca781 0f84cf000000 je 0x1459ca856
1459ca787 4c8d5604 lea r10, [rsi + 4]
1459ca78b 498b54f018 mov rdx, qword ptr [r8 + rsi*8 + 0x18]
1459ca790 492b54f318 sub rdx, qword ptr [r11 + rsi*8 + 0x18]
1459ca795 4c894830 mov qword ptr [rax + 0x30], r9
1459ca799 48895038 mov qword ptr [rax + 0x38], rdx
1459ca79d ba04000000 mov edx, 4
1459ca7a2 4d39f2 cmp r10, r14
1459ca7a5 0f848c000000 je 0x1459ca837
1459ca7ab 4883fe02 cmp rsi, 2
1459ca7af 0f87a6000000 ja 0x1459ca85b
1459ca7b5 4c8d4e05 lea r9, [rsi + 5]
1459ca7b9 498b54f020 mov rdx, qword ptr [r8 + rsi*8 + 0x20]
1459ca7be 492b54f320 sub rdx, qword ptr [r11 + rsi*8 + 0x20]
1459ca7c3 4c895040 mov qword ptr [rax + 0x40], r10
1459ca7c7 48895048 mov qword ptr [rax + 0x48], rdx
1459ca7cb ba05000000 mov edx, 5
1459ca7d0 4d39f1 cmp r9, r14
1459ca7d3 7462 je 0x1459ca837
1459ca7d5 4883fe02 cmp rsi, 2
1459ca7d9 747b je 0x1459ca856
1459ca7db 4c8d5606 lea r10, [rsi + 6]
1459ca7df 498b54f028 mov rdx, qword ptr [r8 + rsi*8 + 0x28]
1459ca7e4 492b54f328 sub rdx, qword ptr [r11 + rsi*8 + 0x28]
1459ca7e9 4c894850 mov qword ptr [rax + 0x50], r9
1459ca7ed 48895058 mov qword ptr [rax + 0x58], rdx
1459ca7f1 ba06000000 mov edx, 6
1459ca7f6 4d39f2 cmp r10, r14
1459ca7f9 743c je 0x1459ca837
1459ca7fb 4885f6 test rsi, rsi
1459ca7fe 755b jne 0x1459ca85b
1459ca800 498b54f030 mov rdx, qword ptr [r8 + rsi*8 + 0x30]
1459ca805 492b54f330 sub rdx, qword ptr [r11 + rsi*8 + 0x30]
1459ca80a 4c895060 mov qword ptr [rax + 0x60], r10
1459ca80e 48895068 mov qword ptr [rax + 0x68], rdx
1459ca812 be07000000 mov esi, 7
1459ca817 ba07000000 mov edx, 7
1459ca81c 4983fe07 cmp r14, 7
1459ca820 7415 je 0x1459ca837
1459ca822 eb3a jmp 0x1459ca85e
1459ca824 b808000000 mov eax, 8
1459ca829 4531ed xor r13d, r13d
1459ca82c 4c39f6 cmp rsi, r14
1459ca82f 0f82bafeffff jb 0x1459ca6ef
1459ca835 31d2 xor edx, edx
1459ca837 4c8929 mov qword ptr [rcx], r13
1459ca83a 48894108 mov qword ptr [rcx + 8], rax
1459ca83e 48895110 mov qword ptr [rcx + 0x10], rdx
1459ca842 4889c8 mov rax, rcx
1459ca845 4883c438 add rsp, 0x38
1459ca849 5b pop rbx
1459ca84a 5f pop rdi
1459ca84b 5e pop rsi
1459ca84c 415c pop r12
1459ca84e 415d pop r13
1459ca850 415e pop r14
1459ca852 415f pop r15
1459ca854 5d pop rbp
1459ca855 c3 ret
1459ca856 4c89ce mov rsi, r9
1459ca859 eb03 jmp 0x1459ca85e
1459ca85b 4c89d6 mov rsi, r10
1459ca85e 488945f0 mov qword ptr [rbp - 0x10], rax
1459ca862 4c896df8 mov qword ptr [rbp - 8], r13
1459ca866 4c8d05abc68601 lea r8, [rip + 0x186c6ab]
1459ca86d ba07000000 mov edx, 7
1459ca872 4889f1 mov rcx, rsi
1459ca875 e8d9ed3c00 call 0x145d99653
1459ca87a 90 nop
1459ca87b 0f0b ud2
