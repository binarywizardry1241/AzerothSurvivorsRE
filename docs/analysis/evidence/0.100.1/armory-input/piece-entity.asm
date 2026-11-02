
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400527e0:     	pushq	%rsi
1400527e1:     	pushq	%rdi
1400527e2:     	pushq	%rbx
1400527e3:     	subq	$0x340, %rsp            # imm = 0x340
1400527ea:     	movq	%rdx, %rsi
1400527ed:     	movq	%rcx, %rdi
1400527f0:     	leaq	0x50(%rsp), %rbx
1400527f5:     	movl	$0x2f0, %r8d            # imm = 0x2F0
1400527fb:     	movq	%rbx, %rcx
1400527fe:     	movq	%rdi, %rdx
140052801:     	callq	0x1457731ed <.text+0x57721ed>
140052806:     	movq	0x2f0(%rdi), %r8
14005280d:     	leaq	0x30(%rsp), %rcx
140052812:     	movq	%rsi, %rdx
140052815:     	movq	%rbx, %r9
140052818:     	callq	0x1402f9940 <.text+0x2f8940>
14005281d:     	cmpq	$0x0, 0x30(%rsp)
140052823:     	je	0x140052830 <.text+0x51830>
140052825:     	addq	$0x340, %rsp            # imm = 0x340
14005282c:     	popq	%rbx
14005282d:     	popq	%rdi
14005282e:     	popq	%rsi
14005282f:     	retq
140052830:     	movdqu	0x38(%rsp), %xmm0
140052836:     	movdqa	%xmm0, 0x20(%rsp)
14005283c:     	leaq	-0xfb03(%rip), %rdi     # 0x140042d40 <.text+0x41d40>
140052843:     	cmpq	$0x0, 0x90(%rsi)
14005284b:     	je	0x14005292a <.text+0x5192a>
140052851:     	movq	0x78(%rsi), %rax
140052855:     	movq	0x80(%rsi), %rcx
14005285c:     	movabsq	$0x28fdfadbf3ba56af, %rdx # imm = 0x28FDFADBF3BA56AF
140052866:     	xorl	%r8d, %r8d
140052869:     	movdqa	0x58c0a2f(%rip), %xmm0  # 0x1459132a0
140052871:     	pcmpeqd	%xmm1, %xmm1
140052875:     	movdqa	0x58c0a33(%rip), %xmm2  # 0x1459132b0
14005287d:     	andq	%rcx, %rdx
140052880:     	movdqu	(%rax,%rdx), %xmm3
140052885:     	movdqa	%xmm3, %xmm4
140052889:     	pcmpeqb	%xmm0, %xmm4
14005288d:     	pmovmskb	%xmm4, %r9d
140052892:     	testl	%r9d, %r9d
140052895:     	je	0x1400528cf <.text+0x518cf>
140052897:     	tzcntl	%r9d, %r10d
14005289c:     	addq	%rdx, %r10
14005289f:     	andq	%rcx, %r10
1400528a2:     	negq	%r10
1400528a5:     	leaq	(%r10,%r10,2), %r10
1400528a9:     	movdqu	-0x18(%rax,%r10,8), %xmm4
1400528b0:     	pcmpeqb	%xmm2, %xmm4
1400528b4:     	pmovmskb	%xmm4, %r11d
1400528b9:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
1400528c0:     	je	0x1400528ea <.text+0x518ea>
1400528c2:     	leal	-0x1(%r9), %r10d
1400528c6:     	andw	%r9w, %r10w
1400528ca:     	movl	%r10d, %r9d
1400528cd:     	jne	0x140052897 <.text+0x51897>
1400528cf:     	pcmpeqb	%xmm1, %xmm3
1400528d3:     	pmovmskb	%xmm3, %r9d
1400528d8:     	testl	%r9d, %r9d
1400528db:     	jne	0x14005292a <.text+0x5192a>
1400528dd:     	addq	%r8, %rdx
1400528e0:     	addq	$0x10, %rdx
1400528e4:     	addq	$0x10, %r8
1400528e8:     	jmp	0x14005287d <.text+0x5187d>
1400528ea:     	leaq	(%rax,%r10,8), %rax
1400528ee:     	movq	-0x8(%rax), %rax
1400528f2:     	cmpq	0x218(%rsi), %rax
1400528f9:     	jae	0x14005292a <.text+0x5192a>
1400528fb:     	movq	0x210(%rsi), %rcx
140052902:     	movq	(%rcx,%rax,8), %rcx
140052906:     	testq	%rcx, %rcx
140052909:     	je	0x14005292a <.text+0x5192a>
14005290b:     	movq	0x1e0(%rsi), %rax
140052912:     	notq	%rcx
140052915:     	imulq	$0x38, %rcx, %rcx
140052919:     	cmpb	$0x1, 0x30(%rax,%rcx)
14005291e:     	jne	0x14005292a <.text+0x5192a>
140052920:     	addq	%rcx, %rax
140052923:     	movq	0x10(%rax), %rax
140052927:     	movq	(%rax), %rdi
14005292a:     	movaps	0x20(%rsp), %xmm0
14005292f:     	movaps	%xmm0, 0x50(%rsp)
140052934:     	leaq	0x50(%rsp), %rcx
140052939:     	callq	0x1457768d0 <.text+0x57758d0>
14005293e:     	movl	$0x2, %edx
140052943:     	movq	%rax, %rcx
140052946:     	callq	*%rdi
140052948:     	jmp	0x140052825 <.text+0x51825>
