
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1403a1cc0:     	pushq	%rbp
1403a1cc1:     	pushq	%r15
1403a1cc3:     	pushq	%r14
1403a1cc5:     	pushq	%r13
1403a1cc7:     	pushq	%r12
1403a1cc9:     	pushq	%rsi
1403a1cca:     	pushq	%rdi
1403a1ccb:     	pushq	%rbx
1403a1ccc:     	subq	$0x448, %rsp            # imm = 0x448
1403a1cd3:     	leaq	0x80(%rsp), %rbp
1403a1cdb:     	movaps	%xmm6, 0x3b0(%rbp)
1403a1ce2:     	movq	$-0x2, 0x3a8(%rbp)
1403a1ced:     	movq	0x430(%rbp), %rax
1403a1cf4:     	movq	0x20(%rdx), %rcx
1403a1cf8:     	movq	%rcx, 0x300(%rbp)
1403a1cff:     	movups	(%rdx), %xmm0
1403a1d02:     	movups	0x10(%rdx), %xmm1
1403a1d06:     	movaps	%xmm1, 0x2f0(%rbp)
1403a1d0d:     	movaps	%xmm0, 0x2e0(%rbp)
1403a1d14:     	movups	(%r8), %xmm0
1403a1d18:     	movups	0x10(%r8), %xmm1
1403a1d1d:     	movups	%xmm1, 0x318(%rbp)
1403a1d24:     	movups	%xmm0, 0x308(%rbp)
1403a1d2b:     	movups	(%r9), %xmm0
1403a1d2f:     	movups	0x10(%r9), %xmm1
1403a1d34:     	movups	%xmm1, 0x338(%rbp)
1403a1d3b:     	movups	%xmm0, 0x328(%rbp)
1403a1d42:     	movq	0x10(%rax), %rcx
1403a1d46:     	movq	%rcx, 0x358(%rbp)
1403a1d4d:     	movups	(%rax), %xmm0
1403a1d50:     	movups	%xmm0, 0x348(%rbp)
1403a1d57:     	movq	0x328(%rbp), %rax
1403a1d5e:     	cmpb	$0x1, 0x72(%rax)
1403a1d62:     	jne	0x1403a1d8c <.text+0x3a0d8c>
1403a1d64:     	movq	0x308(%rbp), %rcx
1403a1d6b:     	cmpb	$0x1, 0xd(%rcx)
1403a1d6f:     	jne	0x1403a1d79 <.text+0x3a0d79>
1403a1d71:     	movzbl	(%rcx), %ebx
1403a1d74:     	xorb	$0x1, %bl
1403a1d77:     	jmp	0x1403a1d8e <.text+0x3a0d8e>
1403a1d79:     	movl	0x344(%rbp), %ecx
1403a1d7f:     	movq	0x338(%rbp), %rdx
1403a1d86:     	movl	%ecx, (%rdx)
1403a1d88:     	movb	$0x0, 0x72(%rax)
1403a1d8c:     	xorl	%ebx, %ebx
1403a1d8e:     	movq	0x348(%rbp), %rax
1403a1d95:     	movq	0x350(%rbp), %r14
1403a1d9c:     	movq	0xf8(%rax), %r15
1403a1da3:     	movq	0x100(%rax), %rcx
1403a1daa:     	movzbl	0x108(%rax), %eax
1403a1db1:     	leaq	(,%rcx,4), %rdx
1403a1db9:     	xorl	%r8d, %r8d
1403a1dbc:     	testb	%al, %al
1403a1dbe:     	je	0x1403a1df0 <.text+0x3a0df0>
1403a1dc0:     	cmpq	%r8, %rdx
1403a1dc3:     	je	0x1403a1e1d <.text+0x3a0e1d>
1403a1dc5:     	movl	(%r15,%r8), %r9d
1403a1dc9:     	movq	0x1a8(%r14), %r10
1403a1dd0:     	leaq	(%r9,%r9,8), %r9
1403a1dd4:     	addq	$0x4, %r8
1403a1dd8:     	cmpq	$0x0, 0x10(%r10,%r9,8)
1403a1dde:     	je	0x1403a1dc0 <.text+0x3a0dc0>
1403a1de0:     	jmp	0x1403a1e14 <.text+0x3a0e14>
1403a1de2:     	nopw	%cs:(%rax,%rax)
1403a1df0:     	cmpq	%r8, %rdx
1403a1df3:     	je	0x1403a1e1d <.text+0x3a0e1d>
1403a1df5:     	movl	(%r15,%r8), %r9d
1403a1df9:     	movq	0x108(%r14), %r10
1403a1e00:     	leaq	(%r9,%r9,4), %r9
1403a1e04:     	shlq	$0x5, %r9
1403a1e08:     	addq	$0x4, %r8
1403a1e0c:     	cmpq	$0x0, 0x58(%r10,%r9)
1403a1e12:     	je	0x1403a1df0 <.text+0x3a0df0>
1403a1e14:     	testb	%bl, %bl
1403a1e16:     	je	0x1403a1e25 <.text+0x3a0e25>
1403a1e18:     	jmp	0x1403a2389 <.text+0x3a1389>
1403a1e1d:     	testb	%bl, %bl
1403a1e1f:     	je	0x1403a2389 <.text+0x3a1389>
1403a1e25:     	leaq	(%r15,%rcx,4), %r12
1403a1e29:     	movq	0x2f0(%rbp), %rdx
1403a1e30:     	movq	0x300(%rbp), %r8
1403a1e37:     	movq	0x2f8(%rbp), %r9
1403a1e3e:     	movq	0x2e0(%rbp), %r10
1403a1e45:     	movq	0x2e8(%rbp), %r11
1403a1e4c:     	xorl	%esi, %esi
1403a1e4e:     	movl	$0x8, %edi
1403a1e53:     	testb	%al, %al
1403a1e55:     	je	0x1403a1f53 <.text+0x3a0f53>
1403a1e5b:     	xorl	%r13d, %r13d
1403a1e5e:     	cmpl	%esi, %r13d
1403a1e61:     	je	0x1403a1e90 <.text+0x3a0e90>
1403a1e63:     	nopw	%cs:(%rax,%rax)
1403a1e70:     	movl	%r13d, %eax
1403a1e73:     	incl	%r13d
1403a1e76:     	movq	(%rdi,%rax,8), %rax
1403a1e7a:     	testl	%eax, %eax
1403a1e7c:     	jne	0x1403a1ec2 <.text+0x3a0ec2>
1403a1e7e:     	cmpl	%esi, %r13d
1403a1e81:     	jne	0x1403a1e70 <.text+0x3a0e70>
1403a1e83:     	nopw	%cs:(%rax,%rax)
1403a1e90:     	cmpq	%r12, %r15
1403a1e93:     	je	0x1403a2046 <.text+0x3a1046>
1403a1e99:     	movl	(%r15), %ecx
1403a1e9c:     	addq	$0x4, %r15
1403a1ea0:     	movq	0x1a8(%r14), %rax
1403a1ea7:     	leaq	(%rcx,%rcx,8), %rcx
1403a1eab:     	movq	0x10(%rax,%rcx,8), %rsi
1403a1eb0:     	testq	%rsi, %rsi
1403a1eb3:     	je	0x1403a1e90 <.text+0x3a0e90>
1403a1eb5:     	leaq	(%rax,%rcx,8), %rax
1403a1eb9:     	movq	0x8(%rax), %rdi
1403a1ebd:     	xorl	%r13d, %r13d
1403a1ec0:     	jmp	0x1403a1e70 <.text+0x3a0e70>
1403a1ec2:     	testq	%rdx, %rdx
1403a1ec5:     	movq	0x390(%rbp), %rcx
1403a1ecc:     	cmovneq	%r8, %rcx
1403a1ed0:     	movq	%rax, -0x60(%rbp)
1403a1ed4:     	movq	%r10, -0x58(%rbp)
1403a1ed8:     	movq	%r11, -0x50(%rbp)
1403a1edc:     	movq	%rdx, -0x48(%rbp)
1403a1ee0:     	movq	%r9, -0x40(%rbp)
1403a1ee4:     	movq	%rcx, 0x390(%rbp)
1403a1eeb:     	movq	%rcx, -0x38(%rbp)
1403a1eef:     	leaq	-0x60(%rbp), %rcx
1403a1ef3:     	movq	%rdx, 0x398(%rbp)
1403a1efa:     	leaq	0x55ae54f(%rip), %rdx   # 0x145950450
1403a1f01:     	movq	%r8, 0x3a0(%rbp)
1403a1f08:     	movq	%r9, 0x378(%rbp)
1403a1f0f:     	movq	%r10, 0x380(%rbp)
1403a1f16:     	movq	%r11, 0x388(%rbp)
1403a1f1d:     	callq	0x144e62740 <.text+0x4e61740>
1403a1f22:     	movq	0x388(%rbp), %r11
1403a1f29:     	movq	0x380(%rbp), %r10
1403a1f30:     	movq	0x378(%rbp), %r9
1403a1f37:     	movq	0x3a0(%rbp), %r8
1403a1f3e:     	movq	0x398(%rbp), %rdx
1403a1f45:     	cmpl	%esi, %r13d
1403a1f48:     	je	0x1403a1e90 <.text+0x3a0e90>
1403a1f4e:     	jmp	0x1403a1e70 <.text+0x3a0e70>
1403a1f53:     	xorl	%r13d, %r13d
1403a1f56:     	cmpl	%esi, %r13d
1403a1f59:     	je	0x1403a1f80 <.text+0x3a0f80>
1403a1f5b:     	nopl	(%rax,%rax)
1403a1f60:     	movl	%r13d, %eax
1403a1f63:     	shlq	$0x4, %rax
1403a1f67:     	incl	%r13d
1403a1f6a:     	movq	(%rdi,%rax), %rax
1403a1f6e:     	testl	%eax, %eax
1403a1f70:     	jne	0x1403a1fb5 <.text+0x3a0fb5>
1403a1f72:     	cmpl	%esi, %r13d
1403a1f75:     	jne	0x1403a1f60 <.text+0x3a0f60>
1403a1f77:     	nopw	(%rax,%rax)
1403a1f80:     	cmpq	%r12, %r15
1403a1f83:     	je	0x1403a2046 <.text+0x3a1046>
1403a1f89:     	movl	(%r15), %ecx
1403a1f8c:     	addq	$0x4, %r15
1403a1f90:     	movq	0x108(%r14), %rax
1403a1f97:     	leaq	(%rcx,%rcx,4), %rcx
1403a1f9b:     	shlq	$0x5, %rcx
1403a1f9f:     	movq	0x58(%rax,%rcx), %rsi
1403a1fa4:     	testq	%rsi, %rsi
1403a1fa7:     	je	0x1403a1f80 <.text+0x3a0f80>
1403a1fa9:     	addq	%rcx, %rax
1403a1fac:     	movq	0x50(%rax), %rdi
1403a1fb0:     	xorl	%r13d, %r13d
1403a1fb3:     	jmp	0x1403a1f60 <.text+0x3a0f60>
1403a1fb5:     	testq	%rdx, %rdx
1403a1fb8:     	movq	0x390(%rbp), %rcx
1403a1fbf:     	cmovneq	%r8, %rcx
1403a1fc3:     	movq	%rax, -0x60(%rbp)
1403a1fc7:     	movq	%r10, -0x58(%rbp)
1403a1fcb:     	movq	%r11, -0x50(%rbp)
1403a1fcf:     	movq	%rdx, -0x48(%rbp)
1403a1fd3:     	movq	%r9, -0x40(%rbp)
1403a1fd7:     	movq	%rcx, 0x390(%rbp)
1403a1fde:     	movq	%rcx, -0x38(%rbp)
1403a1fe2:     	leaq	-0x60(%rbp), %rcx
1403a1fe6:     	movq	%rdx, 0x398(%rbp)
1403a1fed:     	leaq	0x55ae45c(%rip), %rdx   # 0x145950450
1403a1ff4:     	movq	%r8, 0x3a0(%rbp)
1403a1ffb:     	movq	%r9, 0x378(%rbp)
1403a2002:     	movq	%r10, 0x380(%rbp)
1403a2009:     	movq	%r11, 0x388(%rbp)
1403a2010:     	callq	0x144e62740 <.text+0x4e61740>
1403a2015:     	movq	0x388(%rbp), %r11
1403a201c:     	movq	0x380(%rbp), %r10
1403a2023:     	movq	0x378(%rbp), %r9
1403a202a:     	movq	0x3a0(%rbp), %r8
1403a2031:     	movq	0x398(%rbp), %rdx
1403a2038:     	cmpl	%esi, %r13d
1403a203b:     	je	0x1403a1f80 <.text+0x3a0f80>
1403a2041:     	jmp	0x1403a1f60 <.text+0x3a0f60>
1403a2046:     	testb	%bl, %bl
1403a2048:     	je	0x1403a2389 <.text+0x3a1389>
1403a204e:     	movw	$0x0, 0x2c4(%rbp)
1403a2057:     	movb	$0x1, 0x2b4(%rbp)
1403a205e:     	xorps	%xmm0, %xmm0
1403a2061:     	movups	%xmm0, 0x1c8(%rbp)
1403a2068:     	movups	%xmm0, 0x1d8(%rbp)
1403a206f:     	movaps	0x55543ea(%rip), %xmm1  # 0x1458f6460
1403a2076:     	movups	%xmm1, 0x1e8(%rbp)
1403a207d:     	movq	$0x0, 0x1c0(%rbp)
1403a2088:     	movups	%xmm0, 0x1f8(%rbp)
1403a208f:     	movups	%xmm0, 0x208(%rbp)
1403a2096:     	movl	$0x0, 0x2d8(%rbp)
1403a20a0:     	movw	$0x0, 0x2dc(%rbp)
1403a20a9:     	movups	0x55ae118(%rip), %xmm0  # 0x1459501c8
1403a20b0:     	movups	%xmm0, 0x218(%rbp)
1403a20b7:     	movups	0x55ae11a(%rip), %xmm0  # 0x1459501d8
1403a20be:     	movups	%xmm0, 0x228(%rbp)
1403a20c5:     	movups	0x55ae11c(%rip), %xmm0  # 0x1459501e8
1403a20cc:     	movups	%xmm0, 0x238(%rbp)
1403a20d3:     	movups	0x55ae11e(%rip), %xmm0  # 0x1459501f8
1403a20da:     	movups	%xmm0, 0x248(%rbp)
1403a20e1:     	movups	0x55ae130(%rip), %xmm0  # 0x145950218
1403a20e8:     	movups	%xmm0, 0x268(%rbp)
1403a20ef:     	movups	0x55ae112(%rip), %xmm0  # 0x145950208
1403a20f6:     	movups	%xmm0, 0x258(%rbp)
1403a20fd:     	movups	0x55ae134(%rip), %xmm0  # 0x145950238
1403a2104:     	movups	%xmm0, 0x288(%rbp)
1403a210b:     	movups	0x55ae116(%rip), %xmm0  # 0x145950228
1403a2112:     	movups	%xmm0, 0x278(%rbp)
1403a2119:     	movw	$0x0, 0x2d6(%rbp)
1403a2122:     	movl	$0x100, 0x2d2(%rbp)     # imm = 0x100
1403a212c:     	movq	$0x0, 0x2b8(%rbp)
1403a2137:     	movl	$0x3f800000, 0x2c0(%rbp) # imm = 0x3F800000
1403a2141:     	movaps	0x5549368(%rip), %xmm0  # 0x1458eb4b0
1403a2148:     	movups	%xmm0, 0x298(%rbp)
1403a214f:     	movl	$0x1, 0x2a8(%rbp)
1403a2159:     	movq	$0x0, 0x2ac(%rbp)
1403a2164:     	movups	0x55adfa5(%rip), %xmm0  # 0x145950110
1403a216b:     	movaps	%xmm0, 0x160(%rbp)
1403a2172:     	movq	$0x0, 0x170(%rbp)
1403a217d:     	movups	0x55adfa4(%rip), %xmm0  # 0x145950128
1403a2184:     	movups	%xmm0, 0x178(%rbp)
1403a218b:     	movq	$0x0, 0x188(%rbp)
1403a2196:     	movups	0x55adfa3(%rip), %xmm0  # 0x145950140
1403a219d:     	movaps	%xmm0, 0x190(%rbp)
1403a21a4:     	movq	$0x0, 0x1a0(%rbp)
1403a21af:     	movups	0x55adfa2(%rip), %xmm0  # 0x145950158
1403a21b6:     	movups	%xmm0, 0x1a8(%rbp)
1403a21bd:     	movq	$0x0, 0x1b8(%rbp)
1403a21c8:     	movw	$0x0, 0x2ca(%rbp)
1403a21d1:     	movl	$0x10000, 0x2c6(%rbp)   # imm = 0x10000
1403a21db:     	movw	$0x0, 0x2d0(%rbp)
1403a21e4:     	movl	$0x10000, 0x2cc(%rbp)   # imm = 0x10000
1403a21ee:     	callq	0x140002200 <.text+0x1200>
1403a21f3:     	movl	$0x48, %ecx
1403a21f8:     	movl	$0x8, %edx
1403a21fd:     	callq	0x1400021c0 <.text+0x11c0>
1403a2202:     	testq	%rax, %rax
1403a2205:     	je	0x1403a23a4 <.text+0x3a13a4>
1403a220b:     	movq	%rax, 0x398(%rbp)
1403a2212:     	callq	0x140002200 <.text+0x1200>
1403a2217:     	movl	$0x40, %ecx
1403a221c:     	movl	$0x4, %edx
1403a2221:     	callq	0x1400021c0 <.text+0x11c0>
1403a2226:     	testq	%rax, %rax
1403a2229:     	je	0x1403a23b6 <.text+0x3a13b6>
1403a222f:     	movq	%rax, 0x3a0(%rbp)
1403a2236:     	movaps	0x55ad113(%rip), %xmm0  # 0x14594f350
1403a223d:     	movups	%xmm0, -0x5c(%rbp)
1403a2241:     	movl	$0x0, -0x60(%rbp)
1403a2248:     	leaq	0x360(%rbp), %rcx
1403a224f:     	leaq	-0x60(%rbp), %rdx
1403a2253:     	callq	0x144c79aa0 <.text+0x4c78aa0>
1403a2258:     	nop
1403a2259:     	movaps	0x360(%rbp), %xmm6
1403a2260:     	movups	0x55ae1b9(%rip), %xmm0  # 0x145950420
1403a2267:     	movaps	%xmm0, -0x60(%rbp)
1403a226b:     	movl	$0x0, -0x50(%rbp)
1403a2272:     	leaq	0x360(%rbp), %rcx
1403a2279:     	leaq	-0x60(%rbp), %rdx
1403a227d:     	callq	0x144c79aa0 <.text+0x4c78aa0>
1403a2282:     	nop
1403a2283:     	movaps	0x360(%rbp), %xmm0
1403a228a:     	movq	0x3a0(%rbp), %rax
1403a2291:     	movq	$0x2, (%rax)
1403a2298:     	movl	$0x1, 0x8(%rax)
1403a229f:     	movups	%xmm6, 0xc(%rax)
1403a22a3:     	movaps	0x555ab26(%rip), %xmm1  # 0x1458fcdd0
1403a22aa:     	movups	%xmm1, 0x1c(%rax)
1403a22ae:     	movups	%xmm0, 0x2c(%rax)
1403a22b2:     	movl	$0x3f000000, 0x3c(%rax) # imm = 0x3F000000
1403a22b9:     	movq	0x398(%rbp), %rdi
1403a22c0:     	movq	$0x2, (%rdi)
1403a22c7:     	movq	%rax, 0x8(%rdi)
1403a22cb:     	movq	$0x2, 0x10(%rdi)
1403a22d3:     	movq	$0x2, 0x18(%rdi)
1403a22db:     	movl	$0x2, 0x20(%rdi)
1403a22e2:     	movss	0x55918b6(%rip), %xmm0  # 0x145933ba0
1403a22ea:     	movlps	%xmm0, 0x24(%rdi)
1403a22ee:     	movabsq	$0xa00000000, %rax      # imm = 0xA00000000
1403a22f8:     	movq	%rax, 0x2c(%rdi)
1403a22fc:     	movb	$0x0, 0x40(%rdi)
1403a2300:     	leaq	-0x60(%rbp), %rsi
1403a2304:     	leaq	0x160(%rbp), %rdx
1403a230b:     	movl	$0x180, %r8d            # imm = 0x180
1403a2311:     	movq	%rsi, %rcx
1403a2314:     	callq	0x145756ddd <.text+0x5755ddd>
1403a2319:     	movl	$0x0, 0x138(%rbp)
1403a2323:     	movaps	0x55ad036(%rip), %xmm0  # 0x14594f360
1403a232a:     	movups	%xmm0, 0x13c(%rbp)
1403a2331:     	movq	$0x1, 0x120(%rbp)
1403a233c:     	movq	%rdi, 0x128(%rbp)
1403a2343:     	movq	$0x1, 0x130(%rbp)
1403a234e:     	movl	$0x1518, 0x14c(%rbp)    # imm = 0x1518
1403a2358:     	movw	$0x2, 0x150(%rbp)
1403a2361:     	leaq	0x55ae0d0(%rip), %r9    # 0x145950438
1403a2368:     	leaq	0x160(%rbp), %rdi
1403a236f:     	leaq	0x2e0(%rbp), %rdx
1403a2376:     	movq	%rdi, %rcx
1403a2379:     	movq	%rsi, %r8
1403a237c:     	callq	0x1401fad90 <.text+0x1f9d90>
1403a2381:     	movq	%rdi, %rcx
1403a2384:     	callq	0x140233c70 <.text+0x232c70>
1403a2389:     	movaps	0x3b0(%rbp), %xmm6
1403a2390:     	addq	$0x448, %rsp            # imm = 0x448
1403a2397:     	popq	%rbx
1403a2398:     	popq	%rdi
1403a2399:     	popq	%rsi
1403a239a:     	popq	%r12
1403a239c:     	popq	%r13
1403a239e:     	popq	%r14
1403a23a0:     	popq	%r15
1403a23a2:     	popq	%rbp
1403a23a3:     	retq
1403a23a4:     	movl	$0x8, %ecx
1403a23a9:     	movl	$0x48, %edx
1403a23ae:     	callq	0x1458e7201 <.text+0x58e6201>
1403a23b3:     	nop
1403a23b4:     	jmp	0x1403a23c6 <.text+0x3a13c6>
1403a23b6:     	movl	$0x4, %ecx
1403a23bb:     	movl	$0x40, %edx
1403a23c0:     	callq	0x1458e7201 <.text+0x58e6201>
1403a23c5:     	nop
1403a23c6:     	ud2
