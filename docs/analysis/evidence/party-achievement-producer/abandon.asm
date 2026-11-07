145ba5dc0: 4156 push r14
145ba5dc2: 56 push rsi
145ba5dc3: 57 push rdi
145ba5dc4: 53 push rbx
145ba5dc5: 4883ec28 sub rsp, 0x28
145ba5dc9: 0fb6998a0c0000 movzx ebx, byte ptr [rcx + 0xc8a]
145ba5dd0: fecb dec bl
145ba5dd2: 80fb02 cmp bl, 2
145ba5dd5: 7753 ja 0x145ba5e2a
145ba5dd7: 488bb178060000 mov rsi, qword ptr [rcx + 0x678]
145ba5dde: 4c8bb180060000 mov r14, qword ptr [rcx + 0x680]
145ba5de5: 4889cf mov rdi, rcx
145ba5de8: 48c7818006000000000000 mov qword ptr [rcx + 0x680], 0
145ba5df3: 4d85f6 test r14, r14
145ba5df6: 741c je 0x145ba5e14
145ba5df8: 0f1f840000000000 nop dword ptr [rax + rax]
145ba5e00: 4889f1 mov rcx, rsi
145ba5e03: e8c80efdff call 0x145b76cd0
145ba5e08: 4881c6a0000000 add rsi, 0xa0
145ba5e0f: 49ffce dec r14
145ba5e12: 75ec jne 0x145ba5e00
145ba5e14: 4889f9 mov rcx, rdi
145ba5e17: c687880c0000ff mov byte ptr [rdi + 0xc88], 0xff
145ba5e1e: c687770c000001 mov byte ptr [rdi + 0xc77], 1
145ba5e25: e8c6fdfeff call 0x145b95bf0
145ba5e2a: 80fb03 cmp bl, 3
145ba5e2d: 0f92c0 setb al
145ba5e30: 4883c428 add rsp, 0x28
145ba5e34: 5b pop rbx
145ba5e35: 5f pop rdi
145ba5e36: 5e pop rsi
145ba5e37: 415e pop r14
145ba5e39: c3 ret
