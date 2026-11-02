;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x14590e3c0..0x14590e420 SHA256 e67586aed875352f21f407edcdbe23fee2f58d74db69576a7bd8d73fa09476a1
0x14590e3c0: movd xmm0, dword ptr [rcx]
0x14590e3c4: pxor xmm1, xmm1
0x14590e3c8: punpcklwd xmm0, xmm1
0x14590e3cc: cvtdq2ps xmm0, xmm0
0x14590e3cf: movaps xmm2, xmmword ptr [rip + 0x12dd8ca]
0x14590e3d6: addps xmm0, xmm2
0x14590e3d9: movaps xmm3, xmmword ptr [rip + 0x11d88e0]
0x14590e3e0: divps xmm0, xmm3
0x14590e3e3: mulps xmm0, xmmword ptr [rip + 0x12dd8c6]
0x14590e3ea: movd xmm4, dword ptr [rcx + 4]
0x14590e3ef: punpcklwd xmm4, xmm1
0x14590e3f3: cvtdq2ps xmm1, xmm4
0x14590e3f6: addps xmm1, xmm2
0x14590e3f9: divps xmm1, xmm3
0x14590e3fc: mulps xmm1, xmmword ptr [rip + 0x12dd8bd]
0x14590e403: movshdup xmm2, xmm0
0x14590e407: addss xmm2, xmm0
0x14590e40b: addss xmm2, xmm1
0x14590e40f: movshdup xmm0, xmm1
0x14590e413: addss xmm0, xmm2
0x14590e417: addss xmm0, dword ptr [rip + 0x48ee81]
0x14590e41f: ret
