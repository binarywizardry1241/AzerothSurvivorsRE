
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458bff90:     	pushq	%rbp
1458bff91:     	pushq	%r14
1458bff93:     	pushq	%rsi
1458bff94:     	pushq	%rdi
1458bff95:     	pushq	%rbx
1458bff96:     	subq	$0xb0, %rsp
1458bff9d:     	leaq	0x80(%rsp), %rbp
1458bffa5:     	movaps	%xmm6, 0x20(%rbp)
1458bffa9:     	movq	$-0x2, 0x18(%rbp)
1458bffb1:     	movaps	%xmm3, %xmm6
1458bffb4:     	movq	%rcx, %rsi
1458bffb7:     	leaq	(%r8,%r8,4), %r8
1458bffbb:     	shlq	$0x4, %r8
1458bffbf:     	addq	%rdx, %r8
1458bffc2:     	leaq	-0x30(%rbp), %rcx
1458bffc6:     	callq	0x14599cbe0 <.text+0x599bbe0>
1458bffcb:     	movq	-0x28(%rbp), %rcx
1458bffcf:     	movq	-0x20(%rbp), %rdi
1458bffd3:     	leaq	0x17(%rbp), %rax
1458bffd7:     	movq	%rax, -0x18(%rbp)
1458bffdb:     	cmpq	$0x2, %rdi
1458bffdf:     	movq	%rcx, 0x8(%rbp)
1458bffe3:     	jae	0x1458c0176 <.text+0x58bf176>
1458bffe9:     	leaq	(%rcx,%rdi,8), %rax
1458bffed:     	testq	%rdi, %rdi
1458bfff0:     	je	0x1458c000f <.text+0x58bf00f>
1458bfff2:     	leaq	-0x1(%rdi), %rdx
1458bfff6:     	movl	%edi, %r10d
1458bfff9:     	andl	$0x3, %r10d
1458bfffd:     	cmpq	$0x3, %rdx
1458c0001:     	jae	0x1458c0019 <.text+0x58bf019>
1458c0003:     	movsd	0x4ec56d(%rip), %xmm0   # 0x145dac578
1458c000b:     	xorl	%edx, %edx
1458c000d:     	jmp	0x1458c0069 <.text+0x58bf069>
1458c000f:     	movsd	0x4ec561(%rip), %xmm0   # 0x145dac578
1458c0017:     	jmp	0x1458c0082 <.text+0x58bf082>
1458c0019:     	andq	$-0x4, %rdi
1458c001d:     	movsd	0x4ec553(%rip), %xmm0   # 0x145dac578
1458c0025:     	xorl	%edx, %edx
1458c0027:     	nopw	(%rax,%rax)
1458c0030:     	movq	(%rcx,%rdx,8), %r8
1458c0034:     	movq	0x8(%rcx,%rdx,8), %r9
1458c0039:     	addsd	0x40(%r8), %xmm0
1458c003f:     	addsd	0x40(%r9), %xmm0
1458c0045:     	movq	0x10(%rcx,%rdx,8), %r8
1458c004a:     	addsd	0x40(%r8), %xmm0
1458c0050:     	movq	0x18(%rcx,%rdx,8), %r8
1458c0055:     	addsd	0x40(%r8), %xmm0
1458c005b:     	addq	$0x4, %rdx
1458c005f:     	cmpq	%rdx, %rdi
1458c0062:     	jne	0x1458c0030 <.text+0x58bf030>
1458c0064:     	testq	%r10, %r10
1458c0067:     	je	0x1458c0082 <.text+0x58bf082>
1458c0069:     	leaq	(%rcx,%rdx,8), %rdx
1458c006d:     	xorl	%r8d, %r8d
1458c0070:     	movq	(%rdx,%r8,8), %r9
1458c0074:     	addsd	0x40(%r9), %xmm0
1458c007a:     	incq	%r8
1458c007d:     	cmpq	%r8, %r10
1458c0080:     	jne	0x1458c0070 <.text+0x58bf070>
1458c0082:     	maxss	0x4ad2e2(%rip), %xmm6   # 0x145d6d36c
1458c008a:     	cvtss2sd	%xmm6, %xmm1
1458c008e:     	movsd	%xmm0, -0x38(%rbp)
1458c0093:     	movsd	%xmm1, -0x40(%rbp)
1458c0098:     	movq	%rcx, -0x18(%rbp)
1458c009c:     	movq	%rax, -0x10(%rbp)
1458c00a0:     	leaq	-0x40(%rbp), %rax
1458c00a4:     	movq	%rax, -0x8(%rbp)
1458c00a8:     	leaq	-0x38(%rbp), %rax
1458c00ac:     	movq	%rax, (%rbp)
1458c00b0:     	leaq	-0x58(%rbp), %rcx
1458c00b4:     	leaq	-0x18(%rbp), %rdx
1458c00b8:     	callq	0x1459a79e0 <.text+0x59a69e0>
1458c00bd:     	nop
1458c00be:     	movq	-0x50(%rbp), %rdi
1458c00c2:     	movq	-0x48(%rbp), %rbx
1458c00c6:     	movq	$0x1, 0x20(%rsp)
1458c00cf:     	leaq	0x12fe42a(%rip), %r9    # 0x146bbe500
1458c00d6:     	leaq	-0x18(%rbp), %rcx
1458c00da:     	movq	%rdi, %rdx
1458c00dd:     	movq	%rbx, %r8
1458c00e0:     	callq	0x1458b82d0 <.text+0x58b72d0>
1458c00e5:     	nop
1458c00e6:     	movq	-0x8(%rbp), %rax
1458c00ea:     	movq	%rax, 0x10(%rsi)
1458c00ee:     	movups	-0x18(%rbp), %xmm0
1458c00f2:     	movups	%xmm0, (%rsi)
1458c00f5:     	movq	-0x30(%rbp), %rdx
1458c00f9:     	testq	%rdx, %rdx
1458c00fc:     	je	0x1458c0111 <.text+0x58bf111>
1458c00fe:     	shlq	$0x3, %rdx
1458c0102:     	movl	$0x8, %r8d
1458c0108:     	movq	0x8(%rbp), %rcx
1458c010c:     	callq	0x1400021d0 <.text+0x11d0>
1458c0111:     	testq	%rbx, %rbx
1458c0114:     	je	0x1458c0142 <.text+0x58bf142>
1458c0116:     	leaq	0x8(%rdi), %r14
1458c011a:     	jmp	0x1458c0129 <.text+0x58bf129>
1458c011c:     	nopl	(%rax)
1458c0120:     	addq	$0x18, %r14
1458c0124:     	decq	%rbx
1458c0127:     	je	0x1458c0142 <.text+0x58bf142>
1458c0129:     	movq	-0x8(%r14), %rdx
1458c012d:     	testq	%rdx, %rdx
1458c0130:     	je	0x1458c0120 <.text+0x58bf120>
1458c0132:     	movq	(%r14), %rcx
1458c0135:     	movl	$0x1, %r8d
1458c013b:     	callq	0x1400021d0 <.text+0x11d0>
1458c0140:     	jmp	0x1458c0120 <.text+0x58bf120>
1458c0142:     	movq	-0x58(%rbp), %rax
1458c0146:     	testq	%rax, %rax
1458c0149:     	je	0x1458c0161 <.text+0x58bf161>
1458c014b:     	shlq	$0x3, %rax
1458c014f:     	leaq	(%rax,%rax,2), %rdx
1458c0153:     	movl	$0x8, %r8d
1458c0159:     	movq	%rdi, %rcx
1458c015c:     	callq	0x1400021d0 <.text+0x11d0>
1458c0161:     	movq	%rsi, %rax
1458c0164:     	movaps	0x20(%rbp), %xmm6
1458c0168:     	addq	$0xb0, %rsp
1458c016f:     	popq	%rbx
1458c0170:     	popq	%rdi
1458c0171:     	popq	%rsi
1458c0172:     	popq	%r14
1458c0174:     	popq	%rbp
1458c0175:     	retq
1458c0176:     	cmpq	$0x15, %rdi
1458c017a:     	jae	0x1458c019b <.text+0x58bf19b>
1458c017c:     	leaq	-0x18(%rbp), %r9
1458c0180:     	movl	$0x1, %r8d
1458c0186:     	movq	%rdi, %rdx
1458c0189:     	callq	0x145981c90 <.text+0x5980c90>
1458c018e:     	movq	0x8(%rbp), %rcx
1458c0192:     	leaq	(%rcx,%rdi,8), %rax
1458c0196:     	jmp	0x1458bfff2 <.text+0x58beff2>
1458c019b:     	leaq	-0x18(%rbp), %r8
1458c019f:     	movq	%rdi, %rdx
1458c01a2:     	callq	0x1459876b0 <.text+0x59866b0>
1458c01a7:     	nop
1458c01a8:     	jmp	0x1458c018e <.text+0x58bf18e>
