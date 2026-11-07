
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1407e00a0:     	pushq	%rsi
1407e00a1:     	pushq	%rdi
1407e00a2:     	pushq	%rbx
1407e00a3:     	subq	$0x30, %rsp
1407e00a7:     	movaps	%xmm6, 0x20(%rsp)
1407e00ac:     	movl	0x77dcc06(%rip), %eax   # 0x147fbccb8
1407e00b2:     	testl	%eax, %eax
1407e00b4:     	jne	0x1407e0183 <.text+0x7df183>
1407e00ba:     	movb	$0x1, %r8b
1407e00bd:     	xorl	%eax, %eax
1407e00bf:     	lock
1407e00c0:     	cmpxchgb	%r8b, 0x77dcba0(%rip)   # 0x147fbcc68
1407e00c8:     	jne	0x1407e01ae <.text+0x7df1ae>
1407e00ce:     	movq	0x782490b(%rip), %rsi   # 0x1480049e0
1407e00d5:     	movq	(%rsi), %rax
1407e00d8:     	shlq	%rax
1407e00db:     	testq	%rax, %rax
1407e00de:     	jne	0x1407e01ca <.text+0x7df1ca>
1407e00e4:     	xorl	%eax, %eax
1407e00e6:     	movzbl	0x77dcb7b(%rip), %r8d   # 0x147fbcc69
1407e00ee:     	movq	0x77dcbab(%rip), %r8    # 0x147fbcca0
1407e00f5:     	testq	%r8, %r8
1407e00f8:     	je	0x1407e01f1 <.text+0x7df1f1>
1407e00fe:     	movq	0x77dcba3(%rip), %r9    # 0x147fbcca8
1407e0105:     	movzwl	0x8e(%r8), %r11d
1407e010d:     	movl	%r11d, %edi
1407e0110:     	shll	$0x2, %edi
1407e0113:     	movq	$-0x1, %r10
1407e011a:     	nopw	(%rax,%rax)
1407e0120:     	testq	%rdi, %rdi
1407e0123:     	je	0x1407e0150 <.text+0x7df150>
1407e0125:     	cmpl	0x64(%r8,%r10,4), %ecx
1407e012a:     	seta	%bl
1407e012d:     	sbbb	$0x0, %bl
1407e0130:     	incq	%r10
1407e0133:     	addq	$-0x4, %rdi
1407e0137:     	cmpb	$0x1, %bl
1407e013a:     	je	0x1407e0120 <.text+0x7df120>
1407e013c:     	movzbl	%bl, %r11d
1407e0140:     	testl	%r11d, %r11d
1407e0143:     	je	0x1407e0167 <.text+0x7df167>
1407e0145:     	jmp	0x1407e0153 <.text+0x7df153>
1407e0147:     	nopw	(%rax,%rax)
1407e0150:     	movq	%r11, %r10
1407e0153:     	subq	$0x1, %r9
1407e0157:     	jb	0x1407e01f1 <.text+0x7df1f1>
1407e015d:     	movq	0x90(%r8,%r10,8), %r8
1407e0165:     	jmp	0x1407e0105 <.text+0x7df105>
1407e0167:     	testb	%dl, %dl
1407e0169:     	jne	0x1407e0173 <.text+0x7df173>
1407e016b:     	cmpb	$0x1, 0xc(%r8,%r10,8)
1407e0171:     	jne	0x1407e01f1 <.text+0x7df1f1>
1407e0173:     	movss	0x8(%r8,%r10,8), %xmm0
1407e017a:     	movb	$0x1, %dil
1407e017d:     	testb	%al, %al
1407e017f:     	je	0x1407e01f7 <.text+0x7df1f7>
1407e0181:     	jmp	0x1407e0202 <.text+0x7df202>
1407e0183:     	leaq	0x77dcade(%rip), %rax   # 0x147fbcc68
1407e018a:     	movl	%ecx, %esi
1407e018c:     	movq	%rax, %rcx
1407e018f:     	movl	%edx, %ebx
1407e0191:     	callq	0x145bf6256 <.text+0x5bf5256>
1407e0196:     	movl	%esi, %ecx
1407e0198:     	movl	%ebx, %edx
1407e019a:     	movb	$0x1, %r8b
1407e019d:     	xorl	%eax, %eax
1407e019f:     	lock
1407e01a0:     	cmpxchgb	%r8b, 0x77dcac0(%rip)   # 0x147fbcc68
1407e01a8:     	je	0x1407e00ce <.text+0x7df0ce>
1407e01ae:     	leaq	0x77dcab3(%rip), %rax   # 0x147fbcc68
1407e01b5:     	movl	%ecx, %esi
1407e01b7:     	movq	%rax, %rcx
1407e01ba:     	movl	%edx, %ebx
1407e01bc:     	callq	0x145d67af0 <.text+0x5d66af0>
1407e01c1:     	movl	%esi, %ecx
1407e01c3:     	movl	%ebx, %edx
1407e01c5:     	jmp	0x1407e00ce <.text+0x7df0ce>
1407e01ca:     	movl	%edx, %ebx
1407e01cc:     	movl	%ecx, %edi
1407e01ce:     	callq	0x145d68880 <.text+0x5d67880>
1407e01d3:     	movl	%edi, %ecx
1407e01d5:     	movl	%ebx, %edx
1407e01d7:     	xorb	$0x1, %al
1407e01d9:     	movzbl	0x77dca88(%rip), %r8d   # 0x147fbcc69
1407e01e1:     	movq	0x77dcab8(%rip), %r8    # 0x147fbcca0
1407e01e8:     	testq	%r8, %r8
1407e01eb:     	jne	0x1407e00fe <.text+0x7df0fe>
1407e01f1:     	xorl	%edi, %edi
1407e01f3:     	testb	%al, %al
1407e01f5:     	jne	0x1407e0202 <.text+0x7df202>
1407e01f7:     	movq	(%rsi), %rax
1407e01fa:     	shlq	%rax
1407e01fd:     	testq	%rax, %rax
1407e0200:     	jne	0x1407e023f <.text+0x7df23f>
1407e0202:     	xorl	%eax, %eax
1407e0204:     	xchgb	%al, 0x77dca5e(%rip)    # 0x147fbcc68
1407e020a:     	cmpb	$0x2, %al
1407e020c:     	je	0x1407e022b <.text+0x7df22b>
1407e020e:     	xorps	%xmm1, %xmm1
1407e0211:     	ucomiss	%xmm1, %xmm0
1407e0214:     	seta	%al
1407e0217:     	andb	%al, %dil
1407e021a:     	movzbl	%dil, %eax
1407e021e:     	movaps	0x20(%rsp), %xmm6
1407e0223:     	addq	$0x30, %rsp
1407e0227:     	popq	%rbx
1407e0228:     	popq	%rdi
1407e0229:     	popq	%rsi
1407e022a:     	retq
1407e022b:     	leaq	0x77dca36(%rip), %rcx   # 0x147fbcc68
1407e0232:     	movaps	%xmm0, %xmm6
1407e0235:     	callq	0x145d67bb0 <.text+0x5d66bb0>
1407e023a:     	movaps	%xmm6, %xmm0
1407e023d:     	jmp	0x1407e020e <.text+0x7df20e>
1407e023f:     	movaps	%xmm0, %xmm6
1407e0242:     	callq	0x145d68880 <.text+0x5d67880>
1407e0247:     	movaps	%xmm6, %xmm0
1407e024a:     	testb	%al, %al
1407e024c:     	jne	0x1407e0202 <.text+0x7df202>
1407e024e:     	movb	$0x1, 0x77dca14(%rip)   # 0x147fbcc69
1407e0255:     	jmp	0x1407e0202 <.text+0x7df202>
1407e0257:     	int3
1407e0258:     	int3
1407e0259:     	int3
1407e025a:     	int3
1407e025b:     	int3
