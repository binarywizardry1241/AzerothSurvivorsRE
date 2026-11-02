
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458bb9e0:     	pushq	%rbp
1458bb9e1:     	pushq	%r15
1458bb9e3:     	pushq	%r14
1458bb9e5:     	pushq	%r13
1458bb9e7:     	pushq	%r12
1458bb9e9:     	pushq	%rsi
1458bb9ea:     	pushq	%rdi
1458bb9eb:     	pushq	%rbx
1458bb9ec:     	subq	$0xf8, %rsp
1458bb9f3:     	leaq	0x80(%rsp), %rbp
1458bb9fb:     	movq	$-0x2, 0x70(%rbp)
1458bba03:     	movq	%rdx, 0x60(%rbp)
1458bba07:     	cmpq	$0x3, %r8
1458bba0b:     	jae	0x1458bbb0d <.text+0x58bab0d>
1458bba11:     	leaq	0x1300a1c(%rip), %rax   # 0x146bbc434
1458bba18:     	movq	%rax, -0x20(%rbp)
1458bba1c:     	movq	$0x34, -0x18(%rbp)
1458bba24:     	leaq	0x1300a3d(%rip), %rax   # 0x146bbc468
1458bba2b:     	movq	%rax, -0x10(%rbp)
1458bba2f:     	movq	$0x23, -0x8(%rbp)
1458bba37:     	leaq	0x1300a4d(%rip), %rax   # 0x146bbc48b
1458bba3e:     	movq	%rax, (%rbp)
1458bba42:     	movq	$0x31, 0x8(%rbp)
1458bba4a:     	leaq	0x1300a6b(%rip), %rax   # 0x146bbc4bc
1458bba51:     	movq	%rax, 0x10(%rbp)
1458bba55:     	movq	$0x2c, 0x18(%rbp)
1458bba5d:     	leaq	0x1300a84(%rip), %rax   # 0x146bbc4e8
1458bba64:     	movq	%rax, 0x20(%rbp)
1458bba68:     	movq	$0x29, 0x28(%rbp)
1458bba70:     	leaq	0x1300a9a(%rip), %rax   # 0x146bbc511
1458bba77:     	movq	%rax, 0x30(%rbp)
1458bba7b:     	movq	$0x2f, 0x38(%rbp)
1458bba83:     	leaq	0x1300ab6(%rip), %rax   # 0x146bbc540
1458bba8a:     	movq	%rax, 0x40(%rbp)
1458bba8e:     	movq	$0x28, 0x48(%rbp)
1458bba96:     	leaq	0x1300acb(%rip), %rax   # 0x146bbc568
1458bba9d:     	movq	%rax, 0x50(%rbp)
1458bbaa1:     	movq	$0x31, 0x58(%rbp)
1458bbaa9:     	shlq	$0x4, %rdx
1458bbaad:     	movq	-0x20(%rbp,%rdx), %rsi
1458bbab2:     	movq	-0x18(%rbp,%rdx), %rdi
1458bbab7:     	leaq	0x60(%rbp), %rax
1458bbabb:     	movq	%rax, -0x38(%rbp)
1458bbabf:     	leaq	0x2f33aa(%rip), %rax    # 0x145baee70 <.text+0x5bade70>
1458bbac6:     	movq	%rax, -0x30(%rbp)
1458bbaca:     	leaq	0x12fe65c(%rip), %rdx   # 0x146bba12d
1458bbad1:     	leaq	-0x20(%rbp), %rcx
1458bbad5:     	leaq	-0x38(%rbp), %r8
1458bbad9:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1458bbade:     	movq	-0x18(%rbp), %rcx
1458bbae2:     	movq	-0x10(%rbp), %rdx
1458bbae6:     	movq	%rcx, 0x68(%rbp)
1458bbaea:     	callq	0x1458da590 <.text+0x58d9590>
1458bbaef:     	nop
1458bbaf0:     	testq	%rax, %rax
1458bbaf3:     	cmoveq	%rdi, %rdx
1458bbaf7:     	cmovneq	%rax, %rsi
1458bbafb:     	movq	-0x20(%rbp), %rax
1458bbaff:     	testq	%rax, %rax
1458bbb02:     	jne	0x1458bbce2 <.text+0x58bace2>
1458bbb08:     	jmp	0x1458bbcfa <.text+0x58bacfa>
1458bbb0d:     	leal	-0x1(%rcx), %eax
1458bbb10:     	movl	$0x1, %esi
1458bbb15:     	cmpb	$0xa, %al
1458bbb17:     	ja	0x1458bbc6a <.text+0x58bac6a>
1458bbb1d:     	movzbl	%al, %eax
1458bbb20:     	movl	$0x5df, %r8d            # imm = 0x5DF
1458bbb26:     	btl	%eax, %r8d
1458bbb2a:     	jae	0x1458bbc6a <.text+0x58bac6a>
1458bbb30:     	shll	$0x3, %eax
1458bbb33:     	leaq	0x1302a26(%rip), %r8    # 0x146bbe560
1458bbb3a:     	movq	(%rax,%r8), %r8
1458bbb3e:     	movq	%r8, 0x68(%rbp)
1458bbb42:     	leaq	0x1302a6f(%rip), %r9    # 0x146bbe5b8
1458bbb49:     	movq	(%rax,%r9), %r8
1458bbb4d:     	movq	%r8, -0x58(%rbp)
1458bbb51:     	leaq	0x1302ab8(%rip), %r10   # 0x146bbe610
1458bbb58:     	movq	(%rax,%r10), %r8
1458bbb5c:     	movq	%r8, -0x50(%rbp)
1458bbb60:     	leaq	0x1302b01(%rip), %r11   # 0x146bbe668
1458bbb67:     	movq	(%rax,%r11), %r8
1458bbb6b:     	movq	%r8, -0x48(%rbp)
1458bbb6f:     	leaq	0x1302b4a(%rip), %rsi   # 0x146bbe6c0
1458bbb76:     	movq	(%rax,%rsi), %r8
1458bbb7a:     	movq	%r8, -0x40(%rbp)
1458bbb7e:     	leaq	0x1302b93(%rip), %rdi   # 0x146bbe718
1458bbb85:     	movq	(%rax,%rdi), %rdi
1458bbb89:     	leaq	0x1302be0(%rip), %rbx   # 0x146bbe770
1458bbb90:     	movq	(%rax,%rbx), %rbx
1458bbb94:     	leaq	0x1302c2d(%rip), %r14   # 0x146bbe7c8
1458bbb9b:     	movq	(%rax,%r14), %r14
1458bbb9f:     	leaq	0x1302c7a(%rip), %r15   # 0x146bbe820
1458bbba6:     	movq	(%rax,%r15), %r15
1458bbbaa:     	leaq	0x1302cc7(%rip), %r12   # 0x146bbe878
1458bbbb1:     	movq	(%rax,%r12), %r12
1458bbbb5:     	leaq	0x1302d14(%rip), %r13   # 0x146bbe8d0
1458bbbbc:     	movq	(%rax,%r13), %r13
1458bbbc0:     	leaq	0x1302d61(%rip), %r8    # 0x146bbe928
1458bbbc7:     	movq	(%rax,%r8), %r8
1458bbbcb:     	leaq	0x1302dae(%rip), %r9    # 0x146bbe980
1458bbbd2:     	movq	(%rax,%r9), %r9
1458bbbd6:     	leaq	0x1302dfb(%rip), %r10   # 0x146bbe9d8
1458bbbdd:     	movq	(%rax,%r10), %r10
1458bbbe1:     	leaq	0x1302e48(%rip), %r11   # 0x146bbea30
1458bbbe8:     	movq	(%rax,%r11), %r11
1458bbbec:     	leaq	0x1302e95(%rip), %rsi   # 0x146bbea88
1458bbbf3:     	movq	(%rax,%rsi), %rax
1458bbbf7:     	movq	0x68(%rbp), %rsi
1458bbbfb:     	movq	%rsi, -0x20(%rbp)
1458bbbff:     	movq	-0x58(%rbp), %rsi
1458bbc03:     	movq	%rsi, -0x18(%rbp)
1458bbc07:     	movq	-0x50(%rbp), %rsi
1458bbc0b:     	movq	%rsi, -0x10(%rbp)
1458bbc0f:     	movq	-0x48(%rbp), %rsi
1458bbc13:     	movq	%rsi, -0x8(%rbp)
1458bbc17:     	movq	-0x40(%rbp), %rsi
1458bbc1b:     	movq	%rsi, (%rbp)
1458bbc1f:     	movq	%rdi, 0x8(%rbp)
1458bbc23:     	movq	%rbx, 0x10(%rbp)
1458bbc27:     	movq	%r14, 0x18(%rbp)
1458bbc2b:     	movq	%r15, 0x20(%rbp)
1458bbc2f:     	movq	%r12, 0x28(%rbp)
1458bbc33:     	movq	%r13, 0x30(%rbp)
1458bbc37:     	movq	%r8, 0x38(%rbp)
1458bbc3b:     	movq	%r9, 0x40(%rbp)
1458bbc3f:     	movq	%r10, 0x48(%rbp)
1458bbc43:     	movq	%r11, 0x50(%rbp)
1458bbc47:     	movq	%rax, 0x58(%rbp)
1458bbc4b:     	shlq	$0x4, %rdx
1458bbc4f:     	movq	-0x20(%rbp,%rdx), %rsi
1458bbc54:     	movq	-0x18(%rbp,%rdx), %rdi
1458bbc59:     	addb	$-0x2, %cl
1458bbc5c:     	cmpb	$0x9, %cl
1458bbc5f:     	jbe	0x1458bbc74 <.text+0x58bac74>
1458bbc61:     	leaq	0x12efb40(%rip), %rax   # 0x146bab7a8
1458bbc68:     	jmp	0x1458bbc82 <.text+0x58bac82>
1458bbc6a:     	xorl	%edi, %edi
1458bbc6c:     	addb	$-0x2, %cl
1458bbc6f:     	cmpb	$0x9, %cl
1458bbc72:     	ja	0x1458bbc61 <.text+0x58bac61>
1458bbc74:     	movzbl	%cl, %eax
1458bbc77:     	leaq	0x13035da(%rip), %rcx   # 0x146bbf258
1458bbc7e:     	movq	(%rcx,%rax,8), %rax
1458bbc82:     	addq	$0x10, %rax
1458bbc86:     	movq	%rax, -0x20(%rbp)
1458bbc8a:     	leaq	-0x58b9bd1(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1458bbc91:     	movq	%rax, -0x18(%rbp)
1458bbc95:     	leaq	0x60(%rbp), %rax
1458bbc99:     	movq	%rax, -0x10(%rbp)
1458bbc9d:     	leaq	0x2f31cc(%rip), %rax    # 0x145baee70 <.text+0x5bade70>
1458bbca4:     	movq	%rax, -0x8(%rbp)
1458bbca8:     	leaq	0x12fe473(%rip), %rdx   # 0x146bba122
1458bbcaf:     	leaq	-0x38(%rbp), %rcx
1458bbcb3:     	leaq	-0x20(%rbp), %r8
1458bbcb7:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1458bbcbc:     	movq	-0x30(%rbp), %rcx
1458bbcc0:     	movq	-0x28(%rbp), %rdx
1458bbcc4:     	movq	%rcx, 0x68(%rbp)
1458bbcc8:     	callq	0x1458da590 <.text+0x58d9590>
1458bbccd:     	nop
1458bbcce:     	testq	%rax, %rax
1458bbcd1:     	cmoveq	%rdi, %rdx
1458bbcd5:     	cmovneq	%rax, %rsi
1458bbcd9:     	movq	-0x38(%rbp), %rax
1458bbcdd:     	testq	%rax, %rax
1458bbce0:     	je	0x1458bbcfa <.text+0x58bacfa>
1458bbce2:     	movl	$0x1, %r8d
1458bbce8:     	movq	0x68(%rbp), %rcx
1458bbcec:     	movq	%rdx, %rdi
1458bbcef:     	movq	%rax, %rdx
1458bbcf2:     	callq	0x1400021d0 <.text+0x11d0>
1458bbcf7:     	movq	%rdi, %rdx
1458bbcfa:     	movq	%rsi, %rax
1458bbcfd:     	addq	$0xf8, %rsp
1458bbd04:     	popq	%rbx
1458bbd05:     	popq	%rdi
1458bbd06:     	popq	%rsi
1458bbd07:     	popq	%r12
1458bbd09:     	popq	%r13
1458bbd0b:     	popq	%r14
1458bbd0d:     	popq	%r15
1458bbd0f:     	popq	%rbp
1458bbd10:     	retq
