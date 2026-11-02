
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140abbd60:     	pushq	%r14
140abbd62:     	pushq	%rsi
140abbd63:     	pushq	%rdi
140abbd64:     	pushq	%rbp
140abbd65:     	pushq	%rbx
140abbd66:     	subq	$0xf0, %rsp
140abbd6d:     	movaps	%xmm7, 0xe0(%rsp)
140abbd75:     	movaps	%xmm6, 0xd0(%rsp)
140abbd7d:     	movapd	%xmm2, %xmm6
140abbd81:     	movq	%rdx, %rdi
140abbd84:     	movq	%rcx, %rsi
140abbd87:     	movq	(%rdx), %rcx
140abbd8a:     	addq	$0x10, %rcx
140abbd8e:     	callq	0x141510d30 <.text+0x150fd30>
140abbd93:     	movl	%eax, %ebx
140abbd95:     	movq	(%rdi), %rcx
140abbd98:     	addq	$0x10, %rcx
140abbd9c:     	callq	0x141510d60 <.text+0x150fd60>
140abbda1:     	movapd	%xmm0, %xmm7
140abbda5:     	callq	0x145b73920 <.text+0x5b72920>
140abbdaa:     	movq	%rax, 0x68(%rsp)
140abbdaf:     	movl	%edx, 0x70(%rsp)
140abbdb3:     	testb	%bl, %bl
140abbdb5:     	je	0x140abbdc3 <.text+0xabadc3>
140abbdb7:     	movzbl	%bl, %ecx
140abbdba:     	cmpl	$0x5, %ecx
140abbdbd:     	jne	0x140abbedb <.text+0xabaedb>
140abbdc3:     	movzbl	(%rsi), %ecx
140abbdc6:     	testl	%ecx, %ecx
140abbdc8:     	je	0x140abbee0 <.text+0xabaee0>
140abbdce:     	cmpl	$0x1, %ecx
140abbdd1:     	jne	0x140abbef3 <.text+0xabaef3>
140abbdd7:     	movq	%rax, %rbx
140abbdda:     	movl	%edx, %edi
140abbddc:     	movq	0x10(%rsi), %rdx
140abbde0:     	movl	0x18(%rsi), %r8d
140abbde4:     	movzbl	0x1(%rsi), %ebp
140abbde8:     	movsd	0x8(%rsi), %xmm6
140abbded:     	leaq	0x68(%rsp), %rcx
140abbdf2:     	callq	0x145b73770 <.text+0x5b72770>
140abbdf7:     	ucomisd	%xmm6, %xmm7
140abbdfb:     	movq	%rax, %xmm0
140abbe00:     	punpckldq	0x52b8268(%rip), %xmm0 # xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
                                                # 0x145d74070
140abbe08:     	subpd	0x52b8270(%rip), %xmm0  # 0x145d74080
140abbe10:     	movapd	%xmm0, %xmm1
140abbe14:     	unpckhpd	%xmm0, %xmm1            # xmm1 = xmm1[1],xmm0[1]
140abbe18:     	xorps	%xmm6, %xmm6
140abbe1b:     	cvtsi2sd	%edx, %xmm6
140abbe1f:     	addsd	%xmm0, %xmm1
140abbe23:     	divsd	0x52b8265(%rip), %xmm6  # 0x145d74090
140abbe2b:     	addsd	%xmm1, %xmm6
140abbe2f:     	jbe	0x140abbf3a <.text+0xabaf3a>
140abbe35:     	movb	$0x2, (%rsi)
140abbe38:     	movsd	%xmm7, 0x8(%rsi)
140abbe3d:     	movq	%rbx, 0x10(%rsi)
140abbe41:     	movl	%edi, 0x18(%rsi)
140abbe44:     	xorpd	%xmm0, %xmm0
140abbe48:     	movupd	%xmm0, 0x30(%rsi)
140abbe4d:     	movq	0x753b154(%rip), %rax   # 0x147ff6fa8
140abbe54:     	movq	(%rax), %rax
140abbe57:     	cmpq	$0x2, %rax
140abbe5b:     	jae	0x140abbf1c <.text+0xabaf1c>
140abbe61:     	movzbl	0x75022c8(%rip), %edx   # 0x147fbe130
140abbe68:     	movzbl	%dl, %eax
140abbe6b:     	leal	-0x1(%rax), %ecx
140abbe6e:     	cmpl	$0x2, %ecx
140abbe71:     	jae	0x140abc219 <.text+0xabb219>
140abbe77:     	movq	0x75022a2(%rip), %rcx   # 0x147fbe120
140abbe7e:     	callq	0x144c46ce0 <.text+0x4c45ce0>
140abbe83:     	testb	%al, %al
140abbe85:     	je	0x140abbf1c <.text+0xabaf1c>
140abbe8b:     	movq	0x750228e(%rip), %rcx   # 0x147fbe120
140abbe92:     	leaq	0x30(%rcx), %rax
140abbe96:     	addq	$0x20, %rsi
140abbe9a:     	mulsd	0x52e1f1e(%rip), %xmm6  # 0x145d9ddc0
140abbea2:     	movsd	%xmm6, 0x20(%rsp)
140abbea8:     	movq	%rsi, 0x48(%rsp)
140abbead:     	leaq	-0xab9df4(%rip), %rdx   # 0x1400020c0 <.text+0x10c0>
140abbeb4:     	movq	%rdx, 0x50(%rsp)
140abbeb9:     	leaq	0x20(%rsp), %rdx
140abbebe:     	movq	%rdx, 0x58(%rsp)
140abbec3:     	leaq	0x50f1c46(%rip), %rdx   # 0x145badb10 <.text+0x5bacb10>
140abbeca:     	movq	%rdx, 0x60(%rsp)
140abbecf:     	leaq	0x54973be(%rip), %rdx   # 0x145f53294
140abbed6:     	jmp	0x140abbfc7 <.text+0xabafc7>
140abbedb:     	movb	$0x0, (%rsi)
140abbede:     	jmp	0x140abbf13 <.text+0xabaf13>
140abbee0:     	movw	$0x1, (%rsi)
140abbee5:     	movsd	%xmm7, 0x8(%rsi)
140abbeea:     	movq	%rax, 0x10(%rsi)
140abbeee:     	movl	%edx, 0x18(%rsi)
140abbef1:     	jmp	0x140abbf1c <.text+0xabaf1c>
140abbef3:     	movsd	0x8(%rsi), %xmm0
140abbef8:     	ucomisd	%xmm7, %xmm0
140abbefc:     	jbe	0x140abc01f <.text+0xabb01f>
140abbf02:     	movw	$0x1, (%rsi)
140abbf07:     	movsd	%xmm7, 0x8(%rsi)
140abbf0c:     	movq	%rax, 0x10(%rsi)
140abbf10:     	movl	%edx, 0x18(%rsi)
140abbf13:     	xorpd	%xmm0, %xmm0
140abbf17:     	movupd	%xmm0, 0x30(%rsi)
140abbf1c:     	movaps	0xd0(%rsp), %xmm6
140abbf24:     	movaps	0xe0(%rsp), %xmm7
140abbf2c:     	addq	$0xf0, %rsp
140abbf33:     	popq	%rbx
140abbf34:     	popq	%rbp
140abbf35:     	popq	%rdi
140abbf36:     	popq	%rsi
140abbf37:     	popq	%r14
140abbf39:     	retq
140abbf3a:     	testb	%bpl, %bpl
140abbf3d:     	jne	0x140abbf1c <.text+0xabaf1c>
140abbf3f:     	ucomisd	0x5492c01(%rip), %xmm6  # 0x145f4eb48
140abbf47:     	jbe	0x140abbf1c <.text+0xabaf1c>
140abbf49:     	movw	$0x101, (%rsi)          # imm = 0x101
140abbf4e:     	movsd	%xmm6, 0x20(%rsp)
140abbf54:     	movq	0x753b04d(%rip), %rax   # 0x147ff6fa8
140abbf5b:     	movq	(%rax), %rax
140abbf5e:     	cmpq	$0x4, %rax
140abbf62:     	jae	0x140abbf1c <.text+0xabaf1c>
140abbf64:     	movzbl	0x75021dd(%rip), %edx   # 0x147fbe148
140abbf6b:     	movzbl	%dl, %eax
140abbf6e:     	leal	-0x1(%rax), %ecx
140abbf71:     	cmpl	$0x2, %ecx
140abbf74:     	jae	0x140abc23c <.text+0xabb23c>
140abbf7a:     	movq	0x75021b7(%rip), %rcx   # 0x147fbe138
140abbf81:     	callq	0x144c46ce0 <.text+0x4c45ce0>
140abbf86:     	testb	%al, %al
140abbf88:     	je	0x140abbf1c <.text+0xabaf1c>
140abbf8a:     	movq	0x75021a7(%rip), %rcx   # 0x147fbe138
140abbf91:     	leaq	0x30(%rcx), %rax
140abbf95:     	addq	$0x20, %rsi
140abbf99:     	movq	%rsi, 0x48(%rsp)
140abbf9e:     	leaq	-0xab9ee5(%rip), %rdx   # 0x1400020c0 <.text+0x10c0>
140abbfa5:     	movq	%rdx, 0x50(%rsp)
140abbfaa:     	leaq	0x20(%rsp), %rdx
140abbfaf:     	movq	%rdx, 0x58(%rsp)
140abbfb4:     	leaq	0x50f1b55(%rip), %rdx   # 0x145badb10 <.text+0x5bacb10>
140abbfbb:     	movq	%rdx, 0x60(%rsp)
140abbfc0:     	leaq	0x5497259(%rip), %rdx   # 0x145f53220
140abbfc7:     	movq	%rdx, 0x38(%rsp)
140abbfcc:     	leaq	0x48(%rsp), %rdx
140abbfd1:     	movq	%rdx, 0x40(%rsp)
140abbfd6:     	leaq	0x38(%rsp), %rdx
140abbfdb:     	movq	%rdx, 0x28(%rsp)
140abbfe0:     	leaq	0x5495b39(%rip), %rdx   # 0x145f51b20
140abbfe7:     	movq	%rdx, 0x30(%rsp)
140abbfec:     	movq	$0x1, 0x68(%rsp)
140abbff5:     	leaq	0x28(%rsp), %rdx
140abbffa:     	movq	%rdx, 0x70(%rsp)
140abbfff:     	movq	$0x1, 0x78(%rsp)
140abc008:     	movq	%rax, 0x80(%rsp)
140abc010:     	leaq	0x68(%rsp), %rdx
140abc015:     	callq	0x144c48500 <.text+0x4c47500>
140abc01a:     	jmp	0x140abbf1c <.text+0xabaf1c>
140abc01f:     	movq	0x10(%rsi), %r9
140abc023:     	movl	0x18(%rsi), %r8d
140abc027:     	movapd	%xmm7, %xmm1
140abc02b:     	subsd	%xmm0, %xmm1
140abc02f:     	movupd	0x30(%rsi), %xmm0
140abc034:     	unpcklpd	%xmm1, %xmm6            # xmm6 = xmm6[0],xmm1[0]
140abc038:     	addpd	%xmm0, %xmm6
140abc03c:     	movupd	%xmm6, 0x30(%rsi)
140abc041:     	movb	$0x2, (%rsi)
140abc044:     	movsd	%xmm7, 0x8(%rsi)
140abc049:     	movsd	0x52e1d5f(%rip), %xmm0  # 0x145d9ddb0
140abc051:     	ucomisd	%xmm6, %xmm0
140abc055:     	ja	0x140abbf1c <.text+0xabaf1c>
140abc05b:     	leaq	0x30(%rsi), %rbx
140abc05f:     	leaq	0x68(%rsp), %rdi
140abc064:     	movq	%rdi, %rcx
140abc067:     	movl	%edx, %ebp
140abc069:     	movq	%r9, %rdx
140abc06c:     	movq	%rax, %r14
140abc06f:     	callq	0x145b73770 <.text+0x5b72770>
140abc074:     	movb	$0x2, (%rsi)
140abc077:     	movsd	%xmm7, 0x8(%rsi)
140abc07c:     	movapd	%xmm6, %xmm0
140abc080:     	unpckhpd	%xmm6, %xmm0            # xmm0 = xmm0[1],xmm6[1]
140abc084:     	movapd	%xmm6, %xmm7
140abc088:     	subsd	%xmm0, %xmm7
140abc08c:     	ucomisd	0x5492aac(%rip), %xmm7  # 0x145f4eb40
140abc094:     	movq	%r14, 0x10(%rsi)
140abc098:     	movl	%ebp, 0x18(%rsi)
140abc09b:     	xorpd	%xmm1, %xmm1
140abc09f:     	movupd	%xmm1, (%rbx)
140abc0a3:     	jbe	0x140abbf1c <.text+0xabaf1c>
140abc0a9:     	movq	%rax, %xmm1
140abc0ae:     	punpckldq	0x52b7fba(%rip), %xmm1 # xmm1 = xmm1[0],mem[0],xmm1[1],mem[1]
                                                # 0x145d74070
140abc0b6:     	subpd	0x52b7fc2(%rip), %xmm1  # 0x145d74080
140abc0be:     	movapd	%xmm1, %xmm2
140abc0c2:     	unpckhpd	%xmm1, %xmm2            # xmm2 = xmm2[1],xmm1[1]
140abc0c6:     	cvtsi2sd	%edx, %xmm3
140abc0ca:     	divsd	0x52b7fbe(%rip), %xmm3  # 0x145d74090
140abc0d2:     	addsd	%xmm1, %xmm2
140abc0d6:     	addsd	%xmm2, %xmm3
140abc0da:     	movsd	%xmm6, 0xb8(%rsp)
140abc0e3:     	movsd	%xmm0, 0xc0(%rsp)
140abc0ec:     	movsd	%xmm3, 0xc8(%rsp)
140abc0f5:     	movq	0x753aeac(%rip), %rax   # 0x147ff6fa8
140abc0fc:     	movq	(%rax), %rax
140abc0ff:     	cmpq	$0x4, %rax
140abc103:     	jae	0x140abbf1c <.text+0xabaf1c>
140abc109:     	movzbl	0x7502008(%rip), %edx   # 0x147fbe118
140abc110:     	movzbl	%dl, %eax
140abc113:     	leal	-0x1(%rax), %ecx
140abc116:     	cmpl	$0x2, %ecx
140abc119:     	jae	0x140abc25f <.text+0xabb25f>
140abc11f:     	movq	0x7501fe2(%rip), %rcx   # 0x147fbe108
140abc126:     	callq	0x144c46ce0 <.text+0x4c45ce0>
140abc12b:     	testb	%al, %al
140abc12d:     	je	0x140abbf1c <.text+0xabaf1c>
140abc133:     	movq	0x7501fce(%rip), %rcx   # 0x147fbe108
140abc13a:     	leaq	0x30(%rcx), %rax
140abc13e:     	addq	$0x20, %rsi
140abc142:     	mulsd	0x52e1c76(%rip), %xmm7  # 0x145d9ddc0
140abc14a:     	movsd	%xmm7, 0x20(%rsp)
140abc150:     	movq	%rsi, 0x68(%rsp)
140abc155:     	leaq	-0xaba09c(%rip), %rdx   # 0x1400020c0 <.text+0x10c0>
140abc15c:     	movq	%rdx, 0x70(%rsp)
140abc161:     	leaq	0x20(%rsp), %rdx
140abc166:     	movq	%rdx, 0x78(%rsp)
140abc16b:     	leaq	0x50f199e(%rip), %rdx   # 0x145badb10 <.text+0x5bacb10>
140abc172:     	movq	%rdx, 0x80(%rsp)
140abc17a:     	leaq	0xc8(%rsp), %r8
140abc182:     	movq	%r8, 0x88(%rsp)
140abc18a:     	movq	%rdx, 0x90(%rsp)
140abc192:     	leaq	0xb8(%rsp), %r8
140abc19a:     	movq	%r8, 0x98(%rsp)
140abc1a2:     	movq	%rdx, 0xa0(%rsp)
140abc1aa:     	leaq	0xc0(%rsp), %r8
140abc1b2:     	movq	%r8, 0xa8(%rsp)
140abc1ba:     	movq	%rdx, 0xb0(%rsp)
140abc1c2:     	leaq	0x5496fa7(%rip), %rdx   # 0x145f53170
140abc1c9:     	movq	%rdx, 0x38(%rsp)
140abc1ce:     	movq	%rdi, 0x40(%rsp)
140abc1d3:     	leaq	0x38(%rsp), %rdx
140abc1d8:     	movq	%rdx, 0x28(%rsp)
140abc1dd:     	leaq	0x549593c(%rip), %rdx   # 0x145f51b20
140abc1e4:     	movq	%rdx, 0x30(%rsp)
140abc1e9:     	movq	$0x1, 0x48(%rsp)
140abc1f2:     	leaq	0x28(%rsp), %rdx
140abc1f7:     	movq	%rdx, 0x50(%rsp)
140abc1fc:     	movq	$0x1, 0x58(%rsp)
140abc205:     	movq	%rax, 0x60(%rsp)
140abc20a:     	leaq	0x48(%rsp), %rdx
140abc20f:     	callq	0x144c48500 <.text+0x4c47500>
140abc214:     	jmp	0x140abbf1c <.text+0xabaf1c>
140abc219:     	testl	%eax, %eax
140abc21b:     	je	0x140abbf1c <.text+0xabaf1c>
140abc221:     	leaq	0x7501ef8(%rip), %rcx   # 0x147fbe120
140abc228:     	callq	0x145d15470 <.text+0x5d14470>
140abc22d:     	movl	%eax, %edx
140abc22f:     	testb	%al, %al
140abc231:     	jne	0x140abbe77 <.text+0xabae77>
140abc237:     	jmp	0x140abbf1c <.text+0xabaf1c>
140abc23c:     	testl	%eax, %eax
140abc23e:     	je	0x140abbf1c <.text+0xabaf1c>
140abc244:     	leaq	0x7501eed(%rip), %rcx   # 0x147fbe138
140abc24b:     	callq	0x145d15470 <.text+0x5d14470>
140abc250:     	movl	%eax, %edx
140abc252:     	testb	%al, %al
140abc254:     	jne	0x140abbf7a <.text+0xabaf7a>
140abc25a:     	jmp	0x140abbf1c <.text+0xabaf1c>
140abc25f:     	testl	%eax, %eax
140abc261:     	je	0x140abbf1c <.text+0xabaf1c>
140abc267:     	leaq	0x7501e9a(%rip), %rcx   # 0x147fbe108
140abc26e:     	callq	0x145d15470 <.text+0x5d14470>
140abc273:     	movl	%eax, %edx
140abc275:     	testb	%al, %al
140abc277:     	jne	0x140abc11f <.text+0xabb11f>
140abc27d:     	jmp	0x140abbf1c <.text+0xabaf1c>
