1458bee80: 55 push rbp
1458bee81: 4156 push r14
1458bee83: 56 push rsi
1458bee84: 57 push rdi
1458bee85: 53 push rbx
1458bee86: 4881ec80000000 sub rsp, 0x80
1458bee8d: 488dac2480000000 lea rbp, [rsp + 0x80]
1458bee95: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
1458bee9d: 4c89cf mov rdi, r9
1458beea0: 4c89c3 mov rbx, r8
1458beea3: 4989d6 mov r14, rdx
1458beea6: 4889ce mov rsi, rcx
1458beea9: e8523374fa call 0x140002200
1458beeae: b920000000 mov ecx, 0x20
1458beeb3: ba01000000 mov edx, 1
1458beeb8: e8033374fa call 0x1400021c0
1458beebd: 4885c0 test rax, rax
1458beec0: 0f8446020000 je 0x1458bf10c
1458beec6: 66c745e8dd00 mov word ptr [rbp - 0x18], 0xdd
1458beecc: 48c745d020000000 mov qword ptr [rbp - 0x30], 0x20
1458beed4: 488945d8 mov qword ptr [rbp - 0x28], rax
1458beed8: 48c745e000000000 mov qword ptr [rbp - 0x20], 0
1458beee0: 488d55d0 lea rdx, [rbp - 0x30]
1458beee4: 4c89f1 mov rcx, r14
1458beee7: e8e4c60000 call 0x1458cb5d0
1458beeec: 90 nop
1458beeed: 0f1045d0 movups xmm0, xmmword ptr [rbp - 0x30]
1458beef1: 0f104de0 movups xmm1, xmmword ptr [rbp - 0x20]
1458beef5: 0f294dc0 movaps xmmword ptr [rbp - 0x40], xmm1
1458beef9: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458beefd: 488d4dd0 lea rcx, [rbp - 0x30]
1458bef01: 488d55b0 lea rdx, [rbp - 0x50]
1458bef05: 4989d8 mov r8, rbx
1458bef08: e833a8feff call 0x1458a9740
1458bef0d: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458bef11: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458bef15: 4829d0 sub rax, rdx
1458bef18: 4883f803 cmp rax, 3
1458bef1c: 0f864a010000 jbe 0x1458bf06c
1458bef22: 8b4550 mov eax, dword ptr [rbp + 0x50]
1458bef25: 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
1458bef29: 890411 mov dword ptr [rcx + rdx], eax
1458bef2c: 4883c204 add rdx, 4
1458bef30: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458bef34: 0f1045d0 movups xmm0, xmmword ptr [rbp - 0x30]
1458bef38: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458bef3c: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458bef40: 488945c0 mov qword ptr [rbp - 0x40], rax
1458bef44: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458bef48: 488945c8 mov qword ptr [rbp - 0x38], rax
1458bef4c: 488b5dc0 mov rbx, qword ptr [rbp - 0x40]
1458bef50: 483b5db0 cmp rbx, qword ptr [rbp - 0x50]
1458bef54: 750a jne 0x1458bef60
1458bef56: 488d4db0 lea rcx, [rbp - 0x50]
1458bef5a: e841524e00 call 0x145da41a0
1458bef5f: 90 nop
1458bef60: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458bef64: c6041800 mov byte ptr [rax + rbx], 0
1458bef68: 48ffc3 inc rbx
1458bef6b: 48895dc0 mov qword ptr [rbp - 0x40], rbx
1458bef6f: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458bef73: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458bef77: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458bef7b: 488945e0 mov qword ptr [rbp - 0x20], rax
1458bef7f: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458bef83: 488945e8 mov qword ptr [rbp - 0x18], rax
1458bef87: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458bef8b: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458bef8f: 4829d0 sub rax, rdx
1458bef92: 4883f803 cmp rax, 3
1458bef96: 0f86f8000000 jbe 0x1458bf094
1458bef9c: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458befa0: c7041000010000 mov dword ptr [rax + rdx], 0x100
1458befa7: 4883c204 add rdx, 4
1458befab: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458befaf: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458befb3: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458befb7: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458befbb: 488945c0 mov qword ptr [rbp - 0x40], rax
1458befbf: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458befc3: 488945c8 mov qword ptr [rbp - 0x38], rax
1458befc7: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458befcb: 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458befcf: 4829d0 sub rax, rdx
1458befd2: 4883f803 cmp rax, 3
1458befd6: 0f86e0000000 jbe 0x1458bf0bc
1458befdc: 8b4558 mov eax, dword ptr [rbp + 0x58]
1458befdf: 83f801 cmp eax, 1
1458befe2: 83d000 adc eax, 0
1458befe5: 488b4db8 mov rcx, qword ptr [rbp - 0x48]
1458befe9: 890411 mov dword ptr [rcx + rdx], eax
1458befec: 4883c204 add rdx, 4
1458beff0: 488955c0 mov qword ptr [rbp - 0x40], rdx
1458beff4: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458beff8: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458beffc: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458bf000: 488945e0 mov qword ptr [rbp - 0x20], rax
1458bf004: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458bf008: 488945e8 mov qword ptr [rbp - 0x18], rax
1458bf00c: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458bf010: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458bf014: 4829d0 sub rax, rdx
1458bf017: 4883f803 cmp rax, 3
1458bf01b: 0f86c3000000 jbe 0x1458bf0e4
1458bf021: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458bf025: c7041001000000 mov dword ptr [rax + rdx], 1
1458bf02c: 4883c204 add rdx, 4
1458bf030: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458bf034: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458bf038: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458bf03c: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458bf040: 488945c0 mov qword ptr [rbp - 0x40], rax
1458bf044: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458bf048: 488945c8 mov qword ptr [rbp - 0x38], rax
1458bf04c: 488d55b0 lea rdx, [rbp - 0x50]
1458bf050: 4889f1 mov rcx, rsi
1458bf053: 4989f8 mov r8, rdi
1458bf056: e8e5a6feff call 0x1458a9740
1458bf05b: 4889f0 mov rax, rsi
1458bf05e: 4881c480000000 add rsp, 0x80
1458bf065: 5b pop rbx
1458bf066: 5f pop rdi
1458bf067: 5e pop rsi
1458bf068: 415e pop r14
1458bf06a: 5d pop rbp
1458bf06b: c3 ret
1458bf06c: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458bf075: 488d4dd0 lea rcx, [rbp - 0x30]
1458bf079: 41b804000000 mov r8d, 4
1458bf07f: 41b901000000 mov r9d, 1
1458bf085: e8a6913400 call 0x145c08230
1458bf08a: 90 nop
1458bf08b: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458bf08f: e98efeffff jmp 0x1458bef22
1458bf094: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458bf09d: 488d4dd0 lea rcx, [rbp - 0x30]
1458bf0a1: 41b804000000 mov r8d, 4
1458bf0a7: 41b901000000 mov r9d, 1
1458bf0ad: e87e913400 call 0x145c08230
1458bf0b2: 90 nop
1458bf0b3: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458bf0b7: e9e0feffff jmp 0x1458bef9c
1458bf0bc: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458bf0c5: 488d4db0 lea rcx, [rbp - 0x50]
1458bf0c9: 41b804000000 mov r8d, 4
1458bf0cf: 41b901000000 mov r9d, 1
1458bf0d5: e856913400 call 0x145c08230
1458bf0da: 90 nop
1458bf0db: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458bf0df: e9f8feffff jmp 0x1458befdc
1458bf0e4: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458bf0ed: 488d4dd0 lea rcx, [rbp - 0x30]
1458bf0f1: 41b804000000 mov r8d, 4
1458bf0f7: 41b901000000 mov r9d, 1
1458bf0fd: e82e913400 call 0x145c08230
1458bf102: 90 nop
1458bf103: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458bf107: e915ffffff jmp 0x1458bf021
1458bf10c: b901000000 mov ecx, 1
1458bf111: ba20000000 mov edx, 0x20
1458bf116: e890514e00 call 0x145da42ab
1458bf11b: 0f0b ud2
