
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14545dc90:     	pushq	%rbp
14545dc91:     	pushq	%r15
14545dc93:     	pushq	%r14
14545dc95:     	pushq	%rsi
14545dc96:     	pushq	%rdi
14545dc97:     	pushq	%rbx
14545dc98:     	subq	$0x98, %rsp
14545dc9f:     	leaq	0x80(%rsp), %rbp
14545dca7:     	movq	$-0x2, 0x10(%rbp)
14545dcaf:     	movq	%r8, %rdi
14545dcb2:     	movq	%rdx, %rbx
14545dcb5:     	movq	%rcx, %rsi
14545dcb8:     	callq	0x140002200 <.text+0x1200>
14545dcbd:     	movl	$0x20, %ecx
14545dcc2:     	movl	$0x1, %edx
14545dcc7:     	callq	0x1400021c0 <.text+0x11c0>
14545dccc:     	testq	%rax, %rax
14545dccf:     	je	0x14545dec3 <.text+0x545cec3>
14545dcd5:     	movb	$0xa, (%rax)
14545dcd8:     	movq	$0x20, -0x50(%rbp)
14545dce0:     	movq	%rax, -0x48(%rbp)
14545dce4:     	movw	$0x96, -0x38(%rbp)
14545dcea:     	movl	$0x0, 0x1(%rax)
14545dcf1:     	movq	$0x5, -0x40(%rbp)
14545dcf9:     	movq	-0x50(%rbp), %rcx
14545dcfd:     	addq	$-0x5, %rcx
14545dd01:     	movl	$0x5, %eax
14545dd06:     	cmpq	$0x7, %rcx
14545dd0a:     	jbe	0x14545de42 <.text+0x545ce42>
14545dd10:     	movq	-0x48(%rbp), %rcx
14545dd14:     	movq	$0x0, (%rcx,%rax)
14545dd1c:     	addq	$0x8, %rax
14545dd20:     	movq	%rax, -0x40(%rbp)
14545dd24:     	movq	-0x40(%rbp), %rax
14545dd28:     	movq	%rax, (%rbp)
14545dd2c:     	movzwl	-0x38(%rbp), %eax
14545dd30:     	movw	%ax, 0x8(%rbp)
14545dd34:     	movl	-0x36(%rbp), %eax
14545dd37:     	movl	%eax, 0xa(%rbp)
14545dd3a:     	movzwl	-0x32(%rbp), %eax
14545dd3e:     	movw	%ax, 0xe(%rbp)
14545dd42:     	movups	-0x50(%rbp), %xmm0
14545dd46:     	movaps	%xmm0, -0x10(%rbp)
14545dd4a:     	movq	(%rbp), %rdx
14545dd4e:     	movq	-0x10(%rbp), %rax
14545dd52:     	subq	%rdx, %rax
14545dd55:     	cmpq	$0x3, %rax
14545dd59:     	jbe	0x14545de6f <.text+0x545ce6f>
14545dd5f:     	leal	0x1(%rdi), %eax
14545dd62:     	movq	-0x8(%rbp), %rcx
14545dd66:     	movl	%eax, (%rcx,%rdx)
14545dd69:     	addq	$0x4, %rdx
14545dd6d:     	movq	%rdx, (%rbp)
14545dd71:     	movaps	-0x10(%rbp), %xmm0
14545dd75:     	movaps	%xmm0, -0x30(%rbp)
14545dd79:     	movq	(%rbp), %rax
14545dd7d:     	movq	%rax, -0x20(%rbp)
14545dd81:     	movq	0x8(%rbp), %rax
14545dd85:     	movq	%rax, -0x18(%rbp)
14545dd89:     	movq	-0x20(%rbp), %r14
14545dd8d:     	movq	-0x30(%rbp), %r15
14545dd91:     	movq	%r15, %rax
14545dd94:     	subq	%r14, %rax
14545dd97:     	cmpq	%rax, %rdi
14545dd9a:     	ja	0x14545de97 <.text+0x545ce97>
14545dda0:     	testq	%rdi, %rdi
14545dda3:     	je	0x14545ddb7 <.text+0x545cdb7>
14545dda5:     	movq	-0x28(%rbp), %rcx
14545dda9:     	addq	%r14, %rcx
14545ddac:     	movq	%rbx, %rdx
14545ddaf:     	movq	%rdi, %r8
14545ddb2:     	callq	0x1457731ed <.text+0x57721ed>
14545ddb7:     	addq	%rdi, %r14
14545ddba:     	movq	%r14, -0x20(%rbp)
14545ddbe:     	cmpq	%r15, %r14
14545ddc1:     	jne	0x14545ddcd <.text+0x545cdcd>
14545ddc3:     	leaq	-0x30(%rbp), %rcx
14545ddc7:     	callq	0x145903690 <.text+0x5902690>
14545ddcc:     	nop
14545ddcd:     	movq	-0x28(%rbp), %rax
14545ddd1:     	movb	$0x0, (%rax,%r14)
14545ddd6:     	incq	%r14
14545ddd9:     	movq	%r14, -0x20(%rbp)
14545dddd:     	movaps	-0x30(%rbp), %xmm0
14545dde1:     	movaps	%xmm0, -0x10(%rbp)
14545dde5:     	movq	-0x20(%rbp), %rax
14545dde9:     	movq	%rax, (%rbp)
14545dded:     	movq	-0x18(%rbp), %rax
14545ddf1:     	movq	%rax, 0x8(%rbp)
14545ddf5:     	movq	(%rbp), %rdi
14545ddf9:     	cmpq	-0x10(%rbp), %rdi
14545ddfd:     	jne	0x14545de09 <.text+0x545ce09>
14545ddff:     	leaq	-0x10(%rbp), %rcx
14545de03:     	callq	0x145903690 <.text+0x5902690>
14545de08:     	nop
14545de09:     	movq	-0x8(%rbp), %rax
14545de0d:     	movb	$0x0, (%rax,%rdi)
14545de11:     	incq	%rdi
14545de14:     	movq	%rdi, (%rbp)
14545de18:     	movaps	-0x10(%rbp), %xmm0
14545de1c:     	movups	%xmm0, (%rsi)
14545de1f:     	movq	(%rbp), %rax
14545de23:     	movq	%rax, 0x10(%rsi)
14545de27:     	movq	0x8(%rbp), %rax
14545de2b:     	movq	%rax, 0x18(%rsi)
14545de2f:     	movq	%rsi, %rax
14545de32:     	addq	$0x98, %rsp
14545de39:     	popq	%rbx
14545de3a:     	popq	%rdi
14545de3b:     	popq	%rsi
14545de3c:     	popq	%r14
14545de3e:     	popq	%r15
14545de40:     	popq	%rbp
14545de41:     	retq
14545de42:     	movq	$0x1, 0x20(%rsp)
14545de4b:     	leaq	-0x50(%rbp), %rcx
14545de4f:     	movl	$0x5, %edx
14545de54:     	movl	$0x8, %r8d
14545de5a:     	movl	$0x1, %r9d
14545de60:     	callq	0x1457744b0 <.text+0x57734b0>
14545de65:     	nop
14545de66:     	movq	-0x40(%rbp), %rax
14545de6a:     	jmp	0x14545dd10 <.text+0x545cd10>
14545de6f:     	movq	$0x1, 0x20(%rsp)
14545de78:     	leaq	-0x10(%rbp), %rcx
14545de7c:     	movl	$0x4, %r8d
14545de82:     	movl	$0x1, %r9d
14545de88:     	callq	0x1457744b0 <.text+0x57734b0>
14545de8d:     	nop
14545de8e:     	movq	(%rbp), %rdx
14545de92:     	jmp	0x14545dd5f <.text+0x545cd5f>
14545de97:     	movq	$0x1, 0x20(%rsp)
14545dea0:     	leaq	-0x30(%rbp), %rcx
14545dea4:     	movl	$0x1, %r9d
14545deaa:     	movq	%r14, %rdx
14545dead:     	movq	%rdi, %r8
14545deb0:     	callq	0x1457744b0 <.text+0x57734b0>
14545deb5:     	nop
14545deb6:     	movq	-0x30(%rbp), %r15
14545deba:     	movq	-0x20(%rbp), %r14
14545debe:     	jmp	0x14545dda5 <.text+0x545cda5>
14545dec3:     	movl	$0x1, %ecx
14545dec8:     	movl	$0x20, %edx
14545decd:     	callq	0x14590379b <.text+0x590279b>
14545ded2:     	ud2
