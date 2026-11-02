00000001402be5a0: push r14
00000001402be5a2: push rsi
00000001402be5a3: push rdi
00000001402be5a4: push rbx
00000001402be5a5: sub rsp, 0x138
00000001402be5ac: movaps xmmword ptr [rsp + 0x120], xmm6
00000001402be5b4: mov rbx, rdx
00000001402be5b7: mov rsi, rcx
00000001402be5ba: mov r14, qword ptr [rcx]
00000001402be5bd: mov rax, qword ptr [rcx + 0x28]
00000001402be5c1: mov qword ptr [rsp + 0xc0], r14
00000001402be5c9: movups xmm0, xmmword ptr [rcx + 8]
00000001402be5cd: movups xmmword ptr [rsp + 0xc8], xmm0
00000001402be5d5: movups xmm0, xmmword ptr [rcx + 0x18]
00000001402be5d9: movups xmmword ptr [rsp + 0xd8], xmm0
00000001402be5e1: mov qword ptr [rsp + 0xe8], rax
00000001402be5e9: mov rax, qword ptr [rdx]
00000001402be5ec: cmp byte ptr [rax], 1
00000001402be5ef: jne 0x1402be5fa
00000001402be5f1: mov rdi, qword ptr [rbx + 8]
00000001402be5f5: jmp 0x1402be738
00000001402be5fa: mov rdi, qword ptr [rbx + 8]
00000001402be5fe: mov rax, qword ptr [rbx + 0x10]
00000001402be602: movss xmm6, dword ptr [rax]
00000001402be606: call 0x140002200
00000001402be60b: mov ecx, 1
00000001402be610: mov edx, 1
00000001402be615: call 0x1400021c0
00000001402be61a: test rax, rax
00000001402be61d: je 0x1402be828
00000001402be623: mov byte ptr [rax], 0x3f
00000001402be626: cmp byte ptr [rdi + 0x18], 1
00000001402be62a: jne 0x1402be648
00000001402be62c: mov ecx, dword ptr [rdi + 0x19]
00000001402be62f: mov edx, dword ptr [rdi + 0x1c]
00000001402be632: mov dword ptr [rsp + 0x33], edx
00000001402be636: mov dword ptr [rsp + 0x30], ecx
00000001402be63a: mov rcx, qword ptr [rdi + 0x20]
00000001402be63e: movzx r8d, byte ptr [rdi + 0x28]
00000001402be643: mov r9b, 1
00000001402be646: jmp 0x1402be659
00000001402be648: mov rcx, qword ptr [rdi + 0x20]
00000001402be64c: lock inc qword ptr [rcx]
00000001402be650: jle 0x1402be837
00000001402be656: xor r9d, r9d
00000001402be659: lea rdx, [rsp + 0xc8]
00000001402be661: mulss xmm6, dword ptr [rip + 0x5c33827]
00000001402be669: mov qword ptr [rsp + 0x40], 1
00000001402be672: mov qword ptr [rsp + 0x48], rax
00000001402be677: mov qword ptr [rsp + 0x50], 1
00000001402be680: mov qword ptr [rsp + 0x58], 0
00000001402be689: mov qword ptr [rsp + 0x60], 4
00000001402be692: mov qword ptr [rsp + 0x68], 0
00000001402be69b: mov byte ptr [rsp + 0x70], r9b
00000001402be6a0: mov eax, dword ptr [rsp + 0x30]
00000001402be6a4: mov r9d, dword ptr [rsp + 0x33]
00000001402be6a9: mov dword ptr [rsp + 0x71], eax
00000001402be6ad: mov dword ptr [rsp + 0x74], r9d
00000001402be6b2: mov qword ptr [rsp + 0x78], rcx
00000001402be6b7: mov qword ptr [rsp + 0x80], r8
00000001402be6bf: movss dword ptr [rsp + 0x88], xmm6
00000001402be6c8: mov word ptr [rsp + 0x8c], 0x190
00000001402be6d2: mov byte ptr [rsp + 0x8e], 1
00000001402be6da: mov dword ptr [rsp + 0x90], 0
00000001402be6e5: movaps xmm0, xmmword ptr [rip + 0x5c3ea54]
00000001402be6ec: movups xmmword ptr [rsp + 0x94], xmm0
00000001402be6f4: movups xmm0, xmmword ptr [rip + 0x5c111cd]
00000001402be6fb: movups xmmword ptr [rsp + 0xa4], xmm0
00000001402be703: mov eax, dword ptr [rip + 0x5c111cf]
00000001402be709: mov dword ptr [rsp + 0xb4], eax
00000001402be710: movsd xmm0, qword ptr [rip + 0x5be39b8]
00000001402be718: movsd qword ptr [rsp + 0xb8], xmm0
00000001402be721: mov qword ptr [rsp + 0x38], r14
00000001402be726: lea rcx, [rsp + 0xf0]
00000001402be72e: lea r8, [rsp + 0x38]
00000001402be733: call 0x140278cc0
00000001402be738: mov r14, qword ptr [rbx + 0x18]
00000001402be73c: mov rax, qword ptr [rbx + 0x20]
00000001402be740: mov ebx, dword ptr [rax]
00000001402be742: mov rcx, r14
00000001402be745: mov edx, ebx
00000001402be747: call 0x140131a10
00000001402be74c: test al, al
00000001402be74e: je 0x1402be7a9
00000001402be750: lea rcx, [rip + 0x5c3fa1d]
00000001402be757: mov edx, 0x10
00000001402be75c: call 0x145895670
00000001402be761: mov r9, rdx
00000001402be764: mov qword ptr [rsp + 0x38], rax
00000001402be769: mov qword ptr [rsp + 0x40], rdx
00000001402be76e: lea rcx, [rsp + 0x48]
00000001402be773: movups xmm0, xmmword ptr [rip + 0x5c3f1ce]
00000001402be77a: movups xmmword ptr [rsp + 0x48], xmm0
00000001402be77f: mov dword ptr [rsp + 0x58], 0x3f800000
00000001402be787: mov byte ptr [rsp + 0x5c], 1
00000001402be78c: mov qword ptr [rsp + 0x20], rcx
00000001402be791: mov byte ptr [rsp + 0x28], 1
00000001402be796: lea rcx, [rsp + 0xc0]
00000001402be79e: mov rdx, rdi
00000001402be7a1: mov r8, rax
00000001402be7a4: call 0x140304e60
00000001402be7a9: mov rcx, r14
00000001402be7ac: mov edx, ebx
00000001402be7ae: call 0x1401318e0
00000001402be7b3: test al, al
00000001402be7b5: je 0x1402be810
00000001402be7b7: lea rcx, [rip + 0x5c3f9ee]
00000001402be7be: mov edx, 0x10
00000001402be7c3: call 0x145895670
00000001402be7c8: mov r9, rdx
00000001402be7cb: mov qword ptr [rsp + 0x38], rax
00000001402be7d0: mov qword ptr [rsp + 0x40], rdx
00000001402be7d5: lea rcx, [rsp + 0x48]
00000001402be7da: movups xmm0, xmmword ptr [rip + 0x5c3fabf]
00000001402be7e1: movups xmmword ptr [rsp + 0x48], xmm0
00000001402be7e6: mov dword ptr [rsp + 0x58], 0x3f800000
00000001402be7ee: mov byte ptr [rsp + 0x5c], 0
00000001402be7f3: mov qword ptr [rsp + 0x20], rcx
00000001402be7f8: mov byte ptr [rsp + 0x28], 0
00000001402be7fd: lea rcx, [rsp + 0xc0]
00000001402be805: mov rdx, rdi
00000001402be808: mov r8, rax
00000001402be80b: call 0x140304e60
00000001402be810: mov rax, rsi
00000001402be813: movaps xmm6, xmmword ptr [rsp + 0x120]
00000001402be81b: add rsp, 0x138
00000001402be822: pop rbx
00000001402be823: pop rdi
00000001402be824: pop rsi
00000001402be825: pop r14
00000001402be827: ret
00000001402be828: mov ecx, 1
00000001402be82d: mov edx, 1
00000001402be832: call 0x145e9bd8b
00000001402be837: ud2
