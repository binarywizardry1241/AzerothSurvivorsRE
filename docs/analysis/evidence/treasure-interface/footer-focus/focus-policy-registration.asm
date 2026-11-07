
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140203fd0:     	pushq	%rbp
140203fd1:     	pushq	%rsi
140203fd2:     	pushq	%rdi
140203fd3:     	pushq	%rbx
140203fd4:     	subq	$0xc8, %rsp
140203fdb:     	leaq	0x80(%rsp), %rbp
140203fe3:     	movaps	%xmm6, 0x30(%rbp)
140203fe7:     	movq	$-0x2, 0x28(%rbp)
140203fef:     	movq	%rcx, %rsi
140203ff2:     	movq	0x18(%rcx), %rcx
140203ff6:     	cmpq	$0x0, 0x30(%rcx)
140203ffb:     	je	0x14020409b <.text+0x20309b>
140204001:     	movabsq	$-0x28458b64aee586ce, %rdx # imm = 0xD7BA749B511A7932
14020400b:     	movq	0x18(%rcx), %rax
14020400f:     	movq	0x20(%rcx), %r8
140204013:     	xorl	%r9d, %r9d
140204016:     	movdqa	0x5714972(%rip), %xmm0  # 0x145918990
14020401e:     	pcmpeqd	%xmm1, %xmm1
140204022:     	movdqa	0x5746ff6(%rip), %xmm2  # 0x14594b020
14020402a:     	andq	%r8, %rdx
14020402d:     	movdqu	(%rax,%rdx), %xmm3
140204032:     	movdqa	%xmm3, %xmm4
140204036:     	pcmpeqb	%xmm0, %xmm4
14020403a:     	pmovmskb	%xmm4, %r10d
14020403f:     	testl	%r10d, %r10d
140204042:     	je	0x140204080 <.text+0x203080>
140204044:     	tzcntl	%r10d, %r11d
140204049:     	addq	%rdx, %r11
14020404c:     	andq	%r8, %r11
14020404f:     	negq	%r11
140204052:     	leaq	(%r11,%r11,2), %r11
140204056:     	movdqu	-0x18(%rax,%r11,8), %xmm4
14020405d:     	pcmpeqb	%xmm2, %xmm4
140204061:     	pmovmskb	%xmm4, %edi
140204065:     	cmpl	$0xffff, %edi           # imm = 0xFFFF
14020406b:     	je	0x140204152 <.text+0x203152>
140204071:     	leal	-0x1(%r10), %r11d
140204075:     	andw	%r10w, %r11w
140204079:     	movl	%r11d, %r10d
14020407c:     	jne	0x140204044 <.text+0x203044>
14020407e:     	nop
140204080:     	pcmpeqb	%xmm1, %xmm3
140204084:     	pmovmskb	%xmm3, %r10d
140204089:     	testl	%r10d, %r10d
14020408c:     	jne	0x14020409b <.text+0x20309b>
14020408e:     	addq	%r9, %rdx
140204091:     	addq	$0x10, %rdx
140204095:     	addq	$0x10, %r9
140204099:     	jmp	0x14020402a <.text+0x20302a>
14020409b:     	movzbl	0x60(%rcx), %eax
14020409f:     	movq	0x80(%rcx), %rax
1402040a6:     	movq	0x88(%rcx), %rdx
1402040ad:     	movabsq	$-0x28458b64aee586ce, %r8 # imm = 0xD7BA749B511A7932
1402040b7:     	xorl	%r9d, %r9d
1402040ba:     	movdqa	0x57148ce(%rip), %xmm0  # 0x145918990
1402040c2:     	pcmpeqd	%xmm1, %xmm1
1402040c6:     	movdqa	0x5746f52(%rip), %xmm2  # 0x14594b020
1402040ce:     	andq	%rdx, %r8
1402040d1:     	movdqu	(%rax,%r8), %xmm3
1402040d7:     	movdqa	%xmm3, %xmm4
1402040db:     	pcmpeqb	%xmm0, %xmm4
1402040df:     	pmovmskb	%xmm4, %edi
1402040e3:     	testl	%edi, %edi
1402040e5:     	je	0x140204130 <.text+0x203130>
1402040e7:     	tzcntl	%edi, %r11d
1402040ec:     	addq	%r8, %r11
1402040ef:     	andq	%rdx, %r11
1402040f2:     	movq	%r11, %rbx
1402040f5:     	shlq	$0x7, %rbx
1402040f9:     	movq	%rax, %r10
1402040fc:     	subq	%rbx, %r10
1402040ff:     	movdqu	-0x80(%r10), %xmm4
140204105:     	pcmpeqb	%xmm2, %xmm4
140204109:     	pmovmskb	%xmm4, %ebx
14020410d:     	cmpl	$0xffff, %ebx           # imm = 0xFFFF
140204113:     	je	0x14020416f <.text+0x20316f>
140204115:     	leal	-0x1(%rdi), %r10d
140204119:     	andw	%di, %r10w
14020411d:     	movl	%r10d, %edi
140204120:     	jne	0x1402040e7 <.text+0x2030e7>
140204122:     	nopw	%cs:(%rax,%rax)
140204130:     	pcmpeqb	%xmm1, %xmm3
140204134:     	pmovmskb	%xmm3, %r10d
140204139:     	testl	%r10d, %r10d
14020413c:     	jne	0x1402041e1 <.text+0x2031e1>
140204142:     	addq	%r9, %r8
140204145:     	addq	$0x10, %r8
140204149:     	addq	$0x10, %r9
14020414d:     	jmp	0x1402040ce <.text+0x2030ce>
140204152:     	leaq	(%rax,%r11,8), %rax
140204156:     	movq	-0x8(%rax), %rdi
14020415a:     	movq	0x8(%rsi), %rdx
14020415e:     	movq	0x10(%rsi), %r8
140204162:     	movq	%rdi, %r9
140204165:     	callq	0x144ea41f0 <.text+0x4ea31f0>
14020416a:     	jmp	0x1402043b3 <.text+0x2033b3>
14020416f:     	leaq	-0x10(%r11), %r8
140204173:     	andq	%rdx, %r8
140204176:     	movdqu	(%rax,%r8), %xmm0
14020417c:     	pcmpeqd	%xmm1, %xmm1
140204180:     	pcmpeqb	%xmm1, %xmm0
140204184:     	pmovmskb	%xmm0, %edx
140204188:     	movdqu	(%rax,%r11), %xmm0
14020418e:     	pcmpeqb	%xmm1, %xmm0
140204192:     	pmovmskb	%xmm0, %r9d
140204197:     	movw	$0x1f, %di
14020419b:     	bsrw	%dx, %di
14020419f:     	xorl	$0xf, %edi
1402041a2:     	orl	$0x10000, %r9d          # imm = 0x10000
1402041a9:     	tzcntl	%r9d, %r9d
1402041ae:     	addl	%edi, %r9d
1402041b1:     	movb	$-0x80, %dl
1402041b3:     	cmpw	$0xf, %r9w
1402041b8:     	ja	0x1402041c3 <.text+0x2031c3>
1402041ba:     	incq	0x90(%rcx)
1402041c1:     	movb	$-0x1, %dl
1402041c3:     	movb	%dl, (%rax,%r11)
1402041c7:     	movb	%dl, 0x10(%rax,%r8)
1402041cc:     	decq	0x98(%rcx)
1402041d3:     	movq	-0x70(%r10), %rax
1402041d7:     	cmpq	$0x2, %rax
1402041db:     	jne	0x14020435a <.text+0x20335a>
1402041e1:     	movq	0x20(%rsi), %rax
1402041e5:     	movq	(%rax), %rdi
1402041e8:     	leaq	0x1(%rdi), %rdx
1402041ec:     	movq	%rdx, (%rax)
1402041ef:     	movw	$0x100, (%rbp)          # imm = 0x100
1402041f5:     	movq	$0x1, -0x50(%rbp)
1402041fd:     	movups	0x574d49c(%rip), %xmm0  # 0x1459516a0
140204204:     	movups	%xmm0, -0x48(%rbp)
140204208:     	movq	$0x1, -0x28(%rbp)
140204210:     	movq	$0x1, -0x20(%rbp)
140204218:     	movq	$0x0, -0x8(%rbp)
140204220:     	movb	$0x1, 0x2(%rbp)
140204224:     	movq	$0x2, -0x38(%rbp)
14020422c:     	leaq	-0x15823(%rip), %rax    # 0x1401eea10 <.text+0x1eda10>
140204233:     	movq	%rax, -0x30(%rbp)
140204237:     	movb	$0x2, -0x18(%rbp)
14020423b:     	leaq	-0x50(%rbp), %r8
14020423f:     	movq	%rcx, %rbx
140204242:     	movq	%rdi, %rdx
140204245:     	callq	0x140044810 <.text+0x43810>
14020424a:     	addq	$0x18, %rbx
14020424e:     	leaq	0x57477c3(%rip), %rdx   # 0x14594ba18
140204255:     	movq	%rbx, %rcx
140204258:     	movq	%rdi, %r8
14020425b:     	callq	0x14000ecd0 <.text+0xdcd0>
140204260:     	movq	0x10(%rsi), %rbx
140204264:     	cmpq	(%rsi), %rbx
140204267:     	jne	0x140204271 <.text+0x203271>
140204269:     	movq	%rsi, %rcx
14020426c:     	callq	0x145774550 <.text+0x5773550>
140204271:     	movq	0x8(%rsi), %rax
140204275:     	movq	%rdi, (%rax,%rbx,8)
140204279:     	incq	%rbx
14020427c:     	movq	%rbx, 0x10(%rsi)
140204280:     	movq	$0x0, -0x50(%rbp)
140204288:     	movq	$0x8, -0x48(%rbp)
140204290:     	movq	$0x0, -0x40(%rbp)
140204298:     	movups	0x57480f1(%rip), %xmm0  # 0x14594c390
14020429f:     	movups	%xmm0, -0x38(%rbp)
1402042a3:     	movups	0x57480f6(%rip), %xmm1  # 0x14594c3a0
1402042aa:     	movups	%xmm1, -0x28(%rbp)
1402042ae:     	movq	$0x0, -0x18(%rbp)
1402042b6:     	movq	$0x8, -0x10(%rbp)
1402042be:     	movq	$0x0, -0x8(%rbp)
1402042c6:     	movups	%xmm0, (%rbp)
1402042ca:     	movups	%xmm1, 0x10(%rbp)
1402042ce:     	movq	0x18(%rsi), %rcx
1402042d2:     	movb	$0x1, 0x27(%rbp)
1402042d6:     	leaq	-0x50(%rbp), %r8
1402042da:     	movq	%rdi, %rdx
1402042dd:     	callq	0x144e52cb0 <.text+0x4e51cb0>
1402042e2:     	nop
1402042e3:     	movq	0x10(%rsi), %rax
1402042e7:     	testq	%rax, %rax
1402042ea:     	je	0x1402042f3 <.text+0x2032f3>
1402042ec:     	decq	%rax
1402042ef:     	movq	%rax, 0x10(%rsi)
1402042f3:     	movq	0x18(%rsi), %rax
1402042f7:     	movq	0x8(%rax), %rax
1402042fb:     	imulq	$0x130, %rdi, %rcx      # imm = 0x130
140204302:     	addq	%rax, %rcx
140204305:     	addq	$0x58, %rcx
140204309:     	movq	%rcx, -0x58(%rbp)
14020430d:     	callq	0x1400091b0 <.text+0x81b0>
140204312:     	nop
140204313:     	movdqu	-0x50(%rbp), %xmm0
140204318:     	movdqu	-0x40(%rbp), %xmm1
14020431d:     	movdqu	-0x30(%rbp), %xmm2
140204322:     	movdqu	-0x20(%rbp), %xmm3
140204327:     	movdqu	-0x10(%rbp), %xmm4
14020432c:     	movups	(%rbp), %xmm5
140204330:     	movups	0x10(%rbp), %xmm6
140204334:     	movq	-0x58(%rbp), %rax
140204338:     	movups	%xmm6, 0x60(%rax)
14020433c:     	movups	%xmm5, 0x50(%rax)
140204340:     	movdqu	%xmm4, 0x40(%rax)
140204345:     	movdqu	%xmm3, 0x30(%rax)
14020434a:     	movdqu	%xmm2, 0x20(%rax)
14020434f:     	movdqu	%xmm1, 0x10(%rax)
140204354:     	movdqu	%xmm0, (%rax)
140204358:     	jmp	0x1402043b3 <.text+0x2033b3>
14020435a:     	movq	-0x8(%r10), %rcx
14020435e:     	movq	%rcx, 0x18(%rbp)
140204362:     	movups	-0x18(%r10), %xmm0
140204367:     	movups	%xmm0, 0x8(%rbp)
14020436b:     	movups	-0x28(%r10), %xmm0
140204370:     	movups	%xmm0, -0x8(%rbp)
140204374:     	movdqu	-0x68(%r10), %xmm0
14020437a:     	movdqu	-0x58(%r10), %xmm1
140204380:     	movdqu	-0x48(%r10), %xmm2
140204386:     	movdqu	-0x38(%r10), %xmm3
14020438c:     	movdqu	%xmm3, -0x18(%rbp)
140204391:     	movdqu	%xmm2, -0x28(%rbp)
140204396:     	movdqu	%xmm1, -0x38(%rbp)
14020439b:     	movdqu	%xmm0, -0x48(%rbp)
1402043a0:     	movq	%rax, -0x50(%rbp)
1402043a4:     	leaq	-0x50(%rbp), %rcx
1402043a8:     	movq	%rsi, %rdx
1402043ab:     	callq	0x144e17460 <.text+0x4e16460>
1402043b0:     	movq	%rax, %rdi
1402043b3:     	movl	$0x1, %eax
1402043b8:     	movq	%rdi, %rdx
1402043bb:     	movaps	0x30(%rbp), %xmm6
1402043bf:     	addq	$0xc8, %rsp
1402043c6:     	popq	%rbx
1402043c7:     	popq	%rdi
1402043c8:     	popq	%rsi
1402043c9:     	popq	%rbp
1402043ca:     	retq
