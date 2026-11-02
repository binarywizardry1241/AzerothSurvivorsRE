
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14545a870:     	pushq	%rbp
14545a871:     	pushq	%rsi
14545a872:     	pushq	%rdi
14545a873:     	pushq	%rbx
14545a874:     	subq	$0x48, %rsp
14545a878:     	leaq	0x40(%rsp), %rbp
14545a87d:     	movq	$-0x2, (%rbp)
14545a885:     	movl	%r8d, %ebx
14545a888:     	movl	%edx, %edi
14545a88a:     	movq	%rcx, %rsi
14545a88d:     	callq	0x140002200 <.text+0x1200>
14545a892:     	movl	$0x20, %ecx
14545a897:     	movl	$0x1, %edx
14545a89c:     	callq	0x1400021c0 <.text+0x11c0>
14545a8a1:     	testq	%rax, %rax
14545a8a4:     	je	0x14545a91e <.text+0x545991e>
14545a8a6:     	movl	%edi, (%rax)
14545a8a8:     	movb	$0x2, 0x4(%rax)
14545a8ac:     	movq	$0x20, -0x20(%rbp)
14545a8b4:     	movq	%rax, -0x18(%rbp)
14545a8b8:     	movq	$0x5, -0x10(%rbp)
14545a8c0:     	movw	$0x130, -0x8(%rbp)      # imm = 0x130
14545a8c6:     	movb	$0x1, %al
14545a8c8:     	testb	%al, %al
14545a8ca:     	jne	0x14545a8d6 <.text+0x54598d6>
14545a8cc:     	leaq	-0x20(%rbp), %rcx
14545a8d0:     	callq	0x145903690 <.text+0x5902690>
14545a8d5:     	nop
14545a8d6:     	movq	-0x18(%rbp), %rax
14545a8da:     	movb	%bl, 0x5(%rax)
14545a8dd:     	movq	$0x6, -0x10(%rbp)
14545a8e5:     	movq	-0x20(%rbp), %rax
14545a8e9:     	movq	%rax, (%rsi)
14545a8ec:     	movq	-0x18(%rbp), %rax
14545a8f0:     	movq	%rax, 0x8(%rsi)
14545a8f4:     	movq	-0x10(%rbp), %rax
14545a8f8:     	movq	%rax, 0x10(%rsi)
14545a8fc:     	movzwl	-0x8(%rbp), %eax
14545a900:     	movw	%ax, 0x18(%rsi)
14545a904:     	movl	-0x6(%rbp), %eax
14545a907:     	movl	%eax, 0x1a(%rsi)
14545a90a:     	movzwl	-0x2(%rbp), %eax
14545a90e:     	movw	%ax, 0x1e(%rsi)
14545a912:     	movq	%rsi, %rax
14545a915:     	addq	$0x48, %rsp
14545a919:     	popq	%rbx
14545a91a:     	popq	%rdi
14545a91b:     	popq	%rsi
14545a91c:     	popq	%rbp
14545a91d:     	retq
14545a91e:     	movl	$0x1, %ecx
14545a923:     	movl	$0x20, %edx
14545a928:     	callq	0x14590379b <.text+0x590279b>
14545a92d:     	ud2
