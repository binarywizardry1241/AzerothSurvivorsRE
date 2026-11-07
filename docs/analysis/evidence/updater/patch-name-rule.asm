; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x14012ab10..0x14012ab5c SHA256 dcb96e831422e18f91993137bb137a0046f12b411abbd0de5ac5aaa4f46c6a56
0x14012ab10: cmp r13, 0xb
0x14012ab14: jne 0x14012ac31
0x14012ab1a: mov eax, dword ptr [rcx]
0x14012ab1c: mov edx, 0x63746170
0x14012ab21: xor eax, edx
0x14012ab23: movzx edx, word ptr [rcx + 4]
0x14012ab27: xor edx, 0x2d68
0x14012ab2d: or edx, eax
0x14012ab2f: jne 0x14012ac31
0x14012ab35: cmp dword ptr [rcx + r13 - 4], 0x71706d2e
0x14012ab3e: jne 0x14012ac31
0x14012ab44: movzx eax, byte ptr [rcx + 6]
0x14012ab48: lea edx, [rax - 0x30]
0x14012ab4b: cmp dl, 0xa
0x14012ab4e: jb 0x14012ab5c
0x14012ab50: and al, 0xdf
0x14012ab52: add al, 0xbf
0x14012ab54: cmp al, 0x19
0x14012ab56: ja 0x14012ac31
