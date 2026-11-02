
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458f2ee0:     	pushq	%rbp
1458f2ee1:     	pushq	%r15
1458f2ee3:     	pushq	%r14
1458f2ee5:     	pushq	%r13
1458f2ee7:     	pushq	%r12
1458f2ee9:     	pushq	%rsi
1458f2eea:     	pushq	%rdi
1458f2eeb:     	pushq	%rbx
1458f2eec:     	subq	$0x58, %rsp
1458f2ef0:     	leaq	0x50(%rsp), %rbp
1458f2ef5:     	movq	$-0x2, (%rbp)
1458f2efd:     	movq	%rcx, %rsi
1458f2f00:     	movzbl	0x195(%rdx), %eax
1458f2f07:     	cmpb	$0x2, %al
1458f2f09:     	jne	0x1458f2f59 <.text+0x58f1f59>
1458f2f0b:     	movq	0x170(%rdx), %r14
1458f2f12:     	testq	%r14, %r14
1458f2f15:     	je	0x1458f2f79 <.text+0x58f1f79>
1458f2f17:     	cmpq	$0x0, 0x18(%r14)
1458f2f1c:     	je	0x1458f2f79 <.text+0x58f1f79>
1458f2f1e:     	movq	(%r14), %rdi
1458f2f21:     	movq	0x8(%r14), %rbx
1458f2f25:     	movq	%rdi, %rcx
1458f2f28:     	movq	%rbx, %rdx
1458f2f2b:     	callq	0x1458da590 <.text+0x58d9590>
1458f2f30:     	testq	%rax, %rax
1458f2f33:     	cmoveq	%rdi, %rax
1458f2f37:     	cmoveq	%rbx, %rdx
1458f2f3b:     	movq	0x10(%r14), %r8
1458f2f3f:     	movq	0x18(%r14), %rcx
1458f2f43:     	movq	$-0x1, (%rsi)
1458f2f4a:     	movq	%rax, 0x8(%rsi)
1458f2f4e:     	movq	%rdx, 0x10(%rsi)
1458f2f52:     	xorl	%eax, %eax
1458f2f54:     	jmp	0x1458f32b9 <.text+0x58f22b9>
1458f2f59:     	cmpb	$0x3, %al
1458f2f5b:     	jne	0x1458f2fa6 <.text+0x58f1fa6>
1458f2f5d:     	cmpl	$0x1, 0x20(%rdx)
1458f2f61:     	jne	0x1458f3006 <.text+0x58f2006>
1458f2f67:     	movq	0x28(%rdx), %rcx
1458f2f6b:     	cmpq	0x7c8(%rdx), %rcx
1458f2f72:     	jb	0x1458f2fba <.text+0x58f1fba>
1458f2f74:     	jmp	0x1458f3006 <.text+0x58f2006>
1458f2f79:     	movq	$-0x1, (%rsi)
1458f2f80:     	leaq	0x1586206(%rip), %rax   # 0x146e7918d
1458f2f87:     	movq	%rax, 0x8(%rsi)
1458f2f8b:     	movq	$0x4, 0x10(%rsi)
1458f2f93:     	movl	$0x18, %ecx
1458f2f98:     	leaq	0x15861f2(%rip), %r8    # 0x146e79191
1458f2f9f:     	xorl	%eax, %eax
1458f2fa1:     	jmp	0x1458f32b9 <.text+0x58f22b9>
1458f2fa6:     	cmpq	$0x0, 0x40(%rdx)
1458f2fab:     	je	0x1458f2fef <.text+0x58f1fef>
1458f2fad:     	movq	0x48(%rdx), %rcx
1458f2fb1:     	cmpq	0x7c8(%rdx), %rcx
1458f2fb8:     	jae	0x1458f3006 <.text+0x58f2006>
1458f2fba:     	movq	0x7c0(%rdx), %r12
1458f2fc1:     	leaq	(%rcx,%rcx,4), %r13
1458f2fc5:     	movq	0x8(%r12,%r13,8), %rbx
1458f2fca:     	cmpq	$-0x1, (%r12,%r13,8)
1458f2fcf:     	movq	0x10(%r12,%r13,8), %rdi
1458f2fd4:     	je	0x1458f3052 <.text+0x58f2052>
1458f2fd6:     	testq	%rdi, %rdi
1458f2fd9:     	jns	0x1458f3063 <.text+0x58f2063>
1458f2fdf:     	xorl	%r15d, %r15d
1458f2fe2:     	movq	%r15, %rcx
1458f2fe5:     	movq	%rdi, %rdx
1458f2fe8:     	callq	0x145d6944b <.text+0x5d6844b>
1458f2fed:     	ud2
1458f2fef:     	cmpb	$0x1, %al
1458f2ff1:     	jne	0x1458f3006 <.text+0x58f2006>
1458f2ff3:     	cmpl	$0x1, 0x30(%rdx)
1458f2ff7:     	jne	0x1458f3006 <.text+0x58f2006>
1458f2ff9:     	movq	0x38(%rdx), %rcx
1458f2ffd:     	cmpq	0x7c8(%rdx), %rcx
1458f3004:     	jb	0x1458f2fba <.text+0x58f1fba>
1458f3006:     	testl	%r8d, %r8d
1458f3009:     	je	0x1458f319e <.text+0x58f219e>
1458f300f:     	movq	0x318(%rdx), %r9
1458f3016:     	movq	0xb8(%rdx), %rcx
1458f301d:     	movq	0xc0(%rdx), %r10
1458f3024:     	imulq	$0x68, 0x320(%rdx), %rdx
1458f302c:     	xorl	%r11d, %r11d
1458f302f:     	nop
1458f3030:     	cmpq	%r11, %rdx
1458f3033:     	je	0x1458f3099 <.text+0x58f2099>
1458f3035:     	movq	(%r9,%r11), %r14
1458f3039:     	cmpl	%r8d, 0x40(%r14)
1458f303d:     	je	0x1458f31d1 <.text+0x58f21d1>
1458f3043:     	addq	$0x68, %r11
1458f3047:     	cmpl	%r8d, 0x64(%r14)
1458f304b:     	jne	0x1458f3030 <.text+0x58f2030>
1458f304d:     	jmp	0x1458f31d1 <.text+0x58f21d1>
1458f3052:     	movq	%rbx, 0x8(%rsi)
1458f3056:     	movq	%rdi, 0x10(%rsi)
1458f305a:     	movq	$-0x1, (%rsi)
1458f3061:     	jmp	0x1458f30d3 <.text+0x58f20d3>
1458f3063:     	je	0x1458f30c2 <.text+0x58f20c2>
1458f3065:     	callq	0x140002200 <.text+0x1200>
1458f306a:     	movl	$0x1, %r15d
1458f3070:     	movl	$0x1, %edx
1458f3075:     	movq	%rdi, %rcx
1458f3078:     	callq	0x1400021c0 <.text+0x11c0>
1458f307d:     	testq	%rax, %rax
1458f3080:     	je	0x1458f2fe2 <.text+0x58f1fe2>
1458f3086:     	movq	%rax, %r14
1458f3089:     	movq	%rax, %rcx
1458f308c:     	movq	%rbx, %rdx
1458f308f:     	movq	%rdi, %r8
1458f3092:     	callq	0x145bc977b <.text+0x5bc877b>
1458f3097:     	jmp	0x1458f30c8 <.text+0x58f20c8>
1458f3099:     	imulq	$0x70, %r10, %rdx
1458f309d:     	xorl	%r9d, %r9d
1458f30a0:     	cmpq	%r9, %rdx
1458f30a3:     	je	0x1458f30e6 <.text+0x58f20e6>
1458f30a5:     	movq	(%rcx,%r9), %r14
1458f30a9:     	cmpl	%r8d, 0x40(%r14)
1458f30ad:     	je	0x1458f31d1 <.text+0x58f21d1>
1458f30b3:     	addq	$0x70, %r9
1458f30b7:     	cmpl	%r8d, 0x64(%r14)
1458f30bb:     	jne	0x1458f30a0 <.text+0x58f20a0>
1458f30bd:     	jmp	0x1458f31d1 <.text+0x58f21d1>
1458f30c2:     	movl	$0x1, %r14d
1458f30c8:     	movq	%rdi, (%rsi)
1458f30cb:     	movq	%r14, 0x8(%rsi)
1458f30cf:     	movq	%rdi, 0x10(%rsi)
1458f30d3:     	leaq	(%r12,%r13,8), %rax
1458f30d7:     	movq	0x18(%rax), %r8
1458f30db:     	movq	0x20(%rax), %rcx
1458f30df:     	movb	$0x1, %al
1458f30e1:     	jmp	0x1458f32b9 <.text+0x58f22b9>
1458f30e6:     	leaq	0x12b9adb(%rip), %r10   # 0x146bacbc8
1458f30ed:     	xorl	%edx, %edx
1458f30ef:     	leaq	0x12b99e2(%rip), %rcx   # 0x146bacad8
1458f30f6:     	xorl	%r9d, %r9d
1458f30f9:     	cmpl	%r8d, -0xb0(%r10)
1458f3100:     	je	0x1458f3159 <.text+0x58f2159>
1458f3102:     	movq	%r10, %r14
1458f3105:     	cmpl	%r8d, -0x8c(%r10)
1458f310c:     	je	0x1458f3161 <.text+0x58f2161>
1458f310e:     	cmpl	%r8d, -0x38(%r14)
1458f3112:     	je	0x1458f314d <.text+0x58f214d>
1458f3114:     	cmpl	%r8d, -0x14(%r14)
1458f3118:     	je	0x1458f314d <.text+0x58f214d>
1458f311a:     	cmpq	$-0x3408, %rdx          # imm = 0xCBF8
1458f3121:     	je	0x1458f316a <.text+0x58f216a>
1458f3123:     	cmpl	%r8d, 0x40(%r14)
1458f3127:     	je	0x1458f31c6 <.text+0x58f21c6>
1458f312d:     	addq	$0x168, %r9             # imm = 0x168
1458f3134:     	addq	$-0x168, %rdx           # imm = 0xFE98
1458f313b:     	leaq	0x168(%r14), %r10
1458f3142:     	cmpl	%r8d, 0x64(%r14)
1458f3146:     	jne	0x1458f30f9 <.text+0x58f20f9>
1458f3148:     	jmp	0x1458f31d1 <.text+0x58f21d1>
1458f314d:     	subq	%rdx, %rcx
1458f3150:     	addq	$0x78, %rcx
1458f3154:     	movq	%rcx, %r14
1458f3157:     	jmp	0x1458f31d1 <.text+0x58f21d1>
1458f3159:     	addq	%r9, %rcx
1458f315c:     	movq	%rcx, %r14
1458f315f:     	jmp	0x1458f31d1 <.text+0x58f21d1>
1458f3161:     	addq	$-0xf0, %r14
1458f3168:     	jmp	0x1458f31d1 <.text+0x58f21d1>
1458f316a:     	movl	$0x13, %ecx
1458f316f:     	cmpl	$0x1d3, %r8d            # imm = 0x1D3
1458f3176:     	je	0x1458f3252 <.text+0x58f2252>
1458f317c:     	cmpl	$0x3b85, %r8d           # imm = 0x3B85
1458f3183:     	jne	0x1458f319e <.text+0x58f219e>
1458f3185:     	leaq	0x1586026(%rip), %r8    # 0x146e791b2
1458f318c:     	movl	$0x9, %r9d
1458f3192:     	leaq	0x1586010(%rip), %rdx   # 0x146e791a9
1458f3199:     	jmp	0x1458f32a8 <.text+0x58f22a8>
1458f319e:     	cmpb	$0x3, %al
1458f31a0:     	jne	0x1458f326e <.text+0x58f226e>
1458f31a6:     	movb	$0x1, %al
1458f31a8:     	movl	$0x14, %ecx
1458f31ad:     	leaq	0x1586031(%rip), %r8    # 0x146e791e5
1458f31b4:     	movl	$0x7, %r9d
1458f31ba:     	leaq	0x158601d(%rip), %rdx   # 0x146e791de
1458f31c1:     	jmp	0x1458f32aa <.text+0x58f22aa>
1458f31c6:     	leaq	(%r9,%rcx), %r14
1458f31ca:     	addq	$0xf0, %r14
1458f31d1:     	movq	%r14, -0x30(%rbp)
1458f31d5:     	leaq	-0x58f111c(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1458f31dc:     	movq	%rax, -0x28(%rbp)
1458f31e0:     	leaq	0x12adb68(%rip), %rdx   # 0x146ba0d4f
1458f31e7:     	leaq	-0x20(%rbp), %rcx
1458f31eb:     	leaq	-0x30(%rbp), %r8
1458f31ef:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1458f31f4:     	movq	-0x18(%rbp), %rcx
1458f31f8:     	movq	-0x10(%rbp), %rdx
1458f31fc:     	movq	0x10(%r14), %r15
1458f3200:     	movq	0x18(%r14), %r12
1458f3204:     	movq	%rcx, -0x8(%rbp)
1458f3208:     	callq	0x1458da590 <.text+0x58d9590>
1458f320d:     	nop
1458f320e:     	movq	%rax, %rbx
1458f3211:     	movq	%rdx, %rdi
1458f3214:     	movq	-0x20(%rbp), %rdx
1458f3218:     	testq	%rdx, %rdx
1458f321b:     	je	0x1458f322c <.text+0x58f222c>
1458f321d:     	movl	$0x1, %r8d
1458f3223:     	movq	-0x8(%rbp), %rcx
1458f3227:     	callq	0x1400021d0 <.text+0x11d0>
1458f322c:     	testq	%rbx, %rbx
1458f322f:     	cmovneq	%rbx, %r15
1458f3233:     	cmoveq	%r12, %rdi
1458f3237:     	movq	0x20(%r14), %r8
1458f323b:     	movq	0x28(%r14), %rcx
1458f323f:     	movq	$-0x1, (%rsi)
1458f3246:     	movq	%r15, 0x8(%rsi)
1458f324a:     	movq	%rdi, 0x10(%rsi)
1458f324e:     	xorl	%eax, %eax
1458f3250:     	jmp	0x1458f32b9 <.text+0x58f22b9>
1458f3252:     	cmpb	$0x3, %al
1458f3254:     	jne	0x1458f326e <.text+0x58f226e>
1458f3256:     	movb	$0x1, %al
1458f3258:     	leaq	0x1585f6c(%rip), %r8    # 0x146e791cb
1458f325f:     	movl	$0x6, %r9d
1458f3265:     	leaq	0x1585f59(%rip), %rdx   # 0x146e791c5
1458f326c:     	jmp	0x1458f32aa <.text+0x58f22aa>
1458f326e:     	xorl	%eax, %eax
1458f3270:     	testl	%r8d, %r8d
1458f3273:     	leaq	0x1585f7f(%rip), %rcx   # 0x146e791f9
1458f327a:     	leaq	0x1585f89(%rip), %rdx   # 0x146e7920a
1458f3281:     	cmoveq	%rcx, %rdx
1458f3285:     	leaq	0x1585f72(%rip), %rcx   # 0x146e791fe
1458f328c:     	leaq	0x1585f7c(%rip), %r8    # 0x146e7920f
1458f3293:     	cmoveq	%rcx, %r8
1458f3297:     	setne	%al
1458f329a:     	leaq	(%rax,%rax,8), %rcx
1458f329e:     	addq	$0xc, %rcx
1458f32a2:     	movl	$0x5, %r9d
1458f32a8:     	xorl	%eax, %eax
1458f32aa:     	movq	$-0x1, (%rsi)
1458f32b1:     	movq	%rdx, 0x8(%rsi)
1458f32b5:     	movq	%r9, 0x10(%rsi)
1458f32b9:     	movq	%r8, 0x18(%rsi)
1458f32bd:     	movq	%rcx, 0x20(%rsi)
1458f32c1:     	movb	%al, 0x28(%rsi)
1458f32c4:     	addq	$0x58, %rsp
1458f32c8:     	popq	%rbx
1458f32c9:     	popq	%rdi
1458f32ca:     	popq	%rsi
1458f32cb:     	popq	%r12
1458f32cd:     	popq	%r13
1458f32cf:     	popq	%r14
1458f32d1:     	popq	%r15
1458f32d3:     	popq	%rbp
1458f32d4:     	retq
