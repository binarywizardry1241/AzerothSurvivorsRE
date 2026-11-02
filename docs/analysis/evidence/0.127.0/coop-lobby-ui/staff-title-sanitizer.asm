0x145b46990: push rbp
0x145b46991: push r15
0x145b46993: push r14
0x145b46995: push r13
0x145b46997: push r12
0x145b46999: push rsi
0x145b4699a: push rdi
0x145b4699b: push rbx
0x145b4699c: sub rsp, 0x48
0x145b469a0: lea rbp, [rsp + 0x40]
0x145b469a5: mov qword ptr [rbp], 0xfffffffffffffffe
0x145b469ad: mov rsi, rcx
0x145b469b0: mov qword ptr [rbp - 0x18], 0
0x145b469b8: mov qword ptr [rbp - 0x10], 1
0x145b469c0: mov qword ptr [rbp - 8], 0
0x145b469c8: mov r14, qword ptr [rdx + 0x10]
0x145b469cc: test r14, r14
0x145b469cf: je 0x145b46bd9
0x145b469d5: mov r15, qword ptr [rdx]
0x145b469d8: mov r12, qword ptr [rdx + 8]
0x145b469dc: cmp r15, r12
0x145b469df: je 0x145b46bd9
0x145b469e5: dec r14
0x145b469e8: mov eax, 1
0x145b469ed: xor edi, edi
0x145b469ef: lea rcx, [rbp - 0x18]
0x145b469f3: mov r13d, 2
0x145b469f9: jmp 0x145b46a25
0x145b469fb: or dl, 0xc0
0x145b469fe: mov byte ptr [rax + rdi], dl
0x145b46a01: mov byte ptr [rax + rdi + 1], r9b
0x145b46a06: mov edx, 2
0x145b46a0b: add rdi, rdx
0x145b46a0e: mov qword ptr [rbp - 8], rdi
0x145b46a12: sub r14, 1
0x145b46a16: jb 0x145b46bd9
0x145b46a1c: cmp r15, r12
0x145b46a1f: je 0x145b46bd9
0x145b46a25: movzx edx, byte ptr [r15]
0x145b46a29: movzx ebx, dl
0x145b46a2c: test bl, bl
0x145b46a2e: js 0x145b46a40
0x145b46a30: inc r15
0x145b46a33: jmp 0x145b46ab0
0x145b46a35: nop word ptr cs:[rax + rax]
0x145b46a40: mov r9d, ebx
0x145b46a43: and r9d, 0x1f
0x145b46a47: movzx r8d, byte ptr [r15 + 1]
0x145b46a4c: and r8d, 0x3f
0x145b46a50: cmp bl, 0xdf
0x145b46a53: jbe 0x145b46a89
0x145b46a55: movzx ebx, byte ptr [r15 + 2]
0x145b46a5a: shl r8d, 6
0x145b46a5e: and ebx, 0x3f
0x145b46a61: or ebx, r8d
0x145b46a64: cmp dl, 0xf0
0x145b46a67: jb 0x145b46a99
0x145b46a69: movzx edx, byte ptr [r15 + 3]
0x145b46a6e: add r15, 4
0x145b46a72: and r9d, 7
0x145b46a76: shl r9d, 0x12
0x145b46a7a: shl ebx, 6
0x145b46a7d: and edx, 0x3f
0x145b46a80: or edx, ebx
0x145b46a82: or edx, r9d
0x145b46a85: mov ebx, edx
0x145b46a87: jmp 0x145b46ab0
0x145b46a89: add r15, 2
0x145b46a8d: shl r9d, 6
0x145b46a91: or r9d, r8d
0x145b46a94: mov ebx, r9d
0x145b46a97: jmp 0x145b46ab0
0x145b46a99: add r15, 3
0x145b46a9d: shl r9d, 0xc
0x145b46aa1: or ebx, r9d
0x145b46aa4: nop word ptr cs:[rax + rax]
0x145b46ab0: cmp ebx, 0x20
0x145b46ab3: setb r8b
0x145b46ab7: lea edx, [rbx - 0xa0]
0x145b46abd: cmp edx, -0x21
0x145b46ac0: setae dl
0x145b46ac3: or dl, r8b
0x145b46ac6: jne 0x145b46a1c
0x145b46acc: cmp ebx, 0x80
0x145b46ad2: jae 0x145b46af0
0x145b46ad4: cmp qword ptr [rbp - 0x18], rdi
0x145b46ad8: je 0x145b46b8f
0x145b46ade: mov rax, qword ptr [rbp - 0x10]
0x145b46ae2: mov byte ptr [rax + rdi], bl
0x145b46ae5: mov edx, 1
0x145b46aea: jmp 0x145b46a0b
0x145b46aef: nop 
0x145b46af0: cmp ebx, 0x10000
0x145b46af6: mov r8d, 4
0x145b46afc: sbb r8, 0
0x145b46b00: cmp ebx, 0x800
0x145b46b06: cmovb r8, r13
0x145b46b0a: mov rdx, qword ptr [rbp - 0x18]
0x145b46b0e: sub rdx, rdi
0x145b46b11: cmp r8, rdx
0x145b46b14: ja 0x145b46bb5
0x145b46b1a: mov r9d, ebx
0x145b46b1d: and r9b, 0x3f
0x145b46b21: or r9b, 0x80
0x145b46b25: mov edx, ebx
0x145b46b27: shr edx, 6
0x145b46b2a: cmp ebx, 0x800
0x145b46b30: jb 0x145b469fb
0x145b46b36: and dl, 0x3f
0x145b46b39: or dl, 0x80
0x145b46b3c: mov r8d, ebx
0x145b46b3f: shr r8d, 0xc
0x145b46b43: cmp ebx, 0xffff
0x145b46b49: ja 0x145b46b66
0x145b46b4b: or r8b, 0xe0
0x145b46b4f: mov byte ptr [rax + rdi], r8b
0x145b46b53: mov byte ptr [rax + rdi + 1], dl
0x145b46b57: mov byte ptr [rax + rdi + 2], r9b
0x145b46b5c: mov edx, 3
0x145b46b61: jmp 0x145b46a0b
0x145b46b66: and r8b, 0x3f
0x145b46b6a: or r8b, 0x80
0x145b46b6e: shr ebx, 0x12
0x145b46b71: or bl, 0xf0
0x145b46b74: mov byte ptr [rax + rdi], bl
0x145b46b77: mov byte ptr [rax + rdi + 1], r8b
0x145b46b7c: mov byte ptr [rax + rdi + 2], dl
0x145b46b80: mov byte ptr [rax + rdi + 3], r9b
0x145b46b85: mov edx, 4
0x145b46b8a: jmp 0x145b46a0b
0x145b46b8f: mov qword ptr [rsp + 0x20], 1
0x145b46b98: mov r8d, 1
0x145b46b9e: mov r9d, 1
0x145b46ba4: mov rdx, rdi
0x145b46ba7: call 0x146061b30
0x145b46bac: lea rcx, [rbp - 0x18]
0x145b46bb0: jmp 0x145b46ade
0x145b46bb5: mov qword ptr [rsp + 0x20], 1
0x145b46bbe: mov r9d, 1
0x145b46bc4: mov rdx, rdi
0x145b46bc7: call 0x146061b30
0x145b46bcc: lea rcx, [rbp - 0x18]
0x145b46bd0: mov rax, qword ptr [rbp - 0x10]
0x145b46bd4: jmp 0x145b46b1a
0x145b46bd9: mov rax, qword ptr [rbp - 8]
0x145b46bdd: mov qword ptr [rsi + 0x10], rax
0x145b46be1: mov rax, qword ptr [rbp - 0x18]
0x145b46be5: mov qword ptr [rsi], rax
0x145b46be8: mov rax, qword ptr [rbp - 0x10]
0x145b46bec: mov qword ptr [rsi + 8], rax
0x145b46bf0: mov rax, rsi
0x145b46bf3: add rsp, 0x48
0x145b46bf7: pop rbx
0x145b46bf8: pop rdi
0x145b46bf9: pop rsi
0x145b46bfa: pop r12
0x145b46bfc: pop r13
0x145b46bfe: pop r14
0x145b46c00: pop r15
0x145b46c02: pop rbp
0x145b46c03: ret 
