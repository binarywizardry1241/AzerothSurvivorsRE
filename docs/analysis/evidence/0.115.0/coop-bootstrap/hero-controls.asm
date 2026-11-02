1458ee600 push rbp
1458ee601 push r15
1458ee603 push r14
1458ee605 push r13
1458ee607 push r12
1458ee609 push rsi
1458ee60a push rdi
1458ee60b push rbx
1458ee60c mov eax, 0x1358
1458ee611 call 0x145d13ac0
1458ee616 sub rsp, rax
1458ee619 lea rbp, [rsp + 0x80]
1458ee621 mov qword ptr [rbp + 0x12d0], 0xfffffffffffffffe
1458ee62c mov rsi, rcx
1458ee62f test rdx, rdx
1458ee632 je 0x1458ee643
1458ee634 mov r13, qword ptr [rsi + 0x988]
1458ee63b mov r15, r13
1458ee63e sub r15, rdx
1458ee641 jae 0x1458ee66c
1458ee643 movzx ecx, byte ptr [r8]
1458ee647 movzx eax, byte ptr [r8 + 1]
1458ee64c movzx edx, al
1458ee64f lea r8, [rip + 0x1a4430e]
1458ee656 movsxd rcx, dword ptr [r8 + rcx*4]
1458ee65a add rcx, r8
1458ee65d jmp rcx
1458ee65f mov rcx, rsi
1458ee662 call 0x14597e730
1458ee667 jmp 0x1458eea4b
1458ee66c mov qword ptr [rbp + 0x12b0], r8
1458ee673 mov qword ptr [rbp + 0x12b8], rdx
1458ee67a lea rax, [rdx - 1]
1458ee67e cmp rax, r13
1458ee681 mov qword ptr [rbp + 0x12c0], rax
1458ee688 jae 0x1458eea7b
1458ee68e mov rbx, qword ptr [rsi + 0x980]
1458ee695 imul rdi, rax, 0x980
1458ee69c lea r12, [rbx + rdi]
1458ee6a0 mov r14, qword ptr [rbx + rdi]
1458ee6a4 lea rdx, [rbx + rdi]
1458ee6a8 add rdx, 8
1458ee6ac lea rcx, [rbp + 0x928]
1458ee6b3 mov r8d, 0x978
1458ee6b9 call 0x145d145fb
1458ee6be lea rdx, [rbx + rdi]
1458ee6c2 add rdx, 0x980
1458ee6c9 imul r8, r15, 0x980
1458ee6d0 mov rcx, r12
1458ee6d3 call 0x145d14607
1458ee6d8 dec r13
1458ee6db mov qword ptr [rsi + 0x988], r13
1458ee6e2 cmp r14, 2
1458ee6e6 je 0x1458eea7b
1458ee6ec mov qword ptr [rbp - 0x58], r14
1458ee6f0 lea rcx, [rbp - 0x50]
1458ee6f4 lea rdx, [rbp + 0x928]
1458ee6fb mov r8d, 0x978
1458ee701 call 0x145d145fb
1458ee706 cmp byte ptr [rsi + 0xc41], 1
1458ee70d mov rbx, qword ptr [rbp + 0x12c0]
1458ee714 jne 0x1458ee810
1458ee71a mov rax, qword ptr [rsi + 0xb40]
1458ee721 mov qword ptr [rbp + 0x12a8], rax
1458ee728 lea rax, [rsi + 0x630]
1458ee72f mov rcx, qword ptr [rsi + 0x638]
1458ee736 mov rdx, qword ptr [rsi + 0x640]
1458ee73d mov qword ptr [rsi + 0x640], 0
1458ee748 mov qword ptr [rbp + 0x940], rdx
1458ee74f shl rdx, 5
1458ee753 add rdx, rcx
1458ee756 mov qword ptr [rbp + 0x948], 0
1458ee761 mov qword ptr [rbp + 0x928], rcx
1458ee768 mov qword ptr [rbp + 0x930], rdx
1458ee76f mov qword ptr [rbp + 0x938], rax
1458ee776 lea rcx, [rsi + 0xa38]
1458ee77d lea r14, [rbp + 0x12a8]
1458ee784 mov qword ptr [rbp + 0x950], r14
1458ee78b mov byte ptr [rbp + 0x12cf], 1
1458ee792 lea rdx, [rbp + 0x928]
1458ee799 call 0x1459bc540
1458ee79e nop
1458ee79f lea rax, [rsi + 0x648]
1458ee7a6 mov rcx, qword ptr [rsi + 0x650]
1458ee7ad mov rdx, qword ptr [rsi + 0x658]
1458ee7b4 mov qword ptr [rsi + 0x658], 0
1458ee7bf lea r8, [rdx + rdx*2]
1458ee7c3 lea r8, [rcx + r8*8]
1458ee7c7 mov qword ptr [rbp + 0x940], rdx
1458ee7ce mov qword ptr [rbp + 0x948], 0
1458ee7d9 mov qword ptr [rbp + 0x928], rcx
1458ee7e0 mov qword ptr [rbp + 0x930], r8
1458ee7e7 mov qword ptr [rbp + 0x938], rax
1458ee7ee lea rcx, [rsi + 0xa50]
1458ee7f5 mov qword ptr [rbp + 0x950], r14
1458ee7fc mov byte ptr [rbp + 0x12cf], 1
1458ee803 lea rdx, [rbp + 0x928]
1458ee80a call 0x1459bc470
1458ee80f nop
1458ee810 lea rdx, [rbp - 0x58]
1458ee814 mov rcx, rsi
1458ee817 call 0x145920ed0
1458ee81c mov rax, qword ptr [rbp + 0x12b8]
1458ee823 mov qword ptr [rsi + 0xb40], rax
1458ee82a mov rcx, qword ptr [rsi + 0x2d0]
1458ee831 mov rdx, qword ptr [rsi + 0x2d8]
1458ee838 mov byte ptr [rbp + 0x12cf], 1
1458ee83f mov r8, qword ptr [rbp + 0x12b0]
1458ee846 mov r9, rsi
1458ee849 call 0x1458dc460
1458ee84e nop
1458ee84f mov byte ptr [rbp + 0x12cf], 1
1458ee856 mov rcx, rsi
1458ee859 call 0x145901040
1458ee85e nop
1458ee85f mov qword ptr [rsi + 0xb40], 0
1458ee86a lea r14, [rbp - 0x58]
1458ee86e mov rcx, rsi
1458ee871 mov rdx, r14
1458ee874 call 0x145920ed0
1458ee879 lea rcx, [rbp + 0x928]
1458ee880 mov r8d, 0x980
1458ee886 mov rdx, r14
1458ee889 call 0x145d145fb
1458ee88e mov r14, qword ptr [rsi + 0x988]
1458ee895 cmp r14, rbx
1458ee898 jb 0x1458eea66
1458ee89e lea rcx, [rsi + 0x978]
1458ee8a5 cmp r14, qword ptr [rcx]
1458ee8a8 jne 0x1458ee8b0
1458ee8aa call 0x145e984e0
1458ee8af nop
1458ee8b0 add rdi, qword ptr [rsi + 0x980]
1458ee8b7 mov rax, r14
1458ee8ba sub rax, rbx
1458ee8bd jbe 0x1458ee8d5
1458ee8bf lea rcx, [rdi + 0x980]
1458ee8c6 imul r8, rax, 0x980
1458ee8cd mov rdx, rdi
1458ee8d0 call 0x145d14607
1458ee8d5 lea rdx, [rbp + 0x928]
1458ee8dc mov r8d, 0x980
1458ee8e2 mov rcx, rdi
1458ee8e5 call 0x145d145fb
1458ee8ea inc r14
1458ee8ed mov qword ptr [rsi + 0x988], r14
1458ee8f4 add rsp, 0x1358
1458ee8fb pop rbx
1458ee8fc pop rdi
1458ee8fd pop rsi
1458ee8fe pop r12
1458ee900 pop r13
1458ee902 pop r14
1458ee904 pop r15
1458ee906 pop rbp
1458ee907 ret
1458ee908 cmp byte ptr [rsi + 0xc46], 2
1458ee90f jne 0x1458eea4b
1458ee915 cmp byte ptr [rsi + 0x2a6], 0
1458ee91c je 0x1458eea4b
1458ee922 movzx ebx, byte ptr [rsi + 0xc44]
1458ee929 cmp bl, 0xff
1458ee92c je 0x1458eea4b
1458ee932 mov eax, dword ptr [rsi + 0xbf4]
1458ee938 shr eax, 2
1458ee93b cmp eax, 0xb
1458ee93e mov edx, 0xa
1458ee943 cmovae edx, eax
1458ee946 mov rcx, rsi
1458ee949 call 0x145920470
1458ee94e mov rcx, rsi
1458ee951 mov edx, ebx
1458ee953 call 0x145976180
1458ee958 jmp 0x1458eea4b
1458ee95d mov byte ptr [rsi + 0xc30], al
1458ee963 jmp 0x1458eea4b
1458ee968 mov rcx, rsi
1458ee96b call 0x145981ea0
1458ee970 jmp 0x1458eea4b
1458ee975 mov rcx, rsi
1458ee978 call 0x14597e5e0
1458ee97d jmp 0x1458eea4b
1458ee982 mov byte ptr [rsi + 0xc37], al
1458ee988 jmp 0x1458eea4b
1458ee98d movzx eax, byte ptr [rsi + 0xc46]
1458ee994 dec al
1458ee996 cmp al, 2
1458ee998 ja 0x1458eea4b
1458ee99e mov rdi, qword ptr [rsi + 0x668]
1458ee9a5 mov rbx, qword ptr [rsi + 0x670]
1458ee9ac mov qword ptr [rsi + 0x670], 0
1458ee9b7 test rbx, rbx
1458ee9ba je 0x1458ee9d4
1458ee9bc nop dword ptr [rax]
1458ee9c0 mov rcx, rdi
1458ee9c3 call 0x1458f1180
1458ee9c8 add rdi, 0xa0
1458ee9cf dec rbx
1458ee9d2 jne 0x1458ee9c0
1458ee9d4 mov byte ptr [rsi + 0xc44], 0xff
1458ee9db mov byte ptr [rsi + 0xc33], 1
1458ee9e2 mov rcx, rsi
1458ee9e5 call 0x14590e9b0
1458ee9ea jmp 0x1458eea4b
1458ee9ec cmp dword ptr [rsi + 0xbb0], 0
1458ee9f3 je 0x1458eea4b
1458ee9f5 cmp byte ptr [rsi + 0xc46], 1
1458ee9fc jne 0x1458eea4b
1458ee9fe cmp byte ptr [rsi + 0xc44], 0xff
1458eea05 jne 0x1458eea4b
1458eea07 mov byte ptr [rsi + 0xc39], 1
1458eea0e cmp byte ptr [rsi + 0xc3c], 0
1458eea15 je 0x1458eea3e
1458eea17 jmp 0x1458eea4b
1458eea19 and al, 1
1458eea1b mov byte ptr [rsi + 0xc38], al
1458eea21 jne 0x1458eea4b
1458eea23 cmp dword ptr [rsi + 0xbb0], 0
1458eea2a je 0x1458eea4b
1458eea2c cmp byte ptr [rsi + 0xc3c], 0
1458eea33 jne 0x1458eea4b
1458eea35 cmp byte ptr [rsi + 0xc46], 1
1458eea3c jne 0x1458eea4b
1458eea3e mov rcx, rsi
1458eea41 xor edx, edx
1458eea43 mov r8b, 1
1458eea46 call 0x1459747f0
1458eea4b mov rcx, rsi
1458eea4e add rsp, 0x1358
1458eea55 pop rbx
1458eea56 pop rdi
1458eea57 pop rsi
1458eea58 pop r12
1458eea5a pop r13
1458eea5c pop r14
1458eea5e pop r15
1458eea60 pop rbp
1458eea61 jmp 0x145901040
1458eea66 lea r8, [rip + 0x1a40c43]
1458eea6d mov rcx, rbx
1458eea70 mov rdx, r14
1458eea73 call 0x145eb7014
1458eea78 nop
1458eea79 ud2
1458eea7b lea r8, [rip + 0x1a40c16]
1458eea82 mov rcx, qword ptr [rbp + 0x12c0]
1458eea89 mov rdx, r13
1458eea8c call 0x145eb709b
1458eea91 ud2
