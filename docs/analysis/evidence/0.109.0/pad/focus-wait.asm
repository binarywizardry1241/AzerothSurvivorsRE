1401c46e4: 410fb6434c movzx eax, byte ptr [r11 + 0x4c]
1401c46e9: fec0 inc al
1401c46eb: 0fb6c0 movzx eax, al
1401c46ee: b9ff000000 mov ecx, 0xff
1401c46f3: 0f45c8 cmovne ecx, eax
1401c46f6: 8b8560030000 mov eax, dword ptr [rbp + 0x360]
1401c46fc: 418902 mov dword ptr [r10], eax
1401c46ff: 41884b4c mov byte ptr [r11 + 0x4c], cl
1401c4703: 418b4328 mov eax, dword ptr [r11 + 0x28]
1401c4707: 80f902 cmp cl, 2
1401c470a: 7646 jbe 0x1401c4752
1401c470c: a801 test al, 1
1401c470e: 7453 je 0x1401c4763
1401c4710: f2450f104b2c movsd xmm9, qword ptr [r11 + 0x2c]
1401c4716: eb53 jmp 0x1401c476b
1401c4718: 41c7431000000000 mov dword ptr [r11 + 0x10], 0
1401c4720: 8b8d60030000 mov ecx, dword ptr [rbp + 0x360]
1401c4726: 41890a mov dword ptr [r10], ecx
1401c4729: 41c6434c00 mov byte ptr [r11 + 0x4c], 0
1401c472e: 41837b1000 cmp dword ptr [r11 + 0x10], 0
1401c4733: 0f8585000000 jne 0x1401c47be
1401c4739: 4c8b9548030000 mov r10, qword ptr [rbp + 0x348]
1401c4740: 8b8560030000 mov eax, dword ptr [rbp + 0x360]
1401c4746: 418902 mov dword ptr [r10], eax
1401c4749: 41c6434c01 mov byte ptr [r11 + 0x4c], 1
1401c474e: 418b4328 mov eax, dword ptr [r11 + 0x28]
1401c4752: 85c0 test eax, eax
1401c4754: 740d je 0x1401c4763
1401c4756: 418b4310 mov eax, dword ptr [r11 + 0x10]
1401c475a: 85c0 test eax, eax
1401c475c: 7552 jne 0x1401c47b0
1401c475e: e9db000000 jmp 0x1401c483e
1401c4763: 440f590df5dac105 mulps xmm9, xmmword ptr [rip + 0x5c1daf5]
