0x1402e12e0: push rbp
0x1402e12e1: push r15
0x1402e12e3: push r14
0x1402e12e5: push r13
0x1402e12e7: push r12
0x1402e12e9: push rsi
0x1402e12ea: push rdi
0x1402e12eb: push rbx
0x1402e12ec: sub rsp, 0x3a8
0x1402e12f3: lea rbp, [rsp + 0x80]
0x1402e12fb: movdqa xmmword ptr [rbp + 0x310], xmm6
0x1402e1303: mov qword ptr [rbp + 0x308], 0xfffffffffffffffe
0x1402e130e: mov rax, qword ptr [rbp + 0x390]
0x1402e1315: movups xmm0, xmmword ptr [rdx]
0x1402e1318: movups xmm1, xmmword ptr [rdx + 0x10]
0x1402e131c: movaps xmmword ptr [rbp - 0x20], xmm1
0x1402e1320: movaps xmmword ptr [rbp - 0x30], xmm0
0x1402e1324: movups xmm0, xmmword ptr [r8]
0x1402e1328: movups xmm1, xmmword ptr [r8 + 0x10]
0x1402e132d: movaps xmmword ptr [rbp], xmm1
0x1402e1331: movaps xmmword ptr [rbp - 0x10], xmm0
0x1402e1335: movups xmm0, xmmword ptr [r9]
0x1402e1339: movups xmm1, xmmword ptr [r9 + 0x10]
0x1402e133e: movaps xmmword ptr [rbp + 0x20], xmm1
0x1402e1342: movaps xmmword ptr [rbp + 0x10], xmm0
0x1402e1346: movdqu xmm0, xmmword ptr [rax]
0x1402e134a: movups xmm1, xmmword ptr [rax + 0x10]
0x1402e134e: movaps xmmword ptr [rbp + 0x40], xmm1
0x1402e1352: movdqa xmmword ptr [rbp + 0x30], xmm0
0x1402e1357: mov rax, qword ptr [rbp - 0x30]
0x1402e135b: cmp qword ptr [rax + 0x10], 0
0x1402e1360: je 0x1402e2d14
0x1402e1366: lea r13, [rbp - 0x10]
0x1402e136a: mov rcx, qword ptr [rbp + 0x10]
0x1402e136e: mov qword ptr [rbp + 0x1b8], rcx
0x1402e1375: mov ecx, dword ptr [rbp - 0x14]
0x1402e1378: mov rdx, qword ptr [rbp - 0x20]
0x1402e137c: mov dword ptr [rdx], ecx
0x1402e137e: mov rcx, qword ptr [rax + 8]
0x1402e1382: mov rdx, qword ptr [rax + 0x10]
0x1402e1386: mov qword ptr [rax + 0x10], 0
0x1402e138e: mov qword ptr [rbp + 0x198], rdx
0x1402e1395: shl rdx, 5
0x1402e1399: add rdx, rcx
0x1402e139c: mov qword ptr [rbp + 0x1a0], 0
0x1402e13a7: mov qword ptr [rbp + 0x180], rcx
0x1402e13ae: mov qword ptr [rbp + 0x188], rdx
0x1402e13b5: mov qword ptr [rbp + 0x190], rax
0x1402e13bc: mov eax, dword ptr [rbp + 0xc]
0x1402e13bf: mov dword ptr [rbp + 0x304], eax
0x1402e13c5: mov rax, qword ptr [rbp - 0x10]
0x1402e13c9: mov rcx, qword ptr [rbp]
0x1402e13cd: mov qword ptr [rbp + 0x2e0], rcx
0x1402e13d4: mov rbx, rax
0x1402e13d7: lea rax, [rax + 0x88]
0x1402e13de: mov qword ptr [rbp + 0x220], rax
0x1402e13e5: lea r12, [rbp + 0x2c0]
0x1402e13ec: mov eax, dword ptr [rbp + 0x4c]
0x1402e13ef: mov dword ptr [rbp + 0x21c], eax
0x1402e13f5: mov rax, qword ptr [rbp + 0x40]
0x1402e13f9: mov qword ptr [rbp + 0x1a8], rax
0x1402e1400: mov rax, qword ptr [rbp + 0x30]
0x1402e1404: mov qword ptr [rbp + 0x1b0], rax
0x1402e140b: pcmpeqd xmm6, xmm6
0x1402e140f: lea r15, [rbp + 0x230]
0x1402e1416: lea r14, [rip + 0x5f97575]
0x1402e141d: jmp 0x1402e144a
0x1402e141f: mov ecx, dword ptr [rax]
0x1402e1421: mov edx, 0x62626f6c
0x1402e1426: xor ecx, edx
0x1402e1428: mov eax, dword ptr [rax + 3]
0x1402e142b: mov edx, 0x73656962
0x1402e1430: xor eax, edx
0x1402e1432: or eax, ecx
0x1402e1434: je 0x1402e166f
0x1402e143a: nop word ptr [rax + rax]
0x1402e1440: lea rcx, [rbp - 0x50]
0x1402e1444: call 0x140004e00
0x1402e1449: nop 
0x1402e144a: mov rax, qword ptr [rbp + 0x180]
0x1402e1451: cmp rax, qword ptr [rbp + 0x188]
0x1402e1458: je 0x1402e2d08
0x1402e145e: lea rcx, [rax + 0x20]
0x1402e1462: mov qword ptr [rbp + 0x180], rcx
0x1402e1469: movdqu xmm0, xmmword ptr [rax]
0x1402e146d: movups xmm1, xmmword ptr [rax + 0x10]
0x1402e1471: movdqa xmmword ptr [rbp - 0x50], xmm0
0x1402e1476: movaps xmmword ptr [rbp - 0x40], xmm1
0x1402e147a: movaps xmmword ptr [rbp + 0x240], xmm1
0x1402e1481: movdqa xmmword ptr [rbp + 0x230], xmm0
0x1402e1489: mov edx, 4
0x1402e148e: lea rcx, [rip + 0x5f974f3]
0x1402e1495: mov r8, r15
0x1402e1498: call 0x142d23770
0x1402e149d: nop 
0x1402e149e: test rax, rax
0x1402e14a1: jne 0x1402e14aa
0x1402e14a3: mov rax, qword ptr [rip + 0x8352e86]
0x1402e14aa: cmp byte ptr [rax], 3
0x1402e14ad: jne 0x1402e1440
0x1402e14af: mov rcx, qword ptr [rax + 0x18]
0x1402e14b3: add rcx, -4
0x1402e14b7: cmp rcx, 4
0x1402e14bb: ja 0x1402e1440
0x1402e14bd: mov rax, qword ptr [rax + 0x10]
0x1402e14c1: lea rdx, [rip + 0x5f99550]
0x1402e14c8: movsxd rcx, dword ptr [rdx + rcx*4]
0x1402e14cc: add rcx, rdx
0x1402e14cf: jmp rcx
0x1402e14d1: cmp dword ptr [rax], 0x706f6f63
0x1402e14d7: jne 0x1402e1440
0x1402e14dd: mov edx, 5
0x1402e14e2: lea rcx, [rip + 0x5f97503]
0x1402e14e9: mov r8, r15
0x1402e14ec: call 0x142d23770
0x1402e14f1: nop 
0x1402e14f2: test rax, rax
0x1402e14f5: jne 0x1402e14fe
0x1402e14f7: mov rax, qword ptr [rip + 0x8352e32]
0x1402e14fe: cmp byte ptr [rax], 3
0x1402e1501: jne 0x1402e172f
0x1402e1507: mov rcx, qword ptr [rax + 0x18]
0x1402e150b: test rcx, rcx
0x1402e150e: js 0x1402e2d3c
0x1402e1514: mov qword ptr [rbp + 0x2f8], rcx
0x1402e151b: je 0x1402e2bf5
0x1402e1521: mov r14, qword ptr [rax + 0x10]
0x1402e1525: call 0x140002200
0x1402e152a: mov edx, 1
0x1402e152f: mov rcx, qword ptr [rbp + 0x2f8]
0x1402e1536: call 0x1400021c0
0x1402e153b: mov qword ptr [rbp + 0x2e8], rax
0x1402e1542: test rax, rax
0x1402e1545: je 0x1402e2e06
0x1402e154b: mov rcx, qword ptr [rbp + 0x2e8]
0x1402e1552: mov rdx, r14
0x1402e1555: mov r8, qword ptr [rbp + 0x2f8]
0x1402e155c: call 0x14606171b
0x1402e1561: jmp 0x1402e2c0c
0x1402e1566: mov ecx, dword ptr [rax]
0x1402e1568: mov edx, 0x74726170
0x1402e156d: xor ecx, edx
0x1402e156f: movzx eax, byte ptr [rax + 4]
0x1402e1573: xor eax, 0x79
0x1402e1576: or eax, ecx
0x1402e1578: jne 0x1402e1440
0x1402e157e: mov edx, 4
0x1402e1583: lea rcx, [rip + 0x5f97415]
0x1402e158a: mov r8, r15
0x1402e158d: call 0x142d23770
0x1402e1592: nop 
0x1402e1593: test rax, rax
0x1402e1596: jne 0x1402e159f
0x1402e1598: mov rax, qword ptr [rip + 0x8352d91]
0x1402e159f: cmp byte ptr [rax], 3
0x1402e15a2: mov rdx, qword ptr [rbp + 0x1c0]
0x1402e15a9: jne 0x1402e17bf
0x1402e15af: mov r15, qword ptr [rax + 0x18]
0x1402e15b3: test r15, r15
0x1402e15b6: js 0x1402e2d2f
0x1402e15bc: je 0x1402e2c26
0x1402e15c2: mov r14, qword ptr [rax + 0x10]
0x1402e15c6: call 0x140002200
0x1402e15cb: mov edx, 1
0x1402e15d0: mov rcx, r15
0x1402e15d3: call 0x1400021c0
0x1402e15d8: test rax, rax
0x1402e15db: je 0x1402e2dbe
0x1402e15e1: mov rdi, rax
0x1402e15e4: mov rcx, rax
0x1402e15e7: mov rdx, r14
0x1402e15ea: mov r8, r15
0x1402e15ed: call 0x14606171b
0x1402e15f2: jmp 0x1402e2c2e
0x1402e15f7: movabs rcx, 0x74616863706f6f63
0x1402e1601: cmp qword ptr [rax], rcx
0x1402e1604: jne 0x1402e1440
0x1402e160a: mov edx, 2
0x1402e160f: lea rcx, [rip + 0x5f97376]
0x1402e1616: mov r8, r15
0x1402e1619: call 0x142d23770
0x1402e161e: nop 
0x1402e161f: test rax, rax
0x1402e1622: jne 0x1402e162b
0x1402e1624: mov rax, qword ptr [rip + 0x8352d05]
0x1402e162b: cmp byte ptr [rax], 3
0x1402e162e: jne 0x1402e1cbd
0x1402e1634: mov rcx, qword ptr [rax + 0x18]
0x1402e1638: test rcx, rcx
0x1402e163b: je 0x1402e1b21
0x1402e1641: mov r8, qword ptr [rax + 0x10]
0x1402e1645: cmp rcx, 1
0x1402e1649: jne 0x1402e1b29
0x1402e164f: movzx eax, byte ptr [r8]
0x1402e1653: cmp eax, 0x2b
0x1402e1656: je 0x1402e1cbd
0x1402e165c: mov esi, 0
0x1402e1661: cmp eax, 0x2d
0x1402e1664: je 0x1402e1cbf
0x1402e166a: jmp 0x1402e1b2d
0x1402e166f: mov eax, dword ptr [rbp + 0x304]
0x1402e1675: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e167c: mov dword ptr [rcx], eax
0x1402e167e: mov byte ptr [rbx + 0x1b5], 1
0x1402e1685: mov edx, 4
0x1402e168a: lea rcx, [rip + 0x5f97357]
0x1402e1691: mov r8, r15
0x1402e1694: call 0x142d23770
0x1402e1699: nop 
0x1402e169a: test rax, rax
0x1402e169d: jne 0x1402e16a6
0x1402e169f: mov rax, qword ptr [rip + 0x8352c8a]
0x1402e16a6: cmp byte ptr [rax], 4
0x1402e16a9: mov qword ptr [rbp + 0x2d0], rbx
0x1402e16b0: jne 0x1402e1708
0x1402e16b2: mov r12, r14
0x1402e16b5: mov r15, qword ptr [rax + 0x18]
0x1402e16b9: imul r14, r15, 0x128
0x1402e16c0: movabs rcx, 0x6eb3e45306eb3e
0x1402e16ca: cmp r15, rcx
0x1402e16cd: ja 0x1402e2d5e
0x1402e16d3: mov rdi, qword ptr [rax + 0x10]
0x1402e16d7: test r14, r14
0x1402e16da: je 0x1402e1ee7
0x1402e16e0: call 0x140002200
0x1402e16e5: mov esi, 8
0x1402e16ea: mov edx, 8
0x1402e16ef: mov rcx, r14
0x1402e16f2: call 0x1400021c0
0x1402e16f7: test rax, rax
0x1402e16fa: je 0x1402e2d60
0x1402e1700: mov rcx, r15
0x1402e1703: jmp 0x1402e1eee
0x1402e1708: mov eax, 8
0x1402e170d: mov qword ptr [rbp + 0x2b0], rax
0x1402e1714: mov qword ptr [rbp + 0x290], 0
0x1402e171f: mov qword ptr [rbp + 0x298], 0
0x1402e172a: jmp 0x1402e1f77
0x1402e172f: mov eax, 1
0x1402e1734: mov qword ptr [rbp + 0x2e8], rax
0x1402e173b: mov qword ptr [rbp + 0x2f8], 0
0x1402e1746: mov edx, 3
0x1402e174b: lea rcx, [rip + 0x5f9729f]
0x1402e1752: mov r8, r15
0x1402e1755: call 0x142d23770
0x1402e175a: nop 
0x1402e175b: test rax, rax
0x1402e175e: jne 0x1402e1767
0x1402e1760: mov rax, qword ptr [rip + 0x8352bc9]
0x1402e1767: cmp byte ptr [rax], 3
0x1402e176a: mov rdx, qword ptr [rbp + 0x1c8]
0x1402e1771: jne 0x1402e18d7
0x1402e1777: mov r15, qword ptr [rax + 0x18]
0x1402e177b: test r15, r15
0x1402e177e: js 0x1402e2d6e
0x1402e1784: je 0x1402e2c72
0x1402e178a: mov r14, qword ptr [rax + 0x10]
0x1402e178e: call 0x140002200
0x1402e1793: mov edx, 1
0x1402e1798: mov rcx, r15
0x1402e179b: call 0x1400021c0
0x1402e17a0: test rax, rax
0x1402e17a3: je 0x1402e2e1e
0x1402e17a9: mov rdi, rax
0x1402e17ac: mov rcx, rax
0x1402e17af: mov rdx, r14
0x1402e17b2: mov r8, r15
0x1402e17b5: call 0x14606171b
0x1402e17ba: jmp 0x1402e2c7a
0x1402e17bf: mov edi, 1
0x1402e17c4: xor r15d, r15d
0x1402e17c7: mov eax, dword ptr [rbp + 0x304]
0x1402e17cd: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e17d4: mov dword ptr [rcx], eax
0x1402e17d6: mov rax, rbx
0x1402e17d9: mov rdx, qword ptr [rbx + 0xa0]
0x1402e17e0: test rdx, rdx
0x1402e17e3: je 0x1402e17fa
0x1402e17e5: mov rcx, qword ptr [rax + 0xa8]
0x1402e17ec: mov r8d, 1
0x1402e17f2: call 0x1400021d0
0x1402e17f7: mov rax, rbx
0x1402e17fa: mov qword ptr [rax + 0xa0], r15
0x1402e1801: mov qword ptr [rbp + 0x1c0], rdi
0x1402e1808: mov qword ptr [rax + 0xa8], rdi
0x1402e180f: mov qword ptr [rax + 0xb0], r15
0x1402e1816: mov edx, 6
0x1402e181b: lea rcx, [rip + 0x5f97181]
0x1402e1822: lea rsi, [rbp + 0x230]
0x1402e1829: mov r8, rsi
0x1402e182c: call 0x142d23770
0x1402e1831: nop 
0x1402e1832: test rax, rax
0x1402e1835: jne 0x1402e183e
0x1402e1837: mov rax, qword ptr [rip + 0x8352af2]
0x1402e183e: cmp byte ptr [rax], 2
0x1402e1841: jne 0x1402e184e
0x1402e1843: cmp qword ptr [rax + 8], 0
0x1402e1848: je 0x1402e1ed4
0x1402e184e: xor eax, eax
0x1402e1850: mov ecx, dword ptr [rbp + 0x304]
0x1402e1856: mov rdx, qword ptr [rbp + 0x2e0]
0x1402e185d: mov dword ptr [rdx], ecx
0x1402e185f: mov byte ptr [rbx + 0x1bb], al
0x1402e1865: mov edx, 0xa
0x1402e186a: lea rcx, [rip + 0x5f97138]
0x1402e1871: mov r8, rsi
0x1402e1874: call 0x142d23770
0x1402e1879: nop 
0x1402e187a: test rax, rax
0x1402e187d: jne 0x1402e1886
0x1402e187f: mov rax, qword ptr [rip + 0x8352aaa]
0x1402e1886: cmp byte ptr [rax], 3
0x1402e1889: jne 0x1402e19e7
0x1402e188f: mov r15, qword ptr [rax + 0x18]
0x1402e1893: test r15, r15
0x1402e1896: js 0x1402e2d78
0x1402e189c: je 0x1402e2c8d
0x1402e18a2: mov r14, qword ptr [rax + 0x10]
0x1402e18a6: call 0x140002200
0x1402e18ab: mov edx, 1
0x1402e18b0: mov rcx, r15
0x1402e18b3: call 0x1400021c0
0x1402e18b8: test rax, rax
0x1402e18bb: je 0x1402e2dcb
0x1402e18c1: mov rdi, rax
0x1402e18c4: mov rcx, rax
0x1402e18c7: mov rdx, r14
0x1402e18ca: mov r8, r15
0x1402e18cd: call 0x14606171b
0x1402e18d2: jmp 0x1402e2c95
0x1402e18d7: mov edi, 1
0x1402e18dc: xor r15d, r15d
0x1402e18df: mov eax, dword ptr [rbp + 0x304]
0x1402e18e5: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e18ec: mov dword ptr [rcx], eax
0x1402e18ee: mov rax, rbx
0x1402e18f1: mov rdx, qword ptr [rbx + 0x28]
0x1402e18f5: test rdx, rdx
0x1402e18f8: je 0x1402e190c
0x1402e18fa: mov rcx, qword ptr [rax + 0x30]
0x1402e18fe: mov r8d, 1
0x1402e1904: call 0x1400021d0
0x1402e1909: mov rax, rbx
0x1402e190c: mov qword ptr [rax + 0x28], r15
0x1402e1910: mov qword ptr [rbp + 0x1c8], rdi
0x1402e1917: mov qword ptr [rax + 0x30], rdi
0x1402e191b: mov qword ptr [rax + 0x38], r15
0x1402e191f: mov edx, 3
0x1402e1924: lea rcx, [rip + 0x5f970c9]
0x1402e192b: lea rsi, [rbp + 0x230]
0x1402e1932: mov r8, rsi
0x1402e1935: call 0x142d23770
0x1402e193a: nop 
0x1402e193b: test rax, rax
0x1402e193e: jne 0x1402e1947
0x1402e1940: mov rax, qword ptr [rip + 0x83529e9]
0x1402e1947: mov cl, 5
0x1402e1949: cmp byte ptr [rax], 2
0x1402e194c: jne 0x1402e1959
0x1402e194e: cmp qword ptr [rax + 8], 0
0x1402e1953: jne 0x1402e1959
0x1402e1955: movzx ecx, byte ptr [rax + 0x10]
0x1402e1959: mov eax, dword ptr [rbp + 0x304]
0x1402e195f: mov rdx, qword ptr [rbp + 0x2e0]
0x1402e1966: mov dword ptr [rdx], eax
0x1402e1968: mov byte ptr [rbx + 0x1bd], cl
0x1402e196e: mov edx, 4
0x1402e1973: lea rcx, [rip + 0x5f9707d]
0x1402e197a: mov r8, rsi
0x1402e197d: call 0x142d23770
0x1402e1982: nop 
0x1402e1983: test rax, rax
0x1402e1986: jne 0x1402e198f
0x1402e1988: mov rax, qword ptr [rip + 0x83529a1]
0x1402e198f: cmp byte ptr [rax], 3
0x1402e1992: jne 0x1402e1b8d
0x1402e1998: mov r15, qword ptr [rax + 0x18]
0x1402e199c: test r15, r15
0x1402e199f: mov rdx, qword ptr [rbp + 0x1d0]
0x1402e19a6: js 0x1402e2d9a
0x1402e19ac: je 0x1402e2cd2
0x1402e19b2: mov r14, qword ptr [rax + 0x10]
0x1402e19b6: call 0x140002200
0x1402e19bb: mov edx, 1
0x1402e19c0: mov rcx, r15
0x1402e19c3: call 0x1400021c0
0x1402e19c8: test rax, rax
0x1402e19cb: je 0x1402e2e2b
0x1402e19d1: mov rdi, rax
0x1402e19d4: mov rcx, rax
0x1402e19d7: mov rdx, r14
0x1402e19da: mov r8, r15
0x1402e19dd: call 0x14606171b
0x1402e19e2: jmp 0x1402e2cda
0x1402e19e7: mov edi, 1
0x1402e19ec: xor r15d, r15d
0x1402e19ef: mov eax, dword ptr [rbp + 0x304]
0x1402e19f5: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e19fc: mov dword ptr [rcx], eax
0x1402e19fe: mov rax, rbx
0x1402e1a01: mov rdx, qword ptr [rbx + 0xb8]
0x1402e1a08: test rdx, rdx
0x1402e1a0b: je 0x1402e1a22
0x1402e1a0d: mov rcx, qword ptr [rax + 0xc0]
0x1402e1a14: mov r8d, 1
0x1402e1a1a: call 0x1400021d0
0x1402e1a1f: mov rax, rbx
0x1402e1a22: mov qword ptr [rax + 0xb8], r15
0x1402e1a29: mov qword ptr [rbp + 0x210], rdi
0x1402e1a30: mov qword ptr [rax + 0xc0], rdi
0x1402e1a37: mov qword ptr [rax + 0xc8], r15
0x1402e1a3e: mov rdx, rax
0x1402e1a41: mov eax, dword ptr [rbp + 0x304]
0x1402e1a47: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e1a4e: mov dword ptr [rcx], eax
0x1402e1a50: mov rcx, qword ptr [rbp + 0x220]
0x1402e1a57: mov rax, qword ptr [rcx + 0x10]
0x1402e1a5b: mov qword ptr [rbp + 0x260], rax
0x1402e1a62: movdqu xmm0, xmmword ptr [rcx]
0x1402e1a66: movdqa xmmword ptr [rbp + 0x250], xmm0
0x1402e1a6e: mov qword ptr [rdx + 0x88], 0
0x1402e1a79: mov qword ptr [rdx + 0x90], 8
0x1402e1a84: mov qword ptr [rdx + 0x98], 0
0x1402e1a8f: mov edx, 7
0x1402e1a94: lea rcx, [rip + 0x5f96f18]
0x1402e1a9b: lea r15, [rbp + 0x230]
0x1402e1aa2: mov r8, r15
0x1402e1aa5: call 0x142d23770
0x1402e1aaa: nop 
0x1402e1aab: test rax, rax
0x1402e1aae: jne 0x1402e1ab7
0x1402e1ab0: mov rax, qword ptr [rip + 0x8352879]
0x1402e1ab7: cmp byte ptr [rax], 4
0x1402e1aba: mov qword ptr [rbp + 0x2d0], rbx
0x1402e1ac1: jne 0x1402e1c52
0x1402e1ac7: mov rdi, r14
0x1402e1aca: mov r15, qword ptr [rax + 0x18]
0x1402e1ace: mov rcx, r15
0x1402e1ad1: shl rcx, 4
0x1402e1ad5: lea r14, [rcx + rcx*8]
0x1402e1ad9: movabs rcx, 0xe38e38e38e38e3
0x1402e1ae3: cmp r15, rcx
0x1402e1ae6: ja 0x1402e2da4
0x1402e1aec: mov r12, qword ptr [rax + 0x10]
0x1402e1af0: test r14, r14
0x1402e1af3: je 0x1402e2113
0x1402e1af9: call 0x140002200
0x1402e1afe: mov esi, 8
0x1402e1b03: mov edx, 8
0x1402e1b08: mov rcx, r14
0x1402e1b0b: call 0x1400021c0
0x1402e1b10: test rax, rax
0x1402e1b13: je 0x1402e2da6
0x1402e1b19: mov rcx, r15
0x1402e1b1c: jmp 0x1402e211a
0x1402e1b21: mov rsi, rcx
0x1402e1b24: jmp 0x1402e1cbf
0x1402e1b29: movzx eax, byte ptr [r8]
0x1402e1b2d: xor r9d, r9d
0x1402e1b30: cmp al, 0x2b
0x1402e1b32: sete r9b
0x1402e1b36: mov rdx, rcx
0x1402e1b39: sub rdx, r9
0x1402e1b3c: add r8, r9
0x1402e1b3f: mov rax, r9
0x1402e1b42: neg rax
0x1402e1b45: cmp rdx, 0x11
0x1402e1b49: jae 0x1402e1c79
0x1402e1b4f: test rdx, rdx
0x1402e1b52: je 0x1402e1cbd
0x1402e1b58: add rcx, rax
0x1402e1b5b: neg rcx
0x1402e1b5e: xor eax, eax
0x1402e1b60: xor esi, esi
0x1402e1b62: movzx edx, byte ptr [r8 + rax]
0x1402e1b67: add edx, -0x30
0x1402e1b6a: cmp edx, 9
0x1402e1b6d: ja 0x1402e1cbd
0x1402e1b73: lea r9, [rsi + rsi*4]
0x1402e1b77: mov edx, edx
0x1402e1b79: lea rsi, [rdx + r9*2]
0x1402e1b7d: inc rax
0x1402e1b80: mov rdx, rcx
0x1402e1b83: add rdx, rax
0x1402e1b86: jne 0x1402e1b62
0x1402e1b88: jmp 0x1402e1cbf
0x1402e1b8d: mov edi, 1
0x1402e1b92: xor r15d, r15d
0x1402e1b95: mov eax, dword ptr [rbp + 0x304]
0x1402e1b9b: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e1ba2: mov dword ptr [rcx], eax
0x1402e1ba4: mov rax, rbx
0x1402e1ba7: mov rdx, qword ptr [rbx + 0x40]
0x1402e1bab: test rdx, rdx
0x1402e1bae: je 0x1402e1bc2
0x1402e1bb0: mov rcx, qword ptr [rax + 0x48]
0x1402e1bb4: mov r8d, 1
0x1402e1bba: call 0x1400021d0
0x1402e1bbf: mov rax, rbx
0x1402e1bc2: mov qword ptr [rax + 0x40], r15
0x1402e1bc6: mov qword ptr [rbp + 0x1d0], rdi
0x1402e1bcd: mov qword ptr [rax + 0x48], rdi
0x1402e1bd1: mov qword ptr [rax + 0x50], r15
0x1402e1bd5: mov edx, 4
0x1402e1bda: lea rcx, [rip + 0x5f9674f]
0x1402e1be1: lea r8, [rbp + 0x230]
0x1402e1be8: call 0x142d23770
0x1402e1bed: nop 
0x1402e1bee: test rax, rax
0x1402e1bf1: jne 0x1402e1bfa
0x1402e1bf3: mov rax, qword ptr [rip + 0x8352736]
0x1402e1bfa: cmp byte ptr [rax], 3
0x1402e1bfd: mov rdx, qword ptr [rbp + 0x1d8]
0x1402e1c04: jne 0x1402e207c
0x1402e1c0a: mov r15, qword ptr [rax + 0x18]
0x1402e1c0e: test r15, r15
0x1402e1c11: js 0x1402e2db4
0x1402e1c17: je 0x1402e2ced
0x1402e1c1d: mov r14, qword ptr [rax + 0x10]
0x1402e1c21: call 0x140002200
0x1402e1c26: mov edx, 1
0x1402e1c2b: mov rcx, r15
0x1402e1c2e: call 0x1400021c0
0x1402e1c33: test rax, rax
0x1402e1c36: je 0x1402e2e38
0x1402e1c3c: mov rdi, rax
0x1402e1c3f: mov rcx, rax
0x1402e1c42: mov rdx, r14
0x1402e1c45: mov r8, r15
0x1402e1c48: call 0x14606171b
0x1402e1c4d: jmp 0x1402e2cf5
0x1402e1c52: mov eax, 8
0x1402e1c57: mov qword ptr [rbp + 0x2b0], rax
0x1402e1c5e: mov qword ptr [rbp + 0x298], 0
0x1402e1c69: mov qword ptr [rbp + 0x290], 0
0x1402e1c74: jmp 0x1402e21a3
0x1402e1c79: add rcx, rax
0x1402e1c7c: neg rcx
0x1402e1c7f: xor r9d, r9d
0x1402e1c82: xor eax, eax
0x1402e1c84: mov rdx, rcx
0x1402e1c87: add rdx, r9
0x1402e1c8a: je 0x1402e2bc4
0x1402e1c90: mov edx, 0xa
0x1402e1c95: mul rdx
0x1402e1c98: jo 0x1402e1cbd
0x1402e1c9a: movzx r10d, byte ptr [r8 + r9]
0x1402e1c9f: add r10d, -0x30
0x1402e1ca3: add rax, r10
0x1402e1ca6: setb dl
0x1402e1ca9: cmp r10d, 9
0x1402e1cad: ja 0x1402e1cbd
0x1402e1caf: inc r9
0x1402e1cb2: mov esi, 0
0x1402e1cb7: test dl, dl
0x1402e1cb9: je 0x1402e1c84
0x1402e1cbb: jmp 0x1402e1cbf
0x1402e1cbd: xor esi, esi
0x1402e1cbf: mov edx, 4
0x1402e1cc4: lea rcx, [rip + 0x5f96cc3]
0x1402e1ccb: mov r8, r15
0x1402e1cce: call 0x142d23770
0x1402e1cd3: nop 
0x1402e1cd4: test rax, rax
0x1402e1cd7: jne 0x1402e1ce0
0x1402e1cd9: mov rax, qword ptr [rip + 0x8352650]
0x1402e1ce0: cmp byte ptr [rax], 3
0x1402e1ce3: jne 0x1402e1d44
0x1402e1ce5: mov rcx, qword ptr [rax + 0x18]
0x1402e1ce9: test rcx, rcx
0x1402e1cec: js 0x1402e2d4d
0x1402e1cf2: mov qword ptr [rbp + 0x2f8], rcx
0x1402e1cf9: je 0x1402e2c41
0x1402e1cff: mov r14, qword ptr [rax + 0x10]
0x1402e1d03: call 0x140002200
0x1402e1d08: mov edx, 1
0x1402e1d0d: mov rcx, qword ptr [rbp + 0x2f8]
0x1402e1d14: call 0x1400021c0
0x1402e1d19: mov qword ptr [rbp + 0x2a0], rax
0x1402e1d20: test rax, rax
0x1402e1d23: je 0x1402e2dd9
0x1402e1d29: mov rcx, qword ptr [rbp + 0x2a0]
0x1402e1d30: mov rdx, r14
0x1402e1d33: mov r8, qword ptr [rbp + 0x2f8]
0x1402e1d3a: call 0x14606171b
0x1402e1d3f: jmp 0x1402e2c58
0x1402e1d44: mov eax, 1
0x1402e1d49: mov qword ptr [rbp + 0x2a0], rax
0x1402e1d50: mov qword ptr [rbp + 0x2f8], 0
0x1402e1d5b: mov edx, 7
0x1402e1d60: mov rdi, r14
0x1402e1d63: mov rcx, r14
0x1402e1d66: mov r14, r15
0x1402e1d69: mov r8, r15
0x1402e1d6c: call 0x142d23770
0x1402e1d71: nop 
0x1402e1d72: test rax, rax
0x1402e1d75: jne 0x1402e1d7e
0x1402e1d77: mov rax, qword ptr [rip + 0x83525b2]
0x1402e1d7e: cmp byte ptr [rax], 2
0x1402e1d81: jne 0x1402e1d8e
0x1402e1d83: cmp qword ptr [rax + 8], 0
0x1402e1d88: je 0x1402e1edd
0x1402e1d8e: xor r15d, r15d
0x1402e1d91: mov edx, 4
0x1402e1d96: lea rcx, [rip + 0x5f96bfc]
0x1402e1d9d: mov r8, r14
0x1402e1da0: call 0x142d23770
0x1402e1da5: nop 
0x1402e1da6: test rax, rax
0x1402e1da9: jne 0x1402e1db2
0x1402e1dab: mov rax, qword ptr [rip + 0x835257e]
0x1402e1db2: cmp byte ptr [rax], 3
0x1402e1db5: jne 0x1402e1e19
0x1402e1db7: mov rcx, qword ptr [rax + 0x18]
0x1402e1dbb: test rcx, rcx
0x1402e1dbe: js 0x1402e2d89
0x1402e1dc4: mov qword ptr [rbp + 0x2d8], rcx
0x1402e1dcb: mov r12, rbx
0x1402e1dce: je 0x1402e2ca8
0x1402e1dd4: mov rbx, qword ptr [rax + 0x10]
0x1402e1dd8: call 0x140002200
0x1402e1ddd: mov edx, 1
0x1402e1de2: mov rcx, qword ptr [rbp + 0x2d8]
0x1402e1de9: call 0x1400021c0
0x1402e1dee: mov qword ptr [rbp + 0x2a8], rax
0x1402e1df5: test rax, rax
0x1402e1df8: je 0x1402e2df1
0x1402e1dfe: mov rcx, qword ptr [rbp + 0x2a8]
0x1402e1e05: mov rdx, rbx
0x1402e1e08: mov r8, qword ptr [rbp + 0x2d8]
0x1402e1e0f: call 0x14606171b
0x1402e1e14: jmp 0x1402e2cbf
0x1402e1e19: mov eax, 1
0x1402e1e1e: mov qword ptr [rbp + 0x2a8], rax
0x1402e1e25: mov qword ptr [rbp + 0x2d8], 0
0x1402e1e30: mov edx, 2
0x1402e1e35: lea rcx, [rip + 0x5f96b61]
0x1402e1e3c: mov r8, r14
0x1402e1e3f: call 0x142d23770
0x1402e1e44: nop 
0x1402e1e45: test rax, rax
0x1402e1e48: jne 0x1402e1e51
0x1402e1e4a: mov rax, qword ptr [rip + 0x83524df]
0x1402e1e51: cmp byte ptr [rax], 1
0x1402e1e54: jne 0x1402e1e5c
0x1402e1e56: movzx eax, byte ptr [rax + 1]
0x1402e1e5a: jmp 0x1402e1e5e
0x1402e1e5c: xor eax, eax
0x1402e1e5e: mov qword ptr [rbp + 0x80], rsi
0x1402e1e65: mov rdx, qword ptr [rbp + 0x2f8]
0x1402e1e6c: mov qword ptr [rbp + 0x50], rdx
0x1402e1e70: mov rcx, qword ptr [rbp + 0x2a0]
0x1402e1e77: mov qword ptr [rbp + 0x58], rcx
0x1402e1e7b: mov qword ptr [rbp + 0x60], rdx
0x1402e1e7f: mov byte ptr [rbp + 0x8a], r15b
0x1402e1e86: mov rdx, qword ptr [rbp + 0x2d8]
0x1402e1e8d: mov qword ptr [rbp + 0x68], rdx
0x1402e1e91: mov rcx, qword ptr [rbp + 0x2a8]
0x1402e1e98: mov qword ptr [rbp + 0x70], rcx
0x1402e1e9c: mov qword ptr [rbp + 0x78], rdx
0x1402e1ea0: mov byte ptr [rbp + 0x88], al
0x1402e1ea6: mov byte ptr [rbp + 0x89], 0
0x1402e1ead: mov eax, dword ptr [rbp + 0x304]
0x1402e1eb3: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e1eba: mov dword ptr [rcx], eax
0x1402e1ebc: mov rcx, rbx
0x1402e1ebf: lea rdx, [rbp + 0x50]
0x1402e1ec3: call 0x1402af200
0x1402e1ec8: nop 
0x1402e1ec9: mov r15, r14
0x1402e1ecc: mov r14, rdi
0x1402e1ecf: jmp 0x1402e2058
0x1402e1ed4: movzx eax, byte ptr [rax + 0x10]
0x1402e1ed8: jmp 0x1402e1850
0x1402e1edd: movzx r15d, byte ptr [rax + 0x10]
0x1402e1ee2: jmp 0x1402e1d91
0x1402e1ee7: mov eax, 8
0x1402e1eec: xor ecx, ecx
0x1402e1eee: shl r15, 5
0x1402e1ef2: add r15, rdi
0x1402e1ef5: mov qword ptr [rbp + 0x268], rcx
0x1402e1efc: mov qword ptr [rbp + 0x270], rax
0x1402e1f03: mov qword ptr [rbp + 0x278], 0
0x1402e1f0e: mov qword ptr [rbp + 0x60], rax
0x1402e1f12: lea rax, [rbp + 0x278]
0x1402e1f19: mov qword ptr [rbp + 0x50], rax
0x1402e1f1d: mov qword ptr [rbp + 0x58], 0
0x1402e1f25: mov rcx, rdi
0x1402e1f28: mov rdx, r15
0x1402e1f2b: lea r8, [rbp + 0x50]
0x1402e1f2f: call 0x1400c65a0
0x1402e1f34: nop 
0x1402e1f35: mov r14, r12
0x1402e1f38: mov rax, qword ptr [rbp + 0x268]
0x1402e1f3f: mov qword ptr [rbp + 0x298], rax
0x1402e1f46: mov rax, qword ptr [rbp + 0x270]
0x1402e1f4d: mov qword ptr [rbp + 0x2b0], rax
0x1402e1f54: mov rax, qword ptr [rbp + 0x278]
0x1402e1f5b: mov qword ptr [rbp + 0x290], rax
0x1402e1f62: mov rbx, qword ptr [rbp + 0x2d0]
0x1402e1f69: lea r12, [rbp + 0x2c0]
0x1402e1f70: lea r15, [rbp + 0x230]
0x1402e1f77: mov eax, dword ptr [rbp + 0x304]
0x1402e1f7d: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e1f84: mov dword ptr [rcx], eax
0x1402e1f86: mov rcx, qword ptr [rbx + 0x78]
0x1402e1f8a: mov rax, qword ptr [rbx + 0x80]
0x1402e1f91: mov qword ptr [rbp + 0x2d8], rax
0x1402e1f98: mov qword ptr [rbp + 0x228], rcx
0x1402e1f9f: mov qword ptr [rbp + 0x2f8], 0
0x1402e1faa: nop word ptr [rax + rax]
0x1402e1fb0: mov rax, qword ptr [rbp + 0x2f8]
0x1402e1fb7: cmp qword ptr [rbp + 0x2d8], rax
0x1402e1fbe: je 0x1402e1fdc
0x1402e1fc0: inc rax
0x1402e1fc3: mov qword ptr [rbp + 0x2f8], rax
0x1402e1fca: lea rsi, [rcx + 0x128]
0x1402e1fd1: call 0x1400eae20
0x1402e1fd6: nop 
0x1402e1fd7: mov rcx, rsi
0x1402e1fda: jmp 0x1402e1fb0
0x1402e1fdc: mov rsi, qword ptr [rbp + 0x2d0]
0x1402e1fe3: mov rax, qword ptr [rsi + 0x70]
0x1402e1fe7: test rax, rax
0x1402e1fea: je 0x1402e2002
0x1402e1fec: mov rcx, qword ptr [rsi + 0x78]
0x1402e1ff0: imul rdx, rax, 0x128
0x1402e1ff7: mov r8d, 8
0x1402e1ffd: call 0x1400021d0
0x1402e2002: mov rax, qword ptr [rbp + 0x298]
0x1402e2009: mov qword ptr [rsi + 0x70], rax
0x1402e200d: mov rax, qword ptr [rbp + 0x2b0]
0x1402e2014: mov qword ptr [rsi + 0x78], rax
0x1402e2018: mov rax, qword ptr [rbp + 0x290]
0x1402e201f: mov qword ptr [rsi + 0x80], rax
0x1402e2026: mov eax, dword ptr [rbp + 0x304]
0x1402e202c: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e2033: mov dword ptr [rcx], eax
0x1402e2035: mov rcx, qword ptr [rsi + 0x78]
0x1402e2039: mov rbx, rsi
0x1402e203c: mov rdx, qword ptr [rsi + 0x80]
0x1402e2043: lea rax, [rbp + 0x28f]
0x1402e204a: mov qword ptr [rbp + 0x50], rax
0x1402e204e: cmp rdx, 2
0x1402e2052: jae 0x1402e2bcc
0x1402e2058: mov eax, dword ptr [rbp + 0x304]
0x1402e205e: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e2065: mov dword ptr [rcx], eax
0x1402e2067: inc qword ptr [rbx + 0x1a8]
0x1402e206e: mov rcx, r15
0x1402e2071: call 0x140004e00
0x1402e2076: nop 
0x1402e2077: jmp 0x1402e144a
0x1402e207c: mov edi, 1
0x1402e2081: xor r15d, r15d
0x1402e2084: mov eax, dword ptr [rbp + 0x304]
0x1402e208a: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e2091: mov dword ptr [rcx], eax
0x1402e2093: mov rax, rbx
0x1402e2096: mov rdx, qword ptr [rbx + 0x58]
0x1402e209a: test rdx, rdx
0x1402e209d: je 0x1402e20b1
0x1402e209f: mov rcx, qword ptr [rax + 0x60]
0x1402e20a3: mov r8d, 1
0x1402e20a9: call 0x1400021d0
0x1402e20ae: mov rax, rbx
0x1402e20b1: mov qword ptr [rax + 0x58], r15
0x1402e20b5: mov qword ptr [rbp + 0x1d8], rdi
0x1402e20bc: mov qword ptr [rax + 0x60], rdi
0x1402e20c0: mov qword ptr [rax + 0x68], r15
0x1402e20c4: mov rdi, qword ptr [rbp + 0x2f8]
0x1402e20cb: lea r15, [rdi - 3]
0x1402e20cf: mov rsi, rdi
0x1402e20d2: cmp r15, 8
0x1402e20d6: ja 0x1402e2b23
0x1402e20dc: lea rcx, [rip + 0x5f98949]
0x1402e20e3: movsxd rax, dword ptr [rcx + r15*4]
0x1402e20e7: add rax, rcx
0x1402e20ea: mov rsi, rdi
0x1402e20ed: jmp rax
0x1402e20ef: mov rcx, qword ptr [rbp + 0x2e8]
0x1402e20f6: movzx eax, word ptr [rcx]
0x1402e20f9: xor eax, 0x666f
0x1402e20fe: movzx ecx, byte ptr [rcx + 2]
0x1402e2102: xor ecx, 0x66
0x1402e2105: or cx, ax
0x1402e2108: jne 0x1402e28c4
0x1402e210e: jmp 0x1402e2855
0x1402e2113: mov eax, 8
0x1402e2118: xor ecx, ecx
0x1402e211a: shl r15, 5
0x1402e211e: add r15, r12
0x1402e2121: mov qword ptr [rbp + 0x268], rcx
0x1402e2128: mov qword ptr [rbp + 0x270], rax
0x1402e212f: mov qword ptr [rbp + 0x278], 0
0x1402e213a: mov qword ptr [rbp + 0x60], rax
0x1402e213e: lea rax, [rbp + 0x278]
0x1402e2145: mov qword ptr [rbp + 0x50], rax
0x1402e2149: mov qword ptr [rbp + 0x58], 0
0x1402e2151: mov rcx, r12
0x1402e2154: mov rdx, r15
0x1402e2157: lea r8, [rbp + 0x50]
0x1402e215b: call 0x1400c5cc0
0x1402e2160: nop 
0x1402e2161: mov r14, rdi
0x1402e2164: mov rax, qword ptr [rbp + 0x268]
0x1402e216b: mov qword ptr [rbp + 0x298], rax
0x1402e2172: mov rax, qword ptr [rbp + 0x270]
0x1402e2179: mov qword ptr [rbp + 0x2b0], rax
0x1402e2180: mov rax, qword ptr [rbp + 0x278]
0x1402e2187: mov qword ptr [rbp + 0x290], rax
0x1402e218e: mov rbx, qword ptr [rbp + 0x2d0]
0x1402e2195: lea r12, [rbp + 0x2c0]
0x1402e219c: lea r15, [rbp + 0x230]
0x1402e21a3: mov eax, dword ptr [rbp + 0x304]
0x1402e21a9: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e21b0: mov dword ptr [rcx], eax
0x1402e21b2: mov rcx, qword ptr [rbx + 0x90]
0x1402e21b9: mov rax, qword ptr [rbx + 0x98]
0x1402e21c0: mov qword ptr [rbp + 0x2d8], rax
0x1402e21c7: mov qword ptr [rbp + 0x228], rcx
0x1402e21ce: mov qword ptr [rbp + 0x2f8], 0
0x1402e21d9: nop dword ptr [rax]
0x1402e21e0: mov rax, qword ptr [rbp + 0x2f8]
0x1402e21e7: cmp qword ptr [rbp + 0x2d8], rax
0x1402e21ee: je 0x1402e220c
0x1402e21f0: inc rax
0x1402e21f3: mov qword ptr [rbp + 0x2f8], rax
0x1402e21fa: lea rsi, [rcx + 0x90]
0x1402e2201: call 0x1400eaf60
0x1402e2206: nop 
0x1402e2207: mov rcx, rsi
0x1402e220a: jmp 0x1402e21e0
0x1402e220c: mov rax, qword ptr [rbp + 0x220]
0x1402e2213: mov rax, qword ptr [rax]
0x1402e2216: test rax, rax
0x1402e2219: mov rsi, qword ptr [rbp + 0x2d0]
0x1402e2220: je 0x1402e223c
0x1402e2222: mov rcx, qword ptr [rsi + 0x90]
0x1402e2229: shl rax, 4
0x1402e222d: lea rdx, [rax + rax*8]
0x1402e2231: mov r8d, 8
0x1402e2237: call 0x1400021d0
0x1402e223c: mov rax, qword ptr [rbp + 0x298]
0x1402e2243: mov qword ptr [rsi + 0x88], rax
0x1402e224a: mov rcx, qword ptr [rbp + 0x2b0]
0x1402e2251: mov qword ptr [rsi + 0x90], rcx
0x1402e2258: mov rbx, rsi
0x1402e225b: mov rax, qword ptr [rbp + 0x290]
0x1402e2262: mov qword ptr [rsi + 0x98], rax
0x1402e2269: cmp qword ptr [rbp + 0x260], 0
0x1402e2271: je 0x1402e24d2
0x1402e2277: lea rax, [rax + rax*8]
0x1402e227b: shl rax, 4
0x1402e227f: add rax, rcx
0x1402e2282: mov qword ptr [rbp + 0x50], rcx
0x1402e2286: mov qword ptr [rbp + 0x58], rax
0x1402e228a: lea rax, [rbp + 0x250]
0x1402e2291: mov qword ptr [rbp + 0x60], rax
0x1402e2295: lea rcx, [rbp + 0x150]
0x1402e229c: lea rdx, [rbp + 0x50]
0x1402e22a0: call 0x1400feda0
0x1402e22a5: nop 
0x1402e22a6: mov rax, qword ptr [rbp + 0x258]
0x1402e22ad: mov rcx, qword ptr [rbp + 0x260]
0x1402e22b4: lea rcx, [rcx + rcx*8]
0x1402e22b8: shl rcx, 4
0x1402e22bc: add rcx, rax
0x1402e22bf: mov qword ptr [rbp + 0x50], rax
0x1402e22c3: mov qword ptr [rbp + 0x58], rcx
0x1402e22c7: mov qword ptr [rbp + 0x60], r13
0x1402e22cb: mov byte ptr [rbp + 0x2f7], 1
0x1402e22d2: lea rcx, [rbp + 0x138]
0x1402e22d9: lea rdx, [rbp + 0x50]
0x1402e22dd: call 0x1400ff0f0
0x1402e22e2: nop 
0x1402e22e3: mov r13, qword ptr [rbp + 0x150]
0x1402e22ea: mov r15, qword ptr [rbp + 0x158]
0x1402e22f1: mov rax, qword ptr [rbp + 0x160]
0x1402e22f8: lea rcx, [rax + rax*2]
0x1402e22fc: lea r14, [r15 + rcx*8]
0x1402e2300: mov qword ptr [rbp + 0x1f0], r15
0x1402e2307: mov qword ptr [rbp + 0x200], r13
0x1402e230e: mov qword ptr [rbp + 0x208], r14
0x1402e2315: mov rdi, r15
0x1402e2318: test rax, rax
0x1402e231b: je 0x1402e2475
0x1402e2321: lea rdi, [r15 + 0x18]
0x1402e2325: jmp 0x1402e2343
0x1402e2327: mov rdi, qword ptr [rbp + 0x2f8]
0x1402e232e: lea rax, [rdi - 0x18]
0x1402e2332: add rdi, 0x18
0x1402e2336: add rax, 0x18
0x1402e233a: cmp rax, r14
0x1402e233d: je 0x1402e24e2
0x1402e2343: mov rax, qword ptr [rdi - 0x18]
0x1402e2347: movdqu xmm0, xmmword ptr [rdi - 0x10]
0x1402e234c: movdqa xmmword ptr [rbp + 0x1e0], xmm0
0x1402e2354: cmp rax, -1
0x1402e2358: je 0x1402e2475
0x1402e235e: mov qword ptr [rbp + 0x2f8], rdi
0x1402e2365: mov qword ptr [rbp + 0x2b8], rax
0x1402e236c: movdqa xmm0, xmmword ptr [rbp + 0x1e0]
0x1402e2374: movdqu xmmword ptr [r12], xmm0
0x1402e237a: mov eax, dword ptr [rbp + 0x304]
0x1402e2380: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e2387: mov dword ptr [rcx], eax
0x1402e2389: mov edx, 0x18
0x1402e238e: lea rcx, [rip + 0x5f9663b]
0x1402e2395: call 0x145be8220
0x1402e239a: nop 
0x1402e239b: mov r8, rdx
0x1402e239e: lea rcx, [rip + 0x5f965e9]
0x1402e23a5: mov qword ptr [rbp + 0x268], rcx
0x1402e23ac: mov qword ptr [rbp + 0x270], 4
0x1402e23b7: lea rcx, [rbp + 0x2b8]
0x1402e23be: mov qword ptr [rbp + 0x278], rcx
0x1402e23c5: lea rcx, [rip + 0x5f95f44]
0x1402e23cc: mov qword ptr [rbp + 0x280], rcx
0x1402e23d3: mov qword ptr [rsp + 0x20], 1
0x1402e23dc: lea rcx, [rbp + 0x168]
0x1402e23e3: mov rdx, rax
0x1402e23e6: lea r9, [rbp + 0x268]
0x1402e23ed: call 0x145be86b0
0x1402e23f2: nop 
0x1402e23f3: mov qword ptr [rbp + 0x80], 0
0x1402e23fe: mov qword ptr [rbp + 0x50], 0
0x1402e2406: mov qword ptr [rbp + 0x58], 1
0x1402e240e: mov qword ptr [rbp + 0x60], 0
0x1402e2416: mov byte ptr [rbp + 0x8a], 0
0x1402e241d: mov rax, qword ptr [rbp + 0x178]
0x1402e2424: lea rcx, [rbp + 0x68]
0x1402e2428: mov qword ptr [rcx + 0x10], rax
0x1402e242c: movdqu xmm0, xmmword ptr [rbp + 0x168]
0x1402e2434: movdqu xmmword ptr [rcx], xmm0
0x1402e2438: mov word ptr [rbp + 0x88], 0x100
0x1402e2441: mov rcx, rbx
0x1402e2444: lea rdx, [rbp + 0x50]
0x1402e2448: call 0x1402af200
0x1402e244d: nop 
0x1402e244e: mov rdx, qword ptr [rbp + 0x2b8]
0x1402e2455: test rdx, rdx
0x1402e2458: je 0x1402e2327
0x1402e245e: mov rcx, qword ptr [rbp + 0x2c0]
0x1402e2465: mov r8d, 1
0x1402e246b: call 0x1400021d0
0x1402e2470: jmp 0x1402e2327
0x1402e2475: mov rsi, r12
0x1402e2478: mov rax, r14
0x1402e247b: sub rax, rdi
0x1402e247e: movabs rcx, 0xaaaaaaaaaaaaaaab
0x1402e2488: mul rcx
0x1402e248b: mov qword ptr [rbp + 0x1f8], rdi
0x1402e2492: cmp r14, rdi
0x1402e2495: je 0x1402e24e5
0x1402e2497: mov r12, rdx
0x1402e249a: shr r12, 4
0x1402e249e: add rdi, 8
0x1402e24a2: jmp 0x1402e24b9
0x1402e24a4: nop word ptr cs:[rax + rax]
0x1402e24b0: add rdi, 0x18
0x1402e24b4: dec r12
0x1402e24b7: je 0x1402e24e5
0x1402e24b9: mov rdx, qword ptr [rdi - 8]
0x1402e24bd: test rdx, rdx
0x1402e24c0: je 0x1402e24b0
0x1402e24c2: mov rcx, qword ptr [rdi]
0x1402e24c5: mov r8d, 1
0x1402e24cb: call 0x1400021d0
0x1402e24d0: jmp 0x1402e24b0
0x1402e24d2: mov qword ptr [rbp + 0x2d8], 0
0x1402e24dd: jmp 0x1402e2747
0x1402e24e2: mov rsi, r12
0x1402e24e5: test r13, r13
0x1402e24e8: je 0x1402e2507
0x1402e24ea: shl r13, 3
0x1402e24ee: lea rdx, [r13*2]
0x1402e24f6: add rdx, r13
0x1402e24f9: mov r8d, 8
0x1402e24ff: mov rcx, r15
0x1402e2502: call 0x1400021d0
0x1402e2507: mov rdi, qword ptr [rbp + 0x138]
0x1402e250e: mov r15, qword ptr [rbp + 0x140]
0x1402e2515: mov rax, qword ptr [rbp + 0x148]
0x1402e251c: lea rcx, [rax + rax*2]
0x1402e2520: lea r14, [r15 + rcx*8]
0x1402e2524: mov qword ptr [rbp + 0x1f0], r15
0x1402e252b: mov qword ptr [rbp + 0x200], rdi
0x1402e2532: mov qword ptr [rbp + 0x208], r14
0x1402e2539: mov rbx, r15
0x1402e253c: test rax, rax
0x1402e253f: mov r12, qword ptr [rbp + 0x2d0]
0x1402e2546: je 0x1402e26a1
0x1402e254c: lea rbx, [r15 + 0x18]
0x1402e2550: lea r13, [rip + 0x5f96463]
0x1402e2557: jmp 0x1402e2575
0x1402e2559: mov rbx, qword ptr [rbp + 0x2f8]
0x1402e2560: lea rax, [rbx - 0x18]
0x1402e2564: add rbx, 0x18
0x1402e2568: add rax, 0x18
0x1402e256c: cmp rax, r14
0x1402e256f: je 0x1402e2702
0x1402e2575: mov rax, qword ptr [rbx - 0x18]
0x1402e2579: movdqu xmm0, xmmword ptr [rbx - 0x10]
0x1402e257e: movdqa xmmword ptr [rbp + 0x1e0], xmm0
0x1402e2586: cmp rax, -1
0x1402e258a: je 0x1402e26a1
0x1402e2590: mov qword ptr [rbp + 0x2f8], rbx
0x1402e2597: mov qword ptr [rbp + 0x2b8], rax
0x1402e259e: movdqa xmm0, xmmword ptr [rbp + 0x1e0]
0x1402e25a6: movdqu xmmword ptr [rsi], xmm0
0x1402e25aa: mov eax, dword ptr [rbp + 0x304]
0x1402e25b0: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e25b7: mov dword ptr [rcx], eax
0x1402e25b9: mov edx, 0x16
0x1402e25be: mov rcx, r13
0x1402e25c1: call 0x145be8220
0x1402e25c6: nop 
0x1402e25c7: mov r8, rdx
0x1402e25ca: lea rcx, [rip + 0x5f963bd]
0x1402e25d1: mov qword ptr [rbp + 0x268], rcx
0x1402e25d8: mov qword ptr [rbp + 0x270], 4
0x1402e25e3: lea rcx, [rbp + 0x2b8]
0x1402e25ea: mov qword ptr [rbp + 0x278], rcx
0x1402e25f1: lea rcx, [rip + 0x5f95d18]
0x1402e25f8: mov qword ptr [rbp + 0x280], rcx
0x1402e25ff: mov qword ptr [rsp + 0x20], 1
0x1402e2608: lea rcx, [rbp + 0x168]
0x1402e260f: mov rdx, rax
0x1402e2612: lea r9, [rbp + 0x268]
0x1402e2619: call 0x145be86b0
0x1402e261e: nop 
0x1402e261f: mov qword ptr [rbp + 0x80], 0
0x1402e262a: mov qword ptr [rbp + 0x50], 0
0x1402e2632: mov qword ptr [rbp + 0x58], 1
0x1402e263a: mov qword ptr [rbp + 0x60], 0
0x1402e2642: mov byte ptr [rbp + 0x8a], 0
0x1402e2649: mov rax, qword ptr [rbp + 0x178]
0x1402e2650: lea rcx, [rbp + 0x68]
0x1402e2654: mov qword ptr [rcx + 0x10], rax
0x1402e2658: movdqu xmm0, xmmword ptr [rbp + 0x168]
0x1402e2660: movdqu xmmword ptr [rcx], xmm0
0x1402e2664: mov word ptr [rbp + 0x88], 0x100
0x1402e266d: mov rcx, r12
0x1402e2670: lea rdx, [rbp + 0x50]
0x1402e2674: call 0x1402af200
0x1402e2679: nop 
0x1402e267a: mov rdx, qword ptr [rbp + 0x2b8]
0x1402e2681: test rdx, rdx
0x1402e2684: je 0x1402e2559
0x1402e268a: mov rcx, qword ptr [rbp + 0x2c0]
0x1402e2691: mov r8d, 1
0x1402e2697: call 0x1400021d0
0x1402e269c: jmp 0x1402e2559
0x1402e26a1: mov rax, r14
0x1402e26a4: sub rax, rbx
0x1402e26a7: movabs rcx, 0xaaaaaaaaaaaaaaab
0x1402e26b1: mul rcx
0x1402e26b4: mov qword ptr [rbp + 0x1f8], rbx
0x1402e26bb: cmp r14, rbx
0x1402e26be: lea r13, [rbp - 0x10]
0x1402e26c2: lea r14, [rip + 0x5f962c9]
0x1402e26c9: je 0x1402e270d
0x1402e26cb: mov r12, rdx
0x1402e26ce: shr r12, 4
0x1402e26d2: add rbx, 8
0x1402e26d6: jmp 0x1402e26e9
0x1402e26d8: nop dword ptr [rax + rax]
0x1402e26e0: add rbx, 0x18
0x1402e26e4: dec r12
0x1402e26e7: je 0x1402e270d
0x1402e26e9: mov rdx, qword ptr [rbx - 8]
0x1402e26ed: test rdx, rdx
0x1402e26f0: je 0x1402e26e0
0x1402e26f2: mov rcx, qword ptr [rbx]
0x1402e26f5: mov r8d, 1
0x1402e26fb: call 0x1400021d0
0x1402e2700: jmp 0x1402e26e0
0x1402e2702: lea r13, [rbp - 0x10]
0x1402e2706: lea r14, [rip + 0x5f96285]
0x1402e270d: test rdi, rdi
0x1402e2710: mov rbx, qword ptr [rbp + 0x2d0]
0x1402e2717: je 0x1402e272f
0x1402e2719: shl rdi, 3
0x1402e271d: lea rdx, [rdi + rdi*2]
0x1402e2721: mov r8d, 8
0x1402e2727: mov rcx, r15
0x1402e272a: call 0x1400021d0
0x1402e272f: mov rax, qword ptr [rbp + 0x260]
0x1402e2736: mov qword ptr [rbp + 0x2d8], rax
0x1402e273d: mov r12, rsi
0x1402e2740: lea r15, [rbp + 0x230]
0x1402e2747: mov rcx, qword ptr [rbp + 0x258]
0x1402e274e: mov qword ptr [rbp + 0x2b0], rcx
0x1402e2755: mov qword ptr [rbp + 0x2f8], 0
0x1402e2760: mov rax, qword ptr [rbp + 0x2f8]
0x1402e2767: cmp qword ptr [rbp + 0x2d8], rax
0x1402e276e: je 0x1402e278c
0x1402e2770: inc rax
0x1402e2773: mov qword ptr [rbp + 0x2f8], rax
0x1402e277a: lea rsi, [rcx + 0x90]
0x1402e2781: call 0x1400eaf60
0x1402e2786: nop 
0x1402e2787: mov rcx, rsi
0x1402e278a: jmp 0x1402e2760
0x1402e278c: mov rax, qword ptr [rbp + 0x250]
0x1402e2793: test rax, rax
0x1402e2796: je 0x1402e2058
0x1402e279c: mov rcx, qword ptr [rbp + 0x258]
0x1402e27a3: shl rax, 4
0x1402e27a7: lea rdx, [rax + rax*8]
0x1402e27ab: mov r8d, 8
0x1402e27b1: call 0x1400021d0
0x1402e27b6: jmp 0x1402e2058
0x1402e27bb: mov rcx, qword ptr [rbp + 0x2e8]
0x1402e27c2: mov eax, dword ptr [rcx]
0x1402e27c4: mov edx, 0x736f6c63
0x1402e27c9: xor eax, edx
0x1402e27cb: movzx ecx, word ptr [rcx + 4]
0x1402e27cf: xor ecx, 0x6465
0x1402e27d5: or ecx, eax
0x1402e27d7: jne 0x1402e28ed
0x1402e27dd: jmp 0x1402e2855
0x1402e27df: mov rcx, qword ptr [rbp + 0x2e8]
0x1402e27e6: mov eax, dword ptr [rcx]
0x1402e27e8: mov edx, 0x65646e65
0x1402e27ed: xor eax, edx
0x1402e27ef: movzx ecx, byte ptr [rcx + 4]
0x1402e27f3: xor ecx, 0x64
0x1402e27f6: or ecx, eax
0x1402e27f8: jne 0x1402e2914
0x1402e27fe: jmp 0x1402e2855
0x1402e2800: mov rcx, qword ptr [rbp + 0x2e8]
0x1402e2807: mov eax, dword ptr [rcx]
0x1402e2809: mov edx, 0x75666572
0x1402e280e: xor eax, edx
0x1402e2810: mov ecx, dword ptr [rcx + 3]
0x1402e2813: mov edx, 0x64657375
0x1402e2818: xor ecx, edx
0x1402e281a: or ecx, eax
0x1402e281c: jne 0x1402e2938
0x1402e2822: jmp 0x1402e2855
0x1402e2824: mov rcx, qword ptr [rbp + 0x2e8]
0x1402e282b: mov rax, qword ptr [rcx]
0x1402e282e: movabs rdx, 0x616c696176616e75
0x1402e2838: xor rax, rdx
0x1402e283b: mov rcx, qword ptr [rcx + 3]
0x1402e283f: movabs rdx, 0x656c62616c696176
0x1402e2849: xor rcx, rdx
0x1402e284c: or rcx, rax
0x1402e284f: jne 0x1402e29ca
0x1402e2855: mov eax, dword ptr [rbp + 0x304]
0x1402e285b: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e2862: mov dword ptr [rcx], eax
0x1402e2864: mov r14, qword ptr [rbx + 0x90]
0x1402e286b: mov rsi, qword ptr [rbx + 0x98]
0x1402e2872: mov qword ptr [rbx + 0x98], 0
0x1402e287d: test rsi, rsi
0x1402e2880: je 0x1402e2896
0x1402e2882: mov rcx, r14
0x1402e2885: call 0x1400eaf60
0x1402e288a: add r14, 0x90
0x1402e2891: dec rsi
0x1402e2894: jne 0x1402e2882
0x1402e2896: mov rsi, rdi
0x1402e2899: cmp r15, 8
0x1402e289d: lea r12, [rbp + 0x2c0]
0x1402e28a4: lea r14, [rip + 0x5f960e7]
0x1402e28ab: ja 0x1402e2b23
0x1402e28b1: lea rcx, [rip + 0x5f98198]
0x1402e28b8: movsxd rax, dword ptr [rcx + r15*4]
0x1402e28bc: add rax, rcx
0x1402e28bf: mov rsi, rdi
0x1402e28c2: jmp rax
0x1402e28c4: mov rcx, qword ptr [rbp + 0x2e8]
0x1402e28cb: movzx eax, word ptr [rcx]
0x1402e28ce: xor eax, 0x666f
0x1402e28d3: movzx ecx, byte ptr [rcx + 2]
0x1402e28d7: xor ecx, 0x66
0x1402e28da: mov esi, 3
0x1402e28df: or cx, ax
0x1402e28e2: jne 0x1402e2b23
0x1402e28e8: jmp 0x1402e2a00
0x1402e28ed: mov rcx, qword ptr [rbp + 0x2e8]
0x1402e28f4: mov eax, dword ptr [rcx]
0x1402e28f6: mov edx, 0x736f6c63
0x1402e28fb: xor eax, edx
0x1402e28fd: movzx ecx, word ptr [rcx + 4]
0x1402e2901: xor ecx, 0x6465
0x1402e2907: or ecx, eax
0x1402e2909: jne 0x1402e2abf
0x1402e290f: jmp 0x1402e2a00
0x1402e2914: mov rcx, qword ptr [rbp + 0x2e8]
0x1402e291b: mov eax, dword ptr [rcx]
0x1402e291d: mov edx, 0x65646e65
0x1402e2922: xor eax, edx
0x1402e2924: movzx ecx, byte ptr [rcx + 4]
0x1402e2928: xor ecx, 0x64
0x1402e292b: or ecx, eax
0x1402e292d: jne 0x1402e2ae4
0x1402e2933: jmp 0x1402e2a00
0x1402e2938: mov rcx, qword ptr [rbp + 0x2e8]
0x1402e293f: mov eax, dword ptr [rcx]
0x1402e2941: mov edx, 0x75666572
0x1402e2946: xor eax, edx
0x1402e2948: mov ecx, dword ptr [rcx + 3]
0x1402e294b: mov edx, 0x64657375
0x1402e2950: xor ecx, edx
0x1402e2952: or ecx, eax
0x1402e2954: je 0x1402e2a00
0x1402e295a: mov rcx, qword ptr [rbp + 0x2e8]
0x1402e2961: mov eax, dword ptr [rcx]
0x1402e2963: mov edx, 0x6e696f6a
0x1402e2968: xor eax, edx
0x1402e296a: mov ecx, dword ptr [rcx + 3]
0x1402e296d: mov edx, 0x676e696e
0x1402e2972: xor ecx, edx
0x1402e2974: or ecx, eax
0x1402e2976: je 0x1402e2a00
0x1402e297c: mov rcx, qword ptr [rbp + 0x2e8]
0x1402e2983: mov eax, dword ptr [rcx]
0x1402e2985: mov edx, 0x74736f68
0x1402e298a: xor eax, edx
0x1402e298c: mov ecx, dword ptr [rcx + 3]
0x1402e298f: mov edx, 0x676e6974
0x1402e2994: xor ecx, edx
0x1402e2996: mov esi, 7
0x1402e299b: or ecx, eax
0x1402e299d: jne 0x1402e2b23
0x1402e29a3: cmp qword ptr [rbx + 0x20], 7
0x1402e29a8: jne 0x1402e2a00
0x1402e29aa: mov rax, qword ptr [rbx + 0x18]
0x1402e29ae: mov ecx, dword ptr [rax]
0x1402e29b0: mov edx, 0x74736f68
0x1402e29b5: xor ecx, edx
0x1402e29b7: mov eax, dword ptr [rax + 3]
0x1402e29ba: mov edx, 0x676e6974
0x1402e29bf: xor eax, edx
0x1402e29c1: or eax, ecx
0x1402e29c3: jne 0x1402e2a00
0x1402e29c5: jmp 0x1402e2b23
0x1402e29ca: mov rcx, qword ptr [rbp + 0x2e8]
0x1402e29d1: mov rax, qword ptr [rcx]
0x1402e29d4: movabs rdx, 0x616c696176616e75
0x1402e29de: xor rax, rdx
0x1402e29e1: mov rcx, qword ptr [rcx + 3]
0x1402e29e5: movabs rdx, 0x656c62616c696176
0x1402e29ef: xor rcx, rdx
0x1402e29f2: mov esi, 0xb
0x1402e29f7: or rcx, rax
0x1402e29fa: jne 0x1402e2b23
0x1402e2a00: mov rdi, r14
0x1402e2a03: mov eax, dword ptr [rbp + 0x304]
0x1402e2a09: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e2a10: mov dword ptr [rcx], eax
0x1402e2a12: mov rax, rbx
0x1402e2a15: mov rsi, qword ptr [rbx + 0x150]
0x1402e2a1c: mov r14, qword ptr [rbx + 0x158]
0x1402e2a23: mov qword ptr [rbx + 0x158], 0
0x1402e2a2e: test r14, r14
0x1402e2a31: je 0x1402e2a79
0x1402e2a33: add rsi, 0x20
0x1402e2a37: jmp 0x1402e2a42
0x1402e2a39: add rsi, 0x40
0x1402e2a3d: dec r14
0x1402e2a40: je 0x1402e2a79
0x1402e2a42: mov rdx, qword ptr [rsi - 0x20]
0x1402e2a46: test rdx, rdx
0x1402e2a49: je 0x1402e2a5d
0x1402e2a4b: mov rcx, qword ptr [rsi - 0x18]
0x1402e2a4f: mov r8d, 1
0x1402e2a55: call 0x1400021d0
0x1402e2a5a: mov rax, rbx
0x1402e2a5d: mov rdx, qword ptr [rsi - 8]
0x1402e2a61: test rdx, rdx
0x1402e2a64: je 0x1402e2a39
0x1402e2a66: mov rcx, qword ptr [rsi]
0x1402e2a69: mov r8d, 1
0x1402e2a6f: call 0x1400021d0
0x1402e2a74: mov rax, rbx
0x1402e2a77: jmp 0x1402e2a39
0x1402e2a79: mov qword ptr [rax + 0x170], 0
0x1402e2a84: mov qword ptr [rax + 0x1a0], 0
0x1402e2a8f: movdqu xmm0, xmmword ptr [rax + 0x190]
0x1402e2a97: psubq xmm0, xmm6
0x1402e2a9b: movdqu xmmword ptr [rax + 0x190], xmm0
0x1402e2aa3: mov rax, qword ptr [rbp + 0x2f8]
0x1402e2aaa: cmp rax, 5
0x1402e2aae: mov r14, rdi
0x1402e2ab1: mov rdi, rax
0x1402e2ab4: je 0x1402e2ae4
0x1402e2ab6: mov rsi, rdi
0x1402e2ab9: cmp rdi, 6
0x1402e2abd: jne 0x1402e2b23
0x1402e2abf: mov rcx, qword ptr [rbp + 0x2e8]
0x1402e2ac6: mov eax, dword ptr [rcx]
0x1402e2ac8: mov edx, 0x736f6c63
0x1402e2acd: xor eax, edx
0x1402e2acf: movzx ecx, word ptr [rcx + 4]
0x1402e2ad3: xor ecx, 0x6465
0x1402e2ad9: mov esi, 6
0x1402e2ade: or ecx, eax
0x1402e2ae0: jne 0x1402e2b23
0x1402e2ae2: jmp 0x1402e2b04
0x1402e2ae4: mov rcx, qword ptr [rbp + 0x2e8]
0x1402e2aeb: mov eax, dword ptr [rcx]
0x1402e2aed: mov edx, 0x65646e65
0x1402e2af2: xor eax, edx
0x1402e2af4: movzx ecx, byte ptr [rcx + 4]
0x1402e2af8: xor ecx, 0x64
0x1402e2afb: or ecx, eax
0x1402e2afd: mov esi, 5
0x1402e2b02: jne 0x1402e2b23
0x1402e2b04: mov dword ptr [rbp + 0x50], 0x16
0x1402e2b0b: mov rcx, qword ptr [rbp + 0x1b8]
0x1402e2b12: lea rdx, [rbp + 0x50]
0x1402e2b16: call 0x140246550
0x1402e2b1b: nop 
0x1402e2b1c: mov rdi, qword ptr [rbp + 0x2f8]
0x1402e2b23: mov r8, rbx
0x1402e2b26: cmp qword ptr [rbx + 0x38], 7
0x1402e2b2b: jb 0x1402e2b7b
0x1402e2b2d: mov rax, qword ptr [r8 + 0x30]
0x1402e2b31: mov ecx, dword ptr [rax]
0x1402e2b33: mov edx, 0x6b636f6c
0x1402e2b38: xor ecx, edx
0x1402e2b3a: mov eax, dword ptr [rax + 3]
0x1402e2b3d: mov edx, 0x3a64656b
0x1402e2b42: xor eax, edx
0x1402e2b44: or eax, ecx
0x1402e2b46: jne 0x1402e2b7b
0x1402e2b48: mov eax, dword ptr [rbp + 0x304]
0x1402e2b4e: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e2b55: mov dword ptr [rcx], eax
0x1402e2b57: mov byte ptr [r8 + 0x1b4], 1
0x1402e2b5f: mov eax, dword ptr [rbp + 0x21c]
0x1402e2b65: mov rcx, qword ptr [rbp + 0x1a8]
0x1402e2b6c: mov dword ptr [rcx], eax
0x1402e2b6e: mov rax, qword ptr [rbp + 0x1b0]
0x1402e2b75: mov dword ptr [rax], 0
0x1402e2b7b: mov eax, dword ptr [rbp + 0x304]
0x1402e2b81: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e2b88: mov dword ptr [rcx], eax
0x1402e2b8a: mov rdx, qword ptr [r8 + 0x10]
0x1402e2b8e: test rdx, rdx
0x1402e2b91: lea r15, [rbp + 0x230]
0x1402e2b98: je 0x1402e2bac
0x1402e2b9a: mov rcx, qword ptr [r8 + 0x18]
0x1402e2b9e: mov r8d, 1
0x1402e2ba4: call 0x1400021d0
0x1402e2ba9: mov r8, rbx
0x1402e2bac: mov qword ptr [r8 + 0x10], rdi
0x1402e2bb0: mov rax, qword ptr [rbp + 0x2e8]
0x1402e2bb7: mov qword ptr [r8 + 0x18], rax
0x1402e2bbb: mov qword ptr [r8 + 0x20], rsi
0x1402e2bbf: jmp 0x1402e2058
0x1402e2bc4: mov rsi, rax
0x1402e2bc7: jmp 0x1402e1cbf
0x1402e2bcc: cmp rdx, 0x15
0x1402e2bd0: jae 0x1402e2be6
0x1402e2bd2: mov r8d, 1
0x1402e2bd8: lea r9, [rbp + 0x50]
0x1402e2bdc: call 0x14000ba20
0x1402e2be1: jmp 0x1402e2058
0x1402e2be6: lea r8, [rbp + 0x50]
0x1402e2bea: call 0x1400083e0
0x1402e2bef: nop 
0x1402e2bf0: jmp 0x1402e2058
0x1402e2bf5: mov eax, 1
0x1402e2bfa: mov qword ptr [rbp + 0x2e8], rax
0x1402e2c01: mov qword ptr [rbp + 0x2f8], 0
0x1402e2c0c: lea r12, [rbp + 0x2c0]
0x1402e2c13: lea r15, [rbp + 0x230]
0x1402e2c1a: lea r14, [rip + 0x5f95d71]
0x1402e2c21: jmp 0x1402e1746
0x1402e2c26: xor r15d, r15d
0x1402e2c29: mov edi, 1
0x1402e2c2e: lea r12, [rbp + 0x2c0]
0x1402e2c35: lea r14, [rip + 0x5f95d56]
0x1402e2c3c: jmp 0x1402e17c7
0x1402e2c41: mov eax, 1
0x1402e2c46: mov qword ptr [rbp + 0x2a0], rax
0x1402e2c4d: mov qword ptr [rbp + 0x2f8], 0
0x1402e2c58: lea r12, [rbp + 0x2c0]
0x1402e2c5f: lea r15, [rbp + 0x230]
0x1402e2c66: lea r14, [rip + 0x5f95d25]
0x1402e2c6d: jmp 0x1402e1d5b
0x1402e2c72: xor r15d, r15d
0x1402e2c75: mov edi, 1
0x1402e2c7a: lea r12, [rbp + 0x2c0]
0x1402e2c81: lea r14, [rip + 0x5f95d0a]
0x1402e2c88: jmp 0x1402e18df
0x1402e2c8d: mov edi, 1
0x1402e2c92: xor r15d, r15d
0x1402e2c95: lea r12, [rbp + 0x2c0]
0x1402e2c9c: lea r14, [rip + 0x5f95cef]
0x1402e2ca3: jmp 0x1402e19ef
0x1402e2ca8: mov eax, 1
0x1402e2cad: mov qword ptr [rbp + 0x2a8], rax
0x1402e2cb4: mov qword ptr [rbp + 0x2d8], 0
0x1402e2cbf: mov rbx, r12
0x1402e2cc2: lea r13, [rbp - 0x10]
0x1402e2cc6: lea r12, [rbp + 0x2c0]
0x1402e2ccd: jmp 0x1402e1e30
0x1402e2cd2: xor r15d, r15d
0x1402e2cd5: mov edi, 1
0x1402e2cda: lea r12, [rbp + 0x2c0]
0x1402e2ce1: lea r14, [rip + 0x5f95caa]
0x1402e2ce8: jmp 0x1402e1b95
0x1402e2ced: xor r15d, r15d
0x1402e2cf0: mov edi, 1
0x1402e2cf5: lea r12, [rbp + 0x2c0]
0x1402e2cfc: lea r14, [rip + 0x5f95c8f]
0x1402e2d03: jmp 0x1402e2084
0x1402e2d08: lea rcx, [rbp + 0x180]
0x1402e2d0f: call 0x140108480
0x1402e2d14: movaps xmm6, xmmword ptr [rbp + 0x310]
0x1402e2d1b: add rsp, 0x3a8
0x1402e2d22: pop rbx
0x1402e2d23: pop rdi
0x1402e2d24: pop rsi
0x1402e2d25: pop r12
0x1402e2d27: pop r13
0x1402e2d29: pop r14
0x1402e2d2b: pop r15
0x1402e2d2d: pop rbp
0x1402e2d2e: ret 
0x1402e2d2f: xor ecx, ecx
0x1402e2d31: call 0x14620896b
0x1402e2d36: nop 
0x1402e2d37: jmp 0x1402e2dbc
0x1402e2d3c: xor ecx, ecx
0x1402e2d3e: mov rdx, qword ptr [rbp + 0x2e8]
0x1402e2d45: call 0x14620896b
0x1402e2d4a: nop 
0x1402e2d4b: jmp 0x1402e2dbc
0x1402e2d4d: xor ecx, ecx
0x1402e2d4f: mov rdx, qword ptr [rbp + 0x2a0]
0x1402e2d56: call 0x14620896b
0x1402e2d5b: nop 
0x1402e2d5c: jmp 0x1402e2dbc
0x1402e2d5e: xor esi, esi
0x1402e2d60: mov rcx, rsi
0x1402e2d63: mov rdx, r14
0x1402e2d66: call 0x14620896b
0x1402e2d6b: nop 
0x1402e2d6c: jmp 0x1402e2dbc
0x1402e2d6e: xor ecx, ecx
0x1402e2d70: call 0x14620896b
0x1402e2d75: nop 
0x1402e2d76: jmp 0x1402e2dbc
0x1402e2d78: xor ecx, ecx
0x1402e2d7a: mov rdx, qword ptr [rbp + 0x210]
0x1402e2d81: call 0x14620896b
0x1402e2d86: nop 
0x1402e2d87: jmp 0x1402e2dbc
0x1402e2d89: xor ecx, ecx
0x1402e2d8b: mov rdx, qword ptr [rbp + 0x2a8]
0x1402e2d92: call 0x14620896b
0x1402e2d97: nop 
0x1402e2d98: jmp 0x1402e2dbc
0x1402e2d9a: xor ecx, ecx
0x1402e2d9c: call 0x14620896b
0x1402e2da1: nop 
0x1402e2da2: jmp 0x1402e2dbc
0x1402e2da4: xor esi, esi
0x1402e2da6: mov rcx, rsi
0x1402e2da9: mov rdx, r14
0x1402e2dac: call 0x14620896b
0x1402e2db1: nop 
0x1402e2db2: jmp 0x1402e2dbc
0x1402e2db4: xor ecx, ecx
0x1402e2db6: call 0x14620896b
0x1402e2dbb: nop 
0x1402e2dbc: ud2 
0x1402e2dbe: mov rdx, r15
0x1402e2dc1: mov ecx, 1
0x1402e2dc6: jmp 0x1402e2d31
0x1402e2dcb: mov qword ptr [rbp + 0x210], r15
0x1402e2dd2: mov ecx, 1
0x1402e2dd7: jmp 0x1402e2d7a
0x1402e2dd9: mov rax, qword ptr [rbp + 0x2f8]
0x1402e2de0: mov qword ptr [rbp + 0x2a0], rax
0x1402e2de7: mov ecx, 1
0x1402e2dec: jmp 0x1402e2d4f
0x1402e2df1: mov rax, qword ptr [rbp + 0x2d8]
0x1402e2df8: mov qword ptr [rbp + 0x2a8], rax
0x1402e2dff: mov ecx, 1
0x1402e2e04: jmp 0x1402e2d8b
0x1402e2e06: mov rax, qword ptr [rbp + 0x2f8]
0x1402e2e0d: mov qword ptr [rbp + 0x2e8], rax
0x1402e2e14: mov ecx, 1
0x1402e2e19: jmp 0x1402e2d3e
0x1402e2e1e: mov rdx, r15
0x1402e2e21: mov ecx, 1
0x1402e2e26: jmp 0x1402e2d70
0x1402e2e2b: mov rdx, r15
0x1402e2e2e: mov ecx, 1
0x1402e2e33: jmp 0x1402e2d9c
0x1402e2e38: mov rdx, r15
0x1402e2e3b: mov ecx, 1
0x1402e2e40: jmp 0x1402e2db6
