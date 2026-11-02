14592e499: 448b6720 mov r12d, dword ptr [rdi + 0x20]
14592e49d: 8b86780a0000 mov eax, dword ptr [rsi + 0xa78]
14592e4a3: ffc0 inc eax
14592e4a5: 8986780a0000 mov dword ptr [rsi + 0xa78], eax
14592e4ab: 4489e1 mov ecx, r12d
14592e4ae: 81e1ffffff00 and ecx, 0xffffff
14592e4b4: 48c1e118 shl rcx, 0x18
14592e4b8: 25ffffff00 and eax, 0xffffff
14592e4bd: 4809c8 or rax, rcx
14592e4c0: 49be00000000000030f1 movabs r14, 0xf130000000000000
14592e4ca: 4909c6 or r14, rax
