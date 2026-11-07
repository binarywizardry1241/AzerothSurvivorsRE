140067b70: 4883ec38 sub rsp, 0x38
140067b74: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
140067b79: 4889d1 mov rcx, rdx
140067b7c: 0f28f0 movaps xmm6, xmm0
140067b7f: 4c89c2 mov rdx, r8
140067b82: 4983f820 cmp r8, 0x20
140067b86: 7318 jae 0x140067ba0
140067b88: e803dab605 call 0x145bd5590
140067b8d: 4883f80d cmp rax, 0xd
140067b91: 7318 jae 0x140067bab
140067b93: 0f28c6 movaps xmm0, xmm6
140067b96: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
140067b9b: 4883c438 add rsp, 0x38
140067b9f: c3 ret
140067ba0: e8cbd3b605 call 0x145bd4f70
140067ba5: 4883f80d cmp rax, 0xd
140067ba9: 72e8 jb 0x140067b93
140067bab: 4885c0 test rax, rax
140067bae: 780a js 0x140067bba
140067bb0: 0f57c0 xorps xmm0, xmm0
140067bb3: f3480f2ac0 cvtsi2ss xmm0, rax
140067bb8: eb18 jmp 0x140067bd2
140067bba: 4889c1 mov rcx, rax
140067bbd: 48d1e9 shr rcx, 1
140067bc0: 83e001 and eax, 1
140067bc3: 4809c8 or rax, rcx
140067bc6: 0f57c0 xorps xmm0, xmm0
140067bc9: f3480f2ac0 cvtsi2ss xmm0, rax
140067bce: f30f58c0 addss xmm0, xmm0
140067bd2: f30f58057653d605 addss xmm0, dword ptr [rip + 0x5d65376]
140067bda: f30f59057253d605 mulss xmm0, dword ptr [rip + 0x5d65372]
140067be2: f30f5805b656d305 addss xmm0, dword ptr [rip + 0x5d356b6]
140067bea: f30f59f0 mulss xmm6, xmm0
140067bee: 0f28c6 movaps xmm0, xmm6
140067bf1: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
140067bf6: 4883c438 add rsp, 0x38
140067bfa: c3 ret
