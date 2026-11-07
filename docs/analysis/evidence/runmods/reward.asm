;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x14590e4a0..0x14590e508 SHA256 25f5c596e1036856eccbf7757c0a78922ead8d7da78264fd558076fca4675d72
0x14590e4a0: movd xmm0, dword ptr [rcx]
0x14590e4a4: pxor xmm1, xmm1
0x14590e4a8: punpcklwd xmm0, xmm1
0x14590e4ac: cvtdq2ps xmm0, xmm0
0x14590e4af: movaps xmm2, xmmword ptr [rip + 0x12dd7ea]
0x14590e4b6: addps xmm0, xmm2
0x14590e4b9: movaps xmm3, xmmword ptr [rip + 0x11d8800]
0x14590e4c0: divps xmm0, xmm3
0x14590e4c3: mulps xmm0, xmmword ptr [rip + 0x12dd7e6]
0x14590e4ca: movd xmm4, dword ptr [rcx + 4]
0x14590e4cf: punpcklwd xmm4, xmm1
0x14590e4d3: cvtdq2ps xmm1, xmm4
0x14590e4d6: addps xmm1, xmm2
0x14590e4d9: divps xmm1, xmm3
0x14590e4dc: mulps xmm1, xmmword ptr [rip + 0x12dd7dd]
0x14590e4e3: movshdup xmm2, xmm0
0x14590e4e7: addss xmm2, xmm0
0x14590e4eb: addss xmm2, xmm1
0x14590e4ef: movshdup xmm0, xmm1
0x14590e4f3: addss xmm0, xmm2
0x14590e4f7: addss xmm0, dword ptr [rip + 0x48eda1]
0x14590e4ff: minss xmm0, dword ptr [rip + 0x4c6801]
0x14590e507: ret
