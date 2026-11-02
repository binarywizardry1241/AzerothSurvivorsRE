
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145928bd0:     	pushq	%rbp
145928bd1:     	pushq	%r15
145928bd3:     	pushq	%r14
145928bd5:     	pushq	%r12
145928bd7:     	pushq	%rsi
145928bd8:     	pushq	%rdi
145928bd9:     	pushq	%rbx
145928bda:     	subq	$0x140, %rsp            # imm = 0x140
145928be1:     	leaq	0x80(%rsp), %rbp
145928be9:     	movaps	%xmm10, 0xb0(%rbp)
145928bf1:     	movaps	%xmm9, 0xa0(%rbp)
145928bf9:     	movaps	%xmm8, 0x90(%rbp)
145928c01:     	movaps	%xmm7, 0x80(%rbp)
145928c08:     	movaps	%xmm6, 0x70(%rbp)
145928c0c:     	movq	$-0x2, 0x68(%rbp)
145928c14:     	movq	%r9, %rbx
145928c17:     	movaps	%xmm2, %xmm6
145928c1a:     	movq	%rdx, %rdi
145928c1d:     	movq	%rcx, %rsi
145928c20:     	movq	0x120(%rbp), %r14
145928c27:     	movss	0x4d4(%rcx), %xmm10
145928c30:     	movaps	%xmm2, %xmm7
145928c33:     	addss	%xmm10, %xmm7
145928c38:     	movaps	%xmm7, %xmm0
145928c3b:     	callq	0x145bc97c3 <.text+0x5bc87c3>
145928c40:     	movaps	%xmm0, %xmm8
145928c44:     	movaps	%xmm7, %xmm0
145928c47:     	callq	0x145bc97bd <.text+0x5bc87bd>
145928c4c:     	movsd	0x4c8(%rsi), %xmm1
145928c54:     	unpcklps	%xmm0, %xmm8            # xmm8 = xmm8[0],xmm0[0],xmm8[1],xmm0[1]
145928c58:     	mulps	0x154f950(%rip), %xmm8  # 0x146e785b0
145928c60:     	addps	%xmm1, %xmm8
145928c64:     	movq	0x4(%r14), %xmm0
145928c6a:     	movd	(%r14), %xmm1
145928c6f:     	pshufd	$0x0, %xmm1, %xmm7      # xmm7 = xmm1[0,0,0,0]
145928c74:     	pslld	$0x1f, %xmm7
145928c79:     	psrad	$0x1f, %xmm7
145928c7e:     	pand	%xmm7, %xmm0
145928c82:     	pandn	%xmm8, %xmm7
145928c87:     	por	%xmm0, %xmm7
145928c8b:     	pshufd	$0xf5, %xmm7, %xmm9     # xmm9 = xmm7[1,1,3,3]
145928c91:     	movq	0x950(%rsi), %r14
145928c98:     	leaq	0x10(%r14), %rcx
145928c9c:     	movdqa	%xmm7, %xmm1
145928ca0:     	movdqa	%xmm9, %xmm2
145928ca5:     	callq	0x1458c7b60 <.text+0x58c6b60>
145928caa:     	testb	$0x1, %al
145928cac:     	je	0x145928cb5 <.text+0x5927cb5>
145928cae:     	movdqa	%xmm0, %xmm8
145928cb3:     	jmp	0x145928ce9 <.text+0x5927ce9>
145928cb5:     	cmpq	$-0x1, 0x68(%r14)
145928cba:     	je	0x145928ce0 <.text+0x5927ce0>
145928cbc:     	leaq	0x68(%r14), %rdx
145928cc0:     	leaq	0x30(%rbp), %rcx
145928cc4:     	movdqa	%xmm7, %xmm2
145928cc8:     	movdqa	%xmm9, %xmm3
145928ccd:     	callq	0x1458cc950 <.text+0x58cb950>
145928cd2:     	cmpl	$0x1, 0x30(%rbp)
145928cd6:     	jne	0x145928ce0 <.text+0x5927ce0>
145928cd8:     	movd	0x3c(%rbp), %xmm8
145928cde:     	jmp	0x145928ce9 <.text+0x5927ce9>
145928ce0:     	movd	0xb8(%r14), %xmm8
145928ce9:     	movl	0x20(%rdi), %r12d
145928ced:     	movl	0xa0c(%rsi), %eax
145928cf3:     	incl	%eax
145928cf5:     	movl	%eax, 0xa0c(%rsi)
145928cfb:     	movl	%r12d, %ecx
145928cfe:     	andl	$0xffffff, %ecx         # imm = 0xFFFFFF
145928d04:     	shlq	$0x18, %rcx
145928d08:     	andl	$0xffffff, %eax         # imm = 0xFFFFFF
145928d0d:     	orq	%rcx, %rax
145928d10:     	movabsq	$-0xed0000000000000, %r14 # imm = 0xF130000000000000
145928d1a:     	orq	%rax, %r14
145928d1d:     	movq	$0x0, 0x18(%rbp)
145928d25:     	movq	$0x0, 0x28(%rbp)
145928d2d:     	leaq	0x18(%rbp), %r15
145928d31:     	movq	%r15, %rcx
145928d34:     	xorl	%edx, %edx
145928d36:     	movq	%r14, %r8
145928d39:     	callq	0x1458a8ba0 <.text+0x58a7ba0>
145928d3e:     	nop
145928d3f:     	movq	0x18(%rbp), %rax
145928d43:     	testq	%rax, %rax
145928d46:     	je	0x145928dbb <.text+0x5927dbb>
145928d48:     	movq	0x20(%rbp), %rcx
145928d4c:     	movw	$0x2, %dx
145928d50:     	movzwl	0x36(%rax), %r9d
145928d55:     	movl	%r9d, %r10d
145928d58:     	addl	%r10d, %r10d
145928d5b:     	movq	$-0x1, %r8
145928d62:     	nopw	%cs:(%rax,%rax)
145928d70:     	testq	%r10, %r10
145928d73:     	je	0x145928da0 <.text+0x5927da0>
145928d75:     	cmpw	0x3a(%rax,%r8,2), %dx
145928d7b:     	seta	%r11b
145928d7f:     	sbbb	$0x0, %r11b
145928d83:     	incq	%r8
145928d86:     	addq	$-0x2, %r10
145928d8a:     	cmpb	$0x1, %r11b
145928d8e:     	je	0x145928d70 <.text+0x5927d70>
145928d90:     	movzbl	%r11b, %r9d
145928d94:     	testl	%r9d, %r9d
145928d97:     	jne	0x145928da3 <.text+0x5927da3>
145928d99:     	jmp	0x145928db0 <.text+0x5927db0>
145928d9b:     	nopl	(%rax,%rax)
145928da0:     	movq	%r9, %r8
145928da3:     	subq	$0x1, %rcx
145928da7:     	jb	0x145928dbd <.text+0x5927dbd>
145928da9:     	movq	0x50(%rax,%r8,8), %rax
145928dae:     	jmp	0x145928d50 <.text+0x5927d50>
145928db0:     	movl	$0x9, 0x8(%rax,%r8,4)
145928db9:     	jmp	0x145928ded <.text+0x5927ded>
145928dbb:     	xorl	%eax, %eax
145928dbd:     	movq	%r15, 0x30(%rbp)
145928dc1:     	movq	%rax, 0x38(%rbp)
145928dc5:     	movq	$0x0, 0x40(%rbp)
145928dcd:     	movq	%r8, 0x48(%rbp)
145928dd1:     	movq	$0x2, 0x50(%rbp)
145928dd9:     	leaq	-0x8(%rbp), %rcx
145928ddd:     	leaq	0x30(%rbp), %rdx
145928de1:     	movl	$0x9, %r8d
145928de7:     	callq	0x1458e1710 <.text+0x58e0710>
145928dec:     	nop
145928ded:     	movq	0x18(%rbp), %rax
145928df1:     	testq	%rax, %rax
145928df4:     	je	0x145928e57 <.text+0x5927e57>
145928df6:     	movq	0x20(%rbp), %rcx
145928dfa:     	movw	$0x3, %dx
145928dfe:     	movzwl	0x36(%rax), %r9d
145928e03:     	movl	%r9d, %r10d
145928e06:     	addl	%r10d, %r10d
145928e09:     	movq	$-0x1, %r8
145928e10:     	testq	%r10, %r10
145928e13:     	je	0x145928e40 <.text+0x5927e40>
145928e15:     	cmpw	0x3a(%rax,%r8,2), %dx
145928e1b:     	seta	%r11b
145928e1f:     	sbbb	$0x0, %r11b
145928e23:     	incq	%r8
145928e26:     	addq	$-0x2, %r10
145928e2a:     	cmpb	$0x1, %r11b
145928e2e:     	je	0x145928e10 <.text+0x5927e10>
145928e30:     	movzbl	%r11b, %r9d
145928e34:     	testl	%r9d, %r9d
145928e37:     	jne	0x145928e43 <.text+0x5927e43>
145928e39:     	jmp	0x145928e50 <.text+0x5927e50>
145928e3b:     	nopl	(%rax,%rax)
145928e40:     	movq	%r9, %r8
145928e43:     	subq	$0x1, %rcx
145928e47:     	jb	0x145928e59 <.text+0x5927e59>
145928e49:     	movq	0x50(%rax,%r8,8), %rax
145928e4e:     	jmp	0x145928dfe <.text+0x5927dfe>
145928e50:     	movl	%r12d, 0x8(%rax,%r8,4)
145928e55:     	jmp	0x145928e86 <.text+0x5927e86>
145928e57:     	xorl	%eax, %eax
145928e59:     	movq	%r15, 0x30(%rbp)
145928e5d:     	movq	%rax, 0x38(%rbp)
145928e61:     	movq	$0x0, 0x40(%rbp)
145928e69:     	movq	%r8, 0x48(%rbp)
145928e6d:     	movq	$0x3, 0x50(%rbp)
145928e75:     	leaq	-0x8(%rbp), %rcx
145928e79:     	leaq	0x30(%rbp), %rdx
145928e7d:     	movl	%r12d, %r8d
145928e80:     	callq	0x1458e1710 <.text+0x58e0710>
145928e85:     	nop
145928e86:     	movd	0x28(%rdi), %xmm9
145928e8c:     	movq	0x18(%rbp), %rax
145928e90:     	testq	%rax, %rax
145928e93:     	je	0x145928ef9 <.text+0x5927ef9>
145928e95:     	movq	0x20(%rbp), %rcx
145928e99:     	movw	$0x4, %dx
145928e9d:     	movzwl	0x36(%rax), %r8d
145928ea2:     	movl	%r8d, %r10d
145928ea5:     	addl	%r10d, %r10d
145928ea8:     	movq	$-0x1, %r9
145928eaf:     	nop
145928eb0:     	testq	%r10, %r10
145928eb3:     	je	0x145928ee0 <.text+0x5927ee0>
145928eb5:     	cmpw	0x3a(%rax,%r9,2), %dx
145928ebb:     	seta	%r11b
145928ebf:     	sbbb	$0x0, %r11b
145928ec3:     	incq	%r9
145928ec6:     	addq	$-0x2, %r10
145928eca:     	cmpb	$0x1, %r11b
145928ece:     	je	0x145928eb0 <.text+0x5927eb0>
145928ed0:     	movzbl	%r11b, %r8d
145928ed4:     	testl	%r8d, %r8d
145928ed7:     	jne	0x145928ee3 <.text+0x5927ee3>
145928ed9:     	jmp	0x145928ef0 <.text+0x5927ef0>
145928edb:     	nopl	(%rax,%rax)
145928ee0:     	movq	%r8, %r9
145928ee3:     	subq	$0x1, %rcx
145928ee7:     	jb	0x145928efb <.text+0x5927efb>
145928ee9:     	movq	0x50(%rax,%r9,8), %rax
145928eee:     	jmp	0x145928e9d <.text+0x5927e9d>
145928ef0:     	movd	%xmm9, 0x8(%rax,%r9,4)
145928ef7:     	jmp	0x145928f2a <.text+0x5927f2a>
145928ef9:     	xorl	%eax, %eax
145928efb:     	movd	%xmm9, %r8d
145928f00:     	movq	%r15, 0x30(%rbp)
145928f04:     	movq	%rax, 0x38(%rbp)
145928f08:     	movq	$0x0, 0x40(%rbp)
145928f10:     	movq	%r9, 0x48(%rbp)
145928f14:     	movq	$0x4, 0x50(%rbp)
145928f1c:     	leaq	-0x8(%rbp), %rcx
145928f20:     	leaq	0x30(%rbp), %rdx
145928f24:     	callq	0x1458e1710 <.text+0x58e0710>
145928f29:     	nop
145928f2a:     	movq	0x18(%rbp), %rax
145928f2e:     	testq	%rax, %rax
145928f31:     	je	0x145928f9b <.text+0x5927f9b>
145928f33:     	movq	0x20(%rbp), %rcx
145928f37:     	movw	$0x16, %dx
145928f3b:     	movzwl	0x36(%rax), %r9d
145928f40:     	movl	%r9d, %r10d
145928f43:     	addl	%r10d, %r10d
145928f46:     	movq	$-0x1, %r8
145928f4d:     	nopl	(%rax)
145928f50:     	testq	%r10, %r10
145928f53:     	je	0x145928f80 <.text+0x5927f80>
145928f55:     	cmpw	0x3a(%rax,%r8,2), %dx
145928f5b:     	seta	%r11b
145928f5f:     	sbbb	$0x0, %r11b
145928f63:     	incq	%r8
145928f66:     	addq	$-0x2, %r10
145928f6a:     	cmpb	$0x1, %r11b
145928f6e:     	je	0x145928f50 <.text+0x5927f50>
145928f70:     	movzbl	%r11b, %r9d
145928f74:     	testl	%r9d, %r9d
145928f77:     	jne	0x145928f83 <.text+0x5927f83>
145928f79:     	jmp	0x145928f90 <.text+0x5927f90>
145928f7b:     	nopl	(%rax,%rax)
145928f80:     	movq	%r9, %r8
145928f83:     	subq	$0x1, %rcx
145928f87:     	jb	0x145928f9d <.text+0x5927f9d>
145928f89:     	movq	0x50(%rax,%r8,8), %rax
145928f8e:     	jmp	0x145928f3b <.text+0x5927f3b>
145928f90:     	movl	$0x64, 0x8(%rax,%r8,4)
145928f99:     	jmp	0x145928fcd <.text+0x5927fcd>
145928f9b:     	xorl	%eax, %eax
145928f9d:     	movq	%r15, 0x30(%rbp)
145928fa1:     	movq	%rax, 0x38(%rbp)
145928fa5:     	movq	$0x0, 0x40(%rbp)
145928fad:     	movq	%r8, 0x48(%rbp)
145928fb1:     	movq	$0x16, 0x50(%rbp)
145928fb9:     	leaq	-0x8(%rbp), %rcx
145928fbd:     	leaq	0x30(%rbp), %rdx
145928fc1:     	movl	$0x64, %r8d
145928fc7:     	callq	0x1458e1710 <.text+0x58e0710>
145928fcc:     	nop
145928fcd:     	movq	0x18(%rbp), %rax
145928fd1:     	testq	%rax, %rax
145928fd4:     	je	0x14592903b <.text+0x592803b>
145928fd6:     	movq	0x20(%rbp), %rcx
145928fda:     	movw	$0x1c, %dx
145928fde:     	movzwl	0x36(%rax), %r9d
145928fe3:     	movl	%r9d, %r10d
145928fe6:     	addl	%r10d, %r10d
145928fe9:     	movq	$-0x1, %r8
145928ff0:     	testq	%r10, %r10
145928ff3:     	je	0x145929020 <.text+0x5928020>
145928ff5:     	cmpw	0x3a(%rax,%r8,2), %dx
145928ffb:     	seta	%r11b
145928fff:     	sbbb	$0x0, %r11b
145929003:     	incq	%r8
145929006:     	addq	$-0x2, %r10
14592900a:     	cmpb	$0x1, %r11b
14592900e:     	je	0x145928ff0 <.text+0x5927ff0>
145929010:     	movzbl	%r11b, %r9d
145929014:     	testl	%r9d, %r9d
145929017:     	jne	0x145929023 <.text+0x5928023>
145929019:     	jmp	0x145929030 <.text+0x5928030>
14592901b:     	nopl	(%rax,%rax)
145929020:     	movq	%r9, %r8
145929023:     	subq	$0x1, %rcx
145929027:     	jb	0x14592903d <.text+0x592803d>
145929029:     	movq	0x50(%rax,%r8,8), %rax
14592902e:     	jmp	0x145928fde <.text+0x5927fde>
145929030:     	movl	$0x64, 0x8(%rax,%r8,4)
145929039:     	jmp	0x14592906d <.text+0x592806d>
14592903b:     	xorl	%eax, %eax
14592903d:     	movq	%r15, 0x30(%rbp)
145929041:     	movq	%rax, 0x38(%rbp)
145929045:     	movq	$0x0, 0x40(%rbp)
14592904d:     	movq	%r8, 0x48(%rbp)
145929051:     	movq	$0x1c, 0x50(%rbp)
145929059:     	leaq	-0x8(%rbp), %rcx
14592905d:     	leaq	0x30(%rbp), %rdx
145929061:     	movl	$0x64, %r8d
145929067:     	callq	0x1458e1710 <.text+0x58e0710>
14592906c:     	nop
14592906d:     	movl	0x4d8(%rsi), %r8d
145929074:     	movq	0x18(%rbp), %rax
145929078:     	testq	%rax, %rax
14592907b:     	je	0x1459290e7 <.text+0x59280e7>
14592907d:     	movq	0x20(%rbp), %rcx
145929081:     	movw	$0x22, %dx
145929085:     	movzwl	0x36(%rax), %r10d
14592908a:     	movl	%r10d, %r11d
14592908d:     	addl	%r11d, %r11d
145929090:     	movq	$-0x1, %r9
145929097:     	nopw	(%rax,%rax)
1459290a0:     	testq	%r11, %r11
1459290a3:     	je	0x1459290d0 <.text+0x59280d0>
1459290a5:     	cmpw	0x3a(%rax,%r9,2), %dx
1459290ab:     	seta	%r12b
1459290af:     	sbbb	$0x0, %r12b
1459290b3:     	incq	%r9
1459290b6:     	addq	$-0x2, %r11
1459290ba:     	cmpb	$0x1, %r12b
1459290be:     	je	0x1459290a0 <.text+0x59280a0>
1459290c0:     	movzbl	%r12b, %r10d
1459290c4:     	testl	%r10d, %r10d
1459290c7:     	jne	0x1459290d3 <.text+0x59280d3>
1459290c9:     	jmp	0x1459290e0 <.text+0x59280e0>
1459290cb:     	nopl	(%rax,%rax)
1459290d0:     	movq	%r10, %r9
1459290d3:     	subq	$0x1, %rcx
1459290d7:     	jb	0x1459290e9 <.text+0x59280e9>
1459290d9:     	movq	0x50(%rax,%r9,8), %rax
1459290de:     	jmp	0x145929085 <.text+0x5928085>
1459290e0:     	movl	%r8d, 0x8(%rax,%r9,4)
1459290e5:     	jmp	0x145929113 <.text+0x5928113>
1459290e7:     	xorl	%eax, %eax
1459290e9:     	movq	%r15, 0x30(%rbp)
1459290ed:     	movq	%rax, 0x38(%rbp)
1459290f1:     	movq	$0x0, 0x40(%rbp)
1459290f9:     	movq	%r9, 0x48(%rbp)
1459290fd:     	movq	$0x22, 0x50(%rbp)
145929105:     	leaq	-0x8(%rbp), %rcx
145929109:     	leaq	0x30(%rbp), %rdx
14592910d:     	callq	0x1458e1710 <.text+0x58e0710>
145929112:     	nop
145929113:     	movzbl	0x305(%rsi), %eax
14592911a:     	addb	$-0x2, %al
14592911c:     	movl	$0x1, %r8d
145929122:     	cmpb	$0x6, %al
145929124:     	ja	0x145929134 <.text+0x5928134>
145929126:     	movzbl	%al, %eax
145929129:     	leaq	0x1552028(%rip), %rcx   # 0x146e7b158
145929130:     	movl	(%rcx,%rax,4), %r8d
145929134:     	movq	0x18(%rbp), %rax
145929138:     	testq	%rax, %rax
14592913b:     	je	0x1459291a7 <.text+0x59281a7>
14592913d:     	movq	0x20(%rbp), %rcx
145929141:     	movw	$0x23, %dx
145929145:     	movzwl	0x36(%rax), %r10d
14592914a:     	movl	%r10d, %r11d
14592914d:     	addl	%r11d, %r11d
145929150:     	movq	$-0x1, %r9
145929157:     	nopw	(%rax,%rax)
145929160:     	testq	%r11, %r11
145929163:     	je	0x145929190 <.text+0x5928190>
145929165:     	cmpw	0x3a(%rax,%r9,2), %dx
14592916b:     	seta	%r12b
14592916f:     	sbbb	$0x0, %r12b
145929173:     	incq	%r9
145929176:     	addq	$-0x2, %r11
14592917a:     	cmpb	$0x1, %r12b
14592917e:     	je	0x145929160 <.text+0x5928160>
145929180:     	movzbl	%r12b, %r10d
145929184:     	testl	%r10d, %r10d
145929187:     	jne	0x145929193 <.text+0x5928193>
145929189:     	jmp	0x1459291a0 <.text+0x59281a0>
14592918b:     	nopl	(%rax,%rax)
145929190:     	movq	%r10, %r9
145929193:     	subq	$0x1, %rcx
145929197:     	jb	0x1459291a9 <.text+0x59281a9>
145929199:     	movq	0x50(%rax,%r9,8), %rax
14592919e:     	jmp	0x145929145 <.text+0x5928145>
1459291a0:     	movl	%r8d, 0x8(%rax,%r9,4)
1459291a5:     	jmp	0x1459291d3 <.text+0x59281d3>
1459291a7:     	xorl	%eax, %eax
1459291a9:     	movq	%r15, 0x30(%rbp)
1459291ad:     	movq	%rax, 0x38(%rbp)
1459291b1:     	movq	$0x0, 0x40(%rbp)
1459291b9:     	movq	%r9, 0x48(%rbp)
1459291bd:     	movq	$0x23, 0x50(%rbp)
1459291c5:     	leaq	-0x8(%rbp), %rcx
1459291c9:     	leaq	0x30(%rbp), %rdx
1459291cd:     	callq	0x1458e1710 <.text+0x58e0710>
1459291d2:     	nop
1459291d3:     	movq	0x460(%rsi), %r12
1459291da:     	leaq	0x18(%rbp), %rcx
1459291de:     	movw	$0xc, %dx
1459291e2:     	movq	%r12, %r8
1459291e5:     	callq	0x1458a8ba0 <.text+0x58a7ba0>
1459291ea:     	nop
1459291eb:     	leaq	0x18(%rbp), %r15
1459291ef:     	movq	%r15, %rcx
1459291f2:     	movw	$0xe, %dx
1459291f6:     	movq	%r12, %r8
1459291f9:     	callq	0x1458a8ba0 <.text+0x58a7ba0>
1459291fe:     	nop
1459291ff:     	movq	0x18(%rbp), %rax
145929203:     	testq	%rax, %rax
145929206:     	je	0x14592927b <.text+0x592827b>
145929208:     	movq	0x20(%rbp), %rcx
14592920c:     	movw	$0x2e, %dx
145929210:     	movzwl	0x36(%rax), %r9d
145929215:     	movl	%r9d, %r10d
145929218:     	addl	%r10d, %r10d
14592921b:     	movq	$-0x1, %r8
145929222:     	nopw	%cs:(%rax,%rax)
145929230:     	testq	%r10, %r10
145929233:     	je	0x145929260 <.text+0x5928260>
145929235:     	cmpw	0x3a(%rax,%r8,2), %dx
14592923b:     	seta	%r11b
14592923f:     	sbbb	$0x0, %r11b
145929243:     	incq	%r8
145929246:     	addq	$-0x2, %r10
14592924a:     	cmpb	$0x1, %r11b
14592924e:     	je	0x145929230 <.text+0x5928230>
145929250:     	movzbl	%r11b, %r9d
145929254:     	testl	%r9d, %r9d
145929257:     	jne	0x145929263 <.text+0x5928263>
145929259:     	jmp	0x145929270 <.text+0x5928270>
14592925b:     	nopl	(%rax,%rax)
145929260:     	movq	%r9, %r8
145929263:     	subq	$0x1, %rcx
145929267:     	jb	0x14592927d <.text+0x592827d>
145929269:     	movq	0x50(%rax,%r8,8), %rax
14592926e:     	jmp	0x145929210 <.text+0x5928210>
145929270:     	movl	$0x2, 0x8(%rax,%r8,4)
145929279:     	jmp	0x1459292ad <.text+0x59282ad>
14592927b:     	xorl	%eax, %eax
14592927d:     	movq	%r15, 0x30(%rbp)
145929281:     	movq	%rax, 0x38(%rbp)
145929285:     	movq	$0x0, 0x40(%rbp)
14592928d:     	movq	%r8, 0x48(%rbp)
145929291:     	movq	$0x2e, 0x50(%rbp)
145929299:     	leaq	-0x8(%rbp), %rcx
14592929d:     	leaq	0x30(%rbp), %rdx
1459292a1:     	movl	$0x2, %r8d
1459292a7:     	callq	0x1458e1710 <.text+0x58e0710>
1459292ac:     	nop
1459292ad:     	movss	0x30(%rdi), %xmm0
1459292b2:     	mulss	0x4962ea(%rip), %xmm0   # 0x145dbf5a4
1459292ba:     	cvttss2si	%xmm0, %rax
1459292bf:     	xorl	%ecx, %ecx
1459292c1:     	pxor	%xmm1, %xmm1
1459292c5:     	ucomiss	%xmm1, %xmm0
1459292c8:     	cmovbl	%ecx, %eax
1459292cb:     	ucomiss	0x4445a2(%rip), %xmm0   # 0x145d6d874
1459292d2:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1459292d8:     	cmovbel	%eax, %r8d
1459292dc:     	movq	0x18(%rbp), %rax
1459292e0:     	testq	%rax, %rax
1459292e3:     	je	0x145929347 <.text+0x5928347>
1459292e5:     	movq	0x20(%rbp), %rcx
1459292e9:     	movw	$0x7e, %dx
1459292ed:     	movzwl	0x36(%rax), %r10d
1459292f2:     	movl	%r10d, %r11d
1459292f5:     	addl	%r11d, %r11d
1459292f8:     	movq	$-0x1, %r9
1459292ff:     	nop
145929300:     	testq	%r11, %r11
145929303:     	je	0x145929330 <.text+0x5928330>
145929305:     	cmpw	0x3a(%rax,%r9,2), %dx
14592930b:     	seta	%r12b
14592930f:     	sbbb	$0x0, %r12b
145929313:     	incq	%r9
145929316:     	addq	$-0x2, %r11
14592931a:     	cmpb	$0x1, %r12b
14592931e:     	je	0x145929300 <.text+0x5928300>
145929320:     	movzbl	%r12b, %r10d
145929324:     	testl	%r10d, %r10d
145929327:     	jne	0x145929333 <.text+0x5928333>
145929329:     	jmp	0x145929340 <.text+0x5928340>
14592932b:     	nopl	(%rax,%rax)
145929330:     	movq	%r10, %r9
145929333:     	subq	$0x1, %rcx
145929337:     	jb	0x145929349 <.text+0x5928349>
145929339:     	movq	0x50(%rax,%r9,8), %rax
14592933e:     	jmp	0x1459292ed <.text+0x59282ed>
145929340:     	movl	%r8d, 0x8(%rax,%r9,4)
145929345:     	jmp	0x145929373 <.text+0x5928373>
145929347:     	xorl	%eax, %eax
145929349:     	movq	%r15, 0x30(%rbp)
14592934d:     	movq	%rax, 0x38(%rbp)
145929351:     	movq	$0x0, 0x40(%rbp)
145929359:     	movq	%r9, 0x48(%rbp)
14592935d:     	movq	$0x7e, 0x50(%rbp)
145929365:     	leaq	-0x8(%rbp), %rcx
145929369:     	leaq	0x30(%rbp), %rdx
14592936d:     	callq	0x1458e1710 <.text+0x58e0710>
145929372:     	nop
145929373:     	movss	0x4443d9(%rip), %xmm0   # 0x145d6d754
14592937b:     	mulss	%xmm9, %xmm0
145929380:     	movq	0x18(%rbp), %rax
145929384:     	testq	%rax, %rax
145929387:     	je	0x1459293f9 <.text+0x59283f9>
145929389:     	movq	0x20(%rbp), %rcx
14592938d:     	movl	$0x81, %edx
145929392:     	movzwl	0x36(%rax), %r8d
145929397:     	movl	%r8d, %r10d
14592939a:     	addl	%r10d, %r10d
14592939d:     	movq	$-0x1, %r9
1459293a4:     	nopw	%cs:(%rax,%rax)
1459293b0:     	testq	%r10, %r10
1459293b3:     	je	0x1459293e0 <.text+0x59283e0>
1459293b5:     	movzwl	0x3a(%rax,%r9,2), %r11d
1459293bb:     	cmpl	%r11d, %edx
1459293be:     	seta	%r11b
1459293c2:     	sbbb	$0x0, %r11b
1459293c6:     	incq	%r9
1459293c9:     	addq	$-0x2, %r10
1459293cd:     	cmpb	$0x1, %r11b
1459293d1:     	je	0x1459293b0 <.text+0x59283b0>
1459293d3:     	movzbl	%r11b, %r8d
1459293d7:     	testl	%r8d, %r8d
1459293da:     	jne	0x1459293e3 <.text+0x59283e3>
1459293dc:     	jmp	0x1459293f0 <.text+0x59283f0>
1459293de:     	nop
1459293e0:     	movq	%r8, %r9
1459293e3:     	subq	$0x1, %rcx
1459293e7:     	jb	0x1459293fb <.text+0x59283fb>
1459293e9:     	movq	0x50(%rax,%r9,8), %rax
1459293ee:     	jmp	0x145929392 <.text+0x5928392>
1459293f0:     	movss	%xmm0, 0x8(%rax,%r9,4)
1459293f7:     	jmp	0x14592942a <.text+0x592842a>
1459293f9:     	xorl	%eax, %eax
1459293fb:     	movd	%xmm0, %r8d
145929400:     	movq	%r15, 0x30(%rbp)
145929404:     	movq	%rax, 0x38(%rbp)
145929408:     	movq	$0x0, 0x40(%rbp)
145929410:     	movq	%r9, 0x48(%rbp)
145929414:     	movq	$0x81, 0x50(%rbp)
14592941c:     	leaq	-0x8(%rbp), %rcx
145929420:     	leaq	0x30(%rbp), %rdx
145929424:     	callq	0x1458e1710 <.text+0x58e0710>
145929429:     	nop
14592942a:     	mulss	0x471a69(%rip), %xmm9   # 0x145d9ae9c
145929433:     	movq	0x18(%rbp), %rax
145929437:     	testq	%rax, %rax
14592943a:     	je	0x1459294a9 <.text+0x59284a9>
14592943c:     	movq	0x20(%rbp), %rcx
145929440:     	movl	$0x82, %edx
145929445:     	movzwl	0x36(%rax), %r8d
14592944a:     	movl	%r8d, %r10d
14592944d:     	addl	%r10d, %r10d
145929450:     	movq	$-0x1, %r9
145929457:     	nopw	(%rax,%rax)
145929460:     	testq	%r10, %r10
145929463:     	je	0x145929490 <.text+0x5928490>
145929465:     	movzwl	0x3a(%rax,%r9,2), %r11d
14592946b:     	cmpl	%r11d, %edx
14592946e:     	seta	%r11b
145929472:     	sbbb	$0x0, %r11b
145929476:     	incq	%r9
145929479:     	addq	$-0x2, %r10
14592947d:     	cmpb	$0x1, %r11b
145929481:     	je	0x145929460 <.text+0x5928460>
145929483:     	movzbl	%r11b, %r8d
145929487:     	testl	%r8d, %r8d
14592948a:     	jne	0x145929493 <.text+0x5928493>
14592948c:     	jmp	0x1459294a0 <.text+0x59284a0>
14592948e:     	nop
145929490:     	movq	%r8, %r9
145929493:     	subq	$0x1, %rcx
145929497:     	jb	0x1459294ab <.text+0x59284ab>
145929499:     	movq	0x50(%rax,%r9,8), %rax
14592949e:     	jmp	0x145929445 <.text+0x5928445>
1459294a0:     	movss	%xmm9, 0x8(%rax,%r9,4)
1459294a7:     	jmp	0x1459294da <.text+0x59284da>
1459294a9:     	xorl	%eax, %eax
1459294ab:     	movd	%xmm9, %r8d
1459294b0:     	movq	%r15, 0x30(%rbp)
1459294b4:     	movq	%rax, 0x38(%rbp)
1459294b8:     	movq	$0x0, 0x40(%rbp)
1459294c0:     	movq	%r9, 0x48(%rbp)
1459294c4:     	movq	$0x82, 0x50(%rbp)
1459294cc:     	leaq	-0x8(%rbp), %rcx
1459294d0:     	leaq	0x30(%rbp), %rdx
1459294d4:     	callq	0x1458e1710 <.text+0x58e0710>
1459294d9:     	nop
1459294da:     	movl	0x24(%rdi), %r12d
1459294de:     	movq	0x18(%rbp), %rax
1459294e2:     	testq	%rax, %rax
1459294e5:     	je	0x145929557 <.text+0x5928557>
1459294e7:     	movq	0x20(%rbp), %rcx
1459294eb:     	movl	$0x83, %edx
1459294f0:     	movzwl	0x36(%rax), %r9d
1459294f5:     	movl	%r9d, %r10d
1459294f8:     	addl	%r10d, %r10d
1459294fb:     	movq	$-0x1, %r8
145929502:     	nopw	%cs:(%rax,%rax)
145929510:     	testq	%r10, %r10
145929513:     	je	0x145929540 <.text+0x5928540>
145929515:     	movzwl	0x3a(%rax,%r8,2), %r11d
14592951b:     	cmpl	%r11d, %edx
14592951e:     	seta	%r11b
145929522:     	sbbb	$0x0, %r11b
145929526:     	incq	%r8
145929529:     	addq	$-0x2, %r10
14592952d:     	cmpb	$0x1, %r11b
145929531:     	je	0x145929510 <.text+0x5928510>
145929533:     	movzbl	%r11b, %r9d
145929537:     	testl	%r9d, %r9d
14592953a:     	jne	0x145929543 <.text+0x5928543>
14592953c:     	jmp	0x145929550 <.text+0x5928550>
14592953e:     	nop
145929540:     	movq	%r9, %r8
145929543:     	subq	$0x1, %rcx
145929547:     	jb	0x145929559 <.text+0x5928559>
145929549:     	movq	0x50(%rax,%r8,8), %rax
14592954e:     	jmp	0x1459294f0 <.text+0x59284f0>
145929550:     	movl	%r12d, 0x8(%rax,%r8,4)
145929555:     	jmp	0x145929586 <.text+0x5928586>
145929557:     	xorl	%eax, %eax
145929559:     	movq	%r15, 0x30(%rbp)
14592955d:     	movq	%rax, 0x38(%rbp)
145929561:     	movq	$0x0, 0x40(%rbp)
145929569:     	movq	%r8, 0x48(%rbp)
14592956d:     	movq	$0x83, 0x50(%rbp)
145929575:     	leaq	-0x8(%rbp), %rcx
145929579:     	leaq	0x30(%rbp), %rdx
14592957d:     	movl	%r12d, %r8d
145929580:     	callq	0x1458e1710 <.text+0x58e0710>
145929585:     	nop
145929586:     	movq	0x18(%rbp), %rax
14592958a:     	testq	%rax, %rax
14592958d:     	je	0x1459295f7 <.text+0x59285f7>
14592958f:     	movq	0x20(%rbp), %rcx
145929593:     	movl	$0x84, %edx
145929598:     	movzwl	0x36(%rax), %r9d
14592959d:     	movl	%r9d, %r10d
1459295a0:     	addl	%r10d, %r10d
1459295a3:     	movq	$-0x1, %r8
1459295aa:     	nopw	(%rax,%rax)
1459295b0:     	testq	%r10, %r10
1459295b3:     	je	0x1459295e0 <.text+0x59285e0>
1459295b5:     	movzwl	0x3a(%rax,%r8,2), %r11d
1459295bb:     	cmpl	%r11d, %edx
1459295be:     	seta	%r11b
1459295c2:     	sbbb	$0x0, %r11b
1459295c6:     	incq	%r8
1459295c9:     	addq	$-0x2, %r10
1459295cd:     	cmpb	$0x1, %r11b
1459295d1:     	je	0x1459295b0 <.text+0x59285b0>
1459295d3:     	movzbl	%r11b, %r9d
1459295d7:     	testl	%r9d, %r9d
1459295da:     	jne	0x1459295e3 <.text+0x59285e3>
1459295dc:     	jmp	0x1459295f0 <.text+0x59285f0>
1459295de:     	nop
1459295e0:     	movq	%r9, %r8
1459295e3:     	subq	$0x1, %rcx
1459295e7:     	jb	0x1459295f9 <.text+0x59285f9>
1459295e9:     	movq	0x50(%rax,%r8,8), %rax
1459295ee:     	jmp	0x145929598 <.text+0x5928598>
1459295f0:     	movl	%r12d, 0x8(%rax,%r8,4)
1459295f5:     	jmp	0x145929626 <.text+0x5928626>
1459295f7:     	xorl	%eax, %eax
1459295f9:     	movq	%r15, 0x30(%rbp)
1459295fd:     	movq	%rax, 0x38(%rbp)
145929601:     	movq	$0x0, 0x40(%rbp)
145929609:     	movq	%r8, 0x48(%rbp)
14592960d:     	movq	$0x84, 0x50(%rbp)
145929615:     	leaq	-0x8(%rbp), %rcx
145929619:     	leaq	0x30(%rbp), %rdx
14592961d:     	movl	%r12d, %r8d
145929620:     	callq	0x1458e1710 <.text+0x58e0710>
145929625:     	nop
145929626:     	movq	0x18(%rbp), %rax
14592962a:     	testq	%rax, %rax
14592962d:     	je	0x14592969b <.text+0x592869b>
14592962f:     	movq	0x20(%rbp), %rcx
145929633:     	movl	$0x91, %edx
145929638:     	movzwl	0x36(%rax), %r9d
14592963d:     	movl	%r9d, %r10d
145929640:     	addl	%r10d, %r10d
145929643:     	movq	$-0x1, %r8
14592964a:     	nopw	(%rax,%rax)
145929650:     	testq	%r10, %r10
145929653:     	je	0x145929680 <.text+0x5928680>
145929655:     	movzwl	0x3a(%rax,%r8,2), %r11d
14592965b:     	cmpl	%r11d, %edx
14592965e:     	seta	%r11b
145929662:     	sbbb	$0x0, %r11b
145929666:     	incq	%r8
145929669:     	addq	$-0x2, %r10
14592966d:     	cmpb	$0x1, %r11b
145929671:     	je	0x145929650 <.text+0x5928650>
145929673:     	movzbl	%r11b, %r9d
145929677:     	testl	%r9d, %r9d
14592967a:     	jne	0x145929683 <.text+0x5928683>
14592967c:     	jmp	0x145929690 <.text+0x5928690>
14592967e:     	nop
145929680:     	movq	%r9, %r8
145929683:     	subq	$0x1, %rcx
145929687:     	jb	0x14592969d <.text+0x592869d>
145929689:     	movq	0x50(%rax,%r8,8), %rax
14592968e:     	jmp	0x145929638 <.text+0x5928638>
145929690:     	movl	$0x3f800000, 0x8(%rax,%r8,4) # imm = 0x3F800000
145929699:     	jmp	0x1459296cd <.text+0x59286cd>
14592969b:     	xorl	%eax, %eax
14592969d:     	movq	%r15, 0x30(%rbp)
1459296a1:     	movq	%rax, 0x38(%rbp)
1459296a5:     	movq	$0x0, 0x40(%rbp)
1459296ad:     	movq	%r8, 0x48(%rbp)
1459296b1:     	movq	$0x91, 0x50(%rbp)
1459296b9:     	leaq	-0x8(%rbp), %rcx
1459296bd:     	leaq	0x30(%rbp), %rdx
1459296c1:     	movl	$0x3f800000, %r8d       # imm = 0x3F800000
1459296c7:     	callq	0x1458e1710 <.text+0x58e0710>
1459296cc:     	nop
1459296cd:     	movl	$0x0, -0x10(%rbp)
1459296d4:     	movq	$0x0, -0x28(%rbp)
1459296dc:     	movq	$0x1, -0x20(%rbp)
1459296e4:     	movq	$0x0, -0x18(%rbp)
1459296ec:     	movdqu	0x154fba8(%rip), %xmm0  # 0x146e7929c
1459296f4:     	movdqa	%xmm0, -0x40(%rbp)
1459296f9:     	movabsq	$0x40490fdb40200000, %rax # imm = 0x40490FDB40200000
145929703:     	movq	%rax, -0x30(%rbp)
145929707:     	movl	$0x41100000, -0x3c(%rbp) # imm = 0x41100000
14592970e:     	movq	%xmm7, 0x30(%rbp)
145929713:     	movd	%xmm8, 0x38(%rbp)
145929719:     	movb	$0x1, 0x67(%rbp)
14592971d:     	movq	%r15, 0x38(%rsp)
145929722:     	leaq	-0x40(%rbp), %rax
145929726:     	movq	%rax, 0x30(%rsp)
14592972b:     	movss	%xmm10, 0x28(%rsp)
145929732:     	leaq	0x30(%rbp), %rax
145929736:     	movq	%rax, 0x20(%rsp)
14592973b:     	leaq	-0x28(%rbp), %rcx
14592973f:     	movq	%r14, %rdx
145929742:     	movb	$0x3, %r8b
145929745:     	xorl	%r9d, %r9d
145929748:     	callq	0x1458a7bf0 <.text+0x58a6bf0>
14592974d:     	nop
14592974e:     	movdqu	-0x28(%rbp), %xmm0
145929753:     	movups	-0x18(%rbp), %xmm1
145929757:     	movaps	%xmm1, 0x40(%rbp)
14592975b:     	movdqa	%xmm0, 0x30(%rbp)
145929760:     	movb	$0x0, 0x67(%rbp)
145929764:     	leaq	-0x8(%rbp), %rcx
145929768:     	leaq	0x30(%rbp), %rdx
14592976c:     	callq	0x1458a83c0 <.text+0x58a73c0>
145929771:     	nop
145929772:     	movq	0x5e0(%rsi), %r15
145929779:     	cmpq	0x5d0(%rsi), %r15
145929780:     	jne	0x14592978f <.text+0x592878f>
145929782:     	leaq	0x5d0(%rsi), %rcx
145929789:     	callq	0x145bcb530 <.text+0x5bca530>
14592978e:     	nop
14592978f:     	movq	0x5d8(%rsi), %rax
145929796:     	movq	%r15, %rcx
145929799:     	shlq	$0x5, %rcx
14592979d:     	movdqu	-0x8(%rbp), %xmm0
1459297a2:     	movups	0x8(%rbp), %xmm1
1459297a6:     	movups	%xmm1, 0x10(%rax,%rcx)
1459297ab:     	movdqu	%xmm0, (%rax,%rcx)
1459297b0:     	incq	%r15
1459297b3:     	movq	%r15, 0x5e0(%rsi)
1459297ba:     	movss	0x9ec(%rsi), %xmm9
1459297c3:     	movq	0xd8(%rsi), %r15
1459297ca:     	cmpq	0xc8(%rsi), %r15
1459297d1:     	jne	0x1459297e4 <.text+0x59287e4>
1459297d3:     	leaq	0xc8(%rsi), %rcx
1459297da:     	movb	$0x0, 0x67(%rbp)
1459297de:     	callq	0x145bfb200 <.text+0x5bfa200>
1459297e3:     	nop
1459297e4:     	movq	0xd0(%rsi), %rax
1459297eb:     	imulq	$0x78, %r15, %rcx
1459297ef:     	movq	0x10(%rbx), %rdx
1459297f3:     	movq	%rdx, 0x10(%rax,%rcx)
1459297f8:     	movups	(%rbx), %xmm0
1459297fb:     	movups	%xmm0, (%rax,%rcx)
1459297ff:     	movq	%rdi, 0x18(%rax,%rcx)
145929804:     	movq	%r14, 0x20(%rax,%rcx)
145929809:     	xorps	%xmm0, %xmm0
14592980c:     	movups	%xmm0, 0x28(%rax,%rcx)
145929811:     	movl	$0x0, 0x38(%rax,%rcx)
145929819:     	movq	%xmm7, 0x40(%rax,%rcx)
14592981f:     	movd	%xmm8, 0x48(%rax,%rcx)
145929826:     	movq	%xmm7, 0x4c(%rax,%rcx)
14592982c:     	movd	%xmm8, 0x54(%rax,%rcx)
145929833:     	movaps	0x714f36(%rip), %xmm0   # 0x14603e770
14592983a:     	movss	%xmm9, %xmm0            # xmm0 = xmm9[0],xmm0[1,2,3]
14592983f:     	shufps	$0x4, %xmm0, %xmm0      # xmm0 = xmm0[0,1,0,0]
145929843:     	addps	0x154ed76(%rip), %xmm0  # 0x146e785c0
14592984a:     	movups	%xmm0, 0x58(%rax,%rcx)
14592984f:     	movss	%xmm6, 0x68(%rax,%rcx)
145929855:     	movq	$0x3f800000, 0x6c(%rax,%rcx) # imm = 0x3F800000
14592985e:     	movl	$0x0, 0x74(%rax,%rcx)
145929866:     	incq	%r15
145929869:     	movq	%r15, 0xd8(%rsi)
145929870:     	leaq	0x18(%rbp), %rcx
145929874:     	callq	0x145994a00 <.text+0x5993a00>
145929879:     	movq	%r14, %rax
14592987c:     	movaps	0x70(%rbp), %xmm6
145929880:     	movaps	0x80(%rbp), %xmm7
145929887:     	movaps	0x90(%rbp), %xmm8
14592988f:     	movaps	0xa0(%rbp), %xmm9
145929897:     	movaps	0xb0(%rbp), %xmm10
14592989f:     	addq	$0x140, %rsp            # imm = 0x140
1459298a6:     	popq	%rbx
1459298a7:     	popq	%rdi
1459298a8:     	popq	%rsi
1459298a9:     	popq	%r12
1459298ab:     	popq	%r14
1459298ad:     	popq	%r15
1459298af:     	popq	%rbp
1459298b0:     	retq
