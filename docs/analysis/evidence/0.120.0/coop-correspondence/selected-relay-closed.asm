0x145af28a0: push rbp
0x145af28a1: push rsi
0x145af28a2: push rdi
0x145af28a3: sub rsp, 0x40
0x145af28a7: lea rbp, [rsp + 0x40]
0x145af28ac: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x145af28b4: mov rdi, qword ptr [rcx]
0x145af28b7: mov cl, 1
0x145af28b9: xor eax, eax
0x145af28bb: lock cmpxchg byte ptr [rdi + 0x10], cl
0x145af28c0: jne 0x145af290e
0x145af28c2: mov rsi, qword ptr [rip + 0x2a392af]
0x145af28c9: mov rax, qword ptr [rsi]
0x145af28cc: shl rax, 1
0x145af28cf: test rax, rax
0x145af28d2: jne 0x145af2919
0x145af28d4: xor ecx, ecx
0x145af28d6: movzx eax, byte ptr [rdi + 0x11]
0x145af28da: cmp dword ptr [rdi + 0xa0], -1
0x145af28e1: je 0x145af2930
0x145af28e3: mov dword ptr [rbp - 0xc], ecx
0x145af28e6: mov rcx, qword ptr [rdi + 0x88]
0x145af28ed: mov qword ptr [rbp - 0x18], rdi
0x145af28f1: mov rax, qword ptr [rdi + 0x90]
0x145af28f8: call qword ptr [rax + 0x28]
0x145af28fb: nop
0x145af28fc: cmp al, 2
0x145af28fe: sete al
0x145af2901: mov rdi, qword ptr [rbp - 0x18]
0x145af2905: mov ecx, dword ptr [rbp - 0xc]
0x145af2908: test cl, cl
0x145af290a: je 0x145af2936
0x145af290c: jmp 0x145af2941
0x145af290e: lea rcx, [rdi + 0x10]
0x145af2912: call 0x146149410
0x145af2917: jmp 0x145af28c2
0x145af2919: call 0x14614a1a0
0x145af291e: mov ecx, eax
0x145af2920: xor cl, 1
0x145af2923: movzx eax, byte ptr [rdi + 0x11]
0x145af2927: cmp dword ptr [rdi + 0xa0], -1
0x145af292e: jne 0x145af28e3
0x145af2930: xor eax, eax
0x145af2932: test cl, cl
0x145af2934: jne 0x145af2941
0x145af2936: mov rcx, qword ptr [rsi]
0x145af2939: shl rcx, 1
0x145af293c: test rcx, rcx
0x145af293f: jne 0x145af2965
0x145af2941: xor ecx, ecx
0x145af2943: xchg byte ptr [rdi + 0x10], cl
0x145af2946: cmp cl, 2
0x145af2949: je 0x145af2953
0x145af294b: add rsp, 0x40
0x145af294f: pop rdi
0x145af2950: pop rsi
0x145af2951: pop rbp
0x145af2952: ret
0x145af2953: add rdi, 0x10
0x145af2957: mov rcx, rdi
0x145af295a: mov esi, eax
0x145af295c: call 0x1461494d0
0x145af2961: mov eax, esi
0x145af2963: jmp 0x145af294b
0x145af2965: mov esi, eax
0x145af2967: call 0x14614a1a0
0x145af296c: mov ecx, eax
0x145af296e: mov eax, esi
0x145af2970: test cl, cl
0x145af2972: jne 0x145af2941
0x145af2974: mov byte ptr [rdi + 0x11], 1
0x145af2978: jmp 0x145af2941
