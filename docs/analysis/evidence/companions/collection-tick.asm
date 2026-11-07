
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14590cbbe:     	movzbl	0x28d(%rcx), %eax
14590cbc5:     	movss	0x48c(%rcx), %xmm1
14590cbcd:     	xorps	%xmm0, %xmm0
14590cbd0:     	cvtsi2ss	%eax, %xmm0
14590cbd4:     	mulss	0x460934(%rip), %xmm0   # 0x145d6d510
14590cbdc:     	movss	0x460788(%rip), %xmm7   # 0x145d6d36c
14590cbe4:     	addss	%xmm7, %xmm0
14590cbe8:     	mulss	0x460730(%rip), %xmm0   # 0x145d6d320
14590cbf0:     	maxss	%xmm7, %xmm1
14590cbf4:     	mulss	%xmm0, %xmm1
14590cbf8:     	movss	0x467144(%rip), %xmm0   # 0x145d73d44
14590cc00:     	addss	%xmm9, %xmm0
14590cc05:     	movss	%xmm0, 0x348(%rbp)
14590cc0d:     	movss	0x464027(%rip), %xmm0   # 0x145d70c3c
14590cc15:     	movss	%xmm1, 0x328(%rbp)
14590cc1d:     	mulss	%xmm1, %xmm0
14590cc21:     	movss	%xmm0, 0x208(%rbp)
14590cc29:     	xorps	%xmm12, %xmm12
14590cc2d:     	leaq	0x2e0(%rbp), %r12
14590cc34:     	movss	0x4ab9e3(%rip), %xmm11  # 0x145db8620
14590cc3d:     	movss	0x5cacca(%rip), %xmm14  # 0x145ed7910
14590cc46:     	movl	$0x498, %r13d           # imm = 0x498
14590cc4c:     	xorl	%r15d, %r15d
14590cc4f:     	movq	%r14, 0x330(%rbp)
14590cc56:     	jmp	0x14590cc7c <.text+0x590bc7c>
14590cc58:     	movl	$0x0, 0x18(%rax)
14590cc5f:     	movss	%xmm9, 0x1c(%rax)
14590cc65:     	nopw	%cs:(%rax,%rax)
14590cc70:     	incq	%r15
14590cc73:     	cmpq	%r14, %r15
14590cc76:     	je	0x14590d698 <.text+0x590c698>
14590cc7c:     	movq	0x378(%rbp), %rax
14590cc83:     	movq	0x900(%rax), %rdx
14590cc8a:     	cmpq	%rdx, %r15
14590cc8d:     	jae	0x145911484 <.text+0x5910484>
14590cc93:     	movq	0x8f8(%rax), %rax
14590cc9a:     	imulq	$0x70, %r15, %rdi
14590cc9e:     	movss	0x5c(%rax,%rdi), %xmm0
14590cca4:     	addq	%rdi, %rax
14590cca7:     	ucomiss	%xmm0, %xmm12
14590ccab:     	jae	0x14590cdf0 <.text+0x590bdf0>
14590ccb1:     	movaps	%xmm9, %xmm1
14590ccb5:     	subss	0x58(%rax), %xmm1
14590ccba:     	divss	%xmm0, %xmm1
14590ccbe:     	xorps	%xmm0, %xmm0
14590ccc1:     	maxss	%xmm1, %xmm0
14590ccc5:     	movaps	%xmm7, %xmm1
14590ccc8:     	minss	%xmm0, %xmm1
14590cccc:     	movss	0x48(%rax), %xmm0
14590ccd1:     	movss	0x54(%rax), %xmm2
14590ccd6:     	subss	%xmm0, %xmm2
14590ccda:     	mulss	%xmm1, %xmm2
14590ccde:     	addss	%xmm0, %xmm2
14590cce2:     	movsd	0x40(%rax), %xmm0
14590cce7:     	movsd	0x4c(%rax), %xmm3
14590ccec:     	subps	%xmm0, %xmm3
14590ccef:     	movsldup	%xmm1, %xmm1            # xmm1 = xmm1[0,0,2,2]
14590ccf3:     	mulps	%xmm3, %xmm1
14590ccf6:     	addps	%xmm0, %xmm1
14590ccf9:     	movlps	%xmm1, 0x2e0(%rbp)
14590cd00:     	movss	%xmm2, 0x2e8(%rbp)
14590cd08:     	movl	0x18(%rax), %ecx
14590cd0b:     	testl	%ecx, %ecx
14590cd0d:     	je	0x14590ce0f <.text+0x590be0f>
14590cd13:     	cmpl	$0x1, %ecx
14590cd16:     	jne	0x14590cf00 <.text+0x590bf00>
14590cd1c:     	movq	0x20(%rax), %rbx
14590cd20:     	movq	0x378(%rbp), %rsi
14590cd27:     	movq	%rsi, %rcx
14590cd2a:     	movq	%r15, %rdx
14590cd2d:     	movq	%r12, %r8
14590cd30:     	callq	0x14592f560 <.text+0x592e560>
14590cd35:     	movq	0x5c0(%rsi), %rax
14590cd3c:     	movq	0x5c8(%rsi), %r8
14590cd43:     	leaq	(,%r8,8), %rcx
14590cd4b:     	leaq	(%rcx,%rcx,8), %rcx
14590cd4f:     	movq	%rcx, %rdx
14590cd52:     	movq	%rax, %r9
14590cd55:     	nopw	%cs:(%rax,%rax)
14590cd60:     	testq	%rdx, %rdx
14590cd63:     	je	0x14590d550 <.text+0x590c550>
14590cd69:     	movq	%r9, %r10
14590cd6c:     	addq	$0x48, %r9
14590cd70:     	addq	$-0x48, %rdx
14590cd74:     	cmpq	%rbx, 0x28(%r10)
14590cd78:     	jne	0x14590cd60 <.text+0x590bd60>
14590cd7a:     	testb	$0x1, 0x18(%r10)
14590cd7f:     	jne	0x14590cd60 <.text+0x590bd60>
14590cd81:     	movq	0x378(%rbp), %r9
14590cd88:     	movq	0x900(%r9), %rdx
14590cd8f:     	cmpq	%rdx, %r15
14590cd92:     	jae	0x1459116a5 <.text+0x59106a5>
14590cd98:     	movq	0x8f8(%r9), %rdx
14590cd9f:     	movss	0x58(%rdx,%rdi), %xmm0
14590cda5:     	addss	0x5c(%rdx,%rdi), %xmm0
14590cdab:     	ucomiss	%xmm0, %xmm9
14590cdaf:     	jb	0x14590cc70 <.text+0x590bc70>
14590cdb5:     	testq	%r8, %r8
14590cdb8:     	je	0x14590d550 <.text+0x590c550>
14590cdbe:     	xorl	%r8d, %r8d
14590cdc1:     	xorl	%edx, %edx
14590cdc3:     	nopw	%cs:(%rax,%rax)
14590cdd0:     	cmpq	%rbx, 0x28(%rax,%r8)
14590cdd5:     	je	0x14590d4f1 <.text+0x590c4f1>
14590cddb:     	incq	%rdx
14590cdde:     	addq	$0x48, %r8
14590cde2:     	cmpq	%r8, %rcx
14590cde5:     	jne	0x14590cdd0 <.text+0x590bdd0>
14590cde7:     	jmp	0x14590d550 <.text+0x590c550>
14590cdec:     	nopl	(%rax)
14590cdf0:     	movl	0x54(%rax), %ecx
14590cdf3:     	movl	%ecx, 0x2e8(%rbp)
14590cdf9:     	movq	0x4c(%rax), %rcx
14590cdfd:     	movq	%rcx, 0x2e0(%rbp)
14590ce04:     	movl	0x18(%rax), %ecx
14590ce07:     	testl	%ecx, %ecx
14590ce09:     	jne	0x14590cd13 <.text+0x590bd13>
14590ce0f:     	movss	0x60(%rax), %xmm0
14590ce14:     	ucomiss	%xmm9, %xmm0
14590ce18:     	ja	0x14590cc70 <.text+0x590bc70>
14590ce1e:     	movss	0x1c(%rax), %xmm0
14590ce23:     	movss	0x348(%rbp), %xmm1
14590ce2b:     	movss	%xmm1, 0x60(%rax)
14590ce30:     	ucomiss	%xmm0, %xmm9
14590ce34:     	jb	0x14590d3f2 <.text+0x590c3f2>
14590ce3a:     	movq	0x378(%rbp), %rcx
14590ce41:     	movq	%r15, %rdx
14590ce44:     	callq	0x14592f7a0 <.text+0x592e7a0>
14590ce49:     	cmpq	$0x1, %rax
14590ce4d:     	jne	0x14590d3f2 <.text+0x590c3f2>
14590ce53:     	movq	0x378(%rbp), %rax
14590ce5a:     	movq	0x5c0(%rax), %r10
14590ce61:     	movq	0x5c8(%rax), %rax
14590ce68:     	shlq	$0x3, %rax
14590ce6c:     	leaq	(%rax,%rax,8), %rax
14590ce70:     	xorl	%r8d, %r8d
14590ce73:     	movq	%r10, %r9
14590ce76:     	nopw	%cs:(%rax,%rax)
14590ce80:     	cmpq	%r8, %rax
14590ce83:     	je	0x14590d3f2 <.text+0x590c3f2>
14590ce89:     	addq	$0x48, %r8
14590ce8d:     	cmpq	%rdx, 0x28(%r9)
14590ce91:     	leaq	0x48(%r9), %r9
14590ce95:     	jne	0x14590ce80 <.text+0x590be80>
14590ce97:     	movq	0x378(%rbp), %rcx
14590ce9e:     	movq	0x900(%rcx), %rax
14590cea5:     	cmpq	%rax, %r15
14590cea8:     	jae	0x145911881 <.text+0x5910881>
14590ceae:     	movss	-0x14(%r10,%r8), %xmm2
14590ceb5:     	movss	-0x10(%r10,%r8), %xmm3
14590cebc:     	movq	0x8f8(%rcx), %rax
14590cec3:     	movl	$0x1, 0x18(%rax,%rdi)
14590cecb:     	movq	%rdx, 0x20(%rax,%rdi)
14590ced0:     	movq	0x900(%rcx), %rdx
14590ced7:     	cmpq	%rdx, %r15
14590ceda:     	jae	0x145911895 <.text+0x5910895>
14590cee0:     	movq	0x8f8(%rcx), %rax
14590cee7:     	movss	%xmm9, 0x68(%rax,%rdi)
14590ceee:     	jmp	0x14590d61c <.text+0x590c61c>
14590cef3:     	nopw	%cs:(%rax,%rax)
14590cf00:     	movl	0x2e8(%rbp), %eax
14590cf06:     	movl	%eax, 0xa8(%rbp)
14590cf0c:     	movq	0x2e0(%rbp), %rax
14590cf13:     	movq	%rax, 0xa0(%rbp)
14590cf1a:     	movq	0x378(%rbp), %rsi
14590cf21:     	movq	%rsi, %rcx
14590cf24:     	movq	%r15, %rdx
14590cf27:     	leaq	0xa0(%rbp), %r8
14590cf2e:     	callq	0x14592f560 <.text+0x592e560>
14590cf33:     	movsd	0x2e0(%rbp), %xmm0
14590cf3b:     	subps	%xmm8, %xmm0
14590cf3f:     	mulps	%xmm0, %xmm0
14590cf42:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
14590cf46:     	addss	%xmm0, %xmm1
14590cf4a:     	xorps	%xmm0, %xmm0
14590cf4d:     	sqrtss	%xmm1, %xmm0
14590cf51:     	ucomiss	%xmm0, %xmm11
14590cf55:     	jae	0x14590cfb4 <.text+0x590bfb4>
14590cf57:     	movq	0x900(%rsi), %rdx
14590cf5e:     	cmpq	%rdx, %r15
14590cf61:     	jae	0x145911672 <.text+0x5910672>
14590cf67:     	movq	0x8f8(%rsi), %rax
14590cf6e:     	ucomiss	0x60(%rax,%rdi), %xmm9
14590cf74:     	jb	0x14590cc70 <.text+0x590bc70>
14590cf7a:     	addq	%rdi, %rax
14590cf7d:     	movss	0x348(%rbp), %xmm0
14590cf85:     	movss	%xmm0, 0x60(%rax)
14590cf8a:     	movss	0x328(%rbp), %xmm0
14590cf92:     	movss	%xmm0, 0x20(%rsp)
14590cf98:     	movq	0x378(%rbp), %rcx
14590cf9f:     	movq	%r15, %rdx
14590cfa2:     	movaps	%xmm8, %xmm2
14590cfa6:     	movaps	0x60(%rbp), %xmm3
14590cfaa:     	callq	0x14592f1a0 <.text+0x592e1a0>
14590cfaf:     	jmp	0x14590cc70 <.text+0x590bc70>
14590cfb4:     	movq	0x900(%rsi), %rdx
14590cfbb:     	cmpq	%rdx, %r15
14590cfbe:     	jae	0x145911683 <.text+0x5910683>
14590cfc4:     	movq	0x8f8(%rsi), %rcx
14590cfcb:     	movzbl	0x30(%rcx,%rdi), %ebx
14590cfd0:     	movq	(%rcx,%rdi), %rax
14590cfd4:     	movq	%rax, 0x360(%rbp)
14590cfdb:     	movq	0x8(%rcx,%rdi), %rax
14590cfe0:     	movq	%rax, 0x370(%rbp)
14590cfe7:     	movq	0x10(%rcx,%rdi), %rax
14590cfec:     	movq	$0x0, (%rcx,%rdi)
14590cff4:     	movq	$0x4, 0x8(%rcx,%rdi)
14590cffd:     	movq	$0x0, 0x10(%rcx,%rdi)
14590d006:     	testq	%rax, %rax
14590d009:     	je	0x14590d361 <.text+0x590c361>
14590d00f:     	movq	0x370(%rbp), %r14
14590d016:     	leaq	(%r14,%rax,8), %r12
14590d01a:     	movb	%bl, 0x318(%rbp)
14590d020:     	jmp	0x14590d04a <.text+0x590c04a>
14590d022:     	nopw	%cs:(%rax,%rax)
14590d030:     	movq	0x378(%rbp), %rcx
14590d037:     	callq	0x1459451c0 <.text+0x59441c0>
14590d03c:     	nop
14590d03d:     	addq	$0x8, %r14
14590d041:     	cmpq	%r12, %r14
14590d044:     	je	0x14590d361 <.text+0x590c361>
14590d04a:     	movl	(%r14), %edx
14590d04d:     	leal	-0x3(%rdx), %eax
14590d050:     	cmpl	$0x3, %eax
14590d053:     	jb	0x14590d030 <.text+0x590c030>
14590d055:     	movl	0x4(%r14), %eax
14590d059:     	testl	%edx, %edx
14590d05b:     	je	0x14590d1a4 <.text+0x590c1a4>
14590d061:     	cmpl	$0x1, %edx
14590d064:     	jne	0x14590d03d <.text+0x590c03d>
14590d066:     	movl	%eax, %eax
14590d068:     	xorps	%xmm10, %xmm10
14590d06c:     	cvtsi2ss	%rax, %xmm10
14590d071:     	cmpb	$0x1, %bl
14590d074:     	jne	0x14590d1f1 <.text+0x590c1f1>
14590d07a:     	mulss	%xmm14, %xmm10
14590d07f:     	movq	0x378(%rbp), %rsi
14590d086:     	addss	0xa5c(%rsi), %xmm10
14590d08f:     	movaps	%xmm10, %xmm0
14590d093:     	callq	0x145bc9817 <.text+0x5bc8817>
14590d098:     	subss	%xmm0, %xmm10
14590d09d:     	movss	%xmm10, 0xa5c(%rsi)
14590d0a6:     	ucomiss	%xmm12, %xmm0
14590d0aa:     	jbe	0x14590d03d <.text+0x590c03d>
14590d0ac:     	cvttss2si	%xmm0, %rax
14590d0b1:     	movl	$0x0, %ebx
14590d0b6:     	cmovbl	%ebx, %eax
14590d0b9:     	ucomiss	%xmm13, %xmm0
14590d0bd:     	movl	$0xffffffff, %r13d      # imm = 0xFFFFFFFF
14590d0c3:     	cmoval	%r13d, %eax
14590d0c7:     	xorps	%xmm0, %xmm0
14590d0ca:     	cvtsi2ss	%rax, %xmm0
14590d0cf:     	movq	0x378(%rbp), %rsi
14590d0d6:     	mulss	0x4a8(%rsi), %xmm0
14590d0de:     	callq	0x145bc97b1 <.text+0x5bc87b1>
14590d0e3:     	cvttss2si	%xmm0, %rax
14590d0e8:     	ucomiss	%xmm12, %xmm0
14590d0ec:     	cmovbl	%ebx, %eax
14590d0ef:     	ucomiss	%xmm13, %xmm0
14590d0f3:     	cmoval	%r13d, %eax
14590d0f7:     	movl	0x4e8(%rsi), %ecx
14590d0fd:     	addl	%eax, %ecx
14590d0ff:     	movl	%ecx, 0x4e8(%rsi)
14590d105:     	addl	%eax, 0x71c(%rsi)
14590d10b:     	imull	$0x2710, %ecx, %r8d     # imm = 0x2710
14590d112:     	movq	0x990(%rsi), %rax
14590d119:     	testq	%rax, %rax
14590d11c:     	je	0x14590d307 <.text+0x590c307>
14590d122:     	movq	0x998(%rsi), %rcx
14590d129:     	movl	$0x498, %r13d           # imm = 0x498
14590d12f:     	movzbl	0x318(%rbp), %ebx
14590d136:     	movzwl	0x36(%rax), %r9d
14590d13b:     	movl	%r9d, %r10d
14590d13e:     	addl	%r10d, %r10d
14590d141:     	movq	$-0x1, %rdx
14590d148:     	nopl	(%rax,%rax)
14590d150:     	testq	%r10, %r10
14590d153:     	je	0x14590d190 <.text+0x590c190>
14590d155:     	movzwl	0x3a(%rax,%rdx,2), %r11d
14590d15b:     	cmpl	%r11d, %r13d
14590d15e:     	seta	%r11b
14590d162:     	sbbb	$0x0, %r11b
14590d166:     	incq	%rdx
14590d169:     	addq	$-0x2, %r10
14590d16d:     	cmpb	$0x1, %r11b
14590d171:     	je	0x14590d150 <.text+0x590c150>
14590d173:     	movzbl	%r11b, %r9d
14590d177:     	testl	%r9d, %r9d
14590d17a:     	je	0x14590d2b0 <.text+0x590c2b0>
14590d180:     	jmp	0x14590d193 <.text+0x590c193>
14590d182:     	nopw	%cs:(%rax,%rax)
14590d190:     	movq	%r9, %rdx
14590d193:     	subq	$0x1, %rcx
14590d197:     	jb	0x14590d316 <.text+0x590c316>
14590d19d:     	movq	0x50(%rax,%rdx,8), %rax
14590d1a2:     	jmp	0x14590d136 <.text+0x590c136>
14590d1a4:     	movl	%eax, %eax
14590d1a6:     	xorps	%xmm0, %xmm0
14590d1a9:     	cvtsi2ss	%rax, %xmm0
14590d1ae:     	movq	0x378(%rbp), %rsi
14590d1b5:     	mulss	0x494(%rsi), %xmm0
14590d1bd:     	callq	0x145bc97b1 <.text+0x5bc87b1>
14590d1c2:     	maxss	%xmm7, %xmm0
14590d1c6:     	cvttss2si	%xmm0, %rdx
14590d1cb:     	ucomiss	%xmm12, %xmm0
14590d1cf:     	movl	$0x0, %eax
14590d1d4:     	cmovbl	%eax, %edx
14590d1d7:     	ucomiss	%xmm13, %xmm0
14590d1db:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
14590d1e0:     	cmoval	%eax, %edx
14590d1e3:     	movq	%rsi, %rcx
14590d1e6:     	callq	0x14591c3a0 <.text+0x591b3a0>
14590d1eb:     	nop
14590d1ec:     	jmp	0x14590d03d <.text+0x590c03d>
14590d1f1:     	movq	0x378(%rbp), %rsi
14590d1f8:     	mulss	0x4a8(%rsi), %xmm10
14590d201:     	movaps	%xmm10, %xmm0
14590d205:     	callq	0x145bc97b1 <.text+0x5bc87b1>
14590d20a:     	cvttss2si	%xmm0, %rax
14590d20f:     	ucomiss	%xmm12, %xmm0
14590d213:     	movl	$0x0, %ecx
14590d218:     	cmovbl	%ecx, %eax
14590d21b:     	ucomiss	%xmm13, %xmm0
14590d21f:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
14590d224:     	cmoval	%ecx, %eax
14590d227:     	movl	0x4e8(%rsi), %ecx
14590d22d:     	addl	%eax, %ecx
14590d22f:     	movl	%ecx, 0x4e8(%rsi)
14590d235:     	addl	%eax, 0x71c(%rsi)
14590d23b:     	imull	$0x2710, %ecx, %r8d     # imm = 0x2710
14590d242:     	movq	0x990(%rsi), %rax
14590d249:     	testq	%rax, %rax
14590d24c:     	je	0x14590d2ba <.text+0x590c2ba>
14590d24e:     	movq	0x998(%rsi), %rcx
14590d255:     	movzwl	0x36(%rax), %r9d
14590d25a:     	movl	%r9d, %r10d
14590d25d:     	addl	%r10d, %r10d
14590d260:     	movq	$-0x1, %rdx
14590d267:     	nopw	(%rax,%rax)
14590d270:     	testq	%r10, %r10
14590d273:     	je	0x14590d2a0 <.text+0x590c2a0>
14590d275:     	movzwl	0x3a(%rax,%rdx,2), %r11d
14590d27b:     	cmpl	%r11d, %r13d
14590d27e:     	seta	%r11b
14590d282:     	sbbb	$0x0, %r11b
14590d286:     	incq	%rdx
14590d289:     	addq	$-0x2, %r10
14590d28d:     	cmpb	$0x1, %r11b
14590d291:     	je	0x14590d270 <.text+0x590c270>
14590d293:     	movzbl	%r11b, %r9d
14590d297:     	testl	%r9d, %r9d
14590d29a:     	jne	0x14590d2a3 <.text+0x590c2a3>
14590d29c:     	jmp	0x14590d2b0 <.text+0x590c2b0>
14590d29e:     	nop
14590d2a0:     	movq	%r9, %rdx
14590d2a3:     	subq	$0x1, %rcx
14590d2a7:     	jb	0x14590d2bc <.text+0x590c2bc>
14590d2a9:     	movq	0x50(%rax,%rdx,8), %rax
14590d2ae:     	jmp	0x14590d255 <.text+0x590c255>
14590d2b0:     	movl	%r8d, 0x8(%rax,%rdx,4)
14590d2b5:     	jmp	0x14590d03d <.text+0x590c03d>
14590d2ba:     	xorl	%eax, %eax
14590d2bc:     	movq	0x338(%rbp), %rcx
14590d2c3:     	movq	%rcx, 0xa0(%rbp)
14590d2ca:     	movq	%rax, 0xa8(%rbp)
14590d2d1:     	movq	$0x0, 0xb0(%rbp)
14590d2dc:     	movq	%rdx, 0xb8(%rbp)
14590d2e3:     	movq	$0x498, 0xc0(%rbp)      # imm = 0x498
14590d2ee:     	leaq	0x230(%rbp), %rcx
14590d2f5:     	leaq	0xa0(%rbp), %rdx
14590d2fc:     	callq	0x1458e1710 <.text+0x58e0710>
14590d301:     	nop
14590d302:     	jmp	0x14590d03d <.text+0x590c03d>
14590d307:     	xorl	%eax, %eax
14590d309:     	movl	$0x498, %r13d           # imm = 0x498
14590d30f:     	movzbl	0x318(%rbp), %ebx
14590d316:     	movq	0x338(%rbp), %rcx
14590d31d:     	movq	%rcx, 0xa0(%rbp)
14590d324:     	movq	%rax, 0xa8(%rbp)
14590d32b:     	movq	$0x0, 0xb0(%rbp)
14590d336:     	movq	%rdx, 0xb8(%rbp)
14590d33d:     	movq	$0x498, 0xc0(%rbp)      # imm = 0x498
14590d348:     	leaq	0x230(%rbp), %rcx
14590d34f:     	leaq	0xa0(%rbp), %rdx
14590d356:     	callq	0x1458e1710 <.text+0x58e0710>
14590d35b:     	nop
14590d35c:     	jmp	0x14590d03d <.text+0x590c03d>
14590d361:     	movq	0x360(%rbp), %rdx
14590d368:     	testq	%rdx, %rdx
14590d36b:     	je	0x14590d383 <.text+0x590c383>
14590d36d:     	shlq	$0x3, %rdx
14590d371:     	movl	$0x4, %r8d
14590d377:     	movq	0x370(%rbp), %rcx
14590d37e:     	callq	0x1400021d0 <.text+0x11d0>
14590d383:     	movq	0x378(%rbp), %rcx
14590d38a:     	movq	0x900(%rcx), %rdx
14590d391:     	cmpq	%rdx, %r15
14590d394:     	movq	0x330(%rbp), %r14
14590d39b:     	leaq	0x2e0(%rbp), %r12
14590d3a2:     	jae	0x145911661 <.text+0x5910661>
14590d3a8:     	movzbl	0x28d(%rcx), %eax
14590d3af:     	movaps	0x156b0ca(%rip), %xmm0  # 0x146e78480
14590d3b6:     	movaps	%xmm0, 0xa0(%rbp)
14590d3bd:     	cmpb	$0x3, %al
14590d3bf:     	movl	$0x3, %edx
14590d3c4:     	cmovael	%edx, %eax
14590d3c7:     	movzbl	%al, %eax
14590d3ca:     	movss	0xa0(%rbp,%rax,4), %xmm0
14590d3d3:     	addss	%xmm9, %xmm0
14590d3d8:     	movq	0x8f8(%rcx), %rax
14590d3df:     	movl	$0x0, 0x18(%rax,%rdi)
14590d3e7:     	movss	%xmm0, 0x1c(%rax,%rdi)
14590d3ed:     	jmp	0x14590cc70 <.text+0x590bc70>
14590d3f2:     	movq	0x378(%rbp), %rsi
14590d3f9:     	movq	0x900(%rsi), %rdx
14590d400:     	cmpq	%rdx, %r15
14590d403:     	jae	0x1459116b6 <.text+0x59106b6>
14590d409:     	movaps	%xmm11, %xmm15
14590d40d:     	movq	0x8f8(%rsi), %rax
14590d414:     	movss	0x4d4(%rsi), %xmm11
14590d41d:     	addss	0x64(%rax,%rdi), %xmm11
14590d424:     	movaps	%xmm11, %xmm0
14590d428:     	callq	0x145bc97c3 <.text+0x5bc87c3>
14590d42d:     	movaps	%xmm0, %xmm10
14590d431:     	movaps	%xmm11, %xmm0
14590d435:     	callq	0x145bc97bd <.text+0x5bc87bd>
14590d43a:     	unpcklps	%xmm0, %xmm10           # xmm10 = xmm10[0],xmm0[0],xmm10[1],xmm0[1]
14590d43e:     	mulps	0x156b04a(%rip), %xmm10 # 0x146e78490
14590d446:     	addps	%xmm8, %xmm10
14590d44a:     	movsd	0x2e0(%rbp), %xmm0
14590d452:     	movaps	%xmm0, %xmm1
14590d455:     	subps	%xmm8, %xmm1
14590d459:     	mulps	%xmm1, %xmm1
14590d45c:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
14590d460:     	addss	%xmm1, %xmm2
14590d464:     	xorps	%xmm1, %xmm1
14590d467:     	sqrtss	%xmm2, %xmm1
14590d46b:     	ucomiss	0x4b210e(%rip), %xmm1   # 0x145dbf580
14590d472:     	jbe	0x14590d49f <.text+0x590c49f>
14590d474:     	movshdup	%xmm10, %xmm3           # xmm3 = xmm10[1,1,3,3]
14590d479:     	movss	0x208(%rbp), %xmm0
14590d481:     	movss	%xmm0, 0x20(%rsp)
14590d487:     	movq	%rsi, %rcx
14590d48a:     	movq	%r15, %rdx
14590d48d:     	movaps	%xmm10, %xmm2
14590d491:     	callq	0x14592f1a0 <.text+0x592e1a0>
14590d496:     	movaps	%xmm15, %xmm11
14590d49a:     	jmp	0x14590cc70 <.text+0x590bc70>
14590d49f:     	subps	%xmm10, %xmm0
14590d4a3:     	mulps	%xmm0, %xmm0
14590d4a6:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
14590d4aa:     	addss	%xmm0, %xmm1
14590d4ae:     	xorps	%xmm0, %xmm0
14590d4b1:     	sqrtss	%xmm1, %xmm0
14590d4b5:     	ucomiss	0x790888(%rip), %xmm0   # 0x14609dd44
14590d4bc:     	movaps	%xmm15, %xmm11
14590d4c0:     	jbe	0x14590cc70 <.text+0x590bc70>
14590d4c6:     	movshdup	%xmm10, %xmm3           # xmm3 = xmm10[1,1,3,3]
14590d4cb:     	movss	0x328(%rbp), %xmm0
14590d4d3:     	movss	%xmm0, 0x20(%rsp)
14590d4d9:     	movq	0x378(%rbp), %rcx
14590d4e0:     	movq	%r15, %rdx
14590d4e3:     	movaps	%xmm10, %xmm2
14590d4e7:     	callq	0x14592f1a0 <.text+0x592e1a0>
14590d4ec:     	jmp	0x14590cc70 <.text+0x590bc70>
14590d4f1:     	movsd	0x20(%rax,%r8), %xmm10
14590d4f8:     	movq	0x378(%rbp), %rsi
14590d4ff:     	movq	%rsi, %rcx
14590d502:     	callq	0x145942890 <.text+0x5941890>
14590d507:     	movq	0x900(%rsi), %rdx
14590d50e:     	cmpq	%rdx, %r15
14590d511:     	jae	0x145911870 <.text+0x5910870>
14590d517:     	movq	0x8f8(%rsi), %rax
14590d51e:     	leaq	(%rax,%rdi), %rbx
14590d522:     	movq	0x10(%rax,%rdi), %rsi
14590d527:     	cmpq	(%rax,%rdi), %rsi
14590d52b:     	jne	0x14590d535 <.text+0x590c535>
14590d52d:     	movq	%rbx, %rcx
14590d530:     	callq	0x145bfb120 <.text+0x5bfa120>
14590d535:     	movq	0x8(%rbx), %rax
14590d539:     	movlps	%xmm10, (%rax,%rsi,8)
14590d53e:     	incq	%rsi
14590d541:     	movq	%rsi, 0x10(%rbx)
14590d545:     	nopw	%cs:(%rax,%rax)
14590d550:     	movq	0x378(%rbp), %rax
14590d557:     	movq	0x900(%rax), %rdx
14590d55e:     	cmpq	%rdx, %r15
14590d561:     	jae	0x14591162a <.text+0x591062a>
14590d567:     	movq	0x8f8(%rax), %rax
14590d56e:     	movaps	%xmm9, %xmm0
14590d572:     	subss	0x68(%rax,%rdi), %xmm0
14590d578:     	movss	0x4908e8(%rip), %xmm1   # 0x145d9de68
14590d580:     	ucomiss	%xmm0, %xmm1
14590d583:     	jbe	0x14590d640 <.text+0x590c640>
14590d589:     	movq	0x378(%rbp), %rcx
14590d590:     	movq	%r15, %rdx
14590d593:     	callq	0x14592f7a0 <.text+0x592e7a0>
14590d598:     	cmpq	$0x1, %rax
14590d59c:     	jne	0x14590d640 <.text+0x590c640>
14590d5a2:     	movq	0x378(%rbp), %rax
14590d5a9:     	movq	0x5c0(%rax), %r10
14590d5b0:     	movq	0x5c8(%rax), %rax
14590d5b7:     	shlq	$0x3, %rax
14590d5bb:     	leaq	(%rax,%rax,8), %rax
14590d5bf:     	xorl	%r8d, %r8d
14590d5c2:     	movq	%r10, %r9
14590d5c5:     	nopw	%cs:(%rax,%rax)
14590d5d0:     	cmpq	%r8, %rax
14590d5d3:     	je	0x14590d640 <.text+0x590c640>
14590d5d5:     	addq	$0x48, %r8
14590d5d9:     	cmpq	%rdx, 0x28(%r9)
14590d5dd:     	leaq	0x48(%r9), %r9
14590d5e1:     	jne	0x14590d5d0 <.text+0x590c5d0>
14590d5e3:     	movq	0x378(%rbp), %rcx
14590d5ea:     	movq	0x900(%rcx), %rax
14590d5f1:     	cmpq	%rax, %r15
14590d5f4:     	jae	0x145911826 <.text+0x5910826>
14590d5fa:     	movss	-0x14(%r10,%r8), %xmm2
14590d601:     	movss	-0x10(%r10,%r8), %xmm3
14590d608:     	movq	0x8f8(%rcx), %rax
14590d60f:     	movl	$0x1, 0x18(%rax,%rdi)
14590d617:     	movq	%rdx, 0x20(%rax,%rdi)
14590d61c:     	movss	0x328(%rbp), %xmm0
14590d624:     	movss	%xmm0, 0x20(%rsp)
14590d62a:     	movq	%r15, %rdx
14590d62d:     	callq	0x14592f1a0 <.text+0x592e1a0>
14590d632:     	jmp	0x14590cc70 <.text+0x590bc70>
14590d637:     	nopw	(%rax,%rax)
14590d640:     	movq	0x378(%rbp), %r8
14590d647:     	movq	0x900(%r8), %rdx
14590d64e:     	cmpq	%rdx, %r15
14590d651:     	jae	0x14591163b <.text+0x591063b>
14590d657:     	movq	0x8f8(%r8), %rcx
14590d65e:     	leaq	(%rcx,%rdi), %rax
14590d662:     	cmpq	$0x0, 0x10(%rcx,%rdi)
14590d668:     	je	0x14590cc58 <.text+0x590bc58>
14590d66e:     	movl	$0x2, 0x18(%rax)
14590d675:     	movq	0x900(%r8), %rdx
14590d67c:     	cmpq	%rdx, %r15
14590d67f:     	jae	0x1459116c7 <.text+0x59106c7>
14590d685:     	movq	0x8f8(%r8), %rax
14590d68c:     	movss	%xmm9, 0x60(%rax,%rdi)
14590d693:     	jmp	0x14590cc70 <.text+0x590bc70>
