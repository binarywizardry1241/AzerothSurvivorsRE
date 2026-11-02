
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458eded0:     	pushq	%rsi
1458eded1:     	pushq	%rdi
1458eded2:     	subq	$0x28, %rsp
1458eded6:     	movq	%rcx, %rsi
1458eded9:     	movq	%rdx, %rcx
1458ededc:     	movq	%r8, %rdx
1458ededf:     	callq	0x1458753b0 <.text+0x58743b0>
1458edee4:     	movq	%rax, %rdi
1458edee7:     	callq	0x1458c0f00 <.text+0x58bff00>
1458edeec:     	xorl	%ecx, %ecx
1458edeee:     	testq	%rax, %rax
1458edef1:     	je	0x1458edfe5 <.text+0x58ecfe5>
1458edef7:     	testq	%rdx, %rdx
1458edefa:     	je	0x1458edfe5 <.text+0x58ecfe5>
1458edf00:     	imulq	$0xf0, %rdi, %rcx
1458edf07:     	leaq	0x12bb542(%rip), %r10   # 0x146ba9450
1458edf0e:     	addq	%rcx, %r10
1458edf11:     	shlq	$0x3, %rdx
1458edf15:     	leaq	(%rdx,%rdx,2), %rcx
1458edf19:     	movl	0xc0(%r10), %r8d
1458edf20:     	movl	0xc4(%r10), %edx
1458edf27:     	movq	%rcx, %r11
1458edf2a:     	movq	%rax, %r9
1458edf2d:     	jmp	0x1458edf3a <.text+0x58ecf3a>
1458edf2f:     	nop
1458edf30:     	addq	$0x18, %r9
1458edf34:     	addq	$-0x18, %r11
1458edf38:     	je	0x1458edf58 <.text+0x58ecf58>
1458edf3a:     	cmpl	%r8d, (%r9)
1458edf3d:     	jne	0x1458edf30 <.text+0x58ecf30>
1458edf3f:     	cmpl	%edx, 0x4(%r9)
1458edf43:     	jne	0x1458edf30 <.text+0x58ecf30>
1458edf45:     	movups	0x8(%r9), %xmm0
1458edf4a:     	movups	%xmm0, 0x4(%rsi)
1458edf4e:     	movl	$0x1, %ecx
1458edf53:     	jmp	0x1458edfe5 <.text+0x58ecfe5>
1458edf58:     	movss	0xc8(%r10), %xmm0
1458edf61:     	movss	0xcc(%r10), %xmm1
1458edf6a:     	xorl	%r10d, %r10d
1458edf6d:     	jmp	0x1458edf79 <.text+0x58ecf79>
1458edf6f:     	nop
1458edf70:     	addq	$0x18, %r10
1458edf74:     	cmpq	%r10, %rcx
1458edf77:     	je	0x1458edfe3 <.text+0x58ecfe3>
1458edf79:     	cmpl	%r8d, (%rax,%r10)
1458edf7d:     	jne	0x1458edf70 <.text+0x58ecf70>
1458edf7f:     	ucomiss	0xc(%rax,%r10), %xmm1
1458edf85:     	jb	0x1458edf70 <.text+0x58ecf70>
1458edf87:     	movss	0x8(%rax,%r10), %xmm2
1458edf8e:     	ucomiss	%xmm1, %xmm2
1458edf91:     	jb	0x1458edf70 <.text+0x58ecf70>
1458edf93:     	ucomiss	0x14(%rax,%r10), %xmm0
1458edf99:     	jb	0x1458edf70 <.text+0x58ecf70>
1458edf9b:     	movss	0x10(%rax,%r10), %xmm2
1458edfa2:     	ucomiss	%xmm0, %xmm2
1458edfa5:     	jb	0x1458edf70 <.text+0x58ecf70>
1458edfa7:     	leaq	-0x18(%rcx), %rdx
1458edfab:     	leaq	(%rax,%r10), %r9
1458edfaf:     	cmpq	%r10, %rdx
1458edfb2:     	je	0x1458edf45 <.text+0x58ecf45>
1458edfb4:     	subq	%r10, %rcx
1458edfb7:     	addq	$-0x18, %rcx
1458edfbb:     	movabsq	$-0x5555555555555555, %rdx # imm = 0xAAAAAAAAAAAAAAAB
1458edfc5:     	movq	%rax, %r11
1458edfc8:     	movq	%rcx, %rax
1458edfcb:     	mulq	%rdx
1458edfce:     	leaq	(%r11,%r10), %rax
1458edfd2:     	addq	$0x18, %rax
1458edfd6:     	shrq	$0x4, %rdx
1458edfda:     	movaps	0x4acf5f(%rip), %xmm2   # 0x145d9af40
1458edfe1:     	jmp	0x1458ee00d <.text+0x58ed00d>
1458edfe3:     	xorl	%ecx, %ecx
1458edfe5:     	movl	%ecx, (%rsi)
1458edfe7:     	addq	$0x28, %rsp
1458edfeb:     	popq	%rdi
1458edfec:     	popq	%rsi
1458edfed:     	retq
1458edfee:     	movq	%rcx, %r9
1458edff1:     	nopw	%cs:(%rax,%rax)
1458ee000:     	addq	$0x18, %rax
1458ee004:     	decq	%rdx
1458ee007:     	je	0x1458edf45 <.text+0x58ecf45>
1458ee00d:     	cmpl	%r8d, (%rax)
1458ee010:     	jne	0x1458ee000 <.text+0x58ed000>
1458ee012:     	ucomiss	0xc(%rax), %xmm1
1458ee016:     	jb	0x1458ee000 <.text+0x58ed000>
1458ee018:     	movsd	0x8(%rax), %xmm3
1458ee01d:     	ucomiss	%xmm1, %xmm3
1458ee020:     	jb	0x1458ee000 <.text+0x58ed000>
1458ee022:     	ucomiss	0x14(%rax), %xmm0
1458ee026:     	jb	0x1458ee000 <.text+0x58ed000>
1458ee028:     	movsd	0x10(%rax), %xmm4
1458ee02d:     	ucomiss	%xmm0, %xmm4
1458ee030:     	jb	0x1458ee000 <.text+0x58ed000>
1458ee032:     	movsd	0x8(%r9), %xmm5
1458ee038:     	hsubps	%xmm3, %xmm5
1458ee03c:     	movsd	0x10(%r9), %xmm3
1458ee042:     	hsubps	%xmm4, %xmm3
1458ee046:     	mulps	%xmm5, %xmm3
1458ee049:     	shufps	$0xe8, %xmm3, %xmm3     # xmm3 = xmm3[0,2,2,3]
1458ee04d:     	andps	%xmm2, %xmm3
1458ee050:     	movd	%xmm3, %r10d
1458ee055:     	pshufd	$0x55, %xmm3, %xmm3     # xmm3 = xmm3[1,1,1,1]
1458ee05a:     	movd	%xmm3, %r11d
1458ee05f:     	movq	%rax, %rcx
1458ee062:     	cmpl	%r11d, %r10d
1458ee065:     	ja	0x1458edfee <.text+0x58ecfee>
1458ee067:     	movq	%r9, %rcx
1458ee06a:     	jmp	0x1458edfee <.text+0x58ecfee>
