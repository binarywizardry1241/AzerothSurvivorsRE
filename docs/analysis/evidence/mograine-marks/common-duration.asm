0x145af1fb0: sub rsp, 0x38
0x145af1fb4: movaps xmmword ptr [rsp + 0x20], xmm6
0x145af1fb9: movzx eax, byte ptr [rcx + 0x2d]
0x145af1fbd: sub al, 3
0x145af1fbf: movzx eax, al
0x145af1fc2: mov edx, 0x1d
0x145af1fc7: cmovae edx, eax
0x145af1fca: xorps xmm0, xmm0
0x145af1fcd: movzx eax, dl
0x145af1fd0: lea rdx, [rip + 0x1552285]
0x145af1fd7: movsxd rax, dword ptr [rdx + rax*4]
0x145af1fdb: add rax, rdx
0x145af1fde: jmp rax
0x145af1fe0: movaps xmm6, xmmword ptr [rsp + 0x20]
0x145af1fe5: add rsp, 0x38
0x145af1fe9: ret 
0x145af1fea: movss xmm0, dword ptr [rcx + 0xc]
0x145af1fef: movaps xmm6, xmmword ptr [rsp + 0x20]
0x145af1ff4: add rsp, 0x38
0x145af1ff8: ret 
0x145af1ff9: movss xmm0, dword ptr [rcx + 8]
0x145af1ffe: movaps xmm6, xmmword ptr [rsp + 0x20]
0x145af2003: add rsp, 0x38
0x145af2007: ret 
0x145af2008: movss xmm0, dword ptr [rcx + 0x10]
0x145af200d: movaps xmm6, xmmword ptr [rsp + 0x20]
0x145af2012: add rsp, 0x38
0x145af2016: ret 
0x145af2017: movss xmm0, dword ptr [rip + 0x780039]
0x145af201f: movaps xmm6, xmmword ptr [rsp + 0x20]
0x145af2024: add rsp, 0x38
0x145af2028: ret 
0x145af2029: mov eax, dword ptr [rcx + 0x14]
0x145af202c: jmp 0x145af2079
0x145af202e: movss xmm0, dword ptr [rcx + 0xc]
0x145af2033: addss xmm0, dword ptr [rcx + 0x10]
0x145af2038: movaps xmm6, xmmword ptr [rsp + 0x20]
0x145af203d: add rsp, 0x38
0x145af2041: ret 
0x145af2042: movss xmm0, dword ptr [rip + 0x780326]
0x145af204a: movaps xmm6, xmmword ptr [rsp + 0x20]
0x145af204f: add rsp, 0x38
0x145af2053: ret 
0x145af2054: mov eax, dword ptr [rcx + 4]
0x145af2057: xorps xmm0, xmm0
0x145af205a: cvtsi2ss xmm0, rax
0x145af205f: mulss xmm0, dword ptr [rip + 0x75aa39]
0x145af2067: addss xmm0, dword ptr [rcx + 0x10]
0x145af206c: movaps xmm6, xmmword ptr [rsp + 0x20]
0x145af2071: add rsp, 0x38
0x145af2075: ret 
0x145af2076: mov eax, dword ptr [rcx + 4]
0x145af2079: xorps xmm0, xmm0
0x145af207c: cvtsi2ss xmm0, rax
0x145af2081: mulss xmm0, dword ptr [rcx + 0x10]
0x145af2086: addss xmm0, dword ptr [rcx + 0xc]
0x145af208b: movaps xmm6, xmmword ptr [rsp + 0x20]
0x145af2090: add rsp, 0x38
0x145af2094: ret 
0x145af2095: movss xmm0, dword ptr [rcx + 4]
0x145af209a: movaps xmm6, xmmword ptr [rsp + 0x20]
0x145af209f: add rsp, 0x38
0x145af20a3: ret 
0x145af20a4: movss xmm0, dword ptr [rcx + 8]
0x145af20a9: addss xmm0, dword ptr [rip + 0x740e0f]
0x145af20b1: movaps xmm6, xmmword ptr [rsp + 0x20]
0x145af20b6: add rsp, 0x38
0x145af20ba: ret 
0x145af20bb: movss xmm0, dword ptr [rcx + 4]
0x145af20c0: addss xmm0, dword ptr [rip + 0x74105c]
0x145af20c8: movaps xmm6, xmmword ptr [rsp + 0x20]
0x145af20cd: add rsp, 0x38
0x145af20d1: ret 
0x145af20d2: movss xmm0, dword ptr [rip + 0x74104a]
0x145af20da: movaps xmm6, xmmword ptr [rsp + 0x20]
0x145af20df: add rsp, 0x38
0x145af20e3: ret 
0x145af20e4: movss xmm0, dword ptr [rcx + 8]
0x145af20e9: divss xmm0, dword ptr [rip + 0x7594ff]
0x145af20f1: movss xmm1, dword ptr [rcx + 0x10]
0x145af20f6: addss xmm0, dword ptr [rip + 0x741026]
0x145af20fe: movaps xmm2, xmm1
0x145af2101: maxss xmm2, xmm0
0x145af2105: movaps xmm0, xmm2
0x145af2108: cmpunordss xmm0, xmm2
0x145af210d: movaps xmm3, xmm0
0x145af2110: andnps xmm3, xmm2
0x145af2113: andps xmm0, xmm1
0x145af2116: orps xmm0, xmm3
0x145af2119: movaps xmm6, xmmword ptr [rsp + 0x20]
0x145af211e: add rsp, 0x38
0x145af2122: ret 
0x145af2123: mov eax, dword ptr [rcx + 8]
0x145af2126: xorps xmm0, xmm0
0x145af2129: cvtsi2ss xmm0, rax
0x145af212e: mulss xmm0, dword ptr [rcx + 0x14]
0x145af2133: addss xmm0, dword ptr [rcx + 0x10]
0x145af2138: movaps xmm6, xmmword ptr [rsp + 0x20]
0x145af213d: add rsp, 0x38
0x145af2141: ret 
0x145af2142: movss xmm0, dword ptr [rcx + 0x10]
0x145af2147: mulss xmm0, dword ptr [rip + 0x740fd5]
0x145af214f: addss xmm0, dword ptr [rip + 0x740d69]
0x145af2157: movaps xmm6, xmmword ptr [rsp + 0x20]
0x145af215c: add rsp, 0x38
0x145af2160: ret 
0x145af2161: mov rdx, qword ptr [rcx + 8]
0x145af2165: test rdx, rdx
0x145af2168: je 0x145af1fe0
0x145af216e: dec rdx
0x145af2171: lea rax, [rdx + rdx*2]
0x145af2175: shl rax, 4
0x145af2179: add rax, qword ptr [rcx]
0x145af217c: test rdx, rdx
0x145af217f: js 0x145af21ad
0x145af2181: xorps xmm6, xmm6
0x145af2184: cvtsi2ss xmm6, rdx
0x145af2189: jmp 0x145af21c5
0x145af218b: mov eax, dword ptr [rcx + 0xc]
0x145af218e: xorps xmm0, xmm0
0x145af2191: cvtsi2ss xmm0, rax
0x145af2196: mulss xmm0, dword ptr [rip + 0x740f32]
0x145af219e: addss xmm0, dword ptr [rcx + 0x18]
0x145af21a3: movaps xmm6, xmmword ptr [rsp + 0x20]
0x145af21a8: add rsp, 0x38
0x145af21ac: ret 
0x145af21ad: mov r8, rdx
0x145af21b0: shr r8, 1
0x145af21b3: and edx, 1
0x145af21b6: or rdx, r8
0x145af21b9: xorps xmm6, xmm6
0x145af21bc: cvtsi2ss xmm6, rdx
0x145af21c1: addss xmm6, xmm6
0x145af21c5: mulss xmm6, dword ptr [rcx + 0x10]
0x145af21ca: mov rcx, rax
0x145af21cd: call 0x145af1fb0
0x145af21d2: addss xmm0, xmm6
0x145af21d6: movaps xmm6, xmmword ptr [rsp + 0x20]
0x145af21db: add rsp, 0x38
0x145af21df: ret 
