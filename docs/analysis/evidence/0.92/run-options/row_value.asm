
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140225d00:     	andb	$-0x3e, %al
140225d02:     	addl	%eax, (%rax)
140225d04:     	addb	%al, (%rax)
140225d06:     	addb	%al, %bh
140225d08:     	testb	%ah, (%rsi,%rdi,4)
140225d0b:     	addl	%eax, (%rax)
140225d0d:     	addb	%al, (%rax)
140225d0f:     	addb	%al, (%rcx)
140225d11:     	addb	%ah, -0x39(%rsi)
140225d14:     	testb	%ah, (%rax,%rcx,8)
140225d17:     	addl	%eax, (%rax)
140225d19:     	addb	%al, (%rax)
140225d1b:     	addb	%al, %bh
140225d1d:     	testb	%ah, (%rsp,%rax,8)
140225d20:     	addl	%eax, (%rax)
140225d22:     	addb	%al, (%rax)
140225d24:     	addb	%al, (%rcx)
140225d26:     	addb	%ah, -0x39(%rsi)
140225d29:     	testb	%ah, (%rsi,%rcx,8)
140225d2c:     	addl	%eax, (%rax)
140225d2e:     	addb	%al, (%rax)
140225d30:     	addb	%al, %bh
140225d32:     	testb	%ah, (%rdx,%rcx,8)
140225d35:     	addl	%eax, (%rax)
140225d37:     	addb	%al, (%rax)
140225d39:     	addb	%al, (%rax)
140225d3b:     	addb	%al, %dh
140225d3d:     	testb	%ah, 0x5000001(,%rdx,8)
140225d44:     	movq	%rax, 0x50(%rsp)
140225d49:     	leaq	0x248(%rsp), %rcx
140225d51:     	leaq	0x50(%rsp), %r8
140225d56:     	movq	%r13, %rdx
140225d59:     	callq	0x1401a0510 <.text+0x19f510>
140225d5e:     	movq	0x18(%r15), %rax
140225d62:     	movzwl	(%rax), %ecx
140225d65:     	cmpw	(%r14), %cx
140225d69:     	jbe	0x140225d74 <.text+0x224d74>
140225d6b:     	movups	0x56cd846(%rip), %xmm0  # 0x1458f35b8
140225d72:     	jmp	0x140225d7b <.text+0x224d7b>
140225d74:     	movups	0x56cd7dd(%rip), %xmm0  # 0x1458f3558
140225d7b:     	movaps	%xmm0, 0x1e0(%rsp)
140225d83:     	movl	$0x3f800000, 0x1f0(%rsp) # imm = 0x3F800000
140225d8e:     	movq	%rax, 0x50(%rsp)
140225d93:     	leaq	0x54b51a6(%rip), %rax   # 0x1456daf40 <.text+0x56d9f40>
140225d9a:     	movq	%rax, 0x58(%rsp)
140225d9f:     	leaq	0x56cdc94(%rip), %rdx   # 0x1458f3a3a
140225da6:     	leaq	0x2d0(%rsp), %rcx
140225dae:     	leaq	0x50(%rsp), %r8
140225db3:     	callq	0x1456c9ba0 <.text+0x56c8ba0>
140225db8:     	cmpb	$0x1, 0x18(%rdi)
140225dbc:     	jne	0x140225dde <.text+0x224dde>
140225dbe:     	movl	0x19(%rdi), %eax
140225dc1:     	movl	0x1c(%rdi), %ecx
140225dc4:     	movl	%ecx, 0x293(%rsp)
140225dcb:     	movl	%eax, 0x290(%rsp)
140225dd2:     	movq	0x20(%rdi), %rax
140225dd6:     	movzbl	0x28(%rdi), %ecx
140225dda:     	movb	$0x1, %dl
140225ddc:     	jmp	0x140225dee <.text+0x224dee>
140225dde:     	movq	0x20(%rdi), %rax
140225de2:     	lock
140225de3:     	incq	(%rax)
140225de6:     	jle	0x140225f7c <.text+0x224f7c>
140225dec:     	xorl	%edx, %edx
140225dee:     	movq	0x2e0(%rsp), %r8
140225df6:     	movq	%r8, 0x60(%rsp)
140225dfb:     	movups	0x2d0(%rsp), %xmm0
140225e03:     	movaps	%xmm0, 0x50(%rsp)
140225e08:     	movq	$0x0, 0x68(%rsp)
140225e11:     	movq	$0x4, 0x70(%rsp)
140225e1a:     	movq	$0x0, 0x78(%rsp)
140225e23:     	movb	%dl, 0x80(%rsp)
140225e2a:     	movl	0x290(%rsp), %edx
140225e31:     	movl	0x293(%rsp), %r8d
140225e39:     	movl	%edx, 0x81(%rsp)
140225e40:     	movl	%r8d, 0x84(%rsp)
140225e48:     	movq	%rax, 0x88(%rsp)
140225e50:     	movq	%rcx, 0x90(%rsp)
140225e58:     	movl	$0x41c00000, 0x98(%rsp) # imm = 0x41C00000
140225e63:     	movw	$0x190, 0x9c(%rsp)      # imm = 0x190
140225e6d:     	movb	$0x1, 0x9e(%rsp)
140225e75:     	movl	0x1f0(%rsp), %eax
140225e7c:     	movl	%eax, 0xb0(%rsp)
140225e83:     	movaps	0x1e0(%rsp), %xmm0
140225e8b:     	movaps	%xmm0, 0xa0(%rsp)
140225e93:     	movups	0x5694a5e(%rip), %xmm0  # 0x1458ba8f8
140225e9a:     	movups	%xmm0, 0xb4(%rsp)
140225ea2:     	movl	%ebp, 0xc4(%rsp)
140225ea9:     	movsd	0x568233f(%rip), %xmm0  # 0x1458a81f0
140225eb1:     	movsd	%xmm0, 0xc8(%rsp)
140225eba:     	leaq	0x248(%rsp), %rcx
140225ec2:     	leaq	0x50(%rsp), %rdx
140225ec7:     	callq	0x1401ba0f0 <.text+0x1b90f0>
140225ecc:     	movq	%rbx, 0x58(%rsp)
140225ed1:     	movabsq	$0x100000000, %rax      # imm = 0x100000000
140225edb:     	movq	%rax, 0x50(%rsp)
140225ee0:     	movl	$0x41a00000, 0x28(%rsp) # imm = 0x41A00000
140225ee8:     	movq	$0x1, 0x20(%rsp)
140225ef1:     	leaq	0x56cdef4(%rip), %r9    # 0x1458f3dec
140225ef8:     	leaq	0x218(%rsp), %rcx
140225f00:     	leaq	0x50(%rsp), %r8
140225f05:     	movq	%rdi, %rdx
140225f08:     	callq	0x1400130e0 <.text+0x120e0>
140225f0d:     	movq	%rsi, %rax
140225f10:     	movaps	0x410(%rsp), %xmm6
140225f18:     	movaps	0x420(%rsp), %xmm7
140225f20:     	movaps	0x430(%rsp), %xmm8
140225f29:     	movaps	0x440(%rsp), %xmm9
140225f32:     	movaps	0x450(%rsp), %xmm10
140225f3b:     	movaps	0x460(%rsp), %xmm11
140225f44:     	movaps	0x470(%rsp), %xmm12
140225f4d:     	movaps	0x480(%rsp), %xmm13
140225f56:     	movaps	0x490(%rsp), %xmm14
140225f5f:     	movaps	0x4a0(%rsp), %xmm15
140225f68:     	addq	$0x4b8, %rsp            # imm = 0x4B8
140225f6f:     	popq	%rbx
140225f70:     	popq	%rbp
140225f71:     	popq	%rdi
140225f72:     	popq	%rsi
140225f73:     	popq	%r12
140225f75:     	popq	%r13
140225f77:     	popq	%r14
140225f79:     	popq	%r15
140225f7b:     	retq
140225f7c:     	ud2
