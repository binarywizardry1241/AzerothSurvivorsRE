; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x1401bc69d..0x1401bc6c9 SHA256 09ddf232c0a562bbb06f3500e171cf3e37fdc683793222dcacffe9e3ed9ac348
0x1401bc69d: lea rax, [rip + 0x5c2c93d]
0x1401bc6a4: mov qword ptr [rbp + 0x1e0], rax
0x1401bc6ab: mov qword ptr [rbp + 0x1e8], 7
0x1401bc6b6: mov rax, qword ptr [r8]
0x1401bc6b9: lea rcx, [rip + 0x5c2e300]
0x1401bc6c0: movsxd rax, dword ptr [rcx + rax*4]
0x1401bc6c4: add rax, rcx
0x1401bc6c7: jmp rax
