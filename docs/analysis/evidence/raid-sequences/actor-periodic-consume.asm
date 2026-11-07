14597bec5: 8b85f0020000 mov eax, dword ptr [rbp + 0x2f0]
14597becb: 88442428 mov byte ptr [rsp + 0x28], al
14597becf: 4488742420 mov byte ptr [rsp + 0x20], r14b
14597bed4: c644243001 mov byte ptr [rsp + 0x30], 1
14597bed9: 4c89f9 mov rcx, r15
14597bedc: 4889fa mov rdx, rdi
14597bedf: 0f28d7 movaps xmm2, xmm7
14597bee2: 4589e1 mov r9d, r12d
14597bee5: e8a655ffff call 0x145971490
14597beea: 90 nop
14597beeb: 4983c528 add r13, 0x28
14597beef: 41c6879401000000 mov byte ptr [r15 + 0x194], 0
14597bef7: 49c7473000000000 mov qword ptr [r15 + 0x30], 0
14597beff: 4188b795010000 mov byte ptr [r15 + 0x195], sil
14597bf06: 450f2ee3 ucomiss xmm12, xmm11
14597bf0a: 66be1c00 mov si, 0x1c
14597bf0e: 66bf1600 mov di, 0x16
14597bf12: 0f86adfdffff jbe 0x14597bcc5
