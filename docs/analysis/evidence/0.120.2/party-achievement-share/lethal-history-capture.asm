145bbaa05 498bb740070000 mov rsi, qword ptr [r15 + 0x740]
145bbaa0c 493bb730070000 cmp rsi, qword ptr [r15 + 0x730]
145bbaa13 750c jne 0x145bbaa21
145bbaa15 498d8f30070000 lea rcx, [r15 + 0x730]
145bbaa1c e83f084200 call 0x145fdb260
145bbaa21 498b8738070000 mov rax, qword ptr [r15 + 0x738]
145bbaa28 488d0c76 lea rcx, [rsi + rsi*2]
145bbaa2c 8b9568010000 mov edx, dword ptr [rbp + 0x168]
145bbaa32 891488 mov dword ptr [rax + rcx*4], edx
145bbaa35 895c8804 mov dword ptr [rax + rcx*4 + 4], ebx
145bbaa39 0fb695a0020000 movzx edx, byte ptr [rbp + 0x2a0]
145bbaa40 88548808 mov byte ptr [rax + rcx*4 + 8], dl
145bbaa44 4488748809 mov byte ptr [rax + rcx*4 + 9], r14b
145bbaa49 8b9558010000 mov edx, dword ptr [rbp + 0x158]
145bbaa4f 8854880a mov byte ptr [rax + rcx*4 + 0xa], dl
145bbaa53 48ffc6 inc rsi
145bbaa56 4989b740070000 mov qword ptr [r15 + 0x740], rsi
145bbaa5d 4180bf9d0c000001 cmp byte ptr [r15 + 0xc9d], 1
145bbaa65 0f85a0010000 jne 0x145bbac0b
145bbaa6b 4489add8000000 mov dword ptr [rbp + 0xd8], r13d
145bbaa72 488b9578010000 mov rdx, qword ptr [rbp + 0x178]
145bbaa79 4c8baaa00a0000 mov r13, qword ptr [rdx + 0xaa0]
145bbaa80 4e8d3ced00000000 lea r15, [r13*8]
145bbaa88 4c89e8 mov rax, r13
145bbaa8b 48c1e83d shr rax, 0x3d
145bbaa8f 0f95c0 setne al
145bbaa92 48b9fcffffffffffff7f movabs rcx, 0x7ffffffffffffffc
145bbaa9c 4939cf cmp r15, rcx
145bbaa9f 0f97c1 seta cl
145bbaaa2 08c1 or cl, al
145bbaaa4 740c je 0x145bbaab2
145bbaaa6 31c9 xor ecx, ecx
145bbaaa8 4c89fa mov rdx, r15
145bbaaab e8fb755900 call 0x1461520ab
145bbaab0 0f0b ud2 
145bbaab2 4c8ba2980a0000 mov r12, qword ptr [rdx + 0xa98]
145bbaab9 4d85ff test r15, r15
145bbaabc 7428 je 0x145bbaae6
145bbaabe e83d7744fa call 0x140002200
145bbaac3 ba04000000 mov edx, 4
145bbaac8 4c89f9 mov rcx, r15
145bbaacb e8f07644fa call 0x1400021c0
145bbaad0 b904000000 mov ecx, 4
145bbaad5 4885c0 test rax, rax
145bbaad8 74ce je 0x145bbaaa8
145bbaada 4889c6 mov rsi, rax
145bbaadd 4c89ad38010000 mov qword ptr [rbp + 0x138], r13
145bbaae4 eb10 jmp 0x145bbaaf6
145bbaae6 be04000000 mov esi, 4
145bbaaeb 48c7853801000000000000 mov qword ptr [rbp + 0x138], 0
145bbaaf6 4d85ed test r13, r13
145bbaaf9 740e je 0x145bbab09
145bbaafb 4889f1 mov rcx, rsi
145bbaafe 4c89e2 mov rdx, r12
145bbab01 4d89f8 mov r8, r15
145bbab04 e822033f00 call 0x145faae2b
145bbab09 4889b580000000 mov qword ptr [rbp + 0x80], rsi
145bbab10 4c8ba578010000 mov r12, qword ptr [rbp + 0x178]
145bbab17 498bb424b80a0000 mov rsi, qword ptr [r12 + 0xab8]
145bbab1f 493bb424a80a0000 cmp rsi, qword ptr [r12 + 0xaa8]
145bbab27 750e jne 0x145bbab37
145bbab29 498d8c24a80a0000 lea rcx, [r12 + 0xaa8]
145bbab31 e8ba0a3f00 call 0x145fab5f0
145bbab36 90 nop 
145bbab37 498b8424b00a0000 mov rax, qword ptr [r12 + 0xab0]
145bbab3f 488d0cb6 lea rcx, [rsi + rsi*4]
145bbab43 488b9538010000 mov rdx, qword ptr [rbp + 0x138]
145bbab4a 488914c8 mov qword ptr [rax + rcx*8], rdx
145bbab4e 488b9580000000 mov rdx, qword ptr [rbp + 0x80]
145bbab55 488954c808 mov qword ptr [rax + rcx*8 + 8], rdx
145bbab5a 4c896cc810 mov qword ptr [rax + rcx*8 + 0x10], r13
145bbab5f 8b9568010000 mov edx, dword ptr [rbp + 0x168]
145bbab65 8954c818 mov dword ptr [rax + rcx*8 + 0x18], edx
145bbab69 895cc81c mov dword ptr [rax + rcx*8 + 0x1c], ebx
145bbab6d 0fb695a0020000 movzx edx, byte ptr [rbp + 0x2a0]
145bbab74 8854c820 mov byte ptr [rax + rcx*8 + 0x20], dl
145bbab78 448874c821 mov byte ptr [rax + rcx*8 + 0x21], r14b
145bbab7d 8b9558010000 mov edx, dword ptr [rbp + 0x158]
145bbab83 8854c822 mov byte ptr [rax + rcx*8 + 0x22], dl
145bbab87 48ffc6 inc rsi
145bbab8a 4989b424b80a0000 mov qword ptr [r12 + 0xab8], rsi
145bbab92 498bb424e80a0000 mov rsi, qword ptr [r12 + 0xae8]
145bbab9a 4d8bbc24980b0000 mov r15, qword ptr [r12 + 0xb98]
145bbaba2 493bb424d80a0000 cmp rsi, qword ptr [r12 + 0xad8]
145bbabaa 750d jne 0x145bbabb9
145bbabac 498d8c24d80a0000 lea rcx, [r12 + 0xad8]
145bbabb4 e827073f00 call 0x145fab2e0
145bbabb9 498b8424e00a0000 mov rax, qword ptr [r12 + 0xae0]
145bbabc1 488d0c76 lea rcx, [rsi + rsi*2]
145bbabc5 4c893cc8 mov qword ptr [rax + rcx*8], r15
145bbabc9 8b9568010000 mov edx, dword ptr [rbp + 0x168]
145bbabcf 8954c808 mov dword ptr [rax + rcx*8 + 8], edx
145bbabd3 895cc80c mov dword ptr [rax + rcx*8 + 0xc], ebx
145bbabd7 0fb695a0020000 movzx edx, byte ptr [rbp + 0x2a0]
145bbabde 8854c810 mov byte ptr [rax + rcx*8 + 0x10], dl
145bbabe2 448874c811 mov byte ptr [rax + rcx*8 + 0x11], r14b
145bbabe7 8b9558010000 mov edx, dword ptr [rbp + 0x158]
145bbabed 8854c812 mov byte ptr [rax + rcx*8 + 0x12], dl
145bbabf1 48ffc6 inc rsi
145bbabf4 4989b424e80a0000 mov qword ptr [r12 + 0xae8], rsi
145bbabfc 440fb6a5b0020000 movzx r12d, byte ptr [rbp + 0x2b0]
145bbac04 448badd8000000 mov r13d, dword ptr [rbp + 0xd8]
