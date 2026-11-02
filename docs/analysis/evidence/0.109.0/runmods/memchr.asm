;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x145bd5860..0x145bd5945 SHA256 8a015eaf40bf56cb62915e956f9224077543e3aeca0816e9e0091a5cb12f76be
0x145bd5860: push r14
0x145bd5862: push rsi
0x145bd5863: push rdi
0x145bd5864: push rbx
0x145bd5865: mov r9, rdx
0x145bd5868: add rdx, 7
0x145bd586c: and rdx, 0xfffffffffffffff8
0x145bd5870: sub rdx, r9
0x145bd5873: jne 0x145bd587d
0x145bd5875: lea rax, [r8 - 0x10]
0x145bd5879: xor edx, edx
0x145bd587b: jmp 0x145bd58ab
0x145bd587d: cmp r8, rdx
0x145bd5880: cmovb rdx, r8
0x145bd5884: test r8, r8
0x145bd5887: je 0x145bd58a2
0x145bd5889: xor r10d, r10d
0x145bd588c: nop dword ptr [rax]
0x145bd5890: cmp byte ptr [r9 + r10], cl
0x145bd5894: je 0x145bd5937
0x145bd589a: inc r10
0x145bd589d: cmp rdx, r10
0x145bd58a0: jne 0x145bd5890
0x145bd58a2: lea rax, [r8 - 0x10]
0x145bd58a6: cmp rdx, rax
0x145bd58a9: ja 0x145bd5915
0x145bd58ab: movzx r11d, cl
0x145bd58af: movabs r10, 0x101010101010101
0x145bd58b9: imul r10, r11
0x145bd58bd: movabs r11, 0x101010101010100
0x145bd58c7: movabs rsi, 0x8080808080808080
0x145bd58d1: nop word ptr cs:[rax + rax]
0x145bd58e0: mov rdi, qword ptr [r9 + rdx]
0x145bd58e4: xor rdi, r10
0x145bd58e7: mov rbx, r11
0x145bd58ea: sub rbx, rdi
0x145bd58ed: or rbx, rdi
0x145bd58f0: mov rdi, qword ptr [r9 + rdx + 8]
0x145bd58f5: xor rdi, r10
0x145bd58f8: mov r14, r11
0x145bd58fb: sub r14, rdi
0x145bd58fe: or r14, rdi
0x145bd5901: and r14, rbx
0x145bd5904: not r14
0x145bd5907: test r14, rsi
0x145bd590a: jne 0x145bd5915
0x145bd590c: add rdx, 0x10
0x145bd5910: cmp rdx, rax
0x145bd5913: jbe 0x145bd58e0
0x145bd5915: xor eax, eax
0x145bd5917: cmp r8, rdx
0x145bd591a: je 0x145bd592e
0x145bd591c: nop dword ptr [rax]
0x145bd5920: cmp byte ptr [r9 + rdx], cl
0x145bd5924: je 0x145bd5930
0x145bd5926: inc rdx
0x145bd5929: cmp r8, rdx
0x145bd592c: jne 0x145bd5920
0x145bd592e: jmp 0x145bd593f
0x145bd5930: mov eax, 1
0x145bd5935: jmp 0x145bd593f
0x145bd5937: mov eax, 1
0x145bd593c: mov rdx, r10
0x145bd593f: pop rbx
0x145bd5940: pop rdi
0x145bd5941: pop rsi
0x145bd5942: pop r14
0x145bd5944: ret
