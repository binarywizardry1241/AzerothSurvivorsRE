0000000145b63ff0  660f28c6                        movapd xmm0, xmm6
0000000145b63ff4  f20f5c86c81a0000                subsd xmm0, qword ptr [rsi + 0x1ac8]
0000000145b63ffc  660f2e055cdfb401                ucomisd xmm0, qword ptr [rip + 0x1b4df5c]
0000000145b64004  0f82b7080000                    jb 0x145b648c1
0000000145b6400a  83be980d000001                  cmp dword ptr [rsi + 0xd98], 1
0000000145b64011  770d                            ja 0x145b64020
0000000145b64013  f686bd11000001                  test byte ptr [rsi + 0x11bd], 1
0000000145b6401a  0f85a1080000                    jne 0x145b648c1
0000000145b64020  f20f11b6c81a0000                movsd qword ptr [rsi + 0x1ac8], xmm6
