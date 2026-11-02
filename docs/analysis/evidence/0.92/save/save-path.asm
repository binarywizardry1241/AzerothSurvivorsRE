
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145420f30:     	pushq	%rbp
145420f31:     	pushq	%rsi
145420f32:     	subq	$0xa8, %rsp
145420f39:     	leaq	0x80(%rsp), %rbp
145420f41:     	movq	$-0x2, 0x20(%rbp)
145420f49:     	movq	%rcx, %rsi
145420f4c:     	leaq	0x1473e1c(%rip), %rdx   # 0x146894d6f
145420f53:     	leaq	-0x38(%rbp), %rcx
145420f57:     	movl	$0xe, %r8d
145420f5d:     	callq	0x1456b6770 <.text+0x56b5770>
145420f62:     	movq	-0x38(%rbp), %rax
145420f66:     	cmpq	$-0x1, %rax
145420f6a:     	je	0x145420f9d <.text+0x541ff9d>
145420f6c:     	movq	%rax, 0x18(%rbp)
145420f70:     	movq	-0x30(%rbp), %rcx
145420f74:     	movq	-0x28(%rbp), %rdx
145420f78:     	movq	%rcx, 0x10(%rbp)
145420f7c:     	callq	0x1456a4900 <.text+0x56a3900>
145420f81:     	nop
145420f82:     	testq	%rax, %rax
145420f85:     	je	0x145421021 <.text+0x5420021>
145420f8b:     	movq	%rdx, %r8
145420f8e:     	leaq	-0x10(%rbp), %rcx
145420f92:     	movq	%rax, %rdx
145420f95:     	callq	0x1456c9320 <.text+0x56c8320>
145420f9a:     	nop
145420f9b:     	jmp	0x145421007 <.text+0x5420007>
145420f9d:     	leaq	0x1473dd9(%rip), %rdx   # 0x146894d7d
145420fa4:     	leaq	-0x10(%rbp), %rcx
145420fa8:     	movl	$0x7, %r8d
145420fae:     	callq	0x1456b6770 <.text+0x56b5770>
145420fb3:     	movq	-0x10(%rbp), %rax
145420fb7:     	cmpq	$-0x1, %rax
145420fbb:     	jne	0x145420fdd <.text+0x541ffdd>
145420fbd:     	leaq	0x12bf821(%rip), %rdx   # 0x1466e07e5
145420fc4:     	leaq	-0x10(%rbp), %rcx
145420fc8:     	movl	$0xd, %r8d
145420fce:     	callq	0x1456b6770 <.text+0x56b5770>
145420fd3:     	movq	-0x10(%rbp), %rax
145420fd7:     	cmpq	$-0x1, %rax
145420fdb:     	je	0x14542104d <.text+0x542004d>
145420fdd:     	movq	%rax, 0x18(%rbp)
145420fe1:     	movq	-0x8(%rbp), %rdx
145420fe5:     	movq	(%rbp), %r8
145420fe9:     	movq	$0xd, 0x20(%rsp)
145420ff2:     	leaq	0x1473d8b(%rip), %r9    # 0x146894d84
145420ff9:     	leaq	-0x10(%rbp), %rcx
145420ffd:     	movq	%rdx, 0x10(%rbp)
145421001:     	callq	0x1456a47d0 <.text+0x56a37d0>
145421006:     	nop
145421007:     	movups	-0x10(%rbp), %xmm0
14542100b:     	movups	(%rbp), %xmm1
14542100f:     	movups	%xmm1, 0x10(%rsi)
145421013:     	movups	%xmm0, (%rsi)
145421016:     	movq	0x18(%rbp), %rdx
14542101a:     	testq	%rdx, %rdx
14542101d:     	jne	0x145421031 <.text+0x5420031>
14542101f:     	jmp	0x145421040 <.text+0x5420040>
145421021:     	movq	$-0x1, (%rsi)
145421028:     	movq	0x18(%rbp), %rdx
14542102c:     	testq	%rdx, %rdx
14542102f:     	je	0x145421040 <.text+0x5420040>
145421031:     	movl	$0x1, %r8d
145421037:     	movq	0x10(%rbp), %rcx
14542103b:     	callq	0x1400021d0 <.text+0x11d0>
145421040:     	movq	%rsi, %rax
145421043:     	addq	$0xa8, %rsp
14542104a:     	popq	%rsi
14542104b:     	popq	%rbp
14542104c:     	retq
14542104d:     	leaq	0x12bf755(%rip), %rdx   # 0x1466e07a9
145421054:     	leaq	-0x58(%rbp), %rcx
145421058:     	movl	$0x4, %r8d
14542105e:     	callq	0x1456b6770 <.text+0x56b5770>
145421063:     	movq	-0x58(%rbp), %rax
145421067:     	cmpq	$-0x1, %rax
14542106b:     	je	0x14542110c <.text+0x542010c>
145421071:     	movq	%rax, 0x18(%rbp)
145421075:     	movq	-0x50(%rbp), %rdx
145421079:     	movq	-0x48(%rbp), %r8
14542107d:     	movq	$0x6, 0x20(%rsp)
145421086:     	leaq	0x12bf711(%rip), %r9    # 0x1466e079e
14542108d:     	leaq	-0x10(%rbp), %rcx
145421091:     	movq	%rdx, 0x10(%rbp)
145421095:     	callq	0x1456a47d0 <.text+0x56a37d0>
14542109a:     	nop
14542109b:     	movq	-0x8(%rbp), %rdx
14542109f:     	movq	(%rbp), %r8
1454210a3:     	movq	$0x5, 0x20(%rsp)
1454210ac:     	leaq	0x12bf6f1(%rip), %r9    # 0x1466e07a4
1454210b3:     	leaq	-0x38(%rbp), %rcx
1454210b7:     	movq	%rdx, -0x18(%rbp)
1454210bb:     	callq	0x1456a47d0 <.text+0x56a37d0>
1454210c0:     	nop
1454210c1:     	movq	-0x10(%rbp), %rdx
1454210c5:     	testq	%rdx, %rdx
1454210c8:     	je	0x1454210d9 <.text+0x54200d9>
1454210ca:     	movl	$0x1, %r8d
1454210d0:     	movq	-0x18(%rbp), %rcx
1454210d4:     	callq	0x1400021d0 <.text+0x11d0>
1454210d9:     	movq	0x18(%rbp), %rdx
1454210dd:     	testq	%rdx, %rdx
1454210e0:     	je	0x1454210f1 <.text+0x54200f1>
1454210e2:     	movl	$0x1, %r8d
1454210e8:     	movq	0x10(%rbp), %rcx
1454210ec:     	callq	0x1400021d0 <.text+0x11d0>
1454210f1:     	movq	-0x38(%rbp), %rax
1454210f5:     	cmpq	$-0x1, %rax
1454210f9:     	je	0x14542110c <.text+0x542010c>
1454210fb:     	movq	%rax, 0x18(%rbp)
1454210ff:     	movq	-0x30(%rbp), %rdx
145421103:     	movq	-0x28(%rbp), %r8
145421107:     	jmp	0x145420fe9 <.text+0x541ffe9>
14542110c:     	movq	$-0x1, (%rsi)
145421113:     	jmp	0x145421040 <.text+0x5420040>
145421118:     	nopl	(%rax,%rax)
145421120:     	movq	%rdx, 0x10(%rsp)
145421125:     	pushq	%rbp
145421126:     	pushq	%rsi
145421127:     	subq	$0x28, %rsp
14542112b:     	leaq	0x80(%rdx), %rbp
145421132:     	cmpq	$0x0, 0x18(%rbp)
145421137:     	je	0x14542114d <.text+0x542014d>
145421139:     	movl	$0x1, %r8d
14542113f:     	movq	0x10(%rbp), %rcx
145421143:     	movq	0x18(%rbp), %rdx
145421147:     	callq	0x1400021d0 <.text+0x11d0>
14542114c:     	nop
14542114d:     	addq	$0x28, %rsp
145421151:     	popq	%rsi
145421152:     	popq	%rbp
145421153:     	retq
145421154:     	nopw	%cs:(%rax,%rax)
145421160:     	movq	%rdx, 0x10(%rsp)
145421165:     	pushq	%rbp
145421166:     	pushq	%rsi
145421167:     	subq	$0x28, %rsp
14542116b:     	leaq	0x80(%rdx), %rbp
145421172:     	cmpq	$0x0, 0x18(%rbp)
145421177:     	je	0x14542118d <.text+0x542018d>
145421179:     	movl	$0x1, %r8d
14542117f:     	movq	0x10(%rbp), %rcx
145421183:     	movq	0x18(%rbp), %rdx
145421187:     	callq	0x1400021d0 <.text+0x11d0>
14542118c:     	nop
14542118d:     	addq	$0x28, %rsp
145421191:     	popq	%rsi
145421192:     	popq	%rbp
145421193:     	retq
145421194:     	nopw	%cs:(%rax,%rax)
1454211a0:     	movq	%rdx, 0x10(%rsp)
1454211a5:     	pushq	%rbp
1454211a6:     	pushq	%rsi
1454211a7:     	subq	$0x28, %rsp
1454211ab:     	leaq	0x80(%rdx), %rbp
1454211b2:     	movq	-0x10(%rbp), %rdx
1454211b6:     	testq	%rdx, %rdx
1454211b9:     	je	0x1454211cb <.text+0x54201cb>
1454211bb:     	movl	$0x1, %r8d
1454211c1:     	movq	-0x18(%rbp), %rcx
1454211c5:     	callq	0x1400021d0 <.text+0x11d0>
1454211ca:     	nop
1454211cb:     	addq	$0x28, %rsp
1454211cf:     	popq	%rsi
1454211d0:     	popq	%rbp
1454211d1:     	retq
1454211d2:     	nopw	%cs:(%rax,%rax)
1454211e0:     	movq	%rdx, 0x10(%rsp)
1454211e5:     	pushq	%rbp
1454211e6:     	pushq	%rsi
1454211e7:     	subq	$0x28, %rsp
1454211eb:     	leaq	0x80(%rdx), %rbp
1454211f2:     	cmpq	$0x0, 0x18(%rbp)
1454211f7:     	je	0x14542120d <.text+0x542020d>
1454211f9:     	movl	$0x1, %r8d
1454211ff:     	movq	0x10(%rbp), %rcx
145421203:     	movq	0x18(%rbp), %rdx
145421207:     	callq	0x1400021d0 <.text+0x11d0>
14542120c:     	nop
14542120d:     	addq	$0x28, %rsp
145421211:     	popq	%rsi
145421212:     	popq	%rbp
145421213:     	retq
145421214:     	int3
145421215:     	int3
145421216:     	int3
145421217:     	int3
145421218:     	int3
145421219:     	int3
14542121a:     	int3
14542121b:     	int3
14542121c:     	int3
14542121d:     	int3
14542121e:     	int3
14542121f:     	int3
145421220:     	pushq	%rbp
145421221:     	pushq	%rsi
145421222:     	subq	$0x88, %rsp
145421229:     	leaq	0x80(%rsp), %rbp
145421231:     	movq	$-0x2, (%rbp)
145421239:     	movq	%rcx, %rsi
14542123c:     	leaq	0x1473b2c(%rip), %rdx   # 0x146894d6f
145421243:     	leaq	-0x30(%rbp), %rcx
145421247:     	movl	$0xe, %r8d
14542124d:     	callq	0x1456b6770 <.text+0x56b5770>
145421252:     	cmpq	$-0x1, -0x30(%rbp)
145421257:     	je	0x145421272 <.text+0x5420272>
145421259:     	movups	-0x30(%rbp), %xmm0
14542125d:     	movups	-0x20(%rbp), %xmm1
145421261:     	movups	%xmm1, 0x10(%rsi)
145421265:     	movups	%xmm0, (%rsi)
145421268:     	addq	$0x88, %rsp
14542126f:     	popq	%rsi
145421270:     	popq	%rbp
145421271:     	retq
145421272:     	leaq	-0x30(%rbp), %rcx
145421276:     	callq	0x145420f30 <.text+0x541ff30>
14542127b:     	movq	-0x30(%rbp), %rax
14542127f:     	cmpq	$-0x1, %rax
145421283:     	je	0x1454212df <.text+0x54202df>
145421285:     	movq	%rax, -0x8(%rbp)
145421289:     	movq	-0x28(%rbp), %rdx
14542128d:     	movq	-0x20(%rbp), %r8
145421291:     	movq	$0xe, 0x20(%rsp)
14542129a:     	leaq	0x1473af0(%rip), %r9    # 0x146894d91
1454212a1:     	leaq	-0x50(%rbp), %rcx
1454212a5:     	movq	%rdx, -0x10(%rbp)
1454212a9:     	callq	0x1456a47d0 <.text+0x56a37d0>
1454212ae:     	nop
1454212af:     	movups	-0x50(%rbp), %xmm0
1454212b3:     	movups	-0x40(%rbp), %xmm1
1454212b7:     	movups	%xmm1, 0x10(%rsi)
1454212bb:     	movups	%xmm0, (%rsi)
1454212be:     	movq	-0x8(%rbp), %rdx
1454212c2:     	testq	%rdx, %rdx
1454212c5:     	je	0x145421268 <.text+0x5420268>
1454212c7:     	movl	$0x1, %r8d
1454212cd:     	movq	-0x10(%rbp), %rcx
1454212d1:     	addq	$0x88, %rsp
1454212d8:     	popq	%rsi
1454212d9:     	popq	%rbp
1454212da:     	jmp	0x1400021d0 <.text+0x11d0>
1454212df:     	movq	$-0x1, (%rsi)
1454212e6:     	addq	$0x88, %rsp
1454212ed:     	popq	%rsi
1454212ee:     	popq	%rbp
1454212ef:     	retq
