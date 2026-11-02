
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1406d3050:     	pushq	%rbp
1406d3051:     	pushq	%rsi
1406d3052:     	subq	$0x118, %rsp            # imm = 0x118
1406d3059:     	leaq	0x80(%rsp), %rbp
1406d3061:     	movq	$-0x2, 0x90(%rbp)
1406d306c:     	movq	%rdx, %rsi
1406d306f:     	callq	0x140002200 <.text+0x1200>
1406d3074:     	movl	$0xe0, %ecx
1406d3079:     	movl	$0x8, %edx
1406d307e:     	callq	0x1400021c0 <.text+0x11c0>
1406d3083:     	testq	%rax, %rax
1406d3086:     	je	0x1406d3299 <.text+0x6d2299>
1406d308c:     	movq	%rax, 0x80(%rbp)
1406d3093:     	callq	0x140002200 <.text+0x1200>
1406d3098:     	movl	$0x38, %ecx
1406d309d:     	movl	$0x8, %edx
1406d30a2:     	callq	0x1400021c0 <.text+0x11c0>
1406d30a7:     	testq	%rax, %rax
1406d30aa:     	je	0x1406d32aa <.text+0x6d22aa>
1406d30b0:     	movl	$0x0, (%rax)
1406d30b6:     	movb	$0x0, 0x4(%rax)
1406d30ba:     	movl	$0x2, 0x28(%rax)
1406d30c1:     	leaq	0x531f980(%rip), %r8    # 0x1459f2a48
1406d30c8:     	leaq	-0x60(%rbp), %rcx
1406d30cc:     	movq	%rax, %rdx
1406d30cf:     	callq	0x144e1b980 <.text+0x4e1a980>
1406d30d4:     	nop
1406d30d5:     	callq	0x140002200 <.text+0x1200>
1406d30da:     	movl	$0x150, %ecx            # imm = 0x150
1406d30df:     	movl	$0x8, %edx
1406d30e4:     	callq	0x1400021c0 <.text+0x11c0>
1406d30e9:     	testq	%rax, %rax
1406d30ec:     	je	0x1406d32bc <.text+0x6d22bc>
1406d30f2:     	movl	$0x0, (%rax)
1406d30f8:     	movb	$0x0, 0x4(%rax)
1406d30fc:     	movq	$-0x1, 0x100(%rax)
1406d3107:     	leaq	0x531f892(%rip), %r8    # 0x1459f29a0
1406d310e:     	leaq	0x10(%rbp), %rcx
1406d3112:     	movq	%rax, %rdx
1406d3115:     	callq	0x144e1b980 <.text+0x4e1a980>
1406d311a:     	nop
1406d311b:     	movups	(%rbp), %xmm0
1406d311f:     	movq	0x80(%rbp), %rax
1406d3126:     	movups	%xmm0, 0x60(%rax)
1406d312a:     	movups	-0x10(%rbp), %xmm0
1406d312e:     	movups	%xmm0, 0x50(%rax)
1406d3132:     	movups	-0x20(%rbp), %xmm0
1406d3136:     	movups	%xmm0, 0x40(%rax)
1406d313a:     	movups	-0x60(%rbp), %xmm0
1406d313e:     	movups	-0x50(%rbp), %xmm1
1406d3142:     	movups	-0x40(%rbp), %xmm2
1406d3146:     	movups	-0x30(%rbp), %xmm3
1406d314a:     	movups	%xmm3, 0x30(%rax)
1406d314e:     	movups	%xmm2, 0x20(%rax)
1406d3152:     	movups	%xmm1, 0x10(%rax)
1406d3156:     	movups	%xmm0, (%rax)
1406d3159:     	movups	0x10(%rbp), %xmm0
1406d315d:     	movups	0x20(%rbp), %xmm1
1406d3161:     	movups	0x30(%rbp), %xmm2
1406d3165:     	movups	0x40(%rbp), %xmm3
1406d3169:     	movups	%xmm0, 0x70(%rax)
1406d316d:     	movups	%xmm1, 0x80(%rax)
1406d3174:     	movups	%xmm2, 0x90(%rax)
1406d317b:     	movups	%xmm3, 0xa0(%rax)
1406d3182:     	movups	0x50(%rbp), %xmm0
1406d3186:     	movups	%xmm0, 0xb0(%rax)
1406d318d:     	movups	0x60(%rbp), %xmm0
1406d3191:     	movups	%xmm0, 0xc0(%rax)
1406d3198:     	movups	0x70(%rbp), %xmm0
1406d319c:     	movups	%xmm0, 0xd0(%rax)
1406d31a3:     	movq	$0x2, 0x18(%rbp)
1406d31ab:     	movq	%rax, 0x20(%rbp)
1406d31af:     	movq	$0x2, 0x28(%rbp)
1406d31b7:     	movq	$0x0, 0x30(%rbp)
1406d31bf:     	movq	$0x8, 0x38(%rbp)
1406d31c7:     	xorps	%xmm0, %xmm0
1406d31ca:     	movups	%xmm0, 0x40(%rbp)
1406d31ce:     	movq	$-0x1, 0x10(%rbp)
1406d31d6:     	leaq	0x48(%rbp), %rcx
1406d31da:     	callq	0x144e8e920 <.text+0x4e8d920>
1406d31df:     	nop
1406d31e0:     	movups	0x70(%rbp), %xmm0
1406d31e4:     	movaps	%xmm0, (%rbp)
1406d31e8:     	movups	0x60(%rbp), %xmm0
1406d31ec:     	movaps	%xmm0, -0x10(%rbp)
1406d31f0:     	movups	0x50(%rbp), %xmm0
1406d31f4:     	movaps	%xmm0, -0x20(%rbp)
1406d31f8:     	movups	0x10(%rbp), %xmm0
1406d31fc:     	movups	0x20(%rbp), %xmm1
1406d3200:     	movups	0x30(%rbp), %xmm2
1406d3204:     	movups	0x40(%rbp), %xmm3
1406d3208:     	movaps	%xmm3, -0x30(%rbp)
1406d320c:     	movaps	%xmm2, -0x40(%rbp)
1406d3210:     	movaps	%xmm1, -0x50(%rbp)
1406d3214:     	movaps	%xmm0, -0x60(%rbp)
1406d3218:     	movb	$0x0, 0x8f(%rbp)
1406d321f:     	movq	0x730c92a(%rip), %rcx   # 0x1479dfb50
1406d3226:     	leaq	0x547de33(%rip), %r8    # 0x145b51060
1406d322d:     	leaq	0x8f(%rbp), %rdx
1406d3234:     	callq	0x140f94df0 <.text+0xf93df0>
1406d3239:     	nop
1406d323a:     	movq	%rdx, %r8
1406d323d:     	leaq	-0x60(%rbp), %rcx
1406d3241:     	movq	%rax, %rdx
1406d3244:     	callq	0x1410e0980 <.text+0x10df980>
1406d3249:     	nop
1406d324a:     	movaps	(%rbp), %xmm0
1406d324e:     	movaps	%xmm0, 0x70(%rbp)
1406d3252:     	movaps	-0x10(%rbp), %xmm0
1406d3256:     	movaps	%xmm0, 0x60(%rbp)
1406d325a:     	movaps	-0x20(%rbp), %xmm0
1406d325e:     	movaps	%xmm0, 0x50(%rbp)
1406d3262:     	movaps	-0x60(%rbp), %xmm0
1406d3266:     	movaps	-0x50(%rbp), %xmm1
1406d326a:     	movaps	-0x40(%rbp), %xmm2
1406d326e:     	movaps	-0x30(%rbp), %xmm3
1406d3272:     	movaps	%xmm3, 0x40(%rbp)
1406d3276:     	movaps	%xmm2, 0x30(%rbp)
1406d327a:     	movaps	%xmm1, 0x20(%rbp)
1406d327e:     	movaps	%xmm0, 0x10(%rbp)
1406d3282:     	leaq	0x10(%rbp), %rdx
1406d3286:     	movq	%rsi, %rcx
1406d3289:     	callq	0x140f29810 <.text+0xf28810>
1406d328e:     	nop
1406d328f:     	addq	$0x118, %rsp            # imm = 0x118
1406d3296:     	popq	%rsi
1406d3297:     	popq	%rbp
1406d3298:     	retq
1406d3299:     	movl	$0x8, %ecx
1406d329e:     	movl	$0xe0, %edx
1406d32a3:     	callq	0x1458e7201 <.text+0x58e6201>
1406d32a8:     	ud2
1406d32aa:     	movl	$0x8, %ecx
1406d32af:     	movl	$0x38, %edx
1406d32b4:     	callq	0x1458e7201 <.text+0x58e6201>
1406d32b9:     	nop
1406d32ba:     	jmp	0x1406d32cc <.text+0x6d22cc>
1406d32bc:     	movl	$0x8, %ecx
1406d32c1:     	movl	$0x150, %edx            # imm = 0x150
1406d32c6:     	callq	0x1458e7201 <.text+0x58e6201>
1406d32cb:     	nop
1406d32cc:     	ud2
