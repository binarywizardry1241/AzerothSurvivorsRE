
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145911009:     	movq	%rsi, 0xa0(%rbp)
145911010:     	leaq	-0x590ef57(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145911017:     	movq	%rax, 0xa8(%rbp)
14591101e:     	leaq	0x1569e91(%rip), %rdx   # 0x146e7aeb6
145911025:     	leaq	0x230(%rbp), %rcx
14591102c:     	leaq	0xa0(%rbp), %r8
145911033:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
145911038:     	movq	0x378(%rbp), %r13
14591103f:     	movss	0x18(%r14), %xmm1
145911045:     	movss	0x1c(%r14), %xmm2
14591104b:     	movq	0x238(%rbp), %r9
145911052:     	movq	0x240(%rbp), %rax
145911059:     	movq	%rax, 0x20(%rsp)
14591105e:     	leaq	0xa0(%rbp), %rcx
145911065:     	movq	%r9, 0x370(%rbp)
14591106c:     	callq	0x1458a9ae0 <.text+0x58a8ae0>
145911071:     	nop
145911072:     	movq	0x5e0(%r13), %rsi
145911079:     	cmpq	0x5d0(%r13), %rsi
145911080:     	jne	0x14591108f <.text+0x591008f>
145911082:     	movq	0x350(%rbp), %rcx
145911089:     	callq	0x145bcb530 <.text+0x5bca530>
14591108e:     	nop
14591108f:     	movq	0x5d8(%r13), %rax
145911096:     	movq	%rsi, %rcx
145911099:     	shlq	$0x5, %rcx
14591109d:     	movups	0xa0(%rbp), %xmm0
1459110a4:     	movups	0xb0(%rbp), %xmm1
1459110ab:     	movups	%xmm1, 0x10(%rax,%rcx)
1459110b0:     	movups	%xmm0, (%rax,%rcx)
1459110b4:     	incq	%rsi
1459110b7:     	movq	%rsi, 0x5e0(%r13)
1459110be:     	movq	0x230(%rbp), %rdx
1459110c5:     	testq	%rdx, %rdx
1459110c8:     	je	0x14590fe6d <.text+0x590ee6d>
1459110ce:     	movl	$0x1, %r8d
1459110d4:     	movq	0x370(%rbp), %rcx
1459110db:     	callq	0x1400021d0 <.text+0x11d0>
1459110e0:     	jmp	0x14590fe6d <.text+0x590ee6d>
