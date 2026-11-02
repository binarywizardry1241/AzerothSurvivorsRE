14589e760: 55 push rbp
14589e761: 4157 push r15
14589e763: 4156 push r14
14589e765: 56 push rsi
14589e766: 57 push rdi
14589e767: 53 push rbx
14589e768: 4881ecd8000000 sub rsp, 0xd8
14589e76f: 488dac2480000000 lea rbp, [rsp + 0x80]
14589e777: 48c74550feffffff mov qword ptr [rbp + 0x50], 0xfffffffffffffffe
14589e77f: 4889d7 mov rdi, rdx
14589e782: 4889ce mov rsi, rcx
14589e785: f30f11554c movss dword ptr [rbp + 0x4c], xmm2
14589e78a: 0fb65a44 movzx ebx, byte ptr [rdx + 0x44]
14589e78e: 440fb6f3 movzx r14d, bl
14589e792: 418d46fb lea eax, [r14 - 5]
14589e796: 83f80d cmp eax, 0xd
14589e799: 7719 ja 0x14589e7b4
14589e79b: 488d0df6763601 lea rcx, [rip + 0x13676f6]
14589e7a2: 48630481 movsxd rax, dword ptr [rcx + rax*4]
14589e7a6: 4801c8 add rax, rcx
14589e7a9: ffe0 jmp rax
14589e7ab: 488d454c lea rax, [rbp + 0x4c]
14589e7af: e9c1000000 jmp 0x14589e875
14589e7b4: f30f5915ccec5000 mulss xmm2, dword ptr [rip + 0x50eccc]
14589e7bc: f30f1155f0 movss dword ptr [rbp - 0x10], xmm2
14589e7c1: 488d45f0 lea rax, [rbp - 0x10]
14589e7c5: 48894530 mov qword ptr [rbp + 0x30], rax
14589e7c9: 488d0510f73400 lea rax, [rip + 0x34f710]
14589e7d0: 48894538 mov qword ptr [rbp + 0x38], rax
14589e7d4: 488d1541093601 lea rdx, [rip + 0x1360941]
14589e7db: 488d4d08 lea rcx, [rbp + 8]
14589e7df: 4c8d4530 lea r8, [rbp + 0x30]
14589e7e3: e848e93300 call 0x145bdd130
14589e7e8: 80fb06 cmp bl, 6
14589e7eb: 0f85a7000000 jne 0x14589e898
14589e7f1: f30f104d4c movss xmm1, dword ptr [rbp + 0x4c]
14589e7f6: f30f590d32c55100 mulss xmm1, dword ptr [rip + 0x51c532]
14589e7fe: f30f5d0d42835100 minss xmm1, dword ptr [rip + 0x518342]
14589e806: 488d4dd0 lea rcx, [rbp - 0x30]
14589e80a: e891ba0000 call 0x1458aa2a0
14589e80f: 90 nop
14589e810: e907010000 jmp 0x14589e91c
14589e815: f30f104740 movss xmm0, dword ptr [rdi + 0x40]
14589e81a: f30f59055eec5000 mulss xmm0, dword ptr [rip + 0x50ec5e]
14589e822: 0f28da movaps xmm3, xmm2
14589e825: f30f5dd8 minss xmm3, xmm0
14589e829: 0f28cb movaps xmm1, xmm3
14589e82c: f30fc2cb03 cmpunordss xmm1, xmm3
14589e831: 0f28c1 movaps xmm0, xmm1
14589e834: 0f55c3 andnps xmm0, xmm3
14589e837: 0f54ca andps xmm1, xmm2
14589e83a: 0f56c8 orps xmm1, xmm0
14589e83d: 488d4d08 lea rcx, [rbp + 8]
14589e841: e85aba0000 call 0x1458aa2a0
14589e846: eb50 jmp 0x14589e898
14589e848: 488d454c lea rax, [rbp + 0x4c]
14589e84c: 48894530 mov qword ptr [rbp + 0x30], rax
14589e850: 488d0589f63400 lea rax, [rip + 0x34f689]
14589e857: 48894538 mov qword ptr [rbp + 0x38], rax
14589e85b: 488d15ba083601 lea rdx, [rip + 0x13608ba]
14589e862: eb27 jmp 0x14589e88b
14589e864: f30f59151cec5000 mulss xmm2, dword ptr [rip + 0x50ec1c]
14589e86c: f30f1155f0 movss dword ptr [rbp - 0x10], xmm2
14589e871: 488d45f0 lea rax, [rbp - 0x10]
14589e875: 48894530 mov qword ptr [rbp + 0x30], rax
14589e879: 488d0560f63400 lea rax, [rip + 0x34f660]
14589e880: 48894538 mov qword ptr [rbp + 0x38], rax
14589e884: 488d1589083601 lea rdx, [rip + 0x1360889]
14589e88b: 488d4d08 lea rcx, [rbp + 8]
14589e88f: 4c8d4530 lea r8, [rbp + 0x30]
14589e893: e898e83300 call 0x145bdd130
14589e898: f30f10454c movss xmm0, dword ptr [rbp + 0x4c]
14589e89d: f30f59058f825100 mulss xmm0, dword ptr [rip + 0x51828f]
14589e8a5: f30f5905dbeb5000 mulss xmm0, dword ptr [rip + 0x50ebdb]
14589e8ad: f30f1145ec movss dword ptr [rbp - 0x14], xmm0
14589e8b2: 488d45ec lea rax, [rbp - 0x14]
14589e8b6: 488945f0 mov qword ptr [rbp - 0x10], rax
14589e8ba: 488d051ff63400 lea rax, [rip + 0x34f61f]
14589e8c1: 488945f8 mov qword ptr [rbp - 8], rax
14589e8c5: 488d1550083601 lea rdx, [rip + 0x1360850]
14589e8cc: 488d4d30 lea rcx, [rbp + 0x30]
14589e8d0: 4c8d45f0 lea r8, [rbp - 0x10]
14589e8d4: e857e83300 call 0x145bdd130
14589e8d9: 90 nop
14589e8da: 0f104530 movups xmm0, xmmword ptr [rbp + 0x30]
14589e8de: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
14589e8e2: 488b4540 mov rax, qword ptr [rbp + 0x40]
14589e8e6: 488945e0 mov qword ptr [rbp - 0x20], rax
14589e8ea: 4183fe06 cmp r14d, 6
14589e8ee: 742c je 0x14589e91c
14589e8f0: bb01000000 mov ebx, 1
14589e8f5: 4183fe05 cmp r14d, 5
14589e8f9: 753c jne 0x14589e937
14589e8fb: f30f104740 movss xmm0, dword ptr [rdi + 0x40]
14589e900: f30f590578eb5000 mulss xmm0, dword ptr [rip + 0x50eb78]
14589e908: f30f580540af9600 addss xmm0, dword ptr [rip + 0x96af40]
14589e910: f30f104d4c movss xmm1, dword ptr [rbp + 0x4c]
14589e915: 0f2ec8 ucomiss xmm1, xmm0
14589e918: 721d jb 0x14589e937
14589e91a: eb20 jmp 0x14589e93c
14589e91c: f30f10454c movss xmm0, dword ptr [rbp + 0x4c]
14589e921: f30f590507c45100 mulss xmm0, dword ptr [rip + 0x51c407]
14589e929: 0f2e05a8043601 ucomiss xmm0, dword ptr [rip + 0x13604a8]
14589e930: 730a jae 0x14589e93c
14589e932: bb01000000 mov ebx, 1
14589e937: 4531f6 xor r14d, r14d
14589e93a: eb29 jmp 0x14589e965
14589e93c: 488d1ddf073601 lea rbx, [rip + 0x13607df]
14589e943: 41bf06000000 mov r15d, 6
14589e949: ba06000000 mov edx, 6
14589e94e: 4889d9 mov rcx, rbx
14589e951: e87af40e00 call 0x14598ddd0
14589e956: 90 nop
14589e957: 4989d6 mov r14, rdx
14589e95a: 4885c0 test rax, rax
14589e95d: 480f45d8 cmovne rbx, rax
14589e961: 4d0f44f7 cmove r14, r15
14589e965: 4c8b7f30 mov r15, qword ptr [rdi + 0x30]
14589e969: 488b7f38 mov rdi, qword ptr [rdi + 0x38]
14589e96d: 4c89f9 mov rcx, r15
14589e970: 4889fa mov rdx, rdi
14589e973: e858f40e00 call 0x14598ddd0
14589e978: 90 nop
14589e979: 4989d0 mov r8, rdx
14589e97c: 4885c0 test rax, rax
14589e97f: 4c0f45f8 cmovne r15, rax
14589e983: 4c0f44c7 cmove r8, rdi
14589e987: 488b4d10 mov rcx, qword ptr [rbp + 0x10]
14589e98b: 488b4518 mov rax, qword ptr [rbp + 0x18]
14589e98f: 4889442430 mov qword ptr [rsp + 0x30], rax
14589e994: 48894d20 mov qword ptr [rbp + 0x20], rcx
14589e998: 48894c2428 mov qword ptr [rsp + 0x28], rcx
14589e99d: 48c744242003000000 mov qword ptr [rsp + 0x20], 3
14589e9a6: 4c8d0d7b073601 lea r9, [rip + 0x136077b]
14589e9ad: 488d4d30 lea rcx, [rbp + 0x30]
14589e9b1: 4c89fa mov rdx, r15
14589e9b4: e837bcffff call 0x14589a5f0
14589e9b9: 90 nop
14589e9ba: 488b5538 mov rdx, qword ptr [rbp + 0x38]
14589e9be: 4c8b4540 mov r8, qword ptr [rbp + 0x40]
14589e9c2: 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
14589e9c6: 488b45e0 mov rax, qword ptr [rbp - 0x20]
14589e9ca: 4889442430 mov qword ptr [rsp + 0x30], rax
14589e9cf: 48894d28 mov qword ptr [rbp + 0x28], rcx
14589e9d3: 48894c2428 mov qword ptr [rsp + 0x28], rcx
14589e9d8: 48c744242003000000 mov qword ptr [rsp + 0x20], 3
14589e9e1: 4c8d0d43073601 lea r9, [rip + 0x1360743]
14589e9e8: 488d4df0 lea rcx, [rbp - 0x10]
14589e9ec: 488955c0 mov qword ptr [rbp - 0x40], rdx
14589e9f0: e8fbbbffff call 0x14589a5f0
14589e9f5: 90 nop
14589e9f6: 488b55f8 mov rdx, qword ptr [rbp - 8]
14589e9fa: 4c8b4500 mov r8, qword ptr [rbp]
14589e9fe: 4c89742430 mov qword ptr [rsp + 0x30], r14
14589ea03: 48895c2428 mov qword ptr [rsp + 0x28], rbx
14589ea08: 48c744242005000000 mov qword ptr [rsp + 0x20], 5
14589ea11: 4c8d0d16073601 lea r9, [rip + 0x1360716]
14589ea18: 4889f1 mov rcx, rsi
14589ea1b: 488955c8 mov qword ptr [rbp - 0x38], rdx
14589ea1f: e8ccbbffff call 0x14589a5f0
14589ea24: 90 nop
14589ea25: 488b55d0 mov rdx, qword ptr [rbp - 0x30]
14589ea29: 4885d2 test rdx, rdx
14589ea2c: 740f je 0x14589ea3d
14589ea2e: 41b801000000 mov r8d, 1
14589ea34: 488b4d28 mov rcx, qword ptr [rbp + 0x28]
14589ea38: e8933776fa call 0x1400021d0
14589ea3d: 488b5508 mov rdx, qword ptr [rbp + 8]
14589ea41: 4885d2 test rdx, rdx
14589ea44: 740f je 0x14589ea55
14589ea46: 41b801000000 mov r8d, 1
14589ea4c: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14589ea50: e87b3776fa call 0x1400021d0
14589ea55: 488b55f0 mov rdx, qword ptr [rbp - 0x10]
14589ea59: 4885d2 test rdx, rdx
14589ea5c: 740f je 0x14589ea6d
14589ea5e: 41b801000000 mov r8d, 1
14589ea64: 488b4dc8 mov rcx, qword ptr [rbp - 0x38]
14589ea68: e8633776fa call 0x1400021d0
14589ea6d: 488b5530 mov rdx, qword ptr [rbp + 0x30]
14589ea71: 4885d2 test rdx, rdx
14589ea74: 740f je 0x14589ea85
14589ea76: 41b801000000 mov r8d, 1
14589ea7c: 488b4dc0 mov rcx, qword ptr [rbp - 0x40]
14589ea80: e84b3776fa call 0x1400021d0
14589ea85: 4889f0 mov rax, rsi
14589ea88: 4881c4d8000000 add rsp, 0xd8
14589ea8f: 5b pop rbx
14589ea90: 5f pop rdi
14589ea91: 5e pop rsi
14589ea92: 415e pop r14
14589ea94: 415f pop r15
14589ea96: 5d pop rbp
14589ea97: c3 ret
