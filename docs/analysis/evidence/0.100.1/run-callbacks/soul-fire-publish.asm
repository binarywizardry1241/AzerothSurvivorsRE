
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e7d80:     	pushq	%rbp
1454e7d81:     	pushq	%r15
1454e7d83:     	pushq	%r14
1454e7d85:     	pushq	%r13
1454e7d87:     	pushq	%r12
1454e7d89:     	pushq	%rsi
1454e7d8a:     	pushq	%rdi
1454e7d8b:     	pushq	%rbx
1454e7d8c:     	subq	$0x1b8, %rsp            # imm = 0x1B8
1454e7d93:     	leaq	0x80(%rsp), %rbp
1454e7d9b:     	movaps	%xmm15, 0x120(%rbp)
1454e7da3:     	movaps	%xmm14, 0x110(%rbp)
1454e7dab:     	movaps	%xmm13, 0x100(%rbp)
1454e7db3:     	movaps	%xmm12, 0xf0(%rbp)
1454e7dbb:     	movaps	%xmm11, 0xe0(%rbp)
1454e7dc3:     	movaps	%xmm10, 0xd0(%rbp)
1454e7dcb:     	movaps	%xmm9, 0xc0(%rbp)
1454e7dd3:     	movaps	%xmm8, 0xb0(%rbp)
1454e7ddb:     	movaps	%xmm7, 0xa0(%rbp)
1454e7de2:     	movaps	%xmm6, 0x90(%rbp)
1454e7de9:     	movq	$-0x2, 0x88(%rbp)
1454e7df4:     	cmpl	$0x5, 0x7f0(%rcx)
1454e7dfb:     	jb	0x1454e8633 <.text+0x54e7633>
1454e7e01:     	movq	%rcx, %rsi
1454e7e04:     	movss	0x934(%rcx), %xmm0
1454e7e0c:     	movq	0x748(%rcx), %rcx
1454e7e13:     	movss	0x520495(%rip), %xmm1   # 0x145a082b0
1454e7e1b:     	testq	%rcx, %rcx
1454e7e1e:     	je	0x1454e7e6f <.text+0x54e6e6f>
1454e7e20:     	movq	0x740(%rsi), %rax
1454e7e27:     	shlq	$0x3, %rcx
1454e7e2b:     	leaq	(%rcx,%rcx,2), %rdx
1454e7e2f:     	xorl	%ecx, %ecx
1454e7e31:     	movabsq	$0x7269665f6c756f73, %r8 # imm = 0x7269665F6C756F73
1454e7e3b:     	jmp	0x1454e7e49 <.text+0x54e6e49>
1454e7e3d:     	nopl	(%rax)
1454e7e40:     	addq	$0x18, %rcx
1454e7e44:     	cmpq	%rcx, %rdx
1454e7e47:     	je	0x1454e7e6f <.text+0x54e6e6f>
1454e7e49:     	cmpq	$0x9, 0x8(%rax,%rcx)
1454e7e4f:     	jne	0x1454e7e40 <.text+0x54e6e40>
1454e7e51:     	movq	(%rax,%rcx), %r9
1454e7e55:     	movq	(%r9), %r10
1454e7e58:     	xorq	%r8, %r10
1454e7e5b:     	movzbl	0x8(%r9), %r9d
1454e7e60:     	xorq	$0x65, %r9
1454e7e64:     	orq	%r10, %r9
1454e7e67:     	jne	0x1454e7e40 <.text+0x54e6e40>
1454e7e69:     	movss	0x10(%rax,%rcx), %xmm1
1454e7e6f:     	ucomiss	%xmm1, %xmm0
1454e7e72:     	jb	0x1454e8633 <.text+0x54e7633>
1454e7e78:     	movq	0x2b8(%rsi), %rcx
1454e7e7f:     	testq	%rcx, %rcx
1454e7e82:     	je	0x1454e8633 <.text+0x54e7633>
1454e7e88:     	movq	0x2b0(%rsi), %rax
1454e7e8f:     	imulq	$0x58, %rcx, %rdx
1454e7e93:     	xorl	%ecx, %ecx
1454e7e95:     	movabsq	$0x7269665f6c756f73, %r8 # imm = 0x7269665F6C756F73
1454e7e9f:     	jmp	0x1454e7ebd <.text+0x54e6ebd>
1454e7ea1:     	nopw	%cs:(%rax,%rax)
1454e7eb0:     	addq	$0x58, %rcx
1454e7eb4:     	cmpq	%rcx, %rdx
1454e7eb7:     	je	0x1454e8633 <.text+0x54e7633>
1454e7ebd:     	movq	(%rax,%rcx), %r12
1454e7ec1:     	cmpq	$0x9, 0x8(%r12)
1454e7ec7:     	jne	0x1454e7eb0 <.text+0x54e6eb0>
1454e7ec9:     	movq	(%r12), %r9
1454e7ecd:     	movq	(%r9), %r10
1454e7ed0:     	xorq	%r8, %r10
1454e7ed3:     	movzbl	0x8(%r9), %r9d
1454e7ed8:     	xorq	$0x65, %r9
1454e7edc:     	orq	%r10, %r9
1454e7edf:     	jne	0x1454e7eb0 <.text+0x54e6eb0>
1454e7ee1:     	movl	0x8(%rax,%rcx), %r8d
1454e7ee6:     	movss	0x14(%rax,%rcx), %xmm0
1454e7eec:     	movl	0x18(%rax,%rcx), %edx
1454e7ef0:     	movl	0x34(%rax,%rcx), %r9d
1454e7ef5:     	movl	%r9d, 0xc(%rbp)
1454e7ef9:     	movups	0x24(%rax,%rcx), %xmm1
1454e7efe:     	movups	%xmm1, -0x4(%rbp)
1454e7f02:     	movups	0x38(%rax,%rcx), %xmm1
1454e7f07:     	movups	0x44(%rax,%rcx), %xmm2
1454e7f0c:     	movups	%xmm2, 0x1c(%rbp)
1454e7f10:     	movups	%xmm1, 0x10(%rbp)
1454e7f14:     	movq	%r12, -0x28(%rbp)
1454e7f18:     	movl	%r8d, -0x20(%rbp)
1454e7f1c:     	movss	0x10(%rax,%rcx), %xmm6
1454e7f22:     	movsd	0xc(%rax,%rcx), %xmm1
1454e7f28:     	movsd	%xmm1, -0x1c(%rbp)
1454e7f2d:     	movss	%xmm0, -0x14(%rbp)
1454e7f32:     	movl	%edx, -0x10(%rbp)
1454e7f35:     	movsd	0x1c(%rax,%rcx), %xmm0
1454e7f3b:     	movsd	%xmm0, -0xc(%rbp)
1454e7f40:     	movss	0x470(%rsi), %xmm7
1454e7f48:     	addl	0x4a4(%rsi), %edx
1454e7f4e:     	movl	0x54(%r12), %eax
1454e7f53:     	addl	%eax, %edx
1454e7f55:     	addl	0x18(%rbp), %edx
1454e7f58:     	movss	0x474(%rsi), %xmm8
1454e7f61:     	testl	%eax, %eax
1454e7f63:     	cmovel	%eax, %edx
1454e7f66:     	cmpl	$0x3, %edx
1454e7f69:     	movl	$0x3, %eax
1454e7f6e:     	cmovbl	%edx, %eax
1454e7f71:     	testl	%edx, %edx
1454e7f73:     	movl	$0x1, %r14d
1454e7f79:     	cmovnel	%eax, %r14d
1454e7f7d:     	movq	$0x0, 0x58(%rbp)
1454e7f85:     	movq	$0x8, 0x60(%rbp)
1454e7f8d:     	movq	$0x0, 0x68(%rbp)
1454e7f95:     	testl	%r14d, %r14d
1454e7f98:     	je	0x1454e8250 <.text+0x54e7250>
1454e7f9e:     	xorl	%edi, %edi
1454e7fa0:     	xorps	%xmm10, %xmm10
1454e7fa4:     	movabsq	$0x7fffffffffffffc, %r15 # imm = 0x7FFFFFFFFFFFFFC
1454e7fae:     	movl	$0x8, %eax
1454e7fb3:     	testq	%rdi, %rdi
1454e7fb6:     	je	0x1454e8063 <.text+0x54e7063>
1454e7fbc:     	movq	0x60(%rbp), %r13
1454e7fc0:     	leaq	(,%rdi,8), %rbx
1454e7fc8:     	callq	0x140002200 <.text+0x1200>
1454e7fcd:     	movl	$0x8, %edx
1454e7fd2:     	movq	%rbx, %rcx
1454e7fd5:     	callq	0x1400021c0 <.text+0x11c0>
1454e7fda:     	testq	%rax, %rax
1454e7fdd:     	je	0x1454e8695 <.text+0x54e7695>
1454e7fe3:     	movl	%edi, %r11d
1454e7fe6:     	andl	$0x3, %r11d
1454e7fea:     	cmpq	$0x4, %rdi
1454e7fee:     	jae	0x1454e7ff4 <.text+0x54e6ff4>
1454e7ff0:     	xorl	%ecx, %ecx
1454e7ff2:     	jmp	0x1454e8034 <.text+0x54e7034>
1454e7ff4:     	movq	%rdi, %rdx
1454e7ff7:     	andq	%r15, %rdx
1454e7ffa:     	movq	%r13, %r8
1454e7ffd:     	xorl	%ecx, %ecx
1454e7fff:     	nop
1454e8000:     	movq	(%r8), %r10
1454e8003:     	movq	%r10, (%rax,%rcx,8)
1454e8007:     	movq	0x18(%r8), %r10
1454e800b:     	movq	%r10, 0x8(%rax,%rcx,8)
1454e8010:     	movq	0x30(%r8), %r10
1454e8014:     	movq	%r10, 0x10(%rax,%rcx,8)
1454e8019:     	movq	0x48(%r8), %r10
1454e801d:     	movq	%r10, 0x18(%rax,%rcx,8)
1454e8022:     	addq	$0x4, %rcx
1454e8026:     	addq	$0x60, %r8
1454e802a:     	cmpq	%rcx, %rdx
1454e802d:     	jne	0x1454e8000 <.text+0x54e7000>
1454e802f:     	testq	%r11, %r11
1454e8032:     	je	0x1454e8063 <.text+0x54e7063>
1454e8034:     	leaq	(%rax,%rcx,8), %rdx
1454e8038:     	leaq	(%rcx,%rcx,2), %rcx
1454e803c:     	leaq	(,%rcx,8), %rcx
1454e8044:     	addq	%r13, %rcx
1454e8047:     	xorl	%r8d, %r8d
1454e804a:     	nopw	(%rax,%rax)
1454e8050:     	movq	(%rcx), %r10
1454e8053:     	movq	%r10, (%rdx,%r8,8)
1454e8057:     	incq	%r8
1454e805a:     	addq	$0x18, %rcx
1454e805e:     	cmpq	%r8, %r11
1454e8061:     	jne	0x1454e8050 <.text+0x54e7050>
1454e8063:     	movss	0x4c(%r12), %xmm1
1454e806a:     	movq	%rsi, %rcx
1454e806d:     	movq	%rax, 0x70(%rbp)
1454e8071:     	movq	%rax, %r8
1454e8074:     	movq	%rdi, 0x78(%rbp)
1454e8078:     	movq	%rdi, %r9
1454e807b:     	callq	0x1454e78f0 <.text+0x54e68f0>
1454e8080:     	nop
1454e8081:     	cmpq	$0x1, %rax
1454e8085:     	movq	0x70(%rbp), %rcx
1454e8089:     	jne	0x1454e81c0 <.text+0x54e71c0>
1454e808f:     	movq	%rdx, %rbx
1454e8092:     	movss	0x934(%rsi), %xmm0
1454e809a:     	movq	0x4e0(%rsi), %rax
1454e80a1:     	imulq	$0x160, 0x4e8(%rsi), %rdx # imm = 0x160
1454e80ac:     	xorl	%r9d, %r9d
1454e80af:     	movq	%rax, %r8
1454e80b2:     	nopw	%cs:(%rax,%rax)
1454e80c0:     	cmpq	%r9, %rdx
1454e80c3:     	je	0x1454e81c0 <.text+0x54e71c0>
1454e80c9:     	addq	$0x160, %r9             # imm = 0x160
1454e80d0:     	cmpq	%rbx, 0x88(%r8)
1454e80d7:     	leaq	0x160(%r8), %r8
1454e80de:     	jne	0x1454e80c0 <.text+0x54e70c0>
1454e80e0:     	movss	-0x38(%rax,%r9), %xmm1
1454e80e7:     	ucomiss	%xmm1, %xmm10
1454e80eb:     	jae	0x1454e8148 <.text+0x54e7148>
1454e80ed:     	subss	-0x3c(%rax,%r9), %xmm0
1454e80f4:     	divss	%xmm1, %xmm0
1454e80f8:     	xorps	%xmm1, %xmm1
1454e80fb:     	maxss	%xmm0, %xmm1
1454e80ff:     	movss	0x41f389(%rip), %xmm0   # 0x145907490
1454e8107:     	minss	%xmm1, %xmm0
1454e810b:     	movsd	-0x54(%rax,%r9), %xmm1
1454e8112:     	movsd	-0x48(%rax,%r9), %xmm2
1454e8119:     	subps	%xmm1, %xmm2
1454e811c:     	movsldup	%xmm0, %xmm9            # xmm9 = xmm0[0,0,2,2]
1454e8121:     	mulps	%xmm2, %xmm9
1454e8125:     	addps	%xmm1, %xmm9
1454e8129:     	movss	-0x4c(%rax,%r9), %xmm1
1454e8130:     	movss	-0x40(%rax,%r9), %xmm11
1454e8137:     	subss	%xmm1, %xmm11
1454e813c:     	mulss	%xmm0, %xmm11
1454e8141:     	addss	%xmm1, %xmm11
1454e8146:     	jmp	0x1454e8156 <.text+0x54e7156>
1454e8148:     	movsd	-0x48(%rax,%r9), %xmm9
1454e814f:     	movss	-0x40(%rax,%r9), %xmm11
1454e8156:     	movq	0x68(%rbp), %r13
1454e815a:     	cmpq	0x58(%rbp), %r13
1454e815e:     	jne	0x1454e816a <.text+0x54e716a>
1454e8160:     	leaq	0x58(%rbp), %rcx
1454e8164:     	callq	0x1457745c0 <.text+0x57735c0>
1454e8169:     	nop
1454e816a:     	leaq	0x1(%r13), %rax
1454e816e:     	movq	0x60(%rbp), %rcx
1454e8172:     	leaq	(,%r13,2), %rdx
1454e817a:     	addq	%r13, %rdx
1454e817d:     	movq	%rbx, (%rcx,%rdx,8)
1454e8181:     	movlps	%xmm9, 0x8(%rcx,%rdx,8)
1454e8187:     	movss	%xmm11, 0x10(%rcx,%rdx,8)
1454e818e:     	movq	%rax, 0x68(%rbp)
1454e8192:     	movq	0x78(%rbp), %rdx
1454e8196:     	testq	%rdx, %rdx
1454e8199:     	je	0x1454e81b2 <.text+0x54e71b2>
1454e819b:     	shlq	$0x3, %rdx
1454e819f:     	movl	$0x8, %r8d
1454e81a5:     	movq	0x70(%rbp), %rcx
1454e81a9:     	callq	0x1400021d0 <.text+0x11d0>
1454e81ae:     	movq	0x68(%rbp), %rax
1454e81b2:     	movq	%rax, %rdi
1454e81b5:     	cmpq	%r14, %rax
1454e81b8:     	jb	0x1454e7fae <.text+0x54e6fae>
1454e81be:     	jmp	0x1454e81dc <.text+0x54e71dc>
1454e81c0:     	movq	0x78(%rbp), %rdx
1454e81c4:     	testq	%rdx, %rdx
1454e81c7:     	je	0x1454e81d8 <.text+0x54e71d8>
1454e81c9:     	shlq	$0x3, %rdx
1454e81cd:     	movl	$0x8, %r8d
1454e81d3:     	callq	0x1400021d0 <.text+0x11d0>
1454e81d8:     	movq	0x68(%rbp), %rax
1454e81dc:     	testq	%rax, %rax
1454e81df:     	je	0x1454e8250 <.text+0x54e7250>
1454e81e1:     	movl	$0x0, 0x7f0(%rsi)
1454e81eb:     	movb	$0x1, 0x87(%rbp)
1454e81f2:     	leaq	-0x28(%rbp), %rdx
1454e81f6:     	movq	%rsi, %rcx
1454e81f9:     	callq	0x1454e6b90 <.text+0x54e5b90>
1454e81fe:     	nop
1454e81ff:     	movl	0x40(%r12), %eax
1454e8204:     	cmpl	$0xe15, %eax            # imm = 0xE15
1454e8209:     	jle	0x1454e8266 <.text+0x54e7266>
1454e820b:     	cmpl	$0x1b04, %eax           # imm = 0x1B04
1454e8210:     	jle	0x1454e829f <.text+0x54e729f>
1454e8216:     	cmpl	$0x2c65, %eax           # imm = 0x2C65
1454e821b:     	jg	0x1454e8311 <.text+0x54e7311>
1454e8221:     	cmpl	$0x1b05, %eax           # imm = 0x1B05
1454e8226:     	je	0x1454e8390 <.text+0x54e7390>
1454e822c:     	cmpl	$0x1c65, %eax           # imm = 0x1C65
1454e8231:     	je	0x1454e8303 <.text+0x54e7303>
1454e8237:     	movss	0x41f250(%rip), %xmm10  # 0x145907490
1454e8240:     	cmpl	$0x27c5, %eax           # imm = 0x27C5
1454e8245:     	je	0x1454e836e <.text+0x54e736e>
1454e824b:     	jmp	0x1454e83ba <.text+0x54e73ba>
1454e8250:     	movq	0x58(%rbp), %rax
1454e8254:     	testq	%rax, %rax
1454e8257:     	je	0x1454e8633 <.text+0x54e7633>
1454e825d:     	movq	0x60(%rbp), %rcx
1454e8261:     	jmp	0x1454e8620 <.text+0x54e7620>
1454e8266:     	cmpl	$0x5e5, %eax            # imm = 0x5E5
1454e826b:     	jg	0x1454e82cd <.text+0x54e72cd>
1454e826d:     	cmpl	$0x84, %eax
1454e8272:     	jle	0x1454e835b <.text+0x54e735b>
1454e8278:     	cmpl	$0x85, %eax
1454e827d:     	je	0x1454e8337 <.text+0x54e7337>
1454e8283:     	cmpl	$0x193, %eax            # imm = 0x193
1454e8288:     	je	0x1454e8303 <.text+0x54e7303>
1454e828a:     	movss	0x41f1fd(%rip), %xmm10  # 0x145907490
1454e8293:     	cmpl	$0x2ae, %eax            # imm = 0x2AE
1454e8298:     	je	0x1454e8303 <.text+0x54e7303>
1454e829a:     	jmp	0x1454e83ba <.text+0x54e73ba>
1454e829f:     	cmpl	$0x1437, %eax           # imm = 0x1437
1454e82a4:     	jle	0x1454e8342 <.text+0x54e7342>
1454e82aa:     	cmpl	$0x1438, %eax           # imm = 0x1438
1454e82af:     	je	0x1454e8303 <.text+0x54e7303>
1454e82b1:     	cmpl	$0x18d1, %eax           # imm = 0x18D1
1454e82b6:     	je	0x1454e8337 <.text+0x54e7337>
1454e82b8:     	movss	0x41f1cf(%rip), %xmm10  # 0x145907490
1454e82c1:     	cmpl	$0x1a85, %eax           # imm = 0x1A85
1454e82c6:     	je	0x1454e8337 <.text+0x54e7337>
1454e82c8:     	jmp	0x1454e83ba <.text+0x54e73ba>
1454e82cd:     	cmpl	$0xa52, %eax            # imm = 0xA52
1454e82d2:     	jle	0x1454e8379 <.text+0x54e7379>
1454e82d8:     	cmpl	$0xa53, %eax            # imm = 0xA53
1454e82dd:     	je	0x1454e839b <.text+0x54e739b>
1454e82e3:     	cmpl	$0xafc, %eax            # imm = 0xAFC
1454e82e8:     	je	0x1454e8303 <.text+0x54e7303>
1454e82ea:     	movss	0x41f19d(%rip), %xmm10  # 0x145907490
1454e82f3:     	cmpl	$0xbe4, %eax            # imm = 0xBE4
1454e82f8:     	je	0x1454e8390 <.text+0x54e7390>
1454e82fe:     	jmp	0x1454e83ba <.text+0x54e73ba>
1454e8303:     	movss	0x42d5cc(%rip), %xmm10  # 0x1459158d8
1454e830c:     	jmp	0x1454e83ba <.text+0x54e73ba>
1454e8311:     	cmpl	$0x5ed3, %eax           # imm = 0x5ED3
1454e8316:     	je	0x1454e83a6 <.text+0x54e73a6>
1454e831c:     	cmpl	$0x4bea, %eax           # imm = 0x4BEA
1454e8321:     	je	0x1454e8390 <.text+0x54e7390>
1454e8323:     	movss	0x41f164(%rip), %xmm10  # 0x145907490
1454e832c:     	cmpl	$0x2c66, %eax           # imm = 0x2C66
1454e8331:     	jne	0x1454e83ba <.text+0x54e73ba>
1454e8337:     	movss	0x4575e4(%rip), %xmm10  # 0x14593f924
1454e8340:     	jmp	0x1454e83ba <.text+0x54e73ba>
1454e8342:     	cmpl	$0xe16, %eax            # imm = 0xE16
1454e8347:     	je	0x1454e83b1 <.text+0x54e73b1>
1454e8349:     	movss	0x41f13e(%rip), %xmm10  # 0x145907490
1454e8352:     	cmpl	$0x13fc, %eax           # imm = 0x13FC
1454e8357:     	je	0x1454e8390 <.text+0x54e7390>
1454e8359:     	jmp	0x1454e83ba <.text+0x54e73ba>
1454e835b:     	cmpl	$0x4b, %eax
1454e835e:     	je	0x1454e8390 <.text+0x54e7390>
1454e8360:     	movss	0x41f127(%rip), %xmm10  # 0x145907490
1454e8369:     	cmpl	$0x74, %eax
1454e836c:     	jne	0x1454e83ba <.text+0x54e73ba>
1454e836e:     	movss	0x468ef9(%rip), %xmm10  # 0x145951270
1454e8377:     	jmp	0x1454e83ba <.text+0x54e73ba>
1454e8379:     	cmpl	$0x5e6, %eax            # imm = 0x5E6
1454e837e:     	je	0x1454e839b <.text+0x54e739b>
1454e8380:     	movss	0x41f107(%rip), %xmm10  # 0x145907490
1454e8389:     	cmpl	$0x7ba, %eax            # imm = 0x7BA
1454e838e:     	jne	0x1454e83ba <.text+0x54e73ba>
1454e8390:     	movss	0x42afb7(%rip), %xmm10  # 0x145913350
1454e8399:     	jmp	0x1454e83ba <.text+0x54e73ba>
1454e839b:     	movss	0x42af1c(%rip), %xmm10  # 0x1459132c0
1454e83a4:     	jmp	0x1454e83ba <.text+0x54e73ba>
1454e83a6:     	movss	0x4fc639(%rip), %xmm10  # 0x1459e49e8
1454e83af:     	jmp	0x1454e83ba <.text+0x54e73ba>
1454e83b1:     	movss	0x4fc666(%rip), %xmm10  # 0x1459e4a20
1454e83ba:     	movq	0x58(%rbp), %rax
1454e83be:     	movq	%rax, 0x70(%rbp)
1454e83c2:     	movq	0x60(%rbp), %rdi
1454e83c6:     	movq	0x68(%rbp), %rax
1454e83ca:     	leaq	(%rax,%rax,2), %rax
1454e83ce:     	leaq	(%rdi,%rax,8), %r13
1454e83d2:     	movss	0x10(%rbp), %xmm11
1454e83d8:     	mulss	0x24(%rbp), %xmm7
1454e83dd:     	movss	0x51ffba(%rip), %xmm12  # 0x145a083a0
1454e83e6:     	movss	0x430301(%rip), %xmm13  # 0x1459186f0
1454e83ef:     	movq	%rdi, 0x78(%rbp)
1454e83f3:     	jmp	0x1454e8430 <.text+0x54e7430>
1454e83f5:     	nopw	%cs:(%rax,%rax)
1454e8400:     	addq	$0x18, %rdi
1454e8404:     	movq	0x758(%rsi), %rax
1454e840b:     	leaq	(%r15,%r15,2), %rcx
1454e840f:     	movq	%rbx, (%rax,%rcx,8)
1454e8413:     	movss	%xmm14, 0x8(%rax,%rcx,8)
1454e841a:     	movss	%xmm9, 0xc(%rax,%rcx,8)
1454e8421:     	movb	%r14b, 0x10(%rax,%rcx,8)
1454e8426:     	incq	%r15
1454e8429:     	movq	%r15, 0x760(%rsi)
1454e8430:     	cmpq	%r13, %rdi
1454e8433:     	je	0x1454e8613 <.text+0x54e7613>
1454e8439:     	movq	(%rdi), %rbx
1454e843c:     	movss	0x8(%rdi), %xmm15
1454e8442:     	movss	0xc(%rdi), %xmm14
1454e8448:     	movq	0x3e8(%rsi), %rdx
1454e844f:     	movl	0x40(%r12), %r8d
1454e8454:     	movq	%rbx, 0x50(%rbp)
1454e8458:     	movq	%rbx, 0x48(%rbp)
1454e845c:     	movl	$0x0, 0x40(%rbp)
1454e8463:     	movl	$0x0, 0x34(%rbp)
1454e846a:     	leaq	0x34(%rbp), %rax
1454e846e:     	movq	%rax, 0x30(%rsp)
1454e8473:     	leaq	0x40(%rbp), %rax
1454e8477:     	movq	%rax, 0x28(%rsp)
1454e847c:     	movq	$0x1, 0x20(%rsp)
1454e8485:     	leaq	-0x48(%rbp), %rcx
1454e8489:     	leaq	0x50(%rbp), %r9
1454e848d:     	callq	0x145466ab0 <.text+0x5465ab0>
1454e8492:     	nop
1454e8493:     	movq	0x560(%rsi), %r14
1454e849a:     	cmpq	0x550(%rsi), %r14
1454e84a1:     	jne	0x1454e84b0 <.text+0x54e74b0>
1454e84a3:     	leaq	0x550(%rsi), %rcx
1454e84aa:     	callq	0x145774710 <.text+0x5773710>
1454e84af:     	nop
1454e84b0:     	movq	0x558(%rsi), %rax
1454e84b7:     	movq	%r14, %rcx
1454e84ba:     	shlq	$0x5, %rcx
1454e84be:     	movups	-0x48(%rbp), %xmm0
1454e84c2:     	movups	-0x38(%rbp), %xmm1
1454e84c6:     	movups	%xmm1, 0x10(%rax,%rcx)
1454e84cb:     	movups	%xmm0, (%rax,%rcx)
1454e84cf:     	incq	%r14
1454e84d2:     	movq	%r14, 0x560(%rsi)
1454e84d9:     	movq	0x8a0(%rsi), %rax
1454e84e0:     	movq	0x8b8(%rsi), %rcx
1454e84e7:     	leaq	(%rcx,%rax), %rdx
1454e84eb:     	rolq	$0x17, %rdx
1454e84ef:     	addq	%rax, %rdx
1454e84f2:     	movq	0x8a8(%rsi), %r8
1454e84f9:     	movq	%r8, %r9
1454e84fc:     	shlq	$0x11, %r9
1454e8500:     	movq	0x8b0(%rsi), %r10
1454e8507:     	xorq	%rax, %r10
1454e850a:     	xorq	%r8, %rcx
1454e850d:     	xorq	%r10, %r8
1454e8510:     	movq	%r8, 0x8a8(%rsi)
1454e8517:     	xorq	%rcx, %rax
1454e851a:     	movq	%rax, 0x8a0(%rsi)
1454e8521:     	xorq	%r9, %r10
1454e8524:     	movq	%r10, 0x8b0(%rsi)
1454e852b:     	rolq	$0x2d, %rcx
1454e852f:     	movq	%rcx, 0x8b8(%rsi)
1454e8536:     	shrq	$0x28, %rdx
1454e853a:     	xorps	%xmm1, %xmm1
1454e853d:     	cvtsi2ss	%edx, %xmm1
1454e8541:     	mulss	%xmm12, %xmm1
1454e8546:     	movzbl	0x75(%r12), %eax
1454e854c:     	addb	$-0x2, %al
1454e854e:     	movss	0x41ef3a(%rip), %xmm0   # 0x145907490
1454e8556:     	cmpb	$0x6, %al
1454e8558:     	ja	0x1454e8569 <.text+0x54e7569>
1454e855a:     	movzbl	%al, %eax
1454e855d:     	leaq	0x150ffd0(%rip), %rcx   # 0x1469f8534
1454e8564:     	movss	(%rcx,%rax,4), %xmm0
1454e8569:     	movss	0x47c(%rsi), %xmm2
1454e8571:     	ucomiss	%xmm1, %xmm2
1454e8574:     	movss	0x44(%r12), %xmm9
1454e857b:     	seta	%r14b
1454e857f:     	xorps	%xmm1, %xmm1
1454e8582:     	cmpltss	%xmm9, %xmm1
1454e8588:     	andps	%xmm7, %xmm1
1454e858b:     	mulss	%xmm13, %xmm9
1454e8590:     	mulss	%xmm6, %xmm9
1454e8595:     	mulss	%xmm11, %xmm9
1454e859a:     	mulss	%xmm0, %xmm9
1454e859f:     	addss	%xmm1, %xmm9
1454e85a4:     	mulss	%xmm8, %xmm9
1454e85a9:     	jbe	0x1454e85b4 <.text+0x54e75b4>
1454e85ab:     	mulss	0x480(%rsi), %xmm9
1454e85b4:     	movss	0x400(%rsi), %xmm0
1454e85bc:     	subss	%xmm15, %xmm0
1454e85c1:     	movss	0x404(%rsi), %xmm1
1454e85c9:     	subss	%xmm14, %xmm1
1454e85ce:     	mulss	%xmm0, %xmm0
1454e85d2:     	mulss	%xmm1, %xmm1
1454e85d6:     	addss	%xmm0, %xmm1
1454e85da:     	sqrtss	%xmm1, %xmm14
1454e85df:     	divss	%xmm10, %xmm14
1454e85e4:     	addss	0x934(%rsi), %xmm14
1454e85ed:     	movq	0x760(%rsi), %r15
1454e85f4:     	cmpq	0x750(%rsi), %r15
1454e85fb:     	jne	0x1454e8400 <.text+0x54e7400>
1454e8601:     	leaq	0x750(%rsi), %rcx
1454e8608:     	callq	0x1457745c0 <.text+0x57735c0>
1454e860d:     	nop
1454e860e:     	jmp	0x1454e8400 <.text+0x54e7400>
1454e8613:     	movq	0x70(%rbp), %rax
1454e8617:     	testq	%rax, %rax
1454e861a:     	movq	0x78(%rbp), %rcx
1454e861e:     	je	0x1454e8633 <.text+0x54e7633>
1454e8620:     	shlq	$0x3, %rax
1454e8624:     	leaq	(%rax,%rax,2), %rdx
1454e8628:     	movl	$0x8, %r8d
1454e862e:     	callq	0x1400021d0 <.text+0x11d0>
1454e8633:     	movaps	0x90(%rbp), %xmm6
1454e863a:     	movaps	0xa0(%rbp), %xmm7
1454e8641:     	movaps	0xb0(%rbp), %xmm8
1454e8649:     	movaps	0xc0(%rbp), %xmm9
1454e8651:     	movaps	0xd0(%rbp), %xmm10
1454e8659:     	movaps	0xe0(%rbp), %xmm11
1454e8661:     	movaps	0xf0(%rbp), %xmm12
1454e8669:     	movaps	0x100(%rbp), %xmm13
1454e8671:     	movaps	0x110(%rbp), %xmm14
1454e8679:     	movaps	0x120(%rbp), %xmm15
1454e8681:     	addq	$0x1b8, %rsp            # imm = 0x1B8
1454e8688:     	popq	%rbx
1454e8689:     	popq	%rdi
1454e868a:     	popq	%rsi
1454e868b:     	popq	%r12
1454e868d:     	popq	%r13
1454e868f:     	popq	%r14
1454e8691:     	popq	%r15
1454e8693:     	popq	%rbp
1454e8694:     	retq
1454e8695:     	movb	$0x1, 0x87(%rbp)
1454e869c:     	movl	$0x8, %ecx
1454e86a1:     	movq	%rbx, %rdx
1454e86a4:     	callq	0x14590379b <.text+0x590279b>
1454e86a9:     	nop
1454e86aa:     	ud2
