14594ad5c: f30f10b360010000 movss xmm6, dword ptr [rbx + 0x160]
14594ad64: f30f108364010000 movss xmm0, dword ptr [rbx + 0x164]
14594ad6c: e886ec3a00 call 0x145cf99f7
14594ad71: f34c0f2cc0 cvttss2si r8, xmm0
14594ad76: 0f2ec7 ucomiss xmm0, xmm7
14594ad79: 440f42c6 cmovb r8d, esi
14594ad7d: 410f2ec1 ucomiss xmm0, xmm9
14594ad81: 41bfffffffff mov r15d, 0xffffffff
14594ad87: 450f47c7 cmova r8d, r15d
14594ad8b: 48c785a800000000000000 mov qword ptr [rbp + 0xa8], 0
14594ad96: 48c785b800000000000000 mov qword ptr [rbp + 0xb8], 0
14594ada1: 488d9da8000000 lea rbx, [rbp + 0xa8]
14594ada8: 4889d9 mov rcx, rbx
14594adab: 66ba1c00 mov dx, 0x1c
14594adaf: e80c6b0500 call 0x1459a18c0
14594adb4: 90 nop
14594adb5: 0f28c6 movaps xmm0, xmm6
14594adb8: e83aec3a00 call 0x145cf99f7
14594adbd: f34c0f2cc0 cvttss2si r8, xmm0
14594adc2: 0f2ec7 ucomiss xmm0, xmm7
14594adc5: 440f42c6 cmovb r8d, esi
14594adc9: 410f2ec1 ucomiss xmm0, xmm9
14594adcd: 450f47c7 cmova r8d, r15d
14594add1: 4889d9 mov rcx, rbx
14594add4: 66ba1600 mov dx, 0x16
14594add8: e8e36a0500 call 0x1459a18c0
14594addd: 90 nop
14594adde: c7852803000000000000 mov dword ptr [rbp + 0x328], 0
14594ade8: 48c7851003000000000000 mov qword ptr [rbp + 0x310], 0
14594adf3: 48c7851803000001000000 mov qword ptr [rbp + 0x318], 1
14594adfe: 48c7852003000000000000 mov qword ptr [rbp + 0x320], 0
14594ae09: 4883bdb800000000 cmp qword ptr [rbp + 0xb8], 0
14594ae11: 745d je 0x14594ae70
14594ae13: c6859703000001 mov byte ptr [rbp + 0x397], 1
14594ae1a: 488d8d10030000 lea rcx, [rbp + 0x310]
14594ae21: e85a0e5500 call 0x145e9bc80
14594ae26: 90 nop
14594ae27: 488b8518030000 mov rax, qword ptr [rbp + 0x318]
14594ae2e: c60000 mov byte ptr [rax], 0
14594ae31: 48c7852003000001000000 mov qword ptr [rbp + 0x320], 1
14594ae3c: c6859703000001 mov byte ptr [rbp + 0x397], 1
14594ae43: 4c89f1 mov rcx, r14
14594ae46: 488d9510030000 lea rdx, [rbp + 0x310]
14594ae4d: e8bebff6ff call 0x1458b6e10
14594ae52: 90 nop
14594ae53: c6859703000001 mov byte ptr [rbp + 0x397], 1
14594ae5a: 4889d9 mov rcx, rbx
14594ae5d: 488d9510030000 lea rdx, [rbp + 0x310]
14594ae64: e807fcf5ff call 0x1458aaa70
14594ae69: 90 nop
14594ae6a: ff8528030000 inc dword ptr [rbp + 0x328]
14594ae70: 488b8510030000 mov rax, qword ptr [rbp + 0x310]
14594ae77: 488b8d18030000 mov rcx, qword ptr [rbp + 0x318]
14594ae7e: 488b9520030000 mov rdx, qword ptr [rbp + 0x320]
14594ae85: 488995a0020000 mov qword ptr [rbp + 0x2a0], rdx
14594ae8c: 8b9528030000 mov edx, dword ptr [rbp + 0x328]
14594ae92: 8995a8020000 mov dword ptr [rbp + 0x2a8], edx
14594ae98: 8b952c030000 mov edx, dword ptr [rbp + 0x32c]
14594ae9e: 8995ac020000 mov dword ptr [rbp + 0x2ac], edx
14594aea4: 48898590020000 mov qword ptr [rbp + 0x290], rax
14594aeab: 48898d98020000 mov qword ptr [rbp + 0x298], rcx
14594aeb2: c6859703000000 mov byte ptr [rbp + 0x397], 0
14594aeb9: 488d8d20020000 lea rcx, [rbp + 0x220]
14594aec0: 488d9590020000 lea rdx, [rbp + 0x290]
14594aec7: e8c4c5f5ff call 0x1458a7490
14594aecc: 90 nop
14594aecd: 488b8598030000 mov rax, qword ptr [rbp + 0x398]
14594aed4: 488bb030060000 mov rsi, qword ptr [rax + 0x630]
14594aedb: 483bb020060000 cmp rsi, qword ptr [rax + 0x620]
14594aee2: 750d jne 0x14594aef1
14594aee4: 488b8da0030000 mov rcx, qword ptr [rbp + 0x3a0]
14594aeeb: e8f0f13a00 call 0x145cfa0e0
14594aef0: 90 nop
14594aef1: 488b9598030000 mov rdx, qword ptr [rbp + 0x398]
14594aef8: 488b8228060000 mov rax, qword ptr [rdx + 0x628]
14594aeff: 4889f1 mov rcx, rsi
14594af02: 48c1e105 shl rcx, 5
14594af06: 0f108520020000 movups xmm0, xmmword ptr [rbp + 0x220]
14594af0d: 0f108d30020000 movups xmm1, xmmword ptr [rbp + 0x230]
14594af14: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14594af19: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14594af1d: 48ffc6 inc rsi
14594af20: 4889b230060000 mov qword ptr [rdx + 0x630], rsi
14594af27: c6859703000000 mov byte ptr [rbp + 0x397], 0
14594af2e: ba18000000 mov edx, 0x18
14594af33: 488d0d34219c01 lea rcx, [rip + 0x19c2134]
14594af3a: e8e1a7f4ff call 0x145895720
