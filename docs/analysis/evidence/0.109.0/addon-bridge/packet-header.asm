1458c363b: call      0x140002200
1458c3640: mov       ecx, 0x20
1458c3645: mov       edx, 1
1458c364a: call      0x1400021c0
1458c364f: test      rax, rax
1458c3652: je        0x1458c37ff
1458c3658: mov       byte ptr [rax], 6
1458c365b: mov       dword ptr [rax + 1], 0xffffffff
1458c3662: mov       qword ptr [rbp], 0x20
1458c366a: mov       qword ptr [rbp + 8], rax
1458c366e: mov       word ptr [rbp + 0x18], 0x96
1458c3674: mov       qword ptr [rax + 5], rdi
