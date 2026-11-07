14589ec50: 55 push rbp
14589ec51: 4156 push r14
14589ec53: 56 push rsi
14589ec54: 57 push rdi
14589ec55: 53 push rbx
14589ec56: 4883ec60 sub rsp, 0x60
14589ec5a: 488d6c2460 lea rbp, [rsp + 0x60]
14589ec5f: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
14589ec67: 4889cf mov rdi, rcx
14589ec6a: 48894dc8 mov qword ptr [rbp - 0x38], rcx
14589ec6e: 488d054b3476fa lea rax, [rip - 0x589cbb5]
14589ec75: 488945d0 mov qword ptr [rbp - 0x30], rax
14589ec79: 488d15b3043601 lea rdx, [rip + 0x13604b3]
14589ec80: 488d4dd8 lea rcx, [rbp - 0x28]
14589ec84: 4c8d45c8 lea r8, [rbp - 0x38]
14589ec88: e8a3e43300 call 0x145bdd130
14589ec8d: 488b4de0 mov rcx, qword ptr [rbp - 0x20]
14589ec91: 488b55e8 mov rdx, qword ptr [rbp - 0x18]
14589ec95: 488b7710 mov rsi, qword ptr [rdi + 0x10]
14589ec99: 488b5f18 mov rbx, qword ptr [rdi + 0x18]
14589ec9d: 48894df0 mov qword ptr [rbp - 0x10], rcx
14589eca1: e82af10e00 call 0x14598ddd0
14589eca6: 90 nop
14589eca7: 4889c7 mov rdi, rax
14589ecaa: 488b45d8 mov rax, qword ptr [rbp - 0x28]
14589ecae: 4885c0 test rax, rax
14589ecb1: 7418 je 0x14589eccb
14589ecb3: 41b801000000 mov r8d, 1
14589ecb9: 488b4df0 mov rcx, qword ptr [rbp - 0x10]
14589ecbd: 4989d6 mov r14, rdx
14589ecc0: 4889c2 mov rdx, rax
14589ecc3: e8083576fa call 0x1400021d0
14589ecc8: 4c89f2 mov rdx, r14
14589eccb: 4885ff test rdi, rdi
14589ecce: 480f45f7 cmovne rsi, rdi
14589ecd2: 480f44d3 cmove rdx, rbx
14589ecd6: 4889f0 mov rax, rsi
14589ecd9: 4883c460 add rsp, 0x60
14589ecdd: 5b pop rbx
14589ecde: 5f pop rdi
14589ecdf: 5e pop rsi
14589ece0: 415e pop r14
14589ece2: 5d pop rbp
14589ece3: c3 ret
