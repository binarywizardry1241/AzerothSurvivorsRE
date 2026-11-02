
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400136a0:     	pushq	%r14
1400136a2:     	pushq	%rsi
1400136a3:     	pushq	%rdi
1400136a4:     	pushq	%rbx
1400136a5:     	subq	$0x328, %rsp            # imm = 0x328
1400136ac:     	movq	%r9, 0x28(%rsp)
1400136b1:     	cmpq	$0x3, %r9
1400136b5:     	ja	0x1400138fe <.text+0x128fe>
1400136bb:     	movq	%rdx, %rsi
1400136be:     	movq	%rcx, %rdi
1400136c1:     	movq	0x370(%rsp), %r14
1400136c9:     	movzwl	(%r8,%r9,2), %eax
1400136ce:     	movw	%ax, 0x26(%rsp)
1400136d3:     	xorps	%xmm0, %xmm0
1400136d6:     	movaps	%xmm0, 0xd0(%rsp)
1400136de:     	movaps	%xmm0, 0xc0(%rsp)
1400136e6:     	movaps	%xmm0, 0xb0(%rsp)
1400136ee:     	movaps	%xmm0, 0xa0(%rsp)
1400136f6:     	movaps	%xmm0, 0x90(%rsp)
1400136fe:     	movq	$0x0, 0xe0(%rsp)
14001370a:     	movups	0x589581f(%rip), %xmm0  # 0x1458a8f30
140013711:     	movups	%xmm0, 0xe8(%rsp)
140013719:     	movups	0x5895820(%rip), %xmm0  # 0x1458a8f40
140013720:     	movups	%xmm0, 0xf8(%rsp)
140013728:     	movups	0x5895821(%rip), %xmm0  # 0x1458a8f50
14001372f:     	movups	%xmm0, 0x108(%rsp)
140013737:     	movups	0x5895822(%rip), %xmm0  # 0x1458a8f60
14001373e:     	movups	%xmm0, 0x118(%rsp)
140013746:     	movups	0x5895823(%rip), %xmm0  # 0x1458a8f70
14001374d:     	movups	%xmm0, 0x128(%rsp)
140013755:     	movups	0x5895824(%rip), %xmm0  # 0x1458a8f80
14001375c:     	movups	%xmm0, 0x138(%rsp)
140013764:     	movups	0x5895835(%rip), %xmm0  # 0x1458a8fa0
14001376b:     	movups	%xmm0, 0x158(%rsp)
140013773:     	movups	0x5895816(%rip), %xmm0  # 0x1458a8f90
14001377a:     	movups	%xmm0, 0x148(%rsp)
140013782:     	movups	0x58956ef(%rip), %xmm0  # 0x1458a8e78
140013789:     	movaps	%xmm0, 0x30(%rsp)
14001378e:     	movq	$0x0, 0x40(%rsp)
140013797:     	movups	0x58956f2(%rip), %xmm0  # 0x1458a8e90
14001379e:     	movups	%xmm0, 0x48(%rsp)
1400137a3:     	movq	$0x0, 0x58(%rsp)
1400137ac:     	movups	0x58956f5(%rip), %xmm0  # 0x1458a8ea8
1400137b3:     	movaps	%xmm0, 0x60(%rsp)
1400137b8:     	movq	$0x0, 0x70(%rsp)
1400137c1:     	movups	0x58956f8(%rip), %xmm0  # 0x1458a8ec0
1400137c8:     	movups	%xmm0, 0x78(%rsp)
1400137cd:     	movq	$0x0, 0x88(%rsp)
1400137d9:     	movq	(%rcx), %rbx
1400137dc:     	addq	$0x8, %rdi
1400137e0:     	leaq	0x178(%rsp), %rcx
1400137e8:     	leaq	0x30(%rsp), %rdx
1400137ed:     	movl	$0x138, %r8d            # imm = 0x138
1400137f3:     	callq	0x1457149fd <.text+0x57139fd>
1400137f8:     	movaps	0x5894a11(%rip), %xmm0  # 0x1458a8210
1400137ff:     	movups	%xmm0, 0x2b0(%rsp)
140013807:     	movl	$0x1, 0x2c0(%rsp)
140013812:     	movss	0x5894b06(%rip), %xmm0  # 0x1458a8320
14001381a:     	movlps	%xmm0, 0x2c4(%rsp)
140013822:     	movb	$0x1, 0x2cc(%rsp)
14001382a:     	movq	$0x0, 0x2d0(%rsp)
140013836:     	movl	$0x3f800000, 0x2d8(%rsp) # imm = 0x3F800000
140013841:     	movw	$0x0, 0x2dc(%rsp)
14001384b:     	movl	$0x10000, 0x2de(%rsp)   # imm = 0x10000
140013856:     	movw	$0x0, 0x2e2(%rsp)
140013860:     	movl	$0x10000, 0x2e4(%rsp)   # imm = 0x10000
14001386b:     	movw	$0x0, 0x2e8(%rsp)
140013875:     	movq	$0x0, 0x2ea(%rsp)
140013881:     	movl	$0x5, 0x2f2(%rsp)
14001388c:     	movq	%rbx, 0x170(%rsp)
140013894:     	leaq	0x58a6a05(%rip), %r9    # 0x1458ba2a0
14001389b:     	leaq	0x2f8(%rsp), %rbx
1400138a3:     	leaq	0x170(%rsp), %r8
1400138ab:     	movq	%rbx, %rcx
1400138ae:     	movq	%rdi, %rdx
1400138b1:     	callq	0x1401a0510 <.text+0x19f510>
1400138b6:     	movq	%rsi, 0x170(%rsp)
1400138be:     	movq	%r14, 0x178(%rsp)
1400138c6:     	leaq	0x28(%rsp), %rax
1400138cb:     	movq	%rax, 0x180(%rsp)
1400138d3:     	leaq	0x26(%rsp), %rax
1400138d8:     	movq	%rax, 0x188(%rsp)
1400138e0:     	leaq	0x170(%rsp), %rdx
1400138e8:     	movq	%rbx, %rcx
1400138eb:     	callq	0x140225410 <.text+0x224410>
1400138f0:     	nop
1400138f1:     	addq	$0x328, %rsp            # imm = 0x328
1400138f8:     	popq	%rbx
1400138f9:     	popq	%rdi
1400138fa:     	popq	%rsi
1400138fb:     	popq	%r14
1400138fd:     	retq
1400138fe:     	leaq	0x5895adb(%rip), %r8    # 0x1458a93e0
140013905:     	movl	$0x4, %edx
14001390a:     	movq	%r9, %rcx
14001390d:     	callq	0x1458a3f23 <.text+0x58a2f23>
140013912:     	ud2
