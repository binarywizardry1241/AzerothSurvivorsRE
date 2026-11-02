
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400c7f20:     	pushq	%rbp
1400c7f21:     	pushq	%rsi
1400c7f22:     	pushq	%rdi
1400c7f23:     	pushq	%rbx
1400c7f24:     	subq	$0x208, %rsp            # imm = 0x208
1400c7f2b:     	leaq	0x80(%rsp), %rbp
1400c7f33:     	movaps	%xmm7, 0x170(%rbp)
1400c7f3a:     	movaps	%xmm6, 0x160(%rbp)
1400c7f41:     	movq	$-0x2, 0x158(%rbp)
1400c7f4c:     	movq	%r8, %rdi
1400c7f4f:     	movq	%rcx, %rsi
1400c7f52:     	movzwl	0x164(%rdx), %eax
1400c7f59:     	movw	%ax, 0x104(%rbp)
1400c7f60:     	movzbl	0x154(%rdx), %eax
1400c7f67:     	movb	%al, 0xf4(%rbp)
1400c7f6d:     	movl	0x68(%rdx), %eax
1400c7f70:     	movss	0x6c(%rdx), %xmm0
1400c7f75:     	movl	%eax, 0x8(%rbp)
1400c7f78:     	movss	%xmm0, 0xc(%rbp)
1400c7f7d:     	movl	0x70(%rdx), %eax
1400c7f80:     	movss	0x74(%rdx), %xmm0
1400c7f85:     	movl	%eax, 0x10(%rbp)
1400c7f88:     	movss	%xmm0, 0x14(%rbp)
1400c7f8d:     	movl	0x78(%rdx), %eax
1400c7f90:     	movss	0x7c(%rdx), %xmm0
1400c7f95:     	movl	%eax, 0x18(%rbp)
1400c7f98:     	movss	%xmm0, 0x1c(%rbp)
1400c7f9d:     	movl	0x80(%rdx), %eax
1400c7fa3:     	movss	0x84(%rdx), %xmm0
1400c7fab:     	movl	%eax, 0x20(%rbp)
1400c7fae:     	movss	%xmm0, 0x24(%rbp)
1400c7fb3:     	movl	0x88(%rdx), %eax
1400c7fb9:     	movss	0x8c(%rdx), %xmm0
1400c7fc1:     	movl	%eax, 0x28(%rbp)
1400c7fc4:     	movss	%xmm0, 0x2c(%rbp)
1400c7fc9:     	movabsq	$0x3f80000000000001, %rax # imm = 0x3F80000000000001
1400c7fd3:     	movq	%rax, 0x30(%rbp)
1400c7fd7:     	movl	0x98(%rdx), %eax
1400c7fdd:     	movss	0x9c(%rdx), %xmm0
1400c7fe5:     	movl	%eax, 0x38(%rbp)
1400c7fe8:     	movss	%xmm0, 0x3c(%rbp)
1400c7fed:     	movl	0xa0(%rdx), %eax
1400c7ff3:     	movss	0xa4(%rdx), %xmm0
1400c7ffb:     	movl	%eax, 0x40(%rbp)
1400c7ffe:     	movss	%xmm0, 0x44(%rbp)
1400c8003:     	movl	0xa8(%rdx), %eax
1400c8009:     	movss	0xac(%rdx), %xmm0
1400c8011:     	movl	%eax, 0x48(%rbp)
1400c8014:     	movss	%xmm0, 0x4c(%rbp)
1400c8019:     	movl	0xb0(%rdx), %eax
1400c801f:     	movss	0xb4(%rdx), %xmm0
1400c8027:     	movl	%eax, 0x50(%rbp)
1400c802a:     	movss	%xmm0, 0x54(%rbp)
1400c802f:     	movl	0x60(%rdx), %eax
1400c8032:     	movss	0x64(%rdx), %xmm0
1400c8037:     	movl	%eax, (%rbp)
1400c803a:     	movss	%xmm0, 0x4(%rbp)
1400c803f:     	movl	0x17a(%rdx), %eax
1400c8045:     	movl	%eax, 0x11a(%rbp)
1400c804b:     	movups	0xb8(%rdx), %xmm0
1400c8052:     	movups	0xc8(%rdx), %xmm1
1400c8059:     	movups	%xmm1, 0x68(%rbp)
1400c805d:     	movups	%xmm0, 0x58(%rbp)
1400c8061:     	movups	0xd8(%rdx), %xmm0
1400c8068:     	movups	0xe8(%rdx), %xmm1
1400c806f:     	movups	%xmm1, 0x88(%rbp)
1400c8076:     	movups	%xmm0, 0x78(%rbp)
1400c807a:     	movups	0xf8(%rdx), %xmm0
1400c8081:     	movups	0x108(%rdx), %xmm1
1400c8088:     	movups	%xmm1, 0xa8(%rbp)
1400c808f:     	movups	%xmm0, 0x98(%rbp)
1400c8096:     	movups	0x118(%rdx), %xmm0
1400c809d:     	movups	0x128(%rdx), %xmm1
1400c80a4:     	movups	%xmm1, 0xc8(%rbp)
1400c80ab:     	movups	%xmm0, 0xb8(%rbp)
1400c80b2:     	movsd	0x158(%rdx), %xmm0
1400c80ba:     	movsd	%xmm0, 0xf8(%rbp)
1400c80c2:     	movss	0x160(%rdx), %xmm0
1400c80ca:     	movss	%xmm0, 0x100(%rbp)
1400c80d2:     	movl	0x138(%rdx), %eax
1400c80d8:     	movss	0x13c(%rdx), %xmm0
1400c80e0:     	movl	%eax, 0xd8(%rbp)
1400c80e6:     	movss	%xmm0, 0xdc(%rbp)
1400c80ee:     	movl	0x140(%rdx), %eax
1400c80f4:     	movss	0x144(%rdx), %xmm0
1400c80fc:     	movl	%eax, 0xe0(%rbp)
1400c8102:     	movss	%xmm0, 0xe4(%rbp)
1400c810a:     	movl	0x148(%rdx), %eax
1400c8110:     	movl	%eax, 0xe8(%rbp)
1400c8116:     	movsd	0x14c(%rdx), %xmm0
1400c811e:     	movsd	%xmm0, 0xec(%rbp)
1400c8126:     	movq	0x172(%rdx), %rax
1400c812d:     	movq	%rax, 0x112(%rbp)
1400c8134:     	movq	0x10(%rdx), %rax
1400c8138:     	movq	%rax, -0x50(%rbp)
1400c813c:     	movups	(%rdx), %xmm0
1400c813f:     	movaps	%xmm0, -0x60(%rbp)
1400c8143:     	movq	0x28(%rdx), %rax
1400c8147:     	movq	%rax, -0x38(%rbp)
1400c814b:     	movups	0x18(%rdx), %xmm0
1400c814f:     	movups	%xmm0, -0x48(%rbp)
1400c8153:     	movq	0x40(%rdx), %rax
1400c8157:     	movq	%rax, -0x20(%rbp)
1400c815b:     	movups	0x30(%rdx), %xmm0
1400c815f:     	movaps	%xmm0, -0x30(%rbp)
1400c8163:     	movq	0x58(%rdx), %rax
1400c8167:     	movq	%rax, -0x8(%rbp)
1400c816b:     	movups	0x48(%rdx), %xmm0
1400c816f:     	movups	%xmm0, -0x18(%rbp)
1400c8173:     	movl	0x166(%rdx), %eax
1400c8179:     	movl	%eax, 0x106(%rbp)
1400c817f:     	movzwl	0x16a(%rdx), %eax
1400c8186:     	movw	%ax, 0x10a(%rbp)
1400c818d:     	movl	0x16c(%rdx), %eax
1400c8193:     	movl	%eax, 0x10c(%rbp)
1400c8199:     	movzwl	0x170(%rdx), %eax
1400c81a0:     	movw	%ax, 0x110(%rbp)
1400c81a7:     	callq	0x140002200 <.text+0x1200>
1400c81ac:     	movl	$0x60, %ecx
1400c81b1:     	movl	$0x4, %edx
1400c81b6:     	callq	0x1400021c0 <.text+0x11c0>
1400c81bb:     	testq	%rax, %rax
1400c81be:     	je	0x1400c8334 <.text+0xc7334>
1400c81c4:     	movq	%rax, 0x150(%rbp)
1400c81cb:     	movups	(%rdi), %xmm0
1400c81ce:     	movaps	%xmm0, 0x130(%rbp)
1400c81d5:     	movl	$0x0, 0x140(%rbp)
1400c81df:     	leaq	0x120(%rbp), %rcx
1400c81e6:     	leaq	0x130(%rbp), %rdx
1400c81ed:     	callq	0x144c79aa0 <.text+0x4c78aa0>
1400c81f2:     	nop
1400c81f3:     	movaps	0x120(%rbp), %xmm6
1400c81fa:     	movl	0x10(%rdi), %eax
1400c81fd:     	movl	%eax, 0x140(%rbp)
1400c8203:     	movups	(%rdi), %xmm0
1400c8206:     	movaps	%xmm0, 0x130(%rbp)
1400c820d:     	leaq	0x120(%rbp), %rcx
1400c8214:     	leaq	0x130(%rbp), %rdx
1400c821b:     	callq	0x144c79aa0 <.text+0x4c78aa0>
1400c8220:     	nop
1400c8221:     	movaps	0x120(%rbp), %xmm7
1400c8228:     	movups	(%rdi), %xmm0
1400c822b:     	movaps	%xmm0, 0x130(%rbp)
1400c8232:     	movl	$0x0, 0x140(%rbp)
1400c823c:     	leaq	0x120(%rbp), %rcx
1400c8243:     	leaq	0x130(%rbp), %rdx
1400c824a:     	callq	0x144c79aa0 <.text+0x4c78aa0>
1400c824f:     	nop
1400c8250:     	movaps	0x120(%rbp), %xmm0
1400c8257:     	movq	0x150(%rbp), %rbx
1400c825e:     	movl	$0x0, (%rbx)
1400c8264:     	movl	$0x1, 0x8(%rbx)
1400c826b:     	movups	%xmm6, 0xc(%rbx)
1400c826f:     	movq	$0x3f000000, 0x1c(%rbx) # imm = 0x3F000000
1400c8277:     	movl	$0x1, 0x28(%rbx)
1400c827e:     	movups	%xmm7, 0x2c(%rbx)
1400c8282:     	movq	$0x3f000000, 0x3c(%rbx) # imm = 0x3F000000
1400c828a:     	movl	$0x1, 0x48(%rbx)
1400c8291:     	movups	%xmm0, 0x4c(%rbx)
1400c8295:     	movl	$0x3f000000, 0x5c(%rbx) # imm = 0x3F000000
1400c829c:     	callq	0x140002200 <.text+0x1200>
1400c82a1:     	movl	$0x48, %ecx
1400c82a6:     	movl	$0x8, %edx
1400c82ab:     	callq	0x1400021c0 <.text+0x11c0>
1400c82b0:     	testq	%rax, %rax
1400c82b3:     	je	0x1400c8346 <.text+0xc7346>
1400c82b9:     	movq	%rax, %rdi
1400c82bc:     	movq	$0x3, 0x8(%rax)
1400c82c4:     	movq	%rbx, 0x10(%rax)
1400c82c8:     	movq	$0x3, 0x18(%rax)
1400c82d0:     	movl	$0x3fc90fdb, 0x20(%rax) # imm = 0x3FC90FDB
1400c82d7:     	movb	$0x0, 0x24(%rax)
1400c82db:     	movabsq	$-0x8000000000000000, %rax # imm = 0x8000000000000000
1400c82e5:     	movq	%rax, (%rdi)
1400c82e8:     	leaq	-0x60(%rbp), %rdx
1400c82ec:     	movl	$0x180, %r8d            # imm = 0x180
1400c82f2:     	movq	%rsi, %rcx
1400c82f5:     	callq	0x145756ddd <.text+0x5755ddd>
1400c82fa:     	movq	$0x1, 0x180(%rsi)
1400c8305:     	movq	%rdi, 0x188(%rsi)
1400c830c:     	movq	$0x1, 0x190(%rsi)
1400c8317:     	movq	%rsi, %rax
1400c831a:     	movaps	0x160(%rbp), %xmm6
1400c8321:     	movaps	0x170(%rbp), %xmm7
1400c8328:     	addq	$0x208, %rsp            # imm = 0x208
1400c832f:     	popq	%rbx
1400c8330:     	popq	%rdi
1400c8331:     	popq	%rsi
1400c8332:     	popq	%rbp
1400c8333:     	retq
1400c8334:     	movl	$0x4, %ecx
1400c8339:     	movl	$0x60, %edx
1400c833e:     	callq	0x1458e7201 <.text+0x58e6201>
1400c8343:     	nop
1400c8344:     	jmp	0x1400c8356 <.text+0xc7356>
1400c8346:     	movl	$0x8, %ecx
1400c834b:     	movl	$0x48, %edx
1400c8350:     	callq	0x1458e7201 <.text+0x58e6201>
1400c8355:     	nop
1400c8356:     	ud2
