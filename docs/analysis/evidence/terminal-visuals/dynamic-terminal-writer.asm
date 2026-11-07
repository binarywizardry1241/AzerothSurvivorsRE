14012ca30 4157 push r15
14012ca32 4156 push r14
14012ca34 56 push rsi
14012ca35 57 push rdi
14012ca36 53 push rbx
14012ca37 4883ec40 sub rsp, 0x40
14012ca3b 488d050e71ca05 lea rax, [rip + 0x5ca710e]
14012ca42 4889442430 mov qword ptr [rsp + 0x30], rax
14012ca47 48c74424382a000000 mov qword ptr [rsp + 0x38], 0x2a
14012ca50 80795800 cmp byte ptr [rcx + 0x58], 0
14012ca54 0f85f3000000 jne 0x14012cb4d
14012ca5a 4889ce mov rsi, rcx
14012ca5d 488b4148 mov rax, qword ptr [rcx + 0x48]
14012ca61 f60001 test byte ptr [rax], 1
14012ca64 0f84b3000000 je 0x14012cb1d
14012ca6a f30f6f4008 movdqu xmm0, xmmword ptr [rax + 8]
14012ca6f 660f740559a9c605 pcmpeqb xmm0, xmmword ptr [rip + 0x5c6a959]
14012ca77 660fd7c0 pmovmskb eax, xmm0
14012ca7b 3dffff0000 cmp eax, 0xffff
14012ca80 0f8597000000 jne 0x14012cb1d
14012ca86 4c8b7610 mov r14, qword ptr [rsi + 0x10]
14012ca8a 488b7e30 mov rdi, qword ptr [rsi + 0x30]
14012ca8e 488b4e38 mov rcx, qword ptr [rsi + 0x38]
14012ca92 488b4110 mov rax, qword ptr [rcx + 0x10]
14012ca96 488b5820 mov rbx, qword ptr [rax + 0x20]
14012ca9a 483b18 cmp rbx, qword ptr [rax]
14012ca9d 745b je 0x14012cafa
14012ca9f 48ffcb dec rbx
14012caa2 48895820 mov qword ptr [rax + 0x20], rbx
14012caa6 8813 mov byte ptr [rbx], dl
14012caa8 4c8b7f10 mov r15, qword ptr [rdi + 0x10]
14012caac 4c3b3f cmp r15, qword ptr [rdi]
14012caaf 7508 jne 0x14012cab9
14012cab1 4889f9 mov rcx, rdi
14012cab4 e88781ac05 call 0x145bf4c40
14012cab9 488b4708 mov rax, qword ptr [rdi + 8]
14012cabd 4e8934f8 mov qword ptr [rax + r15*8], r14
14012cac1 49ffc7 inc r15
14012cac4 4c897f10 mov qword ptr [rdi + 0x10], r15
14012cac8 4c8b7728 mov r14, qword ptr [rdi + 0x28]
14012cacc 4c3b7718 cmp r14, qword ptr [rdi + 0x18]
14012cad0 7509 jne 0x14012cadb
14012cad2 488d4f18 lea rcx, [rdi + 0x18]
14012cad6 e86581ac05 call 0x145bf4c40
14012cadb 488b4720 mov rax, qword ptr [rdi + 0x20]
14012cadf 4a891cf0 mov qword ptr [rax + r14*8], rbx
14012cae3 49ffc6 inc r14
14012cae6 4c897728 mov qword ptr [rdi + 0x28], r14
14012caea c6465801 mov byte ptr [rsi + 0x58], 1
14012caee 4883c440 add rsp, 0x40
14012caf2 5b pop rbx
14012caf3 5f pop rdi
14012caf4 5e pop rsi
14012caf5 415e pop r14
14012caf7 415f pop r15
14012caf9 c3 ret
14012cafa 89d3 mov ebx, edx
14012cafc ba01000000 mov edx, 1
14012cb01 41b801000000 mov r8d, 1
14012cb07 e8943ac205 call 0x145d505a0
14012cb0c 89da mov edx, ebx
14012cb0e 4889c3 mov rbx, rax
14012cb11 4885c0 test rax, rax
14012cb14 7590 jne 0x14012caa6
14012cb16 e8554bc205 call 0x145d51670
14012cb1b 0f0b ud2
14012cb1d 488d442430 lea rax, [rsp + 0x30]
14012cb22 4889442420 mov qword ptr [rsp + 0x20], rax
14012cb27 488d0572b3ec04 lea rax, [rip + 0x4ecb372]
14012cb2e 4889442428 mov qword ptr [rsp + 0x28], rax
14012cb33 488d0d4070ca05 lea rcx, [rip + 0x5ca7040]
14012cb3a 4c8d05ef70ca05 lea r8, [rip + 0x5ca70ef]
14012cb41 488d542420 lea rdx, [rsp + 0x20]
14012cb46 e8256fc605 call 0x145d93a70
14012cb4b 0f0b ud2
14012cb4d 488d442430 lea rax, [rsp + 0x30]
14012cb52 4889442420 mov qword ptr [rsp + 0x20], rax
14012cb57 488d0542b3ec04 lea rax, [rip + 0x4ecb342]
14012cb5e 4889442428 mov qword ptr [rsp + 0x28], rax
14012cb63 488d0dde70ca05 lea rcx, [rip + 0x5ca70de]
14012cb6a 4c8d050771ca05 lea r8, [rip + 0x5ca7107]
14012cb71 488d542420 lea rdx, [rsp + 0x20]
14012cb76 e8f56ec605 call 0x145d93a70
14012cb7b 0f0b ud2
