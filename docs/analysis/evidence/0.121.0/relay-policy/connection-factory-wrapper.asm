0000000145adf230 55                             push rbp
0000000145adf231 4883ec60                       sub rsp, 0x60
0000000145adf235 488d6c2460                     lea rbp, [rsp + 0x60]
0000000145adf23a 48c745f8feffffff               mov qword ptr [rbp - 8], 0xfffffffffffffffe
0000000145adf242 4989d0                         mov r8, rdx
0000000145adf245 4889ca                         mov rdx, rcx
0000000145adf248 488d4dc8                       lea rcx, [rbp - 0x38]
0000000145adf24c e89f701700                     call 0x145c562f0
0000000145adf251 e8aa2f52fa                     call 0x140002200
0000000145adf256 b930000000                     mov ecx, 0x30
0000000145adf25b ba08000000                     mov edx, 8
0000000145adf260 e85b2f52fa                     call 0x1400021c0
0000000145adf265 4885c0                         test rax, rax
0000000145adf268 7424                           je 0x145adf28e
0000000145adf26a 0f1045c8                       movups xmm0, xmmword ptr [rbp - 0x38]
0000000145adf26e 0f104dd8                       movups xmm1, xmmword ptr [rbp - 0x28]
0000000145adf272 0f1055e8                       movups xmm2, xmmword ptr [rbp - 0x18]
0000000145adf276 0f115020                       movups xmmword ptr [rax + 0x20], xmm2
0000000145adf27a 0f114810                       movups xmmword ptr [rax + 0x10], xmm1
0000000145adf27e 0f1100                         movups xmmword ptr [rax], xmm0
0000000145adf281 488d15a8f18201                 lea rdx, [rip + 0x182f1a8]
0000000145adf288 4883c460                       add rsp, 0x60
0000000145adf28c 5d                             pop rbp
0000000145adf28d c3                             ret
0000000145adf28e b908000000                     mov ecx, 8
0000000145adf293 ba30000000                     mov edx, 0x30
0000000145adf298 e8044e6b00                     call 0x1461940a1
0000000145adf29d 90                             nop
0000000145adf29e 0f0b                           ud2
