14580b380: add rdx, -6
14580b384: cmp rdx, 0xd
14580b388: ja 0x14580b63c
14580b38e: lea rax, [rip + 0x17f89e3]
14580b395: movsxd rdx, dword ptr [rax + rdx*4]
14580b399: add rdx, rax
14580b39c: jmp rdx
14580b39e: mov edx, 0x72756c46
14580b3a3: xor edx, dword ptr [rcx]
14580b3a5: movzx ecx, word ptr [rcx + 4]
14580b3a9: xor ecx, 0x7972
14580b3af: xor eax, eax
14580b3b1: or ecx, edx
14580b3b3: setne cl
14580b3b6: cmp r8b, 1
14580b3ba: jne 0x14580b63c
14580b3c0: mov al, cl
14580b3c2: test eax, eax
14580b3c4: jne 0x14580b63c
14580b3ca: lea rax, [rip + 0x17f7e3f]
14580b3d1: add rax, 0x14
14580b3d5: mov eax, dword ptr [rax]
14580b3d7: ret
14580b3d8: movabs rdx, 0x617453207473614c
14580b3e2: xor rdx, qword ptr [rcx]
14580b3e5: movzx ecx, word ptr [rcx + 8]
14580b3e9: xor rcx, 0x646e
14580b3f0: xor eax, eax
14580b3f2: or rcx, rdx
14580b3f5: setne al
14580b3f8: test r8b, r8b
14580b3fb: jne 0x14580b5ee
14580b401: test eax, eax
14580b403: jne 0x14580b5ee
14580b409: lea rax, [rip + 0x17f7da0]
14580b410: add rax, 0x14
14580b414: mov eax, dword ptr [rax]
14580b416: ret
14580b417: movabs rdx, 0x6e7261636e696552
14580b421: xor rdx, qword ptr [rcx]
14580b424: movabs r9, 0x6e6f6974616e7261
14580b42e: xor r9, qword ptr [rcx + 5]
14580b432: xor eax, eax
14580b434: or r9, rdx
14580b437: setne cl
14580b43a: cmp r8b, 2
14580b43e: jne 0x14580b63c
14580b444: mov al, cl
14580b446: test eax, eax
14580b448: jne 0x14580b63c
14580b44e: lea rax, [rip + 0x17f7e1b]
14580b455: add rax, 0x14
14580b459: mov eax, dword ptr [rax]
14580b45b: ret
14580b45c: movabs rdx, 0x6569666974726f46
14580b466: xor rdx, qword ptr [rcx]
14580b469: movzx r9d, byte ptr [rcx + 8]
14580b46e: xor r9, 0x64
14580b472: xor eax, eax
14580b474: or r9, rdx
14580b477: setne dl
14580b47a: test r8b, r8b
14580b47d: jne 0x14580b606
14580b483: mov al, dl
14580b485: test eax, eax
14580b487: jne 0x14580b606
14580b48d: lea rax, [rip + 0x17f7cec]
14580b494: add rax, 0x14
14580b498: mov eax, dword ptr [rax]
14580b49a: ret
14580b49b: movabs rdx, 0x4d20646c65696853
14580b4a5: xor rdx, qword ptr [rcx]
14580b4a8: movabs r9, 0x7972657473614d20
14580b4b2: xor r9, qword ptr [rcx + 6]
14580b4b6: xor eax, eax
14580b4b8: or r9, rdx
14580b4bb: setne cl
14580b4be: test r8b, r8b
14580b4c1: jne 0x14580b63c
14580b4c7: mov al, cl
14580b4c9: test eax, eax
14580b4cb: jne 0x14580b63c
14580b4d1: lea rax, [rip + 0x17f7cc0]
14580b4d8: add rax, 0x14
14580b4dc: mov eax, dword ptr [rax]
14580b4de: ret
14580b4df: movabs rdx, 0x4420746e65647241
14580b4e9: xor rdx, qword ptr [rcx]
14580b4ec: movabs r9, 0x7265646e65666544
14580b4f6: xor r9, qword ptr [rcx + 7]
14580b4fa: xor eax, eax
14580b4fc: or r9, rdx
14580b4ff: setne cl
14580b502: test r8b, r8b
14580b505: jne 0x14580b63c
14580b50b: mov al, cl
14580b50d: test eax, eax
14580b50f: jne 0x14580b63c
14580b515: lea rax, [rip + 0x17f7cac]
14580b51c: add rax, 0x14
14580b520: mov eax, dword ptr [rax]
14580b522: ret
14580b523: movabs rdx, 0x6544207461656843
14580b52d: xor rdx, qword ptr [rcx]
14580b530: movabs r9, 0x6874616544207461
14580b53a: xor r9, qword ptr [rcx + 3]
14580b53e: xor eax, eax
14580b540: or r9, rdx
14580b543: setne cl
14580b546: cmp r8b, 2
14580b54a: jne 0x14580b63c
14580b550: mov al, cl
14580b552: test eax, eax
14580b554: jne 0x14580b63c
14580b55a: lea rax, [rip + 0x17f7cf7]
14580b561: add rax, 0x14
14580b565: mov eax, dword ptr [rax]
14580b567: ret
14580b568: movabs rdx, 0x2064657373656c42
14580b572: xor rdx, qword ptr [rcx]
14580b575: mov ecx, dword ptr [rcx + 8]
14580b578: xor rcx, 0x6566694c
14580b57f: xor eax, eax
14580b581: or rcx, rdx
14580b584: setne cl
14580b587: test r8b, r8b
14580b58a: jne 0x14580b63c
14580b590: mov al, cl
14580b592: test eax, eax
14580b594: jne 0x14580b63c
14580b59a: lea rax, [rip + 0x17f7c3f]
14580b5a1: add rax, 0x14
14580b5a5: mov eax, dword ptr [rax]
14580b5a7: ret
14580b5a8: movdqu xmm0, xmmword ptr [rcx]
14580b5ac: movdqu xmm1, xmmword ptr [rcx + 3]
14580b5b1: pcmpeqb xmm1, xmmword ptr [rip + 0x148e757]
14580b5b9: pcmpeqb xmm0, xmmword ptr [rip + 0x148e75f]
14580b5c1: pand xmm0, xmm1
14580b5c5: pmovmskb ecx, xmm0
14580b5c9: xor eax, eax
14580b5cb: cmp ecx, 0xffff
14580b5d1: setne cl
14580b5d4: cmp r8b, 2
14580b5d8: jne 0x14580b63c
14580b5da: mov al, cl
14580b5dc: test eax, eax
14580b5de: jne 0x14580b63c
14580b5e0: lea rax, [rip + 0x17f7c59]
14580b5e7: add rax, 0x14
14580b5eb: mov eax, dword ptr [rax]
14580b5ed: ret
14580b5ee: cmp r8b, 2
14580b5f2: jne 0x14580b63c
14580b5f4: test eax, eax
14580b5f6: jne 0x14580b63c
14580b5f8: lea rax, [rip + 0x17f7c29]
14580b5ff: add rax, 0x14
14580b603: mov eax, dword ptr [rax]
14580b605: ret
14580b606: movabs rdx, 0x6e694c206c756f53
14580b610: xor rdx, qword ptr [rcx]
14580b613: movzx ecx, byte ptr [rcx + 8]
14580b617: xor rcx, 0x6b
14580b61b: xor eax, eax
14580b61d: or rcx, rdx
14580b620: setne cl
14580b623: test r8b, r8b
14580b626: jne 0x14580b63c
14580b628: mov al, cl
14580b62a: test eax, eax
14580b62c: jne 0x14580b63c
14580b62e: lea rax, [rip + 0x17f7bc3]
14580b635: add rax, 0x14
14580b639: mov eax, dword ptr [rax]
14580b63b: ret
14580b63c: movzx eax, r8b
14580b640: lea rcx, [rip + 0x17f7f61]
14580b647: lea rax, [rcx + rax*4]
14580b64b: mov eax, dword ptr [rax]
14580b64d: ret
