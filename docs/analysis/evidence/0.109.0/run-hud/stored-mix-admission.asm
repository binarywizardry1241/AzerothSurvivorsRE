144c84ca0 56 push rsi
144c84ca1 57 push rdi
144c84ca2 4881eca8000000 sub rsp, 0xa8
144c84ca9 440f29a42490000000 movaps xmmword ptr [rsp + 0x90], xmm12
144c84cb2 440f299c2480000000 movaps xmmword ptr [rsp + 0x80], xmm11
144c84cbb 440f29542470 movaps xmmword ptr [rsp + 0x70], xmm10
144c84cc1 440f294c2460 movaps xmmword ptr [rsp + 0x60], xmm9
144c84cc7 440f29442450 movaps xmmword ptr [rsp + 0x50], xmm8
144c84ccd 0f297c2440 movaps xmmword ptr [rsp + 0x40], xmm7
144c84cd2 0f29742430 movaps xmmword ptr [rsp + 0x30], xmm6
144c84cd7 0f28f3 movaps xmm6, xmm3
144c84cda 4889ce mov rsi, rcx
144c84cdd 8b3a mov edi, dword ptr [rdx]
144c84cdf 440f104204 movups xmm8, xmmword ptr [rdx + 4]
144c84ce4 f3440f100db3851101 movss xmm9, dword ptr [rip + 0x11185b3]
144c84ced f3440f5ccb subss xmm9, xmm3
144c84cf2 488d05f3a8e601 lea rax, [rip + 0x1e6a8f3]
144c84cf9 48630cb8 movsxd rcx, dword ptr [rax + rdi*4]
144c84cfd 4801c1 add rcx, rax
144c84d00 ffe1 jmp rcx
144c84d02 488d4c2420 lea rcx, [rsp + 0x20]
144c84d07 4c89c2 mov rdx, r8
144c84d0a e8010f0000 call 0x144c85c10
144c84d0f e91a010000 jmp 0x144c84e2e
