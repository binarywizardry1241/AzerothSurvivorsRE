145949ca7: 488b8538020000 mov rax, qword ptr [rbp + 0x238]
145949cae: 4885c0 test rax, rax
145949cb1: 7475 je 0x145949d28
145949cb3: 486bf038 imul rsi, rax, 0x38
145949cb7: 488b9df0020000 mov rbx, qword ptr [rbp + 0x2f0]
145949cbe: 4801de add rsi, rbx
145949cc1: 488dbd60020000 lea rdi, [rbp + 0x260]
145949cc8: eb0f jmp 0x145949cd9
145949cca: 660f1f440000 nop word ptr [rax + rax]
145949cd0: 4883c338 add rbx, 0x38
145949cd4: 4839f3 cmp rbx, rsi
145949cd7: 744f je 0x145949d28
145949cd9: 0fb64335 movzx eax, byte ptr [rbx + 0x35]
145949cdd: 3cff cmp al, 0xff
145949cdf: 7447 je 0x145949d28
145949ce1: 488b13 mov rdx, qword ptr [rbx]
145949ce4: 0fb74b36 movzx ecx, word ptr [rbx + 0x36]
145949ce8: 0f104308 movups xmm0, xmmword ptr [rbx + 8]
145949cec: 0f104b18 movups xmm1, xmmword ptr [rbx + 0x18]
145949cf0: 0f105325 movups xmm2, xmmword ptr [rbx + 0x25]
145949cf4: 0f11957d020000 movups xmmword ptr [rbp + 0x27d], xmm2
145949cfb: 0f298d70020000 movaps xmmword ptr [rbp + 0x270], xmm1
145949d02: 0f298560020000 movaps xmmword ptr [rbp + 0x260], xmm0
145949d09: 88858d020000 mov byte ptr [rbp + 0x28d], al
145949d0f: 66898d8e020000 mov word ptr [rbp + 0x28e], cx
145949d16: 3c0c cmp al, 0xc
145949d18: 74b6 je 0x145949cd0
145949d1a: 4c89f9 mov rcx, r15
145949d1d: 4989f8 mov r8, rdi
145949d20: e86b5afdff call 0x14591f790
145949d25: 90 nop
145949d26: eba8 jmp 0x145949cd0
