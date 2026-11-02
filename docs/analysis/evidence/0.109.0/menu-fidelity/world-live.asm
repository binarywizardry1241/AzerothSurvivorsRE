1409abfc0: push      r15
1409abfc2: push      r14
1409abfc4: push      rsi
1409abfc5: push      rdi
1409abfc6: push      rbx
1409abfc7: sub       rsp, 0x60
1409abfcb: mov       ebx, 1
1409abfd0: lock xadd dword ptr [r8 + 0x5b0], ebx
1409abfd9: cmp       dword ptr [rdx], 1
1409abfdc: jne       0x1409ac0ba
1409abfe2: mov       rsi, rdx
1409abfe5: mov       rax, qword ptr [r8 + 0x5a0]
1409abfec: mov       qword ptr [rsp + 0x40], rax
1409abff1: cmp       qword ptr [rdx + 0x18], rax
1409abff5: jne       0x1409ac0d4
1409abffb: mov       rax, qword ptr [rsi + 8]
1409abfff: mov       rdx, qword ptr [r8 + 0x218]
1409ac006: cmp       rax, rdx
1409ac009: jae       0x1409ac105
1409ac00f: mov       rdi, rcx
1409ac012: mov       r9, qword ptr [r8 + 0x210]
1409ac019: mov       rcx, qword ptr [r9 + rax*8]
1409ac01d: test      rcx, rcx
1409ac020: je        0x1409ac105
1409ac026: mov       rax, qword ptr [r8 + 0x1e0]
1409ac02d: not       rcx
1409ac030: imul      rcx, rcx, 0x38
1409ac034: cmp       byte ptr [rax + rcx + 0x30], 0
1409ac039: je        0x1409ac105
1409ac03f: mov       r10, qword ptr [rsi + 0x10]
1409ac043: cmp       r10, rdx
1409ac046: jae       0x1409ac143
1409ac04c: mov       rdx, qword ptr [r9 + r10*8]
1409ac050: test      rdx, rdx
1409ac053: je        0x1409ac143
1409ac059: not       rdx
1409ac05c: imul      r14, rdx, 0x38
1409ac060: cmp       byte ptr [rax + r14 + 0x30], 0
1409ac066: je        0x1409ac143
1409ac06c: add       rcx, rax
1409ac06f: mov       rcx, qword ptr [rcx + 0x10]
1409ac073: add       r14, rax
1409ac076: mov       r15, qword ptr [r14 + 0x10]
1409ac07a: mov       eax, dword ptr [r8 + 0x5b0]
1409ac081: cmp       byte ptr [rcx], 2
1409ac084: jne       0x1409ac090
1409ac086: mov       al, 1
1409ac088: cmp       byte ptr [r15], 0
1409ac08c: je        0x1409ac09a
1409ac08e: jmp       0x1409ac0a1
1409ac090: call      0x140811780
1409ac095: cmp       al, byte ptr [r15]
1409ac098: je        0x1409ac0a1
1409ac09a: mov       dword ptr [r14 + 0x2c], ebx
1409ac09e: mov       byte ptr [r15], al
1409ac0a1: mov       dword ptr [rsi + 0x20], ebx
1409ac0a4: mov       qword ptr [rdi], 0xfffffffffffffffd
1409ac0ab: mov       rax, rdi
1409ac0ae: add       rsp, 0x60
1409ac0b2: pop       rbx
1409ac0b3: pop       rdi
1409ac0b4: pop       rsi
1409ac0b5: pop       r14
1409ac0b7: pop       r15
1409ac0b9: ret
1409ac0ba: lea       rcx, [rip + 0x5536b6f]
1409ac0c1: lea       r8, [rip + 0x5536bc8]
1409ac0c8: mov       edx, 0x59
1409ac0cd: call      0x145d99570
1409ac0d2: ud2
1409ac0d4: add       rsi, 0x18
1409ac0d8: lea       rax, [rip + 0x5536c39]
1409ac0df: mov       qword ptr [rsp + 0x28], rax
1409ac0e4: mov       qword ptr [rsp + 0x20], 0xdf
1409ac0ed: lea       r9, [rip + 0x5536bb4]
1409ac0f4: lea       r8, [rsp + 0x40]
1409ac0f9: xor       ecx, ecx
1409ac0fb: mov       rdx, rsi
1409ac0fe: call      0x145d4891d
1409ac103: ud2
1409ac105: add       rsi, 0x24
1409ac109: mov       qword ptr [rsp + 0x40], rsi
1409ac10e: lea       rax, [rip + 0x46511eb]
1409ac115: mov       qword ptr [rsp + 0x48], rax
1409ac11a: lea       rcx, [rsp + 0x3f]
1409ac11f: mov       qword ptr [rsp + 0x50], rcx
1409ac124: mov       qword ptr [rsp + 0x58], rax
1409ac129: lea       rcx, [rip + 0x5536595]
1409ac130: lea       r8, [rip + 0x5536631]
1409ac137: lea       rdx, [rsp + 0x40]
1409ac13c: call      0x145d99830
1409ac141: ud2
1409ac143: add       rsi, 0x24
1409ac147: mov       qword ptr [rsp + 0x40], rsi
1409ac14c: lea       rax, [rip + 0x46511ad]
1409ac153: mov       qword ptr [rsp + 0x48], rax
1409ac158: lea       rcx, [rsp + 0x3f]
1409ac15d: mov       qword ptr [rsp + 0x50], rcx
1409ac162: mov       qword ptr [rsp + 0x58], rax
1409ac167: lea       rcx, [rip + 0x5536557]
1409ac16e: lea       r8, [rip + 0x553666b]
1409ac175: lea       rdx, [rsp + 0x40]
1409ac17a: call      0x145d99830
1409ac17f: ud2
