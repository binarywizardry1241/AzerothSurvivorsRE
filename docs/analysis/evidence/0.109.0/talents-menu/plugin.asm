14010aa50: push      rbp
14010aa51: push      rsi
14010aa52: sub       rsp, 0x188
14010aa59: lea       rbp, [rsp + 0x80]
14010aa61: mov       qword ptr [rbp + 0x100], 0xfffffffffffffffe
14010aa6c: mov       rsi, rcx
14010aa6f: call      0x140002200
14010aa74: mov       ecx, 0x150
14010aa79: mov       edx, 8
14010aa7e: call      0x1400021c0
14010aa83: test      rax, rax
14010aa86: je        0x14010ad2c
14010aa8c: mov       qword ptr [rbp + 0xf0], rax
14010aa93: call      0x140002200
14010aa98: mov       ecx, 0x158
14010aa9d: mov       edx, 8
14010aaa2: call      0x1400021c0
14010aaa7: test      rax, rax
14010aaaa: je        0x14010ad3d
14010aab0: mov       dword ptr [rax], 0
14010aab6: mov       byte ptr [rax + 4], 0
14010aaba: mov       qword ptr [rax + 0x100], 0xffffffffffffffff
14010aac5: lea       r8, [rip + 0x5ccc944]
14010aacc: lea       rcx, [rbp - 0x60]
14010aad0: mov       rdx, rax
14010aad3: call      0x144e1fc30
14010aad8: nop
14010aad9: call      0x140002200
14010aade: mov       ecx, 0x160
14010aae3: mov       edx, 8
14010aae8: call      0x1400021c0
14010aaed: test      rax, rax
14010aaf0: je        0x14010ad4f
14010aaf6: mov       dword ptr [rax], 0
14010aafc: mov       byte ptr [rax + 4], 0
14010ab00: mov       qword ptr [rax + 0x100], 0xffffffffffffffff
14010ab0b: lea       r8, [rip + 0x5ccc856]
14010ab12: lea       rcx, [rbp + 0x10]
14010ab16: mov       rdx, rax
14010ab19: call      0x144e1fc30
14010ab1e: nop
14010ab1f: call      0x140002200
14010ab24: mov       ecx, 0x140
14010ab29: mov       edx, 8
14010ab2e: call      0x1400021c0
14010ab33: test      rax, rax
14010ab36: je        0x14010ad61
14010ab3c: mov       dword ptr [rax], 0
14010ab42: mov       byte ptr [rax + 4], 0
14010ab46: mov       qword ptr [rax + 0x100], 0xffffffffffffffff
14010ab51: lea       r8, [rip + 0x5ccc960]
14010ab58: lea       rcx, [rbp + 0x80]
14010ab5f: mov       rdx, rax
14010ab62: call      0x144e1fc30
14010ab67: nop
14010ab68: movups    xmm0, xmmword ptr [rbp]
14010ab6c: mov       rax, qword ptr [rbp + 0xf0]
14010ab73: movups    xmmword ptr [rax + 0x60], xmm0
14010ab77: movups    xmm0, xmmword ptr [rbp - 0x10]
14010ab7b: movups    xmmword ptr [rax + 0x50], xmm0
14010ab7f: movups    xmm0, xmmword ptr [rbp - 0x20]
14010ab83: movups    xmmword ptr [rax + 0x40], xmm0
14010ab87: movups    xmm0, xmmword ptr [rbp - 0x60]
14010ab8b: movups    xmm1, xmmword ptr [rbp - 0x50]
14010ab8f: movups    xmm2, xmmword ptr [rbp - 0x40]
14010ab93: movups    xmm3, xmmword ptr [rbp - 0x30]
14010ab97: movups    xmmword ptr [rax + 0x30], xmm3
14010ab9b: movups    xmmword ptr [rax + 0x20], xmm2
14010ab9f: movups    xmmword ptr [rax + 0x10], xmm1
14010aba3: movups    xmmword ptr [rax], xmm0
14010aba6: movups    xmm0, xmmword ptr [rbp + 0x10]
14010abaa: movups    xmm1, xmmword ptr [rbp + 0x20]
14010abae: movups    xmm2, xmmword ptr [rbp + 0x30]
14010abb2: movups    xmm3, xmmword ptr [rbp + 0x40]
14010abb6: movups    xmmword ptr [rax + 0x70], xmm0
14010abba: movups    xmmword ptr [rax + 0x80], xmm1
14010abc1: movups    xmmword ptr [rax + 0x90], xmm2
14010abc8: movups    xmmword ptr [rax + 0xa0], xmm3
14010abcf: movups    xmm0, xmmword ptr [rbp + 0x50]
14010abd3: movups    xmmword ptr [rax + 0xb0], xmm0
14010abda: movups    xmm0, xmmword ptr [rbp + 0x60]
14010abde: movups    xmmword ptr [rax + 0xc0], xmm0
14010abe5: movups    xmm0, xmmword ptr [rbp + 0x70]
14010abe9: movups    xmmword ptr [rax + 0xd0], xmm0
14010abf0: movups    xmm0, xmmword ptr [rbp + 0x80]
14010abf7: movups    xmm1, xmmword ptr [rbp + 0x90]
14010abfe: movups    xmm2, xmmword ptr [rbp + 0xa0]
14010ac05: movups    xmm3, xmmword ptr [rbp + 0xb0]
14010ac0c: movups    xmmword ptr [rax + 0xe0], xmm0
14010ac13: movups    xmmword ptr [rax + 0xf0], xmm1
14010ac1a: movups    xmmword ptr [rax + 0x100], xmm2
14010ac21: movups    xmmword ptr [rax + 0x110], xmm3
14010ac28: movups    xmm0, xmmword ptr [rbp + 0xc0]
14010ac2f: movups    xmmword ptr [rax + 0x120], xmm0
14010ac36: movups    xmm0, xmmword ptr [rbp + 0xd0]
14010ac3d: movups    xmmword ptr [rax + 0x130], xmm0
14010ac44: movups    xmm0, xmmword ptr [rbp + 0xe0]
14010ac4b: movups    xmmword ptr [rax + 0x140], xmm0
14010ac52: mov       qword ptr [rbp + 0x88], 3
14010ac5d: mov       qword ptr [rbp + 0x90], rax
14010ac64: mov       qword ptr [rbp + 0x98], 3
14010ac6f: mov       qword ptr [rbp + 0xa0], 0
14010ac7a: mov       qword ptr [rbp + 0xa8], 8
14010ac85: xorps     xmm0, xmm0
14010ac88: movups    xmmword ptr [rbp + 0xb0], xmm0
14010ac8f: mov       qword ptr [rbp + 0x80], 0xffffffffffffffff
14010ac9a: mov       rcx, qword ptr [rip + 0x7f789ff]
14010aca1: lea       r8, [rip + 0x5cd2540]
14010aca8: lea       rdx, [rbp + 0xff]
14010acaf: call      0x1400f7360
14010acb4: nop
14010acb5: mov       r8, rdx
14010acb8: lea       rcx, [rbp + 0x80]
14010acbf: mov       rdx, rax
14010acc2: call      0x14013d450
14010acc7: nop
14010acc8: movups    xmm0, xmmword ptr [rbp + 0xe0]
14010accf: movaps    xmmword ptr [rbp + 0x70], xmm0
14010acd3: movups    xmm0, xmmword ptr [rbp + 0xd0]
14010acda: movaps    xmmword ptr [rbp + 0x60], xmm0
14010acde: movups    xmm0, xmmword ptr [rbp + 0xc0]
14010ace5: movaps    xmmword ptr [rbp + 0x50], xmm0
14010ace9: movups    xmm0, xmmword ptr [rbp + 0x80]
14010acf0: movups    xmm1, xmmword ptr [rbp + 0x90]
14010acf7: movups    xmm2, xmmword ptr [rbp + 0xa0]
14010acfe: movups    xmm3, xmmword ptr [rbp + 0xb0]
14010ad05: movaps    xmmword ptr [rbp + 0x40], xmm3
14010ad09: movaps    xmmword ptr [rbp + 0x30], xmm2
14010ad0d: movaps    xmmword ptr [rbp + 0x20], xmm1
14010ad11: movaps    xmmword ptr [rbp + 0x10], xmm0
14010ad15: lea       rdx, [rbp + 0x10]
14010ad19: mov       rcx, rsi
14010ad1c: call      0x1400b4130
14010ad21: nop
14010ad22: add       rsp, 0x188
14010ad29: pop       rsi
14010ad2a: pop       rbp
14010ad2b: ret
14010ad2c: mov       ecx, 8
14010ad31: mov       edx, 0x150
14010ad36: call      0x145d992a1
14010ad3b: ud2
14010ad3d: mov       ecx, 8
14010ad42: mov       edx, 0x158
14010ad47: call      0x145d992a1
14010ad4c: nop
14010ad4d: jmp       0x14010ad71
14010ad4f: mov       ecx, 8
14010ad54: mov       edx, 0x160
14010ad59: call      0x145d992a1
14010ad5e: nop
14010ad5f: jmp       0x14010ad71
14010ad61: mov       ecx, 8
14010ad66: mov       edx, 0x140
14010ad6b: call      0x145d992a1
14010ad70: nop
14010ad71: ud2
