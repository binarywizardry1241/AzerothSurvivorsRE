14599c612: 4889d7 mov rdi, rdx
14599c615: 4889ce mov rsi, rcx
14599c618: 488b8990020000 mov rcx, qword ptr [rcx + 0x290]
14599c61f: 488b9698020000 mov rdx, qword ptr [rsi + 0x298]
14599c626: e8a50aefff call 0x14588d0d0
14599c62b: 4869c8f0000000 imul rcx, rax, 0xf0
14599c632: 488d05571d2401 lea rax, [rip + 0x1241d57]
14599c639: 488b940180000000 mov rdx, qword ptr [rcx + rax + 0x80]
14599c641: 4839d7 cmp rdi, rdx
14599c644: 0f8324010000 jae 0x14599c76e
14599c64a: 4801c8 add rax, rcx
14599c64d: 488b4878 mov rcx, qword ptr [rax + 0x78]
14599c651: 488d14bf lea rdx, [rdi + rdi*4]
14599c655: 48c1e204 shl rdx, 4
14599c659: f30f10741134 movss xmm6, dword ptr [rcx + rdx + 0x34]
14599c65f: f3440f1096340a0000 movss xmm10, dword ptr [rsi + 0xa34]
14599c668: f3440f1080e0000000 movss xmm8, dword ptr [rax + 0xe0]
14599c671: f3440f108ea80a0000 movss xmm9, dword ptr [rsi + 0xaa8]
