1401c179f: 66c78424860000000000 mov word ptr [rsp + 0x86], 0
1401c17a9: c784248200000000000000 mov dword ptr [rsp + 0x82], 0
1401c17b4: c784249a00000000000000 mov dword ptr [rsp + 0x9a], 0
1401c17bf: 66c784249e0000000000 mov word ptr [rsp + 0x9e], 0
1401c17c9: c78424b800000016000000 mov dword ptr [rsp + 0xb8], 0x16
1401c17d4: c744247800000000 mov dword ptr [rsp + 0x78], 0
1401c17dc: 66c78424800000000163 mov word ptr [rsp + 0x80], 0x6301
1401c17e6: 66c78424c40000000000 mov word ptr [rsp + 0xc4], 0
1401c17f0: 0f57f6 xorps xmm6, xmm6
1401c17f3: 0f11b42488000000 movups xmmword ptr [rsp + 0x88], xmm6
1401c17fb: 66c78424980000000163 mov word ptr [rsp + 0x98], 0x6301
1401c1805: 0f11b424a0000000 movups xmmword ptr [rsp + 0xa0], xmm6
1401c180d: 48898424b0000000 mov qword ptr [rsp + 0xb0], rax
1401c1815: 8bbc2414020000 mov edi, dword ptr [rsp + 0x214]
1401c181c: 4c8bbc2408020000 mov r15, qword ptr [rsp + 0x208]
1401c1824: 41893f mov dword ptr [r15], edi
1401c1827: 4c8ba424f8010000 mov r12, qword ptr [rsp + 0x1f8]
1401c182f: 498b4c2440 mov rcx, qword ptr [r12 + 0x40]
1401c1834: 48894c2470 mov qword ptr [rsp + 0x70], rcx
1401c1839: 498d742420 lea rsi, [r12 + 0x20]
1401c183e: 488d542470 lea rdx, [rsp + 0x70]
1401c1843: 4889f1 mov rcx, rsi
1401c1846: 4989c5 mov r13, rax
1401c1849: e812fbe4ff call 0x140011360
1401c184e: 49ff442440 inc qword ptr [r12 + 0x40]
1401c1853: 66c78424860000000000 mov word ptr [rsp + 0x86], 0
1401c185d: c784248200000000000000 mov dword ptr [rsp + 0x82], 0
1401c1868: 41893f mov dword ptr [r15], edi
1401c186b: 498b442440 mov rax, qword ptr [r12 + 0x40]
1401c1870: 4889442470 mov qword ptr [rsp + 0x70], rax
1401c1875: c744247800000000 mov dword ptr [rsp + 0x78], 0
1401c187d: 66c78424800000000163 mov word ptr [rsp + 0x80], 0x6301
1401c1887: 0f11b42488000000 movups xmmword ptr [rsp + 0x88], xmm6
1401c188f: c6842498000000ff mov byte ptr [rsp + 0x98], 0xff
1401c1897: 4c89ac24b0000000 mov qword ptr [rsp + 0xb0], r13
1401c189f: c78424b800000016000000 mov dword ptr [rsp + 0xb8], 0x16
1401c18aa: 66c78424c40000000100 mov word ptr [rsp + 0xc4], 1
1401c18b4: 488d542470 lea rdx, [rsp + 0x70]
1401c18b9: 4889f1 mov rcx, rsi
1401c18bc: e89ffae4ff call 0x140011360
1401c18c1: 49ff442440 inc qword ptr [r12 + 0x40]
1401c18c6: 41892e mov dword ptr [r14], ebp
