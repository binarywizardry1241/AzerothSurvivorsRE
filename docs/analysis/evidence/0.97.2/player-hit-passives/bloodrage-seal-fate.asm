
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c4fd9:     	testb	%r13b, %r13b
1454c4fdc:     	je	0x1454c59e9 <.text+0x54c49e9>
1454c4fe2:     	movq	0x2a0(%rsi), %rcx
1454c4fe9:     	testq	%rcx, %rcx
1454c4fec:     	je	0x1454c51eb <.text+0x54c41eb>
1454c4ff2:     	movq	0x298(%rsi), %rax
1454c4ff9:     	imulq	$0x58, %rcx, %rcx
1454c4ffd:     	xorl	%edx, %edx
1454c4fff:     	movabsq	$0x676172646f6f6c62, %r8 # imm = 0x676172646F6F6C62
1454c5009:     	jmp	0x1454c501d <.text+0x54c401d>
1454c500b:     	nopl	(%rax,%rax)
1454c5010:     	addq	$0x58, %rdx
1454c5014:     	cmpq	%rdx, %rcx
1454c5017:     	je	0x1454c50b8 <.text+0x54c40b8>
1454c501d:     	movq	(%rax,%rdx), %r9
1454c5021:     	cmpq	$0x9, 0x8(%r9)
1454c5026:     	jne	0x1454c5010 <.text+0x54c4010>
1454c5028:     	movq	(%r9), %r9
1454c502b:     	movq	(%r9), %r10
1454c502e:     	xorq	%r8, %r10
1454c5031:     	movzbl	0x8(%r9), %r9d
1454c5036:     	xorq	$0x65, %r9
1454c503a:     	orq	%r10, %r9
1454c503d:     	jne	0x1454c5010 <.text+0x54c4010>
1454c503f:     	movss	0x7c8(%rsi), %xmm0
1454c5047:     	movss	0x8e4(%rsi), %xmm1
1454c504f:     	movaps	%xmm0, %xmm2
1454c5052:     	minss	0x4315ca(%rip), %xmm2   # 0x1458f6624
1454c505a:     	xorps	%xmm3, %xmm3
1454c505d:     	maxss	%xmm3, %xmm2
1454c5061:     	subss	%xmm2, %xmm0
1454c5065:     	movss	%xmm0, 0x7c8(%rsi)
1454c506d:     	addss	0x7c4(%rsi), %xmm2
1454c5075:     	minss	0x4264af(%rip), %xmm2   # 0x1458eb52c
1454c507d:     	movss	%xmm2, 0x7c4(%rsi)
1454c5085:     	movss	%xmm1, 0x7cc(%rsi)
1454c508d:     	movb	$0x1, 0x176(%rbp)
1454c5094:     	movq	%rsi, %rcx
1454c5097:     	callq	0x1454d69f0 <.text+0x54d59f0>
1454c509c:     	nop
1454c509d:     	movq	0x2a0(%rsi), %rcx
1454c50a4:     	testq	%rcx, %rcx
1454c50a7:     	je	0x1454c51eb <.text+0x54c41eb>
1454c50ad:     	movq	0x298(%rsi), %rax
1454c50b4:     	imulq	$0x58, %rcx, %rcx
1454c50b8:     	addq	%rax, %rcx
1454c50bb:     	movabsq	$0x7461665f6c616573, %rdx # imm = 0x7461665F6C616573
1454c50c5:     	jmp	0x1454c50dd <.text+0x54c40dd>
1454c50c7:     	nopw	(%rax,%rax)
1454c50d0:     	addq	$0x58, %rax
1454c50d4:     	cmpq	%rcx, %rax
1454c50d7:     	je	0x1454c51eb <.text+0x54c41eb>
1454c50dd:     	movq	(%rax), %r8
1454c50e0:     	cmpq	$0x9, 0x8(%r8)
1454c50e5:     	jne	0x1454c50d0 <.text+0x54c40d0>
1454c50e7:     	movq	(%r8), %r8
1454c50ea:     	movq	(%r8), %r9
1454c50ed:     	xorq	%rdx, %r9
1454c50f0:     	movzbl	0x8(%r8), %r8d
1454c50f5:     	xorq	$0x65, %r8
1454c50f9:     	orq	%r9, %r8
1454c50fc:     	jne	0x1454c50d0 <.text+0x54c40d0>
1454c50fe:     	cmpb	$0x0, 0x298(%rbp)
1454c5105:     	jne	0x1454c5177 <.text+0x54c4177>
1454c5107:     	movss	0x426370(%rip), %xmm8   # 0x1458eb480
1454c5110:     	jmp	0x1454c5180 <.text+0x54c4180>
1454c5112:     	movb	$0x1, %dl
1454c5114:     	jmp	0x1454c4def <.text+0x54c3def>
1454c5119:     	cmpq	%rdi, 0x8(%rdx,%r8,8)
1454c511e:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c5124:     	cmpl	$0x10, %ecx
1454c5127:     	je	0x1454c4fd6 <.text+0x54c3fd6>
1454c512d:     	cmpq	%rdi, 0x10(%rdx,%r8,8)
1454c5132:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c5138:     	cmpl	$0x18, %ecx
1454c513b:     	je	0x1454c4fd6 <.text+0x54c3fd6>
1454c5141:     	cmpq	%rdi, 0x18(%rdx,%r8,8)
1454c5146:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c514c:     	cmpl	$0x20, %ecx
1454c514f:     	je	0x1454c4fd6 <.text+0x54c3fd6>
1454c5155:     	cmpq	%rdi, 0x20(%rdx,%r8,8)
1454c515a:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c5160:     	movl	%r15d, %r9d
1454c5163:     	cmpl	$0x28, %ecx
1454c5166:     	jne	0x1454c63af <.text+0x54c53af>
1454c516c:     	xorl	%r12d, %r12d
1454c516f:     	movl	%r9d, %r15d
1454c5172:     	jmp	0x1454c4fd9 <.text+0x54c3fd9>
1454c5177:     	movss	0x4314a4(%rip), %xmm8   # 0x1458f6624
1454c5180:     	movss	0x7d4(%rsi), %xmm7
1454c5188:     	movaps	%xmm7, %xmm0
1454c518b:     	callq	0x145756e55 <.text+0x5755e55>
1454c5190:     	minss	%xmm8, %xmm0
1454c5195:     	xorps	%xmm1, %xmm1
1454c5198:     	maxss	%xmm1, %xmm0
1454c519c:     	subss	%xmm0, %xmm7
1454c51a0:     	cvttss2si	%xmm0, %rax
1454c51a5:     	xorl	%ecx, %ecx
1454c51a7:     	ucomiss	%xmm1, %xmm0
1454c51aa:     	cmovael	%eax, %ecx
1454c51ad:     	movss	%xmm7, 0x7d4(%rsi)
1454c51b5:     	ucomiss	0x426360(%rip), %xmm0   # 0x1458eb51c
1454c51bc:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454c51c1:     	cmovbel	%ecx, %eax
1454c51c4:     	addl	0x7d0(%rsi), %eax
1454c51ca:     	cmpl	$0x5, %eax
1454c51cd:     	movl	$0x5, %ecx
1454c51d2:     	cmovbl	%eax, %ecx
1454c51d5:     	movl	%ecx, 0x7d0(%rsi)
1454c51db:     	movb	$0x1, 0x176(%rbp)
1454c51e2:     	movq	%rsi, %rcx
1454c51e5:     	callq	0x1454d7020 <.text+0x54d6020>
1454c51ea:     	nop
