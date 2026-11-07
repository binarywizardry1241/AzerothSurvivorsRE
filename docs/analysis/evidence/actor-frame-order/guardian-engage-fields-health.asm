14597cb4f: c7855802000000000000 mov dword ptr [rbp + 0x258], 0
14597cb59: 48c7854002000000000000 mov qword ptr [rbp + 0x240], 0
14597cb64: 48c7854802000001000000 mov qword ptr [rbp + 0x248], 1
14597cb6f: 48c7855002000000000000 mov qword ptr [rbp + 0x250], 0
14597cb7a: 4883bdb801000000 cmp qword ptr [rbp + 0x1b8], 0
14597cb82: 7461 je 0x14597cbe5
14597cb84: c6852b03000001 mov byte ptr [rbp + 0x32b], 1
14597cb8b: 488d8d40020000 lea rcx, [rbp + 0x240]
14597cb92: e819c64100 call 0x145d991b0
14597cb97: 90 nop 
14597cb98: 488b8548020000 mov rax, qword ptr [rbp + 0x248]
14597cb9f: c60000 mov byte ptr [rax], 0
14597cba2: 48c7855002000001000000 mov qword ptr [rbp + 0x250], 1
14597cbad: c6852b03000001 mov byte ptr [rbp + 0x32b], 1
14597cbb4: 4c89e9 mov rcx, r13
14597cbb7: 488d9540020000 lea rdx, [rbp + 0x240]
14597cbbe: e81d27f5ff call 0x1458cf2e0
14597cbc3: 90 nop 
14597cbc4: c6852b03000001 mov byte ptr [rbp + 0x32b], 1
14597cbcb: 488d8da8010000 lea rcx, [rbp + 0x1a8]
14597cbd2: 488d9540020000 lea rdx, [rbp + 0x240]
14597cbd9: e89235f4ff call 0x1458c0170
14597cbde: 90 nop 
14597cbdf: ff8558020000 inc dword ptr [rbp + 0x258]
14597cbe5: 488b8540020000 mov rax, qword ptr [rbp + 0x240]
14597cbec: 488b8d48020000 mov rcx, qword ptr [rbp + 0x248]
14597cbf3: 488b9550020000 mov rdx, qword ptr [rbp + 0x250]
14597cbfa: 48899570020000 mov qword ptr [rbp + 0x270], rdx
14597cc01: 8b9558020000 mov edx, dword ptr [rbp + 0x258]
14597cc07: 899578020000 mov dword ptr [rbp + 0x278], edx
14597cc0d: 8b955c020000 mov edx, dword ptr [rbp + 0x25c]
14597cc13: 89957c020000 mov dword ptr [rbp + 0x27c], edx
14597cc19: 48898560020000 mov qword ptr [rbp + 0x260], rax
14597cc20: 48898d68020000 mov qword ptr [rbp + 0x268], rcx
14597cc27: c6852b03000000 mov byte ptr [rbp + 0x32b], 0
14597cc2e: 488d8d00020000 lea rcx, [rbp + 0x200]
14597cc35: 488d9560020000 lea rdx, [rbp + 0x260]
14597cc3c: e81f2bf4ff call 0x1458bf760
14597cc41: 90 nop 
14597cc42: 488bb728060000 mov rsi, qword ptr [rdi + 0x628]
14597cc49: 483bb718060000 cmp rsi, qword ptr [rdi + 0x618]
14597cc50: 750d jne 0x14597cc5f
14597cc52: 488b8d10030000 mov rcx, qword ptr [rbp + 0x310]
14597cc59: e8b2e12700 call 0x145bfae10
14597cc5e: 90 nop 
14597cc5f: 488b8720060000 mov rax, qword ptr [rdi + 0x620]
14597cc66: 4889f1 mov rcx, rsi
14597cc69: 48c1e105 shl rcx, 5
14597cc6d: 0f108500020000 movups xmm0, xmmword ptr [rbp + 0x200]
14597cc74: 0f108d10020000 movups xmm1, xmmword ptr [rbp + 0x210]
14597cc7b: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14597cc80: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14597cc84: 48ffc6 inc rsi
14597cc87: 4889b728060000 mov qword ptr [rdi + 0x628], rsi
14597cc8e: c6852b03000000 mov byte ptr [rbp + 0x32b], 0
