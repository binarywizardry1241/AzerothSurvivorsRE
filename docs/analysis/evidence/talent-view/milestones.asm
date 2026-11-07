
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140128e80:     	pushq	%r15
140128e82:     	pushq	%r14
140128e84:     	pushq	%rsi
140128e85:     	pushq	%rdi
140128e86:     	pushq	%rbx
140128e87:     	subq	$0x240, %rsp            # imm = 0x240
140128e8e:     	movq	%r9, %rbx
140128e91:     	movq	%r8, %rdi
140128e94:     	movq	%rdx, %rsi
140128e97:     	movq	0x290(%rsp), %r15
140128e9f:     	xorps	%xmm0, %xmm0
140128ea2:     	movups	%xmm0, 0x108(%rsp)
140128eaa:     	movups	%xmm0, 0xf8(%rsp)
140128eb2:     	movups	%xmm0, 0x120(%rsp)
140128eba:     	movups	%xmm0, 0x130(%rsp)
140128ec2:     	movq	$0x0, 0x140(%rsp)
140128ece:     	movl	$0x0, 0x208(%rsp)
140128ed9:     	movw	$0x0, 0x20c(%rsp)
140128ee3:     	movups	0x5c80ed6(%rip), %xmm0  # 0x145da9dc0
140128eea:     	movaps	%xmm0, 0x20(%rsp)
140128eef:     	movq	$0x0, 0x30(%rsp)
140128ef8:     	movups	0x5c80ed9(%rip), %xmm0  # 0x145da9dd8
140128eff:     	movups	%xmm0, 0x38(%rsp)
140128f04:     	movq	$0x0, 0x48(%rsp)
140128f0d:     	movups	0x5c80edc(%rip), %xmm0  # 0x145da9df0
140128f14:     	movaps	%xmm0, 0x50(%rsp)
140128f19:     	movq	$0x0, 0x60(%rsp)
140128f22:     	movups	0x5c80edf(%rip), %xmm0  # 0x145da9e08
140128f29:     	movups	%xmm0, 0x68(%rsp)
140128f2e:     	movq	$0x0, 0x78(%rsp)
140128f37:     	movq	(%rcx), %rax
140128f3a:     	leaq	0x8(%rcx), %rdx
140128f3e:     	movq	0x70(%rsp), %rcx
140128f43:     	movq	%rcx, 0xe0(%rsp)
140128f4b:     	movq	0x78(%rsp), %rcx
140128f50:     	movq	%rcx, 0xe8(%rsp)
140128f58:     	movq	0x60(%rsp), %rcx
140128f5d:     	movq	%rcx, 0xd0(%rsp)
140128f65:     	movq	0x68(%rsp), %rcx
140128f6a:     	movq	%rcx, 0xd8(%rsp)
140128f72:     	movaps	0x20(%rsp), %xmm0
140128f77:     	movaps	0x30(%rsp), %xmm1
140128f7c:     	movaps	0x40(%rsp), %xmm2
140128f81:     	movaps	0x50(%rsp), %xmm3
140128f86:     	movups	%xmm3, 0xc0(%rsp)
140128f8e:     	movups	%xmm2, 0xb0(%rsp)
140128f96:     	movups	%xmm1, 0xa0(%rsp)
140128f9e:     	movups	%xmm0, 0x90(%rsp)
140128fa6:     	movq	$0x0, 0xf0(%rsp)
140128fb2:     	movabsq	$0x43b4000000000001, %rcx # imm = 0x43B4000000000001
140128fbc:     	movq	%rcx, 0x118(%rsp)
140128fc4:     	movaps	0x5c44345(%rip), %xmm0  # 0x145d6d310
140128fcb:     	movups	%xmm0, 0x148(%rsp)
140128fd3:     	movaps	0x5c445d6(%rip), %xmm0  # 0x145d6d5b0
140128fda:     	movups	%xmm0, 0x158(%rsp)
140128fe2:     	movups	0x5c80eaf(%rip), %xmm0  # 0x145da9e98
140128fe9:     	movups	%xmm0, 0x168(%rsp)
140128ff1:     	movups	0x5c80eb0(%rip), %xmm0  # 0x145da9ea8
140128ff8:     	movups	%xmm0, 0x178(%rsp)
140129000:     	movups	0x5c80ec1(%rip), %xmm0  # 0x145da9ec8
140129007:     	movups	%xmm0, 0x198(%rsp)
14012900f:     	movups	0x5c80ea2(%rip), %xmm0  # 0x145da9eb8
140129016:     	movups	%xmm0, 0x188(%rsp)
14012901e:     	movups	0x5c80ec3(%rip), %xmm0  # 0x145da9ee8
140129025:     	movups	%xmm0, 0x1b8(%rsp)
14012902d:     	movups	0x5c80ea4(%rip), %xmm0  # 0x145da9ed8
140129034:     	movups	%xmm0, 0x1a8(%rsp)
14012903c:     	movaps	0x5c4459d(%rip), %xmm0  # 0x145d6d5e0
140129043:     	movups	%xmm0, 0x1c8(%rsp)
14012904b:     	movl	$0x1, 0x1d8(%rsp)
140129056:     	movq	$0x0, 0x1dc(%rsp)
140129062:     	movb	$0x1, 0x1e4(%rsp)
14012906a:     	movq	$0x0, 0x1e8(%rsp)
140129076:     	movl	$0x3f800000, 0x1f0(%rsp) # imm = 0x3F800000
140129081:     	movw	$0x0, 0x1f4(%rsp)
14012908b:     	movw	$0x0, 0x1fa(%rsp)
140129095:     	movl	$0x10000, 0x1f6(%rsp)   # imm = 0x10000
1401290a0:     	movw	$0x0, 0x200(%rsp)
1401290aa:     	movl	$0x10000, 0x1fc(%rsp)   # imm = 0x10000
1401290b5:     	movl	$0x0, 0x202(%rsp)
1401290c0:     	movw	$0x1, 0x206(%rsp)
1401290ca:     	movq	%rax, 0x88(%rsp)
1401290d2:     	leaq	0x5c44ed7(%rip), %r9    # 0x145d6dfb0
1401290d9:     	leaq	0x210(%rsp), %r14
1401290e1:     	leaq	0x88(%rsp), %r8
1401290e9:     	movq	%r14, %rcx
1401290ec:     	callq	0x140189f40 <.text+0x188f40>
1401290f1:     	movups	0x30(%rbx), %xmm0
1401290f5:     	movups	%xmm0, 0x88(%rsp)
1401290fd:     	movq	%r15, 0x98(%rsp)
140129105:     	movq	%rdi, 0xa0(%rsp)
14012910d:     	movq	%rsi, 0xa8(%rsp)
140129115:     	leaq	0x88(%rsp), %rdx
14012911d:     	movq	%r14, %rcx
140129120:     	callq	0x1402158c0 <.text+0x2148c0>
140129125:     	nop
140129126:     	addq	$0x240, %rsp            # imm = 0x240
14012912d:     	popq	%rbx
14012912e:     	popq	%rdi
14012912f:     	popq	%rsi
140129130:     	popq	%r14
140129132:     	popq	%r15
140129134:     	retq
