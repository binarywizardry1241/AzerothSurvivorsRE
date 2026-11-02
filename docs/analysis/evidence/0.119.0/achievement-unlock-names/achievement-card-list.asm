0000000140267f30  55                     push rbp
0000000140267f31  4157                   push r15
0000000140267f33  4156                   push r14
0000000140267f35  4155                   push r13
0000000140267f37  4154                   push r12
0000000140267f39  56                     push rsi
0000000140267f3a  57                     push rdi
0000000140267f3b  53                     push rbx
0000000140267f3c  4881ec38040000         sub rsp, 0x438
0000000140267f43  488dac2480000000       lea rbp, [rsp + 0x80]
0000000140267f4b  440f29bda0030000       movaps xmmword ptr [rbp + 0x3a0], xmm15
0000000140267f53  440f29b590030000       movaps xmmword ptr [rbp + 0x390], xmm14
0000000140267f5b  440f29ad80030000       movaps xmmword ptr [rbp + 0x380], xmm13
0000000140267f63  440f29a570030000       movaps xmmword ptr [rbp + 0x370], xmm12
0000000140267f6b  440f299d60030000       movaps xmmword ptr [rbp + 0x360], xmm11
0000000140267f73  440f299550030000       movaps xmmword ptr [rbp + 0x350], xmm10
0000000140267f7b  440f298d40030000       movaps xmmword ptr [rbp + 0x340], xmm9
0000000140267f83  440f298530030000       movaps xmmword ptr [rbp + 0x330], xmm8
0000000140267f8b  0f29bd20030000         movaps xmmword ptr [rbp + 0x320], xmm7
0000000140267f92  0f29b510030000         movaps xmmword ptr [rbp + 0x310], xmm6
0000000140267f99  48c78508030000feffffff mov qword ptr [rbp + 0x308], 0xfffffffffffffffe
0000000140267fa4  4c89ce                 mov rsi, r9
0000000140267fa7  4c89c7                 mov rdi, r8
0000000140267faa  4889d3                 mov rbx, rdx
0000000140267fad  4989ce                 mov r14, rcx
0000000140267fb0  488d0dcd57f305         lea rcx, [rip + 0x5f357cd]
0000000140267fb7  ba07000000             mov edx, 7
0000000140267fbc  e83f1a8c05             call 0x145b29a00
0000000140267fc1  488985d0020000         mov qword ptr [rbp + 0x2d0], rax
0000000140267fc8  488995d8020000         mov qword ptr [rbp + 0x2d8], rdx
0000000140267fcf  0f57c0                 xorps xmm0, xmm0
0000000140267fd2  0f118590010000         movups xmmword ptr [rbp + 0x190], xmm0
0000000140267fd9  0f118580010000         movups xmmword ptr [rbp + 0x180], xmm0
0000000140267fe0  0f1185a8010000         movups xmmword ptr [rbp + 0x1a8], xmm0
0000000140267fe7  0f1185b8010000         movups xmmword ptr [rbp + 0x1b8], xmm0
0000000140267fee  48c785c801000000000000 mov qword ptr [rbp + 0x1c8], 0
0000000140267ff9  0f10051025f305         movups xmm0, xmmword ptr [rip + 0x5f32510]
0000000140268000  0f2945c0               movaps xmmword ptr [rbp - 0x40], xmm0
0000000140268004  488b051525f305         mov rax, qword ptr [rip + 0x5f32515]
000000014026800b  488945d0               mov qword ptr [rbp - 0x30], rax
000000014026800f  0f10051225f305         movups xmm0, xmmword ptr [rip + 0x5f32512]
0000000140268016  0f1145d8               movups xmmword ptr [rbp - 0x28], xmm0
000000014026801a  488b051725f305         mov rax, qword ptr [rip + 0x5f32517]
0000000140268021  488945e8               mov qword ptr [rbp - 0x18], rax
0000000140268025  0f10051425f305         movups xmm0, xmmword ptr [rip + 0x5f32514]
000000014026802c  0f2945f0               movaps xmmword ptr [rbp - 0x10], xmm0
0000000140268030  488b051925f305         mov rax, qword ptr [rip + 0x5f32519]
0000000140268037  48894500               mov qword ptr [rbp], rax
000000014026803b  488b052625f305         mov rax, qword ptr [rip + 0x5f32526]
0000000140268042  48894518               mov qword ptr [rbp + 0x18], rax
0000000140268046  0f10050b25f305         movups xmm0, xmmword ptr [rip + 0x5f3250b]
000000014026804d  0f114508               movups xmmword ptr [rbp + 8], xmm0
0000000140268051  498b06                 mov rax, qword ptr [r14]
0000000140268054  498d5608               lea rdx, [r14 + 8]
0000000140268058  488b4d10               mov rcx, qword ptr [rbp + 0x10]
000000014026805c  48898d68010000         mov qword ptr [rbp + 0x168], rcx
0000000140268063  488b4d18               mov rcx, qword ptr [rbp + 0x18]
0000000140268067  48898d70010000         mov qword ptr [rbp + 0x170], rcx
000000014026806e  488b4d00               mov rcx, qword ptr [rbp]
0000000140268072  48898d58010000         mov qword ptr [rbp + 0x158], rcx
0000000140268079  488b4d08               mov rcx, qword ptr [rbp + 8]
000000014026807d  48898d60010000         mov qword ptr [rbp + 0x160], rcx
0000000140268084  0f2845c0               movaps xmm0, xmmword ptr [rbp - 0x40]
0000000140268088  0f284dd0               movaps xmm1, xmmword ptr [rbp - 0x30]
000000014026808c  0f2855e0               movaps xmm2, xmmword ptr [rbp - 0x20]
0000000140268090  0f285df0               movaps xmm3, xmmword ptr [rbp - 0x10]
0000000140268094  0f119d48010000         movups xmmword ptr [rbp + 0x148], xmm3
000000014026809b  0f119538010000         movups xmmword ptr [rbp + 0x138], xmm2
00000001402680a2  0f118d28010000         movups xmmword ptr [rbp + 0x128], xmm1
00000001402680a9  0f118518010000         movups xmmword ptr [rbp + 0x118], xmm0
00000001402680b0  48c7857801000000000000 mov qword ptr [rbp + 0x178], 0
00000001402680bb  48b9020000000000c842   movabs rcx, 0x42c8000000000002
00000001402680c5  48898da0010000         mov qword ptr [rbp + 0x1a0], rcx
00000001402680cc  0f1005f524f305         movups xmm0, xmmword ptr [rip + 0x5f324f5]
00000001402680d3  0f1185d0010000         movups xmmword ptr [rbp + 0x1d0], xmm0
00000001402680da  0f1005f724f305         movups xmm0, xmmword ptr [rip + 0x5f324f7]
00000001402680e1  0f1185e0010000         movups xmmword ptr [rbp + 0x1e0], xmm0
00000001402680e8  0f10050925f305         movups xmm0, xmmword ptr [rip + 0x5f32509]
00000001402680ef  0f118500020000         movups xmmword ptr [rbp + 0x200], xmm0
00000001402680f6  0f1005eb24f305         movups xmm0, xmmword ptr [rip + 0x5f324eb]
00000001402680fd  0f1185f0010000         movups xmmword ptr [rbp + 0x1f0], xmm0
0000000140268104  0f10050d25f305         movups xmm0, xmmword ptr [rip + 0x5f3250d]
000000014026810b  0f118520020000         movups xmmword ptr [rbp + 0x220], xmm0
0000000140268112  0f1005ef24f305         movups xmm0, xmmword ptr [rip + 0x5f324ef]
0000000140268119  0f118510020000         movups xmmword ptr [rbp + 0x210], xmm0
0000000140268120  0f10051125f305         movups xmm0, xmmword ptr [rip + 0x5f32511]
0000000140268127  0f118540020000         movups xmmword ptr [rbp + 0x240], xmm0
000000014026812e  0f1005f324f305         movups xmm0, xmmword ptr [rip + 0x5f324f3]
0000000140268135  0f118530020000         movups xmmword ptr [rbp + 0x230], xmm0
000000014026813c  0f2805fdb9ef05         movaps xmm0, xmmword ptr [rip + 0x5efb9fd]
0000000140268143  0f118550020000         movups xmmword ptr [rbp + 0x250], xmm0
000000014026814a  c7856002000001000000   mov dword ptr [rbp + 0x260], 1
0000000140268154  f30f10053cbaef05       movss xmm0, dword ptr [rip + 0x5efba3c]
000000014026815c  0f138564020000         movlps qword ptr [rbp + 0x264], xmm0
0000000140268163  c6856c02000001         mov byte ptr [rbp + 0x26c], 1
000000014026816a  48c7857002000000000000 mov qword ptr [rbp + 0x270], 0
0000000140268175  c785780200000000803f   mov dword ptr [rbp + 0x278], 0x3f800000
000000014026817f  66c7857c0200000000     mov word ptr [rbp + 0x27c], 0
0000000140268188  0fb70deb24f305         movzx ecx, word ptr [rip + 0x5f324eb]
000000014026818f  66898d82020000         mov word ptr [rbp + 0x282], cx
0000000140268196  8b0dda24f305           mov ecx, dword ptr [rip + 0x5f324da]
000000014026819c  898d7e020000           mov dword ptr [rbp + 0x27e], ecx
00000001402681a2  0fb70dd724f305         movzx ecx, word ptr [rip + 0x5f324d7]
00000001402681a9  66898d88020000         mov word ptr [rbp + 0x288], cx
00000001402681b0  8b0dc624f305           mov ecx, dword ptr [rip + 0x5f324c6]
00000001402681b6  898d84020000           mov dword ptr [rbp + 0x284], ecx
00000001402681bc  48c7858a02000000000000 mov qword ptr [rbp + 0x28a], 0
00000001402681c7  c7859202000005000000   mov dword ptr [rbp + 0x292], 5
00000001402681d1  48898510010000         mov qword ptr [rbp + 0x110], rax
00000001402681d8  4c8d0d31c5ef05         lea r9, [rip + 0x5efc531]
00000001402681df  4c8dbd98020000         lea r15, [rbp + 0x298]
00000001402681e6  4c8d8510010000         lea r8, [rbp + 0x110]
00000001402681ed  4c89f9                 mov rcx, r15
00000001402681f0  488995c8020000         mov qword ptr [rbp + 0x2c8], rdx
00000001402681f7  e8740e0500             call 0x1402b9070
00000001402681fc  4c8d85d0020000         lea r8, [rbp + 0x2d0]
0000000140268203  4c89f9                 mov rcx, r15
0000000140268206  4889da                 mov rdx, rbx
0000000140268209  e8127c0a00             call 0x14030fe20
000000014026820e  e80d0e8d05             call 0x145b39020
0000000140268213  4869ca98000000         imul rcx, rdx, 0x98
000000014026821a  4801c1                 add rcx, rax
000000014026821d  48898510010000         mov qword ptr [rbp + 0x110], rax
0000000140268224  48898d18010000         mov qword ptr [rbp + 0x118], rcx
000000014026822b  4889b520010000         mov qword ptr [rbp + 0x120], rsi
0000000140268232  488d8df8000000         lea rcx, [rbp + 0xf8]
0000000140268239  488d9510010000         lea rdx, [rbp + 0x110]
0000000140268240  e88b6ce7ff             call 0x1400deed0
0000000140268245  4c8bad00010000         mov r13, qword ptr [rbp + 0x100]
000000014026824c  4c8ba508010000         mov r12, qword ptr [rbp + 0x108]
0000000140268253  488975c0               mov qword ptr [rbp - 0x40], rsi
0000000140268257  488d45c0               lea rax, [rbp - 0x40]
000000014026825b  48898510010000         mov qword ptr [rbp + 0x110], rax
0000000140268262  4983fc01               cmp r12, 1
0000000140268266  0f87400f0000           ja 0x1402691ac
000000014026826c  c6850703000001         mov byte ptr [rbp + 0x307], 1
0000000140268273  488d0d1155f305         lea rcx, [rip + 0x5f35511]
000000014026827a  ba0f000000             mov edx, 0xf
000000014026827f  e87c178c05             call 0x145b29a00
0000000140268284  90                     nop
0000000140268285  488985d0020000         mov qword ptr [rbp + 0x2d0], rax
000000014026828c  488995d8020000         mov qword ptr [rbp + 0x2d8], rdx
0000000140268293  0f57c0                 xorps xmm0, xmm0
0000000140268296  0f294560               movaps xmmword ptr [rbp + 0x60], xmm0
000000014026829a  0f294550               movaps xmmword ptr [rbp + 0x50], xmm0
000000014026829e  0f294540               movaps xmmword ptr [rbp + 0x40], xmm0
00000001402682a2  0f294530               movaps xmmword ptr [rbp + 0x30], xmm0
00000001402682a6  0f294520               movaps xmmword ptr [rbp + 0x20], xmm0
00000001402682aa  48c7457000000000       mov qword ptr [rbp + 0x70], 0
00000001402682b2  0f10051f52f305         movups xmm0, xmmword ptr [rip + 0x5f3521f]
00000001402682b9  0f2945c0               movaps xmmword ptr [rbp - 0x40], xmm0
00000001402682bd  48c745d000000000       mov qword ptr [rbp - 0x30], 0
00000001402682c5  0f10052452f305         movups xmm0, xmmword ptr [rip + 0x5f35224]
00000001402682cc  0f1145d8               movups xmmword ptr [rbp - 0x28], xmm0
00000001402682d0  48c745e800000000       mov qword ptr [rbp - 0x18], 0
00000001402682d8  0f10052952f305         movups xmm0, xmmword ptr [rip + 0x5f35229]
00000001402682df  0f2945f0               movaps xmmword ptr [rbp - 0x10], xmm0
00000001402682e3  48c7450000000000       mov qword ptr [rbp], 0
00000001402682eb  440f100d2d52f305       movups xmm9, xmmword ptr [rip + 0x5f3522d]
00000001402682f3  440f114d08             movups xmmword ptr [rbp + 8], xmm9
00000001402682f8  48c7451800000000       mov qword ptr [rbp + 0x18], 0
0000000140268300  4d8b3e                 mov r15, qword ptr [r14]
0000000140268303  488d8d18010000         lea rcx, [rbp + 0x118]
000000014026830a  488d55c0               lea rdx, [rbp - 0x40]
000000014026830e  41b8b8000000           mov r8d, 0xb8
0000000140268314  e8c2bed205             call 0x145f941db
0000000140268319  0f2805f0baef05         movaps xmm0, xmmword ptr [rip + 0x5efbaf0]
0000000140268320  0f1185d0010000         movups xmmword ptr [rbp + 0x1d0], xmm0
0000000140268327  0f2805b222f105         movaps xmm0, xmmword ptr [rip + 0x5f122b2]
000000014026832e  0f1185e0010000         movups xmmword ptr [rbp + 0x1e0], xmm0
0000000140268335  440f10157352f305       movups xmm10, xmmword ptr [rip + 0x5f35273]
000000014026833d  440f1195f0010000       movups xmmword ptr [rbp + 0x1f0], xmm10
0000000140268345  440f101d7352f305       movups xmm11, xmmword ptr [rip + 0x5f35273]
000000014026834d  440f119d00020000       movups xmmword ptr [rbp + 0x200], xmm11
0000000140268355  440f10257352f305       movups xmm12, xmmword ptr [rip + 0x5f35273]
000000014026835d  440f11a510020000       movups xmmword ptr [rbp + 0x210], xmm12
0000000140268365  440f102d7352f305       movups xmm13, xmmword ptr [rip + 0x5f35273]
000000014026836d  440f11ad20020000       movups xmmword ptr [rbp + 0x220], xmm13
0000000140268375  440f10357352f305       movups xmm14, xmmword ptr [rip + 0x5f35273]
000000014026837d  440f11b530020000       movups xmmword ptr [rbp + 0x230], xmm14
0000000140268385  440f103d7352f305       movups xmm15, xmmword ptr [rip + 0x5f35273]
000000014026838d  440f11bd40020000       movups xmmword ptr [rbp + 0x240], xmm15
0000000140268395  0f2805a4b7ef05         movaps xmm0, xmmword ptr [rip + 0x5efb7a4]
000000014026839c  0f118550020000         movups xmmword ptr [rbp + 0x250], xmm0
00000001402683a3  c7856002000001000000   mov dword ptr [rbp + 0x260], 1
00000001402683ad  f30f10054bbaef05       movss xmm0, dword ptr [rip + 0x5efba4b]
00000001402683b5  0f138564020000         movlps qword ptr [rbp + 0x264], xmm0
00000001402683bc  c6856c02000001         mov byte ptr [rbp + 0x26c], 1
00000001402683c3  48c7857002000000000000 mov qword ptr [rbp + 0x270], 0
00000001402683ce  c785780200000000803f   mov dword ptr [rbp + 0x278], 0x3f800000
00000001402683d8  66c7857c0200000000     mov word ptr [rbp + 0x27c], 0
00000001402683e1  66c785820200000000     mov word ptr [rbp + 0x282], 0
00000001402683ea  c7857e02000000000100   mov dword ptr [rbp + 0x27e], 0x10000
00000001402683f4  c7858402000000000100   mov dword ptr [rbp + 0x284], 0x10000
00000001402683fe  66c785880200000000     mov word ptr [rbp + 0x288], 0
0000000140268407  48c7858a02000000000000 mov qword ptr [rbp + 0x28a], 0
0000000140268412  c7859202000005000000   mov dword ptr [rbp + 0x292], 5
000000014026841c  4c89bd10010000         mov qword ptr [rbp + 0x110], r15
0000000140268423  c6850703000001         mov byte ptr [rbp + 0x307], 1
000000014026842a  4c8d0ddfc2ef05         lea r9, [rip + 0x5efc2df]
0000000140268431  488d8d98020000         lea rcx, [rbp + 0x298]
0000000140268438  4c8d8510010000         lea r8, [rbp + 0x110]
000000014026843f  498d5608               lea rdx, [r14 + 8]
0000000140268443  e8280c0500             call 0x1402b9070
0000000140268448  90                     nop
0000000140268449  c6850703000001         mov byte ptr [rbp + 0x307], 1
0000000140268450  488d8d98020000         lea rcx, [rbp + 0x298]
0000000140268457  4c8d85d0020000         lea r8, [rbp + 0x2d0]
000000014026845e  4889da                 mov rdx, rbx
0000000140268461  e8ea560700             call 0x1402ddb50
0000000140268466  90                     nop
0000000140268467  4c8ba508010000         mov r12, qword ptr [rbp + 0x108]
000000014026846e  4d85e4                 test r12, r12
0000000140268471  0f8480020000           je 0x1402686f7
0000000140268477  c7852801000000000200   mov dword ptr [rbp + 0x128], 0x20000
0000000140268481  0f28056858f205         movaps xmm0, xmmword ptr [rip + 0x5f25868]
0000000140268488  0f118510010000         movups xmmword ptr [rbp + 0x110], xmm0
000000014026848f  48c7852001000001000000 mov qword ptr [rbp + 0x120], 1
000000014026849a  c6850703000001         mov byte ptr [rbp + 0x307], 1
00000001402684a1  488d8d98020000         lea rcx, [rbp + 0x298]
00000001402684a8  488d9510010000         lea rdx, [rbp + 0x110]
00000001402684af  e8ccb86702             call 0x1428e3d80
00000001402684b4  90                     nop
00000001402684b5  0f57c0                 xorps xmm0, xmm0
00000001402684b8  0f294520               movaps xmmword ptr [rbp + 0x20], xmm0
00000001402684bc  0f294530               movaps xmmword ptr [rbp + 0x30], xmm0
00000001402684c0  0f294540               movaps xmmword ptr [rbp + 0x40], xmm0
00000001402684c4  0f294550               movaps xmmword ptr [rbp + 0x50], xmm0
00000001402684c8  0f294560               movaps xmmword ptr [rbp + 0x60], xmm0
00000001402684cc  48c7457000000000       mov qword ptr [rbp + 0x70], 0
00000001402684d4  0f1005b550f305         movups xmm0, xmmword ptr [rip + 0x5f350b5]
00000001402684db  0f114578               movups xmmword ptr [rbp + 0x78], xmm0
00000001402684df  0f1005ba50f305         movups xmm0, xmmword ptr [rip + 0x5f350ba]
00000001402684e6  0f118588000000         movups xmmword ptr [rbp + 0x88], xmm0
00000001402684ed  440f119598000000       movups xmmword ptr [rbp + 0x98], xmm10
00000001402684f5  440f119da8000000       movups xmmword ptr [rbp + 0xa8], xmm11
00000001402684fd  440f11a5b8000000       movups xmmword ptr [rbp + 0xb8], xmm12
0000000140268505  440f11adc8000000       movups xmmword ptr [rbp + 0xc8], xmm13
000000014026850d  440f11bde8000000       movups xmmword ptr [rbp + 0xe8], xmm15
0000000140268515  440f11b5d8000000       movups xmmword ptr [rbp + 0xd8], xmm14
000000014026851d  0f1005b44ff305         movups xmm0, xmmword ptr [rip + 0x5f34fb4]
0000000140268524  0f2945c0               movaps xmmword ptr [rbp - 0x40], xmm0
0000000140268528  48c745d000000000       mov qword ptr [rbp - 0x30], 0
0000000140268530  0f108598020000         movups xmm0, xmmword ptr [rbp + 0x298]
0000000140268537  0f1145d8               movups xmmword ptr [rbp - 0x28], xmm0
000000014026853b  488b85a8020000         mov rax, qword ptr [rbp + 0x2a8]
0000000140268542  488945e8               mov qword ptr [rbp - 0x18], rax
0000000140268546  0f1005bb4ff305         movups xmm0, xmmword ptr [rip + 0x5f34fbb]
000000014026854d  0f2945f0               movaps xmmword ptr [rbp - 0x10], xmm0
0000000140268551  48c7450000000000       mov qword ptr [rbp], 0
0000000140268559  440f114d08             movups xmmword ptr [rbp + 8], xmm9
000000014026855e  48c7451800000000       mov qword ptr [rbp + 0x18], 0
0000000140268566  4d8b3e                 mov r15, qword ptr [r14]
0000000140268569  488d8d18010000         lea rcx, [rbp + 0x118]
0000000140268570  488d55c0               lea rdx, [rbp - 0x40]
0000000140268574  41b838010000           mov r8d, 0x138
000000014026857a  e85cbcd205             call 0x145f941db
000000014026857f  0f2805da20f105         movaps xmm0, xmmword ptr [rip + 0x5f120da]
0000000140268586  0f118550020000         movups xmmword ptr [rbp + 0x250], xmm0
000000014026858d  c7856002000001000000   mov dword ptr [rbp + 0x260], 1
0000000140268597  f30f1005f1bbef05       movss xmm0, dword ptr [rip + 0x5efbbf1]
000000014026859f  0f138564020000         movlps qword ptr [rbp + 0x264], xmm0
00000001402685a6  c6856c02000001         mov byte ptr [rbp + 0x26c], 1
00000001402685ad  48c7857002000000000000 mov qword ptr [rbp + 0x270], 0
00000001402685b8  c785780200000000803f   mov dword ptr [rbp + 0x278], 0x3f800000
00000001402685c2  66c7857c0200000000     mov word ptr [rbp + 0x27c], 0
00000001402685cb  c7857e02000000000100   mov dword ptr [rbp + 0x27e], 0x10000
00000001402685d5  66c785820200000000     mov word ptr [rbp + 0x282], 0
00000001402685de  c7858402000000000100   mov dword ptr [rbp + 0x284], 0x10000
00000001402685e8  66c785880200000000     mov word ptr [rbp + 0x288], 0
00000001402685f1  c7858a02000000000001   mov dword ptr [rbp + 0x28a], 0x1000000
00000001402685fb  48c7858e02000000000000 mov qword ptr [rbp + 0x28e], 0
0000000140268606  4c89bd10010000         mov qword ptr [rbp + 0x110], r15
000000014026860d  c6850503000001         mov byte ptr [rbp + 0x305], 1
0000000140268614  4c8d0df5c0ef05         lea r9, [rip + 0x5efc0f5]
000000014026861b  488d8d98020000         lea rcx, [rbp + 0x298]
0000000140268622  4c8d8510010000         lea r8, [rbp + 0x110]
0000000140268629  498d5608               lea rdx, [r14 + 8]
000000014026862d  e83e0a0500             call 0x1402b9070
0000000140268632  90                     nop
0000000140268633  488b85f8000000         mov rax, qword ptr [rbp + 0xf8]
000000014026863a  488985f8020000         mov qword ptr [rbp + 0x2f8], rax
0000000140268641  488b8500010000         mov rax, qword ptr [rbp + 0x100]
0000000140268648  488985f0020000         mov qword ptr [rbp + 0x2f0], rax
000000014026864f  488b8598020000         mov rax, qword ptr [rbp + 0x298]
0000000140268656  488b8dc0020000         mov rcx, qword ptr [rbp + 0x2c0]
000000014026865d  48898510010000         mov qword ptr [rbp + 0x110], rax
0000000140268664  0f1085a0020000         movups xmm0, xmmword ptr [rbp + 0x2a0]
000000014026866b  0f118518010000         movups xmmword ptr [rbp + 0x118], xmm0
0000000140268672  0f1085b0020000         movups xmm0, xmmword ptr [rbp + 0x2b0]
0000000140268679  0f118528010000         movups xmmword ptr [rbp + 0x128], xmm0
0000000140268680  48898d38010000         mov qword ptr [rbp + 0x138], rcx
0000000140268687  49c1e403               shl r12, 3
000000014026868b  4531ed                 xor r13d, r13d
000000014026868e  4c8dbd10010000         lea r15, [rbp + 0x110]
0000000140268695  66662e0f1f840000000000 nop word ptr cs:[rax + rax]
00000001402686a0  4d39ec                 cmp r12, r13
00000001402686a3  7428                   je 0x1402686cd
00000001402686a5  488b85f0020000         mov rax, qword ptr [rbp + 0x2f0]
00000001402686ac  4a8b0428               mov rax, qword ptr [rax + r13]
00000001402686b0  4983c508               add r13, 8
00000001402686b4  4889442420             mov qword ptr [rsp + 0x20], rax
00000001402686b9  4c89f9                 mov rcx, r15
00000001402686bc  4889da                 mov rdx, rbx
00000001402686bf  4989f8                 mov r8, rdi
00000001402686c2  4989f1                 mov r9, rsi
00000001402686c5  e8a6c4ffff             call 0x140264b70
00000001402686ca  90                     nop
00000001402686cb  ebd3                   jmp 0x1402686a0
00000001402686cd  488b95f8020000         mov rdx, qword ptr [rbp + 0x2f8]
00000001402686d4  4885d2                 test rdx, rdx
00000001402686d7  7416                   je 0x1402686ef
00000001402686d9  48c1e203               shl rdx, 3
00000001402686dd  41b808000000           mov r8d, 8
00000001402686e3  488b8df0020000         mov rcx, qword ptr [rbp + 0x2f0]
00000001402686ea  e8e19ad9ff             call 0x1400021d0
00000001402686ef  4531e4                 xor r12d, r12d
00000001402686f2  e9b5010000             jmp 0x1402688ac
00000001402686f7  c6850703000001         mov byte ptr [rbp + 0x307], 1
00000001402686fe  488d0d9550f305         lea rcx, [rip + 0x5f35095]
0000000140268705  ba54000000             mov edx, 0x54
000000014026870a  e8f1128c05             call 0x145b29a00
000000014026870f  90                     nop
0000000140268710  4989d4                 mov r12, rdx
0000000140268713  4885d2                 test rdx, rdx
0000000140268716  791b                   jns 0x140268733
0000000140268718  4531ed                 xor r13d, r13d
000000014026871b  c6850703000001         mov byte ptr [rbp + 0x307], 1
0000000140268722  4c89e9                 mov rcx, r13
0000000140268725  4c89e2                 mov rdx, r12
0000000140268728  e88e2aed05             call 0x14613b1bb
000000014026872d  90                     nop
000000014026872e  e9320b0000             jmp 0x140269265
0000000140268733  4d85e4                 test r12, r12
0000000140268736  7451                   je 0x140268789
0000000140268738  4989c7                 mov r15, rax
000000014026873b  e8c09ad9ff             call 0x140002200
0000000140268740  41bd01000000           mov r13d, 1
0000000140268746  ba01000000             mov edx, 1
000000014026874b  4c89e1                 mov rcx, r12
000000014026874e  e86d9ad9ff             call 0x1400021c0
0000000140268753  4885c0                 test rax, rax
0000000140268756  74c3                   je 0x14026871b
0000000140268758  4889c1                 mov rcx, rax
000000014026875b  4c89fa                 mov rdx, r15
000000014026875e  4d89e0                 mov r8, r12
0000000140268761  4989c7                 mov r15, rax
0000000140268764  e872bad205             call 0x145f941db
0000000140268769  4d89fa                 mov r10, r15
000000014026876c  803b01                 cmp byte ptr [rbx], 1
000000014026876f  7523                   jne 0x140268794
0000000140268771  8b4301                 mov eax, dword ptr [rbx + 1]
0000000140268774  8b4b04                 mov ecx, dword ptr [rbx + 4]
0000000140268777  894dc3                 mov dword ptr [rbp - 0x3d], ecx
000000014026877a  8945c0                 mov dword ptr [rbp - 0x40], eax
000000014026877d  488b4308               mov rax, qword ptr [rbx + 8]
0000000140268781  0fb65310               movzx edx, byte ptr [rbx + 0x10]
0000000140268785  b101                   mov cl, 1
0000000140268787  eb1b                   jmp 0x1402687a4
0000000140268789  41ba01000000           mov r10d, 1
000000014026878f  803b01                 cmp byte ptr [rbx], 1
0000000140268792  74dd                   je 0x140268771
0000000140268794  488b4308               mov rax, qword ptr [rbx + 8]
0000000140268798  f048ff00               lock inc qword ptr [rax]
000000014026879c  0f8ec30a0000           jle 0x140269265
00000001402687a2  31c9                   xor ecx, ecx
00000001402687a4  448b45c0               mov r8d, dword ptr [rbp - 0x40]
00000001402687a8  448b4dc3               mov r9d, dword ptr [rbp - 0x3d]
00000001402687ac  44898d4c010000         mov dword ptr [rbp + 0x14c], r9d
00000001402687b3  44898549010000         mov dword ptr [rbp + 0x149], r8d
00000001402687ba  0f10052f50f305         movups xmm0, xmmword ptr [rip + 0x5f3502f]
00000001402687c1  0f118599020000         movups xmmword ptr [rbp + 0x299], xmm0
00000001402687c8  c785a90200000000803f   mov dword ptr [rbp + 0x2a9], 0x3f800000
00000001402687d2  4d8b06                 mov r8, qword ptr [r14]
00000001402687d5  4c89a518010000         mov qword ptr [rbp + 0x118], r12
00000001402687dc  4c899520010000         mov qword ptr [rbp + 0x120], r10
00000001402687e3  4c89a528010000         mov qword ptr [rbp + 0x128], r12
00000001402687ea  48c7853001000000000000 mov qword ptr [rbp + 0x130], 0
00000001402687f5  48c7853801000004000000 mov qword ptr [rbp + 0x138], 4
0000000140268800  48c7854001000000000000 mov qword ptr [rbp + 0x140], 0
000000014026880b  888d48010000           mov byte ptr [rbp + 0x148], cl
0000000140268811  48898550010000         mov qword ptr [rbp + 0x150], rax
0000000140268818  48899558010000         mov qword ptr [rbp + 0x158], rdx
000000014026881f  c7856001000000006041   mov dword ptr [rbp + 0x160], 0x41600000
0000000140268829  66c785640100009001     mov word ptr [rbp + 0x164], 0x190
0000000140268832  c6856601000001         mov byte ptr [rbp + 0x166], 1
0000000140268839  0f108598020000         movups xmm0, xmmword ptr [rbp + 0x298]
0000000140268840  0f118567010000         movups xmmword ptr [rbp + 0x167], xmm0
0000000140268847  488b85a5020000         mov rax, qword ptr [rbp + 0x2a5]
000000014026884e  48898574010000         mov qword ptr [rbp + 0x174], rax
0000000140268855  0f1005d411f305         movups xmm0, xmmword ptr [rip + 0x5f311d4]
000000014026885c  0f11857c010000         movups xmmword ptr [rbp + 0x17c], xmm0
0000000140268863  8b05d711f305           mov eax, dword ptr [rip + 0x5f311d7]
0000000140268869  89858c010000           mov dword ptr [rbp + 0x18c], eax
000000014026886f  f20f100589b3ef05       movsd xmm0, qword ptr [rip + 0x5efb389]
0000000140268877  f20f118590010000       movsd qword ptr [rbp + 0x190], xmm0
000000014026887f  4c898510010000         mov qword ptr [rbp + 0x110], r8
0000000140268886  c6850703000001         mov byte ptr [rbp + 0x307], 1
000000014026888d  4c8d0d7cbeef05         lea r9, [rip + 0x5efbe7c]
0000000140268894  488d4dc0               lea rcx, [rbp - 0x40]
0000000140268898  4c8d8510010000         lea r8, [rbp + 0x110]
000000014026889f  498d5608               lea rdx, [r14 + 8]
00000001402688a3  e8d86b0600             call 0x1402cf480
00000001402688a8  90                     nop
00000001402688a9  41b401                 mov r12b, 1
00000001402688ac  4488a507030000         mov byte ptr [rbp + 0x307], r12b
00000001402688b3  488d0d4a4ff305         lea rcx, [rip + 0x5f34f4a]
00000001402688ba  ba08000000             mov edx, 8
00000001402688bf  e83c118c05             call 0x145b29a00
00000001402688c4  90                     nop
00000001402688c5  488985d0020000         mov qword ptr [rbp + 0x2d0], rax
00000001402688cc  488995d8020000         mov qword ptr [rbp + 0x2d8], rdx
00000001402688d3  0f57c0                 xorps xmm0, xmm0
00000001402688d6  0f294560               movaps xmmword ptr [rbp + 0x60], xmm0
00000001402688da  0f294550               movaps xmmword ptr [rbp + 0x50], xmm0
00000001402688de  0f294540               movaps xmmword ptr [rbp + 0x40], xmm0
00000001402688e2  0f294530               movaps xmmword ptr [rbp + 0x30], xmm0
00000001402688e6  0f294520               movaps xmmword ptr [rbp + 0x20], xmm0
00000001402688ea  48c7457000000000       mov qword ptr [rbp + 0x70], 0
00000001402688f2  0f1005df4bf305         movups xmm0, xmmword ptr [rip + 0x5f34bdf]
00000001402688f9  0f2945c0               movaps xmmword ptr [rbp - 0x40], xmm0
00000001402688fd  48c745d000000000       mov qword ptr [rbp - 0x30], 0
0000000140268905  0f1005e44bf305         movups xmm0, xmmword ptr [rip + 0x5f34be4]
000000014026890c  0f1145d8               movups xmmword ptr [rbp - 0x28], xmm0
0000000140268910  48c745e800000000       mov qword ptr [rbp - 0x18], 0
0000000140268918  0f1005e94bf305         movups xmm0, xmmword ptr [rip + 0x5f34be9]
000000014026891f  0f2945f0               movaps xmmword ptr [rbp - 0x10], xmm0
0000000140268923  48c7450000000000       mov qword ptr [rbp], 0
000000014026892b  440f114d08             movups xmmword ptr [rbp + 8], xmm9
0000000140268930  48c7451800000000       mov qword ptr [rbp + 0x18], 0
0000000140268938  4d8b3e                 mov r15, qword ptr [r14]
000000014026893b  488d8d18010000         lea rcx, [rbp + 0x118]
0000000140268942  488d55c0               lea rdx, [rbp - 0x40]
0000000140268946  41b8b8000000           mov r8d, 0xb8
000000014026894c  e88ab8d205             call 0x145f941db
0000000140268951  0f2805b8b4ef05         movaps xmm0, xmmword ptr [rip + 0x5efb4b8]
0000000140268958  0f1185d0010000         movups xmmword ptr [rbp + 0x1d0], xmm0
000000014026895f  0f28057a1cf105         movaps xmm0, xmmword ptr [rip + 0x5f11c7a]
0000000140268966  0f1185e0010000         movups xmmword ptr [rbp + 0x1e0], xmm0
000000014026896d  440f1195f0010000       movups xmmword ptr [rbp + 0x1f0], xmm10
0000000140268975  440f119d00020000       movups xmmword ptr [rbp + 0x200], xmm11
000000014026897d  440f11a510020000       movups xmmword ptr [rbp + 0x210], xmm12
0000000140268985  440f11ad20020000       movups xmmword ptr [rbp + 0x220], xmm13
000000014026898d  440f11b530020000       movups xmmword ptr [rbp + 0x230], xmm14
0000000140268995  440f11bd40020000       movups xmmword ptr [rbp + 0x240], xmm15
000000014026899d  0f28059cb1ef05         movaps xmm0, xmmword ptr [rip + 0x5efb19c]
00000001402689a4  0f118550020000         movups xmmword ptr [rbp + 0x250], xmm0
00000001402689ab  c7856002000001000000   mov dword ptr [rbp + 0x260], 1
00000001402689b5  f30f100543b4ef05       movss xmm0, dword ptr [rip + 0x5efb443]
00000001402689bd  0f138564020000         movlps qword ptr [rbp + 0x264], xmm0
00000001402689c4  c6856c02000001         mov byte ptr [rbp + 0x26c], 1
00000001402689cb  48c7857002000000000000 mov qword ptr [rbp + 0x270], 0
00000001402689d6  c785780200000000803f   mov dword ptr [rbp + 0x278], 0x3f800000
00000001402689e0  66c7857c0200000000     mov word ptr [rbp + 0x27c], 0
00000001402689e9  66c785820200000000     mov word ptr [rbp + 0x282], 0
00000001402689f2  c7857e02000000000100   mov dword ptr [rbp + 0x27e], 0x10000
00000001402689fc  c7858402000000000100   mov dword ptr [rbp + 0x284], 0x10000
0000000140268a06  66c785880200000000     mov word ptr [rbp + 0x288], 0
0000000140268a0f  48c7858a02000000000000 mov qword ptr [rbp + 0x28a], 0
0000000140268a1a  c7859202000005000000   mov dword ptr [rbp + 0x292], 5
0000000140268a24  4c89bd10010000         mov qword ptr [rbp + 0x110], r15
0000000140268a2b  4488a507030000         mov byte ptr [rbp + 0x307], r12b
0000000140268a32  4c8d0dd7bcef05         lea r9, [rip + 0x5efbcd7]
0000000140268a39  488d8d98020000         lea rcx, [rbp + 0x298]
0000000140268a40  4c8d8510010000         lea r8, [rbp + 0x110]
0000000140268a47  498d5608               lea rdx, [r14 + 8]
0000000140268a4b  e820060500             call 0x1402b9070
0000000140268a50  90                     nop
0000000140268a51  4488a507030000         mov byte ptr [rbp + 0x307], r12b
0000000140268a58  488d8d98020000         lea rcx, [rbp + 0x298]
0000000140268a5f  4c8d85d0020000         lea r8, [rbp + 0x2d0]
0000000140268a66  4889da                 mov rdx, rbx
0000000140268a69  e8e2500700             call 0x1402ddb50
0000000140268a6e  90                     nop
0000000140268a6f  c7852801000000000200   mov dword ptr [rbp + 0x128], 0x20000
0000000140268a79  0f28357052f205         movaps xmm6, xmmword ptr [rip + 0x5f25270]
0000000140268a80  0f11b510010000         movups xmmword ptr [rbp + 0x110], xmm6
0000000140268a87  48c7852001000001000000 mov qword ptr [rbp + 0x120], 1
0000000140268a92  4488a507030000         mov byte ptr [rbp + 0x307], r12b
0000000140268a99  488d8d98020000         lea rcx, [rbp + 0x298]
0000000140268aa0  488d9510010000         lea rdx, [rbp + 0x110]
0000000140268aa7  e8d4b26702             call 0x1428e3d80
0000000140268aac  90                     nop
0000000140268aad  4489a5f8020000         mov dword ptr [rbp + 0x2f8], r12d
0000000140268ab4  0f57c0                 xorps xmm0, xmm0
0000000140268ab7  0f294520               movaps xmmword ptr [rbp + 0x20], xmm0
0000000140268abb  0f294530               movaps xmmword ptr [rbp + 0x30], xmm0
0000000140268abf  0f294540               movaps xmmword ptr [rbp + 0x40], xmm0
0000000140268ac3  0f294550               movaps xmmword ptr [rbp + 0x50], xmm0
0000000140268ac7  0f294560               movaps xmmword ptr [rbp + 0x60], xmm0
0000000140268acb  48c7457000000000       mov qword ptr [rbp + 0x70], 0
0000000140268ad3  0f103db64af305         movups xmm7, xmmword ptr [rip + 0x5f34ab6]
0000000140268ada  0f117d78               movups xmmword ptr [rbp + 0x78], xmm7
0000000140268ade  440f1005ba4af305       movups xmm8, xmmword ptr [rip + 0x5f34aba]
0000000140268ae6  440f118588000000       movups xmmword ptr [rbp + 0x88], xmm8
0000000140268aee  440f119598000000       movups xmmword ptr [rbp + 0x98], xmm10
0000000140268af6  440f119da8000000       movups xmmword ptr [rbp + 0xa8], xmm11
0000000140268afe  440f11a5b8000000       movups xmmword ptr [rbp + 0xb8], xmm12
0000000140268b06  440f11adc8000000       movups xmmword ptr [rbp + 0xc8], xmm13
0000000140268b0e  440f11bde8000000       movups xmmword ptr [rbp + 0xe8], xmm15
0000000140268b16  440f11b5d8000000       movups xmmword ptr [rbp + 0xd8], xmm14
0000000140268b1e  0f1005b349f305         movups xmm0, xmmword ptr [rip + 0x5f349b3]
0000000140268b25  0f2945c0               movaps xmmword ptr [rbp - 0x40], xmm0
0000000140268b29  48c745d000000000       mov qword ptr [rbp - 0x30], 0
0000000140268b31  0f108598020000         movups xmm0, xmmword ptr [rbp + 0x298]
0000000140268b38  0f1145d8               movups xmmword ptr [rbp - 0x28], xmm0
0000000140268b3c  488b85a8020000         mov rax, qword ptr [rbp + 0x2a8]
0000000140268b43  488945e8               mov qword ptr [rbp - 0x18], rax
0000000140268b47  0f1005ba49f305         movups xmm0, xmmword ptr [rip + 0x5f349ba]
0000000140268b4e  0f2945f0               movaps xmmword ptr [rbp - 0x10], xmm0
0000000140268b52  48c7450000000000       mov qword ptr [rbp], 0
0000000140268b5a  440f114d08             movups xmmword ptr [rbp + 8], xmm9
0000000140268b5f  48c7451800000000       mov qword ptr [rbp + 0x18], 0
0000000140268b67  4d8b3e                 mov r15, qword ptr [r14]
0000000140268b6a  488d8d18010000         lea rcx, [rbp + 0x118]
0000000140268b71  488d55c0               lea rdx, [rbp - 0x40]
0000000140268b75  41b838010000           mov r8d, 0x138
0000000140268b7b  e85bb6d205             call 0x145f941db
0000000140268b80  0f2805a94ff105         movaps xmm0, xmmword ptr [rip + 0x5f14fa9]
0000000140268b87  0f118550020000         movups xmmword ptr [rbp + 0x250], xmm0
0000000140268b8e  c7856002000001000000   mov dword ptr [rbp + 0x260], 1
0000000140268b98  f30f1005141cf105       movss xmm0, dword ptr [rip + 0x5f11c14]
0000000140268ba0  0f138564020000         movlps qword ptr [rbp + 0x264], xmm0
0000000140268ba7  c6856c02000001         mov byte ptr [rbp + 0x26c], 1
0000000140268bae  48c7857002000000000000 mov qword ptr [rbp + 0x270], 0
0000000140268bb9  c785780200000000803f   mov dword ptr [rbp + 0x278], 0x3f800000
0000000140268bc3  66c7857c0200000000     mov word ptr [rbp + 0x27c], 0
0000000140268bcc  c7857e02000000000100   mov dword ptr [rbp + 0x27e], 0x10000
0000000140268bd6  66c785820200000000     mov word ptr [rbp + 0x282], 0
0000000140268bdf  c7858402000000000100   mov dword ptr [rbp + 0x284], 0x10000
0000000140268be9  66c785880200000000     mov word ptr [rbp + 0x288], 0
0000000140268bf2  c7858a02000000000001   mov dword ptr [rbp + 0x28a], 0x1000000
0000000140268bfc  48c7858e02000000000000 mov qword ptr [rbp + 0x28e], 0
0000000140268c07  4c89bd10010000         mov qword ptr [rbp + 0x110], r15
0000000140268c0e  4c8d0dfbbaef05         lea r9, [rip + 0x5efbafb]
0000000140268c15  488d8d98020000         lea rcx, [rbp + 0x298]
0000000140268c1c  4c8d8510010000         lea r8, [rbp + 0x110]
0000000140268c23  498d5608               lea rdx, [r14 + 8]
0000000140268c27  e844040500             call 0x1402b9070
0000000140268c2c  90                     nop
0000000140268c2d  4889b510010000         mov qword ptr [rbp + 0x110], rsi
0000000140268c34  4889bd18010000         mov qword ptr [rbp + 0x118], rdi
0000000140268c3b  48899d20010000         mov qword ptr [rbp + 0x120], rbx
0000000140268c42  488d8d98020000         lea rcx, [rbp + 0x298]
0000000140268c49  488d9510010000         lea rdx, [rbp + 0x110]
0000000140268c50  e8fb520700             call 0x1402ddf50
0000000140268c55  90                     nop
0000000140268c56  448ba5f8020000         mov r12d, dword ptr [rbp + 0x2f8]
0000000140268c5d  4488a507030000         mov byte ptr [rbp + 0x307], r12b
0000000140268c64  e8b7038d05             call 0x145b39020
0000000140268c69  90                     nop
0000000140268c6a  4869ca98000000         imul rcx, rdx, 0x98
0000000140268c71  4801c1                 add rcx, rax
0000000140268c74  48898510010000         mov qword ptr [rbp + 0x110], rax
0000000140268c7b  48898d18010000         mov qword ptr [rbp + 0x118], rcx
0000000140268c82  4889b520010000         mov qword ptr [rbp + 0x120], rsi
0000000140268c89  4889b528010000         mov qword ptr [rbp + 0x128], rsi
0000000140268c90  4488a507030000         mov byte ptr [rbp + 0x307], r12b
0000000140268c97  488d8dd0020000         lea rcx, [rbp + 0x2d0]
0000000140268c9e  488d9510010000         lea rdx, [rbp + 0x110]
0000000140268ca5  e8d678e7ff             call 0x1400e0580
0000000140268caa  90                     nop
0000000140268cab  488b8dd8020000         mov rcx, qword ptr [rbp + 0x2d8]
0000000140268cb2  4c8bbde0020000         mov r15, qword ptr [rbp + 0x2e0]
0000000140268cb9  488d85ef020000         lea rax, [rbp + 0x2ef]
0000000140268cc0  48898510010000         mov qword ptr [rbp + 0x110], rax
0000000140268cc7  4983ff02               cmp r15, 2
0000000140268ccb  0f832a050000           jae 0x1402691fb
0000000140268cd1  4d85ff                 test r15, r15
0000000140268cd4  0f842e040000           je 0x140269108
0000000140268cda  c6850603000001         mov byte ptr [rbp + 0x306], 1
0000000140268ce1  488d0d244bf305         lea rcx, [rip + 0x5f34b24]
0000000140268ce8  ba0c000000             mov edx, 0xc
0000000140268ced  e80e0d8c05             call 0x145b29a00
0000000140268cf2  90                     nop
0000000140268cf3  488945b0               mov qword ptr [rbp - 0x50], rax
0000000140268cf7  488955b8               mov qword ptr [rbp - 0x48], rdx
0000000140268cfb  0f57c0                 xorps xmm0, xmm0
0000000140268cfe  0f294560               movaps xmmword ptr [rbp + 0x60], xmm0
0000000140268d02  0f294550               movaps xmmword ptr [rbp + 0x50], xmm0
0000000140268d06  0f294540               movaps xmmword ptr [rbp + 0x40], xmm0
0000000140268d0a  0f294530               movaps xmmword ptr [rbp + 0x30], xmm0
0000000140268d0e  0f294520               movaps xmmword ptr [rbp + 0x20], xmm0
0000000140268d12  48c7457000000000       mov qword ptr [rbp + 0x70], 0
0000000140268d1a  0f1005b747f305         movups xmm0, xmmword ptr [rip + 0x5f347b7]
0000000140268d21  0f2945c0               movaps xmmword ptr [rbp - 0x40], xmm0
0000000140268d25  48c745d000000000       mov qword ptr [rbp - 0x30], 0
0000000140268d2d  0f1005bc47f305         movups xmm0, xmmword ptr [rip + 0x5f347bc]
0000000140268d34  0f1145d8               movups xmmword ptr [rbp - 0x28], xmm0
0000000140268d38  48c745e800000000       mov qword ptr [rbp - 0x18], 0
0000000140268d40  0f1005c147f305         movups xmm0, xmmword ptr [rip + 0x5f347c1]
0000000140268d47  0f2945f0               movaps xmmword ptr [rbp - 0x10], xmm0
0000000140268d4b  48c7450000000000       mov qword ptr [rbp], 0
0000000140268d53  440f114d08             movups xmmword ptr [rbp + 8], xmm9
0000000140268d58  48c7451800000000       mov qword ptr [rbp + 0x18], 0
0000000140268d60  4d8b3e                 mov r15, qword ptr [r14]
0000000140268d63  488d8d18010000         lea rcx, [rbp + 0x118]
0000000140268d6a  488d55c0               lea rdx, [rbp - 0x40]
0000000140268d6e  41b8b8000000           mov r8d, 0xb8
0000000140268d74  e862b4d205             call 0x145f941db
0000000140268d79  0f280590b0ef05         movaps xmm0, xmmword ptr [rip + 0x5efb090]
0000000140268d80  0f1185d0010000         movups xmmword ptr [rbp + 0x1d0], xmm0
0000000140268d87  0f28055218f105         movaps xmm0, xmmword ptr [rip + 0x5f11852]
0000000140268d8e  0f1185e0010000         movups xmmword ptr [rbp + 0x1e0], xmm0
0000000140268d95  440f1195f0010000       movups xmmword ptr [rbp + 0x1f0], xmm10
0000000140268d9d  440f119d00020000       movups xmmword ptr [rbp + 0x200], xmm11
0000000140268da5  440f11a510020000       movups xmmword ptr [rbp + 0x210], xmm12
0000000140268dad  440f11ad20020000       movups xmmword ptr [rbp + 0x220], xmm13
0000000140268db5  440f11b530020000       movups xmmword ptr [rbp + 0x230], xmm14
0000000140268dbd  440f11bd40020000       movups xmmword ptr [rbp + 0x240], xmm15
0000000140268dc5  0f280574adef05         movaps xmm0, xmmword ptr [rip + 0x5efad74]
0000000140268dcc  0f118550020000         movups xmmword ptr [rbp + 0x250], xmm0
0000000140268dd3  c7856002000001000000   mov dword ptr [rbp + 0x260], 1
0000000140268ddd  f30f10051bb0ef05       movss xmm0, dword ptr [rip + 0x5efb01b]
0000000140268de5  0f138564020000         movlps qword ptr [rbp + 0x264], xmm0
0000000140268dec  c6856c02000001         mov byte ptr [rbp + 0x26c], 1
0000000140268df3  48c7857002000000000000 mov qword ptr [rbp + 0x270], 0
0000000140268dfe  c785780200000000803f   mov dword ptr [rbp + 0x278], 0x3f800000
0000000140268e08  66c7857c0200000000     mov word ptr [rbp + 0x27c], 0
0000000140268e11  66c785820200000000     mov word ptr [rbp + 0x282], 0
0000000140268e1a  c7857e02000000000100   mov dword ptr [rbp + 0x27e], 0x10000
0000000140268e24  c7858402000000000100   mov dword ptr [rbp + 0x284], 0x10000
0000000140268e2e  66c785880200000000     mov word ptr [rbp + 0x288], 0
0000000140268e37  48c7858a02000000000000 mov qword ptr [rbp + 0x28a], 0
0000000140268e42  c7859202000005000000   mov dword ptr [rbp + 0x292], 5
0000000140268e4c  4c89bd10010000         mov qword ptr [rbp + 0x110], r15
0000000140268e53  c6850603000001         mov byte ptr [rbp + 0x306], 1
0000000140268e5a  4c8d0dafb8ef05         lea r9, [rip + 0x5efb8af]
0000000140268e61  488d8d98020000         lea rcx, [rbp + 0x298]
0000000140268e68  4c8d8510010000         lea r8, [rbp + 0x110]
0000000140268e6f  498d5608               lea rdx, [r14 + 8]
0000000140268e73  e8f8010500             call 0x1402b9070
0000000140268e78  90                     nop
0000000140268e79  c6850603000001         mov byte ptr [rbp + 0x306], 1
0000000140268e80  488d8d98020000         lea rcx, [rbp + 0x298]
0000000140268e87  4c8d45b0               lea r8, [rbp - 0x50]
0000000140268e8b  4889da                 mov rdx, rbx
0000000140268e8e  e8bd4c0700             call 0x1402ddb50
0000000140268e93  90                     nop
0000000140268e94  c7852801000000000200   mov dword ptr [rbp + 0x128], 0x20000
0000000140268e9e  0f11b510010000         movups xmmword ptr [rbp + 0x110], xmm6
0000000140268ea5  48c7852001000001000000 mov qword ptr [rbp + 0x120], 1
0000000140268eb0  c6850603000001         mov byte ptr [rbp + 0x306], 1
0000000140268eb7  488d8d98020000         lea rcx, [rbp + 0x298]
0000000140268ebe  488d9510010000         lea rdx, [rbp + 0x110]
0000000140268ec5  e8b6ae6702             call 0x1428e3d80
0000000140268eca  90                     nop
0000000140268ecb  0f57c0                 xorps xmm0, xmm0
0000000140268ece  0f294520               movaps xmmword ptr [rbp + 0x20], xmm0
0000000140268ed2  0f294530               movaps xmmword ptr [rbp + 0x30], xmm0
0000000140268ed6  0f294540               movaps xmmword ptr [rbp + 0x40], xmm0
0000000140268eda  0f294550               movaps xmmword ptr [rbp + 0x50], xmm0
0000000140268ede  0f294560               movaps xmmword ptr [rbp + 0x60], xmm0
0000000140268ee2  48c7457000000000       mov qword ptr [rbp + 0x70], 0
0000000140268eea  0f117d78               movups xmmword ptr [rbp + 0x78], xmm7
0000000140268eee  440f118588000000       movups xmmword ptr [rbp + 0x88], xmm8
0000000140268ef6  440f119598000000       movups xmmword ptr [rbp + 0x98], xmm10
0000000140268efe  440f119da8000000       movups xmmword ptr [rbp + 0xa8], xmm11
0000000140268f06  440f11a5b8000000       movups xmmword ptr [rbp + 0xb8], xmm12
0000000140268f0e  440f11adc8000000       movups xmmword ptr [rbp + 0xc8], xmm13
0000000140268f16  440f11bde8000000       movups xmmword ptr [rbp + 0xe8], xmm15
0000000140268f1e  440f11b5d8000000       movups xmmword ptr [rbp + 0xd8], xmm14
0000000140268f26  0f1005ab45f305         movups xmm0, xmmword ptr [rip + 0x5f345ab]
0000000140268f2d  0f2945c0               movaps xmmword ptr [rbp - 0x40], xmm0
0000000140268f31  48c745d000000000       mov qword ptr [rbp - 0x30], 0
0000000140268f39  0f108598020000         movups xmm0, xmmword ptr [rbp + 0x298]
0000000140268f40  0f1145d8               movups xmmword ptr [rbp - 0x28], xmm0
0000000140268f44  488b85a8020000         mov rax, qword ptr [rbp + 0x2a8]
0000000140268f4b  488945e8               mov qword ptr [rbp - 0x18], rax
0000000140268f4f  0f1005b245f305         movups xmm0, xmmword ptr [rip + 0x5f345b2]
0000000140268f56  0f2945f0               movaps xmmword ptr [rbp - 0x10], xmm0
0000000140268f5a  48c7450000000000       mov qword ptr [rbp], 0
0000000140268f62  440f114d08             movups xmmword ptr [rbp + 8], xmm9
0000000140268f67  48c7451800000000       mov qword ptr [rbp + 0x18], 0
0000000140268f6f  4d8b36                 mov r14, qword ptr [r14]
0000000140268f72  488d8d18010000         lea rcx, [rbp + 0x118]
0000000140268f79  488d55c0               lea rdx, [rbp - 0x40]
0000000140268f7d  41b838010000           mov r8d, 0x138
0000000140268f83  e853b2d205             call 0x145f941db
0000000140268f88  0f2805d116f105         movaps xmm0, xmmword ptr [rip + 0x5f116d1]
0000000140268f8f  0f118550020000         movups xmmword ptr [rbp + 0x250], xmm0
0000000140268f96  c7856002000001000000   mov dword ptr [rbp + 0x260], 1
0000000140268fa0  f30f1005e8b1ef05       movss xmm0, dword ptr [rip + 0x5efb1e8]
0000000140268fa8  0f138564020000         movlps qword ptr [rbp + 0x264], xmm0
0000000140268faf  c6856c02000001         mov byte ptr [rbp + 0x26c], 1
0000000140268fb6  48c7857002000000000000 mov qword ptr [rbp + 0x270], 0
0000000140268fc1  c785780200000000803f   mov dword ptr [rbp + 0x278], 0x3f800000
0000000140268fcb  66c7857c0200000000     mov word ptr [rbp + 0x27c], 0
0000000140268fd4  c7857e02000000000100   mov dword ptr [rbp + 0x27e], 0x10000
0000000140268fde  66c785820200000000     mov word ptr [rbp + 0x282], 0
0000000140268fe7  c7858402000000000100   mov dword ptr [rbp + 0x284], 0x10000
0000000140268ff1  66c785880200000000     mov word ptr [rbp + 0x288], 0
0000000140268ffa  c7858a02000000000001   mov dword ptr [rbp + 0x28a], 0x1000000
0000000140269004  48c7858e02000000000000 mov qword ptr [rbp + 0x28e], 0
000000014026900f  4c89b510010000         mov qword ptr [rbp + 0x110], r14
0000000140269016  c6850403000001         mov byte ptr [rbp + 0x304], 1
000000014026901d  4c8d0decb6ef05         lea r9, [rip + 0x5efb6ec]
0000000140269024  488d8d98020000         lea rcx, [rbp + 0x298]
000000014026902b  4c8d8510010000         lea r8, [rbp + 0x110]
0000000140269032  488b95c8020000         mov rdx, qword ptr [rbp + 0x2c8]
0000000140269039  e832000500             call 0x1402b9070
000000014026903e  90                     nop
000000014026903f  488b85d0020000         mov rax, qword ptr [rbp + 0x2d0]
0000000140269046  488985c8020000         mov qword ptr [rbp + 0x2c8], rax
000000014026904d  488b85d8020000         mov rax, qword ptr [rbp + 0x2d8]
0000000140269054  488985f0020000         mov qword ptr [rbp + 0x2f0], rax
000000014026905b  4c8bbde0020000         mov r15, qword ptr [rbp + 0x2e0]
0000000140269062  488b8598020000         mov rax, qword ptr [rbp + 0x298]
0000000140269069  488b8dc0020000         mov rcx, qword ptr [rbp + 0x2c0]
0000000140269070  48898510010000         mov qword ptr [rbp + 0x110], rax
0000000140269077  0f1085a0020000         movups xmm0, xmmword ptr [rbp + 0x2a0]
000000014026907e  0f118518010000         movups xmmword ptr [rbp + 0x118], xmm0
0000000140269085  0f1085b0020000         movups xmm0, xmmword ptr [rbp + 0x2b0]
000000014026908c  0f118528010000         movups xmmword ptr [rbp + 0x128], xmm0
0000000140269093  48898d38010000         mov qword ptr [rbp + 0x138], rcx
000000014026909a  49c1e704               shl r15, 4
000000014026909e  4531e4                 xor r12d, r12d
00000001402690a1  4c8db510010000         lea r14, [rbp + 0x110]
00000001402690a8  0f1f840000000000       nop dword ptr [rax + rax]
00000001402690b0  4d39e7                 cmp r15, r12
00000001402690b3  7428                   je 0x1402690dd
00000001402690b5  488b85f0020000         mov rax, qword ptr [rbp + 0x2f0]
00000001402690bc  4a8b0420               mov rax, qword ptr [rax + r12]
00000001402690c0  4983c410               add r12, 0x10
00000001402690c4  4889442420             mov qword ptr [rsp + 0x20], rax
00000001402690c9  4c89f1                 mov rcx, r14
00000001402690cc  4889da                 mov rdx, rbx
00000001402690cf  4989f8                 mov r8, rdi
00000001402690d2  4989f1                 mov r9, rsi
00000001402690d5  e896baffff             call 0x140264b70
00000001402690da  90                     nop
00000001402690db  ebd3                   jmp 0x1402690b0
00000001402690dd  488b95c8020000         mov rdx, qword ptr [rbp + 0x2c8]
00000001402690e4  4885d2                 test rdx, rdx
00000001402690e7  7416                   je 0x1402690ff
00000001402690e9  48c1e204               shl rdx, 4
00000001402690ed  41b808000000           mov r8d, 8
00000001402690f3  488b8df0020000         mov rcx, qword ptr [rbp + 0x2f0]
00000001402690fa  e8d190d9ff             call 0x1400021d0
00000001402690ff  448ba5f8020000         mov r12d, dword ptr [rbp + 0x2f8]
0000000140269106  eb1b                   jmp 0x140269123
0000000140269108  488b95d0020000         mov rdx, qword ptr [rbp + 0x2d0]
000000014026910f  4885d2                 test rdx, rdx
0000000140269112  740f                   je 0x140269123
0000000140269114  48c1e204               shl rdx, 4
0000000140269118  41b808000000           mov r8d, 8
000000014026911e  e8ad90d9ff             call 0x1400021d0
0000000140269123  4584e4                 test r12b, r12b
0000000140269126  7422                   je 0x14026914a
0000000140269128  488b95f8000000         mov rdx, qword ptr [rbp + 0xf8]
000000014026912f  4885d2                 test rdx, rdx
0000000140269132  7416                   je 0x14026914a
0000000140269134  488b8d00010000         mov rcx, qword ptr [rbp + 0x100]
000000014026913b  48c1e203               shl rdx, 3
000000014026913f  41b808000000           mov r8d, 8
0000000140269145  e88690d9ff             call 0x1400021d0
000000014026914a  0f28b510030000         movaps xmm6, xmmword ptr [rbp + 0x310]
0000000140269151  0f28bd20030000         movaps xmm7, xmmword ptr [rbp + 0x320]
0000000140269158  440f288530030000       movaps xmm8, xmmword ptr [rbp + 0x330]
0000000140269160  440f288d40030000       movaps xmm9, xmmword ptr [rbp + 0x340]
0000000140269168  440f289550030000       movaps xmm10, xmmword ptr [rbp + 0x350]
0000000140269170  440f289d60030000       movaps xmm11, xmmword ptr [rbp + 0x360]
0000000140269178  440f28a570030000       movaps xmm12, xmmword ptr [rbp + 0x370]
0000000140269180  440f28ad80030000       movaps xmm13, xmmword ptr [rbp + 0x380]
0000000140269188  440f28b590030000       movaps xmm14, xmmword ptr [rbp + 0x390]
0000000140269190  440f28bda0030000       movaps xmm15, xmmword ptr [rbp + 0x3a0]
0000000140269198  4881c438040000         add rsp, 0x438
000000014026919f  5b                     pop rbx
00000001402691a0  5f                     pop rdi
00000001402691a1  5e                     pop rsi
00000001402691a2  415c                   pop r12
00000001402691a4  415d                   pop r13
00000001402691a6  415e                   pop r14
00000001402691a8  415f                   pop r15
00000001402691aa  5d                     pop rbp
00000001402691ab  c3                     ret
00000001402691ac  4983fc15               cmp r12, 0x15
00000001402691b0  737e                   jae 0x140269230
00000001402691b2  4d8d7d08               lea r15, [r13 + 8]
00000001402691b6  c6850703000001         mov byte ptr [rbp + 0x307], 1
00000001402691bd  4c89e9                 mov rcx, r13
00000001402691c0  4c89fa                 mov rdx, r15
00000001402691c3  4c8d45c0               lea r8, [rbp - 0x40]
00000001402691c7  e884dfdbff             call 0x140027150
00000001402691cc  90                     nop
00000001402691cd  4983c708               add r15, 8
00000001402691d1  4a8d04e500000000       lea rax, [r12*8]
00000001402691d9  4c01e8                 add rax, r13
00000001402691dc  4939c7                 cmp r15, rax
00000001402691df  75d5                   jne 0x1402691b6
00000001402691e1  4983fc04               cmp r12, 4
00000001402691e5  0f8281f0ffff           jb 0x14026826c
00000001402691eb  48c7850801000004000000 mov qword ptr [rbp + 0x108], 4
00000001402691f6  e971f0ffff             jmp 0x14026826c
00000001402691fb  4983ff15               cmp r15, 0x15
00000001402691ff  734b                   jae 0x14026924c
0000000140269201  4c8d8d10010000         lea r9, [rbp + 0x110]
0000000140269208  41b801000000           mov r8d, 1
000000014026920e  4c89fa                 mov rdx, r15
0000000140269211  e86a02dcff             call 0x140029480
0000000140269216  4983ff04               cmp r15, 4
000000014026921a  0f82bafaffff           jb 0x140268cda
0000000140269220  48c785e002000004000000 mov qword ptr [rbp + 0x2e0], 4
000000014026922b  e9aafaffff             jmp 0x140268cda
0000000140269230  c6850703000001         mov byte ptr [rbp + 0x307], 1
0000000140269237  4c8d8510010000         lea r8, [rbp + 0x110]
000000014026923e  4c89e9                 mov rcx, r13
0000000140269241  4c89e2                 mov rdx, r12
0000000140269244  e897eee5ff             call 0x1400c80e0
0000000140269249  90                     nop
000000014026924a  eb9f                   jmp 0x1402691eb
000000014026924c  c6850603000001         mov byte ptr [rbp + 0x306], 1
0000000140269253  4c8d8510010000         lea r8, [rbp + 0x110]
000000014026925a  4c89fa                 mov rdx, r15
000000014026925d  e88ef3e5ff             call 0x1400c85f0
0000000140269262  90                     nop
0000000140269263  ebbb                   jmp 0x140269220
0000000140269265  0f0b                   ud2
