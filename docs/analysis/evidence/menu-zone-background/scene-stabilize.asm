14085d590: push       r15
14085d592: push       r14
14085d594: push       r12
14085d596: push       rsi
14085d597: push       rdi
14085d598: push       rbp
14085d599: push       rbx
14085d59a: sub        rsp, 0x20
14085d59e: mov        rdi, qword ptr [rsp + 0x80]
14085d5a6: mov        r12, qword ptr [rdx]
14085d5a9: mov        r14, qword ptr [r8]
14085d5ac: mov        r15, qword ptr [r8 + 0x10]
14085d5b0: mov        ebp, dword ptr [r8 + 0x1c]
14085d5b4: mov        rbx, qword ptr [r9]
14085d5b7: mov        eax, dword ptr [rip + 0x781abd3]
14085d5bd: test       eax, eax
14085d5bf: jne        0x14085d6c5
14085d5c5: mov        cl, 1
14085d5c7: xor        eax, eax
14085d5c9: lock cmpxchg byte ptr [rip + 0x781ab8f], cl
14085d5d1: jne        0x14085d6e3
14085d5d7: mov        rsi, qword ptr [rip + 0x786140a]
14085d5de: mov        rax, qword ptr [rsi]
14085d5e1: shl        rax, 1
14085d5e4: test       rax, rax
14085d5e7: jne        0x14085d6f4
14085d5ed: xor        eax, eax
14085d5ef: movzx      ecx, byte ptr [rip + 0x781ab6b]
14085d5f6: cmp        byte ptr [r12], 1
14085d5fb: jne        0x14085d70d
14085d601: test       byte ptr [rip + 0x781ab5c], 1
14085d608: je         0x14085d70d
14085d60e: mov        edx, dword ptr [rip + 0x781ab58]
14085d614: mov        ecx, dword ptr [rip + 0x781ab4e]
14085d61a: mov        r8d, 1
14085d620: cmp        dword ptr [rdi], 1
14085d623: jne        0x14085d715
14085d629: cmp        dword ptr [rdi + 4], ecx
14085d62c: jne        0x14085d715
14085d632: cmp        dword ptr [rdi + 8], edx
14085d635: jne        0x14085d715
14085d63b: mov        r8d, dword ptr [rdi + 0xc]
14085d63f: inc        r8d
14085d642: mov        edx, 0xffffffff
14085d647: cmovne     edx, r8d
14085d64b: mov        dword ptr [rdi + 0xc], edx
14085d64e: cmp        edx, 3
14085d651: jb         0x14085d737
14085d657: test       r14, r14
14085d65a: je         0x14085d667
14085d65c: cmp        dword ptr [r14], ecx
14085d65f: je         0x14085d667
14085d661: mov        dword ptr [r15], ebp
14085d664: mov        dword ptr [r14], ecx
14085d667: mov        byte ptr [rip + 0x781ab1f], 1
14085d66e: mov        cl, 1
14085d670: cmp        byte ptr [rip + 0x781ab17], 0
14085d677: jne        0x14085d740
14085d67d: cmp        edx, 0x12
14085d680: setb       cl
14085d683: test       rbx, rbx
14085d686: sete       dl
14085d689: or         dl, cl
14085d68b: jne        0x14085d73e
14085d691: cmp        byte ptr [rbx + 0x3c], 1
14085d695: jne        0x14085d73e
14085d69b: cmp        byte ptr [rbx + 0x3d], 1
14085d69f: jne        0x14085d73e
14085d6a5: cmp        qword ptr [rbx + 0x10], 0
14085d6aa: jne        0x14085d73e
14085d6b0: cmp        qword ptr [rbx + 0x18], 0
14085d6b5: jne        0x14085d73e
14085d6bb: cmp        qword ptr [rbx + 0x28], 0
14085d6c0: sete       cl
14085d6c3: jmp        0x14085d740
14085d6c5: lea        rcx, [rip + 0x781aa94]
14085d6cc: call       0x145c4aa3e
14085d6d1: mov        cl, 1
14085d6d3: xor        eax, eax
14085d6d5: lock cmpxchg byte ptr [rip + 0x781aa83], cl
14085d6dd: je         0x14085d5d7
14085d6e3: lea        rcx, [rip + 0x781aa76]
14085d6ea: call       0x145dbc1f0
14085d6ef: jmp        0x14085d5d7
14085d6f4: call       0x145dbcf80
14085d6f9: xor        al, 1
14085d6fb: movzx      ecx, byte ptr [rip + 0x781aa5f]
14085d702: cmp        byte ptr [r12], 1
14085d707: je         0x14085d601
14085d70d: cmp        byte ptr [rdi], 0
14085d710: je         0x14085d727
14085d712: xor        r8d, r8d
14085d715: mov        dword ptr [rdi], r8d
14085d718: mov        dword ptr [rdi + 4], ecx
14085d71b: mov        dword ptr [rdi + 8], edx
14085d71e: mov        dword ptr [rdi + 0xc], 0
14085d725: jmp        0x14085d737
14085d727: mov        ecx, dword ptr [rdi + 0xc]
14085d72a: inc        ecx
14085d72c: mov        edx, 0xffffffff
14085d731: cmovne     edx, ecx
14085d734: mov        dword ptr [rdi + 0xc], edx
14085d737: mov        byte ptr [rip + 0x781aa4f], 0
14085d73e: xor        ecx, ecx
14085d740: mov        byte ptr [rip + 0x781aa48], cl
14085d746: test       al, al
14085d748: jne        0x14085d755
14085d74a: mov        rax, qword ptr [rsi]
14085d74d: shl        rax, 1
14085d750: test       rax, rax
14085d753: jne        0x14085d78a
14085d755: xor        eax, eax
14085d757: xchg       byte ptr [rip + 0x781aa03], al
14085d75d: cmp        al, 2
14085d75f: je         0x14085d770
14085d761: add        rsp, 0x20
14085d765: pop        rbx
14085d766: pop        rbp
14085d767: pop        rdi
14085d768: pop        rsi
14085d769: pop        r12
14085d76b: pop        r14
14085d76d: pop        r15
14085d76f: ret
14085d770: lea        rcx, [rip + 0x781a9e9]
14085d777: add        rsp, 0x20
14085d77b: pop        rbx
14085d77c: pop        rbp
14085d77d: pop        rdi
14085d77e: pop        rsi
14085d77f: pop        r12
14085d781: pop        r14
14085d783: pop        r15
14085d785: jmp        0x145dbc2b0
14085d78a: call       0x145dbcf80
14085d78f: test       al, al
14085d791: jne        0x14085d755
14085d793: mov        byte ptr [rip + 0x781a9c7], 1
14085d79a: jmp        0x14085d755
