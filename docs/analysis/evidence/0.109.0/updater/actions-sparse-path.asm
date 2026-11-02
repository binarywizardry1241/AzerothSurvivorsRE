; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x1401c7849..0x1401c78ae SHA256 21c784f9d6b91d1a2b001010dfa219d715147e1b54c2fa8b3ba58041aaef5348
0x1401c7849: cmp byte ptr [rdx], 0
0x1401c784c: jne 0x1401c7714
0x1401c7852: movzx ecx, byte ptr [rcx]
0x1401c7855: test ecx, ecx
0x1401c7857: je 0x1401c7877
0x1401c7859: cmp ecx, 1
0x1401c785c: jne 0x1401c7895
0x1401c785e: mov rcx, qword ptr [rsp + 0x68]
0x1401c7863: mov edx, dword ptr [rsp + 0x54]
0x1401c7867: mov dword ptr [rcx], edx
0x1401c7869: mov rcx, qword ptr [rsp + 0x58]
0x1401c786e: mov byte ptr [rcx + 0x10], 1
0x1401c7872: jmp 0x1401c7714
0x1401c7877: mov rcx, qword ptr [rsp + 0x40]
0x1401c787c: mov qword ptr [rsp + 0x60], rax
0x1401c7881: call 0x140180310
0x1401c7886: mov r11d, dword ptr [rsp + 0x3c]
0x1401c788b: mov rax, qword ptr [rsp + 0x60]
0x1401c7890: jmp 0x1401c7714
0x1401c7895: mov rcx, qword ptr [rsp + 0x68]
0x1401c789a: mov edx, dword ptr [rsp + 0x54]
0x1401c789e: mov dword ptr [rcx], edx
0x1401c78a0: mov rcx, qword ptr [rsp + 0x58]
0x1401c78a5: mov byte ptr [rcx + 0x10], 0
0x1401c78a9: jmp 0x1401c7714
