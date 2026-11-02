# glue-race-lines [0x145808540,0x145808769)
145808540 55 push rbp
145808541 4157 push r15
145808543 4156 push r14
145808545 4154 push r12
145808547 56 push rsi
145808548 57 push rdi
145808549 53 push rbx
14580854a 4881ec80000000 sub rsp, 0x80
145808551 488dac2480000000 lea rbp, [rsp + 0x80]
145808559 660f7f7df0 movdqa xmmword ptr [rbp - 0x10], xmm7
14580855e 660f7f75e0 movdqa xmmword ptr [rbp - 0x20], xmm6
145808563 48c745d8feffffff mov qword ptr [rbp - 0x28], 0xfffffffffffffffe
14580856b 488b7a18 mov rdi, qword ptr [rdx + 0x18]
14580856f 4885ff test rdi, rdi
145808572 7910 jns 0x145808584
145808574 4531ff xor r15d, r15d
145808577 4c89f9 mov rcx, r15
14580857a 4889fa mov rdx, rdi
14580857d e849ea6a00 call 0x145eb6fcb
145808582 0f0b ud2
145808584 4889ce mov rsi, rcx
145808587 7445 je 0x1458085ce
145808589 4989d4 mov r12, rdx
14580858c 4c8b7210 mov r14, qword ptr [rdx + 0x10]
145808590 e86b9c7ffa call 0x140002200
145808595 41bf01000000 mov r15d, 1
14580859b ba01000000 mov edx, 1
1458085a0 4889f9 mov rcx, rdi
1458085a3 e8189c7ffa call 0x1400021c0
1458085a8 4885c0 test rax, rax
1458085ab 74ca je 0x145808577
1458085ad 4889c3 mov rbx, rax
1458085b0 4889c1 mov rcx, rax
1458085b3 4c89f2 mov rdx, r14
1458085b6 4989f8 mov r8, rdi
1458085b9 e83dc05000 call 0x145d145fb
1458085be 4883ff08 cmp rdi, 8
1458085c2 7314 jae 0x1458085d8
1458085c4 31c0 xor eax, eax
1458085c6 4c89e2 mov rdx, r12
1458085c9 e903010000 jmp 0x1458086d1
1458085ce bb01000000 mov ebx, 1
1458085d3 e91c010000 jmp 0x1458086f4
1458085d8 4883ff20 cmp rdi, 0x20
1458085dc 4c89e2 mov rdx, r12
1458085df 7307 jae 0x1458085e8
1458085e1 31c0 xor eax, eax
1458085e3 e98e000000 jmp 0x145808676
1458085e8 48b8e0ffffffffffff7f movabs rax, 0x7fffffffffffffe0
1458085f2 4821f8 and rax, rdi
1458085f5 31c9 xor ecx, ecx
1458085f7 660f6f05a12b6b00 movdqa xmm0, xmmword ptr [rip + 0x6b2ba1]
1458085ff 660f6f0da92b6b00 movdqa xmm1, xmmword ptr [rip + 0x6b2ba9]
145808607 660f6f15b12b6b00 movdqa xmm2, xmmword ptr [rip + 0x6b2bb1]
14580860f 90 nop
145808610 f30f6f1c0b movdqu xmm3, xmmword ptr [rbx + rcx]
145808615 f30f6f640b10 movdqu xmm4, xmmword ptr [rbx + rcx + 0x10]
14580861b 660f6feb movdqa xmm5, xmm3
14580861f 660ffce8 paddb xmm5, xmm0
145808623 660f6ff4 movdqa xmm6, xmm4
145808627 660ffcf0 paddb xmm6, xmm0
14580862b 660f6ffd movdqa xmm7, xmm5
14580862f 660fdaf9 pminub xmm7, xmm1
145808633 660f74fd pcmpeqb xmm7, xmm5
145808637 660fdbfa pand xmm7, xmm2
14580863b 660f6fee movdqa xmm5, xmm6
14580863f 660fdae9 pminub xmm5, xmm1
145808643 660f74ee pcmpeqb xmm5, xmm6
145808647 660fdbea pand xmm5, xmm2
14580864b 660febfb por xmm7, xmm3
14580864f 660febec por xmm5, xmm4
145808653 f30f7f3c0b movdqu xmmword ptr [rbx + rcx], xmm7
145808658 f30f7f6c0b10 movdqu xmmword ptr [rbx + rcx + 0x10], xmm5
14580865e 4883c120 add rcx, 0x20
145808662 4839c8 cmp rax, rcx
145808665 75a9 jne 0x145808610
145808667 4839c7 cmp rdi, rax
14580866a 0f8484000000 je 0x1458086f4
145808670 40f6c718 test dil, 0x18
145808674 745b je 0x1458086d1
145808676 4889c1 mov rcx, rax
145808679 48b8f8ffffffffffff7f movabs rax, 0x7ffffffffffffff8
145808683 4821f8 and rax, rdi
145808686 660f6f05422b6b00 movdqa xmm0, xmmword ptr [rip + 0x6b2b42]
14580868e 660f6f0d4a2b6b00 movdqa xmm1, xmmword ptr [rip + 0x6b2b4a]
145808696 660f6f15522b6b00 movdqa xmm2, xmmword ptr [rip + 0x6b2b52]
14580869e 6690 nop
1458086a0 f30f7e1c0b movq xmm3, qword ptr [rbx + rcx]
1458086a5 660f6fe3 movdqa xmm4, xmm3
1458086a9 660ffce0 paddb xmm4, xmm0
1458086ad 660f6fec movdqa xmm5, xmm4
1458086b1 660fdee9 pmaxub xmm5, xmm1
1458086b5 660f74ec pcmpeqb xmm5, xmm4
1458086b9 660fdfea pandn xmm5, xmm2
1458086bd 660febeb por xmm5, xmm3
1458086c1 660fd62c0b movq qword ptr [rbx + rcx], xmm5
1458086c6 4883c108 add rcx, 8
1458086ca 4839c8 cmp rax, rcx
1458086cd 75d1 jne 0x1458086a0
1458086cf eb1e jmp 0x1458086ef
1458086d1 0fb60c03 movzx ecx, byte ptr [rbx + rax]
1458086d5 448d41bf lea r8d, [rcx - 0x41]
1458086d9 4180f81a cmp r8b, 0x1a
1458086dd 410f92c0 setb r8b
1458086e1 41c0e005 shl r8b, 5
1458086e5 4108c8 or r8b, cl
1458086e8 44880403 mov byte ptr [rbx + rax], r8b
1458086ec 48ffc0 inc rax
1458086ef 4839c7 cmp rdi, rax
1458086f2 75dd jne 0x1458086d1
1458086f4 48897dc0 mov qword ptr [rbp - 0x40], rdi
1458086f8 48895dc8 mov qword ptr [rbp - 0x38], rbx
1458086fc 48897dd0 mov qword ptr [rbp - 0x30], rdi
145808700 488b4240 mov rax, qword ptr [rdx + 0x40]
145808704 488b4a48 mov rcx, qword ptr [rdx + 0x48]
145808708 48c1e104 shl rcx, 4
14580870c 4801c1 add rcx, rax
14580870f 488945a0 mov qword ptr [rbp - 0x60], rax
145808713 48894da8 mov qword ptr [rbp - 0x58], rcx
145808717 48c745b000000000 mov qword ptr [rbp - 0x50], 0
14580871f 488d45c0 lea rax, [rbp - 0x40]
145808723 488945b8 mov qword ptr [rbp - 0x48], rax
145808727 488d55a0 lea rdx, [rbp - 0x60]
14580872b 4889f1 mov rcx, rsi
14580872e e85dd31c00 call 0x1459d5a90
145808733 90 nop
145808734 488b55c0 mov rdx, qword ptr [rbp - 0x40]
145808738 4885d2 test rdx, rdx
14580873b 740f je 0x14580874c
14580873d 488b4dc8 mov rcx, qword ptr [rbp - 0x38]
145808741 41b801000000 mov r8d, 1
145808747 e8849a7ffa call 0x1400021d0
14580874c 4889f0 mov rax, rsi
14580874f 0f2875e0 movaps xmm6, xmmword ptr [rbp - 0x20]
145808753 0f287df0 movaps xmm7, xmmword ptr [rbp - 0x10]
145808757 4881c480000000 add rsp, 0x80
14580875e 5b pop rbx
14580875f 5f pop rdi
145808760 5e pop rsi
145808761 415c pop r12
145808763 415e pop r14
145808765 415f pop r15
145808767 5d pop rbp
145808768 c3 ret
# glue-update [0x145815e90,0x145815fde)
145815e90 55 push rbp
145815e91 56 push rsi
145815e92 57 push rdi
145815e93 4881eca0000000 sub rsp, 0xa0
145815e9a 488dac2480000000 lea rbp, [rsp + 0x80]
145815ea2 48c74518feffffff mov qword ptr [rbp + 0x18], 0xfffffffffffffffe
145815eaa 4c894df8 mov qword ptr [rbp - 8], r9
145815eae 4c894500 mov qword ptr [rbp], r8
145815eb2 4889d6 mov rsi, rdx
145815eb5 4889cf mov rdi, rcx
145815eb8 c6451701 mov byte ptr [rbp + 0x17], 1
145815ebc e88faa0c00 call 0x1458e0950
145815ec1 90 nop
145815ec2 c6451701 mov byte ptr [rbp + 0x17], 1
145815ec6 e8a5e00200 call 0x145843f70
145815ecb 90 nop
145815ecc 8b051e14a002 mov eax, dword ptr [rip + 0x2a0141e]
145815ed2 65488b0c2558000000 mov rcx, qword ptr gs:[0x58]
145815edb 488b04c1 mov rax, qword ptr [rcx + rax*8]
145815edf 80b83003000000 cmp byte ptr [rax + 0x330], 0
145815ee6 7409 je 0x145815ef1
145815ee8 488b8038030000 mov rax, qword ptr [rax + 0x338]
145815eef eb07 jmp 0x145815ef8
145815ef1 488b056812a002 mov rax, qword ptr [rip + 0x2a01268]
145815ef8 4883f80d cmp rax, 0xd
145815efc b90d000000 mov ecx, 0xd
145815f01 480f42c8 cmovb rcx, rax
145815f05 486bc138 imul rax, rcx, 0x38
145815f09 488d0d5888b101 lea rcx, [rip + 0x1b18858]
145815f10 488b0c08 mov rcx, qword ptr [rax + rcx]
145815f14 c6451701 mov byte ptr [rbp + 0x17], 1
145815f18 ba02000000 mov edx, 2
145815f1d e8fea40200 call 0x145840420
145815f22 90 nop
145815f23 c6451701 mov byte ptr [rbp + 0x17], 1
145815f27 e8d4440400 call 0x14585a400
145815f2c 90 nop
145815f2d c6451701 mov byte ptr [rbp + 0x17], 1
145815f31 e8aa131800 call 0x1459972e0
145815f36 90 nop
145815f37 c6451701 mov byte ptr [rbp + 0x17], 1
145815f3b e8b0011800 call 0x1459960f0
145815f40 90 nop
145815f41 c6451701 mov byte ptr [rbp + 0x17], 1
145815f45 e836f71700 call 0x145995680
145815f4a 90 nop
145815f4b c6451701 mov byte ptr [rbp + 0x17], 1
145815f4f e8fc051800 call 0x145996550
145815f54 90 nop
145815f55 c6451701 mov byte ptr [rbp + 0x17], 1
145815f59 e8f23f0300 call 0x145849f50
145815f5e 90 nop
145815f5f c6451701 mov byte ptr [rbp + 0x17], 1
145815f63 e878210d00 call 0x1458e80e0
145815f68 90 nop
145815f69 488b4568 mov rax, qword ptr [rbp + 0x68]
145815f6d 488b5560 mov rdx, qword ptr [rbp + 0x60]
145815f71 488b4a30 mov rcx, qword ptr [rdx + 0x30]
145815f75 48894de0 mov qword ptr [rbp - 0x20], rcx
145815f79 0f1002 movups xmm0, xmmword ptr [rdx]
145815f7c 0f104a10 movups xmm1, xmmword ptr [rdx + 0x10]
145815f80 0f105220 movups xmm2, xmmword ptr [rdx + 0x20]
145815f84 0f2955d0 movaps xmmword ptr [rbp - 0x30], xmm2
145815f88 0f294dc0 movaps xmmword ptr [rbp - 0x40], xmm1
145815f8c 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
145815f90 c6451700 mov byte ptr [rbp + 0x17], 0
145815f94 4889442428 mov qword ptr [rsp + 0x28], rax
145815f99 488d45b0 lea rax, [rbp - 0x50]
145815f9d 4889442420 mov qword ptr [rsp + 0x20], rax
145815fa2 4889f9 mov rcx, rdi
145815fa5 4889f2 mov rdx, rsi
145815fa8 4c8b4500 mov r8, qword ptr [rbp]
145815fac 4c8b4df8 mov r9, qword ptr [rbp - 8]
145815fb0 e82b240800 call 0x1458983e0
145815fb5 90 nop
145815fb6 488945f0 mov qword ptr [rbp - 0x10], rax
145815fba f048ff00 lock inc qword ptr [rax]
145815fbe 7e1c jle 0x145815fdc
145815fc0 48894508 mov qword ptr [rbp + 8], rax
145815fc4 4889c1 mov rcx, rax
145815fc7 e894bf0c00 call 0x1458e1f60
145815fcc 90 nop
145815fcd 488b4508 mov rax, qword ptr [rbp + 8]
145815fd1 4881c4a0000000 add rsp, 0xa0
145815fd8 5f pop rdi
145815fd9 5e pop rsi
145815fda 5d pop rbp
145815fdb c3 ret
145815fdc 0f0b ud2
# glue-strip [0x14583b470,0x14583b621)
14583b470 55 push rbp
14583b471 4157 push r15
14583b473 4156 push r14
14583b475 56 push rsi
14583b476 57 push rdi
14583b477 53 push rbx
14583b478 4881ecc8000000 sub rsp, 0xc8
14583b47f 488dac2480000000 lea rbp, [rsp + 0x80]
14583b487 48c74540feffffff mov qword ptr [rbp + 0x40], 0xfffffffffffffffe
14583b48f 4889ce mov rsi, rcx
14583b492 488b4240 mov rax, qword ptr [rdx + 0x40]
14583b496 48894510 mov qword ptr [rbp + 0x10], rax
14583b49a 0f1002 movups xmm0, xmmword ptr [rdx]
14583b49d 0f104a10 movups xmm1, xmmword ptr [rdx + 0x10]
14583b4a1 0f105220 movups xmm2, xmmword ptr [rdx + 0x20]
14583b4a5 0f105a30 movups xmm3, xmmword ptr [rdx + 0x30]
14583b4a9 0f295d00 movaps xmmword ptr [rbp], xmm3
14583b4ad 0f2955f0 movaps xmmword ptr [rbp - 0x10], xmm2
14583b4b1 0f294de0 movaps xmmword ptr [rbp - 0x20], xmm1
14583b4b5 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
14583b4b9 488d7de0 lea rdi, [rbp - 0x20]
14583b4bd 488d5d20 lea rbx, [rbp + 0x20]
14583b4c1 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14583b4d0 807d1100 cmp byte ptr [rbp + 0x11], 0
14583b4d4 0f851d010000 jne 0x14583b5f7
14583b4da 4c8b75e0 mov r14, qword ptr [rbp - 0x20]
14583b4de 4889d9 mov rcx, rbx
14583b4e1 4889fa mov rdx, rdi
14583b4e4 e877200100 call 0x14584d560
14583b4e9 837d2001 cmp dword ptr [rbp + 0x20], 1
14583b4ed 7521 jne 0x14583b510
14583b4ef 488b4530 mov rax, qword ptr [rbp + 0x30]
14583b4f3 488b4dd0 mov rcx, qword ptr [rbp - 0x30]
14583b4f7 488945d0 mov qword ptr [rbp - 0x30], rax
14583b4fb 4829c8 sub rax, rcx
14583b4fe 4901ce add r14, rcx
14583b501 4885c0 test rax, rax
14583b504 753b jne 0x14583b541
14583b506 eb58 jmp 0x14583b560
14583b508 0f1f840000000000 nop dword ptr [rax + rax]
14583b510 807d1100 cmp byte ptr [rbp + 0x11], 0
14583b514 0f85dd000000 jne 0x14583b5f7
14583b51a c6451101 mov byte ptr [rbp + 0x11], 1
14583b51e 4c8b75d0 mov r14, qword ptr [rbp - 0x30]
14583b522 488b45d8 mov rax, qword ptr [rbp - 0x28]
14583b526 4c29f0 sub rax, r14
14583b529 0f95c1 setne cl
14583b52c 0a4d10 or cl, byte ptr [rbp + 0x10]
14583b52f f6c101 test cl, 1
14583b532 0f84bf000000 je 0x14583b5f7
14583b538 4c0375e0 add r14, qword ptr [rbp - 0x20]
14583b53c 4885c0 test rax, rax
14583b53f 741f je 0x14583b560
14583b541 41807c06ff0a cmp byte ptr [r14 + rax - 1], 0xa
14583b547 4989c7 mov r15, rax
14583b54a 7517 jne 0x14583b563
14583b54c 4989c7 mov r15, rax
14583b54f 49ffcf dec r15
14583b552 740f je 0x14583b563
14583b554 41807c06fe0d cmp byte ptr [r14 + rax - 2], 0xd
14583b55a 7507 jne 0x14583b563
14583b55c 4883c0fe add rax, -2
14583b560 4989c7 mov r15, rax
14583b563 4c89f1 mov rcx, r14
14583b566 4c89fa mov rdx, r15
14583b569 e8f2b138fb call 0x140bc6760
14583b56e 4883fa0d cmp rdx, 0xd
14583b572 721e jb 0x14583b592
14583b574 488b0dd5157d01 mov rcx, qword ptr [rip + 0x17d15d5]
14583b57b 483308 xor rcx, qword ptr [rax]
14583b57e 488b15d0157d01 mov rdx, qword ptr [rip + 0x17d15d0]
14583b585 48335005 xor rdx, qword ptr [rax + 5]
14583b589 4809ca or rdx, rcx
14583b58c 0f843effffff je 0x14583b4d0
14583b592 4c8975c0 mov qword ptr [rbp - 0x40], r14
14583b596 4c897dc8 mov qword ptr [rbp - 0x38], r15
14583b59a 488d45c0 lea rax, [rbp - 0x40]
14583b59e 48894520 mov qword ptr [rbp + 0x20], rax
14583b5a2 488d05176b7cfa lea rax, [rip - 0x58394e9]
14583b5a9 48894528 mov qword ptr [rbp + 0x28], rax
14583b5ad 488d15a9124901 lea rdx, [rip + 0x14912a9]
14583b5b4 488d4da8 lea rcx, [rbp - 0x58]
14583b5b8 4c8d4520 lea r8, [rbp + 0x20]
14583b5bc e88fbd4a00 call 0x145ce7350
14583b5c1 48837da8ff cmp qword ptr [rbp - 0x58], -1
14583b5c6 742f je 0x14583b5f7
14583b5c8 488b45b8 mov rax, qword ptr [rbp - 0x48]
14583b5cc 48894530 mov qword ptr [rbp + 0x30], rax
14583b5d0 0f1045a8 movups xmm0, xmmword ptr [rbp - 0x58]
14583b5d4 0f294520 movaps xmmword ptr [rbp + 0x20], xmm0
14583b5d8 488d4dd0 lea rcx, [rbp - 0x30]
14583b5dc 488d5520 lea rdx, [rbp + 0x20]
14583b5e0 e8ab0a1a00 call 0x1459dc090
14583b5e5 90 nop
14583b5e6 488b4530 mov rax, qword ptr [rbp + 0x30]
14583b5ea 48894610 mov qword ptr [rsi + 0x10], rax
14583b5ee 0f284520 movaps xmm0, xmmword ptr [rbp + 0x20]
14583b5f2 0f1106 movups xmmword ptr [rsi], xmm0
14583b5f5 eb17 jmp 0x14583b60e
14583b5f7 48c70600000000 mov qword ptr [rsi], 0
14583b5fe 48c7460801000000 mov qword ptr [rsi + 8], 1
14583b606 48c7461000000000 mov qword ptr [rsi + 0x10], 0
14583b60e 4889f0 mov rax, rsi
14583b611 4881c4c8000000 add rsp, 0xc8
14583b618 5b pop rbx
14583b619 5f pop rdi
14583b61a 5e pop rsi
14583b61b 415e pop r14
14583b61d 415f pop r15
14583b61f 5d pop rbp
14583b620 c3 ret
# glue-race-localize [0x14584e9d0,0x14584ebe7)
14584e9d0 55 push rbp
14584e9d1 4157 push r15
14584e9d3 4156 push r14
14584e9d5 4155 push r13
14584e9d7 4154 push r12
14584e9d9 56 push rsi
14584e9da 57 push rdi
14584e9db 53 push rbx
14584e9dc 4881eca8000000 sub rsp, 0xa8
14584e9e3 488dac2480000000 lea rbp, [rsp + 0x80]
14584e9eb 48c74520feffffff mov qword ptr [rbp + 0x20], 0xfffffffffffffffe
14584e9f3 4d89c7 mov r15, r8
14584e9f6 4d85c0 test r8, r8
14584e9f9 790f jns 0x14584ea0a
14584e9fb 31f6 xor esi, esi
14584e9fd 4889f1 mov rcx, rsi
14584ea00 4c89fa mov rdx, r15
14584ea03 e8c3856600 call 0x145eb6fcb
14584ea08 0f0b ud2
14584ea0a 48894df0 mov qword ptr [rbp - 0x10], rcx
14584ea0e 742a je 0x14584ea3a
14584ea10 4989d6 mov r14, rdx
14584ea13 4489cf mov edi, r9d
14584ea16 e8e5377bfa call 0x140002200
14584ea1b be01000000 mov esi, 1
14584ea20 ba01000000 mov edx, 1
14584ea25 4c89f9 mov rcx, r15
14584ea28 e893377bfa call 0x1400021c0
14584ea2d 4885c0 test rax, rax
14584ea30 74cb je 0x14584e9fd
14584ea32 4189f9 mov r9d, edi
14584ea35 4c89f2 mov rdx, r14
14584ea38 eb05 jmp 0x14584ea3f
14584ea3a b801000000 mov eax, 1
14584ea3f 4c897d08 mov qword ptr [rbp + 8], r15
14584ea43 48894510 mov qword ptr [rbp + 0x10], rax
14584ea47 48c7451800000000 mov qword ptr [rbp + 0x18], 0
14584ea4f 488955f8 mov qword ptr [rbp - 8], rdx
14584ea53 488955c0 mov qword ptr [rbp - 0x40], rdx
14584ea57 4c897dc8 mov qword ptr [rbp - 0x38], r15
14584ea5b 48c745d000000000 mov qword ptr [rbp - 0x30], 0
14584ea63 4c897d00 mov qword ptr [rbp], r15
14584ea67 4c897dd8 mov qword ptr [rbp - 0x28], r15
14584ea6b 44894de0 mov dword ptr [rbp - 0x20], r9d
14584ea6f 44894de4 mov dword ptr [rbp - 0x1c], r9d
14584ea73 c645e801 mov byte ptr [rbp - 0x18], 1
14584ea77 4531f6 xor r14d, r14d
14584ea7a 4c8d7da8 lea r15, [rbp - 0x58]
14584ea7e 4c8d65c0 lea r12, [rbp - 0x40]
14584ea82 4531ed xor r13d, r13d
14584ea85 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
14584ea90 4c89f9 mov rcx, r15
14584ea93 4c89e2 mov rdx, r12
14584ea96 e845ed0100 call 0x14586d7e0
14584ea9b 90 nop
14584ea9c 807da800 cmp byte ptr [rbp - 0x58], 0
14584eaa0 0f84b8000000 je 0x14584eb5e
14584eaa6 488b5db0 mov rbx, qword ptr [rbp - 0x50]
14584eaaa 488b7db8 mov rdi, qword ptr [rbp - 0x48]
14584eaae 4889de mov rsi, rbx
14584eab1 4c29ee sub rsi, r13
14584eab4 488b4508 mov rax, qword ptr [rbp + 8]
14584eab8 4c29f0 sub rax, r14
14584eabb 4839c6 cmp rsi, rax
14584eabe 774c ja 0x14584eb0c
14584eac0 4c39eb cmp rbx, r13
14584eac3 7416 je 0x14584eadb
14584eac5 4c036df8 add r13, qword ptr [rbp - 8]
14584eac9 488b4d10 mov rcx, qword ptr [rbp + 0x10]
14584eacd 4c01f1 add rcx, r14
14584ead0 4c89ea mov rdx, r13
14584ead3 4989f0 mov r8, rsi
14584ead6 e8205b4c00 call 0x145d145fb
14584eadb 4901f6 add r14, rsi
14584eade 4c897518 mov qword ptr [rbp + 0x18], r14
14584eae2 488b4508 mov rax, qword ptr [rbp + 8]
14584eae6 4c29f0 sub rax, r14
14584eae9 4883f801 cmp rax, 1
14584eaed 7647 jbe 0x14584eb36
14584eaef 488b4510 mov rax, qword ptr [rbp + 0x10]
14584eaf3 0fb78d90000000 movzx ecx, word ptr [rbp + 0x90]
14584eafa 6642890c30 mov word ptr [rax + r14], cx
14584eaff 4983c602 add r14, 2
14584eb03 4c897518 mov qword ptr [rbp + 0x18], r14
14584eb07 4989fd mov r13, rdi
14584eb0a eb84 jmp 0x14584ea90
14584eb0c 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14584eb15 41b901000000 mov r9d, 1
14584eb1b 488d4d08 lea rcx, [rbp + 8]
14584eb1f 4c89f2 mov rdx, r14
14584eb22 4989f0 mov r8, rsi
14584eb25 e8e65e4c00 call 0x145d14a10
14584eb2a 90 nop
14584eb2b 4c8b7518 mov r14, qword ptr [rbp + 0x18]
14584eb2f 4c39eb cmp rbx, r13
14584eb32 7591 jne 0x14584eac5
14584eb34 eba5 jmp 0x14584eadb
14584eb36 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14584eb3f 41b802000000 mov r8d, 2
14584eb45 41b901000000 mov r9d, 1
14584eb4b 488d4d08 lea rcx, [rbp + 8]
14584eb4f 4c89f2 mov rdx, r14
14584eb52 e8b95e4c00 call 0x145d14a10
14584eb57 90 nop
14584eb58 4c8b7518 mov r14, qword ptr [rbp + 0x18]
14584eb5c eb91 jmp 0x14584eaef
14584eb5e 488b4d00 mov rcx, qword ptr [rbp]
14584eb62 4989cf mov r15, rcx
14584eb65 4d29ef sub r15, r13
14584eb68 488b4508 mov rax, qword ptr [rbp + 8]
14584eb6c 4c29f0 sub rax, r14
14584eb6f 4939c7 cmp r15, rax
14584eb72 7745 ja 0x14584ebb9
14584eb74 4c39e9 cmp rcx, r13
14584eb77 7416 je 0x14584eb8f
14584eb79 488b55f8 mov rdx, qword ptr [rbp - 8]
14584eb7d 4c01ea add rdx, r13
14584eb80 488b4d10 mov rcx, qword ptr [rbp + 0x10]
14584eb84 4c01f1 add rcx, r14
14584eb87 4d89f8 mov r8, r15
14584eb8a e86c5a4c00 call 0x145d145fb
14584eb8f 4d01fe add r14, r15
14584eb92 4c897518 mov qword ptr [rbp + 0x18], r14
14584eb96 488b45f0 mov rax, qword ptr [rbp - 0x10]
14584eb9a 4c897010 mov qword ptr [rax + 0x10], r14
14584eb9e 0f104508 movups xmm0, xmmword ptr [rbp + 8]
14584eba2 0f1100 movups xmmword ptr [rax], xmm0
14584eba5 4881c4a8000000 add rsp, 0xa8
14584ebac 5b pop rbx
14584ebad 5f pop rdi
14584ebae 5e pop rsi
14584ebaf 415c pop r12
14584ebb1 415d pop r13
14584ebb3 415e pop r14
14584ebb5 415f pop r15
14584ebb7 5d pop rbp
14584ebb8 c3 ret
14584ebb9 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14584ebc2 488d4d08 lea rcx, [rbp + 8]
14584ebc6 41b901000000 mov r9d, 1
14584ebcc 4c89f2 mov rdx, r14
14584ebcf 4d89f8 mov r8, r15
14584ebd2 e8395e4c00 call 0x145d14a10
14584ebd7 90 nop
14584ebd8 4c8b7518 mov r14, qword ptr [rbp + 0x18]
14584ebdc 488b4d00 mov rcx, qword ptr [rbp]
14584ebe0 4c39e9 cmp rcx, r13
14584ebe3 7594 jne 0x14584eb79
14584ebe5 eba8 jmp 0x14584eb8f
# glue-quote [0x145858680,0x14585872e)
145858680 55 push rbp
145858681 56 push rsi
145858682 4883ec78 sub rsp, 0x78
145858686 488d6c2470 lea rbp, [rsp + 0x70]
14585868b 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
145858693 4889ce mov rsi, rcx
145858696 66c74424205c5c mov word ptr [rsp + 0x20], 0x5c5c
14585869d 488d4dc0 lea rcx, [rbp - 0x40]
1458586a1 41b95c000000 mov r9d, 0x5c
1458586a7 e82463ffff call 0x14584e9d0
1458586ac 488b55c8 mov rdx, qword ptr [rbp - 0x38]
1458586b0 4c8b45d0 mov r8, qword ptr [rbp - 0x30]
1458586b4 66c74424205c22 mov word ptr [rsp + 0x20], 0x225c
1458586bb 488d4dd8 lea rcx, [rbp - 0x28]
1458586bf 488955f0 mov qword ptr [rbp - 0x10], rdx
1458586c3 41b922000000 mov r9d, 0x22
1458586c9 e80263ffff call 0x14584e9d0
1458586ce 90 nop
1458586cf 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458586d3 4c8b45e8 mov r8, qword ptr [rbp - 0x18]
1458586d7 66c74424205c6e mov word ptr [rsp + 0x20], 0x6e5c
1458586de 4889f1 mov rcx, rsi
1458586e1 488955f8 mov qword ptr [rbp - 8], rdx
1458586e5 41b90a000000 mov r9d, 0xa
1458586eb e8e062ffff call 0x14584e9d0
1458586f0 90 nop
1458586f1 488b55d8 mov rdx, qword ptr [rbp - 0x28]
1458586f5 4885d2 test rdx, rdx
1458586f8 740f je 0x145858709
1458586fa 41b801000000 mov r8d, 1
145858700 488b4df8 mov rcx, qword ptr [rbp - 8]
145858704 e8c79a7afa call 0x1400021d0
145858709 488b55c0 mov rdx, qword ptr [rbp - 0x40]
14585870d 4885d2 test rdx, rdx
145858710 7415 je 0x145858727
145858712 41b801000000 mov r8d, 1
145858718 488b4df0 mov rcx, qword ptr [rbp - 0x10]
14585871c 4883c478 add rsp, 0x78
145858720 5e pop rsi
145858721 5d pop rbp
145858722 e9a99a7afa jmp 0x1400021d0
145858727 4883c478 add rsp, 0x78
14585872b 5e pop rsi
14585872c 5d pop rbp
14585872d c3 ret
# glue-transform [0x145859140,0x145859f25)
145859140 55 push rbp
145859141 4157 push r15
145859143 4156 push r14
145859145 4155 push r13
145859147 4154 push r12
145859149 56 push rsi
14585914a 57 push rdi
14585914b 53 push rbx
14585914c 4881ec88010000 sub rsp, 0x188
145859153 488dac2480000000 lea rbp, [rsp + 0x80]
14585915b 48c78500010000feffffff mov qword ptr [rbp + 0x100], 0xfffffffffffffffe
145859166 48894dd0 mov qword ptr [rbp - 0x30], rcx
14585916a 48c7455800000000 mov qword ptr [rbp + 0x58], 0
145859172 4c894560 mov qword ptr [rbp + 0x60], r8
145859176 48895568 mov qword ptr [rbp + 0x68], rdx
14585917a 4c894570 mov qword ptr [rbp + 0x70], r8
14585917e 48c7457800000000 mov qword ptr [rbp + 0x78], 0
145859186 4c898580000000 mov qword ptr [rbp + 0x80], r8
14585918d 48b80a0000000a000000 movabs rax, 0xa0000000a
145859197 48898588000000 mov qword ptr [rbp + 0x88], rax
14585919e c6859000000001 mov byte ptr [rbp + 0x90], 1
1458591a5 66c785980000000000 mov word ptr [rbp + 0x98], 0
1458591ae 488d8db8000000 lea rcx, [rbp + 0xb8]
1458591b5 488d5558 lea rdx, [rbp + 0x58]
1458591b9 e8b222feff call 0x14583b470
1458591be 488b85b8000000 mov rax, qword ptr [rbp + 0xb8]
1458591c5 488bb5c8000000 mov rsi, qword ptr [rbp + 0xc8]
1458591cc 4829f0 sub rax, rsi
1458591cf 4883f815 cmp rax, 0x15
1458591d3 0f86d70c0000 jbe 0x145859eb0
1458591d9 488b8dc0000000 mov rcx, qword ptr [rbp + 0xc0]
1458591e0 0f10058d3e7b01 movups xmm0, xmmword ptr [rip + 0x17b3e8d]
1458591e7 0f110431 movups xmmword ptr [rcx + rsi], xmm0
1458591eb 48b8727669766f72730a movabs rax, 0xa73726f76697672
1458591f5 48894d08 mov qword ptr [rbp + 8], rcx
1458591f9 488944310e mov qword ptr [rcx + rsi + 0xe], rax
1458591fe 4883c616 add rsi, 0x16
145859202 4889b5c8000000 mov qword ptr [rbp + 0xc8], rsi
145859209 488d1db88c4601 lea rbx, [rip + 0x1468cb8]
145859210 4c8d7510 lea r14, [rbp + 0x10]
145859214 4c8d3da58e7afa lea r15, [rip - 0x585715b]
14585921b 31c0 xor eax, eax
14585921d 483dc0020000 cmp rax, 0x2c0
145859223 0f84d5060000 je 0x1458598fe
145859229 4c8d2403 lea r12, [rbx + rax]
14585922d 4c89f1 mov rcx, r14
145859230 4c89e2 mov rdx, r12
145859233 4889c7 mov rdi, rax
145859236 e805f3faff call 0x145808540
14585923b 90 nop
14585923c 4883c758 add rdi, 0x58
145859240 48897dc0 mov qword ptr [rbp - 0x40], rdi
145859244 488b4518 mov rax, qword ptr [rbp + 0x18]
145859248 488b7d20 mov rdi, qword ptr [rbp + 0x20]
14585924c 48c1e704 shl rdi, 4
145859250 4801c7 add rdi, rax
145859253 4983c410 add r12, 0x10
145859257 4c896550 mov qword ptr [rbp + 0x50], r12
14585925b 48c7452800000000 mov qword ptr [rbp + 0x28], 0
145859263 488945c8 mov qword ptr [rbp - 0x38], rax
145859267 48897db8 mov qword ptr [rbp - 0x48], rdi
14585926b 4839f8 cmp rax, rdi
14585926e 0f845e060000 je 0x1458598d2
145859274 4889b5d0000000 mov qword ptr [rbp + 0xd0], rsi
14585927b 488d5810 lea rbx, [rax + 0x10]
14585927f 488b7d28 mov rdi, qword ptr [rbp + 0x28]
145859283 48ffc7 inc rdi
145859286 48897de8 mov qword ptr [rbp - 0x18], rdi
14585928a 488b7008 mov rsi, qword ptr [rax + 8]
14585928e 4885f6 test rsi, rsi
145859291 0f885f0a0000 js 0x145859cf6
145859297 4c8b30 mov r14, qword ptr [rax]
14585929a 48897d28 mov qword ptr [rbp + 0x28], rdi
14585929e 48895dd8 mov qword ptr [rbp - 0x28], rbx
1458592a2 741c je 0x1458592c0
1458592a4 e8578f7afa call 0x140002200
1458592a9 ba01000000 mov edx, 1
1458592ae 4889f1 mov rcx, rsi
1458592b1 e80a8f7afa call 0x1400021c0
1458592b6 4885c0 test rax, rax
1458592b9 750a jne 0x1458592c5
1458592bb e94a0c0000 jmp 0x145859f0a
1458592c0 b801000000 mov eax, 1
1458592c5 48897558 mov qword ptr [rbp + 0x58], rsi
1458592c9 48894560 mov qword ptr [rbp + 0x60], rax
1458592cd 488945f8 mov qword ptr [rbp - 8], rax
1458592d1 488985f0000000 mov qword ptr [rbp + 0xf0], rax
1458592d8 31db xor ebx, ebx
1458592da 31ff xor edi, edi
1458592dc 48895d68 mov qword ptr [rbp + 0x68], rbx
1458592e0 4989f5 mov r13, rsi
1458592e3 4889bdf8000000 mov qword ptr [rbp + 0xf8], rdi
1458592ea 4929fd sub r13, rdi
1458592ed 0f826d010000 jb 0x145859460
1458592f3 4c8bbdf8000000 mov r15, qword ptr [rbp + 0xf8]
1458592fa eb10 jmp 0x14585930c
1458592fc 0f1f4000 nop dword ptr [rax]
145859300 4989ff mov r15, rdi
145859303 4839f7 cmp rdi, rsi
145859306 0f8754010000 ja 0x145859460
14585930c 4989f0 mov r8, rsi
14585930f 4d29f8 sub r8, r15
145859312 4b8d143e lea rdx, [r14 + r15]
145859316 4983f810 cmp r8, 0x10
14585931a 7334 jae 0x145859350
14585931c 4531e4 xor r12d, r12d
14585931f 4d85c0 test r8, r8
145859322 741e je 0x145859342
145859324 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145859330 42803c225c cmp byte ptr [rdx + r12], 0x5c
145859335 742f je 0x145859366
145859337 49ffc4 inc r12
14585933a 4d39e0 cmp r8, r12
14585933d 75f1 jne 0x145859330
14585933f 4d89c4 mov r12, r8
145859342 31c0 xor eax, eax
145859344 4883f801 cmp rax, 1
145859348 7436 je 0x145859380
14585934a e911010000 jmp 0x145859460
14585934f 90 nop
145859350 b15c mov cl, 0x5c
145859352 e8296a4900 call 0x145cefd80
145859357 90 nop
145859358 4989d4 mov r12, rdx
14585935b 4883f801 cmp rax, 1
14585935f 741f je 0x145859380
145859361 e9fa000000 jmp 0x145859460
145859366 b801000000 mov eax, 1
14585936b 4883f801 cmp rax, 1
14585936f 0f85eb000000 jne 0x145859460
145859375 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
145859380 4b8d3c3c lea rdi, [r12 + r15]
145859384 48ffc7 inc rdi
145859387 4d01fc add r12, r15
14585938a 4939f4 cmp r12, rsi
14585938d 0f836dffffff jae 0x145859300
145859393 43803c265c cmp byte ptr [r14 + r12], 0x5c
145859398 0f8562ffffff jne 0x145859300
14585939e 4d89e5 mov r13, r12
1458593a1 4c2badf8000000 sub r13, qword ptr [rbp + 0xf8]
1458593a8 488b4558 mov rax, qword ptr [rbp + 0x58]
1458593ac 4829d8 sub rax, rbx
1458593af 4939c5 cmp r13, rax
1458593b2 774c ja 0x145859400
1458593b4 488b95f8000000 mov rdx, qword ptr [rbp + 0xf8]
1458593bb 4939d4 cmp r12, rdx
1458593be 7412 je 0x1458593d2
1458593c0 4c01f2 add rdx, r14
1458593c3 488b4d60 mov rcx, qword ptr [rbp + 0x60]
1458593c7 4801d9 add rcx, rbx
1458593ca 4d89e8 mov r8, r13
1458593cd e829b24b00 call 0x145d145fb
1458593d2 4c01eb add rbx, r13
1458593d5 48895d68 mov qword ptr [rbp + 0x68], rbx
1458593d9 488b4558 mov rax, qword ptr [rbp + 0x58]
1458593dd 4829d8 sub rax, rbx
1458593e0 4883f801 cmp rax, 1
1458593e4 764b jbe 0x145859431
1458593e6 488b4560 mov rax, qword ptr [rbp + 0x60]
1458593ea 488985f0000000 mov qword ptr [rbp + 0xf0], rax
1458593f1 66c704185c5c mov word ptr [rax + rbx], 0x5c5c
1458593f7 4883c302 add rbx, 2
1458593fb e9dcfeffff jmp 0x1458592dc
145859400 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145859409 41b901000000 mov r9d, 1
14585940f 488d4d58 lea rcx, [rbp + 0x58]
145859413 4889da mov rdx, rbx
145859416 4d89e8 mov r8, r13
145859419 e8f2b54b00 call 0x145d14a10
14585941e 90 nop
14585941f 488b5d68 mov rbx, qword ptr [rbp + 0x68]
145859423 488b95f8000000 mov rdx, qword ptr [rbp + 0xf8]
14585942a 4939d4 cmp r12, rdx
14585942d 7591 jne 0x1458593c0
14585942f eba1 jmp 0x1458593d2
145859431 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14585943a 41b802000000 mov r8d, 2
145859440 41b901000000 mov r9d, 1
145859446 488d4d58 lea rcx, [rbp + 0x58]
14585944a 4889da mov rdx, rbx
14585944d e8beb54b00 call 0x145d14a10
145859452 90 nop
145859453 488b5d68 mov rbx, qword ptr [rbp + 0x68]
145859457 eb8d jmp 0x1458593e6
145859459 0f1f8000000000 nop dword ptr [rax]
145859460 488b4558 mov rax, qword ptr [rbp + 0x58]
145859464 4829d8 sub rax, rbx
145859467 4939c5 cmp r13, rax
14585946a 0f8795030000 ja 0x145859805
145859470 488b85f8000000 mov rax, qword ptr [rbp + 0xf8]
145859477 4839c6 cmp rsi, rax
14585947a 7419 je 0x145859495
14585947c 4901c6 add r14, rax
14585947f 488b85f0000000 mov rax, qword ptr [rbp + 0xf0]
145859486 488d0c18 lea rcx, [rax + rbx]
14585948a 4c89f2 mov rdx, r14
14585948d 4d89e8 mov r8, r13
145859490 e866b14b00 call 0x145d145fb
145859495 4c01eb add rbx, r13
145859498 488b4558 mov rax, qword ptr [rbp + 0x58]
14585949c 48894500 mov qword ptr [rbp], rax
1458594a0 66c74424205c22 mov word ptr [rsp + 0x20], 0x225c
1458594a7 488d8dd8000000 lea rcx, [rbp + 0xd8]
1458594ae 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
1458594b5 4989d8 mov r8, rbx
1458594b8 41b922000000 mov r9d, 0x22
1458594be e80d55ffff call 0x14584e9d0
1458594c3 90 nop
1458594c4 488b85e0000000 mov rax, qword ptr [rbp + 0xe0]
1458594cb 488985f8000000 mov qword ptr [rbp + 0xf8], rax
1458594d2 488bb5e8000000 mov rsi, qword ptr [rbp + 0xe8]
1458594d9 4885f6 test rsi, rsi
1458594dc 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458594e0 0f8821080000 js 0x145859d07
1458594e6 741c je 0x145859504
1458594e8 e8138d7afa call 0x140002200
1458594ed ba01000000 mov edx, 1
1458594f2 4889f1 mov rcx, rsi
1458594f5 e8c68c7afa call 0x1400021c0
1458594fa 4885c0 test rax, rax
1458594fd 750a jne 0x145859509
1458594ff e9140a0000 jmp 0x145859f18
145859504 b801000000 mov eax, 1
145859509 48897558 mov qword ptr [rbp + 0x58], rsi
14585950d 488945e0 mov qword ptr [rbp - 0x20], rax
145859511 48894560 mov qword ptr [rbp + 0x60], rax
145859515 31db xor ebx, ebx
145859517 4531f6 xor r14d, r14d
14585951a 48895d68 mov qword ptr [rbp + 0x68], rbx
14585951e 4989f7 mov r15, rsi
145859521 4d29f7 sub r15, r14
145859524 0f8266010000 jb 0x145859690
14585952a 4d89f5 mov r13, r14
14585952d eb0d jmp 0x14585953c
14585952f 90 nop
145859530 4989fd mov r13, rdi
145859533 4839f7 cmp rdi, rsi
145859536 0f8754010000 ja 0x145859690
14585953c 4989f0 mov r8, rsi
14585953f 4d29e8 sub r8, r13
145859542 488b85f8000000 mov rax, qword ptr [rbp + 0xf8]
145859549 4a8d1428 lea rdx, [rax + r13]
14585954d 4983f810 cmp r8, 0x10
145859551 732d jae 0x145859580
145859553 4531e4 xor r12d, r12d
145859556 4d85c0 test r8, r8
145859559 7417 je 0x145859572
14585955b 0f1f440000 nop dword ptr [rax + rax]
145859560 42803c220a cmp byte ptr [rdx + r12], 0xa
145859565 742f je 0x145859596
145859567 49ffc4 inc r12
14585956a 4d39e0 cmp r8, r12
14585956d 75f1 jne 0x145859560
14585956f 4d89c4 mov r12, r8
145859572 31c0 xor eax, eax
145859574 4883f801 cmp rax, 1
145859578 7436 je 0x1458595b0
14585957a e911010000 jmp 0x145859690
14585957f 90 nop
145859580 b10a mov cl, 0xa
145859582 e8f9674900 call 0x145cefd80
145859587 90 nop
145859588 4989d4 mov r12, rdx
14585958b 4883f801 cmp rax, 1
14585958f 741f je 0x1458595b0
145859591 e9fa000000 jmp 0x145859690
145859596 b801000000 mov eax, 1
14585959b 4883f801 cmp rax, 1
14585959f 0f85eb000000 jne 0x145859690
1458595a5 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1458595b0 4b8d3c2c lea rdi, [r12 + r13]
1458595b4 48ffc7 inc rdi
1458595b7 4d01ec add r12, r13
1458595ba 4939f4 cmp r12, rsi
1458595bd 0f836dffffff jae 0x145859530
1458595c3 488b85f8000000 mov rax, qword ptr [rbp + 0xf8]
1458595ca 42803c200a cmp byte ptr [rax + r12], 0xa
1458595cf 0f855bffffff jne 0x145859530
1458595d5 4d89e7 mov r15, r12
1458595d8 4d29f7 sub r15, r14
1458595db 488b4558 mov rax, qword ptr [rbp + 0x58]
1458595df 4829d8 sub rax, rbx
1458595e2 4939c7 cmp r15, rax
1458595e5 7755 ja 0x14585963c
1458595e7 4d39f4 cmp r12, r14
1458595ea 7419 je 0x145859605
1458595ec 4c03b5f8000000 add r14, qword ptr [rbp + 0xf8]
1458595f3 488b4d60 mov rcx, qword ptr [rbp + 0x60]
1458595f7 4801d9 add rcx, rbx
1458595fa 4c89f2 mov rdx, r14
1458595fd 4d89f8 mov r8, r15
145859600 e8f6af4b00 call 0x145d145fb
145859605 4c01fb add rbx, r15
145859608 48895d68 mov qword ptr [rbp + 0x68], rbx
14585960c 488b4558 mov rax, qword ptr [rbp + 0x58]
145859610 4829d8 sub rax, rbx
145859613 4883f801 cmp rax, 1
145859617 764d jbe 0x145859666
145859619 488b4560 mov rax, qword ptr [rbp + 0x60]
14585961d 66c704185c6e mov word ptr [rax + rbx], 0x6e5c
145859623 4883c302 add rbx, 2
145859627 4989fe mov r14, rdi
14585962a 48895d68 mov qword ptr [rbp + 0x68], rbx
14585962e 4989f7 mov r15, rsi
145859631 4d29f7 sub r15, r14
145859634 0f83f0feffff jae 0x14585952a
14585963a eb54 jmp 0x145859690
14585963c 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145859645 41b901000000 mov r9d, 1
14585964b 488d4d58 lea rcx, [rbp + 0x58]
14585964f 4889da mov rdx, rbx
145859652 4d89f8 mov r8, r15
145859655 e8b6b34b00 call 0x145d14a10
14585965a 90 nop
14585965b 488b5d68 mov rbx, qword ptr [rbp + 0x68]
14585965f 4d39f4 cmp r12, r14
145859662 7588 jne 0x1458595ec
145859664 eb9f jmp 0x145859605
145859666 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14585966f 41b802000000 mov r8d, 2
145859675 41b901000000 mov r9d, 1
14585967b 488d4d58 lea rcx, [rbp + 0x58]
14585967f 4889da mov rdx, rbx
145859682 e889b34b00 call 0x145d14a10
145859687 90 nop
145859688 488b5d68 mov rbx, qword ptr [rbp + 0x68]
14585968c eb8b jmp 0x145859619
14585968e 6690 nop
145859690 488b4558 mov rax, qword ptr [rbp + 0x58]
145859694 4829d8 sub rax, rbx
145859697 4939c7 cmp r15, rax
14585969a 0f87a8010000 ja 0x145859848
1458596a0 4c39f6 cmp rsi, r14
1458596a3 7419 je 0x1458596be
1458596a5 4c03b5f8000000 add r14, qword ptr [rbp + 0xf8]
1458596ac 488b4d60 mov rcx, qword ptr [rbp + 0x60]
1458596b0 4801d9 add rcx, rbx
1458596b3 4c89f2 mov rdx, r14
1458596b6 4d89f8 mov r8, r15
1458596b9 e83daf4b00 call 0x145d145fb
1458596be 4c01fb add rbx, r15
1458596c1 0f104558 movups xmm0, xmmword ptr [rbp + 0x58]
1458596c5 0f294530 movaps xmmword ptr [rbp + 0x30], xmm0
1458596c9 48895d40 mov qword ptr [rbp + 0x40], rbx
1458596cd 488b95d8000000 mov rdx, qword ptr [rbp + 0xd8]
1458596d4 4885d2 test rdx, rdx
1458596d7 488db5d8000000 lea rsi, [rbp + 0xd8]
1458596de 7412 je 0x1458596f2
1458596e0 41b801000000 mov r8d, 1
1458596e6 488b8df8000000 mov rcx, qword ptr [rbp + 0xf8]
1458596ed e8de8a7afa call 0x1400021d0
1458596f2 488b5500 mov rdx, qword ptr [rbp]
1458596f6 4885d2 test rdx, rdx
1458596f9 4c8d3dc0897afa lea r15, [rip - 0x5857640]
145859700 488d1dc1874601 lea rbx, [rip + 0x14687c1]
145859707 4c8d7510 lea r14, [rbp + 0x10]
14585970b 7412 je 0x14585971f
14585970d 41b801000000 mov r8d, 1
145859713 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
14585971a e8b18a7afa call 0x1400021d0
14585971f 488b4550 mov rax, qword ptr [rbp + 0x50]
145859723 48894558 mov qword ptr [rbp + 0x58], rax
145859727 4c897d60 mov qword ptr [rbp + 0x60], r15
14585972b 488d45e8 lea rax, [rbp - 0x18]
14585972f 48894568 mov qword ptr [rbp + 0x68], rax
145859733 488d05b6054a00 lea rax, [rip + 0x4a05b6]
14585973a 48894570 mov qword ptr [rbp + 0x70], rax
14585973e 488d4530 lea rax, [rbp + 0x30]
145859742 48894578 mov qword ptr [rbp + 0x78], rax
145859746 488d0593897afa lea rax, [rip - 0x585766d]
14585974d 48898580000000 mov qword ptr [rbp + 0x80], rax
145859754 4889f1 mov rcx, rsi
145859757 488d152c397b01 lea rdx, [rip + 0x17b392c]
14585975e 4c8d4558 lea r8, [rbp + 0x58]
145859762 e8e9db4800 call 0x145ce7350
145859767 90 nop
145859768 488b5530 mov rdx, qword ptr [rbp + 0x30]
14585976c 4885d2 test rdx, rdx
14585976f 740f je 0x145859780
145859771 488b4d38 mov rcx, qword ptr [rbp + 0x38]
145859775 41b801000000 mov r8d, 1
14585977b e8508a7afa call 0x1400021d0
145859780 4c8badd8000000 mov r13, qword ptr [rbp + 0xd8]
145859787 4c8ba5e0000000 mov r12, qword ptr [rbp + 0xe0]
14585978e 488bb5e8000000 mov rsi, qword ptr [rbp + 0xe8]
145859795 488b85b8000000 mov rax, qword ptr [rbp + 0xb8]
14585979c 482b85d0000000 sub rax, qword ptr [rbp + 0xd0]
1458597a3 4839c6 cmp rsi, rax
1458597a6 0f87cd000000 ja 0x145859879
1458597ac 4885f6 test rsi, rsi
1458597af 488bbdd0000000 mov rdi, qword ptr [rbp + 0xd0]
1458597b6 7413 je 0x1458597cb
1458597b8 488b4508 mov rax, qword ptr [rbp + 8]
1458597bc 488d0c38 lea rcx, [rax + rdi]
1458597c0 4c89e2 mov rdx, r12
1458597c3 4989f0 mov r8, rsi
1458597c6 e830ae4b00 call 0x145d145fb
1458597cb 4c89e1 mov rcx, r12
1458597ce 4801f7 add rdi, rsi
1458597d1 4889bdc8000000 mov qword ptr [rbp + 0xc8], rdi
1458597d8 4c8b65d8 mov r12, qword ptr [rbp - 0x28]
1458597dc 4c89e0 mov rax, r12
1458597df 4d85ed test r13, r13
1458597e2 4889fe mov rsi, rdi
1458597e5 488b7db8 mov rdi, qword ptr [rbp - 0x48]
1458597e9 0f847cfaffff je 0x14585926b
1458597ef 41b801000000 mov r8d, 1
1458597f5 4c89ea mov rdx, r13
1458597f8 e8d3897afa call 0x1400021d0
1458597fd 4c89e0 mov rax, r12
145859800 e966faffff jmp 0x14585926b
145859805 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14585980e 41b901000000 mov r9d, 1
145859814 488d4d58 lea rcx, [rbp + 0x58]
145859818 4889da mov rdx, rbx
14585981b 4d89e8 mov r8, r13
14585981e e8edb14b00 call 0x145d14a10
145859823 90 nop
145859824 488b4560 mov rax, qword ptr [rbp + 0x60]
145859828 488985f0000000 mov qword ptr [rbp + 0xf0], rax
14585982f 488b5d68 mov rbx, qword ptr [rbp + 0x68]
145859833 488b85f8000000 mov rax, qword ptr [rbp + 0xf8]
14585983a 4839c6 cmp rsi, rax
14585983d 0f8539fcffff jne 0x14585947c
145859843 e94dfcffff jmp 0x145859495
145859848 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145859851 41b901000000 mov r9d, 1
145859857 488d4d58 lea rcx, [rbp + 0x58]
14585985b 4889da mov rdx, rbx
14585985e 4d89f8 mov r8, r15
145859861 e8aab14b00 call 0x145d14a10
145859866 90 nop
145859867 488b5d68 mov rbx, qword ptr [rbp + 0x68]
14585986b 4c39f6 cmp rsi, r14
14585986e 0f8531feffff jne 0x1458596a5
145859874 e945feffff jmp 0x1458596be
145859879 4c89a5f0000000 mov qword ptr [rbp + 0xf0], r12
145859880 4c89adf8000000 mov qword ptr [rbp + 0xf8], r13
145859887 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145859890 41b901000000 mov r9d, 1
145859896 488d8db8000000 lea rcx, [rbp + 0xb8]
14585989d 488b95d0000000 mov rdx, qword ptr [rbp + 0xd0]
1458598a4 4989f0 mov r8, rsi
1458598a7 e864b14b00 call 0x145d14a10
1458598ac 90 nop
1458598ad 488b85c0000000 mov rax, qword ptr [rbp + 0xc0]
1458598b4 48894508 mov qword ptr [rbp + 8], rax
1458598b8 488bbdc8000000 mov rdi, qword ptr [rbp + 0xc8]
1458598bf 4c8badf8000000 mov r13, qword ptr [rbp + 0xf8]
1458598c6 4c8ba5f0000000 mov r12, qword ptr [rbp + 0xf0]
1458598cd e9e6feffff jmp 0x1458597b8
1458598d2 488b5510 mov rdx, qword ptr [rbp + 0x10]
1458598d6 4885d2 test rdx, rdx
1458598d9 7413 je 0x1458598ee
1458598db 48c1e204 shl rdx, 4
1458598df 41b808000000 mov r8d, 8
1458598e5 488b4dc8 mov rcx, qword ptr [rbp - 0x38]
1458598e9 e8e2887afa call 0x1400021d0
1458598ee 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458598f2 483dc0020000 cmp rax, 0x2c0
1458598f8 0f852bf9ffff jne 0x145859229
1458598fe 31c0 xor eax, eax
145859900 4c8d2579ac4601 lea r12, [rip + 0x146ac79]
145859907 4c8d6d58 lea r13, [rbp + 0x58]
14585990b eb06 jmp 0x145859913
14585990d 0f1f00 nop dword ptr [rax]
145859910 4889f8 mov rax, rdi
145859913 483d10050000 cmp rax, 0x510
145859919 0f84f5030000 je 0x145859d14
14585991f 4889b5d0000000 mov qword ptr [rbp + 0xd0], rsi
145859926 488d0d2b974601 lea rcx, [rip + 0x146972b]
14585992d 488d1401 lea rdx, [rcx + rax]
145859931 488995f8000000 mov qword ptr [rbp + 0xf8], rdx
145859938 488db890000000 lea rdi, [rax + 0x90]
14585993f 488b5c0840 mov rbx, qword ptr [rax + rcx + 0x40]
145859944 4c8b740848 mov r14, qword ptr [rax + rcx + 0x48]
145859949 48899dd8000000 mov qword ptr [rbp + 0xd8], rbx
145859950 4c89b5e0000000 mov qword ptr [rbp + 0xe0], r14
145859957 31f6 xor esi, esi
145859959 eb16 jmp 0x145859971
14585995b 0f1f440000 nop dword ptr [rax + rax]
145859960 4883c678 add rsi, 0x78
145859964 4881fef8340000 cmp rsi, 0x34f8
14585996b 0f8470050000 je 0x145859ee1
145859971 4e39742608 cmp qword ptr [rsi + r12 + 8], r14
145859976 75e8 jne 0x145859960
145859978 4a8b0c26 mov rcx, qword ptr [rsi + r12]
14585997c 4889da mov rdx, rbx
14585997f 4d89f0 mov r8, r14
145859982 e87aac4b00 call 0x145d14601
145859987 85c0 test eax, eax
145859989 75d5 jne 0x145859960
14585998b 48897d28 mov qword ptr [rbp + 0x28], rdi
14585998f 498d0434 lea rax, [r12 + rsi]
145859993 488985d8000000 mov qword ptr [rbp + 0xd8], rax
14585999a 4c89bde0000000 mov qword ptr [rbp + 0xe0], r15
1458599a1 4c89e9 mov rcx, r13
1458599a4 488d15d5b44501 lea rdx, [rip + 0x145b4d5]
1458599ab 4c8d85d8000000 lea r8, [rbp + 0xd8]
1458599b2 e899d94800 call 0x145ce7350
1458599b7 90 nop
1458599b8 488b4d60 mov rcx, qword ptr [rbp + 0x60]
1458599bc 488b5568 mov rdx, qword ptr [rbp + 0x68]
1458599c0 4a8b7c2610 mov rdi, qword ptr [rsi + r12 + 0x10]
1458599c5 4e8b742618 mov r14, qword ptr [rsi + r12 + 0x18]
1458599ca 48898df0000000 mov qword ptr [rbp + 0xf0], rcx
1458599d1 e8ba650800 call 0x1458dff90
1458599d6 90 nop
1458599d7 4889c3 mov rbx, rax
1458599da 4889d6 mov rsi, rdx
1458599dd 488b5558 mov rdx, qword ptr [rbp + 0x58]
1458599e1 4885d2 test rdx, rdx
1458599e4 7412 je 0x1458599f8
1458599e6 41b801000000 mov r8d, 1
1458599ec 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
1458599f3 e8d8877afa call 0x1400021d0
1458599f8 4885db test rbx, rbx
1458599fb 480f45fb cmovne rdi, rbx
1458599ff 490f44f6 cmove rsi, r14
145859a03 48897da8 mov qword ptr [rbp - 0x58], rdi
145859a07 488975b0 mov qword ptr [rbp - 0x50], rsi
145859a0b ba51000000 mov edx, 0x51
145859a10 488d0d90367b01 lea rcx, [rip + 0x17b3690]
145859a17 e874650800 call 0x1458dff90
145859a1c 90 nop
145859a1d 4989c6 mov r14, rax
145859a20 4889d3 mov rbx, rdx
145859a23 488b85f8000000 mov rax, qword ptr [rbp + 0xf8]
145859a2a 4883c010 add rax, 0x10
145859a2e 488985d8000000 mov qword ptr [rbp + 0xd8], rax
145859a35 4c89bde0000000 mov qword ptr [rbp + 0xe0], r15
145859a3c 4c89e9 mov rcx, r13
145859a3f 488d15ebb34501 lea rdx, [rip + 0x145b3eb]
145859a46 4c8d85d8000000 lea r8, [rbp + 0xd8]
145859a4d e8fed84800 call 0x145ce7350
145859a52 90 nop
145859a53 488b4d60 mov rcx, qword ptr [rbp + 0x60]
145859a57 488b5568 mov rdx, qword ptr [rbp + 0x68]
145859a5b 488b85f8000000 mov rax, qword ptr [rbp + 0xf8]
145859a62 488b7870 mov rdi, qword ptr [rax + 0x70]
145859a66 4c8b7878 mov r15, qword ptr [rax + 0x78]
145859a6a 48898df0000000 mov qword ptr [rbp + 0xf0], rcx
145859a71 e81a650800 call 0x1458dff90
145859a76 90 nop
145859a77 4889c6 mov rsi, rax
145859a7a 4989d5 mov r13, rdx
145859a7d 488b5558 mov rdx, qword ptr [rbp + 0x58]
145859a81 4885d2 test rdx, rdx
145859a84 7412 je 0x145859a98
145859a86 41b801000000 mov r8d, 1
145859a8c 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
145859a93 e838877afa call 0x1400021d0
145859a98 4d85f6 test r14, r14
145859a9b b851000000 mov eax, 0x51
145859aa0 480f44d8 cmove rbx, rax
145859aa4 488d05fc357b01 lea rax, [rip + 0x17b35fc]
145859aab 4c0f44f0 cmove r14, rax
145859aaf 4885f6 test rsi, rsi
145859ab2 480f45fe cmovne rdi, rsi
145859ab6 4d0f44ef cmove r13, r15
145859aba 4889bdd8000000 mov qword ptr [rbp + 0xd8], rdi
145859ac1 4c89ade0000000 mov qword ptr [rbp + 0xe0], r13
145859ac8 488b85f8000000 mov rax, qword ptr [rbp + 0xf8]
145859acf 488d8080000000 lea rax, [rax + 0x80]
145859ad6 488d0d1b367b01 lea rcx, [rip + 0x17b361b]
145859add 48894d58 mov qword ptr [rbp + 0x58], rcx
145859ae1 48c7456005000000 mov qword ptr [rbp + 0x60], 5
145859ae9 488d8dd8000000 lea rcx, [rbp + 0xd8]
145859af0 48894d68 mov qword ptr [rbp + 0x68], rcx
145859af4 488d0df5307b01 lea rcx, [rip + 0x17b30f5]
145859afb 48894d70 mov qword ptr [rbp + 0x70], rcx
145859aff 488d15f7357b01 lea rdx, [rip + 0x17b35f7]
145859b06 48895578 mov qword ptr [rbp + 0x78], rdx
145859b0a 48c7858000000005000000 mov qword ptr [rbp + 0x80], 5
145859b15 488d55a8 lea rdx, [rbp - 0x58]
145859b19 48899588000000 mov qword ptr [rbp + 0x88], rdx
145859b20 48898d90000000 mov qword ptr [rbp + 0x90], rcx
145859b27 488d0dfa357b01 lea rcx, [rip + 0x17b35fa]
145859b2e 48898d98000000 mov qword ptr [rbp + 0x98], rcx
145859b35 48c785a000000002000000 mov qword ptr [rbp + 0xa0], 2
145859b40 488985a8000000 mov qword ptr [rbp + 0xa8], rax
145859b47 488d05ba357b01 lea rax, [rip + 0x17b35ba]
145859b4e 488985b0000000 mov qword ptr [rbp + 0xb0], rax
145859b55 48c744242003000000 mov qword ptr [rsp + 0x20], 3
145859b5e 488d4d10 lea rcx, [rbp + 0x10]
145859b62 4c89f2 mov rdx, r14
145859b65 4989d8 mov r8, rbx
145859b68 4c8d6d58 lea r13, [rbp + 0x58]
145859b6c 4d89e9 mov r9, r13
145859b6f e8fc670800 call 0x1458e0370
145859b74 90 nop
145859b75 4c8d3d44857afa lea r15, [rip - 0x5857abc]
145859b7c 488b85f8000000 mov rax, qword ptr [rbp + 0xf8]
145859b83 0fb6908c000000 movzx edx, byte ptr [rax + 0x8c]
145859b8a feca dec dl
145859b8c b905000000 mov ecx, 5
145859b91 488d05c2357b01 lea rax, [rip + 0x17b35c2]
145859b98 80fa08 cmp dl, 8
145859b9b 771c ja 0x145859bb9
145859b9d 0fb6ca movzx ecx, dl
145859ba0 488d15c1217d01 lea rdx, [rip + 0x17d21c1]
145859ba7 4863048a movsxd rax, dword ptr [rdx + rcx*4]
145859bab 4801d0 add rax, rdx
145859bae 488d15db217d01 lea rdx, [rip + 0x17d21db]
145859bb5 488b0cca mov rcx, qword ptr [rdx + rcx*8]
145859bb9 488945e8 mov qword ptr [rbp - 0x18], rax
145859bbd 48894df0 mov qword ptr [rbp - 0x10], rcx
145859bc1 488b5518 mov rdx, qword ptr [rbp + 0x18]
145859bc5 4c8b4520 mov r8, qword ptr [rbp + 0x20]
145859bc9 488db5d8000000 lea rsi, [rbp + 0xd8]
145859bd0 4889f1 mov rcx, rsi
145859bd3 488995f0000000 mov qword ptr [rbp + 0xf0], rdx
145859bda e8a1eaffff call 0x145858680
145859bdf 90 nop
145859be0 488d45e8 lea rax, [rbp - 0x18]
145859be4 48894558 mov qword ptr [rbp + 0x58], rax
145859be8 4c897d60 mov qword ptr [rbp + 0x60], r15
145859bec 48897568 mov qword ptr [rbp + 0x68], rsi
145859bf0 488d05e9847afa lea rax, [rip - 0x5857b17]
145859bf7 48894570 mov qword ptr [rbp + 0x70], rax
145859bfb 488d4d30 lea rcx, [rbp + 0x30]
145859bff 488d1559357b01 lea rdx, [rip + 0x17b3559]
145859c06 4d89e8 mov r8, r13
145859c09 e842d74800 call 0x145ce7350
145859c0e 90 nop
145859c0f 488bb5d0000000 mov rsi, qword ptr [rbp + 0xd0]
145859c16 488b95d8000000 mov rdx, qword ptr [rbp + 0xd8]
145859c1d 4885d2 test rdx, rdx
145859c20 488b7d28 mov rdi, qword ptr [rbp + 0x28]
145859c24 7412 je 0x145859c38
145859c26 488b8de0000000 mov rcx, qword ptr [rbp + 0xe0]
145859c2d 41b801000000 mov r8d, 1
145859c33 e898857afa call 0x1400021d0
145859c38 4c8b7530 mov r14, qword ptr [rbp + 0x30]
145859c3c 488b4538 mov rax, qword ptr [rbp + 0x38]
145859c40 488985f8000000 mov qword ptr [rbp + 0xf8], rax
145859c47 488b5d40 mov rbx, qword ptr [rbp + 0x40]
145859c4b 488b85b8000000 mov rax, qword ptr [rbp + 0xb8]
145859c52 4829f0 sub rax, rsi
145859c55 4839c3 cmp rbx, rax
145859c58 7766 ja 0x145859cc0
145859c5a 4885db test rbx, rbx
145859c5d 7419 je 0x145859c78
145859c5f 488b8dc0000000 mov rcx, qword ptr [rbp + 0xc0]
145859c66 4801f1 add rcx, rsi
145859c69 488b95f8000000 mov rdx, qword ptr [rbp + 0xf8]
145859c70 4989d8 mov r8, rbx
145859c73 e883a94b00 call 0x145d145fb
145859c78 4801de add rsi, rbx
145859c7b 4889b5c8000000 mov qword ptr [rbp + 0xc8], rsi
145859c82 4d85f6 test r14, r14
145859c85 7415 je 0x145859c9c
145859c87 41b801000000 mov r8d, 1
145859c8d 488b8df8000000 mov rcx, qword ptr [rbp + 0xf8]
145859c94 4c89f2 mov rdx, r14
145859c97 e834857afa call 0x1400021d0
145859c9c 488b5510 mov rdx, qword ptr [rbp + 0x10]
145859ca0 4885d2 test rdx, rdx
145859ca3 0f8467fcffff je 0x145859910
145859ca9 41b801000000 mov r8d, 1
145859caf 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
145859cb6 e815857afa call 0x1400021d0
145859cbb e950fcffff jmp 0x145859910
145859cc0 4c897550 mov qword ptr [rbp + 0x50], r14
145859cc4 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145859ccd 41b901000000 mov r9d, 1
145859cd3 488d8db8000000 lea rcx, [rbp + 0xb8]
145859cda 4889f2 mov rdx, rsi
145859cdd 4989d8 mov r8, rbx
145859ce0 e82bad4b00 call 0x145d14a10
145859ce5 90 nop
145859ce6 488bb5c8000000 mov rsi, qword ptr [rbp + 0xc8]
145859ced 4c8b7550 mov r14, qword ptr [rbp + 0x50]
145859cf1 e969ffffff jmp 0x145859c5f
145859cf6 31c9 xor ecx, ecx
145859cf8 488b55f8 mov rdx, qword ptr [rbp - 8]
145859cfc e8cad26500 call 0x145eb6fcb
145859d01 90 nop
145859d02 e901020000 jmp 0x145859f08
145859d07 31c9 xor ecx, ecx
145859d09 e8bdd26500 call 0x145eb6fcb
145859d0e 90 nop
145859d0f e9f4010000 jmp 0x145859f08
145859d14 31ff xor edi, edi
145859d16 4c8d25eb347b01 lea r12, [rip + 0x17b34eb]
145859d1d 4c8d7530 lea r14, [rbp + 0x30]
145859d21 4c8d7d58 lea r15, [rbp + 0x58]
145859d25 eb0d jmp 0x145859d34
145859d27 660f1f840000000000 nop word ptr [rax + rax]
145859d30 4883c720 add rdi, 0x20
145859d34 4881ffa0000000 cmp rdi, 0xa0
145859d3b 0f8442010000 je 0x145859e83
145859d41 4889f3 mov rbx, rsi
145859d44 498d043c lea rax, [r12 + rdi]
145859d48 48894510 mov qword ptr [rbp + 0x10], rax
145859d4c 4a8b742710 mov rsi, qword ptr [rdi + r12 + 0x10]
145859d51 4e8b6c2718 mov r13, qword ptr [rdi + r12 + 0x18]
145859d56 4889f1 mov rcx, rsi
145859d59 4c89ea mov rdx, r13
145859d5c e82f620800 call 0x1458dff90
145859d61 90 nop
145859d62 4989d0 mov r8, rdx
145859d65 4885c0 test rax, rax
145859d68 480f45f0 cmovne rsi, rax
145859d6c 4d0f44c5 cmove r8, r13
145859d70 488d8dd8000000 lea rcx, [rbp + 0xd8]
145859d77 4889f2 mov rdx, rsi
145859d7a e801e9ffff call 0x145858680
145859d7f 90 nop
145859d80 488d4510 lea rax, [rbp + 0x10]
145859d84 48894558 mov qword ptr [rbp + 0x58], rax
145859d88 488d05117443fb lea rax, [rip - 0x4bc8bef]
145859d8f 48894560 mov qword ptr [rbp + 0x60], rax
145859d93 488d85d8000000 lea rax, [rbp + 0xd8]
145859d9a 48894568 mov qword ptr [rbp + 0x68], rax
145859d9e 488d053b837afa lea rax, [rip - 0x5857cc5]
145859da5 48894570 mov qword ptr [rbp + 0x70], rax
145859da9 4c89f1 mov rcx, r14
145859dac 488d15f5347b01 lea rdx, [rip + 0x17b34f5]
145859db3 4d89f8 mov r8, r15
145859db6 e895d54800 call 0x145ce7350
145859dbb 90 nop
145859dbc 488b95d8000000 mov rdx, qword ptr [rbp + 0xd8]
145859dc3 4885d2 test rdx, rdx
145859dc6 4889de mov rsi, rbx
145859dc9 7412 je 0x145859ddd
145859dcb 488b8de0000000 mov rcx, qword ptr [rbp + 0xe0]
145859dd2 41b801000000 mov r8d, 1
145859dd8 e8f3837afa call 0x1400021d0
145859ddd 488b5d30 mov rbx, qword ptr [rbp + 0x30]
145859de1 488b4538 mov rax, qword ptr [rbp + 0x38]
145859de5 488985f8000000 mov qword ptr [rbp + 0xf8], rax
145859dec 4c8b6d40 mov r13, qword ptr [rbp + 0x40]
145859df0 488b85b8000000 mov rax, qword ptr [rbp + 0xb8]
145859df7 4829f0 sub rax, rsi
145859dfa 4939c5 cmp r13, rax
145859dfd 774b ja 0x145859e4a
145859dff 4d85ed test r13, r13
145859e02 7419 je 0x145859e1d
145859e04 488b8dc0000000 mov rcx, qword ptr [rbp + 0xc0]
145859e0b 4801f1 add rcx, rsi
145859e0e 488b95f8000000 mov rdx, qword ptr [rbp + 0xf8]
145859e15 4d89e8 mov r8, r13
145859e18 e8dea74b00 call 0x145d145fb
145859e1d 4c01ee add rsi, r13
145859e20 4889b5c8000000 mov qword ptr [rbp + 0xc8], rsi
145859e27 4885db test rbx, rbx
145859e2a 0f8400ffffff je 0x145859d30
145859e30 41b801000000 mov r8d, 1
145859e36 488b8df8000000 mov rcx, qword ptr [rbp + 0xf8]
145859e3d 4889da mov rdx, rbx
145859e40 e88b837afa call 0x1400021d0
145859e45 e9e6feffff jmp 0x145859d30
145859e4a 48899dd0000000 mov qword ptr [rbp + 0xd0], rbx
145859e51 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145859e5a 41b901000000 mov r9d, 1
145859e60 488d8db8000000 lea rcx, [rbp + 0xb8]
145859e67 4889f2 mov rdx, rsi
145859e6a 4d89e8 mov r8, r13
145859e6d e89eab4b00 call 0x145d14a10
145859e72 90 nop
145859e73 488bb5c8000000 mov rsi, qword ptr [rbp + 0xc8]
145859e7a 488b9dd0000000 mov rbx, qword ptr [rbp + 0xd0]
145859e81 eb81 jmp 0x145859e04
145859e83 488b8dc8000000 mov rcx, qword ptr [rbp + 0xc8]
145859e8a 488b45d0 mov rax, qword ptr [rbp - 0x30]
145859e8e 48894810 mov qword ptr [rax + 0x10], rcx
145859e92 0f1085b8000000 movups xmm0, xmmword ptr [rbp + 0xb8]
145859e99 0f1100 movups xmmword ptr [rax], xmm0
145859e9c 4881c488010000 add rsp, 0x188
145859ea3 5b pop rbx
145859ea4 5f pop rdi
145859ea5 5e pop rsi
145859ea6 415c pop r12
145859ea8 415d pop r13
145859eaa 415e pop r14
145859eac 415f pop r15
145859eae 5d pop rbp
145859eaf c3 ret
145859eb0 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145859eb9 488d8db8000000 lea rcx, [rbp + 0xb8]
145859ec0 41b816000000 mov r8d, 0x16
145859ec6 41b901000000 mov r9d, 1
145859ecc 4889f2 mov rdx, rsi
145859ecf e83cab4b00 call 0x145d14a10
145859ed4 90 nop
145859ed5 488bb5c8000000 mov rsi, qword ptr [rbp + 0xc8]
145859edc e9f8f2ffff jmp 0x1458591d9
145859ee1 488d85d8000000 lea rax, [rbp + 0xd8]
145859ee8 48894558 mov qword ptr [rbp + 0x58], rax
145859eec 4c897d60 mov qword ptr [rbp + 0x60], r15
145859ef0 488d0d71984601 lea rcx, [rip + 0x1469871]
145859ef7 4c8d057a984601 lea r8, [rip + 0x146987a]
145859efe 488d5558 lea rdx, [rbp + 0x58]
145859f02 e839d66500 call 0x145eb7540
145859f07 90 nop
145859f08 0f0b ud2
145859f0a 488975f8 mov qword ptr [rbp - 8], rsi
145859f0e b901000000 mov ecx, 1
145859f13 e9e0fdffff jmp 0x145859cf8
145859f18 4889f2 mov rdx, rsi
145859f1b b901000000 mov ecx, 1
145859f20 e9e4fdffff jmp 0x145859d09
# glue-strings [0x14585a400,0x14585a51b)
14585a400 55 push rbp
14585a401 4881ecb0000000 sub rsp, 0xb0
14585a408 488dac2480000000 lea rbp, [rsp + 0x80]
14585a410 48c74528feffffff mov qword ptr [rbp + 0x28], 0xfffffffffffffffe
14585a418 488d15952e7b01 lea rdx, [rip + 0x17b2e95]
14585a41f 488d4dc0 lea rcx, [rbp - 0x40]
14585a423 41b821000000 mov r8d, 0x21
14585a429 e8e2aafbff call 0x145814f10
14585a42e 837dc001 cmp dword ptr [rbp - 0x40], 1
14585a432 7553 jne 0x14585a487
14585a434 488d45c8 lea rax, [rbp - 0x38]
14585a438 488b4810 mov rcx, qword ptr [rax + 0x10]
14585a43c 48894d20 mov qword ptr [rbp + 0x20], rcx
14585a440 0f1000 movups xmm0, xmmword ptr [rax]
14585a443 0f294510 movaps xmmword ptr [rbp + 0x10], xmm0
14585a447 488d4510 lea rax, [rbp + 0x10]
14585a44b 488945e0 mov qword ptr [rbp - 0x20], rax
14585a44f 488d058a7c7afa lea rax, [rip - 0x5858376]
14585a456 488945e8 mov qword ptr [rbp - 0x18], rax
14585a45a 488d0d742e7b01 lea rcx, [rip + 0x17b2e74]
14585a461 488d55e0 lea rdx, [rbp - 0x20]
14585a465 e8a6634700 call 0x145cd0810
14585a46a 90 nop
14585a46b 488b5510 mov rdx, qword ptr [rbp + 0x10]
14585a46f 4885d2 test rdx, rdx
14585a472 0f849a000000 je 0x14585a512
14585a478 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14585a47c 41b801000000 mov r8d, 1
14585a482 e985000000 jmp 0x14585a50c
14585a487 488b45c8 mov rax, qword ptr [rbp - 0x38]
14585a48b 48894508 mov qword ptr [rbp + 8], rax
14585a48f 488b55d0 mov rdx, qword ptr [rbp - 0x30]
14585a493 4c8b45d8 mov r8, qword ptr [rbp - 0x28]
14585a497 488d4d10 lea rcx, [rbp + 0x10]
14585a49b 488955f8 mov qword ptr [rbp - 8], rdx
14585a49f e8aca84800 call 0x145ce4d50
14585a4a4 90 nop
14585a4a5 488b5518 mov rdx, qword ptr [rbp + 0x18]
14585a4a9 4c8b4520 mov r8, qword ptr [rbp + 0x20]
14585a4ad 488d4de0 lea rcx, [rbp - 0x20]
14585a4b1 48895500 mov qword ptr [rbp], rdx
14585a4b5 e886ecffff call 0x145859140
14585a4ba 90 nop
14585a4bb 488b5510 mov rdx, qword ptr [rbp + 0x10]
14585a4bf 4885d2 test rdx, rdx
14585a4c2 7e0f jle 0x14585a4d3
14585a4c4 41b801000000 mov r8d, 1
14585a4ca 488b4d00 mov rcx, qword ptr [rbp]
14585a4ce e8fd7c7afa call 0x1400021d0
14585a4d3 0f1045e0 movups xmm0, xmmword ptr [rbp - 0x20]
14585a4d7 0f2945a0 movaps xmmword ptr [rbp - 0x60], xmm0
14585a4db 488b45f0 mov rax, qword ptr [rbp - 0x10]
14585a4df 488945b0 mov qword ptr [rbp - 0x50], rax
14585a4e3 488d0dca2d7b01 lea rcx, [rip + 0x17b2dca]
14585a4ea 4c8d45a0 lea r8, [rbp - 0x60]
14585a4ee ba21000000 mov edx, 0x21
14585a4f3 e878ab3700 call 0x145bd5070
14585a4f8 90 nop
14585a4f9 488b5508 mov rdx, qword ptr [rbp + 8]
14585a4fd 4885d2 test rdx, rdx
14585a500 7410 je 0x14585a512
14585a502 41b801000000 mov r8d, 1
14585a508 488b4df8 mov rcx, qword ptr [rbp - 8]
14585a50c e8bf7c7afa call 0x1400021d0
14585a511 90 nop
14585a512 4881c4b0000000 add rsp, 0xb0
14585a519 5d pop rbp
14585a51a c3 ret
# glue-race-lookup [0x1459d5a90,0x1459d5b5a)
1459d5a90 55 push rbp
1459d5a91 4156 push r14
1459d5a93 56 push rsi
1459d5a94 57 push rdi
1459d5a95 53 push rbx
1459d5a96 4883ec60 sub rsp, 0x60
1459d5a9a 488d6c2460 lea rbp, [rsp + 0x60]
1459d5a9f 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
1459d5aa7 4889ce mov rsi, rcx
1459d5aaa 488b02 mov rax, qword ptr [rdx]
1459d5aad 488b4a08 mov rcx, qword ptr [rdx + 8]
1459d5ab1 4889cf mov rdi, rcx
1459d5ab4 4829c7 sub rdi, rax
1459d5ab7 49b8f8ffffffffffff7f movabs r8, 0x7ffffffffffffff8
1459d5ac1 4c39c7 cmp rdi, r8
1459d5ac4 760f jbe 0x1459d5ad5
1459d5ac6 31db xor ebx, ebx
1459d5ac8 4889d9 mov rcx, rbx
1459d5acb 4889fa mov rdx, rdi
1459d5ace e8f8144e00 call 0x145eb6fcb
1459d5ad3 0f0b ud2
1459d5ad5 4839c1 cmp rcx, rax
1459d5ad8 7428 je 0x1459d5b02
1459d5ada 4989d6 mov r14, rdx
1459d5add e81ec762fa call 0x140002200
1459d5ae2 bb08000000 mov ebx, 8
1459d5ae7 ba08000000 mov edx, 8
1459d5aec 4889f9 mov rcx, rdi
1459d5aef e8ccc662fa call 0x1400021c0
1459d5af4 4885c0 test rax, rax
1459d5af7 74cf je 0x1459d5ac8
1459d5af9 48c1ef04 shr rdi, 4
1459d5afd 4c89f2 mov rdx, r14
1459d5b00 eb07 jmp 0x1459d5b09
1459d5b02 b808000000 mov eax, 8
1459d5b07 31ff xor edi, edi
1459d5b09 48897de0 mov qword ptr [rbp - 0x20], rdi
1459d5b0d 488945e8 mov qword ptr [rbp - 0x18], rax
1459d5b11 488d4df0 lea rcx, [rbp - 0x10]
1459d5b15 48c745f000000000 mov qword ptr [rbp - 0x10], 0
1459d5b1d 488945d8 mov qword ptr [rbp - 0x28], rax
1459d5b21 48894dc8 mov qword ptr [rbp - 0x38], rcx
1459d5b25 48c745d000000000 mov qword ptr [rbp - 0x30], 0
1459d5b2d 488d45c8 lea rax, [rbp - 0x38]
1459d5b31 4889d1 mov rcx, rdx
1459d5b34 4889c2 mov rdx, rax
1459d5b37 e8e4860000 call 0x1459de220
1459d5b3c 90 nop
1459d5b3d 488b45f0 mov rax, qword ptr [rbp - 0x10]
1459d5b41 48894610 mov qword ptr [rsi + 0x10], rax
1459d5b45 0f1045e0 movups xmm0, xmmword ptr [rbp - 0x20]
1459d5b49 0f1106 movups xmmword ptr [rsi], xmm0
1459d5b4c 4889f0 mov rax, rsi
1459d5b4f 4883c460 add rsp, 0x60
1459d5b53 5b pop rbx
1459d5b54 5f pop rdi
1459d5b55 5e pop rsi
1459d5b56 415e pop r14
1459d5b58 5d pop rbp
1459d5b59 c3 ret
# glue-race-collect [0x1459de220,0x1459de3fc)
1459de220 55 push rbp
1459de221 4157 push r15
1459de223 4156 push r14
1459de225 4155 push r13
1459de227 4154 push r12
1459de229 56 push rsi
1459de22a 57 push rdi
1459de22b 53 push rbx
1459de22c 4881ec18010000 sub rsp, 0x118
1459de233 488dac2480000000 lea rbp, [rsp + 0x80]
1459de23b 48c78590000000feffffff mov qword ptr [rbp + 0x90], 0xfffffffffffffffe
1459de246 488b02 mov rax, qword ptr [rdx]
1459de249 48898580000000 mov qword ptr [rbp + 0x80], rax
1459de250 4c8b4208 mov r8, qword ptr [rdx + 8]
1459de254 4c8b09 mov r9, qword ptr [rcx]
1459de257 488b4108 mov rax, qword ptr [rcx + 8]
1459de25b 4939c1 cmp r9, rax
1459de25e 0f847a010000 je 0x1459de3de
1459de264 4c8b5118 mov r10, qword ptr [rcx + 0x18]
1459de268 4c895550 mov qword ptr [rbp + 0x50], r10
1459de26c 488b5210 mov rdx, qword ptr [rdx + 0x10]
1459de270 48895568 mov qword ptr [rbp + 0x68], rdx
1459de274 488b4910 mov rcx, qword ptr [rcx + 0x10]
1459de278 4c29c8 sub rax, r9
1459de27b 48c1e804 shr rax, 4
1459de27f 4531ff xor r15d, r15d
1459de282 488d7518 lea rsi, [rbp + 0x18]
1459de286 4c8d75b0 lea r14, [rbp - 0x50]
1459de28a 4c894d58 mov qword ptr [rbp + 0x58], r9
1459de28e 48894560 mov qword ptr [rbp + 0x60], rax
1459de292 eb54 jmp 0x1459de2e8
1459de294 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459de2a0 488b4578 mov rax, qword ptr [rbp + 0x78]
1459de2a4 4901c4 add r12, rax
1459de2a7 4929c5 sub r13, rax
1459de2aa 4885db test rbx, rbx
1459de2ad 4c0f45e3 cmovne r12, rbx
1459de2b1 490f44fd cmove rdi, r13
1459de2b5 4c8b4570 mov r8, qword ptr [rbp + 0x70]
1459de2b9 4c89c0 mov rax, r8
1459de2bc 48c1e004 shl rax, 4
1459de2c0 488b4d68 mov rcx, qword ptr [rbp + 0x68]
1459de2c4 4c892401 mov qword ptr [rcx + rax], r12
1459de2c8 48897c0108 mov qword ptr [rcx + rax + 8], rdi
1459de2cd 49ffc0 inc r8
1459de2d0 49ffc7 inc r15
1459de2d3 488b4560 mov rax, qword ptr [rbp + 0x60]
1459de2d7 4939c7 cmp r15, rax
1459de2da 4c8b4d58 mov r9, qword ptr [rbp + 0x58]
1459de2de 488b4d48 mov rcx, qword ptr [rbp + 0x48]
1459de2e2 0f84f6000000 je 0x1459de3de
1459de2e8 4c894570 mov qword ptr [rbp + 0x70], r8
1459de2ec 4c89f8 mov rax, r15
1459de2ef 48c1e004 shl rax, 4
1459de2f3 4d8b2401 mov r12, qword ptr [r9 + rax]
1459de2f7 4d8b6c0108 mov r13, qword ptr [r9 + rax + 8]
1459de2fc 48ffc1 inc rcx
1459de2ff 48894d48 mov qword ptr [rbp + 0x48], rcx
1459de303 48894d18 mov qword ptr [rbp + 0x18], rcx
1459de307 488b4550 mov rax, qword ptr [rbp + 0x50]
1459de30b 488945b0 mov qword ptr [rbp - 0x50], rax
1459de30f 488d05ca3d62fa lea rax, [rip - 0x59dc236]
1459de316 488945b8 mov qword ptr [rbp - 0x48], rax
1459de31a 488975c0 mov qword ptr [rbp - 0x40], rsi
1459de31e 488d05cbb93100 lea rax, [rip + 0x31b9cb]
1459de325 488945c8 mov qword ptr [rbp - 0x38], rax
1459de329 488d4d30 lea rcx, [rbp + 0x30]
1459de32d 488d156fcf9501 lea rdx, [rip + 0x195cf6f]
1459de334 4d89f0 mov r8, r14
1459de337 e814903000 call 0x145ce7350
1459de33c 90 nop
1459de33d 488b4538 mov rax, qword ptr [rbp + 0x38]
1459de341 48898588000000 mov qword ptr [rbp + 0x88], rax
1459de348 488b7d40 mov rdi, qword ptr [rbp + 0x40]
1459de34c 48c744242002000000 mov qword ptr [rsp + 0x20], 2
1459de355 4c89f1 mov rcx, r14
1459de358 4c89e2 mov rdx, r12
1459de35b 4d89e8 mov r8, r13
1459de35e 4c8d0d4dcf9501 lea r9, [rip + 0x195cf4d]
1459de365 e886013100 call 0x145cee4f0
1459de36a 90 nop
1459de36b 0f1f440000 nop dword ptr [rax + rax]
1459de370 4889f1 mov rcx, rsi
1459de373 4c89f2 mov rdx, r14
1459de376 e8b5fbe6ff call 0x14584df30
1459de37b 90 nop
1459de37c 488b4518 mov rax, qword ptr [rbp + 0x18]
1459de380 4885c0 test rax, rax
1459de383 74eb je 0x1459de370
1459de385 83f801 cmp eax, 1
1459de388 7516 jne 0x1459de3a0
1459de38a 488b4520 mov rax, qword ptr [rbp + 0x20]
1459de38e 48894578 mov qword ptr [rbp + 0x78], rax
1459de392 eb10 jmp 0x1459de3a4
1459de394 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459de3a0 4c896d78 mov qword ptr [rbp + 0x78], r13
1459de3a4 488b8d88000000 mov rcx, qword ptr [rbp + 0x88]
1459de3ab 4889fa mov rdx, rdi
1459de3ae e8dd1bf0ff call 0x1458dff90
1459de3b3 90 nop
1459de3b4 4889c3 mov rbx, rax
1459de3b7 4889d7 mov rdi, rdx
1459de3ba 488b5530 mov rdx, qword ptr [rbp + 0x30]
1459de3be 4885d2 test rdx, rdx
1459de3c1 0f84d9feffff je 0x1459de2a0
1459de3c7 41b801000000 mov r8d, 1
1459de3cd 488b8d88000000 mov rcx, qword ptr [rbp + 0x88]
1459de3d4 e8f73d62fa call 0x1400021d0
1459de3d9 e9c2feffff jmp 0x1459de2a0
1459de3de 488b8580000000 mov rax, qword ptr [rbp + 0x80]
1459de3e5 4c8900 mov qword ptr [rax], r8
1459de3e8 4881c418010000 add rsp, 0x118
1459de3ef 5b pop rbx
1459de3f0 5f pop rdi
1459de3f1 5e pop rsi
1459de3f2 415c pop r12
1459de3f4 415d pop r13
1459de3f6 415e pop r14
1459de3f8 415f pop r15
1459de3fa 5d pop rbp
1459de3fb c3 ret
