; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone 5.0.7; static observations, no target execution.
0000000145bf5ed0 55                             push rbp
0000000145bf5ed1 4157                           push r15
0000000145bf5ed3 4156                           push r14
0000000145bf5ed5 56                             push rsi
0000000145bf5ed6 57                             push rdi
0000000145bf5ed7 53                             push rbx
0000000145bf5ed8 4883ec48                       sub rsp, 0x48
0000000145bf5edc 488d6c2440                     lea rbp, [rsp + 0x40]
0000000145bf5ee1 48c74500feffffff               mov qword ptr [rbp], 0xfffffffffffffffe
0000000145bf5ee9 4889d3                         mov rbx, rdx
0000000145bf5eec 4889ce                         mov rsi, rcx
0000000145bf5eef 4c8b32                         mov r14, qword ptr [rdx]
0000000145bf5ef2 48b80100000000000080           movabs rax, 0x8000000000000001
0000000145bf5efc 4c01f0                         add rax, r14
0000000145bf5eff 49c1fe3f                       sar r14, 0x3f
0000000145bf5f03 4921c6                         and r14, rax
0000000145bf5f06 488d0593b7a001                 lea rax, [rip + 0x1a0b793]
0000000145bf5f0d 4a8b3cf0                       mov rdi, qword ptr [rax + r14*8]
0000000145bf5f11 e8eac240fa                     call 0x140002200
0000000145bf5f16 b901000000                     mov ecx, 1
0000000145bf5f1b ba01000000                     mov edx, 1
0000000145bf5f20 e89bc240fa                     call 0x1400021c0
0000000145bf5f25 4885c0                         test rax, rax
0000000145bf5f28 0f84d2000000                   je 0x145bf6000
0000000145bf5f2e 448830                         mov byte ptr [rax], r14b
0000000145bf5f31 48c745e801000000               mov qword ptr [rbp - 0x18], 1
0000000145bf5f39 488945f0                       mov qword ptr [rbp - 0x10], rax
0000000145bf5f3d 48c745f801000000               mov qword ptr [rbp - 8], 1
0000000145bf5f45 488b3c3b                       mov rdi, qword ptr [rbx + rdi]
0000000145bf5f49 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145bf5f52 488d4de8                       lea rcx, [rbp - 0x18]
0000000145bf5f56 ba01000000                     mov edx, 1
0000000145bf5f5b 41b808000000                   mov r8d, 8
0000000145bf5f61 41b901000000                   mov r9d, 1
0000000145bf5f67 e8d4523b00                     call 0x145fab240
0000000145bf5f6c 90                             nop
0000000145bf5f6d 488b4df0                       mov rcx, qword ptr [rbp - 0x10]
0000000145bf5f71 4c8b7df8                       mov r15, qword ptr [rbp - 8]
0000000145bf5f75 4a893c39                       mov qword ptr [rcx + r15], rdi
0000000145bf5f79 498d7f08                       lea rdi, [r15 + 8]
0000000145bf5f7d 48897df8                       mov qword ptr [rbp - 8], rdi
0000000145bf5f81 4983fe02                       cmp r14, 2
0000000145bf5f85 7432                           je 0x145bf5fb9
0000000145bf5f87 4983fe01                       cmp r14, 1
0000000145bf5f8b 7454                           je 0x145bf5fe1
0000000145bf5f8d 4c8b7308                       mov r14, qword ptr [rbx + 8]
0000000145bf5f91 488b5b10                       mov rbx, qword ptr [rbx + 0x10]
0000000145bf5f95 488b45e8                       mov rax, qword ptr [rbp - 0x18]
0000000145bf5f99 4829f8                         sub rax, rdi
0000000145bf5f9c 4839c3                         cmp rbx, rax
0000000145bf5f9f 7770                           ja 0x145bf6011
0000000145bf5fa1 4885db                         test rbx, rbx
0000000145bf5fa4 740e                           je 0x145bf5fb4
0000000145bf5fa6 4801f9                         add rcx, rdi
0000000145bf5fa9 4c89f2                         mov rdx, r14
0000000145bf5fac 4989d8                         mov r8, rbx
0000000145bf5faf e8774e3b00                     call 0x145faae2b
0000000145bf5fb4 4801df                         add rdi, rbx
0000000145bf5fb7 eb24                           jmp 0x145bf5fdd
0000000145bf5fb9 0fb65b10                       movzx ebx, byte ptr [rbx + 0x10]
0000000145bf5fbd 483b7de8                       cmp rdi, qword ptr [rbp - 0x18]
0000000145bf5fc1 750e                           jne 0x145bf5fd1
0000000145bf5fc3 488d4de8                       lea rcx, [rbp - 0x18]
0000000145bf5fc7 e8d4bf5500                     call 0x146151fa0
0000000145bf5fcc 90                             nop
0000000145bf5fcd 488b4df0                       mov rcx, qword ptr [rbp - 0x10]
0000000145bf5fd1 42885c3908                     mov byte ptr [rcx + r15 + 8], bl
0000000145bf5fd6 4983c709                       add r15, 9
0000000145bf5fda 4c89ff                         mov rdi, r15
0000000145bf5fdd 48897df8                       mov qword ptr [rbp - 8], rdi
0000000145bf5fe1 488b45f8                       mov rax, qword ptr [rbp - 8]
0000000145bf5fe5 48894610                       mov qword ptr [rsi + 0x10], rax
0000000145bf5fe9 0f1045e8                       movups xmm0, xmmword ptr [rbp - 0x18]
0000000145bf5fed 0f1106                         movups xmmword ptr [rsi], xmm0
0000000145bf5ff0 4889f0                         mov rax, rsi
0000000145bf5ff3 4883c448                       add rsp, 0x48
0000000145bf5ff7 5b                             pop rbx
0000000145bf5ff8 5f                             pop rdi
0000000145bf5ff9 5e                             pop rsi
0000000145bf5ffa 415e                           pop r14
0000000145bf5ffc 415f                           pop r15
0000000145bf5ffe 5d                             pop rbp
0000000145bf5fff c3                             ret
0000000145bf6000 b901000000                     mov ecx, 1
0000000145bf6005 ba01000000                     mov edx, 1
0000000145bf600a e882c05500                     call 0x146152091
0000000145bf600f 0f0b                           ud2
0000000145bf6011 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145bf601a 488d4de8                       lea rcx, [rbp - 0x18]
0000000145bf601e 41b901000000                   mov r9d, 1
0000000145bf6024 4889fa                         mov rdx, rdi
0000000145bf6027 4989d8                         mov r8, rbx
0000000145bf602a e811523b00                     call 0x145fab240
0000000145bf602f 90                             nop
0000000145bf6030 488b4df0                       mov rcx, qword ptr [rbp - 0x10]
0000000145bf6034 488b7df8                       mov rdi, qword ptr [rbp - 8]
0000000145bf6038 e969ffffff                     jmp 0x145bf5fa6
