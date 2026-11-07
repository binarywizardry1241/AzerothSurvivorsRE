140101170: push rbp
140101171: push rsi
140101172: push rdi
140101173: sub rsp, 0x2b0
14010117a: lea rbp, [rsp + 0x80]
140101182: movaps xmmword ptr [rbp + 0x220], xmm6
140101189: mov qword ptr [rbp + 0x218], 0xfffffffffffffffe
140101194: mov rsi, rcx
140101197: movzx eax, word ptr [rdx + 0x164]
14010119e: mov word ptr [rbp + 0x134], ax
1401011a5: movzx eax, byte ptr [rdx + 0x154]
1401011ac: mov byte ptr [rbp + 0x124], al
1401011b2: mov eax, dword ptr [rdx + 0x68]
1401011b5: movss xmm0, dword ptr [rdx + 0x6c]
1401011ba: mov dword ptr [rbp + 0x38], eax
1401011bd: movss dword ptr [rbp + 0x3c], xmm0
1401011c2: mov eax, dword ptr [rdx + 0x70]
1401011c5: movss xmm0, dword ptr [rdx + 0x74]
1401011ca: mov dword ptr [rbp + 0x40], eax
1401011cd: movss dword ptr [rbp + 0x44], xmm0
1401011d2: mov eax, dword ptr [rdx + 0x78]
1401011d5: movss xmm0, dword ptr [rdx + 0x7c]
1401011da: mov dword ptr [rbp + 0x48], eax
1401011dd: movss dword ptr [rbp + 0x4c], xmm0
1401011e2: mov eax, dword ptr [rdx + 0x80]
1401011e8: movss xmm0, dword ptr [rdx + 0x84]
1401011f0: mov dword ptr [rbp + 0x50], eax
1401011f3: movss dword ptr [rbp + 0x54], xmm0
1401011f8: mov eax, dword ptr [rdx + 0x88]
1401011fe: movss xmm0, dword ptr [rdx + 0x8c]
140101206: mov dword ptr [rbp + 0x58], eax
140101209: movss dword ptr [rbp + 0x5c], xmm0
14010120e: mov eax, dword ptr [rdx + 0x90]
140101214: movss xmm0, dword ptr [rdx + 0x94]
14010121c: mov dword ptr [rbp + 0x60], eax
14010121f: movss dword ptr [rbp + 0x64], xmm0
140101224: mov eax, dword ptr [rdx + 0x98]
14010122a: movss xmm0, dword ptr [rdx + 0x9c]
140101232: mov dword ptr [rbp + 0x68], eax
140101235: movss dword ptr [rbp + 0x6c], xmm0
14010123a: mov eax, dword ptr [rdx + 0xa0]
140101240: movss xmm0, dword ptr [rdx + 0xa4]
140101248: mov dword ptr [rbp + 0x70], eax
14010124b: movss dword ptr [rbp + 0x74], xmm0
140101250: mov eax, dword ptr [rdx + 0xa8]
140101256: movss xmm0, dword ptr [rdx + 0xac]
14010125e: mov dword ptr [rbp + 0x78], eax
140101261: movss dword ptr [rbp + 0x7c], xmm0
140101266: mov eax, dword ptr [rdx + 0xb0]
14010126c: movss xmm0, dword ptr [rdx + 0xb4]
140101274: mov dword ptr [rbp + 0x80], eax
14010127a: movss dword ptr [rbp + 0x84], xmm0
140101282: mov eax, dword ptr [rdx + 0x60]
140101285: movss xmm0, dword ptr [rdx + 0x64]
14010128a: mov dword ptr [rbp + 0x30], eax
14010128d: movss dword ptr [rbp + 0x34], xmm0
140101292: mov eax, dword ptr [rdx + 0x17a]
140101298: mov dword ptr [rbp + 0x14a], eax
14010129e: movups xmm0, xmmword ptr [rdx + 0xb8]
1401012a5: movups xmm1, xmmword ptr [rdx + 0xc8]
1401012ac: movups xmmword ptr [rbp + 0x88], xmm0
1401012b3: movups xmmword ptr [rbp + 0x98], xmm1
1401012ba: movups xmm0, xmmword ptr [rdx + 0xd8]
1401012c1: movups xmm1, xmmword ptr [rdx + 0xe8]
1401012c8: movups xmmword ptr [rbp + 0xa8], xmm0
1401012cf: movups xmmword ptr [rbp + 0xb8], xmm1
1401012d6: movaps xmm0, xmmword ptr [rip + 0x5c9bfd3]
1401012dd: movups xmmword ptr [rbp + 0xc8], xmm0
1401012e4: movups xmmword ptr [rbp + 0xd8], xmm0
1401012eb: movaps xmm0, xmmword ptr [rip + 0x5c9c06e]
1401012f2: movups xmmword ptr [rbp + 0xe8], xmm0
1401012f9: movups xmmword ptr [rbp + 0xf8], xmm0
140101300: movsd xmm0, qword ptr [rdx + 0x158]
140101308: movsd qword ptr [rbp + 0x128], xmm0
140101310: movss xmm0, dword ptr [rdx + 0x160]
140101318: movss dword ptr [rbp + 0x130], xmm0
140101320: mov eax, dword ptr [rdx + 0x138]
140101326: movss xmm0, dword ptr [rdx + 0x13c]
14010132e: mov dword ptr [rbp + 0x108], eax
140101334: movss dword ptr [rbp + 0x10c], xmm0
14010133c: mov eax, dword ptr [rdx + 0x140]
140101342: movss xmm0, dword ptr [rdx + 0x144]
14010134a: mov dword ptr [rbp + 0x110], eax
140101350: movss dword ptr [rbp + 0x114], xmm0
140101358: mov eax, dword ptr [rdx + 0x148]
14010135e: mov dword ptr [rbp + 0x118], eax
140101364: movsd xmm0, qword ptr [rdx + 0x14c]
14010136c: movsd qword ptr [rbp + 0x11c], xmm0
140101374: mov rax, qword ptr [rdx + 0x172]
14010137b: mov qword ptr [rbp + 0x142], rax
140101382: mov rax, qword ptr [rdx + 0x10]
140101386: mov qword ptr [rbp - 0x20], rax
14010138a: movups xmm0, xmmword ptr [rdx]
14010138d: movaps xmmword ptr [rbp - 0x30], xmm0
140101391: mov rax, qword ptr [rdx + 0x28]
140101395: mov qword ptr [rbp - 8], rax
140101399: movups xmm0, xmmword ptr [rdx + 0x18]
14010139d: movups xmmword ptr [rbp - 0x18], xmm0
1401013a1: mov rax, qword ptr [rdx + 0x40]
1401013a5: mov qword ptr [rbp + 0x10], rax
1401013a9: movups xmm0, xmmword ptr [rdx + 0x30]
1401013ad: movaps xmmword ptr [rbp], xmm0
1401013b1: mov rax, qword ptr [rdx + 0x58]
1401013b5: mov qword ptr [rbp + 0x28], rax
1401013b9: movups xmm0, xmmword ptr [rdx + 0x48]
1401013bd: movups xmmword ptr [rbp + 0x18], xmm0
1401013c1: mov eax, dword ptr [rdx + 0x166]
1401013c7: mov dword ptr [rbp + 0x136], eax
1401013cd: movzx eax, word ptr [rdx + 0x16a]
1401013d4: mov word ptr [rbp + 0x13a], ax
1401013db: mov eax, dword ptr [rdx + 0x16c]
1401013e1: mov dword ptr [rbp + 0x13c], eax
1401013e7: movzx eax, word ptr [rdx + 0x170]
1401013ee: mov word ptr [rbp + 0x140], ax
1401013f5: movups xmm0, xmmword ptr [rip + 0x5cd538c]
1401013fc: movaps xmmword ptr [rbp + 0x180], xmm0
140101403: mov dword ptr [rbp + 0x190], 0x3f800000
14010140d: movups xmmword ptr [rbp + 0x194], xmm0
140101414: mov dword ptr [rbp + 0x1a4], 0x3f800000
14010141e: movups xmmword ptr [rbp + 0x1a8], xmm0
140101425: mov dword ptr [rbp + 0x1b8], 0x3f800000
14010142f: movups xmmword ptr [rbp + 0x1bc], xmm0
140101436: mov dword ptr [rbp + 0x1cc], 0x3f800000
140101440: call 0x140002200
140101445: mov ecx, 0x40
14010144a: mov edx, 4
14010144f: call 0x1400021c0
140101454: test rax, rax
140101457: je 0x140101698
14010145d: mov qword ptr [rbp + 0x210], rax
140101464: movaps xmm0, xmmword ptr [rip + 0x5cd3775]
14010146b: movups xmmword ptr [rbp + 0x1f4], xmm0
140101472: mov dword ptr [rbp + 0x1f0], 0
14010147c: lea rcx, [rbp + 0x1d0]
140101483: lea rdx, [rbp + 0x1f0]
14010148a: call 0x144c7dcf0
14010148f: nop
140101490: movaps xmm6, xmmword ptr [rbp + 0x1d0]
140101497: movaps xmm0, xmmword ptr [rip + 0x5cd3752]
14010149e: movups xmmword ptr [rbp + 0x1f4], xmm0
1401014a5: mov dword ptr [rbp + 0x1f0], 0
1401014af: lea rcx, [rbp + 0x1d0]
1401014b6: lea rdx, [rbp + 0x1f0]
1401014bd: call 0x144c7dcf0
1401014c2: nop
1401014c3: movaps xmm0, xmmword ptr [rbp + 0x1d0]
1401014ca: mov rdi, qword ptr [rbp + 0x210]
1401014d1: mov dword ptr [rdi], 0
1401014d7: mov dword ptr [rdi + 8], 1
1401014de: movups xmmword ptr [rdi + 0xc], xmm6
1401014e2: mov qword ptr [rdi + 0x1c], 0x3f000000
1401014ea: mov dword ptr [rdi + 0x28], 1
1401014f1: movups xmmword ptr [rdi + 0x2c], xmm0
1401014f5: mov dword ptr [rdi + 0x3c], 0x3f000000
1401014fc: call 0x140002200
140101501: mov ecx, 0x48
140101506: mov edx, 8
14010150b: call 0x1400021c0
140101510: test rax, rax
140101513: je 0x1401016aa
140101519: mov qword ptr [rax + 8], 2
140101521: mov qword ptr [rax + 0x10], rdi
140101525: mov qword ptr [rax + 0x18], 2
14010152d: mov dword ptr [rax + 0x20], 0x40490fdb
140101534: mov byte ptr [rax + 0x24], 0
140101538: movabs rcx, 0x8000000000000000
140101542: mov qword ptr [rax], rcx
140101545: mov qword ptr [rbp + 0x1d0], 1
140101550: mov qword ptr [rbp + 0x1d8], rax
140101557: mov qword ptr [rbp + 0x1e0], 1
140101562: movaps xmm0, xmmword ptr [rip + 0x5cd3697]
140101569: movups xmmword ptr [rbp + 0x170], xmm0
140101570: mov dword ptr [rbp + 0x16c], 0
14010157a: lea rcx, [rbp + 0x1f0]
140101581: lea rdx, [rbp + 0x16c]
140101588: call 0x144c7dcf0
14010158d: nop
14010158e: movaps xmm0, xmmword ptr [rbp + 0x1f0]
140101595: movups xmmword ptr [rbp + 0x15c], xmm0
14010159c: mov dword ptr [rbp + 0x158], 1
1401015a6: mov dword ptr [rsp + 0x48], 0x42200000
1401015ae: mov dword ptr [rsp + 0x40], 1
1401015b6: mov dword ptr [rsp + 0x38], 0
1401015be: mov dword ptr [rsp + 0x30], 1
1401015c6: mov dword ptr [rsp + 0x28], 0x41600000
1401015ce: mov dword ptr [rsp + 0x20], 1
1401015d6: lea rcx, [rbp + 0x1f0]
1401015dd: lea rdx, [rbp + 0x158]
1401015e4: xorps xmm3, xmm3
1401015e7: mov r8d, 1
1401015ed: call 0x142649b80
1401015f2: nop
1401015f3: lea rdx, [rbp - 0x30]
1401015f7: mov r8d, 0x180
1401015fd: mov rcx, rsi
140101600: call 0x145bfa0e7
140101605: movaps xmm0, xmmword ptr [rbp + 0x1c0]
14010160c: movups xmmword ptr [rsi + 0x1d8], xmm0
140101613: movaps xmm0, xmmword ptr [rbp + 0x180]
14010161a: movaps xmm1, xmmword ptr [rbp + 0x190]
140101621: movaps xmm2, xmmword ptr [rbp + 0x1a0]
140101628: movaps xmm3, xmmword ptr [rbp + 0x1b0]
14010162f: movups xmmword ptr [rsi + 0x1c8], xmm3
140101636: movups xmmword ptr [rsi + 0x1b8], xmm2
14010163d: movups xmmword ptr [rsi + 0x1a8], xmm1
140101644: movups xmmword ptr [rsi + 0x198], xmm0
14010164b: movups xmm0, xmmword ptr [rbp + 0x1d0]
140101652: movups xmmword ptr [rsi + 0x180], xmm0
140101659: mov rax, qword ptr [rbp + 0x1e0]
140101660: mov qword ptr [rsi + 0x190], rax
140101667: movups xmm0, xmmword ptr [rbp + 0x1f0]
14010166e: movups xmmword ptr [rsi + 0x1e8], xmm0
140101675: mov rax, qword ptr [rbp + 0x200]
14010167c: mov qword ptr [rsi + 0x1f8], rax
140101683: mov rax, rsi
140101686: movaps xmm6, xmmword ptr [rbp + 0x220]
14010168d: add rsp, 0x2b0
140101694: pop rdi
140101695: pop rsi
140101696: pop rbp
140101697: ret
140101698: mov ecx, 4
14010169d: mov edx, 0x40
1401016a2: call 0x145d992a1
1401016a7: nop
1401016a8: jmp 0x1401016ba
1401016aa: mov ecx, 8
1401016af: mov edx, 0x48
1401016b4: call 0x145d992a1
1401016b9: nop
1401016ba: ud2
