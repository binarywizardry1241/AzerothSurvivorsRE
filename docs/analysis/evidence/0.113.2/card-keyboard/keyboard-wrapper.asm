00000001400be610: 4157                           push r15
00000001400be612: 4156                           push r14
00000001400be614: 4155                           push r13
00000001400be616: 4154                           push r12
00000001400be618: 56                             push rsi
00000001400be619: 57                             push rdi
00000001400be61a: 55                             push rbp
00000001400be61b: 53                             push rbx
00000001400be61c: 4881ecd8000000                 sub rsp, 0xd8
00000001400be623: bb01000000                     mov ebx, 1
00000001400be628: f0410fc198b0050000             lock xadd dword ptr [r8 + 0x5b0], ebx
00000001400be631: 833a01                         cmp dword ptr [rdx], 1
00000001400be634: 0f8568020000                   jne 0x1400be8a2
00000001400be63a: 4889d6                         mov rsi, rdx
00000001400be63d: 498b80a0050000                 mov rax, qword ptr [r8 + 0x5a0]
00000001400be644: 4889442438                     mov qword ptr [rsp + 0x38], rax
00000001400be649: 48394230                       cmp qword ptr [rdx + 0x30], rax
00000001400be64d: 0f8569020000                   jne 0x1400be8bc
00000001400be653: 4889cf                         mov rdi, rcx
00000001400be656: 488b4608                       mov rax, qword ptr [rsi + 8]
00000001400be65a: 498b8818020000                 mov rcx, qword ptr [r8 + 0x218]
00000001400be661: 4839c8                         cmp rax, rcx
00000001400be664: 0f8383020000                   jae 0x1400be8ed
00000001400be66a: 4d8b8810020000                 mov r9, qword ptr [r8 + 0x210]
00000001400be671: 498b04c1                       mov rax, qword ptr [r9 + rax*8]
00000001400be675: 4885c0                         test rax, rax
00000001400be678: 0f846f020000                   je 0x1400be8ed
00000001400be67e: 4d8b90e0010000                 mov r10, qword ptr [r8 + 0x1e0]
00000001400be685: 48f7d0                         not rax
00000001400be688: 486bc038                       imul rax, rax, 0x38
00000001400be68c: 41807c023000                   cmp byte ptr [r10 + rax + 0x30], 0
00000001400be692: 0f8455020000                   je 0x1400be8ed
00000001400be698: 488b5610                       mov rdx, qword ptr [rsi + 0x10]
00000001400be69c: 4839ca                         cmp rdx, rcx
00000001400be69f: 0f8348020000                   jae 0x1400be8ed
00000001400be6a5: 498b14d1                       mov rdx, qword ptr [r9 + rdx*8]
00000001400be6a9: 4885d2                         test rdx, rdx
00000001400be6ac: 0f843b020000                   je 0x1400be8ed
00000001400be6b2: 48f7d2                         not rdx
00000001400be6b5: 486bd238                       imul rdx, rdx, 0x38
00000001400be6b9: 41807c123000                   cmp byte ptr [r10 + rdx + 0x30], 0
00000001400be6bf: 0f8428020000                   je 0x1400be8ed
00000001400be6c5: 4c8b5e18                       mov r11, qword ptr [rsi + 0x18]
00000001400be6c9: 4939cb                         cmp r11, rcx
00000001400be6cc: 0f8359020000                   jae 0x1400be92b
00000001400be6d2: 4b8b0cd9                       mov rcx, qword ptr [r9 + r11*8]
00000001400be6d6: 4885c9                         test rcx, rcx
00000001400be6d9: 0f844c020000                   je 0x1400be92b
00000001400be6df: 48f7d1                         not rcx
00000001400be6e2: 4c6bc938                       imul r9, rcx, 0x38
00000001400be6e6: 43807c0a3000                   cmp byte ptr [r10 + r9 + 0x30], 0
00000001400be6ec: 0f8439020000                   je 0x1400be92b
00000001400be6f2: 4c01d0                         add rax, r10
00000001400be6f5: 4c8b7010                       mov r14, qword ptr [rax + 0x10]
00000001400be6f9: 8b4e38                         mov ecx, dword ptr [rsi + 0x38]
00000001400be6fc: 4c01d2                         add rdx, r10
00000001400be6ff: 4c8b5a10                       mov r11, qword ptr [rdx + 0x10]
00000001400be703: 4d01d1                         add r9, r10
00000001400be706: 4d8b5110                       mov r10, qword ptr [r9 + 0x10]
00000001400be70a: 418ba8b0050000                 mov ebp, dword ptr [r8 + 0x5b0]
00000001400be711: 4c8b6e20                       mov r13, qword ptr [rsi + 0x20]
00000001400be715: 4d8bb818020000                 mov r15, qword ptr [r8 + 0x218]
00000001400be71c: 4d39fd                         cmp r13, r15
00000001400be71f: 0f83c8010000                   jae 0x1400be8ed
00000001400be725: 4d8ba010020000                 mov r12, qword ptr [r8 + 0x210]
00000001400be72c: 4b8b2cec                       mov rbp, qword ptr [r12 + r13*8]
00000001400be730: 4885ed                         test rbp, rbp
00000001400be733: 0f84b4010000                   je 0x1400be8ed
00000001400be739: 4d8ba8e0010000                 mov r13, qword ptr [r8 + 0x1e0]
00000001400be740: 48f7d5                         not rbp
00000001400be743: 4c6bc538                       imul r8, rbp, 0x38
00000001400be747: 43807c053000                   cmp byte ptr [r13 + r8 + 0x30], 0
00000001400be74d: 0f849a010000                   je 0x1400be8ed
00000001400be753: 488b6e28                       mov rbp, qword ptr [rsi + 0x28]
00000001400be757: 4c39fd                         cmp rbp, r15
00000001400be75a: 0f838d010000                   jae 0x1400be8ed
00000001400be760: 4d8b3cec                       mov r15, qword ptr [r12 + rbp*8]
00000001400be764: 4d85ff                         test r15, r15
00000001400be767: 0f8480010000                   je 0x1400be8ed
00000001400be76d: 49f7d7                         not r15
00000001400be770: 4d6bff38                       imul r15, r15, 0x38
00000001400be774: 43807c3d3000                   cmp byte ptr [r13 + r15 + 0x30], 0
00000001400be77a: 0f846d010000                   je 0x1400be8ed
00000001400be780: 4d01e8                         add r8, r13
00000001400be783: 4d8b6010                       mov r12, qword ptr [r8 + 0x10]
00000001400be787: 4d01ef                         add r15, r13
00000001400be78a: 4d8b6f10                       mov r13, qword ptr [r15 + 0x10]
00000001400be78e: 4c89742438                     mov qword ptr [rsp + 0x38], r14
00000001400be793: 4c8d702c                       lea r14, [rax + 0x2c]
00000001400be797: 4883c028                       add rax, 0x28
00000001400be79b: 4889442440                     mov qword ptr [rsp + 0x40], rax
00000001400be7a0: 4c89742448                     mov qword ptr [rsp + 0x48], r14
00000001400be7a5: 894c2450                       mov dword ptr [rsp + 0x50], ecx
00000001400be7a9: 895c2454                       mov dword ptr [rsp + 0x54], ebx
00000001400be7ad: 4c895c2458                     mov qword ptr [rsp + 0x58], r11
00000001400be7b2: 488d422c                       lea rax, [rdx + 0x2c]
00000001400be7b6: 4883c228                       add rdx, 0x28
00000001400be7ba: 4889542460                     mov qword ptr [rsp + 0x60], rdx
00000001400be7bf: 4889442468                     mov qword ptr [rsp + 0x68], rax
00000001400be7c4: 894c2470                       mov dword ptr [rsp + 0x70], ecx
00000001400be7c8: 895c2474                       mov dword ptr [rsp + 0x74], ebx
00000001400be7cc: 4c89542478                     mov qword ptr [rsp + 0x78], r10
00000001400be7d1: 498d412c                       lea rax, [r9 + 0x2c]
00000001400be7d5: 4983c128                       add r9, 0x28
00000001400be7d9: 4c898c2480000000               mov qword ptr [rsp + 0x80], r9
00000001400be7e1: 4889842488000000               mov qword ptr [rsp + 0x88], rax
00000001400be7e9: 898c2490000000                 mov dword ptr [rsp + 0x90], ecx
00000001400be7f0: 899c2494000000                 mov dword ptr [rsp + 0x94], ebx
00000001400be7f7: 4c89a42498000000               mov qword ptr [rsp + 0x98], r12
00000001400be7ff: 498d402c                       lea rax, [r8 + 0x2c]
00000001400be803: 4983c028                       add r8, 0x28
00000001400be807: 4c898424a0000000               mov qword ptr [rsp + 0xa0], r8
00000001400be80f: 48898424a8000000               mov qword ptr [rsp + 0xa8], rax
00000001400be817: 498d4728                       lea rax, [r15 + 0x28]
00000001400be81b: 4983c72c                       add r15, 0x2c
00000001400be81f: 898c24b0000000                 mov dword ptr [rsp + 0xb0], ecx
00000001400be826: 899c24b4000000                 mov dword ptr [rsp + 0xb4], ebx
00000001400be82d: 4c89ac24b8000000               mov qword ptr [rsp + 0xb8], r13
00000001400be835: 4c8d442458                     lea r8, [rsp + 0x58]
00000001400be83a: 48898424c0000000               mov qword ptr [rsp + 0xc0], rax
00000001400be842: 4c8d4c2478                     lea r9, [rsp + 0x78]
00000001400be847: 4c89bc24c8000000               mov qword ptr [rsp + 0xc8], r15
00000001400be84f: 488d842498000000               lea rax, [rsp + 0x98]
00000001400be857: 898c24d0000000                 mov dword ptr [rsp + 0xd0], ecx
00000001400be85e: 488d8c24b8000000               lea rcx, [rsp + 0xb8]
00000001400be866: 899c24d4000000                 mov dword ptr [rsp + 0xd4], ebx
00000001400be86d: 48894c2428                     mov qword ptr [rsp + 0x28], rcx
00000001400be872: 4889442420                     mov qword ptr [rsp + 0x20], rax
00000001400be877: 488d542438                     lea rdx, [rsp + 0x38]
00000001400be87c: e89f4bffff                     call 0x1400b3420
00000001400be881: 895e38                         mov dword ptr [rsi + 0x38], ebx
00000001400be884: 48c707fdffffff                 mov qword ptr [rdi], 0xfffffffffffffffd
00000001400be88b: 4889f8                         mov rax, rdi
00000001400be88e: 4881c4d8000000                 add rsp, 0xd8
00000001400be895: 5b                             pop rbx
00000001400be896: 5d                             pop rbp
00000001400be897: 5f                             pop rdi
00000001400be898: 5e                             pop rsi
00000001400be899: 415c                           pop r12
00000001400be89b: 415d                           pop r13
00000001400be89d: 415e                           pop r14
00000001400be89f: 415f                           pop r15
00000001400be8a1: c3                             ret
00000001400be8a2: 488d0d77fde005                 lea rcx, [rip + 0x5e0fd77]
00000001400be8a9: 4c8d05d0fde005                 lea r8, [rip + 0x5e0fdd0]
00000001400be8b0: ba59000000                     mov edx, 0x59
00000001400be8b5: e886d7dd05                     call 0x145e9c040
00000001400be8ba: 0f0b                           ud2
00000001400be8bc: 4883c630                       add rsi, 0x30
00000001400be8c0: 488d0541fee005                 lea rax, [rip + 0x5e0fe41]
00000001400be8c7: 4889442428                     mov qword ptr [rsp + 0x28], rax
00000001400be8cc: 48c7442420df000000             mov qword ptr [rsp + 0x20], 0xdf
00000001400be8d5: 4c8d0dbcfde005                 lea r9, [rip + 0x5e0fdbc]
00000001400be8dc: 4c8d442438                     lea r8, [rsp + 0x38]
00000001400be8e1: 31c9                           xor ecx, ecx
00000001400be8e3: 4889f2                         mov rdx, rsi
00000001400be8e6: e86288d805                     call 0x145e4714d
00000001400be8eb: 0f0b                           ud2
00000001400be8ed: 4883c63c                       add rsi, 0x3c
00000001400be8f1: 4889742438                     mov qword ptr [rsp + 0x38], rsi
00000001400be8f6: 488d05232feb04                 lea rax, [rip + 0x4eb2f23]
00000001400be8fd: 4889442440                     mov qword ptr [rsp + 0x40], rax
00000001400be902: 488d4c2437                     lea rcx, [rsp + 0x37]
00000001400be907: 48894c2448                     mov qword ptr [rsp + 0x48], rcx
00000001400be90c: 4889442450                     mov qword ptr [rsp + 0x50], rax
00000001400be911: 488d0dc0f9e005                 lea rcx, [rip + 0x5e0f9c0]
00000001400be918: 4c8d0559fae005                 lea r8, [rip + 0x5e0fa59]
00000001400be91f: 488d542438                     lea rdx, [rsp + 0x38]
00000001400be924: e8d7d9dd05                     call 0x145e9c300
00000001400be929: 0f0b                           ud2
00000001400be92b: 4883c63c                       add rsi, 0x3c
00000001400be92f: 4889742438                     mov qword ptr [rsp + 0x38], rsi
00000001400be934: 488d05e52eeb04                 lea rax, [rip + 0x4eb2ee5]
00000001400be93b: 4889442440                     mov qword ptr [rsp + 0x40], rax
00000001400be940: 488d4c2437                     lea rcx, [rsp + 0x37]
00000001400be945: 48894c2448                     mov qword ptr [rsp + 0x48], rcx
00000001400be94a: 4889442450                     mov qword ptr [rsp + 0x50], rax
00000001400be94f: 488d0d82f9e005                 lea rcx, [rip + 0x5e0f982]
00000001400be956: 4c8d0593fae005                 lea r8, [rip + 0x5e0fa93]
00000001400be95d: 488d542438                     lea rdx, [rsp + 0x38]
00000001400be962: e899d9dd05                     call 0x145e9c300
00000001400be967: 0f0b                           ud2
