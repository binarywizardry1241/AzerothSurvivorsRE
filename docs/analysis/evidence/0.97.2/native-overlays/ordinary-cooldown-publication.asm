
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14549ec0f:     	testb	%r8b, %r8b
14549ec12:     	je	0x14549ed7f <.text+0x549dd7f>
14549ec18:     	movss	0xc(%rcx), %xmm1
14549ec1d:     	movaps	%xmm1, %xmm2
14549ec20:     	minss	%xmm0, %xmm2
14549ec24:     	movaps	%xmm2, %xmm0
14549ec27:     	cmpunordss	%xmm2, %xmm0
14549ec2c:     	movaps	%xmm0, %xmm3
14549ec2f:     	andnps	%xmm2, %xmm3
14549ec32:     	andps	%xmm1, %xmm0
14549ec35:     	orps	%xmm3, %xmm0
14549ec38:     	movss	%xmm0, 0xc(%rcx)
14549ec3d:     	mulss	%xmm11, %xmm0
14549ec42:     	cvttss2si	%xmm0, %rcx
14549ec47:     	ucomiss	%xmm10, %xmm0
14549ec4b:     	movl	$0x0, %edx
14549ec50:     	cmovbl	%edx, %ecx
14549ec53:     	ucomiss	%xmm12, %xmm0
14549ec57:     	movl	0x40(%rax), %ebx
14549ec5a:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
14549ec5f:     	cmoval	%eax, %ecx
14549ec62:     	movq	0x3d0(%r13), %rdx
14549ec69:     	movl	%ebx, 0x230(%rbp)
14549ec6f:     	movl	%ecx, 0x234(%rbp)
14549ec75:     	movb	%r12b, 0x377(%rbp)
14549ec7c:     	movl	$0x1, %r9d
14549ec82:     	leaq	0xa0(%rbp), %rcx
14549ec89:     	leaq	0x230(%rbp), %r8
14549ec90:     	callq	0x145442f60 <.text+0x5441f60>
14549ec95:     	nop
14549ec96:     	movq	0x548(%r13), %rsi
14549ec9d:     	cmpq	0x538(%r13), %rsi
14549eca4:     	jne	0x14549ecb3 <.text+0x549dcb3>
14549eca6:     	movq	0x348(%rbp), %rcx
14549ecad:     	callq	0x1457580b0 <.text+0x57570b0>
14549ecb2:     	nop
14549ecb3:     	movq	0x540(%r13), %rax
14549ecba:     	movq	%rsi, %rcx
14549ecbd:     	shlq	$0x5, %rcx
14549ecc1:     	movups	0xa0(%rbp), %xmm0
14549ecc8:     	movups	0xb0(%rbp), %xmm1
14549eccf:     	movups	%xmm1, 0x10(%rax,%rcx)
14549ecd4:     	movups	%xmm0, (%rax,%rcx)
14549ecd8:     	incq	%rsi
14549ecdb:     	movq	%rsi, 0x548(%r13)
14549ece2:     	movq	0x3d0(%r13), %rsi
14549ece9:     	callq	0x140002200 <.text+0x1200>
14549ecee:     	movl	$0x20, %ecx
14549ecf3:     	movl	$0x1, %edx
14549ecf8:     	callq	0x1400021c0 <.text+0x11c0>
14549ecfd:     	testq	%rax, %rax
14549ed00:     	je	0x1454aac08 <.text+0x54a9c08>
14549ed06:     	movl	%ebx, (%rax)
14549ed08:     	movq	%rax, 0x358(%rbp)
14549ed0f:     	movq	%rsi, 0x4(%rax)
14549ed13:     	movq	0x548(%r13), %rsi
14549ed1a:     	cmpq	0x538(%r13), %rsi
14549ed21:     	jne	0x14549ed30 <.text+0x549dd30>
14549ed23:     	movq	0x348(%rbp), %rcx
14549ed2a:     	callq	0x1457580b0 <.text+0x57570b0>
14549ed2f:     	nop
14549ed30:     	movq	0x540(%r13), %rax
14549ed37:     	movq	%rsi, %rcx
14549ed3a:     	shlq	$0x5, %rcx
14549ed3e:     	movq	$0x20, (%rax,%rcx)
14549ed46:     	movq	0x358(%rbp), %rdx
14549ed4d:     	movq	%rdx, 0x8(%rax,%rcx)
14549ed52:     	movq	$0xc, 0x10(%rax,%rcx)
14549ed5b:     	movw	$0x135, 0x18(%rax,%rcx) # imm = 0x135
14549ed62:     	incq	%rsi
14549ed65:     	movq	%rsi, 0x548(%r13)
14549ed6c:     	movl	0x340(%rbp), %r12d
14549ed73:     	movq	0x338(%rbp), %rsi
14549ed7a:     	jmp	0x14549e4ea <.text+0x549d4ea>
14549ed7f:     	movl	$0x3e4ccccd, 0xc(%rcx)  # imm = 0x3E4CCCCD
14549ed86:     	jmp	0x14549e4ea <.text+0x549d4ea>
