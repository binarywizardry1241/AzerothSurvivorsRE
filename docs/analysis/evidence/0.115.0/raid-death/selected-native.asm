145923d40: 488b85b8010000 mov rax, qword ptr [rbp + 0x1b8]
145923d47: 4c8934f0 mov qword ptr [rax + rsi*8], r14
145923d4b: 48ffc6 inc rsi
145923d4e: 4889b5c0010000 mov qword ptr [rbp + 0x1c0], rsi
145923d55: 488b8538020000 mov rax, qword ptr [rbp + 0x238]
145923d5c: 4c8ba878050000 mov r13, qword ptr [rax + 0x578]
145923d63: 488b8880050000 mov rcx, qword ptr [rax + 0x580]
145923d6a: 4c69c1e0010000 imul r8, rcx, 0x1e0
145923d71: 488b90b0050000 mov rdx, qword ptr [rax + 0x5b0]
145923d78: 4c8b88a8050000 mov r9, qword ptr [rax + 0x5a8]
145923d7f: f30f108528020000 movss xmm0, dword ptr [rbp + 0x228]
145923d87: 440fb690410c0000 movzx r10d, byte ptr [rax + 0xc41]
145923d8f: 4c8b98400b0000 mov r11, qword ptr [rax + 0xb40]
145923d96: 4939dc cmp r12, rbx
145923d99: 0f928508010000 setb byte ptr [rbp + 0x108]
145923da0: 0f83db230000 jae 0x145926181
145923da6: 4d89e6 mov r14, r12
145923da9: 49ffc4 inc r12
145923dac: 4885c9 test rcx, rcx
145923daf: 0f846b020000 je 0x145924020
145923db5: 4939d6 cmp r14, rdx
145923db8: 0f839a410000 jae 0x145927f58
145923dbe: 4c89f0 mov rax, r14
145923dc1: 48c1e007 shl rax, 7
145923dc5: 4d8d3c01 lea r15, [r9 + rax]
145923dc9: 498b740120 mov rsi, qword ptr [r9 + rax + 0x20]
145923dce: 31ff xor edi, edi
145923dd0: eb1e jmp 0x145923df0
145923dd2: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145923de0: 4881c7e0010000 add rdi, 0x1e0
145923de7: 4939f8 cmp r8, rdi
145923dea: 0f8430020000 je 0x145924020
145923df0: 4939b43df0000000 cmp qword ptr [r13 + rdi + 0xf0], rsi
145923df8: 75e6 jne 0x145923de0
145923dfa: 4183bc3db000000001 cmp dword ptr [r13 + rdi + 0xb0], 1
145923e03: 74db je 0x145923de0
145924020: 488bb5c0010000 mov rsi, qword ptr [rbp + 0x1c0]
145924027: 483bb5b0010000 cmp rsi, qword ptr [rbp + 0x1b0]
14592402e: 0f850cfdffff jne 0x145923d40
145927064: 4c89f7 mov rdi, r14
145927067: 4d8b6ef8 mov r13, qword ptr [r14 - 8]
14592706b: 4c8bb3b0050000 mov r14, qword ptr [rbx + 0x5b0]
145927072: 4d39f5 cmp r13, r14
145927075: 0f83210e0000 jae 0x145927e9c
14592707b: 488b83a8050000 mov rax, qword ptr [rbx + 0x5a8]
145927082: 4c89ea mov rdx, r13
145927085: 48c1e207 shl rdx, 7
145927089: 488d0c10 lea rcx, [rax + rdx]
14592708d: 4c8b3c10 mov r15, qword ptr [rax + rdx]
145927091: 4889de mov rsi, rbx
145927094: 488b5c1028 mov rbx, qword ptr [rax + rdx + 0x28]
145927099: 448b44103c mov r8d, dword ptr [rax + rdx + 0x3c]
14592709e: 44898540020000 mov dword ptr [rbp + 0x240], r8d
1459270a5: 440fb664107e movzx r12d, byte ptr [rax + rdx + 0x7e]
1459270ab: 4801c2 add rdx, rax
1459270ae: 4881c280000000 add rdx, 0x80
1459270b5: 4d89e8 mov r8, r13
1459270b8: 49f7d0 not r8
1459270bb: 4d01f0 add r8, r14
1459270be: 49c1e007 shl r8, 7
1459270c2: e840d53e00 call 0x145d14607
1459270c7: 49ffce dec r14
1459270ca: 4c89b6b0050000 mov qword ptr [rsi + 0x5b0], r14
1459270d1: 4983ff02 cmp r15, 2
1459270d5: 0f84c10d0000 je 0x145927e9c
1459270db: 4885db test rbx, rbx
1459270de: 4989fe mov r14, rdi
1459270e1: 0f848e000000 je 0x145927175
1459270e7: e814b16dfa call 0x140002200
1459270ec: b920000000 mov ecx, 0x20
1459270f1: ba01000000 mov edx, 1
1459270f6: e8c5b06dfa call 0x1400021c0
1459270fb: 4885c0 test rax, rax
1459270fe: 0f84f90e0000 je 0x145927ffd
145927104: 48898530020000 mov qword ptr [rbp + 0x230], rax
14592710b: 488918 mov qword ptr [rax], rbx
14592710e: 488b8538020000 mov rax, qword ptr [rbp + 0x238]
145927115: 488b9840060000 mov rbx, qword ptr [rax + 0x640]
14592711c: 483b9830060000 cmp rbx, qword ptr [rax + 0x630]
145927123: 750d jne 0x145927132
145927125: 488b8d58010000 mov rcx, qword ptr [rbp + 0x158]
14592712c: e8bfdf3e00 call 0x145d150f0
145927131: 90 nop
145927132: 488b9538020000 mov rdx, qword ptr [rbp + 0x238]
145927139: 488b8238060000 mov rax, qword ptr [rdx + 0x638]
145927140: 4889d9 mov rcx, rbx
145927143: 48c1e105 shl rcx, 5
145927147: 48c7040820000000 mov qword ptr [rax + rcx], 0x20
14592714f: 4c8b8530020000 mov r8, qword ptr [rbp + 0x230]
145927156: 4c89440808 mov qword ptr [rax + rcx + 8], r8
14592715b: 48c744081008000000 mov qword ptr [rax + rcx + 0x10], 8
145927164: 66c7440818aa00 mov word ptr [rax + rcx + 0x18], 0xaa
14592716b: 48ffc3 inc rbx
14592716e: 48899a40060000 mov qword ptr [rdx + 0x640], rbx
145927175: 4983c6f8 add r14, -8
145927179: 4180fc01 cmp r12b, 1
14592717d: 488b9d38020000 mov rbx, qword ptr [rbp + 0x238]
145927184: 488db580010000 lea rsi, [rbp + 0x180]
14592718b: 488dbde0010000 lea rdi, [rbp + 0x1e0]
145927192: 0f85bcfeffff jne 0x145927054
145950005: c781b000000001000000 mov dword ptr [rcx + 0xb0], 1
14595000f: f3440f1181b4000000 movss dword ptr [rcx + 0xb4], xmm8
14592b940: 55 push rbp
14592b941: 4157 push r15
14592b943: 4156 push r14
14592b945: 4155 push r13
14592b947: 4154 push r12
14592b949: 56 push rsi
14592b94a: 57 push rdi
14592b94b: 53 push rbx
14592b94c: 4881ec98000000 sub rsp, 0x98
14592b953: 488dac2480000000 lea rbp, [rsp + 0x80]
14592b95b: 0f297500 movaps xmmword ptr [rbp], xmm6
14592b95f: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
14592b967: 4c8bb9e0050000 mov r15, qword ptr [rcx + 0x5e0]
14592b96e: 4d85ff test r15, r15
14592b971: 0f841b010000 je 0x14592ba92
14592b977: 4889ce mov rsi, rcx
14592b97a: f30f10b19c0b0000 movss xmm6, dword ptr [rcx + 0xb9c]
14592b982: 488d5dcc lea rbx, [rbp - 0x34]
14592b986: 31ff xor edi, edi
14592b988: 4c8d75d8 lea r14, [rbp - 0x28]
14592b98c: eb0e jmp 0x14592b99c
14592b98e: 6690 nop
14592b990: 48ffc7 inc rdi
14592b993: 4c39ff cmp rdi, r15
14592b996: 0f83f6000000 jae 0x14592ba92
14592b99c: 488b8ed8050000 mov rcx, qword ptr [rsi + 0x5d8]
14592b9a3: 4889f8 mov rax, rdi
14592b9a6: 48c1e005 shl rax, 5
14592b9aa: 0f2e740108 ucomiss xmm6, dword ptr [rcx + rax + 8]
14592b9af: 72df jb 0x14592b990
14592b9b1: 4c39ff cmp rdi, r15
14592b9b4: 0f83f0000000 jae 0x14592baaa
14592b9ba: 4801c1 add rcx, rax
14592b9bd: 4c8b21 mov r12, qword ptr [rcx]
14592b9c0: 448b690c mov r13d, dword ptr [rcx + 0xc]
14592b9c4: 8b4118 mov eax, dword ptr [rcx + 0x18]
14592b9c7: 8945e0 mov dword ptr [rbp - 0x20], eax
14592b9ca: 488b4110 mov rax, qword ptr [rcx + 0x10]
14592b9ce: 488945d8 mov qword ptr [rbp - 0x28], rax
14592b9d2: 488d5120 lea rdx, [rcx + 0x20]
14592b9d6: 4989f8 mov r8, rdi
14592b9d9: 49f7d0 not r8
14592b9dc: 4d01f8 add r8, r15
14592b9df: 49c1e005 shl r8, 5
14592b9e3: e81f8c3e00 call 0x145d14607
14592b9e8: 49ffcf dec r15
14592b9eb: 4c89bee0050000 mov qword ptr [rsi + 0x5e0], r15
14592b9f2: 8b45e0 mov eax, dword ptr [rbp - 0x20]
14592b9f5: 894308 mov dword ptr [rbx + 8], eax
14592b9f8: 488b45d8 mov rax, qword ptr [rbp - 0x28]
14592b9fc: 488903 mov qword ptr [rbx], rax
14592b9ff: c745c801000000 mov dword ptr [rbp - 0x38], 1
14592ba06: c745bc00000000 mov dword ptr [rbp - 0x44], 0
14592ba0d: 488d45bc lea rax, [rbp - 0x44]
14592ba11: 4889442430 mov qword ptr [rsp + 0x30], rax
14592ba16: 488d45c8 lea rax, [rbp - 0x38]
14592ba1a: 4889442428 mov qword ptr [rsp + 0x28], rax
14592ba1f: 48c744242000000000 mov qword ptr [rsp + 0x20], 0
14592ba28: 41b908000000 mov r9d, 8
14592ba2e: 4c89f1 mov rcx, r14
14592ba31: 4c89e2 mov rdx, r12
14592ba34: 4589e8 mov r8d, r13d
14592ba37: e8f4c80800 call 0x1459b8330
14592ba3c: 4c8bbe40060000 mov r15, qword ptr [rsi + 0x640]
14592ba43: 4c3bbe30060000 cmp r15, qword ptr [rsi + 0x630]
14592ba4a: 750d jne 0x14592ba59
14592ba4c: 488d8e30060000 lea rcx, [rsi + 0x630]
14592ba53: e898963e00 call 0x145d150f0
14592ba58: 90 nop
14592ba59: 488b8638060000 mov rax, qword ptr [rsi + 0x638]
14592ba60: 4c89f9 mov rcx, r15
14592ba63: 48c1e105 shl rcx, 5
14592ba67: 0f1045d8 movups xmm0, xmmword ptr [rbp - 0x28]
14592ba6b: 0f104de8 movups xmm1, xmmword ptr [rbp - 0x18]
14592ba6f: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14592ba74: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14592ba78: 49ffc7 inc r15
14592ba7b: 4c89be40060000 mov qword ptr [rsi + 0x640], r15
14592ba82: 4c8bbee0050000 mov r15, qword ptr [rsi + 0x5e0]
14592ba89: 4c39ff cmp rdi, r15
14592ba8c: 0f820affffff jb 0x14592b99c
14592ba92: 0f287500 movaps xmm6, xmmword ptr [rbp]
14592ba96: 4881c498000000 add rsp, 0x98
14592ba9d: 5b pop rbx
14592ba9e: 5f pop rdi
14592ba9f: 5e pop rsi
14592baa0: 415c pop r12
14592baa2: 415d pop r13
14592baa4: 415e pop r14
14592baa6: 415f pop r15
14592baa8: 5d pop rbp
14592baa9: c3 ret
14592baaa: 4c8d057f4da001 lea r8, [rip + 0x1a04d7f]
14592bab1: 4889f9 mov rcx, rdi
14592bab4: 4c89fa mov rdx, r15
14592bab7: e8dfb55800 call 0x145eb709b
14592babc: 0f0b ud2
