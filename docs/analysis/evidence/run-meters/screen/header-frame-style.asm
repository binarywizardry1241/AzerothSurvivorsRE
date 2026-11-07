
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401d2a85:     	callq	0x140002200 <.text+0x1200>
1401d2a8a:     	movl	$0x40, %ecx
1401d2a8f:     	movl	$0x4, %edx
1401d2a94:     	callq	0x1400021c0 <.text+0x11c0>
1401d2a99:     	testq	%rax, %rax
1401d2a9c:     	je	0x1401d5273 <.text+0x1d4273>
1401d2aa2:     	movq	%rax, 0x228(%rbp)
1401d2aa9:     	movaps	0x5be5600(%rip), %xmm0  # 0x145db80b0
1401d2ab0:     	movups	%xmm0, 0x2a4(%rbp)
1401d2ab7:     	movl	$0x0, 0x2a0(%rbp)
1401d2ac1:     	leaq	0x230(%rbp), %rcx
1401d2ac8:     	leaq	0x2a0(%rbp), %rdx
1401d2acf:     	callq	0x144c67100 <.text+0x4c66100>
1401d2ad4:     	nop
1401d2ad5:     	movaps	0x230(%rbp), %xmm6
1401d2adc:     	movaps	0x5be55dd(%rip), %xmm0  # 0x145db80c0
1401d2ae3:     	movups	%xmm0, 0x2a4(%rbp)
1401d2aea:     	movl	$0x0, 0x2a0(%rbp)
1401d2af4:     	leaq	0x230(%rbp), %rcx
1401d2afb:     	leaq	0x2a0(%rbp), %rdx
1401d2b02:     	callq	0x144c67100 <.text+0x4c66100>
1401d2b07:     	nop
1401d2b08:     	movaps	0x230(%rbp), %xmm0
1401d2b0f:     	movq	0x228(%rbp), %r12
1401d2b16:     	movl	$0x0, (%r12)
1401d2b1e:     	movl	$0x1, 0x8(%r12)
1401d2b27:     	movups	%xmm6, 0xc(%r12)
1401d2b2d:     	movq	$0x3f000000, 0x1c(%r12) # imm = 0x3F000000
1401d2b36:     	movl	$0x1, 0x28(%r12)
1401d2b3f:     	movups	%xmm0, 0x2c(%r12)
1401d2b45:     	movl	$0x3f000000, 0x3c(%r12) # imm = 0x3F000000
1401d2b4e:     	callq	0x140002200 <.text+0x1200>
1401d2b53:     	movl	$0x48, %ecx
1401d2b58:     	movl	$0x8, %edx
1401d2b5d:     	callq	0x1400021c0 <.text+0x11c0>
1401d2b62:     	testq	%rax, %rax
1401d2b65:     	je	0x1401d525e <.text+0x1d425e>
1401d2b6b:     	movq	%rax, %rbx
1401d2b6e:     	leaq	-0x48(%rbp), %r14
1401d2b72:     	movq	$0x2, 0x8(%rax)
1401d2b7a:     	movq	%r12, 0x10(%rax)
1401d2b7e:     	movq	$0x2, 0x18(%rax)
1401d2b86:     	movl	$0x40490fdb, 0x20(%rax) # imm = 0x40490FDB
1401d2b8d:     	movb	$0x0, 0x24(%rax)
1401d2b91:     	movabsq	$-0x8000000000000000, %rax # imm = 0x8000000000000000
1401d2b9b:     	movq	%rax, (%rbx)
1401d2b9e:     	leaq	0x2a8(%rbp), %rcx
1401d2ba5:     	leaq	0xa0(%rbp), %rdx
1401d2bac:     	movl	$0x180, %r8d            # imm = 0x180
1401d2bb2:     	callq	0x145bc977b <.text+0x5bc877b>
1401d2bb7:     	movq	$0x1, 0x428(%rbp)
1401d2bc2:     	movq	%rbx, 0x430(%rbp)
1401d2bc9:     	movq	$0x1, 0x438(%rbp)
1401d2bd4:     	movups	0x5be5e24(%rip), %xmm8  # 0x145db8a00
1401d2bdc:     	movups	%xmm8, 0x440(%rbp)
1401d2be4:     	movl	$0x3f333333, 0x450(%rbp) # imm = 0x3F333333
1401d2bee:     	movups	%xmm8, 0x454(%rbp)
1401d2bf6:     	movl	$0x3f333333, 0x464(%rbp) # imm = 0x3F333333
1401d2c00:     	movups	%xmm8, 0x468(%rbp)
1401d2c08:     	movl	$0x3f333333, 0x478(%rbp) # imm = 0x3F333333
1401d2c12:     	movups	%xmm8, 0x47c(%rbp)
1401d2c1a:     	movl	$0x3f333333, 0x48c(%rbp) # imm = 0x3F333333
1401d2c24:     	movw	$0x2, 0x490(%rbp)
1401d2c2d:     	movq	%rsi, 0x228(%rbp)
1401d2c34:     	movq	%rsi, 0x2a0(%rbp)
1401d2c3b:     	leaq	-0x20(%rbp), %rcx
1401d2c3f:     	leaq	0x2a0(%rbp), %r8
1401d2c46:     	movq	%r14, %rdx
1401d2c49:     	callq	0x140194f80 <.text+0x193f80>
