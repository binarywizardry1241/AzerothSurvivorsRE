145b5ca70: 55 push rbp
145b5ca71: 4157 push r15
145b5ca73: 4156 push r14
145b5ca75: 4155 push r13
145b5ca77: 4154 push r12
145b5ca79: 56 push rsi
145b5ca7a: 57 push rdi
145b5ca7b: 53 push rbx
145b5ca7c: 4883ec48 sub rsp, 0x48
145b5ca80: 488d6c2440 lea rbp, [rsp + 0x40]
145b5ca85: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
145b5ca8d: 4889d3 mov rbx, rdx
145b5ca90: 4889cf mov rdi, rcx
145b5ca93: b101 mov cl, 1
145b5ca95: 31c0 xor eax, eax
145b5ca97: f00fb00d899c9b02 lock cmpxchg byte ptr [rip + 0x29b9c89], cl
145b5ca9f: 0f8594000000 jne 0x145b5cb39
145b5caa5: 488b05c4a09b02 mov rax, qword ptr [rip + 0x29ba0c4]
145b5caac: 488b00 mov rax, qword ptr [rax]
145b5caaf: 48d1e0 shl rax, 1
145b5cab2: 4885c0 test rax, rax
145b5cab5: 0f858f000000 jne 0x145b5cb4a
145b5cabb: c745fc00000000 mov dword ptr [rbp - 4], 0
145b5cac2: 0fb605609c9b02 movzx eax, byte ptr [rip + 0x29b9c60]
145b5cac9: 488b35709c9b02 mov rsi, qword ptr [rip + 0x29b9c70]
145b5cad0: 4885f6 test rsi, rsi
145b5cad3: 0f8492000000 je 0x145b5cb6b
145b5cad9: 4c8b35589c9b02 mov r14, qword ptr [rip + 0x29b9c58]
145b5cae0: 488d04f500000000 lea rax, [rsi*8]
145b5cae8: 4c8d2440 lea r12, [rax + rax*2]
145b5caec: 4531ff xor r15d, r15d
145b5caef: 4531ed xor r13d, r13d
145b5caf2: eb18 jmp 0x145b5cb0c
145b5caf4: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b5cb00: 49ffc7 inc r15
145b5cb03: 4983c518 add r13, 0x18
145b5cb07: 4d39ec cmp r12, r13
145b5cb0a: 745f je 0x145b5cb6b
145b5cb0c: 4b395c2e10 cmp qword ptr [r14 + r13 + 0x10], rbx
145b5cb11: 75ed jne 0x145b5cb00
145b5cb13: 4b8b4c2e08 mov rcx, qword ptr [r14 + r13 + 8]
145b5cb18: 4889fa mov rdx, rdi
145b5cb1b: 4989d8 mov r8, rbx
145b5cb1e: e844724300 call 0x145f93d67
145b5cb23: 85c0 test eax, eax
145b5cb25: 75d9 jne 0x145b5cb00
145b5cb27: 4c89fe mov rsi, r15
145b5cb2a: 807dfc00 cmp byte ptr [rbp - 4], 0
145b5cb2e: 0f84e7000000 je 0x145b5cc1b
145b5cb34: e9f4000000 jmp 0x145b5cc2d
145b5cb39: 488d0de89b9b02 lea rcx, [rip + 0x29b9be8]
145b5cb40: e89bc85d00 call 0x1461393e0
145b5cb45: e95bffffff jmp 0x145b5caa5
145b5cb4a: e821d65d00 call 0x14613a170
145b5cb4f: 3401 xor al, 1
145b5cb51: 8945fc mov dword ptr [rbp - 4], eax
145b5cb54: 0fb605ce9b9b02 movzx eax, byte ptr [rip + 0x29b9bce]
145b5cb5b: 488b35de9b9b02 mov rsi, qword ptr [rip + 0x29b9bde]
145b5cb62: 4885f6 test rsi, rsi
145b5cb65: 0f856effffff jne 0x145b5cad9
145b5cb6b: 4885db test rbx, rbx
145b5cb6e: 7910 jns 0x145b5cb80
145b5cb70: 31f6 xor esi, esi
145b5cb72: 4889f1 mov rcx, rsi
145b5cb75: 4889da mov rdx, rbx
145b5cb78: e8bee15d00 call 0x14613ad3b
145b5cb7d: 90 nop
145b5cb7e: 0f0b ud2
145b5cb80: 48895df0 mov qword ptr [rbp - 0x10], rbx
145b5cb84: 7444 je 0x145b5cbca
145b5cb86: e875564afa call 0x140002200
145b5cb8b: be01000000 mov esi, 1
145b5cb90: ba01000000 mov edx, 1
145b5cb95: 488b5df0 mov rbx, qword ptr [rbp - 0x10]
145b5cb99: 4889d9 mov rcx, rbx
145b5cb9c: e81f564afa call 0x1400021c0
145b5cba1: 4885c0 test rax, rax
145b5cba4: 74cc je 0x145b5cb72
145b5cba6: 488945e8 mov qword ptr [rbp - 0x18], rax
145b5cbaa: 4889c1 mov rcx, rax
145b5cbad: 4889fa mov rdx, rdi
145b5cbb0: 4989d8 mov r8, rbx
145b5cbb3: e8a3714300 call 0x145f93d5b
145b5cbb8: 488b35819b9b02 mov rsi, qword ptr [rip + 0x29b9b81]
145b5cbbf: 483b356a9b9b02 cmp rsi, qword ptr [rip + 0x29b9b6a]
145b5cbc6: 7414 je 0x145b5cbdc
145b5cbc8: eb1f jmp 0x145b5cbe9
145b5cbca: b801000000 mov eax, 1
145b5cbcf: 488945e8 mov qword ptr [rbp - 0x18], rax
145b5cbd3: 483b35569b9b02 cmp rsi, qword ptr [rip + 0x29b9b56]
145b5cbda: 750d jne 0x145b5cbe9
145b5cbdc: 488d0d4d9b9b02 lea rcx, [rip + 0x29b9b4d]
145b5cbe3: e828764300 call 0x145f94210
145b5cbe8: 90 nop
145b5cbe9: 488b05489b9b02 mov rax, qword ptr [rip + 0x29b9b48]
145b5cbf0: 488d0c76 lea rcx, [rsi + rsi*2]
145b5cbf4: 488b55f0 mov rdx, qword ptr [rbp - 0x10]
145b5cbf8: 488914c8 mov qword ptr [rax + rcx*8], rdx
145b5cbfc: 4c8b45e8 mov r8, qword ptr [rbp - 0x18]
145b5cc00: 4c8944c808 mov qword ptr [rax + rcx*8 + 8], r8
145b5cc05: 488954c810 mov qword ptr [rax + rcx*8 + 0x10], rdx
145b5cc0a: 488d4601 lea rax, [rsi + 1]
145b5cc0e: 4889052b9b9b02 mov qword ptr [rip + 0x29b9b2b], rax
145b5cc15: 807dfc00 cmp byte ptr [rbp - 4], 0
145b5cc19: 7512 jne 0x145b5cc2d
145b5cc1b: 488b054e9f9b02 mov rax, qword ptr [rip + 0x29b9f4e]
145b5cc22: 488b00 mov rax, qword ptr [rax]
145b5cc25: 48d1e0 shl rax, 1
145b5cc28: 4885c0 test rax, rax
145b5cc2b: 7533 jne 0x145b5cc60
145b5cc2d: 31c0 xor eax, eax
145b5cc2f: 8605f39a9b02 xchg byte ptr [rip + 0x29b9af3], al
145b5cc35: 3c02 cmp al, 2
145b5cc37: 7419 je 0x145b5cc52
145b5cc39: 81c60000f000 add esi, 0xf00000
145b5cc3f: 89f0 mov eax, esi
145b5cc41: 4883c448 add rsp, 0x48
145b5cc45: 5b pop rbx
145b5cc46: 5f pop rdi
145b5cc47: 5e pop rsi
145b5cc48: 415c pop r12
145b5cc4a: 415d pop r13
145b5cc4c: 415e pop r14
145b5cc4e: 415f pop r15
145b5cc50: 5d pop rbp
145b5cc51: c3 ret
145b5cc52: 488d0dcf9a9b02 lea rcx, [rip + 0x29b9acf]
145b5cc59: e842c85d00 call 0x1461394a0
145b5cc5e: ebd9 jmp 0x145b5cc39
145b5cc60: e80bd55d00 call 0x14613a170
145b5cc65: 84c0 test al, al
145b5cc67: 75c4 jne 0x145b5cc2d
145b5cc69: c605b99a9b0201 mov byte ptr [rip + 0x29b9ab9], 1
145b5cc70: ebbb jmp 0x145b5cc2d
