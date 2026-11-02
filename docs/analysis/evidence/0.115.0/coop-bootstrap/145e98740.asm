145e98740 push rbp
145e98741 push rsi
145e98742 sub rsp, 0x58
145e98746 lea rbp, [rsp + 0x50]
145e9874b mov qword ptr [rbp], 0xfffffffffffffffe
145e98753 mov rsi, rcx
145e98756 call 0x140002200
145e9875b mov ecx, 0x20
145e98760 mov edx, 1
145e98765 call 0x1400021c0
145e9876a test rax, rax
145e9876d je 0x145e98809
145e98773 mov word ptr [rbp - 8], 0x209
145e98779 mov qword ptr [rbp - 0x20], 0x20
145e98781 mov qword ptr [rbp - 0x18], rax
145e98785 mov qword ptr [rbp - 0x10], 0
145e9878d mov qword ptr [rsp + 0x20], 1
145e98796 lea rcx, [rbp - 0x20]
145e9879a mov r8d, 0x80
145e987a0 mov r9d, 1
145e987a6 xor edx, edx
145e987a8 call 0x145d14a10
145e987ad nop
145e987ae mov rax, qword ptr [rbp - 0x18]
145e987b2 mov rcx, qword ptr [rbp - 0x10]
145e987b6 xorps xmm0, xmm0
145e987b9 movups xmmword ptr [rax + rcx + 0x70], xmm0
145e987be movups xmmword ptr [rax + rcx + 0x60], xmm0
145e987c3 movups xmmword ptr [rax + rcx + 0x50], xmm0
145e987c8 movups xmmword ptr [rax + rcx + 0x40], xmm0
145e987cd movups xmmword ptr [rax + rcx + 0x30], xmm0
145e987d2 movups xmmword ptr [rax + rcx + 0x20], xmm0
145e987d7 movups xmmword ptr [rax + rcx + 0x10], xmm0
145e987dc movups xmmword ptr [rax + rcx], xmm0
145e987e0 sub rcx, -0x80
145e987e4 mov qword ptr [rbp - 0x10], rcx
145e987e8 movups xmm0, xmmword ptr [rbp - 0x20]
145e987ec movups xmmword ptr [rsi], xmm0
145e987ef mov rax, qword ptr [rbp - 0x10]
145e987f3 mov qword ptr [rsi + 0x10], rax
145e987f7 mov rax, qword ptr [rbp - 8]
145e987fb mov qword ptr [rsi + 0x18], rax
145e987ff mov rax, rsi
145e98802 add rsp, 0x58
145e98806 pop rsi
145e98807 pop rbp
145e98808 ret
145e98809 mov ecx, 1
145e9880e mov edx, 0x20
145e98813 call 0x145eb6fcb
145e98818 ud2
