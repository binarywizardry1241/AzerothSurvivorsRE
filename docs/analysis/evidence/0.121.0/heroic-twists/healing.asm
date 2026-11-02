0000000145bd10e0 55                             push rbp
0000000145bd10e1 4157                           push r15
0000000145bd10e3 4156                           push r14
0000000145bd10e5 56                             push rsi
0000000145bd10e6 57                             push rdi
0000000145bd10e7 53                             push rbx
0000000145bd10e8 4881ec98000000                 sub rsp, 0x98
0000000145bd10ef 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145bd10f7 440f294500                     movaps xmmword ptr [rbp], xmm8
0000000145bd10fc 0f297df0                       movaps xmmword ptr [rbp - 0x10], xmm7
0000000145bd1100 0f2975e0                       movaps xmmword ptr [rbp - 0x20], xmm6
0000000145bd1104 48c745d8feffffff               mov qword ptr [rbp - 0x28], 0xfffffffffffffffe
0000000145bd110c 0f28f9                         movaps xmm7, xmm1
0000000145bd110f 4889ce                         mov rsi, rcx
0000000145bd1112 31c0                           xor eax, eax
0000000145bd1114 80b96f03000005                 cmp byte ptr [rcx + 0x36f], 5
0000000145bd111b 0f93c0                         setae al
0000000145bd111e 488d0dfbe2ab01                 lea rcx, [rip + 0x1abe2fb]
0000000145bd1125 f30f593c81                     mulss xmm7, dword ptr [rcx + rax*4]
0000000145bd112a f30f108638050000               movss xmm0, dword ptr [rsi + 0x538]
0000000145bd1132 0f28c8                         movaps xmm1, xmm0
0000000145bd1135 f30f58cf                       addss xmm1, xmm7
0000000145bd1139 0f28d1                         movaps xmm2, xmm1
0000000145bd113c f30f5d96c8040000               minss xmm2, dword ptr [rsi + 0x4c8]
0000000145bd1144 4489c7                         mov edi, r8d
0000000145bd1147 0f28f2                         movaps xmm6, xmm2
0000000145bd114a f30fc2f203                     cmpunordss xmm6, xmm2
0000000145bd114f 0f54ce                         andps xmm1, xmm6
0000000145bd1152 0f55f2                         andnps xmm6, xmm2
0000000145bd1155 0f56f1                         orps xmm6, xmm1
0000000145bd1158 f30f11b638050000               movss dword ptr [rsi + 0x538], xmm6
0000000145bd1160 f30f5cf0                       subss xmm6, xmm0
0000000145bd1164 4889f1                         mov rcx, rsi
0000000145bd1167 0f28ce                         movaps xmm1, xmm6
0000000145bd116a e851feffff                     call 0x145bd0fc0
0000000145bd116f 85ff                           test edi, edi
0000000145bd1171 0f8479010000                   je 0x145bd12f0
0000000145bd1177 0f57c9                         xorps xmm1, xmm1
0000000145bd117a 0f28c6                         movaps xmm0, xmm6
0000000145bd117d f30f5fc1                       maxss xmm0, xmm1
0000000145bd1181 f30f5cfe                       subss xmm7, xmm6
0000000145bd1185 f30f5ff9                       maxss xmm7, xmm1
0000000145bd1189 0f2ef9                         ucomiss xmm7, xmm1
0000000145bd118c 0f8682000000                   jbe 0x145bd1214
0000000145bd1192 488b8ec8080000                 mov rcx, qword ptr [rsi + 0x8c8]
0000000145bd1199 488b96d0080000                 mov rdx, qword ptr [rsi + 0x8d0]
0000000145bd11a0 48c1e206                       shl rdx, 6
0000000145bd11a4 31c0                           xor eax, eax
0000000145bd11a6 4531c0                         xor r8d, r8d
0000000145bd11a9 0f1f8000000000                 nop dword ptr [rax]
0000000145bd11b0 4c39c2                         cmp rdx, r8
0000000145bd11b3 7421                           je 0x145bd11d6
0000000145bd11b5 4d8d4840                       lea r9, [r8 + 0x40]
0000000145bd11b9 42803c0114                     cmp byte ptr [rcx + r8], 0x14
0000000145bd11be 4d89c8                         mov r8, r9
0000000145bd11c1 75ed                           jne 0x145bd11b0
0000000145bd11c3 f3420f105409c4                 movss xmm2, dword ptr [rcx + r9 - 0x3c]
0000000145bd11ca b801000000                     mov eax, 1
0000000145bd11cf 83f801                         cmp eax, 1
0000000145bd11d2 7407                           je 0x145bd11db
0000000145bd11d4 eb3e                           jmp 0x145bd1214
0000000145bd11d6 83f801                         cmp eax, 1
0000000145bd11d9 7539                           jne 0x145bd1214
0000000145bd11db f30f5996c8040000               mulss xmm2, dword ptr [rsi + 0x4c8]
0000000145bd11e3 f30f109e3c050000               movss xmm3, dword ptr [rsi + 0x53c]
0000000145bd11eb 0f2ed3                         ucomiss xmm2, xmm3
0000000145bd11ee 7624                           jbe 0x145bd1214
0000000145bd11f0 f30f58df                       addss xmm3, xmm7
0000000145bd11f4 0f28e3                         movaps xmm4, xmm3
0000000145bd11f7 f30f5de2                       minss xmm4, xmm2
0000000145bd11fb 0f28d4                         movaps xmm2, xmm4
0000000145bd11fe f30fc2d403                     cmpunordss xmm2, xmm4
0000000145bd1203 0f54da                         andps xmm3, xmm2
0000000145bd1206 0f55d4                         andnps xmm2, xmm4
0000000145bd1209 0f56d3                         orps xmm2, xmm3
0000000145bd120c f30f11963c050000               movss dword ptr [rsi + 0x53c], xmm2
0000000145bd1214 f30f58c7                       addss xmm0, xmm7
0000000145bd1218 0f2ec1                         ucomiss xmm0, xmm1
0000000145bd121b 7642                           jbe 0x145bd125f
0000000145bd121d 488b86c8080000                 mov rax, qword ptr [rsi + 0x8c8]
0000000145bd1224 488b8ed0080000                 mov rcx, qword ptr [rsi + 0x8d0]
0000000145bd122b 48c1e106                       shl rcx, 6
0000000145bd122f 31d2                           xor edx, edx
0000000145bd1231 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145bd1240 4839d1                         cmp rcx, rdx
0000000145bd1243 741a                           je 0x145bd125f
0000000145bd1245 803c1015                       cmp byte ptr [rax + rdx], 0x15
0000000145bd1249 488d5240                       lea rdx, [rdx + 0x40]
0000000145bd124d 75f1                           jne 0x145bd1240
0000000145bd124f f30f5886a0010000               addss xmm0, dword ptr [rsi + 0x1a0]
0000000145bd1257 f30f1186a0010000               movss dword ptr [rsi + 0x1a0], xmm0
0000000145bd125f 0f2e353a6f5c00                 ucomiss xmm6, dword ptr [rip + 0x5c6f3a]
0000000145bd1266 0f8284000000                   jb 0x145bd12f0
0000000145bd126c f3480f2cc6                     cvttss2si rax, xmm6
0000000145bd1271 31c9                           xor ecx, ecx
0000000145bd1273 0f57c0                         xorps xmm0, xmm0
0000000145bd1276 0f2ef0                         ucomiss xmm6, xmm0
0000000145bd1279 0f43c8                         cmovae ecx, eax
0000000145bd127c 488b96b0040000                 mov rdx, qword ptr [rsi + 0x4b0]
0000000145bd1283 0f2e35e69b5d00                 ucomiss xmm6, dword ptr [rip + 0x5d9be6]
0000000145bd128a b8ffffffff                     mov eax, 0xffffffff
0000000145bd128f 0f46c1                         cmovbe eax, ecx
0000000145bd1292 89442420                       mov dword ptr [rsp + 0x20], eax
0000000145bd1296 c644242800                     mov byte ptr [rsp + 0x28], 0
0000000145bd129b 488d4db8                       lea rcx, [rbp - 0x48]
0000000145bd129f 4989d0                         mov r8, rdx
0000000145bd12a2 4189f9                         mov r9d, edi
0000000145bd12a5 e896cefaff                     call 0x145b7e140
0000000145bd12aa 488bbe80060000                 mov rdi, qword ptr [rsi + 0x680]
0000000145bd12b1 483bbe70060000                 cmp rdi, qword ptr [rsi + 0x670]
0000000145bd12b8 750d                           jne 0x145bd12c7
0000000145bd12ba 488d8e70060000                 lea rcx, [rsi + 0x670]
0000000145bd12c1 e80ab44100                     call 0x145fec6d0
0000000145bd12c6 90                             nop
0000000145bd12c7 488b8678060000                 mov rax, qword ptr [rsi + 0x678]
0000000145bd12ce 4889f9                         mov rcx, rdi
0000000145bd12d1 48c1e105                       shl rcx, 5
0000000145bd12d5 0f1045b8                       movups xmm0, xmmword ptr [rbp - 0x48]
0000000145bd12d9 0f104dc8                       movups xmm1, xmmword ptr [rbp - 0x38]
0000000145bd12dd 0f114c0810                     movups xmmword ptr [rax + rcx + 0x10], xmm1
0000000145bd12e2 0f110408                       movups xmmword ptr [rax + rcx], xmm0
0000000145bd12e6 48ffc7                         inc rdi
0000000145bd12e9 4889be80060000                 mov qword ptr [rsi + 0x680], rdi
0000000145bd12f0 f30f10b6c8040000               movss xmm6, dword ptr [rsi + 0x4c8]
0000000145bd12f8 f30f108638050000               movss xmm0, dword ptr [rsi + 0x538]
0000000145bd1300 0f57ff                         xorps xmm7, xmm7
0000000145bd1303 f30f5fc7                       maxss xmm0, xmm7
0000000145bd1307 e857a94100                     call 0x145febc63
0000000145bd130c f3480f2cf8                     cvttss2si rdi, xmm0
0000000145bd1311 4531f6                         xor r14d, r14d
0000000145bd1314 0f2ec7                         ucomiss xmm0, xmm7
0000000145bd1317 410f42fe                       cmovb edi, r14d
0000000145bd131b f3440f10054c9b5d00             movss xmm8, dword ptr [rip + 0x5d9b4c]
0000000145bd1324 410f2ec0                       ucomiss xmm0, xmm8
0000000145bd1328 41bfffffffff                   mov r15d, 0xffffffff
0000000145bd132e 410f47ff                       cmova edi, r15d
0000000145bd1332 0f28c6                         movaps xmm0, xmm6
0000000145bd1335 e829a94100                     call 0x145febc63
0000000145bd133a f3480f2cd8                     cvttss2si rbx, xmm0
0000000145bd133f 0f2ec7                         ucomiss xmm0, xmm7
0000000145bd1342 410f42de                       cmovb ebx, r14d
0000000145bd1346 410f2ec0                       ucomiss xmm0, xmm8
0000000145bd134a 410f47df                       cmova ebx, r15d
0000000145bd134e 4881c6f80b0000                 add rsi, 0xbf8
0000000145bd1355 4889f1                         mov rcx, rsi
0000000145bd1358 66ba1600                       mov dx, 0x16
0000000145bd135c 4189f8                         mov r8d, edi
0000000145bd135f e8cc8decff                     call 0x145a9a130
0000000145bd1364 4889f1                         mov rcx, rsi
0000000145bd1367 66ba1c00                       mov dx, 0x1c
0000000145bd136b 4189d8                         mov r8d, ebx
0000000145bd136e 0f2875e0                       movaps xmm6, xmmword ptr [rbp - 0x20]
0000000145bd1372 0f287df0                       movaps xmm7, xmmword ptr [rbp - 0x10]
0000000145bd1376 440f284500                     movaps xmm8, xmmword ptr [rbp]
0000000145bd137b 4881c498000000                 add rsp, 0x98
0000000145bd1382 5b                             pop rbx
0000000145bd1383 5f                             pop rdi
0000000145bd1384 5e                             pop rsi
0000000145bd1385 415e                           pop r14
0000000145bd1387 415f                           pop r15
0000000145bd1389 5d                             pop rbp
0000000145bd138a e9a18decff                     jmp 0x145a9a130
