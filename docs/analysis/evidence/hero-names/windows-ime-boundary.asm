// message-dispatch
1426872c3:     	movq	%rcx, %rsi
1426872c6:     	movq	(%rcx), %rbx
1426872c9:     	movl	(%rbx), %edi
1426872cb:     	cmpl	$0x1ff, %edi            # imm = 0x1FF
1426872d1:     	jg	0x14268731a <.text+0x268631a>
1426872d3:     	leal	-0x2(%rdi), %eax
1426872d6:     	cmpl	$0x84, %eax
1426872db:     	ja	0x1426874ae <.text+0x26864ae>
1426872e1:     	leaq	0x4018e64(%rip), %rcx   # 0x1466a014c
1426872e8:     	movslq	(%rcx,%rax,4), %rax
1426872ec:     	addq	%rcx, %rax
1426872ef:     	jmpq	*%rax
// dispatch-200
14268731a:     	leal	-0x200(%rdi), %eax
142687320:     	cmpl	$0xa3, %eax
142687325:     	ja	0x142687785 <.text+0x2686785>
14268732b:     	leaq	0x40190b2(%rip), %rcx   # 0x1466a03e4
142687332:     	movslq	(%rcx,%rax,4), %rax
142687336:     	addq	%rcx, %rax
142687339:     	jmpq	*%rax
// dispatch-100
1426874ae:     	leal	-0x100(%rdi), %eax
1426874b4:     	cmpl	$0x20, %eax
1426874b7:     	ja	0x14268781d <.text+0x268681d>
1426874bd:     	leaq	0x4018e9c(%rip), %rcx   # 0x1466a0360
1426874c4:     	movslq	(%rcx,%rax,4), %rax
1426874c8:     	addq	%rcx, %rax
1426874cb:     	jmpq	*%rax
// setcontext-mask-call
14268824e:     	movq	0x20(%rsi), %rax
142688252:     	movabsq	$-0x80000001, %r9       # imm = 0xFFFFFFFF7FFFFFFF
14268825c:     	andq	(%rax), %r9
14268825f:     	movq	0x10(%rsi), %rax
142688263:     	movq	0x28(%rsi), %rcx
142688267:     	movq	(%rcx), %rcx
14268826a:     	movq	(%rax), %r8
14268826d:     	movl	$0x281, %edx            # imm = 0x281
142688272:     	callq	*0x3b82aa0(%rip)        # 0x14620ad18
142688278:     	movq	0x18(%rsi), %rcx
14268827c:     	movq	$0x1, (%rcx)
142688283:     	jmp	0x142689d88 <.text+0x2688d88>
// composition-enabled-preedit-result
142688e97:     	movq	0x8(%rsi), %rdi
142688e9b:     	movq	0x10(%rdi), %r14
142688e9f:     	leaq	0x10(%r14), %rcx
142688ea3:     	movb	$0x1, %dl
142688ea5:     	xorl	%eax, %eax
142688ea7:     	lock
142688ea8:     	cmpxchgb	%dl, 0x10(%r14)
142688ead:     	jne	0x14268b2ac <.text+0x268a2ac>
142688eb3:     	movq	0x5fd5cae(%rip), %rax   # 0x14865eb68
142688eba:     	movq	(%rax), %rax
142688ebd:     	shlq	%rax
142688ec0:     	testq	%rax, %rax
142688ec3:     	jne	0x14268b2bc <.text+0x268a2bc>
142688ec9:     	xorl	%edx, %edx
142688ecb:     	movzbl	0x11(%r14), %eax
142688ed0:     	testb	%al, %al
142688ed2:     	jne	0x14268b2d9 <.text+0x268a2d9>
142688ed8:     	cmpb	$0x0, 0x109(%r14)
142688ee0:     	je	0x14268962b <.text+0x268862b>
142688ee6:     	movzbl	0x110(%r14), %ebx
142688eee:     	callq	0x140004c20 <.text+0x3c20>
142688ef3:     	testb	%bl, %bl
142688ef5:     	je	0x14268948c <.text+0x268848c>
142688efb:     	movq	0x28(%rsi), %rbx
142688eff:     	movq	(%rbx), %r14
142688f02:     	movq	%r14, %rcx
142688f05:     	callq	*0x3b81785(%rip)        # 0x14620a690
142688f0b:     	movq	%r14, 0x168(%rbp)
142688f12:     	movq	%r14, 0xb0(%rbp)
142688f19:     	movq	%rax, 0x178(%rbp)
142688f20:     	movq	%rax, 0xb8(%rbp)
142688f27:     	movq	0x20(%rsi), %r14
142688f2b:     	movq	(%r14), %rax
142688f2e:     	testq	%rax, %rax
142688f31:     	jne	0x142688f8a <.text+0x2687f8a>
142688f33:     	movq	(%rbx), %rax
142688f36:     	movq	%rax, 0x158(%rbp)
142688f3d:     	movw	$0xf, 0xd0(%rbp)
142688f46:     	movq	$0x0, 0xd8(%rbp)
142688f51:     	movq	$0x0, 0xf0(%rbp)
142688f5c:     	movq	$0x1, 0xf8(%rbp)
142688f67:     	movq	$0x0, 0x100(%rbp)
142688f72:     	movq	0x18(%rdi), %rcx
142688f76:     	addq	$0x10, %rcx
142688f7a:     	leaq	0xd0(%rbp), %rdx
142688f81:     	callq	0x14268dac0 <.text+0x268cac0>
142688f86:     	nop
142688f87:     	movq	(%r14), %rax
142688f8a:     	testl	$0x800, %eax            # imm = 0x800
142688f8f:     	je	0x1426890a6 <.text+0x26880a6>
142688f95:     	leaq	-0x30(%rbp), %rcx
142688f99:     	movq	0x178(%rbp), %rdx
142688fa0:     	movl	$0x800, %r8d            # imm = 0x800
142688fa6:     	callq	0x142681950 <.text+0x2680950>
142688fab:     	nop
142688fac:     	movq	-0x30(%rbp), %rax
142688fb0:     	cmpq	$-0x1, %rax
142688fb4:     	je	0x1426890a3 <.text+0x26880a3>
142688fba:     	movq	%rax, 0xc8(%rbp)
142688fc1:     	movq	-0x28(%rbp), %rax
142688fc5:     	movq	%rax, 0xc0(%rbp)
142688fcc:     	movb	$0x1, 0x167(%rbp)
142688fd3:     	movq	%rdi, %rcx
142688fd6:     	callq	0x142674640 <.text+0x2673640>
142688fdb:     	nop
142688fdc:     	andb	$0x1, %dl
142688fdf:     	movb	$0x1, 0x100(%rax)
142688fe6:     	movb	$0x1, 0x167(%rbp)
142688fed:     	movq	%rax, %rcx
142688ff0:     	callq	0x140004c20 <.text+0x3c20>
142688ff5:     	nop
142688ff6:     	movq	(%rbx), %rax
142688ff9:     	movq	%rax, 0x158(%rbp)
142689000:     	movw	$0xf, 0xd0(%rbp)
142689009:     	movq	$0x0, 0xd8(%rbp)
142689014:     	movq	$0x0, 0xf0(%rbp)
14268901f:     	movq	$0x1, 0xf8(%rbp)
14268902a:     	movq	$0x0, 0x100(%rbp)
142689035:     	movq	0x18(%rdi), %rcx
142689039:     	addq	$0x10, %rcx
14268903d:     	movb	$0x1, 0x167(%rbp)
142689044:     	leaq	0xd0(%rbp), %rdx
14268904b:     	callq	0x14268dac0 <.text+0x268cac0>
142689050:     	nop
142689051:     	movq	(%rbx), %rax
142689054:     	movq	-0x20(%rbp), %rcx
142689058:     	movq	%rcx, 0xf0(%rbp)
14268905f:     	movupd	-0x30(%rbp), %xmm0
142689064:     	movupd	%xmm0, 0xe0(%rbp)
14268906c:     	movq	%rax, 0x158(%rbp)
142689073:     	movw	$0xf, 0xd0(%rbp)
14268907c:     	movq	$0x4, 0xd8(%rbp)
142689087:     	movq	0x18(%rdi), %rcx
14268908b:     	addq	$0x10, %rcx
14268908f:     	movb	$0x0, 0x167(%rbp)
142689096:     	leaq	0xd0(%rbp), %rdx
14268909d:     	callq	0x14268dac0 <.text+0x268cac0>
1426890a2:     	nop
1426890a3:     	movq	(%r14), %rax
1426890a6:     	testb	$0x8, %al
1426890a8:     	je	0x142689180 <.text+0x2688180>
1426890ae:     	leaq	-0x30(%rbp), %rcx
1426890b2:     	leaq	0xb0(%rbp), %rdx
1426890b9:     	callq	0x142681ac0 <.text+0x2680ac0>
1426890be:     	nop
1426890bf:     	movq	-0x30(%rbp), %r14
1426890c3:     	cmpq	$0x2, %r14
1426890c7:     	je	0x142689180 <.text+0x2688180>
1426890cd:     	movq	-0x28(%rbp), %r15
1426890d1:     	movq	-0x20(%rbp), %rax
1426890d5:     	movq	%rax, 0xc8(%rbp)
1426890dc:     	movq	-0x18(%rbp), %rax
1426890e0:     	movq	%rax, 0xc0(%rbp)
1426890e7:     	movq	-0x8(%rbp), %r13
1426890eb:     	movq	(%rbp), %r12
1426890ef:     	movb	$0x1, 0x166(%rbp)
1426890f6:     	movq	%rdi, %rcx
1426890f9:     	callq	0x142674640 <.text+0x2673640>
1426890fe:     	nop
1426890ff:     	andb	$0x1, %dl
142689102:     	movb	$0x2, 0x100(%rax)
142689109:     	movb	$0x1, 0x166(%rbp)
142689110:     	movq	%rax, %rcx
142689113:     	callq	0x140004c20 <.text+0x3c20>
142689118:     	nop
142689119:     	leaq	-0x20(%rbp), %rax
14268911d:     	testb	$0x1, %r13b
142689121:     	cmoveq	%r15, %r12
142689125:     	movq	(%rbx), %rcx
142689128:     	movq	0x10(%rax), %rdx
14268912c:     	movq	%rdx, 0x100(%rbp)
142689133:     	movupd	(%rax), %xmm0
142689137:     	movupd	%xmm0, 0xf0(%rbp)
14268913f:     	movq	%rcx, 0x158(%rbp)
142689146:     	movw	$0xf, 0xd0(%rbp)
14268914f:     	movq	%r14, 0xd8(%rbp)
142689156:     	movq	%r15, 0xe0(%rbp)
14268915d:     	movq	%r12, 0xe8(%rbp)
142689164:     	movq	0x18(%rdi), %rcx
142689168:     	addq	$0x10, %rcx
14268916c:     	movb	$0x0, 0x166(%rbp)
142689173:     	leaq	0xd0(%rbp), %rdx
14268917a:     	callq	0x14268dac0 <.text+0x268cac0>
14268917f:     	nop
142689180:     	movq	0x168(%rbp), %rcx
142689187:     	movq	0x178(%rbp), %rdx
14268918e:     	callq	*0x3b814ec(%rip)        # 0x14620a680
142689194:     	jmp	0x14268948c <.text+0x268848c>
// composition-disabled
14268962b:     	callq	0x140004c20 <.text+0x3c20>
142689630:     	jmp	0x14268948c <.text+0x268848c>
// handled-zero
14268948c:     	movq	0x18(%rsi), %rax
142689490:     	movq	$0x1, (%rax)
142689497:     	movq	$0x0, 0x8(%rax)
14268949f:     	jmp	0x142689d8c <.text+0x2688d8c>
// result-store
142689d81:     	movq	$0x0, (%rcx)
142689d88:     	movq	%rax, 0x8(%rcx)
// callback-wrapper
142686878:     	movq	%rcx, -0x28(%rbp)
14268687c:     	movups	0x10(%rdx), %xmm0
142686880:     	movups	0x20(%rdx), %xmm1
142686884:     	movaps	%xmm1, -0x40(%rbp)
142686888:     	movaps	%xmm0, -0x50(%rbp)
14268688c:     	movups	(%rdx), %xmm0
14268688f:     	movaps	%xmm0, -0x60(%rbp)
142686893:     	leaq	-0x60(%rbp), %rcx
142686897:     	callq	0x142687260 <.text+0x2686260>
14268689c:     	nop
14268689d:     	movq	-0x28(%rbp), %rax
1426868a1:     	cmpq	$0x0, 0x30(%rax)
1426868a6:     	sete	%al
1426868a9:     	addq	$0x80, %rsp
1426868b0:     	popq	%rbp
1426868b1:     	retq
// outer-callback-and-return-selection
1426755f9:     	movq	%rdi, -0x58(%rbp)
1426755fd:     	movq	%r12, -0x50(%rbp)
142675601:     	movq	%r14, -0x48(%rbp)
142675605:     	movq	%rbx, -0x40(%rbp)
142675609:     	movq	%r15, -0x38(%rbp)
14267560d:     	movq	%rsi, -0x30(%rbp)
142675611:     	movq	0x18(%r12), %rcx
142675616:     	addq	$0x10, %rcx
14267561a:     	leaq	-0x58(%rbp), %rdx
14267561e:     	callq	0x142686840 <.text+0x2685840>
142675623:     	nop
142675624:     	movq	$-0x1, %rsi
14267562b:     	testb	%al, %al
14267562d:     	je	0x142675650 <.text+0x2674650>
14267562f:     	movq	0x50(%rbp), %rsi
142675633:     	cmpb	$0x0, 0x48(%rbp)
142675637:     	jne	0x142675650 <.text+0x2674650>
142675639:     	movq	0x38(%rbp), %rcx
14267563d:     	movl	0x5c(%rbp), %edx
142675640:     	movq	0x30(%rbp), %r9
142675644:     	movq	%rsi, %r8
142675647:     	callq	*0x3b956cb(%rip)        # 0x14620ad18
14267564d:     	movq	%rax, %rsi
// composition-buffer-import
142681880:     	pushq	%r15
142681882:     	pushq	%r14
142681884:     	pushq	%rsi
142681885:     	pushq	%rdi
142681886:     	pushq	%rbp
142681887:     	pushq	%rbx
142681888:     	subq	$0x28, %rsp
14268188c:     	movl	%r8d, %ebx
14268188f:     	movq	%rdx, %r14
142681892:     	movq	%rcx, %rsi
142681895:     	movq	%rdx, %rcx
142681898:     	movl	%r8d, %edx
14268189b:     	xorl	%r8d, %r8d
14268189e:     	xorl	%r9d, %r9d
1426818a1:     	callq	*0x3b88dc1(%rip)        # 0x14620a668
1426818a7:     	testl	%eax, %eax
1426818a9:     	je	0x1426818ef <.text+0x26808ef>
1426818ab:     	js	0x142681908 <.text+0x2680908>
1426818ad:     	movl	%eax, %ebp
1426818af:     	movl	%eax, %edi
1426818b1:     	callq	0x140002200 <.text+0x1200>
1426818b6:     	movl	$0x1, %edx
1426818bb:     	movq	%rdi, %rcx
1426818be:     	callq	0x1400021c0 <.text+0x11c0>
1426818c3:     	testq	%rax, %rax
1426818c6:     	je	0x142681940 <.text+0x2680940>
1426818c8:     	movq	%rax, %r15
1426818cb:     	movq	%r14, %rcx
1426818ce:     	movl	%ebx, %edx
1426818d0:     	movq	%rax, %r8
1426818d3:     	movl	%ebp, %r9d
1426818d6:     	callq	*0x3b88d8c(%rip)        # 0x14620a668
1426818dc:     	testl	%eax, %eax
1426818de:     	js	0x14268191c <.text+0x268091c>
1426818e0:     	movl	%eax, %eax
1426818e2:     	movq	%rdi, (%rsi)
1426818e5:     	movq	%r15, 0x8(%rsi)
1426818e9:     	movq	%rax, 0x10(%rsi)
1426818ed:     	jmp	0x14268190f <.text+0x268090f>
1426818ef:     	movq	$0x0, (%rsi)
1426818f6:     	movq	$0x1, 0x8(%rsi)
1426818fe:     	movq	$0x0, 0x10(%rsi)
142681906:     	jmp	0x14268190f <.text+0x268090f>
142681908:     	movq	$-0x1, (%rsi)
14268190f:     	addq	$0x28, %rsp
142681913:     	popq	%rbx
142681914:     	popq	%rbp
142681915:     	popq	%rdi
142681916:     	popq	%rsi
142681917:     	popq	%r14
142681919:     	popq	%r15
14268191b:     	retq
14268191c:     	movq	$-0x1, (%rsi)
142681923:     	movl	$0x1, %r8d
142681929:     	movq	%r15, %rcx
14268192c:     	movq	%rdi, %rdx
14268192f:     	addq	$0x28, %rsp
142681933:     	popq	%rbx
142681934:     	popq	%rbp
142681935:     	popq	%rdi
142681936:     	popq	%rsi
142681937:     	popq	%r14
142681939:     	popq	%r15
14268193b:     	jmp	0x1400021d0 <.text+0x11d0>
142681940:     	movl	$0x1, %ecx
142681945:     	movq	%rdi, %rdx
142681948:     	callq	0x14620896b <.text+0x620796b>
14268194d:     	ud2
// virtual-key-to-named-key
142697f40:     	movzwl	%dx, %eax
142697f43:     	decl	%eax
142697f45:     	cmpl	$0xfd, %eax
142697f4a:     	ja	0x142697f63 <.text+0x2696f63>
142697f4c:     	andl	$0x3ff, %r9d            # imm = 0x3FF
142697f53:     	leaq	0x400ae56(%rip), %rdx   # 0x1466a2db0
142697f5a:     	movslq	(%rdx,%rax,4), %rax
142697f5e:     	addq	%rdx, %rax
142697f61:     	jmpq	*%rax
142697f63:     	movq	0x10(%r8), %rax
142697f67:     	movq	%rax, 0x18(%rcx)
142697f6b:     	movups	(%r8), %xmm0
142697f6f:     	movups	%xmm0, 0x8(%rcx)
142697f73:     	movw	$0x2, (%rcx)
142697f78:     	jmp	0x1426983ea <.text+0x26973ea>
142697f7d:     	movb	$0x1a, 0x8(%rcx)
142697f81:     	movw	$0x2, %ax
142697f85:     	movw	%ax, (%rcx)
142697f88:     	cmpb	$0x19, (%r8)
142697f8c:     	jbe	0x1426983d2 <.text+0x26973d2>
142697f92:     	jmp	0x1426983ea <.text+0x26973ea>
142697f97:     	movw	$0x8, 0x2(%rcx)
142697f9d:     	jmp	0x1426983c7 <.text+0x26973c7>
142697fa2:     	movw	$0x3, 0x2(%rcx)
142697fa8:     	jmp	0x1426983c7 <.text+0x26973c7>
142697fad:     	movw	$0xd, 0x2(%rcx)
142697fb3:     	jmp	0x1426983c7 <.text+0x26973c7>
142697fb8:     	movw	$0x1a, 0x2(%rcx)
142697fbe:     	jmp	0x1426983c7 <.text+0x26973c7>
142697fc3:     	movw	$0x8a, 0x2(%rcx)
142697fc9:     	jmp	0x1426983c7 <.text+0x26973c7>
142697fce:     	movw	$0x8d, 0x2(%rcx)
142697fd4:     	jmp	0x1426983c7 <.text+0x26973c7>
142697fd9:     	movw	$0x8e, 0x2(%rcx)
142697fdf:     	jmp	0x1426983c7 <.text+0x26973c7>
142697fe4:     	movw	$0x6, 0x2(%rcx)
142697fea:     	jmp	0x1426983c7 <.text+0x26973c7>
142697fef:     	movw	$0x99, 0x2(%rcx)
142697ff5:     	jmp	0x1426983c7 <.text+0x26973c7>
142697ffa:     	movw	$0x10e, 0x2(%rcx)       # imm = 0x10E
142698000:     	jmp	0x1426983c7 <.text+0x26973c7>
142698005:     	movw	$0x11d, 0x2(%rcx)       # imm = 0x11D
14269800b:     	jmp	0x1426983c7 <.text+0x26973c7>
142698010:     	movw	$0x124, 0x2(%rcx)       # imm = 0x124
142698016:     	jmp	0x1426983c7 <.text+0x26973c7>
14269801b:     	movw	$0x1c, 0x2(%rcx)
142698021:     	jmp	0x1426983c7 <.text+0x26973c7>
142698026:     	movw	$0x2b, 0x2(%rcx)
14269802c:     	jmp	0x1426983c7 <.text+0x26973c7>
142698031:     	movw	$0x21, 0x2(%rcx)
142698037:     	jmp	0x1426983c7 <.text+0x26973c7>
14269803c:     	movw	$0x81, 0x2(%rcx)
142698042:     	jmp	0x1426983c7 <.text+0x26973c7>
142698047:     	movw	$0x1b, 0x2(%rcx)
14269804d:     	jmp	0x1426983c7 <.text+0x26973c7>
142698052:     	movw	$0x17, 0x2(%rcx)
142698058:     	jmp	0x1426983c7 <.text+0x26973c7>
14269805d:     	movw	$0x13, 0x2(%rcx)
142698063:     	jmp	0x1426983c7 <.text+0x26973c7>
142698068:     	movw	$0x1e, 0x2(%rcx)
14269806e:     	jmp	0x1426983c7 <.text+0x26973c7>
142698073:     	movw	$0x11b, 0x2(%rcx)       # imm = 0x11B
142698079:     	jmp	0x1426983c7 <.text+0x26973c7>
14269807e:     	movw	$0x1f, 0x2(%rcx)
142698084:     	jmp	0x1426983c7 <.text+0x26973c7>
142698089:     	movw	$0x98, 0x2(%rcx)
14269808f:     	jmp	0x1426983c7 <.text+0x26973c7>
142698094:     	movw	$0x16, 0x2(%rcx)
14269809a:     	jmp	0x1426983c7 <.text+0x26973c7>
14269809f:     	movw	$0x11e, 0x2(%rcx)       # imm = 0x11E
1426980a5:     	jmp	0x1426983c7 <.text+0x26973c7>
1426980aa:     	movw	$0x111, 0x2(%rcx)       # imm = 0x111
1426980b0:     	jmp	0x1426983c7 <.text+0x26973c7>
1426980b5:     	movw	$0x58, 0x2(%rcx)
1426980bb:     	jmp	0x1426983c7 <.text+0x26973c7>
1426980c0:     	movw	$0x3a, 0x2(%rcx)
1426980c6:     	jmp	0x1426983c7 <.text+0x26973c7>
1426980cb:     	movw	$0x42, 0x2(%rcx)
1426980d1:     	jmp	0x1426983c7 <.text+0x26973c7>
1426980d6:     	movw	$0x96, 0x2(%rcx)
1426980dc:     	jmp	0x1426983c7 <.text+0x26973c7>
1426980e1:     	movw	$0xe, 0x2(%rcx)
1426980e7:     	jmp	0x1426983c7 <.text+0x26973c7>
1426980ec:     	movw	$0x114, 0x2(%rcx)       # imm = 0x114
1426980f2:     	jmp	0x1426983c7 <.text+0x26973c7>
1426980f7:     	movw	$0x82, 0x2(%rcx)
1426980fd:     	jmp	0x1426983c7 <.text+0x26973c7>
142698102:     	movw	$0x15, 0x2(%rcx)
142698108:     	jmp	0x1426983c7 <.text+0x26973c7>
14269810d:     	cmpl	$0x12, %r9d
142698111:     	jne	0x1426983a5 <.text+0x26973a5>
142698117:     	movw	$0x4f, 0x2(%rcx)
14269811d:     	jmp	0x1426983c7 <.text+0x26973c7>
142698122:     	movw	$0x11c, 0x2(%rcx)       # imm = 0x11C
142698128:     	jmp	0x1426983c7 <.text+0x26973c7>
14269812d:     	movw	$0x112, 0x2(%rcx)       # imm = 0x112
142698133:     	jmp	0x1426983c7 <.text+0x26973c7>
142698138:     	movw	$0x48, 0x2(%rcx)
14269813e:     	jmp	0x1426983c7 <.text+0x26973c7>
142698143:     	movw	$0x6d, 0x2(%rcx)
142698149:     	jmp	0x1426983c7 <.text+0x26973c7>
14269814e:     	movw	$0x11a, 0x2(%rcx)       # imm = 0x11A
142698154:     	jmp	0x1426983c7 <.text+0x26973c7>
142698159:     	movw	$0x116, 0x2(%rcx)       # imm = 0x116
14269815f:     	jmp	0x1426983c7 <.text+0x26973c7>
142698164:     	movw	$0x11, 0x2(%rcx)
14269816a:     	jmp	0x1426983c7 <.text+0x26973c7>
14269816f:     	movw	$0x115, 0x2(%rcx)       # imm = 0x115
142698175:     	jmp	0x1426983c7 <.text+0x26973c7>
14269817a:     	movw	$0xf, 0x2(%rcx)
142698180:     	jmp	0x1426983c7 <.text+0x26973c7>
142698185:     	movw	$0x125, 0x2(%rcx)       # imm = 0x125
14269818b:     	jmp	0x1426983c7 <.text+0x26973c7>
142698190:     	movw	$0x97, 0x2(%rcx)
142698196:     	jmp	0x1426983c7 <.text+0x26973c7>
14269819b:     	movw	$0x50, 0x2(%rcx)
1426981a1:     	jmp	0x1426983c7 <.text+0x26973c7>
1426981a6:     	movw	$0x29, 0x2(%rcx)
1426981ac:     	jmp	0x1426983c7 <.text+0x26973c7>
1426981b1:     	movw	$0x118, 0x2(%rcx)       # imm = 0x118
1426981b7:     	jmp	0x1426983c7 <.text+0x26973c7>
1426981bc:     	movw	$0x69, 0x2(%rcx)
1426981c2:     	jmp	0x1426983c7 <.text+0x26973c7>
1426981c7:     	movw	$0x80, 0x2(%rcx)
1426981cd:     	jmp	0x1426983c7 <.text+0x26973c7>
1426981d2:     	movw	$0x12, 0x2(%rcx)
1426981d8:     	jmp	0x1426983c7 <.text+0x26973c7>
1426981dd:     	movw	$0x25, 0x2(%rcx)
1426981e3:     	jmp	0x1426983c7 <.text+0x26973c7>
1426981e8:     	movw	$0x14, 0x2(%rcx)
1426981ee:     	jmp	0x1426983c7 <.text+0x26973c7>
1426981f3:     	movw	$0x18, 0x2(%rcx)
1426981f9:     	jmp	0x1426983c7 <.text+0x26973c7>
1426981fe:     	movw	$0x6c, 0x2(%rcx)
142698204:     	jmp	0x1426983c7 <.text+0x26973c7>
142698209:     	movw	$0x71, 0x2(%rcx)
14269820f:     	jmp	0x1426983c7 <.text+0x26973c7>
142698214:     	movw	$0x4a, 0x2(%rcx)
14269821a:     	jmp	0x1426983c7 <.text+0x26973c7>
14269821f:     	movw	$0x4c, 0x2(%rcx)
142698225:     	jmp	0x1426983c7 <.text+0x26973c7>
14269822a:     	movw	$0x6e, 0x2(%rcx)
142698230:     	jmp	0x1426983c7 <.text+0x26973c7>
142698235:     	movw	$0x117, 0x2(%rcx)       # imm = 0x117
14269823b:     	jmp	0x1426983c7 <.text+0x26973c7>
142698240:     	movw	$0x122, 0x2(%rcx)       # imm = 0x122
142698246:     	jmp	0x1426983c7 <.text+0x26973c7>
14269824b:     	movw	$0x110, 0x2(%rcx)       # imm = 0x110
142698251:     	jmp	0x1426983c7 <.text+0x26973c7>
142698256:     	movw	$0x119, 0x2(%rcx)       # imm = 0x119
14269825c:     	jmp	0x1426983c7 <.text+0x26973c7>
142698261:     	movw	$0x10, 0x2(%rcx)
142698267:     	jmp	0x1426983c7 <.text+0x26973c7>
14269826c:     	movw	$0x19, 0x2(%rcx)
142698272:     	jmp	0x1426983c7 <.text+0x26973c7>
142698277:     	movw	$0x2, 0x2(%rcx)
14269827d:     	jmp	0x1426983c7 <.text+0x26973c7>
142698282:     	movw	$0x113, 0x2(%rcx)       # imm = 0x113
142698288:     	jmp	0x1426983c7 <.text+0x26973c7>
14269828d:     	movw	$0x120, 0x2(%rcx)       # imm = 0x120
142698293:     	jmp	0x1426983c7 <.text+0x26973c7>
142698298:     	movw	$0x2a, 0x2(%rcx)
14269829e:     	jmp	0x1426983c7 <.text+0x26973c7>
1426982a3:     	movw	$0x27, 0x2(%rcx)
1426982a9:     	jmp	0x1426983c7 <.text+0x26973c7>
1426982ae:     	movw	$0x20, 0x2(%rcx)
1426982b4:     	jmp	0x1426983c7 <.text+0x26973c7>
1426982b9:     	movw	$0x43, 0x2(%rcx)
1426982bf:     	jmp	0x1426983c7 <.text+0x26973c7>
1426982c4:     	movw	$0x7, 0x2(%rcx)
1426982ca:     	jmp	0x1426983c7 <.text+0x26973c7>
1426982cf:     	movw	$0x52, 0x2(%rcx)
1426982d5:     	jmp	0x1426983c7 <.text+0x26973c7>
1426982da:     	cmpb	$0x0, 0x28(%rsp)
1426982df:     	je	0x1426982ec <.text+0x26972ec>
1426982e1:     	movw	$0x1, 0x2(%rcx)
1426982e7:     	jmp	0x1426983c7 <.text+0x26973c7>
1426982ec:     	movw	$0x0, 0x2(%rcx)
1426982f2:     	jmp	0x1426983c7 <.text+0x26973c7>
1426982f7:     	cmpl	$0x12, %r9d
1426982fb:     	jne	0x1426983b7 <.text+0x26973b7>
142698301:     	movw	$0x4e, 0x2(%rcx)
142698307:     	jmp	0x1426983c7 <.text+0x26973c7>
14269830c:     	movw	$0x3c, 0x2(%rcx)
142698312:     	jmp	0x1426983c7 <.text+0x26973c7>
142698317:     	movw	$0x2e, 0x2(%rcx)
14269831d:     	jmp	0x1426983c7 <.text+0x26973c7>
142698322:     	movw	$0x2f, 0x2(%rcx)
142698328:     	jmp	0x1426983c7 <.text+0x26973c7>
14269832d:     	movw	$0x123, 0x2(%rcx)       # imm = 0x123
142698333:     	jmp	0x1426983c7 <.text+0x26973c7>
142698338:     	movw	$0x121, 0x2(%rcx)       # imm = 0x121
14269833e:     	jmp	0x1426983c7 <.text+0x26973c7>
142698343:     	movw	$0x9a, 0x2(%rcx)
142698349:     	jmp	0x1426983c7 <.text+0x26973c7>
14269834b:     	movw	$0x10f, 0x2(%rcx)       # imm = 0x10F
142698351:     	jmp	0x1426983c7 <.text+0x26973c7>
142698353:     	movw	$0x31, 0x2(%rcx)
142698359:     	jmp	0x1426983c7 <.text+0x26973c7>
14269835b:     	movw	$0x59, 0x2(%rcx)
142698361:     	jmp	0x1426983c7 <.text+0x26973c7>
142698363:     	movw	$0x9b, 0x2(%rcx)
142698369:     	jmp	0x1426983c7 <.text+0x26973c7>
14269836b:     	movw	$0x2d, 0x2(%rcx)
142698371:     	jmp	0x1426983c7 <.text+0x26973c7>
142698373:     	movw	$0x89, 0x2(%rcx)
142698379:     	jmp	0x1426983c7 <.text+0x26973c7>
14269837b:     	movw	$0x11f, 0x2(%rcx)       # imm = 0x11F
142698381:     	jmp	0x1426983c7 <.text+0x26973c7>
142698383:     	movw	$0x9c, 0x2(%rcx)
142698389:     	jmp	0x1426983c7 <.text+0x26973c7>
14269838b:     	movw	$0x126, 0x2(%rcx)       # imm = 0x126
142698391:     	jmp	0x1426983c7 <.text+0x26973c7>
142698393:     	cmpl	$0x11, %r9d
142698397:     	jne	0x142697f63 <.text+0x2696f63>
14269839d:     	movw	$0x57, 0x2(%rcx)
1426983a3:     	jmp	0x1426983c7 <.text+0x26973c7>
1426983a5:     	cmpl	$0x11, %r9d
1426983a9:     	jne	0x142697f63 <.text+0x2696f63>
1426983af:     	movw	$0x56, 0x2(%rcx)
1426983b5:     	jmp	0x1426983c7 <.text+0x26973c7>
1426983b7:     	cmpl	$0x11, %r9d
1426983bb:     	jne	0x142697f63 <.text+0x2696f63>
1426983c1:     	movw	$0x55, 0x2(%rcx)
1426983c7:     	xorl	%eax, %eax
1426983c9:     	movw	%ax, (%rcx)
1426983cc:     	cmpb	$0x19, (%r8)
1426983d0:     	ja	0x1426983ea <.text+0x26973ea>
1426983d2:     	jne	0x1426983ea <.text+0x26973ea>
1426983d4:     	movq	0x8(%r8), %rax
1426983d8:     	lock
1426983d9:     	decq	(%rax)
1426983dc:     	jne	0x1426983ea <.text+0x26973ea>
1426983de:     	addq	$0x8, %r8
1426983e2:     	movq	%r8, %rcx
1426983e5:     	jmp	0x14267f1e0 <.text+0x267e1e0>
1426983ea:     	retq
// recognized-named-key-return
1426979c8:     	movzwl	0x60(%rbp), %r14d
1426979cd:     	movb	%r8b, -0x1(%rbp)
1426979d1:     	movw	%r14w, -0x3e(%rbp)
1426979d6:     	movb	$0x1d, -0x40(%rbp)
1426979da:     	cmpw	$0x12, %r14w
1426979df:     	je	0x142697a3a <.text+0x2696a3a>
1426979e1:     	movb	%r9b, %r15b
1426979e4:     	movw	%r14w, -0x56(%rbp)
1426979e9:     	movb	$0x1d, -0x58(%rbp)
1426979ed:     	movq	0x90(%rdi), %r9
1426979f4:     	movzbl	0x98(%rdi), %eax
1426979fb:     	movb	%al, 0x20(%rsp)
1426979ff:     	leaq	-0x28(%rbp), %rcx
142697a03:     	leaq	-0x58(%rbp), %r8
142697a07:     	movl	%r14d, %edx
142697a0a:     	callq	0x142697f40 <.text+0x2696f40>
142697a0f:     	nop
142697a10:     	cmpw	$0x2, -0x28(%rbp)
142697a15:     	jne	0x142697baf <.text+0x2696baf>
// recognized-key-copy
142697baf:     	movdqu	-0x28(%rbp), %xmm0
142697bb4:     	movdqu	-0x18(%rbp), %xmm1
142697bb9:     	movdqu	%xmm1, 0x10(%rsi)
142697bbe:     	movdqu	%xmm0, (%rsi)
142697bc2:     	cmpb	$0x19, -0x40(%rbp)
142697bc6:     	jbe	0x142697eb6 <.text+0x2696eb6>
142697bcc:     	jmp	0x142697ecb <.text+0x2696ecb>
// input-vkey-capture
14268efe6:     	movl	%r9d, %ebx
14268efe9:     	movq	%r8, %rdi
14268efec:     	movq	%rdx, %r14
14268efef:     	movq	%rcx, %rsi
// input-vkey-logical-key-call
14268f134:     	leaq	0x110(%rbp), %rax
14268f13b:     	movq	%rax, 0x28(%rsp)
14268f140:     	movw	%r14w, 0x20(%rsp)
14268f146:     	leaq	0xf0(%rbp), %rcx
14268f14d:     	movq	%rbx, %rdx
14268f150:     	callq	0x1426979a0 <.text+0x26969a0>
