145b5b1f0: 4157 push r15
145b5b1f2: 4156 push r14
145b5b1f4: 4155 push r13
145b5b1f6: 4154 push r12
145b5b1f8: 56 push rsi
145b5b1f9: 57 push rdi
145b5b1fa: 55 push rbp
145b5b1fb: 53 push rbx
145b5b1fc: 4883ec28 sub rsp, 0x28
145b5b200: 488b7210 mov rsi, qword ptr [rdx + 0x10]
145b5b204: 4881fefdff0000 cmp rsi, 0xfffd
145b5b20b: 0f8758010000 ja 0x145b5b369
145b5b211: 8d6e02 lea ebp, [rsi + 2]
145b5b214: 66c1c508 rol bp, 8
145b5b218: 4189ee mov r14d, ebp
145b5b21b: 41c1ee08 shr r14d, 8
145b5b21f: 440fb77a18 movzx r15d, word ptr [rdx + 0x18]
145b5b224: 4589fc mov r12d, r15d
145b5b227: 41c1ec08 shr r12d, 8
145b5b22b: 80793001 cmp byte ptr [rcx + 0x30], 1
145b5b22f: 0f85c3000000 jne 0x145b5b2f8
145b5b235: 0fb64159 movzx eax, byte ptr [rcx + 0x59]
145b5b239: 4883f827 cmp rax, 0x27
145b5b23d: 0f87a5010000 ja 0x145b5b3e8
145b5b243: 40326c0131 xor bpl, byte ptr [rcx + rax + 0x31]
145b5b248: 4002695a add bpl, byte ptr [rcx + 0x5a]
145b5b24c: ffc0 inc eax
145b5b24e: 4531c9 xor r9d, r9d
145b5b251: 3c28 cmp al, 0x28
145b5b253: 440fb6d0 movzx r10d, al
145b5b257: 450f44d1 cmove r10d, r9d
145b5b25b: 44885159 mov byte ptr [rcx + 0x59], r10b
145b5b25f: 4088695a mov byte ptr [rcx + 0x5a], bpl
145b5b263: b828000000 mov eax, 0x28
145b5b268: 4180fa27 cmp r10b, 0x27
145b5b26c: 0f8776010000 ja 0x145b5b3e8
145b5b272: 450fb6da movzx r11d, r10b
145b5b276: 4632741931 xor r14b, byte ptr [rcx + r11 + 0x31]
145b5b27b: 4100ee add r14b, bpl
145b5b27e: 41fec2 inc r10b
145b5b281: 4180fa28 cmp r10b, 0x28
145b5b285: 450fb6d2 movzx r10d, r10b
145b5b289: 450f44d1 cmove r10d, r9d
145b5b28d: 44885159 mov byte ptr [rcx + 0x59], r10b
145b5b291: 4488715a mov byte ptr [rcx + 0x5a], r14b
145b5b295: 4180fa27 cmp r10b, 0x27
145b5b299: 0f8749010000 ja 0x145b5b3e8
145b5b29f: 450fb6ca movzx r9d, r10b
145b5b2a3: 460fb64c0931 movzx r9d, byte ptr [rcx + r9 + 0x31]
145b5b2a9: 4530f9 xor r9b, r15b
145b5b2ac: 4589cf mov r15d, r9d
145b5b2af: 4500f7 add r15b, r14b
145b5b2b2: 41fec2 inc r10b
145b5b2b5: 4531c9 xor r9d, r9d
145b5b2b8: 4180fa28 cmp r10b, 0x28
145b5b2bc: 450fb6d2 movzx r10d, r10b
145b5b2c0: 450f44d1 cmove r10d, r9d
145b5b2c4: 44885159 mov byte ptr [rcx + 0x59], r10b
145b5b2c8: 4488795a mov byte ptr [rcx + 0x5a], r15b
145b5b2cc: 4180fa28 cmp r10b, 0x28
145b5b2d0: 0f8312010000 jae 0x145b5b3e8
145b5b2d6: 410fb6c2 movzx eax, r10b
145b5b2da: 4432640131 xor r12b, byte ptr [rcx + rax + 0x31]
145b5b2df: 4500fc add r12b, r15b
145b5b2e2: 41fec2 inc r10b
145b5b2e5: 4180fa28 cmp r10b, 0x28
145b5b2e9: 410fb6c2 movzx eax, r10b
145b5b2ed: 410f44c1 cmove eax, r9d
145b5b2f1: 884159 mov byte ptr [rcx + 0x59], al
145b5b2f4: 4488615a mov byte ptr [rcx + 0x5a], r12b
145b5b2f8: 498b00 mov rax, qword ptr [r8]
145b5b2fb: 498b7810 mov rdi, qword ptr [r8 + 0x10]
145b5b2ff: 4889c1 mov rcx, rax
145b5b302: 4829f9 sub rcx, rdi
145b5b305: 4883f903 cmp rcx, 3
145b5b309: 766f jbe 0x145b5b37a
145b5b30b: 498b4808 mov rcx, qword ptr [r8 + 8]
145b5b30f: 450fb6cc movzx r9d, r12b
145b5b313: 41c1e118 shl r9d, 0x18
145b5b317: 450fb6d7 movzx r10d, r15b
145b5b31b: 41c1e210 shl r10d, 0x10
145b5b31f: 4509ca or r10d, r9d
145b5b322: 450fb6ce movzx r9d, r14b
145b5b326: 41c1e108 shl r9d, 8
145b5b32a: 4509d1 or r9d, r10d
145b5b32d: 440fb6d5 movzx r10d, bpl
145b5b331: 4509ca or r10d, r9d
145b5b334: 44891439 mov dword ptr [rcx + rdi], r10d
145b5b338: 4883c704 add rdi, 4
145b5b33c: 49897810 mov qword ptr [r8 + 0x10], rdi
145b5b340: 488b5208 mov rdx, qword ptr [rdx + 8]
145b5b344: 4829f8 sub rax, rdi
145b5b347: 4839c6 cmp rsi, rax
145b5b34a: 7766 ja 0x145b5b3b2
145b5b34c: 4885f6 test rsi, rsi
145b5b34f: 7411 je 0x145b5b362
145b5b351: 4801f9 add rcx, rdi
145b5b354: 4c89c3 mov rbx, r8
145b5b357: 4989f0 mov r8, rsi
145b5b35a: e8fc894300 call 0x145f93d5b
145b5b35f: 4989d8 mov r8, rbx
145b5b362: 4801f7 add rdi, rsi
145b5b365: 49897810 mov qword ptr [r8 + 0x10], rdi
145b5b369: 4883c428 add rsp, 0x28
145b5b36d: 5b pop rbx
145b5b36e: 5d pop rbp
145b5b36f: 5f pop rdi
145b5b370: 5e pop rsi
145b5b371: 415c pop r12
145b5b373: 415d pop r13
145b5b375: 415e pop r14
145b5b377: 415f pop r15
145b5b379: c3 ret
145b5b37a: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145b5b383: 4c89c3 mov rbx, r8
145b5b386: 41b804000000 mov r8d, 4
145b5b38c: 41b901000000 mov r9d, 1
145b5b392: 4889d9 mov rcx, rbx
145b5b395: 4989d5 mov r13, rdx
145b5b398: 4889fa mov rdx, rdi
145b5b39b: e8d08d4300 call 0x145f94170
145b5b3a0: 4c89ea mov rdx, r13
145b5b3a3: 4989d8 mov r8, rbx
145b5b3a6: 488b03 mov rax, qword ptr [rbx]
145b5b3a9: 488b7b10 mov rdi, qword ptr [rbx + 0x10]
145b5b3ad: e959ffffff jmp 0x145b5b30b
145b5b3b2: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145b5b3bb: 41b901000000 mov r9d, 1
145b5b3c1: 4c89c1 mov rcx, r8
145b5b3c4: 4889d3 mov rbx, rdx
145b5b3c7: 4889fa mov rdx, rdi
145b5b3ca: 4c89c7 mov rdi, r8
145b5b3cd: 4989f0 mov r8, rsi
145b5b3d0: e89b8d4300 call 0x145f94170
145b5b3d5: 4889da mov rdx, rbx
145b5b3d8: 4989f8 mov r8, rdi
145b5b3db: 488b4f08 mov rcx, qword ptr [rdi + 8]
145b5b3df: 488b7f10 mov rdi, qword ptr [rdi + 0x10]
145b5b3e3: e969ffffff jmp 0x145b5b351
145b5b3e8: 4c8d058178a801 lea r8, [rip + 0x1a87881]
145b5b3ef: ba28000000 mov edx, 0x28
145b5b3f4: 4889c1 mov rcx, rax
145b5b3f7: e8d7fc5d00 call 0x14613b0d3
145b5b3fc: 0f0b ud2
