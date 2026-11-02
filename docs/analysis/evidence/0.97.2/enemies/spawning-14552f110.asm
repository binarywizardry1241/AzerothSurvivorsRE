
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552f110:     	pushq	%rbp
14552f111:     	pushq	%r15
14552f113:     	pushq	%r14
14552f115:     	pushq	%r13
14552f117:     	pushq	%r12
14552f119:     	pushq	%rsi
14552f11a:     	pushq	%rdi
14552f11b:     	pushq	%rbx
14552f11c:     	subq	$0x48, %rsp
14552f120:     	leaq	0x40(%rsp), %rbp
14552f125:     	movq	$-0x2, (%rbp)
14552f12d:     	movq	%rcx, %rsi
14552f130:     	movq	(%rdx), %r15
14552f133:     	movq	0x8(%rdx), %r14
14552f137:     	cmpq	%r14, %r15
14552f13a:     	je	0x14552f257 <.text+0x552e257>
14552f140:     	movq	0x10(%rdx), %rdi
14552f144:     	movq	0x18(%rdx), %r12
14552f148:     	addq	$0x50, %r15
14552f14c:     	jmp	0x14552f170 <.text+0x552e170>
14552f14e:     	nop
14552f150:     	leaq	0x1(%rdi), %rax
14552f154:     	movq	%rax, 0x10(%rdx)
14552f158:     	leaq	-0x50(%r15), %rax
14552f15c:     	addq	$0x50, %r15
14552f160:     	incq	%rdi
14552f163:     	addq	$0x50, %rax
14552f167:     	cmpq	%r14, %rax
14552f16a:     	je	0x14552f257 <.text+0x552e257>
14552f170:     	cmpb	$0x1, -0x4(%r15)
14552f175:     	jne	0x14552f150 <.text+0x552e150>
14552f177:     	movss	(%r12), %xmm0
14552f17d:     	leaq	0x1(%rdi), %r13
14552f181:     	ucomiss	-0x8(%r15), %xmm0
14552f186:     	movq	%r13, 0x10(%rdx)
14552f18a:     	jb	0x14552f158 <.text+0x552e158>
14552f18c:     	movq	%r15, (%rdx)
14552f18f:     	callq	0x140002200 <.text+0x1200>
14552f194:     	movl	$0x20, %ecx
14552f199:     	movl	$0x8, %edx
14552f19e:     	callq	0x1400021c0 <.text+0x11c0>
14552f1a3:     	testq	%rax, %rax
14552f1a6:     	je	0x14552f282 <.text+0x552e282>
14552f1ac:     	movq	%rdi, (%rax)
14552f1af:     	movq	$0x4, -0x18(%rbp)
14552f1b7:     	movq	%rax, -0x10(%rbp)
14552f1bb:     	movq	$0x1, -0x8(%rbp)
14552f1c3:     	cmpq	%r14, %r15
14552f1c6:     	je	0x14552f23e <.text+0x552e23e>
14552f1c8:     	movl	$0x1, %edi
14552f1cd:     	leaq	-0x18(%rbp), %rbx
14552f1d1:     	addq	$0x50, %r15
14552f1d5:     	jmp	0x14552f1ec <.text+0x552e1ec>
14552f1d7:     	nopw	(%rax,%rax)
14552f1e0:     	incq	%r13
14552f1e3:     	cmpq	%r14, %r15
14552f1e6:     	leaq	0x50(%r15), %r15
14552f1ea:     	je	0x14552f23e <.text+0x552e23e>
14552f1ec:     	cmpb	$0x1, -0x4(%r15)
14552f1f1:     	jne	0x14552f1e0 <.text+0x552e1e0>
14552f1f3:     	movss	(%r12), %xmm0
14552f1f9:     	ucomiss	-0x8(%r15), %xmm0
14552f1fe:     	jb	0x14552f1e0 <.text+0x552e1e0>
14552f200:     	cmpq	-0x18(%rbp), %rdi
14552f204:     	jne	0x14552f22b <.text+0x552e22b>
14552f206:     	movq	$0x8, 0x20(%rsp)
14552f20f:     	movl	$0x1, %r8d
14552f215:     	movl	$0x8, %r9d
14552f21b:     	movq	%rbx, %rcx
14552f21e:     	movq	%rdi, %rdx
14552f221:     	callq	0x145757d40 <.text+0x5756d40>
14552f226:     	nop
14552f227:     	movq	-0x10(%rbp), %rax
14552f22b:     	movq	%r13, (%rax,%rdi,8)
14552f22f:     	incq	%r13
14552f232:     	incq	%rdi
14552f235:     	movq	%rdi, -0x8(%rbp)
14552f239:     	cmpq	%r14, %r15
14552f23c:     	jne	0x14552f1d1 <.text+0x552e1d1>
14552f23e:     	movq	-0x8(%rbp), %rax
14552f242:     	movq	%rax, 0x10(%rsi)
14552f246:     	movq	-0x18(%rbp), %rax
14552f24a:     	movq	%rax, (%rsi)
14552f24d:     	movq	-0x10(%rbp), %rax
14552f251:     	movq	%rax, 0x8(%rsi)
14552f255:     	jmp	0x14552f26e <.text+0x552e26e>
14552f257:     	movq	$0x0, (%rsi)
14552f25e:     	movq	$0x8, 0x8(%rsi)
14552f266:     	movq	$0x0, 0x10(%rsi)
14552f26e:     	movq	%rsi, %rax
14552f271:     	addq	$0x48, %rsp
14552f275:     	popq	%rbx
14552f276:     	popq	%rdi
14552f277:     	popq	%rsi
14552f278:     	popq	%r12
14552f27a:     	popq	%r13
14552f27c:     	popq	%r14
14552f27e:     	popq	%r15
14552f280:     	popq	%rbp
14552f281:     	retq
14552f282:     	movl	$0x8, %ecx
14552f287:     	movl	$0x20, %edx
14552f28c:     	callq	0x1458e721b <.text+0x58e621b>
14552f291:     	ud2
