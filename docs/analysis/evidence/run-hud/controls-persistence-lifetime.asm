# screens-plugin-register
Disassembly of section .text:

0000000140001000 <.text>:
140063e36:     	movq	%r14, (%rax)
140063e39:     	movb	%bl, 0x8(%rax)
140063e3c:     	leaq	0x5d0d96d(%rip), %r9    # 0x145d717b0
140063e43:     	leaq	-0x48(%rbp), %rcx
140063e47:     	movq	%rdi, %rdx
140063e4a:     	movq	%rax, %r8
140063e4d:     	callq	0x144dd28a0 <.text+0x4dd18a0>

# screens-plugin-name
Disassembly of section .text:

0000000140001000 <.text>:
14006f540:     	leaq	0x5d04689(%rip), %rax   # 0x145d73bd0
14006f547:     	movl	$0x29, %edx
14006f54c:     	retq

# plugin-build-dispatch
Disassembly of section .text:

0000000140001000 <.text>:
144dd2be5:     	incq	0x5f8(%rdx)
144dd2bec:     	movq	0x98(%rbp), %rcx
144dd2bf3:     	movq	0xa0(%rbp), %rax
144dd2bfa:     	callq	*0x40(%rax)

# persistence-setup-call
Disassembly of section .text:

0000000140001000 <.text>:
140042d1b:     	movq	%rsi, %rcx
140042d1e:     	callq	0x140272060 <.text+0x271060>
140042d23:     	movq	%rsi, %rcx
140042d26:     	callq	0x140359820 <.text+0x358820>
