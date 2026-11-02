; Supplied0.92.0 SHA-256 47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1408fd770: 41 57                       	pushq	%r15
1408fd772: 41 56                       	pushq	%r14
1408fd774: 41 54                       	pushq	%r12
1408fd776: 56                          	pushq	%rsi
1408fd777: 57                          	pushq	%rdi
1408fd778: 55                          	pushq	%rbp
1408fd779: 53                          	pushq	%rbx
1408fd77a: 48 83 ec 50                 	subq	$0x50, %rsp
1408fd77e: 66 44 0f 7f 44 24 40        	movdqa	%xmm8, 0x40(%rsp)
1408fd785: 66 0f 7f 7c 24 30           	movdqa	%xmm7, 0x30(%rsp)
1408fd78b: 66 0f 7f 74 24 20           	movdqa	%xmm6, 0x20(%rsp)
1408fd791: 48 8b 7a 08                 	movq	0x8(%rdx), %rdi
1408fd795: 4d 8b 38                    	movq	(%r8), %r15
1408fd798: 4d 8b 60 10                 	movq	0x10(%r8), %r12
1408fd79c: 41 8b 68 1c                 	movl	0x1c(%r8), %ebp
1408fd7a0: 48 8b 4f 38                 	movq	0x38(%rdi), %rcx
1408fd7a4: 48 8b 57 40                 	movq	0x40(%rdi), %rdx
1408fd7a8: e8 23 d8 80 ff              	callq	0x14010afd0 <.text+0x109fd0>
1408fd7ad: 48 89 c1                    	movq	%rax, %rcx
1408fd7b0: e8 3b b4 dd 04              	callq	0x1456d8bf0 <.text+0x56d7bf0>
1408fd7b5: 66 0f ef f6                 	pxor	%xmm6, %xmm6
1408fd7b9: a8 01                       	testb	$0x1, %al
1408fd7bb: 75 08                       	jne	0x1408fd7c5 <.text+0x8fc7c5>
1408fd7bd: 48 c1 e8 20                 	shrq	$0x20, %rax
1408fd7c1: 66 0f 6e f0                 	movd	%eax, %xmm6
1408fd7c5: 48 8b 77 10                 	movq	0x10(%rdi), %rsi
1408fd7c9: 48 85 f6                    	testq	%rsi, %rsi
1408fd7cc: 79 10                       	jns	0x1408fd7de <.text+0x8fc7de>
1408fd7ce: 45 31 f6                    	xorl	%r14d, %r14d
1408fd7d1: 4c 89 f1                    	movq	%r14, %rcx
1408fd7d4: 48 89 f2                    	movq	%rsi, %rdx
1408fd7d7: e8 af 63 fa 04              	callq	0x1458a3b8b <.text+0x58a2b8b>
1408fd7dc: 0f 0b                       	ud2
1408fd7de: 74 3f                       	je	0x1408fd81f <.text+0x8fc81f>
1408fd7e0: 48 8b 5f 08                 	movq	0x8(%rdi), %rbx
1408fd7e4: e8 17 4a 70 ff              	callq	0x140002200 <.text+0x1200>
1408fd7e9: 41 be 01 00 00 00           	movl	$0x1, %r14d
1408fd7ef: ba 01 00 00 00              	movl	$0x1, %edx
1408fd7f4: 48 89 f1                    	movq	%rsi, %rcx
1408fd7f7: e8 c4 49 70 ff              	callq	0x1400021c0 <.text+0x11c0>
1408fd7fc: 48 85 c0                    	testq	%rax, %rax
1408fd7ff: 74 d0                       	je	0x1408fd7d1 <.text+0x8fc7d1>
1408fd801: 48 89 c7                    	movq	%rax, %rdi
1408fd804: 48 89 c1                    	movq	%rax, %rcx
1408fd807: 48 89 da                    	movq	%rbx, %rdx
1408fd80a: 49 89 f0                    	movq	%rsi, %r8
1408fd80d: e8 eb 71 e1 04              	callq	0x1457149fd <.text+0x57139fd>
1408fd812: 48 83 fe 08                 	cmpq	$0x8, %rsi
1408fd816: 73 26                       	jae	0x1408fd83e <.text+0x8fc83e>
1408fd818: 31 c0                       	xorl	%eax, %eax
1408fd81a: e9 22 01 00 00              	jmp	0x1408fd941 <.text+0x8fc941>
1408fd81f: 0f 28 74 24 20              	movaps	0x20(%rsp), %xmm6
1408fd824: 0f 28 7c 24 30              	movaps	0x30(%rsp), %xmm7
1408fd829: 44 0f 28 44 24 40           	movaps	0x40(%rsp), %xmm8
1408fd82f: 48 83 c4 50                 	addq	$0x50, %rsp
1408fd833: 5b                          	popq	%rbx
1408fd834: 5d                          	popq	%rbp
1408fd835: 5f                          	popq	%rdi
1408fd836: 5e                          	popq	%rsi
1408fd837: 41 5c                       	popq	%r12
1408fd839: 41 5e                       	popq	%r14
1408fd83b: 41 5f                       	popq	%r15
1408fd83d: c3                          	retq
1408fd83e: 48 83 fe 20                 	cmpq	$0x20, %rsi
1408fd842: 73 07                       	jae	0x1408fd84b <.text+0x8fc84b>
1408fd844: 31 c0                       	xorl	%eax, %eax
1408fd846: e9 9d 00 00 00              	jmp	0x1408fd8e8 <.text+0x8fc8e8>
1408fd84b: 48 b8 e0 ff ff ff ff ff ff 7f       	movabsq	$0x7fffffffffffffe0, %rax # imm = 0x7FFFFFFFFFFFFFE0
1408fd855: 48 21 f0                    	andq	%rsi, %rax
1408fd858: 31 c9                       	xorl	%ecx, %ecx
1408fd85a: 66 0f 6f 05 3e d1 fa 04     	movdqa	0x4fad13e(%rip), %xmm0  # 0x1458aa9a0
1408fd862: 66 0f 6f 0d 46 d1 fa 04     	movdqa	0x4fad146(%rip), %xmm1  # 0x1458aa9b0
1408fd86a: 66 0f 6f 15 4e d1 fa 04     	movdqa	0x4fad14e(%rip), %xmm2  # 0x1458aa9c0
1408fd872: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1408fd880: f3 0f 6f 1c 0f              	movdqu	(%rdi,%rcx), %xmm3
1408fd885: f3 0f 6f 64 0f 10           	movdqu	0x10(%rdi,%rcx), %xmm4
1408fd88b: 66 0f 6f eb                 	movdqa	%xmm3, %xmm5
1408fd88f: 66 0f fc e8                 	paddb	%xmm0, %xmm5
1408fd893: 66 0f 6f fc                 	movdqa	%xmm4, %xmm7
1408fd897: 66 0f fc f8                 	paddb	%xmm0, %xmm7
1408fd89b: 66 44 0f 6f c5              	movdqa	%xmm5, %xmm8
1408fd8a0: 66 44 0f da c1              	pminub	%xmm1, %xmm8
1408fd8a5: 66 44 0f 74 c5              	pcmpeqb	%xmm5, %xmm8
1408fd8aa: 66 44 0f db c2              	pand	%xmm2, %xmm8
1408fd8af: 66 0f 6f ef                 	movdqa	%xmm7, %xmm5
1408fd8b3: 66 0f da e9                 	pminub	%xmm1, %xmm5
1408fd8b7: 66 0f 74 ef                 	pcmpeqb	%xmm7, %xmm5
1408fd8bb: 66 0f db ea                 	pand	%xmm2, %xmm5
1408fd8bf: 66 44 0f eb c3              	por	%xmm3, %xmm8
1408fd8c4: 66 0f eb ec                 	por	%xmm4, %xmm5
1408fd8c8: f3 44 0f 7f 04 0f           	movdqu	%xmm8, (%rdi,%rcx)
1408fd8ce: f3 0f 7f 6c 0f 10           	movdqu	%xmm5, 0x10(%rdi,%rcx)
1408fd8d4: 48 83 c1 20                 	addq	$0x20, %rcx
1408fd8d8: 48 39 c8                    	cmpq	%rcx, %rax
1408fd8db: 75 a3                       	jne	0x1408fd880 <.text+0x8fc880>
1408fd8dd: 48 39 c6                    	cmpq	%rax, %rsi
1408fd8e0: 74 7c                       	je	0x1408fd95e <.text+0x8fc95e>
1408fd8e2: 40 f6 c6 18                 	testb	$0x18, %sil
1408fd8e6: 74 59                       	je	0x1408fd941 <.text+0x8fc941>
1408fd8e8: 48 89 c1                    	movq	%rax, %rcx
1408fd8eb: 48 b8 f8 ff ff ff ff ff ff 7f       	movabsq	$0x7ffffffffffffff8, %rax # imm = 0x7FFFFFFFFFFFFFF8
1408fd8f5: 48 21 f0                    	andq	%rsi, %rax
1408fd8f8: 66 0f 6f 05 80 72 fb 04     	movdqa	0x4fb7280(%rip), %xmm0  # 0x1458b4b80
1408fd900: 66 0f 6f 0d 88 72 fb 04     	movdqa	0x4fb7288(%rip), %xmm1  # 0x1458b4b90
1408fd908: 66 0f 6f 15 90 72 fb 04     	movdqa	0x4fb7290(%rip), %xmm2  # 0x1458b4ba0
1408fd910: f3 0f 7e 1c 0f              	movq	(%rdi,%rcx), %xmm3
1408fd915: 66 0f 6f e3                 	movdqa	%xmm3, %xmm4
1408fd919: 66 0f fc e0                 	paddb	%xmm0, %xmm4
1408fd91d: 66 0f 6f ec                 	movdqa	%xmm4, %xmm5
1408fd921: 66 0f de e9                 	pmaxub	%xmm1, %xmm5
1408fd925: 66 0f 74 ec                 	pcmpeqb	%xmm4, %xmm5
1408fd929: 66 0f df ea                 	pandn	%xmm2, %xmm5
1408fd92d: 66 0f eb eb                 	por	%xmm3, %xmm5
1408fd931: 66 0f d6 2c 0f              	movq	%xmm5, (%rdi,%rcx)
1408fd936: 48 83 c1 08                 	addq	$0x8, %rcx
1408fd93a: 48 39 c8                    	cmpq	%rcx, %rax
1408fd93d: 75 d1                       	jne	0x1408fd910 <.text+0x8fc910>
1408fd93f: eb 18                       	jmp	0x1408fd959 <.text+0x8fc959>
1408fd941: 0f b6 0c 07                 	movzbl	(%rdi,%rax), %ecx
1408fd945: 8d 51 bf                    	leal	-0x41(%rcx), %edx
1408fd948: 80 fa 1a                    	cmpb	$0x1a, %dl
1408fd94b: 0f 92 c2                    	setb	%dl
1408fd94e: c0 e2 05                    	shlb	$0x5, %dl
1408fd951: 08 ca                       	orb	%cl, %dl
1408fd953: 88 14 07                    	movb	%dl, (%rdi,%rax)
1408fd956: 48 ff c0                    	incq	%rax
1408fd959: 48 39 c6                    	cmpq	%rax, %rsi
1408fd95c: 75 e3                       	jne	0x1408fd941 <.text+0x8fc941>
1408fd95e: 48 8d 46 f5                 	leaq	-0xb(%rsi), %rax
1408fd962: 48 83 f8 14                 	cmpq	$0x14, %rax
1408fd966: 0f 87 c8 03 00 00           	ja	0x1408fdd34 <.text+0x8fcd34>
1408fd96c: 48 8d 0d 35 86 0e 05        	leaq	0x50e8635(%rip), %rcx   # 0x1459e5fa8
1408fd973: 48 63 04 81                 	movslq	(%rcx,%rax,4), %rax
1408fd977: 48 01 c8                    	addq	%rcx, %rax
1408fd97a: ff e0                       	jmpq	*%rax
1408fd97c: 48 b8 73 6f 75 6e 64 76 6f 6c       	movabsq	$0x6c6f76646e756f73, %rax # imm = 0x6C6F76646E756F73
1408fd986: 48 33 07                    	xorq	(%rdi), %rax
1408fd989: 48 b9 6e 64 76 6f 6c 75 6d 65       	movabsq	$0x656d756c6f76646e, %rcx # imm = 0x656D756C6F76646E
1408fd993: 48 33 4f 03                 	xorq	0x3(%rdi), %rcx
1408fd997: 48 09 c1                    	orq	%rax, %rcx
1408fd99a: 0f 84 0b 03 00 00           	je	0x1408fdcab <.text+0x8fccab>
1408fd9a0: 48 b8 6d 75 73 69 63 76 6f 6c       	movabsq	$0x6c6f76636973756d, %rax # imm = 0x6C6F76636973756D
1408fd9aa: 48 33 07                    	xorq	(%rdi), %rax
1408fd9ad: 48 b9 69 63 76 6f 6c 75 6d 65       	movabsq	$0x656d756c6f766369, %rcx # imm = 0x656D756C6F766369
1408fd9b7: 48 33 4f 03                 	xorq	0x3(%rdi), %rcx
1408fd9bb: 48 09 c1                    	orq	%rax, %rcx
1408fd9be: 0f 84 20 03 00 00           	je	0x1408fdce4 <.text+0x8fcce4>
1408fd9c4: 48 b8 65 6e 61 62 6c 65 6d 75       	movabsq	$0x756d656c62616e65, %rax # imm = 0x756D656C62616E65
1408fd9ce: 48 33 07                    	xorq	(%rdi), %rax
1408fd9d1: 48 b9 62 6c 65 6d 75 73 69 63       	movabsq	$0x636973756d656c62, %rcx # imm = 0x636973756D656C62
1408fd9db: 48 33 4f 03                 	xorq	0x3(%rdi), %rcx
1408fd9df: 48 09 c1                    	orq	%rax, %rcx
1408fd9e2: 0f 84 1c 03 00 00           	je	0x1408fdd04 <.text+0x8fcd04>
1408fd9e8: 48 b8 73 6f 75 6e 64 72 65 76       	movabsq	$0x766572646e756f73, %rax # imm = 0x766572646E756F73
1408fd9f2: 48 33 07                    	xorq	(%rdi), %rax
1408fd9f5: 48 b9 6e 64 72 65 76 65 72 62       	movabsq	$0x627265766572646e, %rcx # imm = 0x627265766572646E
1408fd9ff: 48 33 4f 03                 	xorq	0x3(%rdi), %rcx
1408fda03: 48 09 c1                    	orq	%rax, %rcx
1408fda06: 0f 84 11 03 00 00           	je	0x1408fdd1d <.text+0x8fcd1d>
1408fda0c: 48 b8 65 6d 6f 74 65 73 6f 75       	movabsq	$0x756f7365746f6d65, %rax # imm = 0x756F7365746F6D65
1408fda16: 48 33 07                    	xorq	(%rdi), %rax
1408fda19: 48 b9 74 65 73 6f 75 6e 64 73       	movabsq	$0x73646e756f736574, %rcx # imm = 0x73646E756F736574
1408fda23: 48 33 4f 03                 	xorq	0x3(%rdi), %rcx
1408fda27: 48 09 c1                    	orq	%rax, %rcx
1408fda2a: 0f 85 04 03 00 00           	jne	0x1408fdd34 <.text+0x8fcd34>
1408fda30: 41 89 2c 24                 	movl	%ebp, (%r12)
1408fda34: 66 0f ef c0                 	pxor	%xmm0, %xmm0
1408fda38: 0f 2e f0                    	ucomiss	%xmm0, %xmm6
1408fda3b: 0f 9a c0                    	setp	%al
1408fda3e: 0f 95 c1                    	setne	%cl
1408fda41: 08 c1                       	orb	%al, %cl
1408fda43: 41 88 4f 1b                 	movb	%cl, 0x1b(%r15)
1408fda47: e9 e8 02 00 00              	jmp	0x1408fdd34 <.text+0x8fcd34>
1408fda4c: f3 0f 6f 07                 	movdqu	(%rdi), %xmm0
1408fda50: f3 0f 6f 4f 05              	movdqu	0x5(%rdi), %xmm1
1408fda55: 66 0f 74 0d f3 c9 0d 05     	pcmpeqb	0x50dc9f3(%rip), %xmm1  # 0x1459da450
1408fda5d: 66 0f 74 05 fb c9 0d 05     	pcmpeqb	0x50dc9fb(%rip), %xmm0  # 0x1459da460
1408fda65: 66 0f db c1                 	pand	%xmm1, %xmm0
1408fda69: 66 0f d7 c0                 	pmovmskb	%xmm0, %eax
1408fda6d: 3d ff ff 00 00              	cmpl	$0xffff, %eax           # imm = 0xFFFF
1408fda72: 0f 85 bc 02 00 00           	jne	0x1408fdd34 <.text+0x8fcd34>
1408fda78: 41 89 2c 24                 	movl	%ebp, (%r12)
1408fda7c: 66 0f ef c0                 	pxor	%xmm0, %xmm0
1408fda80: 0f 2e f0                    	ucomiss	%xmm0, %xmm6
1408fda83: 0f 9a c0                    	setp	%al
1408fda86: 0f 95 c1                    	setne	%cl
1408fda89: 08 c1                       	orb	%al, %cl
1408fda8b: 41 88 4f 1c                 	movb	%cl, 0x1c(%r15)
1408fda8f: e9 a0 02 00 00              	jmp	0x1408fdd34 <.text+0x8fcd34>
1408fda94: 48 b8 6d 61 73 74 65 72 76 6f       	movabsq	$0x6f7672657473616d, %rax # imm = 0x6F7672657473616D
1408fda9e: 48 33 07                    	xorq	(%rdi), %rax
1408fdaa1: 8b 4f 08                    	movl	0x8(%rdi), %ecx
1408fdaa4: 48 81 f1 6c 75 6d 65        	xorq	$0x656d756c, %rcx       # imm = 0x656D756C
1408fdaab: 48 09 c1                    	orq	%rax, %rcx
1408fdaae: 0f 85 80 02 00 00           	jne	0x1408fdd34 <.text+0x8fcd34>
1408fdab4: 66 0f ef c0                 	pxor	%xmm0, %xmm0
1408fdab8: f3 0f 5f c6                 	maxss	%xmm6, %xmm0
1408fdabc: f3 0f 10 0d 5c a9 fa 04     	movss	0x4faa95c(%rip), %xmm1  # 0x1458a8420
1408fdac4: f3 0f 5d c8                 	minss	%xmm0, %xmm1
1408fdac8: 41 89 2c 24                 	movl	%ebp, (%r12)
1408fdacc: f3 41 0f 11 0f              	movss	%xmm1, (%r15)
1408fdad1: e9 5e 02 00 00              	jmp	0x1408fdd34 <.text+0x8fcd34>
1408fdad6: f3 0f 6f 07                 	movdqu	(%rdi), %xmm0
1408fdada: f3 0f 7e 4f 10              	movq	0x10(%rdi), %xmm1
1408fdadf: 66 0f 74 0d 89 c9 0d 05     	pcmpeqb	0x50dc989(%rip), %xmm1  # 0x1459da470
1408fdae7: 66 0f 74 05 91 c9 0d 05     	pcmpeqb	0x50dc991(%rip), %xmm0  # 0x1459da480
1408fdaef: 66 0f db c1                 	pand	%xmm1, %xmm0
1408fdaf3: 66 0f d7 c0                 	pmovmskb	%xmm0, %eax
1408fdaf7: 3d ff ff 00 00              	cmpl	$0xffff, %eax           # imm = 0xFFFF
1408fdafc: 0f 85 32 02 00 00           	jne	0x1408fdd34 <.text+0x8fcd34>
1408fdb02: 41 89 2c 24                 	movl	%ebp, (%r12)
1408fdb06: 66 0f ef c0                 	pxor	%xmm0, %xmm0
1408fdb0a: 0f 2e f0                    	ucomiss	%xmm0, %xmm6
1408fdb0d: 0f 9a c0                    	setp	%al
1408fdb10: 0f 95 c1                    	setne	%cl
1408fdb13: 08 c1                       	orb	%al, %cl
1408fdb15: 41 88 4f 1a                 	movb	%cl, 0x1a(%r15)
1408fdb19: e9 16 02 00 00              	jmp	0x1408fdd34 <.text+0x8fcd34>
1408fdb1e: f3 0f 6f 07                 	movdqu	(%rdi), %xmm0
1408fdb22: f3 0f 6f 4f 0f              	movdqu	0xf(%rdi), %xmm1
1408fdb27: 66 0f 74 0d 61 c9 0d 05     	pcmpeqb	0x50dc961(%rip), %xmm1  # 0x1459da490
1408fdb2f: 66 0f 74 05 69 c9 0d 05     	pcmpeqb	0x50dc969(%rip), %xmm0  # 0x1459da4a0
1408fdb37: 66 0f db c1                 	pand	%xmm1, %xmm0
1408fdb3b: 66 0f d7 c0                 	pmovmskb	%xmm0, %eax
1408fdb3f: 3d ff ff 00 00              	cmpl	$0xffff, %eax           # imm = 0xFFFF
1408fdb44: 0f 85 ea 01 00 00           	jne	0x1408fdd34 <.text+0x8fcd34>
1408fdb4a: 41 89 2c 24                 	movl	%ebp, (%r12)
1408fdb4e: 66 0f ef c0                 	pxor	%xmm0, %xmm0
1408fdb52: 0f 2e f0                    	ucomiss	%xmm0, %xmm6
1408fdb55: 0f 9a c0                    	setp	%al
1408fdb58: 0f 95 c1                    	setne	%cl
1408fdb5b: 08 c1                       	orb	%al, %cl
1408fdb5d: 41 88 4f 15                 	movb	%cl, 0x15(%r15)
1408fdb61: e9 ce 01 00 00              	jmp	0x1408fdd34 <.text+0x8fcd34>
1408fdb66: 48 b8 61 6d 62 69 65 6e 63 65       	movabsq	$0x65636e6569626d61, %rax # imm = 0x65636E6569626D61
1408fdb70: 48 8b 0f                    	movq	(%rdi), %rcx
1408fdb73: 48 31 c1                    	xorq	%rax, %rcx
1408fdb76: 48 ba 63 65 76 6f 6c 75 6d 65       	movabsq	$0x656d756c6f766563, %rdx # imm = 0x656D756C6F766563
1408fdb80: 48 33 57 06                 	xorq	0x6(%rdi), %rdx
1408fdb84: 48 09 ca                    	orq	%rcx, %rdx
1408fdb87: 0f 84 fb 00 00 00           	je	0x1408fdc88 <.text+0x8fcc88>
1408fdb8d: 48 b9 65 6e 61 62 6c 65 61 6d       	movabsq	$0x6d61656c62616e65, %rcx # imm = 0x6D61656C62616E65
1408fdb97: 48 33 0f                    	xorq	(%rdi), %rcx
1408fdb9a: 48 33 47 06                 	xorq	0x6(%rdi), %rax
1408fdb9e: 48 09 c8                    	orq	%rcx, %rax
1408fdba1: 0f 85 8d 01 00 00           	jne	0x1408fdd34 <.text+0x8fcd34>
1408fdba7: 41 89 2c 24                 	movl	%ebp, (%r12)
1408fdbab: 66 0f ef c0                 	pxor	%xmm0, %xmm0
1408fdbaf: 0f 2e f0                    	ucomiss	%xmm0, %xmm6
1408fdbb2: 0f 9a c0                    	setp	%al
1408fdbb5: 0f 95 c1                    	setne	%cl
1408fdbb8: 08 c1                       	orb	%al, %cl
1408fdbba: 41 88 4f 13                 	movb	%cl, 0x13(%r15)
1408fdbbe: e9 71 01 00 00              	jmp	0x1408fdd34 <.text+0x8fcd34>
1408fdbc3: f3 0f 6f 07                 	movdqu	(%rdi), %xmm0
1408fdbc7: 0f b6 47 10                 	movzbl	0x10(%rdi), %eax
1408fdbcb: 66 0f 6e c8                 	movd	%eax, %xmm1
1408fdbcf: 66 0f 74 05 d9 c8 0d 05     	pcmpeqb	0x50dc8d9(%rip), %xmm0  # 0x1459da4b0
1408fdbd7: 66 0f 74 0d e1 c8 0d 05     	pcmpeqb	0x50dc8e1(%rip), %xmm1  # 0x1459da4c0
1408fdbdf: 66 0f db c8                 	pand	%xmm0, %xmm1
1408fdbe3: 66 0f d7 c1                 	pmovmskb	%xmm1, %eax
1408fdbe7: 3d ff ff 00 00              	cmpl	$0xffff, %eax           # imm = 0xFFFF
1408fdbec: 0f 85 42 01 00 00           	jne	0x1408fdd34 <.text+0x8fcd34>
1408fdbf2: 41 89 2c 24                 	movl	%ebp, (%r12)
1408fdbf6: 66 0f ef c0                 	pxor	%xmm0, %xmm0
1408fdbfa: 0f 2e f0                    	ucomiss	%xmm0, %xmm6
1408fdbfd: 0f 9a c0                    	setp	%al
1408fdc00: 0f 95 c1                    	setne	%cl
1408fdc03: 08 c1                       	orb	%al, %cl
1408fdc05: 41 88 4f 14                 	movb	%cl, 0x14(%r15)
1408fdc09: e9 26 01 00 00              	jmp	0x1408fdd34 <.text+0x8fcd34>
1408fdc0e: f3 0f 6f 07                 	movdqu	(%rdi), %xmm0
1408fdc12: 0f b7 47 10                 	movzwl	0x10(%rdi), %eax
1408fdc16: 66 0f 6e c8                 	movd	%eax, %xmm1
1408fdc1a: 66 0f 74 05 ae c8 0d 05     	pcmpeqb	0x50dc8ae(%rip), %xmm0  # 0x1459da4d0
1408fdc22: 66 0f 74 0d b6 c8 0d 05     	pcmpeqb	0x50dc8b6(%rip), %xmm1  # 0x1459da4e0
1408fdc2a: 66 0f db c8                 	pand	%xmm0, %xmm1
1408fdc2e: 66 0f d7 c1                 	pmovmskb	%xmm1, %eax
1408fdc32: 3d ff ff 00 00              	cmpl	$0xffff, %eax           # imm = 0xFFFF
1408fdc37: 0f 84 8e 00 00 00           	je	0x1408fdccb <.text+0x8fcccb>
1408fdc3d: f3 0f 6f 07                 	movdqu	(%rdi), %xmm0
1408fdc41: 0f b7 47 10                 	movzwl	0x10(%rdi), %eax
1408fdc45: 66 0f 6e c8                 	movd	%eax, %xmm1
1408fdc49: 66 0f 74 05 9f c8 0d 05     	pcmpeqb	0x50dc89f(%rip), %xmm0  # 0x1459da4f0
1408fdc51: 66 0f 74 0d a7 c8 0d 05     	pcmpeqb	0x50dc8a7(%rip), %xmm1  # 0x1459da500
1408fdc59: 66 0f db c8                 	pand	%xmm0, %xmm1
1408fdc5d: 66 0f d7 c1                 	pmovmskb	%xmm1, %eax
1408fdc61: 3d ff ff 00 00              	cmpl	$0xffff, %eax           # imm = 0xFFFF
1408fdc66: 0f 85 c8 00 00 00           	jne	0x1408fdd34 <.text+0x8fcd34>
1408fdc6c: 41 89 2c 24                 	movl	%ebp, (%r12)
1408fdc70: 66 0f ef c0                 	pxor	%xmm0, %xmm0
1408fdc74: 0f 2e f0                    	ucomiss	%xmm0, %xmm6
1408fdc77: 0f 9a c0                    	setp	%al
1408fdc7a: 0f 95 c1                    	setne	%cl
1408fdc7d: 08 c1                       	orb	%al, %cl
1408fdc7f: 41 88 4f 19                 	movb	%cl, 0x19(%r15)
1408fdc83: e9 ac 00 00 00              	jmp	0x1408fdd34 <.text+0x8fcd34>
1408fdc88: 66 0f ef c0                 	pxor	%xmm0, %xmm0
1408fdc8c: f3 0f 5f c6                 	maxss	%xmm6, %xmm0
1408fdc90: f3 0f 10 0d 88 a7 fa 04     	movss	0x4faa788(%rip), %xmm1  # 0x1458a8420
1408fdc98: f3 0f 5d c8                 	minss	%xmm0, %xmm1
1408fdc9c: 41 89 2c 24                 	movl	%ebp, (%r12)
1408fdca0: f3 41 0f 11 4f 0c           	movss	%xmm1, 0xc(%r15)
1408fdca6: e9 89 00 00 00              	jmp	0x1408fdd34 <.text+0x8fcd34>
1408fdcab: 66 0f ef c0                 	pxor	%xmm0, %xmm0
1408fdcaf: f3 0f 5f c6                 	maxss	%xmm6, %xmm0
1408fdcb3: f3 0f 10 0d 65 a7 fa 04     	movss	0x4faa765(%rip), %xmm1  # 0x1458a8420
1408fdcbb: f3 0f 5d c8                 	minss	%xmm0, %xmm1
1408fdcbf: 41 89 2c 24                 	movl	%ebp, (%r12)
1408fdcc3: f3 41 0f 11 4f 04           	movss	%xmm1, 0x4(%r15)
1408fdcc9: eb 69                       	jmp	0x1408fdd34 <.text+0x8fcd34>
1408fdccb: 41 89 2c 24                 	movl	%ebp, (%r12)
1408fdccf: 66 0f ef c0                 	pxor	%xmm0, %xmm0
1408fdcd3: 0f 2e f0                    	ucomiss	%xmm0, %xmm6
1408fdcd6: 0f 9a c0                    	setp	%al
1408fdcd9: 0f 95 c1                    	setne	%cl
1408fdcdc: 08 c1                       	orb	%al, %cl
1408fdcde: 41 88 4f 10                 	movb	%cl, 0x10(%r15)
1408fdce2: eb 50                       	jmp	0x1408fdd34 <.text+0x8fcd34>
1408fdce4: 66 0f ef c0                 	pxor	%xmm0, %xmm0
1408fdce8: f3 0f 5f c6                 	maxss	%xmm6, %xmm0
1408fdcec: f3 0f 10 0d 2c a7 fa 04     	movss	0x4faa72c(%rip), %xmm1  # 0x1458a8420
1408fdcf4: f3 0f 5d c8                 	minss	%xmm0, %xmm1
1408fdcf8: 41 89 2c 24                 	movl	%ebp, (%r12)
1408fdcfc: f3 41 0f 11 4f 08           	movss	%xmm1, 0x8(%r15)
1408fdd02: eb 30                       	jmp	0x1408fdd34 <.text+0x8fcd34>
1408fdd04: 41 89 2c 24                 	movl	%ebp, (%r12)
1408fdd08: 66 0f ef c0                 	pxor	%xmm0, %xmm0
1408fdd0c: 0f 2e f0                    	ucomiss	%xmm0, %xmm6
1408fdd0f: 0f 9a c0                    	setp	%al
1408fdd12: 0f 95 c1                    	setne	%cl
1408fdd15: 08 c1                       	orb	%al, %cl
1408fdd17: 41 88 4f 12                 	movb	%cl, 0x12(%r15)
1408fdd1b: eb 17                       	jmp	0x1408fdd34 <.text+0x8fcd34>
1408fdd1d: 41 89 2c 24                 	movl	%ebp, (%r12)
1408fdd21: 66 0f ef c0                 	pxor	%xmm0, %xmm0
1408fdd25: 0f 2e f0                    	ucomiss	%xmm0, %xmm6
1408fdd28: 0f 9a c0                    	setp	%al
1408fdd2b: 0f 95 c1                    	setne	%cl
1408fdd2e: 08 c1                       	orb	%al, %cl
1408fdd30: 41 88 4f 16                 	movb	%cl, 0x16(%r15)
1408fdd34: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1408fdd3a: 48 89 f9                    	movq	%rdi, %rcx
1408fdd3d: 48 89 f2                    	movq	%rsi, %rdx
1408fdd40: 0f 28 74 24 20              	movaps	0x20(%rsp), %xmm6
1408fdd45: 0f 28 7c 24 30              	movaps	0x30(%rsp), %xmm7
1408fdd4a: 44 0f 28 44 24 40           	movaps	0x40(%rsp), %xmm8
1408fdd50: 48 83 c4 50                 	addq	$0x50, %rsp
1408fdd54: 5b                          	popq	%rbx
1408fdd55: 5d                          	popq	%rbp
1408fdd56: 5f                          	popq	%rdi
1408fdd57: 5e                          	popq	%rsi
1408fdd58: 41 5c                       	popq	%r12
1408fdd5a: 41 5e                       	popq	%r14
1408fdd5c: 41 5f                       	popq	%r15
1408fdd5e: e9 6d 44 70 ff              	jmp	0x1400021d0 <.text+0x11d0>
