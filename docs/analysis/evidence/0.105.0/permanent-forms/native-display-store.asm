
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458f60c3:     	cmpb	$0x6, %r13b
1458f60c7:     	ja	0x1458f60e7 <.text+0x58f50e7>
1458f60c9:     	movzbl	%r13b, %eax
1458f60cd:     	shll	$0x2, %eax
1458f60d0:     	leaq	0x1584fad(%rip), %rcx   # 0x146e7b084
1458f60d7:     	movl	(%rax,%rcx), %r8d
1458f60db:     	leaq	0x1584fbe(%rip), %rcx   # 0x146e7b0a0
1458f60e2:     	movl	(%rax,%rcx), %eax
1458f60e5:     	jmp	0x1458f60f2 <.text+0x58f50f2>
1458f60e7:     	movl	$0x31, %eax
1458f60ec:     	movl	$0x32, %r8d
1458f60f2:     	testb	%sil, %sil
1458f60f5:     	cmovel	%eax, %r8d
1458f60f9:     	movq	0x28(%rbp), %rax
1458f60fd:     	testq	%rax, %rax
1458f6100:     	je	0x1458f6167 <.text+0x58f5167>
1458f6102:     	movq	0x30(%rbp), %rcx
1458f6106:     	movl	$0x84, %edx
1458f610b:     	movzwl	0x36(%rax), %r10d
1458f6110:     	movl	%r10d, %r11d
1458f6113:     	addl	%r11d, %r11d
1458f6116:     	movq	$-0x1, %r9
1458f611d:     	nopl	(%rax)
1458f6120:     	testq	%r11, %r11
1458f6123:     	je	0x1458f6150 <.text+0x58f5150>
1458f6125:     	movzwl	0x3a(%rax,%r9,2), %esi
1458f612b:     	cmpl	%esi, %edx
1458f612d:     	seta	%sil
1458f6131:     	sbbb	$0x0, %sil
1458f6135:     	incq	%r9
1458f6138:     	addq	$-0x2, %r11
1458f613c:     	cmpb	$0x1, %sil
1458f6140:     	je	0x1458f6120 <.text+0x58f5120>
1458f6142:     	movzbl	%sil, %r10d
1458f6146:     	testl	%r10d, %r10d
1458f6149:     	je	0x1458f6160 <.text+0x58f5160>
1458f614b:     	jmp	0x1458f6153 <.text+0x58f5153>
1458f614d:     	nopl	(%rax)
1458f6150:     	movq	%r10, %r9
1458f6153:     	subq	$0x1, %rcx
1458f6157:     	jb	0x1458f6169 <.text+0x58f5169>
1458f6159:     	movq	0x50(%rax,%r9,8), %rax
1458f615e:     	jmp	0x1458f610b <.text+0x58f510b>
1458f6160:     	movl	%r8d, 0x8(%rax,%r9,4)
1458f6165:     	jmp	0x1458f6193 <.text+0x58f5193>
1458f6167:     	xorl	%eax, %eax
1458f6169:     	movq	%rbx, -0x28(%rbp)
1458f616d:     	movq	%rax, -0x20(%rbp)
1458f6171:     	movq	$0x0, -0x18(%rbp)
1458f6179:     	movq	%r9, -0x10(%rbp)
1458f617d:     	movq	$0x84, -0x8(%rbp)
1458f6185:     	leaq	-0x48(%rbp), %rcx
1458f6189:     	leaq	-0x28(%rbp), %rdx
1458f618d:     	callq	0x1458e1710 <.text+0x58e0710>
1458f6192:     	nop
