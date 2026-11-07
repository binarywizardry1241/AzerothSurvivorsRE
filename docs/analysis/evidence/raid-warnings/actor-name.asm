14590d9a0: 55 push rbp
14590d9a1: 4156 push r14
14590d9a3: 56 push rsi
14590d9a4: 57 push rdi
14590d9a5: 53 push rbx
14590d9a6: 4883ec60 sub rsp, 0x60
14590d9aa: 488d6c2460 lea rbp, [rsp + 0x60]
14590d9af: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
14590d9b7: 48837918ff cmp qword ptr [rcx + 0x18], -1
14590d9bc: 7446 je 0x14590da04
14590d9be: 488b7930 mov rdi, qword ptr [rcx + 0x30]
14590d9c2: 488d4740 lea rax, [rdi + 0x40]
14590d9c6: 488945c8 mov qword ptr [rbp - 0x38], rax
14590d9ca: 488d050f0f2d00 lea rax, [rip + 0x2d0f0f]
14590d9d1: 488945d0 mov qword ptr [rbp - 0x30], rax
14590d9d5: 488d15644b2c01 lea rdx, [rip + 0x12c4b64]
14590d9dc: 488d4dd8 lea rcx, [rbp - 0x28]
14590d9e0: 4c8d45c8 lea r8, [rbp - 0x38]
14590d9e4: e847f42b00 call 0x145bcce30
14590d9e9: 488b4de0 mov rcx, qword ptr [rbp - 0x20]
14590d9ed: 488b55e8 mov rdx, qword ptr [rbp - 0x18]
14590d9f1: 488b37 mov rsi, qword ptr [rdi]
14590d9f4: 488b5f08 mov rbx, qword ptr [rdi + 8]
14590d9f8: 48894df0 mov qword ptr [rbp - 0x10], rcx
14590d9fc: e8ffeafdff call 0x1458ec500
14590da01: 90 nop
14590da02: eb4d jmp 0x14590da51
14590da04: 488bb9f8000000 mov rdi, qword ptr [rcx + 0xf8]
14590da0b: 4885ff test rdi, rdi
14590da0e: 747e je 0x14590da8e
14590da10: 488d4720 lea rax, [rdi + 0x20]
14590da14: 488945c8 mov qword ptr [rbp - 0x38], rax
14590da18: 488d05c10e2d00 lea rax, [rip + 0x2d0ec1]
14590da1f: 488945d0 mov qword ptr [rbp - 0x30], rax
14590da23: 488d15f54a2c01 lea rdx, [rip + 0x12c4af5]
14590da2a: 488d4dd8 lea rcx, [rbp - 0x28]
14590da2e: 4c8d45c8 lea r8, [rbp - 0x38]
14590da32: e8f9f32b00 call 0x145bcce30
14590da37: 488b4de0 mov rcx, qword ptr [rbp - 0x20]
14590da3b: 488b55e8 mov rdx, qword ptr [rbp - 0x18]
14590da3f: 488b7710 mov rsi, qword ptr [rdi + 0x10]
14590da43: 488b5f18 mov rbx, qword ptr [rdi + 0x18]
14590da47: 48894df0 mov qword ptr [rbp - 0x10], rcx
14590da4b: e8b0eafdff call 0x1458ec500
14590da50: 90 nop
14590da51: 4889c7 mov rdi, rax
14590da54: 488b45d8 mov rax, qword ptr [rbp - 0x28]
14590da58: 4885c0 test rax, rax
14590da5b: 7418 je 0x14590da75
14590da5d: 41b801000000 mov r8d, 1
14590da63: 488b4df0 mov rcx, qword ptr [rbp - 0x10]
14590da67: 4989d6 mov r14, rdx
14590da6a: 4889c2 mov rdx, rax
14590da6d: e85e476ffa call 0x1400021d0
14590da72: 4c89f2 mov rdx, r14
14590da75: 4885ff test rdi, rdi
14590da78: 480f44d3 cmove rdx, rbx
14590da7c: 480f45f7 cmovne rsi, rdi
14590da80: 4889f0 mov rax, rsi
14590da83: 4883c460 add rsp, 0x60
14590da87: 5b pop rbx
14590da88: 5f pop rdi
14590da89: 5e pop rsi
14590da8a: 415e pop r14
14590da8c: 5d pop rbp
14590da8d: c3 ret
14590da8e: 488d3dfbdf8f01 lea rdi, [rip + 0x18fdffb]
14590da95: bb05000000 mov ebx, 5
14590da9a: ba05000000 mov edx, 5
14590da9f: 4889f9 mov rcx, rdi
14590daa2: e859eafdff call 0x1458ec500
14590daa7: 4889c6 mov rsi, rax
14590daaa: 4885c0 test rax, rax
14590daad: 480f44d3 cmove rdx, rbx
14590dab1: 480f44f7 cmove rsi, rdi
14590dab5: ebc9 jmp 0x14590da80
