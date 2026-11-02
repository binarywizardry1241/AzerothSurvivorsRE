0000000145d15e08 488b5728                       mov rdx, qword ptr [rdi + 0x28]
0000000145d15e0c 4c8b4730                       mov r8, qword ptr [rdi + 0x30]
0000000145d15e10 488d4d58                       lea rcx, [rbp + 0x58]
0000000145d15e14 e867ae1a00                     call 0x145ec0c80
0000000145d15e19 90                             nop 
0000000145d15e1a 0fb65738                       movzx edx, byte ptr [rdi + 0x38]
0000000145d15e1e 4889c1                         mov rcx, rax
0000000145d15e21 e8baad1a00                     call 0x145ec0be0
0000000145d15e26 90                             nop 
0000000145d15e27 488d7d58                       lea rdi, [rbp + 0x58]
0000000145d15e2b 4d39fe                         cmp r14, r15
0000000145d15e2e 0f845c010000                   je 0x145d15f90
0000000145d15e34 6666662e0f1f840000000000       nop word ptr cs:[rax + rax]
0000000145d15e40 498b5620                       mov rdx, qword ptr [r14 + 0x20]
0000000145d15e44 4d8b4628                       mov r8, qword ptr [r14 + 0x28]
0000000145d15e48 4889f9                         mov rcx, rdi
0000000145d15e4b e830ae1a00                     call 0x145ec0c80
0000000145d15e50 90                             nop 
0000000145d15e51 4981c6b8000000                 add r14, 0xb8
0000000145d15e58 4d39fe                         cmp r14, r15
0000000145d15e5b 75e3                           jne 0x145d15e40
0000000145d15e5d e92e010000                     jmp 0x145d15f90
