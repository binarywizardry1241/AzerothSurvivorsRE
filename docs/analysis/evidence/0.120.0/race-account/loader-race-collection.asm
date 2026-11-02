0000000145a8fff7  48c785c802000000000000 mov qword ptr [rbp + 0x2c8], 0
0000000145a90002  488b85c0030000         mov rax, qword ptr [rbp + 0x3c0]
0000000145a90009  488985d0020000         mov qword ptr [rbp + 0x2d0], rax
0000000145a90010  488b8db8030000         mov rcx, qword ptr [rbp + 0x3b8]
0000000145a90017  48898dd8020000         mov qword ptr [rbp + 0x2d8], rcx
0000000145a9001e  488985e0020000         mov qword ptr [rbp + 0x2e0], rax
0000000145a90025  48c785e802000000000000 mov qword ptr [rbp + 0x2e8], 0
0000000145a90030  488985f0020000         mov qword ptr [rbp + 0x2f0], rax
0000000145a90037  48b80a0000000a000000   movabs rax, 0xa0000000a
0000000145a90041  488985f8020000         mov qword ptr [rbp + 0x2f8], rax
0000000145a90048  c6850003000001         mov byte ptr [rbp + 0x300], 1
0000000145a9004f  66c785080300000000     mov word ptr [rbp + 0x308], 0
0000000145a90058  c78544030000ffffffff   mov dword ptr [rbp + 0x344], 0xffffffff
0000000145a90062  c7858c030000ffffffff   mov dword ptr [rbp + 0x38c], 0xffffffff
0000000145a9006c  488d8dc8000000         lea rcx, [rbp + 0xc8]
0000000145a90073  488d95c8020000         lea rdx, [rbp + 0x2c8]
0000000145a9007a  e8312a1b00             call 0x145c42ab0
0000000145a9007f  90                     nop
0000000145a90080  488bb5d8000000         mov rsi, qword ptr [rbp + 0xd8]
0000000145a90087  4883fe02               cmp rsi, 2
0000000145a9008b  0f83cf1c0000           jae 0x145a91d60
