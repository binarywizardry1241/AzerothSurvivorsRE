145af1160 55 push rbp
145af1161 4157 push r15
145af1163 4156 push r14
145af1165 4155 push r13
145af1167 4154 push r12
145af1169 56 push rsi
145af116a 57 push rdi
145af116b 53 push rbx
145af116c 4881ec48010000 sub rsp, 0x148
145af1173 488dac2480000000 lea rbp, [rsp + 0x80]
145af117b 66440f7f95b0000000 movdqa xmmword ptr [rbp + 0xb0], xmm10
145af1184 66440f7f8da0000000 movdqa xmmword ptr [rbp + 0xa0], xmm9
145af118d 66440f7f8590000000 movdqa xmmword ptr [rbp + 0x90], xmm8
145af1196 660f7fbd80000000 movdqa xmmword ptr [rbp + 0x80], xmm7
145af119e 0f297570 movaps xmmword ptr [rbp + 0x70], xmm6
145af11a2 48c74568feffffff mov qword ptr [rbp + 0x68], 0xfffffffffffffffe
145af11aa 4c8bbac0020000 mov r15, qword ptr [rdx + 0x2c0]
145af11b1 4d85ff test r15, r15
145af11b4 7910 jns 0x145af11c6
145af11b6 4531f6 xor r14d, r14d
145af11b9 4c89f1 mov rcx, r14
145af11bc 4c89fa mov rdx, r15
145af11bf e8e70e6600 call 0x1461520ab
145af11c4 0f0b ud2 
145af11c6 4889d7 mov rdi, rdx
145af11c9 4889ce mov rsi, rcx
145af11cc f30f10b2f40b0000 movss xmm6, dword ptr [rdx + 0xbf4]
145af11d4 0fb682a20c0000 movzx eax, byte ptr [rdx + 0xca2]
145af11db 884565 mov byte ptr [rbp + 0x65], al
145af11de 0fb6829d0c0000 movzx eax, byte ptr [rdx + 0xc9d]
145af11e5 884566 mov byte ptr [rbp + 0x66], al
145af11e8 0fb682a30c0000 movzx eax, byte ptr [rdx + 0xca3]
145af11ef 884567 mov byte ptr [rbp + 0x67], al
145af11f2 8b8200050000 mov eax, dword ptr [rdx + 0x500]
145af11f8 894504 mov dword ptr [rbp + 4], eax
145af11fb 8b82100b0000 mov eax, dword ptr [rdx + 0xb10]
145af1201 8945fc mov dword ptr [rbp - 4], eax
145af1204 8b82bc070000 mov eax, dword ptr [rdx + 0x7bc]
145af120a 8945f4 mov dword ptr [rbp - 0xc], eax
145af120d 8b82b8070000 mov eax, dword ptr [rdx + 0x7b8]
145af1213 894500 mov dword ptr [rbp], eax
145af1216 8b82b4070000 mov eax, dword ptr [rdx + 0x7b4]
145af121c 894508 mov dword ptr [rbp + 8], eax
145af121f 8b82ac070000 mov eax, dword ptr [rdx + 0x7ac]
145af1225 8945f8 mov dword ptr [rbp - 8], eax
145af1228 448baac0070000 mov r13d, dword ptr [rdx + 0x7c0]
145af122f 0fb782d8020000 movzx eax, word ptr [rdx + 0x2d8]
145af1236 66894562 mov word ptr [rbp + 0x62], ax
145af123a 0fb782da020000 movzx eax, word ptr [rdx + 0x2da]
145af1241 66894560 mov word ptr [rbp + 0x60], ax
145af1245 0fb782dc020000 movzx eax, word ptr [rdx + 0x2dc]
145af124c 6689455e mov word ptr [rbp + 0x5e], ax
145af1250 0fb782de020000 movzx eax, word ptr [rdx + 0x2de]
145af1257 6689455c mov word ptr [rbp + 0x5c], ax
145af125b f3440f6f8a2c030000 movdqu xmm9, xmmword ptr [rdx + 0x32c]
145af1264 f3440f6f821c030000 movdqu xmm8, xmmword ptr [rdx + 0x31c]
145af126d f3440f6f920c030000 movdqu xmm10, xmmword ptr [rdx + 0x30c]
145af1276 f30f6fbafc020000 movdqu xmm7, xmmword ptr [rdx + 0x2fc]
145af127e 440fb6a23c030000 movzx r12d, byte ptr [rdx + 0x33c]
145af1286 8b82f0020000 mov eax, dword ptr [rdx + 0x2f0]
145af128c 89450c mov dword ptr [rbp + 0xc], eax
145af128f 8b82f4020000 mov eax, dword ptr [rdx + 0x2f4]
145af1295 894514 mov dword ptr [rbp + 0x14], eax
145af1298 8b82f8020000 mov eax, dword ptr [rdx + 0x2f8]
145af129e 894510 mov dword ptr [rbp + 0x10], eax
145af12a1 4c897de8 mov qword ptr [rbp - 0x18], r15
145af12a5 44886564 mov byte ptr [rbp + 0x64], r12b
145af12a9 44896df0 mov dword ptr [rbp - 0x10], r13d
145af12ad 743c je 0x145af12eb
145af12af 488b9fb8020000 mov rbx, qword ptr [rdi + 0x2b8]
145af12b6 e8450f51fa call 0x140002200
145af12bb 41be01000000 mov r14d, 1
145af12c1 ba01000000 mov edx, 1
145af12c6 4c89f9 mov rcx, r15
145af12c9 e8f20e51fa call 0x1400021c0
145af12ce 4885c0 test rax, rax
145af12d1 0f84e2feffff je 0x145af11b9
145af12d7 48894518 mov qword ptr [rbp + 0x18], rax
145af12db 4889c1 mov rcx, rax
145af12de 4889da mov rdx, rbx
145af12e1 4d89f8 mov r8, r15
145af12e4 e8429b4b00 call 0x145faae2b
145af12e9 eb09 jmp 0x145af12f4
145af12eb b801000000 mov eax, 1
145af12f0 48894518 mov qword ptr [rbp + 0x18], rax
145af12f4 4c8baf28070000 mov r13, qword ptr [rdi + 0x728]
145af12fb 4a8d1ced00000000 lea rbx, [r13*8]
145af1303 4c89e8 mov rax, r13
145af1306 48c1e83d shr rax, 0x3d
145af130a 0f95c0 setne al
145af130d 49bcfcffffffffffff7f movabs r12, 0x7ffffffffffffffc
145af1317 4c39e3 cmp rbx, r12
145af131a 0f97c1 seta cl
145af131d 08c1 or cl, al
145af131f 7414 je 0x145af1335
145af1321 4531ff xor r15d, r15d
145af1324 4c89f9 mov rcx, r15
145af1327 4889da mov rdx, rbx
145af132a e87c0d6600 call 0x1461520ab
145af132f 90 nop 
145af1330 e903010000 jmp 0x145af1438
145af1335 4c8bb720070000 mov r14, qword ptr [rdi + 0x720]
145af133c 4885db test rbx, rbx
145af133f 0f84f5000000 je 0x145af143a
145af1345 e8b60e51fa call 0x140002200
145af134a 41bf04000000 mov r15d, 4
145af1350 ba04000000 mov edx, 4
145af1355 4889d9 mov rcx, rbx
145af1358 e8630e51fa call 0x1400021c0
145af135d 48894538 mov qword ptr [rbp + 0x38], rax
145af1361 4885c0 test rax, rax
145af1364 74be je 0x145af1324
145af1366 4c896d20 mov qword ptr [rbp + 0x20], r13
145af136a 4d85ed test r13, r13
145af136d 740f je 0x145af137e
145af136f 488b4d38 mov rcx, qword ptr [rbp + 0x38]
145af1373 4c89f2 mov rdx, r14
145af1376 4989d8 mov r8, rbx
145af1379 e8ad9a4b00 call 0x145faae2b
145af137e 4c8bb740070000 mov r14, qword ptr [rdi + 0x740]
145af1385 4a8d04b500000000 lea rax, [r14*4]
145af138d 488d1c40 lea rbx, [rax + rax*2]
145af1391 48b8aaaaaaaaaaaaaa0a movabs rax, 0xaaaaaaaaaaaaaaa
145af139b 4939c6 cmp r14, rax
145af139e 7614 jbe 0x145af13b4
145af13a0 4531ff xor r15d, r15d
145af13a3 4c89f9 mov rcx, r15
145af13a6 4889da mov rdx, rbx
145af13a9 e8fd0c6600 call 0x1461520ab
145af13ae 90 nop 
145af13af e984000000 jmp 0x145af1438
145af13b4 488b9738070000 mov rdx, qword ptr [rdi + 0x738]
145af13bb 4885db test rbx, rbx
145af13be 0f848b030000 je 0x145af174f
145af13c4 48895530 mov qword ptr [rbp + 0x30], rdx
145af13c8 e8330e51fa call 0x140002200
145af13cd 41bf04000000 mov r15d, 4
145af13d3 ba04000000 mov edx, 4
145af13d8 4889d9 mov rcx, rbx
145af13db e8e00d51fa call 0x1400021c0
145af13e0 48894540 mov qword ptr [rbp + 0x40], rax
145af13e4 4885c0 test rax, rax
145af13e7 74ba je 0x145af13a3
145af13e9 4c897528 mov qword ptr [rbp + 0x28], r14
145af13ed 488b5530 mov rdx, qword ptr [rbp + 0x30]
145af13f1 4c897530 mov qword ptr [rbp + 0x30], r14
145af13f5 4d85f6 test r14, r14
145af13f8 740c je 0x145af1406
145af13fa 488b4d40 mov rcx, qword ptr [rbp + 0x40]
145af13fe 4989d8 mov r8, rbx
145af1401 e8259a4b00 call 0x145faae2b
145af1406 4c8bb758070000 mov r14, qword ptr [rdi + 0x758]
145af140d 4a8d1cb500000000 lea rbx, [r14*4]
145af1415 4c89f0 mov rax, r14
145af1418 48c1e83e shr rax, 0x3e
145af141c 0f95c0 setne al
145af141f 4c39e3 cmp rbx, r12
145af1422 0f97c1 seta cl
145af1425 08c1 or cl, al
145af1427 7430 je 0x145af1459
145af1429 4531ff xor r15d, r15d
145af142c 4c89f9 mov rcx, r15
145af142f 4889da mov rdx, rbx
145af1432 e8740c6600 call 0x1461520ab
145af1437 90 nop 
145af1438 0f0b ud2 
145af143a b804000000 mov eax, 4
145af143f 48894538 mov qword ptr [rbp + 0x38], rax
145af1443 48c7452000000000 mov qword ptr [rbp + 0x20], 0
145af144b 4d85ed test r13, r13
145af144e 0f851bffffff jne 0x145af136f
145af1454 e925ffffff jmp 0x145af137e
145af1459 488b9750070000 mov rdx, qword ptr [rdi + 0x750]
145af1460 4885db test rbx, rbx
145af1463 0f8409030000 je 0x145af1772
145af1469 48895550 mov qword ptr [rbp + 0x50], rdx
145af146d e88e0d51fa call 0x140002200
145af1472 41bf04000000 mov r15d, 4
145af1478 ba04000000 mov edx, 4
145af147d 4889d9 mov rcx, rbx
145af1480 e83b0d51fa call 0x1400021c0
145af1485 4885c0 test rax, rax
145af1488 74a2 je 0x145af142c
145af148a 4989c4 mov r12, rax
145af148d 4c897548 mov qword ptr [rbp + 0x48], r14
145af1491 488b5550 mov rdx, qword ptr [rbp + 0x50]
145af1495 4d85f6 test r14, r14
145af1498 740c je 0x145af14a6
145af149a 4c89e1 mov rcx, r12
145af149d 4989d8 mov r8, rbx
145af14a0 e886994b00 call 0x145faae2b
145af14a5 90 nop 
145af14a6 4c896550 mov qword ptr [rbp + 0x50], r12
145af14aa 4c8975e0 mov qword ptr [rbp - 0x20], r14
145af14ae 488d4da8 lea rcx, [rbp - 0x58]
145af14b2 4889fa mov rdx, rdi
145af14b5 e866760700 call 0x145b68b20
145af14ba 90 nop 
145af14bb 8b450c mov eax, dword ptr [rbp + 0xc]
145af14be 0b4514 or eax, dword ptr [rbp + 0x14]
145af14c1 0b4510 or eax, dword ptr [rbp + 0x10]
145af14c4 0fb74562 movzx eax, word ptr [rbp + 0x62]
145af14c8 f30f2ac0 cvtsi2ss xmm0, eax
145af14cc 0fb74560 movzx eax, word ptr [rbp + 0x60]
145af14d0 f30f2ad8 cvtsi2ss xmm3, eax
145af14d4 0fb7455e movzx eax, word ptr [rbp + 0x5e]
145af14d8 f30f2ad0 cvtsi2ss xmm2, eax
145af14dc 0fb7455c movzx eax, word ptr [rbp + 0x5c]
145af14e0 f30f2ac8 cvtsi2ss xmm1, eax
145af14e4 660fefe4 pxor xmm4, xmm4
145af14e8 660f76fc pcmpeqd xmm7, xmm4
145af14ec 66440f76d4 pcmpeqd xmm10, xmm4
145af14f1 66410f6bfa packssdw xmm7, xmm10
145af14f6 66440f76c4 pcmpeqd xmm8, xmm4
145af14fb 66440f76cc pcmpeqd xmm9, xmm4
145af1500 66450f6bc1 packssdw xmm8, xmm9
145af1505 66410f63f8 packsswb xmm7, xmm8
145af150a 410f94c2 sete r10b
145af150e 66440fd7c7 pmovmskb r8d, xmm7
145af1513 4489c1 mov ecx, r8d
145af1516 c1e90f shr ecx, 0xf
145af1519 4489c2 mov edx, r8d
145af151c c1ea0e shr edx, 0xe
145af151f 4589c1 mov r9d, r8d
145af1522 41c1e90d shr r9d, 0xd
145af1526 4589c3 mov r11d, r8d
145af1529 41c1eb0c shr r11d, 0xc
145af152d 4489c7 mov edi, r8d
145af1530 c1ef0b shr edi, 0xb
145af1533 4489c0 mov eax, r8d
145af1536 c1e80a shr eax, 0xa
145af1539 4589c7 mov r15d, r8d
145af153c 41c1ef09 shr r15d, 9
145af1540 4589c4 mov r12d, r8d
145af1543 41c1ec08 shr r12d, 8
145af1547 4584c0 test r8b, r8b
145af154a 0f98c3 sets bl
145af154d 4420e3 and bl, r12b
145af1550 4420fb and bl, r15b
145af1553 4589c7 mov r15d, r8d
145af1556 41c0ef05 shr r15b, 5
145af155a 4589c4 mov r12d, r8d
145af155d 41c0ec04 shr r12b, 4
145af1561 4520fc and r12b, r15b
145af1564 4589c7 mov r15d, r8d
145af1567 41c0ef06 shr r15b, 6
145af156b 4520fc and r12b, r15b
145af156e 4589c7 mov r15d, r8d
145af1571 41c0ef03 shr r15b, 3
145af1575 4589c6 mov r14d, r8d
145af1578 41c0ee02 shr r14b, 2
145af157c 4520fe and r14b, r15b
145af157f 4520c2 and r10b, r8b
145af1582 41d0e8 shr r8b, 1
145af1585 4520d0 and r8b, r10b
145af1588 4520f0 and r8b, r14b
145af158b 4520e0 and r8b, r12b
145af158e 4420c3 and bl, r8b
145af1591 4020f8 and al, dil
145af1594 4420d8 and al, r11b
145af1597 4420c8 and al, r9b
145af159a 20d0 and al, dl
145af159c 20d8 and al, bl
145af159e 20c8 and al, cl
145af15a0 807d6600 cmp byte ptr [rbp + 0x66], 0
145af15a4 0fb64d67 movzx ecx, byte ptr [rbp + 0x67]
145af15a8 0fb65565 movzx edx, byte ptr [rbp + 0x65]
145af15ac 0f44ca cmove ecx, edx
145af15af 80e106 and cl, 6
145af15b2 80f904 cmp cl, 4
145af15b5 f30f11b698000000 movss dword ptr [rsi + 0x98], xmm6
145af15bd 8896bf000000 mov byte ptr [rsi + 0xbf], dl
145af15c3 0f9486bc000000 sete byte ptr [rsi + 0xbc]
145af15ca 8b4d04 mov ecx, dword ptr [rbp + 4]
145af15cd 898e9c000000 mov dword ptr [rsi + 0x9c], ecx
145af15d3 8b4dfc mov ecx, dword ptr [rbp - 4]
145af15d6 888ebd000000 mov byte ptr [rsi + 0xbd], cl
145af15dc f30f106508 movss xmm4, dword ptr [rbp + 8]
145af15e1 f30f106d00 movss xmm5, dword ptr [rbp]
145af15e6 f30f1075f8 movss xmm6, dword ptr [rbp - 8]
145af15eb f30f107df4 movss xmm7, dword ptr [rbp - 0xc]
145af15f0 0f14e5 unpcklps xmm4, xmm5
145af15f3 0f14f7 unpcklps xmm6, xmm7
145af15f6 0f16f4 movlhps xmm6, xmm4
145af15f9 0f11b6a0000000 movups xmmword ptr [rsi + 0xa0], xmm6
145af1600 8b4df0 mov ecx, dword ptr [rbp - 0x10]
145af1603 898eb0000000 mov dword ptr [rsi + 0xb0], ecx
145af1609 f30f10258fd6db00 movss xmm4, dword ptr [rip + 0xdbd68f]
145af1611 0f28e8 movaps xmm5, xmm0
145af1614 f30f58ec addss xmm5, xmm4
145af1618 f30f103500926800 movss xmm6, dword ptr [rip + 0x689200]
145af1620 f30f5eee divss xmm5, xmm6
145af1624 f30f592d28766a00 mulss xmm5, dword ptr [rip + 0x6a7628]
145af162c f30f58dc addss xmm3, xmm4
145af1630 f30f5ede divss xmm3, xmm6
145af1634 f30f591ddc746a00 mulss xmm3, dword ptr [rip + 0x6a74dc]
145af163c f30f58d4 addss xmm2, xmm4
145af1640 f30f5ed6 divss xmm2, xmm6
145af1644 f30f591530786a00 mulss xmm2, dword ptr [rip + 0x6a7830]
145af164c f30f58dd addss xmm3, xmm5
145af1650 f30f58d3 addss xmm2, xmm3
145af1654 f30f58cc addss xmm1, xmm4
145af1658 f30f5ece divss xmm1, xmm6
145af165c f30f58c9 addss xmm1, xmm1
145af1660 f30f58ca addss xmm1, xmm2
145af1664 f30f580d84916800 addss xmm1, dword ptr [rip + 0x689184]
145af166c f30f5d0dac786a00 minss xmm1, dword ptr [rip + 0x6a78ac]
145af1674 f30f5ec6 divss xmm0, xmm6
145af1678 f30f1186b4000000 movss dword ptr [rsi + 0xb4], xmm0
145af1680 f30f118eb8000000 movss dword ptr [rsi + 0xb8], xmm1
145af1688 8886be000000 mov byte ptr [rsi + 0xbe], al
145af168e 0fb64564 movzx eax, byte ptr [rbp + 0x64]
145af1692 8886c0000000 mov byte ptr [rsi + 0xc0], al
145af1698 488b45e8 mov rax, qword ptr [rbp - 0x18]
145af169c 488906 mov qword ptr [rsi], rax
145af169f 488b4d18 mov rcx, qword ptr [rbp + 0x18]
145af16a3 48894e08 mov qword ptr [rsi + 8], rcx
145af16a7 48894610 mov qword ptr [rsi + 0x10], rax
145af16ab 488b4520 mov rax, qword ptr [rbp + 0x20]
145af16af 48894618 mov qword ptr [rsi + 0x18], rax
145af16b3 488b4538 mov rax, qword ptr [rbp + 0x38]
145af16b7 48894620 mov qword ptr [rsi + 0x20], rax
145af16bb 4c896e28 mov qword ptr [rsi + 0x28], r13
145af16bf 488b4528 mov rax, qword ptr [rbp + 0x28]
145af16c3 48894630 mov qword ptr [rsi + 0x30], rax
145af16c7 488b4540 mov rax, qword ptr [rbp + 0x40]
145af16cb 48894638 mov qword ptr [rsi + 0x38], rax
145af16cf 488b4530 mov rax, qword ptr [rbp + 0x30]
145af16d3 48894640 mov qword ptr [rsi + 0x40], rax
145af16d7 488b4548 mov rax, qword ptr [rbp + 0x48]
145af16db 48894648 mov qword ptr [rsi + 0x48], rax
145af16df 488b4550 mov rax, qword ptr [rbp + 0x50]
145af16e3 48894650 mov qword ptr [rsi + 0x50], rax
145af16e7 488b45e0 mov rax, qword ptr [rbp - 0x20]
145af16eb 48894658 mov qword ptr [rsi + 0x58], rax
145af16ef 488b45d8 mov rax, qword ptr [rbp - 0x28]
145af16f3 48898690000000 mov qword ptr [rsi + 0x90], rax
145af16fa 0f1045a8 movups xmm0, xmmword ptr [rbp - 0x58]
145af16fe 0f104db8 movups xmm1, xmmword ptr [rbp - 0x48]
145af1702 0f1055c8 movups xmm2, xmmword ptr [rbp - 0x38]
145af1706 0f119680000000 movups xmmword ptr [rsi + 0x80], xmm2
145af170d 0f114e70 movups xmmword ptr [rsi + 0x70], xmm1
145af1711 0f114660 movups xmmword ptr [rsi + 0x60], xmm0
145af1715 4889f0 mov rax, rsi
145af1718 0f287570 movaps xmm6, xmmword ptr [rbp + 0x70]
145af171c 0f28bd80000000 movaps xmm7, xmmword ptr [rbp + 0x80]
145af1723 440f288590000000 movaps xmm8, xmmword ptr [rbp + 0x90]
145af172b 440f288da0000000 movaps xmm9, xmmword ptr [rbp + 0xa0]
145af1733 440f2895b0000000 movaps xmm10, xmmword ptr [rbp + 0xb0]
145af173b 4881c448010000 add rsp, 0x148
145af1742 5b pop rbx
145af1743 5f pop rdi
145af1744 5e pop rsi
145af1745 415c pop r12
145af1747 415d pop r13
145af1749 415e pop r14
145af174b 415f pop r15
145af174d 5d pop rbp
145af174e c3 ret 
145af174f b804000000 mov eax, 4
145af1754 48894540 mov qword ptr [rbp + 0x40], rax
145af1758 48c7452800000000 mov qword ptr [rbp + 0x28], 0
145af1760 4c897530 mov qword ptr [rbp + 0x30], r14
145af1764 4d85f6 test r14, r14
145af1767 0f858dfcffff jne 0x145af13fa
145af176d e994fcffff jmp 0x145af1406
145af1772 41bc04000000 mov r12d, 4
145af1778 48c7454800000000 mov qword ptr [rbp + 0x48], 0
145af1780 4d85f6 test r14, r14
145af1783 0f8511fdffff jne 0x145af149a
145af1789 e918fdffff jmp 0x145af14a6
