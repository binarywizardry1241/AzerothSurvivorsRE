144e30fa0 4883ec28 sub rsp, 0x28
144e30fa4 4883791000 cmp qword ptr [rcx + 0x10], 0
144e30fa9 750c jne 0x144e30fb7
144e30fab 48895110 mov qword ptr [rcx + 0x10], rdx
144e30faf 4889c8 mov rax, rcx
144e30fb2 4883c428 add rsp, 0x28
144e30fb6 c3 ret
144e30fb7 488d0d5ab0d001 lea rcx, [rip + 0x1d0b05a]
144e30fbe 4c8d057bb0d001 lea r8, [rip + 0x1d0b07b]
144e30fc5 ba28000000 mov edx, 0x28
144e30fca e8e127f600 call 0x145d937b0
144e30fcf 0f0b ud2
