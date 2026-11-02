; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x1458edf70..0x1458edfb7 SHA256 0baf18adff588fad54f8a52f4918f945d6c2f3fe3e95fb343927b4c762fa6133
0x1458edf70: sub rsp, 0x28
0x1458edf74: call 0x1458ec750
0x1458edf79: mov rax, qword ptr [rip + 0x279f150]
0x1458edf80: cmp rax, 0xd
0x1458edf84: mov ecx, 0xd
0x1458edf89: cmovb rcx, rax
0x1458edf8d: imul rax, rcx, 0x38
0x1458edf91: lea rcx, [rip + 0x15e17c0]
0x1458edf98: mov r8, qword ptr [rax + rcx]
0x1458edf9c: lea rcx, [rip + 0x1303b0d]
0x1458edfa3: mov edx, 8
0x1458edfa8: mov r9d, 2
0x1458edfae: add rsp, 0x28
0x1458edfb2: jmp 0x1458eef30
