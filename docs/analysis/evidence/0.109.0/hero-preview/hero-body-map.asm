140b3c0f0: 55 push rbp
140b3c0f1: 4157 push r15
140b3c0f3: 4156 push r14
140b3c0f5: 56 push rsi
140b3c0f6: 57 push rdi
140b3c0f7: 53 push rbx
140b3c0f8: 4883ec58 sub rsp, 0x58
140b3c0fc: 488d6c2450 lea rbp, [rsp + 0x50]
140b3c101: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
140b3c109: 4c8b7208 mov r14, qword ptr [rdx + 8]
140b3c10d: 4c2b32 sub r14, qword ptr [rdx]
140b3c110: 48b80078787878787878 movabs rax, 0x7878787878787800
140b3c11a: 4939c6 cmp r14, rax
140b3c11d: 760f jbe 0x140b3c12e
140b3c11f: 31db xor ebx, ebx
140b3c121: 4889d9 mov rcx, rbx
140b3c124: 4889fa mov rdx, rdi
140b3c127: e88fd12505 call 0x145d992bb
140b3c12c: 0f0b ud2
140b3c12e: 4889ce mov rsi, rcx
140b3c131: 4c89f7 mov rdi, r14
140b3c134: 48c1ef04 shr rdi, 4
140b3c138: 4c01f7 add rdi, r14
140b3c13b: 7428 je 0x140b3c165
140b3c13d: 4989d7 mov r15, rdx
140b3c140: e8bb604cff call 0x140002200
140b3c145: bb08000000 mov ebx, 8
140b3c14a: ba08000000 mov edx, 8
140b3c14f: 4889f9 mov rcx, rdi
140b3c152: e869604cff call 0x1400021c0
140b3c157: 4885c0 test rax, rax
140b3c15a: 74c5 je 0x140b3c121
140b3c15c: 49c1ee07 shr r14, 7
140b3c160: 4c89fa mov rdx, r15
140b3c163: eb08 jmp 0x140b3c16d
140b3c165: b808000000 mov eax, 8
140b3c16a: 4531f6 xor r14d, r14d
140b3c16d: 4c8975e8 mov qword ptr [rbp - 0x18], r14
140b3c171: 488945f0 mov qword ptr [rbp - 0x10], rax
140b3c175: 488d4df8 lea rcx, [rbp - 8]
140b3c179: 48c745f800000000 mov qword ptr [rbp - 8], 0
140b3c181: 488945e0 mov qword ptr [rbp - 0x20], rax
140b3c185: 48894dd0 mov qword ptr [rbp - 0x30], rcx
140b3c189: 48c745d800000000 mov qword ptr [rbp - 0x28], 0
140b3c191: 488d45d0 lea rax, [rbp - 0x30]
140b3c195: 4889d1 mov rcx, rdx
140b3c198: 4889c2 mov rdx, rax
140b3c19b: e8d0f44700 call 0x140fbb670
140b3c1a0: 90 nop
140b3c1a1: 488b45f8 mov rax, qword ptr [rbp - 8]
140b3c1a5: 48894610 mov qword ptr [rsi + 0x10], rax
140b3c1a9: 0f1045e8 movups xmm0, xmmword ptr [rbp - 0x18]
140b3c1ad: 0f1106 movups xmmword ptr [rsi], xmm0
140b3c1b0: 4889f0 mov rax, rsi
140b3c1b3: 4883c458 add rsp, 0x58
140b3c1b7: 5b pop rbx
140b3c1b8: 5f pop rdi
140b3c1b9: 5e pop rsi
140b3c1ba: 415e pop r14
140b3c1bc: 415f pop r15
140b3c1be: 5d pop rbp
140b3c1bf: c3 ret
