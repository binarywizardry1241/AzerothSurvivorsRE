
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145532030:     	pushq	%rbp
145532031:     	pushq	%r15
145532033:     	pushq	%r14
145532035:     	pushq	%r13
145532037:     	pushq	%r12
145532039:     	pushq	%rsi
14553203a:     	pushq	%rdi
14553203b:     	pushq	%rbx
14553203c:     	subq	$0x58, %rsp
145532040:     	leaq	0x50(%rsp), %rbp
145532045:     	movq	$-0x2, (%rbp)
14553204d:     	movq	%rdx, %rbx
145532050:     	movq	%rcx, %r12
145532053:     	movq	(%rdx), %rcx
145532056:     	movq	0x8(%rdx), %r13
14553205a:     	movq	0x10(%rdx), %rdi
14553205e:     	movq	0x18(%rdx), %rsi
145532062:     	nopw	%cs:(%rax,%rax)
145532070:     	cmpq	%r13, %rcx
145532073:     	je	0x145532135 <.text+0x5531135>
145532079:     	leaq	0x10(%rcx), %r15
14553207d:     	movq	%r15, (%rbx)
145532080:     	movq	(%rcx), %r14
145532083:     	movss	(%rsi), %xmm2
145532087:     	movq	%rdi, %rcx
14553208a:     	movq	%r14, %rdx
14553208d:     	callq	0x1454d42f0 <.text+0x54d32f0>
145532092:     	movq	%r15, %rcx
145532095:     	testb	%al, %al
145532097:     	jne	0x145532070 <.text+0x5531070>
145532099:     	movq	%r12, -0x20(%rbp)
14553209d:     	callq	0x140002200 <.text+0x1200>
1455320a2:     	movl	$0x20, %ecx
1455320a7:     	movl	$0x8, %edx
1455320ac:     	callq	0x1400021c0 <.text+0x11c0>
1455320b1:     	testq	%rax, %rax
1455320b4:     	je	0x14553217b <.text+0x553117b>
1455320ba:     	movq	%r14, (%rax)
1455320bd:     	movq	$0x4, -0x18(%rbp)
1455320c5:     	movq	%rax, %r14
1455320c8:     	movq	%rax, -0x10(%rbp)
1455320cc:     	movl	$0x1, %ebx
1455320d1:     	movq	%rbx, -0x8(%rbp)
1455320d5:     	nopw	%cs:(%rax,%rax)
1455320e0:     	cmpq	%r13, %r15
1455320e3:     	je	0x145532151 <.text+0x5531151>
1455320e5:     	movq	(%r15), %r12
1455320e8:     	movss	(%rsi), %xmm2
1455320ec:     	movq	%rdi, %rcx
1455320ef:     	movq	%r12, %rdx
1455320f2:     	callq	0x1454d42f0 <.text+0x54d32f0>
1455320f7:     	nop
1455320f8:     	addq	$0x10, %r15
1455320fc:     	testb	%al, %al
1455320fe:     	jne	0x1455320e0 <.text+0x55310e0>
145532100:     	cmpq	-0x18(%rbp), %rbx
145532104:     	jne	0x14553212c <.text+0x553112c>
145532106:     	movq	$0x8, 0x20(%rsp)
14553210f:     	movl	$0x1, %r8d
145532115:     	movl	$0x8, %r9d
14553211b:     	leaq	-0x18(%rbp), %rcx
14553211f:     	movq	%rbx, %rdx
145532122:     	callq	0x145757d40 <.text+0x5756d40>
145532127:     	nop
145532128:     	movq	-0x10(%rbp), %r14
14553212c:     	movq	%r12, (%r14,%rbx,8)
145532130:     	incq	%rbx
145532133:     	jmp	0x1455320d1 <.text+0x55310d1>
145532135:     	movq	$0x0, (%r12)
14553213d:     	movq	$0x8, 0x8(%r12)
145532146:     	movq	$0x0, 0x10(%r12)
14553214f:     	jmp	0x145532167 <.text+0x5531167>
145532151:     	movq	-0x8(%rbp), %rax
145532155:     	movq	-0x20(%rbp), %r12
145532159:     	movq	%rax, 0x10(%r12)
14553215e:     	movups	-0x18(%rbp), %xmm0
145532162:     	movups	%xmm0, (%r12)
145532167:     	movq	%r12, %rax
14553216a:     	addq	$0x58, %rsp
14553216e:     	popq	%rbx
14553216f:     	popq	%rdi
145532170:     	popq	%rsi
145532171:     	popq	%r12
145532173:     	popq	%r13
145532175:     	popq	%r14
145532177:     	popq	%r15
145532179:     	popq	%rbp
14553217a:     	retq
14553217b:     	movl	$0x8, %ecx
145532180:     	movl	$0x20, %edx
145532185:     	callq	0x1458e721b <.text+0x58e621b>
14553218a:     	ud2
