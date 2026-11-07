1458bfdd0: 55 push rbp
1458bfdd1: 4156 push r14
1458bfdd3: 56 push rsi
1458bfdd4: 57 push rdi
1458bfdd5: 53 push rbx
1458bfdd6: 4881ec80000000 sub rsp, 0x80
1458bfddd: 488dac2480000000 lea rbp, [rsp + 0x80]
1458bfde5: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
1458bfded: 4489cf mov edi, r9d
1458bfdf0: 4c89c3 mov rbx, r8
1458bfdf3: 4989d6 mov r14, rdx
1458bfdf6: 4889ce mov rsi, rcx
1458bfdf9: e8022474fa call 0x140002200
1458bfdfe: b920000000 mov ecx, 0x20
1458bfe03: ba01000000 mov edx, 1
1458bfe08: e8b32374fa call 0x1400021c0
1458bfe0d: 4885c0 test rax, rax
1458bfe10: 0f84f2000000 je 0x1458bff08
1458bfe16: 66c745f0dd00 mov word ptr [rbp - 0x10], 0xdd
1458bfe1c: 48c745d820000000 mov qword ptr [rbp - 0x28], 0x20
1458bfe24: 488945e0 mov qword ptr [rbp - 0x20], rax
1458bfe28: 48c745e800000000 mov qword ptr [rbp - 0x18], 0
1458bfe30: 488d55d8 lea rdx, [rbp - 0x28]
1458bfe34: 4c89f1 mov rcx, r14
1458bfe37: e834870000 call 0x1458c8570
1458bfe3c: 90 nop
1458bfe3d: 0f1045d8 movups xmm0, xmmword ptr [rbp - 0x28]
1458bfe41: 0f104de8 movups xmm1, xmmword ptr [rbp - 0x18]
1458bfe45: 0f294dc0 movaps xmmword ptr [rbp - 0x40], xmm1
1458bfe49: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458bfe4d: 488d4dd8 lea rcx, [rbp - 0x28]
1458bfe51: 488d55b0 lea rdx, [rbp - 0x50]
1458bfe55: 4989d8 mov r8, rbx
1458bfe58: e8d361feff call 0x1458a6030
1458bfe5d: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458bfe61: 488b55e8 mov rdx, qword ptr [rbp - 0x18]
1458bfe65: 4829d0 sub rax, rdx
1458bfe68: 4883f803 cmp rax, 3
1458bfe6c: 7672 jbe 0x1458bfee0
1458bfe6e: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458bfe72: 893c10 mov dword ptr [rax + rdx], edi
1458bfe75: 4883c204 add rdx, 4
1458bfe79: 488955e8 mov qword ptr [rbp - 0x18], rdx
1458bfe7d: 0f1045d8 movups xmm0, xmmword ptr [rbp - 0x28]
1458bfe81: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458bfe85: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458bfe89: 488945c0 mov qword ptr [rbp - 0x40], rax
1458bfe8d: 488b45f0 mov rax, qword ptr [rbp - 0x10]
1458bfe91: 488945c8 mov qword ptr [rbp - 0x38], rax
1458bfe95: 488b7dc0 mov rdi, qword ptr [rbp - 0x40]
1458bfe99: 483b7db0 cmp rdi, qword ptr [rbp - 0x50]
1458bfe9d: 750a jne 0x1458bfea9
1458bfe9f: 488d4db0 lea rcx, [rbp - 0x50]
1458bfea3: e848354d00 call 0x145d933f0
1458bfea8: 90 nop
1458bfea9: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458bfead: c6043801 mov byte ptr [rax + rdi], 1
1458bfeb1: 48ffc7 inc rdi
1458bfeb4: 48897dc0 mov qword ptr [rbp - 0x40], rdi
1458bfeb8: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458bfebc: 0f1106 movups xmmword ptr [rsi], xmm0
1458bfebf: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458bfec3: 48894610 mov qword ptr [rsi + 0x10], rax
1458bfec7: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458bfecb: 48894618 mov qword ptr [rsi + 0x18], rax
1458bfecf: 4889f0 mov rax, rsi
1458bfed2: 4881c480000000 add rsp, 0x80
1458bfed9: 5b pop rbx
1458bfeda: 5f pop rdi
1458bfedb: 5e pop rsi
1458bfedc: 415e pop r14
1458bfede: 5d pop rbp
1458bfedf: c3 ret
1458bfee0: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458bfee9: 488d4dd8 lea rcx, [rbp - 0x28]
1458bfeed: 41b804000000 mov r8d, 4
1458bfef3: 41b901000000 mov r9d, 1
1458bfef9: e8924b3300 call 0x145bf4a90
1458bfefe: 90 nop
1458bfeff: 488b55e8 mov rdx, qword ptr [rbp - 0x18]
1458bff03: e966ffffff jmp 0x1458bfe6e
1458bff08: b901000000 mov ecx, 1
1458bff0d: ba20000000 mov edx, 0x20
1458bff12: e8e4354d00 call 0x145d934fb
1458bff17: 0f0b ud2
