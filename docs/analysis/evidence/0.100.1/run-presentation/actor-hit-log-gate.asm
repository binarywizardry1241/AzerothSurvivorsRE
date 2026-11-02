
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d57cf:     	testl	%ebx, %ebx
1454d57d1:     	sete	%al
1454d57d4:     	orb	%r12b, %al
1454d57d7:     	jne	0x1454d58ab <.text+0x54d48ab>
1454d57dd:     	movq	0x3e8(%rsi), %r8
1454d57e4:     	cmpl	$0x3ea6, %ebx           # imm = 0x3EA6
1454d57ea:     	je	0x1454d580f <.text+0x54d480f>
1454d57ec:     	cmpl	$0x376a, %ebx           # imm = 0x376A
1454d57f2:     	je	0x1454d5807 <.text+0x54d4807>
1454d57f4:     	movl	%ebx, %r9d
1454d57f7:     	cmpl	$0x14bc, %ebx           # imm = 0x14BC
1454d57fd:     	jne	0x1454d5815 <.text+0x54d4815>
1454d57ff:     	movl	$0x50a7, %r9d           # imm = 0x50A7
1454d5805:     	jmp	0x1454d5815 <.text+0x54d4815>
1454d5807:     	movl	$0x832, %r9d            # imm = 0x832
1454d580d:     	jmp	0x1454d5815 <.text+0x54d4815>
1454d580f:     	movl	$0x209d, %r9d           # imm = 0x209D
1454d5815:     	cvttss2si	%xmm8, %rax
1454d581a:     	xorl	%ecx, %ecx
1454d581c:     	xorps	%xmm0, %xmm0
1454d581f:     	ucomiss	%xmm0, %xmm8
1454d5823:     	cmovael	%eax, %ecx
1454d5826:     	ucomiss	0x431cfe(%rip), %xmm8   # 0x14590752c
1454d582e:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454d5833:     	cmovbel	%ecx, %eax
1454d5836:     	movzbl	0x298(%rbp), %ecx
1454d583d:     	movb	%cl, 0x30(%rsp)
1454d5841:     	movzbl	0x290(%rbp), %ecx
1454d5848:     	movb	%cl, 0x28(%rsp)
1454d584c:     	movl	%eax, 0x20(%rsp)
1454d5850:     	leaq	0xf0(%rbp), %rcx
1454d5857:     	movq	%rdi, %rdx
1454d585a:     	callq	0x14545f6d0 <.text+0x545e6d0>
1454d585f:     	movq	0x560(%rsi), %r15
1454d5866:     	cmpq	0x550(%rsi), %r15
1454d586d:     	jne	0x1454d587c <.text+0x54d487c>
1454d586f:     	leaq	0x550(%rsi), %rcx
1454d5876:     	callq	0x145774710 <.text+0x5773710>
1454d587b:     	nop
1454d587c:     	movq	0x558(%rsi), %rax
1454d5883:     	movq	%r15, %rcx
1454d5886:     	shlq	$0x5, %rcx
1454d588a:     	movups	0xf0(%rbp), %xmm0
1454d5891:     	movups	0x100(%rbp), %xmm1
1454d5898:     	movups	%xmm1, 0x10(%rax,%rcx)
1454d589d:     	movups	%xmm0, (%rax,%rcx)
1454d58a1:     	incq	%r15
1454d58a4:     	movq	%r15, 0x560(%rsi)
