0x1458bdfbd: 4889cf                   mov rdi, rcx
0x1458bdfc0: 4883ba180f0000ff         cmp qword ptr [rdx + 0xf18], -1
0x1458bdfc8: 7478                     je 0x1458be042
0x1458bdfca: 4889d3                   mov rbx, rdx
0x1458bdfcd: 4881c2180f0000           add rdx, 0xf18
0x1458bdfd4: 488b8320100000           mov rax, qword ptr [rbx + 0x1020]
0x1458bdfdb: 488985800d0000           mov qword ptr [rbp + 0xd80], rax
0x1458bdfe2: 440fb6b384100000         movzx r14d, byte ptr [rbx + 0x1084]
0x1458bdfea: 440fb6bb85100000         movzx r15d, byte ptr [rbx + 0x1085]
0x1458bdff2: 440fb6ab86100000         movzx r13d, byte ptr [rbx + 0x1086]
0x1458bdffa: 488d4db8                 lea rcx, [rbp - 0x48]
0x1458bdffe: e8edf23000               call 0x145bcd2f0
0x1458be003: 488bb3400f0000           mov rsi, qword ptr [rbx + 0xf40]
0x1458be00a: 4989f4                   mov r12, rsi
0x1458be00d: 49c1e404                 shl r12, 4
0x1458be011: 4889f0                   mov rax, rsi
0x1458be014: 48c1e83c                 shr rax, 0x3c
0x1458be018: 0f95c0                   setne al
0x1458be01b: 48b9f8ffffffffffff7f     movabs rcx, 0x7ffffffffffffff8
0x1458be025: 4939cc                   cmp r12, rcx
0x1458be028: 0f97c1                   seta cl
0x1458be02b: 08c1                     or cl, al
0x1458be02d: 741f                     je 0x1458be04e
0x1458be02f: 31db                     xor ebx, ebx
0x1458be031: 4889d9                   mov rcx, rbx
0x1458be034: 4c89e2                   mov rdx, r12
0x1458be037: e87fb24d00               call 0x145d992bb
0x1458be03c: 90                       nop
0x1458be03d: e932080000               jmp 0x1458be874
0x1458be042: 48c70702000000           mov qword ptr [rdi], 2
0x1458be049: e98f070000               jmp 0x1458be7dd
0x1458be1f5: 48b82d7f954c2df45158     movabs rax, 0x5851f42d4c957f2d
0x1458be1ff: 490faf8518110000         imul rax, qword ptr [r13 + 0x1118]
0x1458be207: 48b94f8167f77e7b0514     movabs rcx, 0x14057b7ef767814f
0x1458be211: 4801c1                   add rcx, rax
0x1458be214: 49898d18110000           mov qword ptr [r13 + 0x1118], rcx
0x1458be21b: 48898d900b0000           mov qword ptr [rbp + 0xb90], rcx
0x1458be4e7: 488d4db8                 lea rcx, [rbp - 0x48]
0x1458be4eb: 4889da                   mov rdx, rbx
0x1458be4ee: 4989f8                   mov r8, rdi
0x1458be4f1: e8eaf20600               call 0x14592d7e0
0x1458be7cb: 488d55b8                 lea rdx, [rbp - 0x48]
0x1458be7cf: 41b8c80a0000             mov r8d, 0xac8
0x1458be7d5: 4889f1                   mov rcx, rsi
0x1458be7d8: e80ab93300               call 0x145bfa0e7
0x1458be7dd: 0f28b5a00d0000           movaps xmm6, xmmword ptr [rbp + 0xda0]
0x1458be7e4: 4881c4380e0000           add rsp, 0xe38
0x1458be7eb: 5b                       pop rbx
0x1458be7ec: 5f                       pop rdi
0x1458be7ed: 5e                       pop rsi
0x1458be7ee: 415c                     pop r12
0x1458be7f0: 415d                     pop r13
0x1458be7f2: 415e                     pop r14
0x1458be7f4: 415f                     pop r15
0x1458be7f6: 5d                       pop rbp
0x1458be7f7: c3                       ret
0x1458be864: b908000000               mov ecx, 8
0x1458be869: bac0000000               mov edx, 0xc0
0x1458be86e: e82eaa4d00               call 0x145d992a1
0x1458be873: 90                       nop
0x1458be874: 0f0b                     ud2
