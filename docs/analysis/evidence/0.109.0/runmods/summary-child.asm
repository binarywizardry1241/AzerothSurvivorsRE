;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x1402678f0..0x140267d31 SHA256 0ba7c55cfab2781adb1038c116eb660318ef2b94edb8310230033e62fe266c7b
0x1402678f0: push rbp
0x1402678f1: push r15
0x1402678f3: push r14
0x1402678f5: push r13
0x1402678f7: push r12
0x1402678f9: push rsi
0x1402678fa: push rdi
0x1402678fb: push rbx
0x1402678fc: sub rsp, 0x1a8
0x140267903: lea rbp, [rsp + 0x80]
0x14026790b: movaps xmmword ptr [rbp + 0x110], xmm7
0x140267912: movaps xmmword ptr [rbp + 0x100], xmm6
0x140267919: mov qword ptr [rbp + 0xf8], 0xfffffffffffffffe
0x140267924: mov rbx, rdx
0x140267927: mov rsi, rcx
0x14026792a: mov r12, qword ptr [rcx]
0x14026792d: mov rax, qword ptr [rcx + 0x28]
0x140267931: mov qword ptr [rbp - 0x50], r12
0x140267935: movups xmm0, xmmword ptr [rcx + 8]
0x140267939: movups xmmword ptr [rbp - 0x48], xmm0
0x14026793d: movups xmm0, xmmword ptr [rcx + 0x18]
0x140267941: movups xmmword ptr [rbp - 0x38], xmm0
0x140267945: mov qword ptr [rbp - 0x28], rax
0x140267949: mov r13, qword ptr [rdx]
0x14026794c: lea rcx, [rip + 0x5b881c5]
0x140267953: mov edx, 0x26
0x140267958: call 0x1458ec450
0x14026795d: mov r14, rdx
0x140267960: test rdx, rdx
0x140267963: jns 0x140267975
0x140267965: xor r12d, r12d
0x140267968: mov rcx, r12
0x14026796b: mov rdx, r14
0x14026796e: call 0x145d992bb
0x140267973: ud2
0x140267975: je 0x1402679d8
0x140267977: mov qword ptr [rbp + 0x28], r12
0x14026797b: mov rdi, rax
0x14026797e: call 0x140002200
0x140267983: mov r12d, 1
0x140267989: mov edx, 1
0x14026798e: mov rcx, r14
0x140267991: call 0x1400021c0
0x140267996: test rax, rax
0x140267999: je 0x140267968
0x14026799b: mov r15, rax
0x14026799e: mov rcx, rax
0x1402679a1: mov rdx, rdi
0x1402679a4: mov r8, r14
0x1402679a7: call 0x145bfa0e7
0x1402679ac: mov r12, qword ptr [rbp + 0x28]
0x1402679b0: cmp byte ptr [r13], 1
0x1402679b5: jne 0x1402679e5
0x1402679b7: mov eax, dword ptr [r13 + 1]
0x1402679bb: mov ecx, dword ptr [r13 + 4]
0x1402679bf: mov dword ptr [rbp + 0xf3], ecx
0x1402679c5: mov dword ptr [rbp + 0xf0], eax
0x1402679cb: mov rax, qword ptr [r13 + 8]
0x1402679cf: movzx ecx, byte ptr [r13 + 0x10]
0x1402679d4: mov dl, 1
0x1402679d6: jmp 0x1402679f5
0x1402679d8: mov r15d, 1
0x1402679de: cmp byte ptr [r13], 1
0x1402679e3: je 0x1402679b7
0x1402679e5: mov rax, qword ptr [r13 + 8]
0x1402679e9: lock inc qword ptr [rax]
0x1402679ed: jle 0x140267d2f
0x1402679f3: xor edx, edx
0x1402679f5: lea rdi, [rbp - 0x48]
0x1402679f9: movups xmm0, xmmword ptr [rip + 0x5b843d4]
0x140267a00: movups xmmword ptr [rbp + 0xd1], xmm0
0x140267a07: mov dword ptr [rbp + 0xe1], 0x3f800000
0x140267a11: mov qword ptr [rbp + 0x50], r14
0x140267a15: mov qword ptr [rbp + 0x58], r15
0x140267a19: mov qword ptr [rbp + 0x60], r14
0x140267a1d: mov qword ptr [rbp + 0x68], 0
0x140267a25: mov qword ptr [rbp + 0x70], 4
0x140267a2d: mov qword ptr [rbp + 0x78], 0
0x140267a35: mov byte ptr [rbp + 0x80], dl
0x140267a3b: mov edx, dword ptr [rbp + 0xf0]
0x140267a41: mov r8d, dword ptr [rbp + 0xf3]
0x140267a48: mov dword ptr [rbp + 0x81], edx
0x140267a4e: mov dword ptr [rbp + 0x84], r8d
0x140267a55: mov qword ptr [rbp + 0x88], rax
0x140267a5c: mov qword ptr [rbp + 0x90], rcx
0x140267a63: mov dword ptr [rbp + 0x98], 0x41800000
0x140267a6d: mov word ptr [rbp + 0x9c], 0x190
0x140267a76: mov byte ptr [rbp + 0x9e], 1
0x140267a7d: movups xmm0, xmmword ptr [rbp + 0xd0]
0x140267a84: movups xmmword ptr [rbp + 0x9f], xmm0
0x140267a8b: mov rax, qword ptr [rbp + 0xdd]
0x140267a92: mov qword ptr [rbp + 0xac], rax
0x140267a99: mov r15d, dword ptr [rip + 0x5b6e000]
0x140267aa0: mov dword ptr [rbp + 0xc4], r15d
0x140267aa7: movups xmm6, xmmword ptr [rip + 0x5b6dfe2]
0x140267aae: movups xmmword ptr [rbp + 0xb4], xmm6
0x140267ab5: movsd xmm7, qword ptr [rip + 0x5b359e3]
0x140267abd: movsd qword ptr [rbp + 0xc8], xmm7
0x140267ac5: mov qword ptr [rbp + 0x48], r12
0x140267ac9: lea r14, [rbp - 0x20]
0x140267acd: lea r8, [rbp + 0x48]
0x140267ad1: mov rcx, r14
0x140267ad4: mov rdx, rdi
0x140267ad7: call 0x1401f2bf0
0x140267adc: mov rax, qword ptr [rbx + 8]
0x140267ae0: movss xmm0, dword ptr [rax]
0x140267ae4: ucomiss xmm0, dword ptr [rip + 0x5b357b5]
0x140267aeb: jbe 0x140267af6
0x140267aed: movups xmm0, xmmword ptr [rip + 0x5b83fcc]
0x140267af4: jmp 0x140267afd
0x140267af6: movups xmm0, xmmword ptr [rip + 0x5b83dbf]
0x140267afd: movaps xmmword ptr [rbp + 0x30], xmm0
0x140267b01: mov dword ptr [rbp + 0x40], 0x3f800000
0x140267b08: mov rax, qword ptr [rbx + 0x10]
0x140267b0c: cmp byte ptr [rax], 0
0x140267b0f: je 0x140267bea
0x140267b15: mov rdi, r12
0x140267b18: lea rcx, [rip + 0x5b8801f]
0x140267b1f: mov edx, 0xc
0x140267b24: call 0x1458ec450
0x140267b29: mov r15, rax
0x140267b2c: mov r12, rdx
0x140267b2f: mov rcx, qword ptr [rbx + 0x18]
0x140267b33: call 0x14590e4a0
0x140267b38: movss dword ptr [rbp + 0xd0], xmm0
0x140267b40: lea rax, [rbp + 0xd0]
0x140267b47: mov qword ptr [rbp + 0x48], rax
0x140267b4b: lea rax, [rip + 0x597608e]
0x140267b52: mov qword ptr [rbp + 0x50], rax
0x140267b56: lea rdx, [rip + 0x5b81700]
0x140267b5d: lea r8, [rbp + 0x48]
0x140267b61: mov rcx, r14
0x140267b64: call 0x145bcce30
0x140267b69: lea rax, [rip + 0x5b87fda]
0x140267b70: mov qword ptr [rbp + 0x48], rax
0x140267b74: mov qword ptr [rbp + 0x50], 4
0x140267b7c: mov qword ptr [rbp + 0x58], r14
0x140267b80: lea rax, [rip + 0x5b84269]
0x140267b87: mov qword ptr [rbp + 0x60], rax
0x140267b8b: mov qword ptr [rsp + 0x20], 1
0x140267b94: lea rcx, [rbp + 0xd0]
0x140267b9b: lea r9, [rbp + 0x48]
0x140267b9f: mov rdx, r15
0x140267ba2: mov r8, r12
0x140267ba5: call 0x1458ec8b0
0x140267baa: nop
0x140267bab: mov rdx, qword ptr [rbp - 0x20]
0x140267baf: test rdx, rdx
0x140267bb2: je 0x140267bc3
0x140267bb4: mov rcx, qword ptr [rbp - 0x18]
0x140267bb8: mov r8d, 1
0x140267bbe: call 0x1400021d0
0x140267bc3: mov r12, rdi
0x140267bc6: lea rdi, [rbp - 0x48]
0x140267bca: mov r15d, dword ptr [rip + 0x5b6decf]
0x140267bd1: cmp byte ptr [r13 + 0x18], 1
0x140267bd6: je 0x140267c25
0x140267bd8: mov rax, qword ptr [r13 + 0x20]
0x140267bdc: lock inc qword ptr [rax]
0x140267be0: jle 0x140267d2f
0x140267be6: xor edx, edx
0x140267be8: jmp 0x140267c44
0x140267bea: mov rcx, qword ptr [rbx + 0x18]
0x140267bee: call 0x14590e4a0
0x140267bf3: movss dword ptr [rbp - 0x20], xmm0
0x140267bf8: mov qword ptr [rbp + 0x48], r14
0x140267bfc: lea rax, [rip + 0x5975fdd]
0x140267c03: mov qword ptr [rbp + 0x50], rax
0x140267c07: lea rdx, [rip + 0x5b8164f]
0x140267c0e: lea rcx, [rbp + 0xd0]
0x140267c15: lea r8, [rbp + 0x48]
0x140267c19: call 0x145bcce30
0x140267c1e: cmp byte ptr [r13 + 0x18], 1
0x140267c23: jne 0x140267bd8
0x140267c25: mov eax, dword ptr [r13 + 0x19]
0x140267c29: mov ecx, dword ptr [r13 + 0x1c]
0x140267c2d: mov dword ptr [rbp + 0xeb], ecx
0x140267c33: mov dword ptr [rbp + 0xe8], eax
0x140267c39: mov rax, qword ptr [r13 + 0x20]
0x140267c3d: movzx ecx, byte ptr [r13 + 0x28]
0x140267c42: mov dl, 1
0x140267c44: mov r8, qword ptr [rbp + 0xe0]
0x140267c4b: mov qword ptr [rbp + 0x60], r8
0x140267c4f: movups xmm0, xmmword ptr [rbp + 0xd0]
0x140267c56: movups xmmword ptr [rbp + 0x50], xmm0
0x140267c5a: movaps xmm0, xmmword ptr [rbp + 0x30]
0x140267c5e: movups xmmword ptr [rbp + 0x14], xmm0
0x140267c62: mov r8d, dword ptr [rbp + 0x40]
0x140267c66: mov dword ptr [rbp + 0x24], r8d
0x140267c6a: mov qword ptr [rbp + 0x68], 0
0x140267c72: mov qword ptr [rbp + 0x70], 4
0x140267c7a: mov qword ptr [rbp + 0x78], 0
0x140267c82: mov byte ptr [rbp + 0x80], dl
0x140267c88: mov edx, dword ptr [rbp + 0xe8]
0x140267c8e: mov r8d, dword ptr [rbp + 0xeb]
0x140267c95: mov dword ptr [rbp + 0x81], edx
0x140267c9b: mov dword ptr [rbp + 0x84], r8d
0x140267ca2: mov qword ptr [rbp + 0x88], rax
0x140267ca9: mov qword ptr [rbp + 0x90], rcx
0x140267cb0: mov dword ptr [rbp + 0x98], 0x41d00000
0x140267cba: mov word ptr [rbp + 0x9c], 0x190
0x140267cc3: mov byte ptr [rbp + 0x9e], 1
0x140267cca: mov rax, qword ptr [rbp + 0x20]
0x140267cce: mov qword ptr [rbp + 0xac], rax
0x140267cd5: movups xmm0, xmmword ptr [rbp + 0x13]
0x140267cd9: movups xmmword ptr [rbp + 0x9f], xmm0
0x140267ce0: mov dword ptr [rbp + 0xc4], r15d
0x140267ce7: movups xmmword ptr [rbp + 0xb4], xmm6
0x140267cee: movsd qword ptr [rbp + 0xc8], xmm7
0x140267cf6: mov qword ptr [rbp + 0x48], r12
0x140267cfa: lea rcx, [rbp - 0x20]
0x140267cfe: lea r8, [rbp + 0x48]
0x140267d02: mov rdx, rdi
0x140267d05: call 0x1401f2bf0
0x140267d0a: mov rax, rsi
0x140267d0d: movaps xmm6, xmmword ptr [rbp + 0x100]
0x140267d14: movaps xmm7, xmmword ptr [rbp + 0x110]
0x140267d1b: add rsp, 0x1a8
0x140267d22: pop rbx
0x140267d23: pop rdi
0x140267d24: pop rsi
0x140267d25: pop r12
0x140267d27: pop r13
0x140267d29: pop r14
0x140267d2b: pop r15
0x140267d2d: pop rbp
0x140267d2e: ret
0x140267d2f: ud2
