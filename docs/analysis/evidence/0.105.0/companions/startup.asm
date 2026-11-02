
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145918950:     	testq	%rdi, %rdi
145918953:     	js	0x145918960 <.text+0x5917960>
145918955:     	cvtsi2ss	%rdi, %xmm15
14591895a:     	jmp	0x145918978 <.text+0x5917978>
14591895c:     	nopl	(%rax)
145918960:     	movq	%rdi, %rax
145918963:     	shrq	%rax
145918966:     	movl	%edi, %ecx
145918968:     	andl	$0x1, %ecx
14591896b:     	orq	%rax, %rcx
14591896e:     	cvtsi2ss	%rcx, %xmm15
145918973:     	addss	%xmm15, %xmm15
145918978:     	movq	(%rdx), %rax
14591897b:     	movq	%rax, 0x190(%rbp)
145918982:     	movq	%rdx, 0xf8(%rbp)
145918989:     	movzbl	0x8(%rdx), %eax
14591898d:     	movb	%al, 0x180(%rbp)
145918993:     	mulss	0x454edc(%rip), %xmm15  # 0x145d6d878
14591899c:     	addss	%xmm10, %xmm15
1459189a1:     	mulss	%xmm11, %xmm15
1459189a6:     	movq	0x138(%rbp), %rsi
1459189ad:     	movss	0x4d4(%rsi), %xmm7
1459189b5:     	addss	%xmm15, %xmm7
1459189ba:     	movaps	%xmm7, %xmm0
1459189bd:     	callq	0x145bc97c3 <.text+0x5bc87c3>
1459189c2:     	movaps	%xmm0, %xmm6
1459189c5:     	movaps	%xmm7, %xmm0
1459189c8:     	callq	0x145bc97bd <.text+0x5bc87bd>
1459189cd:     	movsd	0x4c8(%rsi), %xmm1
1459189d5:     	unpcklps	%xmm0, %xmm6            # xmm6 = xmm6[0],xmm0[0],xmm6[1],xmm0[1]
1459189d8:     	addps	%xmm6, %xmm6
1459189db:     	addps	%xmm1, %xmm6
1459189de:     	movshdup	%xmm6, %xmm8            # xmm8 = xmm6[1,1,3,3]
1459189e3:     	movq	0x950(%rsi), %rsi
1459189ea:     	leaq	0x10(%rsi), %rcx
1459189ee:     	movaps	%xmm6, %xmm1
1459189f1:     	movaps	%xmm8, %xmm2
1459189f5:     	callq	0x1458c7b60 <.text+0x58c6b60>
1459189fa:     	nop
1459189fb:     	testb	$0x1, %al
1459189fd:     	movq	%rdi, 0xf0(%rbp)
145918a04:     	je	0x145918a10 <.text+0x5917a10>
145918a06:     	movaps	%xmm0, %xmm7
145918a09:     	jmp	0x145918a58 <.text+0x5917a58>
145918a0b:     	nopl	(%rax,%rax)
145918a10:     	cmpq	$-0x1, 0x68(%rsi)
145918a15:     	je	0x145918a50 <.text+0x5917a50>
145918a17:     	leaq	0x68(%rsi), %rdx
145918a1b:     	leaq	0x140(%rbp), %rcx
145918a22:     	movaps	%xmm6, %xmm2
145918a25:     	movaps	%xmm8, %xmm3
145918a29:     	callq	0x1458cc950 <.text+0x58cb950>
145918a2e:     	nop
145918a2f:     	cmpl	$0x1, 0x140(%rbp)
145918a36:     	jne	0x145918a50 <.text+0x5917a50>
145918a38:     	movss	0x14c(%rbp), %xmm7
145918a40:     	jmp	0x145918a58 <.text+0x5917a58>
145918a42:     	nopw	%cs:(%rax,%rax)
145918a50:     	movss	0xb8(%rsi), %xmm7
145918a58:     	movq	0x190(%rbp), %rax
145918a5f:     	movl	0x58(%rax), %eax
145918a62:     	movq	0x138(%rbp), %rcx
145918a69:     	movl	0xa0c(%rcx), %edi
145918a6f:     	incl	%edi
145918a71:     	movl	%edi, 0xa0c(%rcx)
145918a77:     	andl	$0xffffff, %eax         # imm = 0xFFFFFF
145918a7c:     	shlq	$0x18, %rax
145918a80:     	andl	$0xffffff, %edi         # imm = 0xFFFFFF
145918a86:     	orq	%rax, %rdi
145918a89:     	movabsq	$-0xed0000000000000, %rax # imm = 0xF130000000000000
145918a93:     	orq	%rax, %rdi
145918a96:     	movq	$0x0, 0x100(%rbp)
145918aa1:     	movq	$0x0, 0x110(%rbp)
145918aac:     	leaq	0x100(%rbp), %rcx
145918ab3:     	xorl	%edx, %edx
145918ab5:     	movq	%rdi, %r8
145918ab8:     	callq	0x1458a8ba0 <.text+0x58a7ba0>
145918abd:     	nop
145918abe:     	movq	0x100(%rbp), %rax
145918ac5:     	testq	%rax, %rax
145918ac8:     	je	0x145918b40 <.text+0x5917b40>
145918aca:     	movq	0x108(%rbp), %rcx
145918ad1:     	movzwl	0x36(%rax), %r8d
145918ad6:     	movl	%r8d, %r9d
145918ad9:     	addl	%r9d, %r9d
145918adc:     	movq	$-0x1, %rdx
145918ae3:     	nopw	%cs:(%rax,%rax)
145918af0:     	testq	%r9, %r9
145918af3:     	je	0x145918b20 <.text+0x5917b20>
145918af5:     	cmpw	0x3a(%rax,%rdx,2), %bx
145918afa:     	seta	%r10b
145918afe:     	sbbb	$0x0, %r10b
145918b02:     	incq	%rdx
145918b05:     	addq	$-0x2, %r9
145918b09:     	cmpb	$0x1, %r10b
145918b0d:     	je	0x145918af0 <.text+0x5917af0>
145918b0f:     	movzbl	%r10b, %r8d
145918b13:     	testl	%r8d, %r8d
145918b16:     	je	0x145918b30 <.text+0x5917b30>
145918b18:     	subq	$0x1, %rcx
145918b1c:     	jae	0x145918b29 <.text+0x5917b29>
145918b1e:     	jmp	0x145918b42 <.text+0x5917b42>
145918b20:     	movq	%r8, %rdx
145918b23:     	subq	$0x1, %rcx
145918b27:     	jb	0x145918b42 <.text+0x5917b42>
145918b29:     	movq	0x50(%rax,%rdx,8), %rax
145918b2e:     	jmp	0x145918ad1 <.text+0x5917ad1>
145918b30:     	movl	$0x9, 0x8(%rax,%rdx,4)
145918b38:     	jmp	0x145918b8e <.text+0x5917b8e>
145918b3a:     	nopw	(%rax,%rax)
145918b40:     	xorl	%eax, %eax
145918b42:     	leaq	0x100(%rbp), %rcx
145918b49:     	movq	%rcx, 0x140(%rbp)
145918b50:     	movq	%rax, 0x148(%rbp)
145918b57:     	movq	$0x0, 0x150(%rbp)
145918b62:     	movq	%rdx, 0x158(%rbp)
145918b69:     	movq	$0x2, 0x160(%rbp)
145918b74:     	leaq	0x118(%rbp), %rcx
145918b7b:     	leaq	0x140(%rbp), %rdx
145918b82:     	movl	$0x9, %r8d
145918b88:     	callq	0x1458e1710 <.text+0x58e0710>
145918b8d:     	nop
145918b8e:     	movq	0x190(%rbp), %rax
145918b95:     	movl	0x58(%rax), %r8d
145918b99:     	movq	0x100(%rbp), %rax
145918ba0:     	testq	%rax, %rax
145918ba3:     	je	0x145918c20 <.text+0x5917c20>
145918ba5:     	movq	0x108(%rbp), %rcx
145918bac:     	movzwl	0x36(%rax), %r9d
145918bb1:     	movl	%r9d, %r10d
145918bb4:     	addl	%r10d, %r10d
145918bb7:     	movq	$-0x1, %rdx
145918bbe:     	nop
145918bc0:     	testq	%r10, %r10
145918bc3:     	je	0x145918c00 <.text+0x5917c00>
145918bc5:     	cmpw	0x3a(%rax,%rdx,2), %r14w
145918bcb:     	seta	%r11b
145918bcf:     	sbbb	$0x0, %r11b
145918bd3:     	incq	%rdx
145918bd6:     	addq	$-0x2, %r10
145918bda:     	cmpb	$0x1, %r11b
145918bde:     	je	0x145918bc0 <.text+0x5917bc0>
145918be0:     	movzbl	%r11b, %r9d
145918be4:     	testl	%r9d, %r9d
145918be7:     	je	0x145918c10 <.text+0x5917c10>
145918be9:     	subq	$0x1, %rcx
145918bed:     	jae	0x145918c09 <.text+0x5917c09>
145918bef:     	jmp	0x145918c22 <.text+0x5917c22>
145918bf1:     	nopw	%cs:(%rax,%rax)
145918c00:     	movq	%r9, %rdx
145918c03:     	subq	$0x1, %rcx
145918c07:     	jb	0x145918c22 <.text+0x5917c22>
145918c09:     	movq	0x50(%rax,%rdx,8), %rax
145918c0e:     	jmp	0x145918bac <.text+0x5917bac>
145918c10:     	movl	%r8d, 0x8(%rax,%rdx,4)
145918c15:     	jmp	0x145918c68 <.text+0x5917c68>
145918c17:     	nopw	(%rax,%rax)
145918c20:     	xorl	%eax, %eax
145918c22:     	leaq	0x100(%rbp), %rcx
145918c29:     	movq	%rcx, 0x140(%rbp)
145918c30:     	movq	%rax, 0x148(%rbp)
145918c37:     	movq	$0x0, 0x150(%rbp)
145918c42:     	movq	%rdx, 0x158(%rbp)
145918c49:     	movq	$0x3, 0x160(%rbp)
145918c54:     	leaq	0x118(%rbp), %rcx
145918c5b:     	leaq	0x140(%rbp), %rdx
145918c62:     	callq	0x1458e1710 <.text+0x58e0710>
145918c67:     	nop
145918c68:     	movq	0x190(%rbp), %rax
145918c6f:     	movd	0x54(%rax), %xmm0
145918c74:     	movq	0x100(%rbp), %rax
145918c7b:     	testq	%rax, %rax
145918c7e:     	je	0x145918d00 <.text+0x5917d00>
145918c84:     	movq	0x108(%rbp), %rcx
145918c8b:     	movzwl	0x36(%rax), %r8d
145918c90:     	movl	%r8d, %r9d
145918c93:     	addl	%r9d, %r9d
145918c96:     	movq	$-0x1, %rdx
145918c9d:     	nopl	(%rax)
145918ca0:     	testq	%r9, %r9
145918ca3:     	je	0x145918ce0 <.text+0x5917ce0>
145918ca5:     	cmpw	0x3a(%rax,%rdx,2), %r13w
145918cab:     	seta	%r10b
145918caf:     	sbbb	$0x0, %r10b
145918cb3:     	incq	%rdx
145918cb6:     	addq	$-0x2, %r9
145918cba:     	cmpb	$0x1, %r10b
145918cbe:     	je	0x145918ca0 <.text+0x5917ca0>
145918cc0:     	movzbl	%r10b, %r8d
145918cc4:     	testl	%r8d, %r8d
145918cc7:     	je	0x145918cf0 <.text+0x5917cf0>
145918cc9:     	subq	$0x1, %rcx
145918ccd:     	jae	0x145918ce9 <.text+0x5917ce9>
145918ccf:     	jmp	0x145918d02 <.text+0x5917d02>
145918cd1:     	nopw	%cs:(%rax,%rax)
145918ce0:     	movq	%r8, %rdx
145918ce3:     	subq	$0x1, %rcx
145918ce7:     	jb	0x145918d02 <.text+0x5917d02>
145918ce9:     	movq	0x50(%rax,%rdx,8), %rax
145918cee:     	jmp	0x145918c8b <.text+0x5917c8b>
145918cf0:     	movd	%xmm0, 0x8(%rax,%rdx,4)
145918cf6:     	jmp	0x145918d4d <.text+0x5917d4d>
145918cf8:     	nopl	(%rax,%rax)
145918d00:     	xorl	%eax, %eax
145918d02:     	movd	%xmm0, %r8d
145918d07:     	leaq	0x100(%rbp), %rcx
145918d0e:     	movq	%rcx, 0x140(%rbp)
145918d15:     	movq	%rax, 0x148(%rbp)
145918d1c:     	movq	$0x0, 0x150(%rbp)
145918d27:     	movq	%rdx, 0x158(%rbp)
145918d2e:     	movq	$0x4, 0x160(%rbp)
145918d39:     	leaq	0x118(%rbp), %rcx
145918d40:     	leaq	0x140(%rbp), %rdx
145918d47:     	callq	0x1458e1710 <.text+0x58e0710>
145918d4c:     	nop
145918d4d:     	movq	0x100(%rbp), %rax
145918d54:     	testq	%rax, %rax
145918d57:     	je	0x145918de0 <.text+0x5917de0>
145918d5d:     	movq	0x108(%rbp), %rcx
145918d64:     	movzwl	0x36(%rax), %r8d
145918d69:     	movl	%r8d, %r9d
145918d6c:     	addl	%r9d, %r9d
145918d6f:     	movq	$-0x1, %rdx
145918d76:     	nopw	%cs:(%rax,%rax)
145918d80:     	testq	%r9, %r9
145918d83:     	je	0x145918dc0 <.text+0x5917dc0>
145918d85:     	cmpw	0x3a(%rax,%rdx,2), %r15w
145918d8b:     	seta	%r10b
145918d8f:     	sbbb	$0x0, %r10b
145918d93:     	incq	%rdx
145918d96:     	addq	$-0x2, %r9
145918d9a:     	cmpb	$0x1, %r10b
145918d9e:     	je	0x145918d80 <.text+0x5917d80>
145918da0:     	movzbl	%r10b, %r8d
145918da4:     	testl	%r8d, %r8d
145918da7:     	je	0x145918dd0 <.text+0x5917dd0>
145918da9:     	subq	$0x1, %rcx
145918dad:     	jae	0x145918dc9 <.text+0x5917dc9>
145918daf:     	jmp	0x145918de2 <.text+0x5917de2>
145918db1:     	nopw	%cs:(%rax,%rax)
145918dc0:     	movq	%r8, %rdx
145918dc3:     	subq	$0x1, %rcx
145918dc7:     	jb	0x145918de2 <.text+0x5917de2>
145918dc9:     	movq	0x50(%rax,%rdx,8), %rax
145918dce:     	jmp	0x145918d64 <.text+0x5917d64>
145918dd0:     	movl	$0x1, 0x8(%rax,%rdx,4)
145918dd8:     	jmp	0x145918e2e <.text+0x5917e2e>
145918dda:     	nopw	(%rax,%rax)
145918de0:     	xorl	%eax, %eax
145918de2:     	leaq	0x100(%rbp), %rcx
145918de9:     	movq	%rcx, 0x140(%rbp)
145918df0:     	movq	%rax, 0x148(%rbp)
145918df7:     	movq	$0x0, 0x150(%rbp)
145918e02:     	movq	%rdx, 0x158(%rbp)
145918e09:     	movq	$0x16, 0x160(%rbp)
145918e14:     	leaq	0x118(%rbp), %rcx
145918e1b:     	leaq	0x140(%rbp), %rdx
145918e22:     	movl	$0x1, %r8d
145918e28:     	callq	0x1458e1710 <.text+0x58e0710>
145918e2d:     	nop
145918e2e:     	movq	0x100(%rbp), %rax
145918e35:     	testq	%rax, %rax
145918e38:     	je	0x145918ec0 <.text+0x5917ec0>
145918e3e:     	movq	0x108(%rbp), %rcx
145918e45:     	movzwl	0x36(%rax), %r8d
145918e4a:     	movl	%r8d, %r9d
145918e4d:     	addl	%r9d, %r9d
145918e50:     	movq	$-0x1, %rdx
145918e57:     	nopw	(%rax,%rax)
145918e60:     	testq	%r9, %r9
145918e63:     	je	0x145918ea0 <.text+0x5917ea0>
145918e65:     	cmpw	0x3a(%rax,%rdx,2), %r12w
145918e6b:     	seta	%r10b
145918e6f:     	sbbb	$0x0, %r10b
145918e73:     	incq	%rdx
145918e76:     	addq	$-0x2, %r9
145918e7a:     	cmpb	$0x1, %r10b
145918e7e:     	je	0x145918e60 <.text+0x5917e60>
145918e80:     	movzbl	%r10b, %r8d
145918e84:     	testl	%r8d, %r8d
145918e87:     	je	0x145918eb0 <.text+0x5917eb0>
145918e89:     	subq	$0x1, %rcx
145918e8d:     	jae	0x145918ea9 <.text+0x5917ea9>
145918e8f:     	jmp	0x145918ec2 <.text+0x5917ec2>
145918e91:     	nopw	%cs:(%rax,%rax)
145918ea0:     	movq	%r8, %rdx
145918ea3:     	subq	$0x1, %rcx
145918ea7:     	jb	0x145918ec2 <.text+0x5917ec2>
145918ea9:     	movq	0x50(%rax,%rdx,8), %rax
145918eae:     	jmp	0x145918e45 <.text+0x5917e45>
145918eb0:     	movl	$0x1, 0x8(%rax,%rdx,4)
145918eb8:     	jmp	0x145918f0e <.text+0x5917f0e>
145918eba:     	nopw	(%rax,%rax)
145918ec0:     	xorl	%eax, %eax
145918ec2:     	leaq	0x100(%rbp), %rcx
145918ec9:     	movq	%rcx, 0x140(%rbp)
145918ed0:     	movq	%rax, 0x148(%rbp)
145918ed7:     	movq	$0x0, 0x150(%rbp)
145918ee2:     	movq	%rdx, 0x158(%rbp)
145918ee9:     	movq	$0x1c, 0x160(%rbp)
145918ef4:     	leaq	0x118(%rbp), %rcx
145918efb:     	leaq	0x140(%rbp), %rdx
145918f02:     	movl	$0x1, %r8d
145918f08:     	callq	0x1458e1710 <.text+0x58e0710>
145918f0d:     	nop
145918f0e:     	movq	0x100(%rbp), %rax
145918f15:     	testq	%rax, %rax
145918f18:     	je	0x145918fa0 <.text+0x5917fa0>
145918f1e:     	movq	0x108(%rbp), %rcx
145918f25:     	movzwl	0x36(%rax), %r8d
145918f2a:     	movl	%r8d, %r9d
145918f2d:     	addl	%r9d, %r9d
145918f30:     	movq	$-0x1, %rdx
145918f37:     	nopw	(%rax,%rax)
145918f40:     	testq	%r9, %r9
145918f43:     	je	0x145918f80 <.text+0x5917f80>
145918f45:     	movw	$0x22, %r10w
145918f4a:     	cmpw	0x3a(%rax,%rdx,2), %r10w
145918f50:     	seta	%r10b
145918f54:     	sbbb	$0x0, %r10b
145918f58:     	incq	%rdx
145918f5b:     	addq	$-0x2, %r9
145918f5f:     	cmpb	$0x1, %r10b
145918f63:     	je	0x145918f40 <.text+0x5917f40>
145918f65:     	movzbl	%r10b, %r8d
145918f69:     	testl	%r8d, %r8d
145918f6c:     	je	0x145918f90 <.text+0x5917f90>
145918f6e:     	subq	$0x1, %rcx
145918f72:     	jae	0x145918f89 <.text+0x5917f89>
145918f74:     	jmp	0x145918fa2 <.text+0x5917fa2>
145918f76:     	nopw	%cs:(%rax,%rax)
145918f80:     	movq	%r8, %rdx
145918f83:     	subq	$0x1, %rcx
145918f87:     	jb	0x145918fa2 <.text+0x5917fa2>
145918f89:     	movq	0x50(%rax,%rdx,8), %rax
145918f8e:     	jmp	0x145918f25 <.text+0x5917f25>
145918f90:     	movl	$0x1, 0x8(%rax,%rdx,4)
145918f98:     	jmp	0x145918fee <.text+0x5917fee>
145918f9a:     	nopw	(%rax,%rax)
145918fa0:     	xorl	%eax, %eax
145918fa2:     	leaq	0x100(%rbp), %rcx
145918fa9:     	movq	%rcx, 0x140(%rbp)
145918fb0:     	movq	%rax, 0x148(%rbp)
145918fb7:     	movq	$0x0, 0x150(%rbp)
145918fc2:     	movq	%rdx, 0x158(%rbp)
145918fc9:     	movq	$0x22, 0x160(%rbp)
145918fd4:     	leaq	0x118(%rbp), %rcx
145918fdb:     	leaq	0x140(%rbp), %rdx
145918fe2:     	movl	$0x1, %r8d
145918fe8:     	callq	0x1458e1710 <.text+0x58e0710>
145918fed:     	nop
145918fee:     	movq	0x100(%rbp), %rax
145918ff5:     	testq	%rax, %rax
145918ff8:     	je	0x145919080 <.text+0x5918080>
145918ffe:     	movq	0x108(%rbp), %rcx
145919005:     	movzwl	0x36(%rax), %r8d
14591900a:     	movl	%r8d, %r9d
14591900d:     	addl	%r9d, %r9d
145919010:     	movq	$-0x1, %rdx
145919017:     	nopw	(%rax,%rax)
145919020:     	testq	%r9, %r9
145919023:     	je	0x145919060 <.text+0x5918060>
145919025:     	movw	$0x23, %r10w
14591902a:     	cmpw	0x3a(%rax,%rdx,2), %r10w
145919030:     	seta	%r10b
145919034:     	sbbb	$0x0, %r10b
145919038:     	incq	%rdx
14591903b:     	addq	$-0x2, %r9
14591903f:     	cmpb	$0x1, %r10b
145919043:     	je	0x145919020 <.text+0x5918020>
145919045:     	movzbl	%r10b, %r8d
145919049:     	testl	%r8d, %r8d
14591904c:     	je	0x145919070 <.text+0x5918070>
14591904e:     	subq	$0x1, %rcx
145919052:     	jae	0x145919069 <.text+0x5918069>
145919054:     	jmp	0x145919082 <.text+0x5918082>
145919056:     	nopw	%cs:(%rax,%rax)
145919060:     	movq	%r8, %rdx
145919063:     	subq	$0x1, %rcx
145919067:     	jb	0x145919082 <.text+0x5918082>
145919069:     	movq	0x50(%rax,%rdx,8), %rax
14591906e:     	jmp	0x145919005 <.text+0x5918005>
145919070:     	movl	$0x23, 0x8(%rax,%rdx,4)
145919078:     	jmp	0x1459190ce <.text+0x59180ce>
14591907a:     	nopw	(%rax,%rax)
145919080:     	xorl	%eax, %eax
145919082:     	leaq	0x100(%rbp), %rcx
145919089:     	movq	%rcx, 0x140(%rbp)
145919090:     	movq	%rax, 0x148(%rbp)
145919097:     	movq	$0x0, 0x150(%rbp)
1459190a2:     	movq	%rdx, 0x158(%rbp)
1459190a9:     	movq	$0x23, 0x160(%rbp)
1459190b4:     	leaq	0x118(%rbp), %rcx
1459190bb:     	leaq	0x140(%rbp), %rdx
1459190c2:     	movl	$0x23, %r8d
1459190c8:     	callq	0x1458e1710 <.text+0x58e0710>
1459190cd:     	nop
1459190ce:     	movq	0x100(%rbp), %rax
1459190d5:     	testq	%rax, %rax
1459190d8:     	je	0x145919160 <.text+0x5918160>
1459190de:     	movq	0x108(%rbp), %rcx
1459190e5:     	movzwl	0x36(%rax), %r8d
1459190ea:     	movl	%r8d, %r9d
1459190ed:     	addl	%r9d, %r9d
1459190f0:     	movq	$-0x1, %rdx
1459190f7:     	nopw	(%rax,%rax)
145919100:     	testq	%r9, %r9
145919103:     	je	0x145919140 <.text+0x5918140>
145919105:     	movw	$0x2e, %r10w
14591910a:     	cmpw	0x3a(%rax,%rdx,2), %r10w
145919110:     	seta	%r10b
145919114:     	sbbb	$0x0, %r10b
145919118:     	incq	%rdx
14591911b:     	addq	$-0x2, %r9
14591911f:     	cmpb	$0x1, %r10b
145919123:     	je	0x145919100 <.text+0x5918100>
145919125:     	movzbl	%r10b, %r8d
145919129:     	testl	%r8d, %r8d
14591912c:     	je	0x145919150 <.text+0x5918150>
14591912e:     	subq	$0x1, %rcx
145919132:     	jae	0x145919149 <.text+0x5918149>
145919134:     	jmp	0x145919162 <.text+0x5918162>
145919136:     	nopw	%cs:(%rax,%rax)
145919140:     	movq	%r8, %rdx
145919143:     	subq	$0x1, %rcx
145919147:     	jb	0x145919162 <.text+0x5918162>
145919149:     	movq	0x50(%rax,%rdx,8), %rax
14591914e:     	jmp	0x1459190e5 <.text+0x59180e5>
145919150:     	movl	$0x2000002, 0x8(%rax,%rdx,4) # imm = 0x2000002
145919158:     	jmp	0x1459191ae <.text+0x59181ae>
14591915a:     	nopw	(%rax,%rax)
145919160:     	xorl	%eax, %eax
145919162:     	leaq	0x100(%rbp), %rcx
145919169:     	movq	%rcx, 0x140(%rbp)
145919170:     	movq	%rax, 0x148(%rbp)
145919177:     	movq	$0x0, 0x150(%rbp)
145919182:     	movq	%rdx, 0x158(%rbp)
145919189:     	movq	$0x2e, 0x160(%rbp)
145919194:     	leaq	0x118(%rbp), %rcx
14591919b:     	leaq	0x140(%rbp), %rdx
1459191a2:     	movl	$0x2000002, %r8d        # imm = 0x2000002
1459191a8:     	callq	0x1458e1710 <.text+0x58e0710>
1459191ad:     	nop
1459191ae:     	movq	0x100(%rbp), %rax
1459191b5:     	testq	%rax, %rax
1459191b8:     	je	0x145919240 <.text+0x5918240>
1459191be:     	movq	0x108(%rbp), %rcx
1459191c5:     	movzwl	0x36(%rax), %r8d
1459191ca:     	movl	%r8d, %r9d
1459191cd:     	addl	%r9d, %r9d
1459191d0:     	movq	$-0x1, %rdx
1459191d7:     	nopw	(%rax,%rax)
1459191e0:     	testq	%r9, %r9
1459191e3:     	je	0x145919220 <.text+0x5918220>
1459191e5:     	movzwl	0x3a(%rax,%rdx,2), %r10d
1459191eb:     	movl	$0x81, %r11d
1459191f1:     	cmpl	%r10d, %r11d
1459191f4:     	seta	%r10b
1459191f8:     	sbbb	$0x0, %r10b
1459191fc:     	incq	%rdx
1459191ff:     	addq	$-0x2, %r9
145919203:     	cmpb	$0x1, %r10b
145919207:     	je	0x1459191e0 <.text+0x59181e0>
145919209:     	movzbl	%r10b, %r8d
14591920d:     	testl	%r8d, %r8d
145919210:     	je	0x145919230 <.text+0x5918230>
145919212:     	subq	$0x1, %rcx
145919216:     	jae	0x145919229 <.text+0x5918229>
145919218:     	jmp	0x145919242 <.text+0x5918242>
14591921a:     	nopw	(%rax,%rax)
145919220:     	movq	%r8, %rdx
145919223:     	subq	$0x1, %rcx
145919227:     	jb	0x145919242 <.text+0x5918242>
145919229:     	movq	0x50(%rax,%rdx,8), %rax
14591922e:     	jmp	0x1459191c5 <.text+0x59181c5>
145919230:     	movl	$0x3e99999a, 0x8(%rax,%rdx,4) # imm = 0x3E99999A
145919238:     	jmp	0x14591928e <.text+0x591828e>
14591923a:     	nopw	(%rax,%rax)
145919240:     	xorl	%eax, %eax
145919242:     	leaq	0x100(%rbp), %rcx
145919249:     	movq	%rcx, 0x140(%rbp)
145919250:     	movq	%rax, 0x148(%rbp)
145919257:     	movq	$0x0, 0x150(%rbp)
145919262:     	movq	%rdx, 0x158(%rbp)
145919269:     	movq	$0x81, 0x160(%rbp)
145919274:     	leaq	0x118(%rbp), %rcx
14591927b:     	leaq	0x140(%rbp), %rdx
145919282:     	movl	$0x3e99999a, %r8d       # imm = 0x3E99999A
145919288:     	callq	0x1458e1710 <.text+0x58e0710>
14591928d:     	nop
14591928e:     	movq	0x100(%rbp), %rax
145919295:     	testq	%rax, %rax
145919298:     	je	0x145919320 <.text+0x5918320>
14591929e:     	movq	0x108(%rbp), %rcx
1459192a5:     	movzwl	0x36(%rax), %r8d
1459192aa:     	movl	%r8d, %r9d
1459192ad:     	addl	%r9d, %r9d
1459192b0:     	movq	$-0x1, %rdx
1459192b7:     	nopw	(%rax,%rax)
1459192c0:     	testq	%r9, %r9
1459192c3:     	je	0x145919300 <.text+0x5918300>
1459192c5:     	movzwl	0x3a(%rax,%rdx,2), %r10d
1459192cb:     	movl	$0x82, %r11d
1459192d1:     	cmpl	%r10d, %r11d
1459192d4:     	seta	%r10b
1459192d8:     	sbbb	$0x0, %r10b
1459192dc:     	incq	%rdx
1459192df:     	addq	$-0x2, %r9
1459192e3:     	cmpb	$0x1, %r10b
1459192e7:     	je	0x1459192c0 <.text+0x59182c0>
1459192e9:     	movzbl	%r10b, %r8d
1459192ed:     	testl	%r8d, %r8d
1459192f0:     	je	0x145919310 <.text+0x5918310>
1459192f2:     	subq	$0x1, %rcx
1459192f6:     	jae	0x145919309 <.text+0x5918309>
1459192f8:     	jmp	0x145919322 <.text+0x5918322>
1459192fa:     	nopw	(%rax,%rax)
145919300:     	movq	%r8, %rdx
145919303:     	subq	$0x1, %rcx
145919307:     	jb	0x145919322 <.text+0x5918322>
145919309:     	movq	0x50(%rax,%rdx,8), %rax
14591930e:     	jmp	0x1459192a5 <.text+0x59182a5>
145919310:     	movl	$0x3f000000, 0x8(%rax,%rdx,4) # imm = 0x3F000000
145919318:     	jmp	0x14591936e <.text+0x591836e>
14591931a:     	nopw	(%rax,%rax)
145919320:     	xorl	%eax, %eax
145919322:     	leaq	0x100(%rbp), %rcx
145919329:     	movq	%rcx, 0x140(%rbp)
145919330:     	movq	%rax, 0x148(%rbp)
145919337:     	movq	$0x0, 0x150(%rbp)
145919342:     	movq	%rdx, 0x158(%rbp)
145919349:     	movq	$0x82, 0x160(%rbp)
145919354:     	leaq	0x118(%rbp), %rcx
14591935b:     	leaq	0x140(%rbp), %rdx
145919362:     	movl	$0x3f000000, %r8d       # imm = 0x3F000000
145919368:     	callq	0x1458e1710 <.text+0x58e0710>
14591936d:     	nop
14591936e:     	movq	0x190(%rbp), %rax
145919375:     	movl	0x50(%rax), %r8d
145919379:     	movq	0x100(%rbp), %rax
145919380:     	testq	%rax, %rax
145919383:     	je	0x145919400 <.text+0x5918400>
145919385:     	movq	0x108(%rbp), %rcx
14591938c:     	movzwl	0x36(%rax), %r9d
145919391:     	movl	%r9d, %r10d
145919394:     	addl	%r10d, %r10d
145919397:     	movq	$-0x1, %rdx
14591939e:     	nop
1459193a0:     	testq	%r10, %r10
1459193a3:     	je	0x1459193e0 <.text+0x59183e0>
1459193a5:     	movzwl	0x3a(%rax,%rdx,2), %r11d
1459193ab:     	movl	$0x83, %esi
1459193b0:     	cmpl	%r11d, %esi
1459193b3:     	seta	%r11b
1459193b7:     	sbbb	$0x0, %r11b
1459193bb:     	incq	%rdx
1459193be:     	addq	$-0x2, %r10
1459193c2:     	cmpb	$0x1, %r11b
1459193c6:     	je	0x1459193a0 <.text+0x59183a0>
1459193c8:     	movzbl	%r11b, %r9d
1459193cc:     	testl	%r9d, %r9d
1459193cf:     	je	0x1459193f0 <.text+0x59183f0>
1459193d1:     	subq	$0x1, %rcx
1459193d5:     	jae	0x1459193e9 <.text+0x59183e9>
1459193d7:     	jmp	0x145919402 <.text+0x5918402>
1459193d9:     	nopl	(%rax)
1459193e0:     	movq	%r9, %rdx
1459193e3:     	subq	$0x1, %rcx
1459193e7:     	jb	0x145919402 <.text+0x5918402>
1459193e9:     	movq	0x50(%rax,%rdx,8), %rax
1459193ee:     	jmp	0x14591938c <.text+0x591838c>
1459193f0:     	movl	%r8d, 0x8(%rax,%rdx,4)
1459193f5:     	jmp	0x145919448 <.text+0x5918448>
1459193f7:     	nopw	(%rax,%rax)
145919400:     	xorl	%eax, %eax
145919402:     	leaq	0x100(%rbp), %rcx
145919409:     	movq	%rcx, 0x140(%rbp)
145919410:     	movq	%rax, 0x148(%rbp)
145919417:     	movq	$0x0, 0x150(%rbp)
145919422:     	movq	%rdx, 0x158(%rbp)
145919429:     	movq	$0x83, 0x160(%rbp)
145919434:     	leaq	0x118(%rbp), %rcx
14591943b:     	leaq	0x140(%rbp), %rdx
145919442:     	callq	0x1458e1710 <.text+0x58e0710>
145919447:     	nop
145919448:     	movq	0x190(%rbp), %rax
14591944f:     	movl	0x50(%rax), %r8d
145919453:     	movq	0x100(%rbp), %rax
14591945a:     	testq	%rax, %rax
14591945d:     	je	0x1459194e0 <.text+0x59184e0>
145919463:     	movq	0x108(%rbp), %rcx
14591946a:     	movzwl	0x36(%rax), %r9d
14591946f:     	movl	%r9d, %r10d
145919472:     	addl	%r10d, %r10d
145919475:     	movq	$-0x1, %rdx
14591947c:     	nopl	(%rax)
145919480:     	testq	%r10, %r10
145919483:     	je	0x1459194c0 <.text+0x59184c0>
145919485:     	movzwl	0x3a(%rax,%rdx,2), %r11d
14591948b:     	movl	$0x84, %esi
145919490:     	cmpl	%r11d, %esi
145919493:     	seta	%r11b
145919497:     	sbbb	$0x0, %r11b
14591949b:     	incq	%rdx
14591949e:     	addq	$-0x2, %r10
1459194a2:     	cmpb	$0x1, %r11b
1459194a6:     	je	0x145919480 <.text+0x5918480>
1459194a8:     	movzbl	%r11b, %r9d
1459194ac:     	testl	%r9d, %r9d
1459194af:     	je	0x1459194d0 <.text+0x59184d0>
1459194b1:     	subq	$0x1, %rcx
1459194b5:     	jae	0x1459194c9 <.text+0x59184c9>
1459194b7:     	jmp	0x1459194e2 <.text+0x59184e2>
1459194b9:     	nopl	(%rax)
1459194c0:     	movq	%r9, %rdx
1459194c3:     	subq	$0x1, %rcx
1459194c7:     	jb	0x1459194e2 <.text+0x59184e2>
1459194c9:     	movq	0x50(%rax,%rdx,8), %rax
1459194ce:     	jmp	0x14591946a <.text+0x591846a>
1459194d0:     	movl	%r8d, 0x8(%rax,%rdx,4)
1459194d5:     	jmp	0x145919528 <.text+0x5918528>
1459194d7:     	nopw	(%rax,%rax)
1459194e0:     	xorl	%eax, %eax
1459194e2:     	leaq	0x100(%rbp), %rcx
1459194e9:     	movq	%rcx, 0x140(%rbp)
1459194f0:     	movq	%rax, 0x148(%rbp)
1459194f7:     	movq	$0x0, 0x150(%rbp)
145919502:     	movq	%rdx, 0x158(%rbp)
145919509:     	movq	$0x84, 0x160(%rbp)
145919514:     	leaq	0x118(%rbp), %rcx
14591951b:     	leaq	0x140(%rbp), %rdx
145919522:     	callq	0x1458e1710 <.text+0x58e0710>
145919527:     	nop
145919528:     	movq	0x100(%rbp), %rax
14591952f:     	testq	%rax, %rax
145919532:     	je	0x1459195b0 <.text+0x59185b0>
145919534:     	movq	0x108(%rbp), %rcx
14591953b:     	movzwl	0x36(%rax), %r8d
145919540:     	movl	%r8d, %r9d
145919543:     	addl	%r9d, %r9d
145919546:     	movq	$-0x1, %rdx
14591954d:     	nopl	(%rax)
145919550:     	testq	%r9, %r9
145919553:     	je	0x145919590 <.text+0x5918590>
145919555:     	movzwl	0x3a(%rax,%rdx,2), %r10d
14591955b:     	movl	$0x91, %r11d
145919561:     	cmpl	%r10d, %r11d
145919564:     	seta	%r10b
145919568:     	sbbb	$0x0, %r10b
14591956c:     	incq	%rdx
14591956f:     	addq	$-0x2, %r9
145919573:     	cmpb	$0x1, %r10b
145919577:     	je	0x145919550 <.text+0x5918550>
145919579:     	movzbl	%r10b, %r8d
14591957d:     	testl	%r8d, %r8d
145919580:     	je	0x1459195a0 <.text+0x59185a0>
145919582:     	subq	$0x1, %rcx
145919586:     	jae	0x145919599 <.text+0x5918599>
145919588:     	jmp	0x1459195b2 <.text+0x59185b2>
14591958a:     	nopw	(%rax,%rax)
145919590:     	movq	%r8, %rdx
145919593:     	subq	$0x1, %rcx
145919597:     	jb	0x1459195b2 <.text+0x59185b2>
145919599:     	movq	0x50(%rax,%rdx,8), %rax
14591959e:     	jmp	0x14591953b <.text+0x591853b>
1459195a0:     	movl	$0x3f800000, 0x8(%rax,%rdx,4) # imm = 0x3F800000
1459195a8:     	jmp	0x1459195fe <.text+0x59185fe>
1459195aa:     	nopw	(%rax,%rax)
1459195b0:     	xorl	%eax, %eax
1459195b2:     	leaq	0x100(%rbp), %rcx
1459195b9:     	movq	%rcx, 0x140(%rbp)
1459195c0:     	movq	%rax, 0x148(%rbp)
1459195c7:     	movq	$0x0, 0x150(%rbp)
1459195d2:     	movq	%rdx, 0x158(%rbp)
1459195d9:     	movq	$0x91, 0x160(%rbp)
1459195e4:     	leaq	0x118(%rbp), %rcx
1459195eb:     	leaq	0x140(%rbp), %rdx
1459195f2:     	movl	$0x3f800000, %r8d       # imm = 0x3F800000
1459195f8:     	callq	0x1458e1710 <.text+0x58e0710>
1459195fd:     	nop
1459195fe:     	movups	0x155fc97(%rip), %xmm0  # 0x146e7929c
145919605:     	movaps	%xmm0, 0x70(%rbp)
145919609:     	movq	0x138(%rbp), %rcx
145919610:     	movzbl	0x28d(%rcx), %eax
145919617:     	xorps	%xmm0, %xmm0
14591961a:     	cvtsi2ss	%eax, %xmm0
14591961e:     	movabsq	$0x40490fdb40200000, %rax # imm = 0x40490FDB40200000
145919628:     	movq	%rax, 0x80(%rbp)
14591962f:     	movss	0x48c(%rcx), %xmm1
145919637:     	mulss	%xmm12, %xmm0
14591963c:     	addss	%xmm13, %xmm0
145919641:     	mulss	%xmm14, %xmm0
145919646:     	maxss	%xmm13, %xmm1
14591964b:     	mulss	%xmm0, %xmm1
14591964f:     	movss	%xmm1, 0x74(%rbp)
145919654:     	movl	$0x0, 0xb0(%rbp)
14591965e:     	movq	$0x0, 0x98(%rbp)
145919669:     	movq	$0x1, 0xa0(%rbp)
145919674:     	movq	$0x0, 0xa8(%rbp)
14591967f:     	movss	0x4d4(%rcx), %xmm0
145919687:     	movlps	%xmm6, 0x140(%rbp)
14591968e:     	movss	%xmm7, 0x148(%rbp)
145919696:     	movb	$0x1, 0x18f(%rbp)
14591969d:     	leaq	0x100(%rbp), %rax
1459196a4:     	movq	%rax, 0x38(%rsp)
1459196a9:     	leaq	0x70(%rbp), %rax
1459196ad:     	movq	%rax, 0x30(%rsp)
1459196b2:     	movss	%xmm0, 0x28(%rsp)
1459196b8:     	leaq	0x140(%rbp), %rax
1459196bf:     	movq	%rax, 0x20(%rsp)
1459196c4:     	leaq	0x98(%rbp), %rcx
1459196cb:     	movq	%rdi, %rdx
1459196ce:     	movb	$0x3, %r8b
1459196d1:     	xorl	%r9d, %r9d
1459196d4:     	callq	0x1458a7bf0 <.text+0x58a6bf0>
1459196d9:     	nop
1459196da:     	movups	0x98(%rbp), %xmm0
1459196e1:     	movups	0xa8(%rbp), %xmm1
1459196e8:     	movaps	%xmm1, 0x150(%rbp)
1459196ef:     	movaps	%xmm0, 0x140(%rbp)
1459196f6:     	movb	$0x0, 0x18f(%rbp)
1459196fd:     	leaq	0x118(%rbp), %rcx
145919704:     	leaq	0x140(%rbp), %rdx
14591970b:     	callq	0x1458a83c0 <.text+0x58a73c0>
145919710:     	nop
145919711:     	movq	0x138(%rbp), %rax
145919718:     	movq	0x5e0(%rax), %rsi
14591971f:     	cmpq	0x5d0(%rax), %rsi
145919726:     	jne	0x145919735 <.text+0x5918735>
145919728:     	movq	0xe0(%rbp), %rcx
14591972f:     	callq	0x145bcb530 <.text+0x5bca530>
145919734:     	nop
145919735:     	movq	0x138(%rbp), %rdx
14591973c:     	movq	0x5d8(%rdx), %rax
145919743:     	movq	%rsi, %rcx
145919746:     	shlq	$0x5, %rcx
14591974a:     	movups	0x118(%rbp), %xmm0
145919751:     	movups	0x128(%rbp), %xmm1
145919758:     	movups	%xmm1, 0x10(%rax,%rcx)
14591975d:     	movups	%xmm0, (%rax,%rcx)
145919761:     	incq	%rsi
145919764:     	movq	%rsi, 0x5e0(%rdx)
14591976b:     	movss	0x9ec(%rdx), %xmm9
145919774:     	movaps	%xmm9, %xmm8
145919778:     	addss	%xmm13, %xmm8
14591977d:     	movq	0x900(%rdx), %rsi
145919784:     	cmpq	0x8f0(%rdx), %rsi
14591978b:     	jne	0x1459197a1 <.text+0x59187a1>
14591978d:     	movb	$0x0, 0x18f(%rbp)
145919794:     	movq	0xb8(%rbp), %rcx
14591979b:     	callq	0x145bce8c0 <.text+0x5bcd8c0>
1459197a0:     	nop
1459197a1:     	movq	0x138(%rbp), %rdx
1459197a8:     	movq	0x8f8(%rdx), %rax
1459197af:     	imulq	$0x70, %rsi, %rcx
1459197b3:     	movq	$0x0, (%rax,%rcx)
1459197bb:     	movq	$0x4, 0x8(%rax,%rcx)
1459197c4:     	movq	$0x0, 0x10(%rax,%rcx)
1459197cd:     	movl	$0x0, 0x18(%rax,%rcx)
1459197d5:     	movss	%xmm8, 0x1c(%rax,%rcx)
1459197dc:     	movq	0x190(%rbp), %r8
1459197e3:     	movq	%r8, 0x28(%rax,%rcx)
1459197e8:     	movzbl	0x180(%rbp), %r8d
1459197f0:     	movb	%r8b, 0x30(%rax,%rcx)
1459197f5:     	movq	%rdi, 0x38(%rax,%rcx)
1459197fa:     	movlps	%xmm6, 0x40(%rax,%rcx)
1459197ff:     	movss	%xmm7, 0x48(%rax,%rcx)
145919805:     	movlps	%xmm6, 0x4c(%rax,%rcx)
14591980a:     	movss	%xmm7, 0x54(%rax,%rcx)
145919810:     	xorps	%xmm0, %xmm0
145919813:     	movss	%xmm9, %xmm0            # xmm0 = xmm9[0],xmm0[1,2,3]
145919818:     	movlps	%xmm0, 0x58(%rax,%rcx)
14591981d:     	movss	%xmm9, 0x60(%rax,%rcx)
145919824:     	movss	%xmm15, 0x64(%rax,%rcx)
14591982b:     	movss	%xmm9, 0x68(%rax,%rcx)
145919832:     	incq	%rsi
145919835:     	movq	%rsi, 0x900(%rdx)
