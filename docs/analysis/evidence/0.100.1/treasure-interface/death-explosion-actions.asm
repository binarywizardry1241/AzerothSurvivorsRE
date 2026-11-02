
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ce981:     	cmpq	(%rsi), %rdi
1454ce984:     	movq	0x1d8(%rbp), %r14
1454ce98b:     	jne	0x1454ce996 <.text+0x54cd996>
1454ce98d:     	movq	%rsi, %rcx
1454ce990:     	callq	0x145777a50 <.text+0x5776a50>
1454ce995:     	nop
1454ce996:     	movq	0x8(%rsi), %rax
1454ce99a:     	movss	%xmm11, (%rax,%rdi,4)
1454ce9a0:     	incq	%rdi
1454ce9a3:     	movq	%rdi, 0x10(%rsi)
1454ce9a7:     	movq	0xf8(%rbp), %r8
1454ce9ae:     	testl	%r8d, %r8d
1454ce9b1:     	je	0x1454ceaf7 <.text+0x54cdaf7>
1454ce9b7:     	movq	0x108(%rbp), %rax
1454ce9be:     	movq	(%rax), %rdx
1454ce9c1:     	movq	0x88(%rbp), %r9
1454ce9c8:     	movl	0x8(%r9), %eax
1454ce9cc:     	leaq	0x148(%rbp), %rcx
1454ce9d3:     	movl	%eax, 0x4(%rcx)
1454ce9d6:     	movq	(%r9), %rax
1454ce9d9:     	movq	%rax, -0x4(%rcx)
1454ce9dd:     	movl	$0x1, 0x140(%rbp)
1454ce9e7:     	movl	$0x0, 0x120(%rbp)
1454ce9f1:     	leaq	0x120(%rbp), %rax
1454ce9f8:     	movq	%rax, 0x30(%rsp)
1454ce9fd:     	leaq	0x140(%rbp), %rax
1454cea04:     	movq	%rax, 0x28(%rsp)
1454cea09:     	movq	$0x0, 0x20(%rsp)
1454cea12:     	movl	$0x8, %r9d
1454cea18:     	leaq	0x180(%rbp), %rcx
1454cea1f:     	callq	0x145466ab0 <.text+0x5465ab0>
1454cea24:     	nop
1454cea25:     	movq	0x1f0(%rbp), %r15
1454cea2c:     	movq	0x560(%r14), %rsi
1454cea33:     	cmpq	0x550(%r14), %rsi
1454cea3a:     	jne	0x1454cea49 <.text+0x54cda49>
1454cea3c:     	movq	0x110(%rbp), %rcx
1454cea43:     	callq	0x145774710 <.text+0x5773710>
1454cea48:     	nop
1454cea49:     	movq	0x558(%r14), %rax
1454cea50:     	movq	%rsi, %rcx
1454cea53:     	shlq	$0x5, %rcx
1454cea57:     	movups	0x180(%rbp), %xmm0
1454cea5e:     	movups	0x190(%rbp), %xmm1
1454cea65:     	movups	%xmm1, 0x10(%rax,%rcx)
1454cea6a:     	movups	%xmm0, (%rax,%rcx)
1454cea6e:     	incq	%rsi
1454cea71:     	movq	%rsi, 0x560(%r14)
1454cea78:     	movq	0x1e0(%rbp), %rcx
1454cea7f:     	jmp	0x1454ceb11 <.text+0x54cdb11>
