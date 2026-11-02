;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x1401bfcc0..0x1401bff1e SHA256 b6c64be79704e2563dc09fad87c92c47042f5a86fbb6f13d247e742adb262a5d
0x1401bfcc0: push r14
0x1401bfcc2: push rsi
0x1401bfcc3: push rdi
0x1401bfcc4: push rbx
0x1401bfcc5: sub rsp, 0x328
0x1401bfccc: mov rsi, r8
0x1401bfccf: mov rdi, rdx
0x1401bfcd2: mov rbx, rcx
0x1401bfcd5: mov rcx, r8
0x1401bfcd8: call 0x14590e4a0
0x1401bfcdd: movss dword ptr [rsp + 0x2c], xmm0
0x1401bfce3: mov rcx, rsi
0x1401bfce6: call 0x14590e3c0
0x1401bfceb: ucomiss xmm0, dword ptr [rip + 0x5c15016]
0x1401bfcf2: setae byte ptr [rsp + 0x2b]
0x1401bfcf7: xorps xmm0, xmm0
0x1401bfcfa: movaps xmmword ptr [rsp + 0xd0], xmm0
0x1401bfd02: movaps xmmword ptr [rsp + 0xc0], xmm0
0x1401bfd0a: movaps xmmword ptr [rsp + 0xb0], xmm0
0x1401bfd12: movaps xmmword ptr [rsp + 0xa0], xmm0
0x1401bfd1a: movaps xmmword ptr [rsp + 0x90], xmm0
0x1401bfd22: mov qword ptr [rsp + 0xe0], 0
0x1401bfd2e: movups xmm0, xmmword ptr [rip + 0x5c2911b]
0x1401bfd35: movups xmmword ptr [rsp + 0xe8], xmm0
0x1401bfd3d: movups xmm0, xmmword ptr [rip + 0x5c2911c]
0x1401bfd44: movups xmmword ptr [rsp + 0xf8], xmm0
0x1401bfd4c: movups xmm0, xmmword ptr [rip + 0x5c2911d]
0x1401bfd53: movups xmmword ptr [rsp + 0x108], xmm0
0x1401bfd5b: movups xmm0, xmmword ptr [rip + 0x5c2911e]
0x1401bfd62: movups xmmword ptr [rsp + 0x118], xmm0
0x1401bfd6a: movups xmm0, xmmword ptr [rip + 0x5c2911f]
0x1401bfd71: movups xmmword ptr [rsp + 0x128], xmm0
0x1401bfd79: movups xmm0, xmmword ptr [rip + 0x5c29120]
0x1401bfd80: movups xmmword ptr [rsp + 0x138], xmm0
0x1401bfd88: movups xmm0, xmmword ptr [rip + 0x5c29131]
0x1401bfd8f: movups xmmword ptr [rsp + 0x158], xmm0
0x1401bfd97: movups xmm0, xmmword ptr [rip + 0x5c29112]
0x1401bfd9e: movups xmmword ptr [rsp + 0x148], xmm0
0x1401bfda6: movups xmm0, xmmword ptr [rip + 0x5c28feb]
0x1401bfdad: movaps xmmword ptr [rsp + 0x30], xmm0
0x1401bfdb2: mov qword ptr [rsp + 0x40], 0
0x1401bfdbb: movups xmm0, xmmword ptr [rip + 0x5c28fee]
0x1401bfdc2: movups xmmword ptr [rsp + 0x48], xmm0
0x1401bfdc7: mov qword ptr [rsp + 0x58], 0
0x1401bfdd0: movups xmm0, xmmword ptr [rip + 0x5c28ff1]
0x1401bfdd7: movaps xmmword ptr [rsp + 0x60], xmm0
0x1401bfddc: mov qword ptr [rsp + 0x70], 0
0x1401bfde5: movups xmm0, xmmword ptr [rip + 0x5c28ff4]
0x1401bfdec: movups xmmword ptr [rsp + 0x78], xmm0
0x1401bfdf1: mov qword ptr [rsp + 0x88], 0
0x1401bfdfd: mov r14, qword ptr [rbx]
0x1401bfe00: add rbx, 8
0x1401bfe04: lea rcx, [rsp + 0x178]
0x1401bfe0c: lea rdx, [rsp + 0x30]
0x1401bfe11: mov r8d, 0x138
0x1401bfe17: call 0x145bfa0e7
0x1401bfe1c: movaps xmm0, xmmword ptr [rip + 0x5bdd44d]
0x1401bfe23: movups xmmword ptr [rsp + 0x2b0], xmm0
0x1401bfe2b: mov dword ptr [rsp + 0x2c0], 1
0x1401bfe36: mov qword ptr [rsp + 0x2c4], 0
0x1401bfe42: mov byte ptr [rsp + 0x2cc], 1
0x1401bfe4a: mov qword ptr [rsp + 0x2d0], 0
0x1401bfe56: mov dword ptr [rsp + 0x2d8], 0x3f800000
0x1401bfe61: mov word ptr [rsp + 0x2dc], 0
0x1401bfe6b: mov dword ptr [rsp + 0x2de], 0x10000
0x1401bfe76: mov word ptr [rsp + 0x2e2], 0
0x1401bfe80: mov dword ptr [rsp + 0x2e4], 0x10000
0x1401bfe8b: mov word ptr [rsp + 0x2e8], 0
0x1401bfe95: mov qword ptr [rsp + 0x2ea], 0
0x1401bfea1: mov dword ptr [rsp + 0x2f2], 0x7000005
0x1401bfeac: mov qword ptr [rsp + 0x170], r14
0x1401bfeb4: lea r9, [rip + 0x5c15575]
0x1401bfebb: lea r14, [rsp + 0x2f8]
0x1401bfec3: lea r8, [rsp + 0x170]
0x1401bfecb: mov rcx, r14
0x1401bfece: mov rdx, rbx
0x1401bfed1: call 0x1401de510
0x1401bfed6: mov qword ptr [rsp + 0x170], rdi
0x1401bfede: lea rax, [rsp + 0x2c]
0x1401bfee3: mov qword ptr [rsp + 0x178], rax
0x1401bfeeb: lea rax, [rsp + 0x2b]
0x1401bfef0: mov qword ptr [rsp + 0x180], rax
0x1401bfef8: mov qword ptr [rsp + 0x188], rsi
0x1401bff00: lea rdx, [rsp + 0x170]
0x1401bff08: mov rcx, r14
0x1401bff0b: call 0x1402678f0
0x1401bff10: nop
0x1401bff11: add rsp, 0x328
0x1401bff18: pop rbx
0x1401bff19: pop rdi
0x1401bff1a: pop rsi
0x1401bff1b: pop r14
0x1401bff1d: ret
