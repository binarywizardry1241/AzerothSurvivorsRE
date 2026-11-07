1459cbdd0: 55 push rbp
1459cbdd1: 4157 push r15
1459cbdd3: 4156 push r14
1459cbdd5: 4155 push r13
1459cbdd7: 4154 push r12
1459cbdd9: 56 push rsi
1459cbdda: 57 push rdi
1459cbddb: 53 push rbx
1459cbddc: 4883ec78 sub rsp, 0x78
1459cbde0: 488d6c2470 lea rbp, [rsp + 0x70]
1459cbde5: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
1459cbded: 4989cc mov r12, rcx
1459cbdf0: 488b7a10 mov rdi, qword ptr [rdx + 0x10]
1459cbdf4: 4889fe mov rsi, rdi
1459cbdf7: 48c1e605 shl rsi, 5
1459cbdfb: 4889f8 mov rax, rdi
1459cbdfe: 48c1e83b shr rax, 0x3b
1459cbe02: 0f95c0 setne al
1459cbe05: 48b9f8ffffffffffff7f movabs rcx, 0x7ffffffffffffff8
1459cbe0f: 4839ce cmp rsi, rcx
1459cbe12: 0f97c1 seta cl
1459cbe15: 08c1 or cl, al
1459cbe17: 7410 je 0x1459cbe29
1459cbe19: 4531ff xor r15d, r15d
1459cbe1c: 4c89f9 mov rcx, r15
1459cbe1f: 4889f2 mov rdx, rsi
1459cbe22: e894d43c00 call 0x145d992bb
1459cbe27: 0f0b ud2
1459cbe29: 488b5a08 mov rbx, qword ptr [rdx + 8]
1459cbe2d: 4885f6 test rsi, rsi
1459cbe30: 4c8965f0 mov qword ptr [rbp - 0x10], r12
1459cbe34: 7425 je 0x1459cbe5b
1459cbe36: e8c56363fa call 0x140002200
1459cbe3b: 41bf08000000 mov r15d, 8
1459cbe41: ba08000000 mov edx, 8
1459cbe46: 4889f1 mov rcx, rsi
1459cbe49: e8726363fa call 0x1400021c0
1459cbe4e: 4885c0 test rax, rax
1459cbe51: 74c9 je 0x1459cbe1c
1459cbe53: 4989c6 mov r14, rax
1459cbe56: 4989fd mov r13, rdi
1459cbe59: eb09 jmp 0x1459cbe64
1459cbe5b: 41be08000000 mov r14d, 8
1459cbe61: 4531ed xor r13d, r13d
1459cbe64: 4c896dd8 mov qword ptr [rbp - 0x28], r13
1459cbe68: 4c8975e0 mov qword ptr [rbp - 0x20], r14
1459cbe6c: 4801de add rsi, rbx
1459cbe6f: 48c745f800000000 mov qword ptr [rbp - 8], 0
1459cbe77: 4c8d65b8 lea r12, [rbp - 0x48]
1459cbe7b: 4d89ef mov r15, r13
1459cbe7e: 4983ef01 sub r15, 1
1459cbe82: 7257 jb 0x1459cbedb
1459cbe84: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459cbe90: 4839f3 cmp rbx, rsi
1459cbe93: 7446 je 0x1459cbedb
1459cbe95: 4c396df8 cmp qword ptr [rbp - 8], r13
1459cbe99: 7364 jae 0x1459cbeff
1459cbe9b: 4c89e1 mov rcx, r12
1459cbe9e: 4889da mov rdx, rbx
1459cbea1: e84a142000 call 0x145bcd2f0
1459cbea6: 90 nop
1459cbea7: 488b55f8 mov rdx, qword ptr [rbp - 8]
1459cbeab: 488d4201 lea rax, [rdx + 1]
1459cbeaf: 0fb64b18 movzx ecx, byte ptr [rbx + 0x18]
1459cbeb3: 4883c320 add rbx, 0x20
1459cbeb7: 884dd0 mov byte ptr [rbp - 0x30], cl
1459cbeba: 48c1e205 shl rdx, 5
1459cbebe: 0f1045b8 movups xmm0, xmmword ptr [rbp - 0x48]
1459cbec2: 410f110416 movups xmmword ptr [r14 + rdx], xmm0
1459cbec7: 0f1045c8 movups xmm0, xmmword ptr [rbp - 0x38]
1459cbecb: 410f11441610 movups xmmword ptr [r14 + rdx + 0x10], xmm0
1459cbed1: 488945f8 mov qword ptr [rbp - 8], rax
1459cbed5: 4983ef01 sub r15, 1
1459cbed9: 73b5 jae 0x1459cbe90
1459cbedb: 48897de8 mov qword ptr [rbp - 0x18], rdi
1459cbedf: 488b45f0 mov rax, qword ptr [rbp - 0x10]
1459cbee3: 48897810 mov qword ptr [rax + 0x10], rdi
1459cbee7: 0f1045d8 movups xmm0, xmmword ptr [rbp - 0x28]
1459cbeeb: 0f1100 movups xmmword ptr [rax], xmm0
1459cbeee: 4883c478 add rsp, 0x78
1459cbef2: 5b pop rbx
1459cbef3: 5f pop rdi
1459cbef4: 5e pop rsi
1459cbef5: 415c pop r12
1459cbef7: 415d pop r13
1459cbef9: 415e pop r14
1459cbefb: 415f pop r15
1459cbefd: 5d pop rbp
1459cbefe: c3 ret
1459cbeff: 4c8d052aad8601 lea r8, [rip + 0x186ad2a]
1459cbf06: 488b4df8 mov rcx, qword ptr [rbp - 8]
1459cbf0a: 4c89ea mov rdx, r13
1459cbf0d: e841d73c00 call 0x145d99653
1459cbf12: 90 nop
1459cbf13: 0f0b ud2
