
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1407470b0:     	pushq	%rbp
1407470b1:     	pushq	%r15
1407470b3:     	pushq	%r14
1407470b5:     	pushq	%r12
1407470b7:     	pushq	%rsi
1407470b8:     	pushq	%rdi
1407470b9:     	pushq	%rbx
1407470ba:     	subq	$0xd0, %rsp
1407470c1:     	leaq	0x80(%rsp), %rbp
1407470c9:     	movq	$-0x2, 0x48(%rbp)
1407470d1:     	movq	%r8, %rdi
1407470d4:     	movq	%rcx, %rsi
1407470d7:     	cmpl	$0x2, 0x28(%rdx)
1407470db:     	jne	0x1407471c3 <.text+0x7461c3>
1407470e1:     	movq	%rdx, %r15
1407470e4:     	leaq	0x40(%rdi), %r14
1407470e8:     	leaq	0x5a8(%rdi), %r12
1407470ef:     	movq	%r14, -0x38(%rbp)
1407470f3:     	movq	%r12, -0x30(%rbp)
1407470f7:     	movq	$0x0, -0x50(%rbp)
1407470ff:     	movq	$0x8, -0x48(%rbp)
140747107:     	movq	$0x0, -0x40(%rbp)
14074710f:     	leaq	0x53694ba(%rip), %rdx   # 0x145ab05d0
140747116:     	leaq	-0x50(%rbp), %rcx
14074711a:     	callq	0x140cca7d0 <.text+0xcc97d0>
14074711f:     	nop
140747120:     	movq	%rax, %rbx
140747123:     	movq	-0x50(%rbp), %rdx
140747127:     	testq	%rdx, %rdx
14074712a:     	je	0x14074713f <.text+0x74613f>
14074712c:     	movq	-0x48(%rbp), %rcx
140747130:     	shlq	$0x3, %rdx
140747134:     	movl	$0x8, %r8d
14074713a:     	callq	0x1400021d0 <.text+0x11d0>
14074713f:     	movq	%r14, -0x38(%rbp)
140747143:     	movq	%r12, -0x30(%rbp)
140747147:     	movq	$0x0, -0x50(%rbp)
14074714f:     	movq	$0x8, -0x48(%rbp)
140747157:     	movq	$0x0, -0x40(%rbp)
14074715f:     	leaq	0x536a51a(%rip), %rdx   # 0x145ab1680
140747166:     	leaq	-0x50(%rbp), %rcx
14074716a:     	callq	0x140ce91f0 <.text+0xce81f0>
14074716f:     	nop
140747170:     	movq	%rax, %r14
140747173:     	movq	-0x50(%rbp), %rdx
140747177:     	testq	%rdx, %rdx
14074717a:     	je	0x14074718f <.text+0x74618f>
14074717c:     	movq	-0x48(%rbp), %rcx
140747180:     	shlq	$0x3, %rdx
140747184:     	movl	$0x8, %r8d
14074718a:     	callq	0x1400021d0 <.text+0x11d0>
14074718f:     	movq	%rdi, %rcx
140747192:     	callq	0x140da2df0 <.text+0xda1df0>
140747197:     	movq	0x5a0(%rdi), %rcx
14074719e:     	movq	%r15, %rdx
1407471a1:     	movq	%rcx, 0x8(%r15)
1407471a5:     	movq	%rbx, 0x10(%r15)
1407471a9:     	movq	%r14, 0x18(%r15)
1407471ad:     	movq	%rax, 0x20(%r15)
1407471b1:     	movl	$0x0, 0x28(%r15)
1407471b9:     	movl	$0x0, 0x34(%r15)
1407471c1:     	jmp	0x1407471d8 <.text+0x7461d8>
1407471c3:     	movq	0x5a0(%rdi), %rax
1407471ca:     	movq	%rax, -0x50(%rbp)
1407471ce:     	cmpq	%rax, 0x8(%rdx)
1407471d2:     	jne	0x14074727b <.text+0x74627b>
1407471d8:     	movl	$0x3dcc5000, %eax       # imm = 0x3DCC5000
1407471dd:     	addl	0x5b0(%rdi), %eax
1407471e3:     	movl	%eax, (%rdx)
1407471e5:     	movq	$0x10, -0x38(%rbp)
1407471ed:     	xorps	%xmm0, %xmm0
1407471f0:     	movups	%xmm0, -0x30(%rbp)
1407471f4:     	movq	$0x10, -0x20(%rbp)
1407471fc:     	movups	%xmm0, -0x18(%rbp)
140747200:     	movq	$0x10, -0x8(%rbp)
140747208:     	movups	%xmm0, (%rbp)
14074720c:     	movq	$0x10, 0x10(%rbp)
140747214:     	movups	%xmm0, 0x18(%rbp)
140747218:     	movq	$0x10, 0x28(%rbp)
140747220:     	movq	$0x0, -0x50(%rbp)
140747228:     	movups	%xmm0, 0x30(%rbp)
14074722c:     	movl	$0x0, 0x40(%rbp)
140747233:     	movq	$0x8, -0x48(%rbp)
14074723b:     	movq	$0x0, -0x40(%rbp)
140747243:     	leaq	0x10(%rdx), %rcx
140747247:     	leaq	-0x50(%rbp), %r8
14074724b:     	movq	%rdi, %r9
14074724e:     	callq	0x140d61a20 <.text+0xd60a20>
140747253:     	nop
140747254:     	leaq	-0x50(%rbp), %rdx
140747258:     	movl	$0x98, %r8d
14074725e:     	movq	%rsi, %rcx
140747261:     	callq	0x145756ddd <.text+0x5755ddd>
140747266:     	movq	%rsi, %rax
140747269:     	addq	$0xd0, %rsp
140747270:     	popq	%rbx
140747271:     	popq	%rdi
140747272:     	popq	%rsi
140747273:     	popq	%r12
140747275:     	popq	%r14
140747277:     	popq	%r15
140747279:     	popq	%rbp
14074727a:     	retq
14074727b:     	addq	$0x8, %rdx
14074727f:     	leaq	0x52aee82(%rip), %rax   # 0x1459f6108
140747286:     	movq	%rax, 0x28(%rsp)
14074728b:     	movq	$0x83, 0x20(%rsp)
140747294:     	leaq	0x52aee2c(%rip), %r9    # 0x1459f60c7
14074729b:     	leaq	-0x50(%rbp), %r8
14074729f:     	xorl	%ecx, %ecx
1407472a1:     	callq	0x14589fabd <.text+0x589eabd>
1407472a6:     	ud2
