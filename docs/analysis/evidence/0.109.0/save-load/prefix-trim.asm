14115ace0: 56 push rsi
14115ace1: 57 push rdi
14115ace2: 53 push rbx
14115ace3: 4889c8 mov rax, rcx
14115ace6: 4885d2 test rdx, rdx
14115ace9: 0f8442010000 je 0x14115ae31
14115acef: 4c8d0410 lea r8, [rax + rdx]
14115acf3: 31c9 xor ecx, ecx
14115acf5: 4c8b0d84fdf206 mov r9, qword ptr [rip + 0x6f2fd84]
14115acfc: 4989c3 mov r11, rax
14115acff: eb2e jmp 0x14115ad2f
14115ad01: 400fb6f6 movzx esi, sil
14115ad05: 410fb61c31 movzx ebx, byte ptr [r9 + rsi]
14115ad0a: d0eb shr bl, 1
14115ad0c: f6c301 test bl, 1
14115ad0f: 0f841e010000 je 0x14115ae33
14115ad15: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
14115ad20: 4c29d1 sub rcx, r10
14115ad23: 4c01d9 add rcx, r11
14115ad26: 4d39c3 cmp r11, r8
14115ad29: 0f84fd000000 je 0x14115ae2c
14115ad2f: 4d89da mov r10, r11
14115ad32: 450fb61b movzx r11d, byte ptr [r11]
14115ad36: 410fb6f3 movzx esi, r11b
14115ad3a: 4084f6 test sil, sil
14115ad3d: 7811 js 0x14115ad50
14115ad3f: 4d8d5a01 lea r11, [r10 + 1]
14115ad43: 8d7ef7 lea edi, [rsi - 9]
14115ad46: 83ff05 cmp edi, 5
14115ad49: 72d5 jb 0x14115ad20
14115ad4b: e980000000 jmp 0x14115add0
14115ad50: 89f7 mov edi, esi
14115ad52: 83e71f and edi, 0x1f
14115ad55: 410fb65a01 movzx ebx, byte ptr [r10 + 1]
14115ad5a: 83e33f and ebx, 0x3f
14115ad5d: 4080fedf cmp sil, 0xdf
14115ad61: 7638 jbe 0x14115ad9b
14115ad63: 410fb67202 movzx esi, byte ptr [r10 + 2]
14115ad68: c1e306 shl ebx, 6
14115ad6b: 83e63f and esi, 0x3f
14115ad6e: 09de or esi, ebx
14115ad70: 4180fbf0 cmp r11b, 0xf0
14115ad74: 723e jb 0x14115adb4
14115ad76: 4d8d5a04 lea r11, [r10 + 4]
14115ad7a: 410fb65a03 movzx ebx, byte ptr [r10 + 3]
14115ad7f: 83e707 and edi, 7
14115ad82: c1e712 shl edi, 0x12
14115ad85: c1e606 shl esi, 6
14115ad88: 83e33f and ebx, 0x3f
14115ad8b: 09f3 or ebx, esi
14115ad8d: 09fb or ebx, edi
14115ad8f: 89de mov esi, ebx
14115ad91: 8d7ef7 lea edi, [rsi - 9]
14115ad94: 83ff05 cmp edi, 5
14115ad97: 7287 jb 0x14115ad20
14115ad99: eb35 jmp 0x14115add0
14115ad9b: 4d8d5a02 lea r11, [r10 + 2]
14115ad9f: c1e706 shl edi, 6
14115ada2: 09df or edi, ebx
14115ada4: 89fe mov esi, edi
14115ada6: 8d7ef7 lea edi, [rsi - 9]
14115ada9: 83ff05 cmp edi, 5
14115adac: 0f826effffff jb 0x14115ad20
14115adb2: eb1c jmp 0x14115add0
14115adb4: 4d8d5a03 lea r11, [r10 + 3]
14115adb8: c1e70c shl edi, 0xc
14115adbb: 09fe or esi, edi
14115adbd: 8d7ef7 lea edi, [rsi - 9]
14115adc0: 83ff05 cmp edi, 5
14115adc3: 0f8257ffffff jb 0x14115ad20
14115adc9: 0f1f8000000000 nop dword ptr [rax]
14115add0: 83fe20 cmp esi, 0x20
14115add3: 0f8447ffffff je 0x14115ad20
14115add9: 81fe85000000 cmp esi, 0x85
14115addf: 7252 jb 0x14115ae33
14115ade1: 89f7 mov edi, esi
14115ade3: c1ef08 shr edi, 8
14115ade6: 83ff1f cmp edi, 0x1f
14115ade9: 7f17 jg 0x14115ae02
14115adeb: 85ff test edi, edi
14115aded: 742f je 0x14115ae1e
14115adef: 83ff16 cmp edi, 0x16
14115adf2: 753f jne 0x14115ae33
14115adf4: 81fe80160000 cmp esi, 0x1680
14115adfa: 0f94c3 sete bl
14115adfd: e90affffff jmp 0x14115ad0c
14115ae02: 83ff20 cmp edi, 0x20
14115ae05: 0f84f6feffff je 0x14115ad01
14115ae0b: 83ff30 cmp edi, 0x30
14115ae0e: 7523 jne 0x14115ae33
14115ae10: 81fe00300000 cmp esi, 0x3000
14115ae16: 0f94c3 sete bl
14115ae19: e9eefeffff jmp 0x14115ad0c
14115ae1e: 400fb6f6 movzx esi, sil
14115ae22: 410fb61c31 movzx ebx, byte ptr [r9 + rsi]
14115ae27: e9e0feffff jmp 0x14115ad0c
14115ae2c: 4889d1 mov rcx, rdx
14115ae2f: eb02 jmp 0x14115ae33
14115ae31: 31c9 xor ecx, ecx
14115ae33: 4829ca sub rdx, rcx
14115ae36: 4801c8 add rax, rcx
14115ae39: 5b pop rbx
14115ae3a: 5f pop rdi
14115ae3b: 5e pop rsi
14115ae3c: c3 ret
