Disassembly of section .text:

0000000140001000 <.text>:
140277c70:     	pushq	%rbp
140277c71:     	pushq	%r15
140277c73:     	pushq	%r14
140277c75:     	pushq	%r13
140277c77:     	pushq	%r12
140277c79:     	pushq	%rsi
140277c7a:     	pushq	%rdi
140277c7b:     	pushq	%rbx
140277c7c:     	subq	$0x218, %rsp            # imm = 0x218
140277c83:     	leaq	0x80(%rsp), %rbp
140277c8b:     	movaps	%xmm13, 0x180(%rbp)
140277c93:     	movaps	%xmm12, 0x170(%rbp)
140277c9b:     	movaps	%xmm11, 0x160(%rbp)
140277ca3:     	movaps	%xmm10, 0x150(%rbp)
140277cab:     	movaps	%xmm9, 0x140(%rbp)
140277cb3:     	movaps	%xmm8, 0x130(%rbp)
140277cbb:     	movaps	%xmm7, 0x120(%rbp)
140277cc2:     	movaps	%xmm6, 0x110(%rbp)
140277cc9:     	movq	$-0x2, 0x108(%rbp)
140277cd4:     	cmpq	$0x0, 0x90(%rdx)
140277cdc:     	je	0x140277ecc <.text+0x276ecc>
140277ce2:     	movq	%rdx, %rsi
140277ce5:     	movq	0x78(%rdx), %rax
140277ce9:     	movq	0x80(%rdx), %rcx
140277cf0:     	movabsq	$-0x688f462dff8d0ebb, %rdx # imm = 0x9770B9D20072F145
140277cfa:     	xorl	%r8d, %r8d
140277cfd:     	movdqa	0x5af5bdb(%rip), %xmm0  # 0x145d6d8e0
140277d05:     	pcmpeqd	%xmm1, %xmm1
140277d09:     	movdqa	0x5af5c9f(%rip), %xmm2  # 0x145d6d9b0
140277d11:     	andq	%rcx, %rdx
140277d14:     	movdqu	(%rax,%rdx), %xmm3
140277d19:     	movdqa	%xmm3, %xmm4
140277d1d:     	pcmpeqb	%xmm0, %xmm4
140277d21:     	pmovmskb	%xmm4, %r9d
140277d26:     	testl	%r9d, %r9d
140277d29:     	je	0x140277d70 <.text+0x276d70>
140277d2b:     	tzcntl	%r9d, %r10d
140277d30:     	addq	%rdx, %r10
140277d33:     	andq	%rcx, %r10
140277d36:     	negq	%r10
140277d39:     	leaq	(%r10,%r10,2), %r10
140277d3d:     	movdqu	-0x18(%rax,%r10,8), %xmm4
140277d44:     	pcmpeqb	%xmm2, %xmm4
140277d48:     	pmovmskb	%xmm4, %r11d
140277d4d:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
140277d54:     	je	0x140277d8f <.text+0x276d8f>
140277d56:     	leal	-0x1(%r9), %r10d
140277d5a:     	andw	%r9w, %r10w
140277d5e:     	movl	%r10d, %r9d
140277d61:     	jne	0x140277d2b <.text+0x276d2b>
140277d63:     	nopw	%cs:(%rax,%rax)
140277d70:     	pcmpeqb	%xmm1, %xmm3
140277d74:     	pmovmskb	%xmm3, %r9d
140277d79:     	testl	%r9d, %r9d
140277d7c:     	jne	0x140277ecc <.text+0x276ecc>
140277d82:     	addq	%r8, %rdx
140277d85:     	addq	$0x10, %rdx
140277d89:     	addq	$0x10, %r8
140277d8d:     	jmp	0x140277d11 <.text+0x276d11>
140277d8f:     	leaq	(%rax,%r10,8), %rax
140277d93:     	movq	-0x8(%rax), %rax
140277d97:     	cmpq	0x218(%rsi), %rax
140277d9e:     	jae	0x140277ecc <.text+0x276ecc>
140277da4:     	movq	0x210(%rsi), %rcx
140277dab:     	movq	(%rcx,%rax,8), %rcx
140277daf:     	testq	%rcx, %rcx
140277db2:     	je	0x140277ecc <.text+0x276ecc>
140277db8:     	movq	0x1e0(%rsi), %rax
140277dbf:     	notq	%rcx
140277dc2:     	imulq	$0x38, %rcx, %rcx
140277dc6:     	cmpb	$0x0, 0x30(%rax,%rcx)
140277dcb:     	je	0x140277ecc <.text+0x276ecc>
140277dd1:     	addq	%rcx, %rax
140277dd4:     	movq	0x10(%rax), %rax
140277dd8:     	movss	(%rax), %xmm6
140277ddc:     	leaq	-0x60(%rbp), %rcx
140277de0:     	movq	%rsi, %rdx
140277de3:     	callq	0x140639a80 <.text+0x638a80>
140277de8:     	cmpl	$0x1, -0x60(%rbp)
140277dec:     	jne	0x140277e0b <.text+0x276e0b>
140277dee:     	movss	-0x5c(%rbp), %xmm11
140277df4:     	movss	-0x54(%rbp), %xmm0
140277df9:     	subss	%xmm11, %xmm0
140277dfe:     	ucomiss	0x5af5567(%rip), %xmm0  # 0x145d6d36c
140277e05:     	jbe	0x140277e0b <.text+0x276e0b>
140277e07:     	movb	$0x1, %bl
140277e09:     	jmp	0x140277e0d <.text+0x276e0d>
140277e0b:     	xorl	%ebx, %ebx
140277e0d:     	leaq	-0x60(%rbp), %rdi
140277e11:     	movq	%rdi, %rcx
140277e14:     	movq	%rsi, %rdx
140277e17:     	callq	0x140382c10 <.text+0x381c10>
140277e1c:     	nop
140277e1d:     	movq	%rdi, %rcx
140277e20:     	movq	%rsi, %rdx
140277e23:     	callq	0x140376e00 <.text+0x375e00>
140277e28:     	nop
140277e29:     	movq	0x5a0(%rsi), %rdx
140277e30:     	movq	-0x60(%rbp), %rcx
140277e34:     	cmpq	%rdx, %rcx
140277e37:     	jne	0x140278745 <.text+0x277745>
140277e3d:     	movl	0x5b0(%rsi), %eax
140277e43:     	movq	0x98(%rbp), %rcx
140277e4a:     	movq	0xa0(%rbp), %rdx
140277e51:     	cmpb	$0x0, 0xa8(%rbp)
140277e58:     	je	0x140277efb <.text+0x276efb>
140277e5e:     	movq	0x1a8(%rsi), %rax
140277e65:     	shlq	$0x2, %rdx
140277e69:     	xorl	%r8d, %r8d
140277e6c:     	nopl	(%rax)
140277e70:     	cmpq	%r8, %rdx
140277e73:     	je	0x140277f76 <.text+0x276f76>
140277e79:     	movl	(%rcx,%r8), %r9d
140277e7d:     	leaq	(%r9,%r9,8), %r9
140277e81:     	addq	$0x4, %r8
140277e85:     	cmpq	$0x0, 0x10(%rax,%r9,8)
140277e8b:     	je	0x140277e70 <.text+0x276e70>
140277e8d:     	leaq	(%rax,%r9,8), %rax
140277e91:     	movq	0xb0(%rbp), %rcx
140277e98:     	cmpq	0x40(%rax), %rcx
140277e9c:     	jae	0x140277f84 <.text+0x276f84>
140277ea2:     	movq	0x38(%rax), %rdx
140277ea6:     	movq	(%rdx,%rcx,8), %rcx
140277eaa:     	testq	%rcx, %rcx
140277ead:     	je	0x140277f84 <.text+0x276f84>
140277eb3:     	movq	0x18(%rax), %rax
140277eb7:     	notq	%rcx
140277eba:     	leaq	(%rcx,%rcx,2), %rcx
140277ebe:     	shlq	$0x4, %rcx
140277ec2:     	movq	0x10(%rax,%rcx), %rax
140277ec7:     	jmp	0x140277f9d <.text+0x276f9d>
140277ecc:     	leaq	0x106(%rbp), %rax
140277ed3:     	movq	%rax, -0x60(%rbp)
140277ed7:     	leaq	0x4d6e792(%rip), %rax   # 0x144fe6670 <.text+0x4fe5670>
140277ede:     	movq	%rax, -0x58(%rbp)
140277ee2:     	leaq	0x5b47b37(%rip), %rcx   # 0x145dbfa20
140277ee9:     	leaq	0x5b486d0(%rip), %r8    # 0x145dc05c0
140277ef0:     	leaq	-0x60(%rbp), %rdx
140277ef4:     	callq	0x145d699c0 <.text+0x5d689c0>
140277ef9:     	ud2
140277efb:     	movq	0x108(%rsi), %rax
140277f02:     	shlq	$0x2, %rdx
140277f06:     	xorl	%r8d, %r8d
140277f09:     	nopl	(%rax)
140277f10:     	cmpq	%r8, %rdx
140277f13:     	je	0x140277f76 <.text+0x276f76>
140277f15:     	movl	(%rcx,%r8), %r9d
140277f19:     	leaq	(%r9,%r9,4), %r9
140277f1d:     	shlq	$0x5, %r9
140277f21:     	addq	$0x4, %r8
140277f25:     	cmpq	$0x0, 0x58(%rax,%r9)
140277f2b:     	je	0x140277f10 <.text+0x276f10>
140277f2d:     	addq	%r9, %rax
140277f30:     	movl	0x94(%rax), %ecx
140277f36:     	movq	0x1a8(%rsi), %rdx
140277f3d:     	leaq	(%rcx,%rcx,8), %r8
140277f41:     	movq	0xb0(%rbp), %rcx
140277f48:     	cmpq	0x40(%rdx,%r8,8), %rcx
140277f4d:     	jae	0x140277f88 <.text+0x276f88>
140277f4f:     	leaq	(%rdx,%r8,8), %rdx
140277f53:     	movq	0x38(%rdx), %r8
140277f57:     	movq	(%r8,%rcx,8), %rcx
140277f5b:     	testq	%rcx, %rcx
140277f5e:     	je	0x140277f88 <.text+0x276f88>
140277f60:     	movq	0x18(%rdx), %rdx
140277f64:     	notq	%rcx
140277f67:     	leaq	(%rcx,%rcx,2), %rcx
140277f6b:     	shlq	$0x4, %rcx
140277f6f:     	movq	0x10(%rdx,%rcx), %rcx
140277f74:     	jmp	0x140277f8a <.text+0x276f8a>
140277f76:     	leaq	-0x60(%rbp), %rcx
140277f7a:     	callq	0x14003b160 <.text+0x3a160>
140277f7f:     	jmp	0x1402786f3 <.text+0x2776f3>
140277f84:     	xorl	%eax, %eax
140277f86:     	jmp	0x140277f9d <.text+0x276f9d>
140277f88:     	xorl	%ecx, %ecx
140277f8a:     	movq	0x50(%rax), %rax
140277f8e:     	movl	0x8(%rax), %eax
140277f91:     	notl	%eax
140277f93:     	imulq	$0xf8, %rax, %rax
140277f9a:     	addq	%rcx, %rax
140277f9d:     	movl	0xc0(%rax), %r14d
140277fa4:     	movl	0xc4(%rax), %edi
140277faa:     	leaq	0xc8(%rax), %rcx
140277fb1:     	cmpb	$0x0, 0xb8(%rax)
140277fb8:     	leaq	0xbc(%rax), %rax
140277fbf:     	cmovneq	%rax, %rcx
140277fc3:     	movss	(%rcx), %xmm9
140277fc8:     	leaq	-0x60(%rbp), %rcx
140277fcc:     	callq	0x14003b160 <.text+0x3a160>
140277fd1:     	cmpq	$0x0, 0x90(%rsi)
140277fd9:     	je	0x140278131 <.text+0x277131>
140277fdf:     	cvtsi2ss	%r14, %xmm7
140277fe4:     	divss	%xmm9, %xmm7
140277fe9:     	cvtsi2ss	%rdi, %xmm8
140277fee:     	divss	%xmm9, %xmm8
140277ff3:     	movq	0x78(%rsi), %rax
140277ff7:     	movq	0x80(%rsi), %rcx
140277ffe:     	movabsq	$-0x482eb6960cf569d8, %rdx # imm = 0xB7D14969F30A9628
140278008:     	xorl	%r8d, %r8d
14027800b:     	movdqa	0x5b22f4d(%rip), %xmm0  # 0x145d9af60
140278013:     	pcmpeqd	%xmm1, %xmm1
140278017:     	movdqa	0x5b474e1(%rip), %xmm2  # 0x145dbf500
14027801f:     	andq	%rcx, %rdx
140278022:     	movdqu	(%rax,%rdx), %xmm3
140278027:     	movdqa	%xmm3, %xmm4
14027802b:     	pcmpeqb	%xmm0, %xmm4
14027802f:     	pmovmskb	%xmm4, %r9d
140278034:     	testl	%r9d, %r9d
140278037:     	je	0x140278071 <.text+0x277071>
140278039:     	tzcntl	%r9d, %r10d
14027803e:     	addq	%rdx, %r10
140278041:     	andq	%rcx, %r10
140278044:     	negq	%r10
140278047:     	leaq	(%r10,%r10,2), %r10
14027804b:     	movdqu	-0x18(%rax,%r10,8), %xmm4
140278052:     	pcmpeqb	%xmm2, %xmm4
140278056:     	pmovmskb	%xmm4, %r11d
14027805b:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
140278062:     	je	0x140278090 <.text+0x277090>
140278064:     	leal	-0x1(%r9), %r10d
140278068:     	andw	%r9w, %r10w
14027806c:     	movl	%r10d, %r9d
14027806f:     	jne	0x140278039 <.text+0x277039>
140278071:     	pcmpeqb	%xmm1, %xmm3
140278075:     	pmovmskb	%xmm3, %r9d
14027807a:     	testl	%r9d, %r9d
14027807d:     	jne	0x140278131 <.text+0x277131>
140278083:     	addq	%r8, %rdx
140278086:     	addq	$0x10, %rdx
14027808a:     	addq	$0x10, %r8
14027808e:     	jmp	0x14027801f <.text+0x27701f>
140278090:     	leaq	(%rax,%r10,8), %rax
140278094:     	movq	-0x8(%rax), %rax
140278098:     	cmpq	0x218(%rsi), %rax
14027809f:     	jae	0x140278131 <.text+0x277131>
1402780a5:     	movq	0x210(%rsi), %rcx
1402780ac:     	movq	(%rcx,%rax,8), %rcx
1402780b0:     	testq	%rcx, %rcx
1402780b3:     	je	0x140278131 <.text+0x277131>
1402780b5:     	movq	0x1e0(%rsi), %rax
1402780bc:     	notq	%rcx
1402780bf:     	imulq	$0x38, %rcx, %rcx
1402780c3:     	cmpb	$0x0, 0x30(%rax,%rcx)
1402780c8:     	je	0x140278131 <.text+0x277131>
1402780ca:     	addq	%rcx, %rax
1402780cd:     	movq	0x10(%rax), %rax
1402780d1:     	movl	(%rax), %ecx
1402780d3:     	movl	%ecx, 0xe0(%rbp)
1402780d9:     	movl	0xc(%rax), %ecx
1402780dc:     	movl	%ecx, 0xe4(%rbp)
1402780e2:     	movsd	0x4(%rax), %xmm9
1402780e8:     	movsd	0x10(%rax), %xmm10
1402780ee:     	leaq	-0x60(%rbp), %rdi
1402780f2:     	movq	%rdi, %rcx
1402780f5:     	movq	%rsi, %rdx
1402780f8:     	callq	0x14039e640 <.text+0x39d640>
1402780fd:     	movl	0x5b0(%rsi), %eax
140278103:     	movl	%eax, 0xf4(%rbp)
140278109:     	movq	%rdi, %rcx
14027810c:     	movq	%rsi, %rdx
14027810f:     	callq	0x140383770 <.text+0x382770>
140278114:     	nop
140278115:     	movq	0x98(%rbp), %rax
14027811c:     	movq	0xa0(%rbp), %rcx
140278123:     	testb	%bl, %bl
140278125:     	jne	0x140278160 <.text+0x277160>
140278127:     	movss	0x5b47411(%rip), %xmm1  # 0x145dbf540
14027812f:     	jmp	0x140278178 <.text+0x277178>
140278131:     	leaq	0x106(%rbp), %rax
140278138:     	movq	%rax, -0x60(%rbp)
14027813c:     	leaq	0x4d6e52d(%rip), %rax   # 0x144fe6670 <.text+0x4fe5670>
140278143:     	movq	%rax, -0x58(%rbp)
140278147:     	leaq	0x5b478d2(%rip), %rcx   # 0x145dbfa20
14027814e:     	leaq	0x5b48483(%rip), %r8    # 0x145dc05d8
140278155:     	leaq	-0x60(%rbp), %rdx
140278159:     	callq	0x145d699c0 <.text+0x5d689c0>
14027815e:     	ud2
140278160:     	movaps	%xmm7, %xmm1
140278163:     	subss	%xmm11, %xmm1
140278168:     	movss	0x5af54e0(%rip), %xmm0  # 0x145d6d650
140278170:     	addss	%xmm0, %xmm1
140278174:     	maxss	%xmm0, %xmm1
140278178:     	leaq	(%rax,%rcx,4), %rcx
14027817c:     	movzbl	0xa8(%rbp), %edx
140278183:     	movb	%dl, 0x107(%rbp)
140278189:     	movaps	0x5b473c0(%rip), %xmm0  # 0x145dbf550
140278190:     	unpcklps	%xmm1, %xmm0            # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
140278193:     	movsldup	%xmm6, %xmm1            # xmm1 = xmm6[0,0,2,2]
140278197:     	divps	%xmm1, %xmm0
14027819a:     	xorl	%r8d, %r8d
14027819d:     	movl	$0x8, %edx
1402781a2:     	movq	%rdx, 0xd8(%rbp)
1402781a9:     	movd	0x5b473af(%rip), %xmm1  # 0x145dbf560
1402781b1:     	pxor	%xmm2, %xmm2
1402781b5:     	pxor	%xmm3, %xmm3
1402781b9:     	xorl	%r11d, %r11d
1402781bc:     	xorl	%r14d, %r14d
1402781bf:     	movq	$0x0, 0xf8(%rbp)
1402781ca:     	xorl	%r13d, %r13d
1402781cd:     	movq	%rcx, 0xd0(%rbp)
1402781d4:     	jmp	0x1402781fd <.text+0x2771fd>
1402781d6:     	nopw	%cs:(%rax,%rax)
1402781e0:     	movl	0xf4(%rbp), %edx
1402781e6:     	movq	0xe8(%rbp), %r10
1402781ed:     	movl	%edx, (%r10)
1402781f0:     	movl	%r9d, 0x70(%rbx)
1402781f4:     	movshdup	%xmm4, %xmm4            # xmm4 = xmm4[1,1,3,3]
1402781f8:     	movss	%xmm4, 0x74(%rbx)
1402781fd:     	cmpb	$0x0, 0x107(%rbp)
140278204:     	je	0x1402782a0 <.text+0x2772a0>
14027820a:     	cmpl	%r8d, %r13d
14027820d:     	jne	0x1402783d4 <.text+0x2773d4>
140278213:     	movq	0x1a8(%rsi), %rdx
14027821a:     	nopw	(%rax,%rax)
140278220:     	cmpq	%rcx, %rax
140278223:     	je	0x1402786ea <.text+0x2776ea>
140278229:     	movl	(%rax), %r8d
14027822c:     	addq	$0x4, %rax
140278230:     	leaq	(%r8,%r8,8), %r9
140278234:     	movq	0x10(%rdx,%r9,8), %r8
140278239:     	testq	%r8, %r8
14027823c:     	je	0x140278220 <.text+0x277220>
14027823e:     	leaq	(%rdx,%r9,8), %r9
140278242:     	movq	0xb0(%rbp), %r11
140278249:     	movq	0x38(%r9), %rdx
14027824d:     	movq	0x40(%r9), %r10
140278251:     	cmpq	%r10, %r11
140278254:     	jae	0x14027833e <.text+0x27733e>
14027825a:     	movq	(%rdx,%r11,8), %r11
14027825e:     	movq	0x18(%r9), %r9
140278262:     	testq	%r11, %r11
140278265:     	je	0x14027837c <.text+0x27737c>
14027826b:     	notq	%r11
14027826e:     	leaq	(%r11,%r11,2), %r11
140278272:     	shlq	$0x4, %r11
140278276:     	movq	0x10(%r9,%r11), %r11
14027827b:     	movq	%r11, 0xf8(%rbp)
140278282:     	movq	0xc0(%rbp), %r11
140278289:     	cmpq	%r10, %r11
14027828c:     	jb	0x140278393 <.text+0x277393>
140278292:     	jmp	0x1402783ae <.text+0x2773ae>
140278297:     	nopw	(%rax,%rax)
1402782a0:     	cmpl	%r8d, %r13d
1402782a3:     	jne	0x14027843c <.text+0x27743c>
1402782a9:     	movq	0x108(%rsi), %rdx
1402782b0:     	cmpq	%rcx, %rax
1402782b3:     	je	0x1402786ea <.text+0x2776ea>
1402782b9:     	movl	(%rax), %r8d
1402782bc:     	addq	$0x4, %rax
1402782c0:     	leaq	(%r8,%r8,4), %r9
1402782c4:     	shlq	$0x5, %r9
1402782c8:     	movq	0x58(%rdx,%r9), %r8
1402782cd:     	testq	%r8, %r8
1402782d0:     	je	0x1402782b0 <.text+0x2772b0>
1402782d2:     	addq	%r9, %rdx
1402782d5:     	movl	0x94(%rdx), %r9d
1402782dc:     	movq	0x1a8(%rsi), %r11
1402782e3:     	leaq	(%r9,%r9,8), %rbx
1402782e7:     	leaq	(%r11,%rbx,8), %r10
1402782eb:     	movq	0xb0(%rbp), %rdi
1402782f2:     	movq	0x38(%r11,%rbx,8), %r9
1402782f7:     	movq	0x40(%r11,%rbx,8), %r11
1402782fc:     	cmpq	%r11, %rdi
1402782ff:     	jae	0x14027835b <.text+0x27735b>
140278301:     	movq	(%r9,%rdi,8), %rdi
140278305:     	movq	0x18(%r10), %r10
140278309:     	testq	%rdi, %rdi
14027830c:     	je	0x1402783d9 <.text+0x2773d9>
140278312:     	notq	%rdi
140278315:     	leaq	(%rdi,%rdi,2), %rdi
140278319:     	shlq	$0x4, %rdi
14027831d:     	movq	0x10(%r10,%rdi), %rdi
140278322:     	movq	%rdi, 0xf8(%rbp)
140278329:     	movq	0xc0(%rbp), %rdi
140278330:     	cmpq	%r11, %rdi
140278333:     	jb	0x1402783f0 <.text+0x2773f0>
140278339:     	jmp	0x14027840b <.text+0x27740b>
14027833e:     	movq	0x18(%r9), %r9
140278342:     	movq	$0x0, 0xf8(%rbp)
14027834d:     	movq	0xc0(%rbp), %r11
140278354:     	cmpq	%r10, %r11
140278357:     	jae	0x1402783ae <.text+0x2773ae>
140278359:     	jmp	0x140278393 <.text+0x277393>
14027835b:     	movq	0x18(%r10), %r10
14027835f:     	movq	$0x0, 0xf8(%rbp)
14027836a:     	movq	0xc0(%rbp), %rdi
140278371:     	cmpq	%r11, %rdi
140278374:     	jae	0x14027840b <.text+0x27740b>
14027837a:     	jmp	0x1402783f0 <.text+0x2773f0>
14027837c:     	movq	$0x0, 0xf8(%rbp)
140278387:     	movq	0xc0(%rbp), %r11
14027838e:     	cmpq	%r10, %r11
140278391:     	jae	0x1402783ae <.text+0x2773ae>
140278393:     	movq	(%rdx,%r11,8), %r10
140278397:     	testq	%r10, %r10
14027839a:     	je	0x1402783ae <.text+0x2773ae>
14027839c:     	notq	%r10
14027839f:     	leaq	(%r10,%r10,2), %r10
1402783a3:     	shlq	$0x4, %r10
1402783a7:     	movq	0x10(%r9,%r10), %r11
1402783ac:     	jmp	0x1402783b1 <.text+0x2773b1>
1402783ae:     	xorl	%r11d, %r11d
1402783b1:     	movq	0xb8(%rbp), %r10
1402783b8:     	movq	(%rdx,%r10,8), %rdx
1402783bc:     	notq	%rdx
1402783bf:     	leaq	(%rdx,%rdx,2), %rdx
1402783c3:     	shlq	$0x4, %rdx
1402783c7:     	movq	0x10(%r9,%rdx), %r14
1402783cc:     	movq	0x28(%r9,%rdx), %r12
1402783d1:     	xorl	%r13d, %r13d
1402783d4:     	movl	%r13d, %r9d
1402783d7:     	jmp	0x140278452 <.text+0x277452>
1402783d9:     	movq	$0x0, 0xf8(%rbp)
1402783e4:     	movq	0xc0(%rbp), %rdi
1402783eb:     	cmpq	%r11, %rdi
1402783ee:     	jae	0x14027840b <.text+0x27740b>
1402783f0:     	movq	(%r9,%rdi,8), %r11
1402783f4:     	testq	%r11, %r11
1402783f7:     	je	0x14027840b <.text+0x27740b>
1402783f9:     	notq	%r11
1402783fc:     	leaq	(%r11,%r11,2), %r11
140278400:     	shlq	$0x4, %r11
140278404:     	movq	0x10(%r10,%r11), %r11
140278409:     	jmp	0x14027840e <.text+0x27740e>
14027840b:     	xorl	%r11d, %r11d
14027840e:     	movq	0xb8(%rbp), %rdi
140278415:     	movq	(%r9,%rdi,8), %r9
140278419:     	notq	%r9
14027841c:     	leaq	(%r9,%r9,2), %r9
140278420:     	shlq	$0x4, %r9
140278424:     	movq	0x10(%r10,%r9), %r14
140278429:     	movq	0x28(%r10,%r9), %r12
14027842e:     	movq	0x50(%rdx), %rdx
140278432:     	movq	%rdx, 0xd8(%rbp)
140278439:     	xorl	%r13d, %r13d
14027843c:     	movl	%r13d, %edx
14027843f:     	shlq	$0x4, %rdx
140278443:     	movq	0xd8(%rbp), %r9
14027844a:     	movl	0x8(%r9,%rdx), %r9d
14027844f:     	notl	%r9d
140278452:     	movq	0xf8(%rbp), %rdx
140278459:     	addq	%r9, %rdx
14027845c:     	leaq	(%r9,%r9,2), %rbx
140278460:     	shlq	$0x7, %rbx
140278464:     	addq	%r14, %rbx
140278467:     	leaq	(%r12,%r9,4), %r10
14027846b:     	movq	%r10, 0xe8(%rbp)
140278472:     	imulq	$0x68, %r9, %r9
140278476:     	addq	%r11, %r9
140278479:     	movss	0x64(%r9), %xmm11
14027847f:     	movss	0x30(%r9), %xmm12
140278485:     	mulss	%xmm11, %xmm12
14027848a:     	mulss	0x34(%r9), %xmm11
140278490:     	cmpb	$0x0, (%rdx)
140278493:     	je	0x1402784b0 <.text+0x2774b0>
140278495:     	movaps	%xmm10, %xmm13
140278499:     	movaps	%xmm0, %xmm5
14027849c:     	movdqa	%xmm1, %xmm4
1402784a0:     	testb	$0x1, 0xe4(%rbp)
1402784a7:     	jne	0x1402784c1 <.text+0x2774c1>
1402784a9:     	jmp	0x14027850d <.text+0x27750d>
1402784ab:     	nopl	(%rax,%rax)
1402784b0:     	movaps	%xmm9, %xmm13
1402784b4:     	testb	$0x1, 0xe0(%rbp)
1402784bb:     	je	0x140278556 <.text+0x277556>
1402784c1:     	mulss	%xmm6, %xmm12
1402784c6:     	mulss	%xmm6, %xmm11
1402784cb:     	movaps	%xmm7, %xmm5
1402784ce:     	subss	%xmm12, %xmm5
1402784d3:     	movaps	%xmm8, %xmm4
1402784d7:     	subss	%xmm11, %xmm4
1402784dc:     	movlhps	%xmm13, %xmm5           # xmm5 = xmm5[0],xmm13[0]
1402784e0:     	shufps	$0xe2, %xmm13, %xmm5    # xmm5 = xmm5[2,0],xmm13[2,3]
1402784e5:     	maxps	%xmm2, %xmm5
1402784e8:     	shufps	$0xd4, %xmm13, %xmm4    # xmm4 = xmm4[0,1],xmm13[1,3]
1402784ed:     	shufps	$0xf2, %xmm13, %xmm4    # xmm4 = xmm4[2,0],xmm13[3,3]
1402784f2:     	maxps	%xmm2, %xmm4
1402784f5:     	movshdup	%xmm5, %xmm11           # xmm11 = xmm5[1,1,3,3]
1402784fa:     	minss	%xmm11, %xmm5
1402784ff:     	movshdup	%xmm4, %xmm11           # xmm11 = xmm4[1,1,3,3]
140278504:     	minss	%xmm11, %xmm4
140278509:     	divss	%xmm6, %xmm5
14027850d:     	divss	%xmm6, %xmm4
140278511:     	leaq	0x68(%rbx), %rdi
140278515:     	movl	0x68(%rbx), %r9d
140278519:     	leaq	0x6c(%rbx), %r15
14027851d:     	movl	$0x1, %r10d
140278523:     	testl	%r9d, %r9d
140278526:     	je	0x140278552 <.text+0x277552>
140278528:     	cmpl	$0x1, %r9d
14027852c:     	jne	0x140278578 <.text+0x277578>
14027852e:     	movss	(%r15), %xmm11
140278533:     	movb	$0x1, %dl
140278535:     	xorl	%r9d, %r9d
140278538:     	ucomiss	%xmm5, %xmm11
14027853c:     	jne	0x1402785a0 <.text+0x2775a0>
14027853e:     	jp	0x1402785a0 <.text+0x2775a0>
140278540:     	movl	0x78(%rbx), %r10d
140278544:     	testl	%r10d, %r10d
140278547:     	jne	0x140278607 <.text+0x277607>
14027854d:     	jmp	0x140278660 <.text+0x277660>
140278552:     	movb	$0x1, %dl
140278554:     	jmp	0x1402785a0 <.text+0x2775a0>
140278556:     	xorl	%r10d, %r10d
140278559:     	movl	$0x1, %r9d
14027855f:     	cmpl	$0x0, 0x68(%rbx)
140278563:     	je	0x140278649 <.text+0x277649>
140278569:     	leaq	0x68(%rbx), %rdi
14027856d:     	leaq	0x6c(%rbx), %r15
140278571:     	xorl	%edx, %edx
140278573:     	movaps	%xmm0, %xmm4
140278576:     	jmp	0x1402785a0 <.text+0x2775a0>
140278578:     	movss	(%r15), %xmm11
14027857d:     	xorl	%r9d, %r9d
140278580:     	ucomiss	%xmm3, %xmm11
140278584:     	movb	$0x1, %dl
140278586:     	jne	0x1402785a0 <.text+0x2775a0>
140278588:     	jp	0x1402785a0 <.text+0x2775a0>
14027858a:     	ucomiss	%xmm3, %xmm5
14027858d:     	jne	0x1402785a0 <.text+0x2775a0>
14027858f:     	jnp	0x140278540 <.text+0x277540>
140278591:     	nopw	%cs:(%rax,%rax)
1402785a0:     	movq	%r15, 0xc8(%rbp)
1402785a7:     	movl	%edx, %r15d
1402785aa:     	movl	%r10d, %edx
1402785ad:     	movl	%r13d, %r10d
1402785b0:     	movq	%r14, %r13
1402785b3:     	movq	%r12, %r14
1402785b6:     	movq	%r11, %r12
1402785b9:     	movl	0xf4(%rbp), %r11d
1402785c0:     	movq	%rsi, %rcx
1402785c3:     	movl	%r9d, %esi
1402785c6:     	movq	%rdi, %r9
1402785c9:     	movq	0xe8(%rbp), %rdi
1402785d0:     	movl	%r11d, (%rdi)
1402785d3:     	movq	%r12, %r11
1402785d6:     	movq	%r14, %r12
1402785d9:     	movq	%r13, %r14
1402785dc:     	movl	%r10d, %r13d
1402785df:     	movl	%edx, (%r9)
1402785e2:     	movl	%esi, %r9d
1402785e5:     	movq	%rcx, %rsi
1402785e8:     	movl	%r15d, %edx
1402785eb:     	movq	0xd0(%rbp), %rcx
1402785f2:     	movq	0xc8(%rbp), %r10
1402785f9:     	movss	%xmm5, (%r10)
1402785fe:     	movl	0x78(%rbx), %r10d
140278602:     	testl	%r10d, %r10d
140278605:     	je	0x140278660 <.text+0x277660>
140278607:     	cmpl	$0x1, %r10d
14027860b:     	jne	0x14027861b <.text+0x27761b>
14027860d:     	movss	0x7c(%rbx), %xmm5
140278612:     	ucomiss	%xmm4, %xmm5
140278615:     	jne	0x140278660 <.text+0x277660>
140278617:     	jnp	0x140278630 <.text+0x277630>
140278619:     	jmp	0x140278660 <.text+0x277660>
14027861b:     	movss	0x7c(%rbx), %xmm5
140278620:     	ucomiss	%xmm3, %xmm5
140278623:     	jne	0x140278660 <.text+0x277660>
140278625:     	jp	0x140278660 <.text+0x277660>
140278627:     	ucomiss	%xmm3, %xmm4
14027862a:     	jne	0x140278660 <.text+0x277660>
14027862c:     	jp	0x140278660 <.text+0x277660>
14027862e:     	nop
140278630:     	incl	%r13d
140278633:     	movl	0x70(%rbx), %r10d
140278637:     	testb	%dl, %dl
140278639:     	je	0x140278688 <.text+0x277688>
14027863b:     	orl	%r9d, %r10d
14027863e:     	je	0x1402781fd <.text+0x2771fd>
140278644:     	jmp	0x1402781e0 <.text+0x2771e0>
140278649:     	xorl	%edx, %edx
14027864b:     	movaps	%xmm0, %xmm4
14027864e:     	movl	0x78(%rbx), %r10d
140278652:     	testl	%r10d, %r10d
140278655:     	jne	0x140278607 <.text+0x277607>
140278657:     	nopw	(%rax,%rax)
140278660:     	movl	0xf4(%rbp), %r10d
140278667:     	movq	0xe8(%rbp), %rdi
14027866e:     	movl	%r10d, (%rdi)
140278671:     	movl	$0x1, 0x78(%rbx)
140278678:     	movss	%xmm4, 0x7c(%rbx)
14027867d:     	incl	%r13d
140278680:     	movl	0x70(%rbx), %r10d
140278684:     	testb	%dl, %dl
140278686:     	jne	0x14027863b <.text+0x27763b>
140278688:     	cmpl	%r10d, %r9d
14027868b:     	jne	0x1402786b5 <.text+0x2776b5>
14027868d:     	testl	%r10d, %r10d
140278690:     	je	0x1402781e0 <.text+0x2771e0>
140278696:     	movss	0x74(%rbx), %xmm5
14027869b:     	movshdup	%xmm4, %xmm11           # xmm11 = xmm4[1,1,3,3]
1402786a0:     	ucomiss	%xmm11, %xmm5
1402786a4:     	jne	0x1402781e0 <.text+0x2771e0>
1402786aa:     	jnp	0x1402781fd <.text+0x2771fd>
1402786b0:     	jmp	0x1402781e0 <.text+0x2771e0>
1402786b5:     	testl	%r10d, %r10d
1402786b8:     	je	0x1402781e0 <.text+0x2771e0>
1402786be:     	movss	0x74(%rbx), %xmm5
1402786c3:     	ucomiss	%xmm3, %xmm5
1402786c6:     	jne	0x1402781e0 <.text+0x2771e0>
1402786cc:     	jp	0x1402781e0 <.text+0x2771e0>
1402786d2:     	movshdup	%xmm4, %xmm5            # xmm5 = xmm4[1,1,3,3]
1402786d6:     	ucomiss	%xmm3, %xmm5
1402786d9:     	jne	0x1402781e0 <.text+0x2771e0>
1402786df:     	jnp	0x1402781fd <.text+0x2771fd>
1402786e5:     	jmp	0x1402781e0 <.text+0x2771e0>
1402786ea:     	leaq	-0x60(%rbp), %rcx
1402786ee:     	callq	0x14003b160 <.text+0x3a160>
1402786f3:     	movaps	0x110(%rbp), %xmm6
1402786fa:     	movaps	0x120(%rbp), %xmm7
140278701:     	movaps	0x130(%rbp), %xmm8
140278709:     	movaps	0x140(%rbp), %xmm9
140278711:     	movaps	0x150(%rbp), %xmm10
140278719:     	movaps	0x160(%rbp), %xmm11
140278721:     	movaps	0x170(%rbp), %xmm12
140278729:     	movaps	0x180(%rbp), %xmm13
140278731:     	addq	$0x218, %rsp            # imm = 0x218
140278738:     	popq	%rbx
140278739:     	popq	%rdi
14027873a:     	popq	%rsi
14027873b:     	popq	%r12
14027873d:     	popq	%r13
14027873f:     	popq	%r14
140278741:     	popq	%r15
140278743:     	popq	%rbp
140278744:     	retq
140278745:     	leaq	0x5b5542c(%rip), %r8    # 0x145dcdb78
14027874c:     	callq	0x145d270f0 <.text+0x5d260f0>
140278751:     	nop
140278752:     	ud2
