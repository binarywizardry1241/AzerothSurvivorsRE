1459bae00: 55 push rbp
1459bae01: 4157 push r15
1459bae03: 4156 push r14
1459bae05: 4155 push r13
1459bae07: 4154 push r12
1459bae09: 56 push rsi
1459bae0a: 57 push rdi
1459bae0b: 53 push rbx
1459bae0c: 4883ec78 sub rsp, 0x78
1459bae10: 488d6c2470 lea rbp, [rsp + 0x70]
1459bae15: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
1459bae1d: 48894dc0 mov qword ptr [rbp - 0x40], rcx
1459bae21: 4c8b2a mov r13, qword ptr [rdx]
1459bae24: 488955f8 mov qword ptr [rbp - 8], rdx
1459bae28: 488b4208 mov rax, qword ptr [rdx + 8]
1459bae2c: 488945f0 mov qword ptr [rbp - 0x10], rax
1459bae30: 4939c5 cmp r13, rax
1459bae33: 0f84a4010000 je 0x1459bafdd
1459bae39: 488b45f8 mov rax, qword ptr [rbp - 8]
1459bae3d: 488b4010 mov rax, qword ptr [rax + 0x10]
1459bae41: 488945e8 mov qword ptr [rbp - 0x18], rax
1459bae45: 4c8b7810 mov r15, qword ptr [rax + 0x10]
1459bae49: 4d85ff test r15, r15
1459bae4c: 0f848b010000 je 0x1459bafdd
1459bae52: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1459bae56: 4c8b6008 mov r12, qword ptr [rax + 8]
1459bae5a: 49c1e705 shl r15, 5
1459bae5e: eb0a jmp 0x1459bae6a
1459bae60: 4c3b6df0 cmp r13, qword ptr [rbp - 0x10]
1459bae64: 0f8473010000 je 0x1459bafdd
1459bae6a: 4c89ee mov rsi, r13
1459bae6d: 4983c518 add r13, 0x18
1459bae71: 488b1e mov rbx, qword ptr [rsi]
1459bae74: 4c8b7608 mov r14, qword ptr [rsi + 8]
1459bae78: 31ff xor edi, edi
1459bae7a: eb0d jmp 0x1459bae89
1459bae7c: 0f1f4000 nop dword ptr [rax]
1459bae80: 4883c720 add rdi, 0x20
1459bae84: 4939ff cmp r15, rdi
1459bae87: 74d7 je 0x1459bae60
1459bae89: 4d39743c10 cmp qword ptr [r12 + rdi + 0x10], r14
1459bae8e: 75f0 jne 0x1459bae80
1459bae90: 498b4c3c08 mov rcx, qword ptr [r12 + rdi + 8]
1459bae95: 4889da mov rdx, rbx
1459bae98: 4d89f0 mov r8, r14
1459bae9b: e841f22300 call 0x145bfa0e1
1459baea0: 85c0 test eax, eax
1459baea2: 75dc jne 0x1459bae80
1459baea4: 41807c3c1800 cmp byte ptr [r12 + rdi + 0x18], 0
1459baeaa: 74b4 je 0x1459bae60
1459baeac: 488b45f8 mov rax, qword ptr [rbp - 8]
1459baeb0: 4c8928 mov qword ptr [rax], r13
1459baeb3: 0fb65e10 movzx ebx, byte ptr [rsi + 0x10]
1459baeb7: e8447364fa call 0x140002200
1459baebc: b908000000 mov ecx, 8
1459baec1: ba01000000 mov edx, 1
1459baec6: e8f57264fa call 0x1400021c0
1459baecb: 4885c0 test rax, rax
1459baece: 0f8435010000 je 0x1459bb009
1459baed4: 8818 mov byte ptr [rax], bl
1459baed6: 48c745d008000000 mov qword ptr [rbp - 0x30], 8
1459baede: 488945f8 mov qword ptr [rbp - 8], rax
1459baee2: 488945d8 mov qword ptr [rbp - 0x28], rax
1459baee6: 48c745e001000000 mov qword ptr [rbp - 0x20], 1
1459baeee: 4c3b6df0 cmp r13, qword ptr [rbp - 0x10]
1459baef2: 0f84c8000000 je 0x1459bafc0
1459baef8: b801000000 mov eax, 1
1459baefd: 488945c8 mov qword ptr [rbp - 0x38], rax
1459baf01: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1459baf05: 488b5810 mov rbx, qword ptr [rax + 0x10]
1459baf09: 4885db test rbx, rbx
1459baf0c: 0f84ae000000 je 0x1459bafc0
1459baf12: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1459baf16: 488b7808 mov rdi, qword ptr [rax + 8]
1459baf1a: 48c1e305 shl rbx, 5
1459baf1e: eb0a jmp 0x1459baf2a
1459baf20: 4c3b6df0 cmp r13, qword ptr [rbp - 0x10]
1459baf24: 0f8496000000 je 0x1459bafc0
1459baf2a: 4c89ee mov rsi, r13
1459baf2d: 4983c518 add r13, 0x18
1459baf31: 4c8b3e mov r15, qword ptr [rsi]
1459baf34: 4c8b6608 mov r12, qword ptr [rsi + 8]
1459baf38: 4531f6 xor r14d, r14d
1459baf3b: eb0c jmp 0x1459baf49
1459baf3d: 0f1f00 nop dword ptr [rax]
1459baf40: 4983c620 add r14, 0x20
1459baf44: 4c39f3 cmp rbx, r14
1459baf47: 74d7 je 0x1459baf20
1459baf49: 4e39643710 cmp qword ptr [rdi + r14 + 0x10], r12
1459baf4e: 75f0 jne 0x1459baf40
1459baf50: 4a8b4c3708 mov rcx, qword ptr [rdi + r14 + 8]
1459baf55: 4c89fa mov rdx, r15
1459baf58: 4d89e0 mov r8, r12
1459baf5b: e881f12300 call 0x145bfa0e1
1459baf60: 85c0 test eax, eax
1459baf62: 75dc jne 0x1459baf40
1459baf64: 42807c371800 cmp byte ptr [rdi + r14 + 0x18], 0
1459baf6a: 74b4 je 0x1459baf20
1459baf6c: 0fb65e10 movzx ebx, byte ptr [rsi + 0x10]
1459baf70: 488b75c8 mov rsi, qword ptr [rbp - 0x38]
1459baf74: 483b75d0 cmp rsi, qword ptr [rbp - 0x30]
1459baf78: 488b45f8 mov rax, qword ptr [rbp - 8]
1459baf7c: 7526 jne 0x1459bafa4
1459baf7e: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1459baf87: 41b801000000 mov r8d, 1
1459baf8d: 41b901000000 mov r9d, 1
1459baf93: 488d4dd0 lea rcx, [rbp - 0x30]
1459baf97: 4889f2 mov rdx, rsi
1459baf9a: e8d1f92300 call 0x145bfa970
1459baf9f: 90 nop
1459bafa0: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1459bafa4: 488945f8 mov qword ptr [rbp - 8], rax
1459bafa8: 881c30 mov byte ptr [rax + rsi], bl
1459bafab: 48ffc6 inc rsi
1459bafae: 488975c8 mov qword ptr [rbp - 0x38], rsi
1459bafb2: 488975e0 mov qword ptr [rbp - 0x20], rsi
1459bafb6: 4c3b6df0 cmp r13, qword ptr [rbp - 0x10]
1459bafba: 0f8541ffffff jne 0x1459baf01
1459bafc0: 488b4de0 mov rcx, qword ptr [rbp - 0x20]
1459bafc4: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1459bafc8: 48894810 mov qword ptr [rax + 0x10], rcx
1459bafcc: 488b4dd0 mov rcx, qword ptr [rbp - 0x30]
1459bafd0: 488908 mov qword ptr [rax], rcx
1459bafd3: 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
1459bafd7: 48894808 mov qword ptr [rax + 8], rcx
1459bafdb: eb1b jmp 0x1459baff8
1459bafdd: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1459bafe1: 48c70000000000 mov qword ptr [rax], 0
1459bafe8: 48c7400801000000 mov qword ptr [rax + 8], 1
1459baff0: 48c7401000000000 mov qword ptr [rax + 0x10], 0
1459baff8: 4883c478 add rsp, 0x78
1459baffc: 5b pop rbx
1459baffd: 5f pop rdi
1459baffe: 5e pop rsi
1459bafff: 415c pop r12
1459bb001: 415d pop r13
1459bb003: 415e pop r14
1459bb005: 415f pop r15
1459bb007: 5d pop rbp
1459bb008: c3 ret
1459bb009: b901000000 mov ecx, 1
1459bb00e: ba08000000 mov edx, 8
1459bb013: e8a3e23d00 call 0x145d992bb
1459bb018: 0f0b ud2
