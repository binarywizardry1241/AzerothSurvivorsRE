140c14230: push      rbp
140c14231: push      r15
140c14233: push      r14
140c14235: push      r13
140c14237: push      r12
140c14239: push      rsi
140c1423a: push      rdi
140c1423b: push      rbx
140c1423c: sub       rsp, 0x338
140c14243: lea       rbp, [rsp + 0x80]
140c1424b: movaps    xmmword ptr [rbp + 0x2a0], xmm6
140c14252: mov       qword ptr [rbp + 0x298], 0xfffffffffffffffe
140c1425d: mov       rax, qword ptr [rbp + 0x320]
140c14264: mov       rcx, qword ptr [rdx + 0x20]
140c14268: mov       qword ptr [rbp - 0x30], rcx
140c1426c: movups    xmm0, xmmword ptr [rdx]
140c1426f: movups    xmm1, xmmword ptr [rdx + 0x10]
140c14273: movaps    xmmword ptr [rbp - 0x40], xmm1
140c14277: movaps    xmmword ptr [rbp - 0x50], xmm0
140c1427b: movups    xmm0, xmmword ptr [r8]
140c1427f: movups    xmm1, xmmword ptr [r8 + 0x10]
140c14284: movups    xmmword ptr [rbp - 0x18], xmm1
140c14288: movups    xmmword ptr [rbp - 0x28], xmm0
140c1428c: movups    xmm0, xmmword ptr [r9]
140c14290: movups    xmm1, xmmword ptr [r9 + 0x10]
140c14295: movups    xmmword ptr [rbp + 8], xmm1
140c14299: movups    xmmword ptr [rbp - 8], xmm0
140c1429d: movups    xmm0, xmmword ptr [rax]
140c142a0: movups    xmm1, xmmword ptr [rax + 0x10]
140c142a4: movups    xmmword ptr [rbp + 0x18], xmm0
140c142a8: movups    xmmword ptr [rbp + 0x28], xmm1
140c142ac: mov       r12, qword ptr [rbp - 0x28]
140c142b0: mov       r15, qword ptr [rbp - 8]
140c142b4: mov       r14, qword ptr [rbp + 0x18]
140c142b8: lea       rdx, [rip + 0x5335446]
140c142bf: lea       rcx, [rbp + 0x70]
140c142c3: mov       r8d, 0xe
140c142c9: call      0x145bbd970
140c142ce: mov       rdx, qword ptr [rbp + 0x70]
140c142d2: cmp       rdx, -2
140c142d6: je        0x140c14b13
140c142dc: cmp       rdx, -1
140c142e0: je        0x140c142f6
140c142e2: test      rdx, rdx
140c142e5: je        0x140c142f6
140c142e7: mov       rcx, qword ptr [rbp + 0x78]
140c142eb: mov       r8d, 1
140c142f1: call      0x1400021d0
140c142f6: mov       ebx, 0x40e00000
140c142fb: xor       r13d, r13d
140c142fe: mov       rsi, qword ptr [rbp - 0x40]
140c14302: test      rsi, rsi
140c14305: jne       0x140c1430b
140c14307: mov       rsi, qword ptr [rbp - 0x38]
140c1430b: mov       rax, qword ptr [rsi]
140c1430e: mov       rdi, qword ptr [rsi + 0x10]
140c14312: sub       rax, rdi
140c14315: cmp       rax, 0xf
140c14319: jbe       0x140c14bf7
140c1431f: mov       rax, qword ptr [rsi + 8]
140c14323: lea       rcx, [rip - 0x24018a]
140c1432a: mov       qword ptr [rax + rdi], rcx
140c1432e: mov       dword ptr [rax + rdi + 8], ebx
140c14332: mov       byte ptr [rax + rdi + 0xc], r13b
140c14337: lea       rbx, [rdi + 0x10]
140c1433b: mov       qword ptr [rsi + 0x10], rbx
140c1433f: xorps     xmm6, xmm6
140c14342: movups    xmmword ptr [rbp + 0x8c], xmm6
140c14349: movups    xmmword ptr [rbp + 0x9c], xmm6
140c14350: mov       dword ptr [rbp + 0xac], 0
140c1435a: movups    xmmword ptr [rbp + 0x251], xmm6
140c14361: movups    xmmword ptr [rbp + 0x25d], xmm6
140c14368: mov       rax, qword ptr [rsi]
140c1436b: sub       rax, rbx
140c1436e: cmp       rax, 0x107
140c14374: jbe       0x140c14c1c
140c1437a: mov       rax, qword ptr [rsi + 8]
140c1437e: lea       rcx, [rip - 0x240245]
140c14385: mov       qword ptr [rax + rdi + 0x10], rcx
140c1438a: mov       qword ptr [rax + rdi + 0x18], 0
140c14393: mov       qword ptr [rax + rdi + 0x28], 0
140c1439c: mov       dword ptr [rax + rdi + 0x50], 0
140c143a4: mov       dword ptr [rax + rdi + 0x58], 0
140c143ac: mov       dword ptr [rax + rdi + 0x60], 0
140c143b4: mov       dword ptr [rax + rdi + 0x68], 0
140c143bc: movups    xmm0, xmmword ptr [rbp + 0x70]
140c143c0: movups    xmm1, xmmword ptr [rbp + 0x80]
140c143c7: movups    xmm2, xmmword ptr [rbp + 0x90]
140c143ce: movups    xmm3, xmmword ptr [rbp + 0xa0]
140c143d5: movups    xmmword ptr [rax + rbx + 0x8c], xmm3
140c143dd: movups    xmmword ptr [rax + rbx + 0x7c], xmm2
140c143e2: movups    xmmword ptr [rax + rbx + 0x6c], xmm1
140c143e7: movups    xmmword ptr [rax + rbx + 0x5c], xmm0
140c143ec: movups    xmmword ptr [rax + rbx + 0x9c], xmm6
140c143f4: movups    xmmword ptr [rax + rbx + 0xac], xmm6
140c143fc: movups    xmmword ptr [rax + rbx + 0xbc], xmm6
140c14404: mov       dword ptr [rax + rdi + 0xdc], 0x4001c71c
140c1440f: movups    xmmword ptr [rax + rbx + 0xd0], xmm6
140c14417: mov       qword ptr [rax + rbx + 0xdd], 0
140c14423: movups    xmm0, xmmword ptr [rbp + 0x250]
140c1442a: movups    xmm1, xmmword ptr [rbp + 0x25d]
140c14431: movups    xmmword ptr [rax + rbx + 0xe5], xmm0
140c14439: movups    xmmword ptr [rax + rbx + 0xf2], xmm1
140c14441: add       rdi, 0x118
140c14448: mov       qword ptr [rsi + 0x10], rdi
140c1444c: lea       rdi, [rbp + 0x70]
140c14450: movss     xmm1, dword ptr [rip + 0x5329ad8]
140c14458: movss     xmm2, dword ptr [rip + 0x5329ad4]
140c14460: mov       rcx, rdi
140c14463: call      0x141c88cf0
140c14468: lea       rcx, [rbp - 0x50]
140c1446c: mov       rdx, rdi
140c1446f: call      0x1408e7e80
140c14474: mov       qword ptr [rbp + 0x264], 0
140c1447f: mov       qword ptr [rbp + 0x269], 0
140c1448a: movups    xmmword ptr [rbp + 0x74], xmm6
140c1448e: movups    xmmword ptr [rbp + 0x84], xmm6
140c14495: mov       byte ptr [rbp + 0x94], 0
140c1449c: mov       rax, qword ptr [rsi]
140c1449f: mov       rdi, qword ptr [rsi + 0x10]
140c144a3: sub       rax, rdi
140c144a6: cmp       rax, 0x10b
140c144ac: jbe       0x140c14c41
140c144b2: mov       rax, qword ptr [rsi + 8]
140c144b6: lea       rcx, [rip - 0x2402dd]
140c144bd: mov       qword ptr [rax + rdi], rcx
140c144c1: mov       dword ptr [rax + rdi + 8], 0
140c144c9: mov       dword ptr [rax + rdi + 0x14], 0
140c144d1: mov       dword ptr [rax + rdi + 0x1c], 0
140c144d9: mov       dword ptr [rax + rdi + 0x3c], 0
140c144e1: movups    xmm0, xmmword ptr [rbp + 0x250]
140c144e8: movups    xmm1, xmmword ptr [rbp + 0x260]
140c144ef: movups    xmmword ptr [rax + rdi + 0x40], xmm0
140c144f4: movups    xmmword ptr [rax + rdi + 0x50], xmm1
140c144f9: movzx     ecx, byte ptr [rbp + 0x270]
140c14500: mov       byte ptr [rax + rdi + 0x60], cl
140c14504: mov       byte ptr [rax + rdi + 0x64], 0
140c14509: mov       dword ptr [rax + rdi + 0x68], 0
140c14511: mov       qword ptr [rax + rdi + 0x80], 0
140c1451d: mov       dword ptr [rax + rdi + 0x88], 0
140c14528: mov       byte ptr [rax + rdi + 0x8c], 1
140c14530: mov       dword ptr [rax + rdi + 0x90], 0
140c1453b: mov       qword ptr [rax + rdi + 0xa8], 0
140c14547: mov       dword ptr [rax + rdi + 0xb0], 0
140c14552: mov       byte ptr [rax + rdi + 0xb4], 1
140c1455a: movsd     xmm0, qword ptr [rip + 0x53299de]
140c14562: movsd     qword ptr [rax + rdi + 0xb8], xmm0
140c1456b: mov       byte ptr [rax + rdi + 0xc0], 0
140c14573: mov       dword ptr [rax + rdi + 0xc4], 0
140c1457e: movups    xmm0, xmmword ptr [rbp + 0x70]
140c14582: movups    xmm1, xmmword ptr [rbp + 0x80]
140c14589: movups    xmmword ptr [rax + rdi + 0xc8], xmm0
140c14591: movups    xmmword ptr [rax + rdi + 0xd8], xmm1
140c14599: mov       rcx, qword ptr [rbp + 0x8d]
140c145a0: mov       qword ptr [rax + rdi + 0xe5], rcx
140c145a8: movaps    xmm0, xmmword ptr [rip + 0x53299a1]
140c145af: movups    xmmword ptr [rax + rdi + 0xf0], xmm0
140c145b7: mov       word ptr [rax + rdi + 0x108], 0
140c145c1: mov       qword ptr [rax + rdi + 0x100], 0
140c145cd: mov       byte ptr [rax + rdi + 0x10a], 2
140c145d5: add       rdi, 0x10c
140c145dc: mov       qword ptr [rsi + 0x10], rdi
140c145e0: test      r12, r12
140c145e3: je        0x140c148bd
140c145e9: test      r15, r15
140c145ec: je        0x140c148bd
140c145f2: mov       eax, dword ptr [r14]
140c145f5: mov       bl, 1
140c145f7: cmp       eax, 2
140c145fa: jb        0x140c1460f
140c145fc: mov       bl, 2
140c145fe: cmp       eax, 4
140c14601: jb        0x140c1460f
140c14603: cmp       eax, 8
140c14606: setae     bl
140c14609: shl       bl, 2
140c1460c: add       bl, 4
140c1460f: movaps    xmm0, xmmword ptr [rip + 0x532952a]
140c14616: movaps    xmmword ptr [rbp + 0x220], xmm0
140c1461d: movaps    xmm0, xmmword ptr [rip + 0x532993c]
140c14624: movaps    xmmword ptr [rbp + 0x230], xmm0
140c1462b: mov       dword ptr [rbp + 0x210], 6
140c14635: movsd     xmm0, qword ptr [rip + 0x5329933]
140c1463d: movsd     qword ptr [rbp + 0x260], xmm0
140c14645: mov       dword ptr [rbp + 0x268], 0x460cc7cd
140c1464f: movaps    xmm0, xmmword ptr [rip + 0x5269a5a]
140c14656: movaps    xmmword ptr [rbp + 0x250], xmm0
140c1465d: movabs    rax, 0x3f8000003f800000
140c14667: mov       qword ptr [rbp + 0x26c], rax
140c1466e: mov       dword ptr [rbp + 0x274], 0x3f800000
140c14678: movsd     xmm0, qword ptr [rip + 0x5329900]
140c14680: movsd     qword ptr [rbp + 0x70], xmm0
140c14685: mov       dword ptr [rbp + 0x78], 0xc2700000
140c1468c: lea       r8, [rip + 0x5329c8d]
140c14693: lea       rcx, [rbp + 0x250]
140c1469a: lea       rdx, [rbp + 0x70]
140c1469e: call      0x1407e6e70
140c146a3: nop
140c146a4: movaps    xmm0, xmmword ptr [rbp + 0x250]
140c146ab: movaps    xmm1, xmmword ptr [rbp + 0x260]
140c146b2: movaps    xmm2, xmmword ptr [rbp + 0x270]
140c146b9: movaps    xmmword ptr [rbp + 0x1b0], xmm0
140c146c0: movaps    xmmword ptr [rbp + 0x1c0], xmm1
140c146c7: movaps    xmmword ptr [rbp + 0x1d0], xmm2
140c146ce: mov       qword ptr [rbp + 0x1e0], 0
140c146d9: mov       qword ptr [rbp + 0x1e8], 1
140c146e4: mov       dword ptr [rbp + 0x1f0], 0x10
140c146ee: mov       byte ptr [rbp + 0x1f4], 1
140c146f5: mov       byte ptr [rbp + 0x200], bl
140c146fb: movaps    xmm0, xmmword ptr [rbp + 0x210]
140c14702: movaps    xmm1, xmmword ptr [rbp + 0x220]
140c14709: movaps    xmm2, xmmword ptr [rbp + 0x230]
140c14710: movaps    xmmword ptr [rbp + 0x180], xmm0
140c14717: movaps    xmmword ptr [rbp + 0x190], xmm1
140c1471e: movaps    xmmword ptr [rbp + 0x1a0], xmm2
140c14725: mov       byte ptr [rbp + 0x201], 0
140c1472c: mov       dword ptr [rbp + 0x1f8], 0x3f800000
140c14736: mov       byte ptr [rbp + 0x1fc], 0
140c1473d: mov       dword ptr [rbp + 0x70], 0
140c14744: movaps    xmm0, xmmword ptr [rip + 0x53333b5]
140c1474b: movaps    xmmword ptr [rbp + 0xb0], xmm0
140c14752: movaps    xmm0, xmmword ptr [rip + 0x5333397]
140c14759: movaps    xmmword ptr [rbp + 0xa0], xmm0
140c14760: movaps    xmm0, xmmword ptr [rip + 0x5333379]
140c14767: movaps    xmmword ptr [rbp + 0x90], xmm0
140c1476e: movaps    xmm0, xmmword ptr [rip + 0x533335b]
140c14775: movaps    xmmword ptr [rbp + 0x80], xmm0
140c1477c: mov       dword ptr [rbp + 0xc0], 0
140c14786: mov       dword ptr [rbp + 0xcc], 0
140c14790: mov       qword ptr [rbp + 0xf0], 0
140c1479b: mov       dword ptr [rbp + 0xf8], 0
140c147a5: mov       dword ptr [rbp + 0x114], 0
140c147af: movabs    rax, 0xafffffffe
140c147b9: mov       qword ptr [rbp + 0x158], rax
140c147c0: mov       word ptr [rbp + 0x170], 1
140c147c9: mov       byte ptr [rbp + 0x172], 1
140c147d0: movsd     xmm0, qword ptr [rip + 0x51cdda8]
140c147d8: movsd     qword ptr [rbp + 0x204], xmm0
140c147e0: mov       dword ptr [rbp + 0x20c], 0x42c80000
140c147ea: lea       r9, [rip + 0x5334f4f]
140c147f1: lea       rcx, [rbp + 0x40]
140c147f5: lea       rdx, [rbp - 0x50]
140c147f9: lea       r8, [rbp + 0x70]
140c147fd: call      0x1408f09d0
140c14802: lea       rdx, [rip + 0x5334f4f]
140c14809: lea       rcx, [rbp + 0x70]
140c1480d: mov       r8d, 0xf
140c14813: call      0x145bb9990
140c14818: mov       rdx, qword ptr [rbp + 0x70]
140c1481c: cmp       rdx, -1
140c14820: je        0x140c1487c
140c14822: test      rdx, rdx
140c14825: je        0x140c14836
140c14827: mov       rcx, qword ptr [rbp + 0x78]
140c1482b: mov       r8d, 1
140c14831: call      0x1400021d0
140c14836: mov       rsi, qword ptr [rbp + 0x58]
140c1483a: test      rsi, rsi
140c1483d: jne       0x140c14843
140c1483f: mov       rsi, qword ptr [rbp + 0x60]
140c14843: mov       rbx, qword ptr [rbp + 0x40]
140c14847: mov       rax, qword ptr [rsi]
140c1484a: mov       rdi, qword ptr [rsi + 0x10]
140c1484e: sub       rax, rdi
140c14851: cmp       rax, 0x17
140c14855: jbe       0x140c14c91
140c1485b: mov       rax, qword ptr [rsi + 8]
140c1485f: lea       rcx, [rip - 0x22b936]
140c14866: mov       qword ptr [rax + rdi], rcx
140c1486a: mov       qword ptr [rax + rdi + 8], rbx
140c1486f: mov       byte ptr [rax + rdi + 0x10], 0
140c14874: add       rdi, 0x18
140c14878: mov       qword ptr [rsi + 0x10], rdi
140c1487c: lea       rdx, [rip + 0x5334ee4]
140c14883: lea       rcx, [rbp + 0x70]
140c14887: mov       r8d, 0xc
140c1488d: call      0x145bb9990
140c14892: mov       rdx, qword ptr [rbp + 0x70]
140c14896: cmp       rdx, -1
140c1489a: je        0x140c14b8e
140c148a0: test      rdx, rdx
140c148a3: je        0x140c14bdc
140c148a9: mov       rcx, qword ptr [rbp + 0x78]
140c148ad: mov       r8d, 1
140c148b3: call      0x1400021d0
140c148b8: jmp       0x140c14bdc
140c148bd: mov       eax, dword ptr [r14]
140c148c0: mov       bl, 1
140c148c2: cmp       eax, 2
140c148c5: jb        0x140c148da
140c148c7: mov       bl, 2
140c148c9: cmp       eax, 4
140c148cc: jb        0x140c148da
140c148ce: cmp       eax, 8
140c148d1: setae     bl
140c148d4: shl       bl, 2
140c148d7: add       bl, 4
140c148da: movsd     xmm0, qword ptr [rip + 0x53296ae]
140c148e2: movsd     qword ptr [rbp + 0x220], xmm0
140c148ea: mov       dword ptr [rbp + 0x228], 0x42c80000
140c148f4: movabs    rax, 0x3f8000003f800000
140c148fe: mov       qword ptr [rbp + 0x22c], rax
140c14905: mov       dword ptr [rbp + 0x234], 0x3f800000
140c1490f: movsd     xmm0, qword ptr [rip + 0x5329689]
140c14917: movsd     qword ptr [rbp + 0x70], xmm0
140c1491c: mov       dword ptr [rbp + 0x78], 0xc2c80000
140c14923: lea       r8, [rip + 0x53299f6]
140c1492a: lea       rcx, [rbp + 0x210]
140c14931: lea       rdx, [rbp + 0x70]
140c14935: call      0x1407e6e70
140c1493a: movaps    xmm0, xmmword ptr [rip + 0x533318f]
140c14941: movups    xmmword ptr [rbp + 0x7c], xmm0
140c14945: movaps    xmm0, xmmword ptr [rip + 0x5333194]
140c1494c: movups    xmmword ptr [rbp + 0x8c], xmm0
140c14953: movaps    xmm0, xmmword ptr [rip + 0x5333196]
140c1495a: movups    xmmword ptr [rbp + 0x9c], xmm0
140c14961: movaps    xmm0, xmmword ptr [rip + 0x5333198]
140c14968: movups    xmmword ptr [rbp + 0xac], xmm0
140c1496f: movaps    xmm0, xmmword ptr [rbp + 0x210]
140c14976: movaps    xmm1, xmmword ptr [rbp + 0x220]
140c1497d: movaps    xmm2, xmmword ptr [rbp + 0x230]
140c14984: movups    xmmword ptr [rbp + 0x25d], xmm0
140c1498b: movups    xmmword ptr [rbp + 0x26d], xmm1
140c14992: movups    xmmword ptr [rbp + 0x27d], xmm2
140c14999: mov       rcx, qword ptr [rbp - 0x48]
140c1499d: call      0x144e1e910
140c149a2: mov       rcx, qword ptr [rsi]
140c149a5: mov       rdi, qword ptr [rsi + 0x10]
140c149a9: sub       rcx, rdi
140c149ac: cmp       rcx, 0x187
140c149b3: jbe       0x140c14c66
140c149b9: mov       rcx, qword ptr [rsi + 8]
140c149bd: lea       rdx, [rip - 0x237ec4]
140c149c4: mov       qword ptr [rcx + rdi], rdx
140c149c8: mov       dword ptr [rcx + rdi + 8], 0
140c149d0: movups    xmm0, xmmword ptr [rbp + 0x70]
140c149d4: movups    xmm1, xmmword ptr [rbp + 0x80]
140c149db: movups    xmm2, xmmword ptr [rbp + 0x90]
140c149e2: movups    xmm3, xmmword ptr [rbp + 0xa0]
140c149e9: movups    xmmword ptr [rcx + rdi + 0xc], xmm0
140c149ee: movups    xmmword ptr [rcx + rdi + 0x1c], xmm1
140c149f3: movups    xmmword ptr [rcx + rdi + 0x2c], xmm2
140c149f8: movups    xmmword ptr [rcx + rdi + 0x3c], xmm3
140c149fd: movups    xmm0, xmmword ptr [rbp + 0xac]
140c14a04: movups    xmmword ptr [rcx + rdi + 0x48], xmm0
140c14a09: mov       dword ptr [rcx + rdi + 0x58], 0
140c14a11: mov       dword ptr [rcx + rdi + 0x64], 0
140c14a19: mov       qword ptr [rcx + rdi + 0x88], 0
140c14a25: mov       dword ptr [rcx + rdi + 0x90], 0
140c14a30: mov       dword ptr [rcx + rdi + 0xac], 0
140c14a3b: movabs    rdx, 0xafffffffe
140c14a45: mov       qword ptr [rcx + rdi + 0xf0], rdx
140c14a4d: mov       word ptr [rcx + rdi + 0x108], 1
140c14a57: mov       byte ptr [rcx + rdi + 0x10a], 1
140c14a5f: movups    xmm0, xmmword ptr [rbp + 0x250]
140c14a66: movups    xmm1, xmmword ptr [rbp + 0x260]
140c14a6d: movups    xmm2, xmmword ptr [rbp + 0x270]
140c14a74: movups    xmm3, xmmword ptr [rbp + 0x27d]
140c14a7b: movups    xmmword ptr [rcx + rdi + 0x10b], xmm0
140c14a83: movups    xmmword ptr [rcx + rdi + 0x11b], xmm1
140c14a8b: movups    xmmword ptr [rcx + rdi + 0x12b], xmm2
140c14a93: movups    xmmword ptr [rcx + rdi + 0x138], xmm3
140c14a9b: mov       qword ptr [rcx + rdi + 0x148], 0
140c14aa7: mov       qword ptr [rcx + rdi + 0x150], 1
140c14ab3: mov       dword ptr [rcx + rdi + 0x158], 0x10
140c14abe: mov       byte ptr [rcx + rdi + 0x15c], 1
140c14ac6: mov       dword ptr [rcx + rdi + 0x160], 0x3f800000
140c14ad1: mov       byte ptr [rcx + rdi + 0x164], 0
140c14ad9: mov       byte ptr [rcx + rdi + 0x168], bl
140c14ae0: mov       byte ptr [rcx + rdi + 0x169], 0
140c14ae8: mov       qword ptr [rcx + rdi + 0x16c], 0
140c14af4: mov       dword ptr [rcx + rdi + 0x174], 0x42200000
140c14aff: mov       qword ptr [rcx + rdi + 0x178], rax
140c14b07: add       rdi, 0x188
140c14b0e: jmp       0x140c14bd8
140c14b13: mov       rax, qword ptr [rbp + 0x78]
140c14b17: mov       ebx, 0x40e00000
140c14b1c: cmp       rax, -1
140c14b20: je        0x140c142fb
140c14b26: mov       qword ptr [rbp + 0x290], rax
140c14b2d: mov       rcx, qword ptr [rbp + 0x80]
140c14b34: mov       rdx, qword ptr [rbp + 0x88]
140c14b3b: mov       qword ptr [rbp + 0x248], rcx
140c14b42: call      0x145bdb8d0
140c14b47: nop
140c14b48: mov       rsi, rax
140c14b4b: mov       rdx, qword ptr [rbp + 0x290]
140c14b52: test      rdx, rdx
140c14b55: je        0x140c14b69
140c14b57: mov       r8d, 1
140c14b5d: mov       rcx, qword ptr [rbp + 0x248]
140c14b64: call      0x1400021d0
140c14b69: test      sil, 1
140c14b6d: jne       0x140c142fb
140c14b73: shr       rsi, 0x20
140c14b77: mov       r13b, 1
140c14b7a: mov       ebx, esi
140c14b7c: mov       rsi, qword ptr [rbp - 0x40]
140c14b80: test      rsi, rsi
140c14b83: jne       0x140c1430b
140c14b89: jmp       0x140c14307
140c14b8e: mov       rsi, qword ptr [rbp + 0x58]
140c14b92: test      rsi, rsi
140c14b95: jne       0x140c14b9b
140c14b97: mov       rsi, qword ptr [rbp + 0x60]
140c14b9b: mov       rbx, qword ptr [rbp + 0x40]
140c14b9f: mov       rax, qword ptr [rsi]
140c14ba2: mov       rdi, qword ptr [rsi + 0x10]
140c14ba6: sub       rax, rdi
140c14ba9: cmp       rax, 0x2f
140c14bad: jbe       0x140c14cb6
140c14bb3: mov       rax, qword ptr [rsi + 8]
140c14bb7: lea       rcx, [rip - 0x22ea0e]
140c14bbe: mov       qword ptr [rax + rdi], rcx
140c14bc2: mov       dword ptr [rax + rdi + 8], 2
140c14bca: mov       byte ptr [rax + rdi + 0x24], 0
140c14bcf: mov       qword ptr [rax + rdi + 0x28], rbx
140c14bd4: add       rdi, 0x30
140c14bd8: mov       qword ptr [rsi + 0x10], rdi
140c14bdc: movaps    xmm6, xmmword ptr [rbp + 0x2a0]
140c14be3: add       rsp, 0x338
140c14bea: pop       rbx
140c14beb: pop       rdi
140c14bec: pop       rsi
140c14bed: pop       r12
140c14bef: pop       r13
140c14bf1: pop       r14
140c14bf3: pop       r15
140c14bf5: pop       rbp
140c14bf6: ret
140c14bf7: mov       qword ptr [rsp + 0x20], 1
140c14c00: mov       r8d, 0x10
140c14c06: mov       r9d, 1
140c14c0c: mov       rcx, rsi
140c14c0f: mov       rdx, rdi
140c14c12: call      0x145bfa970
140c14c17: jmp       0x140c1431f
140c14c1c: mov       qword ptr [rsp + 0x20], 1
140c14c25: mov       r8d, 0x108
140c14c2b: mov       r9d, 1
140c14c31: mov       rcx, rsi
140c14c34: mov       rdx, rbx
140c14c37: call      0x145bfa970
140c14c3c: jmp       0x140c1437a
140c14c41: mov       qword ptr [rsp + 0x20], 1
140c14c4a: mov       r8d, 0x10c
140c14c50: mov       r9d, 1
140c14c56: mov       rcx, rsi
140c14c59: mov       rdx, rdi
140c14c5c: call      0x145bfa970
140c14c61: jmp       0x140c144b2
140c14c66: mov       qword ptr [rsp + 0x20], 1
140c14c6f: mov       r8d, 0x188
140c14c75: mov       r9d, 1
140c14c7b: mov       rcx, rsi
140c14c7e: mov       rdx, rdi
140c14c81: mov       r14, rax
140c14c84: call      0x145bfa970
140c14c89: mov       rax, r14
140c14c8c: jmp       0x140c149b9
140c14c91: mov       qword ptr [rsp + 0x20], 1
140c14c9a: mov       r8d, 0x18
140c14ca0: mov       r9d, 1
140c14ca6: mov       rcx, rsi
140c14ca9: mov       rdx, rdi
140c14cac: call      0x145bfa970
140c14cb1: jmp       0x140c1485b
140c14cb6: mov       qword ptr [rsp + 0x20], 1
140c14cbf: mov       r8d, 0x30
140c14cc5: mov       r9d, 1
140c14ccb: mov       rcx, rsi
140c14cce: mov       rdx, rdi
140c14cd1: call      0x145bfa970
140c14cd6: jmp       0x140c14bb3
