
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454edd70:     	pushq	%rbp
1454edd71:     	pushq	%rsi
1454edd72:     	pushq	%rdi
1454edd73:     	pushq	%rbx
1454edd74:     	subq	$0xd8, %rsp
1454edd7b:     	leaq	0x80(%rsp), %rbp
1454edd83:     	movaps	%xmm7, 0x40(%rbp)
1454edd87:     	movaps	%xmm6, 0x30(%rbp)
1454edd8b:     	movq	$-0x2, 0x28(%rbp)
1454edd93:     	movq	%rcx, %rsi
1454edd96:     	testb	%dl, %dl
1454edd98:     	je	0x1454eddb6 <.text+0x54ecdb6>
1454edd9a:     	movzbl	%dl, %eax
1454edd9d:     	cmpl	$0x1, %eax
1454edda0:     	jne	0x1454eddd1 <.text+0x54ecdd1>
1454edda2:     	movl	0x940(%rsi), %eax
1454edda8:     	cmpl	$0x1, %eax
1454eddab:     	adcl	$-0x1, %eax
1454eddae:     	movl	%eax, 0x940(%rsi)
1454eddb4:     	jmp	0x1454edde3 <.text+0x54ecde3>
1454eddb6:     	movl	0x93c(%rsi), %eax
1454eddbc:     	cmpl	$0x1, %eax
1454eddbf:     	adcl	$-0x1, %eax
1454eddc2:     	movl	%eax, 0x93c(%rsi)
1454eddc8:     	movb	$0x1, 0x9b6(%rsi)
1454eddcf:     	jmp	0x1454edde3 <.text+0x54ecde3>
1454eddd1:     	movl	0x944(%rsi), %eax
1454eddd7:     	cmpl	$0x1, %eax
1454eddda:     	adcl	$-0x1, %eax
1454edddd:     	movl	%eax, 0x944(%rsi)
1454edde3:     	movq	0x588(%rsi), %rdi
1454eddea:     	movq	0x590(%rsi), %rbx
1454eddf1:     	movq	$0x0, 0x590(%rsi)
1454eddfc:     	testq	%rbx, %rbx
1454eddff:     	je	0x1454ede24 <.text+0x54ece24>
1454ede01:     	nopw	%cs:(%rax,%rax)
1454ede10:     	movq	%rdi, %rcx
1454ede13:     	callq	0x145497810 <.text+0x5496810>
1454ede18:     	addq	$0xa0, %rdi
1454ede1f:     	decq	%rbx
1454ede22:     	jne	0x1454ede10 <.text+0x54ece10>
1454ede24:     	movq	0x548(%rsi), %rax
1454ede2b:     	testq	%rax, %rax
1454ede2e:     	je	0x1454edef7 <.text+0x54ecef7>
1454ede34:     	movsd	0x400(%rsi), %xmm6
1454ede3c:     	movss	0x488(%rsi), %xmm7
1454ede44:     	xorl	%edi, %edi
1454ede46:     	xorl	%ebx, %ebx
1454ede48:     	jmp	0x1454ede58 <.text+0x54ece58>
1454ede4a:     	nopw	(%rax,%rax)
1454ede50:     	incq	%rdi
1454ede53:     	cmpq	%rax, %rdi
1454ede56:     	jae	0x1454edead <.text+0x54ecead>
1454ede58:     	movq	0x540(%rsi), %rcx
1454ede5f:     	leaq	(%rdi,%rdi,8), %rdx
1454ede63:     	cmpl	$0x0, 0x20(%rcx,%rdx,8)
1454ede68:     	jne	0x1454ede50 <.text+0x54ece50>
1454ede6a:     	leaq	(%rcx,%rdx,8), %rcx
1454ede6e:     	cmpl	$0x0, 0x18(%rcx)
1454ede72:     	jne	0x1454ede93 <.text+0x54ece93>
1454ede74:     	movsd	0x34(%rcx), %xmm0
1454ede79:     	subps	%xmm6, %xmm0
1454ede7c:     	mulps	%xmm0, %xmm0
1454ede7f:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454ede83:     	addss	%xmm0, %xmm1
1454ede87:     	xorps	%xmm0, %xmm0
1454ede8a:     	sqrtss	%xmm1, %xmm0
1454ede8e:     	ucomiss	%xmm0, %xmm7
1454ede91:     	jb	0x1454ede50 <.text+0x54ece50>
1454ede93:     	addl	0x24(%rcx), %ebx
1454ede96:     	movq	%rsi, %rcx
1454ede99:     	movq	%rdi, %rdx
1454ede9c:     	callq	0x1454e3210 <.text+0x54e2210>
1454edea1:     	movq	0x548(%rsi), %rax
1454edea8:     	cmpq	%rax, %rdi
1454edeab:     	jb	0x1454ede58 <.text+0x54ece58>
1454edead:     	testl	%ebx, %ebx
1454edeaf:     	je	0x1454edef7 <.text+0x54ecef7>
1454edeb1:     	movl	%ebx, %eax
1454edeb3:     	xorps	%xmm0, %xmm0
1454edeb6:     	cvtsi2ss	%rax, %xmm0
1454edebb:     	mulss	0x48c(%rsi), %xmm0
1454edec3:     	callq	0x14577322f <.text+0x577222f>
1454edec8:     	maxss	0x4195c0(%rip), %xmm0   # 0x145907490
1454eded0:     	cvttss2si	%xmm0, %rax
1454eded5:     	xorl	%ecx, %ecx
1454eded7:     	xorps	%xmm1, %xmm1
1454ededa:     	ucomiss	%xmm1, %xmm0
1454ededd:     	cmovael	%eax, %ecx
1454edee0:     	ucomiss	0x419645(%rip), %xmm0   # 0x14590752c
1454edee7:     	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
1454edeec:     	cmovbel	%ecx, %edx
1454edeef:     	movq	%rsi, %rcx
1454edef2:     	callq	0x1454c69e0 <.text+0x54c59e0>
1454edef7:     	movb	$0x1, %dl
1454edef9:     	cmpl	$0x0, 0x940(%rsi)
1454edf00:     	jne	0x1454edf0d <.text+0x54ecf0d>
1454edf02:     	movb	$0x2, %dl
1454edf04:     	cmpl	$0x0, 0x944(%rsi)
1454edf0b:     	je	0x1454edf2b <.text+0x54ecf2b>
1454edf0d:     	movq	%rsi, %rcx
1454edf10:     	xorl	%r8d, %r8d
1454edf13:     	movaps	0x30(%rbp), %xmm6
1454edf17:     	movaps	0x40(%rbp), %xmm7
1454edf1b:     	addq	$0xd8, %rsp
1454edf22:     	popq	%rbx
1454edf23:     	popq	%rdi
1454edf24:     	popq	%rsi
1454edf25:     	popq	%rbp
1454edf26:     	jmp	0x1454ec7a0 <.text+0x54eb7a0>
1454edf2b:     	cmpl	$0x0, 0x93c(%rsi)
1454edf32:     	je	0x1454edf48 <.text+0x54ecf48>
1454edf34:     	xorl	%edx, %edx
1454edf36:     	cmpb	$0x1, 0x9ae(%rsi)
1454edf3d:     	jne	0x1454edf0d <.text+0x54ecf0d>
1454edf3f:     	cmpb	$0x0, 0x9af(%rsi)
1454edf46:     	jne	0x1454edf0d <.text+0x54ecf0d>
1454edf48:     	movb	$-0x1, 0x9b7(%rsi)
1454edf4f:     	movb	$0x0, 0x9af(%rsi)
1454edf56:     	cmpq	$0x0, 0x10(%rsi)
1454edf5b:     	movq	$0x0, 0x10(%rsi)
1454edf63:     	je	0x1454edfdc <.text+0x54ecfdc>
1454edf65:     	callq	0x140002200 <.text+0x1200>
1454edf6a:     	movl	$0x20, %ecx
1454edf6f:     	movl	$0x1, %edx
1454edf74:     	callq	0x1400021c0 <.text+0x11c0>
1454edf79:     	movq	%rax, 0x20(%rbp)
1454edf7d:     	testq	%rax, %rax
1454edf80:     	je	0x1454ee316 <.text+0x54ed316>
1454edf86:     	movq	0x560(%rsi), %rdi
1454edf8d:     	cmpq	0x550(%rsi), %rdi
1454edf94:     	jne	0x1454edfa3 <.text+0x54ecfa3>
1454edf96:     	leaq	0x550(%rsi), %rcx
1454edf9d:     	callq	0x145774710 <.text+0x5773710>
1454edfa2:     	nop
1454edfa3:     	movq	0x558(%rsi), %rax
1454edfaa:     	movq	%rdi, %rcx
1454edfad:     	shlq	$0x5, %rcx
1454edfb1:     	movq	$0x20, (%rax,%rcx)
1454edfb9:     	movq	0x20(%rbp), %rdx
1454edfbd:     	movq	%rdx, 0x8(%rax,%rcx)
1454edfc2:     	movq	$0x0, 0x10(%rax,%rcx)
1454edfcb:     	movw	$0x17e, 0x18(%rax,%rcx) # imm = 0x17E
1454edfd2:     	incq	%rdi
1454edfd5:     	movq	%rdi, 0x560(%rsi)
1454edfdc:     	movb	$0x1, 0x9b9(%rsi)
1454edfe3:     	movq	%rsi, %rcx
1454edfe6:     	callq	0x1454a5900 <.text+0x54a4900>
1454edfeb:     	movss	0x934(%rsi), %xmm6
1454edff3:     	leaq	0x308(%rsi), %rcx
1454edffa:     	movq	0x318(%rsi), %rdi
1454ee001:     	testq	%rdi, %rdi
1454ee004:     	je	0x1454ee03c <.text+0x54ed03c>
1454ee006:     	movq	0x310(%rsi), %rax
1454ee00d:     	xorl	%edx, %edx
1454ee00f:     	movq	%rax, %r8
1454ee012:     	nopw	%cs:(%rax,%rax)
1454ee020:     	cmpl	$0x3fc, 0xc(%r8)        # imm = 0x3FC
1454ee028:     	je	0x1454ee1fe <.text+0x54ed1fe>
1454ee02e:     	incq	%rdx
1454ee031:     	addq	$0x18, %r8
1454ee035:     	cmpq	%rdx, %rdi
1454ee038:     	jne	0x1454ee020 <.text+0x54ed020>
1454ee03a:     	jmp	0x1454ee03e <.text+0x54ed03e>
1454ee03c:     	xorl	%edi, %edi
1454ee03e:     	addss	0x41944a(%rip), %xmm6   # 0x145907490
1454ee046:     	cmpq	(%rcx), %rdi
1454ee049:     	jne	0x1454ee050 <.text+0x54ed050>
1454ee04b:     	callq	0x14577ffc0 <.text+0x577efc0>
1454ee050:     	movq	0x310(%rsi), %rax
1454ee057:     	leaq	(%rdi,%rdi,2), %rcx
1454ee05b:     	movl	$0xb, (%rax,%rcx,8)
1454ee062:     	movl	$0x3fc, 0xc(%rax,%rcx,8) # imm = 0x3FC
1454ee06a:     	movss	%xmm6, 0x10(%rax,%rcx,8)
1454ee070:     	movl	$0x0, 0x14(%rax,%rcx,8)
1454ee078:     	incq	%rdi
1454ee07b:     	movq	%rdi, 0x318(%rsi)
1454ee082:     	movq	0x3e8(%rsi), %rdx
1454ee089:     	movq	%rdx, -0x30(%rbp)
1454ee08d:     	movl	$0x2, -0x8(%rbp)
1454ee094:     	movl	$0x0, -0x3c(%rbp)
1454ee09b:     	leaq	-0x3c(%rbp), %rax
1454ee09f:     	movq	%rax, 0x30(%rsp)
1454ee0a4:     	leaq	-0x8(%rbp), %rax
1454ee0a8:     	movq	%rax, 0x28(%rsp)
1454ee0ad:     	movq	$0x1, 0x20(%rsp)
1454ee0b6:     	leaq	-0x28(%rbp), %rcx
1454ee0ba:     	leaq	-0x30(%rbp), %r9
1454ee0be:     	movl	$0x3fc, %r8d            # imm = 0x3FC
1454ee0c4:     	callq	0x145466ab0 <.text+0x5465ab0>
1454ee0c9:     	movq	0x560(%rsi), %rdi
1454ee0d0:     	cmpq	0x550(%rsi), %rdi
1454ee0d7:     	jne	0x1454ee0e6 <.text+0x54ed0e6>
1454ee0d9:     	leaq	0x550(%rsi), %rcx
1454ee0e0:     	callq	0x145774710 <.text+0x5773710>
1454ee0e5:     	nop
1454ee0e6:     	movq	0x558(%rsi), %rax
1454ee0ed:     	movq	%rdi, %rcx
1454ee0f0:     	shlq	$0x5, %rcx
1454ee0f4:     	movups	-0x28(%rbp), %xmm0
1454ee0f8:     	movups	-0x18(%rbp), %xmm1
1454ee0fc:     	movups	%xmm1, 0x10(%rax,%rcx)
1454ee101:     	movups	%xmm0, (%rax,%rcx)
1454ee105:     	incq	%rdi
1454ee108:     	movq	%rdi, 0x560(%rsi)
1454ee10f:     	movq	%rsi, %rcx
1454ee112:     	callq	0x14549e650 <.text+0x549d650>
1454ee117:     	callq	0x140002200 <.text+0x1200>
1454ee11c:     	movl	$0x1, %ecx
1454ee121:     	movl	$0x1, %edx
1454ee126:     	callq	0x1400021c0 <.text+0x11c0>
1454ee12b:     	testq	%rax, %rax
1454ee12e:     	je	0x1454ee305 <.text+0x54ed305>
1454ee134:     	movb	$0x7b, (%rax)
1454ee137:     	movq	$0x1, -0x28(%rbp)
1454ee13f:     	movq	%rax, -0x20(%rbp)
1454ee143:     	movq	$0x1, -0x18(%rbp)
1454ee14b:     	movb	$0x1, -0x10(%rbp)
1454ee14f:     	leaq	0x1509f52(%rip), %rax   # 0x1469f80a8
1454ee156:     	movq	%rax, 0x20(%rsp)
1454ee15b:     	movq	$0x6, 0x28(%rsp)
1454ee164:     	leaq	0x1508969(%rip), %r8    # 0x1469f6ad4
1454ee16b:     	leaq	-0x8(%rbp), %rcx
1454ee16f:     	leaq	-0x28(%rbp), %rdx
1454ee173:     	movl	$0x4, %r9d
1454ee179:     	callq	0x145456ed0 <.text+0x5455ed0>
1454ee17e:     	movq	-0x8(%rbp), %rax
1454ee182:     	movq	0x8(%rbp), %rdi
1454ee186:     	movq	%rax, 0x20(%rbp)
1454ee18a:     	cmpq	%rdi, %rax
1454ee18d:     	je	0x1454ee2d6 <.text+0x54ed2d6>
1454ee193:     	movq	(%rbp), %rax
1454ee197:     	movq	%rax, 0x18(%rbp)
1454ee19b:     	movb	$0x7d, (%rax,%rdi)
1454ee19f:     	movq	0x578(%rsi), %rbx
1454ee1a6:     	cmpq	0x568(%rsi), %rbx
1454ee1ad:     	jne	0x1454ee1bc <.text+0x54ed1bc>
1454ee1af:     	leaq	0x568(%rsi), %rcx
1454ee1b6:     	callq	0x1457745c0 <.text+0x57735c0>
1454ee1bb:     	nop
1454ee1bc:     	incq	%rdi
1454ee1bf:     	movq	0x570(%rsi), %rax
1454ee1c6:     	leaq	(%rbx,%rbx,2), %rcx
1454ee1ca:     	movq	0x20(%rbp), %rdx
1454ee1ce:     	movq	%rdx, (%rax,%rcx,8)
1454ee1d2:     	movq	0x18(%rbp), %rdx
1454ee1d6:     	movq	%rdx, 0x8(%rax,%rcx,8)
1454ee1db:     	movq	%rdi, 0x10(%rax,%rcx,8)
1454ee1e0:     	incq	%rbx
1454ee1e3:     	movq	%rbx, 0x578(%rsi)
1454ee1ea:     	movaps	0x30(%rbp), %xmm6
1454ee1ee:     	movaps	0x40(%rbp), %xmm7
1454ee1f2:     	addq	$0xd8, %rsp
1454ee1f9:     	popq	%rbx
1454ee1fa:     	popq	%rdi
1454ee1fb:     	popq	%rsi
1454ee1fc:     	popq	%rbp
1454ee1fd:     	retq
1454ee1fe:     	leaq	0x1(%rdx), %r10
1454ee202:     	cmpq	%rdi, %r10
1454ee205:     	jae	0x1454ee247 <.text+0x54ed247>
1454ee207:     	leaq	-0x2(%rdi), %r9
1454ee20b:     	leal	(%rdi,%rdx), %ebx
1454ee20e:     	movq	%rdx, %r11
1454ee211:     	testb	$0x1, %bl
1454ee214:     	jne	0x1454ee23f <.text+0x54ed23f>
1454ee216:     	cmpl	$0x3fc, 0x24(%r8)       # imm = 0x3FC
1454ee21e:     	movq	%rdx, %r11
1454ee221:     	je	0x1454ee23b <.text+0x54ed23b>
1454ee223:     	leaq	0x18(%r8), %r10
1454ee227:     	movq	0x10(%r10), %r11
1454ee22b:     	movq	%r11, 0x10(%r8)
1454ee22f:     	movups	(%r10), %xmm0
1454ee233:     	movups	%xmm0, (%r8)
1454ee237:     	leaq	0x1(%rdx), %r11
1454ee23b:     	leaq	0x2(%rdx), %r10
1454ee23f:     	cmpq	%rdx, %r9
1454ee242:     	movq	%r11, %rdx
1454ee245:     	jne	0x1454ee267 <.text+0x54ed267>
1454ee247:     	movq	%rdx, 0x318(%rsi)
1454ee24e:     	movq	%rdx, %rdi
1454ee251:     	addss	0x419237(%rip), %xmm6   # 0x145907490
1454ee259:     	cmpq	(%rcx), %rdi
1454ee25c:     	je	0x1454ee04b <.text+0x54ed04b>
1454ee262:     	jmp	0x1454ee050 <.text+0x54ed050>
1454ee267:     	leaq	(%r10,%r10,2), %rdx
1454ee26b:     	leaq	(%rax,%rdx,8), %r8
1454ee26f:     	subq	%r10, %rdi
1454ee272:     	movq	%r11, %rdx
1454ee275:     	jmp	0x1454ee281 <.text+0x54ed281>
1454ee277:     	addq	$0x30, %r8
1454ee27b:     	addq	$-0x2, %rdi
1454ee27f:     	je	0x1454ee247 <.text+0x54ed247>
1454ee281:     	cmpl	$0x3fc, 0xc(%r8)        # imm = 0x3FC
1454ee289:     	jne	0x1454ee297 <.text+0x54ed297>
1454ee28b:     	cmpl	$0x3fc, 0x24(%r8)       # imm = 0x3FC
1454ee293:     	je	0x1454ee277 <.text+0x54ed277>
1454ee295:     	jmp	0x1454ee2ba <.text+0x54ed2ba>
1454ee297:     	leaq	(%rdx,%rdx,2), %r9
1454ee29b:     	movq	0x10(%r8), %r10
1454ee29f:     	movq	%r10, 0x10(%rax,%r9,8)
1454ee2a4:     	movups	(%r8), %xmm0
1454ee2a8:     	movups	%xmm0, (%rax,%r9,8)
1454ee2ad:     	incq	%rdx
1454ee2b0:     	cmpl	$0x3fc, 0x24(%r8)       # imm = 0x3FC
1454ee2b8:     	je	0x1454ee277 <.text+0x54ed277>
1454ee2ba:     	leaq	(%rdx,%rdx,2), %r9
1454ee2be:     	movq	0x28(%r8), %r10
1454ee2c2:     	movq	%r10, 0x10(%rax,%r9,8)
1454ee2c7:     	movups	0x18(%r8), %xmm0
1454ee2cc:     	movups	%xmm0, (%rax,%r9,8)
1454ee2d1:     	incq	%rdx
1454ee2d4:     	jmp	0x1454ee277 <.text+0x54ed277>
1454ee2d6:     	movq	$0x1, 0x20(%rsp)
1454ee2df:     	leaq	-0x8(%rbp), %rcx
1454ee2e3:     	movl	$0x1, %r8d
1454ee2e9:     	movl	$0x1, %r9d
1454ee2ef:     	movq	%rdi, %rdx
1454ee2f2:     	callq	0x1457744b0 <.text+0x57734b0>
1454ee2f7:     	nop
1454ee2f8:     	movq	-0x8(%rbp), %rax
1454ee2fc:     	movq	%rax, 0x20(%rbp)
1454ee300:     	jmp	0x1454ee193 <.text+0x54ed193>
1454ee305:     	movl	$0x1, %ecx
1454ee30a:     	movl	$0x1, %edx
1454ee30f:     	callq	0x14590379b <.text+0x590279b>
1454ee314:     	ud2
1454ee316:     	movl	$0x1, %ecx
1454ee31b:     	movl	$0x20, %edx
1454ee320:     	callq	0x14590379b <.text+0x590279b>
1454ee325:     	ud2
