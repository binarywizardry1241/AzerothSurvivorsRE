
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145464140:     	pushq	%rbp
145464141:     	pushq	%r14
145464143:     	pushq	%rsi
145464144:     	pushq	%rdi
145464145:     	pushq	%rbx
145464146:     	subq	$0x80, %rsp
14546414d:     	leaq	0x80(%rsp), %rbp
145464155:     	movq	$-0x2, -0x8(%rbp)
14546415d:     	movl	%r9d, %edi
145464160:     	movq	%r8, %rbx
145464163:     	movq	%rdx, %r14
145464166:     	movq	%rcx, %rsi
145464169:     	callq	0x140002200 <.text+0x1200>
14546416e:     	movl	$0x20, %ecx
145464173:     	movl	$0x1, %edx
145464178:     	callq	0x1400021c0 <.text+0x11c0>
14546417d:     	testq	%rax, %rax
145464180:     	je	0x1454644bc <.text+0x54634bc>
145464186:     	movw	$0x24e, -0x18(%rbp)     # imm = 0x24E
14546418c:     	movq	$0x20, -0x30(%rbp)
145464194:     	movq	%rax, -0x28(%rbp)
145464198:     	movq	$0x0, -0x20(%rbp)
1454641a0:     	leaq	-0x30(%rbp), %rdx
1454641a4:     	movq	%r14, %rcx
1454641a7:     	callq	0x14551c6a0 <.text+0x551b6a0>
1454641ac:     	nop
1454641ad:     	movups	-0x30(%rbp), %xmm0
1454641b1:     	movups	-0x20(%rbp), %xmm1
1454641b5:     	movaps	%xmm1, -0x40(%rbp)
1454641b9:     	movaps	%xmm0, -0x50(%rbp)
1454641bd:     	leaq	-0x50(%rbp), %rdx
1454641c1:     	movq	%rbx, %rcx
1454641c4:     	callq	0x14551c6a0 <.text+0x551b6a0>
1454641c9:     	nop
1454641ca:     	movaps	-0x50(%rbp), %xmm0
1454641ce:     	movaps	-0x40(%rbp), %xmm1
1454641d2:     	movaps	%xmm1, -0x20(%rbp)
1454641d6:     	movaps	%xmm0, -0x30(%rbp)
1454641da:     	movq	-0x20(%rbp), %rdx
1454641de:     	movq	-0x30(%rbp), %rax
1454641e2:     	subq	%rdx, %rax
1454641e5:     	cmpq	$0x3, %rax
1454641e9:     	jbe	0x1454643a4 <.text+0x54633a4>
1454641ef:     	movq	-0x28(%rbp), %rax
1454641f3:     	movl	%edi, (%rax,%rdx)
1454641f6:     	addq	$0x4, %rdx
1454641fa:     	movq	%rdx, -0x20(%rbp)
1454641fe:     	movaps	-0x30(%rbp), %xmm0
145464202:     	movaps	%xmm0, -0x50(%rbp)
145464206:     	movq	-0x20(%rbp), %rax
14546420a:     	movq	%rax, -0x40(%rbp)
14546420e:     	movq	-0x18(%rbp), %rax
145464212:     	movq	%rax, -0x38(%rbp)
145464216:     	movq	-0x40(%rbp), %rdx
14546421a:     	movq	-0x50(%rbp), %rax
14546421e:     	subq	%rdx, %rax
145464221:     	cmpq	$0x3, %rax
145464225:     	jbe	0x1454643cc <.text+0x54633cc>
14546422b:     	movq	-0x48(%rbp), %rax
14546422f:     	movl	$0x1, (%rax,%rdx)
145464236:     	addq	$0x4, %rdx
14546423a:     	movq	%rdx, -0x40(%rbp)
14546423e:     	movaps	-0x50(%rbp), %xmm0
145464242:     	movaps	%xmm0, -0x30(%rbp)
145464246:     	movq	-0x40(%rbp), %rax
14546424a:     	movq	%rax, -0x20(%rbp)
14546424e:     	movq	-0x38(%rbp), %rax
145464252:     	movq	%rax, -0x18(%rbp)
145464256:     	movq	-0x20(%rbp), %rdx
14546425a:     	movq	-0x30(%rbp), %rax
14546425e:     	subq	%rdx, %rax
145464261:     	cmpq	$0x3, %rax
145464265:     	jbe	0x1454643f4 <.text+0x54633f4>
14546426b:     	movq	-0x28(%rbp), %rax
14546426f:     	movl	$0x3, (%rax,%rdx)
145464276:     	addq	$0x4, %rdx
14546427a:     	movq	%rdx, -0x20(%rbp)
14546427e:     	movaps	-0x30(%rbp), %xmm0
145464282:     	movaps	%xmm0, -0x50(%rbp)
145464286:     	movq	-0x20(%rbp), %rax
14546428a:     	movq	%rax, -0x40(%rbp)
14546428e:     	movq	-0x18(%rbp), %rax
145464292:     	movq	%rax, -0x38(%rbp)
145464296:     	movq	-0x40(%rbp), %rdx
14546429a:     	movq	-0x50(%rbp), %rax
14546429e:     	subq	%rdx, %rax
1454642a1:     	cmpq	$0x3, %rax
1454642a5:     	jbe	0x14546441c <.text+0x546341c>
1454642ab:     	movl	0x50(%rbp), %eax
1454642ae:     	movq	-0x48(%rbp), %rcx
1454642b2:     	movl	%eax, (%rcx,%rdx)
1454642b5:     	addq	$0x4, %rdx
1454642b9:     	movq	%rdx, -0x40(%rbp)
1454642bd:     	movaps	-0x50(%rbp), %xmm0
1454642c1:     	movaps	%xmm0, -0x30(%rbp)
1454642c5:     	movq	-0x40(%rbp), %rax
1454642c9:     	movq	%rax, -0x20(%rbp)
1454642cd:     	movq	-0x38(%rbp), %rax
1454642d1:     	movq	%rax, -0x18(%rbp)
1454642d5:     	movq	-0x20(%rbp), %rdx
1454642d9:     	movq	-0x30(%rbp), %rax
1454642dd:     	subq	%rdx, %rax
1454642e0:     	cmpq	$0x3, %rax
1454642e4:     	jbe	0x145464444 <.text+0x5463444>
1454642ea:     	movl	0x58(%rbp), %eax
1454642ed:     	movq	-0x28(%rbp), %rcx
1454642f1:     	movl	%eax, (%rcx,%rdx)
1454642f4:     	addq	$0x4, %rdx
1454642f8:     	movq	%rdx, -0x20(%rbp)
1454642fc:     	movaps	-0x30(%rbp), %xmm0
145464300:     	movaps	%xmm0, -0x50(%rbp)
145464304:     	movq	-0x20(%rbp), %rax
145464308:     	movq	%rax, -0x40(%rbp)
14546430c:     	movq	-0x18(%rbp), %rax
145464310:     	movq	%rax, -0x38(%rbp)
145464314:     	movq	-0x40(%rbp), %rdx
145464318:     	movq	-0x50(%rbp), %rax
14546431c:     	subq	%rdx, %rax
14546431f:     	cmpq	$0x3, %rax
145464323:     	jbe	0x14546446c <.text+0x546346c>
145464329:     	movq	-0x48(%rbp), %rax
14546432d:     	movl	$0x0, (%rax,%rdx)
145464334:     	addq	$0x4, %rdx
145464338:     	movq	%rdx, -0x40(%rbp)
14546433c:     	movaps	-0x50(%rbp), %xmm0
145464340:     	movaps	%xmm0, -0x30(%rbp)
145464344:     	movq	-0x40(%rbp), %rax
145464348:     	movq	%rax, -0x20(%rbp)
14546434c:     	movq	-0x38(%rbp), %rax
145464350:     	movq	%rax, -0x18(%rbp)
145464354:     	movq	-0x20(%rbp), %rdx
145464358:     	movq	-0x30(%rbp), %rax
14546435c:     	subq	%rdx, %rax
14546435f:     	cmpq	$0x3, %rax
145464363:     	jbe	0x145464494 <.text+0x5463494>
145464369:     	movq	-0x28(%rbp), %rax
14546436d:     	movl	$0x0, (%rax,%rdx)
145464374:     	addq	$0x4, %rdx
145464378:     	movq	%rdx, -0x20(%rbp)
14546437c:     	movaps	-0x30(%rbp), %xmm0
145464380:     	movups	%xmm0, (%rsi)
145464383:     	movq	-0x20(%rbp), %rax
145464387:     	movq	%rax, 0x10(%rsi)
14546438b:     	movq	-0x18(%rbp), %rax
14546438f:     	movq	%rax, 0x18(%rsi)
145464393:     	movq	%rsi, %rax
145464396:     	addq	$0x80, %rsp
14546439d:     	popq	%rbx
14546439e:     	popq	%rdi
14546439f:     	popq	%rsi
1454643a0:     	popq	%r14
1454643a2:     	popq	%rbp
1454643a3:     	retq
