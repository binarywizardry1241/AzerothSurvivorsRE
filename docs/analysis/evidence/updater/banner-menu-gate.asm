; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x1401c6631..0x1401c6660 SHA256 534fddde02c20bf1c1f28fcec92e75f3182a9a7985e41986e52b6fefb30c794c
0x1401c6631: cmp rdx, -1
0x1401c6635: setne al
0x1401c6638: and al, byte ptr [rdi + 0x10]
0x1401c663b: cmp al, 1
0x1401c663d: mov qword ptr [rbp + 0x5d8], rcx
0x1401c6644: jne 0x1401c6653
0x1401c6646: cmp byte ptr [rsi + 0xd], 1
0x1401c664a: jne 0x1401c6653
0x1401c664c: movzx eax, byte ptr [rsi]
0x1401c664f: xor al, 1
0x1401c6651: jmp 0x1401c6660
0x1401c6653: xor eax, eax
0x1401c6655: jmp 0x1401c6660
0x1401c6657: mov rdx, 0xffffffffffffffff
0x1401c665e: xor eax, eax
