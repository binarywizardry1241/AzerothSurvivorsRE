145925c94 4885f6 test rsi, rsi
145925c97 0f84ae0b0000 je 0x14592684b
145925c9d 4c8b8510010000 mov r8, qword ptr [rbp + 0x110]
145925ca4 418378680a cmp dword ptr [r8 + 0x68], 0xa
145925ca9 7530 jne 0x145925cdb
145925cab 488b87d0000000 mov rax, qword ptr [rdi + 0xd0]
145925cb2 488b8fd8000000 mov rcx, qword ptr [rdi + 0xd8]
145925cb9 48c1e107 shl rcx, 7
145925cbd 0f1f00 nop dword ptr [rax]
145925cc0 4885c9 test rcx, rcx
145925cc3 0f84820b0000 je 0x14592684b
145925cc9 488b5018 mov rdx, qword ptr [rax + 0x18]
145925ccd 4883e880 sub rax, -0x80
145925cd1 4883c180 add rcx, -0x80
145925cd5 807a3900 cmp byte ptr [rdx + 0x39], 0
145925cd9 74e5 je 0x145925cc0
