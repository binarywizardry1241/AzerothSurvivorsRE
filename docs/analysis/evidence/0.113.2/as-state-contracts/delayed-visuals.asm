14591cad0: 55 push rbp
14591cad1: 4157 push r15
14591cad3: 4156 push r14
14591cad5: 4155 push r13
14591cad7: 4154 push r12
14591cad9: 56 push rsi
14591cada: 57 push rdi
14591cadb: 53 push rbx
14591cadc: 4881ec98000000 sub rsp, 0x98
14591cae3: 488dac2480000000 lea rbp, [rsp + 0x80]
14591caeb: 0f297500 movaps xmmword ptr [rbp], xmm6
14591caef: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
14591caf7: 4c8bb9d0050000 mov r15, qword ptr [rcx + 0x5d0]
14591cafe: 4d85ff test r15, r15
14591cb01: 0f841b010000 je 0x14591cc22
14591cb07: 4889ce mov rsi, rcx
14591cb0a: f30f10b16c0b0000 movss xmm6, dword ptr [rcx + 0xb6c]
14591cb12: 488d5dcc lea rbx, [rbp - 0x34]
14591cb16: 31ff xor edi, edi
14591cb18: 4c8d75d8 lea r14, [rbp - 0x28]
14591cb1c: eb0e jmp 0x14591cb2c
14591cb1e: 6690 nop
14591cb20: 48ffc7 inc rdi
14591cb23: 4c39ff cmp rdi, r15
14591cb26: 0f83f6000000 jae 0x14591cc22
14591cb2c: 488b8ec8050000 mov rcx, qword ptr [rsi + 0x5c8]
14591cb33: 4889f8 mov rax, rdi
14591cb36: 48c1e005 shl rax, 5
14591cb3a: 0f2e740108 ucomiss xmm6, dword ptr [rcx + rax + 8]
14591cb3f: 72df jb 0x14591cb20
14591cb41: 4c39ff cmp rdi, r15
14591cb44: 0f83f0000000 jae 0x14591cc3a
14591cb4a: 4801c1 add rcx, rax
14591cb4d: 4c8b21 mov r12, qword ptr [rcx]
14591cb50: 448b690c mov r13d, dword ptr [rcx + 0xc]
14591cb54: 8b4118 mov eax, dword ptr [rcx + 0x18]
14591cb57: 8945e0 mov dword ptr [rbp - 0x20], eax
14591cb5a: 488b4110 mov rax, qword ptr [rcx + 0x10]
14591cb5e: 488945d8 mov qword ptr [rbp - 0x28], rax
14591cb62: 488d5120 lea rdx, [rcx + 0x20]
14591cb66: 4989f8 mov r8, rdi
14591cb69: 49f7d0 not r8
14591cb6c: 4d01f8 add r8, r15
14591cb6f: 49c1e005 shl r8, 5
14591cb73: e825ce3d00 call 0x145cf999d
14591cb78: 49ffcf dec r15
14591cb7b: 4c89bed0050000 mov qword ptr [rsi + 0x5d0], r15
14591cb82: 8b45e0 mov eax, dword ptr [rbp - 0x20]
14591cb85: 894308 mov dword ptr [rbx + 8], eax
14591cb88: 488b45d8 mov rax, qword ptr [rbp - 0x28]
14591cb8c: 488903 mov qword ptr [rbx], rax
14591cb8f: c745c801000000 mov dword ptr [rbp - 0x38], 1
14591cb96: c745bc00000000 mov dword ptr [rbp - 0x44], 0
14591cb9d: 488d45bc lea rax, [rbp - 0x44]
14591cba1: 4889442430 mov qword ptr [rsp + 0x30], rax
14591cba6: 488d45c8 lea rax, [rbp - 0x38]
14591cbaa: 4889442428 mov qword ptr [rsp + 0x28], rax
14591cbaf: 48c744242000000000 mov qword ptr [rsp + 0x20], 0
14591cbb8: 41b908000000 mov r9d, 8
14591cbbe: 4c89f1 mov rcx, r14
14591cbc1: 4c89e2 mov rdx, r12
14591cbc4: 4589e8 mov r8d, r13d
14591cbc7: e8d4a4fbff call 0x1458d70a0
14591cbcc: 4c8bbe30060000 mov r15, qword ptr [rsi + 0x630]
14591cbd3: 4c3bbe20060000 cmp r15, qword ptr [rsi + 0x620]
14591cbda: 750d jne 0x14591cbe9
14591cbdc: 488d8e20060000 lea rcx, [rsi + 0x620]
14591cbe3: e8f8d43d00 call 0x145cfa0e0
14591cbe8: 90 nop
14591cbe9: 488b8628060000 mov rax, qword ptr [rsi + 0x628]
14591cbf0: 4c89f9 mov rcx, r15
14591cbf3: 48c1e105 shl rcx, 5
14591cbf7: 0f1045d8 movups xmm0, xmmword ptr [rbp - 0x28]
14591cbfb: 0f104de8 movups xmm1, xmmword ptr [rbp - 0x18]
14591cbff: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14591cc04: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14591cc08: 49ffc7 inc r15
14591cc0b: 4c89be30060000 mov qword ptr [rsi + 0x630], r15
14591cc12: 4c8bbed0050000 mov r15, qword ptr [rsi + 0x5d0]
14591cc19: 4c39ff cmp rdi, r15
14591cc1c: 0f820affffff jb 0x14591cb2c
14591cc22: 0f287500 movaps xmm6, xmmword ptr [rbp]
14591cc26: 4881c498000000 add rsp, 0x98
14591cc2d: 5b pop rbx
14591cc2e: 5f pop rdi
14591cc2f: 5e pop rsi
14591cc30: 415c pop r12
14591cc32: 415d pop r13
14591cc34: 415e pop r14
14591cc36: 415f pop r15
14591cc38: 5d pop rbp
14591cc39: c3 ret
14591cc3a: 4c8d053ff89e01 lea r8, [rip + 0x19ef83f]
14591cc41: 4889f9 mov rcx, rdi
14591cc44: 4c89fa mov rdx, r15
14591cc47: e80ff25700 call 0x145e9be5b
14591cc4c: 0f0b ud2
