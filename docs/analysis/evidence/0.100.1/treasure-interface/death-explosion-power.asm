
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ceaf7:     	movl	$0x35f4, %eax           # imm = 0x35F4
1454ceafc:     	movq	%rax, 0xf8(%rbp)
1454ceb03:     	movq	0x1e0(%rbp), %rcx
1454ceb0a:     	movq	0x1f0(%rbp), %r15
1454ceb11:     	movq	0x200(%rbp), %rax
1454ceb18:     	movd	%eax, %xmm3
1454ceb1c:     	movq	0x88(%rbp), %rdx
1454ceb23:     	movl	0x8(%rdx), %eax
1454ceb26:     	movl	%eax, 0x148(%rbp)
1454ceb2c:     	movq	(%rdx), %rax
1454ceb2f:     	movq	%rax, 0x140(%rbp)
1454ceb36:     	movq	%rcx, 0x120(%rbp)
1454ceb3d:     	leaq	0x120(%rbp), %rax
1454ceb44:     	movq	%rax, 0x20(%rsp)
1454ceb49:     	movq	$0x1, 0x28(%rsp)
1454ceb52:     	leaq	0x180(%rbp), %rcx
1454ceb59:     	movq	%r14, %rdx
1454ceb5c:     	leaq	0x140(%rbp), %r8
1454ceb63:     	callq	0x145500300 <.text+0x54ff300>
1454ceb68:     	nop
1454ceb69:     	movq	0x180(%rbp), %rax
1454ceb70:     	movq	%rax, 0x200(%rbp)
1454ceb77:     	movq	0x188(%rbp), %rax
1454ceb7e:     	movq	%rax, 0x208(%rbp)
1454ceb85:     	movq	0x190(%rbp), %rsi
1454ceb8c:     	testq	%rsi, %rsi
1454ceb8f:     	je	0x1454cebfe <.text+0x54cdbfe>
1454ceb91:     	movss	0x10(%rbp), %xmm9
1454ceb97:     	shlq	$0x3, %rsi
1454ceb9b:     	movq	0xf0(%rbp), %rax
1454ceba2:     	mulss	0x18(%rax), %xmm9
1454ceba8:     	movzbl	0x129(%r14), %ebx
1454cebb0:     	xorl	%edi, %edi
1454cebb2:     	movq	0x208(%rbp), %rax
1454cebb9:     	movq	(%rax,%rdi), %rdx
1454cebbd:     	movb	$0x3, 0x129(%r14)
1454cebc5:     	movzbl	0x217(%rbp), %eax
1454cebcc:     	movb	%al, 0x20(%rsp)
1454cebd0:     	movb	$0x0, 0x30(%rsp)
1454cebd5:     	movb	$0x0, 0x28(%rsp)
1454cebda:     	movq	%r14, %rcx
1454cebdd:     	movaps	%xmm9, %xmm2
1454cebe1:     	movq	0xf8(%rbp), %r9
1454cebe8:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454cebed:     	nop
1454cebee:     	movb	%bl, 0x129(%r14)
1454cebf5:     	addq	$0x8, %rdi
1454cebf9:     	cmpq	%rdi, %rsi
1454cebfc:     	jne	0x1454cebb2 <.text+0x54cdbb2>
1454cebfe:     	movq	0x200(%rbp), %rdx
1454cec05:     	testq	%rdx, %rdx
1454cec08:     	je	0x1454cec20 <.text+0x54cdc20>
1454cec0a:     	shlq	$0x3, %rdx
1454cec0e:     	movl	$0x8, %r8d
1454cec14:     	movq	0x208(%rbp), %rcx
1454cec1b:     	callq	0x1400021d0 <.text+0x11d0>
1454cec20:     	movq	%r15, %rdi
1454cec23:     	jmp	0x1454cbc68 <.text+0x54cac68>
