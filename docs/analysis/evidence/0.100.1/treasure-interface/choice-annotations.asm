
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454eeb90:     	pushq	%rbp
1454eeb91:     	pushq	%r15
1454eeb93:     	pushq	%r14
1454eeb95:     	pushq	%r13
1454eeb97:     	pushq	%r12
1454eeb99:     	pushq	%rsi
1454eeb9a:     	pushq	%rdi
1454eeb9b:     	pushq	%rbx
1454eeb9c:     	subq	$0x1f8, %rsp            # imm = 0x1F8
1454eeba3:     	leaq	0x80(%rsp), %rbp
1454eebab:     	movq	$-0x2, 0x170(%rbp)
1454eebb6:     	movq	%r9, 0x28(%rbp)
1454eebba:     	movq	%r8, 0x20(%rbp)
1454eebbe:     	movq	%rdx, %r12
1454eebc1:     	movq	%rcx, 0x30(%rbp)
1454eebc5:     	callq	0x140002200 <.text+0x1200>
1454eebca:     	movl	$0x1, %ecx
1454eebcf:     	movl	$0x1, %edx
1454eebd4:     	callq	0x1400021c0 <.text+0x11c0>
1454eebd9:     	testq	%rax, %rax
1454eebdc:     	je	0x1454efd85 <.text+0x54eed85>
1454eebe2:     	movq	%rax, 0xc0(%rbp)
1454eebe9:     	movb	$0x5b, (%rax)
1454eebec:     	movq	0x588(%r12), %r13
1454eebf4:     	movq	0x590(%r12), %rax
1454eebfc:     	leaq	(%rax,%rax,4), %rax
1454eec00:     	shlq	$0x5, %rax
1454eec04:     	addq	%r13, %rax
1454eec07:     	movq	%rax, -0x40(%rbp)
1454eec0b:     	leaq	0x320(%r12), %rax
1454eec13:     	movq	%rax, -0x18(%rbp)
1454eec17:     	movq	0x320(%r12), %rax
1454eec1f:     	movq	%rax, -0x38(%rbp)
1454eec23:     	movq	0x330(%r12), %rax
1454eec2b:     	movq	%rax, 0x58(%rbp)
1454eec2f:     	movq	0x328(%r12), %rax
1454eec37:     	movq	%rax, 0x10(%rbp)
1454eec3b:     	movq	0x340(%r12), %rax
1454eec43:     	movq	%rax, -0x28(%rbp)
1454eec47:     	movq	0x348(%r12), %rax
1454eec4f:     	movq	%rax, -0x20(%rbp)
1454eec53:     	movq	0x368(%r12), %rax
1454eec5b:     	movq	%rax, -0x10(%rbp)
1454eec5f:     	movq	0x370(%r12), %rax
1454eec67:     	movq	%rax, -0x8(%rbp)
1454eec6b:     	movq	0x2d0(%r12), %rcx
1454eec73:     	leaq	(,%rcx,8), %rax
1454eec7b:     	leaq	(%rax,%rax,2), %rax
1454eec7f:     	movq	%rax, -0x48(%rbp)
1454eec83:     	movq	%rcx, 0x70(%rbp)
1454eec87:     	andq	$-0x2, %rcx
1454eec8b:     	movq	%rcx, 0x18(%rbp)
1454eec8f:     	movb	$0x1, %bl
1454eec91:     	movl	0x378(%r12), %eax
1454eec99:     	movl	%eax, 0x68(%rbp)
1454eec9c:     	movl	0x388(%r12), %eax
1454eeca4:     	movq	%rax, (%rbp)
1454eeca8:     	incl	%eax
1454eecaa:     	movl	%eax, 0x6c(%rbp)
1454eecad:     	movq	0x2c8(%r12), %rax
1454eecb5:     	movq	%rax, 0xa8(%rbp)
1454eecbc:     	movq	0x2b0(%r12), %rax
1454eecc4:     	movq	%rax, 0x8(%rbp)
1454eecc8:     	movq	0x2b8(%r12), %rax
1454eecd0:     	movq	%rax, -0x30(%rbp)
1454eecd4:     	movl	0x9a0(%r12), %eax
1454eecdc:     	movl	%eax, 0xbc(%rbp)
1454eece2:     	leaq	0x159(%rbp), %r15
1454eece9:     	movabsq	$-0x8000000000000000, %rdi # imm = 0x8000000000000000
1454eecf3:     	movl	$0x1, %r14d
1454eecf9:     	movl	$0x1, %eax
1454eecfe:     	movq	%rax, 0xd8(%rbp)
1454eed05:     	movq	%r12, 0xb0(%rbp)
1454eed0c:     	jmp	0x1454eed17 <.text+0x54edd17>
1454eed0e:     	nop
1454eed10:     	addq	$0xa0, %r13
1454eed17:     	cmpq	-0x40(%rbp), %r13
1454eed1b:     	je	0x1454ef8ae <.text+0x54ee8ae>
1454eed21:     	movq	%r14, %rsi
1454eed24:     	callq	0x140002200 <.text+0x1200>
1454eed29:     	movl	$0x1, %ecx
1454eed2e:     	movl	$0x1, %edx
1454eed33:     	callq	0x1400021c0 <.text+0x11c0>
1454eed38:     	testq	%rax, %rax
1454eed3b:     	je	0x1454efd6c <.text+0x54eed6c>
1454eed41:     	movq	%rax, 0x130(%rbp)
1454eed48:     	movb	$0x7b, (%rax)
1454eed4b:     	movq	0x78(%r13), %rcx
1454eed4f:     	movq	%rcx, %rax
1454eed52:     	xorq	%rdi, %rax
1454eed55:     	testq	%rcx, %rcx
1454eed58:     	movl	$0x1, %edi
1454eed5d:     	cmovnsq	%rdi, %rax
1454eed61:     	movb	$0x1, %r14b
1454eed64:     	cmpq	$0x1, %rax
1454eed68:     	je	0x1454ef0e0 <.text+0x54ee0e0>
1454eed6e:     	cmpq	$0x2, %rax
1454eed72:     	je	0x1454eefe0 <.text+0x54edfe0>
1454eed78:     	cmpq	$0x3, %rax
1454eed7c:     	jne	0x1454ef180 <.text+0x54ee180>
1454eed82:     	cmpq	$-0x1, -0x38(%rbp)
1454eed87:     	je	0x1454ef180 <.text+0x54ee180>
1454eed8d:     	movq	0x80(%r13), %rax
1454eed94:     	movq	0x58(%rbp), %rcx
1454eed98:     	cmpq	0x10(%rax), %rcx
1454eed9c:     	jne	0x1454eedb7 <.text+0x54eddb7>
1454eed9e:     	movq	0x8(%rax), %rdx
1454eeda2:     	movq	0x10(%rbp), %rcx
1454eeda6:     	movq	0x58(%rbp), %r8
1454eedaa:     	callq	0x1457731e7 <.text+0x57721e7>
1454eedaf:     	testl	%eax, %eax
1454eedb1:     	je	0x1454ef7e6 <.text+0x54ee7e6>
1454eedb7:     	movq	$0x1, 0x140(%rbp)
1454eedc2:     	movq	0x130(%rbp), %rax
1454eedc9:     	movq	%rax, 0x148(%rbp)
1454eedd0:     	movq	$0x1, 0x150(%rbp)
1454eeddb:     	movb	$0x1, 0x158(%rbp)
1454eede2:     	movq	%rax, 0xf8(%rbp)
1454eede9:     	movq	$0x1, 0xf0(%rbp)
1454eedf4:     	movb	$0x0, 0x16e(%rbp)
1454eedfb:     	movb	$0x1, 0x16d(%rbp)
1454eee02:     	movq	-0x20(%rbp), %rax
1454eee06:     	movq	%rax, 0x28(%rsp)
1454eee0b:     	movq	-0x28(%rbp), %rax
1454eee0f:     	movq	%rax, 0x20(%rsp)
1454eee14:     	movl	$0x8, %r9d
1454eee1a:     	leaq	0x100(%rbp), %rcx
1454eee21:     	leaq	0x140(%rbp), %rdx
1454eee28:     	leaq	0x150907f(%rip), %r8    # 0x1469f7eae
1454eee2f:     	callq	0x145456ed0 <.text+0x5455ed0>
1454eee34:     	nop
1454eee35:     	movb	%bl, 0xe8(%rbp)
1454eee3b:     	leaq	0x38(%rbp), %rcx
1454eee3f:     	movq	-0x18(%rbp), %rdx
1454eee43:     	callq	0x145425910 <.text+0x5424910>
1454eee48:     	nop
1454eee49:     	movq	0x40(%rbp), %rdx
1454eee4d:     	movq	0x48(%rbp), %rbx
1454eee51:     	movq	$0x1, 0x20(%rsp)
1454eee5a:     	leaq	0x140(%rbp), %r14
1454eee61:     	movq	%r14, %rcx
1454eee64:     	movq	%rdx, 0xc8(%rbp)
1454eee6b:     	movq	%rbx, %r8
1454eee6e:     	leaq	0x1509041(%rip), %r9    # 0x1469f7eb6
1454eee75:     	callq	0x14546ac40 <.text+0x5469c40>
1454eee7a:     	nop
1454eee7b:     	leaq	0x100(%rbp), %rdi
1454eee82:     	movq	0x140(%rbp), %rax
1454eee89:     	movq	%rax, 0x78(%rbp)
1454eee8d:     	movq	0x148(%rbp), %rcx
1454eee94:     	movq	0x150(%rbp), %rax
1454eee9b:     	movq	%rax, 0x28(%rsp)
1454eeea0:     	movq	%rcx, 0x60(%rbp)
1454eeea4:     	movq	%rcx, 0x20(%rsp)
1454eeea9:     	movl	$0xc, %r9d
1454eeeaf:     	movq	%r14, %rcx
1454eeeb2:     	movq	%rdi, %rdx
1454eeeb5:     	leaq	0x1508ffb(%rip), %r8    # 0x1469f7eb7
1454eeebc:     	callq	0x145456ed0 <.text+0x5455ed0>
1454eeec1:     	nop
1454eeec2:     	movq	-0x8(%rbp), %rax
1454eeec6:     	movq	%rax, 0x28(%rsp)
1454eeecb:     	movq	-0x10(%rbp), %rax
1454eeecf:     	movq	%rax, 0x20(%rsp)
1454eeed4:     	movl	$0xc, %r9d
1454eeeda:     	movq	%rdi, %rcx
1454eeedd:     	movq	%r14, %rdx
1454eeee0:     	leaq	0x1508fdc(%rip), %r8    # 0x1469f7ec3
1454eeee7:     	callq	0x145456ed0 <.text+0x5455ed0>
1454eeeec:     	nop
1454eeeed:     	movl	0x68(%rbp), %eax
1454eeef0:     	movl	%eax, 0x20(%rsp)
1454eeef4:     	movl	$0xe, %r9d
1454eeefa:     	movq	%r14, %rcx
1454eeefd:     	movq	%rdi, %rdx
1454eef00:     	leaq	0x1508fc8(%rip), %r8    # 0x1469f7ecf
1454eef07:     	callq	0x145454010 <.text+0x5453010>
1454eef0c:     	nop
1454eef0d:     	movq	(%rbp), %rax
1454eef11:     	movl	%eax, 0x20(%rsp)
1454eef15:     	movl	$0xc, %r9d
1454eef1b:     	leaq	0x80(%rbp), %rcx
1454eef22:     	movq	%r14, %rdx
1454eef25:     	leaq	0x1508fb1(%rip), %r8    # 0x1469f7edd
1454eef2c:     	callq	0x145454010 <.text+0x5453010>
1454eef31:     	nop
1454eef32:     	movq	0x80(%rbp), %rax
1454eef39:     	movq	%rax, 0xe0(%rbp)
1454eef40:     	movq	0x88(%rbp), %rax
1454eef47:     	movq	%rax, 0x130(%rbp)
1454eef4e:     	movq	0x90(%rbp), %rdi
1454eef55:     	movzbl	0x98(%rbp), %r14d
1454eef5d:     	leaq	0x99(%rbp), %rcx
1454eef64:     	movl	(%rcx), %eax
1454eef66:     	movl	0x3(%rcx), %ecx
1454eef69:     	movl	%eax, 0x128(%rbp)
1454eef6f:     	movl	%ecx, 0x12b(%rbp)
1454eef75:     	movq	0x78(%rbp), %rdx
1454eef79:     	testq	%rdx, %rdx
1454eef7c:     	je	0x1454eef8d <.text+0x54edf8d>
1454eef7e:     	movl	$0x1, %r8d
1454eef84:     	movq	0x60(%rbp), %rcx
1454eef88:     	callq	0x1400021d0 <.text+0x11d0>
1454eef8d:     	testq	%rbx, %rbx
1454eef90:     	je	0x1454ef194 <.text+0x54ee194>
1454eef96:     	movq	0xc8(%rbp), %rax
1454eef9d:     	leaq	0x8(%rax), %r12
1454eefa1:     	jmp	0x1454eefbd <.text+0x54edfbd>
1454eefa3:     	nopw	%cs:(%rax,%rax)
1454eefb0:     	addq	$0x18, %r12
1454eefb4:     	decq	%rbx
1454eefb7:     	je	0x1454ef194 <.text+0x54ee194>
1454eefbd:     	movq	-0x8(%r12), %rdx
1454eefc2:     	testq	%rdx, %rdx
1454eefc5:     	je	0x1454eefb0 <.text+0x54edfb0>
1454eefc7:     	movq	(%r12), %rcx
1454eefcb:     	movl	$0x1, %r8d
1454eefd1:     	callq	0x1400021d0 <.text+0x11d0>
1454eefd6:     	jmp	0x1454eefb0 <.text+0x54edfb0>
1454eefd8:     	nopl	(%rax,%rax)
1454eefe0:     	cmpq	$0x0, 0x70(%rbp)
1454eefe5:     	je	0x1454ef216 <.text+0x54ee216>
1454eefeb:     	movb	%bl, 0xe8(%rbp)
1454eeff1:     	movq	0x80(%r13), %rdi
1454eeff8:     	movq	(%rdi), %rbx
1454eeffb:     	movq	0x8(%rdi), %r12
1454eefff:     	xorl	%r14d, %r14d
1454ef002:     	jmp	0x1454ef01e <.text+0x54ee01e>
1454ef004:     	nopw	%cs:(%rax,%rax)
1454ef010:     	addq	$0x18, %r14
1454ef014:     	cmpq	%r14, -0x48(%rbp)
1454ef018:     	je	0x1454ef1ef <.text+0x54ee1ef>
1454ef01e:     	movq	0xa8(%rbp), %rax
1454ef025:     	movq	(%rax,%r14), %rax
1454ef029:     	cmpq	%r12, 0x8(%rax)
1454ef02d:     	jne	0x1454ef010 <.text+0x54ee010>
1454ef02f:     	movq	(%rax), %rcx
1454ef032:     	movq	%rbx, %rdx
1454ef035:     	movq	%r12, %r8
1454ef038:     	callq	0x1457731e7 <.text+0x57721e7>
1454ef03d:     	testl	%eax, %eax
1454ef03f:     	jne	0x1454ef010 <.text+0x54ee010>
1454ef041:     	movq	$0x1, 0x140(%rbp)
1454ef04c:     	movq	0x130(%rbp), %rcx
1454ef053:     	movq	%rcx, 0x148(%rbp)
1454ef05a:     	movq	$0x1, 0x150(%rbp)
1454ef065:     	movb	$0x1, 0x158(%rbp)
1454ef06c:     	movq	0xa8(%rbp), %rax
1454ef073:     	movl	0x14(%rax,%r14), %eax
1454ef078:     	incl	%eax
1454ef07a:     	movq	%rcx, 0xf8(%rbp)
1454ef081:     	movq	$0x1, 0xf0(%rbp)
1454ef08c:     	movb	$0x0, 0x16e(%rbp)
1454ef093:     	movb	$0x1, 0x16d(%rbp)
1454ef09a:     	movl	%eax, 0x20(%rsp)
1454ef09e:     	movl	$0x4, %r9d
1454ef0a4:     	leaq	0x100(%rbp), %rcx
1454ef0ab:     	leaq	0x140(%rbp), %rdx
1454ef0b2:     	leaq	0x15079f8(%rip), %r8    # 0x1469f6ab1
1454ef0b9:     	callq	0x145454010 <.text+0x5453010>
1454ef0be:     	nop
1454ef0bf:     	movq	0xb0(%rbp), %r12
1454ef0c6:     	movb	0xe8(%rbp), %bl
1454ef0cc:     	jmp	0x1454ef2fb <.text+0x54ee2fb>
1454ef0d1:     	nopw	%cs:(%rax,%rax)
1454ef0e0:     	movq	0x90(%r13), %rax
1454ef0e7:     	cmpq	-0x30(%rbp), %rax
1454ef0eb:     	jae	0x1454ef180 <.text+0x54ee180>
1454ef0f1:     	imulq	$0x58, %rax, %rax
1454ef0f5:     	movq	$0x1, 0x140(%rbp)
1454ef100:     	movq	0x130(%rbp), %rdx
1454ef107:     	movq	%rdx, 0x148(%rbp)
1454ef10e:     	movq	$0x1, 0x150(%rbp)
1454ef119:     	movb	$0x1, 0x158(%rbp)
1454ef120:     	movq	0x8(%rbp), %rcx
1454ef124:     	movl	0x8(%rcx,%rax), %eax
1454ef128:     	incl	%eax
1454ef12a:     	movq	%rdx, 0xf8(%rbp)
1454ef131:     	movq	$0x1, 0xf0(%rbp)
1454ef13c:     	movb	$0x0, 0x16e(%rbp)
1454ef143:     	movb	$0x1, 0x16d(%rbp)
1454ef14a:     	movl	%eax, 0x20(%rsp)
1454ef14e:     	movl	$0x4, %r9d
1454ef154:     	leaq	0x100(%rbp), %rcx
1454ef15b:     	leaq	0x140(%rbp), %rdx
1454ef162:     	leaq	0x1507948(%rip), %r8    # 0x1469f6ab1
1454ef169:     	callq	0x145454010 <.text+0x5453010>
1454ef16e:     	nop
1454ef16f:     	jmp	0x1454ef2fb <.text+0x54ee2fb>
1454ef174:     	nopw	%cs:(%rax,%rax)
1454ef180:     	movl	$0x1, %edx
1454ef185:     	cmpl	$0x0, 0xbc(%rbp)
1454ef18c:     	jne	0x1454ef344 <.text+0x54ee344>
1454ef192:     	jmp	0x1454ef1e0 <.text+0x54ee1e0>
1454ef194:     	movq	0x38(%rbp), %rax
1454ef198:     	testq	%rax, %rax
1454ef19b:     	je	0x1454ef1b7 <.text+0x54ee1b7>
1454ef19d:     	shlq	$0x3, %rax
1454ef1a1:     	leaq	(%rax,%rax,2), %rdx
1454ef1a5:     	movl	$0x8, %r8d
1454ef1ab:     	movq	0xc8(%rbp), %rcx
1454ef1b2:     	callq	0x1400021d0 <.text+0x11d0>
1454ef1b7:     	movq	0xb0(%rbp), %r12
1454ef1be:     	movzbl	0xe8(%rbp), %ebx
1454ef1c5:     	movq	0xe0(%rbp), %rdx
1454ef1cc:     	cmpl	$0x0, 0xbc(%rbp)
1454ef1d3:     	jne	0x1454ef344 <.text+0x54ee344>
1454ef1d9:     	nopl	(%rax)
1454ef1e0:     	movq	0x130(%rbp), %r8
1454ef1e7:     	movq	%rdx, %r9
1454ef1ea:     	jmp	0x1454ef47e <.text+0x54ee47e>
1454ef1ef:     	movzbl	0x45(%rdi), %r14d
1454ef1f4:     	cmpq	$0x1, 0x70(%rbp)
1454ef1f9:     	leaq	0x100(%rbp), %rcx
1454ef200:     	jne	0x1454ef221 <.text+0x54ee221>
1454ef202:     	xorl	%edx, %edx
1454ef204:     	xorl	%eax, %eax
1454ef206:     	movq	0xb0(%rbp), %r12
1454ef20d:     	movzbl	0xe8(%rbp), %ebx
1454ef214:     	jmp	0x1454ef274 <.text+0x54ee274>
1454ef216:     	xorl	%eax, %eax
1454ef218:     	leaq	0x100(%rbp), %rcx
1454ef21f:     	jmp	0x1454ef292 <.text+0x54ee292>
1454ef221:     	movq	0xa8(%rbp), %r8
1454ef228:     	xorl	%edx, %edx
1454ef22a:     	xorl	%eax, %eax
1454ef22c:     	movq	0xb0(%rbp), %r12
1454ef233:     	movzbl	0xe8(%rbp), %ebx
1454ef23a:     	movq	0x18(%rbp), %rdi
1454ef23e:     	nop
1454ef240:     	movq	(%r8), %r9
1454ef243:     	movq	0x18(%r8), %r10
1454ef247:     	xorl	%r11d, %r11d
1454ef24a:     	cmpb	%r14b, 0x45(%r9)
1454ef24e:     	sete	%r11b
1454ef252:     	addq	%rax, %r11
1454ef255:     	xorl	%eax, %eax
1454ef257:     	cmpb	%r14b, 0x45(%r10)
1454ef25b:     	sete	%al
1454ef25e:     	addq	%r11, %rax
1454ef261:     	addq	$0x2, %rdx
1454ef265:     	addq	$0x30, %r8
1454ef269:     	cmpq	%rdx, %rdi
1454ef26c:     	jne	0x1454ef240 <.text+0x54ee240>
1454ef26e:     	testb	$0x1, 0x70(%rbp)
1454ef272:     	je	0x1454ef292 <.text+0x54ee292>
1454ef274:     	movq	%rax, %r8
1454ef277:     	leaq	(%rdx,%rdx,2), %rax
1454ef27b:     	movq	0xa8(%rbp), %rdx
1454ef282:     	movq	(%rdx,%rax,8), %rdx
1454ef286:     	xorl	%eax, %eax
1454ef288:     	cmpb	%r14b, 0x45(%rdx)
1454ef28c:     	sete	%al
1454ef28f:     	addq	%r8, %rax
1454ef292:     	movq	$0x1, 0x140(%rbp)
1454ef29d:     	movq	0x130(%rbp), %rdx
1454ef2a4:     	movq	%rdx, 0x148(%rbp)
1454ef2ab:     	movq	$0x1, 0x150(%rbp)
1454ef2b6:     	movb	$0x1, 0x158(%rbp)
1454ef2bd:     	movq	%rdx, 0xf8(%rbp)
1454ef2c4:     	movq	$0x1, 0xf0(%rbp)
1454ef2cf:     	movb	$0x0, 0x16e(%rbp)
1454ef2d6:     	movb	$0x1, 0x16d(%rbp)
1454ef2dd:     	movl	%eax, 0x20(%rsp)
1454ef2e1:     	movl	$0x4, %r9d
1454ef2e7:     	leaq	0x140(%rbp), %rdx
1454ef2ee:     	leaq	0x1508bb5(%rip), %r8    # 0x1469f7eaa
1454ef2f5:     	callq	0x145454010 <.text+0x5453010>
1454ef2fa:     	nop
1454ef2fb:     	movq	0x100(%rbp), %rdx
1454ef302:     	movq	0x108(%rbp), %rax
1454ef309:     	movq	%rax, 0x130(%rbp)
1454ef310:     	movq	0x110(%rbp), %rdi
1454ef317:     	movzbl	0x118(%rbp), %r14d
1454ef31f:     	leaq	0x119(%rbp), %rcx
1454ef326:     	movl	(%rcx), %eax
1454ef328:     	movl	0x3(%rcx), %ecx
1454ef32b:     	movl	%eax, 0x128(%rbp)
1454ef331:     	movl	%ecx, 0x12b(%rbp)
1454ef337:     	cmpl	$0x0, 0xbc(%rbp)
1454ef33e:     	je	0x1454ef1e0 <.text+0x54ee1e0>
1454ef344:     	movq	0x130(%rbp), %rax
1454ef34b:     	movq	%rax, 0xf8(%rbp)
1454ef352:     	movq	%rdx, 0xe0(%rbp)
1454ef359:     	movq	%rdx, 0xf0(%rbp)
1454ef360:     	movb	$0x1, 0x16e(%rbp)
1454ef367:     	movb	$0x1, 0x16d(%rbp)
1454ef36e:     	leaq	0x140(%rbp), %rcx
1454ef375:     	movq	%r12, %rdx
1454ef378:     	movq	%r13, %r8
1454ef37b:     	callq	0x1454ec580 <.text+0x54eb580>
1454ef380:     	nop
1454ef381:     	movq	0x140(%rbp), %rdx
1454ef388:     	cmpq	$-0x1, %rdx
1454ef38c:     	je	0x1454ef470 <.text+0x54ee470>
1454ef392:     	testq	%rdx, %rdx
1454ef395:     	je	0x1454ef3a9 <.text+0x54ee3a9>
1454ef397:     	movq	0x148(%rbp), %rcx
1454ef39e:     	movl	$0x1, %r8d
1454ef3a4:     	callq	0x1400021d0 <.text+0x11d0>
1454ef3a9:     	movq	0xe0(%rbp), %rax
1454ef3b0:     	movq	%rax, 0x140(%rbp)
1454ef3b7:     	movq	0x130(%rbp), %rax
1454ef3be:     	movq	%rax, 0x148(%rbp)
1454ef3c5:     	movq	%rdi, 0x150(%rbp)
1454ef3cc:     	movb	%r14b, 0x158(%rbp)
1454ef3d3:     	movl	0x128(%rbp), %eax
1454ef3d9:     	movl	0x12b(%rbp), %ecx
1454ef3df:     	movl	%ecx, 0x3(%r15)
1454ef3e3:     	movl	%eax, (%r15)
1454ef3e6:     	movl	$0x6, %r8d
1454ef3ec:     	leaq	0x140(%rbp), %rdi
1454ef3f3:     	movq	%rdi, %rcx
1454ef3f6:     	leaq	0x1508aec(%rip), %rdx   # 0x1469f7ee9
1454ef3fd:     	callq	0x145456c20 <.text+0x5455c20>
1454ef402:     	nop
1454ef403:     	movq	0x140(%rbp), %rax
1454ef40a:     	movq	0x150(%rbp), %rdx
1454ef411:     	subq	%rdx, %rax
1454ef414:     	cmpq	$0x3, %rax
1454ef418:     	jbe	0x1454ef884 <.text+0x54ee884>
1454ef41e:     	movq	0x148(%rbp), %rax
1454ef425:     	movl	$0x65757274, (%rax,%rdx) # imm = 0x65757274
1454ef42c:     	movq	0x150(%rbp), %rdi
1454ef433:     	addq	$0x4, %rdi
1454ef437:     	movq	%rdi, 0x150(%rbp)
1454ef43e:     	movq	0x140(%rbp), %r9
1454ef445:     	movq	0x148(%rbp), %r8
1454ef44c:     	movzbl	0x158(%rbp), %r14d
1454ef454:     	movl	(%r15), %eax
1454ef457:     	movl	0x3(%r15), %ecx
1454ef45b:     	movl	%eax, 0x128(%rbp)
1454ef461:     	movl	%ecx, 0x12b(%rbp)
1454ef467:     	jmp	0x1454ef47e <.text+0x54ee47e>
1454ef469:     	nopl	(%rax)
1454ef470:     	movq	0x130(%rbp), %r8
1454ef477:     	movq	0xe0(%rbp), %r9
1454ef47e:     	movq	0xd8(%rbp), %rax
1454ef485:     	movq	%rax, 0x80(%rbp)
1454ef48c:     	movq	0xc0(%rbp), %rax
1454ef493:     	movq	%rax, 0x88(%rbp)
1454ef49a:     	movq	%rsi, 0x90(%rbp)
1454ef4a1:     	movb	%bl, 0x98(%rbp)
1454ef4a7:     	movl	0xd0(%rbp), %eax
1454ef4ad:     	movl	0xd3(%rbp), %ecx
1454ef4b3:     	leaq	0x99(%rbp), %rdx
1454ef4ba:     	movl	%ecx, 0x3(%rdx)
1454ef4bd:     	movl	%eax, (%rdx)
1454ef4bf:     	movq	%r9, 0xe0(%rbp)
1454ef4c6:     	movq	%r9, 0x140(%rbp)
1454ef4cd:     	movq	%r8, 0x130(%rbp)
1454ef4d4:     	movq	%r8, 0x148(%rbp)
1454ef4db:     	movq	%rdi, 0x150(%rbp)
1454ef4e2:     	movb	%r14b, 0x158(%rbp)
1454ef4e9:     	movl	0x128(%rbp), %eax
1454ef4ef:     	movl	0x12b(%rbp), %ecx
1454ef4f5:     	movl	%ecx, 0x3(%r15)
1454ef4f9:     	movl	%eax, (%r15)
1454ef4fc:     	movups	0x8(%r13), %xmm0
1454ef501:     	movups	%xmm0, 0x20(%rsp)
1454ef506:     	movl	$0x5, %r9d
1454ef50c:     	leaq	0x100(%rbp), %rsi
1454ef513:     	movq	%rsi, %rcx
1454ef516:     	leaq	0x140(%rbp), %r14
1454ef51d:     	movq	%r14, %rdx
1454ef520:     	leaq	0x15089c8(%rip), %r8    # 0x1469f7eef
1454ef527:     	callq	0x145456ed0 <.text+0x5455ed0>
1454ef52c:     	nop
1454ef52d:     	movups	0x50(%r13), %xmm0
1454ef532:     	movups	%xmm0, 0x20(%rsp)
1454ef537:     	movl	$0x4, %r9d
1454ef53d:     	movq	%r14, %rcx
1454ef540:     	movq	%rsi, %rdx
1454ef543:     	leaq	0x150755f(%rip), %r8    # 0x1469f6aa9
1454ef54a:     	callq	0x145456ed0 <.text+0x5455ed0>
1454ef54f:     	nop
1454ef550:     	movq	0x68(%r13), %rdx
1454ef554:     	movq	0x70(%r13), %r8
1454ef558:     	movq	$0x1, 0x20(%rsp)
1454ef561:     	movq	%rsi, %rcx
1454ef564:     	leaq	0x150894b(%rip), %r9    # 0x1469f7eb6
1454ef56b:     	callq	0x14546ac40 <.text+0x5469c40>
1454ef570:     	nop
1454ef571:     	movabsq	$-0x8000000000000000, %rdi # imm = 0x8000000000000000
1454ef57b:     	movq	0x100(%rbp), %rax
1454ef582:     	movq	%rax, 0xe8(%rbp)
1454ef589:     	movq	0x108(%rbp), %rcx
1454ef590:     	movq	0x110(%rbp), %rax
1454ef597:     	movb	$0x1, 0x16c(%rbp)
1454ef59e:     	movq	%rax, 0x28(%rsp)
1454ef5a3:     	movq	%rcx, 0xc8(%rbp)
1454ef5aa:     	movq	%rcx, 0x20(%rsp)
1454ef5af:     	movl	$0x5, %r9d
1454ef5b5:     	movq	%rsi, %rcx
1454ef5b8:     	movq	%r14, %rdx
1454ef5bb:     	leaq	0x15074c0(%rip), %r8    # 0x1469f6a82
1454ef5c2:     	callq	0x145456ed0 <.text+0x5455ed0>
1454ef5c7:     	nop
1454ef5c8:     	movups	0x20(%r13), %xmm0
1454ef5cd:     	movb	$0x1, 0x16c(%rbp)
1454ef5d4:     	movups	%xmm0, 0x20(%rsp)
1454ef5d9:     	movl	$0x4, %r9d
1454ef5df:     	movq	%r14, %rcx
1454ef5e2:     	movq	%rsi, %rdx
1454ef5e5:     	leaq	0x15074e0(%rip), %r8    # 0x1469f6acc
1454ef5ec:     	callq	0x145456ed0 <.text+0x5455ed0>
1454ef5f1:     	nop
1454ef5f2:     	movups	0x38(%r13), %xmm0
1454ef5f7:     	movb	$0x1, 0x16c(%rbp)
1454ef5fe:     	movups	%xmm0, 0x20(%rsp)
1454ef603:     	movl	$0x4, %r9d
1454ef609:     	movq	%rsi, %rcx
1454ef60c:     	movq	%r14, %rdx
1454ef60f:     	leaq	0x1507497(%rip), %r8    # 0x1469f6aad
1454ef616:     	callq	0x145456ed0 <.text+0x5455ed0>
1454ef61b:     	nop
1454ef61c:     	movl	0x98(%r13), %eax
1454ef623:     	movb	$0x1, 0x16c(%rbp)
1454ef62a:     	movl	%eax, 0x20(%rsp)
1454ef62e:     	movl	$0x6, %r9d
1454ef634:     	movq	%r14, %rcx
1454ef637:     	movq	%rsi, %rdx
1454ef63a:     	leaq	0x1507485(%rip), %r8    # 0x1469f6ac6
1454ef641:     	callq	0x145454010 <.text+0x5453010>
1454ef646:     	nop
1454ef647:     	movq	0x98(%r13), %rcx
1454ef64e:     	movb	$0x1, 0x13f(%rbp)
1454ef655:     	callq	0x14546dbf0 <.text+0x546cbf0>
1454ef65a:     	nop
1454ef65b:     	movb	$0x0, 0x13f(%rbp)
1454ef662:     	movq	%rdx, 0x28(%rsp)
1454ef667:     	movq	%rax, 0x20(%rsp)
1454ef66c:     	movl	$0xa, %r9d
1454ef672:     	movq	%rsi, %rcx
1454ef675:     	movq	%r14, %rdx
1454ef678:     	leaq	0x1508875(%rip), %r8    # 0x1469f7ef4
1454ef67f:     	callq	0x145456ed0 <.text+0x5455ed0>
1454ef684:     	nop
1454ef685:     	movq	0x78(%r13), %rax
1454ef689:     	movq	%rax, %rcx
1454ef68c:     	xorq	%rdi, %rcx
1454ef68f:     	testq	%rax, %rax
1454ef692:     	movl	$0x1, %eax
1454ef697:     	cmovnsq	%rax, %rcx
1454ef69b:     	leaq	0x1509206(%rip), %rdx   # 0x1469f88a8
1454ef6a2:     	movslq	(%rdx,%rcx,4), %rax
1454ef6a6:     	addq	%rdx, %rax
1454ef6a9:     	jmpq	*%rax
1454ef6ab:     	movl	$0x3, %eax
1454ef6b0:     	leaq	0x1508847(%rip), %rcx   # 0x1469f7efe
1454ef6b7:     	jmp	0x1454ef710 <.text+0x54ee710>
1454ef6b9:     	movl	$0x4, %eax
1454ef6be:     	leaq	0x1507439(%rip), %rcx   # 0x1469f6afe
1454ef6c5:     	jmp	0x1454ef710 <.text+0x54ee710>
1454ef6c7:     	movq	0x80(%r13), %rax
1454ef6ce:     	movzbl	0x45(%rax), %ecx
1454ef6d2:     	leaq	(%rcx,%rcx,2), %rax
1454ef6d6:     	addq	$0x4, %rax
1454ef6da:     	testq	%rcx, %rcx
1454ef6dd:     	leaq	0x15074ca(%rip), %rcx   # 0x1469f6bae
1454ef6e4:     	leaq	0x15074c7(%rip), %rdx   # 0x1469f6bb2
1454ef6eb:     	cmovneq	%rdx, %rcx
1454ef6ef:     	jmp	0x1454ef710 <.text+0x54ee710>
1454ef6f1:     	movl	$0x6, %eax
1454ef6f6:     	leaq	0x15073c3(%rip), %rcx   # 0x1469f6ac0
1454ef6fd:     	jmp	0x1454ef710 <.text+0x54ee710>
1454ef6ff:     	movl	$0x7, %eax
1454ef704:     	leaq	0x15087f6(%rip), %rcx   # 0x1469f7f01
1454ef70b:     	nopl	(%rax,%rax)
1454ef710:     	movb	$0x1, 0x16c(%rbp)
1454ef717:     	movq	%rax, 0x28(%rsp)
1454ef71c:     	movq	%rcx, 0x20(%rsp)
1454ef721:     	movl	$0x4, %r9d
1454ef727:     	movq	%r14, %rcx
1454ef72a:     	movq	%rsi, %rdx
1454ef72d:     	leaq	0x15087d4(%rip), %r8    # 0x1469f7f08
1454ef734:     	callq	0x145456ed0 <.text+0x5455ed0>
1454ef739:     	nop
1454ef73a:     	movq	0x150(%rbp), %rbx
1454ef741:     	cmpq	%rbx, 0x140(%rbp)
1454ef748:     	je	0x1454ef85e <.text+0x54ee85e>
1454ef74e:     	movq	0x148(%rbp), %rax
1454ef755:     	movb	$0x7d, (%rax,%rbx)
1454ef759:     	incq	%rbx
1454ef75c:     	movq	%rbx, 0x110(%rbp)
1454ef763:     	movups	0x140(%rbp), %xmm0
1454ef76a:     	movaps	%xmm0, 0x100(%rbp)
1454ef771:     	movb	$0x0, 0x16c(%rbp)
1454ef778:     	leaq	0x38(%rbp), %rcx
1454ef77c:     	leaq	0x80(%rbp), %rdx
1454ef783:     	movq	%rsi, %r8
1454ef786:     	callq	0x1454569d0 <.text+0x54559d0>
1454ef78b:     	nop
1454ef78c:     	movq	0x38(%rbp), %rax
1454ef790:     	movq	%rax, 0xd8(%rbp)
1454ef797:     	movq	0x40(%rbp), %rax
1454ef79b:     	movq	%rax, 0xc0(%rbp)
1454ef7a2:     	movq	0x48(%rbp), %r14
1454ef7a6:     	movzbl	0x50(%rbp), %ebx
1454ef7aa:     	leaq	0x51(%rbp), %rcx
1454ef7ae:     	movl	(%rcx), %eax
1454ef7b0:     	movl	0x3(%rcx), %ecx
1454ef7b3:     	movl	%eax, 0xd0(%rbp)
1454ef7b9:     	movl	%ecx, 0xd3(%rbp)
1454ef7bf:     	movq	0xe8(%rbp), %rdx
1454ef7c6:     	testq	%rdx, %rdx
1454ef7c9:     	je	0x1454eed10 <.text+0x54edd10>
1454ef7cf:     	movl	$0x1, %r8d
1454ef7d5:     	movq	0xc8(%rbp), %rcx
1454ef7dc:     	callq	0x1400021d0 <.text+0x11d0>
1454ef7e1:     	jmp	0x1454eed10 <.text+0x54edd10>
1454ef7e6:     	movq	$0x1, 0x140(%rbp)
1454ef7f1:     	movq	0x130(%rbp), %rax
1454ef7f8:     	movq	%rax, 0x148(%rbp)
1454ef7ff:     	movq	$0x1, 0x150(%rbp)
1454ef80a:     	movb	$0x1, 0x158(%rbp)
1454ef811:     	movq	%rax, 0xf8(%rbp)
1454ef818:     	movq	$0x1, 0xf0(%rbp)
1454ef823:     	movb	$0x0, 0x16e(%rbp)
1454ef82a:     	movb	$0x1, 0x16d(%rbp)
1454ef831:     	movl	0x6c(%rbp), %eax
1454ef834:     	movl	%eax, 0x20(%rsp)
1454ef838:     	movl	$0x4, %r9d
1454ef83e:     	leaq	0x100(%rbp), %rcx
1454ef845:     	leaq	0x140(%rbp), %rdx
1454ef84c:     	leaq	0x150725e(%rip), %r8    # 0x1469f6ab1
1454ef853:     	callq	0x145454010 <.text+0x5453010>
1454ef858:     	nop
1454ef859:     	jmp	0x1454ef2fb <.text+0x54ee2fb>
1454ef85e:     	movq	$0x1, 0x20(%rsp)
1454ef867:     	movl	$0x1, %r8d
1454ef86d:     	movl	$0x1, %r9d
1454ef873:     	movq	%r14, %rcx
1454ef876:     	movq	%rbx, %rdx
1454ef879:     	callq	0x1457744b0 <.text+0x57734b0>
1454ef87e:     	nop
1454ef87f:     	jmp	0x1454ef74e <.text+0x54ee74e>
1454ef884:     	movq	$0x1, 0x20(%rsp)
1454ef88d:     	movl	$0x4, %r8d
1454ef893:     	movl	$0x1, %r9d
1454ef899:     	movq	%rdi, %rcx
1454ef89c:     	callq	0x1457744b0 <.text+0x57734b0>
1454ef8a1:     	nop
1454ef8a2:     	movq	0x150(%rbp), %rdx
1454ef8a9:     	jmp	0x1454ef41e <.text+0x54ee41e>
1454ef8ae:     	callq	0x140002200 <.text+0x1200>
1454ef8b3:     	movl	$0x1, %ecx
1454ef8b8:     	movl	$0x1, %edx
1454ef8bd:     	callq	0x1400021c0 <.text+0x11c0>
1454ef8c2:     	testq	%rax, %rax
1454ef8c5:     	je	0x1454efd96 <.text+0x54eed96>
1454ef8cb:     	movb	$0x7b, (%rax)
1454ef8ce:     	movq	$0x1, 0x140(%rbp)
1454ef8d9:     	movq	%rax, 0x148(%rbp)
1454ef8e0:     	movq	$0x1, 0x150(%rbp)
1454ef8eb:     	movb	$0x1, 0x158(%rbp)
1454ef8f2:     	movb	$0x1, 0x16f(%rbp)
1454ef8f9:     	leaq	0x150860c(%rip), %rax   # 0x1469f7f0c
1454ef900:     	movq	%rax, 0x20(%rsp)
1454ef905:     	movq	$0x7, 0x28(%rsp)
1454ef90e:     	leaq	0x15071bf(%rip), %r8    # 0x1469f6ad4
1454ef915:     	leaq	0x100(%rbp), %rcx
1454ef91c:     	leaq	0x140(%rbp), %rdx
1454ef923:     	movl	$0x4, %r9d
1454ef929:     	callq	0x145456ed0 <.text+0x5455ed0>
1454ef92e:     	nop
1454ef92f:     	movb	$0x1, 0x16f(%rbp)
1454ef936:     	movq	0x28(%rbp), %rax
1454ef93a:     	movq	%rax, 0x28(%rsp)
1454ef93f:     	movq	0x20(%rbp), %rax
1454ef943:     	movq	%rax, 0x20(%rsp)
1454ef948:     	leaq	0x15085c4(%rip), %r8    # 0x1469f7f13
1454ef94f:     	leaq	0x140(%rbp), %rcx
1454ef956:     	leaq	0x100(%rbp), %rdx
1454ef95d:     	movl	$0x3, %r9d
1454ef963:     	callq	0x145456ed0 <.text+0x5455ed0>
1454ef968:     	nop
1454ef969:     	movl	0x410(%r12), %eax
1454ef971:     	movb	$0x1, 0x16f(%rbp)
1454ef978:     	movl	%eax, 0x20(%rsp)
1454ef97c:     	leaq	0x1507161(%rip), %r8    # 0x1469f6ae4
1454ef983:     	leaq	0x100(%rbp), %rcx
1454ef98a:     	leaq	0x140(%rbp), %rdx
1454ef991:     	movl	$0x5, %r9d
1454ef997:     	callq	0x145454010 <.text+0x5453010>
1454ef99c:     	nop
1454ef99d:     	movl	0x4c4(%r12), %esi
1454ef9a5:     	movb	$0x1, 0x16f(%rbp)
1454ef9ac:     	movl	%esi, 0x20(%rsp)
1454ef9b0:     	leaq	0x1507160(%rip), %r8    # 0x1469f6b17
1454ef9b7:     	leaq	0x140(%rbp), %rcx
1454ef9be:     	leaq	0x100(%rbp), %rdx
1454ef9c5:     	movl	$0x7, %r9d
1454ef9cb:     	callq	0x145454010 <.text+0x5453010>
1454ef9d0:     	nop
1454ef9d1:     	xorl	%ecx, %ecx
1454ef9d3:     	testl	%esi, %esi
1454ef9d5:     	jne	0x1454efa7d <.text+0x54eea7d>
1454ef9db:     	movl	0x4c8(%r12), %r8d
1454ef9e3:     	movl	$0x1, %eax
1454ef9e8:     	testl	%r8d, %r8d
1454ef9eb:     	je	0x1454efa66 <.text+0x54eea66>
1454ef9ed:     	testb	$0x1, %r8b
1454ef9f1:     	je	0x1454ef9fe <.text+0x54ee9fe>
1454ef9f3:     	movl	$0x3, %eax
1454ef9f8:     	cmpl	$0x1, %r8d
1454ef9fc:     	je	0x1454efa66 <.text+0x54eea66>
1454ef9fe:     	testb	$0x2, %r8b
1454efa02:     	je	0x1454efa12 <.text+0x54eea12>
1454efa04:     	leal	(%rax,%rax,8), %eax
1454efa07:     	movl	%r8d, %ecx
1454efa0a:     	andl	$-0x2, %ecx
1454efa0d:     	cmpl	$0x2, %ecx
1454efa10:     	je	0x1454efa66 <.text+0x54eea66>
1454efa12:     	testb	$0x4, %r8b
1454efa16:     	je	0x1454efa29 <.text+0x54eea29>
1454efa18:     	leal	(%rax,%rax,8), %eax
1454efa1b:     	leal	(%rax,%rax,8), %eax
1454efa1e:     	movl	%r8d, %ecx
1454efa21:     	andl	$-0x4, %ecx
1454efa24:     	cmpl	$0x4, %ecx
1454efa27:     	je	0x1454efa66 <.text+0x54eea66>
1454efa29:     	testb	$0x8, %r8b
1454efa2d:     	je	0x1454efa40 <.text+0x54eea40>
1454efa2f:     	imull	$0x19a1, %eax, %eax     # imm = 0x19A1
1454efa35:     	movl	%r8d, %ecx
1454efa38:     	andl	$-0x8, %ecx
1454efa3b:     	cmpl	$0x8, %ecx
1454efa3e:     	je	0x1454efa66 <.text+0x54eea66>
1454efa40:     	movb	$0x1, %r9b
1454efa43:     	movl	$0xffffff9c, %ecx       # imm = 0xFFFFFF9C
1454efa48:     	testb	$0x10, %r8b
1454efa4c:     	je	0x1454efa73 <.text+0x54eea73>
1454efa4e:     	movl	$0x290d741, %edx        # imm = 0x290D741
1454efa53:     	mull	%edx
1454efa55:     	seto	%dl
1454efa58:     	andl	$-0x10, %r8d
1454efa5c:     	cmpl	$0x10, %r8d
1454efa60:     	jne	0x1454efa73 <.text+0x54eea73>
1454efa62:     	testb	%dl, %dl
1454efa64:     	jne	0x1454efa73 <.text+0x54eea73>
1454efa66:     	movl	$0x64, %ecx
1454efa6b:     	mull	%ecx
1454efa6d:     	movl	%eax, %ecx
1454efa6f:     	seto	%r9b
1454efa73:     	testb	$0x1, %r9b
1454efa77:     	jne	0x1454efd62 <.text+0x54eed62>
1454efa7d:     	movb	$0x1, 0x16f(%rbp)
1454efa84:     	movl	%ecx, 0x20(%rsp)
1454efa88:     	leaq	0x150708f(%rip), %r8    # 0x1469f6b1e
1454efa8f:     	leaq	0x100(%rbp), %rcx
1454efa96:     	leaq	0x140(%rbp), %rdx
1454efa9d:     	movl	$0xa, %r9d
1454efaa3:     	callq	0x145454010 <.text+0x5453010>
1454efaa8:     	nop
1454efaa9:     	movl	0x420(%r12), %eax
1454efab1:     	movb	$0x1, 0x16f(%rbp)
1454efab8:     	movl	%eax, 0x20(%rsp)
1454efabc:     	leaq	0x150703b(%rip), %r8    # 0x1469f6afe
1454efac3:     	leaq	0x140(%rbp), %rcx
1454efaca:     	leaq	0x100(%rbp), %rdx
1454efad1:     	movl	$0x4, %r9d
1454efad7:     	callq	0x145454010 <.text+0x5453010>
1454efadc:     	nop
1454efadd:     	movb	$0x1, 0x16f(%rbp)
1454efae4:     	movl	0xbc(%rbp), %eax
1454efaea:     	movl	%eax, 0x20(%rsp)
1454efaee:     	leaq	0x1508421(%rip), %r8    # 0x1469f7f16
1454efaf5:     	leaq	0x100(%rbp), %rcx
1454efafc:     	leaq	0x140(%rbp), %rdx
1454efb03:     	movl	$0x8, %r9d
1454efb09:     	callq	0x145454010 <.text+0x5453010>
1454efb0e:     	nop
1454efb0f:     	movb	%bl, %dil
1454efb12:     	movb	0x226(%r12), %bl
1454efb1a:     	leaq	0x15083fd(%rip), %rdx   # 0x1469f7f1e
1454efb21:     	leaq	0x100(%rbp), %rcx
1454efb28:     	movl	$0x4, %r8d
1454efb2e:     	callq	0x145456c20 <.text+0x5455c20>
1454efb33:     	nop
1454efb34:     	movzbl	%bl, %esi
1454efb37:     	xorq	$0x5, %rsi
1454efb3b:     	movq	0x100(%rbp), %rax
1454efb42:     	movq	0x110(%rbp), %rcx
1454efb49:     	subq	%rcx, %rax
1454efb4c:     	cmpq	%rax, %rsi
1454efb4f:     	ja	0x1454efcd9 <.text+0x54eecd9>
1454efb55:     	leaq	0x125072b(%rip), %rax   # 0x146740287
1454efb5c:     	leaq	0x125071f(%rip), %rdx   # 0x146740282
1454efb63:     	testb	%bl, %bl
1454efb65:     	cmovneq	%rax, %rdx
1454efb69:     	addq	0x108(%rbp), %rcx
1454efb70:     	movq	%rsi, %r8
1454efb73:     	callq	0x1457731ed <.text+0x57721ed>
1454efb78:     	addq	%rsi, 0x110(%rbp)
1454efb7f:     	movups	0x100(%rbp), %xmm0
1454efb86:     	movaps	%xmm0, 0x140(%rbp)
1454efb8d:     	movups	0x110(%rbp), %xmm0
1454efb94:     	movaps	%xmm0, 0x150(%rbp)
1454efb9b:     	movl	0x980(%r12), %eax
1454efba3:     	shrl	$0x2, %eax
1454efba6:     	cmpl	$0xb, %eax
1454efba9:     	movl	$0xa, %ecx
1454efbae:     	cmovael	%eax, %ecx
1454efbb1:     	movb	$0x1, 0x16f(%rbp)
1454efbb8:     	movl	%ecx, 0x20(%rsp)
1454efbbc:     	leaq	0x150835f(%rip), %r8    # 0x1469f7f22
1454efbc3:     	leaq	0x100(%rbp), %rcx
1454efbca:     	leaq	0x140(%rbp), %rdx
1454efbd1:     	movl	$0x8, %r9d
1454efbd7:     	callq	0x145454010 <.text+0x5453010>
1454efbdc:     	nop
1454efbdd:     	movq	0xd8(%rbp), %r8
1454efbe4:     	movq	%r8, 0x140(%rbp)
1454efbeb:     	movq	0xc0(%rbp), %rdx
1454efbf2:     	movq	%rdx, 0x148(%rbp)
1454efbf9:     	movq	%r14, 0x150(%rbp)
1454efc00:     	movb	%dil, 0x158(%rbp)
1454efc07:     	movl	0xd0(%rbp), %eax
1454efc0d:     	movl	0xd3(%rbp), %ecx
1454efc13:     	movl	%eax, 0x159(%rbp)
1454efc19:     	movl	%ecx, 0x15c(%rbp)
1454efc1f:     	movq	%rdx, %rax
1454efc22:     	cmpq	%r14, %r8
1454efc25:     	je	0x1454efd07 <.text+0x54eed07>
1454efc2b:     	movb	$0x5d, (%rax,%r14)
1454efc30:     	incq	%r14
1454efc33:     	movq	%r14, 0x90(%rbp)
1454efc3a:     	movq	0x140(%rbp), %rax
1454efc41:     	movq	%rax, 0x80(%rbp)
1454efc48:     	movq	0x148(%rbp), %rax
1454efc4f:     	movq	%rax, 0x88(%rbp)
1454efc56:     	movb	$0x0, 0x13e(%rbp)
1454efc5d:     	leaq	0x80(%rbp), %rax
1454efc64:     	movq	%rax, 0x20(%rsp)
1454efc69:     	leaq	0x150829c(%rip), %r8    # 0x1469f7f0c
1454efc70:     	leaq	0x140(%rbp), %rcx
1454efc77:     	leaq	0x100(%rbp), %rdx
1454efc7e:     	movl	$0x7, %r9d
1454efc84:     	callq	0x145456d90 <.text+0x5455d90>
1454efc89:     	nop
1454efc8a:     	movq	0x150(%rbp), %rsi
1454efc91:     	cmpq	%rsi, 0x140(%rbp)
1454efc98:     	je	0x1454efd38 <.text+0x54eed38>
1454efc9e:     	movq	0x148(%rbp), %rax
1454efca5:     	movb	$0x7d, (%rax,%rsi)
1454efca9:     	incq	%rsi
1454efcac:     	movq	%rsi, 0x150(%rbp)
1454efcb3:     	movq	0x30(%rbp), %rax
1454efcb7:     	movq	%rsi, 0x10(%rax)
1454efcbb:     	movups	0x140(%rbp), %xmm0
1454efcc2:     	movups	%xmm0, (%rax)
1454efcc5:     	addq	$0x1f8, %rsp            # imm = 0x1F8
1454efccc:     	popq	%rbx
1454efccd:     	popq	%rdi
1454efcce:     	popq	%rsi
1454efccf:     	popq	%r12
1454efcd1:     	popq	%r13
1454efcd3:     	popq	%r14
1454efcd5:     	popq	%r15
1454efcd7:     	popq	%rbp
1454efcd8:     	retq
1454efcd9:     	movq	$0x1, 0x20(%rsp)
1454efce2:     	movq	%rcx, %rdx
1454efce5:     	leaq	0x100(%rbp), %rcx
1454efcec:     	movl	$0x1, %r9d
1454efcf2:     	movq	%rsi, %r8
1454efcf5:     	callq	0x1457744b0 <.text+0x57734b0>
1454efcfa:     	nop
1454efcfb:     	movq	0x110(%rbp), %rcx
1454efd02:     	jmp	0x1454efb55 <.text+0x54eeb55>
1454efd07:     	movq	$0x1, 0x20(%rsp)
1454efd10:     	leaq	0x140(%rbp), %rcx
1454efd17:     	movl	$0x1, %r8d
1454efd1d:     	movl	$0x1, %r9d
1454efd23:     	movq	%r14, %rdx
1454efd26:     	callq	0x1457744b0 <.text+0x57734b0>
1454efd2b:     	nop
1454efd2c:     	movq	0x148(%rbp), %rax
1454efd33:     	jmp	0x1454efc2b <.text+0x54eec2b>
1454efd38:     	movq	$0x1, 0x20(%rsp)
1454efd41:     	leaq	0x140(%rbp), %rcx
1454efd48:     	movl	$0x1, %r8d
1454efd4e:     	movl	$0x1, %r9d
1454efd54:     	movq	%rsi, %rdx
1454efd57:     	callq	0x1457744b0 <.text+0x57734b0>
1454efd5c:     	nop
1454efd5d:     	jmp	0x1454efc9e <.text+0x54eec9e>
1454efd62:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454efd67:     	jmp	0x1454efa7d <.text+0x54eea7d>
1454efd6c:     	movb	$0x1, 0x16f(%rbp)
1454efd73:     	movl	$0x1, %ecx
1454efd78:     	movl	$0x1, %edx
1454efd7d:     	callq	0x14590379b <.text+0x590279b>
1454efd82:     	nop
1454efd83:     	jmp	0x1454efdad <.text+0x54eedad>
1454efd85:     	movl	$0x1, %ecx
1454efd8a:     	movl	$0x1, %edx
1454efd8f:     	callq	0x14590379b <.text+0x590279b>
1454efd94:     	ud2
1454efd96:     	movb	$0x1, 0x16f(%rbp)
1454efd9d:     	movl	$0x1, %ecx
1454efda2:     	movl	$0x1, %edx
1454efda7:     	callq	0x14590379b <.text+0x590279b>
1454efdac:     	nop
1454efdad:     	ud2
