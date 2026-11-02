0x14000eb00: 55                       push rbp
0x14000eb01: 4157                     push r15
0x14000eb03: 4156                     push r14
0x14000eb05: 56                       push rsi
0x14000eb06: 57                       push rdi
0x14000eb07: 53                       push rbx
0x14000eb08: 4881eca8000000           sub rsp, 0xa8
0x14000eb0f: 488dac2480000000         lea rbp, [rsp + 0x80]
0x14000eb17: 48c74520feffffff         mov qword ptr [rbp + 0x20], 0xfffffffffffffffe
0x14000eb1f: 4889d7                   mov rdi, rdx
0x14000eb22: 4889ce                   mov rsi, rcx
0x14000eb25: 48833aff                 cmp qword ptr [rdx], -1
0x14000eb29: 7422                     je 0x14000eb4d
0x14000eb2b: 4c8b7708                 mov r14, qword ptr [rdi + 8]
0x14000eb2f: 488b5f10                 mov rbx, qword ptr [rdi + 0x10]
0x14000eb33: 48837f18ff               cmp qword ptr [rdi + 0x18], -1
0x14000eb38: 7521                     jne 0x14000eb5b
0x14000eb3a: 4c89f1                   mov rcx, r14
0x14000eb3d: 4889da                   mov rdx, rbx
0x14000eb40: e86b1c8c05               call 0x1458d07b0
0x14000eb45: 4989d0                   mov r8, rdx
0x14000eb48: e9fa000000               jmp 0x14000ec47
0x14000eb4d: 48837f18ff               cmp qword ptr [rdi + 0x18], -1
0x14000eb52: 0f84e7000000             je 0x14000ec3f
0x14000eb58: 4531f6                   xor r14d, r14d
0x14000eb5b: 488b5720                 mov rdx, qword ptr [rdi + 0x20]
0x14000eb5f: 31c0                     xor eax, eax
0x14000eb61: 48837f30ff               cmp qword ptr [rdi + 0x30], -1
0x14000eb66: 4c8b4728                 mov r8, qword ptr [rdi + 0x28]
0x14000eb6a: 480f454740               cmovne rax, qword ptr [rdi + 0x40]
0x14000eb6f: 41bf01000000             mov r15d, 1
0x14000eb75: 4c8b4f38                 mov r9, qword ptr [rdi + 0x38]
0x14000eb79: 4d0f44cf                 cmove r9, r15
0x14000eb7d: 4889442420               mov qword ptr [rsp + 0x20], rax
0x14000eb82: 488d4de0                 lea rcx, [rbp - 0x20]
0x14000eb86: e875098c05               call 0x1458cf500
0x14000eb8b: 48837f48ff               cmp qword ptr [rdi + 0x48], -1
0x14000eb90: 7441                     je 0x14000ebd3
0x14000eb92: 488b5750                 mov rdx, qword ptr [rdi + 0x50]
0x14000eb96: 4c8b4758                 mov r8, qword ptr [rdi + 0x58]
0x14000eb9a: 488d4dc8                 lea rcx, [rbp - 0x38]
0x14000eb9e: e80da18905               call 0x1458a8cb0
0x14000eba3: 90                       nop
0x14000eba4: 48837dc8ff               cmp qword ptr [rbp - 0x38], -1
0x14000eba9: 7428                     je 0x14000ebd3
0x14000ebab: 488b55e0                 mov rdx, qword ptr [rbp - 0x20]
0x14000ebaf: 4885d2                   test rdx, rdx
0x14000ebb2: 740f                     je 0x14000ebc3
0x14000ebb4: 488b4de8                 mov rcx, qword ptr [rbp - 0x18]
0x14000ebb8: 41b801000000             mov r8d, 1
0x14000ebbe: e80d36ffff               call 0x1400021d0
0x14000ebc3: 488b45d8                 mov rax, qword ptr [rbp - 0x28]
0x14000ebc7: 488945f0                 mov qword ptr [rbp - 0x10], rax
0x14000ebcb: 0f1045c8                 movups xmm0, xmmword ptr [rbp - 0x38]
0x14000ebcf: 0f2945e0                 movaps xmmword ptr [rbp - 0x20], xmm0
0x14000ebd3: 0fb64760                 movzx eax, byte ptr [rdi + 0x60]
0x14000ebd7: 884512                   mov byte ptr [rbp + 0x12], al
0x14000ebda: 4d85f6                   test r14, r14
0x14000ebdd: 4d0f45fe                 cmovne r15, r14
0x14000ebe1: 490f44de                 cmove rbx, r14
0x14000ebe5: 4c89f9                   mov rcx, r15
0x14000ebe8: 4889da                   mov rdx, rbx
0x14000ebeb: e8c01b8c05               call 0x1458d07b0
0x14000ebf0: 90                       nop
0x14000ebf1: 4989d0                   mov r8, rdx
0x14000ebf4: 4c8b4de8                 mov r9, qword ptr [rbp - 0x18]
0x14000ebf8: 488b4df0                 mov rcx, qword ptr [rbp - 0x10]
0x14000ebfc: 48894c2420               mov qword ptr [rsp + 0x20], rcx
0x14000ec01: 488d4db0                 lea rcx, [rbp - 0x50]
0x14000ec05: 4889c2                   mov rdx, rax
0x14000ec08: e843188805               call 0x145890450
0x14000ec0d: 90                       nop
0x14000ec0e: 488b4510                 mov rax, qword ptr [rbp + 0x10]
0x14000ec12: 48894648                 mov qword ptr [rsi + 0x48], rax
0x14000ec16: 0f2845e0                 movaps xmm0, xmmword ptr [rbp - 0x20]
0x14000ec1a: 0f284df0                 movaps xmm1, xmmword ptr [rbp - 0x10]
0x14000ec1e: 0f285500                 movaps xmm2, xmmword ptr [rbp]
0x14000ec22: 0f115638                 movups xmmword ptr [rsi + 0x38], xmm2
0x14000ec26: 0f114e28                 movups xmmword ptr [rsi + 0x28], xmm1
0x14000ec2a: 0f114618                 movups xmmword ptr [rsi + 0x18], xmm0
0x14000ec2e: 0f1045b0                 movups xmm0, xmmword ptr [rbp - 0x50]
0x14000ec32: 0f1106                   movups xmmword ptr [rsi], xmm0
0x14000ec35: 488b45c0                 mov rax, qword ptr [rbp - 0x40]
0x14000ec39: 48894610                 mov qword ptr [rsi + 0x10], rax
0x14000ec3d: eb24                     jmp 0x14000ec63
0x14000ec3f: 807f6100                 cmp byte ptr [rdi + 0x61], 0
0x14000ec43: 7431                     je 0x14000ec76
0x14000ec45: 31c0                     xor eax, eax
0x14000ec47: 4889f1                   mov rcx, rsi
0x14000ec4a: 4889c2                   mov rdx, rax
0x14000ec4d: 4531c9                   xor r9d, r9d
0x14000ec50: e8fb178805               call 0x145890450
0x14000ec55: 48b80100000000000080     movabs rax, 0x8000000000000001
0x14000ec5f: 48894618                 mov qword ptr [rsi + 0x18], rax
0x14000ec63: 4889f0                   mov rax, rsi
0x14000ec66: 4881c4a8000000           add rsp, 0xa8
0x14000ec6d: 5b                       pop rbx
0x14000ec6e: 5f                       pop rdi
0x14000ec6f: 5e                       pop rsi
0x14000ec70: 415e                     pop r14
0x14000ec72: 415f                     pop r15
0x14000ec74: 5d                       pop rbp
0x14000ec75: c3                       ret
0x14000ec76: b901000000               mov ecx, 1
0x14000ec7b: 31d2                     xor edx, edx
0x14000ec7d: e82e1b8c05               call 0x1458d07b0
0x14000ec82: 4989d0                   mov r8, rdx
0x14000ec85: 4889f1                   mov rcx, rsi
0x14000ec88: 4889c2                   mov rdx, rax
0x14000ec8b: 4531c9                   xor r9d, r9d
0x14000ec8e: e8bd178805               call 0x145890450
0x14000ec93: 48b80000000000000080     movabs rax, 0x8000000000000000
0x14000ec9d: ebc0                     jmp 0x14000ec5f
