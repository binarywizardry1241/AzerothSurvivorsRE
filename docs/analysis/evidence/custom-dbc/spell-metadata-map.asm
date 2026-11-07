1459b2e30:     	pushq	%rbp
1459b2e31:     	pushq	%r15
1459b2e33:     	pushq	%r14
1459b2e35:     	pushq	%r13
1459b2e37:     	pushq	%r12
1459b2e39:     	pushq	%rsi
1459b2e3a:     	pushq	%rdi
1459b2e3b:     	pushq	%rbx
1459b2e3c:     	subq	$0x158, %rsp            # imm = 0x158
1459b2e43:     	leaq	0x80(%rsp), %rbp
1459b2e4b:     	movdqa	%xmm6, 0xc0(%rbp)
1459b2e53:     	movq	$-0x2, 0xb8(%rbp)
1459b2e5e:     	movl	0x10(%rcx), %r14d
1459b2e62:     	movl	0x14(%rcx), %r13d
1459b2e66:     	cmpl	%r13d, %r14d
1459b2e69:     	jae	0x1459b3213 <.text+0x59b2213>
1459b2e6f:     	movq	%rdx, %r12
1459b2e72:     	movq	(%rcx), %rdi
1459b2e75:     	movq	0x8(%rcx), %rax
1459b2e79:     	movq	%rax, 0x30(%rbp)
1459b2e7d:     	addq	$0x20, %rax
1459b2e81:     	movq	%rax, 0x38(%rbp)
1459b2e85:     	leaq	0x18039c4(%rip), %rsi   # 0x1471b6850
1459b2e8c:     	leaq	0x18039dd(%rip), %rbx   # 0x1471b6870
1459b2e93:     	pcmpeqd	%xmm6, %xmm6
1459b2e97:     	movl	0x28(%rdi), %ecx
1459b2e9a:     	imull	%r14d, %ecx
1459b2e9e:     	addl	$0x10, %ecx
1459b2ea1:     	leaq	0x18(%rcx), %rdx
1459b2ea5:     	movq	0x10(%rdi), %r8
1459b2ea9:     	cmpq	%r8, %rdx
1459b2eac:     	ja	0x1459b324f <.text+0x59b224f>
1459b2eb2:     	movl	%r14d, %r15d
1459b2eb5:     	movq	0x8(%rdi), %rax
1459b2eb9:     	movl	0x14(%rax,%rcx), %eax
1459b2ebd:     	decl	%eax
1459b2ebf:     	cmpl	$0x3, %eax
1459b2ec2:     	ja	0x1459b2ee0 <.text+0x59b1ee0>
1459b2ec4:     	movl	%eax, %eax
1459b2ec6:     	movq	(%rsi,%rax,8), %rcx
1459b2eca:     	movq	%rcx, 0x90(%rbp)
1459b2ed1:     	movslq	(%rbx,%rax,4), %rax
1459b2ed5:     	addq	%rbx, %rax
1459b2ed8:     	movq	%rax, %rbx
1459b2edb:     	jmp	0x1459b2ef0 <.text+0x59b1ef0>
1459b2edd:     	nopl	(%rax)
1459b2ee0:     	movl	$0x1, %ebx
1459b2ee5:     	movq	$0x0, 0x90(%rbp)
1459b2ef0:     	leal	0x1(%r15), %r14d
1459b2ef4:     	movq	%rdi, %rcx
1459b2ef7:     	movl	%r15d, %edx
1459b2efa:     	movl	$0x78, %r8d
1459b2f00:     	callq	0x145873b10 <.text+0x5872b10>
1459b2f05:     	testq	%rdx, %rdx
1459b2f08:     	js	0x1459b322e <.text+0x59b222e>
1459b2f0e:     	movq	%rdx, %rsi
1459b2f11:     	movq	%rbx, 0x40(%rbp)
1459b2f15:     	movl	%r13d, 0xa4(%rbp)
1459b2f1c:     	je	0x1459b2f53 <.text+0x59b1f53>
1459b2f1e:     	movq	%rax, %rbx
1459b2f21:     	callq	0x140002200 <.text+0x1200>
1459b2f26:     	movl	$0x1, %edx
1459b2f2b:     	movq	%rsi, %rcx
1459b2f2e:     	callq	0x1400021c0 <.text+0x11c0>
1459b2f33:     	testq	%rax, %rax
1459b2f36:     	je	0x1459b3285 <.text+0x59b2285>
1459b2f3c:     	movq	%rax, 0xb0(%rbp)
1459b2f43:     	movq	%rax, %rcx
1459b2f46:     	movq	%rbx, %rdx
1459b2f49:     	movq	%rsi, %r8
1459b2f4c:     	callq	0x145bc977b <.text+0x5bc877b>
1459b2f51:     	jmp	0x1459b2f5f <.text+0x59b1f5f>
1459b2f53:     	movl	$0x1, %eax
1459b2f58:     	movq	%rax, 0xb0(%rbp)
1459b2f5f:     	movl	0x28(%rdi), %r13d
1459b2f63:     	imull	%r15d, %r13d
1459b2f67:     	leal	0x1d4(%r13), %edx
1459b2f6e:     	leaq	0x14(%rdx), %rcx
1459b2f72:     	addq	$0x18, %rdx
1459b2f76:     	movq	0x10(%rdi), %rbx
1459b2f7a:     	cmpq	%rbx, %rdx
1459b2f7d:     	movq	%rsi, 0xa8(%rbp)
1459b2f84:     	ja	0x1459b3261 <.text+0x59b2261>
1459b2f8a:     	movq	%r12, 0x48(%rbp)
1459b2f8e:     	movq	0x8(%rdi), %rax
1459b2f92:     	movl	(%rax,%rcx), %r12d
1459b2f96:     	movl	%r12d, -0x10(%rbp)
1459b2f9a:     	movq	0x30(%rbp), %rax
1459b2f9e:     	cmpq	$0x0, 0x18(%rax)
1459b2fa3:     	je	0x1459b3050 <.text+0x59b2050>
1459b2fa9:     	movq	0x38(%rbp), %rcx
1459b2fad:     	leaq	-0x10(%rbp), %rdx
1459b2fb1:     	movq	%rax, %rsi
1459b2fb4:     	callq	0x140d8aa00 <.text+0xd89a00>
1459b2fb9:     	movq	%rax, %r8
1459b2fbc:     	shrq	$0x39, %r8
1459b2fc0:     	movq	(%rsi), %rcx
1459b2fc3:     	movq	0x8(%rsi), %rdx
1459b2fc7:     	movd	%r8d, %xmm0
1459b2fcc:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
1459b2fd0:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
1459b2fd5:     	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
1459b2fda:     	xorl	%r8d, %r8d
1459b2fdd:     	andq	%rdx, %rax
1459b2fe0:     	movdqu	(%rcx,%rax), %xmm1
1459b2fe5:     	movdqa	%xmm1, %xmm2
1459b2fe9:     	pcmpeqb	%xmm0, %xmm2
1459b2fed:     	pmovmskb	%xmm2, %r9d
1459b2ff2:     	testl	%r9d, %r9d
1459b2ff5:     	movq	0xa8(%rbp), %rsi
1459b2ffc:     	je	0x1459b3028 <.text+0x59b2028>
1459b2ffe:     	tzcntl	%r9d, %r10d
1459b3003:     	addq	%rax, %r10
1459b3006:     	andq	%rdx, %r10
1459b3009:     	negq	%r10
1459b300c:     	leaq	(%r10,%r10,2), %r10
1459b3010:     	cmpl	-0x18(%rcx,%r10,8), %r12d
1459b3015:     	je	0x1459b31a0 <.text+0x59b21a0>
1459b301b:     	leal	-0x1(%r9), %r10d
1459b301f:     	andw	%r9w, %r10w
1459b3023:     	movl	%r10d, %r9d
1459b3026:     	jne	0x1459b2ffe <.text+0x59b1ffe>
1459b3028:     	pcmpeqb	%xmm6, %xmm1
1459b302c:     	pmovmskb	%xmm1, %r9d
1459b3031:     	testl	%r9d, %r9d
1459b3034:     	jne	0x1459b3050 <.text+0x59b2050>
1459b3036:     	addq	%r8, %rax
1459b3039:     	addq	$0x10, %rax
1459b303d:     	addq	$0x10, %r8
1459b3041:     	jmp	0x1459b2fdd <.text+0x59b1fdd>
1459b3043:     	nopw	%cs:(%rax,%rax)
1459b3050:     	movl	$0x1, %r15d
1459b3056:     	xorl	%r12d, %r12d
1459b3059:     	movq	%rsi, 0x50(%rbp)
1459b305d:     	movq	0xb0(%rbp), %rax
1459b3064:     	movq	%rax, 0x58(%rbp)
1459b3068:     	movq	%rsi, 0x60(%rbp)
1459b306c:     	movq	%r12, 0x68(%rbp)
1459b3070:     	movq	%r15, 0x70(%rbp)
1459b3074:     	movq	%r12, 0x78(%rbp)
1459b3078:     	movq	0x40(%rbp), %rax
1459b307c:     	movq	%rax, 0x80(%rbp)
1459b3083:     	movq	0x90(%rbp), %rax
1459b308a:     	movq	%rax, 0x88(%rbp)
1459b3091:     	movl	%r13d, %edx
1459b3094:     	leaq	0x14(%rdx), %rcx
1459b3098:     	addq	$0x18, %rdx
1459b309c:     	cmpq	%rbx, %rdx
1459b309f:     	ja	0x1459b3273 <.text+0x59b2273>
1459b30a5:     	movq	0x8(%rdi), %rax
1459b30a9:     	movl	(%rax,%rcx), %r8d
1459b30ad:     	movq	0x50(%rbp), %rax
1459b30b1:     	movq	0x58(%rbp), %rcx
1459b30b5:     	movq	0x60(%rbp), %rdx
1459b30b9:     	movq	0x68(%rbp), %r9
1459b30bd:     	movq	0x70(%rbp), %r10
1459b30c1:     	movq	0x78(%rbp), %r11
1459b30c5:     	movq	0x80(%rbp), %rsi
1459b30cc:     	leaq	-0x50(%rbp), %rbx
1459b30d0:     	movq	%rsi, 0x30(%rbx)
1459b30d4:     	movq	0x88(%rbp), %rsi
1459b30db:     	movq	%rsi, 0x38(%rbx)
1459b30df:     	movq	%r10, 0x20(%rbx)
1459b30e3:     	movq	%r11, 0x28(%rbx)
1459b30e7:     	movq	%rdx, 0x10(%rbx)
1459b30eb:     	movq	%r9, 0x18(%rbx)
1459b30ef:     	movq	%rax, (%rbx)
1459b30f2:     	movq	%rcx, 0x8(%rbx)
1459b30f6:     	movq	(%rbx), %rax
1459b30f9:     	movq	0x8(%rbx), %rcx
1459b30fd:     	movq	0x10(%rbx), %rdx
1459b3101:     	movq	0x18(%rbx), %r9
1459b3105:     	movq	0x20(%rbx), %r10
1459b3109:     	movq	0x28(%rbx), %r11
1459b310d:     	movdqu	0x30(%rbx), %xmm0
1459b3112:     	movdqa	%xmm0, 0x20(%rbp)
1459b3117:     	movq	%r10, 0x10(%rbp)
1459b311b:     	movq	%r11, 0x18(%rbp)
1459b311f:     	movq	%rdx, (%rbp)
1459b3123:     	movq	%r9, 0x8(%rbp)
1459b3127:     	movq	%rax, -0x10(%rbp)
1459b312b:     	movq	%rcx, -0x8(%rbp)
1459b312f:     	leaq	0x50(%rbp), %rcx
1459b3133:     	movq	0x48(%rbp), %r12
1459b3137:     	movq	%r12, %rdx
1459b313a:     	leaq	-0x10(%rbp), %r9
1459b313e:     	callq	0x1458ba640 <.text+0x58b9640>
1459b3143:     	movq	0x50(%rbp), %rdx
1459b3147:     	cmpq	$-0x1, %rdx
1459b314b:     	movl	0xa4(%rbp), %r13d
1459b3152:     	leaq	0x18036f7(%rip), %rsi   # 0x1471b6850
1459b3159:     	leaq	0x1803710(%rip), %rbx   # 0x1471b6870
1459b3160:     	je	0x1459b318e <.text+0x59b218e>
1459b3162:     	testq	%rdx, %rdx
1459b3165:     	je	0x1459b3176 <.text+0x59b2176>
1459b3167:     	movq	0x58(%rbp), %rcx
1459b316b:     	movl	$0x1, %r8d
1459b3171:     	callq	0x1400021d0 <.text+0x11d0>
1459b3176:     	movq	0x68(%rbp), %rdx
1459b317a:     	testq	%rdx, %rdx
1459b317d:     	je	0x1459b318e <.text+0x59b218e>
1459b317f:     	movq	0x70(%rbp), %rcx
1459b3183:     	movl	$0x1, %r8d
1459b3189:     	callq	0x1400021d0 <.text+0x11d0>
1459b318e:     	movq	%r15, 0x98(%rbp)
1459b3195:     	cmpl	%r13d, %r14d
1459b3198:     	jne	0x1459b2e97 <.text+0x59b1e97>
1459b319e:     	jmp	0x1459b3213 <.text+0x59b2213>
1459b31a0:     	leaq	(%rcx,%r10,8), %rax
1459b31a4:     	movq	-0x8(%rax), %r12
1459b31a8:     	testq	%r12, %r12
1459b31ab:     	js	0x1459b323e <.text+0x59b223e>
1459b31b1:     	je	0x1459b31fe <.text+0x59b21fe>
1459b31b3:     	movq	-0x10(%rax), %rbx
1459b31b7:     	callq	0x140002200 <.text+0x1200>
1459b31bc:     	movl	$0x1, %edx
1459b31c1:     	movq	%r12, %rcx
1459b31c4:     	callq	0x1400021c0 <.text+0x11c0>
1459b31c9:     	testq	%rax, %rax
1459b31cc:     	je	0x1459b329f <.text+0x59b229f>
1459b31d2:     	movq	%rax, %rsi
1459b31d5:     	movq	%rax, %rcx
1459b31d8:     	movq	%rbx, %rdx
1459b31db:     	movq	%r12, %r8
1459b31de:     	callq	0x145bc977b <.text+0x5bc877b>
1459b31e3:     	movq	0x10(%rdi), %rbx
1459b31e7:     	imull	0x28(%rdi), %r15d
1459b31ec:     	movl	%r15d, %r13d
1459b31ef:     	movq	%rsi, %r15
1459b31f2:     	movq	0xa8(%rbp), %rsi
1459b31f9:     	jmp	0x1459b3059 <.text+0x59b2059>
1459b31fe:     	movl	$0x1, %r15d
1459b3204:     	xorl	%r12d, %r12d
1459b3207:     	movq	0xa8(%rbp), %rsi
1459b320e:     	jmp	0x1459b3059 <.text+0x59b2059>
1459b3213:     	movaps	0xc0(%rbp), %xmm6
1459b321a:     	addq	$0x158, %rsp            # imm = 0x158
1459b3221:     	popq	%rbx
1459b3222:     	popq	%rdi
1459b3223:     	popq	%rsi
1459b3224:     	popq	%r12
1459b3226:     	popq	%r13
1459b3228:     	popq	%r14
1459b322a:     	popq	%r15
1459b322c:     	popq	%rbp
1459b322d:     	retq
1459b322e:     	xorl	%ecx, %ecx
1459b3230:     	movq	0xb0(%rbp), %rdx
1459b3237:     	callq	0x145d6944b <.text+0x5d6844b>
1459b323c:     	ud2
1459b323e:     	xorl	%ecx, %ecx
1459b3240:     	movq	0x98(%rbp), %rdx
1459b3247:     	callq	0x145d6944b <.text+0x5d6844b>
1459b324c:     	nop
1459b324d:     	jmp	0x1459b3283 <.text+0x59b2283>
1459b324f:     	addq	$0x14, %rcx
1459b3253:     	leaq	0x11eda8e(%rip), %r9    # 0x146ba0ce8
1459b325a:     	callq	0x145d699f0 <.text+0x5d689f0>
1459b325f:     	ud2
1459b3261:     	leaq	0x11eda80(%rip), %r9    # 0x146ba0ce8
1459b3268:     	movq	%rbx, %r8
1459b326b:     	callq	0x145d699f0 <.text+0x5d689f0>
1459b3270:     	nop
1459b3271:     	jmp	0x1459b3283 <.text+0x59b2283>
1459b3273:     	leaq	0x11eda6e(%rip), %r9    # 0x146ba0ce8
1459b327a:     	movq	%rbx, %r8
1459b327d:     	callq	0x145d699f0 <.text+0x5d689f0>
1459b3282:     	nop
1459b3283:     	ud2
1459b3285:     	movq	%rsi, 0xb0(%rbp)
1459b328c:     	movl	$0x1, %ecx
1459b3291:     	movq	0xb0(%rbp), %rdx
1459b3298:     	callq	0x145d6944b <.text+0x5d6844b>
1459b329d:     	ud2
1459b329f:     	movq	%r12, 0x98(%rbp)
1459b32a6:     	movl	$0x1, %ecx
1459b32ab:     	jmp	0x1459b3240 <.text+0x59b2240>
