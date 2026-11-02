
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401a5a10:     	pushq	%rsi
1401a5a11:     	pushq	%rdi
1401a5a12:     	pushq	%rbx
1401a5a13:     	subq	$0x2f0, %rsp            # imm = 0x2F0
1401a5a1a:     	movq	%rcx, %rsi
1401a5a1d:     	movq	(%rcx), %rbx
1401a5a20:     	movq	0x28(%rcx), %rax
1401a5a24:     	movq	%rbx, 0x80(%rsp)
1401a5a2c:     	leaq	0x88(%rsp), %rdi
1401a5a34:     	movups	0x8(%rcx), %xmm0
1401a5a38:     	movups	%xmm0, 0x88(%rsp)
1401a5a40:     	movups	0x18(%rcx), %xmm0
1401a5a44:     	movups	%xmm0, 0x98(%rsp)
1401a5a4c:     	movq	%rax, 0xa8(%rsp)
1401a5a54:     	movups	0x5c12e25(%rip), %xmm0  # 0x145db8880
1401a5a5b:     	movaps	%xmm0, 0x20(%rsp)
1401a5a60:     	movq	$0x0, 0x30(%rsp)
1401a5a69:     	movups	0x5c12e28(%rip), %xmm1  # 0x145db8898
1401a5a70:     	movups	%xmm1, 0x38(%rsp)
1401a5a75:     	movq	$0x0, 0x48(%rsp)
1401a5a7e:     	movups	0x5c12e2b(%rip), %xmm1  # 0x145db88b0
1401a5a85:     	movaps	%xmm1, 0x50(%rsp)
1401a5a8a:     	movq	$0x0, 0x60(%rsp)
1401a5a93:     	movups	0x5c12e2e(%rip), %xmm2  # 0x145db88c8
1401a5a9a:     	movups	%xmm2, 0x68(%rsp)
1401a5a9f:     	movq	$0x0, 0x78(%rsp)
1401a5aa8:     	movaps	%xmm0, 0xb0(%rsp)
1401a5ab0:     	movq	0x30(%rsp), %rax
1401a5ab5:     	movq	%rax, 0xc0(%rsp)
1401a5abd:     	movq	0x38(%rsp), %rax
1401a5ac2:     	movq	%rax, 0xc8(%rsp)
1401a5aca:     	movq	0x40(%rsp), %rax
1401a5acf:     	movq	%rax, 0xd0(%rsp)
1401a5ad7:     	movq	0x48(%rsp), %rax
1401a5adc:     	movq	%rax, 0xd8(%rsp)
1401a5ae4:     	movaps	%xmm1, 0xe0(%rsp)
1401a5aec:     	movq	0x60(%rsp), %rax
1401a5af1:     	movq	%rax, 0xf0(%rsp)
1401a5af9:     	movq	0x68(%rsp), %rax
1401a5afe:     	movq	%rax, 0xf8(%rsp)
1401a5b06:     	movaps	0x70(%rsp), %xmm0
1401a5b0b:     	movaps	%xmm0, 0x100(%rsp)
1401a5b13:     	xorps	%xmm0, %xmm0
1401a5b16:     	movaps	%xmm0, 0x120(%rsp)
1401a5b1e:     	movaps	%xmm0, 0x110(%rsp)
1401a5b26:     	movq	$0x0, 0x130(%rsp)
1401a5b32:     	movups	%xmm0, 0x1e8(%rsp)
1401a5b3a:     	movups	%xmm0, 0x1d8(%rsp)
1401a5b42:     	movq	$0x0, 0x2b4(%rsp)
1401a5b4e:     	movw	$0x0, 0x2bc(%rsp)
1401a5b58:     	leaq	0x140(%rsp), %rcx
1401a5b60:     	leaq	0xb0(%rsp), %rdx
1401a5b68:     	movl	$0x88, %r8d
1401a5b6e:     	callq	0x145bc977b <.text+0x5bc877b>
1401a5b73:     	movaps	0x5c11fd6(%rip), %xmm0  # 0x145db7b50
1401a5b7a:     	movups	%xmm0, 0x1c8(%rsp)
1401a5b82:     	movups	0x5c12daf(%rip), %xmm0  # 0x145db8938
1401a5b89:     	movups	%xmm0, 0x1f8(%rsp)
1401a5b91:     	movups	0x5c12db0(%rip), %xmm0  # 0x145db8948
1401a5b98:     	movups	%xmm0, 0x208(%rsp)
1401a5ba0:     	movups	0x5c12db1(%rip), %xmm0  # 0x145db8958
1401a5ba7:     	movups	%xmm0, 0x218(%rsp)
1401a5baf:     	movups	0x5c12db2(%rip), %xmm0  # 0x145db8968
1401a5bb6:     	movups	%xmm0, 0x228(%rsp)
1401a5bbe:     	movups	0x5c12db3(%rip), %xmm0  # 0x145db8978
1401a5bc5:     	movups	%xmm0, 0x238(%rsp)
1401a5bcd:     	movups	0x5c12db4(%rip), %xmm0  # 0x145db8988
1401a5bd4:     	movups	%xmm0, 0x248(%rsp)
1401a5bdc:     	movups	0x5c12dc5(%rip), %xmm0  # 0x145db89a8
1401a5be3:     	movups	%xmm0, 0x268(%rsp)
1401a5beb:     	movups	0x5c12da6(%rip), %xmm0  # 0x145db8998
1401a5bf2:     	movups	%xmm0, 0x258(%rsp)
1401a5bfa:     	movaps	0x5bc765f(%rip), %xmm0  # 0x145d6d260
1401a5c01:     	movups	%xmm0, 0x278(%rsp)
1401a5c09:     	movl	$0x1, 0x288(%rsp)
1401a5c14:     	movq	$0x0, 0x28c(%rsp)
1401a5c20:     	movb	$0x1, 0x294(%rsp)
1401a5c28:     	movq	$0x0, 0x298(%rsp)
1401a5c34:     	movl	$0x3f800000, 0x2a0(%rsp) # imm = 0x3F800000
1401a5c3f:     	movw	$0x0, 0x2a4(%rsp)
1401a5c49:     	movl	$0x10000, 0x2a6(%rsp)   # imm = 0x10000
1401a5c54:     	movw	$0x0, 0x2aa(%rsp)
1401a5c5e:     	movabsq	$0x100000000010000, %rax # imm = 0x100000000010000
1401a5c68:     	movq	%rax, 0x2ac(%rsp)
1401a5c70:     	movsd	0x5c11ee8(%rip), %xmm0  # 0x145db7b60
1401a5c78:     	movsd	%xmm0, 0x2c0(%rsp)
1401a5c81:     	movl	$0x3fcccccd, 0x2c8(%rsp) # imm = 0x3FCCCCCD
1401a5c8c:     	movups	0x5c12fed(%rip), %xmm0  # 0x145db8c80
1401a5c93:     	movups	%xmm0, 0x2cc(%rsp)
1401a5c9b:     	movups	0x5c12fee(%rip), %xmm0  # 0x145db8c90
1401a5ca2:     	movups	%xmm0, 0x2dc(%rsp)
1401a5caa:     	movq	%rbx, 0x138(%rsp)
1401a5cb2:     	leaq	0x20(%rsp), %rcx
1401a5cb7:     	leaq	0x138(%rsp), %r8
1401a5cbf:     	movq	%rdi, %rdx
1401a5cc2:     	callq	0x14018f1b0 <.text+0x18e1b0>
1401a5cc7:     	movq	%rsi, %rax
1401a5cca:     	addq	$0x2f0, %rsp            # imm = 0x2F0
1401a5cd1:     	popq	%rbx
1401a5cd2:     	popq	%rdi
1401a5cd3:     	popq	%rsi
1401a5cd4:     	retq
