Disassembly of section .text:

0000000140001000 <.text>:
145885af0:     	addq	$-0x2, %rdx
145885af4:     	cmpq	$0x6, %rdx
145885af8:     	ja	0x145885bf8 <.text+0x5884bf8>
145885afe:     	leaq	0x135da43(%rip), %rax   # 0x146be3548
145885b05:     	movslq	(%rax,%rdx,4), %rdx
145885b09:     	addq	%rax, %rdx
145885b0c:     	jmpq	*%rdx
145885b0e:     	cmpw	$0x6261, (%rcx)         # imm = 0x6261
145885b13:     	je	0x145885bfb <.text+0x5884bfb>
145885b19:     	cmpw	$0x6d73, (%rcx)         # imm = 0x6D73
145885b1e:     	je	0x145885c0d <.text+0x5884c0d>
145885b24:     	cmpw	$0x7661, (%rcx)         # imm = 0x7661
145885b29:     	je	0x145885c13 <.text+0x5884c13>
145885b2f:     	cmpw	$0x7161, (%rcx)         # imm = 0x7161
145885b34:     	jne	0x145885bf8 <.text+0x5884bf8>
145885b3a:     	movl	$0xa, %eax
145885b3f:     	retq
145885b40:     	movl	$0x79776c65, %eax       # imm = 0x79776C65
145885b45:     	xorl	(%rcx), %eax
145885b47:     	movzwl	0x4(%rcx), %edx
145885b4b:     	xorl	$0x6e6e, %edx           # imm = 0x6E6E
145885b51:     	orl	%eax, %edx
145885b53:     	je	0x145885bf8 <.text+0x5884bf8>
145885b59:     	movl	$0x6f676e75, %eax       # imm = 0x6F676E75
145885b5e:     	xorl	(%rcx), %eax
145885b60:     	movzwl	0x4(%rcx), %ecx
145885b64:     	xorl	$0x6f72, %ecx           # imm = 0x6F72
145885b6a:     	orl	%eax, %ecx
145885b6c:     	jne	0x145885bf8 <.text+0x5884bf8>
145885b72:     	movl	$0x3, %eax
145885b77:     	retq
145885b78:     	xorl	%edx, %edx
145885b7a:     	cmpl	$0x7878616e, (%rcx)     # imm = 0x7878616E
145885b80:     	movl	$0xb, %eax
145885b85:     	cmovneq	%rdx, %rax
145885b89:     	retq
145885b8a:     	movl	$0x6e657261, %eax       # imm = 0x6E657261
145885b8f:     	xorl	(%rcx), %eax
145885b91:     	movzbl	0x4(%rcx), %ecx
145885b95:     	xorl	$0x61, %ecx
145885b98:     	orl	%eax, %ecx
145885b9a:     	jne	0x145885bf8 <.text+0x5884bf8>
145885b9c:     	movl	$0x6, %eax
145885ba1:     	retq
145885ba2:     	movzwl	(%rcx), %eax
145885ba5:     	xorl	$0x7377, %eax           # imm = 0x7377
145885baa:     	movzbl	0x2(%rcx), %edx
145885bae:     	xorl	$0x67, %edx
145885bb1:     	orw	%ax, %dx
145885bb4:     	je	0x145885c01 <.text+0x5884c01>
145885bb6:     	movzwl	(%rcx), %eax
145885bb9:     	xorl	$0x7262, %eax           # imm = 0x7262
145885bbe:     	movzbl	0x2(%rcx), %ecx
145885bc2:     	xorl	$0x6d, %ecx
145885bc5:     	orw	%ax, %cx
145885bc8:     	jne	0x145885bf8 <.text+0x5884bf8>
145885bca:     	movl	$0x9, %eax
145885bcf:     	retq
145885bd0:     	movl	$0x61726566, %eax       # imm = 0x61726566
145885bd5:     	xorl	(%rcx), %eax
145885bd7:     	movl	$0x73616c61, %edx       # imm = 0x73616C61
145885bdc:     	xorl	0x3(%rcx), %edx
145885bdf:     	orl	%eax, %edx
145885be1:     	jne	0x145885bf8 <.text+0x5884bf8>
145885be3:     	movl	$0x5, %eax
145885be8:     	retq
145885be9:     	movabsq	$0x646f6f776b737564, %rax # imm = 0x646F6F776B737564
145885bf3:     	cmpq	%rax, (%rcx)
145885bf6:     	je	0x145885c07 <.text+0x5884c07>
145885bf8:     	xorl	%eax, %eax
145885bfa:     	retq
145885bfb:     	movl	$0x4, %eax
145885c00:     	retq
145885c01:     	movl	$0x2, %eax
145885c06:     	retq
145885c07:     	movl	$0x1, %eax
145885c0c:     	retq
145885c0d:     	movl	$0x7, %eax
145885c12:     	retq
145885c13:     	movl	$0x8, %eax
145885c18:     	retq
