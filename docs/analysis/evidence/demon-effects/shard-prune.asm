
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145995f70:     	pushq	%rsi
145995f71:     	movq	0x10(%rcx), %rax
145995f75:     	testq	%rax, %rax
145995f78:     	je	0x145995fa6 <.text+0x5994fa6>
145995f7a:     	movq	0x8(%rcx), %r8
145995f7e:     	movss	(%rdx), %xmm0
145995f82:     	xorl	%edx, %edx
145995f84:     	movss	0x3d73e0(%rip), %xmm1   # 0x145d6d36c
145995f8c:     	nopl	(%rax)
145995f90:     	movaps	%xmm0, %xmm2
145995f93:     	subss	(%r8,%rdx,8), %xmm2
145995f99:     	ucomiss	%xmm2, %xmm1
145995f9c:     	jbe	0x145995fa8 <.text+0x5994fa8>
145995f9e:     	incq	%rdx
145995fa1:     	cmpq	%rdx, %rax
145995fa4:     	jne	0x145995f90 <.text+0x5994f90>
145995fa6:     	popq	%rsi
145995fa7:     	retq
145995fa8:     	leaq	0x1(%rdx), %r9
145995fac:     	cmpq	%rax, %r9
145995faf:     	jae	0x145995fec <.text+0x5994fec>
145995fb1:     	leaq	-0x2(%rax), %r10
145995fb5:     	leal	(%rax,%rdx), %esi
145995fb8:     	movq	%rdx, %r11
145995fbb:     	testb	$0x1, %sil
145995fbf:     	jne	0x145995fe4 <.text+0x5994fe4>
145995fc1:     	movaps	%xmm0, %xmm2
145995fc4:     	subss	0x8(%r8,%rdx,8), %xmm2
145995fcb:     	ucomiss	%xmm2, %xmm1
145995fce:     	movq	%rdx, %r11
145995fd1:     	jbe	0x145995fe0 <.text+0x5994fe0>
145995fd3:     	movq	0x8(%r8,%rdx,8), %r9
145995fd8:     	movq	%r9, (%r8,%rdx,8)
145995fdc:     	leaq	0x1(%rdx), %r11
145995fe0:     	leaq	0x2(%rdx), %r9
145995fe4:     	cmpq	%rdx, %r10
145995fe7:     	movq	%r11, %rdx
145995fea:     	jne	0x145995ff2 <.text+0x5994ff2>
145995fec:     	movq	%rdx, 0x10(%rcx)
145995ff0:     	popq	%rsi
145995ff1:     	retq
145995ff2:     	movq	%r11, %rdx
145995ff5:     	jmp	0x145996000 <.text+0x5995000>
145995ff7:     	addq	$0x2, %r9
145995ffb:     	cmpq	%r9, %rax
145995ffe:     	je	0x145995fec <.text+0x5994fec>
145996000:     	movaps	%xmm0, %xmm2
145996003:     	subss	(%r8,%r9,8), %xmm2
145996009:     	ucomiss	%xmm2, %xmm1
14599600c:     	ja	0x14599601f <.text+0x599501f>
14599600e:     	movaps	%xmm0, %xmm2
145996011:     	subss	0x8(%r8,%r9,8), %xmm2
145996018:     	ucomiss	%xmm2, %xmm1
14599601b:     	jbe	0x145995ff7 <.text+0x5994ff7>
14599601d:     	jmp	0x145996039 <.text+0x5995039>
14599601f:     	movq	(%r8,%r9,8), %r10
145996023:     	movq	%r10, (%r8,%rdx,8)
145996027:     	incq	%rdx
14599602a:     	movaps	%xmm0, %xmm2
14599602d:     	subss	0x8(%r8,%r9,8), %xmm2
145996034:     	ucomiss	%xmm2, %xmm1
145996037:     	jbe	0x145995ff7 <.text+0x5994ff7>
145996039:     	movq	0x8(%r8,%r9,8), %r10
14599603e:     	movq	%r10, (%r8,%rdx,8)
145996042:     	incq	%rdx
145996045:     	jmp	0x145995ff7 <.text+0x5994ff7>
