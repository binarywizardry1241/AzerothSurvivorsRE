14595c73d: 41ffc7 inc r15d
14595c740: f3410f58fe addss xmm7, xmm14
14595c745: 488b8690050000 mov rax, qword ptr [rsi + 0x590]
14595c74c: 4c89f1 mov rcx, r14
14595c74f: 48c1e107 shl rcx, 7
14595c753: 48c7040800000000 mov qword ptr [rax + rcx], 0
14595c75b: c744081000000000 mov dword ptr [rax + rcx + 0x10], 0
14595c763: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14595c76a: 4889540820 mov qword ptr [rax + rcx + 0x20], rdx
14595c76f: 48c744082800000000 mov qword ptr [rax + rcx + 0x28], 0
14595c778: 48ba0000000000002040 movabs rdx, 0x4020000000000000
14595c782: 4889540830 mov qword ptr [rax + rcx + 0x30], rdx
14595c787: 897c083c mov dword ptr [rax + rcx + 0x3c], edi
14595c78b: 440f13540840 movlps qword ptr [rax + rcx + 0x40], xmm10
14595c791: f3440f11640848 movss dword ptr [rax + rcx + 0x48], xmm12
14595c798: c744084c00000000 mov dword ptr [rax + rcx + 0x4c], 0
14595c7a0: f3440f11740850 movss dword ptr [rax + rcx + 0x50], xmm14
14595c7a7: f30f117c0854 movss dword ptr [rax + rcx + 0x54], xmm7
14595c7ad: 48c744085800000000 mov qword ptr [rax + rcx + 0x58], 0
14595c7b6: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
14595c7be: f30f11440860 movss dword ptr [rax + rcx + 0x60], xmm0
14595c7c4: c74408640000807f mov dword ptr [rax + rcx + 0x64], 0x7f800000
14595c7cc: 49ffc6 inc r14
14595c7cf: 0f57c0 xorps xmm0, xmm0
14595c7d2: 0f11440868 movups xmmword ptr [rax + rcx + 0x68], xmm0
14595c7d7: 48c744087700000000 mov qword ptr [rax + rcx + 0x77], 0
14595c7e0: 4c89b698050000 mov qword ptr [rsi + 0x598], r14
