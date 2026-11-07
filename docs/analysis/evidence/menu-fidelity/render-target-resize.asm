140c03dc0: push      rbp
140c03dc1: push      r15
140c03dc3: push      r14
140c03dc5: push      r13
140c03dc7: push      r12
140c03dc9: push      rsi
140c03dca: push      rdi
140c03dcb: push      rbx
140c03dcc: sub       rsp, 0x2a8
140c03dd3: lea       rbp, [rsp + 0x80]
140c03ddb: movaps    xmmword ptr [rbp + 0x210], xmm7
140c03de2: movaps    xmmword ptr [rbp + 0x200], xmm6
140c03de9: mov       qword ptr [rbp + 0x1f8], 0xfffffffffffffffe
140c03df4: mov       rax, qword ptr [rbp + 0x290]
140c03dfb: mov       r13, qword ptr [rdx]
140c03dfe: mov       r14, qword ptr [rdx + 0x10]
140c03e02: mov       r15d, dword ptr [rdx + 0x1c]
140c03e06: mov       rsi, qword ptr [r8]
140c03e09: mov       r12, qword ptr [r8 + 0x10]
140c03e0d: mov       ecx, dword ptr [r8 + 0x1c]
140c03e11: mov       dword ptr [rbp + 0x1ec], ecx
140c03e17: mov       rbx, qword ptr [rax]
140c03e1a: movups    xmm0, xmmword ptr [r9]
140c03e1e: movaps    xmmword ptr [rbp + 0xa0], xmm0
140c03e25: mov       rax, qword ptr [r9 + 0x10]
140c03e29: mov       qword ptr [rbp + 0xb0], rax
140c03e30: lea       rcx, [rbp - 0x40]
140c03e34: lea       rdi, [rbp + 0xa0]
140c03e3b: mov       rdx, rdi
140c03e3e: call      0x1400bfb90
140c03e43: cmp       byte ptr [rbp - 0x40], 1
140c03e47: je        0x140c042a4
140c03e4d: mov       qword ptr [rbp + 0x1b8], r12
140c03e54: mov       dword ptr [rbp + 0x1f0], r15d
140c03e5b: mov       rcx, qword ptr [rbp - 0x38]
140c03e5f: mov       eax, dword ptr [rcx + 0xc0]
140c03e65: cmp       eax, 1
140c03e68: adc       eax, 0
140c03e6b: mov       qword ptr [rbp + 0x1b0], rcx
140c03e72: mov       ecx, dword ptr [rcx + 0xc4]
140c03e78: cmp       ecx, 1
140c03e7b: adc       ecx, 0
140c03e7e: movss     xmm0, dword ptr [rip + 0x51c8ffe]
140c03e86: mov       qword ptr [rbp + 0x1a8], rbx
140c03e8d: maxss     xmm0, dword ptr [rbx]
140c03e91: movss     xmm1, dword ptr [rip + 0x519962f]
140c03e99: minss     xmm1, xmm0
140c03e9d: xorps     xmm0, xmm0
140c03ea0: cvtsi2ss  xmm0, rax
140c03ea5: movss     xmm2, dword ptr [rip + 0x5339ff3]
140c03ead: movaps    xmm3, xmm2
140c03eb0: divss     xmm3, xmm0
140c03eb4: movaps    xmm4, xmm1
140c03eb7: minss     xmm4, xmm3
140c03ebb: movaps    xmm3, xmm4
140c03ebe: cmpunordss xmm3, xmm4
140c03ec3: movaps    xmm5, xmm3
140c03ec6: andnps    xmm5, xmm4
140c03ec9: xorps     xmm4, xmm4
140c03ecc: cvtsi2ss  xmm4, rcx
140c03ed1: andps     xmm3, xmm1
140c03ed4: orps      xmm3, xmm5
140c03ed7: divss     xmm2, xmm4
140c03edb: movaps    xmm1, xmm3
140c03ede: minss     xmm1, xmm2
140c03ee2: movaps    xmm6, xmm1
140c03ee5: cmpunordss xmm6, xmm1
140c03eea: andps     xmm3, xmm6
140c03eed: andnps    xmm6, xmm1
140c03ef0: orps      xmm6, xmm3
140c03ef3: mulss     xmm0, xmm6
140c03ef7: mulss     xmm6, xmm4
140c03efb: call      0x145bfa10b
140c03f00: movaps    xmm7, xmm0
140c03f03: movaps    xmm0, xmm6
140c03f06: call      0x145bfa10b
140c03f0b: cvttss2si r15, xmm7
140c03f10: xor       eax, eax
140c03f12: xorps     xmm1, xmm1
140c03f15: ucomiss   xmm7, xmm1
140c03f18: cmovb     r15d, eax
140c03f1c: movss     xmm2, dword ptr [rip + 0x51cef1c]
140c03f24: ucomiss   xmm7, xmm2
140c03f27: mov       ecx, 0xffffffff
140c03f2c: cmova     r15d, ecx
140c03f30: cvttss2si r12, xmm0
140c03f35: ucomiss   xmm0, xmm1
140c03f38: cmovb     r12d, eax
140c03f3c: ucomiss   xmm0, xmm2
140c03f3f: cmova     r12d, ecx
140c03f43: cmp       r15d, 1
140c03f47: adc       r15d, 0
140c03f4b: cmp       r12d, 1
140c03f4f: adc       r12d, 0
140c03f53: cmp       r15d, 0x2000
140c03f5a: mov       eax, 0x2000
140c03f5f: cmovae    r15d, eax
140c03f63: cmp       r12d, 0x2000
140c03f6a: cmovae    r12d, eax
140c03f6e: mov       dword ptr [rbp + 0x1c8], r15d
140c03f75: mov       dword ptr [rbp + 0x1cc], r12d
140c03f7c: cmp       r15d, dword ptr [r13 + 0x30]
140c03f80: jne       0x140c03f8c
140c03f82: cmp       r12d, dword ptr [r13 + 0x34]
140c03f86: je        0x140c042a4
140c03f8c: mov       qword ptr [rbp + 0x1a0], r14
140c03f93: mov       eax, dword ptr [rbp + 0x1f0]
140c03f99: mov       dword ptr [r14], eax
140c03f9c: mov       rax, qword ptr [rbp + 0x1b8]
140c03fa3: mov       ecx, dword ptr [rbp + 0x1ec]
140c03fa9: mov       dword ptr [rax], ecx
140c03fab: mov       dword ptr [rbp + 0x1d0], r15d
140c03fb2: mov       dword ptr [rbp + 0x1d4], r12d
140c03fb9: mov       dword ptr [rbp + 0x1d8], 1
140c03fc3: mov       dword ptr [rbp + 0xa0], 0
140c03fcd: mov       qword ptr [rsp + 0x28], rdi
140c03fd2: mov       byte ptr [rsp + 0x30], 2
140c03fd7: mov       qword ptr [rsp + 0x20], 1
140c03fe0: lea       r9, [rip + 0x533c92b]
140c03fe7: lea       rcx, [rbp - 0x40]
140c03feb: lea       rdx, [rbp + 0x1d0]
140c03ff2: mov       r8d, 1
140c03ff8: call      0x1448c6780
140c03ffd: mov       dword ptr [rbp + 0x84], 0x10
140c04007: mov       rcx, qword ptr [rsi + 0x50]
140c0400b: add       rcx, 0x10
140c0400f: mov       byte ptr [rbp + 0x1f7], 1
140c04016: call      0x144962cc0
140c0401b: nop
140c0401c: mov       ebx, eax
140c0401e: mov       r14d, edx
140c04021: lea       rdx, [rbp - 0x40]
140c04025: mov       r8d, 0xe0
140c0402b: mov       rcx, rdi
140c0402e: call      0x145bfa0e7
140c04033: mov       byte ptr [rbp + 0x1f7], 0
140c0403a: mov       qword ptr [rsp + 0x20], rdi
140c0403f: lea       rcx, [rbp + 0x1d0]
140c04046: mov       rdx, rsi
140c04049: mov       r8d, ebx
140c0404c: mov       r9d, r14d
140c0404f: call      0x140a24af0
140c04054: nop
140c04055: cmp       dword ptr [rbp + 0x1d0], 2
140c0405c: jne       0x140c042c6
140c04062: mov       qword ptr [rbp + 0xa0], 0xffffffffffffffff
140c0406d: mov       byte ptr [rbp + 0x1f7], 0
140c04074: mov       qword ptr [rsp + 0x20], rdi
140c04079: mov       qword ptr [rsp + 0x28], 0
140c04082: mov       rcx, rsi
140c04085: mov       edx, ebx
140c04087: mov       r8d, r14d
140c0408a: xor       r9d, r9d
140c0408d: call      0x144975840
140c04092: nop
140c04093: movups    xmm0, xmmword ptr [r13]
140c04098: movaps    xmmword ptr [rbp + 0x1d0], xmm0
140c0409f: mov       rcx, qword ptr [r13 + 0x10]
140c040a3: mov       qword ptr [rbp + 0x1e0], rcx
140c040aa: mov       byte ptr [r13], 0
140c040af: mov       qword ptr [r13 + 8], rax
140c040b3: mov       rax, qword ptr [rbp + 0x1b8]
140c040ba: mov       ecx, dword ptr [rbp + 0x1ec]
140c040c0: mov       dword ptr [rax], ecx
140c040c2: lea       r8, [rbp + 0x1d0]
140c040c9: mov       rcx, rdi
140c040cc: mov       rdx, rsi
140c040cf: call      0x1409feff0
140c040d4: nop
140c040d5: mov       rdx, qword ptr [rbp + 0xa0]
140c040dc: cmp       rdx, -2
140c040e0: mov       rsi, qword ptr [rbp + 0x1a0]
140c040e7: je        0x140c0412a
140c040e9: cmp       rdx, -1
140c040ed: je        0x140c04106
140c040ef: test      rdx, rdx
140c040f2: je        0x140c04106
140c040f4: mov       rcx, qword ptr [rbp + 0xa8]
140c040fb: mov       r8d, 1
140c04101: call      0x1400021d0
140c04106: mov       rdx, qword ptr [rbp + 0xb8]
140c0410d: cmp       rdx, -3
140c04111: ja        0x140c0412a
140c04113: test      rdx, rdx
140c04116: je        0x140c0412a
140c04118: mov       rcx, qword ptr [rbp + 0xc0]
140c0411f: mov       r8d, 1
140c04125: call      0x1400021d0
140c0412a: mov       eax, dword ptr [rbp + 0x1f0]
140c04130: mov       dword ptr [rsi], eax
140c04132: mov       dword ptr [r13 + 0x30], r15d
140c04136: mov       dword ptr [r13 + 0x34], r12d
140c0413a: mov       rax, qword ptr [rip + 0x7478e67]
140c04141: mov       rax, qword ptr [rax]
140c04144: cmp       rax, 2
140c04148: ja        0x140c04282
140c0414e: movzx     edx, byte ptr [rip + 0x7441e9b]
140c04155: movzx     eax, dl
140c04158: lea       ecx, [rax - 1]
140c0415b: cmp       ecx, 2
140c0415e: jae       0x140c0427a
140c04164: mov       rcx, qword ptr [rip + 0x7441e75]
140c0416b: call      0x144c5d8d0
140c04170: nop
140c04171: test      al, al
140c04173: je        0x140c04282
140c04179: lea       rdx, [rbp + 0x1cc]
140c04180: mov       rcx, qword ptr [rip + 0x7441e59]
140c04187: lea       rax, [rcx + 0x30]
140c0418b: mov       r9, qword ptr [rbp + 0x1b0]
140c04192: mov       r8d, dword ptr [r9 + 0xc0]
140c04199: mov       dword ptr [rbp + 0x1c4], r8d
140c041a0: mov       r8d, dword ptr [r9 + 0xc4]
140c041a7: mov       dword ptr [rbp + 0x1c0], r8d
140c041ae: mov       r8, qword ptr [rbp + 0x1a8]
140c041b5: mov       qword ptr [rbp + 0xa0], r8
140c041bc: lea       r8, [rip + 0x4fd9a1d]
140c041c3: mov       qword ptr [rbp + 0xa8], r8
140c041ca: lea       r8, [rbp + 0x1c8]
140c041d1: mov       qword ptr [rbp + 0xb0], r8
140c041d8: lea       r8, [rip + 0x4fda701]
140c041df: mov       qword ptr [rbp + 0xb8], r8
140c041e6: mov       qword ptr [rbp + 0xc0], rdx
140c041ed: mov       qword ptr [rbp + 0xc8], r8
140c041f4: lea       rdx, [rbp + 0x1c4]
140c041fb: mov       qword ptr [rbp + 0xd0], rdx
140c04202: mov       qword ptr [rbp + 0xd8], r8
140c04209: lea       rdx, [rbp + 0x1c0]
140c04210: mov       qword ptr [rbp + 0xe0], rdx
140c04217: mov       qword ptr [rbp + 0xe8], r8
140c0421e: lea       rdx, [rip + 0x533cbd7]
140c04225: mov       qword ptr [rbp + 0x180], rdx
140c0422c: mov       qword ptr [rbp + 0x188], rdi
140c04233: lea       rdx, [rbp + 0x180]
140c0423a: mov       qword ptr [rbp + 0x190], rdx
140c04241: lea       rdx, [rip + 0x533a078]
140c04248: mov       qword ptr [rbp + 0x198], rdx
140c0424f: mov       qword ptr [rbp - 0x40], 1
140c04257: lea       rdx, [rbp + 0x190]
140c0425e: mov       qword ptr [rbp - 0x38], rdx
140c04262: mov       qword ptr [rbp - 0x30], 1
140c0426a: mov       qword ptr [rbp - 0x28], rax
140c0426e: lea       rdx, [rbp - 0x40]
140c04272: call      0x144c5f0f0
140c04277: nop
140c04278: jmp       0x140c04282
140c0427a: test      eax, eax
140c0427c: jne       0x140c04309
140c04282: cmp       byte ptr [rbp + 0x1d0], 0
140c04289: jne       0x140c042a4
140c0428b: mov       rax, qword ptr [rbp + 0x1d8]
140c04292: lock dec  qword ptr [rax]
140c04296: jne       0x140c042a4
140c04298: lea       rcx, [rbp + 0x1d8]
140c0429f: call      0x144985170
140c042a4: movaps    xmm6, xmmword ptr [rbp + 0x200]
140c042ab: movaps    xmm7, xmmword ptr [rbp + 0x210]
140c042b2: add       rsp, 0x2a8
140c042b9: pop       rbx
140c042ba: pop       rdi
140c042bb: pop       rsi
140c042bc: pop       r12
140c042be: pop       r13
140c042c0: pop       r14
140c042c2: pop       r15
140c042c4: pop       rbp
140c042c5: ret
140c042c6: movups    xmm0, xmmword ptr [rbp + 0x1d0]
140c042cd: movaps    xmmword ptr [rbp + 0xa0], xmm0
140c042d4: mov       byte ptr [rbp + 0x1f7], 0
140c042db: lea       rax, [rip + 0x533a8f6]
140c042e2: mov       qword ptr [rsp + 0x20], rax
140c042e7: lea       rcx, [rip + 0x533beb3]
140c042ee: lea       r9, [rip + 0x533bf3b]
140c042f5: lea       r8, [rbp + 0xa0]
140c042fc: mov       edx, 0x2b
140c04301: call      0x145d995d0
140c04306: nop
140c04307: ud2
140c04309: lea       rcx, [rip + 0x7441cd0]
140c04310: call      0x145d45220
140c04315: nop
140c04316: mov       edx, eax
140c04318: test      al, al
140c0431a: jne       0x140c04164
140c04320: jmp       0x140c04282
