
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458b9810:     	subq	$0x48, %rsp
1458b9814:     	movq	(%rcx), %rdx
1458b9817:     	movq	(%rdx), %rcx
1458b981a:     	movq	0x8(%rdx), %rax
1458b981e:     	movq	$0x0, (%rdx)
1458b9825:     	testq	%rcx, %rcx
1458b9828:     	je	0x1458b9877 <.text+0x58b8877>
1458b982a:     	movq	(%rcx), %rdx
1458b982d:     	movq	$0x0, (%rcx)
1458b9834:     	testq	%rdx, %rdx
1458b9837:     	je	0x1458b9885 <.text+0x58b8885>
1458b9839:     	movq	0x28(%rcx), %r8
1458b983d:     	movq	%r8, 0x40(%rsp)
1458b9842:     	movups	0x8(%rcx), %xmm0
1458b9846:     	movups	0x18(%rcx), %xmm1
1458b984a:     	movaps	%xmm1, 0x30(%rsp)
1458b984f:     	movaps	%xmm0, 0x20(%rsp)
1458b9854:     	movq	%rdx, (%rax)
1458b9857:     	movaps	0x20(%rsp), %xmm0
1458b985c:     	movaps	0x30(%rsp), %xmm1
1458b9861:     	movups	%xmm0, 0x8(%rax)
1458b9865:     	movups	%xmm1, 0x18(%rax)
1458b9869:     	movq	0x40(%rsp), %rcx
1458b986e:     	movq	%rcx, 0x28(%rax)
1458b9872:     	addq	$0x48, %rsp
1458b9876:     	retq
1458b9877:     	leaq	0x12ffe12(%rip), %rcx   # 0x146bb9690
1458b987e:     	callq	0x145d69740 <.text+0x5d68740>
1458b9883:     	ud2
1458b9885:     	leaq	0x12ffe74(%rip), %rcx   # 0x146bb9700
1458b988c:     	callq	0x145d69740 <.text+0x5d68740>
1458b9891:     	ud2
