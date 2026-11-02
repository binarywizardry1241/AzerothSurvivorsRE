
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e3ff0:     	pushq	%rbp
1454e3ff1:     	pushq	%rsi
1454e3ff2:     	pushq	%rdi
1454e3ff3:     	pushq	%rbx
1454e3ff4:     	subq	$0xb8, %rsp
1454e3ffb:     	leaq	0x80(%rsp), %rbp
1454e4003:     	movq	$-0x2, 0x30(%rbp)
1454e400b:     	movq	0x4e8(%rcx), %r9
1454e4012:     	testq	%r9, %r9
1454e4015:     	je	0x1454e41b8 <.text+0x54e31b8>
1454e401b:     	movq	%rcx, %rax
1454e401e:     	movq	0x4e0(%rcx), %rcx
1454e4025:     	imulq	$0x160, %r9, %r9        # imm = 0x160
1454e402c:     	jmp	0x1454e4044 <.text+0x54e3044>
1454e402e:     	nop
1454e4030:     	addq	$0x160, %rcx            # imm = 0x160
1454e4037:     	addq	$-0x160, %r9            # imm = 0xFEA0
1454e403e:     	je	0x1454e41b8 <.text+0x54e31b8>
1454e4044:     	cmpq	%rdx, 0x88(%rcx)
1454e404b:     	jne	0x1454e4030 <.text+0x54e3030>
1454e404d:     	cmpb	$0x0, 0x68(%rcx)
1454e4051:     	jne	0x1454e4030 <.text+0x54e3030>
1454e4053:     	cmpl	%r8d, 0xb0(%rcx)
1454e405a:     	movq	%rax, %rbx
1454e405d:     	je	0x1454e407e <.text+0x54e307e>
1454e405f:     	cmpl	%r8d, 0xb4(%rcx)
1454e4066:     	je	0x1454e407e <.text+0x54e307e>
1454e4068:     	cmpl	%r8d, 0xb8(%rcx)
1454e406f:     	je	0x1454e407e <.text+0x54e307e>
1454e4071:     	cmpl	%r8d, 0xbc(%rcx)
1454e4078:     	jne	0x1454e41c4 <.text+0x54e31c4>
1454e407e:     	xorl	%esi, %esi
1454e4080:     	movq	%rdx, %rdi
1454e4083:     	movq	$0x0, -0x10(%rbp)
1454e408b:     	movq	$0x0, (%rbp)
1454e4093:     	movq	%rsi, %rdx
1454e4096:     	callq	0x1454506a0 <.text+0x544f6a0>
1454e409b:     	nop
1454e409c:     	addq	$0x79, %rsi
1454e40a0:     	leaq	-0x10(%rbp), %rcx
1454e40a4:     	movq	%rcx, -0x40(%rbp)
1454e40a8:     	xorps	%xmm0, %xmm0
1454e40ab:     	movups	%xmm0, -0x38(%rbp)
1454e40af:     	movq	%rsi, -0x20(%rbp)
1454e40b3:     	leaq	-0x60(%rbp), %rcx
1454e40b7:     	leaq	-0x40(%rbp), %rdx
1454e40bb:     	movl	%eax, %r8d
1454e40be:     	callq	0x14552a730 <.text+0x5529730>
1454e40c3:     	nop
1454e40c4:     	cmpq	$0x0, (%rbp)
1454e40c9:     	movl	$0x0, 0x20(%rbp)
1454e40d0:     	movq	$0x0, 0x8(%rbp)
1454e40d8:     	movq	$0x1, 0x10(%rbp)
1454e40e0:     	movq	$0x0, 0x18(%rbp)
1454e40e8:     	je	0x1454e412d <.text+0x54e312d>
1454e40ea:     	movb	$0x1, 0x2f(%rbp)
1454e40ee:     	leaq	0x8(%rbp), %rcx
1454e40f2:     	callq	0x145903690 <.text+0x5902690>
1454e40f7:     	nop
1454e40f8:     	movq	0x10(%rbp), %rax
1454e40fc:     	movb	$0x0, (%rax)
1454e40ff:     	movq	$0x1, 0x18(%rbp)
1454e4107:     	movb	$0x1, 0x2f(%rbp)
1454e410b:     	leaq	0x8(%rbp), %rdx
1454e410f:     	movq	%rdi, %rcx
1454e4112:     	callq	0x14551c6a0 <.text+0x551b6a0>
1454e4117:     	nop
1454e4118:     	movb	$0x1, 0x2f(%rbp)
1454e411c:     	leaq	-0x10(%rbp), %rcx
1454e4120:     	leaq	0x8(%rbp), %rdx
1454e4124:     	callq	0x145513880 <.text+0x5512880>
1454e4129:     	nop
1454e412a:     	incl	0x20(%rbp)
1454e412d:     	movq	0x8(%rbp), %rax
1454e4131:     	movq	0x10(%rbp), %rcx
1454e4135:     	movq	0x18(%rbp), %rdx
1454e4139:     	movq	%rdx, -0x30(%rbp)
1454e413d:     	movl	0x20(%rbp), %edx
1454e4140:     	movl	%edx, -0x28(%rbp)
1454e4143:     	movl	0x24(%rbp), %edx
1454e4146:     	movl	%edx, -0x24(%rbp)
1454e4149:     	movq	%rax, -0x40(%rbp)
1454e414d:     	movq	%rcx, -0x38(%rbp)
1454e4151:     	movb	$0x0, 0x2f(%rbp)
1454e4155:     	leaq	-0x60(%rbp), %rcx
1454e4159:     	leaq	-0x40(%rbp), %rdx
1454e415d:     	callq	0x145512ef0 <.text+0x5511ef0>
1454e4162:     	nop
1454e4163:     	movq	%rbx, %rax
1454e4166:     	movq	0x560(%rbx), %rsi
1454e416d:     	cmpq	0x550(%rbx), %rsi
1454e4174:     	jne	0x1454e4185 <.text+0x54e3185>
1454e4176:     	leaq	0x550(%rax), %rcx
1454e417d:     	callq	0x145774710 <.text+0x5773710>
1454e4182:     	movq	%rbx, %rax
1454e4185:     	movq	0x558(%rax), %rcx
1454e418c:     	movq	%rsi, %rdx
1454e418f:     	shlq	$0x5, %rdx
1454e4193:     	movups	-0x60(%rbp), %xmm0
1454e4197:     	movups	-0x50(%rbp), %xmm1
1454e419b:     	movups	%xmm1, 0x10(%rcx,%rdx)
1454e41a0:     	movups	%xmm0, (%rcx,%rdx)
1454e41a4:     	incq	%rsi
1454e41a7:     	movq	%rsi, 0x560(%rax)
1454e41ae:     	leaq	-0x10(%rbp), %rcx
1454e41b2:     	callq	0x14550cd20 <.text+0x550bd20>
1454e41b7:     	nop
1454e41b8:     	addq	$0xb8, %rsp
1454e41bf:     	popq	%rbx
1454e41c0:     	popq	%rdi
1454e41c1:     	popq	%rsi
1454e41c2:     	popq	%rbp
1454e41c3:     	retq
1454e41c4:     	movl	$0x1, %esi
1454e41c9:     	cmpl	%r8d, 0xc0(%rcx)
1454e41d0:     	je	0x1454e4080 <.text+0x54e3080>
1454e41d6:     	cmpl	%r8d, 0xc4(%rcx)
1454e41dd:     	je	0x1454e4080 <.text+0x54e3080>
1454e41e3:     	cmpl	%r8d, 0xc8(%rcx)
1454e41ea:     	je	0x1454e4080 <.text+0x54e3080>
1454e41f0:     	cmpl	%r8d, 0xcc(%rcx)
1454e41f7:     	je	0x1454e4080 <.text+0x54e3080>
1454e41fd:     	movl	$0x2, %esi
1454e4202:     	cmpl	%r8d, 0xd0(%rcx)
1454e4209:     	je	0x1454e4080 <.text+0x54e3080>
1454e420f:     	cmpl	%r8d, 0xd4(%rcx)
1454e4216:     	je	0x1454e4080 <.text+0x54e3080>
1454e421c:     	cmpl	%r8d, 0xd8(%rcx)
1454e4223:     	je	0x1454e4080 <.text+0x54e3080>
1454e4229:     	cmpl	%r8d, 0xdc(%rcx)
1454e4230:     	je	0x1454e4080 <.text+0x54e3080>
1454e4236:     	movl	$0x3, %esi
1454e423b:     	cmpl	%r8d, 0xe0(%rcx)
1454e4242:     	je	0x1454e4080 <.text+0x54e3080>
1454e4248:     	cmpl	%r8d, 0xe4(%rcx)
1454e424f:     	je	0x1454e4080 <.text+0x54e3080>
1454e4255:     	cmpl	%r8d, 0xe8(%rcx)
1454e425c:     	je	0x1454e4080 <.text+0x54e3080>
1454e4262:     	cmpl	%r8d, 0xec(%rcx)
1454e4269:     	jne	0x1454e41b8 <.text+0x54e31b8>
1454e426f:     	jmp	0x1454e4080 <.text+0x54e3080>
