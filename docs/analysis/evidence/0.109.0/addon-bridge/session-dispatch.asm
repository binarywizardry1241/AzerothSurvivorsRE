14078a8d0: push      rbp
14078a8d1: push      r15
14078a8d3: push      r14
14078a8d5: push      r13
14078a8d7: push      r12
14078a8d9: push      rsi
14078a8da: push      rdi
14078a8db: push      rbx
14078a8dc: sub       rsp, 0x198
14078a8e3: lea       rbp, [rsp + 0x80]
14078a8eb: mov       qword ptr [rbp + 0x110], 0xfffffffffffffffe
14078a8f6: mov       rax, rdx
14078a8f9: mov       rdx, qword ptr [rdx]
14078a8fc: test      rdx, rdx
14078a8ff: je        0x14078aa14
14078a905: mov       rcx, qword ptr [rbp + 0x198]
14078a90c: mov       r10, qword ptr [rbp + 0x190]
14078a913: mov       r11, qword ptr [rbp + 0x188]
14078a91a: mov       rsi, qword ptr [rbp + 0x180]
14078a921: mov       rdi, qword ptr [r8]
14078a924: mov       qword ptr [rbp + 0xf0], rdi
14078a92b: mov       rdi, qword ptr [r8 + 0x10]
14078a92f: mov       qword ptr [rbp + 0xe0], rdi
14078a936: mov       r8d, dword ptr [r8 + 0x1c]
14078a93a: mov       dword ptr [rbp + 0x10c], r8d
14078a941: mov       r8, qword ptr [r9]
14078a944: mov       qword ptr [rbp + 0xc0], r8
14078a94b: mov       rsi, qword ptr [rsi]
14078a94e: mov       rbx, qword ptr [r11]
14078a951: mov       r8, qword ptr [r11 + 0x10]
14078a955: mov       qword ptr [rbp + 0xb8], r8
14078a95c: mov       r12d, dword ptr [r11 + 0x1c]
14078a960: mov       r8, qword ptr [r10]
14078a963: mov       qword ptr [rbp + 0x28], r8
14078a967: mov       r8, qword ptr [r10 + 0x10]
14078a96b: mov       qword ptr [rbp + 0x30], r8
14078a96f: mov       r8d, dword ptr [r10 + 0x1c]
14078a973: mov       dword ptr [rbp + 0xc8], r8d
14078a97a: mov       r8, qword ptr [rcx]
14078a97d: mov       qword ptr [rbp + 0x38], r8
14078a981: mov       r8, qword ptr [rcx + 0x10]
14078a985: mov       qword ptr [rbp + 0x40], r8
14078a989: mov       ecx, dword ptr [rcx + 0x1c]
14078a98c: mov       dword ptr [rbp + 0xcc], ecx
14078a992: mov       ecx, dword ptr [rax + 0x1c]
14078a995: mov       rax, qword ptr [rax + 0x10]
14078a999: mov       dword ptr [rax], ecx
14078a99b: lea       rcx, [rbp + 0x48]
14078a99f: call      0x145040a20
14078a9a4: mov       rax, qword ptr [rbp + 0x48]
14078a9a8: mov       qword ptr [rbp + 0xd0], rax
14078a9af: mov       rax, qword ptr [rbp + 0x50]
14078a9b3: mov       qword ptr [rbp + 0xd8], rax
14078a9ba: mov       r13, qword ptr [rbp + 0x58]
14078a9be: test      r13, r13
14078a9c1: je        0x14078a9f5
14078a9c3: mov       rax, qword ptr [rbp + 0xf0]
14078a9ca: add       rax, 0x18
14078a9ce: mov       qword ptr [rbp + 0xe8], rax
14078a9d5: xor       edi, edi
14078a9d7: mov       rax, qword ptr [rbp + 0xd8]
14078a9de: movzx     eax, byte ptr [rax + rdi]
14078a9e2: movzx     ecx, al
14078a9e5: lea       rdx, [rip + 0x57344cc]
14078a9ec: movsxd    rcx, dword ptr [rdx + rcx*4]
14078a9f0: add       rcx, rdx
14078a9f3: jmp       rcx
14078a9f5: mov       rdx, qword ptr [rbp + 0xd0]
14078a9fc: test      rdx, rdx
14078a9ff: je        0x14078aa14
14078aa01: mov       r8d, 1
14078aa07: mov       rcx, qword ptr [rbp + 0xd8]
14078aa0e: call      0x1400021d0
14078aa13: nop
14078aa14: add       rsp, 0x198
14078aa1b: pop       rbx
14078aa1c: pop       rdi
14078aa1d: pop       rsi
14078aa1e: pop       r12
14078aa20: pop       r13
14078aa22: pop       r14
14078aa24: pop       r15
14078aa26: pop       rbp
14078aa27: ret
14078aa28: mov       rcx, qword ptr [rbp + 0xf0]
14078aa2f: cmp       byte ptr [rcx + 0x19], 0
14078aa33: jne       0x14078ae6e
14078aa39: cmp       al, 1
14078aa3b: mov       rcx, qword ptr [rbp + 0xe0]
14078aa42: mov       edx, dword ptr [rbp + 0x10c]
14078aa48: mov       dword ptr [rcx], edx
14078aa4a: mov       rcx, qword ptr [rbp + 0xe8]
14078aa51: sete      byte ptr [rcx]
14078aa54: mov       rcx, qword ptr [rbp + 0xc0]
14078aa5b: cmp       qword ptr [rcx], 0
14078aa5f: je        0x14078ab4c
14078aa65: mov       word ptr [rbp + 0x48], 0xa1
14078aa6b: lea       rcx, [rbp - 0x58]
14078aa6f: lea       r8, [rbp + 0x48]
14078aa73: mov       rdx, rsi
14078aa76: call      0x14063af70
14078aa7b: nop
14078aa7c: movzx     r15d, word ptr [rbp - 0x58]
14078aa81: lea       r14, [rbp - 0x58]
14078aa85: mov       rcx, r14
14078aa88: call      0x1406db190
14078aa8d: cmp       r15w, -1
14078aa92: je        0x14078abf8
14078aa98: mov       rax, qword ptr [rbp + 0xe8]
14078aa9f: cmp       byte ptr [rax], 0
14078aaa2: je        0x14078ab54
14078aaa8: mov       rax, qword ptr [rip + 0x78f24f9]
14078aaaf: mov       rax, qword ptr [rax]
14078aab2: cmp       rax, 2
14078aab6: ja        0x14078accc
14078aabc: movzx     edx, byte ptr [rip + 0x78b8b95]
14078aac3: movzx     eax, dl
14078aac6: lea       ecx, [rax - 1]
14078aac9: cmp       ecx, 2
14078aacc: jae       0x14078acc8
14078aad2: mov       rcx, qword ptr [rip + 0x78b8b6f]
14078aad9: call      0x144c5d8d0
14078aade: nop
14078aadf: test      al, al
14078aae1: je        0x14078accc
14078aae7: mov       rcx, qword ptr [rip + 0x78b8b5a]
14078aaee: lea       rax, [rcx + 0x30]
14078aaf2: lea       rdx, [rip + 0x571ec78]
14078aaf9: mov       qword ptr [rbp - 0x58], rdx
14078aafd: mov       qword ptr [rbp - 0x50], 0x5d
14078ab05: lea       rdx, [rbp - 0x58]
14078ab09: mov       qword ptr [rbp + 0xf8], rdx
14078ab10: lea       rdx, [rip + 0x57190c1]
14078ab17: mov       qword ptr [rbp + 0x100], rdx
14078ab1e: mov       qword ptr [rbp + 0x48], 1
14078ab26: lea       rdx, [rbp + 0xf8]
14078ab2d: mov       qword ptr [rbp + 0x50], rdx
14078ab31: mov       qword ptr [rbp + 0x58], 1
14078ab39: mov       qword ptr [rbp + 0x60], rax
14078ab3d: lea       rdx, [rbp + 0x48]
14078ab41: call      0x144c5f0f0
14078ab46: nop
14078ab47: jmp       0x14078accc
14078ab4c: cmp       al, 1
14078ab4e: je        0x14078aaa8
14078ab54: mov       rax, qword ptr [rip + 0x78f244d]
14078ab5b: mov       rax, qword ptr [rax]
14078ab5e: cmp       rax, 3
14078ab62: ja        0x14078acfb
14078ab68: movzx     edx, byte ptr [rip + 0x78b8b49]
14078ab6f: movzx     eax, dl
14078ab72: lea       ecx, [rax - 1]
14078ab75: cmp       ecx, 2
14078ab78: jae       0x14078acf7
14078ab7e: mov       rcx, qword ptr [rip + 0x78b8b23]
14078ab85: call      0x144c5d8d0
14078ab8a: nop
14078ab8b: test      al, al
14078ab8d: je        0x14078acfb
14078ab93: mov       rcx, qword ptr [rip + 0x78b8b0e]
14078ab9a: lea       rax, [rcx + 0x30]
14078ab9e: lea       rdx, [rip + 0x571eba1]
14078aba5: mov       qword ptr [rbp - 0x58], rdx
14078aba9: mov       qword ptr [rbp - 0x50], 0x57
14078abb1: lea       rdx, [rbp - 0x58]
14078abb5: mov       qword ptr [rbp + 0xf8], rdx
14078abbc: lea       rdx, [rip + 0x5719015]
14078abc3: mov       qword ptr [rbp + 0x100], rdx
14078abca: mov       qword ptr [rbp + 0x48], 1
14078abd2: lea       rdx, [rbp + 0xf8]
14078abd9: mov       qword ptr [rbp + 0x50], rdx
14078abdd: mov       qword ptr [rbp + 0x58], 1
14078abe5: mov       qword ptr [rbp + 0x60], rax
14078abe9: lea       rdx, [rbp + 0x48]
14078abed: call      0x144c5f0f0
14078abf2: nop
14078abf3: jmp       0x14078acfb
14078abf8: mov       rax, qword ptr [rbp + 0xe0]
14078abff: mov       ecx, dword ptr [rbp + 0x10c]
14078ac05: mov       dword ptr [rax], ecx
14078ac07: mov       rax, qword ptr [rbp + 0xf0]
14078ac0e: mov       byte ptr [rax + 0x19], 1
14078ac12: mov       rax, qword ptr [rip + 0x78f238f]
14078ac19: mov       rax, qword ptr [rax]
14078ac1c: cmp       rax, 3
14078ac20: jae       0x14078ae6e
14078ac26: movzx     edx, byte ptr [rip + 0x78b8a43]
14078ac2d: movzx     eax, dl
14078ac30: lea       ecx, [rax - 1]
14078ac33: cmp       ecx, 2
14078ac36: jae       0x14078ad19
14078ac3c: mov       rcx, qword ptr [rip + 0x78b8a1d]
14078ac43: call      0x144c5d8d0
14078ac48: nop
14078ac49: test      al, al
14078ac4b: je        0x14078ae6e
14078ac51: mov       rcx, qword ptr [rip + 0x78b8a08]
14078ac58: lea       rax, [rcx + 0x30]
14078ac5c: mov       rdx, qword ptr [rbp + 0xe8]
14078ac63: mov       qword ptr [rbp - 0x58], rdx
14078ac67: lea       rdx, [rip + 0x5454ca2]
14078ac6e: mov       qword ptr [rbp - 0x50], rdx
14078ac72: lea       rdx, [rip + 0x571ea8a]
14078ac79: mov       qword ptr [rbp + 0xf8], rdx
14078ac80: mov       qword ptr [rbp + 0x100], r14
14078ac87: lea       rdx, [rbp + 0xf8]
14078ac8e: mov       qword ptr [rbp + 0x18], rdx
14078ac92: lea       rdx, [rip + 0x5718f3f]
14078ac99: mov       qword ptr [rbp + 0x20], rdx
14078ac9d: mov       qword ptr [rbp + 0x48], 1
14078aca5: lea       rdx, [rbp + 0x18]
14078aca9: mov       qword ptr [rbp + 0x50], rdx
14078acad: mov       qword ptr [rbp + 0x58], 1
14078acb5: mov       qword ptr [rbp + 0x60], rax
14078acb9: lea       rdx, [rbp + 0x48]
14078acbd: call      0x144c5f0f0
14078acc2: nop
14078acc3: jmp       0x14078ae6e
14078acc8: test      eax, eax
14078acca: jne       0x14078ad3d
14078accc: mov       rax, qword ptr [rbp + 0xb8]
14078acd3: mov       dword ptr [rax], r12d
14078acd6: mov       r14, qword ptr [rbx + 0x30]
14078acda: mov       r15, qword ptr [rbx + 0x40]
14078acde: cmp       r14, qword ptr [rbx + 0x20]
14078ace2: jne       0x14078afbb
14078ace8: lea       rcx, [rbx + 0x20]
14078acec: call      0x145bfaef0
14078acf1: nop
14078acf2: jmp       0x14078afbb
14078acf7: test      eax, eax
14078acf9: jne       0x14078ad59
14078acfb: mov       rax, qword ptr [rbp + 0xe0]
14078ad02: mov       ecx, dword ptr [rbp + 0x10c]
14078ad08: mov       dword ptr [rax], ecx
14078ad0a: mov       rax, qword ptr [rbp + 0xe8]
14078ad11: mov       byte ptr [rax], 0
14078ad14: jmp       0x14078ae6e
14078ad19: test      eax, eax
14078ad1b: je        0x14078ae6e
14078ad21: lea       rcx, [rip + 0x78b8938]
14078ad28: call      0x145d45220
14078ad2d: nop
14078ad2e: mov       edx, eax
14078ad30: test      al, al
14078ad32: jne       0x14078ac3c
14078ad38: jmp       0x14078ae6e
14078ad3d: lea       rcx, [rip + 0x78b8904]
14078ad44: call      0x145d45220
14078ad49: nop
14078ad4a: mov       edx, eax
14078ad4c: test      al, al
14078ad4e: jne       0x14078aad2
14078ad54: jmp       0x14078accc
14078ad59: lea       rcx, [rip + 0x78b8948]
14078ad60: call      0x145d45220
14078ad65: nop
14078ad66: mov       edx, eax
14078ad68: test      al, al
14078ad6a: jne       0x14078ab7e
14078ad70: jmp       0x14078acfb
14078ad72: mov       rax, qword ptr [rbp + 0xc0]
14078ad79: cmp       qword ptr [rax], 0
14078ad7d: je        0x14078ae6e
14078ad83: mov       rax, qword ptr [rip + 0x78f221e]
14078ad8a: mov       rax, qword ptr [rax]
14078ad8d: cmp       rax, 2
14078ad91: ja        0x14078ae20
14078ad97: movzx     edx, byte ptr [rip + 0x78b8902]
14078ad9e: movzx     eax, dl
14078ada1: lea       ecx, [rax - 1]
14078ada4: cmp       ecx, 2
14078ada7: jae       0x14078ae1c
14078ada9: mov       rcx, qword ptr [rip + 0x78b88e0]
14078adb0: call      0x144c5d8d0
14078adb5: nop
14078adb6: test      al, al
14078adb8: je        0x14078ae20
14078adba: mov       rcx, qword ptr [rip + 0x78b88cf]
14078adc1: lea       rax, [rcx + 0x30]
14078adc5: lea       rdx, [rip + 0x571e9e5]
14078adcc: mov       qword ptr [rbp - 0x58], rdx
14078add0: mov       qword ptr [rbp - 0x50], 0x1d
14078add8: lea       rdx, [rbp - 0x58]
14078addc: mov       qword ptr [rbp + 0xf8], rdx
14078ade3: lea       rdx, [rip + 0x5718dee]
14078adea: mov       qword ptr [rbp + 0x100], rdx
14078adf1: mov       qword ptr [rbp + 0x48], 1
14078adf9: lea       rdx, [rbp + 0xf8]
14078ae00: mov       qword ptr [rbp + 0x50], rdx
14078ae04: mov       qword ptr [rbp + 0x58], 1
14078ae0c: mov       qword ptr [rbp + 0x60], rax
14078ae10: lea       rdx, [rbp + 0x48]
14078ae14: call      0x144c5f0f0
14078ae19: nop
14078ae1a: jmp       0x14078ae20
14078ae1c: test      eax, eax
14078ae1e: jne       0x14078ae42
14078ae20: mov       word ptr [rbp + 0x48], 0x46
14078ae26: lea       rcx, [rbp - 0x58]
14078ae2a: lea       r8, [rbp + 0x48]
14078ae2e: mov       rdx, rsi
14078ae31: call      0x14063af70
14078ae36: nop
14078ae37: lea       rcx, [rbp - 0x58]
14078ae3b: call      0x1406db190
14078ae40: jmp       0x14078ae6e
14078ae42: lea       rcx, [rip + 0x78b8847]
14078ae49: call      0x145d45220
14078ae4e: nop
14078ae4f: mov       edx, eax
14078ae51: test      al, al
14078ae53: jne       0x14078ada9
14078ae59: jmp       0x14078ae20
14078ae5b: mov       rax, qword ptr [rbp + 0x30]
14078ae5f: mov       ecx, dword ptr [rbp + 0xc8]
14078ae65: mov       dword ptr [rax], ecx
14078ae67: mov       rax, qword ptr [rbp + 0x28]
14078ae6b: mov       byte ptr [rax], 1
14078ae6e: inc       rdi
14078ae71: cmp       r13, rdi
14078ae74: je        0x14078a9f5
14078ae7a: mov       rax, qword ptr [rbp + 0xd8]
14078ae81: movzx     eax, byte ptr [rax + rdi]
14078ae85: movzx     ecx, al
14078ae88: lea       rdx, [rip + 0x5734029]
14078ae8f: movsxd    rcx, dword ptr [rdx + rcx*4]
14078ae93: add       rcx, rdx
14078ae96: jmp       rcx
14078ae98: mov       rax, qword ptr [rbp + 0xf0]
14078ae9f: mov       byte ptr [rax + 0x18], 0
14078aea3: mov       rcx, qword ptr [rbp + 0xe0]
14078aeaa: mov       edx, dword ptr [rbp + 0x10c]
14078aeb0: mov       dword ptr [rcx], edx
14078aeb2: mov       byte ptr [rax + 0x19], 0
14078aeb6: mov       word ptr [rbp + 0x48], 0xa2
14078aebc: lea       rcx, [rbp - 0x58]
14078aec0: lea       r8, [rbp + 0x48]
14078aec4: mov       rdx, rsi
14078aec7: call      0x14063af70
14078aecc: nop
14078aecd: jmp       0x14078ae37
14078aed2: mov       rax, qword ptr [rbp + 0x40]
14078aed6: mov       ecx, dword ptr [rbp + 0xcc]
14078aedc: mov       dword ptr [rax], ecx
14078aede: mov       rcx, qword ptr [rbp + 0x38]
14078aee2: cmp       qword ptr [rcx], -1
14078aee6: je        0x14078aeee
14078aee8: mov       byte ptr [rcx + 0x50], 1
14078aeec: jmp       0x14078ae6e
14078aeee: mov       rdx, rsi
14078aef1: call      0x140821770
14078aef6: nop
14078aef7: jmp       0x14078ae6e
14078aefc: mov       rax, qword ptr [rip + 0x78f20a5]
14078af03: mov       rax, qword ptr [rax]
14078af06: cmp       rax, 2
14078af0a: ja        0x14078af99
14078af10: movzx     edx, byte ptr [rip + 0x78b8771]
14078af17: movzx     eax, dl
14078af1a: lea       ecx, [rax - 1]
14078af1d: cmp       ecx, 2
14078af20: jae       0x14078af95
14078af22: mov       rcx, qword ptr [rip + 0x78b874f]
14078af29: call      0x144c5d8d0
14078af2e: nop
14078af2f: test      al, al
14078af31: je        0x14078af99
14078af33: mov       rcx, qword ptr [rip + 0x78b873e]
14078af3a: lea       rax, [rcx + 0x30]
14078af3e: lea       rdx, [rip + 0x571e85a]
14078af45: mov       qword ptr [rbp - 0x58], rdx
14078af49: mov       qword ptr [rbp - 0x50], 0x25
14078af51: lea       rdx, [rbp - 0x58]
14078af55: mov       qword ptr [rbp + 0xf8], rdx
14078af5c: lea       rdx, [rip + 0x5718c75]
14078af63: mov       qword ptr [rbp + 0x100], rdx
14078af6a: mov       qword ptr [rbp + 0x48], 1
14078af72: lea       rdx, [rbp + 0xf8]
14078af79: mov       qword ptr [rbp + 0x50], rdx
14078af7d: mov       qword ptr [rbp + 0x58], 1
14078af85: mov       qword ptr [rbp + 0x60], rax
14078af89: lea       rdx, [rbp + 0x48]
14078af8d: call      0x144c5f0f0
14078af92: nop
14078af93: jmp       0x14078af99
14078af95: test      eax, eax
14078af97: jne       0x14078afdf
14078af99: mov       rax, qword ptr [rbp + 0xb8]
14078afa0: mov       dword ptr [rax], r12d
14078afa3: mov       r14, qword ptr [rbx + 0x30]
14078afa7: mov       r15, qword ptr [rbx + 0x40]
14078afab: cmp       r14, qword ptr [rbx + 0x20]
14078afaf: jne       0x14078afbb
14078afb1: lea       rcx, [rbx + 0x20]
14078afb5: call      0x145bfaef0
14078afba: nop
14078afbb: mov       rax, qword ptr [rbx + 0x28]
14078afbf: mov       rcx, r14
14078afc2: shl       rcx, 4
14078afc6: mov       qword ptr [rax + rcx], r15
14078afca: mov       byte ptr [rax + rcx + 8], 0
14078afcf: inc       r14
14078afd2: mov       qword ptr [rbx + 0x30], r14
14078afd6: inc       qword ptr [rbx + 0x40]
14078afda: jmp       0x14078ae6e
14078afdf: lea       rcx, [rip + 0x78b8692]
14078afe6: call      0x145d45220
14078afeb: nop
14078afec: mov       edx, eax
14078afee: test      al, al
14078aff0: jne       0x14078af22
14078aff6: jmp       0x14078af99
