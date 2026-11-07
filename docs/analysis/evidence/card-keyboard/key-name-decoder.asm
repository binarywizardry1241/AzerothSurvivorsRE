000000014435058c: 4889d3                         mov rbx, rdx
000000014435058f: 488d4afe                       lea rcx, [rdx - 2]
0000000144350593: 4883f912                       cmp rcx, 0x12
0000000144350597: 0f8703150000                   ja 0x144351aa0
000000014435059d: 488d15ec5c6502                 lea rdx, [rip + 0x2655cec]
00000001443505a4: 48630c8a                       movsxd rcx, dword ptr [rdx + rcx*4]
00000001443505a8: 4801d1                         add rcx, rdx
00000001443505ab: ffe1                           jmp rcx
00000001443508dd: b944696769                     mov ecx, 0x69676944
00000001443508e2: 8b10                           mov edx, dword ptr [rax]
00000001443508e4: 31ca                           xor edx, ecx
00000001443508e6: 440fb74004                     movzx r8d, word ptr [rax + 4]
00000001443508eb: 4181f074300000                 xor r8d, 0x3074
00000001443508f2: 4109d0                         or r8d, edx
00000001443508f5: 0f845d130000                   je 0x144351c58
00000001443508fb: 3308                           xor ecx, dword ptr [rax]
00000001443508fd: 0fb75004                       movzx edx, word ptr [rax + 4]
0000000144350901: 81f274310000                   xor edx, 0x3174
0000000144350907: 09ca                           or edx, ecx
0000000144350909: 0f8437140000                   je 0x144351d46
000000014435090f: b944696769                     mov ecx, 0x69676944
0000000144350914: 8b10                           mov edx, dword ptr [rax]
0000000144350916: 31ca                           xor edx, ecx
0000000144350918: 440fb74004                     movzx r8d, word ptr [rax + 4]
000000014435091d: 4181f074320000                 xor r8d, 0x3274
0000000144350924: 4109d0                         or r8d, edx
0000000144350927: 0f84f9140000                   je 0x144351e26
000000014435092d: 3308                           xor ecx, dword ptr [rax]
000000014435092f: 0fb75004                       movzx edx, word ptr [rax + 4]
0000000144350933: 81f274330000                   xor edx, 0x3374
0000000144350939: 09ca                           or edx, ecx
000000014435093b: 0f84d3150000                   je 0x144351f14
0000000144350941: b944696769                     mov ecx, 0x69676944
0000000144350946: 8b10                           mov edx, dword ptr [rax]
0000000144350948: 31ca                           xor edx, ecx
000000014435094a: 440fb74004                     movzx r8d, word ptr [rax + 4]
000000014435094f: 4181f074340000                 xor r8d, 0x3474
0000000144350956: 4109d0                         or r8d, edx
0000000144350959: 0f844f160000                   je 0x144351fae
0000000144350eb0: b9496e746c                     mov ecx, 0x6c746e49
0000000144350eb5: 3308                           xor ecx, dword ptr [rax]
0000000144350eb7: ba6c59656e                     mov edx, 0x6e65596c
0000000144350ebc: 335003                         xor edx, dword ptr [rax + 3]
0000000144350ebf: 09ca                           or edx, ecx
0000000144350ec1: 0f84bb0d0000                   je 0x144351c82
0000000144350ec7: b9416c744c                     mov ecx, 0x4c746c41
0000000144350ecc: 3308                           xor ecx, dword ptr [rax]
0000000144350ece: ba4c656674                     mov edx, 0x7466654c
0000000144350ed3: 335003                         xor edx, dword ptr [rax + 3]
0000000144350ed6: 09ca                           or edx, ecx
0000000144350ed8: 0f84920e0000                   je 0x144351d70
0000000144350ede: b9436f6e76                     mov ecx, 0x766e6f43
0000000144350ee3: 3308                           xor ecx, dword ptr [rax]
0000000144350ee5: ba76657274                     mov edx, 0x74726576
0000000144350eea: 335003                         xor edx, dword ptr [rax + 3]
0000000144350eed: 09ca                           or edx, ecx
0000000144350eef: 0f845b0f0000                   je 0x144351e50
0000000144350ef5: b94172726f                     mov ecx, 0x6f727241
0000000144350efa: 3308                           xor ecx, dword ptr [rax]
0000000144350efc: ba6f775570                     mov edx, 0x7055776f
0000000144350f01: 335003                         xor edx, dword ptr [rax + 3]
0000000144350f04: 09ca                           or edx, ecx
0000000144350f06: 0f8432100000                   je 0x144351f3e
0000000144350f0c: b94e756d4c                     mov ecx, 0x4c6d754e
0000000144350f11: 3308                           xor ecx, dword ptr [rax]
0000000144350f13: ba4c6f636b                     mov edx, 0x6b636f4c
0000000144350f18: 335003                         xor edx, dword ptr [rax + 3]
0000000144350f1b: 09ca                           or edx, ecx
0000000144350f1d: 0f84b5100000                   je 0x144351fd8
0000000144350f23: b94e756d70                     mov ecx, 0x706d754e
0000000144350f28: 8b10                           mov edx, dword ptr [rax]
0000000144350f2a: 31ca                           xor edx, ecx
0000000144350f2c: 41b870616430                   mov r8d, 0x30646170
0000000144350f32: 44334003                       xor r8d, dword ptr [rax + 3]
0000000144350f36: 4109d0                         or r8d, edx
0000000144350f39: 0f8425110000                   je 0x144352064
0000000144350f3f: 3308                           xor ecx, dword ptr [rax]
0000000144350f41: ba70616431                     mov edx, 0x31646170
0000000144350f46: 335003                         xor edx, dword ptr [rax + 3]
0000000144350f49: 09ca                           or edx, ecx
0000000144350f4b: 0f8491110000                   je 0x1443520e2
0000000144350f51: b94e756d70                     mov ecx, 0x706d754e
0000000144350f56: 8b10                           mov edx, dword ptr [rax]
0000000144350f58: 31ca                           xor edx, ecx
0000000144350f5a: 41b870616432                   mov r8d, 0x32646170
0000000144350f60: 44334003                       xor r8d, dword ptr [rax + 3]
0000000144350f64: 4109d0                         or r8d, edx
0000000144350f67: 0f84f3110000                   je 0x144352160
0000000144350f6d: 3308                           xor ecx, dword ptr [rax]
0000000144350f6f: ba70616433                     mov edx, 0x33646170
0000000144350f74: 335003                         xor edx, dword ptr [rax + 3]
0000000144350f77: 09ca                           or edx, ecx
0000000144350f79: 0f846d120000                   je 0x1443521ec
0000000144350f7f: b94e756d70                     mov ecx, 0x706d754e
0000000144350f84: 8b10                           mov edx, dword ptr [rax]
0000000144350f86: 31ca                           xor edx, ecx
0000000144350f88: 41b870616434                   mov r8d, 0x34646170
0000000144350f8e: 44334003                       xor r8d, dword ptr [rax + 3]
0000000144350f92: 4109d0                         or r8d, edx
0000000144350f95: 0f84cf120000                   je 0x14435226a
00000001443512cf: 81384b657941                   cmp dword ptr [rax], 0x4179654b
00000001443512d5: 0f84df090000                   je 0x144351cba
00000001443512db: 81384b657942                   cmp dword ptr [rax], 0x4279654b
00000001443512e1: 0f84c10a0000                   je 0x144351da8
00000001443512e7: 81384b657943                   cmp dword ptr [rax], 0x4379654b
00000001443512ed: 0f84950b0000                   je 0x144351e88
00000001443512f3: 81384b657944                   cmp dword ptr [rax], 0x4479654b
00000001443512f9: 0f84690c0000                   je 0x144351f68
00000001443512ff: 81384b657945                   cmp dword ptr [rax], 0x4579654b
0000000144351305: 0f84f70c0000                   je 0x144352002
000000014435130b: 81384b657946                   cmp dword ptr [rax], 0x4679654b
0000000144351311: 0f84770d0000                   je 0x14435208e
0000000144351317: 81384b657947                   cmp dword ptr [rax], 0x4779654b
000000014435131d: 0f84e90d0000                   je 0x14435210c
0000000144351323: 81384b657948                   cmp dword ptr [rax], 0x4879654b
0000000144351329: 0f845b0e0000                   je 0x14435218a
000000014435132f: 81384b657949                   cmp dword ptr [rax], 0x4979654b
0000000144351335: 0f84db0e0000                   je 0x144352216
000000014435133b: 81384b65794a                   cmp dword ptr [rax], 0x4a79654b
0000000144351341: 0f843f0f0000                   je 0x144352286
0000000144351347: 81384b65794b                   cmp dword ptr [rax], 0x4b79654b
000000014435134d: 0f84870f0000                   je 0x1443522da
0000000144351353: 81384b65794c                   cmp dword ptr [rax], 0x4c79654b
0000000144351359: 0f84cf0f0000                   je 0x14435232e
000000014435135f: 81384b65794d                   cmp dword ptr [rax], 0x4d79654b
0000000144351365: 0f8409100000                   je 0x144352374
000000014435136b: 81384b65794e                   cmp dword ptr [rax], 0x4e79654b
0000000144351371: 0f8443100000                   je 0x1443523ba
0000000144351377: 4889c1                         mov rcx, rax
000000014435137a: 81384b65794f                   cmp dword ptr [rax], 0x4f79654b
0000000144351380: 0f847a100000                   je 0x144352400
0000000144351386: 81394b657950                   cmp dword ptr [rcx], 0x5079654b
000000014435138c: 0f84a6100000                   je 0x144352438
0000000144351392: 81394b657951                   cmp dword ptr [rcx], 0x5179654b
0000000144351398: 0f84d2100000                   je 0x144352470
000000014435139e: 81394b657952                   cmp dword ptr [rcx], 0x5279654b
00000001443513a4: 0f842c110000                   je 0x1443524d6
0000000144351d46: c70707000000                   mov dword ptr [rdi], 7
0000000144351d4c: c606ff                         mov byte ptr [rsi], 0xff
0000000144351d4f: e9e5e8ffff                     jmp 0x144350639
0000000144351e26: c70708000000                   mov dword ptr [rdi], 8
0000000144351e2c: c606ff                         mov byte ptr [rsi], 0xff
0000000144351e2f: e905e8ffff                     jmp 0x144350639
0000000144351f14: c70709000000                   mov dword ptr [rdi], 9
0000000144351f1a: c606ff                         mov byte ptr [rsi], 0xff
0000000144351f1d: e917e7ffff                     jmp 0x144350639
0000000144351fae: c7070a000000                   mov dword ptr [rdi], 0xa
0000000144351fb4: c606ff                         mov byte ptr [rsi], 0xff
0000000144351fb7: e97de6ffff                     jmp 0x144350639
00000001443520e2: c70756000000                   mov dword ptr [rdi], 0x56
00000001443520e8: c606ff                         mov byte ptr [rsi], 0xff
00000001443520eb: e949e5ffff                     jmp 0x144350639
0000000144352160: c70757000000                   mov dword ptr [rdi], 0x57
0000000144352166: c606ff                         mov byte ptr [rsi], 0xff
0000000144352169: e9cbe4ffff                     jmp 0x144350639
00000001443521ec: c70758000000                   mov dword ptr [rdi], 0x58
00000001443521f2: c606ff                         mov byte ptr [rsi], 0xff
00000001443521f5: e93fe4ffff                     jmp 0x144350639
000000014435226a: c70759000000                   mov dword ptr [rdi], 0x59
0000000144352270: c606ff                         mov byte ptr [rsi], 0xff
0000000144352273: e9c1e3ffff                     jmp 0x144350639
00000001443524d6: c70725000000                   mov dword ptr [rdi], 0x25
00000001443524dc: c606ff                         mov byte ptr [rsi], 0xff
00000001443524df: e955e1ffff                     jmp 0x144350639
