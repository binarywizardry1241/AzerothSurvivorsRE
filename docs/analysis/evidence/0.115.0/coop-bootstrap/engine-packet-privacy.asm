14584a6e0 movzx edx, word ptr [rcx + 0x18]
14584a6e4 xor eax, eax
14584a6e6 cmp edx, 0x1ca
14584a6ec jg 0x14584a71b
14584a6ee cmp edx, 0xc6
14584a6f4 jle 0x14584a74b
14584a6f6 lea ecx, [rdx - 0xe2]
14584a6fc cmp ecx, 0x9e
14584a702 ja 0x14584a7a9
14584a708 lea rdx, [rip + 0x17c1a29]
14584a70f movsxd rcx, dword ptr [rdx + rcx*4]
14584a713 add rcx, rdx
14584a716 jmp rcx
14584a718 mov al, 1
14584a71a ret
14584a71b lea ecx, [rdx - 0x1cb]
14584a721 cmp ecx, 0x13
14584a724 jbe 0x14584a776
14584a726 lea ecx, [rdx - 0x24e]
14584a72c cmp ecx, 0x29
14584a72f ja 0x14584a741
14584a731 movabs r8, 0x20000000005
14584a73b bt r8, rcx
14584a73f jb 0x14584a718
14584a741 cmp edx, 0x224
14584a747 je 0x14584a718
14584a749 jmp 0x14584a799
14584a74b cmp edx, 0x96
14584a751 je 0x14584a784
14584a753 cmp edx, 0xa9
14584a759 je 0x14584a79a
14584a75b cmp edx, 0xaa
14584a761 jne 0x14584a799
14584a763 cmp qword ptr [rcx + 0x10], 8
14584a768 jb 0x14584a7a6
14584a76a mov rax, qword ptr [rcx + 8]
14584a76e cmp word ptr [rax + 6], 0x4000
14584a774 jmp 0x14584a796
14584a776 mov r8d, 0x80021
14584a77c bt r8d, ecx
14584a780 jb 0x14584a718
14584a782 jmp 0x14584a726
14584a784 cmp qword ptr [rcx + 0x10], 0
14584a789 je 0x14584a7a6
14584a78b mov rax, qword ptr [rcx + 8]
14584a78f movzx eax, byte ptr [rax]
14584a792 add al, 0xfa
14584a794 test al, 0xfb
14584a796 sete al
14584a799 ret
14584a79a mov rdx, qword ptr [rcx + 0x10]
14584a79e cmp rdx, 6
14584a7a2 jb 0x14584a7a6
14584a7a4 jne 0x14584a7b7
14584a7a6 xor eax, eax
14584a7a8 ret
14584a7a9 cmp edx, 0xc7
14584a7af je 0x14584a718
14584a7b5 jmp 0x14584a799
14584a7b7 mov rcx, qword ptr [rcx + 8]
14584a7bb movzx r9d, byte ptr [rcx + 5]
14584a7c0 movzx eax, byte ptr [rcx + 6]
14584a7c4 mov r8d, 7
14584a7ca test al, 1
14584a7cc je 0x14584a7da
14584a7ce mov r8d, 8
14584a7d4 cmp rdx, 7
14584a7d8 je 0x14584a7a6
14584a7da test al, 2
14584a7dc je 0x14584a7e6
14584a7de cmp r8, rdx
14584a7e1 jae 0x14584a7a6
14584a7e3 inc r8
14584a7e6 test al, 4
14584a7e8 je 0x14584a7f2
14584a7ea cmp r8, rdx
14584a7ed jae 0x14584a7a6
14584a7ef inc r8
14584a7f2 test al, 8
14584a7f4 je 0x14584a7fe
14584a7f6 cmp r8, rdx
14584a7f9 jae 0x14584a7a6
14584a7fb inc r8
14584a7fe test al, 0x10
14584a800 je 0x14584a80a
14584a802 cmp r8, rdx
14584a805 jae 0x14584a7a6
14584a807 inc r8
14584a80a test al, 0x20
14584a80c je 0x14584a816
14584a80e cmp r8, rdx
14584a811 jae 0x14584a7a6
14584a813 inc r8
14584a816 test al, 0x40
14584a818 jne 0x14584a81f
14584a81a xor r10d, r10d
14584a81d jmp 0x14584a830
14584a81f cmp r8, rdx
14584a822 jae 0x14584a7a6
14584a824 movzx r10d, byte ptr [rcx + r8]
14584a829 shl r10, 0x30
14584a82d inc r8
14584a830 test al, al
14584a832 jns 0x14584a84c
14584a834 cmp r8, rdx
14584a837 jae 0x14584a7a6
14584a83d movzx eax, byte ptr [rcx + r8]
14584a842 shl rax, 0x38
14584a846 or r10, rax
14584a849 inc r8
14584a84c shr r10, 0x30
14584a850 mov al, 1
14584a852 cmp r10d, 0x4000
14584a859 je 0x14584a799
14584a85f cmp r9b, 3
14584a863 jne 0x14584a7a6
14584a869 inc r8
14584a86c cmp r8, rdx
14584a86f jae 0x14584a7a6
14584a875 movzx eax, byte ptr [rcx + r8]
14584a87a and al, 1
14584a87c ret
