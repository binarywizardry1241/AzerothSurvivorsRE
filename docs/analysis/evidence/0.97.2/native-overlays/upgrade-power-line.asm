
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14540ee70:     	pushq	%rbp
14540ee71:     	pushq	%r14
14540ee73:     	pushq	%rsi
14540ee74:     	pushq	%rdi
14540ee75:     	pushq	%rbx
14540ee76:     	subq	$0x90, %rsp
14540ee7d:     	leaq	0x80(%rsp), %rbp
14540ee85:     	movaps	%xmm6, (%rbp)
14540ee89:     	movq	$-0x2, -0x8(%rbp)
14540ee91:     	movaps	%xmm2, %xmm6
14540ee94:     	movss	0x4dc5e4(%rip), %xmm0   # 0x1458eb480
14540ee9c:     	addss	%xmm2, %xmm0
14540eea0:     	sqrtss	%xmm0, %xmm0
14540eea4:     	addss	0x4dc650(%rip), %xmm0   # 0x1458eb4fc
14540eeac:     	mulss	0x4dc678(%rip), %xmm0   # 0x1458eb52c
14540eeb4:     	movq	%rcx, %rsi
14540eeb7:     	movss	%xmm0, -0x2c(%rbp)
14540eebc:     	cmpb	$0x9, 0x75(%rdx)
14540eec0:     	jne	0x14540ef6c <.text+0x540df6c>
14540eec6:     	movl	0x68(%rdx), %eax
14540eec9:     	cmpl	$0x6, %eax
14540eecc:     	je	0x14540f032 <.text+0x540e032>
14540eed2:     	cmpl	$0x7, %eax
14540eed5:     	jne	0x14540ef6c <.text+0x540df6c>
14540eedb:     	leaq	0x130e03f(%rip), %rdi   # 0x14671cf21
14540eee2:     	movl	$0xc, %ebx
14540eee7:     	movl	$0xc, %edx
14540eeec:     	movq	%rdi, %rcx
14540eeef:     	callq	0x145452400 <.text+0x5451400>
14540eef4:     	testq	%rax, %rax
14540eef7:     	cmovneq	%rax, %rdi
14540eefb:     	cmovneq	%rdx, %rbx
14540eeff:     	leaq	-0x2c(%rbp), %rax
14540ef03:     	movq	%rax, -0x28(%rbp)
14540ef07:     	leaq	0x30e3d2(%rip), %rax    # 0x14571d2e0 <.text+0x571c2e0>
14540ef0e:     	movq	%rax, -0x20(%rbp)
14540ef12:     	leaq	0x130dfdc(%rip), %rdx   # 0x14671cef5
14540ef19:     	leaq	-0x48(%rbp), %r14
14540ef1d:     	leaq	-0x28(%rbp), %r8
14540ef21:     	movq	%r14, %rcx
14540ef24:     	callq	0x14570bf80 <.text+0x570af80>
14540ef29:     	leaq	0x130dff0(%rip), %rax   # 0x14671cf20
14540ef30:     	movq	%rax, -0x28(%rbp)
14540ef34:     	movq	$0x1, -0x20(%rbp)
14540ef3c:     	movq	%r14, -0x18(%rbp)
14540ef40:     	leaq	0x130dfb9(%rip), %rax   # 0x14671cf00
14540ef47:     	movq	%rax, -0x10(%rbp)
14540ef4b:     	movq	$0x1, 0x20(%rsp)
14540ef54:     	leaq	-0x28(%rbp), %r9
14540ef58:     	movq	%rsi, %rcx
14540ef5b:     	movq	%rdi, %rdx
14540ef5e:     	movq	%rbx, %r8
14540ef61:     	callq	0x145452790 <.text+0x5451790>
14540ef66:     	nop
14540ef67:     	jmp	0x14540f005 <.text+0x540e005>
14540ef6c:     	leaq	0x130dfba(%rip), %rdi   # 0x14671cf2d
14540ef73:     	movl	$0xc, %ebx
14540ef78:     	movl	$0xc, %edx
14540ef7d:     	movq	%rdi, %rcx
14540ef80:     	callq	0x145452400 <.text+0x5451400>
14540ef85:     	testq	%rax, %rax
14540ef88:     	cmovneq	%rax, %rdi
14540ef8c:     	cmovneq	%rdx, %rbx
14540ef90:     	mulss	0x4dc594(%rip), %xmm6   # 0x1458eb52c
14540ef98:     	movss	%xmm6, -0x4c(%rbp)
14540ef9d:     	leaq	-0x4c(%rbp), %rax
14540efa1:     	movq	%rax, -0x28(%rbp)
14540efa5:     	leaq	0x30e334(%rip), %rax    # 0x14571d2e0 <.text+0x571c2e0>
14540efac:     	movq	%rax, -0x20(%rbp)
14540efb0:     	leaq	0x130df3e(%rip), %rdx   # 0x14671cef5
14540efb7:     	leaq	-0x48(%rbp), %r14
14540efbb:     	leaq	-0x28(%rbp), %r8
14540efbf:     	movq	%r14, %rcx
14540efc2:     	callq	0x14570bf80 <.text+0x570af80>
14540efc7:     	leaq	0x130df52(%rip), %rax   # 0x14671cf20
14540efce:     	movq	%rax, -0x28(%rbp)
14540efd2:     	movq	$0x1, -0x20(%rbp)
14540efda:     	movq	%r14, -0x18(%rbp)
14540efde:     	leaq	0x130df1b(%rip), %rax   # 0x14671cf00
14540efe5:     	movq	%rax, -0x10(%rbp)
14540efe9:     	movq	$0x1, 0x20(%rsp)
14540eff2:     	leaq	-0x28(%rbp), %r9
14540eff6:     	movq	%rsi, %rcx
14540eff9:     	movq	%rdi, %rdx
14540effc:     	movq	%rbx, %r8
14540efff:     	callq	0x145452790 <.text+0x5451790>
14540f004:     	nop
14540f005:     	movq	-0x48(%rbp), %rdx
14540f009:     	testq	%rdx, %rdx
14540f00c:     	je	0x14540f01d <.text+0x540e01d>
14540f00e:     	movq	-0x40(%rbp), %rcx
14540f012:     	movl	$0x1, %r8d
14540f018:     	callq	0x1400021d0 <.text+0x11d0>
14540f01d:     	movq	%rsi, %rax
14540f020:     	movaps	(%rbp), %xmm6
14540f024:     	addq	$0x90, %rsp
14540f02b:     	popq	%rbx
14540f02c:     	popq	%rdi
14540f02d:     	popq	%rsi
14540f02e:     	popq	%r14
14540f030:     	popq	%rbp
14540f031:     	retq
14540f032:     	leaq	0x130deaf(%rip), %rdi   # 0x14671cee8
14540f039:     	movl	$0xd, %ebx
14540f03e:     	movl	$0xd, %edx
14540f043:     	movq	%rdi, %rcx
14540f046:     	callq	0x145452400 <.text+0x5451400>
14540f04b:     	testq	%rax, %rax
14540f04e:     	cmovneq	%rax, %rdi
14540f052:     	cmovneq	%rdx, %rbx
14540f056:     	leaq	-0x2c(%rbp), %rax
14540f05a:     	movq	%rax, -0x28(%rbp)
14540f05e:     	leaq	0x30e27b(%rip), %rax    # 0x14571d2e0 <.text+0x571c2e0>
14540f065:     	movq	%rax, -0x20(%rbp)
14540f069:     	leaq	0x130de85(%rip), %rdx   # 0x14671cef5
14540f070:     	leaq	-0x48(%rbp), %r14
14540f074:     	leaq	-0x28(%rbp), %r8
14540f078:     	movq	%r14, %rcx
14540f07b:     	callq	0x14570bf80 <.text+0x570af80>
14540f080:     	leaq	0x130de99(%rip), %rax   # 0x14671cf20
14540f087:     	movq	%rax, -0x28(%rbp)
14540f08b:     	movq	$0x1, -0x20(%rbp)
14540f093:     	movq	%r14, -0x18(%rbp)
14540f097:     	leaq	0x130de62(%rip), %rax   # 0x14671cf00
14540f09e:     	movq	%rax, -0x10(%rbp)
14540f0a2:     	movq	$0x1, 0x20(%rsp)
14540f0ab:     	leaq	-0x28(%rbp), %r9
14540f0af:     	movq	%rsi, %rcx
14540f0b2:     	movq	%rdi, %rdx
14540f0b5:     	movq	%rbx, %r8
14540f0b8:     	callq	0x145452790 <.text+0x5451790>
14540f0bd:     	nop
14540f0be:     	jmp	0x14540f005 <.text+0x540e005>
