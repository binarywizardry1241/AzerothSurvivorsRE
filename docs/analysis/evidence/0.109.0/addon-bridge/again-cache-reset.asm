1458bcc0e: mov       qword ptr [rsi + 0xd70], 0
1458bcc19: mov       rdx, qword ptr [rsi + 0xd78]
1458bcc20: test      rdx, rdx
1458bcc23: je        0x1458bcc37
1458bcc25: mov       rcx, qword ptr [rsi + 0xd80]
1458bcc2c: mov       r8d, 1
1458bcc32: call      0x1400021d0
1458bcc37: mov       rdx, qword ptr [rsi + 0xd90]
1458bcc3e: test      rdx, rdx
1458bcc41: je        0x1458bcc55
1458bcc43: mov       rcx, qword ptr [rsi + 0xd98]
1458bcc4a: mov       r8d, 1
1458bcc50: call      0x1400021d0
1458bcc55: mov       rdx, qword ptr [rsi + 0xda8]
1458bcc5c: test      rdx, rdx
1458bcc5f: je        0x1458bcc73
1458bcc61: mov       rcx, qword ptr [rsi + 0xdb0]
1458bcc68: mov       r8d, 1
1458bcc6e: call      0x1400021d0
1458bcc73: mov       rdx, qword ptr [rsi + 0xdc0]
1458bcc7a: test      rdx, rdx
1458bcc7d: je        0x1458bcc91
1458bcc7f: mov       rcx, qword ptr [rsi + 0xdc8]
1458bcc86: mov       r8d, 1
1458bcc8c: call      0x1400021d0
1458bcc91: mov       rdx, qword ptr [rsi + 0xdd8]
1458bcc98: test      rdx, rdx
1458bcc9b: je        0x1458bccaf
1458bcc9d: mov       rcx, qword ptr [rsi + 0xde0]
1458bcca4: mov       r8d, 1
1458bccaa: call      0x1400021d0
1458bccaf: mov       rdx, qword ptr [rsi + 0xdf0]
1458bccb6: test      rdx, rdx
1458bccb9: je        0x1458bcccd
1458bccbb: mov       rcx, qword ptr [rsi + 0xdf8]
1458bccc2: mov       r8d, 1
1458bccc8: call      0x1400021d0
1458bcccd: mov       rdx, qword ptr [rsi + 0xe08]
1458bccd4: test      rdx, rdx
1458bccd7: je        0x1458bcceb
1458bccd9: mov       rcx, qword ptr [rsi + 0xe10]
1458bcce0: mov       r8d, 1
1458bcce6: call      0x1400021d0
1458bcceb: mov       rdx, qword ptr [rsi + 0xe20]
1458bccf2: test      rdx, rdx
1458bccf5: je        0x1458bcd09
1458bccf7: mov       rcx, qword ptr [rsi + 0xe28]
1458bccfe: mov       r8d, 1
1458bcd04: call      0x1400021d0
1458bcd09: mov       rdx, qword ptr [rsi + 0xe38]
1458bcd10: test      rdx, rdx
1458bcd13: je        0x1458bcd27
1458bcd15: mov       rcx, qword ptr [rsi + 0xe40]
1458bcd1c: mov       r8d, 1
1458bcd22: call      0x1400021d0
1458bcd27: mov       rdx, qword ptr [rsi + 0xe50]
1458bcd2e: test      rdx, rdx
1458bcd31: je        0x1458bcd45
1458bcd33: mov       rcx, qword ptr [rsi + 0xe58]
1458bcd3a: mov       r8d, 1
1458bcd40: call      0x1400021d0
1458bcd45: mov       rdx, qword ptr [rsi + 0xe68]
1458bcd4c: test      rdx, rdx
1458bcd4f: je        0x1458bcd63
1458bcd51: mov       rcx, qword ptr [rsi + 0xe70]
1458bcd58: mov       r8d, 1
1458bcd5e: call      0x1400021d0
1458bcd63: mov       rdx, qword ptr [rsi + 0xe80]
1458bcd6a: test      rdx, rdx
1458bcd6d: je        0x1458bcd81
1458bcd6f: mov       rcx, qword ptr [rsi + 0xe88]
1458bcd76: mov       r8d, 1
1458bcd7c: call      0x1400021d0
1458bcd81: mov       rdx, qword ptr [rsi + 0xe98]
1458bcd88: test      rdx, rdx
1458bcd8b: je        0x1458bcd9f
1458bcd8d: mov       rcx, qword ptr [rsi + 0xea0]
1458bcd94: mov       r8d, 1
1458bcd9a: call      0x1400021d0
1458bcd9f: mov       rdx, qword ptr [rsi + 0xeb0]
1458bcda6: test      rdx, rdx
1458bcda9: je        0x1458bcdbd
1458bcdab: mov       rcx, qword ptr [rsi + 0xeb8]
1458bcdb2: mov       r8d, 1
1458bcdb8: call      0x1400021d0
1458bcdbd: mov       dword ptr [rbp + 0x2118], r13d
1458bcdc4: mov       rdx, qword ptr [rsi + 0xec8]
1458bcdcb: test      rdx, rdx
1458bcdce: je        0x1458bcde2
1458bcdd0: mov       rcx, qword ptr [rsi + 0xed0]
1458bcdd7: mov       r8d, 1
1458bcddd: call      0x1400021d0
1458bcde2: mov       qword ptr [rsi + 0xd78], 0
1458bcded: mov       qword ptr [rsi + 0xd80], 1
1458bcdf8: xorps     xmm0, xmm0
1458bcdfb: movups    xmmword ptr [rsi + 0xd88], xmm0
1458bce02: mov       qword ptr [rsi + 0xd98], 1
1458bce0d: movups    xmmword ptr [rsi + 0xda0], xmm0
1458bce14: mov       qword ptr [rsi + 0xdb0], 1
1458bce1f: movups    xmmword ptr [rsi + 0xdb8], xmm0
1458bce26: mov       qword ptr [rsi + 0xdc8], 1
1458bce31: movups    xmmword ptr [rsi + 0xdd0], xmm0
1458bce38: mov       qword ptr [rsi + 0xde0], 1
1458bce43: movups    xmmword ptr [rsi + 0xde8], xmm0
1458bce4a: mov       qword ptr [rsi + 0xdf8], 1
1458bce55: movups    xmmword ptr [rsi + 0xe00], xmm0
1458bce5c: mov       qword ptr [rsi + 0xe10], 1
1458bce67: movups    xmmword ptr [rsi + 0xe18], xmm0
1458bce6e: mov       qword ptr [rsi + 0xe28], 1
1458bce79: movups    xmmword ptr [rsi + 0xe30], xmm0
1458bce80: mov       qword ptr [rsi + 0xe40], 1
1458bce8b: movups    xmmword ptr [rsi + 0xe48], xmm0
1458bce92: mov       qword ptr [rsi + 0xe58], 1
1458bce9d: movups    xmmword ptr [rsi + 0xe60], xmm0
1458bcea4: mov       qword ptr [rsi + 0xe70], 1
1458bceaf: movups    xmmword ptr [rsi + 0xe78], xmm0
1458bceb6: mov       qword ptr [rsi + 0xe88], 1
1458bcec1: movups    xmmword ptr [rsi + 0xe90], xmm0
1458bcec8: mov       qword ptr [rsi + 0xea0], 1
1458bced3: movups    xmmword ptr [rsi + 0xea8], xmm0
1458bceda: mov       qword ptr [rsi + 0xeb8], 1
1458bcee5: movups    xmmword ptr [rsi + 0xec0], xmm0
1458bceec: mov       qword ptr [rsi + 0xed0], 1
1458bcef7: mov       qword ptr [rsi + 0xed8], 0
1458bcf02: mov       qword ptr [rsi + 0x10e8], 0
