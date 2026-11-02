
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14554cc40:     	pushq	%rbp
14554cc41:     	pushq	%r15
14554cc43:     	pushq	%r14
14554cc45:     	pushq	%r13
14554cc47:     	pushq	%r12
14554cc49:     	pushq	%rsi
14554cc4a:     	pushq	%rdi
14554cc4b:     	pushq	%rbx
14554cc4c:     	subq	$0x58, %rsp
14554cc50:     	leaq	0x50(%rsp), %rbp
14554cc55:     	movaps	%xmm6, -0x10(%rbp)
14554cc59:     	movq	$-0x2, -0x18(%rbp)
14554cc61:     	movq	(%rcx), %rsi
14554cc64:     	movq	0x8(%rcx), %rdi
14554cc68:     	movq	(%rdx), %rax
14554cc6b:     	movq	0x8(%rdx), %r8
14554cc6f:     	cmpq	%rdi, %rsi
14554cc72:     	je	0x14554ce01 <.text+0x554be01>
14554cc78:     	movq	%rax, -0x28(%rbp)
14554cc7c:     	movq	0x10(%rcx), %rbx
14554cc80:     	movq	0x10(%rdx), %rax
14554cc84:     	subq	%rsi, %rdi
14554cc87:     	shrq	$0x3, %rdi
14554cc8b:     	movq	%r8, -0x20(%rbp)
14554cc8f:     	leaq	(%rax,%r8,8), %r15
14554cc93:     	xorl	%r14d, %r14d
14554cc96:     	leaq	0x17e9f13(%rip), %r12   # 0x146d36bb0
14554cc9d:     	movss	0x3fb22f(%rip), %xmm6   # 0x145947ed4
14554cca5:     	leaq	0x17ea92c(%rip), %r13   # 0x146d375d8
14554ccac:     	jmp	0x14554ccc7 <.text+0x554bcc7>
14554ccae:     	movl	%edx, %ecx
14554ccb0:     	shlq	$0x20, %rax
14554ccb4:     	orq	%rcx, %rax
14554ccb7:     	movq	%rax, (%r15,%r14,8)
14554ccbb:     	incq	%r14
14554ccbe:     	cmpq	%r14, %rdi
14554ccc1:     	je	0x14554cdf6 <.text+0x554bdf6>
14554ccc7:     	movq	(%rbx), %rcx
14554ccca:     	cmpq	$0x5, %rcx
14554ccce:     	ja	0x14554ce19 <.text+0x554be19>
14554ccd4:     	movq	(%rsi,%r14,8), %rdx
14554ccd8:     	movss	(%r12,%rcx,4), %xmm0
14554ccde:     	mulss	%xmm6, %xmm0
14554cce2:     	movq	%rdx, %rax
14554cce5:     	shrq	$0x20, %rax
14554cce9:     	movl	%edx, %ecx
14554cceb:     	movslq	(%r13,%rcx,4), %rcx
14554ccf0:     	addq	%r13, %rcx
14554ccf3:     	jmpq	*%rcx
14554ccf5:     	movd	%eax, %xmm1
14554ccf9:     	mulss	%xmm1, %xmm0
14554ccfd:     	movd	%xmm0, %eax
14554cd01:     	xorl	%ecx, %ecx
14554cd03:     	jmp	0x14554ccb0 <.text+0x554bcb0>
14554cd05:     	movd	%eax, %xmm1
14554cd09:     	mulss	%xmm1, %xmm0
14554cd0d:     	movd	%xmm0, %eax
14554cd11:     	movl	$0x4, %ecx
14554cd16:     	jmp	0x14554ccb0 <.text+0x554bcb0>
14554cd18:     	movd	%eax, %xmm1
14554cd1c:     	mulss	%xmm1, %xmm0
14554cd20:     	movd	%xmm0, %eax
14554cd24:     	movl	$0xc, %ecx
14554cd29:     	jmp	0x14554ccb0 <.text+0x554bcb0>
14554cd2b:     	movd	%eax, %xmm1
14554cd2f:     	mulss	%xmm1, %xmm0
14554cd33:     	movd	%xmm0, %eax
14554cd37:     	movl	$0x9, %ecx
14554cd3c:     	jmp	0x14554ccb0 <.text+0x554bcb0>
14554cd41:     	movd	%eax, %xmm1
14554cd45:     	mulss	%xmm1, %xmm0
14554cd49:     	callq	0x14577322f <.text+0x577222f>
14554cd4e:     	movd	%xmm0, %eax
14554cd52:     	movl	$0x2, %ecx
14554cd57:     	jmp	0x14554ccb0 <.text+0x554bcb0>
14554cd5c:     	movd	%eax, %xmm1
14554cd60:     	mulss	%xmm1, %xmm0
14554cd64:     	movd	%xmm0, %eax
14554cd68:     	movl	$0x3, %ecx
14554cd6d:     	jmp	0x14554ccb0 <.text+0x554bcb0>
14554cd72:     	movd	%eax, %xmm1
14554cd76:     	mulss	%xmm1, %xmm0
14554cd7a:     	movd	%xmm0, %eax
14554cd7e:     	movl	$0x7, %ecx
14554cd83:     	jmp	0x14554ccb0 <.text+0x554bcb0>
14554cd88:     	movd	%eax, %xmm1
14554cd8c:     	mulss	%xmm1, %xmm0
14554cd90:     	movd	%xmm0, %eax
14554cd94:     	movl	$0x1, %ecx
14554cd99:     	jmp	0x14554ccb0 <.text+0x554bcb0>
14554cd9e:     	movd	%eax, %xmm1
14554cda2:     	mulss	%xmm1, %xmm0
14554cda6:     	movd	%xmm0, %eax
14554cdaa:     	movl	$0x5, %ecx
14554cdaf:     	jmp	0x14554ccb0 <.text+0x554bcb0>
14554cdb4:     	movd	%eax, %xmm1
14554cdb8:     	mulss	%xmm1, %xmm0
14554cdbc:     	movd	%xmm0, %eax
14554cdc0:     	movl	$0x6, %ecx
14554cdc5:     	jmp	0x14554ccb0 <.text+0x554bcb0>
14554cdca:     	movd	%eax, %xmm1
14554cdce:     	mulss	%xmm1, %xmm0
14554cdd2:     	movd	%xmm0, %eax
14554cdd6:     	movl	$0xa, %ecx
14554cddb:     	jmp	0x14554ccb0 <.text+0x554bcb0>
14554cde0:     	movd	%eax, %xmm1
14554cde4:     	mulss	%xmm1, %xmm0
14554cde8:     	movd	%xmm0, %eax
14554cdec:     	movl	$0x8, %ecx
14554cdf1:     	jmp	0x14554ccb0 <.text+0x554bcb0>
14554cdf6:     	movq	-0x20(%rbp), %r8
14554cdfa:     	addq	%r14, %r8
14554cdfd:     	movq	-0x28(%rbp), %rax
14554ce01:     	movq	%r8, (%rax)
14554ce04:     	movaps	-0x10(%rbp), %xmm6
14554ce08:     	addq	$0x58, %rsp
14554ce0c:     	popq	%rbx
14554ce0d:     	popq	%rdi
14554ce0e:     	popq	%rsi
14554ce0f:     	popq	%r12
14554ce11:     	popq	%r13
14554ce13:     	popq	%r14
14554ce15:     	popq	%r15
14554ce17:     	popq	%rbp
14554ce18:     	retq
14554ce19:     	addq	%r14, -0x20(%rbp)
14554ce1d:     	leaq	0x17e9da4(%rip), %r8    # 0x146d36bc8
14554ce24:     	movl	$0x6, %edx
14554ce29:     	callq	0x145903b33 <.text+0x5902b33>
14554ce2e:     	nop
14554ce2f:     	ud2
