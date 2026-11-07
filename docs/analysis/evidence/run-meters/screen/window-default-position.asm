
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401727b9:     	movss	0x28(%rdi), %xmm1
1401727be:     	movss	0x2c(%rdi), %xmm0
1401727c3:     	movl	0x104(%rsp), %ecx
1401727ca:     	movq	0xf8(%rsp), %rdx
1401727d2:     	movl	%ecx, (%rdx)
1401727d4:     	leaq	0xc8(%rax), %rcx
1401727db:     	leaq	0xbc(%rax), %rdx
1401727e2:     	cmpb	$0x0, 0xb8(%rax)
1401727e9:     	cmovneq	%rdx, %rcx
1401727ed:     	leaq	0xe8(%rsp), %rsi
1401727f5:     	movss	(%rbx), %xmm2
1401727f9:     	cmpl	$0x1, (%rdi)
1401727fc:     	jne	0x14017280a <.text+0x17180a>
1401727fe:     	movss	0x4(%rdi), %xmm4
140172803:     	movss	0x8(%rdi), %xmm3
140172808:     	jmp	0x140172857 <.text+0x171857>
14017280a:     	movss	(%rcx), %xmm5
14017280e:     	movl	0xc4(%rax), %ecx
140172814:     	cvtsi2ss	%rcx, %xmm3
140172819:     	divss	%xmm5, %xmm3
14017281d:     	movl	0xc0(%rax), %eax
140172823:     	cvtsi2ss	%rax, %xmm4
140172828:     	mulss	0x5bfab98(%rip), %xmm3  # 0x145d6d3c8
140172830:     	divss	%xmm5, %xmm4
140172834:     	movaps	%xmm1, %xmm5
140172837:     	mulss	%xmm2, %xmm5
14017283b:     	subss	%xmm5, %xmm4
14017283f:     	addss	0x5c43689(%rip), %xmm4  # 0x145db5ed0
140172847:     	movl	$0x1, (%rdi)
14017284d:     	movss	%xmm4, 0x4(%rdi)
140172852:     	movss	%xmm3, 0x8(%rdi)
140172857:     	divss	%xmm2, %xmm4
14017285b:     	divss	%xmm2, %xmm3
14017285f:     	movw	$0x101, 0x2e4(%rsp)     # imm = 0x101
140172869:     	movb	$0x1, 0x2d4(%rsp)
140172871:     	movl	$0x1, 0x1e8(%rsp)
14017287c:     	movss	%xmm4, 0x1ec(%rsp)
140172885:     	movq	$0x0, 0x1f0(%rsp)
140172891:     	movl	$0x1, 0x1f8(%rsp)
14017289c:     	movss	%xmm3, 0x1fc(%rsp)
1401728a5:     	movq	$0x0, 0x200(%rsp)
1401728b1:     	movl	$0x1, 0x208(%rsp)
1401728bc:     	movss	%xmm1, 0x20c(%rsp)
1401728c5:     	movl	$0x1, 0x210(%rsp)
1401728d0:     	movss	%xmm0, 0x214(%rsp)
1401728d9:     	movq	$0x0, 0x1e0(%rsp)
1401728e5:     	xorps	%xmm0, %xmm0
1401728e8:     	movups	%xmm0, 0x218(%rsp)
1401728f0:     	movups	%xmm0, 0x228(%rsp)
1401728f8:     	movl	$0x0, 0x2f8(%rsp)
140172903:     	movw	$0x0, 0x2fc(%rsp)
14017290d:     	movups	0x5c43e7c(%rip), %xmm0  # 0x145db6790
140172914:     	movups	%xmm0, 0x238(%rsp)
14017291c:     	movups	0x5c43e7d(%rip), %xmm0  # 0x145db67a0
140172923:     	movups	%xmm0, 0x248(%rsp)
14017292b:     	movups	0x5c43e7e(%rip), %xmm0  # 0x145db67b0
140172932:     	movups	%xmm0, 0x258(%rsp)
14017293a:     	movups	0x5c43e7f(%rip), %xmm0  # 0x145db67c0
140172941:     	movups	%xmm0, 0x268(%rsp)
140172949:     	movups	0x5c43e80(%rip), %xmm0  # 0x145db67d0
140172950:     	movups	%xmm0, 0x278(%rsp)
140172958:     	movups	0x5c43e81(%rip), %xmm0  # 0x145db67e0
14017295f:     	movups	%xmm0, 0x288(%rsp)
140172967:     	movaps	0x5bfac82(%rip), %xmm0  # 0x145d6d5f0
14017296e:     	movups	%xmm0, 0x298(%rsp)
140172976:     	movups	%xmm0, 0x2a8(%rsp)
14017297e:     	movb	$0x1, 0x2f6(%rsp)
140172986:     	movl	$0x100, 0x2f2(%rsp)     # imm = 0x100
140172991:     	movq	$0x0, 0x2d8(%rsp)
14017299d:     	movl	$0x3f800000, 0x2e0(%rsp) # imm = 0x3F800000
1401729a8:     	movaps	0x5bfa8b1(%rip), %xmm0  # 0x145d6d260
1401729af:     	movups	%xmm0, 0x2b8(%rsp)
1401729b7:     	movl	$0x1, 0x2c8(%rsp)
1401729c2:     	movq	$0x0, 0x2cc(%rsp)
1401729ce:     	movb	$0x0, 0x2f7(%rsp)
1401729d6:     	movups	0x5c43cfb(%rip), %xmm0  # 0x145db66d8
1401729dd:     	movaps	%xmm0, 0x180(%rsp)
1401729e5:     	movq	$0x0, 0x190(%rsp)
1401729f1:     	movups	0x5c43cf8(%rip), %xmm0  # 0x145db66f0
1401729f8:     	movups	%xmm0, 0x198(%rsp)
140172a00:     	movq	$0x0, 0x1a8(%rsp)
140172a0c:     	movups	0x5c43cf5(%rip), %xmm0  # 0x145db6708
140172a13:     	movaps	%xmm0, 0x1b0(%rsp)
140172a1b:     	movq	$0x0, 0x1c0(%rsp)
140172a27:     	movups	0x5c43cf2(%rip), %xmm0  # 0x145db6720
140172a2e:     	movups	%xmm0, 0x1c8(%rsp)
140172a36:     	movq	$0x0, 0x1d8(%rsp)
140172a42:     	movw	$0x0, 0x2ea(%rsp)
140172a4c:     	movl	$0x10000, 0x2e6(%rsp)   # imm = 0x10000
140172a57:     	movw	$0x0, 0x2f0(%rsp)
140172a61:     	movl	$0x10000, 0x2ec(%rsp)   # imm = 0x10000
140172a6c:     	leaq	0x320(%rsp), %rdi
140172a74:     	leaq	0x180(%rsp), %rdx
140172a7c:     	movq	%rdi, %rcx
140172a7f:     	callq	0x140012c60 <.text+0x11c60>
140172a84:     	movl	$0xfd2, 0x520(%rsp)     # imm = 0xFD2
140172a8f:     	movw	$0x2, 0x524(%rsp)
140172a99:     	leaq	0x5c43f70(%rip), %r9    # 0x145db6a10
140172aa0:     	leaq	0x180(%rsp), %rbx
140172aa8:     	leaq	0x60(%rsp), %rdx
140172aad:     	movq	%rbx, %rcx
140172ab0:     	movq	%rdi, %r8
140172ab3:     	callq	0x1401a1100 <.text+0x1a0100>
140172ab8:     	leaq	0x300(%rsp), %rdx
140172ac0:     	movq	%rbx, %rcx
140172ac3:     	movq	%rsi, %r8
