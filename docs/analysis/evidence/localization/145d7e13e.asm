; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x145d7e13e..0x145d7e194 SHA256 ccc8e99eeeac9fd9b32a065c28478a520427df4963abc0d7a05bdee8ba75690b
0x145d7e13e: sub rsp, 0x48
0x145d7e142: mov eax, dword ptr [rip + 0x230c478]
0x145d7e148: test eax, eax
0x145d7e14a: jne 0x145d7e151
0x145d7e14c: add rsp, 0x48
0x145d7e150: ret
0x145d7e151: lea rax, [rip + 0x230c450]
0x145d7e158: lea rcx, [rsp + 0x38]
0x145d7e15d: mov qword ptr [rcx], rax
0x145d7e160: lea rax, [rsp + 0x2f]
0x145d7e165: mov qword ptr [rcx + 8], rax
0x145d7e169: lea r8, [rsp + 0x30]
0x145d7e16e: mov qword ptr [r8], rcx
0x145d7e171: lea rax, [rip + 0xe73088]
0x145d7e178: mov qword ptr [rsp + 0x20], rax
0x145d7e17d: lea rcx, [rip + 0x230c43c]
0x145d7e184: lea r9, [rip + 0xe72ffd]
0x145d7e18b: mov dl, 1
0x145d7e18d: call 0x145d97de0
0x145d7e192: jmp 0x145d7e14c
