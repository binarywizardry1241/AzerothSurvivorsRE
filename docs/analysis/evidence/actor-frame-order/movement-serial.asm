14597b602: 4c8d7028 lea r14, [rax + 0x28]
14597b606: 4c8b28 mov r13, qword ptr [rax]
14597b609: 8b4810 mov ecx, dword ptr [rax + 0x10]
14597b60c: 898d08020000 mov dword ptr [rbp + 0x208], ecx
14597b612: 488b4808 mov rcx, qword ptr [rax + 8]
14597b616: 48898d00020000 mov qword ptr [rbp + 0x200], rcx
14597b61d: f20f107814 movsd xmm7, qword ptr [rax + 0x14]
14597b622: f3440f10681c movss xmm13, dword ptr [rax + 0x1c]
14597b628: f3440f106020 movss xmm12, dword ptr [rax + 0x20]
14597b62e: 488b8518030000 mov rax, qword ptr [rbp + 0x318]
14597b635: 8b98640a0000 mov ebx, dword ptr [rax + 0xa64]
14597b63b: ffc3 inc ebx
14597b63d: 8998640a0000 mov dword ptr [rax + 0xa64], ebx
