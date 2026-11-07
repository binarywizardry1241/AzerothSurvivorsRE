Disassembly of section .text:

0000000140001000 <.text>:
1401b3d20:     	pushq	%rbp
1401b3d21:     	pushq	%r15
1401b3d23:     	pushq	%r14
1401b3d25:     	pushq	%r13
1401b3d27:     	pushq	%r12
1401b3d29:     	pushq	%rsi
1401b3d2a:     	pushq	%rdi
1401b3d2b:     	pushq	%rbx
1401b3d2c:     	subq	$0x7a8, %rsp            # imm = 0x7A8
1401b3d33:     	leaq	0x80(%rsp), %rbp
1401b3d3b:     	movaps	%xmm15, 0x710(%rbp)
1401b3d43:     	movaps	%xmm14, 0x700(%rbp)
1401b3d4b:     	movaps	%xmm13, 0x6f0(%rbp)
1401b3d53:     	movaps	%xmm12, 0x6e0(%rbp)
1401b3d5b:     	movaps	%xmm11, 0x6d0(%rbp)
1401b3d63:     	movaps	%xmm10, 0x6c0(%rbp)
1401b3d6b:     	movaps	%xmm9, 0x6b0(%rbp)
1401b3d73:     	movaps	%xmm8, 0x6a0(%rbp)
1401b3d7b:     	movaps	%xmm7, 0x690(%rbp)
1401b3d82:     	movaps	%xmm6, 0x680(%rbp)
1401b3d89:     	movq	$-0x2, 0x678(%rbp)
1401b3d94:     	movq	(%rcx), %rbx
1401b3d97:     	movq	0x28(%rcx), %rax
1401b3d9b:     	movq	%rbx, 0x2e8(%rbp)
1401b3da2:     	leaq	0x2f0(%rbp), %rdi
1401b3da9:     	movups	0x8(%rcx), %xmm0
1401b3dad:     	movups	%xmm0, 0x2f0(%rbp)
1401b3db4:     	movq	%rcx, 0x398(%rbp)
1401b3dbb:     	movups	0x18(%rcx), %xmm0
1401b3dbf:     	movups	%xmm0, 0x300(%rbp)
1401b3dc6:     	movq	%rax, 0x310(%rbp)
1401b3dcd:     	movq	%rdx, 0x640(%rbp)
1401b3dd4:     	movq	0x18(%rdx), %rax
1401b3dd8:     	leaq	0x428(%rbp), %rcx
1401b3ddf:     	movsd	(%rax), %xmm9
1401b3de4:     	movups	0x5c04a95(%rip), %xmm6  # 0x145db8880
1401b3deb:     	movaps	%xmm6, 0x3b0(%rbp)
1401b3df2:     	movq	$0x0, 0x3c0(%rbp)
1401b3dfd:     	movups	0x5c04a93(%rip), %xmm15 # 0x145db8898
1401b3e05:     	movups	%xmm15, 0x3c8(%rbp)
1401b3e0d:     	movq	$0x0, 0x3d8(%rbp)
1401b3e18:     	movups	0x5c04a90(%rip), %xmm8  # 0x145db88b0
1401b3e20:     	movaps	%xmm8, 0x3e0(%rbp)
1401b3e28:     	movq	$0x0, 0x3f0(%rbp)
1401b3e33:     	movups	0x5c04a8d(%rip), %xmm14 # 0x145db88c8
1401b3e3b:     	movups	%xmm14, 0x3f8(%rbp)
1401b3e43:     	movq	$0x0, 0x408(%rbp)
1401b3e4e:     	movaps	%xmm6, -0x30(%rbp)
1401b3e52:     	movq	0x3c0(%rbp), %rax
1401b3e59:     	movq	%rax, -0x20(%rbp)
1401b3e5d:     	movq	0x3c8(%rbp), %rax
1401b3e64:     	movq	%rax, -0x18(%rbp)
1401b3e68:     	movq	0x3d0(%rbp), %rax
1401b3e6f:     	movq	%rax, -0x10(%rbp)
1401b3e73:     	movq	0x3d8(%rbp), %rax
1401b3e7a:     	movq	%rax, -0x8(%rbp)
1401b3e7e:     	movaps	%xmm8, (%rbp)
1401b3e83:     	movq	0x3f0(%rbp), %rax
1401b3e8a:     	movq	%rax, 0x10(%rbp)
1401b3e8e:     	movq	0x3f8(%rbp), %rax
1401b3e95:     	movq	%rax, 0x18(%rbp)
1401b3e99:     	movaps	0x400(%rbp), %xmm0
1401b3ea0:     	movaps	%xmm0, 0x20(%rbp)
1401b3ea4:     	xorps	%xmm7, %xmm7
1401b3ea7:     	movaps	%xmm7, 0x40(%rbp)
1401b3eab:     	movaps	%xmm7, 0x30(%rbp)
1401b3eaf:     	movq	$0x0, 0x50(%rbp)
1401b3eb7:     	movups	%xmm7, 0x4d0(%rbp)
1401b3ebe:     	movups	%xmm7, 0x4c0(%rbp)
1401b3ec5:     	movl	$0x0, 0x59c(%rbp)
1401b3ecf:     	movw	$0x0, 0x5a0(%rbp)
1401b3ed8:     	leaq	-0x30(%rbp), %rdx
1401b3edc:     	movl	$0x88, %r8d
1401b3ee2:     	callq	0x145bc977b <.text+0x5bc877b>
1401b3ee7:     	movl	$0x1, 0x4b0(%rbp)
1401b3ef1:     	movss	%xmm9, 0x4b4(%rbp)
1401b3efa:     	movl	$0x1, 0x4b8(%rbp)
1401b3f04:     	movshdup	%xmm9, %xmm0            # xmm0 = xmm9[1,1,3,3]
1401b3f09:     	movss	%xmm0, 0x4bc(%rbp)
1401b3f11:     	movups	0x5c04a1f(%rip), %xmm12 # 0x145db8938
1401b3f19:     	movups	%xmm12, 0x4e0(%rbp)
1401b3f21:     	movups	0x5c04a1f(%rip), %xmm13 # 0x145db8948
1401b3f29:     	movups	%xmm13, 0x4f0(%rbp)
1401b3f31:     	movups	0x5c04a20(%rip), %xmm0  # 0x145db8958
1401b3f38:     	movups	%xmm0, 0x500(%rbp)
1401b3f3f:     	movups	0x5c04a22(%rip), %xmm0  # 0x145db8968
1401b3f46:     	movups	%xmm0, 0x510(%rbp)
1401b3f4d:     	movups	0x5c04a24(%rip), %xmm0  # 0x145db8978
1401b3f54:     	movups	%xmm0, 0x520(%rbp)
1401b3f5b:     	movups	0x5c04a26(%rip), %xmm0  # 0x145db8988
1401b3f62:     	movups	%xmm0, 0x530(%rbp)
1401b3f69:     	movups	0x5c04a37(%rip), %xmm10 # 0x145db89a8
1401b3f71:     	movups	%xmm10, 0x550(%rbp)
1401b3f79:     	movups	0x5c04a17(%rip), %xmm11 # 0x145db8998
1401b3f81:     	movups	%xmm11, 0x540(%rbp)
1401b3f89:     	movaps	0x5bb92d0(%rip), %xmm0  # 0x145d6d260
1401b3f90:     	movups	%xmm0, 0x560(%rbp)
1401b3f97:     	movl	$0x1, 0x570(%rbp)
1401b3fa1:     	movq	$0x0, 0x574(%rbp)
1401b3fac:     	movb	$0x1, 0x57c(%rbp)
1401b3fb3:     	movq	$0x0, 0x580(%rbp)
1401b3fbe:     	movl	$0x3f800000, 0x588(%rbp) # imm = 0x3F800000
1401b3fc8:     	movw	$0x0, 0x58c(%rbp)
1401b3fd1:     	movl	$0x10000, 0x58e(%rbp)   # imm = 0x10000
1401b3fdb:     	movw	$0x0, 0x592(%rbp)
1401b3fe4:     	movabsq	$0x100000000010000, %rax # imm = 0x100000000010000
1401b3fee:     	movq	%rax, 0x594(%rbp)
1401b3ff5:     	movl	$0x5000005, 0x5a2(%rbp) # imm = 0x5000005
1401b3fff:     	movsd	%xmm9, 0x5a8(%rbp)
1401b4008:     	movl	$0x3fa66666, 0x5b0(%rbp) # imm = 0x3FA66666
1401b4012:     	movups	0x5c04c67(%rip), %xmm0  # 0x145db8c80
1401b4019:     	movups	%xmm0, 0x5b4(%rbp)
1401b4020:     	movups	0x5c04c69(%rip), %xmm0  # 0x145db8c90
1401b4027:     	movups	%xmm0, 0x5c4(%rbp)
1401b402e:     	movq	%rbx, 0x420(%rbp)
1401b4035:     	movb	$0x1, 0x675(%rbp)
1401b403c:     	leaq	0x2b8(%rbp), %rcx
1401b4043:     	leaq	0x420(%rbp), %r8
1401b404a:     	movq	%rdi, %rdx
1401b404d:     	callq	0x14018e950 <.text+0x18d950>
1401b4052:     	nop
1401b4053:     	movq	0x640(%rbp), %rax
1401b405a:     	movq	0x20(%rax), %r15
1401b405e:     	movq	0x28(%rax), %r12
1401b4062:     	movq	(%rax), %rcx
1401b4065:     	movq	%rcx, 0x648(%rbp)
1401b406c:     	movq	0x8(%rax), %rax
1401b4070:     	movq	%rax, 0x658(%rbp)
1401b4077:     	movq	0x2b8(%rbp), %rsi
1401b407e:     	movq	0x2e0(%rbp), %rax
1401b4085:     	movq	%rsi, 0x288(%rbp)
1401b408c:     	movups	0x2c0(%rbp), %xmm0
1401b4093:     	movups	%xmm0, 0x290(%rbp)
1401b409a:     	movups	0x2d0(%rbp), %xmm0
1401b40a1:     	movups	%xmm0, 0x2a0(%rbp)
1401b40a8:     	movq	%rax, 0x2b0(%rbp)
1401b40af:     	movw	$0x0, 0x584(%rbp)
1401b40b8:     	movb	$0x1, 0x574(%rbp)
1401b40bf:     	movaps	%xmm7, 0x480(%rbp)
1401b40c6:     	movaps	%xmm7, 0x490(%rbp)
1401b40cd:     	movaps	%xmm7, 0x4a0(%rbp)
1401b40d4:     	movaps	%xmm7, 0x4b0(%rbp)
1401b40db:     	movaps	%xmm7, 0x4c0(%rbp)
1401b40e2:     	movq	$0x0, 0x4d0(%rbp)
1401b40ed:     	movl	$0x5, 0x59a(%rbp)
1401b40f7:     	movups	%xmm12, 0x4d8(%rbp)
1401b40ff:     	movups	%xmm13, 0x4e8(%rbp)
1401b4107:     	movaps	0x5c03a72(%rip), %xmm0  # 0x145db7b80
1401b410e:     	movups	%xmm0, 0x4f8(%rbp)
1401b4115:     	movaps	0x5be9d34(%rip), %xmm0  # 0x145d9de50
1401b411c:     	movups	%xmm0, 0x508(%rbp)
1401b4123:     	movaps	0x5bb92d6(%rip), %xmm0  # 0x145d6d400
1401b412a:     	movups	%xmm0, 0x518(%rbp)
1401b4131:     	movups	%xmm0, 0x528(%rbp)
1401b4138:     	movups	%xmm11, 0x538(%rbp)
1401b4140:     	movups	%xmm10, 0x548(%rbp)
1401b4148:     	movq	$0x0, 0x578(%rbp)
1401b4153:     	movl	$0x3f800000, 0x580(%rbp) # imm = 0x3F800000
1401b415d:     	movaps	0x5c03b5c(%rip), %xmm0  # 0x145db7cc0
1401b4164:     	movups	%xmm0, 0x558(%rbp)
1401b416b:     	movl	$0x1, 0x568(%rbp)
1401b4175:     	movq	$0x0, 0x56c(%rbp)
1401b4180:     	movabsq	$0x100000000, %rax      # imm = 0x100000000
1401b418a:     	movq	%rax, 0x592(%rbp)
1401b4191:     	movaps	%xmm6, 0x420(%rbp)
1401b4198:     	movq	$0x0, 0x430(%rbp)
1401b41a3:     	movups	%xmm15, 0x438(%rbp)
1401b41ab:     	movq	$0x0, 0x448(%rbp)
1401b41b6:     	movaps	%xmm8, 0x450(%rbp)
1401b41be:     	movq	$0x0, 0x460(%rbp)
1401b41c9:     	movaps	%xmm14, %xmm9
1401b41cd:     	movups	%xmm14, 0x468(%rbp)
1401b41d5:     	movq	$0x0, 0x478(%rbp)
1401b41e0:     	movw	$0x0, 0x58a(%rbp)
1401b41e9:     	movl	$0x10000, 0x586(%rbp)   # imm = 0x10000
1401b41f3:     	movw	$0x0, 0x590(%rbp)
1401b41fc:     	movl	$0x10000, 0x58c(%rbp)   # imm = 0x10000
1401b4206:     	movb	$0x0, 0x676(%rbp)
1401b420d:     	leaq	-0x30(%rbp), %rcx
1401b4211:     	leaq	0x420(%rbp), %rdx
1401b4218:     	callq	0x140012c60 <.text+0x11c60>
1401b421d:     	nop
1401b421e:     	movaps	%xmm13, %xmm12
1401b4222:     	leaq	0x290(%rbp), %rdi
1401b4229:     	leaq	0x428(%rbp), %rcx
1401b4230:     	leaq	-0x30(%rbp), %rdx
1401b4234:     	movl	$0x200, %r8d            # imm = 0x200
1401b423a:     	callq	0x145bc977b <.text+0x5bc877b>
1401b423f:     	movq	%rsi, 0x420(%rbp)
1401b4246:     	movb	$0x0, 0x676(%rbp)
1401b424d:     	leaq	0x258(%rbp), %rcx
1401b4254:     	leaq	0x420(%rbp), %r8
1401b425b:     	movq	%rdi, %rdx
1401b425e:     	callq	0x14018b7d0 <.text+0x18a7d0>
1401b4263:     	nop
1401b4264:     	movq	0x640(%rbp), %rax
1401b426b:     	movq	0x10(%rax), %rax
1401b426f:     	movq	%rax, 0x668(%rbp)
1401b4276:     	movq	0x258(%rbp), %r13
1401b427d:     	movq	0x280(%rbp), %rax
1401b4284:     	movq	%r13, 0x228(%rbp)
1401b428b:     	movups	0x260(%rbp), %xmm0
1401b4292:     	movups	%xmm0, 0x230(%rbp)
1401b4299:     	movups	0x270(%rbp), %xmm0
1401b42a0:     	movups	%xmm0, 0x240(%rbp)
1401b42a7:     	movq	%rax, 0x250(%rbp)
1401b42ae:     	movq	(%r15), %rsi
1401b42b1:     	cmpb	$0x0, (%r12)
1401b42b6:     	je	0x1401b42d3 <.text+0x1b32d3>
1401b42b8:     	movb	$0x0, 0x677(%rbp)
1401b42bf:     	leaq	0x5c04b32(%rip), %rcx   # 0x145db8df8
1401b42c6:     	movl	$0xb, %edx
1401b42cb:     	callq	0x1458da4e0 <.text+0x58d94e0>
1401b42d0:     	nop
1401b42d1:     	jmp	0x1401b42ec <.text+0x1b32ec>
1401b42d3:     	movb	$0x0, 0x677(%rbp)
1401b42da:     	leaq	0x5c04b0c(%rip), %rcx   # 0x145db8ded
1401b42e1:     	movl	$0xb, %edx
1401b42e6:     	callq	0x1458da4e0 <.text+0x58d94e0>
1401b42eb:     	nop
1401b42ec:     	movq	%rdx, %rbx
1401b42ef:     	testq	%rdx, %rdx
1401b42f2:     	jns	0x1401b430e <.text+0x1b330e>
1401b42f4:     	xorl	%edi, %edi
1401b42f6:     	movb	$0x0, 0x677(%rbp)
1401b42fd:     	movq	%rdi, %rcx
1401b4300:     	movq	%rbx, %rdx
1401b4303:     	callq	0x145d6944b <.text+0x5d6844b>
1401b4308:     	nop
1401b4309:     	jmp	0x1401b4e9d <.text+0x1b3e9d>
1401b430e:     	movq	%r15, 0x650(%rbp)
1401b4315:     	je	0x1401b436c <.text+0x1b336c>
1401b4317:     	movq	%rax, %r15
1401b431a:     	callq	0x140002200 <.text+0x1200>
1401b431f:     	movl	$0x1, %edi
1401b4324:     	movl	$0x1, %edx
1401b4329:     	movq	%rbx, %rcx
1401b432c:     	callq	0x1400021c0 <.text+0x11c0>
1401b4331:     	testq	%rax, %rax
1401b4334:     	je	0x1401b42f6 <.text+0x1b32f6>
1401b4336:     	movq	%rax, %r14
1401b4339:     	movq	%rax, %rcx
1401b433c:     	movq	%r15, %rdx
1401b433f:     	movq	%rbx, %r8
1401b4342:     	callq	0x145bc977b <.text+0x5bc877b>
1401b4347:     	movq	0x650(%rbp), %r15
1401b434e:     	cmpb	$0x1, 0x18(%rsi)
1401b4352:     	jne	0x1401b4378 <.text+0x1b3378>
1401b4354:     	movl	0x19(%rsi), %eax
1401b4357:     	movl	0x1c(%rsi), %ecx
1401b435a:     	movl	%ecx, -0x2d(%rbp)
1401b435d:     	movl	%eax, -0x30(%rbp)
1401b4360:     	movq	0x20(%rsi), %rax
1401b4364:     	movzbl	0x28(%rsi), %edx
1401b4368:     	movb	$0x1, %cl
1401b436a:     	jmp	0x1401b4388 <.text+0x1b3388>
1401b436c:     	movl	$0x1, %r14d
1401b4372:     	cmpb	$0x1, 0x18(%rsi)
1401b4376:     	je	0x1401b4354 <.text+0x1b3354>
1401b4378:     	movq	0x20(%rsi), %rax
1401b437c:     	lock
1401b437d:     	incq	(%rax)
1401b4380:     	jle	0x1401b4e9d <.text+0x1b3e9d>
1401b4386:     	xorl	%ecx, %ecx
1401b4388:     	leaq	0x230(%rbp), %rdi
1401b438f:     	movl	-0x30(%rbp), %r8d
1401b4393:     	movl	-0x2d(%rbp), %r9d
1401b4397:     	movl	%r9d, 0x45c(%rbp)
1401b439e:     	movl	%r8d, 0x459(%rbp)
1401b43a5:     	movups	0x5c0444c(%rip), %xmm0  # 0x145db87f8
1401b43ac:     	movups	%xmm0, 0x3b1(%rbp)
1401b43b3:     	movl	$0x3f800000, 0x3c1(%rbp) # imm = 0x3F800000
1401b43bd:     	movq	%rbx, 0x428(%rbp)
1401b43c4:     	movq	%r14, 0x430(%rbp)
1401b43cb:     	movq	%rbx, 0x438(%rbp)
1401b43d2:     	movq	$0x0, 0x440(%rbp)
1401b43dd:     	movq	$0x4, 0x448(%rbp)
1401b43e8:     	movq	$0x0, 0x450(%rbp)
1401b43f3:     	movb	%cl, 0x458(%rbp)
1401b43f9:     	movq	%rax, 0x460(%rbp)
1401b4400:     	movq	%rdx, 0x468(%rbp)
1401b4407:     	movl	$0x42380000, 0x470(%rbp) # imm = 0x42380000
1401b4411:     	movw	$0x190, 0x474(%rbp)     # imm = 0x190
1401b441a:     	movb	$0x1, 0x476(%rbp)
1401b4421:     	movq	0x3bd(%rbp), %rax
1401b4428:     	movq	%rax, 0x484(%rbp)
1401b442f:     	movups	0x3b0(%rbp), %xmm0
1401b4436:     	movups	%xmm0, 0x477(%rbp)
1401b443d:     	movl	0x5bb9ea5(%rip), %eax   # 0x145d6e2e8
1401b4443:     	movl	%eax, 0x49c(%rbp)
1401b4449:     	movups	0x5bb9e88(%rip), %xmm7  # 0x145d6e2d8
1401b4450:     	movups	%xmm7, 0x48c(%rbp)
1401b4457:     	movsd	0x5bb8d70(%rip), %xmm13 # 0x145d6d1d0
1401b4460:     	movsd	%xmm13, 0x4a0(%rbp)
1401b4469:     	movq	%r13, 0x420(%rbp)
1401b4470:     	movb	$0x0, 0x677(%rbp)
1401b4477:     	leaq	-0x30(%rbp), %rcx
1401b447b:     	leaq	0x420(%rbp), %r8
1401b4482:     	movq	%rdi, %rdx
1401b4485:     	callq	0x14018ef20 <.text+0x18df20>
1401b448a:     	nop
1401b448b:     	movq	(%r15), %rsi
1401b448e:     	cmpb	$0x0, (%r12)
1401b4493:     	je	0x1401b44b0 <.text+0x1b34b0>
1401b4495:     	movb	$0x0, 0x677(%rbp)
1401b449c:     	leaq	0x5c04970(%rip), %rcx   # 0x145db8e13
1401b44a3:     	movl	$0x12, %edx
1401b44a8:     	callq	0x1458da4e0 <.text+0x58d94e0>
1401b44ad:     	nop
1401b44ae:     	jmp	0x1401b44c9 <.text+0x1b34c9>
1401b44b0:     	movb	$0x0, 0x677(%rbp)
1401b44b7:     	leaq	0x5c04945(%rip), %rcx   # 0x145db8e03
1401b44be:     	movl	$0x10, %edx
1401b44c3:     	callq	0x1458da4e0 <.text+0x58d94e0>
1401b44c8:     	nop
1401b44c9:     	movq	%rdx, %rbx
1401b44cc:     	testq	%rdx, %rdx
1401b44cf:     	jns	0x1401b44ec <.text+0x1b34ec>
1401b44d1:     	xorl	%r15d, %r15d
1401b44d4:     	movb	$0x0, 0x677(%rbp)
1401b44db:     	movq	%r15, %rcx
1401b44de:     	movq	%rbx, %rdx
1401b44e1:     	callq	0x145d6944b <.text+0x5d6844b>
1401b44e6:     	nop
1401b44e7:     	jmp	0x1401b4e9d <.text+0x1b3e9d>
1401b44ec:     	je	0x1401b453c <.text+0x1b353c>
1401b44ee:     	movq	%rax, %r12
1401b44f1:     	callq	0x140002200 <.text+0x1200>
1401b44f6:     	movl	$0x1, %r15d
1401b44fc:     	movl	$0x1, %edx
1401b4501:     	movq	%rbx, %rcx
1401b4504:     	callq	0x1400021c0 <.text+0x11c0>
1401b4509:     	testq	%rax, %rax
1401b450c:     	je	0x1401b44d4 <.text+0x1b34d4>
1401b450e:     	movq	%rax, %r14
1401b4511:     	movq	%rax, %rcx
1401b4514:     	movq	%r12, %rdx
1401b4517:     	movq	%rbx, %r8
1401b451a:     	callq	0x145bc977b <.text+0x5bc877b>
1401b451f:     	cmpb	$0x1, (%rsi)
1401b4522:     	jne	0x1401b4547 <.text+0x1b3547>
1401b4524:     	movl	0x1(%rsi), %eax
1401b4527:     	movl	0x4(%rsi), %ecx
1401b452a:     	movl	%ecx, -0x2d(%rbp)
1401b452d:     	movl	%eax, -0x30(%rbp)
1401b4530:     	movq	0x8(%rsi), %rax
1401b4534:     	movzbl	0x10(%rsi), %edx
1401b4538:     	movb	$0x1, %cl
1401b453a:     	jmp	0x1401b4557 <.text+0x1b3557>
1401b453c:     	movl	$0x1, %r14d
1401b4542:     	cmpb	$0x1, (%rsi)
1401b4545:     	je	0x1401b4524 <.text+0x1b3524>
1401b4547:     	movq	0x8(%rsi), %rax
1401b454b:     	lock
1401b454c:     	incq	(%rax)
1401b454f:     	jle	0x1401b4e9d <.text+0x1b3e9d>
1401b4555:     	xorl	%ecx, %ecx
1401b4557:     	movl	-0x30(%rbp), %r8d
1401b455b:     	movl	-0x2d(%rbp), %r9d
1401b455f:     	movl	%r9d, 0x45c(%rbp)
1401b4566:     	movl	%r8d, 0x459(%rbp)
1401b456d:     	movups	0x5c042c8(%rip), %xmm0  # 0x145db883c
1401b4574:     	movups	%xmm0, 0x3b1(%rbp)
1401b457b:     	movl	$0x3f800000, 0x3c1(%rbp) # imm = 0x3F800000
1401b4585:     	movq	%rbx, 0x428(%rbp)
1401b458c:     	movq	%r14, 0x430(%rbp)
1401b4593:     	movq	%rbx, 0x438(%rbp)
1401b459a:     	movq	$0x0, 0x440(%rbp)
1401b45a5:     	movq	$0x4, 0x448(%rbp)
1401b45b0:     	movq	$0x0, 0x450(%rbp)
1401b45bb:     	movb	%cl, 0x458(%rbp)
1401b45c1:     	movq	%rax, 0x460(%rbp)
1401b45c8:     	movq	%rdx, 0x468(%rbp)
1401b45cf:     	movl	$0x41700000, 0x470(%rbp) # imm = 0x41700000
1401b45d9:     	movw	$0x190, 0x474(%rbp)     # imm = 0x190
1401b45e2:     	movb	$0x1, 0x476(%rbp)
1401b45e9:     	movq	0x3bd(%rbp), %rax
1401b45f0:     	movq	%rax, 0x484(%rbp)
1401b45f7:     	movups	0x3b0(%rbp), %xmm0
1401b45fe:     	movups	%xmm0, 0x477(%rbp)
1401b4605:     	movl	0x5bb9cdd(%rip), %eax   # 0x145d6e2e8
1401b460b:     	movl	%eax, 0x49c(%rbp)
1401b4611:     	movups	%xmm7, 0x48c(%rbp)
1401b4618:     	movsd	%xmm13, 0x4a0(%rbp)
1401b4621:     	movq	%r13, 0x420(%rbp)
1401b4628:     	movb	$0x0, 0x677(%rbp)
1401b462f:     	leaq	-0x30(%rbp), %rcx
1401b4633:     	leaq	0x420(%rbp), %r8
1401b463a:     	movq	%rdi, %rdx
1401b463d:     	callq	0x14018ef20 <.text+0x18df20>
1401b4642:     	nop
1401b4643:     	xorps	%xmm7, %xmm7
1401b4646:     	movups	%xmm7, 0x4b0(%rbp)
1401b464d:     	movups	%xmm7, 0x4a0(%rbp)
1401b4654:     	movups	%xmm7, 0x490(%rbp)
1401b465b:     	movups	%xmm7, 0x4c8(%rbp)
1401b4662:     	movq	$0x0, 0x4d8(%rbp)
1401b466d:     	movaps	%xmm6, -0x30(%rbp)
1401b4671:     	movq	$0x0, -0x20(%rbp)
1401b4679:     	movups	%xmm15, -0x18(%rbp)
1401b467e:     	movq	$0x0, -0x8(%rbp)
1401b4686:     	movaps	%xmm8, (%rbp)
1401b468b:     	movq	$0x0, 0x10(%rbp)
1401b4693:     	movups	%xmm9, 0x18(%rbp)
1401b4698:     	movq	$0x0, 0x28(%rbp)
1401b46a0:     	movq	-0x10(%rbp), %rax
1401b46a4:     	movq	%rax, 0x448(%rbp)
1401b46ab:     	movq	-0x8(%rbp), %rax
1401b46af:     	movq	%rax, 0x450(%rbp)
1401b46b6:     	movq	-0x20(%rbp), %rax
1401b46ba:     	movq	%rax, 0x438(%rbp)
1401b46c1:     	movq	-0x18(%rbp), %rax
1401b46c5:     	movq	%rax, 0x440(%rbp)
1401b46cc:     	movaps	-0x30(%rbp), %xmm0
1401b46d0:     	movaps	(%rbp), %xmm1
1401b46d4:     	movq	0x20(%rbp), %rax
1401b46d8:     	movq	%rax, 0x478(%rbp)
1401b46df:     	movq	0x28(%rbp), %rax
1401b46e3:     	movq	%rax, 0x480(%rbp)
1401b46ea:     	movaps	0x10(%rbp), %xmm2
1401b46ee:     	movups	%xmm2, 0x468(%rbp)
1401b46f5:     	movups	%xmm1, 0x458(%rbp)
1401b46fc:     	movups	%xmm0, 0x428(%rbp)
1401b4703:     	movq	$0x0, 0x488(%rbp)
1401b470e:     	movabsq	$0x4370000000000001, %rax # imm = 0x4370000000000001
1401b4718:     	movq	%rax, 0x4c0(%rbp)
1401b471f:     	movaps	0x5bb8bea(%rip), %xmm0  # 0x145d6d310
1401b4726:     	movups	%xmm0, 0x4e0(%rbp)
1401b472d:     	movaps	0x5bb8d2c(%rip), %xmm0  # 0x145d6d460
1401b4734:     	movups	%xmm0, 0x4f0(%rbp)
1401b473b:     	movups	0x5c04226(%rip), %xmm0  # 0x145db8968
1401b4742:     	movups	%xmm0, 0x510(%rbp)
1401b4749:     	movups	0x5c04208(%rip), %xmm0  # 0x145db8958
1401b4750:     	movups	%xmm0, 0x500(%rbp)
1401b4757:     	movups	0x5c0422a(%rip), %xmm0  # 0x145db8988
1401b475e:     	movups	%xmm0, 0x530(%rbp)
1401b4765:     	movups	0x5c0420c(%rip), %xmm0  # 0x145db8978
1401b476c:     	movups	%xmm0, 0x520(%rbp)
1401b4773:     	movups	%xmm10, 0x550(%rbp)
1401b477b:     	movups	%xmm11, 0x540(%rbp)
1401b4783:     	movaps	0x5bbf826(%rip), %xmm0  # 0x145d73fb0
1401b478a:     	movups	%xmm0, 0x560(%rbp)
1401b4791:     	movl	$0x1, 0x570(%rbp)
1401b479b:     	movq	$0x0, 0x574(%rbp)
1401b47a6:     	movb	$0x1, 0x57c(%rbp)
1401b47ad:     	movq	$0x0, 0x580(%rbp)
1401b47b8:     	movl	$0x3f800000, 0x588(%rbp) # imm = 0x3F800000
1401b47c2:     	movw	$0x0, 0x58c(%rbp)
1401b47cb:     	movw	$0x0, 0x592(%rbp)
1401b47d4:     	movl	$0x10000, 0x58e(%rbp)   # imm = 0x10000
1401b47de:     	movw	$0x0, 0x598(%rbp)
1401b47e7:     	movl	$0x10000, 0x594(%rbp)   # imm = 0x10000
1401b47f1:     	movl	$0x0, 0x59a(%rbp)
1401b47fb:     	movabsq	$0x700000001, %rax      # imm = 0x700000001
1401b4805:     	movq	%rax, 0x59e(%rbp)
1401b480c:     	movq	%r13, 0x420(%rbp)
1401b4813:     	movb	$0x0, 0x677(%rbp)
1401b481a:     	leaq	0x1f8(%rbp), %rcx
1401b4821:     	leaq	0x420(%rbp), %r8
1401b4828:     	movq	%rdi, %rdx
1401b482b:     	callq	0x140189f40 <.text+0x188f40>
1401b4830:     	nop
1401b4831:     	movaps	%xmm12, %xmm14
1401b4835:     	movq	0x1f8(%rbp), %rcx
1401b483c:     	movq	0x220(%rbp), %rax
1401b4843:     	movq	%rcx, 0x3a0(%rbp)
1401b484a:     	movq	%rcx, 0x318(%rbp)
1401b4851:     	leaq	0x320(%rbp), %r13
1401b4858:     	movups	0x200(%rbp), %xmm0
1401b485f:     	movups	%xmm0, 0x320(%rbp)
1401b4866:     	movups	0x210(%rbp), %xmm0
1401b486d:     	movups	%xmm0, 0x330(%rbp)
1401b4874:     	movq	%rax, 0x340(%rbp)
1401b487b:     	movq	0x668(%rbp), %rax
1401b4882:     	leaq	(%rax,%rax,2), %rax
1401b4886:     	movq	0x658(%rbp), %rdi
1401b488d:     	leaq	(%rdi,%rax,8), %rax
1401b4891:     	leaq	0x480(%rbp), %rbx
1401b4898:     	movaps	0x5bb8a00(%rip), %xmm10 # 0x145d6d2a0
1401b48a0:     	movaps	0x5bb89e8(%rip), %xmm11 # 0x145d6d290
1401b48a8:     	movaps	0x5bb8be0(%rip), %xmm12 # 0x145d6d490
1401b48b0:     	leaq	0x380(%rbp), %r12
1401b48b7:     	movups	0x5c04079(%rip), %xmm13 # 0x145db8938
1401b48bf:     	movq	%rax, 0x3a8(%rbp)
1401b48c6:     	cmpq	%rax, %rdi
1401b48c9:     	je	0x1401b4e9f <.text+0x1b3e9f>
1401b48cf:     	movzbl	(%rdi), %r15d
1401b48d3:     	cmpb	$-0x1, %r15b
1401b48d7:     	je	0x1401b4e9f <.text+0x1b3e9f>
1401b48dd:     	movq	0x8(%rdi), %rax
1401b48e1:     	movq	%rax, 0x638(%rbp)
1401b48e8:     	movq	0x10(%rdi), %rax
1401b48ec:     	movq	%rax, 0x668(%rbp)
1401b48f3:     	movw	$0x0, 0x584(%rbp)
1401b48fc:     	movb	$0x1, 0x574(%rbp)
1401b4903:     	movups	%xmm7, 0x40(%rbx)
1401b4907:     	movups	%xmm7, 0x30(%rbx)
1401b490b:     	movups	%xmm7, 0x20(%rbx)
1401b490f:     	movups	%xmm7, 0x10(%rbx)
1401b4913:     	movups	%xmm7, (%rbx)
1401b4916:     	movq	$0x0, 0x50(%rbx)
1401b491e:     	movb	$0x0, 0x11c(%rbx)
1401b4925:     	movl	$0x0, 0x118(%rbx)
1401b492f:     	movb	$0x5, 0x59d(%rbp)
1401b4936:     	movups	%xmm14, 0x68(%rbx)
1401b493b:     	movups	%xmm13, 0x58(%rbx)
1401b4940:     	movaps	0x5be9509(%rip), %xmm0  # 0x145d9de50
1401b4947:     	movups	%xmm0, 0x4f8(%rbp)
1401b494e:     	movups	%xmm10, 0x508(%rbp)
1401b4956:     	movups	%xmm11, 0x518(%rbp)
1401b495e:     	movups	%xmm11, 0x528(%rbp)
1401b4966:     	movups	%xmm12, 0x538(%rbp)
1401b496e:     	movups	%xmm12, 0x548(%rbp)
1401b4976:     	movw	$0x0, 0x596(%rbp)
1401b497f:     	movl	$0x0, 0x592(%rbp)
1401b4989:     	movq	$0x0, 0x578(%rbp)
1401b4994:     	movl	$0x3f800000, 0x580(%rbp) # imm = 0x3F800000
1401b499e:     	movaps	0x5bb88bb(%rip), %xmm0  # 0x145d6d260
1401b49a5:     	movups	%xmm0, 0x558(%rbp)
1401b49ac:     	movl	$0x1, 0x568(%rbp)
1401b49b6:     	movq	$0x0, 0x56c(%rbp)
1401b49c1:     	movaps	%xmm6, 0x420(%rbp)
1401b49c8:     	movq	$0x0, 0x430(%rbp)
1401b49d3:     	movups	%xmm15, -0x48(%rbx)
1401b49d8:     	movq	$0x0, -0x38(%rbx)
1401b49e0:     	movups	%xmm8, -0x30(%rbx)
1401b49e5:     	movq	$0x0, -0x20(%rbx)
1401b49ed:     	movups	%xmm9, -0x18(%rbx)
1401b49f2:     	movq	$0x0, -0x8(%rbx)
1401b49fa:     	movl	$0x10000, 0x106(%rbx)   # imm = 0x10000
1401b4a04:     	movw	$0x0, 0x10a(%rbx)
1401b4a0d:     	movw	$0x0, 0x110(%rbx)
1401b4a16:     	movl	$0x10000, 0x10c(%rbx)   # imm = 0x10000
1401b4a20:     	leaq	0x3b0(%rbp), %rcx
1401b4a27:     	callq	0x140012180 <.text+0x11180>
1401b4a2c:     	nop
1401b4a2d:     	movups	0x5c040fc(%rip), %xmm0  # 0x145db8b30
1401b4a34:     	movaps	%xmm0, 0x360(%rbp)
1401b4a3b:     	movl	$0x3f59999a, 0x370(%rbp) # imm = 0x3F59999A
1401b4a45:     	movq	%r12, %r14
1401b4a48:     	movq	%r12, %rcx
1401b4a4b:     	leaq	0x360(%rbp), %rdx
1401b4a52:     	callq	0x144c67100 <.text+0x4c66100>
1401b4a57:     	nop
1401b4a58:     	movaps	0x380(%rbp), %xmm0
1401b4a5f:     	movups	%xmm0, 0x350(%rbp)
1401b4a66:     	movl	$0x1, 0x34c(%rbp)
1401b4a70:     	movl	$0x40c00000, 0x48(%rsp) # imm = 0x40C00000
1401b4a78:     	movl	$0x1, 0x40(%rsp)
1401b4a80:     	movl	$0x0, 0x38(%rsp)
1401b4a88:     	movl	$0x1, 0x30(%rsp)
1401b4a90:     	movl	$0x40000000, 0x28(%rsp) # imm = 0x40000000
1401b4a98:     	movl	$0x1, 0x20(%rsp)
1401b4aa0:     	xorps	%xmm3, %xmm3
1401b4aa3:     	movq	%r14, %rcx
1401b4aa6:     	leaq	0x34c(%rbp), %rdx
1401b4aad:     	movl	$0x1, %r8d
1401b4ab3:     	callq	0x142633750 <.text+0x2632750>
1401b4ab8:     	nop
1401b4ab9:     	movl	$0x180, %r8d            # imm = 0x180
1401b4abf:     	leaq	-0x30(%rbp), %r14
1401b4ac3:     	movq	%r14, %rcx
1401b4ac6:     	leaq	0x420(%rbp), %rsi
1401b4acd:     	movq	%rsi, %rdx
1401b4ad0:     	callq	0x145bc977b <.text+0x5bc877b>
1401b4ad5:     	movq	0x410(%rbp), %rax
1401b4adc:     	leaq	0x150(%rbp), %rcx
1401b4ae3:     	movq	%rax, 0x60(%rcx)
1401b4ae7:     	movups	0x400(%rbp), %xmm0
1401b4aee:     	movups	%xmm0, 0x50(%rcx)
1401b4af2:     	movups	0x3f0(%rbp), %xmm0
1401b4af9:     	movups	%xmm0, 0x40(%rcx)
1401b4afd:     	movups	0x3b0(%rbp), %xmm0
1401b4b04:     	movups	0x3c0(%rbp), %xmm1
1401b4b0b:     	movups	0x3d0(%rbp), %xmm2
1401b4b12:     	movups	0x3e0(%rbp), %xmm3
1401b4b19:     	movups	%xmm3, 0x30(%rcx)
1401b4b1d:     	movups	%xmm2, 0x20(%rcx)
1401b4b21:     	movups	%xmm1, 0x10(%rcx)
1401b4b25:     	movups	%xmm0, (%rcx)
1401b4b28:     	movq	0x390(%rbp), %rax
1401b4b2f:     	leaq	0x1e0(%rbp), %rcx
1401b4b36:     	movq	%rax, 0x10(%rcx)
1401b4b3a:     	movups	0x380(%rbp), %xmm0
1401b4b41:     	movups	%xmm0, (%rcx)
1401b4b44:     	movl	$0x1e8, %r8d            # imm = 0x1E8
1401b4b4a:     	leaq	0x428(%rbp), %rcx
1401b4b51:     	movq	%r14, %rdx
1401b4b54:     	callq	0x145bc977b <.text+0x5bc877b>
1401b4b59:     	movb	$0x2, 0x610(%rbp)
1401b4b60:     	movb	%r15b, 0x611(%rbp)
1401b4b67:     	movups	0x1da(%rbp), %xmm0
1401b4b6e:     	movups	0x1e8(%rbp), %xmm1
1401b4b75:     	movups	%xmm0, 0x192(%rbx)
1401b4b7c:     	movups	%xmm1, 0x1a0(%rbx)
1401b4b83:     	movq	0x3a0(%rbp), %rax
1401b4b8a:     	movq	%rax, 0x420(%rbp)
1401b4b91:     	leaq	0x3b0(%rbp), %rcx
1401b4b98:     	movq	%r13, %rdx
1401b4b9b:     	movq	%rsi, %r8
1401b4b9e:     	callq	0x1401901b0 <.text+0x18f1b0>
1401b4ba3:     	nop
1401b4ba4:     	cmpb	$0x2, %r15b
1401b4ba8:     	movq	0x668(%rbp), %r14
1401b4baf:     	jne	0x1401b4c50 <.text+0x1b3c50>
1401b4bb5:     	testq	%r14, %r14
1401b4bb8:     	js	0x1401b4e8e <.text+0x1b3e8e>
1401b4bbe:     	je	0x1401b4cc6 <.text+0x1b3cc6>
1401b4bc4:     	callq	0x140002200 <.text+0x1200>
1401b4bc9:     	movl	$0x1, %r15d
1401b4bcf:     	movl	$0x1, %edx
1401b4bd4:     	movq	%r14, %rcx
1401b4bd7:     	callq	0x1400021c0 <.text+0x11c0>
1401b4bdc:     	testq	%rax, %rax
1401b4bdf:     	je	0x1401b4e91 <.text+0x1b3e91>
1401b4be5:     	movq	%rax, 0x660(%rbp)
1401b4bec:     	movq	%rax, %rcx
1401b4bef:     	movq	0x638(%rbp), %rdx
1401b4bf6:     	movq	%r14, %r8
1401b4bf9:     	callq	0x145bc977b <.text+0x5bc877b>
1401b4bfe:     	movq	0x3b0(%rbp), %rsi
1401b4c05:     	movq	0x3c8(%rbp), %r13
1401b4c0c:     	testq	%r13, %r13
1401b4c0f:     	je	0x1401b4ce9 <.text+0x1b3ce9>
1401b4c15:     	movq	(%r13), %rax
1401b4c19:     	movq	0x10(%r13), %r15
1401b4c1d:     	subq	%r15, %rax
1401b4c20:     	cmpq	$0x37, %rax
1401b4c24:     	ja	0x1401b4d05 <.text+0x1b3d05>
1401b4c2a:     	movq	$0x1, 0x20(%rsp)
1401b4c33:     	movl	$0x38, %r8d
1401b4c39:     	movl	$0x1, %r9d
1401b4c3f:     	movq	%r13, %rcx
1401b4c42:     	movq	%r15, %rdx
1401b4c45:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1401b4c4a:     	nop
1401b4c4b:     	jmp	0x1401b4d05 <.text+0x1b3d05>
1401b4c50:     	testq	%r14, %r14
1401b4c53:     	movq	0x650(%rbp), %rax
1401b4c5a:     	js	0x1401b4e7d <.text+0x1b3e7d>
1401b4c60:     	movq	(%rax), %rsi
1401b4c63:     	testq	%r14, %r14
1401b4c66:     	je	0x1401b4d60 <.text+0x1b3d60>
1401b4c6c:     	callq	0x140002200 <.text+0x1200>
1401b4c71:     	movl	$0x1, %r15d
1401b4c77:     	movl	$0x1, %edx
1401b4c7c:     	movq	%r14, %rcx
1401b4c7f:     	callq	0x1400021c0 <.text+0x11c0>
1401b4c84:     	testq	%rax, %rax
1401b4c87:     	je	0x1401b4e80 <.text+0x1b3e80>
1401b4c8d:     	movq	%rax, %r13
1401b4c90:     	movq	%rax, %rcx
1401b4c93:     	movq	0x638(%rbp), %rdx
1401b4c9a:     	movq	%r14, %r8
1401b4c9d:     	callq	0x145bc977b <.text+0x5bc877b>
1401b4ca2:     	cmpb	$0x1, (%rsi)
1401b4ca5:     	jne	0x1401b4d6f <.text+0x1b3d6f>
1401b4cab:     	movl	0x1(%rsi), %eax
1401b4cae:     	movl	0x4(%rsi), %ecx
1401b4cb1:     	movl	%ecx, -0x2d(%rbp)
1401b4cb4:     	movl	%eax, -0x30(%rbp)
1401b4cb7:     	movq	0x8(%rsi), %rax
1401b4cbb:     	movzbl	0x10(%rsi), %ecx
1401b4cbf:     	movb	$0x1, %dl
1401b4cc1:     	jmp	0x1401b4d7f <.text+0x1b3d7f>
1401b4cc6:     	movl	$0x1, %eax
1401b4ccb:     	movq	%rax, 0x660(%rbp)
1401b4cd2:     	movq	0x3b0(%rbp), %rsi
1401b4cd9:     	movq	0x3c8(%rbp), %r13
1401b4ce0:     	testq	%r13, %r13
1401b4ce3:     	jne	0x1401b4c15 <.text+0x1b3c15>
1401b4ce9:     	movq	0x3d0(%rbp), %r13
1401b4cf0:     	movq	(%r13), %rax
1401b4cf4:     	movq	0x10(%r13), %r15
1401b4cf8:     	subq	%r15, %rax
1401b4cfb:     	cmpq	$0x37, %rax
1401b4cff:     	jbe	0x1401b4e57 <.text+0x1b3e57>
1401b4d05:     	movq	0x8(%r13), %rax
1401b4d09:     	leaq	0x76970(%rip), %rcx     # 0x14022b680 <.text+0x22a680>
1401b4d10:     	movq	%rcx, (%rax,%r15)
1401b4d14:     	movq	0x668(%rbp), %r14
1401b4d1b:     	movq	%r14, 0x8(%rax,%r15)
1401b4d20:     	movq	0x660(%rbp), %rcx
1401b4d27:     	movq	%rcx, 0x10(%rax,%r15)
1401b4d2c:     	movq	%r14, 0x18(%rax,%r15)
1401b4d31:     	movl	$0x0, 0x20(%rax,%r15)
1401b4d3a:     	movb	$0x0, 0x28(%rax,%r15)
1401b4d40:     	movq	%rsi, 0x30(%rax,%r15)
1401b4d45:     	addq	$0x38, %r15
1401b4d49:     	movq	%r15, 0x10(%r13)
1401b4d4d:     	movq	0x650(%rbp), %rax
1401b4d54:     	movq	(%rax), %rsi
1401b4d57:     	testq	%r14, %r14
1401b4d5a:     	jne	0x1401b4c6c <.text+0x1b3c6c>
1401b4d60:     	movl	$0x1, %r13d
1401b4d66:     	cmpb	$0x1, (%rsi)
1401b4d69:     	je	0x1401b4cab <.text+0x1b3cab>
1401b4d6f:     	movq	0x8(%rsi), %rax
1401b4d73:     	lock
1401b4d74:     	incq	(%rax)
1401b4d77:     	jle	0x1401b4e9d <.text+0x1b3e9d>
1401b4d7d:     	xorl	%edx, %edx
1401b4d7f:     	movq	%r14, 0x420(%rbp)
1401b4d86:     	movq	%r13, 0x428(%rbp)
1401b4d8d:     	movq	%r14, 0x430(%rbp)
1401b4d94:     	movq	$0x0, 0x438(%rbp)
1401b4d9f:     	movq	$0x4, 0x440(%rbp)
1401b4daa:     	movq	$0x0, 0x448(%rbp)
1401b4db5:     	movb	%dl, 0x450(%rbp)
1401b4dbb:     	movl	-0x30(%rbp), %edx
1401b4dbe:     	movl	-0x2d(%rbp), %r8d
1401b4dc2:     	movl	%r8d, -0x2c(%rbx)
1401b4dc6:     	movl	%edx, -0x2f(%rbx)
1401b4dc9:     	movq	%rax, 0x458(%rbp)
1401b4dd0:     	movq	%rcx, 0x460(%rbp)
1401b4dd7:     	movl	$0x41880000, 0x468(%rbp) # imm = 0x41880000
1401b4de1:     	movw	$0x190, 0x46c(%rbp)     # imm = 0x190
1401b4dea:     	movb	$0x1, 0x46e(%rbp)
1401b4df1:     	movups	0x5c03a00(%rip), %xmm0  # 0x145db87f8
1401b4df8:     	movups	%xmm0, -0x10(%rbx)
1401b4dfc:     	movl	$0x3f800000, (%rbx)     # imm = 0x3F800000
1401b4e02:     	movups	0x5bb94cf(%rip), %xmm0  # 0x145d6e2d8
1401b4e09:     	movups	%xmm0, 0x4(%rbx)
1401b4e0d:     	movl	0x5bb94d5(%rip), %eax   # 0x145d6e2e8
1401b4e13:     	movl	%eax, 0x14(%rbx)
1401b4e16:     	movsd	0x5bb83b2(%rip), %xmm0  # 0x145d6d1d0
1401b4e1e:     	movsd	%xmm0, 0x498(%rbp)
1401b4e26:     	leaq	0x3b0(%rbp), %rcx
1401b4e2d:     	leaq	0x420(%rbp), %rdx
1401b4e34:     	callq	0x1401a4e60 <.text+0x1a3e60>
1401b4e39:     	nop
1401b4e3a:     	leaq	0x320(%rbp), %r13
1401b4e41:     	addq	$0x18, %rdi
1401b4e45:     	movq	0x3a8(%rbp), %rax
1401b4e4c:     	cmpq	%rax, %rdi
1401b4e4f:     	jne	0x1401b48cf <.text+0x1b38cf>
1401b4e55:     	jmp	0x1401b4e9f <.text+0x1b3e9f>
1401b4e57:     	movq	$0x1, 0x20(%rsp)
1401b4e60:     	movl	$0x38, %r8d
1401b4e66:     	movl	$0x1, %r9d
1401b4e6c:     	movq	%r13, %rcx
1401b4e6f:     	movq	%r15, %rdx
1401b4e72:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1401b4e77:     	nop
1401b4e78:     	jmp	0x1401b4d05 <.text+0x1b3d05>
1401b4e7d:     	xorl	%r15d, %r15d
1401b4e80:     	movq	%r15, %rcx
1401b4e83:     	movq	%r14, %rdx
1401b4e86:     	callq	0x145d6944b <.text+0x5d6844b>
1401b4e8b:     	nop
1401b4e8c:     	jmp	0x1401b4e9d <.text+0x1b3e9d>
1401b4e8e:     	xorl	%r15d, %r15d
1401b4e91:     	movq	%r15, %rcx
1401b4e94:     	movq	%r14, %rdx
1401b4e97:     	callq	0x145d6944b <.text+0x5d6844b>
1401b4e9c:     	nop
1401b4e9d:     	ud2
1401b4e9f:     	movq	0x648(%rbp), %rax
1401b4ea6:     	testq	%rax, %rax
1401b4ea9:     	je	0x1401b4ec5 <.text+0x1b3ec5>
1401b4eab:     	shlq	$0x3, %rax
1401b4eaf:     	leaq	(%rax,%rax,2), %rdx
1401b4eb3:     	movl	$0x8, %r8d
1401b4eb9:     	movq	0x658(%rbp), %rcx
1401b4ec0:     	callq	0x1400021d0 <.text+0x11d0>
1401b4ec5:     	movq	0x398(%rbp), %rax
1401b4ecc:     	movaps	0x680(%rbp), %xmm6
1401b4ed3:     	movaps	0x690(%rbp), %xmm7
1401b4eda:     	movaps	0x6a0(%rbp), %xmm8
1401b4ee2:     	movaps	0x6b0(%rbp), %xmm9
1401b4eea:     	movaps	0x6c0(%rbp), %xmm10
1401b4ef2:     	movaps	0x6d0(%rbp), %xmm11
1401b4efa:     	movaps	0x6e0(%rbp), %xmm12
1401b4f02:     	movaps	0x6f0(%rbp), %xmm13
1401b4f0a:     	movaps	0x700(%rbp), %xmm14
1401b4f12:     	movaps	0x710(%rbp), %xmm15
1401b4f1a:     	addq	$0x7a8, %rsp            # imm = 0x7A8
1401b4f21:     	popq	%rbx
1401b4f22:     	popq	%rdi
1401b4f23:     	popq	%rsi
1401b4f24:     	popq	%r12
1401b4f26:     	popq	%r13
1401b4f28:     	popq	%r14
1401b4f2a:     	popq	%r15
1401b4f2c:     	popq	%rbp
1401b4f2d:     	retq
