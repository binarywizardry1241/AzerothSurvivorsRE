0x1458095e0: add rdx, -2
0x1458095e4: cmp rdx, 6
0x1458095e8: ja 0x1458096e8
0x1458095ee: lea rax, [rip + 0x14c1217]
0x1458095f5: movsxd rdx, dword ptr [rax + rdx*4]
0x1458095f9: add rdx, rax
0x1458095fc: jmp rdx
0x1458095fe: cmp word ptr [rcx], 0x6261
0x145809603: je 0x1458096eb
0x145809609: cmp word ptr [rcx], 0x6d73
0x14580960e: je 0x1458096fd
0x145809614: cmp word ptr [rcx], 0x7661
0x145809619: je 0x145809703
0x14580961f: cmp word ptr [rcx], 0x7161
0x145809624: jne 0x1458096e8
0x14580962a: mov eax, 0xa
0x14580962f: ret
0x145809630: mov eax, 0x79776c65
0x145809635: xor eax, dword ptr [rcx]
0x145809637: movzx edx, word ptr [rcx + 4]
0x14580963b: xor edx, 0x6e6e
0x145809641: or edx, eax
0x145809643: je 0x1458096e8
0x145809649: mov eax, 0x6f676e75
0x14580964e: xor eax, dword ptr [rcx]
0x145809650: movzx ecx, word ptr [rcx + 4]
0x145809654: xor ecx, 0x6f72
0x14580965a: or ecx, eax
0x14580965c: jne 0x1458096e8
0x145809662: mov eax, 3
0x145809667: ret
0x145809668: xor edx, edx
0x14580966a: cmp dword ptr [rcx], 0x7878616e
0x145809670: mov eax, 0xb
0x145809675: cmovne rax, rdx
0x145809679: ret
0x14580967a: mov eax, 0x6e657261
0x14580967f: xor eax, dword ptr [rcx]
0x145809681: movzx ecx, byte ptr [rcx + 4]
0x145809685: xor ecx, 0x61
0x145809688: or ecx, eax
0x14580968a: jne 0x1458096e8
0x14580968c: mov eax, 6
0x145809691: ret
0x145809692: movzx eax, word ptr [rcx]
0x145809695: xor eax, 0x7377
0x14580969a: movzx edx, byte ptr [rcx + 2]
0x14580969e: xor edx, 0x67
0x1458096a1: or dx, ax
0x1458096a4: je 0x1458096f1
0x1458096a6: movzx eax, word ptr [rcx]
0x1458096a9: xor eax, 0x7262
0x1458096ae: movzx ecx, byte ptr [rcx + 2]
0x1458096b2: xor ecx, 0x6d
0x1458096b5: or cx, ax
0x1458096b8: jne 0x1458096e8
0x1458096ba: mov eax, 9
0x1458096bf: ret
0x1458096c0: mov eax, 0x61726566
0x1458096c5: xor eax, dword ptr [rcx]
0x1458096c7: mov edx, 0x73616c61
0x1458096cc: xor edx, dword ptr [rcx + 3]
0x1458096cf: or edx, eax
0x1458096d1: jne 0x1458096e8
0x1458096d3: mov eax, 5
0x1458096d8: ret
0x1458096d9: movabs rax, 0x646f6f776b737564
0x1458096e3: cmp qword ptr [rcx], rax
0x1458096e6: je 0x1458096f7
0x1458096e8: xor eax, eax
0x1458096ea: ret
0x1458096eb: mov eax, 4
0x1458096f0: ret
0x1458096f1: mov eax, 2
0x1458096f6: ret
0x1458096f7: mov eax, 1
0x1458096fc: ret
0x1458096fd: mov eax, 7
0x145809702: ret
0x145809703: mov eax, 8
0x145809708: ret
