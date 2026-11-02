1401c352f: 66c78424860000000000 mov word ptr [rsp + 0x86], 0
1401c3539: c784248200000000000000 mov dword ptr [rsp + 0x82], 0
1401c3544: c784249a00000000000000 mov dword ptr [rsp + 0x9a], 0
1401c354f: 66c784249e0000000000 mov word ptr [rsp + 0x9e], 0
1401c3559: c78424b800000016000000 mov dword ptr [rsp + 0xb8], 0x16
1401c3564: c744247800000000 mov dword ptr [rsp + 0x78], 0
1401c356c: 66c78424800000000163 mov word ptr [rsp + 0x80], 0x6301
1401c3576: 66c78424c40000000000 mov word ptr [rsp + 0xc4], 0
1401c3580: 0f57f6 xorps xmm6, xmm6
1401c3583: 0f11b42488000000 movups xmmword ptr [rsp + 0x88], xmm6
1401c358b: 66c78424980000000163 mov word ptr [rsp + 0x98], 0x6301
1401c3595: 0f11b424a0000000 movups xmmword ptr [rsp + 0xa0], xmm6
1401c359d: 48898424b0000000 mov qword ptr [rsp + 0xb0], rax
1401c35a5: 8bbc2414020000 mov edi, dword ptr [rsp + 0x214]
1401c35ac: 4c8bbc2408020000 mov r15, qword ptr [rsp + 0x208]
1401c35b4: 41893f mov dword ptr [r15], edi
1401c35b7: 4c8ba424f8010000 mov r12, qword ptr [rsp + 0x1f8]
1401c35bf: 498b4c2440 mov rcx, qword ptr [r12 + 0x40]
1401c35c4: 48894c2470 mov qword ptr [rsp + 0x70], rcx
1401c35c9: 498d742420 lea rsi, [r12 + 0x20]
1401c35ce: 488d542470 lea rdx, [rsp + 0x70]
1401c35d3: 4889f1 mov rcx, rsi
1401c35d6: 4989c5 mov r13, rax
1401c35d9: e882fffbff call 0x140183560
1401c35de: 49ff442440 inc qword ptr [r12 + 0x40]
1401c35e3: 66c78424860000000000 mov word ptr [rsp + 0x86], 0
1401c35ed: c784248200000000000000 mov dword ptr [rsp + 0x82], 0
1401c35f8: 41893f mov dword ptr [r15], edi
1401c35fb: 498b442440 mov rax, qword ptr [r12 + 0x40]
1401c3600: 4889442470 mov qword ptr [rsp + 0x70], rax
1401c3605: c744247800000000 mov dword ptr [rsp + 0x78], 0
1401c360d: 66c78424800000000163 mov word ptr [rsp + 0x80], 0x6301
1401c3617: 0f11b42488000000 movups xmmword ptr [rsp + 0x88], xmm6
1401c361f: c6842498000000ff mov byte ptr [rsp + 0x98], 0xff
1401c3627: 4c89ac24b0000000 mov qword ptr [rsp + 0xb0], r13
1401c362f: c78424b800000016000000 mov dword ptr [rsp + 0xb8], 0x16
1401c363a: 66c78424c40000000100 mov word ptr [rsp + 0xc4], 1
1401c3644: 488d542470 lea rdx, [rsp + 0x70]
1401c3649: 4889f1 mov rcx, rsi
1401c364c: e80ffffbff call 0x140183560
1401c3651: 49ff442440 inc qword ptr [r12 + 0x40]
1401c3656: 41892e mov dword ptr [r14], ebp
