14594b39b: 488b8548020000 mov rax, qword ptr [rbp + 0x248]
14594b3a2: 488b9098050000 mov rdx, qword ptr [rax + 0x598]
14594b3a9: 4939d4 cmp r12, rdx
14594b3ac: 0f8333190000 jae 0x14594cce5
14594b3b2: 49c1e407 shl r12, 7
14594b3b6: 4c03a090050000 add r12, qword ptr [rax + 0x590]
14594b3bd: f30f10b0340a0000 movss xmm6, dword ptr [rax + 0xa34]
14594b3c5: e8366e6bfa call 0x140002200
14594b3ca: b901000000 mov ecx, 1
14594b3cf: ba01000000 mov edx, 1
14594b3d4: e8e76d6bfa call 0x1400021c0
14594b3d9: 4885c0 test rax, rax
14594b3dc: 0f84ee180000 je 0x14594ccd0
14594b3e2: c6007b mov byte ptr [rax], 0x7b
14594b3e5: 48c785e001000001000000 mov qword ptr [rbp + 0x1e0], 1
14594b3f0: 488985e8010000 mov qword ptr [rbp + 0x1e8], rax
14594b3f7: 48c785f001000001000000 mov qword ptr [rbp + 0x1f0], 1
14594b402: c685f801000001 mov byte ptr [rbp + 0x1f8], 1
14594b409: 488d0575528a01 lea rax, [rip + 0x18a5275]
14594b410: 4889442420 mov qword ptr [rsp + 0x20], rax
14594b415: 48c744242802000000 mov qword ptr [rsp + 0x28], 2
14594b41e: 41b904000000 mov r9d, 4
14594b424: 488db580010000 lea rsi, [rbp + 0x180]
14594b42b: 4889f1 mov rcx, rsi
14594b42e: 488dbde0010000 lea rdi, [rbp + 0x1e0]
14594b435: 4889fa mov rdx, rdi
14594b438: 4c8d05eb4f8a01 lea r8, [rip + 0x18a4feb]
14594b43f: e86c95f9ff call 0x1458e49b0
14594b444: 90 nop
14594b445: 418b44243c mov eax, dword ptr [r12 + 0x3c]
14594b44a: 89442420 mov dword ptr [rsp + 0x20], eax
14594b44e: 41b902000000 mov r9d, 2
14594b454: 4889f9 mov rcx, rdi
14594b457: 4889f2 mov rdx, rsi
14594b45a: 4c8d0526528a01 lea r8, [rip + 0x18a5226]
14594b461: e83a47f9ff call 0x1458dfba0
14594b466: 90 nop
14594b467: 418b5c2410 mov ebx, dword ptr [r12 + 0x10]
14594b46c: b805000000 mov eax, 5
14594b471: 488d0d1c768a01 lea rcx, [rip + 0x18a761c]
14594b478: 48631499 movsxd rdx, dword ptr [rcx + rbx*4]
14594b47c: 4801ca add rdx, rcx
14594b47f: 488d0d07528a01 lea rcx, [rip + 0x18a5207]
14594b486: ffe2 jmp rdx
14594b488: b804000000 mov eax, 4
14594b48d: 41807c247d00 cmp byte ptr [r12 + 0x7d], 0
14594b493: 488d0d444f8a01 lea rcx, [rip + 0x18a4f44]
14594b49a: 750c jne 0x14594b4a8
14594b49c: b806000000 mov eax, 6
14594b4a1: 488d0dea518a01 lea rcx, [rip + 0x18a51ea]
14594b4a8: 4889442428 mov qword ptr [rsp + 0x28], rax
14594b4ad: 48894c2420 mov qword ptr [rsp + 0x20], rcx
14594b4b2: 41b904000000 mov r9d, 4
14594b4b8: 4889f1 mov rcx, rsi
14594b4bb: 4889fa mov rdx, rdi
14594b4be: 4c8d05d3518a01 lea r8, [rip + 0x18a51d3]
14594b4c5: e8e694f9ff call 0x1458e49b0
14594b4ca: 90 nop
14594b4cb: f3410f10442440 movss xmm0, dword ptr [r12 + 0x40]
14594b4d2: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14594b4d8: 41b901000000 mov r9d, 1
14594b4de: 4889f9 mov rcx, rdi
14594b4e1: 4889f2 mov rdx, rsi
14594b4e4: 4c8d05b1518a01 lea r8, [rip + 0x18a51b1]
14594b4eb: e83045f9ff call 0x1458dfa20
14594b4f0: 90 nop
14594b4f1: f3410f10442444 movss xmm0, dword ptr [r12 + 0x44]
14594b4f8: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14594b4fe: 41b901000000 mov r9d, 1
14594b504: 4889f1 mov rcx, rsi
14594b507: 4889fa mov rdx, rdi
14594b50a: 4c8d058c518a01 lea r8, [rip + 0x18a518c]
14594b511: e80a45f9ff call 0x1458dfa20
14594b516: 90 nop
14594b517: f3410f10442448 movss xmm0, dword ptr [r12 + 0x48]
14594b51e: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14594b524: 41b901000000 mov r9d, 1
14594b52a: 4889f9 mov rcx, rdi
14594b52d: 4889f2 mov rdx, rsi
14594b530: 4c8d0567518a01 lea r8, [rip + 0x18a5167]
14594b537: e8e444f9ff call 0x1458dfa20
14594b53c: 90 nop
14594b53d: f3410f1044244c movss xmm0, dword ptr [r12 + 0x4c]
14594b544: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14594b54a: 41b901000000 mov r9d, 1
14594b550: 488d8df0000000 lea rcx, [rbp + 0xf0]
14594b557: 4889fa mov rdx, rdi
14594b55a: 4c8d053e518a01 lea r8, [rip + 0x18a513e]
14594b561: e8ba44f9ff call 0x1458dfa20
14594b566: 90 nop
14594b567: 418b442430 mov eax, dword ptr [r12 + 0x30]
14594b56c: f3410f107c2434 movss xmm7, dword ptr [r12 + 0x34]
14594b573: 488d0d36758a01 lea rcx, [rip + 0x18a7536]
14594b57a: 48630481 movsxd rax, dword ptr [rcx + rax*4]
14594b57e: 4801c8 add rax, rcx
14594b581: ffe0 jmp rax
14594b583: 0f1085f0000000 movups xmm0, xmmword ptr [rbp + 0xf0]
14594b58a: 0f108d00010000 movups xmm1, xmmword ptr [rbp + 0x100]
14594b591: 0f298df0010000 movaps xmmword ptr [rbp + 0x1f0], xmm1
14594b598: 0f2985e0010000 movaps xmmword ptr [rbp + 0x1e0], xmm0
14594b59f: 488d05ff508a01 lea rax, [rip + 0x18a50ff]
14594b5a6: 4889442420 mov qword ptr [rsp + 0x20], rax
14594b5ab: 48c744242806000000 mov qword ptr [rsp + 0x28], 6
14594b5b4: 41b905000000 mov r9d, 5
14594b5ba: 4889f1 mov rcx, rsi
14594b5bd: 488d95e0010000 lea rdx, [rbp + 0x1e0]
14594b5c4: 4c8d05d5508a01 lea r8, [rip + 0x18a50d5]
14594b5cb: e8e093f9ff call 0x1458e49b0
14594b5d0: 90 nop
14594b5d1: f30f117c2420 movss dword ptr [rsp + 0x20], xmm7
14594b5d7: 41b901000000 mov r9d, 1
14594b5dd: 488d8d40010000 lea rcx, [rbp + 0x140]
14594b5e4: 4889f2 mov rdx, rsi
14594b5e7: 4c8d05bd508a01 lea r8, [rip + 0x18a50bd]
14594b5ee: e82d44f9ff call 0x1458dfa20
14594b5f3: 90 nop
14594b5f4: e943020000 jmp 0x14594b83c
