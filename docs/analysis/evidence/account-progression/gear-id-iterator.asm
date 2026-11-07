
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14553eda0:     	pushq	%rbp
14553eda1:     	pushq	%r15
14553eda3:     	pushq	%r14
14553eda5:     	pushq	%r13
14553eda7:     	pushq	%r12
14553eda9:     	pushq	%rsi
14553edaa:     	pushq	%rdi
14553edab:     	pushq	%rbx
14553edac:     	subq	$0x98, %rsp
14553edb3:     	leaq	0x80(%rsp), %rbp
14553edbb:     	movq	$-0x2, 0x10(%rbp)
14553edc3:     	movq	0x58(%rdx), %r14
14553edc7:     	movq	0x60(%rdx), %rax
14553edcb:     	movq	%rax, -0x38(%rbp)
14553edcf:     	movq	0x8(%rdx), %rsi
14553edd3:     	movq	0x50(%rdx), %r12
14553edd7:     	cmpq	$0x1, (%rdx)
14553eddb:     	jne	0x14553edfa <.text+0x553ddfa>
14553eddd:     	movq	0x10(%rdx), %r9
14553ede1:     	cmpq	%r9, %rsi
14553ede4:     	jae	0x14553edf3 <.text+0x553ddf3>
14553ede6:     	movq	0x18(%rdx), %r10
14553edea:     	movzbl	0x20(%rdx), %eax
14553edee:     	jmp	0x14553ef55 <.text+0x553df55>
14553edf3:     	movq	$0x0, (%rdx)
14553edfa:     	testq	%r12, %r12
14553edfd:     	je	0x14553eed2 <.text+0x553ded2>
14553ee03:     	cmpq	%r14, %r12
14553ee06:     	je	0x14553eed5 <.text+0x553ded5>
14553ee0c:     	movq	%rcx, %r15
14553ee0f:     	leaq	0x8(%rdx), %r8
14553ee13:     	addq	$0x8, %r12
14553ee17:     	movq	%r12, 0x50(%rdx)
14553ee1b:     	movq	-0x38(%rbp), %rax
14553ee1f:     	movzbl	(%rax), %eax
14553ee22:     	leal	-0x1(%rax), %ecx
14553ee25:     	movl	$0x5df, %r11d           # imm = 0x5DF
14553ee2b:     	shrl	%cl, %r11d
14553ee2e:     	movzbl	%cl, %edi
14553ee31:     	xorb	$0x1, %r11b
14553ee35:     	xorps	%xmm0, %xmm0
14553ee38:     	xorl	%esi, %esi
14553ee3a:     	leaq	0x17f70ff(%rip), %rbx   # 0x146d35f40
14553ee41:     	movq	-0x8(%r12), %r10
14553ee46:     	cmpb	$0xa, %cl
14553ee49:     	ja	0x14553eea0 <.text+0x553dea0>
14553ee4b:     	nopl	(%rax,%rax)
14553ee50:     	testb	$0x1, %r11b
14553ee54:     	jne	0x14553eea0 <.text+0x553dea0>
14553ee56:     	movq	(%rbx,%rdi,8), %r9
14553ee5a:     	movq	0x80(%r9), %r9
14553ee61:     	addq	$0x8, %r9
14553ee65:     	movq	$0x1, (%rdx)
14553ee6c:     	movq	$0x0, 0x8(%rdx)
14553ee74:     	movq	%r9, 0x10(%rdx)
14553ee78:     	movq	%r10, 0x18(%rdx)
14553ee7c:     	movb	%al, 0x20(%rdx)
14553ee7f:     	jne	0x14553ef52 <.text+0x553df52>
14553ee85:     	movq	$0x0, (%rdx)
14553ee8c:     	cmpq	%r14, %r12
14553ee8f:     	jne	0x14553eebe <.text+0x553debe>
14553ee91:     	jmp	0x14553eedd <.text+0x553dedd>
14553ee93:     	nopw	%cs:(%rax,%rax)
14553eea0:     	movq	$0x1, (%rdx)
14553eea7:     	movups	%xmm0, (%r8)
14553eeab:     	movq	%r10, 0x18(%rdx)
14553eeaf:     	movb	%al, 0x20(%rdx)
14553eeb2:     	movq	$0x0, (%rdx)
14553eeb9:     	cmpq	%r14, %r12
14553eebc:     	je	0x14553eedd <.text+0x553dedd>
14553eebe:     	addq	$0x8, %r12
14553eec2:     	movq	%r12, 0x50(%rdx)
14553eec6:     	movq	-0x8(%r12), %r10
14553eecb:     	cmpb	$0xa, %cl
14553eece:     	jbe	0x14553ee50 <.text+0x553de50>
14553eed0:     	jmp	0x14553eea0 <.text+0x553dea0>
14553eed2:     	xorl	%r12d, %r12d
14553eed5:     	cmpl	$0x1, 0x28(%rdx)
14553eed9:     	je	0x14553eee6 <.text+0x553dee6>
14553eedb:     	jmp	0x14553ef36 <.text+0x553df36>
14553eedd:     	movq	%r15, %rcx
14553eee0:     	cmpl	$0x1, 0x28(%rdx)
14553eee4:     	jne	0x14553ef36 <.text+0x553df36>
14553eee6:     	movq	0x30(%rdx), %rax
14553eeea:     	cmpq	0x38(%rdx), %rax
14553eeee:     	jae	0x14553ef36 <.text+0x553df36>
14553eef0:     	movq	%rcx, -0x30(%rbp)
14553eef4:     	leaq	0x1(%rax), %rcx
14553eef8:     	movq	%rcx, 0x30(%rdx)
14553eefc:     	movq	0x40(%rdx), %rcx
14553ef00:     	movzbl	0x48(%rdx), %r8d
14553ef05:     	imull	$0x3e8, %r8d, %r8d      # imm = 0x3E8
14553ef0c:     	imull	$0x64, %eax, %eax
14553ef0f:     	cmpq	$0x5, %rcx
14553ef13:     	movl	$0x5, %r9d
14553ef19:     	cmovbq	%rcx, %r9
14553ef1d:     	leal	(%r9,%r9,4), %ecx
14553ef21:     	addl	%r8d, %eax
14553ef24:     	leal	(%rax,%rcx,2), %r13d
14553ef28:     	addl	$0x186a0, %r13d         # imm = 0x186A0
14553ef2f:     	xorl	%eax, %eax
14553ef31:     	xorl	%r9d, %r9d
14553ef34:     	jmp	0x14553efab <.text+0x553dfab>
14553ef36:     	movq	$0x0, (%rcx)
14553ef3d:     	movq	$0x4, 0x8(%rcx)
14553ef45:     	movq	$0x0, 0x10(%rcx)
14553ef4d:     	jmp	0x14553f254 <.text+0x553e254>
14553ef52:     	movq	%r15, %rcx
14553ef55:     	movq	%rcx, -0x30(%rbp)
14553ef59:     	movzbl	%al, %eax
14553ef5c:     	imull	$0x3e8, %eax, %eax      # imm = 0x3E8
14553ef62:     	imull	$0x64, %esi, %ecx
14553ef65:     	addl	%eax, %ecx
14553ef67:     	cmpq	$0x5, %r10
14553ef6b:     	movl	$0x5, %r8d
14553ef71:     	cmovbq	%r10, %r8
14553ef75:     	incq	%rsi
14553ef78:     	movq	$0x0, (%rbp)
14553ef80:     	subq	%rsi, %r9
14553ef83:     	movl	$0x0, %eax
14553ef88:     	cmovaeq	%r9, %rax
14553ef8c:     	movq	%rsi, 0x8(%rdx)
14553ef90:     	leal	(%r8,%r8,4), %r8d
14553ef94:     	leal	(%rcx,%r8,2), %r13d
14553ef98:     	addl	$0x186a0, %r13d         # imm = 0x186A0
14553ef9f:     	movl	$0x1, %r9d
14553efa5:     	cmpl	$0x1, 0x28(%rdx)
14553efa9:     	jne	0x14553efce <.text+0x553dfce>
14553efab:     	movq	0x38(%rdx), %rcx
14553efaf:     	xorl	%r8d, %r8d
14553efb2:     	subq	0x30(%rdx), %rcx
14553efb6:     	cmovaeq	%rcx, %r8
14553efba:     	addq	%rax, %r8
14553efbd:     	movq	$-0x1, %rax
14553efc4:     	cmovaeq	%r8, %rax
14553efc8:     	movb	$0x1, %cl
14553efca:     	movq	%rcx, (%rbp)
14553efce:     	incq	%rax
14553efd1:     	movq	$-0x1, %rcx
14553efd8:     	cmovneq	%rax, %rcx
14553efdc:     	cmpq	$0x5, %rcx
14553efe0:     	movl	$0x4, %edi
14553efe5:     	movl	$0x4, %r15d
14553efeb:     	cmovaeq	%rcx, %r15
14553efef:     	leaq	(,%r15,4), %rbx
14553eff7:     	shrq	$0x3e, %rcx
14553effb:     	setne	%al
14553effe:     	movabsq	$0x7ffffffffffffffc, %rcx # imm = 0x7FFFFFFFFFFFFFFC
14553f008:     	cmpq	%rcx, %rbx
14553f00b:     	seta	%cl
14553f00e:     	orb	%al, %cl
14553f010:     	je	0x14553f021 <.text+0x553e021>
14553f012:     	xorl	%edi, %edi
14553f014:     	movq	%rdi, %rcx
14553f017:     	movq	%rbx, %rdx
14553f01a:     	callq	0x14590379b <.text+0x590279b>
14553f01f:     	ud2
14553f021:     	movq	%r9, -0x50(%rbp)
14553f025:     	movq	%rdx, -0x8(%rbp)
14553f029:     	callq	0x140002200 <.text+0x1200>
14553f02e:     	movl	$0x4, %edx
14553f033:     	movq	%rbx, %rcx
14553f036:     	callq	0x1400021c0 <.text+0x11c0>
14553f03b:     	testq	%rax, %rax
14553f03e:     	je	0x14553f014 <.text+0x553e014>
14553f040:     	movl	%r13d, (%rax)
14553f043:     	movq	%r15, -0x28(%rbp)
14553f047:     	movq	%rax, -0x20(%rbp)
14553f04b:     	movq	$0x1, -0x18(%rbp)
14553f053:     	movq	-0x8(%rbp), %rcx
14553f057:     	movq	0x10(%rcx), %r15
14553f05b:     	movq	0x18(%rcx), %rdx
14553f05f:     	movq	%rdx, 0x8(%rbp)
14553f063:     	movzbl	0x20(%rcx), %edx
14553f067:     	movq	%rdx, -0x48(%rbp)
14553f06b:     	movq	0x30(%rcx), %r10
14553f06f:     	movq	0x40(%rcx), %rdx
14553f073:     	movzbl	0x48(%rcx), %r8d
14553f078:     	imull	$0x3e8, %r8d, %r8d      # imm = 0x3E8
14553f07f:     	cmpq	$0x5, %rdx
14553f083:     	movl	$0x5, %r9d
14553f089:     	cmovaeq	%r9, %rdx
14553f08d:     	movq	0x38(%rcx), %rcx
14553f091:     	movq	%rcx, -0x40(%rbp)
14553f095:     	leal	(%rdx,%rdx,4), %ecx
14553f098:     	leal	(%r8,%rcx,2), %ecx
14553f09c:     	addl	$0x186a0, %ecx          # imm = 0x186A0
14553f0a2:     	movl	%ecx, -0xc(%rbp)
14553f0a5:     	movl	$0x1, %edi
14553f0aa:     	movq	$-0x1, %r11
14553f0b1:     	movq	-0x50(%rbp), %r13
14553f0b5:     	movq	%rsi, %r9
14553f0b8:     	jmp	0x14553f11c <.text+0x553e11c>
14553f0ba:     	nopw	(%rax,%rax)
14553f0c0:     	movq	-0x40(%rbp), %rax
14553f0c4:     	movq	%r10, %r14
14553f0c7:     	subq	%r10, %rax
14553f0ca:     	movl	$0x0, %ecx
14553f0cf:     	cmovaeq	%rax, %rcx
14553f0d3:     	addq	%rcx, %r8
14553f0d6:     	cmovbq	%r11, %r8
14553f0da:     	incq	%r8
14553f0dd:     	cmoveq	%r11, %r8
14553f0e1:     	movq	$0x4, 0x20(%rsp)
14553f0ea:     	movl	$0x4, %r9d
14553f0f0:     	leaq	-0x28(%rbp), %rcx
14553f0f4:     	movq	%rdi, %rdx
14553f0f7:     	callq	0x1457744b0 <.text+0x57734b0>
14553f0fc:     	nop
14553f0fd:     	movq	-0x20(%rbp), %rax
14553f101:     	movq	%r14, %r10
14553f104:     	movq	%rsi, %r14
14553f107:     	movq	$-0x1, %r11
14553f10e:     	movq	-0x8(%rbp), %r9
14553f112:     	movl	%ebx, (%rax,%rdi,4)
14553f115:     	incq	%rdi
14553f118:     	movq	%rdi, -0x18(%rbp)
14553f11c:     	cmpq	$0x1, %r13
14553f120:     	jne	0x14553f170 <.text+0x553e170>
14553f122:     	cmpq	%r15, %r9
14553f125:     	jae	0x14553f170 <.text+0x553e170>
14553f127:     	movzbl	-0x48(%rbp), %ecx
14553f12b:     	imull	$0x3e8, %ecx, %ecx      # imm = 0x3E8
14553f131:     	movq	0x8(%rbp), %r8
14553f135:     	cmpq	$0x5, %r8
14553f139:     	movl	$0x5, %edx
14553f13e:     	cmovbq	%r8, %rdx
14553f142:     	imull	$0x64, %r9d, %r8d
14553f146:     	incq	%r9
14553f149:     	leal	(%rdx,%rdx,4), %edx
14553f14c:     	leal	(%rcx,%rdx,2), %ecx
14553f14f:     	leal	(%r8,%rcx), %ebx
14553f153:     	addl	$0x186a0, %ebx          # imm = 0x186A0
14553f159:     	movl	$0x1, %r13d
14553f15f:     	cmpq	-0x28(%rbp), %rdi
14553f163:     	jne	0x14553f112 <.text+0x553e112>
14553f165:     	jmp	0x14553f212 <.text+0x553e212>
14553f16a:     	nopw	(%rax,%rax)
14553f170:     	testq	%r12, %r12
14553f173:     	je	0x14553f1d8 <.text+0x553e1d8>
14553f175:     	cmpq	%r14, %r12
14553f178:     	je	0x14553f1ec <.text+0x553e1ec>
14553f17a:     	movq	-0x38(%rbp), %rcx
14553f17e:     	movzbl	(%rcx), %ecx
14553f181:     	movq	%rcx, -0x48(%rbp)
14553f185:     	decl	%ecx
14553f187:     	movl	$0x5df, %edx            # imm = 0x5DF
14553f18c:     	shrl	%cl, %edx
14553f18e:     	movzbl	%cl, %r8d
14553f192:     	xorb	$0x1, %dl
14553f195:     	leaq	0x17f6da4(%rip), %rsi   # 0x146d35f40
14553f19c:     	jmp	0x14553f1a9 <.text+0x553e1a9>
14553f19e:     	nop
14553f1a0:     	addq	$0x8, %r12
14553f1a4:     	cmpq	%r14, %r12
14553f1a7:     	je	0x14553f1dd <.text+0x553e1dd>
14553f1a9:     	cmpb	$0xa, %cl
14553f1ac:     	ja	0x14553f1a0 <.text+0x553e1a0>
14553f1ae:     	testb	$0x1, %dl
14553f1b1:     	jne	0x14553f1a0 <.text+0x553e1a0>
14553f1b3:     	movq	(%rsi,%r8,8), %r9
14553f1b7:     	movq	0x80(%r9), %r15
14553f1be:     	addq	$0x8, %r15
14553f1c2:     	je	0x14553f1a0 <.text+0x553e1a0>
14553f1c4:     	movq	(%r12), %rcx
14553f1c8:     	movq	%rcx, 0x8(%rbp)
14553f1cc:     	addq	$0x8, %r12
14553f1d0:     	xorl	%r9d, %r9d
14553f1d3:     	jmp	0x14553f127 <.text+0x553e127>
14553f1d8:     	xorl	%r12d, %r12d
14553f1db:     	jmp	0x14553f1ec <.text+0x553e1ec>
14553f1dd:     	movq	-0x8(%r12), %rcx
14553f1e2:     	movq	%rcx, 0x8(%rbp)
14553f1e6:     	xorl	%r15d, %r15d
14553f1e9:     	xorl	%r9d, %r9d
14553f1ec:     	cmpq	-0x40(%rbp), %r10
14553f1f0:     	setb	%cl
14553f1f3:     	andb	(%rbp), %cl
14553f1f6:     	cmpb	$0x1, %cl
14553f1f9:     	jne	0x14553f241 <.text+0x553e241>
14553f1fb:     	imull	$0x64, %r10d, %ebx
14553f1ff:     	incq	%r10
14553f202:     	addl	-0xc(%rbp), %ebx
14553f205:     	xorl	%r13d, %r13d
14553f208:     	cmpq	-0x28(%rbp), %rdi
14553f20c:     	jne	0x14553f112 <.text+0x553e112>
14553f212:     	movq	%r14, %rsi
14553f215:     	movq	%r15, %r8
14553f218:     	movq	%r9, -0x8(%rbp)
14553f21c:     	subq	%r9, %r8
14553f21f:     	movl	$0x0, %eax
14553f224:     	cmovbq	%rax, %r8
14553f228:     	testq	%r13, %r13
14553f22b:     	cmoveq	%r13, %r8
14553f22f:     	cmpb	$0x0, (%rbp)
14553f233:     	jne	0x14553f0c0 <.text+0x553e0c0>
14553f239:     	movq	%r10, %r14
14553f23c:     	jmp	0x14553f0da <.text+0x553e0da>
14553f241:     	movq	-0x18(%rbp), %rax
14553f245:     	movq	-0x30(%rbp), %rcx
14553f249:     	movq	%rax, 0x10(%rcx)
14553f24d:     	movups	-0x28(%rbp), %xmm0
14553f251:     	movups	%xmm0, (%rcx)
14553f254:     	movq	%rcx, %rax
14553f257:     	addq	$0x98, %rsp
14553f25e:     	popq	%rbx
14553f25f:     	popq	%rdi
14553f260:     	popq	%rsi
14553f261:     	popq	%r12
14553f263:     	popq	%r13
14553f265:     	popq	%r14
14553f267:     	popq	%r15
14553f269:     	popq	%rbp
14553f26a:     	retq
