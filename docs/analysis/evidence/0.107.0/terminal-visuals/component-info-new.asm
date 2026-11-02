
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
144e3e660:     	movq	%rcx, %rax
144e3e663:     	movq	%rdx, 0x100(%rcx)
144e3e66a:     	movups	(%r8), %xmm0
144e3e66e:     	movups	0x10(%r8), %xmm1
144e3e673:     	movups	0x20(%r8), %xmm2
144e3e678:     	movups	0x30(%r8), %xmm3
144e3e67d:     	movups	%xmm0, (%rcx)
144e3e680:     	movups	%xmm1, 0x10(%rcx)
144e3e684:     	movups	%xmm2, 0x20(%rcx)
144e3e688:     	movups	%xmm3, 0x30(%rcx)
144e3e68c:     	movups	0x40(%r8), %xmm0
144e3e691:     	movups	%xmm0, 0x40(%rcx)
144e3e695:     	movq	0x50(%r8), %rcx
144e3e699:     	movq	%rcx, 0x50(%rax)
144e3e69d:     	movq	$0x0, 0x58(%rax)
144e3e6a5:     	xorps	%xmm0, %xmm0
144e3e6a8:     	movups	%xmm0, 0x108(%rax)
144e3e6af:     	movups	%xmm0, 0x118(%rax)
144e3e6b6:     	movq	$0x0, 0x128(%rax)
144e3e6c1:     	movq	$0x8, 0x60(%rax)
144e3e6c9:     	movq	$0x0, 0x68(%rax)
144e3e6d1:     	movups	0x1d006f8(%rip), %xmm0  # 0x146b3edd0
144e3e6d8:     	movups	%xmm0, 0x70(%rax)
144e3e6dc:     	movups	0x1d006fd(%rip), %xmm1  # 0x146b3ede0
144e3e6e3:     	movups	%xmm1, 0x80(%rax)
144e3e6ea:     	movq	$0x0, 0x90(%rax)
144e3e6f5:     	movq	$0x8, 0x98(%rax)
144e3e700:     	movq	$0x0, 0xa0(%rax)
144e3e70b:     	movups	%xmm1, 0xb8(%rax)
144e3e712:     	movups	%xmm0, 0xa8(%rax)
144e3e719:     	movq	$0x0, 0xc8(%rax)
144e3e724:     	movq	$0x8, 0xd0(%rax)
144e3e72f:     	movq	$0x0, 0xd8(%rax)
144e3e73a:     	movups	%xmm1, 0xf0(%rax)
144e3e741:     	movups	%xmm0, 0xe0(%rax)
144e3e748:     	retq
