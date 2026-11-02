0000000145bd7bff 83be980d000001                 cmp dword ptr [rsi + 0xd98], 1
0000000145bd7c06 0f87d9150000                   ja 0x145bd91e5
0000000145bd7c0c 488b8560050000                 mov rax, qword ptr [rbp + 0x560]
0000000145bd7c13 8b4008                         mov eax, dword ptr [rax + 8]
0000000145bd7c16 8945c8                         mov dword ptr [rbp - 0x38], eax
0000000145bd7c19 48b81700000000000080           movabs rax, 0x8000000000000017
0000000145bd7c23 488945c0                       mov qword ptr [rbp - 0x40], rax
0000000145bd7c27 488b8e80110000                 mov rcx, qword ptr [rsi + 0x1180]
0000000145bd7c2e 488b9688110000                 mov rdx, qword ptr [rsi + 0x1188]
0000000145bd7c35 4c8d86080e0000                 lea r8, [rsi + 0xe08]
0000000145bd7c3c e8ef9ffbff                     call 0x145b91c30
0000000145bd7c41 90                             nop 
0000000145bd7c42 488bbe80110000                 mov rdi, qword ptr [rsi + 0x1180]
0000000145bd7c49 488bb688110000                 mov rsi, qword ptr [rsi + 0x1188]
0000000145bd7c50 488d8d30040000                 lea rcx, [rbp + 0x430]
0000000145bd7c57 488d55c0                       lea rdx, [rbp - 0x40]
0000000145bd7c5b e830ce1300                     call 0x145d14a90
0000000145bd7c60 90                             nop 
0000000145bd7c61 488b9538040000                 mov rdx, qword ptr [rbp + 0x438]
0000000145bd7c68 4c8b8540040000                 mov r8, qword ptr [rbp + 0x440]
0000000145bd7c6f f04c0105d195a802               lock add qword ptr [rip + 0x2a895d1], r8
0000000145bd7c77 f048ff05d995a802               lock inc qword ptr [rip + 0x2a895d9]
0000000145bd7c7f 4889f9                         mov rcx, rdi
0000000145bd7c82 48899578050000                 mov qword ptr [rbp + 0x578], rdx
0000000145bd7c89 ff5618                         call qword ptr [rsi + 0x18]
0000000145bd7c8c 90                             nop 
0000000145bd7c8d 488b9530040000                 mov rdx, qword ptr [rbp + 0x430]
0000000145bd7c94 4885d2                         test rdx, rdx
0000000145bd7c97 7412                           je 0x145bd7cab
0000000145bd7c99 41b801000000                   mov r8d, 1
0000000145bd7c9f 488b8d78050000                 mov rcx, qword ptr [rbp + 0x578]
0000000145bd7ca6 e825a542fa                     call 0x1400021d0
0000000145bd7cab c6858705000001                 mov byte ptr [rbp + 0x587], 1
0000000145bd7cb2 c6858605000001                 mov byte ptr [rbp + 0x586], 1
0000000145bd7cb9 488d4dc0                       lea rcx, [rbp - 0x40]
0000000145bd7cbd e80e29fdff                     call 0x145baa5d0
0000000145bd7cc2 90                             nop 
0000000145bd7cc3 e91d150000                     jmp 0x145bd91e5
