0000000145c27878 807d7901                       cmp byte ptr [rbp + 0x79], 1
0000000145c2787c 751c                           jne 0x145c2789a
0000000145c2787e 4881be001a0000ffffff00         cmp qword ptr [rsi + 0x1a00], 0xffffff
0000000145c27889 740f                           je 0x145c2789a
0000000145c2788b 837e1002                       cmp dword ptr [rsi + 0x10], 2
0000000145c2788f 7427                           je 0x145c278b8
0000000145c27891 f6865c0d000001                 test byte ptr [rsi + 0xd5c], 1
0000000145c27898 741e                           je 0x145c278b8
