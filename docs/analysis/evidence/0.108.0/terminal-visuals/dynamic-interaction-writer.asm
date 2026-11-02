140129dd0 4157 push r15
140129dd2 4156 push r14
140129dd4 56 push rsi
140129dd5 57 push rdi
140129dd6 53 push rbx
140129dd7 4883ec40 sub rsp, 0x40
140129ddb 488d056e9dca05 lea rax, [rip + 0x5ca9d6e]
140129de2 4889442430 mov qword ptr [rsp + 0x30], rax
140129de7 48c74424382a000000 mov qword ptr [rsp + 0x38], 0x2a
140129df0 80795800 cmp byte ptr [rcx + 0x58], 0
140129df4 0f85f3000000 jne 0x140129eed
140129dfa 4889ce mov rsi, rcx
140129dfd 488b4148 mov rax, qword ptr [rcx + 0x48]
140129e01 f60001 test byte ptr [rax], 1
140129e04 0f84b3000000 je 0x140129ebd
140129e0a f30f6f4008 movdqu xmm0, xmmword ptr [rax + 8]
140129e0f 660f740509d4c605 pcmpeqb xmm0, xmmword ptr [rip + 0x5c6d409]
140129e17 660fd7c0 pmovmskb eax, xmm0
140129e1b 3dffff0000 cmp eax, 0xffff
140129e20 0f8597000000 jne 0x140129ebd
140129e26 4c8b7610 mov r14, qword ptr [rsi + 0x10]
140129e2a 488b7e30 mov rdi, qword ptr [rsi + 0x30]
140129e2e 488b4e38 mov rcx, qword ptr [rsi + 0x38]
140129e32 488b4110 mov rax, qword ptr [rcx + 0x10]
140129e36 488b5820 mov rbx, qword ptr [rax + 0x20]
140129e3a 483b18 cmp rbx, qword ptr [rax]
140129e3d 745b je 0x140129e9a
140129e3f 48ffcb dec rbx
140129e42 48895820 mov qword ptr [rax + 0x20], rbx
140129e46 8813 mov byte ptr [rbx], dl
140129e48 4c8b7f10 mov r15, qword ptr [rdi + 0x10]
140129e4c 4c3b3f cmp r15, qword ptr [rdi]
140129e4f 7508 jne 0x140129e59
140129e51 4889f9 mov rcx, rdi
140129e54 e8e7adac05 call 0x145bf4c40
140129e59 488b4708 mov rax, qword ptr [rdi + 8]
140129e5d 4e8934f8 mov qword ptr [rax + r15*8], r14
140129e61 49ffc7 inc r15
140129e64 4c897f10 mov qword ptr [rdi + 0x10], r15
140129e68 4c8b7728 mov r14, qword ptr [rdi + 0x28]
140129e6c 4c3b7718 cmp r14, qword ptr [rdi + 0x18]
140129e70 7509 jne 0x140129e7b
140129e72 488d4f18 lea rcx, [rdi + 0x18]
140129e76 e8c5adac05 call 0x145bf4c40
140129e7b 488b4720 mov rax, qword ptr [rdi + 0x20]
140129e7f 4a891cf0 mov qword ptr [rax + r14*8], rbx
140129e83 49ffc6 inc r14
140129e86 4c897728 mov qword ptr [rdi + 0x28], r14
140129e8a c6465801 mov byte ptr [rsi + 0x58], 1
140129e8e 4883c440 add rsp, 0x40
140129e92 5b pop rbx
140129e93 5f pop rdi
140129e94 5e pop rsi
140129e95 415e pop r14
140129e97 415f pop r15
140129e99 c3 ret
140129e9a 89d3 mov ebx, edx
140129e9c ba01000000 mov edx, 1
140129ea1 41b801000000 mov r8d, 1
140129ea7 e8f466c205 call 0x145d505a0
140129eac 89da mov edx, ebx
140129eae 4889c3 mov rbx, rax
140129eb1 4885c0 test rax, rax
140129eb4 7590 jne 0x140129e46
140129eb6 e8b577c205 call 0x145d51670
140129ebb 0f0b ud2
140129ebd 488d442430 lea rax, [rsp + 0x30]
140129ec2 4889442420 mov qword ptr [rsp + 0x20], rax
140129ec7 488d05d2dfec04 lea rax, [rip + 0x4ecdfd2]
140129ece 4889442428 mov qword ptr [rsp + 0x28], rax
140129ed3 488d0da09cca05 lea rcx, [rip + 0x5ca9ca0]
140129eda 4c8d054f9dca05 lea r8, [rip + 0x5ca9d4f]
140129ee1 488d542420 lea rdx, [rsp + 0x20]
140129ee6 e8859bc605 call 0x145d93a70
140129eeb 0f0b ud2
140129eed 488d442430 lea rax, [rsp + 0x30]
140129ef2 4889442420 mov qword ptr [rsp + 0x20], rax
140129ef7 488d05a2dfec04 lea rax, [rip + 0x4ecdfa2]
140129efe 4889442428 mov qword ptr [rsp + 0x28], rax
140129f03 488d0d3e9dca05 lea rcx, [rip + 0x5ca9d3e]
140129f0a 4c8d05679dca05 lea r8, [rip + 0x5ca9d67]
140129f11 488d542420 lea rdx, [rsp + 0x20]
140129f16 e8559bc605 call 0x145d93a70
140129f1b 0f0b ud2
