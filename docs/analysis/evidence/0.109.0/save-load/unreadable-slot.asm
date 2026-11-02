14589b9d0: 55 push rbp
14589b9d1: 4157 push r15
14589b9d3: 4156 push r14
14589b9d5: 56 push rsi
14589b9d6: 57 push rdi
14589b9d7: 53 push rbx
14589b9d8: 4883ec68 sub rsp, 0x68
14589b9dc: 488d6c2460 lea rbp, [rsp + 0x60]
14589b9e1: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
14589b9e9: 4c89c6 mov rsi, r8
14589b9ec: 4889d7 mov rdi, rdx
14589b9ef: 4889cb mov rbx, rcx
14589b9f2: 4c8945d8 mov qword ptr [rbp - 0x28], r8
14589b9f6: 488d45d8 lea rax, [rbp - 0x28]
14589b9fa: 488945e0 mov qword ptr [rbp - 0x20], rax
14589b9fe: 488d05cb3d3400 lea rax, [rip + 0x343dcb]
14589ba05: 488945e8 mov qword ptr [rbp - 0x18], rax
14589ba09: 488d1510fc3401 lea rdx, [rip + 0x134fc10]
14589ba10: 488d4dc0 lea rcx, [rbp - 0x40]
14589ba14: 4c8d45e0 lea r8, [rbp - 0x20]
14589ba18: e813143300 call 0x145bcce30
14589ba1d: 488b55c8 mov rdx, qword ptr [rbp - 0x38]
14589ba21: 4c8b45d0 mov r8, qword ptr [rbp - 0x30]
14589ba25: 488d4de0 lea rcx, [rbp - 0x20]
14589ba29: 488955f8 mov qword ptr [rbp - 8], rdx
14589ba2d: e88e470500 call 0x1458f01c0
14589ba32: 90 nop
14589ba33: 4c8b75e0 mov r14, qword ptr [rbp - 0x20]
14589ba37: 4983feff cmp r14, -1
14589ba3b: 7427 je 0x14589ba64
14589ba3d: 4c8b7de8 mov r15, qword ptr [rbp - 0x18]
14589ba41: 48397df0 cmp qword ptr [rbp - 0x10], rdi
14589ba45: 7524 jne 0x14589ba6b
14589ba47: 4c89f9 mov rcx, r15
14589ba4a: 4889da mov rdx, rbx
14589ba4d: 4989f8 mov r8, rdi
14589ba50: e88ce63500 call 0x145bfa0e1
14589ba55: 31ff xor edi, edi
14589ba57: 85c0 test eax, eax
14589ba59: 400f94c7 sete dil
14589ba5d: 4d85f6 test r14, r14
14589ba60: 7510 jne 0x14589ba72
14589ba62: eb1f jmp 0x14589ba83
14589ba64: bf01000000 mov edi, 1
14589ba69: eb18 jmp 0x14589ba83
14589ba6b: 31ff xor edi, edi
14589ba6d: 4d85f6 test r14, r14
14589ba70: 7411 je 0x14589ba83
14589ba72: 41b801000000 mov r8d, 1
14589ba78: 4c89f9 mov rcx, r15
14589ba7b: 4c89f2 mov rdx, r14
14589ba7e: e84d6776fa call 0x1400021d0
14589ba83: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
14589ba87: 4885d2 test rdx, rdx
14589ba8a: 740f je 0x14589ba9b
14589ba8c: 41b801000000 mov r8d, 1
14589ba92: 488b4df8 mov rcx, qword ptr [rbp - 8]
14589ba96: e8356776fa call 0x1400021d0
14589ba9b: 4889f8 mov rax, rdi
14589ba9e: 4889f2 mov rdx, rsi
14589baa1: 4883c468 add rsp, 0x68
14589baa5: 5b pop rbx
14589baa6: 5f pop rdi
14589baa7: 5e pop rsi
14589baa8: 415e pop r14
14589baaa: 415f pop r15
14589baac: 5d pop rbp
14589baad: c3 ret
