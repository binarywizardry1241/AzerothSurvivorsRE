
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454dbbc0:     	pushq	%rbp
1454dbbc1:     	pushq	%rsi
1454dbbc2:     	pushq	%rdi
1454dbbc3:     	pushq	%rbx
1454dbbc4:     	subq	$0xd8, %rsp
1454dbbcb:     	leaq	0x80(%rsp), %rbp
1454dbbd3:     	movaps	%xmm7, 0x40(%rbp)
1454dbbd7:     	movaps	%xmm6, 0x30(%rbp)
1454dbbdb:     	movq	$-0x2, 0x28(%rbp)
1454dbbe3:     	movq	%rcx, %rsi
1454dbbe6:     	testb	%dl, %dl
1454dbbe8:     	je	0x1454dbc06 <.text+0x54dac06>
1454dbbea:     	movzbl	%dl, %eax
1454dbbed:     	cmpl	$0x1, %eax
1454dbbf0:     	jne	0x1454dbc21 <.text+0x54dac21>
1454dbbf2:     	movl	0x8f0(%rsi), %eax
1454dbbf8:     	cmpl	$0x1, %eax
1454dbbfb:     	adcl	$-0x1, %eax
1454dbbfe:     	movl	%eax, 0x8f0(%rsi)
1454dbc04:     	jmp	0x1454dbc33 <.text+0x54dac33>
1454dbc06:     	movl	0x8ec(%rsi), %eax
1454dbc0c:     	cmpl	$0x1, %eax
1454dbc0f:     	adcl	$-0x1, %eax
1454dbc12:     	movl	%eax, 0x8ec(%rsi)
1454dbc18:     	movb	$0x1, 0x95c(%rsi)
1454dbc1f:     	jmp	0x1454dbc33 <.text+0x54dac33>
1454dbc21:     	movl	0x8f4(%rsi), %eax
1454dbc27:     	cmpl	$0x1, %eax
1454dbc2a:     	adcl	$-0x1, %eax
1454dbc2d:     	movl	%eax, 0x8f4(%rsi)
1454dbc33:     	movq	0x570(%rsi), %rdi
1454dbc3a:     	movq	0x578(%rsi), %rbx
1454dbc41:     	movq	$0x0, 0x578(%rsi)
1454dbc4c:     	testq	%rbx, %rbx
1454dbc4f:     	je	0x1454dbc74 <.text+0x54dac74>
1454dbc51:     	nopw	%cs:(%rax,%rax)
1454dbc60:     	movq	%rdi, %rcx
1454dbc63:     	callq	0x145486bd0 <.text+0x5485bd0>
1454dbc68:     	addq	$0xa0, %rdi
1454dbc6f:     	decq	%rbx
1454dbc72:     	jne	0x1454dbc60 <.text+0x54dac60>
1454dbc74:     	movq	0x530(%rsi), %rax
1454dbc7b:     	testq	%rax, %rax
1454dbc7e:     	je	0x1454dbd47 <.text+0x54dad47>
1454dbc84:     	movsd	0x3e8(%rsi), %xmm6
1454dbc8c:     	movss	0x470(%rsi), %xmm7
1454dbc94:     	xorl	%edi, %edi
1454dbc96:     	xorl	%ebx, %ebx
1454dbc98:     	jmp	0x1454dbca8 <.text+0x54daca8>
1454dbc9a:     	nopw	(%rax,%rax)
1454dbca0:     	incq	%rdi
1454dbca3:     	cmpq	%rax, %rdi
1454dbca6:     	jae	0x1454dbcfd <.text+0x54dacfd>
1454dbca8:     	movq	0x528(%rsi), %rcx
1454dbcaf:     	leaq	(%rdi,%rdi,8), %rdx
1454dbcb3:     	cmpl	$0x0, 0x20(%rcx,%rdx,8)
1454dbcb8:     	jne	0x1454dbca0 <.text+0x54daca0>
1454dbcba:     	leaq	(%rcx,%rdx,8), %rcx
1454dbcbe:     	cmpl	$0x0, 0x18(%rcx)
1454dbcc2:     	jne	0x1454dbce3 <.text+0x54dace3>
1454dbcc4:     	movsd	0x34(%rcx), %xmm0
1454dbcc9:     	subps	%xmm6, %xmm0
1454dbccc:     	mulps	%xmm0, %xmm0
1454dbccf:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454dbcd3:     	addss	%xmm0, %xmm1
1454dbcd7:     	xorps	%xmm0, %xmm0
1454dbcda:     	sqrtss	%xmm1, %xmm0
1454dbcde:     	ucomiss	%xmm0, %xmm7
1454dbce1:     	jb	0x1454dbca0 <.text+0x54daca0>
1454dbce3:     	addl	0x24(%rcx), %ebx
1454dbce6:     	movq	%rsi, %rcx
1454dbce9:     	movq	%rdi, %rdx
1454dbcec:     	callq	0x1454d1060 <.text+0x54d0060>
1454dbcf1:     	movq	0x530(%rsi), %rax
1454dbcf8:     	cmpq	%rax, %rdi
1454dbcfb:     	jb	0x1454dbca8 <.text+0x54daca8>
1454dbcfd:     	testl	%ebx, %ebx
1454dbcff:     	je	0x1454dbd47 <.text+0x54dad47>
1454dbd01:     	movl	%ebx, %eax
1454dbd03:     	xorps	%xmm0, %xmm0
1454dbd06:     	cvtsi2ss	%rax, %xmm0
1454dbd0b:     	mulss	0x474(%rsi), %xmm0
1454dbd13:     	callq	0x145756e1f <.text+0x5755e1f>
1454dbd18:     	maxss	0x40f760(%rip), %xmm0   # 0x1458eb480
1454dbd20:     	cvttss2si	%xmm0, %rax
1454dbd25:     	xorl	%ecx, %ecx
1454dbd27:     	xorps	%xmm1, %xmm1
1454dbd2a:     	ucomiss	%xmm1, %xmm0
1454dbd2d:     	cmovael	%eax, %ecx
1454dbd30:     	ucomiss	0x40f7e5(%rip), %xmm0   # 0x1458eb51c
1454dbd37:     	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
1454dbd3c:     	cmovbel	%ecx, %edx
1454dbd3f:     	movq	%rsi, %rcx
1454dbd42:     	callq	0x1454b4920 <.text+0x54b3920>
1454dbd47:     	movb	$0x1, %dl
1454dbd49:     	cmpl	$0x0, 0x8f0(%rsi)
1454dbd50:     	jne	0x1454dbd68 <.text+0x54dad68>
1454dbd52:     	movb	$0x2, %dl
1454dbd54:     	cmpl	$0x0, 0x8f4(%rsi)
1454dbd5b:     	jne	0x1454dbd68 <.text+0x54dad68>
1454dbd5d:     	cmpl	$0x0, 0x8ec(%rsi)
1454dbd64:     	je	0x1454dbd86 <.text+0x54dad86>
1454dbd66:     	xorl	%edx, %edx
1454dbd68:     	movq	%rsi, %rcx
1454dbd6b:     	xorl	%r8d, %r8d
1454dbd6e:     	movaps	0x30(%rbp), %xmm6
1454dbd72:     	movaps	0x40(%rbp), %xmm7
1454dbd76:     	addq	$0xd8, %rsp
1454dbd7d:     	popq	%rbx
1454dbd7e:     	popq	%rdi
1454dbd7f:     	popq	%rsi
1454dbd80:     	popq	%rbp
1454dbd81:     	jmp	0x1454da5f0 <.text+0x54d95f0>
1454dbd86:     	movb	$-0x1, 0x95d(%rsi)
1454dbd8d:     	cmpq	$0x0, 0x10(%rsi)
1454dbd92:     	movq	$0x0, 0x10(%rsi)
1454dbd9a:     	je	0x1454dbe13 <.text+0x54dae13>
1454dbd9c:     	callq	0x140002200 <.text+0x1200>
1454dbda1:     	movl	$0x20, %ecx
1454dbda6:     	movl	$0x1, %edx
1454dbdab:     	callq	0x1400021c0 <.text+0x11c0>
1454dbdb0:     	movq	%rax, 0x20(%rbp)
1454dbdb4:     	testq	%rax, %rax
1454dbdb7:     	je	0x1454dc146 <.text+0x54db146>
1454dbdbd:     	movq	0x548(%rsi), %rdi
1454dbdc4:     	cmpq	0x538(%rsi), %rdi
1454dbdcb:     	jne	0x1454dbdda <.text+0x54dadda>
1454dbdcd:     	leaq	0x538(%rsi), %rcx
1454dbdd4:     	callq	0x1457580b0 <.text+0x57570b0>
1454dbdd9:     	nop
1454dbdda:     	movq	0x540(%rsi), %rax
1454dbde1:     	movq	%rdi, %rcx
1454dbde4:     	shlq	$0x5, %rcx
1454dbde8:     	movq	$0x20, (%rax,%rcx)
1454dbdf0:     	movq	0x20(%rbp), %rdx
1454dbdf4:     	movq	%rdx, 0x8(%rax,%rcx)
1454dbdf9:     	movq	$0x0, 0x10(%rax,%rcx)
1454dbe02:     	movw	$0x17e, 0x18(%rax,%rcx) # imm = 0x17E
1454dbe09:     	incq	%rdi
1454dbe0c:     	movq	%rdi, 0x548(%rsi)
1454dbe13:     	movb	$0x1, 0x95f(%rsi)
1454dbe1a:     	movq	%rsi, %rcx
1454dbe1d:     	callq	0x145494400 <.text+0x5493400>
1454dbe22:     	movss	0x8e4(%rsi), %xmm6
1454dbe2a:     	leaq	0x2f0(%rsi), %rcx
1454dbe31:     	movq	0x300(%rsi), %rdi
1454dbe38:     	testq	%rdi, %rdi
1454dbe3b:     	je	0x1454dbe6c <.text+0x54dae6c>
1454dbe3d:     	movq	0x2f8(%rsi), %rax
1454dbe44:     	xorl	%edx, %edx
1454dbe46:     	movq	%rax, %r8
1454dbe49:     	nopl	(%rax)
1454dbe50:     	cmpl	$0x3fc, 0xc(%r8)        # imm = 0x3FC
1454dbe58:     	je	0x1454dc02e <.text+0x54db02e>
1454dbe5e:     	incq	%rdx
1454dbe61:     	addq	$0x18, %r8
1454dbe65:     	cmpq	%rdx, %rdi
1454dbe68:     	jne	0x1454dbe50 <.text+0x54dae50>
1454dbe6a:     	jmp	0x1454dbe6e <.text+0x54dae6e>
1454dbe6c:     	xorl	%edi, %edi
1454dbe6e:     	addss	0x40f60a(%rip), %xmm6   # 0x1458eb480
1454dbe76:     	cmpq	(%rcx), %rdi
1454dbe79:     	jne	0x1454dbe80 <.text+0x54dae80>
1454dbe7b:     	callq	0x145763c20 <.text+0x5762c20>
1454dbe80:     	movq	0x2f8(%rsi), %rax
1454dbe87:     	leaq	(%rdi,%rdi,2), %rcx
1454dbe8b:     	movl	$0xb, (%rax,%rcx,8)
1454dbe92:     	movl	$0x3fc, 0xc(%rax,%rcx,8) # imm = 0x3FC
1454dbe9a:     	movss	%xmm6, 0x10(%rax,%rcx,8)
1454dbea0:     	movl	$0x0, 0x14(%rax,%rcx,8)
1454dbea8:     	incq	%rdi
1454dbeab:     	movq	%rdi, 0x300(%rsi)
1454dbeb2:     	movq	0x3d0(%rsi), %rdx
1454dbeb9:     	movq	%rdx, -0x30(%rbp)
1454dbebd:     	movl	$0x2, -0x8(%rbp)
1454dbec4:     	movl	$0x0, -0x3c(%rbp)
1454dbecb:     	leaq	-0x3c(%rbp), %rax
1454dbecf:     	movq	%rax, 0x30(%rsp)
1454dbed4:     	leaq	-0x8(%rbp), %rax
1454dbed8:     	movq	%rax, 0x28(%rsp)
1454dbedd:     	movq	$0x1, 0x20(%rsp)
1454dbee6:     	leaq	-0x28(%rbp), %rcx
1454dbeea:     	leaq	-0x30(%rbp), %r9
1454dbeee:     	movl	$0x3fc, %r8d            # imm = 0x3FC
1454dbef4:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454dbef9:     	movq	0x548(%rsi), %rdi
1454dbf00:     	cmpq	0x538(%rsi), %rdi
1454dbf07:     	jne	0x1454dbf16 <.text+0x54daf16>
1454dbf09:     	leaq	0x538(%rsi), %rcx
1454dbf10:     	callq	0x1457580b0 <.text+0x57570b0>
1454dbf15:     	nop
1454dbf16:     	movq	0x540(%rsi), %rax
1454dbf1d:     	movq	%rdi, %rcx
1454dbf20:     	shlq	$0x5, %rcx
1454dbf24:     	movups	-0x28(%rbp), %xmm0
1454dbf28:     	movups	-0x18(%rbp), %xmm1
1454dbf2c:     	movups	%xmm1, 0x10(%rax,%rcx)
1454dbf31:     	movups	%xmm0, (%rax,%rcx)
1454dbf35:     	incq	%rdi
1454dbf38:     	movq	%rdi, 0x548(%rsi)
1454dbf3f:     	movq	%rsi, %rcx
1454dbf42:     	callq	0x14548d2b0 <.text+0x548c2b0>
1454dbf47:     	callq	0x140002200 <.text+0x1200>
1454dbf4c:     	movl	$0x1, %ecx
1454dbf51:     	movl	$0x1, %edx
1454dbf56:     	callq	0x1400021c0 <.text+0x11c0>
1454dbf5b:     	testq	%rax, %rax
1454dbf5e:     	je	0x1454dc135 <.text+0x54db135>
1454dbf64:     	movb	$0x7b, (%rax)
1454dbf67:     	movq	$0x1, -0x28(%rbp)
1454dbf6f:     	movq	%rax, -0x20(%rbp)
1454dbf73:     	movq	$0x1, -0x18(%rbp)
1454dbf7b:     	movb	$0x1, -0x10(%rbp)
1454dbf7f:     	leaq	0x14d06b2(%rip), %rax   # 0x1469ac638
1454dbf86:     	movq	%rax, 0x20(%rsp)
1454dbf8b:     	movq	$0x6, 0x28(%rsp)
1454dbf94:     	leaq	0x14cf0b6(%rip), %r8    # 0x1469ab051
1454dbf9b:     	leaq	-0x8(%rbp), %rcx
1454dbf9f:     	leaq	-0x28(%rbp), %rdx
1454dbfa3:     	movl	$0x4, %r9d
1454dbfa9:     	callq	0x145451620 <.text+0x5450620>
1454dbfae:     	movq	-0x8(%rbp), %rax
1454dbfb2:     	movq	0x8(%rbp), %rdi
1454dbfb6:     	movq	%rax, 0x20(%rbp)
1454dbfba:     	cmpq	%rdi, %rax
1454dbfbd:     	je	0x1454dc106 <.text+0x54db106>
1454dbfc3:     	movq	(%rbp), %rax
1454dbfc7:     	movq	%rax, 0x18(%rbp)
1454dbfcb:     	movb	$0x7d, (%rax,%rdi)
1454dbfcf:     	movq	0x560(%rsi), %rbx
1454dbfd6:     	cmpq	0x550(%rsi), %rbx
1454dbfdd:     	jne	0x1454dbfec <.text+0x54dafec>
1454dbfdf:     	leaq	0x550(%rsi), %rcx
1454dbfe6:     	callq	0x145757f60 <.text+0x5756f60>
1454dbfeb:     	nop
1454dbfec:     	incq	%rdi
1454dbfef:     	movq	0x558(%rsi), %rax
1454dbff6:     	leaq	(%rbx,%rbx,2), %rcx
1454dbffa:     	movq	0x20(%rbp), %rdx
1454dbffe:     	movq	%rdx, (%rax,%rcx,8)
1454dc002:     	movq	0x18(%rbp), %rdx
1454dc006:     	movq	%rdx, 0x8(%rax,%rcx,8)
1454dc00b:     	movq	%rdi, 0x10(%rax,%rcx,8)
1454dc010:     	incq	%rbx
1454dc013:     	movq	%rbx, 0x560(%rsi)
1454dc01a:     	movaps	0x30(%rbp), %xmm6
1454dc01e:     	movaps	0x40(%rbp), %xmm7
1454dc022:     	addq	$0xd8, %rsp
1454dc029:     	popq	%rbx
1454dc02a:     	popq	%rdi
1454dc02b:     	popq	%rsi
1454dc02c:     	popq	%rbp
1454dc02d:     	retq
1454dc02e:     	leaq	0x1(%rdx), %r10
1454dc032:     	cmpq	%rdi, %r10
1454dc035:     	jae	0x1454dc077 <.text+0x54db077>
1454dc037:     	leaq	-0x2(%rdi), %r9
1454dc03b:     	leal	(%rdi,%rdx), %ebx
1454dc03e:     	movq	%rdx, %r11
1454dc041:     	testb	$0x1, %bl
1454dc044:     	jne	0x1454dc06f <.text+0x54db06f>
1454dc046:     	cmpl	$0x3fc, 0x24(%r8)       # imm = 0x3FC
1454dc04e:     	movq	%rdx, %r11
1454dc051:     	je	0x1454dc06b <.text+0x54db06b>
1454dc053:     	leaq	0x18(%r8), %r10
1454dc057:     	movq	0x10(%r10), %r11
1454dc05b:     	movq	%r11, 0x10(%r8)
1454dc05f:     	movups	(%r10), %xmm0
1454dc063:     	movups	%xmm0, (%r8)
1454dc067:     	leaq	0x1(%rdx), %r11
1454dc06b:     	leaq	0x2(%rdx), %r10
1454dc06f:     	cmpq	%rdx, %r9
1454dc072:     	movq	%r11, %rdx
1454dc075:     	jne	0x1454dc097 <.text+0x54db097>
1454dc077:     	movq	%rdx, 0x300(%rsi)
1454dc07e:     	movq	%rdx, %rdi
1454dc081:     	addss	0x40f3f7(%rip), %xmm6   # 0x1458eb480
1454dc089:     	cmpq	(%rcx), %rdi
1454dc08c:     	je	0x1454dbe7b <.text+0x54dae7b>
1454dc092:     	jmp	0x1454dbe80 <.text+0x54dae80>
1454dc097:     	leaq	(%r10,%r10,2), %rdx
1454dc09b:     	leaq	(%rax,%rdx,8), %r8
1454dc09f:     	subq	%r10, %rdi
1454dc0a2:     	movq	%r11, %rdx
1454dc0a5:     	jmp	0x1454dc0b1 <.text+0x54db0b1>
1454dc0a7:     	addq	$0x30, %r8
1454dc0ab:     	addq	$-0x2, %rdi
1454dc0af:     	je	0x1454dc077 <.text+0x54db077>
1454dc0b1:     	cmpl	$0x3fc, 0xc(%r8)        # imm = 0x3FC
1454dc0b9:     	jne	0x1454dc0c7 <.text+0x54db0c7>
1454dc0bb:     	cmpl	$0x3fc, 0x24(%r8)       # imm = 0x3FC
1454dc0c3:     	je	0x1454dc0a7 <.text+0x54db0a7>
1454dc0c5:     	jmp	0x1454dc0ea <.text+0x54db0ea>
1454dc0c7:     	leaq	(%rdx,%rdx,2), %r9
1454dc0cb:     	movq	0x10(%r8), %r10
1454dc0cf:     	movq	%r10, 0x10(%rax,%r9,8)
1454dc0d4:     	movups	(%r8), %xmm0
1454dc0d8:     	movups	%xmm0, (%rax,%r9,8)
1454dc0dd:     	incq	%rdx
1454dc0e0:     	cmpl	$0x3fc, 0x24(%r8)       # imm = 0x3FC
1454dc0e8:     	je	0x1454dc0a7 <.text+0x54db0a7>
1454dc0ea:     	leaq	(%rdx,%rdx,2), %r9
1454dc0ee:     	movq	0x28(%r8), %r10
1454dc0f2:     	movq	%r10, 0x10(%rax,%r9,8)
1454dc0f7:     	movups	0x18(%r8), %xmm0
1454dc0fc:     	movups	%xmm0, (%rax,%r9,8)
1454dc101:     	incq	%rdx
1454dc104:     	jmp	0x1454dc0a7 <.text+0x54db0a7>
1454dc106:     	movq	$0x1, 0x20(%rsp)
1454dc10f:     	leaq	-0x8(%rbp), %rcx
1454dc113:     	movl	$0x1, %r8d
1454dc119:     	movl	$0x1, %r9d
1454dc11f:     	movq	%rdi, %rdx
1454dc122:     	callq	0x145757d40 <.text+0x5756d40>
1454dc127:     	nop
1454dc128:     	movq	-0x8(%rbp), %rax
1454dc12c:     	movq	%rax, 0x20(%rbp)
1454dc130:     	jmp	0x1454dbfc3 <.text+0x54dafc3>
1454dc135:     	movl	$0x1, %ecx
1454dc13a:     	movl	$0x1, %edx
1454dc13f:     	callq	0x1458e721b <.text+0x58e621b>
1454dc144:     	ud2
1454dc146:     	movl	$0x1, %ecx
1454dc14b:     	movl	$0x20, %edx
1454dc150:     	callq	0x1458e721b <.text+0x58e621b>
1454dc155:     	ud2
