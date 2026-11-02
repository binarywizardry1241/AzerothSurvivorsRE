0x145ec3070: push rbp
0x145ec3071: push r15
0x145ec3073: push r14
0x145ec3075: push r13
0x145ec3077: push r12
0x145ec3079: push rsi
0x145ec307a: push rdi
0x145ec307b: push rbx
0x145ec307c: sub rsp, 0x78
0x145ec3080: lea rbp, [rsp + 0x70]
0x145ec3085: mov qword ptr [rbp], 0xfffffffffffffffe
0x145ec308d: mov rdi, rdx
0x145ec3090: mov rsi, rcx
0x145ec3093: lea rcx, [rbp - 0x18]
0x145ec3097: call 0x145ec36e0
0x145ec309c: mov rdx, qword ptr [rdi + 8]
0x145ec30a0: mov rax, qword ptr [rdi + 0x10]
0x145ec30a4: mov rcx, rax
0x145ec30a7: add rcx, 8
0x145ec30ab: mov r8, 0xffffffffffffffff
0x145ec30b2: cmovae r8, rcx
0x145ec30b6: cmp r8, rdx
0x145ec30b9: jbe 0x145ec30c5
0x145ec30bb: mov byte ptr [rdi + 0x18], 0
0x145ec30bf: mov qword ptr [rdi + 0x10], rdx
0x145ec30c3: jmp 0x145ec30db
0x145ec30c5: mov rdx, qword ptr [rdi]
0x145ec30c8: sub r8, rax
0x145ec30cb: mov qword ptr [rdi + 0x10], rcx
0x145ec30cf: cmp r8, 8
0x145ec30d3: jne 0x145ec30db
0x145ec30d5: mov r12, qword ptr [rdx + rax]
0x145ec30d9: jmp 0x145ec30de
0x145ec30db: xor r12d, r12d
0x145ec30de: lea rcx, [rbp - 0x30]
0x145ec30e2: mov rdx, rdi
0x145ec30e5: call 0x145ec36e0
0x145ec30ea: nop 
0x145ec30eb: lea rcx, [rbp - 0x48]
0x145ec30ef: mov rdx, rdi
0x145ec30f2: call 0x145ec36e0
0x145ec30f7: nop 
0x145ec30f8: mov rax, qword ptr [rdi + 8]
0x145ec30fc: mov rdx, qword ptr [rdi + 0x10]
0x145ec3100: mov rcx, rdx
0x145ec3103: add rcx, 8
0x145ec3107: mov r8, 0xffffffffffffffff
0x145ec310e: cmovae r8, rcx
0x145ec3112: cmp r8, rax
0x145ec3115: jbe 0x145ec3127
0x145ec3117: mov byte ptr [rdi + 0x18], 0
0x145ec311b: mov qword ptr [rdi + 0x10], rax
0x145ec311f: xor r13d, r13d
0x145ec3122: mov rcx, rax
0x145ec3125: jmp 0x145ec3140
0x145ec3127: mov r9, qword ptr [rdi]
0x145ec312a: sub r8, rdx
0x145ec312d: mov qword ptr [rdi + 0x10], rcx
0x145ec3131: cmp r8, 8
0x145ec3135: jne 0x145ec313d
0x145ec3137: mov r13, qword ptr [r9 + rdx]
0x145ec313b: jmp 0x145ec3140
0x145ec313d: xor r13d, r13d
0x145ec3140: mov rdx, rcx
0x145ec3143: add rdx, 4
0x145ec3147: mov r8, 0xffffffffffffffff
0x145ec314e: cmovae r8, rdx
0x145ec3152: cmp r8, rax
0x145ec3155: jbe 0x145ec3162
0x145ec3157: mov byte ptr [rdi + 0x18], 0
0x145ec315b: xor ecx, ecx
0x145ec315d: mov rdx, rax
0x145ec3160: jmp 0x145ec3176
0x145ec3162: sub r8, rcx
0x145ec3165: cmp r8, 4
0x145ec3169: jne 0x145ec3174
0x145ec316b: mov r8, qword ptr [rdi]
0x145ec316e: mov ecx, dword ptr [r8 + rcx]
0x145ec3172: jmp 0x145ec3176
0x145ec3174: xor ecx, ecx
0x145ec3176: add rcx, rdx
0x145ec3179: mov rbx, 0xffffffffffffffff
0x145ec3180: cmovae rbx, rcx
0x145ec3184: cmp rbx, rax
0x145ec3187: jbe 0x145ec3193
0x145ec3189: mov byte ptr [rdi + 0x18], 0
0x145ec318d: mov qword ptr [rdi + 0x10], rax
0x145ec3191: jmp 0x145ec31a8
0x145ec3193: mov r14, qword ptr [rdi]
0x145ec3196: add r14, rdx
0x145ec3199: sub rbx, rdx
0x145ec319c: mov qword ptr [rdi + 0x10], rcx
0x145ec31a0: js 0x145ec3236
0x145ec31a6: jne 0x145ec31b1
0x145ec31a8: mov edi, 1
0x145ec31ad: xor ebx, ebx
0x145ec31af: jmp 0x145ec31df
0x145ec31b1: call 0x140002200
0x145ec31b6: mov r15d, 1
0x145ec31bc: mov edx, 1
0x145ec31c1: mov rcx, rbx
0x145ec31c4: call 0x1400021c0
0x145ec31c9: test rax, rax
0x145ec31cc: je 0x145ec3239
0x145ec31ce: mov rdi, rax
0x145ec31d1: mov rcx, rax
0x145ec31d4: mov rdx, r14
0x145ec31d7: mov r8, rbx
0x145ec31da: call 0x14606171b
0x145ec31df: mov rax, qword ptr [rbp - 8]
0x145ec31e3: mov qword ptr [rsi + 0x10], rax
0x145ec31e7: movups xmm0, xmmword ptr [rbp - 0x18]
0x145ec31eb: movups xmmword ptr [rsi], xmm0
0x145ec31ee: mov qword ptr [rsi + 0x60], r12
0x145ec31f2: movups xmm0, xmmword ptr [rbp - 0x30]
0x145ec31f6: movups xmmword ptr [rsi + 0x18], xmm0
0x145ec31fa: mov rax, qword ptr [rbp - 0x20]
0x145ec31fe: mov qword ptr [rsi + 0x28], rax
0x145ec3202: movups xmm0, xmmword ptr [rbp - 0x48]
0x145ec3206: movups xmmword ptr [rsi + 0x30], xmm0
0x145ec320a: mov rax, qword ptr [rbp - 0x38]
0x145ec320e: mov qword ptr [rsi + 0x40], rax
0x145ec3212: mov qword ptr [rsi + 0x68], r13
0x145ec3216: mov qword ptr [rsi + 0x48], rbx
0x145ec321a: mov qword ptr [rsi + 0x50], rdi
0x145ec321e: mov qword ptr [rsi + 0x58], rbx
0x145ec3222: mov rax, rsi
0x145ec3225: add rsp, 0x78
0x145ec3229: pop rbx
0x145ec322a: pop rdi
0x145ec322b: pop rsi
0x145ec322c: pop r12
0x145ec322e: pop r13
0x145ec3230: pop r14
0x145ec3232: pop r15
0x145ec3234: pop rbp
0x145ec3235: ret 
0x145ec3236: xor r15d, r15d
0x145ec3239: mov rcx, r15
0x145ec323c: mov rdx, rbx
0x145ec323f: call 0x14620896b
0x145ec3244: nop 
0x145ec3245: ud2 
