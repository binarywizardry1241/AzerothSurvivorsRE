1405e3020: 55 push rbp
1405e3021: 4157 push r15
1405e3023: 4156 push r14
1405e3025: 4155 push r13
1405e3027: 4154 push r12
1405e3029: 56 push rsi
1405e302a: 57 push rdi
1405e302b: 53 push rbx
1405e302c: 4881ec98000000 sub rsp, 0x98
1405e3033: 488dac2480000000 lea rbp, [rsp + 0x80]
1405e303b: 48c74510feffffff mov qword ptr [rbp + 0x10], 0xfffffffffffffffe
1405e3043: 4889d0 mov rax, rdx
1405e3046: 48894d00 mov qword ptr [rbp], rcx
1405e304a: 410fb7c8 movzx ecx, r8w
1405e304e: 81f959010000 cmp ecx, 0x159
1405e3054: 7728 ja 0x1405e307e
1405e3056: 488d15fb539905 lea rdx, [rip + 0x59953fb]
1405e305d: 48630c8a movsxd rcx, dword ptr [rdx + rcx*4]
1405e3061: 4801d1 add rcx, rdx
1405e3064: ffe1 jmp rcx
1405e317c: 488d0d8d1a9805 lea rcx, [rip + 0x5981a8d]
1405e3183: eb67 jmp 0x1405e31ec
1405e31ec: 48894d08 mov qword ptr [rbp + 8], rcx
1405e31f0: bb0b000000 mov ebx, 0xb
1405e31f5: e984000000 jmp 0x1405e327e
1405e3215: 488d0d261a9805 lea rcx, [rip + 0x5981a26]
1405e321c: 48894d08 mov qword ptr [rbp + 8], rcx
1405e3220: bb0e000000 mov ebx, 0xe
1405e3225: eb57 jmp 0x1405e327e
1405e327e: 488d4dc8 lea rcx, [rbp - 0x38]
1405e3282: 488b5500 mov rdx, qword ptr [rbp]
1405e3286: 4989c0 mov r8, rax
1405e3289: e8e2a89c04 call 0x144fadb70
1405e328e: 488b55c8 mov rdx, qword ptr [rbp - 0x38]
1405e3292: 488b4dd0 mov rcx, qword ptr [rbp - 0x30]
1405e3296: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1405e329a: 48c1e003 shl rax, 3
1405e329e: 4c8d3440 lea r14, [rax + rax*2]
1405e32a2: 4901ce add r14, rcx
1405e32a5: 48894dc8 mov qword ptr [rbp - 0x38], rcx
1405e32a9: 488955b8 mov qword ptr [rbp - 0x48], rdx
1405e32ad: 488955d8 mov qword ptr [rbp - 0x28], rdx
1405e32b1: 4c8975e0 mov qword ptr [rbp - 0x20], r14
1405e32b5: 4c8d7c40e8 lea r15, [rax + rax*2 - 0x18]
1405e32ba: 4c8d6920 lea r13, [rcx + 0x20]
1405e32be: 4c8d65a0 lea r12, [rbp - 0x60]
1405e32c2: 48894dc0 mov qword ptr [rbp - 0x40], rcx
1405e32c6: 4889c8 mov rax, rcx
1405e32c9: 4c39f0 cmp rax, r14
1405e32cc: 0f84f1000000 je 0x1405e33c3
1405e32d2: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1405e32e0: 488d7018 lea rsi, [rax + 0x18]
1405e32e4: 488975d0 mov qword ptr [rbp - 0x30], rsi
1405e32e8: 488b08 mov rcx, qword ptr [rax]
1405e32eb: 4883f9ff cmp rcx, -1
1405e32ef: 0f8486000000 je 0x1405e337b
1405e32f5: 48894df8 mov qword ptr [rbp - 8], rcx
1405e32f9: 488b4808 mov rcx, qword ptr [rax + 8]
1405e32fd: 48894de8 mov qword ptr [rbp - 0x18], rcx
1405e3301: 488b7810 mov rdi, qword ptr [rax + 0x10]
1405e3305: e8f6eea1ff call 0x140002200
1405e330a: b918000000 mov ecx, 0x18
1405e330f: ba08000000 mov edx, 8
1405e3314: e8a7eea1ff call 0x1400021c0
1405e3319: 488945f0 mov qword ptr [rbp - 0x10], rax
1405e331d: 4885c0 test rax, rax
1405e3320: 0f84d2000000 je 0x1405e33f8
1405e3326: 488b45f8 mov rax, qword ptr [rbp - 8]
1405e332a: 488b4df0 mov rcx, qword ptr [rbp - 0x10]
1405e332e: 488901 mov qword ptr [rcx], rax
1405e3331: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1405e3335: 48894108 mov qword ptr [rcx + 8], rax
1405e3339: 48897910 mov qword ptr [rcx + 0x10], rdi
1405e333d: 48c745a001000000 mov qword ptr [rbp - 0x60], 1
1405e3345: 48894da8 mov qword ptr [rbp - 0x58], rcx
1405e3349: 48c745b001000000 mov qword ptr [rbp - 0x50], 1
1405e3351: 488b4d00 mov rcx, qword ptr [rbp]
1405e3355: 488b5508 mov rdx, qword ptr [rbp + 8]
1405e3359: 4989d8 mov r8, rbx
1405e335c: 4d89e1 mov r9, r12
1405e335f: e8fc7f9b04 call 0x144f9b360
1405e3364: 90 nop
1405e3365: 4983c7e8 add r15, -0x18
1405e3369: 4983c518 add r13, 0x18
1405e336d: 4889f0 mov rax, rsi
1405e3370: 4c39f0 cmp rax, r14
1405e3373: 0f8567ffffff jne 0x1405e32e0
1405e3379: eb48 jmp 0x1405e33c3
1405e33c3: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1405e33c7: 4885c0 test rax, rax
1405e33ca: 7418 je 0x1405e33e4
1405e33cc: 48c1e003 shl rax, 3
1405e33d0: 488d1440 lea rdx, [rax + rax*2]
1405e33d4: 41b808000000 mov r8d, 8
1405e33da: 488b4dc0 mov rcx, qword ptr [rbp - 0x40]
1405e33de: e8ededa1ff call 0x1400021d0
1405e33e3: 90 nop
1405e33e4: 4881c498000000 add rsp, 0x98
1405e33eb: 5b pop rbx
1405e33ec: 5f pop rdi
1405e33ed: 5e pop rsi
1405e33ee: 415c pop r12
1405e33f0: 415d pop r13
1405e33f2: 415e pop r14
1405e33f4: 415f pop r15
1405e33f6: 5d pop rbp
1405e33f7: c3 ret
1406411c7: 664489cb mov bx, r9w
1406411cb: 488b8da0030000 mov rcx, qword ptr [rbp + 0x3a0]
1406411d2: 4c89fa mov rdx, r15
1406411d5: e806cf9604 call 0x144fae0e0
1406411da: 90 nop
1406411db: 84c0 test al, al
1406411dd: 0f84f3fdffff je 0x140640fd6
1406411e3: 488b8da0030000 mov rcx, qword ptr [rbp + 0x3a0]
1406411ea: 4c89fa mov rdx, r15
1406411ed: 4189d8 mov r8d, ebx
1406411f0: e82b1efaff call 0x1405e3020
1406411f5: 90 nop
1406411f6: e9dbfdffff jmp 0x140640fd6
144fadb70: 55 push rbp
144fadb71: 56 push rsi
144fadb72: 57 push rdi
144fadb73: 53 push rbx
144fadb74: 4883ec48 sub rsp, 0x48
144fadb78: 488d6c2440 lea rbp, [rsp + 0x40]
144fadb7d: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
144fadb85: 4c89c7 mov rdi, r8
144fadb88: 4889ce mov rsi, rcx
144fadb8b: 488b0a mov rcx, qword ptr [rdx]
144fadb8e: e89d143100 call 0x1452bf030
144fadb93: 4885c0 test rax, rax
144fadb96: 747c je 0x144fadc14
144fadb98: 4889c3 mov rbx, rax
144fadb9b: 488945e8 mov qword ptr [rbp - 0x18], rax
144fadb9f: 488b4010 mov rax, qword ptr [rax + 0x10]
144fadba3: 48b9ffffffffffffff7f movabs rcx, 0x7fffffffffffffff
144fadbad: 4839c8 cmp rax, rcx
144fadbb0: 734f jae 0x144fadc01
144fadbb2: 488d4b10 lea rcx, [rbx + 0x10]
144fadbb6: 48ffc0 inc rax
144fadbb9: 48894310 mov qword ptr [rbx + 0x10], rax
144fadbbd: 488d4318 lea rax, [rbx + 0x18]
144fadbc1: 488945e8 mov qword ptr [rbp - 0x18], rax
144fadbc5: 48894df0 mov qword ptr [rbp - 0x10], rcx
144fadbc9: 48895df8 mov qword ptr [rbp - 8], rbx
144fadbcd: 4889da mov rdx, rbx
144fadbd0: 4881c2b0440000 add rdx, 0x44b0
144fadbd7: 4889f1 mov rcx, rsi
144fadbda: 4989f8 mov r8, rdi
144fadbdd: e82ec60f00 call 0x1450aa210
144fadbe2: 90 nop
144fadbe3: 48ff4b10 dec qword ptr [rbx + 0x10]
144fadbe7: 48ff0b dec qword ptr [rbx]
144fadbea: 7509 jne 0x144fadbf5
144fadbf5: 4889f0 mov rax, rsi
144fadbf8: 4883c448 add rsp, 0x48
144fadbfc: 5b pop rbx
144fadbfd: 5f pop rdi
144fadbfe: 5e pop rsi
144fadbff: 5d pop rbp
144fadc00: c3 ret
144fae0e0: 55 push rbp
144fae0e1: 56 push rsi
144fae0e2: 57 push rdi
144fae0e3: 53 push rbx
144fae0e4: 4883ec48 sub rsp, 0x48
144fae0e8: 488d6c2440 lea rbp, [rsp + 0x40]
144fae0ed: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
144fae0f5: 4889d6 mov rsi, rdx
144fae0f8: 488b09 mov rcx, qword ptr [rcx]
144fae0fb: e8300f3100 call 0x1452bf030
144fae100: 4885c0 test rax, rax
144fae103: 747a je 0x144fae17f
144fae105: 4889c7 mov rdi, rax
144fae108: 488945e8 mov qword ptr [rbp - 0x18], rax
144fae10c: 488b4010 mov rax, qword ptr [rax + 0x10]
144fae110: 48b9ffffffffffffff7f movabs rcx, 0x7fffffffffffffff
144fae11a: 4839c8 cmp rax, rcx
144fae11d: 734d jae 0x144fae16c
144fae11f: 488d4f10 lea rcx, [rdi + 0x10]
144fae123: 48ffc0 inc rax
144fae126: 48894710 mov qword ptr [rdi + 0x10], rax
144fae12a: 488d4718 lea rax, [rdi + 0x18]
144fae12e: 488945e8 mov qword ptr [rbp - 0x18], rax
144fae132: 48894df0 mov qword ptr [rbp - 0x10], rcx
144fae136: 48897df8 mov qword ptr [rbp - 8], rdi
144fae13a: 4889f9 mov rcx, rdi
144fae13d: 4881c1b0440000 add rcx, 0x44b0
144fae144: 4889f2 mov rdx, rsi
144fae147: e8c4bc0f00 call 0x1450a9e10
144fae14c: 90 nop
144fae14d: 48ff4f10 dec qword ptr [rdi + 0x10]
144fae151: 48ff0f dec qword ptr [rdi]
144fae154: 750d jne 0x144fae163
144fae163: 4883c448 add rsp, 0x48
144fae167: 5b pop rbx
144fae168: 5f pop rdi
144fae169: 5e pop rsi
144fae16a: 5d pop rbp
144fae16b: c3 ret
1450a9e10: 56 push rsi
1450a9e11: 4885d2 test rdx, rdx
1450a9e14: 0f846f010000 je 0x1450a9f89
1450a9e1a: 4c8b4160 mov r8, qword ptr [rcx + 0x60]
1450a9e1e: b001 mov al, 1
1450a9e20: 4c39c2 cmp rdx, r8
1450a9e23: 0f84d7000000 je 0x1450a9f00
1450a9e29: 4d85c0 test r8, r8
1450a9e2c: 410f95c0 setne r8b
1450a9e30: 483b5168 cmp rdx, qword ptr [rcx + 0x68]
1450a9e34: 410f94c1 sete r9b
1450a9e38: 4584c8 test r8b, r9b
1450a9e3b: 0f85bf000000 jne 0x1450a9f00
1450a9e41: 483b5170 cmp rdx, qword ptr [rcx + 0x70]
1450a9e45: 0f84b5000000 je 0x1450a9f00
1450a9e4b: 48399188000000 cmp qword ptr [rcx + 0x88], rdx
1450a9e52: 0f84a8000000 je 0x1450a9f00
1450a9e58: 48399190000000 cmp qword ptr [rcx + 0x90], rdx
1450a9e5f: 0f849b000000 je 0x1450a9f00
1450a9e65: 48399198000000 cmp qword ptr [rcx + 0x98], rdx
1450a9e6c: 0f848e000000 je 0x1450a9f00
1450a9e72: 483991a0000000 cmp qword ptr [rcx + 0xa0], rdx
1450a9e79: 0f8481000000 je 0x1450a9f00
1450a9e7f: 483991a8000000 cmp qword ptr [rcx + 0xa8], rdx
1450a9e86: 7478 je 0x1450a9f00
1450a9e88: 483991b0000000 cmp qword ptr [rcx + 0xb0], rdx
1450a9e8f: 746f je 0x1450a9f00
1450a9e91: 483991b8000000 cmp qword ptr [rcx + 0xb8], rdx
1450a9e98: 7466 je 0x1450a9f00
1450a9e9a: 483991c0000000 cmp qword ptr [rcx + 0xc0], rdx
1450a9ea1: 745d je 0x1450a9f00
1450a9ea3: 4c8b5108 mov r10, qword ptr [rcx + 8]
1450a9ea7: 4c8b4910 mov r9, qword ptr [rcx + 0x10]
1450a9eab: 49b8f8ffffffffffff0f movabs r8, 0xffffffffffffff8
1450a9eb5: 4d89cb mov r11, r9
1450a9eb8: 4d21c3 and r11, r8
1450a9ebb: 31f6 xor esi, esi
1450a9ebd: 0f1f00 nop dword ptr [rax]
1450a9ec0: 4939f3 cmp r11, rsi
1450a9ec3: 743f je 0x1450a9f04
1450a9f00: 2401 and al, 1
1450a9f02: 5e pop rsi
1450a9f03: c3 ret
1450a9f04: 41c1e103 shl r9d, 3
1450a9f08: 4183e138 and r9d, 0x38
1450a9f0c: 740c je 0x1450a9f1a
1450a9f1a: 4c8b4920 mov r9, qword ptr [rcx + 0x20]
1450a9f1e: 488b4928 mov rcx, qword ptr [rcx + 0x28]
1450a9f22: 4921c8 and r8, rcx
1450a9f25: 4531d2 xor r10d, r10d
1450a9f28: 0f1f840000000000 nop dword ptr [rax + rax]
1450a9f30: 4d39d0 cmp r8, r10
1450a9f33: 743d je 0x1450a9f72
1450a9f72: c1e103 shl ecx, 3
1450a9f75: 83e138 and ecx, 0x38
1450a9f78: 740f je 0x1450a9f89
1450a9f89: 31c0 xor eax, eax
1450a9f8b: 2401 and al, 1
1450a9f8d: 5e pop rsi
1450a9f8e: c3 ret
1450aa210: 55 push rbp
1450aa211: 4157 push r15
1450aa213: 4156 push r14
1450aa215: 4155 push r13
1450aa217: 4154 push r12
1450aa219: 56 push rsi
1450aa21a: 57 push rdi
1450aa21b: 53 push rbx
1450aa21c: 4881ecc8000000 sub rsp, 0xc8
1450aa223: 488dac2480000000 lea rbp, [rsp + 0x80]
1450aa22b: 48c74540feffffff mov qword ptr [rbp + 0x40], 0xfffffffffffffffe
1450aa233: 4889ce mov rsi, rcx
1450aa236: 48c7452800000000 mov qword ptr [rbp + 0x28], 0
1450aa23e: 48c7453008000000 mov qword ptr [rbp + 0x30], 8
1450aa246: 48c7453800000000 mov qword ptr [rbp + 0x38], 0
1450aa24e: 4d85c0 test r8, r8
1450aa251: 0f8487040000 je 0x1450aa6de
1450aa257: 4889d3 mov rbx, rdx
1450aa25a: 488b4260 mov rax, qword ptr [rdx + 0x60]
1450aa25e: 4885c0 test rax, rax
1450aa261: 0f8477040000 je 0x1450aa6de
1450aa267: 4c89c7 mov rdi, r8
1450aa26a: 4c8b6b68 mov r13, qword ptr [rbx + 0x68]
1450aa26e: 4c8b6370 mov r12, qword ptr [rbx + 0x70]
1450aa272: 4c39c0 cmp rax, r8
1450aa275: 7577 jne 0x1450aa2ee
1450aa2ee: 4939fd cmp r13, rdi
1450aa2f1: 7574 jne 0x1450aa367
1450aa367: 4939fc cmp r12, rdi
1450aa36a: 7577 jne 0x1450aa3e3
1450aa36c: e88f7ef5fa call 0x140002200
1450aa371: 41be06000000 mov r14d, 6
1450aa377: b906000000 mov ecx, 6
1450aa37c: ba01000000 mov edx, 1
1450aa381: e83a7ef5fa call 0x1400021c0
1450aa386: 4885c0 test rax, rax
1450aa389: 0f847d030000 je 0x1450aa70c
1450aa38f: 4989c7 mov r15, rax
1450aa392: 66c740046574 mov word ptr [rax + 4], 0x7465
1450aa398: c70074617267 mov dword ptr [rax], 0x67726174
1450aa39e: 4c8b7538 mov r14, qword ptr [rbp + 0x38]
1450aa3a2: 4c3b7528 cmp r14, qword ptr [rbp + 0x28]
1450aa3a6: 7516 jne 0x1450aa3be
1450aa3a8: 48c7451806000000 mov qword ptr [rbp + 0x18], 6
1450aa3b0: 4c897d10 mov qword ptr [rbp + 0x10], r15
1450aa3b4: 488d4d28 lea rcx, [rbp + 0x28]
1450aa3b8: e883fac400 call 0x145cf9e40
1450aa3bd: 90 nop
1450aa3be: 488b4530 mov rax, qword ptr [rbp + 0x30]
1450aa3c2: 4b8d0c76 lea rcx, [r14 + r14*2]
1450aa3c6: 48c704c806000000 mov qword ptr [rax + rcx*8], 6
1450aa3ce: 4c897cc808 mov qword ptr [rax + rcx*8 + 8], r15
1450aa3d3: 48c744c81006000000 mov qword ptr [rax + rcx*8 + 0x10], 6
1450aa3dc: 49ffc6 inc r14
1450aa3df: 4c897538 mov qword ptr [rbp + 0x38], r14
1450aa3e3: 31c0 xor eax, eax
1450aa3e5: 4839bb88000000 cmp qword ptr [rbx + 0x88], rdi
1450aa3ec: 7452 je 0x1450aa440
1450aa3ee: 4839bba8000000 cmp qword ptr [rbx + 0xa8], rdi
1450aa3f5: 7449 je 0x1450aa440
1450aa3f7: b801000000 mov eax, 1
1450aa3fc: 4839bb90000000 cmp qword ptr [rbx + 0x90], rdi
1450aa403: 743b je 0x1450aa440
1450aa405: 4839bbb0000000 cmp qword ptr [rbx + 0xb0], rdi
1450aa40c: 7432 je 0x1450aa440
1450aa40e: b802000000 mov eax, 2
1450aa413: 4839bb98000000 cmp qword ptr [rbx + 0x98], rdi
1450aa41a: 7424 je 0x1450aa440
1450aa41c: 4839bbb8000000 cmp qword ptr [rbx + 0xb8], rdi
1450aa423: 741b je 0x1450aa440
1450aa425: b803000000 mov eax, 3
1450aa42a: 4839bba0000000 cmp qword ptr [rbx + 0xa0], rdi
1450aa431: 740d je 0x1450aa440
1450aa433: 4839bbc0000000 cmp qword ptr [rbx + 0xc0], rdi
1450aa43a: 0f85a4000000 jne 0x1450aa4e4
1450aa4e4: 488b4b08 mov rcx, qword ptr [rbx + 8]
1450aa4e8: 488b4310 mov rax, qword ptr [rbx + 0x10]
1450aa4ec: 4883f828 cmp rax, 0x28
1450aa4f0: 41b828000000 mov r8d, 0x28
1450aa4f6: 4c0f42c0 cmovb r8, rax
1450aa4fa: 4c8b4b28 mov r9, qword ptr [rbx + 0x28]
1450aa4fe: 4c8b5320 mov r10, qword ptr [rbx + 0x20]
1450aa502: 4531f6 xor r14d, r14d
1450aa505: 488d15a759bb01 lea rdx, [rip + 0x1bb59a7]
1450aa50c: 4c8d1d9959bb01 lea r11, [rip + 0x1bb5999]
1450aa513: eb18 jmp 0x1450aa52d
1450aa52d: 4d39f0 cmp r8, r14
1450aa530: 0f84a6000000 je 0x1450aa5dc
1450aa5dc: 4c8b7b78 mov r15, qword ptr [rbx + 0x78]
1450aa5e0: 4839bb80000000 cmp qword ptr [rbx + 0x80], rdi
1450aa5e7: 7574 jne 0x1450aa65d
1450aa65d: 4939ff cmp r15, rdi
1450aa660: 757c jne 0x1450aa6de
1450aa662: e8997bf5fa call 0x140002200
1450aa667: 41be09000000 mov r14d, 9
1450aa66d: b909000000 mov ecx, 9
1450aa672: ba01000000 mov edx, 1
1450aa677: e8447bf5fa call 0x1400021c0
1450aa67c: 4885c0 test rax, rax
1450aa67f: 0f8497000000 je 0x1450aa71c
1450aa685: 4889c7 mov rdi, rax
1450aa688: 48b86d6f7573656f7665 movabs rax, 0x65766f6573756f6d
1450aa692: 488907 mov qword ptr [rdi], rax
1450aa695: c6470872 mov byte ptr [rdi + 8], 0x72
1450aa699: 488b5d38 mov rbx, qword ptr [rbp + 0x38]
1450aa69d: 483b5d28 cmp rbx, qword ptr [rbp + 0x28]
1450aa6a1: 7516 jne 0x1450aa6b9
1450aa6b9: 488b4530 mov rax, qword ptr [rbp + 0x30]
1450aa6bd: 488d0c5b lea rcx, [rbx + rbx*2]
1450aa6c1: 48c704c809000000 mov qword ptr [rax + rcx*8], 9
1450aa6c9: 48897cc808 mov qword ptr [rax + rcx*8 + 8], rdi
1450aa6ce: 48c744c81009000000 mov qword ptr [rax + rcx*8 + 0x10], 9
1450aa6d7: 48ffc3 inc rbx
1450aa6da: 48895d38 mov qword ptr [rbp + 0x38], rbx
1450aa6de: 488b4538 mov rax, qword ptr [rbp + 0x38]
1450aa6e2: 48894610 mov qword ptr [rsi + 0x10], rax
1450aa6e6: 488b4528 mov rax, qword ptr [rbp + 0x28]
1450aa6ea: 488906 mov qword ptr [rsi], rax
1450aa6ed: 488b4530 mov rax, qword ptr [rbp + 0x30]
1450aa6f1: 48894608 mov qword ptr [rsi + 8], rax
1450aa6f5: 4889f0 mov rax, rsi
1450aa6f8: 4881c4c8000000 add rsp, 0xc8
1450aa6ff: 5b pop rbx
1450aa700: 5f pop rdi
1450aa701: 5e pop rsi
1450aa702: 415c pop r12
1450aa704: 415d pop r13
1450aa706: 415e pop r14
1450aa708: 415f pop r15
1450aa70a: 5d pop rbp
1450aa70b: c3 ret
