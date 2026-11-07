0000000145c1077f 837e1002                       cmp dword ptr [rsi + 0x10], 2
0000000145c10783 0f849e080000                   je 0x145c11027
0000000145c10789 0fb686620d0000                 movzx eax, byte ptr [rsi + 0xd62]
0000000145c10790 0fb68430670d0000               movzx eax, byte ptr [rax + rsi + 0xd67]
0000000145c10798 89c1                           mov ecx, eax
0000000145c1079a 80e106                         and cl, 6
0000000145c1079d 80f904                         cmp cl, 4
0000000145c107a0 750c                           jne 0x145c107ae
0000000145c107a2 38860e1b0000                   cmp byte ptr [rsi + 0x1b0e], al
0000000145c107a8 0f8562070000                   jne 0x145c10f10
