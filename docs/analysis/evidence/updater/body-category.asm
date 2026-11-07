; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x1401c60cb..0x1401c60fb SHA256 b8760acc175fddc30a671be16c16d9610a8181a5a5cae59f19a9b4e95debc915
0x1401c60cb: mov rax, qword ptr [rbp - 0x60]
0x1401c60cf: lea ecx, [rax*8]
0x1401c60d6: movabs rdx, 0x302010000
0x1401c60e0: shr rdx, cl
0x1401c60e3: mov qword ptr [rbp + 0xc8], rdx
0x1401c60ea: mov qword ptr [rbp + 0xc0], rax
0x1401c60f1: test rax, rax
0x1401c60f4: setne byte ptr [rbp + 0x10f]
