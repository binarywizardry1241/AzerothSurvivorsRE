
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140062b50:     	pushq	%rbp
140062b51:     	pushq	%r15
140062b53:     	pushq	%r14
140062b55:     	pushq	%r13
140062b57:     	pushq	%r12
140062b59:     	pushq	%rsi
140062b5a:     	pushq	%rdi
140062b5b:     	pushq	%rbx
140062b5c:     	subq	$0x378, %rsp            # imm = 0x378
140062b63:     	leaq	0x80(%rsp), %rbp
140062b6b:     	movdqa	%xmm8, 0x2e0(%rbp)
140062b74:     	movaps	%xmm7, 0x2d0(%rbp)
140062b7b:     	movaps	%xmm6, 0x2c0(%rbp)
140062b82:     	movq	$-0x2, 0x2b8(%rbp)
140062b8d:     	movq	0x360(%rbp), %rax
140062b94:     	movq	(%rdx), %rcx
140062b97:     	movq	(%r8), %r12
140062b9a:     	movq	0x10(%r8), %r13
140062b9e:     	movl	0x1c(%r8), %edx
140062ba2:     	movl	%edx, 0x2a4(%rbp)
140062ba8:     	movq	(%r9), %rdx
140062bab:     	movq	%rdx, 0x128(%rbp)
140062bb2:     	movq	0x10(%r9), %rdx
140062bb6:     	movq	%rdx, 0x130(%rbp)
140062bbd:     	movl	0x1c(%r9), %edx
140062bc1:     	movl	%edx, 0x18c(%rbp)
140062bc7:     	movq	(%rax), %rbx
140062bca:     	callq	0x145428620 <.text+0x5427620>
140062bcf:     	movq	%rax, %rcx
140062bd2:     	movb	%dl, 0x190(%rbp)
140062bd8:     	movq	0x20(%rax), %rax
140062bdc:     	movq	$0x0, 0x20(%rcx)
140062be4:     	movq	%rcx, 0x268(%rbp)
140062beb:     	addq	$0x8, %rcx
140062bef:     	movq	%rcx, 0x1d0(%rbp)
140062bf6:     	movq	%rax, 0x1d8(%rbp)
140062bfd:     	xorps	%xmm0, %xmm0
140062c00:     	movups	%xmm0, 0x1e0(%rbp)
140062c07:     	movq	%rax, 0x1f0(%rbp)
140062c0e:     	leaq	-0x58(%rbp), %rcx
140062c12:     	leaq	0x1d0(%rbp), %rdx
140062c19:     	callq	0x1401a97c0 <.text+0x1a87c0>
140062c1e:     	nop
140062c1f:     	movq	0x268(%rbp), %rdi
140062c26:     	movq	0x40(%rdi), %rsi
140062c2a:     	movq	0x48(%rdi), %rax
140062c2e:     	movq	%rax, 0x120(%rbp)
140062c35:     	movq	0x50(%rdi), %r14
140062c39:     	movq	$-0x1, 0x40(%rdi)
140062c41:     	movq	0x68(%rdi), %rax
140062c45:     	movq	%rax, 0x10(%rbp)
140062c49:     	movups	0x58(%rdi), %xmm0
140062c4d:     	movaps	%xmm0, (%rbp)
140062c51:     	movq	$-0x1, 0x58(%rdi)
140062c59:     	movq	0x70(%rdi), %rax
140062c5d:     	movq	%rax, 0x118(%rbp)
140062c64:     	movq	0x78(%rdi), %rax
140062c68:     	movq	%rax, 0x60(%rbp)
140062c6c:     	movq	0x80(%rdi), %r15
140062c73:     	movq	$-0x1, 0x70(%rdi)
140062c7b:     	testb	$0x1, 0x190(%rbp)
140062c82:     	jne	0x140062c9a <.text+0x61c9a>
140062c84:     	movq	0x79d513d(%rip), %rax   # 0x147a37dc8
140062c8b:     	movq	(%rax), %rax
140062c8e:     	shlq	%rax
140062c91:     	testq	%rax, %rax
140062c94:     	jne	0x140065153 <.text+0x64153>
140062c9a:     	movq	%rsi, 0x148(%rbp)
140062ca1:     	xorl	%eax, %eax
140062ca3:     	xchgb	%al, (%rdi)
140062ca5:     	cmpb	$0x2, %al
140062ca7:     	je	0x1400650f6 <.text+0x640f6>
140062cad:     	movq	-0x48(%rbp), %rax
140062cb1:     	movq	%rax, 0x30(%rbp)
140062cb5:     	movups	-0x58(%rbp), %xmm0
140062cb9:     	movaps	%xmm0, 0x20(%rbp)
140062cbd:     	movdqa	(%rbp), %xmm0
140062cc2:     	movdqa	%xmm0, -0x40(%rbp)
140062cc7:     	movq	0x10(%rbp), %rax
140062ccb:     	movq	%rax, -0x30(%rbp)
140062ccf:     	movq	-0x40(%rbp), %rax
140062cd3:     	movq	%rax, -0x10(%rbp)
140062cd7:     	cmpq	$-0x1, %rax
140062cdb:     	movq	%r12, 0x288(%rbp)
140062ce2:     	je	0x140063150 <.text+0x62150>
140062ce8:     	movq	0x10(%rbp), %rax
140062cec:     	movq	%rax, 0xc0(%rbp)
140062cf3:     	movdqa	(%rbp), %xmm0
140062cf8:     	movdqa	%xmm0, 0xb0(%rbp)
140062d00:     	movb	$0x1, 0x297(%rbp)
140062d07:     	leaq	0x1d0(%rbp), %rcx
140062d0e:     	leaq	0xb0(%rbp), %rdx
140062d15:     	callq	0x1401b5b70 <.text+0x1b4b70>
140062d1a:     	nop
140062d1b:     	movl	0x2a4(%rbp), %eax
140062d21:     	movl	%eax, (%r13)
140062d25:     	leaq	0x48(%r12), %rax
140062d2a:     	movq	%rax, 0x2a8(%rbp)
140062d31:     	movq	0x50(%r12), %rcx
140062d36:     	movq	0x58(%r12), %rax
140062d3b:     	movq	%rax, 0x190(%rbp)
140062d42:     	movq	$0x0, 0x268(%rbp)
140062d4d:     	movq	%rcx, 0xe8(%rbp)
140062d54:     	nopw	%cs:(%rax,%rax)
140062d60:     	movq	0x268(%rbp), %rax
140062d67:     	cmpq	%rax, 0x190(%rbp)
140062d6e:     	je	0x140062d8c <.text+0x61d8c>
140062d70:     	incq	%rax
140062d73:     	movq	%rax, 0x268(%rbp)
140062d7a:     	leaq	0xb0(%rcx), %rsi
140062d81:     	callq	0x14007b010 <.text+0x7a010>
140062d86:     	nop
140062d87:     	movq	%rsi, %rcx
140062d8a:     	jmp	0x140062d60 <.text+0x61d60>
140062d8c:     	movq	0x2a8(%rbp), %rsi
140062d93:     	movq	(%rsi), %rax
140062d96:     	testq	%rax, %rax
140062d99:     	movq	0x288(%rbp), %r12
140062da0:     	je	0x140062db9 <.text+0x61db9>
140062da2:     	movq	0x50(%r12), %rcx
140062da7:     	imulq	$0xb0, %rax, %rdx
140062dae:     	movl	$0x8, %r8d
140062db4:     	callq	0x1400021d0 <.text+0x11d0>
140062db9:     	movq	0x1e0(%rbp), %rax
140062dc0:     	movq	%rax, 0x10(%rsi)
140062dc4:     	movdqu	0x1d0(%rbp), %xmm0
140062dcc:     	movdqu	%xmm0, (%rsi)
140062dd0:     	movq	0xb0(%rbp), %rax
140062dd7:     	movq	0xb8(%rbp), %rcx
140062dde:     	imulq	$0xb0, 0xc0(%rbp), %rdx
140062de9:     	addq	%rcx, %rdx
140062dec:     	movq	%rcx, 0x1d0(%rbp)
140062df3:     	movq	%rcx, 0x1d8(%rbp)
140062dfa:     	movq	%rax, 0x1e0(%rbp)
140062e01:     	movq	%rdx, 0x1e8(%rbp)
140062e08:     	movb	$0x0, 0x297(%rbp)
140062e0f:     	leaq	0xd0(%rbp), %rsi
140062e16:     	leaq	0x1d0(%rbp), %rdx
140062e1d:     	movq	%rsi, %rcx
140062e20:     	callq	0x14007ff00 <.text+0x7ef00>
140062e25:     	nop
140062e26:     	movb	$0x1, 0x287(%rbp)
140062e2d:     	callq	0x1407b5940 <.text+0x7b4940>
140062e32:     	nop
140062e33:     	movq	%rax, 0x108(%rbp)
140062e3a:     	andb	$0x1, %dl
140062e3d:     	movb	%dl, 0x110(%rbp)
140062e43:     	movq	0x8(%rax), %rcx
140062e47:     	testq	%rcx, %rcx
140062e4a:     	je	0x140062e58 <.text+0x61e58>
140062e4c:     	movdqu	0x10(%rax), %xmm0
140062e51:     	movl	$0x1, %eax
140062e56:     	jmp	0x140062e5e <.text+0x61e5e>
140062e58:     	pxor	%xmm0, %xmm0
140062e5c:     	xorl	%eax, %eax
140062e5e:     	movq	%rax, 0x1d0(%rbp)
140062e65:     	movq	$0x0, 0x1d8(%rbp)
140062e70:     	movq	%rcx, 0x1e0(%rbp)
140062e77:     	movq	%xmm0, 0x1e8(%rbp)
140062e7f:     	movq	%rax, 0x1f0(%rbp)
140062e86:     	movq	$0x0, 0x1f8(%rbp)
140062e91:     	movq	%rcx, 0x200(%rbp)
140062e98:     	movdqu	%xmm0, 0x208(%rbp)
140062ea0:     	movq	%rsi, 0x218(%rbp)
140062ea7:     	movb	$0x1, 0x286(%rbp)
140062eae:     	leaq	0x160(%rbp), %rcx
140062eb5:     	leaq	0x1d0(%rbp), %rdx
140062ebc:     	callq	0x1401a90c0 <.text+0x1a80c0>
140062ec1:     	nop
140062ec2:     	movq	0xd0(%rbp), %rax
140062ec9:     	movq	0xd8(%rbp), %rcx
140062ed0:     	xorl	%edx, %edx
140062ed2:     	movq	%rax, %r8
140062ed5:     	testq	%rax, %rax
140062ed8:     	setne	%dl
140062edb:     	je	0x140062ee4 <.text+0x61ee4>
140062edd:     	movq	0xe0(%rbp), %r8
140062ee4:     	movq	%rdx, 0x1d0(%rbp)
140062eeb:     	movq	$0x0, 0x1d8(%rbp)
140062ef6:     	movq	%rax, 0x1e0(%rbp)
140062efd:     	movq	%rcx, 0x1e8(%rbp)
140062f04:     	movq	%rdx, 0x1f0(%rbp)
140062f0b:     	movq	$0x0, 0x1f8(%rbp)
140062f16:     	movq	%rax, 0x200(%rbp)
140062f1d:     	movq	%rcx, 0x208(%rbp)
140062f24:     	movq	%r8, 0x210(%rbp)
140062f2b:     	leaq	0x108(%rbp), %rax
140062f32:     	movq	%rax, 0x218(%rbp)
140062f39:     	movb	$0x1, 0x285(%rbp)
140062f40:     	movb	$0x1, 0x284(%rbp)
140062f47:     	leaq	0x40(%rbp), %rcx
140062f4b:     	leaq	0x1d0(%rbp), %rdx
140062f52:     	callq	0x1401a8c90 <.text+0x1a7c90>
140062f57:     	nop
140062f58:     	movq	0x108(%rbp), %rdx
140062f5f:     	addq	$0x20, %rdx
140062f63:     	movq	0x160(%rbp), %rax
140062f6a:     	movq	0x168(%rbp), %rcx
140062f71:     	movq	0x170(%rbp), %r8
140062f78:     	leaq	(%rcx,%r8,4), %r8
140062f7c:     	movq	%rcx, 0x1d0(%rbp)
140062f83:     	movq	%rax, 0x1e0(%rbp)
140062f8a:     	movq	%rcx, 0x1d8(%rbp)
140062f91:     	movq	%r8, 0x1e8(%rbp)
140062f98:     	movb	$0x1, 0x283(%rbp)
140062f9f:     	movb	$0x1, 0x282(%rbp)
140062fa6:     	leaq	0x1d0(%rbp), %rcx
140062fad:     	callq	0x1401803a0 <.text+0x17f3a0>
140062fb2:     	nop
140062fb3:     	movq	0x108(%rbp), %rdx
140062fba:     	addq	$0x20, %rdx
140062fbe:     	movq	0x40(%rbp), %rax
140062fc2:     	movq	0x48(%rbp), %rcx
140062fc6:     	movq	0x50(%rbp), %r8
140062fca:     	leaq	(%rcx,%r8,4), %r8
140062fce:     	movq	%rcx, 0x1d0(%rbp)
140062fd5:     	movq	%rax, 0x1e0(%rbp)
140062fdc:     	movq	%rcx, 0x1d8(%rbp)
140062fe3:     	movq	%r8, 0x1e8(%rbp)
140062fea:     	movb	$0x1, 0x283(%rbp)
140062ff1:     	movb	$0x0, 0x282(%rbp)
140062ff8:     	leaq	0x1d0(%rbp), %rcx
140062fff:     	callq	0x1401803a0 <.text+0x17f3a0>
140063004:     	nop
140063005:     	movq	0xe0(%rbp), %rax
14006300c:     	movq	%rax, 0x1b0(%rbp)
140063013:     	movdqu	0xd0(%rbp), %xmm0
14006301b:     	movdqa	%xmm0, 0x1a0(%rbp)
140063023:     	movq	0x108(%rbp), %r8
14006302a:     	movq	0x8(%r8), %rcx
14006302e:     	testq	%rcx, %rcx
140063031:     	je	0x140063074 <.text+0x62074>
140063033:     	movq	0x10(%r8), %rdx
140063037:     	movq	0x18(%r8), %rax
14006303b:     	movq	$0x0, 0x1d8(%rbp)
140063046:     	movq	%rcx, 0x1e0(%rbp)
14006304d:     	movq	%rdx, 0x1e8(%rbp)
140063054:     	movq	$0x0, 0x1f8(%rbp)
14006305f:     	movq	%rcx, 0x200(%rbp)
140063066:     	movq	%rdx, 0x208(%rbp)
14006306d:     	movl	$0x1, %ecx
140063072:     	jmp	0x140063078 <.text+0x62078>
140063074:     	xorl	%ecx, %ecx
140063076:     	xorl	%eax, %eax
140063078:     	addq	$0x8, %r8
14006307c:     	movq	%r8, 0x268(%rbp)
140063083:     	movq	%rcx, 0x1d0(%rbp)
14006308a:     	movq	%rcx, 0x1f0(%rbp)
140063091:     	movq	%rax, 0x210(%rbp)
140063098:     	leaq	0x228(%rbp), %rcx
14006309f:     	leaq	0x1d0(%rbp), %rdx
1400630a6:     	callq	0x140082960 <.text+0x81960>
1400630ab:     	nop
1400630ac:     	movq	0x228(%rbp), %rax
1400630b3:     	testq	%rax, %rax
1400630b6:     	je	0x140063100 <.text+0x62100>
1400630b8:     	leaq	0x228(%rbp), %rsi
1400630bf:     	leaq	0x1d0(%rbp), %rdi
1400630c6:     	nopw	%cs:(%rax,%rax)
1400630d0:     	imulq	$0xa8, 0x238(%rbp), %rcx
1400630db:     	addq	%rax, %rcx
1400630de:     	addq	$0x8, %rcx
1400630e2:     	callq	0x14007b010 <.text+0x7a010>
1400630e7:     	nop
1400630e8:     	movq	%rsi, %rcx
1400630eb:     	movq	%rdi, %rdx
1400630ee:     	callq	0x140082960 <.text+0x81960>
1400630f3:     	nop
1400630f4:     	movq	0x228(%rbp), %rax
1400630fb:     	testq	%rax, %rax
1400630fe:     	jne	0x1400630d0 <.text+0x620d0>
140063100:     	movq	0x1b0(%rbp), %rax
140063107:     	movq	0x268(%rbp), %rcx
14006310e:     	movq	%rax, 0x10(%rcx)
140063112:     	movdqa	0x1a0(%rbp), %xmm0
14006311a:     	movdqu	%xmm0, (%rcx)
14006311e:     	movq	0x108(%rbp), %rsi
140063125:     	cmpb	$0x0, 0x110(%rbp)
14006312c:     	jne	0x140063144 <.text+0x62144>
14006312e:     	movq	0x79d4c93(%rip), %rax   # 0x147a37dc8
140063135:     	movq	(%rax), %rax
140063138:     	shlq	%rax
14006313b:     	testq	%rax, %rax
14006313e:     	jne	0x140065195 <.text+0x64195>
140063144:     	xorl	%eax, %eax
140063146:     	xchgb	%al, (%rsi)
140063148:     	cmpb	$0x2, %al
14006314a:     	je	0x140065126 <.text+0x64126>
140063150:     	cmpq	$-0x1, 0x118(%rbp)
140063158:     	sete	%sil
14006315c:     	je	0x140063230 <.text+0x62230>
140063162:     	leaq	(%r15,%r15,2), %rax
140063166:     	movq	0x60(%rbp), %rcx
14006316a:     	leaq	(%rcx,%rax,4), %rax
14006316e:     	movq	%rcx, 0x1d0(%rbp)
140063175:     	movq	%rcx, 0x1d8(%rbp)
14006317c:     	movq	0x118(%rbp), %rcx
140063183:     	movq	%rcx, 0x1e0(%rbp)
14006318a:     	movq	%rax, 0x1e8(%rbp)
140063191:     	movb	$0x0, 0x2b6(%rbp)
140063198:     	movb	$0x1, 0x2b5(%rbp)
14006319f:     	movb	$0x1, 0x2b4(%rbp)
1400631a6:     	leaq	0x228(%rbp), %rcx
1400631ad:     	leaq	0x1d0(%rbp), %rdx
1400631b4:     	callq	0x14007fcc0 <.text+0x7ecc0>
1400631b9:     	nop
1400631ba:     	callq	0x1407b5940 <.text+0x7b4940>
1400631bf:     	movb	%dl, 0x268(%rbp)
1400631c5:     	movq	%rax, 0x190(%rbp)
1400631cc:     	movq	%rax, %rcx
1400631cf:     	addq	$0x38, %rcx
1400631d3:     	movq	%rcx, 0x2a8(%rbp)
1400631da:     	callq	0x1400892f0 <.text+0x882f0>
1400631df:     	nop
1400631e0:     	movq	0x238(%rbp), %rax
1400631e7:     	movq	0x2a8(%rbp), %rcx
1400631ee:     	movq	%rax, 0x10(%rcx)
1400631f2:     	movdqu	0x228(%rbp), %xmm0
1400631fa:     	movdqu	%xmm0, (%rcx)
1400631fe:     	testb	$0x1, 0x268(%rbp)
140063205:     	movq	0x190(%rbp), %rdi
14006320c:     	jne	0x140063224 <.text+0x62224>
14006320e:     	movq	0x79d4bb3(%rip), %rax   # 0x147a37dc8
140063215:     	movq	(%rax), %rax
140063218:     	shlq	%rax
14006321b:     	testq	%rax, %rax
14006321e:     	jne	0x140065169 <.text+0x64169>
140063224:     	xorl	%eax, %eax
140063226:     	xchgb	%al, (%rdi)
140063228:     	cmpb	$0x2, %al
14006322a:     	je	0x140065103 <.text+0x64103>
140063230:     	movb	%sil, 0x277(%rbp)
140063237:     	cmpq	$-0x1, 0x148(%rbp)
14006323f:     	sete	%sil
140063243:     	je	0x14006333a <.text+0x6233a>
140063249:     	movq	0x120(%rbp), %rax
140063250:     	movq	%rax, 0x1d0(%rbp)
140063257:     	movq	%r14, 0x1d8(%rbp)
14006325e:     	pxor	%xmm0, %xmm0
140063262:     	movdqu	%xmm0, 0x1e0(%rbp)
14006326a:     	movq	%rax, 0x1f0(%rbp)
140063271:     	movq	%r14, 0x1f8(%rbp)
140063278:     	leaq	0x228(%rbp), %rcx
14006327f:     	leaq	0x1d0(%rbp), %rdx
140063286:     	callq	0x140196a90 <.text+0x195a90>
14006328b:     	nop
14006328c:     	movzbl	0x228(%rbp), %eax
140063293:     	movb	%al, 0x268(%rbp)
140063299:     	cmpb	$-0x1, %al
14006329b:     	je	0x1400632bd <.text+0x622bd>
14006329d:     	movdqu	0x229(%rbp), %xmm0
1400632a5:     	movups	0x238(%rbp), %xmm1
1400632ac:     	movups	%xmm1, 0x1df(%rbp)
1400632b3:     	movdqa	%xmm0, 0x1d0(%rbp)
1400632bb:     	jmp	0x1400632ca <.text+0x622ca>
1400632bd:     	leaq	0x228(%rbp), %rcx
1400632c4:     	callq	0x140040560 <.text+0x3f560>
1400632c9:     	nop
1400632ca:     	movl	0x2a4(%rbp), %eax
1400632d0:     	movl	%eax, (%r13)
1400632d4:     	cmpb	$-0x1, 0x60(%r12)
1400632da:     	je	0x1400632ed <.text+0x622ed>
1400632dc:     	movq	0x288(%rbp), %rax
1400632e3:     	leaq	0x60(%rax), %rcx
1400632e7:     	callq	0x140041ef0 <.text+0x40ef0>
1400632ec:     	nop
1400632ed:     	movzbl	0x268(%rbp), %eax
1400632f4:     	movq	0x288(%rbp), %r12
1400632fb:     	movb	%al, 0x60(%r12)
140063300:     	movaps	0x1d0(%rbp), %xmm0
140063307:     	movups	%xmm0, 0x61(%r12)
14006330d:     	movdqu	0x1df(%rbp), %xmm0
140063315:     	movdqu	%xmm0, 0x70(%r12)
14006331c:     	movq	0x148(%rbp), %rdx
140063323:     	testq	%rdx, %rdx
140063326:     	je	0x14006333a <.text+0x6233a>
140063328:     	movl	$0x1, %r8d
14006332e:     	movq	0x120(%rbp), %rcx
140063335:     	callq	0x1400021d0 <.text+0x11d0>
14006333a:     	movq	%r13, 0x278(%rbp)
140063341:     	movb	%sil, 0x24f(%rbp)
140063348:     	movss	0x5c(%rbx), %xmm6
14006334d:     	movq	0x20(%rbp), %rcx
140063351:     	movq	0x28(%rbp), %rsi
140063355:     	movq	0x30(%rbp), %rax
140063359:     	leaq	(%rax,%rax,2), %rax
14006335d:     	leaq	(%rsi,%rax,8), %rdi
140063361:     	movq	%rsi, 0x40(%rbp)
140063365:     	movq	%rcx, -0x20(%rbp)
140063369:     	movq	%rcx, 0x50(%rbp)
14006336d:     	movq	%rdi, 0x58(%rbp)
140063371:     	leaq	0x1e0(%rbp), %r13
140063378:     	leaq	0x10(%r12), %rcx
14006337d:     	movq	%rcx, 0x68(%rbp)
140063381:     	leaq	0x18(%r12), %rcx
140063386:     	movq	%rcx, 0x150(%rbp)
14006338d:     	leaq	0x28(%r12), %rcx
140063392:     	movq	%rcx, 0xf0(%rbp)
140063399:     	leaq	0x30(%r12), %rcx
14006339e:     	movq	%rcx, 0x138(%rbp)
1400633a5:     	leaq	0x40(%r12), %rcx
1400633aa:     	movq	%rcx, 0x70(%rbp)
1400633ae:     	leaq	0x80(%r12), %rcx
1400633b6:     	movq	%rcx, 0x220(%rbp)
1400633bd:     	leaq	-0x18(%rsi,%rax,8), %rax
1400633c2:     	movq	%rax, 0xe8(%rbp)
1400633c9:     	xorps	%xmm7, %xmm7
1400633cc:     	pcmpeqd	%xmm8, %xmm8
1400633d1:     	leaq	0xa0(%r12), %rax
1400633d9:     	movq	%rax, 0x198(%rbp)
1400633e0:     	leaq	0xc0(%r12), %rax
1400633e8:     	movq	%rax, 0x180(%rbp)
1400633ef:     	leaq	0x60(%r12), %rax
1400633f4:     	movq	%rax, -0x8(%rbp)
1400633f8:     	leaq	0x48(%r12), %rax
1400633fd:     	movq	%rax, 0xf8(%rbp)
140063404:     	leaq	0x228(%rbp), %r15
14006340b:     	leaq	0x1d0(%rbp), %r12
140063412:     	movq	%rsi, -0x18(%rbp)
140063416:     	movq	0xe8(%rbp), %rbx
14006341d:     	subq	%rsi, %rbx
140063420:     	leaq	0x20(%rsi), %r14
140063424:     	movq	%rsi, %rax
140063427:     	nopw	(%rax,%rax)
140063430:     	cmpq	%rdi, %rax
140063433:     	je	0x140064ff2 <.text+0x63ff2>
140063439:     	leaq	0x18(%rax), %rsi
14006343d:     	movq	%rsi, 0x48(%rbp)
140063441:     	movq	(%rax), %rcx
140063444:     	cmpq	$-0x1, %rcx
140063448:     	je	0x140064fa3 <.text+0x63fa3>
14006344e:     	movq	%rcx, 0x268(%rbp)
140063455:     	movq	0x8(%rax), %rcx
140063459:     	movq	0x10(%rax), %rax
14006345d:     	movq	%rcx, 0x1d0(%rbp)
140063464:     	movq	%rax, 0x1d8(%rbp)
14006346b:     	movups	%xmm7, (%r13)
140063470:     	movq	%rcx, 0x190(%rbp)
140063477:     	movq	%rcx, 0x1f0(%rbp)
14006347e:     	movq	%rax, 0x1f8(%rbp)
140063485:     	movq	%r15, %rcx
140063488:     	movq	%r12, %rdx
14006348b:     	callq	0x140196a90 <.text+0x195a90>
140063490:     	nop
140063491:     	cmpb	$-0x1, 0x228(%rbp)
140063498:     	jne	0x1400634d0 <.text+0x624d0>
14006349a:     	movq	%r15, %rcx
14006349d:     	callq	0x140040560 <.text+0x3f560>
1400634a2:     	nop
1400634a3:     	addq	$-0x18, %rbx
1400634a7:     	addq	$0x18, %r14
1400634ab:     	movq	%rsi, %rax
1400634ae:     	movq	0x268(%rbp), %rdx
1400634b5:     	testq	%rdx, %rdx
1400634b8:     	je	0x140063430 <.text+0x62430>
1400634be:     	jmp	0x14006494d <.text+0x6394d>
1400634c3:     	nopw	%cs:(%rax,%rax)
1400634d0:     	movdqu	0x228(%rbp), %xmm0
1400634d8:     	movups	0x238(%rbp), %xmm1
1400634df:     	movaps	%xmm1, 0x1b0(%rbp)
1400634e6:     	movdqa	%xmm0, 0x1a0(%rbp)
1400634ee:     	movb	$0x1, 0x2b7(%rbp)
1400634f5:     	movl	$0x4, %edx
1400634fa:     	leaq	0x58b07ed(%rip), %rcx   # 0x145913cee
140063501:     	leaq	0x1a0(%rbp), %r8
140063508:     	callq	0x142affbe0 <.text+0x2afebe0>
14006350d:     	nop
14006350e:     	testq	%rax, %rax
140063511:     	jne	0x14006351a <.text+0x6251a>
140063513:     	movq	0x79aa29e(%rip), %rax   # 0x147a0d7b8
14006351a:     	cmpb	$0x3, (%rax)
14006351d:     	jne	0x140064930 <.text+0x63930>
140063523:     	movq	0x18(%rax), %rcx
140063527:     	addq	$-0x4, %rcx
14006352b:     	cmpq	$0x7, %rcx
14006352f:     	ja	0x140064930 <.text+0x63930>
140063535:     	movq	0x10(%rax), %rax
140063539:     	leaq	0x58b2104(%rip), %rdx   # 0x145915644
140063540:     	movslq	(%rdx,%rcx,4), %rcx
140063544:     	addq	%rdx, %rcx
140063547:     	jmpq	*%rcx
140063549:     	cmpl	$0x73736f62, (%rax)     # imm = 0x73736F62
14006354f:     	je	0x140063af5 <.text+0x62af5>
140063555:     	cmpl	$0x706f7264, (%rax)     # imm = 0x706F7264
14006355b:     	jne	0x140064930 <.text+0x63930>
140063561:     	movq	0x278(%rbp), %rax
140063568:     	movl	0x2a4(%rbp), %ecx
14006356e:     	movl	%ecx, (%rax)
140063570:     	movzbl	0x1a0(%rbp), %ebx
140063577:     	movzbl	%bl, %eax
14006357a:     	leaq	0x58b20e3(%rip), %rcx   # 0x145915664
140063581:     	movslq	(%rcx,%rax,4), %rax
140063585:     	addq	%rcx, %rax
140063588:     	jmpq	*%rax
14006358a:     	movzbl	0x1a1(%rbp), %eax
140063591:     	movb	%al, 0x1d1(%rbp)
140063597:     	jmp	0x140064e14 <.text+0x63e14>
14006359c:     	movl	(%rax), %ecx
14006359e:     	movl	$0x74736f72, %edx       # imm = 0x74736F72
1400635a3:     	xorl	%edx, %ecx
1400635a5:     	movzwl	0x4(%rax), %edx
1400635a9:     	xorl	$0x7265, %edx           # imm = 0x7265
1400635af:     	orl	%ecx, %edx
1400635b1:     	je	0x140063ad6 <.text+0x62ad6>
1400635b7:     	movl	(%rax), %ecx
1400635b9:     	movl	$0x6b636970, %edx       # imm = 0x6B636970
1400635be:     	xorl	%edx, %ecx
1400635c0:     	movzwl	0x4(%rax), %edx
1400635c4:     	xorl	$0x6465, %edx           # imm = 0x6465
1400635ca:     	orl	%ecx, %edx
1400635cc:     	je	0x1400640eb <.text+0x630eb>
1400635d2:     	movl	(%rax), %ecx
1400635d4:     	movl	$0x73756170, %edx       # imm = 0x73756170
1400635d9:     	xorl	%edx, %ecx
1400635db:     	movzwl	0x4(%rax), %edx
1400635df:     	xorl	$0x6465, %edx           # imm = 0x6465
1400635e5:     	orl	%ecx, %edx
1400635e7:     	je	0x140064374 <.text+0x63374>
1400635ed:     	movl	(%rax), %ecx
1400635ef:     	movl	$0x75736572, %edx       # imm = 0x75736572
1400635f4:     	xorl	%edx, %ecx
1400635f6:     	movzwl	0x4(%rax), %edx
1400635fa:     	xorl	$0x656d, %edx           # imm = 0x656D
140063600:     	orl	%ecx, %edx
140063602:     	je	0x1400645c9 <.text+0x635c9>
140063608:     	movl	(%rax), %ecx
14006360a:     	movl	$0x65666564, %edx       # imm = 0x65666564
14006360f:     	xorl	%edx, %ecx
140063611:     	movzwl	0x4(%rax), %edx
140063615:     	xorl	$0x7461, %edx           # imm = 0x7461
14006361b:     	orl	%ecx, %edx
14006361d:     	je	0x1400638d0 <.text+0x628d0>
140063623:     	movl	(%rax), %ecx
140063625:     	movl	$0x6f676f6c, %edx       # imm = 0x6F676F6C
14006362a:     	xorl	%edx, %ecx
14006362c:     	movzwl	0x4(%rax), %eax
140063630:     	xorl	$0x7475, %eax           # imm = 0x7475
140063635:     	orl	%ecx, %eax
140063637:     	jne	0x140064930 <.text+0x63930>
14006363d:     	movq	0x288(%rbp), %rax
140063644:     	movq	0xe0(%rax), %xmm0
14006364c:     	psubd	%xmm8, %xmm0
140063651:     	movdqa	%xmm0, 0x250(%rbp)
140063659:     	movq	0x278(%rbp), %rcx
140063660:     	movl	0x2a4(%rbp), %edx
140063666:     	movl	%edx, (%rcx)
140063668:     	cmpb	$-0x1, 0x60(%rax)
14006366c:     	je	0x140063678 <.text+0x62678>
14006366e:     	movq	-0x8(%rbp), %rcx
140063672:     	callq	0x140041ef0 <.text+0x40ef0>
140063677:     	nop
140063678:     	movq	0x220(%rbp), %rcx
14006367f:     	cmpb	$-0x1, (%rcx)
140063682:     	je	0x14006368a <.text+0x6268a>
140063684:     	callq	0x140041ef0 <.text+0x40ef0>
140063689:     	nop
14006368a:     	movq	0x198(%rbp), %rcx
140063691:     	cmpb	$-0x1, (%rcx)
140063694:     	je	0x14006369c <.text+0x6269c>
140063696:     	callq	0x140041ef0 <.text+0x40ef0>
14006369b:     	nop
14006369c:     	movq	0x180(%rbp), %rcx
1400636a3:     	cmpb	$-0x1, (%rcx)
1400636a6:     	je	0x1400636ae <.text+0x626ae>
1400636a8:     	callq	0x140041ef0 <.text+0x40ef0>
1400636ad:     	nop
1400636ae:     	movq	0x288(%rbp), %rax
1400636b5:     	movq	0x10(%rax), %rbx
1400636b9:     	testq	%rbx, %rbx
1400636bc:     	je	0x1400649fd <.text+0x639fd>
1400636c2:     	movq	0x288(%rbp), %rax
1400636c9:     	movq	0x8(%rax), %r14
1400636cd:     	addq	$0x8, %r14
1400636d1:     	jmp	0x140063abd <.text+0x62abd>
1400636d6:     	movq	(%rax), %rcx
1400636d9:     	movabsq	$0x6d65766569686361, %rdx # imm = 0x6D65766569686361
1400636e3:     	xorq	%rdx, %rcx
1400636e6:     	movq	0x3(%rax), %rax
1400636ea:     	movabsq	$0x746e656d65766569, %rdx # imm = 0x746E656D65766569
1400636f4:     	xorq	%rdx, %rax
1400636f7:     	orq	%rcx, %rax
1400636fa:     	jne	0x140064930 <.text+0x63930>
140063700:     	movb	$0x1, 0x2b7(%rbp)
140063707:     	movl	$0x21, %edx
14006370c:     	leaq	0x58b0627(%rip), %rcx   # 0x145913d3a
140063713:     	callq	0x145457c00 <.text+0x5456c00>
140063718:     	nop
140063719:     	movq	%rax, %r14
14006371c:     	movq	%rdx, %rbx
14006371f:     	movb	$0x1, 0x2b7(%rbp)
140063726:     	movl	$0x4, %edx
14006372b:     	leaq	0x58b0629(%rip), %rcx   # 0x145913d5b
140063732:     	leaq	0x1a0(%rbp), %r8
140063739:     	callq	0x142affbe0 <.text+0x2afebe0>
14006373e:     	nop
14006373f:     	testq	%rax, %rax
140063742:     	jne	0x14006374b <.text+0x6274b>
140063744:     	movq	0x79aa06d(%rip), %rax   # 0x147a0d7b8
14006374b:     	movq	%rbx, 0x2a8(%rbp)
140063752:     	cmpb	$0x3, (%rax)
140063755:     	jne	0x1400641e1 <.text+0x631e1>
14006375b:     	movq	0x18(%rax), %rbx
14006375f:     	testq	%rbx, %rbx
140063762:     	js	0x14006503c <.text+0x6403c>
140063768:     	movq	%r14, 0x298(%rbp)
14006376f:     	je	0x1400641e8 <.text+0x631e8>
140063775:     	movq	0x10(%rax), %rax
140063779:     	movq	%rax, 0x250(%rbp)
140063780:     	callq	0x140002200 <.text+0x1200>
140063785:     	movl	$0x1, %edx
14006378a:     	movq	%rbx, %rcx
14006378d:     	callq	0x1400021c0 <.text+0x11c0>
140063792:     	testq	%rax, %rax
140063795:     	je	0x1400651c9 <.text+0x641c9>
14006379b:     	movq	%rax, %r14
14006379e:     	movq	%rax, %rcx
1400637a1:     	movq	0x250(%rbp), %rdx
1400637a8:     	movq	%rbx, %r8
1400637ab:     	callq	0x1457731ed <.text+0x57721ed>
1400637b0:     	jmp	0x1400641f0 <.text+0x631f0>
1400637b5:     	movl	(%rax), %ecx
1400637b7:     	movl	$0x64616572, %edx       # imm = 0x64616572
1400637bc:     	xorl	%edx, %ecx
1400637be:     	movzbl	0x4(%rax), %edx
1400637c2:     	xorl	$0x79, %edx
1400637c5:     	orl	%ecx, %edx
1400637c7:     	je	0x140063be9 <.text+0x62be9>
1400637cd:     	movl	(%rax), %ecx
1400637cf:     	movl	$0x72617473, %edx       # imm = 0x72617473
1400637d4:     	xorl	%edx, %ecx
1400637d6:     	movzbl	0x4(%rax), %edx
1400637da:     	xorl	$0x74, %edx
1400637dd:     	orl	%ecx, %edx
1400637df:     	je	0x14006410a <.text+0x6310a>
1400637e5:     	movl	(%rax), %ecx
1400637e7:     	movl	$0x73616f74, %edx       # imm = 0x73616F74
1400637ec:     	xorl	%edx, %ecx
1400637ee:     	movzbl	0x4(%rax), %eax
1400637f2:     	xorl	$0x74, %eax
1400637f5:     	orl	%ecx, %eax
1400637f7:     	jne	0x140064930 <.text+0x63930>
1400637fd:     	movq	0x278(%rbp), %rax
140063804:     	movl	0x2a4(%rbp), %ecx
14006380a:     	movl	%ecx, (%rax)
14006380c:     	movb	$0x1, 0x2b7(%rbp)
140063813:     	movl	$0x4, %edx
140063818:     	leaq	0x58b056a(%rip), %rcx   # 0x145913d89
14006381f:     	leaq	0x1a0(%rbp), %r8
140063826:     	callq	0x142affbe0 <.text+0x2afebe0>
14006382b:     	nop
14006382c:     	testq	%rax, %rax
14006382f:     	jne	0x140063838 <.text+0x62838>
140063831:     	movq	0x79a9f80(%rip), %rax   # 0x147a0d7b8
140063838:     	cmpb	$0x3, (%rax)
14006383b:     	jne	0x14006469b <.text+0x6369b>
140063841:     	movq	0x18(%rax), %rcx
140063845:     	testq	%rcx, %rcx
140063848:     	js	0x14006508a <.text+0x6408a>
14006384e:     	movq	%rcx, 0x2a8(%rbp)
140063855:     	je	0x14006469b <.text+0x6369b>
14006385b:     	movq	0x10(%rax), %rbx
14006385f:     	callq	0x140002200 <.text+0x1200>
140063864:     	movl	$0x1, %edx
140063869:     	movq	0x2a8(%rbp), %rcx
140063870:     	callq	0x1400021c0 <.text+0x11c0>
140063875:     	testq	%rax, %rax
140063878:     	je	0x14006521b <.text+0x6421b>
14006387e:     	movq	%rax, %r14
140063881:     	movq	%rax, %rcx
140063884:     	movq	%rbx, %rdx
140063887:     	movq	0x2a8(%rbp), %r8
14006388e:     	callq	0x1457731ed <.text+0x57721ed>
140063893:     	jmp	0x1400646ac <.text+0x636ac>
140063898:     	movl	(%rax), %ecx
14006389a:     	movl	$0x696f6863, %edx       # imm = 0x696F6863
14006389f:     	xorl	%edx, %ecx
1400638a1:     	movl	0x3(%rax), %edx
1400638a4:     	movl	$0x73656369, %r8d       # imm = 0x73656369
1400638aa:     	xorl	%r8d, %edx
1400638ad:     	orl	%ecx, %edx
1400638af:     	je	0x140063da6 <.text+0x62da6>
1400638b5:     	movl	(%rax), %ecx
1400638b7:     	movl	$0x74636976, %edx       # imm = 0x74636976
1400638bc:     	xorl	%edx, %ecx
1400638be:     	movl	0x3(%rax), %eax
1400638c1:     	movl	$0x79726f74, %edx       # imm = 0x79726F74
1400638c6:     	xorl	%edx, %eax
1400638c8:     	orl	%ecx, %eax
1400638ca:     	jne	0x140064930 <.text+0x63930>
1400638d0:     	movq	0x288(%rbp), %rax
1400638d7:     	movb	$0x0, 0xea(%rax)
1400638de:     	movq	0x278(%rbp), %rcx
1400638e5:     	movl	0x2a4(%rbp), %edx
1400638eb:     	movl	%edx, (%rcx)
1400638ed:     	cmpb	$-0x1, 0x80(%rax)
1400638f4:     	je	0x140063903 <.text+0x62903>
1400638f6:     	movq	0x220(%rbp), %rcx
1400638fd:     	callq	0x140041ef0 <.text+0x40ef0>
140063902:     	nop
140063903:     	movq	0x288(%rbp), %rax
14006390a:     	movb	$-0x1, 0x80(%rax)
140063911:     	movq	0x278(%rbp), %rcx
140063918:     	movl	0x2a4(%rbp), %edx
14006391e:     	movl	%edx, (%rcx)
140063920:     	incl	0xe0(%rax)
140063926:     	movl	%edx, (%rcx)
140063928:     	cmpb	$-0x1, 0xa0(%rax)
14006392f:     	je	0x14006393e <.text+0x6293e>
140063931:     	movq	0x198(%rbp), %rcx
140063938:     	callq	0x140041ef0 <.text+0x40ef0>
14006393d:     	nop
14006393e:     	movdqa	0x1a0(%rbp), %xmm0
140063946:     	movaps	0x1b0(%rbp), %xmm1
14006394d:     	movq	0x198(%rbp), %rax
140063954:     	movups	%xmm1, 0x10(%rax)
140063958:     	movdqu	%xmm0, (%rax)
14006395c:     	movq	0x278(%rbp), %rax
140063963:     	movl	0x2a4(%rbp), %ecx
140063969:     	movl	%ecx, (%rax)
14006396b:     	movq	0x288(%rbp), %rax
140063972:     	incl	0xe4(%rax)
140063978:     	movq	0x268(%rbp), %rdx
14006397f:     	testq	%rdx, %rdx
140063982:     	jne	0x14006494d <.text+0x6394d>
140063988:     	jmp	0x140063416 <.text+0x62416>
14006398d:     	movabsq	$0x6465737561706e75, %rcx # imm = 0x6465737561706E75
140063997:     	cmpq	%rcx, (%rax)
14006399a:     	je	0x140063e1d <.text+0x62e1d>
1400639a0:     	movabsq	$0x6e776f6473736f62, %rcx # imm = 0x6E776F6473736F62
1400639aa:     	cmpq	%rcx, (%rax)
1400639ad:     	je	0x14006412c <.text+0x6312c>
1400639b3:     	movabsq	$0x6e61696472617567, %rcx # imm = 0x6E61696472617567
1400639bd:     	cmpq	%rcx, (%rax)
1400639c0:     	je	0x140064396 <.text+0x63396>
1400639c6:     	movabsq	$0x7078746e656c6174, %rcx # imm = 0x7078746E656C6174
1400639d0:     	cmpq	%rcx, (%rax)
1400639d3:     	je	0x140064619 <.text+0x63619>
1400639d9:     	movabsq	$0x64656b636f6c6e75, %rcx # imm = 0x64656B636F6C6E75
1400639e3:     	cmpq	%rcx, (%rax)
1400639e6:     	jne	0x140064930 <.text+0x63930>
1400639ec:     	movq	0x278(%rbp), %rax
1400639f3:     	movl	0x2a4(%rbp), %ecx
1400639f9:     	movl	%ecx, (%rax)
1400639fb:     	movb	$0x1, 0x2b7(%rbp)
140063a02:     	movl	$0x13, %edx
140063a07:     	leaq	0x58b02ec(%rip), %rcx   # 0x145913cfa
140063a0e:     	callq	0x145457c00 <.text+0x5456c00>
140063a13:     	nop
140063a14:     	movq	%rax, %r14
140063a17:     	movq	%rdx, %rbx
140063a1a:     	movb	$0x1, 0x2b7(%rbp)
140063a21:     	movl	$0x2, %edx
140063a26:     	leaq	0x58b02e0(%rip), %rcx   # 0x145913d0d
140063a2d:     	leaq	0x1a0(%rbp), %r8
140063a34:     	callq	0x142affbe0 <.text+0x2afebe0>
140063a39:     	nop
140063a3a:     	testq	%rax, %rax
140063a3d:     	jne	0x140063a46 <.text+0x62a46>
140063a3f:     	movq	0x79a9d72(%rip), %rax   # 0x147a0d7b8
140063a46:     	movq	%rbx, 0x2a8(%rbp)
140063a4d:     	cmpb	$0x3, (%rax)
140063a50:     	jne	0x140064c36 <.text+0x63c36>
140063a56:     	movq	0x18(%rax), %rbx
140063a5a:     	testq	%rbx, %rbx
140063a5d:     	js	0x1400650db <.text+0x640db>
140063a63:     	movq	%r14, 0x298(%rbp)
140063a6a:     	je	0x140064c3d <.text+0x63c3d>
140063a70:     	movq	0x10(%rax), %rax
140063a74:     	movq	%rax, 0x250(%rbp)
140063a7b:     	callq	0x140002200 <.text+0x1200>
140063a80:     	movl	$0x1, %edx
140063a85:     	movq	%rbx, %rcx
140063a88:     	callq	0x1400021c0 <.text+0x11c0>
140063a8d:     	testq	%rax, %rax
140063a90:     	je	0x1400651d7 <.text+0x641d7>
140063a96:     	movq	%rax, %r14
140063a99:     	movq	%rax, %rcx
140063a9c:     	movq	0x250(%rbp), %rdx
140063aa3:     	movq	%rbx, %r8
140063aa6:     	callq	0x1457731ed <.text+0x57721ed>
140063aab:     	jmp	0x140064c45 <.text+0x63c45>
140063ab0:     	addq	$0x20, %r14
140063ab4:     	decq	%rbx
140063ab7:     	je	0x1400649fd <.text+0x639fd>
140063abd:     	movq	-0x8(%r14), %rdx
140063ac1:     	testq	%rdx, %rdx
140063ac4:     	je	0x140063ab0 <.text+0x62ab0>
140063ac6:     	movq	(%r14), %rcx
140063ac9:     	movl	$0x1, %r8d
140063acf:     	callq	0x1400021d0 <.text+0x11d0>
140063ad4:     	jmp	0x140063ab0 <.text+0x62ab0>
140063ad6:     	movq	0x130(%rbp), %rax
140063add:     	movl	0x18c(%rbp), %ecx
140063ae3:     	movl	%ecx, (%rax)
140063ae5:     	movq	0x128(%rbp), %rax
140063aec:     	movb	$0x1, 0xe(%rax)
140063af0:     	jmp	0x140064930 <.text+0x63930>
140063af5:     	movb	$0x1, 0x2b7(%rbp)
140063afc:     	movl	$0x5, %edx
140063b01:     	leaq	0x58b02bf(%rip), %rcx   # 0x145913dc7
140063b08:     	leaq	0x1a0(%rbp), %r8
140063b0f:     	callq	0x142affbe0 <.text+0x2afebe0>
140063b14:     	nop
140063b15:     	testq	%rax, %rax
140063b18:     	jne	0x140063b21 <.text+0x62b21>
140063b1a:     	movq	0x79a9c97(%rip), %rax   # 0x147a0d7b8
140063b21:     	cmpb	$0x1, (%rax)
140063b24:     	jne	0x140064036 <.text+0x63036>
140063b2a:     	cmpb	$0x0, 0x1(%rax)
140063b2e:     	je	0x140064036 <.text+0x63036>
140063b34:     	movb	$0x1, 0x2b7(%rbp)
140063b3b:     	movl	$0x10, %edx
140063b40:     	leaq	0x58b0285(%rip), %rcx   # 0x145913dcc
140063b47:     	callq	0x145457c00 <.text+0x5456c00>
140063b4c:     	nop
140063b4d:     	movq	%rax, %r14
140063b50:     	movq	%rdx, %rbx
140063b53:     	movb	$0x1, 0x2b7(%rbp)
140063b5a:     	movl	$0x4, %edx
140063b5f:     	leaq	0x58b01f5(%rip), %rcx   # 0x145913d5b
140063b66:     	leaq	0x1a0(%rbp), %r8
140063b6d:     	callq	0x142affbe0 <.text+0x2afebe0>
140063b72:     	nop
140063b73:     	testq	%rax, %rax
140063b76:     	jne	0x140063b7f <.text+0x62b7f>
140063b78:     	movq	0x79a9c39(%rip), %rax   # 0x147a0d7b8
140063b7f:     	movq	%rbx, 0x2a8(%rbp)
140063b86:     	cmpb	$0x3, (%rax)
140063b89:     	jne	0x1400647f6 <.text+0x637f6>
140063b8f:     	movq	0x18(%rax), %rbx
140063b93:     	testq	%rbx, %rbx
140063b96:     	js	0x1400650c0 <.text+0x640c0>
140063b9c:     	movq	%r14, 0x298(%rbp)
140063ba3:     	je	0x1400647fd <.text+0x637fd>
140063ba9:     	movq	0x10(%rax), %rax
140063bad:     	movq	%rax, 0x250(%rbp)
140063bb4:     	callq	0x140002200 <.text+0x1200>
140063bb9:     	movl	$0x1, %edx
140063bbe:     	movq	%rbx, %rcx
140063bc1:     	callq	0x1400021c0 <.text+0x11c0>
140063bc6:     	testq	%rax, %rax
140063bc9:     	je	0x140065244 <.text+0x64244>
140063bcf:     	movq	%rax, %r14
140063bd2:     	movq	%rax, %rcx
140063bd5:     	movq	0x250(%rbp), %rdx
140063bdc:     	movq	%rbx, %r8
140063bdf:     	callq	0x1457731ed <.text+0x57721ed>
140063be4:     	jmp	0x140064805 <.text+0x63805>
140063be9:     	movq	0x288(%rbp), %rax
140063bf0:     	movw	$0x1, 0xe8(%rax)
140063bf9:     	movb	$0x0, 0xea(%rax)
140063c00:     	movq	0x278(%rbp), %rcx
140063c07:     	movl	0x2a4(%rbp), %edx
140063c0d:     	movl	%edx, (%rcx)
140063c0f:     	cmpb	$-0x1, 0xa0(%rax)
140063c16:     	je	0x140063c25 <.text+0x62c25>
140063c18:     	movq	0x198(%rbp), %rcx
140063c1f:     	callq	0x140041ef0 <.text+0x40ef0>
140063c24:     	nop
140063c25:     	movq	0x288(%rbp), %rax
140063c2c:     	movb	$-0x1, 0xa0(%rax)
140063c33:     	movq	0x278(%rbp), %rcx
140063c3a:     	movl	0x2a4(%rbp), %edx
140063c40:     	movl	%edx, (%rcx)
140063c42:     	incl	0xe4(%rax)
140063c48:     	movl	%edx, (%rcx)
140063c4a:     	cmpb	$-0x1, 0x80(%rax)
140063c51:     	je	0x140063c60 <.text+0x62c60>
140063c53:     	movq	0x220(%rbp), %rcx
140063c5a:     	callq	0x140041ef0 <.text+0x40ef0>
140063c5f:     	nop
140063c60:     	movq	0x288(%rbp), %rax
140063c67:     	movb	$-0x1, 0x80(%rax)
140063c6e:     	movq	0x278(%rbp), %rcx
140063c75:     	movl	0x2a4(%rbp), %edx
140063c7b:     	movl	%edx, (%rcx)
140063c7d:     	incl	0xe0(%rax)
140063c83:     	movl	%edx, (%rcx)
140063c85:     	movq	0x20(%rax), %rcx
140063c89:     	movq	%rcx, 0x158(%rbp)
140063c90:     	movq	0x28(%rax), %rcx
140063c94:     	movq	%rcx, 0x1c8(%rbp)
140063c9b:     	movq	$0x0, 0x28(%rax)
140063ca3:     	movq	$0x0, 0x250(%rbp)
140063cae:     	jmp	0x140063cc0 <.text+0x62cc0>
140063cb0:     	addq	$0x8, %rcx
140063cb4:     	callq	0x140088c50 <.text+0x87c50>
140063cb9:     	nop
140063cba:     	nopw	(%rax,%rax)
140063cc0:     	movq	0x250(%rbp), %rdx
140063cc7:     	cmpq	0x1c8(%rbp), %rdx
140063cce:     	je	0x140063e3f <.text+0x62e3f>
140063cd4:     	movq	%rdx, %rax
140063cd7:     	shlq	$0x5, %rax
140063cdb:     	movq	0x158(%rbp), %r8
140063ce2:     	leaq	(%r8,%rax), %rcx
140063ce6:     	incq	%rdx
140063ce9:     	movq	%rdx, 0x250(%rbp)
140063cf0:     	movzbl	(%r8,%rax), %eax
140063cf5:     	cmpl	$0x3, %eax
140063cf8:     	jb	0x140063cc0 <.text+0x62cc0>
140063cfa:     	je	0x140063d59 <.text+0x62d59>
140063cfc:     	cmpl	$0x4, %eax
140063cff:     	jne	0x140063cb0 <.text+0x62cb0>
140063d01:     	movq	0x10(%rcx), %rax
140063d05:     	movq	%rcx, 0x178(%rbp)
140063d0c:     	movq	0x18(%rcx), %rcx
140063d10:     	movq	%rcx, 0x298(%rbp)
140063d17:     	movq	%rax, 0x100(%rbp)
140063d1e:     	movq	%rax, %rcx
140063d21:     	movq	$0x0, 0x2a8(%rbp)
140063d2c:     	nopl	(%rax)
140063d30:     	movq	0x2a8(%rbp), %rax
140063d37:     	cmpq	%rax, 0x298(%rbp)
140063d3e:     	je	0x140063d7a <.text+0x62d7a>
140063d40:     	incq	%rax
140063d43:     	movq	%rax, 0x2a8(%rbp)
140063d4a:     	leaq	0x20(%rcx), %rbx
140063d4e:     	callq	0x140198520 <.text+0x197520>
140063d53:     	nop
140063d54:     	movq	%rbx, %rcx
140063d57:     	jmp	0x140063d30 <.text+0x62d30>
140063d59:     	movq	0x8(%rcx), %rdx
140063d5d:     	testq	%rdx, %rdx
140063d60:     	je	0x140063cc0 <.text+0x62cc0>
140063d66:     	movq	0x10(%rcx), %rcx
140063d6a:     	movl	$0x1, %r8d
140063d70:     	callq	0x1400021d0 <.text+0x11d0>
140063d75:     	jmp	0x140063cc0 <.text+0x62cc0>
140063d7a:     	movq	0x178(%rbp), %rax
140063d81:     	movq	0x8(%rax), %rdx
140063d85:     	testq	%rdx, %rdx
140063d88:     	je	0x140063cc0 <.text+0x62cc0>
140063d8e:     	movq	0x10(%rax), %rcx
140063d92:     	shlq	$0x5, %rdx
140063d96:     	movl	$0x8, %r8d
140063d9c:     	callq	0x1400021d0 <.text+0x11d0>
140063da1:     	jmp	0x140063cc0 <.text+0x62cc0>
140063da6:     	movq	0x278(%rbp), %rax
140063dad:     	movl	0x2a4(%rbp), %ecx
140063db3:     	movl	%ecx, (%rax)
140063db5:     	movq	0x220(%rbp), %rax
140063dbc:     	cmpb	$-0x1, (%rax)
140063dbf:     	je	0x140063dce <.text+0x62dce>
140063dc1:     	movq	0x220(%rbp), %rcx
140063dc8:     	callq	0x140041ef0 <.text+0x40ef0>
140063dcd:     	nop
140063dce:     	movdqa	0x1a0(%rbp), %xmm0
140063dd6:     	movaps	0x1b0(%rbp), %xmm1
140063ddd:     	movq	0x220(%rbp), %rax
140063de4:     	movups	%xmm1, 0x10(%rax)
140063de8:     	movdqu	%xmm0, (%rax)
140063dec:     	movq	0x278(%rbp), %rax
140063df3:     	movl	0x2a4(%rbp), %ecx
140063df9:     	movl	%ecx, (%rax)
140063dfb:     	movq	0x288(%rbp), %rax
140063e02:     	incl	0xe0(%rax)
140063e08:     	movq	0x268(%rbp), %rdx
140063e0f:     	testq	%rdx, %rdx
140063e12:     	jne	0x14006494d <.text+0x6394d>
140063e18:     	jmp	0x140063416 <.text+0x62416>
140063e1d:     	movq	0x278(%rbp), %rax
140063e24:     	movl	0x2a4(%rbp), %ecx
140063e2a:     	movl	%ecx, (%rax)
140063e2c:     	movq	0x288(%rbp), %rax
140063e33:     	movb	$0x0, 0xea(%rax)
140063e3a:     	jmp	0x140064930 <.text+0x63930>
140063e3f:     	movq	0x278(%rbp), %rax
140063e46:     	movl	0x2a4(%rbp), %ecx
140063e4c:     	movl	%ecx, (%rax)
140063e4e:     	movq	0x288(%rbp), %rax
140063e55:     	movq	0x38(%rax), %rcx
140063e59:     	movq	%rcx, 0x1c8(%rbp)
140063e60:     	movq	0x40(%rax), %rcx
140063e64:     	movq	%rcx, 0x158(%rbp)
140063e6b:     	movq	$0x0, 0x40(%rax)
140063e73:     	movq	$0x0, 0x250(%rbp)
140063e7e:     	jmp	0x140063e90 <.text+0x62e90>
140063e80:     	addq	$0x8, %rcx
140063e84:     	callq	0x140088c50 <.text+0x87c50>
140063e89:     	nop
140063e8a:     	nopw	(%rax,%rax)
140063e90:     	movq	0x250(%rbp), %rax
140063e97:     	cmpq	0x158(%rbp), %rax
140063e9e:     	je	0x140063f76 <.text+0x62f76>
140063ea4:     	leaq	(%rax,%rax,4), %rcx
140063ea8:     	incq	%rax
140063eab:     	movq	%rax, 0x250(%rbp)
140063eb2:     	movq	0x1c8(%rbp), %rax
140063eb9:     	movzbl	(%rax,%rcx,8), %eax
140063ebd:     	cmpl	$0x3, %eax
140063ec0:     	jb	0x140063e90 <.text+0x62e90>
140063ec2:     	movq	0x1c8(%rbp), %rdx
140063ec9:     	leaq	(%rdx,%rcx,8), %rcx
140063ecd:     	je	0x140063f29 <.text+0x62f29>
140063ecf:     	cmpl	$0x4, %eax
140063ed2:     	jne	0x140063e80 <.text+0x62e80>
140063ed4:     	movq	0x10(%rcx), %rax
140063ed8:     	movq	%rcx, 0x178(%rbp)
140063edf:     	movq	0x18(%rcx), %rcx
140063ee3:     	movq	%rcx, 0x298(%rbp)
140063eea:     	movq	%rax, 0x100(%rbp)
140063ef1:     	movq	%rax, %rcx
140063ef4:     	movq	$0x0, 0x2a8(%rbp)
140063eff:     	nop
140063f00:     	movq	0x2a8(%rbp), %rax
140063f07:     	cmpq	%rax, 0x298(%rbp)
140063f0e:     	je	0x140063f4a <.text+0x62f4a>
140063f10:     	incq	%rax
140063f13:     	movq	%rax, 0x2a8(%rbp)
140063f1a:     	leaq	0x20(%rcx), %rbx
140063f1e:     	callq	0x140198520 <.text+0x197520>
140063f23:     	nop
140063f24:     	movq	%rbx, %rcx
140063f27:     	jmp	0x140063f00 <.text+0x62f00>
140063f29:     	movq	0x8(%rcx), %rdx
140063f2d:     	testq	%rdx, %rdx
140063f30:     	je	0x140063e90 <.text+0x62e90>
140063f36:     	movq	0x10(%rcx), %rcx
140063f3a:     	movl	$0x1, %r8d
140063f40:     	callq	0x1400021d0 <.text+0x11d0>
140063f45:     	jmp	0x140063e90 <.text+0x62e90>
140063f4a:     	movq	0x178(%rbp), %rax
140063f51:     	movq	0x8(%rax), %rdx
140063f55:     	testq	%rdx, %rdx
140063f58:     	je	0x140063e90 <.text+0x62e90>
140063f5e:     	movq	0x10(%rax), %rcx
140063f62:     	shlq	$0x5, %rdx
140063f66:     	movl	$0x8, %r8d
140063f6c:     	callq	0x1400021d0 <.text+0x11d0>
140063f71:     	jmp	0x140063e90 <.text+0x62e90>
140063f76:     	movq	0x128(%rbp), %rax
140063f7d:     	movb	$0x0, 0xd(%rax)
140063f81:     	movl	$0x0, (%rax)
140063f87:     	movq	0x130(%rbp), %rcx
140063f8e:     	movl	0x18c(%rbp), %edx
140063f94:     	movl	%edx, (%rcx)
140063f96:     	movb	$0x0, 0xe(%rax)
140063f9a:     	movb	$0x1, 0x2b7(%rbp)
140063fa1:     	movl	$0x7, %edx
140063fa6:     	leaq	0x58afe41(%rip), %rcx   # 0x145913dee
140063fad:     	leaq	0x1a0(%rbp), %r8
140063fb4:     	callq	0x142affbe0 <.text+0x2afebe0>
140063fb9:     	nop
140063fba:     	testq	%rax, %rax
140063fbd:     	jne	0x140063fc6 <.text+0x62fc6>
140063fbf:     	movq	0x79a97f2(%rip), %rax   # 0x147a0d7b8
140063fc6:     	cmpb	$0x0, (%rax)
140063fc9:     	je	0x140063fdb <.text+0x62fdb>
140063fcb:     	movq	0x180(%rbp), %rax
140063fd2:     	cmpb	$-0x1, (%rax)
140063fd5:     	jne	0x140064930 <.text+0x63930>
140063fdb:     	movq	0x278(%rbp), %rax
140063fe2:     	movl	0x2a4(%rbp), %ecx
140063fe8:     	movl	%ecx, (%rax)
140063fea:     	movq	0x180(%rbp), %rax
140063ff1:     	cmpb	$-0x1, (%rax)
140063ff4:     	je	0x140064003 <.text+0x63003>
140063ff6:     	movq	0x180(%rbp), %rcx
140063ffd:     	callq	0x140041ef0 <.text+0x40ef0>
140064002:     	nop
140064003:     	movdqa	0x1a0(%rbp), %xmm0
14006400b:     	movaps	0x1b0(%rbp), %xmm1
140064012:     	movq	0x180(%rbp), %rax
140064019:     	movups	%xmm1, 0x10(%rax)
14006401d:     	movdqu	%xmm0, (%rax)
140064021:     	movq	0x268(%rbp), %rdx
140064028:     	testq	%rdx, %rdx
14006402b:     	jne	0x14006494d <.text+0x6394d>
140064031:     	jmp	0x140063416 <.text+0x62416>
140064036:     	movb	$0x1, 0x2b7(%rbp)
14006403d:     	movl	$0x12, %edx
140064042:     	leaq	0x58afd93(%rip), %rcx   # 0x145913ddc
140064049:     	callq	0x145457c00 <.text+0x5456c00>
14006404e:     	nop
14006404f:     	movq	%rax, %r14
140064052:     	movq	%rdx, %rbx
140064055:     	movb	$0x1, 0x2b7(%rbp)
14006405c:     	movl	$0x4, %edx
140064061:     	leaq	0x58afcf3(%rip), %rcx   # 0x145913d5b
140064068:     	leaq	0x1a0(%rbp), %r8
14006406f:     	callq	0x142affbe0 <.text+0x2afebe0>
140064074:     	nop
140064075:     	testq	%rax, %rax
140064078:     	jne	0x140064081 <.text+0x63081>
14006407a:     	movq	0x79a9737(%rip), %rax   # 0x147a0d7b8
140064081:     	movq	%rbx, 0x2a8(%rbp)
140064088:     	cmpb	$0x3, (%rax)
14006408b:     	jne	0x14006444b <.text+0x6344b>
140064091:     	movq	0x18(%rax), %rbx
140064095:     	testq	%rbx, %rbx
140064098:     	js	0x140065054 <.text+0x64054>
14006409e:     	movq	%r14, 0x298(%rbp)
1400640a5:     	je	0x140064452 <.text+0x63452>
1400640ab:     	movq	0x10(%rax), %rax
1400640af:     	movq	%rax, 0x250(%rbp)
1400640b6:     	callq	0x140002200 <.text+0x1200>
1400640bb:     	movl	$0x1, %edx
1400640c0:     	movq	%rbx, %rcx
1400640c3:     	callq	0x1400021c0 <.text+0x11c0>
1400640c8:     	testq	%rax, %rax
1400640cb:     	je	0x140065233 <.text+0x64233>
1400640d1:     	movq	%rax, %r14
1400640d4:     	movq	%rax, %rcx
1400640d7:     	movq	0x250(%rbp), %rdx
1400640de:     	movq	%rbx, %r8
1400640e1:     	callq	0x1457731ed <.text+0x57721ed>
1400640e6:     	jmp	0x14006445a <.text+0x6345a>
1400640eb:     	movq	0x130(%rbp), %rax
1400640f2:     	movl	0x18c(%rbp), %ecx
1400640f8:     	movl	%ecx, (%rax)
1400640fa:     	movq	0x128(%rbp), %rax
140064101:     	movb	$0x1, 0xf(%rax)
140064105:     	jmp	0x140064930 <.text+0x63930>
14006410a:     	movq	0x278(%rbp), %rax
140064111:     	movl	0x2a4(%rbp), %ecx
140064117:     	movl	%ecx, (%rax)
140064119:     	movq	0x288(%rbp), %rax
140064120:     	movb	$0x1, 0xe9(%rax)
140064127:     	jmp	0x140064930 <.text+0x63930>
14006412c:     	movb	$0x1, 0x2b7(%rbp)
140064133:     	movl	$0x13, %edx
140064138:     	leaq	0x58afc75(%rip), %rcx   # 0x145913db4
14006413f:     	callq	0x145457c00 <.text+0x5456c00>
140064144:     	nop
140064145:     	movq	%rax, %r14
140064148:     	movq	%rdx, %rbx
14006414b:     	movb	$0x1, 0x2b7(%rbp)
140064152:     	movl	$0x4, %edx
140064157:     	leaq	0x58afbfd(%rip), %rcx   # 0x145913d5b
14006415e:     	leaq	0x1a0(%rbp), %r8
140064165:     	callq	0x142affbe0 <.text+0x2afebe0>
14006416a:     	nop
14006416b:     	testq	%rax, %rax
14006416e:     	jne	0x140064177 <.text+0x63177>
140064170:     	movq	0x79a9641(%rip), %rax   # 0x147a0d7b8
140064177:     	movq	%rbx, 0x2a8(%rbp)
14006417e:     	cmpb	$0x3, (%rax)
140064181:     	jne	0x1400644d0 <.text+0x634d0>
140064187:     	movq	0x18(%rax), %rbx
14006418b:     	testq	%rbx, %rbx
14006418e:     	js	0x14006506f <.text+0x6406f>
140064194:     	movq	%r14, 0x298(%rbp)
14006419b:     	je	0x1400644d7 <.text+0x634d7>
1400641a1:     	movq	0x10(%rax), %rax
1400641a5:     	movq	%rax, 0x250(%rbp)
1400641ac:     	callq	0x140002200 <.text+0x1200>
1400641b1:     	movl	$0x1, %edx
1400641b6:     	movq	%rbx, %rcx
1400641b9:     	callq	0x1400021c0 <.text+0x11c0>
1400641be:     	testq	%rax, %rax
1400641c1:     	je	0x14006520a <.text+0x6420a>
1400641c7:     	movq	%rax, %r14
1400641ca:     	movq	%rax, %rcx
1400641cd:     	movq	0x250(%rbp), %rdx
1400641d4:     	movq	%rbx, %r8
1400641d7:     	callq	0x1457731ed <.text+0x57721ed>
1400641dc:     	jmp	0x1400644df <.text+0x634df>
1400641e1:     	movq	%r14, 0x298(%rbp)
1400641e8:     	movl	$0x1, %r14d
1400641ee:     	xorl	%ebx, %ebx
1400641f0:     	movq	%rbx, 0x228(%rbp)
1400641f7:     	movq	%r14, 0x78(%rbp)
1400641fb:     	movq	%r14, 0x230(%rbp)
140064202:     	movq	%rbx, 0x238(%rbp)
140064209:     	movl	$0x6, %edx
14006420e:     	leaq	0x58afb4a(%rip), %rcx   # 0x145913d5f
140064215:     	leaq	0x1a0(%rbp), %r8
14006421c:     	callq	0x142affbe0 <.text+0x2afebe0>
140064221:     	nop
140064222:     	testq	%rax, %rax
140064225:     	movq	0x298(%rbp), %rdx
14006422c:     	movq	0x2a8(%rbp), %r8
140064233:     	jne	0x14006423c <.text+0x6323c>
140064235:     	movq	0x79a957c(%rip), %rax   # 0x147a0d7b8
14006423c:     	cmpb	$0x2, (%rax)
14006423f:     	jne	0x14006424c <.text+0x6324c>
140064241:     	cmpq	$0x0, 0x8(%rax)
140064246:     	je	0x140064c2d <.text+0x63c2d>
14006424c:     	xorl	%eax, %eax
14006424e:     	movq	%rax, 0xb0(%rbp)
140064255:     	leaq	0x58afaff(%rip), %rax   # 0x145913d5b
14006425c:     	movq	%rax, 0x1d0(%rbp)
140064263:     	movq	$0x4, 0x1d8(%rbp)
14006426e:     	movq	%r15, 0x1e0(%rbp)
140064275:     	leaq	0x58afa94(%rip), %rax   # 0x145913d10
14006427c:     	movq	%rax, 0x1e8(%rbp)
140064283:     	leaq	0x58afafe(%rip), %rax   # 0x145913d88
14006428a:     	movq	%rax, 0x1f0(%rbp)
140064291:     	movq	$0x1, 0x1f8(%rbp)
14006429c:     	leaq	0xb0(%rbp), %rax
1400642a3:     	movq	%rax, 0x200(%rbp)
1400642aa:     	leaq	0x58afab7(%rip), %rax   # 0x145913d68
1400642b1:     	movq	%rax, 0x208(%rbp)
1400642b8:     	movq	$0x2, 0x20(%rsp)
1400642c1:     	leaq	0x160(%rbp), %rcx
1400642c8:     	movq	%r12, %r9
1400642cb:     	callq	0x145458060 <.text+0x5457060>
1400642d0:     	nop
1400642d1:     	movq	0x228(%rbp), %rdx
1400642d8:     	testq	%rdx, %rdx
1400642db:     	je	0x1400642ef <.text+0x632ef>
1400642dd:     	movq	0x230(%rbp), %rcx
1400642e4:     	movl	$0x1, %r8d
1400642ea:     	callq	0x1400021d0 <.text+0x11d0>
1400642ef:     	movq	0x278(%rbp), %rax
1400642f6:     	movl	0x2a4(%rbp), %ecx
1400642fc:     	movl	%ecx, (%rax)
1400642fe:     	movq	0x160(%rbp), %rax
140064305:     	movq	%rax, 0x2a8(%rbp)
14006430c:     	movq	0x168(%rbp), %rax
140064313:     	movq	%rax, 0x298(%rbp)
14006431a:     	movq	0x170(%rbp), %rax
140064321:     	movq	%rax, 0x250(%rbp)
140064328:     	movq	0x288(%rbp), %r14
14006432f:     	movq	0x10(%r14), %rbx
140064333:     	cmpq	(%r14), %rbx
140064336:     	jne	0x140064341 <.text+0x63341>
140064338:     	movq	%r14, %rcx
14006433b:     	callq	0x145774710 <.text+0x5773710>
140064340:     	nop
140064341:     	movq	0x8(%r14), %rax
140064345:     	movq	%rbx, %rcx
140064348:     	shlq	$0x5, %rcx
14006434c:     	movq	0x2a8(%rbp), %rdx
140064353:     	movq	%rdx, (%rax,%rcx)
140064357:     	movq	0x298(%rbp), %rdx
14006435e:     	movq	%rdx, 0x8(%rax,%rcx)
140064363:     	movq	0x250(%rbp), %rdx
14006436a:     	movq	%rdx, 0x10(%rax,%rcx)
14006436f:     	jmp	0x1400646f3 <.text+0x636f3>
140064374:     	movq	0x278(%rbp), %rax
14006437b:     	movl	0x2a4(%rbp), %ecx
140064381:     	movl	%ecx, (%rax)
140064383:     	movq	0x288(%rbp), %rax
14006438a:     	movb	$0x1, 0xea(%rax)
140064391:     	jmp	0x140064930 <.text+0x63930>
140064396:     	movb	$0x1, 0x2b7(%rbp)
14006439d:     	movl	$0x27, %edx
1400643a2:     	leaq	0x58af9e4(%rip), %rcx   # 0x145913d8d
1400643a9:     	callq	0x145457c00 <.text+0x5456c00>
1400643ae:     	nop
1400643af:     	movq	%rax, %r14
1400643b2:     	movq	%rdx, %rbx
1400643b5:     	movb	$0x1, 0x2b7(%rbp)
1400643bc:     	movl	$0x4, %edx
1400643c1:     	leaq	0x58af993(%rip), %rcx   # 0x145913d5b
1400643c8:     	leaq	0x1a0(%rbp), %r8
1400643cf:     	callq	0x142affbe0 <.text+0x2afebe0>
1400643d4:     	nop
1400643d5:     	testq	%rax, %rax
1400643d8:     	jne	0x1400643e1 <.text+0x633e1>
1400643da:     	movq	0x79a93d7(%rip), %rax   # 0x147a0d7b8
1400643e1:     	movq	%rbx, 0x2a8(%rbp)
1400643e8:     	cmpb	$0x3, (%rax)
1400643eb:     	jne	0x1400646fd <.text+0x636fd>
1400643f1:     	movq	0x18(%rax), %rbx
1400643f5:     	testq	%rbx, %rbx
1400643f8:     	js	0x1400650a5 <.text+0x640a5>
1400643fe:     	movq	%r14, 0x298(%rbp)
140064405:     	je	0x140064704 <.text+0x63704>
14006440b:     	movq	0x10(%rax), %rax
14006440f:     	movq	%rax, 0x250(%rbp)
140064416:     	callq	0x140002200 <.text+0x1200>
14006441b:     	movl	$0x1, %edx
140064420:     	movq	%rbx, %rcx
140064423:     	callq	0x1400021c0 <.text+0x11c0>
140064428:     	testq	%rax, %rax
14006442b:     	je	0x1400651f9 <.text+0x641f9>
140064431:     	movq	%rax, %r14
140064434:     	movq	%rax, %rcx
140064437:     	movq	0x250(%rbp), %rdx
14006443e:     	movq	%rbx, %r8
140064441:     	callq	0x1457731ed <.text+0x57721ed>
140064446:     	jmp	0x14006470c <.text+0x6370c>
14006444b:     	movq	%r14, 0x298(%rbp)
140064452:     	movl	$0x1, %r14d
140064458:     	xorl	%ebx, %ebx
14006445a:     	movq	%rbx, 0x228(%rbp)
140064461:     	movq	%r14, 0x80(%rbp)
140064468:     	movq	%r14, 0x230(%rbp)
14006446f:     	movq	%rbx, 0x238(%rbp)
140064476:     	leaq	0x58af8de(%rip), %rax   # 0x145913d5b
14006447d:     	movq	%rax, 0x1d0(%rbp)
140064484:     	movq	$0x4, 0x1d8(%rbp)
14006448f:     	movq	%r15, 0x1e0(%rbp)
140064496:     	leaq	0x58af873(%rip), %rax   # 0x145913d10
14006449d:     	movq	%rax, 0x1e8(%rbp)
1400644a4:     	movq	$0x1, 0x20(%rsp)
1400644ad:     	leaq	0xd0(%rbp), %rcx
1400644b4:     	movq	0x298(%rbp), %rdx
1400644bb:     	movq	0x2a8(%rbp), %r8
1400644c2:     	movq	%r12, %r9
1400644c5:     	callq	0x145458060 <.text+0x5457060>
1400644ca:     	nop
1400644cb:     	jmp	0x140064876 <.text+0x63876>
1400644d0:     	movq	%r14, 0x298(%rbp)
1400644d7:     	movl	$0x1, %r14d
1400644dd:     	xorl	%ebx, %ebx
1400644df:     	movq	%rbx, 0x228(%rbp)
1400644e6:     	movq	%r14, 0x88(%rbp)
1400644ed:     	movq	%r14, 0x230(%rbp)
1400644f4:     	movq	%rbx, 0x238(%rbp)
1400644fb:     	leaq	0x58af859(%rip), %rax   # 0x145913d5b
140064502:     	movq	%rax, 0x1d0(%rbp)
140064509:     	movq	$0x4, 0x1d8(%rbp)
140064514:     	movq	%r15, 0x1e0(%rbp)
14006451b:     	leaq	0x58af7ee(%rip), %rax   # 0x145913d10
140064522:     	movq	%rax, 0x1e8(%rbp)
140064529:     	movq	$0x1, 0x20(%rsp)
140064532:     	leaq	0x160(%rbp), %rcx
140064539:     	movq	0x298(%rbp), %rdx
140064540:     	movq	0x2a8(%rbp), %r8
140064547:     	movq	%r12, %r9
14006454a:     	callq	0x145458060 <.text+0x5457060>
14006454f:     	nop
140064550:     	movq	0x228(%rbp), %rdx
140064557:     	testq	%rdx, %rdx
14006455a:     	je	0x14006456e <.text+0x6356e>
14006455c:     	movq	0x230(%rbp), %rcx
140064563:     	movl	$0x1, %r8d
140064569:     	callq	0x1400021d0 <.text+0x11d0>
14006456e:     	movq	0x278(%rbp), %rax
140064575:     	movl	0x2a4(%rbp), %ecx
14006457b:     	movl	%ecx, (%rax)
14006457d:     	movq	0x160(%rbp), %rax
140064584:     	movq	%rax, 0x2a8(%rbp)
14006458b:     	movq	0x168(%rbp), %rax
140064592:     	movq	%rax, 0x298(%rbp)
140064599:     	movq	0x170(%rbp), %rax
1400645a0:     	movq	%rax, 0x250(%rbp)
1400645a7:     	movq	0x288(%rbp), %r14
1400645ae:     	movq	0x10(%r14), %rbx
1400645b2:     	cmpq	(%r14), %rbx
1400645b5:     	jne	0x1400648e6 <.text+0x638e6>
1400645bb:     	movq	%r14, %rcx
1400645be:     	callq	0x145774710 <.text+0x5773710>
1400645c3:     	nop
1400645c4:     	jmp	0x1400648e6 <.text+0x638e6>
1400645c9:     	movq	0x278(%rbp), %rax
1400645d0:     	movl	0x2a4(%rbp), %ecx
1400645d6:     	movl	%ecx, (%rax)
1400645d8:     	movq	0x220(%rbp), %rax
1400645df:     	cmpb	$-0x1, (%rax)
1400645e2:     	je	0x1400645f1 <.text+0x635f1>
1400645e4:     	movq	0x220(%rbp), %rcx
1400645eb:     	callq	0x140041ef0 <.text+0x40ef0>
1400645f0:     	nop
1400645f1:     	movq	0x288(%rbp), %rax
1400645f8:     	movb	$-0x1, 0x80(%rax)
1400645ff:     	movq	0x278(%rbp), %rcx
140064606:     	movl	0x2a4(%rbp), %edx
14006460c:     	movl	%edx, (%rcx)
14006460e:     	incl	0xe0(%rax)
140064614:     	jmp	0x140064930 <.text+0x63930>
140064619:     	movq	0x278(%rbp), %rax
140064620:     	movl	0x2a4(%rbp), %ecx
140064626:     	movl	%ecx, (%rax)
140064628:     	movq	0x198(%rbp), %r8
14006462f:     	cmpb	$-0x1, (%r8)
140064633:     	je	0x140064930 <.text+0x63930>
140064639:     	movdqa	0x1a0(%rbp), %xmm0
140064641:     	movaps	0x1b0(%rbp), %xmm1
140064648:     	movaps	%xmm1, 0x1e0(%rbp)
14006464f:     	movdqa	%xmm0, 0x1d0(%rbp)
140064657:     	movb	$0x1, 0x275(%rbp)
14006465e:     	movl	$0x6, %edx
140064663:     	leaq	0x58af6ca(%rip), %rcx   # 0x145913d34
14006466a:     	callq	0x142affce0 <.text+0x2afece0>
14006466f:     	nop
140064670:     	movq	%rax, 0x2a8(%rbp)
140064677:     	movq	%rax, %rcx
14006467a:     	callq	0x140041ef0 <.text+0x40ef0>
14006467f:     	nop
140064680:     	movdqa	0x1a0(%rbp), %xmm0
140064688:     	movaps	0x1b0(%rbp), %xmm1
14006468f:     	movq	0x2a8(%rbp), %rax
140064696:     	jmp	0x140063954 <.text+0x62954>
14006469b:     	movl	$0x1, %r14d
1400646a1:     	movq	$0x0, 0x2a8(%rbp)
1400646ac:     	movq	%r14, 0x140(%rbp)
1400646b3:     	movq	0x288(%rbp), %r14
1400646ba:     	movq	0x10(%r14), %rbx
1400646be:     	cmpq	(%r14), %rbx
1400646c1:     	jne	0x1400646cc <.text+0x636cc>
1400646c3:     	movq	%r14, %rcx
1400646c6:     	callq	0x145774710 <.text+0x5773710>
1400646cb:     	nop
1400646cc:     	movq	0x8(%r14), %rax
1400646d0:     	movq	%rbx, %rcx
1400646d3:     	shlq	$0x5, %rcx
1400646d7:     	movq	0x2a8(%rbp), %r8
1400646de:     	movq	%r8, (%rax,%rcx)
1400646e2:     	movq	0x140(%rbp), %rdx
1400646e9:     	movq	%rdx, 0x8(%rax,%rcx)
1400646ee:     	movq	%r8, 0x10(%rax,%rcx)
1400646f3:     	movb	$0x0, 0x18(%rax,%rcx)
1400646f8:     	jmp	0x140064919 <.text+0x63919>
1400646fd:     	movq	%r14, 0x298(%rbp)
140064704:     	movl	$0x1, %r14d
14006470a:     	xorl	%ebx, %ebx
14006470c:     	movq	%rbx, 0x228(%rbp)
140064713:     	movq	%r14, 0x90(%rbp)
14006471a:     	movq	%r14, 0x230(%rbp)
140064721:     	movq	%rbx, 0x238(%rbp)
140064728:     	leaq	0x58af62c(%rip), %rax   # 0x145913d5b
14006472f:     	movq	%rax, 0x1d0(%rbp)
140064736:     	movq	$0x4, 0x1d8(%rbp)
140064741:     	movq	%r15, 0x1e0(%rbp)
140064748:     	leaq	0x58af5c1(%rip), %rax   # 0x145913d10
14006474f:     	movq	%rax, 0x1e8(%rbp)
140064756:     	movq	$0x1, 0x20(%rsp)
14006475f:     	leaq	0x160(%rbp), %rcx
140064766:     	movq	0x298(%rbp), %rdx
14006476d:     	movq	0x2a8(%rbp), %r8
140064774:     	movq	%r12, %r9
140064777:     	callq	0x145458060 <.text+0x5457060>
14006477c:     	nop
14006477d:     	movq	0x228(%rbp), %rdx
140064784:     	testq	%rdx, %rdx
140064787:     	je	0x14006479b <.text+0x6379b>
140064789:     	movq	0x230(%rbp), %rcx
140064790:     	movl	$0x1, %r8d
140064796:     	callq	0x1400021d0 <.text+0x11d0>
14006479b:     	movq	0x278(%rbp), %rax
1400647a2:     	movl	0x2a4(%rbp), %ecx
1400647a8:     	movl	%ecx, (%rax)
1400647aa:     	movq	0x160(%rbp), %rax
1400647b1:     	movq	%rax, 0x2a8(%rbp)
1400647b8:     	movq	0x168(%rbp), %rax
1400647bf:     	movq	%rax, 0x298(%rbp)
1400647c6:     	movq	0x170(%rbp), %rax
1400647cd:     	movq	%rax, 0x250(%rbp)
1400647d4:     	movq	0x288(%rbp), %r14
1400647db:     	movq	0x10(%r14), %rbx
1400647df:     	cmpq	(%r14), %rbx
1400647e2:     	jne	0x1400648e6 <.text+0x638e6>
1400647e8:     	movq	%r14, %rcx
1400647eb:     	callq	0x145774710 <.text+0x5773710>
1400647f0:     	nop
1400647f1:     	jmp	0x1400648e6 <.text+0x638e6>
1400647f6:     	movq	%r14, 0x298(%rbp)
1400647fd:     	movl	$0x1, %r14d
140064803:     	xorl	%ebx, %ebx
140064805:     	movq	%rbx, 0x228(%rbp)
14006480c:     	movq	%r14, 0x98(%rbp)
140064813:     	movq	%r14, 0x230(%rbp)
14006481a:     	movq	%rbx, 0x238(%rbp)
140064821:     	leaq	0x58af533(%rip), %rax   # 0x145913d5b
140064828:     	movq	%rax, 0x1d0(%rbp)
14006482f:     	movq	$0x4, 0x1d8(%rbp)
14006483a:     	movq	%r15, 0x1e0(%rbp)
140064841:     	leaq	0x58af4c8(%rip), %rax   # 0x145913d10
140064848:     	movq	%rax, 0x1e8(%rbp)
14006484f:     	movq	$0x1, 0x20(%rsp)
140064858:     	leaq	0xd0(%rbp), %rcx
14006485f:     	movq	0x298(%rbp), %rdx
140064866:     	movq	0x2a8(%rbp), %r8
14006486d:     	movq	%r12, %r9
140064870:     	callq	0x145458060 <.text+0x5457060>
140064875:     	nop
140064876:     	movq	0x228(%rbp), %rdx
14006487d:     	testq	%rdx, %rdx
140064880:     	je	0x140064894 <.text+0x63894>
140064882:     	movq	0x230(%rbp), %rcx
140064889:     	movl	$0x1, %r8d
14006488f:     	callq	0x1400021d0 <.text+0x11d0>
140064894:     	movq	0x278(%rbp), %rax
14006489b:     	movl	0x2a4(%rbp), %ecx
1400648a1:     	movl	%ecx, (%rax)
1400648a3:     	movq	0xd0(%rbp), %rax
1400648aa:     	movq	%rax, 0x2a8(%rbp)
1400648b1:     	movq	0xd8(%rbp), %rax
1400648b8:     	movq	%rax, 0x298(%rbp)
1400648bf:     	movq	0xe0(%rbp), %rax
1400648c6:     	movq	%rax, 0x250(%rbp)
1400648cd:     	movq	0x288(%rbp), %r14
1400648d4:     	movq	0x10(%r14), %rbx
1400648d8:     	cmpq	(%r14), %rbx
1400648db:     	jne	0x1400648e6 <.text+0x638e6>
1400648dd:     	movq	%r14, %rcx
1400648e0:     	callq	0x145774710 <.text+0x5773710>
1400648e5:     	nop
1400648e6:     	movq	0x8(%r14), %rax
1400648ea:     	movq	%rbx, %rcx
1400648ed:     	shlq	$0x5, %rcx
1400648f1:     	movq	0x2a8(%rbp), %rdx
1400648f8:     	movq	%rdx, (%rax,%rcx)
1400648fc:     	movq	0x298(%rbp), %rdx
140064903:     	movq	%rdx, 0x8(%rax,%rcx)
140064908:     	movq	0x250(%rbp), %rdx
14006490f:     	movq	%rdx, 0x10(%rax,%rcx)
140064914:     	movb	$0x1, 0x18(%rax,%rcx)
140064919:     	movss	%xmm6, 0x1c(%rax,%rcx)
14006491f:     	incq	%rbx
140064922:     	movq	%rbx, 0x10(%r14)
140064926:     	nopw	%cs:(%rax,%rax)
140064930:     	leaq	0x1a0(%rbp), %rcx
140064937:     	callq	0x140041ef0 <.text+0x40ef0>
14006493c:     	nop
14006493d:     	movq	0x268(%rbp), %rdx
140064944:     	testq	%rdx, %rdx
140064947:     	je	0x140063416 <.text+0x62416>
14006494d:     	movl	$0x1, %r8d
140064953:     	movq	0x190(%rbp), %rcx
14006495a:     	callq	0x1400021d0 <.text+0x11d0>
14006495f:     	jmp	0x140063416 <.text+0x62416>
140064964:     	movb	$0x1, 0x2b7(%rbp)
14006496b:     	leaq	0x1d8(%rbp), %rcx
140064972:     	leaq	0x1a8(%rbp), %rdx
140064979:     	callq	0x1401b4d40 <.text+0x1b3d40>
14006497e:     	nop
14006497f:     	jmp	0x140064e14 <.text+0x63e14>
140064984:     	leaq	0x1a8(%rbp), %rax
14006498b:     	movdqu	(%rax), %xmm0
14006498f:     	leaq	0x1d8(%rbp), %rax
140064996:     	movdqu	%xmm0, (%rax)
14006499a:     	jmp	0x140064e14 <.text+0x63e14>
14006499f:     	movb	$0x1, 0x2b7(%rbp)
1400649a6:     	leaq	0x1d8(%rbp), %rcx
1400649ad:     	leaq	0x1a8(%rbp), %rdx
1400649b4:     	callq	0x145728850 <.text+0x5727850>
1400649b9:     	nop
1400649ba:     	jmp	0x140064e14 <.text+0x63e14>
1400649bf:     	cmpq	$0x0, 0x1b8(%rbp)
1400649c7:     	je	0x140064dfe <.text+0x63dfe>
1400649cd:     	movq	0x1a8(%rbp), %rdx
1400649d4:     	testq	%rdx, %rdx
1400649d7:     	je	0x1400651b3 <.text+0x641b3>
1400649dd:     	movq	0x1b0(%rbp), %r8
1400649e4:     	movb	$0x1, 0x2b7(%rbp)
1400649eb:     	leaq	0x1d8(%rbp), %rcx
1400649f2:     	callq	0x14007c940 <.text+0x7b940>
1400649f7:     	nop
1400649f8:     	jmp	0x140064e14 <.text+0x63e14>
1400649fd:     	movq	0x288(%rbp), %rbx
140064a04:     	movq	(%rbx), %rdx
140064a07:     	testq	%rdx, %rdx
140064a0a:     	je	0x140064a1f <.text+0x63a1f>
140064a0c:     	movq	0x8(%rbx), %rcx
140064a10:     	shlq	$0x5, %rdx
140064a14:     	movl	$0x8, %r8d
140064a1a:     	callq	0x1400021d0 <.text+0x11d0>
140064a1f:     	movq	0x20(%rbx), %rcx
140064a23:     	movq	0x28(%rbx), %rax
140064a27:     	movq	%rax, 0x298(%rbp)
140064a2e:     	movq	%rcx, 0x1c8(%rbp)
140064a35:     	movq	$0x0, 0x2a8(%rbp)
140064a40:     	movq	0x2a8(%rbp), %rax
140064a47:     	cmpq	%rax, 0x298(%rbp)
140064a4e:     	je	0x140064a69 <.text+0x63a69>
140064a50:     	incq	%rax
140064a53:     	movq	%rax, 0x2a8(%rbp)
140064a5a:     	leaq	0x20(%rcx), %rbx
140064a5e:     	callq	0x140198520 <.text+0x197520>
140064a63:     	nop
140064a64:     	movq	%rbx, %rcx
140064a67:     	jmp	0x140064a40 <.text+0x63a40>
140064a69:     	movq	0x150(%rbp), %rax
140064a70:     	movq	(%rax), %rdx
140064a73:     	testq	%rdx, %rdx
140064a76:     	movq	0x288(%rbp), %rbx
140064a7d:     	je	0x140064a92 <.text+0x63a92>
140064a7f:     	movq	0x20(%rbx), %rcx
140064a83:     	shlq	$0x5, %rdx
140064a87:     	movl	$0x8, %r8d
140064a8d:     	callq	0x1400021d0 <.text+0x11d0>
140064a92:     	movq	0x38(%rbx), %rcx
140064a96:     	movq	0x40(%rbx), %rax
140064a9a:     	movq	%rax, 0x298(%rbp)
140064aa1:     	movq	%rcx, 0x1c8(%rbp)
140064aa8:     	movq	$0x0, 0x2a8(%rbp)
140064ab3:     	movq	0x2a8(%rbp), %rax
140064aba:     	cmpq	%rax, 0x298(%rbp)
140064ac1:     	je	0x140064adc <.text+0x63adc>
140064ac3:     	incq	%rax
140064ac6:     	movq	%rax, 0x2a8(%rbp)
140064acd:     	leaq	0x28(%rcx), %rbx
140064ad1:     	callq	0x140198520 <.text+0x197520>
140064ad6:     	nop
140064ad7:     	movq	%rbx, %rcx
140064ada:     	jmp	0x140064ab3 <.text+0x63ab3>
140064adc:     	movq	0x138(%rbp), %rax
140064ae3:     	movq	(%rax), %rax
140064ae6:     	testq	%rax, %rax
140064ae9:     	movq	0x288(%rbp), %rbx
140064af0:     	je	0x140064b09 <.text+0x63b09>
140064af2:     	movq	0x38(%rbx), %rcx
140064af6:     	shlq	$0x3, %rax
140064afa:     	leaq	(%rax,%rax,4), %rdx
140064afe:     	movl	$0x8, %r8d
140064b04:     	callq	0x1400021d0 <.text+0x11d0>
140064b09:     	movq	0x50(%rbx), %rcx
140064b0d:     	movq	0x58(%rbx), %rax
140064b11:     	movq	%rax, 0x298(%rbp)
140064b18:     	movq	%rcx, 0x1c8(%rbp)
140064b1f:     	movq	$0x0, 0x2a8(%rbp)
140064b2a:     	movq	0x2a8(%rbp), %rax
140064b31:     	cmpq	%rax, 0x298(%rbp)
140064b38:     	je	0x140064b56 <.text+0x63b56>
140064b3a:     	incq	%rax
140064b3d:     	movq	%rax, 0x2a8(%rbp)
140064b44:     	leaq	0xb0(%rcx), %rbx
140064b4b:     	callq	0x14007b010 <.text+0x7a010>
140064b50:     	nop
140064b51:     	movq	%rbx, %rcx
140064b54:     	jmp	0x140064b2a <.text+0x63b2a>
140064b56:     	movq	0xf8(%rbp), %rax
140064b5d:     	movq	(%rax), %rax
140064b60:     	testq	%rax, %rax
140064b63:     	movq	0x288(%rbp), %rbx
140064b6a:     	je	0x140064b82 <.text+0x63b82>
140064b6c:     	movq	0x50(%rbx), %rcx
140064b70:     	imulq	$0xb0, %rax, %rdx
140064b77:     	movl	$0x8, %r8d
140064b7d:     	callq	0x1400021d0 <.text+0x11d0>
140064b82:     	movq	$0x0, (%rbx)
140064b89:     	movq	$0x8, 0x8(%rbx)
140064b91:     	movq	0x68(%rbp), %rax
140064b95:     	movups	%xmm7, (%rax)
140064b98:     	movq	$0x8, 0x20(%rbx)
140064ba0:     	movq	0xf0(%rbp), %rax
140064ba7:     	movups	%xmm7, (%rax)
140064baa:     	movq	$0x8, 0x38(%rbx)
140064bb2:     	movq	0x70(%rbp), %rax
140064bb6:     	movups	%xmm7, (%rax)
140064bb9:     	movq	$0x8, 0x50(%rbx)
140064bc1:     	movq	$0x0, 0x58(%rbx)
140064bc9:     	movb	$-0x1, 0x60(%rbx)
140064bcd:     	movb	$-0x1, 0x80(%rbx)
140064bd4:     	movb	$-0x1, 0xa0(%rbx)
140064bdb:     	movb	$-0x1, 0xc0(%rbx)
140064be2:     	movdqa	0x250(%rbp), %xmm0
140064bea:     	movq	%xmm0, 0xe0(%rbx)
140064bf2:     	movw	$0x0, 0xe8(%rbx)
140064bfb:     	movb	$0x0, 0xea(%rbx)
140064c02:     	movq	0x130(%rbp), %rdx
140064c09:     	movl	0x18c(%rbp), %r8d
140064c10:     	movl	%r8d, (%rdx)
140064c13:     	movq	0x128(%rbp), %rcx
140064c1a:     	movb	$0x0, 0xe(%rcx)
140064c1e:     	movzbl	0xc(%rcx), %eax
140064c22:     	movl	%r8d, (%rdx)
140064c25:     	movb	%al, 0xd(%rcx)
140064c28:     	jmp	0x140064930 <.text+0x63930>
140064c2d:     	movq	0x10(%rax), %rax
140064c31:     	jmp	0x14006424e <.text+0x6324e>
140064c36:     	movq	%r14, 0x298(%rbp)
140064c3d:     	movl	$0x1, %r14d
140064c43:     	xorl	%ebx, %ebx
140064c45:     	movq	%rbx, 0x228(%rbp)
140064c4c:     	movq	%r14, 0xa0(%rbp)
140064c53:     	movq	%r14, 0x230(%rbp)
140064c5a:     	movq	%rbx, 0x238(%rbp)
140064c61:     	leaq	0x58af0c8(%rip), %rax   # 0x145913d30
140064c68:     	movq	%rax, 0x1d0(%rbp)
140064c6f:     	movq	$0x4, 0x1d8(%rbp)
140064c7a:     	movq	%r15, 0x1e0(%rbp)
140064c81:     	leaq	0x58af088(%rip), %rax   # 0x145913d10
140064c88:     	movq	%rax, 0x1e8(%rbp)
140064c8f:     	movq	$0x1, 0x20(%rsp)
140064c98:     	leaq	0x160(%rbp), %rcx
140064c9f:     	movq	0x298(%rbp), %rdx
140064ca6:     	movq	0x2a8(%rbp), %r8
140064cad:     	movq	%r12, %r9
140064cb0:     	callq	0x145458060 <.text+0x5457060>
140064cb5:     	nop
140064cb6:     	movq	0x160(%rbp), %rax
140064cbd:     	movq	%rax, 0x2a8(%rbp)
140064cc4:     	movq	0x168(%rbp), %rax
140064ccb:     	movq	%rax, 0x298(%rbp)
140064cd2:     	movq	0x170(%rbp), %rax
140064cd9:     	movq	%rax, 0x250(%rbp)
140064ce0:     	movq	0x288(%rbp), %r14
140064ce7:     	movq	0x10(%r14), %rbx
140064ceb:     	cmpq	(%r14), %rbx
140064cee:     	jne	0x140064cf9 <.text+0x63cf9>
140064cf0:     	movq	%r14, %rcx
140064cf3:     	callq	0x145774710 <.text+0x5773710>
140064cf8:     	nop
140064cf9:     	movq	0x8(%r14), %rax
140064cfd:     	movq	%rbx, %rcx
140064d00:     	shlq	$0x5, %rcx
140064d04:     	movq	0x2a8(%rbp), %rdx
140064d0b:     	movq	%rdx, (%rax,%rcx)
140064d0f:     	movq	0x298(%rbp), %rdx
140064d16:     	movq	%rdx, 0x8(%rax,%rcx)
140064d1b:     	movq	0x250(%rbp), %rdx
140064d22:     	movq	%rdx, 0x10(%rax,%rcx)
140064d27:     	movb	$0x0, 0x18(%rax,%rcx)
140064d2c:     	movss	%xmm6, 0x1c(%rax,%rcx)
140064d32:     	incq	%rbx
140064d35:     	movq	%rbx, 0x10(%r14)
140064d39:     	movq	0x228(%rbp), %rdx
140064d40:     	testq	%rdx, %rdx
140064d43:     	je	0x140064d57 <.text+0x63d57>
140064d45:     	movq	0x230(%rbp), %rcx
140064d4c:     	movl	$0x1, %r8d
140064d52:     	callq	0x1400021d0 <.text+0x11d0>
140064d57:     	movq	0x278(%rbp), %rax
140064d5e:     	movl	0x2a4(%rbp), %ecx
140064d64:     	movl	%ecx, (%rax)
140064d66:     	movq	0x198(%rbp), %rax
140064d6d:     	cmpb	$-0x1, (%rax)
140064d70:     	je	0x140064930 <.text+0x63930>
140064d76:     	movb	$0x1, 0x2b7(%rbp)
140064d7d:     	movl	$0x2, %edx
140064d82:     	leaq	0x58aef84(%rip), %rcx   # 0x145913d0d
140064d89:     	leaq	0x1a0(%rbp), %r8
140064d90:     	callq	0x142affbe0 <.text+0x2afebe0>
140064d95:     	nop
140064d96:     	testq	%rax, %rax
140064d99:     	jne	0x140064da2 <.text+0x63da2>
140064d9b:     	movq	0x79a8a16(%rip), %rax   # 0x147a0d7b8
140064da2:     	cmpb	$0x3, (%rax)
140064da5:     	jne	0x140064f09 <.text+0x63f09>
140064dab:     	movq	0x18(%rax), %rbx
140064daf:     	testq	%rbx, %rbx
140064db2:     	js	0x14006513b <.text+0x6413b>
140064db8:     	je	0x140064f09 <.text+0x63f09>
140064dbe:     	movq	0x10(%rax), %rax
140064dc2:     	movq	%rax, 0x2a8(%rbp)
140064dc9:     	callq	0x140002200 <.text+0x1200>
140064dce:     	movl	$0x1, %edx
140064dd3:     	movq	%rbx, %rcx
140064dd6:     	callq	0x1400021c0 <.text+0x11c0>
140064ddb:     	testq	%rax, %rax
140064dde:     	je	0x1400651e8 <.text+0x641e8>
140064de4:     	movq	%rax, %r14
140064de7:     	movq	%rax, %rcx
140064dea:     	movq	0x2a8(%rbp), %rdx
140064df1:     	movq	%rbx, %r8
140064df4:     	callq	0x1457731ed <.text+0x57721ed>
140064df9:     	jmp	0x140064f11 <.text+0x63f11>
140064dfe:     	movq	$0x0, 0x1d8(%rbp)
140064e09:     	movq	$0x0, 0x1e8(%rbp)
140064e14:     	movb	%bl, 0x1d0(%rbp)
140064e1a:     	movq	0xf0(%rbp), %rax
140064e21:     	movq	(%rax), %rbx
140064e24:     	movq	0x150(%rbp), %rax
140064e2b:     	cmpq	(%rax), %rbx
140064e2e:     	jne	0x140064e3d <.text+0x63e3d>
140064e30:     	movq	0x150(%rbp), %rcx
140064e37:     	callq	0x145774710 <.text+0x5773710>
140064e3c:     	nop
140064e3d:     	movq	0x288(%rbp), %rdx
140064e44:     	movq	0x20(%rdx), %rax
140064e48:     	movq	%rbx, %rcx
140064e4b:     	shlq	$0x5, %rcx
140064e4f:     	movups	0x1d0(%rbp), %xmm0
140064e56:     	movups	0x1e0(%rbp), %xmm1
140064e5d:     	movups	%xmm1, 0x10(%rax,%rcx)
140064e62:     	movups	%xmm0, (%rax,%rcx)
140064e66:     	incq	%rbx
140064e69:     	movq	%rbx, 0x28(%rdx)
140064e6d:     	movq	0x278(%rbp), %rax
140064e74:     	movl	0x2a4(%rbp), %ecx
140064e7a:     	movl	%ecx, (%rax)
140064e7c:     	movdqa	0x1a0(%rbp), %xmm0
140064e84:     	movaps	0x1b0(%rbp), %xmm1
140064e8b:     	movaps	%xmm1, 0x1e0(%rbp)
140064e92:     	movdqa	%xmm0, 0x1d0(%rbp)
140064e9a:     	movss	%xmm6, 0x1f0(%rbp)
140064ea2:     	movq	0x40(%rdx), %rbx
140064ea6:     	cmpq	0x30(%rdx), %rbx
140064eaa:     	jne	0x140064eb9 <.text+0x63eb9>
140064eac:     	movq	0x138(%rbp), %rcx
140064eb3:     	callq	0x145774780 <.text+0x5773780>
140064eb8:     	nop
140064eb9:     	movq	0x288(%rbp), %r8
140064ec0:     	movq	0x38(%r8), %rax
140064ec4:     	leaq	(%rbx,%rbx,4), %rcx
140064ec8:     	movq	0x1f0(%rbp), %rdx
140064ecf:     	movq	%rdx, 0x20(%rax,%rcx,8)
140064ed4:     	movdqa	0x1d0(%rbp), %xmm0
140064edc:     	movaps	0x1e0(%rbp), %xmm1
140064ee3:     	movups	%xmm1, 0x10(%rax,%rcx,8)
140064ee8:     	movdqu	%xmm0, (%rax,%rcx,8)
140064eed:     	incq	%rbx
140064ef0:     	movq	%rbx, 0x40(%r8)
140064ef4:     	movq	0x268(%rbp), %rdx
140064efb:     	testq	%rdx, %rdx
140064efe:     	jne	0x14006494d <.text+0x6394d>
140064f04:     	jmp	0x140063416 <.text+0x62416>
140064f09:     	movl	$0x1, %r14d
140064f0f:     	xorl	%ebx, %ebx
140064f11:     	movq	%rbx, 0x1d8(%rbp)
140064f18:     	movq	%r14, 0xa8(%rbp)
140064f1f:     	movq	%r14, 0x1e0(%rbp)
140064f26:     	movq	%rbx, 0x1e8(%rbp)
140064f2d:     	movb	$0x3, 0x1d0(%rbp)
140064f34:     	movb	$0x1, 0x276(%rbp)
140064f3b:     	movl	$0x8, %edx
140064f40:     	leaq	0x58aedab(%rip), %rcx   # 0x145913cf2
140064f47:     	movq	0x198(%rbp), %r8
140064f4e:     	callq	0x142affce0 <.text+0x2afece0>
140064f53:     	nop
140064f54:     	movq	%rax, 0x2a8(%rbp)
140064f5b:     	movq	%rax, %rcx
140064f5e:     	callq	0x140041ef0 <.text+0x40ef0>
140064f63:     	nop
140064f64:     	movdqu	0x1d0(%rbp), %xmm0
140064f6c:     	movups	0x1e0(%rbp), %xmm1
140064f73:     	movq	0x2a8(%rbp), %rax
140064f7a:     	movups	%xmm1, 0x10(%rax)
140064f7e:     	movdqu	%xmm0, (%rax)
140064f82:     	movq	0x278(%rbp), %rax
140064f89:     	movl	0x2a4(%rbp), %ecx
140064f8f:     	movl	%ecx, (%rax)
140064f91:     	movq	0x288(%rbp), %rax
140064f98:     	incl	0xe4(%rax)
140064f9e:     	jmp	0x140064930 <.text+0x63930>
140064fa3:     	cmpq	%rsi, %rdi
140064fa6:     	je	0x140064ff2 <.text+0x63ff2>
140064fa8:     	movabsq	$-0x5555555555555555, %rcx # imm = 0xAAAAAAAAAAAAAAAB
140064fb2:     	movq	%rbx, %rax
140064fb5:     	mulq	%rcx
140064fb8:     	movq	%rdx, %rdi
140064fbb:     	shrq	$0x4, %rdi
140064fbf:     	jmp	0x140064fd9 <.text+0x63fd9>
140064fc1:     	nopw	%cs:(%rax,%rax)
140064fd0:     	addq	$0x18, %r14
140064fd4:     	decq	%rdi
140064fd7:     	je	0x140064ff2 <.text+0x63ff2>
140064fd9:     	movq	-0x8(%r14), %rdx
140064fdd:     	testq	%rdx, %rdx
140064fe0:     	je	0x140064fd0 <.text+0x63fd0>
140064fe2:     	movq	(%r14), %rcx
140064fe5:     	movl	$0x1, %r8d
140064feb:     	callq	0x1400021d0 <.text+0x11d0>
140064ff0:     	jmp	0x140064fd0 <.text+0x63fd0>
140064ff2:     	movq	-0x20(%rbp), %rax
140064ff6:     	testq	%rax, %rax
140064ff9:     	je	0x140065012 <.text+0x64012>
140064ffb:     	shlq	$0x3, %rax
140064fff:     	leaq	(%rax,%rax,2), %rdx
140065003:     	movl	$0x8, %r8d
140065009:     	movq	-0x18(%rbp), %rcx
14006500d:     	callq	0x1400021d0 <.text+0x11d0>
140065012:     	movaps	0x2c0(%rbp), %xmm6
140065019:     	movaps	0x2d0(%rbp), %xmm7
140065020:     	movaps	0x2e0(%rbp), %xmm8
140065028:     	addq	$0x378, %rsp            # imm = 0x378
14006502f:     	popq	%rbx
140065030:     	popq	%rdi
140065031:     	popq	%rsi
140065032:     	popq	%r12
140065034:     	popq	%r13
140065036:     	popq	%r14
140065038:     	popq	%r15
14006503a:     	popq	%rbp
14006503b:     	retq
14006503c:     	xorl	%ecx, %ecx
14006503e:     	movb	$0x1, 0x2b7(%rbp)
140065045:     	movq	0x78(%rbp), %rdx
140065049:     	callq	0x14590379b <.text+0x590279b>
14006504e:     	nop
14006504f:     	jmp	0x1400651c7 <.text+0x641c7>
140065054:     	xorl	%ecx, %ecx
140065056:     	movb	$0x1, 0x2b7(%rbp)
14006505d:     	movq	0x80(%rbp), %rdx
140065064:     	callq	0x14590379b <.text+0x590279b>
140065069:     	nop
14006506a:     	jmp	0x1400651c7 <.text+0x641c7>
14006506f:     	xorl	%ecx, %ecx
140065071:     	movb	$0x1, 0x2b7(%rbp)
140065078:     	movq	0x88(%rbp), %rdx
14006507f:     	callq	0x14590379b <.text+0x590279b>
140065084:     	nop
140065085:     	jmp	0x1400651c7 <.text+0x641c7>
14006508a:     	xorl	%ecx, %ecx
14006508c:     	movb	$0x1, 0x2b7(%rbp)
140065093:     	movq	0x140(%rbp), %rdx
14006509a:     	callq	0x14590379b <.text+0x590279b>
14006509f:     	nop
1400650a0:     	jmp	0x1400651c7 <.text+0x641c7>
1400650a5:     	xorl	%ecx, %ecx
1400650a7:     	movb	$0x1, 0x2b7(%rbp)
1400650ae:     	movq	0x90(%rbp), %rdx
1400650b5:     	callq	0x14590379b <.text+0x590279b>
1400650ba:     	nop
1400650bb:     	jmp	0x1400651c7 <.text+0x641c7>
1400650c0:     	xorl	%ecx, %ecx
1400650c2:     	movb	$0x1, 0x2b7(%rbp)
1400650c9:     	movq	0x98(%rbp), %rdx
1400650d0:     	callq	0x14590379b <.text+0x590279b>
1400650d5:     	nop
1400650d6:     	jmp	0x1400651c7 <.text+0x641c7>
1400650db:     	xorl	%ecx, %ecx
1400650dd:     	movb	$0x1, 0x2b7(%rbp)
1400650e4:     	movq	0xa0(%rbp), %rdx
1400650eb:     	callq	0x14590379b <.text+0x590279b>
1400650f0:     	nop
1400650f1:     	jmp	0x1400651c7 <.text+0x641c7>
1400650f6:     	movq	%rdi, %rcx
1400650f9:     	callq	0x145901f00 <.text+0x5900f00>
1400650fe:     	jmp	0x140062cad <.text+0x61cad>
140065103:     	movb	$0x0, 0x2b6(%rbp)
14006510a:     	movb	$0x1, 0x2b5(%rbp)
140065111:     	movb	$0x1, 0x2b4(%rbp)
140065118:     	movq	%rdi, %rcx
14006511b:     	callq	0x145901f00 <.text+0x5900f00>
140065120:     	nop
140065121:     	jmp	0x140063230 <.text+0x62230>
140065126:     	movb	$0x0, 0x287(%rbp)
14006512d:     	movq	%rsi, %rcx
140065130:     	callq	0x145901f00 <.text+0x5900f00>
140065135:     	nop
140065136:     	jmp	0x140063150 <.text+0x62150>
14006513b:     	xorl	%ecx, %ecx
14006513d:     	movb	$0x1, 0x2b7(%rbp)
140065144:     	movq	0xa8(%rbp), %rdx
14006514b:     	callq	0x14590379b <.text+0x590279b>
140065150:     	nop
140065151:     	jmp	0x1400651c7 <.text+0x641c7>
140065153:     	callq	0x145902bd0 <.text+0x5901bd0>
140065158:     	testb	%al, %al
14006515a:     	jne	0x140062c9a <.text+0x61c9a>
140065160:     	movb	$0x1, 0x1(%rdi)
140065164:     	jmp	0x140062c9a <.text+0x61c9a>
140065169:     	movb	$0x0, 0x2b6(%rbp)
140065170:     	movb	$0x1, 0x2b5(%rbp)
140065177:     	movb	$0x1, 0x2b4(%rbp)
14006517e:     	callq	0x145902bd0 <.text+0x5901bd0>
140065183:     	nop
140065184:     	testb	%al, %al
140065186:     	jne	0x140063224 <.text+0x62224>
14006518c:     	movb	$0x1, 0x1(%rdi)
140065190:     	jmp	0x140063224 <.text+0x62224>
140065195:     	movb	$0x0, 0x287(%rbp)
14006519c:     	callq	0x145902bd0 <.text+0x5901bd0>
1400651a1:     	nop
1400651a2:     	testb	%al, %al
1400651a4:     	jne	0x140063144 <.text+0x62144>
1400651aa:     	movb	$0x1, 0x1(%rsi)
1400651ae:     	jmp	0x140063144 <.text+0x62144>
1400651b3:     	movb	$0x1, 0x2b7(%rbp)
1400651ba:     	leaq	0x58b1b97(%rip), %rcx   # 0x145916d58
1400651c1:     	callq	0x145903a90 <.text+0x5902a90>
1400651c6:     	nop
1400651c7:     	ud2
1400651c9:     	movq	%rbx, 0x78(%rbp)
1400651cd:     	movl	$0x1, %ecx
1400651d2:     	jmp	0x14006503e <.text+0x6403e>
1400651d7:     	movq	%rbx, 0xa0(%rbp)
1400651de:     	movl	$0x1, %ecx
1400651e3:     	jmp	0x1400650dd <.text+0x640dd>
1400651e8:     	movq	%rbx, 0xa8(%rbp)
1400651ef:     	movl	$0x1, %ecx
1400651f4:     	jmp	0x14006513d <.text+0x6413d>
1400651f9:     	movq	%rbx, 0x90(%rbp)
140065200:     	movl	$0x1, %ecx
140065205:     	jmp	0x1400650a7 <.text+0x640a7>
14006520a:     	movq	%rbx, 0x88(%rbp)
140065211:     	movl	$0x1, %ecx
140065216:     	jmp	0x140065071 <.text+0x64071>
14006521b:     	movq	0x2a8(%rbp), %rax
140065222:     	movq	%rax, 0x140(%rbp)
140065229:     	movl	$0x1, %ecx
14006522e:     	jmp	0x14006508c <.text+0x6408c>
140065233:     	movq	%rbx, 0x80(%rbp)
14006523a:     	movl	$0x1, %ecx
14006523f:     	jmp	0x140065056 <.text+0x64056>
140065244:     	movq	%rbx, 0x98(%rbp)
14006524b:     	movl	$0x1, %ecx
140065250:     	jmp	0x1400650c2 <.text+0x640c2>
