
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14547f960:     	pushq	%rbp
14547f961:     	pushq	%r15
14547f963:     	pushq	%r14
14547f965:     	pushq	%r13
14547f967:     	pushq	%r12
14547f969:     	pushq	%rsi
14547f96a:     	pushq	%rdi
14547f96b:     	pushq	%rbx
14547f96c:     	subq	$0x58, %rsp
14547f970:     	leaq	0x50(%rsp), %rbp
14547f975:     	movq	$-0x2, (%rbp)
14547f97d:     	movl	%edx, %ebx
14547f97f:     	movq	%rcx, %rsi
14547f982:     	leaq	0xf0(%rcx), %rdx
14547f989:     	leaq	-0x28(%rbp), %rcx
14547f98d:     	callq	0x145546de0 <.text+0x5545de0>
14547f992:     	movq	0x118(%rsi), %r13
14547f999:     	leaq	(,%r13,4), %r15
14547f9a1:     	movq	%r13, %rax
14547f9a4:     	shrq	$0x3e, %rax
14547f9a8:     	setne	%al
14547f9ab:     	movabsq	$0x7ffffffffffffffc, %rcx # imm = 0x7FFFFFFFFFFFFFFC
14547f9b5:     	cmpq	%rcx, %r15
14547f9b8:     	seta	%cl
14547f9bb:     	orb	%al, %cl
14547f9bd:     	je	0x14547f9d0 <.text+0x547e9d0>
14547f9bf:     	xorl	%r14d, %r14d
14547f9c2:     	movq	%r14, %rcx
14547f9c5:     	movq	%r15, %rdx
14547f9c8:     	callq	0x14590379b <.text+0x590279b>
14547f9cd:     	nop
14547f9ce:     	ud2
14547f9d0:     	movq	0x110(%rsi), %r12
14547f9d7:     	testq	%r15, %r15
14547f9da:     	je	0x14547fd01 <.text+0x547ed01>
14547f9e0:     	callq	0x140002200 <.text+0x1200>
14547f9e5:     	movl	$0x4, %r14d
14547f9eb:     	movl	$0x4, %edx
14547f9f0:     	movq	%r15, %rcx
14547f9f3:     	callq	0x1400021c0 <.text+0x11c0>
14547f9f8:     	testq	%rax, %rax
14547f9fb:     	je	0x14547f9c2 <.text+0x547e9c2>
14547f9fd:     	movq	%rax, %rdi
14547fa00:     	movq	%r13, %r14
14547fa03:     	testq	%r13, %r13
14547fa06:     	je	0x14547fa16 <.text+0x547ea16>
14547fa08:     	movq	%rdi, %rcx
14547fa0b:     	movq	%r12, %rdx
14547fa0e:     	movq	%r15, %r8
14547fa11:     	callq	0x1457731ed <.text+0x57721ed>
14547fa16:     	movq	-0x28(%rbp), %r15
14547fa1a:     	movq	-0x20(%rbp), %r12
14547fa1e:     	movq	-0x18(%rbp), %r13
14547fa22:     	testq	%r13, %r13
14547fa25:     	movq	%rdi, -0x10(%rbp)
14547fa29:     	je	0x14547fd17 <.text+0x547ed17>
14547fa2f:     	movq	%r13, %rax
14547fa32:     	shlq	$0x5, %rax
14547fa36:     	xorl	%ecx, %ecx
14547fa38:     	movl	$0x65746576, %edx       # imm = 0x65746576
14547fa3d:     	movl	$0x6e617265, %r8d       # imm = 0x6E617265
14547fa43:     	jmp	0x14547fa59 <.text+0x547ea59>
14547fa45:     	nopw	%cs:(%rax,%rax)
14547fa50:     	addq	$0x20, %rcx
14547fa54:     	cmpq	%rcx, %rax
14547fa57:     	je	0x14547fa83 <.text+0x547ea83>
14547fa59:     	cmpq	$0x7, 0x10(%r12,%rcx)
14547fa5f:     	jne	0x14547fa50 <.text+0x547ea50>
14547fa61:     	movq	0x8(%r12,%rcx), %r9
14547fa66:     	movl	(%r9), %r10d
14547fa69:     	xorl	%edx, %r10d
14547fa6c:     	movl	0x3(%r9), %r9d
14547fa70:     	xorl	%r8d, %r9d
14547fa73:     	orl	%r10d, %r9d
14547fa76:     	jne	0x14547fa50 <.text+0x547ea50>
14547fa78:     	movzbl	0x18(%r12,%rcx), %eax
14547fa7e:     	movl	%eax, -0x4(%rbp)
14547fa81:     	jmp	0x14547fa8a <.text+0x547ea8a>
14547fa83:     	movl	$0x0, -0x4(%rbp)
14547fa8a:     	leaq	0x8(%r12), %rdi
14547fa8f:     	jmp	0x14547faa9 <.text+0x547eaa9>
14547fa91:     	nopw	%cs:(%rax,%rax)
14547faa0:     	addq	$0x20, %rdi
14547faa4:     	decq	%r13
14547faa7:     	je	0x14547fac2 <.text+0x547eac2>
14547faa9:     	movq	-0x8(%rdi), %rdx
14547faad:     	testq	%rdx, %rdx
14547fab0:     	je	0x14547faa0 <.text+0x547eaa0>
14547fab2:     	movq	(%rdi), %rcx
14547fab5:     	movl	$0x1, %r8d
14547fabb:     	callq	0x1400021d0 <.text+0x11d0>
14547fac0:     	jmp	0x14547faa0 <.text+0x547eaa0>
14547fac2:     	movl	-0x4(%rbp), %edi
14547fac5:     	testq	%r15, %r15
14547fac8:     	je	0x14547fadf <.text+0x547eadf>
14547faca:     	shlq	$0x5, %r15
14547face:     	movl	$0x8, %r8d
14547fad4:     	movq	%r12, %rcx
14547fad7:     	movq	%r15, %rdx
14547fada:     	callq	0x1400021d0 <.text+0x11d0>
14547fadf:     	testq	%r14, %r14
14547fae2:     	je	0x14547fafa <.text+0x547eafa>
14547fae4:     	shlq	$0x2, %r14
14547fae8:     	movl	$0x4, %r8d
14547faee:     	movq	-0x10(%rbp), %rcx
14547faf2:     	movq	%r14, %rdx
14547faf5:     	callq	0x1400021d0 <.text+0x11d0>
14547fafa:     	movq	0x68(%rsi), %rax
14547fafe:     	movq	0x70(%rsi), %rcx
14547fb02:     	shlq	$0x5, %rcx
14547fb06:     	xorl	%edx, %edx
14547fb08:     	xorl	%r8d, %r8d
14547fb0b:     	nopl	(%rax,%rax)
14547fb10:     	cmpq	%r8, %rcx
14547fb13:     	je	0x14547fb29 <.text+0x547eb29>
14547fb15:     	leaq	0x20(%r8), %r9
14547fb19:     	cmpb	$0x1, 0x4(%rax,%r8)
14547fb1f:     	movq	%r9, %r8
14547fb22:     	jne	0x14547fb10 <.text+0x547eb10>
14547fb24:     	movl	-0x20(%rax,%r9), %edx
14547fb29:     	xorl	%r8d, %r8d
14547fb2c:     	nopl	(%rax)
14547fb30:     	cmpq	%r8, %rcx
14547fb33:     	je	0x14547fb53 <.text+0x547eb53>
14547fb35:     	leaq	0x20(%r8), %r9
14547fb39:     	cmpb	$0x2, 0x4(%rax,%r8)
14547fb3f:     	movq	%r9, %r8
14547fb42:     	jne	0x14547fb30 <.text+0x547eb30>
14547fb44:     	movl	-0x20(%rax,%r9), %r8d
14547fb49:     	cmpl	%r8d, %edx
14547fb4c:     	cmoval	%edx, %r8d
14547fb50:     	movl	%r8d, %edx
14547fb53:     	xorl	%r8d, %r8d
14547fb56:     	nopw	%cs:(%rax,%rax)
14547fb60:     	cmpq	%r8, %rcx
14547fb63:     	je	0x14547fb83 <.text+0x547eb83>
14547fb65:     	leaq	0x20(%r8), %r9
14547fb69:     	cmpb	$0x3, 0x4(%rax,%r8)
14547fb6f:     	movq	%r9, %r8
14547fb72:     	jne	0x14547fb60 <.text+0x547eb60>
14547fb74:     	movl	-0x20(%rax,%r9), %r8d
14547fb79:     	cmpl	%r8d, %edx
14547fb7c:     	cmoval	%edx, %r8d
14547fb80:     	movl	%r8d, %edx
14547fb83:     	xorl	%r8d, %r8d
14547fb86:     	nopw	%cs:(%rax,%rax)
14547fb90:     	cmpq	%r8, %rcx
14547fb93:     	je	0x14547fbb3 <.text+0x547ebb3>
14547fb95:     	leaq	0x20(%r8), %r9
14547fb99:     	cmpb	$0x4, 0x4(%rax,%r8)
14547fb9f:     	movq	%r9, %r8
14547fba2:     	jne	0x14547fb90 <.text+0x547eb90>
14547fba4:     	movl	-0x20(%rax,%r9), %r8d
14547fba9:     	cmpl	%r8d, %edx
14547fbac:     	cmoval	%edx, %r8d
14547fbb0:     	movl	%r8d, %edx
14547fbb3:     	xorl	%r8d, %r8d
14547fbb6:     	nopw	%cs:(%rax,%rax)
14547fbc0:     	cmpq	%r8, %rcx
14547fbc3:     	je	0x14547fbe3 <.text+0x547ebe3>
14547fbc5:     	leaq	0x20(%r8), %r9
14547fbc9:     	cmpb	$0x5, 0x4(%rax,%r8)
14547fbcf:     	movq	%r9, %r8
14547fbd2:     	jne	0x14547fbc0 <.text+0x547ebc0>
14547fbd4:     	movl	-0x20(%rax,%r9), %r8d
14547fbd9:     	cmpl	%r8d, %edx
14547fbdc:     	cmoval	%edx, %r8d
14547fbe0:     	movl	%r8d, %edx
14547fbe3:     	xorl	%r8d, %r8d
14547fbe6:     	nopw	%cs:(%rax,%rax)
14547fbf0:     	cmpq	%r8, %rcx
14547fbf3:     	je	0x14547fc13 <.text+0x547ec13>
14547fbf5:     	leaq	0x20(%r8), %r9
14547fbf9:     	cmpb	$0x7, 0x4(%rax,%r8)
14547fbff:     	movq	%r9, %r8
14547fc02:     	jne	0x14547fbf0 <.text+0x547ebf0>
14547fc04:     	movl	-0x20(%rax,%r9), %r8d
14547fc09:     	cmpl	%r8d, %edx
14547fc0c:     	cmoval	%edx, %r8d
14547fc10:     	movl	%r8d, %edx
14547fc13:     	xorl	%r8d, %r8d
14547fc16:     	nopw	%cs:(%rax,%rax)
14547fc20:     	cmpq	%r8, %rcx
14547fc23:     	je	0x14547fc43 <.text+0x547ec43>
14547fc25:     	leaq	0x20(%r8), %r9
14547fc29:     	cmpb	$0x8, 0x4(%rax,%r8)
14547fc2f:     	movq	%r9, %r8
14547fc32:     	jne	0x14547fc20 <.text+0x547ec20>
14547fc34:     	movl	-0x20(%rax,%r9), %r8d
14547fc39:     	cmpl	%r8d, %edx
14547fc3c:     	cmoval	%edx, %r8d
14547fc40:     	movl	%r8d, %edx
14547fc43:     	xorl	%r8d, %r8d
14547fc46:     	nopw	%cs:(%rax,%rax)
14547fc50:     	cmpq	%r8, %rcx
14547fc53:     	je	0x14547fc73 <.text+0x547ec73>
14547fc55:     	leaq	0x20(%r8), %r9
14547fc59:     	cmpb	$0x9, 0x4(%rax,%r8)
14547fc5f:     	movq	%r9, %r8
14547fc62:     	jne	0x14547fc50 <.text+0x547ec50>
14547fc64:     	movl	-0x20(%rax,%r9), %r8d
14547fc69:     	cmpl	%r8d, %edx
14547fc6c:     	cmoval	%edx, %r8d
14547fc70:     	movl	%r8d, %edx
14547fc73:     	xorl	%r8d, %r8d
14547fc76:     	nopw	%cs:(%rax,%rax)
14547fc80:     	cmpq	%r8, %rcx
14547fc83:     	je	0x14547fca3 <.text+0x547eca3>
14547fc85:     	leaq	0x20(%r8), %r9
14547fc89:     	cmpb	$0xb, 0x4(%rax,%r8)
14547fc8f:     	movq	%r9, %r8
14547fc92:     	jne	0x14547fc80 <.text+0x547ec80>
14547fc94:     	movl	-0x20(%rax,%r9), %r8d
14547fc99:     	cmpl	%r8d, %edx
14547fc9c:     	cmoval	%edx, %r8d
14547fca0:     	movl	%r8d, %edx
14547fca3:     	xorps	%xmm0, %xmm0
14547fca6:     	testb	%dil, %dil
14547fca9:     	je	0x14547fcf0 <.text+0x547ecf0>
14547fcab:     	xorl	%r8d, %r8d
14547fcae:     	xorl	%r9d, %r9d
14547fcb1:     	nopw	%cs:(%rax,%rax)
14547fcc0:     	cmpq	%r9, %rcx
14547fcc3:     	je	0x14547fcd8 <.text+0x547ecd8>
14547fcc5:     	leaq	0x20(%r9), %r10
14547fcc9:     	cmpb	%bl, 0x4(%rax,%r9)
14547fcce:     	movq	%r10, %r9
14547fcd1:     	jne	0x14547fcc0 <.text+0x547ecc0>
14547fcd3:     	movl	-0x20(%rax,%r10), %r8d
14547fcd8:     	cmpl	%edx, %r8d
14547fcdb:     	jae	0x14547fcf0 <.text+0x547ecf0>
14547fcdd:     	movzbl	%dil, %eax
14547fce1:     	xorps	%xmm0, %xmm0
14547fce4:     	cvtsi2ss	%eax, %xmm0
14547fce8:     	mulss	0x48782c(%rip), %xmm0   # 0x14590751c
14547fcf0:     	addq	$0x58, %rsp
14547fcf4:     	popq	%rbx
14547fcf5:     	popq	%rdi
14547fcf6:     	popq	%rsi
14547fcf7:     	popq	%r12
14547fcf9:     	popq	%r13
14547fcfb:     	popq	%r14
14547fcfd:     	popq	%r15
14547fcff:     	popq	%rbp
14547fd00:     	retq
14547fd01:     	movl	$0x4, %edi
14547fd06:     	xorl	%r14d, %r14d
14547fd09:     	testq	%r13, %r13
14547fd0c:     	jne	0x14547fa08 <.text+0x547ea08>
14547fd12:     	jmp	0x14547fa16 <.text+0x547ea16>
14547fd17:     	xorl	%edi, %edi
14547fd19:     	testq	%r15, %r15
14547fd1c:     	jne	0x14547faca <.text+0x547eaca>
14547fd22:     	jmp	0x14547fadf <.text+0x547eadf>
