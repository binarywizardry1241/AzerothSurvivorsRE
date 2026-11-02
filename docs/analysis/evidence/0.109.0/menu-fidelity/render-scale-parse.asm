145bdb8d0: push      rbp
145bdb8d1: push      r15
145bdb8d3: push      r14
145bdb8d5: push      r13
145bdb8d7: push      r12
145bdb8d9: push      rsi
145bdb8da: push      rdi
145bdb8db: push      rbx
145bdb8dc: sub       rsp, 0x338
145bdb8e3: lea       rbp, [rsp + 0x80]
145bdb8eb: mov       rdi, rcx
145bdb8ee: mov       ecx, 1
145bdb8f3: test      rdx, rdx
145bdb8f6: je        0x145bdb96e
145bdb8f8: mov       r14, rdx
145bdb8fb: movzx     r13d, byte ptr [rdi]
145bdb8ff: cmp       r13d, 0x2d
145bdb903: je        0x145bdb90b
145bdb905: cmp       r13d, 0x2b
145bdb909: jne       0x145bdb917
145bdb90b: dec       r14
145bdb90e: je        0x145bdb9f4
145bdb914: inc       rdi
145bdb917: lea       rcx, [rbp - 0x60]
145bdb91b: mov       rdx, rdi
145bdb91e: mov       r8, r14
145bdb921: call      0x145bd6bf0
145bdb926: movzx     esi, byte ptr [rbp - 0x4f]
145bdb92a: cmp       sil, 2
145bdb92e: jne       0x145bdb975
145bdb930: mov       ecx, 1
145bdb935: cmp       r14, 3
145bdb939: je        0x145bdba24
145bdb93f: cmp       r14, 8
145bdb943: jne       0x145bdba4d
145bdb949: movabs    rax, 0xdfdfdfdfdfdfdfdf
145bdb953: and       rax, qword ptr [rdi]
145bdb956: movabs    rdx, 0x5954494e49464e49
145bdb960: cmp       rax, rdx
145bdb963: jne       0x145bdba66
145bdb969: jmp       0x145bdba4f
145bdb96e: xor       edx, edx
145bdb970: jmp       0x145bdbb42
145bdb975: mov       r15, qword ptr [rbp - 0x60]
145bdb979: mov       r12, qword ptr [rbp - 0x58]
145bdb97d: lea       rax, [r15 - 0x12]
145bdb981: cmp       rax, -0x1c
145bdb985: setb      al
145bdb988: cmp       r12, 0x1000001
145bdb98f: setae     cl
145bdb992: or        cl, sil
145bdb995: or        cl, al
145bdb997: test      cl, 1
145bdb99a: je        0x145bdb9fe
145bdb99c: mov       dword ptr [rbp + 0x2b4], r13d
145bdb9a3: mov       rcx, r15
145bdb9a6: mov       rdx, r12
145bdb9a9: call      0x145bcf0a0
145bdb9ae: mov       r13, rax
145bdb9b1: mov       ebx, edx
145bdb9b3: test      edx, edx
145bdb9b5: setns     al
145bdb9b8: test      sil, al
145bdb9bb: je        0x145bdba70
145bdb9c1: inc       r12
145bdb9c4: mov       rcx, r15
145bdb9c7: mov       rdx, r12
145bdb9ca: call      0x145bcf0a0
145bdb9cf: cmp       r13, rax
145bdb9d2: sete      al
145bdb9d5: cmp       ebx, edx
145bdb9d7: sete      cl
145bdb9da: test      al, cl
145bdb9dc: mov       rsi, rbx
145bdb9df: mov       rax, r13
145bdb9e2: mov       r13d, dword ptr [rbp + 0x2b4]
145bdb9e9: je        0x145bdbab5
145bdb9ef: jmp       0x145bdbaf2
145bdb9f4: mov       edx, 0x100
145bdb9f9: jmp       0x145bdbb42
145bdb9fe: cmp       r15, 0xa
145bdba02: jg        0x145bdba83
145bdba04: cvtsi2ss  xmm0, r12
145bdba09: test      r15, r15
145bdba0c: js        0x145bdbb1c
145bdba12: lea       rax, [rip + 0x169882b]
145bdba19: mulss     xmm0, dword ptr [rax + r15*4]
145bdba1f: jmp       0x145bdbb2e
145bdba24: movzx     edx, byte ptr [rdi]
145bdba27: movzx     eax, word ptr [rdi + 1]
145bdba2b: shl       eax, 8
145bdba2e: or        eax, edx
145bdba30: and       eax, 0xdfdfdf
145bdba35: cmp       eax, 0x464e49
145bdba3a: je        0x145bdba4f
145bdba3c: cmp       eax, 0x4e414e
145bdba41: jne       0x145bdba66
145bdba43: movss     xmm0, dword ptr [rip + 0x1f7385]
145bdba4b: jmp       0x145bdba57
145bdba4d: jmp       0x145bdba66
145bdba4f: movss     xmm0, dword ptr [rip + 0x20f60d]
145bdba57: cmp       r13b, 0x2d
145bdba5b: jne       0x145bdba64
145bdba5d: xorps     xmm0, xmmword ptr [rip + 0x1f163c]
145bdba64: xor       ecx, ecx
145bdba66: mov       edx, 0x100
145bdba6b: jmp       0x145bdbb42
145bdba70: mov       rsi, rbx
145bdba73: mov       rax, r13
145bdba76: mov       r13d, dword ptr [rbp + 0x2b4]
145bdba7d: test      esi, esi
145bdba7f: jns       0x145bdbaf2
145bdba81: jmp       0x145bdbab5
145bdba83: lea       rcx, [rip + 0x169191e]
145bdba8a: mov       rax, r12
145bdba8d: mul       qword ptr [rcx + r15*8 - 0x50]
145bdba92: seto      cl
145bdba95: not       cl
145bdba97: cmp       rax, 0x1000001
145bdba9d: setb      dl
145bdbaa0: test      cl, dl
145bdbaa2: jne       0x145bdbb0d
145bdbaa4: mov       rcx, r15
145bdbaa7: mov       rdx, r12
145bdbaaa: call      0x145bcf0a0
145bdbaaf: mov       esi, edx
145bdbab1: test      esi, esi
145bdbab3: jns       0x145bdbaf2
145bdbab5: lea       rcx, [rbp - 0x60]
145bdbab9: mov       rdx, rdi
145bdbabc: mov       r8, r14
145bdbabf: call      0x145bd67d0
145bdbac4: cmp       qword ptr [rbp - 0x60], 0
145bdbac9: sete      cl
145bdbacc: mov       eax, dword ptr [rbp + 0x2a8]
145bdbad2: cmp       eax, 0xfffffebc
145bdbad7: setl      dl
145bdbada: or        dl, cl
145bdbadc: je        0x145bdbae2
145bdbade: xor       esi, esi
145bdbae0: jmp       0x145bdbaf0
145bdbae2: mov       esi, 0xff
145bdbae7: xor       edi, edi
145bdbae9: cmp       eax, 0x135
145bdbaee: jle       0x145bdbb64
145bdbaf0: xor       eax, eax
145bdbaf2: shl       esi, 0x17
145bdbaf5: or        eax, esi
145bdbaf7: movd      xmm0, eax
145bdbafb: cmp       r13b, 0x2d
145bdbaff: jne       0x145bdbb09
145bdbb01: pxor      xmm0, xmmword ptr [rip + 0x1f1597]
145bdbb09: xor       edx, edx
145bdbb0b: jmp       0x145bdbb40
145bdbb0d: cvtsi2ss  xmm0, rax
145bdbb12: mulss     xmm0, dword ptr [rip + 0x167db1e]
145bdbb1a: jmp       0x145bdbb2e
145bdbb1c: shl       r15, 2
145bdbb20: lea       rax, [rip + 0x169871d]
145bdbb27: sub       rax, r15
145bdbb2a: divss     xmm0, dword ptr [rax]
145bdbb2e: cmp       r13b, 0x2d
145bdbb32: jne       0x145bdbb3b
145bdbb34: xorps     xmm0, xmmword ptr [rip + 0x1f1565]
145bdbb3b: mov       edx, 0x100
145bdbb40: xor       ecx, ecx
145bdbb42: movd      eax, xmm0
145bdbb46: shl       rax, 0x20
145bdbb4a: or        rax, rdx
145bdbb4d: or        rax, rcx
145bdbb50: add       rsp, 0x338
145bdbb57: pop       rbx
145bdbb58: pop       rdi
145bdbb59: pop       rsi
145bdbb5a: pop       r12
145bdbb5c: pop       r13
145bdbb5e: pop       r14
145bdbb60: pop       r15
145bdbb62: pop       rbp
145bdbb63: ret
145bdbb64: lea       r12, [rip + 0x1691c65]
145bdbb6b: test      eax, eax
145bdbb6d: jle       0x145bdbbaa
145bdbb6f: xor       edi, edi
145bdbb71: lea       rbx, [rbp - 0x60]
145bdbb75: mov       r14d, 0x3c
145bdbb7b: cmp       eax, 0x13
145bdbb7e: jae       0x145bdbb87
145bdbb80: mov       eax, eax
145bdbb82: movzx     r14d, byte ptr [rax + r12]
145bdbb87: mov       rcx, rbx
145bdbb8a: mov       rdx, r14
145bdbb8d: call      0x145bd1a00
145bdbb92: mov       eax, dword ptr [rbp + 0x2a8]
145bdbb98: cmp       eax, 0xfffff800
145bdbb9d: jle       0x145bdbade
145bdbba3: add       edi, r14d
145bdbba6: test      eax, eax
145bdbba8: jg        0x145bdbb75
145bdbbaa: lea       r14, [rbp - 0x60]
145bdbbae: test      eax, eax
145bdbbb0: je        0x145bdbbc8
145bdbbb2: neg       eax
145bdbbb4: mov       r15d, 0x3c
145bdbbba: cmp       eax, 0x13
145bdbbbd: jae       0x145bdbbdc
145bdbbbf: mov       eax, eax
145bdbbc1: movzx     r15d, byte ptr [rax + r12]
145bdbbc6: jmp       0x145bdbbdc
145bdbbc8: movzx     eax, byte ptr [rbp - 0x58]
145bdbbcc: cmp       al, 4
145bdbbce: ja        0x145bdbbff
145bdbbd0: cmp       al, 2
145bdbbd2: mov       r15d, 0
145bdbbd8: adc       r15, 1
145bdbbdc: mov       rcx, r14
145bdbbdf: mov       rdx, r15
145bdbbe2: call      0x145bd17a0
145bdbbe7: mov       eax, dword ptr [rbp + 0x2a8]
145bdbbed: cmp       eax, 0x7ff
145bdbbf2: jg        0x145bdbaf0
145bdbbf8: sub       edi, r15d
145bdbbfb: test      eax, eax
145bdbbfd: jle       0x145bdbbae
145bdbbff: dec       edi
145bdbc01: cmp       edi, -0x7f
145bdbc04: jg        0x145bdbc33
145bdbc06: mov       esi, 0x3c
145bdbc0b: lea       rbx, [rbp - 0x60]
145bdbc0f: mov       r14d, edi
145bdbc12: mov       edi, 0xffffff82
145bdbc17: sub       edi, r14d
145bdbc1a: cmp       edi, 0x3c
145bdbc1d: cmovae    edi, esi
145bdbc20: mov       rcx, rbx
145bdbc23: mov       rdx, rdi
145bdbc26: call      0x145bd1a00
145bdbc2b: add       edi, r14d
145bdbc2e: cmp       edi, -0x7e
145bdbc31: jb        0x145bdbc0f
145bdbc33: lea       eax, [rdi + 0x7f]
145bdbc36: cmp       eax, 0xfe
145bdbc3b: jle       0x145bdbc49
145bdbc3d: xor       eax, eax
145bdbc3f: mov       esi, 0xff
145bdbc44: jmp       0x145bdbaf2
145bdbc49: lea       rcx, [rbp - 0x60]
145bdbc4d: mov       edx, 0x18
145bdbc52: call      0x145bd17a0
145bdbc57: mov       rcx, qword ptr [rbp - 0x60]
145bdbc5b: test      rcx, rcx
145bdbc5e: mov       esi, 0xff
145bdbc63: je        0x145bdbc8c
145bdbc65: movsxd    r11, dword ptr [rbp + 0x2a8]
145bdbc6c: test      r11, r11
145bdbc6f: js        0x145bdbc8c
145bdbc71: cmp       r11d, 0x12
145bdbc75: ja        0x145bdbd4c
145bdbc7b: test      r11d, r11d
145bdbc7e: je        0x145bdbc98
145bdbc80: cmp       r11d, 1
145bdbc84: jne       0x145bdbc9c
145bdbc86: xor       eax, eax
145bdbc88: xor       edx, edx
145bdbc8a: jmp       0x145bdbcef
145bdbc8c: add       edi, 0x7e
145bdbc8f: xor       eax, eax
145bdbc91: mov       esi, edi
145bdbc93: jmp       0x145bdbaf2
145bdbc98: xor       eax, eax
145bdbc9a: jmp       0x145bdbd03
145bdbc9c: mov       r8d, r11d
145bdbc9f: and       r8d, 0x1e
145bdbca3: xor       eax, eax
145bdbca5: xor       r9d, r9d
145bdbca8: jmp       0x145bdbcb2
145bdbcaa: inc       r9
145bdbcad: cmp       r9, r8
145bdbcb0: je        0x145bdbce5
145bdbcb2: mov       rdx, r9
145bdbcb5: add       rax, rax
145bdbcb8: lea       r9, [rax + rax*4]
145bdbcbc: cmp       rdx, rcx
145bdbcbf: jae       0x145bdbcca
145bdbcc1: movzx     r10d, byte ptr [rbp + rdx - 0x58]
145bdbcc7: add       r9, r10
145bdbcca: add       r9, r9
145bdbccd: lea       rax, [r9 + r9*4]
145bdbcd1: lea       r9, [rdx + 1]
145bdbcd5: cmp       r9, rcx
145bdbcd8: jae       0x145bdbcaa
145bdbcda: movzx     r10d, byte ptr [rbp + rdx - 0x57]
145bdbce0: add       rax, r10
145bdbce3: jmp       0x145bdbcaa
145bdbce5: test      r11b, 1
145bdbce9: je        0x145bdbd03
145bdbceb: add       rdx, 2
145bdbcef: add       rax, rax
145bdbcf2: lea       rax, [rax + rax*4]
145bdbcf6: cmp       rdx, rcx
145bdbcf9: jae       0x145bdbd03
145bdbcfb: movzx     edx, byte ptr [rbp + rdx - 0x58]
145bdbd00: add       rax, rdx
145bdbd03: cmp       rcx, r11
145bdbd06: jbe       0x145bdbd44
145bdbd08: movzx     edx, byte ptr [rbp + r11 - 0x58]
145bdbd0e: cmp       dl, 5
145bdbd11: sete      r8b
145bdbd15: lea       r9, [r11 + 1]
145bdbd19: cmp       r9, rcx
145bdbd1c: sete      cl
145bdbd1f: test      cl, r8b
145bdbd22: je        0x145bdbd3c
145bdbd24: cmp       byte ptr [rbp + 0x2ac], 0
145bdbd2b: jne       0x145bdbd41
145bdbd2d: test      r11d, r11d
145bdbd30: je        0x145bdbd44
145bdbd32: test      byte ptr [rbp + r11 - 0x59], 1
145bdbd38: jne       0x145bdbd41
145bdbd3a: jmp       0x145bdbd44
145bdbd3c: cmp       dl, 4
145bdbd3f: jbe       0x145bdbd44
145bdbd41: inc       rax
145bdbd44: cmp       rax, 0x1000000
145bdbd4a: jb        0x145bdbd79
145bdbd4c: lea       rbx, [rbp - 0x60]
145bdbd50: mov       edx, 1
145bdbd55: mov       rcx, rbx
145bdbd58: call      0x145bd1a00
145bdbd5d: mov       rcx, rbx
145bdbd60: call      0x145bd1c00
145bdbd65: lea       ecx, [rdi + 0x80]
145bdbd6b: cmp       ecx, 0xfe
145bdbd71: jg        0x145bdbaf0
145bdbd77: inc       edi
145bdbd79: cmp       rax, 0x800000
145bdbd7f: mov       esi, 0x7f
145bdbd84: sbb       esi, 0
145bdbd87: add       esi, edi
145bdbd89: and       eax, 0x7fffff
145bdbd8e: jmp       0x145bdbaf2
