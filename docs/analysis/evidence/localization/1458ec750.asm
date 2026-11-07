; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x1458ec750..0x1458ec8a7 SHA256 9c47f3492946fac00ee6c6d64ca06de6fbf85594f97f3f067ff9c20c2a98b79f
0x1458ec750: cmp rdx, 2
0x1458ec754: jne 0x1458ec801
0x1458ec75a: cmp word ptr [rcx], 0x6e65
0x1458ec75f: je 0x1458ec801
0x1458ec765: cmp word ptr [rcx], 0x6c70
0x1458ec76a: je 0x1458ec80b
0x1458ec770: cmp word ptr [rcx], 0x7363
0x1458ec775: je 0x1458ec818
0x1458ec77b: cmp word ptr [rcx], 0x6564
0x1458ec780: je 0x1458ec825
0x1458ec786: cmp word ptr [rcx], 0x7470
0x1458ec78b: je 0x1458ec832
0x1458ec791: cmp word ptr [rcx], 0x7365
0x1458ec796: je 0x1458ec83f
0x1458ec79c: cmp word ptr [rcx], 0x7266
0x1458ec7a1: je 0x1458ec84c
0x1458ec7a7: cmp word ptr [rcx], 0x6f72
0x1458ec7ac: je 0x1458ec859
0x1458ec7b2: cmp word ptr [rcx], 0x7274
0x1458ec7b7: je 0x1458ec866
0x1458ec7bd: cmp word ptr [rcx], 0x7572
0x1458ec7c2: je 0x1458ec873
0x1458ec7c8: cmp word ptr [rcx], 0x6b75
0x1458ec7cd: je 0x1458ec880
0x1458ec7d3: cmp word ptr [rcx], 0x687a
0x1458ec7d8: je 0x1458ec88d
0x1458ec7de: cmp word ptr [rcx], 0x616a
0x1458ec7e3: je 0x1458ec89a
0x1458ec7e9: xor edx, edx
0x1458ec7eb: cmp word ptr [rcx], 0x6f6b
0x1458ec7f0: mov eax, 0xd
0x1458ec7f5: cmovne rax, rdx
0x1458ec7f9: mov qword ptr [rip + 0x27a08d0], rax
0x1458ec800: ret
0x1458ec801: xor eax, eax
0x1458ec803: mov qword ptr [rip + 0x27a08c6], rax
0x1458ec80a: ret
0x1458ec80b: mov eax, 1
0x1458ec810: mov qword ptr [rip + 0x27a08b9], rax
0x1458ec817: ret
0x1458ec818: mov eax, 2
0x1458ec81d: mov qword ptr [rip + 0x27a08ac], rax
0x1458ec824: ret
0x1458ec825: mov eax, 3
0x1458ec82a: mov qword ptr [rip + 0x27a089f], rax
0x1458ec831: ret
0x1458ec832: mov eax, 4
0x1458ec837: mov qword ptr [rip + 0x27a0892], rax
0x1458ec83e: ret
0x1458ec83f: mov eax, 5
0x1458ec844: mov qword ptr [rip + 0x27a0885], rax
0x1458ec84b: ret
0x1458ec84c: mov eax, 6
0x1458ec851: mov qword ptr [rip + 0x27a0878], rax
0x1458ec858: ret
0x1458ec859: mov eax, 7
0x1458ec85e: mov qword ptr [rip + 0x27a086b], rax
0x1458ec865: ret
0x1458ec866: mov eax, 8
0x1458ec86b: mov qword ptr [rip + 0x27a085e], rax
0x1458ec872: ret
0x1458ec873: mov eax, 9
0x1458ec878: mov qword ptr [rip + 0x27a0851], rax
0x1458ec87f: ret
0x1458ec880: mov eax, 0xa
0x1458ec885: mov qword ptr [rip + 0x27a0844], rax
0x1458ec88c: ret
0x1458ec88d: mov eax, 0xb
0x1458ec892: mov qword ptr [rip + 0x27a0837], rax
0x1458ec899: ret
0x1458ec89a: mov eax, 0xc
0x1458ec89f: mov qword ptr [rip + 0x27a082a], rax
0x1458ec8a6: ret
