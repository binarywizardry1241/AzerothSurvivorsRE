0x1458a8710: 4157                     push r15
0x1458a8712: 4156                     push r14
0x1458a8714: 4154                     push r12
0x1458a8716: 56                       push rsi
0x1458a8717: 57                       push rdi
0x1458a8718: 55                       push rbp
0x1458a8719: 53                       push rbx
0x1458a871a: 4881ece0000000           sub rsp, 0xe0
0x1458a8721: 66440f7fa424d0000000     movdqa xmmword ptr [rsp + 0xd0], xmm12
0x1458a872b: 66440f7f9c24c0000000     movdqa xmmword ptr [rsp + 0xc0], xmm11
0x1458a8735: 66440f7f9424b0000000     movdqa xmmword ptr [rsp + 0xb0], xmm10
0x1458a873f: 66440f7f8c24a0000000     movdqa xmmword ptr [rsp + 0xa0], xmm9
0x1458a8749: 66440f7f842490000000     movdqa xmmword ptr [rsp + 0x90], xmm8
0x1458a8753: 660f7fbc2480000000       movdqa xmmword ptr [rsp + 0x80], xmm7
0x1458a875c: 660f7f742470             movdqa xmmword ptr [rsp + 0x70], xmm6
0x1458a8762: e8990a7efa               call 0x140089200
0x1458a8767: 4889c3                   mov rbx, rax
0x1458a876a: 4889d7                   mov rdi, rdx
0x1458a876d: 4889c1                   mov rcx, rax
0x1458a8770: 4883fa20                 cmp rdx, 0x20
0x1458a8774: 0f83d0000000             jae 0x1458a884a
0x1458a877a: 4889fa                   mov rdx, rdi
0x1458a877d: e80ece3200               call 0x145bd5590
0x1458a8782: 4889c6                   mov rsi, rax
0x1458a8785: 4885c0                   test rax, rax
0x1458a8788: 0f84d0000000             je 0x1458a885e
0x1458a878e: 4889d8                   mov rax, rbx
0x1458a8791: 4801f8                   add rax, rdi
0x1458a8794: 4889d9                   mov rcx, rbx
0x1458a8797: eb26                     jmp 0x1458a87bf
0x1458a8799: 4883c102                 add rcx, 2
0x1458a879d: 41c1e006                 shl r8d, 6
0x1458a87a1: 4509d0                   or r8d, r10d
0x1458a87a4: 4489c2                   mov edx, r8d
0x1458a87a7: 83fa20                   cmp edx, 0x20
0x1458a87aa: 7413                     je 0x1458a87bf
0x1458a87ac: 0f1f4000                 nop dword ptr [rax]
0x1458a87b0: 83e2df                   and edx, 0xffffffdf
0x1458a87b3: 83c2a5                   add edx, -0x5b
0x1458a87b6: 83fae6                   cmp edx, -0x1a
0x1458a87b9: 0f82d9000000             jb 0x1458a8898
0x1458a87bf: 4839c1                   cmp rcx, rax
0x1458a87c2: 0f849d000000             je 0x1458a8865
0x1458a87c8: 440fb609                 movzx r9d, byte ptr [rcx]
0x1458a87cc: 410fb6d1                 movzx edx, r9b
0x1458a87d0: 84d2                     test dl, dl
0x1458a87d2: 780c                     js 0x1458a87e0
0x1458a87d4: 48ffc1                   inc rcx
0x1458a87d7: 83fa20                   cmp edx, 0x20
0x1458a87da: 75d4                     jne 0x1458a87b0
0x1458a87dc: ebe1                     jmp 0x1458a87bf
0x1458a87de: 6690                     nop
0x1458a87e0: 4189d0                   mov r8d, edx
0x1458a87e3: 4183e01f                 and r8d, 0x1f
0x1458a87e7: 440fb65101               movzx r10d, byte ptr [rcx + 1]
0x1458a87ec: 4183e23f                 and r10d, 0x3f
0x1458a87f0: 80fadf                   cmp dl, 0xdf
0x1458a87f3: 76a4                     jbe 0x1458a8799
0x1458a87f5: 0fb65102                 movzx edx, byte ptr [rcx + 2]
0x1458a87f9: 41c1e206                 shl r10d, 6
0x1458a87fd: 83e23f                   and edx, 0x3f
0x1458a8800: 4409d2                   or edx, r10d
0x1458a8803: 4180f9f0                 cmp r9b, 0xf0
0x1458a8807: 7228                     jb 0x1458a8831
0x1458a8809: 440fb64903               movzx r9d, byte ptr [rcx + 3]
0x1458a880e: 4883c104                 add rcx, 4
0x1458a8812: 4183e007                 and r8d, 7
0x1458a8816: 41c1e012                 shl r8d, 0x12
0x1458a881a: c1e206                   shl edx, 6
0x1458a881d: 4183e13f                 and r9d, 0x3f
0x1458a8821: 4109d1                   or r9d, edx
0x1458a8824: 4509c1                   or r9d, r8d
0x1458a8827: 4489ca                   mov edx, r9d
0x1458a882a: 83fa20                   cmp edx, 0x20
0x1458a882d: 7581                     jne 0x1458a87b0
0x1458a882f: eb8e                     jmp 0x1458a87bf
0x1458a8831: 4883c103                 add rcx, 3
0x1458a8835: 41c1e00c                 shl r8d, 0xc
0x1458a8839: 4409c2                   or edx, r8d
0x1458a883c: 83fa20                   cmp edx, 0x20
0x1458a883f: 0f856bffffff             jne 0x1458a87b0
0x1458a8845: e975ffffff               jmp 0x1458a87bf
0x1458a884a: 4889fa                   mov rdx, rdi
0x1458a884d: e81ec73200               call 0x145bd4f70
0x1458a8852: 4889c6                   mov rsi, rax
0x1458a8855: 4885c0                   test rax, rax
0x1458a8858: 0f8530ffffff             jne 0x1458a878e
0x1458a885e: 31c0                     xor eax, eax
0x1458a8860: e9aa010000               jmp 0x1458a8a0f
0x1458a8865: 4883ff02                 cmp rdi, 2
0x1458a8869: 7634                     jbe 0x1458a889f
0x1458a886b: 4883ff10                 cmp rdi, 0x10
0x1458a886f: 7746                     ja 0x1458a88b7
0x1458a8871: 4889f8                   mov rax, rdi
0x1458a8874: 48ffc0                   inc rax
0x1458a8877: 4889d9                   mov rcx, rbx
0x1458a887a: 660f1f440000             nop word ptr [rax + rax]
0x1458a8880: 6681392020               cmp word ptr [rcx], 0x2020
0x1458a8885: 7429                     je 0x1458a88b0
0x1458a8887: 48ffc1                   inc rcx
0x1458a888a: 48ffc8                   dec rax
0x1458a888d: 4883f803                 cmp rax, 3
0x1458a8891: 73ed                     jae 0x1458a8880
0x1458a8893: e901010000               jmp 0x1458a8999
0x1458a8898: b003                     mov al, 3
0x1458a889a: e970010000               jmp 0x1458a8a0f
0x1458a889f: 0f85f4000000             jne 0x1458a8999
0x1458a88a5: 66813b2020               cmp word ptr [rbx], 0x2020
0x1458a88aa: 0f85e9000000             jne 0x1458a8999
0x1458a88b0: b005                     mov al, 5
0x1458a88b2: e958010000               jmp 0x1458a8a0f
0x1458a88b7: 48895c2428               mov qword ptr [rsp + 0x28], rbx
0x1458a88bc: 48897c2430               mov qword ptr [rsp + 0x30], rdi
0x1458a88c1: 488d0500313401           lea rax, [rip + 0x1343100]
0x1458a88c8: 4889442438               mov qword ptr [rsp + 0x38], rax
0x1458a88cd: 48c744244001000000       mov qword ptr [rsp + 0x40], 1
0x1458a88d6: 4883ff42                 cmp rdi, 0x42
0x1458a88da: 0f837b010000             jae 0x1458a8a5b
0x1458a88e0: 4531e4                   xor r12d, r12d
0x1458a88e3: 31ed                     xor ebp, ebp
0x1458a88e5: 498d442411               lea rax, [r12 + 0x11]
0x1458a88ea: 4839f8                   cmp rax, rdi
0x1458a88ed: 7375                     jae 0x1458a8964
0x1458a88ef: 4084ed                   test bpl, bpl
0x1458a88f2: 7570                     jne 0x1458a8964
0x1458a88f4: 660f6f35e4484f00         movdqa xmm6, xmmword ptr [rip + 0x4f48e4]
0x1458a88fc: 4c8d742428               lea r14, [rsp + 0x28]
0x1458a8901: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1458a8910: f3420f6f0423             movdqu xmm0, xmmword ptr [rbx + r12]
0x1458a8916: f3420f6f4c2301           movdqu xmm1, xmmword ptr [rbx + r12 + 1]
0x1458a891d: 660f74c6                 pcmpeqb xmm0, xmm6
0x1458a8921: 660f74ce                 pcmpeqb xmm1, xmm6
0x1458a8925: 660fdbc8                 pand xmm1, xmm0
0x1458a8929: 66440fd7c1               pmovmskb r8d, xmm1
0x1458a892e: 4585c0                   test r8d, r8d
0x1458a8931: 7517                     jne 0x1458a894a
0x1458a8933: 31ed                     xor ebp, ebp
0x1458a8935: 498d442421               lea rax, [r12 + 0x21]
0x1458a893a: 4839f8                   cmp rax, rdi
0x1458a893d: 7325                     jae 0x1458a8964
0x1458a893f: 4983c410                 add r12, 0x10
0x1458a8943: 4084ed                   test bpl, bpl
0x1458a8946: 74c8                     je 0x1458a8910
0x1458a8948: eb1a                     jmp 0x1458a8964
0x1458a894a: 4c89f1                   mov rcx, r14
0x1458a894d: 4c89e2                   mov rdx, r12
0x1458a8950: 4531c9                   xor r9d, r9d
0x1458a8953: e8e83c3500               call 0x145bfc640
0x1458a8958: 89c5                     mov ebp, eax
0x1458a895a: 498d442421               lea rax, [r12 + 0x21]
0x1458a895f: 4839f8                   cmp rax, rdi
0x1458a8962: 72db                     jb 0x1458a893f
0x1458a8964: f30f6f443bef             movdqu xmm0, xmmword ptr [rbx + rdi - 0x11]
0x1458a896a: f30f6f4c3bf0             movdqu xmm1, xmmword ptr [rbx + rdi - 0x10]
0x1458a8970: 660f6f1568484f00         movdqa xmm2, xmmword ptr [rip + 0x4f4868]
0x1458a8978: 660f74c2                 pcmpeqb xmm0, xmm2
0x1458a897c: 660f74ca                 pcmpeqb xmm1, xmm2
0x1458a8980: 660fdbc8                 pand xmm1, xmm0
0x1458a8984: 66440fd7c1               pmovmskb r8d, xmm1
0x1458a8989: 4585c0                   test r8d, r8d
0x1458a898c: 0f850f020000             jne 0x1458a8ba1
0x1458a8992: b005                     mov al, 5
0x1458a8994: 4084ed                   test bpl, bpl
0x1458a8997: 7576                     jne 0x1458a8a0f
0x1458a8999: 48895c2428               mov qword ptr [rsp + 0x28], rbx
0x1458a899e: 48897c2430               mov qword ptr [rsp + 0x30], rdi
0x1458a89a3: 48c744243800000000       mov qword ptr [rsp + 0x38], 0
0x1458a89ac: 48897c2440               mov qword ptr [rsp + 0x40], rdi
0x1458a89b1: 48b82000000020000000     movabs rax, 0x2000000020
0x1458a89bb: 4889442448               mov qword ptr [rsp + 0x48], rax
0x1458a89c0: c644245001               mov byte ptr [rsp + 0x50], 1
0x1458a89c5: 49c7c6ffffffff           mov r14, 0xffffffffffffffff
0x1458a89cc: 488d7c2458               lea rdi, [rsp + 0x58]
0x1458a89d1: 488d5c2428               lea rbx, [rsp + 0x28]
0x1458a89d6: 662e0f1f840000000000     nop word ptr cs:[rax + rax]
0x1458a89e0: 4889f9                   mov rcx, rdi
0x1458a89e3: 4889da                   mov rdx, rbx
0x1458a89e6: e8c5210000               call 0x1458aabb0
0x1458a89eb: 49ffc6                   inc r14
0x1458a89ee: 807c245800               cmp byte ptr [rsp + 0x58], 0
0x1458a89f3: 75eb                     jne 0x1458a89e0
0x1458a89f5: b004                     mov al, 4
0x1458a89f7: 4983fe01                 cmp r14, 1
0x1458a89fb: 7712                     ja 0x1458a8a0f
0x1458a89fd: b001                     mov al, 1
0x1458a89ff: 4883fe01                 cmp rsi, 1
0x1458a8a03: 740a                     je 0x1458a8a0f
0x1458a8a05: 31c0                     xor eax, eax
0x1458a8a07: 4883fe15                 cmp rsi, 0x15
0x1458a8a0b: 19c0                     sbb eax, eax
0x1458a8a0d: 0c02                     or al, 2
0x1458a8a0f: 0f28742470               movaps xmm6, xmmword ptr [rsp + 0x70]
0x1458a8a14: 0f28bc2480000000         movaps xmm7, xmmword ptr [rsp + 0x80]
0x1458a8a1c: 440f28842490000000       movaps xmm8, xmmword ptr [rsp + 0x90]
0x1458a8a25: 440f288c24a0000000       movaps xmm9, xmmword ptr [rsp + 0xa0]
0x1458a8a2e: 440f289424b0000000       movaps xmm10, xmmword ptr [rsp + 0xb0]
0x1458a8a37: 440f289c24c0000000       movaps xmm11, xmmword ptr [rsp + 0xc0]
0x1458a8a40: 440f28a424d0000000       movaps xmm12, xmmword ptr [rsp + 0xd0]
0x1458a8a49: 4881c4e0000000           add rsp, 0xe0
0x1458a8a50: 5b                       pop rbx
0x1458a8a51: 5d                       pop rbp
0x1458a8a52: 5f                       pop rdi
0x1458a8a53: 5e                       pop rsi
0x1458a8a54: 415c                     pop r12
0x1458a8a56: 415e                     pop r14
0x1458a8a58: 415f                     pop r15
0x1458a8a5a: c3                       ret
0x1458a8a5b: 660f6f357d474f00         movdqa xmm6, xmmword ptr [rip + 0x4f477d]
0x1458a8a63: 4c8d742428               lea r14, [rsp + 0x28]
0x1458a8a68: 4531ff                   xor r15d, r15d
0x1458a8a6b: 0f1f440000               nop dword ptr [rax + rax]
0x1458a8a70: f3420f6f043b             movdqu xmm0, xmmword ptr [rbx + r15]
0x1458a8a76: f3420f6f4c3b01           movdqu xmm1, xmmword ptr [rbx + r15 + 1]
0x1458a8a7d: f3460f6f5c3b10           movdqu xmm11, xmmword ptr [rbx + r15 + 0x10]
0x1458a8a84: f3460f6f643b11           movdqu xmm12, xmmword ptr [rbx + r15 + 0x11]
0x1458a8a8b: 660f74c6                 pcmpeqb xmm0, xmm6
0x1458a8a8f: 660f74ce                 pcmpeqb xmm1, xmm6
0x1458a8a93: 660fdbc8                 pand xmm1, xmm0
0x1458a8a97: 66440fd7c1               pmovmskb r8d, xmm1
0x1458a8a9c: f3460f6f4c3b20           movdqu xmm9, xmmword ptr [rbx + r15 + 0x20]
0x1458a8aa3: f3460f6f543b21           movdqu xmm10, xmmword ptr [rbx + r15 + 0x21]
0x1458a8aaa: f3420f6f7c3b30           movdqu xmm7, xmmword ptr [rbx + r15 + 0x30]
0x1458a8ab1: f3460f6f443b31           movdqu xmm8, xmmword ptr [rbx + r15 + 0x31]
0x1458a8ab8: 4585c0                   test r8d, r8d
0x1458a8abb: 7574                     jne 0x1458a8b31
0x1458a8abd: 31ed                     xor ebp, ebp
0x1458a8abf: 66440f74de               pcmpeqb xmm11, xmm6
0x1458a8ac4: 66440f74e6               pcmpeqb xmm12, xmm6
0x1458a8ac9: 66450fdbe3               pand xmm12, xmm11
0x1458a8ace: 66450fd7c4               pmovmskb r8d, xmm12
0x1458a8ad3: 664585c0                 test r8w, r8w
0x1458a8ad7: 756d                     jne 0x1458a8b46
0x1458a8ad9: 66440f74ce               pcmpeqb xmm9, xmm6
0x1458a8ade: 66440f74d6               pcmpeqb xmm10, xmm6
0x1458a8ae3: 66450fdbd1               pand xmm10, xmm9
0x1458a8ae8: 66450fd7c2               pmovmskb r8d, xmm10
0x1458a8aed: 664585c0                 test r8w, r8w
0x1458a8af1: 756c                     jne 0x1458a8b5f
0x1458a8af3: 660f74fe                 pcmpeqb xmm7, xmm6
0x1458a8af7: 66440f74c6               pcmpeqb xmm8, xmm6
0x1458a8afc: 66440fdbc7               pand xmm8, xmm7
0x1458a8b01: 66450fd7c0               pmovmskb r8d, xmm8
0x1458a8b06: 664585c0                 test r8w, r8w
0x1458a8b0a: 756c                     jne 0x1458a8b78
0x1458a8b0c: 4d8d6740                 lea r12, [r15 + 0x40]
0x1458a8b10: 4981c781000000           add r15, 0x81
0x1458a8b17: 4939ff                   cmp r15, rdi
0x1458a8b1a: 0f83c5fdffff             jae 0x1458a88e5
0x1458a8b20: 4d89e7                   mov r15, r12
0x1458a8b23: 4084ed                   test bpl, bpl
0x1458a8b26: 0f8444ffffff             je 0x1458a8a70
0x1458a8b2c: e9b4fdffff               jmp 0x1458a88e5
0x1458a8b31: 4c89f1                   mov rcx, r14
0x1458a8b34: 4c89fa                   mov rdx, r15
0x1458a8b37: 4531c9                   xor r9d, r9d
0x1458a8b3a: e8013b3500               call 0x145bfc640
0x1458a8b3f: 89c5                     mov ebp, eax
0x1458a8b41: e979ffffff               jmp 0x1458a8abf
0x1458a8b46: 498d5710                 lea rdx, [r15 + 0x10]
0x1458a8b4a: 4c89f1                   mov rcx, r14
0x1458a8b4d: 4189e9                   mov r9d, ebp
0x1458a8b50: e8eb3a3500               call 0x145bfc640
0x1458a8b55: 4008e8                   or al, bpl
0x1458a8b58: 89c5                     mov ebp, eax
0x1458a8b5a: e97affffff               jmp 0x1458a8ad9
0x1458a8b5f: 498d5720                 lea rdx, [r15 + 0x20]
0x1458a8b63: 4c89f1                   mov rcx, r14
0x1458a8b66: 4189e9                   mov r9d, ebp
0x1458a8b69: e8d23a3500               call 0x145bfc640
0x1458a8b6e: 4008e8                   or al, bpl
0x1458a8b71: 89c5                     mov ebp, eax
0x1458a8b73: e97bffffff               jmp 0x1458a8af3
0x1458a8b78: 498d5730                 lea rdx, [r15 + 0x30]
0x1458a8b7c: 4c89f1                   mov rcx, r14
0x1458a8b7f: 4189e9                   mov r9d, ebp
0x1458a8b82: e8b93a3500               call 0x145bfc640
0x1458a8b87: 4008e8                   or al, bpl
0x1458a8b8a: 89c5                     mov ebp, eax
0x1458a8b8c: 4d8d6740                 lea r12, [r15 + 0x40]
0x1458a8b90: 4981c781000000           add r15, 0x81
0x1458a8b97: 4939ff                   cmp r15, rdi
0x1458a8b9a: 7284                     jb 0x1458a8b20
0x1458a8b9c: e944fdffff               jmp 0x1458a88e5
0x1458a8ba1: 4889fa                   mov rdx, rdi
0x1458a8ba4: 4883c2ef                 add rdx, -0x11
0x1458a8ba8: 488d4c2428               lea rcx, [rsp + 0x28]
0x1458a8bad: 4189e9                   mov r9d, ebp
0x1458a8bb0: e88b3a3500               call 0x145bfc640
0x1458a8bb5: 4008e8                   or al, bpl
0x1458a8bb8: 89c5                     mov ebp, eax
0x1458a8bba: b005                     mov al, 5
0x1458a8bbc: 4084ed                   test bpl, bpl
0x1458a8bbf: 0f84d4fdffff             je 0x1458a8999
0x1458a8bc5: e945feffff               jmp 0x1458a8a0f
