;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x14007b510..0x14007bea2 SHA256 b224a3f4783cd2d55b48912394b286d0de2f3e85535c2747cd020d12563bb8d5
0x14007b510: push rbp
0x14007b511: push r15
0x14007b513: push r14
0x14007b515: push r13
0x14007b517: push r12
0x14007b519: push rsi
0x14007b51a: push rdi
0x14007b51b: push rbx
0x14007b51c: sub rsp, 0x138
0x14007b523: lea rbp, [rsp + 0x80]
0x14007b52b: mov qword ptr [rbp + 0xb0], 0xfffffffffffffffe
0x14007b536: mov r13, r8
0x14007b539: mov rsi, rdx
0x14007b53c: cmp byte ptr [r8 + 0x44], 0
0x14007b541: mov byte ptr [r8 + 0x44], 1
0x14007b546: jne 0x14007b56d
0x14007b548: mov qword ptr [rsp + 0x20], 1
0x14007b551: lea rdx, [rip + 0x5d54266]
0x14007b558: lea r9, [rip + 0x5d5426e]
0x14007b55f: mov r8d, 0xf
0x14007b565: mov rcx, rsi
0x14007b568: call 0x140724570
0x14007b56d: cmp qword ptr [rsi + 0x90], 0
0x14007b575: je 0x14007b692
0x14007b57b: mov rax, qword ptr [rsi + 0x78]
0x14007b57f: mov rcx, qword ptr [rsi + 0x80]
0x14007b586: movabs rdx, 0x7370748e2b24019a
0x14007b590: xor r8d, r8d
0x14007b593: movdqa xmm0, xmmword ptr [rip + 0x5d222f5]
0x14007b59b: pcmpeqd xmm1, xmm1
0x14007b59f: movdqa xmm2, xmmword ptr [rip + 0x5d222f9]
0x14007b5a7: and rdx, rcx
0x14007b5aa: movdqu xmm3, xmmword ptr [rax + rdx]
0x14007b5af: movdqa xmm4, xmm3
0x14007b5b3: pcmpeqb xmm4, xmm0
0x14007b5b7: pmovmskb r9d, xmm4
0x14007b5bc: test r9d, r9d
0x14007b5bf: je 0x14007b600
0x14007b5c1: tzcnt r10d, r9d
0x14007b5c6: add r10, rdx
0x14007b5c9: and r10, rcx
0x14007b5cc: neg r10
0x14007b5cf: lea r10, [r10 + r10*2]
0x14007b5d3: movdqu xmm4, xmmword ptr [rax + r10*8 - 0x18]
0x14007b5da: pcmpeqb xmm4, xmm2
0x14007b5de: pmovmskb r11d, xmm4
0x14007b5e3: cmp r11d, 0xffff
0x14007b5ea: je 0x14007b61f
0x14007b5ec: lea r10d, [r9 - 1]
0x14007b5f0: and r10w, r9w
0x14007b5f4: mov r9d, r10d
0x14007b5f7: jne 0x14007b5c1
0x14007b5f9: nop dword ptr [rax]
0x14007b600: pcmpeqb xmm3, xmm1
0x14007b604: pmovmskb r9d, xmm3
0x14007b609: test r9d, r9d
0x14007b60c: jne 0x14007b692
0x14007b612: add rdx, r8
0x14007b615: add rdx, 0x10
0x14007b619: add r8, 0x10
0x14007b61d: jmp 0x14007b5a7
0x14007b61f: lea rax, [rax + r10*8]
0x14007b623: mov rax, qword ptr [rax - 8]
0x14007b627: cmp rax, qword ptr [rsi + 0x218]
0x14007b62e: jae 0x14007b692
0x14007b630: mov rcx, qword ptr [rsi + 0x210]
0x14007b637: mov rcx, qword ptr [rcx + rax*8]
0x14007b63b: test rcx, rcx
0x14007b63e: je 0x14007b692
0x14007b640: mov rax, qword ptr [rsi + 0x1e0]
0x14007b647: not rcx
0x14007b64a: imul rcx, rcx, 0x38
0x14007b64e: cmp byte ptr [rax + rcx + 0x30], 0
0x14007b653: je 0x14007b692
0x14007b655: add rax, rcx
0x14007b658: mov rax, qword ptr [rax + 0x10]
0x14007b65c: movss xmm0, dword ptr [rax + 0x5c]
0x14007b661: movaps xmm1, xmm0
0x14007b664: subss xmm1, dword ptr [r13 + 0x40]
0x14007b66a: movss xmm2, dword ptr [rip + 0x5d21c2e]
0x14007b672: ucomiss xmm2, xmm1
0x14007b675: jbe 0x14007b6c1
0x14007b677: cmp byte ptr [r13 + 0x20], 0xfe
0x14007b67c: je 0x14007b6c1
0x14007b67e: add rsp, 0x138
0x14007b685: pop rbx
0x14007b686: pop rdi
0x14007b687: pop rsi
0x14007b688: pop r12
0x14007b68a: pop r13
0x14007b68c: pop r14
0x14007b68e: pop r15
0x14007b690: pop rbp
0x14007b691: ret
0x14007b692: lea rax, [rbp + 0xab]
0x14007b699: mov qword ptr [rbp + 0x68], rax
0x14007b69d: lea rax, [rip + 0x4f81c5c]
0x14007b6a4: mov qword ptr [rbp + 0x70], rax
0x14007b6a8: lea rcx, [rip + 0x5d51bb1]
0x14007b6af: lea r8, [rip + 0x5d5411a]
0x14007b6b6: lea rdx, [rbp + 0x68]
0x14007b6ba: call 0x145d99830
0x14007b6bf: ud2
0x14007b6c1: lea r12, [r13 + 0x20]
0x14007b6c5: movss dword ptr [r13 + 0x40], xmm0
0x14007b6cb: lea r8, [rip + 0x5d540ec]
0x14007b6d2: lea rcx, [rbp + 0x68]
0x14007b6d6: mov r9d, 0xf
0x14007b6dc: mov rdx, rsi
0x14007b6df: call 0x1407279a0
0x14007b6e4: mov rax, qword ptr [rbp + 0x68]
0x14007b6e8: cmp rax, -1
0x14007b6ec: je 0x14007b774
0x14007b6f2: mov qword ptr [rbp + 0xa0], rax
0x14007b6f9: mov rcx, qword ptr [rbp + 0x70]
0x14007b6fd: mov rdx, qword ptr [rbp + 0x78]
0x14007b701: mov qword ptr [rbp + 0x98], rcx
0x14007b708: call 0x140089200
0x14007b70d: nop
0x14007b70e: cmp rdx, 1
0x14007b712: jne 0x14007b756
0x14007b714: movzx ebx, byte ptr [rax]
0x14007b717: mov rdx, qword ptr [rbp + 0xa0]
0x14007b71e: test rdx, rdx
0x14007b721: je 0x14007b735
0x14007b723: mov r8d, 1
0x14007b729: mov rcx, qword ptr [rbp + 0x98]
0x14007b730: call 0x1400021d0
0x14007b735: cmp bl, 0x30
0x14007b738: jne 0x14007b774
0x14007b73a: mov byte ptr [rbp + 0x48], 0xff
0x14007b73e: movzx ebx, byte ptr [r12]
0x14007b743: mov cl, 1
0x14007b745: mov dil, 0xff
0x14007b748: cmp bl, 0xfe
0x14007b74b: jne 0x14007ba4d
0x14007b751: jmp 0x14007ba91
0x14007b756: mov rdx, qword ptr [rbp + 0xa0]
0x14007b75d: test rdx, rdx
0x14007b760: je 0x14007b774
0x14007b762: mov r8d, 1
0x14007b768: mov rcx, qword ptr [rbp + 0x98]
0x14007b76f: call 0x1400021d0
0x14007b774: cmp qword ptr [rsi + 0x90], 0
0x14007b77c: je 0x14007b9ba
0x14007b782: mov rax, qword ptr [rsi + 0x78]
0x14007b786: mov rcx, qword ptr [rsi + 0x80]
0x14007b78d: movabs rdx, 0x44863156102a335b
0x14007b797: xor r8d, r8d
0x14007b79a: movdqa xmm0, xmmword ptr [rip + 0x5d21fae]
0x14007b7a2: pcmpeqd xmm1, xmm1
0x14007b7a6: movdqa xmm2, xmmword ptr [rip + 0x5d51982]
0x14007b7ae: and rdx, rcx
0x14007b7b1: movdqu xmm3, xmmword ptr [rax + rdx]
0x14007b7b6: movdqa xmm4, xmm3
0x14007b7ba: pcmpeqb xmm4, xmm0
0x14007b7be: pmovmskb r9d, xmm4
0x14007b7c3: test r9d, r9d
0x14007b7c6: je 0x14007b800
0x14007b7c8: tzcnt r10d, r9d
0x14007b7cd: add r10, rdx
0x14007b7d0: and r10, rcx
0x14007b7d3: neg r10
0x14007b7d6: lea r10, [r10 + r10*2]
0x14007b7da: movdqu xmm4, xmmword ptr [rax + r10*8 - 0x18]
0x14007b7e1: pcmpeqb xmm4, xmm2
0x14007b7e5: pmovmskb r11d, xmm4
0x14007b7ea: cmp r11d, 0xffff
0x14007b7f1: je 0x14007b81f
0x14007b7f3: lea r10d, [r9 - 1]
0x14007b7f7: and r10w, r9w
0x14007b7fb: mov r9d, r10d
0x14007b7fe: jne 0x14007b7c8
0x14007b800: pcmpeqb xmm3, xmm1
0x14007b804: pmovmskb r9d, xmm3
0x14007b809: test r9d, r9d
0x14007b80c: jne 0x14007b9ba
0x14007b812: add rdx, r8
0x14007b815: add rdx, 0x10
0x14007b819: add r8, 0x10
0x14007b81d: jmp 0x14007b7ae
0x14007b81f: lea rdx, [rax + r10*8]
0x14007b823: mov rdx, qword ptr [rdx - 8]
0x14007b827: mov r9, qword ptr [rsi + 0x218]
0x14007b82e: cmp rdx, r9
0x14007b831: jae 0x14007b9ba
0x14007b837: mov r10, qword ptr [rsi + 0x210]
0x14007b83e: mov r8, qword ptr [r10 + rdx*8]
0x14007b842: test r8, r8
0x14007b845: je 0x14007b9ba
0x14007b84b: mov rdx, qword ptr [rsi + 0x1e0]
0x14007b852: not r8
0x14007b855: imul r8, r8, 0x38
0x14007b859: cmp byte ptr [rdx + r8 + 0x30], 0
0x14007b85f: je 0x14007b9ba
0x14007b865: add r8, rdx
0x14007b868: mov r11, qword ptr [r8 + 0x10]
0x14007b86c: movabs r8, 0x20c5b97f928e3b62
0x14007b876: xor esi, esi
0x14007b878: movdqa xmm0, xmmword ptr [rip + 0x5d21d00]
0x14007b880: pcmpeqd xmm1, xmm1
0x14007b884: movdqa xmm2, xmmword ptr [rip + 0x5d21d04]
0x14007b88c: and r8, rcx
0x14007b88f: movdqu xmm3, xmmword ptr [rax + r8]
0x14007b895: movdqa xmm4, xmm3
0x14007b899: pcmpeqb xmm4, xmm0
0x14007b89d: pmovmskb edi, xmm4
0x14007b8a1: test edi, edi
0x14007b8a3: je 0x14007b8d8
0x14007b8a5: tzcnt ebx, edi
0x14007b8a9: add rbx, r8
0x14007b8ac: and rbx, rcx
0x14007b8af: neg rbx
0x14007b8b2: lea rbx, [rbx + rbx*2]
0x14007b8b6: movdqu xmm4, xmmword ptr [rax + rbx*8 - 0x18]
0x14007b8bc: pcmpeqb xmm4, xmm2
0x14007b8c0: pmovmskb r14d, xmm4
0x14007b8c5: cmp r14d, 0xffff
0x14007b8cc: je 0x14007b8f5
0x14007b8ce: lea ebx, [rdi - 1]
0x14007b8d1: and bx, di
0x14007b8d4: mov edi, ebx
0x14007b8d6: jne 0x14007b8a5
0x14007b8d8: pcmpeqb xmm3, xmm1
0x14007b8dc: pmovmskb edi, xmm3
0x14007b8e0: test edi, edi
0x14007b8e2: jne 0x14007baba
0x14007b8e8: add r8, rsi
0x14007b8eb: add r8, 0x10
0x14007b8ef: add rsi, 0x10
0x14007b8f3: jmp 0x14007b88c
0x14007b8f5: lea r8, [rax + rbx*8]
0x14007b8f9: mov r8, qword ptr [r8 - 8]
0x14007b8fd: cmp r8, r9
0x14007b900: jae 0x14007baba
0x14007b906: mov r8, qword ptr [r10 + r8*8]
0x14007b90a: test r8, r8
0x14007b90d: je 0x14007baba
0x14007b913: not r8
0x14007b916: imul r8, r8, 0x38
0x14007b91a: cmp byte ptr [rdx + r8 + 0x30], 0
0x14007b920: je 0x14007baba
0x14007b926: add r8, rdx
0x14007b929: mov r8, qword ptr [r8 + 0x10]
0x14007b92d: movabs rsi, 0x397c766565084ed2
0x14007b937: xor edi, edi
0x14007b939: movdqa xmm0, xmmword ptr [rip + 0x5d21e2f]
0x14007b941: pcmpeqd xmm1, xmm1
0x14007b945: movdqa xmm2, xmmword ptr [rip + 0x5d21e33]
0x14007b94d: and rsi, rcx
0x14007b950: movdqu xmm3, xmmword ptr [rax + rsi]
0x14007b955: movdqa xmm4, xmm3
0x14007b959: pcmpeqb xmm4, xmm0
0x14007b95d: pmovmskb ebx, xmm4
0x14007b961: test ebx, ebx
0x14007b963: je 0x14007b99d
0x14007b965: tzcnt r14d, ebx
0x14007b96a: add r14, rsi
0x14007b96d: and r14, rcx
0x14007b970: neg r14
0x14007b973: lea r14, [r14 + r14*2]
0x14007b977: movdqu xmm4, xmmword ptr [rax + r14*8 - 0x18]
0x14007b97e: pcmpeqb xmm4, xmm2
0x14007b982: pmovmskb r15d, xmm4
0x14007b987: cmp r15d, 0xffff
0x14007b98e: je 0x14007b9e9
0x14007b990: lea r14d, [rbx - 1]
0x14007b994: and r14w, bx
0x14007b998: mov ebx, r14d
0x14007b99b: jne 0x14007b965
0x14007b99d: pcmpeqb xmm3, xmm1
0x14007b9a1: pmovmskb ebx, xmm3
0x14007b9a5: test ebx, ebx
0x14007b9a7: jne 0x14007bae9
0x14007b9ad: add rsi, rdi
0x14007b9b0: add rsi, 0x10
0x14007b9b4: add rdi, 0x10
0x14007b9b8: jmp 0x14007b94d
0x14007b9ba: lea rax, [rbp + 0xab]
0x14007b9c1: mov qword ptr [rbp + 0x68], rax
0x14007b9c5: lea rax, [rip + 0x4f81934]
0x14007b9cc: mov qword ptr [rbp + 0x70], rax
0x14007b9d0: lea rcx, [rip + 0x5d51889]
0x14007b9d7: lea r8, [rip + 0x5d52a1a]
0x14007b9de: lea rdx, [rbp + 0x68]
0x14007b9e2: call 0x145d99830
0x14007b9e7: ud2
0x14007b9e9: lea rax, [rax + r14*8]
0x14007b9ed: mov rax, qword ptr [rax - 8]
0x14007b9f1: cmp rax, r9
0x14007b9f4: jae 0x14007bae9
0x14007b9fa: mov rax, qword ptr [r10 + rax*8]
0x14007b9fe: test rax, rax
0x14007ba01: je 0x14007bae9
0x14007ba07: not rax
0x14007ba0a: imul rax, rax, 0x38
0x14007ba0e: cmp byte ptr [rdx + rax + 0x30], 0
0x14007ba13: je 0x14007bae9
0x14007ba19: add rdx, rax
0x14007ba1c: mov r9, qword ptr [rdx + 0x10]
0x14007ba20: movzx edx, byte ptr [r11 + 0xd]
0x14007ba25: mov qword ptr [rsp + 0x20], r13
0x14007ba2a: lea rcx, [rbp + 0x48]
0x14007ba2e: call 0x14006b460
0x14007ba33: movzx edi, byte ptr [rbp + 0x48]
0x14007ba37: movzx ebx, byte ptr [r13 + 0x20]
0x14007ba3c: cmp dil, 0xff
0x14007ba40: je 0x14007bc73
0x14007ba46: xor ecx, ecx
0x14007ba48: cmp bl, 0xfe
0x14007ba4b: je 0x14007ba91
0x14007ba4d: cmp bl, 0xff
0x14007ba50: sete al
0x14007ba53: or cl, al
0x14007ba55: mov eax, ebx
0x14007ba57: and al, dil
0x14007ba5a: cmp al, 0xff
0x14007ba5c: sete al
0x14007ba5f: test cl, cl
0x14007ba61: jne 0x14007ba7e
0x14007ba63: mov byte ptr [rbp + 0xaf], dil
0x14007ba6a: mov byte ptr [rbp + 0xae], 0
0x14007ba71: lea rdx, [rbp + 0x48]
0x14007ba75: mov rcx, r12
0x14007ba78: call 0x14007de60
0x14007ba7d: nop
0x14007ba7e: test al, al
0x14007ba80: je 0x14007ba91
0x14007ba82: cmp dil, 0xff
0x14007ba86: jne 0x14007bd85
0x14007ba8c: jmp 0x14007b67e
0x14007ba91: lea rsi, [r13 + 0x10]
0x14007ba95: cmp dword ptr [r13 + 0x10], -1
0x14007ba9a: je 0x14007bb18
0x14007ba9c: cmp dil, 0xff
0x14007baa0: je 0x14007bc98
0x14007baa6: movzx eax, dil
0x14007baaa: lea rcx, [rip + 0x5d553ab]
0x14007bab1: movsxd rax, dword ptr [rcx + rax*4]
0x14007bab5: add rax, rcx
0x14007bab8: jmp rax
0x14007baba: lea rax, [rbp + 0xab]
0x14007bac1: mov qword ptr [rbp + 0x68], rax
0x14007bac5: lea rax, [rip + 0x4f81834]
0x14007bacc: mov qword ptr [rbp + 0x70], rax
0x14007bad0: lea rcx, [rip + 0x5d51789]
0x14007bad7: lea r8, [rip + 0x5d52932]
0x14007bade: lea rdx, [rbp + 0x68]
0x14007bae2: call 0x145d99830
0x14007bae7: ud2
0x14007bae9: lea rax, [rbp + 0xab]
0x14007baf0: mov qword ptr [rbp + 0x68], rax
0x14007baf4: lea rax, [rip + 0x4f81805]
0x14007bafb: mov qword ptr [rbp + 0x70], rax
0x14007baff: lea rcx, [rip + 0x5d5175a]
0x14007bb06: lea r8, [rip + 0x5d5291b]
0x14007bb0d: lea rdx, [rbp + 0x68]
0x14007bb11: call 0x145d99830
0x14007bb16: ud2
0x14007bb18: cmp dil, 0xff
0x14007bb1c: je 0x14007bca4
0x14007bb22: mov byte ptr [rbp + 0xaf], dil
0x14007bb29: mov byte ptr [rbp + 0xae], 0
0x14007bb30: lea rcx, [rbp + 0x68]
0x14007bb34: call 0x140282d50
0x14007bb39: nop
0x14007bb3a: mov byte ptr [rbp + 0x98], dil
0x14007bb41: movdqu xmm0, xmmword ptr [rbp + 0x68]
0x14007bb46: mov rdi, qword ptr [rbp + 0x78]
0x14007bb4a: mov rbx, qword ptr [rbp + 0x80]
0x14007bb51: movdqu xmmword ptr [rbp + 0x10], xmm0
0x14007bb56: mov qword ptr [rbp - 0x50], rdi
0x14007bb5a: mov qword ptr [rbp - 0x48], rbx
0x14007bb5e: mov qword ptr [rbp + 0x78], 0xffffffffffffffff
0x14007bb66: mov qword ptr [rbp + 0x68], 0
0x14007bb6e: mov byte ptr [rbp + 0x90], 0
0x14007bb75: call 0x140002200
0x14007bb7a: mov ecx, 0x10
0x14007bb7f: mov edx, 1
0x14007bb84: call 0x1400021c0
0x14007bb89: test rax, rax
0x14007bb8c: mov qword ptr [rbp + 0xa0], rax
0x14007bb93: je 0x14007be90
0x14007bb99: movdqu xmm0, xmmword ptr [rip + 0x5d53c47]
0x14007bba1: movdqu xmmword ptr [rax], xmm0
0x14007bba5: mov qword ptr [rbp - 0x40], 0x10
0x14007bbad: mov qword ptr [rbp - 0x38], rax
0x14007bbb1: mov qword ptr [rbp - 0x30], 0x10
0x14007bbb9: lea rcx, [rbp - 0x20]
0x14007bbbd: lea rdx, [rbp + 0x68]
0x14007bbc1: lea r8, [rbp - 0x40]
0x14007bbc5: call 0x145ba4b20
0x14007bbca: nop
0x14007bbcb: mov byte ptr [rbp + 0xad], 0
0x14007bbd2: mov byte ptr [rbp + 0xac], 1
0x14007bbd9: lea rcx, [rbp + 0x30]
0x14007bbdd: lea rdx, [rbp - 0x20]
0x14007bbe1: mov r8, rdi
0x14007bbe4: mov r9, rbx
0x14007bbe7: call 0x1401a5860
0x14007bbec: nop
0x14007bbed: cmp qword ptr [rbp + 0x30], 0
0x14007bbf2: je 0x14007bd4f
0x14007bbf8: mov byte ptr [rbp + 0xad], 0
0x14007bbff: mov byte ptr [rbp + 0xac], 1
0x14007bc06: lea rcx, [rbp + 0x30]
0x14007bc0a: call 0x14005bff0
0x14007bc0f: nop
0x14007bc10: mov qword ptr [rbp + 0xa0], r13
0x14007bc17: mov rax, qword ptr [rbp + 0x10]
0x14007bc1b: mov qword ptr [rbp + 0x28], rax
0x14007bc1f: mov rax, qword ptr [rbp + 0x18]
0x14007bc23: mov qword ptr [rbp + 0x20], rax
0x14007bc27: cmp dword ptr [rsi], -1
0x14007bc2a: je 0x14007bc35
0x14007bc2c: mov rcx, rsi
0x14007bc2f: call 0x140292560
0x14007bc34: nop
0x14007bc35: mov rax, qword ptr [rbp + 0xa0]
0x14007bc3c: mov rcx, qword ptr [rbp + 0x28]
0x14007bc40: mov qword ptr [rax + 0x10], rcx
0x14007bc44: mov rcx, qword ptr [rbp + 0x20]
0x14007bc48: mov qword ptr [rax + 0x18], rcx
0x14007bc4c: movzx edi, byte ptr [rbp + 0x98]
0x14007bc53: movzx eax, dil
0x14007bc57: lea rcx, [rip + 0x5d551fe]
0x14007bc5e: movsxd rax, dword ptr [rcx + rax*4]
0x14007bc62: add rax, rcx
0x14007bc65: jmp rax
0x14007bc67: movzx eax, byte ptr [rbp + 0x49]
0x14007bc6b: mov byte ptr [rbp + 0x69], al
0x14007bc6e: jmp 0x14007bdbe
0x14007bc73: cmp bl, 0xfe
0x14007bc76: jne 0x14007b67e
0x14007bc7c: mov qword ptr [rbp + 0xa0], r12
0x14007bc83: cmp dword ptr [r13 + 0x10], -1
0x14007bc88: je 0x14007bcbd
0x14007bc8a: add r13, 0x10
0x14007bc8e: mov rsi, r13
0x14007bc91: mov r12, qword ptr [rbp + 0xa0]
0x14007bc98: mov byte ptr [rbp - 0x20], 0xff
0x14007bc9c: mov dil, 0xff
0x14007bc9f: jmp 0x14007bdf9
0x14007bca4: mov qword ptr [rbp + 0xa0], r12
0x14007bcab: cmp bl, 0xfd
0x14007bcae: ja 0x14007bcbd
0x14007bcb0: mov rcx, qword ptr [rbp + 0xa0]
0x14007bcb7: call 0x14005e410
0x14007bcbc: nop
0x14007bcbd: mov rax, qword ptr [rbp + 0xa0]
0x14007bcc4: mov byte ptr [rax], 0xff
0x14007bcc7: jmp 0x14007b67e
0x14007bccc: lea rdx, [rbp + 0x50]
0x14007bcd0: lea rcx, [rbp + 0x70]
0x14007bcd4: mov byte ptr [rbp + 0xaf], 4
0x14007bcdb: mov byte ptr [rbp + 0xae], 0
0x14007bce2: call 0x1400adb40
0x14007bce7: nop
0x14007bce8: jmp 0x14007bdbe
0x14007bced: movdqu xmm0, xmmword ptr [rbp + 0x50]
0x14007bcf2: movdqu xmmword ptr [rbp + 0x70], xmm0
0x14007bcf7: jmp 0x14007bdbe
0x14007bcfc: lea rdx, [rbp + 0x50]
0x14007bd00: lea rcx, [rbp + 0x70]
0x14007bd04: mov byte ptr [rbp + 0xaf], 3
0x14007bd0b: mov byte ptr [rbp + 0xae], 0
0x14007bd12: call 0x145bcd2f0
0x14007bd17: nop
0x14007bd18: jmp 0x14007bdbe
0x14007bd1d: cmp qword ptr [rbp + 0x60], 0
0x14007bd22: je 0x14007bd93
0x14007bd24: mov rdx, qword ptr [rbp + 0x50]
0x14007bd28: test rdx, rdx
0x14007bd2b: je 0x14007be73
0x14007bd31: mov r8, qword ptr [rbp + 0x58]
0x14007bd35: mov byte ptr [rbp + 0xaf], 5
0x14007bd3c: mov byte ptr [rbp + 0xae], 0
0x14007bd43: lea rcx, [rbp + 0x30]
0x14007bd47: call 0x14005f980
0x14007bd4c: nop
0x14007bd4d: jmp 0x14007bda3
0x14007bd4f: mov byte ptr [rbp + 0xad], 0
0x14007bd56: mov byte ptr [rbp + 0xac], 1
0x14007bd5d: lea rcx, [rbp + 0x30]
0x14007bd61: call 0x14005bff0
0x14007bd66: nop
0x14007bd67: movzx eax, byte ptr [rbp + 0x98]
0x14007bd6e: mov byte ptr [rbp + 0xaf], al
0x14007bd74: mov byte ptr [rbp + 0xae], 0
0x14007bd7b: lea rcx, [rbp + 0x10]
0x14007bd7f: call 0x140292560
0x14007bd84: nop
0x14007bd85: lea rcx, [rbp + 0x48]
0x14007bd89: call 0x14005e410
0x14007bd8e: jmp 0x14007b67e
0x14007bd93: mov qword ptr [rbp + 0x30], 0
0x14007bd9b: mov qword ptr [rbp + 0x40], 0
0x14007bda3: mov rax, qword ptr [rbp + 0x40]
0x14007bda7: mov qword ptr [rbp + 0x80], rax
0x14007bdae: mov rax, qword ptr [rbp + 0x30]
0x14007bdb2: mov qword ptr [rbp + 0x70], rax
0x14007bdb6: mov rax, qword ptr [rbp + 0x38]
0x14007bdba: mov qword ptr [rbp + 0x78], rax
0x14007bdbe: mov byte ptr [rbp + 0x68], dil
0x14007bdc2: mov rax, qword ptr [rbp + 0x78]
0x14007bdc6: mov qword ptr [rbp - 0x10], rax
0x14007bdca: mov rax, qword ptr [rbp + 0x80]
0x14007bdd1: mov qword ptr [rbp - 8], rax
0x14007bdd5: movzx eax, byte ptr [rbp + 0x68]
0x14007bdd9: mov byte ptr [rbp - 0x20], al
0x14007bddc: movzx eax, byte ptr [rbp + 0x69]
0x14007bde0: mov byte ptr [rbp - 0x1f], al
0x14007bde3: mov eax, dword ptr [rbp + 0x6a]
0x14007bde6: mov dword ptr [rbp - 0x1e], eax
0x14007bde9: movzx eax, word ptr [rbp + 0x6e]
0x14007bded: mov word ptr [rbp - 0x1a], ax
0x14007bdf1: mov rax, qword ptr [rbp + 0x70]
0x14007bdf5: mov qword ptr [rbp - 0x18], rax
0x14007bdf9: mov byte ptr [rbp + 0xaf], dil
0x14007be00: mov byte ptr [rbp + 0xae], 0
0x14007be07: lea rcx, [rbp - 0x40]
0x14007be0b: lea r8, [rbp - 0x20]
0x14007be0f: mov rdx, rsi
0x14007be12: call 0x140283570
0x14007be17: nop
0x14007be18: cmp byte ptr [rbp - 0x40], 0xfd
0x14007be1c: ja 0x14007be36
0x14007be1e: mov byte ptr [rbp + 0xaf], dil
0x14007be25: mov byte ptr [rbp + 0xae], 0
0x14007be2c: lea rcx, [rbp - 0x40]
0x14007be30: call 0x14005e410
0x14007be35: nop
0x14007be36: mov byte ptr [rbp + 0x98], dil
0x14007be3d: cmp byte ptr [r12], 0xfd
0x14007be42: mov qword ptr [rbp + 0xa0], r12
0x14007be49: ja 0x14007be58
0x14007be4b: mov rcx, qword ptr [rbp + 0xa0]
0x14007be52: call 0x14005e410
0x14007be57: nop
0x14007be58: movups xmm0, xmmword ptr [rbp + 0x48]
0x14007be5c: movups xmm1, xmmword ptr [rbp + 0x58]
0x14007be60: mov rax, qword ptr [rbp + 0xa0]
0x14007be67: movups xmmword ptr [rax + 0x10], xmm1
0x14007be6b: movups xmmword ptr [rax], xmm0
0x14007be6e: jmp 0x14007b67e
0x14007be73: mov byte ptr [rbp + 0xaf], 5
0x14007be7a: mov byte ptr [rbp + 0xae], 0
0x14007be81: lea rcx, [rip + 0x5d53e38]
0x14007be88: call 0x145d995b0
0x14007be8d: nop
0x14007be8e: jmp 0x14007bea0
0x14007be90: mov ecx, 1
0x14007be95: mov edx, 0x10
0x14007be9a: call 0x145d992bb
0x14007be9f: nop
0x14007bea0: ud2
