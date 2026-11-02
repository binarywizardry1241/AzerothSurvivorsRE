; AS0.113.2 SHA256 58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb
; Callback/guard interfaces only; full incoming and query/refusal extracts remain separate.

; [0x14002ecc5,0x14002ecea)
0x14002ecc5: 4889742428                     mov qword ptr [rsp + 0x28], rsi
0x14002ecca: 48897c2420                     mov qword ptr [rsp + 0x20], rdi
0x14002eccf: 488d0d9273e905                 lea rcx, [rip + 0x5e97392]
0x14002ecd6: 4c8d0d4373e905                 lea r9, [rip + 0x5e97343]
0x14002ecdd: ba0d000000                     mov edx, 0xd
0x14002ece2: 4989c0                         mov r8, rax
0x14002ece5: e8a6f07e05                     call 0x14581dd90

; [0x14581ddaa,0x14581ddb8)
0x14581ddaa: 4c894df8                       mov qword ptr [rbp - 8], r9
0x14581ddae: 4c894500                       mov qword ptr [rbp], r8
0x14581ddb2: 4889d6                         mov rsi, rdx
0x14581ddb5: 4889cf                         mov rdi, rcx

; [0x14581de44,0x14581de90)
0x14581de44: 488b4568                       mov rax, qword ptr [rbp + 0x68]
0x14581de48: 488b5560                       mov rdx, qword ptr [rbp + 0x60]
0x14581de4c: 488b4a30                       mov rcx, qword ptr [rdx + 0x30]
0x14581de50: 48894de0                       mov qword ptr [rbp - 0x20], rcx
0x14581de54: 0f1002                         movups xmm0, xmmword ptr [rdx]
0x14581de57: 0f104a10                       movups xmm1, xmmword ptr [rdx + 0x10]
0x14581de5b: 0f105220                       movups xmm2, xmmword ptr [rdx + 0x20]
0x14581de5f: 0f2955d0                       movaps xmmword ptr [rbp - 0x30], xmm2
0x14581de63: 0f294dc0                       movaps xmmword ptr [rbp - 0x40], xmm1
0x14581de67: 0f2945b0                       movaps xmmword ptr [rbp - 0x50], xmm0
0x14581de6b: c6451700                       mov byte ptr [rbp + 0x17], 0
0x14581de6f: 4889442428                     mov qword ptr [rsp + 0x28], rax
0x14581de74: 488d45b0                       lea rax, [rbp - 0x50]
0x14581de78: 4889442420                     mov qword ptr [rsp + 0x20], rax
0x14581de7d: 4889f9                         mov rcx, rdi
0x14581de80: 4889f2                         mov rdx, rsi
0x14581de83: 4c8b4500                       mov r8, qword ptr [rbp]
0x14581de87: 4c8b4df8                       mov r9, qword ptr [rbp - 8]
0x14581de8b: e880a10600                     call 0x145888010

; [0x145888036,0x145888064)
0x145888036: 4c89c8                         mov rax, r9
0x145888039: 4889d6                         mov rsi, rdx
0x14588803c: 4889cf                         mov rdi, rcx
0x14588803f: 4c8b8d10460000                 mov r9, qword ptr [rbp + 0x4610]
0x145888046: 488b8d18460000                 mov rcx, qword ptr [rbp + 0x4618]
0x14588804d: 48894c2420                     mov qword ptr [rsp + 0x20], rcx
0x145888052: 488d8d582e0000                 lea rcx, [rbp + 0x2e58]
0x145888059: 4c89c2                         mov rdx, r8
0x14588805c: 4989c0                         mov r8, rax
0x14588805f: e81cf3fdff                     call 0x145867380

; [0x145867ab2,0x145867ace)
0x145867ab2: 488b85a8070000                 mov rax, qword ptr [rbp + 0x7a8]
0x145867ab9: 48898668160000                 mov qword ptr [rsi + 0x1668], rax
0x145867ac0: 488b85a0070000                 mov rax, qword ptr [rbp + 0x7a0]
0x145867ac7: 48898670160000                 mov qword ptr [rsi + 0x1670], rax

; [0x145880d6b,0x145880d83)
0x145880d6b: 498b8d68160000                 mov rcx, qword ptr [r13 + 0x1668]
0x145880d72: 498b8570160000                 mov rax, qword ptr [r13 + 0x1670]
0x145880d79: ff5040                         call qword ptr [rax + 0x40]
0x145880d7c: 90                             nop
0x145880d7d: 8885b60b0000                   mov byte ptr [rbp + 0xbb6], al

; [0x14005fb70,0x14005fb73)
0x14005fb70: 31c0                           xor eax, eax
0x14005fb72: c3                             ret

; [0x1459672d0,0x145967311)
0x1459672d0: 55                             push rbp
0x1459672d1: 4157                           push r15
0x1459672d3: 4156                           push r14
0x1459672d5: 56                             push rsi
0x1459672d6: 57                             push rdi
0x1459672d7: 53                             push rbx
0x1459672d8: 4881ecc8000000                 sub rsp, 0xc8
0x1459672df: 488dac2480000000               lea rbp, [rsp + 0x80]
0x1459672e7: 48c74540feffffff               mov qword ptr [rbp + 0x40], 0xfffffffffffffffe
0x1459672ef: 0fb681100c0000                 movzx eax, byte ptr [rcx + 0xc10]
0x1459672f6: 3dff000000                     cmp eax, 0xff
0x1459672fb: 0f8475050000                   je 0x145967876
0x145967301: 4889ce                         mov rsi, rcx
0x145967304: 80b9fe0b000000                 cmp byte ptr [rcx + 0xbfe], 0
0x14596730b: 0f8465050000                   je 0x145967876

; [0x145969320,0x145969361)
0x145969320: 55                             push rbp
0x145969321: 4157                           push r15
0x145969323: 4156                           push r14
0x145969325: 4155                           push r13
0x145969327: 4154                           push r12
0x145969329: 56                             push rsi
0x14596932a: 57                             push rdi
0x14596932b: 53                             push rbx
0x14596932c: 4881ec78010000                 sub rsp, 0x178
0x145969333: 488dac2480000000               lea rbp, [rsp + 0x80]
0x14596933b: 0f29bde0000000                 movaps xmmword ptr [rbp + 0xe0], xmm7
0x145969342: 0f29b5d0000000                 movaps xmmword ptr [rbp + 0xd0], xmm6
0x145969349: 48c785c8000000feffffff         mov qword ptr [rbp + 0xc8], 0xfffffffffffffffe
0x145969354: 80b9fe0b000001                 cmp byte ptr [rcx + 0xbfe], 1
0x14596935b: 0f85ab050000                   jne 0x14596990c
