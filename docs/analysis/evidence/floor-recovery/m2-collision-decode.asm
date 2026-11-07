
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145682080:     	pushq	%rbp
145682081:     	pushq	%rsi
145682082:     	pushq	%rdi
145682083:     	pushq	%rbx
145682084:     	subq	$0xf8, %rsp
14568208b:     	leaq	0x80(%rsp), %rbp
145682093:     	movq	$-0x2, 0x70(%rbp)
14568209b:     	movq	%rdx, %rbx
14568209e:     	movq	%rcx, %rsi
1456820a1:     	leaq	0x38(%rbp), %rdi
1456820a5:     	movq	%rdi, %rcx
1456820a8:     	movq	%r8, %rdx
1456820ab:     	movq	%r9, %r8
1456820ae:     	callq	0x145601850 <.text+0x5600850>
1456820b3:     	movq	0x40(%rbp), %r8
1456820b7:     	movq	0x48(%rbp), %r9
1456820bb:     	leaq	0x20(%rbp), %rcx
1456820bf:     	movq	%rbx, %rdx
1456820c2:     	callq	0x145688fb0 <.text+0x5687fb0>
1456820c7:     	nop
1456820c8:     	movq	0x20(%rbp), %rax
1456820cc:     	movq	0x28(%rbp), %rbx
1456820d0:     	cmpq	$-0x1, %rax
1456820d4:     	je	0x145682127 <.text+0x5681127>
1456820d6:     	movq	%rax, 0x58(%rbp)
1456820da:     	movq	0x30(%rbp), %r8
1456820de:     	leaq	-0x30(%rbp), %rcx
1456820e2:     	movq	%rbx, 0x60(%rbp)
1456820e6:     	movq	%rbx, %rdx
1456820e9:     	callq	0x145682cc0 <.text+0x5681cc0>
1456820ee:     	nop
1456820ef:     	cmpq	$-0x1, -0x30(%rbp)
1456820f4:     	je	0x145682190 <.text+0x5681190>
1456820fa:     	movups	-0x30(%rbp), %xmm0
1456820fe:     	movups	-0x20(%rbp), %xmm1
145682102:     	movups	-0x10(%rbp), %xmm2
145682106:     	movups	%xmm2, 0x20(%rsi)
14568210a:     	movups	%xmm1, 0x10(%rsi)
14568210e:     	movups	%xmm0, (%rsi)
145682111:     	movq	0x60(%rbp), %rcx
145682115:     	movq	0x58(%rbp), %rdx
145682119:     	testq	%rdx, %rdx
14568211c:     	jne	0x145682205 <.text+0x5681205>
145682122:     	jmp	0x145682210 <.text+0x5681210>
145682127:     	movq	%rbx, 0x50(%rbp)
14568212b:     	movq	%rdi, -0x60(%rbp)
14568212f:     	leaq	-0x5680056(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145682136:     	movq	%rax, -0x58(%rbp)
14568213a:     	movb	$0x1, 0x6f(%rbp)
14568213e:     	leaq	0x16ca713(%rip), %rdx   # 0x146d4c858
145682145:     	movq	%rbp, %rcx
145682148:     	leaq	-0x60(%rbp), %r8
14568214c:     	callq	0x145728390 <.text+0x5727390>
145682151:     	nop
145682152:     	movq	0x10(%rbp), %rax
145682156:     	movq	%rax, -0x20(%rbp)
14568215a:     	movups	(%rbp), %xmm0
14568215e:     	movaps	%xmm0, -0x30(%rbp)
145682162:     	movq	%rbx, -0x18(%rbp)
145682166:     	movq	$-0x1, -0x60(%rbp)
14568216e:     	movb	$0x0, 0x6f(%rbp)
145682172:     	leaq	-0x30(%rbp), %rcx
145682176:     	leaq	-0x60(%rbp), %rdx
14568217a:     	callq	0x1458ffed0 <.text+0x58feed0>
14568217f:     	nop
145682180:     	movq	%rax, 0x8(%rsi)
145682184:     	movq	$-0x1, (%rsi)
14568218b:     	jmp	0x145682210 <.text+0x5681210>
145682190:     	movq	-0x28(%rbp), %rbx
145682194:     	movq	%rbx, 0x50(%rbp)
145682198:     	movq	%rdi, -0x60(%rbp)
14568219c:     	leaq	-0x56800c3(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
1456821a3:     	movq	%rax, -0x58(%rbp)
1456821a7:     	movb	$0x1, 0x6e(%rbp)
1456821ab:     	leaq	0x16ca6b4(%rip), %rdx   # 0x146d4c866
1456821b2:     	leaq	0x20(%rbp), %rcx
1456821b6:     	leaq	-0x60(%rbp), %r8
1456821ba:     	callq	0x145728390 <.text+0x5727390>
1456821bf:     	nop
1456821c0:     	movq	0x30(%rbp), %rax
1456821c4:     	movq	%rax, 0x10(%rbp)
1456821c8:     	movups	0x20(%rbp), %xmm0
1456821cc:     	movaps	%xmm0, (%rbp)
1456821d0:     	movq	%rbx, 0x18(%rbp)
1456821d4:     	movq	$-0x1, -0x60(%rbp)
1456821dc:     	movb	$0x0, 0x6e(%rbp)
1456821e0:     	movq	%rbp, %rcx
1456821e3:     	leaq	-0x60(%rbp), %rdx
1456821e7:     	callq	0x1458ffed0 <.text+0x58feed0>
1456821ec:     	nop
1456821ed:     	movq	%rax, 0x8(%rsi)
1456821f1:     	movq	$-0x1, (%rsi)
1456821f8:     	movq	0x60(%rbp), %rcx
1456821fc:     	movq	0x58(%rbp), %rdx
145682200:     	testq	%rdx, %rdx
145682203:     	je	0x145682210 <.text+0x5681210>
145682205:     	movl	$0x1, %r8d
14568220b:     	callq	0x1400021d0 <.text+0x11d0>
145682210:     	movq	0x38(%rbp), %rdx
145682214:     	testq	%rdx, %rdx
145682217:     	je	0x145682228 <.text+0x5681228>
145682219:     	movq	0x40(%rbp), %rcx
14568221d:     	movl	$0x1, %r8d
145682223:     	callq	0x1400021d0 <.text+0x11d0>
145682228:     	movq	%rsi, %rax
14568222b:     	addq	$0xf8, %rsp
145682232:     	popq	%rbx
145682233:     	popq	%rdi
145682234:     	popq	%rsi
145682235:     	popq	%rbp
145682236:     	retq
