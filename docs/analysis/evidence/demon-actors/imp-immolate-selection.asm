0x1459ebae0: 4157 push r15
0x1459ebae2: 4156 push r14
0x1459ebae4: 4154 push r12
0x1459ebae6: 56 push rsi
0x1459ebae7: 57 push rdi
0x1459ebae8: 53 push rbx
0x1459ebae9: 4889c8 mov rax, rcx
0x1459ebaec: 488b0a mov rcx, qword ptr [rdx]
0x1459ebaef: 4c8b4210 mov r8, qword ptr [rdx + 0x10]
0x1459ebaf3: 4c8b4a28 mov r9, qword ptr [rdx + 0x28]
0x1459ebaf7: 4889cb mov rbx, rcx
0x1459ebafa: 4d85c9 test r9, r9
0x1459ebafd: 0f84ce000000 je 0x1459ebbd1
0x1459ebb03: 4c8b5208 mov r10, qword ptr [rdx + 8]
0x1459ebb07: 4c8b5a18 mov r11, qword ptr [rdx + 0x18]
0x1459ebb0b: 4889cb mov rbx, rcx
0x1459ebb0e: 4d39da cmp r10, r11
0x1459ebb11: 0f84ba000000 je 0x1459ebbd1
0x1459ebb17: 488b5220 mov rdx, qword ptr [rdx + 0x20]
0x1459ebb1b: 4c8b7210 mov r14, qword ptr [rdx + 0x10]
0x1459ebb1f: 4889cb mov rbx, rcx
0x1459ebb22: 4d85f6 test r14, r14
0x1459ebb25: 0f84a6000000 je 0x1459ebbd1
0x1459ebb2b: 4889ce mov rsi, rcx
0x1459ebb2e: 4d85f6 test r14, r14
0x1459ebb31: 0f847f000000 je 0x1459ebbb6
0x1459ebb37: 660f1f840000000000 nop word ptr [rax + rax]
0x1459ebb40: 498b3a mov rdi, qword ptr [r10]
0x1459ebb43: 488b5a08 mov rbx, qword ptr [rdx + 8]
0x1459ebb47: 4d69f6d8010000 imul r14, r14, 0x1d8
0x1459ebb4e: 4901de add r14, rbx
0x1459ebb51: eb19 jmp 0x1459ebb6c
0x1459ebb53: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1459ebb60: 4881c3d8010000 add rbx, 0x1d8
0x1459ebb67: 4c39f3 cmp rbx, r14
0x1459ebb6a: 744a je 0x1459ebbb6
0x1459ebb6c: 4839bbf0000000 cmp qword ptr [rbx + 0xf0], rdi
0x1459ebb73: 75eb jne 0x1459ebb60
0x1459ebb75: 4c8b7b08 mov r15, qword ptr [rbx + 8]
0x1459ebb79: 4c8b6310 mov r12, qword ptr [rbx + 0x10]
0x1459ebb7d: 49c1e404 shl r12, 4
0x1459ebb81: 4f8d2464 lea r12, [r12 + r12*2]
0x1459ebb85: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1459ebb90: 4d85e4 test r12, r12
0x1459ebb93: 74cb je 0x1459ebb60
0x1459ebb95: 4983c4d0 add r12, -0x30
0x1459ebb99: 41817f105c010000 cmp dword ptr [r15 + 0x10], 0x15c
0x1459ebba1: 4d8d7f30 lea r15, [r15 + 0x30]
0x1459ebba5: 75e9 jne 0x1459ebb90
0x1459ebba7: 488d5e08 lea rbx, [rsi + 8]
0x1459ebbab: 48893e mov qword ptr [rsi], rdi
0x1459ebbae: 4889de mov rsi, rbx
0x1459ebbb1: 49ffc9 dec r9
0x1459ebbb4: 741b je 0x1459ebbd1
0x1459ebbb6: 4983c208 add r10, 8
0x1459ebbba: 4d39da cmp r10, r11
0x1459ebbbd: 740f je 0x1459ebbce
0x1459ebbbf: 4c8b7210 mov r14, qword ptr [rdx + 0x10]
0x1459ebbc3: 4d85f6 test r14, r14
0x1459ebbc6: 0f8574ffffff jne 0x1459ebb40
0x1459ebbcc: ebe8 jmp 0x1459ebbb6
0x1459ebbce: 4889f3 mov rbx, rsi
0x1459ebbd1: 4829cb sub rbx, rcx
0x1459ebbd4: 48c1eb03 shr rbx, 3
0x1459ebbd8: 4c8900 mov qword ptr [rax], r8
0x1459ebbdb: 48894808 mov qword ptr [rax + 8], rcx
0x1459ebbdf: 48895810 mov qword ptr [rax + 0x10], rbx
0x1459ebbe3: 5b pop rbx
0x1459ebbe4: 5f pop rdi
0x1459ebbe5: 5e pop rsi
0x1459ebbe6: 415c pop r12
0x1459ebbe8: 415e pop r14
0x1459ebbea: 415f pop r15
0x1459ebbec: c3 ret
