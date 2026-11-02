140017550 push rbp
140017551 push r15
140017553 push r14
140017555 push r13
140017557 push r12
140017559 push rsi
14001755a push rdi
14001755b push rbx
14001755c sub rsp, 0xd08
140017563 lea rbp, [rsp + 0x80]
14001756b movaps xmmword ptr [rbp + 0xc70], xmm6
140017572 mov qword ptr [rbp + 0xc68], 0xfffffffffffffffe
14001757d mov rsi, r9
140017580 mov qword ptr [rbp + 0xc20], r8
140017587 mov r8, rdx
14001758a mov rdx, rcx
14001758d lea rcx, [rbp + 0x200]
140017594 call 0x145cb6440
140017599 cmp dword ptr [rbp + 0x200], 2
1400175a0 jne 0x1400175bd
1400175a2 mov rax, qword ptr [rbp + 0x208]
1400175a9 mov qword ptr [rbp + 0x938], rax
1400175b0 mov qword ptr [rbp + 0x930], 2
1400175bb jmp 0x1400175e0
1400175bd lea rcx, [rbp + 0x930]
1400175c4 lea rdx, [rbp + 0x200]
1400175cb mov r8d, 0x270
1400175d1 call 0x145cf998b
1400175d6 cmp qword ptr [rbp + 0x930], 2
1400175de jne 0x1400175f1
1400175e0 lea rcx, [rbp + 0x930]
1400175e7 call 0x1400031a0
1400175ec jmp 0x1400178f0
1400175f1 lea rcx, [rbp + 0x6c0]
1400175f8 lea r14, [rbp + 0x930]
1400175ff mov r8d, 0x270
140017605 mov rdx, r14
140017608 call 0x145cf998b
14001760d mov qword ptr [rbp + 0x200], 0
140017618 mov qword ptr [rbp + 0x460], 0
140017623 lea r15, [rbp - 0x58]
140017627 lea rdi, [rbp + 0xba0]
14001762e nop
140017630 mov rcx, r15
140017633 lea rdx, [rbp + 0x200]
14001763a call 0x14001d220
14001763f nop
140017640 cmp qword ptr [rbp - 0x58], 0
140017645 je 0x1400178e4
14001764b mov r8d, 0x258
140017651 mov rcx, r14
140017654 mov rdx, r15
140017657 call 0x145cf998b
14001765c mov r12d, dword ptr [rbp + 0x938]
140017663 mov r13d, dword ptr [rbp + 0x95c]
14001766a movsd xmm6, qword ptr [rbp + 0x94c]
140017672 lea rcx, [rbp + 0xbe0]
140017679 mov rdx, r14
14001767c call 0x145cad730
140017681 nop
140017682 mov r9, qword ptr [rbp + 0xbe8]
140017689 mov rbx, qword ptr [rbp + 0xbf0]
140017690 mov qword ptr [rsp + 0x20], rbx
140017695 lea rcx, [rbp + 0xc28]
14001769c mov rdx, qword ptr [rbp + 0xc20]
1400176a3 mov r8, rsi
1400176a6 mov qword ptr [rbp + 0xc50], r9
1400176ad call 0x145ca61b0
1400176b2 nop
1400176b3 test r12d, 0x400
1400176ba je 0x1400176c9
1400176bc test r13d, 0x20000000
1400176c3 jne 0x14001781f
1400176c9 test r12b, 0x10
1400176cd jne 0x1400177b0
1400176d3 movups xmm0, xmmword ptr [rbp + 0xc28]
1400176da movups xmm1, xmmword ptr [rbp + 0xc38]
1400176e1 movaps xmmword ptr [rbp + 0xc10], xmm1
1400176e8 movaps xmmword ptr [rbp + 0xc00], xmm0
1400176ef mov byte ptr [rbp + 0xc67], 0
1400176f6 mov rcx, rdi
1400176f9 mov rdx, qword ptr [rbp + 0xcf0]
140017700 lea r8, [rbp + 0xc00]
140017707 call 0x14011d790
14001770c nop
14001770d mov byte ptr [rbp + 0xc67], 0
140017714 mov rcx, rdi
140017717 call 0x14011cd60
14001771c nop
14001771d mov rbx, rax
140017720 mov byte ptr [rbp + 0xc67], 0
140017727 mov rcx, rdi
14001772a mov rdx, r14
14001772d call 0x145cad620
140017732 nop
140017733 mov rax, qword ptr [rbp + 0xba0]
14001773a mov qword ptr [rbp + 0xc58], rax
140017741 mov rax, qword ptr [rbp + 0xba8]
140017748 mov qword ptr [rbp + 0xc48], rax
14001774f lea rax, [rbp + 0xbb0]
140017756 movups xmm0, xmmword ptr [rax]
140017759 movaps xmmword ptr [rbp + 0xc00], xmm0
140017760 mov r12, qword ptr [rbx + 0x10]
140017764 cmp r12, qword ptr [rbx]
140017767 jne 0x140017772
140017769 mov rcx, rbx
14001776c call 0x145cfa150
140017771 nop
140017772 mov rax, qword ptr [rbx + 8]
140017776 lea rcx, [r12 + r12*4]
14001777a movlps qword ptr [rax + rcx*8], xmm6
14001777e mov rdx, qword ptr [rbp + 0xc58]
140017785 mov qword ptr [rax + rcx*8 + 8], rdx
14001778a mov rdx, qword ptr [rbp + 0xc48]
140017791 mov qword ptr [rax + rcx*8 + 0x10], rdx
140017796 movaps xmm0, xmmword ptr [rbp + 0xc00]
14001779d movups xmmword ptr [rax + rcx*8 + 0x18], xmm0
1400177a2 inc r12
1400177a5 mov qword ptr [rbx + 0x10], r12
1400177a9 jmp 0x14001783d
1400177ae nop
1400177b0 test rsi, rsi
1400177b3 je 0x14001787a
1400177b9 mov byte ptr [rbp + 0xc67], 1
1400177c0 mov rcx, rdi
1400177c3 mov rdx, r14
1400177c6 call 0x145cad620
1400177cb nop
1400177cc mov rcx, qword ptr [rbp + 0xba8]
1400177d3 mov rdx, qword ptr [rbp + 0xbb0]
1400177da mov r8, qword ptr [rbp + 0xc30]
1400177e1 mov r9, qword ptr [rbp + 0xc38]
1400177e8 mov rax, qword ptr [rbp + 0xcf0]
1400177ef mov qword ptr [rsp + 0x20], rax
1400177f4 mov qword ptr [rbp + 0xc58], rcx
1400177fb call 0x140017550
140017800 nop
140017801 mov rdx, qword ptr [rbp + 0xba0]
140017808 test rdx, rdx
14001780b je 0x14001781f
14001780d mov r8d, 1
140017813 mov rcx, qword ptr [rbp + 0xc58]
14001781a call 0x1400021d0
14001781f mov rdx, qword ptr [rbp + 0xc28]
140017826 test rdx, rdx
140017829 je 0x14001783d
14001782b mov rcx, qword ptr [rbp + 0xc30]
140017832 mov r8d, 1
140017838 call 0x1400021d0
14001783d mov rdx, qword ptr [rbp + 0xbe0]
140017844 test rdx, rdx
140017847 je 0x14001785b
140017849 mov r8d, 1
14001784f mov rcx, qword ptr [rbp + 0xc50]
140017856 call 0x1400021d0
14001785b mov rax, qword ptr [rbp + 0x930]
140017862 lock dec qword ptr [rax]
140017866 jne 0x140017630
14001786c mov rcx, r14
14001786f call 0x1434f8460
140017874 nop
140017875 jmp 0x140017630
14001787a cmp rbx, 5
14001787e je 0x1400178c0
140017880 cmp rbx, 0xb
140017884 jne 0x1400177b9
14001788a mov rcx, qword ptr [rbp + 0xc50]
140017891 mov rax, qword ptr [rcx]
140017894 movabs rdx, 0x74736f6e67616944
14001789e xor rax, rdx
1400178a1 mov rcx, qword ptr [rcx + 3]
1400178a5 movabs rdx, 0x73636974736f6e67
1400178af xor rcx, rdx
1400178b2 or rcx, rax
1400178b5 jne 0x1400177b9
1400178bb jmp 0x14001781f
1400178c0 mov rcx, qword ptr [rbp + 0xc50]
1400178c7 mov eax, dword ptr [rcx]
1400178c9 mov edx, 0x68636163
1400178ce xor eax, edx
1400178d0 movzx ecx, byte ptr [rcx + 4]
1400178d4 xor ecx, 0x65
1400178d7 or ecx, eax
1400178d9 jne 0x1400177b9
1400178df jmp 0x14001781f
1400178e4 lea rcx, [rbp + 0x200]
1400178eb call 0x1400046d0
1400178f0 movaps xmm6, xmmword ptr [rbp + 0xc70]
1400178f7 add rsp, 0xd08
1400178fe pop rbx
1400178ff pop rdi
140017900 pop rsi
140017901 pop r12
140017903 pop r13
140017905 pop r14
140017907 pop r15
140017909 pop rbp
14001790a ret
