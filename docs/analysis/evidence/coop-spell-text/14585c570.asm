0x14585c570: add rdx, -6
0x14585c574: cmp rdx, 0xd
0x14585c578: ja 0x14585c82c
0x14585c57e: lea rax, [rip + 0x17cfdc7]
0x14585c585: movsxd rdx, dword ptr [rax + rdx*4]
0x14585c589: add rdx, rax
0x14585c58c: jmp rdx
0x14585c58e: mov edx, 0x72756c46
0x14585c593: xor edx, dword ptr [rcx]
0x14585c595: movzx ecx, word ptr [rcx + 4]
0x14585c599: xor ecx, 0x7972
0x14585c59f: xor eax, eax
0x14585c5a1: or ecx, edx
0x14585c5a3: setne cl
0x14585c5a6: cmp r8b, 1
0x14585c5aa: jne 0x14585c82c
0x14585c5b0: mov al, cl
0x14585c5b2: test eax, eax
0x14585c5b4: jne 0x14585c82c
0x14585c5ba: lea rax, [rip + 0x17ce4d7]
0x14585c5c1: add rax, 0x14
0x14585c5c5: mov eax, dword ptr [rax]
0x14585c5c7: ret
0x14585c5c8: movabs rdx, 0x617453207473614c
0x14585c5d2: xor rdx, qword ptr [rcx]
0x14585c5d5: movzx ecx, word ptr [rcx + 8]
0x14585c5d9: xor rcx, 0x646e
0x14585c5e0: xor eax, eax
0x14585c5e2: or rcx, rdx
0x14585c5e5: setne al
0x14585c5e8: test r8b, r8b
0x14585c5eb: jne 0x14585c7de
0x14585c5f1: test eax, eax
0x14585c5f3: jne 0x14585c7de
0x14585c5f9: lea rax, [rip + 0x17ce438]
0x14585c600: add rax, 0x14
0x14585c604: mov eax, dword ptr [rax]
0x14585c606: ret
0x14585c607: movabs rdx, 0x6e7261636e696552
0x14585c611: xor rdx, qword ptr [rcx]
0x14585c614: movabs r9, 0x6e6f6974616e7261
0x14585c61e: xor r9, qword ptr [rcx + 5]
0x14585c622: xor eax, eax
0x14585c624: or r9, rdx
0x14585c627: setne cl
0x14585c62a: cmp r8b, 2
0x14585c62e: jne 0x14585c82c
0x14585c634: mov al, cl
0x14585c636: test eax, eax
0x14585c638: jne 0x14585c82c
0x14585c63e: lea rax, [rip + 0x17ce4b3]
0x14585c645: add rax, 0x14
0x14585c649: mov eax, dword ptr [rax]
0x14585c64b: ret
0x14585c64c: movabs rdx, 0x6569666974726f46
0x14585c656: xor rdx, qword ptr [rcx]
0x14585c659: movzx r9d, byte ptr [rcx + 8]
0x14585c65e: xor r9, 0x64
0x14585c662: xor eax, eax
0x14585c664: or r9, rdx
0x14585c667: setne dl
0x14585c66a: test r8b, r8b
0x14585c66d: jne 0x14585c7f6
0x14585c673: mov al, dl
0x14585c675: test eax, eax
0x14585c677: jne 0x14585c7f6
0x14585c67d: lea rax, [rip + 0x17ce384]
0x14585c684: add rax, 0x14
0x14585c688: mov eax, dword ptr [rax]
0x14585c68a: ret
0x14585c68b: movabs rdx, 0x4d20646c65696853
0x14585c695: xor rdx, qword ptr [rcx]
0x14585c698: movabs r9, 0x7972657473614d20
0x14585c6a2: xor r9, qword ptr [rcx + 6]
0x14585c6a6: xor eax, eax
0x14585c6a8: or r9, rdx
0x14585c6ab: setne cl
0x14585c6ae: test r8b, r8b
0x14585c6b1: jne 0x14585c82c
0x14585c6b7: mov al, cl
0x14585c6b9: test eax, eax
0x14585c6bb: jne 0x14585c82c
0x14585c6c1: lea rax, [rip + 0x17ce358]
0x14585c6c8: add rax, 0x14
0x14585c6cc: mov eax, dword ptr [rax]
0x14585c6ce: ret
0x14585c6cf: movabs rdx, 0x4420746e65647241
0x14585c6d9: xor rdx, qword ptr [rcx]
0x14585c6dc: movabs r9, 0x7265646e65666544
0x14585c6e6: xor r9, qword ptr [rcx + 7]
0x14585c6ea: xor eax, eax
0x14585c6ec: or r9, rdx
0x14585c6ef: setne cl
0x14585c6f2: test r8b, r8b
0x14585c6f5: jne 0x14585c82c
0x14585c6fb: mov al, cl
0x14585c6fd: test eax, eax
0x14585c6ff: jne 0x14585c82c
0x14585c705: lea rax, [rip + 0x17ce344]
0x14585c70c: add rax, 0x14
0x14585c710: mov eax, dword ptr [rax]
0x14585c712: ret
0x14585c713: movabs rdx, 0x6544207461656843
0x14585c71d: xor rdx, qword ptr [rcx]
0x14585c720: movabs r9, 0x6874616544207461
0x14585c72a: xor r9, qword ptr [rcx + 3]
0x14585c72e: xor eax, eax
0x14585c730: or r9, rdx
0x14585c733: setne cl
0x14585c736: cmp r8b, 2
0x14585c73a: jne 0x14585c82c
0x14585c740: mov al, cl
0x14585c742: test eax, eax
0x14585c744: jne 0x14585c82c
0x14585c74a: lea rax, [rip + 0x17ce38f]
0x14585c751: add rax, 0x14
0x14585c755: mov eax, dword ptr [rax]
0x14585c757: ret
0x14585c758: movabs rdx, 0x2064657373656c42
0x14585c762: xor rdx, qword ptr [rcx]
0x14585c765: mov ecx, dword ptr [rcx + 8]
0x14585c768: xor rcx, 0x6566694c
0x14585c76f: xor eax, eax
0x14585c771: or rcx, rdx
0x14585c774: setne cl
0x14585c777: test r8b, r8b
0x14585c77a: jne 0x14585c82c
0x14585c780: mov al, cl
0x14585c782: test eax, eax
0x14585c784: jne 0x14585c82c
0x14585c78a: lea rax, [rip + 0x17ce2d7]
0x14585c791: add rax, 0x14
0x14585c795: mov eax, dword ptr [rax]
0x14585c797: ret
0x14585c798: movdqu xmm0, xmmword ptr [rcx]
0x14585c79c: movdqu xmm1, xmmword ptr [rcx + 3]
0x14585c7a1: pcmpeqb xmm1, xmmword ptr [rip + 0x17b0157]
0x14585c7a9: pcmpeqb xmm0, xmmword ptr [rip + 0x17b015f]
0x14585c7b1: pand xmm0, xmm1
0x14585c7b5: pmovmskb ecx, xmm0
0x14585c7b9: xor eax, eax
0x14585c7bb: cmp ecx, 0xffff
0x14585c7c1: setne cl
0x14585c7c4: cmp r8b, 2
0x14585c7c8: jne 0x14585c82c
0x14585c7ca: mov al, cl
0x14585c7cc: test eax, eax
0x14585c7ce: jne 0x14585c82c
0x14585c7d0: lea rax, [rip + 0x17ce2f1]
0x14585c7d7: add rax, 0x14
0x14585c7db: mov eax, dword ptr [rax]
0x14585c7dd: ret
0x14585c7de: cmp r8b, 2
0x14585c7e2: jne 0x14585c82c
0x14585c7e4: test eax, eax
0x14585c7e6: jne 0x14585c82c
0x14585c7e8: lea rax, [rip + 0x17ce2c1]
0x14585c7ef: add rax, 0x14
0x14585c7f3: mov eax, dword ptr [rax]
0x14585c7f5: ret
0x14585c7f6: movabs rdx, 0x6e694c206c756f53
0x14585c800: xor rdx, qword ptr [rcx]
0x14585c803: movzx ecx, byte ptr [rcx + 8]
0x14585c807: xor rcx, 0x6b
0x14585c80b: xor eax, eax
0x14585c80d: or rcx, rdx
0x14585c810: setne cl
0x14585c813: test r8b, r8b
0x14585c816: jne 0x14585c82c
0x14585c818: mov al, cl
0x14585c81a: test eax, eax
0x14585c81c: jne 0x14585c82c
0x14585c81e: lea rax, [rip + 0x17ce25b]
0x14585c825: add rax, 0x14
0x14585c829: mov eax, dword ptr [rax]
0x14585c82b: ret
0x14585c82c: movzx eax, r8b
0x14585c830: lea rcx, [rip + 0x17cf651]
0x14585c837: lea rax, [rcx + rax*4]
0x14585c83b: mov eax, dword ptr [rax]
0x14585c83d: ret
0x14585c83e: int3
0x14585c83f: int3
