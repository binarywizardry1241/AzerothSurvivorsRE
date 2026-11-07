
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ca5f0:     	cmpb	$0x0, 0x78(%rdi)
1454ca5f4:     	je	0x1454caa55 <.text+0x54c9a55>
1454ca5fa:     	movsd	0x7c(%rdi), %xmm9
1454ca600:     	movss	0x84(%rdi), %xmm15
1454ca609:     	ucomiss	%xmm0, %xmm8
1454ca60d:     	jb	0x1454ca83d <.text+0x54c983d>
1454ca613:     	movss	0x104(%rdi), %xmm0
1454ca61b:     	ucomiss	%xmm10, %xmm0
1454ca61f:     	jb	0x1454ca83d <.text+0x54c983d>
1454ca625:     	movss	0x100(%rdi), %xmm0
1454ca62d:     	movss	%xmm0, 0x130(%rdi)
1454ca635:     	movaps	%xmm11, %xmm1
1454ca639:     	subss	0xa0(%rdi), %xmm1
1454ca641:     	movss	0xf8(%rdi), %xmm2
1454ca649:     	movaps	%xmm6, %xmm0
1454ca64c:     	cmpltss	0xa4(%rdi), %xmm0
1454ca655:     	mulss	%xmm2, %xmm1
1454ca659:     	andps	%xmm0, %xmm1
1454ca65c:     	andnps	%xmm2, %xmm0
1454ca65f:     	orps	%xmm1, %xmm0
1454ca662:     	movaps	%xmm0, %xmm12
1454ca666:     	mulss	0x42e6d1(%rip), %xmm12  # 0x1458f8d40
1454ca66f:     	testb	$0x1, 0x38(%rdi)
1454ca673:     	jne	0x1454ca7a1 <.text+0x54c97a1>
1454ca679:     	movaps	%xmm0, %xmm12
1454ca67d:     	cmpq	$-0x1, 0x18(%rdi)
1454ca682:     	je	0x1454ca7ac <.text+0x54c97ac>
1454ca688:     	movq	0x88(%rdi), %rdi
1454ca68f:     	movq	0x120(%rbp), %rsi
1454ca696:     	cmpq	0x110(%rbp), %rsi
1454ca69d:     	je	0x1454ca7c7 <.text+0x54c97c7>
1454ca6a3:     	jmp	0x1454ca813 <.text+0x54c9813>
1454ca6a8:     	movaps	%xmm15, %xmm10
1454ca6ac:     	jmp	0x1454ca6b9 <.text+0x54c96b9>
1454ca6ae:     	movaps	%xmm15, %xmm10
1454ca6b2:     	movq	0x290(%rbp), %rdi
1454ca6b9:     	movlpd	%xmm13, 0x10c(%rdi)
1454ca6c2:     	movss	%xmm15, 0x114(%rdi)
1454ca6cb:     	movlpd	%xmm9, 0x118(%rdi)
1454ca6d4:     	movss	%xmm10, 0x120(%rdi)
1454ca6dd:     	movaps	-0x40(%rbp), %xmm0
1454ca6e1:     	movlps	%xmm0, 0x124(%rdi)
1454ca6e8:     	movss	0x24(%rbp), %xmm0
1454ca6ed:     	movss	%xmm0, 0x12c(%rdi)
1454ca6f5:     	movq	0x88(%rdi), %rdi
1454ca6fc:     	movq	0x1e8(%rbp), %rsi
1454ca703:     	cmpq	0x1d8(%rbp), %rsi
1454ca70a:     	jne	0x1454ca758 <.text+0x54c9758>
1454ca70c:     	movb	$0x1, 0x2b7(%rbp)
1454ca713:     	movb	$0x1, 0x2b6(%rbp)
1454ca71a:     	movb	$0x1, 0x2b5(%rbp)
1454ca721:     	movb	$0x1, 0x2b4(%rbp)
1454ca728:     	movb	$0x1, 0x2b3(%rbp)
1454ca72f:     	movb	$0x1, 0x2b2(%rbp)
1454ca736:     	movb	$0x1, 0x2b1(%rbp)
1454ca73d:     	movb	$0x1, 0x2b0(%rbp)
1454ca744:     	movb	$0x1, 0x2af(%rbp)
1454ca74b:     	leaq	0x1d8(%rbp), %rcx
1454ca752:     	callq	0x145758120 <.text+0x5757120>
1454ca757:     	nop
1454ca758:     	movq	0x1e0(%rbp), %rax
1454ca75f:     	leaq	(%rsi,%rsi,4), %rcx
1454ca763:     	movq	%rdi, (%rax,%rcx,8)
1454ca767:     	movlpd	%xmm13, 0x8(%rax,%rcx,8)
1454ca76e:     	movss	%xmm15, 0x10(%rax,%rcx,8)
1454ca775:     	movlpd	%xmm9, 0x14(%rax,%rcx,8)
1454ca77c:     	movss	%xmm10, 0x1c(%rax,%rcx,8)
1454ca783:     	movl	$0x3f4ccccd, 0x20(%rax,%rcx,8) # imm = 0x3F4CCCCD
1454ca78b:     	incq	%rsi
1454ca78e:     	movq	%rsi, 0x1e8(%rbp)
1454ca795:     	movq	0x2a0(%rbp), %r12
1454ca79c:     	jmp	0x1454c9a4c <.text+0x54c8a4c>
1454ca7a1:     	cmpq	$-0x1, 0x18(%rdi)
1454ca7a6:     	jne	0x1454ca688 <.text+0x54c9688>
1454ca7ac:     	movaps	%xmm0, %xmm12
1454ca7b0:     	movq	0x88(%rdi), %rdi
1454ca7b7:     	movq	0x120(%rbp), %rsi
1454ca7be:     	cmpq	0x110(%rbp), %rsi
1454ca7c5:     	jne	0x1454ca813 <.text+0x54c9813>
1454ca7c7:     	movb	$0x1, 0x2b7(%rbp)
1454ca7ce:     	movb	$0x1, 0x2b6(%rbp)
1454ca7d5:     	movb	$0x1, 0x2b5(%rbp)
1454ca7dc:     	movb	$0x1, 0x2b4(%rbp)
1454ca7e3:     	movb	$0x1, 0x2b3(%rbp)
1454ca7ea:     	movb	$0x1, 0x2b2(%rbp)
1454ca7f1:     	movb	$0x1, 0x2b1(%rbp)
1454ca7f8:     	movb	$0x1, 0x2b0(%rbp)
1454ca7ff:     	movb	$0x1, 0x2af(%rbp)
1454ca806:     	leaq	0x110(%rbp), %rcx
1454ca80d:     	callq	0x145758200 <.text+0x5757200>
1454ca812:     	nop
1454ca813:     	movq	0x118(%rbp), %rax
1454ca81a:     	movq	%rsi, %rcx
1454ca81d:     	shlq	$0x4, %rcx
1454ca821:     	movss	%xmm12, (%rax,%rcx)
1454ca827:     	movq	%rdi, 0x8(%rax,%rcx)
1454ca82c:     	incq	%rsi
1454ca82f:     	movq	%rsi, 0x120(%rbp)
1454ca836:     	movq	0x290(%rbp), %rdi
1454ca83d:     	subps	%xmm13, %xmm9
1454ca841:     	movshdup	%xmm9, %xmm1            # xmm1 = xmm9[1,1,3,3]
1454ca846:     	movaps	%xmm9, %xmm0
1454ca84a:     	callq	0x145756e67 <.text+0x5755e67>
1454ca84f:     	ucomiss	%xmm15, %xmm6
1454ca853:     	jae	0x1454ca9b4 <.text+0x54c99b4>
1454ca859:     	movss	0x42bdc3(%rip), %xmm1   # 0x1458f6624
1454ca861:     	ucomiss	%xmm0, %xmm1
1454ca864:     	ja	0x1454ca9b4 <.text+0x54c99b4>
1454ca86a:     	ucomiss	0x12c(%rdi), %xmm6
1454ca871:     	movq	0x2a0(%rbp), %r12
1454ca878:     	jb	0x1454c9a4c <.text+0x54c8a4c>
1454ca87e:     	movss	0x43255e(%rip), %xmm1   # 0x1458fcde4
1454ca886:     	divss	%xmm0, %xmm1
1454ca88a:     	minss	%xmm11, %xmm1
1454ca88f:     	movsldup	%xmm1, %xmm0            # xmm0 = xmm1[0,0,2,2]
1454ca893:     	mulps	%xmm0, %xmm9
1454ca897:     	addps	%xmm13, %xmm9
1454ca89b:     	movss	0x278(%rbp), %xmm15
1454ca8a4:     	cmpq	$-0x1, 0x98(%rbp)
1454ca8ac:     	je	0x1454ca98e <.text+0x54c998e>
1454ca8b2:     	movd	%xmm13, %edx
1454ca8b7:     	movshdup	%xmm13, %xmm0           # xmm0 = xmm13[1,1,3,3]
1454ca8bc:     	movd	%xmm0, %eax
1454ca8c0:     	shlq	$0x20, %rax
1454ca8c4:     	orq	%rax, %rdx
1454ca8c7:     	movd	%xmm9, %r8d
1454ca8cc:     	movshdup	%xmm9, %xmm0            # xmm0 = xmm9[1,1,3,3]
1454ca8d1:     	movd	%xmm0, %eax
1454ca8d5:     	shlq	$0x20, %rax
1454ca8d9:     	orq	%rax, %r8
1454ca8dc:     	movb	$0x1, 0x2b7(%rbp)
1454ca8e3:     	movb	$0x1, 0x2b6(%rbp)
1454ca8ea:     	movb	$0x1, 0x2b5(%rbp)
1454ca8f1:     	movb	$0x1, 0x2b4(%rbp)
1454ca8f8:     	movb	$0x1, 0x2b3(%rbp)
1454ca8ff:     	movb	$0x1, 0x2b2(%rbp)
1454ca906:     	movb	$0x1, 0x2b1(%rbp)
1454ca90d:     	movb	$0x1, 0x2b0(%rbp)
1454ca914:     	movb	$0x1, 0x2af(%rbp)
1454ca91b:     	movq	0xa0(%rbp), %rcx
1454ca922:     	callq	0x14545e830 <.text+0x545d830>
1454ca927:     	nop
1454ca928:     	ucomiss	%xmm11, %xmm0
1454ca92c:     	jae	0x1454ca987 <.text+0x54c9987>
1454ca92e:     	movaps	%xmm13, %xmm1
1454ca932:     	subps	%xmm9, %xmm1
1454ca936:     	mulps	%xmm1, %xmm1
1454ca939:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
1454ca93d:     	addss	%xmm1, %xmm2
1454ca941:     	xorps	%xmm1, %xmm1
1454ca944:     	sqrtss	%xmm2, %xmm1
1454ca948:     	movss	0x420b38(%rip), %xmm2   # 0x1458eb488
1454ca950:     	maxss	%xmm2, %xmm1
1454ca954:     	divss	%xmm1, %xmm2
1454ca958:     	subss	%xmm2, %xmm0
1454ca95c:     	maxss	%xmm8, %xmm0
1454ca961:     	subps	%xmm13, %xmm9
1454ca965:     	movsldup	%xmm0, %xmm1            # xmm1 = xmm0[0,0,2,2]
1454ca969:     	mulps	%xmm9, %xmm1
1454ca96d:     	addps	%xmm13, %xmm1
1454ca971:     	movaps	%xmm15, %xmm2
1454ca975:     	subss	%xmm15, %xmm2
1454ca97a:     	mulss	%xmm0, %xmm2
1454ca97e:     	addss	%xmm2, %xmm15
1454ca983:     	movaps	%xmm1, %xmm9
1454ca987:     	movq	0x290(%rbp), %rdi
1454ca98e:     	movaps	%xmm13, %xmm0
1454ca992:     	subps	%xmm9, %xmm0
1454ca996:     	mulps	%xmm0, %xmm0
1454ca999:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454ca99d:     	addss	%xmm0, %xmm1
1454ca9a1:     	xorps	%xmm12, %xmm12
1454ca9a5:     	sqrtss	%xmm1, %xmm12
1454ca9aa:     	ucomiss	%xmm12, %xmm11
1454ca9ae:     	jbe	0x1454cb813 <.text+0x54ca813>
1454ca9b4:     	movl	$0x0, 0x78(%rdi)
1454ca9bb:     	movss	%xmm6, 0x12c(%rdi)
1454ca9c3:     	ucomiss	0x42bcb5(%rip), %xmm10  # 0x1458f6680
1454ca9cb:     	jbe	0x1454caa55 <.text+0x54c9a55>
1454ca9d1:     	movq	0x88(%rdi), %rdi
1454ca9d8:     	movq	0xd8(%rbp), %rsi
1454ca9df:     	cmpq	0xc8(%rbp), %rsi
1454ca9e6:     	jne	0x1454caa34 <.text+0x54c9a34>
1454ca9e8:     	movb	$0x1, 0x2b7(%rbp)
1454ca9ef:     	movb	$0x1, 0x2b6(%rbp)
1454ca9f6:     	movb	$0x1, 0x2b5(%rbp)
1454ca9fd:     	movb	$0x1, 0x2b4(%rbp)
1454caa04:     	movb	$0x1, 0x2b3(%rbp)
1454caa0b:     	movb	$0x1, 0x2b2(%rbp)
1454caa12:     	movb	$0x1, 0x2b1(%rbp)
1454caa19:     	movb	$0x1, 0x2b0(%rbp)
1454caa20:     	movb	$0x1, 0x2af(%rbp)
1454caa27:     	leaq	0xc8(%rbp), %rcx
1454caa2e:     	callq	0x145757ef0 <.text+0x5756ef0>
1454caa33:     	nop
1454caa34:     	movq	0xd0(%rbp), %rax
1454caa3b:     	movq	%rdi, (%rax,%rsi,8)
1454caa3f:     	incq	%rsi
1454caa42:     	movq	%rsi, 0xd8(%rbp)
1454caa49:     	movq	0x2a0(%rbp), %r12
1454caa50:     	jmp	0x1454c9a4c <.text+0x54c8a4c>
1454caa55:     	cmpq	$-0x1, 0x40(%rdi)
1454caa5a:     	je	0x1454cae7d <.text+0x54c9e7d>
1454caa60:     	movq	0x58(%rdi), %rax
1454caa64:     	movq	0x2a0(%rbp), %rcx
1454caa6b:     	cmpq	0x590(%rcx), %rax
1454caa72:     	jae	0x1454caa8c <.text+0x54c9a8c>
1454caa74:     	movq	0x588(%rcx), %rcx
1454caa7b:     	leaq	(%rax,%rax,4), %rax
1454caa7f:     	movsd	0x18(%rcx,%rax,8), %xmm9
1454caa86:     	movl	0x20(%rcx,%rax,8), %ebx
1454caa8a:     	jmp	0x1454caa96 <.text+0x54c9a96>
1454caa8c:     	movl	0x278(%rbp), %ebx
1454caa92:     	movaps	%xmm13, %xmm9
1454caa96:     	movlps	%xmm9, 0x1b8(%rbp)
1454caa9e:     	movl	%ebx, 0x1c0(%rbp)
1454caaa4:     	movaps	0x10(%rbp), %xmm0
1454caaa8:     	movlps	%xmm0, 0x1f0(%rbp)
1454caaaf:     	movss	0x18c(%rbp), %xmm0
1454caab7:     	movss	%xmm0, 0x1f8(%rbp)
1454caabf:     	movb	$0x1, 0x2b7(%rbp)
1454caac6:     	movb	$0x1, 0x2b6(%rbp)
1454caacd:     	movb	$0x1, 0x2b5(%rbp)
1454caad4:     	movb	$0x1, 0x2b4(%rbp)
1454caadb:     	movb	$0x1, 0x2b3(%rbp)
1454caae2:     	movb	$0x1, 0x2b2(%rbp)
1454caae9:     	movb	$0x1, 0x2b1(%rbp)
1454caaf0:     	movb	$0x1, 0x2b0(%rbp)
1454caaf7:     	movb	$0x1, 0x2af(%rbp)
1454caafe:     	movq	%rdi, %rcx
1454cab01:     	leaq	0x1b8(%rbp), %rdx
1454cab08:     	leaq	0x1f0(%rbp), %r8
1454cab0f:     	movaps	%xmm6, %xmm3
1454cab12:     	callq	0x14550a0a0 <.text+0x55090a0>
1454cab17:     	nop
1454cab18:     	movzbl	%al, %eax
1454cab1b:     	leaq	0x14e22b2(%rip), %rcx   # 0x1469acdd4
1454cab22:     	movslq	(%rcx,%rax,4), %rax
1454cab26:     	addq	%rcx, %rax
1454cab29:     	jmpq	*%rax
