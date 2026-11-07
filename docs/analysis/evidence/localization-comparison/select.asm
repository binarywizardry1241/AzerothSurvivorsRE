; 0.108.0 SHA256 dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b
; original PE range 0x1458e59e0..0x1458e5b37 (343 bytes), SHA256 a031624ce604d0a80f30c2c831bd925b4dac21efd331fde506e70bd73c79890d
0x1458e59e0: cmp rdx, 2
0x1458e59e4: jne 0x1458e5a91
0x1458e59ea: cmp word ptr [rcx], 0x6e65
0x1458e59ef: je 0x1458e5a91
0x1458e59f5: cmp word ptr [rcx], 0x6c70
0x1458e59fa: je 0x1458e5a9b
0x1458e5a00: cmp word ptr [rcx], 0x7363
0x1458e5a05: je 0x1458e5aa8
0x1458e5a0b: cmp word ptr [rcx], 0x6564
0x1458e5a10: je 0x1458e5ab5
0x1458e5a16: cmp word ptr [rcx], 0x7470
0x1458e5a1b: je 0x1458e5ac2
0x1458e5a21: cmp word ptr [rcx], 0x7365
0x1458e5a26: je 0x1458e5acf
0x1458e5a2c: cmp word ptr [rcx], 0x7266
0x1458e5a31: je 0x1458e5adc
0x1458e5a37: cmp word ptr [rcx], 0x6f72
0x1458e5a3c: je 0x1458e5ae9
0x1458e5a42: cmp word ptr [rcx], 0x7274
0x1458e5a47: je 0x1458e5af6
0x1458e5a4d: cmp word ptr [rcx], 0x7572
0x1458e5a52: je 0x1458e5b03
0x1458e5a58: cmp word ptr [rcx], 0x6b75
0x1458e5a5d: je 0x1458e5b10
0x1458e5a63: cmp word ptr [rcx], 0x687a
0x1458e5a68: je 0x1458e5b1d
0x1458e5a6e: cmp word ptr [rcx], 0x616a
0x1458e5a73: je 0x1458e5b2a
0x1458e5a79: xor edx, edx
0x1458e5a7b: cmp word ptr [rcx], 0x6f6b
0x1458e5a80: mov eax, 0xd
0x1458e5a85: cmovne rax, rdx
0x1458e5a89: mov qword ptr [rip + 0x276c640], rax
0x1458e5a90: ret
0x1458e5a91: xor eax, eax
0x1458e5a93: mov qword ptr [rip + 0x276c636], rax
0x1458e5a9a: ret
0x1458e5a9b: mov eax, 1
0x1458e5aa0: mov qword ptr [rip + 0x276c629], rax
0x1458e5aa7: ret
0x1458e5aa8: mov eax, 2
0x1458e5aad: mov qword ptr [rip + 0x276c61c], rax
0x1458e5ab4: ret
0x1458e5ab5: mov eax, 3
0x1458e5aba: mov qword ptr [rip + 0x276c60f], rax
0x1458e5ac1: ret
0x1458e5ac2: mov eax, 4
0x1458e5ac7: mov qword ptr [rip + 0x276c602], rax
0x1458e5ace: ret
0x1458e5acf: mov eax, 5
0x1458e5ad4: mov qword ptr [rip + 0x276c5f5], rax
0x1458e5adb: ret
0x1458e5adc: mov eax, 6
0x1458e5ae1: mov qword ptr [rip + 0x276c5e8], rax
0x1458e5ae8: ret
0x1458e5ae9: mov eax, 7
0x1458e5aee: mov qword ptr [rip + 0x276c5db], rax
0x1458e5af5: ret
0x1458e5af6: mov eax, 8
0x1458e5afb: mov qword ptr [rip + 0x276c5ce], rax
0x1458e5b02: ret
0x1458e5b03: mov eax, 9
0x1458e5b08: mov qword ptr [rip + 0x276c5c1], rax
0x1458e5b0f: ret
0x1458e5b10: mov eax, 0xa
0x1458e5b15: mov qword ptr [rip + 0x276c5b4], rax
0x1458e5b1c: ret
0x1458e5b1d: mov eax, 0xb
0x1458e5b22: mov qword ptr [rip + 0x276c5a7], rax
0x1458e5b29: ret
0x1458e5b2a: mov eax, 0xc
0x1458e5b2f: mov qword ptr [rip + 0x276c59a], rax
0x1458e5b36: ret
