14058d450: 56 push rsi
14058d451: 57 push rdi
14058d452: 53 push rbx
14058d453: 4883ec20 sub rsp, 0x20
14058d457: 4889ce mov rsi, rcx
14058d45a: 8b05f83dab07 mov eax, dword ptr [rip + 0x7ab3df8]
14058d460: 85c0 test eax, eax
14058d462: 753f jne 0x14058d4a3
14058d464: b101 mov cl, 1
14058d466: 31c0 xor eax, eax
14058d468: f00fb00d103dab07 lock cmpxchg byte ptr [rip + 0x7ab3d10], cl
14058d470: 754b jne 0x14058d4bd
14058d472: 488b3d6fd5af07 mov rdi, qword ptr [rip + 0x7afd56f]
14058d479: 488b0f mov rcx, qword ptr [rdi]
14058d47c: 48d1e1 shl rcx, 1
14058d47f: 31db xor ebx, ebx
14058d481: b800000000 mov eax, 0
14058d486: 4885c9 test rcx, rcx
14058d489: 7540 jne 0x14058d4cb
14058d48b: 0fb60def3cab07 movzx ecx, byte ptr [rip + 0x7ab3cef]
14058d492: f6050f3dab0701 test byte ptr [rip + 0x7ab3d0f], 1
14058d499: 7547 jne 0x14058d4e2
14058d49b: 891e mov dword ptr [rsi], ebx
14058d49d: 84c0 test al, al
14058d49f: 7464 je 0x14058d505
14058d4a1: eb6d jmp 0x14058d510
14058d4a3: 488d0dd63cab07 lea rcx, [rip + 0x7ab3cd6]
14058d4aa: e87c9f6905 call 0x145c2742b
14058d4af: b101 mov cl, 1
14058d4b1: 31c0 xor eax, eax
14058d4b3: f00fb00dc53cab07 lock cmpxchg byte ptr [rip + 0x7ab3cc5], cl
14058d4bb: 74b5 je 0x14058d472
14058d4bd: 488d0dbc3cab07 lea rcx, [rip + 0x7ab3cbc]
14058d4c4: e897a48005 call 0x145d97960
14058d4c9: eba7 jmp 0x14058d472
14058d4cb: e820b28005 call 0x145d986f0
14058d4d0: 3401 xor al, 1
14058d4d2: 0fb60da83cab07 movzx ecx, byte ptr [rip + 0x7ab3ca8]
14058d4d9: f605c83cab0701 test byte ptr [rip + 0x7ab3cc8], 1
14058d4e0: 74b9 je 0x14058d49b
14058d4e2: 488b0db73cab07 mov rcx, qword ptr [rip + 0x7ab3cb7]
14058d4e9: 48894e04 mov qword ptr [rsi + 4], rcx
14058d4ed: f20f1005573dab07 movsd xmm0, qword ptr [rip + 0x7ab3d57]
14058d4f5: f20f11460c movsd qword ptr [rsi + 0xc], xmm0
14058d4fa: bb01000000 mov ebx, 1
14058d4ff: 891e mov dword ptr [rsi], ebx
14058d501: 84c0 test al, al
14058d503: 750b jne 0x14058d510
14058d505: 488b07 mov rax, qword ptr [rdi]
14058d508: 48d1e0 shl rax, 1
14058d50b: 4885c0 test rax, rax
14058d50e: 7525 jne 0x14058d535
14058d510: 31c0 xor eax, eax
14058d512: 8605683cab07 xchg byte ptr [rip + 0x7ab3c68], al
14058d518: 3c02 cmp al, 2
14058d51a: 740b je 0x14058d527
14058d51c: 4889f0 mov rax, rsi
14058d51f: 4883c420 add rsp, 0x20
14058d523: 5b pop rbx
14058d524: 5f pop rdi
14058d525: 5e pop rsi
14058d526: c3 ret
14058d527: 488d0d523cab07 lea rcx, [rip + 0x7ab3c52]
14058d52e: e8eda48005 call 0x145d97a20
14058d533: ebe7 jmp 0x14058d51c
14058d535: e8b6b18005 call 0x145d986f0
14058d53a: 84c0 test al, al
14058d53c: 75d2 jne 0x14058d510
14058d53e: c6053c3cab0701 mov byte ptr [rip + 0x7ab3c3c], 1
14058d545: ebc9 jmp 0x14058d510
