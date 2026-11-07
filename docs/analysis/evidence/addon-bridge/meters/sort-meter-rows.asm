
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145981c90:     	pushq	%rsi
145981c91:     	pushq	%rdi
145981c92:     	pushq	%rbx
145981c93:     	leaq	-0x1(%r8), %rax
145981c97:     	cmpq	%rdx, %rax
145981c9a:     	jae	0x145981d52 <.text+0x5980d52>
145981ca0:     	cmpq	%rdx, %r8
145981ca3:     	jne	0x145981ca9 <.text+0x5980ca9>
145981ca5:     	popq	%rbx
145981ca6:     	popq	%rdi
145981ca7:     	popq	%rsi
145981ca8:     	retq
145981ca9:     	leaq	(%rcx,%rdx,8), %rax
145981cad:     	leaq	(%rcx,%r8,8), %rdx
145981cb1:     	shlq	$0x3, %r8
145981cb5:     	jmp	0x145981cd3 <.text+0x5980cd3>
145981cb7:     	nopw	(%rax,%rax)
145981cc0:     	movq	%rcx, %r11
145981cc3:     	movq	%r9, (%r11)
145981cc6:     	addq	$0x8, %rdx
145981cca:     	addq	$0x8, %r8
145981cce:     	cmpq	%rax, %rdx
145981cd1:     	je	0x145981ca5 <.text+0x5980ca5>
145981cd3:     	movq	-0x8(%rdx), %r10
145981cd7:     	movq	(%rdx), %r9
145981cda:     	movq	0x40(%r10), %r11
145981cde:     	movq	0x40(%r9), %rsi
145981ce2:     	movq	%r11, %rdi
145981ce5:     	sarq	$0x3f, %rdi
145981ce9:     	shrq	%rdi
145981cec:     	xorq	%r11, %rdi
145981cef:     	movq	%rsi, %r11
145981cf2:     	sarq	$0x3f, %r11
145981cf6:     	shrq	%r11
145981cf9:     	xorq	%rsi, %r11
145981cfc:     	cmpq	%r11, %rdi
145981cff:     	jge	0x145981cc6 <.text+0x5980cc6>
145981d01:     	movq	%r8, %r11
145981d04:     	nopw	%cs:(%rax,%rax)
145981d10:     	movq	%r10, (%rcx,%r11)
145981d14:     	cmpq	$0x8, %r11
145981d18:     	je	0x145981cc0 <.text+0x5980cc0>
145981d1a:     	movq	-0x10(%rcx,%r11), %r10
145981d1f:     	movq	0x40(%r10), %rsi
145981d23:     	movq	0x40(%r9), %rdi
145981d27:     	movq	%rsi, %rbx
145981d2a:     	sarq	$0x3f, %rbx
145981d2e:     	shrq	%rbx
145981d31:     	xorq	%rsi, %rbx
145981d34:     	movq	%rdi, %rsi
145981d37:     	sarq	$0x3f, %rsi
145981d3b:     	shrq	%rsi
145981d3e:     	xorq	%rdi, %rsi
145981d41:     	addq	$-0x8, %r11
145981d45:     	cmpq	%rsi, %rbx
145981d48:     	jl	0x145981d10 <.text+0x5980d10>
145981d4a:     	addq	%rcx, %r11
145981d4d:     	jmp	0x145981cc3 <.text+0x5980cc3>
145981d52:     	ud2
