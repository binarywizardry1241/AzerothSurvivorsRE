
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140223fb0:     	pushq	%rsi
140223fb1:     	pushq	%rdi
140223fb2:     	pushq	%rbx
140223fb3:     	subq	$0x2f0, %rsp            # imm = 0x2F0
140223fba:     	movq	%rcx, %rsi
140223fbd:     	movq	(%rcx), %rbx
140223fc0:     	movq	0x28(%rcx), %rax
140223fc4:     	movq	%rbx, 0x80(%rsp)
140223fcc:     	leaq	0x88(%rsp), %rdi
140223fd4:     	movups	0x8(%rcx), %xmm0
140223fd8:     	movups	%xmm0, 0x88(%rsp)
140223fe0:     	movups	0x18(%rcx), %xmm0
140223fe4:     	movups	%xmm0, 0x98(%rsp)
140223fec:     	movq	%rax, 0xa8(%rsp)
140223ff4:     	movups	0x56cf5e5(%rip), %xmm0  # 0x1458f35e0
140223ffb:     	movaps	%xmm0, 0x20(%rsp)
140224000:     	movq	$0x0, 0x30(%rsp)
140224009:     	movups	0x56cf5e8(%rip), %xmm1  # 0x1458f35f8
140224010:     	movups	%xmm1, 0x38(%rsp)
140224015:     	movq	$0x0, 0x48(%rsp)
14022401e:     	movups	0x56cf5eb(%rip), %xmm1  # 0x1458f3610
140224025:     	movaps	%xmm1, 0x50(%rsp)
14022402a:     	movq	$0x0, 0x60(%rsp)
140224033:     	movups	0x56cf5ee(%rip), %xmm2  # 0x1458f3628
14022403a:     	movups	%xmm2, 0x68(%rsp)
14022403f:     	movq	$0x0, 0x78(%rsp)
140224048:     	movaps	%xmm0, 0xb0(%rsp)
140224050:     	movq	0x30(%rsp), %rax
140224055:     	movq	%rax, 0xc0(%rsp)
14022405d:     	movq	0x38(%rsp), %rax
140224062:     	movq	%rax, 0xc8(%rsp)
14022406a:     	movq	0x40(%rsp), %rax
14022406f:     	movq	%rax, 0xd0(%rsp)
140224077:     	movq	0x48(%rsp), %rax
14022407c:     	movq	%rax, 0xd8(%rsp)
140224084:     	movaps	%xmm1, 0xe0(%rsp)
14022408c:     	movq	0x60(%rsp), %rax
140224091:     	movq	%rax, 0xf0(%rsp)
140224099:     	movq	0x68(%rsp), %rax
14022409e:     	movq	%rax, 0xf8(%rsp)
1402240a6:     	movaps	0x70(%rsp), %xmm0
1402240ab:     	movaps	%xmm0, 0x100(%rsp)
1402240b3:     	xorps	%xmm0, %xmm0
1402240b6:     	movaps	%xmm0, 0x120(%rsp)
1402240be:     	movaps	%xmm0, 0x110(%rsp)
1402240c6:     	movq	$0x0, 0x130(%rsp)
1402240d2:     	movups	%xmm0, 0x1e8(%rsp)
1402240da:     	movups	%xmm0, 0x1d8(%rsp)
1402240e2:     	movq	$0x0, 0x2b4(%rsp)
1402240ee:     	movw	$0x0, 0x2bc(%rsp)
1402240f8:     	leaq	0x140(%rsp), %rcx
140224100:     	leaq	0xb0(%rsp), %rdx
140224108:     	movl	$0x88, %r8d
14022410e:     	callq	0x1457149fd <.text+0x57139fd>
140224113:     	movaps	0x56cf2d6(%rip), %xmm0  # 0x1458f33f0
14022411a:     	movups	%xmm0, 0x1c8(%rsp)
140224122:     	movups	0x56cf56f(%rip), %xmm0  # 0x1458f3698
140224129:     	movups	%xmm0, 0x1f8(%rsp)
140224131:     	movups	0x56cf570(%rip), %xmm0  # 0x1458f36a8
140224138:     	movups	%xmm0, 0x208(%rsp)
140224140:     	movups	0x56cf571(%rip), %xmm0  # 0x1458f36b8
140224147:     	movups	%xmm0, 0x218(%rsp)
14022414f:     	movups	0x56cf572(%rip), %xmm0  # 0x1458f36c8
140224156:     	movups	%xmm0, 0x228(%rsp)
14022415e:     	movups	0x56cf573(%rip), %xmm0  # 0x1458f36d8
140224165:     	movups	%xmm0, 0x238(%rsp)
14022416d:     	movups	0x56cf574(%rip), %xmm0  # 0x1458f36e8
140224174:     	movups	%xmm0, 0x248(%rsp)
14022417c:     	movups	0x56cf585(%rip), %xmm0  # 0x1458f3708
140224183:     	movups	%xmm0, 0x268(%rsp)
14022418b:     	movups	0x56cf566(%rip), %xmm0  # 0x1458f36f8
140224192:     	movups	%xmm0, 0x258(%rsp)
14022419a:     	movaps	0x568406f(%rip), %xmm0  # 0x1458a8210
1402241a1:     	movups	%xmm0, 0x278(%rsp)
1402241a9:     	movl	$0x1, 0x288(%rsp)
1402241b4:     	movq	$0x0, 0x28c(%rsp)
1402241c0:     	movb	$0x1, 0x294(%rsp)
1402241c8:     	movq	$0x0, 0x298(%rsp)
1402241d4:     	movl	$0x3f800000, 0x2a0(%rsp) # imm = 0x3F800000
1402241df:     	movw	$0x0, 0x2a4(%rsp)
1402241e9:     	movl	$0x10000, 0x2a6(%rsp)   # imm = 0x10000
1402241f4:     	movw	$0x0, 0x2aa(%rsp)
1402241fe:     	movabsq	$0x100000000010000, %rax # imm = 0x100000000010000
140224208:     	movq	%rax, 0x2ac(%rsp)
140224210:     	movsd	0x56cf1e8(%rip), %xmm0  # 0x1458f3400
140224218:     	movsd	%xmm0, 0x2c0(%rsp)
140224221:     	movl	$0x3fb33333, 0x2c8(%rsp) # imm = 0x3FB33333
14022422c:     	movups	0x56cf785(%rip), %xmm0  # 0x1458f39b8
140224233:     	movups	%xmm0, 0x2cc(%rsp)
14022423b:     	movups	0x56cf786(%rip), %xmm0  # 0x1458f39c8
140224242:     	movups	%xmm0, 0x2dc(%rsp)
14022424a:     	movq	%rbx, 0x138(%rsp)
140224252:     	leaq	0x20(%rsp), %rcx
140224257:     	leaq	0x138(%rsp), %r8
14022425f:     	movq	%rdi, %rdx
140224262:     	callq	0x1401b2bb0 <.text+0x1b1bb0>
140224267:     	movq	%rsi, %rax
14022426a:     	addq	$0x2f0, %rsp            # imm = 0x2F0
140224271:     	popq	%rbx
140224272:     	popq	%rdi
140224273:     	popq	%rsi
140224274:     	retq
