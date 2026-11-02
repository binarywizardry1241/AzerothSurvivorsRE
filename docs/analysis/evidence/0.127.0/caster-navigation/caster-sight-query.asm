145c3d50a: 498b8e00010000 mov rcx, qword ptr [r14 + 0x100]
145c3d511: 4885c9 test rcx, rcx
145c3d514: 741b je 0x145c3d531
145c3d516: 8b01 mov eax, dword ptr [rcx]
145c3d518: a801 test al, 1
145c3d51a: 7436 je 0x145c3d552
145c3d51c: f3440f104108 movss xmm8, dword ptr [rcx + 8]
145c3d522: 450f28e8 movaps xmm13, xmm8
145c3d526: f3440f582df9266100 addss xmm13, dword ptr [rip + 0x6126f9]
145c3d52f: eb37 jmp 0x145c3d568
145c3d531: f3450f10ae8c010000 movss xmm13, dword ptr [r14 + 0x18c]
145c3d53a: 450f28c5 movaps xmm8, xmm13
145c3d53e: f3440f590599826200 mulss xmm8, dword ptr [rip + 0x628299]
145c3d547: b001 mov al, 1
145c3d549: 31db xor ebx, ebx
145c3d54b: 31f6 xor esi, esi
145c3d54d: e902010000 jmp 0x145c3d654
145c3d552: f3450f10ae8c010000 movss xmm13, dword ptr [r14 + 0x18c]
145c3d55b: 450f28c5 movaps xmm8, xmm13
145c3d55f: f3440f590578826200 mulss xmm8, dword ptr [rip + 0x628278]
145c3d568: 83f801 cmp eax, 1
145c3d56b: 0f85d2000000 jne 0x145c3d643
145c3d571: 488bb598000000 mov rsi, qword ptr [rbp + 0x98]
145c3d578: f30f108ec8000000 movss xmm1, dword ptr [rsi + 0xc8]
145c3d580: 410f28c1 movaps xmm0, xmm9
145c3d584: f30f5cc1 subss xmm0, xmm1
145c3d588: f3410f16c9 movshdup xmm1, xmm9
145c3d58d: f30f5c8ecc000000 subss xmm1, dword ptr [rsi + 0xcc]
145c3d595: e8e1414200 call 0x14606177b
145c3d59a: 0f2e86d8000000 ucomiss xmm0, dword ptr [rsi + 0xd8]
145c3d5a1: 0f97c3 seta bl
145c3d5a4: 40b601 mov sil, 1
145c3d5a7: 4883bdf8010000ff cmp qword ptr [rbp + 0x1f8], -1
145c3d5af: 0f8496000000 je 0x145c3d64b
145c3d5b5: 488bbd70030000 mov rdi, qword ptr [rbp + 0x370]
145c3d5bc: c685c703000001 mov byte ptr [rbp + 0x3c7], 1
145c3d5c3: c685c603000001 mov byte ptr [rbp + 0x3c6], 1
145c3d5ca: c685c503000001 mov byte ptr [rbp + 0x3c5], 1
145c3d5d1: c685c403000001 mov byte ptr [rbp + 0x3c4], 1
145c3d5d8: c685c303000001 mov byte ptr [rbp + 0x3c3], 1
145c3d5df: c685c203000001 mov byte ptr [rbp + 0x3c2], 1
145c3d5e6: c685c103000001 mov byte ptr [rbp + 0x3c1], 1
145c3d5ed: c685c003000001 mov byte ptr [rbp + 0x3c0], 1
145c3d5f4: c685bf03000001 mov byte ptr [rbp + 0x3bf], 1
145c3d5fb: c685be03000001 mov byte ptr [rbp + 0x3be], 1
145c3d602: c685bd03000001 mov byte ptr [rbp + 0x3bd], 1
145c3d609: c685bc03000001 mov byte ptr [rbp + 0x3bc], 1
145c3d610: c685bb03000001 mov byte ptr [rbp + 0x3bb], 1
145c3d617: 488b8d00020000 mov rcx, qword ptr [rbp + 0x200]
145c3d61e: 4889fa mov rdx, rdi
145c3d621: 4c8b85f0010000 mov r8, qword ptr [rbp + 0x1f0]
145c3d628: e863b6f5ff call 0x145b98c90
145c3d62d: 90 nop
145c3d62e: 664c0f6ecf movq xmm9, rdi
145c3d633: 4c8ba5a0030000 mov r12, qword ptr [rbp + 0x3a0]
145c3d63a: 4c8bb598030000 mov r14, qword ptr [rbp + 0x398]
145c3d641: eb11 jmp 0x145c3d654
145c3d643: 31db xor ebx, ebx
145c3d645: b001 mov al, 1
145c3d647: 31f6 xor esi, esi
145c3d649: eb09 jmp 0x145c3d654
145c3d64b: b001 mov al, 1
145c3d64d: 4c8ba5a0030000 mov r12, qword ptr [rbp + 0x3a0]
