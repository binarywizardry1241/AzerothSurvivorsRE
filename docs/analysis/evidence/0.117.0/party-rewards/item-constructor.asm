145ab6630 push rbp
145ab6631 push r15
145ab6633 push r14
145ab6635 push r13
145ab6637 push r12
145ab6639 push rsi
145ab663a push rdi
145ab663b push rbx
145ab663c sub rsp, 0x178
145ab6643 lea rbp, [rsp + 0x80]
145ab664b mov qword ptr [rbp + 0xf0], 0xfffffffffffffffe
145ab6656 mov rsi, rcx
145ab6659 lea eax, [rdx - 0x15f91]
145ab665f cmp eax, 0x71
145ab6662 ja 0x145ab6a64
145ab6668 lea rcx, [rip + 0x1817981]
145ab666f movsxd rax, dword ptr [rcx + rax*4]
145ab6673 add rax, rcx
145ab6676 jmp rax
145ab6678 lea r12, [rip + 0x18125e1]
145ab667f jmp 0x145ab67d2
145ab6684 lea r12, [rip + 0x1812a95]
145ab668b jmp 0x145ab67d2
145ab6690 lea r12, [rip + 0x1812d89]
145ab6697 jmp 0x145ab6917
145ab669c lea r12, [rip + 0x1812e7d]
145ab66a3 jmp 0x145ab6917
145ab66a8 lea r12, [rip + 0x1812df1]
145ab66af jmp 0x145ab6917
145ab66b4 lea r12, [rip + 0x1813065]
145ab66bb jmp 0x145ab6917
145ab66c0 lea r12, [rip + 0x1812f19]
145ab66c7 jmp 0x145ab6917
145ab66cc lea r12, [rip + 0x18128cd]
145ab66d3 jmp 0x145ab67d2
145ab66d8 lea r12, [rip + 0x1812701]
145ab66df jmp 0x145ab67d2
145ab66e4 lea r12, [rip + 0x1812d75]
145ab66eb jmp 0x145ab6917
145ab66f0 lea r12, [rip + 0x1812a69]
145ab66f7 jmp 0x145ab67d2
145ab66fc lea r12, [rip + 0x1812f1d]
145ab6703 jmp 0x145ab6917
145ab6708 lea r12, [rip + 0x1812f91]
145ab670f jmp 0x145ab6917
145ab6714 lea r12, [rip + 0x1812745]
145ab671b jmp 0x145ab67d2
145ab6720 lea r12, [rip + 0x1812779]
145ab6727 jmp 0x145ab67d2
145ab672c lea r12, [rip + 0x18125ed]
145ab6733 jmp 0x145ab67d2
145ab6738 lea r12, [rip + 0x1812621]
145ab673f jmp 0x145ab67d2
145ab6744 lea r12, [rip + 0x1812d95]
145ab674b jmp 0x145ab6917
145ab6750 lea r12, [rip + 0x18127c9]
145ab6757 jmp 0x145ab67d2
145ab6759 lea r12, [rip + 0x1812780]
145ab6760 jmp 0x145ab67d2
145ab6762 lea r12, [rip + 0x18128b7]
145ab6769 jmp 0x145ab67d2
145ab676b lea r12, [rip + 0x181256e]
145ab6772 jmp 0x145ab67d2
145ab6774 lea r12, [rip + 0x18128e5]
145ab677b jmp 0x145ab67d2
145ab677d lea r12, [rip + 0x181251c]
145ab6784 jmp 0x145ab67d2
145ab6786 lea r12, [rip + 0x1812ed3]
145ab678d jmp 0x145ab6917
145ab6792 lea r12, [rip + 0x1812607]
145ab6799 jmp 0x145ab67d2
145ab679b lea r12, [rip + 0x181293e]
145ab67a2 jmp 0x145ab67d2
145ab67a4 lea r12, [rip + 0x1812fb5]
145ab67ab jmp 0x145ab6917
145ab67b0 lea r12, [rip + 0x18127a9]
145ab67b7 jmp 0x145ab67d2
145ab67b9 lea r12, [rip + 0x18128e0]
145ab67c0 jmp 0x145ab67d2
145ab67c2 lea r12, [rip + 0x1812817]
145ab67c9 jmp 0x145ab67d2
145ab67cb lea r12, [rip + 0x181264e]
145ab67d2 lea rax, [r12 + 0x30]
145ab67d7 mov r13d, dword ptr [r12 + 0x30]
145ab67dc mov qword ptr [rbp + 0xa8], rax
145ab67e3 lea rax, [rip + 0x4c1cf6]
145ab67ea mov qword ptr [rbp + 0xb0], rax
145ab67f1 lea rdx, [rip + 0x18111b8]
145ab67f8 mov rcx, rbp
145ab67fb lea r8, [rbp + 0xa8]
145ab6802 call 0x145f66a30
145ab6807 mov rcx, qword ptr [rbp + 8]
145ab680b mov rdx, qword ptr [rbp + 0x10]
145ab680f mov rbx, qword ptr [r12]
145ab6813 mov r15, qword ptr [r12 + 8]
145ab6818 mov qword ptr [rbp + 0xe0], rcx
145ab681f call 0x145b29c00
145ab6824 nop
145ab6825 mov r14, rax
145ab6828 mov rdi, rdx
145ab682b mov rdx, qword ptr [rbp]
145ab682f test rdx, rdx
145ab6832 je 0x145ab6846
145ab6834 mov r8d, 1
145ab683a mov rcx, qword ptr [rbp + 0xe0]
145ab6841 call 0x1400021d0
145ab6846 test r14, r14
145ab6849 cmovne rbx, r14
145ab684d cmove rdi, r15
145ab6851 test rdi, rdi
145ab6854 js 0x145ab699b
145ab685a je 0x145ab6890
145ab685c call 0x140002200
145ab6861 mov r15d, 1
145ab6867 mov edx, 1
145ab686c mov rcx, rdi
145ab686f call 0x1400021c0
145ab6874 test rax, rax
145ab6877 je 0x145ab699e
145ab687d mov r14, rax
145ab6880 mov rcx, rax
145ab6883 mov rdx, rbx
145ab6886 mov r8, rdi
145ab6889 call 0x145f93cdb
145ab688e jmp 0x145ab6896
145ab6890 mov r14d, 1
145ab6896 mov eax, dword ptr [r12 + 0x34]
145ab689b cmp qword ptr [r12 + 0x20], 1
145ab68a1 mov ecx, 2
145ab68a6 sbb rcx, 0
145ab68aa mov qword ptr [rsi], rdi
145ab68ad mov qword ptr [rsi + 8], r14
145ab68b1 mov qword ptr [rsi + 0x10], rdi
145ab68b5 mov qword ptr [rsi + 0x18], 0
145ab68bd mov qword ptr [rsi + 0x20], 4
145ab68c5 mov qword ptr [rsi + 0x28], 0
145ab68cd mov qword ptr [rsi + 0x30], rcx
145ab68d1 mov qword ptr [rsi + 0x38], 0
145ab68d9 mov qword ptr [rsi + 0x48], 0
145ab68e1 mov dword ptr [rsi + 0x50], r13d
145ab68e5 mov dword ptr [rsi + 0x54], eax
145ab68e8 movaps xmm0, xmmword ptr [rip + 0x18104a1]
145ab68ef movups xmmword ptr [rsi + 0x58], xmm0
145ab68f3 mov word ptr [rsi + 0x68], 0x12
145ab68f9 jmp 0x145ab6a4d
145ab68fe lea r12, [rip + 0x1812c9b]
145ab6905 jmp 0x145ab6917
145ab6907 lea r12, [rip + 0x1812c52]
145ab690e jmp 0x145ab6917
145ab6910 lea r12, [rip + 0x1812dc9]
145ab6917 lea rax, [r12 + 0x30]
145ab691c mov r13d, dword ptr [r12 + 0x30]
145ab6921 mov qword ptr [rbp + 0xa8], rax
145ab6928 lea rax, [rip + 0x4c1bb1]
145ab692f mov qword ptr [rbp + 0xb0], rax
145ab6936 lea rdx, [rip + 0x181107d]
145ab693d mov rcx, rbp
145ab6940 lea r8, [rbp + 0xa8]
145ab6947 call 0x145f66a30
145ab694c mov rcx, qword ptr [rbp + 8]
145ab6950 mov rdx, qword ptr [rbp + 0x10]
145ab6954 mov rbx, qword ptr [r12]
145ab6958 mov r15, qword ptr [r12 + 8]
145ab695d mov qword ptr [rbp + 0xe0], rcx
145ab6964 call 0x145b29c00
145ab6969 nop
145ab696a mov r14, rax
145ab696d mov rdi, rdx
145ab6970 mov rdx, qword ptr [rbp]
145ab6974 test rdx, rdx
145ab6977 je 0x145ab698b
145ab6979 mov r8d, 1
145ab697f mov rcx, qword ptr [rbp + 0xe0]
145ab6986 call 0x1400021d0
145ab698b test r14, r14
145ab698e cmovne rbx, r14
145ab6992 cmove rdi, r15
145ab6996 test rdi, rdi
145ab6999 jns 0x145ab69ab
145ab699b xor r15d, r15d
145ab699e mov rcx, r15
145ab69a1 mov rdx, rdi
145ab69a4 call 0x14613acbb
145ab69a9 ud2
145ab69ab je 0x145ab69dd
145ab69ad call 0x140002200
145ab69b2 mov r15d, 1
145ab69b8 mov edx, 1
145ab69bd mov rcx, rdi
145ab69c0 call 0x1400021c0
145ab69c5 test rax, rax
145ab69c8 je 0x145ab699e
145ab69ca mov r14, rax
145ab69cd mov rcx, rax
145ab69d0 mov rdx, rbx
145ab69d3 mov r8, rdi
145ab69d6 call 0x145f93cdb
145ab69db jmp 0x145ab69e3
145ab69dd mov r14d, 1
145ab69e3 movzx eax, byte ptr [r12 + 0x3c]
145ab69e9 mov qword ptr [rsi], rdi
145ab69ec mov qword ptr [rsi + 8], r14
145ab69f0 mov qword ptr [rsi + 0x10], rdi
145ab69f4 mov qword ptr [rsi + 0x18], 0
145ab69fc mov qword ptr [rsi + 0x20], 4
145ab6a04 mov qword ptr [rsi + 0x28], 0
145ab6a0c mov qword ptr [rsi + 0x30], 1
145ab6a14 mov qword ptr [rsi + 0x38], 0
145ab6a1c mov qword ptr [rsi + 0x48], 0
145ab6a24 mov dword ptr [rsi + 0x50], r13d
145ab6a28 movsd xmm0, qword ptr [r12 + 0x34]
145ab6a2f shufps xmm0, xmmword ptr [rip + 0x1810349], 0x94
145ab6a37 shufps xmm0, xmm0, 0x78
145ab6a3b movups xmmword ptr [rsi + 0x54], xmm0
145ab6a3f mov dword ptr [rsi + 0x64], 0
145ab6a46 mov byte ptr [rsi + 0x68], al
145ab6a49 mov byte ptr [rsi + 0x69], 0
145ab6a4d mov rax, rsi
145ab6a50 add rsp, 0x178
145ab6a57 pop rbx
145ab6a58 pop rdi
145ab6a59 pop rsi
145ab6a5a pop r12
145ab6a5c pop r13
145ab6a5e pop r14
145ab6a60 pop r15
145ab6a62 pop rbp
145ab6a63 ret
