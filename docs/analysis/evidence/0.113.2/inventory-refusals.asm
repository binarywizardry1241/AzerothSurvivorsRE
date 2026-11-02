; AS0.113.2 SHA256 58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb
; [0x1458d5730,0x1458d586d) inventory refusal serializer; sender/allocator are replay seams.
0x1458d5730: 55                             push rbp
0x1458d5731: 56                             push rsi
0x1458d5732: 57                             push rdi
0x1458d5733: 53                             push rbx
0x1458d5734: 4883ec78                       sub rsp, 0x78
0x1458d5738: 488d6c2470                     lea rbp, [rsp + 0x70]
0x1458d573d: 48c74500feffffff               mov qword ptr [rbp], 0xfffffffffffffffe
0x1458d5745: 4c89c7                         mov rdi, r8
0x1458d5748: 89d3                           mov ebx, edx
0x1458d574a: 4889ce                         mov rsi, rcx
0x1458d574d: e8aeca72fa                     call 0x140002200
0x1458d5752: b920000000                     mov ecx, 0x20
0x1458d5757: ba01000000                     mov edx, 1
0x1458d575c: e85fca72fa                     call 0x1400021c0
0x1458d5761: 4885c0                         test rax, rax
0x1458d5764: 0f84f2000000                   je 0x1458d585c
0x1458d576a: 8818                           mov byte ptr [rax], bl
0x1458d576c: 48c745c020000000               mov qword ptr [rbp - 0x40], 0x20
0x1458d5774: 488945c8                       mov qword ptr [rbp - 0x38], rax
0x1458d5778: 66c745d81201                   mov word ptr [rbp - 0x28], 0x112
0x1458d577e: 48897801                       mov qword ptr [rax + 1], rdi
0x1458d5782: 48c745d009000000               mov qword ptr [rbp - 0x30], 9
0x1458d578a: 488b4dc0                       mov rcx, qword ptr [rbp - 0x40]
0x1458d578e: 4883c1f7                       add rcx, -9
0x1458d5792: b809000000                     mov eax, 9
0x1458d5797: 4883f907                       cmp rcx, 7
0x1458d579b: 0f868e000000                   jbe 0x1458d582f
0x1458d57a1: 488b4dc8                       mov rcx, qword ptr [rbp - 0x38]
0x1458d57a5: 48c7040100000000               mov qword ptr [rcx + rax], 0
0x1458d57ad: 4883c008                       add rax, 8
0x1458d57b1: 488945d0                       mov qword ptr [rbp - 0x30], rax
0x1458d57b5: 488b45d0                       mov rax, qword ptr [rbp - 0x30]
0x1458d57b9: 488945f0                       mov qword ptr [rbp - 0x10], rax
0x1458d57bd: 0fb745d8                       movzx eax, word ptr [rbp - 0x28]
0x1458d57c1: 668945f8                       mov word ptr [rbp - 8], ax
0x1458d57c5: 8b45da                         mov eax, dword ptr [rbp - 0x26]
0x1458d57c8: 8945fa                         mov dword ptr [rbp - 6], eax
0x1458d57cb: 0fb745de                       movzx eax, word ptr [rbp - 0x22]
0x1458d57cf: 668945fe                       mov word ptr [rbp - 2], ax
0x1458d57d3: 0f1045c0                       movups xmm0, xmmword ptr [rbp - 0x40]
0x1458d57d7: 0f2945e0                       movaps xmmword ptr [rbp - 0x20], xmm0
0x1458d57db: 488b7df0                       mov rdi, qword ptr [rbp - 0x10]
0x1458d57df: 483b7de0                       cmp rdi, qword ptr [rbp - 0x20]
0x1458d57e3: 750a                           jne 0x1458d57ef
0x1458d57e5: 488d4de0                       lea rcx, [rbp - 0x20]
0x1458d57e9: e892645c00                     call 0x145e9bc80
0x1458d57ee: 90                             nop
0x1458d57ef: 488b45e8                       mov rax, qword ptr [rbp - 0x18]
0x1458d57f3: c6043800                       mov byte ptr [rax + rdi], 0
0x1458d57f7: 48ffc7                         inc rdi
0x1458d57fa: 48897df0                       mov qword ptr [rbp - 0x10], rdi
0x1458d57fe: 0f2845e0                       movaps xmm0, xmmword ptr [rbp - 0x20]
0x1458d5802: 0f1106                         movups xmmword ptr [rsi], xmm0
0x1458d5805: 488b45f0                       mov rax, qword ptr [rbp - 0x10]
0x1458d5809: 48894610                       mov qword ptr [rsi + 0x10], rax
0x1458d580d: 0fb745f8                       movzx eax, word ptr [rbp - 8]
0x1458d5811: 66894618                       mov word ptr [rsi + 0x18], ax
0x1458d5815: 8b45fa                         mov eax, dword ptr [rbp - 6]
0x1458d5818: 89461a                         mov dword ptr [rsi + 0x1a], eax
0x1458d581b: 0fb745fe                       movzx eax, word ptr [rbp - 2]
0x1458d581f: 6689461e                       mov word ptr [rsi + 0x1e], ax
0x1458d5823: 4889f0                         mov rax, rsi
0x1458d5826: 4883c478                       add rsp, 0x78
0x1458d582a: 5b                             pop rbx
0x1458d582b: 5f                             pop rdi
0x1458d582c: 5e                             pop rsi
0x1458d582d: 5d                             pop rbp
0x1458d582e: c3                             ret
0x1458d582f: 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0x1458d5838: 488d4dc0                       lea rcx, [rbp - 0x40]
0x1458d583c: ba09000000                     mov edx, 9
0x1458d5841: 41b808000000                   mov r8d, 8
0x1458d5847: 41b901000000                   mov r9d, 1
0x1458d584d: e84e454200                     call 0x145cf9da0
0x1458d5852: 90                             nop
0x1458d5853: 488b45d0                       mov rax, qword ptr [rbp - 0x30]
0x1458d5857: e945ffffff                     jmp 0x1458d57a1
0x1458d585c: b901000000                     mov ecx, 1
0x1458d5861: ba20000000                     mov edx, 0x20
0x1458d5866: e820655c00                     call 0x145e9bd8b
0x1458d586b: 0f0b                           ud2
