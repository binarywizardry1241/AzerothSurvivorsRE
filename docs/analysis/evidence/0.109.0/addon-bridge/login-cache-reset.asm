1458b4313: mov       qword ptr [rsi + 0xd70], 0
1458b431e: mov       rdx, qword ptr [rsi + 0xd78]
1458b4325: test      rdx, rdx
1458b4328: je        0x1458b433c
1458b432a: mov       rcx, qword ptr [rsi + 0xd80]
1458b4331: mov       r8d, 1
1458b4337: call      0x1400021d0
1458b433c: mov       rdx, qword ptr [rsi + 0xd90]
1458b4343: test      rdx, rdx
1458b4346: je        0x1458b435a
1458b4348: mov       rcx, qword ptr [rsi + 0xd98]
1458b434f: mov       r8d, 1
1458b4355: call      0x1400021d0
1458b435a: mov       rdx, qword ptr [rsi + 0xda8]
1458b4361: test      rdx, rdx
1458b4364: je        0x1458b4378
1458b4366: mov       rcx, qword ptr [rsi + 0xdb0]
1458b436d: mov       r8d, 1
1458b4373: call      0x1400021d0
1458b4378: mov       rdx, qword ptr [rsi + 0xdc0]
1458b437f: test      rdx, rdx
1458b4382: je        0x1458b4396
1458b4384: mov       rcx, qword ptr [rsi + 0xdc8]
1458b438b: mov       r8d, 1
1458b4391: call      0x1400021d0
1458b4396: mov       rdx, qword ptr [rsi + 0xdd8]
1458b439d: test      rdx, rdx
1458b43a0: je        0x1458b43b4
1458b43a2: mov       rcx, qword ptr [rsi + 0xde0]
1458b43a9: mov       r8d, 1
1458b43af: call      0x1400021d0
1458b43b4: mov       rdx, qword ptr [rsi + 0xdf0]
1458b43bb: test      rdx, rdx
1458b43be: je        0x1458b43d2
1458b43c0: mov       rcx, qword ptr [rsi + 0xdf8]
1458b43c7: mov       r8d, 1
1458b43cd: call      0x1400021d0
1458b43d2: mov       rdx, qword ptr [rsi + 0xe08]
1458b43d9: test      rdx, rdx
1458b43dc: je        0x1458b43f0
1458b43de: mov       rcx, qword ptr [rsi + 0xe10]
1458b43e5: mov       r8d, 1
1458b43eb: call      0x1400021d0
1458b43f0: mov       rdx, qword ptr [rsi + 0xe20]
1458b43f7: test      rdx, rdx
1458b43fa: je        0x1458b440e
1458b43fc: mov       rcx, qword ptr [rsi + 0xe28]
1458b4403: mov       r8d, 1
1458b4409: call      0x1400021d0
1458b440e: mov       rdx, qword ptr [rsi + 0xe38]
1458b4415: test      rdx, rdx
1458b4418: je        0x1458b442c
1458b441a: mov       rcx, qword ptr [rsi + 0xe40]
1458b4421: mov       r8d, 1
1458b4427: call      0x1400021d0
1458b442c: mov       rdx, qword ptr [rsi + 0xe50]
1458b4433: test      rdx, rdx
1458b4436: je        0x1458b444a
1458b4438: mov       rcx, qword ptr [rsi + 0xe58]
1458b443f: mov       r8d, 1
1458b4445: call      0x1400021d0
1458b444a: mov       rdx, qword ptr [rsi + 0xe68]
1458b4451: test      rdx, rdx
1458b4454: je        0x1458b4468
1458b4456: mov       rcx, qword ptr [rsi + 0xe70]
1458b445d: mov       r8d, 1
1458b4463: call      0x1400021d0
1458b4468: mov       rdx, qword ptr [rsi + 0xe80]
1458b446f: test      rdx, rdx
1458b4472: je        0x1458b4486
1458b4474: mov       rcx, qword ptr [rsi + 0xe88]
1458b447b: mov       r8d, 1
1458b4481: call      0x1400021d0
1458b4486: mov       rdx, qword ptr [rsi + 0xe98]
1458b448d: test      rdx, rdx
1458b4490: je        0x1458b44a4
1458b4492: mov       rcx, qword ptr [rsi + 0xea0]
1458b4499: mov       r8d, 1
1458b449f: call      0x1400021d0
1458b44a4: mov       rdx, qword ptr [rsi + 0xeb0]
1458b44ab: test      rdx, rdx
1458b44ae: je        0x1458b44c2
1458b44b0: mov       rcx, qword ptr [rsi + 0xeb8]
1458b44b7: mov       r8d, 1
1458b44bd: call      0x1400021d0
1458b44c2: mov       rdx, qword ptr [rsi + 0xec8]
1458b44c9: test      rdx, rdx
1458b44cc: je        0x1458b44e0
1458b44ce: mov       rcx, qword ptr [rsi + 0xed0]
1458b44d5: mov       r8d, 1
1458b44db: call      0x1400021d0
1458b44e0: mov       qword ptr [rsi + 0xd78], 0
1458b44eb: mov       qword ptr [rsi + 0xd80], 1
1458b44f6: pxor      xmm0, xmm0
1458b44fa: movdqu    xmmword ptr [rsi + 0xd88], xmm0
1458b4502: mov       qword ptr [rsi + 0xd98], 1
1458b450d: movdqu    xmmword ptr [rsi + 0xda0], xmm0
1458b4515: mov       qword ptr [rsi + 0xdb0], 1
1458b4520: movdqu    xmmword ptr [rsi + 0xdb8], xmm0
1458b4528: mov       qword ptr [rsi + 0xdc8], 1
1458b4533: movdqu    xmmword ptr [rsi + 0xdd0], xmm0
1458b453b: mov       qword ptr [rsi + 0xde0], 1
1458b4546: movdqu    xmmword ptr [rsi + 0xde8], xmm0
1458b454e: mov       qword ptr [rsi + 0xdf8], 1
1458b4559: movdqu    xmmword ptr [rsi + 0xe00], xmm0
1458b4561: mov       qword ptr [rsi + 0xe10], 1
1458b456c: movdqu    xmmword ptr [rsi + 0xe18], xmm0
1458b4574: mov       qword ptr [rsi + 0xe28], 1
1458b457f: movdqu    xmmword ptr [rsi + 0xe30], xmm0
1458b4587: mov       qword ptr [rsi + 0xe40], 1
1458b4592: movdqu    xmmword ptr [rsi + 0xe48], xmm0
1458b459a: mov       qword ptr [rsi + 0xe58], 1
1458b45a5: movdqu    xmmword ptr [rsi + 0xe60], xmm0
1458b45ad: mov       qword ptr [rsi + 0xe70], 1
1458b45b8: movdqu    xmmword ptr [rsi + 0xe78], xmm0
1458b45c0: mov       qword ptr [rsi + 0xe88], 1
1458b45cb: movdqu    xmmword ptr [rsi + 0xe90], xmm0
1458b45d3: mov       qword ptr [rsi + 0xea0], 1
1458b45de: movdqu    xmmword ptr [rsi + 0xea8], xmm0
1458b45e6: mov       qword ptr [rsi + 0xeb8], 1
1458b45f1: movdqu    xmmword ptr [rsi + 0xec0], xmm0
1458b45f9: mov       qword ptr [rsi + 0xed0], 1
1458b4604: mov       qword ptr [rsi + 0xed8], 0
1458b460f: mov       qword ptr [rsi + 0x10e8], 0
