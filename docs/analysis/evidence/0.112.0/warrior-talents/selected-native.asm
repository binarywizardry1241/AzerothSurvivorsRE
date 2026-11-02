; victim-multiplier: exact0.112.0 bytes 0x14593ed6c..0x14593f188
14593ed6c: f3410f105416d4 movss xmm2, dword ptr [r14 + rdx - 0x2c]
14593ed73: 0f2ed1 ucomiss xmm2, xmm1
14593ed76: 771b ja 0x14593ed93
14593ed78: f3410f1094162cffffff movss xmm2, dword ptr [r14 + rdx - 0xd4]
14593ed82: 0f2ed1 ucomiss xmm2, xmm1
14593ed85: 770c ja 0x14593ed93
14593ed87: f3410f105416e0 movss xmm2, dword ptr [r14 + rdx - 0x20]
14593ed8e: 0f2ed1 ucomiss xmm2, xmm1
14593ed91: 7633 jbe 0x14593edc6
14593ed93: 4c8b9700080000 mov r10, qword ptr [rdi + 0x800]
14593ed9a: 4d85d2 test r10, r10
14593ed9d: 7427 je 0x14593edc6
14593ed9f: 4c8b87f8070000 mov r8, qword ptr [rdi + 0x7f8]
14593eda6: 4983fa01 cmp r10, 1
14593edaa: 7537 jne 0x14593ede3
14593edac: f3440f10052be74600 movss xmm8, dword ptr [rip + 0x46e72b]
14593edb5: 4531c9 xor r9d, r9d
14593edb8: e981000000 jmp 0x14593ee3e
14593edbd: 440f28c0 movaps xmm8, xmm0
14593edc1: e9c2030000 jmp 0x14593f188
14593edc6: f3440f100591e44600 movss xmm8, dword ptr [rip + 0x46e491]
14593edcf: 4983bc1640feffffff cmp qword ptr [r14 + rdx - 0x1c0], -1
14593edd8: 0f858a000000 jne 0x14593ee68
14593edde: e97d000000 jmp 0x14593ee60
14593ede3: 4d89d3 mov r11, r10
14593ede6: 4983e3fe and r11, 0xfffffffffffffffe
14593edea: f3440f1005ede64600 movss xmm8, dword ptr [rip + 0x46e6ed]
14593edf3: 4531c9 xor r9d, r9d
14593edf6: eb11 jmp 0x14593ee09
14593edf8: 0f1f840000000000 nop dword ptr [rax + rax]
14593ee00: 4983c102 add r9, 2
14593ee04: 4d39cb cmp r11, r9
14593ee07: 742f je 0x14593ee38
14593ee09: 43803cc812 cmp byte ptr [r8 + r9*8], 0x12
14593ee0e: 7410 je 0x14593ee20
14593ee10: 43807cc80812 cmp byte ptr [r8 + r9*8 + 8], 0x12
14593ee16: 75e8 jne 0x14593ee00
14593ee18: eb15 jmp 0x14593ee2f
14593ee1a: 660f1f440000 nop word ptr [rax + rax]
14593ee20: f3470f5844c804 addss xmm8, dword ptr [r8 + r9*8 + 4]
14593ee27: 43807cc80812 cmp byte ptr [r8 + r9*8 + 8], 0x12
14593ee2d: 75d1 jne 0x14593ee00
14593ee2f: f3470f5844c80c addss xmm8, dword ptr [r8 + r9*8 + 0xc]
14593ee36: ebc8 jmp 0x14593ee00
14593ee38: 41f6c201 test r10b, 1
14593ee3c: 740e je 0x14593ee4c
14593ee3e: 43803cc812 cmp byte ptr [r8 + r9*8], 0x12
14593ee43: 7507 jne 0x14593ee4c
14593ee45: f3470f5844c804 addss xmm8, dword ptr [r8 + r9*8 + 4]
14593ee4c: f3440f58050be44600 addss xmm8, dword ptr [rip + 0x46e40b]
14593ee55: 4983bc1640feffffff cmp qword ptr [r14 + rdx - 0x1c0], -1
14593ee5e: 7508 jne 0x14593ee68
14593ee60: 41807c16f801 cmp byte ptr [r14 + rdx - 8], 1
14593ee66: 7529 jne 0x14593ee91
14593ee68: 4c8b9700080000 mov r10, qword ptr [rdi + 0x800]
14593ee6f: 4d85d2 test r10, r10
14593ee72: 7469 je 0x14593eedd
14593ee74: 4c8b87f8070000 mov r8, qword ptr [rdi + 0x7f8]
14593ee7b: 4983fa01 cmp r10, 1
14593ee7f: 7566 jne 0x14593eee7
14593ee81: f30f101557e64600 movss xmm2, dword ptr [rip + 0x46e657]
14593ee89: 4531c9 xor r9d, r9d
14593ee8c: e9ad000000 jmp 0x14593ef3e
14593ee91: f3410f10541684 movss xmm2, dword ptr [r14 + rdx - 0x7c]
14593ee98: f30f591570994700 mulss xmm2, dword ptr [rip + 0x479970]
14593eea0: 410f2e541680 ucomiss xmm2, dword ptr [r14 + rdx - 0x80]
14593eea6: 0f86c0000000 jbe 0x14593ef6c
14593eeac: 4c8b9700080000 mov r10, qword ptr [rdi + 0x800]
14593eeb3: 4d85d2 test r10, r10
14593eeb6: 0f846d010000 je 0x14593f029
14593eebc: 4c8b87f8070000 mov r8, qword ptr [rdi + 0x7f8]
14593eec3: 4983fa01 cmp r10, 1
14593eec7: 0f8566010000 jne 0x14593f033
14593eecd: f30f10150be64600 movss xmm2, dword ptr [rip + 0x46e60b]
14593eed5: 4531c9 xor r9d, r9d
14593eed8: e9b1010000 jmp 0x14593f08e
14593eedd: f30f1015fbe54600 movss xmm2, dword ptr [rip + 0x46e5fb]
14593eee5: eb65 jmp 0x14593ef4c
14593eee7: 4d89d3 mov r11, r10
14593eeea: 4983e3fe and r11, 0xfffffffffffffffe
14593eeee: f30f1015eae54600 movss xmm2, dword ptr [rip + 0x46e5ea]
14593eef6: 4531c9 xor r9d, r9d
14593eef9: eb0e jmp 0x14593ef09
14593eefb: 0f1f440000 nop dword ptr [rax + rax]
14593ef00: 4983c102 add r9, 2
14593ef04: 4d39cb cmp r11, r9
14593ef07: 742f je 0x14593ef38
14593ef09: 43803cc813 cmp byte ptr [r8 + r9*8], 0x13
14593ef0e: 7410 je 0x14593ef20
14593ef10: 43807cc80813 cmp byte ptr [r8 + r9*8 + 8], 0x13
14593ef16: 75e8 jne 0x14593ef00
14593ef18: eb15 jmp 0x14593ef2f
14593ef1a: 660f1f440000 nop word ptr [rax + rax]
14593ef20: f3430f5854c804 addss xmm2, dword ptr [r8 + r9*8 + 4]
14593ef27: 43807cc80813 cmp byte ptr [r8 + r9*8 + 8], 0x13
14593ef2d: 75d1 jne 0x14593ef00
14593ef2f: f3430f5854c80c addss xmm2, dword ptr [r8 + r9*8 + 0xc]
14593ef36: ebc8 jmp 0x14593ef00
14593ef38: 41f6c201 test r10b, 1
14593ef3c: 740e je 0x14593ef4c
14593ef3e: 43803cc813 cmp byte ptr [r8 + r9*8], 0x13
14593ef43: 7507 jne 0x14593ef4c
14593ef45: f3430f5854c804 addss xmm2, dword ptr [r8 + r9*8 + 4]
14593ef4c: f3440f58c2 addss xmm8, xmm2
14593ef51: f3410f10541684 movss xmm2, dword ptr [r14 + rdx - 0x7c]
14593ef58: f30f5915b0984700 mulss xmm2, dword ptr [rip + 0x4798b0]
14593ef60: 410f2e541680 ucomiss xmm2, dword ptr [r14 + rdx - 0x80]
14593ef66: 0f8740ffffff ja 0x14593eeac
14593ef6c: 4983bc1638feffff00 cmp qword ptr [r14 + rdx - 0x1c8], 0
14593ef75: 0f8435010000 je 0x14593f0b0
14593ef7b: 4c8b9700080000 mov r10, qword ptr [rdi + 0x800]
14593ef82: 4d85d2 test r10, r10
14593ef85: 741a je 0x14593efa1
14593ef87: 4c8b87f8070000 mov r8, qword ptr [rdi + 0x7f8]
14593ef8e: 4983fa01 cmp r10, 1
14593ef92: 7517 jne 0x14593efab
14593ef94: f30f101544e54600 movss xmm2, dword ptr [rip + 0x46e544]
14593ef9c: 4531c9 xor r9d, r9d
14593ef9f: eb5d jmp 0x14593effe
14593efa1: f30f101537e54600 movss xmm2, dword ptr [rip + 0x46e537]
14593efa9: eb61 jmp 0x14593f00c
14593efab: 4d89d3 mov r11, r10
14593efae: 4983e3fe and r11, 0xfffffffffffffffe
14593efb2: f30f101526e54600 movss xmm2, dword ptr [rip + 0x46e526]
14593efba: 4531c9 xor r9d, r9d
14593efbd: eb0a jmp 0x14593efc9
14593efbf: 90 nop
14593efc0: 4983c102 add r9, 2
14593efc4: 4d39cb cmp r11, r9
14593efc7: 742f je 0x14593eff8
14593efc9: 43803cc815 cmp byte ptr [r8 + r9*8], 0x15
14593efce: 7410 je 0x14593efe0
14593efd0: 43807cc80815 cmp byte ptr [r8 + r9*8 + 8], 0x15
14593efd6: 75e8 jne 0x14593efc0
14593efd8: eb15 jmp 0x14593efef
14593efda: 660f1f440000 nop word ptr [rax + rax]
14593efe0: f3430f5854c804 addss xmm2, dword ptr [r8 + r9*8 + 4]
14593efe7: 43807cc80815 cmp byte ptr [r8 + r9*8 + 8], 0x15
14593efed: 75d1 jne 0x14593efc0
14593efef: f3430f5854c80c addss xmm2, dword ptr [r8 + r9*8 + 0xc]
14593eff6: ebc8 jmp 0x14593efc0
14593eff8: 41f6c201 test r10b, 1
14593effc: 740e je 0x14593f00c
14593effe: 43803cc815 cmp byte ptr [r8 + r9*8], 0x15
14593f003: 7507 jne 0x14593f00c
14593f005: f3430f5854c804 addss xmm2, dword ptr [r8 + r9*8 + 4]
14593f00c: f3440f58c2 addss xmm8, xmm2
14593f011: f3410f1094163cffffff movss xmm2, dword ptr [r14 + rdx - 0xc4]
14593f01b: 0f2ed1 ucomiss xmm2, xmm1
14593f01e: 0f879b000000 ja 0x14593f0bf
14593f024: e9a0000000 jmp 0x14593f0c9
14593f029: f30f1015afe44600 movss xmm2, dword ptr [rip + 0x46e4af]
14593f031: eb69 jmp 0x14593f09c
14593f033: 4d89d3 mov r11, r10
14593f036: 4983e3fe and r11, 0xfffffffffffffffe
14593f03a: f30f10159ee44600 movss xmm2, dword ptr [rip + 0x46e49e]
14593f042: 4531c9 xor r9d, r9d
14593f045: eb12 jmp 0x14593f059
14593f047: 660f1f840000000000 nop word ptr [rax + rax]
14593f050: 4983c102 add r9, 2
14593f054: 4d39cb cmp r11, r9
14593f057: 742f je 0x14593f088
14593f059: 43803cc814 cmp byte ptr [r8 + r9*8], 0x14
14593f05e: 7410 je 0x14593f070
14593f060: 43807cc80814 cmp byte ptr [r8 + r9*8 + 8], 0x14
14593f066: 75e8 jne 0x14593f050
14593f068: eb15 jmp 0x14593f07f
14593f06a: 660f1f440000 nop word ptr [rax + rax]
14593f070: f3430f5854c804 addss xmm2, dword ptr [r8 + r9*8 + 4]
14593f077: 43807cc80814 cmp byte ptr [r8 + r9*8 + 8], 0x14
14593f07d: 75d1 jne 0x14593f050
14593f07f: f3430f5854c80c addss xmm2, dword ptr [r8 + r9*8 + 0xc]
14593f086: ebc8 jmp 0x14593f050
14593f088: 41f6c201 test r10b, 1
14593f08c: 740e je 0x14593f09c
14593f08e: 43803cc814 cmp byte ptr [r8 + r9*8], 0x14
14593f093: 7507 jne 0x14593f09c
14593f095: f3430f5854c804 addss xmm2, dword ptr [r8 + r9*8 + 4]
14593f09c: f3440f58c2 addss xmm8, xmm2
14593f0a1: 4983bc1638feffff00 cmp qword ptr [r14 + rdx - 0x1c8], 0
14593f0aa: 0f85cbfeffff jne 0x14593ef7b
14593f0b0: f3410f1094163cffffff movss xmm2, dword ptr [r14 + rdx - 0xc4]
14593f0ba: 0f2ed1 ucomiss xmm2, xmm1
14593f0bd: 760a jbe 0x14593f0c9
14593f0bf: f3450f58841638ffffff addss xmm8, dword ptr [r14 + rdx - 0xc8]
14593f0c9: f30f1097ec040000 movss xmm2, dword ptr [rdi + 0x4ec]
14593f0d1: 0f57db xorps xmm3, xmm3
14593f0d4: 0f2ed3 ucomiss xmm2, xmm3
14593f0d7: 0f86a4000000 jbe 0x14593f181
14593f0dd: 4c8b9700080000 mov r10, qword ptr [rdi + 0x800]
14593f0e4: 4d85d2 test r10, r10
14593f0e7: 741a je 0x14593f103
14593f0e9: 4c8b87f8070000 mov r8, qword ptr [rdi + 0x7f8]
14593f0f0: 4983fa01 cmp r10, 1
14593f0f4: 7517 jne 0x14593f10d
14593f0f6: f30f1015e2e34600 movss xmm2, dword ptr [rip + 0x46e3e2]
14593f0fe: 4531c9 xor r9d, r9d
14593f101: eb6b jmp 0x14593f16e
14593f103: f30f1015d5e34600 movss xmm2, dword ptr [rip + 0x46e3d5]
14593f10b: eb6f jmp 0x14593f17c
14593f10d: 4d89d3 mov r11, r10
14593f110: 4983e3fe and r11, 0xfffffffffffffffe
14593f114: f30f1015c4e34600 movss xmm2, dword ptr [rip + 0x46e3c4]
14593f11c: 4531c9 xor r9d, r9d
14593f11f: eb18 jmp 0x14593f139
14593f121: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14593f130: 4983c102 add r9, 2
14593f134: 4d39cb cmp r11, r9
14593f137: 742f je 0x14593f168
14593f139: 43803cc81c cmp byte ptr [r8 + r9*8], 0x1c
14593f13e: 7410 je 0x14593f150
14593f140: 43807cc8081c cmp byte ptr [r8 + r9*8 + 8], 0x1c
14593f146: 75e8 jne 0x14593f130
14593f148: eb15 jmp 0x14593f15f
14593f14a: 660f1f440000 nop word ptr [rax + rax]
14593f150: f3430f5854c804 addss xmm2, dword ptr [r8 + r9*8 + 4]
14593f157: 43807cc8081c cmp byte ptr [r8 + r9*8 + 8], 0x1c
14593f15d: 75d1 jne 0x14593f130
14593f15f: f3430f5854c80c addss xmm2, dword ptr [r8 + r9*8 + 0xc]
14593f166: ebc8 jmp 0x14593f130
14593f168: 41f6c201 test r10b, 1
14593f16c: 740e je 0x14593f17c
14593f16e: 43803cc81c cmp byte ptr [r8 + r9*8], 0x1c
14593f173: 7507 jne 0x14593f17c
14593f175: f3430f5854c804 addss xmm2, dword ptr [r8 + r9*8 + 4]
14593f17c: f3440f58c2 addss xmm8, xmm2
14593f181: f3450f584416cc addss xmm8, dword ptr [r14 + rdx - 0x34]
; rank-input: exact0.112.0 bytes 0x14599e9ae..0x14599ea3b
14599e9ae: 498b02 mov rax, qword ptr [r10]
14599e9b1: 410fb64a08 movzx ecx, byte ptr [r10 + 8]
14599e9b6: 4c8b4020 mov r8, qword ptr [rax + 0x20]
14599e9ba: 4d85c0 test r8, r8
14599e9bd: 7451 je 0x14599ea10
14599e9bf: 0fb6909a000000 movzx edx, byte ptr [rax + 0x9a]
14599e9c6: 84d2 test dl, dl
14599e9c8: 0f8455050000 je 0x14599ef23
14599e9ce: 0fb6c9 movzx ecx, cl
14599e9d1: 440fb6ca movzx r9d, dl
14599e9d5: 38d1 cmp cl, dl
14599e9d7: 440f42c9 cmovb r9d, ecx
14599e9db: 488b5028 mov rdx, qword ptr [rax + 0x28]
14599e9df: 41fec9 dec r9b
14599e9e2: 84c9 test cl, cl
14599e9e4: 410fb6c9 movzx ecx, r9b
14599e9e8: 41b900000000 mov r9d, 0
14599e9ee: 410f44c9 cmove ecx, r9d
14599e9f2: 0fb6c9 movzx ecx, cl
14599e9f5: 4839ca cmp rdx, rcx
14599e9f8: 0f8666050000 jbe 0x14599ef64
14599e9fe: f3450f102488 movss xmm12, dword ptr [r8 + rcx*4]
14599ea04: eb16 jmp 0x14599ea1c
14599ea06: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
14599ea10: 0fb6c9 movzx ecx, cl
14599ea13: 450f57e4 xorps xmm12, xmm12
14599ea17: f3440f2ae1 cvtsi2ss xmm12, ecx
14599ea1c: 498d4a10 lea rcx, [r10 + 0x10]
14599ea20: 48894db0 mov qword ptr [rbp - 0x50], rcx
14599ea24: 488b5860 mov rbx, qword ptr [rax + 0x60]
14599ea28: 488b4068 mov rax, qword ptr [rax + 0x68]
14599ea2c: 48c1e006 shl rax, 6
14599ea30: 4801d8 add rax, rbx
14599ea33: 488945a8 mov qword ptr [rbp - 0x58], rax
14599ea37: 4c8955c8 mov qword ptr [rbp - 0x38], r10
; rank-numeric: exact0.112.0 bytes 0x14599eacb..0x14599eb48
14599eacb: 0fb63b movzx edi, byte ptr [rbx]
14599eace: 8d47dc lea eax, [rdi - 0x24]
14599ead1: 83ff24 cmp edi, 0x24
14599ead4: 0fb6c0 movzx eax, al
14599ead7: b902000000 mov ecx, 2
14599eadc: 0f42c1 cmovb eax, ecx
14599eadf: 84c0 test al, al
14599eae1: 744d je 0x14599eb30
14599eae3: 0fb6c0 movzx eax, al
14599eae6: 83f801 cmp eax, 1
14599eae9: 7565 jne 0x14599eb50
14599eaeb: 440fb66b08 movzx r13d, byte ptr [rbx + 8]
14599eaf0: 8b430c mov eax, dword ptr [rbx + 0xc]
14599eaf3: 894513 mov dword ptr [rbp + 0x13], eax
14599eaf6: 8b4309 mov eax, dword ptr [rbx + 9]
14599eaf9: 894510 mov dword ptr [rbp + 0x10], eax
14599eafc: 4c8b6310 mov r12, qword ptr [rbx + 0x10]
14599eb00: 488b4318 mov rax, qword ptr [rbx + 0x18]
14599eb04: 48894528 mov qword ptr [rbp + 0x28], rax
14599eb08: 0fb64324 movzx eax, byte ptr [rbx + 0x24]
14599eb0c: 884563 mov byte ptr [rbp + 0x63], al
14599eb0f: f3440f106b20 movss xmm13, dword ptr [rbx + 0x20]
14599eb15: f3450f59ec mulss xmm13, xmm12
14599eb1a: 40b725 mov dil, 0x25
14599eb1d: e95a030000 jmp 0x14599ee7c
14599eb22: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14599eb30: 440fb66b08 movzx r13d, byte ptr [rbx + 8]
14599eb35: f3440f105b04 movss xmm11, dword ptr [rbx + 4]
14599eb3b: f3450f59dc mulss xmm11, xmm12
14599eb40: 40b724 mov dil, 0x24
14599eb43: e934030000 jmp 0x14599ee7c
