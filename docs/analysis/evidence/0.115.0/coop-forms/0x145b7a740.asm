0x145b7a740: push rbp
0x145b7a741: push r15
0x145b7a743: push r14
0x145b7a745: push rsi
0x145b7a746: push rdi
0x145b7a747: push rbx
0x145b7a748: sub rsp, 0x48
0x145b7a74c: lea rbp, [rsp + 0x40]
0x145b7a751: mov qword ptr [rbp], 0xfffffffffffffffe
0x145b7a759: mov rdi, rdx
0x145b7a75c: mov rsi, rcx
0x145b7a75f: mov qword ptr [rbp - 0x18], 0
0x145b7a767: mov qword ptr [rbp - 0x10], 1
0x145b7a76f: mov rax, qword ptr [rdx]
0x145b7a772: movabs rcx, 0x8000000000000000
0x145b7a77c: xor rcx, rax
0x145b7a77f: test rax, rax
0x145b7a782: mov eax, 2
0x145b7a787: cmovs rax, rcx
0x145b7a78b: mov qword ptr [rbp - 8], 0
0x145b7a793: lea rcx, [rip + 0x1832bf6]
0x145b7a79a: movsxd rax, dword ptr [rcx + rax*4]
0x145b7a79e: add rax, rcx
0x145b7a7a1: jmp rax
0x145b7a7a3: lea rcx, [rbp - 0x18]
0x145b7a7a7: call 0x145eb6ec0
0x145b7a7ac: nop
0x145b7a7ad: mov rax, qword ptr [rbp - 0x10]
0x145b7a7b1: mov byte ptr [rax], 1
0x145b7a7b4: mov qword ptr [rbp - 8], 1
0x145b7a7bc: mov r14d, dword ptr [rdi + 0x38]
0x145b7a7c0: mov rax, qword ptr [rbp - 0x18]
0x145b7a7c4: dec rax
0x145b7a7c7: mov ebx, 1
0x145b7a7cc: cmp rax, 3
0x145b7a7d0: jbe 0x145b7adb6
0x145b7a7d6: mov rax, qword ptr [rbp - 0x10]
0x145b7a7da: mov dword ptr [rax + rbx], r14d
0x145b7a7de: add rbx, 4
0x145b7a7e2: mov qword ptr [rbp - 8], rbx
0x145b7a7e6: mov r15, qword ptr [rdi + 0x10]
0x145b7a7ea: mov r14, qword ptr [rdi + 0x18]
0x145b7a7ee: mov rax, qword ptr [rbp - 0x18]
0x145b7a7f2: mov rcx, rax
0x145b7a7f5: sub rcx, rbx
0x145b7a7f8: cmp rcx, 3
0x145b7a7fc: jbe 0x145b7add4
0x145b7a802: mov rcx, qword ptr [rbp - 0x10]
0x145b7a806: mov dword ptr [rcx + rbx], r14d
0x145b7a80a: add rbx, 4
0x145b7a80e: mov qword ptr [rbp - 8], rbx
0x145b7a812: sub rax, rbx
0x145b7a815: cmp r14, rax
0x145b7a818: ja 0x145b7ae30
0x145b7a81e: test r14, r14
0x145b7a821: je 0x145b7a831
0x145b7a823: add rcx, rbx
0x145b7a826: mov rdx, r15
0x145b7a829: mov r8, r14
0x145b7a82c: call 0x145d145fb
0x145b7a831: add rbx, r14
0x145b7a834: mov qword ptr [rbp - 8], rbx
0x145b7a838: mov r15, qword ptr [rdi + 0x28]
0x145b7a83c: mov r14, qword ptr [rdi + 0x30]
0x145b7a840: mov rax, qword ptr [rbp - 0x18]
0x145b7a844: mov rcx, rax
0x145b7a847: sub rcx, rbx
0x145b7a84a: cmp rcx, 3
0x145b7a84e: jbe 0x145b7ae6d
0x145b7a854: mov rcx, qword ptr [rbp - 0x10]
0x145b7a858: mov dword ptr [rcx + rbx], r14d
0x145b7a85c: add rbx, 4
0x145b7a860: mov qword ptr [rbp - 8], rbx
0x145b7a864: sub rax, rbx
0x145b7a867: cmp r14, rax
0x145b7a86a: ja 0x145b7aeaa
0x145b7a870: test r14, r14
0x145b7a873: je 0x145b7a883
0x145b7a875: add rcx, rbx
0x145b7a878: mov rdx, r15
0x145b7a87b: mov r8, r14
0x145b7a87e: call 0x145d145fb
0x145b7a883: add rbx, r14
0x145b7a886: mov qword ptr [rbp - 8], rbx
0x145b7a88a: movzx edi, byte ptr [rdi + 0x3c]
0x145b7a88e: cmp rbx, qword ptr [rbp - 0x18]
0x145b7a892: jne 0x145b7a89e
0x145b7a894: lea rcx, [rbp - 0x18]
0x145b7a898: call 0x145eb6ec0
0x145b7a89d: nop
0x145b7a89e: mov rax, qword ptr [rbp - 0x10]
0x145b7a8a2: mov byte ptr [rax + rbx], dil
0x145b7a8a6: inc rbx
0x145b7a8a9: jmp 0x145b7acb7
0x145b7a8ae: lea rcx, [rbp - 0x18]
0x145b7a8b2: call 0x145eb6ec0
0x145b7a8b7: nop
0x145b7a8b8: mov rax, qword ptr [rbp - 0x10]
0x145b7a8bc: mov byte ptr [rax], 5
0x145b7a8bf: mov qword ptr [rbp - 8], 1
0x145b7a8c7: mov r15, qword ptr [rdi + 0x10]
0x145b7a8cb: mov r14, qword ptr [rdi + 0x18]
0x145b7a8cf: mov rax, qword ptr [rbp - 0x18]
0x145b7a8d3: lea rcx, [rax - 1]
0x145b7a8d7: mov ebx, 1
0x145b7a8dc: cmp rcx, 3
0x145b7a8e0: jbe 0x145b7acda
0x145b7a8e6: mov rcx, qword ptr [rbp - 0x10]
0x145b7a8ea: mov dword ptr [rcx + rbx], r14d
0x145b7a8ee: add rbx, 4
0x145b7a8f2: mov qword ptr [rbp - 8], rbx
0x145b7a8f6: sub rax, rbx
0x145b7a8f9: cmp r14, rax
0x145b7a8fc: ja 0x145b7ad1a
0x145b7a902: test r14, r14
0x145b7a905: je 0x145b7a915
0x145b7a907: add rcx, rbx
0x145b7a90a: mov rdx, r15
0x145b7a90d: mov r8, r14
0x145b7a910: call 0x145d145fb
0x145b7a915: add rbx, r14
0x145b7a918: mov qword ptr [rbp - 8], rbx
0x145b7a91c: mov r14, qword ptr [rdi + 0x28]
0x145b7a920: mov rdi, qword ptr [rdi + 0x30]
0x145b7a924: mov rax, qword ptr [rbp - 0x18]
0x145b7a928: mov rcx, rax
0x145b7a92b: sub rcx, rbx
0x145b7a92e: cmp rcx, 3
0x145b7a932: jbe 0x145b7ad79
0x145b7a938: mov rcx, qword ptr [rbp - 0x10]
0x145b7a93c: mov dword ptr [rcx + rbx], edi
0x145b7a93f: add rbx, 4
0x145b7a943: mov qword ptr [rbp - 8], rbx
0x145b7a947: sub rax, rbx
0x145b7a94a: cmp rdi, rax
0x145b7a94d: jbe 0x145b7ac1b
0x145b7a953: lea rcx, [rbp - 0x18]
0x145b7a957: mov rdx, rbx
0x145b7a95a: mov r8, rdi
0x145b7a95d: call 0x145e9e020
0x145b7a962: nop
0x145b7a963: jmp 0x145b7ae9d
0x145b7a968: lea rcx, [rbp - 0x18]
0x145b7a96c: call 0x145eb6ec0
0x145b7a971: nop
0x145b7a972: mov rax, qword ptr [rbp - 0x10]
0x145b7a976: mov byte ptr [rax], 0xa
0x145b7a979: mov qword ptr [rbp - 8], 1
0x145b7a981: mov r14, qword ptr [rdi + 0x20]
0x145b7a985: mov rax, qword ptr [rbp - 0x18]
0x145b7a989: dec rax
0x145b7a98c: mov ebx, 1
0x145b7a991: cmp rax, 7
0x145b7a995: jbe 0x145b7acfc
0x145b7a99b: mov rax, qword ptr [rbp - 0x10]
0x145b7a99f: mov qword ptr [rax + rbx], r14
0x145b7a9a3: add rbx, 8
0x145b7a9a7: mov qword ptr [rbp - 8], rbx
0x145b7a9ab: mov r14, qword ptr [rdi + 0x10]
0x145b7a9af: mov rdi, qword ptr [rdi + 0x18]
0x145b7a9b3: mov rax, qword ptr [rbp - 0x18]
0x145b7a9b7: mov rcx, rax
0x145b7a9ba: sub rcx, rbx
0x145b7a9bd: cmp rcx, 3
0x145b7a9c1: jbe 0x145b7ad59
0x145b7a9c7: mov rcx, qword ptr [rbp - 0x10]
0x145b7a9cb: mov dword ptr [rcx + rbx], edi
0x145b7a9ce: add rbx, 4
0x145b7a9d2: mov qword ptr [rbp - 8], rbx
0x145b7a9d6: sub rax, rbx
0x145b7a9d9: cmp rdi, rax
0x145b7a9dc: jbe 0x145b7ac1b
0x145b7a9e2: lea rcx, [rbp - 0x18]
0x145b7a9e6: mov rdx, rbx
0x145b7a9e9: mov r8, rdi
0x145b7a9ec: call 0x145e9e020
0x145b7a9f1: nop
0x145b7a9f2: jmp 0x145b7ae9d
0x145b7a9f7: lea rcx, [rbp - 0x18]
0x145b7a9fb: call 0x145eb6ec0
0x145b7aa00: nop
0x145b7aa01: mov rax, qword ptr [rbp - 0x10]
0x145b7aa05: mov byte ptr [rax], 3
0x145b7aa08: mov qword ptr [rbp - 8], 1
0x145b7aa10: mov r15, qword ptr [rdi + 8]
0x145b7aa14: mov r14, qword ptr [rdi + 0x10]
0x145b7aa18: mov rax, qword ptr [rbp - 0x18]
0x145b7aa1c: lea rcx, [rax - 1]
0x145b7aa20: mov ebx, 1
0x145b7aa25: cmp rcx, 3
0x145b7aa29: jbe 0x145b7ad37
0x145b7aa2f: mov rcx, qword ptr [rbp - 0x10]
0x145b7aa33: mov dword ptr [rcx + rbx], r14d
0x145b7aa37: add rbx, 4
0x145b7aa3b: mov qword ptr [rbp - 8], rbx
0x145b7aa3f: sub rax, rbx
0x145b7aa42: cmp r14, rax
0x145b7aa45: ja 0x145b7ad99
0x145b7aa4b: test r14, r14
0x145b7aa4e: je 0x145b7aa5e
0x145b7aa50: add rcx, rbx
0x145b7aa53: mov rdx, r15
0x145b7aa56: mov r8, r14
0x145b7aa59: call 0x145d145fb
0x145b7aa5e: add rbx, r14
0x145b7aa61: mov qword ptr [rbp - 8], rbx
0x145b7aa65: movzx r14d, byte ptr [rdi + 0x98]
0x145b7aa6d: cmp rbx, qword ptr [rbp - 0x18]
0x145b7aa71: jne 0x145b7aa7d
0x145b7aa73: lea rcx, [rbp - 0x18]
0x145b7aa77: call 0x145eb6ec0
0x145b7aa7c: nop
0x145b7aa7d: mov rax, qword ptr [rbp - 0x10]
0x145b7aa81: mov byte ptr [rax + rbx], r14b
0x145b7aa85: inc rbx
0x145b7aa88: mov qword ptr [rbp - 8], rbx
0x145b7aa8c: mov r15, qword ptr [rdi + 0x20]
0x145b7aa90: mov r14, qword ptr [rdi + 0x28]
0x145b7aa94: mov rax, qword ptr [rbp - 0x18]
0x145b7aa98: mov rcx, rax
0x145b7aa9b: sub rcx, rbx
0x145b7aa9e: cmp rcx, 3
0x145b7aaa2: jbe 0x145b7aec7
0x145b7aaa8: mov rcx, qword ptr [rbp - 0x10]
0x145b7aaac: mov dword ptr [rcx + rbx], r14d
0x145b7aab0: add rbx, 4
0x145b7aab4: mov qword ptr [rbp - 8], rbx
0x145b7aab8: sub rax, rbx
0x145b7aabb: cmp r14, rax
0x145b7aabe: ja 0x145b7aee7
0x145b7aac4: test r14, r14
0x145b7aac7: je 0x145b7aad7
0x145b7aac9: add rcx, rbx
0x145b7aacc: mov rdx, r15
0x145b7aacf: mov r8, r14
0x145b7aad2: call 0x145d145fb
0x145b7aad7: add rbx, r14
0x145b7aada: mov qword ptr [rbp - 8], rbx
0x145b7aade: mov r15, qword ptr [rdi + 0x38]
0x145b7aae2: mov r14, qword ptr [rdi + 0x40]
0x145b7aae6: mov rax, qword ptr [rbp - 0x18]
0x145b7aaea: mov rcx, rax
0x145b7aaed: sub rcx, rbx
0x145b7aaf0: cmp rcx, 3
0x145b7aaf4: jbe 0x145b7af04
0x145b7aafa: mov rcx, qword ptr [rbp - 0x10]
0x145b7aafe: mov dword ptr [rcx + rbx], r14d
0x145b7ab02: add rbx, 4
0x145b7ab06: mov qword ptr [rbp - 8], rbx
0x145b7ab0a: sub rax, rbx
0x145b7ab0d: cmp r14, rax
0x145b7ab10: ja 0x145b7af24
0x145b7ab16: test r14, r14
0x145b7ab19: je 0x145b7ab29
0x145b7ab1b: add rcx, rbx
0x145b7ab1e: mov rdx, r15
0x145b7ab21: mov r8, r14
0x145b7ab24: call 0x145d145fb
0x145b7ab29: add rdi, 0x48
0x145b7ab2d: add rbx, r14
0x145b7ab30: mov qword ptr [rbp - 8], rbx
0x145b7ab34: lea rdx, [rbp - 0x18]
0x145b7ab38: mov rcx, rdi
0x145b7ab3b: call 0x145b7a4f0
0x145b7ab40: nop
0x145b7ab41: jmp 0x145b7acbb
0x145b7ab46: lea rcx, [rbp - 0x18]
0x145b7ab4a: call 0x145eb6ec0
0x145b7ab4f: nop
0x145b7ab50: mov rax, qword ptr [rbp - 0x10]
0x145b7ab54: mov byte ptr [rax], 4
0x145b7ab57: mov qword ptr [rbp - 8], 1
0x145b7ab5f: add rdi, 8
0x145b7ab63: lea rdx, [rbp - 0x18]
0x145b7ab67: mov rcx, rdi
0x145b7ab6a: call 0x145b7a4f0
0x145b7ab6f: nop
0x145b7ab70: jmp 0x145b7acbb
0x145b7ab75: lea rcx, [rbp - 0x18]
0x145b7ab79: call 0x145eb6ec0
0x145b7ab7e: nop
0x145b7ab7f: mov rax, qword ptr [rbp - 0x10]
0x145b7ab83: mov byte ptr [rax], 8
0x145b7ab86: jmp 0x145b7acb2
0x145b7ab8b: lea rcx, [rbp - 0x18]
0x145b7ab8f: call 0x145eb6ec0
0x145b7ab94: nop
0x145b7ab95: mov rax, qword ptr [rbp - 0x10]
0x145b7ab99: mov byte ptr [rax], 2
0x145b7ab9c: jmp 0x145b7acb2
0x145b7aba1: lea rcx, [rbp - 0x18]
0x145b7aba5: call 0x145eb6ec0
0x145b7abaa: nop
0x145b7abab: mov rax, qword ptr [rbp - 0x10]
0x145b7abaf: mov byte ptr [rax], 6
0x145b7abb2: mov qword ptr [rbp - 8], 1
0x145b7abba: mov r14d, dword ptr [rdi + 0x20]
0x145b7abbe: mov rax, qword ptr [rbp - 0x18]
0x145b7abc2: dec rax
0x145b7abc5: mov ebx, 1
0x145b7abca: cmp rax, 3
0x145b7abce: jbe 0x145b7adf4
0x145b7abd4: mov rax, qword ptr [rbp - 0x10]
0x145b7abd8: mov dword ptr [rax + rbx], r14d
0x145b7abdc: add rbx, 4
0x145b7abe0: mov qword ptr [rbp - 8], rbx
0x145b7abe4: mov r14, qword ptr [rdi + 0x10]
0x145b7abe8: mov rdi, qword ptr [rdi + 0x18]
0x145b7abec: mov rax, qword ptr [rbp - 0x18]
0x145b7abf0: mov rcx, rax
0x145b7abf3: sub rcx, rbx
0x145b7abf6: cmp rcx, 3
0x145b7abfa: jbe 0x145b7ae4d
0x145b7ac00: mov rcx, qword ptr [rbp - 0x10]
0x145b7ac04: mov dword ptr [rcx + rbx], edi
0x145b7ac07: add rbx, 4
0x145b7ac0b: mov qword ptr [rbp - 8], rbx
0x145b7ac0f: sub rax, rbx
0x145b7ac12: cmp rdi, rax
0x145b7ac15: ja 0x145b7ae8d
0x145b7ac1b: test rdi, rdi
0x145b7ac1e: je 0x145b7ac2e
0x145b7ac20: add rcx, rbx
0x145b7ac23: mov rdx, r14
0x145b7ac26: mov r8, rdi
0x145b7ac29: call 0x145d145fb
0x145b7ac2e: add rbx, rdi
0x145b7ac31: jmp 0x145b7acb7
0x145b7ac36: lea rcx, [rbp - 0x18]
0x145b7ac3a: call 0x145eb6ec0
0x145b7ac3f: nop
0x145b7ac40: mov rax, qword ptr [rbp - 0x10]
0x145b7ac44: mov byte ptr [rax], 7
0x145b7ac47: mov qword ptr [rbp - 8], 1
0x145b7ac4f: mov edi, dword ptr [rdi + 8]
0x145b7ac52: mov rax, qword ptr [rbp - 0x18]
0x145b7ac56: dec rax
0x145b7ac59: mov ebx, 1
0x145b7ac5e: cmp rax, 3
0x145b7ac62: jbe 0x145b7ae12
0x145b7ac68: mov rax, qword ptr [rbp - 0x10]
0x145b7ac6c: mov dword ptr [rax + rbx], edi
0x145b7ac6f: add rbx, 4
0x145b7ac73: jmp 0x145b7acb7
0x145b7ac75: lea rcx, [rbp - 0x18]
0x145b7ac79: call 0x145eb6ec0
0x145b7ac7e: nop
0x145b7ac7f: mov rax, qword ptr [rbp - 0x10]
0x145b7ac83: mov byte ptr [rax], 0xb
0x145b7ac86: mov qword ptr [rbp - 8], 1
0x145b7ac8e: add rdi, 8
0x145b7ac92: lea rdx, [rbp - 0x18]
0x145b7ac96: mov rcx, rdi
0x145b7ac99: call 0x145b7a240
0x145b7ac9e: nop
0x145b7ac9f: jmp 0x145b7acbb
0x145b7aca1: lea rcx, [rbp - 0x18]
0x145b7aca5: call 0x145eb6ec0
0x145b7acaa: nop
0x145b7acab: mov rax, qword ptr [rbp - 0x10]
0x145b7acaf: mov byte ptr [rax], 9
0x145b7acb2: mov ebx, 1
0x145b7acb7: mov qword ptr [rbp - 8], rbx
0x145b7acbb: mov rax, qword ptr [rbp - 8]
0x145b7acbf: mov qword ptr [rsi + 0x10], rax
0x145b7acc3: movups xmm0, xmmword ptr [rbp - 0x18]
0x145b7acc7: movups xmmword ptr [rsi], xmm0
0x145b7acca: mov rax, rsi
0x145b7accd: add rsp, 0x48
0x145b7acd1: pop rbx
0x145b7acd2: pop rdi
0x145b7acd3: pop rsi
0x145b7acd4: pop r14
0x145b7acd6: pop r15
0x145b7acd8: pop rbp
0x145b7acd9: ret
0x145b7acda: lea rcx, [rbp - 0x18]
0x145b7acde: mov edx, 1
0x145b7ace3: mov r8d, 4
0x145b7ace9: call 0x145e9e020
0x145b7acee: nop
0x145b7acef: mov rax, qword ptr [rbp - 0x18]
0x145b7acf3: mov rbx, qword ptr [rbp - 8]
0x145b7acf7: jmp 0x145b7a8e6
0x145b7acfc: lea rcx, [rbp - 0x18]
0x145b7ad00: mov edx, 1
0x145b7ad05: mov r8d, 8
0x145b7ad0b: call 0x145e9e020
0x145b7ad10: nop
0x145b7ad11: mov rbx, qword ptr [rbp - 8]
0x145b7ad15: jmp 0x145b7a99b
0x145b7ad1a: lea rcx, [rbp - 0x18]
0x145b7ad1e: mov rdx, rbx
0x145b7ad21: mov r8, r14
0x145b7ad24: call 0x145e9e020
0x145b7ad29: nop
0x145b7ad2a: mov rcx, qword ptr [rbp - 0x10]
0x145b7ad2e: mov rbx, qword ptr [rbp - 8]
0x145b7ad32: jmp 0x145b7a907
0x145b7ad37: lea rcx, [rbp - 0x18]
0x145b7ad3b: mov edx, 1
0x145b7ad40: mov r8d, 4
0x145b7ad46: call 0x145e9e020
0x145b7ad4b: nop
0x145b7ad4c: mov rax, qword ptr [rbp - 0x18]
0x145b7ad50: mov rbx, qword ptr [rbp - 8]
0x145b7ad54: jmp 0x145b7aa2f
0x145b7ad59: lea rcx, [rbp - 0x18]
0x145b7ad5d: mov r8d, 4
0x145b7ad63: mov rdx, rbx
0x145b7ad66: call 0x145e9e020
0x145b7ad6b: nop
0x145b7ad6c: mov rax, qword ptr [rbp - 0x18]
0x145b7ad70: mov rbx, qword ptr [rbp - 8]
0x145b7ad74: jmp 0x145b7a9c7
0x145b7ad79: lea rcx, [rbp - 0x18]
0x145b7ad7d: mov r8d, 4
0x145b7ad83: mov rdx, rbx
0x145b7ad86: call 0x145e9e020
0x145b7ad8b: nop
0x145b7ad8c: mov rax, qword ptr [rbp - 0x18]
0x145b7ad90: mov rbx, qword ptr [rbp - 8]
0x145b7ad94: jmp 0x145b7a938
0x145b7ad99: lea rcx, [rbp - 0x18]
0x145b7ad9d: mov rdx, rbx
0x145b7ada0: mov r8, r14
0x145b7ada3: call 0x145e9e020
0x145b7ada8: nop
0x145b7ada9: mov rcx, qword ptr [rbp - 0x10]
0x145b7adad: mov rbx, qword ptr [rbp - 8]
0x145b7adb1: jmp 0x145b7aa50
0x145b7adb6: lea rcx, [rbp - 0x18]
0x145b7adba: mov edx, 1
0x145b7adbf: mov r8d, 4
0x145b7adc5: call 0x145e9e020
0x145b7adca: nop
0x145b7adcb: mov rbx, qword ptr [rbp - 8]
0x145b7adcf: jmp 0x145b7a7d6
0x145b7add4: lea rcx, [rbp - 0x18]
0x145b7add8: mov r8d, 4
0x145b7adde: mov rdx, rbx
0x145b7ade1: call 0x145e9e020
0x145b7ade6: nop
0x145b7ade7: mov rax, qword ptr [rbp - 0x18]
0x145b7adeb: mov rbx, qword ptr [rbp - 8]
0x145b7adef: jmp 0x145b7a802
0x145b7adf4: lea rcx, [rbp - 0x18]
0x145b7adf8: mov edx, 1
0x145b7adfd: mov r8d, 4
0x145b7ae03: call 0x145e9e020
0x145b7ae08: nop
0x145b7ae09: mov rbx, qword ptr [rbp - 8]
0x145b7ae0d: jmp 0x145b7abd4
0x145b7ae12: lea rcx, [rbp - 0x18]
0x145b7ae16: mov edx, 1
0x145b7ae1b: mov r8d, 4
0x145b7ae21: call 0x145e9e020
0x145b7ae26: nop
0x145b7ae27: mov rbx, qword ptr [rbp - 8]
0x145b7ae2b: jmp 0x145b7ac68
0x145b7ae30: lea rcx, [rbp - 0x18]
0x145b7ae34: mov rdx, rbx
0x145b7ae37: mov r8, r14
0x145b7ae3a: call 0x145e9e020
0x145b7ae3f: nop
0x145b7ae40: mov rcx, qword ptr [rbp - 0x10]
0x145b7ae44: mov rbx, qword ptr [rbp - 8]
0x145b7ae48: jmp 0x145b7a823
0x145b7ae4d: lea rcx, [rbp - 0x18]
0x145b7ae51: mov r8d, 4
0x145b7ae57: mov rdx, rbx
0x145b7ae5a: call 0x145e9e020
0x145b7ae5f: nop
0x145b7ae60: mov rax, qword ptr [rbp - 0x18]
0x145b7ae64: mov rbx, qword ptr [rbp - 8]
0x145b7ae68: jmp 0x145b7ac00
0x145b7ae6d: lea rcx, [rbp - 0x18]
0x145b7ae71: mov r8d, 4
0x145b7ae77: mov rdx, rbx
0x145b7ae7a: call 0x145e9e020
0x145b7ae7f: nop
0x145b7ae80: mov rax, qword ptr [rbp - 0x18]
0x145b7ae84: mov rbx, qword ptr [rbp - 8]
0x145b7ae88: jmp 0x145b7a854
0x145b7ae8d: lea rcx, [rbp - 0x18]
0x145b7ae91: mov rdx, rbx
0x145b7ae94: mov r8, rdi
0x145b7ae97: call 0x145e9e020
0x145b7ae9c: nop
0x145b7ae9d: mov rcx, qword ptr [rbp - 0x10]
0x145b7aea1: mov rbx, qword ptr [rbp - 8]
0x145b7aea5: jmp 0x145b7ac20
0x145b7aeaa: lea rcx, [rbp - 0x18]
0x145b7aeae: mov rdx, rbx
0x145b7aeb1: mov r8, r14
0x145b7aeb4: call 0x145e9e020
0x145b7aeb9: nop
0x145b7aeba: mov rcx, qword ptr [rbp - 0x10]
0x145b7aebe: mov rbx, qword ptr [rbp - 8]
0x145b7aec2: jmp 0x145b7a875
0x145b7aec7: lea rcx, [rbp - 0x18]
0x145b7aecb: mov r8d, 4
0x145b7aed1: mov rdx, rbx
0x145b7aed4: call 0x145e9e020
0x145b7aed9: nop
0x145b7aeda: mov rax, qword ptr [rbp - 0x18]
0x145b7aede: mov rbx, qword ptr [rbp - 8]
0x145b7aee2: jmp 0x145b7aaa8
0x145b7aee7: lea rcx, [rbp - 0x18]
0x145b7aeeb: mov rdx, rbx
0x145b7aeee: mov r8, r14
0x145b7aef1: call 0x145e9e020
0x145b7aef6: nop
0x145b7aef7: mov rcx, qword ptr [rbp - 0x10]
0x145b7aefb: mov rbx, qword ptr [rbp - 8]
0x145b7aeff: jmp 0x145b7aac9
0x145b7af04: lea rcx, [rbp - 0x18]
0x145b7af08: mov r8d, 4
0x145b7af0e: mov rdx, rbx
0x145b7af11: call 0x145e9e020
0x145b7af16: nop
0x145b7af17: mov rax, qword ptr [rbp - 0x18]
0x145b7af1b: mov rbx, qword ptr [rbp - 8]
0x145b7af1f: jmp 0x145b7aafa
0x145b7af24: lea rcx, [rbp - 0x18]
0x145b7af28: mov rdx, rbx
0x145b7af2b: mov r8, r14
0x145b7af2e: call 0x145e9e020
0x145b7af33: nop
0x145b7af34: mov rcx, qword ptr [rbp - 0x10]
0x145b7af38: mov rbx, qword ptr [rbp - 8]
0x145b7af3c: jmp 0x145b7ab1b
