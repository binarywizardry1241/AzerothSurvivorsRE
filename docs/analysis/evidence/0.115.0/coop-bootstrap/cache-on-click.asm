14595e150 cmp byte ptr [rsi + 0xc37], 0
14595e157 je 0x14595e1e0
14595e15d cmp byte ptr [rsi + 0xc3a], 0
14595e164 mov byte ptr [rsi + 0xc3a], 1
14595e16b jne 0x14595e110
14595e16d mov edx, 0x1e
14595e172 lea rcx, [rip + 0x19d3287]
14595e179 call 0x1458dff90
14595e17e nop
14595e17f mov rbx, rdx
14595e182 test rax, rax
14595e185 lea rcx, [rip + 0x19d3274]
14595e18c cmove rax, rcx
14595e190 mov ecx, 0x1e
14595e195 cmove rbx, rcx
14595e199 test rbx, rbx
14595e19c js 0x14595e659
14595e1a2 je 0x14595e534
14595e1a8 mov r15, rax
14595e1ab call 0x140002200
14595e1b0 mov edx, 1
14595e1b5 mov rcx, rbx
14595e1b8 call 0x1400021c0
14595e1bd test rax, rax
14595e1c0 je 0x14595e741
14595e1c6 mov rcx, rax
14595e1c9 mov rdi, rax
14595e1cc mov rdx, r15
14595e1cf mov r8, rbx
14595e1d2 call 0x145d145fb
14595e1d7 mov rcx, rdi
14595e1da jmp 0x14595e539
14595e1df nop
