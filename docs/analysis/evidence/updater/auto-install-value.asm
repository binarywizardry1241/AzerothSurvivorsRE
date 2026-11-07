; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x14008f522..0x14008f5b9 SHA256 fc49df54dcf7418f943de79d9c05006b5b742da645ad14cf9389f98396db5842
0x14008f522: lea rdx, [rbp + 0x100]
0x14008f529: mov rcx, rsi
0x14008f52c: call 0x14017ea80
0x14008f531: nop
0x14008f532: mov byte ptr [rbp + 0x1de], bl
0x14008f538: mov byte ptr [rbp + 0x1dd], 0
0x14008f53f: lea rdx, [rip + 0x5d41e97]
0x14008f546: lea rdi, [rbp + 0x100]
0x14008f54d: mov r8d, 0x15
0x14008f553: mov rcx, rdi
0x14008f556: call 0x145bbd970
0x14008f55b: nop
0x14008f55c: mov rdx, qword ptr [rbp + 0x100]
0x14008f563: cmp rdx, -1
0x14008f567: je 0x14008f630
0x14008f56d: cmp rdx, -2
0x14008f571: jne 0x14008f5fd
0x14008f577: cmp qword ptr [rbp + 0x118], 1
0x14008f57f: jne 0x14008f5ef
0x14008f581: mov rcx, qword ptr [rbp + 0x110]
0x14008f588: cmp byte ptr [rcx], 0x31
0x14008f58b: jne 0x14008f5ef
0x14008f58d: mov rdx, qword ptr [rbp + 0x108]
0x14008f594: test rdx, rdx
0x14008f597: je 0x14008f5a4
0x14008f599: mov r8d, 1
0x14008f59f: call 0x1400021d0
0x14008f5a4: mov byte ptr [rbp + 0x1de], bl
0x14008f5aa: mov byte ptr [rbp + 0x1dd], 0
0x14008f5b1: mov rcx, rsi
0x14008f5b4: call 0x140180310
