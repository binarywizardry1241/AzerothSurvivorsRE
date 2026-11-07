0x1459ebf30: 4156 push r14
0x1459ebf32: 56 push rsi
0x1459ebf33: 57 push rdi
0x1459ebf34: 53 push rbx
0x1459ebf35: 4889c8 mov rax, rcx
0x1459ebf38: 488b4a10 mov rcx, qword ptr [rdx + 0x10]
0x1459ebf3c: 4c8b02 mov r8, qword ptr [rdx]
0x1459ebf3f: 4c8b5208 mov r10, qword ptr [rdx + 8]
0x1459ebf43: 4c8b5a18 mov r11, qword ptr [rdx + 0x18]
0x1459ebf47: 4d89c1 mov r9, r8
0x1459ebf4a: 4d39da cmp r10, r11
0x1459ebf4d: 7463 je 0x1459ebfb2
0x1459ebf4f: 488b5220 mov rdx, qword ptr [rdx + 0x20]
0x1459ebf53: 4d89c1 mov r9, r8
0x1459ebf56: eb0d jmp 0x1459ebf65
0x1459ebf58: 0f1f840000000000 nop dword ptr [rax + rax]
0x1459ebf60: 4d39da cmp r10, r11
0x1459ebf63: 744d je 0x1459ebfb2
0x1459ebf65: 498b32 mov rsi, qword ptr [r10]
0x1459ebf68: 4983c208 add r10, 8
0x1459ebf6c: 488b5a08 mov rbx, qword ptr [rdx + 8]
0x1459ebf70: 48697a10d8010000 imul rdi, qword ptr [rdx + 0x10], 0x1d8
0x1459ebf78: 0f1f840000000000 nop dword ptr [rax + rax]
0x1459ebf80: 4885ff test rdi, rdi
0x1459ebf83: 74db je 0x1459ebf60
0x1459ebf85: 4989de mov r14, rbx
0x1459ebf88: 4881c3d8010000 add rbx, 0x1d8
0x1459ebf8f: 4881c728feffff add rdi, -0x1d8
0x1459ebf96: 4939b6f0000000 cmp qword ptr [r14 + 0xf0], rsi
0x1459ebf9d: 75e1 jne 0x1459ebf80
0x1459ebf9f: 41f686b000000001 test byte ptr [r14 + 0xb0], 1
0x1459ebfa7: 75d7 jne 0x1459ebf80
0x1459ebfa9: 498931 mov qword ptr [r9], rsi
0x1459ebfac: 4983c108 add r9, 8
0x1459ebfb0: ebae jmp 0x1459ebf60
0x1459ebfb2: 4d29c1 sub r9, r8
0x1459ebfb5: 49c1e903 shr r9, 3
0x1459ebfb9: 488908 mov qword ptr [rax], rcx
0x1459ebfbc: 4c894008 mov qword ptr [rax + 8], r8
0x1459ebfc0: 4c894810 mov qword ptr [rax + 0x10], r9
0x1459ebfc4: 5b pop rbx
0x1459ebfc5: 5f pop rdi
0x1459ebfc6: 5e pop rsi
0x1459ebfc7: 415e pop r14
0x1459ebfc9: c3 ret
