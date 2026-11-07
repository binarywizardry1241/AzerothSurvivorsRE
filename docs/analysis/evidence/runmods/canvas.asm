;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x140267da0..0x140268065 SHA256 aa6302892790cb327346c5e350a7e633658334a91b875c37868773a8bb5f06b0
0x140267da0: push rsi
0x140267da1: push rdi
0x140267da2: push rbx
0x140267da3: sub rsp, 0x2f0
0x140267daa: mov rsi, rcx
0x140267dad: mov rbx, qword ptr [rcx]
0x140267db0: mov rax, qword ptr [rcx + 0x28]
0x140267db4: mov qword ptr [rsp + 0x80], rbx
0x140267dbc: lea rdi, [rsp + 0x88]
0x140267dc4: movups xmm0, xmmword ptr [rcx + 8]
0x140267dc8: movups xmmword ptr [rsp + 0x88], xmm0
0x140267dd0: movups xmm0, xmmword ptr [rcx + 0x18]
0x140267dd4: movups xmmword ptr [rsp + 0x98], xmm0
0x140267ddc: mov qword ptr [rsp + 0xa8], rax
0x140267de4: movups xmm0, xmmword ptr [rip + 0x5b83b15]
0x140267deb: movaps xmmword ptr [rsp + 0x20], xmm0
0x140267df0: mov qword ptr [rsp + 0x30], 0
0x140267df9: movups xmm1, xmmword ptr [rip + 0x5b83b18]
0x140267e00: movups xmmword ptr [rsp + 0x38], xmm1
0x140267e05: mov qword ptr [rsp + 0x48], 0
0x140267e0e: movups xmm1, xmmword ptr [rip + 0x5b83b1b]
0x140267e15: movaps xmmword ptr [rsp + 0x50], xmm1
0x140267e1a: mov qword ptr [rsp + 0x60], 0
0x140267e23: movups xmm2, xmmword ptr [rip + 0x5b83b1e]
0x140267e2a: movups xmmword ptr [rsp + 0x68], xmm2
0x140267e2f: mov qword ptr [rsp + 0x78], 0
0x140267e38: movaps xmmword ptr [rsp + 0xb0], xmm0
0x140267e40: mov rax, qword ptr [rsp + 0x30]
0x140267e45: mov qword ptr [rsp + 0xc0], rax
0x140267e4d: mov rax, qword ptr [rsp + 0x38]
0x140267e52: mov qword ptr [rsp + 0xc8], rax
0x140267e5a: mov rax, qword ptr [rsp + 0x40]
0x140267e5f: mov qword ptr [rsp + 0xd0], rax
0x140267e67: mov rax, qword ptr [rsp + 0x48]
0x140267e6c: mov qword ptr [rsp + 0xd8], rax
0x140267e74: movaps xmmword ptr [rsp + 0xe0], xmm1
0x140267e7c: mov rax, qword ptr [rsp + 0x60]
0x140267e81: mov qword ptr [rsp + 0xf0], rax
0x140267e89: mov rax, qword ptr [rsp + 0x68]
0x140267e8e: mov qword ptr [rsp + 0xf8], rax
0x140267e96: movaps xmm0, xmmword ptr [rsp + 0x70]
0x140267e9b: movaps xmmword ptr [rsp + 0x100], xmm0
0x140267ea3: xorps xmm0, xmm0
0x140267ea6: movaps xmmword ptr [rsp + 0x120], xmm0
0x140267eae: movaps xmmword ptr [rsp + 0x110], xmm0
0x140267eb6: mov qword ptr [rsp + 0x130], 0
0x140267ec2: movups xmmword ptr [rsp + 0x1e8], xmm0
0x140267eca: movups xmmword ptr [rsp + 0x1d8], xmm0
0x140267ed2: mov qword ptr [rsp + 0x2b4], 0
0x140267ede: mov word ptr [rsp + 0x2bc], 0
0x140267ee8: lea rcx, [rsp + 0x140]
0x140267ef0: lea rdx, [rsp + 0xb0]
0x140267ef8: mov r8d, 0x88
0x140267efe: call 0x145bfa0e7
0x140267f03: movaps xmm0, xmmword ptr [rip + 0x5b83826]
0x140267f0a: movups xmmword ptr [rsp + 0x1c8], xmm0
0x140267f12: movups xmm0, xmmword ptr [rip + 0x5b83a9f]
0x140267f19: movups xmmword ptr [rsp + 0x1f8], xmm0
0x140267f21: movups xmm0, xmmword ptr [rip + 0x5b83aa0]
0x140267f28: movups xmmword ptr [rsp + 0x208], xmm0
0x140267f30: movups xmm0, xmmword ptr [rip + 0x5b83aa1]
0x140267f37: movups xmmword ptr [rsp + 0x218], xmm0
0x140267f3f: movups xmm0, xmmword ptr [rip + 0x5b83aa2]
0x140267f46: movups xmmword ptr [rsp + 0x228], xmm0
0x140267f4e: movups xmm0, xmmword ptr [rip + 0x5b83aa3]
0x140267f55: movups xmmword ptr [rsp + 0x238], xmm0
0x140267f5d: movups xmm0, xmmword ptr [rip + 0x5b83aa4]
0x140267f64: movups xmmword ptr [rsp + 0x248], xmm0
0x140267f6c: movups xmm0, xmmword ptr [rip + 0x5b83ab5]
0x140267f73: movups xmmword ptr [rsp + 0x268], xmm0
0x140267f7b: movups xmm0, xmmword ptr [rip + 0x5b83a96]
0x140267f82: movups xmmword ptr [rsp + 0x258], xmm0
0x140267f8a: movaps xmm0, xmmword ptr [rip + 0x5b352df]
0x140267f91: movups xmmword ptr [rsp + 0x278], xmm0
0x140267f99: mov dword ptr [rsp + 0x288], 1
0x140267fa4: mov qword ptr [rsp + 0x28c], 0
0x140267fb0: mov byte ptr [rsp + 0x294], 1
0x140267fb8: mov qword ptr [rsp + 0x298], 0
0x140267fc4: mov dword ptr [rsp + 0x2a0], 0x3f800000
0x140267fcf: mov word ptr [rsp + 0x2a4], 0
0x140267fd9: mov dword ptr [rsp + 0x2a6], 0x10000
0x140267fe4: mov word ptr [rsp + 0x2aa], 0
0x140267fee: movabs rax, 0x100000000010000
0x140267ff8: mov qword ptr [rsp + 0x2ac], rax
0x140268000: movsd xmm0, qword ptr [rip + 0x5b83738]
0x140268008: movsd qword ptr [rsp + 0x2c0], xmm0
0x140268011: mov dword ptr [rsp + 0x2c8], 0x3fb33333
0x14026801c: movups xmm0, xmmword ptr [rip + 0x5b83cdd]
0x140268023: movups xmmword ptr [rsp + 0x2cc], xmm0
0x14026802b: movups xmm0, xmmword ptr [rip + 0x5b83cde]
0x140268032: movups xmmword ptr [rsp + 0x2dc], xmm0
0x14026803a: mov qword ptr [rsp + 0x138], rbx
0x140268042: lea rcx, [rsp + 0x20]
0x140268047: lea r8, [rsp + 0x138]
0x14026804f: mov rdx, rdi
0x140268052: call 0x1401f1bb0
0x140268057: mov rax, rsi
0x14026805a: add rsp, 0x2f0
0x140268061: pop rbx
0x140268062: pop rdi
0x140268063: pop rsi
0x140268064: ret
