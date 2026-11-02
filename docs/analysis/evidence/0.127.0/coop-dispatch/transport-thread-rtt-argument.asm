0000000145b962c0 55                             push rbp
0000000145b962c1 56                             push rsi
0000000145b962c2 4883ec48                       sub rsp, 0x48
0000000145b962c6 488d6c2440                     lea rbp, [rsp + 0x40]
0000000145b962cb 48c74500feffffff               mov qword ptr [rbp], 0xfffffffffffffffe
0000000145b962d3 4989ca                         mov r10, rcx
0000000145b962d6 488b4928                       mov rcx, qword ptr [rcx + 0x28]
0000000145b962da 498b5230                       mov rdx, qword ptr [r10 + 0x30]
0000000145b962de 4d8d4a10                       lea r9, [r10 + 0x10]
0000000145b962e2 498b7238                       mov rsi, qword ptr [r10 + 0x38]
0000000145b962e6 4883c610                       add rsi, 0x10
0000000145b962ea 498b4240                       mov rax, qword ptr [r10 + 0x40]
0000000145b962ee 4883c010                       add rax, 0x10
0000000145b962f2 4d8d4248                       lea r8, [r10 + 0x48]
0000000145b962f6 4c89442430                     mov qword ptr [rsp + 0x30], r8
0000000145b962fb 4889442428                     mov qword ptr [rsp + 0x28], rax
0000000145b96300 4889742420                     mov qword ptr [rsp + 0x20], rsi
0000000145b96305 4c8955f8                       mov qword ptr [rbp - 8], r10
0000000145b96309 4d89d0                         mov r8, r10
0000000145b9630c e85fbbffff                     call 0x145b91e70
0000000145b96311 90                             nop 
0000000145b96312 b002                           mov al, 2
0000000145b96314 8606                           xchg byte ptr [rsi], al
0000000145b96316 488b4df8                       mov rcx, qword ptr [rbp - 8]
0000000145b9631a e86150f7ff                     call 0x145b0b380
0000000145b9631f 90                             nop 
0000000145b96320 4883c448                       add rsp, 0x48
0000000145b96324 5e                             pop rsi
0000000145b96325 5d                             pop rbp
0000000145b96326 c3                             ret 
