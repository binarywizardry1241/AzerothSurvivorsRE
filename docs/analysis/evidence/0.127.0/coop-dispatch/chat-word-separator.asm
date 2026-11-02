0000000145d003a0 4157                           push r15
0000000145d003a2 4156                           push r14
0000000145d003a4 4155                           push r13
0000000145d003a6 4154                           push r12
0000000145d003a8 56                             push rsi
0000000145d003a9 57                             push rdi
0000000145d003aa 55                             push rbp
0000000145d003ab 53                             push rbx
0000000145d003ac 50                             push rax
0000000145d003ad 0fb66939                       movzx ebp, byte ptr [rcx + 0x39]
0000000145d003b1 4c8b21                         mov r12, qword ptr [rcx]
0000000145d003b4 4c8b4908                       mov r9, qword ptr [rcx + 8]
0000000145d003b8 488b4110                       mov rax, qword ptr [rcx + 0x10]
0000000145d003bc 48890424                       mov qword ptr [rsp], rax
0000000145d003c0 4c8b5128                       mov r10, qword ptr [rcx + 0x28]
0000000145d003c4 440fb65938                     movzx r11d, byte ptr [rcx + 0x38]
0000000145d003c9 4c8b7120                       mov r14, qword ptr [rcx + 0x20]
0000000145d003cd 4c8b7930                       mov r15, qword ptr [rcx + 0x30]
0000000145d003d1 31c0                           xor eax, eax
0000000145d003d3 488b3526e89502                 mov rsi, qword ptr [rip + 0x295e826]
0000000145d003da 48bf003e000001000000           movabs rdi, 0x100003e00
0000000145d003e4 6666662e0f1f840000000000       nop word ptr cs:[rax + rax]
0000000145d003f0 40f6c501                       test bpl, 1
0000000145d003f4 0f85b6010000                   jne 0x145d005b0
0000000145d003fa 4c89e3                         mov rbx, r12
0000000145d003fd eb16                           jmp 0x145d00415
0000000145d003ff 90                             nop 
0000000145d00400 83fd20                         cmp ebp, 0x20
0000000145d00403 0f8277010000                   jb 0x145d00580
0000000145d00409 83c581                         add ebp, -0x7f
0000000145d0040c 83fd20                         cmp ebp, 0x20
0000000145d0040f 0f866b010000                   jbe 0x145d00580
0000000145d00415 4d89f4                         mov r12, r14
0000000145d00418 4c89fa                         mov rdx, r15
0000000145d0041b 4d39d6                         cmp r14, r10
0000000145d0041e 0f846f010000                   je 0x145d00593
0000000145d00424 4d8d742401                     lea r14, [r12 + 1]
0000000145d00429 4c897120                       mov qword ptr [rcx + 0x20], r14
0000000145d0042d 450fb62c24                     movzx r13d, byte ptr [r12]
0000000145d00432 410fb6ed                       movzx ebp, r13b
0000000145d00436 4084ed                         test bpl, bpl
0000000145d00439 0f8981000000                   jns 0x145d004c0
0000000145d0043f 4189ef                         mov r15d, ebp
0000000145d00442 4183e71f                       and r15d, 0x1f
0000000145d00446 4d8d742402                     lea r14, [r12 + 2]
0000000145d0044b 4c897120                       mov qword ptr [rcx + 0x20], r14
0000000145d0044f 450fb6442401                   movzx r8d, byte ptr [r12 + 1]
0000000145d00455 4183e03f                       and r8d, 0x3f
0000000145d00459 4080fddf                       cmp bpl, 0xdf
0000000145d0045d 7648                           jbe 0x145d004a7
0000000145d0045f 4d8d742403                     lea r14, [r12 + 3]
0000000145d00464 4c897120                       mov qword ptr [rcx + 0x20], r14
0000000145d00468 410fb66c2402                   movzx ebp, byte ptr [r12 + 2]
0000000145d0046e 41c1e006                       shl r8d, 6
0000000145d00472 83e53f                         and ebp, 0x3f
0000000145d00475 4409c5                         or ebp, r8d
0000000145d00478 4180fdf0                       cmp r13b, 0xf0
0000000145d0047c 7235                           jb 0x145d004b3
0000000145d0047e 4d8d742404                     lea r14, [r12 + 4]
0000000145d00483 4c897120                       mov qword ptr [rcx + 0x20], r14
0000000145d00487 450fb6442403                   movzx r8d, byte ptr [r12 + 3]
0000000145d0048d 4183e707                       and r15d, 7
0000000145d00491 41c1e712                       shl r15d, 0x12
0000000145d00495 c1e506                         shl ebp, 6
0000000145d00498 4183e03f                       and r8d, 0x3f
0000000145d0049c 4109e8                         or r8d, ebp
0000000145d0049f 4509f8                         or r8d, r15d
0000000145d004a2 4489c5                         mov ebp, r8d
0000000145d004a5 eb19                           jmp 0x145d004c0
0000000145d004a7 41c1e706                       shl r15d, 6
0000000145d004ab 4509c7                         or r15d, r8d
0000000145d004ae 4489fd                         mov ebp, r15d
0000000145d004b1 eb0d                           jmp 0x145d004c0
0000000145d004b3 41c1e70c                       shl r15d, 0xc
0000000145d004b7 4409fd                         or ebp, r15d
0000000145d004ba 660f1f440000                   nop word ptr [rax + rax]
0000000145d004c0 4d89f7                         mov r15, r14
0000000145d004c3 4d29e7                         sub r15, r12
0000000145d004c6 4901d7                         add r15, rdx
0000000145d004c9 4c897930                       mov qword ptr [rcx + 0x30], r15
0000000145d004cd 83fd20                         cmp ebp, 0x20
0000000145d004d0 770d                           ja 0x145d004df
0000000145d004d2 4189e8                         mov r8d, ebp
0000000145d004d5 4c0fa3c7                       bt rdi, r8
0000000145d004d9 0f82a1000000                   jb 0x145d00580
0000000145d004df 81fd85000000                   cmp ebp, 0x85
0000000145d004e5 0f8215ffffff                   jb 0x145d00400
0000000145d004eb 4189e8                         mov r8d, ebp
0000000145d004ee 41c1e808                       shr r8d, 8
0000000145d004f2 4183f81f                       cmp r8d, 0x1f
0000000145d004f6 7f28                           jg 0x145d00520
0000000145d004f8 4585c0                         test r8d, r8d
0000000145d004fb 7449                           je 0x145d00546
0000000145d004fd 4183f816                       cmp r8d, 0x16
0000000145d00501 0f8502ffffff                   jne 0x145d00409
0000000145d00507 81fd80160000                   cmp ebp, 0x1680
0000000145d0050d 410f94c0                       sete r8b
0000000145d00511 41f6c001                       test r8b, 1
0000000145d00515 0f84eefeffff                   je 0x145d00409
0000000145d0051b eb63                           jmp 0x145d00580
0000000145d0051d 0f1f00                         nop dword ptr [rax]
0000000145d00520 4183f820                       cmp r8d, 0x20
0000000145d00524 7435                           je 0x145d0055b
0000000145d00526 4183f830                       cmp r8d, 0x30
0000000145d0052a 0f85d9feffff                   jne 0x145d00409
0000000145d00530 81fd00300000                   cmp ebp, 0x3000
0000000145d00536 410f94c0                       sete r8b
0000000145d0053a 41f6c001                       test r8b, 1
0000000145d0053e 0f84c5feffff                   je 0x145d00409
0000000145d00544 eb3a                           jmp 0x145d00580
0000000145d00546 440fb6c5                       movzx r8d, bpl
0000000145d0054a 460fb60406                     movzx r8d, byte ptr [rsi + r8]
0000000145d0054f 41f6c001                       test r8b, 1
0000000145d00553 0f84b0feffff                   je 0x145d00409
0000000145d00559 eb25                           jmp 0x145d00580
0000000145d0055b 440fb6c5                       movzx r8d, bpl
0000000145d0055f 460fb60406                     movzx r8d, byte ptr [rsi + r8]
0000000145d00564 41d0e8                         shr r8b, 1
0000000145d00567 41f6c001                       test r8b, 1
0000000145d0056b 0f8498feffff                   je 0x145d00409
0000000145d00571 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145d00580 4c8939                         mov qword ptr [rcx], r15
0000000145d00583 31ed                           xor ebp, ebp
0000000145d00585 4d89fc                         mov r12, r15
0000000145d00588 4829da                         sub rdx, rbx
0000000145d0058b 0f845ffeffff                   je 0x145d003f0
0000000145d00591 eb1f                           jmp 0x145d005b2
0000000145d00593 c6413901                       mov byte ptr [rcx + 0x39], 1
0000000145d00597 40b501                         mov bpl, 1
0000000145d0059a 4989d7                         mov r15, rdx
0000000145d0059d 4d89e6                         mov r14, r12
0000000145d005a0 4989dc                         mov r12, rbx
0000000145d005a3 4c89ca                         mov rdx, r9
0000000145d005a6 4584db                         test r11b, r11b
0000000145d005a9 75dd                           jne 0x145d00588
0000000145d005ab 4939d9                         cmp r9, rbx
0000000145d005ae 75d8                           jne 0x145d00588
0000000145d005b0 eb07                           jmp 0x145d005b9
0000000145d005b2 488b0424                       mov rax, qword ptr [rsp]
0000000145d005b6 4801d8                         add rax, rbx
0000000145d005b9 4883c408                       add rsp, 8
0000000145d005bd 5b                             pop rbx
0000000145d005be 5d                             pop rbp
0000000145d005bf 5f                             pop rdi
0000000145d005c0 5e                             pop rsi
0000000145d005c1 415c                           pop r12
0000000145d005c3 415d                           pop r13
0000000145d005c5 415e                           pop r14
0000000145d005c7 415f                           pop r15
0000000145d005c9 c3                             ret 
