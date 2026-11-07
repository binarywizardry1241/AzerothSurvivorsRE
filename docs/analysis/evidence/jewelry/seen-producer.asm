14595d7bb: 488b8760060000 mov rax, qword ptr [rdi + 0x660]
14595d7c2: 4885c0 test rax, rax
14595d7c5: 0f84a5010000 je 0x14595d970
14595d7cb: 488b9f58060000 mov rbx, qword ptr [rdi + 0x658]
14595d7d2: 48c1e005 shl rax, 5
14595d7d6: 4c8d2c80 lea r13, [rax + rax*4]
14595d7da: 488d8798060000 lea rax, [rdi + 0x698]
14595d7e1: 48898530010000 mov qword ptr [rbp + 0x130], rax
14595d7e8: 48ba0000000000000080 movabs rdx, 0x8000000000000000
14595d7f2: 41be01000000 mov r14d, 1
14595d7f8: 4531ff xor r15d, r15d
14595d7fb: eb60 jmp 0x14595d85d
14595d7fd: 0f1f00 nop dword ptr [rax]
14595d800: 488b9528010000 mov rdx, qword ptr [rbp + 0x128]
14595d807: 488b82a0060000 mov rax, qword ptr [rdx + 0x6a0]
14595d80e: 4889f1 mov rcx, rsi
14595d811: 48c1e105 shl rcx, 5
14595d815: 4c8b8548010000 mov r8, qword ptr [rbp + 0x148]
14595d81c: 4c890408 mov qword ptr [rax + rcx], r8
14595d820: 4c8b8538010000 mov r8, qword ptr [rbp + 0x138]
14595d827: 4c89440808 mov qword ptr [rax + rcx + 8], r8
14595d82c: 4c89640810 mov qword ptr [rax + rcx + 0x10], r12
14595d831: 40887c0818 mov byte ptr [rax + rcx + 0x18], dil
14595d836: 4889d7 mov rdi, rdx
14595d839: 48ffc6 inc rsi
14595d83c: 4889b2a8060000 mov qword ptr [rdx + 0x6a8], rsi
14595d843: 48ba0000000000000080 movabs rdx, 0x8000000000000000
14595d84d: 4981c7a0000000 add r15, 0xa0
14595d854: 4d39fd cmp r13, r15
14595d857: 0f8413010000 je 0x14595d970
14595d85d: 4a8b4c3b78 mov rcx, qword ptr [rbx + r15 + 0x78]
14595d862: 4889c8 mov rax, rcx
14595d865: 4831d0 xor rax, rdx
14595d868: 4885c9 test rcx, rcx
14595d86b: 490f49c6 cmovns rax, r14
14595d86f: 4883f802 cmp rax, 2
14595d873: 743b je 0x14595d8b0
14595d875: 4883f803 cmp rax, 3
14595d879: 75d2 jne 0x14595d84d
14595d87b: 4a8b943b80000000 mov rdx, qword ptr [rbx + r15 + 0x80]
14595d883: 488d4db8 lea rcx, [rbp - 0x48]
14595d887: e864fd2700 call 0x145bdd5f0
14595d88c: 488b45b8 mov rax, qword ptr [rbp - 0x48]
14595d890: 48898548010000 mov qword ptr [rbp + 0x148], rax
14595d897: 488b45c0 mov rax, qword ptr [rbp - 0x40]
14595d89b: 48898538010000 mov qword ptr [rbp + 0x138], rax
14595d8a2: 4c8b65c8 mov r12, qword ptr [rbp - 0x38]
14595d8a6: e97f000000 jmp 0x14595d92a
14595d8ab: 0f1f440000 nop dword ptr [rax + rax]
14595d8b0: 4a8b843b80000000 mov rax, qword ptr [rbx + r15 + 0x80]
14595d8b8: 4c8b6008 mov r12, qword ptr [rax + 8]
14595d8bc: 4d85e4 test r12, r12
14595d8bf: 0f889b000000 js 0x14595d960
14595d8c5: 7438 je 0x14595d8ff
14595d8c7: 488b30 mov rsi, qword ptr [rax]
14595d8ca: e831496afa call 0x140002200
14595d8cf: ba01000000 mov edx, 1
14595d8d4: 4c89e1 mov rcx, r12
14595d8d7: e8e4486afa call 0x1400021c0
14595d8dc: 4885c0 test rax, rax
14595d8df: 0f84df010000 je 0x14595dac4
14595d8e5: 4889c7 mov rdi, rax
14595d8e8: 4889c1 mov rcx, rax
14595d8eb: 4889f2 mov rdx, rsi
14595d8ee: 4d89e0 mov r8, r12
14595d8f1: e8e5ca2a00 call 0x145c0a3db
14595d8f6: 4889bd18010000 mov qword ptr [rbp + 0x118], rdi
14595d8fd: eb11 jmp 0x14595d910
14595d8ff: bf01000000 mov edi, 1
14595d904: b801000000 mov eax, 1
14595d909: 48898518010000 mov qword ptr [rbp + 0x118], rax
14595d910: 4c8965b8 mov qword ptr [rbp - 0x48], r12
14595d914: 4889bd38010000 mov qword ptr [rbp + 0x138], rdi
14595d91b: 48897dc0 mov qword ptr [rbp - 0x40], rdi
14595d91f: 4c8965c8 mov qword ptr [rbp - 0x38], r12
14595d923: 4c89a548010000 mov qword ptr [rbp + 0x148], r12
14595d92a: 420fb6bc3b98000000 movzx edi, byte ptr [rbx + r15 + 0x98]
14595d933: 488b8528010000 mov rax, qword ptr [rbp + 0x128]
14595d93a: 488bb0a8060000 mov rsi, qword ptr [rax + 0x6a8]
14595d941: 483bb098060000 cmp rsi, qword ptr [rax + 0x698]
14595d948: 0f85b2feffff jne 0x14595d800
14595d94e: 488b8d30010000 mov rcx, qword ptr [rbp + 0x130]
14595d955: e876022b00 call 0x145c0dbd0
14595d95a: 90 nop
14595d95b: e9a0feffff jmp 0x14595d800
14595d960: 31c9 xor ecx, ecx
14595d962: 488b9518010000 mov rdx, qword ptr [rbp + 0x118]
14595d969: e87dbb4400 call 0x145da94eb
14595d96e: 0f0b ud2
