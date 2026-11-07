145b528d0 55 push rbp
145b528d1 4157 push r15
145b528d3 4156 push r14
145b528d5 4155 push r13
145b528d7 4154 push r12
145b528d9 56 push rsi
145b528da 57 push rdi
145b528db 53 push rbx
145b528dc 4881ecb8010000 sub rsp, 0x1b8
145b528e3 488dac2480000000 lea rbp, [rsp + 0x80]
145b528eb 440f29a520010000 movaps xmmword ptr [rbp + 0x120], xmm12
145b528f3 440f299d10010000 movaps xmmword ptr [rbp + 0x110], xmm11
145b528fb 440f299500010000 movaps xmmword ptr [rbp + 0x100], xmm10
145b52903 66440f298df0000000 movapd xmmword ptr [rbp + 0xf0], xmm9
145b5290c 66440f2985e0000000 movapd xmmword ptr [rbp + 0xe0], xmm8
145b52915 0f29bdd0000000 movaps xmmword ptr [rbp + 0xd0], xmm7
145b5291c 0f29b5c0000000 movaps xmmword ptr [rbp + 0xc0], xmm6
145b52923 48c785b8000000feffffff mov qword ptr [rbp + 0xb8], 0xfffffffffffffffe
145b5292e 4489c3 mov ebx, r8d
145b52931 4989d5 mov r13, rdx
145b52934 4889ce mov rsi, rcx
145b52937 488b95a0010000 mov rdx, qword ptr [rbp + 0x1a0]
145b5293e 4c89c9 mov rcx, r9
145b52941 e8ba29fbff call 0x145b05300
145b52946 41389dcb000000 cmp byte ptr [r13 + 0xcb], bl
145b5294d 7560 jne 0x145b529af
145b5294f 4869f8f0000000 imul rdi, rax, 0xf0
145b52956 4c8d35537c4e01 lea r14, [rip + 0x14e7c53]
145b5295d 4c01f7 add rdi, r14
145b52960 4d8b7d08 mov r15, qword ptr [r13 + 8]
145b52964 498b5510 mov rdx, qword ptr [r13 + 0x10]
145b52968 4c89f9 mov rcx, r15
145b5296b e89029fbff call 0x145b05300
145b52970 4869c0f0000000 imul rax, rax, 0xf0
145b52977 4e8b443010 mov r8, qword ptr [rax + r14 + 0x10]
145b5297c 4c3b4710 cmp r8, qword ptr [rdi + 0x10]
145b52980 752d jne 0x145b529af
145b52982 4901c6 add r14, rax
145b52985 488b5708 mov rdx, qword ptr [rdi + 8]
145b52989 498b4e08 mov rcx, qword ptr [r14 + 8]
145b5298d e88fed5000 call 0x146061721
145b52992 85c0 test eax, eax
145b52994 7519 jne 0x145b529af
145b52996 66410f6ebd98000000 movd xmm7, dword ptr [r13 + 0x98]
145b5299f 660f7ef8 movd eax, xmm7
145b529a3 25ffffff7f and eax, 0x7fffffff
145b529a8 3dffff7f7f cmp eax, 0x7f7fffff
145b529ad 7e5c jle 0x145b52a0b
145b529af 48c706ffffffff mov qword ptr [rsi], 0xffffffffffffffff
145b529b6 4c89e9 mov rcx, r13
145b529b9 e8522fffff call 0x145b45910
145b529be 4889f0 mov rax, rsi
145b529c1 0f28b5c0000000 movaps xmm6, xmmword ptr [rbp + 0xc0]
145b529c8 0f28bdd0000000 movaps xmm7, xmmword ptr [rbp + 0xd0]
145b529cf 440f2885e0000000 movaps xmm8, xmmword ptr [rbp + 0xe0]
145b529d7 440f288df0000000 movaps xmm9, xmmword ptr [rbp + 0xf0]
145b529df 440f289500010000 movaps xmm10, xmmword ptr [rbp + 0x100]
145b529e7 440f289d10010000 movaps xmm11, xmmword ptr [rbp + 0x110]
145b529ef 440f28a520010000 movaps xmm12, xmmword ptr [rbp + 0x120]
145b529f7 4881c4b8010000 add rsp, 0x1b8
145b529fe 5b pop rbx
145b529ff 5f pop rdi
145b52a00 5e pop rsi
145b52a01 415c pop r12
145b52a03 415d pop r13
145b52a05 415e pop r14
145b52a07 415f pop r15
145b52a09 5d pop rbp
145b52a0a c3 ret
145b52a0b f20f10b5a8010000 movsd xmm6, qword ptr [rbp + 0x1a8]
145b52a13 f20f5835157b4801 addsd xmm6, qword ptr [rip + 0x1487b15]
145b52a1b 66450f57c9 xorpd xmm9, xmm9
145b52a20 66410f2ef1 ucomisd xmm6, xmm9
145b52a25 4c89ada8000000 mov qword ptr [rbp + 0xa8], r13
145b52a2c 4c897da8 mov qword ptr [rbp - 0x58], r15
145b52a30 0f8264050000 jb 0x145b52f9a
145b52a36 4c8bb788000000 mov r14, qword ptr [rdi + 0x88]
145b52a3d 4981fe60feffff cmp r14, -0x1a0
145b52a44 7419 je 0x145b52a5f
145b52a46 f3410f1086f0010000 movss xmm0, dword ptr [r14 + 0x1f0]
145b52a4f f3440f5ac0 cvtss2sd xmm8, xmm0
145b52a54 f2440f5905f3f27e00 mulsd xmm8, qword ptr [rip + 0x7ef2f3]
145b52a5d eb09 jmp 0x145b52a68
145b52a5f f2440f100540e14f01 movsd xmm8, qword ptr [rip + 0x14fe140]
145b52a68 e893f74afa call 0x140002200
145b52a6d b914000000 mov ecx, 0x14
145b52a72 ba04000000 mov edx, 4
145b52a77 e844f74afa call 0x1400021c0
145b52a7c 4885c0 test rax, rax
145b52a7f 0f846e050000 je 0x145b52ff3
145b52a85 0f57c0 xorps xmm0, xmm0
145b52a88 f30f5ac7 cvtss2sd xmm0, xmm7
145b52a8c f2440f5fc8 maxsd xmm9, xmm0
145b52a91 f2410f5df1 minsd xmm6, xmm9
145b52a96 f20f100512e14f01 movsd xmm0, qword ptr [rip + 0x14fe112]
145b52a9e f20f59c6 mulsd xmm0, xmm6
145b52aa2 f20f5805f6a66b00 addsd xmm0, qword ptr [rip + 0x6ba6f6]
145b52aaa f20f103de65f6f00 movsd xmm7, qword ptr [rip + 0x6f5fe6]
145b52ab2 f20f5dc7 minsd xmm0, xmm7
145b52ab6 660f57c9 xorpd xmm1, xmm1
145b52aba 660f57d2 xorpd xmm2, xmm2
145b52abe f20f5fd0 maxsd xmm2, xmm0
145b52ac2 660f28c7 movapd xmm0, xmm7
145b52ac6 f20f5dc2 minsd xmm0, xmm2
145b52aca f24c0f2cd0 cvttsd2si r10, xmm0
145b52acf 418d7a05 lea edi, [r10 + 5]
145b52ad3 418b4e40 mov ecx, dword ptr [r14 + 0x40]
145b52ad7 8908 mov dword ptr [rax], ecx
145b52ad9 418b8ea8000000 mov ecx, dword ptr [r14 + 0xa8]
145b52ae0 894804 mov dword ptr [rax + 4], ecx
145b52ae3 418b8e10010000 mov ecx, dword ptr [r14 + 0x110]
145b52aea 894808 mov dword ptr [rax + 8], ecx
145b52aed 418b8e78010000 mov ecx, dword ptr [r14 + 0x178]
145b52af4 89480c mov dword ptr [rax + 0xc], ecx
145b52af7 418b8ee0010000 mov ecx, dword ptr [r14 + 0x1e0]
145b52afe 894810 mov dword ptr [rax + 0x10], ecx
145b52b01 48c7858800000005000000 mov qword ptr [rbp + 0x88], 5
145b52b0c 48898590000000 mov qword ptr [rbp + 0x90], rax
145b52b13 418b8d9c000000 mov ecx, dword ptr [r13 + 0x9c]
145b52b1a 83f978 cmp ecx, 0x78
145b52b1d b878000000 mov eax, 0x78
145b52b22 0f42c1 cmovb eax, ecx
145b52b25 f20f1005037a4801 movsd xmm0, qword ptr [rip + 0x1487a03]
145b52b2d f20f58c6 addsd xmm0, xmm6
145b52b31 66410f2ec0 ucomisd xmm0, xmm8
145b52b36 f20f1005e2c39600 movsd xmm0, qword ptr [rip + 0x96c3e2]
145b52b3e f20f59c6 mulsd xmm0, xmm6
145b52b42 f20f5805ae934801 addsd xmm0, qword ptr [rip + 0x14893ae]
145b52b4a 48c7859800000005000000 mov qword ptr [rbp + 0x98], 5
145b52b55 f20f5dc7 minsd xmm0, xmm7
145b52b59 660f57d2 xorpd xmm2, xmm2
145b52b5d f20f5fd0 maxsd xmm2, xmm0
145b52b61 660f28c7 movapd xmm0, xmm7
145b52b65 f20f5dc2 minsd xmm0, xmm2
145b52b69 f2480f2cd0 cvttsd2si rdx, xmm0
145b52b6e f20f100532d08600 movsd xmm0, qword ptr [rip + 0x86d032]
145b52b76 f20f59c6 mulsd xmm0, xmm6
145b52b7a f20f58052e5f6f00 addsd xmm0, qword ptr [rip + 0x6f5f2e]
145b52b82 488d8d88000000 lea rcx, [rbp + 0x88]
145b52b89 f20f5dc7 minsd xmm0, xmm7
145b52b8d 660f57d2 xorpd xmm2, xmm2
145b52b91 f20f5fd0 maxsd xmm2, xmm0
145b52b95 660f28c7 movapd xmm0, xmm7
145b52b99 f20f5dc2 minsd xmm0, xmm2
145b52b9d f24c0f2cc0 cvttsd2si r8, xmm0
145b52ba2 f20f10051e9c8100 movsd xmm0, qword ptr [rip + 0x819c1e]
145b52baa f20f59c6 mulsd xmm0, xmm6
145b52bae f20f5805eaa56b00 addsd xmm0, qword ptr [rip + 0x6ba5ea]
145b52bb6 48898da0000000 mov qword ptr [rbp + 0xa0], rcx
145b52bbd f20f5dc7 minsd xmm0, xmm7
145b52bc1 660f57d2 xorpd xmm2, xmm2
145b52bc5 f20f5fd0 maxsd xmm2, xmm0
145b52bc9 660f28c7 movapd xmm0, xmm7
145b52bcd f20f5dc2 minsd xmm0, xmm2
145b52bd1 f24c0f2cc8 cvttsd2si r9, xmm0
145b52bd6 0f93c1 setae cl
145b52bd9 66410f6ed0 movd xmm2, r8d
145b52bde 660f6ec2 movd xmm0, edx
145b52be2 660f62c2 punpckldq xmm0, xmm2
145b52be6 66410f6ed9 movd xmm3, r9d
145b52beb 660f6ed7 movd xmm2, edi
145b52bef f20f1025999c8100 movsd xmm4, qword ptr [rip + 0x819c99]
145b52bf7 f20f59e6 mulsd xmm4, xmm6
145b52bfb f20f5825e5908400 addsd xmm4, qword ptr [rip + 0x8490e5]
145b52c03 f20f5de7 minsd xmm4, xmm7
145b52c07 f20f5fcc maxsd xmm1, xmm4
145b52c0b 660f28e7 movapd xmm4, xmm7
145b52c0f f20f5de1 minsd xmm4, xmm1
145b52c13 f24c0f2cc4 cvttsd2si r8, xmm4
145b52c18 418b95b0000000 mov edx, dword ptr [r13 + 0xb0]
145b52c1f 4139d0 cmp r8d, edx
145b52c22 410f42d0 cmovb edx, r8d
145b52c26 660f62da punpckldq xmm3, xmm2
145b52c2a 458b8dc8000000 mov r9d, dword ptr [r13 + 0xc8]
145b52c31 4180f905 cmp r9b, 5
145b52c35 41b805000000 mov r8d, 5
145b52c3b 450f42c1 cmovb r8d, r9d
145b52c3f 458b8db4000000 mov r9d, dword ptr [r13 + 0xb4]
145b52c46 4539ca cmp r10d, r9d
145b52c49 450f42ca cmovb r9d, r10d
145b52c4d 66410f6ea5b8000000 movd xmm4, dword ptr [r13 + 0xb8]
145b52c56 66410f7ee2 movd r10d, xmm4
145b52c5b 4181e2ffffff7f and r10d, 0x7fffffff
145b52c62 660f57c9 xorpd xmm1, xmm1
145b52c66 660fefd2 pxor xmm2, xmm2
145b52c6a 4181faffff7f7f cmp r10d, 0x7f7fffff
145b52c71 7f13 jg 0x145b52c86
145b52c73 0f57ed xorps xmm5, xmm5
145b52c76 f30f5fec maxss xmm5, xmm4
145b52c7a f30f101536df4f01 movss xmm2, dword ptr [rip + 0x14fdf36]
145b52c82 f30f5dd5 minss xmm2, xmm5
145b52c86 f3450f6f85a0000000 movdqu xmm8, xmmword ptr [r13 + 0xa0]
145b52c8f 660f6cc3 punpcklqdq xmm0, xmm3
145b52c93 660f6f2df5a56b00 movdqa xmm5, xmmword ptr [rip + 0x6ba5f5]
145b52c9b 0f57db xorps xmm3, xmm3
145b52c9e f20f5ade cvtsd2ss xmm3, xmm6
145b52ca2 66410f6ea5bc000000 movd xmm4, dword ptr [r13 + 0xbc]
145b52cab 66410f7ee2 movd r10d, xmm4
145b52cb0 4181e2ffffff7f and r10d, 0x7fffffff
145b52cb7 4181faffff7f7f cmp r10d, 0x7f7fffff
145b52cbe 7f17 jg 0x145b52cd7
145b52cc0 66450f57c9 xorpd xmm9, xmm9
145b52cc5 f3440f5fcc maxss xmm9, xmm4
145b52cca f30f100dbe6b7700 movss xmm1, dword ptr [rip + 0x776bbe]
145b52cd2 f3410f5dc9 minss xmm1, xmm9
145b52cd7 66440f6fc8 movdqa xmm9, xmm0
145b52cdc 66440fefcd pxor xmm9, xmm5
145b52ce1 66410fefe8 pxor xmm5, xmm8
145b52ce6 450fb69dc9000000 movzx r11d, byte ptr [r13 + 0xc9]
145b52cee 4180fb05 cmp r11b, 5
145b52cf2 41ba05000000 mov r10d, 5
145b52cf8 450f42d3 cmovb r10d, r11d
145b52cfc 450fb6b5ca000000 movzx r14d, byte ptr [r13 + 0xca]
145b52d04 4180fe06 cmp r14b, 6
145b52d08 41bb06000000 mov r11d, 6
145b52d0e 450f42de cmovb r11d, r14d
145b52d12 66450f6e95c0000000 movd xmm10, dword ptr [r13 + 0xc0]
145b52d1b 66450f7ed7 movd r15d, xmm10
145b52d20 4589fe mov r14d, r15d
145b52d23 4181e6ffffff7f and r14d, 0x7fffffff
145b52d2a 458da6000080ff lea r12d, [r14 - 0x800000]
145b52d31 66450f6fda movdqa xmm11, xmm10
145b52d36 f3440f5ddb minss xmm11, xmm3
145b52d3b 410f28e3 movaps xmm4, xmm11
145b52d3f f3410fc2e303 cmpunordss xmm4, xmm11
145b52d45 440f28e4 movaps xmm12, xmm4
145b52d49 450f55e3 andnps xmm12, xmm11
145b52d4d 410f54e2 andps xmm4, xmm10
145b52d51 410f56e4 orps xmm4, xmm12
145b52d55 f3440f101d7a036e00 movss xmm11, dword ptr [rip + 0x6e037a]
145b52d5e 450f28d3 movaps xmm10, xmm11
145b52d62 4585ff test r15d, r15d
145b52d65 7804 js 0x145b52d6b
145b52d67 440f28d4 movaps xmm10, xmm4
145b52d6b 66410f66e9 pcmpgtd xmm5, xmm9
145b52d70 41ffcf dec r15d
145b52d73 4181fc0000007f cmp r12d, 0x7f000000
145b52d7a 7204 jb 0x145b52d80
145b52d7c 450f28d3 movaps xmm10, xmm11
145b52d80 660fdbc5 pand xmm0, xmm5
145b52d84 66410fdfe8 pandn xmm5, xmm8
145b52d89 440f28c4 movaps xmm8, xmm4
145b52d8d 4181ffffff7f00 cmp r15d, 0x7fffff
145b52d94 7204 jb 0x145b52d9a
145b52d96 450f28c2 movaps xmm8, xmm10
145b52d9a 41228dc5000000 and cl, byte ptr [r13 + 0xc5]
145b52da1 660febc5 por xmm0, xmm5
145b52da5 4585f6 test r14d, r14d
145b52da8 7404 je 0x145b52dae
145b52daa 410f28e0 movaps xmm4, xmm8
145b52dae f30f115d48 movss dword ptr [rbp + 0x48], xmm3
145b52db3 458ab5c7000000 mov r14b, byte ptr [r13 + 0xc7]
145b52dba 44887577 mov byte ptr [rbp + 0x77], r14b
145b52dbe 458ab5c4000000 mov r14b, byte ptr [r13 + 0xc4]
145b52dc5 44887574 mov byte ptr [rbp + 0x74], r14b
145b52dc9 89454c mov dword ptr [rbp + 0x4c], eax
145b52dcc 884d75 mov byte ptr [rbp + 0x75], cl
145b52dcf 660f7f4550 movdqa xmmword ptr [rbp + 0x50], xmm0
145b52dd4 895560 mov dword ptr [rbp + 0x60], edx
145b52dd7 44884578 mov byte ptr [rbp + 0x78], r8b
145b52ddb 44894d64 mov dword ptr [rbp + 0x64], r9d
145b52ddf 660f7e5568 movd dword ptr [rbp + 0x68], xmm2
145b52de4 f30f114d6c movss dword ptr [rbp + 0x6c], xmm1
145b52de9 44885579 mov byte ptr [rbp + 0x79], r10b
145b52ded 44885d7a mov byte ptr [rbp + 0x7a], r11b
145b52df1 410fb685c6000000 movzx eax, byte ptr [r13 + 0xc6]
145b52df9 884576 mov byte ptr [rbp + 0x76], al
145b52dfc 885d7b mov byte ptr [rbp + 0x7b], bl
145b52dff 498b4510 mov rax, qword ptr [r13 + 0x10]
145b52e03 488945c0 mov qword ptr [rbp - 0x40], rax
145b52e07 410f104500 movups xmm0, xmmword ptr [r13]
145b52e0c 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
145b52e10 488d4dc8 lea rcx, [rbp - 0x38]
145b52e14 498b4528 mov rax, qword ptr [r13 + 0x28]
145b52e18 488945d8 mov qword ptr [rbp - 0x28], rax
145b52e1c 410f104518 movups xmm0, xmmword ptr [r13 + 0x18]
145b52e21 0f1145c8 movups xmmword ptr [rbp - 0x38], xmm0
145b52e25 498b4540 mov rax, qword ptr [r13 + 0x40]
145b52e29 488945f0 mov qword ptr [rbp - 0x10], rax
145b52e2d 410f104530 movups xmm0, xmmword ptr [r13 + 0x30]
145b52e32 0f2945e0 movaps xmmword ptr [rbp - 0x20], xmm0
145b52e36 410f104548 movups xmm0, xmmword ptr [r13 + 0x48]
145b52e3b 0f1145f8 movups xmmword ptr [rbp - 8], xmm0
145b52e3f 498b4558 mov rax, qword ptr [r13 + 0x58]
145b52e43 48894508 mov qword ptr [rbp + 8], rax
145b52e47 66410f104560 movupd xmm0, xmmword ptr [r13 + 0x60]
145b52e4d 410f104d70 movups xmm1, xmmword ptr [r13 + 0x70]
145b52e52 410f109580000000 movups xmm2, xmmword ptr [r13 + 0x80]
145b52e5a 660f294510 movapd xmmword ptr [rbp + 0x10], xmm0
145b52e5f 0f294d20 movaps xmmword ptr [rbp + 0x20], xmm1
145b52e63 0f295530 movaps xmmword ptr [rbp + 0x30], xmm2
145b52e67 498b8590000000 mov rax, qword ptr [r13 + 0x90]
145b52e6e 48894540 mov qword ptr [rbp + 0x40], rax
145b52e72 f30f116570 movss dword ptr [rbp + 0x70], xmm4
145b52e77 488d95a0000000 lea rdx, [rbp + 0xa0]
145b52e7e e8ad431900 call 0x145ce7230
145b52e83 90 nop
145b52e84 488d4de0 lea rcx, [rbp - 0x20]
145b52e88 89ff mov edi, edi
145b52e8a 48397dd8 cmp qword ptr [rbp - 0x28], rdi
145b52e8e 7204 jb 0x145b52e94
145b52e90 48897dd8 mov qword ptr [rbp - 0x28], rdi
145b52e94 488d95a0000000 lea rdx, [rbp + 0xa0]
145b52e9b e8e02a1900 call 0x145ce5980
145b52ea0 90 nop
145b52ea1 488d4df8 lea rcx, [rbp - 8]
145b52ea5 48397df0 cmp qword ptr [rbp - 0x10], rdi
145b52ea9 7204 jb 0x145b52eaf
145b52eab 48897df0 mov qword ptr [rbp - 0x10], rdi
145b52eaf 488d9588000000 lea rdx, [rbp + 0x88]
145b52eb6 e805471900 call 0x145ce75c0
145b52ebb 90 nop
145b52ebc 488b8598000000 mov rax, qword ptr [rbp + 0x98]
145b52ec3 483b4508 cmp rax, qword ptr [rbp + 8]
145b52ec7 7704 ja 0x145b52ecd
145b52ec9 48894508 mov qword ptr [rbp + 8], rax
145b52ecd 48837d10ff cmp qword ptr [rbp + 0x10], -1
145b52ed2 744e je 0x145b52f22
145b52ed4 488d4d28 lea rcx, [rbp + 0x28]
145b52ed8 488d95a0000000 lea rdx, [rbp + 0xa0]
145b52edf e86c2c1900 call 0x145ce5b50
145b52ee4 90 nop
145b52ee5 488b5d38 mov rbx, qword ptr [rbp + 0x38]
145b52ee9 4829fb sub rbx, rdi
145b52eec 720a jb 0x145b52ef8
145b52eee 488b4530 mov rax, qword ptr [rbp + 0x30]
145b52ef2 48897d38 mov qword ptr [rbp + 0x38], rdi
145b52ef6 7567 jne 0x145b52f5f
145b52ef8 660f57c0 xorpd xmm0, xmm0
145b52efc f20f5fc6 maxsd xmm0, xmm6
145b52f00 f20f5df8 minsd xmm7, xmm0
145b52f04 f2480f2cc7 cvttsd2si rax, xmm7
145b52f09 8b4d40 mov ecx, dword ptr [rbp + 0x40]
145b52f0c 8b5544 mov edx, dword ptr [rbp + 0x44]
145b52f0f 39c8 cmp eax, ecx
145b52f11 0f42c8 cmovb ecx, eax
145b52f14 894d40 mov dword ptr [rbp + 0x40], ecx
145b52f17 8b4578 mov eax, dword ptr [rbp + 0x78]
145b52f1a 38d0 cmp al, dl
145b52f1c 0f42d0 cmovb edx, eax
145b52f1f 885544 mov byte ptr [rbp + 0x44], dl
145b52f22 488d55b0 lea rdx, [rbp - 0x50]
145b52f26 41b8d0000000 mov r8d, 0xd0
145b52f2c 4889f1 mov rcx, rsi
145b52f2f e8e7e75000 call 0x14606171b
145b52f34 488b9588000000 mov rdx, qword ptr [rbp + 0x88]
145b52f3b 4885d2 test rdx, rdx
145b52f3e 0f847afaffff je 0x145b529be
145b52f44 488b8d90000000 mov rcx, qword ptr [rbp + 0x90]
145b52f4b 48c1e202 shl rdx, 2
145b52f4f 41b804000000 mov r8d, 4
145b52f55 e876f24afa call 0x1400021d0
145b52f5a e95ffaffff jmp 0x145b529be
145b52f5f 488d0cbf lea rcx, [rdi + rdi*4]
145b52f63 488d3cc8 lea rdi, [rax + rcx*8]
145b52f67 4883c708 add rdi, 8
145b52f6b eb10 jmp 0x145b52f7d
145b52f6d 0f1f00 nop dword ptr [rax]
145b52f70 4883c728 add rdi, 0x28
145b52f74 48ffcb dec rbx
145b52f77 0f847bffffff je 0x145b52ef8
145b52f7d 488b57f8 mov rdx, qword ptr [rdi - 8]
145b52f81 4885d2 test rdx, rdx
145b52f84 74ea je 0x145b52f70
145b52f86 488b0f mov rcx, qword ptr [rdi]
145b52f89 48c1e203 shl rdx, 3
145b52f8d 41b804000000 mov r8d, 4
145b52f93 e838f24afa call 0x1400021d0
145b52f98 ebd6 jmp 0x145b52f70
145b52f9a 48c785a000000000000000 mov qword ptr [rbp + 0xa0], 0
145b52fa5 f20f11b588000000 movsd qword ptr [rbp + 0x88], xmm6
145b52fad 488d85a0000000 lea rax, [rbp + 0xa0]
145b52fb4 488945b0 mov qword ptr [rbp - 0x50], rax
145b52fb8 488d0581264f00 lea rax, [rip + 0x4f2681]
145b52fbf 488945b8 mov qword ptr [rbp - 0x48], rax
145b52fc3 488d8d88000000 lea rcx, [rbp + 0x88]
145b52fca 48894dc0 mov qword ptr [rbp - 0x40], rcx
145b52fce 488945c8 mov qword ptr [rbp - 0x38], rax
145b52fd2 c685b700000000 mov byte ptr [rbp + 0xb7], 0
145b52fd9 488d0d03e34f01 lea rcx, [rip + 0x14fe303]
145b52fe0 4c8d0579e34f01 lea r8, [rip + 0x14fe379]
145b52fe7 488d55b0 lea rdx, [rbp - 0x50]
145b52feb e8f05e6b00 call 0x146208ee0
145b52ff0 90 nop
145b52ff1 eb17 jmp 0x145b5300a
145b52ff3 c685b700000000 mov byte ptr [rbp + 0xb7], 0
145b52ffa b904000000 mov ecx, 4
145b52fff ba14000000 mov edx, 0x14
145b53004 e862596b00 call 0x14620896b
145b53009 90 nop
145b5300a 0f0b ud2
