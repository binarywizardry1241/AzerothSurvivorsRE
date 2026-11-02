
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401adcf0:     	pushq	%rbp
1401adcf1:     	pushq	%r15
1401adcf3:     	pushq	%r14
1401adcf5:     	pushq	%r13
1401adcf7:     	pushq	%r12
1401adcf9:     	pushq	%rsi
1401adcfa:     	pushq	%rdi
1401adcfb:     	pushq	%rbx
1401adcfc:     	subq	$0x9d8, %rsp            # imm = 0x9D8
1401add03:     	leaq	0x80(%rsp), %rbp
1401add0b:     	movaps	%xmm6, 0x940(%rbp)
1401add12:     	movq	$-0x2, 0x938(%rbp)
1401add1d:     	cmpl	$0x2, 0x4c0(%rdx)
1401add24:     	je	0x1401adf52 <.text+0x1acf52>
1401add2a:     	movq	%rdx, %r14
1401add2d:     	movq	%rcx, 0x918(%rbp)
1401add34:     	leaq	0x4c0(%rdx), %rax
1401add3b:     	movq	%rax, 0x920(%rbp)
1401add42:     	leaq	0x730(%rdx), %rax
1401add49:     	movq	%rax, 0x908(%rbp)
1401add50:     	leaq	0x468(%rbp), %rdi
1401add57:     	leaq	0x6c0(%rbp), %r15
1401add5e:     	leaq	0x450(%rbp), %r13
1401add65:     	leaq	0x908(%rbp), %r12
1401add6c:     	leaq	0x6b0(%rbp), %rsi
1401add73:     	movq	%rdx, 0x930(%rbp)
1401add7a:     	jmp	0x1401add90 <.text+0x1acd90>
1401add7c:     	nopl	(%rax)
1401add80:     	testq	%r14, %r14
1401add83:     	jne	0x1401adf74 <.text+0x1acf74>
1401add89:     	movq	0x930(%rbp), %r14
1401add90:     	movq	%r13, %rcx
1401add93:     	leaq	0x4c0(%r14), %rdx
1401add9a:     	callq	0x14571ef40 <.text+0x571df40>
1401add9f:     	cmpl	$0x1, 0x450(%rbp)
1401adda6:     	jne	0x1401adef4 <.text+0x1acef4>
1401addac:     	movq	0x458(%rbp), %rbx
1401addb3:     	movq	0x460(%rbp), %r14
1401addba:     	testq	%rbx, %rbx
1401addbd:     	je	0x1401ade60 <.text+0x1ace60>
1401addc3:     	movq	%r14, 0x200(%rbp)
1401addca:     	movl	$0x248, %r8d            # imm = 0x248
1401addd0:     	leaq	0x208(%rbp), %rcx
1401addd7:     	movq	%rdi, %rdx
1401addda:     	callq	0x1457731ed <.text+0x57721ed>
1401adddf:     	movq	$0x0, 0x1f8(%rbp)
1401addea:     	movq	%r14, 0x6b8(%rbp)
1401addf1:     	movl	$0x248, %r8d            # imm = 0x248
1401addf7:     	movq	%r15, %rcx
1401addfa:     	movq	%rdi, %rdx
1401addfd:     	callq	0x1457731ed <.text+0x57721ed>
1401ade02:     	movq	%rbx, 0x928(%rbp)
1401ade09:     	movq	%rbx, 0x6b0(%rbp)
1401ade10:     	movq	%r12, %rcx
1401ade13:     	movq	%rsi, %rdx
1401ade16:     	callq	0x1402852f0 <.text+0x2842f0>
1401ade1b:     	nop
1401ade1c:     	testb	%al, %al
1401ade1e:     	je	0x1401adeb0 <.text+0x1aceb0>
1401ade24:     	movq	0x6b0(%rbp), %r14
1401ade2b:     	movl	$0x250, %r8d            # imm = 0x250
1401ade31:     	leaq	-0x58(%rbp), %rcx
1401ade35:     	leaq	0x6b8(%rbp), %rdx
1401ade3c:     	callq	0x1457731ed <.text+0x57721ed>
1401ade41:     	movq	0x1f8(%rbp), %rax
1401ade48:     	testq	%rax, %rax
1401ade4b:     	jne	0x1401aded9 <.text+0x1aced9>
1401ade51:     	jmp	0x1401add80 <.text+0x1acd80>
1401ade56:     	nopw	%cs:(%rax,%rax)
1401ade60:     	movl	%r14d, %eax
1401ade63:     	andl	$0x3, %eax
1401ade66:     	leal	-0x2(%rax), %ecx
1401ade69:     	cmpl	$0x2, %ecx
1401ade6c:     	jb	0x1401add89 <.text+0x1acd89>
1401ade72:     	testq	%rax, %rax
1401ade75:     	je	0x1401add89 <.text+0x1acd89>
1401ade7b:     	decq	%r14
1401ade7e:     	movq	%r14, 0x6b8(%rbp)
1401ade85:     	movb	$0x3, 0x6b0(%rbp)
1401ade8c:     	leaq	0x6b8(%rbp), %rcx
1401ade93:     	callq	0x14573b330 <.text+0x573a330>
1401ade98:     	movq	0x930(%rbp), %r14
1401ade9f:     	jmp	0x1401add90 <.text+0x1acd90>
1401adea4:     	nopw	%cs:(%rax,%rax)
1401adeb0:     	movq	0x928(%rbp), %rax
1401adeb7:     	lock
1401adeb8:     	decq	(%rax)
1401adebb:     	jne	0x1401adec6 <.text+0x1acec6>
1401adebd:     	movq	%rsi, %rcx
1401adec0:     	callq	0x144af4d00 <.text+0x4af3d00>
1401adec5:     	nop
1401adec6:     	xorl	%r14d, %r14d
1401adec9:     	movq	0x1f8(%rbp), %rax
1401aded0:     	testq	%rax, %rax
1401aded3:     	je	0x1401add80 <.text+0x1acd80>
1401aded9:     	lock
1401adeda:     	decq	(%rax)
1401adedd:     	jne	0x1401add80 <.text+0x1acd80>
1401adee3:     	leaq	0x1f8(%rbp), %rcx
1401adeea:     	callq	0x144af4d00 <.text+0x4af3d00>
1401adeef:     	jmp	0x1401add80 <.text+0x1acd80>
1401adef4:     	leaq	0x4c0(%r14), %rax
1401adefb:     	movq	(%rax), %rax
1401adefe:     	testq	%rax, %rax
1401adf01:     	je	0x1401adf1c <.text+0x1acf1c>
1401adf03:     	cmpl	$0x2, %eax
1401adf06:     	movq	0x930(%rbp), %rax
1401adf0d:     	je	0x1401adf3d <.text+0x1acf3d>
1401adf0f:     	leaq	0x4c8(%rax), %rcx
1401adf16:     	callq	0x14571bee0 <.text+0x571aee0>
1401adf1b:     	nop
1401adf1c:     	movq	0x930(%rbp), %rcx
1401adf23:     	movq	0x4d0(%rcx), %rax
1401adf2a:     	lock
1401adf2b:     	decq	(%rax)
1401adf2e:     	jne	0x1401adf3d <.text+0x1acf3d>
1401adf30:     	addq	$0x4d0, %rcx            # imm = 0x4D0
1401adf37:     	callq	0x144af4d00 <.text+0x4af3d00>
1401adf3c:     	nop
1401adf3d:     	movq	0x920(%rbp), %rax
1401adf44:     	movq	$0x2, (%rax)
1401adf4b:     	movq	0x918(%rbp), %rcx
1401adf52:     	movq	$-0x1, (%rcx)
1401adf59:     	movaps	0x940(%rbp), %xmm6
1401adf60:     	addq	$0x9d8, %rsp            # imm = 0x9D8
1401adf67:     	popq	%rbx
1401adf68:     	popq	%rdi
1401adf69:     	popq	%rsi
1401adf6a:     	popq	%r12
1401adf6c:     	popq	%r13
1401adf6e:     	popq	%r14
1401adf70:     	popq	%r15
1401adf72:     	popq	%rbp
1401adf73:     	retq
1401adf74:     	leaq	0x6b8(%rbp), %rcx
1401adf7b:     	leaq	-0x58(%rbp), %rdx
1401adf7f:     	movl	$0x250, %r8d            # imm = 0x250
1401adf85:     	callq	0x1457731ed <.text+0x57721ed>
1401adf8a:     	movq	%r14, 0x6b0(%rbp)
1401adf91:     	movsd	0x6cc(%rbp), %xmm6
1401adf99:     	movq	%r14, 0x910(%rbp)
1401adfa0:     	leaq	-0x58(%rbp), %rcx
1401adfa4:     	leaq	0x6b0(%rbp), %rdx
1401adfab:     	callq	0x145709f90 <.text+0x5708f90>
1401adfb0:     	nop
1401adfb1:     	movq	-0x50(%rbp), %rdx
1401adfb5:     	movq	-0x48(%rbp), %r8
1401adfb9:     	leaq	0x450(%rbp), %rcx
1401adfc0:     	movq	%rdx, 0x920(%rbp)
1401adfc7:     	callq	0x1457275d0 <.text+0x57265d0>
1401adfcc:     	nop
1401adfcd:     	movq	0x450(%rbp), %rax
1401adfd4:     	movq	0x458(%rbp), %r14
1401adfdb:     	movq	0x460(%rbp), %rsi
1401adfe2:     	cmpq	$-0x1, %rax
1401adfe6:     	je	0x1401ae0ad <.text+0x1ad0ad>
1401adfec:     	movq	%rax, 0x930(%rbp)
1401adff3:     	movq	%r14, 0x928(%rbp)
1401adffa:     	leaq	0x1f8(%rbp), %rcx
1401ae001:     	leaq	0x6b0(%rbp), %rdx
1401ae008:     	callq	0x145709e80 <.text+0x5708e80>
1401ae00d:     	nop
1401ae00e:     	movups	0x1f8(%rbp), %xmm0
1401ae015:     	movups	0x208(%rbp), %xmm1
1401ae01c:     	movups	%xmm1, 0x464(%rbp)
1401ae023:     	movups	%xmm0, 0x454(%rbp)
1401ae02a:     	movq	-0x58(%rbp), %rdx
1401ae02e:     	testq	%rdx, %rdx
1401ae031:     	je	0x1401ae045 <.text+0x1ad045>
1401ae033:     	movl	$0x1, %r8d
1401ae039:     	movq	0x920(%rbp), %rcx
1401ae040:     	callq	0x1400021d0 <.text+0x11d0>
1401ae045:     	movq	0x6b0(%rbp), %rax
1401ae04c:     	lock
1401ae04d:     	decq	(%rax)
1401ae050:     	movq	0x928(%rbp), %rdi
1401ae057:     	jne	0x1401ae065 <.text+0x1ad065>
1401ae059:     	leaq	0x6b0(%rbp), %rcx
1401ae060:     	callq	0x144af4d00 <.text+0x4af3d00>
1401ae065:     	movq	0x918(%rbp), %rcx
1401ae06c:     	movq	0x930(%rbp), %rax
1401ae073:     	movq	%rax, (%rcx)
1401ae076:     	movq	%rdi, 0x8(%rcx)
1401ae07a:     	movq	%rsi, 0x10(%rcx)
1401ae07e:     	movl	$0x1, 0x18(%rcx)
1401ae085:     	movlps	%xmm6, 0x1c(%rcx)
1401ae089:     	movups	0x450(%rbp), %xmm0
1401ae090:     	movups	0x460(%rbp), %xmm1
1401ae097:     	movups	%xmm0, 0x24(%rcx)
1401ae09b:     	movups	%xmm1, 0x34(%rcx)
1401ae09f:     	movl	0x470(%rbp), %eax
1401ae0a5:     	movl	%eax, 0x44(%rcx)
1401ae0a8:     	jmp	0x1401adf59 <.text+0x1acf59>
1401ae0ad:     	testq	%rsi, %rsi
1401ae0b0:     	jns	0x1401ae0c2 <.text+0x1ad0c2>
1401ae0b2:     	xorl	%edi, %edi
1401ae0b4:     	movq	%rdi, %rcx
1401ae0b7:     	movq	%rsi, %rdx
1401ae0ba:     	callq	0x14590379b <.text+0x590279b>
1401ae0bf:     	nop
1401ae0c0:     	ud2
1401ae0c2:     	je	0x1401ae104 <.text+0x1ad104>
1401ae0c4:     	callq	0x140002200 <.text+0x1200>
1401ae0c9:     	movl	$0x1, %edi
1401ae0ce:     	movl	$0x1, %edx
1401ae0d3:     	movq	%rsi, %rcx
1401ae0d6:     	callq	0x1400021c0 <.text+0x11c0>
1401ae0db:     	testq	%rax, %rax
1401ae0de:     	je	0x1401ae0b4 <.text+0x1ad0b4>
1401ae0e0:     	movq	%rax, %rbx
1401ae0e3:     	movq	%rax, %rcx
1401ae0e6:     	movq	%r14, %rdx
1401ae0e9:     	movq	%rsi, %r8
1401ae0ec:     	callq	0x1457731ed <.text+0x57721ed>
1401ae0f1:     	movq	%rbx, 0x928(%rbp)
1401ae0f8:     	movq	%rsi, 0x930(%rbp)
1401ae0ff:     	jmp	0x1401adffa <.text+0x1acffa>
1401ae104:     	movl	$0x1, %eax
1401ae109:     	movq	%rax, 0x928(%rbp)
1401ae110:     	xorl	%esi, %esi
1401ae112:     	movq	$0x0, 0x930(%rbp)
1401ae11d:     	jmp	0x1401adffa <.text+0x1acffa>
