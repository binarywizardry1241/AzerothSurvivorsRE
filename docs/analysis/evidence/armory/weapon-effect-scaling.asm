
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454f0e80:     	pushq	%rbp
1454f0e81:     	pushq	%r15
1454f0e83:     	pushq	%r14
1454f0e85:     	pushq	%r13
1454f0e87:     	pushq	%r12
1454f0e89:     	pushq	%rsi
1454f0e8a:     	pushq	%rdi
1454f0e8b:     	pushq	%rbx
1454f0e8c:     	subq	$0x58, %rsp
1454f0e90:     	leaq	0x50(%rsp), %rbp
1454f0e95:     	movaps	%xmm6, -0x10(%rbp)
1454f0e99:     	movq	$-0x2, -0x18(%rbp)
1454f0ea1:     	movq	(%rcx), %rsi
1454f0ea4:     	movq	0x8(%rcx), %rdi
1454f0ea8:     	movq	(%rdx), %rax
1454f0eab:     	movq	0x8(%rdx), %r8
1454f0eaf:     	cmpq	%rdi, %rsi
1454f0eb2:     	je	0x1454f1041 <.text+0x54f0041>
1454f0eb8:     	movq	%rax, -0x28(%rbp)
1454f0ebc:     	movq	0x10(%rcx), %rbx
1454f0ec0:     	movq	0x10(%rdx), %rax
1454f0ec4:     	subq	%rsi, %rdi
1454f0ec7:     	shrq	$0x3, %rdi
1454f0ecb:     	movq	%r8, -0x20(%rbp)
1454f0ecf:     	leaq	(%rax,%r8,8), %r15
1454f0ed3:     	xorl	%r14d, %r14d
1454f0ed6:     	leaq	0x15c2113(%rip), %r12   # 0x146ab2ff0
1454f0edd:     	movss	0x3b76a3(%rip), %xmm6   # 0x1458a8588
1454f0ee5:     	leaq	0x15c2b18(%rip), %r13   # 0x146ab3a04
1454f0eec:     	jmp	0x1454f0f07 <.text+0x54eff07>
1454f0eee:     	movl	%edx, %ecx
1454f0ef0:     	shlq	$0x20, %rax
1454f0ef4:     	orq	%rcx, %rax
1454f0ef7:     	movq	%rax, (%r15,%r14,8)
1454f0efb:     	incq	%r14
1454f0efe:     	cmpq	%r14, %rdi
1454f0f01:     	je	0x1454f1036 <.text+0x54f0036>
1454f0f07:     	movq	(%rbx), %rcx
1454f0f0a:     	cmpq	$0x4, %rcx
1454f0f0e:     	ja	0x1454f1059 <.text+0x54f0059>
1454f0f14:     	movq	(%rsi,%r14,8), %rdx
1454f0f18:     	movss	(%r12,%rcx,4), %xmm0
1454f0f1e:     	mulss	%xmm6, %xmm0
1454f0f22:     	movq	%rdx, %rax
1454f0f25:     	shrq	$0x20, %rax
1454f0f29:     	movl	%edx, %ecx
1454f0f2b:     	movslq	(%r13,%rcx,4), %rcx
1454f0f30:     	addq	%r13, %rcx
1454f0f33:     	jmpq	*%rcx
1454f0f35:     	movd	%eax, %xmm1
1454f0f39:     	mulss	%xmm1, %xmm0
1454f0f3d:     	movd	%xmm0, %eax
1454f0f41:     	xorl	%ecx, %ecx
1454f0f43:     	jmp	0x1454f0ef0 <.text+0x54efef0>
1454f0f45:     	movd	%eax, %xmm1
1454f0f49:     	mulss	%xmm1, %xmm0
1454f0f4d:     	movd	%xmm0, %eax
1454f0f51:     	movl	$0x4, %ecx
1454f0f56:     	jmp	0x1454f0ef0 <.text+0x54efef0>
1454f0f58:     	movd	%eax, %xmm1
1454f0f5c:     	mulss	%xmm1, %xmm0
1454f0f60:     	movd	%xmm0, %eax
1454f0f64:     	movl	$0xc, %ecx
1454f0f69:     	jmp	0x1454f0ef0 <.text+0x54efef0>
1454f0f6b:     	movd	%eax, %xmm1
1454f0f6f:     	mulss	%xmm1, %xmm0
1454f0f73:     	movd	%xmm0, %eax
1454f0f77:     	movl	$0x9, %ecx
1454f0f7c:     	jmp	0x1454f0ef0 <.text+0x54efef0>
1454f0f81:     	movd	%eax, %xmm1
1454f0f85:     	mulss	%xmm1, %xmm0
1454f0f89:     	callq	0x145714a5d <.text+0x5713a5d>
1454f0f8e:     	movd	%xmm0, %eax
1454f0f92:     	movl	$0x2, %ecx
1454f0f97:     	jmp	0x1454f0ef0 <.text+0x54efef0>
1454f0f9c:     	movd	%eax, %xmm1
1454f0fa0:     	mulss	%xmm1, %xmm0
1454f0fa4:     	movd	%xmm0, %eax
1454f0fa8:     	movl	$0x3, %ecx
1454f0fad:     	jmp	0x1454f0ef0 <.text+0x54efef0>
1454f0fb2:     	movd	%eax, %xmm1
1454f0fb6:     	mulss	%xmm1, %xmm0
1454f0fba:     	movd	%xmm0, %eax
1454f0fbe:     	movl	$0x7, %ecx
1454f0fc3:     	jmp	0x1454f0ef0 <.text+0x54efef0>
1454f0fc8:     	movd	%eax, %xmm1
1454f0fcc:     	mulss	%xmm1, %xmm0
1454f0fd0:     	movd	%xmm0, %eax
1454f0fd4:     	movl	$0x1, %ecx
1454f0fd9:     	jmp	0x1454f0ef0 <.text+0x54efef0>
1454f0fde:     	movd	%eax, %xmm1
1454f0fe2:     	mulss	%xmm1, %xmm0
1454f0fe6:     	movd	%xmm0, %eax
1454f0fea:     	movl	$0x5, %ecx
1454f0fef:     	jmp	0x1454f0ef0 <.text+0x54efef0>
1454f0ff4:     	movd	%eax, %xmm1
1454f0ff8:     	mulss	%xmm1, %xmm0
1454f0ffc:     	movd	%xmm0, %eax
1454f1000:     	movl	$0x6, %ecx
1454f1005:     	jmp	0x1454f0ef0 <.text+0x54efef0>
1454f100a:     	movd	%eax, %xmm1
1454f100e:     	mulss	%xmm1, %xmm0
1454f1012:     	movd	%xmm0, %eax
1454f1016:     	movl	$0xa, %ecx
1454f101b:     	jmp	0x1454f0ef0 <.text+0x54efef0>
1454f1020:     	movd	%eax, %xmm1
1454f1024:     	mulss	%xmm1, %xmm0
1454f1028:     	movd	%xmm0, %eax
1454f102c:     	movl	$0x8, %ecx
1454f1031:     	jmp	0x1454f0ef0 <.text+0x54efef0>
1454f1036:     	movq	-0x20(%rbp), %r8
1454f103a:     	addq	%r14, %r8
1454f103d:     	movq	-0x28(%rbp), %rax
1454f1041:     	movq	%r8, (%rax)
1454f1044:     	movaps	-0x10(%rbp), %xmm6
1454f1048:     	addq	$0x58, %rsp
1454f104c:     	popq	%rbx
1454f104d:     	popq	%rdi
1454f104e:     	popq	%rsi
1454f104f:     	popq	%r12
1454f1051:     	popq	%r13
1454f1053:     	popq	%r14
1454f1055:     	popq	%r15
1454f1057:     	popq	%rbp
1454f1058:     	retq
1454f1059:     	addq	%r14, -0x20(%rbp)
1454f105d:     	leaq	0x15c1fdc(%rip), %r8    # 0x146ab3040
1454f1064:     	movl	$0x5, %edx
1454f1069:     	callq	0x1458a3f23 <.text+0x58a2f23>
1454f106e:     	nop
1454f106f:     	ud2
