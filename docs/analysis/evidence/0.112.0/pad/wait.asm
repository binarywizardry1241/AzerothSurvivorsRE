1401c2994: 410fb6434c movzx eax, byte ptr [r11 + 0x4c]
1401c2999: fec0 inc al
1401c299b: 0fb6c0 movzx eax, al
1401c299e: b9ff000000 mov ecx, 0xff
1401c29a3: 0f45c8 cmovne ecx, eax
1401c29a6: 8b8570030000 mov eax, dword ptr [rbp + 0x370]
1401c29ac: 418902 mov dword ptr [r10], eax
1401c29af: 41884b4c mov byte ptr [r11 + 0x4c], cl
1401c29b3: 418b4328 mov eax, dword ptr [r11 + 0x28]
1401c29b7: 80f902 cmp cl, 2
1401c29ba: 7646 jbe 0x1401c2a02
1401c29bc: a801 test al, 1
1401c29be: 7453 je 0x1401c2a13
1401c29c0: f2450f104b2c movsd xmm9, qword ptr [r11 + 0x2c]
1401c29c6: eb53 jmp 0x1401c2a1b
1401c29c8: 41c7431000000000 mov dword ptr [r11 + 0x10], 0
1401c29d0: 8b8d70030000 mov ecx, dword ptr [rbp + 0x370]
1401c29d6: 41890a mov dword ptr [r10], ecx
1401c29d9: 41c6434c00 mov byte ptr [r11 + 0x4c], 0
1401c29de: 41837b1000 cmp dword ptr [r11 + 0x10], 0
1401c29e3: 0f8585000000 jne 0x1401c2a6e
1401c29e9: 4c8b9558030000 mov r10, qword ptr [rbp + 0x358]
1401c29f0: 8b8570030000 mov eax, dword ptr [rbp + 0x370]
1401c29f6: 418902 mov dword ptr [r10], eax
1401c29f9: 41c6434c01 mov byte ptr [r11 + 0x4c], 1
1401c29fe: 418b4328 mov eax, dword ptr [r11 + 0x28]
1401c2a02: 85c0 test eax, eax
1401c2a04: 740d je 0x1401c2a13
1401c2a06: 418b4310 mov eax, dword ptr [r11 + 0x10]
1401c2a0a: 85c0 test eax, eax
1401c2a0c: 7552 jne 0x1401c2a60
1401c2a0e: e9db000000 jmp 0x1401c2aee
1401c2a13: 440f590d5581bf05 mulps xmm9, xmmword ptr [rip + 0x5bf8155]
