14028d56f be01000000 mov esi, 1
14028d574 80bd43010000ff cmp byte ptr [rbp + 0x143], 0xff
14028d57b 7438 je 0x14028d5b5
14028d57d 4488ad57010000 mov byte ptr [rbp + 0x157], r13b
14028d584 488d0db23cb605 lea rcx, [rip + 0x5b63cb2]
14028d58b ba05000000 mov edx, 5
14028d590 4d89c8 mov r8, r9
14028d593 e848d78502 call 0x142aeace0
14028d598 90 nop
14028d599 4885c0 test rax, rax
14028d59c 7507 jne 0x14028d5a5
14028d59e 488b05eb2cdd07 mov rax, qword ptr [rip + 0x7dd2ceb]
14028d5a5 803802 cmp byte ptr [rax], 2
14028d5a8 750b jne 0x14028d5b5
14028d5aa 4883780800 cmp qword ptr [rax + 8], 0
14028d5af 7504 jne 0x14028d5b5
14028d5b1 488b7010 mov rsi, qword ptr [rax + 0x10]
14028d5b5 4889b5d0000000 mov qword ptr [rbp + 0xd0], rsi
14028d5bc 4488ad57010000 mov byte ptr [rbp + 0x157], r13b
14028d5c3 488d0dee3fb605 lea rcx, [rip + 0x5b63fee]
14028d5ca ba09000000 mov edx, 9
14028d5cf e87cee6505 call 0x1458ec450
14028d5d4 90 nop
14028d5d5 4989d0 mov r8, rdx
14028d5d8 488d0d0940b605 lea rcx, [rip + 0x5b64009]
14028d5df 48894db0 mov qword ptr [rbp - 0x50], rcx
14028d5e3 48c745b801000000 mov qword ptr [rbp - 0x48], 1
14028d5eb 4c897dc0 mov qword ptr [rbp - 0x40], r15
14028d5ef 488d0dd23fb605 lea rcx, [rip + 0x5b63fd2]
14028d5f6 48894dc8 mov qword ptr [rbp - 0x38], rcx
14028d5fa 4488ad57010000 mov byte ptr [rbp + 0x157], r13b
14028d601 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14028d60a 488d8db8000000 lea rcx, [rbp + 0xb8]
14028d611 4c8d4db0 lea r9, [rbp - 0x50]
14028d615 4889c2 mov rdx, rax
14028d618 e893f26505 call 0x1458ec8b0
