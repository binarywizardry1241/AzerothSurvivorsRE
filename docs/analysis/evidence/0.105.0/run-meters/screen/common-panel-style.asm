
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140012ee5:     	movups	0x5d5c07c(%rip), %xmm0  # 0x145d6ef68
140012eec:     	movaps	%xmm0, 0x180(%rbp)
140012ef3:     	movl	$0x3f800000, 0x190(%rbp) # imm = 0x3F800000
140012efd:     	movups	%xmm0, 0x194(%rbp)
140012f04:     	movl	$0x3f800000, 0x1a4(%rbp) # imm = 0x3F800000
140012f0e:     	movups	%xmm0, 0x1a8(%rbp)
140012f15:     	movl	$0x3f800000, 0x1b8(%rbp) # imm = 0x3F800000
140012f1f:     	movups	%xmm0, 0x1bc(%rbp)
140012f26:     	movl	$0x3f800000, 0x1cc(%rbp) # imm = 0x3F800000
140012f30:     	callq	0x140002200 <.text+0x1200>
140012f35:     	movl	$0x40, %ecx
140012f3a:     	movl	$0x4, %edx
140012f3f:     	callq	0x1400021c0 <.text+0x11c0>
140012f44:     	testq	%rax, %rax
140012f47:     	je	0x140013188 <.text+0x12188>
140012f4d:     	movq	%rax, 0x210(%rbp)
140012f54:     	movaps	0x5d5a355(%rip), %xmm0  # 0x145d6d2b0
140012f5b:     	movups	%xmm0, 0x1f4(%rbp)
140012f62:     	movl	$0x0, 0x1f0(%rbp)
140012f6c:     	leaq	0x1d0(%rbp), %rcx
140012f73:     	leaq	0x1f0(%rbp), %rdx
140012f7a:     	callq	0x144c67100 <.text+0x4c66100>
140012f7f:     	nop
140012f80:     	movaps	0x1d0(%rbp), %xmm6
140012f87:     	movaps	0x5d5a332(%rip), %xmm0  # 0x145d6d2c0
140012f8e:     	movups	%xmm0, 0x1f4(%rbp)
140012f95:     	movl	$0x0, 0x1f0(%rbp)
140012f9f:     	leaq	0x1d0(%rbp), %rcx
140012fa6:     	leaq	0x1f0(%rbp), %rdx
140012fad:     	callq	0x144c67100 <.text+0x4c66100>
140012fb2:     	nop
140012fb3:     	movaps	0x1d0(%rbp), %xmm0
140012fba:     	movq	0x210(%rbp), %rdi
140012fc1:     	movl	$0x0, (%rdi)
140012fc7:     	movl	$0x1, 0x8(%rdi)
140012fce:     	movups	%xmm6, 0xc(%rdi)
140012fd2:     	movq	$0x3f000000, 0x1c(%rdi) # imm = 0x3F000000
140012fda:     	movl	$0x1, 0x28(%rdi)
140012fe1:     	movups	%xmm0, 0x2c(%rdi)
140012fe5:     	movl	$0x3f000000, 0x3c(%rdi) # imm = 0x3F000000
140012fec:     	callq	0x140002200 <.text+0x1200>
140012ff1:     	movl	$0x48, %ecx
140012ff6:     	movl	$0x8, %edx
140012ffb:     	callq	0x1400021c0 <.text+0x11c0>
140013000:     	testq	%rax, %rax
140013003:     	je	0x14001319a <.text+0x1219a>
140013009:     	movq	$0x2, 0x8(%rax)
140013011:     	movq	%rdi, 0x10(%rax)
140013015:     	movq	$0x2, 0x18(%rax)
14001301d:     	movl	$0x40490fdb, 0x20(%rax) # imm = 0x40490FDB
140013024:     	movb	$0x0, 0x24(%rax)
140013028:     	movabsq	$-0x8000000000000000, %rcx # imm = 0x8000000000000000
140013032:     	movq	%rcx, (%rax)
140013035:     	movq	$0x1, 0x1d0(%rbp)
140013040:     	movq	%rax, 0x1d8(%rbp)
140013047:     	movq	$0x1, 0x1e0(%rbp)
140013052:     	movaps	0x5d5a277(%rip), %xmm0  # 0x145d6d2d0
140013059:     	movups	%xmm0, 0x170(%rbp)
140013060:     	movl	$0x0, 0x16c(%rbp)
14001306a:     	leaq	0x1f0(%rbp), %rcx
140013071:     	leaq	0x16c(%rbp), %rdx
140013078:     	callq	0x144c67100 <.text+0x4c66100>
14001307d:     	nop
14001307e:     	movaps	0x1f0(%rbp), %xmm0
140013085:     	movups	%xmm0, 0x15c(%rbp)
14001308c:     	movl	$0x1, 0x158(%rbp)
140013096:     	movl	$0x42200000, 0x48(%rsp) # imm = 0x42200000
14001309e:     	movl	$0x1, 0x40(%rsp)
1400130a6:     	movl	$0x0, 0x38(%rsp)
1400130ae:     	movl	$0x1, 0x30(%rsp)
1400130b6:     	movl	$0x41600000, 0x28(%rsp) # imm = 0x41600000
1400130be:     	movl	$0x1, 0x20(%rsp)
1400130c6:     	leaq	0x1f0(%rbp), %rcx
1400130cd:     	leaq	0x158(%rbp), %rdx
1400130d4:     	xorps	%xmm3, %xmm3
1400130d7:     	movl	$0x1, %r8d
1400130dd:     	callq	0x142633750 <.text+0x2632750>
