14594bf30 55 push rbp
14594bf31 4157 push r15
14594bf33 4156 push r14
14594bf35 4155 push r13
14594bf37 4154 push r12
14594bf39 56 push rsi
14594bf3a 57 push rdi
14594bf3b 53 push rbx
14594bf3c 4881eca8000000 sub rsp, 0xa8
14594bf43 488dac2480000000 lea rbp, [rsp + 0x80]
14594bf4b 48c74520feffffff mov qword ptr [rbp + 0x20], 0xfffffffffffffffe
14594bf53 4d89ce mov r14, r9
14594bf56 4c89c3 mov rbx, r8
14594bf59 4889d7 mov rdi, rdx
14594bf5c 4889ce mov rsi, rcx
14594bf5f e89c626bfa call 0x140002200
14594bf64 b901000000 mov ecx, 1
14594bf69 ba01000000 mov edx, 1
14594bf6e e84d626bfa call 0x1400021c0
14594bf73 4885c0 test rax, rax
14594bf76 0f8488040000 je 0x14594c404
14594bf7c c6007b mov byte ptr [rax], 0x7b
14594bf7f 48c745f001000000 mov qword ptr [rbp - 0x10], 1
14594bf87 488945f8 mov qword ptr [rbp - 8], rax
14594bf8b 48c7450001000000 mov qword ptr [rbp], 1
14594bf93 c6450801 mov byte ptr [rbp + 8], 1
14594bf97 4c89742428 mov qword ptr [rsp + 0x28], r14
14594bf9c 48895c2420 mov qword ptr [rsp + 0x20], rbx
14594bfa1 4c8d0592e78d01 lea r8, [rip + 0x18de792]
14594bfa8 488d5dd0 lea rbx, [rbp - 0x30]
14594bfac 488d55f0 lea rdx, [rbp - 0x10]
14594bfb0 41b904000000 mov r9d, 4
14594bfb6 4889d9 mov rcx, rbx
14594bfb9 e862f7f9ff call 0x1458eb720
14594bfbe f30f1087340a0000 movss xmm0, dword ptr [rdi + 0xa34]
14594bfc6 f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14594bfcc 4c8d0573e78d01 lea r8, [rip + 0x18de773]
14594bfd3 4c8d75f0 lea r14, [rbp - 0x10]
14594bfd7 41b904000000 mov r9d, 4
14594bfdd 4c89f1 mov rcx, r14
14594bfe0 4889da mov rdx, rbx
14594bfe3 e8a8a7f9ff call 0x1458e6790
14594bfe8 8b87d8040000 mov eax, dword ptr [rdi + 0x4d8]
14594bfee 89442420 mov dword ptr [rsp + 0x20], eax
14594bff2 4c8d0551e78d01 lea r8, [rip + 0x18de751]
14594bff9 41b905000000 mov r9d, 5
14594bfff 4889d9 mov rcx, rbx
14594c002 4c89f2 mov rdx, r14
14594c005 e806a9f9ff call 0x1458e6910
14594c00a 8b8754070000 mov eax, dword ptr [rdi + 0x754]
14594c010 89442420 mov dword ptr [rsp + 0x20], eax
14594c014 4c8d0556e78d01 lea r8, [rip + 0x18de756]
14594c01b 41b905000000 mov r9d, 5
14594c021 4c89f1 mov rcx, r14
14594c024 4889da mov rdx, rbx
14594c027 e8e4a8f9ff call 0x1458e6910
14594c02c 8b8758070000 mov eax, dword ptr [rdi + 0x758]
14594c032 89442420 mov dword ptr [rsp + 0x20], eax
14594c036 4c8d0527e98d01 lea r8, [rip + 0x18de927]
14594c03d 41b906000000 mov r9d, 6
14594c043 4889d9 mov rcx, rbx
14594c046 4c89f2 mov rdx, r14
14594c049 e8c2a8f9ff call 0x1458e6910
14594c04e 8b875c070000 mov eax, dword ptr [rdi + 0x75c]
14594c054 89442420 mov dword ptr [rsp + 0x20], eax
14594c058 4c8d050be98d01 lea r8, [rip + 0x18de90b]
14594c05f 41b909000000 mov r9d, 9
14594c065 4c89f1 mov rcx, r14
14594c068 4889da mov rdx, rbx
14594c06b e8a0a8f9ff call 0x1458e6910
14594c070 8b8760070000 mov eax, dword ptr [rdi + 0x760]
14594c076 89442420 mov dword ptr [rsp + 0x20], eax
14594c07a 4c8d0577e78d01 lea r8, [rip + 0x18de777]
14594c081 41b906000000 mov r9d, 6
14594c087 4889d9 mov rcx, rbx
14594c08a 4c89f2 mov rdx, r14
14594c08d e87ea8f9ff call 0x1458e6910
14594c092 f20f108708070000 movsd xmm0, qword ptr [rdi + 0x708]
14594c09a f20f11442420 movsd qword ptr [rsp + 0x20], xmm0
14594c0a0 4c8d05f3e68d01 lea r8, [rip + 0x18de6f3]
14594c0a7 41b906000000 mov r9d, 6
14594c0ad 4c89f1 mov rcx, r14
14594c0b0 4889da mov rdx, rbx
14594c0b3 e858a5f9ff call 0x1458e6610
14594c0b8 f20f108710070000 movsd xmm0, qword ptr [rdi + 0x710]
14594c0c0 f20f11442420 movsd qword ptr [rsp + 0x20], xmm0
14594c0c6 4c8d05a6e88d01 lea r8, [rip + 0x18de8a6]
14594c0cd 41b905000000 mov r9d, 5
14594c0d3 4889d9 mov rcx, rbx
14594c0d6 4c89f2 mov rdx, r14
14594c0d9 e832a5f9ff call 0x1458e6610
14594c0de 8b8764070000 mov eax, dword ptr [rdi + 0x764]
14594c0e4 89442420 mov dword ptr [rsp + 0x20], eax
14594c0e8 4c8d0575e68d01 lea r8, [rip + 0x18de675]
14594c0ef 41b904000000 mov r9d, 4
14594c0f5 4c89f1 mov rcx, r14
14594c0f8 4889da mov rdx, rbx
14594c0fb e810a8f9ff call 0x1458e6910
14594c100 8b8768070000 mov eax, dword ptr [rdi + 0x768]
14594c106 89442420 mov dword ptr [rsp + 0x20], eax
14594c10a 4c8d0567e88d01 lea r8, [rip + 0x18de867]
14594c111 488d4dd0 lea rcx, [rbp - 0x30]
14594c115 41b906000000 mov r9d, 6
14594c11b 4c89f2 mov rdx, r14
14594c11e e8eda7f9ff call 0x1458e6910
14594c123 0fb68704030000 movzx eax, byte ptr [rdi + 0x304]
14594c12a 04fe add al, 0xfe
14594c12c 3c09 cmp al, 9
14594c12e 7710 ja 0x14594c140
14594c130 0fb6c0 movzx eax, al
14594c133 488d0dde098e01 lea rcx, [rip + 0x18e09de]
14594c13a 488b1cc1 mov rbx, qword ptr [rcx + rax*8]
14594c13e eb07 jmp 0x14594c147
14594c140 488d1da1452901 lea rbx, [rip + 0x12945a1]
14594c147 488d4310 lea rax, [rbx + 0x10]
14594c14b 488945b8 mov qword ptr [rbp - 0x48], rax
14594c14f 4c8d3d6a5f6bfa lea r15, [rip - 0x594a096]
14594c156 4c897dc0 mov qword ptr [rbp - 0x40], r15
14594c15a c6451f01 mov byte ptr [rbp + 0x1f], 1
14594c15e 488d157c632801 lea rdx, [rip + 0x128637c]
14594c165 488d4df0 lea rcx, [rbp - 0x10]
14594c169 4c8d45b8 lea r8, [rbp - 0x48]
14594c16d e8be0c2800 call 0x145bcce30
14594c172 90 nop
14594c173 488b4df8 mov rcx, qword ptr [rbp - 8]
14594c177 488b5500 mov rdx, qword ptr [rbp]
14594c17b 4c8b6320 mov r12, qword ptr [rbx + 0x20]
14594c17f 4c8b6b28 mov r13, qword ptr [rbx + 0x28]
14594c183 48894dc8 mov qword ptr [rbp - 0x38], rcx
14594c187 e87403faff call 0x1458ec500
14594c18c 90 nop
14594c18d 4989c6 mov r14, rax
14594c190 4889d3 mov rbx, rdx
14594c193 488b55f0 mov rdx, qword ptr [rbp - 0x10]
14594c197 4885d2 test rdx, rdx
14594c19a 740f je 0x14594c1ab
14594c19c 41b801000000 mov r8d, 1
14594c1a2 488b4dc8 mov rcx, qword ptr [rbp - 0x38]
14594c1a6 e825606bfa call 0x1400021d0
14594c1ab 4d85f6 test r14, r14
14594c1ae 4d0f45e6 cmovne r12, r14
14594c1b2 490f44dd cmove rbx, r13
14594c1b6 c6451f00 mov byte ptr [rbp + 0x1f], 0
14594c1ba 48895c2428 mov qword ptr [rsp + 0x28], rbx
14594c1bf 4c89642420 mov qword ptr [rsp + 0x20], r12
14594c1c4 4c8d05b3e78d01 lea r8, [rip + 0x18de7b3]
14594c1cb 488d4df0 lea rcx, [rbp - 0x10]
14594c1cf 488d55d0 lea rdx, [rbp - 0x30]
14594c1d3 41b905000000 mov r9d, 5
14594c1d9 e842f5f9ff call 0x1458eb720
14594c1de 90 nop
14594c1df 0f1087a0010000 movups xmm0, xmmword ptr [rdi + 0x1a0]
14594c1e6 0f11442420 movups xmmword ptr [rsp + 0x20], xmm0
14594c1eb 4c8d0591e78d01 lea r8, [rip + 0x18de791]
14594c1f2 488d4dd0 lea rcx, [rbp - 0x30]
14594c1f6 488d55f0 lea rdx, [rbp - 0x10]
14594c1fa 41b904000000 mov r9d, 4
14594c200 e81bf5f9ff call 0x1458eb720
14594c205 0fb68705030000 movzx eax, byte ptr [rdi + 0x305]
14594c20c 04fe add al, 0xfe
14594c20e 3c06 cmp al, 6
14594c210 7710 ja 0x14594c222
14594c212 0fb6c0 movzx eax, al
14594c215 488d0d8c088e01 lea rcx, [rip + 0x18e088c]
14594c21c 488b0cc1 mov rcx, qword ptr [rcx + rax*8]
14594c220 eb07 jmp 0x14594c229
14594c222 488d0d27332901 lea rcx, [rip + 0x1293327]
14594c229 c6451d01 mov byte ptr [rbp + 0x1d], 1
14594c22d e8ce00f4ff call 0x14588c300
14594c232 90 nop
14594c233 c6451d00 mov byte ptr [rbp + 0x1d], 0
14594c237 4889542428 mov qword ptr [rsp + 0x28], rdx
14594c23c 4889442420 mov qword ptr [rsp + 0x20], rax
14594c241 4c8d053fe78d01 lea r8, [rip + 0x18de73f]
14594c248 488d4df0 lea rcx, [rbp - 0x10]
14594c24c 488d55d0 lea rdx, [rbp - 0x30]
14594c250 41b904000000 mov r9d, 4
14594c256 e8c5f4f9ff call 0x1458eb720
14594c25b 90 nop
14594c25c 488b8f90020000 mov rcx, qword ptr [rdi + 0x290]
14594c263 488b9798020000 mov rdx, qword ptr [rdi + 0x298]
14594c26a e8610ef4ff call 0x14588d0d0
14594c26f 4c69f0f0000000 imul r14, rax, 0xf0
14594c276 488d1d13212901 lea rbx, [rip + 0x1292113]
14594c27d 498d041e lea rax, [r14 + rbx]
14594c281 4883c008 add rax, 8
14594c285 488945b8 mov qword ptr [rbp - 0x48], rax
14594c289 4c897dc0 mov qword ptr [rbp - 0x40], r15
14594c28d c6451e01 mov byte ptr [rbp + 0x1e], 1
14594c291 488d15e6622801 lea rdx, [rip + 0x12862e6]
14594c298 488d4dd0 lea rcx, [rbp - 0x30]
14594c29c 4c8d45b8 lea r8, [rbp - 0x48]
14594c2a0 e88b0b2800 call 0x145bcce30
14594c2a5 90 nop
14594c2a6 4c01f3 add rbx, r14
14594c2a9 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
14594c2ad 488b55e0 mov rdx, qword ptr [rbp - 0x20]
14594c2b1 4c8b7b18 mov r15, qword ptr [rbx + 0x18]
14594c2b5 4c8b6320 mov r12, qword ptr [rbx + 0x20]
14594c2b9 48894dc8 mov qword ptr [rbp - 0x38], rcx
14594c2bd e83e02faff call 0x1458ec500
14594c2c2 90 nop
14594c2c3 4989c6 mov r14, rax
14594c2c6 4889d3 mov rbx, rdx
14594c2c9 488b55d0 mov rdx, qword ptr [rbp - 0x30]
14594c2cd 4885d2 test rdx, rdx
14594c2d0 740f je 0x14594c2e1
14594c2d2 41b801000000 mov r8d, 1
14594c2d8 488b4dc8 mov rcx, qword ptr [rbp - 0x38]
14594c2dc e8ef5e6bfa call 0x1400021d0
14594c2e1 4d85f6 test r14, r14
14594c2e4 4d0f45fe cmovne r15, r14
14594c2e8 490f44dc cmove rbx, r12
14594c2ec c6451e00 mov byte ptr [rbp + 0x1e], 0
14594c2f0 48895c2428 mov qword ptr [rsp + 0x28], rbx
14594c2f5 4c897c2420 mov qword ptr [rsp + 0x20], r15
14594c2fa 4c8d058ae68d01 lea r8, [rip + 0x18de68a]
14594c301 488d4dd0 lea rcx, [rbp - 0x30]
14594c305 488d55f0 lea rdx, [rbp - 0x10]
14594c309 41b902000000 mov r9d, 2
14594c30f e80cf4f9ff call 0x1458eb720
14594c314 90 nop
14594c315 8a9fb70a0000 mov bl, byte ptr [rdi + 0xab7]
14594c31b 488d15b5d98d01 lea rdx, [rip + 0x18dd9b5]
14594c322 488d4dd0 lea rcx, [rbp - 0x30]
14594c326 41b804000000 mov r8d, 4
14594c32c e83ff1f9ff call 0x1458eb470
14594c331 90 nop
14594c332 0fb6fb movzx edi, bl
14594c335 4883f705 xor rdi, 5
14594c339 488b45d0 mov rax, qword ptr [rbp - 0x30]
14594c33d 488b4de0 mov rcx, qword ptr [rbp - 0x20]
14594c341 4829c8 sub rax, rcx
14594c344 4839c7 cmp rdi, rax
14594c347 776f ja 0x14594c3b8
14594c349 488d056d562a01 lea rax, [rip + 0x12a566d]
14594c350 488d1561562a01 lea rdx, [rip + 0x12a5661]
14594c357 84db test bl, bl
14594c359 480f45d0 cmovne rdx, rax
14594c35d 48034dd8 add rcx, qword ptr [rbp - 0x28]
14594c361 4989f8 mov r8, rdi
14594c364 e87edd2a00 call 0x145bfa0e7
14594c369 48017de0 add qword ptr [rbp - 0x20], rdi
14594c36d 0f1045d0 movups xmm0, xmmword ptr [rbp - 0x30]
14594c371 0f2945f0 movaps xmmword ptr [rbp - 0x10], xmm0
14594c375 0f1045e0 movups xmm0, xmmword ptr [rbp - 0x20]
14594c379 0f294500 movaps xmmword ptr [rbp], xmm0
14594c37d 488b7d00 mov rdi, qword ptr [rbp]
14594c381 48397df0 cmp qword ptr [rbp - 0x10], rdi
14594c385 7459 je 0x14594c3e0
14594c387 488b45f8 mov rax, qword ptr [rbp - 8]
14594c38b c604387d mov byte ptr [rax + rdi], 0x7d
14594c38f 48ffc7 inc rdi
14594c392 48897d00 mov qword ptr [rbp], rdi
14594c396 48897e10 mov qword ptr [rsi + 0x10], rdi
14594c39a 0f2845f0 movaps xmm0, xmmword ptr [rbp - 0x10]
14594c39e 0f1106 movups xmmword ptr [rsi], xmm0
14594c3a1 4889f0 mov rax, rsi
14594c3a4 4881c4a8000000 add rsp, 0xa8
14594c3ab 5b pop rbx
14594c3ac 5f pop rdi
14594c3ad 5e pop rsi
14594c3ae 415c pop r12
14594c3b0 415d pop r13
14594c3b2 415e pop r14
14594c3b4 415f pop r15
14594c3b6 5d pop rbp
14594c3b7 c3 ret
14594c3b8 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14594c3c1 4889ca mov rdx, rcx
14594c3c4 488d4dd0 lea rcx, [rbp - 0x30]
14594c3c8 41b901000000 mov r9d, 1
14594c3ce 4989f8 mov r8, rdi
14594c3d1 e89ae52a00 call 0x145bfa970
14594c3d6 90 nop
14594c3d7 488b4de0 mov rcx, qword ptr [rbp - 0x20]
14594c3db e969ffffff jmp 0x14594c349
14594c3e0 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14594c3e9 488d4df0 lea rcx, [rbp - 0x10]
14594c3ed 41b801000000 mov r8d, 1
14594c3f3 41b901000000 mov r9d, 1
14594c3f9 4889fa mov rdx, rdi
14594c3fc e86fe52a00 call 0x145bfa970
14594c401 90 nop
14594c402 eb83 jmp 0x14594c387
14594c404 b901000000 mov ecx, 1
14594c409 ba01000000 mov edx, 1
14594c40e e8a8ce4400 call 0x145d992bb
14594c413 0f0b ud2
