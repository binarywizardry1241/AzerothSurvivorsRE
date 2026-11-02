0x145891ab0: push r15
0x145891ab2: push r14
0x145891ab4: push rsi
0x145891ab5: push rdi
0x145891ab6: push rbx
0x145891ab7: sub rsp, 0x20
0x145891abb: mov rsi, r8
0x145891abe: test r8, r8
0x145891ac1: jns 0x145891ad3
0x145891ac3: xor r15d, r15d
0x145891ac6: mov rcx, r15
0x145891ac9: mov rdx, rsi
0x145891acc: call 0x145eb6fcb
0x145891ad1: ud2
0x145891ad3: mov rdi, rcx
0x145891ad6: je 0x145891b18
0x145891ad8: mov r14, rdx
0x145891adb: call 0x140002200
0x145891ae0: mov r15d, 1
0x145891ae6: mov edx, 1
0x145891aeb: mov rcx, rsi
0x145891aee: call 0x1400021c0
0x145891af3: test rax, rax
0x145891af6: je 0x145891ac6
0x145891af8: mov rbx, rax
0x145891afb: mov rcx, rax
0x145891afe: mov rdx, r14
0x145891b01: mov r8, rsi
0x145891b04: call 0x145d145fb
0x145891b09: mov rdx, qword ptr [rdi + 0x16d8]
0x145891b10: cmp rdx, -1
0x145891b14: jne 0x145891b2a
0x145891b16: jmp 0x145891b41
0x145891b18: mov ebx, 1
0x145891b1d: mov rdx, qword ptr [rdi + 0x16d8]
0x145891b24: cmp rdx, -1
0x145891b28: je 0x145891b41
0x145891b2a: test rdx, rdx
0x145891b2d: je 0x145891b41
0x145891b2f: mov rcx, qword ptr [rdi + 0x16e0]
0x145891b36: mov r8d, 1
0x145891b3c: call 0x1400021d0
0x145891b41: mov qword ptr [rdi + 0x16d8], rsi
0x145891b48: mov qword ptr [rdi + 0x16e0], rbx
0x145891b4f: mov qword ptr [rdi + 0x16e8], rsi
0x145891b56: add rsp, 0x20
0x145891b5a: pop rbx
0x145891b5b: pop rdi
0x145891b5c: pop rsi
0x145891b5d: pop r14
0x145891b5f: pop r15
0x145891b61: ret
