// packed-guid
1458b6e10: 4157 push r15
1458b6e12: 4156 push r14
1458b6e14: 56 push rsi
1458b6e15: 57 push rdi
1458b6e16: 55 push rbp
1458b6e17: 53 push rbx
1458b6e18: 4883ec28 sub rsp, 0x28
1458b6e1c: 4889d6 mov rsi, rdx
1458b6e1f: 4889cf mov rdi, rcx
1458b6e22: 488b5a10 mov rbx, qword ptr [rdx + 0x10]
1458b6e26: 483b1a cmp rbx, qword ptr [rdx]
1458b6e29: 7508 jne 0x1458b6e33
1458b6e2b: 4889f1 mov rcx, rsi
1458b6e2e: e84d4e5e00 call 0x145e9bc80
1458b6e33: 488b4608 mov rax, qword ptr [rsi + 8]
1458b6e37: c6041800 mov byte ptr [rax + rbx], 0
1458b6e3b: 4c8d7301 lea r14, [rbx + 1]
1458b6e3f: 4c897610 mov qword ptr [rsi + 0x10], r14
1458b6e43: 4084ff test dil, dil
1458b6e46: 7428 je 0x1458b6e70
1458b6e48: 488b4608 mov rax, qword ptr [rsi + 8]
1458b6e4c: 800c1801 or byte ptr [rax + rbx], 1
1458b6e50: 4c8b7610 mov r14, qword ptr [rsi + 0x10]
1458b6e54: 4c3b36 cmp r14, qword ptr [rsi]
1458b6e57: 7508 jne 0x1458b6e61
1458b6e59: 4889f1 mov rcx, rsi
1458b6e5c: e81f4e5e00 call 0x145e9bc80
1458b6e61: 488b4608 mov rax, qword ptr [rsi + 8]
1458b6e65: 42883c30 mov byte ptr [rax + r14], dil
1458b6e69: 49ffc6 inc r14
1458b6e6c: 4c897610 mov qword ptr [rsi + 0x10], r14
1458b6e70: 89fd mov ebp, edi
1458b6e72: c1ed08 shr ebp, 8
1458b6e75: 4084ed test bpl, bpl
1458b6e78: 7431 je 0x1458b6eab
1458b6e7a: 4c39f3 cmp rbx, r14
1458b6e7d: 0f838e010000 jae 0x1458b7011
1458b6e83: 488b4608 mov rax, qword ptr [rsi + 8]
1458b6e87: 800c1802 or byte ptr [rax + rbx], 2
1458b6e8b: 4c8b7610 mov r14, qword ptr [rsi + 0x10]
1458b6e8f: 4c3b36 cmp r14, qword ptr [rsi]
1458b6e92: 7508 jne 0x1458b6e9c
1458b6e94: 4889f1 mov rcx, rsi
1458b6e97: e8e44d5e00 call 0x145e9bc80
1458b6e9c: 488b4608 mov rax, qword ptr [rsi + 8]
1458b6ea0: 42882c30 mov byte ptr [rax + r14], bpl
1458b6ea4: 49ffc6 inc r14
1458b6ea7: 4c897610 mov qword ptr [rsi + 0x10], r14
1458b6eab: 89fd mov ebp, edi
1458b6ead: c1ed10 shr ebp, 0x10
1458b6eb0: 4084ed test bpl, bpl
1458b6eb3: 7431 je 0x1458b6ee6
1458b6eb5: 4c39f3 cmp rbx, r14
1458b6eb8: 0f8353010000 jae 0x1458b7011
1458b6ebe: 488b4608 mov rax, qword ptr [rsi + 8]
1458b6ec2: 800c1804 or byte ptr [rax + rbx], 4
1458b6ec6: 4c8b7610 mov r14, qword ptr [rsi + 0x10]
1458b6eca: 4c3b36 cmp r14, qword ptr [rsi]
1458b6ecd: 7508 jne 0x1458b6ed7
1458b6ecf: 4889f1 mov rcx, rsi
1458b6ed2: e8a94d5e00 call 0x145e9bc80
1458b6ed7: 488b4608 mov rax, qword ptr [rsi + 8]
1458b6edb: 42882c30 mov byte ptr [rax + r14], bpl
1458b6edf: 49ffc6 inc r14
1458b6ee2: 4c897610 mov qword ptr [rsi + 0x10], r14
1458b6ee6: 89fd mov ebp, edi
1458b6ee8: c1ed18 shr ebp, 0x18
1458b6eeb: 7431 je 0x1458b6f1e
1458b6eed: 4c39f3 cmp rbx, r14
1458b6ef0: 0f831b010000 jae 0x1458b7011
1458b6ef6: 488b4608 mov rax, qword ptr [rsi + 8]
1458b6efa: 800c1808 or byte ptr [rax + rbx], 8
1458b6efe: 4c8b7610 mov r14, qword ptr [rsi + 0x10]
1458b6f02: 4c3b36 cmp r14, qword ptr [rsi]
1458b6f05: 7508 jne 0x1458b6f0f
1458b6f07: 4889f1 mov rcx, rsi
1458b6f0a: e8714d5e00 call 0x145e9bc80
1458b6f0f: 488b4608 mov rax, qword ptr [rsi + 8]
1458b6f13: 42882c30 mov byte ptr [rax + r14], bpl
1458b6f17: 49ffc6 inc r14
1458b6f1a: 4c897610 mov qword ptr [rsi + 0x10], r14
1458b6f1e: 4989ff mov r15, rdi
1458b6f21: 49c1ef20 shr r15, 0x20
1458b6f25: 4584ff test r15b, r15b
1458b6f28: 7431 je 0x1458b6f5b
1458b6f2a: 4c39f3 cmp rbx, r14
1458b6f2d: 0f83de000000 jae 0x1458b7011
1458b6f33: 488b4608 mov rax, qword ptr [rsi + 8]
1458b6f37: 800c1810 or byte ptr [rax + rbx], 0x10
1458b6f3b: 4c8b7610 mov r14, qword ptr [rsi + 0x10]
1458b6f3f: 4c3b36 cmp r14, qword ptr [rsi]
1458b6f42: 7508 jne 0x1458b6f4c
1458b6f44: 4889f1 mov rcx, rsi
1458b6f47: e8344d5e00 call 0x145e9bc80
1458b6f4c: 488b4608 mov rax, qword ptr [rsi + 8]
1458b6f50: 46883c30 mov byte ptr [rax + r14], r15b
1458b6f54: 49ffc6 inc r14
1458b6f57: 4c897610 mov qword ptr [rsi + 0x10], r14
1458b6f5b: 4989ff mov r15, rdi
1458b6f5e: 49c1ef28 shr r15, 0x28
1458b6f62: 4584ff test r15b, r15b
1458b6f65: 7431 je 0x1458b6f98
1458b6f67: 4c39f3 cmp rbx, r14
1458b6f6a: 0f83a1000000 jae 0x1458b7011
1458b6f70: 488b4608 mov rax, qword ptr [rsi + 8]
1458b6f74: 800c1820 or byte ptr [rax + rbx], 0x20
1458b6f78: 4c8b7610 mov r14, qword ptr [rsi + 0x10]
1458b6f7c: 4c3b36 cmp r14, qword ptr [rsi]
1458b6f7f: 7508 jne 0x1458b6f89
1458b6f81: 4889f1 mov rcx, rsi
1458b6f84: e8f74c5e00 call 0x145e9bc80
1458b6f89: 488b4608 mov rax, qword ptr [rsi + 8]
1458b6f8d: 46883c30 mov byte ptr [rax + r14], r15b
1458b6f91: 49ffc6 inc r14
1458b6f94: 4c897610 mov qword ptr [rsi + 0x10], r14
1458b6f98: 4989ff mov r15, rdi
1458b6f9b: 49c1ef30 shr r15, 0x30
1458b6f9f: 4584ff test r15b, r15b
1458b6fa2: 742d je 0x1458b6fd1
1458b6fa4: 4c39f3 cmp rbx, r14
1458b6fa7: 7368 jae 0x1458b7011
1458b6fa9: 488b4608 mov rax, qword ptr [rsi + 8]
1458b6fad: 800c1840 or byte ptr [rax + rbx], 0x40
1458b6fb1: 4c8b7610 mov r14, qword ptr [rsi + 0x10]
1458b6fb5: 4c3b36 cmp r14, qword ptr [rsi]
1458b6fb8: 7508 jne 0x1458b6fc2
1458b6fba: 4889f1 mov rcx, rsi
1458b6fbd: e8be4c5e00 call 0x145e9bc80
1458b6fc2: 488b4608 mov rax, qword ptr [rsi + 8]
1458b6fc6: 46883c30 mov byte ptr [rax + r14], r15b
1458b6fca: 49ffc6 inc r14
1458b6fcd: 4c897610 mov qword ptr [rsi + 0x10], r14
1458b6fd1: 48c1ef38 shr rdi, 0x38
1458b6fd5: 742d je 0x1458b7004
1458b6fd7: 4c39f3 cmp rbx, r14
1458b6fda: 7335 jae 0x1458b7011
1458b6fdc: 488b4608 mov rax, qword ptr [rsi + 8]
1458b6fe0: 800c1880 or byte ptr [rax + rbx], 0x80
1458b6fe4: 488b5e10 mov rbx, qword ptr [rsi + 0x10]
1458b6fe8: 483b1e cmp rbx, qword ptr [rsi]
1458b6feb: 7508 jne 0x1458b6ff5
1458b6fed: 4889f1 mov rcx, rsi
1458b6ff0: e88b4c5e00 call 0x145e9bc80
1458b6ff5: 488b4608 mov rax, qword ptr [rsi + 8]
1458b6ff9: 40883c18 mov byte ptr [rax + rbx], dil
1458b6ffd: 48ffc3 inc rbx
1458b7000: 48895e10 mov qword ptr [rsi + 0x10], rbx
1458b7004: 4883c428 add rsp, 0x28
1458b7008: 5b pop rbx
1458b7009: 5d pop rbp
1458b700a: 5f pop rdi
1458b700b: 5e pop rsi
1458b700c: 415e pop r14
1458b700e: 415f pop r15
1458b7010: c3 ret
1458b7011: 4c8d0508c7a401 lea r8, [rip + 0x1a4c708]
1458b7018: 4889d9 mov rcx, rbx
1458b701b: 4c89f2 mov rdx, r14
1458b701e: e800515e00 call 0x145e9c123
1458b7023: 0f0b ud2
// remove-pickup
14594fd70: 55 push rbp
14594fd71: 4157 push r15
14594fd73: 4156 push r14
14594fd75: 4154 push r12
14594fd77: 56 push rsi
14594fd78: 57 push rdi
14594fd79: 53 push rbx
14594fd7a: 4883ec50 sub rsp, 0x50
14594fd7e: 488d6c2450 lea rbp, [rsp + 0x50]
14594fd83: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
14594fd8b: 4889d7 mov rdi, rdx
14594fd8e: 488b9918060000 mov rbx, qword ptr [rcx + 0x618]
14594fd95: 4839da cmp rdx, rbx
14594fd98: 0f83c5010000 jae 0x14594ff63
14594fd9e: 4889ce mov rsi, rcx
14594fda1: 488b8110060000 mov rax, qword ptr [rcx + 0x610]
14594fda8: 488d14ff lea rdx, [rdi + rdi*8]
14594fdac: 488d0cd0 lea rcx, [rax + rdx*8]
14594fdb0: 4c8b24d0 mov r12, qword ptr [rax + rdx*8]
14594fdb4: 4c8b44d008 mov r8, qword ptr [rax + rdx*8 + 8]
14594fdb9: 4c8945d8 mov qword ptr [rbp - 0x28], r8
14594fdbd: 4c8b74d010 mov r14, qword ptr [rax + rdx*8 + 0x10]
14594fdc2: 4c8b7cd028 mov r15, qword ptr [rax + rdx*8 + 0x28]
14594fdc7: 488d14d0 lea rdx, [rax + rdx*8]
14594fdcb: 4883c248 add rdx, 0x48
14594fdcf: 4889f8 mov rax, rdi
14594fdd2: 48f7d0 not rax
14594fdd5: 4801d8 add rax, rbx
14594fdd8: 48c1e003 shl rax, 3
14594fddc: 4c8d04c0 lea r8, [rax + rax*8]
14594fde0: e8b89b3a00 call 0x145cf999d
14594fde5: 48ffcb dec rbx
14594fde8: 48899e18060000 mov qword ptr [rsi + 0x618], rbx
14594fdef: 4983fcff cmp r12, -1
14594fdf3: 0f846a010000 je 0x14594ff63
14594fdf9: 4c8965e8 mov qword ptr [rbp - 0x18], r12
14594fdfd: e8fe236bfa call 0x140002200
14594fe02: b920000000 mov ecx, 0x20
14594fe07: ba01000000 mov edx, 1
14594fe0c: e8af236bfa call 0x1400021c0
14594fe11: 4885c0 test rax, rax
14594fe14: 0f845d010000 je 0x14594ff77
14594fe1a: 488dbe20060000 lea rdi, [rsi + 0x620]
14594fe21: 488945e0 mov qword ptr [rbp - 0x20], rax
14594fe25: 4c8938 mov qword ptr [rax], r15
14594fe28: 488b9e30060000 mov rbx, qword ptr [rsi + 0x630]
14594fe2f: 483b9e20060000 cmp rbx, qword ptr [rsi + 0x620]
14594fe36: 7509 jne 0x14594fe41
14594fe38: 4889f9 mov rcx, rdi
14594fe3b: e8a0a23a00 call 0x145cfa0e0
14594fe40: 90 nop
14594fe41: 488b8628060000 mov rax, qword ptr [rsi + 0x628]
14594fe48: 4889d9 mov rcx, rbx
14594fe4b: 48c1e105 shl rcx, 5
14594fe4f: 48c7040820000000 mov qword ptr [rax + rcx], 0x20
14594fe57: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
14594fe5b: 4889540808 mov qword ptr [rax + rcx + 8], rdx
14594fe60: 48c744081008000000 mov qword ptr [rax + rcx + 0x10], 8
14594fe69: 66c7440818aa00 mov word ptr [rax + rcx + 0x18], 0xaa
14594fe70: 48ffc3 inc rbx
14594fe73: 48899e30060000 mov qword ptr [rsi + 0x630], rbx
14594fe7a: 4d85f6 test r14, r14
14594fe7d: 0f8495000000 je 0x14594ff18
14594fe83: 49c1e603 shl r14, 3
14594fe87: 31db xor ebx, ebx
14594fe89: eb47 jmp 0x14594fed2
14594fe8b: 0f1f440000 nop dword ptr [rax + rax]
14594fe90: 488b8628060000 mov rax, qword ptr [rsi + 0x628]
14594fe97: 4c89f9 mov rcx, r15
14594fe9a: 48c1e105 shl rcx, 5
14594fe9e: 48c7040820000000 mov qword ptr [rax + rcx], 0x20
14594fea6: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
14594feaa: 4889540808 mov qword ptr [rax + rcx + 8], rdx
14594feaf: 48c744081008000000 mov qword ptr [rax + rcx + 0x10], 8
14594feb8: 66c7440818aa00 mov word ptr [rax + rcx + 0x18], 0xaa
14594febf: 49ffc7 inc r15
14594fec2: 4c89be30060000 mov qword ptr [rsi + 0x630], r15
14594fec9: 4883c308 add rbx, 8
14594fecd: 4939de cmp r14, rbx
14594fed0: 7446 je 0x14594ff18
14594fed2: 488b45d8 mov rax, qword ptr [rbp - 0x28]
14594fed6: 4c8b3c18 mov r15, qword ptr [rax + rbx]
14594feda: e821236bfa call 0x140002200
14594fedf: b920000000 mov ecx, 0x20
14594fee4: ba01000000 mov edx, 1
14594fee9: e8d2226bfa call 0x1400021c0
14594feee: 4885c0 test rax, rax
14594fef1: 745e je 0x14594ff51
14594fef3: 488945e0 mov qword ptr [rbp - 0x20], rax
14594fef7: 4c8938 mov qword ptr [rax], r15
14594fefa: 4c8bbe30060000 mov r15, qword ptr [rsi + 0x630]
14594ff01: 4c3bbe20060000 cmp r15, qword ptr [rsi + 0x620]
14594ff08: 7586 jne 0x14594fe90
14594ff0a: 4889f9 mov rcx, rdi
14594ff0d: e8cea13a00 call 0x145cfa0e0
14594ff12: 90 nop
14594ff13: e978ffffff jmp 0x14594fe90
14594ff18: 488b55e8 mov rdx, qword ptr [rbp - 0x18]
14594ff1c: 4885d2 test rdx, rdx
14594ff1f: 7421 je 0x14594ff42
14594ff21: 48c1e203 shl rdx, 3
14594ff25: 41b808000000 mov r8d, 8
14594ff2b: 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
14594ff2f: 4883c450 add rsp, 0x50
14594ff33: 5b pop rbx
14594ff34: 5f pop rdi
14594ff35: 5e pop rsi
14594ff36: 415c pop r12
14594ff38: 415e pop r14
14594ff3a: 415f pop r15
14594ff3c: 5d pop rbp
14594ff3d: e98e226bfa jmp 0x1400021d0
14594ff42: 4883c450 add rsp, 0x50
14594ff46: 5b pop rbx
14594ff47: 5f pop rdi
14594ff48: 5e pop rsi
14594ff49: 415c pop r12
14594ff4b: 415e pop r14
14594ff4d: 415f pop r15
14594ff4f: 5d pop rbp
14594ff50: c3 ret
14594ff51: b901000000 mov ecx, 1
14594ff56: ba20000000 mov edx, 0x20
14594ff5b: e82bbe5400 call 0x145e9bd8b
14594ff60: 90 nop
14594ff61: eb28 jmp 0x14594ff8b
14594ff63: 4c8d051ed19b01 lea r8, [rip + 0x19bd11e]
14594ff6a: 4889f9 mov rcx, rdi
14594ff6d: 4889da mov rdx, rbx
14594ff70: e8e6be5400 call 0x145e9be5b
14594ff75: 0f0b ud2
14594ff77: c645f700 mov byte ptr [rbp - 9], 0
14594ff7b: b901000000 mov ecx, 1
14594ff80: ba20000000 mov edx, 0x20
14594ff85: e801be5400 call 0x145e9bd8b
14594ff8a: 90 nop
14594ff8b: 0f0b ud2
// nearby-pickup-guids
14598ad90: 55 push rbp
14598ad91: 4157 push r15
14598ad93: 4156 push r14
14598ad95: 4155 push r13
14598ad97: 4154 push r12
14598ad99: 56 push rsi
14598ad9a: 57 push rdi
14598ad9b: 53 push rbx
14598ad9c: 4883ec58 sub rsp, 0x58
14598ada0: 488d6c2450 lea rbp, [rsp + 0x50]
14598ada5: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
14598adad: 4889ce mov rsi, rcx
14598adb0: 4c8b3a mov r15, qword ptr [rdx]
14598adb3: 4c8b7208 mov r14, qword ptr [rdx + 8]
14598adb7: 4d39f7 cmp r15, r14
14598adba: 0f849e000000 je 0x14598ae5e
14598adc0: 4c8b6210 mov r12, qword ptr [rdx + 0x10]
14598adc4: 4c8b6a18 mov r13, qword ptr [rdx + 0x18]
14598adc8: 488b5a20 mov rbx, qword ptr [rdx + 0x20]
14598adcc: 488b7a28 mov rdi, qword ptr [rdx + 0x28]
14598add0: 4983c748 add r15, 0x48
14598add4: eb35 jmp 0x14598ae0b
14598add6: f2410f1047ec movsd xmm0, qword ptr [r15 - 0x14]
14598addc: f20f100b movsd xmm1, qword ptr [rbx]
14598ade0: 0f5cc1 subps xmm0, xmm1
14598ade3: 0f59c0 mulps xmm0, xmm0
14598ade6: f30f16c8 movshdup xmm1, xmm0
14598adea: f30f58c8 addss xmm1, xmm0
14598adee: 0f57c0 xorps xmm0, xmm0
14598adf1: f30f51c1 sqrtss xmm0, xmm1
14598adf5: f30f100f movss xmm1, dword ptr [rdi]
14598adf9: 0f2ec8 ucomiss xmm1, xmm0
14598adfc: 0f8387000000 jae 0x14598ae89
14598ae02: 4d39f7 cmp r15, r14
14598ae05: 4d8d7f48 lea r15, [r15 + 0x48]
14598ae09: 7453 je 0x14598ae5e
14598ae0b: 41807fd000 cmp byte ptr [r15 - 0x30], 0
14598ae10: 75f0 jne 0x14598ae02
14598ae12: 418b47d8 mov eax, dword ptr [r15 - 0x28]
14598ae16: 83f802 cmp eax, 2
14598ae19: 720f jb 0x14598ae2a
14598ae1b: 8d48fd lea ecx, [rax - 3]
14598ae1e: 83f902 cmp ecx, 2
14598ae21: 77df ja 0x14598ae02
14598ae23: 41803c2403 cmp byte ptr [r12], 3
14598ae28: 75d8 jne 0x14598ae02
14598ae2a: 41807d0002 cmp byte ptr [r13], 2
14598ae2f: 75a5 jne 0x14598add6
14598ae31: f2410f1047ec movsd xmm0, qword ptr [r15 - 0x14]
14598ae37: f20f100b movsd xmm1, qword ptr [rbx]
14598ae3b: 0f5cc1 subps xmm0, xmm1
14598ae3e: 0f59c0 mulps xmm0, xmm0
14598ae41: f30f16c8 movshdup xmm1, xmm0
14598ae45: f30f58c8 addss xmm1, xmm0
14598ae49: 0f57c0 xorps xmm0, xmm0
14598ae4c: f30f51c1 sqrtss xmm0, xmm1
14598ae50: f30f100f movss xmm1, dword ptr [rdi]
14598ae54: 85c0 test eax, eax
14598ae56: 75a1 jne 0x14598adf9
14598ae58: f30f58c9 addss xmm1, xmm1
14598ae5c: eb9b jmp 0x14598adf9
14598ae5e: 48c70600000000 mov qword ptr [rsi], 0
14598ae65: 48c7460808000000 mov qword ptr [rsi + 8], 8
14598ae6d: 48c7461000000000 mov qword ptr [rsi + 0x10], 0
14598ae75: 4889f0 mov rax, rsi
14598ae78: 4883c458 add rsp, 0x58
14598ae7c: 5b pop rbx
14598ae7d: 5f pop rdi
14598ae7e: 5e pop rsi
14598ae7f: 415c pop r12
14598ae81: 415d pop r13
14598ae83: 415e pop r14
14598ae85: 415f pop r15
14598ae87: 5d pop rbp
14598ae88: c3 ret
14598ae89: 4c893a mov qword ptr [rdx], r15
14598ae8c: 498b47e0 mov rax, qword ptr [r15 - 0x20]
14598ae90: 488945e0 mov qword ptr [rbp - 0x20], rax
14598ae94: e8677367fa call 0x140002200
14598ae99: b920000000 mov ecx, 0x20
14598ae9e: ba08000000 mov edx, 8
14598aea3: e8187367fa call 0x1400021c0
14598aea8: 4885c0 test rax, rax
14598aeab: 0f842c010000 je 0x14598afdd
14598aeb1: 488b4de0 mov rcx, qword ptr [rbp - 0x20]
14598aeb5: 488908 mov qword ptr [rax], rcx
14598aeb8: 48c745e804000000 mov qword ptr [rbp - 0x18], 4
14598aec0: 488945f0 mov qword ptr [rbp - 0x10], rax
14598aec4: 48c745f801000000 mov qword ptr [rbp - 8], 1
14598aecc: 4d39f7 cmp r15, r14
14598aecf: 0f84ec000000 je 0x14598afc1
14598aed5: ba01000000 mov edx, 1
14598aeda: 488d4de8 lea rcx, [rbp - 0x18]
14598aede: 4983c748 add r15, 0x48
14598aee2: eb35 jmp 0x14598af19
14598aee4: f2410f1047ec movsd xmm0, qword ptr [r15 - 0x14]
14598aeea: f20f100b movsd xmm1, qword ptr [rbx]
14598aeee: 0f5cc1 subps xmm0, xmm1
14598aef1: 0f59c0 mulps xmm0, xmm0
14598aef4: f30f16c8 movshdup xmm1, xmm0
14598aef8: f30f58c8 addss xmm1, xmm0
14598aefc: 0f57c0 xorps xmm0, xmm0
14598aeff: f30f51c1 sqrtss xmm0, xmm1
14598af03: f30f100f movss xmm1, dword ptr [rdi]
14598af07: 0f2ec8 ucomiss xmm1, xmm0
14598af0a: 7364 jae 0x14598af70
14598af0c: 4d39f7 cmp r15, r14
14598af0f: 4d8d7f48 lea r15, [r15 + 0x48]
14598af13: 0f84a8000000 je 0x14598afc1
14598af19: 41807fd000 cmp byte ptr [r15 - 0x30], 0
14598af1e: 75ec jne 0x14598af0c
14598af20: 458b4fd8 mov r9d, dword ptr [r15 - 0x28]
14598af24: 4183f902 cmp r9d, 2
14598af28: 7211 jb 0x14598af3b
14598af2a: 458d41fd lea r8d, [r9 - 3]
14598af2e: 4183f802 cmp r8d, 2
14598af32: 77d8 ja 0x14598af0c
14598af34: 41803c2403 cmp byte ptr [r12], 3
14598af39: 75d1 jne 0x14598af0c
14598af3b: 41807d0002 cmp byte ptr [r13], 2
14598af40: 75a2 jne 0x14598aee4
14598af42: f2410f1047ec movsd xmm0, qword ptr [r15 - 0x14]
14598af48: f20f100b movsd xmm1, qword ptr [rbx]
14598af4c: 0f5cc1 subps xmm0, xmm1
14598af4f: 0f59c0 mulps xmm0, xmm0
14598af52: f30f16c8 movshdup xmm1, xmm0
14598af56: f30f58c8 addss xmm1, xmm0
14598af5a: 0f57c0 xorps xmm0, xmm0
14598af5d: f30f51c1 sqrtss xmm0, xmm1
14598af61: f30f100f movss xmm1, dword ptr [rdi]
14598af65: 4585c9 test r9d, r9d
14598af68: 759d jne 0x14598af07
14598af6a: f30f58c9 addss xmm1, xmm1
14598af6e: eb97 jmp 0x14598af07
14598af70: 4d8b47e0 mov r8, qword ptr [r15 - 0x20]
14598af74: 4c8945e0 mov qword ptr [rbp - 0x20], r8
14598af78: 483b55e8 cmp rdx, qword ptr [rbp - 0x18]
14598af7c: 752b jne 0x14598afa9
14598af7e: 48c744242008000000 mov qword ptr [rsp + 0x20], 8
14598af87: 41b801000000 mov r8d, 1
14598af8d: 41b908000000 mov r9d, 8
14598af93: 488955d8 mov qword ptr [rbp - 0x28], rdx
14598af97: e804ee3600 call 0x145cf9da0
14598af9c: 90 nop
14598af9d: 488b45f0 mov rax, qword ptr [rbp - 0x10]
14598afa1: 488b55d8 mov rdx, qword ptr [rbp - 0x28]
14598afa5: 488d4de8 lea rcx, [rbp - 0x18]
14598afa9: 4c8b45e0 mov r8, qword ptr [rbp - 0x20]
14598afad: 4c8904d0 mov qword ptr [rax + rdx*8], r8
14598afb1: 48ffc2 inc rdx
14598afb4: 488955f8 mov qword ptr [rbp - 8], rdx
14598afb8: 4d39f7 cmp r15, r14
14598afbb: 0f851dffffff jne 0x14598aede
14598afc1: 488b45f8 mov rax, qword ptr [rbp - 8]
14598afc5: 48894610 mov qword ptr [rsi + 0x10], rax
14598afc9: 488b45e8 mov rax, qword ptr [rbp - 0x18]
14598afcd: 488906 mov qword ptr [rsi], rax
14598afd0: 488b45f0 mov rax, qword ptr [rbp - 0x10]
14598afd4: 48894608 mov qword ptr [rsi + 8], rax
14598afd8: e998feffff jmp 0x14598ae75
14598afdd: b908000000 mov ecx, 8
14598afe2: ba20000000 mov edx, 0x20
14598afe7: e89f0d5100 call 0x145e9bd8b
14598afec: 0f0b ud2
// linked-pickup-guids
14598b760: 55 push rbp
14598b761: 4157 push r15
14598b763: 4156 push r14
14598b765: 4155 push r13
14598b767: 4154 push r12
14598b769: 56 push rsi
14598b76a: 57 push rdi
14598b76b: 53 push rbx
14598b76c: 4883ec48 sub rsp, 0x48
14598b770: 488d6c2440 lea rbp, [rsp + 0x40]
14598b775: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
14598b77d: 4889ce mov rsi, rcx
14598b780: 4c8b32 mov r14, qword ptr [rdx]
14598b783: 4c8b7a08 mov r15, qword ptr [rdx + 8]
14598b787: 4d39fe cmp r14, r15
14598b78a: 7449 je 0x14598b7d5
14598b78c: 4c8b6210 mov r12, qword ptr [rdx + 0x10]
14598b790: 498b842458090000 mov rax, qword ptr [r12 + 0x958]
14598b798: 496b8c246009000070 imul rcx, qword ptr [r12 + 0x960], 0x70
14598b7a1: 498b7e28 mov rdi, qword ptr [r14 + 0x28]
14598b7a5: 4983c648 add r14, 0x48
14598b7a9: 4989c8 mov r8, rcx
14598b7ac: 4989c1 mov r9, rax
14598b7af: 90 nop
14598b7b0: 4d85c0 test r8, r8
14598b7b3: 741b je 0x14598b7d0
14598b7b5: 4d89ca mov r10, r9
14598b7b8: 4983c170 add r9, 0x70
14598b7bc: 4983c090 add r8, -0x70
14598b7c0: 41837a1801 cmp dword ptr [r10 + 0x18], 1
14598b7c5: 75e9 jne 0x14598b7b0
14598b7c7: 49397a20 cmp qword ptr [r10 + 0x20], rdi
14598b7cb: 75e3 jne 0x14598b7b0
14598b7cd: eb22 jmp 0x14598b7f1
14598b7cf: 90 nop
14598b7d0: 4d39fe cmp r14, r15
14598b7d3: 75cc jne 0x14598b7a1
14598b7d5: 48c70600000000 mov qword ptr [rsi], 0
14598b7dc: 48c7460808000000 mov qword ptr [rsi + 8], 8
14598b7e4: 48c7461000000000 mov qword ptr [rsi + 0x10], 0
14598b7ec: e906010000 jmp 0x14598b8f7
14598b7f1: 4c8932 mov qword ptr [rdx], r14
14598b7f4: e8076a67fa call 0x140002200
14598b7f9: b920000000 mov ecx, 0x20
14598b7fe: ba08000000 mov edx, 8
14598b803: e8b86967fa call 0x1400021c0
14598b808: 4885c0 test rax, rax
14598b80b: 0f84fa000000 je 0x14598b90b
14598b811: 488938 mov qword ptr [rax], rdi
14598b814: 48c745e804000000 mov qword ptr [rbp - 0x18], 4
14598b81c: 488945f0 mov qword ptr [rbp - 0x10], rax
14598b820: 48c745f801000000 mov qword ptr [rbp - 8], 1
14598b828: 4d39fe cmp r14, r15
14598b82b: 0f84af000000 je 0x14598b8e0
14598b831: bf01000000 mov edi, 1
14598b836: 488d5de8 lea rbx, [rbp - 0x18]
14598b83a: eb18 jmp 0x14598b854
14598b83c: 0f1f4000 nop dword ptr [rax]
14598b840: 4c892cf8 mov qword ptr [rax + rdi*8], r13
14598b844: 48ffc7 inc rdi
14598b847: 48897df8 mov qword ptr [rbp - 8], rdi
14598b84b: 4d39fe cmp r14, r15
14598b84e: 0f848c000000 je 0x14598b8e0
14598b854: 498b8c2458090000 mov rcx, qword ptr [r12 + 0x958]
14598b85c: 496b94246009000070 imul rdx, qword ptr [r12 + 0x960], 0x70
14598b865: 4d8b6e28 mov r13, qword ptr [r14 + 0x28]
14598b869: 4983c648 add r14, 0x48
14598b86d: 4989d0 mov r8, rdx
14598b870: 4989c9 mov r9, rcx
14598b873: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14598b880: 4d85c0 test r8, r8
14598b883: 741b je 0x14598b8a0
14598b885: 4d89ca mov r10, r9
14598b888: 4983c170 add r9, 0x70
14598b88c: 4983c090 add r8, -0x70
14598b890: 41837a1801 cmp dword ptr [r10 + 0x18], 1
14598b895: 75e9 jne 0x14598b880
14598b897: 4d396a20 cmp qword ptr [r10 + 0x20], r13
14598b89b: 75e3 jne 0x14598b880
14598b89d: eb11 jmp 0x14598b8b0
14598b89f: 90 nop
14598b8a0: 4d39fe cmp r14, r15
14598b8a3: 75c0 jne 0x14598b865
14598b8a5: eb39 jmp 0x14598b8e0
14598b8a7: 660f1f840000000000 nop word ptr [rax + rax]
14598b8b0: 483b7de8 cmp rdi, qword ptr [rbp - 0x18]
14598b8b4: 758a jne 0x14598b840
14598b8b6: 48c744242008000000 mov qword ptr [rsp + 0x20], 8
14598b8bf: 41b801000000 mov r8d, 1
14598b8c5: 41b908000000 mov r9d, 8
14598b8cb: 4889d9 mov rcx, rbx
14598b8ce: 4889fa mov rdx, rdi
14598b8d1: e8cae43600 call 0x145cf9da0
14598b8d6: 90 nop
14598b8d7: 488b45f0 mov rax, qword ptr [rbp - 0x10]
14598b8db: e960ffffff jmp 0x14598b840
14598b8e0: 488b45f8 mov rax, qword ptr [rbp - 8]
14598b8e4: 48894610 mov qword ptr [rsi + 0x10], rax
14598b8e8: 488b45e8 mov rax, qword ptr [rbp - 0x18]
14598b8ec: 488906 mov qword ptr [rsi], rax
14598b8ef: 488b45f0 mov rax, qword ptr [rbp - 0x10]
14598b8f3: 48894608 mov qword ptr [rsi + 8], rax
14598b8f7: 4889f0 mov rax, rsi
14598b8fa: 4883c448 add rsp, 0x48
14598b8fe: 5b pop rbx
14598b8ff: 5f pop rdi
14598b900: 5e pop rsi
14598b901: 415c pop r12
14598b903: 415d pop r13
14598b905: 415e pop r14
14598b907: 415f pop r15
14598b909: 5d pop rbp
14598b90a: c3 ret
14598b90b: b908000000 mov ecx, 8
14598b910: ba20000000 mov edx, 0x20
14598b915: e871045100 call 0x145e9bd8b
14598b91a: 0f0b ud2
// free-instance
145939920: 4157 push r15
145939922: 4156 push r14
145939924: 4155 push r13
145939926: 4154 push r12
145939928: 56 push rsi
145939929: 57 push rdi
14593992a: 55 push rbp
14593992b: 53 push rbx
14593992c: 4883ec38 sub rsp, 0x38
145939930: 4c89442428 mov qword ptr [rsp + 0x28], r8
145939935: 4889d3 mov rbx, rdx
145939938: 4889ce mov rsi, rcx
14593993b: 4c8baa30030000 mov r13, qword ptr [rdx + 0x330]
145939942: 488b8238030000 mov rax, qword ptr [rdx + 0x338]
145939949: 4889442430 mov qword ptr [rsp + 0x30], rax
14593994e: 4885c0 test rax, rax
145939951: 0f84a1000000 je 0x1459399f8
145939957: 4c6b64243058 imul r12, qword ptr [rsp + 0x30], 0x58
14593995d: 488b442428 mov rax, qword ptr [rsp + 0x28]
145939962: 4c8b30 mov r14, qword ptr [rax]
145939965: 4c8b7808 mov r15, qword ptr [rax + 8]
145939969: 31ed xor ebp, ebp
14593996b: eb0c jmp 0x145939979
14593996d: 0f1f00 nop dword ptr [rax]
145939970: 4883c558 add rbp, 0x58
145939974: 4939ec cmp r12, rbp
145939977: 747f je 0x1459399f8
145939979: 498b7c2d00 mov rdi, qword ptr [r13 + rbp]
14593997e: 4c397f08 cmp qword ptr [rdi + 8], r15
145939982: 75ec jne 0x145939970
145939984: 488b0f mov rcx, qword ptr [rdi]
145939987: 4c89f2 mov rdx, r14
14593998a: 4d89f8 mov r8, r15
14593998d: e8ffff3b00 call 0x145cf9991
145939992: 85c0 test eax, eax
145939994: 75da jne 0x145939970
145939996: 418b442d08 mov eax, dword ptr [r13 + rbp + 8]
14593999b: f3410f10442d14 movss xmm0, dword ptr [r13 + rbp + 0x14]
1459399a2: 418b4c2d18 mov ecx, dword ptr [r13 + rbp + 0x18]
1459399a7: 418b542d34 mov edx, dword ptr [r13 + rbp + 0x34]
1459399ac: 895634 mov dword ptr [rsi + 0x34], edx
1459399af: 410f104c2d24 movups xmm1, xmmword ptr [r13 + rbp + 0x24]
1459399b5: 0f114e24 movups xmmword ptr [rsi + 0x24], xmm1
1459399b9: 410f104c2d38 movups xmm1, xmmword ptr [r13 + rbp + 0x38]
1459399bf: 410f10542d44 movups xmm2, xmmword ptr [r13 + rbp + 0x44]
1459399c5: 0f115644 movups xmmword ptr [rsi + 0x44], xmm2
1459399c9: 0f114e38 movups xmmword ptr [rsi + 0x38], xmm1
1459399cd: 48893e mov qword ptr [rsi], rdi
1459399d0: 894608 mov dword ptr [rsi + 8], eax
1459399d3: f2410f104c2d0c movsd xmm1, qword ptr [r13 + rbp + 0xc]
1459399da: f20f114e0c movsd qword ptr [rsi + 0xc], xmm1
1459399df: f30f114614 movss dword ptr [rsi + 0x14], xmm0
1459399e4: 894e18 mov dword ptr [rsi + 0x18], ecx
1459399e7: f2410f10442d1c movsd xmm0, qword ptr [r13 + rbp + 0x1c]
1459399ee: f20f11461c movsd qword ptr [rsi + 0x1c], xmm0
1459399f3: e92c010000 jmp 0x145939b24
1459399f8: 0f57c0 xorps xmm0, xmm0
1459399fb: 0f114624 movups xmmword ptr [rsi + 0x24], xmm0
1459399ff: c7463400000000 mov dword ptr [rsi + 0x34], 0
145939a06: 4c8b442428 mov r8, qword ptr [rsp + 0x28]
145939a0b: 4c8906 mov qword ptr [rsi], r8
145939a0e: c7460801000000 mov dword ptr [rsi + 8], 1
145939a15: f20f1005e3865a00 movsd xmm0, qword ptr [rip + 0x5a86e3]
145939a1d: f20f11460c movsd qword ptr [rsi + 0xc], xmm0
145939a22: 48c746140000803f mov qword ptr [rsi + 0x14], 0x3f800000
145939a2a: f20f1005ce1f5900 movsd xmm0, qword ptr [rip + 0x591fce]
145939a32: f20f11461c movsd qword ptr [rsi + 0x1c], xmm0
145939a37: 488d4e38 lea rcx, [rsi + 0x38]
145939a3b: f20f114638 movsd qword ptr [rsi + 0x38], xmm0
145939a40: c7464000000000 mov dword ptr [rsi + 0x40], 0
145939a47: 0f2805c2865a00 movaps xmm0, xmmword ptr [rip + 0x5a86c2]
145939a4e: 0f114644 movups xmmword ptr [rsi + 0x44], xmm0
145939a52: 4881c3f0070000 add rbx, 0x7f0
145939a59: 4889da mov rdx, rbx
145939a5c: e83fe5edff call 0x145817fa0
145939a61: 4c8b4c2430 mov r9, qword ptr [rsp + 0x30]
145939a66: 4d85c9 test r9, r9
145939a69: 0f84b5000000 je 0x145939b24
145939a6f: 4489c8 mov eax, r9d
145939a72: 83e003 and eax, 3
145939a75: 4983f904 cmp r9, 4
145939a79: 730c jae 0x145939a87
145939a7b: f30f1005491f5900 movss xmm0, dword ptr [rip + 0x591f49]
145939a83: 31c9 xor ecx, ecx
145939a85: eb5b jmp 0x145939ae2
145939a87: 48bafcffffffffffff01 movabs rdx, 0x1fffffffffffffc
145939a91: 4c21ca and rdx, r9
145939a94: 4d8d8518010000 lea r8, [r13 + 0x118]
145939a9b: f30f1005291f5900 movss xmm0, dword ptr [rip + 0x591f29]
145939aa3: 31c9 xor ecx, ecx
145939aa5: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
145939ab0: f3410f5880f8feffff addss xmm0, dword ptr [r8 - 0x108]
145939ab9: f3410f588050ffffff addss xmm0, dword ptr [r8 - 0xb0]
145939ac2: f3410f5840a8 addss xmm0, dword ptr [r8 - 0x58]
145939ac8: f3410f5800 addss xmm0, dword ptr [r8]
145939acd: 4883c104 add rcx, 4
145939ad1: 4981c060010000 add r8, 0x160
145939ad8: 4839ca cmp rdx, rcx
145939adb: 75d3 jne 0x145939ab0
145939add: 4885c0 test rax, rax
145939ae0: 742c je 0x145939b0e
145939ae2: 486bc958 imul rcx, rcx, 0x58
145939ae6: 4c01e9 add rcx, r13
145939ae9: 4883c110 add rcx, 0x10
145939aed: 486bc058 imul rax, rax, 0x58
145939af1: 31d2 xor edx, edx
145939af3: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145939b00: f30f580411 addss xmm0, dword ptr [rcx + rdx]
145939b05: 4883c258 add rdx, 0x58
145939b09: 4839d0 cmp rax, rdx
145939b0c: 75f2 jne 0x145939b00
145939b0e: f3490f2ac9 cvtsi2ss xmm1, r9
145939b13: f30f5ec1 divss xmm0, xmm1
145939b17: f30f5f0565855600 maxss xmm0, dword ptr [rip + 0x568565]
145939b1f: f30f114610 movss dword ptr [rsi + 0x10], xmm0
145939b24: 4883c438 add rsp, 0x38
145939b28: 5b pop rbx
145939b29: 5d pop rbp
145939b2a: 5f pop rdi
145939b2b: 5e pop rsi
145939b2c: 415c pop r12
145939b2e: 415d pop r13
145939b30: 415e pop r14
145939b32: 415f pop r15
145939b34: c3 ret
// delayed-action-admission
145913fc9: 498b8fb0050000 mov rcx, qword ptr [r15 + 0x5b0]
145913fd0: f30f10443108 movss xmm0, dword ptr [rcx + rsi + 8]
145913fd6: 0f2e8540020000 ucomiss xmm0, dword ptr [rbp + 0x240]
145913fdd: 0f8784090000 ja 0x145914967
// delayed-action-snapshot-compaction
145914068: 4c8b39 mov r15, qword ptr [rcx]
14591406b: 8b4110 mov eax, dword ptr [rcx + 0x10]
14591406e: 8985e0010000 mov dword ptr [rbp + 0x1e0], eax
145914074: 4c8b6914 mov r13, qword ptr [rcx + 0x14]
145914078: 0fb6413c movzx eax, byte ptr [rcx + 0x3c]
14591407c: 888520020000 mov byte ptr [rbp + 0x220], al
145914082: 0f10412c movups xmm0, xmmword ptr [rcx + 0x2c]
145914086: 0f298510020000 movaps xmmword ptr [rbp + 0x210], xmm0
14591408d: 0f10411c movups xmm0, xmmword ptr [rcx + 0x1c]
145914091: 0f298500020000 movaps xmmword ptr [rbp + 0x200], xmm0
145914098: 0fb6713d movzx esi, byte ptr [rcx + 0x3d]
14591409c: 440fb7613e movzx r12d, word ptr [rcx + 0x3e]
1459140a1: 488d5140 lea rdx, [rcx + 0x40]
1459140a5: 4d8d043e lea r8, [r14 + rdi]
1459140a9: 49c1e006 shl r8, 6
1459140ad: e8eb583e00 call 0x145cf999d
1459140b2: 49ffce dec r14
1459140b5: 488b8d48020000 mov rcx, qword ptr [rbp + 0x248]
1459140bc: 4c89b1b8050000 mov qword ptr [rcx + 0x5b8], r14
