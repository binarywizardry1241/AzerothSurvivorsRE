Disassembly of section .text:

0000000140001000 <.text>:
140012c60:     	pushq	%rbp
140012c61:     	pushq	%rsi
140012c62:     	pushq	%rdi
140012c63:     	subq	$0x2b0, %rsp            # imm = 0x2B0
140012c6a:     	leaq	0x80(%rsp), %rbp
140012c72:     	movaps	%xmm6, 0x220(%rbp)
140012c79:     	movq	$-0x2, 0x218(%rbp)
140012c84:     	movq	%rcx, %rsi
140012c87:     	movzwl	0x164(%rdx), %eax
140012c8e:     	movw	%ax, 0x134(%rbp)
140012c95:     	movzbl	0x154(%rdx), %eax
140012c9c:     	movb	%al, 0x124(%rbp)
140012ca2:     	movl	0x68(%rdx), %eax
140012ca5:     	movss	0x6c(%rdx), %xmm0
140012caa:     	movl	%eax, 0x38(%rbp)
140012cad:     	movss	%xmm0, 0x3c(%rbp)
140012cb2:     	movl	0x70(%rdx), %eax
140012cb5:     	movss	0x74(%rdx), %xmm0
140012cba:     	movl	%eax, 0x40(%rbp)
140012cbd:     	movss	%xmm0, 0x44(%rbp)
140012cc2:     	movl	0x78(%rdx), %eax
140012cc5:     	movss	0x7c(%rdx), %xmm0
140012cca:     	movl	%eax, 0x48(%rbp)
140012ccd:     	movss	%xmm0, 0x4c(%rbp)
140012cd2:     	movl	0x80(%rdx), %eax
140012cd8:     	movss	0x84(%rdx), %xmm0
140012ce0:     	movl	%eax, 0x50(%rbp)
140012ce3:     	movss	%xmm0, 0x54(%rbp)
140012ce8:     	movl	0x88(%rdx), %eax
140012cee:     	movss	0x8c(%rdx), %xmm0
140012cf6:     	movl	%eax, 0x58(%rbp)
140012cf9:     	movss	%xmm0, 0x5c(%rbp)
140012cfe:     	movl	0x90(%rdx), %eax
140012d04:     	movss	0x94(%rdx), %xmm0
140012d0c:     	movl	%eax, 0x60(%rbp)
140012d0f:     	movss	%xmm0, 0x64(%rbp)
140012d14:     	movl	0x98(%rdx), %eax
140012d1a:     	movss	0x9c(%rdx), %xmm0
140012d22:     	movl	%eax, 0x68(%rbp)
140012d25:     	movss	%xmm0, 0x6c(%rbp)
140012d2a:     	movl	0xa0(%rdx), %eax
140012d30:     	movss	0xa4(%rdx), %xmm0
140012d38:     	movl	%eax, 0x70(%rbp)
140012d3b:     	movss	%xmm0, 0x74(%rbp)
140012d40:     	movl	0xa8(%rdx), %eax
140012d46:     	movss	0xac(%rdx), %xmm0
140012d4e:     	movl	%eax, 0x78(%rbp)
140012d51:     	movss	%xmm0, 0x7c(%rbp)
140012d56:     	movl	0xb0(%rdx), %eax
140012d5c:     	movss	0xb4(%rdx), %xmm0
140012d64:     	movl	%eax, 0x80(%rbp)
140012d6a:     	movss	%xmm0, 0x84(%rbp)
140012d72:     	movl	0x60(%rdx), %eax
140012d75:     	movss	0x64(%rdx), %xmm0
140012d7a:     	movl	%eax, 0x30(%rbp)
140012d7d:     	movss	%xmm0, 0x34(%rbp)
140012d82:     	movl	0x17a(%rdx), %eax
140012d88:     	movl	%eax, 0x14a(%rbp)
140012d8e:     	movups	0xb8(%rdx), %xmm0
140012d95:     	movups	0xc8(%rdx), %xmm1
140012d9c:     	movups	%xmm0, 0x88(%rbp)
140012da3:     	movups	%xmm1, 0x98(%rbp)
140012daa:     	movups	0xd8(%rdx), %xmm0
140012db1:     	movups	0xe8(%rdx), %xmm1
140012db8:     	movups	%xmm0, 0xa8(%rbp)
140012dbf:     	movups	%xmm1, 0xb8(%rbp)
140012dc6:     	movaps	0x5d5a4c3(%rip), %xmm0  # 0x145d6d290
140012dcd:     	movups	%xmm0, 0xc8(%rbp)
140012dd4:     	movups	%xmm0, 0xd8(%rbp)
140012ddb:     	movaps	0x5d5a4be(%rip), %xmm0  # 0x145d6d2a0
140012de2:     	movups	%xmm0, 0xe8(%rbp)
140012de9:     	movups	%xmm0, 0xf8(%rbp)
140012df0:     	movsd	0x158(%rdx), %xmm0
140012df8:     	movsd	%xmm0, 0x128(%rbp)
140012e00:     	movss	0x160(%rdx), %xmm0
140012e08:     	movss	%xmm0, 0x130(%rbp)
140012e10:     	movl	0x138(%rdx), %eax
140012e16:     	movss	0x13c(%rdx), %xmm0
140012e1e:     	movl	%eax, 0x108(%rbp)
140012e24:     	movss	%xmm0, 0x10c(%rbp)
140012e2c:     	movl	0x140(%rdx), %eax
140012e32:     	movss	0x144(%rdx), %xmm0
140012e3a:     	movl	%eax, 0x110(%rbp)
140012e40:     	movss	%xmm0, 0x114(%rbp)
140012e48:     	movl	0x148(%rdx), %eax
140012e4e:     	movl	%eax, 0x118(%rbp)
140012e54:     	movsd	0x14c(%rdx), %xmm0
140012e5c:     	movsd	%xmm0, 0x11c(%rbp)
140012e64:     	movq	0x172(%rdx), %rax
140012e6b:     	movq	%rax, 0x142(%rbp)
140012e72:     	movq	0x10(%rdx), %rax
140012e76:     	movq	%rax, -0x20(%rbp)
140012e7a:     	movups	(%rdx), %xmm0
140012e7d:     	movaps	%xmm0, -0x30(%rbp)
140012e81:     	movq	0x28(%rdx), %rax
140012e85:     	movq	%rax, -0x8(%rbp)
140012e89:     	movups	0x18(%rdx), %xmm0
140012e8d:     	movups	%xmm0, -0x18(%rbp)
140012e91:     	movq	0x40(%rdx), %rax
140012e95:     	movq	%rax, 0x10(%rbp)
140012e99:     	movups	0x30(%rdx), %xmm0
140012e9d:     	movaps	%xmm0, (%rbp)
140012ea1:     	movq	0x58(%rdx), %rax
140012ea5:     	movq	%rax, 0x28(%rbp)
140012ea9:     	movups	0x48(%rdx), %xmm0
140012ead:     	movups	%xmm0, 0x18(%rbp)
140012eb1:     	movl	0x166(%rdx), %eax
140012eb7:     	movl	%eax, 0x136(%rbp)
140012ebd:     	movzwl	0x16a(%rdx), %eax
140012ec4:     	movw	%ax, 0x13a(%rbp)
140012ecb:     	movl	0x16c(%rdx), %eax
140012ed1:     	movl	%eax, 0x13c(%rbp)
140012ed7:     	movzwl	0x170(%rdx), %eax
140012ede:     	movw	%ax, 0x140(%rbp)
140012ee5:     	movups	0x5d5c07c(%rip), %xmm0  # 0x145d6ef68
140012eec:     	movaps	%xmm0, 0x180(%rbp)
140012ef3:     	movl	$0x3f800000, 0x190(%rbp) # imm = 0x3F800000
140012efd:     	movups	%xmm0, 0x194(%rbp)
140012f04:     	movl	$0x3f800000, 0x1a4(%rbp) # imm = 0x3F800000
140012f0e:     	movups	%xmm0, 0x1a8(%rbp)
140012f15:     	movl	$0x3f800000, 0x1b8(%rbp) # imm = 0x3F800000
140012f1f:     	movups	%xmm0, 0x1bc(%rbp)
140012f26:     	movl	$0x3f800000, 0x1cc(%rbp) # imm = 0x3F800000
140012f30:     	callq	0x140002200 <.text+0x1200>
140012f35:     	movl	$0x40, %ecx
140012f3a:     	movl	$0x4, %edx
140012f3f:     	callq	0x1400021c0 <.text+0x11c0>
140012f44:     	testq	%rax, %rax
140012f47:     	je	0x140013188 <.text+0x12188>
140012f4d:     	movq	%rax, 0x210(%rbp)
140012f54:     	movaps	0x5d5a355(%rip), %xmm0  # 0x145d6d2b0
140012f5b:     	movups	%xmm0, 0x1f4(%rbp)
140012f62:     	movl	$0x0, 0x1f0(%rbp)
140012f6c:     	leaq	0x1d0(%rbp), %rcx
140012f73:     	leaq	0x1f0(%rbp), %rdx
140012f7a:     	callq	0x144c67100 <.text+0x4c66100>
140012f7f:     	nop
140012f80:     	movaps	0x1d0(%rbp), %xmm6
140012f87:     	movaps	0x5d5a332(%rip), %xmm0  # 0x145d6d2c0
140012f8e:     	movups	%xmm0, 0x1f4(%rbp)
140012f95:     	movl	$0x0, 0x1f0(%rbp)
140012f9f:     	leaq	0x1d0(%rbp), %rcx
140012fa6:     	leaq	0x1f0(%rbp), %rdx
140012fad:     	callq	0x144c67100 <.text+0x4c66100>
140012fb2:     	nop
140012fb3:     	movaps	0x1d0(%rbp), %xmm0
140012fba:     	movq	0x210(%rbp), %rdi
140012fc1:     	movl	$0x0, (%rdi)
140012fc7:     	movl	$0x1, 0x8(%rdi)
140012fce:     	movups	%xmm6, 0xc(%rdi)
140012fd2:     	movq	$0x3f000000, 0x1c(%rdi) # imm = 0x3F000000
140012fda:     	movl	$0x1, 0x28(%rdi)
140012fe1:     	movups	%xmm0, 0x2c(%rdi)
140012fe5:     	movl	$0x3f000000, 0x3c(%rdi) # imm = 0x3F000000
140012fec:     	callq	0x140002200 <.text+0x1200>
140012ff1:     	movl	$0x48, %ecx
140012ff6:     	movl	$0x8, %edx
140012ffb:     	callq	0x1400021c0 <.text+0x11c0>
140013000:     	testq	%rax, %rax
140013003:     	je	0x14001319a <.text+0x1219a>
140013009:     	movq	$0x2, 0x8(%rax)
140013011:     	movq	%rdi, 0x10(%rax)
140013015:     	movq	$0x2, 0x18(%rax)
14001301d:     	movl	$0x40490fdb, 0x20(%rax) # imm = 0x40490FDB
140013024:     	movb	$0x0, 0x24(%rax)
140013028:     	movabsq	$-0x8000000000000000, %rcx # imm = 0x8000000000000000
140013032:     	movq	%rcx, (%rax)
140013035:     	movq	$0x1, 0x1d0(%rbp)
140013040:     	movq	%rax, 0x1d8(%rbp)
140013047:     	movq	$0x1, 0x1e0(%rbp)
140013052:     	movaps	0x5d5a277(%rip), %xmm0  # 0x145d6d2d0
140013059:     	movups	%xmm0, 0x170(%rbp)
140013060:     	movl	$0x0, 0x16c(%rbp)
14001306a:     	leaq	0x1f0(%rbp), %rcx
140013071:     	leaq	0x16c(%rbp), %rdx
140013078:     	callq	0x144c67100 <.text+0x4c66100>
14001307d:     	nop
14001307e:     	movaps	0x1f0(%rbp), %xmm0
140013085:     	movups	%xmm0, 0x15c(%rbp)
14001308c:     	movl	$0x1, 0x158(%rbp)
140013096:     	movl	$0x42200000, 0x48(%rsp) # imm = 0x42200000
14001309e:     	movl	$0x1, 0x40(%rsp)
1400130a6:     	movl	$0x0, 0x38(%rsp)
1400130ae:     	movl	$0x1, 0x30(%rsp)
1400130b6:     	movl	$0x41600000, 0x28(%rsp) # imm = 0x41600000
1400130be:     	movl	$0x1, 0x20(%rsp)
1400130c6:     	leaq	0x1f0(%rbp), %rcx
1400130cd:     	leaq	0x158(%rbp), %rdx
1400130d4:     	xorps	%xmm3, %xmm3
1400130d7:     	movl	$0x1, %r8d
1400130dd:     	callq	0x142633750 <.text+0x2632750>
1400130e2:     	nop
1400130e3:     	leaq	-0x30(%rbp), %rdx
1400130e7:     	movl	$0x180, %r8d            # imm = 0x180
1400130ed:     	movq	%rsi, %rcx
1400130f0:     	callq	0x145bc977b <.text+0x5bc877b>
1400130f5:     	movaps	0x1c0(%rbp), %xmm0
1400130fc:     	movups	%xmm0, 0x1d8(%rsi)
140013103:     	movaps	0x180(%rbp), %xmm0
14001310a:     	movaps	0x190(%rbp), %xmm1
140013111:     	movaps	0x1a0(%rbp), %xmm2
140013118:     	movaps	0x1b0(%rbp), %xmm3
14001311f:     	movups	%xmm3, 0x1c8(%rsi)
140013126:     	movups	%xmm2, 0x1b8(%rsi)
14001312d:     	movups	%xmm1, 0x1a8(%rsi)
140013134:     	movups	%xmm0, 0x198(%rsi)
14001313b:     	movups	0x1d0(%rbp), %xmm0
140013142:     	movups	%xmm0, 0x180(%rsi)
140013149:     	movq	0x1e0(%rbp), %rax
140013150:     	movq	%rax, 0x190(%rsi)
140013157:     	movups	0x1f0(%rbp), %xmm0
14001315e:     	movups	%xmm0, 0x1e8(%rsi)
140013165:     	movq	0x200(%rbp), %rax
14001316c:     	movq	%rax, 0x1f8(%rsi)
140013173:     	movq	%rsi, %rax
140013176:     	movaps	0x220(%rbp), %xmm6
14001317d:     	addq	$0x2b0, %rsp            # imm = 0x2B0
140013184:     	popq	%rdi
140013185:     	popq	%rsi
140013186:     	popq	%rbp
140013187:     	retq
140013188:     	movl	$0x4, %ecx
14001318d:     	movl	$0x40, %edx
140013192:     	callq	0x145d69431 <.text+0x5d68431>
140013197:     	nop
140013198:     	jmp	0x1400131aa <.text+0x121aa>
14001319a:     	movl	$0x8, %ecx
14001319f:     	movl	$0x48, %edx
1400131a4:     	callq	0x145d69431 <.text+0x5d68431>
1400131a9:     	nop
1400131aa:     	ud2
