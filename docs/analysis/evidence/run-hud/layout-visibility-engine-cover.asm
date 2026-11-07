
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14063cee0:     	pushq	%rsi
14063cee1:     	cmpq	$0x0, 0x90(%rcx)
14063cee9:     	je	0x14063cfce <.text+0x63bfce>
14063ceef:     	movq	0x78(%rcx), %rax
14063cef3:     	movq	0x80(%rcx), %rdx
14063cefa:     	movabsq	$-0x57edb0dd5f2a9758, %r8 # imm = 0xA8124F22A0D568A8
14063cf04:     	xorl	%r9d, %r9d
14063cf07:     	movdqa	0x5785c11(%rip), %xmm0  # 0x145dc2b20
14063cf0f:     	pcmpeqd	%xmm1, %xmm1
14063cf13:     	movdqa	0x581e7e5(%rip), %xmm2  # 0x145e5b700
14063cf1b:     	andq	%rdx, %r8
14063cf1e:     	movdqu	(%rax,%r8), %xmm3
14063cf24:     	movdqa	%xmm3, %xmm4
14063cf28:     	pcmpeqb	%xmm0, %xmm4
14063cf2c:     	pmovmskb	%xmm4, %r10d
14063cf31:     	testl	%r10d, %r10d
14063cf34:     	je	0x14063cf70 <.text+0x63bf70>
14063cf36:     	tzcntl	%r10d, %r11d
14063cf3b:     	addq	%r8, %r11
14063cf3e:     	andq	%rdx, %r11
14063cf41:     	negq	%r11
14063cf44:     	leaq	(%r11,%r11,2), %r11
14063cf48:     	movdqu	-0x18(%rax,%r11,8), %xmm4
14063cf4f:     	pcmpeqb	%xmm2, %xmm4
14063cf53:     	pmovmskb	%xmm4, %esi
14063cf57:     	cmpl	$0xffff, %esi           # imm = 0xFFFF
14063cf5d:     	je	0x14063cf8b <.text+0x63bf8b>
14063cf5f:     	leal	-0x1(%r10), %r11d
14063cf63:     	andw	%r10w, %r11w
14063cf67:     	movl	%r11d, %r10d
14063cf6a:     	jne	0x14063cf36 <.text+0x63bf36>
14063cf6c:     	nopl	(%rax)
14063cf70:     	pcmpeqb	%xmm1, %xmm3
14063cf74:     	pmovmskb	%xmm3, %r10d
14063cf79:     	testl	%r10d, %r10d
14063cf7c:     	jne	0x14063cfce <.text+0x63bfce>
14063cf7e:     	addq	%r9, %r8
14063cf81:     	addq	$0x10, %r8
14063cf85:     	addq	$0x10, %r9
14063cf89:     	jmp	0x14063cf1b <.text+0x63bf1b>
14063cf8b:     	leaq	(%rax,%r11,8), %rax
14063cf8f:     	movq	-0x8(%rax), %rax
14063cf93:     	cmpq	0x218(%rcx), %rax
14063cf9a:     	jae	0x14063cfce <.text+0x63bfce>
14063cf9c:     	movq	0x210(%rcx), %rdx
14063cfa3:     	movq	(%rdx,%rax,8), %rdx
14063cfa7:     	testq	%rdx, %rdx
14063cfaa:     	je	0x14063cfce <.text+0x63bfce>
14063cfac:     	movq	0x1e0(%rcx), %rax
14063cfb3:     	notq	%rdx
14063cfb6:     	imulq	$0x38, %rdx, %rcx
14063cfba:     	cmpb	$0x1, 0x30(%rax,%rcx)
14063cfbf:     	jne	0x14063cfce <.text+0x63bfce>
14063cfc1:     	addq	%rcx, %rax
14063cfc4:     	movq	0x10(%rax), %rax
14063cfc8:     	movzbl	0x48(%rax), %eax
14063cfcc:     	popq	%rsi
14063cfcd:     	retq
14063cfce:     	xorl	%eax, %eax
14063cfd0:     	popq	%rsi
14063cfd1:     	retq
