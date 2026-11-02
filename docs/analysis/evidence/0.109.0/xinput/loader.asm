140367560: 55 push rbp
140367561: 4157 push r15
140367563: 4156 push r14
140367565: 56 push rsi
140367566: 57 push rdi
140367567: 53 push rbx
140367568: 4881ec28010000 sub rsp, 0x128
14036756f: 488dac2480000000 lea rbp, [rsp + 0x80]
140367577: 48c785a0000000feffffff mov qword ptr [rbp + 0xa0], 0xfffffffffffffffe
140367582: 4889ce mov rsi, rcx
140367585: 488d0d5c61a905 lea rcx, [rip + 0x5a9615c]
14036758c: ff150e33a305 call qword ptr [rip + 0x5a3330e]
140367592: 4885c0 test rax, rax
140367595: 7415 je 0x1403675ac
140367597: 488d157661a905 lea rdx, [rip + 0x5a96176]
14036759e: 4889c1 mov rcx, rax
1403675a1: ff155933a305 call qword ptr [rip + 0x5a33359]
1403675a7: 4885c0 test rax, rax
1403675aa: 7556 jne 0x140367602
1403675ac: 488d0d4361a905 lea rcx, [rip + 0x5a96143]
1403675b3: ff15e732a305 call qword ptr [rip + 0x5a332e7]
1403675b9: 4885c0 test rax, rax
1403675bc: 7415 je 0x1403675d3
1403675be: 488d154f61a905 lea rdx, [rip + 0x5a9614f]
1403675c5: 4889c1 mov rcx, rax
1403675c8: ff153233a305 call qword ptr [rip + 0x5a33332]
1403675ce: 4885c0 test rax, rax
1403675d1: 752f jne 0x140367602
1403675d3: 488d0d2a61a905 lea rcx, [rip + 0x5a9612a]
1403675da: ff15c032a305 call qword ptr [rip + 0x5a332c0]
1403675e0: 4885c0 test rax, rax
1403675e3: 0f8497020000 je 0x140367880
1403675e9: 488d152461a905 lea rdx, [rip + 0x5a96124]
1403675f0: 4889c1 mov rcx, rax
1403675f3: ff150733a305 call qword ptr [rip + 0x5a33307]
1403675f9: 4885c0 test rax, rax
1403675fc: 0f847e020000 je 0x140367880
140367602: 4889c7 mov rdi, rax
140367605: 488d5e40 lea rbx, [rsi + 0x40]
140367609: 488d86a8050000 lea rax, [rsi + 0x5a8]
140367610: 48895dc8 mov qword ptr [rbp - 0x38], rbx
140367614: 488945d0 mov qword ptr [rbp - 0x30], rax
140367618: 48c745b000000000 mov qword ptr [rbp - 0x50], 0
140367620: 48c745b808000000 mov qword ptr [rbp - 0x48], 8
140367628: 48c745c000000000 mov qword ptr [rbp - 0x40], 0
140367630: 4883be9000000000 cmp qword ptr [rsi + 0x90], 0
140367638: 0f849d000000 je 0x1403676db
14036763e: 48ba513c26b610a421ea movabs rdx, 0xea21a410b6263c51
140367648: 488b4e78 mov rcx, qword ptr [rsi + 0x78]
14036764c: 4c8b8680000000 mov r8, qword ptr [rsi + 0x80]
140367653: 4531c9 xor r9d, r9d
140367656: 660f6f057264a305 movdqa xmm0, xmmword ptr [rip + 0x5a36472]
14036765e: 660f76c9 pcmpeqd xmm1, xmm1
140367662: 660f6f157664a305 movdqa xmm2, xmmword ptr [rip + 0x5a36476]
14036766a: 4c21c2 and rdx, r8
14036766d: f30f6f1c11 movdqu xmm3, xmmword ptr [rcx + rdx]
140367672: 660f6fe3 movdqa xmm4, xmm3
140367676: 660f74e0 pcmpeqb xmm4, xmm0
14036767a: 66440fd7d4 pmovmskb r10d, xmm4
14036767f: 4585d2 test r10d, r10d
140367682: 743c je 0x1403676c0
140367684: f3450fbcda tzcnt r11d, r10d
140367689: 4901d3 add r11, rdx
14036768c: 4d21c3 and r11, r8
14036768f: 49f7db neg r11
140367692: 4f8d1c5b lea r11, [r11 + r11*2]
140367696: f3420f6f64d9e8 movdqu xmm4, xmmword ptr [rcx + r11*8 - 0x18]
14036769d: 660f74e2 pcmpeqb xmm4, xmm2
1403676a1: 66440fd7f4 pmovmskb r14d, xmm4
1403676a6: 4181feffff0000 cmp r14d, 0xffff
1403676ad: 0f84d5000000 je 0x140367788
1403676b3: 458d5aff lea r11d, [r10 - 1]
1403676b7: 664521d3 and r11w, r10w
1403676bb: 4589da mov r10d, r11d
1403676be: 75c4 jne 0x140367684
1403676c0: 660f74d9 pcmpeqb xmm3, xmm1
1403676c4: 66440fd7d3 pmovmskb r10d, xmm3
1403676c9: 4585d2 test r10d, r10d
1403676cc: 750d jne 0x1403676db
1403676ce: 4c01ca add rdx, r9
1403676d1: 4883c210 add rdx, 0x10
1403676d5: 4983c110 add r9, 0x10
1403676d9: eb8f jmp 0x14036766a
1403676db: 0fb68ea0000000 movzx ecx, byte ptr [rsi + 0xa0]
1403676e2: 488b8ee0000000 mov rcx, qword ptr [rsi + 0xe0]
1403676e9: 488b96e8000000 mov rdx, qword ptr [rsi + 0xe8]
1403676f0: 49b8513c26b610a421ea movabs r8, 0xea21a410b6263c51
1403676fa: 4531c9 xor r9d, r9d
1403676fd: 660f6f05cb63a305 movdqa xmm0, xmmword ptr [rip + 0x5a363cb]
140367705: 660f76c9 pcmpeqd xmm1, xmm1
140367709: 660f6f15cf63a305 movdqa xmm2, xmmword ptr [rip + 0x5a363cf]
140367711: 4921d0 and r8, rdx
140367714: f3420f6f1c01 movdqu xmm3, xmmword ptr [rcx + r8]
14036771a: 660f6fe3 movdqa xmm4, xmm3
14036771e: 660f74e0 pcmpeqb xmm4, xmm0
140367722: 66440fd7f4 pmovmskb r14d, xmm4
140367727: 4585f6 test r14d, r14d
14036772a: 743d je 0x140367769
14036772c: f3450fbcde tzcnt r11d, r14d
140367731: 4d01c3 add r11, r8
140367734: 4921d3 and r11, rdx
140367737: 4d89df mov r15, r11
14036773a: 49c1e707 shl r15, 7
14036773e: 4989ca mov r10, rcx
140367741: 4d29fa sub r10, r15
140367744: f3410f6f6280 movdqu xmm4, xmmword ptr [r10 - 0x80]
14036774a: 660f74e2 pcmpeqb xmm4, xmm2
14036774e: 66440fd7fc pmovmskb r15d, xmm4
140367753: 4181ffffff0000 cmp r15d, 0xffff
14036775a: 7439 je 0x140367795
14036775c: 458d56ff lea r10d, [r14 - 1]
140367760: 664521f2 and r10w, r14w
140367764: 4589d6 mov r14d, r10d
140367767: 75c3 jne 0x14036772c
140367769: 660f74d9 pcmpeqb xmm3, xmm1
14036776d: 66440fd7d3 pmovmskb r10d, xmm3
140367772: 4585d2 test r10d, r10d
140367775: 0f858f000000 jne 0x14036780a
14036777b: 4d01c8 add r8, r9
14036777e: 4983c010 add r8, 0x10
140367782: 4983c110 add r9, 0x10
140367786: eb89 jmp 0x140367711
140367788: 4a8d04d9 lea rax, [rcx + r11*8]
14036778c: 4c8b70f8 mov r14, qword ptr [rax - 8]
140367790: e901020000 jmp 0x140367996
140367795: 4d8d43f0 lea r8, [r11 - 0x10]
140367799: 4921d0 and r8, rdx
14036779c: f3420f6f0401 movdqu xmm0, xmmword ptr [rcx + r8]
1403677a2: 660f76c9 pcmpeqd xmm1, xmm1
1403677a6: 660f74c1 pcmpeqb xmm0, xmm1
1403677aa: 660fd7d0 pmovmskb edx, xmm0
1403677ae: f3420f6f0419 movdqu xmm0, xmmword ptr [rcx + r11]
1403677b4: 660f74c1 pcmpeqb xmm0, xmm1
1403677b8: 66440fd7c8 pmovmskb r9d, xmm0
1403677bd: 6641be1f00 mov r14w, 0x1f
1403677c2: 66440fbdf2 bsr r14w, dx
1403677c7: 4183f60f xor r14d, 0xf
1403677cb: 4181c900000100 or r9d, 0x10000
1403677d2: f3450fbcc9 tzcnt r9d, r9d
1403677d7: 4501f1 add r9d, r14d
1403677da: b280 mov dl, 0x80
1403677dc: 664183f90f cmp r9w, 0xf
1403677e1: 7709 ja 0x1403677ec
1403677e3: 48ff86f0000000 inc qword ptr [rsi + 0xf0]
1403677ea: b2ff mov dl, 0xff
1403677ec: 42881419 mov byte ptr [rcx + r11], dl
1403677f0: 4288540110 mov byte ptr [rcx + r8 + 0x10], dl
1403677f5: 48ff8ef8000000 dec qword ptr [rsi + 0xf8]
1403677fc: 498b4a90 mov rcx, qword ptr [r10 - 0x70]
140367800: 4883f902 cmp rcx, 2
140367804: 0f850f010000 jne 0x140367919
14036780a: 4c8b30 mov r14, qword ptr [rax]
14036780d: 498d4e01 lea rcx, [r14 + 1]
140367811: 488908 mov qword ptr [rax], rcx
140367814: 66c745780001 mov word ptr [rbp + 0x78], 0x100
14036781a: 48c7452801000000 mov qword ptr [rbp + 0x28], 1
140367822: f30f6f053ecca805 movdqu xmm0, xmmword ptr [rip + 0x5a8cc3e]
14036782a: f30f7f4530 movdqu xmmword ptr [rbp + 0x30], xmm0
14036782f: 48c7455008000000 mov qword ptr [rbp + 0x50], 8
140367837: 48c7455870000000 mov qword ptr [rbp + 0x58], 0x70
14036783f: 48c7457000000000 mov qword ptr [rbp + 0x70], 0
140367847: c6457a01 mov byte ptr [rbp + 0x7a], 1
14036784b: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
140367853: c6456002 mov byte ptr [rbp + 0x60], 2
140367857: 4c8d4528 lea r8, [rbp + 0x28]
14036785b: 4889d9 mov rcx, rbx
14036785e: 4c89f2 mov rdx, r14
140367861: e8ca7acaff call 0x14000f330
140367866: 90 nop
140367867: 488d4e78 lea rcx, [rsi + 0x78]
14036786b: 488d15f6cba805 lea rdx, [rip + 0x5a8cbf6]
140367872: 4d89f0 mov r8, r14
140367875: e80679caff call 0x14000f180
14036787a: 90 nop
14036787b: e916010000 jmp 0x140367996
140367880: 488b052157d107 mov rax, qword ptr [rip + 0x7d15721]
140367887: 488b00 mov rax, qword ptr [rax]
14036788a: 4883f804 cmp rax, 4
14036788e: 0f8341020000 jae 0x140367ad5
140367894: 0fb6152d98cd07 movzx edx, byte ptr [rip + 0x7cd982d]
14036789b: 0fb6c2 movzx eax, dl
14036789e: 8d48ff lea ecx, [rax - 1]
1403678a1: 83f902 cmp ecx, 2
1403678a4: 0f833b020000 jae 0x140367ae5
1403678aa: 488b0d0798cd07 mov rcx, qword ptr [rip + 0x7cd9807]
1403678b1: e81a608f04 call 0x144c5d8d0
1403678b6: 84c0 test al, al
1403678b8: 0f8417020000 je 0x140367ad5
1403678be: 488b0df397cd07 mov rcx, qword ptr [rip + 0x7cd97f3]
1403678c5: 488d4130 lea rax, [rcx + 0x30]
1403678c9: 488d15f05ea905 lea rdx, [rip + 0x5a95ef0]
1403678d0: 488955b0 mov qword ptr [rbp - 0x50], rdx
1403678d4: 48c745b857000000 mov qword ptr [rbp - 0x48], 0x57
1403678dc: 488d55b0 lea rdx, [rbp - 0x50]
1403678e0: 488955a0 mov qword ptr [rbp - 0x60], rdx
1403678e4: 488d15055fa905 lea rdx, [rip + 0x5a95f05]
1403678eb: 488955a8 mov qword ptr [rbp - 0x58], rdx
1403678ef: 48c7452801000000 mov qword ptr [rbp + 0x28], 1
1403678f7: 488d55a0 lea rdx, [rbp - 0x60]
1403678fb: 48895530 mov qword ptr [rbp + 0x30], rdx
1403678ff: 48c7453801000000 mov qword ptr [rbp + 0x38], 1
140367907: 48894540 mov qword ptr [rbp + 0x40], rax
14036790b: 488d5528 lea rdx, [rbp + 0x28]
14036790f: e8dc778f04 call 0x144c5f0f0
140367914: e9bc010000 jmp 0x140367ad5
140367919: 498b42f8 mov rax, qword ptr [r10 - 8]
14036791d: 48898590000000 mov qword ptr [rbp + 0x90], rax
140367924: 410f1042e8 movups xmm0, xmmword ptr [r10 - 0x18]
140367929: 0f118580000000 movups xmmword ptr [rbp + 0x80], xmm0
140367930: 410f1042d8 movups xmm0, xmmword ptr [r10 - 0x28]
140367935: 0f114570 movups xmmword ptr [rbp + 0x70], xmm0
140367939: f3410f6f4298 movdqu xmm0, xmmword ptr [r10 - 0x68]
14036793f: f3410f6f4aa8 movdqu xmm1, xmmword ptr [r10 - 0x58]
140367945: f3410f6f52b8 movdqu xmm2, xmmword ptr [r10 - 0x48]
14036794b: f3410f6f5ac8 movdqu xmm3, xmmword ptr [r10 - 0x38]
140367951: f30f7f5d60 movdqu xmmword ptr [rbp + 0x60], xmm3
140367956: f30f7f5550 movdqu xmmword ptr [rbp + 0x50], xmm2
14036795b: f30f7f4d40 movdqu xmmword ptr [rbp + 0x40], xmm1
140367960: f30f7f4530 movdqu xmmword ptr [rbp + 0x30], xmm0
140367965: 48894d28 mov qword ptr [rbp + 0x28], rcx
140367969: 488d4d28 lea rcx, [rbp + 0x28]
14036796d: 488d55b0 lea rdx, [rbp - 0x50]
140367971: e8aa15aa04 call 0x144e08f20
140367976: 90 nop
140367977: 4989c6 mov r14, rax
14036797a: 488b55b0 mov rdx, qword ptr [rbp - 0x50]
14036797e: 4885d2 test rdx, rdx
140367981: 7413 je 0x140367996
140367983: 488b4db8 mov rcx, qword ptr [rbp - 0x48]
140367987: 48c1e203 shl rdx, 3
14036798b: 41b808000000 mov r8d, 8
140367991: e83aa8c9ff call 0x1400021d0
140367996: 48897d28 mov qword ptr [rbp + 0x28], rdi
14036799a: c7453000000000 mov dword ptr [rbp + 0x30], 0
1403679a1: c7454800000000 mov dword ptr [rbp + 0x48], 0
1403679a8: c7456000000000 mov dword ptr [rbp + 0x60], 0
1403679af: c7457800000000 mov dword ptr [rbp + 0x78], 0
1403679b6: c7859000000000000000 mov dword ptr [rbp + 0x90], 0
1403679c0: 448bbeb0050000 mov r15d, dword ptr [rsi + 0x5b0]
1403679c7: 4889f1 mov rcx, rsi
1403679ca: e821e6af04 call 0x144e65ff0
1403679cf: 4c8975b0 mov qword ptr [rbp - 0x50], r14
1403679d3: 488d8ed8010000 lea rcx, [rsi + 0x1d8]
1403679da: 4c8d4db0 lea r9, [rbp - 0x50]
1403679de: 4c89f2 mov rdx, r14
1403679e1: 4989d8 mov r8, rbx
1403679e4: e8c71fd8ff call 0x1400e99b0
1403679e9: 4889c7 mov rdi, rax
1403679ec: 80783001 cmp byte ptr [rax + 0x30], 1
1403679f0: 7510 jne 0x140367a02
1403679f2: 4c8d4528 lea r8, [rbp + 0x28]
1403679f6: 4889f9 mov rcx, rdi
1403679f9: 31d2 xor edx, edx
1403679fb: e8406fb104 call 0x144e7e940
140367a00: eb19 jmp 0x140367a1b
140367a02: 4c8b4708 mov r8, qword ptr [rdi + 8]
140367a06: 488b4f10 mov rcx, qword ptr [rdi + 0x10]
140367a0a: 488d5528 lea rdx, [rbp + 0x28]
140367a0e: e8da268905 call 0x145bfa0ed
140367a13: 44897f28 mov dword ptr [rdi + 0x28], r15d
140367a17: c6473001 mov byte ptr [rdi + 0x30], 1
140367a1b: 44897f2c mov dword ptr [rdi + 0x2c], r15d
140367a1f: e8dca7c9ff call 0x140002200
140367a24: b978000000 mov ecx, 0x78
140367a29: ba08000000 mov edx, 8
140367a2e: e88da7c9ff call 0x1400021c0
140367a33: 4885c0 test rax, rax
140367a36: 0f84c5000000 je 0x140367b01
140367a3c: 48c700ffffffff mov qword ptr [rax], 0xffffffffffffffff
140367a43: c7407000000000 mov dword ptr [rax + 0x70], 0
140367a4a: c6407400 mov byte ptr [rax + 0x74], 0
140367a4e: 4c8d056b61a905 lea r8, [rip + 0x5a9616b]
140367a55: 488d4d28 lea rcx, [rbp + 0x28]
140367a59: 4889c2 mov rdx, rax
140367a5c: e8cf81ab04 call 0x144e1fc30
140367a61: 90 nop
140367a62: 488b0d37bcd107 mov rcx, qword ptr [rip + 0x7d1bc37]
140367a69: 4c8d0590a4a705 lea r8, [rip + 0x5a7a490]
140367a70: 488d959f000000 lea rdx, [rbp + 0x9f]
140367a77: e8e4f8d8ff call 0x1400f7360
140367a7c: 90 nop
140367a7d: 4989d0 mov r8, rdx
140367a80: 488d4d28 lea rcx, [rbp + 0x28]
140367a84: 4889c2 mov rdx, rax
140367a87: e8c45addff call 0x14013d550
140367a8c: 90 nop
140367a8d: 0f108588000000 movups xmm0, xmmword ptr [rbp + 0x88]
140367a94: 0f294510 movaps xmmword ptr [rbp + 0x10], xmm0
140367a98: 0f104578 movups xmm0, xmmword ptr [rbp + 0x78]
140367a9c: 0f294500 movaps xmmword ptr [rbp], xmm0
140367aa0: 0f104568 movups xmm0, xmmword ptr [rbp + 0x68]
140367aa4: 0f2945f0 movaps xmmword ptr [rbp - 0x10], xmm0
140367aa8: 0f104528 movups xmm0, xmmword ptr [rbp + 0x28]
140367aac: 0f104d38 movups xmm1, xmmword ptr [rbp + 0x38]
140367ab0: 0f105548 movups xmm2, xmmword ptr [rbp + 0x48]
140367ab4: 0f105d58 movups xmm3, xmmword ptr [rbp + 0x58]
140367ab8: 0f295de0 movaps xmmword ptr [rbp - 0x20], xmm3
140367abc: 0f2955d0 movaps xmmword ptr [rbp - 0x30], xmm2
140367ac0: 0f294dc0 movaps xmmword ptr [rbp - 0x40], xmm1
140367ac4: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
140367ac8: 488d55b0 lea rdx, [rbp - 0x50]
140367acc: 4889f1 mov rcx, rsi
140367acf: e8acc8d4ff call 0x1400b4380
140367ad4: 90 nop
140367ad5: 4881c428010000 add rsp, 0x128
140367adc: 5b pop rbx
140367add: 5f pop rdi
140367ade: 5e pop rsi
140367adf: 415e pop r14
140367ae1: 415f pop r15
140367ae3: 5d pop rbp
140367ae4: c3 ret
140367ae5: 85c0 test eax, eax
140367ae7: 74ec je 0x140367ad5
140367ae9: 488d0dc895cd07 lea rcx, [rip + 0x7cd95c8]
140367af0: e82bd79d05 call 0x145d45220
140367af5: 89c2 mov edx, eax
140367af7: 84c0 test al, al
140367af9: 0f85abfdffff jne 0x1403678aa
140367aff: ebd4 jmp 0x140367ad5
140367b01: b908000000 mov ecx, 8
140367b06: ba78000000 mov edx, 0x78
140367b0b: e89117a305 call 0x145d992a1
140367b10: 0f0b ud2
