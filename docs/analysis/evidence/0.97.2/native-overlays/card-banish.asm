
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400c1500:     	pushq	%r15
1400c1502:     	pushq	%r14
1400c1504:     	pushq	%rsi
1400c1505:     	pushq	%rdi
1400c1506:     	pushq	%rbp
1400c1507:     	pushq	%rbx
1400c1508:     	subq	$0x308, %rsp            # imm = 0x308
1400c150f:     	movaps	%xmm7, 0x2f0(%rsp)
1400c1517:     	movaps	%xmm6, 0x2e0(%rsp)
1400c151f:     	movq	%r8, %rdi
1400c1522:     	movq	%rdx, %rsi
1400c1525:     	movq	%rcx, %rbx
1400c1528:     	movq	0x360(%rsp), %r14
1400c1530:     	leaq	0x583c6f9(%rip), %rcx   # 0x1458fdc30
1400c1537:     	movl	$0x6, %edx
1400c153c:     	movq	%r9, %r8
1400c153f:     	callq	0x142aed730 <.text+0x2aec730>
1400c1544:     	testq	%rax, %rax
1400c1547:     	jne	0x1400c1550 <.text+0xc0550>
1400c1549:     	movq	0x78fb268(%rip), %rax   # 0x1479bc7b8
1400c1550:     	cmpb	$0x1, (%rax)
1400c1553:     	jne	0x1400c1562 <.text+0xc0562>
1400c1555:     	testq	%r14, %r14
1400c1558:     	setne	%bpl
1400c155c:     	andb	0x1(%rax), %bpl
1400c1560:     	jmp	0x1400c1564 <.text+0xc0564>
1400c1562:     	xorl	%ebp, %ebp
1400c1564:     	movups	0x583c545(%rip), %xmm0  # 0x1458fdab0
1400c156b:     	movaps	%xmm0, 0x30(%rsp)
1400c1570:     	movq	$0x0, 0x40(%rsp)
1400c1579:     	movups	0x583c548(%rip), %xmm1  # 0x1458fdac8
1400c1580:     	movups	%xmm1, 0x48(%rsp)
1400c1585:     	movq	$0x0, 0x58(%rsp)
1400c158e:     	movups	0x583c54b(%rip), %xmm1  # 0x1458fdae0
1400c1595:     	movaps	%xmm1, 0x60(%rsp)
1400c159a:     	movq	$0x0, 0x70(%rsp)
1400c15a3:     	movups	0x583c54e(%rip), %xmm2  # 0x1458fdaf8
1400c15aa:     	movups	%xmm2, 0x78(%rsp)
1400c15af:     	movq	$0x0, 0x88(%rsp)
1400c15bb:     	movq	(%rbx), %rax
1400c15be:     	addq	$0x8, %rbx
1400c15c2:     	movq	0x80(%rsp), %rcx
1400c15ca:     	movq	%rcx, 0xf8(%rsp)
1400c15d2:     	movq	0x88(%rsp), %rcx
1400c15da:     	movq	%rcx, 0x100(%rsp)
1400c15e2:     	movq	0x70(%rsp), %rcx
1400c15e7:     	movq	%rcx, 0xe8(%rsp)
1400c15ef:     	movq	0x78(%rsp), %rcx
1400c15f4:     	movq	%rcx, 0xf0(%rsp)
1400c15fc:     	movups	%xmm1, 0xd8(%rsp)
1400c1604:     	movaps	0x50(%rsp), %xmm1
1400c1609:     	movups	%xmm1, 0xc8(%rsp)
1400c1611:     	movaps	0x40(%rsp), %xmm1
1400c1616:     	movups	%xmm1, 0xb8(%rsp)
1400c161e:     	movups	%xmm0, 0xa8(%rsp)
1400c1626:     	xorps	%xmm6, %xmm6
1400c1629:     	movups	%xmm6, 0x108(%rsp)
1400c1631:     	movups	%xmm6, 0x118(%rsp)
1400c1639:     	movups	%xmm6, 0x128(%rsp)
1400c1641:     	movups	%xmm6, 0x138(%rsp)
1400c1649:     	movups	%xmm6, 0x148(%rsp)
1400c1651:     	movq	$0x0, 0x158(%rsp)
1400c165d:     	movups	0x583c514(%rip), %xmm0  # 0x1458fdb78
1400c1664:     	movups	%xmm0, 0x170(%rsp)
1400c166c:     	movups	0x583c4f5(%rip), %xmm0  # 0x1458fdb68
1400c1673:     	movups	%xmm0, 0x160(%rsp)
1400c167b:     	movaps	0x583774e(%rip), %xmm0  # 0x1458f8dd0
1400c1682:     	movups	%xmm0, 0x180(%rsp)
1400c168a:     	movaps	0x5829e4f(%rip), %xmm0  # 0x1458eb4e0
1400c1691:     	movups	%xmm0, 0x190(%rsp)
1400c1699:     	movaps	0x5829c50(%rip), %xmm1  # 0x1458eb2f0
1400c16a0:     	movups	%xmm1, 0x1a0(%rsp)
1400c16a8:     	movups	%xmm1, 0x1b0(%rsp)
1400c16b0:     	movups	%xmm0, 0x1c0(%rsp)
1400c16b8:     	movups	%xmm0, 0x1d0(%rsp)
1400c16c0:     	movaps	0x5829de9(%rip), %xmm0  # 0x1458eb4b0
1400c16c7:     	movups	%xmm0, 0x1e0(%rsp)
1400c16cf:     	movl	$0x1, 0x1f0(%rsp)
1400c16da:     	movss	0x583b1ca(%rip), %xmm0  # 0x1458fc8ac
1400c16e2:     	movlps	%xmm0, 0x1f4(%rsp)
1400c16ea:     	movb	$0x1, 0x1fc(%rsp)
1400c16f2:     	movq	$0x0, 0x200(%rsp)
1400c16fe:     	movl	$0x3f800000, 0x208(%rsp) # imm = 0x3F800000
1400c1709:     	movw	$0x0, 0x20c(%rsp)
1400c1713:     	movw	$0x0, 0x212(%rsp)
1400c171d:     	movl	$0x10000, 0x20e(%rsp)   # imm = 0x10000
1400c1728:     	movw	$0x0, 0x218(%rsp)
1400c1732:     	movl	$0x10000, 0x214(%rsp)   # imm = 0x10000
1400c173d:     	movq	$0x0, 0x21a(%rsp)
1400c1749:     	movl	$0x5, 0x222(%rsp)
1400c1754:     	movq	%rax, 0xa0(%rsp)
1400c175c:     	leaq	0x583bcad(%rip), %r9    # 0x1458fd410
1400c1763:     	leaq	0x298(%rsp), %rcx
1400c176b:     	leaq	0xa0(%rsp), %r8
1400c1773:     	movq	%rbx, %rdx
1400c1776:     	callq	0x1401e3e60 <.text+0x1e2e60>
1400c177b:     	testb	%bpl, %bpl
1400c177e:     	je	0x1400c189c <.text+0xc089c>
1400c1784:     	leaq	0xa0(%rsp), %rcx
1400c178c:     	callq	0x1400c7a20 <.text+0xc6a20>
1400c1791:     	movq	0x100(%rsp), %rax
1400c1799:     	movq	%rax, 0x97(%rsp)
1400c17a1:     	movups	0xf0(%rsp), %xmm0
1400c17a9:     	movups	%xmm0, 0x87(%rsp)
1400c17b1:     	movups	0xe0(%rsp), %xmm0
1400c17b9:     	movups	%xmm0, 0x77(%rsp)
1400c17be:     	movups	0xa0(%rsp), %xmm0
1400c17c6:     	movups	0xb0(%rsp), %xmm1
1400c17ce:     	movups	0xc0(%rsp), %xmm2
1400c17d6:     	movups	0xd0(%rsp), %xmm3
1400c17de:     	movups	%xmm3, 0x67(%rsp)
1400c17e3:     	movups	%xmm2, 0x57(%rsp)
1400c17e8:     	movups	%xmm1, 0x47(%rsp)
1400c17ed:     	movups	%xmm0, 0x37(%rsp)
1400c17f2:     	movq	%rdi, 0xa0(%rsp)
1400c17fa:     	movb	$0x2, 0xa8(%rsp)
1400c1802:     	movups	0x30(%rsp), %xmm0
1400c1807:     	movups	%xmm0, 0xa9(%rsp)
1400c180f:     	movups	0x40(%rsp), %xmm0
1400c1814:     	movups	%xmm0, 0xb9(%rsp)
1400c181c:     	movups	0x50(%rsp), %xmm0
1400c1821:     	movups	%xmm0, 0xc9(%rsp)
1400c1829:     	movups	0x60(%rsp), %xmm0
1400c182e:     	movups	%xmm0, 0xd9(%rsp)
1400c1836:     	movups	0x70(%rsp), %xmm0
1400c183b:     	movups	%xmm0, 0xe9(%rsp)
1400c1843:     	movups	0x80(%rsp), %xmm0
1400c184b:     	movups	%xmm0, 0xf9(%rsp)
1400c1853:     	movups	0x8f(%rsp), %xmm0
1400c185b:     	movups	%xmm0, 0x108(%rsp)
1400c1863:     	movb	$0x0, 0x118(%rsp)
1400c186b:     	leaq	0x298(%rsp), %rcx
1400c1873:     	leaq	0xa0(%rsp), %rdx
1400c187b:     	callq	0x1401fcfd0 <.text+0x1fbfd0>
1400c1880:     	movups	0x583c799(%rip), %xmm0  # 0x1458fe020
1400c1887:     	movaps	%xmm0, 0x280(%rsp)
1400c188f:     	movss	0x5829be9(%rip), %xmm6  # 0x1458eb480
1400c1897:     	jmp	0x1400c1a36 <.text+0xc0a36>
1400c189c:     	movups	0x583c769(%rip), %xmm0  # 0x1458fe00c
1400c18a3:     	movaps	%xmm0, 0x230(%rsp)
1400c18ab:     	movl	$0x3f800000, 0x240(%rsp) # imm = 0x3F800000
1400c18b6:     	movups	%xmm0, 0x244(%rsp)
1400c18be:     	movl	$0x3f800000, 0x254(%rsp) # imm = 0x3F800000
1400c18c9:     	movups	%xmm0, 0x258(%rsp)
1400c18d1:     	movl	$0x3f800000, 0x268(%rsp) # imm = 0x3F800000
1400c18dc:     	movups	%xmm0, 0x26c(%rsp)
1400c18e4:     	movl	$0x3f800000, 0x27c(%rsp) # imm = 0x3F800000
1400c18ef:     	movq	0x270(%rsp), %rax
1400c18f7:     	movq	%rax, 0xe0(%rsp)
1400c18ff:     	movl	0x278(%rsp), %eax
1400c1906:     	movl	%eax, 0xe8(%rsp)
1400c190d:     	movl	0x27c(%rsp), %eax
1400c1914:     	movl	%eax, 0xec(%rsp)
1400c191b:     	movq	0x260(%rsp), %rax
1400c1923:     	movq	%rax, 0xd0(%rsp)
1400c192b:     	movl	0x268(%rsp), %eax
1400c1932:     	movl	%eax, 0xd8(%rsp)
1400c1939:     	movl	0x26c(%rsp), %eax
1400c1940:     	movl	%eax, 0xdc(%rsp)
1400c1947:     	movaps	0x250(%rsp), %xmm1
1400c194f:     	movaps	%xmm1, 0xc0(%rsp)
1400c1957:     	movaps	0x240(%rsp), %xmm1
1400c195f:     	movaps	%xmm1, 0xb0(%rsp)
1400c1967:     	movaps	%xmm0, 0xa0(%rsp)
1400c196f:     	movaps	%xmm6, 0xf0(%rsp)
1400c1977:     	movq	0x2b0(%rsp), %rdi
1400c197f:     	testq	%rdi, %rdi
1400c1982:     	jne	0x1400c198c <.text+0xc098c>
1400c1984:     	movq	0x2b8(%rsp), %rdi
1400c198c:     	movq	0x298(%rsp), %r14
1400c1994:     	movq	(%rdi), %rax
1400c1997:     	movq	0x10(%rdi), %rbx
1400c199b:     	subq	%rbx, %rax
1400c199e:     	cmpq	$0x77, %rax
1400c19a2:     	jbe	0x1400c1d18 <.text+0xc0d18>
1400c19a8:     	movq	0x8(%rdi), %rax
1400c19ac:     	leaq	0x1bdf5d(%rip), %rcx    # 0x14027f910 <.text+0x27e910>
1400c19b3:     	movq	%rcx, (%rax,%rbx)
1400c19b7:     	movaps	0xa0(%rsp), %xmm0
1400c19bf:     	movaps	0xb0(%rsp), %xmm1
1400c19c7:     	movaps	0xc0(%rsp), %xmm2
1400c19cf:     	movaps	0xd0(%rsp), %xmm3
1400c19d7:     	movups	%xmm0, 0x8(%rax,%rbx)
1400c19dc:     	movups	%xmm1, 0x18(%rax,%rbx)
1400c19e1:     	movups	%xmm2, 0x28(%rax,%rbx)
1400c19e6:     	movups	%xmm3, 0x38(%rax,%rbx)
1400c19eb:     	movaps	0xe0(%rsp), %xmm0
1400c19f3:     	movups	%xmm0, 0x48(%rax,%rbx)
1400c19f8:     	movaps	0xf0(%rsp), %xmm0
1400c1a00:     	movups	%xmm0, 0x58(%rax,%rbx)
1400c1a05:     	movl	$0x3ecccccd, 0x68(%rax,%rbx) # imm = 0x3ECCCCCD
1400c1a0d:     	movb	$0x0, 0x6c(%rax,%rbx)
1400c1a12:     	movq	%r14, 0x70(%rax,%rbx)
1400c1a17:     	addq	$0x78, %rbx
1400c1a1b:     	movq	%rbx, 0x10(%rdi)
1400c1a1f:     	movups	0x583c5a6(%rip), %xmm0  # 0x1458fdfcc
1400c1a26:     	movaps	%xmm0, 0x280(%rsp)
1400c1a2e:     	movss	0x5829ad2(%rip), %xmm6  # 0x1458eb508
1400c1a36:     	leaq	0x583c5f7(%rip), %rcx   # 0x1458fe034
1400c1a3d:     	movl	$0x6, %edx
1400c1a42:     	callq	0x145452350 <.text+0x5451350>
1400c1a47:     	movq	%rdx, %rdi
1400c1a4a:     	testq	%rdx, %rdx
1400c1a4d:     	jns	0x1400c1a5f <.text+0xc0a5f>
1400c1a4f:     	xorl	%r15d, %r15d
1400c1a52:     	movq	%r15, %rcx
1400c1a55:     	movq	%rdi, %rdx
1400c1a58:     	callq	0x1458e721b <.text+0x58e621b>
1400c1a5d:     	ud2
1400c1a5f:     	je	0x1400c1ab6 <.text+0xc0ab6>
1400c1a61:     	movq	%rax, %r14
1400c1a64:     	callq	0x140002200 <.text+0x1200>
1400c1a69:     	movl	$0x1, %r15d
1400c1a6f:     	movl	$0x1, %edx
1400c1a74:     	movq	%rdi, %rcx
1400c1a77:     	callq	0x1400021c0 <.text+0x11c0>
1400c1a7c:     	testq	%rax, %rax
1400c1a7f:     	je	0x1400c1a52 <.text+0xc0a52>
1400c1a81:     	movq	%rax, %rbx
1400c1a84:     	movq	%rax, %rcx
1400c1a87:     	movq	%r14, %rdx
1400c1a8a:     	movq	%rdi, %r8
1400c1a8d:     	callq	0x145756ddd <.text+0x5755ddd>
1400c1a92:     	movzbl	(%rsi), %r15d
1400c1a96:     	cmpb	$0x1, %r15b
1400c1a9a:     	jne	0x1400c1ac5 <.text+0xc0ac5>
1400c1a9c:     	movl	0x1(%rsi), %eax
1400c1a9f:     	movl	0x4(%rsi), %ecx
1400c1aa2:     	movl	%ecx, 0x33(%rsp)
1400c1aa6:     	movl	%eax, 0x30(%rsp)
1400c1aaa:     	movq	0x8(%rsi), %r14
1400c1aae:     	movzbl	0x10(%rsi), %eax
1400c1ab2:     	movb	$0x1, %cl
1400c1ab4:     	jmp	0x1400c1ad5 <.text+0xc0ad5>
1400c1ab6:     	movl	$0x1, %ebx
1400c1abb:     	movzbl	(%rsi), %r15d
1400c1abf:     	cmpb	$0x1, %r15b
1400c1ac3:     	je	0x1400c1a9c <.text+0xc0a9c>
1400c1ac5:     	movq	0x8(%rsi), %r14
1400c1ac9:     	lock
1400c1aca:     	incq	(%r14)
1400c1acd:     	jle	0x1400c1d3d <.text+0xc0d3d>
1400c1ad3:     	xorl	%ecx, %ecx
1400c1ad5:     	movq	%rdi, 0xa0(%rsp)
1400c1add:     	movq	%rbx, 0xa8(%rsp)
1400c1ae5:     	movq	%rdi, 0xb0(%rsp)
1400c1aed:     	movq	$0x0, 0xb8(%rsp)
1400c1af9:     	movq	$0x4, 0xc0(%rsp)
1400c1b05:     	movq	$0x0, 0xc8(%rsp)
1400c1b11:     	movb	%cl, 0xd0(%rsp)
1400c1b18:     	movl	0x30(%rsp), %ecx
1400c1b1c:     	movl	0x33(%rsp), %edx
1400c1b20:     	movl	%ecx, 0xd1(%rsp)
1400c1b27:     	movl	%edx, 0xd4(%rsp)
1400c1b2e:     	movq	%r14, 0xd8(%rsp)
1400c1b36:     	movq	%rax, 0xe0(%rsp)
1400c1b3e:     	movl	$0x41600000, 0xe8(%rsp) # imm = 0x41600000
1400c1b49:     	movw	$0x190, 0xec(%rsp)      # imm = 0x190
1400c1b53:     	movb	$0x1, 0xee(%rsp)
1400c1b5b:     	movaps	0x280(%rsp), %xmm0
1400c1b63:     	movups	%xmm0, 0xf0(%rsp)
1400c1b6b:     	movss	%xmm6, 0x100(%rsp)
1400c1b74:     	movups	0x583bd51(%rip), %xmm6  # 0x1458fd8cc
1400c1b7b:     	movups	%xmm6, 0x104(%rsp)
1400c1b83:     	movl	$0x3f59999a, 0x114(%rsp) # imm = 0x3F59999A
1400c1b8e:     	movsd	0x583737a(%rip), %xmm7  # 0x1458f8f10
1400c1b96:     	movsd	%xmm7, 0x118(%rsp)
1400c1b9f:     	leaq	0x298(%rsp), %rcx
1400c1ba7:     	leaq	0xa0(%rsp), %rdx
1400c1baf:     	callq	0x1401fe030 <.text+0x1fd030>
1400c1bb4:     	testb	%bpl, %bpl
1400c1bb7:     	je	0x1400c1cf8 <.text+0xc0cf8>
1400c1bbd:     	leaq	0x360(%rsp), %rax
1400c1bc5:     	movq	%rax, 0xa0(%rsp)
1400c1bcd:     	leaq	0x565d35c(%rip), %rax   # 0x14571ef30 <.text+0x571df30>
1400c1bd4:     	movq	%rax, 0xa8(%rsp)
1400c1bdc:     	leaq	0x583c457(%rip), %rdx   # 0x1458fe03a
1400c1be3:     	leaq	0x2c8(%rsp), %rcx
1400c1beb:     	leaq	0xa0(%rsp), %r8
1400c1bf3:     	callq	0x14570bf80 <.text+0x570af80>
1400c1bf8:     	testb	%r15b, %r15b
1400c1bfb:     	je	0x1400c1c13 <.text+0xc0c13>
1400c1bfd:     	movl	0x1(%rsi), %eax
1400c1c00:     	movl	0x4(%rsi), %ecx
1400c1c03:     	movl	%ecx, 0x33(%rsp)
1400c1c07:     	movl	%eax, 0x30(%rsp)
1400c1c0b:     	movzbl	0x10(%rsi), %eax
1400c1c0f:     	movb	$0x1, %cl
1400c1c11:     	jmp	0x1400c1c1f <.text+0xc0c1f>
1400c1c13:     	lock
1400c1c14:     	incq	(%r14)
1400c1c17:     	jle	0x1400c1d3d <.text+0xc0d3d>
1400c1c1d:     	xorl	%ecx, %ecx
1400c1c1f:     	movq	0x2d8(%rsp), %rdx
1400c1c27:     	movq	%rdx, 0xb0(%rsp)
1400c1c2f:     	movups	0x2c8(%rsp), %xmm0
1400c1c37:     	movaps	%xmm0, 0xa0(%rsp)
1400c1c3f:     	movq	$0x0, 0xb8(%rsp)
1400c1c4b:     	movq	$0x4, 0xc0(%rsp)
1400c1c57:     	movq	$0x0, 0xc8(%rsp)
1400c1c63:     	movb	%cl, 0xd0(%rsp)
1400c1c6a:     	movl	0x30(%rsp), %ecx
1400c1c6e:     	movl	0x33(%rsp), %edx
1400c1c72:     	movl	%ecx, 0xd1(%rsp)
1400c1c79:     	movl	%edx, 0xd4(%rsp)
1400c1c80:     	movq	%r14, 0xd8(%rsp)
1400c1c88:     	movq	%rax, 0xe0(%rsp)
1400c1c90:     	movl	$0x41400000, 0xe8(%rsp) # imm = 0x41400000
1400c1c9b:     	movw	$0x190, 0xec(%rsp)      # imm = 0x190
1400c1ca5:     	movb	$0x1, 0xee(%rsp)
1400c1cad:     	movups	0x583c318(%rip), %xmm0  # 0x1458fdfcc
1400c1cb4:     	movaps	%xmm0, 0xf0(%rsp)
1400c1cbc:     	movl	$0x3f800000, 0x100(%rsp) # imm = 0x3F800000
1400c1cc7:     	movups	%xmm6, 0x104(%rsp)
1400c1ccf:     	movl	$0x3f59999a, 0x114(%rsp) # imm = 0x3F59999A
1400c1cda:     	movsd	%xmm7, 0x118(%rsp)
1400c1ce3:     	leaq	0x298(%rsp), %rcx
1400c1ceb:     	leaq	0xa0(%rsp), %rdx
1400c1cf3:     	callq	0x1401fe030 <.text+0x1fd030>
1400c1cf8:     	movaps	0x2e0(%rsp), %xmm6
1400c1d00:     	movaps	0x2f0(%rsp), %xmm7
1400c1d08:     	addq	$0x308, %rsp            # imm = 0x308
1400c1d0f:     	popq	%rbx
1400c1d10:     	popq	%rbp
1400c1d11:     	popq	%rdi
1400c1d12:     	popq	%rsi
1400c1d13:     	popq	%r14
1400c1d15:     	popq	%r15
1400c1d17:     	retq
1400c1d18:     	movq	$0x1, 0x20(%rsp)
1400c1d21:     	movl	$0x78, %r8d
1400c1d27:     	movl	$0x1, %r9d
1400c1d2d:     	movq	%rdi, %rcx
1400c1d30:     	movq	%rbx, %rdx
1400c1d33:     	callq	0x145757d40 <.text+0x5756d40>
1400c1d38:     	jmp	0x1400c19a8 <.text+0xc09a8>
1400c1d3d:     	ud2
