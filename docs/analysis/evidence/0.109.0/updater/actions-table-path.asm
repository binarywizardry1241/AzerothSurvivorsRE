; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x1401c7649..0x1401c76ae SHA256 661f368bde0bd628481779d3309ae31f2b2cd9a7895ab56f0ccea2f746c72f7e
0x1401c7649: cmp byte ptr [rdx], 0
0x1401c764c: jne 0x1401c750d
0x1401c7652: movzx ecx, byte ptr [rcx]
0x1401c7655: test ecx, ecx
0x1401c7657: je 0x1401c7677
0x1401c7659: cmp ecx, 1
0x1401c765c: jne 0x1401c7695
0x1401c765e: mov rcx, qword ptr [rsp + 0x68]
0x1401c7663: mov edx, dword ptr [rsp + 0x54]
0x1401c7667: mov dword ptr [rcx], edx
0x1401c7669: mov rcx, qword ptr [rsp + 0x58]
0x1401c766e: mov byte ptr [rcx + 0x10], 1
0x1401c7672: jmp 0x1401c750d
0x1401c7677: mov rcx, qword ptr [rsp + 0x40]
0x1401c767c: mov qword ptr [rsp + 0x48], rax
0x1401c7681: call 0x140180310
0x1401c7686: mov r11d, dword ptr [rsp + 0x3c]
0x1401c768b: mov rax, qword ptr [rsp + 0x48]
0x1401c7690: jmp 0x1401c750d
0x1401c7695: mov rcx, qword ptr [rsp + 0x68]
0x1401c769a: mov edx, dword ptr [rsp + 0x54]
0x1401c769e: mov dword ptr [rcx], edx
0x1401c76a0: mov rcx, qword ptr [rsp + 0x58]
0x1401c76a5: mov byte ptr [rcx + 0x10], 0
0x1401c76a9: jmp 0x1401c750d
