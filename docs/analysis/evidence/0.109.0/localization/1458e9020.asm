; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x1458e9020..0x1458e94c4 SHA256 58ec1da72632df34abf7d3d0558bd67010cbd6e1390081a7df20adb745016ec9
0x1458e9020: push r15
0x1458e9022: push r14
0x1458e9024: push r12
0x1458e9026: push rsi
0x1458e9027: push rdi
0x1458e9028: push rbp
0x1458e9029: push rbx
0x1458e902a: sub rsp, 0x70
0x1458e902e: mov rsi, rcx
0x1458e9031: mov rdi, qword ptr [rdx]
0x1458e9034: mov rbx, qword ptr [rdx + 0x10]
0x1458e9038: cmp rbx, -4
0x1458e903c: jb 0x1458e9047
0x1458e903e: mov r14, qword ptr [rdx + 8]
0x1458e9042: jmp 0x1458e91c2
0x1458e9047: lea r15, [rbx + 4]
0x1458e904b: mov r14, qword ptr [rdx + 8]
0x1458e904f: cmp r15, r14
0x1458e9052: ja 0x1458e91c2
0x1458e9058: mov r12, rdx
0x1458e905b: lea rdx, [rdi + rbx]
0x1458e905f: lea rcx, [rsp + 0x20]
0x1458e9064: mov r8d, 4
0x1458e906a: call 0x145bd5650
0x1458e906f: cmp dword ptr [rsp + 0x20], 1
0x1458e9074: je 0x1458e91c2
0x1458e907a: mov r9, qword ptr [rsp + 0x30]
0x1458e907f: test r9, r9
0x1458e9082: je 0x1458e91c2
0x1458e9088: mov rax, qword ptr [rsp + 0x28]
0x1458e908d: cmp r9, 1
0x1458e9091: jne 0x1458e90b0
0x1458e9093: movzx r8d, byte ptr [rax]
0x1458e9097: cmp r8d, 0x2b
0x1458e909b: je 0x1458e91c2
0x1458e90a1: mov rcx, r12
0x1458e90a4: cmp r8d, 0x2d
0x1458e90a8: je 0x1458e91c2
0x1458e90ae: jmp 0x1458e90b7
0x1458e90b0: movzx r8d, byte ptr [rax]
0x1458e90b4: mov rcx, r12
0x1458e90b7: xor edx, edx
0x1458e90b9: cmp r8b, 0x2b
0x1458e90bd: sete dl
0x1458e90c0: mov r8, r9
0x1458e90c3: sub r8, rdx
0x1458e90c6: add rax, rdx
0x1458e90c9: cmp r8, 9
0x1458e90cd: jae 0x1458e9154
0x1458e90d3: test r8, r8
0x1458e90d6: je 0x1458e91b3
0x1458e90dc: movzx r9d, byte ptr [rax]
0x1458e90e0: lea r10d, [r9 - 0x41]
0x1458e90e4: and r10d, 0xffffffdf
0x1458e90e8: add r10d, 0xa
0x1458e90ec: lea edx, [r9 - 0x30]
0x1458e90f0: cmp r9d, 0x3a
0x1458e90f4: cmovae edx, r10d
0x1458e90f8: cmp edx, 0xf
0x1458e90fb: ja 0x1458e91c2
0x1458e9101: cmp r8, 1
0x1458e9105: je 0x1458e91b5
0x1458e910b: movzx r10d, byte ptr [rax + 1]
0x1458e9110: lea r11d, [r10 - 0x41]
0x1458e9114: and r11d, 0xffffffdf
0x1458e9118: add r11d, 0xa
0x1458e911c: lea r9d, [r10 - 0x30]
0x1458e9120: cmp r10d, 0x3a
0x1458e9124: cmovae r9d, r11d
0x1458e9128: cmp r9d, 0xf
0x1458e912c: ja 0x1458e91c2
0x1458e9132: shl edx, 4
0x1458e9135: or r9d, edx
0x1458e9138: cmp r8, 2
0x1458e913c: jne 0x1458e9285
0x1458e9142: mov edx, r9d
0x1458e9145: shl rdx, 0x20
0x1458e9149: test dl, 1
0x1458e914c: je 0x1458e9369
0x1458e9152: jmp 0x1458e91c2
0x1458e9154: neg rdx
0x1458e9157: add r9, rdx
0x1458e915a: neg r9
0x1458e915d: xor edx, edx
0x1458e915f: xor r8d, r8d
0x1458e9162: mov r10, r9
0x1458e9165: add r10, r8
0x1458e9168: je 0x1458e91b5
0x1458e916a: cmp edx, 0xfffffff
0x1458e9170: ja 0x1458e9334
0x1458e9176: mov r10d, edx
0x1458e9179: shl r10d, 4
0x1458e917d: movzx r11d, byte ptr [rax + r8]
0x1458e9182: lea ebp, [r11 - 0x41]
0x1458e9186: and ebp, 0xffffffdf
0x1458e9189: add ebp, 0xa
0x1458e918c: lea edx, [r11 - 0x30]
0x1458e9190: cmp r11d, 0x3a
0x1458e9194: cmovae edx, ebp
0x1458e9197: cmp edx, 0x10
0x1458e919a: setae r11b
0x1458e919e: add edx, r10d
0x1458e91a1: setb r10b
0x1458e91a5: or r10b, r11b
0x1458e91a8: inc r8
0x1458e91ab: test r10b, 1
0x1458e91af: jne 0x1458e91c2
0x1458e91b1: jmp 0x1458e9162
0x1458e91b3: xor edx, edx
0x1458e91b5: shl rdx, 0x20
0x1458e91b9: test dl, 1
0x1458e91bc: je 0x1458e9369
0x1458e91c2: lea rax, [rip + 0x13084f9]
0x1458e91c9: mov qword ptr [rsp + 0x60], rax
0x1458e91ce: mov qword ptr [rsp + 0x68], 0xd
0x1458e91d7: cmp r14, rbx
0x1458e91da: cmovb rbx, r14
0x1458e91de: test rbx, rbx
0x1458e91e1: je 0x1458e91f2
0x1458e91e3: cmp rbx, 4
0x1458e91e7: jae 0x1458e91f9
0x1458e91e9: xor eax, eax
0x1458e91eb: xor ecx, ecx
0x1458e91ed: jmp 0x1458e9438
0x1458e91f2: xor ecx, ecx
0x1458e91f4: jmp 0x1458e944c
0x1458e91f9: mov rax, rbx
0x1458e91fc: and rax, 0xfffffffffffffffc
0x1458e9200: pxor xmm0, xmm0
0x1458e9204: xor ecx, ecx
0x1458e9206: movdqa xmm1, xmmword ptr [rip + 0x778662]
0x1458e920e: movdqa xmm3, xmmword ptr [rip + 0x4b424a]
0x1458e9216: pxor xmm2, xmm2
0x1458e921a: nop word ptr [rax + rax]
0x1458e9220: movzx edx, word ptr [rdi + rcx]
0x1458e9224: movd xmm4, edx
0x1458e9228: movzx edx, word ptr [rdi + rcx + 2]
0x1458e922d: movd xmm5, edx
0x1458e9231: pcmpeqb xmm4, xmm1
0x1458e9235: punpcklbw xmm4, xmm4
0x1458e9239: pshuflw xmm4, xmm4, 0xd4
0x1458e923e: pshufd xmm4, xmm4, 0xd4
0x1458e9243: pand xmm4, xmm3
0x1458e9247: paddq xmm2, xmm4
0x1458e924b: pcmpeqb xmm5, xmm1
0x1458e924f: punpcklbw xmm5, xmm5
0x1458e9253: pshuflw xmm4, xmm5, 0xd4
0x1458e9258: pshufd xmm4, xmm4, 0xd4
0x1458e925d: pand xmm4, xmm3
0x1458e9261: paddq xmm0, xmm4
0x1458e9265: add rcx, 4
0x1458e9269: cmp rax, rcx
0x1458e926c: jne 0x1458e9220
0x1458e926e: paddq xmm0, xmm2
0x1458e9272: pshufd xmm1, xmm0, 0xee
0x1458e9277: paddq xmm1, xmm0
0x1458e927b: movq rcx, xmm1
0x1458e9280: jmp 0x1458e9447
0x1458e9285: movzx r10d, byte ptr [rax + 2]
0x1458e928a: lea r11d, [r10 - 0x41]
0x1458e928e: and r11d, 0xffffffdf
0x1458e9292: add r11d, 0xa
0x1458e9296: lea edx, [r10 - 0x30]
0x1458e929a: cmp r10d, 0x3a
0x1458e929e: cmovae edx, r11d
0x1458e92a2: cmp edx, 0xf
0x1458e92a5: ja 0x1458e91c2
0x1458e92ab: shl r9d, 4
0x1458e92af: or edx, r9d
0x1458e92b2: cmp r8, 3
0x1458e92b6: je 0x1458e91b5
0x1458e92bc: movzx r10d, byte ptr [rax + 3]
0x1458e92c1: lea r11d, [r10 - 0x41]
0x1458e92c5: and r11d, 0xffffffdf
0x1458e92c9: add r11d, 0xa
0x1458e92cd: lea r9d, [r10 - 0x30]
0x1458e92d1: cmp r10d, 0x3a
0x1458e92d5: cmovae r9d, r11d
0x1458e92d9: cmp r9d, 0xf
0x1458e92dd: ja 0x1458e91c2
0x1458e92e3: shl edx, 4
0x1458e92e6: or r9d, edx
0x1458e92e9: cmp r8, 4
0x1458e92ed: je 0x1458e9142
0x1458e92f3: movzx ecx, byte ptr [rax + 4]
0x1458e92f7: lea r10d, [rcx - 0x41]
0x1458e92fb: and r10d, 0xffffffdf
0x1458e92ff: add r10d, 0xa
0x1458e9303: lea edx, [rcx - 0x30]
0x1458e9306: cmp ecx, 0x3a
0x1458e9309: cmovae edx, r10d
0x1458e930d: cmp edx, 0xf
0x1458e9310: ja 0x1458e91c2
0x1458e9316: shl r9d, 4
0x1458e931a: or edx, r9d
0x1458e931d: cmp r8, 5
0x1458e9321: jne 0x1458e9380
0x1458e9323: mov rcx, r12
0x1458e9326: shl rdx, 0x20
0x1458e932a: test dl, 1
0x1458e932d: je 0x1458e9369
0x1458e932f: jmp 0x1458e91c2
0x1458e9334: movzx eax, byte ptr [rax + r8]
0x1458e9339: lea edx, [rax - 0x41]
0x1458e933c: and edx, 0xffffffde
0x1458e933f: add edx, 0xa
0x1458e9342: lea r8d, [rax - 0x30]
0x1458e9346: cmp eax, 0x3a
0x1458e9349: cmovae r8d, edx
0x1458e934d: xor edx, edx
0x1458e934f: cmp r8d, 0x10
0x1458e9353: setb dl
0x1458e9356: shl edx, 8
0x1458e9359: add rdx, 0x101
0x1458e9360: test dl, 1
0x1458e9363: jne 0x1458e91c2
0x1458e9369: shr rdx, 0x20
0x1458e936d: mov qword ptr [rcx + 0x10], r15
0x1458e9371: mov dword ptr [rsi + 8], edx
0x1458e9374: mov qword ptr [rsi], 0xffffffffffffffff
0x1458e937b: jmp 0x1458e94b5
0x1458e9380: movzx r9d, byte ptr [rax + 5]
0x1458e9385: lea r10d, [r9 - 0x41]
0x1458e9389: and r10d, 0xffffffdf
0x1458e938d: add r10d, 0xa
0x1458e9391: lea ecx, [r9 - 0x30]
0x1458e9395: cmp r9d, 0x3a
0x1458e9399: cmovae ecx, r10d
0x1458e939d: cmp ecx, 0xf
0x1458e93a0: ja 0x1458e91c2
0x1458e93a6: shl edx, 4
0x1458e93a9: or ecx, edx
0x1458e93ab: cmp r8, 6
0x1458e93af: jne 0x1458e93c4
0x1458e93b1: mov edx, ecx
0x1458e93b3: mov rcx, r12
0x1458e93b6: shl rdx, 0x20
0x1458e93ba: test dl, 1
0x1458e93bd: je 0x1458e9369
0x1458e93bf: jmp 0x1458e91c2
0x1458e93c4: movzx r9d, byte ptr [rax + 6]
0x1458e93c9: lea r10d, [r9 - 0x41]
0x1458e93cd: and r10d, 0xffffffdf
0x1458e93d1: add r10d, 0xa
0x1458e93d5: lea edx, [r9 - 0x30]
0x1458e93d9: cmp r9d, 0x3a
0x1458e93dd: cmovae edx, r10d
0x1458e93e1: cmp edx, 0xf
0x1458e93e4: ja 0x1458e91c2
0x1458e93ea: shl ecx, 4
0x1458e93ed: or edx, ecx
0x1458e93ef: cmp r8, 7
0x1458e93f3: je 0x1458e9323
0x1458e93f9: movzx ecx, byte ptr [rax + 7]
0x1458e93fd: lea r8d, [rcx - 0x41]
0x1458e9401: and r8d, 0xffffffdf
0x1458e9405: add r8d, 0xa
0x1458e9409: lea eax, [rcx - 0x30]
0x1458e940c: cmp ecx, 0x3a
0x1458e940f: cmovae eax, r8d
0x1458e9413: cmp eax, 0xf
0x1458e9416: ja 0x1458e91c2
0x1458e941c: shl edx, 4
0x1458e941f: or eax, edx
0x1458e9421: mov edx, eax
0x1458e9423: mov rcx, r12
0x1458e9426: shl rdx, 0x20
0x1458e942a: test dl, 1
0x1458e942d: jne 0x1458e91c2
0x1458e9433: jmp 0x1458e9369
0x1458e9438: xor edx, edx
0x1458e943a: cmp byte ptr [rdi + rax], 0xa
0x1458e943e: sete dl
0x1458e9441: add rcx, rdx
0x1458e9444: inc rax
0x1458e9447: cmp rbx, rax
0x1458e944a: jne 0x1458e9438
0x1458e944c: inc rcx
0x1458e944f: mov qword ptr [rsp + 0x40], rcx
0x1458e9454: lea rax, [rsp + 0x40]
0x1458e9459: mov qword ptr [rsp + 0x20], rax
0x1458e945e: lea rax, [rip + 0x2f636b]
0x1458e9465: mov qword ptr [rsp + 0x28], rax
0x1458e946a: lea rax, [rsp + 0x60]
0x1458e946f: mov qword ptr [rsp + 0x30], rax
0x1458e9474: lea rax, [rip - 0x58e73bb]
0x1458e947b: mov qword ptr [rsp + 0x38], rax
0x1458e9480: lea rdx, [rip + 0x1308248]
0x1458e9487: lea rcx, [rsp + 0x48]
0x1458e948c: lea r8, [rsp + 0x20]
0x1458e9491: call 0x145bcce30
0x1458e9496: mov rax, qword ptr [rsp + 0x48]
0x1458e949b: mov ecx, dword ptr [rsp + 0x50]
0x1458e949f: mov edx, dword ptr [rsp + 0x5c]
0x1458e94a3: mov dword ptr [rsi + 0x14], edx
0x1458e94a6: mov rdx, qword ptr [rsp + 0x54]
0x1458e94ab: mov qword ptr [rsi + 0xc], rdx
0x1458e94af: mov qword ptr [rsi], rax
0x1458e94b2: mov dword ptr [rsi + 8], ecx
0x1458e94b5: add rsp, 0x70
0x1458e94b9: pop rbx
0x1458e94ba: pop rbp
0x1458e94bb: pop rdi
0x1458e94bc: pop rsi
0x1458e94bd: pop r12
0x1458e94bf: pop r14
0x1458e94c1: pop r15
0x1458e94c3: ret
