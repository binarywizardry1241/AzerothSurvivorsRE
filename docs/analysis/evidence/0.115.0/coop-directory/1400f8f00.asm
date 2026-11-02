0x1400f8f00: push r15
0x1400f8f02: push r14
0x1400f8f04: push r13
0x1400f8f06: push r12
0x1400f8f08: push rsi
0x1400f8f09: push rdi
0x1400f8f0a: push rbp
0x1400f8f0b: push rbx
0x1400f8f0c: sub rsp, 0x308
0x1400f8f13: mov qword ptr [rsp + 0x38], rcx
0x1400f8f18: cmp rdx, 2
0x1400f8f1c: jb 0x1400f9699
0x1400f8f22: mov rbp, r8
0x1400f8f25: mov r8, rdx
0x1400f8f28: movabs rax, 0x4000000000000000
0x1400f8f32: xor edx, edx
0x1400f8f34: div r8
0x1400f8f37: cmp rdx, 1
0x1400f8f3b: sbb rax, -1
0x1400f8f3f: mov qword ptr [rsp + 0x80], rax
0x1400f8f47: cmp r8, 0x1001
0x1400f8f4e: mov qword ptr [rsp + 0x50], r8
0x1400f8f53: jae 0x1400f8f6d
0x1400f8f55: mov rax, r8
0x1400f8f58: shr rax, 1
0x1400f8f5b: sub r8, rax
0x1400f8f5e: cmp r8, 0x40
0x1400f8f62: mov eax, 0x40
0x1400f8f67: cmovb rax, r8
0x1400f8f6b: jmp 0x1400f8f7b
0x1400f8f6d: mov rcx, r8
0x1400f8f70: mov rdi, r9
0x1400f8f73: call 0x145cf15e0
0x1400f8f78: mov r9, rdi
0x1400f8f7b: mov qword ptr [rsp + 0x48], rax
0x1400f8f80: mov rax, qword ptr [rsp + 0x38]
0x1400f8f85: lea rcx, [rax + 0x2b0]
0x1400f8f8c: mov qword ptr [rsp + 0x70], rcx
0x1400f8f91: lea rcx, [rax + 0xe0]
0x1400f8f98: mov qword ptr [rsp + 0x68], rcx
0x1400f8f9d: lea rcx, [rax - 0x10]
0x1400f8fa1: mov qword ptr [rsp + 0x60], rcx
0x1400f8fa6: add rax, -0xf0
0x1400f8fac: mov qword ptr [rsp + 0x78], rax
0x1400f8fb1: mov r12d, 1
0x1400f8fb7: xor esi, esi
0x1400f8fb9: xor r14d, r14d
0x1400f8fbc: mov qword ptr [rsp + 0x40], rbp
0x1400f8fc1: mov qword ptr [rsp + 0x90], r9
0x1400f8fc9: mov r13, qword ptr [rsp + 0x50]
0x1400f8fce: sub r13, rsi
0x1400f8fd1: jbe 0x1400f9050
0x1400f8fd3: nop word ptr cs:[rax + rax]
0x1400f8fe0: imul rdi, rsi, 0xf0
0x1400f8fe7: mov rax, qword ptr [rsp + 0x38]
0x1400f8fec: lea rcx, [rax + rdi]
0x1400f8ff0: cmp r13, qword ptr [rsp + 0x48]
0x1400f8ff5: jae 0x1400f9070
0x1400f8ff7: cmp byte ptr [rsp + 0x370], 0
0x1400f8fff: je 0x1400f9090
0x1400f9005: cmp r13, 0x20
0x1400f9009: mov eax, 0x20
0x1400f900e: cmovae r13, rax
0x1400f9012: mov rax, qword ptr [rsp + 0x378]
0x1400f901a: mov qword ptr [rsp + 0x30], rax
0x1400f901f: mov qword ptr [rsp + 0x28], 0
0x1400f9028: mov dword ptr [rsp + 0x20], 0
0x1400f9030: mov rdx, r13
0x1400f9033: mov r8, rbp
0x1400f9036: mov rdi, r9
0x1400f9039: call 0x14006d1a0
0x1400f903e: mov r9, rdi
0x1400f9041: mov eax, r13d
0x1400f9044: jmp 0x1400f907d
0x1400f9046: nop word ptr cs:[rax + rax]
0x1400f9050: xor edx, edx
0x1400f9052: mov r13d, 1
0x1400f9058: cmp r14, 2
0x1400f905c: jae 0x1400f90df
0x1400f9062: jmp 0x1400f93e6
0x1400f9067: nop word ptr [rax + rax]
0x1400f9070: cmp r13, 2
0x1400f9074: jae 0x1400f9430
0x1400f907a: mov rax, r13
0x1400f907d: lea r13, [rax*2 + 1]
0x1400f9085: jmp 0x1400f909f
0x1400f9087: nop word ptr [rax + rax]
0x1400f9090: mov rax, qword ptr [rsp + 0x48]
0x1400f9095: cmp r13, rax
0x1400f9098: cmovae r13, rax
0x1400f909c: add r13, r13
0x1400f909f: mov rax, r12
0x1400f90a2: shr rax, 1
0x1400f90a5: mov rcx, r13
0x1400f90a8: shr rcx, 1
0x1400f90ab: lea rdx, [rsi + rsi]
0x1400f90af: sub rdx, rax
0x1400f90b2: lea rax, [rcx + rsi*2]
0x1400f90b6: mov rcx, qword ptr [rsp + 0x80]
0x1400f90be: imul rdx, rcx
0x1400f90c2: imul rax, rcx
0x1400f90c6: xor rax, rdx
0x1400f90c9: mov edx, 0x7f
0x1400f90ce: bsr rdx, rax
0x1400f90d2: xor edx, 0x3f
0x1400f90d5: cmp r14, 2
0x1400f90d9: jb 0x1400f93e6
0x1400f90df: imul rcx, rsi, 0xf0
0x1400f90e6: mov rax, qword ptr [rsp + 0x38]
0x1400f90eb: add rax, rcx
0x1400f90ee: mov qword ptr [rsp + 0xa8], rax
0x1400f90f6: add rcx, qword ptr [rsp + 0x78]
0x1400f90fb: mov qword ptr [rsp + 0x88], rcx
0x1400f9103: mov qword ptr [rsp + 0x58], rdx
0x1400f9108: mov qword ptr [rsp + 0xa0], rsi
0x1400f9110: mov qword ptr [rsp + 0x98], r13
0x1400f9118: jmp 0x1400f915c
0x1400f911a: mov rbp, qword ptr [rsp + 0x40]
0x1400f911f: sub r12, rdx
0x1400f9122: mov rcx, r13
0x1400f9125: mov r8, r12
0x1400f9128: call 0x145d145fb
0x1400f912d: mov r9, qword ptr [rsp + 0x90]
0x1400f9135: mov rdx, qword ptr [rsp + 0x58]
0x1400f913a: lea r12, [rdi*2 + 1]
0x1400f9142: mov rsi, qword ptr [rsp + 0xa0]
0x1400f914a: mov r13, qword ptr [rsp + 0x98]
0x1400f9152: cmp r14, 1
0x1400f9156: jbe 0x1400f93e0
0x1400f915c: cmp byte ptr [rsp + r14 + 0xb5], dl
0x1400f9164: jb 0x1400f93e6
0x1400f916a: dec r14
0x1400f916d: mov rax, qword ptr [rsp + r14*8 + 0xf8]
0x1400f9175: mov r15, rax
0x1400f9178: shr r15, 1
0x1400f917b: mov rbx, r12
0x1400f917e: shr rbx, 1
0x1400f9181: lea rdi, [r15 + rbx]
0x1400f9185: cmp rdi, r9
0x1400f9188: ja 0x1400f91b0
0x1400f918a: mov ecx, eax
0x1400f918c: or ecx, r12d
0x1400f918f: and ecx, 1
0x1400f9192: jne 0x1400f91b0
0x1400f9194: add rdi, rdi
0x1400f9197: mov r12, rdi
0x1400f919a: cmp r14, 1
0x1400f919e: ja 0x1400f915c
0x1400f91a0: jmp 0x1400f93e0
0x1400f91a5: nop word ptr cs:[rax + rax]
0x1400f91b0: mov rcx, rsi
0x1400f91b3: sub rcx, rdi
0x1400f91b6: imul r13, rcx, 0xf0
0x1400f91bd: add r13, qword ptr [rsp + 0x38]
0x1400f91c2: test al, 1
0x1400f91c4: je 0x1400f91e0
0x1400f91c6: test r12b, 1
0x1400f91ca: je 0x1400f922c
0x1400f91cc: test rbx, rbx
0x1400f91cf: jne 0x1400f9282
0x1400f91d5: jmp 0x1400f913a
0x1400f91da: nop word ptr [rax + rax]
0x1400f91e0: mov rax, r15
0x1400f91e3: or rax, 1
0x1400f91e7: bsr rax, rax
0x1400f91eb: xor eax, 0x3f
0x1400f91ee: add eax, eax
0x1400f91f0: xor eax, 0x7e
0x1400f91f3: mov rcx, qword ptr [rsp + 0x378]
0x1400f91fb: mov qword ptr [rsp + 0x30], rcx
0x1400f9200: mov dword ptr [rsp + 0x20], eax
0x1400f9204: mov qword ptr [rsp + 0x28], 0
0x1400f920d: mov rcx, r13
0x1400f9210: mov rdx, r15
0x1400f9213: mov r8, rbp
0x1400f9216: mov rsi, r9
0x1400f9219: call 0x14006d1a0
0x1400f921e: mov rdx, qword ptr [rsp + 0x58]
0x1400f9223: mov r9, rsi
0x1400f9226: test r12b, 1
0x1400f922a: jne 0x1400f91cc
0x1400f922c: imul rcx, r15, 0xf0
0x1400f9233: add rcx, r13
0x1400f9236: mov rax, rbx
0x1400f9239: or rax, 1
0x1400f923d: bsr rax, rax
0x1400f9241: xor eax, 0x3f
0x1400f9244: add eax, eax
0x1400f9246: xor eax, 0x7e
0x1400f9249: mov rdx, qword ptr [rsp + 0x378]
0x1400f9251: mov qword ptr [rsp + 0x30], rdx
0x1400f9256: mov dword ptr [rsp + 0x20], eax
0x1400f925a: mov qword ptr [rsp + 0x28], 0
0x1400f9263: mov rdx, rbx
0x1400f9266: mov r8, rbp
0x1400f9269: mov rsi, r9
0x1400f926c: call 0x14006d1a0
0x1400f9271: mov rdx, qword ptr [rsp + 0x58]
0x1400f9276: mov r9, rsi
0x1400f9279: test rbx, rbx
0x1400f927c: je 0x1400f913a
0x1400f9282: test r15, r15
0x1400f9285: je 0x1400f913a
0x1400f928b: cmp rbx, r15
0x1400f928e: mov rax, r15
0x1400f9291: cmovb rax, rbx
0x1400f9295: cmp r9, rax
0x1400f9298: jb 0x1400f913a
0x1400f929e: mov rsi, rbp
0x1400f92a1: imul rbp, r15, 0xf0
0x1400f92a8: add rbp, r13
0x1400f92ab: cmp r15, rbx
0x1400f92ae: mov rdx, r13
0x1400f92b1: cmova rdx, rbp
0x1400f92b5: imul r12, rax, 0xf0
0x1400f92bc: mov rcx, rsi
0x1400f92bf: mov r8, r12
0x1400f92c2: call 0x145d145fb
0x1400f92c7: add r12, rsi
0x1400f92ca: cmp r15, rbx
0x1400f92cd: jbe 0x1400f9367
0x1400f92d3: mov rbx, qword ptr [rsp + 0x88]
0x1400f92db: nop dword ptr [rax + rax]
0x1400f92e0: lea rax, [rbp - 0xf0]
0x1400f92e7: cmp qword ptr [r12 - 0x20], 0
0x1400f92ed: lea rdx, [r12 - 0xf0]
0x1400f92f5: setne cl
0x1400f92f8: cmp qword ptr [rbp - 0x20], 0
0x1400f92fd: sete r15b
0x1400f9301: and r15b, cl
0x1400f9304: cmovne rdx, rax
0x1400f9308: mov r8d, 0xf0
0x1400f930e: mov rcx, rbx
0x1400f9311: call 0x145d145fb
0x1400f9316: movzx eax, r15b
0x1400f931a: xor r15b, 1
0x1400f931e: movzx ecx, r15b
0x1400f9322: imul rcx, rcx, 0xf0
0x1400f9329: add rbp, rcx
0x1400f932c: add rbp, -0xf0
0x1400f9333: imul rax, rax, 0xf0
0x1400f933a: add r12, rax
0x1400f933d: add r12, -0xf0
0x1400f9344: cmp rbp, r13
0x1400f9347: je 0x1400f9357
0x1400f9349: add rbx, -0xf0
0x1400f9350: cmp r12, qword ptr [rsp + 0x40]
0x1400f9355: jne 0x1400f92e0
0x1400f9357: mov r13, rbp
0x1400f935a: mov rbp, qword ptr [rsp + 0x40]
0x1400f935f: mov rdx, rbp
0x1400f9362: jmp 0x1400f911f
0x1400f9367: mov rdx, rsi
0x1400f936a: nop word ptr [rax + rax]
0x1400f9370: cmp qword ptr [rbp + 0xd0], 0
0x1400f9378: mov r15, rdx
0x1400f937b: setne al
0x1400f937e: cmp qword ptr [rdx + 0xd0], 0
0x1400f9386: sete bl
0x1400f9389: and bl, al
0x1400f938b: mov esi, ebx
0x1400f938d: xor sil, 1
0x1400f9391: test bl, bl
0x1400f9393: cmovne rdx, rbp
0x1400f9397: mov r8d, 0xf0
0x1400f939d: mov rcx, r13
0x1400f93a0: call 0x145d145fb
0x1400f93a5: movzx eax, sil
0x1400f93a9: imul rdx, rax, 0xf0
0x1400f93b0: add rdx, r15
0x1400f93b3: add r13, 0xf0
0x1400f93ba: cmp rdx, r12
0x1400f93bd: je 0x1400f911a
0x1400f93c3: movzx eax, bl
0x1400f93c6: imul rax, rax, 0xf0
0x1400f93cd: add rbp, rax
0x1400f93d0: cmp rbp, qword ptr [rsp + 0xa8]
0x1400f93d8: jne 0x1400f9370
0x1400f93da: jmp 0x1400f911a
0x1400f93df: nop
0x1400f93e0: mov r14d, 1
0x1400f93e6: mov qword ptr [rsp + r14*8 + 0xf8], r12
0x1400f93ee: mov byte ptr [rsp + r14 + 0xb6], dl
0x1400f93f6: cmp qword ptr [rsp + 0x50], rsi
0x1400f93fb: jbe 0x1400f9653
0x1400f9401: inc r14
0x1400f9404: mov rax, r13
0x1400f9407: shr rax, 1
0x1400f940a: add rsi, rax
0x1400f940d: mov r12, r13
0x1400f9410: mov r13, qword ptr [rsp + 0x50]
0x1400f9415: sub r13, rsi
0x1400f9418: jbe 0x1400f9050
0x1400f941e: jmp 0x1400f8fe0
0x1400f9423: nop word ptr cs:[rax + rax]
0x1400f9430: mov r8, qword ptr [rcx + 0x1c0]
0x1400f9437: test r8, r8
0x1400f943a: setne r10b
0x1400f943e: cmp qword ptr [rcx + 0xd0], 0
0x1400f9446: sete dl
0x1400f9449: mov eax, 2
0x1400f944e: and dl, r10b
0x1400f9451: je 0x1400f95fe
0x1400f9457: cmp rax, qword ptr [rsp + 0x48]
0x1400f945c: jb 0x1400f8ff7
0x1400f9462: test dl, dl
0x1400f9464: je 0x1400f907d
0x1400f946a: mov rcx, rax
0x1400f946d: shr rcx, 1
0x1400f9470: je 0x1400f907d
0x1400f9476: mov rdx, qword ptr [rsp + 0x68]
0x1400f947b: add rdx, rdi
0x1400f947e: imul r8, rax, 0xf0
0x1400f9485: add r8, rdi
0x1400f9488: add r8, qword ptr [rsp + 0x60]
0x1400f948d: nop dword ptr [rax]
0x1400f9490: movups xmm0, xmmword ptr [rdx - 0xe0]
0x1400f9497: movups xmm1, xmmword ptr [r8 - 0xe0]
0x1400f949f: movups xmmword ptr [rdx - 0xe0], xmm1
0x1400f94a6: movups xmmword ptr [r8 - 0xe0], xmm0
0x1400f94ae: movups xmm0, xmmword ptr [rdx - 0xd0]
0x1400f94b5: movups xmm1, xmmword ptr [r8 - 0xd0]
0x1400f94bd: movups xmmword ptr [rdx - 0xd0], xmm1
0x1400f94c4: movups xmmword ptr [r8 - 0xd0], xmm0
0x1400f94cc: movups xmm0, xmmword ptr [rdx - 0xc0]
0x1400f94d3: movups xmm1, xmmword ptr [r8 - 0xc0]
0x1400f94db: movups xmmword ptr [rdx - 0xc0], xmm1
0x1400f94e2: movups xmmword ptr [r8 - 0xc0], xmm0
0x1400f94ea: movups xmm0, xmmword ptr [rdx - 0xb0]
0x1400f94f1: movups xmm1, xmmword ptr [r8 - 0xb0]
0x1400f94f9: movups xmmword ptr [rdx - 0xb0], xmm1
0x1400f9500: movups xmmword ptr [r8 - 0xb0], xmm0
0x1400f9508: movups xmm0, xmmword ptr [rdx - 0xa0]
0x1400f950f: movups xmm1, xmmword ptr [r8 - 0xa0]
0x1400f9517: movups xmmword ptr [rdx - 0xa0], xmm1
0x1400f951e: movups xmmword ptr [r8 - 0xa0], xmm0
0x1400f9526: movups xmm0, xmmword ptr [rdx - 0x90]
0x1400f952d: movups xmm1, xmmword ptr [r8 - 0x90]
0x1400f9535: movups xmmword ptr [rdx - 0x90], xmm1
0x1400f953c: movups xmmword ptr [r8 - 0x90], xmm0
0x1400f9544: movups xmm0, xmmword ptr [rdx - 0x80]
0x1400f9548: movups xmm1, xmmword ptr [r8 - 0x80]
0x1400f954d: movups xmmword ptr [rdx - 0x80], xmm1
0x1400f9551: movups xmmword ptr [r8 - 0x80], xmm0
0x1400f9556: movups xmm0, xmmword ptr [rdx - 0x70]
0x1400f955a: movups xmm1, xmmword ptr [r8 - 0x70]
0x1400f955f: movups xmmword ptr [rdx - 0x70], xmm1
0x1400f9563: movups xmmword ptr [r8 - 0x70], xmm0
0x1400f9568: movups xmm0, xmmword ptr [rdx - 0x60]
0x1400f956c: movups xmm1, xmmword ptr [r8 - 0x60]
0x1400f9571: movups xmmword ptr [rdx - 0x60], xmm1
0x1400f9575: movups xmmword ptr [r8 - 0x60], xmm0
0x1400f957a: movups xmm0, xmmword ptr [rdx - 0x50]
0x1400f957e: movups xmm1, xmmword ptr [r8 - 0x50]
0x1400f9583: movups xmmword ptr [rdx - 0x50], xmm1
0x1400f9587: movups xmmword ptr [r8 - 0x50], xmm0
0x1400f958c: movups xmm0, xmmword ptr [rdx - 0x40]
0x1400f9590: movups xmm1, xmmword ptr [r8 - 0x40]
0x1400f9595: movups xmmword ptr [rdx - 0x40], xmm1
0x1400f9599: movups xmmword ptr [r8 - 0x40], xmm0
0x1400f959e: movups xmm0, xmmword ptr [rdx - 0x30]
0x1400f95a2: movups xmm1, xmmword ptr [r8 - 0x30]
0x1400f95a7: movups xmmword ptr [rdx - 0x30], xmm1
0x1400f95ab: movups xmmword ptr [r8 - 0x30], xmm0
0x1400f95b0: movups xmm0, xmmword ptr [rdx - 0x20]
0x1400f95b4: movups xmm1, xmmword ptr [r8 - 0x20]
0x1400f95b9: movups xmmword ptr [rdx - 0x20], xmm1
0x1400f95bd: movups xmmword ptr [r8 - 0x20], xmm0
0x1400f95c2: movups xmm0, xmmword ptr [rdx - 0x10]
0x1400f95c6: movups xmm1, xmmword ptr [r8 - 0x10]
0x1400f95cb: movups xmmword ptr [rdx - 0x10], xmm1
0x1400f95cf: movups xmmword ptr [r8 - 0x10], xmm0
0x1400f95d4: movups xmm0, xmmword ptr [rdx]
0x1400f95d7: movups xmm1, xmmword ptr [r8]
0x1400f95db: movups xmmword ptr [rdx], xmm1
0x1400f95de: movups xmmword ptr [r8], xmm0
0x1400f95e2: add rdx, 0xf0
0x1400f95e9: add r8, -0xf0
0x1400f95f0: dec rcx
0x1400f95f3: jne 0x1400f9490
0x1400f95f9: jmp 0x1400f907d
0x1400f95fe: cmp r13, 2
0x1400f9602: je 0x1400f907d
0x1400f9608: mov rax, qword ptr [rsp + 0x70]
0x1400f960d: lea r10, [rax + rdi]
0x1400f9611: mov eax, 2
0x1400f9616: nop word ptr cs:[rax + rax]
0x1400f9620: mov r11, r8
0x1400f9623: mov r8, qword ptr [r10]
0x1400f9626: test r8, r8
0x1400f9629: setne bl
0x1400f962c: test r11, r11
0x1400f962f: sete r11b
0x1400f9633: test r11b, bl
0x1400f9636: jne 0x1400f9457
0x1400f963c: inc rax
0x1400f963f: add r10, 0xf0
0x1400f9646: cmp r13, rax
0x1400f9649: jne 0x1400f9620
0x1400f964b: mov rax, r13
0x1400f964e: jmp 0x1400f9457
0x1400f9653: test r12b, 1
0x1400f9657: jne 0x1400f9699
0x1400f9659: mov rdx, qword ptr [rsp + 0x50]
0x1400f965e: mov rax, rdx
0x1400f9661: or rax, 1
0x1400f9665: bsr rax, rax
0x1400f9669: xor eax, 0x3f
0x1400f966c: add eax, eax
0x1400f966e: xor eax, 0x7e
0x1400f9671: mov rcx, qword ptr [rsp + 0x378]
0x1400f9679: mov qword ptr [rsp + 0x30], rcx
0x1400f967e: mov dword ptr [rsp + 0x20], eax
0x1400f9682: mov qword ptr [rsp + 0x28], 0
0x1400f968b: mov rcx, qword ptr [rsp + 0x38]
0x1400f9690: mov r8, rbp
0x1400f9693: call 0x14006d1a0
0x1400f9698: nop
0x1400f9699: add rsp, 0x308
0x1400f96a0: pop rbx
0x1400f96a1: pop rbp
0x1400f96a2: pop rdi
0x1400f96a3: pop rsi
0x1400f96a4: pop r12
0x1400f96a6: pop r13
0x1400f96a8: pop r14
0x1400f96aa: pop r15
0x1400f96ac: ret
