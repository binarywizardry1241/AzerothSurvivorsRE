14033f438 4889d9 mov rcx, rbx
14033f43b 4d89c6 mov r14, r8
14033f43e e87d890200 call 0x140367dc0
14033f443 4889d7 mov rdi, rdx
14033f446 4889d9 mov rcx, rbx
14033f449 e862bfe4ff call 0x14018b3b0
14033f44e 4989d7 mov r15, rdx
14033f451 4889d9 mov rcx, rbx
14033f454 e8b7e2dcff call 0x14010d710
14033f459 4989c4 mov r12, rax
14033f45c 4989d5 mov r13, rdx
14033f45f 4889d9 mov rcx, rbx
14033f462 e8d95ad8ff call 0x1400c4f40
14033f467 48c745d001000000 mov qword ptr [rbp - 0x30], 1
14033f46f 48897dd8 mov qword ptr [rbp - 0x28], rdi
14033f473 c645e001 mov byte ptr [rbp - 0x20], 1
14033f477 488945e8 mov qword ptr [rbp - 0x18], rax
14033f47b 488955f0 mov qword ptr [rbp - 0x10], rdx
14033f47f 4c8965f8 mov qword ptr [rbp - 8], r12
14033f483 4c896d00 mov qword ptr [rbp], r13
14033f487 48c7450801000000 mov qword ptr [rbp + 8], 1
14033f48f 4c897d10 mov qword ptr [rbp + 0x10], r15
14033f493 c6451801 mov byte ptr [rbp + 0x18], 1
14033f497 4c8d7db8 lea r15, [rbp - 0x48]
14033f49b 488d55d0 lea rdx, [rbp - 0x30]
14033f49f 4c89f9 mov rcx, r15
14033f4a2 e8c9dad5ff call 0x14009cf70
14033f4a7 488b7e10 mov rdi, qword ptr [rsi + 0x10]
14033f4ab 488b4318 mov rax, qword ptr [rbx + 0x18]
14033f4af 48897c2430 mov qword ptr [rsp + 0x30], rdi
14033f4b4 4c897c2428 mov qword ptr [rsp + 0x28], r15
14033f4b9 4889442420 mov qword ptr [rsp + 0x20], rax
14033f4be 488d155e54ab05 lea rdx, [rip + 0x5ab545e]
14033f4c5 488d4dd0 lea rcx, [rbp - 0x30]
14033f4c9 41b880000000 mov r8d, 0x80
14033f4cf 4d89f1 mov r9, r14
14033f4d2 e8e99eb104 call 0x144e593c0
