
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ccd8a:     	leaq	0x1(%rdx), %rcx
1454ccd8e:     	cmpq	%rdi, %rcx
1454ccd91:     	jae	0x1454ccdd0 <.text+0x54cbdd0>
1454ccd93:     	leal	(%rdi,%rdx), %r9d
1454ccd97:     	movq	%rdx, %r8
1454ccd9a:     	testb	$0x1, %r9b
1454ccd9e:     	jne	0x1454ccdc4 <.text+0x54cbdc4>
1454ccda0:     	movss	0x4(%rax,%rdx,4), %xmm0
1454ccda6:     	movaps	%xmm11, %xmm1
1454ccdaa:     	subss	%xmm0, %xmm1
1454ccdae:     	ucomiss	%xmm1, %xmm15
1454ccdb2:     	movq	%rdx, %r8
1454ccdb5:     	jbe	0x1454ccdc0 <.text+0x54cbdc0>
1454ccdb7:     	movss	%xmm0, (%rax,%rdx,4)
1454ccdbc:     	leaq	0x1(%rdx), %r8
1454ccdc0:     	leaq	0x2(%rdx), %rcx
1454ccdc4:     	leaq	-0x2(%rdi), %r9
1454ccdc8:     	cmpq	%rdx, %r9
1454ccdcb:     	movq	%r8, %rdx
1454ccdce:     	jne	0x1454ccdf8 <.text+0x54cbdf8>
1454ccdd0:     	movq	%rdx, 0x10(%rbx)
1454ccdd4:     	movq	%rdx, %rdi
1454ccdd7:     	cmpq	0x200(%rbp), %rdi
1454ccdde:     	jb	0x1454cc9ad <.text+0x54cb9ad>
1454ccde4:     	movq	%r15, %rcx
1454ccde7:     	jmp	0x1454cbc6b <.text+0x54cac6b>
1454ccdec:     	addq	$0x2, %rcx
1454ccdf0:     	movq	%r8, %rdx
1454ccdf3:     	cmpq	%rcx, %rdi
1454ccdf6:     	je	0x1454ccdd0 <.text+0x54cbdd0>
1454ccdf8:     	movss	(%rax,%rcx,4), %xmm0
1454ccdfd:     	movaps	%xmm11, %xmm1
1454cce01:     	subss	%xmm0, %xmm1
1454cce05:     	ucomiss	%xmm1, %xmm15
1454cce09:     	jbe	0x1454cce14 <.text+0x54cbe14>
1454cce0b:     	movss	%xmm0, (%rax,%r8,4)
1454cce11:     	incq	%r8
1454cce14:     	movss	0x4(%rax,%rcx,4), %xmm0
1454cce1a:     	movaps	%xmm11, %xmm1
1454cce1e:     	subss	%xmm0, %xmm1
1454cce22:     	ucomiss	%xmm1, %xmm15
1454cce26:     	jbe	0x1454ccdec <.text+0x54cbdec>
1454cce28:     	movss	%xmm0, (%rax,%r8,4)
1454cce2e:     	incq	%r8
1454cce31:     	jmp	0x1454ccdec <.text+0x54cbdec>
