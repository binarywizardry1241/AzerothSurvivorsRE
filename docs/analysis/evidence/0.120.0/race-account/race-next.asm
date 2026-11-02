0000000145c48790  4157                   push r15
0000000145c48792  4156                   push r14
0000000145c48794  4154                   push r12
0000000145c48796  56                     push rsi
0000000145c48797  57                     push rdi
0000000145c48798  55                     push rbp
0000000145c48799  53                     push rbx
0000000145c4879a  4883ec50               sub rsp, 0x50
0000000145c4879e  4889ce                 mov rsi, rcx
0000000145c487a1  488d81d8000000         lea rax, [rcx + 0xd8]
0000000145c487a8  4889442440             mov qword ptr [rsp + 0x40], rax
0000000145c487ad  4889442448             mov qword ptr [rsp + 0x48], rax
0000000145c487b2  488d7948               lea rdi, [rcx + 0x48]
0000000145c487b6  83797cff               cmp dword ptr [rcx + 0x7c], -1
0000000145c487ba  7409                   je 0x145c487c5
0000000145c487bc  80be8900000000         cmp byte ptr [rsi + 0x89], 0
0000000145c487c3  7461                   je 0x145c48826
0000000145c487c5  c7467cffffffff         mov dword ptr [rsi + 0x7c], 0xffffffff
0000000145c487cc  837e34ff               cmp dword ptr [rsi + 0x34], -1
0000000145c487d0  741a                   je 0x145c487ec
0000000145c487d2  488d542440             lea rdx, [rsp + 0x40]
0000000145c487d7  4889f1                 mov rcx, rsi
0000000145c487da  4989f8                 mov r8, rdi
0000000145c487dd  e87e5ffdff             call 0x145c1e760
0000000145c487e2  a801                   test al, 1
0000000145c487e4  7406                   je 0x145c487ec
0000000145c487e6  89d5                   mov ebp, edx
0000000145c487e8  b001                   mov al, 1
0000000145c487ea  eb29                   jmp 0x145c48815
0000000145c487ec  c7467cffffffff         mov dword ptr [rsi + 0x7c], 0xffffffff
0000000145c487f3  83bec4000000ff         cmp dword ptr [rsi + 0xc4], -1
0000000145c487fa  740d                   je 0x145c48809
0000000145c487fc  80bed100000000         cmp byte ptr [rsi + 0xd1], 0
0000000145c48803  0f84a0010000           je 0x145c489a9
0000000145c48809  c786c4000000ffffffff   mov dword ptr [rsi + 0xc4], 0xffffffff
0000000145c48813  31c0                   xor eax, eax
0000000145c48815  89ea                   mov edx, ebp
0000000145c48817  4883c450               add rsp, 0x50
0000000145c4881b  5b                     pop rbx
0000000145c4881c  5d                     pop rbp
0000000145c4881d  5f                     pop rdi
0000000145c4881e  5e                     pop rsi
0000000145c4881f  415c                   pop r12
0000000145c48821  415e                   pop r14
0000000145c48823  415f                   pop r15
0000000145c48825  c3                     ret
0000000145c48826  488d5e58               lea rbx, [rsi + 0x58]
0000000145c4882a  4c8d742428             lea r14, [rsp + 0x28]
0000000145c4882f  41b70a                 mov r15b, 0xa
0000000145c48832  eb29                   jmp 0x145c4885d
0000000145c48834  31c0                   xor eax, eax
0000000145c48836  89c1                   mov ecx, eax
0000000145c48838  89c5                   mov ebp, eax
0000000145c4883a  e81110f0ff             call 0x145b49850
0000000145c4883f  84c0                   test al, al
0000000145c48841  75a5                   jne 0x145c487e8
0000000145c48843  666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145c48850  80be8900000001         cmp byte ptr [rsi + 0x89], 1
0000000145c48857  0f8468ffffff           je 0x145c487c5
0000000145c4885d  4c8b23                 mov r12, qword ptr [rbx]
0000000145c48860  4c89f1                 mov rcx, r14
0000000145c48863  4889da                 mov rdx, rbx
0000000145c48866  e8150b0000             call 0x145c49380
0000000145c4886b  837c242801             cmp dword ptr [rsp + 0x28], 1
0000000145c48870  751e                   jne 0x145c48890
0000000145c48872  488b4c2430             mov rcx, qword ptr [rsp + 0x30]
0000000145c48877  488b442438             mov rax, qword ptr [rsp + 0x38]
0000000145c4887c  488b17                 mov rdx, qword ptr [rdi]
0000000145c4887f  4829d1                 sub rcx, rdx
0000000145c48882  4901d4                 add r12, rdx
0000000145c48885  488907                 mov qword ptr [rdi], rax
0000000145c48888  4885c9                 test rcx, rcx
0000000145c4888b  753b                   jne 0x145c488c8
0000000145c4888d  ebc1                   jmp 0x145c48850
0000000145c4888f  90                     nop
0000000145c48890  80be8900000000         cmp byte ptr [rsi + 0x89], 0
0000000145c48897  0f8528ffffff           jne 0x145c487c5
0000000145c4889d  c6868900000001         mov byte ptr [rsi + 0x89], 1
0000000145c488a4  4c8b6648               mov r12, qword ptr [rsi + 0x48]
0000000145c488a8  488b4e50               mov rcx, qword ptr [rsi + 0x50]
0000000145c488ac  4c29e1                 sub rcx, r12
0000000145c488af  0f95c0                 setne al
0000000145c488b2  0a8688000000           or al, byte ptr [rsi + 0x88]
0000000145c488b8  3c01                   cmp al, 1
0000000145c488ba  0f8505ffffff           jne 0x145c487c5
0000000145c488c0  4c0323                 add r12, qword ptr [rbx]
0000000145c488c3  4885c9                 test rcx, rcx
0000000145c488c6  7488                   je 0x145c48850
0000000145c488c8  4883f901               cmp rcx, 1
0000000145c488cc  7522                   jne 0x145c488f0
0000000145c488ce  410fb61424             movzx edx, byte ptr [r12]
0000000145c488d3  83fa2b                 cmp edx, 0x2b
0000000145c488d6  0f8474ffffff           je 0x145c48850
0000000145c488dc  83fa2d                 cmp edx, 0x2d
0000000145c488df  0f846bffffff           je 0x145c48850
0000000145c488e5  eb0e                   jmp 0x145c488f5
0000000145c488e7  660f1f840000000000     nop word ptr [rax + rax]
0000000145c488f0  410fb61424             movzx edx, byte ptr [r12]
0000000145c488f5  31c0                   xor eax, eax
0000000145c488f7  80fa2b                 cmp dl, 0x2b
0000000145c488fa  0f94c0                 sete al
0000000145c488fd  4889ca                 mov rdx, rcx
0000000145c48900  4829c2                 sub rdx, rax
0000000145c48903  4901c4                 add r12, rax
0000000145c48906  4883fa03               cmp rdx, 3
0000000145c4890a  7354                   jae 0x145c48960
0000000145c4890c  4885d2                 test rdx, rdx
0000000145c4890f  0f841fffffff           je 0x145c48834
0000000145c48915  410fb60424             movzx eax, byte ptr [r12]
0000000145c4891a  83c0d0                 add eax, -0x30
0000000145c4891d  83f809                 cmp eax, 9
0000000145c48920  0f872affffff           ja 0x145c48850
0000000145c48926  4883fa01               cmp rdx, 1
0000000145c4892a  0f8406ffffff           je 0x145c48836
0000000145c48930  410fb64c2401           movzx ecx, byte ptr [r12 + 1]
0000000145c48936  83c1d0                 add ecx, -0x30
0000000145c48939  83f909                 cmp ecx, 9
0000000145c4893c  0f870effffff           ja 0x145c48850
0000000145c48942  0fb6c0                 movzx eax, al
0000000145c48945  01c0                   add eax, eax
0000000145c48947  8d0480                 lea eax, [rax + rax*4]
0000000145c4894a  00c1                   add cl, al
0000000145c4894c  89c8                   mov eax, ecx
0000000145c4894e  e9e3feffff             jmp 0x145c48836
0000000145c48953  666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145c48960  48f7d8                 neg rax
0000000145c48963  4801c1                 add rcx, rax
0000000145c48966  48f7d9                 neg rcx
0000000145c48969  31d2                   xor edx, edx
0000000145c4896b  31c0                   xor eax, eax
0000000145c4896d  4989c8                 mov r8, rcx
0000000145c48970  4901d0                 add r8, rdx
0000000145c48973  0f84bdfeffff           je 0x145c48836
0000000145c48979  41f6e7                 mul r15b
0000000145c4897c  0f80cefeffff           jo 0x145c48850
0000000145c48982  450fb60c14             movzx r9d, byte ptr [r12 + rdx]
0000000145c48987  4183c1d0               add r9d, -0x30
0000000145c4898b  4400c8                 add al, r9b
0000000145c4898e  410f92c0               setb r8b
0000000145c48992  4183f909               cmp r9d, 9
0000000145c48996  0f87b4feffff           ja 0x145c48850
0000000145c4899c  48ffc2                 inc rdx
0000000145c4899f  4584c0                 test r8b, r8b
0000000145c489a2  74c9                   je 0x145c4896d
0000000145c489a4  e9a7feffff             jmp 0x145c48850
0000000145c489a9  488dbea0000000         lea rdi, [rsi + 0xa0]
0000000145c489b0  488d5c2428             lea rbx, [rsp + 0x28]
0000000145c489b5  41b60a                 mov r14b, 0xa
0000000145c489b8  eb23                   jmp 0x145c489dd
0000000145c489ba  31c0                   xor eax, eax
0000000145c489bc  89c1                   mov ecx, eax
0000000145c489be  89c5                   mov ebp, eax
0000000145c489c0  e88b0ef0ff             call 0x145b49850
0000000145c489c5  84c0                   test al, al
0000000145c489c7  0f851bfeffff           jne 0x145c487e8
0000000145c489cd  0f1f00                 nop dword ptr [rax]
0000000145c489d0  80bed100000001         cmp byte ptr [rsi + 0xd1], 1
0000000145c489d7  0f842cfeffff           je 0x145c48809
0000000145c489dd  4c8b3f                 mov r15, qword ptr [rdi]
0000000145c489e0  4889d9                 mov rcx, rbx
0000000145c489e3  4889fa                 mov rdx, rdi
0000000145c489e6  e895090000             call 0x145c49380
0000000145c489eb  837c242801             cmp dword ptr [rsp + 0x28], 1
0000000145c489f0  752e                   jne 0x145c48a20
0000000145c489f2  488b4c2430             mov rcx, qword ptr [rsp + 0x30]
0000000145c489f7  488b442438             mov rax, qword ptr [rsp + 0x38]
0000000145c489fc  488b9690000000         mov rdx, qword ptr [rsi + 0x90]
0000000145c48a03  4829d1                 sub rcx, rdx
0000000145c48a06  4901d7                 add r15, rdx
0000000145c48a09  48898690000000         mov qword ptr [rsi + 0x90], rax
0000000145c48a10  4885c9                 test rcx, rcx
0000000145c48a13  754d                   jne 0x145c48a62
0000000145c48a15  ebb9                   jmp 0x145c489d0
0000000145c48a17  660f1f840000000000     nop word ptr [rax + rax]
0000000145c48a20  80bed100000000         cmp byte ptr [rsi + 0xd1], 0
0000000145c48a27  0f85dcfdffff           jne 0x145c48809
0000000145c48a2d  c686d100000001         mov byte ptr [rsi + 0xd1], 1
0000000145c48a34  4c8bbe90000000         mov r15, qword ptr [rsi + 0x90]
0000000145c48a3b  488b8e98000000         mov rcx, qword ptr [rsi + 0x98]
0000000145c48a42  4c29f9                 sub rcx, r15
0000000145c48a45  0f95c0                 setne al
0000000145c48a48  0a86d0000000           or al, byte ptr [rsi + 0xd0]
0000000145c48a4e  3c01                   cmp al, 1
0000000145c48a50  0f85b3fdffff           jne 0x145c48809
0000000145c48a56  4c033f                 add r15, qword ptr [rdi]
0000000145c48a59  4885c9                 test rcx, rcx
0000000145c48a5c  0f846effffff           je 0x145c489d0
0000000145c48a62  4883f901               cmp rcx, 1
0000000145c48a66  7518                   jne 0x145c48a80
0000000145c48a68  410fb617               movzx edx, byte ptr [r15]
0000000145c48a6c  83fa2b                 cmp edx, 0x2b
0000000145c48a6f  0f845bffffff           je 0x145c489d0
0000000145c48a75  83fa2d                 cmp edx, 0x2d
0000000145c48a78  0f8452ffffff           je 0x145c489d0
0000000145c48a7e  eb04                   jmp 0x145c48a84
0000000145c48a80  410fb617               movzx edx, byte ptr [r15]
0000000145c48a84  31c0                   xor eax, eax
0000000145c48a86  80fa2b                 cmp dl, 0x2b
0000000145c48a89  0f94c0                 sete al
0000000145c48a8c  4889ca                 mov rdx, rcx
0000000145c48a8f  4829c2                 sub rdx, rax
0000000145c48a92  4901c7                 add r15, rax
0000000145c48a95  4883fa03               cmp rdx, 3
0000000145c48a99  7345                   jae 0x145c48ae0
0000000145c48a9b  4885d2                 test rdx, rdx
0000000145c48a9e  0f8416ffffff           je 0x145c489ba
0000000145c48aa4  410fb607               movzx eax, byte ptr [r15]
0000000145c48aa8  83c0d0                 add eax, -0x30
0000000145c48aab  83f809                 cmp eax, 9
0000000145c48aae  0f871cffffff           ja 0x145c489d0
0000000145c48ab4  4883fa01               cmp rdx, 1
0000000145c48ab8  0f84fefeffff           je 0x145c489bc
0000000145c48abe  410fb64f01             movzx ecx, byte ptr [r15 + 1]
0000000145c48ac3  83c1d0                 add ecx, -0x30
0000000145c48ac6  83f909                 cmp ecx, 9
0000000145c48ac9  0f8701ffffff           ja 0x145c489d0
0000000145c48acf  0fb6c0                 movzx eax, al
0000000145c48ad2  01c0                   add eax, eax
0000000145c48ad4  8d0480                 lea eax, [rax + rax*4]
0000000145c48ad7  00c1                   add cl, al
0000000145c48ad9  89c8                   mov eax, ecx
0000000145c48adb  e9dcfeffff             jmp 0x145c489bc
0000000145c48ae0  48f7d8                 neg rax
0000000145c48ae3  4801c1                 add rcx, rax
0000000145c48ae6  48f7d9                 neg rcx
0000000145c48ae9  31d2                   xor edx, edx
0000000145c48aeb  31c0                   xor eax, eax
0000000145c48aed  4989c8                 mov r8, rcx
0000000145c48af0  4901d0                 add r8, rdx
0000000145c48af3  0f84c3feffff           je 0x145c489bc
0000000145c48af9  41f6e6                 mul r14b
0000000145c48afc  0f80cefeffff           jo 0x145c489d0
0000000145c48b02  450fb60c17             movzx r9d, byte ptr [r15 + rdx]
0000000145c48b07  4183c1d0               add r9d, -0x30
0000000145c48b0b  4400c8                 add al, r9b
0000000145c48b0e  410f92c0               setb r8b
0000000145c48b12  4183f909               cmp r9d, 9
0000000145c48b16  0f87b4feffff           ja 0x145c489d0
0000000145c48b1c  48ffc2                 inc rdx
0000000145c48b1f  4584c0                 test r8b, r8b
0000000145c48b22  74c9                   je 0x145c48aed
0000000145c48b24  e9a7feffff             jmp 0x145c489d0
