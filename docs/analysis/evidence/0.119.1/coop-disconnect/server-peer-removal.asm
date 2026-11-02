0x145b1e7d0: push rbp
0x145b1e7d1: push r15
0x145b1e7d3: push r14
0x145b1e7d5: push r13
0x145b1e7d7: push r12
0x145b1e7d9: push rsi
0x145b1e7da: push rdi
0x145b1e7db: push rbx
0x145b1e7dc: sub rsp, 0x928
0x145b1e7e3: lea rbp, [rsp + 0x80]
0x145b1e7eb: mov qword ptr [rbp + 0x8a0], 0xfffffffffffffffe
0x145b1e7f6: cmp dword ptr [rcx + 0xca0], 3
0x145b1e7fd: jne 0x145b1e8f4
0x145b1e803: mov rdi, rdx
0x145b1e806: mov rsi, rcx
0x145b1e809: mov rbx, qword ptr [rcx + 0xce0]
0x145b1e810: cmp rdx, rbx
0x145b1e813: jae 0x145b1e908
0x145b1e819: mov r12, qword ptr [rsi + 0xcd8]
0x145b1e820: lea r13, [rdi + rdi*8]
0x145b1e824: shl r13, 7
0x145b1e828: lea r14, [r12 + r13]
0x145b1e82c: mov r15, qword ptr [r12 + r13]
0x145b1e830: lea rdx, [r12 + r13]
0x145b1e834: add rdx, 8
0x145b1e838: lea rcx, [rbp - 0x58]
0x145b1e83c: mov r8d, 0x478
0x145b1e842: call 0x145f973db
0x145b1e847: lea rdx, [r12 + r13]
0x145b1e84b: add rdx, 0x480
0x145b1e852: mov rax, rdi
0x145b1e855: not rax
0x145b1e858: add rax, rbx
0x145b1e85b: shl rax, 7
0x145b1e85f: lea r8, [rax + rax*8]
0x145b1e863: mov rcx, r14
0x145b1e866: call 0x145f973e1
0x145b1e86b: dec rbx
0x145b1e86e: mov qword ptr [rsi + 0xce0], rbx
0x145b1e875: cmp r15, 2
0x145b1e879: je 0x145b1e908
0x145b1e87f: mov qword ptr [rbp + 0x420], r15
0x145b1e886: lea rcx, [rbp + 0x428]
0x145b1e88d: lea rdx, [rbp - 0x58]
0x145b1e891: mov r8d, 0x478
0x145b1e897: call 0x145f973db
0x145b1e89c: cmp dword ptr [rsi + 0x10], 2
0x145b1e8a0: setne al
0x145b1e8a3: test al, r15b
0x145b1e8a6: je 0x145b1e8b9
0x145b1e8a8: lea rcx, [rsi + 0x10]
0x145b1e8ac: mov rdx, qword ptr [rbp + 0x428]
0x145b1e8b3: call 0x145b8cb40
0x145b1e8b8: nop
0x145b1e8b9: mov rcx, rsi
0x145b1e8bc: call 0x145b1b030
0x145b1e8c1: nop
0x145b1e8c2: mov qword ptr [rsp + 0x20], 0
0x145b1e8cb: lea rdx, [rip + 0x17c03de]
0x145b1e8d2: mov r8d, 4
0x145b1e8d8: mov r9d, 1
0x145b1e8de: mov rcx, rsi
0x145b1e8e1: call 0x145b1b690
0x145b1e8e6: nop
0x145b1e8e7: lea rcx, [rbp + 0x420]
0x145b1e8ee: call 0x145af9ce0
0x145b1e8f3: nop
0x145b1e8f4: add rsp, 0x928
0x145b1e8fb: pop rbx
0x145b1e8fc: pop rdi
0x145b1e8fd: pop rsi
0x145b1e8fe: pop r12
0x145b1e900: pop r13
0x145b1e902: pop r14
0x145b1e904: pop r15
0x145b1e906: pop rbp
0x145b1e907: ret
0x145b1e908: lea r8, [rip + 0x17c0429]
0x145b1e90f: mov rcx, rdi
0x145b1e912: mov rdx, rbx
0x145b1e915: call 0x14613e48b
0x145b1e91a: ud2
