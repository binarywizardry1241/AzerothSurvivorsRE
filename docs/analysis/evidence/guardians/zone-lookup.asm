
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14540e820:     	addq	$-0x2, %rdx
14540e824:     	cmpq	$0x6, %rdx
14540e828:     	ja	0x14540e928 <.text+0x540d928>
14540e82e:     	leaq	0x130e987(%rip), %rax   # 0x14671d1bc
14540e835:     	movslq	(%rax,%rdx,4), %rdx
14540e839:     	addq	%rax, %rdx
14540e83c:     	jmpq	*%rdx
14540e83e:     	cmpw	$0x6261, (%rcx)         # imm = 0x6261
14540e843:     	je	0x14540e92b <.text+0x540d92b>
14540e849:     	cmpw	$0x6d73, (%rcx)         # imm = 0x6D73
14540e84e:     	je	0x14540e93d <.text+0x540d93d>
14540e854:     	cmpw	$0x7661, (%rcx)         # imm = 0x7661
14540e859:     	je	0x14540e943 <.text+0x540d943>
14540e85f:     	cmpw	$0x7161, (%rcx)         # imm = 0x7161
14540e864:     	jne	0x14540e928 <.text+0x540d928>
14540e86a:     	movl	$0xa, %eax
14540e86f:     	retq
14540e870:     	movl	$0x79776c65, %eax       # imm = 0x79776C65
14540e875:     	xorl	(%rcx), %eax
14540e877:     	movzwl	0x4(%rcx), %edx
14540e87b:     	xorl	$0x6e6e, %edx           # imm = 0x6E6E
14540e881:     	orl	%eax, %edx
14540e883:     	je	0x14540e928 <.text+0x540d928>
14540e889:     	movl	$0x6f676e75, %eax       # imm = 0x6F676E75
14540e88e:     	xorl	(%rcx), %eax
14540e890:     	movzwl	0x4(%rcx), %ecx
14540e894:     	xorl	$0x6f72, %ecx           # imm = 0x6F72
14540e89a:     	orl	%eax, %ecx
14540e89c:     	jne	0x14540e928 <.text+0x540d928>
14540e8a2:     	movl	$0x3, %eax
14540e8a7:     	retq
14540e8a8:     	xorl	%edx, %edx
14540e8aa:     	cmpl	$0x7878616e, (%rcx)     # imm = 0x7878616E
14540e8b0:     	movl	$0xb, %eax
14540e8b5:     	cmovneq	%rdx, %rax
14540e8b9:     	retq
14540e8ba:     	movl	$0x6e657261, %eax       # imm = 0x6E657261
14540e8bf:     	xorl	(%rcx), %eax
14540e8c1:     	movzbl	0x4(%rcx), %ecx
14540e8c5:     	xorl	$0x61, %ecx
14540e8c8:     	orl	%eax, %ecx
14540e8ca:     	jne	0x14540e928 <.text+0x540d928>
14540e8cc:     	movl	$0x6, %eax
14540e8d1:     	retq
14540e8d2:     	movzwl	(%rcx), %eax
14540e8d5:     	xorl	$0x7377, %eax           # imm = 0x7377
14540e8da:     	movzbl	0x2(%rcx), %edx
14540e8de:     	xorl	$0x67, %edx
14540e8e1:     	orw	%ax, %dx
14540e8e4:     	je	0x14540e931 <.text+0x540d931>
14540e8e6:     	movzwl	(%rcx), %eax
14540e8e9:     	xorl	$0x7262, %eax           # imm = 0x7262
14540e8ee:     	movzbl	0x2(%rcx), %ecx
14540e8f2:     	xorl	$0x6d, %ecx
14540e8f5:     	orw	%ax, %cx
14540e8f8:     	jne	0x14540e928 <.text+0x540d928>
14540e8fa:     	movl	$0x9, %eax
14540e8ff:     	retq
14540e900:     	movl	$0x61726566, %eax       # imm = 0x61726566
14540e905:     	xorl	(%rcx), %eax
14540e907:     	movl	$0x73616c61, %edx       # imm = 0x73616C61
14540e90c:     	xorl	0x3(%rcx), %edx
14540e90f:     	orl	%eax, %edx
14540e911:     	jne	0x14540e928 <.text+0x540d928>
14540e913:     	movl	$0x5, %eax
14540e918:     	retq
14540e919:     	movabsq	$0x646f6f776b737564, %rax # imm = 0x646F6F776B737564
14540e923:     	cmpq	%rax, (%rcx)
14540e926:     	je	0x14540e937 <.text+0x540d937>
14540e928:     	xorl	%eax, %eax
14540e92a:     	retq
14540e92b:     	movl	$0x4, %eax
14540e930:     	retq
14540e931:     	movl	$0x2, %eax
14540e936:     	retq
14540e937:     	movl	$0x1, %eax
14540e93c:     	retq
14540e93d:     	movl	$0x7, %eax
14540e942:     	retq
14540e943:     	movl	$0x8, %eax
14540e948:     	retq
14540e949:     	int3
14540e94a:     	int3
14540e94b:     	int3
14540e94c:     	int3
14540e94d:     	int3
14540e94e:     	int3
14540e94f:     	int3
14540e950:     	subq	$0x28, %rsp
14540e954:     	callq	0x14540e820 <.text+0x540d820>
14540e959:     	imulq	$0xf0, %rax, %rcx
14540e960:     	leaq	0x1307ad1(%rip), %rax   # 0x146716438
14540e967:     	addq	%rcx, %rax
14540e96a:     	addq	$0x28, %rsp
14540e96e:     	retq
