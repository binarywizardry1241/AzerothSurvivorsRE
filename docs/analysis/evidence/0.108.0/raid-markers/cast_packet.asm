1458bb4b0: 55 push rbp
1458bb4b1: 4156 push r14
1458bb4b3: 56 push rsi
1458bb4b4: 57 push rdi
1458bb4b5: 53 push rbx
1458bb4b6: 4881ec80000000 sub rsp, 0x80
1458bb4bd: 488dac2480000000 lea rbp, [rsp + 0x80]
1458bb4c5: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
1458bb4cd: 4489cf mov edi, r9d
1458bb4d0: 4489c3 mov ebx, r8d
1458bb4d3: 4989d6 mov r14, rdx
1458bb4d6: 4889ce mov rsi, rcx
1458bb4d9: e8226d74fa call 0x140002200
1458bb4de: b920000000 mov ecx, 0x20
1458bb4e3: ba01000000 mov edx, 1
1458bb4e8: e8d36c74fa call 0x1400021c0
1458bb4ed: 4885c0 test rax, rax
1458bb4f0: 0f84a4010000 je 0x1458bb69a
1458bb4f6: 66c745e83101 mov word ptr [rbp - 0x18], 0x131
1458bb4fc: 48c745d020000000 mov qword ptr [rbp - 0x30], 0x20
1458bb504: 488945d8 mov qword ptr [rbp - 0x28], rax
1458bb508: 48c745e000000000 mov qword ptr [rbp - 0x20], 0
1458bb510: 488d55d0 lea rdx, [rbp - 0x30]
1458bb514: 4c89f1 mov rcx, r14
1458bb517: e854d00000 call 0x1458c8570
1458bb51c: 90 nop
1458bb51d: 0f1045d0 movups xmm0, xmmword ptr [rbp - 0x30]
1458bb521: 0f104de0 movups xmm1, xmmword ptr [rbp - 0x20]
1458bb525: 0f294dc0 movaps xmmword ptr [rbp - 0x40], xmm1
1458bb529: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458bb52d: 488d55b0 lea rdx, [rbp - 0x50]
1458bb531: 4c89f1 mov rcx, r14
1458bb534: e837d00000 call 0x1458c8570
1458bb539: 90 nop
1458bb53a: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458bb53e: 0f284dc0 movaps xmm1, xmmword ptr [rbp - 0x40]
1458bb542: 0f294de0 movaps xmmword ptr [rbp - 0x20], xmm1
1458bb546: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458bb54a: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458bb54e: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458bb552: 4829d0 sub rax, rdx
1458bb555: 4883f803 cmp rax, 3
1458bb559: 0f86c3000000 jbe 0x1458bb622
1458bb55f: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458bb563: 891c10 mov dword ptr [rax + rdx], ebx
1458bb566: 4883c204 add rdx, 4
1458bb56a: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458bb56e: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458bb572: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458bb576: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458bb57a: 488945c0 mov qword ptr [rbp - 0x40], rax
1458bb57e: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458bb582: 488945c8 mov qword ptr [rbp - 0x38], rax
1458bb586: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458bb58a: 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458bb58e: 4829d0 sub rax, rdx
1458bb591: 4883f801 cmp rax, 1
1458bb595: 0f86af000000 jbe 0x1458bb64a
1458bb59b: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458bb59f: 66c704100200 mov word ptr [rax + rdx], 2
1458bb5a5: 4883c202 add rdx, 2
1458bb5a9: 488955c0 mov qword ptr [rbp - 0x40], rdx
1458bb5ad: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458bb5b1: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458bb5b5: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458bb5b9: 488945e0 mov qword ptr [rbp - 0x20], rax
1458bb5bd: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458bb5c1: 488945e8 mov qword ptr [rbp - 0x18], rax
1458bb5c5: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458bb5c9: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458bb5cd: 4829d0 sub rax, rdx
1458bb5d0: 4883f803 cmp rax, 3
1458bb5d4: 0f8698000000 jbe 0x1458bb672
1458bb5da: 4c8b4550 mov r8, qword ptr [rbp + 0x50]
1458bb5de: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458bb5e2: 893c10 mov dword ptr [rax + rdx], edi
1458bb5e5: 4883c204 add rdx, 4
1458bb5e9: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458bb5ed: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458bb5f1: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458bb5f5: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458bb5f9: 488945c0 mov qword ptr [rbp - 0x40], rax
1458bb5fd: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458bb601: 488945c8 mov qword ptr [rbp - 0x38], rax
1458bb605: 488d55b0 lea rdx, [rbp - 0x50]
1458bb609: 4889f1 mov rcx, rsi
1458bb60c: e87faf0000 call 0x1458c6590
1458bb611: 4889f0 mov rax, rsi
1458bb614: 4881c480000000 add rsp, 0x80
1458bb61b: 5b pop rbx
1458bb61c: 5f pop rdi
1458bb61d: 5e pop rsi
1458bb61e: 415e pop r14
1458bb620: 5d pop rbp
1458bb621: c3 ret
1458bb622: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458bb62b: 488d4dd0 lea rcx, [rbp - 0x30]
1458bb62f: 41b804000000 mov r8d, 4
1458bb635: 41b901000000 mov r9d, 1
1458bb63b: e850943300 call 0x145bf4a90
1458bb640: 90 nop
1458bb641: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458bb645: e915ffffff jmp 0x1458bb55f
1458bb64a: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458bb653: 488d4db0 lea rcx, [rbp - 0x50]
1458bb657: 41b802000000 mov r8d, 2
1458bb65d: 41b901000000 mov r9d, 1
1458bb663: e828943300 call 0x145bf4a90
1458bb668: 90 nop
1458bb669: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458bb66d: e929ffffff jmp 0x1458bb59b
1458bb672: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458bb67b: 488d4dd0 lea rcx, [rbp - 0x30]
1458bb67f: 41b804000000 mov r8d, 4
1458bb685: 41b901000000 mov r9d, 1
1458bb68b: e800943300 call 0x145bf4a90
1458bb690: 90 nop
1458bb691: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458bb695: e940ffffff jmp 0x1458bb5da
1458bb69a: b901000000 mov ecx, 1
1458bb69f: ba20000000 mov edx, 0x20
1458bb6a4: e8527e4d00 call 0x145d934fb
1458bb6a9: 0f0b ud2
