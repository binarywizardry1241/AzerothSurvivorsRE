1459a79b0: 4157 push r15
1459a79b2: 4156 push r14
1459a79b4: 4155 push r13
1459a79b6: 4154 push r12
1459a79b8: 56 push rsi
1459a79b9: 57 push rdi
1459a79ba: 55 push rbp
1459a79bb: 53 push rbx
1459a79bc: 4881ecb8000000 sub rsp, 0xb8
1459a79c3: 48894c2420 mov qword ptr [rsp + 0x20], rcx
1459a79c8: 4d85c0 test r8, r8
1459a79cb: 0f8487010000 je 0x1459a7b58
1459a79d1: 4989d2 mov r10, rdx
1459a79d4: 4c89c8 mov rax, r9
1459a79d7: 4c09c0 or rax, r8
1459a79da: 48c1e820 shr rax, 0x20
1459a79de: 740a je 0x1459a79ea
1459a79e0: 4c89c8 mov rax, r9
1459a79e3: 31d2 xor edx, edx
1459a79e5: 49f7f0 div r8
1459a79e8: eb08 jmp 0x1459a79f2
1459a79ea: 4489c8 mov eax, r9d
1459a79ed: 31d2 xor edx, edx
1459a79ef: 41f7f0 div r8d
1459a79f2: 0f1005f7ca8901 movups xmm0, xmmword ptr [rip + 0x189caf7]
1459a79f9: 0f118424a8000000 movups xmmword ptr [rsp + 0xa8], xmm0
1459a7a01: 0f1005d8ca8901 movups xmm0, xmmword ptr [rip + 0x189cad8]
1459a7a08: 0f11842498000000 movups xmmword ptr [rsp + 0x98], xmm0
1459a7a10: 0f1005b9ca8901 movups xmm0, xmmword ptr [rip + 0x189cab9]
1459a7a17: 0f11842488000000 movups xmmword ptr [rsp + 0x88], xmm0
1459a7a1f: 0f10059aca8901 movups xmm0, xmmword ptr [rip + 0x189ca9a]
1459a7a26: 0f11442478 movups xmmword ptr [rsp + 0x78], xmm0
1459a7a2b: 0f10057eca8901 movups xmm0, xmmword ptr [rip + 0x189ca7e]
1459a7a32: 0f11442468 movups xmmword ptr [rsp + 0x68], xmm0
1459a7a37: 0f100562ca8901 movups xmm0, xmmword ptr [rip + 0x189ca62]
1459a7a3e: 0f11442458 movups xmmword ptr [rsp + 0x58], xmm0
1459a7a43: 0f100546ca8901 movups xmm0, xmmword ptr [rip + 0x189ca46]
1459a7a4a: 0f11442448 movups xmmword ptr [rsp + 0x48], xmm0
1459a7a4f: 0f10052aca8901 movups xmm0, xmmword ptr [rip + 0x189ca2a]
1459a7a56: 0f11442438 movups xmmword ptr [rsp + 0x38], xmm0
1459a7a5b: 4c8d742440 lea r14, [rsp + 0x40]
1459a7a60: 31ff xor edi, edi
1459a7a62: 4531ff xor r15d, r15d
1459a7a65: 4d89fc mov r12, r15
1459a7a68: 49c1e404 shl r12, 4
1459a7a6c: 4d01f4 add r12, r14
1459a7a6f: eb20 jmp 0x1459a7a91
1459a7a71: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459a7a80: 49ffc7 inc r15
1459a7a83: 4983c410 add r12, 0x10
1459a7a87: 4983ff08 cmp r15, 8
1459a7a8b: 0f84a5000000 je 0x1459a7b36
1459a7a91: 498b0c24 mov rcx, qword ptr [r12]
1459a7a95: 4801c1 add rcx, rax
1459a7a98: 4c39c1 cmp rcx, r8
1459a7a9b: 7de3 jge 0x1459a7a80
1459a7a9d: 4d8b6c24f8 mov r13, qword ptr [r12 - 8]
1459a7aa2: 4901d5 add r13, rdx
1459a7aa5: 4d39c5 cmp r13, r8
1459a7aa8: 7dd6 jge 0x1459a7a80
1459a7aaa: 4889ce mov rsi, rcx
1459a7aad: 4c09ee or rsi, r13
1459a7ab0: 78ce js 0x1459a7a80
1459a7ab2: 490fafc8 imul rcx, r8
1459a7ab6: 4c01e9 add rcx, r13
1459a7ab9: 4c89d3 mov rbx, r10
1459a7abc: 4c39d1 cmp rcx, r10
1459a7abf: 0f83a1000000 jae 0x1459a7b66
1459a7ac5: 4c8b542420 mov r10, qword ptr [rsp + 0x20]
1459a7aca: 450fb7244a movzx r12d, word ptr [r10 + rcx*2]
1459a7acf: 664139ec cmp r12w, bp
1459a7ad3: 400f93c6 setae sil
1459a7ad7: 4020fe and sil, dil
1459a7ada: 664183fcff cmp r12w, -1
1459a7adf: 410f94c5 sete r13b
1459a7ae3: 41ba01000000 mov r10d, 1
1459a7ae9: 490f45fa cmovne rdi, r10
1459a7aed: 4108f5 or r13b, sil
1459a7af0: 440f45e5 cmovne r12d, ebp
1459a7af4: 4c0f44d9 cmove r11, rcx
1459a7af8: 4489e5 mov ebp, r12d
1459a7afb: 4983ff07 cmp r15, 7
1459a7aff: 4d8d7f01 lea r15, [r15 + 1]
1459a7b03: 4989da mov r10, rbx
1459a7b06: 0f8559ffffff jne 0x1459a7a65
1459a7b0c: 4883ff01 cmp rdi, 1
1459a7b10: 752d jne 0x1459a7b3f
1459a7b12: 4d39d1 cmp r9, r10
1459a7b15: 7360 jae 0x1459a7b77
1459a7b17: 488b442420 mov rax, qword ptr [rsp + 0x20]
1459a7b1c: 420fb70448 movzx eax, word ptr [rax + r9*2]
1459a7b21: 6683f8ff cmp ax, -1
1459a7b25: 0f94c1 sete cl
1459a7b28: 664139c4 cmp r12w, ax
1459a7b2c: 0f92c0 setb al
1459a7b2f: 08c8 or al, cl
1459a7b31: 0fb6c0 movzx eax, al
1459a7b34: eb0b jmp 0x1459a7b41
1459a7b36: 4189ec mov r12d, ebp
1459a7b39: 4883ff01 cmp rdi, 1
1459a7b3d: 74d3 je 0x1459a7b12
1459a7b3f: 31c0 xor eax, eax
1459a7b41: 4c89da mov rdx, r11
1459a7b44: 4881c4b8000000 add rsp, 0xb8
1459a7b4b: 5b pop rbx
1459a7b4c: 5d pop rbp
1459a7b4d: 5f pop rdi
1459a7b4e: 5e pop rsi
1459a7b4f: 415c pop r12
1459a7b51: 415d pop r13
1459a7b53: 415e pop r14
1459a7b55: 415f pop r15
1459a7b57: c3 ret
1459a7b58: 488d0d09c98901 lea rcx, [rip + 0x189c909]
1459a7b5f: e8dccd3f00 call 0x145da4940
1459a7b64: 0f0b ud2
1459a7b66: 4c8d05abc98901 lea r8, [rip + 0x189c9ab]
1459a7b6d: 4889da mov rdx, rbx
1459a7b70: e8ceca3f00 call 0x145da4643
1459a7b75: 0f0b ud2
1459a7b77: 4c8d0582c98901 lea r8, [rip + 0x189c982]
1459a7b7e: 4c89c9 mov rcx, r9
1459a7b81: 4c89d2 mov rdx, r10
1459a7b84: e8baca3f00 call 0x145da4643
1459a7b89: 0f0b ud2
