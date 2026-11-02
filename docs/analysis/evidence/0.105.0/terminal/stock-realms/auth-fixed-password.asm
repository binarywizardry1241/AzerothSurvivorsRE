
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145896b4e:     	callq	0x140002200 <.text+0x1200>
145896b53:     	movl	$0x8, %ecx
145896b58:     	movl	$0x1, %edx
145896b5d:     	callq	0x1400021c0 <.text+0x11c0>
145896b62:     	testq	%rax, %rax
145896b65:     	je	0x14589957b <.text+0x589857b>
145896b6b:     	movabsq	$0x726f766976727573, %rcx # imm = 0x726F766976727573
145896b75:     	movq	%rcx, (%rax)
145896b78:     	movq	0x390(%rbp), %rcx
145896b7f:     	leaq	0xe0(%rbp), %rdx
145896b86:     	movq	%rcx, 0x10(%rdx)
145896b8a:     	movaps	0x380(%rbp), %xmm0
145896b91:     	movups	%xmm0, (%rdx)
145896b94:     	movq	%rbx, 0xa0(%rbp)
145896b9b:     	movq	%r13, 0xa8(%rbp)
145896ba2:     	movq	$0x0, 0xb0(%rbp)
145896bad:     	movq	$0x1, 0xb8(%rbp)
145896bb8:     	movq	$0x0, 0xc0(%rbp)
145896bc3:     	movq	$0x8, 0xc8(%rbp)
145896bce:     	movq	%rax, 0xd0(%rbp)
145896bd5:     	movq	$0x8, 0xd8(%rbp)
