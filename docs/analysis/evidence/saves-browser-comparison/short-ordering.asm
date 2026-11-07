
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140230ff0:     	pushq	%r15
140230ff2:     	pushq	%r14
140230ff4:     	pushq	%r13
140230ff6:     	pushq	%r12
140230ff8:     	pushq	%rsi
140230ff9:     	pushq	%rdi
140230ffa:     	pushq	%rbp
140230ffb:     	pushq	%rbx
140230ffc:     	subq	$0x58, %rsp
140231000:     	movq	%rcx, %rsi
140231003:     	movl	0x18(%rdx), %ebx
140231006:     	cmpl	$0x1, -0x30(%rdx)
14023100a:     	jne	0x140231025 <.text+0x230025>
14023100c:     	testb	%bl, %bl
14023100e:     	je	0x140231188 <.text+0x230188>
140231014:     	movq	0x1c(%rdx), %rax
140231018:     	cmpq	%rax, -0x2c(%rdx)
14023101c:     	je	0x140231029 <.text+0x230029>
14023101e:     	jl	0x140231062 <.text+0x230062>
140231020:     	jmp	0x140231188 <.text+0x230188>
140231025:     	testb	%bl, %bl
140231027:     	jne	0x140231062 <.text+0x230062>
140231029:     	movq	0x8(%rdx), %rcx
14023102d:     	movq	0x10(%rdx), %r9
140231031:     	movq	-0x40(%rdx), %rax
140231035:     	movq	-0x38(%rdx), %r8
140231039:     	movq	%r9, %r14
14023103c:     	subq	%r8, %r14
14023103f:     	cmovbq	%r9, %r8
140231043:     	movq	%rdx, %rdi
140231046:     	movq	%rax, %rdx
140231049:     	callq	0x1457731e7 <.text+0x57721e7>
14023104e:     	movq	%rdi, %rdx
140231051:     	cltq
140231053:     	testl	%eax, %eax
140231055:     	cmovneq	%rax, %r14
140231059:     	testq	%r14, %r14
14023105c:     	jns	0x140231188 <.text+0x230188>
140231062:     	leaq	-0x48(%rdx), %rbp
140231066:     	movq	(%rdx), %r8
140231069:     	movq	0x8(%rdx), %rdi
14023106d:     	movq	0x10(%rdx), %r14
140231071:     	movl	0x1c(%rdx), %ecx
140231074:     	movl	0x20(%rdx), %r15d
140231078:     	movl	0x44(%rdx), %eax
14023107b:     	movl	%eax, 0x50(%rsp)
14023107f:     	movups	0x34(%rdx), %xmm0
140231083:     	movaps	%xmm0, 0x40(%rsp)
140231088:     	movups	0x24(%rdx), %xmm0
14023108c:     	movaps	%xmm0, 0x30(%rsp)
140231091:     	movups	(%rbp), %xmm0
140231095:     	movups	0x10(%rbp), %xmm1
140231099:     	movups	0x20(%rbp), %xmm2
14023109d:     	movups	0x30(%rbp), %xmm3
1402310a1:     	movups	%xmm3, 0x30(%rdx)
1402310a5:     	movups	%xmm2, 0x20(%rdx)
1402310a9:     	movups	%xmm0, (%rdx)
1402310ac:     	movups	%xmm1, 0x10(%rdx)
1402310b0:     	movq	0x40(%rbp), %rax
1402310b4:     	movq	%rax, 0x40(%rdx)
1402310b8:     	cmpq	%rsi, %rbp
1402310bb:     	movq	%r15, 0x28(%rsp)
1402310c0:     	movq	%r8, 0x20(%rsp)
1402310c5:     	je	0x14023114a <.text+0x23014a>
1402310cb:     	testb	%bl, %bl
1402310cd:     	je	0x140231199 <.text+0x230199>
1402310d3:     	shlq	$0x20, %r15
1402310d7:     	movq	%rcx, %r12
1402310da:     	orq	%rcx, %r15
1402310dd:     	jmp	0x140231115 <.text+0x230115>
1402310df:     	nop
1402310e0:     	jge	0x14023114d <.text+0x23014d>
1402310e2:     	leaq	-0x48(%rbp), %rax
1402310e6:     	movq	0x40(%rax), %rcx
1402310ea:     	movq	%rcx, 0x40(%rbp)
1402310ee:     	movups	(%rax), %xmm0
1402310f1:     	movups	0x10(%rax), %xmm1
1402310f5:     	movups	0x20(%rax), %xmm2
1402310f9:     	movups	0x30(%rax), %xmm3
1402310fd:     	movups	%xmm3, 0x30(%rbp)
140231101:     	movups	%xmm2, 0x20(%rbp)
140231105:     	movups	%xmm1, 0x10(%rbp)
140231109:     	movups	%xmm0, (%rbp)
14023110d:     	movq	%rax, %rbp
140231110:     	cmpq	%rsi, %rax
140231113:     	je	0x140231150 <.text+0x230150>
140231115:     	cmpl	$0x1, -0x30(%rbp)
140231119:     	jne	0x1402310e2 <.text+0x2300e2>
14023111b:     	cmpq	%r15, -0x2c(%rbp)
14023111f:     	jne	0x1402310e0 <.text+0x2300e0>
140231121:     	movq	-0x40(%rbp), %rdx
140231125:     	movq	-0x38(%rbp), %r8
140231129:     	movq	%r14, %r13
14023112c:     	subq	%r8, %r13
14023112f:     	cmovbq	%r14, %r8
140231133:     	movq	%rdi, %rcx
140231136:     	callq	0x1457731e7 <.text+0x57721e7>
14023113b:     	cltq
14023113d:     	testl	%eax, %eax
14023113f:     	cmovneq	%rax, %r13
140231143:     	testq	%r13, %r13
140231146:     	js	0x1402310e2 <.text+0x2300e2>
140231148:     	jmp	0x14023114d <.text+0x23014d>
14023114a:     	movq	%rcx, %r12
14023114d:     	movq	%rbp, %rax
140231150:     	movq	0x20(%rsp), %rcx
140231155:     	movq	%rcx, (%rax)
140231158:     	movq	%rdi, 0x8(%rax)
14023115c:     	movq	%r14, 0x10(%rax)
140231160:     	movl	%ebx, 0x18(%rax)
140231163:     	movl	%r12d, 0x1c(%rax)
140231167:     	movq	0x28(%rsp), %rcx
14023116c:     	movl	%ecx, 0x20(%rax)
14023116f:     	movaps	0x30(%rsp), %xmm0
140231174:     	movaps	0x40(%rsp), %xmm1
140231179:     	movups	%xmm0, 0x24(%rax)
14023117d:     	movups	%xmm1, 0x34(%rax)
140231181:     	movl	0x50(%rsp), %ecx
140231185:     	movl	%ecx, 0x44(%rax)
140231188:     	addq	$0x58, %rsp
14023118c:     	popq	%rbx
14023118d:     	popq	%rbp
14023118e:     	popq	%rdi
14023118f:     	popq	%rsi
140231190:     	popq	%r12
140231192:     	popq	%r13
140231194:     	popq	%r14
140231196:     	popq	%r15
140231198:     	retq
140231199:     	movq	%rcx, %r12
14023119c:     	nopl	(%rax)
1402311a0:     	cmpb	$0x0, -0x30(%rbp)
1402311a4:     	jne	0x14023114d <.text+0x23014d>
1402311a6:     	movq	-0x40(%rbp), %rdx
1402311aa:     	movq	-0x38(%rbp), %r8
1402311ae:     	movq	%r14, %r15
1402311b1:     	subq	%r8, %r15
1402311b4:     	cmovbq	%r14, %r8
1402311b8:     	movq	%rdi, %rcx
1402311bb:     	callq	0x1457731e7 <.text+0x57721e7>
1402311c0:     	cltq
1402311c2:     	testl	%eax, %eax
1402311c4:     	cmovneq	%rax, %r15
1402311c8:     	testq	%r15, %r15
1402311cb:     	jns	0x14023114d <.text+0x23014d>
1402311cd:     	leaq	-0x48(%rbp), %rax
1402311d1:     	movq	0x40(%rax), %rcx
1402311d5:     	movq	%rcx, 0x40(%rbp)
1402311d9:     	movups	(%rax), %xmm0
1402311dc:     	movups	0x10(%rax), %xmm1
1402311e0:     	movups	0x20(%rax), %xmm2
1402311e4:     	movups	0x30(%rax), %xmm3
1402311e8:     	movups	%xmm3, 0x30(%rbp)
1402311ec:     	movups	%xmm2, 0x20(%rbp)
1402311f0:     	movups	%xmm1, 0x10(%rbp)
1402311f4:     	movups	%xmm0, (%rbp)
1402311f8:     	movq	%rax, %rbp
1402311fb:     	cmpq	%rsi, %rax
1402311fe:     	jne	0x1402311a0 <.text+0x2301a0>
140231200:     	jmp	0x140231150 <.text+0x230150>
