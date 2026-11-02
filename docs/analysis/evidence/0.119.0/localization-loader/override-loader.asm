0000000145b28e50  55                     push rbp
0000000145b28e51  4157                   push r15
0000000145b28e53  4156                   push r14
0000000145b28e55  4155                   push r13
0000000145b28e57  4154                   push r12
0000000145b28e59  56                     push rsi
0000000145b28e5a  57                     push rdi
0000000145b28e5b  53                     push rbx
0000000145b28e5c  4881ecd8010000         sub rsp, 0x1d8
0000000145b28e63  488dac2480000000       lea rbp, [rsp + 0x80]
0000000145b28e6b  48c78550010000feffffff mov qword ptr [rbp + 0x150], 0xfffffffffffffffe
0000000145b28e76  4889cf                 mov rdi, rcx
0000000145b28e79  488955f8               mov qword ptr [rbp - 8], rdx
0000000145b28e7d  4c894500               mov qword ptr [rbp], r8
0000000145b28e81  488d45f8               lea rax, [rbp - 8]
0000000145b28e85  48898518010000         mov qword ptr [rbp + 0x118], rax
0000000145b28e8c  488d052d924dfa         lea rax, [rip - 0x5b26dd3]
0000000145b28e93  48898520010000         mov qword ptr [rbp + 0x120], rax
0000000145b28e9a  488d15df507b01         lea rdx, [rip + 0x17b50df]
0000000145b28ea1  488d4d58               lea rcx, [rbp + 0x58]
0000000145b28ea5  4c8d8518010000         lea r8, [rbp + 0x118]
0000000145b28eac  e87fe04300             call 0x145f66f30
0000000145b28eb1  48c785e800000000000000 mov qword ptr [rbp + 0xe8], 0
0000000145b28ebc  48c785f000000008000000 mov qword ptr [rbp + 0xf0], 8
0000000145b28ec7  48c785f800000000000000 mov qword ptr [rbp + 0xf8], 0
0000000145b28ed2  c6854f01000001         mov byte ptr [rbp + 0x14f], 1
0000000145b28ed9  488d8d18010000         lea rcx, [rbp + 0x118]
0000000145b28ee0  e8fb524200             call 0x145f4e1e0
0000000145b28ee5  90                     nop
0000000145b28ee6  488b8518010000         mov rax, qword ptr [rbp + 0x118]
0000000145b28eed  4883f8ff               cmp rax, -1
0000000145b28ef1  0f84e4000000           je 0x145b28fdb
0000000145b28ef7  48898540010000         mov qword ptr [rbp + 0x140], rax
0000000145b28efe  488b8d20010000         mov rcx, qword ptr [rbp + 0x120]
0000000145b28f05  488b9528010000         mov rdx, qword ptr [rbp + 0x128]
0000000145b28f0c  48898d38010000         mov qword ptr [rbp + 0x138], rcx
0000000145b28f13  e8087b4100             call 0x145f40a20
0000000145b28f18  90                     nop
0000000145b28f19  4885c0                 test rax, rax
0000000145b28f1c  0f8460060000           je 0x145b29582
0000000145b28f22  4989d0                 mov r8, rdx
0000000145b28f25  488d8d18010000         lea rcx, [rbp + 0x118]
0000000145b28f2c  4889c2                 mov rdx, rax
0000000145b28f2f  e87cd74300             call 0x145f666b0
0000000145b28f34  90                     nop
0000000145b28f35  488bb518010000         mov rsi, qword ptr [rbp + 0x118]
0000000145b28f3c  488b8520010000         mov rax, qword ptr [rbp + 0x120]
0000000145b28f43  48898500010000         mov qword ptr [rbp + 0x100], rax
0000000145b28f4a  0f108528010000         movups xmm0, xmmword ptr [rbp + 0x128]
0000000145b28f51  0f2945b0               movaps xmmword ptr [rbp - 0x50], xmm0
0000000145b28f55  488b9540010000         mov rdx, qword ptr [rbp + 0x140]
0000000145b28f5c  4885d2                 test rdx, rdx
0000000145b28f5f  7412                   je 0x145b28f73
0000000145b28f61  41b801000000           mov r8d, 1
0000000145b28f67  488b8d38010000         mov rcx, qword ptr [rbp + 0x138]
0000000145b28f6e  e85d924dfa             call 0x1400021d0
0000000145b28f73  4883feff               cmp rsi, -1
0000000145b28f77  0f849c000000           je 0x145b29019
0000000145b28f7d  4889b540010000         mov qword ptr [rbp + 0x140], rsi
0000000145b28f84  488bb5f8000000         mov rsi, qword ptr [rbp + 0xf8]
0000000145b28f8b  483bb5e8000000         cmp rsi, qword ptr [rbp + 0xe8]
0000000145b28f92  750d                   jne 0x145b28fa1
0000000145b28f94  488d8de8000000         lea rcx, [rbp + 0xe8]
0000000145b28f9b  e890b94600             call 0x145f94930
0000000145b28fa0  90                     nop
0000000145b28fa1  488b85f0000000         mov rax, qword ptr [rbp + 0xf0]
0000000145b28fa8  4889f1                 mov rcx, rsi
0000000145b28fab  48c1e105               shl rcx, 5
0000000145b28faf  488b9540010000         mov rdx, qword ptr [rbp + 0x140]
0000000145b28fb6  48891408               mov qword ptr [rax + rcx], rdx
0000000145b28fba  488b9500010000         mov rdx, qword ptr [rbp + 0x100]
0000000145b28fc1  4889540808             mov qword ptr [rax + rcx + 8], rdx
0000000145b28fc6  0f2845b0               movaps xmm0, xmmword ptr [rbp - 0x50]
0000000145b28fca  0f11440810             movups xmmword ptr [rax + rcx + 0x10], xmm0
0000000145b28fcf  48ffc6                 inc rsi
0000000145b28fd2  4889b5f8000000         mov qword ptr [rbp + 0xf8], rsi
0000000145b28fd9  eb3e                   jmp 0x145b29019
0000000145b28fdb  488b8520010000         mov rax, qword ptr [rbp + 0x120]
0000000145b28fe2  89c1                   mov ecx, eax
0000000145b28fe4  83e103                 and ecx, 3
0000000145b28fe7  8d51fe                 lea edx, [rcx - 2]
0000000145b28fea  83fa02                 cmp edx, 2
0000000145b28fed  722a                   jb 0x145b29019
0000000145b28fef  4885c9                 test rcx, rcx
0000000145b28ff2  7425                   je 0x145b29019
0000000145b28ff4  48ffc8                 dec rax
0000000145b28ff7  488d8d98000000         lea rcx, [rbp + 0x98]
0000000145b28ffe  48898598000000         mov qword ptr [rbp + 0x98], rax
0000000145b29005  c6859000000003         mov byte ptr [rbp + 0x90], 3
0000000145b2900c  c6854f01000001         mov byte ptr [rbp + 0x14f], 1
0000000145b29013  e8a8084500             call 0x145f798c0
0000000145b29018  90                     nop
0000000145b29019  c6854f01000001         mov byte ptr [rbp + 0x14f], 1
0000000145b29020  488d8d18010000         lea rcx, [rbp + 0x118]
0000000145b29027  e8b487faff             call 0x145ad17e0
0000000145b2902c  90                     nop
0000000145b2902d  488b8518010000         mov rax, qword ptr [rbp + 0x118]
0000000145b29034  4883f8ff               cmp rax, -1
0000000145b29038  48897d40               mov qword ptr [rbp + 0x40], rdi
0000000145b2903c  7463                   je 0x145b290a1
0000000145b2903e  48898540010000         mov qword ptr [rbp + 0x140], rax
0000000145b29045  488b9df8000000         mov rbx, qword ptr [rbp + 0xf8]
0000000145b2904c  483b9de8000000         cmp rbx, qword ptr [rbp + 0xe8]
0000000145b29053  751b                   jne 0x145b29070
0000000145b29055  488b8520010000         mov rax, qword ptr [rbp + 0x120]
0000000145b2905c  48898538010000         mov qword ptr [rbp + 0x138], rax
0000000145b29063  488d8de8000000         lea rcx, [rbp + 0xe8]
0000000145b2906a  e8c1b84600             call 0x145f94930
0000000145b2906f  90                     nop
0000000145b29070  488bbdf0000000         mov rdi, qword ptr [rbp + 0xf0]
0000000145b29077  4889d8                 mov rax, rbx
0000000145b2907a  48c1e005               shl rax, 5
0000000145b2907e  0f108518010000         movups xmm0, xmmword ptr [rbp + 0x118]
0000000145b29085  0f108d28010000         movups xmm1, xmmword ptr [rbp + 0x128]
0000000145b2908c  0f114c0710             movups xmmword ptr [rdi + rax + 0x10], xmm1
0000000145b29091  0f110407               movups xmmword ptr [rdi + rax], xmm0
0000000145b29095  48ffc3                 inc rbx
0000000145b29098  48899df8000000         mov qword ptr [rbp + 0xf8], rbx
0000000145b2909f  eb0e                   jmp 0x145b290af
0000000145b290a1  488bbdf0000000         mov rdi, qword ptr [rbp + 0xf0]
0000000145b290a8  488b9df8000000         mov rbx, qword ptr [rbp + 0xf8]
0000000145b290af  48c785c000000000000000 mov qword ptr [rbp + 0xc0], 0
0000000145b290ba  48c785c800000008000000 mov qword ptr [rbp + 0xc8], 8
0000000145b290c5  48c785d000000000000000 mov qword ptr [rbp + 0xd0], 0
0000000145b290d0  488b85e8000000         mov rax, qword ptr [rbp + 0xe8]
0000000145b290d7  48c1e305               shl rbx, 5
0000000145b290db  4801fb                 add rbx, rdi
0000000145b290de  48897dd8               mov qword ptr [rbp - 0x28], rdi
0000000145b290e2  48897de0               mov qword ptr [rbp - 0x20], rdi
0000000145b290e6  48894548               mov qword ptr [rbp + 0x48], rax
0000000145b290ea  488945e8               mov qword ptr [rbp - 0x18], rax
0000000145b290ee  48895df0               mov qword ptr [rbp - 0x10], rbx
0000000145b290f2  b808000000             mov eax, 8
0000000145b290f7  488985b0000000         mov qword ptr [rbp + 0xb0], rax
0000000145b290fe  48c785e000000000000000 mov qword ptr [rbp + 0xe0], 0
0000000145b29109  4c8da518010000         lea r12, [rbp + 0x118]
0000000145b29110  4c8d6d08               lea r13, [rbp + 8]
0000000145b29114  48897d50               mov qword ptr [rbp + 0x50], rdi
0000000145b29118  488b7560               mov rsi, qword ptr [rbp + 0x60]
0000000145b2911c  4c8b7d68               mov r15, qword ptr [rbp + 0x68]
0000000145b29120  4989fe                 mov r14, rdi
0000000145b29123  eb1e                   jmp 0x145b29143
0000000145b29125  66662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145b29130  4989fe                 mov r14, rdi
0000000145b29133  488b9540010000         mov rdx, qword ptr [rbp + 0x140]
0000000145b2913a  4885d2                 test rdx, rdx
0000000145b2913d  0f854b030000           jne 0x145b2948e
0000000145b29143  4939de                 cmp r14, rbx
0000000145b29146  0f8495030000           je 0x145b294e1
0000000145b2914c  498d7e20               lea rdi, [r14 + 0x20]
0000000145b29150  48897de0               mov qword ptr [rbp - 0x20], rdi
0000000145b29154  498b06                 mov rax, qword ptr [r14]
0000000145b29157  4883f8ff               cmp rax, -1
0000000145b2915b  0f847d030000           je 0x145b294de
0000000145b29161  48898540010000         mov qword ptr [rbp + 0x140], rax
0000000145b29168  498b5608               mov rdx, qword ptr [r14 + 8]
0000000145b2916c  4d8b4610               mov r8, qword ptr [r14 + 0x10]
0000000145b29170  48c744242004000000     mov qword ptr [rsp + 0x20], 4
0000000145b29179  4c89e1                 mov rcx, r12
0000000145b2917c  48899500010000         mov qword ptr [rbp + 0x100], rdx
0000000145b29183  4c8d0dfe4d7b01         lea r9, [rip + 0x17b4dfe]
0000000145b2918a  e861774100             call 0x145f408f0
0000000145b2918f  90                     nop
0000000145b29190  488b9520010000         mov rdx, qword ptr [rbp + 0x120]
0000000145b29197  4c8b8528010000         mov r8, qword ptr [rbp + 0x128]
0000000145b2919e  4c897c2420             mov qword ptr [rsp + 0x20], r15
0000000145b291a3  4c89e9                 mov rcx, r13
0000000145b291a6  48899538010000         mov qword ptr [rbp + 0x138], rdx
0000000145b291ad  4989f1                 mov r9, rsi
0000000145b291b0  e83b774100             call 0x145f408f0
0000000145b291b5  90                     nop
0000000145b291b6  488b9518010000         mov rdx, qword ptr [rbp + 0x118]
0000000145b291bd  4885d2                 test rdx, rdx
0000000145b291c0  7412                   je 0x145b291d4
0000000145b291c2  41b801000000           mov r8d, 1
0000000145b291c8  488b8d38010000         mov rcx, qword ptr [rbp + 0x138]
0000000145b291cf  e8fc8f4dfa             call 0x1400021d0
0000000145b291d4  488b5510               mov rdx, qword ptr [rbp + 0x10]
0000000145b291d8  4c8b7518               mov r14, qword ptr [rbp + 0x18]
0000000145b291dc  4c89e1                 mov rcx, r12
0000000145b291df  48899538010000         mov qword ptr [rbp + 0x138], rdx
0000000145b291e6  4d89f0                 mov r8, r14
0000000145b291e9  e882e14200             call 0x145f57370
0000000145b291ee  90                     nop
0000000145b291ef  488b8518010000         mov rax, qword ptr [rbp + 0x118]
0000000145b291f6  4883f8ff               cmp rax, -1
0000000145b291fa  7564                   jne 0x145b29260
0000000145b291fc  488b8520010000         mov rax, qword ptr [rbp + 0x120]
0000000145b29203  89c1                   mov ecx, eax
0000000145b29205  83e103                 and ecx, 3
0000000145b29208  8d51fe                 lea edx, [rcx - 2]
0000000145b2920b  83fa02                 cmp edx, 2
0000000145b2920e  7223                   jb 0x145b29233
0000000145b29210  4885c9                 test rcx, rcx
0000000145b29213  741e                   je 0x145b29233
0000000145b29215  48ffc8                 dec rax
0000000145b29218  48898598000000         mov qword ptr [rbp + 0x98], rax
0000000145b2921f  c6859000000003         mov byte ptr [rbp + 0x90], 3
0000000145b29226  488d8d98000000         lea rcx, [rbp + 0x98]
0000000145b2922d  e88e064500             call 0x145f798c0
0000000145b29232  90                     nop
0000000145b29233  488b5508               mov rdx, qword ptr [rbp + 8]
0000000145b29237  4885d2                 test rdx, rdx
0000000145b2923a  0f84f0feffff           je 0x145b29130
0000000145b29240  41b801000000           mov r8d, 1
0000000145b29246  488b8d38010000         mov rcx, qword ptr [rbp + 0x138]
0000000145b2924d  e87e8f4dfa             call 0x1400021d0
0000000145b29252  e9d9feffff             jmp 0x145b29130
0000000145b29257  660f1f840000000000     nop word ptr [rax + rax]
0000000145b29260  48898508010000         mov qword ptr [rbp + 0x108], rax
0000000145b29267  488b9520010000         mov rdx, qword ptr [rbp + 0x120]
0000000145b2926e  4c8b8528010000         mov r8, qword ptr [rbp + 0x128]
0000000145b29275  488d8d90000000         lea rcx, [rbp + 0x90]
0000000145b2927c  488995d8000000         mov qword ptr [rbp + 0xd8], rdx
0000000145b29283  e8481f0000             call 0x145b2b1d0
0000000145b29288  90                     nop
0000000145b29289  83bd9000000001         cmp dword ptr [rbp + 0x90], 1
0000000145b29290  0f85f2000000           jne 0x145b29388
0000000145b29296  488d8d98000000         lea rcx, [rbp + 0x98]
0000000145b2929d  488b4110               mov rax, qword ptr [rcx + 0x10]
0000000145b292a1  48898580000000         mov qword ptr [rbp + 0x80], rax
0000000145b292a8  0f1001                 movups xmm0, xmmword ptr [rcx]
0000000145b292ab  0f294570               movaps xmmword ptr [rbp + 0x70], xmm0
0000000145b292af  488b8538010000         mov rax, qword ptr [rbp + 0x138]
0000000145b292b6  488945c8               mov qword ptr [rbp - 0x38], rax
0000000145b292ba  4c8975d0               mov qword ptr [rbp - 0x30], r14
0000000145b292be  488d45c8               lea rax, [rbp - 0x38]
0000000145b292c2  48898518010000         mov qword ptr [rbp + 0x118], rax
0000000145b292c9  488d05100b4300         lea rax, [rip + 0x430b10]
0000000145b292d0  48898520010000         mov qword ptr [rbp + 0x120], rax
0000000145b292d7  488d4570               lea rax, [rbp + 0x70]
0000000145b292db  48898528010000         mov qword ptr [rbp + 0x128], rax
0000000145b292e2  488d05f78d4dfa         lea rax, [rip - 0x5b27209]
0000000145b292e9  48898530010000         mov qword ptr [rbp + 0x130], rax
0000000145b292f0  488d7528               lea rsi, [rbp + 0x28]
0000000145b292f4  4889f1                 mov rcx, rsi
0000000145b292f7  488d158e4c7b01         lea rdx, [rip + 0x17b4c8e]
0000000145b292fe  4d89e0                 mov r8, r12
0000000145b29301  e82adc4300             call 0x145f66f30
0000000145b29306  90                     nop
0000000145b29307  488b4528               mov rax, qword ptr [rbp + 0x28]
0000000145b2930b  48898510010000         mov qword ptr [rbp + 0x110], rax
0000000145b29312  488b4d30               mov rcx, qword ptr [rbp + 0x30]
0000000145b29316  488b4538               mov rax, qword ptr [rbp + 0x38]
0000000145b2931a  48898db8000000         mov qword ptr [rbp + 0xb8], rcx
0000000145b29321  48894d28               mov qword ptr [rbp + 0x28], rcx
0000000145b29325  48894530               mov qword ptr [rbp + 0x30], rax
0000000145b29329  4889b518010000         mov qword ptr [rbp + 0x118], rsi
0000000145b29330  488d05898d4dfa         lea rax, [rip - 0x5b27277]
0000000145b29337  48898520010000         mov qword ptr [rbp + 0x120], rax
0000000145b2933e  488d0d034d7b01         lea rcx, [rip + 0x17b4d03]
0000000145b29345  4c89e2                 mov rdx, r12
0000000145b29348  e8a3704200             call 0x145f503f0
0000000145b2934d  90                     nop
0000000145b2934e  488b9510010000         mov rdx, qword ptr [rbp + 0x110]
0000000145b29355  4885d2                 test rdx, rdx
0000000145b29358  7412                   je 0x145b2936c
0000000145b2935a  41b801000000           mov r8d, 1
0000000145b29360  488b8db8000000         mov rcx, qword ptr [rbp + 0xb8]
0000000145b29367  e8648e4dfa             call 0x1400021d0
0000000145b2936c  488b5570               mov rdx, qword ptr [rbp + 0x70]
0000000145b29370  4885d2                 test rdx, rdx
0000000145b29373  0f84cc000000           je 0x145b29445
0000000145b29379  488b4d78               mov rcx, qword ptr [rbp + 0x78]
0000000145b2937d  41b801000000           mov r8d, 1
0000000145b29383  e9b8000000             jmp 0x145b29440
0000000145b29388  4c8bbd98000000         mov r15, qword ptr [rbp + 0x98]
0000000145b2938f  488bb5a0000000         mov rsi, qword ptr [rbp + 0xa0]
0000000145b29396  4c8bb5a8000000         mov r14, qword ptr [rbp + 0xa8]
0000000145b2939d  4c89f0                 mov rax, r14
0000000145b293a0  48c1e004               shl rax, 4
0000000145b293a4  488d0440               lea rax, [rax + rax*2]
0000000145b293a8  48898510010000         mov qword ptr [rbp + 0x110], rax
0000000145b293af  4801f0                 add rax, rsi
0000000145b293b2  4889b518010000         mov qword ptr [rbp + 0x118], rsi
0000000145b293b9  4c89bd28010000         mov qword ptr [rbp + 0x128], r15
0000000145b293c0  4889b520010000         mov qword ptr [rbp + 0x120], rsi
0000000145b293c7  48898530010000         mov qword ptr [rbp + 0x130], rax
0000000145b293ce  488b85c0000000         mov rax, qword ptr [rbp + 0xc0]
0000000145b293d5  488b95e0000000         mov rdx, qword ptr [rbp + 0xe0]
0000000145b293dc  4829d0                 sub rax, rdx
0000000145b293df  4939c6                 cmp r14, rax
0000000145b293e2  0f87bd000000           ja 0x145b294a5
0000000145b293e8  4d85f6                 test r14, r14
0000000145b293eb  742c                   je 0x145b29419
0000000145b293ed  488995e0000000         mov qword ptr [rbp + 0xe0], rdx
0000000145b293f4  488d0c52               lea rcx, [rdx + rdx*2]
0000000145b293f8  48c1e104               shl rcx, 4
0000000145b293fc  48038db0000000         add rcx, qword ptr [rbp + 0xb0]
0000000145b29403  4889f2                 mov rdx, rsi
0000000145b29406  4c8b8510010000         mov r8, qword ptr [rbp + 0x110]
0000000145b2940d  e8c9ad4600             call 0x145f941db
0000000145b29412  488b95e0000000         mov rdx, qword ptr [rbp + 0xe0]
0000000145b29419  4c01f2                 add rdx, r14
0000000145b2941c  488995e0000000         mov qword ptr [rbp + 0xe0], rdx
0000000145b29423  488995d0000000         mov qword ptr [rbp + 0xd0], rdx
0000000145b2942a  4d85ff                 test r15, r15
0000000145b2942d  7416                   je 0x145b29445
0000000145b2942f  49c1e704               shl r15, 4
0000000145b29433  4b8d147f               lea rdx, [r15 + r15*2]
0000000145b29437  41b808000000           mov r8d, 8
0000000145b2943d  4889f1                 mov rcx, rsi
0000000145b29440  e88b8d4dfa             call 0x1400021d0
0000000145b29445  488b9508010000         mov rdx, qword ptr [rbp + 0x108]
0000000145b2944c  4885d2                 test rdx, rdx
0000000145b2944f  7412                   je 0x145b29463
0000000145b29451  41b801000000           mov r8d, 1
0000000145b29457  488b8dd8000000         mov rcx, qword ptr [rbp + 0xd8]
0000000145b2945e  e86d8d4dfa             call 0x1400021d0
0000000145b29463  488b5508               mov rdx, qword ptr [rbp + 8]
0000000145b29467  4885d2                 test rdx, rdx
0000000145b2946a  7412                   je 0x145b2947e
0000000145b2946c  41b801000000           mov r8d, 1
0000000145b29472  488b8d38010000         mov rcx, qword ptr [rbp + 0x138]
0000000145b29479  e8528d4dfa             call 0x1400021d0
0000000145b2947e  488b9540010000         mov rdx, qword ptr [rbp + 0x140]
0000000145b29485  4885d2                 test rdx, rdx
0000000145b29488  0f848afcffff           je 0x145b29118
0000000145b2948e  41b801000000           mov r8d, 1
0000000145b29494  488b8d00010000         mov rcx, qword ptr [rbp + 0x100]
0000000145b2949b  e8308d4dfa             call 0x1400021d0
0000000145b294a0  e973fcffff             jmp 0x145b29118
0000000145b294a5  48c744242030000000     mov qword ptr [rsp + 0x20], 0x30
0000000145b294ae  41b908000000           mov r9d, 8
0000000145b294b4  488d8dc0000000         lea rcx, [rbp + 0xc0]
0000000145b294bb  4d89f0                 mov r8, r14
0000000145b294be  e82db14600             call 0x145f945f0
0000000145b294c3  90                     nop
0000000145b294c4  488b85c8000000         mov rax, qword ptr [rbp + 0xc8]
0000000145b294cb  488985b0000000         mov qword ptr [rbp + 0xb0], rax
0000000145b294d2  488b95d0000000         mov rdx, qword ptr [rbp + 0xd0]
0000000145b294d9  e90fffffff             jmp 0x145b293ed
0000000145b294de  4989fe                 mov r14, rdi
0000000145b294e1  4c29f3                 sub rbx, r14
0000000145b294e4  488b7540               mov rsi, qword ptr [rbp + 0x40]
0000000145b294e8  7438                   je 0x145b29522
0000000145b294ea  48c1eb05               shr rbx, 5
0000000145b294ee  4983c608               add r14, 8
0000000145b294f2  eb15                   jmp 0x145b29509
0000000145b294f4  6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145b29500  4983c620               add r14, 0x20
0000000145b29504  48ffcb                 dec rbx
0000000145b29507  7419                   je 0x145b29522
0000000145b29509  498b56f8               mov rdx, qword ptr [r14 - 8]
0000000145b2950d  4885d2                 test rdx, rdx
0000000145b29510  74ee                   je 0x145b29500
0000000145b29512  498b0e                 mov rcx, qword ptr [r14]
0000000145b29515  41b801000000           mov r8d, 1
0000000145b2951b  e8b08c4dfa             call 0x1400021d0
0000000145b29520  ebde                   jmp 0x145b29500
0000000145b29522  488b5548               mov rdx, qword ptr [rbp + 0x48]
0000000145b29526  4885d2                 test rdx, rdx
0000000145b29529  7413                   je 0x145b2953e
0000000145b2952b  48c1e205               shl rdx, 5
0000000145b2952f  41b808000000           mov r8d, 8
0000000145b29535  488b4d50               mov rcx, qword ptr [rbp + 0x50]
0000000145b29539  e8928c4dfa             call 0x1400021d0
0000000145b2953e  488b85d0000000         mov rax, qword ptr [rbp + 0xd0]
0000000145b29545  48894610               mov qword ptr [rsi + 0x10], rax
0000000145b29549  0f1085c0000000         movups xmm0, xmmword ptr [rbp + 0xc0]
0000000145b29550  0f1106                 movups xmmword ptr [rsi], xmm0
0000000145b29553  488b5558               mov rdx, qword ptr [rbp + 0x58]
0000000145b29557  4885d2                 test rdx, rdx
0000000145b2955a  740f                   je 0x145b2956b
0000000145b2955c  488b4d60               mov rcx, qword ptr [rbp + 0x60]
0000000145b29560  41b801000000           mov r8d, 1
0000000145b29566  e8658c4dfa             call 0x1400021d0
0000000145b2956b  4889f0                 mov rax, rsi
0000000145b2956e  4881c4d8010000         add rsp, 0x1d8
0000000145b29575  5b                     pop rbx
0000000145b29576  5f                     pop rdi
0000000145b29577  5e                     pop rsi
0000000145b29578  415c                   pop r12
0000000145b2957a  415d                   pop r13
0000000145b2957c  415e                   pop r14
0000000145b2957e  415f                   pop r15
0000000145b29580  5d                     pop rbp
0000000145b29581  c3                     ret
0000000145b29582  48c7c6ffffffff         mov rsi, 0xffffffffffffffff
0000000145b29589  488b9540010000         mov rdx, qword ptr [rbp + 0x140]
0000000145b29590  4885d2                 test rdx, rdx
0000000145b29593  0f85c8f9ffff           jne 0x145b28f61
0000000145b29599  e9d5f9ffff             jmp 0x145b28f73
