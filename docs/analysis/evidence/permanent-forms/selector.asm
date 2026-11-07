
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458f5f7d:     	movq	0x7b0(%rdi), %rax
1458f5f84:     	testq	%rax, %rax
1458f5f87:     	je	0x1458f5fe9 <.text+0x58f4fe9>
1458f5f89:     	movq	0x7a8(%rdi), %rcx
1458f5f90:     	shlq	$0x6, %rax
1458f5f94:     	xorl	%edx, %edx
1458f5f96:     	jmp	0x1458f5fa9 <.text+0x58f4fa9>
1458f5f98:     	nopl	(%rax,%rax)
1458f5fa0:     	addq	$0x40, %rdx
1458f5fa4:     	cmpq	%rdx, %rax
1458f5fa7:     	je	0x1458f5fe9 <.text+0x58f4fe9>
1458f5fa9:     	cmpb	$0x19, (%rcx,%rdx)
1458f5fad:     	jne	0x1458f5fa0 <.text+0x58f4fa0>
1458f5faf:     	movl	0x4(%rcx,%rdx), %r8d
1458f5fb4:     	cmpl	$0x25a2, %r8d           # imm = 0x25A2
1458f5fbb:     	je	0x1458f6c6a <.text+0x58f5c6a>
1458f5fc1:     	cmpl	$0x300, %r8d            # imm = 0x300
1458f5fc8:     	jne	0x1458f5fa0 <.text+0x58f4fa0>
1458f5fca:     	cmpb	$0x6, %r15b
1458f5fce:     	movl	$0x217b, %eax           # imm = 0x217B
1458f5fd3:     	movl	$0x37c, %r8d            # imm = 0x37C
1458f5fd9:     	cmovel	%eax, %r8d
1458f5fdd:     	movl	$0x1, %eax
1458f5fe2:     	cmpl	$0x1, %eax
1458f5fe5:     	jne	0x1458f5ff0 <.text+0x58f4ff0>
1458f5fe7:     	jmp	0x1458f6026 <.text+0x58f5026>
1458f5fe9:     	xorl	%eax, %eax
1458f5feb:     	cmpl	$0x1, %eax
1458f5fee:     	je	0x1458f6026 <.text+0x58f5026>
1458f5ff0:     	cmpb	$0x6, %r13b
1458f5ff4:     	ja	0x1458f6014 <.text+0x58f5014>
1458f5ff6:     	movzbl	%r13b, %eax
1458f5ffa:     	shll	$0x2, %eax
1458f5ffd:     	leaq	0x1585080(%rip), %rcx   # 0x146e7b084
1458f6004:     	movl	(%rax,%rcx), %r8d
1458f6008:     	leaq	0x1585091(%rip), %rcx   # 0x146e7b0a0
1458f600f:     	movl	(%rax,%rcx), %eax
1458f6012:     	jmp	0x1458f601f <.text+0x58f501f>
1458f6014:     	movl	$0x31, %eax
1458f6019:     	movl	$0x32, %r8d
1458f601f:     	testb	%sil, %sil
1458f6022:     	cmovel	%eax, %r8d
