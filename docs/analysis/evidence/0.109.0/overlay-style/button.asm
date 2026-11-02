140100690: push rbp
140100691: push rsi
140100692: push rdi
140100693: sub rsp, 0xc0
14010069a: lea rbp, [rsp + 0x80]
1401006a2: movaps xmmword ptr [rbp + 0x30], xmm6
1401006a6: mov qword ptr [rbp + 0x28], 0xfffffffffffffffe
1401006ae: mov rsi, rcx
1401006b1: movups xmm0, xmmword ptr [rip + 0x5cd6078]
1401006b8: movaps xmmword ptr [rbp - 0x60], xmm0
1401006bc: mov dword ptr [rbp - 0x50], 0x3f800000
1401006c3: movups xmmword ptr [rbp - 0x4c], xmm0
1401006c7: mov dword ptr [rbp - 0x3c], 0x3f800000
1401006ce: movups xmmword ptr [rbp - 0x38], xmm0
1401006d2: mov dword ptr [rbp - 0x28], 0x3f800000
1401006d9: movups xmmword ptr [rbp - 0x24], xmm0
1401006dd: mov dword ptr [rbp - 0x14], 0x3f800000
1401006e4: call 0x140002200
1401006e9: mov ecx, 0x40
1401006ee: mov edx, 4
1401006f3: call 0x1400021c0
1401006f8: test rax, rax
1401006fb: je 0x140100812
140100701: mov qword ptr [rbp + 0x20], rax
140100705: movaps xmm0, xmmword ptr [rip + 0x5cd44b4]
14010070c: movups xmmword ptr [rbp + 0x10], xmm0
140100710: mov dword ptr [rbp + 0xc], 0
140100717: lea rcx, [rbp - 0x10]
14010071b: lea rdx, [rbp + 0xc]
14010071f: call 0x144c7dcf0
140100724: nop
140100725: movaps xmm6, xmmword ptr [rbp - 0x10]
140100729: movaps xmm0, xmmword ptr [rip + 0x5cd44a0]
140100730: movups xmmword ptr [rbp + 0x10], xmm0
140100734: mov dword ptr [rbp + 0xc], 0
14010073b: lea rcx, [rbp - 0x10]
14010073f: lea rdx, [rbp + 0xc]
140100743: call 0x144c7dcf0
140100748: nop
140100749: movaps xmm0, xmmword ptr [rbp - 0x10]
14010074d: mov rdi, qword ptr [rbp + 0x20]
140100751: mov dword ptr [rdi], 0
140100757: mov dword ptr [rdi + 8], 1
14010075e: movups xmmword ptr [rdi + 0xc], xmm6
140100762: mov qword ptr [rdi + 0x1c], 0x3f000000
14010076a: mov dword ptr [rdi + 0x28], 1
140100771: movups xmmword ptr [rdi + 0x2c], xmm0
140100775: mov dword ptr [rdi + 0x3c], 0x3f000000
14010077c: call 0x140002200
140100781: mov ecx, 0x48
140100786: mov edx, 8
14010078b: call 0x1400021c0
140100790: test rax, rax
140100793: je 0x140100823
140100799: mov qword ptr [rax + 8], 2
1401007a1: mov qword ptr [rax + 0x10], rdi
1401007a5: mov qword ptr [rax + 0x18], 2
1401007ad: mov dword ptr [rax + 0x20], 0x40490fdb
1401007b4: mov byte ptr [rax + 0x24], 0
1401007b8: movabs rcx, 0x8000000000000000
1401007c2: mov qword ptr [rax], rcx
1401007c5: mov qword ptr [rsi + 0x50], 1
1401007cd: mov qword ptr [rsi + 0x58], rax
1401007d1: mov qword ptr [rsi + 0x60], 1
1401007d9: movaps xmm0, xmmword ptr [rbp - 0x60]
1401007dd: movaps xmm1, xmmword ptr [rbp - 0x50]
1401007e1: movaps xmm2, xmmword ptr [rbp - 0x40]
1401007e5: movaps xmm3, xmmword ptr [rbp - 0x30]
1401007e9: movups xmmword ptr [rsi], xmm0
1401007ec: movups xmmword ptr [rsi + 0x10], xmm1
1401007f0: movups xmmword ptr [rsi + 0x20], xmm2
1401007f4: movups xmmword ptr [rsi + 0x30], xmm3
1401007f8: movaps xmm0, xmmword ptr [rbp - 0x20]
1401007fc: movups xmmword ptr [rsi + 0x40], xmm0
140100800: mov rax, rsi
140100803: movaps xmm6, xmmword ptr [rbp + 0x30]
140100807: add rsp, 0xc0
14010080e: pop rdi
14010080f: pop rsi
140100810: pop rbp
140100811: ret
140100812: mov ecx, 4
140100817: mov edx, 0x40
14010081c: call 0x145d992a1
140100821: ud2
140100823: mov ecx, 8
140100828: mov edx, 0x48
14010082d: call 0x145d992a1
140100832: nop
140100833: ud2
