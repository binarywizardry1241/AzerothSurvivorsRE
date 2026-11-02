
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145500c50:     	pushq	%rsi
145500c51:     	pushq	%rdi
145500c52:     	pushq	%rbx
145500c53:     	subq	$0x30, %rsp
145500c57:     	movq	%r9, %rsi
145500c5a:     	movl	%r8d, %ebx
145500c5d:     	movl	%edx, %edi
145500c5f:     	callq	0x145500d30 <.text+0x54ffd30>
145500c64:     	movl	%eax, 0x20(%rsp)
145500c68:     	shrq	$0x20, %rax
145500c6c:     	movb	%al, 0x24(%rsp)
145500c70:     	callq	0x145501470 <.text+0x5500470>
145500c75:     	testq	%rax, %rax
145500c78:     	je	0x145500cbd <.text+0x54ffcbd>
145500c7a:     	movq	%rax, %rcx
145500c7d:     	movl	%edi, %edx
145500c7f:     	movl	%ebx, %r8d
145500c82:     	callq	0x145625c70 <.text+0x5624c70>
145500c87:     	testb	$0x1, %al
145500c89:     	je	0x145500cbd <.text+0x54ffcbd>
145500c8b:     	movabsq	$0xffffffff00, %rcx     # imm = 0xFFFFFFFF00
145500c95:     	andq	%rax, %rcx
145500c98:     	shrq	$0x8, %rcx
145500c9c:     	shrq	$0x28, %rax
145500ca0:     	movb	%al, 0x2c(%rsp)
145500ca4:     	movl	%ecx, 0x28(%rsp)
145500ca8:     	cmpq	$0x5, %rsi
145500cac:     	jae	0x145500d0e <.text+0x54ffd0e>
145500cae:     	movzbl	0x28(%rsp,%rsi), %eax
145500cb3:     	cmpb	$0x1, %al
145500cb5:     	adcl	$0x0, %eax
145500cb8:     	movzbl	%al, %ecx
145500cbb:     	jmp	0x145500cc8 <.text+0x54ffcc8>
145500cbd:     	movl	$0x1, %ecx
145500cc2:     	cmpq	$0x4, %rsi
145500cc6:     	ja	0x145500cf8 <.text+0x54ffcf8>
145500cc8:     	movzbl	0x20(%rsp,%rsi), %eax
145500ccd:     	addl	0x70(%rsp), %eax
145500cd1:     	cltd
145500cd2:     	idivl	%ecx
145500cd4:     	movl	%edx, %eax
145500cd6:     	sarl	$0x1f, %eax
145500cd9:     	andl	%ecx, %eax
145500cdb:     	addl	%edx, %eax
145500cdd:     	movb	%al, 0x20(%rsp,%rsi)
145500ce1:     	movl	0x20(%rsp), %ecx
145500ce5:     	movl	0x24(%rsp), %eax
145500ce9:     	shlq	$0x20, %rax
145500ced:     	orq	%rcx, %rax
145500cf0:     	addq	$0x30, %rsp
145500cf4:     	popq	%rbx
145500cf5:     	popq	%rdi
145500cf6:     	popq	%rsi
145500cf7:     	retq
145500cf8:     	leaq	0x14ace09(%rip), %r8    # 0x1469adb08
145500cff:     	movl	$0x5, %edx
145500d04:     	movq	%rsi, %rcx
145500d07:     	callq	0x1458e75b3 <.text+0x58e65b3>
145500d0c:     	ud2
145500d0e:     	leaq	0x14acb5b(%rip), %r8    # 0x1469ad870
145500d15:     	movl	$0x5, %edx
145500d1a:     	movq	%rsi, %rcx
145500d1d:     	callq	0x1458e75b3 <.text+0x58e65b3>
145500d22:     	ud2
