145950dfd: 41807d0000 cmp byte ptr [r13], 0
145950e02: 0f8489020000 je 0x145951091
145950e08: 498b7d08 mov rdi, qword ptr [r13 + 8]
145950e0c: 8b4608 mov eax, dword ptr [rsi + 8]
145950e0f: 8985e8010000 mov dword ptr [rbp + 0x1e8], eax
145950e15: 488b06 mov rax, qword ptr [rsi]
145950e18: 488985e0010000 mov qword ptr [rbp + 0x1e0], rax
145950e1f: 488bb5a8000000 mov rsi, qword ptr [rbp + 0xa8]
145950e26: 483bb598000000 cmp rsi, qword ptr [rbp + 0x98]
145950e2d: 0f8584000000 jne 0x145950eb7
145950e33: 488b8578020000 mov rax, qword ptr [rbp + 0x278]
145950e3a: 48898568020000 mov qword ptr [rbp + 0x268], rax
145950e41: 488b8580020000 mov rax, qword ptr [rbp + 0x280]
145950e48: 48898560020000 mov qword ptr [rbp + 0x260], rax
145950e4f: 488b8588020000 mov rax, qword ptr [rbp + 0x288]
145950e56: 48898558020000 mov qword ptr [rbp + 0x258], rax
145950e5d: 488b8590020000 mov rax, qword ptr [rbp + 0x290]
145950e64: 48898550020000 mov qword ptr [rbp + 0x250], rax
145950e6b: c685a702000001 mov byte ptr [rbp + 0x2a7], 1
145950e72: c685a602000001 mov byte ptr [rbp + 0x2a6], 1
145950e79: c685a502000001 mov byte ptr [rbp + 0x2a5], 1
145950e80: c685a402000001 mov byte ptr [rbp + 0x2a4], 1
145950e87: c685a302000001 mov byte ptr [rbp + 0x2a3], 1
145950e8e: c685a202000001 mov byte ptr [rbp + 0x2a2], 1
145950e95: c685a102000001 mov byte ptr [rbp + 0x2a1], 1
145950e9c: c685a002000001 mov byte ptr [rbp + 0x2a0], 1
145950ea3: c6859f02000001 mov byte ptr [rbp + 0x29f], 1
145950eaa: 488d8d98000000 lea rcx, [rbp + 0x98]
145950eb1: e82a9d2a00 call 0x145bfabe0
145950eb6: 90 nop
145950eb7: 488b85a0000000 mov rax, qword ptr [rbp + 0xa0]
145950ebe: 488d0c76 lea rcx, [rsi + rsi*2]
145950ec2: 48893cc8 mov qword ptr [rax + rcx*8], rdi
145950ec6: 488b95e0010000 mov rdx, qword ptr [rbp + 0x1e0]
145950ecd: 488954c808 mov qword ptr [rax + rcx*8 + 8], rdx
145950ed2: 8b95e8010000 mov edx, dword ptr [rbp + 0x1e8]
145950ed8: 8954c810 mov dword ptr [rax + rcx*8 + 0x10], edx
145950edc: 48ffc6 inc rsi
145950edf: 4889b5a8000000 mov qword ptr [rbp + 0xa8], rsi
145950ee6: 498d7540 lea rsi, [r13 + 0x40]
145950eea: e9a2010000 jmp 0x145951091
