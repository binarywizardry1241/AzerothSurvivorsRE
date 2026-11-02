1458be9c0: 55 push rbp
1458be9c1: 4156 push r14
1458be9c3: 56 push rsi
1458be9c4: 57 push rdi
1458be9c5: 53 push rbx
1458be9c6: 4881ec80000000 sub rsp, 0x80
1458be9cd: 488dac2480000000 lea rbp, [rsp + 0x80]
1458be9d5: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
1458be9dd: 4489cb mov ebx, r9d
1458be9e0: 4c89c7 mov rdi, r8
1458be9e3: 4989d6 mov r14, rdx
1458be9e6: 4889ce mov rsi, rcx
1458be9e9: e8123874fa call 0x140002200
1458be9ee: b920000000 mov ecx, 0x20
1458be9f3: ba01000000 mov edx, 1
1458be9f8: e8c33774fa call 0x1400021c0
1458be9fd: 4885c0 test rax, rax
1458bea00: 0f84a7020000 je 0x1458becad
1458bea06: 66c745e8dd00 mov word ptr [rbp - 0x18], 0xdd
1458bea0c: 48c745d020000000 mov qword ptr [rbp - 0x30], 0x20
1458bea14: 488945d8 mov qword ptr [rbp - 0x28], rax
1458bea18: 48c745e000000000 mov qword ptr [rbp - 0x20], 0
1458bea20: 488d55d0 lea rdx, [rbp - 0x30]
1458bea24: 4c89f1 mov rcx, r14
1458bea27: e8a4cb0000 call 0x1458cb5d0
1458bea2c: 90 nop
1458bea2d: 0f1045d0 movups xmm0, xmmword ptr [rbp - 0x30]
1458bea31: 0f104de0 movups xmm1, xmmword ptr [rbp - 0x20]
1458bea35: 0f294dc0 movaps xmmword ptr [rbp - 0x40], xmm1
1458bea39: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458bea3d: 488d4dd0 lea rcx, [rbp - 0x30]
1458bea41: 488d55b0 lea rdx, [rbp - 0x50]
1458bea45: 4989f8 mov r8, rdi
1458bea48: e8f3acfeff call 0x1458a9740
1458bea4d: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458bea51: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458bea55: 4829d0 sub rax, rdx
1458bea58: 4883f803 cmp rax, 3
1458bea5c: 0f8683010000 jbe 0x1458bebe5
1458bea62: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458bea66: 891c10 mov dword ptr [rax + rdx], ebx
1458bea69: 4883c204 add rdx, 4
1458bea6d: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458bea71: 0f1045d0 movups xmm0, xmmword ptr [rbp - 0x30]
1458bea75: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458bea79: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458bea7d: 488945c0 mov qword ptr [rbp - 0x40], rax
1458bea81: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458bea85: 488945c8 mov qword ptr [rbp - 0x38], rax
1458bea89: 488b5dc0 mov rbx, qword ptr [rbp - 0x40]
1458bea8d: 483b5db0 cmp rbx, qword ptr [rbp - 0x50]
1458bea91: 750a jne 0x1458bea9d
1458bea93: 488d4db0 lea rcx, [rbp - 0x50]
1458bea97: e804574e00 call 0x145da41a0
1458bea9c: 90 nop
1458bea9d: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458beaa1: c6041803 mov byte ptr [rax + rbx], 3
1458beaa5: 48ffc3 inc rbx
1458beaa8: 48895dc0 mov qword ptr [rbp - 0x40], rbx
1458beaac: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458beab0: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458beab4: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458beab8: 488945e0 mov qword ptr [rbp - 0x20], rax
1458beabc: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458beac0: 488945e8 mov qword ptr [rbp - 0x18], rax
1458beac4: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458beac8: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458beacc: 4829d0 sub rax, rdx
1458beacf: 4883f807 cmp rax, 7
1458bead3: 0f8634010000 jbe 0x1458bec0d
1458bead9: 488b4550 mov rax, qword ptr [rbp + 0x50]
1458beadd: 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
1458beae1: 48890411 mov qword ptr [rcx + rdx], rax
1458beae5: 4883c208 add rdx, 8
1458beae9: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458beaed: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458beaf1: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458beaf5: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458beaf9: 488945c0 mov qword ptr [rbp - 0x40], rax
1458beafd: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458beb01: 488945c8 mov qword ptr [rbp - 0x38], rax
1458beb05: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458beb09: 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458beb0d: 4829d0 sub rax, rdx
1458beb10: 4883f803 cmp rax, 3
1458beb14: 0f861b010000 jbe 0x1458bec35
1458beb1a: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458beb1e: c7041000010000 mov dword ptr [rax + rdx], 0x100
1458beb25: 4883c204 add rdx, 4
1458beb29: 488955c0 mov qword ptr [rbp - 0x40], rdx
1458beb2d: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458beb31: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458beb35: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458beb39: 488945e0 mov qword ptr [rbp - 0x20], rax
1458beb3d: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458beb41: 488945e8 mov qword ptr [rbp - 0x18], rax
1458beb45: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458beb49: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458beb4d: 4829d0 sub rax, rdx
1458beb50: 4883f803 cmp rax, 3
1458beb54: 0f8603010000 jbe 0x1458bec5d
1458beb5a: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458beb5e: c7041001000000 mov dword ptr [rax + rdx], 1
1458beb65: 4883c204 add rdx, 4
1458beb69: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458beb6d: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458beb71: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458beb75: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458beb79: 488945c0 mov qword ptr [rbp - 0x40], rax
1458beb7d: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458beb81: 488945c8 mov qword ptr [rbp - 0x38], rax
1458beb85: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458beb89: 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458beb8d: 4829d0 sub rax, rdx
1458beb90: 4883f803 cmp rax, 3
1458beb94: 0f86eb000000 jbe 0x1458bec85
1458beb9a: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458beb9e: c7041001000000 mov dword ptr [rax + rdx], 1
1458beba5: 4883c204 add rdx, 4
1458beba9: 488955c0 mov qword ptr [rbp - 0x40], rdx
1458bebad: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458bebb1: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458bebb5: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458bebb9: 488945e0 mov qword ptr [rbp - 0x20], rax
1458bebbd: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458bebc1: 488945e8 mov qword ptr [rbp - 0x18], rax
1458bebc5: 488d55d0 lea rdx, [rbp - 0x30]
1458bebc9: 4889f1 mov rcx, rsi
1458bebcc: 4989f8 mov r8, rdi
1458bebcf: e86cabfeff call 0x1458a9740
1458bebd4: 4889f0 mov rax, rsi
1458bebd7: 4881c480000000 add rsp, 0x80
1458bebde: 5b pop rbx
1458bebdf: 5f pop rdi
1458bebe0: 5e pop rsi
1458bebe1: 415e pop r14
1458bebe3: 5d pop rbp
1458bebe4: c3 ret
1458bebe5: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458bebee: 488d4dd0 lea rcx, [rbp - 0x30]
1458bebf2: 41b804000000 mov r8d, 4
1458bebf8: 41b901000000 mov r9d, 1
1458bebfe: e82d963400 call 0x145c08230
1458bec03: 90 nop
1458bec04: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458bec08: e955feffff jmp 0x1458bea62
1458bec0d: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458bec16: 488d4dd0 lea rcx, [rbp - 0x30]
1458bec1a: 41b808000000 mov r8d, 8
1458bec20: 41b901000000 mov r9d, 1
1458bec26: e805963400 call 0x145c08230
1458bec2b: 90 nop
1458bec2c: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458bec30: e9a4feffff jmp 0x1458bead9
1458bec35: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458bec3e: 488d4db0 lea rcx, [rbp - 0x50]
1458bec42: 41b804000000 mov r8d, 4
1458bec48: 41b901000000 mov r9d, 1
1458bec4e: e8dd953400 call 0x145c08230
1458bec53: 90 nop
1458bec54: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458bec58: e9bdfeffff jmp 0x1458beb1a
1458bec5d: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458bec66: 488d4dd0 lea rcx, [rbp - 0x30]
1458bec6a: 41b804000000 mov r8d, 4
1458bec70: 41b901000000 mov r9d, 1
1458bec76: e8b5953400 call 0x145c08230
1458bec7b: 90 nop
1458bec7c: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458bec80: e9d5feffff jmp 0x1458beb5a
1458bec85: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458bec8e: 488d4db0 lea rcx, [rbp - 0x50]
1458bec92: 41b804000000 mov r8d, 4
1458bec98: 41b901000000 mov r9d, 1
1458bec9e: e88d953400 call 0x145c08230
1458beca3: 90 nop
1458beca4: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458beca8: e9edfeffff jmp 0x1458beb9a
1458becad: b901000000 mov ecx, 1
1458becb2: ba20000000 mov edx, 0x20
1458becb7: e8ef554e00 call 0x145da42ab
1458becbc: 0f0b ud2
