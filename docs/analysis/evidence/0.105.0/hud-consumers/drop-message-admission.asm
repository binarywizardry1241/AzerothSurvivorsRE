
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14005c039:     	cmpl	$0x73736f62, (%rax)     # imm = 0x73736F62
14005c03f:     	je	0x14005c5e6 <.text+0x5b5e6>
14005c045:     	cmpl	$0x706f7264, (%rax)     # imm = 0x706F7264
14005c04b:     	jne	0x14005d500 <.text+0x5c500>
14005c051:     	movq	0x248(%rbp), %rax
14005c058:     	movl	0x274(%rbp), %ecx
14005c05e:     	movl	%ecx, (%rax)
14005c060:     	movzbl	0x170(%rbp), %ebx
14005c067:     	movzbl	%bl, %eax
14005c06a:     	leaq	0x5d17c13(%rip), %rcx   # 0x145d73c84
14005c071:     	movslq	(%rcx,%rax,4), %rax
14005c075:     	addq	%rcx, %rax
14005c078:     	jmpq	*%rax
14005c07a:     	movzbl	0x171(%rbp), %eax
14005c081:     	movb	%al, 0x1a1(%rbp)
14005c087:     	jmp	0x14005d9eb <.text+0x5c9eb>
