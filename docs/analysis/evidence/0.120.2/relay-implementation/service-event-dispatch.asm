; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone 5.0.7; static observations, no target execution.
0000000145bf7277 4889cf                         mov rdi, rcx
0000000145bf727a 48b80000000000000080           movabs rax, 0x8000000000000000
0000000145bf7284 4831c7                         xor rdi, rax
0000000145bf7287 4885c9                         test rcx, rcx
0000000145bf728a b80a000000                     mov eax, 0xa
0000000145bf728f 480f49f8                       cmovns rdi, rax
0000000145bf7293 488d47fe                       lea rax, [rdi - 2]
0000000145bf7297 4883f80a                       cmp rax, 0xa
0000000145bf729b 0f8706070000                   ja 0x145bf79a7
0000000145bf72a1 488d0da8aaa001                 lea rcx, [rip + 0x1a0aaa8]
0000000145bf72a8 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000145bf72ac 4801c8                         add rax, rcx
0000000145bf72af ffe0                           jmp rax
