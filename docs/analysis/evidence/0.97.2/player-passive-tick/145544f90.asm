
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145544f90:     	pushq	%r15
145544f92:     	pushq	%r14
145544f94:     	pushq	%r13
145544f96:     	pushq	%r12
145544f98:     	pushq	%rsi
145544f99:     	pushq	%rdi
145544f9a:     	pushq	%rbp
145544f9b:     	pushq	%rbx
145544f9c:     	movq	%rcx, %rax
145544f9f:     	movq	0x10(%rdx), %rcx
145544fa3:     	movq	(%rdx), %r8
145544fa6:     	movq	0x8(%rdx), %r9
145544faa:     	movq	0x18(%rdx), %r10
145544fae:     	movq	%r8, %r11
145544fb1:     	cmpq	%r10, %r9
145544fb4:     	je	0x145545152 <.text+0x5544152>
145544fba:     	movq	0x20(%rdx), %rsi
145544fbe:     	movq	0x28(%rdx), %rdi
145544fc2:     	movq	0x30(%rdx), %rdx
145544fc6:     	movabsq	$0xffffffffffffff8, %rbx # imm = 0xFFFFFFFFFFFFFF8
145544fd0:     	movq	%r8, %r11
145544fd3:     	jmp	0x145544fe9 <.text+0x5543fe9>
145544fd5:     	movq	%r14, (%r11)
145544fd8:     	addq	$0x8, %r11
145544fdc:     	nopl	(%rax)
145544fe0:     	cmpq	%r10, %r9
145544fe3:     	je	0x145545152 <.text+0x5544152>
145544fe9:     	movq	(%r9), %r14
145544fec:     	addq	$0x8, %r9
145544ff0:     	movq	0x8(%rsi), %r12
145544ff4:     	movq	0x10(%rsi), %r15
145544ff8:     	movq	%r15, %r13
145544ffb:     	andq	%rbx, %r13
145544ffe:     	xorl	%ebp, %ebp
145545000:     	cmpq	%rbp, %r13
145545003:     	je	0x145545050 <.text+0x5544050>
145545005:     	cmpq	%r14, (%r12,%rbp,8)
145545009:     	je	0x145544fe0 <.text+0x5543fe0>
14554500b:     	cmpq	%r14, 0x8(%r12,%rbp,8)
145545010:     	je	0x145544fe0 <.text+0x5543fe0>
145545012:     	cmpq	%r14, 0x10(%r12,%rbp,8)
145545017:     	je	0x145544fe0 <.text+0x5543fe0>
145545019:     	cmpq	%r14, 0x18(%r12,%rbp,8)
14554501e:     	je	0x145544fe0 <.text+0x5543fe0>
145545020:     	cmpq	%r14, 0x20(%r12,%rbp,8)
145545025:     	je	0x145544fe0 <.text+0x5543fe0>
145545027:     	cmpq	%r14, 0x28(%r12,%rbp,8)
14554502c:     	je	0x145544fe0 <.text+0x5543fe0>
14554502e:     	cmpq	%r14, 0x30(%r12,%rbp,8)
145545033:     	je	0x145544fe0 <.text+0x5543fe0>
145545035:     	cmpq	%r14, 0x38(%r12,%rbp,8)
14554503a:     	leaq	0x8(%rbp), %rbp
14554503e:     	jne	0x145545000 <.text+0x5544000>
145545040:     	jmp	0x145544fe0 <.text+0x5543fe0>
145545042:     	nopw	%cs:(%rax,%rax)
145545050:     	shll	$0x3, %r15d
145545054:     	andl	$0x38, %r15d
145545058:     	je	0x145545066 <.text+0x5544066>
14554505a:     	cmpq	%r14, (%r12,%r13,8)
14554505e:     	je	0x145544fe0 <.text+0x5543fe0>
145545060:     	cmpl	$0x8, %r15d
145545064:     	jne	0x1455450d3 <.text+0x55440d3>
145545066:     	movq	0x4c8(%rdi), %r15
14554506d:     	imulq	$0x160, 0x4d0(%rdi), %r13 # imm = 0x160
145545078:     	xorl	%r12d, %r12d
14554507b:     	movq	%r15, %rbp
14554507e:     	nop
145545080:     	cmpq	%r12, %r13
145545083:     	je	0x145544fe0 <.text+0x5543fe0>
145545089:     	addq	$0x160, %r12            # imm = 0x160
145545090:     	cmpq	%r14, 0x88(%rbp)
145545097:     	leaq	0x160(%rbp), %rbp
14554509e:     	jne	0x145545080 <.text+0x5544080>
1455450a0:     	movss	(%rdx), %xmm0
1455450a4:     	ucomiss	-0x20(%r15,%r12), %xmm0
1455450aa:     	jb	0x145544fe0 <.text+0x5543fe0>
1455450b0:     	cmpq	$-0x1, -0x120(%r15,%r12)
1455450b9:     	je	0x145544fd5 <.text+0x5543fd5>
1455450bf:     	cmpb	$0x1, -0x100(%r15,%r12)
1455450c8:     	je	0x145544fd5 <.text+0x5543fd5>
1455450ce:     	jmp	0x145544fe0 <.text+0x5543fe0>
1455450d3:     	cmpq	%r14, 0x8(%r12,%r13,8)
1455450d8:     	je	0x145544fe0 <.text+0x5543fe0>
1455450de:     	cmpl	$0x10, %r15d
1455450e2:     	je	0x145545066 <.text+0x5544066>
1455450e4:     	cmpq	%r14, 0x10(%r12,%r13,8)
1455450e9:     	je	0x145544fe0 <.text+0x5543fe0>
1455450ef:     	cmpl	$0x18, %r15d
1455450f3:     	je	0x145545066 <.text+0x5544066>
1455450f9:     	cmpq	%r14, 0x18(%r12,%r13,8)
1455450fe:     	je	0x145544fe0 <.text+0x5543fe0>
145545104:     	cmpl	$0x20, %r15d
145545108:     	je	0x145545066 <.text+0x5544066>
14554510e:     	cmpq	%r14, 0x20(%r12,%r13,8)
145545113:     	je	0x145544fe0 <.text+0x5543fe0>
145545119:     	cmpl	$0x28, %r15d
14554511d:     	je	0x145545066 <.text+0x5544066>
145545123:     	cmpq	%r14, 0x28(%r12,%r13,8)
145545128:     	je	0x145544fe0 <.text+0x5543fe0>
14554512e:     	cmpl	$0x30, %r15d
145545132:     	je	0x145545066 <.text+0x5544066>
145545138:     	cmpq	%r14, 0x30(%r12,%r13,8)
14554513d:     	je	0x145544fe0 <.text+0x5543fe0>
145545143:     	cmpl	$0x38, %r15d
145545147:     	je	0x145545066 <.text+0x5544066>
14554514d:     	jmp	0x145544fe0 <.text+0x5543fe0>
145545152:     	subq	%r8, %r11
145545155:     	shrq	$0x3, %r11
145545159:     	movq	%rcx, (%rax)
14554515c:     	movq	%r8, 0x8(%rax)
145545160:     	movq	%r11, 0x10(%rax)
145545164:     	popq	%rbx
145545165:     	popq	%rbp
145545166:     	popq	%rdi
145545167:     	popq	%rsi
145545168:     	popq	%r12
14554516a:     	popq	%r13
14554516c:     	popq	%r14
14554516e:     	popq	%r15
145545170:     	retq
