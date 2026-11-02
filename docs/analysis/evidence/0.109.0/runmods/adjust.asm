;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x14590e420..0x14590e496 SHA256 5398a144b5d60aeef7964b2fbf0f89e58ca58b41cedb608ec991c65e4bd869e1
0x14590e420: sub rsp, 0x28
0x14590e424: cmp rdx, 3
0x14590e428: ja 0x14590e480
0x14590e42a: lea rax, [rdx + rdx*2]
0x14590e42e: shl rax, 4
0x14590e432: lea r9, [rip + 0x18fd74f]
0x14590e439: movzx r10d, word ptr [rax + r9 + 0x26]
0x14590e43f: test r8d, r8d
0x14590e442: sets r8b
0x14590e446: setg r11b
0x14590e44a: sub r11b, r8b
0x14590e44d: movsx r8d, r11b
0x14590e451: movzx eax, word ptr [rax + r9 + 0x28]
0x14590e457: imul eax, r8d
0x14590e45b: movzx r8d, word ptr [rcx + rdx*2]
0x14590e460: add r8d, eax
0x14590e463: cmp r8d, r10d
0x14590e466: cmovb r10d, r8d
0x14590e46a: cmp r8d, 0x64
0x14590e46e: mov eax, 0x64
0x14590e473: cmovge eax, r10d
0x14590e477: mov word ptr [rcx + rdx*2], ax
0x14590e47b: add rsp, 0x28
0x14590e47f: ret
0x14590e480: lea r8, [rip + 0x18fd7e9]
0x14590e487: mov rcx, rdx
0x14590e48a: mov edx, 4
0x14590e48f: call 0x145d99653
0x14590e494: ud2
