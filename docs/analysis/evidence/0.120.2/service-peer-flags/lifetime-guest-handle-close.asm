; Current0.120.2 PE-declared helper extent; native decoded instructions, not original source.
0000000145c053b0 55                             push rbp
0000000145c053b1 56                             push rsi
0000000145c053b2 57                             push rdi
0000000145c053b3 53                             push rbx
0000000145c053b4 4881ec28010000                 sub rsp, 0x128
0000000145c053bb 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145c053c3 48c785a0000000feffffff         mov qword ptr [rbp + 0xa0], 0xfffffffffffffffe
0000000145c053ce 80790800                       cmp byte ptr [rcx + 8], 0
0000000145c053d2 c6410800                       mov byte ptr [rcx + 8], 0
0000000145c053d6 0f84f3000000                   je 0x145c054cf
0000000145c053dc 488b19                         mov rbx, qword ptr [rcx]
0000000145c053df b101                           mov cl, 1
0000000145c053e1 31c0                           xor eax, eax
0000000145c053e3 f00fb04b10                     lock cmpxchg byte ptr [rbx + 0x10], cl
0000000145c053e8 0f85ed000000                   jne 0x145c054db
0000000145c053ee 488b3d83f79202                 mov rdi, qword ptr [rip + 0x292f783]
0000000145c053f5 488b07                         mov rax, qword ptr [rdi]
0000000145c053f8 48d1e0                         shl rax, 1
0000000145c053fb 4885c0                         test rax, rax
0000000145c053fe 0f85e5000000                   jne 0x145c054e9
0000000145c05404 c7859c00000000000000           mov dword ptr [rbp + 0x9c], 0
0000000145c0540e 0fb64311                       movzx eax, byte ptr [rbx + 0x11]
0000000145c05412 488bb380010000                 mov rsi, qword ptr [rbx + 0x180]
0000000145c05419 48899d90000000                 mov qword ptr [rbp + 0x90], rbx
0000000145c05420 488b9b88010000                 mov rbx, qword ptr [rbx + 0x188]
0000000145c05427 488d1532969f01                 lea rdx, [rip + 0x19f9632]
0000000145c0542e 488d4da8                       lea rcx, [rbp - 0x58]
0000000145c05432 e8095a2000                     call 0x145e0ae40
0000000145c05437 90                             nop
0000000145c05438 488d55a8                       lea rdx, [rbp - 0x58]
0000000145c0543c 4889f1                         mov rcx, rsi
0000000145c0543f ff5318                         call qword ptr [rbx + 0x18]
0000000145c05442 90                             nop
0000000145c05443 488bb590000000                 mov rsi, qword ptr [rbp + 0x90]
0000000145c0544a 488b4678                       mov rax, qword ptr [rsi + 0x78]
0000000145c0544e 48c74678ffffffff               mov qword ptr [rsi + 0x78], 0xffffffffffffffff
0000000145c05456 4883f8ff                       cmp rax, -1
0000000145c0545a 7456                           je 0x145c054b2
0000000145c0545c 488d9680000000                 lea rdx, [rsi + 0x80]
0000000145c05463 488945a8                       mov qword ptr [rbp - 0x58], rax
0000000145c05467 488d4db0                       lea rcx, [rbp - 0x50]
0000000145c0546b 41b8c8000000                   mov r8d, 0xc8
0000000145c05471 e8b5593a00                     call 0x145faae2b
0000000145c05476 488b7560                       mov rsi, qword ptr [rbp + 0x60]
0000000145c0547a 488b5d68                       mov rbx, qword ptr [rbp + 0x68]
0000000145c0547e 488d15db959f01                 lea rdx, [rip + 0x19f95db]
0000000145c05485 488d4d78                       lea rcx, [rbp + 0x78]
0000000145c05489 e8b2592000                     call 0x145e0ae40
0000000145c0548e 90                             nop
0000000145c0548f 488d5578                       lea rdx, [rbp + 0x78]
0000000145c05493 4889f1                         mov rcx, rsi
0000000145c05496 ff5318                         call qword ptr [rbx + 0x18]
0000000145c05499 90                             nop
0000000145c0549a 4889f1                         mov rcx, rsi
0000000145c0549d ff5330                         call qword ptr [rbx + 0x30]
0000000145c054a0 90                             nop
0000000145c054a1 488d4da8                       lea rcx, [rbp - 0x58]
0000000145c054a5 e8d6f1feff                     call 0x145bf4680
0000000145c054aa 90                             nop
0000000145c054ab 488bb590000000                 mov rsi, qword ptr [rbp + 0x90]
0000000145c054b2 80bd9c00000000                 cmp byte ptr [rbp + 0x9c], 0
0000000145c054b9 750b                           jne 0x145c054c6
0000000145c054bb 488b07                         mov rax, qword ptr [rdi]
0000000145c054be 48d1e0                         shl rax, 1
0000000145c054c1 4885c0                         test rax, rax
0000000145c054c4 7543                           jne 0x145c05509
0000000145c054c6 31c0                           xor eax, eax
0000000145c054c8 864610                         xchg byte ptr [rsi + 0x10], al
0000000145c054cb 3c02                           cmp al, 2
0000000145c054cd 742c                           je 0x145c054fb
0000000145c054cf 4881c428010000                 add rsp, 0x128
0000000145c054d6 5b                             pop rbx
0000000145c054d7 5f                             pop rdi
0000000145c054d8 5e                             pop rsi
0000000145c054d9 5d                             pop rbp
0000000145c054da c3                             ret
0000000145c054db 488d4b10                       lea rcx, [rbx + 0x10]
0000000145c054df e86cb25400                     call 0x146150750
0000000145c054e4 e905ffffff                     jmp 0x145c053ee
0000000145c054e9 e8f2bf5400                     call 0x1461514e0
0000000145c054ee 3401                           xor al, 1
0000000145c054f0 89859c000000                   mov dword ptr [rbp + 0x9c], eax
0000000145c054f6 e913ffffff                     jmp 0x145c0540e
0000000145c054fb 4883c610                       add rsi, 0x10
0000000145c054ff 4889f1                         mov rcx, rsi
0000000145c05502 e809b35400                     call 0x146150810
0000000145c05507 ebc6                           jmp 0x145c054cf
0000000145c05509 e8d2bf5400                     call 0x1461514e0
0000000145c0550e 84c0                           test al, al
0000000145c05510 75b4                           jne 0x145c054c6
0000000145c05512 c6461101                       mov byte ptr [rsi + 0x11], 1
0000000145c05516 ebae                           jmp 0x145c054c6
