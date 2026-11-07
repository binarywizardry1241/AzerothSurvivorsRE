144e30fe0 4883ec28 sub rsp, 0x28
144e30fe4 48833900 cmp qword ptr [rcx], 0
144e30fe8 750b jne 0x144e30ff5
144e30fea 488911 mov qword ptr [rcx], rdx
144e30fed 4889c8 mov rax, rcx
144e30ff0 4883c428 add rsp, 0x28
144e30ff4 c3 ret
144e30ff5 488d0d5cb0d001 lea rcx, [rip + 0x1d0b05c]
144e30ffc 4c8d057db0d001 lea r8, [rip + 0x1d0b07d]
144e31003 ba24000000 mov edx, 0x24
144e31008 e8a327f600 call 0x145d937b0
144e3100d 0f0b ud2
