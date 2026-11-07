140c04c60: push      rsi
140c04c61: push      rdi
140c04c62: push      rbx
140c04c63: sub       rsp, 0x20
140c04c67: mov       rax, qword ptr [rdx + 8]
140c04c6b: cmp       qword ptr [rax + 0x10], 0xb
140c04c70: jne       0x140c04e24
140c04c76: mov       rcx, qword ptr [rax + 8]
140c04c7a: movzx     edx, byte ptr [rcx]
140c04c7d: lea       r9d, [rdx - 0x41]
140c04c81: cmp       r9b, 0x1a
140c04c85: setb      r9b
140c04c89: shl       r9b, 5
140c04c8d: or        r9b, dl
140c04c90: cmp       r9b, 0x72
140c04c94: jne       0x140c04e24
140c04c9a: movzx     edx, byte ptr [rcx + 1]
140c04c9e: lea       r9d, [rdx - 0x41]
140c04ca2: cmp       r9b, 0x1a
140c04ca6: setb      r9b
140c04caa: shl       r9b, 5
140c04cae: or        r9b, dl
140c04cb1: cmp       r9b, 0x65
140c04cb5: jne       0x140c04e24
140c04cbb: movzx     edx, byte ptr [rcx + 2]
140c04cbf: lea       r9d, [rdx - 0x41]
140c04cc3: cmp       r9b, 0x1a
140c04cc7: setb      r9b
140c04ccb: shl       r9b, 5
140c04ccf: or        r9b, dl
140c04cd2: cmp       r9b, 0x6e
140c04cd6: jne       0x140c04e24
140c04cdc: movzx     edx, byte ptr [rcx + 3]
140c04ce0: lea       r9d, [rdx - 0x41]
140c04ce4: cmp       r9b, 0x1a
140c04ce8: setb      r9b
140c04cec: shl       r9b, 5
140c04cf0: or        r9b, dl
140c04cf3: cmp       r9b, 0x64
140c04cf7: jne       0x140c04e24
140c04cfd: movzx     edx, byte ptr [rcx + 4]
140c04d01: lea       r9d, [rdx - 0x41]
140c04d05: cmp       r9b, 0x1a
140c04d09: setb      r9b
140c04d0d: shl       r9b, 5
140c04d11: or        r9b, dl
140c04d14: cmp       r9b, 0x65
140c04d18: jne       0x140c04e24
140c04d1e: movzx     edx, byte ptr [rcx + 5]
140c04d22: lea       r9d, [rdx - 0x41]
140c04d26: cmp       r9b, 0x1a
140c04d2a: setb      r9b
140c04d2e: shl       r9b, 5
140c04d32: or        r9b, dl
140c04d35: cmp       r9b, 0x72
140c04d39: jne       0x140c04e24
140c04d3f: movzx     edx, byte ptr [rcx + 6]
140c04d43: lea       r9d, [rdx - 0x41]
140c04d47: cmp       r9b, 0x1a
140c04d4b: setb      r9b
140c04d4f: shl       r9b, 5
140c04d53: or        r9b, dl
140c04d56: cmp       r9b, 0x73
140c04d5a: jne       0x140c04e24
140c04d60: movzx     edx, byte ptr [rcx + 7]
140c04d64: lea       r9d, [rdx - 0x41]
140c04d68: cmp       r9b, 0x1a
140c04d6c: setb      r9b
140c04d70: shl       r9b, 5
140c04d74: or        r9b, dl
140c04d77: cmp       r9b, 0x63
140c04d7b: jne       0x140c04e24
140c04d81: movzx     edx, byte ptr [rcx + 8]
140c04d85: lea       r9d, [rdx - 0x41]
140c04d89: cmp       r9b, 0x1a
140c04d8d: setb      r9b
140c04d91: shl       r9b, 5
140c04d95: or        r9b, dl
140c04d98: cmp       r9b, 0x61
140c04d9c: jne       0x140c04e24
140c04da2: movzx     edx, byte ptr [rcx + 9]
140c04da6: lea       r9d, [rdx - 0x41]
140c04daa: cmp       r9b, 0x1a
140c04dae: setb      r9b
140c04db2: shl       r9b, 5
140c04db6: or        r9b, dl
140c04db9: cmp       r9b, 0x6c
140c04dbd: jne       0x140c04e24
140c04dbf: movzx     ecx, byte ptr [rcx + 0xa]
140c04dc3: lea       edx, [rcx - 0x41]
140c04dc6: cmp       dl, 0x1a
140c04dc9: setb      dl
140c04dcc: shl       dl, 5
140c04dcf: or        dl, cl
140c04dd1: cmp       dl, 0x65
140c04dd4: jne       0x140c04e24
140c04dd6: mov       rsi, qword ptr [r8]
140c04dd9: mov       rdi, qword ptr [r8 + 0x10]
140c04ddd: mov       ebx, dword ptr [r8 + 0x1c]
140c04de1: mov       rcx, qword ptr [rax + 0x38]
140c04de5: mov       rdx, qword ptr [rax + 0x40]
140c04de9: call      0x140089200
140c04dee: mov       rcx, rax
140c04df1: call      0x145bdb8d0
140c04df6: pxor      xmm0, xmm0
140c04dfa: test      al, 1
140c04dfc: jne       0x140c04e06
140c04dfe: shr       rax, 0x20
140c04e02: movd      xmm0, eax
140c04e06: movss     xmm1, dword ptr [rip + 0x51c8076]
140c04e0e: maxss     xmm1, xmm0
140c04e12: movss     xmm0, dword ptr [rip + 0x51986ae]
140c04e1a: minss     xmm0, xmm1
140c04e1e: mov       dword ptr [rdi], ebx
140c04e20: movss     dword ptr [rsi], xmm0
140c04e24: add       rsp, 0x20
140c04e28: pop       rbx
140c04e29: pop       rdi
140c04e2a: pop       rsi
140c04e2b: ret
