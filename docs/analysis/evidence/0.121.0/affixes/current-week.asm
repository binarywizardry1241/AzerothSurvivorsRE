0000000145ac9f90 4883ec48                       sub rsp, 0x48
0000000145ac9f94 e847f54c00                     call 0x145f994e0
0000000145ac9f99 89442428                       mov dword ptr [rsp + 0x28], eax
0000000145ac9f9d 8954242c                       mov dword ptr [rsp + 0x2c], edx
0000000145ac9fa1 488d4c2430                     lea rcx, [rsp + 0x30]
0000000145ac9fa6 488d542428                     lea rdx, [rsp + 0x28]
0000000145ac9fab 41b800803ed5                   mov r8d, 0xd53e8000
0000000145ac9fb1 41b9deb19d01                   mov r9d, 0x19db1de
0000000145ac9fb7 e8d4f44c00                     call 0x145f99490
0000000145ac9fbc 48b85915de6926ef7a37           movabs rax, 0x377aef2669de1559
0000000145ac9fc6 48f7642438                     mul qword ptr [rsp + 0x38]
0000000145ac9fcb 48c1ea11                       shr rdx, 0x11
0000000145ac9fcf 31c0                           xor eax, eax
0000000145ac9fd1 807c243000                     cmp byte ptr [rsp + 0x30], 0
0000000145ac9fd6 0f44c2                         cmove eax, edx
0000000145ac9fd9 4883c448                       add rsp, 0x48
0000000145ac9fdd c3                             ret
