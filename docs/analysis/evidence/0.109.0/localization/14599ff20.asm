; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x14599ff20..0x1459a0024 SHA256 5f1c1c12dfe3abb0f2ccea643e4efe4630630b3fd77ea2145bf99d1f0a3aa430
0x14599ff20: push rbp
0x14599ff21: push rsi
0x14599ff22: push rdi
0x14599ff23: sub rsp, 0x90
0x14599ff2a: lea rbp, [rsp + 0x80]
0x14599ff32: mov qword ptr [rbp + 8], 0xfffffffffffffffe
0x14599ff3a: mov qword ptr [rbp - 8], rdx
0x14599ff3e: mov rsi, rcx
0x14599ff41: mov byte ptr [rbp + 7], 1
0x14599ff45: call 0x145ba3770
0x14599ff4a: nop
0x14599ff4b: cmp byte ptr [rax + 0x10], 1
0x14599ff4f: jne 0x14599ffd5
0x14599ff55: mov rcx, qword ptr [rax]
0x14599ff58: mov rdx, qword ptr [rax + 8]
0x14599ff5c: lea r8, [rcx + 1]
0x14599ff60: mov qword ptr [rax], r8
0x14599ff63: movups xmm0, xmmword ptr [rip + 0x188d676]
0x14599ff6a: movaps xmmword ptr [rbp - 0x30], xmm0
0x14599ff6e: movups xmm0, xmmword ptr [rip + 0x188d65b]
0x14599ff75: movaps xmmword ptr [rbp - 0x40], xmm0
0x14599ff79: mov qword ptr [rbp - 0x20], rcx
0x14599ff7d: mov qword ptr [rbp - 0x18], rdx
0x14599ff81: mov rdi, qword ptr [rbp - 8]
0x14599ff85: mov rax, qword ptr [rdi + 0x18]
0x14599ff89: sub rax, qword ptr [rdi + 8]
0x14599ff8d: jne 0x14599fff8
0x14599ff8f: movups xmm0, xmmword ptr [rdi]
0x14599ff92: movups xmm1, xmmword ptr [rdi + 0x10]
0x14599ff96: movaps xmmword ptr [rbp - 0x50], xmm1
0x14599ff9a: movaps xmmword ptr [rbp - 0x60], xmm0
0x14599ff9e: mov byte ptr [rbp + 6], 0
0x14599ffa2: lea rcx, [rbp - 0x60]
0x14599ffa6: lea rdx, [rbp - 0x40]
0x14599ffaa: call 0x1459edc90
0x14599ffaf: nop
0x14599ffb0: movaps xmm0, xmmword ptr [rbp - 0x40]
0x14599ffb4: movaps xmm1, xmmword ptr [rbp - 0x30]
0x14599ffb8: movaps xmm2, xmmword ptr [rbp - 0x20]
0x14599ffbc: movups xmmword ptr [rsi + 0x20], xmm2
0x14599ffc0: movups xmmword ptr [rsi + 0x10], xmm1
0x14599ffc4: movups xmmword ptr [rsi], xmm0
0x14599ffc7: mov rax, rsi
0x14599ffca: add rsp, 0x90
0x14599ffd1: pop rdi
0x14599ffd2: pop rsi
0x14599ffd3: pop rbp
0x14599ffd4: ret
0x14599ffd5: mov byte ptr [rbp + 7], 1
0x14599ffd9: mov rdi, rax
0x14599ffdc: call 0x145bb7390
0x14599ffe1: nop
0x14599ffe2: mov rcx, rax
0x14599ffe5: mov rax, rdi
0x14599ffe8: mov qword ptr [rdi], rcx
0x14599ffeb: mov qword ptr [rdi + 8], rdx
0x14599ffef: mov byte ptr [rdi + 0x10], 1
0x14599fff3: jmp 0x14599ff5c
0x14599fff8: lea r8, [rbp - 0x20]
0x14599fffc: shr rax, 4
0x1459a0000: movabs rdx, 0xaaaaaaaaaaaaaaab
0x1459a000a: imul rdx, rax
0x1459a000e: mov byte ptr [rbp + 6], 1
0x1459a0012: lea rcx, [rbp - 0x40]
0x1459a0016: mov r9b, 1
0x1459a0019: call 0x145d7cd70
0x1459a001e: nop
0x1459a001f: jmp 0x14599ff8f
