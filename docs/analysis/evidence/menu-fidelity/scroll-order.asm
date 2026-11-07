140189747: call      0x140002200
14018974c: mov       ecx, 0x1c0
140189751: mov       edx, 8
140189756: call      0x1400021c0
14018975b: test      rax, rax
14018975e: je        0x14018a31e
140189764: mov       qword ptr [rbp + 0x678], rax
14018976b: mov       qword ptr [rbp + 0x170], 0xffffffffffffffff
140189776: mov       dword ptr [rbp + 0x2f0], 0
140189780: mov       byte ptr [rbp + 0x2f4], 0
140189787: call      0x140002200
14018978c: mov       ecx, 0x278
140189791: mov       edx, 8
140189796: call      0x1400021c0
14018979b: test      rax, rax
14018979e: je        0x14018a32f
1401897a4: mov       rdi, rax
1401897a7: lea       rdx, [rbp + 0x80]
1401897ae: mov       r8d, 0x278
1401897b4: mov       rcx, rax
1401897b7: call      0x145bfa0e7
1401897bc: nop
1401897bd: lea       r8, [rip + 0x5c5d47c]
1401897c4: lea       rcx, [rbp - 0x60]
1401897c8: mov       rdx, rdi
1401897cb: call      0x144e1fc30
1401897d0: nop
1401897d1: mov       qword ptr [rbp + 0xc0], 0xffffffffffffffff
1401897dc: mov       dword ptr [rbp + 0x660], 0
1401897e6: mov       byte ptr [rbp + 0x664], 0
1401897ed: call      0x140002200
1401897f2: mov       ecx, 0x5e8
1401897f7: mov       edx, 8
1401897fc: call      0x1400021c0
140189801: test      rax, rax
140189804: je        0x14018a341
14018980a: mov       rdi, rax
14018980d: lea       rdx, [rbp + 0x80]
140189814: mov       r8d, 0x5e8
14018981a: mov       rcx, rax
14018981d: call      0x145bfa0e7
140189822: nop
140189823: lea       r8, [rip + 0x5c5d4be]
14018982a: lea       rcx, [rbp + 0x10]
14018982e: mov       rdx, rdi
140189831: call      0x144e1fc30
140189836: nop
140189837: mov       qword ptr [rbp + 0x170], 0xffffffffffffffff
140189842: mov       dword ptr [rbp + 0x408], 0
14018984c: mov       byte ptr [rbp + 0x40c], 0
140189853: call      0x140002200
140189858: mov       ecx, 0x390
14018985d: mov       edx, 8
140189862: call      0x1400021c0
140189867: test      rax, rax
14018986a: je        0x14018a353
140189870: mov       rdi, rax
140189873: lea       rdx, [rbp + 0x80]
14018987a: mov       r8d, 0x390
140189880: mov       rcx, rax
140189883: call      0x145bfa0e7
140189888: nop
140189889: lea       r8, [rip + 0x5c5d308]
140189890: lea       rcx, [rbp + 0x680]
140189897: mov       rdx, rdi
14018989a: call      0x144e1fc30
14018989f: nop
1401898a0: mov       qword ptr [rbp + 0x170], 0xffffffffffffffff
1401898ab: mov       dword ptr [rbp + 0x410], 0
1401898b5: mov       byte ptr [rbp + 0x414], 0
1401898bc: call      0x140002200
1401898c1: mov       ecx, 0x398
1401898c6: mov       edx, 8
1401898cb: call      0x1400021c0
1401898d0: test      rax, rax
1401898d3: je        0x14018a365
1401898d9: mov       rdi, rax
1401898dc: lea       rdx, [rbp + 0x80]
1401898e3: mov       r8d, 0x398
1401898e9: mov       rcx, rax
1401898ec: call      0x145bfa0e7
1401898f1: nop
1401898f2: lea       r8, [rip + 0x5c5d1f7]
1401898f9: lea       rcx, [rbp + 0x80]
140189900: mov       rdx, rdi
140189903: call      0x144e1fc30
140189908: nop
140189909: movups    xmm0, xmmword ptr [rbp]
14018990d: mov       rax, qword ptr [rbp + 0x678]
140189914: movups    xmmword ptr [rax + 0x60], xmm0
140189918: movups    xmm0, xmmword ptr [rbp - 0x10]
14018991c: movups    xmmword ptr [rax + 0x50], xmm0
140189920: movups    xmm0, xmmword ptr [rbp - 0x20]
140189924: movups    xmmword ptr [rax + 0x40], xmm0
140189928: movups    xmm0, xmmword ptr [rbp - 0x60]
14018992c: movups    xmm1, xmmword ptr [rbp - 0x50]
140189930: movups    xmm2, xmmword ptr [rbp - 0x40]
140189934: movups    xmm3, xmmword ptr [rbp - 0x30]
140189938: movups    xmmword ptr [rax + 0x30], xmm3
14018993c: movups    xmmword ptr [rax + 0x20], xmm2
140189940: movups    xmmword ptr [rax + 0x10], xmm1
140189944: movups    xmmword ptr [rax], xmm0
140189947: movups    xmm0, xmmword ptr [rbp + 0x10]
14018994b: movups    xmm1, xmmword ptr [rbp + 0x20]
14018994f: movups    xmm2, xmmword ptr [rbp + 0x30]
140189953: movups    xmm3, xmmword ptr [rbp + 0x40]
140189957: movups    xmmword ptr [rax + 0x70], xmm0
14018995b: movups    xmmword ptr [rax + 0x80], xmm1
140189962: movups    xmmword ptr [rax + 0x90], xmm2
140189969: movups    xmmword ptr [rax + 0xa0], xmm3
140189970: movups    xmm0, xmmword ptr [rbp + 0x50]
140189974: movups    xmmword ptr [rax + 0xb0], xmm0
14018997b: movups    xmm0, xmmword ptr [rbp + 0x60]
14018997f: movups    xmmword ptr [rax + 0xc0], xmm0
140189986: movups    xmm0, xmmword ptr [rbp + 0x70]
14018998a: movups    xmmword ptr [rax + 0xd0], xmm0
140189991: movups    xmm0, xmmword ptr [rbp + 0x6e0]
140189998: movups    xmmword ptr [rax + 0x140], xmm0
14018999f: movups    xmm0, xmmword ptr [rbp + 0x6d0]
1401899a6: movups    xmmword ptr [rax + 0x130], xmm0
1401899ad: movups    xmm0, xmmword ptr [rbp + 0x6c0]
1401899b4: movups    xmmword ptr [rax + 0x120], xmm0
1401899bb: movups    xmm0, xmmword ptr [rbp + 0x680]
1401899c2: movups    xmm1, xmmword ptr [rbp + 0x690]
1401899c9: movups    xmm2, xmmword ptr [rbp + 0x6a0]
1401899d0: movups    xmm3, xmmword ptr [rbp + 0x6b0]
1401899d7: movups    xmmword ptr [rax + 0x110], xmm3
1401899de: movups    xmmword ptr [rax + 0x100], xmm2
1401899e5: movups    xmmword ptr [rax + 0xf0], xmm1
1401899ec: movups    xmmword ptr [rax + 0xe0], xmm0
1401899f3: movups    xmm0, xmmword ptr [rbp + 0x80]
1401899fa: movups    xmm1, xmmword ptr [rbp + 0x90]
140189a01: movups    xmm2, xmmword ptr [rbp + 0xa0]
140189a08: movups    xmm3, xmmword ptr [rbp + 0xb0]
140189a0f: movups    xmmword ptr [rax + 0x150], xmm0
140189a16: movups    xmmword ptr [rax + 0x160], xmm1
140189a1d: movups    xmmword ptr [rax + 0x170], xmm2
140189a24: movups    xmmword ptr [rax + 0x180], xmm3
140189a2b: movups    xmm0, xmmword ptr [rbp + 0xc0]
140189a32: movups    xmmword ptr [rax + 0x190], xmm0
140189a39: movups    xmm0, xmmword ptr [rbp + 0xd0]
140189a40: movups    xmmword ptr [rax + 0x1a0], xmm0
140189a47: movups    xmm0, xmmword ptr [rbp + 0xe0]
140189a4e: movups    xmmword ptr [rax + 0x1b0], xmm0
140189a55: mov       qword ptr [rbp + 0x88], 4
140189a60: mov       qword ptr [rbp + 0x90], rax
140189a67: mov       qword ptr [rbp + 0x98], 4
140189a72: mov       qword ptr [rbp + 0xa0], 0
140189a7d: mov       qword ptr [rbp + 0xa8], 8
140189a88: xorps     xmm0, xmm0
140189a8b: movups    xmmword ptr [rbp + 0xb0], xmm0
140189a92: mov       qword ptr [rbp + 0x80], 0xffffffffffffffff
140189a9d: lea       rcx, [rbp + 0xb8]
140189aa4: call      0x144e9bf10
140189aa9: nop
140189aaa: movups    xmm0, xmmword ptr [rbp + 0xe0]
140189ab1: movaps    xmmword ptr [rbp + 0x6e0], xmm0
140189ab8: movups    xmm0, xmmword ptr [rbp + 0xd0]
140189abf: movaps    xmmword ptr [rbp + 0x6d0], xmm0
140189ac6: movups    xmm0, xmmword ptr [rbp + 0xc0]
140189acd: movaps    xmmword ptr [rbp + 0x6c0], xmm0
140189ad4: movups    xmm0, xmmword ptr [rbp + 0x80]
140189adb: movups    xmm1, xmmword ptr [rbp + 0x90]
140189ae2: movups    xmm2, xmmword ptr [rbp + 0xa0]
140189ae9: movups    xmm3, xmmword ptr [rbp + 0xb0]
140189af0: movaps    xmmword ptr [rbp + 0x6b0], xmm3
140189af7: movaps    xmmword ptr [rbp + 0x6a0], xmm2
140189afe: movaps    xmmword ptr [rbp + 0x690], xmm1
140189b05: movaps    xmmword ptr [rbp + 0x680], xmm0
140189b0c: mov       rcx, qword ptr [rip + 0x7ef9b8d]
140189b13: lea       r8, [rip + 0x5c536ce]
140189b1a: lea       rdx, [rbp + 0x6ff]
140189b21: call      0x1400f7360
140189b26: nop
140189b27: mov       r8, rdx
140189b2a: lea       rcx, [rbp + 0x680]
140189b31: mov       rdx, rax
140189b34: call      0x14013d450
140189b39: nop
140189b3a: movaps    xmm0, xmmword ptr [rbp + 0x6e0]
140189b41: movaps    xmmword ptr [rbp + 0xe0], xmm0
140189b48: movaps    xmm0, xmmword ptr [rbp + 0x6d0]
140189b4f: movaps    xmmword ptr [rbp + 0xd0], xmm0
140189b56: movaps    xmm0, xmmword ptr [rbp + 0x6c0]
140189b5d: movaps    xmmword ptr [rbp + 0xc0], xmm0
140189b64: movaps    xmm0, xmmword ptr [rbp + 0x680]
140189b6b: movaps    xmm1, xmmword ptr [rbp + 0x690]
140189b72: movaps    xmm2, xmmword ptr [rbp + 0x6a0]
140189b79: movaps    xmm3, xmmword ptr [rbp + 0x6b0]
140189b80: movaps    xmmword ptr [rbp + 0xb0], xmm3
140189b87: movaps    xmmword ptr [rbp + 0xa0], xmm2
140189b8e: movaps    xmmword ptr [rbp + 0x90], xmm1
140189b95: movaps    xmmword ptr [rbp + 0x80], xmm0
140189b9c: lea       rdx, [rbp + 0x80]
140189ba3: mov       rcx, rsi
140189ba6: call      0x1400b4130
