
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454800e3:     	movss	0x8d4(%r13), %xmm0
1454800ec:     	ucomiss	0x91c(%r13), %xmm0
1454800f4:     	jb	0x14548021f <.text+0x547f21f>
1454800fa:     	addss	0x736752(%rip), %xmm0   # 0x145bb6854
145480102:     	movss	%xmm0, 0x91c(%r13)
14548010b:     	movq	0x530(%r13), %rax
145480112:     	testq	%rax, %rax
145480115:     	je	0x1454801ea <.text+0x547f1ea>
14548011b:     	movq	0x528(%r13), %rcx
145480122:     	cmpq	$0x4, %rax
145480126:     	jae	0x145480132 <.text+0x547f132>
145480128:     	xorl	%edx, %edx
14548012a:     	xorl	%r8d, %r8d
14548012d:     	jmp	0x1454801c1 <.text+0x547f1c1>
145480132:     	movq	%rax, %rdx
145480135:     	andq	$-0x4, %rdx
145480139:     	leaq	0xf8(%rcx), %r8
145480140:     	xorps	%xmm0, %xmm0
145480143:     	movdqa	0x162e9b5(%rip), %xmm1  # 0x146aaeb00
14548014b:     	movdqa	0x4280cd(%rip), %xmm2   # 0x1458a8220
145480153:     	movq	%rdx, %r9
145480156:     	pxor	%xmm3, %xmm3
14548015a:     	nopw	(%rax,%rax)
145480160:     	movd	-0x90(%r8), %xmm4
145480169:     	movd	-0xd8(%r8), %xmm5
145480172:     	punpcklqdq	%xmm4, %xmm5    # xmm5 = xmm5[0],xmm4[0]
145480176:     	movd	(%r8), %xmm4
14548017b:     	movd	-0x48(%r8), %xmm6
145480181:     	punpcklqdq	%xmm4, %xmm6    # xmm6 = xmm6[0],xmm4[0]
145480185:     	pcmpeqd	%xmm1, %xmm5
145480189:     	pand	%xmm2, %xmm5
14548018d:     	paddq	%xmm5, %xmm3
145480191:     	pcmpeqd	%xmm1, %xmm6
145480195:     	pand	%xmm2, %xmm6
145480199:     	paddq	%xmm6, %xmm0
14548019d:     	addq	$0x120, %r8             # imm = 0x120
1454801a4:     	addq	$-0x4, %r9
1454801a8:     	jne	0x145480160 <.text+0x547f160>
1454801aa:     	paddq	%xmm3, %xmm0
1454801ae:     	pshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
1454801b3:     	paddq	%xmm0, %xmm1
1454801b7:     	movq	%xmm1, %r8
1454801bc:     	cmpq	%rdx, %rax
1454801bf:     	je	0x1454801e4 <.text+0x547f1e4>
1454801c1:     	subq	%rdx, %rax
1454801c4:     	leaq	(%rdx,%rdx,8), %rdx
1454801c8:     	leaq	(%rcx,%rdx,8), %rcx
1454801cc:     	addq	$0x20, %rcx
1454801d0:     	xorl	%edx, %edx
1454801d2:     	cmpl	$0x2, (%rcx)
1454801d5:     	sete	%dl
1454801d8:     	addq	%rdx, %r8
1454801db:     	addq	$0x48, %rcx
1454801df:     	decq	%rax
1454801e2:     	jne	0x1454801d0 <.text+0x547f1d0>
1454801e4:     	cmpq	$0x2, %r8
1454801e8:     	ja	0x14548021f <.text+0x547f21f>
1454801ea:     	leaq	0x90(%rbp), %rcx
1454801f1:     	movd	0x42b257(%rip), %xmm2   # 0x1458ab450
1454801f9:     	movd	0x50423f(%rip), %xmm3   # 0x145984440
145480201:     	movq	%r13, %rdx
145480204:     	callq	0x145497d00 <.text+0x5496d00>
145480209:     	nop
14548020a:     	leaq	0x90(%rbp), %r9
145480211:     	movq	%r13, %rcx
145480214:     	movl	$0x2, %edx
145480219:     	callq	0x14549d330 <.text+0x549c330>
14548021e:     	nop
