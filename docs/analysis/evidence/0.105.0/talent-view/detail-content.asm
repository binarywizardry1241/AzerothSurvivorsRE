
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140217570:     	pushq	%r15
140217572:     	pushq	%r14
140217574:     	pushq	%r13
140217576:     	pushq	%r12
140217578:     	pushq	%rsi
140217579:     	pushq	%rdi
14021757a:     	pushq	%rbp
14021757b:     	pushq	%rbx
14021757c:     	subq	$0x498, %rsp            # imm = 0x498
140217583:     	movaps	%xmm9, 0x480(%rsp)
14021758c:     	movaps	%xmm8, 0x470(%rsp)
140217595:     	movaps	%xmm7, 0x460(%rsp)
14021759d:     	movaps	%xmm6, 0x450(%rsp)
1402175a5:     	movq	%rdx, %r14
1402175a8:     	movq	%rcx, %r13
1402175ab:     	movq	(%rcx), %rsi
1402175ae:     	movq	0x28(%rcx), %rax
1402175b2:     	movq	%rsi, 0x290(%rsp)
1402175ba:     	leaq	0x298(%rsp), %r12
1402175c2:     	movups	0x8(%rcx), %xmm0
1402175c6:     	movups	%xmm0, 0x298(%rsp)
1402175ce:     	movups	0x18(%rcx), %xmm0
1402175d2:     	movups	%xmm0, 0x2a8(%rsp)
1402175da:     	movq	%rax, 0x2b8(%rsp)
1402175e2:     	movq	(%rdx), %rax
1402175e5:     	movq	0x8(%rdx), %rbx
1402175e9:     	movzbl	(%rax), %eax
1402175ec:     	movabsq	$0x42c8000000000002, %rbp # imm = 0x42C8000000000002
1402175f6:     	movb	%al, 0x57(%rsp)
1402175fa:     	testb	%al, %al
1402175fc:     	jne	0x1402178e9 <.text+0x2168e9>
140217602:     	movq	0x10(%r14), %r15
140217606:     	movq	0x18(%r14), %rax
14021760a:     	movzbl	(%rax), %edx
14021760d:     	movb	%dl, 0xb4(%rsp)
140217614:     	movq	%r15, %rcx
140217617:     	callq	0x145884fb0 <.text+0x5883fb0>
14021761c:     	movq	%rax, 0x60(%rsp)
140217621:     	xorps	%xmm0, %xmm0
140217624:     	movups	%xmm0, 0x140(%rsp)
14021762c:     	movups	%xmm0, 0x130(%rsp)
140217634:     	movups	%xmm0, 0x158(%rsp)
14021763c:     	movups	%xmm0, 0x168(%rsp)
140217644:     	movq	$0x0, 0x178(%rsp)
140217650:     	movl	$0x0, 0x240(%rsp)
14021765b:     	movw	$0x0, 0x244(%rsp)
140217665:     	movups	0x5b92754(%rip), %xmm0  # 0x145da9dc0
14021766c:     	movaps	%xmm0, 0x2c0(%rsp)
140217674:     	movq	0x5b92755(%rip), %rax   # 0x145da9dd0
14021767b:     	movq	%rax, 0x2d0(%rsp)
140217683:     	movups	0x5b9274e(%rip), %xmm0  # 0x145da9dd8
14021768a:     	movups	%xmm0, 0x2d8(%rsp)
140217692:     	movq	0x5b9274f(%rip), %rax   # 0x145da9de8
140217699:     	movq	%rax, 0x2e8(%rsp)
1402176a1:     	movq	0x5b92758(%rip), %rax   # 0x145da9e00
1402176a8:     	movq	%rax, 0x300(%rsp)
1402176b0:     	movups	0x5b92739(%rip), %xmm0  # 0x145da9df0
1402176b7:     	movaps	%xmm0, 0x2f0(%rsp)
1402176bf:     	movq	0x5b92752(%rip), %rax   # 0x145da9e18
1402176c6:     	movq	%rax, 0x318(%rsp)
1402176ce:     	movups	0x5b92733(%rip), %xmm0  # 0x145da9e08
1402176d5:     	movups	%xmm0, 0x308(%rsp)
1402176dd:     	movq	0x310(%rsp), %rax
1402176e5:     	movq	%rax, 0x118(%rsp)
1402176ed:     	movq	0x318(%rsp), %rax
1402176f5:     	movq	%rax, 0x120(%rsp)
1402176fd:     	movq	0x300(%rsp), %rax
140217705:     	movq	%rax, 0x108(%rsp)
14021770d:     	movq	0x308(%rsp), %rax
140217715:     	movq	%rax, 0x110(%rsp)
14021771d:     	movaps	0x2c0(%rsp), %xmm0
140217725:     	movaps	0x2d0(%rsp), %xmm1
14021772d:     	movaps	0x2e0(%rsp), %xmm2
140217735:     	movaps	0x2f0(%rsp), %xmm3
14021773d:     	movups	%xmm3, 0xf8(%rsp)
140217745:     	movups	%xmm2, 0xe8(%rsp)
14021774d:     	movups	%xmm1, 0xd8(%rsp)
140217755:     	movups	%xmm0, 0xc8(%rsp)
14021775d:     	movq	$0x0, 0x128(%rsp)
140217769:     	movq	%rbp, 0x150(%rsp)
140217771:     	movups	0x5b92710(%rip), %xmm0  # 0x145da9e88
140217778:     	movups	%xmm0, 0x190(%rsp)
140217780:     	movups	0x5b926f1(%rip), %xmm0  # 0x145da9e78
140217787:     	movups	%xmm0, 0x180(%rsp)
14021778f:     	movups	0x5b92712(%rip), %xmm0  # 0x145da9ea8
140217796:     	movups	%xmm0, 0x1b0(%rsp)
14021779e:     	movups	0x5b926f3(%rip), %xmm0  # 0x145da9e98
1402177a5:     	movups	%xmm0, 0x1a0(%rsp)
1402177ad:     	movups	0x5b92714(%rip), %xmm0  # 0x145da9ec8
1402177b4:     	movups	%xmm0, 0x1d0(%rsp)
1402177bc:     	movups	0x5b926f5(%rip), %xmm0  # 0x145da9eb8
1402177c3:     	movups	%xmm0, 0x1c0(%rsp)
1402177cb:     	movups	0x5b92716(%rip), %xmm0  # 0x145da9ee8
1402177d2:     	movups	%xmm0, 0x1f0(%rsp)
1402177da:     	movups	0x5b926f7(%rip), %xmm0  # 0x145da9ed8
1402177e1:     	movups	%xmm0, 0x1e0(%rsp)
1402177e9:     	movaps	0x5b55a70(%rip), %xmm0  # 0x145d6d260
1402177f0:     	movups	%xmm0, 0x200(%rsp)
1402177f8:     	movl	$0x1, 0x210(%rsp)
140217803:     	movss	0x5b55c1d(%rip), %xmm0  # 0x145d6d428
14021780b:     	movlps	%xmm0, 0x214(%rsp)
140217813:     	movb	$0x1, 0x21c(%rsp)
14021781b:     	movq	$0x0, 0x220(%rsp)
140217827:     	movl	$0x3f800000, 0x228(%rsp) # imm = 0x3F800000
140217832:     	movw	$0x0, 0x22c(%rsp)
14021783c:     	movzwl	0x5b926e7(%rip), %eax   # 0x145da9f2a
140217843:     	movw	%ax, 0x232(%rsp)
14021784b:     	movl	0x5b926d5(%rip), %eax   # 0x145da9f26
140217851:     	movl	%eax, 0x22e(%rsp)
140217858:     	movzwl	0x5b926d1(%rip), %eax   # 0x145da9f30
14021785f:     	movw	%ax, 0x238(%rsp)
140217867:     	movl	0x5b926bf(%rip), %eax   # 0x145da9f2c
14021786d:     	movl	%eax, 0x234(%rsp)
140217874:     	movw	$0x0, 0x23e(%rsp)
14021787e:     	movl	$0x0, 0x23a(%rsp)
140217889:     	movq	%rsi, 0xc0(%rsp)
140217891:     	leaq	0x80(%rsp), %rdi
140217899:     	leaq	0xc0(%rsp), %r8
1402178a1:     	movq	%rdi, %rcx
1402178a4:     	movq	%r12, %rdx
1402178a7:     	callq	0x140189f40 <.text+0x188f40>
1402178ac:     	leaq	0x60(%rsp), %rax
1402178b1:     	movq	%rax, 0xc0(%rsp)
1402178b9:     	movq	%r15, 0xc8(%rsp)
1402178c1:     	leaq	0xb4(%rsp), %rax
1402178c9:     	movq	%rax, 0xd0(%rsp)
1402178d1:     	movq	%rbx, 0xd8(%rsp)
1402178d9:     	leaq	0xc0(%rsp), %rdx
1402178e1:     	movq	%rdi, %rcx
1402178e4:     	callq	0x140219b10 <.text+0x218b10>
1402178e9:     	leaq	0x5ba5233(%rip), %rcx   # 0x145dbcb23
1402178f0:     	movl	$0xd, %edx
1402178f5:     	callq	0x1458da4e0 <.text+0x58d94e0>
1402178fa:     	movq	%rax, 0x60(%rsp)
1402178ff:     	movq	%rdx, 0x68(%rsp)
140217904:     	movq	0x5b57495(%rip), %rax   # 0x145d6eda0
14021790b:     	movq	%rax, 0x2d0(%rsp)
140217913:     	movups	0x5b57476(%rip), %xmm0  # 0x145d6ed90
14021791a:     	movaps	%xmm0, 0x2c0(%rsp)
140217922:     	movups	0x5b5747f(%rip), %xmm0  # 0x145d6eda8
140217929:     	movups	%xmm0, 0x2d8(%rsp)
140217931:     	movq	0x5b57480(%rip), %rax   # 0x145d6edb8
140217938:     	movq	%rax, 0x2e8(%rsp)
140217940:     	movups	0x5b57479(%rip), %xmm0  # 0x145d6edc0
140217947:     	movaps	%xmm0, 0x2f0(%rsp)
14021794f:     	movq	0x5b5747a(%rip), %rax   # 0x145d6edd0
140217956:     	movq	%rax, 0x300(%rsp)
14021795e:     	movups	0x5b57473(%rip), %xmm0  # 0x145d6edd8
140217965:     	movups	%xmm0, 0x308(%rsp)
14021796d:     	movq	0x5b57474(%rip), %rax   # 0x145d6ede8
140217974:     	movq	%rax, 0x318(%rsp)
14021797c:     	movq	0x290(%rsp), %rax
140217984:     	movaps	0x2c0(%rsp), %xmm0
14021798c:     	movups	%xmm0, 0xc8(%rsp)
140217994:     	movq	0x2d0(%rsp), %rcx
14021799c:     	movq	%rcx, 0xd8(%rsp)
1402179a4:     	movq	0x2d8(%rsp), %rcx
1402179ac:     	movq	%rcx, 0xe0(%rsp)
1402179b4:     	movq	0x2e0(%rsp), %rcx
1402179bc:     	movq	%rcx, 0xe8(%rsp)
1402179c4:     	movq	0x2e8(%rsp), %rcx
1402179cc:     	movq	%rcx, 0xf0(%rsp)
1402179d4:     	movaps	0x2f0(%rsp), %xmm0
1402179dc:     	movups	%xmm0, 0xf8(%rsp)
1402179e4:     	movaps	0x300(%rsp), %xmm0
1402179ec:     	movups	%xmm0, 0x108(%rsp)
1402179f4:     	movaps	0x310(%rsp), %xmm0
1402179fc:     	movups	%xmm0, 0x118(%rsp)
140217a04:     	xorps	%xmm0, %xmm0
140217a07:     	movups	%xmm0, 0x128(%rsp)
140217a0f:     	movups	%xmm0, 0x138(%rsp)
140217a17:     	movq	$0x0, 0x148(%rsp)
140217a23:     	movq	%rbp, 0x150(%rsp)
140217a2b:     	movups	%xmm0, 0x158(%rsp)
140217a33:     	movups	%xmm0, 0x168(%rsp)
140217a3b:     	movq	$0x0, 0x178(%rsp)
140217a47:     	movups	0x5b5740a(%rip), %xmm0  # 0x145d6ee58
140217a4e:     	movups	%xmm0, 0x190(%rsp)
140217a56:     	movups	0x5b573eb(%rip), %xmm0  # 0x145d6ee48
140217a5d:     	movups	%xmm0, 0x180(%rsp)
140217a65:     	movups	0x5b573fc(%rip), %xmm0  # 0x145d6ee68
140217a6c:     	movups	%xmm0, 0x1a0(%rsp)
140217a74:     	movups	0x5b573fd(%rip), %xmm0  # 0x145d6ee78
140217a7b:     	movups	%xmm0, 0x1b0(%rsp)
140217a83:     	movups	0x5b573fe(%rip), %xmm0  # 0x145d6ee88
140217a8a:     	movups	%xmm0, 0x1c0(%rsp)
140217a92:     	movups	0x5b573ff(%rip), %xmm0  # 0x145d6ee98
140217a99:     	movups	%xmm0, 0x1d0(%rsp)
140217aa1:     	movups	0x5b57400(%rip), %xmm0  # 0x145d6eea8
140217aa8:     	movups	%xmm0, 0x1e0(%rsp)
140217ab0:     	movups	0x5b57401(%rip), %xmm0  # 0x145d6eeb8
140217ab7:     	movups	%xmm0, 0x1f0(%rsp)
140217abf:     	movaps	0x5b55799(%rip), %xmm8  # 0x145d6d260
140217ac7:     	movups	%xmm8, 0x200(%rsp)
140217ad0:     	movl	$0x1, 0x210(%rsp)
140217adb:     	movss	0x5b5578d(%rip), %xmm0  # 0x145d6d270
140217ae3:     	movlps	%xmm0, 0x214(%rsp)
140217aeb:     	movb	$0x1, 0x21c(%rsp)
140217af3:     	movq	$0x0, 0x220(%rsp)
140217aff:     	movl	$0x3f800000, 0x228(%rsp) # imm = 0x3F800000
140217b0a:     	movw	$0x0, 0x22c(%rsp)
140217b14:     	movzwl	0x5b573df(%rip), %ecx   # 0x145d6eefa
140217b1b:     	movw	%cx, 0x232(%rsp)
140217b23:     	movl	0x5b573cd(%rip), %ecx   # 0x145d6eef6
140217b29:     	movl	%ecx, 0x22e(%rsp)
140217b30:     	movzwl	0x5b573c9(%rip), %ecx   # 0x145d6ef00
140217b37:     	movw	%cx, 0x238(%rsp)
140217b3f:     	movl	0x5b573b7(%rip), %ecx   # 0x145d6eefc
140217b45:     	movl	%ecx, 0x234(%rsp)
140217b4c:     	movq	$0x0, 0x23a(%rsp)
140217b58:     	movl	$0x5, 0x242(%rsp)
140217b63:     	movq	%rax, 0xc0(%rsp)
140217b6b:     	leaq	0x80(%rsp), %rdi
140217b73:     	leaq	0xc0(%rsp), %r8
140217b7b:     	movq	%rdi, %rcx
140217b7e:     	movq	%r12, %rdx
140217b81:     	callq	0x140189f40 <.text+0x188f40>
140217b86:     	leaq	0x60(%rsp), %r8
140217b8b:     	movq	%rdi, %rcx
140217b8e:     	movq	%rbx, %rdx
140217b91:     	callq	0x1401d6140 <.text+0x1d5140>
140217b96:     	movq	0x20(%r14), %r15
140217b9a:     	movq	0x28(%r14), %rdx
140217b9e:     	movl	(%r15), %edi
140217ba1:     	xorl	%eax, %eax
140217ba3:     	movl	%edi, %ecx
140217ba5:     	movq	%rdx, 0x280(%rsp)
140217bad:     	subl	(%rdx), %ecx
140217baf:     	cmovbl	%eax, %ecx
140217bb2:     	movl	%ecx, 0x28c(%rsp)
140217bb9:     	movq	%r12, %rsi
140217bbc:     	jbe	0x140217bdb <.text+0x216bdb>
140217bbe:     	cmpb	$0x0, 0x57(%rsp)
140217bc3:     	je	0x140217c2f <.text+0x216c2f>
140217bc5:     	movups	0x5ba0c2c(%rip), %xmm0  # 0x145db87f8
140217bcc:     	movaps	%xmm0, 0x60(%rsp)
140217bd1:     	movl	$0x3f800000, 0x70(%rsp) # imm = 0x3F800000
140217bd9:     	jmp	0x140217bf6 <.text+0x216bf6>
140217bdb:     	movups	0x5ba0c16(%rip), %xmm0  # 0x145db87f8
140217be2:     	movaps	%xmm0, 0x60(%rsp)
140217be7:     	movl	$0x3f800000, 0x70(%rsp) # imm = 0x3F800000
140217bef:     	cmpb	$0x0, 0x57(%rsp)
140217bf4:     	je	0x140217c43 <.text+0x216c43>
140217bf6:     	leaq	0x5ba4f42(%rip), %rcx   # 0x145dbcb3f
140217bfd:     	movl	$0xd, %edx
140217c02:     	callq	0x1458da4e0 <.text+0x58d94e0>
140217c07:     	movq	%rdx, %r8
140217c0a:     	leaq	0x5ba2ef7(%rip), %rcx   # 0x145dbab08
140217c11:     	movq	%rcx, 0xc0(%rsp)
140217c19:     	movq	$0x5, 0xc8(%rsp)
140217c25:     	movq	0x280(%rsp), %rcx
140217c2d:     	jmp	0x140217c7a <.text+0x216c7a>
140217c2f:     	movups	0x5ba0e0a(%rip), %xmm0  # 0x145db8a40
140217c36:     	movaps	%xmm0, 0x60(%rsp)
140217c3b:     	movl	$0x3f800000, 0x70(%rsp) # imm = 0x3F800000
140217c43:     	leaq	0x5ba4ee6(%rip), %rcx   # 0x145dbcb30
140217c4a:     	movl	$0xf, %edx
140217c4f:     	callq	0x1458da4e0 <.text+0x58d94e0>
140217c54:     	movq	%rdx, %r8
140217c57:     	leaq	0x5ba10b4(%rip), %rcx   # 0x145db8d12
140217c5e:     	movq	%rcx, 0xc0(%rsp)
140217c66:     	movq	$0x4, 0xc8(%rsp)
140217c72:     	leaq	0x28c(%rsp), %rcx
140217c7a:     	movq	%rcx, 0xd0(%rsp)
140217c82:     	leaq	0x5ba0e47(%rip), %rcx   # 0x145db8ad0
140217c89:     	movq	%rcx, 0xd8(%rsp)
140217c91:     	movq	$0x1, 0x20(%rsp)
140217c9a:     	leaq	0x2c0(%rsp), %rcx
140217ca2:     	leaq	0xc0(%rsp), %r9
140217caa:     	movq	%rax, %rdx
140217cad:     	callq	0x1458da940 <.text+0x58d9940>
140217cb2:     	cmpb	$0x1, 0x18(%rbx)
140217cb6:     	movl	%edi, 0x288(%rsp)
140217cbd:     	jne	0x140217cdf <.text+0x216cdf>
140217cbf:     	movl	0x19(%rbx), %eax
140217cc2:     	movl	0x1c(%rbx), %ecx
140217cc5:     	movl	%ecx, 0xb7(%rsp)
140217ccc:     	movl	%eax, 0xb4(%rsp)
140217cd3:     	movq	0x20(%rbx), %rax
140217cd7:     	movzbl	0x28(%rbx), %edx
140217cdb:     	movb	$0x1, %cl
140217cdd:     	jmp	0x140217cef <.text+0x216cef>
140217cdf:     	movq	0x20(%rbx), %rax
140217ce3:     	lock
140217ce4:     	incq	(%rax)
140217ce7:     	jle	0x140218ec9 <.text+0x217ec9>
140217ced:     	xorl	%ecx, %ecx
140217cef:     	movq	0x2d0(%rsp), %r8
140217cf7:     	movq	%r8, 0xd8(%rsp)
140217cff:     	movups	0x2c0(%rsp), %xmm0
140217d07:     	movups	%xmm0, 0xc8(%rsp)
140217d0f:     	movl	0xb4(%rsp), %r8d
140217d17:     	movl	0xb7(%rsp), %r9d
140217d1f:     	movl	%r8d, 0xf9(%rsp)
140217d27:     	movl	%r9d, 0xfc(%rsp)
140217d2f:     	movaps	0x60(%rsp), %xmm0
140217d34:     	movups	%xmm0, 0x81(%rsp)
140217d3c:     	movl	0x70(%rsp), %r8d
140217d41:     	movl	%r8d, 0x91(%rsp)
140217d49:     	movq	0x290(%rsp), %r8
140217d51:     	movq	$0x0, 0xe0(%rsp)
140217d5d:     	movq	$0x4, 0xe8(%rsp)
140217d69:     	movq	$0x0, 0xf0(%rsp)
140217d75:     	movb	%cl, 0xf8(%rsp)
140217d7c:     	movq	%rax, 0x100(%rsp)
140217d84:     	movq	%rdx, 0x108(%rsp)
140217d8c:     	movl	$0x41f00000, 0x110(%rsp) # imm = 0x41F00000
140217d97:     	movw	$0x190, 0x114(%rsp)     # imm = 0x190
140217da1:     	movb	$0x1, 0x116(%rsp)
140217da9:     	movq	0x8d(%rsp), %rax
140217db1:     	movq	%rax, 0x124(%rsp)
140217db9:     	movups	0x80(%rsp), %xmm0
140217dc1:     	movups	%xmm0, 0x117(%rsp)
140217dc9:     	movl	0x5b56519(%rip), %eax   # 0x145d6e2e8
140217dcf:     	movl	%eax, 0x13c(%rsp)
140217dd6:     	movups	0x5b564fb(%rip), %xmm6  # 0x145d6e2d8
140217ddd:     	movups	%xmm6, 0x12c(%rsp)
140217de5:     	movsd	0x5b553e3(%rip), %xmm7  # 0x145d6d1d0
140217ded:     	movsd	%xmm7, 0x140(%rsp)
140217df6:     	movq	%r8, 0xc0(%rsp)
140217dfe:     	leaq	0x2c0(%rsp), %rcx
140217e06:     	leaq	0xc0(%rsp), %r8
140217e0e:     	movq	%rsi, %rdx
140217e11:     	callq	0x14018ef20 <.text+0x18df20>
140217e16:     	movq	0x18(%r14), %rax
140217e1a:     	movq	0x30(%r14), %rdx
140217e1e:     	movzbl	(%rax), %ebp
140217e21:     	leaq	0xb4(%rsp), %rdi
140217e29:     	movq	%rdi, %rcx
140217e2c:     	movq	%rdx, 0x448(%rsp)
140217e34:     	movl	%ebp, %r8d
140217e37:     	callq	0x1458e22d0 <.text+0x58e12d0>
140217e3c:     	leaq	0x5ba4d09(%rip), %rcx   # 0x145dbcb4c
140217e43:     	movl	$0x40, %edx
140217e48:     	callq	0x1458da4e0 <.text+0x58d94e0>
140217e4d:     	movq	%rdx, %r8
140217e50:     	leaq	0xb8(%rsp), %rcx
140217e58:     	leaq	0xbc(%rsp), %rdx
140217e60:     	leaq	0x5ba2ca1(%rip), %r9    # 0x145dbab08
140217e67:     	movq	%r9, 0xc0(%rsp)
140217e6f:     	movq	$0x5, 0xc8(%rsp)
140217e7b:     	movq	0x280(%rsp), %r9
140217e83:     	movq	%r9, 0xd0(%rsp)
140217e8b:     	leaq	0x5ba0c3e(%rip), %r12   # 0x145db8ad0
140217e92:     	movq	%r12, 0xd8(%rsp)
140217e9a:     	leaq	0x5ba12db(%rip), %r9    # 0x145db917c
140217ea1:     	movq	%r9, 0xe0(%rsp)
140217ea9:     	movq	$0x6, 0xe8(%rsp)
140217eb5:     	movq	%r15, 0xf0(%rsp)
140217ebd:     	movq	%r12, 0xf8(%rsp)
140217ec5:     	leaq	0x5ba4cc0(%rip), %r9    # 0x145dbcb8c
140217ecc:     	movq	%r9, 0x100(%rsp)
140217ed4:     	movq	$0x1, 0x108(%rsp)
140217ee0:     	movq	%rdi, 0x110(%rsp)
140217ee8:     	movq	%r12, 0x118(%rsp)
140217ef0:     	leaq	0x5ba4c96(%rip), %r9    # 0x145dbcb8d
140217ef7:     	movq	%r9, 0x120(%rsp)
140217eff:     	movq	$0x1, 0x128(%rsp)
140217f0b:     	movq	%rcx, 0x130(%rsp)
140217f13:     	movq	%r12, 0x138(%rsp)
140217f1b:     	leaq	0x5ba2908(%rip), %rcx   # 0x145dba82a
140217f22:     	movq	%rcx, 0x140(%rsp)
140217f2a:     	movq	$0x1, 0x148(%rsp)
140217f36:     	movq	%rdx, 0x150(%rsp)
140217f3e:     	movq	%r12, 0x158(%rsp)
140217f46:     	leaq	0x5ba2975(%rip), %rcx   # 0x145dba8c2
140217f4d:     	movq	%rcx, 0x160(%rsp)
140217f55:     	movq	$0x3, 0x168(%rsp)
140217f61:     	leaq	0x5ba36e4(%rip), %rcx   # 0x145dbb64c
140217f68:     	movq	%rcx, 0x170(%rsp)
140217f70:     	movq	%r12, 0x178(%rsp)
140217f78:     	movq	$0x6, 0x20(%rsp)
140217f81:     	leaq	0x80(%rsp), %rcx
140217f89:     	leaq	0xc0(%rsp), %r9
140217f91:     	movq	%rax, %rdx
140217f94:     	callq	0x1458da940 <.text+0x58d9940>
140217f99:     	cmpb	$0x1, (%rbx)
140217f9c:     	jne	0x140217fb8 <.text+0x216fb8>
140217f9e:     	movl	0x1(%rbx), %eax
140217fa1:     	movl	0x4(%rbx), %ecx
140217fa4:     	movl	%ecx, 0x5b(%rsp)
140217fa8:     	movl	%eax, 0x58(%rsp)
140217fac:     	movq	0x8(%rbx), %rax
140217fb0:     	movzbl	0x10(%rbx), %edx
140217fb4:     	movb	$0x1, %cl
140217fb6:     	jmp	0x140217fc8 <.text+0x216fc8>
140217fb8:     	movq	0x8(%rbx), %rax
140217fbc:     	lock
140217fbd:     	incq	(%rax)
140217fc0:     	jle	0x140218ec9 <.text+0x217ec9>
140217fc6:     	xorl	%ecx, %ecx
140217fc8:     	movq	0x90(%rsp), %r8
140217fd0:     	movq	%r8, 0x2d8(%rsp)
140217fd8:     	movups	0x80(%rsp), %xmm0
140217fe0:     	movups	%xmm0, 0x2c8(%rsp)
140217fe8:     	movl	0x58(%rsp), %r8d
140217fed:     	movl	0x5b(%rsp), %r9d
140217ff2:     	movl	%r8d, 0x2f9(%rsp)
140217ffa:     	movl	%r9d, 0x2fc(%rsp)
140218002:     	movups	0x5ba0832(%rip), %xmm9  # 0x145db883c
14021800a:     	movups	%xmm9, 0x61(%rsp)
140218010:     	movl	$0x3f800000, 0x71(%rsp) # imm = 0x3F800000
140218018:     	movq	0x290(%rsp), %r8
140218020:     	movq	$0x0, 0x2e0(%rsp)
14021802c:     	movq	$0x4, 0x2e8(%rsp)
140218038:     	movq	$0x0, 0x2f0(%rsp)
140218044:     	movb	%cl, 0x2f8(%rsp)
14021804b:     	movq	%rax, 0x300(%rsp)
140218053:     	movq	%rdx, 0x308(%rsp)
14021805b:     	movl	$0x41500000, 0x310(%rsp) # imm = 0x41500000
140218066:     	movw	$0x190, 0x314(%rsp)     # imm = 0x190
140218070:     	movb	$0x1, 0x316(%rsp)
140218078:     	movq	0x6d(%rsp), %rax
14021807d:     	movq	%rax, 0x324(%rsp)
140218085:     	movups	0x60(%rsp), %xmm0
14021808a:     	movups	%xmm0, 0x317(%rsp)
140218092:     	movl	0x5b56250(%rip), %eax   # 0x145d6e2e8
140218098:     	movl	%eax, 0x33c(%rsp)
14021809f:     	movups	%xmm6, 0x32c(%rsp)
1402180a7:     	movsd	%xmm7, 0x340(%rsp)
1402180b0:     	movq	%r8, 0x2c0(%rsp)
1402180b8:     	leaq	0x80(%rsp), %rdi
1402180c0:     	leaq	0x2c0(%rsp), %r8
1402180c8:     	movq	%rdi, %rcx
1402180cb:     	movq	%rsi, %rdx
1402180ce:     	callq	0x14018ef20 <.text+0x18df20>
1402180d3:     	movq	0x10(%r14), %rcx
1402180d7:     	movl	%ebp, %edx
1402180d9:     	callq	0x145890a60 <.text+0x588fa60>
1402180de:     	movl	$0x6e, %ecx
1402180e3:     	nopw	%cs:(%rax,%rax)
1402180f0:     	leal	-0x1e(%rcx), %edx
1402180f3:     	movl	%eax, %r8d
1402180f6:     	subl	%edx, %r8d
1402180f9:     	jb	0x140218167 <.text+0x217167>
1402180fb:     	leal	-0xf(%rcx), %edx
1402180fe:     	movl	%r8d, %r9d
140218101:     	subl	%edx, %r9d
140218104:     	jb	0x14021815d <.text+0x21715d>
140218106:     	movl	%r9d, %eax
140218109:     	subl	%ecx, %eax
14021810b:     	jb	0x140218162 <.text+0x217162>
14021810d:     	addl	$0x2d, %ecx
140218110:     	cmpl	$0x36b, %ecx            # imm = 0x36B
140218116:     	jne	0x1402180f0 <.text+0x2170f0>
140218118:     	movq	%r13, 0x440(%rsp)
140218120:     	movl	$0x0, 0x7c(%rsp)
140218128:     	movl	$0x0, 0x58(%rsp)
140218130:     	leaq	0x5ba4a57(%rip), %rcx   # 0x145dbcb8e
140218137:     	movl	$0x1a, %edx
14021813c:     	callq	0x1458da4e0 <.text+0x58d94e0>
140218141:     	movq	%rdx, %r13
140218144:     	testq	%rdx, %rdx
140218147:     	jns	0x1402183ee <.text+0x2173ee>
14021814d:     	xorl	%r12d, %r12d
140218150:     	movq	%r12, %rcx
140218153:     	movq	%r13, %rdx
140218156:     	callq	0x145d6944b <.text+0x5d6844b>
14021815b:     	ud2
14021815d:     	movl	%r8d, %eax
140218160:     	jmp	0x140218167 <.text+0x217167>
140218162:     	movl	%r9d, %eax
140218165:     	movl	%ecx, %edx
140218167:     	movl	%eax, 0x7c(%rsp)
14021816b:     	movl	%edx, 0x58(%rsp)
14021816f:     	leaq	0x5ba4a32(%rip), %rcx   # 0x145dbcba8
140218176:     	movl	$0x33, %edx
14021817b:     	callq	0x1458da4e0 <.text+0x58d94e0>
140218180:     	movq	%rdx, %r8
140218183:     	leaq	0x5ba4a51(%rip), %rcx   # 0x145dbcbdb
14021818a:     	movq	%rcx, 0x2c0(%rsp)
140218192:     	movq	$0x4, 0x2c8(%rsp)
14021819e:     	leaq	0x7c(%rsp), %rcx
1402181a3:     	movq	%rcx, 0x2d0(%rsp)
1402181ab:     	movq	%r12, 0x2d8(%rsp)
1402181b3:     	leaq	0x5ba265a(%rip), %rcx   # 0x145dba814
1402181ba:     	movq	%rcx, 0x2e0(%rsp)
1402181c2:     	movq	$0x4, 0x2e8(%rsp)
1402181ce:     	leaq	0x58(%rsp), %rcx
1402181d3:     	movq	%rcx, 0x2f0(%rsp)
1402181db:     	movq	%r12, 0x2f8(%rsp)
1402181e3:     	movq	$0x2, 0x20(%rsp)
1402181ec:     	leaq	0x80(%rsp), %rcx
1402181f4:     	leaq	0x2c0(%rsp), %r9
1402181fc:     	movq	%rax, %rdx
1402181ff:     	callq	0x1458da940 <.text+0x58d9940>
140218204:     	cmpb	$0x1, (%rbx)
140218207:     	jne	0x14021822f <.text+0x21722f>
140218209:     	movl	0x1(%rbx), %eax
14021820c:     	movl	0x4(%rbx), %ecx
14021820f:     	movl	%ecx, 0x26b(%rsp)
140218216:     	movl	%eax, 0x268(%rsp)
14021821d:     	movq	0x8(%rbx), %rax
140218221:     	movzbl	0x10(%rbx), %ecx
140218225:     	movb	$0x1, %dl
140218227:     	movzbl	0x57(%rsp), %r12d
14021822d:     	jmp	0x140218245 <.text+0x217245>
14021822f:     	movq	0x8(%rbx), %rax
140218233:     	lock
140218234:     	incq	(%rax)
140218237:     	movzbl	0x57(%rsp), %r12d
14021823d:     	jle	0x140218ec9 <.text+0x217ec9>
140218243:     	xorl	%edx, %edx
140218245:     	movq	0x90(%rsp), %r8
14021824d:     	movq	%r8, 0xd8(%rsp)
140218255:     	movups	0x80(%rsp), %xmm0
14021825d:     	movups	%xmm0, 0xc8(%rsp)
140218265:     	movups	%xmm9, 0x61(%rsp)
14021826b:     	movl	$0x3f800000, 0x71(%rsp) # imm = 0x3F800000
140218273:     	movq	0x290(%rsp), %r8
14021827b:     	movq	$0x0, 0xe0(%rsp)
140218287:     	movq	$0x4, 0xe8(%rsp)
140218293:     	movq	$0x0, 0xf0(%rsp)
14021829f:     	movb	%dl, 0xf8(%rsp)
1402182a6:     	movl	0x268(%rsp), %edx
1402182ad:     	movl	0x26b(%rsp), %r9d
1402182b5:     	movl	%edx, 0xf9(%rsp)
1402182bc:     	movl	%r9d, 0xfc(%rsp)
1402182c4:     	movq	%rax, 0x100(%rsp)
1402182cc:     	movq	%rcx, 0x108(%rsp)
1402182d4:     	movl	$0x41400000, 0x110(%rsp) # imm = 0x41400000
1402182df:     	movw	$0x190, 0x114(%rsp)     # imm = 0x190
1402182e9:     	movb	$0x1, 0x116(%rsp)
1402182f1:     	movq	0x6d(%rsp), %rax
1402182f6:     	movq	%rax, 0x124(%rsp)
1402182fe:     	movups	0x60(%rsp), %xmm0
140218303:     	movups	%xmm0, 0x117(%rsp)
14021830b:     	movl	0x5b55fd7(%rip), %eax   # 0x145d6e2e8
140218311:     	movl	%eax, 0x13c(%rsp)
140218318:     	movups	%xmm6, 0x12c(%rsp)
140218320:     	movsd	%xmm7, 0x140(%rsp)
140218329:     	movq	%r8, 0xc0(%rsp)
140218331:     	leaq	0x80(%rsp), %rcx
140218339:     	leaq	0xc0(%rsp), %r8
140218341:     	movq	%rsi, %rdx
140218344:     	callq	0x14018ef20 <.text+0x18df20>
140218349:     	movl	0x7c(%rsp), %eax
14021834d:     	cvtsi2ss	%rax, %xmm1
140218352:     	movl	0x58(%rsp), %eax
140218356:     	xorps	%xmm0, %xmm0
140218359:     	cvtsi2ss	%rax, %xmm0
14021835e:     	divss	%xmm0, %xmm1
140218362:     	leaq	0x290(%rsp), %rcx
14021836a:     	callq	0x14012b1a0 <.text+0x12a1a0>
14021836f:     	testb	%r12b, %r12b
140218372:     	je	0x1402185d7 <.text+0x2175d7>
140218378:     	leaq	0x5ba48df(%rip), %rcx   # 0x145dbcc5e
14021837f:     	movl	$0x4e, %edx
140218384:     	callq	0x1458da4e0 <.text+0x58d94e0>
140218389:     	movq	%rdx, %rdi
14021838c:     	testq	%rdx, %rdx
14021838f:     	jns	0x1402183a1 <.text+0x2173a1>
140218391:     	xorl	%r13d, %r13d
140218394:     	movq	%r13, %rcx
140218397:     	movq	%rdi, %rdx
14021839a:     	callq	0x145d6944b <.text+0x5d6844b>
14021839f:     	ud2
1402183a1:     	je	0x140218454 <.text+0x217454>
1402183a7:     	movq	%r13, %rsi
1402183aa:     	movq	%rax, %r12
1402183ad:     	callq	0x140002200 <.text+0x1200>
1402183b2:     	movl	$0x1, %r13d
1402183b8:     	movl	$0x1, %edx
1402183bd:     	movq	%rdi, %rcx
1402183c0:     	callq	0x1400021c0 <.text+0x11c0>
1402183c5:     	testq	%rax, %rax
1402183c8:     	je	0x140218394 <.text+0x217394>
1402183ca:     	movq	%rax, %r15
1402183cd:     	movq	%rax, %rcx
1402183d0:     	movq	%r12, %rdx
1402183d3:     	movq	%rdi, %r8
1402183d6:     	callq	0x145bc977b <.text+0x5bc877b>
1402183db:     	movq	%rsi, %r13
1402183de:     	leaq	0x298(%rsp), %rsi
1402183e6:     	movzbl	0x57(%rsp), %r12d
1402183ec:     	jmp	0x14021845a <.text+0x21745a>
1402183ee:     	je	0x140218490 <.text+0x217490>
1402183f4:     	movq	%rax, %r15
1402183f7:     	callq	0x140002200 <.text+0x1200>
1402183fc:     	movl	$0x1, %r12d
140218402:     	movl	$0x1, %edx
140218407:     	movq	%r13, %rcx
14021840a:     	callq	0x1400021c0 <.text+0x11c0>
14021840f:     	testq	%rax, %rax
140218412:     	je	0x140218150 <.text+0x217150>
140218418:     	movq	%rax, %rdi
14021841b:     	movq	%rax, %rcx
14021841e:     	movq	%r15, %rdx
140218421:     	movq	%r13, %r8
140218424:     	callq	0x145bc977b <.text+0x5bc877b>
140218429:     	cmpb	$0x1, (%rbx)
14021842c:     	movzbl	0x57(%rsp), %r12d
140218432:     	jne	0x1402184a0 <.text+0x2174a0>
140218434:     	movl	0x1(%rbx), %eax
140218437:     	movl	0x4(%rbx), %ecx
14021843a:     	movl	%ecx, 0x263(%rsp)
140218441:     	movl	%eax, 0x260(%rsp)
140218448:     	movq	0x8(%rbx), %rax
14021844c:     	movzbl	0x10(%rbx), %ecx
140218450:     	movb	$0x1, %dl
140218452:     	jmp	0x1402184b0 <.text+0x2174b0>
140218454:     	movl	$0x1, %r15d
14021845a:     	movq	%rdi, 0x2c0(%rsp)
140218462:     	movq	%r15, 0x2c8(%rsp)
14021846a:     	movq	%rdi, 0x2d0(%rsp)
140218472:     	cmpb	$0x1, (%rbx)
140218475:     	je	0x14021867a <.text+0x21767a>
14021847b:     	movq	0x8(%rbx), %rax
14021847f:     	lock
140218480:     	incq	(%rax)
140218483:     	jle	0x140218ec9 <.text+0x217ec9>
140218489:     	xorl	%edx, %edx
14021848b:     	jmp	0x140218698 <.text+0x217698>
140218490:     	movl	$0x1, %edi
140218495:     	cmpb	$0x1, (%rbx)
140218498:     	movzbl	0x57(%rsp), %r12d
14021849e:     	je	0x140218434 <.text+0x217434>
1402184a0:     	movq	0x8(%rbx), %rax
1402184a4:     	lock
1402184a5:     	incq	(%rax)
1402184a8:     	jle	0x140218ec9 <.text+0x217ec9>
1402184ae:     	xorl	%edx, %edx
1402184b0:     	movups	0x5ba0341(%rip), %xmm0  # 0x145db87f8
1402184b7:     	movups	%xmm0, 0x81(%rsp)
1402184bf:     	movl	$0x3f800000, 0x91(%rsp) # imm = 0x3F800000
1402184ca:     	movq	0x290(%rsp), %r8
1402184d2:     	movq	%r13, 0xc8(%rsp)
1402184da:     	movq	%rdi, 0xd0(%rsp)
1402184e2:     	movq	%r13, 0xd8(%rsp)
1402184ea:     	movq	$0x0, 0xe0(%rsp)
1402184f6:     	movq	$0x4, 0xe8(%rsp)
140218502:     	movq	$0x0, 0xf0(%rsp)
14021850e:     	movb	%dl, 0xf8(%rsp)
140218515:     	movl	0x260(%rsp), %edx
14021851c:     	movl	0x263(%rsp), %r9d
140218524:     	movl	%edx, 0xf9(%rsp)
14021852b:     	movl	%r9d, 0xfc(%rsp)
140218533:     	movq	%rax, 0x100(%rsp)
14021853b:     	movq	%rcx, 0x108(%rsp)
140218543:     	movl	$0x41400000, 0x110(%rsp) # imm = 0x41400000
14021854e:     	movw	$0x190, 0x114(%rsp)     # imm = 0x190
140218558:     	movb	$0x1, 0x116(%rsp)
140218560:     	movups	0x80(%rsp), %xmm0
140218568:     	movups	%xmm0, 0x117(%rsp)
140218570:     	movq	0x8d(%rsp), %rax
140218578:     	movq	%rax, 0x124(%rsp)
140218580:     	movups	%xmm6, 0x12c(%rsp)
140218588:     	movl	0x5b55d5a(%rip), %eax   # 0x145d6e2e8
14021858e:     	movl	%eax, 0x13c(%rsp)
140218595:     	movsd	%xmm7, 0x140(%rsp)
14021859e:     	movq	%r8, 0xc0(%rsp)
1402185a6:     	leaq	0x2c0(%rsp), %rcx
1402185ae:     	leaq	0xc0(%rsp), %r8
1402185b6:     	movq	%rsi, %rdx
1402185b9:     	callq	0x14018ef20 <.text+0x18df20>
1402185be:     	movq	0x440(%rsp), %r13
1402185c6:     	leaq	0x80(%rsp), %rdi
1402185ce:     	testb	%r12b, %r12b
1402185d1:     	jne	0x140218378 <.text+0x217378>
1402185d7:     	leaq	0x5ba4601(%rip), %rcx   # 0x145dbcbdf
1402185de:     	movl	$0x7f, %edx
1402185e3:     	callq	0x1458da4e0 <.text+0x58d94e0>
1402185e8:     	movq	%r13, %rsi
1402185eb:     	movq	%rax, %r13
1402185ee:     	movq	%rdx, %r15
1402185f1:     	movl	%ebp, %ecx
1402185f3:     	callq	0x145875700 <.text+0x5874700>
1402185f8:     	movq	%rax, %rcx
1402185fb:     	callq	0x145873d60 <.text+0x5872d60>
140218600:     	movq	%rax, 0x80(%rsp)
140218608:     	movq	%rdx, 0x88(%rsp)
140218610:     	leaq	0x5ba0724(%rip), %rax   # 0x145db8d3b
140218617:     	movq	%rax, 0xc0(%rsp)
14021861f:     	movq	$0x5, 0xc8(%rsp)
14021862b:     	movq	%rdi, 0xd0(%rsp)
140218633:     	leaq	0x5ba099e(%rip), %rax   # 0x145db8fd8
14021863a:     	movq	%rax, 0xd8(%rsp)
140218642:     	movq	$0x1, 0x20(%rsp)
14021864b:     	leaq	0x2c0(%rsp), %rcx
140218653:     	leaq	0xc0(%rsp), %r9
14021865b:     	movq	%r13, %rdx
14021865e:     	movq	%rsi, %r13
140218661:     	leaq	0x298(%rsp), %rsi
140218669:     	movq	%r15, %r8
14021866c:     	callq	0x1458da940 <.text+0x58d9940>
140218671:     	cmpb	$0x1, (%rbx)
140218674:     	jne	0x14021847b <.text+0x21747b>
14021867a:     	movl	0x1(%rbx), %eax
14021867d:     	movl	0x4(%rbx), %ecx
140218680:     	movl	%ecx, 0x273(%rsp)
140218687:     	movl	%eax, 0x270(%rsp)
14021868e:     	movq	0x8(%rbx), %rax
140218692:     	movzbl	0x10(%rbx), %ecx
140218696:     	movb	$0x1, %dl
140218698:     	movq	0x2d0(%rsp), %r8
1402186a0:     	movq	%r8, 0xd8(%rsp)
1402186a8:     	movups	0x2c0(%rsp), %xmm0
1402186b0:     	movups	%xmm0, 0xc8(%rsp)
1402186b8:     	movups	%xmm9, 0x81(%rsp)
1402186c1:     	movl	$0x3f800000, 0x91(%rsp) # imm = 0x3F800000
1402186cc:     	movq	0x290(%rsp), %r8
1402186d4:     	movq	$0x0, 0xe0(%rsp)
1402186e0:     	movq	$0x4, 0xe8(%rsp)
1402186ec:     	movq	$0x0, 0xf0(%rsp)
1402186f8:     	movb	%dl, 0xf8(%rsp)
1402186ff:     	movl	0x270(%rsp), %edx
140218706:     	movl	0x273(%rsp), %r9d
14021870e:     	movl	%edx, 0xf9(%rsp)
140218715:     	movl	%r9d, 0xfc(%rsp)
14021871d:     	movq	%rax, 0x100(%rsp)
140218725:     	movq	%rcx, 0x108(%rsp)
14021872d:     	movl	$0x41400000, 0x110(%rsp) # imm = 0x41400000
140218738:     	movw	$0x190, 0x114(%rsp)     # imm = 0x190
140218742:     	movb	$0x1, 0x116(%rsp)
14021874a:     	movq	0x8d(%rsp), %rax
140218752:     	movq	%rax, 0x124(%rsp)
14021875a:     	movups	0x80(%rsp), %xmm0
140218762:     	movups	%xmm0, 0x117(%rsp)
14021876a:     	movl	0x5b55b78(%rip), %eax   # 0x145d6e2e8
140218770:     	movl	%eax, 0x13c(%rsp)
140218777:     	movups	%xmm6, 0x12c(%rsp)
14021877f:     	movsd	%xmm7, 0x140(%rsp)
140218788:     	movq	%r8, 0xc0(%rsp)
140218790:     	leaq	0x2c0(%rsp), %rcx
140218798:     	leaq	0xc0(%rsp), %r8
1402187a0:     	movq	%rsi, %rdx
1402187a3:     	callq	0x14018ef20 <.text+0x18df20>
1402187a8:     	testb	%r12b, %r12b
1402187ab:     	jne	0x140218a42 <.text+0x217a42>
1402187b1:     	xorps	%xmm0, %xmm0
1402187b4:     	movaps	%xmm0, 0x360(%rsp)
1402187bc:     	movaps	%xmm0, 0x350(%rsp)
1402187c4:     	movaps	%xmm0, 0x340(%rsp)
1402187cc:     	movaps	%xmm0, 0x330(%rsp)
1402187d4:     	movaps	%xmm0, 0x320(%rsp)
1402187dc:     	movq	$0x0, 0x370(%rsp)
1402187e8:     	movw	$0x0, 0x244(%rsp)
1402187f2:     	movl	$0x0, 0x240(%rsp)
1402187fd:     	movups	0x5ba0134(%rip), %xmm0  # 0x145db8938
140218804:     	movups	%xmm0, 0x378(%rsp)
14021880c:     	movups	0x5ba0135(%rip), %xmm0  # 0x145db8948
140218813:     	movups	%xmm0, 0x388(%rsp)
14021881b:     	movups	0x5ba0136(%rip), %xmm0  # 0x145db8958
140218822:     	movups	%xmm0, 0x398(%rsp)
14021882a:     	movups	0x5ba0137(%rip), %xmm0  # 0x145db8968
140218831:     	movups	%xmm0, 0x3a8(%rsp)
140218839:     	movups	0x5ba0148(%rip), %xmm0  # 0x145db8988
140218840:     	movups	%xmm0, 0x3c8(%rsp)
140218848:     	movups	0x5ba0129(%rip), %xmm0  # 0x145db8978
14021884f:     	movups	%xmm0, 0x3b8(%rsp)
140218857:     	movups	0x5ba014a(%rip), %xmm0  # 0x145db89a8
14021885e:     	movups	%xmm0, 0x3e8(%rsp)
140218866:     	movups	0x5ba012b(%rip), %xmm0  # 0x145db8998
14021886d:     	movups	%xmm0, 0x3d8(%rsp)
140218875:     	movups	0x5ba0004(%rip), %xmm0  # 0x145db8880
14021887c:     	movaps	%xmm0, 0x2c0(%rsp)
140218884:     	movq	$0x0, 0x2d0(%rsp)
140218890:     	movups	0x5ba0001(%rip), %xmm0  # 0x145db8898
140218897:     	movups	%xmm0, 0x2d8(%rsp)
14021889f:     	movq	$0x0, 0x2e8(%rsp)
1402188ab:     	movups	0x5b9fffe(%rip), %xmm0  # 0x145db88b0
1402188b2:     	movaps	%xmm0, 0x2f0(%rsp)
1402188ba:     	movq	$0x0, 0x300(%rsp)
1402188c6:     	movups	0x5b9fffb(%rip), %xmm0  # 0x145db88c8
1402188cd:     	movups	%xmm0, 0x308(%rsp)
1402188d5:     	movq	$0x0, 0x318(%rsp)
1402188e1:     	movq	0x290(%rsp), %r15
1402188e9:     	leaq	0xc8(%rsp), %rcx
1402188f1:     	leaq	0x2c0(%rsp), %rdi
1402188f9:     	movl	$0x138, %r8d            # imm = 0x138
1402188ff:     	movq	%rdi, %rdx
140218902:     	callq	0x145bc977b <.text+0x5bc877b>
140218907:     	movups	%xmm8, 0x200(%rsp)
140218910:     	movl	$0x1, 0x210(%rsp)
14021891b:     	movss	0x5b54c9d(%rip), %xmm0  # 0x145d6d5c0
140218923:     	movlps	%xmm0, 0x214(%rsp)
14021892b:     	movb	$0x1, 0x21c(%rsp)
140218933:     	movq	$0x0, 0x220(%rsp)
14021893f:     	movl	$0x3f800000, 0x228(%rsp) # imm = 0x3F800000
14021894a:     	movw	$0x0, 0x22c(%rsp)
140218954:     	movl	$0x10000, 0x22e(%rsp)   # imm = 0x10000
14021895f:     	movw	$0x0, 0x232(%rsp)
140218969:     	movl	$0x10000, 0x234(%rsp)   # imm = 0x10000
140218974:     	movw	$0x0, 0x238(%rsp)
14021897e:     	movl	$0x0, 0x23a(%rsp)
140218989:     	movw	$0x0, 0x23e(%rsp)
140218993:     	movq	%r15, 0xc0(%rsp)
14021899b:     	leaq	0x80(%rsp), %rcx
1402189a3:     	leaq	0xc0(%rsp), %r8
1402189ab:     	movq	%rsi, %rdx
1402189ae:     	callq	0x140189f40 <.text+0x188f40>
1402189b3:     	movq	0x80(%rsp), %rax
1402189bb:     	movq	%rsi, %r15
1402189be:     	movq	0x280(%rsp), %rcx
1402189c6:     	movl	(%rcx), %esi
1402189c8:     	movq	0xa8(%rsp), %rcx
1402189d0:     	movq	%rax, 0xc0(%rsp)
1402189d8:     	movups	0x88(%rsp), %xmm0
1402189e0:     	movups	%xmm0, 0xc8(%rsp)
1402189e8:     	movups	0x98(%rsp), %xmm0
1402189f0:     	movups	%xmm0, 0xd8(%rsp)
1402189f8:     	movq	%rcx, 0xe8(%rsp)
140218a00:     	leaq	0x5ba0728(%rip), %rcx   # 0x145db912f
140218a07:     	movl	$0x5, %edx
140218a0c:     	callq	0x1458da4e0 <.text+0x58d94e0>
140218a11:     	movq	%rdx, %r9
140218a14:     	movq	$0x2, 0x2c0(%rsp)
140218a20:     	testl	%esi, %esi
140218a22:     	movq	%r15, %rsi
140218a25:     	movq	%rdi, 0x28(%rsp)
140218a2a:     	setne	0x20(%rsp)
140218a2f:     	leaq	0xc0(%rsp), %rcx
140218a37:     	movq	%rbx, %rdx
140218a3a:     	movq	%rax, %r8
140218a3d:     	callq	0x14012c6e0 <.text+0x12b6e0>
140218a42:     	movw	$0x0, 0x424(%rsp)
140218a4c:     	movb	$0x1, 0x414(%rsp)
140218a54:     	xorps	%xmm0, %xmm0
140218a57:     	movups	%xmm0, 0x328(%rsp)
140218a5f:     	movups	%xmm0, 0x338(%rsp)
140218a67:     	movabsq	$0x42c8000000000002, %rax # imm = 0x42C8000000000002
140218a71:     	movq	%rax, 0x348(%rsp)
140218a79:     	movq	$0x0, 0x320(%rsp)
140218a85:     	movaps	%xmm0, 0x350(%rsp)
140218a8d:     	movaps	%xmm0, 0x360(%rsp)
140218a95:     	movq	$0x0, 0x370(%rsp)
140218aa1:     	movl	$0x0, 0x438(%rsp)
140218aac:     	movw	$0x0, 0x43c(%rsp)
140218ab6:     	movaps	0x5b54853(%rip), %xmm0  # 0x145d6d310
140218abd:     	movups	%xmm0, 0x378(%rsp)
140218ac5:     	movaps	0x5b549c4(%rip), %xmm0  # 0x145d6d490
140218acc:     	movups	%xmm0, 0x388(%rsp)
140218ad4:     	movups	0x5b9fe7d(%rip), %xmm0  # 0x145db8958
140218adb:     	movups	%xmm0, 0x398(%rsp)
140218ae3:     	movups	0x5b9fe7e(%rip), %xmm0  # 0x145db8968
140218aea:     	movups	%xmm0, 0x3a8(%rsp)
140218af2:     	movups	0x5b9fe8f(%rip), %xmm0  # 0x145db8988
140218af9:     	movups	%xmm0, 0x3c8(%rsp)
140218b01:     	movups	0x5b9fe70(%rip), %xmm0  # 0x145db8978
140218b08:     	movups	%xmm0, 0x3b8(%rsp)
140218b10:     	movups	0x5b9fe81(%rip), %xmm0  # 0x145db8998
140218b17:     	movups	%xmm0, 0x3d8(%rsp)
140218b1f:     	movups	0x5b9fe82(%rip), %xmm0  # 0x145db89a8
140218b26:     	movups	%xmm0, 0x3e8(%rsp)
140218b2e:     	movw	$0x0, 0x436(%rsp)
140218b38:     	movl	$0x0, 0x432(%rsp)
140218b43:     	movq	$0x0, 0x418(%rsp)
140218b4f:     	movl	$0x3f800000, 0x420(%rsp) # imm = 0x3F800000
140218b5a:     	movups	%xmm8, 0x3f8(%rsp)
140218b63:     	movl	$0x1, 0x408(%rsp)
140218b6e:     	movq	$0x0, 0x40c(%rsp)
140218b7a:     	movups	0x5b9fcff(%rip), %xmm0  # 0x145db8880
140218b81:     	movaps	%xmm0, 0x2c0(%rsp)
140218b89:     	movq	$0x0, 0x2d0(%rsp)
140218b95:     	movups	0x5b9fcfc(%rip), %xmm0  # 0x145db8898
140218b9c:     	movups	%xmm0, 0x2d8(%rsp)
140218ba4:     	movq	$0x0, 0x2e8(%rsp)
140218bb0:     	movups	0x5b9fcf9(%rip), %xmm0  # 0x145db88b0
140218bb7:     	movaps	%xmm0, 0x2f0(%rsp)
140218bbf:     	movq	$0x0, 0x300(%rsp)
140218bcb:     	movups	0x5b9fcf6(%rip), %xmm0  # 0x145db88c8
140218bd2:     	movups	%xmm0, 0x308(%rsp)
140218bda:     	movq	$0x0, 0x318(%rsp)
140218be6:     	movw	$0x0, 0x42a(%rsp)
140218bf0:     	movl	$0x10000, 0x426(%rsp)   # imm = 0x10000
140218bfb:     	movw	$0x0, 0x430(%rsp)
140218c05:     	movl	$0x10000, 0x42c(%rsp)   # imm = 0x10000
140218c10:     	movups	0x5b9fbe1(%rip), %xmm0  # 0x145db87f8
140218c17:     	movaps	%xmm0, 0x80(%rsp)
140218c1f:     	movl	$0x3e800000, 0x90(%rsp) # imm = 0x3E800000
140218c2a:     	leaq	0xc8(%rsp), %rcx
140218c32:     	leaq	0x2c0(%rsp), %rdx
140218c3a:     	leaq	0x80(%rsp), %r8
140218c42:     	callq	0x140012680 <.text+0x11680>
140218c47:     	movq	0x290(%rsp), %rax
140218c4f:     	movq	%rax, 0xc0(%rsp)
140218c57:     	leaq	0x2c0(%rsp), %rcx
140218c5f:     	leaq	0xc0(%rsp), %r8
140218c67:     	movq	%rsi, %rdx
140218c6a:     	callq	0x14018d5c0 <.text+0x18c5c0>
140218c6f:     	movq	0x38(%r14), %rax
140218c73:     	movq	0x58(%rax), %rdx
140218c77:     	testq	%rdx, %rdx
140218c7a:     	je	0x140218ccf <.text+0x217ccf>
140218c7c:     	movq	0x60(%rax), %r8
140218c80:     	movl	%ebp, %ecx
140218c82:     	callq	0x1458e6190 <.text+0x58e5190>
140218c87:     	testq	%rdx, %rdx
140218c8a:     	je	0x140218ccf <.text+0x217ccf>
140218c8c:     	movq	0x40(%r14), %r8
140218c90:     	movb	%r12b, 0x40(%rsp)
140218c95:     	movl	0x288(%rsp), %ecx
140218c9c:     	movl	%ecx, 0x38(%rsp)
140218ca0:     	movq	0x448(%rsp), %rcx
140218ca8:     	movq	%rcx, 0x30(%rsp)
140218cad:     	movq	%rdx, 0x28(%rsp)
140218cb2:     	movq	%rax, 0x20(%rsp)
140218cb7:     	leaq	0x290(%rsp), %rcx
140218cbf:     	movq	%rbx, %rdx
140218cc2:     	movl	%ebp, %r9d
140218cc5:     	callq	0x140129c00 <.text+0x128c00>
140218cca:     	jmp	0x140218e90 <.text+0x217e90>
140218ccf:     	testb	%r12b, %r12b
140218cd2:     	je	0x140218d45 <.text+0x217d45>
140218cd4:     	leaq	0x5ba4093(%rip), %rcx   # 0x145dbcd6e
140218cdb:     	movl	$0x61, %edx
140218ce0:     	callq	0x1458da4e0 <.text+0x58d94e0>
140218ce5:     	movq	%rdx, %r14
140218ce8:     	testq	%rdx, %rdx
140218ceb:     	js	0x140218d5e <.text+0x217d5e>
140218ced:     	je	0x140218d6e <.text+0x217d6e>
140218cef:     	movq	%rax, %r15
140218cf2:     	callq	0x140002200 <.text+0x1200>
140218cf7:     	movl	$0x1, %r12d
140218cfd:     	movl	$0x1, %edx
140218d02:     	movq	%r14, %rcx
140218d05:     	callq	0x1400021c0 <.text+0x11c0>
140218d0a:     	testq	%rax, %rax
140218d0d:     	je	0x140218d61 <.text+0x217d61>
140218d0f:     	movq	%rax, %rdi
140218d12:     	movq	%rax, %rcx
140218d15:     	movq	%r15, %rdx
140218d18:     	movq	%r14, %r8
140218d1b:     	callq	0x145bc977b <.text+0x5bc877b>
140218d20:     	cmpb	$0x1, (%rbx)
140218d23:     	jne	0x140218d78 <.text+0x217d78>
140218d25:     	movl	0x1(%rbx), %eax
140218d28:     	movl	0x4(%rbx), %ecx
140218d2b:     	movl	%ecx, 0x27b(%rsp)
140218d32:     	movl	%eax, 0x278(%rsp)
140218d39:     	movq	0x8(%rbx), %rax
140218d3d:     	movzbl	0x10(%rbx), %ecx
140218d41:     	movb	$0x1, %dl
140218d43:     	jmp	0x140218d88 <.text+0x217d88>
140218d45:     	leaq	0x5ba3f60(%rip), %rcx   # 0x145dbccac
140218d4c:     	movl	$0xc2, %edx
140218d51:     	callq	0x1458da4e0 <.text+0x58d94e0>
140218d56:     	movq	%rdx, %r14
140218d59:     	testq	%rdx, %rdx
140218d5c:     	jns	0x140218ced <.text+0x217ced>
140218d5e:     	xorl	%r12d, %r12d
140218d61:     	movq	%r12, %rcx
140218d64:     	movq	%r14, %rdx
140218d67:     	callq	0x145d6944b <.text+0x5d6844b>
140218d6c:     	ud2
140218d6e:     	movl	$0x1, %edi
140218d73:     	cmpb	$0x1, (%rbx)
140218d76:     	je	0x140218d25 <.text+0x217d25>
140218d78:     	movq	0x8(%rbx), %rax
140218d7c:     	lock
140218d7d:     	incq	(%rax)
140218d80:     	jle	0x140218ec9 <.text+0x217ec9>
140218d86:     	xorl	%edx, %edx
140218d88:     	movups	%xmm9, 0x81(%rsp)
140218d91:     	movl	$0x3f800000, 0x91(%rsp) # imm = 0x3F800000
140218d9c:     	movq	0x290(%rsp), %r8
140218da4:     	movq	%r14, 0xc8(%rsp)
140218dac:     	movq	%rdi, 0xd0(%rsp)
140218db4:     	movq	%r14, 0xd8(%rsp)
140218dbc:     	movq	$0x0, 0xe0(%rsp)
140218dc8:     	movq	$0x4, 0xe8(%rsp)
140218dd4:     	movq	$0x0, 0xf0(%rsp)
140218de0:     	movb	%dl, 0xf8(%rsp)
140218de7:     	movl	0x278(%rsp), %edx
140218dee:     	movl	0x27b(%rsp), %r9d
140218df6:     	movl	%edx, 0xf9(%rsp)
140218dfd:     	movl	%r9d, 0xfc(%rsp)
140218e05:     	movq	%rax, 0x100(%rsp)
140218e0d:     	movq	%rcx, 0x108(%rsp)
140218e15:     	movl	$0x41600000, 0x110(%rsp) # imm = 0x41600000
140218e20:     	movw	$0x190, 0x114(%rsp)     # imm = 0x190
140218e2a:     	movb	$0x1, 0x116(%rsp)
140218e32:     	movups	0x80(%rsp), %xmm0
140218e3a:     	movups	%xmm0, 0x117(%rsp)
140218e42:     	movq	0x8d(%rsp), %rax
140218e4a:     	movq	%rax, 0x124(%rsp)
140218e52:     	movups	%xmm6, 0x12c(%rsp)
140218e5a:     	movl	0x5b55488(%rip), %eax   # 0x145d6e2e8
140218e60:     	movl	%eax, 0x13c(%rsp)
140218e67:     	movsd	%xmm7, 0x140(%rsp)
140218e70:     	movq	%r8, 0xc0(%rsp)
140218e78:     	leaq	0x2c0(%rsp), %rcx
140218e80:     	leaq	0xc0(%rsp), %r8
140218e88:     	movq	%rsi, %rdx
140218e8b:     	callq	0x14018ef20 <.text+0x18df20>
140218e90:     	movq	%r13, %rax
140218e93:     	movaps	0x450(%rsp), %xmm6
140218e9b:     	movaps	0x460(%rsp), %xmm7
140218ea3:     	movaps	0x470(%rsp), %xmm8
140218eac:     	movaps	0x480(%rsp), %xmm9
140218eb5:     	addq	$0x498, %rsp            # imm = 0x498
140218ebc:     	popq	%rbx
140218ebd:     	popq	%rbp
140218ebe:     	popq	%rdi
140218ebf:     	popq	%rsi
140218ec0:     	popq	%r12
140218ec2:     	popq	%r13
140218ec4:     	popq	%r14
140218ec6:     	popq	%r15
140218ec8:     	retq
140218ec9:     	ud2
