1459770c0 push rbp
1459770c1 push r15
1459770c3 push r14
1459770c5 push r13
1459770c7 push r12
1459770c9 push rsi
1459770ca push rdi
1459770cb push rbx
1459770cc sub rsp, 0x1f8
1459770d3 lea rbp, [rsp + 0x80]
1459770db mov qword ptr [rbp + 0x170], 0xfffffffffffffffe
1459770e6 mov qword ptr [rbp + 0x28], r9
1459770ea mov qword ptr [rbp + 0x20], r8
1459770ee mov r12, rdx
1459770f1 mov qword ptr [rbp + 0x30], rcx
1459770f5 call 0x140002200
1459770fa mov ecx, 1
1459770ff mov edx, 1
145977104 call 0x1400021c0
145977109 test rax, rax
14597710c je 0x1459782b5
145977112 mov qword ptr [rbp + 0xc0], rax
145977119 mov byte ptr [rax], 0x5b
14597711c mov r13, qword ptr [r12 + 0x668]
145977124 mov rax, qword ptr [r12 + 0x670]
14597712c lea rax, [rax + rax*4]
145977130 shl rax, 5
145977134 add rax, r13
145977137 mov qword ptr [rbp - 0x40], rax
14597713b lea rax, [r12 + 0x3b0]
145977143 mov qword ptr [rbp - 0x18], rax
145977147 mov rax, qword ptr [r12 + 0x3b0]
14597714f mov qword ptr [rbp - 0x38], rax
145977153 mov rax, qword ptr [r12 + 0x3c0]
14597715b mov qword ptr [rbp + 0x58], rax
14597715f mov rax, qword ptr [r12 + 0x3b8]
145977167 mov qword ptr [rbp + 0x10], rax
14597716b mov rax, qword ptr [r12 + 0x3d0]
145977173 mov qword ptr [rbp - 0x28], rax
145977177 mov rax, qword ptr [r12 + 0x3d8]
14597717f mov qword ptr [rbp - 0x20], rax
145977183 mov rax, qword ptr [r12 + 0x3f8]
14597718b mov qword ptr [rbp - 0x10], rax
14597718f mov rax, qword ptr [r12 + 0x400]
145977197 mov qword ptr [rbp - 8], rax
14597719b mov rcx, qword ptr [r12 + 0x360]
1459771a3 lea rax, [rcx*8]
1459771ab lea rax, [rax + rax*2]
1459771af mov qword ptr [rbp - 0x48], rax
1459771b3 mov qword ptr [rbp + 0x70], rcx
1459771b7 and rcx, 0xfffffffffffffffe
1459771bb mov qword ptr [rbp + 0x18], rcx
1459771bf mov bl, 1
1459771c1 mov eax, dword ptr [r12 + 0x408]
1459771c9 mov dword ptr [rbp + 0x68], eax
1459771cc mov eax, dword ptr [r12 + 0x418]
1459771d4 mov qword ptr [rbp], rax
1459771d8 inc eax
1459771da mov dword ptr [rbp + 0x6c], eax
1459771dd mov rax, qword ptr [r12 + 0x358]
1459771e5 mov qword ptr [rbp + 0xa8], rax
1459771ec mov rax, qword ptr [r12 + 0x340]
1459771f4 mov qword ptr [rbp + 8], rax
1459771f8 mov rax, qword ptr [r12 + 0x348]
145977200 mov qword ptr [rbp - 0x30], rax
145977204 mov eax, dword ptr [r12 + 0xc18]
14597720c mov dword ptr [rbp + 0xbc], eax
145977212 lea r15, [rbp + 0x159]
145977219 movabs rdi, 0x8000000000000000
145977223 mov r14d, 1
145977229 mov eax, 1
14597722e mov qword ptr [rbp + 0xd8], rax
145977235 mov qword ptr [rbp + 0xb0], r12
14597723c jmp 0x145977247
14597723e nop
145977240 add r13, 0xa0
145977247 cmp r13, qword ptr [rbp - 0x40]
14597724b je 0x145977dde
145977251 mov rsi, r14
145977254 call 0x140002200
145977259 mov ecx, 1
14597725e mov edx, 1
145977263 call 0x1400021c0
145977268 test rax, rax
14597726b je 0x14597829c
145977271 mov qword ptr [rbp + 0x130], rax
145977278 mov byte ptr [rax], 0x7b
14597727b mov rcx, qword ptr [r13 + 0x78]
14597727f mov rax, rcx
145977282 xor rax, rdi
145977285 test rcx, rcx
145977288 mov edi, 1
14597728d cmovns rax, rdi
145977291 mov r14b, 1
145977294 cmp rax, 1
145977298 je 0x145977610
14597729e cmp rax, 2
1459772a2 je 0x145977510
1459772a8 cmp rax, 3
1459772ac jne 0x1459776b0
1459772b2 cmp qword ptr [rbp - 0x38], -1
1459772b7 je 0x1459776b0
1459772bd mov rax, qword ptr [r13 + 0x80]
1459772c4 mov rcx, qword ptr [rbp + 0x58]
1459772c8 cmp rcx, qword ptr [rax + 0x10]
1459772cc jne 0x1459772e7
1459772ce mov rdx, qword ptr [rax + 8]
1459772d2 mov rcx, qword ptr [rbp + 0x10]
1459772d6 mov r8, qword ptr [rbp + 0x58]
1459772da call 0x145d14601
1459772df test eax, eax
1459772e1 je 0x145977d16
1459772e7 mov qword ptr [rbp + 0x140], 1
1459772f2 mov rax, qword ptr [rbp + 0x130]
1459772f9 mov qword ptr [rbp + 0x148], rax
145977300 mov qword ptr [rbp + 0x150], 1
14597730b mov byte ptr [rbp + 0x158], 1
145977312 mov qword ptr [rbp + 0xf8], rax
145977319 mov qword ptr [rbp + 0xf0], 1
145977324 mov byte ptr [rbp + 0x16e], 0
14597732b mov byte ptr [rbp + 0x16d], 1
145977332 mov rax, qword ptr [rbp - 0x20]
145977336 mov qword ptr [rsp + 0x28], rax
14597733b mov rax, qword ptr [rbp - 0x28]
14597733f mov qword ptr [rsp + 0x20], rax
145977344 mov r9d, 8
14597734a lea rcx, [rbp + 0x100]
145977351 lea rdx, [rbp + 0x140]
145977358 lea r8, [rip + 0x19bb027] ;147332386 b'replaces\nreplacesTextreplacesIconreplacesRarityreplacesRankbanishtitlerarityNamenewupgradechoiceswhy'
14597735f call 0x145858350
145977364 nop
145977365 mov byte ptr [rbp + 0xe8], bl
14597736b lea rcx, [rbp + 0x38]
14597736f mov rdx, qword ptr [rbp - 0x18]
145977373 call 0x14583d200
145977378 nop
145977379 mov rdx, qword ptr [rbp + 0x40]
14597737d mov rbx, qword ptr [rbp + 0x48]
145977381 mov qword ptr [rsp + 0x20], 1
14597738a lea r14, [rbp + 0x140]
145977391 mov rcx, r14
145977394 mov qword ptr [rbp + 0xc8], rdx
14597739b mov r8, rbx
14597739e lea r9, [rip + 0x19bafe9]
1459773a5 call 0x1458c01f0
1459773aa nop
1459773ab lea rdi, [rbp + 0x100]
1459773b2 mov rax, qword ptr [rbp + 0x140]
1459773b9 mov qword ptr [rbp + 0x78], rax
1459773bd mov rcx, qword ptr [rbp + 0x148]
1459773c4 mov rax, qword ptr [rbp + 0x150]
1459773cb mov qword ptr [rsp + 0x28], rax
1459773d0 mov qword ptr [rbp + 0x60], rcx
1459773d4 mov qword ptr [rsp + 0x20], rcx
1459773d9 mov r9d, 0xc
1459773df mov rcx, r14
1459773e2 mov rdx, rdi
1459773e5 lea r8, [rip + 0x19bafa3] ;14733238f b'replacesTextreplacesIconreplacesRarityreplacesRankbanishtitlerarityNamenewupgradechoiceswhybanishess'
1459773ec call 0x145858350
1459773f1 nop
1459773f2 mov rax, qword ptr [rbp - 8]
1459773f6 mov qword ptr [rsp + 0x28], rax
1459773fb mov rax, qword ptr [rbp - 0x10]
1459773ff mov qword ptr [rsp + 0x20], rax
145977404 mov r9d, 0xc
14597740a mov rcx, rdi
14597740d mov rdx, r14
145977410 lea r8, [rip + 0x19baf84] ;14733239b b'replacesIconreplacesRarityreplacesRankbanishtitlerarityNamenewupgradechoiceswhybanishesskipskipGold\x00'
145977417 call 0x145858350
14597741c nop
14597741d mov eax, dword ptr [rbp + 0x68]
145977420 mov dword ptr [rsp + 0x20], eax
145977424 mov r9d, 0xe
14597742a mov rcx, r14
14597742d mov rdx, rdi
145977430 lea r8, [rip + 0x19baf70] ;1473323a7 b'replacesRarityreplacesRankbanishtitlerarityNamenewupgradechoiceswhybanishesskipskipGold\x00\x00\xc8\xf62G\x01\x00\x00\x00)\x00\x00'
145977437 call 0x14584f0c0
14597743c nop
14597743d mov rax, qword ptr [rbp]
145977441 mov dword ptr [rsp + 0x20], eax
145977445 mov r9d, 0xc
14597744b lea rcx, [rbp + 0x80]
145977452 mov rdx, r14
145977455 lea r8, [rip + 0x19baf59] ;1473323b5 b'replacesRankbanishtitlerarityNamenewupgradechoiceswhybanishesskipskipGold\x00\x00\xc8\xf62G\x01\x00\x00\x00)\x00\x00\x00\x00\x00\x00\x00\xa0\x00\x00\x00!\x00\x00\x00V'
14597745c call 0x14584f0c0
145977461 nop
145977462 mov rax, qword ptr [rbp + 0x80]
145977469 mov qword ptr [rbp + 0xe0], rax
145977470 mov rax, qword ptr [rbp + 0x88]
145977477 mov qword ptr [rbp + 0x130], rax
14597747e mov rdi, qword ptr [rbp + 0x90]
145977485 movzx r14d, byte ptr [rbp + 0x98]
14597748d lea rcx, [rbp + 0x99]
145977494 mov eax, dword ptr [rcx]
145977496 mov ecx, dword ptr [rcx + 3]
145977499 mov dword ptr [rbp + 0x128], eax
14597749f mov dword ptr [rbp + 0x12b], ecx
1459774a5 mov rdx, qword ptr [rbp + 0x78]
1459774a9 test rdx, rdx
1459774ac je 0x1459774bd
1459774ae mov r8d, 1
1459774b4 mov rcx, qword ptr [rbp + 0x60]
1459774b8 call 0x1400021d0
1459774bd test rbx, rbx
1459774c0 je 0x1459776c4
1459774c6 mov rax, qword ptr [rbp + 0xc8]
1459774cd lea r12, [rax + 8]
1459774d1 jmp 0x1459774ed
1459774d3 nop word ptr cs:[rax + rax]
1459774e0 add r12, 0x18
1459774e4 dec rbx
1459774e7 je 0x1459776c4
1459774ed mov rdx, qword ptr [r12 - 8]
1459774f2 test rdx, rdx
1459774f5 je 0x1459774e0
1459774f7 mov rcx, qword ptr [r12]
1459774fb mov r8d, 1
145977501 call 0x1400021d0
145977506 jmp 0x1459774e0
145977508 nop dword ptr [rax + rax]
145977510 cmp qword ptr [rbp + 0x70], 0
145977515 je 0x145977746
14597751b mov byte ptr [rbp + 0xe8], bl
145977521 mov rdi, qword ptr [r13 + 0x80]
145977528 mov rbx, qword ptr [rdi]
14597752b mov r12, qword ptr [rdi + 8]
14597752f xor r14d, r14d
145977532 jmp 0x14597754e
145977534 nop word ptr cs:[rax + rax]
145977540 add r14, 0x18
145977544 cmp qword ptr [rbp - 0x48], r14
145977548 je 0x14597771f
14597754e mov rax, qword ptr [rbp + 0xa8]
145977555 mov rax, qword ptr [rax + r14]
145977559 cmp qword ptr [rax + 8], r12
14597755d jne 0x145977540
14597755f mov rcx, qword ptr [rax]
145977562 mov rdx, rbx
145977565 mov r8, r12
145977568 call 0x145d14601
14597756d test eax, eax
14597756f jne 0x145977540
145977571 mov qword ptr [rbp + 0x140], 1
14597757c mov rcx, qword ptr [rbp + 0x130]
145977583 mov qword ptr [rbp + 0x148], rcx
14597758a mov qword ptr [rbp + 0x150], 1
145977595 mov byte ptr [rbp + 0x158], 1
14597759c mov rax, qword ptr [rbp + 0xa8]
1459775a3 mov eax, dword ptr [rax + r14 + 0x14]
1459775a8 inc eax
1459775aa mov qword ptr [rbp + 0xf8], rcx
1459775b1 mov qword ptr [rbp + 0xf0], 1
1459775bc mov byte ptr [rbp + 0x16e], 0
1459775c3 mov byte ptr [rbp + 0x16d], 1
1459775ca mov dword ptr [rsp + 0x20], eax
1459775ce mov r9d, 4
1459775d4 lea rcx, [rbp + 0x100]
1459775db lea rdx, [rbp + 0x140]
1459775e2 lea r8, [rip + 0x19b8ee8] ;1473304d1 b'rankcdcdMaxslotamuletraritytexthudphasetimelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesreroll'
1459775e9 call 0x14584f0c0
1459775ee nop
1459775ef mov r12, qword ptr [rbp + 0xb0]
1459775f6 mov bl, byte ptr [rbp + 0xe8]
1459775fc jmp 0x14597782b
145977601 nop word ptr cs:[rax + rax]
145977610 mov rax, qword ptr [r13 + 0x90]
145977617 cmp rax, qword ptr [rbp - 0x30]
14597761b jae 0x1459776b0
145977621 imul rax, rax, 0x58
145977625 mov qword ptr [rbp + 0x140], 1
145977630 mov rdx, qword ptr [rbp + 0x130]
145977637 mov qword ptr [rbp + 0x148], rdx
14597763e mov qword ptr [rbp + 0x150], 1
145977649 mov byte ptr [rbp + 0x158], 1
145977650 mov rcx, qword ptr [rbp + 8]
145977654 mov eax, dword ptr [rcx + rax + 8]
145977658 inc eax
14597765a mov qword ptr [rbp + 0xf8], rdx
145977661 mov qword ptr [rbp + 0xf0], 1
14597766c mov byte ptr [rbp + 0x16e], 0
145977673 mov byte ptr [rbp + 0x16d], 1
14597767a mov dword ptr [rsp + 0x20], eax
14597767e mov r9d, 4
145977684 lea rcx, [rbp + 0x100]
14597768b lea rdx, [rbp + 0x140]
145977692 lea r8, [rip + 0x19b8e38] ;1473304d1 b'rankcdcdMaxslotamuletraritytexthudphasetimelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesreroll'
145977699 call 0x14584f0c0
14597769e nop
14597769f jmp 0x14597782b
1459776a4 nop word ptr cs:[rax + rax]
1459776b0 mov edx, 1
1459776b5 cmp dword ptr [rbp + 0xbc], 0
1459776bc jne 0x145977874
1459776c2 jmp 0x145977710
1459776c4 mov rax, qword ptr [rbp + 0x38]
1459776c8 test rax, rax
1459776cb je 0x1459776e7
1459776cd shl rax, 3
1459776d1 lea rdx, [rax + rax*2]
1459776d5 mov r8d, 8
1459776db mov rcx, qword ptr [rbp + 0xc8]
1459776e2 call 0x1400021d0
1459776e7 mov r12, qword ptr [rbp + 0xb0]
1459776ee movzx ebx, byte ptr [rbp + 0xe8]
1459776f5 mov rdx, qword ptr [rbp + 0xe0]
1459776fc cmp dword ptr [rbp + 0xbc], 0
145977703 jne 0x145977874
145977709 nop dword ptr [rax]
145977710 mov r8, qword ptr [rbp + 0x130]
145977717 mov r9, rdx
14597771a jmp 0x1459779ae
14597771f movzx r14d, byte ptr [rdi + 0x45]
145977724 cmp qword ptr [rbp + 0x70], 1
145977729 lea rcx, [rbp + 0x100]
145977730 jne 0x145977751
145977732 xor edx, edx
145977734 xor eax, eax
145977736 mov r12, qword ptr [rbp + 0xb0]
14597773d movzx ebx, byte ptr [rbp + 0xe8]
145977744 jmp 0x1459777a4
145977746 xor eax, eax
145977748 lea rcx, [rbp + 0x100]
14597774f jmp 0x1459777c2
145977751 mov r8, qword ptr [rbp + 0xa8]
145977758 xor edx, edx
14597775a xor eax, eax
14597775c mov r12, qword ptr [rbp + 0xb0]
145977763 movzx ebx, byte ptr [rbp + 0xe8]
14597776a mov rdi, qword ptr [rbp + 0x18]
14597776e nop
145977770 mov r9, qword ptr [r8]
145977773 mov r10, qword ptr [r8 + 0x18]
145977777 xor r11d, r11d
14597777a cmp byte ptr [r9 + 0x45], r14b
14597777e sete r11b
145977782 add r11, rax
145977785 xor eax, eax
145977787 cmp byte ptr [r10 + 0x45], r14b
14597778b sete al
14597778e add rax, r11
145977791 add rdx, 2
145977795 add r8, 0x30
145977799 cmp rdi, rdx
14597779c jne 0x145977770
14597779e test byte ptr [rbp + 0x70], 1
1459777a2 je 0x1459777c2
1459777a4 mov r8, rax
1459777a7 lea rax, [rdx + rdx*2]
1459777ab mov rdx, qword ptr [rbp + 0xa8]
1459777b2 mov rdx, qword ptr [rdx + rax*8]
1459777b6 xor eax, eax
1459777b8 cmp byte ptr [rdx + 0x45], r14b
1459777bc sete al
1459777bf add rax, r8
1459777c2 mov qword ptr [rbp + 0x140], 1
1459777cd mov rdx, qword ptr [rbp + 0x130]
1459777d4 mov qword ptr [rbp + 0x148], rdx
1459777db mov qword ptr [rbp + 0x150], 1
1459777e6 mov byte ptr [rbp + 0x158], 1
1459777ed mov qword ptr [rbp + 0xf8], rdx
1459777f4 mov qword ptr [rbp + 0xf0], 1
1459777ff mov byte ptr [rbp + 0x16e], 0
145977806 mov byte ptr [rbp + 0x16d], 1
14597780d mov dword ptr [rsp + 0x20], eax
145977811 mov r9d, 4
145977817 lea rdx, [rbp + 0x140]
14597781e lea r8, [rip + 0x19bab5d] ;147332382 b'wornreplaces\nreplacesTextreplacesIconreplacesRarityreplacesRankbanishtitlerarityNamenewupgradechoice'
145977825 call 0x14584f0c0
14597782a nop
14597782b mov rdx, qword ptr [rbp + 0x100]
145977832 mov rax, qword ptr [rbp + 0x108]
145977839 mov qword ptr [rbp + 0x130], rax
145977840 mov rdi, qword ptr [rbp + 0x110]
145977847 movzx r14d, byte ptr [rbp + 0x118]
14597784f lea rcx, [rbp + 0x119]
145977856 mov eax, dword ptr [rcx]
145977858 mov ecx, dword ptr [rcx + 3]
14597785b mov dword ptr [rbp + 0x128], eax
145977861 mov dword ptr [rbp + 0x12b], ecx
145977867 cmp dword ptr [rbp + 0xbc], 0
14597786e je 0x145977710
145977874 mov rax, qword ptr [rbp + 0x130]
14597787b mov qword ptr [rbp + 0xf8], rax
145977882 mov qword ptr [rbp + 0xe0], rdx
145977889 mov qword ptr [rbp + 0xf0], rdx
145977890 mov byte ptr [rbp + 0x16e], 1
145977897 mov byte ptr [rbp + 0x16d], 1
14597789e lea rcx, [rbp + 0x140]
1459778a5 mov rdx, r12
1459778a8 mov r8, r13
1459778ab call 0x1459745d0
1459778b0 nop
1459778b1 mov rdx, qword ptr [rbp + 0x140]
1459778b8 cmp rdx, -1
1459778bc je 0x1459779a0
1459778c2 test rdx, rdx
1459778c5 je 0x1459778d9
1459778c7 mov rcx, qword ptr [rbp + 0x148]
1459778ce mov r8d, 1
1459778d4 call 0x1400021d0
1459778d9 mov rax, qword ptr [rbp + 0xe0]
1459778e0 mov qword ptr [rbp + 0x140], rax
1459778e7 mov rax, qword ptr [rbp + 0x130]
1459778ee mov qword ptr [rbp + 0x148], rax
1459778f5 mov qword ptr [rbp + 0x150], rdi
1459778fc mov byte ptr [rbp + 0x158], r14b
145977903 mov eax, dword ptr [rbp + 0x128]
145977909 mov ecx, dword ptr [rbp + 0x12b]
14597790f mov dword ptr [r15 + 3], ecx
145977913 mov dword ptr [r15], eax
145977916 mov r8d, 6
14597791c lea rdi, [rbp + 0x140]
145977923 mov rcx, rdi
145977926 lea rdx, [rip + 0x19baa94] ;1473323c1 b'banishtitlerarityNamenewupgradechoiceswhybanishesskipskipGold\x00\x00\xc8\xf62G\x01\x00\x00\x00)\x00\x00\x00\x00\x00\x00\x00\xa0\x00\x00\x00!\x00\x00\x00Victory! The '
14597792d call 0x1458580a0
145977932 nop
145977933 mov rax, qword ptr [rbp + 0x140]
14597793a mov rdx, qword ptr [rbp + 0x150]
145977941 sub rax, rdx
145977944 cmp rax, 3
145977948 jbe 0x145977db4
14597794e mov rax, qword ptr [rbp + 0x148]
145977955 mov dword ptr [rax + rdx], 0x65757274
14597795c mov rdi, qword ptr [rbp + 0x150]
145977963 add rdi, 4
145977967 mov qword ptr [rbp + 0x150], rdi
14597796e mov r9, qword ptr [rbp + 0x140]
145977975 mov r8, qword ptr [rbp + 0x148]
14597797c movzx r14d, byte ptr [rbp + 0x158]
145977984 mov eax, dword ptr [r15]
145977987 mov ecx, dword ptr [r15 + 3]
14597798b mov dword ptr [rbp + 0x128], eax
145977991 mov dword ptr [rbp + 0x12b], ecx
145977997 jmp 0x1459779ae
145977999 nop dword ptr [rax]
1459779a0 mov r8, qword ptr [rbp + 0x130]
1459779a7 mov r9, qword ptr [rbp + 0xe0]
1459779ae mov rax, qword ptr [rbp + 0xd8]
1459779b5 mov qword ptr [rbp + 0x80], rax
1459779bc mov rax, qword ptr [rbp + 0xc0]
1459779c3 mov qword ptr [rbp + 0x88], rax
1459779ca mov qword ptr [rbp + 0x90], rsi
1459779d1 mov byte ptr [rbp + 0x98], bl
1459779d7 mov eax, dword ptr [rbp + 0xd0]
1459779dd mov ecx, dword ptr [rbp + 0xd3]
1459779e3 lea rdx, [rbp + 0x99]
1459779ea mov dword ptr [rdx + 3], ecx
1459779ed mov dword ptr [rdx], eax
1459779ef mov qword ptr [rbp + 0xe0], r9
1459779f6 mov qword ptr [rbp + 0x140], r9
1459779fd mov qword ptr [rbp + 0x130], r8
145977a04 mov qword ptr [rbp + 0x148], r8
145977a0b mov qword ptr [rbp + 0x150], rdi
145977a12 mov byte ptr [rbp + 0x158], r14b
145977a19 mov eax, dword ptr [rbp + 0x128]
145977a1f mov ecx, dword ptr [rbp + 0x12b]
145977a25 mov dword ptr [r15 + 3], ecx
145977a29 mov dword ptr [r15], eax
145977a2c movups xmm0, xmmword ptr [r13 + 8]
145977a31 movups xmmword ptr [rsp + 0x20], xmm0
145977a36 mov r9d, 5
145977a3c lea rsi, [rbp + 0x100]
145977a43 mov rcx, rsi
145977a46 lea r14, [rbp + 0x140]
145977a4d mov rdx, r14
145977a50 lea r8, [rip + 0x19ba970] ;1473323c7 b'titlerarityNamenewupgradechoiceswhybanishesskipskipGold\x00\x00\xc8\xf62G\x01\x00\x00\x00)\x00\x00\x00\x00\x00\x00\x00\xa0\x00\x00\x00!\x00\x00\x00Victory! The zone i'
145977a57 call 0x145858350
145977a5c nop
145977a5d movups xmm0, xmmword ptr [r13 + 0x50]
145977a62 movups xmmword ptr [rsp + 0x20], xmm0
145977a67 mov r9d, 4
145977a6d mov rcx, r14
145977a70 mov rdx, rsi
145977a73 lea r8, [rip + 0x19b846f] ;14732fee9 b'nameicondmgcolortoprevived\x0csink-test t=\xc5 \x00\x00p\x02\x00\x06 pos=(\xc5 \x00\x00p\x01\x00\x02, \xc5 \x00\x00p\x01\x00\x02, \xc5 \x00\x00p\x02\x00\x0f) lowest floor \xc0\x06 k'
145977a7a call 0x145858350
145977a7f nop
145977a80 mov rdx, qword ptr [r13 + 0x68]
145977a84 mov r8, qword ptr [r13 + 0x70]
145977a88 mov qword ptr [rsp + 0x20], 1
145977a91 mov rcx, rsi
145977a94 lea r9, [rip + 0x19ba8f3]
145977a9b call 0x1458c01f0
145977aa0 nop
145977aa1 movabs rdi, 0x8000000000000000
145977aab mov rax, qword ptr [rbp + 0x100]
145977ab2 mov qword ptr [rbp + 0xe8], rax
145977ab9 mov rcx, qword ptr [rbp + 0x108]
145977ac0 mov rax, qword ptr [rbp + 0x110]
145977ac7 mov byte ptr [rbp + 0x16c], 1
145977ace mov qword ptr [rsp + 0x28], rax
145977ad3 mov qword ptr [rbp + 0xc8], rcx
145977ada mov qword ptr [rsp + 0x20], rcx
145977adf mov r9d, 5
145977ae5 mov rcx, rsi
145977ae8 mov rdx, r14
145977aeb lea r8, [rip + 0x19b89a0] ;147330492 b'lines\x00\x00\x00 @\x00\x00\xe0@\x00\x00\x90@q\x1c\x97@\x00\x00 @\xdb\x0fI@X\xf72G\x01\x00\x00\x00$\x00\x00\x00\x00\x00\x00\x00=\x07\x00\x00-\x00\x00\x00downedkeyrankcdcdMaxslotamuletraritytexthudpha'
145977af2 call 0x145858350
145977af7 nop
145977af8 movups xmm0, xmmword ptr [r13 + 0x20]
145977afd mov byte ptr [rbp + 0x16c], 1
145977b04 movups xmmword ptr [rsp + 0x20], xmm0
145977b09 mov r9d, 4
145977b0f mov rcx, r14
145977b12 mov rdx, rsi
145977b15 lea r8, [rip + 0x19b89d0] ;1473304ec b'texthudphasetimelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdama'
145977b1c call 0x145858350
145977b21 nop
145977b22 movups xmm0, xmmword ptr [r13 + 0x38]
145977b27 mov byte ptr [rbp + 0x16c], 1
145977b2e movups xmmword ptr [rsp + 0x20], xmm0
145977b33 mov r9d, 4
145977b39 mov rcx, rsi
145977b3c mov rdx, r14
145977b3f lea r8, [rip + 0x19b83a7] ;14732feed b'icondmgcolortoprevived\x0csink-test t=\xc5 \x00\x00p\x02\x00\x06 pos=(\xc5 \x00\x00p\x01\x00\x02, \xc5 \x00\x00p\x01\x00\x02, \xc5 \x00\x00p\x02\x00\x0f) lowest floor \xc0\x06 keys '
145977b46 call 0x145858350
145977b4b nop
145977b4c mov eax, dword ptr [r13 + 0x98]
145977b53 mov byte ptr [rbp + 0x16c], 1
145977b5a mov dword ptr [rsp + 0x20], eax
145977b5e mov r9d, 6
145977b64 mov rcx, r14
145977b67 mov rdx, rsi
145977b6a lea r8, [rip + 0x19b8975] ;1473304e6 b'raritytexthudphasetimelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLeve'
145977b71 call 0x14584f0c0
145977b76 nop
145977b77 mov rcx, qword ptr [r13 + 0x98]
145977b7e mov byte ptr [rbp + 0x13f], 1
145977b85 call 0x1458ce860
145977b8a nop
145977b8b mov byte ptr [rbp + 0x13f], 0
145977b92 mov qword ptr [rsp + 0x28], rdx
145977b97 mov qword ptr [rsp + 0x20], rax
145977b9c mov r9d, 0xa
145977ba2 mov rcx, rsi
145977ba5 mov rdx, r14
145977ba8 lea r8, [rip + 0x19ba81d] ;1473323cc b'rarityNamenewupgradechoiceswhybanishesskipskipGold\x00\x00\xc8\xf62G\x01\x00\x00\x00)\x00\x00\x00\x00\x00\x00\x00\xa0\x00\x00\x00!\x00\x00\x00Victory! The zone is sav'
145977baf call 0x145858350
145977bb4 nop
145977bb5 mov rax, qword ptr [r13 + 0x78]
145977bb9 mov rcx, rax
145977bbc xor rcx, rdi
145977bbf test rax, rax
145977bc2 mov eax, 1
145977bc7 cmovns rcx, rax
145977bcb lea rdx, [rip + 0x19bb542]
145977bd2 movsxd rax, dword ptr [rdx + rcx*4]
145977bd6 add rax, rdx
145977bd9 jmp rax
145977bdb mov eax, 3
145977be0 lea rcx, [rip + 0x19ba7ef] ;1473323d6 b'newupgradechoiceswhybanishesskipskipGold\x00\x00\xc8\xf62G\x01\x00\x00\x00)\x00\x00\x00\x00\x00\x00\x00\xa0\x00\x00\x00!\x00\x00\x00Victory! The zone is saved.You hav'
145977be7 jmp 0x145977c40
145977be9 mov eax, 4
145977bee lea rcx, [rip + 0x19b8921] ;147330516 b'goldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritspeedarmorregenpickupabiliti'
145977bf5 jmp 0x145977c40
145977bf7 mov rax, qword ptr [r13 + 0x80]
145977bfe movzx ecx, byte ptr [rax + 0x45]
145977c02 lea rax, [rcx + rcx*2]
145977c06 add rax, 4
145977c0a test rcx, rcx
145977c0d lea rcx, [rip + 0x19b89d5] ;1473305e9 b'ringtrinket{subtitle} \xe2\x80\x94 survive the onslaught!subtitleYou have gained {damage}% damage, {health} m'
145977c14 lea rdx, [rip + 0x19b89d2] ;1473305ed b'trinket{subtitle} \xe2\x80\x94 survive the onslaught!subtitleYou have gained {damage}% damage, {health} maxim'
145977c1b cmovne rcx, rdx
145977c1f jmp 0x145977c40
145977c21 mov eax, 6
145977c26 lea rcx, [rip + 0x19b88b3] ;1473304e0 b'amuletraritytexthudphasetimelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststor'
145977c2d jmp 0x145977c40
145977c2f mov eax, 7
145977c34 lea rcx, [rip + 0x19ba79e] ;1473323d9 b'upgradechoiceswhybanishesskipskipGold\x00\x00\xc8\xf62G\x01\x00\x00\x00)\x00\x00\x00\x00\x00\x00\x00\xa0\x00\x00\x00!\x00\x00\x00Victory! The zone is saved.You have f'
145977c3b nop dword ptr [rax + rax]
145977c40 mov byte ptr [rbp + 0x16c], 1
145977c47 mov qword ptr [rsp + 0x28], rax
145977c4c mov qword ptr [rsp + 0x20], rcx
145977c51 mov r9d, 4
145977c57 mov rcx, r14
145977c5a mov rdx, rsi
145977c5d lea r8, [rip + 0x19b8ae7] ;14733074b b'kindxyzashapecirclerdonutinnerlinelenwconearct0t1thztmin%s is weakened!\x00\x00\x00\x00\x00\x00\xdb\xf72G\x01\x00\x00\x00(\x00\x00\x00\x00\x00\x00\x00G\x02\x00\x00"\x00\x00'
145977c64 call 0x145858350
145977c69 nop
145977c6a mov rbx, qword ptr [rbp + 0x150]
145977c71 cmp qword ptr [rbp + 0x140], rbx
145977c78 je 0x145977d8e
145977c7e mov rax, qword ptr [rbp + 0x148]
145977c85 mov byte ptr [rax + rbx], 0x7d
145977c89 inc rbx
145977c8c mov qword ptr [rbp + 0x110], rbx
145977c93 movups xmm0, xmmword ptr [rbp + 0x140]
145977c9a movaps xmmword ptr [rbp + 0x100], xmm0
145977ca1 mov byte ptr [rbp + 0x16c], 0
145977ca8 lea rcx, [rbp + 0x38]
145977cac lea rdx, [rbp + 0x80]
145977cb3 mov r8, rsi
145977cb6 call 0x145855000
145977cbb nop
145977cbc mov rax, qword ptr [rbp + 0x38]
145977cc0 mov qword ptr [rbp + 0xd8], rax
145977cc7 mov rax, qword ptr [rbp + 0x40]
145977ccb mov qword ptr [rbp + 0xc0], rax
145977cd2 mov r14, qword ptr [rbp + 0x48]
145977cd6 movzx ebx, byte ptr [rbp + 0x50]
145977cda lea rcx, [rbp + 0x51]
145977cde mov eax, dword ptr [rcx]
145977ce0 mov ecx, dword ptr [rcx + 3]
145977ce3 mov dword ptr [rbp + 0xd0], eax
145977ce9 mov dword ptr [rbp + 0xd3], ecx
145977cef mov rdx, qword ptr [rbp + 0xe8]
145977cf6 test rdx, rdx
145977cf9 je 0x145977240
145977cff mov r8d, 1
145977d05 mov rcx, qword ptr [rbp + 0xc8]
145977d0c call 0x1400021d0
145977d11 jmp 0x145977240
145977d16 mov qword ptr [rbp + 0x140], 1
145977d21 mov rax, qword ptr [rbp + 0x130]
145977d28 mov qword ptr [rbp + 0x148], rax
145977d2f mov qword ptr [rbp + 0x150], 1
145977d3a mov byte ptr [rbp + 0x158], 1
145977d41 mov qword ptr [rbp + 0xf8], rax
145977d48 mov qword ptr [rbp + 0xf0], 1
145977d53 mov byte ptr [rbp + 0x16e], 0
145977d5a mov byte ptr [rbp + 0x16d], 1
145977d61 mov eax, dword ptr [rbp + 0x6c]
145977d64 mov dword ptr [rsp + 0x20], eax
145977d68 mov r9d, 4
145977d6e lea rcx, [rbp + 0x100]
145977d75 lea rdx, [rbp + 0x140]
145977d7c lea r8, [rip + 0x19b874e] ;1473304d1 b'rankcdcdMaxslotamuletraritytexthudphasetimelevelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesreroll'
145977d83 call 0x14584f0c0
145977d88 nop
145977d89 jmp 0x14597782b
145977d8e mov qword ptr [rsp + 0x20], 1
145977d97 mov r8d, 1
145977d9d mov r9d, 1
145977da3 mov rcx, r14
145977da6 mov rdx, rbx
145977da9 call 0x145d14a10
145977dae nop
145977daf jmp 0x145977c7e
145977db4 mov qword ptr [rsp + 0x20], 1
145977dbd mov r8d, 4
145977dc3 mov r9d, 1
145977dc9 mov rcx, rdi
145977dcc call 0x145d14a10
145977dd1 nop
145977dd2 mov rdx, qword ptr [rbp + 0x150]
145977dd9 jmp 0x14597794e
145977dde call 0x140002200
145977de3 mov ecx, 1
145977de8 mov edx, 1
145977ded call 0x1400021c0
145977df2 test rax, rax
145977df5 je 0x1459782c6
145977dfb mov byte ptr [rax], 0x7b
145977dfe mov qword ptr [rbp + 0x140], 1
145977e09 mov qword ptr [rbp + 0x148], rax
145977e10 mov qword ptr [rbp + 0x150], 1
145977e1b mov byte ptr [rbp + 0x158], 1
145977e22 mov byte ptr [rbp + 0x16f], 1
145977e29 lea rax, [rip + 0x19ba5b0] ;1473323e0 b'choiceswhybanishesskipskipGold\x00\x00\xc8\xf62G\x01\x00\x00\x00)\x00\x00\x00\x00\x00\x00\x00\xa0\x00\x00\x00!\x00\x00\x00Victory! The zone is saved.You have fallen.Y'
145977e30 mov qword ptr [rsp + 0x20], rax
145977e35 mov qword ptr [rsp + 0x28], 7
145977e3e lea r8, [rip + 0x19b798b] ;14732f7d0 b"typeendlesscrates\\wenilla-rogue\\src\\game\\hazards.rs\x00\x00\x00\x00\x00\xdb\xf72G\x01\x00\x00\x00(\x00\x00\x00\x00\x00\x00\x00#\x02\x00\x00'\x00\x00\x00\xdb\xf72G\x01\x00\x00\x00(\x00\x00\x00\x00\x00\x00\x00\\\x01\x00\x00"
145977e45 lea rcx, [rbp + 0x100]
145977e4c lea rdx, [rbp + 0x140]
145977e53 mov r9d, 4
145977e59 call 0x145858350
145977e5e nop
145977e5f mov byte ptr [rbp + 0x16f], 1
145977e66 mov rax, qword ptr [rbp + 0x28]
145977e6a mov qword ptr [rsp + 0x28], rax
145977e6f mov rax, qword ptr [rbp + 0x20]
145977e73 mov qword ptr [rsp + 0x20], rax
145977e78 lea r8, [rip + 0x19ba568] ;1473323e7 b'whybanishesskipskipGold\x00\x00\xc8\xf62G\x01\x00\x00\x00)\x00\x00\x00\x00\x00\x00\x00\xa0\x00\x00\x00!\x00\x00\x00Victory! The zone is saved.You have fallen.You left'
145977e7f lea rcx, [rbp + 0x140]
145977e86 lea rdx, [rbp + 0x100]
145977e8d mov r9d, 3
145977e93 call 0x145858350
145977e98 nop
145977e99 mov eax, dword ptr [r12 + 0x4f0]
145977ea1 mov byte ptr [rbp + 0x16f], 1
145977ea8 mov dword ptr [rsp + 0x20], eax
145977eac lea r8, [rip + 0x19b8649] ;1473304fc b'levelxpxpNexthphpMaxshieldgoldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritsp'
145977eb3 lea rcx, [rbp + 0x100]
145977eba lea rdx, [rbp + 0x140]
145977ec1 mov r9d, 5
145977ec7 call 0x14584f0c0
145977ecc nop
145977ecd mov esi, dword ptr [r12 + 0x558]
145977ed5 mov byte ptr [rbp + 0x16f], 1
145977edc mov dword ptr [rsp + 0x20], esi
145977ee0 lea r8, [rip + 0x19b8648] ;14733052f b'rerollsrerollCoststoredLevelsdamagecooldowncritspeedarmorregenpickupabilitiesjewelrybuffstimersmeter'
145977ee7 lea rcx, [rbp + 0x140]
145977eee lea rdx, [rbp + 0x100]
145977ef5 mov r9d, 7
145977efb call 0x14584f0c0
145977f00 nop
145977f01 xor ecx, ecx
145977f03 test esi, esi
145977f05 jne 0x145977fad
145977f0b mov r8d, dword ptr [r12 + 0x55c]
145977f13 mov eax, 1
145977f18 test r8d, r8d
145977f1b je 0x145977f96
145977f1d test r8b, 1
145977f21 je 0x145977f2e
145977f23 mov eax, 3
145977f28 cmp r8d, 1
145977f2c je 0x145977f96
145977f2e test r8b, 2
145977f32 je 0x145977f42
145977f34 lea eax, [rax + rax*8]
145977f37 mov ecx, r8d
145977f3a and ecx, 0xfffffffe
145977f3d cmp ecx, 2
145977f40 je 0x145977f96
145977f42 test r8b, 4
145977f46 je 0x145977f59
145977f48 lea eax, [rax + rax*8]
145977f4b lea eax, [rax + rax*8]
145977f4e mov ecx, r8d
145977f51 and ecx, 0xfffffffc
145977f54 cmp ecx, 4
145977f57 je 0x145977f96
145977f59 test r8b, 8
145977f5d je 0x145977f70
145977f5f imul eax, eax, 0x19a1
145977f65 mov ecx, r8d
145977f68 and ecx, 0xfffffff8
145977f6b cmp ecx, 8
145977f6e je 0x145977f96
145977f70 mov r9b, 1
145977f73 mov ecx, 0xffffff9c
145977f78 test r8b, 0x10
145977f7c je 0x145977fa3
145977f7e mov edx, 0x290d741
145977f83 mul edx
145977f85 seto dl
145977f88 and r8d, 0xfffffff0
145977f8c cmp r8d, 0x10
145977f90 jne 0x145977fa3
145977f92 test dl, dl
145977f94 jne 0x145977fa3
145977f96 mov ecx, 0x64
145977f9b mul ecx
145977f9d mov ecx, eax
145977f9f seto r9b
145977fa3 test r9b, 1
145977fa7 jne 0x145978292
145977fad mov byte ptr [rbp + 0x16f], 1
145977fb4 mov dword ptr [rsp + 0x20], ecx
145977fb8 lea r8, [rip + 0x19b8577] ;147330536 b'rerollCoststoredLevelsdamagecooldowncritspeedarmorregenpickupabilitiesjewelrybuffstimersmeterhealedh'
145977fbf lea rcx, [rbp + 0x100]
145977fc6 lea rdx, [rbp + 0x140]
145977fcd mov r9d, 0xa
145977fd3 call 0x14584f0c0
145977fd8 nop
145977fd9 mov eax, dword ptr [r12 + 0x500]
145977fe1 mov byte ptr [rbp + 0x16f], 1
145977fe8 mov dword ptr [rsp + 0x20], eax
145977fec lea r8, [rip + 0x19b8523] ;147330516 b'goldchestCostkillsenemiesrerollsrerollCoststoredLevelsdamagecooldowncritspeedarmorregenpickupabiliti'
145977ff3 lea rcx, [rbp + 0x140]
145977ffa lea rdx, [rbp + 0x100]
145978001 mov r9d, 4
145978007 call 0x14584f0c0
14597800c nop
14597800d mov byte ptr [rbp + 0x16f], 1
145978014 mov eax, dword ptr [rbp + 0xbc]
14597801a mov dword ptr [rsp + 0x20], eax
14597801e lea r8, [rip + 0x19ba3c5] ;1473323ea b'banishesskipskipGold\x00\x00\xc8\xf62G\x01\x00\x00\x00)\x00\x00\x00\x00\x00\x00\x00\xa0\x00\x00\x00!\x00\x00\x00Victory! The zone is saved.You have fallen.You left th'
145978025 lea rcx, [rbp + 0x100]
14597802c lea rdx, [rbp + 0x140]
145978033 mov r9d, 8
145978039 call 0x14584f0c0
14597803e nop
14597803f mov dil, bl
145978042 mov bl, byte ptr [r12 + 0x2a6]
14597804a lea rdx, [rip + 0x19ba3a1] ;1473323f2 b'skipskipGold\x00\x00\xc8\xf62G\x01\x00\x00\x00)\x00\x00\x00\x00\x00\x00\x00\xa0\x00\x00\x00!\x00\x00\x00Victory! The zone is saved.You have fallen.You left the run.Su'
145978051 lea rcx, [rbp + 0x100]
145978058 mov r8d, 4
14597805e call 0x1458580a0
145978063 nop
145978064 movzx esi, bl
145978067 xor rsi, 5
14597806b mov rax, qword ptr [rbp + 0x100]
145978072 mov rcx, qword ptr [rbp + 0x110]
145978079 sub rax, rcx
14597807c cmp rsi, rax
14597807f ja 0x145978209
145978085 lea rax, [rip + 0x1694fde] ;14700d06a b'true\x01"\xc0\x01"\x00\n-- Azeroth Survivors\n\rABILITY_INFO_\xc0\xc0\x06 = "- \xc0\x03";\n\x00{blurb} Starts with {spell}; every leve'
14597808c lea rdx, [rip + 0x1694fd2] ;14700d065 b'falsetrue\x01"\xc0\x01"\x00\n-- Azeroth Survivors\n\rABILITY_INFO_\xc0\xc0\x06 = "- \xc0\x03";\n\x00{blurb} Starts with {spell}; every'
145978093 test bl, bl
145978095 cmovne rdx, rax
145978099 add rcx, qword ptr [rbp + 0x108]
1459780a0 mov r8, rsi
1459780a3 call 0x145d145fb
1459780a8 add qword ptr [rbp + 0x110], rsi
1459780af movups xmm0, xmmword ptr [rbp + 0x100]
1459780b6 movaps xmmword ptr [rbp + 0x140], xmm0
1459780bd movups xmm0, xmmword ptr [rbp + 0x110]
1459780c4 movaps xmmword ptr [rbp + 0x150], xmm0
1459780cb mov eax, dword ptr [r12 + 0xbf4]
1459780d3 shr eax, 2
1459780d6 cmp eax, 0xb
1459780d9 mov ecx, 0xa
1459780de cmovae ecx, eax
1459780e1 mov byte ptr [rbp + 0x16f], 1
1459780e8 mov dword ptr [rsp + 0x20], ecx
1459780ec lea r8, [rip + 0x19ba303] ;1473323f6 b'skipGold\x00\x00\xc8\xf62G\x01\x00\x00\x00)\x00\x00\x00\x00\x00\x00\x00\xa0\x00\x00\x00!\x00\x00\x00Victory! The zone is saved.You have fallen.You left the run.Surviv'
1459780f3 lea rcx, [rbp + 0x100]
1459780fa lea rdx, [rbp + 0x140]
145978101 mov r9d, 8
145978107 call 0x14584f0c0
14597810c nop
14597810d mov r8, qword ptr [rbp + 0xd8]
145978114 mov qword ptr [rbp + 0x140], r8
14597811b mov rdx, qword ptr [rbp + 0xc0]
145978122 mov qword ptr [rbp + 0x148], rdx
145978129 mov qword ptr [rbp + 0x150], r14
145978130 mov byte ptr [rbp + 0x158], dil
145978137 mov eax, dword ptr [rbp + 0xd0]
14597813d mov ecx, dword ptr [rbp + 0xd3]
145978143 mov dword ptr [rbp + 0x159], eax
145978149 mov dword ptr [rbp + 0x15c], ecx
14597814f mov rax, rdx
145978152 cmp r8, r14
145978155 je 0x145978237
14597815b mov byte ptr [rax + r14], 0x5d
145978160 inc r14
145978163 mov qword ptr [rbp + 0x90], r14
14597816a mov rax, qword ptr [rbp + 0x140]
145978171 mov qword ptr [rbp + 0x80], rax
145978178 mov rax, qword ptr [rbp + 0x148]
14597817f mov qword ptr [rbp + 0x88], rax
145978186 mov byte ptr [rbp + 0x13e], 0
14597818d lea rax, [rbp + 0x80]
145978194 mov qword ptr [rsp + 0x20], rax
145978199 lea r8, [rip + 0x19ba240] ;1473323e0 b'choiceswhybanishesskipskipGold\x00\x00\xc8\xf62G\x01\x00\x00\x00)\x00\x00\x00\x00\x00\x00\x00\xa0\x00\x00\x00!\x00\x00\x00Victory! The zone is saved.You have fallen.Y'
1459781a0 lea rcx, [rbp + 0x140]
1459781a7 lea rdx, [rbp + 0x100]
1459781ae mov r9d, 7
1459781b4 call 0x145858210
1459781b9 nop
1459781ba mov rsi, qword ptr [rbp + 0x150]
1459781c1 cmp qword ptr [rbp + 0x140], rsi
1459781c8 je 0x145978268
1459781ce mov rax, qword ptr [rbp + 0x148]
1459781d5 mov byte ptr [rax + rsi], 0x7d
1459781d9 inc rsi
1459781dc mov qword ptr [rbp + 0x150], rsi
1459781e3 mov rax, qword ptr [rbp + 0x30]
1459781e7 mov qword ptr [rax + 0x10], rsi
1459781eb movups xmm0, xmmword ptr [rbp + 0x140]
1459781f2 movups xmmword ptr [rax], xmm0
1459781f5 add rsp, 0x1f8
1459781fc pop rbx
1459781fd pop rdi
1459781fe pop rsi
1459781ff pop r12
145978201 pop r13
145978203 pop r14
145978205 pop r15
145978207 pop rbp
145978208 ret
145978209 mov qword ptr [rsp + 0x20], 1
145978212 mov rdx, rcx
145978215 lea rcx, [rbp + 0x100]
14597821c mov r9d, 1
145978222 mov r8, rsi
145978225 call 0x145d14a10
14597822a nop
14597822b mov rcx, qword ptr [rbp + 0x110]
145978232 jmp 0x145978085
145978237 mov qword ptr [rsp + 0x20], 1
145978240 lea rcx, [rbp + 0x140]
145978247 mov r8d, 1
14597824d mov r9d, 1
145978253 mov rdx, r14
145978256 call 0x145d14a10
14597825b nop
14597825c mov rax, qword ptr [rbp + 0x148]
145978263 jmp 0x14597815b
145978268 mov qword ptr [rsp + 0x20], 1
145978271 lea rcx, [rbp + 0x140]
145978278 mov r8d, 1
14597827e mov r9d, 1
145978284 mov rdx, rsi
145978287 call 0x145d14a10
14597828c nop
14597828d jmp 0x1459781ce
145978292 mov ecx, 0xffffffff
145978297 jmp 0x145977fad
14597829c mov byte ptr [rbp + 0x16f], 1
1459782a3 mov ecx, 1
1459782a8 mov edx, 1
1459782ad call 0x145eb6fcb
1459782b2 nop
1459782b3 jmp 0x1459782dd
1459782b5 mov ecx, 1
1459782ba mov edx, 1
1459782bf call 0x145eb6fcb
1459782c4 ud2
1459782c6 mov byte ptr [rbp + 0x16f], 1
1459782cd mov ecx, 1
1459782d2 mov edx, 1
1459782d7 call 0x145eb6fcb
1459782dc nop
1459782dd ud2
