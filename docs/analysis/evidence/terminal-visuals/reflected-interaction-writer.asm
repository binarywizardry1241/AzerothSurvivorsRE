142620110 4157 push r15
142620112 4156 push r14
142620114 56 push rsi
142620115 57 push rdi
142620116 53 push rbx
142620117 4883ec40 sub rsp, 0x40
14262011b 488b4108 mov rax, qword ptr [rcx + 8]
14262011f 48833801 cmp qword ptr [rax], 1
142620123 0f85de000000 jne 0x142620207
142620129 f30f6f4008 movdqu xmm0, xmmword ptr [rax + 8]
14262012e 660f7405ea707703 pcmpeqb xmm0, xmmword ptr [rip + 0x37770ea]
142620136 660fd7c0 pmovmskb eax, xmm0
14262013a 3dffff0000 cmp eax, 0xffff
14262013f 0f85c2000000 jne 0x142620207
142620145 488b01 mov rax, qword ptr [rcx]
142620148 0fb618 movzx ebx, byte ptr [rax]
14262014b 488d05ae7ac503 lea rax, [rip + 0x3c57aae]
142620152 4889442430 mov qword ptr [rsp + 0x30], rax
142620157 48c74424382a000000 mov qword ptr [rsp + 0x38], 0x2a
142620160 807a5800 cmp byte ptr [rdx + 0x58], 0
142620164 0f85fe000000 jne 0x142620268
14262016a 488b4248 mov rax, qword ptr [rdx + 0x48]
14262016e f60001 test byte ptr [rax], 1
142620171 0f84c1000000 je 0x142620238
142620177 f30f6f4008 movdqu xmm0, xmmword ptr [rax + 8]
14262017c 660f74059c707703 pcmpeqb xmm0, xmmword ptr [rip + 0x377709c]
142620184 660fd7c0 pmovmskb eax, xmm0
142620188 3dffff0000 cmp eax, 0xffff
14262018d 0f85a5000000 jne 0x142620238
142620193 4c8b7210 mov r14, qword ptr [rdx + 0x10]
142620197 488b7230 mov rsi, qword ptr [rdx + 0x30]
14262019b 488b4a38 mov rcx, qword ptr [rdx + 0x38]
14262019f 488b4110 mov rax, qword ptr [rcx + 0x10]
1426201a3 488b7820 mov rdi, qword ptr [rax + 0x20]
1426201a7 483b38 cmp rdi, qword ptr [rax]
1426201aa 7467 je 0x142620213
1426201ac 48ffcf dec rdi
1426201af 48897820 mov qword ptr [rax + 0x20], rdi
1426201b3 881f mov byte ptr [rdi], bl
1426201b5 488b5e10 mov rbx, qword ptr [rsi + 0x10]
1426201b9 483b1e cmp rbx, qword ptr [rsi]
1426201bc 750e jne 0x1426201cc
1426201be 4889f1 mov rcx, rsi
1426201c1 4989d7 mov r15, rdx
1426201c4 e8774a5d03 call 0x145bf4c40
1426201c9 4c89fa mov rdx, r15
1426201cc 488b4608 mov rax, qword ptr [rsi + 8]
1426201d0 4c8934d8 mov qword ptr [rax + rbx*8], r14
1426201d4 48ffc3 inc rbx
1426201d7 48895e10 mov qword ptr [rsi + 0x10], rbx
1426201db 488b5e28 mov rbx, qword ptr [rsi + 0x28]
1426201df 483b5e18 cmp rbx, qword ptr [rsi + 0x18]
1426201e3 750f jne 0x1426201f4
1426201e5 488d4e18 lea rcx, [rsi + 0x18]
1426201e9 4989d6 mov r14, rdx
1426201ec e84f4a5d03 call 0x145bf4c40
1426201f1 4c89f2 mov rdx, r14
1426201f4 488b4620 mov rax, qword ptr [rsi + 0x20]
1426201f8 48893cd8 mov qword ptr [rax + rbx*8], rdi
1426201fc 48ffc3 inc rbx
1426201ff 48895e28 mov qword ptr [rsi + 0x28], rbx
142620203 c6425801 mov byte ptr [rdx + 0x58], 1
142620207 4883c440 add rsp, 0x40
14262020b 5b pop rbx
14262020c 5f pop rdi
14262020d 5e pop rsi
14262020e 415e pop r14
142620210 415f pop r15
142620212 c3 ret
142620213 4889d7 mov rdi, rdx
142620216 ba01000000 mov edx, 1
14262021b 41b801000000 mov r8d, 1
142620221 e87a037303 call 0x145d505a0
142620226 4889fa mov rdx, rdi
142620229 4889c7 mov rdi, rax
14262022c 4885c0 test rax, rax
14262022f 7582 jne 0x1426201b3
142620231 e83a147303 call 0x145d51670
142620236 0f0b ud2
142620238 488d442430 lea rax, [rsp + 0x30]
14262023d 4889442420 mov qword ptr [rsp + 0x20], rax
142620242 488d05577c9d02 lea rax, [rip + 0x29d7c57]
142620249 4889442428 mov qword ptr [rsp + 0x28], rax
14262024e 488d0dd579c503 lea rcx, [rip + 0x3c579d5]
142620255 4c8d05847ac503 lea r8, [rip + 0x3c57a84]
14262025c 488d542420 lea rdx, [rsp + 0x20]
142620261 e80a387703 call 0x145d93a70
142620266 0f0b ud2
142620268 488d442430 lea rax, [rsp + 0x30]
14262026d 4889442420 mov qword ptr [rsp + 0x20], rax
142620272 488d05277c9d02 lea rax, [rip + 0x29d7c27]
142620279 4889442428 mov qword ptr [rsp + 0x28], rax
14262027e 488d0d737ac503 lea rcx, [rip + 0x3c57a73]
142620285 4c8d059c7ac503 lea r8, [rip + 0x3c57a9c]
14262028c 488d542420 lea rdx, [rsp + 0x20]
142620291 e8da377703 call 0x145d93a70
142620296 0f0b ud2
